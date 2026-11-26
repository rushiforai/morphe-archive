package app.template.extension.zalo.navigation;

import android.app.Activity;
import android.content.Context;

import app.template.extension.zalo.buglog.NezumiLog;
import app.template.extension.zalo.settings.NezumiPrefs;
import app.template.extension.zalo.shared.ZaloEnv;

/** Hides the Discovery tab and rebuilds the tab bar when the option changes. */
public final class DiscoveryTab {
    private DiscoveryTab() { }

    public static boolean isDiscoveryHidden() {
        return NezumiPrefs.bool(ZaloEnv.appContext(), NezumiPrefs.HIDE_DISCOVERY, true);
    }

    public static void recreateAfterChange(Context context) {
        refreshDiscoveryTabs();
        Activity activity = ZaloEnv.activityOf(context);
        if (activity != null && !activity.isFinishing() && !activity.isChangingConfigurations()) {
            activity.recreate();
        }
    }

    private static void refreshDiscoveryTabs() {
        try {
            Object configuration = Class.forName("y5f").getMethod("h").invoke(null);
            configuration.getClass().getMethod("o").invoke(configuration);
            configuration.getClass().getMethod("q").invoke(configuration);
        } catch (ReflectiveOperationException | RuntimeException | LinkageError failure) {
            NezumiLog.swallowedOnce("NezumiDiscovery", "tab configuration refresh unavailable (y5f)", failure);
        }
    }
}
