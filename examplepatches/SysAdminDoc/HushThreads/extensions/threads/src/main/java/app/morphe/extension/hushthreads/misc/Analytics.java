/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0).
 */
package app.morphe.extension.hushthreads.misc;

import app.morphe.extension.hushthreads.settings.FamilyNames;
import app.morphe.extension.hushthreads.settings.Settings;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * Points Threads' analytics uploads at an address that answers nothing.
 *
 * <p>Threads builds the address it posts its event logs to in three places: the Pigeon logger's
 * URL ({@code /logging_client_events}, or {@code /pigeon_nest} for its batches), the
 * graph.facebook.com event endpoint, and the analytics endpoint of the MQTT client's settings.
 * Each passes the address it built through {@link #endpoint}, and while the switch is on the
 * upload goes to the loopback address on a port nothing listens on, so it fails at once on the
 * phone itself. Nothing else changes, so the requests Threads needs to work are left alone.
 */
public final class Analytics {
    private Analytics() {}

    /** Where an upload goes while the switch is on: this phone, on a port nothing listens on. */
    static final String NOWHERE = "https://127.0.0.1:1/";

    /**
     * Injected where Threads has built an analytics upload address. Answers {@link #NOWHERE}, or
     * the address as it came while the switch is off, HushThreads is paused or the settings aren't
     * ready yet. Never throws.
     */
    public static String endpoint(String url) {
        HookStatus.invoked(FamilyNames.DISABLE_ANALYTICS);
        try {
            if (!Utils.settingsReady() || !Settings.DISABLE_ANALYTICS.get()) return url;
        } catch (Throwable t) {
            HookStatus.threw(FamilyNames.DISABLE_ANALYTICS, "switch read", t);
            return url;
        }
        HookStatus.counted(FamilyNames.DISABLE_ANALYTICS, "upload address replaced");
        return NOWHERE;
    }
}
