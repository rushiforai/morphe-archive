package app.afterglow.extension.navigation;

import android.view.View;
import android.view.ViewGroup;
import android.view.ViewStub;
import android.view.ViewTreeObserver;
import android.widget.TextView;

import app.afterglow.extension.Afterglow;

import java.util.Map;
import java.util.WeakHashMap;

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
    private static int textId = -1;
    private static final Map<TextView, Integer> hiddenLabels = new WeakHashMap<>();

    private TabBarHooks() {}

    /**
     * Native icon-only renderers omit the TextView entirely and receive extra top padding.
     * Use YouTube's matching labelled layout for both renderer kinds so one label preference
     * controls every tab and the native constraint chains align with labels shown or hidden.
     * The constructor must see the replaced ID as well as the inflater: it derives the
     * icon-only padding flag from that ID. Native icons, avatars and commands stay intact.
     */
    public static int tabLayout(int original, ViewGroup parent) {
        try {
            if (parent == null || !Gate.installed(Gate.TAB_BAR)) return original;
            String packageName = parent.getContext().getPackageName();
            String replacement;
            if (original == parent.getResources().getIdentifier("image_only_tab", "layout", packageName)) {
                replacement = "image_with_text_tab";
            } else if (original == parent.getResources().getIdentifier("avatar_image_only_tab", "layout", packageName)) {
                replacement = "avatar_image_with_text_tab";
            } else return original;
            int labelled = parent.getResources().getIdentifier(replacement, "layout", packageName);
            return labelled == 0 ? original : labelled;
        } catch (Throwable error) {
            Afterglow.error("TabBarHooks.tabLayout", error);
            return original;
        }
    }

    /**
     * Injection point, before a tab sets its label. iOS removeLabels clears the tab titles
     * (YTPivotBarItemView updateTitleAndLayoutForRenderer); here the label view is hidden.
     */
    public static void tabLabel(TextView label) {
        try {
            updateLabel(label);
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
                        View label = textId > 0 ? tab.findViewById(textId) : null;
                        boolean changed = label instanceof TextView && updateLabel((TextView) label);
                        if (Gate.on(Gate.TAB_BAR, REMOVE_INDICATORS)) {
                            hideBadge(tab, newContentDotId);
                            hideBadge(tab, newContentCountId);
                        }
                        // A changed GONE state changes the native constraint chain. Let Android
                        // lay it out again before presenting the newly shown or hidden labels.
                        return !changed;
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
        textId = view.getResources().getIdentifier("text", "id", packageName);
    }

    private static boolean updateLabel(TextView label) {
        if (label == null) return false;
        int visibility = label.getVisibility();
        if (Gate.on(Gate.TAB_BAR, REMOVE_LABELS)) {
            if (!hiddenLabels.containsKey(label)) hiddenLabels.put(label, visibility);
            if (visibility != View.GONE) {
                label.setVisibility(View.GONE);
                return true;
            }
        } else {
            Integer previous = hiddenLabels.remove(label);
            if (previous != null && visibility == View.GONE && previous != View.GONE) {
                label.setVisibility(previous);
                return true;
            }
        }
        return false;
    }

    private static void hideBadge(View tab, int id) {
        if (id == 0 || id == -1) return;
        View badge = tab.findViewById(id);
        if (badge != null && !(badge instanceof ViewStub) && badge.getVisibility() == View.VISIBLE) {
            badge.setVisibility(View.INVISIBLE);
        }
    }
}
