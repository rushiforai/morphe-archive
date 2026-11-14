/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import android.net.Uri;
import androidx.annotation.Nullable;
import app.hushtelegram.extension.shared.L10n;
import app.hushtelegram.extension.shared.Logger;
import app.hushtelegram.extension.shared.Utils;
import app.hushtelegram.extension.shared.diagnostics.DiagnosticCategory;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.LongSetting;
import app.hushtelegram.extension.shared.settings.Setting;
import app.hushtelegram.extension.shared.settings.StringSetting;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.PatchFamily;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.ref.WeakReference;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Free proxies (#66). Downloads a public list of MTProto proxies, times a connect to each, and keeps
 * the fastest ten in Telegram's own proxy list, where Telegram's proxy screen shows them. While the
 * switch is on, Telegram connects through the fastest and switches to another saved one by itself
 * when it stops answering, unless a proxy of the person's own is in use. A refresh runs when
 * Telegram starts and the last try is six hours old, and from the Find free proxies now row.
 * Someone who adds lists of their own (#71) gets those read instead of the public ones, all of them
 * together, and their addresses stay out of the log and out of settings files.
 *
 * <p>Only proxies this class put in the list are ever taken out of it again, and never the one in
 * use. A proxy that was already saved stays the person's, and so does one they pin. Telegram's own calls are
 * {@link TelegramProxies}, which the patch writes for each build. The patch also asks
 * {@link #signInButton} whether the phone number screen shows Telegram's proxy button, which
 * Telegram otherwise keeps for countries where it's blocked.
 */
public final class FreeProxies {
    /** How old the last try has to be before a start tries again. */
    static final long INTERVAL_MS = TimeUnit.HOURS.toMillis(6);
    /** How many of the fastest go in Telegram's list. */
    static final int KEEP = 10;
    /** How many of a list's proxies are timed in one try, picked at random from the rest. */
    static final int MAX_TIMED = 60;
    static final int PING_MS = 3000;
    static final int PING_THREADS = 12;
    /** All the timing together, past which a proxy that hasn't answered counts as not answering. */
    static final long PING_BUDGET_MS = 20_000L;
    static final long FETCH_MS = 20_000L;
    static final int MAX_LIST = 512 * 1024;
    private static final int MAX_LINK = 1024;
    private static final int MAX_SECRET = 512;
    /** How many lists of their own someone can add. */
    public static final int MAX_OWN_LISTS = 5;
    private static final int MAX_ADDRESS = 2048;

    /**
     * Where a list comes from, tried in order until one gives proxies. The jsDelivr copy is for
     * networks that block GitHub's raw files, and can be a day behind.
     */
    static final List<String> FEEDS = Collections.unmodifiableList(Arrays.asList(
            "https://raw.githubusercontent.com/SoliSpirit/mtproto/master/all_proxies.txt",
            "https://cdn.jsdelivr.net/gh/SoliSpirit/mtproto@master/all_proxies.txt",
            "https://raw.githubusercontent.com/ALIILAPRO/MTProtoProxy/main/mtproto.txt"));

    /** The part of a proxy link before its "?": t.me's, telegram.me's or telegram.dog's /proxy, or tg://proxy. */
    private static final String HEAD =
            "(?:(?:https?:)?//)?(?:www\\.)?(?:t\\.me|telegram\\.me|telegram\\.dog)/proxy|tg:(?://)?proxy";
    private static final Pattern LINK_HEAD = Pattern.compile(HEAD, Pattern.CASE_INSENSITIVE);
    /**
     * Where a link starts in a list, whatever comes before it on the line: a markdown "[name](", a
     * bullet, another link (#78). Not in the middle of a longer host name.
     */
    private static final Pattern LINK_START = Pattern.compile("(?<![A-Za-z0-9.-])(?:" + HEAD + ")\\?", Pattern.CASE_INSENSITIVE);
    /** The first character a link's value can't hold, where a list's ")__", "**", emoji or text after it starts. */
    private static final Pattern VALUE_END = Pattern.compile("[^A-Za-z0-9._~%+/=-]");
    /** A whole list sent as one block of base64, as some subscription lists are. */
    private static final Pattern BASE64_LIST = Pattern.compile("[A-Za-z0-9+/_-]{16,}={0,2}");
    /** A host name: dot-separated labels, the last starting with a letter, so an address of numbers isn't one. */
    private static final Pattern HOST = Pattern.compile(
            "(?=.{1,253}$)(?:[a-z0-9](?:[a-z0-9-]{0,61}[a-z0-9])?\\.)+[a-z](?:[a-z0-9-]{0,61}[a-z0-9])?");
    private static final Pattern IPV4 = Pattern.compile(
            "(?:(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\\.){3}(?:25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])");
    /** A secret as hex, 16 bytes or more, or as the base64url Telegram also reads. */
    private static final Pattern SECRET = Pattern.compile("(?:[0-9a-fA-F]{2}){16,}|[A-Za-z0-9_-]{22,}={0,2}");
    private static final Pattern PORT = Pattern.compile("[0-9]{1,5}");

    /** What a try came to. */
    enum Result {
        /** Proxies answered and went in Telegram's list. */
        ADDED,
        /** No list could be downloaded or read. */
        NO_LIST,
        /** A list was read, but none of the proxies timed answered. */
        NONE_ANSWERED,
        /** Proxies answered, but Telegram didn't take any of them. */
        NOT_TAKEN
    }

    /**
     * What the last try found, kept in the settings store. It's HushTelegram's own state, like the
     * release check's: it keeps its value while paused and never goes in a settings file. A class
     * of its own, so nothing here loads a setting before the context is set.
     */
    static final class Stored {
        /** When the last try started, kept before its first request. 0 when there's been none. */
        static final LongSetting TRIED_AT = new LongSetting("hushtelegram_free_proxies_tried_at", 0L, false, false);
        /** The last try's {@link Result} by name, then a space and how many proxies went in. */
        static final StringSetting RESULT = new StringSetting("hushtelegram_free_proxies_result", "", false, false);
        /** The links of the proxies HushTelegram put in Telegram's list, one a line. */
        static final StringSetting ADDED = new StringSetting("hushtelegram_free_proxies_added", "", false, false);
        /**
         * The addresses of the person's own lists, one a line, read instead of {@link #FEEDS}. Kept
         * here rather than in Settings, so an address with a private token in it never goes in a
         * settings file someone shares.
         */
        static final StringSetting LISTS = new StringSetting("hushtelegram_free_proxies_lists", "", false, false);

        static {
            Setting.keepWhenPaused(TRIED_AT, RESULT, ADDED, LISTS);
        }

        private Stored() {
        }
    }

    /** One proxy from a list. Its link is how it's known: to Telegram, and in {@link Stored#ADDED}. */
    static final class Proxy {
        final String server;
        final int port;
        final String secret;
        /** How long a connect took, once timed. */
        long ms;

        Proxy(String server, int port, String secret) {
            this.server = server;
            this.port = port;
            this.secret = secret;
        }

        String link() {
            return "tg://proxy?server=" + server + "&port=" + port + "&secret=" + secret;
        }
    }

    /** How a try goes online. A test sets its own. */
    interface Transport {
        /** The text at an https [address], at most [limit] bytes, read before [deadline] on {@link GoogleTranslate#nanos}. */
        String get(String address, int limit, long deadline) throws IOException;

        /** How long a TCP connect to [host] and [port] took, in milliseconds. Throws when it doesn't connect within [timeoutMs]. */
        long connectMs(String host, int port, int timeoutMs) throws IOException;
    }

    /** Telegram's proxy list, by link. A test sets its own. Called on the main thread. */
    interface Store {
        /** Whether a saved proxy is the one [link] names. */
        boolean saved(String link);

        /** Puts the proxy [link] names at the top of the list, unless it's there already. False when Telegram can't read the link. */
        boolean add(String link);

        /** Whether Use proxy is on and there's a proxy to use. */
        boolean inUse();

        /** Whether [link] names the proxy Telegram connects through when Use proxy is on. */
        boolean current(String link);

        /** Connects through the saved proxy [link] names. False when none is saved. */
        boolean use(String link);

        /** Takes the saved proxy [link] names out of the list, unless it's the current one. */
        void delete(String link);

        /** Whether the saved proxy [link] names is pinned in {@link ProxyOrder}. */
        boolean pinned(String link);

        /** Turns on Telegram's switching to another saved proxy when the current one stops answering. */
        void rotate();
    }

    /** Told on the main thread when a try has ended and what it found is kept. */
    public interface Listener {
        void freeProxiesFinished();
    }

    static volatile Transport transport = new FreeProxyTransport();
    static volatile Store store = new TelegramStore();
    /** Picks which proxies of a long list are timed. A test sets a seeded one. */
    static volatile Random random = new Random();

    private static final AtomicBoolean running = new AtomicBoolean();

    @Nullable
    private static volatile WeakReference<Listener> listener;

    private FreeProxies() {
    }

    // ---- The phone number screen -----------------------------------------------------------------

    /**
     * Asked when the phone number screen updates its proxy button while no proxy is on. True shows
     * the button, which opens Telegram's proxy list, so a proxy can be added before signing in.
     *
     * @param unused always 1 from the patch; the hook takes int, not boolean, per the Morphe rule
     */
    public static boolean signInButton(int unused) {
        HookStatus.invoked(FamilyNames.FREE_PROXIES);
        try {
            if (!Utils.settingsReady() || !Settings.SIGN_IN_PROXY.get()) return false;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.FREE_PROXIES, "sign-in proxy switch read", t);
            return false;
        }
        HookStatus.counted(FamilyNames.FREE_PROXIES, "proxy button shown on the phone number screen");
        return true;
    }

    // ---- When a try runs -------------------------------------------------------------------------

    /**
     * Called once per Telegram start, from SettingsEntry.onApplicationCreate after the context is
     * set: a try when the switch is on and the last one is six hours old.
     */
    public static void onTelegramStart() {
        onTelegramStart(System.currentTimeMillis());
    }

    static void onTelegramStart(long now) {
        try {
            // Before the settings are ready a read would load them with no context. Paused, the
            // switch answers off like every other one.
            if (!Utils.settingsReady() || !Utils.isMainProcess()) return;
            // A switch left on by a build that had the patch does nothing without Telegram's calls.
            if (!PatchFamily.FREE_PROXIES.inBuild() || !Settings.FREE_PROXIES.get()) return;
            if (!due(now, Stored.TRIED_AT.get())) return;
            start(now);
        } catch (Throwable failure) {
            Logger.printException(() -> "Free proxies: could not start a try", failure);
        }
    }

    /** Whether a try at [last] leaves one due at [now]: none yet, six hours gone, or the clock set back past it. */
    static boolean due(long now, long last) {
        return last <= 0 || now < last || now - last >= INTERVAL_MS;
    }

    /**
     * The Find free proxies now row: a try whatever the switch says, since the tap asked for it. It
     * connects only while the switch is on. One already on its way answers this tap too. False
     * only when the worker queue had no room.
     */
    public static boolean findNow() {
        return start(System.currentTimeMillis());
    }

    private static boolean start(long now) {
        if (!running.compareAndSet(false, true)) return true;
        boolean queued = Utils.runOnBackgroundThread(() -> {
            boolean handedOn = false;
            try {
                handedOn = run(now);
            } finally {
                if (!handedOn) Utils.runOnMainThread(FreeProxies::finished);
            }
        });
        if (!queued) running.set(false);
        return queued;
    }

    /** The screen showing now hears when a try ends, and only while it's alive. */
    public static void watch(Listener watcher) {
        listener = new WeakReference<>(watcher);
    }

    public static void unwatch(Listener watcher) {
        WeakReference<Listener> held = listener;
        if (held != null && held.get() == watcher) listener = null;
    }

    private static void finished() {
        running.set(false);
        WeakReference<Listener> held = listener;
        Listener watcher = held == null ? null : held.get();
        if (watcher == null) return;
        try {
            watcher.freeProxiesFinished();
        } catch (Throwable failure) {
            Logger.printException(() -> "Free proxies: the screen couldn't show the answer", failure);
        }
    }

    /**
     * One try, on a worker: its time is kept first, then a list is read and its proxies timed, and
     * the fastest are handed to the main thread for Telegram's list. True when that hand-off is
     * made, which ends the try once Telegram has them.
     */
    static boolean run(long now) {
        // A time that can't be kept would let every start try again, so there's no request then.
        if (!Stored.TRIED_AT.save(now)) {
            Logger.printInfo(() -> "Free proxies: the time of this try couldn't be kept, so it didn't ask");
            return false;
        }
        Transport through = transport;
        List<Proxy> listed = fetch(through);
        if (listed.isEmpty()) {
            keep(Result.NO_LIST, 0, null);
            return false;
        }
        List<Proxy> fastest = time(through, pick(listed, random));
        if (fastest.isEmpty()) {
            keep(Result.NONE_ANSWERED, 0, null);
            return false;
        }
        List<String> links = new ArrayList<>();
        for (Proxy proxy : fastest) links.add(proxy.link());
        int read = listed.size();
        Utils.runOnMainThread(() -> {
            try {
                place(links, read);
            } finally {
                finished();
            }
        });
        return true;
    }

    static void place(List<String> links) {
        place(links, 0);
    }

    /** Puts [links] in Telegram's list on the main thread and keeps what that came to, with how many proxies were [read]. */
    static void place(List<String> links, int read) {
        Set<String> before = added();
        Set<String> after;
        try {
            after = apply(store, links, before, Settings.FREE_PROXIES.get());
        } catch (Throwable failure) {
            // A build whose proxy calls changed shape lands here; the list is as Telegram left it.
            Logger.printException(() -> "Free proxies: Telegram's proxy list didn't take them", failure);
            keep(Result.NOT_TAKEN, 0, null);
            return;
        }
        int taken = 0;
        for (String link : links) if (after.contains(link)) taken++;
        keep(taken == 0 ? Result.NOT_TAKEN : Result.ADDED, taken, read, after);
    }

    // ---- Lists ----------------------------------------------------------------------------------

    /**
     * The proxies of every list of the person's own when there are any, or else of the first public
     * list that has some. None when no list could be read.
     */
    static List<Proxy> fetch(Transport through) {
        List<String> own = ownLists();
        if (!own.isEmpty()) return fetchAll(through, own);
        for (int i = 0; i < FEEDS.size(); i++) {
            int which = i + 1;
            try {
                List<Proxy> found = parse(through.get(FEEDS.get(i), MAX_LIST, GoogleTranslate.deadline(FETCH_MS)));
                if (!found.isEmpty()) return found;
                Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "FreeProxies",
                        () -> "Free proxies: list " + which + " had no proxy it could read");
            } catch (IOException | RuntimeException failure) {
                Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "FreeProxies",
                        () -> "Free proxies: list " + which + " couldn't be read (" + failure.getClass().getSimpleName() + ")");
            }
        }
        return Collections.emptyList();
    }

    /** The proxies of all of [lists] together, one per server and port, from each list that could be read. */
    private static List<Proxy> fetchAll(Transport through, List<String> lists) {
        Map<String, Proxy> found = new LinkedHashMap<>();
        for (int i = 0; i < lists.size(); i++) {
            int which = i + 1;
            try {
                List<Proxy> read = parse(through.get(lists.get(i), MAX_LIST, GoogleTranslate.deadline(FETCH_MS)));
                for (Proxy proxy : read) {
                    if (!found.containsKey(proxy.server + ":" + proxy.port)) found.put(proxy.server + ":" + proxy.port, proxy);
                }
                // The list's number only: its address can hold a token of the person's.
                Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "FreeProxies",
                        () -> "Free proxies: your list " + which + " had " + read.size() + " proxies it could read");
            } catch (IOException | RuntimeException failure) {
                Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "FreeProxies",
                        () -> "Free proxies: your list " + which + " couldn't be read (" + failure.getClass().getSimpleName() + ")");
            }
        }
        return new ArrayList<>(found.values());
    }

    /** The lines of [typed] that hold anything, trimmed, each once, in the order they come. */
    public static List<String> lines(@Nullable String typed) {
        Set<String> kept = new LinkedHashSet<>();
        if (typed != null) {
            for (String line : typed.split("\n")) {
                String trimmed = line.trim();
                if (!trimmed.isEmpty()) kept.add(trimmed);
            }
        }
        return new ArrayList<>(kept);
    }

    /** Whether [line] is an https address a list can be read from. */
    public static boolean listAddress(String line) {
        if (line.isEmpty() || line.length() > MAX_ADDRESS) return false;
        try {
            URI address = new URI(line);
            String host = address.getHost();
            return "https".equalsIgnoreCase(address.getScheme()) && host != null && !host.isEmpty();
        } catch (URISyntaxException notAnAddress) {
            return false;
        }
    }

    /** The person's own lists: what's kept, less any line that isn't an address, at most {@link #MAX_OWN_LISTS}. */
    public static List<String> ownLists() {
        List<String> lists = new ArrayList<>();
        for (String line : lines(Stored.LISTS.get())) {
            if (lists.size() < MAX_OWN_LISTS && listAddress(line)) lists.add(line);
        }
        return lists;
    }

    /** Keeps [lists] as the person's own in place of any before, none meaning the public lists again. Off the main thread. */
    public static boolean saveLists(List<String> lists) {
        return Stored.LISTS.saveCommitted(String.join("\n", lists));
    }

    /**
     * Every proxy link in [list] that reads, one per server and port, in the order they come. A link
     * counts wherever it starts on a line, and a list that's one block of base64 is read decoded.
     */
    static List<Proxy> parse(String list) {
        Map<String, Proxy> found = new LinkedHashMap<>();
        collect(list, found);
        if (found.isEmpty()) {
            String decoded = base64(list);
            if (decoded != null) collect(decoded, found);
        }
        return new ArrayList<>(found.values());
    }

    /** The proxies of the links in [text] into [found], each running to the next space or the next link. */
    private static void collect(String text, Map<String, Proxy> found) {
        Matcher start = LINK_START.matcher(text);
        int from = -1;
        while (true) {
            boolean more = start.find();
            if (from >= 0) {
                String link = text.substring(from, more ? start.start() : text.length()).split("\\s", 2)[0];
                Proxy proxy = parseLink(link);
                if (proxy != null && !found.containsKey(proxy.server + ":" + proxy.port)) {
                    found.put(proxy.server + ":" + proxy.port, proxy);
                }
            }
            if (!more) return;
            from = start.start();
        }
    }

    /** [text] decoded when it's nothing but base64 (either alphabet, spaces and line breaks allowed), or null. */
    @Nullable
    static String base64(String text) {
        String packed = text.replaceAll("\\s+", "");
        if (!BASE64_LIST.matcher(packed).matches()) return null;
        try {
            return new String(Base64.getDecoder().decode(packed.replace('-', '+').replace('_', '/')), StandardCharsets.UTF_8);
        } catch (IllegalArgumentException notBase64) {
            return null;
        }
    }

    /** The proxy a t.me/proxy or tg://proxy link names, or null when it isn't one or names something that can't be. */
    @Nullable
    static Proxy parseLink(String text) {
        if (text.isEmpty() || text.length() > MAX_LINK) return null;
        int query = text.indexOf('?');
        if (query <= 0 || !LINK_HEAD.matcher(text.substring(0, query)).matches()) return null;
        String server = null;
        String port = null;
        String secret = null;
        for (String pair : text.substring(query + 1).split("&")) {
            int equals = pair.indexOf('=');
            if (equals <= 0) continue;
            String key = pair.substring(0, equals);
            // A list copied out of a web page can keep its &amp; between the parameters.
            if (key.startsWith("amp;")) key = key.substring(4);
            String raw = pair.substring(equals + 1);
            Matcher end = VALUE_END.matcher(raw);
            if (end.find()) raw = raw.substring(0, end.start());
            // A + in a secret is base64's, not the space a web form makes of it.
            String value = decode(key.equals("secret") ? raw.replace("+", "%2B") : raw);
            if (value == null) return null;
            if (key.equals("server")) server = host(value);
            else if (key.equals("port")) port = value;
            // Base64's + and / as the base64url Telegram reads, the same bytes.
            else if (key.equals("secret")) secret = value.replace('+', '-').replace('/', '_');
        }
        if (server == null || port == null || secret == null) return null;
        if (!HOST.matcher(server).matches() && !IPV4.matcher(server).matches()) return null;
        if (!PORT.matcher(port).matches()) return null;
        int number = Integer.parseInt(port);
        if (number < 1 || number > 65535) return null;
        if (secret.length() > MAX_SECRET || !SECRET.matcher(secret).matches()) return null;
        return new Proxy(server, number, secret);
    }

    /** A server in lower case, less the one dot a fully written name can end with. */
    private static String host(String value) {
        String host = value.toLowerCase(Locale.ROOT);
        return host.endsWith(".") ? host.substring(0, host.length() - 1) : host;
    }

    @Nullable
    private static String decode(String value) {
        try {
            return URLDecoder.decode(value, "UTF-8");
        } catch (UnsupportedEncodingException | IllegalArgumentException unreadable) {
            return null;
        }
    }

    /** At most {@link #MAX_TIMED} of [listed], at random when there are more, so each try reaches different ones. */
    static List<Proxy> pick(List<Proxy> listed, Random by) {
        if (listed.size() <= MAX_TIMED) return listed;
        List<Proxy> shuffled = new ArrayList<>(listed);
        Collections.shuffle(shuffled, by);
        return new ArrayList<>(shuffled.subList(0, MAX_TIMED));
    }

    /** The {@link #KEEP} of [proxies] that connected fastest, fastest first. None when none connected in time. */
    static List<Proxy> time(Transport through, List<Proxy> proxies) {
        List<Proxy> answered = new ArrayList<>();
        if (proxies.isEmpty()) return answered;
        ExecutorService pool = Executors.newFixedThreadPool(Math.min(PING_THREADS, proxies.size()), task -> {
            Thread thread = new Thread(task, "hushtelegram-proxy-ping");
            thread.setDaemon(true);
            return thread;
        });
        try {
            List<Callable<Proxy>> pings = new ArrayList<>();
            for (Proxy proxy : proxies) {
                pings.add(() -> {
                    try {
                        proxy.ms = through.connectMs(proxy.server, proxy.port, PING_MS);
                        return proxy;
                    } catch (IOException | RuntimeException noAnswer) {
                        return null;
                    }
                });
            }
            for (Future<Proxy> ping : pool.invokeAll(pings, PING_BUDGET_MS, TimeUnit.MILLISECONDS)) {
                if (ping.isCancelled()) continue;
                try {
                    Proxy proxy = ping.get();
                    if (proxy != null) answered.add(proxy);
                } catch (ExecutionException failure) {
                    Logger.printDebug(() -> "Free proxies: a timing failed", failure);
                }
            }
        } catch (InterruptedException interrupted) {
            Thread.currentThread().interrupt();
        } finally {
            pool.shutdownNow();
        }
        // Stable, so proxies as fast as each other keep the list's order.
        Collections.sort(answered, Comparator.comparingLong(proxy -> proxy.ms));
        return answered.size() > KEEP ? new ArrayList<>(answered.subList(0, KEEP)) : answered;
    }

    // ---- Telegram's list ------------------------------------------------------------------------

    /**
     * Puts [fastest] (links, fastest first) in Telegram's list through [into] and returns the links
     * HushTelegram now owns there. [owned] are those it owned before. With [connect], Telegram
     * connects through the fastest unless a proxy of the person's own is in use. Owned proxies no
     * longer among the fastest come out, apart from the one in use. A pinned one stays and is no longer
     * owned. When Telegram takes none of
     * them, nothing changes.
     */
    static Set<String> apply(Store into, List<String> fastest, Set<String> owned, boolean connect) {
        Set<String> nowOwned = new LinkedHashSet<>();
        for (String link : fastest) {
            // One the person saved already stays theirs, so it's never taken out later.
            if (owned.contains(link) || !into.saved(link)) nowOwned.add(link);
        }
        // Telegram puts each new one on top, so the fastest goes in last.
        Set<String> taken = new LinkedHashSet<>();
        for (int i = fastest.size() - 1; i >= 0; i--) {
            if (into.add(fastest.get(i))) taken.add(fastest.get(i));
        }
        // Nothing taken is a build whose calls can't read the links, so the list stays as it was.
        if (taken.isEmpty()) return new LinkedHashSet<>(owned);
        nowOwned.retainAll(taken);
        if (connect) {
            String best = null;
            for (String link : fastest) {
                if (taken.contains(link)) {
                    best = link;
                    break;
                }
            }
            boolean ours = !into.inUse();
            for (String link : owned) ours |= into.current(link);
            for (String link : nowOwned) ours |= into.current(link);
            if (ours && best != null && !(into.inUse() && into.current(best)) && into.use(best)) into.rotate();
        }
        for (String link : owned) {
            if (nowOwned.contains(link)) continue;
            // The one in use stays until a later try has moved off it.
            if (into.current(link)) {
                nowOwned.add(link);
                continue;
            }
            // One the person pinned is theirs now, so it stays, and no later try takes it out.
            if (into.pinned(link)) continue;
            into.delete(link);
        }
        return nowOwned;
    }

    /** The links HushTelegram owns in Telegram's list. */
    static Set<String> added() {
        Set<String> links = new LinkedHashSet<>();
        for (String line : Stored.ADDED.get().split("\n")) {
            if (!line.isEmpty()) links.add(line);
        }
        return links;
    }

    private static void keep(Result result, int count, @Nullable Set<String> owned) {
        keep(result, count, 0, owned);
    }

    /**
     * What the try found, in one go: the result, how many went in, then how many the lists had
     * when that's known. [owned] is null when Telegram's list wasn't touched.
     */
    private static void keep(Result result, int count, int read, @Nullable Set<String> owned) {
        if (owned != null) Stored.ADDED.save(String.join("\n", owned));
        Stored.RESULT.save(result.name() + " " + count + (read > 0 ? " " + read : ""));
        // Counts only: a proxy's address and secret stay out of the log.
        Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "FreeProxies", () -> "Free proxies: " + result + ", " + count + " in the list");
    }

    // ---- The settings row -----------------------------------------------------------------------

    /** What the Find free proxies now row says: a try on its way, or what the last one found. */
    public static String summary() {
        if (running.get()) return L10n.t("Looking for free proxies now.");
        String[] last = Stored.RESULT.get().split(" ");
        Result result = null;
        for (Result each : Result.values()) {
            if (each.name().equals(last[0])) result = each;
        }
        if (Stored.TRIED_AT.get() <= 0 || result == null) {
            if (!ownLists().isEmpty()) {
                return L10n.t("Downloads your proxy lists now, times them and adds the fastest to Telegram's "
                        + "proxy list, even with the switch above off.");
            }
            return L10n.t("Downloads a public list of proxies now, times them and adds the fastest to Telegram's "
                    + "proxy list, even with the switch above off.");
        }
        switch (result) {
            case ADDED:
                if (last.length > 2) {
                    return L10n.f("Proxies added last time: %1$s of %2$s read. They're in Telegram's proxy list.",
                            last[1], last[2]);
                }
                return L10n.f("Proxies added last time: %1$s. They're in Telegram's proxy list.",
                        last.length > 1 ? last[1] : 0);
            case NO_LIST:
                return L10n.t("Couldn't download a proxy list last time. Check your connection and try again.");
            case NONE_ANSWERED:
                return L10n.t("None of the listed proxies answered last time. Try again later.");
            default:
                return L10n.t("Telegram didn't take the proxies last time.");
        }
    }

    /** Telegram's proxy list through the calls the patch wrote, a proxy known by its link. */
    static final class TelegramStore implements Store {
        @Nullable
        private static Object proxy(String link) {
            try {
                return TelegramProxies.parse(Uri.parse(link));
            } catch (RuntimeException unreadable) {
                return null;
            }
        }

        @Nullable
        private static Object entry(String link) {
            Object proxy = proxy(link);
            List<?> saved = TelegramProxies.proxies();
            if (proxy == null || saved == null) return null;
            for (Object entry : new ArrayList<>(saved)) {
                if (entry != null && proxy.equals(TelegramProxies.proxy(entry))) return entry;
            }
            return null;
        }

        @Override
        public boolean saved(String link) {
            return entry(link) != null;
        }

        @Override
        public boolean add(String link) {
            Object proxy = proxy(link);
            return proxy != null && TelegramProxies.add(proxy) != null;
        }

        @Override
        public boolean inUse() {
            return TelegramProxies.enabled() && TelegramProxies.current() != null;
        }

        @Override
        public boolean current(String link) {
            Object current = TelegramProxies.current();
            Object proxy = proxy(link);
            return current != null && proxy != null && proxy.equals(TelegramProxies.proxy(current));
        }

        @Override
        public boolean use(String link) {
            Object entry = entry(link);
            if (entry == null) return false;
            TelegramProxies.use(entry);
            return true;
        }

        @Override
        public void delete(String link) {
            if (current(link)) return;
            Object entry = entry(link);
            if (entry != null) TelegramProxies.delete(entry);
        }

        @Override
        public boolean pinned(String link) {
            Object entry = entry(link);
            return entry != null && ProxyOrder.pinned(entry);
        }

        @Override
        public void rotate() {
            TelegramProxies.rotate();
        }
    }
}
