package app.afterglow.extension.navigation;

import android.view.View;
import android.view.ViewStub;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import app.afterglow.extension.Afterglow;

/**
 * The iOS "Tab bar" settings for YouTube's bottom navigation bar (the pivot bar). Injection
 * points of {@code tweaks/navigation/TabBarHooksPatch.kt}; each returns YouTube's own value when
 * its setting is off or anything fails.
 */
@SuppressWarnings("unused")
public final class TabBarHooks {
    private static final String REMOVE_LABELS = "removeLabels";
    private static final String REMOVE_INDICATORS = "removeIndicators";
    private static final String FROSTED_PIVOT = "frostedPivot";

    private static volatile Boolean opaqueBar;
    private static int newContentDotId = -1;
    private static int newContentCountId = -1;

    private TabBarHooks() {}

    /**
     * Injection point, before a tab sets its label. iOS removeLabels clears the tab titles
     * (YTPivotBarItemView updateTitleAndLayoutForRenderer); here the label view is hidden.
     */
    public static void tabLabel(TextView label) {
        try {
            if (label != null && Gate.on(Gate.TAB_BAR, REMOVE_LABELS)) label.setVisibility(View.GONE);
        } catch (Throwable error) {
            Afterglow.error("TabBarHooks.tabLabel", error);
        }
    }

    /**
     * Injection point, when a tab view is built. iOS removeIndicators paints YTPivotBarIndicatorView
     * clear, the red dot and badge of a tab with new content. Android inflates the dot and the count
     * from stubs later and shows and hides them itself, so they are hidden right before each draw,
     * while the setting is on.
     */
    public static void tabCreated(View tab) {
        try {
            if (tab == null || !Gate.installed(Gate.TAB_BAR)) return;
            resolveIds(tab);
            tab.getViewTreeObserver().addOnPreDrawListener(new ViewTreeObserver.OnPreDrawListener() {
                @Override
                public boolean onPreDraw() {
                    try {
                        if (Gate.on(Gate.TAB_BAR, REMOVE_INDICATORS)) {
                            hideBadge(tab, newContentDotId);
                            hideBadge(tab, newContentCountId);
                        }
                    } catch (Throwable error) {
                        Afterglow.error("TabBarHooks.onPreDraw", error);
                    }
                    return true;
                }
            });
        } catch (Throwable error) {
            Afterglow.error("TabBarHooks.tabCreated", error);
        }
    }

    /**
     * Injection point, YouTube's flag for the blurred ("frosted glass") translucent tab bar
     * (45630927). iOS frostedPivot, on by default, turns YouTube's frosted pivot bar flags off
     * (mainAppCoreClientEnableModernIaFrostedPivotBar and friends, YTAfterglow.x:1289-1292).
     * Read once per launch, as YouTube sets the bar up once.
     */
    public static boolean frostedBar(boolean original) {
        try {
            Boolean opaque = opaqueBar;
            if (opaque == null) {
                opaque = Gate.on(Gate.TAB_BAR, FROSTED_PIVOT);
                opaqueBar = opaque;
            }
            if (opaque) return false;
        } catch (Throwable error) {
            Afterglow.error("TabBarHooks.frostedBar", error);
        }
        return original;
    }

    private static void resolveIds(View view) {
        if (newContentDotId != -1) return;
        String packageName = view.getContext().getPackageName();
        newContentCountId = view.getResources().getIdentifier("new_content_count", "id", packageName);
        newContentDotId = view.getResources().getIdentifier("new_content_dot", "id", packageName);
    }

    private static void hideBadge(View tab, int id) {
        if (id == 0 || id == -1) return;
        View badge = tab.findViewById(id);
        if (badge != null && !(badge instanceof ViewStub) && badge.getVisibility() == View.VISIBLE) {
            badge.setVisibility(View.INVISIBLE);
        }
    }
}
