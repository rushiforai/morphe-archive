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
 * Network, Vungle, Nimbus) and of LiveRamp. Most start from a content provider or an androidx
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

    /** Audience Network's DynamicLoaderFactory initialize and doMakeLoader. Null skips the SDK's start or code load; otherwise the same context. */
    public static Context audienceNetwork(Context context) {
        return skip(context, true, "Audience Network") ? null : context;
    }

    /** Vungle's provider onCreate. True skips the SDK's start. */
    public static boolean vungle(ContentProvider provider) {
        return skip(provider, true, "Vungle");
    }

    /** LiveRamp's provider onCreate. True skips the SDK's start. */
    public static boolean liveRamp(ContentProvider provider) {
        return skip(provider, false, "LiveRamp");
    }

    /** Google Mobile Ads' provider attachInfo and MobileAds initialize. Null skips the SDK's start; otherwise the same context. */
    public static Context mobileAds(Context context) {
        return skip(context, true, "Google Mobile Ads") ? null : context;
    }

    /** Nimbus's startup initializer. Null skips the SDK's start; otherwise the same context. */
    public static Context nimbus(Context context) {
        return skip(context, true, "Nimbus") ? null : context;
    }

    private static String family(boolean ad) {
        return ad ? FamilyNames.HIDE_ADS : FamilyNames.DISABLE_ANALYTICS;
    }

    private static boolean skip(ContentProvider provider, boolean ad, String what) {
        Context context;
        try {
            context = provider == null ? null : provider.getContext();
        } catch (Throwable failure) {
            HookStatus.invoked(family(ad));
            HookStatus.threw(family(ad), what + " start", failure);
            return false;
        }
        return skip(context, ad, what);
    }

    /** True for an ad network, which follows Hide ads; false for LiveRamp, which follows Disable analytics. */
    private static boolean skip(Context context, boolean ad, String what) {
        String name = family(ad);
        HookStatus.invoked(name);
        try {
            if (!Utils.settingsReady()) {
                if (context == null || Looper.myLooper() != Looper.getMainLooper()) return false;
                Context app = context.getApplicationContext();
                Utils.setContext(app == null ? context : app);
            }
            Capability capability = ad ? Capability.AD_SDK_STARTUP : Capability.LIVERAMP_STARTUP;
            BooleanSetting setting = ad ? Settings.HIDE_ADS : Settings.DISABLE_ANALYTICS;
            if (!capability.installed() || !setting.get()) return false;
        } catch (Throwable failure) {
            HookStatus.threw(name, what + " start", failure);
            return false;
        }
        HookStatus.counted(name, what + " start skipped");
        return true;
    }
}
