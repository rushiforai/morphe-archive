package app.zonghome.extension;

import android.app.Activity;
import android.content.res.ColorStateList;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.widget.ImageView;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

public final class NavigationStyle {
    public static boolean bundleControlsToggle() { return false; }
    private NavigationStyle() {}
    private static final WeakHashMap<View, Observer> OBSERVERS = new WeakHashMap<>();
    private static final WeakHashMap<Activity, Boolean> STARTUP = new WeakHashMap<>();
    public static boolean startOnUsage() { return false; }
    public static void prepareStartup(Activity activity, android.os.Bundle savedState) {
        android.content.Intent intent = activity.getIntent();
        boolean deepLink = intent != null && (intent.getData() != null || intent.hasExtra("android-support-nav:controller:deepLinkIntent"));
        STARTUP.put(activity, savedState == null && !deepLink);
    }
    public static boolean hideSmsCard() { return false; }
    public static boolean hideTariff() { return false; }
    public static boolean hideLoanButton() { return false; }
    public static boolean loanShortcut() { return false; }
    public static boolean freeMbsShortcut() { return false; }
    public static boolean hideShortcutCard() { return false; }
    public static boolean leftTitles() { return false; }
    public static boolean homeTitle() { return false; }
    public static boolean bundlesShortcut() { return false; }
    public static boolean shapes() { return false; }
    public static boolean hideUsage() { return false; }
    public static boolean hideBundles() { return false; }
    public static boolean hideNavigation() { return false; }
    public static boolean iconOnly() { return false; }
    public static boolean coloredAllowances() { return false; }
    public static String hiddenHeaderItems() { return ""; }

    public static void install(Activity activity) {
        View root = activity.getWindow().getDecorView();
        if (OBSERVERS.containsKey(root)) return;
        Observer observer = new Observer(root, Boolean.TRUE.equals(STARTUP.remove(activity)));
        OBSERVERS.put(root, observer);
        root.getViewTreeObserver().addOnPreDrawListener(observer);
    }

    private static View find(View root, String name) { return ViewNames.find(root, name); }

    private static final class Observer implements ViewTreeObserver.OnPreDrawListener {
        private final WeakReference<View> root;
        private final HeaderControls header = new HeaderControls();
        private long lastBundleStyle;
        private boolean startupPending;
        private final String selection = "|" + hiddenHeaderItems() + "|";
        private final ColorStateList[] colors = new ColorStateList[3];
        Observer(View view, boolean freshLaunch) {
            startupPending = freshLaunch && startOnUsage();
            root = new WeakReference<>(view);
            String[] resources = {"system_accent1_200", "system_accent2_200", "system_accent3_200"};
            int[] fallback = {0xffa8c7fa, 0xffb8cda6, 0xffeab9d2};
            for (int i = 0; i < colors.length; i++) {
                int color = fallback[i];
                if (Build.VERSION.SDK_INT >= 31) {
                    int id = view.getResources().getIdentifier(resources[i], "color", "android");
                    if (id != 0) color = view.getResources().getColor(id, view.getContext().getTheme());
                }
                colors[i] = ColorStateList.valueOf(color);
            }
        }
        private boolean hide(View view, String key) {
            if (view == null || !selection.contains("|" + key + "|")) return false;
            if (view.getVisibility() == View.GONE) return false;
            view.setVisibility(View.GONE);
            return true;
        }
        @Override public boolean onPreDraw() {
            View view = root.get();
            if (view == null) return true;
            boolean changed = HomeControls.apply(view);
            changed |= hide(find(view, "clNotification"), "Notifications");
            changed |= hide(find(view, "btnHamBurger"), "Menu");
            changed |= hide(find(view, "btnRefresh"), "Refresh");
            if (hideShortcutCard()) {
                View tray = find(view, "cardTray");
                if (tray != null && tray.getVisibility() != View.GONE) { tray.setVisibility(View.GONE); changed = true; }
            }
            View homeCard = find(view, "tvBalance");
            View bundlesTabs = find(view, "cardViewBundleMain") == null ? null : find(view, "viewPager2");
            changed |= header.apply(view, homeCard != null && homeCard.isShown(),
                bundlesTabs != null && bundlesTabs.isShown(), selection, colors[0]);
            View bar = find(view, "bottomNav");
            if (bar != null) {
                if (startupPending && homeCard != null && homeCard.isShown()) {
                    startupPending = false;
                    int destination = view.getResources().getIdentifier("fragUsage", "id", "com.zong.customercare");
                    if (destination != 0) {
                        try {
                            bar.getClass().getMethod("setSelectedItemId",int.class).invoke(bar,destination);
                            changed = true;
                        } catch (ReflectiveOperationException ignored) { }
                    }
                }
                if (hideNavigation() && bar.getVisibility() != View.GONE) {
                    bar.setVisibility(View.GONE);
                    changed = true;
                }
                try {
                    android.view.Menu menu = (android.view.Menu) bar.getClass().getMethod("getMenu").invoke(bar);
                    changed |= hideMenuItem(view, menu, "fragUsage", hideUsage());
                    changed |= hideMenuItem(view, menu, "navigation", hideBundles());
                } catch (ReflectiveOperationException ignored) { }
            }
            long now = android.os.SystemClock.uptimeMillis();
            boolean styleNow = bundlesTabs == null || !bundlesTabs.isShown() || lastBundleStyle == 0 || now-lastBundleStyle >= 200;
            if (styleNow && shapes() && (bundlesTabs == null || !bundlesTabs.isShown())) MaterialShapes.apply(view);
            if (iconOnly()) {
                View navigation = find(view, "bottomNav");
                if (navigation != null) {
                    try {
                        Object mode = navigation.getClass().getMethod("getLabelVisibilityMode").invoke(navigation);
                        if (!Integer.valueOf(2).equals(mode)) {
                            navigation.getClass().getMethod("setLabelVisibilityMode", int.class).invoke(navigation, 2);
                            changed = true;
                        }
                    } catch (ReflectiveOperationException ignored) { }
                }
            }
            if (styleNow) {
                if (coloredAllowances()) tintIcons(view);
                lastBundleStyle = now;
            }
            return !changed;
        }
        private boolean hideMenuItem(View root, android.view.Menu menu, String name, boolean enabled) {
            if (!enabled) return false;
            int id = root.getResources().getIdentifier(name, "id", "com.zong.customercare");
            android.view.MenuItem item = menu.findItem(id);
            if (item == null || !item.isVisible()) return false;
            item.setVisible(false);
            return true;
        }
        private void tintIcons(View view) {
            if (view.getVisibility() != View.VISIBLE) return;
            String name = ViewNames.name(view);
            int index = -1;
            if (name.equals("ivInternetImage")) index = 0;
            if (name.equals("ivVoiceImage")) index = 1;
            if (name.equals("ivSmsImage")) index = 2;
            if (name.equals("ivResourceIcon") && view.getParent() instanceof View) {
                View parent = (View) view.getParent();
                // Usage cards are generated dynamically. Assign accents in their displayed order.
                if (parent.getParent() instanceof ViewGroup)
                    index = ((ViewGroup) parent.getParent()).indexOfChild(parent) % colors.length;
                else index = 0;
            }
            if (index >= 0 && view instanceof ImageView) {
                ImageView image = (ImageView) view;
                if (image.getImageTintList() != colors[index]) image.setImageTintList(colors[index]);
            }
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                for (int i = 0; i < group.getChildCount(); i++) tintIcons(group.getChildAt(i));
            }
        }
    }
}
