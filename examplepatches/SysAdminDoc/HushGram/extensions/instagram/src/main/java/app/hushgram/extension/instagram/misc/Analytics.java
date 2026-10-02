/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.misc;

import android.app.Application;

import java.util.HashSet;
import java.util.Set;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.Logger;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.DiagnosticCategory;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/** Helper for the "Disable analytics" patch. */
public final class Analytics {

    private Analytics() {}

    /**
     * Where the events go instead: the discard port on this phone's own loopback address. Nothing
     * listens there, so a connection is refused at once, the same failure an upload meets with no
     * network, and nothing leaves the phone.
     */
    static final String REFUSED = "https://127.0.0.1:9";

    /** How many different addresses and outcomes the debug log names, per process. */
    static final int LOGGED_ADDRESSES = 16;

    /** What the debug log calls Falco's event stream. */
    static final String STREAM = "Falco's event stream";

    /** The app ids of the "Set up on new device" screens: contact import, then location services. */
    static final String CONTACTS_SETUP = "com.bloks.www.bloks.ig.ndx.ci.entry.screen";
    static final String LOCATION_SETUP = "com.bloks.www.bloks.ig.ndx.ls.entry.screen";

    private static final String SOURCE = "Analytics";
    private static final Set<String> LOGGED = new HashSet<>();

    /**
     * Injected where Instagram picks the address it uploads usage events to, its own logging
     * endpoints and Facebook's graph endpoint. Answers [url] with its host swapped for
     * {@link #REFUSED} while the switch is on, or [url] as it came. Never throws. The debug log
     * names each address the first time this process sees it, with what happened to it, so a
     * report shows what the server handed over and which process asked.
     */
    public static String endpoint(String url) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        try {
            if (url == null) return null;
            if (!Utils.settingsReady()) {
                log(url, "went out as it came, the settings weren't ready");
                return url;
            }
            if (!Settings.DISABLE_ANALYTICS.get()) {
                log(url, "went out as it came, the switch is off");
                return url;
            }
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "switch read", t);
            return url;
        }
        log(url, "refused");
        return refused(url);
    }

    /**
     * Injected where Lacrima, Instagram's error reporter, uses the address of its crash reports or
     * its startup pings. Lacrima sends what it has pending as Instagram starts, on a thread of its
     * own, a few milliseconds before HushGram can read its switches. Until then the address is
     * refused, as the switch's default would have it, even with the switch off or HushGram paused:
     * a crash report does nothing for the person using the app. It can't wait for the switch
     * instead. Instagram's main thread waits for that send before it reaches onCreate, where the
     * settings become ready, so a wait only stalls the start (5 s on 449, the length of the wait).
     * After that it's {@link #endpoint}'s answer. Never throws.
     */
    public static String reportEndpoint(String url) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        if (url == null) return null;
        try {
            if (!Utils.settingsReady()) {
                log(url, "refused, before the settings were ready");
                return refused(url);
            }
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "report address", t);
            return url;
        }
        return endpoint(url);
    }

    /**
     * Injected where Instagram's logger reads its switch for Falco's event stream, for each event,
     * handed [on], the logger's own answer (0 or 1). Answers 0 while the switch is on, so the event
     * takes the batch upload {@link #endpoint} refuses and the stream, a request stream to the
     * gateway host the server picks, never starts. Before the settings are ready it answers 0 too,
     * as the switch's default would have it: a batched event still goes out with the switch off.
     * Otherwise [on] as it came. Never throws.
     */
    public static int streamEvents(int on) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        try {
            if (on == 0) return 0;
            if (!Utils.settingsReady()) {
                log(STREAM, "kept off, before the settings were ready");
                return 0;
            }
            if (!Settings.DISABLE_ANALYTICS.get()) {
                log(STREAM, "left on, the switch is off");
                return on;
            }
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "event stream", t);
            return on;
        }
        log(STREAM, "kept off");
        return 0;
    }

    /**
     * Injected first thing where Instagram opens a Bloks screen, handed the screen's app id. Answers
     * 1, and the screen isn't opened, for the "Set up on new device" screens that ask for contacts
     * and location, while the switch is on: the events saying they were seen are refused with the
     * rest, so the server would send them again on every start. Otherwise 0. Never throws.
     */
    public static int setupScreen(String appId) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        try {
            if (!CONTACTS_SETUP.equals(appId) && !LOCATION_SETUP.equals(appId)) return 0;
            if (!Utils.settingsReady() || !Settings.DISABLE_ANALYTICS.get()) {
                log(appId, "shown, the switch is off or the settings weren't ready");
                return 0;
            }
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "setup screen", t);
            return 0;
        }
        log(appId, "skipped");
        return 1;
    }

    /** Logs [url], without its query, and [what] happened to it, once per process. */
    private static void log(String url, String what) {
        try {
            String address = withoutQuery(url);
            synchronized (LOGGED) {
                if (LOGGED.size() >= LOGGED_ADDRESSES || !LOGGED.add(address + " " + what)) return;
            }
            String process = Application.getProcessName();
            Logger.diagnosticDebug(DiagnosticCategory.OTHER, SOURCE,
                    () -> "Disable analytics: " + address + " " + what + " (" + process + ")");
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "log", t);
        }
    }

    /** [url] up to its query or fragment: a token rides in the query, never in the host or path. */
    static String withoutQuery(String url) {
        int end = url.length();
        int query = url.indexOf('?');
        int fragment = url.indexOf('#');
        if (query >= 0) end = query;
        if (fragment >= 0 && fragment < end) end = fragment;
        return url.substring(0, end);
    }

    /** Forgets the logged addresses. For tests. */
    static void forget() {
        synchronized (LOGGED) {
            LOGGED.clear();
        }
    }

    /** [url] with its scheme and host replaced by {@link #REFUSED}, keeping the path and query. */
    static String refused(String url) {
        int scheme = url.indexOf("://");
        int path = url.indexOf('/', scheme < 0 ? 0 : scheme + 3);
        return REFUSED + (path < 0 ? "/" : url.substring(path));
    }
}
