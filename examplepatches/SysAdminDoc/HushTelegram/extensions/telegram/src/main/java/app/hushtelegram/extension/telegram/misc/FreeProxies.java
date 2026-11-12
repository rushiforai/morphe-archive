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
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
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
import java.util.regex.Pattern;

/**
 * Free proxies (#66). Downloads a public list of MTProto proxies, times a connect to each, and keeps
 * the fastest ten in Telegram's own proxy list, where Telegram's proxy screen shows them. While the
 * switch is on, Telegram connects through the fastest and switches to another saved one by itself
 * when it stops answering, unless a proxy of the person's own is in use. A refresh runs when
 * Telegram starts and the last try is six hours old, and from the Find free proxies now row.
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

    /**
     * Where a list comes from, tried in order until one gives proxies. The jsDelivr copy is for
     * networks that block GitHub's raw files, and can be a day behind.
     */
    static final List<String> FEEDS = Collections.unmodifiableList(Arrays.asList(
            "https://raw.githubusercontent.com/SoliSpirit/mtproto/master/all_proxies.txt",
            "https://cdn.jsdelivr.net/gh/SoliSpirit/mtproto@master/all_proxies.txt",
            "https://raw.githubusercontent.com/ALIILAPRO/MTProtoProxy/main/mtproto.txt"));

    /** The part of a proxy link before its "?": t.me's, telegram.me's or telegram.dog's /proxy, or tg://proxy. */
    private static final Pattern LINK_HEAD = Pattern.compile(
            "(?:(?:https?:)?//)?(?:www\\.)?(?:t\\.me|telegram\\.me|telegram\\.dog)/proxy|tg:(?://)?proxy",
            Pattern.CASE_INSENSITIVE);
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

        static {
            Setting.keepWhenPaused(TRIED_AT, RESULT, ADDED);
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
        Utils.runOnMainThread(() -> {
            try {
                place(links);
            } finally {
                finished();
            }
        });
        return true;
    }

    /** Puts [links] in Telegram's list on the main thread and keeps what that came to. */
    static void place(List<String> links) {
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
        keep(taken == 0 ? Result.NOT_TAKEN : Result.ADDED, taken, after);
    }

    // ---- Lists ----------------------------------------------------------------------------------

    /** The proxies of the first list that has any, or none when no list could be read. */
    static List<Proxy> fetch(Transport through) {
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

    /** Every proxy link in [list] that reads, one per server and port, in the order they come. */
    static List<Proxy> parse(String list) {
        Map<String, Proxy> found = new LinkedHashMap<>();
        for (String line : list.split("\\s+")) {
            Proxy proxy = parseLink(line);
            if (proxy != null && !found.containsKey(proxy.server + ":" + proxy.port)) {
                found.put(proxy.server + ":" + proxy.port, proxy);
            }
        }
        return new ArrayList<>(found.values());
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
            String value = decode(pair.substring(equals + 1));
            if (value == null) return null;
            if (key.equals("server")) server = value.toLowerCase(Locale.ROOT);
            else if (key.equals("port")) port = value;
            else if (key.equals("secret")) secret = value;
        }
        if (server == null || port == null || secret == null) return null;
        if (!HOST.matcher(server).matches() && !IPV4.matcher(server).matches()) return null;
        if (!PORT.matcher(port).matches()) return null;
        int number = Integer.parseInt(port);
        if (number < 1 || number > 65535) return null;
        if (secret.length() > MAX_SECRET || !SECRET.matcher(secret).matches()) return null;
        return new Proxy(server, number, secret);
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

    /** What the try found, in one go. [owned] is null when Telegram's list wasn't touched. */
    private static void keep(Result result, int count, @Nullable Set<String> owned) {
        if (owned != null) Stored.ADDED.save(String.join("\n", owned));
        Stored.RESULT.save(result.name() + " " + count);
        // Counts only: a proxy's address and secret stay out of the log.
        Logger.diagnosticInfo(DiagnosticCategory.SETTINGS, "FreeProxies", () -> "Free proxies: " + result + ", " + count + " in the list");
    }

    // ---- The settings row -----------------------------------------------------------------------

    /** What the Find free proxies now row says: a try on its way, or what the last one found. */
    public static String summary() {
        if (running.get()) return L10n.t("Looking for free proxies now.");
        String[] last = Stored.RESULT.get().split(" ", 2);
        Result result = null;
        for (Result each : Result.values()) {
            if (each.name().equals(last[0])) result = each;
        }
        if (Stored.TRIED_AT.get() <= 0 || result == null) {
            return L10n.t("Downloads a public list of proxies now, times them and adds the fastest to Telegram's "
                    + "proxy list, even with the switch above off.");
        }
        switch (result) {
            case ADDED:
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
