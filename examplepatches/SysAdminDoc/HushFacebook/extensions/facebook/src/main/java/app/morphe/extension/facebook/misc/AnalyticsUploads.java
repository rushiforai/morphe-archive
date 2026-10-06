/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.misc;

import app.morphe.extension.facebook.settings.FamilyNames;
import app.morphe.extension.facebook.settings.Settings;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.diagnostics.FeedFilterCounters;
import app.morphe.extension.shared.diagnostics.HookStatus;

/**
 * What the Hold back analytics uploads patch asks before Facebook uploads its app analytics.
 *
 * <p>Two senders, both Facebook's own and neither shown anywhere in the app. XAnalytics is the
 * native event logger much of the app logs through. While Facebook is in the foreground a task
 * flushes its buffer and starts an upload every three minutes, and the low-priority start-up work
 * resumes its uploader once the network stack is set. The patch puts {@link #holdXAnalyticsUpload}
 * before both calls and skips the call on a yes: the buffer is still flushed, but the upload doesn't
 * start and the uploader stays paused. Papaya is Meta's on-device learning, a JobScheduler job
 * that runs its tasks and reports their results. Its start asks Facebook's config whether Papaya is
 * on, and the patch passes that answer through {@link #papayaOn}, so a held job takes the path
 * Facebook's own off switch takes: it finishes at once and runs nothing.
 *
 * <p>The uploader is resumed once, as Facebook starts, so a change of the switch shows fully after a
 * restart. It fails open: the switch off, a pause, settings that aren't ready yet, or a failure in
 * here, and Facebook goes on as it would have.
 */
public final class AnalyticsUploads {
    /** The diagnostic counter route: each upload or job Facebook went to start, and the ones held back. */
    static final String ROUTE = "Analytics uploads";

    /** What a skipped XAnalytics upload or uploader resume is counted under. */
    static final String XANALYTICS = "XAnalytics uploads";

    /** What a Papaya job sent home without running is counted under. */
    static final String PAPAYA = "Papaya jobs";

    private AnalyticsUploads() {
    }

    /**
     * Injection point, just before XAnalytics' {@code kickOffUpload()} and {@code resumeUploading()}.
     * True skips the call. Never throws.
     */
    public static boolean holdXAnalyticsUpload() {
        return hold(XANALYTICS, "XAnalytics upload");
    }

    /**
     * Injection point, on the answer Facebook's config gives the Papaya job's start about whether
     * Papaya is on. Answers [facebook], or false while the switch holds the job. Never throws.
     */
    public static boolean papayaOn(boolean facebook) {
        if (!facebook) {
            HookStatus.invoked(FamilyNames.ANALYTICS_UPLOADS);
            return false;
        }
        return !hold(PAPAYA, "Papaya job");
    }

    /** True when the switch holds back what's starting, counted under [what]. Never throws. */
    private static boolean hold(String what, String hook) {
        try {
            HookStatus.invoked(FamilyNames.ANALYTICS_UPLOADS);
            FeedFilterCounters.sawList(ROUTE, 1);
            if (!Utils.settingsReady() || !Settings.HOLD_ANALYTICS_UPLOADS.get()) return false;
            FeedFilterCounters.removed(ROUTE, 1, what);
            Logger.printDebug(() -> "Analytics uploads: held back " + what);
            return true;
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.ANALYTICS_UPLOADS, hook, failure);
            return false;
        }
    }
}
