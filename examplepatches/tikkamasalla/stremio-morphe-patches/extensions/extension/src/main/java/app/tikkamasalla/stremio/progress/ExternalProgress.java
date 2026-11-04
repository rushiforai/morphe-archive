package app.tikkamasalla.stremio.progress;

import android.content.Context;
import android.content.Intent;
import android.content.pm.ResolveInfo;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import app.tikkamasalla.stremio.diag.PlaybackDiary;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.tikkamasalla.stremio.introskip.PortHooks;
import app.tikkamasalla.stremio.introskip.TrackMemory;
import app.tikkamasalla.stremio.subs.SdhPrefs;


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
    private static volatile String[] capSubLangs = new String[0];
    private static volatile int capEnableIdx = -1;
    private static volatile String capUserLang = "";
    private static volatile String capUserAudioLang = "";
    private static volatile String capEnableUri = "";
    private static volatile String capSubLang = "";
    private static volatile String capSubLabel = "";
    private static volatile String capSubTrackId = "";
    private static volatile int capSubIndex = -1;
    private static volatile String capVideoId = "";

    // Video of the open external session, and when/for which video the last result came back.
    private static volatile String launchVideoId = "";
    private static volatile long resultAt;
    private static volatile String resultVideoId = "";
    // Same-video startStreamPlayback right after a result is a replay (measured 0.76 s after the
    // result in the TV log); 3 s covers it and still leaves a deliberate re-click usable.
    private static final long REENTRY_BLOCK_MS = 3000L;
    // A new stream screen for the same video this soon after the result is the activity being
    // recreated on return, not the user opening the episode again.
    private static final long RETURN_WINDOW_MS = 10000L;

    // Progress journal (Vimu): heartbeat, pending watched-fix stash, resume check.
    private static final long HEARTBEAT_MS = 10000L;
    private static final long HEARTBEAT_CAP_MS = 6L * 3600L * 1000L;
    private static final long JOURNAL_QUERY_MS = 1500L;
    private static volatile java.lang.ref.WeakReference<Object> playerFragment;
    private static volatile int heartbeatGen;
    private static volatile Pending pending;
    private static volatile String coldLogged = "";
    private static volatile long lastResumeCheckAt;
    // Playback-triggered checks (stream list, player start) repeat after this; the activity-resume
    // trigger waits longer, so a cold-start session is not cut off by a second check.
    private static final long RESUME_GAP_MS = 10000L;
    private static final long RESUME_ACTIVITY_GAP_MS = 30000L;
    private static volatile boolean coldRunning;
    private static volatile boolean resumeWatchInstalled;
    // The six PlayerFragment args of the launching screen, kept for the cold-start load (phase 2).
    private static volatile String[] capLoadArgs;
    private static volatile String[] launchLoadArgs;

    private ExternalProgress() {
    }

    /**
     * Real position and duration of a non-completed result. The stock handler gets the position
     * with duration 0 (its inverted getProgress then cannot mark the episode watched, and its own
     * UpdateProgress is dropped); onExternalResult dispatches the real values and the watched mark.
     */
    static final class Pending {
        final Object ref;
        final long pos;
        final long dur;
        final String watchedReason;
        final long at;
        /** The episode this result belongs to ("" = unknown): it is never applied to another one. */
        final String videoId;

        Pending(Object ref, long pos, long dur, String watchedReason) {
            this(ref, pos, dur, watchedReason, "");
        }

        Pending(Object ref, long pos, long dur, String watchedReason, String videoId) {
            this.ref = ref;
            this.pos = pos;
            this.dur = dur;
            this.watchedReason = watchedReason;
            this.at = System.currentTimeMillis();
            this.videoId = videoId == null ? "" : videoId;
        }
    }

    /**
     * Pure video-id classification (no android classes), unit tested standalone.
     * Series episodes: tt..:S:E, kitsu:ID:EP (season 0 = unknown, the handoff sends 1), tmdb:ID:S:E.
     * Everything else (bare tt.., kitsu:ID, tmdb:ID, unknown schemes) has episode 0 = a movie.
     */
    static final class Ids {
        private static final Pattern VIDEO_ID = Pattern.compile(
                "(?i)^(?:(tt\\d+)(?::(\\d+):(\\d+))?|kitsu:\\d+:(\\d+)|tmdb:\\d+:(\\d+):(\\d+))$");

        final String imdb;
        final int season;
        final int episode;

        private Ids(String imdb, int season, int episode) {
            this.imdb = imdb;
            this.season = season;
            this.episode = episode;
        }

        static Ids parse(String videoId) {
            if (videoId != null) {
                Matcher m = VIDEO_ID.matcher(videoId.trim());
                if (m.find()) {
                    if (m.group(4) != null) return new Ids("", 0, num(m.group(4)));
                    if (m.group(5) != null) return new Ids("", num(m.group(5)), num(m.group(6)));
                    return new Ids(m.group(1).toLowerCase(java.util.Locale.US), num(m.group(2)),
                            num(m.group(3)));
                }
            }
            return new Ids("", 0, 0);
        }

        private static int num(String value) {
            try {
                return value == null ? 0 : Integer.parseInt(value.trim());
            } catch (NumberFormatException ignored) {
                return 0;
            }
        }

        /** "movie" or "series" for the handoff and binge: a positive episode is a series. */
        static String mediaType(String metaType, int season, int episode) {
            String type = metaType == null ? "" : metaType.toLowerCase(java.util.Locale.US);
            if (type.contains("movie") || type.contains("film")) {
                return "movie";
            }
            return episode > 0 ? "series" : "movie";
        }
    }

    /** Pure decision logic (no android classes), unit tested standalone. */
    static final class Gate {
        static final long TAIL_MS = 60000L;
        static final double TAIL_RATIO = 0.97;

        private Gate() {
        }

        /** Position is in the last 60 s or at 97% or more of a known duration. */
        static boolean nearEnd(long position, long duration) {
            if (duration <= 0L || position < 0L) return false;
            return position >= (long) (duration * TAIL_RATIO) || duration - position <= TAIL_MS;
        }

        /**
         * Real completion: the player reported a natural end AND the position is near the end. A
         * natural end without any position (player gave none) counts only when the caller found a
         * known duration and enough open time (fallbackOk). Back/Home never reports a natural end.
         */
        static boolean isRealCompletion(boolean launched, boolean reportedEnd, long position,
                                        long duration, boolean fallbackOk) {
            if (!launched || !reportedEnd) return false;
            if (duration > 0L) return nearEnd(position, duration);
            return position <= 0L && fallbackOk;
        }

        private static boolean known(String a, String b) {
            return a != null && b != null && a.length() > 0 && b.length() > 0;
        }

        /**
         * A startStreamPlayback that must not open the internal player: it arrives within windowMs
         * of an external result for the SAME video. Unknown ids block only when no binge is
         * pending (a pending binge is the next episode and must go through).
         */
        static boolean blocksReentry(long now, long resultAt, String resultVideoId, String incoming,
                                     boolean pending, long windowMs) {
            if (resultAt <= 0L || now < resultAt || now - resultAt > windowMs) return false;
            if (known(resultVideoId, incoming)) return resultVideoId.equals(incoming);
            return !pending;
        }

        /**
         * The launch failed: the session is still open and is the same launch, yet no activity of
         * this app was paused since (a started external player or chooser always pauses the caller).
         */
        static boolean launchFailed(boolean sessionOpen, boolean sameLaunch, boolean pausedSinceLaunch) {
            return sessionOpen && sameLaunch && !pausedSinceLaunch;
        }

        /** An external result for this exact video came back within windowMs. */
        static boolean recentReturn(long now, long resultAt, String resultVideoId, String videoId,
                                    long windowMs) {
            if (resultAt <= 0L || now < resultAt || now - resultAt > windowMs) return false;
            return known(resultVideoId, videoId) && resultVideoId.equals(videoId);
        }

        /**
         * Compose builds: this launch follows a real completion and starts the NEXT episode. Needs an armed
         * flag no older than ttlMs, binge on, an episode id (a movie or an unknown id never binges) and a
         * video other than the one that just finished (the same video again is a replay).
         */
        static boolean composeBingeLaunch(boolean armed, long armedAgoMs, boolean enabled,
                                          String incomingVideoId, String finishedVideoId, long ttlMs) {
            if (!armed || !enabled) return false;
            if (armedAgoMs < 0L || armedAgoMs > ttlMs) return false;
            if (incomingVideoId == null || incomingVideoId.length() == 0) return false;
            if (Ids.parse(incomingVideoId).episode <= 0) return false;
            return !incomingVideoId.equals(finishedVideoId);
        }

        static long completionDuration(long reportedDuration, long knownDuration, long startMs, long openMs) {
            long clampedStart = Math.max(startMs, 0L);
            long clampedOpen = Math.max(openMs, 0L);
            if (reportedDuration > 0L) return reportedDuration;
            if (knownDuration > 0L) return knownDuration;
            return clampedStart + clampedOpen;
        }

        static boolean isEofResult(String action, int resultCode, long position, long duration) {
            if (resultCode != -1 || position != 0L || duration != 0L || action == null) return false;
            return "org.videolan.vlc.player.result".equals(action)
                    || "org.videolan.vlc.debug.player.result".equals(action)
                    || "is.xyz.mpv.MPVActivity.result".equals(action);
        }

        static boolean eofIsCompletion(long playedMs, long knownDuration, long startMs) {
            if (knownDuration <= 0L || playedMs < 10000L) {
                return false;
            }
            long remaining = Math.max(knownDuration - Math.max(startMs, 0L), 0L);
            return playedMs >= (long) (remaining * 0.9);
        }

        /** No known duration and no meta runtime: wall-clock playing time that counts as a finished episode. */
        static final long UNKNOWN_DURATION_MIN_PLAY_MS = 15L * 60000L;

        /**
         * Bare end-of-file result (position 0, duration 0). With a known duration the 90% rule above decides.
         * Without any (Compose builds whose launch saw neither the player nor the meta runtime), the result
         * counts as completion only when the player ran at least 15 minutes of wall-clock time (pauses
         * included) AND the next episode exists: a stream error or an early quit does not survive both.
         */
        static boolean eofIsCompletion(long playedMs, long knownDuration, long startMs, boolean nextEpisodeKnown) {
            if (knownDuration > 0L) return eofIsCompletion(playedMs, knownDuration, startMs);
            return nextEpisodeKnown && playedMs >= UNKNOWN_DURATION_MIN_PLAY_MS;
        }
    }

    /** StreamAutoPick: this video came back from an external player moments ago. */
    public static boolean returnedRecently(String videoId) {
        resumeCheck();
        return Gate.recentReturn(System.currentTimeMillis(), resultAt, resultVideoId, videoId,
                RETURN_WINDOW_MS);
    }

    /** A genuine user navigation (episode selected): forget the last external return. */
    public static void clearReturnGuard() {
        resultAt = 0L;
    }

    /** Video id of a PlayerFragment (nav args, else the arguments bundle), or "". */
    private static String videoIdOf(Object fragment) {
        try {
            Object args = invoke(fragment, "getArgs");
            String id = args == null ? "" : string(invoke(args, "getVideoId"));
            if (id.length() > 0) return id;
        } catch (Throwable ignored) {
        }
        try {
            Object args = fragment.getClass().getMethod("getArguments").invoke(fragment);
            if (args instanceof Bundle) {
                String id = ((Bundle) args).getString("videoId");
                if (id == null || id.length() == 0) id = ((Bundle) args).getString("id");
                return id == null ? "" : id;
            }
        } catch (Throwable ignored) {
        }
        return "";
    }

    /** The six PlayerFragmentArgs strings PlayerFragment.onCreate passes to initiateState, or null. */
    private static String[] loadArgsOf(Object fragment) {
        try {
            Object args = invoke(fragment, "getArgs");
            if (args == null) return null;
            String[] out = new String[6];
            String[] getters = {"getStreamData", "getStreamAddonUrl", "getMetaAddonUrl", "getType",
                    "getId", "getVideoId"};
            for (int i = 0; i < getters.length; i++) {
                Object value = invoke(args, getters[i]);
                out[i] = value == null ? null : String.valueOf(value);
            }
            return out[0] == null || out[0].length() == 0 ? null : out;
        } catch (Throwable ignored) {
            return null;
        }
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
            playerFragment = new java.lang.ref.WeakReference<>(fragment);
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
                Ids ids = Ids.parse(videoId);
                imdb = ids.imdb;
                season = ids.season;
                episode = ids.episode;
            }

            String mediaType = normalizeMediaType(metaType, season, episode);
            String title = metaName.length() > 0 ? metaName : videoTitle;

            // Addon subtitles known to the player state, with the proxied (playable) URIs.
            List<String> subUris = new ArrayList<>();
            List<String> subNames = new ArrayList<>();
            List<String> subOrigins = new ArrayList<>();
            List<String> subLangs = new ArrayList<>();
            String userLang = "";
            String userAudioLang = "";
            try {
                Object settings = viewModel == null ? null : invoke(viewModel, "getSettings");
                userLang = settings == null ? "" : string(invoke(settings, "getSubtitlesLanguage"));
                userAudioLang = settings == null ? "" : string(invoke(settings, "getAudioLanguage"));
            } catch (Throwable ignored) {
            }
            try {
                Object subs = state == null ? null : invoke(state, "getSubtitles");
                if (subs instanceof Map && viewModel != null) {
                    for (Map.Entry<?, ?> entry : ((Map<?, ?>) subs).entrySet()) {
                        Object list = entry.getValue();
                        Object key = entry.getKey();
                        String entryLang = key instanceof java.util.Locale
                                ? ((java.util.Locale) key).toLanguageTag() : string(key);
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
                            subLangs.add(entryLang);
                        }
                    }
                }
            } catch (Throwable error) {
                Log.w(TAG, "capture subtitles", error);
            }

            // The selected text track: an addon subtitle when its id matches one of the
            // addon URLs (Stremio sets the track id to the subtitle URL), else embedded.
            String enableUri = "";
            int enableIdx = -1;
            String subLang = "";
            String subLabel = "";
            String subTrackId = "";
            int subIndex = -1;
            try {
                Object playerObject = field(fragment, "player");
                Sel sel = M3.selectedText(playerObject, subOrigins, subUris);
                enableUri = sel.enableUri;
                enableIdx = sel.enableIdx;
                subLang = sel.lang;
                subLabel = sel.label;
                subTrackId = sel.trackId;
                subIndex = sel.index;
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
            capSubLangs = subLangs.toArray(new String[0]);
            capEnableIdx = enableIdx;
            capUserLang = userLang;
            capUserAudioLang = userAudioLang;
            capEnableUri = enableUri;
            capSubLang = subLang;
            capSubLabel = subLabel;
            capSubTrackId = subTrackId;
            capSubIndex = subIndex;
            capVideoId = videoIdOf(fragment);
            capLoadArgs = loadArgsOf(fragment);
            capDuration = knownDurationOf(fragment, meta);
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

    /** Same as remember(), for a launcher whose first parameter type is not declared as Context (an Activity in 1.12.0). */
    public static void rememberFrom(Object context) {
        try {
            if (context instanceof Context) {
                remember((Context) context);
            }
        } catch (Throwable error) {
            Log.w(TAG, "rememberFrom", error);
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
            if (System.currentTimeMillis() - capturedAt > SNAPSHOT_TTL_MS) {
                capturePort();
            }
            launchedAt = System.currentTimeMillis();
            externalSessionOpen = true;
            launchVideoId = launchedAt - capturedAt <= SNAPSHOT_TTL_MS ? capVideoId : "";
            launchDuration = launchedAt - capturedAt <= SNAPSHOT_TTL_MS ? capDuration : 0L;
            String[] loadArgs = launchedAt - capturedAt <= SNAPSHOT_TTL_MS ? capLoadArgs : null;
            // Only for the same episode (a stale snapshot from the previous binge launch is not used).
            launchLoadArgs = loadArgs != null && loadArgs[5] != null && loadArgs[5].equals(launchVideoId)
                    ? loadArgs : null;
            resultAt = 0L;
            boolean armed = BINGE_ARMED.getAndSet(false);
            long armedAt = bingeArmedAt;
            try {
                Context context = appContext;
                if (context != null) {
                    android.content.SharedPreferences prefs =
                            context.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE);
                    armed = armed || prefs.getBoolean(KEY_PENDING, false);
                    armedAt = Math.max(armedAt, prefs.getLong(KEY_ARMED_AT, 0L));
                    prefs.edit().putBoolean(KEY_PENDING, false).apply();
                }
            } catch (Throwable ignored) {
            }
            // Compose builds have no startStreamPlayback hook: the launch that follows a real completion
            // (stock opened the next episode and starts the player) is the binge relaunch. It is marked
            // in flight so ensureExplicitPlayer() addresses the learned player, never a chooser.
            if (composeBinge() && Gate.composeBingeLaunch(armed, launchedAt - armedAt, isBingeEnabled(),
                    launchVideoId, resultVideoId, COMPOSE_BINGE_TTL_MS)) {
                bingeInFlightUntil = launchedAt + BINGE_INFLIGHT_MS;
                Log.i(TAG, "binge: compose relaunch of " + clip(launchVideoId) + " after "
                        + clip(resultVideoId == null ? "" : resultVideoId));
            }
            stopInternalPlayer(lastBingeFragment == null ? null : lastBingeFragment.get());
            ensureExplicitPlayer(intent);
            applyHandoff(intent);
            // One-ahead hand-off: attached only when already verified for this exact
            // link; never waited for, so a slow check simply launches without it.
            try {
                String oa = app.tikkamasalla.stremio.oneahead.OneAheadTrigger.handoffFor(
                        appContext, launchVideoId, String.valueOf(intent.getData()));
                if (oa != null) {
                    intent.putExtra(app.tikkamasalla.stremio.oneahead.OneAheadShow.EXTRA, oa);
                    Log.i(TAG, "one-ahead hand-off attached vid=" + launchVideoId);
                }
            } catch (Throwable ignored) {
                // One-ahead is optional.
            }
            int position = intent.getIntExtra("startfrom", 0);
            intent.putExtra("return_result", true);
            intent.putExtra("startfrom", position);
            String target = resolveTarget(intent);
            launchTarget = target == null ? "" : target;
            applyMxComponent(intent, target);
            if (target != null && target.startsWith("org.videolan.vlc")) {
                intent.putExtra("position", (long) position);
                intent.putExtra("from_start", position <= 0);
            } else {
                intent.putExtra("position", position);
            }
            if (target != null && target.length() > 0) setLastPlayer(target);
            Log.i(TAG, "launch position=" + position + " target=" + target);
            PlaybackDiary.ev(appContext, "ext.launch", "app", "stremio", "player", target, "pos", position, "vid", launchVideoId, "title", capTitle, "type", capMediaType, "id", capImdb, "s", capSeason, "e", capEpisode, "host", PlaybackDiary.host(String.valueOf(intent.getData())), "binge", armed);
            beginHandoff(intent, position, target);
            if (!"movie".equals(capMediaType)) {
                java.lang.ref.WeakReference<Object> pf = playerFragment;
                app.tikkamasalla.stremio.introskip.NextPrep.onExternalLaunch(appContext, launchVideoId,
                        composeBinge() || pf == null ? null : pf.get());
            }
            // Last step: the extras above are copied into the chooser's inner intent.
            if (target != null && Players.isResolver(target)) ChooserPick.wrapInPlace(appContext, intent);
            keepAlive(true);
            watchLaunch(launchedAt);
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
            applyVimuTracks(intent);
            if (capSubUris.length > 0) {
                String pkg = intent.getComponent() != null
                        ? intent.getComponent().getPackageName() : intent.getPackage();
                boolean isVimu = pkg != null && pkg.startsWith("net.gtvbox.");
                if (!isVimu) {
                    android.net.Uri[] uris = new android.net.Uri[capSubUris.length];
                    for (int i = 0; i < capSubUris.length; i++) {
                        uris[i] = android.net.Uri.parse(capSubUris[i]);
                    }
                    intent.putExtra("subs", uris);
                    intent.putExtra("subs.name", capSubNames);
                } else {
                    applyVimuSubs(intent);
                }
                if (capEnableUri.length() > 0) {
                    intent.putExtra("subs.enable",
                            new android.net.Uri[]{android.net.Uri.parse(capEnableUri)});
                }
                if (Players.isVlc(resolveTarget(intent))) {
                    applyVlcSubs(intent);
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

    /**
     * Vimu: hands over a short filtered list (selected first, then the user's language, then
     * English, no SDH labels, max 6). Everything is built before the first putExtra, so any
     * failure leaves the Intent exactly as it was.
     */
    private static void applyVimuSubs(Intent intent) {
        try {
            String[] uris = capSubUris;
            String[] names = capSubNames;
            String[] langs = capSubLangs;
            if (uris.length == 0 || names.length != uris.length || langs.length != uris.length) {
                return;
            }
            List<Integer> picked = SubPick.pick(java.util.Arrays.asList(names),
                    java.util.Arrays.asList(langs), capEnableIdx, capUserLang);
            if (picked.isEmpty()) {
                return;
            }
            android.net.Uri[] outUris = new android.net.Uri[picked.size()];
            String[] outNames = new String[picked.size()];
            String[] outLangs = new String[picked.size()];
            for (int i = 0; i < outUris.length; i++) {
                int k = picked.get(i);
                outUris[i] = android.net.Uri.parse(uris[k]);
                outNames[i] = names[k];
                outLangs[i] = langs[k];
            }
            intent.putExtra("subs", outUris);
            intent.putExtra("subs.name", outNames);
            intent.putExtra("subs.lang", outLangs);
            Log.i(TAG, "vimu subs picked " + picked.size() + " of " + uris.length);
        } catch (Throwable error) {
            Log.w(TAG, "applyVimuSubs", error);
        }
    }

    private static void applyVimuTracks(Intent intent) {
        try {
            String pkg = intent.getComponent() != null 
                    ? intent.getComponent().getPackageName() 
                    : intent.getPackage();

            if (pkg == null || !pkg.startsWith("net.gtvbox.")) {
                return;
            }

            HashMap<String, Object> map = new HashMap<>();
            // tt shows as before; Kitsu shows share memory under kitsu:ID (TrackMemory.showKey).
            String show = TrackMemory.showKey(capImdb);
            if (show.length() == 0) {
                show = TrackMemory.showKey(launchVideoId);
            }
            if (show.length() > 0) {
                Context ctx = journalContext();
                TrackMemory.Entry e = TrackMemory.load(ctx, show);
                if (e == null) {
                    e = new TrackMemory.Entry();
                    e.show = show;
                }

                e.avoidSdh = SdhPrefs.isAvoidEnabled(ctx);
                TrackMemory.toExtras(e, map);
                TrackMemory.logSend(e);
                PlaybackDiary.ev(ctx, "tracks", "src", e.isEmpty() ? "default" : "memory", "show", show, "sel", e.toString(), "avoid_sdh", e.avoidSdh);
            }
            // Ids without a show key (tmdb) have no per-show memory, but Vimu still gets the profile languages.
            userLangExtras(capUserAudioLang, capUserLang, map);
            PlaybackDiary.ev("tracks", "src", "profile", "audio", capUserAudioLang, "sub", capUserLang);
            if (map.isEmpty()) {
                return;
            }

            // Everything computed successfully, now apply to Intent
            for (Map.Entry<String, Object> mapEntry : map.entrySet()) {
                String key = mapEntry.getKey();
                if (TrackMemory.X_MANUAL.equals(key)) {
                    continue;
                }
                Object val = mapEntry.getValue();
                if (val instanceof String) {
                    intent.putExtra(key, (String) val);
                } else if (val instanceof Boolean) {
                    intent.putExtra(key, (boolean) (Boolean) val);
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "applyVimuTracks", error);
        }
    }

    static final String X_USER_AUDIO_LANG = "tikka.tracks.user_audio_lang";
    static final String X_USER_SUB_LANG = "tikka.tracks.user_sub_lang";

    /** The profile's audio/subtitle languages as ISO 639-2 extras for Vimu; blank or "null" parts are omitted. */
    static void userLangExtras(String audio, String sub, Map<String, Object> out) {
        String a = userLang3(audio);
        String s = userLang3(sub);
        if (a.length() > 0) out.put(X_USER_AUDIO_LANG, a);
        if (s.length() > 0) out.put(X_USER_SUB_LANG, s);
    }

    private static String userLang3(String raw) {
        if (raw == null) return "";
        String t = raw.trim();
        if (t.length() == 0 || "null".equalsIgnoreCase(t)) return "";
        return TrackMemory.lang3(t);
    }

    private static TrackMemory.Entry resultTracks(Bundle extras, HandoffRecord rec) {
        try {
            TrackMemory.Entry entry = null;

            if (extras != null) {
                HashMap<String, Object> map = new HashMap<>();
                String[] keys = {
                    TrackMemory.X_SHOW, TrackMemory.X_AUDIO_LANG, TrackMemory.X_AUDIO_LABEL,
                    TrackMemory.X_SUB_LANG, TrackMemory.X_SUB_LABEL, TrackMemory.X_SUB_OFF,
                    TrackMemory.X_AVOID_SDH, TrackMemory.X_MANUAL
                };
                for (String key : keys) {
                    Object val = extras.get(key);
                    if (val != null) {
                        map.put(key, val);
                    }
                }
                entry = TrackMemory.fromExtras(map);
            }
            if (entry == null && rec != null) {
                entry = JournalClient.tracksFor(rec.launchId);
            }

            if (entry != null) {
                if (TrackMemory.showKey(entry.show).length() == 0) {
                    String vId = rec != null ? rec.videoId : launchVideoId;
                    entry.show = TrackMemory.showKey(vId);
                }
                return entry;
            }
        } catch (Throwable error) {
            Log.w(TAG, "resultTracks", error);
        }
        return null;
    }

    private static void storeVimuTracks(Context ctx, TrackMemory.Entry e) {
        try {
            if (e == null) {
                return;
            }
            boolean stored = e.manual && TrackMemory.store(ctx, e);
            TrackMemory.logVimu(e, stored);
            PlaybackDiary.ev(ctx, "tracks.result", "show", e.show, "sel", e.toString(), "manual", e.manual, "stored", stored);
        } catch (Throwable error) {
            Log.w(TAG, "storeVimuTracks", error);
        }
    }

    /**
     * Snapshot for builds without the PlayerFragment hook (Stremio 1.10.x, 1.12.x, phone 2.x): media
     * identity from the core's player load (PortHooks, fed by Core.dispatch). No subtitles or
     * title: the core's player model is not read here. Used only when captureExternal() did not
     * just run, so 1.6.12 keeps its own snapshot.
     */
    private static void capturePort() {
        try {
            String videoId = PortHooks.streamId();
            if (videoId == null || videoId.length() == 0) {
                return;
            }
            Ids ids = Ids.parse(videoId);
            String type = PortHooks.streamType();
            capMediaType = normalizeMediaType(type, ids.season, ids.episode);
            capImdb = ids.imdb;
            capTitle = "";
            capSeason = ids.season;
            capEpisode = ids.episode;
            capSubUris = new String[0];
            capSubNames = new String[0];
            capSubLangs = new String[0];
            capEnableIdx = -1;
            capUserLang = "";
            capUserAudioLang = "";
            capEnableUri = "";
            capSubLang = "";
            capSubLabel = "";
            capSubTrackId = "";
            capSubIndex = -1;
            capVideoId = videoId;
            capDuration = portDurationOf(videoId);
            capturedAt = System.currentTimeMillis();
            Log.i(TAG, "capture(port) type=" + capMediaType + " video=" + clip(videoId)
                    + " S" + ids.season + "E" + ids.episode + " dur=" + capDuration);
        } catch (Throwable error) {
            Log.w(TAG, "capturePort", error);
        }
    }

    /** Selected text track found by M3.selectedText (no media3 types, safe on every build). */
    static final class Sel {
        String enableUri = "";
        int enableIdx = -1;
        String lang = "";
        String label = "";
        String trackId = "";
        int index = -1;
    }

    /**
     * Every use of androidx.media3 lives here and is reached only inside try/catch(Throwable):
     * Stremio 1.12.0 and 2.5.0 rename Media3, and ExternalProgress itself must load without it.
     */
    private static final class M3 {
        static void stop(Object playerObject) {
            if (playerObject instanceof androidx.media3.common.Player) {
                androidx.media3.common.Player player = (androidx.media3.common.Player) playerObject;
                player.setPlayWhenReady(false);
                player.pause();
                player.stop();
            }
        }

        static boolean isPlaying(Object playerObject) {
            return playerObject instanceof androidx.media3.common.Player
                    && ((androidx.media3.common.Player) playerObject).isPlaying();
        }

        static long durationOf(Object playerObject) {
            if (playerObject instanceof androidx.media3.common.Player) {
                return ((androidx.media3.common.Player) playerObject).getDuration();
            }
            return -1L;
        }

        /** {position, duration}, or null when the object is not a media3 Player. */
        static long[] positionDuration(Object playerObject) {
            if (!(playerObject instanceof androidx.media3.common.Player)) return null;
            androidx.media3.common.Player player = (androidx.media3.common.Player) playerObject;
            return new long[]{player.getCurrentPosition(), player.getDuration()};
        }

        static Sel selectedText(Object playerObject, List<String> subOrigins, List<String> subUris) {
            Sel sel = new Sel();
            if (!(playerObject instanceof androidx.media3.common.Player)) return sel;
            androidx.media3.common.Tracks tracks =
                    ((androidx.media3.common.Player) playerObject).getCurrentTracks();
            int textIndex = 0;
            for (androidx.media3.common.Tracks.Group group : tracks.getGroups()) {
                if (group.getType() != 3) {
                    continue;
                }
                for (int i = 0; i < group.length; i++) {
                    if (!group.isTrackSelected(i)) {
                        textIndex++;
                        continue;
                    }
                    androidx.media3.common.Format format = group.getTrackFormat(i);
                    String id = format == null ? "" : safe(format.id);
                    String match = "";
                    for (int j = 0; j < subOrigins.size(); j++) {
                        if (SubPick.idMatchesOrigin(id, subOrigins.get(j))) {
                            match = subUris.get(j);
                            sel.enableIdx = j;
                            break;
                        }
                    }
                    if (match.length() > 0) {
                        sel.enableUri = match;
                    } else {
                        sel.lang = format == null ? "" : safe(format.language);
                        sel.label = format == null ? "" : safe(format.label);
                        sel.trackId = id;
                        sel.index = textIndex;
                    }
                    textIndex++;
                }
            }
            return sel;
        }
    }

    private static String normalizeMediaType(String metaType, int season, int episode) {
        return Ids.mediaType(metaType, season, episode);
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
    private static volatile String parsedVideoId = "";
    private static volatile long parsedAt;
    private static volatile long launchedAt;
    private static volatile boolean externalSessionOpen;
    private static volatile long bingeInFlightUntil;
    private static volatile java.lang.ref.WeakReference<Object> lastBingeFragment;
    private static final java.util.concurrent.atomic.AtomicBoolean BINGE_ARMED =
            new java.util.concurrent.atomic.AtomicBoolean(false);
    private static final java.util.concurrent.atomic.AtomicInteger BINGE_SEQ =
            new java.util.concurrent.atomic.AtomicInteger(0);
    private static final long MIN_OPEN_MS = 10000L;
    private static final double FULL_RATIO = 0.9;
    private static final String KEY_ARMED_AT = "external_binge_armed_at";
    /**
     * How long after a real completion the next episode's start still counts as the binge relaunch.
     * 180 s (was 60 s on 1.6.12): the next stream can take longer than a minute when the addon or
     * debrid is slow to resolve it, and an expired flag opened the next episode in the internal
     * player. Same window as the Compose builds (J4); the flag is cleared when consumed.
     */
    private static final long BINGE_TTL_MS = 180000L;

    private static final long BINGE_INFLIGHT_MS = 15000L;
    /** Compose builds: same window as BINGE_TTL_MS (one number for both flows). */
    private static final long COMPOSE_BINGE_TTL_MS = BINGE_TTL_MS;
    private static volatile long bingeArmedAt;
    private static final long LAUNCH_WATCH_MS = 8000L;
    private static volatile boolean pausedSinceLaunch;
    private static volatile android.app.Application.ActivityLifecycleCallbacks launchCallbacks;

    public static Object parse(int resultCode, Intent data) {
        boolean hadLaunch = launchedAt > 0L || externalSessionOpen;
        // The episode this result belongs to, for onExternalResult (unknown when no launch was seen).
        parsedVideoId = hadLaunch ? launchVideoId : "";
        parsedAt = System.currentTimeMillis();
        stopHeartbeat();
        keepAlive(false);
        externalSessionOpen = false;
        bingeInFlightUntil = 0L;
        if (hadLaunch) {
            // Outlives the stock result handler: maybeBinge blocks a same-video replay for a few seconds.
            resultVideoId = launchVideoId;
            resultAt = System.currentTimeMillis();
        }
        try {
            Context ctx = journalContext();
            HandoffRecord rec = HandoffRecord.load(ctx);
            long startMs = rec == null ? 0L : rec.startMs;
            long stamp = launchedAt > 0L ? launchedAt : (rec == null ? 0L : rec.launchedAt);
            long playedMs = stamp > 0L ? System.currentTimeMillis() - stamp : Long.MAX_VALUE;
            String action = null;
            String endBy = null;
            long position = 0L;
            long duration = 0L;
            if (data != null) {
                action = data.getAction();
                Bundle extras = data.getExtras();
                position = readLong(extras, "extra_position", "position");
                duration = readLong(extras, "extra_duration", "duration");
                endBy = extras != null ? extras.getString("end_by") : null;
                learnPlayer(action);
            } else {
                Log.i(TAG, "result code=" + resultCode + " without data");
            }
            long launchStamp = launchedAt;
            long openMs = launchStamp > 0L ? System.currentTimeMillis() - launchStamp : 0L;
            launchedAt = 0L;

            long knownNow = launchDuration > 0L ? launchDuration : lastDuration;
            if (knownNow <= 0L) knownNow = portDurationOf(launchVideoId); // the meta may have arrived after the launch
            final long known = knownNow;

            // Real completion only: the player reported a natural end AND the position is in the last
            // 60 s or at 97% or more (Gate.isRealCompletion). Back/Home at any position, a premature
            // end (stream error at 40%), a quick error return, or a duplicate result after
            // launchedAt was already consumed (launchStamp == 0L) is never one.
            boolean reportedEnd = data != null && ("playback_completion".equals(endBy)
                    || ("net.gtvbox.videoplayer.result".equals(action) && resultCode == 1));
            boolean completed = false;
            if (data != null && launchStamp > 0L) {
                if (reportedEnd) {
                    // A player that ends naturally but omits the duration: the known one judges the position.
                    completed = Gate.isRealCompletion(true, true, position,
                            duration > 0L ? duration : (position > 0L ? known : 0L),
                            openMs >= MIN_OPEN_MS);
                } else if (Gate.isEofResult(action, resultCode, position, duration)) {
                    boolean nextKnown = known <= 0L && PortHooks.hadNextVideoFor(launchVideoId);
                    completed = Gate.eofIsCompletion(openMs, known, startMs, nextKnown);
                    Log.i(TAG, "eof-guard action=" + action + " played=" + openMs + " known=" + known + " start=" + startMs
                            + (known <= 0L ? " next=" + nextKnown : "") + " -> " + (completed ? "completed" : "stopped early"));
                }
            }
            if (completed) {
                duration = Gate.completionDuration(duration, known, startMs, openMs);
                if (duration > 0L && position < (long) (duration * 0.95)) position = duration;
            }

            if (data != null) {
                Log.i(TAG, "completion known=" + known + " launchDuration=" + launchDuration + " openMs=" + openMs + " completed=" + completed);
            }

            // Progress journal: a result with no data (Vimu died) or no usable position is replaced
            // by the journal row of this launch. A result with a position never waits for the
            // journal (its moment is the receive time, never older than the last journal write).
            JournalPolicy.Row row = null;
            boolean journalEnd = false;
            String journalWhy = "fallback-no-position";
            if (rec != null && !completed && (data == null || position <= 0L || duration <= 0L)) {
                journalWhy = data == null ? "fallback-no-data" : "fallback-no-position";
                JournalPolicy.Row got = JournalClient.queryBounded(ctx, JOURNAL_QUERY_MS);
                String reject = JournalPolicy.reject(got, rec.launchId, rec.appliedAt);
                if (reject == null) {
                    row = got;
                    position = row.positionMs;
                    duration = row.durationMs;
                    journalEnd = JournalPolicy.rowCompleted(row);
                    if (journalEnd) position = duration;
                } else if (got != null) {
                    logRow(got, false, reject);
                }
            }
            storeVimuTracks(ctx, resultTracks(data != null ? data.getExtras() : null, rec));
            if (data == null && row == null) {
                PlaybackDiary.ev(ctx, "ext.result", "player", launchTarget, "code", resultCode, "nodata", true, "open_ms", openMs, "vid", parsedVideoId);
                return null; // stock handler: pops back, nothing to store
            }
            if (data != null) {
                Log.i(TAG, "result code=" + resultCode + " action=" + action + " position=" + position
                        + " duration=" + duration + " end_by=" + endBy + " completed=" + completed
                        + " reportedEnd=" + reportedEnd + " nearEnd=" + Gate.nearEnd(position, duration));
            }
            if (completed) {
                armBinge();
                // The binge opens the next episode's page: it may start the stream prepared during this one.
                app.tikkamasalla.stremio.introskip.NextPrep.expectNextAfter(
                        parsedVideoId != null && parsedVideoId.length() > 0 ? parsedVideoId : launchVideoId);
            }
            // Early-Back guard and the watched rule; a journal end never starts a binge.
            JournalPolicy.Outcome out = JournalPolicy.finish(position, duration,
                    completed || journalEnd, startMs, playedMs);
            if (out.keptStart) {
                Log.i(TAG, "early-back keep start=" + startMs + " pos=" + position);
            }
            if (row != null) {
                logRow(row, !out.keptStart, out.keptStart ? "early-back" : journalWhy);
            }
            PlaybackDiary.ev(ctx, "ext.result", "player", launchTarget, "code", resultCode, "pos", out.position, "dur", out.duration, "end_by", endBy, "open_ms", openMs, "decision", completed && isBingeEnabled() && !"movie".equals(capMediaType) ? "binge" : completed || out.watchedReason != null ? "watched" : "stopped-early", "kept_start", out.keptStart, "journal", row != null, "vid", parsedVideoId);
            if (rec != null) {
                if (data != null || (row != null && JournalPolicy.isFinal(row.state))) {
                    HandoffRecord.clear(ctx);
                } else if (row != null && !out.keptStart) {
                    HandoffRecord.saveApplied(ctx, row.updatedAt);
                }
            }
            if (completed) {
                return newResult(Math.max(position, 0L), Math.max(duration, 0L), true);
            }
            if (out.position > 0L && out.duration > 0L) {
                if (!stockResultHook()) {
                    // No hook sees the stock result handler on this build, and its watched rule divides
                    // duration by position (inverted): a real duration would mark every return as watched.
                    // It gets the position only, unless our own rule says watched: then the real values
                    // go through and the same stock rule produces the watched mark.
                    boolean watched = out.watchedReason != null;
                    Log.i(TAG, "result for stock handler: " + (watched ? "watched " : "position only ")
                            + "pos=" + out.position + " dur=" + out.duration);
                    return newResult(out.position, watched ? out.duration : 0L, false);
                }
                // Stock sees duration 0: no inverted-getProgress watched mark, and its UpdateProgress
                // is dropped; onExternalResult stores the real values and marks watched by our rule.
                Object stock = newResult(out.position, 0L, false);
                Pending stash = new Pending(stock, out.position, out.duration, out.watchedReason,
                        parsedVideoId);
                pending = stash;
                scheduleWatchdog(stash);
                return stock;
            }
            return newResult(Math.max(out.position, 0L), Math.max(out.duration, 0L), false);
        } catch (Throwable error) {
            Log.w(TAG, "parse", error);
            return null;
        }
    }

    /**
     * Builds the app's ExternalPlayerResult. The patch replaces this body with a direct constructor
     * call to the (possibly obfuscated) result class of the build; this reflective body is the
     * default, used as is when the patch could not generate it.
     */
    static Object newResult(long position, long duration, boolean completed) throws Exception {
        Constructor<?> constructor = Class.forName(RESULT_CLASS)
                .getConstructor(long.class, long.class, boolean.class);
        return constructor.newInstance(position, duration, completed);
    }

    /**
     * True when the stock result handler (PlayerFragment.onExternalPlayerResult) is hooked, which
     * is the 1.6.12 flow. The patch rewrites this to false on builds where that handler is not found.
     */
    static boolean stockResultHook() {
        return true;
    }

    /**
     * True on Compose builds (Stremio 1.10.x, 1.12.x, phone 2.x), where startStreamPlayback is not hooked and
     * decorate() decides the binge relaunch. The patch rewrites this to true when that hook is absent;
     * 1.6.12 keeps false and relaunches through maybeBinge().
     */
    static boolean composeBinge() {
        return false;
    }

    /**
     * Hook at the start of PlayerFragment.onExternalPlayerResult, before Stremio marks the episode
     * watched and opens the next one. For a completed result it first saves the full position in
     * the core, which creates or updates the library item (the stock completed branch never sends a
     * position, and marking watched is ignored for an episode without one), then marks the episode
     * watched. The mark is repeated after a short delay, because the core applies the progress
     * asynchronously, and only while the player still holds the same episode. A non-completed
     * result from parse() (position only, duration 0) is replaced here by the real position and
     * duration, with the watched mark only past the threshold (see JournalPolicy). Fails soft.
     */
    public static void onExternalResult(Object fragment, Object result) {
        try {
            if (fragment == null || result == null) {
                return;
            }
            boolean completed = Boolean.TRUE.equals(invoke(result, "getCompleted"));
            Pending stash = pending;
            if (!completed && stash != null) {
                long resPos = ((Number) invoke(result, "getPosition")).longValue();
                long resDur = ((Number) invoke(result, "getDuration")).longValue();
                if (stash.ref == result || (resDur == 0L && resPos == stash.pos
                        && System.currentTimeMillis() - stash.at < 5000L)) {
                    pending = null;
                    Object vm = invoke(fragment, "getViewModel");
                    if (vm != null) {
                        if (modelHolds(vm, stash.videoId)) {
                            applyPending(vm, stash);
                        } else {
                            logIgnored(vm, stash.videoId);
                        }
                    }
                }
                return;
            }
            if (!completed) {
                return;
            }
            final Object vm = invoke(fragment, "getViewModel");
            if (vm == null) {
                return;
            }
            // The id parse() stored for this very result (every parse() sets it, "" when no launch was seen).
            String finished = System.currentTimeMillis() - parsedAt < 5000L ? parsedVideoId : "";
            if (!modelHolds(vm, finished)) {
                logIgnored(vm, finished);
                return;
            }
            long duration = ((Number) invoke(result, "getDuration")).longValue();
            if (duration > 0L) {
                dispatchProgress(vm, duration, duration);
            }
            Log.i(TAG, "completed: progress saved and marked watched " + currentVideoId(vm));
            markWatched(vm, duration, duration, "completion");
        } catch (Throwable error) {
            Log.w(TAG, "onExternalResult", error);
        }
    }

    /** True when the model holds the wanted episode, or either id is unknown (then nothing is refused). */
    private static boolean modelHolds(Object vm, String wantVideoId) {
        if (wantVideoId == null || wantVideoId.length() == 0) return true;
        String current = currentVideoId(vm);
        return current.length() == 0 || wantVideoId.equals(current);
    }

    private static void logIgnored(Object vm, String wantVideoId) {
        Log.i(TAG, "result ignored: model holds " + clip(currentVideoId(vm)) + " not " + clip(wantVideoId));
    }

    private static void applyPending(Object vm, Pending stash) {
        dispatchProgress(vm, stash.pos, stash.dur);
        if (stash.watchedReason != null) {
            markWatched(vm, stash.pos, stash.dur, stash.watchedReason);
        }
    }

    /** Stores a position through the stock path (UpdateProgress -> playerTimeChanged). */
    private static void dispatchProgress(Object vm, long position, long duration) {
        try {
            ClassLoader loader = vm.getClass().getClassLoader();
            Class<?> updateClass = Class.forName(
                    "com.stremio.common.viewmodels.state.VideoPlaybackState$UpdateProgress",
                    false, loader);
            Object update = updateClass.getConstructor(long.class, long.class)
                    .newInstance(position, duration);
            invoke(vm, "onStateChange", update);
        } catch (Throwable error) {
            Log.w(TAG, "dispatchProgress", error);
        }
    }

    /**
     * The watched mark, repeated twice because the core applies progress asynchronously. markAsWatched
     * always acts on the episode the model holds, so a retry runs only while that is still the finished
     * one; after a binge switch it would mark the next episode, so it is skipped (and logged). The
     * early retry lands before the switch, the late one covers a slow core.
     */
    private static void markWatched(final Object vm, long position, long duration, String reason) {
        try {
            final String videoId = currentVideoId(vm);
            invoke(vm, "markAsWatched");
            Log.i(TAG, "watched mark pos=" + position + " dur=" + duration + " reason=" + reason);
            retryMark(vm, videoId, 500L);
            retryMark(vm, videoId, 1500L);
        } catch (Throwable error) {
            Log.w(TAG, "markWatched", error);
        }
    }

    private static void retryMark(final Object vm, final String videoId, long delayMs) {
        new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    String current = currentVideoId(vm);
                    if (videoId.length() > 0 && videoId.equals(current)) {
                        invoke(vm, "markAsWatched");
                        Log.i(TAG, "completed: marked watched again " + videoId);
                    } else {
                        Log.i(TAG, "watched retry skipped: model moved to " + clip(current)
                                + " from " + clip(videoId));
                    }
                } catch (Throwable error) {
                    Log.w(TAG, "mark watched again", error);
                }
            }
        }, delayMs);
    }

    /** If onExternalResult never consumed the stash (hook missing, screen gone), apply it here. */
    private static void scheduleWatchdog(final Pending stash) {
        new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    if (pending != stash) return;
                    pending = null;
                    Object vm = loadedVm(stash.videoId);
                    Log.i(TAG, "pending result not consumed: " + (vm != null ? "applied"
                            : stash.videoId.length() > 0 ? "dropped (model holds another episode)" : "dropped"));
                    if (vm != null) applyPending(vm, stash);
                } catch (Throwable error) {
                    Log.w(TAG, "watchdog", error);
                }
            }
        }, 3000L);
    }

    private static void logRow(JournalPolicy.Row row, boolean applied, String why) {
        Log.i(TAG, "journal r launch=" + row.launchId + " pos=" + row.positionMs + " dur="
                + row.durationMs + " state=" + row.state + " applied=" + applied + " why=" + why);
    }

    /** App context, also in a restarted process before any launch hook ran. */
    private static Context journalContext() {
        Context context = appContext;
        if (context != null) return context;
        try {
            Object app = Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication").invoke(null);
            if (app instanceof Context) remember((Context) app);
        } catch (Throwable ignored) {
        }
        return appContext;
    }

    /** The player view model when it holds an episode (and the wanted one, if given), else null. */
    private static Object loadedVm(String wantVideoId) {
        try {
            java.lang.ref.WeakReference<Object> ref = playerFragment;
            Object fragment = ref == null ? null : ref.get();
            Object vm = fragment == null ? null : invoke(fragment, "getViewModel");
            String current = vm == null ? "" : currentVideoId(vm);
            if (current.length() == 0) return null;
            if (wantVideoId != null && wantVideoId.length() > 0 && !wantVideoId.equals(current)) return null;
            return vm;
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** Launch id extra, outstanding-handoff record, and the journal heartbeat (Vimu only). */
    private static void beginHandoff(Intent intent, int position, String target) {
        try {
            stopHeartbeat();
            String id = java.util.UUID.randomUUID().toString();
            intent.putExtra("tikka.launch_id", id);
            Context ctx = journalContext();
            if (ctx == null) return;
            HandoffRecord rec = new HandoffRecord(id, launchVideoId, position, launchedAt, 0L);
            rec.loadArgs = launchLoadArgs;
            HandoffRecord.save(ctx, rec);
            if (target != null && target.startsWith("net.gtvbox.")) startHeartbeat(ctx, rec);
        } catch (Throwable error) {
            Log.w(TAG, "beginHandoff", error);
        }
    }

    /**
     * Stremio launches the Intent in its own lambda and only toasts when that throws (no player
     * installed, ActivityNotFound), so no hook sees the failure. A started external player (or a
     * chooser) always pauses the calling activity within a moment; if nothing was paused after
     * LAUNCH_WATCH_MS the launch did not happen and abandonLaunch() undoes what decorate() set.
     */
    private static void watchLaunch(final long token) {
        try {
            Context context = appContext;
            if (!(context instanceof android.app.Application)) return;
            final android.app.Application app = (android.app.Application) context;
            unwatchLaunch(app);
            pausedSinceLaunch = false;
            final android.app.Application.ActivityLifecycleCallbacks callbacks = new LaunchWatch();
            launchCallbacks = callbacks;
            app.registerActivityLifecycleCallbacks(callbacks);
            new android.os.Handler(android.os.Looper.getMainLooper()).postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (launchCallbacks == callbacks) unwatchLaunch(app);
                        if (Gate.launchFailed(externalSessionOpen, launchedAt == token, pausedSinceLaunch)) {
                            abandonLaunch();
                        }
                    } catch (Throwable error) {
                        Log.w(TAG, "launch watch", error);
                    }
                }
            }, LAUNCH_WATCH_MS);
        } catch (Throwable error) {
            Log.w(TAG, "watchLaunch", error);
        }
    }

    private static void unwatchLaunch(android.app.Application app) {
        try {
            android.app.Application.ActivityLifecycleCallbacks callbacks = launchCallbacks;
            launchCallbacks = null;
            if (callbacks != null && app != null) app.unregisterActivityLifecycleCallbacks(callbacks);
        } catch (Throwable ignored) {
        }
    }

    /** Records that an activity of this app paused, which is what a started external launch does. */
    private static final class LaunchWatch implements android.app.Application.ActivityLifecycleCallbacks {
        @Override public void onActivityPaused(android.app.Activity activity) { pausedSinceLaunch = true; }
        @Override public void onActivityCreated(android.app.Activity activity, Bundle state) { }
        @Override public void onActivityStarted(android.app.Activity activity) { }
        @Override public void onActivityResumed(android.app.Activity activity) { }
        @Override public void onActivityStopped(android.app.Activity activity) { }
        @Override public void onActivitySaveInstanceState(android.app.Activity activity, Bundle state) { }
        @Override public void onActivityDestroyed(android.app.Activity activity) { }
    }

    /**
     * The external launch never happened: clear the in-flight and session flags, stop the
     * keep-alive service and heartbeat, and drop the outstanding-handoff record, so Stremio's own
     * player is not suppressed and no "Saving watch progress" notification is left.
     */
    private static void abandonLaunch() {
        Log.w(TAG, "external launch did not start: clearing session");
        stopHeartbeat();
        externalSessionOpen = false;
        bingeInFlightUntil = 0L;
        launchedAt = 0L;
        launchVideoId = "";
        BINGE_ARMED.set(false);
        keepAlive(false);
        HandoffRecord.clear(journalContext());
    }

    private static void stopHeartbeat() {
        heartbeatGen++;
    }

    /** Every 10 s while the Vimu session is open: read the journal row, feed it to the Player model. */
    private static void startHeartbeat(final Context ctx, final HandoffRecord rec) {
        final int gen = ++heartbeatGen;
        Thread thread = new Thread(new Runnable() {
            @Override
            public void run() {
                long begun = System.currentTimeMillis();
                while (heartbeatGen == gen && System.currentTimeMillis() - begun < HEARTBEAT_CAP_MS) {
                    try {
                        Thread.sleep(HEARTBEAT_MS);
                    } catch (InterruptedException e) {
                        return;
                    }
                    if (heartbeatGen != gen) return;
                    final JournalPolicy.Row row = JournalClient.query(ctx); // silent null: no journal
                    if (row == null) continue;
                    new android.os.Handler(android.os.Looper.getMainLooper()).post(new Runnable() {
                        @Override
                        public void run() {
                            if (heartbeatGen == gen) applyHeartbeat(ctx, rec, row);
                        }
                    });
                }
            }
        }, "ExtProgressHeartbeat");
        thread.setDaemon(true);
        thread.start();
    }

    /** Duration (s) the progress journal holds for this video, 0 when none. Worker thread only. */
    public static long vimuJournalDurationSec(Context ctx, String videoId) {
        try {
            if (ctx == null || videoId == null || videoId.length() == 0) return 0L;
            JournalPolicy.Row row = JournalClient.query(ctx);
            if (row == null) {
                long launched = videoId.equals(launchVideoId) ? launchDuration / 1000L : 0L;
                Log.i("OneAhead", "ext journal: no row len=0 idMatch=false launchLen=" + launched);
                return launched;
            }
            boolean idMatch = videoId.equals(row.stremioVideoId);
            if (!idMatch || row.durationMs <= 0) {
                // Vimu's row carries no Stremio video id (the launch never sets one): the length Stremio
                // captured for this launch is the same file's, so it stands in.
                long launched = videoId.equals(launchVideoId) ? launchDuration / 1000L : 0L;
                Log.i("OneAhead", "ext journal: " + (idMatch ? "no-duration" : "id-mismatch")
                        + " len=" + row.durationMs / 1000L + " idMatch=" + idMatch + " launchLen=" + launched);
                return launched;
            }
            return row.durationMs / 1000L;
        } catch (Throwable t) {
            Log.i("OneAhead", "ext journal: failed " + t.getClass().getSimpleName() + " len=0 idMatch=false");
            return 0L;
        }
    }

    private static void applyHeartbeat(Context ctx, HandoffRecord rec, JournalPolicy.Row row) {
        try {
            String reject = JournalPolicy.reject(row, rec.launchId, rec.appliedAt);
            if (reject != null) {
                logRow(row, false, reject);
                return;
            }
            JournalPolicy.Outcome out = JournalPolicy.finish(row.positionMs, row.durationMs, false,
                    rec.startMs, System.currentTimeMillis() - rec.launchedAt);
            if (out.keptStart) {
                logRow(row, false, "early-back");
                return;
            }
            Object vm = loadedVm(rec.videoId);
            if (vm == null) {
                logRow(row, false, "no-model");
                return;
            }
            dispatchProgress(vm, row.positionMs, row.durationMs); // never marks watched mid-session
            rec.appliedAt = row.updatedAt;
            HandoffRecord.saveApplied(ctx, rec.appliedAt);
            logRow(row, true, "heartbeat");
        } catch (Throwable error) {
            Log.w(TAG, "applyHeartbeat", error);
        }
    }

    /**
     * Stremio is back (streams screen or player opened) with a handoff still outstanding: read the
     * journal once per process. With the Player model loaded the row is applied; otherwise the
     * record stays and the pending (cold) line is logged (phase 2 handles it). Never blocks.
     */
    public static void resumeCheck() {
        resumeCheck(RESUME_GAP_MS);
    }

    /**
     * Starts the process-level triggers: the check runs when Stremio starts and whenever one of its
     * activities resumes, whether or not anything is played. Called from ProgressStartProvider
     * (a manifest provider, created before Application.onCreate) and safe to call again.
     */
    public static void coldStart(Context context) {
        try {
            remember(context);
            if (resumeWatchInstalled || !(appContext instanceof android.app.Application)) return;
            resumeWatchInstalled = true;
            ((android.app.Application) appContext).registerActivityLifecycleCallbacks(
                    new android.app.Application.ActivityLifecycleCallbacks() {
                        @Override public void onActivityResumed(android.app.Activity activity) {
                            resumeCheck(RESUME_ACTIVITY_GAP_MS);
                        }
                        @Override public void onActivityCreated(android.app.Activity a, Bundle b) { }
                        @Override public void onActivityStarted(android.app.Activity a) { }
                        @Override public void onActivityPaused(android.app.Activity a) { }
                        @Override public void onActivityStopped(android.app.Activity a) { }
                        @Override public void onActivitySaveInstanceState(android.app.Activity a, Bundle b) { }
                        @Override public void onActivityDestroyed(android.app.Activity a) { }
                    });
            Log.i(TAG, "start watch installed");
        } catch (Throwable error) {
            Log.w(TAG, "coldStart", error);
        }
    }

    private static void resumeCheck(long minGapMs) {
        try {
            long now = System.currentTimeMillis();
            if (coldRunning || externalSessionOpen || now - lastResumeCheckAt < minGapMs) return;
            final Context ctx = journalContext();
            if (ctx == null) return;
            lastResumeCheckAt = now;
            final HandoffRecord rec = HandoffRecord.load(ctx);
            if (rec == null) return;
            Thread thread = new Thread(new Runnable() {
                @Override
                public void run() {
                    final JournalPolicy.Row row = JournalClient.query(ctx);
                    new android.os.Handler(android.os.Looper.getMainLooper()).post(new Runnable() {
                        @Override
                        public void run() {
                            applyResume(ctx, rec, row);
                        }
                    });
                }
            }, "ExtProgressResume");
            thread.setDaemon(true);
            thread.start();
        } catch (Throwable error) {
            Log.w(TAG, "resumeCheck", error);
        }
    }

    private static void applyResume(Context ctx, HandoffRecord rec, JournalPolicy.Row row) {
        try {
            if (externalSessionOpen || row == null) return; // a newer launch took over / no journal
            String reject = JournalPolicy.reject(row, rec.launchId, rec.appliedAt);
            if (reject != null) {
                logRow(row, false, reject);
                if ("launch-mismatch".equals(reject) && row.updatedAt > rec.launchedAt) {
                    HandoffRecord.clear(ctx); // Vimu has moved on to a newer session
                }
                return;
            }
            boolean ended = JournalPolicy.isFinal(row.state);
            JournalPolicy.Outcome out = JournalPolicy.finish(row.positionMs, row.durationMs,
                    JournalPolicy.rowCompleted(row), rec.startMs,
                    System.currentTimeMillis() - rec.launchedAt);
            if (out.keptStart) {
                logRow(row, false, "early-back");
                return;
            }
            Object vm = loadedVm(rec.videoId);
            if (vm == null) {
                if (!rec.launchId.equals(coldLogged)) {
                    coldLogged = rec.launchId;
                    Log.i(TAG, "journal pending (cold) launch=" + rec.launchId);
                }
                logRow(row, false, "no-model");
                startCold(ctx, rec, row, ended ? out.watchedReason : null);
                return;
            }
            dispatchProgress(vm, row.positionMs, row.durationMs);
            if (ended && out.watchedReason != null) {
                markWatched(vm, row.positionMs, row.durationMs, out.watchedReason);
            }
            if (ended) {
                HandoffRecord.clear(ctx);
            } else {
                HandoffRecord.saveApplied(ctx, row.updatedAt);
            }
            logRow(row, true, "resume");
        } catch (Throwable error) {
            Log.w(TAG, "applyResume", error);
        }
    }

    /**
     * Phase 2: no Player model is loaded (Stremio was started cold). Loads one headless from the
     * args saved at launch, applies the journal position through the stock UpdateProgress path and
     * releases it (ColdRecovery). Any failure keeps the record and says why.
     */
    private static void startCold(final Context ctx, final HandoffRecord rec,
                                  final JournalPolicy.Row row, String watchedReason) {
        try {
            String why = ColdRecovery.skipReason(rec.loadArgs, rec.coldTries, externalSessionOpen,
                    loadedVm("") != null, coldRunning);
            if (why != null) {
                Log.i(TAG, "journal cold not applied launch=" + rec.launchId + " why=" + why);
                return;
            }
            coldRunning = true;
            rec.coldTries++;
            HandoffRecord.saveColdTries(ctx, rec.coldTries);
            final boolean ended = JournalPolicy.isFinal(row.state);
            final long coldAt = System.currentTimeMillis();
            final ColdRecovery.Session session = new ColdRecovery.Session(new ColdRecovery.Loader() {
                @Override public Object load(String[] args) throws Exception {
                    return ColdRecovery.stockLoad(args);
                }
                @Override public String videoIdOf(Object vm) { return currentVideoId(vm); }
                @Override public void progress(Object vm, long positionMs, long durationMs) {
                    dispatchProgress(vm, positionMs, durationMs);
                }
                @Override public void watched(Object vm, long positionMs, long durationMs, String reason) {
                    markWatched(vm, positionMs, durationMs, reason);
                }
                // A player that starts while we load (its view model has no episode id yet) counts too.
                @Override public boolean realPlayerPresent() {
                    return loadedVm("") != null || playbackStartedAt >= coldAt;
                }
                @Override public void release(Object vm) { ColdRecovery.stockRelease(vm); }
            }, rec.loadArgs, rec.videoId, row.positionMs, row.durationMs, watchedReason);
            final android.os.Handler main = new android.os.Handler(android.os.Looper.getMainLooper());
            main.post(new Runnable() {
                @Override
                public void run() {
                    int state = ColdRecovery.FAILED;
                    try {
                        state = session.tick(android.os.SystemClock.elapsedRealtime()); // monotonic
                    } catch (Throwable error) {
                        session.failure = "error " + error;
                    }
                    if (state == ColdRecovery.WAITING) {
                        main.postDelayed(this, ColdRecovery.POLL_MS);
                        return;
                    }
                    coldRunning = false;
                    if (state == ColdRecovery.DONE) {
                        Log.i(TAG, "journal applied (cold) launch=" + rec.launchId + " pos=" + row.positionMs);
                        if (ended) {
                            HandoffRecord.clear(ctx);
                        } else {
                            HandoffRecord.saveApplied(ctx, row.updatedAt);
                            HandoffRecord.saveColdTries(ctx, 0); // the attempt cap is for failures
                        }
                    } else {
                        Log.i(TAG, "journal cold failed launch=" + rec.launchId + " why=" + session.failure);
                    }
                }
            });
        } catch (Throwable error) {
            coldRunning = false;
            Log.w(TAG, "startCold", error);
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

    private static final long TIME_LOG_GAP_MS = 10000L;
    private static volatile long lastTimeLogAt;

    /**
     * Hook in StremioApi.playerTimeChanged (the core calls it about every 650 ms): remembers the last
     * positive duration (fallback for results without one) and logs what reaches the core at most
     * once every 10 s.
     */
    public static void logTime(long position, long duration) {
        if (duration > 0L) lastDuration = duration;
        long now = System.currentTimeMillis();
        if (now - lastTimeLogAt < TIME_LOG_GAP_MS) return;
        lastTimeLogAt = now;
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
            bingeArmedAt = System.currentTimeMillis();
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
            if (context == null || target == null || target.length() == 0 || Players.isResolver(target)) return;
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
            if (fragment != null) playerFragment = new java.lang.ref.WeakReference<>(fragment);
            resumeCheck();
            app.tikkamasalla.stremio.introskip.StreamAutoPick.notePlayerStart();
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
            // Replay of the video the external player just returned from: never open the internal
            // player on it (a different video, e.g. the binge next episode, is not touched).
            String incoming = videoIdOf(fragment);
            if (Gate.blocksReentry(now, resultAt, resultVideoId, incoming,
                    BINGE_ARMED.get() || prefs.getBoolean(KEY_PENDING, false), REENTRY_BLOCK_MS)) {
                stopInternalPlayer(fragment);
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " video=" + incoming
                        + " resultVideo=" + resultVideoId + " ageMs=" + (now - resultAt)
                        + " action=SUPPRESS_REENTRY");
                PlaybackDiary.ev(context, "binge", "seq", seq, "action", "SUPPRESS_REENTRY", "vid", incoming);
                return true;
            }
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
                PlaybackDiary.ev(context, "binge", "seq", seq, "action", "SUPPRESS_DUP_INTERNAL", "vid", incoming);
                return true;
            }
            if (!pending) {
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " pending=false inFlight=false"
                        + " internalPlaying=" + isInternalPlaying(fragment) + " action=PASS_INTERNAL");
                PlaybackDiary.ev(context, "binge", "seq", seq, "action", "PASS_INTERNAL", "vid", incoming);
                return false;
            }
            long armedAt = prefs.getLong(KEY_ARMED_AT, 0L);
            if (now - armedAt > BINGE_TTL_MS) {
                Log.i(TAG, "binge flag expired");
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " pending=true inFlight=" + inFlight
                        + " internalPlaying=" + isInternalPlaying(fragment) + " action=PASS_EXPIRED");
                PlaybackDiary.ev(context, "binge", "seq", seq, "action", "PASS_EXPIRED", "vid", incoming);
                return false;
            }
            if (!prefs.getBoolean(KEY_BINGE, true)) {
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " pending=true inFlight=" + inFlight
                        + " internalPlaying=" + isInternalPlaying(fragment) + " action=PASS_BINGE_OFF");
                PlaybackDiary.ev(context, "binge", "seq", seq, "action", "PASS_BINGE_OFF", "vid", incoming);
                return false;
            }
            if (isMovieFragment(fragment)) {
                Log.i(TAG, "binge skipped: movie");
                Log.i("BingeDbg", "startStreamPlayback seq=" + seq + " pending=true inFlight=" + inFlight
                        + " internalPlaying=" + isInternalPlaying(fragment) + " action=PASS_MOVIE");
                PlaybackDiary.ev(context, "binge", "seq", seq, "action", "PASS_MOVIE", "vid", incoming);
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
                PlaybackDiary.ev(context, "binge", "seq", seq, "action", "LAUNCH_EXT", "vid", incoming);
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
            M3.stop(playerObject);
        } catch (Throwable ignored) {
        }
    }

    private static boolean isInternalPlaying(Object fragment) {
        try {
            if (fragment == null) return false;
            Object playerObject = field(fragment, "player");
            return M3.isPlaying(playerObject);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static volatile long playbackStartedAt;

    /**
     * Hook at the start of the lambda the internal player calls when playback ends (it opens the
     * next episode). Lets it through for a real end: position at 90% of duration or later.
     * The open-time floor is deliberately short (10 s): it only stops instant-failure
     * chaining (a file that errors in its first seconds must never advance), while a
     * 60 s floor blocked every legitimate end reached within a minute of (re)starting
     * playback (resume, re-entry, seeks), which on a TV is most of them. A failed file
     * ends near position 0 and is already stopped by the 90% rule. Fails open.
     */
    public static boolean allowAutoNext(Object lambda) {
        try {
            if (lambda == null) return true;
            Object fragment = field(lambda, "this$0");
            Object playerObject = fragment == null ? null : field(fragment, "player");
            long[] positionDuration = M3.positionDuration(playerObject);
            if (positionDuration == null) return true;
            long position = positionDuration[0];
            long duration = positionDuration[1];
            long startedAt = playbackStartedAt;
            long openMs = startedAt > 0L ? System.currentTimeMillis() - startedAt : MIN_OPEN_MS;
            boolean real = duration > 0L && position >= (long) (duration * FULL_RATIO)
                    && openMs >= MIN_OPEN_MS;
            PlaybackDiary.ev("autonext", "allowed", real, "pos", position, "dur", duration, "open_ms", openMs);
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
            List<String> order = new ArrayList<>();
            order.add(lastPlayer());
            if (System.currentTimeMillis() < bingeInFlightUntil) {
                order.add(learnedPlayer());
            }
            order.add("net.gtvbox.videoplayer");

            List<String> tried = new ArrayList<>();
            for (String name : order) {
                if (name == null || name.length() == 0 || Players.isResolver(name) || tried.contains(name)) {
                    continue;
                }
                tried.add(name);
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

    static final class Players {
        static final String[] MX_FAMILY = {
                "com.mxtech.videoplayer.ad",
                "com.mxtech.videoplayer.pro",
                "com.brouken.player",
                "dev.anilbeesetti.nextplayer",
                "org.courville.nova"
        };

        private Players() {
        }

        static boolean isResolver(String pkg) {
            return pkg != null && (pkg.equals("android") || pkg.startsWith("com.android."));
        }

        static String actionPackage(String action) {
            if ("org.videolan.vlc.player.result".equals(action)) return "org.videolan.vlc";
            if ("org.videolan.vlc.debug.player.result".equals(action)) return "org.videolan.vlc.debug";
            if ("is.xyz.mpv.MPVActivity.result".equals(action)) return "is.xyz.mpv";
            if ("net.gtvbox.videoplayer.result".equals(action)) return "net.gtvbox.videoplayer";
            return null;
        }

        static boolean isMxAction(String action) {
            return "com.mxtech.intent.result.VIEW".equals(action);
        }

        static String uniqueOf(java.util.List<String> installed) {
            return (installed != null && installed.size() == 1) ? installed.get(0) : null;
        }

        static String mxActivity(String pkg) {
            if ("com.mxtech.videoplayer.ad".equals(pkg)) {
                return "com.mxtech.videoplayer.ad.ActivityScreen";
            }
            if ("com.mxtech.videoplayer.pro".equals(pkg)) {
                return "com.mxtech.videoplayer.ActivityScreen";
            }
            return null;
        }

        static long parseRuntimeMs(String s) {
            if (s == null) return 0L;
            s = s.trim().toLowerCase(java.util.Locale.US);
            if (s.isEmpty()) return 0L;

            if (s.startsWith("pt")) {
                long ms = 0L;
                java.util.regex.Matcher hm = java.util.regex.Pattern.compile("pt(?:(\\d+)h)?(?:(\\d+)m)?").matcher(s);
                if (hm.find()) {
                    if (hm.group(1) != null) ms += Long.parseLong(hm.group(1)) * 3600000L;
                    if (hm.group(2) != null) ms += Long.parseLong(hm.group(2)) * 60000L;
                }
                return ms;
            }
            if (s.contains(":")) {
                String[] p = s.split(":");
                try {
                    if (p.length == 3) {
                        return Long.parseLong(p[0].trim()) * 3600000L
                                + Long.parseLong(p[1].trim()) * 60000L
                                + Long.parseLong(p[2].trim()) * 1000L;
                    }
                    if (p.length == 2) {
                        return Long.parseLong(p[0].trim()) * 60000L
                                + Long.parseLong(p[1].trim()) * 1000L;
                    }
                } catch (Exception e) {}
                return 0L;
            }
            try {
                if (s.matches("\\d+")) return Long.parseLong(s) * 60000L;
            } catch (Exception e) {}

            long ms = 0L;
            boolean hasUnit = false;
            java.util.regex.Matcher m = java.util.regex.Pattern.compile("(\\d+)\\s*(h|m)").matcher(s);
            while (m.find()) {
                hasUnit = true;
                long val = Long.parseLong(m.group(1));
                if (m.group(2).equals("h")) ms += val * 3600000L;
                else if (m.group(2).equals("m")) ms += val * 60000L;
            }
            return hasUnit ? ms : 0L;
        }

        static boolean isVlc(String pkg) {
            return pkg != null && pkg.startsWith("org.videolan.");
        }
    }

    private static void applyMxComponent(Intent intent, String target) {
        try {
            if (intent == null || intent.getComponent() != null || target == null) {
                return;
            }
            String cls = Players.mxActivity(target);
            if (cls == null) {
                return;
            }
            Context context = appContext;
            if (context == null) {
                Log.i(TAG, "mx component missing " + cls);
                return;
            }
            try {
                context.getPackageManager().getActivityInfo(new android.content.ComponentName(target, cls), 0);
                intent.setClassName(target, cls);
                Log.i(TAG, "mx component " + target + "/" + cls);
            } catch (android.content.pm.PackageManager.NameNotFoundException e) {
                Log.i(TAG, "mx component missing " + cls);
            }
        } catch (Throwable error) {
            Log.w(TAG, "applyMxComponent", error);
        }
    }

    private static volatile long capDuration;
    private static volatile long launchDuration;

    /**
     * Compose builds (no PlayerFragment): the internal player's duration when it loaded, else the meta
     * runtime the core model carried for this video id (Cinemeta "49 min"); 0 when neither is known.
     */
    private static long portDurationOf(String videoId) {
        try {
            long d = videoId != null && videoId.equals(PortHooks.streamId()) ? Math.max(PortHooks.durationMs(), 0L) : 0L;
            if (d > 0L) return d;
            long ms = Players.parseRuntimeMs(PortHooks.runtimeTextFor(videoId));
            if (ms > 0L) Log.i(TAG, "launch duration source=meta runtime ms=" + ms);
            return Math.max(ms, 0L);
        } catch (Throwable error) {
            return 0L;
        }
    }

    private static long knownDurationOf(Object fragment, Object meta) {
        try {
            Object playerObj = field(fragment, "player");
            long d = M3.durationOf(playerObj);
            if (d > 0L) {
                Log.i(TAG, "launch duration source=player ms=" + d);
                return d;
            }
        } catch (Throwable error) {
            // Fall through
        }
        try {
            if (meta != null) {
                Object runtimeObj = invoke(meta, "getRuntime");
                long ms = 0L;
                if (runtimeObj instanceof Number) {
                    ms = ((Number) runtimeObj).longValue() * 60000L;
                } else if (runtimeObj instanceof String) {
                    ms = Players.parseRuntimeMs((String) runtimeObj);
                }
                if (ms > 0L) {
                    Log.i(TAG, "launch duration source=runtime ms=" + ms);
                    return ms;
                }
            }
        } catch (Throwable error) {
            // Fall through
        }
        return 0L;
    }

    private static final String KEY_LEARNED = "external_player_learned";
    private static volatile String launchTarget = "";

    private static String learnedPlayer() {
        try {
            Context context = appContext;
            if (context == null) return null;
            return context.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE)
                    .getString(KEY_LEARNED, null);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static String uniqueMxFamilyInstalled() {
        try {
            Context context = appContext;
            if (context == null) return null;
            android.content.pm.PackageManager pm = context.getPackageManager();
            List<String> installed = new ArrayList<>();
            for (String pkg : Players.MX_FAMILY) {
                try {
                    pm.getPackageInfo(pkg, 0);
                    installed.add(pkg);
                } catch (Throwable ignored) {
                }
            }
            return Players.uniqueOf(installed);
        } catch (Throwable ignored) {
            return null;
        }
    }

    /** The user picked a player in the chooser (ChooserPick): an MX Player pick becomes the explicit target. */
    static void onChosen(String pkg, String cls) {
        try {
            String keep = ChooserPick.rememberable(pkg);
            Log.i(TAG, "chooser pick " + pkg + "/" + cls + (keep != null ? " remembered" : " not remembered"));
            if (keep != null) setLastPlayer(keep);
        } catch (Throwable error) {
            Log.w(TAG, "onChosen", error);
        }
    }

    static void learnPlayer(String action) {
        try {
            if (action == null) return;
            if (launchTarget != null && launchTarget.length() > 0 && !Players.isResolver(launchTarget)) {
                return;
            }
            String pkg = Players.actionPackage(action);
            if (pkg == null && Players.isMxAction(action)) {
                pkg = uniqueMxFamilyInstalled();
            }
            if (pkg != null) {
                Context context = appContext;
                if (context != null) {
                    context.getSharedPreferences(PREFS_FILE, Context.MODE_PRIVATE)
                            .edit().putString(KEY_LEARNED, pkg).apply();
                    Log.i(TAG, "learned player " + pkg + " from " + action);
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "learnPlayer", error);
        }
    }

    private static void applyVlcSubs(Intent intent) {
        try {
            String[] uris = capSubUris;
            String[] names = capSubNames;
            String[] langs = capSubLangs;
            if (uris.length == 0 || names.length != uris.length || langs.length != uris.length) {
                return;
            }
            java.util.List<Integer> picked = SubPick.pick(
                    java.util.Arrays.asList(names), 
                    java.util.Arrays.asList(langs), 
                    capEnableIdx, 
                    capUserLang
            );
            if (!picked.isEmpty()) {
                int bestIdx = picked.get(0);
                intent.putExtra("subtitles_location", uris[bestIdx]);
                Log.i(TAG, "vlc subtitle " + bestIdx + " of " + uris.length);
            }
        } catch (Throwable error) {
            Log.w(TAG, "applyVlcSubs", error);
        }
    }
}
