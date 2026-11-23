package nl.johninnl.deezer.queue;

import android.support.v4.media.session.MediaSessionCompat;
import android.support.v4.media.session.PlaybackStateCompat;
import java.util.ArrayList;
import java.util.List;

/** The only raw/native-ID to exported/opaque-ID boundary. */
public final class QueueSession {
    private QueueHandles handles;
    private MediaSessionCompat session;
    private PlaybackStateCompat rawState;
    private boolean transition;
    private boolean reconciling;
    private QueueSource pendingQueue;
    public QueueSession(NativeQueue owner, MediaSessionCompat session) {
        this.handles = new QueueHandles(owner); this.session = session;
    }
    public synchronized PlaybackStateCompat state(PlaybackStateCompat raw) {
        rawState = raw;
        if (raw == null || handles == null) return raw;
        boolean ready;
        long active;
        try {
            // The source and playback cursors load independently. A queue may arrive
            // before the authoritative playback cursor. Retry that same captured
            // source when state advances; never relabel a stale source as current.
            if (!transition && !reconciling && pendingQueue != null && pendingQueue.current() && !handles.mapped()) {
                reconciling = true;
                try { publish(pendingQueue); } finally { reconciling = false; }
            }
            ready = !transition && handles.ready();
            active = transition ? -1 : handles.active(raw.getActiveQueueItemId());
        }
        catch (RuntimeException failure) { ready = false; active = -1; report("state validation failed: " + failure.getClass().getSimpleName()); }
        return new PlaybackStateCompat.Builder(raw)
            .setActions((standardActions(raw.getActions()) & ~4096L) | (ready ? 4096L : 0L))
            .setActiveQueueItemId(active).build();
    }
    static long standardActions(long nativeActions) {
        return nativeActions | PlaybackStateCompat.ACTION_PLAY | PlaybackStateCompat.ACTION_PAUSE |
            PlaybackStateCompat.ACTION_STOP | PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID |
            PlaybackStateCompat.ACTION_PLAY_FROM_SEARCH;
    }
    public synchronized void publish(List<?> raw) {
        if (session == null || handles == null) return;
        pendingQueue = raw instanceof QueueSource ? (QueueSource) raw : null;
        transition = true;
        handles.invalidate();
        @SuppressWarnings("unchecked")
        List<MediaSessionCompat.QueueItem> output = (List<MediaSessionCompat.QueueItem>) raw;
        try {
            if (rawState != null) session.setPlaybackState(state(rawState));
            try {
                QueueSource source = raw instanceof QueueSource ? (QueueSource) raw : null;
                List<Long> positions = new ArrayList<>();
                if (source == null) report("publication: mapper did not carry source identity");
                if (source != null) for (Object value : raw) positions.add(((MediaSessionCompat.QueueItem) value).getQueueId());
                boolean current = source != null && source.current();
                if (source != null && !current) report("publication: captured source is stale");
                List<Long> ids = !current ? null : handles.replace(source.source, source.occurrences, positions, source.version, source.mutation);
                if (ids != null) {
                    List<MediaSessionCompat.QueueItem> mapped = new ArrayList<>();
                    for (int i = 0; i < raw.size(); i++) {
                        MediaSessionCompat.QueueItem item = (MediaSessionCompat.QueueItem) raw.get(i);
                        mapped.add(new MediaSessionCompat.QueueItem(item.getDescription(), ids.get(i)));
                    }
                    output = mapped;
                }
            } catch (RuntimeException failure) {
                handles.invalidate(); report("publication failed: " + failure.getClass().getSimpleName());
            }
            try { session.setQueue(output); }
            catch (RuntimeException failure) { handles.invalidate(); throw failure; }
        } finally {
            transition = false;
            if (rawState != null) {
                boolean prior = reconciling;
                reconciling = true;
                try { session.setPlaybackState(state(rawState)); }
                finally { reconciling = prior; }
            }
        }
    }
    private String lastReport;
    private void report(String message) {
        if (message.equals(lastReport)) return;
        lastReport = message;
        try { android.util.Log.w("DeezerQueue", message); } catch (RuntimeException unavailable) { }
    }
    public void select(long id) {
        QueueHandles current;
        synchronized (this) { current = handles; if (transition) return; }
        if (current != null) current.select(id);
    }
    /** Shell service dump: freshness/eligibility only, never media/account values. */
    public synchronized void dump(java.io.PrintWriter output) {
        output.println("Morphe Deezer queue:");
        output.println(handles==null?"retired":handles.describe());
        output.println(QueueMutation.describe());
        output.println("pending="+(pendingQueue!=null)+" current="+(pendingQueue!=null&&pendingQueue.current())+
            " mutation="+(pendingQueue==null?-1:pendingQueue.mutation)+" sourceEpoch="+(pendingQueue==null?-1:pendingQueue.version));
        output.println("state="+lastReport);
        try{
            Class<?> user=Class.forName("IIIllllIllIIIllI");
            output.println("sessionSave="+user.getField("morpheSessionSaveSummary").get(null));
            Object trace=user.getField("morpheSessionLogoutTrace").get(null);
            if(trace!=null){output.println("last logged-out caller in this process:");output.println(trace);}
        }catch(ReflectiveOperationException unavailable){output.println("session trace unavailable");}
    }
    public synchronized void retire() {
        if (handles != null) handles.retire();
        handles = null; session = null; rawState = null; pendingQueue = null;
    }
}
