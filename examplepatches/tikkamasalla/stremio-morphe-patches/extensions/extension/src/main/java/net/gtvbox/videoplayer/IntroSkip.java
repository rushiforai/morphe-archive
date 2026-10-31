package net.gtvbox.videoplayer;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.AbsSeekBar;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.TextView;

import androidx.media3.common.C;
import androidx.media3.common.Format;
import androidx.media3.common.TrackSelectionParameters;
import androidx.media3.common.Tracks;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationHandler;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Skips (automatically or via an on-screen "Skip intro (OK)" pill) the intro and recap
 * segments of the file being played, using:
 * (a) the chapter list Vimu already parses for its seek-bar ticks;
 * (b) AniSkip (via AniList GraphQL -> MAL id -> AniSkip v2 API) for anime or confident matches;
 * (c) TheIntroDB (via a keyless Cinemeta title lookup -> TheIntroDB v4 API) as a fallback for western TV episodes;
 * (d) IntroDB.app (keyless), but only for segment types TheIntroDB has nothing for.
 * Online segments from AniSkip and the IntroDB sources snap to file chapter boundaries when chapters exist.
 *
 * Hooked from PlayerFragment.onResume/onPause.
 * Rules: one auto-skip per segment, 2.5 s guard after our seek, a chapter named OP/Opening wins over one
 * named "Intro". Starting or resuming inside the intro skips in Auto mode; a deliberate user seek (a jump
 * within 5 s of a left/right/rewind/fast-forward key, after 3 s of playback) or Manual mode shows the
 * non-focusable pill instead. Key presses are observed through a pass-through proxy of Window.Callback.
 */
public final class IntroSkip implements Runnable {
    private static final String TAG = "VimuIntroSkip";
    private static final long POLL_MS = 200L;
    private static final int HTTP_TIMEOUT_MS = 5000;
    private static final String PREFS_NAME = "vimu_introskip_cache";
    private static final long CACHE_TTL_MS = 60L * 24L * 60L * 60L * 1000L; // 60 days

    private static final String ANILIST_URL = "https://graphql.anilist.co";
    private static final String ANISKIP_URL = "https://api.aniskip.com/v2/skip-times/";
    private static final String INTRODB_URL = "https://api.theintrodb.org/v4/media";
    private static final String INTRODB_APP_URL = "https://api.introdb.app/segments";
    private static final String SKIPDB_URL = "https://api.skipdb.tv/api/segments";
    private static final String CINEMETA_META_SERIES_URL = "https://v3-cinemeta.strem.io/meta/series/";
    // Network robustness: every skip-related HTTP call keeps the 5 s timeouts,
    // retries 429/5xx up to 3 times (Retry-After honoured, each wait capped at
    // 3 s), returns not-found (204/404) immediately, and the whole lookup chain
    // is capped at about 10 s so skip data still arrives before typical intros.
    private static final long LOOKUP_BUDGET_MS = 10000L;
    private static final int HTTP_MAX_ATTEMPTS = 4;
    private static final long RETRY_WAIT_MAX_MS = 3000L;
    private static final ThreadLocal<Long> DEADLINE_MS = new ThreadLocal<Long>();
    private static final Map<String, String> CINEMETA_IDS_CACHE = new ConcurrentHashMap<String, String>();
    private static final String CINEMETA_SERIES_URL = "https://v3-cinemeta.strem.io/catalog/series/top/search=";
    private static final Pattern IMDB_ID = Pattern.compile("(?i)(tt\\d{7,})");
    private static final Pattern YEAR = Pattern.compile("\\b(19\\d{2}|20\\d{2})\\b");
    /** Trailing "(1999-)", "(1999-2004)", "(2019)" (any dash, or none) that Stremio appends to a series name. */
    private static final Pattern TRAILING_YEAR_RANGE = Pattern.compile(
            "\\s*[(\\[]\\s*(?:19|20)\\d{2}\\s*(?:[-\\u2010-\\u2015]?\\s*(?:(?:19|20)\\d{2}|present|now)?\\s*)?[)\\]]\\s*$",
            Pattern.CASE_INSENSITIVE);

    // ---- Stremio hand-off extras (set from w1 via capture, used before filename parsing) ----
    private static volatile boolean extHaveMedia;
    private static volatile String extMediaType = "";
    private static volatile int extSeason = -1;
    private static volatile int extEpisode = -1;
    private static volatile String extImdbId = "";
    private static volatile String extTitle = "";
    private static volatile boolean extHaveSub;
    private static volatile String extSubUrl = "";
    private static volatile String extSubLang = "";
    private static volatile String extSubLabel = "";
    private static volatile String extSubId = "";
    private static volatile int extSubIndex = -1;
    /** The Intent the hand-off state was read from; any other Intent forces a fresh read. */
    private static volatile WeakReference<Intent> extSource;

    private static final WeakHashMap<PlayerFragment, IntroSkip> ACTIVE = new WeakHashMap<>();
    private static final Map<Object, Boolean> AUDIO_HANDLED =
            Collections.synchronizedMap(new WeakHashMap<Object, Boolean>());
    private static final Map<String, String> MAL_CACHE = new ConcurrentHashMap<>();
    private static final Object CINEMETA_LOCK = new Object();
    private static final Map<String, String> CINEMETA_CACHE = new ConcurrentHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** OP / opening / title-sequence names: anime ("OP", "Opening 2") and western ("Opening Credits", "Main Titles"). */
    private static final String OPENING_WORDS = "op\\d{0,2}|opening(?:\\s+(?:song|theme|credits|titles?|sequence))?"
            + "|(?:main|title)\\s+(?:titles?|credits?|sequence|song|theme|card)|titles?|theme(?:\\s+(?:song|music))?";
    /** a) chapter names that mean intro / recap. */
    private static final Pattern INTRO_NAME = Pattern.compile(
            "(?i)(?:^|[^a-z])(?:" + OPENING_WORDS + "|intro(?:duction)?|recap|previously(?:\\s+on)?)(?:[^a-z]|$)|オープニング|あらすじ");
    /** "Intro" alone: counts only when the file has no OP/Opening chapter (cold opens are often "Intro"). */
    private static final Pattern WEAK_INTRO_NAME = Pattern.compile(
            "(?i)(?:^|[^a-z])intro(?:duction)?(?:[^a-z]|$)");
    private static final Pattern OPENING_NAME = Pattern.compile(
            "(?i)(?:^|[^a-z])(?:" + OPENING_WORDS + ")(?:[^a-z]|$)|オープニング");
    /** Names that must never be auto-skipped even if they also match the intro words (includes "Opening End" / "Intro End"). */
    private static final Pattern NEVER_NAME = Pattern.compile(
            "(?i)(?:^|[^a-z])(?:ed\\d{0,2}|ending|outro|(?:end|ending|closing)\\s+(?:credits?|titles?)|preview|pv|teaser|next\\s+episode|eyecatch)(?:[^a-z]|$)"
            + "|\\b(?:op\\d{0,2}|opening|intro(?:duction)?|recap|credits?)[\\s:_-]+end\\b");
    /** A bare "Credits" chapter: the opening credits near the start, the end credits near the end. */
    private static final Pattern CREDITS_NAME = Pattern.compile("(?i)(?:^|[^a-z])credits?(?:[^a-z]|$)");
    /** b) names that carry no meaning: "", "Chapter 1", "Chapter 01", "01", "00:01:25.000". */
    private static final Pattern GENERIC_NAME = Pattern.compile(
            "(?i)^\\s*(?:(?:chapter|chapitre|kapitel|cap[ií]tulo|capitolo|hoofdstuk|rozdział|глава|ch\\.?)\\s*)?\\d{0,3}\\s*$|^\\s*\\d{1,2}:\\d{2}(?::\\d{2})?(?:[.,]\\d+)?\\s*$");

    // ---- Media filename / title parsing & AniList scoring patterns ----
    private static final Pattern FILE_EXT = Pattern.compile(
            "(?i)\\.(?:mkv|mp4|avi|webm|ts|m2ts|m4v|mov|flv|wmv|ogm|mpg|mpeg|iso|strm)$");
    private static final Pattern LEADING_GROUP = Pattern.compile("^\\s*\\[[^\\]]+\\]");
    private static final Pattern CRC_HASH = Pattern.compile("(?i)\\[[0-9a-f]{8}\\]");
    private static final Pattern YEAR_PAREN = Pattern.compile("\\(((?:19|20)\\d{2})\\)");
    private static final Pattern YEAR_TOKEN = Pattern.compile("\\b((?:19|20)\\d{2})\\b");
    private static final Pattern BRACKET_TAG = Pattern.compile("\\[[^\\]]*\\]");
    private static final Pattern PAREN_META = Pattern.compile(
            "(?i)\\([^)]*(?:\\d{3,4}p|\\d{3,4}x\\d{3,4}|bluray|bdrip|bd|web-?dl|webrip|web|hdtv|dvd|hevc|x264|x265|h\\.?264|h\\.?265|av1|10\\s*bit|8\\s*bit|aac|flac|eac3|ac3|opus|dual|multi|sub|dub|raw|uncensored|remux|cr|b-global)[^)]*\\)");
    private static final Pattern TRAILING_TECH = Pattern.compile(
            "(?i)(?:^|[\\s._-]+)(?:\\d{3,4}p|2160p|1080p|720p|480p|4k|web-?dl|webrip|bluray|bdrip|bdremux|remux|hdtv|dvdrip|hevc|x264|x265|h\\.?264|h\\.?265|av1|10bit|8bit|aac\\d*(?:\\.\\d+)?|flac|ddp?\\d*(?:\\.\\d+)?|eac3|ac3|dual[ ._-]*audio|multi[ ._-]*subs?)\\b.*$");
    private static final Pattern SXXEYY = Pattern.compile(
            "(?i)(?:^|[^a-z0-9])S(\\d{1,2})[ ._-]*E(\\d{1,4})(?:v\\d+)?(?=$|[^a-z0-9])");
    private static final Pattern SXX_DASH_EP = Pattern.compile(
            "(?i)(?:^|[^a-z0-9])(?:S|Season\\s*)(\\d{1,2})\\s*[-\u2013\u2014]+\\s*(?:Ep(?:isode)?\\.?\\s*)?(\\d{1,4})(?:v\\d+)?(?=$|[^a-z0-9])");
    private static final Pattern NXNN = Pattern.compile(
            "(?i)(?:^|[^a-z0-9])(\\d{1,2})x(\\d{2,3})(?=$|[^a-z0-9])");
    private static final Pattern ANIME_DASH_EP = Pattern.compile(
            "(?i)^(.+?)\\s+[-\u2013\u2014]+\\s*(?:Ep(?:isode)?\\.?\\s*)?(\\d{1,4})(?:v\\d+)?(?:\\s*[-\u2013\u2014]+\\s*[^\\d].*)?$");
    private static final Pattern EXPLICIT_EP = Pattern.compile(
            "(?i)^(.+?)[\\s._-]+(?:Episode|Ep\\.?|E)\\s*(\\d{1,4})(?:v\\d+)?(?:\\b.*)?$");
    private static final Pattern TRAILING_EP = Pattern.compile(
            "^(.+?\\p{L}[^\\d]*?)\\s+(\\d{2,3})(?:v\\d+)?$");
    private static final Pattern TITLE_SEASON = Pattern.compile(
            "(?i)(?:\\bSeason\\s*(\\d{1,2})|\\b(\\d{1,2})(?:st|nd|rd|th)\\s+Season|\\bS(\\d{1,2}))\\b");
    private static final Pattern CANDIDATE_SEASON = Pattern.compile(
            "(?i)(?:(\\d+)(?:st|nd|rd|th)\\s+season|season\\s*(\\d+)|(second|third|fourth|fifth)(?:\\s+season)?$"
                    + "|\\s(ii|iii|iv)$)");
    private static final Pattern PART_TWO = Pattern.compile(
            "(?i)(?:part|cour)\\s*(?:2|ii)\\b|2nd\\s+(?:part|cour)\\b");

    private final WeakReference<PlayerFragment> fragment;
    private boolean running;
    private e player;
    private int durationMs = Integer.MIN_VALUE;
    private List<Seg> segments;
    private int mediaKind; // 0 unknown, 1 episode, 2 movie
    /** Pending Stremio subtitle choice: applied once the player lists its tracks. */
    private boolean subApplied;
    private int subTries;
    private boolean subLogged;
    /** Pending preferred-audio selection: applied once tracks are known. */
    private boolean audioPending = true;
    private boolean chaptersHaveIntro;
    /** Online timestamps (AniSkip or IntroDB) for the episode; used when chapters give no intro. */
    private volatile List<Seg> remote;
    private boolean remoteStarted;
    private boolean remoteApplied;
    private volatile int mediaGen;
    private long nextChapterRead;
    private int chapterReads;
    private String chapterSignature;
    private final Set<String> skipped = new HashSet<>();
    private int lastPos = -1;
    private long lastAt;
    private long guardUntil;
    private int guardTarget;
    private Seg current;
    private boolean currentBySeek;
    private boolean currentByJump;
    private boolean inheritSeek;
    private long firstPlayingAt;
    private int flowPos = -1;
    private int flowTicks;
    private volatile long lastSeekKeyAt;
    private volatile long lastOtherKeyAt;
    private boolean okDownConsumed;
    private Window hookedWindow;
    private Window.Callback hookedOriginal;
    private Window.Callback hookedProxy;

    // ---- On-screen "Skip intro (OK)" pill overlay ----
    private FrameLayout host;
    private TextView pill;
    private boolean pillShown;
    private boolean armed;
    private Seg pillSegment;
    private boolean controlsMethodLookedUp;
    private Method controlsVisibleMethod;

    private final Runnable precise = new Runnable() {
        @Override
        public void run() {
            if (!running) return;
            try {
                tick();
            } catch (Throwable error) {
                Log.w(TAG, "precise", error);
            }
        }
    };

    private static final class Seg {
        final int start;
        final int end;
        final String name;
        final String rule;

        Seg(int start, int end, String name, String rule) {
            this.start = start;
            this.end = end;
            this.name = name;
            this.rule = rule;
        }

        String key() {
            return start + "-" + end;
        }

        boolean recap() {
            return name != null && name.toLowerCase(Locale.US).matches(".*(recap|previously|あらすじ).*");
        }

        /** Only the online "Credits" segments: a chapter named "Opening Credits" is a title sequence. */
        boolean credits() {
            return "Credits".equals(name) && rule != null && rule.startsWith("introdb");
        }

        /** Only the online "Preview" segments (SkipDB): never chapters. */
        boolean preview() {
            return "Preview".equals(name);
        }

        String buttonText() {
            if (recap()) return "Skip recap (OK)";
            if (credits()) return "Skip credits (OK)";
            if (preview()) return "Skip preview (OK)";
            return "Skip intro (OK)";
        }

        String skippedText() {
            if (recap()) return "Recap skipped";
            if (credits()) return "Credits skipped";
            if (preview()) return "Preview skipped";
            return "Intro skipped";
        }
    }

    private static final class ParsedMedia {
        final String title;
        final int season;
        final int episode;
        final String year;
        final boolean looksLikeAnime;
        final String raw;
        String imdbId;

        ParsedMedia(String title, int season, int episode, String year, boolean looksLikeAnime, String raw) {
            this.title = title;
            this.season = season;
            this.episode = episode;
            this.year = year;
            this.looksLikeAnime = looksLikeAnime;
            this.raw = raw;
        }
    }

    private static final class AniSkipCandidate {
        final int startMs;
        final int endMs;
        final String name;
        final double theirLengthSec;
        final double lengthDiffSec;

        AniSkipCandidate(int startMs, int endMs, String name, double theirLengthSec, double lengthDiffSec) {
            this.startMs = startMs;
            this.endMs = endMs;
            this.name = name;
            this.theirLengthSec = theirLengthSec;
            this.lengthDiffSec = lengthDiffSec;
        }
    }

    private IntroSkip(PlayerFragment fragment) {
        this.fragment = new WeakReference<>(fragment);
    }

    /**
     * Hook in PlayerFragment.w1 (runs in onCreate): reads the hand-off extras Stremio put on the
     * launch Intent and bridges the addon subtitle URL to Vimu's own forcedsrt flow, which the
     * player picks up when playback starts. Always resets the hand-off state, so a launch
     * without extras never reuses a previous one.
     */
    public static void capture(Object fragment, Bundle extras) {
        clearHandoff();
        try {
            Intent source = null;
            if (fragment instanceof PlayerFragment) {
                Activity owner = ((PlayerFragment) fragment).getActivity();
                source = owner == null ? null : owner.getIntent();
            }
            extSource = source == null ? null : new WeakReference<Intent>(source);
            if (extras == null) {
                return;
            }
            readHandoff(extras);
            if (extSubUrl.length() > 0 && fragment instanceof PlayerFragment) {
                try {
                    Activity activity = ((PlayerFragment) fragment).getActivity();
                    Intent intent = activity == null ? null : activity.getIntent();
                    if (intent != null && !intent.hasExtra("forcedsrt")) {
                        intent.putExtra("forcedsrt", extSubUrl);
                        Log.i(TAG, "handoff: addon subtitles via forcedsrt");
                    }
                } catch (Throwable error) {
                    Log.w(TAG, "forcedsrt", error);
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "capture", error);
        }
    }

    private static void clearHandoff() {
        extHaveMedia = false;
        extMediaType = "";
        extSeason = -1;
        extEpisode = -1;
        extImdbId = "";
        extTitle = "";
        extHaveSub = false;
        extSubUrl = "";
        extSubLang = "";
        extSubLabel = "";
        extSubId = "";
        extSubIndex = -1;
        extSource = null;
    }

    /**
     * Makes sure the hand-off state belongs to this Intent: a different Intent than the one
     * captured at launch (a new launch into a live Vimu) is read fresh, and cleared when it
     * carries no hand-off extras.
     */
    private static void syncHandoff(Intent intent) {
        if (intent == null) return;
        WeakReference<Intent> ref = extSource;
        if (ref != null && ref.get() == intent) return;
        clearHandoff();
        extSource = new WeakReference<Intent>(intent);
        try {
            Bundle extras = intent.getExtras();
            if (extras != null) readHandoff(extras);
            Log.i(TAG, "handoff re-read from a new intent, have media=" + extHaveMedia);
        } catch (Throwable error) {
            Log.w(TAG, "syncHandoff", error);
        }
    }

    private static void readHandoff(Bundle extras) {
        try {
            extMediaType = safeLower(extras.getString("media_type"));
            extSeason = extras.getInt("season", -1);
            extEpisode = extras.getInt("episode", -1);
            extImdbId = safeLower(extras.getString("imdb_id"));
            extTitle = safe(extras.getString("title"));
            Object[] enable = null;
            try {
                enable = extras.getParcelableArray("subs.enable");
            } catch (Throwable ignored) {
            }
            if (enable != null) {
                for (Object one : enable) {
                    if (one != null) {
                        extSubUrl = safe(one.toString());
                        break;
                    }
                }
            }
            extSubLang = safe(extras.getString("sub_lang"));
            extSubLabel = safe(extras.getString("sub_label"));
            extSubId = safe(extras.getString("sub_track_id"));
            extSubIndex = extras.getInt("sub_track_index", -1);
            extHaveMedia = extMediaType.length() > 0 || extImdbId.length() > 0 || extEpisode > 0;
            extHaveSub = extSubUrl.length() > 0 || extSubLang.length() > 0
                    || extSubLabel.length() > 0 || extSubId.length() > 0 || extSubIndex >= 0;
            Log.i(TAG, "handoff media_type=" + extMediaType + " imdb=" + extImdbId
                    + " S" + extSeason + "E" + extEpisode + " title=" + clip(extTitle)
                    + " sub=" + (extSubUrl.length() > 0 ? extSubUrl : "")
                    + (extSubLang.length() + extSubLabel.length() + extSubId.length() > 0
                    ? " embedded[" + extSubIndex + "] lang=" + extSubLang
                    + " label=" + clip(extSubLabel) + " id=" + clip(extSubId) : ""));
        } catch (Throwable error) {
            Log.w(TAG, "readHandoff", error);
        }
    }

    private static String safe(String value) {
        return value == null ? "" : value;
    }

    private static String safeLower(String value) {
        return value == null ? "" : value.trim().toLowerCase(Locale.US);
    }

    private static String clip(String value) {
        if (value == null) {
            return "";
        }
        return value.length() <= 80 ? value : value.substring(0, 80);
    }

    private static boolean isSeriesType(String mediaType) {
        return mediaType.contains("series") || mediaType.contains("tv")
                || mediaType.contains("show") || mediaType.contains("anime");
    }

    public static void start(PlayerFragment f) {
        try {
            if (!VimuIntroSkipPrefs.isEnabled(f)) return;
            IntroSkip skip = ACTIVE.get(f);
            if (skip == null) {
                skip = new IntroSkip(f);
                ACTIVE.put(f, skip);
            }
            if (!skip.running) {
                skip.running = true;
                skip.lastPos = -1;
                skip.firstPlayingAt = 0;
                skip.okDownConsumed = false;
                skip.hookKeys(f);
                Log.i(TAG, "Settings: enabled=" + VimuIntroSkipPrefs.isEnabled(f)
                        + " anime=" + VimuIntroSkipPrefs.isAnimeEnabled(f)
                        + " mode=" + VimuIntroSkipPrefs.mode(f)
                        + " recaps=" + VimuIntroSkipPrefs.isRecapsEnabled(f));
                MAIN.removeCallbacks(skip);
                MAIN.post(skip);
            }
        } catch (Throwable error) {
            Log.w(TAG, "start", error);
        }
    }

    public static void stop(PlayerFragment f) {
        try {
            IntroSkip skip = ACTIVE.get(f);
            if (skip != null) {
                skip.running = false;
                skip.okDownConsumed = false;
                skip.removePill();
                skip.unhookKeys();
                MAIN.removeCallbacks(skip);
                MAIN.removeCallbacks(skip.precise);
            }
        } catch (Throwable error) {
            Log.w(TAG, "stop", error);
        }
    }

    private static boolean isSeekKey(int keyCode) {
        return keyCode == KeyEvent.KEYCODE_DPAD_LEFT || keyCode == KeyEvent.KEYCODE_DPAD_RIGHT
                || keyCode == KeyEvent.KEYCODE_MEDIA_REWIND || keyCode == KeyEvent.KEYCODE_MEDIA_FAST_FORWARD
                || keyCode == KeyEvent.KEYCODE_MEDIA_SKIP_BACKWARD || keyCode == KeyEvent.KEYCODE_MEDIA_SKIP_FORWARD
                || keyCode == KeyEvent.KEYCODE_MEDIA_STEP_BACKWARD || keyCode == KeyEvent.KEYCODE_MEDIA_STEP_FORWARD;
    }

    private static boolean isOkKey(int keyCode) {
        return keyCode == KeyEvent.KEYCODE_DPAD_CENTER || keyCode == KeyEvent.KEYCODE_ENTER
                || keyCode == KeyEvent.KEYCODE_NUMPAD_ENTER || keyCode == KeyEvent.KEYCODE_BUTTON_A;
    }

    /**
     * Wraps the activity's Window.Callback in a pass-through proxy that timestamps seek keys
     * and intercepts OK only while the Skip pill is shown and Vimu's own controls are hidden.
     */
    private void hookKeys(PlayerFragment f) {
        try {
            unhookKeys();
            Activity activity = f.getActivity();
            if (activity == null) return;
            final Window window = activity.getWindow();
            if (window == null) return;
            final Window.Callback original = window.getCallback();
            if (original == null) return;
            Window.Callback proxy = (Window.Callback) Proxy.newProxyInstance(Window.Callback.class.getClassLoader(),
                    new Class<?>[]{Window.Callback.class}, new InvocationHandler() {
                        @Override
                        public Object invoke(Object o, Method method, Object[] args) throws Throwable {
                            if ("dispatchKeyEvent".equals(method.getName()) && args != null && args.length == 1
                                    && args[0] instanceof KeyEvent) {
                                try {
                                    if (onKey((KeyEvent) args[0])) {
                                        return Boolean.TRUE;
                                    }
                                } catch (Throwable error) {
                                    Log.w(TAG, "onKey", error);
                                }
                            }
                            try {
                                return method.invoke(original, args);
                            } catch (InvocationTargetException e) {
                                throw e.getCause() != null ? e.getCause() : e;
                            }
                        }
                    });
            window.setCallback(proxy);
            hookedWindow = window;
            hookedOriginal = original;
            hookedProxy = proxy;
            Log.i(TAG, "seek-key hook installed");
        } catch (Throwable error) {
            Log.w(TAG, "hookKeys", error);
        }
    }

    private void unhookKeys() {
        try {
            if (hookedWindow != null && hookedWindow.getCallback() == hookedProxy) {
                hookedWindow.setCallback(hookedOriginal);
            }
        } catch (Throwable error) {
            Log.w(TAG, "unhookKeys", error);
        }
        hookedWindow = null;
        hookedOriginal = null;
        hookedProxy = null;
    }

    /** True = key consumed. Only OK on an armed Skip pill is ever consumed. */
    private boolean onKey(KeyEvent event) {
        if (!running || event == null) return false;
        int keyCode = event.getKeyCode();
        int action = event.getAction();
        if (isSeekKey(keyCode)) {
            lastSeekKeyAt = SystemClock.uptimeMillis();
        }
        if (!pillShown || pillSegment == null) {
            okDownConsumed = false;
            return false;
        }
        if (!isOkKey(keyCode)) {
            okDownConsumed = false;
            if (action == KeyEvent.ACTION_DOWN) {
                // Any other key gives OK back to the player controls it just woke up.
                lastOtherKeyAt = SystemClock.uptimeMillis();
                if (armed) {
                    armed = false;
                    PlayerFragment f = fragment.get();
                    styleArmed(f == null ? null : f.getActivity(), false);
                }
            }
            return false;
        }
        if (action == KeyEvent.ACTION_DOWN) {
            if (event.getRepeatCount() == 0) {
                PlayerFragment f = fragment.get();
                Activity activity = f == null ? null : f.getActivity();
                refreshArmed(f, activity, SystemClock.uptimeMillis());
                okDownConsumed = armed;
            }
            return okDownConsumed;
        }
        if (action == KeyEvent.ACTION_UP) {
            if (!okDownConsumed) return false;
            okDownConsumed = false;
            Seg seg = pillSegment;
            hidePill(false);
            PlayerFragment f = fragment.get();
            e p = f == null ? null : PlayerFragment.G0(f);
            if (f != null && p != null && seg != null) {
                int pos = p.getCurrentPosition();
                skip(f, p, seg, pos, false);
            }
            return true;
        }
        return okDownConsumed;
    }

    @Override
    public void run() {
        if (!running) return;
        try {
            tick();
        } catch (Throwable error) {
            Log.w(TAG, "tick", error);
        }
        if (running) MAIN.postDelayed(this, POLL_MS);
    }

    private void tick() {
        PlayerFragment f = fragment.get();
        if (f == null) {
            running = false;
            removePill();
            return;
        }
        Activity activity = f.getActivity();
        if (activity == null || activity.isFinishing()
                || (Build.VERSION.SDK_INT >= 17 && activity.isDestroyed())) {
            hidePill(false);
            return;
        }
        e p = PlayerFragment.G0(f);
        if (p == null) {
            if (pillShown) hidePill(true);
            return;
        }
        applyPendingSub(f, p);
        long now = SystemClock.uptimeMillis();
        int duration = p.getDuration();
        if (p != player) {
            player = p;
            resetMedia();
        }
        if (audioPending && duration > 0) {
            applyPendingAudio(f, p);
        }
        durationMs = duration;
        boolean playingNow = p.isPlaying();
        int posNow = p.getCurrentPosition();

        if (!VimuIntroSkipPrefs.isEnabled(f)) {
            current = null;
            lastPos = posNow;
            lastAt = now;
            if (pillShown) hidePill(true);
            return;
        }

        if (mediaKind == 0) {
            mediaKind = isEpisodeIntent(activity.getIntent()) ? 1 : 2;
            if (mediaKind == 2) {
                Log.i(TAG, "movie, skipping disabled");
                Log.i(TAG, "movie check saw: " + describeIntent(activity.getIntent()));
            }
        }
        if (mediaKind == 2) {
            // Movies are never skipped: no chapters, no pill, no lookups.
            current = null;
            lastPos = posNow;
            lastAt = now;
            if (pillShown) hidePill(true);
            return;
        }

        if (firstPlayingAt == 0 && playingNow) firstPlayingAt = now;
        int moved = posNow - flowPos;
        flowPos = posNow;
        if (!playingNow || moved < 0 || moved >= 1500) flowTicks = 0;
        else if (moved > 0) flowTicks++;
        if (now >= nextChapterRead && (segments == null ? chapterReads < 40 : true)) {
            chapterReads++;
            // Until found: every 3 s. Afterwards every 10 s, only to notice a new file in the same player.
            nextChapterRead = now + (segments == null ? 3000L : 10000L);
            String signature = chapterSignature(p);
            if (signature != null && !signature.equals(chapterSignature)) {
                if (chapterSignature != null) {
                    Log.i(TAG, "chapter list changed: new media");
                    resetMedia();
                }
                chapterSignature = signature;
                readChapters(p, duration);
                // If online segments were applied before chapters loaded and chapters have no intro, re-snap now.
                if (!chaptersHaveIntro) remoteApplied = false;
            }
        }
        if (!remoteStarted && duration > 0 && playingNow) {
            remoteStarted = true;
            startRemoteLookup(f, duration);
        }
        List<Seg> fromRemote = remote;
        if (!chaptersHaveIntro && !remoteApplied && fromRemote != null && !fromRemote.isEmpty()
                && chapterReads >= 1) {
            // Chapters had their chance (read at least once) and yielded no intro chapter: use online segments.
            remoteApplied = true;
            inheritSeek = current != null && currentBySeek;
            List<Seg> snapped = snapSegments(fromRemote, p.E(), duration);
            List<Seg> merged = new ArrayList<>();
            if (segments != null) {
                merged.addAll(segments);
            }
            for (Seg s : snapped) {
                if (!overlapsMs(merged, s.start, s.end)) {
                    merged.add(s);
                }
            }
            Collections.sort(merged, new Comparator<Seg>() {
                @Override
                public int compare(Seg a, Seg b) {
                    return Integer.compare(a.start, b.start);
                }
            });
            segments = merged;
            current = null;
            for (Seg s : merged) {
                Log.i(TAG, "final segment '" + s.name + "' " + s.start + "-" + s.end + "ms (source " + s.rule + ")");
            }
        }
        if (segments == null || segments.isEmpty()) {
            if (pillShown) hidePill(true);
            return;
        }

        int pos = p.getCurrentPosition();
        boolean playing = p.isPlaying();
        long elapsed = lastPos < 0 ? POLL_MS : now - lastAt;
        boolean jumped = lastPos >= 0 && (pos < lastPos - 750 || pos > lastPos + elapsed * 2.5 + 1000);
        lastPos = pos;
        lastAt = now;

        if (guardUntil != 0) {
            if (now < guardUntil && pos < guardTarget - 500) {
                if (pillShown) hidePill(true);
                return;
            }
            guardUntil = 0;
            jumped = false;
            // Our own seek just landed: the decoder is running, so a chained skip (recap, then intro) need not wait.
            if (playing) flowTicks = 4;
        }

        boolean recaps = VimuIntroSkipPrefs.isRecapsEnabled(f);
        boolean manualMode = VimuIntroSkipPrefs.isManualMode(f);
        boolean previewsOn = VimuIntroSkipPrefs.isPreviewsEnabled(f);
        String creditsMode = VimuIntroSkipPrefs.creditsMode(activity);
        boolean creditsOffPref = VimuIntroSkipPrefs.CREDITS_OFF.equals(creditsMode);

        Seg seg = null;
        for (Seg s : segments) {
            if (!recaps && s.recap()) continue;
            if (!previewsOn && s.preview()) continue;
            if (creditsOffPref && s.credits()) continue;
            if (pos >= s.start && pos < s.end - 400) {
                seg = s;
                break;
            }
        }
        if (seg != current) {
            current = seg;
            // Only a jump the USER made (seek key just before it, after 3 s of playback) is a
            // deliberate seek. Start/resume and the player's own repositioning still skip.
            boolean recentSeekKey = now - lastSeekKeyAt < 5000L && firstPlayingAt != 0
                    && now - firstPlayingAt > 3000L;
            currentByJump = seg != null && jumped;
            currentBySeek = (currentByJump && recentSeekKey)
                    || (seg != null && skipped.contains(seg.key()) && recentSeekKey)
                    || (seg != null && inheritSeek);
            if (seg != null) {
                Log.i(TAG, "enter '" + seg.name + "' pos=" + pos + "ms (start " + seg.start + ", late "
                        + (pos - seg.start) + "ms, " + (currentBySeek ? "user seek" : currentByJump
                        ? "player jump (start/resume)" : "playback") + ")");
            }
        }
        inheritSeek = false;

        // Seeking before the decoder is really producing frames (the position still sits on the
        // resume point) crashed ExoPlayer natively on the TV, so wait for 4 polls of steady advance.
        boolean flowing = flowTicks >= 4;
        boolean isCredits = seg != null && seg.credits();
        boolean isPreview = seg != null && seg.preview();
        boolean creditsOff = isCredits && VimuIntroSkipPrefs.CREDITS_OFF.equals(creditsMode);
        boolean previewsOff = isPreview && !previewsOn;
        boolean buttonOnly = (isCredits && VimuIntroSkipPrefs.CREDITS_BUTTON.equals(creditsMode))
                || previewsOff;
        boolean autoModeForSeg = isCredits
                ? VimuIntroSkipPrefs.CREDITS_AUTO.equals(creditsMode)
                : !manualMode && !previewsOff;
        boolean autoPending = seg != null && !creditsOff && !previewsOff && autoModeForSeg
                && !currentBySeek && !skipped.contains(seg.key());
        if (autoPending && playing && flowing) {
            hidePill(false);
            skip(f, p, seg, pos, true);
            return;
        }
        if (seg == null && playing) {
            // 200 ms polling would show up to 0.2 s of the intro: re-check right at its start.
            for (Seg s : segments) {
                if (!recaps && s.recap()) continue;
                if (!previewsOn && s.preview()) continue;
                if (creditsOffPref && s.credits()) continue;
                int ahead = s.start - pos;
                if (ahead > 0 && ahead <= POLL_MS + 50 && (manualMode || !skipped.contains(s.key()))) {
                    MAIN.removeCallbacks(precise);
                    MAIN.postDelayed(precise, Math.max(ahead + 10L, 15L));
                    break;
                }
            }
        }

        boolean shouldShowPill = seg != null && !creditsOff && !previewsOff && playing
                && (!autoModeForSeg || currentBySeek || buttonOnly) && !autoPending;
        if (shouldShowPill) {
            if (pillSegment != seg || !pillShown) {
                showButton(f, activity, seg);
            }
            refreshArmed(f, activity, now);
            updatePillPosition(f, activity);
        } else if (pillShown) {
            hidePill(true);
        }
    }

    // ---- On-screen "Skip intro (OK)" pill UI ----

    private void ensurePill(Activity activity) {
        if (pill != null || activity == null) return;
        try {
            View content = activity.findViewById(android.R.id.content);
            if (!(content instanceof FrameLayout)) {
                Window w = activity.getWindow();
                View decor = w == null ? null : w.getDecorView();
                content = decor instanceof FrameLayout ? decor : null;
            }
            if (!(content instanceof FrameLayout)) return;
            host = (FrameLayout) content;
            TextView tv = new TextView(activity);
            tv.setTextSize(TypedValue.COMPLEX_UNIT_SP, 15);
            tv.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            tv.setGravity(Gravity.CENTER);
            tv.setSingleLine(true);
            tv.setPadding(dp(activity, 22), dp(activity, 11), dp(activity, 22), dp(activity, 11));
            tv.setFocusable(false);
            tv.setFocusableInTouchMode(false);
            tv.setClickable(false);
            if (Build.VERSION.SDK_INT >= 16) {
                tv.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            }
            tv.setVisibility(View.GONE);
            tv.setAlpha(0f);
            if (Build.VERSION.SDK_INT >= 21) {
                tv.setElevation(dp(activity, 8));
            }
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.BOTTOM | Gravity.END);
            params.setMargins(0, 0, dp(activity, 48), dp(activity, 48));
            host.addView(tv, params);
            pill = tv;
        } catch (Throwable error) {
            Log.w(TAG, "ensurePill", error);
            pill = null;
        }
    }

    private void styleArmed(Activity activity, boolean isArmed) {
        if (pill == null || activity == null) return;
        try {
            if (isArmed) {
                pill.setBackground(roundedBackground(activity, 0xF2FFFFFF, 0x00FFFFFF, dp(activity, 6)));
                pill.setTextColor(0xFF15131A);
            } else {
                pill.setBackground(roundedBackground(activity, 0xCC17151C, 0x59FFFFFF, dp(activity, 6)));
                pill.setTextColor(0xFFF2F0F5);
            }
        } catch (Throwable error) {
            Log.w(TAG, "styleArmed", error);
        }
    }

    private void showButton(PlayerFragment f, Activity activity, Seg seg) {
        try {
            ensurePill(activity);
            if (pill == null) return;
            pillSegment = seg;
            armed = !controlsVisible(f) && SystemClock.uptimeMillis() - lastOtherKeyAt > 600L;
            pill.setText(seg.buttonText());
            styleArmed(activity, armed);
            fadeIn(f, activity);
            Log.i(TAG, "Button shown: " + seg.buttonText() + (armed ? " (OK = skip)" : " (OK to player)")
                    + (armed ? "" : " [" + controlsReason(f) + "]"));
        } catch (Throwable error) {
            Log.w(TAG, "showButton", error);
        }
    }

    private void refreshArmed(PlayerFragment f, Activity activity, long now) {
        try {
            boolean next = pillSegment != null && !controlsVisible(f) && now - lastOtherKeyAt > 600L;
            if (next != armed) {
                armed = next;
                styleArmed(activity, armed);
                Log.i(TAG, "Button " + (armed ? "armed (OK = skip)" : "disarmed (OK to player)"));
            }
        } catch (Throwable error) {
            Log.w(TAG, "refreshArmed", error);
        }
    }

    private void fadeIn(PlayerFragment f, Activity activity) {
        try {
            updatePillPosition(f, activity);
            if (!pillShown && pill != null) {
                pillShown = true;
                pill.animate().cancel();
                pill.setVisibility(View.VISIBLE);
                pill.animate().alpha(1f).setDuration(160L).start();
            }
        } catch (Throwable error) {
            Log.w(TAG, "fadeIn", error);
        }
    }

    private void hidePill(boolean animate) {
        armed = false;
        okDownConsumed = false;
        pillSegment = null;
        if (pill == null || !pillShown) return;
        pillShown = false;
        try {
            pill.animate().cancel();
            if (animate) {
                pill.animate().alpha(0f).setDuration(160L).withEndAction(new Runnable() {
                    @Override
                    public void run() {
                        try {
                            if (!pillShown && pill != null) pill.setVisibility(View.GONE);
                        } catch (Throwable ignored) {
                        }
                    }
                }).start();
            } else {
                pill.setAlpha(0f);
                pill.setVisibility(View.GONE);
            }
        } catch (Throwable error) {
            Log.w(TAG, "hidePill", error);
        }
    }

    private void removePill() {
        hidePill(false);
        try {
            if (host != null && pill != null) {
                host.removeView(pill);
            }
        } catch (Throwable ignored) {
        }
        pill = null;
        host = null;
    }

    private void updatePillPosition(PlayerFragment f, Activity activity) {
        if (pill == null || !pillShown || activity == null) return;
        try {
            float lift = controlsVisible(f) ? -dp(activity, 56) : 0f;
            if (pill.getTranslationY() != lift) {
                pill.animate().translationY(lift).setDuration(160L).start();
            }
        } catch (Throwable error) {
            Log.w(TAG, "updatePillPosition", error);
        }
    }

    /** True while Vimu's on-screen controls or a dialog overlay are visible. */
    private boolean controlsVisible(PlayerFragment f) {
        try {
            if (f == null) return false;
            Activity activity = f.getActivity();
            if (activity != null && !activity.hasWindowFocus()) {
                return true;
            }
            if (!controlsMethodLookedUp) {
                controlsMethodLookedUp = true;
                try {
                    controlsVisibleMethod = f.getClass().getMethod("isControlsOverlayVisible");
                } catch (Throwable ignored) {
                    controlsVisibleMethod = null;
                }
            }
            if (controlsVisibleMethod != null) {
                try {
                    // The player's own answer is authoritative; the view scan is only a fallback.
                    Object answer = controlsVisibleMethod.invoke(f);
                    if (answer instanceof Boolean) return ((Boolean) answer).booleanValue();
                } catch (Throwable ignored) {
                }
            }
            View root = null;
            try {
                Method getView = f.getClass().getMethod("getView");
                Object v = getView.invoke(f);
                if (v instanceof View) root = (View) v;
            } catch (Throwable ignored) {
            }
            if (root == null) root = host;
            return hasVisibleControlView(root);
        } catch (Throwable error) {
            return false;
        }
    }

    private String controlsReason(PlayerFragment f) {
        try {
            Activity activity = f.getActivity();
            if (activity != null && !activity.hasWindowFocus()) return "no window focus";
            if (controlsVisibleMethod != null) return "overlay method " + controlsVisibleMethod.invoke(f);
            Object v = f.getClass().getMethod("getView").invoke(f);
            return "view " + (v instanceof View ? visibleControl((View) v, 1f) : "null");
        } catch (Throwable error) {
            return "reason error " + error;
        }
    }

    private boolean hasVisibleControlView(View view) {
        return visibleControl(view, 1f) != null;
    }

    /**
     * Describes the first control view that is really on screen (own and inherited alpha, visibility
     * and clipping all count), or null. A hidden overlay keeps its children at alpha 1 inside a
     * transparent parent, so the parent's alpha must be accumulated.
     */
    private String visibleControl(View view, float parentAlpha) {
        if (view == null || view == pill) return null;
        float alpha = parentAlpha * view.getAlpha();
        if (view.getVisibility() != View.VISIBLE || alpha <= 0.05f) return null;
        boolean match = false;
        String why = null;
        if (view instanceof AbsSeekBar || view instanceof Button || view instanceof ImageButton
                || view instanceof AdapterView) {
            match = true;
            why = view.getClass().getName();
        } else {
            String cls = view.getClass().getSimpleName().toLowerCase(Locale.US);
            if (cls.contains("seekbar") || cls.contains("timebar") || cls.contains("recyclerview")
                    || cls.contains("controllerview") || cls.contains("playercontrol")) {
                match = true;
                why = view.getClass().getName();
            } else {
                int id = view.getId();
                // A named container is always present; only its visible children count.
                if (id != View.NO_ID && id != android.R.id.content && !(view instanceof ViewGroup)) {
                    try {
                        String name = view.getResources().getResourceEntryName(id).toLowerCase(Locale.US);
                        if (name.contains("seekbar") || name.contains("seek_bar") || name.contains("timebar")
                                || name.contains("control_panel") || name.contains("controls")
                                || name.contains("osd") || name.contains("controller")
                                || name.contains("transport") || name.contains("bottom_panel")
                                || name.contains("top_panel") || name.contains("info_panel")) {
                            match = true;
                            why = "id " + name;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }
        }
        if (match && view.getWidth() > 0 && view.getHeight() > 0
                && view.getGlobalVisibleRect(new android.graphics.Rect())) {
            return why + " alpha=" + alpha;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            int count = group.getChildCount();
            for (int i = 0; i < count; i++) {
                String found = visibleControl(group.getChildAt(i), alpha);
                if (found != null) return found;
            }
        }
        return null;
    }

    private static int dp(Activity activity, int value) {
        return (int) (value * activity.getResources().getDisplayMetrics().density + 0.5f);
    }

    private static GradientDrawable roundedBackground(Activity activity, int fillColor, int strokeColor, int radius) {
        GradientDrawable drawable = new GradientDrawable();
        drawable.setColor(fillColor);
        drawable.setCornerRadius(radius);
        drawable.setStroke(dp(activity, 1), strokeColor);
        return drawable;
    }

    // ---- Remote lookup: (1) AniSkip (AniList -> MAL id -> AniSkip), (2) IntroDB (Cinemeta -> IntroDB) ----

    private void startRemoteLookup(PlayerFragment f, final int durationMs) {
        Context appCtx = null;
        ParsedMedia parsed = null;
        try {
            Activity activity = f.getActivity();
            if (activity != null) {
                appCtx = activity.getApplicationContext();
                parsed = extractMediaFromIntent(activity.getIntent());
            }
        } catch (Throwable error) {
            Log.w(TAG, "remote intent parse", error);
        }
        if (parsed == null || parsed.title.length() == 0 || parsed.episode <= 0) {
            Log.i(TAG, "Remote lookup: no usable title/episode in the playing intent");
            return;
        }
        final ParsedMedia info = parsed;
        final Context ctx = appCtx;
        final int gen = mediaGen;
        final boolean animeEnabled = VimuIntroSkipPrefs.isAnimeEnabled(f);
        Log.i(TAG, "Media detected: title='" + info.title + "' S" + info.season + "E" + info.episode
                + (info.year != null ? " year=" + info.year : "") + " animeHint=" + info.looksLikeAnime
                + " (from '" + info.raw + "')");
        new Thread(new Runnable() {
            @Override
            public void run() {
                DEADLINE_MS.set(SystemClock.uptimeMillis() + LOOKUP_BUDGET_MS);
                try {
                    List<Seg> out = null;
                    if (animeEnabled) {
                        out = fetchAniSkip(ctx, info, durationMs);
                    } else {
                        Log.i(TAG, "AniSkip skipped: disabled in settings");
                    }
                    if ((out == null || out.isEmpty()) && gen == mediaGen) {
                        out = fetchIntroDb(ctx, info, durationMs);
                    }
                    if (gen == mediaGen && out != null && !out.isEmpty()) {
                        remote = out;
                    }
                } catch (Throwable error) {
                    Log.w(TAG, "Remote lookup failed: " + error);
                } finally {
                    DEADLINE_MS.remove();
                }
            }
        }, "IntroSkipRemote").start();
    }

    /**
     * True when the playing intent identifies an episode: SxxEyy, 1x05, Episode 5 / Ep 05, the
     * anime " - 05 " style (all via parseCandidate), or a season/episode passed as extras.
     * Anything else is treated as a movie.
     */
    private static boolean isEpisodeIntent(Intent intent) {
        if (intent == null) return false;
        syncHandoff(intent);
        // Stremio's own answer wins over filename parsing: a series stays a series even when
        // the file name carries no episode marker ("Frieren - Beyond Journey's End 02.mkv").
        if (extHaveMedia) {
            if (isSeriesType(extMediaType)) return true;
            if (extEpisode > 0) return true;
            return false;
        }
        try {
            if (extractMediaFromIntent(intent) != null) return true;
            Uri data = intent.getData();
            if (data != null) {
                String type = data.getQueryParameter("media_type");
                if (type != null) {
                    type = type.trim().toLowerCase(Locale.US);
                    if (type.equals("series") || type.equals("tv") || type.equals("show") || type.equals("anime")) {
                        return true;
                    }
                }
            }
            Bundle extras = intent.getExtras();
            if (extras != null) {
                for (String key : new String[]{"season", "episode", "episode_number", "episodeNumber",
                        "season_number", "seasonNumber"}) {
                    Object v = extras.get(key);
                    if (v instanceof Number && ((Number) v).intValue() > 0) return true;
                    if (v instanceof String && safeParseInt(((String) v).trim(), -1) > 0) return true;
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "isEpisodeIntent", error);
        }
        return false;
    }

    private static String describeIntent(Intent intent) {
        StringBuilder out = new StringBuilder();
        try {
            if (intent == null) return "null";
            Uri data = intent.getData();
            out.append("path=").append(data == null ? "" : urlDecode(String.valueOf(data.getLastPathSegment())));
            Bundle extras = intent.getExtras();
            if (extras != null) {
                for (String key : extras.keySet()) {
                    String v = String.valueOf(extras.get(key));
                    out.append(" | ").append(key).append('=').append(v.length() > 80 ? v.substring(0, 80) : v);
                }
            }
        } catch (Throwable error) {
            out.append(" error ").append(error);
        }
        return out.toString();
    }

    /** Media identity handed over by Stremio, used before any filename parsing. */
    private static ParsedMedia handedMedia() {
        if (!extHaveMedia) return null;
        if (extEpisode > 0 && (extTitle.length() > 0 || extImdbId.length() > 0)) {
            String title = extTitle.length() > 0 ? extTitle : extImdbId;
            ParsedMedia media = new ParsedMedia(title, extSeason > 0 ? extSeason : 1,
                    extEpisode, null, false, "stremio-extra");
            if (extImdbId.startsWith("tt")) {
                media.imdbId = extImdbId;
            }
            return media;
        }
        return null;
    }

    private static ParsedMedia extractMediaFromIntent(Intent intent) {
        if (intent == null) return null;
        syncHandoff(intent);
        ParsedMedia handed = handedMedia();
        if (handed != null) return handed;
        List<String> candidates = new ArrayList<>();
        try {
            for (String key : new String[]{"title", "forcename", "name", "filename", "file_name", "video_title"}) {
                String val = intent.getStringExtra(key);
                if (val != null && val.trim().length() > 0) candidates.add(val.trim());
            }
            Uri uri = intent.getData();
            if (uri != null) {
                for (String key : new String[]{"title", "name", "filename", "file", "torrentName", "torrent_name"}) {
                    try {
                        String q = uri.getQueryParameter(key);
                        if (q != null && q.trim().length() > 0) candidates.add(q.trim());
                    } catch (Throwable ignored) {
                    }
                }
                List<String> segments = uri.getPathSegments();
                if (segments != null) {
                    for (int i = segments.size() - 1; i >= 0; i--) {
                        String seg = segments.get(i);
                        if (seg != null && seg.trim().length() > 0) candidates.add(seg.trim());
                    }
                }
            }
            Bundle extras = intent.getExtras();
            if (extras != null) {
                for (String key : extras.keySet()) {
                    Object v = extras.get(key);
                    if (v instanceof String) {
                        String s = ((String) v).trim();
                        if (s.length() > 0 && !candidates.contains(s)) candidates.add(s);
                    }
                }
            }
        } catch (Throwable error) {
            Log.w(TAG, "extractMediaFromIntent", error);
        }
        ParsedMedia fallback = null;
        for (String raw : candidates) {
            ParsedMedia m = parseCandidate(raw);
            if (m != null && m.title.length() > 0 && m.episode > 0) {
                if (m.looksLikeAnime) {
                    m.imdbId = findImdbId(candidates);
                    return m;
                }
                if (fallback == null) fallback = m;
            }
        }
        if (fallback != null) fallback.imdbId = findImdbId(candidates);
        return fallback;
    }

    /** First IMDb id (tt1234567 style) found in the playing intent, or null. */
    private static String findImdbId(List<String> candidates) {
        if (candidates == null) return null;
        for (String raw : candidates) {
            if (raw == null) continue;
            Matcher matcher = IMDB_ID.matcher(raw);
            if (matcher.find()) return matcher.group(1).toLowerCase(Locale.US);
        }
        return null;
    }

    /**
     * Parses release names like:
     * - "[sam] Ginga Eiyuu Densetsu - Die Neue These - 08 [BD 1080p HEVC].mkv"
     * - "[SubsPlease] Frieren - 05 (1080p).mkv"
     * - "Show S01E05" / "Show.2023.S01E05.1080p.WEB-DL.mkv"
     */
    private static ParsedMedia parseCandidate(String input) {
        if (input == null) return null;
        String decoded = urlDecode(input).trim();
        if (decoded.length() == 0 || decoded.startsWith("http://") || decoded.startsWith("https://")) {
            int slash = decoded.lastIndexOf('/');
            if (slash >= 0 && slash + 1 < decoded.length()) decoded = decoded.substring(slash + 1);
        }
        String work = FILE_EXT.matcher(decoded).replaceAll("").trim();
        if (work.length() == 0) return null;

        boolean animeHint = LEADING_GROUP.matcher(work).find() || CRC_HASH.matcher(work).find();
        String year = null;
        Matcher yp = YEAR_PAREN.matcher(work);
        if (yp.find()) year = yp.group(1);

        // Strip [group], [BD 1080p HEVC], [ABCD1234], and (1080p) tags
        work = BRACKET_TAG.matcher(work).replaceAll(" ");
        work = PAREN_META.matcher(work).replaceAll(" ");
        work = YEAR_PAREN.matcher(work).replaceAll(" ");
        work = work.replaceAll("\\(\\s*\\)", " ").replaceAll("\\s+", " ").trim();

        int season = 1;
        int episode = -1;
        String rawTitle = null;

        // 1) S01E05 / s1e5
        Matcher sxe = SXXEYY.matcher(work);
        if (sxe.find()) {
            season = safeParseInt(sxe.group(1), 1);
            episode = safeParseInt(sxe.group(2), -1);
            rawTitle = work.substring(0, sxe.start());
        }

        // 2) S2 - 05 / Season 2 - 05
        if (episode <= 0) {
            Matcher sdash = SXX_DASH_EP.matcher(work);
            if (sdash.find()) {
                season = safeParseInt(sdash.group(1), 1);
                episode = safeParseInt(sdash.group(2), -1);
                rawTitle = work.substring(0, sdash.start());
                animeHint = true;
            }
        }

        // 3) 1x05
        if (episode <= 0) {
            Matcher nxn = NXNN.matcher(work);
            if (nxn.find()) {
                season = safeParseInt(nxn.group(1), 1);
                episode = safeParseInt(nxn.group(2), -1);
                rawTitle = work.substring(0, nxn.start());
            }
        }

        // Strip unbracketed trailing tech tokens before anime dash / trailing episode matching
        String strippedTech = TRAILING_TECH.matcher(work).replaceAll("").trim();
        if (strippedTech.length() == 0) strippedTech = work;

        // 4) Anime dash pattern: "Ginga Eiyuu Densetsu - Die Neue These - 08" or "Frieren - 05"
        if (episode <= 0) {
            String spaced = strippedTech.replace('_', ' ');
            // Match the LAST " - <ep>" by using greedy (.+) on the left
            Matcher animeDash = Pattern.compile(
                    "(?i)^(.+)\\s+[-\u2013\u2014]+\\s*(?:Ep(?:isode)?\\.?\\s*)?(\\d{1,4})(?:v\\d+)?(?:\\s*[-\u2013\u2014]+\\s*[^\\d].*)?$")
                    .matcher(spaced);
            if (!animeDash.matches()) {
                animeDash = ANIME_DASH_EP.matcher(spaced);
            }
            if (animeDash.matches()) {
                int ep = safeParseInt(animeDash.group(2), -1);
                if (ep > 0 && ep < 1900) {
                    rawTitle = animeDash.group(1);
                    episode = ep;
                    animeHint = true;
                }
            }
        }

        // 5) Explicit "Episode 05" / "Ep 05"
        if (episode <= 0) {
            String spaced = strippedTech.replace('.', ' ').replace('_', ' ');
            Matcher exp = EXPLICIT_EP.matcher(spaced);
            if (exp.matches()) {
                int ep = safeParseInt(exp.group(2), -1);
                if (ep > 0 && ep < 1900) {
                    rawTitle = exp.group(1);
                    episode = ep;
                }
            }
        }

        // 6) Trailing episode number when anime group/hash hint is present: "[Group] Show Name 05"
        if (episode <= 0 && animeHint) {
            String spaced = strippedTech.replace('_', ' ').replace('.', ' ').replaceAll("\\s+", " ").trim();
            Matcher trail = TRAILING_EP.matcher(spaced);
            if (trail.matches()) {
                int ep = safeParseInt(trail.group(2), -1);
                if (ep > 0 && ep < 1900) {
                    rawTitle = trail.group(1);
                    episode = ep;
                }
            }
        }

        if (episode <= 0 || rawTitle == null) return null;

        // Clean up the extracted title
        String clean = rawTitle.replace('_', ' ').replace('.', ' ');
        if (year == null) {
            Matcher yt = YEAR_TOKEN.matcher(clean);
            if (yt.find()) year = yt.group(1);
        }
        clean = YEAR_TOKEN.matcher(clean).replaceAll(" ");

        // Extract inline season indicator from title if season is still 1 (e.g., "Show Season 2")
        Matcher ts = TITLE_SEASON.matcher(clean);
        if (ts.find()) {
            int foundSeason = safeParseInt(
                    ts.group(1) != null ? ts.group(1) : ts.group(2) != null ? ts.group(2) : ts.group(3), 1);
            if (season == 1 && foundSeason > 0) season = foundSeason;
            clean = clean.substring(0, ts.start()) + " " + clean.substring(ts.end());
        }
        if (season == 1) {
            int marker = seasonMarker(clean);
            if (marker > 1) {
                season = marker;
                clean = CANDIDATE_SEASON.matcher(clean.trim()).replaceAll(" ");
            }
        }

        clean = clean.replaceAll("^\\s*[-\u2013\u2014:]+\\s*", "")
                .replaceAll("\\s*[-\u2013\u2014:]+\\s*$", "")
                .replaceAll("\\s+", " ")
                .trim();
        if (clean.length() < 2 || !clean.matches(".*\\p{L}.*")) return null;
        return new ParsedMedia(clean, season, episode, year, animeHint, decoded);
    }

    private static List<Seg> fetchAniSkip(Context ctx, ParsedMedia info, int durationMs) {
        List<Seg> out = new ArrayList<>();
        try {
            int[] mapped = resolveMalId(ctx, info.title, info.season, info.episode, info.looksLikeAnime);
            int malId = mapped[0];
            int episode = mapped[1];
            if (malId <= 0) {
                Log.i(TAG, "AniSkip: no confident MAL id for '" + info.title + "'");
                return out;
            }
            if (episode != info.episode) {
                Log.i(TAG, "AniList: episode " + info.episode + " mapped to episode " + episode + " of part 2");
            }
            Log.i(TAG, "AniList: chosen idMal=" + malId + " episode=" + episode);

            long episodeLengthSec = durationMs > 0 ? Math.round(durationMs / 1000.0) : 0L;
            JSONArray results = queryAniSkip(malId, episode, Math.max(0L, episodeLengthSec));
            if ((results == null || results.length() == 0) && episodeLengthSec > 0) {
                Log.i(TAG, "AniSkip: no submissions for length " + episodeLengthSec + "s, retrying with episodeLength=0");
                results = queryAniSkip(malId, episode, 0L);
            }
            if (results == null || results.length() == 0) {
                Log.i(TAG, "AniSkip: 0 submissions for malId=" + malId + " ep=" + episode);
                return out;
            }

            List<AniSkipCandidate> candidates = new ArrayList<>();
            for (int i = 0; i < results.length(); i++) {
                JSONObject item = results.optJSONObject(i);
                if (item == null) continue;
                JSONObject interval = item.optJSONObject("interval");
                if (interval == null) continue;
                double startSec = interval.optDouble("startTime", -1.0);
                double endSec = interval.optDouble("endTime", -1.0);
                if (startSec < 0.0 || endSec <= startSec || endSec - startSec > 600.0) continue;
                String type = item.optString("skipType", "").toLowerCase(Locale.US);
                if (!"op".equals(type) && !"recap".equals(type)) continue;
                double theirLen = item.optDouble("episodeLength", 0.0);
                double diff = (episodeLengthSec > 0 && theirLen > 0)
                        ? Math.abs(theirLen - episodeLengthSec) : Double.MAX_VALUE;
                int startMs = (int) Math.round(startSec * 1000.0);
                int endMs = (int) Math.round(endSec * 1000.0);
                candidates.add(new AniSkipCandidate(
                        startMs, endMs, "recap".equals(type) ? "Recap" : "OP", theirLen, diff));
            }

            // Choose the submission whose episodeLength best matches the real duration; prefer OP over Recap on ties
            Collections.sort(candidates, new Comparator<AniSkipCandidate>() {
                @Override
                public int compare(AniSkipCandidate a, AniSkipCandidate b) {
                    boolean aOp = "OP".equals(a.name);
                    boolean bOp = "OP".equals(b.name);
                    if (aOp != bOp) return aOp ? -1 : 1;
                    return Double.compare(a.lengthDiffSec, b.lengthDiffSec);
                }
            });

            StringBuilder summary = new StringBuilder();
            for (AniSkipCandidate c : candidates) {
                if (overlapsMs(out, c.startMs, c.endMs)) continue;
                out.add(new Seg(c.startMs, c.endMs, c.name, "aniskip"));
                summary.append(" [").append(c.name).append(' ').append(c.startMs).append('-').append(c.endMs)
                        .append("ms len=").append(fmt1(c.theirLengthSec)).append("s diff=")
                        .append(c.lengthDiffSec < Double.MAX_VALUE ? fmt1(c.lengthDiffSec) + "s" : "?").append(']');
            }
            Collections.sort(out, new Comparator<Seg>() {
                @Override
                public int compare(Seg a, Seg b) {
                    return Integer.compare(a.start, b.start);
                }
            });
            Log.i(TAG, "AniSkip response: raw=" + results.length() + " kept=" + out.size()
                    + " (ourDuration=" + episodeLengthSec + "s)" + summary);
        } catch (Throwable error) {
            Log.w(TAG, "AniSkip lookup failed: " + error);
        }
        return out;
    }

    private static JSONArray queryAniSkip(int malId, int episode, long episodeLengthSec) throws Exception {
        String url = ANISKIP_URL + malId + "/" + episode
                + "?types=op&types=recap&episodeLength=" + episodeLengthSec;
        String resp = http("GET", url, null, null);
        if (resp == null || resp.length() == 0) return null;
        return new JSONObject(resp).optJSONArray("results");
    }

    /**
     * Resolves title + season + episode to {malId, mappedEpisode} via AniList GraphQL with
     * candidate scoring, caching the title -> MAL id mapping in memory and SharedPreferences for 60 days.
     */
    private static int[] resolveMalId(Context ctx, String title, int season, int episode, boolean looksLikeAnime)
            throws Exception {
        title = stripYearRange(title);
        int wanted = season > 0 ? season : 1;
        boolean wantedPart2 = PART_TWO.matcher(title).find();
        String cleanTitle = PART_TWO.matcher(title).replaceAll(" ").replaceAll("\\s+", " ").trim();
        if (cleanTitle.length() == 0) cleanTitle = title;
        String base = normTitle(cleanTitle);
        String cacheKey = base + "|s" + wanted + "|a" + (looksLikeAnime ? 1 : 0) + (wantedPart2 ? "|p2" : "");

        int[] cached = getCachedMal(ctx, cacheKey, episode);
        if (cached != null) {
            return cached;
        }

        List<String> searches = new ArrayList<>();
        String spaced = cleanTitle.replaceAll(":(?=\\S)", ": ");
        if (wantedPart2) {
            searches.add(title.replaceAll(":(?=\\S)", ": "));
        }
        searches.add(spaced);
        if (wanted > 1) {
            searches.add(spaced + " " + ordinalSeason(wanted) + " Season");
            searches.add(spaced + " Season " + wanted);
        }

        Set<Integer> seen = new HashSet<>();
        int bestId = 0;
        double bestScore = -9.0;
        double bestSimilarity = 0.0;
        int bestEpisodes = 0;
        boolean bestIsPart2 = false;
        int part1Episodes = 0;
        double part1Similarity = 0.0;
        StringBuilder report = new StringBuilder();

        for (String search : searches) {
            Log.i(TAG, "AniList: search = '" + search + "'");
            JSONObject variables = new JSONObject().put("search", search);
            JSONObject body = new JSONObject()
                    .put("query", "query ($search: String) { Page(perPage: 10) { media(search: $search, type: ANIME) "
                            + "{ idMal format episodes title { romaji english native } synonyms } } }")
                    .put("variables", variables);
            String rawResp = http("POST", ANILIST_URL, body.toString(), null);
            JSONObject response = new JSONObject(rawResp);
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
                        if (!titles.isNull(key)) {
                            String t = titles.optString(key, "");
                            if (t != null && t.length() > 0) names.add(t);
                        }
                    }
                }
                JSONArray synonyms = m.optJSONArray("synonyms");
                for (int j = 0; synonyms != null && j < synonyms.length(); j++) {
                    String syn = synonyms.optString(j, "");
                    if (syn != null && syn.length() > 0) names.add(syn);
                }

                double similarity = 0.0;
                int candidateSeason = 1;
                boolean part2 = false;
                for (String name : names) {
                    candidateSeason = Math.max(candidateSeason, seasonMarker(name));
                    part2 |= PART_TWO.matcher(name).find();
                    String stripped = CANDIDATE_SEASON.matcher(name.trim()).replaceAll(" ");
                    String plain = normTitle(stripped);
                    similarity = Math.max(similarity, dice(base, plain));
                    String plainNoPart = normTitle(PART_TWO.matcher(stripped).replaceAll(" "));
                    similarity = Math.max(similarity, dice(base, plainNoPart) - (part2 == wantedPart2 ? 0.0 : 0.12));
                }

                String format = m.optString("format", "");
                double score = similarity + (candidateSeason == wanted ? 0.3 : -0.5)
                        + ("TV".equals(format) ? 0.1 : "TV_SHORT".equals(format) || "ONA".equals(format) ? -0.05 : -0.3);
                if (wantedPart2) {
                    score += part2 ? 0.15 : -0.15;
                }
                int episodes = m.isNull("episodes") ? 0 : m.optInt("episodes", 0);
                if (episodes > 0 && episode > episodes) score -= 0.4;

                report.append("\n  idMal=").append(malId).append(' ').append(format)
                        .append(" season=").append(candidateSeason).append(" eps=").append(episodes)
                        .append(" sim=").append(fmt1(similarity * 100.0)).append("% score=")
                        .append(fmt1(score * 100.0)).append(" '")
                        .append(names.isEmpty() ? "" : names.get(0)).append('\'');

                // Split-cour shows: catalogs number cour 2 on from 13; AniSkip numbers it from 1.
                if (!part2 && candidateSeason == wanted && "TV".equals(format) && similarity > part1Similarity) {
                    part1Similarity = similarity;
                    part1Episodes = episodes;
                }
                if (score > bestScore) {
                    bestScore = score;
                    bestSimilarity = similarity;
                    bestId = malId;
                    bestEpisodes = episodes;
                    bestIsPart2 = part2;
                }
            }
            if (bestScore >= 1.3) break;
        }

        Log.i(TAG, "AniList candidates:" + (report.length() == 0 ? " <none>" : report)
                + "\n  -> bestId=" + bestId + " (score=" + fmt1(bestScore * 100.0)
                + ", sim=" + fmt1(bestSimilarity * 100.0) + "%, animeHint=" + looksLikeAnime + ")");

        // Confidence check: anime-styled filenames accept score >= 0.60; generic SxxEyy filenames
        // require a high-confidence title & format match so western shows fall through to IntroDB.
        double minScore = looksLikeAnime ? 0.60 : 0.95;
        double minSim = looksLikeAnime ? 0.50 : 0.85;
        if (bestId <= 0 || bestScore < minScore || bestSimilarity < minSim) {
            return new int[]{0, episode};
        }

        int offset = (bestIsPart2 && part1Episodes > 0 && episode > part1Episodes) ? part1Episodes : 0;
        String cacheKeyToStore = offset > 0 ? (cacheKey + "|ep>" + part1Episodes) : cacheKey;
        putCachedMal(ctx, cacheKeyToStore, bestId, bestEpisodes, offset);
        if (offset > 0) {
            // Also record the part1 boundary on the base key so future episodes know where part 2 starts
            putCachedMal(ctx, cacheKey, bestId, part1Episodes, -1);
        }
        return new int[]{bestId, episode - offset};
    }

    private static int[] getCachedMal(Context ctx, String key, int episode) {
        String raw = getRawCacheEntry(ctx, key);
        if (raw == null) return null;
        int[] parsed = parseCacheEntry(raw);
        if (parsed == null) return null;
        int malId = parsed[0];
        int maxEps = parsed[1];
        int offset = parsed[2];
        if (offset < 0 || (maxEps > 0 && episode > maxEps)) {
            String part2Raw = getRawCacheEntry(ctx, key + "|ep>" + maxEps);
            if (part2Raw == null) return null;
            int[] p2 = parseCacheEntry(part2Raw);
            if (p2 == null) return null;
            Log.i(TAG, "AniList cache hit (part 2) for '" + key + "' -> idMal=" + p2[0]);
            return new int[]{p2[0], Math.max(1, episode - Math.max(0, p2[2]))};
        }
        Log.i(TAG, "AniList cache hit for '" + key + "' -> idMal=" + malId);
        return new int[]{malId, Math.max(1, episode - Math.max(0, offset))};
    }

    private static String getRawCacheEntry(Context ctx, String key) {
        long now = System.currentTimeMillis();
        String mem = MAL_CACHE.get(key);
        if (mem != null) {
            int[] p = parseCacheEntryWithTtl(mem, now);
            if (p != null) return mem;
            MAL_CACHE.remove(key);
        }
        if (ctx == null) return null;
        try {
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            String stored = prefs.getString("mal:" + key, null);
            if (stored != null) {
                if (parseCacheEntryWithTtl(stored, now) != null) {
                    MAL_CACHE.put(key, stored);
                    return stored;
                }
                prefs.edit().remove("mal:" + key).apply();
            }
        } catch (Throwable error) {
            Log.w(TAG, "cache read", error);
        }
        return null;
    }

    private static int[] parseCacheEntry(String entry) {
        return parseCacheEntryWithTtl(entry, System.currentTimeMillis());
    }

    private static int[] parseCacheEntryWithTtl(String entry, long nowMs) {
        try {
            String[] parts = entry.split(",");
            if (parts.length < 4) return null;
            int malId = Integer.parseInt(parts[0]);
            int maxEps = Integer.parseInt(parts[1]);
            int offset = Integer.parseInt(parts[2]);
            long savedAt = Long.parseLong(parts[3]);
            if (malId <= 0 || nowMs - savedAt > CACHE_TTL_MS) return null;
            return new int[]{malId, maxEps, offset};
        } catch (Throwable ignored) {
            return null;
        }
    }

    private static void putCachedMal(Context ctx, String key, int malId, int maxEpisodes, int offset) {
        if (malId <= 0) return;
        String value = malId + "," + maxEpisodes + "," + offset + "," + System.currentTimeMillis();
        MAL_CACHE.put(key, value);
        if (ctx == null) return;
        try {
            SharedPreferences prefs = ctx.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
            prefs.edit().putString("mal:" + key, value).apply();
        } catch (Throwable error) {
            Log.w(TAG, "cache write", error);
        }
    }

    /**
     * Keyless IntroDB lookup: an IMDb id from the playing intent when one is present,
     * else a Cinemeta title search (exact normalized match, remembered for 60 days),
     * then TheIntroDB by imdb_id + season/episode (duration_ms sent when known),
     * retrying a miss by tvdb_id and then tmdb_id (ids from a keyless Cinemeta meta
     * lookup, cached per show), then IntroDB.app but only for segment types
     * TheIntroDB has nothing for. No API keys are used.
     */
    private static List<Seg> fetchIntroDb(Context ctx, ParsedMedia info, int durationMs) {
        List<Seg> out = new ArrayList<Seg>();
        try {
            String id = info.imdbId;
            if (id == null || id.length() == 0) {
                id = cinemetaImdbId(ctx, info.title);
            }
            if (id == null || id.length() == 0) {
                Log.i(TAG, "IntroDB skipped: no IMDb id found for '" + info.title + "'");
                return out;
            }
            Log.i(TAG, "IntroDB: looking up imdb=" + id + " S" + info.season + "E" + info.episode);
            String tvdbId = "";
            String tmdbId = "";
            if (isImdbId(id)) {
                String[] ids = cinemetaIds(ctx, id);
                tvdbId = ids[0];
                tmdbId = ids[1];
            }
            JSONObject body = theIntroDbQuery(id, tvdbId, tmdbId, info.season, info.episode, durationMs);
            // Process "intro" before "recap" so a recap can never suppress an overlapping intro.
            String[] kinds = {"intro", "recap", "credits"};
            for (int k = 0; k < kinds.length; k++) {
                String kind = kinds[k];
                JSONArray items = body.optJSONArray(kind);
                for (int i = 0; items != null && i < items.length(); i++) {
                    JSONObject item = items.getJSONObject(i);
                    // Reject incomplete intro/recap entries with null start_ms (would fabricate 0.0s).
                    if (item.isNull("start_ms") && ("intro".equals(kind) || "recap".equals(kind))) {
                        Log.i(TAG, "IntroDB: skipped " + kind + " with null start_ms");
                        continue;
                    }
                    int start = item.isNull("start_ms") ? 0 : item.optInt("start_ms", -1);
                    int end = item.isNull("end_ms") ? -1 : item.optInt("end_ms", -1);
                    if ("recap".equals(kind) && start <= 500) {
                        Log.i(TAG, "IntroDB: skipped 0:00 recap (" + start + "ms)");
                        continue;
                    }
                    // An entry with no end, or longer than 10 min, would skip the episode itself.
                    if (start < 0 || end <= start || end - start > 600000) continue;
                    if (overlapsMs(out, start, end)) continue;
                    String name = "recap".equals(kind) ? "Recap" : "credits".equals(kind) ? "Credits" : "Intro";
                    out.add(new Seg(start, end, name, "introdb"));
                }
            }
            // IntroDB.app fills only the segment types TheIntroDB has nothing for,
            // and evicts a mislabeled early "Credits" overlapping its Intro.
            if (isImdbId(id) && info.season > 0 && info.episode > 0
                    && !(hasSegType(out, "Intro") && hasSegType(out, "Recap") && hasSegType(out, "Credits"))) {
                for (Seg app : fetchIntroDbApp(id, info.season, info.episode)) {
                    if ("Intro".equals(app.name)) {
                        for (int i = out.size() - 1; i >= 0; i--) {
                            Seg existing = out.get(i);
                            if ("Intro".equals(existing.name) && existing.start <= 500 && app.start > 5000) {
                                Log.i(TAG, "IntroDB.app: replacing 0:00 IntroDB Intro with mid-episode Intro "
                                        + app.start + "-" + app.end + "ms");
                                out.remove(i);
                            } else if ("Credits".equals(existing.name)
                                    && Math.min(existing.end, app.end)
                                    - Math.max(existing.start, app.start) > 1000) {
                                Log.i(TAG, "IntroDB.app: replacing overlapping IntroDB credits ("
                                        + existing.start + "-" + existing.end
                                        + "ms) with Intro " + app.start + "-" + app.end + "ms");
                                out.remove(i);
                            }
                        }
                    }
                    if (hasSegType(out, app.name)) {
                        Log.i(TAG, "IntroDB.app: skipped " + app.name + ", TheIntroDB already has it");
                        continue;
                    }
                    if (overlapsMs(out, app.start, app.end)) continue;
                    out.add(app);
                }
            }
            // If TheIntroDB mislabeled an opening sequence in the first 40% as "Credits"
            // with no separate Intro anywhere, promote it to Intro.
            if (!hasSegType(out, "Intro")) {
                double maxIntroStart = durationMs > 0 ? durationMs * 0.40 : 300000.0;
                for (int i = 0; i < out.size(); i++) {
                    Seg s = out.get(i);
                    if ("Credits".equals(s.name) && s.start < maxIntroStart
                            && (durationMs <= 0 || s.end < durationMs * 0.5)) {
                        out.set(i, new Seg(s.start, s.end, "Intro", s.rule));
                        Log.i(TAG, "IntroDB: promoted early credits (" + s.start + "-" + s.end + "ms) to Intro");
                        break;
                    }
                }
            }
            // SkipDB fills only the segment types neither source has (previews included).
            if (isImdbId(id) && info.season > 0 && info.episode > 0
                    && !(hasSegType(out, "Intro") && hasSegType(out, "Recap") && hasSegType(out, "Credits")
                    && hasSegType(out, "Preview"))) {
                for (Seg s : fetchSkipDb(id, info.season, info.episode, durationMs)) {
                    if (hasSegType(out, s.name)) {
                        continue;
                    }
                    if (overlapsMs(out, s.start, s.end)) continue;
                    out.add(s);
                }
            }
            Collections.sort(out, new Comparator<Seg>() {
                @Override
                public int compare(Seg a, Seg b) {
                    return Integer.compare(a.start, b.start);
                }
            });
            Log.i(TAG, "IntroDB: imdb=" + id + " S" + info.season + "E" + info.episode
                    + " -> " + out.size() + " segment(s)");
        } catch (Throwable error) {
            Log.w(TAG, "IntroDB lookup failed: " + error);
        }
        return out;
    }

    private static boolean isImdbId(String id) {
        return id != null && id.regionMatches(true, 0, "tt", 0, 2);
    }

    private static boolean hasSegType(List<Seg> segs, String name) {
        for (Seg s : segs) {
            if (s.name.equals(name)) return true;
        }
        return false;
    }

    /**
     * TheIntroDB with multi-identity fallback: imdb_id first, then tvdb_id, then
     * tmdb_id. A query counts as a miss when it answers 204/404, carries an error,
     * or holds no segment of any kind; duration_ms is sent whenever it is known.
     */
    private static JSONObject theIntroDbQuery(String imdbId, String tvdbId, String tmdbId,
                                              int season, int episode, int durationMs) throws Exception {
        StringBuilder suffix = new StringBuilder();
        if (season > 0 && episode > 0) {
            suffix.append("&season=").append(season).append("&episode=").append(episode);
        }
        if (durationMs > 0) suffix.append("&duration_ms=").append(durationMs);
        String[][] identities = new String[][]{
            {"imdb_id", safe(imdbId)}, {"tvdb_id", safe(tvdbId)}, {"tmdb_id", safe(tmdbId)}};
        JSONObject last = null;
        for (int i = 0; i < identities.length; i++) {
            String name = identities[i][0];
            String value = identities[i][1];
            if (value.length() == 0) continue;
            Log.i(TAG, "IntroDB: lookup by " + name + " = " + value);
            JSONObject response = new JSONObject(http("GET", INTRODB_URL + "?" + name + "=" + value + suffix,
                    null, null));
            if (hasAnySegment(response)) return response;
            Log.i(TAG, "IntroDB: no segments for " + name + " = " + value + ", trying next identity");
            last = response;
        }
        return last == null ? new JSONObject() : last;
    }

    private static boolean hasAnySegment(JSONObject response) {
        if (response == null) return false;
        if (response.has("error")) return false;
        String[] kinds = {"intro", "recap", "credits", "preview"};
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
    private static String[] cinemetaIds(Context ctx, String imdbId) {
        String[] empty = new String[]{"", ""};
        String wanted = safe(imdbId).trim();
        if (wanted.length() == 0) return empty;
        String tvdbKey = "ids-tvdb:" + wanted;
        String tmdbKey = "ids-tmdb:" + wanted;
        String[] cached = cachedIds(ctx, tvdbKey, tmdbKey, wanted);
        if (cached != null) return cached;
        // One request per show: the lookup runs once per media, but stay safe.
        synchronized (CINEMETA_LOCK) {
            cached = cachedIds(ctx, tvdbKey, tmdbKey, wanted);
            if (cached != null) return cached;
            return cinemetaIdsRequest(ctx, tvdbKey, tmdbKey, wanted);
        }
    }

    /** Session cache (hits and misses), then the stored 60-day hit cache; null = not cached. */
    private static String[] cachedIds(Context ctx, String tvdbKey, String tmdbKey, String wanted) {
        String tvdb = CINEMETA_IDS_CACHE.get(tvdbKey);
        String tmdb = CINEMETA_IDS_CACHE.get(tmdbKey);
        if (tvdb != null && tmdb != null) {
            Log.i(TAG, "Cinemeta: ids cache hit for \"" + wanted + "\" -> tvdb="
                    + (tvdb.length() > 0 ? tvdb : "<none>") + " tmdb=" + (tmdb.length() > 0 ? tmdb : "<none>"));
            return new String[]{tvdb, tmdb};
        }
        String storedTvdb = VimuIntroSkipPrefs.cachedImdb(ctx, tvdbKey);
        String storedTmdb = VimuIntroSkipPrefs.cachedImdb(ctx, tmdbKey);
        if (storedTvdb.length() > 0 || storedTmdb.length() > 0) {
            CINEMETA_IDS_CACHE.put(tvdbKey, storedTvdb);
            CINEMETA_IDS_CACHE.put(tmdbKey, storedTmdb);
            Log.i(TAG, "Cinemeta: ids cache hit (stored) for \"" + wanted + "\" -> tvdb="
                    + (storedTvdb.length() > 0 ? storedTvdb : "<none>")
                    + " tmdb=" + (storedTmdb.length() > 0 ? storedTmdb : "<none>"));
            return new String[]{storedTvdb, storedTmdb};
        }
        return null;
    }

    private static String[] cinemetaIdsRequest(Context ctx, String tvdbKey, String tmdbKey, String wanted) {
        String[] empty = new String[]{"", ""};
        try {
            JSONObject response = new JSONObject(http("GET", CINEMETA_META_SERIES_URL + wanted + ".json",
                    null, null));
            JSONObject meta = response.optJSONObject("meta");
            if (meta == null) {
                Log.i(TAG, "Cinemeta: no meta for \"" + wanted + "\"");
                CINEMETA_IDS_CACHE.put(tvdbKey, "");
                CINEMETA_IDS_CACHE.put(tmdbKey, "");
                return empty;
            }
            String tvdb = idText(meta, "tvdb_id");
            String tmdb = idText(meta, "moviedb_id");
            if (tmdb.length() == 0) tmdb = idText(meta, "tmdb_id");
            Log.i(TAG, "Cinemeta: ids for \"" + wanted + "\" -> tvdb="
                    + (tvdb.length() > 0 ? tvdb : "<none>")
                    + " tmdb=" + (tmdb.length() > 0 ? tmdb : "<none>"));
            CINEMETA_IDS_CACHE.put(tvdbKey, tvdb);
            CINEMETA_IDS_CACHE.put(tmdbKey, tmdb);
            if (tvdb.length() > 0) VimuIntroSkipPrefs.cacheImdb(ctx, tvdbKey, tvdb);
            if (tmdb.length() > 0) VimuIntroSkipPrefs.cacheImdb(ctx, tmdbKey, tmdb);
            return new String[]{tvdb, tmdb};
        } catch (Throwable error) {
            Log.w(TAG, "Cinemeta ids lookup failed: " + error);
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
            String text = safe(String.valueOf(value)).trim();
            return text.matches("\\d+") ? text : "";
        } catch (Throwable ignored) {
            return "";
        }
    }

    /**
     * Keyless extra source, no key needed: GET /segments?imdb_id=&season=&episode
     * answers {"intro": {"start_ms","end_ms",...}, "recap": {...}, "outro": {...}}
     * with null for unknown types. Mapping: intro to Intro, recap to Recap,
     * outro/credits to Credits. Post-credit scenes have no Vimu segment type and
     * are left out.
     */
    private static List<Seg> fetchIntroDbApp(String imdbId, int season, int episode) {
        List<Seg> out = new ArrayList<Seg>();
        try {
            String url = INTRODB_APP_URL + "?imdb_id=" + imdbId + "&season=" + season + "&episode=" + episode;
            JSONObject response = new JSONObject(http("GET", url, null, null));
            addAppSegment(out, response, "intro", "Intro");
            addAppSegment(out, response, "recap", "Recap");
            addAppSegment(out, response, "outro", "Credits");
            addAppSegment(out, response, "credits", "Credits");
        } catch (Throwable error) {
            Log.w(TAG, "IntroDB.app lookup failed: " + error);
        }
        return out;
    }

    private static void addAppSegment(List<Seg> out, JSONObject response, String key, String name) {
        try {
            if (hasSegType(out, name)) return;
            JSONObject item = response.optJSONObject(key);
            if (item == null) return;
            int start;
            int end;
            if (!item.isNull("start_ms")) {
                start = item.optInt("start_ms", -1);
            } else if (!item.isNull("start_sec")) {
                double sec = item.optDouble("start_sec", -1.0);
                start = sec < 0 ? -1 : (int) Math.round(sec * 1000.0);
            } else {
                return;
            }
            if (!item.isNull("end_ms")) {
                end = item.optInt("end_ms", -1);
            } else if (!item.isNull("end_sec")) {
                double sec = item.optDouble("end_sec", -1.0);
                end = sec < 0 ? -1 : (int) Math.round(sec * 1000.0);
            } else {
                return;
            }
            if (start < 0 || end <= start || end - start > 600000) return;
            out.add(new Seg(start, end, name, "introdb.app"));
            Log.i(TAG, "Segment IntroDB.app: " + key + " " + start + "-" + end + "ms");
        } catch (Throwable error) {
            Log.w(TAG, "IntroDB.app (" + key + ") failed: " + error);
        }
    }

    /**
     * SkipDB (skipdb.tv) final fallback: open data, IMDb-keyed, anonymous reads.
     * Missing types only; "out-of-range" matches carry SkipDB's own uncertainty flag.
     */
    private static List<Seg> fetchSkipDb(String imdbId, int season, int episode, int durationMs) {
        List<Seg> out = new ArrayList<Seg>();
        try {
            String url = SKIPDB_URL + "?imdb_id=" + imdbId + "&season=" + season + "&episode=" + episode
                    + (durationMs > 0 ? "&duration=" + (durationMs / 1000) : "");
            JSONObject response = new JSONObject(http("GET", url, null, null));
            JSONObject segments = response.optJSONObject("segments");
            if (segments == null) return out;
            addSkipDbSegment(out, segments, "intro", "Intro");
            addSkipDbSegment(out, segments, "recap", "Recap");
            addSkipDbSegment(out, segments, "outro", "Credits");
            addSkipDbSegment(out, segments, "preview", "Preview");
        } catch (Throwable error) {
            Log.w(TAG, "SkipDB lookup failed: " + error);
        }
        return out;
    }

    private static void addSkipDbSegment(List<Seg> out, JSONObject segments, String key, String name) {
        try {
            if (hasSegType(out, name)) return;
            JSONObject item = segments.optJSONObject(key);
            if (item == null) return;
            if ("out-of-range".equals(item.optString("match", ""))) return;
            if (item.isNull("start_ms") || item.isNull("end_ms")) return;
            int start = item.optInt("start_ms", -1);
            int end = item.optInt("end_ms", -1);
            if (start < 0 || end <= start || end - start > 600000) return;
            out.add(new Seg(start, end, name, "skipdb"));
            Log.i(TAG, "Segment SkipDB: " + key + " " + start + "-" + end + "ms");
        } catch (Throwable error) {
            Log.w(TAG, "SkipDB (" + key + ") failed: " + error);
        }
    }

    /**
     * Keyless Cinemeta lookup using the public catalog. Exact normalized name match only,
     * so "Dexter" never resolves to "Dexter: Resurrection". When several exact matches
     * exist, the one whose release year matches a year in the title wins, else the first.
     * Hits are remembered in memory and in SharedPreferences for 60 days.
     */
    private static String cinemetaImdbId(Context ctx, String title) {
        if (title == null || title.trim().length() == 0) return "";
        String wanted = title.trim();
        String key = "series:" + normTitle(wanted);
        String cached;
        synchronized (CINEMETA_LOCK) {
            cached = CINEMETA_CACHE.get(key);
            if (cached == null) {
                cached = VimuIntroSkipPrefs.cachedImdb(ctx, key);
                if (cached.length() > 0) CINEMETA_CACHE.put(key, cached);
                else cached = null;
            }
        }
        if (cached != null) {
            Log.i(TAG, "Cinemeta: cache hit for \"" + wanted + "\" -> "
                    + (cached.length() > 0 ? cached : "<none>"));
            return cached;
        }
        String query;
        try {
            // The catalog search finds nothing for "One Piece (1999-)": search the bare name.
            query = URLEncoder.encode(stripYearRange(wanted), "UTF-8").replace("+", "%20");
        } catch (Throwable error) {
            Log.w(TAG, "Cinemeta: bad title \"" + wanted + "\"");
            return "";
        }
        try {
            String response;
            try {
                response = http("GET", CINEMETA_SERIES_URL + query + ".json", null, null);
            } catch (Throwable first) {
                Log.i(TAG, "Cinemeta: retry after " + first.getClass().getSimpleName());
                response = http("GET", CINEMETA_SERIES_URL + query + ".json", null, null);
            }
            JSONObject json = new JSONObject(response);
            JSONArray metas = json.optJSONArray("metas");
            if (metas == null || metas.length() == 0) {
                Log.i(TAG, "Cinemeta: no results for \"" + wanted + "\"");
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
                String name = meta.optString("name", "");
                if (name == null) name = "";
                String imdb = meta.optString("imdb_id", "");
                if (imdb == null || imdb.length() == 0) imdb = meta.optString("id", "");
                if (imdb == null) imdb = "";
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
                    String release = meta.optString("releaseInfo", "");
                    exactYears.add(release == null ? "" : release);
                }
            }
            if (exactIds.isEmpty()) {
                Log.i(TAG, "Cinemeta: no exact name match for \"" + wanted + "\" ("
                        + metas.length() + " candidates, e.g. " + sample + ")");
                return "";
            }
            String chosen = exactIds.get(0);
            String chosenName = exactNames.get(0);
            if (exactIds.size() > 1 && wantedYear > 0) {
                for (int i = 0; i < exactIds.size(); i++) {
                    if (exactYears.get(i).contains(String.valueOf(wantedYear))) {
                        chosen = exactIds.get(i);
                        chosenName = exactNames.get(i);
                        break;
                    }
                }
            }
            Log.i(TAG, "Cinemeta: \"" + wanted + "\" -> " + chosen + " (\"" + chosenName + "\", "
                    + exactIds.size() + " exact match(es))");
            synchronized (CINEMETA_LOCK) {
                CINEMETA_CACHE.put(key, chosen);
            }
            VimuIntroSkipPrefs.cacheImdb(ctx, key, chosen);
            return chosen;
        } catch (Throwable error) {
            Log.w(TAG, "Cinemeta lookup failed: " + error);
            return "";
        }
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

    private static int extractYear(String value) {
        if (value == null) return 0;
        Matcher matcher = YEAR.matcher(value);
        if (!matcher.find()) return 0;
        try {
            return Integer.parseInt(matcher.group(1));
        } catch (Throwable ignored) {
            return 0;
        }
    }

    /**
     * Snaps online segments (AniSkip / IntroDB) to chapter boundaries within 15 s:
     * both ends snap when the snapped duration still matches within 5 s; a single end
     * snaps only when it moves by 3 s or less.
     */
    private static List<Seg> snapSegments(List<Seg> list, long[] starts, int duration) {
        if (list == null || list.isEmpty() || starts == null || starts.length == 0) {
            return list;
        }
        List<Seg> out = new ArrayList<>(list.size());
        for (Seg seg : list) {
            out.add(snapOne(seg, starts, duration));
        }
        return out;
    }

    private static Seg snapOne(Seg seg, long[] starts, int duration) {
        int start = nearestBoundaryMs(seg.start, starts, duration);
        int end = nearestBoundaryMs(seg.end, starts, duration);
        boolean both = start >= 0 && end >= 0
                && Math.abs((end - start) - (seg.end - seg.start)) <= 5000;
        if (!both) {
            if (start >= 0 && Math.abs(start - seg.start) > 3000) start = -1;
            if (end >= 0 && Math.abs(end - seg.end) > 3000) end = -1;
        }
        if (start < 0 && end < 0) return seg;
        int newStart = start >= 0 ? start : seg.start;
        int newEnd = end >= 0 ? end : seg.end;
        if (newEnd - newStart < 10000) return seg;
        Log.i(TAG, "Snapped '" + seg.name + "' (" + seg.rule + ") " + seg.start + "-" + seg.end
                + "ms -> " + newStart + "-" + newEnd + "ms");
        return new Seg(newStart, newEnd, seg.name, seg.rule + "+snap");
    }

    private static int nearestBoundaryMs(int timeMs, long[] starts, int duration) {
        int best = -1;
        for (int i = 0; i < starts.length; i++) {
            int s = (int) starts[i];
            int e = endOf(starts, i, duration);
            int[] bounds = new int[]{s, e};
            for (int b : bounds) {
                if (b < 0 || Math.abs(b - timeMs) > 15000) continue;
                if (best < 0 || Math.abs(b - timeMs) < Math.abs(best - timeMs)) {
                    best = b;
                }
            }
        }
        return best;
    }

    private static boolean overlapsMs(List<Seg> segments, int startMs, int endMs) {
        for (Seg s : segments) {
            int start = Math.max(s.start, startMs);
            int end = Math.min(s.end, endMs);
            if (end - start > 1000) return true;
        }
        return false;
    }

    private static int seasonMarker(String name) {
        if (name == null) return 1;
        Matcher matcher = CANDIDATE_SEASON.matcher(name.trim());
        if (!matcher.find()) return 1;
        if (matcher.group(1) != null) return safeParseInt(matcher.group(1), 1);
        if (matcher.group(2) != null) return safeParseInt(matcher.group(2), 1);
        String word = (matcher.group(3) != null ? matcher.group(3) : matcher.group(4)).toLowerCase(Locale.US);
        if ("second".equals(word) || "ii".equals(word)) return 2;
        if ("third".equals(word) || "iii".equals(word)) return 3;
        if ("fourth".equals(word) || "iv".equals(word)) return 4;
        return 5;
    }

    private static String ordinalSeason(int season) {
        if (season % 100 >= 11 && season % 100 <= 13) return season + "th";
        switch (season % 10) {
            case 1:
                return season + "st";
            case 2:
                return season + "nd";
            case 3:
                return season + "rd";
            default:
                return season + "th";
        }
    }

    private static String normTitle(String value) {
        if (value == null) return "";
        String result = value.toLowerCase(Locale.US).replace("\u2019", "").replace("'", "");
        return result.replaceAll("[^\\p{L}\\p{N}]+", " ").trim();
    }

    /** Dice coefficient on word sets; 1.0 = same words. */
    private static double dice(String a, String b) {
        if (a == null || b == null || a.length() == 0 || b.length() == 0) return 0.0;
        if (a.equals(b)) return 1.0;
        Set<String> left = new HashSet<>(Arrays.asList(a.split(" ")));
        Set<String> right = new HashSet<>(Arrays.asList(b.split(" ")));
        int common = 0;
        for (String word : left) {
            if (right.contains(word)) common++;
        }
        return 2.0 * common / (left.size() + right.size());
    }

    private static String urlDecode(String s) {
        if (s == null || s.length() == 0) return "";
        try {
            String safePercent = s.replaceAll("%(?![0-9a-fA-F]{2})", "%25").replace("+", "%2B");
            return URLDecoder.decode(safePercent, "UTF-8");
        } catch (Throwable ignored) {
            return s;
        }
    }

    private static int safeParseInt(String s, int fallback) {
        if (s == null) return fallback;
        try {
            return Integer.parseInt(s.trim());
        } catch (Throwable ignored) {
            return fallback;
        }
    }

    private static String fmt1(double v) {
        return String.format(Locale.US, "%.1f", v);
    }

    /**
     * HTTP helper with 5 s connect/read timeouts, safe on the lookup thread:
     * 204/404 mean not-found and return immediately with no retry (AniSkip
     * returns 404 when no skip times exist for an episode); 429 and 5xx are
     * retried up to 3 times, honouring Retry-After with each wait capped at
     * 3 s; other failures after the last attempt throw. The whole lookup chain
     * shares a ~10 s budget through DEADLINE_MS, set by the lookup thread.
     */
    private static String http(String method, String url, String jsonBody, String bearer) throws Exception {
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
                    Log.i(TAG, "HTTP retry " + attempt + "/" + HTTP_MAX_ATTEMPTS + " in " + waitMs + "ms on " + url);
                    try {
                        Thread.sleep(waitMs);
                    } catch (InterruptedException interrupted) {
                        Thread.currentThread().interrupt();
                        throw new java.io.IOException("interrupted");
                    }
                }
            }
            HttpURLConnection c = null;
            InputStream in = null;
            try {
                c = (HttpURLConnection) new URL(url).openConnection();
                c.setRequestMethod(method);
                c.setConnectTimeout(HTTP_TIMEOUT_MS);
                c.setReadTimeout(HTTP_TIMEOUT_MS);
                c.setRequestProperty("Accept", "application/json");
                c.setRequestProperty("User-Agent", "VimuIntroSkip/1.0");
                if (bearer != null) {
                    c.setRequestProperty("Authorization", bearer);
                }
                if (jsonBody != null) {
                    c.setDoOutput(true);
                    c.setRequestProperty("Content-Type", "application/json; charset=utf-8");
                    byte[] payload = jsonBody.getBytes("UTF-8");
                    OutputStream os = c.getOutputStream();
                    os.write(payload);
                    os.close();
                }
                int code = c.getResponseCode();
                if (code == 204 || code == 404) {
                    return "{}";
                }
                if (code == 429 || code >= 500) {
                    retryAfterMs = retryAfterMs(c);
                    lastError = new java.io.IOException("HTTP " + code);
                    Log.i(TAG, "HTTP retryable " + code + " on " + url);
                    continue;
                }
                in = code >= 400 ? c.getErrorStream() : c.getInputStream();
                if (in == null) return "{}";
                ByteArrayOutputStream out = new ByteArrayOutputStream();
                byte[] buf = new byte[4096];
                int n;
                while ((n = in.read(buf)) > 0) {
                    out.write(buf, 0, n);
                }
                return out.toString("UTF-8");
            } catch (LookupBudgetException budget) {
                throw budget;
            } catch (java.io.IOException e) {
                lastError = e;
                Log.i(TAG, "HTTP retryable " + e.getClass().getSimpleName() + " on " + url);
            } finally {
                if (in != null) {
                    try {
                        in.close();
                    } catch (Throwable ignored) {
                    }
                }
                if (c != null) {
                    try {
                        c.disconnect();
                    } catch (Throwable ignored) {
                    }
                }
            }
        }
        throw lastError != null ? lastError : new java.io.IOException("HTTP request failed");
    }

    private static final class LookupBudgetException extends java.io.IOException {
        LookupBudgetException(String message) {
            super(message);
        }
    }

    /** Retry-After in ms (delta seconds or an HTTP date), 0 when absent or unusable. */
    private static long retryAfterMs(HttpURLConnection c) {
        try {
            String value = c.getHeaderField("Retry-After");
            if (value == null) return 0L;
            value = value.trim();
            if (value.length() == 0) return 0L;
            try {
                return Math.max(0L, Long.parseLong(value) * 1000L);
            } catch (NumberFormatException notSeconds) {
                long date = c.getHeaderFieldDate("Retry-After", -1L);
                if (date > 0) return Math.max(0L, date - System.currentTimeMillis());
            }
        } catch (Throwable ignored) {
            // A broken header must not fail the lookup.
        }
        return 0L;
    }

    private void resetMedia() {
        mediaKind = 0;
        audioPending = true;
        subApplied = false;
        subTries = 0;
        subLogged = false;
        skipped.clear();
        segments = null;
        chaptersHaveIntro = false;
        remote = null;
        remoteStarted = false;
        remoteApplied = false;
        mediaGen++;
        chapterSignature = null;
        chapterReads = 0;
        nextChapterRead = 0;
        current = null;
        currentByJump = false;
        currentBySeek = false;
        inheritSeek = false;
        firstPlayingAt = 0;
        flowTicks = 0;
        guardUntil = 0;
        lastPos = -1;
        hidePill(false);
    }

    private static String chapterSignature(e p) {
        long[] starts = p.E();
        if (starts == null || starts.length == 0) return null;
        StringBuilder sig = new StringBuilder();
        for (long start : starts) sig.append(start).append(',');
        return sig.toString();
    }

    private void skip(PlayerFragment f, e p, Seg seg, int pos, boolean automatic) {
        skipped.add(seg.key());
        int target = seg.end;
        if (durationMs > 0 && target > durationMs - 1000) target = Math.max(seg.start, durationMs - 1000);
        // Same call Vimu's own chapter-skip buttons use (q.D/E/G -> e.seekTo). The adapter's
        // k(long) is the scrub-preview path (e1(pos, true)) and leaves the seek bar stuck.
        p.seekTo(target);
        guardUntil = SystemClock.uptimeMillis() + 2500L;
        guardTarget = target;
        current = null;
        currentBySeek = false;
        Log.i(TAG, (automatic ? "SKIP '" : "SKIP MANUAL '") + seg.name + "' " + pos + "ms -> " + target
                + "ms (chapter " + seg.start + "-" + seg.end + ", rule " + seg.rule + ")");
        final int landTarget = target;
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    PlayerFragment pf = fragment.get();
                    e pl = pf == null ? null : PlayerFragment.G0(pf);
                    if (pl != null) Log.i(TAG, "landed 1s after skip: pos=" + pl.getCurrentPosition() + "ms (target " + landTarget + "ms)");
                } catch (Throwable ignored) {
                }
            }
        }, 1000L);
        try {
            f.P1(seg.skippedText());
        } catch (Throwable error) {
            Log.w(TAG, "notice", error);
        }
    }

    /**
     * Selects the subtitle Stremio handed over: addon URLs already ride Vimu's own forcedsrt
     * flow (set in capture), embedded file tracks are matched by id, then label and language,
     * then position, through Vimu's track API (G0 lists, O0 selects, L reports the current).
     * Retried while the track list is still loading, then left alone.
     */
    private void applyPendingAudio(PlayerFragment f, e p) {
        audioPending = false;
        try {
            if (f == null || p == null) return;
            ParsedMedia info = null;
            try {
                Activity owner = f.getActivity();
                if (owner != null) info = extractMediaFromIntent(owner.getIntent());
            } catch (Throwable ignored) {
            }
            // Keep movies untouched if ParsedMedia is null (no episode number parsed).
            if (info == null) {
                Log.i(TAG, "AudioSelect: branch=movie-skip (no episode metadata, keeping Vimu default)");
                return;
            }

            Object exo = findExoPlayer(p);
            if (exo == null) return;
            if (Boolean.TRUE.equals(AUDIO_HANDLED.get(exo))) return;

            Method getParams = exo.getClass().getMethod("getTrackSelectionParameters");
            Method setParams = exo.getClass().getMethod(
                    "setTrackSelectionParameters", TrackSelectionParameters.class);
            Method getTracks = exo.getClass().getMethod("getCurrentTracks");

            TrackSelectionParameters params = (TrackSelectionParameters) getParams.invoke(exo);
            if (params == null) return;

            // If the user already picked a manual track override, never overwrite it.
            if (!params.overrides.isEmpty()) {
                AUDIO_HANDLED.put(exo, Boolean.TRUE);
                Log.i(TAG, "AudioSelect: branch=manual-skip (existing override active)");
                return;
            }

            boolean isAnime = info.looksLikeAnime;
            String targetIso = isAnime
                    ? VimuIntroSkipPrefs.animeAudioLang(f)
                    : VimuIntroSkipPrefs.primaryAudioLang(f);
            String kind = isAnime ? "anime" : "primary";

            Object tracksObj = getTracks.invoke(exo);
            if (!(tracksObj instanceof Tracks)) return;
            Tracks tracks = (Tracks) tracksObj;

            String exactTrackLang = null;
            String familyTrackLang = null;

            for (Tracks.Group group : tracks.getGroups()) {
                if (group.getType() != C.TRACK_TYPE_AUDIO) continue;
                for (int i = 0; i < group.length; i++) {
                    Format format = group.getTrackFormat(i);
                    if (format == null || format.language == null) continue;
                    String rawLang = format.language.trim();
                    if (rawLang.length() == 0) continue;

                    if (exactTrackLang == null && isExactLangMatch(rawLang, targetIso)) {
                        exactTrackLang = rawLang;
                    } else if (familyTrackLang == null && isFamilyLangMatch(rawLang, targetIso)) {
                        familyTrackLang = rawLang;
                    }
                }
            }

            AUDIO_HANDLED.put(exo, Boolean.TRUE);

            if (exactTrackLang != null) {
                TrackSelectionParameters updated = params.buildUpon()
                        .setPreferredAudioLanguage(exactTrackLang)
                        .build();
                setParams.invoke(exo, updated);
                Log.i(TAG, "AudioSelect: branch=preferred kind=" + kind
                        + " target=" + targetIso + " matched=" + exactTrackLang);
            } else if (familyTrackLang != null) {
                TrackSelectionParameters updated = params.buildUpon()
                        .setPreferredAudioLanguage(familyTrackLang)
                        .build();
                setParams.invoke(exo, updated);
                Log.i(TAG, "AudioSelect: branch=family kind=" + kind
                        + " target=" + targetIso + " matched=" + familyTrackLang);
            } else {
                Log.i(TAG, "AudioSelect: branch=default kind=" + kind
                        + " target=" + targetIso + " (no matching track, keeping Vimu default)");
            }
        } catch (Throwable ignored) {
            // Fail soft: leave Vimu's default audio selection untouched.
        }
    }

    /** Finds the underlying ExoPlayer instance inside Vimu's player wrapper (e / i). */
    private static Object findExoPlayer(Object playerWrapper) {
        try {
            if (playerWrapper == null) return null;
            if (hasTrackParamsApi(playerWrapper.getClass())) return playerWrapper;
            for (Class<?> c = playerWrapper.getClass(); c != null && c != Object.class; c = c.getSuperclass()) {
                for (Field field : c.getDeclaredFields()) {
                    field.setAccessible(true);
                    Object value = field.get(playerWrapper);
                    if (value != null && hasTrackParamsApi(value.getClass())) {
                        return value;
                    }
                }
            }
        } catch (Throwable ignored) {
        }
        return null;
    }

    private static boolean hasTrackParamsApi(Class<?> cls) {
        try {
            cls.getMethod("getTrackSelectionParameters");
            cls.getMethod("getCurrentTracks");
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** Tier 1: Exact language code match (e.g. "en" == "en" or ISO-639-2 "eng", without regional tag). */
    private static boolean isExactLangMatch(String trackLang, String targetIso) {
        String norm = normalizeLangTag(trackLang);
        if (norm.indexOf('-') >= 0) return false; // Regional tags like "en-us" belong to Tier 2 (family)
        return toIso639_1(norm).equals(targetIso);
    }

    /** Tier 2: Same-language family match (e.g. "en" matches "en-US", "en_GB", "eng-US"). */
    private static boolean isFamilyLangMatch(String trackLang, String targetIso) {
        String norm = normalizeLangTag(trackLang);
        int dash = norm.indexOf('-');
        String primarySubtag = dash > 0 ? norm.substring(0, dash) : norm;
        String baseIso = toIso639_1(primarySubtag);
        if (baseIso.equals(targetIso)) return true;
        return norm.startsWith(targetIso + "-");
    }

    private static String normalizeLangTag(String lang) {
        return lang == null ? "" : lang.trim().replace('_', '-').toLowerCase(Locale.ROOT);
    }

    /** Maps common 3-letter ISO-639-2/B & T codes found in MKV containers to 2-letter ISO-639-1. */
    private static String toIso639_1(String code) {
        if (code == null || code.length() <= 2) return code == null ? "" : code;
        if ("eng".equals(code)) return "en";
        if ("jpn".equals(code)) return "ja";
        if ("spa".equals(code)) return "es";
        if ("fra".equals(code) || "fre".equals(code)) return "fr";
        if ("deu".equals(code) || "ger".equals(code)) return "de";
        if ("ita".equals(code)) return "it";
        if ("por".equals(code)) return "pt";
        if ("rus".equals(code)) return "ru";
        if ("kor".equals(code)) return "ko";
        if ("zho".equals(code) || "chi".equals(code)) return "zh";
        if ("hin".equals(code)) return "hi";
        if ("pol".equals(code)) return "pl";
        if ("tur".equals(code)) return "tr";
        if ("ara".equals(code)) return "ar";
        if ("nld".equals(code) || "dut".equals(code)) return "nl";
        if ("ukr".equals(code)) return "uk";
        return code;
    }

    private void applyPendingSub(PlayerFragment f, e p) {
        try {
            Activity owner = f.getActivity();
            if (owner != null) syncHandoff(owner.getIntent());
        } catch (Throwable ignored) {
            // Keep the captured state.
        }
        if (!extHaveSub || subApplied) return;
        if (extSubUrl.length() > 0) {
            if (!subLogged) {
                subLogged = true;
                Log.i(TAG, "Subtitle: addon URL rides forcedsrt");
            }
            subApplied = true;
            return;
        }
        if (subTries >= 10) {
            if (!subLogged) {
                subLogged = true;
                Log.i(TAG, "Subtitle: no match for lang=" + extSubLang
                        + " label=" + clip(extSubLabel) + " id=" + clip(extSubId)
                        + " index=" + extSubIndex);
            }
            return;
        }
        int count = internalSubCount(p);
        if (count < 0) return; // track list not parsed yet: does not use up a try
        subTries++;
        if (count == 0) {
            subApplied = true;
            Log.i(TAG, "Subtitle: file has no subtitle tracks");
            return;
        }
        int want = -1;
        String why = "";
        for (int i = 1; i <= count; i++) {
            if (extSubId.length() > 0 && trackIdMatch(p, i - 1, extSubId)) {
                want = i;
                why = "id";
                break;
            }
        }
        if (want < 0) {
            for (int i = 1; i <= count; i++) {
                if (trackLabelLangMatch(p, i, extSubLang, extSubLabel)) {
                    want = i;
                    why = "label+language";
                    break;
                }
            }
        }
        if (want < 0 && extSubIndex >= 0 && extSubIndex + 1 <= count) {
            want = extSubIndex + 1;
            why = "index";
        }
        if (want < 0) return; // matches nothing yet, retry while chapters load
        try {
            if (p.L() == want) {
                subApplied = true;
                Log.i(TAG, "Subtitle: already selected track " + want);
                return;
            }
            p.O0(want);
            if (p.L() == want) {
                subApplied = true;
                String name = "";
                try {
                    name = p.G0(want);
                } catch (Throwable ignored) {
                }
                Log.i(TAG, "Subtitle: selected track " + want + " (" + why + ") '" + clip(name) + "'");
            }
        } catch (Throwable error) {
            Log.w(TAG, "Subtitle select", error);
        }
    }

    /** Number of internal subtitle tracks (dialog numbers 1..n), or -1 while unknown. */
    private static int internalSubCount(e p) {
        try {
            Object tracks = readPlayerField(p, "K");
            if (tracks == null) return -1;
            Object array = readField(tracks, "d");
            if (array == null) return -1;
            return java.lang.reflect.Array.getLength(array);
        } catch (Throwable ignored) {
            return -1;
        }
    }

    /** True when the Stremio track id equals one of the Vimu track fields. */
    private static boolean trackIdMatch(e p, int track, String id) {
        try {
            Object tracks = readPlayerField(p, "K");
            Object array = readField(tracks, "d");
            Object one = java.lang.reflect.Array.get(array, track);
            for (String field : new String[]{"c", "d", "h"}) {
                Object value = readField(one, field);
                if (value instanceof String && id.equalsIgnoreCase((String) value)) return true;
            }
        } catch (Throwable ignored) {
        }
        return false;
    }

    /** Language must match (tolerant); the label only narrows it down when Stremio sent one. */
    private static boolean trackLabelLangMatch(e p, int dialog, String lang, String label) {
        try {
            Object tracks = readPlayerField(p, "K");
            Object array = readField(tracks, "d");
            Object one = java.lang.reflect.Array.get(array, dialog - 1);
            Object trackLang = readField(one, "d");
            Object trackLabel = readField(one, "c");
            if (!langMatch(lang, trackLang instanceof String ? (String) trackLang : "")) return false;
            if (label.length() == 0) return true;
            String labelLower = label.toLowerCase(Locale.US);
            String code = trackLabel instanceof String ? ((String) trackLabel).toLowerCase(Locale.US) : "";
            if (code.contains(labelLower)) return true;
            String display = "";
            try {
                display = p.G0(dialog);
            } catch (Throwable ignored) {
            }
            return display.toLowerCase(Locale.US).contains(labelLower);
        } catch (Throwable ignored) {
            return false;
        }
    }

    /** ISO language match: "en" equals "eng" equals "English". Empty Stremio side never matches. */
    private static boolean langMatch(String a, String b) {
        if (a == null || b == null) return false;
        String left = a.trim().toLowerCase(Locale.US);
        String right = b.trim().toLowerCase(Locale.US);
        if (left.length() == 0 || right.length() == 0) return false;
        if (left.equals(right)) return true;
        return iso3(left).equals(iso3(right));
    }

    private static String iso3(String lang) {
        try {
            if (lang.length() == 2) return new Locale(lang).getISO3Language().toLowerCase(Locale.US);
            Locale locale = new Locale(lang);
            String iso3 = locale.getISO3Language().toLowerCase(Locale.US);
            if (iso3.length() > 0 && !iso3.equals(lang)) return iso3;
        } catch (Throwable ignored) {
        }
        return lang;
    }

    private static Object readPlayerField(e p, String name) throws Exception {
        return readField(p, name);
    }

    private static Object readField(Object target, String name) throws Exception {
        for (Class<?> current = target.getClass(); current != null;
                current = current.getSuperclass()) {
            try {
                java.lang.reflect.Field field = current.getDeclaredField(name);
                field.setAccessible(true);
                return field.get(target);
            } catch (NoSuchFieldException ignored) {
            }
        }
        throw new NoSuchFieldException(name);
    }

    private static final boolean UNNAMED_CHAPTER_HEURISTIC = false;

    private void readChapters(e p, int duration) {
        long[] starts = p.E();
        if (starts == null || starts.length == 0) return;
        int n = starts.length;
        String[] names = new String[n];
        StringBuilder all = new StringBuilder();
        for (int i = 0; i < n; i++) {
            String name;
            try {
                name = p.y0(i);
            } catch (Throwable error) {
                name = "";
            }
            names[i] = name == null ? "" : name.trim();
            all.append(" [").append(i).append("] ").append(starts[i]).append("ms '").append(names[i]).append('\'');
        }
        Log.i(TAG, "chapters (" + n + ", duration " + duration + "ms):" + all);
        List<Seg> found = new ArrayList<>();
        // a) named intro / recap chapters
        boolean hasOpening = false;
        for (int i = 0; i < n; i++) {
            if (!excluded(names[i], starts[i], duration) && OPENING_NAME.matcher(names[i]).find()) hasOpening = true;
        }
        for (int i = 0; i < n; i++) {
            if (excluded(names[i], starts[i], duration)) continue;
            if (duration > 0 && starts[i] > duration / 2) continue; // an intro never sits in the second half
            if (!INTRO_NAME.matcher(names[i]).find() && !isIntroCredits(names[i], starts[i], duration)) continue;
            // "Intro" alone counts only when there is no OP/Opening chapter.
            if (hasOpening && !OPENING_NAME.matcher(names[i]).find() && WEAK_INTRO_NAME.matcher(names[i]).find()
                    && !names[i].toLowerCase(Locale.US).matches(".*(recap|previously|あらすじ).*")) {
                Log.i(TAG, "ignoring '" + names[i] + "': an OP/Opening chapter exists");
                continue;
            }
            int end = endOf(starts, i, duration);
            long lenMs = (long) end - starts[i];
            if (lenMs >= 10000L && lenMs <= 360000L) found.add(new Seg((int) starts[i], end, names[i], "name"));
        }
        boolean hasIntroSeg = false;
        for (Seg s : found) {
            if (!s.recap()) {
                hasIntroSeg = true;
                break;
            }
        }
        // b) unnamed chapters: a 60-110 s chapter starting in the first 6 minutes. If several
        //    qualify (e.g. an 85 s cold open before a 90 s OP), take the one closest to 90 s,
        //    the usual TV opening length; ties go to the earlier one. Checked whenever no
        //    non-recap intro chapter was named, so a named recap never hides an unnamed OP.
        // Off: scene-split chapters of documentaries and specials also have this shape, and
        // skipping real content is worse than missing an intro. Online timings (AniSkip, IntroDB)
        // and named chapters still apply.
        if (!hasIntroSeg && UNNAMED_CHAPTER_HEURISTIC) {
            int best = -1;
            long bestDelta = Long.MAX_VALUE;
            for (int i = 0; i < n; i++) {
                if (!GENERIC_NAME.matcher(names[i]).matches()) continue;
                int end = endOf(starts, i, duration);
                if (end <= 0 || overlapsMs(found, (int) starts[i], end)) continue;
                long length = end - starts[i];
                if (starts[i] <= 360000L && length >= 60000L && length <= 110000L) {
                    long delta = Math.abs(length - 90000L);
                    if (delta < bestDelta) {
                        best = i;
                        bestDelta = delta;
                    }
                }
            }
            if (best >= 0) {
                found.add(new Seg((int) starts[best], endOf(starts, best, duration),
                        names[best].length() == 0 ? "chapter " + (best + 1) : names[best], "length"));
                hasIntroSeg = true;
            }
        }
        Collections.sort(found, new Comparator<Seg>() {
            @Override
            public int compare(Seg a, Seg b) {
                return Integer.compare(a.start, b.start);
            }
        });
        // c) only a real intro chapter satisfies chaptersHaveIntro; a lone recap still allows online intro fallback
        chaptersHaveIntro = hasIntroSeg;
        inheritSeek = current != null && currentBySeek;
        segments = found;
        current = null;
        if (found.isEmpty()) {
            Log.i(TAG, "no intro chapter");
        } else {
            for (Seg s : found) {
                Log.i(TAG, "final segment '" + s.name + "' " + s.start + "-" + s.end + "ms (source chapter:" + s.rule + ")");
            }
        }
    }

    /**
     * Never skipped: ED/ending/end credits/preview, a bare "Credits" outside the first 35% of the
     * runtime, and Amazon-style scene titles that merely end in the intro words
     * ("Marcy Gives Full Disclosure, Opening Credits").
     */
    private static boolean excluded(String name, long start, int duration) {
        if (NEVER_NAME.matcher(name).find()) return true;
        int comma = name.indexOf(',');
        if (comma > 0 && name.substring(0, comma).trim().split("\\s+").length > 2) return true;
        return CREDITS_NAME.matcher(name).find() && !OPENING_NAME.matcher(name).find() && !isIntroCredits(name, start, duration);
    }

    /** A bare "Credits" chapter early in the episode is the title sequence (late ones are end credits). */
    private static boolean isIntroCredits(String name, long start, int duration) {
        if (!CREDITS_NAME.matcher(name).find() || OPENING_NAME.matcher(name).find()) return false;
        return duration > 0 ? start < duration * 0.35 : start < 600000L;
    }

    private static int endOf(long[] starts, int i, int duration) {
        if (i + 1 < starts.length) return (int) starts[i + 1];
        return duration > 0 ? duration : -1;
    }
}
