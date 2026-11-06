/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushtumblr.extension.tumblr.privacy;

import android.content.ContentProvider;
import android.content.Context;
import android.os.Looper;

import app.hushtumblr.extension.shared.Utils;
import app.hushtumblr.extension.shared.diagnostics.HookStatus;
import app.hushtumblr.extension.shared.settings.BooleanSetting;
import app.hushtumblr.extension.tumblr.settings.FamilyNames;
import app.hushtumblr.extension.tumblr.settings.PatchFamily.Capability;
import app.hushtumblr.extension.tumblr.settings.Settings;

/**
 * Asked first thing by the launch hooks of Tumblr's ad SDKs (Google Mobile Ads, Meta Audience
 * Network, Vungle, Nimbus) and of LiveRamp, and by Tumblr's own launch setup right before it turns
 * Crashlytics collection on. Most start from a content provider or an androidx
 * startup initializer, so they run on the main thread after the application's attachBaseContext
 * and before its onCreate, which is where HushTumblr's settings normally get ready. Waiting there
 * could only time out (setContext runs on this same thread), so a hook that finds the settings
 * not ready readies them itself from the application context: the pause and safe mode get decided
 * in that call, exactly as they would be a moment later. Off the main thread, or with no context,
 * it answers "start" and Tumblr keeps its own path. Audience Network's DynamicLoaderFactory
 * initialize and Google Mobile Ads' MobileAds initialize are the SDKs' own start methods, which
 * Tumblr's application calls too, so those hooks usually find the settings already ready. So does
 * Audience Network's code loader, asked whenever a bidder token, a mediation setting or an ad
 * wants the SDK's code, which on a skip hands out the SDK's own do-nothing fallback instead.
 *
 * Nothing here names a setting or a capability before the settings are ready: loading either
 * class opens HushTumblr's preferences, which throws with no context yet and leaves the class
 * broken for the rest of the process. The family names are compile-time constants.
 */
public final class SdkStartup {
    private SdkStartup() {}

    /** An ad network, which follows Hide ads. */
    private static final int AD = 0;
    /** LiveRamp, which follows Disable analytics. */
    private static final int LIVERAMP = 1;
    /** Crashlytics collection, which follows Disable analytics. */
    private static final int CRASHLYTICS = 2;

    /** Audience Network's DynamicLoaderFactory initialize and doMakeLoader. Null skips the SDK's start or code load; otherwise the same context. */
    public static Context audienceNetwork(Context context) {
        return skip(context, AD, "Audience Network") ? null : context;
    }

    /** Vungle's provider onCreate. True skips the SDK's start. */
    public static boolean vungle(ContentProvider provider) {
        return skip(provider, AD, "Vungle");
    }

    /** LiveRamp's provider onCreate. True skips the SDK's start. */
    public static boolean liveRamp(ContentProvider provider) {
        return skip(provider, LIVERAMP, "LiveRamp");
    }

    /** Google Mobile Ads' provider attachInfo and MobileAds initialize. Null skips the SDK's start; otherwise the same context. */
    public static Context mobileAds(Context context) {
        return skip(context, AD, "Google Mobile Ads") ? null : context;
    }

    /** Nimbus's startup initializer. Null skips the SDK's start; otherwise the same context. */
    public static Context nimbus(Context context) {
        return skip(context, AD, "Nimbus") ? null : context;
    }

    /**
     * Tumblr's launch setup, handed the value it's about to turn Crashlytics collection on with,
     * every launch. Tumblr's call outranks the manifest flag, so this is where collection stays
     * off: false while Disable analytics is on, otherwise Tumblr's own value. Crashlytics keeps
     * the value for the next launch too, until Tumblr's next call sets it again.
     */
    public static boolean crashReports(Context context, boolean enabled) {
        return !skip(context, CRASHLYTICS, "Crashlytics") && enabled;
    }

    private static String family(int kind) {
        return kind == AD ? FamilyNames.HIDE_ADS : FamilyNames.DISABLE_ANALYTICS;
    }

    private static boolean skip(ContentProvider provider, int kind, String what) {
        Context context;
        try {
            context = provider == null ? null : provider.getContext();
        } catch (Throwable failure) {
            HookStatus.invoked(family(kind));
            HookStatus.threw(family(kind), what + " start", failure);
            return false;
        }
        return skip(context, kind, what);
    }

    private static boolean skip(Context context, int kind, String what) {
        String name = family(kind);
        HookStatus.invoked(name);
        try {
            if (!Utils.settingsReady()) {
                if (context == null || Looper.myLooper() != Looper.getMainLooper()) return false;
                Context app = context.getApplicationContext();
                Utils.setContext(app == null ? context : app);
            }
            Capability capability = kind == AD ? Capability.AD_SDK_STARTUP
                    : kind == LIVERAMP ? Capability.LIVERAMP_STARTUP : Capability.CRASH_REPORTS;
            BooleanSetting setting = kind == AD ? Settings.HIDE_ADS : Settings.DISABLE_ANALYTICS;
            if (!capability.installed() || !setting.get()) return false;
        } catch (Throwable failure) {
            HookStatus.threw(name, what + (kind == CRASHLYTICS ? " collection" : " start"), failure);
            return false;
        }
        HookStatus.counted(name, kind == CRASHLYTICS ? "Crashlytics collection kept off" : what + " start skipped");
        return true;
    }
}
