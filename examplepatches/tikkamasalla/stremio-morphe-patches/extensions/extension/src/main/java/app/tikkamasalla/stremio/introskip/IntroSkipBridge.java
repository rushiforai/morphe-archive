package app.tikkamasalla.stremio.introskip;

import android.app.Activity;
import android.app.Dialog;
import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.content.ContextWrapper;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.TypedValue;
import android.view.ActionMode;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.KeyboardShortcutGroup;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;

import app.tikkamasalla.stremio.diag.PlaybackDiary;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.IdentityHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/** Runtime bridge injected into Stremio's player screen; it reaches the player only through {@link SkipPlayer}. */
public final class IntroSkipBridge {
    private static final String ANILIST_URL = "https://graphql.anilist.co";
    private static final String ANISKIP_URL = "https://api.aniskip.com/v2/skip-times/";
    private static final String INTRODB_URL = "https://api.theintrodb.org/v4/media";
    private static final String INTRODB_APP_URL = "https://api.introdb.app/segments";
    private static final String SKIPDB_URL = "https://api.skipdb.tv/api/segments";
    private static final String CINEMETA_META_SERIES_URL = "https://v3-cinemeta.strem.io/meta/series/";
    private static final String CINEMETA_META_MOVIE_URL = "https://v3-cinemeta.strem.io/meta/movie/";
    // Network robustness: every skip-related HTTP call keeps the 5 s timeouts,
    // retries 429/5xx up to 3 times (Retry-After honoured, each wait capped at
    // 3 s), returns not-found (204/404) immediately. Every online SOURCE has its own
    // time budget (a slow Cinemeta title search cannot starve TheIntroDB, IntroDB.app
    // or SkipDB): AniSkip (own thread) 10 s; on the IntroDB thread Cinemeta 10 s,
    // TheIntroDB 8 s, IntroDB.app 5 s, SkipDB 5 s, the chain as a whole at most 20 s
    // (plus one in-flight 5 s request). Each source's result is applied the moment it
    // arrives, so the cap only matters for the slow tail.
    private static final long ANISKIP_BUDGET_MS = 10000L;
    private static final long CINEMETA_BUDGET_MS = 10000L;
    private static final long THEINTRODB_BUDGET_MS = 8000L;
    private static final long INTRODB_APP_BUDGET_MS = 5000L;
    private static final long SKIPDB_BUDGET_MS = 5000L;
    private static final long OWN_TIMES_BUDGET_MS = 2500L;
    private static final long CHAIN_BUDGET_MS = 20000L;
    // A source that FAILED (exception, timeout, LookupBudgetException, 429/5xx after the
    // per-request retries) is refetched after these delays (max 3 attempts); "no data"
    // (200 without usable items, 204, 404) is final.
    private static final long[] RETRY_BACKOFF_MS = {5000L, 20000L, 60000L};
    // Is the show an anime? Cinemeta genres decide before AniList is asked at all (a live-action
    // show must never take an anime's skip times). UNKNOWN (no tt id, no meta) needs a strict match.
    private static final int EVIDENCE_UNKNOWN = 0;
    private static final int EVIDENCE_ANIME = 1;
    private static final int EVIDENCE_NOT_ANIME = 2;
    private static final Map<String, Integer> ANIME_EVIDENCE_CACHE =
            new java.util.concurrent.ConcurrentHashMap<String, Integer>();
    // The AniSkip retry with episodeLength=0 returns submissions measured on any cut: keep one
    // only when its length is within this many seconds of our file (24 min cut vs 24:10 cut = 10 s).
    private static final double ANISKIP_LENGTH_TOLERANCE_S = 8.0;
    private static final ThreadLocal<boolean[]> SOURCE_FAILED = new ThreadLocal<boolean[]>();
    private static final DebugLogger QUIET = new DebugLogger() {
        @Override
        public void log(String message) {
        }
    };
    private static final int HTTP_MAX_ATTEMPTS = 4;
    private static final long RETRY_WAIT_MAX_MS = 3000L;
    /** An auto-skip that does not land is re-armed this many times, then left to the manual button. */
    private static final int MAX_REARMS = 3;
    private static final ThreadLocal<Long> DEADLINE_MS = new ThreadLocal<Long>();
    private static final Map<String, String> CINEMETA_IDS_CACHE =
            new java.util.concurrent.ConcurrentHashMap<String, String>();
    private static final String CINEMETA_SERIES_URL = "https://v3-cinemeta.strem.io/catalog/series/top/search=";
    private static final String CINEMETA_MOVIE_URL = "https://v3-cinemeta.strem.io/catalog/movie/top/search=";
    private static final Pattern STREMIO_VIDEO_ID =
            Pattern.compile("^(?:(tt\\d{7,10})(?::(\\d{1,3}):(\\d{1,4}))?|kitsu:(\\d+):(\\d{1,4}))$");
    // Movie or series from Stremio's own video id: a bare id is a movie, an id with an episode part a series.
    private static final Pattern VIDEO_ID_SERIES = Pattern.compile(
            "^(?:tt\\d+:\\d+:[1-9]\\d*|kitsu:\\d+:[1-9]\\d*|tmdb:\\d+:\\d+:[1-9]\\d*)$");
    private static final Pattern VIDEO_ID_MOVIE = Pattern.compile("^(?:tt\\d+|kitsu:\\d+|tmdb:\\d+)$");
    private static final String KITSU_MAPPINGS_URL = "https://kitsu.app/api/edge/anime/";
    // A TheIntroDB recap may start at 0:00 (a "previously on" at the very top) when it runs 10-180 s.
    private static final double RECAP_ZERO_MIN_S = 10.0;
    private static final double RECAP_ZERO_MAX_S = 180.0;
    private static final Object CINEMETA_LOCK = new Object();
    private static final Map<String, String> CINEMETA_CACHE =
            new java.util.concurrent.ConcurrentHashMap<String, String>();
    // Empty ("no id") and ambiguous Cinemeta answers live here for minutes only, never in
    // CINEMETA_CACHE / CINEMETA_IDS_CACHE / the 60-day prefs: one oddly-timed empty answer or a
    // same-name guess must not stick until Stremio is killed. Value "" = no result.
    private static final class SoftEntry {
        final String value;
        final long until;
        SoftEntry(String value, long until) { this.value = value; this.until = until; }
    }
    private static final Map<String, SoftEntry> CINEMETA_SOFT =
            new java.util.concurrent.ConcurrentHashMap<String, SoftEntry>();
    static volatile long softTtlMs = 5L * 60L * 1000L; // package-private: tests shorten it

    // nanoTime stamps compared by subtraction, so a wrapped counter still orders correctly.
    private static void putSoft(String key, String value) {
        CINEMETA_SOFT.put(key, new SoftEntry(value, System.nanoTime() + softTtlMs * 1000000L));
    }

    /** Unexpired soft entry or null (an expired one is dropped). */
    private static SoftEntry getSoft(String key) {
        SoftEntry entry = CINEMETA_SOFT.get(key);
        if (entry == null) return null;
        if (System.nanoTime() - entry.until >= 0) {
            CINEMETA_SOFT.remove(key, entry); // only this expired instance, not a fresh concurrent put
            return null;
        }
        return entry;
    }

    private static final Pattern YEAR = Pattern.compile("\\b(19\\d{2}|20\\d{2})\\b");
    /** Trailing "(1999-)", "(1999-2004)", "(2019)" (any dash, or none) that Stremio appends to a series name. */
    private static final Pattern TRAILING_YEAR_RANGE = Pattern.compile(
            "\\s*[(\\[]\\s*(?:19|20)\\d{2}\\s*(?:[-\\u2010-\\u2015]?\\s*(?:(?:19|20)\\d{2}|present|now)?\\s*)?[)\\]]\\s*$",
            Pattern.CASE_INSENSITIVE);
    private static final Pattern IMDB_ID = Pattern.compile("(?i)(tt\\d{7,})");
    private static final Pattern META_SEASON_EPISODE = Pattern.compile("(?i)(?:^|[^a-z0-9])S(\\d{1,2})[ ._-]*E(\\d{1,4})(?=$|[^a-z0-9])");
    private static final Pattern SEASON_EPISODE = Pattern.compile("(?i)(?:^|[^a-z0-9])S\\d{1,2}[ ._-]*E(\\d{1,4})(?=$|[^a-z0-9])");
    private static final Pattern SEASON = Pattern.compile("(?i)(?:^|[^a-z0-9])S(\\d{1,2})(?:[ ._-]*E\\d{1,4})?(?=$|[^a-z0-9])");
    private static final Pattern SEASON_WORD = Pattern.compile("(?i)(?:^|[^a-z0-9])(?:season|saison)[ ._-]*(\\d{1,2})(?=$|[^a-z0-9])");
    private static final Pattern EPISODE = Pattern.compile("(?i)(?:\\bepisode|\\bep|[ ._/-]e)[ ._/-]*(\\d{1,4})\\b|(?:^|[\\s._])-\\s*[._]?(\\d{2,3})(?:v\\d)?(?=[\\s._]|$|\\[|\\()");
    private static final Pattern STRUCTURED_TITLE = Pattern.compile(
            "(?i)(?:title|name|series|show|anime|mediaTitle|torrent_name|torrentName|filename|file_name|fileName)\\s*[:=]\\s*[\\\"']?([^,}\\]\\\"']+)");
    private static final String TAG = "IntroSkip";
    private static final long POLL_MS = 200L;
    /** A backward viewer seek landing inside a segment, or up to this far before its start, holds its auto-skip.
     * Same value as the rewind re-arm threshold, which needs strictly more: no gap. */
    private static final double SEEK_HOLD_LEAD_S = 2.0;
    /** A forward viewer seek holds only when it lands this far inside the segment (see forwardLagBlocked). */
    private static final double SEEK_HOLD_FORWARD_LAG_S = 15.0;
    private static final Map<Activity, Session> SESSIONS = new WeakHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final ExecutorService NETWORK = Executors.newCachedThreadPool();

    private IntroSkipBridge() {
    }

    public static void onPlayerSet(final View playerView, final androidx.media3.common.Player player) {
        onPlayerSetInternal(playerView, wrapMedia3(player), false);
    }

    /** Same hook with the optional Intro Skip diagnostics enabled by the patch option. */
    public static void onPlayerSetDebug(final View playerView, final androidx.media3.common.Player player) {
        onPlayerSetInternal(playerView, wrapMedia3(player), true);
    }

    /** Compose builds (TV 1.10.x / 1.12.x): PortHooks hands over the wrapped player screen and the app's own player. */
    static void onPortHost(final View host, final SkipPlayer player, final boolean debugEnabled) {
        onPlayerSetInternal(host, player, debugEnabled);
    }

    /** The patched legacy hooks pass a Media3 Player; the engine below only ever sees a SkipPlayer. */
    private static SkipPlayer wrapMedia3(androidx.media3.common.Player player) {
        return player == null ? null : new Media3SkipPlayer(player);
    }

    /**
     * All three patch hooks (PlayerView.setPlayer, ExoPlayerImpl.setVideoSurfaceView,
     * PlayerFragment.startStreamPlayback) land here. They describe the SAME playback, so they
     * are folded into ONE session per Activity; the Stremio wrapper player wins over the raw
     * ExoPlayerImpl. One session = one fetch, one overlay, one skip per segment.
     */
    private static void onPlayerSetInternal(final View playerView,
                                             final SkipPlayer player,
                                             final boolean debugEnabled) {
        if (playerView == null || player == null) return;
        Log.i(TAG, "onPlayerSet " + playerView.getClass().getSimpleName() + " " + player.engineName());
        MAIN.post(new Runnable() {
            @Override
            public void run() {
                try {
                    Activity activity = activityOf(playerView.getContext());
                    if (activity == null || activity.isFinishing()) {
                        Log.i(TAG, "onPlayerSet ignored: activity=" + activity);
                        return;
                    }
                    Session session = SESSIONS.get(activity);
                    if (session == null || session.closed) {
                        session = new Session(activity);
                        SESSIONS.put(activity, session);
                    }
                    if (debugEnabled) session.debugEnabled = true;
                    session.offer(playerView, player, priorityOf(playerView, player));
                } catch (Throwable error) {
                    Log.w(TAG, "hook failed", error);
                }
            }
        });
    }

    private static int priorityOf(View view, SkipPlayer player) {
        if (player instanceof PortSkipPlayer) return 4;
        if (player.engineName().startsWith("com.stremio.")) return 3;
        if (view.getClass().getName().endsWith("PlayerView")) return 2;
        return 1;
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

    private static boolean isOkKey(int keyCode) {
        return keyCode == KeyEvent.KEYCODE_DPAD_CENTER || keyCode == KeyEvent.KEYCODE_ENTER
                || keyCode == KeyEvent.KEYCODE_NUMPAD_ENTER || keyCode == KeyEvent.KEYCODE_BUTTON_A;
    }

    private static final java.util.regex.Pattern URL_IN_TEXT =
            java.util.regex.Pattern.compile("(?i)\\b(https?)://([^\\s/?#\"'<>]*)([^\\s?#\"'<>]*)([?#][^\\s\"'<>]*)?");
    private static final java.util.regex.Pattern OPAQUE_SEGMENT =
            java.util.regex.Pattern.compile("[A-Za-z0-9]{12,}|[A-Za-z0-9_~-]{32,}");

    /**
     * Log-safe text: every URL keeps scheme, host and path shape, but its query/fragment, any
     * user:password@ part and long opaque path segments (debrid/stream tokens) are masked.
     */
    static String redactUrls(String text) {
        if (text == null || text.indexOf("://") < 0) return text;
        java.util.regex.Matcher m = URL_IN_TEXT.matcher(text);
        StringBuffer out = new StringBuffer();
        while (m.find()) {
            String host = m.group(2);
            int at = host.lastIndexOf('@');
            if (at >= 0) host = "***@" + host.substring(at + 1);
            // Sentence punctuation right after the URL ("(https://h/p?a=b)") is not part of it.
            String last = m.group(4) != null ? m.group(4) : m.group(3);
            int cut = last.length();
            while (cut > 0 && ")]},.;:!".indexOf(last.charAt(cut - 1)) >= 0) cut--;
            String trailing = last.substring(cut);
            String pathText = m.group(4) != null ? m.group(3) : last.substring(0, cut);
            StringBuilder path = new StringBuilder();
            String[] parts = pathText.split("/", -1);
            for (int i = 0; i < parts.length; i++) {
                if (i > 0) path.append('/');
                String part = parts[i];
                path.append(isOpaqueToken(part) ? "<token>" : part);
            }
            String tail = m.group(4) == null ? "" : m.group(4).substring(0, 1) + "<redacted>";
            m.appendReplacement(out, java.util.regex.Matcher.quoteReplacement(
                    m.group(1) + "://" + host + path + tail + trailing));
        }
        m.appendTail(out);
        return out.toString();
    }

    /** A 12+ char alphanumeric (or 32+ char url-safe) run holding a digit and a letter: an id/token, not a word. */
    private static boolean isOpaqueToken(String part) {
        if (!OPAQUE_SEGMENT.matcher(part).matches()) return false;
        boolean digit = false;
        boolean letter = false;
        for (int i = 0; i < part.length(); i++) {
            char c = part.charAt(i);
            if (c >= '0' && c <= '9') digit = true;
            else if (Character.isLetter(c)) letter = true;
        }
        return digit && letter;
    }

    private static final class Session {
        private final Activity activity;
        private final StringBuilder debugLog = new StringBuilder();
        private final List<Segment> segments = new ArrayList<>();
        private String zeroConflictLogKey = "";
        private final Set<String> autoSkipped = new HashSet<>();
        private final Runnable tick = new Runnable() {
            @Override
            public void run() {
                if (closed) return;
                try {
                    poll();
                } catch (Throwable error) {
                    log("ERROR poll: " + error);
                }
                if (!closed) MAIN.postDelayed(this, POLL_MS);
            }
        };
        private final Runnable precise = new Runnable() {
            @Override
            public void run() {
                if (closed) return;
                try {
                    poll();
                } catch (Throwable error) {
                    log("ERROR poll: " + error);
                }
            }
        };
        boolean closed;
        boolean debugEnabled;
        private boolean debugDialogShown;
        private Dialog debugDialog;
        private View anchor;
        private SkipPlayer player;
        private int priority;
        private long attachedAt;
        private boolean seenAlive;
        private long deadSince;
        // media resolution
        private String identity;
        private String loadedKey;
        private long fetchedLength;
        private String[] cachedVideoId;
        private String lastSnapshot;
        private MediaInfo pendingInfo;
        private long readySince;
        private long nextInfoAt;
        private int infoAttempts;
        private int fetchGeneration;
        private boolean aniDone;
        private boolean introDone;
        private List<Segment> introResult;
        private List<Segment> aniResult;
        /** A failed source has a refetch scheduled: the lookup is not final yet. */
        private boolean aniRetryPending;
        private boolean introRetryPending;
        // chapters of the file itself (exact ground truth) + online timings, merged in combine()
        private int mediaGeneration;
        private long skippedAt;
        private boolean chaptersRequested;
        /** True until Stremio's own ids prove "series" (fail closed): no segments, no lookups, no Next pill. */
        private boolean movie = true;
        private boolean kindResolved;
        private int kindAttempts;
        private long nextKindAt;
        private boolean chaptersDone;
        private long chaptersStartedAt;
        /** Bounded retries when the chapter fetch yields nothing (same media only). */
        private int chapterRetries;
        /** Ownership token: the newest chapter read; a late result from an older read cannot clobber it. */
        private int chapterFetchSeq;
        /** Failed landings per segment key (U3): auto-skip re-arms at most MAX_REARMS times. */
        private final Map<String, Integer> landFails = new java.util.HashMap<>();
        /** Preview found by subtitle tail or live cue; re-added by every re-merge (U4). */
        private Segment cuePreview;
        /** IntroDB.app post_credits scene of this media, extracted in combine(); never skippable. */
        private Segment appPostCredits;
        private Uri chapterUri;
        private List<MkvChapters.Chapter> chapters;
        private List<Segment> online;
        private String onlineSource;
        private long onlineStartedAt;
        private String appliedSignature;
        private String lastSanityLogKey;
        // playback tracking
        private double lastPos = -1;
        private double flowPos = -1;
        private int flowTicks;
        private int steadyTicks;
        private long lastPollAt;
        /** Playback diary: stall tracker and the once-per-media play event. */
        private PlaybackDiary.Stall stall = new PlaybackDiary.Stall();
        private boolean diaryPlay;
        private Segment current;
        private boolean currentBySeek;
        private boolean currentByJump;
        private final Map<String, Integer> jumpSkips = new java.util.HashMap<>();
        private long lastSeekKeyAt;
        /** Key of the segment a viewer seek landed in (or just before): no auto-skip until playback leaves it. */
        private String seekHoldKey;
        private long firstPlayingAt;
        /** First READY observation of this media (the first frame is not earlier); 0 = not yet. */
        private long firstReadyAt;
        /** Pre-frame skip (PreSkip): first frame on the surface, moving picture seen, start position. */
        private boolean firstFrameRendered;
        private boolean everPlayed;
        private double initialPos = -1;
        private boolean preSkipDone;
        private boolean preSkipMissLogged;
        private boolean preSkipDeferLogged;
        private boolean chapterTimingPending;
        private long lastTraceAt;
        private boolean inheritSeek;
        private long guardUntil;
        private double guardTarget;
        private Segment guardSegment;
        private long landingCheckAt;
        /** EXACT seek params stay active until the async seek lands (see exactSeek). */
        private long restoreSeekAt;
        /** EOF auto-advance fired once per media (see maybeShowNext). */
        private boolean eofAutoAdvanced;
        /** Cached nextVideoState() (1 yes, 0 none, -1 unknown) and when it was read. */
        private int nextState = -1;
        private long nextStateAt;
        /** Subtitle-tail preview scan fired once per media. */
        private boolean subPreviewRequested;
        private final Set<String> subUrlsChecked = new HashSet<>();
        // overlay + keys
        private FrameLayout host;
        private TextView pill;
        private LinearLayout pillCard;
        private View pillIcon;
        private TextView pillBadge;
        private int accentColor = 0xFF5B67F1;
        private boolean accentResolved;
        private boolean pillShown;
        private boolean armed;
        private boolean manualArmed;
        private boolean okDownConsumed;
        private long lastOtherKeyAt;
        // NextPrep: video the next episode was prepared for, last window check.
        private String prepKey;
        private long prepCheckedAt;
        private Segment pillSegment;
        private boolean nextPill;
        private long noticeUntil;
        private Window.Callback originalCallback;
        private KeyCallback keyCallback;
        private Object fragment;
        private Method controlsVisibleMethod;
        // coloured skip marks on the progress bar (SeekMarks)
        private final SeekMarks.Controller seekMarks = new SeekMarks.Controller();
        private double[] markStart = new double[8];
        private double[] markEnd = new double[8];
        private String[] markLabel = new String[8];
        private SeekMarks.Mark[] markList;
        private long markSig;
        private boolean markComposeNoted;

        /** Phone UI (2.x): the pill is tapped, no D-pad arming, lifted higher while Stremio's controls are up. */
        private boolean touchUi() {
            return player instanceof PortSkipPlayer && PhoneOverlay.isPhone();
        }

        /** A touch landed anywhere in the window: Stremio's controls are (probably) up for ~3 s, like after a D-pad key. */
        void onTouchDown() {
            if (!closed && touchUi()) lastOtherKeyAt = SystemClock.uptimeMillis();
        }

        /** Makes the pill/card tappable on the phone; focus stays off so Stremio's own controls keep it. */
        private void wireTouch(final View target) {
            if (!touchUi()) return;
            try {
                target.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);
                target.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        if (closed || !pillShown || (pillSegment == null && !nextPill)) return;
                        log("Button activated via touch");
                        triggerPillAction();
                    }
                });
                target.setFocusable(false);
                target.setFocusableInTouchMode(false);
            } catch (Throwable error) {
                log("ERROR touch: " + error);
            }
        }

        /** The player's session log (an exact-seek lookup failure is reported through it). */
        private final SkipPlayer.Logger playerLogger = new SkipPlayer.Logger() {
            @Override
            public void log(String message) {
                Session.this.log(message);
            }
        };

        /** Re-runs the pre-frame gate after the player leaves IDLE (see onPlaybackStateChanged). */
        private final Runnable preSkipRetry = new Runnable() {
            @Override
            public void run() {
                if (!closed) maybePreSkip();
            }
        };

        /** Logs where a seek really landed (NEXT_SYNC reports SEEK_ADJUSTMENT to a keyframe). */
        private final SkipPlayer.Listener listener = new SkipPlayer.Listener() {
            @Override
            public void onSeekLanding(boolean adjusted, long fromMs, long toMs) {
                // The app's own start/resume seek before any motion defines the start position.
                if (!everPlayed) initialPos = toMs / 1000.0;
                if (SystemClock.uptimeMillis() - skippedAt > 4000L) return;
                log("Landing " + (adjusted ? "adjusted keyframe" : "seek")
                        + ": " + fmt3(fromMs / 1000.0) + "s -> "
                        + fmt3(toMs / 1000.0) + "s");
            }

            @Override
            public void onTracksChanged() {
                try {
                    if (!closed && !movie) maybeStartSubPreviewScan();
                } catch (Throwable ignored) {
                }
            }

            @Override
            public void onFirstFrameRendered() {
                if (firstFrameRendered) return;
                firstFrameRendered = true;
                double pos = -1;
                try {
                    if (player != null) pos = player.positionMs() / 1000.0;
                } catch (Throwable ignored) {
                }
                log("First frame rendered (pos=" + fmt3(pos) + "s)");
                // Last chance for a deferred pre-frame skip (narrowest bounds landed).
                if (!closed && !preSkipDone) {
                    MAIN.removeCallbacks(preSkipRetry);
                    MAIN.post(preSkipRetry);
                }
            }

            @Override
            public void onIsPlayingChanged(boolean isPlaying) {
                if (isPlaying) everPlayed = true;
            }

            @Override
            public void onPlaybackStateChanged(int state) {
                // Segments that arrived while a deferred prepare() held the player in IDLE
                // were denied there; retry as soon as it leaves IDLE instead of waiting for
                // the next poll, which fast playback can beat. Posted, not run inline: this
                // callback fires inside prepare(), and the app's own start/resume seek may
                // be its next statement - the posted retry runs after that seek lands, still
                // before any frame can render.
                if (!closed && (state == SkipPlayer.STATE_BUFFERING || state == SkipPlayer.STATE_READY)) {
                    MAIN.removeCallbacks(preSkipRetry);
                    MAIN.post(preSkipRetry);
                }
            }

            @Override
            public void onCueTexts(List<CharSequence> texts) {
                try {
                    if (!closed && !movie) onLiveCues(texts);
                } catch (Throwable ignored) {
                }
            }
        };

        Session(Activity activity) {
            this.activity = activity;
        }

        void offer(View view, SkipPlayer next, int nextPriority) {
            if (next.sameAs(player)) {
                // Phone: every stream load gets a fresh anchor (PhoneOverlay); the old one is already detached.
                if (nextPriority > priority || (view != anchor && PhoneOverlay.isPhone())) {
                    anchor = view;
                    priority = nextPriority;
                    fragment = null;
                }
                return;
            }
            if (player != null && nextPriority < priority && !playerDead()) {
                log("HOOK ignored (same playback): " + next.getClass().getName());
                return;
            }
            log("HOOK " + view.getClass().getName() + " player=" + next.engineName()
                    + " prio=" + nextPriority);
            boolean wasRunning = player != null;
            flushSeekRestore(); // the old engine may still be on EXACT (same engine, new wrapper)
            try {
                if (player != null) player.setListener(null);
                next.setLogger(playerLogger);
                next.setListener(listener);
            } catch (Throwable error) {
                log("ERROR listener: " + error);
            }
            player = next;
            priority = nextPriority;
            anchor = view;
            fragment = null;
            attachedAt = SystemClock.uptimeMillis();
            seenAlive = false;
            deadSince = 0;
            resetMedia();
            if (debugEnabled && !debugDialogShown) {
                debugDialogShown = true;
                showDebugDialog();
            }
            if (!wasRunning) {
                MAIN.post(tick);
            }
        }

        /**
         * Forgets everything about the previous media. The player's own seek-mode lookup stays
         * (it belongs to the SkipPlayer). inheritSeek carries an exact-seek
         * state from one segment to the next of the SAME media, so it is cleared here.
         */
        private void resetMedia() {
            MAIN.removeCallbacks(preSkipRetry); // a retry queued for the old media must not run on the new one
            identity = null;
            loadedKey = null;
            fetchedLength = -1;
            cachedVideoId = null;
            lastSnapshot = null;
            pendingInfo = null;
            readySince = 0;
            nextInfoAt = 0;
            infoAttempts = 0;
            fetchGeneration++;
            mediaGeneration++;
            aniDone = false;
            introDone = false;
            introResult = null;
            aniResult = null;
            aniRetryPending = false;
            introRetryPending = false;
            skippedAt = 0;
            // A credits skip lands at the end, so the next episode can be detected before the 2.5 s
            // guard ends; zeroing restoreSeekAt alone would leave a reused player on EXACT.
            flushSeekRestore();
            eofAutoAdvanced = false;
            prepKey = null;
            prepCheckedAt = 0;
            nextState = -1;
            nextStateAt = 0;
            subPreviewRequested = false;
            subUrlsChecked.clear();
            movie = true;
            kindResolved = false;
            kindAttempts = 0;
            nextKindAt = 0;
            segments.clear();
            autoSkipped.clear();
            jumpSkips.clear();
            firstPlayingAt = 0;
            firstReadyAt = 0;
            firstFrameRendered = false;
            everPlayed = false;
            initialPos = -1;
            preSkipDone = false;
            preSkipMissLogged = false;
            preSkipDeferLogged = false;
            chapterTimingPending = false;
            lastTraceAt = 0;
            inheritSeek = false;
            chaptersRequested = false;
            chaptersDone = false;
            chaptersStartedAt = 0;
            chapterRetries = 0;
            chapterFetchSeq++;
            landFails.clear();
            cuePreview = null;
            appPostCredits = null;
            chapterUri = null;
            chapters = null;
            online = null;
            onlineSource = null;
            onlineStartedAt = 0;
            appliedSignature = null;
            lastSanityLogKey = null;
            current = null;
            currentBySeek = false;
            currentByJump = false;
            lastSeekKeyAt = 0;
            seekHoldKey = null;
            lastPos = -1;
            flowPos = -1;
            flowTicks = 0;
            steadyTicks = 0;
            okDownConsumed = false;
            manualArmed = false;
            lastPollAt = 0;
            stall = new PlaybackDiary.Stall();
            diaryPlay = false;
            guardUntil = 0;
            guardTarget = 0;
            guardSegment = null;
            landingCheckAt = 0;
            lastOtherKeyAt = 0;
            fragment = null;
            controlsVisibleMethod = null;
            // hidePill clears armed, pillSegment, nextPill and noticeUntil; it must see pillShown.
            hidePill(false);
        }

        private boolean playerDead() {
            if (player == null) return true;
            try {
                int state = player.playbackState();
                if (state != SkipPlayer.STATE_IDLE) return false;
            } catch (Throwable error) {
                return true;
            }
            return seenAlive || SystemClock.uptimeMillis() - attachedAt > 15000L;
        }

        /** True while a segment whose auto-skip did not land may be re-armed (at most MAX_REARMS times). */
        boolean rearmAfterMiss(Segment segment) {
            String key = segment.key();
            Integer n = landFails.get(key);
            int next = n == null ? 1 : n + 1;
            landFails.put(key, next);
            return next <= MAX_REARMS;
        }

        private void close(String why) {
            if (closed) return;
            closed = true;
            log("Session closed: " + why);
            PlaybackDiary.ev(activity, "end", "why", why, "pos", lastPos);
            try {
                if (player != null) player.setListener(null);
            } catch (Throwable ignored) {
                // Player already released.
            }
            MAIN.removeCallbacks(tick);
            MAIN.removeCallbacks(precise);
            hidePill(false);
            seekMarks.clear();
            try {
                if (debugDialog != null && debugDialog.isShowing()) debugDialog.dismiss();
            } catch (Throwable ignored) {
                // Window already gone.
            }
            debugDialog = null;
            if (host != null && overlayView() != null) {
                try {
                    host.removeView(overlayView());
                } catch (Throwable ignored) {
                    // View already gone with the window.
                }
            }
            try {
                Window window = activity.getWindow();
                if (window != null && keyCallback != null && window.getCallback() == keyCallback) {
                    window.setCallback(originalCallback);
                }
            } catch (Throwable ignored) {
                // Activity window already torn down.
            }
            if (keyCallback != null) keyCallback.session = null;
            SESSIONS.remove(activity);
        }

        // ---------------------------------------------------------------- poll

        private void poll() {
            long now = SystemClock.uptimeMillis();
            if (activity.isFinishing() || (Build.VERSION.SDK_INT >= 17 && activity.isDestroyed())) {
                close("activity finished");
                return;
            }
            int state;
            boolean playing;
            boolean playWhenReady;
            double pos;
            long durationMs;
            try {
                state = player.playbackState();
                playing = player.isPlaying();
                playWhenReady = player.playWhenReady();
                pos = player.positionMs() / 1000.0;
                durationMs = player.durationMs();
            } catch (Throwable error) {
                state = SkipPlayer.STATE_IDLE;
                playing = false;
                playWhenReady = false;
                pos = 0;
                durationMs = -1;
            }
            stall.update(state == SkipPlayer.STATE_BUFFERING || state == SkipPlayer.STATE_IDLE, now, (long) (pos * 1000.0));
            if (playing) everPlayed = true;
            if (state == SkipPlayer.STATE_READY && firstReadyAt == 0) {
                firstReadyAt = now;
                if (chapterTimingPending) {
                    chapterTimingPending = false;
                    log("chapter read at stream start (" + (now - chaptersStartedAt) + "ms before first frame)");
                }
            }
            if (state != SkipPlayer.STATE_IDLE) {
                seenAlive = true;
                deadSince = 0;
            }
            boolean anchorGone = anchor != null && Build.VERSION.SDK_INT >= 19
                    && !anchor.isAttachedToWindow() && now - attachedAt > 3000L;
            if (playerDead() || anchorGone) {
                hidePill(false);
                if (deadSince == 0) deadSince = now;
                if (now - deadSince > 2500L) close(anchorGone ? "view detached" : "player released");
                return;
            }
            prepareNext(state, playing, pos, durationMs, now);

            if (!IntroSkipPrefs.isEnabled(activity)) {
                // Master off: no lookups, no chapter reads, no intro/recap/credits/preview pill. Keep
                // the clock current so switching it back on mid-playback does not look like a user
                // seek. The Next-episode pill is not an intro feature: it only needs series-or-movie.
                current = null;
                lastPos = pos;
                lastPollAt = now;
                resolveMedia(now, durationMs, true);
                refreshSeekMarks(now, durationMs, false);
                if (pillShown && !nextPill) hidePill(true);
                if (!movie && maybeShowNext(pos, durationMs, playWhenReady, now)) {
                    updatePillPosition();
                } else if (pillShown && nextPill && (movie || !playWhenReady)) {
                    hidePill(true);
                }
                return;
            }
            resolveMedia(now, durationMs, false);
            if (initialPos < 0 && identity != null && state != SkipPlayer.STATE_IDLE) initialPos = pos;
            refreshSeekMarks(now, durationMs, true);
            if (movie) {
                // Movies are never skipped: no segments, no pill, no lookups.
                current = null;
                lastPos = pos;
                lastPollAt = now;
                if (pillShown) hidePill(true);
                return;
            }
            combine(now);
            if (maybePreSkip()) return;
            // Retry a FAILED chapter fetch (null = I/O error), bounded and spaced.
            // A clean empty result (chapterless file) is never retried: extra
            // range connections risk the playback itself on strict hosts.
            boolean chaptersFailed = chaptersRequested && chaptersDone && chapters == null;
            boolean chaptersStalled = chaptersRequested && !chaptersDone
                    && now - chaptersStartedAt > 30000L;
            if ((chaptersFailed || chaptersStalled) && chapterRetries < 3 && chapterUri != null
                    && now - chaptersStartedAt > 15000L) {
                chapterRetries++;
                chaptersDone = false;
                log("Chapters missing (" + (chaptersStalled ? "stalled" : "fetch failed")
                        + "), retrying fetch (" + chapterRetries + "/3)");
                startChapters(chapterUri);
            }

            long elapsed = lastPollAt == 0 ? POLL_MS : now - lastPollAt;
            boolean jumpedBack = lastPos >= 0 && pos < lastPos - 0.75;
            boolean jumpedForward = lastPos >= 0 && pos > lastPos + elapsed / 1000.0 * 2.5 + 1.0;
            boolean jumped = jumpedBack || jumpedForward;
            double moved = flowPos < 0 ? 0 : pos - flowPos;
            flowPos = pos;
            if (!playing || moved < 0 || moved >= 1.5) {
                flowTicks = 0;
            } else if (moved > 0) {
                flowTicks++;
                if (steadyTicks < 10) steadyTicks++;
            }
            // If the user rewinds to before a previously skipped segment (> 2 s before its start),
            // re-arm auto-skip for that segment so playing naturally into it skips again.
            if (jumpedBack && (!autoSkipped.isEmpty() || !jumpSkips.isEmpty())) {
                for (Segment s : segments) {
                    if (pos < s.startSeconds - 2.0 && (wasSkipped(s) || jumpSkips.containsKey(s.key()))) {
                        autoSkipped.remove(s.key());
                        jumpSkips.remove(s.key());
                        landFails.remove(s.key());
                        log("Re-armed " + s.label + " after rewind before start (pos=" + fmt(pos) + "s)");
                    }
                }
            }
            lastPos = pos;
            lastPollAt = now;
            if (playing && firstPlayingAt == 0) firstPlayingAt = now;
            if (now - lastTraceAt >= 1000L && sysprop("debug.aniskip.trace")) {
                lastTraceAt = now;
                log("TRACE pos=" + fmt3(pos) + " state=" + state + (playing ? " playing" : " paused"));
            }

            if (landingCheckAt != 0 && now >= landingCheckAt && playing) {
                landingCheckAt = 0;
                log("Position 1 s after skip: " + fmt3(pos) + "s (target " + fmt3(guardTarget) + "s)");
                PlaybackDiary.ev(activity, "landed", "pos", pos, "target", guardTarget);
            }
            if (restoreSeekAt != 0 && now >= restoreSeekAt) {
                restoreSeekAt = 0;
                restoreSeekParameters();
            }
            if (guardUntil != 0) {
                // Wait out the full guard window (plus any seek buffering) before
                // judging the landing: ExoPlayer masks getCurrentPosition() to the
                // seek target immediately, before decoding catches up. Acting on
                // the masked position clears the guard while the seek is in flight.
                boolean seekBuffering = state == SkipPlayer.STATE_BUFFERING && now - skippedAt < 6000L;
                if (now < guardUntil || seekBuffering) {
                    updatePillPosition();
                    if (noticeUntil != 0 && now > noticeUntil) hidePill(true);
                    return;
                }
                if (guardSegment != null && pos < guardTarget - 2.0) {
                    if (rearmAfterMiss(guardSegment)) {
                        autoSkipped.remove(guardSegment.key());
                        autoSkipped.remove(guardSegment.label);
                        log("Auto-skip did not land (pos=" + fmt3(pos) + "s < target="
                                + fmt3(guardTarget) + "s), re-arming " + guardSegment.label);
                    } else {
                        log("Auto-skip did not land (pos=" + fmt3(pos) + "s < target="
                                + fmt3(guardTarget) + "s) " + MAX_REARMS + " times: giving up on "
                                + guardSegment.label + ", button only");
                    }
                }
                guardUntil = 0;
                guardSegment = null;
                jumped = false;
                jumpedBack = false;
                jumpedForward = false;
                if (playing) flowTicks = 3;
            }

            Segment segment = segments.isEmpty() ? null : segmentAt(pos, durationMs);
            boolean warm = firstPlayingAt != 0 && now - firstPlayingAt > 3000L;
            // A viewer seek (never our own landing: the guard above clears `jumped`, and never the
            // start/resume jump: not warm yet) holds a segment's auto-skip until playback leaves it,
            // no seek key needed (see seekHoldTarget for the forward/backward rules). The button still shows.
            boolean holdNow = false;
            if (seekHoldKey != null && seekHoldReleased(pos)) seekHoldKey = null;
            if (jumped && warm) {
                Segment target = seekHoldTarget(segment, pos, jumpedBack);
                seekHoldKey = target == null ? null : target.key();
                holdNow = target != null && target == segment;
                if (target != null) {
                    log("Viewer seek " + (segment != null ? "into " : "just before ") + target.label
                            + " at " + fmt(pos) + "s (start " + fmt(target.startSeconds)
                            + "s): auto-skip held until playback leaves it");
                }
            }
            if (segment != null && segment == current && holdNow) currentBySeek = true;
            if (segment != current) {
                current = segment;
                // A rewind into the segment (within 3 s of a seek key) or a forward jump deep
                // (>= 15 s) into the segment within 1.2 s of a seek key is a deliberate user seek.
                // Fast-forwarding up to the intro (even when NEXT_SYNC snaps several seconds inside)
                // still auto-skips when the segment has not been skipped yet.
                // Previews are exempt from the forward-lag rule: they sit right after the credits
                // where everyone fast-forwards, so a deep landing must not latch "user seek".
                currentByJump = segment != null && jumped;
                double lag = segment == null ? 0.0 : pos - segment.startSeconds;
                // Previews and auto-credits are exempt from the forward-lag rule:
                // both sit where everyone fast-forwards (post-credits tail),
                // so a deep landing there must not latch "user seek".
                boolean forwardLagBlocked = segment != null && !segment.isPreview()
                        && !(segment.isCredits() && wantsAuto(segment)) && lag >= SEEK_HOLD_FORWARD_LAG_S;
                boolean deliberateSeek = segment != null && warm
                        && ((jumpedBack && now - lastSeekKeyAt < 3000L)
                        || (jumpedForward && now - lastSeekKeyAt < 1200L
                        && (wasSkipped(segment) || forwardLagBlocked)));
                currentBySeek = deliberateSeek || (segment != null && inheritSeek)
                        || (segment != null && segment.key().equals(seekHoldKey));
                if (segment != null) {
                    log("Segment entered " + segment.label + " pos=" + fmt(pos) + "s (start "
                            + fmt(segment.startSeconds) + "s, lag " + fmt(lag)
                            + "s, " + (currentBySeek ? "user seek" : currentByJump
                            ? "player jump (resume/start)" : "playing") + ")");
                }
            }

            inheritSeek = false;
            Integer jumpCount = segment == null ? null : jumpSkips.get(segment.key());
            boolean autoWanted = segment != null && wantsAuto(segment);
            boolean skippedAlready = segment != null && wasSkipped(segment);
            boolean jumpAllowed = !currentByJump || jumpCount == null || jumpCount < 3;
            boolean autoPending = segment != null && !currentBySeek && autoWanted
                    && !skippedAlready && jumpAllowed;
            // Once the decoder has produced 3 steady ticks in this session (or played > 1.5 s),
            // do not require post-seek ticks before firing auto-skip.
            boolean flowReady = flowTicks >= 3 || steadyTicks >= 3
                    || (firstPlayingAt != 0 && now - firstPlayingAt > 1500L);
            if (autoPending && playing && flowReady) {
                if (currentByJump) jumpSkips.put(segment.key(), jumpCount == null ? 1 : jumpCount + 1);
                skip(segment, true, pos, durationMs);
                return;
            }

            if (segment == null && playing) {
                // 200 ms polling would show up to 0.2 s of the OP: re-check right at its start.
                boolean recaps = IntroSkipPrefs.isRecapsEnabled(activity);
                boolean creditsOff = IntroSkipPrefs.isCreditsOff(activity);
                boolean previews = IntroSkipPrefs.isPreviewsEnabled(activity);
                for (Segment next : segments) {
                    if (!recaps && next.isRecap()) continue;
                    if (creditsOff && next.isCredits()) continue;
                    if (!previews && next.isPreview()) continue;
                    double ahead = next.startSeconds - pos;
                    if (ahead > 0 && ahead <= POLL_MS / 1000.0 + 0.05) {
                        MAIN.removeCallbacks(precise);
                        MAIN.postDelayed(precise, (long) (ahead * 1000.0) + 10L);
                        break;
                    }
                }
                if (maybeShowNext(pos, durationMs, playWhenReady, now)) {
                    updatePillPosition();
                    return;
                }
            }

            if (segment != null && playWhenReady && !autoPending) {
                installKeys();
                nextPill = false;
                if (pillSegment != segment || noticeUntil != 0 || !pillShown) {
                    log("Auto-gate blocked " + segment.label + ": autoWanted=" + autoWanted
                            + " currentBySeek=" + currentBySeek
                            + " wasSkipped=" + skippedAlready
                            + " currentByJump=" + currentByJump
                            + " jumpCount=" + (jumpCount == null ? 0 : jumpCount)
                            + " flowReady=" + flowReady
                            + " buttonOnly=" + (segment.inferred() || segment.buttonOnly));
                    showButton(segment);
                }
                refreshArmed(now);
            } else if (noticeUntil != 0) {
                if (now > noticeUntil) hidePill(true);
            } else if (pillShown && !nextPill) {
                hidePill(true);
            } else if (!pillShown && segment == null) {
                maybeShowNext(pos, durationMs, playWhenReady, now);
            }
            updatePillPosition();
        }

        /**
         * Coloured marks for the offered segments on the progress bar. Per poll only a signature of
         * the inputs is computed (reused arrays, no allocation); the marks are rebuilt on change.
         * Compose player screens (PortSkipPlayer) have no bar view: nothing is drawn there.
         */
        private void refreshSeekMarks(long now, long durationMs, boolean enabled) {
            try {
                int n = enabled ? segments.size() : 0;
                if (n > markStart.length) {
                    markStart = new double[n];
                    markEnd = new double[n];
                    markLabel = new String[n];
                }
                for (int i = 0; i < n; i++) {
                    Segment s = segments.get(i);
                    markStart[i] = s.startSeconds;
                    markEnd[i] = s.endSeconds;
                    markLabel[i] = s.label;
                }
                boolean recaps = IntroSkipPrefs.isRecapsEnabled(activity);
                boolean creditsOff = IntroSkipPrefs.isCreditsOff(activity);
                boolean previews = IntroSkipPrefs.isPreviewsEnabled(activity);
                double duration = durationMs > 0 ? durationMs / 1000.0 : 0.0;
                long sig = SeekMarks.signature(markStart, markEnd, markLabel, n, duration,
                        enabled, movie, recaps, creditsOff, previews);
                if (markList == null || sig != markSig) {
                    markSig = sig;
                    markList = SeekMarks.build(markStart, markEnd, markLabel, n, duration,
                            enabled, movie, recaps, creditsOff, previews);
                    log("Seek marks: " + markList.length + " of " + n + " segments");
                }
                if (markList.length > 0 && player instanceof PortSkipPlayer) {
                    if (!markComposeNoted) {
                        markComposeNoted = true;
                        log("Seek marks: not drawn, the Compose player screen has no bar view");
                    }
                    return;
                }
                String note = seekMarks.update(activity.getWindow().getDecorView(), markList, now);
                if (note != null) log("Seek marks: " + note);
            } catch (Throwable error) {
                log("ERROR seek marks: " + error);
            }
        }

        /**
         * NextPrep, once per poll: watches a prepared start for its first frame (none in time, or a player
         * error: leave the player); past 85 % or inside end credits, prepares the next episode once (streams in NextPrep, skip data
         * here); in the last 1.5 s marks that next as expected (the stock end-of-file advance). Fail soft.
         */
        private void prepareNext(int state, boolean playing, double pos, long durationMs, long now) {
            try {
                String cur = prepVideoId();
                NextPrep.notePlaying(cur); // a binge straight into the player spends the expectation
                String watch = NextPrep.pendingLaunch();
                long attachedWall = System.currentTimeMillis() - (now - attachedAt);
                // Only a player attached after the launch is the prepared one (an old session may read the new id).
                if (watch.length() > 0 && attachedWall >= NextPrep.launchedAt() - 1000L) {
                    boolean playerError = false, paused = false;
                    try {
                        playerError = player != null && player.playerError();
                        paused = player != null && !player.playWhenReady();
                    } catch (Throwable ignored) {
                    }
                    int act = NextPrep.watchPoll(cur, state == SkipPlayer.STATE_READY && playing,
                            playerError, lastOtherKeyAt > 0 && lastOtherKeyAt >= attachedAt, paused);
                    if (act == NextPrep.WATCH_READY) {
                        log("Prepared next episode: playing");
                    } else if (act == NextPrep.WATCH_ABANDON) {
                        log("Prepared next episode did not start in time: leaving the player");
                        PlaybackDiary.ev(activity, "next.fallback", "vid", watch, "why", playerError ? "player error" : "no frame");
                        activity.onBackPressed();
                        return;
                    } else if (act == NextPrep.WATCH_CANCELLED) {
                        log("Prepared next episode: fallback cancelled, another video is playing");
                    }
                }
                if (movie || !kindResolved || durationMs <= 0 || cur.length() == 0) return;
                if (cur.equals(prepKey)) {
                    if (state == SkipPlayer.STATE_ENDED || durationMs / 1000.0 - pos <= 1.5) NextPrep.expectNextAfter(cur);
                    return;
                }
                if (now - prepCheckedAt < 2000L) return;
                prepCheckedAt = now;
                if (!NextPrepCore.shouldPrepare(true, true, true, false, pos, durationMs / 1000.0,
                        currentCreditsStartSeconds()) || !NextPrep.enabled(activity)) {
                    return;
                }
                String[] c = NextPrep.playerContext(player instanceof PortSkipPlayer ? null : resolveFragment());
                if (c == null || c[0].length() == 0) return; // no next episode known (yet): checked again in 2 s
                prepKey = cur;
                if (c[2].length() == 0 && pendingInfo != null) c[2] = pendingInfo.title;
                log("Preparing next episode " + c[0] + " at " + fmt(pos) + "s");
                NextPrep.prepareFrom(activity, cur, c);
                prefetchSkipsFor(c[0]);
            } catch (Throwable error) {
                log("ERROR prepare next: " + error);
            }
        }

        /** Stremio video id of this session's media ("tt0944947:1:2"), "" when unknown. */
        private String prepVideoId() {
            if (player instanceof PortSkipPlayer) return PortHooks.streamId();
            if (cachedVideoId == null && kindResolved && !movie) cachedVideoId = stremioVideoId(anchor);
            return NextPrepCore.fullVideoId(cachedVideoId);
        }

        /** Looks up the next episode's skip segments now, with this episode's length (used only on a match). */
        private void prefetchSkipsFor(String nextVideoId) {
            MediaInfo info = pendingInfo;
            int[] req = StreamRanker.requestOf(nextVideoId);
            if (info == null || req[1] <= 0 || fetchedLength <= 0 || !IntroSkipPrefs.isEnabled(activity)) return;
            prefetchSkips(activity, info.imdbId, info.title, isKitsuId(info.imdbId) ? info.season : req[0], req[1],
                    fetchedLength);
        }

        private double currentCreditsStartSeconds() {
            for (Segment s : segments) {
                if (s.isCredits()) return s.startSeconds;
            }
            return -1.0;
        }

        private double currentCreditsEndSeconds() {
            for (Segment s : segments) {
                if (s.isCredits()) return s.endSeconds;
            }
            return -1.0;
        }

        /** Collects up to 2 addon subtitle URLs from the player's text tracks or Stremio's PlayerViewModel. */
        private List<String> collectCandidateSubUrls() {
            List<String> urls = new ArrayList<>();
            try {
                if (player != null) {
                    for (SkipPlayer.TextTrack track : player.textTracks()) {
                        String id = track.id;
                        if (id != null && (id.startsWith("http://") || id.startsWith("https://"))) {
                            if (track.selected) urls.add(0, id);
                            else if (!urls.contains(id)) urls.add(id);
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
            if (!urls.isEmpty()) return urls;
            try {
                Object frag = resolveFragment();
                Object vm = frag == null ? null : viewModelOf(frag);
                if (vm != null) {
                    Object flow = vm.getClass().getMethod("getState").invoke(vm);
                    Object state = flow == null ? null : flow.getClass().getMethod("getValue").invoke(flow);
                    Object subsMap = state == null ? null : state.getClass().getMethod("getSubtitles").invoke(state);
                    Method proxied = vm.getClass().getMethod("proxiedSubtitlesUri",
                            Class.forName("com.stremio.core.types.resource.Subtitle", false,
                                    vm.getClass().getClassLoader()));
                    if (subsMap instanceof Map) {
                        for (Object listObj : ((Map<?, ?>) subsMap).values()) {
                            if (!(listObj instanceof List)) continue;
                            for (Object sub : (List<?>) listObj) {
                                if (sub == null) continue;
                                Object uri = proxied.invoke(vm, sub);
                                if (uri != null) {
                                    String u = uri.toString();
                                    if (u.startsWith("http://") || u.startsWith("https://")) {
                                        urls.add(u);
                                        if (urls.size() >= 2) return urls;
                                    }
                                }
                            }
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
            return urls;
        }

        private void maybeStartSubPreviewScan() {
            if (closed || movie || hasSegmentType(segments, "preview")) return;
            final double runtime = runtimeSeconds();
            if (runtime < 300.0) return;
            List<String> candidates = collectCandidateSubUrls();
            String targetUrl = null;
            for (String u : candidates) {
                if (subUrlsChecked.add(u)) {
                    targetUrl = u;
                    break;
                }
            }
            if (targetUrl == null || subUrlsChecked.size() > 2) return;
            subPreviewRequested = true;
            final String urlToFetch = targetUrl;
            final int gen = mediaGeneration;
            NETWORK.execute(new Runnable() {
                @Override
                public void run() {
                    final String tail = fetchSubtitleTail(urlToFetch);
                    if (tail == null || tail.isEmpty()) return;
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            if (closed || gen != mediaGeneration || hasSegmentType(segments, "preview")) return;
                            double rt = runtimeSeconds();
                            double credEnd = currentCreditsEndSeconds();
                            double start = detectPreviewStartFromSubText(tail, credEnd, rt);
                            if (start > 0 && rt - start >= 3.5) {
                                Segment prev = clipPostCredit(new Segment(start, rt, "preview", "subtitle-cue"), chapters);
                                if (prev == null) {
                                    log("Subtitle preview dropped: inside a post-credit chapter");
                                    return;
                                }
                                trimCreditsBeforePreview(segments, prev, null);
                                cuePreview = prev;
                                segments.add(prev);
                                Collections.sort(segments, new java.util.Comparator<Segment>() {
                                    @Override
                                    public int compare(Segment a, Segment b) {
                                        return Double.compare(a.startSeconds, b.startSeconds);
                                    }
                                });
                                log("Subtitle preview detected (" + fmt3(start) + "-" + fmt3(rt)
                                        + "s) from addon subtitle tail");
                            } else {
                                log("Subtitle preview scan: no tail trigger in " + clipUrl(urlToFetch));
                            }
                        }
                    });
                }
            });
        }

        /** Live fallback for embedded MKV text tracks where no external URL exists. */
        private void onLiveCues(List<CharSequence> texts) {
            if (texts == null || texts.isEmpty()) return;
            if (hasSegmentType(segments, "preview")) return;
            double runtime = runtimeSeconds();
            if (runtime < 300.0 || lastPos < 0) return;
            double credEnd = currentCreditsEndSeconds();
            double minPos = credEnd > 0
                    ? Math.max(credEnd - 3.0, runtime - 90.0)
                    : runtime - 60.0;
            if (lastPos < minPos || lastPos > runtime - 2.0) return;

            for (CharSequence text : texts) {
                if (text == null) continue;
                String raw = text.toString();
                if (isPreviewBoilerplateCue(raw)) {
                    double start = (credEnd > 0 && lastPos >= credEnd - 1.5 && lastPos - credEnd <= 5.0)
                            ? credEnd : Math.max(minPos, lastPos - 0.2);
                    Segment prev = clipPostCredit(new Segment(start, runtime, "preview", "live-cue"), chapters);
                    if (prev == null) return;
                    cuePreview = prev;
                    segments.add(prev);
                    log("Live subtitle preview detected at " + fmt3(lastPos)
                            + "s -> segment " + fmt3(prev.startSeconds) + "-" + fmt3(prev.endSeconds) + "s");
                    MAIN.post(precise);
                    return;
                }
            }
        }

        private static String clipUrl(String url) {
            if (url == null) return "";
            int q = url.indexOf('?');
            return q > 0 ? url.substring(0, Math.min(q, 80)) : url.substring(0, Math.min(url.length(), 80));
        }

        private boolean maybeShowNext(double pos, long durationMs, boolean playWhenReady, long now) {
            try {
                // Keep a "skipped" notice visible for its full 2.2 s, never clobber it
                // with the next-episode pill on the tick right after a skip.
                if (noticeUntil != 0 && now <= noticeUntil) return false;
                if (movie || !playWhenReady || durationMs <= 0) return false;
                double durationSec = durationMs / 1000.0;
                double remaining = durationSec - pos;
                if (remaining > 90.0 || remaining < -300.0) {
                    if (nextPill) hidePill(true);
                    return false;
                }
                // Guard negative remaining (timer overrun past the end) against
                // mid-file duration glitches: short files, early positions and
                // cold playback never summon the card.
                if (remaining < 0 && (durationMs < 300000L || pos < 300.0 || steadyTicks < 5)) {
                    return false;
                }
                // Timer overruns the metadata end by 2 s+ with no ended event:
                // advance once, hands-free. Duration-stability is enforced by
                // the guards above (long warm playback near the real end).
                if (remaining <= -2.0 && !eofAutoAdvanced && !IntroSkipPrefs.isManualMode(activity)
                        && IntroSkipPrefs.isEnabled(activity)) {
                    eofAutoAdvanced = true;
                    log("Timer overrun past duration (" + fmt(pos) + "s / " + fmt(durationSec)
                            + "s): auto-advancing to next episode");
                    hidePill(false);
                    playNextEpisode();
                    return true;
                }
                // Pill only (the EOF auto-advance above is unchanged). Season finale / last
                // episode: no next video, so no pill and no OK to swallow. Unknown (reflection
                // failed) keeps the pill, as before.
                if (nextStateAt == 0 || now - nextStateAt > 2000L) {
                    nextStateAt = now == 0 ? 1 : now;
                    nextState = nextVideoState();
                }
                if (nextState == 0) {
                    if (nextPill) hidePill(true);
                    return false;
                }
                // A post-credit scene is never covered by the pill nor left early by OK.
                if (inPostCreditChapter(pos) || inPostCredits(appPostCredits, pos)) {
                    if (nextPill) hidePill(true);
                    return false;
                }
                if (pillShown && nextPill) {
                    refreshArmed(now);
                    return true;
                }
                showNextEpisode();
                refreshArmed(now);
                return true;
            } catch (Throwable ignored) {
                return false;
            }
        }

        /** One automatic skip per segment and media: keyed by exact window so one
         * segment can never poison another that shares its label. */
        private boolean wasSkipped(Segment segment) {
            return autoSkipped.contains(segment.key());
        }

        /** Upper segment bound clamped below the EOF seek clamp, so landing from an
         * end-of-file skip never re-enters the same segment on the next tick. */
        private Segment segmentAt(double pos, long durationMs) {
            boolean recaps = IntroSkipPrefs.isRecapsEnabled(activity);
            boolean creditsOff = IntroSkipPrefs.isCreditsOff(activity);
            boolean previews = IntroSkipPrefs.isPreviewsEnabled(activity);
            double eofSeekCap = durationMs > 0
                    ? (durationMs - 1000.0) / 1000.0 - 0.25 : Double.MAX_VALUE;
            for (Segment segment : segments) {
                if (segment.isPostCredits()) continue; // protected scene, never offered (defence in depth)
                if (!recaps && segment.isRecap()) continue;
                if (creditsOff && segment.isCredits()) continue;
                if (!previews && segment.isPreview()) continue;
                double endLimit = Math.min(segment.endSeconds - 0.4, eofSeekCap);
                if (pos >= segment.startSeconds && pos < endLimit) return segment;
            }
            return null;
        }

        /**
         * The segment a viewer seek to pos holds. Backward: the one it landed in, else the next one
         * starting within SEEK_HOLD_LEAD_S (exactly SEEK_HOLD_LEAD_S ahead is held, the re-arm needs
         * strictly more). Forward: only a landing >= SEEK_HOLD_FORWARD_LAG_S inside. Previews and auto-credits are exempt (everyone fast-forwards
         * into them, see the forward-lag rule), as is any type the prefs hide.
         */
        private Segment seekHoldTarget(Segment at, double pos, boolean back) {
            Segment target = at;
            // Forward seeks are the viewer passing through: only a deep landing (lag >= 15 s) holds,
            // a landing before the segment or shallow inside it still auto-skips.
            if (!back) return target != null && pos - target.startSeconds >= SEEK_HOLD_FORWARD_LAG_S
                    && !target.isPreview() && !(target.isCredits() && wantsAuto(target)) ? target : null;
            if (target == null) {
                boolean recaps = IntroSkipPrefs.isRecapsEnabled(activity);
                boolean creditsOff = IntroSkipPrefs.isCreditsOff(activity);
                boolean previews = IntroSkipPrefs.isPreviewsEnabled(activity);
                for (Segment next : segments) {
                    if (next.isPostCredits() || (!recaps && next.isRecap())
                            || (creditsOff && next.isCredits()) || (!previews && next.isPreview())) continue;
                    double ahead = next.startSeconds - pos;
                    if (ahead > 0 && ahead <= SEEK_HOLD_LEAD_S) {
                        target = next;
                        break;
                    }
                }
            }
            if (target == null || target.isPreview() || (target.isCredits() && wantsAuto(target))) return null;
            return target;
        }

        /** The held segment is gone (re-merged), or playback is past its end or well before its start. */
        private boolean seekHoldReleased(double pos) {
            for (Segment s : segments) {
                if (s.key().equals(seekHoldKey)) {
                    return pos >= s.endSeconds || pos < s.startSeconds - SEEK_HOLD_LEAD_S;
                }
            }
            return true;
        }

        private boolean wantsAuto(Segment segment) {
            if (segment.inferred() || segment.buttonOnly) return false;
            if (segment.isCredits()) return IntroSkipPrefs.isCreditsAuto(activity);
            return !IntroSkipPrefs.isManualMode(activity);
        }

        /**
         * Pre-frame skip: a segment starting at ~0:00 whose times are known before playback
         * has ever moved is seeked past at once, while the loading screen is still up, so the
         * viewer never sees the intro start and then freeze on the seek. The seek is the
         * engine's own skip() (EXACT seek, guard, diary "skip"); the gate is PreSkip, fed
         * with the same wantsAuto/per-type answers the normal auto-skip uses. No wait is ever
         * added and playWhenReady is never touched (a refresh-rate hold at the start position
         * simply leaves the window open): any "no" - late data, a setting off, a resume
         * elsewhere - keeps the normal auto-skip exactly as before. Media3 path only (the
         * Compose engines report neither first frame nor is-playing to this session).
         */
        private boolean maybePreSkip() {
            try {
                if (closed || preSkipDone || segments.isEmpty() || player == null) return false;
                int state = player.playbackState();
                double pos = player.positionMs() / 1000.0;
                long durationMs = player.durationMs();
                if (initialPos < 0 && !everPlayed && state != SkipPlayer.STATE_IDLE) initialPos = pos;
                Segment candidate = null;
                for (Segment s : segments) {
                    if (s.startSeconds <= PreSkip.EPISODE_START_MAX_S
                            && pos >= s.startSeconds - PreSkip.LEAD_S
                            && pos < s.endSeconds - PreSkip.END_MARGIN_S) {
                        candidate = s;
                        break;
                    }
                }
                if (candidate == null) return false;
                boolean typeEnabled = (!candidate.isRecap() || IntroSkipPrefs.isRecapsEnabled(activity))
                        && (!candidate.isCredits() || !IntroSkipPrefs.isCreditsOff(activity))
                        && (!candidate.isPreview() || IntroSkipPrefs.isPreviewsEnabled(activity));
                String deny = PreSkip.denyReason(player instanceof Media3SkipPlayer,
                        IntroSkipPrefs.isEnabled(activity), movie || !kindResolved, typeEnabled,
                        wantsAuto(candidate), wasSkipped(candidate), preSkipDone, everPlayed,
                        lastSeekKeyAt != 0, state, candidate.startSeconds, candidate.endSeconds,
                        pos, initialPos, durationMs > 0 ? durationMs / 1000.0 : 0.0);
                if (deny != null) {
                    if (everPlayed && !preSkipMissLogged && player instanceof Media3SkipPlayer) {
                        preSkipMissLogged = true;
                        log("Pre-frame skip missed " + candidate.label + " " + fmt3(candidate.startSeconds)
                                + "-" + fmt3(candidate.endSeconds) + "s (" + deny
                                + "): normal auto-skip applies");
                    }
                    return false;
                }
                // A pending source can still narrow this window while the player only
                // prepares: hold the seek (no added wait, playWhenReady untouched) until
                // sources answer, READY, or a frame renders. Chapter windows never wait.
                if ((!aniDone || !introDone) && !firstFrameRendered
                        && state == SkipPlayer.STATE_BUFFERING
                        && !InnerBounds.chapterGuarded(candidate.source) && !OwnTimes.isOwn(candidate.source)) {
                    if (!preSkipDeferLogged) {
                        preSkipDeferLogged = true;
                        log("Pre-frame skip deferred " + candidate.label + " "
                                + fmt3(candidate.startSeconds) + "-" + fmt3(candidate.endSeconds)
                                + "s: online sources pending (aniDone=" + aniDone
                                + ", introDone=" + introDone + "), firing with latest bounds before first frame");
                    }
                    return false;
                }
                preSkipDone = true;
                log("Pre-frame skip " + candidate.label + " " + fmt3(candidate.startSeconds) + "-"
                        + fmt3(candidate.endSeconds) + "s at pos " + fmt3(pos) + "s (state " + state
                        + ", firstFrame=" + firstFrameRendered + ", source " + candidate.source + ")");
                PlaybackDiary.ev(activity, "skip.pre", "type", candidate.label, "from", pos,
                        "to", candidate.endSeconds, "state", state, "frame", firstFrameRendered,
                        "seg", PlaybackDiary.seg(candidate.label, candidate.startSeconds,
                                candidate.endSeconds, candidate.source));
                skip(candidate, true, pos, durationMs);
                return true;
            } catch (Throwable error) {
                log("ERROR pre-frame skip: " + error);
                return false;
            }
        }

        private void skip(Segment segment, boolean automatic, double pos, long durationMs) {
            double target = segment.endSeconds;
            // Chain credits straight through an adjacent preview when both are
            // auto: one seek instead of two, and the preview can never strand.
            Segment chainedPreview = null;
            if (segment.isCredits() && IntroSkipPrefs.isPreviewsEnabled(activity)
                    && !IntroSkipPrefs.isManualMode(activity)) {
                for (Segment s : segments) {
                    if (s.isPreview() && !s.inferred() && Math.abs(s.startSeconds - segment.endSeconds) <= 1.5
                            && s.endSeconds > target) {
                        target = s.endSeconds;
                        chainedPreview = s;
                        break;
                    }
                }
            }
            if (durationMs > 0 && target * 1000.0 > durationMs - 1000.0) {
                target = Math.max(segment.startSeconds, (durationMs - 1000.0) / 1000.0);
            }
            String mode;
            skippedAt = SystemClock.uptimeMillis();
            try {
                mode = exactSeek(Math.round(target * 1000.0));
            } catch (Throwable error) {
                log("ERROR seek: " + error);
                return;
            }
            // Mark EOF-clamped skips too, so an end-of-file preview cannot loop back
            // into its own segment on the landing tick.
            boolean clampedToEof = durationMs > 0 && target * 1000.0 >= durationMs - 1500.0;
            if (!automatic || target - pos >= 3.0 || clampedToEof) {
                autoSkipped.add(segment.key());
                if (chainedPreview != null) autoSkipped.add(chainedPreview.key());
            }
            guardUntil = SystemClock.uptimeMillis() + 2500L;
            guardTarget = target;
            guardSegment = automatic ? segment : null;
            landingCheckAt = SystemClock.uptimeMillis() + 1000L;
            current = null;
            log((automatic ? "SKIP AUTO " : "SKIP MANUAL ") + segment.label
                    + (chainedPreview != null ? "+preview " : " ") + fmt3(pos)
                    + "s -> " + fmt3(target) + "s (segment " + fmt3(segment.startSeconds) + "-"
                    + fmt3(segment.endSeconds) + ", source " + segment.source + ", seek " + mode + ")");
            PlaybackDiary.ev(activity, "skip", "type", segment.label, "how", automatic ? "auto" : "button", "from", pos, "to", target, "seg", PlaybackDiary.seg(segment.label, segment.startSeconds, segment.endSeconds, segment.source), "seek", mode);
            showNotice(chainedPreview != null ? chainedPreview.skippedText() : segment.skippedText());
        }

        /**
         * Stremio builds its ExoPlayer with SeekParameters.NEXT_SYNC: every seek lands on the
         * next keyframe, seconds past the target. Our skip asks the player for EXACT for the seek
         * (SkipPlayer.beginExactSeek) and restores the original mode after the guard window,
         * because restoring immediately races the async seek and it still snaps to keyframes.
         */
        private String exactSeek(long targetMs) {
            boolean exact = !legacySeek() && player.beginExactSeek();
            if (exact) {
                // Keep EXACT active while the async seek completes: restoring
                // NEXT_SYNC on the next line races the playback thread and
                // the seek still snaps to keyframes (verified in logcat).
                restoreSeekAt = SystemClock.uptimeMillis() + 2500L;
            }
            player.seekTo(targetMs);
            return exact ? "EXACT" : "default";
        }

        /** Restores the player's original seek parameters once the guard window ends. */
        private void restoreSeekParameters() {
            player.endExactSeek();
        }

        /** Restores the original seek parameters now if an exact seek is still pending, and clears it. */
        private void flushSeekRestore() {
            if (restoreSeekAt == 0) return;
            restoreSeekAt = 0;
            try {
                if (player != null) restoreSeekParameters();
            } catch (Throwable error) {
                log("ERROR seek restore: " + error);
            }
        }

        // ------------------------------------------------------------- media

        private void resolveMedia(long now, long durationMs, boolean kindOnly) {
            String id;
            try {
                id = player.mediaIdentity();
            } catch (Throwable error) {
                return;
            }
            if (identity != null && !identity.equals(id)) {
                log("New media detected");
                // Same player, new media in place: the attach time belongs to the new
                // media (prepareNext's prepared-start watchdog compares against it).
                attachedAt = now;
                resetMedia();
            }
            identity = id;
            if (movie && kindResolved) return;
            if (!kindResolved) {
                if (now < nextKindAt) return;
                nextKindAt = now + 1000L;
                resolveKind();
                if (!kindResolved || movie) return;
            }
            if (kindOnly) return;
            if (cachedVideoId == null) cachedVideoId = stremioVideoId(anchor);
            if (!chaptersRequested) {
                chaptersRequested = true;
                chapterUri = player.mediaUri();
                // Read at stream start (before the first frame), never mid-playback; a late attach reads at once.
                if (firstReadyAt == 0) {
                    chapterTimingPending = true;
                } else {
                    log("chapter read at stream start (0ms before first frame, player already READY)");
                }
                startChapters(chapterUri);
            }
            if (loadedKey != null) {
                if (fetchedLength == 0 && durationMs > 0 && pendingInfo != null) {
                    long realSec = Math.round(durationMs / 1000.0);
                    if (realSec > 0) {
                        log("Duration now known (" + realSec + "s): refreshing lookup");
                        startFetch(pendingInfo, realSec, durationMs);
                    }
                }
                return;
            }
            if (pendingInfo == null) {
                // The metadata scan uses reflection: retry for ~30 s, then stop (movies,
                // trailers) until the media item changes.
                if (now < nextInfoAt || infoAttempts >= 20) return;
                infoAttempts++;
                nextInfoAt = now + 1500L;
                MediaInfo info = mediaInfoFor(player, anchor, cachedVideoId);
                if (!info.snapshot.equals(lastSnapshot)) {
                    lastSnapshot = info.snapshot;
                    log("MEDIA\n" + info.debug);
                }
                if (!info.ready()) {
                    return;
                } else {
                    pendingInfo = info;
                    readySince = now;
                }
            }
            // Wait for the real duration: AniSkip filters submissions by length, and the
            // submission measured on our cut is what puts the skip on the right seconds.
            if (durationMs <= 0 && now - readySince < 8000L) return;
            startFetch(pendingInfo, durationMs > 0 ? Math.round(durationMs / 1000.0) : 0L, durationMs);
        }

        /**
         * Series or movie, from every signal: Stremio's video id, its meta type and (with no id and
         * no type readable) a season+episode in the title. Only "series" opens the skip engine; a
         * movie, a conflict or no signal stays closed. Retries once a second for ~15 s, then gives up.
         */
        private void resolveKind() {
            String[] signals = stremioKindSignals(anchor);
            int season = 0;
            int episode = 0;
            if (signals[0].length() == 0 && signals[1].length() == 0) {
                try {
                    MediaInfo info = mediaInfoFor(player, anchor, null);
                    season = info.season;
                    episode = info.episode;
                } catch (Throwable ignored) {
                }
            }
            String[] kind = classifyKind(signals[0], signals[1], season, episode);
            String what = "videoId=" + (signals[0].length() == 0 ? "<unreadable>" : signals[0])
                    + " type=" + (signals[1].length() == 0 ? "<unreadable>" : signals[1]);
            kindAttempts++;
            if ("series".equals(kind[0])) {
                kindResolved = true;
                movie = false;
                log("Series (" + kind[1] + "): " + what);
            } else if ("movie".equals(kind[0])) {
                kindResolved = true;
                markMovie();
                log("Movie (" + kind[1] + "): " + what);
                PlaybackDiary.ev(activity, "play", "app", "stremio", "type", "movie", "vid", signals[0], "engine", player.engineName());
            } else if (kindAttempts >= 15) {
                kindResolved = true;
                log("Movie or series unresolved (" + kind[1] + "), skipping disabled: " + what);
            }
        }

        /** A movie: drop everything that could skip and stop all lookups until the media changes. */
        private void markMovie() {
            movie = true;
            fetchGeneration++;
            mediaGeneration++;
            segments.clear();
            autoSkipped.clear();
            landFails.clear();
            cuePreview = null;
            appPostCredits = null;
            chapters = null;
            online = null;
            onlineSource = null;
            appliedSignature = null;
            current = null;
            hidePill(false);
        }

        private void startFetch(MediaInfo info, final long episodeLength, final long runtimeMs) {
            loadedKey = info.key;
            fetchedLength = episodeLength;
            pendingInfo = info;
            if (!diaryPlay) { diaryPlay = true; PlaybackDiary.ev(activity, "play", "app", "stremio", "type", "series", "title", info.title, "vid", cachedVideoId == null ? null : cachedVideoId[0], "id", info.imdbId, "s", info.season, "e", info.episode, "engine", player.engineName(), "host", chapterUri == null ? "" : PlaybackDiary.host(chapterUri.toString())); }
            if (!IntroSkipPrefs.isEnabled(activity)) {
                aniDone = true;
                introDone = true;
                log("Lookup skipped: disabled in settings");
                return;
            }
            final int generation = ++fetchGeneration;
            final String title = info.title;
            final int season = info.season;
            final int episode = info.episode;
            final String imdbId = info.imdbId;
            aniDone = false;
            introDone = false;
            introResult = null;
            aniResult = null;
            aniRetryPending = false;
            introRetryPending = false;
            final long startedAt = SystemClock.uptimeMillis();
            log("Lookup: " + title + " S" + season + "E" + episode + " length=" + episodeLength + "s");
            PlaybackDiary.ev(activity, "lookup", "title", title, "s", season, "e", episode, "id", imdbId, "len", episodeLength, "ani", IntroSkipPrefs.isAnimeEnabled(activity), "mode", IntroSkipPrefs.mode(activity));
            log("Settings: enabled=" + IntroSkipPrefs.isEnabled(activity)
                    + " anime=" + IntroSkipPrefs.isAnimeEnabled(activity)
                    + " mode=" + IntroSkipPrefs.mode(activity)
                    + " recaps=" + IntroSkipPrefs.isRecapsEnabled(activity));
            PreSkips pre = takePreSkips(imdbId, title, season, episode, episodeLength,
                    IntroSkipPrefs.isAnimeEnabled(activity));
            if (pre != null) {
                // Looked up while the previous episode played (same lookups, length within tolerance).
                log("Lookup: prepared during the previous episode (length " + pre.length + "s)");
                PlaybackDiary.ev(activity, "next.skips", "used", true, "s", season, "e", episode);
                if (pre.ani != null) {
                    onAniSkip(generation, new ArrayList<Segment>(pre.ani), startedAt, false, 0, null);
                } else {
                    aniDone = true;
                    onlineStartedAt = startedAt;
                }
                if (pre.intro != null) {
                    onIntroDb(generation, new ArrayList<Segment>(pre.intro), startedAt,
                            new java.util.LinkedHashSet<String>(), 0, null);
                } else {
                    introDone = true;
                }
                return;
            }
            // AniSkip and IntroDB run on separate threads with separate error handling:
            // IntroDB can never delay or break AniSkip. Each result is applied as soon as
            // it arrives and re-merged (AniSkip > TheIntroDB > IntroDB.app > SkipDB).
            if (IntroSkipPrefs.isAnimeEnabled(activity)) {
                runAniSkip(generation, imdbId, title, season, episode, episodeLength, startedAt, 0);
            } else {
                aniDone = true;
                onlineStartedAt = startedAt;
                log("AniSkip skipped: disabled in settings");
            }
            if (isKitsuId(imdbId)) {
                introDone = true;
                log("IntroDB skipped: Kitsu id " + imdbId + " has no IMDb season/episode");
                return;
            }
            runIntroChain(generation, new IntroChain(activity, imdbId, title, season, episode, episodeLength, runtimeMs),
                    null, startedAt, 0);
        }

        private DebugLogger lookupLogger() {
            return new DebugLogger() {
                @Override
                public void log(String message) {
                    Session.this.log(message);
                }
            };
        }

        private void runAniSkip(final int generation, final String imdbId, final String title, final int season,
                                final int episode, final long episodeLength, final long startedAt,
                                final int attempt) {
            final DebugLogger logger = lookupLogger();
            NETWORK.execute(new Runnable() {
                @Override
                public void run() {
                    List<Segment> result;
                    boolean failed;
                    beginSource(ANISKIP_BUDGET_MS);
                    try {
                        result = fetchAniSkip(activity, imdbId, title, season, episode, episodeLength, logger);
                        failed = sourceFailed();
                    } catch (Throwable error) {
                        logger.log("ERROR AniSkip: " + error);
                        result = new ArrayList<Segment>();
                        failed = true;
                    } finally {
                        endSource();
                    }
                    final List<Segment> found = result;
                    final boolean lookupFailed = failed;
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            onAniSkip(generation, found, startedAt, lookupFailed, attempt, new Runnable() {
                                @Override
                                public void run() {
                                    runAniSkip(generation, imdbId, title, season, episode, episodeLength,
                                            startedAt, attempt + 1);
                                }
                            });
                        }
                    });
                }
            });
        }

        /** Runs the failed stages (all when {@code only} is null) of the IntroDB chain on the NETWORK pool. */
        private void runIntroChain(final int generation, final IntroChain chain, final Set<String> only,
                                   final long startedAt, final int attempt) {
            final DebugLogger logger = lookupLogger();
            NETWORK.execute(new Runnable() {
                @Override
                public void run() {
                    Set<String> failed;
                    try {
                        failed = chain.run(only, new IntroSink() {
                            @Override
                            public void partial(final List<Segment> snapshot) {
                                MAIN.post(new Runnable() {
                                    @Override
                                    public void run() {
                                        onIntroPartial(generation, snapshot, startedAt);
                                    }
                                });
                            }
                        }, logger);
                    } catch (Throwable error) {
                        logger.log("ERROR IntroDB: " + error);
                        failed = new java.util.LinkedHashSet<String>();
                        failed.add(IntroChain.CINEMETA);
                    }
                    final Set<String> lookupFailed = failed;
                    final List<Segment> found = chain.result();
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            onIntroDb(generation, found, startedAt, lookupFailed, attempt, new Runnable() {
                                @Override
                                public void run() {
                                    runIntroChain(generation, chain, lookupFailed, startedAt, attempt + 1);
                                }
                            });
                        }
                    });
                }
            });
        }

        /**
         * Schedules a refetch of a failed source after RETRY_BACKOFF_MS[attempt]. The refetch
         * only starts if the same media is still playing (generation counters) and the
         * session is open; its result is checked again on arrival. False = attempts used up.
         */
        private boolean retryLater(final int generation, int attempt, String what, final Runnable work) {
            if (attempt >= RETRY_BACKOFF_MS.length) {
                log("Lookup retry: giving up on " + what + " after " + attempt + " retries");
                return false;
            }
            final long delay = RETRY_BACKOFF_MS[attempt];
            final int media = mediaGeneration;
            log("Lookup retry " + (attempt + 1) + "/" + RETRY_BACKOFF_MS.length + " for " + what
                    + " in " + (delay / 1000L) + " s");
            MAIN.postDelayed(new Runnable() {
                @Override
                public void run() {
                    if (closed || generation != fetchGeneration || media != mediaGeneration) return;
                    work.run();
                }
            }, delay);
            return true;
        }

        private void onAniSkip(int generation, List<Segment> found, long startedAt, boolean failed,
                               int attempt, Runnable retry) {
            if (closed || generation != fetchGeneration) return;
            aniDone = true;
            onlineStartedAt = startedAt;
            // A failed refetch must not wipe a partial result an earlier attempt produced.
            if (!(failed && found.isEmpty() && aniResult != null && !aniResult.isEmpty())) aniResult = found;
            log("AniSkip landed after " + (SystemClock.uptimeMillis() - startedAt) + " ms: "
                    + found.size() + " segment(s)" + (failed ? ", FAILED" : ""));
            PlaybackDiary.ev(activity, "src", "name", "AniSkip", "status", failed ? "fail" : found.isEmpty() ? "nodata" : "ok", "why", failed ? PlaybackDiary.lastError() : null, "ms", SystemClock.uptimeMillis() - startedAt, "try", attempt, "segs", diarySegs(found));
            aniRetryPending = failed && retryLater(generation, attempt, "AniSkip", retry);
            remergeOnline();
        }

        /** An IntroDB-chain stage finished (TheIntroDB, IntroDB.app, SkipDB): apply it now. */
        private void onIntroPartial(int generation, List<Segment> snapshot, long startedAt) {
            if (closed || generation != fetchGeneration) return;
            if (onlineStartedAt == 0) onlineStartedAt = startedAt;
            introResult = snapshot;
            log("IntroDB stage landed after " + (SystemClock.uptimeMillis() - startedAt) + " ms: "
                    + snapshot.size() + " segment(s)");
            PlaybackDiary.ev(activity, "src", "name", "IntroDB-stage", "status", snapshot.isEmpty() ? "nodata" : "ok", "ms", SystemClock.uptimeMillis() - startedAt, "segs", diarySegs(snapshot));
            remergeOnline();
        }

        private void onIntroDb(int generation, List<Segment> found, long startedAt, Set<String> failed,
                               int attempt, Runnable retry) {
            if (closed || generation != fetchGeneration) return;
            introDone = true;
            if (onlineStartedAt == 0) onlineStartedAt = startedAt;
            // A chain that died before assembling hands back an empty stale list: keep the stage snapshots.
            if (!(found.isEmpty() && !failed.isEmpty() && introResult != null && !introResult.isEmpty())) {
                introResult = found;
            }
            log("IntroDB finished after " + (SystemClock.uptimeMillis() - startedAt) + " ms: "
                    + found.size() + " segment(s)" + (failed.isEmpty() ? "" : ", FAILED " + failed));
            PlaybackDiary.ev(activity, "src", "name", "IntroDB", "status", !failed.isEmpty() ? "fail" : found.isEmpty() ? "nodata" : "ok", "why", failed.isEmpty() ? null : failed.toString(), "ms", SystemClock.uptimeMillis() - startedAt, "try", attempt, "segs", diarySegs(found));
            introRetryPending = !failed.isEmpty() && retryLater(generation, attempt, "IntroDB " + failed, retry);
            remergeOnline();
        }

        /** Rebuilds the online list from scratch so priority never depends on arrival order. */
        private void remergeOnline() {
            mergeOnline(aniResult, introResult);
            combine(SystemClock.uptimeMillis());
        }

        /**
         * Keeps AniSkip first and fills every segment TYPE it lacks (OP, recap, credits,
         * preview) from the fallback (TheIntroDB > IntroDB.app > SkipDB). A fallback OP
         * never replaces an AniSkip OP (bar the chapter-aligned rule below).
         */
        private void mergeOnline(List<Segment> primary, List<Segment> fallback) {
            double runtime = runtimeSeconds();
            List<Segment> merged = new ArrayList<>();
            if (primary != null) merged.addAll(primary);
            boolean hadPrimary = !merged.isEmpty();
            // Own times beat every online source for their types (named chapters still win in combine()).
            if (fallback != null) {
                for (Segment s : fallback) {
                    if (!OwnTimes.isOwn(s.source)) continue;
                    for (int i = merged.size() - 1; i >= 0; i--) {
                        if (merged.get(i).label.equals(s.label)) merged.remove(i);
                    }
                }
            }
            if (fallback != null) {
                for (Segment s : fallback) {
                    if (s.isPostCredits()) {
                        // Protected scene marker: carried to combine() whatever AniSkip holds.
                        if (!hasSegmentType(merged, s.label)) merged.add(s);
                        continue;
                    }
                    if ("OP".equals(s.label) && chapters != null && !chapters.isEmpty()) {
                        for (int i = 0; i < merged.size(); i++) {
                            Segment p = merged.get(i);
                            if ("OP".equals(p.label)
                                    && nearestBoundary(p.startSeconds, chapters) < 0
                                    && nearestBoundary(s.startSeconds, chapters) >= 0
                                    && nearestBoundary(s.endSeconds, chapters) >= 0) {
                                log("Preferring chapter-aligned IntroDB OP (" + fmt3(s.startSeconds)
                                        + "-" + fmt3(s.endSeconds) + ") over unaligned AniSkip OP ("
                                        + fmt3(p.startSeconds) + "-" + fmt3(p.endSeconds) + ")");
                                merged.remove(i);
                                break;
                            }
                        }
                    }
                    if (!hasUsableSegmentType(merged, s.label, runtime)
                            && !overlapsBlocking(merged, s)) {
                        merged.add(s);
                    }
                }
            }
            if (fallback != null) {
                // Inner bounds vs the IntroDB chain (15 s agreement -> overlap only).
                // A segment on chapter boundaries (snap both-ends rule) never narrows.
                DebugLogger innerLog = lookupLogger();
                for (int i = 0; i < merged.size(); i++) {
                    Segment orig = merged.get(i);
                    if (chapters != null && !chapters.isEmpty()) {
                        double cs = nearestBoundary(orig.startSeconds, chapters);
                        double ce = nearestBoundary(orig.endSeconds, chapters);
                        if (cs >= 0 && ce >= 0 && Math.abs((ce - cs)
                                - (orig.endSeconds - orig.startSeconds)) <= 5.0) continue;
                    }
                    // A to-end segment combine() will guard-drop narrows nothing and is narrowed
                    // by nothing: the bounded source stands alone, as with no TheIntroDB answer.
                    if (guardDroppedToEnd(orig, runtime)) continue;
                    Segment cur = orig;
                    for (Segment f : fallback) {
                        if (f == orig || !f.label.equals(orig.label)) continue;
                        if (guardDroppedToEnd(f, runtime)) continue;
                        Segment probe = innerBounds(orig, f, runtime, innerLog);
                        if (probe != null) {
                            double[] folded = InnerBounds.combine(cur.startSeconds, cur.endSeconds,
                                    probe.startSeconds, probe.endSeconds);
                            if (folded != null) {
                                cur = new Segment(folded[0], folded[1], orig.label,
                                        cur == orig ? probe.source : cur.source + "+" + safe(f.source));
                            }
                        }
                    }
                    if (!cur.buttonOnly && ("OP".equals(orig.label) || orig.isRecap())) {
                        Segment hit = orig.zeroConflictIn(primary);
                        if (hit == null) hit = orig.zeroConflictIn(fallback);
                        if (hit == null) hit = orig.buttonOnlyOverlapIn(fallback);
                        if (hit == null) hit = orig.buttonOnlyOverlapIn(primary);
                        if (hit != null) {
                            cur = cur.buttonOnlyCopy();
                            String key = orig.key() + "|" + hit.key();
                            if (!key.equals(zeroConflictLogKey)) {
                                zeroConflictLogKey = key;
                                log("Zero-start " + orig.label + " button only: [" + orig.source + "] "
                                        + orig.startSeconds + "-" + orig.endSeconds + "s vs [" + hit.source + "] "
                                        + hit.startSeconds + "-" + hit.endSeconds + "s");
                            }
                        }
                    }
                    if (cur != orig) merged.set(i, cur);
                }
            }
            boolean allDone = aniDone && introDone && !aniRetryPending && !introRetryPending;
            if (!merged.isEmpty() || allDone) {
                online = merged;
                onlineSource = hadPrimary ? "AniSkip" : "IntroDB";
            }
        }

        private void startChapters(Uri uri) {
            String scheme = uri == null ? "" : safe(uri.getScheme()).toLowerCase(Locale.US);
            if (!scheme.equals("http") && !scheme.equals("https")) {
                chaptersDone = true;
                log("Chapters: non-HTTP stream, skipped");
                return;
            }
            final String url = uri.toString();
            final int generation = mediaGeneration;
            final int seq = ++chapterFetchSeq;
            chaptersStartedAt = SystemClock.uptimeMillis();
            NETWORK.execute(new Runnable() {
                @Override
                public void run() {
                    final List<MkvChapters.Chapter> found = MkvChapters.read(url, new MkvChapters.Log() {
                        @Override
                        public void log(String message) {
                            Session.this.log(message);
                        }
                    });
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            onChaptersResult(generation, seq, found);
                        }
                    });
                }
            });
        }

        /**
         * Main-thread end of a chapter read. A retry can leave two reads in flight: a late failure
         * (null) must never erase chapters a read already delivered, nor mark the newest read done.
         */
        void onChaptersResult(int generation, int seq, List<MkvChapters.Chapter> found) {
            if (closed || generation != mediaGeneration) return;
            if (found == null) {
                if (chapters != null || seq != chapterFetchSeq) {
                    log("Chapters: stale fetch failure ignored");
                    return;
                }
                chaptersDone = true;
                log("Chapters: fetch failed, will retry");
                return;
            }
            if (chapters != null && !chapters.isEmpty() && found.isEmpty()) {
                log("Chapters: stale empty result ignored");
                return;
            }
            chaptersDone = true;
            chapters = found;
            StringBuilder list = new StringBuilder();
            for (MkvChapters.Chapter c : found) {
                list.append("\n  ").append(fmt3(c.start)).append(" - ").append(fmt3(c.end))
                        .append("  \"").append(c.name).append('"');
            }
            log("File chapters (" + (SystemClock.uptimeMillis() - chaptersStartedAt)
                    + " ms): " + found.size() + list);
            PlaybackDiary.ev(activity, "chapters", "n", found.size(), "ms", SystemClock.uptimeMillis() - chaptersStartedAt);
            combine(SystemClock.uptimeMillis());
        }

        /**
         * Final intro/recap/credits/preview windows: a chapter NAMED opening/intro/recap/credits
         * is exact and wins; otherwise AniSkip/IntroDB is snapped onto chapter boundaries
         * within 15 s; otherwise the online timing is used as is. Online timings wait up to
         * 6 s for the chapters. Credits jump to the end of the credits segment so
         * after-credits scenes still play.
         */
        private void combine(long now) {
            boolean waitChapters = chaptersRequested && !chaptersDone && now - chaptersStartedAt < 6000L;
            final List<String> pendingLogs = new ArrayList<>();
            DebugLogger combineLogger = new DebugLogger() {
                @Override
                public void log(String message) {
                    pendingLogs.add(message);
                }
            };
            double runtime = runtimeSeconds();
            // The IntroDB.app post_credits scene travels inside online as a marker: take it out
            // before anything can treat it as a segment type (it is never skippable), and keep
            // it for clipping below and for the Next pill. Re-checked on every combine, so a
            // marker that fails sanity once the runtime is known stops protecting anything.
            Segment post = null;
            if (online != null) {
                for (Segment o : online) {
                    if (o.isPostCredits() && sanePostCredits(o, runtime)) {
                        post = o;
                        break;
                    }
                }
            }
            if (post != appPostCredits) {
                appPostCredits = post;
                if (post != null) {
                    log("IntroDB.app post_credits " + fmt3(post.startSeconds) + "-"
                            + fmt3(post.endSeconds) + "s: protected, never skippable");
                }
            }
            List<Segment> named = chapterSegments(chapters, false, runtime, combineLogger, online);
            boolean strongIntro = false;
            for (Segment segment : named) {
                if (!segment.isRecap() && !segment.isCredits() && !segment.isPreview()
                        && isSaneForCoverage(segment, runtime)) {
                    strongIntro = true;
                }
            }
            if (!strongIntro && online != null && !waitChapters) {
                // A weak "Intro" chapter only counts if an online source agrees within 15 s
                // (never when online is empty, as fansubs often name the 0:00 cold open "Intro").
                for (Segment weak : chapterSegments(chapters, true, runtime, combineLogger, online)) {
                    boolean confirmed = false;
                    for (Segment o : online) {
                        if ("OP".equals(o.label)
                                && Math.abs(o.startSeconds - weak.startSeconds) <= 15.0
                                && Math.abs(o.endSeconds - weak.endSeconds) <= 15.0) {
                            confirmed = true;
                            break;
                        }
                    }
                    if (confirmed) {
                        named.add(weak);
                    } else {
                        pendingLogs.add("Weak chapter ignored (no online match within 15s): "
                                + fmt3(weak.startSeconds) + "-" + fmt3(weak.endSeconds));
                    }
                }
            }
            if (named.isEmpty() && (online == null || waitChapters)) {
                flushCombineLogs(pendingLogs, "wait|" + waitChapters + "|c"
                        + (chapters == null ? -1 : chapters.size()));
                return;
            }
            boolean namedIntro = false;
            boolean namedRecap = false;
            boolean namedCredits = false;
            boolean namedPreview = false;
            for (Segment segment : named) {
                if (!isSaneForCoverage(segment, runtime)) continue;
                if (segment.isRecap()) namedRecap = true;
                else if (segment.isCredits()) namedCredits = true;
                else if (segment.isPreview()) namedPreview = true;
                else namedIntro = true;
            }
            List<Segment> merged = new ArrayList<>(named);
            if (online != null && !waitChapters) {
                for (Segment onlineSegment : online) {
                    if (onlineSegment.isPostCredits()) continue; // extracted above, never a segment
                    boolean covered;
                    if (onlineSegment.isRecap()) covered = namedRecap;
                    else if (onlineSegment.isCredits()) covered = namedCredits;
                    else if (onlineSegment.isPreview()) covered = namedPreview;
                    else covered = namedIntro;
                    if (covered) continue; // a named chapter already covers this type
                    Segment resolved = resolveToEnd(onlineSegment, runtime, combineLogger);
                    if (resolved == null) continue; // held until the runtime is known, or guard-dropped
                    Segment segment = clipPostCredit(resolved, chapters);
                    if (segment == null) continue;
                    segment = clipAtPostCredits(segment, post, runtime);
                    if (segment == null) continue;
                    if (segment.isCredits()) {
                        // Credits (a resolved to-end one, or the bounded window inner-bounds made
                        // of it, which is no longer toEnd) span any preview inside them (named
                        // chapter or online, e.g. an AniSkip preview merged ahead of it): end
                        // them where that preview starts instead of losing them to overlaps().
                        double cutAt = -1;
                        for (Segment n : named) {
                            if (n.isPreview() && n.startSeconds > segment.startSeconds
                                    && n.startSeconds < segment.endSeconds) {
                                cutAt = n.startSeconds;
                                break;
                            }
                        }
                        if (cutAt < 0) {
                            for (Segment o : online) {
                                if (o.isPreview() && o.startSeconds > segment.startSeconds
                                        && o.startSeconds < segment.endSeconds) {
                                    cutAt = o.startSeconds;
                                    break;
                                }
                            }
                        }
                        if (cutAt > 0 && cutAt - segment.startSeconds >= 10.0) {
                            pendingLogs.add((onlineSegment.toEnd ? "To-end credits" : "Credits")
                                    + " cut at preview " + fmt3(cutAt) + "s");
                            segment = new Segment(segment.startSeconds, cutAt,
                                    segment.label, segment.source);
                        }
                    }
                    merged.add(segment);
                }
            }
            // Source-agnostic positional + duration sanity on the merged list before snap().
            if (sysprop("debug.aniskip.testpreview") && !hasSegmentType(merged, "preview")) {
                merged.add(new Segment(15.0, 30.0, "preview", "synthetic-test"));
                pendingLogs.add("Injected synthetic preview 15.000-30.000s (debug.aniskip.testpreview=1)");
            }
            positionalSanity(merged, runtime, combineLogger);

            List<Segment> out = new ArrayList<>();
            for (Segment segment : merged) {
                // Chapter windows and previews are used as-is: snapping a short
                // end-of-episode preview onto nearby boundaries mangles it.
                Segment candidate = (segment.source.startsWith("chapter ") || segment.isPreview() || OwnTimes.isOwn(segment.source))
                        ? segment : snap(segment, chapters);
                boolean chapterWindow = candidate.source.startsWith("chapter ");
                // Snapping must not move an end back into the protected scene. A chapter
                // window is cut at the marker only when it starts before the scene and no
                // post-credit chapter already cut it (that chapter boundary wins); a chapter
                // window starting inside the scene is the file's own word and wins.
                if (!chapterWindow || (post != null && post.startSeconds > candidate.startSeconds
                        && !candidate.source.contains("clipped at post-credit chapter"))) {
                    candidate = clipAtPostCredits(candidate, post, runtime);
                    if (candidate == null) continue;
                }
                if (candidate.isPreview()) {
                    trimCreditsBeforePreview(out, candidate, combineLogger);
                }
                if (!overlaps(out, candidate.startSeconds, candidate.endSeconds)) {
                    out.add(candidate);
                }
            }
            addCuePreview(out, pendingLogs);
            // No preview from any source, but the file ends with a short final
            // chapter right where the credits end (generic "Chapter 06" style
            // Blu-ray muxes): that tail IS the post-ED preview. Infer it so
            // generic-chapter files skip previews too. Never guess without the
            // chapter boundary: no boundary, no segment.
            if (!hasSegmentType(out, "preview") && chapters != null && !chapters.isEmpty() && runtime > 0) {
                Segment creditsSeg = null;
                for (Segment s : out) {
                    if (s.isCredits()) {
                        creditsSeg = s;
                        break;
                    }
                }
                MkvChapters.Chapter lastChap = chapters.get(chapters.size() - 1);
                if (creditsSeg != null && lastChap != null) {
                    double tailStart = creditsSeg.endSeconds;
                    double tailEnd = lastChap.end > lastChap.start ? Math.max(lastChap.end, runtime) : runtime;
                    double tailLen = tailEnd - tailStart;
                    Segment tail = new Segment(tailStart, tailEnd, "preview", "tail-chapter");
                    if (Math.abs(lastChap.start - tailStart) <= 1.5 && tailLen >= 4.0 && tailLen <= 35.0
                            && clipPostCredit(tail, chapters) == tail
                            && clipAtPostCredits(tail, post, runtime) == tail) {
                        out.add(tail);
                        pendingLogs.add("Inferred tail preview chapter " + fmt3(tailStart)
                                + "-" + fmt3(tailEnd) + "s after credits");
                    }
                }
            } else if (!hasSegmentType(out, "preview") && chaptersDone && runtime > 0) {
                // Chapterless file (or chapters failed): no boundary to anchor on,
                // so only a short tail can be a preview. Anything over 16 s might
                // be a post-credits story scene and must never be auto-touched.
                Segment creditsSeg = null;
                for (Segment s : out) {
                    if (s.isCredits()) {
                        creditsSeg = s;
                        break;
                    }
                }
                if (creditsSeg != null) {
                    double tailLen = runtime - creditsSeg.endSeconds;
                    Segment tail = new Segment(creditsSeg.endSeconds, runtime, "preview", "post-ed-tail");
                    if (tailLen >= 4.0 && tailLen <= 16.0 && clipPostCredit(tail, chapters) == tail
                            && clipAtPostCredits(tail, post, runtime) == tail) {
                        out.add(tail);
                        pendingLogs.add("Inferred post-ED tail preview " + fmt3(creditsSeg.endSeconds)
                                + "-" + fmt3(runtime) + "s (no chapters, short tail)");
                    }
                }
            }
            guardLongCredits(out, pendingLogs);
            StringBuilder signature = new StringBuilder();
            for (Segment segment : out) signature.append(segment.key()).append(segment.source).append(segment.buttonOnly ? "!" : "").append(';');
            String sig = signature.toString();
            flushCombineLogs(pendingLogs, sig + "|c" + (chapters == null ? -1 : chapters.size())
                    + "|o" + (online == null ? -1 : online.size()) + "|r" + Math.round(runtime));
            if (sig.equals(appliedSignature)) return;
            appliedSignature = sig;
            apply(out, onlineSource == null ? "chapters" : onlineSource, onlineStartedAt == 0
                    ? chaptersStartedAt : onlineStartedAt);
            if (!subPreviewRequested && (introDone || chaptersDone)) maybeStartSubPreviewScan();
        }

        /**
         * Re-adds a preview found by subtitle tail / live cue when a re-merge produced none, so a
         * later apply() does not lose it (the scan runs once per media). Re-clipped against the
         * current chapters; dropped for good when a post-credit chapter now covers it.
         */
        void addCuePreview(List<Segment> out, List<String> logs) {
            if (cuePreview == null || hasSegmentType(out, "preview")) return;
            Segment prev = clipPostCredit(cuePreview, chapters);
            if (prev == null) {
                logs.add("Cue preview dropped: inside a post-credit chapter");
                cuePreview = null;
                return;
            }
            prev = clipAtPostCredits(prev, appPostCredits, runtimeSeconds());
            if (prev == null) {
                logs.add("Cue preview dropped: inside the IntroDB.app post_credits scene");
                cuePreview = null;
                return;
            }
            trimCreditsBeforePreview(out, prev, null);
            out.add(prev);
            logs.add("Kept " + prev.source + " preview " + fmt3(prev.startSeconds) + "-"
                    + fmt3(prev.endSeconds) + "s across re-merge");
        }

        private double runtimeSeconds() {
            if (fetchedLength > 0) return fetchedLength;
            if (player != null) {
                try {
                    long durationMs = player.durationMs();
                    if (durationMs > 0) return durationMs / 1000.0;
                } catch (Throwable ignored) {
                }
            }
            double maxEnd = 0;
            if (chapters != null) {
                for (MkvChapters.Chapter c : chapters) {
                    if (c != null && c.end > maxEnd) maxEnd = c.end;
                }
            }
            return maxEnd;
        }

        private void flushCombineLogs(List<String> messages, String key) {
            if (key.equals(lastSanityLogKey)) return;
            lastSanityLogKey = key;
            for (String message : messages) log(message);
        }

        /**
         * A re-merge (a better source landed) can replace a segment by one with slightly
         * different times, i.e. a different key(). A replacement that overlaps an already
         * auto-skipped (or jump-counted) segment of the same label inherits that state, so
         * it is never auto-skipped a second time.
         */
        private void carryOverSkipState(List<Segment> previous) {
            if (autoSkipped.isEmpty() && jumpSkips.isEmpty()) return;
            for (Segment fresh : segments) {
                String freshKey = fresh.key();
                for (Segment old : previous) {
                    if (!old.label.equals(fresh.label) || old.key().equals(freshKey)) continue;
                    if (Math.min(old.endSeconds, fresh.endSeconds)
                            - Math.max(old.startSeconds, fresh.startSeconds) <= 0.0) continue;
                    if (autoSkipped.contains(old.key()) && autoSkipped.add(freshKey)) {
                        log("Re-merged " + fresh.label + " " + fmt3(fresh.startSeconds) + "-"
                                + fmt3(fresh.endSeconds) + " replaces already-skipped "
                                + fmt3(old.startSeconds) + "-" + fmt3(old.endSeconds) + ": not skipped again");
                    }
                    Integer count = jumpSkips.get(old.key());
                    if (count != null && !jumpSkips.containsKey(freshKey)) jumpSkips.put(freshKey, count);
                }
            }
        }

        private void apply(List<Segment> found, String source, long startedAt) {
            if (found != null) {
                for (int i = 0; i < found.size(); i++) {
                    Segment s = found.get(i);
                    if (s.buttonOnly || !("OP".equals(s.label) || s.isRecap())
                            || InnerBounds.familyOf(s.source) == 0) continue;
                    Segment hit = s.zeroConflictIn(aniResult);
                    if (hit == null) hit = s.zeroConflictIn(introResult);
                    if (hit == null) hit = s.buttonOnlyOverlapIn(introResult);
                    if (hit == null) hit = s.buttonOnlyOverlapIn(aniResult);
                    if (hit != null) found.set(i, s.buttonOnlyCopy());
                }
            }
            // Refined windows must not turn a deliberate seek into the intro into an auto-skip.
            inheritSeek = current != null && currentBySeek;
            List<Segment> previous = new ArrayList<>(segments);
            segments.clear();
            if (found != null) segments.addAll(found);
            Collections.sort(segments, new java.util.Comparator<Segment>() {
                @Override
                public int compare(Segment a, Segment b) {
                    return Double.compare(a.startSeconds, b.startSeconds);
                }
            });
            carryOverSkipState(previous);
            current = null;
            StringBuilder list = new StringBuilder();
            for (Segment segment : segments) {
                list.append(' ').append(segment.label).append(' ').append(fmt3(segment.startSeconds))
                        .append('-').append(fmt3(segment.endSeconds)).append(" [").append(segment.source)
                        .append(']');
            }
            log("Segments kept (" + source + ", " + (SystemClock.uptimeMillis() - startedAt)
                    + " ms): " + segments.size() + list);
            PlaybackDiary.ev(activity, "segments", "src", source, "ms", SystemClock.uptimeMillis() - startedAt, "list", diarySegs(segments));
            maybePreSkip();
        }

        // ------------------------------------------------------------ overlay

        /** View actually added to the host: the card when built, else the legacy pill. */
        private View overlayView() {
            return pillCard != null ? pillCard : pill;
        }

        /** Stremio's own accent from the host theme, else Stremio brand purple. */
        private int resolveAccentColor() {
            if (accentResolved) return accentColor;
            accentResolved = true;
            try {
                TypedValue tv = new TypedValue();
                android.content.res.Resources.Theme theme = activity.getTheme();
                if (theme != null) {
                    int attr = Build.VERSION.SDK_INT >= 21
                            ? android.R.attr.colorAccent : android.R.attr.colorPrimary;
                    if (theme.resolveAttribute(attr, tv, true)
                            && tv.data != 0 && tv.data != Color.BLACK && tv.data != Color.WHITE) {
                        accentColor = tv.data | 0xFF000000;
                        return accentColor;
                    }
                }
            } catch (Throwable ignored) {
            }
            accentColor = 0xFF5B67F1;
            return accentColor;
        }

        private void ensurePill() {
            if (pill != null) return;
            View content = activity.findViewById(android.R.id.content);
            if (!(content instanceof FrameLayout)) {
                View decor = activity.getWindow().getDecorView();
                content = decor instanceof FrameLayout ? decor : null;
            }
            if (content == null) return;
            host = (FrameLayout) content;
            try {
                final int accent = resolveAccentColor();
                pillCard = new LinearLayout(activity);
                pillCard.setOrientation(LinearLayout.VERTICAL);
                pillCard.setFocusable(false);
                pillCard.setFocusableInTouchMode(false);
                pillCard.setClickable(false);
                pillCard.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                pillCard.setVisibility(View.GONE);
                pillCard.setAlpha(0f);
                if (Build.VERSION.SDK_INT >= 21) {
                    pillCard.setElevation(dp(12));
                    pillCard.setClipToOutline(true);
                }

                LinearLayout row = new LinearLayout(activity);
                row.setOrientation(LinearLayout.HORIZONTAL);
                row.setGravity(Gravity.CENTER_VERTICAL);
                row.setPadding(dp(18), dp(12), dp(16), dp(11));

                pillIcon = new View(activity) {
                    @Override
                    protected void onDraw(android.graphics.Canvas canvas) {
                        super.onDraw(canvas);
                        try {
                            android.graphics.Paint p = new android.graphics.Paint(
                                    android.graphics.Paint.ANTI_ALIAS_FLAG);
                            p.setColor(armed ? 0xFFFFFFFF : accent);
                            float w = getWidth();
                            float h = getHeight();
                            if (noticeUntil != 0) {
                                p.setStyle(android.graphics.Paint.Style.STROKE);
                                p.setStrokeWidth(dp(2));
                                p.setStrokeCap(android.graphics.Paint.Cap.ROUND);
                                p.setStrokeJoin(android.graphics.Paint.Join.ROUND);
                                android.graphics.Path check = new android.graphics.Path();
                                check.moveTo(w * 0.18f, h * 0.52f);
                                check.lineTo(w * 0.42f, h * 0.76f);
                                check.lineTo(w * 0.84f, h * 0.26f);
                                canvas.drawPath(check, p);
                            } else {
                                p.setStyle(android.graphics.Paint.Style.FILL);
                                android.graphics.Path tri = new android.graphics.Path();
                                tri.moveTo(w * 0.12f, h * 0.18f);
                                tri.lineTo(w * 0.62f, h * 0.50f);
                                tri.lineTo(w * 0.12f, h * 0.82f);
                                tri.close();
                                canvas.drawPath(tri, p);
                                canvas.drawRoundRect(new android.graphics.RectF(
                                        w * 0.70f, h * 0.20f, w * 0.84f, h * 0.80f),
                                        dp(1), dp(1), p);
                            }
                        } catch (Throwable ignored) {
                        }
                    }
                };
                LinearLayout.LayoutParams iconLp = new LinearLayout.LayoutParams(dp(18), dp(18));
                iconLp.setMargins(0, 0, dp(12), 0);
                row.addView(pillIcon, iconLp);

                LinearLayout textCol = new LinearLayout(activity);
                textCol.setOrientation(LinearLayout.VERTICAL);
                pill = new TextView(activity);
                pill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
                pill.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                pill.setSingleLine(true);
                pill.setTextColor(0xFFF2F4F8);
                textCol.addView(pill);

                LinearLayout.LayoutParams textLp = new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                textLp.setMargins(0, 0, dp(14), 0);
                row.addView(textCol, textLp);

                pillBadge = new TextView(activity);
                pillBadge.setTextSize(TypedValue.COMPLEX_UNIT_SP, 11);
                pillBadge.setTypeface(Typeface.create("sans-serif-medium", Typeface.BOLD));
                pillBadge.setGravity(Gravity.CENTER);
                pillBadge.setSingleLine(true);
                pillBadge.setPadding(dp(8), dp(3), dp(8), dp(3));
                row.addView(pillBadge, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));

                pillCard.addView(row);

                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                        Gravity.BOTTOM | Gravity.END);
                params.setMargins(0, 0, dp(48), dp(44));
                host.addView(pillCard, params);
                wireTouch(pillCard);
            } catch (Throwable fallbackError) {
                // Fail-soft degradation to original single TextView pill.
                pillCard = null;
                pill = new TextView(activity);
                pill.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
                pill.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
                pill.setGravity(Gravity.CENTER);
                pill.setSingleLine(true);
                pill.setPadding(dp(22), dp(11), dp(22), dp(11));
                pill.setFocusable(false);
                pill.setFocusableInTouchMode(false);
                pill.setClickable(false);
                pill.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
                pill.setVisibility(View.GONE);
                pill.setAlpha(0f);
                if (Build.VERSION.SDK_INT >= 21) pill.setElevation(dp(8));
                FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                        Gravity.BOTTOM | Gravity.END);
                params.setMargins(0, 0, dp(48), dp(48));
                host.addView(pill, params);
                wireTouch(pill);
            }
        }

        private void triggerPillAction() {
            okDownConsumed = false;
            manualArmed = false;
            if (nextPill) {
                hidePill(false);
                playNextEpisode();
                return;
            }
            Segment segment = pillSegment;
            if (segment == null) return;
            double pos = 0;
            long duration = -1;
            try {
                pos = player.positionMs() / 1000.0;
                duration = player.durationMs();
            } catch (Throwable ignored) {
                // Use defaults.
            }
            hidePill(false);
            skip(segment, false, pos, duration);
        }

        private void styleArmed(boolean isArmed) {
            if (pill == null) return;
            try {
                int accent = resolveAccentColor();
                if (pillCard == null) {
                    if (isArmed) {
                        pill.setBackground(roundedBackground(0xF2FFFFFF, 0x00FFFFFF, dp(6)));
                        pill.setTextColor(0xFF15131A);
                    } else {
                        pill.setBackground(roundedBackground(0xCC17151C, 0x59FFFFFF, dp(6)));
                        pill.setTextColor(0xFFF2F0F5);
                    }
                    return;
                }
                if (noticeUntil != 0) {
                    pillCard.setBackground(roundedBackground(0xEB101216, accent, dp(12)));
                    pill.setTextColor(0xFFF2F4F8);
                    if (pillBadge != null) pillBadge.setVisibility(View.GONE);
                } else if (isArmed) {
                    pillCard.setBackground(roundedBackground(0xF51A1E25, accent, dp(12)));
                    pill.setTextColor(0xFFFFFFFF);
                    if (pillBadge != null) {
                        pillBadge.setVisibility(View.VISIBLE);
                        pillBadge.setText("OK");
                        pillBadge.setTextColor(0xFFFFFFFF);
                        pillBadge.setBackground(roundedBackground(accent, accent, dp(6)));
                    }
                    pillCard.animate().scaleX(1.03f).scaleY(1.03f).setDuration(140L).start();
                } else {
                    pillCard.setBackground(roundedBackground(0xD9101216, 0xFF303743, dp(12)));
                    pill.setTextColor(0xFFD5DAE5);
                    if (pillBadge != null) {
                        pillBadge.setVisibility(View.VISIBLE);
                        pillBadge.setText("▼");
                        pillBadge.setTextColor(0xFF9EA6B8);
                        pillBadge.setBackground(roundedBackground(0xFF252B35, 0xFF3E4756, dp(6)));
                    }
                    pillCard.animate().scaleX(0.98f).scaleY(0.98f).setDuration(140L).start();
                }
                if (touchUi() && pillBadge != null) pillBadge.setVisibility(View.GONE);
                if (pillIcon != null) pillIcon.invalidate();
            } catch (Throwable ignored) {
            }
        }

        private void showButton(Segment segment) {
            ensurePill();
            if (pill == null) return;
            installKeys();
            pillSegment = segment;
            nextPill = false;
            noticeUntil = 0;
            armed = manualArmed || touchUi() || (!controlsVisible() && SystemClock.uptimeMillis() - lastOtherKeyAt > 600L);
            pill.setText(segment.buttonText());
            styleArmed(armed);
            fadeIn();
            log("Button shown: " + segment.buttonText() + (armed ? " (armed, OK = skip)" : " (disarmed, Down = arm)"));
        }

        private void showNextEpisode() {
            ensurePill();
            if (pill == null) return;
            installKeys();
            pillSegment = null;
            nextPill = true;
            noticeUntil = 0;
            armed = manualArmed || touchUi() || (!controlsVisible() && SystemClock.uptimeMillis() - lastOtherKeyAt > 600L);
            pill.setText(pillCard != null ? "Next Episode" : "Next episode (OK)");
            styleArmed(armed);
            fadeIn();
            log("Button shown: Next episode (OK)" + (armed ? " (OK = next)" : " (OK to player)"));
        }

        private void playNextEpisode() {
            try {
                if (movie) {
                    log("Next episode ignored: movie");
                    return;
                }
                if (player instanceof PortSkipPlayer) {
                    log("Next episode: " + PortHooks.playNext(activity));
                    return;
                }
                Object frag = resolveFragment();
                if (frag == null) {
                    log("Next episode failed: no fragment");
                    return;
                }
                reportProgress(frag);
                NextPrep.expectNextAfter(prepVideoId()); // its streams page may start the prepared stream
                try {
                    java.lang.reflect.Method direct = frag.getClass().getDeclaredMethod("navigateToNextVideo");
                    direct.setAccessible(true);
                    direct.invoke(frag);
                    log("Next episode: navigateToNextVideo");
                    return;
                } catch (Throwable ignored) {
                    // Fall through to binge/next lookup.
                }
                Object video = nextVideoOf(frag);
                if (video == null) {
                    log("Next episode failed: no next video");
                    return;
                }
                java.lang.reflect.Method nav = null;
                try {
                    nav = frag.getClass().getMethod("navigateToVideo", video.getClass());
                } catch (Throwable ignored) {
                    for (java.lang.reflect.Method m : frag.getClass().getMethods()) {
                        if ("navigateToVideo".equals(m.getName()) && m.getParameterTypes().length == 1) {
                            nav = m;
                            break;
                        }
                    }
                }
                if (nav == null) {
                    log("Next episode failed: no navigateToVideo");
                    return;
                }
                try {
                    Object vm = viewModelOf(frag);
                    if (vm != null) {
                        ClassLoader cl = vm.getClass().getClassLoader();
                        Class<?> stateClass = Class.forName(
                                "com.stremio.common.viewmodels.state.VideoPlaybackState", false, cl);
                        Class<?> nextClass = Class.forName(
                                "com.stremio.common.viewmodels.state.VideoPlaybackState$NextVideo", false, cl);
                        Object nextEvent = null;
                        try {
                            Field inst = nextClass.getDeclaredField("INSTANCE");
                            inst.setAccessible(true);
                            nextEvent = inst.get(null);
                        } catch (Throwable noSingleton) {
                            java.lang.reflect.Constructor<?> ctor = nextClass.getDeclaredConstructor();
                            ctor.setAccessible(true);
                            nextEvent = ctor.newInstance();
                        }
                        if (nextEvent != null) {
                            Method onStateChange = vm.getClass().getMethod("onStateChange", stateClass);
                            onStateChange.invoke(vm, nextEvent);
                            log("Next episode: dispatched VideoPlaybackState$NextVideo");
                        }
                    }
                } catch (Throwable ignored) {
                    // State event is optional; navigation still plays next.
                }
                nav.invoke(frag, video);
                log("Next episode: navigateToVideo");
            } catch (Throwable error) {
                log("ERROR next episode: " + error);
            }
        }

        /**
         * Tells the core how far the finished episode got before navigating away, so its
         * progress is saved (the player screen is replaced without a normal end event).
         */
        private void reportProgress(Object frag) {
            try {
                if (player == null) return;
                long position = player.positionMs();
                long duration = player.durationMs();
                if (position < 0 || duration <= 0) return;
                Object vm = viewModelOf(frag);
                if (vm == null) return;
                Class<?> stateClass = Class.forName(
                        "com.stremio.common.viewmodels.state.VideoPlaybackState",
                        false, vm.getClass().getClassLoader());
                Class<?> updateClass = Class.forName(
                        "com.stremio.common.viewmodels.state.VideoPlaybackState$UpdateProgress",
                        false, vm.getClass().getClassLoader());
                Object update = updateClass.getConstructor(long.class, long.class)
                        .newInstance(position, duration);
                java.lang.reflect.Method onStateChange = vm.getClass().getMethod("onStateChange", stateClass);
                onStateChange.invoke(vm, update);
                log("Next episode: progress reported " + position + "/" + duration + " ms");
            } catch (Throwable error) {
                log("Next episode: progress not reported: " + error);
            }
        }

        /** The player fragment's view model: a private Kotlin getter, so also try the lazy delegate. */
        private Object viewModelOf(Object frag) {
            try {
                for (Class<?> c = frag.getClass(); c != null; c = c.getSuperclass()) {
                    try {
                        java.lang.reflect.Method getter = c.getDeclaredMethod("getViewModel");
                        getter.setAccessible(true);
                        Object vm = getter.invoke(frag);
                        if (vm != null) return vm;
                    } catch (NoSuchMethodException ignored) {
                        // Try the superclass.
                    }
                    try {
                        java.lang.reflect.Field delegate = c.getDeclaredField("viewModel$delegate");
                        delegate.setAccessible(true);
                        Object lazy = delegate.get(frag);
                        if (lazy != null) {
                            java.lang.reflect.Method getValue = lazy.getClass().getMethod("getValue");
                            getValue.setAccessible(true);
                            Object vm = getValue.invoke(lazy);
                            if (vm != null) return vm;
                        }
                    } catch (NoSuchFieldException ignored) {
                        // Try the superclass.
                    }
                }
            } catch (Throwable ignored) {
                // No view model.
            }
            return null;
        }

        private Object resolveFragment() {
            try {
                if (fragment != null && !(fragment instanceof Session)) return fragment;
                if (anchor == null) return null;
                Class<?> manager = Class.forName("androidx.fragment.app.FragmentManager",
                        false, activity.getClassLoader());
                return manager.getMethod("findFragment", View.class).invoke(null, anchor);
            } catch (Throwable ignored) {
                return null;
            }
        }

        /** 1 = a next video exists, 0 = none (season finale), -1 = unknown (never hides the pill). */
        private int nextVideoState() {
            try {
                if (player instanceof PortSkipPlayer) {
                    return PortHooks.nextVideoId().length() > 0 ? 1 : 0;
                }
                Object frag = resolveFragment();
                if (frag == null) return -1;
                Object vm = viewModelOf(frag);
                Object flow = vm.getClass().getMethod("getState").invoke(vm);
                Object st = flow.getClass().getMethod("getValue").invoke(flow);
                boolean foundGetter = false;
                for (String getter : new String[]{"getBingeVideo", "getNextVideo"}) {
                    try {
                        Object video = st.getClass().getMethod(getter).invoke(st);
                        foundGetter = true;
                        if (video != null) return 1;
                    } catch (NoSuchMethodException ignored) {
                        // This build lacks the getter; try the other one.
                    }
                }
                return foundGetter ? 0 : -1;
            } catch (Throwable ignored) {
                return -1;
            }
        }

        /** True while the playhead is inside a chapter named like a post-credit scene. */
        private boolean inPostCreditChapter(double pos) {
            try {
                List<MkvChapters.Chapter> list = chapters;
                if (list == null) return false;
                for (MkvChapters.Chapter chapter : list) {
                    if (chapter == null || chapter.name == null
                            || !POST_CREDIT_NAME.matcher(chapter.name).find()) continue;
                    double end = chapter.end > chapter.start ? chapter.end : Double.MAX_VALUE;
                    if (pos >= chapter.start && pos < end) return true;
                }
            } catch (Throwable ignored) {
            }
            return false;
        }

        private Object nextVideoOf(Object frag) {
            try {
                Object vm = viewModelOf(frag);
                Object flow = vm.getClass().getMethod("getState").invoke(vm);
                Object st = flow.getClass().getMethod("getValue").invoke(flow);
                try {
                    Object binge = st.getClass().getMethod("getBingeVideo").invoke(st);
                    if (binge != null) return binge;
                } catch (Throwable ignored) {
                    // Try manual next below.
                }
                return st.getClass().getMethod("getNextVideo").invoke(st);
            } catch (Throwable ignored) {
                return null;
            }
        }

        private void refreshArmed(long now) {
            if (!controlsVisible()) {
                manualArmed = false;
            }
            boolean next = (pillSegment != null || nextPill)
                    && (manualArmed || touchUi() || (!controlsVisible() && now - lastOtherKeyAt > 600L));
            if (next != armed) {
                armed = next;
                styleArmed(armed);
                log("Button " + (armed ? "armed (OK = skip)" : "disarmed (OK to player)")
                        + " manualArmed=" + manualArmed);
            }
        }

        private void showNotice(String text) {
            ensurePill();
            if (pill == null) return;
            pillSegment = null;
            nextPill = false;
            armed = false;
            manualArmed = false;
            okDownConsumed = false;
            noticeUntil = SystemClock.uptimeMillis() + 2200L;
            pill.setText(text);
            styleArmed(false);
            fadeIn();
        }

        private void fadeIn() {
            View target = overlayView();
            if (target == null) return;
            updatePillPosition();
            if (!pillShown) {
                pillShown = true;
                try {
                    target.animate().cancel();
                    target.setVisibility(View.VISIBLE);
                    target.setAlpha(0f);
                    target.setTranslationX(dp(20));
                    target.setScaleX(0.94f);
                    target.setScaleY(0.94f);
                    target.animate()
                            .alpha(1f)
                            .translationX(0f)
                            .scaleX(armed ? 1.03f : 1f)
                            .scaleY(armed ? 1.03f : 1f)
                            .setDuration(200L)
                            .start();
                } catch (Throwable ignored) {
                    target.setVisibility(View.VISIBLE);
                    target.setAlpha(1f);
                }
                // Phone: the first show must also honour picture-in-picture (updatePillPosition needs pillShown).
                if (touchUi()) updatePillPosition();
            }
        }

        private void hidePill(boolean animate) {
            armed = false;
            manualArmed = false;
            okDownConsumed = false;
            pillSegment = null;
            nextPill = false;
            noticeUntil = 0;
            final View target = overlayView();
            if (target == null || !pillShown) return;
            pillShown = false;
            try {
                target.animate().cancel();
                if (animate) {
                    target.animate()
                            .alpha(0f)
                            .translationX(dp(16))
                            .scaleX(0.95f)
                            .scaleY(0.95f)
                            .setDuration(160L)
                            .withEndAction(new Runnable() {
                                @Override
                                public void run() {
                                    if (!pillShown) target.setVisibility(View.GONE);
                                }
                            }).start();
                } else {
                    target.setAlpha(0f);
                    target.setTranslationX(0f);
                    target.setVisibility(View.GONE);
                }
            } catch (Throwable ignored) {
                target.setVisibility(View.GONE);
            }
        }

        private void updatePillPosition() {
            View target = overlayView();
            if (target == null || !pillShown) return;
            try {
                if (touchUi()) {
                    // Picture-in-picture: the pill would cover the small window; keep its state, just hide it.
                    boolean pip = PhoneOverlay.inPip(activity);
                    if (pip && target.getVisibility() == View.VISIBLE) target.setVisibility(View.INVISIBLE);
                    else if (!pip && target.getVisibility() == View.INVISIBLE) target.setVisibility(View.VISIBLE);
                }
                float lift = controlsVisible() ? -dp(PhoneOverlay.liftDp(touchUi())) : 0f;
                if (Math.abs(target.getTranslationY() - lift) > 0.5f) {
                    target.animate().translationY(lift).setDuration(180L).start();
                }
            } catch (Throwable ignored) {
            }
        }

        private boolean controlsVisible() {
            if (player instanceof PortSkipPlayer) {
                // Compose host: no OSD signal, so a non-OK key within the last 3 s counts as "controls up".
                return lastOtherKeyAt != 0 && SystemClock.uptimeMillis() - lastOtherKeyAt < 3000L;
            }
            try {
                if (fragment == null && anchor != null) {
                    Class<?> manager = Class.forName("androidx.fragment.app.FragmentManager",
                            false, activity.getClassLoader());
                    fragment = manager.getMethod("findFragment", View.class).invoke(null, anchor);
                    controlsVisibleMethod = fragment.getClass().getMethod("isControlsOverlayVisible");
                }
                if (fragment == null || controlsVisibleMethod == null) return false;
                return Boolean.TRUE.equals(controlsVisibleMethod.invoke(fragment));
            } catch (Throwable error) {
                fragment = this;
                controlsVisibleMethod = null;
                return false;
            }
        }

        private void installKeys() {
            try {
                Window window = activity.getWindow();
                Window.Callback existing = window.getCallback();
                if (existing instanceof KeyCallback) {
                    ((KeyCallback) existing).session = this;
                    keyCallback = (KeyCallback) existing;
                    originalCallback = keyCallback.base;
                    return;
                }
                originalCallback = existing;
                keyCallback = new KeyCallback(existing, this);
                window.setCallback(keyCallback);
            } catch (Throwable error) {
                log("ERROR key: " + error);
            }
        }

        /**
         * True = key consumed. When OSD is hidden, OK skips and all other keys pass through to
         * Stremio (summoning OSD). When OSD is visible, pressing Down once arms the pill so OK
         * skips, and any other key (Up/Left/Right/Back) disarms and passes through to Stremio.
         */
        boolean onKey(KeyEvent event) {
            if (closed || event == null) return false;
            int keyCode = event.getKeyCode();
            int action = event.getAction();
            if (action == KeyEvent.ACTION_DOWN && isSeekKey(keyCode)) {
                lastSeekKeyAt = SystemClock.uptimeMillis();
            }
            if (!pillShown || (pillSegment == null && !nextPill)) {
                okDownConsumed = false;
                manualArmed = false;
                return false;
            }
            if (!isOkKey(keyCode)) {
                okDownConsumed = false;
                // Only intercept DPAD_DOWN when OSD is visible and the pill is not yet armed:
                // this lets the user highlight the pill while OSD is up, without ever blocking
                // DPAD_UP or trapping the user when OSD is hidden.
                if (keyCode == KeyEvent.KEYCODE_DPAD_DOWN && controlsVisible() && !manualArmed) {
                    if (action == KeyEvent.ACTION_DOWN) {
                        manualArmed = true;
                        armed = true;
                        styleArmed(true);
                        log("Button armed via D-pad Down (osd=true)");
                        if (player instanceof PortSkipPlayer) lastOtherKeyAt = SystemClock.uptimeMillis();
                    }
                    return true;
                }
                if (action == KeyEvent.ACTION_DOWN) {
                    if (manualArmed) {
                        manualArmed = false;
                        log("Button disarmed back to OSD key=" + keyCode);
                    }
                    lastOtherKeyAt = SystemClock.uptimeMillis();
                    if (armed) {
                        armed = false;
                        styleArmed(false);
                    }
                }
                return false;
            }
            if (action == KeyEvent.ACTION_DOWN) {
                if (event.getRepeatCount() == 0) {
                    refreshArmed(SystemClock.uptimeMillis());
                    okDownConsumed = armed;
                }
                return okDownConsumed;
            }
            if (action == KeyEvent.ACTION_UP) {
                if (!okDownConsumed) return false;
                log("Button activated via OK key (armed=" + armed + ", manualArmed=" + manualArmed + ")");
                triggerPillAction();
                return true;
            }
            return okDownConsumed;
        }

        // -------------------------------------------------------------- debug

        void log(String message) {
            message = redactUrls(message);
            PlaybackDiary.note(message);
            Log.i(TAG, message.length() > 1500 ? message.substring(0, 1500) : message);
            if (!debugEnabled) return;
            synchronized (debugLog) {
                debugLog.append(message).append('\n');
                if (debugLog.length() > 14000) {
                    debugLog.delete(0, debugLog.length() - 14000);
                }
            }
        }

        private Context ctx() {
            return activity;
        }

        private int dp(int value) {
            return (int) (value * activity.getResources().getDisplayMetrics().density + 0.5f);
        }

        private GradientDrawable roundedBackground(int fillColor, int strokeColor, int radius) {
            GradientDrawable drawable = new GradientDrawable();
            drawable.setColor(fillColor);
            drawable.setCornerRadius(radius);
            drawable.setStroke(dp(1), strokeColor);
            return drawable;
        }

        private void showDebugDialog() {
            try {
                final Dialog dialog = new Dialog(ctx());
                debugDialog = dialog;
                dialog.requestWindowFeature(Window.FEATURE_NO_TITLE);

                LinearLayout root = new LinearLayout(ctx());
                root.setOrientation(LinearLayout.VERTICAL);
                root.setBackgroundColor(0xFF101216);

                LinearLayout header = new LinearLayout(ctx());
                header.setGravity(Gravity.CENTER_VERTICAL);
                header.setPadding(dp(16), dp(12), dp(10), dp(10));

                TextView heading = new TextView(ctx());
                heading.setText("Intro Skip DEBUG");
                heading.setTextColor(Color.WHITE);
                heading.setTextSize(18);
                heading.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
                heading.setMaxLines(1);
                header.addView(heading, new LinearLayout.LayoutParams(
                        0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.0f));

                Button refresh = dialogButton("Refresh");
                Button copy = dialogButton("Copy");
                Button testPreview = dialogButton("Test Preview");
                Button close = dialogButton("Close");
                header.addView(refresh);
                header.addView(copy);
                header.addView(testPreview);
                header.addView(close);
                root.addView(header);

                View divider = new View(ctx());
                divider.setBackgroundColor(0xFF343943);
                root.addView(divider, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, dp(1)));

                final ScrollView scroll = new ScrollView(ctx());
                scroll.setFillViewport(true);
                final LinearLayout content = new LinearLayout(ctx());
                content.setOrientation(LinearLayout.VERTICAL);
                content.setPadding(dp(12), dp(12), dp(12), dp(18));
                scroll.addView(content, new ScrollView.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT));
                root.addView(scroll, new LinearLayout.LayoutParams(
                        ViewGroup.LayoutParams.MATCH_PARENT, 0, 1.0f));

                refresh.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        renderDebugContent(content);
                    }
                });
                copy.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        ClipboardManager clipboard = (ClipboardManager) ctx()
                                .getSystemService(android.content.Context.CLIPBOARD_SERVICE);
                        if (clipboard != null) {
                            clipboard.setPrimaryClip(ClipData.newPlainText(
                                    "Intro Skip DEBUG", debugText()));
                            Toast.makeText(ctx(), "Debug copied", Toast.LENGTH_SHORT).show();
                        }
                    }
                });
                close.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        dialog.dismiss();
                    }
                });
                testPreview.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        try {
                            double pos = player != null ? player.positionMs() / 1000.0 : 10.0;
                            Segment synth = new Segment(pos + 3.0, pos + 18.0, "preview", "debug-injected");
                            segments.add(synth);
                            autoSkipped.remove(synth.key());
                            jumpSkips.remove(synth.key());
                            log("Segments kept (debug-injected, 0 ms): 1 preview "
                                    + fmt3(synth.startSeconds) + "-" + fmt3(synth.endSeconds)
                                    + " [debug-injected]");
                            dialog.dismiss();
                        } catch (Throwable error) {
                            log("ERROR test preview: " + error);
                        }
                    }
                });

                renderDebugContent(content);
                dialog.setContentView(root);
                dialog.show();

                Window window = dialog.getWindow();
                if (window != null) {
                    window.setBackgroundDrawable(new ColorDrawable(0xFF101216));
                    window.addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
                    window.setDimAmount(0.35f);
                    if (Build.VERSION.SDK_INT >= 21) {
                        window.setStatusBarColor(0xFF0A0B0D);
                        window.setNavigationBarColor(0xFF0A0B0D);
                    }
                    window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.MATCH_PARENT);
                }
            } catch (Exception error) {
                log("ERROR showing debug: " + error);
            }
        }

        private String debugText() {
            synchronized (debugLog) {
                return debugLog.toString();
            }
        }

        private void renderDebugContent(LinearLayout content) {
            content.removeAllViews();
            String raw = debugText();
            if (raw.trim().length() == 0) {
                addDebugSection(content, "STATE", "No data received yet.");
                return;
            }

            String sectionTitle = "LOG";
            StringBuilder sectionBody = new StringBuilder();
            String[] lines = raw.split("\\n", -1);
            for (String line : lines) {
                String nextTitle = debugSectionTitle(line);
                if (nextTitle != null && sectionBody.length() > 0) {
                    addDebugSection(content, sectionTitle, sectionBody.toString().trim());
                    sectionBody.setLength(0);
                }
                if (nextTitle != null) sectionTitle = nextTitle;
                if (line.trim().length() > 0) sectionBody.append(line).append('\n');
            }
            if (sectionBody.length() > 0) {
                addDebugSection(content, sectionTitle, sectionBody.toString().trim());
            }
        }

        private void addDebugSection(LinearLayout content, String title, String body) {
            LinearLayout card = new LinearLayout(ctx());
            card.setOrientation(LinearLayout.VERTICAL);
            card.setPadding(dp(14), dp(10), dp(14), dp(12));
            card.setBackground(roundedBackground(0xFF1A1E25, 0xFF303743, dp(10)));

            TextView label = new TextView(ctx());
            label.setText(title);
            label.setTextColor(0xFF9FB7FF);
            label.setTextSize(11);
            label.setTypeface(Typeface.DEFAULT, Typeface.BOLD);
            card.addView(label);

            TextView text = new TextView(ctx());
            text.setText(body);
            text.setTextColor(0xFFE8EAF0);
            text.setTextSize(12);
            text.setTypeface(Typeface.MONOSPACE);
            text.setTextIsSelectable(true);
            text.setPadding(0, dp(6), 0, 0);
            card.addView(text, new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT));

            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT);
            params.setMargins(0, 0, 0, dp(10));
            content.addView(card, params);
        }

        private String debugSectionTitle(String line) {
            String value = line == null ? "" : line.trim();
            if (value.equals("MEDIA")) return "MEDIA FOUND";
            if (value.startsWith("REQUEST ")) return "NETWORK REQUEST";
            if (value.startsWith("RESPONSE ")) return "NETWORK RESPONSE";
            if (value.startsWith("AniList")) return "ANILIST";
                        if (value.startsWith("IntroDB")) return "INTRODB";
            if (value.startsWith("AniSkip")) return "ANISKIP";
            if (value.startsWith("Segment") || value.startsWith("Segments")) return "SEGMENTS";
            if (value.startsWith("ERROR")) return "ERROR";
            if (value.startsWith("HOOK")) return "HOOK STATE";
            return null;
        }

        private Button dialogButton(String label) {
            Button button = new Button(ctx());
            button.setText(label);
            button.setTextColor(0xFFE8EAF0);
            button.setTextSize(11);
            button.setAllCaps(false);
            button.setMinHeight(0);
            button.setMinimumHeight(0);
            button.setMinWidth(0);
            button.setMinimumWidth(0);
            button.setPadding(dp(8), dp(2), dp(8), dp(2));
            button.setBackground(roundedBackground(0xFF252B35, 0xFF4B5667, dp(8)));
            LinearLayout.LayoutParams params = new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT, dp(38));
            params.setMargins(dp(3), 0, 0, 0);
            button.setLayoutParams(params);
            return button;
        }

    }

    /** Window.Callback proxy: sees every key first, consumes only OK on an armed Skip button. */
    private static final class KeyCallback implements Window.Callback {
        final Window.Callback base;
        volatile Session session;

        KeyCallback(Window.Callback base, Session session) {
            this.base = base;
            this.session = session;
        }

        @Override
        public boolean dispatchKeyEvent(KeyEvent event) {
            Session current = session;
            if (current != null) {
                try {
                    if (current.onKey(event)) return true;
                } catch (Throwable error) {
                    Log.w(TAG, "key", error);
                }
            }
            return base != null && base.dispatchKeyEvent(event);
        }

        @Override
        public boolean dispatchKeyShortcutEvent(KeyEvent event) {
            return base != null && base.dispatchKeyShortcutEvent(event);
        }

        @Override
        public boolean dispatchTouchEvent(MotionEvent event) {
            Session current = session;
            if (current != null && event != null && event.getActionMasked() == MotionEvent.ACTION_DOWN) {
                try {
                    current.onTouchDown();
                } catch (Throwable error) {
                    Log.w(TAG, "touch", error);
                }
            }
            return base != null && base.dispatchTouchEvent(event);
        }

        @Override
        public boolean dispatchTrackballEvent(MotionEvent event) {
            return base != null && base.dispatchTrackballEvent(event);
        }

        @Override
        public boolean dispatchGenericMotionEvent(MotionEvent event) {
            return base != null && base.dispatchGenericMotionEvent(event);
        }

        @Override
        public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
            return base != null && base.dispatchPopulateAccessibilityEvent(event);
        }

        @Override
        public View onCreatePanelView(int featureId) {
            return base == null ? null : base.onCreatePanelView(featureId);
        }

        @Override
        public boolean onCreatePanelMenu(int featureId, Menu menu) {
            return base != null && base.onCreatePanelMenu(featureId, menu);
        }

        @Override
        public boolean onPreparePanel(int featureId, View view, Menu menu) {
            return base != null && base.onPreparePanel(featureId, view, menu);
        }

        @Override
        public boolean onMenuOpened(int featureId, Menu menu) {
            return base != null && base.onMenuOpened(featureId, menu);
        }

        @Override
        public boolean onMenuItemSelected(int featureId, MenuItem item) {
            return base != null && base.onMenuItemSelected(featureId, item);
        }

        @Override
        public void onWindowAttributesChanged(WindowManager.LayoutParams attrs) {
            if (base != null) base.onWindowAttributesChanged(attrs);
        }

        @Override
        public void onContentChanged() {
            if (base != null) base.onContentChanged();
        }

        @Override
        public void onWindowFocusChanged(boolean hasFocus) {
            if (base != null) base.onWindowFocusChanged(hasFocus);
        }

        @Override
        public void onAttachedToWindow() {
            if (base != null) base.onAttachedToWindow();
        }

        @Override
        public void onDetachedFromWindow() {
            if (base != null) base.onDetachedFromWindow();
        }

        @Override
        public void onPanelClosed(int featureId, Menu menu) {
            if (base != null) base.onPanelClosed(featureId, menu);
        }

        @Override
        public boolean onSearchRequested() {
            return base != null && base.onSearchRequested();
        }

        @Override
        public boolean onSearchRequested(SearchEvent searchEvent) {
            return base != null && base.onSearchRequested(searchEvent);
        }

        @Override
        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
            return base == null ? null : base.onWindowStartingActionMode(callback);
        }

        @Override
        public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int type) {
            return base == null ? null : base.onWindowStartingActionMode(callback, type);
        }

        @Override
        public void onActionModeStarted(ActionMode mode) {
            if (base != null) base.onActionModeStarted(mode);
        }

        @Override
        public void onActionModeFinished(ActionMode mode) {
            if (base != null) base.onActionModeFinished(mode);
        }

        @Override
        public void onProvideKeyboardShortcuts(List<KeyboardShortcutGroup> data, Menu menu, int deviceId) {
            if (base != null) base.onProvideKeyboardShortcuts(data, menu, deviceId);
        }

        @Override
        public void onPointerCaptureChanged(boolean hasCapture) {
            if (base != null) base.onPointerCaptureChanged(hasCapture);
        }
    }

    private static String fmt(double seconds) {
        return String.format(Locale.US, "%.1f", seconds);
    }

    private static String fmt3(double seconds) {
        return String.format(Locale.US, "%.3f", seconds);
    }

    private static boolean isSeekKey(int keyCode) {
        return keyCode == KeyEvent.KEYCODE_DPAD_LEFT || keyCode == KeyEvent.KEYCODE_DPAD_RIGHT
                || keyCode == KeyEvent.KEYCODE_MEDIA_REWIND || keyCode == KeyEvent.KEYCODE_MEDIA_FAST_FORWARD
                || keyCode == KeyEvent.KEYCODE_MEDIA_SKIP_BACKWARD || keyCode == KeyEvent.KEYCODE_MEDIA_SKIP_FORWARD
                || keyCode == KeyEvent.KEYCODE_MEDIA_STEP_BACKWARD || keyCode == KeyEvent.KEYCODE_MEDIA_STEP_FORWARD;
    }

    /** A/B switch for measurements only: `setprop debug.aniskip.legacyseek 1` keeps NEXT_SYNC. */
    private static boolean legacySeek() {
        return sysprop("debug.aniskip.legacyseek");
    }

    /** Test-only switches set with `adb shell setprop <name> 1`; off by default. */
    private static final java.util.Map<String, Boolean> SYSPROPS =
            new java.util.concurrent.ConcurrentHashMap<String, Boolean>();

    /** Test-only switches set with `adb shell setprop <name> 1`; cached per process. */
    private static boolean sysprop(String name) {
        Boolean cached = SYSPROPS.get(name);
        if (cached != null) return cached.booleanValue();
        boolean result = false;
        try {
            Object value = Class.forName("android.os.SystemProperties")
                    .getMethod("get", String.class).invoke(null, name);
            result = "1".equals(value);
        } catch (Throwable ignored) {
        }
        SYSPROPS.put(name, Boolean.valueOf(result));
        return result;
    }

    private static final Pattern CHAPTER_INTRO = Pattern.compile("(?iu)(?:\\[SponsorBlock\\]:\\s*intro\\b|(?:^|[^\\p{L}])(?:op\\d*|opening|"
            + "abertura|apertura|ouverture|vorspann|g[ée]n[ée]rique(?: de)? d[ée]but|main titles?|"
            + "title sequence|theme song|вступні титри|опенинг|заставка)(?![\\s:_-]+end\\b)(?:$|[^\\p{L}])|オープニング)");
    /** "Intro" is the cold open in many fansubs ("Intro" 0-114 s, then "OP"): weak evidence only. */
    private static final Pattern CHAPTER_WEAK_INTRO = Pattern.compile(
            "(?iu)(?:^|[^\\p{L}])(?:intro|introduction)(?![\\s:_-]+end\\b)(?:$|[^\\p{L}])");
    private static final Pattern CHAPTER_RECAP = Pattern.compile("(?iu)(?:^|[^\\p{L}])(?:recap|previously(?:\\s+on)?|"
            + "story so far|r[ée]sum[ée]|resumen|recapitula[çc][ãa]o|r[üu]ckblick|zusammenfassung|"
            + "ранее в сериале|в предыдущих сериях|рекап)(?![\\s:_-]+end\\b)(?:$|[^\\p{L}])|あらすじ");
    private static final Pattern CHAPTER_CREDITS = Pattern.compile("(?iu)(?:^|[^\\p{L}])(?:ed\\d*|ending|"
            + "outro|credits|end credits|ending credits|closing credits|end theme|ending theme|"
            + "encerramento|generique de fin|abspann|кінцеві титри|заключні титри|эндинг)(?![\\s:_-]+end\\b)(?:$|[^\\p{L}])|エンディング");
    private static final Pattern CHAPTER_PREVIEW = Pattern.compile("(?iu)(?:^|[^\\p{L}])(?:preview|pv|teaser|"
            + "next episode|trailer|apercu|vorschau|у наступному епізоді|в следующей серии|превью)(?![\\s:_-]+end\\b)(?:$|[^\\p{L}])|予告");
    private static final Pattern CHAPTER_NOT = Pattern.compile("(?iu)(?:^|[^\\p{L}])(?:eyecatch)(?:$|[^\\p{L}])");
    /** The whole part before a song-title separator is a bare opening/ending word ("Opening", "ED2", "Ending Theme 2"). */
    private static final Pattern SONG_LABEL = Pattern.compile("(?iu)^(?:op|ed|opening|ending|outro|"
            + "(?:opening|ending) theme|オープニング|エンディング|опенинг|эндинг)(?:[\\s_.-]*(?:\\d{1,2}|[ivx]{1,3}))?$");

    private static final Pattern SONG_SEPARATOR = Pattern.compile("^(.*?)(?::|\\s[-–—]\\s)");

    /**
     * Chapter name without a trailing song title: "Opening - Long Song Title Here" and "ED2: Song" give
     * "Opening" and "ED2". Only a bare opening/ending word before the separator counts; any other
     * name (a scene title such as "Opening the Gates - Part 1") is returned whole.
     */
    private static String chapterLabel(String name) {
        if (name == null) return "";
        java.util.regex.Matcher m = SONG_SEPARATOR.matcher(name);
        if (m.find() && SONG_LABEL.matcher(m.group(1).trim()).matches()) return m.group(1).trim();
        return name;
    }
    /**
     * Post-credit scene chapter names ("Post-Credits Scene", "Mid-Credits Scene", "Stinger", "After Credits",
     * "Epilogue", "Bonus Scene"...). Such a chapter is never a skippable segment and ends any credits/preview
     * before it (owner rule: post-credit scenes must never be skippable).
     */
    private static final Pattern POST_CREDIT_NAME = Pattern.compile(
            "(?i)(?:^|[^a-z])(?:(?:post|mid|after)[\\s_-]*credits?(?:[\\s_-]*(?:scene|sequence|stinger|tag|clip))?"
                    + "|stingers?|epilogue|bonus[\\s_-]*(?:scene|clip|content|footage))(?:[^a-z]|$)");

    /** Strong prefix triggers at the start of a cue/line (after optional speaker/quote). */
    private static final Pattern SUB_PREVIEW_PREFIX = Pattern.compile(
            "(?iu)^(?:[\\s\"'\\u201C\\u201D\\u300C\\u300E\\(\\[]*(?:[A-Z0-9 ]{2,20}:\\s*)?)?(?:"
            + "next\\s+time\\s+on\\b|on\\s+the\\s+next\\s+episode\\b|in\\s+the\\s+next\\s+episode\\b"
            + "|next\\s+episode\\s*[:\\-\\u2013]|preview\\s*[:\\-\\u2013]"
            + "|(?:dans\\s+le\\s+|au\\s+)?prochain\\s+[e\\u00E9]pisode\\b|la\\s+suite\\s+dans\\b"
            + "|in\\s+der\\s+n[a\\u00E4]chsten\\s+folge\\b|n[a\\u00E4]chste\\s+folge\\b|vorschau\\s*[:\\-\\u2013]"
            + "|(?:en\\s+el\\s+)?pr[o\\u00F3]ximo\\s+episodio\\b|siguiente\\s+episodio\\b|adelanto\\s*[:\\-\\u2013]"
            + "|(?:no\\s+|cenas\\s+do\\s+)?pr[o\\u00F3]ximo\\s+epis[o\\u00F3]dio\\b|pr[e\\u00E9]via\\s*[:\\-\\u2013]"
            + "|(?:nel\\s+)?prossimo\\s+episodio\\b|(?:nella\\s+)?prossima\\s+puntata\\b|anteprima\\s*[:\\-\\u2013]"
            + "|в\\s+следующей\\s+серии\\b|следующая\\s+серия\\b|у\\s+наступному\\s+епізоді\\b|наступна\\s+серія\\b"
            + "|w\\s+nast[e\\u0119]pnym\\s+odcinku\\b|nast[e\\u0119]pny\\s+odcinek\\b"
            + "|次回予告|次回[\\s\\u3000:：、・「『]|予告[\\s\\u3000:：「『]"
            + "|下[一]?[集回][预預]告|다음\\s*화\\s*예고|다음\\s*이야기"
            + ")");

    /** Standalone short header/title-card triggers (must be <= 4 words on their line). */
    private static final Pattern SUB_PREVIEW_HEADER = Pattern.compile(
            "(?iu)^(?:next\\s+episode|preview|prochain\\s+[e\\u00E9]pisode|apercu|aper\\u00E7u"
            + "|vorschau|pr[o\\u00F3]ximo\\s+episodio|adelanto|pr[o\\u00F3]ximo\\s+epis[o\\u00F3]dio"
            + "|prossimo\\s+episodio|anteprima|превью|анонс|zapowied[z\\u017A]|次回予告|次回|予告|下集预告|下集預告|예고)$");

    /** Top-screen ASS positioning or episode-number title card immediately preceding the voiceover. */
    private static final Pattern SUB_TITLE_CARD = Pattern.compile(
            "(?iu)(?:\\{\\\\an[789]\\}|\\{\\\\pos\\(|^(?:episode\\s+\\d+|第[0-9０-９一二三四五六七八九十百]+話)\\b)");

    private static final Pattern SRT_VTT_TIME = Pattern.compile(
            "(?:(\\d{1,2}):)?(\\d{2}):(\\d{2})[,.](\\d{3})\\s*-->\\s*(?:(\\d{1,2}):)?(\\d{2}):(\\d{2})[,.](\\d{3})");

    private static final class TimedCue {
        final double startSec;
        final double endSec;
        final String rawText;

        TimedCue(double startSec, double endSec, String rawText) {
            this.startSec = startSec;
            this.endSec = endSec;
            this.rawText = rawText;
        }
    }

    /** True when a single cue text matches preview boilerplate and passes false-positive guards. */
    static boolean isPreviewBoilerplateCue(String rawCue) {
        if (rawCue == null || rawCue.isEmpty()) return false;
        if (rawCue.indexOf('\u266A') >= 0 || rawCue.indexOf('\u266B') >= 0) return false;
        String noTags = rawCue.replaceAll("\\{\\\\[^}]*\\}", "")
                .replaceAll("</?[a-zA-Z][^>]*>", "")
                .replace('\r', '\n').trim();
        if (noTags.isEmpty() || noTags.startsWith("#")) return false;
        String[] cueLines = noTags.split("\n");
        for (int i = 0; i < cueLines.length; i++) {
            String line = cueLines[i].trim();
            if (line.isEmpty()) continue;
            line = line.replaceFirst("^(?:[-\\u2013]\\s*)?(?:\\[[A-Z0-9 ]{2,20}\\]|[A-Z0-9 ]{2,20}:)\\s*", "").trim();
            if (line.isEmpty()) continue;
            if (SUB_PREVIEW_PREFIX.matcher(line).find()) {
                if (line.endsWith("?") && !line.toLowerCase(Locale.ROOT).startsWith("next time on")) {
                    continue;
                }
                return true;
            }
            String cleanHeader = line.replaceAll("^[\\s\"'\\u201C\\u201D\\u300C\\u300E\\(\\[:\\-]+|[\\s\"'\\u201C\\u201D\\u300D\\u300F\\)\\]:\\-.!]+$", "");
            if (SUB_PREVIEW_HEADER.matcher(cleanHeader).matches()) {
                return true;
            }
        }
        return false;
    }

    /**
     * Parses SRT/VTT text into timed cues and finds the preview start timestamp.
     * Anchored strictly to >= creditsEndSec - 3.0s (when credits exist) and within the last 90s of runtime.
     */
    static double detectPreviewStartFromSubText(String body, double creditsEndSec, double runtimeSec) {
        if (body == null || body.isEmpty() || runtimeSec < 300.0) return -1.0;
        double minStart = creditsEndSec > 0
                ? Math.max(creditsEndSec - 3.0, runtimeSec - 90.0)
                : runtimeSec - 60.0;
        double maxStart = runtimeSec - 3.0;
        if (minStart >= maxStart) return -1.0;

        List<TimedCue> tailCues = new ArrayList<>();
        String norm = body.replace("\r\n", "\n").replace('\r', '\n');
        String[] blocks = norm.split("\n[ \\t\\u00A0]*\n");
        for (int b = 0; b < blocks.length; b++) {
            String block = blocks[b].trim();
            if (block.isEmpty()) continue;
            String[] blockLines = block.split("\n");
            int timeIdx = -1;
            Matcher tm = null;
            for (int i = 0; i < blockLines.length && i < 3; i++) {
                Matcher m = SRT_VTT_TIME.matcher(blockLines[i]);
                if (m.find()) {
                    timeIdx = i;
                    tm = m;
                    break;
                }
            }
            if (tm == null) continue;
            double start = parseHmsMs(tm.group(1), tm.group(2), tm.group(3), tm.group(4));
            double end = parseHmsMs(tm.group(5), tm.group(6), tm.group(7), tm.group(8));
            if (start < minStart - 5.0 || start > maxStart) continue;
            StringBuilder text = new StringBuilder();
            for (int i = timeIdx + 1; i < blockLines.length; i++) {
                String l = blockLines[i].trim();
                if (l.isEmpty()) continue;
                if (text.length() > 0) text.append('\n');
                text.append(l);
            }
            if (text.length() > 0) {
                tailCues.add(new TimedCue(start, end, text.toString()));
            }
        }

        for (int i = 0; i < tailCues.size(); i++) {
            TimedCue cue = tailCues.get(i);
            if (cue.startSec < minStart) continue;
            if (!isPreviewBoilerplateCue(cue.rawText)) continue;
            if (creditsEndSec > 0 && cue.startSec >= creditsEndSec - 1.5
                    && cue.startSec - creditsEndSec <= 5.0) {
                return creditsEndSec;
            }
            if (i > 0) {
                TimedCue prevCue = tailCues.get(i - 1);
                if (prevCue.startSec >= minStart && cue.startSec - prevCue.startSec <= 3.5
                        && SUB_TITLE_CARD.matcher(prevCue.rawText).find()) {
                    return Math.max(minStart, prevCue.startSec - 0.2);
                }
            }
            double floor = i > 0 ? Math.max(minStart, tailCues.get(i - 1).endSec) : minStart;
            return Math.max(floor, cue.startSec - 0.4);
        }
        return -1.0;
    }

    private static double parseHmsMs(String h, String m, String s, String ms) {
        return parseNumOrZero(h) * 3600.0 + parseNumOrZero(m) * 60.0
                + parseNumOrZero(s) + parseNumOrZero(ms) / 1000.0;
    }

    private static int parseNumOrZero(String v) {
        try {
            if (v == null || v.isEmpty()) return 0;
            return Integer.parseInt(v.trim());
        } catch (Throwable ignored) {
            return 0;
        }
    }

    /**
     * Fetches the tail of an external .srt/.vtt URL: requests Range: bytes=-49152 first;
     * if the server returns 200 OK, keeps only a 48 KB rolling tail buffer
     * (capped at 512 KB total read) so memory and bandwidth stay minimal.
     */
    static String fetchSubtitleTail(String url) {
        HttpURLConnection conn = null;
        try {
            conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setInstanceFollowRedirects(true);
            conn.setRequestProperty("User-Agent", "Stremio");
            conn.setRequestProperty("Range", "bytes=-49152");
            int code = conn.getResponseCode();
            if (code < 200 || code >= 300) return null;
            InputStream in = conn.getInputStream();
            if (in == null) return null;
            final int keepBytes = 49152;
            final int maxReadBytes = 524288;
            byte[] ring = new byte[keepBytes];
            int ringLen = 0;
            int totalRead = 0;
            byte[] buf = new byte[8192];
            int n;
            try {
                while ((n = in.read(buf)) != -1) {
                    totalRead += n;
                    if (n >= keepBytes) {
                        System.arraycopy(buf, n - keepBytes, ring, 0, keepBytes);
                        ringLen = keepBytes;
                    } else if (ringLen + n <= keepBytes) {
                        System.arraycopy(buf, 0, ring, ringLen, n);
                        ringLen += n;
                    } else {
                        int shift = (ringLen + n) - keepBytes;
                        System.arraycopy(ring, shift, ring, 0, ringLen - shift);
                        System.arraycopy(buf, 0, ring, ringLen - shift, n);
                        ringLen = keepBytes;
                    }
                    if (totalRead >= maxReadBytes) break;
                }
            } finally {
                try { in.close(); } catch (Throwable ignored) {}
            }
            if (ringLen <= 0) return null;
            return new String(ring, 0, ringLen, StandardCharsets.UTF_8);
        } catch (Throwable ignored) {
            return null;
        } finally {
            if (conn != null) {
                try { conn.disconnect(); } catch (Throwable ignored) {}
            }
        }
    }

    /** Chapters whose NAME says opening/intro/recap/credits/preview: their exact start/end. */
    private static List<Segment> chapterSegments(List<MkvChapters.Chapter> chapters, boolean weak,
                                                 double fallbackRuntime, DebugLogger logger,
                                                 List<Segment> online) {
        List<Segment> out = new ArrayList<>();
        if (chapters == null || chapters.isEmpty()) return out;
        double runtime = fallbackRuntime > 0 ? fallbackRuntime : 0;
        for (MkvChapters.Chapter c : chapters) {
            if (c != null && c.end > runtime) runtime = c.end;
        }
        int n = chapters.size();
        Segment[] matched = new Segment[n];
        for (int i = 0; i < n; i++) {
            MkvChapters.Chapter chapter = chapters.get(i);
            if (chapter == null || chapter.name == null) continue;
            if (POST_CREDIT_NAME.matcher(chapter.name).find()) continue;
            // The final chapter often omits its end time: fall back to runtime so a
            // tail preview chapter (the usual preview position) survives.
            double end = chapter.end > chapter.start ? chapter.end
                    : (i == n - 1 && runtime > chapter.start ? runtime : chapter.end);
            double length = end - chapter.start;
            // A label, not a scene description ("Mike Takes His Leave of the Crew, Opening Credits").
            if (end <= 0 || CHAPTER_NOT.matcher(chapter.name).find()
                    || normTitle(chapterLabel(chapter.name)).split(" ").length > 4) continue;
            boolean intro = weak ? CHAPTER_WEAK_INTRO.matcher(chapter.name).find()
                    && !CHAPTER_INTRO.matcher(chapter.name).find() : CHAPTER_INTRO.matcher(chapter.name).find();
            // "Opening Credits" or an early "Credits" chapter is the start of the episode, not its end:
            // end credits must start in the back half (a cold-open credit roll after a long
            // prologue is not the outro).
            String lower = chapter.name.toLowerCase(Locale.ROOT);
            boolean allowCredits = !(lower.contains("opening") || lower.contains("main title"))
                    && (runtime <= 0 ? chapter.start >= 600.0 : chapter.start >= runtime * 0.50);
            if (intro && length >= 15 && length <= 240) {
                matched[i] = new Segment(chapter.start, end, "OP", "chapter \"" + chapter.name + "\"");
            } else if (!weak && CHAPTER_RECAP.matcher(chapter.name).find() && length >= 10 && length <= 360) {
                matched[i] = new Segment(chapter.start, end, "recap", "chapter \"" + chapter.name + "\"");
            } else if (!weak && allowCredits && creditsNameMatches(chapters, i, runtime, end, online)
                    && length >= 15 && length <= 480) {
                matched[i] = new Segment(chapter.start, end, "credits", "chapter \"" + chapter.name + "\"");
            } else if (!weak && allowCredits && length > 480 && runtime > 0 && chapter.start >= runtime * 0.80
                    && end >= runtime - 2.0 && creditsNameMatches(chapters, i, runtime, end, online)) {
                // A long end-credit roll that runs to the end of the file: the last 480 s of it.
                matched[i] = new Segment(end - 480.0, end, "credits",
                        "chapter \"" + chapter.name + "\" capped to last 480s");
                if (logger != null) {
                    logger.log("Long credits chapter \"" + chapter.name + "\" (" + fmt(length)
                            + "s) capped to its last 480s");
                }
            } else if (!weak && CHAPTER_PREVIEW.matcher(chapter.name).find() && length >= 5 && length <= 300) {
                matched[i] = new Segment(chapter.start, end, "preview", "chapter \"" + chapter.name + "\"");
            }
            if (matched[i] == null && logger != null) {
                String kind = intro ? "OP"
                        : (!weak && CHAPTER_RECAP.matcher(chapter.name).find()) ? "recap"
                        : (!weak && allowCredits && creditsNameMatches(chapters, i, runtime, end, online)) ? "credits"
                        : (!weak && CHAPTER_PREVIEW.matcher(chapter.name).find()) ? "preview" : null;
                if (kind != null) {
                    logger.log("Chapter dropped, " + kind + " length " + fmt(length)
                            + "s outside the caps: \"" + chapter.name + "\" " + fmt3(chapter.start)
                            + "-" + fmt3(end));
                }
            }
        }
        boolean[] ambiguous = new boolean[n];
        for (int i = 0; i + 1 < n; i++) {
            Segment a = matched[i];
            Segment b = matched[i + 1];
            if (a != null && b != null && a.label.equals(b.label)
                    && ("OP".equals(a.label) || "credits".equals(a.label))) {
                // A split label ("Ending" + "Ending 2", "OP" + "Opening"): contiguous within 2 s and still
                // inside the length cap together = one segment, not two ambiguous ones.
                double total = b.endSeconds - a.startSeconds;
                if (Math.abs(b.startSeconds - a.endSeconds) <= 2.0 && b.endSeconds > a.startSeconds
                        && total <= ("OP".equals(a.label) ? 240.0 : 480.0)) {
                    matched[i + 1] = new Segment(a.startSeconds, b.endSeconds, a.label,
                            "chapter \"" + chapters.get(i).name + "\" + \"" + chapters.get(i + 1).name + "\" merged");
                    matched[i] = null;
                    ambiguous[i + 1] = ambiguous[i]; // a pair that already conflicted with its left neighbour stays dropped
                    if (logger != null) {
                        logger.log("Adjacent chapters merged: \"" + chapters.get(i).name
                                + "\" + \"" + chapters.get(i + 1).name + "\" -> " + a.label + " "
                                + fmt3(a.startSeconds) + "-" + fmt3(b.endSeconds));
                    }
                    continue;
                }
                ambiguous[i] = true;
                ambiguous[i + 1] = true;
                if (logger != null) {
                    logger.log("Ambiguous chapters dropped: \"" + chapters.get(i).name
                            + "\" + \"" + chapters.get(i + 1).name + "\"");
                }
            }
        }
        for (int i = 0; i < n; i++) {
            if (matched[i] != null && !ambiguous[i]) {
                Segment clipped = clipPostCredit(matched[i], chapters);
                if (clipped != null) out.add(clipped);
            }
        }
        return out;
    }

    /**
     * CHAPTER_CREDITS match for chapter i. A narrative chapter literally named "Ending" is story unless
     * it starts in the last 20 %, runs at most 240 s, and (a credits segment from an online source starts
     * within 15 s of it, or the next chapter is a preview/next-episode chapter or a contiguous credits chapter, or it runs to the end of the file).
     */
    private static boolean creditsNameMatches(List<MkvChapters.Chapter> chapters, int i, double runtime,
                                              double end, List<Segment> online) {
        MkvChapters.Chapter chapter = chapters.get(i);
        if (!CHAPTER_CREDITS.matcher(chapter.name).find()) return false;
        if (!"ending".equals(normTitle(chapterLabel(chapter.name)))) return true;
        if (runtime <= 0 || chapter.start < runtime * 0.80 || end - chapter.start > 240.0) return false;
        if (online != null) {
            for (Segment o : online) {
                if (o != null && o.isCredits() && Math.abs(o.startSeconds - chapter.start) <= 15.0) return true;
            }
        }
        if (i + 1 < chapters.size()) {
            MkvChapters.Chapter next = chapters.get(i + 1);
            if (next != null && next.name != null && CHAPTER_PREVIEW.matcher(next.name).find()
                    && !POST_CREDIT_NAME.matcher(next.name).find()) return true;
            // "Ending" + "Ending 2": the first half of a split credit roll (merged in chapterSegments).
            if (next != null && next.name != null && CHAPTER_CREDITS.matcher(next.name).find()
                    && !POST_CREDIT_NAME.matcher(next.name).find()
                    && end - chapter.start <= 240.0 && (next.end > next.start ? next.end : runtime) - chapter.start <= 480.0
                    && Math.abs(next.start - end) <= 2.0) return true;
        }
        return i == chapters.size() - 1 || end >= runtime - 2.0;
    }

    /**
     * Credits/preview windows never reach into a post-credit-named chapter: cut at its start, dropped when it
     * starts inside one or under 5 s remain. Other labels and no overlap: the same object.
     */
    private static Segment clipPostCredit(Segment s, List<MkvChapters.Chapter> chapters) {
        if (s == null || (!s.isCredits() && !s.isPreview()) || chapters == null || chapters.isEmpty()) return s;
        double newEnd = s.endSeconds;
        for (MkvChapters.Chapter c : chapters) {
            if (c == null || c.name == null || !POST_CREDIT_NAME.matcher(c.name).find()) continue;
            double pe = c.end > c.start ? c.end : Double.MAX_VALUE;
            if (c.start < newEnd && pe > s.startSeconds) {
                if (c.start <= s.startSeconds) return null;
                newEnd = c.start;
            }
        }
        if (newEnd == s.endSeconds) return s;
        if (newEnd - s.startSeconds < 5.0) return null;
        return new Segment(s.startSeconds, newEnd, s.label, s.source + " clipped at post-credit chapter");
    }

    /**
     * A to-end segment (TheIntroDB sent a start with no end) gets the file runtime as its end.
     * Null while the runtime is not known yet (combine() runs again on every poll, so the segment
     * is held, never lost) and null when a guard rejects it: a start before 60% of the runtime, or
     * a group duration more than the AniSkip 8 s tolerance away from this file (a different cut
     * would put the start in the wrong place). The raw -1 end never passes this point.
     */
    private static Segment resolveToEnd(Segment s, double runtime, DebugLogger logger) {
        if (s == null || !s.toEnd) return s;
        if (runtime <= 0) {
            if (logger != null) {
                logger.log("To-end " + s.label + " held: runtime not known yet (start "
                        + fmt3(s.startSeconds) + "s, source " + s.source + ")");
            }
            return null;
        }
        if (s.groupDurationSeconds > 0
                && Math.abs(s.groupDurationSeconds - runtime) > ANISKIP_LENGTH_TOLERANCE_S) {
            if (logger != null) {
                logger.log("To-end " + s.label + " dropped: group duration " + fmt3(s.groupDurationSeconds)
                        + "s differs from runtime " + fmt3(runtime) + "s by more than "
                        + fmt(ANISKIP_LENGTH_TOLERANCE_S) + "s (start " + fmt3(s.startSeconds) + "s)");
            }
            return null;
        }
        if (s.startSeconds < runtime * 0.60) {
            if (logger != null) {
                logger.log("To-end " + s.label + " dropped: start " + fmt3(s.startSeconds)
                        + "s is before 60% of runtime " + fmt3(runtime) + "s");
            }
            return null;
        }
        if (runtime <= s.startSeconds) {
            if (logger != null) {
                logger.log("To-end " + s.label + " dropped: start " + fmt3(s.startSeconds)
                        + "s is not before runtime " + fmt3(runtime) + "s");
            }
            return null;
        }
        if (logger != null) {
            logger.log("To-end " + s.label + " resolved: " + fmt3(s.startSeconds) + "s -> "
                    + fmt3(runtime) + "s (runtime, group duration "
                    + (s.groupDurationSeconds > 0 ? fmt3(s.groupDurationSeconds) + "s" : "unknown") + ")");
        }
        return new Segment(s.startSeconds, runtime, s.label, s.source + " to-end");
    }

    /** True for a to-end segment resolveToEnd() rejects on a known runtime (unknown runtime = held, not rejected). */
    private static boolean guardDroppedToEnd(Segment s, double runtime) {
        return s != null && s.toEnd && runtime > 0 && resolveToEnd(s, runtime, null) == null;
    }

    /** An online post_credits marker sane enough to protect a scene with (a whole-episode entry is not). */
    private static boolean sanePostCredits(Segment post, double runtime) {
        if (post == null || !post.isPostCredits() || post.endSeconds <= post.startSeconds
                || post.endSeconds - post.startSeconds > 600.0) return false;
        // No runtime yet: protect nothing (like a held to-end segment); combine() re-checks
        // on every poll, so the marker activates as soon as the duration is known.
        if (runtime <= 0) return false;
        return post.startSeconds >= runtime * 0.50 && post.startSeconds < runtime;
    }

    /**
     * Credits/preview windows never reach into an IntroDB.app post_credits scene: cut at its start,
     * dropped when the segment starts inside it or under 5 s remain, like clipPostCredit. Applied
     * only when the scene starts before the end of the file and passes sanePostCredits; a scene that
     * does not overlap the segment leaves it untouched (the same object).
     */
    private static Segment clipAtPostCredits(Segment s, Segment post, double runtime) {
        if (s == null || (!s.isCredits() && !s.isPreview()) || !sanePostCredits(post, runtime)) return s;
        if (post.startSeconds < s.endSeconds && post.endSeconds > s.startSeconds) {
            if (post.startSeconds <= s.startSeconds) return null;
            if (post.startSeconds - s.startSeconds < 5.0) return null;
            return new Segment(s.startSeconds, post.startSeconds, s.label,
                    s.source + " clipped at IntroDB.app post_credits");
        }
        return s;
    }

    /** True while the playhead is inside an IntroDB.app post_credits scene. */
    private static boolean inPostCredits(Segment post, double pos) {
        return post != null && pos >= post.startSeconds && pos < post.endSeconds;
    }

    /** Moves each end of an online window onto the nearest chapter boundary within 15 s. */
    private static Segment snap(Segment segment, List<MkvChapters.Chapter> chapters) {
        if (chapters == null || chapters.isEmpty()) return segment;
        double start = nearestBoundary(segment.startSeconds, chapters);
        double end = nearestBoundary(segment.endSeconds, chapters);
        // Both ends on boundaries with the same length = the OP is a chapter: snap both. A lone
        // nearby boundary is trusted only within 3 s (generic chapters also cut scenes near an OP).
        boolean both = start >= 0 && end >= 0
                && Math.abs((end - start) - (segment.endSeconds - segment.startSeconds)) <= 5.0;
        if (!both) {
            if (start >= 0 && Math.abs(start - segment.startSeconds) > 3.0) start = -1;
            if (end >= 0 && Math.abs(end - segment.endSeconds) > 3.0) end = -1;
        }
        if (start < 0 && end < 0) return segment;
        double newStart = start >= 0 ? start : segment.startSeconds;
        double newEnd = end >= 0 ? end : segment.endSeconds;
        if (newEnd - newStart < 10) return segment;
        return new Segment(newStart, newEnd, segment.label, segment.source + " snapped to chapters ("
                + (start >= 0 ? "start " + fmt3(start - segment.startSeconds) + "s" : "start not snapped") + ", "
                + (end >= 0 ? "end " + fmt3(end - segment.endSeconds) + "s" : "end not snapped") + ")");
    }

    private static double nearestBoundary(double time, List<MkvChapters.Chapter> chapters) {
        double best = -1;
        for (MkvChapters.Chapter chapter : chapters) {
            for (double boundary : new double[]{chapter.start, chapter.end}) {
                if (boundary < 0 || Math.abs(boundary - time) > 15.0) continue;
                if (best < 0 || Math.abs(boundary - time) < Math.abs(best - time)) best = boundary;
            }
        }
        return best;
    }

    private static List<Object> diarySegs(List<Segment> list) {
        List<Object> out = new ArrayList<>();
        if (list != null) for (Segment s : list) out.add(PlaybackDiary.seg(s.label, s.startSeconds, s.endSeconds, s.source));
        return out;
    }

    private static final class Segment {
        final double startSeconds;
        final double endSeconds;
        /** "OP", "recap", "credits", "preview" or "post_credits" (protected, never skippable). */
        final String label;
        final String source;
        /** TheIntroDB sent no end: runs to the end of the file; endSeconds is -1 until combine() resolves it. */
        final boolean toEnd;
        /** TheIntroDB group_duration_ms in seconds (details=true), 0 when unknown. */
        final double groupDurationSeconds;
        /** Zero-start conflict with another family: show as a button, never auto-skip. */
        final boolean buttonOnly;

        Segment(double startSeconds, double endSeconds, String label, String source) {
            this(startSeconds, endSeconds, label, source, false, 0.0);
        }

        Segment(double startSeconds, double endSeconds, String label, String source,
                boolean toEnd, double groupDurationSeconds) {
            this(startSeconds, endSeconds, label, source, toEnd, groupDurationSeconds, false);
        }

        Segment(double startSeconds, double endSeconds, String label, String source,
                boolean toEnd, double groupDurationSeconds, boolean buttonOnly) {
            this.startSeconds = startSeconds;
            this.endSeconds = endSeconds;
            this.label = label;
            this.source = source;
            this.toEnd = toEnd;
            this.groupDurationSeconds = groupDurationSeconds;
            this.buttonOnly = buttonOnly;
        }

        Segment buttonOnlyCopy() {
            return new Segment(startSeconds, endSeconds, label, source, toEnd,
                    groupDurationSeconds, true);
        }

        /** A demoted segment of the same type overlapping this one, or null. */
        Segment buttonOnlyOverlapIn(java.util.List<Segment> raws) {
            if (raws == null) return null;
            for (Segment raw : raws) {
                if (raw.buttonOnly && label.equals(raw.label)
                        && Math.min(endSeconds, raw.endSeconds)
                                - Math.max(startSeconds, raw.startSeconds) > 0.0) return raw;
            }
            return null;
        }

        /** The other-family segment this one zero-conflicts with, or null. */
        Segment zeroConflictIn(java.util.List<Segment> raws) {
            if (raws == null) return null;
            for (Segment raw : raws) {
                if (raw != this && label.equals(raw.label) && InnerBounds.zeroConflict(
                        startSeconds, endSeconds, source,
                        raw.startSeconds, raw.endSeconds, raw.source)) return raw;
            }
            return null;
        }

        boolean isPostCredits() {
            return "post_credits".equals(label);
        }

        boolean isRecap() {
            return "recap".equals(label);
        }

        boolean isCredits() {
            return "credits".equals(label);
        }

        boolean isPreview() {
            return "preview".equals(label);
        }

        /**
         * A preview only guessed (tail after the credits with or without a generic last chapter, subtitle or
         * live cue): no chapter name and no online source says so. Button only, never an automatic skip.
         * Sources may carry a suffix (" clipped at post-credit chapter").
         */
        boolean inferred() {
            return isPreview() && source != null
                    && (source.startsWith("post-ed-tail") || source.startsWith("tail-chapter")
                    || source.startsWith("subtitle-cue") || source.startsWith("live-cue"));
        }

        String key() {
            return label + "@" + startSeconds + "-" + endSeconds;
        }

        String buttonText() {
            if (isRecap()) return "Skip Recap";
            if (isCredits()) return "Skip Credits";
            if (isPreview()) return "Skip Preview";
            return "Skip Intro";
        }

        String skippedText() {
            if (isRecap()) return "Recap skipped";
            if (isCredits()) return "Credits skipped";
            if (isPreview()) return "Preview skipped";
            return "Intro skipped";
        }
    }

    private static final class MediaInfo {
        final String title;
        final int season;
        final int episode;
        final String imdbId;
        final String key;
        final String snapshot;
        final String debug;

        MediaInfo(String title, int season, int episode, String imdbId, String key, String snapshot, String debug) {
            this.title = title;
            this.season = season;
            this.episode = episode;
            this.imdbId = imdbId;
            this.key = key;
            this.snapshot = snapshot;
            this.debug = debug;
        }

        boolean ready() {
            return title.length() > 0 && episode > 0;
        }
    }

    private static MediaInfo mediaInfoFor(SkipPlayer player, View playerView, String[] presetStremioId) {
        SkipPlayer.MediaHint hint = player.mediaHint();
        SkipPlayer.Meta playerMetadata = hint.playerMeta;
        SkipPlayer.Meta itemMetadata = hint.itemMeta;

        List<String> titleCandidates = new ArrayList<>();
        List<String> episodeCandidates = new ArrayList<>();

        addMetadataCandidates(playerMetadata, titleCandidates, episodeCandidates);
        addMetadataCandidates(itemMetadata, titleCandidates, episodeCandidates);

        if (hint.hasItem) {
            addTitleCandidate(titleCandidates, hint.mediaId);
            addEpisodeCandidate(episodeCandidates, hint.mediaId);
            try {
                addUriCandidates(Uri.parse(hint.mediaId), titleCandidates, episodeCandidates);
            } catch (Exception ignored) {
                // The media id is not necessarily a URI.
            }
        }
        if (hint.hasLocal) {
            addUriCandidates(hint.uri, titleCandidates, episodeCandidates);
            addObjectCandidates(hint.tag, titleCandidates, episodeCandidates);
        }
        if (hint.hasRequest) {
            addUriCandidates(hint.requestUri, titleCandidates, episodeCandidates);
            addTitleCandidate(titleCandidates, hint.requestSearchQuery);
            addEpisodeCandidate(episodeCandidates, hint.requestSearchQuery);
            addBundleCandidates(hint.requestExtras, titleCandidates, episodeCandidates);
        }

        if (playerView != null) {
            addTitleCandidate(titleCandidates, text(playerView.getContentDescription()));
            addObjectCandidates(playerView.getTag(), titleCandidates, episodeCandidates);
            View parent = playerView.getParent() instanceof View
                    ? (View) playerView.getParent() : null;
            if (parent != null) {
                addTitleCandidate(titleCandidates, text(parent.getContentDescription()));
                addObjectCandidates(parent.getTag(), titleCandidates, episodeCandidates);
            }
        }

        String[] stremioId = presetStremioId != null ? presetStremioId : stremioVideoId(playerView);
        int vidEpisode = stremioId == null ? 0 : parseInt(stremioId[2]);
        int[] metaSxE = metadataSeasonEpisode(playerMetadata, itemMetadata);
        String fastTitle = firstTitle(titleCandidates);
        int fastEpisode = vidEpisode > 0 ? vidEpisode
                : metaSxE[1] > 0 ? metaSxE[1] : firstEpisode(episodeCandidates);

        // Only walk the player object graph via reflection when fast metadata did not yield
        // both a usable title and an episode number.
        StringBuilder reflective = new StringBuilder();
        if (fastTitle.length() == 0 || fastEpisode <= 0) {
            List<String> reflectedTitles = new ArrayList<>();
            List<String> reflectedEpisodes = new ArrayList<>();
            Set<Object> visited = Collections.newSetFromMap(new IdentityHashMap<Object, Boolean>());
            if (hint.reflectionRoots != null) {
                for (Object root : hint.reflectionRoots) {
                    collectReflectiveCandidates(root, reflectedTitles, reflectedEpisodes, reflective, 0, visited);
                }
            }
            titleCandidates.addAll(reflectedTitles);
            episodeCandidates.addAll(reflectedEpisodes);
        }

        String title = fastTitle.length() > 0 ? fastTitle : firstTitle(titleCandidates);
        int episode = fastEpisode > 0 ? fastEpisode : firstEpisode(episodeCandidates);
        if (episode == 0) {
            episode = fallbackTrackNumber(playerMetadata, itemMetadata);
        }
        String id = !hint.hasItem ? "" : safe(hint.mediaId);
        String uri = !hint.hasLocal || hint.uri == null ? "" : safe(hint.uri.toString());
        int season = vidEpisode > 0 ? parseInt(stremioId[1]) : metaSxE[1] > 0 ? metaSxE[0] : 0;
        String seasonSource = vidEpisode > 0 ? "Stremio video id"
                : metaSxE[1] > 0 ? "Stremio title (SxxEyy)" : "";
        if (season == 0 && metaSxE[1] == 0 && vidEpisode == 0) {
            // Path only: a CDN host such as "s4.example.com" must not read as season 4.
            season = seasonFromText(!hint.hasLocal || hint.uri == null ? "" : safe(hint.uri.getPath()));
            if (season > 0) seasonSource = "decoded URI / file name";
        }
        if (season == 0 && metaSxE[1] == 0) {
            season = seasonFromText(id);
            if (season > 0) seasonSource = "mediaId";
        }
        String imdbId = stremioId != null ? stremioId[0]
                : firstImdbId(id, uri, titleCandidates, episodeCandidates);
        String identity = id.length() > 0 ? id : uri;
        String key = title + "|S" + season + "E" + episode + "|" + identity;
        String snapshot = key + "|" + describeMetadata(playerMetadata) + "|" +
                describeMetadata(itemMetadata) + "|" + uri + "|" + describeObject(!hint.hasLocal ? null : hint.tag);

        StringBuilder debug = new StringBuilder();
        debug.append("Title: ").append(title.length() == 0 ? "<not found>" : title).append('\n');
        debug.append("Season: ").append(season > 0 ? season : "<not found>").append('\n');
        if (seasonSource.length() > 0) {
            debug.append("Season source: ").append(seasonSource).append('\n');
        }
        debug.append("Episode: ").append(episode > 0 ? episode : "<not found>").append('\n');
        debug.append("IMDb id: ").append(imdbId.length() == 0 ? "<not found>" : imdbId)
                .append(stremioId != null ? " (Stremio video id)" : "").append('\n');
        debug.append("Key: ").append(key).append('\n');
        appendMediaDebug(debug, hint, playerView);
        if (reflective.length() > 0) {
            debug.append("Stremio reflection:\n").append(clip(reflective.toString()));
        }
        return new MediaInfo(title, season, episode, imdbId, key, snapshot, debug.toString());
    }

    private static String firstImdbId(String id, String uri, List<String> titles, List<String> episodes) {
        List<String> haystacks = new ArrayList<>();
        haystacks.add(safe(id));
        haystacks.add(safe(uri));
        haystacks.addAll(titles);
        haystacks.addAll(episodes);
        for (String haystack : haystacks) {
            Matcher matcher = IMDB_ID.matcher(haystack);
            if (matcher.find()) return matcher.group(1).toLowerCase(Locale.US);
        }
        return "";
    }

    private static int[] metadataSeasonEpisode(SkipPlayer.Meta first, SkipPlayer.Meta second) {
        for (SkipPlayer.Meta metadata : new SkipPlayer.Meta[]{first, second}) {
            if (metadata == null) continue;
            for (String value : new String[]{text(metadata.title), text(metadata.displayTitle)}) {
                Matcher matcher = META_SEASON_EPISODE.matcher(value);
                if (matcher.find()) {
                    return new int[]{parseInt(matcher.group(1)), parseInt(matcher.group(2))};
                }
            }
        }
        return new int[]{0, 0};
    }

    private static void addMetadataCandidates(SkipPlayer.Meta metadata,
                                              List<String> titles,
                                              List<String> episodes) {
        if (metadata == null) return;
        addTitleCandidate(titles, text(metadata.title));
        addTitleCandidate(titles, text(metadata.displayTitle));
        addTitleCandidate(titles, text(metadata.albumTitle));
        addTitleCandidate(titles, text(metadata.albumArtist));
        addTitleCandidate(titles, text(metadata.artist));
        addStructuredTitleCandidate(titles, text(metadata.description));
        addStructuredTitleCandidate(titles, text(metadata.subtitle));
        addBundleCandidates(metadata.extras, titles, episodes);
    }

    private static void addBundleCandidates(Bundle bundle,
                                             List<String> titles,
                                             List<String> episodes) {
        if (bundle == null) return;
        for (String key : bundle.keySet()) {
            Object value;
            try {
                value = bundle.get(key);
            } catch (Exception ignored) {
                continue;
            }
            String lower = key == null ? "" : key.toLowerCase(Locale.US);
            if (isTitleKey(lower)) addTitleCandidate(titles, describeObject(value));
            if (isEpisodeKey(lower)) addEpisodeCandidate(episodes, describeObject(value));
            if (value instanceof Bundle) addBundleCandidates((Bundle) value, titles, episodes);
        }
    }

    private static void addObjectCandidates(Object value,
                                             List<String> titles,
                                             List<String> episodes) {
        if (value == null) return;
        if (value instanceof Bundle) {
            addBundleCandidates((Bundle) value, titles, episodes);
        }
        String raw = describeObject(value);
        addStructuredTitleCandidate(titles, raw);
        addEpisodeCandidate(episodes, raw);
    }

    /** The player fragment that owns the view (androidx FragmentManager.findFragment), or null. */
    private static Object playerFragment(View view) throws Exception {
        if (view == null || !view.isAttachedToWindow()) return null;
        Class<?> manager = Class.forName("androidx.fragment.app.FragmentManager", false,
                view.getContext().getClassLoader());
        return manager.getMethod("findFragment", View.class).invoke(null, view);
    }

    /** The fragment's raw videoId argument ("tt1844624:13:1", "tt0133093", "kitsu:46474:3"), "" when unreadable. */
    private static String rawVideoId(View view) {
        if (view instanceof PortHooks.PortHost) return PortHooks.streamId().trim();
        try {
            Object fragment = playerFragment(view);
            if (fragment == null) return "";
            Object args = fragment.getClass().getMethod("getArguments").invoke(fragment);
            if (!(args instanceof Bundle)) return "";
            String videoId = safe(((Bundle) args).getString("videoId"));
            if (videoId.length() == 0) videoId = safe(((Bundle) args).getString("id"));
            return videoId.trim();
        } catch (Throwable ignored) {
            return "";
        }
    }

    /**
     * {raw videoId, Stremio meta type} of the playing item, "" for what cannot be read. The type is
     * PlayerFragment.getViewModel().getState().getValue().getMetaItem().getType(), the chain
     * ExternalProgress.captureExternal() reads ("movie", "series", ...).
     */
    private static String[] stremioKindSignals(View view) {
        if (view instanceof PortHooks.PortHost) {
            return new String[]{PortHooks.streamId().trim(), PortHooks.metaType().trim()};
        }
        String type = "";
        try {
            Object fragment = playerFragment(view);
            Object model = fragment == null ? null : callGetter(fragment, "getViewModel");
            Object flow = model == null ? null : callGetter(model, "getState");
            Object state = flow == null ? null : callGetter(flow, "getValue");
            Object meta = state == null ? null : callGetter(state, "getMetaItem");
            type = meta == null ? "" : safe(String.valueOf(callGetter(meta, "getType")));
        } catch (Throwable ignored) {
        }
        return new String[]{rawVideoId(view), "null".equals(type) ? "" : type.trim()};
    }

    private static Object callGetter(Object target, String name) throws Exception {
        for (Class<?> type = target.getClass(); type != null; type = type.getSuperclass()) {
            try {
                java.lang.reflect.Method method = type.getDeclaredMethod(name);
                method.setAccessible(true);
                return method.invoke(target);
            } catch (NoSuchMethodException ignored) {
            }
        }
        throw new NoSuchMethodException(target.getClass().getName() + "." + name);
    }

    /**
     * {"series" | "movie" | "unknown", reason}. The video id and the meta type each vote; a bare
     * "tt.." / "kitsu:ID" / "tmdb:ID" is a movie, an id with an episode part a series. They must agree.
     * With neither readable, a season and an episode from the title are enough for "series".
     * Everything else (no vote, or conflicting votes) is "unknown": the caller does not skip.
     */
    static String[] classifyKind(String videoId, String metaType, int season, int episode) {
        String id = safe(videoId).trim().toLowerCase(Locale.US);
        String type = safe(metaType).trim().toLowerCase(Locale.US);
        String byId = VIDEO_ID_SERIES.matcher(id).matches() ? "series" : VIDEO_ID_MOVIE.matcher(id).matches() ? "movie" : "";
        String byType = type.contains("movie") || type.contains("film") ? "movie"
                : type.equals("series") || type.equals("show") || type.equals("anime") ? "series" : "";
        if (byId.length() > 0 && byType.length() > 0 && !byId.equals(byType)) {
            return new String[]{"unknown", "id says " + byId + ", type says " + byType};
        }
        if (byId.length() > 0) return new String[]{byId, byType.length() > 0 ? "id and type agree" : "from id"};
        if (byType.length() > 0) return new String[]{byType, "from type"};
        if (id.length() == 0 && type.length() == 0 && season > 0 && episode > 0) {
            return new String[]{"series", "from title S" + season + "E" + episode};
        }
        return new String[]{"unknown", "no usable movie/series signal"};
    }

    /**
     * IMDb id (or "kitsu:ID"), season and episode of the playing item as Stremio itself knows them: the
     * player fragment's videoId ("tt1844624:13:1", "kitsu:46474:3"). Null when it is unreadable or
     * has no episode part.
     */
    private static String[] stremioVideoId(View view) {
        try {
            if (view == null || !view.isAttachedToWindow()) return null;
            if (sysprop("debug.aniskip.noid")) return null; // test switch: force the Cinemeta fallback
            Matcher matcher = STREMIO_VIDEO_ID.matcher(rawVideoId(view));
            if (!matcher.find()) return null;
            if (matcher.group(4) != null) {
                return new String[]{"kitsu:" + matcher.group(4), "0", matcher.group(5)};
            }
            return new String[]{safe(matcher.group(1)),
                    matcher.group(2) == null ? "0" : matcher.group(2),
                    matcher.group(3) == null ? "0" : matcher.group(3)};
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void addUriCandidates(Uri uri,
                                         List<String> titles,
                                         List<String> episodes) {
        if (uri == null) return;
        String[] queryKeys = new String[]{
                "title", "name", "series", "show", "anime", "mediaTitle",
                "torrent_name", "torrentName", "filename", "file_name", "fileName"
        };
        for (String key : queryKeys) addTitleCandidate(titles, uri.getQueryParameter(key));
        String[] episodeKeys = new String[]{
                "episode", "episodeNumber", "ep", "number", "episode_index", "episodeIndex",
                "torrent_name", "torrentName", "filename", "file_name", "fileName"
        };
        for (String key : episodeKeys) addEpisodeCandidate(episodes, uri.getQueryParameter(key));

        List<String> path = uri.getPathSegments();
        for (int i = 0; i < path.size(); i++) {
            String segment = decode(path.get(i));
            // A bare number is a torrent file index (/<hash>/<file>/6/...), never an episode.
            if (segment.matches("\\d{1,4}")) continue;
            int episode = episodeFromText(segment);
            if (episode > 0) {
                addEpisodeCandidate(episodes, segment);
                if (i > 0) addTitleCandidate(titles, path.get(i - 1));
            }
        }
    }

    private static void addTitleCandidate(List<String> candidates, String value) {
        if (value != null && value.trim().length() > 0) candidates.add(value.trim());
    }

    private static void addEpisodeCandidate(List<String> candidates, String value) {
        if (value != null && value.trim().length() > 0) candidates.add(value.trim());
    }

    private static void addStructuredTitleCandidate(List<String> candidates, String value) {
        String title = structuredTitle(value);
        if (title.length() > 0) candidates.add(title);
    }

    private static String firstTitle(List<String> candidates) {
        for (String candidate : candidates) {
            String structured = structuredTitle(candidate);
            String cleaned = cleanTitle(structured.length() > 0 ? structured : candidate);
            if (isUsableTitle(cleaned)) return cleaned;
        }
        return "";
    }

    private static String structuredTitle(String value) {
        String raw = safe(value);
        if (raw.length() == 0) return "";
        try {
            if (raw.startsWith("{") && raw.endsWith("}")) {
                JSONObject object = new JSONObject(raw);
                String[] keys = new String[]{
                        "title", "name", "series", "show", "anime", "mediaTitle",
                        "torrent_name", "torrentName", "filename", "file_name", "fileName"
                };
                for (String key : keys) {
                    String result = object.optString(key, "");
                    if (result.length() > 0) return result;
                }
                for (String key : new String[]{"meta", "media", "item", "metadata"}) {
                    JSONObject nested = object.optJSONObject(key);
                    String result = structuredTitle(nested == null ? "" : nested.toString());
                    if (result.length() > 0) return result;
                }
            }
        } catch (Exception ignored) {
            // Try the key=value/data-class form below.
        }
        Matcher matcher = STRUCTURED_TITLE.matcher(raw);
        return matcher.find() ? safe(matcher.group(1)) : "";
    }

    private static String cleanTitle(String value) {
        String result = decode(value);
        result = result.replaceAll("(?i)^(?:\\[[^\\]]+\\]\\s*)+", "");
        result = result.replaceAll("(?i)\\.(?:mkv|mp4|webm|m3u8)$", "");
        result = result.replaceAll("(?i)\\s*\\[[^\\]]*(?:\\d{3,4}p|webrip|web-dl|bluray|h264|x264|aac|sub|dub)[^\\]]*\\]\\s*$", "");
        result = result.replaceAll("(?i)(?:[ ._-]+)(?:S\\d{1,2}[ ._-]*E\\d{1,4}|episode[ ._-]*\\d{1,4}|ep[ ._-]*\\d{1,4}).*$", "");
        result = result.replaceAll("(?i)(?:[ ._-]+)(?:episode|ep)[ ._-]*\\d{1,4}.*$", "");
        result = result.replaceAll("[._-]+", " ").trim();
        return result.replaceAll("\\s{2,}", " ").trim();
    }

    private static boolean isUsableTitle(String value) {
        if (value == null || value.length() < 2 || value.length() > 160) return false;
        if (value.matches("(?i)^(episode|ep|e|stream|video|media|watch|play|source|cdn|hls|dash|file|download|unknown)[ ._-]*\\d*$")) return false;
        if (value.matches("\\d{1,4}") || value.matches("[0-9a-fA-F]{20,}")) return false;
        if (!value.matches(".*\\p{L}.*")) return false;
        if (value.contains("://") || value.contains("/") || value.contains("\\\\")) return false;
        return true;
    }

    private static int firstEpisode(List<String> candidates) {
        for (String candidate : candidates) {
            int episode = episodeFromText(candidate);
            if (episode > 0) return episode;
        }
        return 0;
    }

    private static int fallbackTrackNumber(SkipPlayer.Meta first, SkipPlayer.Meta second) {
        Integer firstTrack = first == null ? null : first.trackNumber;
        if (firstTrack != null && firstTrack > 0) return firstTrack;
        Integer secondTrack = second == null ? null : second.trackNumber;
        return secondTrack == null ? 0 : Math.max(secondTrack, 0);
    }

    private static int episodeFromText(String value) {
        String raw = decode(value);
        if (raw.length() == 0) return 0;
        try {
            if (raw.startsWith("{") && raw.endsWith("}")) {
                JSONObject object = new JSONObject(raw);
                for (String key : new String[]{
                        "episode", "episodeNumber", "ep", "number", "episode_index", "episodeIndex"
                }) {
                    int result = object.optInt(key, 0);
                    if (result > 0) return result;
                }
            }
        } catch (Exception ignored) {
            // Continue with textual patterns.
        }
        Matcher matcher = SEASON_EPISODE.matcher(raw);
        boolean found = matcher.find();
        if (!found) {
            matcher = EPISODE.matcher(raw);
            found = matcher.find();
        }
        if (found) {
            try {
                String g = matcher.group(1) != null ? matcher.group(1)
                        : (matcher.groupCount() >= 2 ? matcher.group(2) : null);
                return g == null ? 0 : Integer.parseInt(g);
            } catch (NumberFormatException ignored) {
                return 0;
            }
        }
        return raw.matches("\\d{1,4}") ? parseInt(raw) : 0;
    }

    private static int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ignored) {
            return 0;
        }
    }

    private static void collectReflectiveCandidates(Object value,
                                                    List<String> titles,
                                                    List<String> episodes,
                                                    StringBuilder debug,
                                                    int depth,
                                                    Set<Object> visited) {
        if (value == null || depth > 2 || visited.contains(value)) return;
        Class<?> type = value.getClass();
        if (type.isPrimitive() || type == String.class || type.isEnum()) return;
        visited.add(value);
        if (value instanceof Bundle) {
            addBundleCandidates((Bundle) value, titles, episodes);
            return;
        }
        Field[] fields;
        try {
            fields = type.getDeclaredFields();
        } catch (Throwable ignored) {
            return;
        }
        for (Field field : fields) {
            String name = field.getName();
            String lower = name.toLowerCase(Locale.US);
            if (!isInterestingField(lower)) continue;
            try {
                field.setAccessible(true);
                Object fieldValue = field.get(value);
                if (fieldValue == null) continue;
                String printable = describeObject(fieldValue);
                if (isTitleKey(lower)) addTitleCandidate(titles, printable);
                if (isEpisodeKey(lower)) addEpisodeCandidate(episodes, printable);
                if (debug.length() < 5000) {
                    debug.append(name).append('=').append(clip(printable)).append('\n');
                }
                if (depth < 2 && (lower.contains("media") || lower.contains("meta") ||
                        lower.contains("item") || lower.contains("stream") || lower.contains("tag") ||
                        lower.contains("request") || lower.contains("config") || lower.contains("player") ||
                        lower.contains("delegate") || lower.contains("backend") || lower.contains("engine") ||
                        lower.contains("state") || lower.contains("current") || lower.contains("impl"))) {
                    collectReflectiveCandidates(fieldValue, titles, episodes, debug,
                            depth + 1, visited);
                }
            } catch (Throwable ignored) {
                // Some framework fields cannot be accessed; continue with the others.
            }
        }
    }

    private static boolean isInterestingField(String name) {
        return isTitleKey(name) || isEpisodeKey(name) || name.contains("media") ||
                name.contains("meta") || name.contains("item") || name.contains("stream") ||
                name.contains("request") || name.contains("config") || name.contains("tag") ||
                name.contains("player") || name.contains("delegate") || name.contains("backend") ||
                name.contains("engine") || name.contains("state") || name.contains("current") ||
                name.contains("impl") || name.equals("url") || name.equals("uri");
    }

    private static boolean isTitleKey(String name) {
        return name.contains("title") || name.equals("name") || name.contains("series") ||
                name.contains("show") || name.contains("anime") || name.contains("torrentname") ||
                name.contains("filename");
    }

    private static boolean isEpisodeKey(String name) {
        return name.contains("episode") || name.equals("ep") || name.contains("episodenumber") ||
                name.contains("tracknumber") || name.equals("number") || name.contains("seasonepisode");
    }

    private static void appendMediaDebug(StringBuilder debug,
                                         SkipPlayer.MediaHint hint,
                                         View playerView) {
        debug.append("Player metadata: ").append(describeMetadata(hint.playerMeta)).append('\n');
        debug.append("Item metadata: ").append(describeMetadata(hint.itemMeta)).append('\n');
        if (hint.hasItem) {
            debug.append("mediaId: ").append(safe(hint.mediaId)).append('\n');
        }
        if (hint.hasLocal) {
            debug.append("URI: ").append(hint.uri == null ? "" : hint.uri).append('\n');
            debug.append("mimeType: ").append(safe(hint.mimeType)).append('\n');
            debug.append("customCacheKey: ").append(safe(hint.customCacheKey)).append('\n');
            debug.append("tag: ").append(clip(describeObject(hint.tag))).append('\n');
        }
        if (hint.hasRequest) {
            debug.append("request.mediaUri: ").append(hint.requestUri == null ? "" : hint.requestUri).append('\n');
            debug.append("request.searchQuery: ").append(safe(hint.requestSearchQuery)).append('\n');
            debug.append("request.extras: ").append(clip(bundleToText(hint.requestExtras))).append('\n');
        }
        if (playerView != null) {
            debug.append("view.contentDescription: ").append(text(playerView.getContentDescription())).append('\n');
            debug.append("view.tag: ").append(clip(describeObject(playerView.getTag()))).append('\n');
        }
    }

    private static String describeMetadata(SkipPlayer.Meta metadata) {
        if (metadata == null) return "<null>";
        return "title=" + clip(text(metadata.title)) +
                ", displayTitle=" + clip(text(metadata.displayTitle)) +
                ", albumTitle=" + clip(text(metadata.albumTitle)) +
                ", artist=" + clip(text(metadata.artist)) +
                ", subtitle=" + clip(text(metadata.subtitle)) +
                ", description=" + clip(text(metadata.description)) +
                ", trackNumber=" + metadata.trackNumber +
                ", extras=" + clip(bundleToText(metadata.extras));
    }

    private static String describeObject(Object value) {
        if (value == null) return "<null>";
        if (value instanceof Bundle) return bundleToText((Bundle) value);
        try {
            return String.valueOf(value);
        } catch (Throwable error) {
            return "<" + value.getClass().getName() + ">";
        }
    }

    private static String bundleToText(Bundle bundle) {
        if (bundle == null) return "<null>";
        StringBuilder result = new StringBuilder("{");
        for (String key : bundle.keySet()) {
            if (result.length() > 1) result.append(", ");
            Object value;
            try {
                value = bundle.get(key);
            } catch (Exception error) {
                value = "<error>";
            }
            result.append(key).append('=').append(describeObject(value));
            if (result.length() > 4000) {
                result.append("...");
                break;
            }
        }
        return result.append('}').toString();
    }

    private interface DebugLogger {
        void log(String message);
    }

    /**
     * Cinemeta genres say whether the show is an anime. Asked before AniList, so a live-action
     * show costs no AniList query (and no 429 refetches). Only ANIME / NOT_ANIME are cached.
     */
    private static int animeEvidence(String imdbId, DebugLogger logger) {
        Integer cached = ANIME_EVIDENCE_CACHE.get(imdbId);
        if (cached != null) return cached;
        Long previous = DEADLINE_MS.get();
        try {
            // A slow Cinemeta must not eat the AniSkip budget: 4 s at most for this call.
            long limit = SystemClock.uptimeMillis() + 4000L;
            DEADLINE_MS.set(previous == null ? limit : Math.min(previous, limit));
            JSONObject meta = new JSONObject(request("GET", CINEMETA_META_SERIES_URL + imdbId + ".json", null,
                    logger)).optJSONObject("meta");
            if (meta == null) return EVIDENCE_UNKNOWN;
            JSONArray genres = meta.optJSONArray("genres");
            boolean any = genres != null && genres.length() > 0;
            for (int i = 0; any && i < genres.length(); i++) {
                String genre = genres.optString(i, "").toLowerCase(Locale.US);
                if (genre.contains("animation") || genre.contains("anime")) {
                    ANIME_EVIDENCE_CACHE.put(imdbId, EVIDENCE_ANIME);
                    logger.log("Cinemeta: " + imdbId + " genres " + genres + " -> anime");
                    return EVIDENCE_ANIME;
                }
            }
            String country = meta.optString("country", "");
            if (any && country.length() > 0 && !country.contains("Japan")) {
                ANIME_EVIDENCE_CACHE.put(imdbId, EVIDENCE_NOT_ANIME);
                logger.log("Cinemeta: " + imdbId + " genres " + genres + " country "
                        + meta.optString("country", "") + " -> not an anime");
                return EVIDENCE_NOT_ANIME;
            }
        } catch (Exception error) {
            logger.log("Cinemeta: anime evidence unavailable: " + error.getClass().getSimpleName());
        } finally {
            if (previous == null) DEADLINE_MS.remove();
            else DEADLINE_MS.set(previous);
        }
        return EVIDENCE_UNKNOWN;
    }

    /** Skip data looked up while the previous episode played (NextPrep); taken by the next episode's startFetch. */
    private static final class PreSkips {
        final List<Segment> ani;
        final List<Segment> intro;
        final long length;
        final boolean anime;

        PreSkips(List<Segment> ani, List<Segment> intro, long length, boolean anime) {
            this.ani = ani;
            this.intro = intro;
            this.length = length;
            this.anime = anime;
        }
    }

    private static final Map<String, PreSkips> PRE_SKIPS = new java.util.concurrent.ConcurrentHashMap<>();
    private static final Set<String> PRE_SKIPS_INFLIGHT = java.util.Collections.newSetFromMap(
            new java.util.concurrent.ConcurrentHashMap<String, Boolean>());

    private static String preSkipsKey(String imdbId, String title, int season, int episode) {
        return safe(imdbId) + "|" + safe(title) + "|" + season + "|" + episode;
    }

    /** Runs the same lookups startFetch would, on the NETWORK pool; kept only when no source failed. */
    static void prefetchSkips(final android.content.Context ctx, final String imdbId, final String title,
                              final int season, final int episode, final long length) {
        final String key = preSkipsKey(imdbId, title, season, episode);
        if (length <= 0 || PRE_SKIPS.containsKey(key) || !PRE_SKIPS_INFLIGHT.add(key)) return;
        final boolean anime = IntroSkipPrefs.isAnimeEnabled(ctx);
        NETWORK.execute(new Runnable() {
            @Override
            public void run() {
                try {
                    List<Segment> ani = null;
                    if (anime) {
                        beginSource(ANISKIP_BUDGET_MS);
                        try {
                            ani = fetchAniSkip(ctx, imdbId, title, season, episode, length, QUIET);
                            if (sourceFailed()) return;
                        } finally {
                            endSource();
                        }
                    }
                    List<Segment> intro = null;
                    if (!isKitsuId(imdbId)) {
                        IntroChain chain = new IntroChain(ctx, imdbId, title, season, episode, length);
                        Set<String> failed = chain.run(null, new IntroSink() {
                            @Override
                            public void partial(List<Segment> snapshot) {
                                // Only the final result is kept.
                            }
                        }, QUIET);
                        if (!failed.isEmpty()) return;
                        intro = chain.result();
                    }
                    if (PRE_SKIPS.size() >= 4) PRE_SKIPS.clear();
                    PRE_SKIPS.put(key, new PreSkips(ani, intro, length, anime));
                    PlaybackDiary.ev(ctx, "next.skips", "ready", true, "s", season, "e", episode,
                            "ani", ani == null ? -1 : ani.size(), "intro", intro == null ? -1 : intro.size());
                } catch (Throwable ignored) {
                    // The next episode looks up at its start, as before.
                } finally {
                    PRE_SKIPS_INFLIGHT.remove(key);
                }
            }
        });
    }

    /** The prepared skip data of this episode when its length and settings match; consumed. */
    private static PreSkips takePreSkips(String imdbId, String title, int season, int episode, long length,
                                         boolean anime) {
        if (length <= 0) return null; // the length-known refresh call decides
        PreSkips pre = PRE_SKIPS.remove(preSkipsKey(imdbId, title, season, episode));
        if (pre == null || pre.anime != anime || Math.abs(pre.length - length) > ANISKIP_LENGTH_TOLERANCE_S) {
            return null;
        }
        return pre;
    }

    private static List<Segment> fetchAniSkip(android.content.Context ctx, String imdbId, String title,
                                              int season, int episode, long episodeLength, DebugLogger logger) {
        List<Segment> segments = new ArrayList<>();
        if (title.length() == 0 || episode < 1) {
            logger.log("AniSkip skipped: title or episode not found");
            return segments;
        }
        boolean hasImdb = isImdbId(imdbId);
        if (hasImdb && season == 0) {
            // A special is not a main-series episode; (season 0 without a tt id is the Kitsu shape).
            logger.log("AniSkip skipped: season 0 special");
            return segments;
        }
        int evidence = hasImdb ? animeEvidence(imdbId, logger) : EVIDENCE_UNKNOWN;
        if (evidence == EVIDENCE_NOT_ANIME) {
            logger.log("AniList skipped: Cinemeta says this is not an anime");
            return segments;
        }
        try {
            // Kitsu ids map straight to MAL (the episode is already within that entry); no AniList search.
            int[] mapped = isKitsuId(imdbId) ? new int[]{kitsuMalId(ctx, imdbId, logger), episode}
                    : resolveMalId(title, season, episode, evidence, logger);
            int malId = mapped[0];
            if (mapped[1] != episode) {
                logger.log("AniList: episode " + episode + " = episode " + mapped[1] + " of part 2");
                episode = mapped[1];
            }
            if (malId <= 0) {
                logger.log((isKitsuId(imdbId) ? "Kitsu: no MAL mapping for " + imdbId
                        : "AniList: no idMal found (not an anime?)"));
                return segments;
            }
            logger.log((isKitsuId(imdbId) ? "Kitsu " + imdbId + ": idMal = " : "AniList: idMal = ") + malId);
            // AniSkip only returns submissions whose length is close to ours (right timing);
            // if no OP is returned at our length (e.g. only ED matched our length), retry with 0.
            JSONArray results = aniSkipResults(malId, episode, Math.max(0L, episodeLength), logger);
            parseAniSkipArray(results, segments, episodeLength, 0.0, logger);
            if (!hasSegmentType(segments, "OP") && episodeLength > 0) {
                logger.log("AniSkip: no OP for length " + episodeLength + "s, trying any length (0)");
                JSONArray fallback = aniSkipResults(malId, episode, 0L, logger);
                parseAniSkipArray(fallback, segments, episodeLength, ANISKIP_LENGTH_TOLERANCE_S, logger);
            }
            if (segments.isEmpty()) {
                logger.log("AniSkip: no usable segments for malId=" + malId + " ep=" + episode);
            }
        } catch (Exception error) {
            markSourceFailed();
            logger.log("ERROR AniSkip: " + error.getClass().getSimpleName() + ": " + safe(error.getMessage()));
        }
        return segments;
    }

    private static boolean isKitsuId(String id) {
        return id != null && id.startsWith("kitsu:");
    }

    /**
     * MAL id of a Kitsu anime entry ("kitsu:ID") from Kitsu's own mappings. Hits are cached for 60
     * days with the other id caches; a miss or a failure is never stored (a failure flags the source
     * for the retry). Returns 0 when Kitsu has no MAL mapping.
     */
    private static int kitsuMalId(android.content.Context ctx, String kitsuId, DebugLogger logger) throws Exception {
        String cached = IntroSkipPrefs.cachedImdb(ctx, kitsuId);
        if (cached.length() > 0) {
            logger.log("Kitsu: " + kitsuId + " -> MAL " + cached + " (cache)");
            return parseInt(cached);
        }
        String url = KITSU_MAPPINGS_URL + kitsuId.substring("kitsu:".length())
                + "/mappings?filter%5BexternalSite%5D=myanimelist%2Fanime&page%5Blimit%5D=5";
        JSONArray data = new JSONObject(request("GET", url, null, logger)).optJSONArray("data");
        for (int i = 0; data != null && i < data.length(); i++) {
            JSONObject attributes = data.optJSONObject(i) == null ? null : data.optJSONObject(i).optJSONObject("attributes");
            if (attributes == null || !"myanimelist/anime".equals(attributes.optString("externalSite"))) continue;
            int malId = parseInt(attributes.optString("externalId", ""));
            if (malId > 0) {
                IntroSkipPrefs.cacheImdb(ctx, kitsuId, String.valueOf(malId));
                return malId;
            }
        }
        return 0;
    }

    /** maxLengthDiff > 0: keep only submissions measured within that many seconds of our length. */
    private static void parseAniSkipArray(JSONArray results, List<Segment> segments,
                                          final long episodeLength, double maxLengthDiff, DebugLogger logger) {
        if (results == null || results.length() == 0) return;
        List<JSONObject> sorted = new ArrayList<>();
        for (int i = 0; i < results.length(); i++) {
            JSONObject item = results.optJSONObject(i);
            if (item != null) sorted.add(item);
        }
        Collections.sort(sorted, new java.util.Comparator<JSONObject>() {
            @Override
            public int compare(JSONObject a, JSONObject b) {
                double lenA = a.optDouble("episodeLength", 0.0);
                double lenB = b.optDouble("episodeLength", 0.0);
                double diffA = (episodeLength > 0 && lenA > 0) ? Math.abs(lenA - episodeLength) : Double.MAX_VALUE;
                double diffB = (episodeLength > 0 && lenB > 0) ? Math.abs(lenB - episodeLength) : Double.MAX_VALUE;
                return Double.compare(diffA, diffB);
            }
        });
        for (JSONObject result : sorted) {
            JSONObject interval = result.optJSONObject("interval");
            if (interval == null) continue;
            double start = interval.optDouble("startTime", -1.0);
            double end = interval.optDouble("endTime", -1.0);
            if (start < 0.0 || end <= start) continue;
            String type = result.optString("skipType", "").toLowerCase(Locale.US);
            String label;
            if ("op".equals(type) || type.startsWith("op") || "mixed-op".equals(type)) label = "OP";
            else if ("recap".equals(type)) label = "recap";
            else if ("ed".equals(type) || type.startsWith("ed") || "mixed-ed".equals(type)) label = "credits";
            else continue;
            double theirLength = result.optDouble("episodeLength", 0.0);
            if (maxLengthDiff > 0.0 && (theirLength <= 0.0 || Math.abs(theirLength - episodeLength) > maxLengthDiff)) {
                logger.log("AniSkip: discarded " + label + " measured on " + fmt3(theirLength) + "s (our length "
                        + episodeLength + "s, tolerance " + fmt3(maxLengthDiff) + " s)");
                continue;
            }
            if (hasUsableSegmentType(segments, label, episodeLength)
                    || overlapsBlocking(segments, new Segment(start, end, label, "AniSkip"))) continue;
            segments.add(new Segment(start, end, label, "AniSkip"));
            logger.log("Segment AniSkip: " + label + " " + fmt3(start) + "s -> " + fmt3(end)
                    + "s (measured on " + fmt3(theirLength) + "s, our length " + episodeLength + "s, diff "
                    + (episodeLength > 0 && theirLength > 0 ? fmt3(theirLength - episodeLength) + "s" : "?") + ")");
        }
    }

    private static JSONArray aniSkipResults(int malId, int episode, long episodeLength,
                                            DebugLogger logger) throws Exception {
        String endpoint = ANISKIP_URL + malId + "/" + episode +
                "?types=op&types=ed&types=recap&episodeLength=" + episodeLength;
        return new JSONObject(request("GET", endpoint, null, logger)).optJSONArray("results");
    }

    private static final Pattern CANDIDATE_SEASON = Pattern.compile(
            "(?i)(?:(\\d+)(?:st|nd|rd|th)\\s+season|season\\s*(\\d+)|(second|third|fourth|fifth)(?:\\s+season)?$"
            + "|\\s(ii|iii|iv)(?:\\b|$)|\\ss(\\d+)$|\\s(\\d+)$)");

    /**
     * AniList's single best match is not reliable ("Frieren: Beyond Journey's End" returns
     * the mini-anime ONA first), so score every candidate: title similarity, season marker,
     * format, and an episode count that must reach our episode.
     */
    private static int[] resolveMalId(String title, int season, int episode, int evidence,
                                      DebugLogger logger) throws Exception {
        title = stripYearRange(title);
        int wanted = season > 0 ? season : 1;
        String base = normTitle(title);
        List<String> searches = new ArrayList<>();
        String spaced = title.replaceAll(":(?=\\S)", ": ");
        searches.add(spaced);
        if (wanted > 1) {
            searches.add(spaced + " " + ordinalSeason(wanted) + " Season");
            searches.add(spaced + " Season " + wanted);
            if (wanted == 2) searches.add(spaced + " II");
            else if (wanted == 3) searches.add(spaced + " III");
            else if (wanted == 4) searches.add(spaced + " IV");
        }
        Set<Integer> seen = new HashSet<>();
        Map<Integer, JSONObject> byMal = new java.util.LinkedHashMap<Integer, JSONObject>();
        int bestId = 0;
        double bestScore = -9;
        double bestSim = 0;
        int bestSeason = 0;
        int bestEpisodes = 0;
        String bestFormat = "";
        boolean bestIsPart2 = false;
        int secondId = 0;
        double secondScore = -9;
        double secondSim = 0;
        int secondSeason = 0;
        int secondEpisodes = 0;
        int part1Episodes = 0;
        double part1Similarity = 0;
        StringBuilder report = new StringBuilder();
        for (String search : searches) {
            logger.log("AniList: search = " + search);
            JSONObject variables = new JSONObject().put("search", search);
            JSONObject body = new JSONObject()
                    .put("query", "query ($search: String) { Page(perPage: 10) { media(search: $search, type: ANIME) "
                            + "{ " + ANILIST_FIELDS + " } } }")
                    .put("variables", variables);
            JSONObject response = new JSONObject(request("POST", ANILIST_URL, body.toString(), logger));
            JSONObject data = response.optJSONObject("data");
            JSONObject page = data == null ? null : data.optJSONObject("Page");
            JSONArray media = page == null ? null : page.optJSONArray("media");
            if (media == null) continue;
            for (int i = 0; i < media.length(); i++) {
                JSONObject m = media.optJSONObject(i);
                int malId = m == null ? 0 : m.optInt("idMal", 0);
                if (malId <= 0 || !seen.add(malId)) continue;
                List<String> names = new ArrayList<>();
                JSONObject titles = m.optJSONObject("title");
                if (titles != null) {
                    for (String key : new String[]{"english", "romaji", "native"}) {
                        if (!titles.isNull(key)) names.add(titles.optString(key, ""));
                    }
                }
                JSONArray synonyms = m.optJSONArray("synonyms");
                for (int j = 0; synonyms != null && j < synonyms.length(); j++) names.add(synonyms.optString(j, ""));
                double similarity = 0;
                int candidateSeason = 1;
                for (String name : names) {
                    candidateSeason = Math.max(candidateSeason, seasonMarker(name, base));
                    String plain = plainTitle(name, base);
                    similarity = Math.max(similarity, dice(base, plain));
                }
                String format = m.optString("format", "");
                double score = similarity + (candidateSeason == wanted ? 0.3 : -0.5)
                        + ("TV".equals(format) ? 0.1 : "TV_SHORT".equals(format) || "ONA".equals(format) ? -0.05 : -0.3);
                int episodes = m.isNull("episodes") ? 0 : m.optInt("episodes", 0);
                if (episodes > 0 && episode > episodes) score -= 0.4;
                byMal.put(malId, m);
                report.append("\n  ").append(malId).append(' ').append(format).append(" season ").append(candidateSeason)
                        .append(" eps ").append(episodes).append(" sim ").append(fmt(similarity * 100)).append("% score ")
                        .append(fmt(score * 100)).append(' ').append(names.isEmpty() ? "" : names.get(0));
                boolean part2 = false;
                for (String name : names) part2 |= PART_TWO.matcher(name).find();
                // Split-cour shows: catalogs number cour 2 on from 13; AniSkip numbers it from 1.
                m.put("x_sim", similarity).put("x_season", candidateSeason).put("x_part2", part2);
                if (!part2 && candidateSeason == wanted && "TV".equals(format) && similarity > part1Similarity) {
                    part1Similarity = similarity;
                    part1Episodes = episodes;
                }
                if (score > bestScore) {
                    secondId = bestId; secondScore = bestScore; secondSim = bestSim;
                    secondSeason = bestSeason; secondEpisodes = bestEpisodes;
                    bestScore = score;
                    bestId = malId;
                    bestSim = similarity;
                    bestSeason = candidateSeason;
                    bestEpisodes = episodes;
                    bestFormat = format;
                    bestIsPart2 = part2;
                } else if (malId != bestId && score > secondScore) {
                    secondId = malId; secondScore = score; secondSim = similarity;
                    secondSeason = candidateSeason; secondEpisodes = episodes;
                }
            }
            if (bestScore >= 1.3) break; // exact title, right season, TV: no need for more searches
        }
        logger.log("AniList: candidates" + report + "\n  -> " + bestId + " (score " + fmt(bestScore * 100) + ")");
        boolean strict = evidence != EVIDENCE_ANIME;
        if (wanted > 1 && !(bestId > 0 && bestSeason == wanted && bestScore >= 0.6)) {
            // Named cours/arcs carry no season marker: walk the sequel chain from season 1.
            int[] target = sequelChain(byMal, wanted, episode, strict, base, logger);
            if (target != null) return target;
            if (bestSeason != wanted) {
                logger.log("AniList: no entry for season " + wanted + ", match refused");
                return new int[]{0, episode};
            }
        }
        if (bestScore < 0.6) return new int[]{0, episode};
        // A different series whose title matches better must not lose only on the format bonus.
        boolean bestHolds = bestEpisodes == 0 || episode <= bestEpisodes;
        boolean secondHolds = secondEpisodes == 0 || episode <= secondEpisodes;
        if (secondId > 0 && secondId != bestId && secondSeason == wanted && (!bestHolds || secondHolds)
                && ((secondSim > bestSim && bestScore - secondScore <= 0.4) || bestScore - secondScore <= 1e-9)) {
            logger.log("AniList: near-tie between " + bestId + " (score " + fmt(bestScore * 100) + ") and "
                    + secondId + " (score " + fmt(secondScore * 100) + "), match refused");
            return new int[]{0, episode};
        }
        if (strict && !(bestSim >= 0.85 && isMainFormat(bestFormat, true)
                && (bestEpisodes == 0 || episode <= bestEpisodes))) {
            logger.log("AniList: no anime evidence and the match is not strict enough (sim "
                    + fmt(bestSim * 100) + "%, " + bestFormat + "), match refused");
            return new int[]{0, episode};
        }
        if (bestIsPart2 && part1Episodes > 0 && episode > part1Episodes) {
            return new int[]{bestId, episode - part1Episodes};
        }
        return new int[]{bestId, episode};
    }

    private static final String ANILIST_FIELDS = "idMal format episodes startDate { year month day } "
            + "title { romaji english native } synonyms "
            + "relations { edges { relationType node { idMal format episodes startDate { year month day } "
            + "title { romaji english } } } }";

    private static boolean isMainFormat(String format, boolean allowShort) {
        return "TV".equals(format) || "ONA".equals(format) || (allowShort && "TV_SHORT".equals(format));
    }

    /** yyyymmdd of an AniList FuzzyDate, 99999999 when unknown (sorts last). */
    private static int aniDate(JSONObject date) {
        int year = date == null ? 0 : date.optInt("year", 0);
        if (year <= 0) return 99999999;
        return year * 10000 + date.optInt("month", 1) * 100 + date.optInt("day", 1);
    }

    /**
     * Season N of a franchise = N-1 SEQUEL hops from its season-1 TV/ONA entry (movies, specials
     * and OVAs are never seasons; several sequels: the earliest start date). The whole chain is
     * usually inside the search results already; a missing link costs one AniList query.
     * Returns {malId, episode} or null when the chain does not reach the wanted season.
     */
    private static int[] sequelChain(Map<Integer, JSONObject> byMal, int wanted, int episode, boolean strict, String base,
                                     DebugLogger logger) throws Exception {
        JSONObject root = null;
        for (JSONObject m : byMal.values()) {
            if (m.optInt("x_season", 0) != 1 || m.optBoolean("x_part2", false)
                    || !isMainFormat(m.optString("format", ""), false)) continue;
            double sim = m.optDouble("x_sim", 0);
            if (sim < (strict ? 0.85 : 0.6)) continue;
            if (root == null || sim > root.optDouble("x_sim", 0) + 1e-9
                    || (Math.abs(sim - root.optDouble("x_sim", 0)) <= 1e-9
                    && aniDate(m.optJSONObject("startDate")) < aniDate(root.optJSONObject("startDate")))) root = m;
        }
        if (root == null) return null;
        JSONObject current = root;
        int hop = 1;
        for (int guard = 0; hop < wanted && guard < 3 * wanted; guard++) {
            JSONObject next = null;
            JSONObject relations = current.optJSONObject("relations");
            JSONArray edges = relations == null ? null : relations.optJSONArray("edges");
            for (int i = 0; edges != null && i < edges.length(); i++) {
                JSONObject edge = edges.optJSONObject(i);
                JSONObject node = edge == null ? null : edge.optJSONObject("node");
                if (node == null || !"SEQUEL".equals(edge.optString("relationType"))
                        || node.optInt("idMal", 0) <= 0 || !isMainFormat(node.optString("format", ""), false)) continue;
                if (next == null || aniDate(node.optJSONObject("startDate")) < aniDate(next.optJSONObject("startDate"))) {
                    next = node;
                }
            }
            if (next == null) return null;
            int nextMal = next.optInt("idMal", 0);
            JSONObject full = byMal.get(nextMal);
            // "Part 2" / "2nd cour" is the second half of a season, not the next season: walk through it.
            JSONObject nextTitle = next.optJSONObject("title");
            boolean partTwo = nextTitle != null && (PART_TWO.matcher(nextTitle.optString("romaji", "")).find()
                    || PART_TWO.matcher(nextTitle.optString("english", "")).find());
            // A sequel of a different show (next-generation spin-off) is not the next season.
            double hopSim = Math.max(full != null && full.has("x_sim") ? full.optDouble("x_sim", 0) : 0, hopSimilarity(base, next));
            if (!partTwo && hopSim < (strict ? 0.85 : 0.5)) {
                logger.log("AniList: sequel chain hop -> " + nextMal + " title mismatch (sim "
                        + fmt(hopSim * 100) + "%), chain refused");
                return null;
            }
            if (full == null && (hop < wanted - 1 || partTwo)) {
                JSONObject body = new JSONObject()
                        .put("query", "query ($id: Int) { Media(idMal: $id, type: ANIME) { " + ANILIST_FIELDS + " } }")
                        .put("variables", new JSONObject().put("id", nextMal));
                JSONObject data = new JSONObject(request("POST", ANILIST_URL, body.toString(), logger))
                        .optJSONObject("data");
                full = data == null ? null : data.optJSONObject("Media");
                if (full == null) return null;
            }
            logger.log("AniList: sequel chain hop " + hop + " -> " + nextMal + " " + next.optString("format", "")
                    + " eps " + next.optInt("episodes", 0));
            if (hop == wanted - 1 && !partTwo) {
                int episodes = next.isNull("episodes") ? 0 : next.optInt("episodes", 0);
                if (episodes > 0 && episode > episodes) return null;
                logger.log("AniList: sequel chain S1 -> S" + wanted + " = " + nextMal);
                return new int[]{nextMal, episode};
            }
            current = full;
            if (!partTwo) hop++;
        }
        return null;
    }

    private static final Pattern PART_TWO = Pattern.compile("(?i)(?:part|cour)\\s*(?:2|ii)\\b|2nd\\s+cour");

    private static int seasonMarker(String name, String base) {
        String trimmed = name.trim();
        Matcher matcher = CANDIDATE_SEASON.matcher(trimmed);
        if (!matcher.find()) return 1;
        if (matcher.group(1) != null) return parseInt(matcher.group(1));
        if (matcher.group(2) != null) return parseInt(matcher.group(2));
        int bare = bareSeason(matcher, trimmed, base);
        if (bare >= 0) return bare;
        String word = (matcher.group(3) != null ? matcher.group(3) : matcher.group(4)).toLowerCase(Locale.US);
        switch (word) {
            case "second": case "ii": return 2;
            case "third": case "iii": return 3;
            case "fourth": case "iv": return 4;
            default: return 5;
        }
    }

    /** Trailing "2"/"S2" is a season only when what precedes it is the searched title itself; -1 = no bare match. */
    private static int bareSeason(Matcher matcher, String trimmed, String base) {
        String digits = matcher.group(5) != null ? matcher.group(5) : matcher.group(6);
        if (digits == null) return -1;
        int season = parseInt(digits);
        return season >= 2 && season < 20 && normTitle(trimmed.substring(0, matcher.start())).equals(base) ? season : 1;
    }

    /** Title with season markers removed; an invalid bare trailing number ("Mob Psycho 100") stays. */
    private static String plainTitle(String name, String base) {
        String trimmed = name.trim();
        Matcher matcher = CANDIDATE_SEASON.matcher(trimmed);
        StringBuffer stripped = new StringBuffer();
        while (matcher.find()) {
            if (bareSeason(matcher, trimmed, base) == 1) continue;
            matcher.appendReplacement(stripped, " ");
        }
        matcher.appendTail(stripped);
        return normTitle(stripped.toString());
    }

    /** Season-stripped title similarity of a sequel node; single-word titles also get a character pass. */
    private static double hopSimilarity(String base, JSONObject node) {
        JSONObject title = node == null ? null : node.optJSONObject("title");
        double best = 0;
        for (String key : new String[]{"romaji", "english"}) {
            String name = title == null ? "" : title.optString(key, "");
            if (name.length() == 0) continue;
            String plain = plainTitle(name, base);
            best = Math.max(best, dice(base, plain));
            if (base.indexOf(' ') < 0 && plain.indexOf(' ') < 0) best = Math.max(best, charDice(base, plain));
        }
        return best;
    }

    /** Dice coefficient on character bigrams; for one-word titles word dice can only be 0 or 1. */
    private static double charDice(String a, String b) {
        if (a.length() < 2 || b.length() < 2) return 0;
        Set<String> left = new HashSet<>(), right = new HashSet<>();
        for (int i = 0; i + 1 < a.length(); i++) left.add(a.substring(i, i + 2));
        for (int i = 0; i + 1 < b.length(); i++) right.add(b.substring(i, i + 2));
        int common = 0;
        for (String pair : left) if (right.contains(pair)) common++;
        return 2.0 * common / (left.size() + right.size());
    }

    /** Drops a trailing year range from a title before it is searched; returns the input if nothing else is left. */
    static String stripYearRange(String value) {
        String text = value == null ? "" : value.trim();
        try {
            String stripped = TRAILING_YEAR_RANGE.matcher(text).replaceFirst("").trim();
            return stripped.length() > 0 ? stripped : text;
        } catch (Throwable ignored) {
            return text;
        }
    }

    private static String normTitle(String value) {
        String result = safe(value).toLowerCase(Locale.US).replace("’", "").replace("'", "");
        return result.replaceAll("[^\\p{L}\\p{N}]+", " ").trim();
    }

    /** Dice coefficient on word sets; 1.0 = same words. */
    private static double dice(String a, String b) {
        if (a.length() == 0 || b.length() == 0) return 0;
        if (a.equals(b)) return 1;
        Set<String> left = new HashSet<>(java.util.Arrays.asList(a.split(" ")));
        Set<String> right = new HashSet<>(java.util.Arrays.asList(b.split(" ")));
        int common = 0;
        for (String word : left) if (right.contains(word)) common++;
        return 2.0 * common / (left.size() + right.size());
    }

    /**
     * IntroDB for shows and movies. Lookup order for non-anime:
     * (a) an IMDb id from the stream/metadata, as before;
     * (b) else a keyless Cinemeta search by the cleaned show title (series catalog
     * for episodes, movie catalog for movies), exact normalized name match only;
     * (c) then TheIntroDB with that id + season/episode (+ duration_ms when known),
     * retrying a miss by tvdb_id and then tmdb_id (ids from a keyless Cinemeta
     * meta lookup, cached per show);
     * (d) then IntroDB.app for missing segment types (a real mid-episode OP
     * replaces a 0.0s TheIntroDB OP and evicts overlapping mislabeled
     * "credits"; an early "credits" with no OP anywhere is promoted).
     * Runs on a NETWORK thread, never on the main thread, and never blocks AniSkip
     * (separate thread) or chapter skipping.
     */
    // ------------------------------------------------------------ IntroDB chain (staged)

    private interface IntroSink {
        void partial(List<Segment> snapshot);
    }

    /** Starts the clock of the source running on this thread (own budget, own failure flag). */
    private static void beginSource(long budgetMs) {
        DEADLINE_MS.set(SystemClock.uptimeMillis() + budgetMs);
        SOURCE_FAILED.set(new boolean[1]);
    }

    private static void endSource() {
        DEADLINE_MS.remove();
        SOURCE_FAILED.remove();
    }

    /** The source on this thread FAILED (not "no data"): the caller will refetch it. */
    private static void markSourceFailed() {
        boolean[] flag = SOURCE_FAILED.get();
        if (flag != null) flag[0] = true;
    }

    private static boolean sourceFailed() {
        boolean[] flag = SOURCE_FAILED.get();
        return flag != null && flag[0];
    }

    private static void clearSourceFailed() {
        boolean[] flag = SOURCE_FAILED.get();
        if (flag != null) flag[0] = false;
    }

    /**
     * Cinemeta -> TheIntroDB -> IntroDB.app -> SkipDB for one episode, one stage at a time.
     * Every stage has its own budget (the chain total is capped), reports "failed" apart
     * from "no data", and publishes a cumulative snapshot as soon as it finishes. A refetch
     * runs only the failed stages; results of stages that succeeded are kept.
     */
    private static final class IntroChain {
        static final String CINEMETA = "Cinemeta";
        static final String THEINTRODB = "TheIntroDB";
        static final String APP = "IntroDB.app";
        static final String SKIPDB = "SkipDB";
        private final android.content.Context ctx;
        private final String title;
        private final int season;
        private final int episode;
        private final long episodeLength;
        private final long ownRuntimeMs;
        private String id;
        private List<Segment> ownList;
        private List<Segment> theIntroList;
        private List<Segment> appList;
        private List<Segment> skipList;
        private List<Segment> result = new ArrayList<Segment>();

        IntroChain(android.content.Context ctx, String imdbId, String title, int season, int episode,
                   long episodeLength) {
            this(ctx, imdbId, title, season, episode, episodeLength, episodeLength * 1000L);
        }

        IntroChain(android.content.Context ctx, String imdbId, String title, int season, int episode,
                   long episodeLength, long runtimeMs) {
            this.ctx = ctx;
            this.id = safe(imdbId);
            this.title = safe(title);
            this.season = season;
            this.episode = episode;
            this.episodeLength = episodeLength;
            this.ownRuntimeMs = runtimeMs;
        }

        List<Segment> result() {
            return result;
        }

        private static boolean beginStage(long stageMs, long chainEnd) {
            long remaining = chainEnd - SystemClock.uptimeMillis();
            if (remaining <= 0) return false;
            beginSource(Math.min(stageMs, remaining));
            return true;
        }

        /** Runs the stages named in {@code only} (everything when null); returns the failed ones. */
        Set<String> run(Set<String> only, IntroSink sink, DebugLogger logger) {
            Set<String> failed = new java.util.LinkedHashSet<String>();
            // A failed title lookup blocks every later stage, so refetching it refetches all.
            boolean all = only == null || only.contains(CINEMETA);
            long chainEnd = SystemClock.uptimeMillis() + CHAIN_BUDGET_MS;
            boolean isMovie = false; // movies never reach the lookups (Session.resolveKind)
            if (season <= 0 || episode <= 0) {
                logger.log("IntroDB skipped: no season/episode (S" + season + "E" + episode + ")");
                return failed;
            }
            if (id.length() == 0 && title.length() > 0 && all) {
                if (beginStage(CINEMETA_BUDGET_MS, chainEnd)) {
                    try {
                        id = cinemetaImdbId(ctx, title, isMovie, logger);
                        if (id.length() == 0 && sourceFailed()) failed.add(CINEMETA);
                    } finally {
                        endSource();
                    }
                } else {
                    failed.add(CINEMETA);
                }
            }
            if (failed.contains(CINEMETA)) {
                logger.log("IntroDB: title lookup failed, later stages wait for the refetch");
                return failed;
            }
            if (id.length() == 0) {
                logger.log("IntroDB skipped: no IMDb id found");
                return failed;
            }
            logger.log("IntroDB: imdb = " + id);
            if (ownList == null && isImdbId(id)) {
                if (beginStage(OWN_TIMES_BUDGET_MS, chainEnd)) {
                    try {
                        ownList = fetchOwnSegments(logger);
                    } finally {
                        endSource();
                    }
                } else {
                    ownList = new ArrayList<Segment>();
                }
                sink.partial(assemble(QUIET));
            }
            if (all || only.contains(THEINTRODB)) {
                if (beginStage(THEINTRODB_BUDGET_MS, chainEnd)) {
                    try {
                        String tvdbId = "";
                        String tmdbId = "";
                        boolean idsFailed = false;
                        if (isImdbId(id)) {
                            String[] ids = cinemetaIds(ctx, id, isMovie, logger);
                            tvdbId = ids[0];
                            tmdbId = ids[1];
                            idsFailed = sourceFailed();
                            clearSourceFailed();
                        }
                        JSONObject response = theIntroDbQuery(id, tvdbId, tmdbId, season, episode, episodeLength,
                                logger);
                        List<Segment> parsed = parseTheIntroDb(response, logger);
                        theIntroList = parsed;
                        // The imdb query answered; a missing tvdb/tmdb fallback only matters without data.
                        if (idsFailed && parsed.isEmpty()) failed.add(THEINTRODB);
                    } catch (Exception error) {
                        logger.log("ERROR IntroDB: " + error.getClass().getSimpleName() + ": "
                                + safe(error.getMessage()));
                        failed.add(THEINTRODB);
                    } finally {
                        endSource();
                    }
                } else {
                    failed.add(THEINTRODB);
                }
                sink.partial(assemble(QUIET));
            }
            boolean keyed = isImdbId(id) && season > 0 && episode > 0;
            if (keyed && (all || only.contains(APP))) {
                if (beginStage(INTRODB_APP_BUDGET_MS, chainEnd)) {
                    try {
                        List<Segment> got = fetchIntroDbApp(id, season, episode, logger);
                        if (sourceFailed()) failed.add(APP);
                        else appList = got;
                    } finally {
                        endSource();
                    }
                } else {
                    failed.add(APP);
                }
                sink.partial(assemble(QUIET));
            }
            // SkipDB always runs on a full run: it also narrows earlier windows
            // (partials already applied above, so no viewer wait is added).
            if (keyed && (all || only.contains(SKIPDB))) {
                if (beginStage(SKIPDB_BUDGET_MS, chainEnd)) {
                    try {
                        List<Segment> got = fetchSkipDb(id, season, episode, episodeLength, logger);
                        if (sourceFailed()) failed.add(SKIPDB);
                        else skipList = got;
                    } finally {
                        endSource();
                    }
                } else {
                    failed.add(SKIPDB);
                }
            }
            result = assemble(logger);
            return failed;
        }

        /** Own times for this episode (empty when no entry matches this runtime); never a failure. */
        private List<Segment> fetchOwnSegments(DebugLogger logger) {
            List<Segment> out = new ArrayList<Segment>();
            try {
                long runtimeMs = ownRuntimeMs > 0 ? ownRuntimeMs : episodeLength * 1000L;
                List<OwnTimes.Entry> entries = OwnTimes.forEpisode(OWN_FETCHER, id, season, episode,
                        runtimeMs, System.currentTimeMillis());
                for (OwnTimes.Entry e : entries) {
                    out.add(new Segment(e.startMs / 1000.0, e.endMs / 1000.0, e.label, OwnTimes.SOURCE));
                    logger.log("Segment Own times: " + e.label + " " + fmt3(e.startMs / 1000.0) + "s -> "
                            + fmt3(e.endMs / 1000.0) + "s (file length " + e.fileMs + "ms, runtime "
                            + runtimeMs + "ms)");
                }
            } catch (Throwable ignored) {
                // No usable own times: the online sources work exactly as before.
            }
            return out;
        }

        /** Narrows cur by every raw window that agrees with orig (the un-narrowed first source) within 15 s. */
        private Segment narrowFrom(Segment cur, Segment orig, List<Segment> raws, DebugLogger logger) {
            if (raws == null) return cur;
            for (Segment raw : raws) {
                if (raw == orig || !raw.label.equals(orig.label)) continue;
                Segment probe = innerBounds(orig, raw, episodeLength, logger);
                if (probe != null) {
                    double[] folded = InnerBounds.combine(cur.startSeconds, cur.endSeconds,
                            probe.startSeconds, probe.endSeconds);
                    if (folded != null) {
                        cur = new Segment(folded[0], folded[1], orig.label,
                                cur == orig ? probe.source : cur.source + "+" + safe(raw.source));
                    }
                }
            }
            return cur;
        }

        private List<Segment> assemble(DebugLogger logger) {
            return assemble(logger, true);
        }

        /** TheIntroDB first, then IntroDB.app, then SkipDB fill what is still missing. */
        private List<Segment> assemble(DebugLogger logger, boolean withSkipDb) {
            List<Segment> out = new ArrayList<Segment>();
            if (ownList != null) out.addAll(ownList);
            if (theIntroList != null) {
                for (Segment s : theIntroList) {
                    if (ownList != null && hasSegmentType(ownList, s.label)
                            && !(s.isCredits() && episodeLength > 0 && s.startSeconds < episodeLength * 0.40)) {
                        logger.log("Own times: replacing " + s.label + " from " + s.source
                                + " (" + s.startSeconds + "s -> " + s.endSeconds + "s)");
                        continue;
                    }
                    out.add(s);
                }
            }
            // IntroDB.app fills missing segment types and replaces a 0.0s TheIntroDB OP when
            // IntroDB.app has a mid-episode OP (startSeconds > 5.0s); overlapping early credits
            // are evicted by positionalSanity() in combine().
            if (appList != null) {
                for (Segment app : appList) {
                    if (app.isPostCredits()) {
                        // Protected scene marker, never a skippable type: kept once, extracted in combine().
                        if (!hasSegmentType(out, app.label)) {
                            out.add(app);
                            logger.log("Segment IntroDB.app: post_credits " + app.startSeconds
                                    + "s -> " + app.endSeconds + "s (protected, not skippable)");
                        }
                        continue;
                    }
                    if ("OP".equals(app.label)) {
                        for (int i = out.size() - 1; i >= 0; i--) {
                            Segment existing = out.get(i);
                            if ("OP".equals(existing.label) && existing.startSeconds <= 0.5 && app.startSeconds > 5.0
                                    && !OwnTimes.isOwn(existing.source)
                                    && !InnerBounds.zeroConflict(existing.startSeconds, existing.endSeconds,
                                            existing.source, app.startSeconds, app.endSeconds, app.source)) {
                                logger.log("IntroDB.app: replacing 0:00 IntroDB OP with mid-episode OP "
                                        + app.startSeconds + "s -> " + app.endSeconds + "s");
                                out.remove(i);
                            }
                        }
                    }
                    if (hasUsableSegmentType(out, app.label, episodeLength)) {
                        logger.log("IntroDB.app: skipped " + app.label + ", TheIntroDB already has it");
                        continue;
                    }
                    if (overlapsBlocking(out, app)) {
                        logger.log("IntroDB.app: duplicate skipped (" + app.label + " " + app.startSeconds + "s)");
                        continue;
                    }
                    out.add(app);
                    logger.log("Segment IntroDB.app: " + app.label + " " + app.startSeconds
                            + "s -> " + app.endSeconds + "s");
                }
            }
            if (withSkipDb && skipList != null) {
                for (Segment s : skipList) {
                    if ("OP".equals(s.label)) {
                        for (int i = out.size() - 1; i >= 0; i--) {
                            Segment existing = out.get(i);
                            if ("OP".equals(existing.label) && existing.startSeconds <= 0.5 && s.startSeconds > 5.0
                                    && !InnerBounds.zeroConflict(existing.startSeconds, existing.endSeconds,
                                            existing.source, s.startSeconds, s.endSeconds, s.source)) {
                                logger.log("SkipDB: replacing 0:00 IntroDB OP with mid-episode OP "
                                        + s.startSeconds + "s -> " + s.endSeconds + "s");
                                out.remove(i);
                            }
                        }
                    }
                    if (hasUsableSegmentType(out, s.label, episodeLength)) {
                        logger.log("SkipDB: skipped " + s.label + ", already have it");
                        continue;
                    }
                    if (overlapsBlocking(out, s)) {
                        logger.log("SkipDB: duplicate skipped (" + s.label + " " + s.startSeconds + "s)");
                        continue;
                    }
                    out.add(s);
                    logger.log("Segment SkipDB: " + s.label + " " + s.startSeconds + "s -> " + s.endSeconds + "s");
                }
            }
            // If TheIntroDB is the only source with data and mislabeled an opening sequence in the
            // first 40% of the episode as "credits" with no separate OP anywhere, promote it to OP.
            if (!hasUsableSegmentType(out, "OP", episodeLength)) {
                double maxIntroStart = episodeLength > 0 ? episodeLength * 0.40 : 300.0;
                for (int i = 0; i < out.size(); i++) {
                    Segment s = out.get(i);
                    if ("credits".equals(s.label) && !s.toEnd && s.startSeconds < maxIntroStart
                            && (episodeLength <= 0 || s.endSeconds < episodeLength * 0.5)) {
                        out.set(i, new Segment(s.startSeconds, s.endSeconds, "OP", s.source));
                        logger.log("IntroDB: promoted early credits (" + s.startSeconds + "s -> "
                                + s.endSeconds + "s) to OP");
                        break;
                    }
                }
            }
            // Inner bounds, last, so fill/replace/promotion above keep raw inputs.
            for (int i = 0; i < out.size(); i++) {
                Segment orig = out.get(i);
                Segment cur = narrowFrom(orig, orig, theIntroList, logger);
                cur = narrowFrom(cur, orig, appList, logger);
                if (withSkipDb) cur = narrowFrom(cur, orig, skipList, logger);
                if (!cur.buttonOnly && ("OP".equals(orig.label) || orig.isRecap())) {
                    Segment hit = orig.zeroConflictIn(theIntroList);
                    if (hit == null) hit = orig.zeroConflictIn(appList);
                    if (hit == null && withSkipDb) hit = orig.zeroConflictIn(skipList);
                    if (hit != null) {
                        cur = cur.buttonOnlyCopy();
                        logger.log("Zero-start " + orig.label + " button only: [" + orig.source + "] "
                                + orig.startSeconds + "-" + orig.endSeconds + "s vs [" + hit.source + "] "
                                + hit.startSeconds + "-" + hit.endSeconds + "s");
                    }
                }
                if (cur != orig) out.set(i, cur);
            }
            return out;
        }
    }

    /** TheIntroDB answer -> segments (intro, recap, credits, preview). */
    private static List<Segment> parseTheIntroDb(JSONObject response, DebugLogger logger) {
        List<Segment> out = new ArrayList<Segment>();
        // details=true adds this plus per-item confidence/submission_count (ignored): the
        // duration of the cut the timings were measured on, checked again in resolveToEnd().
        double groupDuration = 0.0;
        if (response != null && !response.isNull("group_duration_ms")) {
            long groupMs = response.optLong("group_duration_ms", -1L);
            if (groupMs > 0) groupDuration = groupMs / 1000.0;
        }
        String[] kinds = new String[]{"intro", "recap", "credits", "preview"};
        for (String kind : kinds) {
            JSONArray items = response.optJSONArray(kind);
            if (items == null) continue;
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.optJSONObject(i);
                if (item == null) continue;
                // Reject incomplete intro/recap entries with start_ms: null so TheIntroDB never
                // fabricates a 0.0s phantom intro or blocks IntroDB.app's real mid-episode intro.
                // Credits with an unknown start are ignored too (0..end would skip the whole episode).
                if (item.isNull("start_ms") && ("intro".equals(kind) || "recap".equals(kind)
                        || "credits".equals(kind))) {
                    logger.log("IntroDB: skipped " + kind + " with null start_ms (end_ms="
                            + item.optLong("end_ms", -1L) + ")");
                    continue;
                }
                double start = item.isNull("start_ms") ? 0.0 : item.optLong("start_ms", -1L) / 1000.0;
                if ("recap".equals(kind) && start <= 0.5) {
                    // Real "previously on" recaps start at 0:00; the phantom is an entry with no
                    // usable length (0 ms, a blip, or the whole cold open).
                    double recapLength = item.isNull("end_ms") ? -1.0 : item.optLong("end_ms", -1L) / 1000.0 - start;
                    if (recapLength < RECAP_ZERO_MIN_S || recapLength > RECAP_ZERO_MAX_S) {
                        logger.log("IntroDB: skipped 0:00 recap (" + start + "s -> "
                                + (item.optLong("end_ms", -1L) / 1000.0) + "s, length not " + (int) RECAP_ZERO_MIN_S
                                + "-" + (int) RECAP_ZERO_MAX_S + " s)");
                        continue;
                    }
                }
                double end;
                if (item.isNull("end_ms")) {
                    end = -1.0;
                } else {
                    end = item.optLong("end_ms", -1L) / 1000.0;
                }
                // Credits/previews that run to the end of the episode arrive with a real start
                // and no end: keep them as to-end (end -1) for resolveToEnd() in combine(). A
                // null or 0 start is not a real start, and intro/recap with no end stay dropped.
                boolean toEnd = item.isNull("end_ms") && !item.isNull("start_ms") && start > 0.0
                        && ("credits".equals(kind) || "preview".equals(kind));
                // Duration sanity is unified in positionalSanity(); keep everything orderable here.
                if (start < 0.0 || (!toEnd && end <= start)) continue;
                String label;
                if ("intro".equals(kind)) label = "OP";
                else if ("recap".equals(kind)) label = "recap";
                else if ("credits".equals(kind)) label = "credits";
                else label = "preview";
                Segment segment = toEnd
                        ? new Segment(start, end, label, "IntroDB", true, groupDuration)
                        : new Segment(start, end, label, "IntroDB");
                if (overlapsBlocking(out, segment)) {
                    logger.log("IntroDB: duplicate skipped (" + kind + " " + start + "s)");
                    continue;
                }
                out.add(segment);
                if (toEnd) {
                    logger.log("Segment IntroDB: " + kind + " " + start + "s -> end (to-end, group duration "
                            + (groupDuration > 0 ? groupDuration + "s" : "unknown") + ")");
                } else {
                    logger.log("Segment IntroDB: " + kind + " " + start + "s -> " + end + "s");
                }
            }
        }
        return out;
    }

    private static boolean isImdbId(String id) {
        return id != null && id.regionMatches(true, 0, "tt", 0, 2);
    }

    private static boolean hasSegmentType(List<Segment> segments, String label) {
        for (Segment segment : segments) {
            if (segment.label.equals(label)) return true;
        }
        return false;
    }

    /**
     * TheIntroDB with multi-identity fallback: imdb_id first, then tvdb_id, then
     * tmdb_id. A query counts as a miss when it answers 204/404, carries an error,
     * or holds no segment of any kind; duration_ms is sent whenever it is known.
     */
    private static JSONObject theIntroDbQuery(String imdbId, String tvdbId, String tmdbId,
                                              int season, int episode, long episodeLength,
                                              DebugLogger logger) throws Exception {
        StringBuilder suffix = new StringBuilder();
        suffix.append("&details=true"); // group_duration_ms + per-item confidence/submission_count
        if (season > 0 && episode > 0) {
            suffix.append("&season=").append(season).append("&episode=").append(episode);
        }
        if (episodeLength > 0) suffix.append("&duration_ms=").append(episodeLength * 1000L);
        String[][] identities = new String[][]{
            {"imdb_id", safe(imdbId)}, {"tvdb_id", safe(tvdbId)}, {"tmdb_id", safe(tmdbId)}};
        JSONObject last = null;
        for (int i = 0; i < identities.length; i++) {
            String name = identities[i][0];
            String value = identities[i][1];
            if (value.length() == 0) continue;
            String url = INTRODB_URL + "?" + name + "=" + value + suffix;
            logger.log("IntroDB: lookup by " + name + " = " + value);
            JSONObject response = new JSONObject(request("GET", url, null, logger));
            if (hasAnySegment(response)) return response;
            logger.log("IntroDB: no segments for " + name + " = " + value + ", trying next identity");
            last = response;
        }
        return last == null ? new JSONObject() : last;
    }

    private static boolean hasAnySegment(JSONObject response) {
        if (response == null) return false;
        if (response.has("error")) return false;
        String[] kinds = new String[]{"intro", "recap", "credits", "preview"};
        for (int i = 0; i < kinds.length; i++) {
            JSONArray items = response.optJSONArray(kinds[i]);
            if (items != null && items.length() > 0) return true;
        }
        return false;
    }

    /**
     * Keyless tvdb/tmdb ids for the multi-identity IntroDB lookup: the Cinemeta
     * meta document for the show carries tvdb_id and moviedb_id (the TMDB id).
     * Cached in memory and in SharedPreferences for 60 days, like the title cache.
     */
    private static String[] cinemetaIds(android.content.Context ctx, String imdbId, boolean isMovie,
                                        DebugLogger logger) {
        String[] empty = new String[]{"", ""};
        String wanted = safe(imdbId);
        if (wanted.length() == 0) return empty;
        String tvdbKey = "ids-tvdb:" + wanted;
        String tmdbKey = "ids-tmdb:" + wanted;
        String[] cached = cachedIds(ctx, tvdbKey, tmdbKey, wanted, logger);
        if (cached != null) return cached;
        // One request per show: the two lookup threads can arrive together.
        synchronized (CINEMETA_LOCK) {
            cached = cachedIds(ctx, tvdbKey, tmdbKey, wanted, logger);
            if (cached != null) return cached;
            return cinemetaIdsRequest(ctx, tvdbKey, tmdbKey, wanted, isMovie, logger);
        }
    }

    /** Session cache (hits and misses), then the stored 60-day hit cache; null = not cached. */
    private static String[] cachedIds(android.content.Context ctx, String tvdbKey, String tmdbKey,
                                      String wanted, DebugLogger logger) {
        String tvdb = CINEMETA_IDS_CACHE.get(tvdbKey);
        String tmdb = CINEMETA_IDS_CACHE.get(tmdbKey);
        if (tvdb != null && tmdb != null) {
            logger.log("Cinemeta: ids cache hit for \"" + wanted + "\" -> tvdb=" + showId(tvdb)
                    + " tmdb=" + showId(tmdb));
            return new String[]{tvdb, tmdb};
        }
        String storedTvdb = IntroSkipPrefs.cachedImdb(ctx, tvdbKey);
        String storedTmdb = IntroSkipPrefs.cachedImdb(ctx, tmdbKey);
        if (storedTvdb.length() > 0 || storedTmdb.length() > 0) {
            CINEMETA_IDS_CACHE.put(tvdbKey, storedTvdb);
            CINEMETA_IDS_CACHE.put(tmdbKey, storedTmdb);
            logger.log("Cinemeta: ids cache hit (stored) for \"" + wanted + "\" -> tvdb=" + showId(storedTvdb)
                    + " tmdb=" + showId(storedTmdb));
            return new String[]{storedTvdb, storedTmdb};
        }
        SoftEntry soft = getSoft(tvdbKey);
        if (soft != null) {
            logger.log("Cinemeta: ids soft cache hit for \"" + wanted + "\" -> <none>");
            return new String[]{"", ""};
        }
        return null;
    }

    private static String showId(String id) {
        return id == null || id.length() == 0 ? "<none>" : id;
    }

    private static String[] cinemetaIdsRequest(android.content.Context ctx, String tvdbKey, String tmdbKey,
                                               String wanted, boolean isMovie, DebugLogger logger) {
        String[] empty = new String[]{"", ""};
        String base = isMovie ? CINEMETA_META_MOVIE_URL : CINEMETA_META_SERIES_URL;
        try {
            JSONObject response = new JSONObject(request("GET", base + wanted + ".json", null, logger));
            JSONObject meta = response.optJSONObject("meta");
            if (meta == null) {
                logger.log("Cinemeta: no meta for \"" + wanted + "\"");
                putSoft(tvdbKey, "");
                return empty;
            }
            String tvdb = idText(meta, "tvdb_id");
            String tmdb = idText(meta, "moviedb_id");
            if (tmdb.length() == 0) tmdb = idText(meta, "tmdb_id");
            logger.log("Cinemeta: ids for \"" + wanted + "\" -> tvdb=" + showId(tvdb)
                    + " tmdb=" + showId(tmdb));
            if (tvdb.length() == 0 && tmdb.length() == 0) {
                putSoft(tvdbKey, ""); // an empty answer is retried after a few minutes, not for the session
                return empty;
            }
            CINEMETA_IDS_CACHE.put(tvdbKey, tvdb);
            CINEMETA_IDS_CACHE.put(tmdbKey, tmdb);
            if (tvdb.length() > 0) IntroSkipPrefs.cacheImdb(ctx, tvdbKey, tvdb);
            if (tmdb.length() > 0) IntroSkipPrefs.cacheImdb(ctx, tmdbKey, tmdb);
            return new String[]{tvdb, tmdb};
        } catch (Exception error) {
            markSourceFailed();
            logger.log("ERROR Cinemeta ids: " + error.getClass().getSimpleName() + ": " + safe(error.getMessage()));
            return empty;
        }
    }

    private static String idText(JSONObject meta, String key) {
        try {
            if (meta.isNull(key)) return "";
            Object value = meta.opt(key);
            if (value instanceof Number) {
                long number = ((Number) value).longValue();
                return number > 0 ? String.valueOf(number) : "";
            }
            String text = safe(String.valueOf(value));
            return text.matches("\\d+") ? text : "";
        } catch (Exception ignored) {
            return "";
        }
    }

    /**
     * Keyless extra source, no key needed: GET /segments?imdb_id=&season=&episode
     * answers {"intro": {"start_ms","end_ms",...}, "recap": {...}, "outro": {...},
     * "post_credits": {...}} with null for unknown types. Mapping: intro to OP,
     * recap to recap, outro/credits to credits. post_credits is parsed as a protected
     * marker (label "post_credits"), never as a skippable segment: combine() extracts
     * it, clips credits/previews at its start and keeps the Next pill out of it.
     */
    private static List<Segment> fetchIntroDbApp(String imdbId, int season, int episode,
                                                 DebugLogger logger) {
        List<Segment> out = new ArrayList<Segment>();
        try {
            String url = INTRODB_APP_URL + "?imdb_id=" + imdbId + "&season=" + season + "&episode=" + episode;
            JSONObject response = new JSONObject(request("GET", url, null, logger));
            addAppSegment(out, response, "intro", "OP", logger);
            addAppSegment(out, response, "recap", "recap", logger);
            addAppSegment(out, response, "outro", "credits", logger);
            addAppSegment(out, response, "credits", "credits", logger);
            addAppSegment(out, response, "post_credits", "post_credits", logger);
        } catch (Exception error) {
            markSourceFailed();
            logger.log("ERROR IntroDB.app: " + error.getClass().getSimpleName() + ": " + safe(error.getMessage()));
        }
        return out;
    }

    private static void addAppSegment(List<Segment> out, JSONObject response, String key, String label,
                                      DebugLogger logger) {
        try {
            if (hasSegmentType(out, label)) return;
            JSONObject item = response.optJSONObject(key);
            if (item == null) return;
            double start;
            double end;
            if (!item.isNull("start_ms")) {
                start = item.optLong("start_ms", -1L) / 1000.0;
            } else if (!item.isNull("start_sec")) {
                start = item.optDouble("start_sec", -1.0);
            } else {
                return;
            }
            if (!item.isNull("end_ms")) {
                end = item.optLong("end_ms", -1L) / 1000.0;
            } else if (!item.isNull("end_sec")) {
                end = item.optDouble("end_sec", -1.0);
            } else {
                return;
            }
            if (start < 0.0 || end <= start) return;
            out.add(new Segment(start, end, label, "IntroDB.app"));
        } catch (Exception error) {
            logger.log("ERROR IntroDB.app (" + key + "): " + error.getClass().getSimpleName());
        }
    }

    private static final OwnTimes.Fetcher OWN_FETCHER = new OwnTimes.Fetcher() {
        @Override
        public String get(String imdbId) {
            return fetchOwnBody(imdbId);
        }
    };

    /** One plain GET for a show's own-times file: 2.5 s timeouts, no retry; "" on any failure. */
    private static String fetchOwnBody(String imdbId) {
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(OwnTimes.BASE_URL + imdbId + ".json").openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(2500);
            connection.setReadTimeout(2500);
            connection.setRequestProperty("Accept", "application/json");
            connection.setRequestProperty("User-Agent", "Stremio");
            int code = connection.getResponseCode();
            if (code == 404) return "";
            if (code != 200) return null;
            InputStream input = connection.getInputStream();
            if (input == null) return null;
            StringBuilder body = new StringBuilder();
            BufferedReader reader = new BufferedReader(new InputStreamReader(input, StandardCharsets.UTF_8));
            try {
                char[] chunk = new char[4096];
                int read;
                while ((read = reader.read(chunk)) > 0) {
                    body.append(chunk, 0, read);
                    if (body.length() > 262144) return "";
                }
            } finally {
                reader.close();
            }
            return body.toString();
        } catch (Throwable failed) {
            return null;
        } finally {
            if (connection != null) connection.disconnect();
        }
    }

    /**
     * SkipDB (skipdb.tv) final fallback: open data, IMDb-keyed, anonymous reads.
     * GET /api/segments?imdb_id=&season=&episode[&duration=] answers
     * {"segments": {"intro"|"recap"|"outro"|"preview": {"start_ms","end_ms","match",...} or null}}.
     * "out-of-range" matches carry SkipDB's own uncertainty flag and are skipped.
     */
    private static List<Segment> fetchSkipDb(String imdbId, int season, int episode, long episodeLengthSec,
                                             DebugLogger logger) {
        List<Segment> out = new ArrayList<Segment>();
        try {
            String url = SKIPDB_URL + "?imdb_id=" + imdbId + "&season=" + season + "&episode=" + episode
                    + (episodeLengthSec > 0 ? "&duration=" + episodeLengthSec : "");
            JSONObject response = new JSONObject(request("GET", url, null, logger));
            JSONObject segments = response.optJSONObject("segments");
            if (segments == null) return out;
            addSkipDbSegment(out, segments, "intro", "OP", logger);
            addSkipDbSegment(out, segments, "recap", "recap", logger);
            addSkipDbSegment(out, segments, "outro", "credits", logger);
            addSkipDbSegment(out, segments, "preview", "preview", logger);
        } catch (Exception error) {
            markSourceFailed();
            logger.log("ERROR SkipDB: " + error.getClass().getSimpleName() + ": " + safe(error.getMessage()));
        }
        return out;
    }

    private static void addSkipDbSegment(List<Segment> out, JSONObject segments, String key, String label,
                                         DebugLogger logger) {
        try {
            if (hasSegmentType(out, label)) return;
            JSONObject item = segments.optJSONObject(key);
            if (item == null) return;
            if ("out-of-range".equals(item.optString("match", ""))) {
                logger.log("SkipDB: skipped " + key + " (out-of-range match)");
                return;
            }
            double start = item.isNull("start_ms") ? -1.0 : item.optLong("start_ms", -1L) / 1000.0;
            double end = item.isNull("end_ms") ? -1.0 : item.optLong("end_ms", -1L) / 1000.0;
            if (start < 0.0 || end <= start) return;
            out.add(new Segment(start, end, label, "SkipDB"));
        } catch (Exception error) {
            logger.log("ERROR SkipDB (" + key + "): " + error.getClass().getSimpleName());
        }
    }

    /**
     * Keyless Cinemeta lookup: Stremio's own public catalog. Exact normalized name
     * match only, so "Dexter" never resolves to "Dexter: Resurrection". When several
     * exact matches exist, the one whose release year matches a year in the title
     * wins, else the first. Confident hits are cached per title (60 days); "no id" and
     * ambiguous answers only for a few minutes.
     */
    private static String cinemetaImdbId(android.content.Context ctx, String title, boolean isMovie,
                                         DebugLogger logger) {
        String wanted = safe(title);
        if (wanted.length() == 0) return "";
        String key = (isMovie ? "movie:" : "series:") + normTitle(wanted);
        String cached = cachedCinemeta(ctx, key, wanted, logger);
        if (cached != null) return cached;
        // One request per title: a prefetch and the real lookup can arrive together.
        synchronized (CINEMETA_LOCK) {
            cached = cachedCinemeta(ctx, key, wanted, logger);
            if (cached != null) return cached;
            return cinemetaRequest(ctx, key, wanted, isMovie, logger);
        }
    }

    /**
     * Session cache (confident hits only), then the stored 60-day hit cache, then the few-minute
     * soft cache (empty or ambiguous answers); null = not cached.
     */
    private static String cachedCinemeta(android.content.Context ctx, String key, String wanted,
                                         DebugLogger logger) {
        String cached = CINEMETA_CACHE.get(key);
        if (cached != null && cached.length() > 0) {
            logger.log("Cinemeta: cache hit for \"" + wanted + "\" -> " + cached);
            return cached;
        }
        String stored = IntroSkipPrefs.cachedImdb(ctx, key);
        if (stored.length() > 0) {
            CINEMETA_CACHE.put(key, stored);
            logger.log("Cinemeta: cache hit (stored) for \"" + wanted + "\" -> " + stored);
            return stored;
        }
        SoftEntry soft = getSoft(key);
        if (soft != null) {
            logger.log("Cinemeta: soft cache hit for \"" + wanted + "\" -> "
                    + (soft.value.length() > 0 ? soft.value : "<none>"));
            return soft.value;
        }
        return null;
    }

    private static String cinemetaRequest(android.content.Context ctx, String key, String wanted,
                                          boolean isMovie, DebugLogger logger) {
        String query;
        try {
            // The catalog search finds nothing for "One Piece (1999-)": search the bare name.
            query = java.net.URLEncoder.encode(stripYearRange(wanted), StandardCharsets.UTF_8.name()).replace("+", "%20");
        } catch (Exception error) {
            logger.log("Cinemeta: no exact name match for \"" + wanted + "\" (bad title)");
            return "";
        }
        String base = isMovie ? CINEMETA_MOVIE_URL : CINEMETA_SERIES_URL;
        try {
            // Cinemeta computes uncached searches slowly (5-10 s, sometimes a 504); the
            // server keeps the result, so one more 5 s attempt usually succeeds.
            JSONObject response;
            try {
                response = new JSONObject(request("GET", base + query + ".json", null, logger));
            } catch (Exception first) {
                logger.log("Cinemeta: retry after " + first.getClass().getSimpleName());
                response = new JSONObject(request("GET", base + query + ".json", null, logger));
            }
            JSONArray metas = response.optJSONArray("metas");
            if (metas == null || metas.length() == 0) {
                logger.log("Cinemeta: no results for \"" + wanted + "\"");
                putSoft(key, "");
                return "";
            }
            String wantedNorm = normTitle(wanted);
            int wantedYear = extractYear(wanted);
            String wantedBase = wantedYear > 0
                    ? wantedNorm.replaceAll("\\b" + wantedYear + "\\b", " ").replaceAll("\\s+", " ").trim()
                    : wantedNorm;
            if (!stripYearRange(wanted).equals(wanted)) wantedBase = normTitle(stripYearRange(wanted));
            List<String> exactIds = new ArrayList<>();
            List<String> exactNames = new ArrayList<>();
            List<String> exactYears = new ArrayList<>();
            StringBuilder sample = new StringBuilder();
            for (int i = 0; i < metas.length(); i++) {
                JSONObject meta = metas.optJSONObject(i);
                if (meta == null) continue;
                String name = safe(meta.optString("name", ""));
                String imdb = safe(meta.optString("imdb_id", ""));
                if (imdb.length() == 0) imdb = safe(meta.optString("id", ""));
                Matcher matcher = IMDB_ID.matcher(imdb);
                if (!matcher.find()) continue;
                imdb = matcher.group(1).toLowerCase(Locale.US);
                if (sample.length() < 200 && name.length() > 0) {
                    if (sample.length() > 0) sample.append(", ");
                    sample.append("\"").append(name).append("\"");
                }
                String metaNorm = normTitle(name);
                boolean exact = metaNorm.equals(wantedNorm)
                        || (wantedYear > 0 && metaNorm.equals(wantedBase));
                if (exact) {
                    exactIds.add(imdb);
                    exactNames.add(name);
                    exactYears.add(safe(meta.optString("releaseInfo", "")));
                }
            }
            if (exactIds.isEmpty()) {
                logger.log("Cinemeta: no exact name match for \"" + wanted + "\" ("
                        + metas.length() + " candidates, e.g. " + sample + ")");
                putSoft(key, "");
                return "";
            }
            String chosen = exactIds.get(0);
            String chosenName = exactNames.get(0);
            // Confident = the only exact match, or the one whose release year equals the year in the
            // title. Several same-name shows with no matching year ("Shameless" 2004 vs 2011) is a
            // guess: answer with the first but keep it out of the 60-day and session caches.
            boolean confident = exactIds.size() == 1;
            if (!confident && wantedYear > 0) {
                for (int i = 0; i < exactIds.size(); i++) {
                    if (exactYears.get(i).contains(String.valueOf(wantedYear))) {
                        chosen = exactIds.get(i);
                        chosenName = exactNames.get(i);
                        confident = true;
                        break;
                    }
                }
            }
            logger.log("Cinemeta: \"" + wanted + "\" -> " + chosen + " (\"" + chosenName + "\", "
                    + exactIds.size() + " exact match(es)" + (confident ? "" : ", ambiguous: not cached") + ")");
            if (confident) {
                CINEMETA_CACHE.put(key, chosen);
                IntroSkipPrefs.cacheImdb(ctx, key, chosen);
            } else {
                putSoft(key, chosen);
            }
            return chosen;
        } catch (Exception error) {
            markSourceFailed();
            logger.log("ERROR Cinemeta: " + error.getClass().getSimpleName() + ": " + safe(error.getMessage()));
            return "";
        }
    }

    private static int extractYear(String value) {
        Matcher matcher = YEAR.matcher(safe(value));
        if (matcher.find()) {
            try {
                return Integer.parseInt(matcher.group(1));
            } catch (NumberFormatException ignored) {
                return 0;
            }
        }
        return 0;
    }

    /** Inner-bounds overlap of a and b as a segment, or null to keep a (see InnerBounds). */
    private static Segment innerBounds(Segment a, Segment b, double runtime, DebugLogger logger) {
        if (a == null || b == null || a.label == null || !a.label.equals(b.label)) return null;
        // A to-end window the length guard drops takes no part in any merge, in either order.
        if (guardDroppedToEnd(a, runtime) || guardDroppedToEnd(b, runtime)) return null;
        if (OwnTimes.isOwn(a.source) || OwnTimes.isOwn(b.source)) return null; // Own times never narrow, and are never narrowed.
        StringBuilder why = new StringBuilder();
        double[] inner = InnerBounds.narrow(a.label, a.startSeconds, a.endSeconds, a.source,
                b.startSeconds, b.endSeconds, b.source, runtime, why);
        if (inner != null && inner[0] == a.startSeconds && inner[1] == a.endSeconds) return null;
        if (why.length() > 0 && logger != null) logger.log(why.toString());
        if (inner == null) return null;
        return new Segment(inner[0], inner[1], a.label,
                safe(a.source) + "+" + safe(b.source) + " inner-bounds");
    }

    private static boolean overlaps(List<Segment> segments, double candidateStart, double candidateEnd) {
        for (Segment segment : segments) {
            double start = Math.max(segment.startSeconds, candidateStart);
            double end = Math.min(segment.endSeconds, candidateEnd);
            if (end - start > 1.0) return true;
        }
        return false;
    }

    private static boolean isSaneForCoverage(Segment s, double runtime) {
        if (s == null) return false;
        if (s.toEnd) {
            // Counts as covering its type only when resolveToEnd() would accept it on this
            // runtime, so a doomed to-end segment never blocks a usable one from a later source.
            if (!s.isCredits() && !s.isPreview()) return false;
            // With no file runtime yet it cannot be judged, so it blocks nothing: a bounded source
            // travels behind it and combine() keeps the first one that survives.
            if (runtime <= 0) return false;
            double ref = runtime;
            if (ref > 0 && (s.startSeconds < ref * 0.60 || ref <= s.startSeconds)) return false;
            // Same 600 s cap positionalSanity() applies later (previews exempt, as bounded ones are).
            if (ref > 0 && s.isCredits() && ref - s.startSeconds > 600.0) return false;
            return !(runtime > 0 && s.groupDurationSeconds > 0
                    && Math.abs(s.groupDurationSeconds - runtime) > ANISKIP_LENGTH_TOLERANCE_S);
        }
        if (s.endSeconds <= s.startSeconds) return false;
        if (!s.isPreview() && s.endSeconds - s.startSeconds > 600.0) return false;
        if ("OP".equals(s.label) && runtime > 0 && s.startSeconds > runtime * 0.60) return false;
        return true;
    }

    private static boolean hasUsableSegmentType(List<Segment> segments, String label, double runtime) {
        for (Segment segment : segments) {
            if (segment.label.equals(label) && isSaneForCoverage(segment, runtime)) return true;
        }
        return false;
    }

    /** Allows an OP or preview candidate through when the only overlap in the list
     * is a credits segment (credits get trimmed before previews in combine()). */
    private static boolean overlapsBlocking(List<Segment> segments, Segment candidate) {
        for (Segment segment : segments) {
            if (segment.isPostCredits()) continue; // marker only: combine() clips at its start
            // Two to-end segments of one type both resolve to the runtime: first wins. A
            // to-end segment must not block anything else here (its end is still -1 and it
            // may yet be guard-dropped in combine()); combine()'s overlaps() dedupes the
            // survivors once ends are real, hasUsableSegmentType() gates same-type fills.
            if (segment.toEnd && candidate.toEnd && segment.label.equals(candidate.label)) return true;
            if (("OP".equals(candidate.label) || candidate.isPreview()) && segment.isCredits()) continue;
            double start = Math.max(segment.startSeconds, candidate.startSeconds);
            double end = Math.min(segment.endSeconds, candidate.endSeconds);
            if (end - start > 1.0) return true;
        }
        return false;
    }

    /**
     * Last step of combine(): an online credits window over InnerBounds.LONG_ONLINE_CREDITS_S by its
     * final length (after to-end, preview cut, clips, narrowing and snapping) becomes button-only,
     * so a mid- or post-credits scene inside a long window is not auto-skipped. Chapters and Own
     * times are exempt.
     */
    private static void guardLongCredits(List<Segment> list, List<String> logs) {
        for (int i = 0; i < list.size(); i++) {
            Segment s = list.get(i);
            double length = s.endSeconds - s.startSeconds;
            if (s.buttonOnly || !InnerBounds.longOnlineCredits(s.isCredits(), s.source, length)) continue;
            list.set(i, s.buttonOnlyCopy());
            logs.add("Long credits button only: [" + s.source + "] " + fmt(length) + "s > "
                    + fmt(InnerBounds.LONG_ONLINE_CREDITS_S) + "s");
        }
    }

    /** Trims an earlier credits segment at preview start so credits never swallow
     * a tail preview that starts over them; drops the credits when too short to keep. */
    private static void trimCreditsBeforePreview(List<Segment> segments, Segment preview,
                                                 DebugLogger logger) {
        for (int i = segments.size() - 1; i >= 0; i--) {
            Segment s = segments.get(i);
            if (!s.isCredits()) continue;
            double overlap = Math.min(s.endSeconds, preview.endSeconds)
                    - Math.max(s.startSeconds, preview.startSeconds);
            if (overlap <= 1.0) continue;
            if (preview.startSeconds - s.startSeconds >= 10.0) {
                // A credits window cut short counts by its final length: still over the limit stays a button.
                segments.set(i, new Segment(s.startSeconds, preview.startSeconds, s.label, s.source, false, 0.0,
                        s.buttonOnly && InnerBounds.longOnlineCredits(true, s.source,
                                preview.startSeconds - s.startSeconds)));
                if (logger != null) {
                    logger.log("Trimmed credits end " + fmt3(s.endSeconds) + "s -> "
                            + fmt3(preview.startSeconds) + "s before preview");
                }
            } else {
                segments.remove(i);
                if (logger != null) {
                    logger.log("Dropped credits overlapped by preview "
                            + fmt3(preview.startSeconds) + "-" + fmt3(preview.endSeconds) + "s");
                }
            }
        }
    }

    /**
     * Source-agnostic positional and duration sanity applied to the merged candidate list
     * before chapter snapping:
     * 1. Drop OP/recap/credits blocks longer than 600 s (10 min).
     * 2. Drop OP segments starting after 60% of runtime (0.0 s anime cold opens survive).
     * 3. Drop online credits starting before 40% of a known runtime (a mislabeled
     *    opening, with or without an OP); unknown runtime keeps the OP-overlap rule.
     */
    private static void positionalSanity(List<Segment> segments, double runtime, DebugLogger logger) {
        if (segments == null || segments.isEmpty()) return;
        // 1. Unified >10 min (600 s) duration sanity for intro/recap/credits.
        for (int i = segments.size() - 1; i >= 0; i--) {
            Segment s = segments.get(i);
            double duration = s.endSeconds - s.startSeconds;
            if (!s.isPreview() && duration > 600.0) {
                segments.remove(i);
                if (logger != null) {
                    logger.log("Positional sanity dropped " + s.label + " "
                            + fmt3(s.startSeconds) + "-" + fmt3(s.endSeconds)
                            + " (duration " + fmt(duration) + "s > 600s)");
                }
            }
        }
        // 2. Late OP (>60% of runtime) sanity; anime 0.0 s cold opens and >60% end credits survive.
        if (runtime > 0) {
            double maxOpStart = runtime * 0.60;
            for (int i = segments.size() - 1; i >= 0; i--) {
                Segment s = segments.get(i);
                if ("OP".equals(s.label) && s.startSeconds > maxOpStart) {
                    segments.remove(i);
                    if (logger != null) {
                        logger.log("Positional sanity dropped OP "
                                + fmt3(s.startSeconds) + "-" + fmt3(s.endSeconds)
                                + " (start " + fmt(s.startSeconds / runtime * 100.0)
                                + "% > 60% of runtime " + fmt(runtime) + "s)");
                    }
                }
            }
        }
        // 3. Early credits (<40%): known runtime drops online ones with or without an
        // OP; chapter credits and unknown runtime keep the OP-overlap rule below.
        if (runtime > 0) {
            for (int i = segments.size() - 1; i >= 0; i--) {
                Segment s = segments.get(i);
                if (InnerBounds.dropEarlyOnlineCredits(s.isCredits(), s.source, s.startSeconds, runtime)) {
                    segments.remove(i);
                    if (logger != null) {
                        logger.log("Positional sanity dropped credits "
                                + fmt3(s.startSeconds) + "-" + fmt3(s.endSeconds)
                                + " (early online credits < 40% of runtime " + fmt(runtime)
                                + "s, source " + s.source + ")");
                    }
                }
            }
        }
        double earlyCreditsLimit = runtime > 0 ? runtime * 0.40 : 480.0;
        for (int i = segments.size() - 1; i >= 0; i--) {
            Segment s = segments.get(i);
            if (!s.isCredits() || s.startSeconds >= earlyCreditsLimit) continue;
            Segment overlappingOp = null;
            for (Segment other : segments) {
                if (!"OP".equals(other.label)) continue;
                double overlap = Math.min(s.endSeconds, other.endSeconds)
                        - Math.max(s.startSeconds, other.startSeconds);
                if (overlap > 1.0) {
                    overlappingOp = other;
                    break;
                }
            }
            if (overlappingOp != null) {
                segments.remove(i);
                if (logger != null) {
                    logger.log("Positional sanity dropped credits "
                            + fmt3(s.startSeconds) + "-" + fmt3(s.endSeconds)
                            + " (early credits < 40% overlapping OP "
                            + fmt3(overlappingOp.startSeconds) + "-" + fmt3(overlappingOp.endSeconds) + ")");
                }
            }
        }
    }

    private static String ordinalSeason(int season) {
        if (season % 100 >= 11 && season % 100 <= 13) return season + "th";
        switch (season % 10) {
            case 1: return season + "st";
            case 2: return season + "nd";
            case 3: return season + "rd";
            default: return season + "th";
        }
    }

    private static int seasonFromText(String value) {
        // URI.toString() contains %20 around the filename. Decode before using
        // token boundaries, otherwise the final encoded space ends in a digit
        // and S04E04 is not recognized as a separate token.
        String raw = decode(value);
        Matcher matcher = SEASON.matcher(raw);
        if (matcher.find()) return parseInt(matcher.group(1));
        matcher = SEASON_WORD.matcher(raw);
        if (matcher.find()) return parseInt(matcher.group(1));
        return 0;
    }

    private static String request(String method, String endpoint, String body, DebugLogger logger) throws Exception {
        return request(method, endpoint, body, null, logger);
    }

    /**
     * HTTP with the 5 s timeouts, safe on a worker thread: 204/404 mean
     * not-found and return immediately with no retry; 429 and 5xx are retried
     * up to 3 times, honouring Retry-After with each wait capped at 3 s; other
     * failures after the last attempt throw. The whole lookup chain shares a
     * ~10 s budget through DEADLINE_MS, set by the worker thread.
     */
    private static String request(String method, String endpoint, String body, String auth,
                                  DebugLogger logger) throws Exception {
        String shown = endpoint.replaceAll("api_key=[^&]*", "api_key=***");
        logger.log("REQUEST " + method + " " + shown +
                (body == null ? "" : "\nBody: " + clip(body)));
        Exception lastError = null;
        long retryAfterMs = 0L;
        for (int attempt = 1; attempt <= HTTP_MAX_ATTEMPTS; attempt++) {
            long now = SystemClock.uptimeMillis();
            Long deadline = DEADLINE_MS.get();
            if (deadline != null && now >= deadline) {
                throw new LookupBudgetException("lookup budget exhausted");
            }
            if (attempt > 1) {
                long waitMs = retryAfterMs > 0 ? retryAfterMs : (500L << (attempt - 2));
                if (waitMs > RETRY_WAIT_MAX_MS) waitMs = RETRY_WAIT_MAX_MS;
                if (deadline != null) {
                    long remaining = deadline - now;
                    if (remaining < waitMs) waitMs = Math.max(remaining, 0L);
                }
                retryAfterMs = 0L;
                if (waitMs > 0) {
                    logger.log("RETRY " + attempt + "/" + HTTP_MAX_ATTEMPTS + " in " + waitMs + "ms");
                    try {
                        Thread.sleep(waitMs);
                    } catch (InterruptedException interrupted) {
                        Thread.currentThread().interrupt();
                        throw new java.io.IOException("interrupted");
                    }
                }
            }
            HttpURLConnection connection = null;
            try {
                connection = (HttpURLConnection) new URL(endpoint).openConnection();
                connection.setRequestMethod(method);
                connection.setConnectTimeout(5000);
                connection.setReadTimeout(5000);
                // Kitsu (JSON:API) answers 406 to anything but its own media type.
                connection.setRequestProperty("Accept", endpoint.startsWith(KITSU_MAPPINGS_URL)
                        ? "application/vnd.api+json" : "application/json");
                connection.setRequestProperty("User-Agent", "Stremio");
                if (auth != null && auth.length() > 0) {
                    connection.setRequestProperty("Authorization", auth);
                }
                if (body != null) {
                    connection.setDoOutput(true);
                    connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
                    OutputStream output = connection.getOutputStream();
                    output.write(body.getBytes(StandardCharsets.UTF_8));
                    output.close();
                }
                int responseCode = connection.getResponseCode();
                if (responseCode == 204 || responseCode == 404) {
                    logger.log("RESPONSE " + responseCode + ": not found, no retry");
                    return "{}";
                }
                if (responseCode == 429 || responseCode >= 500) {
                    retryAfterMs = retryAfterMs(connection);
                    lastError = new java.io.IOException("HTTP " + responseCode);
                    logger.log("RESPONSE " + responseCode + ": retryable");
                    continue;
                }
                InputStream input = responseCode >= 400
                        ? connection.getErrorStream() : connection.getInputStream();
                if (input == null) {
                    logger.log("RESPONSE " + responseCode + ": <empty>");
                    return "{}";
                }
                StringBuilder response = new StringBuilder();
                BufferedReader reader = new BufferedReader(new InputStreamReader(input, StandardCharsets.UTF_8));
                try {
                    String line;
                    while ((line = reader.readLine()) != null) response.append(line);
                } finally {
                    try {
                        reader.close();
                    } catch (Throwable ignored) {
                        // The body was already read; closing must not fail the lookup.
                    }
                }
                logger.log("RESPONSE " + responseCode + "\n" + clip(response.toString()));
                return response.toString();
            } catch (LookupBudgetException budget) {
                throw budget;
            } catch (java.io.IOException error) {
                lastError = error;
                logger.log("RETRYABLE " + error.getClass().getSimpleName() + ": " + safe(error.getMessage()));
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
        throw lastError == null ? new java.io.IOException("HTTP request failed") : lastError;
    }

    private static final class LookupBudgetException extends java.io.IOException {
        LookupBudgetException(String message) {
            super(message);
        }
    }

    /** Retry-After in ms (delta seconds or an HTTP date), 0 when absent or unusable. */
    private static long retryAfterMs(HttpURLConnection connection) {
        try {
            String value = connection.getHeaderField("Retry-After");
            if (value == null) return 0L;
            value = value.trim();
            if (value.length() == 0) return 0L;
            try {
                return Math.max(0L, Long.parseLong(value) * 1000L);
            } catch (NumberFormatException notSeconds) {
                long date = connection.getHeaderFieldDate("Retry-After", -1L);
                if (date > 0) return Math.max(0L, date - System.currentTimeMillis());
            }
        } catch (Throwable ignored) {
            // A broken header must not fail the lookup.
        }
        return 0L;
    }

    private static String clip(String value) {
        if (value == null) return "";
        return value.length() <= 6000 ? value : value.substring(0, 6000) + "...[cut]";
    }

    private static String decode(String value) {
        String raw = safe(value);
        if (raw.length() == 0) return "";
        try {
            return URLDecoder.decode(raw, StandardCharsets.UTF_8.name());
        } catch (Exception ignored) {
            return raw;
        }
    }

    private static String text(CharSequence value) {
        return value == null ? "" : value.toString().trim();
    }

    private static String safe(String value) {
        return value == null ? "" : value.trim();
    }
}
