/*
 * Forked from https://github.com/SysAdminDoc/HushTelegram at 8c54a1d (GPL-3.0),
 * modified for HushPinterest (Pinterest), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/HushThreads at b141524 (GPL-3.0),
 * modified for HushTelegram (Telegram), 2026.
 *
 * Forked from https://github.com/SysAdminDoc/Hushfacebook at c15d4f79 (GPL-3.0),
 * modified for HushThreads (Threads), 2026.
 *
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.hushpinterest.extension.pinterest.settings;

import androidx.annotation.Nullable;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.InterruptedIOException;
import java.lang.ref.WeakReference;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.TimeZone;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.diagnostics.DiagnosticCategory;
import app.hushpinterest.extension.shared.settings.HushPinterestPause;
import app.hushpinterest.extension.shared.settings.LongSetting;
import app.hushpinterest.extension.shared.settings.Setting;
import app.hushpinterest.extension.shared.settings.SettingsJson;
import app.hushpinterest.extension.shared.settings.StringSetting;
import app.hushpinterest.extension.shared.settings.preference.LogBufferManager;

/**
 * Asks GitHub whether a newer HushPinterest release is out, once the person has turned that on.
 *
 * <p>A sideloaded Pinterest gets no update check, and Morphe Manager looks at its sources only when
 * it's opened, so a new release reached nobody who didn't go looking. This is the only request the
 * extension makes for itself, so it's off until the person turns on
 * {@link Settings#CHECK_FOR_RELEASES}. Then it runs at most once a day, on a worker, when Pinterest
 * starts, and the Check now row runs one whenever it's tapped. Paused, or in safe mode, the switch
 * answers off like every other one, and a start asks nothing.
 *
 * <p>The request is one GET of the latest release, over HTTPS to api.github.com and nowhere else:
 * no user name in the address, short timeouts, a cap on the answer, no cookie, and a plain
 * User-Agent naming HushPinterest and its version. A redirect is followed only while it stays on
 * that host. Of the answer, only the release's version and the Pinterest build its notes say it
 * targets are kept. The time of each try is kept before the request goes out, so one that fails,
 * or a Pinterest closed in the middle of one, waits its day like any other instead of trying again
 * at every start.
 *
 * <p>What comes back only ever becomes a line on the settings screen. There's no notification,
 * nothing is downloaded and nothing is installed.
 */
public final class ReleaseCheck {
    /** The one address the check asks. ExtensionHostsTest holds the README's Privacy section to it. */
    static final String LATEST_RELEASE = "https://api.github.com/repos/SysAdminDoc/HushPinterest/releases/latest";
    static final String HOST = "api.github.com";

    /** How long a try, whatever it found, keeps the next start from asking again. */
    static final long INTERVAL_MS = TimeUnit.DAYS.toMillis(1);

    /**
     * Far more than an answer needs: the latest release with its four assets is about 11 KB. The
     * answer is read no further than this.
     */
    static final int MAX_BODY_BYTES = 256 * 1024;

    static final int MAX_REDIRECTS = 3;

    /**
     * The whole check, redirects and the body's reads included. The connection has its own connect
     * and read timeouts too ({@link ReleaseTransport}), and this ends one that keeps trickling in.
     * A test shortens it.
     */
    static volatile long deadlineMs = 20_000;

    /**
     * Bounds for the parser, well past GitHub's answer: an asset nests four deep, and release notes
     * run to a few thousand characters.
     */
    private static final SettingsJson.Limits LIMITS = new SettingsJson.Limits(8, 20_000, 64 * 1024, 2_000,
            MAX_BODY_BYTES);

    /** How a try ended. Kept by name, so the names stay. */
    enum Result {
        /** GitHub named its latest release. */
        OK,
        /** No answer in time. */
        TIMEOUT,
        /** No connection, or it broke. */
        OFFLINE,
        /** GitHub is turning away requests from this network for now. */
        RATE_LIMITED,
        /** GitHub knows no release yet: its latest-release address answers 404 until the first one is out. */
        NO_RELEASE,
        /** GitHub answered with an error. */
        HTTP_ERROR,
        /** The answer ran past the cap. */
        TOO_LARGE,
        /** The answer wasn't a release this can read. */
        UNREADABLE,
        /** The request would have broken one of the rules above, so it didn't go out. */
        REFUSED
    }

    /** What one try found. The bundle version and its explicitly named Pinterest targets are independent. */
    static final class Answer {
        final Result result;
        @Nullable
        final String newest;
        final List<String> targets;
        /** Why a try that isn't OK ended as it did, for the log. Never on screen, and never an address. */
        @Nullable
        final String reason;

        private Answer(Result result, @Nullable String newest, List<String> targets, @Nullable String reason) {
            this.result = result;
            this.newest = newest;
            this.targets = targets;
            this.reason = reason;
        }

        static Answer ok(String newest, List<String> targets) {
            return new Answer(Result.OK, newest, targets, null);
        }

        static Answer failed(Result result, String reason) {
            return new Answer(result, null, Collections.emptyList(), reason);
        }

        @Override
        public String toString() {
            if (result != Result.OK) return result + " (" + reason + ")";
            return "newest " + newest + (targets.isEmpty() ? "" : ", supports Pinterest " + String.join(", ", targets));
        }
    }

    /** One GET. The phone's is {@link ReleaseTransport}; a test hands in its own, so no test goes online. */
    interface Transport {
        Exchange get(URL url, Map<String, String> headers) throws IOException;
    }

    /** One answer: its status, its headers and its body, until it's closed. */
    interface Exchange extends Closeable {
        int status() throws IOException;

        @Nullable
        String header(String name);

        /** The length the answer announced, or -1. */
        long length();

        InputStream body() throws IOException;

        @Override
        void close();
    }

    /** Told on the main thread when a try has ended and what it found is kept. */
    interface Listener {
        void releaseCheckFinished();
    }

    /**
     * What the last try found, kept in the settings store. It's HushPinterest's own state, like the
     * crash count: it keeps its value while paused and never goes in a settings file. A class of
     * its own, so nothing here loads a setting before the context is set.
     */
    static final class Stored {
        /** When the last try started, kept before its request went out. 0 when there's been none. */
        static final LongSetting CHECKED_AT =
                new LongSetting("hushpinterest_release_checked_at", 0L, false, false);
        /** The last try's {@link Result}, by name. */
        static final StringSetting RESULT = new StringSetting("hushpinterest_release_result", "", false, false);
        /** The latest release the last successful try found, without its "v". */
        static final StringSetting NEWEST = new StringSetting("hushpinterest_release_newest", "", false, false);
        /** Discarded compatibility data from the parser that only kept the newest target. */
        static final StringSetting LEGACY_TARGET = new StringSetting("hushpinterest_release_pinterest", "", false, false);
        /** Explicit targets, comma separated. A new key invalidates the old lossy cache without guessing support. */
        static final StringSetting TARGETS = new StringSetting("hushpinterest_release_pinterest_targets_v2", "", false, false);

        static {
            Setting.keepWhenPaused(CHECKED_AT, RESULT, NEWEST, LEGACY_TARGET, TARGETS);
        }

        private Stored() {
        }
    }

    /** The transport a check uses. A test sets its own. */
    static volatile Transport transport = new ReleaseTransport();

    /** The running bundle's version, or null to read the one patched in. A test sets it. */
    @Nullable
    static volatile String versionForTests;

    /** The running Pinterest's version name, or null to ask the package manager. A test sets it. */
    @Nullable
    static volatile String pinterestForTests;

    private static final AtomicBoolean running = new AtomicBoolean();

    @Nullable
    private static volatile WeakReference<Listener> listener;

    private ReleaseCheck() {
    }

    // ---- When a check runs ---------------------------------------------------------------------

    /**
     * Called once per Pinterest start, from SettingsEntry.onApplicationCreate after the context is
     * set: a check when the switch is on and the last try is a day old.
     */
    public static void onPinterestStart() {
        onPinterestStart(System.currentTimeMillis());
    }

    static void onPinterestStart(long now) {
        try {
            // Before the settings are ready a read would load them with no context. Paused, the
            // switch answers off like every other one.
            if (!Utils.settingsReady() || !Utils.isMainProcess()) return;
            if (!Settings.CHECK_FOR_RELEASES.get()) return;
            if (!due(now, Stored.CHECKED_AT.get())) return;
            start(now);
        } catch (Throwable failure) {
            Logger.printException(() -> "Release check: could not start one", failure);
        }
    }

    /**
     * Whether a try at [last] leaves one due at [now]: there's been none, a day has gone by, or the
     * clock was set back past it, which would otherwise hold every check off until it came round.
     */
    static boolean due(long now, long last) {
        return last <= 0 || now < last || now - last >= INTERVAL_MS;
    }

    /**
     * The Check now row: a try whatever the switch says, since the tap asked for it. One already on
     * its way answers this tap too. False only when the worker queue had no room.
     */
    static boolean checkNow() {
        return start(System.currentTimeMillis());
    }

    /** Whether a try is on its way. */
    static boolean isRunning() {
        return running.get();
    }

    private static boolean start(long now) {
        if (!running.compareAndSet(false, true)) return true;
        boolean queued = Utils.runOnBackgroundThread(() -> {
            try {
                run(now);
            } finally {
                running.set(false);
                Utils.runOnMainThread(ReleaseCheck::finished);
            }
        });
        if (!queued) running.set(false);
        return queued;
    }

    /** The screen showing now hears when a try ends, and only while it's alive. */
    static void watch(Listener watcher) {
        listener = new WeakReference<>(watcher);
    }

    static void unwatch(Listener watcher) {
        WeakReference<Listener> held = listener;
        if (held != null && held.get() == watcher) listener = null;
    }

    private static void finished() {
        WeakReference<Listener> held = listener;
        Listener watcher = held == null ? null : held.get();
        if (watcher == null) return;
        try {
            watcher.releaseCheckFinished();
        } catch (Throwable failure) {
            Logger.printException(() -> "Release check: the screen couldn't show the answer", failure);
        }
    }

    /** One try, on a worker: its time is kept first, then what it found. */
    static void run(long now) {
        // A time that can't be kept would let every start try again, so there's no request then.
        if (!Stored.CHECKED_AT.save(now)) {
            Logger.printInfo(() -> "Release check: the time of this try couldn't be kept, so it didn't ask");
            return;
        }
        Answer answer = fetch(transport, runningVersion());
        keep(answer);
        Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "ReleaseCheck", () -> "Release check: " + answer);
    }

    /** What the try found, in one commit. A failed try leaves the last release found where it was. */
    private static void keep(Answer answer) {
        Map<Setting<?>, Object> found = new HashMap<>();
        found.put(Stored.RESULT, answer.result.name());
        if (answer.result == Result.OK && answer.newest != null) {
            found.put(Stored.NEWEST, answer.newest);
            found.put(Stored.TARGETS, String.join(",", answer.targets));
            found.put(Stored.LEGACY_TARGET, "");
        }
        try {
            Setting.saveAll(found);
        } catch (IOException | RuntimeException failure) {
            Logger.printException(() -> "Release check: what it found couldn't be kept", failure);
        }
    }

    // ---- The request ---------------------------------------------------------------------------

    /** Asks for the latest release through [transport] and reads the answer. Blocking. Never throws. */
    static Answer fetch(Transport transport, @Nullable String version) {
        long deadline = System.nanoTime() + TimeUnit.MILLISECONDS.toNanos(deadlineMs);
        Map<String, String> headers = headers(version);
        URL url;
        try {
            url = new URL(LATEST_RELEASE);
        } catch (MalformedURLException impossible) {
            return Answer.failed(Result.REFUSED, "the address isn't well formed");
        }
        for (int hop = 0; hop <= MAX_REDIRECTS; hop++) {
            String refusal = refusal(url);
            if (refusal != null) {
                return Answer.failed(Result.REFUSED, (hop == 0 ? "the address " : "redirect " + hop + " ") + refusal);
            }
            if (System.nanoTime() - deadline > 0) return Answer.failed(Result.TIMEOUT, "the check ran out of time");
            try (Exchange exchange = transport.get(url, headers)) {
                int status = exchange.status();
                if (status == 301 || status == 302 || status == 303 || status == 307 || status == 308) {
                    String location = exchange.header("Location");
                    if (location == null || location.trim().isEmpty()) {
                        return Answer.failed(Result.HTTP_ERROR, "a redirect named no address");
                    }
                    try {
                        url = new URL(url, location.trim());
                    } catch (MalformedURLException malformed) {
                        return Answer.failed(Result.REFUSED, "redirect " + (hop + 1) + " isn't well formed");
                    }
                    continue;
                }
                if (status == 429 || (status == 403 && rateLimited(exchange))) {
                    return Answer.failed(Result.RATE_LIMITED, "GitHub answered " + status);
                }
                if (status == 404) return Answer.failed(Result.NO_RELEASE, "GitHub answered 404");
                if (status != 200) return Answer.failed(Result.HTTP_ERROR, "GitHub answered " + status);
                long announced = exchange.length();
                if (announced > MAX_BODY_BYTES) {
                    return Answer.failed(Result.TOO_LARGE, "GitHub announced " + announced + " bytes");
                }
                byte[] body = read(exchange.body(), deadline);
                if (body == null) return Answer.failed(Result.TOO_LARGE, "the answer ran past " + MAX_BODY_BYTES + " bytes");
                return parse(body);
            } catch (ReleaseTransport.Refused refused) {
                return Answer.failed(Result.REFUSED, refused.getMessage());
            } catch (InterruptedIOException timeout) {
                // SocketTimeoutException is one, and so is the deadline read() ends a body at.
                return Answer.failed(Result.TIMEOUT, "no answer in time");
            } catch (IOException failure) {
                return Answer.failed(Result.OFFLINE, "the request failed: " + failure.getClass().getSimpleName());
            } catch (RuntimeException failure) {
                return Answer.failed(Result.OFFLINE, "the request failed: " + failure.getClass().getSimpleName());
            }
        }
        return Answer.failed(Result.HTTP_ERROR, "more than " + MAX_REDIRECTS + " redirects");
    }

    /**
     * Everything the request says besides its address. GitHub asks every client for a User-Agent;
     * this one names HushPinterest and its version and nothing about the phone or the person.
     */
    static Map<String, String> headers(@Nullable String version) {
        Map<String, String> headers = new LinkedHashMap<>();
        headers.put("Accept", "application/vnd.github+json");
        headers.put("X-GitHub-Api-Version", "2022-11-28");
        headers.put("User-Agent", userAgent(version));
        return headers;
    }

    /** "HushPinterest/0.1.8", or "HushPinterest" with no version. Only a version's own characters get in. */
    static String userAgent(@Nullable String version) {
        String clean = version == null ? "" : version.replaceAll("[^0-9A-Za-z.-]", "");
        if (clean.length() > 32) clean = clean.substring(0, 32);
        return clean.isEmpty() ? "HushPinterest" : "HushPinterest/" + clean;
    }

    /**
     * Why [url] may not be asked, or null when it may: HTTPS to api.github.com on the default port,
     * with no user name. A user name ahead of the host is how another host hides behind this one,
     * and a backslash is where parsers disagree about where the host ends.
     */
    @Nullable
    static String refusal(URL url) {
        if (!"https".equalsIgnoreCase(url.getProtocol())) return "isn't HTTPS";
        String authority = url.getAuthority();
        if (authority == null || authority.isEmpty()) return "names no host";
        if (url.getUserInfo() != null || authority.indexOf('@') >= 0 || authority.indexOf('\\') >= 0) {
            return "carries a user name";
        }
        if (url.getPort() != -1 && url.getPort() != 443) return "names a port other than 443";
        if (!HOST.equalsIgnoreCase(url.getHost())) return "isn't on " + HOST;
        return null;
    }

    /** A 403 is a rate limit when GitHub says none are left or says when to come back. */
    private static boolean rateLimited(Exchange exchange) {
        String remaining = exchange.header("X-RateLimit-Remaining");
        return (remaining != null && remaining.trim().equals("0")) || exchange.header("Retry-After") != null;
    }

    /** The body, or null when it runs past the cap. The deadline is checked between reads. */
    @Nullable
    static byte[] read(InputStream in, long deadline) throws IOException {
        ByteArrayOutputStream out = new ByteArrayOutputStream(16 * 1024);
        byte[] buffer = new byte[8 * 1024];
        int total = 0;
        int count;
        while ((count = in.read(buffer)) != -1) {
            total += count;
            if (total > MAX_BODY_BYTES) return null;
            out.write(buffer, 0, count);
            if (System.nanoTime() - deadline > 0) throw new InterruptedIOException("the check ran out of time");
        }
        return out.toByteArray();
    }

    // ---- The answer ----------------------------------------------------------------------------

    /** A release's tag: 0.2.0 or v0.2.0, with a pre-release suffix at most. */
    private static final Pattern TAG = Pattern.compile(
            "[vV]?(\\d{1,4}(?:\\.\\d{1,6}){1,3}(?:-[0-9A-Za-z][0-9A-Za-z.]{0,23})?)");

    /** A version to compare: numbers joined by dots, then a pre-release suffix or none. */
    private static final Pattern VERSION = Pattern.compile("[vV]?(\\d{1,9}(?:\\.\\d{1,9})*)(?:-(.+))?");

    /** Positive supported-target clauses. A version elsewhere in release notes is not compatibility evidence. */
    private static final Pattern TARGET_PHRASE = Pattern.compile(
            "(?i)\\b(?:targets?|supports?|applied\\b[^.\\n]{0,60}?\\bto)\\s+Pinterest\\s+");

    /** A complete Pinterest version token. Numeric equivalence is never used for host compatibility. */
    private static final Pattern PINTEREST_VERSION = Pattern.compile(
            "\\d{1,4}(?:\\.\\d{1,6}){2,5}(?![\\w.+-])");
    private static final Pattern TARGET_JOIN = Pattern.compile("(?i)\\s*(?:,\\s*(?:(?:and|or)\\s+)?|(?:and|or)\\s+|/\\s*)");
    private static final Pattern TARGET_PRODUCT = Pattern.compile("(?i)Pinterest\\s+");
    private static final Pattern TARGET_NOTE = Pattern.compile("\\s*\\([^()\\n]{0,80}\\)");
    private static final Pattern TARGET_RANGE = Pattern.compile(
            "(?i)^\\s*(?:[-–—+]|\\.\\.|(?:to|through)\\b|(?:(?:and|or)\\s+)?(?:newer|later|older|higher|above)\\b)");
    private static final Pattern NEGATIVE_TARGET = Pattern.compile(
            "(?i)\\b(?:(?:no longer|used to|formerly|not|never|cannot|can't|doesn't|don't|didn't|won't|wouldn't|failed(?: to)?)"
                    + "(?:\\s+(?:currently|yet|ever|explicitly|actually|officially|still|really|directly)){0,3}"
                    + "|(?:previous|former|earlier|old)\\s+(?:release|version|build)"
                    + "(?:\\s+(?:also|still|only|explicitly|officially|currently|ever|never|now)){0,3})\\s*$");
    static final int MAX_TARGETS = 8;
    private static final int MAX_TARGET_CLAUSE = 512;
    private static final int MAX_TARGET_CLAUSES = 16;

    /** Where a sentence ends: a full stop before a space or the end, or a line break. */
    private static final Pattern SENTENCE_END = Pattern.compile("\\.(?=\\s|$)|\\n");

    /** The answer GitHub gave with a 200, read as a release. */
    static Answer parse(byte[] body) {
        JSONObject release;
        try {
            release = SettingsJson.parseObject(body, LIMITS);
        } catch (IOException | JSONException | RuntimeException unreadable) {
            return Answer.failed(Result.UNREADABLE, "the answer isn't a JSON object this reads");
        }
        Object tag = release.opt("tag_name");
        if (!(tag instanceof String)) return Answer.failed(Result.UNREADABLE, "the answer names no release");
        // The latest release is never either, so an answer saying so isn't the one asked for.
        if (Boolean.TRUE.equals(release.opt("draft")) || Boolean.TRUE.equals(release.opt("prerelease"))) {
            return Answer.failed(Result.UNREADABLE, "the answer is a draft or a pre-release");
        }
        String newest = versionOfTag((String) tag);
        if (newest == null) return Answer.failed(Result.UNREADABLE, "the release's tag isn't a version");
        Object notes = release.opt("body");
        return Answer.ok(newest, notes instanceof String ? targetsIn((String) notes) : Collections.emptyList());
    }

    /** The version a tag names, without its "v", or null when it names none. */
    @Nullable
    static String versionOfTag(String tag) {
        Matcher matcher = TAG.matcher(tag.trim());
        return matcher.matches() ? matcher.group(1) : null;
    }

    /** A bounded list of exact versions from explicit clauses, or no compatibility claim. No ranges are expanded. */
    static List<String> targetsIn(String notes) {
        LinkedHashSet<String> targets = new LinkedHashSet<>();
        Matcher phrase = TARGET_PHRASE.matcher(notes);
        int clauses = 0;
        while (phrase.find()) {
            if (++clauses > MAX_TARGET_CLAUSES) return Collections.emptyList();
            String prefix = notes.substring(Math.max(0, phrase.start() - 100), phrase.start());
            int previousLine = prefix.lastIndexOf('\n');
            int previousSentence = prefix.lastIndexOf(". ");
            prefix = prefix.substring(Math.max(previousLine + 1, previousSentence < 0 ? 0 : previousSentence + 2));
            if (NEGATIVE_TARGET.matcher(prefix).find()) continue;
            Matcher end = SENTENCE_END.matcher(notes);
            int stop = end.find(phrase.end()) ? end.start() : notes.length();
            if (stop - phrase.end() > MAX_TARGET_CLAUSE) return Collections.emptyList();
            List<String> clause = targetClause(notes.substring(phrase.end(), stop));
            if (clause.isEmpty()) return Collections.emptyList();
            targets.addAll(clause);
            if (targets.size() > MAX_TARGETS) return Collections.emptyList();
        }
        return Collections.unmodifiableList(new ArrayList<>(targets));
    }

    private static List<String> targetClause(String text) {
        String clause = text.replace("**", "").replace("`", "").trim();
        LinkedHashSet<String> targets = new LinkedHashSet<>();
        int offset = 0;
        while (offset < clause.length()) {
            Matcher version = PINTEREST_VERSION.matcher(clause).region(offset, clause.length());
            if (!version.lookingAt()) return Collections.emptyList();
            targets.add(version.group());
            if (targets.size() > MAX_TARGETS) return Collections.emptyList();
            offset = version.end();
            Matcher note = TARGET_NOTE.matcher(clause).region(offset, clause.length());
            if (note.lookingAt()) offset = note.end();
            if (TARGET_RANGE.matcher(clause.substring(offset)).find()) return Collections.emptyList();
            Matcher join = TARGET_JOIN.matcher(clause).region(offset, clause.length());
            if (!join.lookingAt()) break;
            offset = join.end();
            Matcher product = TARGET_PRODUCT.matcher(clause).region(offset, clause.length());
            if (product.lookingAt()) {
                offset = product.end();
                if (offset == clause.length() || !Character.isDigit(clause.charAt(offset))) return Collections.emptyList();
            }
            // A trailing clause about Manager or Android is not another Pinterest version.
            if (offset == clause.length() || !Character.isDigit(clause.charAt(offset))) break;
        }
        return new ArrayList<>(targets);
    }

    /** Only the new complete-list cache is read. Legacy single-target data never establishes support. */
    static List<String> cachedTargets(String encoded) {
        if (encoded.isEmpty() || encoded.length() > MAX_TARGET_CLAUSE) return Collections.emptyList();
        String[] values = encoded.split(",", -1);
        if (values.length > MAX_TARGETS) return Collections.emptyList();
        LinkedHashSet<String> targets = new LinkedHashSet<>();
        for (String value : values) {
            if (!PINTEREST_VERSION.matcher(value).matches() || !targets.add(value)) return Collections.emptyList();
        }
        return Collections.unmodifiableList(new ArrayList<>(targets));
    }

    /**
     * Negative, zero or positive as [a] is older than, the same as or newer than [b], or null when
     * either isn't a version. Numbers compare as numbers, so 0.1.10 is newer than 0.1.9, and a
     * pre-release comes before its release: 0.2.0-dev is older than 0.2.0.
     */
    @Nullable
    static Integer compare(@Nullable String a, @Nullable String b) {
        if (a == null || b == null) return null;
        Matcher left = VERSION.matcher(a.trim());
        Matcher right = VERSION.matcher(b.trim());
        if (!left.matches() || !right.matches()) return null;
        String[] x = left.group(1).split("\\.");
        String[] y = right.group(1).split("\\.");
        for (int i = 0; i < Math.max(x.length, y.length); i++) {
            long p = i < x.length ? Long.parseLong(x[i]) : 0;
            long q = i < y.length ? Long.parseLong(y[i]) : 0;
            if (p != q) return p < q ? -1 : 1;
        }
        String xPre = left.group(2);
        String yPre = right.group(2);
        if (xPre == null || yPre == null) return xPre == yPre ? 0 : (xPre == null ? 1 : -1);
        return Integer.signum(xPre.compareTo(yPre));
    }

    // ---- What the screen says ------------------------------------------------------------------

    static String runningVersion() {
        String forced = versionForTests;
        return forced != null ? forced : Utils.getPatchesReleaseVersion();
    }

    static String runningPinterest() {
        String forced = pinterestForTests;
        return forced != null ? forced : Utils.getAppVersionName();
    }

    /** The status card's line, from what the last successful try found, or null when there's nothing to say. */
    @Nullable
    static String statusLine() {
        return statusLine(Stored.NEWEST.get(), cachedTargets(Stored.TARGETS.get()), runningVersion(), runningPinterest());
    }

    /**
     * A newer release than [running], and the explicit Pinterest targets when [pinterest] isn't in
     * that exact set, or null when neither holds. Compared when shown, so the line goes once
     * HushPinterest has been updated, with no new try.
     */
    @Nullable
    static String statusLine(@Nullable String newest, List<String> targets, @Nullable String running,
                             @Nullable String pinterest) {
        if (newest == null || newest.isEmpty()) return null;
        boolean otherTarget = !targets.isEmpty() && pinterest != null
                && PINTEREST_VERSION.matcher(pinterest).matches() && !targets.contains(pinterest);
        String targetNames = String.join(", ", targets);
        Integer againstRunning = compare(newest, running);
        if (againstRunning != null && againstRunning > 0) {
            String out = L10n.f("HushPinterest %1$s is out. Update it in Morphe Manager.", L10n.isolate(newest));
            return otherTarget ? out + " " + L10n.f("It supports Pinterest %1$s.", L10n.isolate(targetNames)) : out;
        }
        if (!otherTarget) return null;
        return L10n.f("HushPinterest %1$s supports Pinterest %2$s.", L10n.isolate(newest), L10n.isolate(targetNames));
    }

    /** What the Check now row says: a try on its way, the last one's answer, or what a tap does. */
    static String checkNowSummary() {
        if (running.get()) return checkingSummary();
        Result result = null;
        for (Result each : Result.values()) {
            if (each.name().equals(Stored.RESULT.get())) result = each;
        }
        if (Stored.CHECKED_AT.get() <= 0 || result == null) return idleSummary();
        return resultLine(result, Stored.NEWEST.get(), runningVersion());
    }

    static String checkingSummary() {
        return L10n.t("Checking GitHub now.");
    }

    static String idleSummary() {
        return L10n.t("Asks GitHub for the newest release right now, even with the switch above off.");
    }

    /** What a try that ended in [result] found, next to the running version [running]. */
    static String resultLine(Result result, @Nullable String newest, @Nullable String running) {
        switch (result) {
            case OK:
                if (newest == null || newest.isEmpty()) return idleSummary();
                Integer order = compare(newest, running);
                if (order == null) return L10n.f("The newest HushPinterest release is %1$s.", L10n.isolate(newest));
                if (order > 0) {
                    return L10n.f("HushPinterest %1$s is out. Update it in Morphe Manager.", L10n.isolate(newest));
                }
                return L10n.t("You have the newest HushPinterest release.");
            case TIMEOUT:
            case OFFLINE:
                return L10n.t("Couldn't reach GitHub. Try again later.");
            case RATE_LIMITED:
                return L10n.t("GitHub is turning away checks from this network for now. Try again later.");
            case NO_RELEASE:
                // "Try again later" would send the reader back for an answer that hasn't changed.
                return L10n.t("No HushPinterest release is out yet.");
            default:
                return L10n.t("GitHub's answer couldn't be used. Try again later.");
        }
    }

    // ---- The diagnostic report -----------------------------------------------------------------

    /**
     * The [RELEASE CHECK] section: the switch, the last try and what it found. Nothing at all
     * while the check has never been on or run, which is most phones.
     */
    static final LogBufferManager.ReportSection REPORT = new LogBufferManager.ReportSection() {
        @Override
        public String title() {
            return "RELEASE CHECK";
        }

        @Override
        public List<String> lines() {
            return reportLines(HushPinterestPause.isPaused());
        }
    };

    static List<String> reportLines(boolean paused) {
        List<String> lines = new ArrayList<>();
        boolean on = Settings.CHECK_FOR_RELEASES.savedValue();
        long at = Stored.CHECKED_AT.get();
        if (!on && at <= 0) return lines;
        String saved = Settings.CHECK_FOR_RELEASES.key + (on ? "=on" : "=off");
        lines.add("switch: " + (paused ? "disabled while paused (saved " + saved + ")" : saved));
        if (at > 0) {
            String result = Stored.RESULT.get();
            lines.add("last try: " + utc(at) + ", result: "
                    + (result.isEmpty() ? "none kept" : result.toLowerCase(Locale.ROOT)));
        }
        String newest = Stored.NEWEST.get();
        if (!newest.isEmpty()) {
            List<String> targets = cachedTargets(Stored.TARGETS.get());
            lines.add("latest release: " + newest + (targets.isEmpty() ? "" : ", supports Pinterest " + String.join(", ", targets)));
        }
        return lines;
    }

    private static String utc(long millis) {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm 'UTC'", Locale.US);
        format.setTimeZone(TimeZone.getTimeZone("UTC"));
        return format.format(new Date(millis));
    }
}
