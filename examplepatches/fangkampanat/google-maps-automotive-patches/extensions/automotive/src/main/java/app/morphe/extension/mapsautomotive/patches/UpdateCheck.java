package app.morphe.extension.mapsautomotive.patches;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.drawable.Icon;
import android.net.Uri;
import android.os.SystemClock;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.RandomAccessFile;
import java.lang.ref.WeakReference;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.channels.FileLock;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.morphe.extension.BuildConfig;
import app.morphe.extension.shared.Utils;

/**
 * Update check (0.1.6): whether this project has released a newer version. It reads the latest release of
 * the bundle's GitHub repository (its version, date and notes) from GitHub's API. The request names the patches
 * version (User-Agent) and nothing about the car or the account; GitHub sees its network address as for any web
 * page. While "Check once a day" is on (the default), the main process checks about a minute after a start and then
 * once a day, when there is a network and safe mode is off; the dialog's "Check now" checks at any time. A newer
 * release posts one silent notification per version. The app cannot update itself: the dialog leads to the project
 * page (QR code), whose steps patch the new version with Morphe Desktop. The state is a small JSON file that the
 * main process and the report screen's process both read and write, replaced atomically under a file lock.
 */
@SuppressWarnings("unused")
public final class UpdateCheck {
    static final String TAG = "MorpheUpdate";
    /** The report screen shows the dialog when it is opened with this action (the notification). */
    static final String ACTION_SHOW = "app.morphe.extension.mapsautomotive.SHOW_UPDATE";
    /** The README's title on the project page, where the install steps start. */
    static final String PAGE_ANCHOR = "#google-maps-automotive-for-microg-re-on-byd-cars";
    /** A redirect is followed (once) only while it stays on GitHub's API. */
    static final String API_PREFIX = "https://api.github.com/";
    private static final String DIR = "morphe_update", STATE = "state.json", LOCK = "lock";
    /** The first automatic look about a minute after a start, then every 30 min, or 5 min while a due check waits for a network. */
    private static final long FIRST_DELAY_MS = 60_000, TICK_MS = 30 * 60_000L, NETWORK_WAIT_MS = 5 * 60_000L;
    /**
     * A check is due 20 h after GitHub's last answer (so a daily drive at the same hour checks), 1 h after a failure,
     * 20 h after a redirect off GitHub's API; "no internet" from the dialog does not delay it.
     */
    static final long DUE_MS = 20 * 60 * 60_000L, RETRY_MS = 60 * 60_000L;
    /** The row adds when GitHub last answered once that answer is this old. */
    static final long STALE_MS = 2 * 24 * 60 * 60_000L;
    /** Automatic looks that wait for Android to confirm the internet before checking anyway. */
    static final int MAX_VALIDATION_WAITS = 3;
    private static final int CONNECT_TIMEOUT_MS = 10_000, READ_TIMEOUT_MS = 15_000;
    static final int MAX_RESPONSE_BYTES = 512 * 1024, MAX_STATE_BYTES = 64 * 1024, MAX_NOTES = 1200;
    private static final String CHANNEL = "morphe_updates";
    private static final int NOTIFICATION_ID = 0x4D44;
    /** Why a check failed, as stored ("http <code>" for another answer). */
    static final String NETWORK = "network", NO_NETWORK = "no_network", RATE_LIMITED = "rate_limited", RESPONSE = "response",
            NO_PROJECT = "no_project", MOVED = "moved";
    private static final Pattern VERSION = Pattern.compile("[vV]?(\\d{1,5})\\.(\\d{1,5})\\.(\\d{1,5})(?:-dev\\.(\\d{1,5}))?");
    private static final Pattern PROJECT = Pattern.compile("https://github\\.com/([A-Za-z0-9_.-]+)/([A-Za-z0-9_.-]+)");
    /** Threads of this process; the file lock covers the other process. */
    private static final Object fileLock = new Object();
    private static final AtomicBoolean checking = new AtomicBoolean();
    /** Automatic looks in a row that waited for Android to confirm the internet (the ticks run one after another). */
    private static volatile int validationWaits;
    /** The checkbox's last value: each write stores this one, so writes landing out of order still end on it. */
    private static volatile boolean wantedAuto;
    /** The row's subtitle as this process last built or set it, so a later change finds it even after it went stale. */
    private static volatile String rowShown;
    /**
     * Main thread: the dialog on screen, and when a tap started opening one, so a second tap opens no second
     * dialog (as in SendToCarStatus).
     */
    private static WeakReference<AlertDialog> openDialog;
    private static WeakReference<Activity> openHost;
    private static long openingSince;
    private static final long OPENING_MS = 10_000;
    /** How long "Check now" waits for a running daily check (two requests of up to 25 s each) before it shows what is stored. */
    private static final long BUSY_WAIT_MS = 60_000;

    private UpdateCheck() {
    }

    /** What the file holds. Plain fields and plain Java, so the texts can be checked off the device. */
    static final class State {
        /** "Check once a day". */
        boolean auto = true;
        /** GitHub's last answer (a release, unchanged, or none published), wall clock; 0: none yet. */
        long checkedAt;
        /** The last failed check, wall clock, and why; 0 and null once GitHub answers again. */
        long failedAt;
        String failure;
        /** The latest release: its tag, its version (the tag without "v"), when it was published and its notes. */
        String tag, latest, publishedAt, notes;
        /** GitHub answered that no release is published. */
        boolean noRelease;
        /** GitHub's ETag of the last answer: asked with it, GitHub answers 304 without a body while nothing changed. */
        String etag;
        /** The newest version a notification was posted for or the dialog showed as newer. */
        String notified;

        JSONObject toJson() throws JSONException {
            return new JSONObject().put("auto", auto).put("checked_at", checkedAt).put("failed_at", failedAt)
                    .putOpt("failure", failure).putOpt("tag", tag).putOpt("latest", latest)
                    .putOpt("published_at", publishedAt).putOpt("notes", notes)
                    .put("no_release", noRelease).putOpt("etag", etag).putOpt("notified", notified);
        }

        /**
         * The stored state. A file that cannot be read starts again with the daily check off: it may hold the user's
         * "off", and a network call stays off when that is not known.
         */
        static State parse(String text) {
            State state = new State();
            if (text == null || text.trim().isEmpty()) return unreadable();
            try {
                JSONObject json = new JSONObject(text);
                state.auto = json.optBoolean("auto", true);
                state.checkedAt = json.optLong("checked_at", 0);
                state.failedAt = json.optLong("failed_at", 0);
                state.failure = text(json, "failure");
                state.tag = text(json, "tag");
                state.latest = text(json, "latest");
                state.publishedAt = text(json, "published_at");
                state.notes = text(json, "notes");
                state.noRelease = json.optBoolean("no_release", false);
                state.etag = text(json, "etag");
                state.notified = text(json, "notified");
            } catch (JSONException | RuntimeException error) {
                return unreadable();
            }
            return state;
        }

        static State unreadable() {
            State state = new State();
            state.auto = false;
            return state;
        }
    }

    /** GitHub's answer: the HTTP status (0: none, [failure] says why), the body of a 200, the ETag and a redirect's address. */
    static final class Response {
        int status;
        String body, etag, location, failure, detail;
    }

    // Plain Java from here to the file and network code, so it can be checked off the device.

    /** A string value; null when missing, JSON null or not a string (Android's optString gives "null" for JSON null). */
    static String text(JSONObject json, String key) {
        if (!json.has(key) || json.isNull(key)) return null;
        Object value = json.opt(key);
        return value instanceof String ? (String) value : null;
    }

    /** {major, minor, patch, dev}, dev Integer.MAX_VALUE for a release (after its development versions); null when not a version. */
    static int[] version(String text) {
        if (text == null) return null;
        Matcher matcher = VERSION.matcher(text.trim());
        if (!matcher.matches()) return null;
        try {
            return new int[]{Integer.parseInt(matcher.group(1)), Integer.parseInt(matcher.group(2)),
                    Integer.parseInt(matcher.group(3)), matcher.group(4) == null ? Integer.MAX_VALUE : Integer.parseInt(matcher.group(4))};
        } catch (NumberFormatException error) {
            return null;
        }
    }

    /** Negative, 0 or positive as [a] is older than, the same as or newer than [b]; null when either is not a version. */
    static Integer compare(String a, String b) {
        int[] left = version(a), right = version(b);
        if (left == null || right == null) return null;
        for (int i = 0; i < 4; i++) if (left[i] != right[i]) return Integer.compare(left[i], right[i]);
        return 0;
    }

    /** Whether [latest] is past the version already notified or seen (any version when none was). */
    static boolean newerThanNotified(String latest, String notified) {
        if (latest == null) return false;
        if (notified == null) return true;
        Integer order = compare(latest, notified);
        return order == null ? !latest.equals(notified) : order > 0;
    }

    /** Whether a check that stored [s] posts a notification: a release newer than this build and than any notified. */
    static boolean shouldNotify(State s, String installed) {
        Integer order = s.latest == null ? null : compare(s.latest, installed);
        return order != null && order > 0 && newerThanNotified(s.latest, s.notified);
    }

    /** No network at all, or Android keeps this app off it. */
    static boolean offline(String networkType) {
        return "none".equals(networkType) || "blocked".equals(networkType);
    }

    /**
     * Whether a due automatic check waits for the next look: without a network, or while Android has not confirmed the
     * internet for the first MAX_VALIDATION_WAITS looks; an unreadable network state does not wait.
     */
    static boolean dailyWaits(boolean known, String networkType, boolean validated, int waits) {
        if (!known) return false;
        if (offline(networkType)) return true;
        return !validated && waits < MAX_VALIDATION_WAITS;
    }

    /** GitHub's API address of the latest release, from the bundle's project page; null for any other address. */
    static String apiUrl(String projectUrl) {
        if (projectUrl == null) return null;
        Matcher matcher = PROJECT.matcher(projectUrl.trim());
        if (!matcher.matches() || matcher.group(2).endsWith(".git")) return null;
        return API_PREFIX + "repos/" + matcher.group(1) + "/" + matcher.group(2) + "/releases/latest";
    }

    /** The project page without "https://", as the dialog shows it. */
    static String shortPage(String projectUrl) {
        return projectUrl == null ? "" : projectUrl.replaceFirst("^https://", "");
    }

    /**
     * Whether an automatic check is due: never answered, GitHub's last answer 20 h ago or in the future (the clock
     * moved back), and no failure in the hour before (20 h after a redirect off GitHub's API; "no internet" from the
     * dialog does not count).
     */
    static boolean due(State state, long now) {
        if (state.failedAt > 0 && now >= state.failedAt && !NO_NETWORK.equals(state.failure)
                && now - state.failedAt < (MOVED.equals(state.failure) ? DUE_MS : RETRY_MS)) {
            return false;
        }
        return state.checkedAt <= 0 || state.checkedAt > now || now - state.checkedAt >= DUE_MS;
    }

    /** Applies GitHub's answer to [state] at [now]; returns what happened, for the log. */
    static String apply(State state, Response response, long now) {
        if (response.status == 200) {
            try {
                JSONObject release = new JSONObject(response.body == null ? "" : response.body);
                String tag = text(release, "tag_name");
                if (tag == null || tag.trim().isEmpty()) throw new JSONException("no tag_name");
                state.tag = tag.trim();
                state.latest = state.tag.startsWith("v") || state.tag.startsWith("V") ? state.tag.substring(1) : state.tag;
                state.publishedAt = text(release, "published_at");
                state.notes = cleanNotes(text(release, "body"));
                state.noRelease = false;
                state.etag = response.etag;
                answered(state, now);
                return "latest release " + state.tag + detail(response);
            } catch (JSONException | RuntimeException error) {
                state.failedAt = now;
                state.failure = RESPONSE;
                return "unreadable answer";
            }
        }
        if (response.status == 304) {
            if (state.latest == null && !state.noRelease) {
                // Nothing to keep: ask again without the ETag.
                state.etag = null;
                state.failedAt = now;
                state.failure = RESPONSE;
                return "unchanged, but nothing stored";
            }
            answered(state, now);
            return "unchanged" + (state.tag == null ? "" : " (" + state.tag + ")") + detail(response);
        }
        if (response.status == 404) {
            state.noRelease = true;
            state.tag = state.latest = state.publishedAt = state.notes = null;
            state.etag = response.etag;
            answered(state, now);
            return "no release published" + detail(response);
        }
        state.failedAt = now;
        if (response.status <= 0) state.failure = response.failure == null ? NETWORK : response.failure;
        else if (response.status == 403 || response.status == 429) state.failure = RATE_LIMITED;
        else if (response.status >= 300 && response.status < 400) state.failure = MOVED;
        else state.failure = "http " + response.status;
        return "failed, " + state.failure + (response.status > 0 ? " (" + response.status + ")" : "") + detail(response);
    }

    /** " (redirected)", " (UnknownHostException)" and the like, for the log; also on an answer, so a renamed project shows. */
    private static String detail(Response response) {
        return response.detail == null ? "" : " (" + response.detail + ")";
    }

    private static void answered(State state, long now) {
        state.checkedAt = now;
        state.failedAt = 0;
        state.failure = null;
    }

    /** A release's Markdown notes as plain text, at most MAX_NOTES characters; null when empty. */
    static String cleanNotes(String body) {
        if (body == null) return null;
        String text = body.replace("\r\n", "\n").replace('\r', '\n');
        text = text.replaceAll("(?s)<!--.*?-->", "");
        text = text.replaceAll("!\\[[^\\]]*]\\([^)]*\\)", "");
        text = text.replaceAll("\\[([^\\]]+)]\\([^)]*\\)", "$1");
        // [ \t], not \s: a blank line before a heading or an item stays. A heading needs a space ("#123" stays).
        text = text.replaceAll("(?m)^#{1,6}(?:[ \\t]+|$)", "");
        text = text.replaceAll("(?m)^[ \\t]*[-*+][ \\t]+", "• ");
        text = text.replace("**", "").replace("__", "").replace("`", "");
        text = text.replaceAll("[ \\t]+\\n", "\n").replaceAll("\\n{3,}", "\n\n").trim();
        if (text.length() > MAX_NOTES) {
            int cut = text.lastIndexOf('\n', MAX_NOTES);
            if (cut < MAX_NOTES / 2) cut = MAX_NOTES;
            if (Character.isHighSurrogate(text.charAt(cut - 1))) cut--;
            text = text.substring(0, cut).trim() + "\n…";
        }
        return text.isEmpty() ? null : text;
    }

    /** "6 Nov" this year, else "6 Nov 2025" (Gregorian years, Thai month names on a Thai system), in [zone]. */
    static String day(long millis, long nowMs, TimeZone zone, boolean thai) {
        Locale locale = thai ? new Locale("th", "TH") : Locale.UK;
        SimpleDateFormat year = new SimpleDateFormat("yyyy", Locale.ROOT);
        year.setCalendar(new GregorianCalendar(zone, Locale.ROOT));
        boolean thisYear = year.format(new Date(millis)).equals(year.format(new Date(nowMs)));
        SimpleDateFormat out = new SimpleDateFormat(thisYear ? "d MMM" : "d MMM yyyy", locale);
        out.setCalendar(new GregorianCalendar(zone, locale));
        return out.format(new Date(millis));
    }

    /** A release's date from GitHub's ISO time as [day] shows it; null when unreadable. */
    static String releaseDate(String iso, long nowMs, TimeZone zone, boolean thai) {
        if (iso == null) return null;
        try {
            SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", Locale.ROOT);
            in.setTimeZone(TimeZone.getTimeZone("UTC"));
            in.setLenient(false);
            return day(in.parse(iso).getTime(), nowMs, zone, thai);
        } catch (ParseException | RuntimeException error) {
            return null;
        }
    }

    /**
     * The Settings row's and the report screen's status; when GitHub's last answer is over 2 days old (checks failing,
     * waiting for a network, switched off, or the car not used), its date.
     */
    static String rowStatus(State s, String installed, boolean thai, long nowMs, TimeZone zone) {
        String status = baseStatus(s, installed, thai);
        if (s.checkedAt > 0 && nowMs - s.checkedAt > STALE_MS) {
            status += (thai ? " · ตรวจได้ล่าสุด " : " · last checked ") + day(s.checkedAt, nowMs, zone, thai);
        }
        return status;
    }

    private static String baseStatus(State s, String installed, boolean thai) {
        Integer order = s.latest == null ? null : compare(s.latest, installed);
        if (order != null && order > 0) return thai ? "มีเวอร์ชันใหม่ " + s.latest : s.latest + " is available";
        if (order != null && order == 0) return thai ? "ล่าสุดแล้ว" : "Up to date";
        if (order != null) return thai ? "ใหม่กว่าเวอร์ชันที่ปล่อยล่าสุด (" + s.latest + ")" : "Newer than the latest release (" + s.latest + ")";
        if (s.latest != null) return (thai ? "ล่าสุดบน GitHub: " : "Latest on GitHub: ") + s.latest;
        if (s.noRelease) return thai ? "ยังไม่มีเวอร์ชันที่ปล่อย" : "No release yet";
        if (s.failedAt > 0) return thai ? "ตรวจไม่สำเร็จ · แตะเพื่อดู" : "Check failed · tap for details";
        return s.auto ? (thai ? "ตรวจวันละครั้ง · แตะเพื่อดู" : "Checks once a day · tap for details")
                : (thai ? "ตรวจอัตโนมัติปิดอยู่ · แตะเพื่อดู" : "Automatic check off · tap for details");
    }

    /**
     * The dialog's text, one group per entry (an empty line between groups): the verdict with the versions (and, for
     * a newer release, what to do), that release's notes, then the last check or failure, which joins the verdict's
     * group when there are no notes to keep apart.
     */
    static List<String> lines(State s, String installed, boolean thai, long nowMs, TimeZone zone) {
        List<String> lines = new ArrayList<>();
        String have = installed == null ? "?" : installed;
        if (s.latest != null) {
            String date = releaseDate(s.publishedAt, nowMs, zone, thai);
            String released = date == null ? "" : thai ? " (ปล่อยเมื่อ " + date + ")" : " (released " + date + ")";
            Integer order = compare(s.latest, installed);
            if (order != null && order > 0) {
                lines.add((thai ? "มีเวอร์ชันใหม่ " + s.latest + " · ติดตั้งอยู่ " + have : s.latest + " is available · installed " + have)
                        + released + "\n" + (thai
                        ? "อัปเดต: patch ใหม่ด้วย Morphe Desktop บนคอม แล้วติดตั้งทับ ใช้ keystore เดิม ข้อมูลในแอปจะยังอยู่"
                        : "To update: patch again with Morphe Desktop on a computer and install it over this one."
                        + " With the same keystore the app keeps its data."));
                if (s.notes != null) lines.add((thai ? "มีอะไรใหม่\n" : "What's new\n") + s.notes);
            } else if (order != null && order < 0) {
                // Newer than the release GitHub last answered with: a test build by its name, else a release this
                // check has not seen yet.
                boolean test = have.contains("-dev.");
                lines.add(test ? (thai ? "เวอร์ชันทดสอบ " + have + " · ล่าสุดที่ปล่อย " + s.latest : "Test build " + have + " · latest release " + s.latest)
                        : (thai ? "ติดตั้งอยู่ " + have + " · ใหม่กว่าที่ปล่อยล่าสุด (" + s.latest + ")"
                        : "Installed " + have + " · newer than the latest release (" + s.latest + ")"));
            } else if (order != null) {
                lines.add(thai ? "ล่าสุดแล้ว · " + have : "Up to date · " + have);
            } else {
                // A tag that is not a version, or an installed version that cannot be read: both as they are.
                lines.add((thai ? "ติดตั้งอยู่ " + have + " · ล่าสุดบน GitHub " : "Installed " + have + " · latest on GitHub ") + s.latest + released);
            }
        } else if (s.noRelease) {
            lines.add(thai ? "ยังไม่มีเวอร์ชันที่ปล่อยบน GitHub · ติดตั้งอยู่ " + have : "No release on GitHub yet · installed " + have);
        } else {
            lines.add(thai ? "ยังไม่ได้ตรวจ · ติดตั้งอยู่ " + have : "Not checked yet · installed " + have);
        }
        StringBuilder checks = new StringBuilder();
        if (s.checkedAt > 0) {
            checks.append(thai ? "ตรวจล่าสุด: " : "Last checked: ").append(SendToCarStatus.clock(s.checkedAt, nowMs, zone, thai));
        }
        if (s.failedAt > 0) {
            if (checks.length() > 0) checks.append('\n');
            checks.append(thai ? "ตรวจครั้งล่าสุดไม่สำเร็จ (" : "The last check failed (").append(SendToCarStatus.clock(s.failedAt, nowMs, zone, thai))
                    .append("): ").append(failureText(s.failure, thai));
        }
        if (checks.length() > 0) {
            // Its own group only under the notes; else right under the verdict.
            if (lines.size() > 1) lines.add(checks.toString());
            else lines.set(0, lines.get(0) + "\n" + checks);
        }
        return lines;
    }

    static String failureText(String failure, boolean thai) {
        if (failure == null) return thai ? "ไม่ทราบสาเหตุ" : "unknown";
        switch (failure) {
            case NETWORK: return thai ? "ต่อ GitHub ไม่ได้" : "could not reach GitHub";
            case NO_NETWORK: return thai ? "ไม่มีเครือข่าย" : "no network";
            case RATE_LIMITED: return thai ? "GitHub ให้รอสักพัก ลองใหม่ภายหลัง" : "GitHub asked to wait, try again later";
            case RESPONSE: return thai ? "อ่านคำตอบของ GitHub ไม่ได้" : "GitHub's answer was unreadable";
            case NO_PROJECT: return thai ? "build นี้ไม่มีลิงก์โปรเจกต์" : "this build has no project link";
            case MOVED: return thai ? "GitHub ส่งต่อไปที่อื่น (โปรเจกต์อาจย้ายที่)" : "GitHub sent it elsewhere (the project may have moved)";
            default:
                return failure.startsWith("http ") ? (thai ? "GitHub ตอบ " : "GitHub answered ") + failure.substring(5) : failure;
        }
    }

    /** The dialog's text: the lines, then where the QR code leads. */
    static String message(State s, String installed, boolean thai, long nowMs, TimeZone zone, String projectUrl) {
        StringBuilder text = new StringBuilder();
        for (String line : lines(s, installed, thai, nowMs, zone)) {
            if (text.length() > 0) text.append("\n\n");
            text.append(line);
        }
        text.append("\n\n").append(thai ? "สแกน QR เพื่อเปิดหน้าโปรเจกต์ (ขั้นตอนติดตั้ง)"
                : "Scan the QR code for the project page (install steps)");
        text.append('\n').append(shortPage(projectUrl));
        return text.toString();
    }

    // The file, shared by the main process and the report screen's process.

    private static File dir(Context context) {
        return new File(context.getFilesDir(), DIR);
    }

    static State read(Context context) {
        try {
            return read(dir(context));
        } catch (IOException | RuntimeException error) {
            ReportLog.w(TAG, "update state unreadable", error);
            return State.unreadable();
        }
    }

    /** The state in [dir]: the defaults when there is none. A replaced file is always whole, so no lock is needed. */
    static State read(File dir) throws IOException {
        File file = new File(dir, STATE);
        return file.exists() ? State.parse(readText(file)) : new State();
    }

    interface Change {
        void apply(State state);
    }

    static State update(Context context, Change change) {
        try {
            return update(dir(context), change);
        } catch (IOException | JSONException | RuntimeException error) {
            ReportLog.w(TAG, "update state not written", error);
            return null;
        }
    }

    /** Reads, changes and replaces the state under the lock (this process's threads, then the other process). */
    static State update(File dir, Change change) throws IOException, JSONException {
        synchronized (fileLock) {
            if (!dir.isDirectory() && !dir.mkdirs()) throw new IOException("no folder " + dir);
            try (RandomAccessFile lockFile = new RandomAccessFile(new File(dir, LOCK), "rw");
                 FileLock ignored = lockFile.getChannel().lock()) {
                State state = read(dir);
                change.apply(state);
                File file = new File(dir, STATE), temp = new File(dir, STATE + ".tmp");
                try (FileOutputStream out = new FileOutputStream(temp)) {
                    out.write(state.toJson().toString().getBytes(StandardCharsets.UTF_8));
                    out.getFD().sync();
                }
                // One rename that replaces the old file, so a reader sees the old file or the new one, never part.
                Files.move(temp.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE);
                return state;
            }
        }
    }

    /** The file's text; null when it is larger than MAX_STATE_BYTES. */
    private static String readText(File file) throws IOException {
        try (InputStream in = new FileInputStream(file)) {
            byte[] bytes = readAll(in, MAX_STATE_BYTES);
            return bytes == null ? null : new String(bytes, StandardCharsets.UTF_8);
        }
    }

    /** At most [max] bytes; null when there are more. */
    static byte[] readAll(InputStream in, int max) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int read;
        while ((read = in.read(buffer)) > 0) {
            if (out.size() + read > max) return null;
            out.write(buffer, 0, read);
        }
        return out.toByteArray();
    }

    // The request.

    /** GET [url] with GitHub's headers and, when given, the ETag; one redirect on GitHub's API is followed. Never throws. */
    static Response fetch(String url, String etag, String userAgent) {
        return fetch(url, etag, userAgent, API_PREFIX);
    }

    /** As above, following one redirect whose address starts with [redirectPrefix]. */
    static Response fetch(String url, String etag, String userAgent, String redirectPrefix) {
        Response response = fetchOnce(url, etag, userAgent);
        if (isRedirect(response.status) && response.location != null && response.location.startsWith(redirectPrefix)) {
            String from = response.location;
            response = fetchOnce(from, etag, userAgent);
            if (response.detail == null) response.detail = "redirected";
        }
        return response;
    }

    private static boolean isRedirect(int status) {
        return status == 301 || status == 302 || status == 307 || status == 308;
    }

    private static Response fetchOnce(String url, String etag, String userAgent) {
        Response response = new Response();
        HttpURLConnection connection = null;
        try {
            connection = (HttpURLConnection) new URL(url).openConnection();
            connection.setRequestMethod("GET");
            connection.setInstanceFollowRedirects(false);
            connection.setUseCaches(false);
            connection.setConnectTimeout(CONNECT_TIMEOUT_MS);
            connection.setReadTimeout(READ_TIMEOUT_MS);
            connection.setRequestProperty("Accept", "application/vnd.github+json");
            connection.setRequestProperty("X-GitHub-Api-Version", "2022-11-28");
            connection.setRequestProperty("User-Agent", userAgent);
            if (etag != null) connection.setRequestProperty("If-None-Match", etag);
            int status = connection.getResponseCode();
            response.etag = connection.getHeaderField("ETag");
            response.location = connection.getHeaderField("Location");
            if (status == 200) {
                byte[] body;
                try (InputStream in = connection.getInputStream()) {
                    body = readAll(in, MAX_RESPONSE_BYTES);
                }
                if (body == null) {
                    response.failure = RESPONSE;
                    response.detail = "over " + MAX_RESPONSE_BYTES + " bytes";
                    return response;
                }
                response.body = new String(body, StandardCharsets.UTF_8);
            }
            response.status = status;
        } catch (IOException | RuntimeException error) {
            response.status = 0;
            response.failure = NETWORK;
            response.detail = error.getClass().getSimpleName();
        } finally {
            if (connection != null) connection.disconnect();
        }
        return response;
    }

    private static String installed() {
        try {
            return Utils.getPatchesReleaseVersion();
        } catch (RuntimeException error) {
            return null;
        }
    }

    /** One check now, off the main thread; the state after it (null when the file could not be written). */
    private static State check(Context context) {
        String api = apiUrl(BuildConfig.MAPS_CAR_PROJECT_URL);
        State before = read(context);
        Response response;
        if (api == null) {
            response = new Response();
            response.failure = NO_PROJECT;
        } else {
            String etag = before.latest != null || before.noRelease ? before.etag : null;
            response = fetch(api, etag, "MapsCar/" + installed());
        }
        long now = System.currentTimeMillis();
        String[] what = new String[1];
        State after = update(context, state -> what[0] = apply(state, response, now));
        String installed = installed();
        Integer order = after == null || after.latest == null ? null : compare(after.latest, installed);
        ReportLog.i(TAG, "Update check: " + what[0] + "; installed " + installed + (order == null ? "" : order > 0 ? ", a newer release"
                : order == 0 ? ", the latest" : ", newer than the release"));
        return after;
    }

    /** A check from the dialog: none without a network; otherwise the request decides. */
    private static State checkNow(Context context) {
        ReportDiagnostics.NetworkState network = ReportDiagnostics.readNetwork(context);
        if (network != null && offline(network.type)) {
            long now = System.currentTimeMillis();
            ReportLog.i(TAG, "Update check: no network (" + network.type + ")");
            return update(context, state -> {
                state.failedAt = now;
                state.failure = NO_NETWORK;
            });
        }
        return check(context);
    }

    // Automatic checks, in the main process.

    /**
     * From the main process's start (ReportPatch.onAppStart): the first look about a minute later, then every
     * 30 min, or every 5 min while a due check waits for a network (the head unit often starts before its Wi-Fi).
     */
    static void start(Context context) {
        try {
            Context app = context.getApplicationContext();
            Utils.runOnMainThreadDelayed(() -> tick(app), FIRST_DELAY_MS);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update check not scheduled", error);
        }
    }

    private static void tick(Context app) {
        try {
            Utils.runOnBackgroundThread(() -> {
                boolean waiting = false;
                try {
                    waiting = automatic(app);
                } catch (Throwable error) {
                    ReportLog.w(TAG, "automatic update check failed", error);
                } finally {
                    Utils.runOnMainThreadDelayed(() -> tick(app), waiting ? NETWORK_WAIT_MS : TICK_MS);
                }
            });
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update checks stopped", error);
        }
    }

    /** One automatic look; true when a due check waits for a network. */
    private static boolean automatic(Context app) {
        if (SafeMode.automatic()) return false;
        State state = read(app);
        if (!state.auto || !due(state, System.currentTimeMillis())) return false;
        ReportDiagnostics.NetworkState network = ReportDiagnostics.readNetwork(app);
        boolean known = network != null;
        if (dailyWaits(known, known ? network.type : null, known && network.validated, validationWaits)) {
            if (!offline(network.type)) validationWaits++;
            return true;
        }
        validationWaits = 0;
        if (!checking.compareAndSet(false, true)) return false;
        try {
            State after = check(app);
            // Still "checking" while it notifies, so a dialog waiting for this check sees the notification first.
            if (after != null) notifyIfNewer(app, after);
        } finally {
            checking.set(false);
        }
        return false;
    }

    /** One silent notification per newer version. */
    private static void notifyIfNewer(Context app, State state) {
        if (!shouldNotify(state, installed())) return;
        String latest = state.latest;
        if (!post(app, latest)) return;
        update(app, s -> {
            if (newerThanNotified(latest, s.notified)) s.notified = latest;
        });
        ReportLog.i(TAG, "Update notification for " + latest);
    }

    private static boolean post(Context context, String latest) {
        try {
            NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager == null) return false;
            boolean thai = UiDensityPatch.isThai(context);
            // Low importance: no sound and no pop-up, because the car may be moving.
            NotificationChannel channel = new NotificationChannel(CHANNEL, thai ? "อัปเดตแพตช์" : "Patch updates",
                    NotificationManager.IMPORTANCE_LOW);
            manager.createNotificationChannel(channel);
            Intent open = new Intent(context, ReportActivity.class).setAction(ACTION_SHOW).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            PendingIntent tap = PendingIntent.getActivity(context, 1, open, PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_UPDATE_CURRENT);
            String text = thai ? "แตะเพื่อดูว่ามีอะไรใหม่ อัปเดตด้วย Morphe Desktop บนคอม"
                    : "Tap for what's new. Update with Morphe Desktop on a computer.";
            Notification notification = new Notification.Builder(context, CHANNEL)
                    .setSmallIcon(Icon.createWithResource("android", android.R.drawable.stat_sys_download_done))
                    .setContentTitle(thai ? "มีแพตช์เวอร์ชันใหม่ " + latest : "Patches " + latest + " are available")
                    .setContentText(text)
                    .setStyle(new Notification.BigTextStyle().bigText(text))
                    .setContentIntent(tap)
                    .setAutoCancel(true)
                    .setOnlyAlertOnce(true)
                    .build();
            manager.notify(NOTIFICATION_ID, notification);
            return true;
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update notification not posted", error);
            return false;
        }
    }

    /** The dialog showed [state]: a newer version counts as seen, so it gets no notification and an old one goes. */
    private static void seen(Context context, State state) {
        String latest = state.latest;
        Integer order = latest == null ? null : compare(latest, installed());
        if (order == null || order <= 0) return;
        try {
            NotificationManager manager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);
            if (manager != null) manager.cancel(NOTIFICATION_ID);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update notification not removed", error);
        }
        if (!newerThanNotified(latest, state.notified)) return;
        try {
            // Under the lock, against what is stored then: a newer version notified meanwhile is kept.
            Utils.runOnBackgroundThread(() -> update(context, s -> {
                if (newerThanNotified(latest, s.notified)) s.notified = latest;
            }));
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update not marked as seen", error);
        }
    }

    private static void setAuto(Context context, boolean on) {
        wantedAuto = on;
        try {
            Utils.runOnBackgroundThread(() -> {
                boolean[] stored = new boolean[1];
                if (update(context, state -> stored[0] = state.auto = wantedAuto) != null) {
                    ReportLog.i(TAG, "Update check once a day " + (stored[0] ? "on" : "off"));
                }
            });
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update setting not saved", error);
        }
    }

    // The Settings row.

    public static String getSettingsTitle(Context context) {
        return UiDensityPatch.isThai(context) ? "อัปเดต" : "Updates";
    }

    public static String getSettingsSummary(Context context) {
        boolean thai = UiDensityPatch.isThai(context);
        try {
            String status = rowStatus(read(context), installed(), thai, System.currentTimeMillis(), TimeZone.getDefault());
            rowShown = status;
            return status;
        } catch (Throwable error) {
            ReportLog.w(TAG, "update row status failed", error);
            return thai ? "แตะเพื่อดู" : "Tap for details";
        }
    }

    public static Runnable getSettingsAction(Context context, View container) {
        return () -> show(context, container);
    }

    // The dialog.

    /** The Settings row's, the report screen's and the notification's action: the state off the main thread, then the dialog. */
    static void show(Context context, View container) {
        Activity activity = UiDensityPatch.findActivity(context);
        if (activity == null && container != null) activity = UiDensityPatch.findActivity(container.getContext());
        if (activity == null || activity.isFinishing()) {
            ReportLog.w(TAG, "No activity for the update dialog: " + context);
            return;
        }
        // A dialog removed with its activity keeps isShowing(), so its activity must still be alive too.
        AlertDialog open = openDialog == null ? null : openDialog.get();
        Activity owner = openHost == null ? null : openHost.get();
        if (open != null && open.isShowing() && owner != null && !owner.isFinishing() && !owner.isDestroyed()) return;
        long now = SystemClock.elapsedRealtime();
        if (openingSince != 0 && now - openingSince < OPENING_MS) return;
        openingSince = now;
        Activity host = activity;
        try {
            Utils.runOnBackgroundThread(() -> {
                State state = read(host);
                Utils.runOnMainThread(() -> showDialog(host, container, state));
            });
        } catch (RuntimeException error) {
            openingSince = 0;
            ReportLog.w(TAG, "update dialog not started", error);
        }
    }

    private static String rowNow(State state, boolean thai) {
        return rowStatus(state, installed(), thai, System.currentTimeMillis(), TimeZone.getDefault());
    }

    private static void showDialog(Activity host, View container, State state) {
        openingSince = 0;
        try {
            if (host.isFinishing() || host.isDestroyed()) return;
            boolean thai = UiDensityPatch.isThai(host);
            String projectUrl = BuildConfig.MAPS_CAR_PROJECT_URL, page = projectUrl + PAGE_ANCHOR;
            AlertDialog.Builder builder = new AlertDialog.Builder(host).setTitle(getSettingsTitle(host));
            ReportPatch.Views views = new ReportPatch.Views(builder.getContext());
            boolean landscape = host.getResources().getConfiguration().orientation == Configuration.ORIENTATION_LANDSCAPE;
            LinearLayout content = views.vertical();
            content.setPadding(views.px(24), views.px(8), views.px(24), views.px(8));
            LinearLayout top = landscape ? views.horizontal() : views.vertical();
            top.setGravity(landscape ? Gravity.TOP : Gravity.CENTER_HORIZONTAL);
            QrCode code = QrCode.encode(page);
            if (code != null) {
                int screen = Math.min(host.getResources().getDisplayMetrics().widthPixels, host.getResources().getDisplayMetrics().heightPixels);
                ImageView image = new ImageView(views.themed);
                image.setImageBitmap(ReportPatch.qrBitmap(code, Math.min(views.px(240), screen / 2)));
                image.setContentDescription(thai ? "QR code ของหน้าโปรเจกต์" : "QR code of the project page");
                LinearLayout.LayoutParams imageLayout = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
                imageLayout.gravity = landscape ? Gravity.TOP : Gravity.CENTER_HORIZONTAL;
                top.addView(image, imageLayout);
            }
            TextView message = views.text(15, views.secondary, false);
            message.setLineSpacing(0, 1.2f);
            message.setText(message(state, installed(), thai, System.currentTimeMillis(), TimeZone.getDefault(), projectUrl));
            if (landscape) {
                message.setPadding(code == null ? 0 : views.px(24), 0, 0, 0);
                top.addView(message, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1));
            } else {
                message.setPadding(0, views.px(12), 0, 0);
                top.addView(message);
            }
            content.addView(top);
            CheckBox auto = new CheckBox(views.themed);
            auto.setText(thai ? "ตรวจอัตโนมัติวันละครั้ง (ติดต่อ GitHub)" : "Check once a day (contacts GitHub)");
            auto.setTextColor(views.primary);
            auto.setChecked(state.auto);
            auto.setMinHeight(views.px(48));
            Context app = host.getApplicationContext();
            // What the dialog shows, for the Settings row's subtitle after a change.
            State[] shown = {state};
            // The row's text as this dialog last knew it: a dialog never replaces a text it did not see.
            String[] rowText = {rowBefore(state, thai)};
            auto.setOnCheckedChangeListener((button, checked) -> {
                shown[0].auto = checked;
                setAuto(app, checked);
                String after = rowNow(shown[0], thai);
                if (updateRow(host, container, rowText[0], after)) rowText[0] = after;
            });
            LinearLayout.LayoutParams autoLayout = new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT);
            autoLayout.topMargin = views.px(12);
            content.addView(auto, autoLayout);
            ScrollView root = new ScrollView(views.themed);
            root.addView(content);
            builder.setView(root)
                    .setPositiveButton(thai ? "ปิด" : "Close", null)
                    // Its listener is set after show(), so the dialog stays open while it checks.
                    .setNeutralButton(thai ? "ตรวจตอนนี้" : "Check now", null);
            Intent view = new Intent(Intent.ACTION_VIEW, Uri.parse(page)).addCategory(Intent.CATEGORY_BROWSABLE)
                    .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            if (ReportPatch.hasBrowser(host, view)) {
                builder.setNegativeButton(thai ? "เปิดในเบราว์เซอร์" : "Open in browser", (dialog, which) -> ReportPatch.openLink(host, view, thai));
            }
            AlertDialog dialog = builder.create();
            dialog.show();
            Button check = dialog.getButton(AlertDialog.BUTTON_NEUTRAL);
            if (check != null) check.setOnClickListener(button -> checkFromDialog(host, container, dialog, message, check, shown, rowText, thai));
            openDialog = new WeakReference<>(dialog);
            openHost = new WeakReference<>(host);
            seen(app, state);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update dialog not shown", error);
        }
    }

    /**
     * "Check now": a check off the main thread, then the dialog, the Settings row and the report screen show its
     * result. While a daily check runs, it waits for that one (up to 60 s) and shows what it stored.
     */
    private static void checkFromDialog(Activity host, View container, AlertDialog dialog, TextView message, Button button,
                                        State[] shown, String[] rowText, boolean thai) {
        boolean own = checking.compareAndSet(false, true);
        button.setEnabled(false);
        button.setText(thai ? "กำลังตรวจ…" : "Checking…");
        Context app = host.getApplicationContext();
        try {
            Utils.runOnBackgroundThread(() -> {
                State after = null;
                try {
                    if (own) {
                        after = checkNow(app);
                    } else {
                        long until = SystemClock.elapsedRealtime() + BUSY_WAIT_MS;
                        while (checking.get() && SystemClock.elapsedRealtime() < until) Thread.sleep(250);
                    }
                } catch (Throwable error) {
                    ReportLog.w(TAG, "update check failed", error);
                } finally {
                    if (own) checking.set(false);
                }
                State result = after != null ? after : read(app);
                Utils.runOnMainThread(() -> showResult(host, container, dialog, message, button, shown, rowText, result, thai));
            });
        } catch (RuntimeException error) {
            if (own) checking.set(false);
            button.setEnabled(true);
            button.setText(thai ? "ตรวจตอนนี้" : "Check now");
            ReportLog.w(TAG, "update check not started", error);
        }
    }

    private static void showResult(Activity host, View container, AlertDialog dialog, TextView message, Button button, State[] shown,
                                   String[] rowText, State result, boolean thai) {
        try {
            Context app = host.getApplicationContext();
            shown[0] = result;
            boolean alive = !host.isFinishing() && !host.isDestroyed();
            if (alive) {
                String after = rowNow(result, thai);
                boolean set = updateRow(host, container, rowText[0], after);
                // The result was read after the check, so it is never older than a text another dialog set: the
                // row's latest text may be replaced too (the checkbox keeps to its own dialog's text).
                String latest = rowShown;
                if (!set && latest != null && !latest.equals(rowText[0])) set = updateRow(host, container, latest, after);
                if (set) rowText[0] = after;
            }
            // Also a report screen opened again while this check ran.
            ReportPatch.refreshScreen();
            // Seen only when the dialog still shows it; closed before (or its screen gone), a newer version gets its
            // notification now. A dialog removed with its activity still says isShowing(), hence [alive].
            if (!alive || !dialog.isShowing()) {
                Utils.runOnBackgroundThread(() -> notifyIfNewer(app, result));
                return;
            }
            message.setText(message(result, installed(), thai, System.currentTimeMillis(), TimeZone.getDefault(),
                    BuildConfig.MAPS_CAR_PROJECT_URL));
            button.setEnabled(true);
            button.setText(thai ? "ตรวจตอนนี้" : "Check now");
            seen(app, result);
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update dialog not refreshed", error);
        }
    }

    /** What the row shows: the text it was built with in this process, else what [state] gives. */
    private static String rowBefore(State state, boolean thai) {
        String built = rowShown;
        return built != null ? built : rowNow(state, thai);
    }

    /**
     * Shows [after] in the Settings row's subtitle while it still shows [before] (Maps builds the row once per visit);
     * true when it did.
     */
    private static boolean updateRow(Activity host, View container, String before, String after) {
        try {
            if (before == null || before.equals(after) || host.isFinishing() || host.isDestroyed()) return false;
            TextView view = findText(container != null ? container : host.getWindow().getDecorView(), before);
            if (view == null) return false;
            view.setText(after);
            rowShown = after;
            return true;
        } catch (RuntimeException error) {
            ReportLog.w(TAG, "update row not refreshed", error);
            return false;
        }
    }

    /** The first TextView under [view] showing exactly [text]. */
    private static TextView findText(View view, String text) {
        if (view instanceof TextView) {
            CharSequence shown = ((TextView) view).getText();
            return shown != null && text.contentEquals(shown) ? (TextView) view : null;
        }
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int index = 0; index < group.getChildCount(); index++) {
                TextView found = findText(group.getChildAt(index), text);
                if (found != null) return found;
            }
        }
        return null;
    }
}
