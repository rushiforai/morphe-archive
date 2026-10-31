package app.tikkamasalla.stremio.progress;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import androidx.media3.common.Format;
import androidx.media3.common.Player;
import androidx.media3.common.Tracks;

/**
 * Makes Stremio keep watch progress when an external player is used. Called from small hooks in
 * ExternalPlayerContract (launch and result) and StremioApi.playerTimeChanged (log only).
 * Also passes media identity and the selected subtitle to the external player, so Vimu, MX Player
 * and mpv start with the right show, episode and subtitle. Every entry point fails soft: on any
 * problem the original Stremio code path runs unchanged.
 */
public final class ExternalProgress {
    private static final String TAG = "ExtProgress";
    private static final String RESULT_CLASS =
            "com.stremio.common.players.ExternalPlayerContract$ExternalPlayerResult";
    private static final Pattern VIDEO_ID =
            Pattern.compile("(?i)^(tt\\d+)(?::(\\d+):(\\d+))?$");
    private static final long SNAPSHOT_TTL_MS = 120000L;

    private static volatile Context appContext;

    // Snapshot taken when the user picks "Play in external player", consumed by decorate().
    private static volatile long capturedAt;
    private static volatile String capMediaType = "";
    private static volatile String capImdb = "";
    private static volatile String capTitle = "";
    private static volatile int capSeason;
    private static volatile int capEpisode;
    private static volatile String[] capSubUris = new String[0];
    private static volatile String[] capSubNames = new String[0];
    private static volatile String capEnableUri = "";
    private static volatile String capSubLang = "";
    private static volatile String capSubLabel = "";
    private static volatile String capSubTrackId = "";
    private static volatile int capSubIndex = -1;

    private ExternalProgress() {
    }

    /**
     * Hook at the start of PlayerFragment.openInExternalPlayer: snapshots media identity
     * (series/movie, season, episode, IMDb id, show name) and the selected subtitle from the
     * playing state, so decorate() can hand them to the external player. The resolve callback
     * that builds the launch Intent runs later, which is why this is a snapshot, not a return.
     */
    public static void captureExternal(Object fragment) {
        try {
            if (fragment == null) {
                return;
            }
            Object args = invoke(fragment, "getArgs");
            String videoId = args == null ? "" : string(invoke(args, "getVideoId"));
            Object viewModel = invoke(fragment, "getViewModel");
            Object state = null;
            if (viewModel != null) {
                Object flow = invoke(viewModel, "getState");
                if (flow != null) {
                    state = invoke(flow, "getValue");
                }
            }
            Object meta = state == null ? null : invoke(state, "getMetaItem");
            Object video = state == null ? null : invoke(state, "getCurrentVideo");
            String metaType = meta == null ? "" : string(invoke(meta, "getType"));
            String metaName = meta == null ? "" : string(invoke(meta, "getName"));
            String videoTitle = video == null ? "" : string(invoke(video, "getTitle"));

            String imdb = "";
            int season = 0;
            int episode = 0;
            if (videoId.length() > 0) {
                Matcher id = VIDEO_ID.matcher(videoId.trim());
                if (id.find()) {
                    imdb = safe(id.group(1)).toLowerCase(java.util.Locale.US);
                    season = parseInt(id.group(2));
                    episode = parseInt(id.group(3));
                }
            }

            String mediaType = normalizeMediaType(metaType, season, episode);
            String title = metaName.length() > 0 ? metaName : videoTitle;

            // Addon subtitles known to the player state, with the proxied (playable) URIs.
            List<String> subUris = new ArrayList<>();
            List<String> subNames = new ArrayList<>();
            List<String> subOrigins = new ArrayList<>();
            try {
                Object subs = state == null ? null : invoke(state, "getSubtitles");
                if (subs instanceof Map && viewModel != null) {
                    for (Map.Entry<?, ?> entry : ((Map<?, ?>) subs).entrySet()) {
                        Object list = entry.getValue();
                        if (!(list instanceof List)) {
                            continue;
                        }
                        for (Object sub : (List<?>) list) {
                            if (sub == null) {
                                continue;
                            }
                            Object uri = null;
                            try {
                                uri = invoke(viewModel, "proxiedSubtitlesUri", sub);
                            } catch (Throwable ignored) {
                            }
                            if (uri == null) {
                                continue;
                            }
                            subUris.add(String.valueOf(uri));
                            subNames.add(string(invoke(sub, "getName")));
                            subOrigins.add(string(invoke(sub, "getUrl")));
                        }
                    }
                }
            } catch (Throwable error) {
                Log.w(TAG, "capture subtitles", error);
            }

            // The selected text track: an addon subtitle when its id matches one of the
            // addon URLs (Stremio sets the track id to the subtitle URL), else embedded.
            String enableUri = "";
            String subLang = "";
            String subLabel = "";
            String subTrackId = "";
            int subIndex = -1;
            try {
                Object playerObject = field(fragment, "player");
                if (playerObject instanceof Player) {
                    Tracks tracks = ((Player) playerObject).getCurrentTracks();
                    int textIndex = 0;
                    for (Tracks.Group group : tracks.getGroups()) {
                        if (group.getType() != 3) {
                            continue;
                        }
                        for (int i = 0; i < group.length; i++) {
                            if (!group.isTrackSelected(i)) {
                                textIndex++;
                                continue;
                            }
                            Format format = group.getTrackFormat(i);
                            String id = format == null ? "" : safe(format.id);
                            String match = "";
                            for (int j = 0; j < subOrigins.size(); j++) {
                                if (id.length() > 0 && id.equals(subOrigins.get(j))) {
                                    match = subUris.get(j);
                                    break;
                                }
                            }
                            if (match.length() > 0) {
                                enableUri = match;
                            } else {
                                subLang = format == null ? "" : safe(format.language);
                                subLabel = format == null ? "" : safe(format.label);
                                subTrackId = id;
                                subIndex = textIndex;
                            }
                            textIndex++;
                        }
                    }
                }
            } catch (Throwable error) {
                Log.w(TAG, "capture selection", error);
            }

            capMediaType = mediaType;
            capImdb = imdb;
            capTitle = title;
            capSeason = season;
            capEpisode = episode;
            capSubUris = subUris.toArray(new String[0]);
            capSubNames = subNames.toArray(new String[0]);
            capEnableUri = enableUri;
            capSubLang = subLang;
            capSubLabel = subLabel;
            capSubTrackId = subTrackId;
            capSubIndex = subIndex;
            capturedAt = System.currentTimeMillis();
            Log.i(TAG, "capture type=" + mediaType + " imdb=" + imdb + " S" + season + "E" + episode
                    + " title=" + clip(title) + " subs=" + subUris.size()
                    + " enable=" + (enableUri.length() > 0 ? "addon" : "")
                    + (subIndex >= 0 ? " embedded[" + subIndex + "]" : ""));
        } catch (Throwable error) {
            Log.w(TAG, "captureExternal", error);
        }
    }

    /** Hook at the start of createIntent: keeps a Context to resolve the target player. */
    public static void remember(Context context) {
        try {
            if (context != null) {
                appContext = context.getApplicationContext() != null ? context.getApplicationContext() : context;
            }
        } catch (Throwable ignored) {
        }
    }

    /**
     * Hook at the end of createIntent. Stremio already sets "return_result", "startfrom" (Vimu) and an
     * int "position" (MX Player, mpv, Just Player). VLC reads "position" only as a long, and an int and a
     * long cannot share one key, so for VLC the key is rewritten as a long and "from_start" is added.
     */
    public static void decorate(Intent intent) {
        try {
            if (intent == null || !intent.hasExtra("return_result")) {
                return; // the YouTube branch, not a player launch
            }
            launchedAt = System.currentTimeMillis();
            externalSessionOpen = true;
            BINGE_ARMED.set(false);
            try {
                Context context = appContext;
                if (context != null) {
                    context.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE)
                            .edit().putBoolean(KEY_PENDING, false).apply();
                }
            } catch (Throwable ignored) {
            }
            stopInternalPlayer(lastBingeFragment == null ? null : lastBingeFragment.get());
            ensureExplicitPlayer(intent);
            applyHandoff(intent);
            int position = intent.getIntExtra("startfrom", 0);
            intent.putExtra("return_result", true);
            intent.putExtra("startfrom", position);
            String target = resolveTarget(intent);
            if (target != null && target.startsWith("org.videolan.vlc")) {
                intent.putExtra("position", (long) position);
                intent.putExtra("from_start", position <= 0);
            } else {
                intent.putExtra("position", position);
            }
            if (target != null && target.length() > 0) setLastPlayer(target);
            Log.i(TAG, "launch position=" + position + " target=" + target);
            keepAlive(true);
        } catch (Throwable error) {
            Log.w(TAG, "decorate", error);
        }
    }

    /**
     * Adds the captureExternal() snapshot to the launch Intent: media identity for every player,
     * the MX/mpv subtitle lists with the selected addon subtitle, and the embedded track
     * details when the selection is a file track. Consumes the snapshot so a later launch
     * never reuses it.
     */
    private static void applyHandoff(Intent intent) {
        try {
            if (System.currentTimeMillis() - capturedAt > SNAPSHOT_TTL_MS) {
                return;
            }
            capturedAt = 0L;
            if (capMediaType.length() > 0) {
                intent.putExtra("media_type", capMediaType);
            }
            if ("series".equals(capMediaType) && capEpisode > 0) {
                intent.putExtra("season", capSeason > 0 ? capSeason : 1);
                intent.putExtra("episode", capEpisode);
            }
            if (capImdb.length() > 0) {
                intent.putExtra("imdb_id", capImdb);
            }
            if (capTitle.length() > 0) {
                intent.putExtra("title", capTitle);
            }
            if (capSubUris.length > 0) {
                android.net.Uri[] uris = new android.net.Uri[capSubUris.length];
                for (int i = 0; i < capSubUris.length; i++) {
                    uris[i] = android.net.Uri.parse(capSubUris[i]);
                }
                intent.putExtra("subs", uris);
                intent.putExtra("subs.name", capSubNames);
                if (capEnableUri.length() > 0) {
                    intent.putExtra("subs.enable",
                            new android.net.Uri[]{android.net.Uri.parse(capEnableUri)});
                }
            }
            if (capSubIndex >= 0) {
                intent.putExtra("sub_lang", capSubLang);
                intent.putExtra("sub_label", capSubLabel);
                intent.putExtra("sub_track_index", capSubIndex);
                intent.putExtra("sub_track_id", capSubTrackId);
            }
            Log.i(TAG, "handoff type=" + capMediaType + " subs=" + capSubUris.length
                    + " enable=" + (capEnableUri.length() > 0)
                    + " embedded=" + (capSubIndex >= 0));
        } catch (Throwable error) {
            Log.w(TAG, "applyHandoff", error);
        }
    }

    private static String normalizeMediaType(String metaType, int season, int episode) {
        String type = safe(metaType).toLowerCase(java.util.Locale.US);
        if (type.contains("movie") || type.contains("film")) {
            return "movie";
        }
        if (episode > 0 && (type.contains("series") || type.contains("show") || type.contains("anime")
                || type.equals("tv"))) {
            return "series";
        }
        return episode > 0 ? "series" : "movie";
    }

    private static Object invoke(Object target, String name, Object... args) throws Exception {
        Class<?>[] types = new Class<?>[args.length];
        for (int i = 0; i < args.length; i++) {
            types[i] = args[i] == null ? Object.class : args[i].getClass();
        }
        Class<?> type = target instanceof Class ? (Class<?>) target : target.getClass();
        Object receiver = target instanceof Class ? null : target;
        Method method = exactMethod(type, name, types);
        if (method == null) {
            method = compatibleMethod(type, name, args);
        }
        if (method == null) {
            throw new NoSuchMethodException(type.getName() + "." + name);
        }
        method.setAccessible(true);
        return method.invoke(receiver, args);
    }

    private static Method exactMethod(Class<?> type, String name, Class<?>[] types) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            try {
                return current.getDeclaredMethod(name, types);
            } catch (NoSuchMethodException ignored) {
            }
        }
        return null;
    }

    /** Name and arity match where each parameter accepts the runtime argument (subclasses ok). */
    private static Method compatibleMethod(Class<?> type, String name, Object[] args) {
        for (Class<?> current = type; current != null; current = current.getSuperclass()) {
            for (Method candidate : current.getDeclaredMethods()) {
                if (!candidate.getName().equals(name)) {
                    continue;
                }
                Class<?>[] params = candidate.getParameterTypes();
                if (params.length != args.length) {
                    continue;
                }
                boolean ok = true;
                for (int i = 0; i < params.length; i++) {
                    if (args[i] != null && !params[i].isAssignableFrom(args[i].getClass())) {
                        ok = false;
                        break;
                    }
                }
                if (ok) {
                    return candidate;
                }
            }
        }
        return null;
    }

    private static Object field(Object target, String name) throws Exception {
        for (Class<?> current = target.getClass(); current != null;
                current = current.getSuperclass()) {
            try {
                Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static String string(Object value) {
        return value == null ? "" : safe(String.valueOf(value));
    }

    private static String safe(String value) {
        return value == null ? "" : value;
    }

    private static int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (Throwable ignored) {
            return 0;
        }
    }

    private static String clip(String value) {
        if (value == null) {
            return "";
        }
        return value.length() <= 80 ? value : value.substring(0, 80);
    }

    /**
     * Hook at the start of parseResult. Reads position and duration from any known key and type, and
     * returns an ExternalPlayerResult, or null to let Stremio's own parser run.
     */
    private static volatile long lastDuration;
    private static volatile long launchedAt;
    private static volatile boolean externalSessionOpen;
    private static volatile long bingeInFlightUntil;
    private static volatile java.lang.ref.WeakReference<Object> lastBingeFragment;
    private static final java.util.concurrent.atomic.AtomicBoolean BINGE_ARMED =
            new java.util.concurrent.atomic.AtomicBoolean(false);
    private static final java.util.concurrent.atomic.AtomicInteger BINGE_SEQ =
            new java.util.concurrent.atomic.AtomicInteger(0);
    private static final long MIN_OPEN_MS = 60000L;
    private static final double FULL_RATIO = 0.9;
    private static final String KEY_ARMED_AT = "external_binge_armed_at";
    private static final long BINGE_TTL_MS = 60000L;

    private static final long BINGE_INFLIGHT_MS = 15000L;

    public static Object parse(int resultCode, Intent data) {
        keepAlive(false);
        externalSessionOpen = false;
        bingeInFlightUntil = 0L;
        try {
            if (data == null) {
                launchedAt = 0L;
                Log.i(TAG, "result code=" + resultCode + " without data");
                return null;
            }
            String action = data.getAction();
            Bundle extras = data.getExtras();
            long position = readLong(extras, "extra_position", "position");
            long duration = readLong(extras, "extra_duration", "duration");
            String endBy = extras != null ? extras.getString("end_by") : null;
            long launchStamp = launchedAt;
            long openMs = launchStamp > 0L ? System.currentTimeMillis() - launchStamp : 0L;
            launchedAt = 0L;
            // Real completion only: the player reported the end with a known duration, or it was
            // open for a minute and reached 90% of the duration. A quick error return or a duplicate
            // result after launchedAt was already consumed (launchStamp == 0L) is never one.
            boolean reportedEnd = "playback_completion".equals(endBy)
                    || ("net.gtvbox.videoplayer.result".equals(action) && resultCode == 1);
            boolean completed = false;
            if (launchStamp > 0L) {
                if (reportedEnd) {
                    completed = duration > 0L || (openMs >= MIN_OPEN_MS && lastDuration > 0L);
                } else if (duration > 0L && position >= (long) (duration * FULL_RATIO)) {
                    completed = openMs >= MIN_OPEN_MS;
                } else if (duration == 0L && openMs >= MIN_OPEN_MS && lastDuration > 0L
                        && ("org.videolan.vlc.player.result".equals(action)
                        || ("is.xyz.mpv.MPVActivity.result".equals(action)
                        && resultCode == Activity_RESULT_OK && position == 0L))) {
                    // VLC and mpv report no position at the end of a file.
                    completed = true;
                }
            }
            if (completed) {
                // Stremio's core only gets position and duration: report a full position at the end.
                if (duration <= 0L) duration = lastDuration;
                if (duration > 0L && position < (long) (duration * 0.95)) position = duration;
            }
            Log.i(TAG, "result code=" + resultCode + " action=" + action + " position=" + position
                    + " duration=" + duration + " end_by=" + endBy + " completed=" + completed);
            if (completed) armBinge();
            Constructor<?> constructor = Class.forName(RESULT_CLASS)
                    .getConstructor(long.class, long.class, boolean.class);
            return constructor.newInstance(Math.max(position, 0L), Math.max(duration, 0L), completed);
        } catch (Throwable error) {
            Log.w(TAG, "parse", error);
            return null;
        }
    }

    /**
     * Hook at the start of PlayerFragment.onExternalPlayerResult, before Stremio marks the episode
     * watched and opens the next one. For a completed result it first saves the full position in
     * the core, which creates or updates the library item (the stock completed branch never sends a
     * position, and marking watched is ignored for an episode without one), then marks the episode
     * watched. The mark is repeated after a short delay, because the core applies the progress
     * asynchronously, and only while the player still holds the same episode. Fails soft.
     */
    public static void onExternalResult(Object fragment, Object result) {
        try {
            if (fragment == null || result == null) {
                return;
            }
            if (!Boolean.TRUE.equals(invoke(result, "getCompleted"))) {
                return;
            }
            final Object vm = invoke(fragment, "getViewModel");
            if (vm == null) {
                return;
            }
            long duration = ((Number) invoke(result, "getDuration")).longValue();
            if (duration > 0L) {
                ClassLoader loader = vm.getClass().getClassLoader();
                Class<?> updateClass = Class.forName(
                        "com.stremio.common.viewmodels.state.VideoPlaybackState$UpdateProgress",
                        false, loader);
                Object update = updateClass.getConstructor(long.class, long.class)
                        .newInstance(duration, duration);
                invoke(vm, "onStateChange", update);
            }
            final String videoId = currentVideoId(vm);
            invoke(vm, "markAsWatched");
            Log.i(TAG, "completed: progress saved and marked watched " + videoId);
            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (videoId.length() > 0 && videoId.equals(currentVideoId(vm))) {
                            invoke(vm, "markAsWatched");
                            Log.i(TAG, "completed: marked watched again " + videoId);
                        }
                    } catch (Throwable error) {
                        Log.w(TAG, "mark watched again", error);
                    }
                }
            }, 1500L);
        } catch (Throwable error) {
            Log.w(TAG, "onExternalResult", error);
        }
    }

    /** Id of the episode the player view model holds right now, or "". */
    private static String currentVideoId(Object vm) {
        try {
            Object flow = invoke(vm, "getState");
            Object state = flow == null ? null : invoke(flow, "getValue");
            Object video = state == null ? null : invoke(state, "getCurrentVideo");
            return video == null ? "" : string(invoke(video, "getId"));
        } catch (Throwable ignored) {
            return "";
        }
    }

    /** Keeps the process alive while the external player is open (see KeepAliveService). */
    private static void keepAlive(boolean start) {
        try {
            Context context = appContext;
            if (context == null) {
                return;
            }
            Intent service = new Intent(context, KeepAliveService.class);
            if (!start) {
                context.stopService(service);
            } else if (Build.VERSION.SDK_INT >= 26) {
                context.startForegroundService(service);
            } else {
                context.startService(service);
            }
            Log.i(TAG, "keep-alive " + (start ? "start" : "stop"));
        } catch (Throwable error) {
            Log.w(TAG, "keep-alive", error);
        }
    }

    /** Hook in StremioApi.playerTimeChanged: log only, shows what reaches the core. */
    public static void logTime(long position, long duration) {
        if (duration > 0L) lastDuration = duration;
        Log.i(TAG, "playerTimeChanged position=" + position + " duration=" + duration);
    }

    private static final String PREFS_FILE = "introskip_prefs";
    private static final String KEY_BINGE = "external_binge";
    private static final String KEY_PENDING = "external_binge_pending";
    private static final String KEY_PLAYER = "external_binge_player";

    public static boolean isBingeEnabled() {
        try {
            Context context = appContext;
            if (context == null) return true;
            return context.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE)
                    .getBoolean(KEY_BINGE, true);
        } catch (Throwable ignored) {
            return true;
        }
    }

    private static void armBinge() {
        try {
            if (!isBingeEnabled() || "movie".equals(capMediaType)) return;
            BINGE_ARMED.set(true);
            Context context = appContext;
            if (context == null) return;
            context.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE)
                    .edit().putBoolean(KEY_PENDING, true)
                    .putLong(KEY_ARMED_AT, System.currentTimeMillis()).apply();
            Log.i(TAG, "binge armed");
        } catch (Throwable ignored) {
            // Binge is optional.
        }
    }

    private static String lastPlayer() {
        try {
            Context context = appContext;
            if (context == null) return null;
            return context.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE)
                    .getString(KEY_PLAYER, null);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void setLastPlayer(String target) {
        try {
            Context context = appContext;
            if (context == null || target == null || target.startsWith("com.android.")) return;
            context.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE)
                    .edit().putString(KEY_PLAYER, target).apply();
        } catch (Throwable ignored) {
            // Optional.
        }
    }

    /**
     * Hook at the start of PlayerFragment.startStreamPlayback. When the previous
     * external playback finished, the next episode is already loading here with its
     * best stream; relaunch it in the external player instead of playing inside.
     * Returns true when external binge handled (or suppressed a duplicate internal
     * start during the launch) so that PlayerFragment.startStreamPlayback returns
     * immediately without starting ExoPlayer. Movies never binge: a bare videoId
     * without season and episode clears the flag.
     * Fail soft: any problem returns false so internal playback continues.
     */
    private static Context ensureContext(Object fragment) {
        Context context = appContext;
        if (context != null || fragment == null) return context;
        try {
            Object c = invoke(fragment, "getContext");
            if (!(c instanceof Context)) {
                c = invoke(fragment, "getActivity");
            }
            if (c instanceof Context) {
                remember((Context) c);
            }
        } catch (Throwable ignored) {
        }
        return appContext;
    }

    public static boolean maybeBinge(Object fragment, Object stream) {
        try {
            long now = System.currentTimeMillis();
            playbackStartedAt = now;
            int seq = BINGE_SEQ.incrementAndGet();
            Context context = ensureContext(fragment);
            if (context == null || fragment == null) {
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq
                        + " context=" + (context != null) + " fragment=" + (fragment != null)
                        + " action=PASS_NO_CTX");
                return false;
            }
            android.content.SharedPreferences prefs =
                    context.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE);
            boolean inFlight = now < bingeInFlightUntil || externalSessionOpen;
            boolean prefPending = prefs.getBoolean(KEY_PENDING, false);
            boolean memPending = BINGE_ARMED.getAndSet(false);
            if (prefPending) {
                prefs.edit().putBoolean(KEY_PENDING, false).apply();
            }
            boolean pending = memPending || prefPending;

            // Duplicate startStreamPlayback while the binge external launch is already in-flight/open:
            // suppress internal ExoPlayer startup without launching a second external player.
            if (!pending && inFlight) {
                stopInternalPlayer(fragment);
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " pending=false inFlight=true"
                        + " internalPlaying=" + isInternalPlaying(fragment) + " action=SUPPRESS_DUP_INTERNAL");
                return true;
            }
            if (!pending) {
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " pending=false inFlight=false"
                        + " internalPlaying=" + isInternalPlaying(fragment) + " action=PASS_INTERNAL");
                return false;
            }
            long armedAt = prefs.getLong(KEY_ARMED_AT, 0L);
            if (now - armedAt > BINGE_TTL_MS) {
                Log.i(TAG, "binge flag expired");
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " pending=true inFlight=" + inFlight
                        + " internalPlaying=" + isInternalPlaying(fragment) + " action=PASS_EXPIRED");
                return false;
            }
            if (!prefs.getBoolean(KEY_BINGE, true)) {
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " pending=true inFlight=" + inFlight
                        + " internalPlaying=" + isInternalPlaying(fragment) + " action=PASS_BINGE_OFF");
                return false;
            }
            if (isMovieFragment(fragment)) {
                Log.i(TAG, "binge skipped: movie");
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " pending=true inFlight=" + inFlight
                        + " internalPlaying=" + isInternalPlaying(fragment) + " action=PASS_MOVIE");
                return false;
            }
            try {
                lastBingeFragment = new java.lang.ref.WeakReference<>(fragment);
                bingeInFlightUntil = now + BINGE_INFLIGHT_MS;
                stopInternalPlayer(fragment);
                fragment.getClass().getMethod("openInExternalPlayer", Long.class)
                        .invoke(fragment, new Object[]{null});
                stopInternalPlayer(fragment);
                new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        // Only while the binge handoff is still live: on a fast external
                        // failure Stremio may already have fallen back to its own player.
                        if (externalSessionOpen || System.currentTimeMillis() < bingeInFlightUntil) {
                            stopInternalPlayer(fragment);
                        }
                    }
                }, 300L);
                Log.i(TAG, "binge: openInExternalPlayer");
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " pending=true inFlight=" + inFlight
                        + " internalPlaying=" + isInternalPlaying(fragment) + " action=LAUNCH_EXT");
                return true;
            } catch (Throwable error) {
                bingeInFlightUntil = 0L;
                Log.w(TAG, "binge", error);
                return false;
            }
        } catch (Throwable ignored) {
            // Internal playback continues.
            return false;
        }
    }

    private static void stopInternalPlayer(Object fragment) {
        try {
            if (fragment == null) return;
            Object playerObject = field(fragment, "player");
            if (playerObject instanceof Player) {
                Player player = (Player) playerObject;
                player.setPlayWhenReady(false);
                player.pause();
                player.stop();
            }
        } catch (Throwable ignored) {
        }
    }

    private static boolean isInternalPlaying(Object fragment) {
        try {
            if (fragment == null) return false;
            Object playerObject = field(fragment, "player");
            return playerObject instanceof Player && ((Player) playerObject).isPlaying();
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static volatile long playbackStartedAt;

    /**
     * Hook at the start of the lambda the internal player calls when playback ends (it opens the
     * next episode). Lets it through only for a real end: the player was open for a minute and sat
     * at 90% of the duration or later. A failed file that ends at once, as when the stream does not
     * play and Stremio falls back to VLC, would otherwise chain into the next episodes. The next
     * episode pill does not pass through here. Fails open.
     */
    public static boolean allowAutoNext(Object lambda) {
        try {
            if (lambda == null) return true;
            Object fragment = field(lambda, "this$0");
            Object playerObject = fragment == null ? null : field(fragment, "player");
            if (!(playerObject instanceof Player)) return true;
            Player player = (Player) playerObject;
            long position = player.getCurrentPosition();
            long duration = player.getDuration();
            long startedAt = playbackStartedAt;
            long openMs = startedAt > 0L ? System.currentTimeMillis() - startedAt : MIN_OPEN_MS;
            boolean real = duration > 0L && position >= (long) (duration * FULL_RATIO)
                    && openMs >= MIN_OPEN_MS;
            if (!real) {
                Log.i(TAG, "auto-next blocked: position=" + position + " duration=" + duration
                        + " open=" + openMs + "ms");
            }
            return real;
        } catch (Throwable error) {
            Log.w(TAG, "allowAutoNext", error);
            return true;
        }
    }

    private static boolean isMovieFragment(Object fragment) {
        try {
            Object args = fragment.getClass().getMethod("getArguments").invoke(fragment);
            if (!(args instanceof android.os.Bundle)) return false;
            android.os.Bundle bundle = (android.os.Bundle) args;
            String videoId = bundle.getString("videoId");
            if (videoId == null || videoId.length() == 0) videoId = bundle.getString("id");
            if (videoId == null) return false;
            return !videoId.contains(":");
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static final int Activity_RESULT_OK = -1;

    private static long readLong(Bundle extras, String... keys) {
        if (extras == null) {
            return 0L;
        }
        for (String key : keys) {
            if (!extras.containsKey(key)) {
                continue;
            }
            Object value = extras.get(key);
            if (value instanceof Number) {
                return ((Number) value).longValue();
            }
            if (value instanceof String) {
                try {
                    return Long.parseLong((String) value);
                } catch (NumberFormatException ignored) {
                }
            }
        }
        return 0L;
    }

    /**
     * Keeps the type video/* and, when no player was addressed, addresses the last used player
     * (or Vimu) if it is installed, so Android never shows an "Open with" chooser that lists
     * browsers. Stremio's own intent is left alone when it already names a player.
     */
    private static void ensureExplicitPlayer(Intent intent) {
        try {
            if (intent.getData() != null && intent.getType() == null) {
                intent.setDataAndType(intent.getData(), "video/*");
            }
            if (intent.getPackage() != null || intent.getComponent() != null) {
                return;
            }
            Context context = appContext;
            if (context == null) {
                return;
            }
            android.content.pm.PackageManager pm = context.getPackageManager();
            String[] order = {lastPlayer(), "net.gtvbox.videoplayer"};
            for (String name : order) {
                if (name == null || name.length() == 0 || name.startsWith("com.android.")) {
                    continue;
                }
                Intent probe = new Intent(intent);
                probe.setPackage(name);
                if (pm.resolveActivity(probe, 0) != null) {
                    intent.setPackage(name);
                    Log.i(TAG, "external player addressed: " + name);
                    return;
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "ensureExplicitPlayer", error);
        }
    }

    private static String resolveTarget(Intent intent) {
        try {
            if (intent.getPackage() != null) {
                return intent.getPackage();
            }
            if (intent.getComponent() != null) {
                return intent.getComponent().getPackageName();
            }
            Context context = appContext;
            if (context == null) {
                return null;
            }
            ResolveInfo info = context.getPackageManager().resolveActivity(intent, 0);
            return info != null && info.activityInfo != null ? info.activityInfo.packageName : null;
        } catch (Throwable ignored) {
            return null;
        }
    }
}
