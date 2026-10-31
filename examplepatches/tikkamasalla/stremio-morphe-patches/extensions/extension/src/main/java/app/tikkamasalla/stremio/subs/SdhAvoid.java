package app.tikkamasalla.stremio.subs;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;

import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.MediaItem;
import androidx.media3.common.Player;
import androidx.media3.common.TrackGroup;
import androidx.media3.common.TrackSelectionOverride;
import androidx.media3.common.Tracks;
import androidx.media3.common.text.Cue;
import androidx.media3.common.text.CueGroup;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Runtime bridge that keeps hearing-impaired subtitles off the screen.
 * Three layers: metadata ranking, content check, cue cleaner.
 * Everything is fail-soft: any problem leaves Stremio's own behaviour in place.
 */
public final class SdhAvoid {
    private static final String TAG = "SdhAvoid";
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Map<Activity, TrackSession> SESSIONS = new WeakHashMap<Activity, TrackSession>();
    private static final Map<String, Boolean> URL_VERDICTS =
            new ConcurrentHashMap<String, Boolean>();
    private static final ExecutorService NET = Executors.newCachedThreadPool();
    private static final Set<String> INFLIGHT = new HashSet<String>();
    private static volatile Context lastApp;
    /** True while the selected subtitle track is English; the cleaner leaves other languages alone. */
    private static volatile boolean activeEnglish;
    private static final long USER_GRACE_MS = 15000L;
    private static final int SAMPLE_CUES = 40;
    private static final int MAX_SWITCHES_PER_MEDIA = 4;

    private SdhAvoid() {
    }

    public static void onPlayerSet(final View playerView, final Player player) {
        if (playerView == null || player == null) return;
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                try {
                    Activity activity = activityOf(playerView.getContext());
                    if (activity == null || activity.isFinishing()) return;
                    try {
                        lastApp = activity.getApplicationContext();
                    } catch (Throwable ignored) {
                        // Prefs fall back to defaults.
                    }
                    TrackSession session = SESSIONS.get(activity);
                    if (session == null || session.closed) {
                        session = new TrackSession(activity);
                        SESSIONS.put(activity, session);
                    }
                    session.offer(player);
                } catch (Throwable error) {
                    Log.w(TAG, "hook failed", error);
                }
            }
        });
    }

    /**
     * Smali hook target for SubtitleView.setCues(List): rewrites each cue with
     * the cleaner when enabled, drops cues that become empty. Same list
     * reference back when nothing changed, original list on any failure.
     */
    public static List cleanCues(List cues) {
        try {
            if (cues == null || cues.isEmpty()) return cues;
            Context app = lastApp;
            if (app == null || !activeEnglish || !SdhPrefs.isCleanEnabled(app)) return cues;
            List<Object> out = new ArrayList<Object>(cues.size());
            boolean changed = false;
            for (Object item : cues) {
                if (!(item instanceof Cue)) {
                    out.add(item);
                    continue;
                }
                Cue cue = (Cue) item;
                CharSequence text = cue.text;
                if (text == null) {
                    out.add(item);
                    continue;
                }
                String raw = text.toString();
                if (!SdhLabels.isSoundCue(raw)) {
                    out.add(item);
                    continue;
                }
                String cleaned = SdhLabels.cleanCueText(raw);
                if (cleaned == null) {
                    changed = true;
                    continue;
                }
                try {
                    out.add(cue.buildUpon().setText(cleaned).build());
                } catch (Throwable error) {
                    out.add(item);
                    continue;
                }
                changed = true;
            }
            return changed ? out : cues;
        } catch (Throwable error) {
            return cues;
        }
    }

    private static Activity activityOf(Context context) {
        Context current = context;
        for (int i = 0; i < 12 && current != null; i++) {
            if (current instanceof Activity) return (Activity) current;
            if (!(current instanceof ContextWrapper)) return null;
            current = ((ContextWrapper) current).getBaseContext();
        }
        return null;
    }

    private static final class Entry {
        Tracks.Group group;
        TrackGroup mediaGroup;
        int index;
        int ordinal;
        Format format;
        String id;
        String lang;
        String label;
        int kind;
        /** Bitmap track (PGS, VobSub, DVB): ranked after a text track of the same kind. */
        boolean bitmap;
        boolean selected;
    }

    private static final class TrackSession {
        private final Activity activity;
        private Player player;
        private boolean closed;
        private String mediaKey = "";
        private final Set<String> switchedAway = new HashSet<String>();
        private final Set<String> sdhContent = new HashSet<String>();
        private final List<String> sample = new ArrayList<String>();
        private String samplingId;
        private int switches;
        private int generation;
        private boolean userLocked;
        private String lastAutoId;
        private String lastSeenId;
        private long firstEvalAt;
        private String lastState = "";

        private final Player.Listener listener = new Player.Listener() {
            @Override
            public void onTracksChanged(Tracks tracks) {
                try {
                    evaluate();
                } catch (Throwable error) {
                    Log.w(TAG, "rank failed", error);
                }
            }

            @Override
            public void onMediaItemTransition(MediaItem mediaItem, int reason) {
                try {
                    resetMedia();
                } catch (Throwable error) {
                    Log.w(TAG, "reset failed", error);
                }
            }

            @Override
            public void onCues(CueGroup cueGroup) {
                try {
                    sampleCues(cueGroup);
                } catch (Throwable error) {
                    Log.w(TAG, "sample failed", error);
                }
            }
        };

        TrackSession(Activity activity) {
            this.activity = activity;
        }

        void offer(Player next) {
            if (next == player) return;
            try {
                if (player != null) player.removeListener(listener);
            } catch (Throwable ignored) {
                // Player already released.
            }
            player = next;
            try {
                player.addListener(listener);
            } catch (Throwable error) {
                Log.w(TAG, "listener failed", error);
                return;
            }
            resetMedia();
            try {
                evaluate();
            } catch (Throwable error) {
                Log.w(TAG, "rank failed", error);
            }
        }

        private void resetMedia() {
            mediaKey = "";
            switchedAway.clear();
            sdhContent.clear();
            sample.clear();
            samplingId = null;
            switches = 0;
            generation++;
            userLocked = false;
            lastAutoId = null;
            lastSeenId = null;
            firstEvalAt = 0L;
        }

        private String mediaKey() {
            try {
                MediaItem item = player.getCurrentMediaItem();
                if (item == null) return "";
                String uri = item.localConfiguration == null
                        ? "" : String.valueOf(item.localConfiguration.uri);
                return String.valueOf(item.mediaId) + "|" + uri;
            } catch (Throwable ignored) {
                return "";
            }
        }

        private List<Entry> textEntries() {
            List<Entry> out = new ArrayList<Entry>();
            Tracks tracks;
            try {
                tracks = player.getCurrentTracks();
            } catch (Throwable ignored) {
                return out;
            }
            if (tracks == null) return out;
            int groupNumber = 0;
            int ordinal = 0;
            try {
                for (Tracks.Group group : tracks.getGroups()) {
                    if (group.getType() != C.TRACK_TYPE_TEXT) continue;
                    groupNumber++;
                    TrackGroup mediaGroup;
                    try {
                        mediaGroup = group.getMediaTrackGroup();
                    } catch (Throwable ignored) {
                        continue;
                    }
                    if (mediaGroup == null) continue;
                    for (int i = 0; i < group.length; i++) {
                        Format format;
                        try {
                            format = group.getTrackFormat(i);
                        } catch (Throwable ignored) {
                            continue;
                        }
                        if (format == null) continue;
                        Entry entry = new Entry();
                        entry.group = group;
                        entry.mediaGroup = mediaGroup;
                        entry.index = i;
                        entry.ordinal = ordinal++;
                        entry.format = format;
                        entry.id = format.id == null
                                ? "emb:" + groupNumber + ":" + i + ":" + String.valueOf(format.language)
                                : format.id;
                        entry.lang = SdhLabels.normLang(format.language);
                        entry.label = format.label;
                        entry.kind = SdhLabels.kindOf(format.label, format.roleFlags,
                                format.selectionFlags);
                        entry.bitmap = SdhLabels.isBitmapMime(format.sampleMimeType);
                        try {
                            entry.selected = group.isTrackSelected(i);
                        } catch (Throwable ignored) {
                            entry.selected = false;
                        }
                        out.add(entry);
                    }
                }
            } catch (Throwable ignored) {
                // Partial list is still usable.
            }
            return out;
        }

        private void evaluate() {
            if (player == null) return;
            if (!SdhPrefs.isAvoidEnabled(activity)) return;
            String key = mediaKey();
            if (!key.equals(mediaKey)) {
                resetMedia();
                mediaKey = key;
            }
            List<Entry> entries = textEntries();
            if (entries.isEmpty()) return;
            Entry selected = null;
            for (Entry entry : entries) {
                if (entry.selected) {
                    selected = entry;
                    break;
                }
            }
            if (selected == null) return;
            activeEnglish = "en".equals(selected.lang);
            if (!activeEnglish) {
                // Other languages use brackets for signs and names: leave them untouched.
                samplingId = null;
                sample.clear();
                return;
            }
            long now = SystemClock.elapsedRealtime();
            if (firstEvalAt == 0L) firstEvalAt = now;
            if (userLocked) return;
            if (lastSeenId != null && !selected.id.equals(lastSeenId)
                    && !selected.id.equals(lastAutoId)
                    && (lastAutoId != null || now - firstEvalAt > USER_GRACE_MS)) {
                // The track changed without us: a manual pick, so stop auto-switching here.
                userLocked = true;
                samplingId = null;
                sample.clear();
                Log.i(TAG, "manual subtitle pick " + selected.id + ", auto-switch off for this media");
                return;
            }
            lastSeenId = selected.id;
            logState(entries, selected);
            if (switchedAway.contains(selected.id)) return;
            String prefLang = selected.lang;
            List<Entry> pool = new ArrayList<Entry>();
            for (Entry entry : entries) {
                if (sdhContent.contains(entry.id)) continue;
                if (!prefLang.isEmpty() && !prefLang.equals("und")
                        && !entry.lang.equals(prefLang)) continue;
                pool.add(entry);
            }
            if (pool.isEmpty()) {
                // Every same-language track scored as SDH content: the cleaner covers it.
                armSampling(selected);
                return;
            }
            Collections.sort(pool, new Comparator<Entry>() {
                @Override
                public int compare(Entry a, Entry b) {
                    if (a.kind != b.kind) return a.kind - b.kind;
                    if (a.bitmap != b.bitmap) return a.bitmap ? 1 : -1;
                    return a.ordinal - b.ordinal;
                }
            });
            boolean allSdh = true;
            for (Entry entry : pool) {
                if (entry.kind != SdhLabels.KIND_SDH) {
                    allSdh = false;
                    break;
                }
            }
            Entry best = null;
            for (Entry entry : pool) {
                if (!allSdh && entry.kind == SdhLabels.KIND_SDH) continue;
                best = entry;
                break;
            }
            if (best == null) {
                armSampling(selected);
                return;
            }
            if (best.id.equals(selected.id)) {
                if (isAddon(best)) resolveAddon(best, pool);
                else armSampling(selected);
                return;
            }
            if (isAddon(best)) resolveAddon(best, pool);
            else switchTo(best, "label");
        }

        private void logState(List<Entry> entries, Entry selected) {
            try {
                StringBuilder sb = new StringBuilder();
                for (Entry entry : entries) {
                    if (sb.length() > 0) sb.append("; ");
                    sb.append(entry.selected ? "*" : "").append(entry.id).append(" ")
                            .append(entry.lang).append(" kind=").append(entry.kind)
                            .append(entry.bitmap ? " bitmap" : "")
                            .append(" '").append(entry.label).append("'");
                }
                String line = sb.toString();
                if (line.equals(lastState)) return;
                lastState = line;
                Log.i(TAG, "tracks: " + line);
            } catch (Throwable ignored) {
                // Logging only.
            }
        }

        private boolean isAddon(Entry entry) {
            String id = entry.format.id;
            if (id == null) return false;
            String lower = id.toLowerCase(Locale.US);
            return lower.startsWith("http://") || lower.startsWith("https://");
        }

        private void armSampling(Entry selected) {
            if (isAddon(selected)) return;
            if (selected.id.equals(samplingId)) return;
            samplingId = selected.id;
            sample.clear();
        }

        private void sampleCues(CueGroup cueGroup) {
            if (samplingId == null || userLocked || cueGroup == null || cueGroup.cues == null) return;
            if (!SdhPrefs.isAvoidEnabled(activity)) {
                samplingId = null;
                sample.clear();
                return;
            }
            for (Object item : cueGroup.cues) {
                if (!(item instanceof Cue)) continue;
                CharSequence text = ((Cue) item).text;
                if (text == null) continue;
                String raw = text.toString().trim();
                if (raw.isEmpty()) continue;
                sample.add(raw);
                if (sample.size() > 160) sample.remove(0);
            }
            int dialogue = 0;
            for (String cue : sample) {
                if (SdhLabels.isDialogueCue(cue)) dialogue++;
            }
            if (dialogue < SAMPLE_CUES) return;
            double score = SdhLabels.scoreCues(new ArrayList<String>(sample));
            String id = samplingId;
            samplingId = null;
            sample.clear();
            if (score < 0) return;
            Log.i(TAG, "content score " + id + " = " + score);
            if (score < SdhLabels.SDH_THRESHOLD) return;
            sdhContent.add(id);
            Entry current = null;
            List<Entry> entries = textEntries();
            for (Entry entry : entries) {
                if (entry.id.equals(id) && entry.selected) current = entry;
            }
            if (current == null) return;
            String prefLang = current.lang;
            Entry next = null;
            List<Entry> pool = new ArrayList<Entry>();
            for (Entry entry : entries) {
                if (entry.id.equals(id) || sdhContent.contains(entry.id)) continue;
                if (!prefLang.isEmpty() && !prefLang.equals("und")
                        && !entry.lang.equals(prefLang)) continue;
                pool.add(entry);
            }
            Collections.sort(pool, new Comparator<Entry>() {
                @Override
                public int compare(Entry a, Entry b) {
                    if (a.kind != b.kind) return a.kind - b.kind;
                    if (a.bitmap != b.bitmap) return a.bitmap ? 1 : -1;
                    return a.ordinal - b.ordinal;
                }
            });
            for (Entry entry : pool) {
                if (entry.kind == SdhLabels.KIND_SDH) continue;
                next = entry;
                break;
            }
            if (next == null && !pool.isEmpty()) next = pool.get(0);
            if (next == null) return;
            if (isAddon(next)) resolveAddon(next, pool);
            else switchTo(next, "content score " + score);
        }

        private void resolveAddon(final Entry entry, final List<Entry> pool) {
            final String url = entry.format.id;
            if (url == null) return;
            Boolean known = URL_VERDICTS.get(url);
            if (known != null) {
                onAddonVerdict(entry, pool, url, known.booleanValue());
                return;
            }
            if (!INFLIGHT.add(url)) return;
            final int gen = generation;
            final String media = mediaKey;
            NET.execute(new Runnable() {
                @Override
                public void run() {
                    boolean sdh = false;
                    boolean fetched = false;
                    try {
                        String body = download(url);
                        if (body != null) {
                            fetched = true;
                            List<String> cues = SdhLabels.parseSubtitleFile(url, body);
                            if (cues.size() > 200) cues = cues.subList(0, 200);
                            double score = SdhLabels.scoreCues(cues);
                            Log.i(TAG, "addon score " + url + " = " + score
                                    + " over " + cues.size() + " cues");
                            sdh = score >= SdhLabels.SDH_THRESHOLD;
                        }
                    } catch (Throwable error) {
                        Log.w(TAG, "addon fetch failed", error);
                    }
                    if (fetched) URL_VERDICTS.put(url, Boolean.valueOf(sdh));
                    final boolean verdict = sdh;
                    final boolean haveVerdict = fetched;
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            try {
                                INFLIGHT.remove(url);
                                if (gen != generation || !media.equals(mediaKey)) return;
                                if (!haveVerdict) return;
                                onAddonVerdict(entry, pool, url, verdict);
                            } catch (Throwable error) {
                                Log.w(TAG, "verdict failed", error);
                            }
                        }
                    });
                }
            });
        }

        private void onAddonVerdict(Entry entry, List<Entry> pool, String url, boolean sdh) {
            if (!sdh) {
                List<Entry> fresh = textEntries();
                for (Entry candidate : fresh) {
                    if (url.equals(candidate.format.id)) {
                        if (candidate.selected) return;
                        switchTo(candidate, "addon verified");
                        return;
                    }
                }
                return;
            }
            sdhContent.add(entry.id);
            Log.i(TAG, "addon is SDH, trying next: " + url);
            evaluate();
        }

        private void switchTo(Entry entry, String why) {
            if (userLocked || switches >= MAX_SWITCHES_PER_MEDIA) return;
            String currentId = null;
            List<Entry> entries = textEntries();
            for (Entry candidate : entries) {
                if (candidate.selected) {
                    currentId = candidate.id;
                    break;
                }
            }
            try {
                player.setTrackSelectionParameters(player.getTrackSelectionParameters()
                        .buildUpon()
                        .setOverrideForType(new TrackSelectionOverride(entry.mediaGroup,
                                Collections.singletonList(Integer.valueOf(entry.index))))
                        .build());
            } catch (Throwable error) {
                Log.w(TAG, "switch failed", error);
                return;
            }
            switches++;
            generation++;
            lastAutoId = entry.id;
            lastSeenId = entry.id;
            if (currentId != null) switchedAway.add(currentId);
            sample.clear();
            samplingId = null;
            Log.i(TAG, "switched (" + why + ") to " + entry.id + " label=" + entry.label);
            if (!isAddon(entry)) {
                samplingId = entry.id;
            }
        }

        private String download(String url) {
            HttpURLConnection connection = null;
            try {
                URL target = new URL(url);
                connection = (HttpURLConnection) target.openConnection();
                connection.setConnectTimeout(8000);
                connection.setReadTimeout(8000);
                connection.setRequestProperty("User-Agent", "Stremio");
                connection.setInstanceFollowRedirects(true);
                InputStream in = connection.getInputStream();
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                int read;
                int total = 0;
                while ((read = in.read(buffer)) != -1) {
                    total += read;
                    if (total > 300 * 1024) break;
                    out.write(buffer, 0, read);
                }
                try {
                    in.close();
                } catch (Throwable ignored) {
                    // Stream already consumed.
                }
                byte[] bytes = out.toByteArray();
                if (bytes.length == 0) return null;
                return new String(bytes, "UTF-8");
            } catch (Throwable ignored) {
                return null;
            } finally {
                if (connection != null) {
                    try {
                        connection.disconnect();
                    } catch (Throwable ignored) {
                        // Disconnect is best effort.
                    }
                }
            }
        }
    }
}
