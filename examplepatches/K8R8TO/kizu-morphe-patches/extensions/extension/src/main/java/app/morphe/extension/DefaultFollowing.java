package app.morphe.extension;

import android.app.Activity;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.WeakHashMap;

import app.morphe.extension.settings.Settings;

/**
 * Selects Twitch's native Home -> Following tab once when a Home activity first opens.
 *
 * The Home tab strip is identified by Twitch resource entry names rather than screen coordinates.
 * This is substantially more reliable than looking for any TextView whose text happens to be
 * "Following": the actual tab view owns the click behavior and Twitch's tab controller updates
 * its selection state.
 */
public final class DefaultFollowing {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final WeakHashMap<Activity, Boolean> SCHEDULED = new WeakHashMap<>();

    private static final String[] TAB_STRIP_IDS = {
            "tab_layout",
            "tab_layout_no_tab_width"
    };

    private DefaultFollowing() {
    }

    public static void onActivityStarted(Activity activity) {
        schedule(activity);
    }

    private static void schedule(final Activity activity) {
        if (activity == null) return;
        synchronized (SCHEDULED) {
            if (SCHEDULED.containsKey(activity)) return;
            SCHEDULED.put(activity, Boolean.TRUE);
        }

        // The Home page is populated asynchronously. Try through the whole startup window rather
        // than assuming the tab strip exists at a fixed delay.
        long[] delays = {500L, 1000L, 1800L, 3000L, 5000L, 8000L};
        for (final long delay : delays) {
            MAIN.postDelayed(new Runnable() {
                @Override
                public void run() {
                    try {
                        if (activity.isFinishing() || activity.isDestroyed()) return;
                        if (selectFollowing(activity)) {
                            return;
                        }
                    } catch (Throwable ignored) {
                    }
                }
            }, delay);
        }
    }

    private static boolean selectFollowing(Activity activity) {
        View root = activity.getWindow().getDecorView();
        View strip = findTabStrip(root);
        if (strip == null) return false;

        if (!(strip instanceof ViewGroup)) return false;
        ViewGroup stripGroup = (ViewGroup) strip;
        if (stripGroup.getChildCount() == 0) return false;

        View rowView = stripGroup.getChildAt(0);
        if (!(rowView instanceof ViewGroup)) return false;
        ViewGroup row = (ViewGroup) rowView;

        String tabEntryName = Settings.DEFAULT_HOME_TAB.get();
        if (!"live".equalsIgnoreCase(tabEntryName) && !"clips".equalsIgnoreCase(tabEntryName)) {
            tabEntryName = "following";
        }

        String desiredLabel = getStringByEntryName(activity, tabEntryName);
        if (desiredLabel == null) desiredLabel = tabEntryName;

        View desiredTab = null;
        for (int i = 0; i < row.getChildCount(); i++) {
            View tab = row.getChildAt(i);
            String caption = firstCaption(tab);
            if (caption != null && desiredLabel.equalsIgnoreCase(caption.trim())) {
                desiredTab = tab;
                break;
            }
        }

        if (desiredTab == null) return false;
        if (isSelected(desiredTab)) return true;

        // This is Twitch's actual tab container. Clicking it lets Twitch's own navigation
        // controller perform the transition and update the selected state.
        try {
            View target = nearestClickable(desiredTab);
            if (target != null && target.isEnabled() && target.performClick()) {
                return true;
            }
            if (desiredTab.isEnabled() && desiredTab.performClick()) {
                return true;
            }
        } catch (Throwable ignored) {
        }
        return isSelected(desiredTab);
    }
    private static View findTabStrip(View root) {
        if (root == null) return null;
        View[] found = new View[1];
        walk(root, new ViewVisitor() {
            @Override
            public void visit(View view) {
                if (found[0] != null) return;
                if (view.getVisibility() != View.VISIBLE || !view.isShown()) return;

                String entry = resourceEntryName(view);
                if (entry != null) {
                    for (String candidate : TAB_STRIP_IDS) {
                        if (candidate.equals(entry)) {
                            found[0] = view;
                            return;
                        }
                    }
                }
            }
        });
        return found[0];
    }

    private static String resourceEntryName(View view) {
        try {
            if (view.getId() == View.NO_ID) return null;
            return view.getResources().getResourceEntryName(view.getId());
        } catch (Throwable ignored) {
            return null;
        }
    }

    private interface ViewVisitor {
        void visit(View view);
    }

    private static void walk(View root, ViewVisitor visitor) {
        visitor.visit(root);
        if (!(root instanceof ViewGroup)) return;

        ViewGroup group = (ViewGroup) root;
        for (int i = 0; i < group.getChildCount(); i++) {
            walk(group.getChildAt(i), visitor);
        }
    }

    private static String firstCaption(View view) {
        if (view instanceof TextView) {
            CharSequence text = ((TextView) view).getText();
            if (text != null && text.length() > 0) return text.toString();
        }

        CharSequence contentDescription = view.getContentDescription();
        if (contentDescription != null && contentDescription.length() > 0) {
            return contentDescription.toString();
        }

        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) {
                String nested = firstCaption(group.getChildAt(i));
                if (nested != null && !nested.trim().isEmpty()) return nested;
            }
        }
        return null;
    }

    private static boolean isSelected(View view) {
        View current = view;
        for (int i = 0; i < 8 && current != null; i++) {
            if (current.isSelected()) return true;
            if (!(current.getParent() instanceof View)) break;
            current = (View) current.getParent();
        }
        return false;
    }

    private static View nearestClickable(View view) {
        View current = view;
        for (int i = 0; i < 8 && current != null; i++) {
            if (current.isClickable()) return current;
            if (!(current.getParent() instanceof View)) break;
            current = (View) current.getParent();
        }
        return null;
    }

    private static String getStringByEntryName(Activity activity, String entryName) {
        try {
            int id = activity.getResources().getIdentifier(
                    entryName,
                    "string",
                    activity.getPackageName()
            );
            if (id != 0) return activity.getResources().getString(id).trim();
        } catch (Throwable ignored) {
        }
        return null;
    }
}
