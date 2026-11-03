package app.tikkamasalla.stremio.tuning;

import android.app.Activity;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.KeyEvent;
import android.view.Window;

import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.MediaItem;
import androidx.media3.common.Player;
import androidx.media3.common.TrackGroup;
import androidx.media3.common.TrackSelectionOverride;
import androidx.media3.common.TrackSelectionParameters;
import androidx.media3.common.Tracks;
import androidx.media3.common.util.Util;

import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.tikkamasalla.stremio.diag.PlaybackDiary;
import app.tikkamasalla.stremio.introskip.Media3Listeners;
import app.tikkamasalla.stremio.introskip.TrackMemory;
import app.tikkamasalla.stremio.subs.SdhLabels;
import app.tikkamasalla.stremio.subs.SdhPrefs;

/**
 * Holds stock's subtitle-driven media-item replacement unless it would change the subtitle on screen
 * (see SubtitleGateCore): before the first frame stock's call goes through, after it LateSubs draws the
 * subtitle with no replacement. The subtitle dialog lists what is held beside the real tracks, and a pick
 * of a held one is drawn too; if it cannot, the dialog applies what is held and shows the list once its
 * tracks are known, at most 1.5 s later. Only Stremio's ExoPlayer wrapper is gated. Every failure falls
 * back to the stock call; playWhenReady is never touched.
 */
public final class SubtitleGate {
    private static final String TAG = "SubtitleGate";
    private static final long DIALOG_WAIT_MS = 1500L;
    /** ROLE_FLAG_CAPTION | ROLE_FLAG_DESCRIBES_MUSIC_AND_SOUND: the selector prefers a track without them. */
    private static final int CAPTION_ROLES = 1088;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Object, Session> SESSIONS =
            Collections.synchronizedMap(new WeakHashMap<Object, Session>());

    /** A value of the weak-keyed map, so only a pending dialog (1.5 s at most) may hold the player strongly. */
    private static final class Session {
        final SubtitleGateCore.State state = new SubtitleGateCore.State();
        final WeakReference<Object> fragment;
        Object dialog;
        Runnable dialogTimeout;
        /** Puts back the window callback that watched for Back while the dialog waited. */
        Runnable unwatch;
        /** The dialog rows made for held subtitles: stock's pick arrives as an override of one of these. */
        final List<TrackGroup> heldRows = new ArrayList<TrackGroup>();

        Session(Object fragment) {
            this.fragment = new WeakReference<Object>(fragment);
        }
    }

    private SubtitleGate() {
    }

    /** Hook right after startStreamPlayback stores the player, before it is prepared. */
    public static void bind(Object fragment, Object playerObj) {
        try {
            if (fragment == null || playerObj == null
                    || !"com.stremio.common.players.ExoPlayer".equals(playerObj.getClass().getName())) return;
            final Player player = (Player) playerObj;
            final Session session = new Session(fragment);
            player.addListener(Media3Listeners.create(new Media3Listeners.Sink() {
                @Override
                public void onEvent(String name, Object[] args) {
                    if ("onRenderedFirstFrame".equals(name)) {
                        session.state.firstFrame = true;
                    } else if ("onPlaybackStateChanged".equals(name) && args.length == 1
                            && Integer.valueOf(Player.STATE_IDLE).equals(args[0])) {
                        session.state.firstFrame = false; // stopped: the next start hides a re-open again
                        LateSubs.stop(player, "idle");
                    } else if ("onTrackSelectionParametersChanged".equals(name) && args.length == 1
                            && args[0] instanceof TrackSelectionParameters) {
                        onParameters(player, session, (TrackSelectionParameters) args[0]);
                    } else if ("onTracksChanged".equals(name) && args.length == 1 && args[0] instanceof Tracks) {
                        onTracks(player, session, (Tracks) args[0]);
                    }
                }
            }));
            SESSIONS.put(player, session);
        } catch (Throwable t) {
            Log.w(TAG, "bind failed: " + t);
        }
    }

    /** Replacement for the subtitle branch's setMediaItem(item, resetPosition) call. */
    public static void applySubtitles(Object playerObj, Object itemObj, boolean resetPosition) {
        Player player = (Player) playerObj;
        MediaItem item = (MediaItem) itemObj;
        try {
            Session s = SESSIONS.get(player);
            if (s != null && !resetPosition) {
                s.state.sync(mediaKey(player));
                if (s.state.holdsSame(subsOf(item), item)) return;
                SubtitleGateCore.In in = input(player, s, item);
                String why = s.state.offer(in, item);
                if (why == null) {
                    logEvent("sub.held", null, item);
                    redraw(player, s, item, in);
                    return;
                }
                if (draw(player, s, item, why, in)) return;
                logEvent("sub.apply", why, item);
            }
        } catch (Throwable t) {
            Log.w(TAG, "gate failed: " + t);
        }
        LateSubs.stop(player, "replaced");
        player.setMediaItem(item, resetPosition);
    }

    /** After the first frame: the subtitle is drawn with no replacement and the item stays held. False: stock's way. */
    private static boolean draw(Player player, Session s, MediaItem item, String why, SubtitleGateCore.In in) {
        try {
            if (!SubtitleGateCore.drawable(why)) return false;
            List<SubtitleGateCore.Sub> order = SubtitleGateCore.candidates(why, in);
            LateSubs.draw(player, field(s.fragment.get(), "subtitleView"), item, order);
            s.state.drawInstead(item, in.newSubs, why, order.get(0).id);
            logEvent("sub.late", why, item);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "late draw refused: " + t);
            return false;
        }
    }

    /** A later batch can hold something better than what is drawn; no reason fires, the player's selection never changed. */
    private static void redraw(Player player, Session s, MediaItem item, SubtitleGateCore.In in) {
        if (s.state.drawnWhy == null) return;
        List<SubtitleGateCore.Sub> order = SubtitleGateCore.candidates(s.state.drawnWhy, in);
        if (!order.isEmpty() && SubtitleGateCore.improves(in, s.state.drawnId, order.get(0))) {
            draw(player, s, item, s.state.drawnWhy, in);
        }
    }

    /** Adds the held subtitles to the dialog's list, as stock would list them after a replacement. False: not possible. */
    @SuppressWarnings("unchecked")
    private static boolean listHeld(Object dialog, Player player, Session s) {
        try {
            MediaItem item = (MediaItem) s.state.held();
            Field infos = dialog.getClass().getDeclaredField("trackInfos");
            infos.setAccessible(true);
            Constructor<?> row = Class.forName(dialog.getClass().getName() + "$TrackInfo")
                    .getDeclaredConstructor(Tracks.Group.class, int.class);
            row.setAccessible(true);
            boolean drawing = LateSubs.drawing(player);
            List<Object> rows = new ArrayList<Object>();
            for (Object info : (List<Object>) infos.get(dialog)) {
                // What is drawn is what shows: a real track selected underneath is not marked.
                rows.add(drawing ? unmarked(row, info) : info);
            }
            List<String> real = new ArrayList<String>();
            for (SubtitleGateCore.Sub c : subsOf(player.getCurrentMediaItem())) real.add(c.id);
            s.heldRows.clear();
            for (MediaItem.SubtitleConfiguration c : item.localConfiguration.subtitleConfigurations) {
                if (real.contains(c.id)) continue;
                TrackGroup group = new TrackGroup(new Format.Builder().setId(c.id).setSampleMimeType(c.mimeType)
                        .setLanguage(c.language).setLabel(c.label).build());
                boolean on = drawing && c.id != null && c.id.equals(s.state.drawnId);
                rows.add(row.newInstance(new Tracks.Group(group, false, new int[]{C.FORMAT_HANDLED}, new boolean[]{on}), 0));
                s.heldRows.add(group);
            }
            infos.set(dialog, rows);
            return true;
        } catch (Throwable t) {
            Log.w(TAG, "dialog list failed: " + t.getClass().getSimpleName());
            return false;
        }
    }

    private static Object unmarked(Constructor<?> row, Object info) throws Exception {
        Tracks.Group g = (Tracks.Group) call(info, "getGroup");
        int[] support = new int[g.length];
        for (int i = 0; i < g.length; i++) support[i] = g.getTrackSupport(i);
        return row.newInstance(new Tracks.Group(g.getMediaTrackGroup(), g.isAdaptiveSupported(), support, new boolean[g.length]),
                call(info, "getIndex"));
    }

    /** A pick of a held row comes as an override the player cannot use: it is drawn instead. None or a real track end the drawing. */
    private static void onParameters(final Player player, final Session s, TrackSelectionParameters params) {
        for (TrackSelectionOverride o : params.overrides.values()) {
            if (s.heldRows.contains(o.mediaTrackGroup)) {
                final TrackGroup group = o.mediaTrackGroup;
                MAIN.post(new Runnable() { // stock's dialog code is still running
                    @Override
                    public void run() {
                        drawPick(player, s, group);
                    }
                });
                return;
            }
        }
        if (decidesText(params)) {
            LateSubs.stop(player, "selection");
            s.state.undrawn();
        }
    }

    private static void drawPick(Player player, Session s, TrackGroup group) {
        try {
            player.setTrackSelectionParameters(player.getTrackSelectionParameters().buildUpon().clearOverride(group).build());
            s.state.sync(mediaKey(player));
            MediaItem item = (MediaItem) s.state.held();
            if (item == null || player.getPlaybackState() == Player.STATE_IDLE) return;
            String id = group.getFormat(0).id;
            List<SubtitleGateCore.Sub> order = SubtitleGateCore.candidates("pick:" + id, input(player, s, item));
            LateSubs.draw(player, field(s.fragment.get(), "subtitleView"), item, order.subList(0, 1));
            s.state.picked(id);
            logEvent("sub.late", "pick:", item);
        } catch (Throwable t) {
            Log.w(TAG, "late pick failed: " + t.getClass().getSimpleName());
        }
    }

    /** The viewer (or the saved state) chose off or one track: what is drawn yields to that. */
    private static boolean decidesText(TrackSelectionParameters params) {
        if (params.disabledTrackTypes.contains(C.TRACK_TYPE_TEXT)) return true;
        for (TrackSelectionOverride o : params.overrides.values()) {
            if (o.getType() == C.TRACK_TYPE_TEXT) return true;
        }
        return false;
    }

    /** Replacement for TrackSelectionDialog.show(). The dialog captured its list when built, so a new one replaces it. */
    public static void showTrackDialog(Object dialog) {
        try {
            final Player player = (Player) field(dialog, "player");
            final Session s = SESSIONS.get(player);
            if (s != null && (Integer) field(dialog, "trackType") == C.TRACK_TYPE_TEXT) {
                s.state.sync(mediaKey(player));
                if (!s.state.awaitingTracks && s.state.held() != null && listHeld(dialog, player, s)) {
                    show(dialog);
                    return;
                }
                Object held = s.state.takeHeld();
                if (held != null) open(player, s, (MediaItem) held);
                if (s.state.awaitingTracks) {
                    if (s.dialogTimeout != null) MAIN.removeCallbacks(s.dialogTimeout);
                    s.dialog = dialog;
                    s.state.dialogWaits(mediaKey(player));
                    watchBack(s);
                    s.dialogTimeout = new Runnable() {
                        @Override
                        public void run() {
                            showPending(player, s);
                        }
                    };
                    MAIN.postDelayed(s.dialogTimeout, DIALOG_WAIT_MS);
                    return;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "dialog gate failed: " + t);
        }
        show(dialog);
    }

    private static void onTracks(final Player player, final Session s, Tracks tracks) {
        if (tracks.getGroups().isEmpty()) return; // a re-open is masking them
        s.state.sync(mediaKey(player));
        s.state.awaitingTracks = false;
        keepSelections(player, s, tracks);
        if (s.state.held() != null) {
            final Object again = s.state.rejudge(input(player, s, (MediaItem) s.state.held()));
            if (again != null && !draw(player, s, (MediaItem) again, s.state.lastWhy, input(player, s, (MediaItem) again))) {
                // Not from inside the listener dispatch; a waiting dialog waits for this re-open's tracks.
                MAIN.post(new Runnable() {
                    @Override
                    public void run() {
                        open(player, s, (MediaItem) again);
                    }
                });
                return;
            }
        }
        showPending(player, s);
    }

    private static void open(Player player, Session s, MediaItem item) {
        try {
            logEvent("sub.apply", s.state.lastWhy, item);
            LateSubs.stop(player, "replaced");
            player.setMediaItem(item, false);
        } catch (Throwable t) {
            Log.w(TAG, "apply failed: " + t);
        }
    }

    private static void showPending(Player player, Session s) {
        Object dialog = s.dialog;
        if (dialog == null) return;
        boolean due = s.state.dialogDue(mediaKey(player));
        cancelPending(s);
        Object fragment = s.fragment.get();
        // Back, another episode or a left screen meanwhile: the viewer no longer asked for it.
        if (!due || fragment == null || Boolean.FALSE.equals(call(fragment, "isResumed"))) return;
        boolean known = !player.getCurrentTracks().getGroups().isEmpty();
        Log.i(TAG, "subtitle dialog shown, tracks known=" + known);
        Object fresh = known ? rebuilt(dialog) : null;
        show(fresh != null ? fresh : dialog);
    }

    /** Drops the waiting dialog: it is not shown later. Safe to call twice. */
    private static void cancelPending(Session s) {
        s.state.dialogCancel();
        s.dialog = null;
        if (s.dialogTimeout != null) MAIN.removeCallbacks(s.dialogTimeout);
        s.dialogTimeout = null;
        if (s.unwatch != null) s.unwatch.run();
        s.unwatch = null;
    }

    /** Sees Back on the activity's window while the dialog waits (at most 1.5 s) and passes every key on untouched. */
    private static void watchBack(final Session s) {
        try {
            Object activity = call(s.fragment.get(), "getActivity");
            if (!(activity instanceof Activity) || s.unwatch != null) return;
            final Window window = ((Activity) activity).getWindow();
            final Window.Callback original = window.getCallback();
            final Window.Callback watcher = (Window.Callback) Proxy.newProxyInstance(Window.Callback.class.getClassLoader(),
                    new Class<?>[]{Window.Callback.class}, new InvocationHandler() {
                        @Override
                        public Object invoke(Object proxy, Method method, Object[] args) throws Throwable {
                            if ("dispatchKeyEvent".equals(method.getName()) && args != null && args.length == 1
                                    && args[0] instanceof KeyEvent && ((KeyEvent) args[0]).getKeyCode() == KeyEvent.KEYCODE_BACK
                                    && ((KeyEvent) args[0]).getAction() == KeyEvent.ACTION_DOWN) {
                                cancelPending(s);
                            }
                            try {
                                return method.invoke(original, args);
                            } catch (InvocationTargetException e) {
                                throw e.getCause();
                            }
                        }
                    });
            window.setCallback(watcher);
            s.unwatch = new Runnable() {
                @Override
                public void run() {
                    if (window.getCallback() == watcher) window.setCallback(original);
                }
            };
        } catch (Throwable t) {
            Log.w(TAG, "back watch failed: " + t);
        }
    }

    /** SdhAvoid: is this track the viewer's saved choice? Then automatic SDH avoidance leaves it alone. */
    public static boolean isSavedChoice(Object playerObj, Format f) {
        try {
            Session s = SESSIONS.get(playerObj);
            if (s == null || f == null) return false;
            SubtitleGateCore.In in = input((Player) playerObj, s, null);
            return SubtitleGateCore.isSaved(in.pickId, in.memLabel, in.memLang, f.id, f.label,
                    Util.normalizeLanguageCode(f.language));
        } catch (Throwable t) {
            return false;
        }
    }

    private static Object rebuilt(Object dialog) {
        try {
            for (Constructor<?> c : dialog.getClass().getConstructors()) {
                if (c.getParameterTypes().length == 6) {
                    return c.newInstance(field(dialog, "context"), field(dialog, "title"), field(dialog, "player"),
                            field(dialog, "trackType"), field(dialog, "includeDisabled"), field(dialog, "viewModel"));
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "dialog rebuild failed: " + t);
        }
        return null;
    }

    private static void show(Object dialog) {
        try {
            dialog.getClass().getMethod("show").invoke(dialog);
        } catch (Throwable t) {
            Log.w(TAG, "dialog show failed: " + t);
        }
    }

    /**
     * Track ids change their period prefix when an item gains subtitles. Stock's overrides then stop
     * matching, and its saved-pick compare only matches the prefix of the session that saved it, so it
     * used to need a re-open to land. Both are restored here by id without the prefix, with no re-open.
     */
    private static void keepSelections(Player player, Session s, Tracks tracks) {
        TrackSelectionParameters params = player.getTrackSelectionParameters();
        TrackSelectionParameters.Builder b = params.buildUpon();
        boolean changed = false;
        for (TrackSelectionOverride o : params.overrides.values()) {
            if (o.trackIndices.isEmpty()) continue;
            Format old = o.mediaTrackGroup.getFormat(o.trackIndices.get(0));
            TrackSelectionOverride now = find(tracks, o.getType(), old.id, old.language);
            if (now == null || now.mediaTrackGroup.equals(o.mediaTrackGroup)) continue;
            b.clearOverride(o.mediaTrackGroup).addOverride(now);
            changed = true;
        }
        Object saved = call(playerState(s.fragment.get()), "getStreamState");
        String target = s.state.target;
        s.state.target = null;
        changed |= restore(tracks, params, b, C.TRACK_TYPE_TEXT, call(saved, "getSubtitleTrack"), target);
        changed |= restore(tracks, params, b, C.TRACK_TYPE_AUDIO, call(saved, "getAudioTrack"), null);
        if (changed) {
            Log.i(TAG, "selections kept across the period prefix");
            player.setTrackSelectionParameters(b.build());
        }
    }

    private static boolean restore(Tracks tracks, TrackSelectionParameters params, TrackSelectionParameters.Builder b,
                                   int type, Object saved, String target) {
        for (TrackSelectionOverride o : params.overrides.values()) {
            if (o.getType() == type) return false;
        }
        if (params.disabledTrackTypes.contains(type)) return false;
        Object id = call(saved, "getId");
        Object lang = call(saved, "getLanguage");
        TrackSelectionOverride now = target != null ? find(tracks, type, target, null)
                : id == null || "".equals(id) ? null : find(tracks, type, String.valueOf(id), lang == null ? "" : String.valueOf(lang));
        if (now != null) b.addOverride(now);
        return now != null;
    }

    /** The track of this type with this id apart from the period prefix; lang: null matches any. */
    private static TrackSelectionOverride find(Tracks tracks, int type, String id, String lang) {
        String want = SubtitleGateCore.stripPeriod(id);
        for (Tracks.Group g : tracks.getGroups()) {
            for (int i = 0; want.length() > 0 && g.getType() == type && i < g.length; i++) {
                Format f = g.getTrackFormat(i);
                if (want.equals(SubtitleGateCore.stripPeriod(f.id))
                        && (lang == null || lang.equals(f.language == null ? "" : f.language))) {
                    return new TrackSelectionOverride(g.getMediaTrackGroup(), i);
                }
            }
        }
        return null;
    }

    private static SubtitleGateCore.In input(Player player, Session s, MediaItem item) {
        SubtitleGateCore.In in = new SubtitleGateCore.In();
        in.newSubs = subsOf(item);
        for (SubtitleGateCore.Sub c : subsOf(player.getCurrentMediaItem())) in.curIds.add(c.id);
        TrackSelectionParameters params = player.getTrackSelectionParameters();
        in.textDisabled = params.disabledTrackTypes.contains(C.TRACK_TYPE_TEXT);
        for (TrackSelectionOverride o : params.overrides.values()) {
            if (o.getType() == C.TRACK_TYPE_TEXT) in.textOverride = true;
        }
        in.preferred.addAll(params.preferredTextLanguages);
        Object fragment = s.fragment.get();
        in.avoidSdh = SdhPrefs.isAvoidEnabled((Context) call(fragment, "getContext"));
        Tracks tracks = player.getCurrentTracks();
        in.tracksKnown = !tracks.getGroups().isEmpty();
        for (Tracks.Group g : tracks.getGroups()) {
            for (int i = 0; g.getType() == C.TRACK_TYPE_TEXT && i < g.length; i++) {
                if (g.isTrackSelected(i)) readSelected(g.getTrackFormat(i), (Context) call(fragment, "getContext"), in);
            }
        }
        Object state = playerState(fragment);
        Object pick = call(call(call(state, "getStreamState"), "getSubtitleTrack"), "getId");
        in.pickId = state == null ? null : pick == null ? "" : String.valueOf(pick);
        Object show = call(call(state, "getMetaItem"), "getId");
        TrackMemory.Entry memory = show == null ? null : TrackMemory.load((Context) null, String.valueOf(show));
        if (memory != null && memory.subOff) {
            in.textDisabled = true;
        } else if (memory != null && memory.subLang.length() > 0) {
            // As preSelect makes it, the remembered language is the first preferred one.
            in.memLang = Util.normalizeLanguageCode(memory.subLang);
            in.memLabel = memory.subLabel;
            if (!in.preferred.contains(in.memLang)) in.preferred.add(0, in.memLang);
        }
        return in;
    }

    private static void readSelected(Format f, Context context, SubtitleGateCore.In in) {
        boolean captions = (f.roleFlags & CAPTION_ROLES) != 0;
        in.textSelected = true;
        in.selLang = f.language == null ? "" : f.language;
        in.selLabel = f.label == null ? "" : f.label;
        in.selKind = captions ? SdhLabels.KIND_SDH : SdhLabels.kindOf(f.label, f.language, f.roleFlags, f.selectionFlags);
        in.selBitmap = SdhLabels.isBitmapMime(f.sampleMimeType);
        in.rankable = captions || (f.selectionFlags & C.SELECTION_FLAG_FORCED) != 0
                || ("en".equals(SdhLabels.normLang(f.language)) && SdhPrefs.isAvoidEnabled(context));
    }

    private static List<SubtitleGateCore.Sub> subsOf(MediaItem item) {
        List<SubtitleGateCore.Sub> out = new ArrayList<SubtitleGateCore.Sub>();
        if (item == null || item.localConfiguration == null) return out;
        for (MediaItem.SubtitleConfiguration c : item.localConfiguration.subtitleConfigurations) {
            out.add(new SubtitleGateCore.Sub(c.id, Util.normalizeLanguageCode(c.language), c.label == null ? "" : c.label,
                    SdhLabels.kindOf(c.label, c.language, c.roleFlags, c.selectionFlags)));
        }
        return out;
    }

    private static String mediaKey(Player player) {
        MediaItem item = player.getCurrentMediaItem();
        return item == null || item.localConfiguration == null ? "" : String.valueOf(item.localConfiguration.uri);
    }

    private static void logEvent(String event, String why, MediaItem item) {
        StringBuilder langs = new StringBuilder();
        List<SubtitleGateCore.Sub> subs = subsOf(item);
        for (SubtitleGateCore.Sub c : subs) langs.append(c.lang).append(' ');
        // A reason can name a subtitle URL: only its kind goes in the log.
        String kind = why == null ? "" : why.split(":", 2)[0];
        Log.i(TAG, event + " why=" + kind + " n=" + subs.size() + " langs=" + langs.toString().trim());
        PlaybackDiary.ev(event, "why", kind, "n", subs.size(), "langs", langs.toString().trim());
    }

    /** PlayerState of the fragment (getViewModel is private in the app), or null when it cannot be read. */
    private static Object playerState(Object fragment) {
        try {
            Method getViewModel = fragment.getClass().getDeclaredMethod("getViewModel");
            getViewModel.setAccessible(true);
            return call(call(getViewModel.invoke(fragment), "getState"), "getValue");
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object call(Object target, String method) {
        try {
            return target == null ? null : target.getClass().getMethod(method).invoke(target);
        } catch (Throwable t) {
            return null;
        }
    }

    private static Object field(Object holder, String name) throws Exception {
        Field field = holder.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return field.get(holder);
    }
}
