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

import app.tikkamasalla.stremio.diag.PlaybackDiary;
import app.tikkamasalla.stremio.introskip.InnerBounds;
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


import app.tikkamasalla.stremio.subs.SdhLabels;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
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
    /** AniList said "not an anime we can use" for this show/season/hint: asked again after 6 hours at the earliest, this process only. */
    private static final Map<String, Long> MAL_MISS = new ConcurrentHashMap<>();
    private static final long MISS_TTL_MS = 6L * 60L * 60L * 1000L;

    private static final String ANILIST_URL = "https://graphql.anilist.co";
    private static final String ANISKIP_URL = "https://api.aniskip.com/v2/skip-times/";
    private static final String INTRODB_URL = "https://api.theintrodb.org/v4/media";
    private static final String INTRODB_APP_URL = "https://api.introdb.app/segments";
    private static final String SKIPDB_URL = "https://api.skipdb.tv/api/segments";
    private static final String OWN_TIMES_URL =
            "https://raw.githubusercontent.com/tikkamasalla/stremio-morphe-patches/skip-data/times/";
    private static final String CINEMETA_META_SERIES_URL = "https://v3-cinemeta.strem.io/meta/series/";
    // Network robustness: every skip-related HTTP call keeps the 5 s timeouts,
    // retries 429/5xx up to 3 times (Retry-After honoured, each wait capped at
    // 3 s), returns not-found (204/404) immediately, and the whole lookup chain
    // is capped at about 10 s so skip data still arrives before typical intros.
    private static final long LOOKUP_BUDGET_MS = 10000L;
    private static final int HTTP_MAX_ATTEMPTS = 4;
    private static final long RETRY_WAIT_MAX_MS = 3000L;
    private static final ThreadLocal<Long> DEADLINE_MS = new ThreadLocal<Long>();
    /** Lookup sources; a failed one (429/5xx/timeout/parse error) is refetched, "no data" is final. */
    private static final int SRC_ANI = 1;
    private static final int SRC_TIDB = 2;
    private static final int SRC_APP = 4;
    private static final int SRC_SKIP = 8;
    private static final int SRC_ALL = SRC_ANI | SRC_TIDB | SRC_APP | SRC_SKIP;
    /** Wait after a lookup that had failures before refetching the failed sources. */
    private static final long[] RETRY_BACKOFF_MS = {5000L, 20000L, 60000L};

    /**
     * Results of one media's lookups, kept across failure retries. A null list means the
     * source has not answered yet (never ran, or failed); an empty list is a final "no data".
     * Only one lookup thread runs at a time (lookupRunning), so the fields need no locking.
     */
    private static final class LookupState {
        boolean malResolved;
        int[] malMapped;
        List<Seg> ani;
        String imdbId;
        List<Seg> own;
        int ownRuntime;
        List<Seg> tidb;
        List<Seg> app;
        List<Seg> skip;
        /** IntroDB.app post_credits scene {start, end} ms: a protected marker, never a segment. */
        int[] post;
        /** TheIntroDB + IntroDB.app + SkipDB combined from the stored per-source answers. */
        List<Seg> introDb;
        volatile int failMask;
        volatile long finishedAt;
        /** Stremio hand-off without a filename hint: AniList confirmed an anime entry for it. */
        volatile boolean animeVerdict;
    }
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
    private static final Map<String, String> MAL_CACHE = new ConcurrentHashMap<>();
    private static final Object CINEMETA_LOCK = new Object();
    private static final Map<String, String> CINEMETA_CACHE = new ConcurrentHashMap<>();
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    /** OP / opening / title-sequence names: anime ("OP", "Opening 2") and western ("Opening Credits", "Main Titles"). */
    private static final String OPENING_WORDS = "op\\d{0,2}|opening(?:\\s+(?:song|theme|credits|titles?|sequence))?"
            + "|(?:main|title)\\s+(?:titles?|credits?|sequence|song|theme|card)|titles?|theme(?:\\s+(?:song|music))?";
    /** a) chapter names that mean intro / recap. */
    private static final Pattern INTRO_NAME = Pattern.compile(
            "(?iu)(?:^|[^\\p{L}])(?:" + OPENING_WORDS + "|intro(?:duction)?|recap|previously(?:\\s+on)?"
                    + "|ранее в сериале|в предыдущих сериях|рекап)(?:[^\\p{L}]|$)|オープニング|あらすじ");
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
    /** Post-/mid-credit scenes and stingers: story content, never skippable (owner rule). Such a chapter is
     * never a Credits or Preview segment, and a Credits segment ends where one starts (clipPostCredit). */
    private static final Pattern POST_CREDIT_NAME = Pattern.compile(
            "(?i)(?:^|[^a-z])(?:(?:post|mid|after)[\\s_-]*credits?(?:[\\s_-]*(?:scene|sequence|stinger|tag|clip))?"
                    + "|stingers?|epilogue|bonus[\\s_-]*(?:scene|clip|content|footage))(?:[^a-z]|$)");
    /** End-credits chapter names (mirrors Stremio's CHAPTER_CREDITS): ED/ending/outro/credits
     * in any language. Vimu exposes chapters natively, so these are exact and usable for skipping. */
    private static final Pattern END_CREDITS_CHAPTER = Pattern.compile(
            "(?i)(?:^|[^a-z])(?:ed\\d{0,2}|ending|outro|credits?|end credits|ending credits|closing credits"
                    + "|end theme|ending theme|encerramento|generique de fin|abspann)(?:[^a-z]|$)|エンディング");
    /** Next-preview chapter names (mirrors Stremio's CHAPTER_PREVIEW). Same deal: exact. */
    private static final Pattern NEXT_PREVIEW_CHAPTER = Pattern.compile(
            "(?i)(?:^|[^a-z])(?:preview|pv|teaser|next episode|trailer|apercu|vorschau)(?:[^a-z]|$)|予告");

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
        String[] lines = noTags.split("\n");
        for (int i = 0; i < lines.length; i++) {
            String line = lines[i].trim();
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
        return parseNum(h) * 3600.0 + parseNum(m) * 60.0 + parseNum(s) + parseNum(ms) / 1000.0;
    }

    private static int parseNum(String v) {
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
    /** CANDIDATE_SEASON plus a bare trailing "S2" / "2"; used only to score AniList candidates (see bareSeason). */
    private static final Pattern AL_SEASON = Pattern.compile(
            "(?i)(?:(\\d+)(?:st|nd|rd|th)\\s+season|season\\s*(\\d+)|(second|third|fourth|fifth)(?:\\s+season)?$"
                    + "|\\s(ii|iii|iv)$|\\ss(\\d+)$|\\s(\\d+)$)");

    private final WeakReference<PlayerFragment> fragment;
    private boolean running;
    private e player;
    private int durationMs = Integer.MIN_VALUE;
    private List<Seg> segments;
    private int mediaKind; // 0 unknown, 1 episode, 2 movie
    /** Skipping, chapters and lookups run (episode and master switch on); the track carry-over does not depend on it. */
    private boolean lookupExpected;
    /** First positive duration of this media and how many polls in a row it has differed since (new file, same player). */
    private int baseDuration;
    private int durationChangeTicks;
    private int chapterGoneReads;
    /** Pending Stremio subtitle choice: applied once the player lists its tracks. */
    private boolean subApplied;
    private int subTries;
    private boolean subLogged;
    /** Pending preferred-audio selection: applied once tracks are known. */
    private boolean audioPending = true;
    private boolean chaptersHaveIntro;
    /** Chapters named only "Intro": undecided until online data agrees or is known absent (settleWeakIntros). */
    private final List<Seg> weakIntros = new ArrayList<>();
    /** [start, end] of post-/mid-credit scene chapters of this file; credits never extend over them. */
    private final List<int[]> postCredit = new ArrayList<>();
    /** OK pressed on the pill before the flow guard cleared: performed by the tick once it clears. */
    private Seg pendingOk;
    private long pendingOkAt;
    /** Online timestamps (AniSkip or IntroDB) for the episode; used when chapters give no intro. */
    private volatile List<Seg> remote;
    /** IntroDB.app post_credits scene of the media that produced remote (see onlinePostCredit). */
    private volatile int[] remotePost;
    /** Generation that produced remote; merge/apply only when it matches mediaGen. */
    private volatile int remoteGen = -1;
    private boolean remoteStarted;
    /** Subtitle-tail preview scan fired once per media. */
    private boolean subPreviewScanned;
    private volatile boolean remoteApplied;
    /** Bumped on every publish of a new remote list; the tick re-merges when it differs from the applied one. */
    private volatile int remoteVersion;
    private int remoteAppliedVer = -1;
    /** Failure-only refetches done for this media (max 3, backoff RETRY_BACKOFF_MS). */
    private int remoteRetries;
    /** Per-media lookup bookkeeping (which sources answered, which failed); null until started. */
    private LookupState lookup;
    private volatile boolean lookupRunning;
    /** Online segments added by the last remote merge (identity), removed again before a re-merge. */
    private final List<Seg> remoteMerged = new ArrayList<>();
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
    /** Playback diary: Vimu exposes no buffering state, so "playing but the position stands still" counts as a stall. */
    private final PlaybackDiary.Stall diaryStall = new PlaybackDiary.Stall();
    private long diaryMoveAt;
    private int flowTicks;
    private volatile long lastSeekKeyAt;
    /** A backward viewer seek landing inside a segment, or up to this far before its start, holds its auto-skip. */
    private static final int SEEK_HOLD_LEAD_MS = 2000;
    /** A forward viewer seek holds only when it lands this far inside the segment. */
    private static final int SEEK_HOLD_FORWARD_LAG_MS = 15000;
    /** Key of the segment a viewer seek landed in (or just before): no auto-skip until playback leaves it. */
    private String seekHoldKey;
    private volatile long lastOtherKeyAt;
    private boolean okDownConsumed;
    private Window hookedWindow;
    private Window.Callback hookedOriginal;
    private Window.Callback hookedProxy;
    private KeyHook hookedHook;

    // ---- On-screen "Skip intro (OK)" pill overlay ----
    private FrameLayout host;
    private TextView pill;
    private boolean pillShown;
    private boolean armed;
    private Seg pillSegment;
    private boolean controlsMethodLookedUp;
    /** Throttle for the expensive view-tree scan (see controlsVisible). */
    private long lastControlsCheckMs;
    private boolean lastControlsVisible;
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

    private static final Pattern RECAP_NAME = Pattern.compile(".*(recap|previously|あらすじ|ранее в сериале|в предыдущих сериях|рекап).*");
    /** The whole part before a song-title separator is a bare opening/ending word ("Opening", "ED2", "Ending Theme 2"). */
    private static final Pattern SONG_LABEL = Pattern.compile("(?iu)^(?:op|ed|opening|ending|outro|"
            + "(?:opening|ending) theme|オープニング|エンディング|опенинг|эндинг)(?:[\\s_.-]*(?:\\d{1,2}|[ivx]{1,3}))?$");
    private static final Pattern SONG_SEPARATOR = Pattern.compile("^(.*?)(?::|\\s[-\u2013\u2014]\\s)");

    private static final class Seg {
        final int start;
        final int end;
        final String name;
        final String rule;
        /** TheIntroDB sent a start and no end: end is -1 until resolveToEnd() gives it the runtime. */
        final boolean toEnd;
        /** TheIntroDB group_duration_ms (details=true), 0 when unknown. */
        final int groupMs;
        /** Bounds before inner-bounds narrowing against another source (-1 = not narrowed there). */
        final int wideStart;
        final int wideEnd;
        /** Zero-start conflict with another family: show as a button, never auto-skip. */
        final boolean buttonOnly;

        Seg(int start, int end, String name, String rule) {
            this(start, end, name, rule, false, 0, -1, -1);
        }

        Seg(int start, int end, String name, String rule, boolean toEnd, int groupMs) {
            this(start, end, name, rule, toEnd, groupMs, -1, -1);
        }

        Seg(int start, int end, String name, String rule, boolean toEnd, int groupMs, int wideStart, int wideEnd) {
            this(start, end, name, rule, toEnd, groupMs, wideStart, wideEnd, false);
        }

        Seg(int start, int end, String name, String rule, boolean toEnd, int groupMs, int wideStart, int wideEnd,
            boolean buttonOnly) {
            this.start = start;
            this.end = end;
            this.name = name;
            this.rule = rule;
            this.toEnd = toEnd;
            this.groupMs = groupMs;
            this.wideStart = wideStart;
            this.wideEnd = wideEnd;
            this.buttonOnly = buttonOnly;
        }

        Seg buttonOnlyCopy() {
            return new Seg(start, end, name, rule, toEnd, groupMs, wideStart, wideEnd, true);
        }

        String key() {
            return start + "-" + end;
        }

        boolean recap() {
            return name != null && RECAP_NAME.matcher(name.toLowerCase(Locale.US)).matches();
        }

        /** Online "Credits" segments, plus end-credits chapters qualified below
         * (Vimu exposes chapters natively; a chapter named "Opening Credits"
         * is a title sequence, never this). */
        boolean credits() {
            return "Credits".equals(name) && rule != null
                    && (rule.startsWith("introdb") || rule.startsWith("skipdb")
                    || rule.startsWith("chapter") || rule.startsWith("aniskip")
                    || rule.startsWith("Own times"));
        }

        /** "Preview" segments: SkipDB online ones plus qualified chapters (see loop (e)). */
        boolean preview() {
            return "Preview".equals(name);
        }

        /** A Preview guessed from the tail after the credits or from subtitle cues (no chapter name, no online segment says so). */
        boolean inferred() {
            return preview() && ("post-ed-tail".equals(rule) || "subtitle-cue".equals(rule));
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
        /** Stremio hand-off with no filename evidence either way: AniList decides (see resolveMalId). */
        boolean animeUnknown;

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
            if (extSubUrl.length() > 0 && fragment instanceof PlayerFragment
                    && (extSubUrl.startsWith("http://") || extSubUrl.startsWith("https://"))) {
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
                || keyCode == KeyEvent.KEYCODE_MEDIA_STEP_BACKWARD || keyCode == KeyEvent.KEYCODE_MEDIA_STEP_FORWARD
                // chapter / track jumps: remote "next" and "previous", channel and page keys
                || keyCode == KeyEvent.KEYCODE_MEDIA_NEXT || keyCode == KeyEvent.KEYCODE_MEDIA_PREVIOUS
                || keyCode == KeyEvent.KEYCODE_CHANNEL_UP || keyCode == KeyEvent.KEYCODE_CHANNEL_DOWN
                || keyCode == KeyEvent.KEYCODE_PAGE_UP || keyCode == KeyEvent.KEYCODE_PAGE_DOWN;
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
            Window.Callback original = window.getCallback();
            if (original == null) return;
            // A stale (retired) proxy of ours on top is unwrapped, so resumes never stack proxies.
            for (int guard = 0; guard < 8 && Proxy.isProxyClass(original.getClass()); guard++) {
                InvocationHandler h = Proxy.getInvocationHandler(original);
                if (!(h instanceof KeyHook) || !((KeyHook) h).retired) break;
                original = ((KeyHook) h).original;
            }
            KeyHook hook = new KeyHook(this, original);
            Window.Callback proxy = (Window.Callback) Proxy.newProxyInstance(Window.Callback.class.getClassLoader(),
                    new Class<?>[]{Window.Callback.class}, hook);
            window.setCallback(proxy);
            hookedWindow = window;
            hookedOriginal = original;
            hookedProxy = proxy;
            hookedHook = hook;
            Log.i(TAG, "seek-key hook installed");
        } catch (Throwable error) {
            Log.w(TAG, "hookKeys", error);
        }
    }

    /** Pass-through proxy handler; once retired (another layer sits above it) it only forwards. */
    private static final class KeyHook implements InvocationHandler {
        final Window.Callback original;
        // Weak: a retired proxy can stay in the window's chain, it must not pin a finished IntroSkip.
        final WeakReference<IntroSkip> owner;
        volatile boolean retired;

        KeyHook(IntroSkip owner, Window.Callback original) {
            this.owner = new WeakReference<>(owner);
            this.original = original;
        }

        @Override
        public Object invoke(Object o, Method method, Object[] args) throws Throwable {
            IntroSkip skip = retired ? null : owner.get();
            if (skip != null && "dispatchKeyEvent".equals(method.getName()) && args != null && args.length == 1
                    && args[0] instanceof KeyEvent) {
                try {
                    if (skip.onKey((KeyEvent) args[0])) {
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
    }

    private void unhookKeys() {
        try {
            if (hookedHook != null) hookedHook.retired = true;
            if (hookedWindow != null && hookedWindow.getCallback() == hookedProxy) {
                hookedWindow.setCallback(hookedOriginal);
            }
        } catch (Throwable error) {
            Log.w(TAG, "unhookKeys", error);
        }
        hookedWindow = null;
        hookedOriginal = null;
        hookedProxy = null;
        hookedHook = null;
    }

    /** True = key consumed. Only OK on an armed Skip pill and the addon-subtitle cycle key (green/guide, unused by Vimu) are consumed. */
    private boolean onKey(KeyEvent event) {
        if (!running || event == null) return false;
        int keyCode = event.getKeyCode();
        int action = event.getAction();
        if (VimuAddonSubs.isCycleKey(keyCode) && VimuTracks.hasAddonSubs()) { // green / guide key: next addon subtitle
            if (action == KeyEvent.ACTION_DOWN && event.getRepeatCount() == 0) VimuTracks.cycleAddonSubs();
            return true;
        }
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
            if (f != null && p != null && seg != null) requestManualSkip(f, p, seg);
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
        long now = SystemClock.uptimeMillis();
        int duration;
        boolean playingNow;
        int posNow;
        try {
            duration = realDuration(p.getDuration());
            playingNow = p.isPlaying();
            posNow = p.getCurrentPosition();
        } catch (Throwable error) {
            return;
        }
        if (p != player) {
            player = p;
            resetMedia();
        }
        durationMs = duration;
        noteDuration(duration, posNow);

        boolean skipEnabled = VimuIntroSkipPrefs.isEnabled(f);
        if (mediaKind == 0) {
            mediaKind = isEpisodeIntent(activity.getIntent()) ? 1 : 2;
            if (mediaKind == 2) {
                Log.i(TAG, "movie, skipping disabled");
                Log.i(TAG, "movie check saw: " + describeIntent(activity.getIntent()));
            }
            diaryPlay(activity);
        }
        // Skipping, chapters and lookups are for episodes with the master switch on. The track carry-over
        // below (embedded subtitle, audio language) is not skipping and runs for movies and master-off too.
        lookupExpected = skipEnabled && mediaKind != 2;

        if (firstPlayingAt == 0 && playingNow) firstPlayingAt = now;
        int moved = posNow - flowPos;
        flowPos = posNow;
        if (moved != 0 || !playingNow) diaryMoveAt = now;
        diaryStall.update(playingNow && now - diaryMoveAt >= 1000L, now, posNow);
        if (!playingNow || moved < 0 || moved >= 1500) flowTicks = 0;
        else if (moved > 0) flowTicks++;
        // Only touch subtitle/audio tracks once the decoder is steadily
        // advancing: mutating tracks during prepare crashes natively on
        // some files (decoder not initialized yet).
        if (duration > 0 && playingNow && flowTicks >= 2) {
            applyPendingSub(f, p);
            // VimuTracks owns the memory > anime > user language order; this only publishes the anime verdict to it.
            if (audioPending && !(lookupExpected && audioWaitsForAnimeVerdict(f, now))) {
                applyPendingAudio(f, p);
            }
        }
        if (!lookupExpected) {
            // Master switch off, or a movie: never skipped, no chapters, no pill, no lookups.
            current = null;
            lastPos = posNow;
            lastAt = now;
            if (pillShown) hidePill(true);
            return;
        }

        // Not before the duration is known: with duration <= 0 the last chapter has no end, a final
        // Credits chapter would be dropped, and the signature check would never read the list again.
        // A stream that still reports no duration after 20 s of playback is read anyway (as before),
        // so its chapter intros and the remote merge (needs one read) are not lost for good.
        if ((duration > 0 || (firstPlayingAt != 0 && now - firstPlayingAt >= 20000L))
                && now >= nextChapterRead && (segments == null ? chapterReads < 40 : true)) {
            chapterReads++;
            // Until found: every 3 s. Afterwards every 10 s, only to notice a new file in the same player.
            nextChapterRead = now + (segments == null ? 3000L : 10000L);
            String signature = chapterSignature(p);
            if (signature == null && chapterSignature != null) {
                // The previous file had chapters and this one reports none, twice in a row: a chapterless next file.
                if (++chapterGoneReads >= 2) {
                    Log.i(TAG, "chapter list gone: new media");
                    resetMedia();
                }
            } else {
                chapterGoneReads = 0;
            }
            if (signature != null && !signature.equals(chapterSignature)) {
                if (chapterSignature != null) {
                    Log.i(TAG, "chapter list changed: new media");
                    resetMedia();
                }
                chapterSignature = signature;
                readChapters(p, duration);
                // Chapters arriving late overwrite segments: always re-merge
                // remote afterwards so online Credits/Preview survive.
                remoteApplied = false;
            }
        }
        if (!remoteStarted && duration > 0 && playingNow) {
            remoteStarted = true;
            remoteRetries = 0;
            startRemoteLookup(f, duration, SRC_ALL);
        } else if (remoteStarted && playingNow && !lookupRunning && lookup != null
                && lookup.failMask != 0 && remoteRetries < RETRY_BACKOFF_MS.length
                && now - lookup.finishedAt >= RETRY_BACKOFF_MS[remoteRetries]) {
            // Retry only after a FAILURE (429/5xx/timeout/parse error), only the failed
            // sources, backoff 5 s / 20 s / 60 s, max 3, same media only. A source that
            // answered "no data" is final and never asked again.
            int need = lookup.failMask;
            remoteRetries++;
            Log.i(TAG, "Remote lookup failed for sources 0x" + Integer.toHexString(need)
                    + ", refetching them (" + remoteRetries + "/" + RETRY_BACKOFF_MS.length + ")");
            startRemoteLookup(f, duration, need);
        }
        // Only the current generation's remote: a stale thread's late result
        // never reaches here (it is not published), never merged into the wrong episode.
        int remoteVer = remoteVersion;
        List<Seg> fromRemote = (remoteGen == mediaGen) ? remote : null;
        if ((!remoteApplied || remoteVer != remoteAppliedVer) && fromRemote != null
                && !fromRemote.isEmpty() && chapterReads >= 1) {
            remoteApplied = true;
            remoteAppliedVer = remoteVer;
            inheritSeek = current != null && currentBySeek;
            List<Seg> usable = dropEarlyOnlineCredits(fromRemote, duration);
            List<Seg> snapped;
            try {
                snapped = snapSegments(usable, safeChapterStarts(p), duration);
            } catch (Throwable error) {
                Log.w(TAG, "remote snap", error);
                snapped = usable;
            }
            settleWeakIntros(snapped, onlineLookupDone());
            List<Seg> merged = new ArrayList<>();
            if (segments != null) {
                merged.addAll(segments);
                // A re-merge (failed source answered on retry) starts again from the
                // chapters: drop what the previous merge added from online sources.
                merged.removeAll(remoteMerged);
            }
            remoteMerged.clear();
            // IntroDB.app's post_credits scene also cuts a chapter credits/preview window that starts
            // before it, unless a post-credit chapter exists (that boundary wins); a window that
            // starts inside the scene is the file's own word and stays.
            int[] onlinePost = onlinePostCredit();
            if (onlinePost != null && postCredit.isEmpty()) {
                for (int i = merged.size() - 1; i >= 0; i--) {
                    Seg c = merged.get(i);
                    if ((c.credits() || c.preview()) && c.rule != null && c.rule.startsWith("chapter")
                            && onlinePost[0] > c.start && onlinePost[0] < c.end) {
                        Seg cut = clipAt(c, onlinePost);
                        if (cut == null) merged.remove(i);
                        else merged.set(i, cut);
                    }
                }
            }
            for (Seg s : snapped) {
                s = clipPostCredit(s);
                if (s == null) continue;
                s = guardLongCredits(s);
                // Chapters own the intro when they have one; online fills the
                // types chapters never supply (Recap/Credits/Preview) plus a
                // missing intro. Never let online wipe a chapter intro.
                boolean isIntro = !s.recap() && !s.credits() && !s.preview();
                if (isIntro && chaptersHaveIntro) continue;
                // One opening per episode: an online OP/Intro never joins another one.
                if (isIntro && hasIntroType(merged)) continue;
                // By credits(), not by name: an early bare "Credits" chapter (title sequence) is not end credits.
                if (s.credits() && hasCreditsSeg(merged)) continue;
                if (s.preview() && hasSegType(merged, "Preview")) continue;
                if (s.recap() && hasSegType(merged, "Recap")) continue;
                if (!overlapsMs(merged, s.start, s.end)) {
                    merged.add(s);
                    remoteMerged.add(s);
                }
            }
            // No preview from any source: check the tail after credits. With no
            // chapters at all, a short tail (4-16 s) is the post-ED preview;
            // with chapters, the final boundary must sit right at credits end
            // (same rule as Stremio's tail inference). Anything longer might be
            // story and is left alone.
            if (!hasSegType(merged, "Preview")) {
                Seg creditsSeg = null;
                for (Seg s : merged) {
                    if (s.credits()) {
                        creditsSeg = s;
                        break;
                    }
                }
                if (creditsSeg != null && duration > 0) {
                    long tailLen = (long) duration - creditsSeg.end;
                    if (tailLen >= 4000L && tailLen <= 16000L) {
                        long[] starts = safeChapterStarts(p);
                        boolean aligned = starts == null || starts.length == 0
                                || Math.abs(starts[starts.length - 1] - creditsSeg.end) <= 1500L;
                        if (aligned && !overlapsMs(merged, creditsSeg.end, duration)
                                && postCreditAt(creditsSeg.end, duration) == null
                                && tailChapterMayBePreview(p, starts)) {
                            Seg tail = new Seg(creditsSeg.end, duration, "Preview", "post-ed-tail");
                            merged.add(tail);
                            remoteMerged.add(tail);
                            Log.i(TAG, "Inferred post-ED tail preview " + creditsSeg.end
                                    + "-" + duration + "ms (short tail after credits)");
                        }
                    }
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
            PlaybackDiary.ev(activity, "segments", "list", diarySegs(merged));
        }
        if (!weakIntros.isEmpty() && chapterReads >= 1 && onlineLookupDone()) {
            // The merge block above already settles against an online intro; this is the no-intro path
            // (the current remote is passed anyway so it can never be bypassed).
            settleWeakIntros(remoteGen == mediaGen ? remote : null, true);
        }
        // The subtitle-tail fetch only feeds Preview segments: no request while Previews are off.
        if (!subPreviewScanned && duration > 300000 && (remoteApplied || chapterReads >= 1)
                && VimuIntroSkipPrefs.isPreviewsEnabled(f)) {
            subPreviewScanned = true;
            maybeScanVimuSubPreview(f, duration);
        }
        if (segments == null || segments.isEmpty()) {
            if (pillShown) hidePill(true);
            return;
        }

        int pos = p.getCurrentPosition();
        boolean playing = p.isPlaying();
        long elapsed = lastPos < 0 ? POLL_MS : now - lastAt;
        boolean jumped = lastPos >= 0 && (pos < lastPos - 750 || pos > lastPos + elapsed * 2.5 + 1000);
        boolean jumpedBack = jumped && pos < lastPos;
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
            if (playing) flowTicks = FLOW_TICKS;
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
        // A rewind more than 2.0 s before a skipped segment re-arms it, so every position is either
        // held (viewer seek, below) or armed, never neither.
        rearmSkipped(skipped, segments, pos);
        // A viewer seek (never our own landing: the guard above clears `jumped`, and never the
        // start/resume jump: not warm yet) holds a segment's auto-skip until playback leaves it,
        // no seek key needed. The button still shows.
        boolean warm = firstPlayingAt != 0 && now - firstPlayingAt > 3000L;
        if (seekHoldKey != null && seekHoldReleased(segments, seekHoldKey, pos)) seekHoldKey = null;
        if (jumped && warm) {
            Seg target = seekHoldTarget(segments, seg, pos, jumpedBack, recaps, previewsOn, creditsMode);
            seekHoldKey = target == null ? null : target.key();
            if (target != null) {
                Log.i(TAG, "Viewer seek " + (seg != null ? "into " : "just before ") + "'" + target.name + "' at "
                        + pos + "ms (start " + target.start + "): auto-skip held until playback leaves it");
                if (target == seg && seg == current) currentBySeek = true;
            }
        }
        if (seg != current) {
            current = seg;
            // Only a jump the USER made (warm, see seekHoldTarget) holds. Start/resume and the
            // player's own repositioning still skip.
            boolean recentSeekKey = now - lastSeekKeyAt < 5000L && firstPlayingAt != 0
                    && now - firstPlayingAt > 3000L;
            currentByJump = seg != null && jumped;
            currentBySeek = (seg != null && seg.key().equals(seekHoldKey))
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
        boolean flowing = flowTicks >= FLOW_TICKS;
        if (pendingOk != null) {
            // OK was pressed before the guard cleared: do it now if the position is still inside.
            Seg queued = pendingOk;
            if (pos < queued.start || pos >= queued.end - 400 || now - pendingOkAt > 15000L) {
                pendingOk = null;
                Log.i(TAG, "queued OK skip dropped: left '" + queued.name + "' pos=" + pos + "ms");
            } else if (playing && flowing) {
                pendingOk = null;
                hidePill(false);
                skip(f, p, queued, pos, false);
                return;
            }
        }
        boolean isCredits = seg != null && seg.credits();
        boolean isPreview = seg != null && seg.preview();
        boolean creditsOff = isCredits && VimuIntroSkipPrefs.CREDITS_OFF.equals(creditsMode);
        boolean previewsOff = isPreview && !previewsOn;
        // An inferred preview is a button, never an automatic skip: a post-credit scene and a short preview tail look the same.
        boolean inferredPreview = isPreview && seg.inferred();
        boolean buttonOnly = (isCredits && VimuIntroSkipPrefs.CREDITS_BUTTON.equals(creditsMode))
                || previewsOff || inferredPreview;
        boolean autoModeForSeg = isCredits
                ? VimuIntroSkipPrefs.CREDITS_AUTO.equals(creditsMode)
                : !manualMode && !previewsOff && !inferredPreview;
        boolean autoPending = seg != null && !creditsOff && !previewsOff && autoModeForSeg
                && !seg.buttonOnly && !currentBySeek && !skipped.contains(seg.key());
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

        boolean shouldShowPill = seg != null && !creditsOff && !previewsOff && playing && pendingOk == null
                && (!autoModeForSeg || currentBySeek || buttonOnly || seg.buttonOnly) && !autoPending;
        if (shouldShowPill) {
            if (pillSegment != seg || !pillShown) {
                Log.i(TAG, "Auto-gate blocked '" + seg.name + "': autoMode=" + autoModeForSeg
                        + " currentBySeek=" + currentBySeek + " buttonOnly=" + buttonOnly
                        + " wasSkipped=" + skipped.contains(seg.key())
                        + " currentByJump=" + currentByJump + " flowing=" + flowing);
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
            // The recursive view scan below is expensive: cache the verdict
            // briefly (controls do not appear/disappear faster than this on a TV).
            long nowMs = SystemClock.uptimeMillis();
            if (nowMs - lastControlsCheckMs < 500L) return lastControlsVisible;
            boolean answer = controlsVisibleScan(f);
            lastControlsCheckMs = nowMs;
            lastControlsVisible = answer;
            return answer;
        } catch (Throwable error) {
            return false;
        }
    }

    private boolean controlsVisibleScan(PlayerFragment f) {
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

    private void startRemoteLookup(PlayerFragment f, final int durationMs, final int need) {
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
        if (lookup == null) {
            lookup = new LookupState();
        }
        final LookupState state = lookup;
        lookupRunning = true;
        final long lookupStartedAt = SystemClock.uptimeMillis();
        new Thread(new Runnable() {
            @Override
            public void run() {
                DEADLINE_MS.set(SystemClock.uptimeMillis() + LOOKUP_BUDGET_MS);
                int failed = 0;
                try {
                    // AniList/AniSkip: any failure here (429, 5xx, timeout, parse error)
                    // only marks this source failed; the IMDb-keyed sources still run.
                    if ((need & SRC_ANI) != 0) {
                        if (animeEnabled) {
                            try {
                                DEADLINE_MS.set(SystemClock.uptimeMillis() + LOOKUP_BUDGET_MS);
                                if (!state.malResolved) {
                                    state.malMapped = resolveMalId(ctx, info.title, info.season,
                                            info.episode, info.looksLikeAnime, info.animeUnknown);
                                    state.animeVerdict = info.animeUnknown && state.malMapped != null
                                            && state.malMapped.length > 0 && state.malMapped[0] > 0;
                                    state.malResolved = true;
                                }
                                List<Seg> ani = fetchAniSkipWithMal(ctx, state.malMapped, info.episode,
                                        durationMs);
                                if (ani == null) {
                                    failed |= SRC_ANI;
                                } else {
                                    state.ani = ani;
                                }
                            } catch (Throwable error) {
                                Log.w(TAG, "AniList lookup failed, other sources still run: " + error);
                                failed |= SRC_ANI;
                            }
                        } else {
                            Log.i(TAG, "AniSkip skipped: disabled in settings");
                        }
                    }
                    if (gen == mediaGen) {
                        // Fresh budget for the IMDb side so AniList never starves
                        // IntroDB.app and SkipDB.
                        DEADLINE_MS.set(SystemClock.uptimeMillis() + LOOKUP_BUDGET_MS);
                        ParsedMedia mapped = applyMalRemap(info, state.malMapped);
                        failed |= fetchIntroDb(ctx, mapped, durationMs, state, need);
                    }
                    List<Seg> out = mergeRemote(state.ani, state.introDb, durationMs);
                    state.failMask = failed;
                    state.finishedAt = SystemClock.uptimeMillis();
                    // A stale generation is never published: the tick only merges
                    // remote stamped with the current media.
                    if (gen == mediaGen && state == lookup) {
                        remotePost = state.post;
                        remote = out;
                        remoteGen = gen;
                        remoteVersion++;
                        Log.i(TAG, "Remote applied: " + out.size() + " segments (gen " + gen
                                + ", failed sources 0x" + Integer.toHexString(failed) + ")");
                        PlaybackDiary.ev("lookup.result", "ms", SystemClock.uptimeMillis() - lookupStartedAt, "failmask", failed, "ani", state.ani == null ? "fail" : state.ani.isEmpty() ? "nodata" : "ok", "tidb", state.tidb == null ? "fail" : state.tidb.isEmpty() ? "nodata" : "ok", "app", state.app == null ? "fail" : state.app.isEmpty() ? "nodata" : "ok", "skipdb", state.skip == null ? "fail" : state.skip.isEmpty() ? "nodata" : "ok", "segs", diarySegs(out));
                    } else {
                        Log.i(TAG, "Remote discarded: gen " + gen + " vs media " + mediaGen
                                + ", n=" + out.size());
                    }
                } catch (Throwable error) {
                    Log.w(TAG, "Remote lookup failed: " + error);
                    state.failMask = need;
                    state.finishedAt = SystemClock.uptimeMillis();
                } finally {
                    DEADLINE_MS.remove();
                    if (state == lookup) lookupRunning = false;
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
    private static ParsedMedia handedMedia(boolean animeFileName) {
        if (!extHaveMedia) return null;
        if (extEpisode > 0 && (extTitle.length() > 0 || extImdbId.length() > 0)) {
            String title = extTitle.length() > 0 ? extTitle : extImdbId;
            ParsedMedia media = new ParsedMedia(title, extSeason > 0 ? extSeason : 1,
                    extEpisode, null, animeFileName, "stremio-extra");
            media.animeUnknown = !animeFileName;
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
        List<String> candidates = collectCandidates(intent);
        if (extHaveMedia) {
            // Stremio's identity wins, but the file name still tells anime (release group,
            // CRC tag, "Show - 05") exactly as for a plain file launch.
            boolean animeFileName = false;
            for (String raw : candidates) {
                ParsedMedia m = parseCandidate(raw);
                if (m != null && m.episode > 0 && m.looksLikeAnime) {
                    animeFileName = true;
                    break;
                }
            }
            ParsedMedia handed = handedMedia(animeFileName);
            if (handed != null) return handed;
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

    /** Every string in the playing intent that may carry a release or file name. */
    private static List<String> collectCandidates(Intent intent) {
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
        return candidates;
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

    /**
     * Part-2 absolute numbering ("E19") remapped to the season/episode the
     * IMDb-keyed databases use ("S2E7"), reusing one resolveMalId verdict
     * (never re-resolving here, so no duplicate AniList traffic).
     * Never overrides a season Stremio handed over, and never drops the
     * handed-over IMDb id. Returns info unchanged on any failure.
     */
    private static ParsedMedia applyMalRemap(ParsedMedia info, int[] mapped) {
        if (info == null || mapped == null || mapped.length < 3) return info;
        try {
            if ("stremio-extra".equals(info.raw)) return info;
            int bump = mapped[2];
            if (bump > 0 && info.season == 1 && mapped[1] > 0 && mapped[1] != info.episode) {
                Log.i(TAG, "AniList: season " + info.season + " episode " + info.episode
                        + " remapped to season " + (info.season + bump) + " episode " + mapped[1]
                        + " for IntroDB/SkipDB");
                ParsedMedia out = new ParsedMedia(info.title, info.season + bump, mapped[1],
                        info.year, info.looksLikeAnime, info.raw);
                out.imdbId = info.imdbId;
                return out;
            }
        } catch (Throwable error) {
            Log.w(TAG, "season remap failed", error);
        }
        return info;
    }

    /** AniSkip first; IntroDB/app/SkipDB fill the types AniSkip lacks (Credits et al). */
    private static List<Seg> mergeRemote(List<Seg> primary, List<Seg> fallback) {
        return mergeRemote(primary, fallback, 0);
    }

    private static List<Seg> mergeRemote(List<Seg> primary, List<Seg> fallback, int durationMs) {
        // A mislabeled early credits must not take the type or the opening's time range from a real segment.
        primary = dropEarlyOnlineCredits(primary, durationMs);
        fallback = dropEarlyOnlineCredits(fallback, durationMs);
        List<Seg> merged = new ArrayList<>();
        if (primary != null) merged.addAll(primary);
        // Own times beat AniSkip for their types (named chapters still win in the tick merge).
        if (fallback != null) {
            for (Seg o : fallback) {
                if (!ownRule(o.rule)) continue;
                for (int i = merged.size() - 1; i >= 0; i--) {
                    if (kindOf(merged.get(i)).equals(kindOf(o))) merged.remove(i);
                }
            }
        }
        if (fallback != null) {
            for (Seg s : fallback) {
                if (hasSegType(merged, s.name)) continue;
                // AniSkip already gave the opening ("OP"): a differently named fallback
                // "Intro" elsewhere is not a second intro. Credits/Recap/Preview still fill.
                if (isIntroClass(s) && hasIntroType(merged)) continue;
                if (overlapsMs(merged, s.start, s.end)) continue;
                merged.add(s);
            }
            // Inner bounds against the IntroDB chain (15 s agreement keeps the overlap only). A window
            // already on chapter boundaries must not narrow: chapters are not known here, so the wide
            // bounds travel with the segment and snapSegments() restores them in that case.
            for (int i = 0; i < merged.size(); i++) {
                Seg orig = merged.get(i);
                Seg cur = narrowFrom(orig, orig, fallback, durationMs, true);
                if (!cur.buttonOnly) {
                    Seg hit = zeroConflictIn(orig, primary);
                    if (hit == null) hit = zeroConflictIn(orig, fallback);
                    if (hit == null) hit = buttonOnlyOverlapIn(orig, fallback);
                    if (hit == null) hit = buttonOnlyOverlapIn(orig, primary);
                    if (hit != null) {
                        cur = cur.buttonOnlyCopy();
                        Log.i(TAG, "Zero-start " + kindOf(orig) + " button only: [" + orig.rule + "] "
                                + orig.start + "-" + orig.end + "ms vs [" + hit.rule + "] "
                                + hit.start + "-" + hit.end + "ms");
                    }
                }
                if (cur != orig) merged.set(i, cur);
            }
        }
        for (int i = 0; i < merged.size(); i++) {
            Seg s = merged.get(i);
            if (s.buttonOnly) continue;
            Seg hit = zeroConflictIn(s, primary);
            if (hit == null) hit = zeroConflictIn(s, fallback);
            if (hit != null) {
                merged.set(i, s.buttonOnlyCopy());
                Log.i(TAG, "Zero-start " + kindOf(s) + " button only: [" + s.rule + "] "
                        + s.start + "-" + s.end + "ms vs [" + hit.rule + "] "
                        + hit.start + "-" + hit.end + "ms");
            }
        }
        Collections.sort(merged, new Comparator<Seg>() {
            @Override
            public int compare(Seg a, Seg b) {
                return Integer.compare(a.start, b.start);
            }
        });
        return merged;
    }

    /** AniSkip query from an already-resolved MAL verdict (no second resolve). */
    private static List<Seg> fetchAniSkipWithMal(Context ctx, int[] mapped, int fallbackEpisode,
                                                 int durationMs) {
        List<Seg> out = new ArrayList<>();
        try {
            int malId = mapped == null || mapped.length < 2 ? 0 : mapped[0];
            int episode = mapped == null || mapped.length < 2 ? fallbackEpisode : mapped[1];
            if (malId <= 0) {
                Log.i(TAG, "AniSkip: no confident MAL id (malId=" + malId + ")");
                return out;
            }
            if (episode != fallbackEpisode) {
                Log.i(TAG, "AniList: episode " + fallbackEpisode + " mapped to episode " + episode + " of part 2");
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
                if (!"op".equals(type) && !"ed".equals(type) && !"recap".equals(type)) continue;
                double theirLen = item.optDouble("episodeLength", 0.0);
                double diff = (episodeLengthSec > 0 && theirLen > 0)
                        ? Math.abs(theirLen - episodeLengthSec) : Double.MAX_VALUE;
                int startMs = (int) Math.round(startSec * 1000.0);
                int endMs = (int) Math.round(endSec * 1000.0);
                candidates.add(new AniSkipCandidate(startMs, endMs,
                        "recap".equals(type) ? "Recap" : "ed".equals(type) ? "Credits" : "OP", theirLen, diff));
            }

            // Per type (OP, then ED as Credits, then Recap) choose the submission whose episodeLength
            // best matches the real duration; one segment per type.
            Collections.sort(candidates, new Comparator<AniSkipCandidate>() {
                @Override
                public int compare(AniSkipCandidate a, AniSkipCandidate b) {
                    int ra = aniSkipRank(a.name);
                    int rb = aniSkipRank(b.name);
                    if (ra != rb) return ra < rb ? -1 : 1;
                    return Double.compare(a.lengthDiffSec, b.lengthDiffSec);
                }
            });

            StringBuilder summary = new StringBuilder();
            for (AniSkipCandidate c : candidates) {
                if (hasSegType(out, c.name)) continue;
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
            return null; // null = FAILED (refetched later); an empty list is final "no data"
        }
        return out;
    }

    private static int aniSkipRank(String name) {
        return "OP".equals(name) ? 0 : "Credits".equals(name) ? 1 : 2;
    }

    private static JSONArray queryAniSkip(int malId, int episode, long episodeLengthSec) throws Exception {
        String url = ANISKIP_URL + malId + "/" + episode
                + "?types=op&types=ed&types=recap&episodeLength=" + episodeLengthSec;
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
        return resolveMalId(ctx, title, season, episode, looksLikeAnime, false);
    }

    /**
     * animeUnknown = Stremio hand-off with no anime/western evidence in the file name: the strict
     * western rule still applies, plus a gated middle tier (see below) that confirms real anime.
     */
    private static int[] resolveMalId(Context ctx, String title, int season, int episode,
                                      boolean looksLikeAnime, boolean animeUnknown)
            throws Exception {
        title = stripYearRange(title);
        int wanted = season > 0 ? season : 1;
        boolean wantedPart2 = PART_TWO.matcher(title).find();
        String cleanTitle = PART_TWO.matcher(title).replaceAll(" ").replaceAll("\\s+", " ").trim();
        if (cleanTitle.length() == 0) cleanTitle = title;
        String base = normTitle(cleanTitle);
        String cacheKey = base + "|s" + wanted + "|a" + (looksLikeAnime ? 1 : animeUnknown ? 2 : 0) + (wantedPart2 ? "|p2" : "");

        int[] cached = getCachedMal(ctx, cacheKey, episode);
        if (cached != null) {
            return cached;
        }
        Long missAt = MAL_MISS.get(cacheKey);
        if (missAt != null) {
            if (SystemClock.uptimeMillis() - missAt < MISS_TTL_MS) {
                Log.i(TAG, "AniList: negative cache hit for '" + cacheKey + "'");
                return new int[]{0, episode, 0};
            }
            MAL_MISS.remove(cacheKey);
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
        boolean bestSeasonOk = false;
        String bestFormat = "";
        int part1Episodes = 0;
        double part1Similarity = 0.0;
        int secondId = 0;
        double secondScore = -9.0;
        double secondSimilarity = 0.0;
        int secondSeason = 0;
        int secondEpisodes = 0;
        StringBuilder report = new StringBuilder();
        int sent = 0;
        int answered = 0;

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
            sent++;
            if (media == null) continue;
            answered++;

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
                    candidateSeason = Math.max(candidateSeason, candidateSeasonOf(name, base));
                    part2 |= PART_TWO.matcher(name).find();
                    String stripped = stripSeason(name, base);
                    String plain = normTitle(stripped);
                    similarity = Math.max(similarity, dice(base, plain));
                    String plainNoPart = normTitle(PART_TWO.matcher(stripped).replaceAll(" "));
                    similarity = Math.max(similarity, dice(base, plainNoPart) - (part2 == wantedPart2 ? 0.0 : 0.12));
                }

                String format = m.optString("format", "");
                // Anime-styled file with an explicit later season: a wrong-season entry must not
                // pass the 0.60 floor on a perfect title alone (S1 timings applied to S2).
                double score = similarity + (candidateSeason == wanted ? 0.3 : (looksLikeAnime && wanted > 1 ? -0.8 : -0.5))
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
                    secondId = bestId;
                    secondScore = bestScore;
                    secondSimilarity = bestSimilarity;
                    secondSeason = bestSeasonOk ? wanted : 0;
                    secondEpisodes = bestEpisodes;
                    bestScore = score;
                    bestSimilarity = similarity;
                    bestId = malId;
                    bestEpisodes = episodes;
                    bestIsPart2 = part2;
                    bestSeasonOk = candidateSeason == wanted;
                    bestFormat = format;
                } else if (malId != bestId && score > secondScore) {
                    secondId = malId;
                    secondScore = score;
                    secondSimilarity = similarity;
                    secondSeason = candidateSeason;
                    secondEpisodes = episodes;
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
        boolean accepted = bestId > 0 && bestScore >= minScore && bestSimilarity >= minSim;
        if (!accepted && animeUnknown && bestId > 0 && bestSimilarity >= 0.75 && bestSeasonOk
                && ("TV".equals(bestFormat) || "TV_SHORT".equals(bestFormat) || "ONA".equals(bestFormat))
                && bestEpisodes > 0 && episode <= bestEpisodes) {
            // Hand-off without filename evidence: a close title on a TV-format anime entry of
            // the same season whose episode count covers this episode. Season mismatch, movies,
            // OVAs and weak titles (The Boys scored 0.6) never reach this branch.
            Log.i(TAG, "AniList: middle-tier accept for hand-off media (sim=" + fmt1(bestSimilarity * 100.0)
                    + "%, " + bestFormat + ", eps=" + bestEpisodes + ")");
            accepted = true;
        }
        if (!accepted) {
            // Only a clean answer to every search counts as "no": a malformed response is not remembered.
            if (sent > 0 && answered == sent) MAL_MISS.put(cacheKey, SystemClock.uptimeMillis());
            return new int[]{0, episode, 0};
        }
        // A different series whose title matches better must not lose only on the format bonus:
        // a near-tie where the runner-up is a closer title (or the same score) is refused.
        boolean bestHolds = bestEpisodes == 0 || episode <= bestEpisodes;
        boolean secondHolds = secondEpisodes == 0 || episode <= secondEpisodes;
        if (secondId > 0 && secondId != bestId && secondSeason == wanted && (!bestHolds || secondHolds)
                && ((secondSimilarity > bestSimilarity && bestScore - secondScore <= 0.4)
                || bestScore - secondScore <= 1e-9)) {
            Log.i(TAG, "AniList: near-tie between " + bestId + " (score " + fmt1(bestScore * 100.0) + ") and "
                    + secondId + " (score " + fmt1(secondScore * 100.0) + "), match refused");
            return new int[]{0, episode, 0};
        }
        MAL_MISS.remove(cacheKey);

        int offset = (bestIsPart2 && part1Episodes > 0 && episode > part1Episodes) ? part1Episodes : 0;
        String cacheKeyToStore = offset > 0 ? (cacheKey + "|ep>" + part1Episodes) : cacheKey;
        putCachedMal(ctx, cacheKeyToStore, bestId, bestEpisodes, offset);
        if (offset > 0) {
            // Also record the part1 boundary on the base key so future episodes know where part 2 starts,
            // unless a cour-1 entry already sits there (it routes episodes > its length to this part-2 entry).
            String baseRaw = getRawCacheEntry(ctx, cacheKey);
            int[] baseEntry = baseRaw == null ? null : parseCacheEntry(baseRaw);
            if (baseEntry == null || baseEntry[2] < 0) putCachedMal(ctx, cacheKey, bestId, part1Episodes, -1);
        }
        return new int[]{bestId, episode - offset, offset > 0 ? 1 : 0};
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
            // The base entry of a split-cour show holds the part-2 id (offset -1, maxEps = part-1
            // length); a part-1 episode must not take that id, so it re-resolves instead.
            if (offset < 0 && maxEps > 0 && episode <= maxEps) return null;
            String part2Raw = getRawCacheEntry(ctx, key + "|ep>" + maxEps);
            if (part2Raw == null) return null;
            int[] p2 = parseCacheEntry(part2Raw);
            if (p2 == null) return null;
            Log.i(TAG, "AniList cache hit (part 2) for '" + key + "' -> idMal=" + p2[0]);
            return new int[]{p2[0], Math.max(1, episode - Math.max(0, p2[2])), p2[2] > 0 ? 1 : 0};
        }
        Log.i(TAG, "AniList cache hit for '" + key + "' -> idMal=" + malId);
        return new int[]{malId, Math.max(1, episode - Math.max(0, offset)), offset > 0 ? 1 : 0};
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
    private static int fetchIntroDb(Context ctx, ParsedMedia info, int durationMs, LookupState st, int need) {
        durationMs = realDuration(durationMs); // a placeholder length is unknown: nothing below judges on it
        int failed = 0;
        final int imdbSources = SRC_TIDB | SRC_APP | SRC_SKIP;
        if ((need & imdbSources) == 0) return 0;
        try {
            // The IMDb id is resolved once. A Cinemeta failure leaves it unresolved (the
            // three IMDb-keyed sources count as failed); "no such show" is a final answer.
            if (st.imdbId == null) {
                String found = info.imdbId;
                if (found == null || found.length() == 0) {
                    found = cinemetaImdbId(ctx, info.title, info.year);
                }
                if (found == null) {
                    Log.i(TAG, "IntroDB: Cinemeta failed for '" + info.title + "', IMDb sources retried later");
                    return need & imdbSources;
                }
                if (found.length() == 0) {
                    Log.i(TAG, "IntroDB skipped: no IMDb id found for '" + info.title + "'");
                }
                st.imdbId = found;
            }
            String id = st.imdbId;
            if (id.length() == 0) {
                st.introDb = new ArrayList<Seg>();
                return 0;
            }
            Log.i(TAG, "IntroDB: looking up imdb=" + id + " S" + info.season + "E" + info.episode);
            // Judged again whenever the runtime changes to a real value (a lookup that ran on an unknown one kept nothing).
            if (st.own == null || (durationMs > 0 && st.ownRuntime != durationMs)) {
                st.own = fetchOwnTimes(id, info.season, info.episode, durationMs);
                st.ownRuntime = durationMs;
            }
            // Each source has its own failure scope: a failed TheIntroDB must not hide
            // IntroDB.app or SkipDB, and none of them can stop the others.
            if ((need & SRC_TIDB) != 0) {
                try {
                    String tvdbId = "";
                    String tmdbId = "";
                    boolean idsFailed = false;
                    if (isImdbId(id)) {
                        String[] ids = cinemetaIds(ctx, id);
                        if (ids == null) {
                            idsFailed = true;
                        } else {
                            tvdbId = ids[0];
                            tmdbId = ids[1];
                        }
                    }
                    List<Seg> list = parseTheIntroDb(
                            theIntroDbQuery(id, tvdbId, tmdbId, info.season, info.episode, durationMs));
                    if (list.isEmpty() && idsFailed) {
                        // The tvdb/tmdb identities could not be tried, so "empty" is not final.
                        throw new java.io.IOException("Cinemeta ids lookup failed, TheIntroDB inconclusive");
                    }
                    // A to-end segment gets the runtime as its end here, so a raw -1 end never
                    // leaves this method and a dropped one blocks nothing from IntroDB.app/SkipDB.
                    st.tidb = resolveToEnd(list, durationMs);
                } catch (Throwable error) {
                    Log.w(TAG, "TheIntroDB lookup failed, fallbacks still run: " + error);
                    failed |= SRC_TIDB;
                }
            }
            List<Seg> out = new ArrayList<Seg>();
            if (st.own != null) out.addAll(st.own);
            if (st.tidb != null) {
                for (Seg s : st.tidb) {
                    if (st.own != null && hasSegType(st.own, s.name)
                            && !("Credits".equals(s.name) && durationMs > 0 && s.start < durationMs * 0.40)) {
                        Log.i(TAG, "Own times: replacing " + s.name + " from " + s.rule
                                + " (" + s.start + "-" + s.end + "ms)");
                        continue;
                    }
                    out.add(s);
                }
            }
            // IntroDB.app fills only the segment types TheIntroDB has nothing for,
            // and evicts a mislabeled early "Credits" overlapping its Intro.
            // Refresh the budget first: slow identity misses must never starve
            // the sources that actually hold the data.
            if (isImdbId(id) && info.season > 0 && info.episode > 0) {
                if ((need & SRC_APP) != 0) {
                    Long curDeadline = DEADLINE_MS.get();
                    long minFallbackDeadline = SystemClock.uptimeMillis() + 6000L;
                    if (curDeadline == null || curDeadline < minFallbackDeadline) {
                        DEADLINE_MS.set(minFallbackDeadline);
                    }
                    List<Seg> got = fetchIntroDbApp(id, info.season, info.episode);
                    if (got == null) failed |= SRC_APP;
                    else st.app = takePostCredits(got, st);
                }
                // An early online Credits is a mislabeled opening: it must not block the real credits or
                // intro of the later sources. Promoted to Intro when no source has one, dropped otherwise.
                settleEarlyCredits(out, hasSegType(out, "Intro")
                        || (st.app != null && hasSegType(st.app, "Intro")), durationMs);
                for (Seg app : st.app == null ? new ArrayList<Seg>() : st.app) {
                    if ("Intro".equals(app.name)) {
                        for (int i = out.size() - 1; i >= 0; i--) {
                            Seg existing = out.get(i);
                            if ("Intro".equals(existing.name) && existing.start <= 500 && app.start > 5000
                                    && !ownRule(existing.rule) && !zeroConflict(existing, app)) {
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
            settleEarlyCredits(out, true, durationMs); // what is still early (IntroDB.app credits) goes
            // SkipDB fills only the segment types neither source has (previews included), and is
            // always read: it is also the other voice the earlier windows are narrowed against.
            if (isImdbId(id) && info.season > 0 && info.episode > 0) {
                if ((need & SRC_SKIP) != 0) {
                    List<Seg> got = fetchSkipDb(id, info.season, info.episode, durationMs);
                    if (got == null) failed |= SRC_SKIP;
                    else st.skip = got;
                }
                for (Seg s : st.skip == null ? new ArrayList<Seg>() : dropEarlyOnlineCredits(st.skip, durationMs)) {
                    if (hasSegType(out, s.name)) {
                        continue;
                    }
                    if (overlapsMs(out, s.start, s.end)) continue;
                    out.add(s);
                }
            }
            // Inner bounds, last, so the fill/replace/promotion above work on the raw inputs.
            narrowInto(out, st.tidb, st.app, st.skip, durationMs);
            for (int i = 0; i < out.size(); i++) {
                Seg s = out.get(i);
                if (s.buttonOnly) continue;
                Seg hit = zeroConflictIn(s, st.tidb);
                if (hit == null) hit = zeroConflictIn(s, st.app);
                if (hit == null) hit = zeroConflictIn(s, st.skip);
                if (hit != null) {
                    out.set(i, s.buttonOnlyCopy());
                    Log.i(TAG, "Zero-start " + kindOf(s) + " button only: [" + s.rule + "] "
                            + s.start + "-" + s.end + "ms vs [" + hit.rule + "] "
                            + hit.start + "-" + hit.end + "ms");
                }
            }
            Collections.sort(out, new Comparator<Seg>() {
                @Override
                public int compare(Seg a, Seg b) {
                    return Integer.compare(a.start, b.start);
                }
            });
            st.introDb = out;
            Log.i(TAG, "IntroDB: imdb=" + id + " S" + info.season + "E" + info.episode
                    + " -> " + out.size() + " segment(s)" + (failed != 0 ? ", failed 0x" + Integer.toHexString(failed) : ""));
            return failed;
        } catch (Throwable error) {
            Log.w(TAG, "IntroDB lookup failed: " + error);
            return need & imdbSources;
        }
    }

    /** TheIntroDB answer to segments; throws on a malformed body (counts as a failed source). */
    private static List<Seg> parseTheIntroDb(JSONObject body) throws Exception {
        List<Seg> out = new ArrayList<Seg>();
        // details=true: the duration of the cut the timings were measured on (checked in resolveToEnd).
        int groupMs = body.isNull("group_duration_ms") ? 0 : Math.max(0, body.optInt("group_duration_ms", 0));
        // Process "intro" before "recap" so a recap can never suppress an overlapping intro.
        // "preview" last: it never suppresses a real segment, an overlapping one yields to them.
        String[] kinds = {"intro", "recap", "credits", "preview"};
        for (int k = 0; k < kinds.length; k++) {
            String kind = kinds[k];
            JSONArray items = body.optJSONArray(kind);
            for (int i = 0; items != null && i < items.length(); i++) {
                JSONObject item = items.getJSONObject(i);
                // Reject incomplete entries with null start_ms (would fabricate 0.0s; credits 0..end would skip the episode).
                if (item.isNull("start_ms") && ("intro".equals(kind) || "recap".equals(kind)
                        || "credits".equals(kind) || "preview".equals(kind))) {
                    Log.i(TAG, "IntroDB: skipped " + kind + " with null start_ms");
                    continue;
                }
                // A credits/preview with a real start and no end runs to the end of the file: kept as
                // to-end (end -1) for resolveToEnd(). The post-credit scene it could swallow is
                // protected by IntroDB.app's post_credits marker and by post-credit chapters.
                // Intro and recap with no end stay ignored, as does a 0 or unparseable start.
                if (item.isNull("end_ms")) {
                    int open = item.optInt("start_ms", -1);
                    if (open > 0 && ("credits".equals(kind) || "preview".equals(kind))) {
                        String openName = "credits".equals(kind) ? "Credits" : "Preview";
                        Seg prev = lastOfType(out, openName);
                        if (prev == null || !prev.toEnd) { // two to-end segments of one type: first wins
                            out.add(new Seg(open, -1, openName, "introdb", true, groupMs));
                            Log.i(TAG, "IntroDB: " + kind + " " + open + "ms -> end (to-end, group duration "
                                    + (groupMs > 0 ? groupMs + "ms" : "unknown") + ")");
                        }
                    } else {
                        Log.i(TAG, "IntroDB: ignored " + kind + " with unknown end_ms");
                    }
                    continue;
                }
                int start = item.isNull("start_ms") ? 0 : item.optInt("start_ms", -1);
                int end = item.optInt("end_ms", -1);
                if ("recap".equals(kind) && start <= 500) {
                    Log.i(TAG, "IntroDB: skipped 0:00 recap (" + start + "ms)");
                    continue;
                }
                // An entry with no end, or longer than 10 min, would skip the episode itself.
                if (start < 0 || end <= start || end - start > 600000) continue;
                if (overlapsMs(out, start, end)) continue;
                String name = "recap".equals(kind) ? "Recap" : "credits".equals(kind) ? "Credits"
                        : "preview".equals(kind) ? "Preview" : "Intro";
                out.add(new Seg(start, end, name, "introdb"));
            }
        }
        return out;
    }

    private static Seg lastOfType(List<Seg> segs, String name) {
        Seg last = null;
        for (Seg s : segs) {
            if (s.name.equals(name)) last = s;
        }
        return last;
    }

    /** Group duration may differ from this file by this much (AniSkip's episodeLength tolerance). */
    private static final int TOEND_GROUP_TOLERANCE_MS = 8000;

    /**
     * Gives every to-end segment (start, no end) the file runtime as its end; the result holds no
     * raw -1 end. A to-end segment is dropped (never held back, the lookup only runs with a
     * known runtime) when: the runtime is unknown, the group duration is more than 8 s from this
     * file (a different cut), it starts before 60% of the runtime, credits would run over 10
     * minutes, or a bounded segment of the same type already covers it. A credits segment is cut
     * where a preview inside it starts, so the preview survives.
     */
    private static List<Seg> resolveToEnd(List<Seg> list, int durationMs) {
        List<Seg> out = new ArrayList<Seg>(list.size());
        for (Seg s : list) {
            if (!s.toEnd) out.add(s);
        }
        for (Seg s : list) {
            if (!s.toEnd) continue;
            String why = null;
            if (durationMs <= 0) {
                why = "runtime not known";
            } else if (s.groupMs > 0 && Math.abs(s.groupMs - durationMs) > TOEND_GROUP_TOLERANCE_MS) {
                why = "group duration " + s.groupMs + "ms differs from runtime " + durationMs + "ms by more than 8 s";
            } else if (s.start < durationMs * 0.60) {
                why = "start is before 60% of runtime " + durationMs + "ms";
            } else if (s.start >= durationMs) {
                why = "start is not before runtime " + durationMs + "ms";
            } else if ("Credits".equals(s.name) && durationMs - s.start > 600000) {
                why = "credits would run over 10 minutes";
            }
            int end = durationMs;
            if (why == null && "Credits".equals(s.name)) {
                for (Seg o : list) {
                    if (o != s && o.name.equals("Preview") && o.start > s.start && o.start < end
                            && o.start - s.start >= 10000) {
                        end = o.start;
                        Log.i(TAG, "IntroDB: to-end credits cut at preview " + o.start + "ms");
                        break;
                    }
                }
            }
            if (why == null) {
                // Same type always blocks; a preview also yields to every other type (as a bounded one
                // does in parseTheIntroDb), so a resolved window never sits on top of another one.
                for (Seg o : out) {
                    if ((o.name.equals(s.name) || "Preview".equals(s.name))
                            && Math.min(o.end, end) - Math.max(o.start, s.start) > 1000) {
                        why = "a " + o.name + " " + o.start + "-" + o.end + "ms already covers it";
                        break;
                    }
                }
            }
            if (why != null) {
                Log.i(TAG, "IntroDB: to-end " + s.name + " " + s.start + "ms dropped: " + why);
                continue;
            }
            out.add(new Seg(s.start, end, s.name, "introdb to-end", false, s.groupMs));
            Log.i(TAG, "IntroDB: to-end " + s.name + " resolved " + s.start + "-" + end
                    + "ms (runtime " + durationMs + "ms, group duration "
                    + (s.groupMs > 0 ? s.groupMs + "ms" : "unknown") + ")");
        }
        return out;
    }

    /** Takes the IntroDB.app post_credits marker out of the answer: it is never a segment. */
    private static List<Seg> takePostCredits(List<Seg> got, LookupState st) {
        List<Seg> keep = new ArrayList<Seg>(got.size());
        for (Seg s : got) {
            if ("PostCredits".equals(s.name)) {
                st.post = new int[]{s.start, s.end};
                Log.i(TAG, "IntroDB.app post_credits " + s.start + "-" + s.end + "ms: protected, never skippable");
            } else {
                keep.add(s);
            }
        }
        return keep;
    }

    private static final int INNER_TOL_MS = 15000;
    private static final int INNER_MIN_MS = 1000;
    private static final int DAY_MS = 86400000;

    /** Source families: 1 TheIntroDB, 2 IntroDB.app/SkipDB, 3 AniSkip; 0 = chapters/Own/other. */
    private static int familyOf(String rule) {
        if (rule == null) return 0;
        if (rule.startsWith("introdb.app") || rule.startsWith("skipdb")) return 2;
        if (rule.startsWith("aniskip")) return 3;
        if (rule.startsWith("introdb")) return 1;
        return 0;
    }

    /** True when a (<= 0.5 s start) is contradicted by b of another family holding the
     * same type entirely elsewhere: no overlap and b starts > 15 s after a. */
    static boolean zeroConflict(Seg a, Seg b) {
        int fa = familyOf(a.rule), fb = familyOf(b.rule);
        if (fa == 0 || fb == 0 || fa == fb) return false;
        if (a.start > 500 || a.end <= a.start || b.end <= b.start) return false;
        return b.start > a.start + 15000 && b.start >= a.end;
    }

    private static Seg buttonOnlyOverlapIn(Seg s, List<Seg> raws) {
        if (raws == null) return null;
        String kind = kindOf(s);
        for (Seg raw : raws) {
            if (raw.buttonOnly && kind.equals(kindOf(raw))
                    && Math.min(s.end, raw.end) - Math.max(s.start, raw.start) > 0) return raw;
        }
        return null;
    }

    private static Seg zeroConflictIn(Seg s, List<Seg> raws) {
        if (raws == null) return null;
        String kind = kindOf(s);
        if (!"op".equals(kind) && !"recap".equals(kind)) return null;
        for (Seg raw : raws) {
            if (raw != s && kind.equals(kindOf(raw)) && zeroConflict(s, raw)) return raw;
        }
        return null;
    }

    private static String kindOf(Seg s) {
        return s.recap() ? "recap" : "Credits".equals(s.name) ? "credits" : s.preview() ? "preview" : "op";
    }

    private static boolean chapterRule(String rule) {
        return rule != null && (rule.startsWith("chapter") || rule.contains("+snap"));
    }

    private static boolean unboundedToEnd(Seg s) {
        if (s.end <= s.start || s.end > DAY_MS) return true;
        String rule = s.rule == null ? "" : s.rule.toLowerCase(Locale.US);
        // A narrowed segment carries a real end even if one parent was to-end.
        if (rule.contains("inner-bounds")) return false;
        return rule.contains("to-end") || rule.contains("to end");
    }

    /**
     * Skip only the part two sources agree on: same type, overlapping by over 1 s, both starts and
     * both ends within 15 s gives {max(starts), min(ends)}, else null (keep a). A credits window that
     * runs to the end of the file (a to-end or EOF end) takes the other source's real end. Chapter
     * windows never narrow. runtimeMs <= 0 = unknown (EOF detection off).
     */
    static int[] innerNarrow(Seg a, Seg b, int runtimeMs) {
        if (a == null || b == null || !kindOf(a).equals(kindOf(b))) return null;
        if (ownRule(a.rule) || ownRule(b.rule)) return null;
        if (chapterRule(a.rule) || chapterRule(b.rule)) return null;
        int maxStart = Math.max(a.start, b.start);
        int startDiff = Math.abs(a.start - b.start);
        boolean credits = "Credits".equals(a.name);
        boolean aUnb = credits && unboundedToEnd(a);
        boolean bUnb = credits && unboundedToEnd(b);
        boolean aEof = credits && !aUnb && runtimeMs > 0 && a.end > a.start && a.end >= runtimeMs - 500;
        boolean bEof = credits && !bUnb && runtimeMs > 0 && b.end > b.start && b.end >= runtimeMs - 500;
        // Exactly one side to-end: an unbounded marker beats a plain EOF end; a plain EOF end counts
        // only when the other side really ends earlier.
        int toEndEnd = 0, otherEnd = 0, toEndStart = 0;
        boolean toEnd = false, explicit = false;
        if (aUnb != bUnb) {
            toEnd = explicit = true;
            toEndEnd = aUnb ? a.end : b.end;
            toEndStart = aUnb ? a.start : b.start;
            otherEnd = aUnb ? b.end : a.end;
        } else if (!aUnb && aEof != bEof) {
            int oEnd = aEof ? b.end : a.end, oStart = aEof ? b.start : a.start;
            if (oEnd > oStart && oEnd < (aEof ? a.end : b.end)) {
                toEnd = true;
                toEndEnd = aEof ? a.end : b.end;
                toEndStart = aEof ? a.start : b.start;
                otherEnd = oEnd;
            }
        }
        String pair = kindOf(a) + " [" + a.rule + "] " + a.start + "-" + a.end + "ms + [" + b.rule + "] "
                + b.start + "-" + b.end + "ms";
        if (toEnd) {
            if (otherEnd <= maxStart || otherEnd > DAY_MS) return null;
            if (startDiff > INNER_TOL_MS) {
                Log.i(TAG, "Inner bounds disagree >15s (startDiff=" + startDiff + "ms), keeping first: " + pair);
                return null;
            }
            int inner = otherEnd - maxStart;
            if (inner <= INNER_MIN_MS) return null;
            // Never widen a finite end; a tiny corrupt snippet must not replace real credits running to EOF.
            if (toEndEnd > toEndStart && toEndEnd <= DAY_MS && otherEnd > toEndEnd) return null;
            if (!explicit && Math.abs(a.end - b.end) > INNER_TOL_MS && inner < INNER_TOL_MS) return null;
            Log.i(TAG, "Inner bounds " + pair + " -> " + maxStart + "-" + otherEnd + "ms");
            return new int[]{maxStart, otherEnd};
        }
        if (a.end <= a.start || b.end <= b.start || a.end > DAY_MS || b.end > DAY_MS) return null;
        int minEnd = Math.min(a.end, b.end);
        if (minEnd - maxStart <= INNER_MIN_MS) return null;
        int endDiff = Math.abs(a.end - b.end);
        if (startDiff > INNER_TOL_MS || endDiff > INNER_TOL_MS) {
            Log.i(TAG, "Inner bounds disagree >15s (startDiff=" + startDiff + "ms, endDiff=" + endDiff
                    + "ms), keeping first: " + pair);
            return null;
        }
        Log.i(TAG, "Inner bounds " + pair + " -> " + maxStart + "-" + minEnd + "ms");
        return new int[]{maxStart, minEnd};
    }

    /** Narrows cur by every raw window that agrees with orig (the un-narrowed first source) within 15 s. */
    private static Seg narrowFrom(Seg cur, Seg orig, List<Seg> raws, int runtimeMs, boolean keepWide) {
        if (raws == null) return cur;
        for (Seg raw : raws) {
            if (raw == orig) continue;
            int[] inner = innerNarrow(orig, raw, runtimeMs);
            if (inner == null || (inner[0] == orig.start && inner[1] == orig.end)) continue;
            // Fold the probe into the running bounds; an inverted or sub-second result is dropped.
            int s = Math.max(cur.start, inner[0]);
            int e = cur.end > cur.start ? Math.min(cur.end, inner[1]) : inner[1];
            if (e - s <= INNER_MIN_MS) continue;
            String rule = cur == orig ? orig.rule + "+" + raw.rule + " inner-bounds" : cur.rule + "+" + raw.rule;
            cur = new Seg(s, e, orig.name, rule, false, orig.groupMs,
                    keepWide ? (cur.wideStart >= 0 ? cur.wideStart : orig.start) : -1,
                    keepWide ? (cur.wideEnd >= 0 ? cur.wideEnd : orig.end) : -1);
        }
        return cur;
    }

    /** The IntroDB chain's final pass: every window in out narrowed against the raw lists of the three sources. */
    static void narrowInto(List<Seg> out, List<Seg> tidb, List<Seg> app, List<Seg> skip, int runtimeMs) {
        for (int i = 0; i < out.size(); i++) {
            Seg orig = out.get(i);
            Seg cur = narrowFrom(orig, orig, tidb, runtimeMs, false);
            cur = narrowFrom(cur, orig, app, runtimeMs, false);
            cur = narrowFrom(cur, orig, skip, runtimeMs, false);
            if (cur != orig) out.set(i, cur);
        }
    }

    /**
     * Online credits starting under 40% of a known runtime are a mislabeled opening (AniSkip "ed"
     * 11-101 s of a 24 min episode): dropped whether or not an OP overlaps them. Chapter credits keep
     * their own rules; an unknown runtime keeps the list as it is.
     */
    static List<Seg> dropEarlyOnlineCredits(List<Seg> list, int runtimeMs) {
        if (list == null || runtimeMs <= 0) return list;
        List<Seg> out = new ArrayList<Seg>(list.size());
        for (Seg s : list) {
            if (s.credits() && !chapterRule(s.rule) && s.start < runtimeMs * 0.40) {
                Log.i(TAG, "Positional sanity dropped credits " + s.start + "-" + s.end
                        + "ms (early online credits < 40% of runtime " + runtimeMs + "ms, source " + s.rule + ")");
                continue;
            }
            out.add(s);
        }
        return out;
    }

    /**
     * Early online credits (start under 40% of a known runtime) in out: the first one that ends before half
     * the runtime becomes the Intro when no source has an Intro (introElsewhere false), every other one is
     * removed. An unknown runtime leaves out as it is.
     */
    static void settleEarlyCredits(List<Seg> out, boolean introElsewhere, int durationMs) {
        if (durationMs <= 0) return;
        for (int i = 0; i < out.size(); i++) {
            Seg s = out.get(i);
            if (!s.credits() || chapterRule(s.rule) || s.start >= durationMs * 0.40) continue;
            if (!introElsewhere && s.end < durationMs * 0.5) {
                out.set(i, new Seg(s.start, s.end, "Intro", s.rule));
                introElsewhere = true;
                Log.i(TAG, "IntroDB: promoted early credits (" + s.start + "-" + s.end + "ms) to Intro");
            } else {
                out.remove(i);
                i--;
                Log.i(TAG, "Positional sanity dropped credits " + s.start + "-" + s.end
                        + "ms (early online credits < 40% of runtime " + durationMs + "ms, source " + s.rule + ")");
            }
        }
    }

    /** A narrowed window whose wide bounds sat on chapter boundaries goes back to them (chapters never narrow). */
    private static Seg unnarrowIfOnChapters(Seg seg, long[] starts, int duration) {
        if (seg.wideStart < 0 || seg.wideEnd < 0) return seg;
        int cs = nearestBoundaryMs(seg.wideStart, starts, duration);
        int ce = nearestBoundaryMs(seg.wideEnd, starts, duration);
        if (cs < 0 || ce < 0 || Math.abs((ce - cs) - (seg.wideEnd - seg.wideStart)) > 5000) return seg;
        Log.i(TAG, "Inner bounds undone for '" + seg.name + "' " + seg.start + "-" + seg.end + "ms: the wide window "
                + seg.wideStart + "-" + seg.wideEnd + "ms sits on chapter boundaries");
        return new Seg(seg.wideStart, seg.wideEnd, seg.name, seg.rule + " (on chapters)", false, seg.groupMs);
    }

    private static boolean isImdbId(String id) {
        return id != null && id.regionMatches(true, 0, "tt", 0, 2);
    }

    /** Opening/intro segment: neither recap, credits nor preview (names "OP", "Intro", chapter titles). */
    private static boolean isIntroClass(Seg s) {
        return !s.recap() && !s.credits() && !s.preview();
    }

    private static boolean hasIntroType(List<Seg> segs) {
        for (Seg s : segs) {
            if (isIntroClass(s)) return true;
        }
        return false;
    }

    private static boolean hasCreditsSeg(List<Seg> segs) {
        for (Seg s : segs) {
            if (s.credits()) return true;
        }
        return false;
    }

    /**
     * Post-ED tail inference with chapters: the last chapter (the tail) must be unnamed/generic
     * ("Chapter 07") or preview-named. A story-style name ("Coda", "Final Scene") is content and is
     * never inferred as a preview (post-credit scenes are never skippable). No chapters: true (a short
     * tail, unchanged). Name unreadable: false, never guess.
     */
    private static boolean tailChapterMayBePreview(e p, long[] starts) {
        if (starts == null || starts.length == 0) return true;
        try {
            String name = p.y0(starts.length - 1);
            if (name == null) name = "";
            name = name.trim();
            return GENERIC_NAME.matcher(name).matches() || NEXT_PREVIEW_CHAPTER.matcher(name).find();
        } catch (Throwable error) {
            Log.w(TAG, "tail chapter name", error);
            return false;
        }
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
        suffix.append("&details=true"); // group_duration_ms (read in parseTheIntroDb) + per-item confidence
        if (season > 0 && episode > 0) {
            suffix.append("&season=").append(season).append("&episode=").append(episode);
        }
        if (durationMs > 0) suffix.append("&duration_ms=").append(durationMs);
        String[][] identities = new String[][]{
            {"imdb_id", safe(imdbId)}, {"tvdb_id", safe(tvdbId)}, {"tmdb_id", safe(tmdbId)}};
        JSONObject last = null;
        Exception firstError = null;
        for (int i = 0; i < identities.length; i++) {
            String name = identities[i][0];
            String value = identities[i][1];
            if (value.length() == 0) continue;
            Log.i(TAG, "IntroDB: lookup by " + name + " = " + value + suffix);
            JSONObject response;
            try {
                response = new JSONObject(http("GET", INTRODB_URL + "?" + name + "=" + value + suffix,
                        null, null));
            } catch (Exception error) {
                // One identity failing must not stop the others from being tried.
                Log.w(TAG, "IntroDB: lookup by " + name + " failed: " + error);
                if (firstError == null) firstError = error;
                continue;
            }
            if (hasAnySegment(response)) return response;
            Log.i(TAG, "IntroDB: no segments for " + name + " = " + value + ", trying next identity");
            last = response;
        }
        // No identity produced data: an identity that FAILED makes "no data" inconclusive.
        if (firstError != null) throw firstError;
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
            return null; // null = FAILED; not cached, so a retry asks again
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

    private static boolean ownRule(String rule) {
        return rule != null && rule.startsWith("Own times");
    }

    /** One entry of a show's own-times file; d is the file length it was measured on. */
    private static final class OwnEntry {
        final String name;
        final int start;
        final int end;
        final int fileMs;

        OwnEntry(String name, int start, int end, int fileMs) {
            this.name = name;
            this.start = start;
            this.end = end;
            this.fileMs = fileMs;
        }
    }

    private static final long OWN_TOLERANCE_MS = 2000L;
    private static final long OWN_CACHE_MS = 24L * 60L * 60L * 1000L;
    private static final Map<String, String> OWN_BODY = new ConcurrentHashMap<>();
    private static final Map<String, Long> OWN_BODY_AT = new ConcurrentHashMap<>();

    /** Episode entries of one show body; empty on bad JSON or a missing episode. */
    static List<OwnEntry> parseOwn(String body, int season, int episode) {
        List<OwnEntry> out = new ArrayList<OwnEntry>();
        try {
            if (body == null) return out;
            JSONObject seasons = new JSONObject(body).optJSONObject("s");
            JSONObject episodes = seasons == null ? null : seasons.optJSONObject(String.valueOf(season));
            JSONArray items = episodes == null ? null : episodes.optJSONArray(String.valueOf(episode));
            if (items == null) return out;
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.optJSONObject(i);
                if (item == null || item.isNull("a") || item.isNull("b") || item.isNull("d")) continue;
                String name = ownName(item.optString("t", ""));
                int a = item.optInt("a", -1);
                int b = item.optInt("b", -1);
                int d = item.optInt("d", -1);
                if (name == null || a < 0 || b <= a || d <= 0) continue;
                out.add(new OwnEntry(name, a, b, d));
            }
        } catch (Throwable badJson) {
            out.clear();
        }
        return out;
    }

    private static String ownName(String type) {
        if ("intro".equals(type)) return "Intro";
        if ("recap".equals(type)) return "Recap";
        if ("credits".equals(type)) return "Credits";
        if ("preview".equals(type)) return "Preview";
        return null;
    }

    /** Entries measured on this file (closest d per type); runtime <= 0 holds everything. */
    static List<OwnEntry> selectOwn(List<OwnEntry> entries, int runtimeMs) {
        List<OwnEntry> out = new ArrayList<OwnEntry>();
        if (entries == null || runtimeMs <= 0) return out;
        for (OwnEntry e : entries) {
            if (Math.abs((long) e.fileMs - runtimeMs) > OWN_TOLERANCE_MS) continue;
            if (!"Preview".equals(e.name) && e.end - e.start > 600000) continue;
            if ("Intro".equals(e.name) && e.start > runtimeMs * 0.60) continue;
            if ("Credits".equals(e.name) && e.start < runtimeMs * 0.40) continue;
            if (e.end > runtimeMs) {
                if (e.start >= runtimeMs) continue;
                e = new OwnEntry(e.name, e.start, runtimeMs, e.fileMs);
            }
            int at = -1;
            for (int i = 0; i < out.size(); i++) if (out.get(i).name.equals(e.name)) { at = i; break; }
            if (at < 0) out.add(e);
            else if (Math.abs((long) e.fileMs - runtimeMs) < Math.abs((long) out.get(at).fileMs - runtimeMs)) out.set(at, e);
        }
        return out;
    }

    /** Show body, fetched once per 24 h (a 404/failure is cached as ""). */
    private static final Object OWN_LOCK = new Object();

    static String ownBody(String imdbId, long nowMs) {
        String body = OWN_BODY.get(imdbId);
        Long at = OWN_BODY_AT.get(imdbId);
        if (body != null && at != null && nowMs - at < OWN_CACHE_MS) return body;
        synchronized (OWN_LOCK) { // one GET per show, also across concurrent lookups
            body = OWN_BODY.get(imdbId);
            at = OWN_BODY_AT.get(imdbId);
            if (body != null && at != null && nowMs - at < OWN_CACHE_MS) return body;
            body = fetchOwnBody(imdbId);
            // null = the fetch failed: empty for now, asked again in 5 min. "" = 404: a real answer.
            OWN_BODY.put(imdbId, body == null ? "" : body);
            OWN_BODY_AT.put(imdbId, body == null ? nowMs - OWN_CACHE_MS + 300000L : nowMs);
            return body == null ? "" : body;
        }
    }

    /** One plain GET: 2.5 s timeouts, no retry, same headers as http(); "" on any failure. */
    private static String fetchOwnBody(String imdbId) {
        HttpURLConnection c = null;
        try {
            c = (HttpURLConnection) new URL(OWN_TIMES_URL + imdbId + ".json").openConnection();
            c.setRequestMethod("GET");
            c.setConnectTimeout(2500);
            c.setReadTimeout(2500);
            c.setRequestProperty("Accept", "application/json");
            c.setRequestProperty("User-Agent", "VimuIntroSkip/1.0");
            int code = c.getResponseCode();
            if (code == 404) return "";
            if (code != 200) return null;
            InputStream in = c.getInputStream();
            if (in == null) return null;
            ByteArrayOutputStream buf = new ByteArrayOutputStream();
            byte[] chunk = new byte[4096];
            int n;
            while ((n = in.read(chunk)) > 0) {
                buf.write(chunk, 0, n);
                if (buf.size() > 262144) return "";
            }
            return buf.toString("UTF-8");
        } catch (Throwable failed) {
            return null;
        } finally {
            if (c != null) c.disconnect();
        }
    }

    /** Own times for this episode; empty silently when no entry matches this runtime. */
    private static List<Seg> fetchOwnTimes(String imdbId, int season, int episode, int durationMs) {
        List<Seg> out = new ArrayList<Seg>();
        try {
            if (!isImdbId(imdbId)) return out;
            List<OwnEntry> entries = selectOwn(parseOwn(ownBody(imdbId, System.currentTimeMillis()), season, episode), durationMs);
            for (OwnEntry e : entries) {
                out.add(new Seg(e.start, e.end, e.name, "Own times"));
                Log.i(TAG, "Segment Own times: " + e.name + " " + e.start + "-" + e.end
                        + "ms (file length " + e.fileMs + "ms, runtime " + durationMs + "ms)");
            }
        } catch (Throwable ignored) {
            // No usable own times: the online sources work exactly as before.
        }
        return out;
    }

    /**
     * Keyless extra source, no key needed: GET /segments?imdb_id=&season=&episode
     * answers {"intro": {"start_ms","end_ms",...}, "recap": {...}, "outro": {...}}
     * with null for unknown types. Mapping: intro to Intro, recap to Recap,
     * outro/credits to Credits. post_credits is read as a protected marker (name
     * "PostCredits"), never a segment: takePostCredits() lifts it out of the answer and
     * Credits/Preview are cut where it starts.
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
            addAppSegment(out, response, "post_credits", "PostCredits");
        } catch (Throwable error) {
            Log.w(TAG, "IntroDB.app lookup failed: " + error);
            return null; // null = FAILED (refetched later); an empty list is final "no data"
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
                return; // unknown end is ignored (same owner rule as TheIntroDB), never "to end of file"
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
            return null; // null = FAILED (refetched later); an empty list is final "no data"
        }
        return out;
    }

    private static void addSkipDbSegment(List<Seg> out, JSONObject segments, String key, String name) {
        try {
            if (hasSegType(out, name)) return;
            JSONObject item = segments.optJSONObject(key);
            if (item == null) return;
            if ("out-of-range".equals(item.optString("match", ""))) return;
            if (item.isNull("start_ms") || item.isNull("end_ms")) return; // unknown end ignored (owner rule)
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
    private static String cinemetaImdbId(Context ctx, String title, String fileYear) {
        if (title == null || title.trim().length() == 0) return "";
        String wanted = title.trim();
        // Same-name shows (The Office UK/US) differ by year: the year in the title, else the one
        // parsed from the file name, is part of the cache key and picks among exact matches.
        int titleYear = extractYear(wanted);
        int wantedYearEff = titleYear;
        if (wantedYearEff == 0 && fileYear != null && fileYear.trim().matches("(19|20)\\d{2}")) {
            wantedYearEff = Integer.parseInt(fileYear.trim());
        }
        String keyBase = normTitle(stripYearRange(wanted));
        if (titleYear > 0) {
            String noYear = keyBase.replaceAll("\\b" + titleYear + "\\b", " ").replaceAll("\\s+", " ").trim();
            if (noYear.length() > 0) keyBase = noYear;
        }
        String key = "series:" + keyBase + (wantedYearEff > 0 ? "|y" + wantedYearEff : "");
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
            if (exactIds.size() > 1 && wantedYearEff > 0) {
                for (int i = 0; i < exactIds.size(); i++) {
                    if (exactYears.get(i).contains(String.valueOf(wantedYearEff))) {
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
            return null; // null = FAILED (refetched later); "" = no such show, final
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
            out.add(ownRule(seg.rule) ? seg : snapOne(unnarrowIfOnChapters(seg, starts, duration), starts, duration));
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
        return new Seg(newStart, newEnd, seg.name, seg.rule + "+snap", false, seg.groupMs, -1, -1, seg.buttonOnly);
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

    /** Season of an AniList title: like seasonMarker(), and a bare trailing "2"/"S2" counts when the title before it is the searched one. */
    private static int candidateSeasonOf(String name, String base) {
        if (name == null) return 1;
        String trimmed = name.trim();
        Matcher matcher = AL_SEASON.matcher(trimmed);
        if (!matcher.find()) return 1;
        if (matcher.group(1) != null) return safeParseInt(matcher.group(1), 1);
        if (matcher.group(2) != null) return safeParseInt(matcher.group(2), 1);
        int bare = bareSeason(matcher, trimmed, base);
        if (bare >= 0) return bare;
        String word = (matcher.group(3) != null ? matcher.group(3) : matcher.group(4)).toLowerCase(Locale.US);
        if ("second".equals(word) || "ii".equals(word)) return 2;
        if ("third".equals(word) || "iii".equals(word)) return 3;
        if ("fourth".equals(word) || "iv".equals(word)) return 4;
        return 5;
    }

    /** Trailing "2"/"S2" is a season only when what precedes it is the searched title itself; -1 = not a bare match. */
    private static int bareSeason(Matcher matcher, String trimmed, String base) {
        String digits = matcher.group(5) != null ? matcher.group(5) : matcher.group(6);
        if (digits == null) return -1;
        int season = safeParseInt(digits, 1);
        return season >= 2 && season < 20 && normTitle(trimmed.substring(0, matcher.start())).equals(base) ? season : 1;
    }

    /** Title with season markers removed; an invalid bare trailing number ("Mob Psycho 100") stays. */
    private static String stripSeason(String name, String base) {
        String trimmed = name.trim();
        Matcher matcher = AL_SEASON.matcher(trimmed);
        StringBuffer stripped = new StringBuffer();
        while (matcher.find()) {
            if (bareSeason(matcher, trimmed, base) == 1) continue;
            matcher.appendReplacement(stripped, " ");
        }
        matcher.appendTail(stripped);
        return stripped.toString();
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
        weakIntros.clear();
        postCredit.clear();
        pendingOk = null;
        remote = null;
        remotePost = null;
        seekHoldKey = null;
        remoteGen = -1;
        remoteStarted = false;
        remoteApplied = false;
        remoteRetries = 0;
        lookup = null;
        lookupRunning = false;
        remoteMerged.clear();
        subPreviewScanned = false;
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
        baseDuration = 0;
        durationChangeTicks = 0;
        chapterGoneReads = 0;
        hidePill(false);
    }

    /**
     * A playlist can load the next file into the same player. A changed chapter list is the usual signal; a
     * chapterless file (or one with the same chapters) is caught here: the duration differs by more than 3 s
     * from the first one seen, on two polls in a row, near the start of the file. Growing or re-estimated
     * durations later in playback never count.
     */
    /** Below this the player's duration is a placeholder (1 ms before the real length is known), not a length. */
    static final int MIN_REAL_DURATION_MS = 1000;

    /** The duration when it is a real length, else 0 (unknown): lookups hold on unknown instead of judging on a placeholder. */
    static int realDuration(int ms) {
        return ms >= MIN_REAL_DURATION_MS ? ms : 0;
    }

    private void noteDuration(int duration, int posNow) {
        if (duration <= 0) return;
        if (baseDuration <= 0) {
            baseDuration = duration;
            return;
        }
        if (Math.abs(duration - baseDuration) <= 3000 || posNow > 15000) {
            durationChangeTicks = 0;
            return;
        }
        if (++durationChangeTicks < 2) return;
        Log.i(TAG, "duration changed " + baseDuration + " -> " + duration + "ms near the start: new media");
        resetMedia();
        baseDuration = duration;
    }

    /** One subtitle-tail lookahead per media: addon .srt/.vtt tails can name
     * the preview when chapters and databases cannot. Fail-soft throughout. */
    private void maybeScanVimuSubPreview(PlayerFragment f, final int durationMs) {
        if (segments != null && hasSegType(segments, "Preview")) return;
        String subUrl = extSubUrl;
        if (subUrl == null || !(subUrl.startsWith("http://") || subUrl.startsWith("https://"))) {
            try {
                Activity act = f == null ? null : f.getActivity();
                Intent intent = act == null ? null : act.getIntent();
                if (intent != null) {
                    String forced = intent.getStringExtra("forcedsrt");
                    if (forced != null && (forced.startsWith("http://") || forced.startsWith("https://"))) {
                        subUrl = forced;
                    } else {
                        android.os.Parcelable[] uris = intent.getParcelableArrayExtra("subs");
                        if (uris != null && uris.length > 0 && uris[0] != null) {
                            String u = uris[0].toString();
                            if (u.startsWith("http://") || u.startsWith("https://")) subUrl = u;
                        }
                    }
                }
            } catch (Throwable ignored) {
            }
        }
        if (subUrl == null || subUrl.isEmpty()) return;
        final String targetUrl = subUrl;
        final int gen = mediaGen;
        new Thread(new Runnable() {
            @Override
            public void run() {
                try {
                    String tail = fetchSubtitleTail(targetUrl);
                    if (tail == null || tail.isEmpty()) return;
                    double credEndSec = -1.0;
                    List<Seg> cur = segments;
                    if (cur != null) {
                        for (Seg s : cur) {
                            if (s.credits()) {
                                credEndSec = s.end / 1000.0;
                                break;
                            }
                        }
                    }
                    double startSec = detectPreviewStartFromSubText(tail, credEndSec, durationMs / 1000.0);
                    if (startSec <= 0) return;
                    final int startMs = (int) Math.round(startSec * 1000.0);
                    MAIN.post(new Runnable() {
                        @Override
                        public void run() {
                            if (!running || gen != mediaGen || durationMs - startMs < 3500) return;
                            List<Seg> list = segments == null ? new ArrayList<Seg>() : new ArrayList<Seg>(segments);
                            if (hasSegType(list, "Preview")) return;
                            Seg cue = clipPostCredit(new Seg(startMs, durationMs, "Preview", "subtitle-cue"));
                            if (cue == null) return;
                            list.add(cue);
                            Collections.sort(list, new Comparator<Seg>() {
                                @Override
                                public int compare(Seg a, Seg b) {
                                    return Integer.compare(a.start, b.start);
                                }
                            });
                            segments = list;
                            Log.i(TAG, "final segment 'Preview' " + cue.start + "-" + cue.end
                                    + "ms (source subtitle-cue)");
                        }
                    });
                } catch (Throwable ignored) {
                }
            }
        }, "VimuSubPreview").start();
    }

    private static String chapterSignature(e p) {
        long[] starts = safeChapterStarts(p);
        if (starts == null || starts.length == 0) return null;
        StringBuilder sig = new StringBuilder();
        for (long start : starts) sig.append(start).append(',');
        return sig.toString();
    }

    /** Demuxer chapter table without letting a torn-down player crash the tick. */
    private static long[] safeChapterStarts(e p) {
        try {
            return p == null ? null : p.E();
        } catch (Throwable error) {
            Log.w(TAG, "chapterStarts", error);
            return null;
        }
    }

    /** Polls of steady advance before any seek (a seek on the first ticks of a resumed stream crashes the engine). */
    private static final int FLOW_TICKS = 4;

    /** OK on the pill: same guard as auto-skip. Before it clears the press is queued (see tick), not dropped. */
    private void requestManualSkip(PlayerFragment f, e p, Seg seg) {
        if (flowTicks >= FLOW_TICKS) {
            pendingOk = null;
            skip(f, p, seg, p.getCurrentPosition(), false);
            return;
        }
        pendingOk = seg;
        pendingOkAt = SystemClock.uptimeMillis();
        Log.i(TAG, "OK on '" + seg.name + "' queued until playback flows (flowTicks=" + flowTicks + ")");
    }

    /** True once every online source has answered (data or none) or retries are used up; nothing more will arrive. */
    private boolean onlineLookupDone() {
        if (!remoteStarted || lookupRunning) return false;
        LookupState state = lookup;
        return state == null || state.failMask == 0 || remoteRetries >= RETRY_BACKOFF_MS.length;
    }

    /**
     * Decides the weak "Intro" chapters (see readChapters). With an online intro: the chapter counts
     * only if it agrees with it within 15 s on both ends. With none and the lookup done: it counts
     * if 20-150 s long and not the file's first chapter at 0:00 (a cold open). Undecided otherwise.
     * An accepted chapter becomes a normal chapter intro, so online intros no longer join it.
     */
    private void settleWeakIntros(List<Seg> online, boolean onlineDone) {
        if (weakIntros.isEmpty()) return;
        boolean onlineIntro = online != null && hasIntroType(online);
        if (!onlineIntro && !onlineDone) return;
        Seg pick = null;
        for (Seg w : weakIntros) {
            boolean ok = false;
            if (onlineIntro) {
                for (Seg o : online) {
                    if (isIntroClass(o) && Math.abs(o.start - w.start) <= 15000 && Math.abs(o.end - w.end) <= 15000) ok = true;
                }
            } else {
                long len = (long) w.end - w.start;
                ok = len >= 20000L && len <= 150000L && w.start > 500;
            }
            if (ok) {
                pick = w;
                break;
            }
        }
        Log.i(TAG, "weak intro " + (pick == null ? "rejected" : "accepted '" + pick.name + "' " + pick.start + "-"
                + pick.end + "ms") + " (online intro " + onlineIntro + ")");
        weakIntros.clear();
        if (pick == null || (segments != null && overlapsMs(segments, pick.start, pick.end))) return;
        List<Seg> next = segments == null ? new ArrayList<Seg>() : new ArrayList<>(segments);
        next.add(new Seg(pick.start, pick.end, pick.name, "name"));
        Collections.sort(next, new Comparator<Seg>() {
            @Override
            public int compare(Seg a, Seg b) {
                return Integer.compare(a.start, b.start);
            }
        });
        chaptersHaveIntro = true;
        segments = next;
        current = null;
    }

    /** The post-credit chapter overlapping [start, end), or null. */
    /**
     * The segment a viewer seek to pos holds. Backward: the one it landed in, else the next one starting
     * within 2.0 s (exactly 2.0 s ahead is held; rearmSkipped needs strictly more). Forward: only a landing
     * 15 s or more inside. Previews and auto-skip credits are exempt (everyone fast-forwards into them),
     * as is any type the settings hide. at = the enabled segment pos is inside, or null.
     */
    static Seg seekHoldTarget(List<Seg> segments, Seg at, int pos, boolean back, boolean recaps,
                              boolean previewsOn, String creditsMode) {
        Seg target = at;
        if (!back) {
            if (target == null || pos - target.start < SEEK_HOLD_FORWARD_LAG_MS) return null;
        } else if (target == null) {
            for (Seg next : segments) {
                if ((!recaps && next.recap()) || (!previewsOn && next.preview())
                        || (next.credits() && VimuIntroSkipPrefs.CREDITS_OFF.equals(creditsMode))) continue;
                int ahead = next.start - pos;
                if (ahead > 0 && ahead <= SEEK_HOLD_LEAD_MS) {
                    target = next;
                    break;
                }
            }
        }
        if (target == null || target.preview()
                || (target.credits() && !target.buttonOnly && VimuIntroSkipPrefs.CREDITS_AUTO.equals(creditsMode))) return null;
        return target;
    }

    /** The held segment is gone (re-merged), or playback is past its end or more than 2.0 s before its start. */
    static boolean seekHoldReleased(List<Seg> segments, String key, int pos) {
        for (Seg s : segments) {
            if (s.key().equals(key)) return pos >= s.end || pos < s.start - SEEK_HOLD_LEAD_MS;
        }
        return true;
    }

    /** Removes from skipped every segment more than 2.0 s ahead of pos (a rewind); returns how many. */
    static int rearmSkipped(Set<String> skipped, List<Seg> segments, int pos) {
        int n = 0;
        if (skipped.isEmpty()) return 0;
        for (Seg s : segments) {
            if (pos < s.start - SEEK_HOLD_LEAD_MS && skipped.remove(s.key())) {
                n++;
                Log.i(TAG, "Re-armed '" + s.name + "' " + s.start + "-" + s.end + "ms: playback rewound to " + pos + "ms");
            }
        }
        return n;
    }

    private int[] postCreditAt(int start, int end) {
        for (int[] pc : postCredit) {
            if (pc[0] < end && (pc[1] <= 0 || pc[1] > start)) return pc;
        }
        int[] online = onlinePostCredit();
        if (online != null && online[0] < end && online[1] > start) return online;
        return null;
    }

    /** The IntroDB.app post_credits scene of this media when it is sane for the runtime, else null. */
    private int[] onlinePostCredit() {
        return remoteGen == mediaGen ? sanePostCredit(remotePost, durationMs) : null;
    }

    /** A post_credits scene is sane when it is under 10 minutes and starts in the second half of a known runtime. */
    static int[] sanePostCredit(int[] post, int runtimeMs) {
        if (post == null || runtimeMs <= 0 || post[1] <= post[0] || post[1] - post[0] > 600000) return null;
        return post[0] >= runtimeMs * 0.50 && post[0] < runtimeMs ? post : null;
    }

    /** Credits/Preview must not run into a post-credit scene: cut at its start, or null if nothing is left. */
    private Seg clipPostCredit(Seg s) {
        if (!s.credits() && !s.preview()) return s;
        return clipAt(s, postCreditAt(s.start, s.end));
    }

    /** s cut where the scene pc starts (null when under 5 s remain); s itself when pc is null. */
    static Seg clipAt(Seg s, int[] pc) {
        if (pc == null) return s;
        if (pc[0] - s.start < 5000) return null;
        Log.i(TAG, "'" + s.name + "' " + s.start + "-" + s.end + "ms cut at post-credit scene " + pc[0] + "ms");
        return new Seg(s.start, pc[0], s.name, s.rule);
    }

    /** Online credits over InnerBounds.LONG_ONLINE_CREDITS_S by final length (after to-end, post-credit cut and snapping) become a button. */
    static Seg guardLongCredits(Seg s) {
        if (s == null || s.buttonOnly || s.end <= s.start
                || !InnerBounds.longOnlineCredits(s.credits(), s.rule, (s.end - s.start) / 1000.0)) return s;
        Log.i(TAG, "Long credits button only: [" + s.rule + "] " + ((s.end - s.start) / 1000)
                + "s > " + (int) InnerBounds.LONG_ONLINE_CREDITS_S + "s");
        return s.buttonOnlyCopy();
    }

    private void diaryPlay(Activity activity) {
        try {
            Intent launch = activity.getIntent();
            PlaybackDiary.ev(activity, "play", "app", "vimu", "type", mediaKind == 2 ? "movie" : "series", "title", extTitle, "id", extImdbId,
                    "s", extSeason, "e", extEpisode, "vid", launch == null ? null : launch.getStringExtra("stremio_video_id"),
                    "engine", "vimu", "host", PlaybackDiary.host(launch == null ? null : launch.getDataString()));
        } catch (Throwable ignored) {
            // The diary is optional.
        }
    }

    private static List<Object> diarySegs(List<Seg> list) {
        List<Object> out = new ArrayList<>();
        if (list != null) for (Seg s : list) out.add(PlaybackDiary.seg(s.name, s.start / 1000.0, s.end / 1000.0, s.rule));
        return out;
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
        PlaybackDiary.ev(f.getActivity(), "skip", "type", seg.name, "how", automatic ? "auto" : "button", "from", pos / 1000.0, "to", target / 1000.0, "seg", PlaybackDiary.seg(seg.name, seg.start / 1000.0, seg.end / 1000.0, seg.rule));
        final int landTarget = target;
        MAIN.postDelayed(new Runnable() {
            @Override
            public void run() {
                try {
                    PlayerFragment pf = fragment.get();
                    e pl = pf == null ? null : PlayerFragment.G0(pf);
                    if (pl != null) Log.i(TAG, "landed 1s after skip: pos=" + pl.getCurrentPosition() + "ms (target " + landTarget + "ms)");
                    if (pl != null) PlaybackDiary.ev("landed", "pos", pl.getCurrentPosition() / 1000.0, "target", landTarget / 1000.0);
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
     * Stremio hand-off media with no filename evidence: the anime audio rule needs the AniList
     * verdict, which the lookup produces a moment after playback starts. Hold the audio choice
     * until the MAL resolve is done, the lookup ended (failed, anime off, no lookup), or 5 s
     * of playback passed. Never waits for any other launch.
     */
    private boolean audioWaitsForAnimeVerdict(PlayerFragment f, long now) {
        try {
            if (!extHaveMedia || firstPlayingAt == 0 || now - firstPlayingAt >= 5000L) return false;
            Activity owner = f.getActivity();
            ParsedMedia info = owner == null ? null : extractMediaFromIntent(owner.getIntent());
            if (info == null || !info.animeUnknown) return false;
            if (!VimuIntroSkipPrefs.isAnimeEnabled(f)) return false;
            if (!remoteStarted) return true;
            LookupState state = lookup;
            return lookupRunning && state != null && !state.malResolved;
        } catch (Throwable ignored) {
            return false;
        }
    }

    /**
     * The anime audio rule. The old implementation reflected into an ExoPlayer (getTrackSelectionParameters /
     * getCurrentTracks) that Vimu 12.00 has obfuscated away, so it never ran. The rule now only publishes the
     * anime verdict (and the language settings) to VimuTracks, which selects the track through Vimu's engine
     * adapter (memory > anime rule > user language > Vimu default).
     */
    private void applyPendingAudio(PlayerFragment f, e p) {
        audioPending = false;
        try {
            ParsedMedia info = null;
            try {
                Activity owner = f == null ? null : f.getActivity();
                if (owner != null) info = extractMediaFromIntent(owner.getIntent());
            } catch (Throwable ignored) {
            }
            LookupState verdict = lookup;
            boolean isAnime = info != null && (info.looksLikeAnime
                    || (info.animeUnknown && verdict != null && verdict.animeVerdict));
            String animeLang = VimuIntroSkipPrefs.animeAudioLang(f);
            String primaryLang = VimuIntroSkipPrefs.primaryAudioLang(f);
            VimuTracks.setAnimeVerdict(isAnime, animeLang, primaryLang);
            Log.i(TAG, "AudioSelect: routed to VimuTracks anime=" + isAnime
                    + " animeLang=" + animeLang + " primaryLang=" + primaryLang);
            PlaybackDiary.ev("tracks", "src", isAnime ? "anime" : "default", "anime", isAnime, "anime_lang", animeLang, "primary_lang", primaryLang);
        } catch (Throwable ignored) {
            // Fail soft: Vimu's default audio selection stays untouched.
        }
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
                PlaybackDiary.ev("tracks", "src", "handoff", "kind", "sub", "track", want, "by", why, "name", clip(name));
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

    /** Lowercase language names to 2-letter codes (same idea as Stremio's TrackMemory.NAMES, which Vimu cannot link). */
    private static final Map<String, String> LANG_NAMES = new ConcurrentHashMap<>();

    static {
        String[] names = {
            "english", "en", "spanish", "es", "espanol", "es", "castellano", "es",
            "french", "fr", "francais", "fr", "german", "de", "deutsch", "de",
            "italian", "it", "italiano", "it", "portuguese", "pt", "portugues", "pt",
            "russian", "ru", "japanese", "ja", "chinese", "zh", "mandarin", "zh",
            "korean", "ko", "hindi", "hi", "arabic", "ar", "dutch", "nl", "nederlands", "nl",
            "swedish", "sv", "norwegian", "nb", "norsk", "nb", "danish", "da",
            "finnish", "fi", "polish", "pl", "turkish", "tr", "ukrainian", "uk",
            "thai", "th", "hebrew", "he", "indonesian", "id", "vietnamese", "vi",
            "czech", "cs", "greek", "el", "hungarian", "hu", "romanian", "ro"};
        for (int i = 0; i < names.length; i += 2) LANG_NAMES.put(names[i], names[i + 1]);
    }

    /**
     * Same language: codes (639-1, 639-2/B and T, with region) and common names compare equal ("ja", "jpn",
     * "Japanese"). Never a prefix test. When both sides carry a region or script (zh-Hant vs zh-Hans) it must
     * match. An empty side or an undetermined language never matches.
     */
    private static boolean langMatch(String a, String b) {
        if (a == null || b == null) return false;
        String left = a.trim().toLowerCase(Locale.US);
        String right = b.trim().toLowerCase(Locale.US);
        if (left.length() == 0 || right.length() == 0) return false;
        String named = LANG_NAMES.get(left);
        if (named != null) left = named;
        named = LANG_NAMES.get(right);
        if (named != null) right = named;
        String key = SdhLabels.normLang(left);
        if (key.equals("und") || key.equals("zxx") || key.equals("mul")) return false;
        if (!VimuTracks.sameLang(left, right)) return false;
        String leftTag = langSubTag(left);
        String rightTag = langSubTag(right);
        return leftTag.length() == 0 || rightTag.length() == 0 || leftTag.equals(rightTag);
    }

    /** Region or script part of a tag ("pt-br" gives "br"), "" when there is none. */
    private static String langSubTag(String lang) {
        String l = lang.replace('_', '-');
        int dash = l.indexOf('-');
        return dash > 0 ? l.substring(dash + 1) : "";
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

    private void readChapters(e p, int duration) {
        long[] starts = safeChapterStarts(p);
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
        weakIntros.clear();
        postCredit.clear();
        for (int i = 0; i < n; i++) {
            if (POST_CREDIT_NAME.matcher(names[i]).find()) {
                postCredit.add(new int[]{(int) starts[i], endOf(starts, i, duration)});
                Log.i(TAG, "post-credit chapter '" + names[i] + "' " + starts[i] + "ms: never skipped");
            }
        }
        // a) named intro / recap chapters
        boolean hasOpening = false;
        for (int i = 0; i < n; i++) {
            if (!excluded(names[i], starts[i], duration) && OPENING_NAME.matcher(names[i]).find()) hasOpening = true;
        }
        for (int i = 0; i < n; i++) {
            if (excluded(names[i], starts[i], duration)) continue;
            if (duration > 0 && starts[i] > duration / 2) continue; // an intro never sits in the second half
            if (!INTRO_NAME.matcher(names[i]).find() && !isIntroCredits(names[i], starts[i], duration)) continue;
            int end = endOf(starts, i, duration);
            long lenMs = (long) end - starts[i];
            // Trusted-chapter rule (same as Stremio's): OP/Opening/Opening Credits/Main Titles/Title
            // Sequence/Theme are strong and skip on their own. A chapter named only "Intro" is often
            // the cold open, so it is weak: ignored when a strong chapter exists, otherwise parked in
            // weakIntros until settleWeakIntros decides (online source within 15 s on both ends, or
            // no online data and a plausible 20-150 s length that is not the first chapter at 0:00).
            if (!OPENING_NAME.matcher(names[i]).find() && WEAK_INTRO_NAME.matcher(names[i]).find()
                    && !RECAP_NAME.matcher(names[i].toLowerCase(Locale.US)).matches()) {
                if (hasOpening) {
                    Log.i(TAG, "ignoring '" + names[i] + "': an OP/Opening chapter exists");
                } else if (lenMs >= 10000L && lenMs <= 360000L) {
                    weakIntros.add(new Seg((int) starts[i], end, names[i], "name-weak"));
                    Log.i(TAG, "weak intro chapter '" + names[i] + "' " + starts[i] + "-" + end + "ms: needs agreement");
                }
                continue;
            }
            if (lenMs >= 10000L && lenMs <= 360000L) found.add(new Seg((int) starts[i], end, names[i], "name"));
        }
        boolean hasIntroSeg = false;
        for (Seg s : found) {
            if (!s.recap() && !"Credits".equals(s.name) && !s.preview()) {
                hasIntroSeg = true;
                break;
            }
        }
        // d) end-credits chapters (mirrors Stremio): Vimu exposes chapters natively
        //    and these names are exact. Strict guards so story content is never taken:
        //    ED/ending-style name, not an opening, not an early title sequence,
        //    short label, sane length. A lone end-credits chapter never counts as
        //    "intro" (online OP timings must still apply).
        for (int i = 0; i < n; i++) {
            String cname = names[i];
            if (cname == null || !END_CREDITS_CHAPTER.matcher(cname).find()) continue;
            if (POST_CREDIT_NAME.matcher(cname).find()) continue;
            if (OPENING_NAME.matcher(cname).find() || isIntroCredits(cname, starts[i], duration)) continue;
            if (duration > 0 && starts[i] < duration / 2) continue;
            if (normTitle(chapterLabel(cname)).split(" ").length > 4) continue;
            int end = endOf(starts, i, duration);
            long lenMs = end > starts[i] ? (long) end - starts[i] : -1L;
            if (lenMs < 15000L || lenMs > 480000L) continue;
            if (overlapsMs(found, (int) starts[i], end)) continue;
            found.add(new Seg((int) starts[i], end, "Credits", "chapter \"" + cname + "\""));
            Log.i(TAG, "end-credits chapter '" + cname + "' " + starts[i] + "-" + end + "ms");
        }
        // e) next-preview chapters (mirrors Stremio): exact names, sane length.
        // A lone preview chapter never counts as "intro" either.
        for (int i = 0; i < n; i++) {
            String cname = names[i];
            if (cname == null || !NEXT_PREVIEW_CHAPTER.matcher(cname).find()) continue;
            if (OPENING_NAME.matcher(cname).find() || POST_CREDIT_NAME.matcher(cname).find()) continue;
            if (normTitle(chapterLabel(cname)).split(" ").length > 4) continue;
            int end = endOf(starts, i, duration);
            long lenMs = end > starts[i] ? (long) end - starts[i] : -1L;
            if (lenMs < 5000L || lenMs > 300000L) continue;
            if (overlapsMs(found, (int) starts[i], end)) continue;
            found.add(new Seg((int) starts[i], end, "Preview", "chapter \"" + cname + "\""));
            Log.i(TAG, "preview chapter '" + cname + "' " + starts[i] + "-" + end + "ms");
        }
        // b) unnamed 60-110 s chapters are NOT taken as an intro: scene-split chapters of documentaries and
        //    specials have this shape, and skipping real content is worse than missing an intro. Online timings
        //    (AniSkip, IntroDB) and named chapters still apply.
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
        if (NEVER_NAME.matcher(name).find() || POST_CREDIT_NAME.matcher(name).find()) return true;
        int comma = name.indexOf(',');
        if (comma > 0 && name.substring(0, comma).trim().split("\\s+").length > 2) return true;
        return CREDITS_NAME.matcher(name).find() && !OPENING_NAME.matcher(name).find() && !isIntroCredits(name, start, duration);
    }

    /** A bare "Credits" chapter early in the episode is the title sequence (late ones are end credits). */
    private static boolean isIntroCredits(String name, long start, int duration) {
        if (!CREDITS_NAME.matcher(name).find() || OPENING_NAME.matcher(name).find()) return false;
        return duration > 0 ? start < duration * 0.35 : start < 600000L;
    }

    /**
     * Chapter name without a trailing song title: "Opening - Long Song Title Here" and "ED2: Song" give
     * "Opening" and "ED2". Only a bare opening/ending word before the separator counts; any other
     * name (a scene title such as "Opening the Gates - Part 1") is returned whole.
     */
    static String chapterLabel(String name) {
        if (name == null) return "";
        Matcher m = SONG_SEPARATOR.matcher(name);
        if (m.find() && SONG_LABEL.matcher(m.group(1).trim()).matches()) return m.group(1).trim();
        return name;
    }

    private static int endOf(long[] starts, int i, int duration) {
        if (i + 1 < starts.length) return (int) starts[i + 1];
        return duration > 0 ? duration : -1;
    }
}
