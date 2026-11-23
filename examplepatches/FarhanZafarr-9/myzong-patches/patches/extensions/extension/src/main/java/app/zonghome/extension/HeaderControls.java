package app.zonghome.extension;

import android.content.res.ColorStateList;
import android.graphics.Color;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageButton;
import android.widget.TextView;
import java.lang.ref.WeakReference;

final class HeaderControls {
    private WeakReference<ImageButton> controlsReference = new WeakReference<>(null);
    private WeakReference<ImageButton> bundlesReference = new WeakReference<>(null);
    private WeakReference<ImageButton> loanReference = new WeakReference<>(null);
    private WeakReference<ImageButton> rewardsReference = new WeakReference<>(null);
    private WeakReference<TextView> titleReference = new WeakReference<>(null);
    private int originalEndPadding;
    private boolean replacedHomeTitle;

    private static View find(View root, String name) { return ViewNames.find(root, name); }
    private static int dp(View view, int value) {
        return Math.round(value * view.getResources().getDisplayMetrics().density);
    }
    boolean apply(View root, boolean home, boolean bundles, String hidden, ColorStateList accent) {
        boolean changed = false;
        View search = find(root, "ivSearchRoot");
        if (search != null && hidden.contains("|Search|")) {
            int visibility = bundles ? View.VISIBLE : View.GONE;
            if (search.getVisibility() != visibility) { search.setVisibility(visibility); changed = true; }
        }
        View titleView = find(root, "tvTitle");
        TextView title = titleView instanceof TextView ? (TextView)titleView : null;
        boolean hideGreeting = hidden.contains("|Greeting|");
        boolean showHome = home && hideGreeting && NavigationStyle.homeTitle();
        if (title != null) {
            if (title != titleReference.get()) { titleReference = new WeakReference<>(title); originalEndPadding = title.getPaddingEnd(); }
            int visibility = home && hideGreeting && !showHome ? View.GONE : View.VISIBLE;
            if (title.getVisibility() != visibility) { title.setVisibility(visibility); changed = true; }
            if (showHome) {
                if (!"Home".contentEquals(title.getText())) title.setText("Home");
                replacedHomeTitle = true;
            } else if (!home && replacedHomeTitle) {
                View navigation = find(root, "bottomNav");
                if (navigation != null && "Home".contentEquals(title.getText())) {
                    try {
                        android.view.Menu menu = (android.view.Menu)navigation.getClass().getMethod("getMenu").invoke(navigation);
                        int selected = ((Number)navigation.getClass().getMethod("getSelectedItemId").invoke(navigation)).intValue();
                        android.view.MenuItem item = menu.findItem(selected);
                        if (item != null) title.setText(item.getTitle());
                    } catch (ReflectiveOperationException ignored) { }
                }
                replacedHomeTitle = false;
            }
            if (NavigationStyle.leftTitles()) {
                int gravity = Gravity.START | Gravity.CENTER_VERTICAL;
                if (title.getGravity() != gravity) title.setGravity(gravity);
                if (title.getTextAlignment() != View.TEXT_ALIGNMENT_VIEW_START) title.setTextAlignment(View.TEXT_ALIGNMENT_VIEW_START);
                int padding = dp(title, 16);
                if (title.getPaddingStart() != padding)
                    title.setPaddingRelative(padding, title.getPaddingTop(), title.getPaddingEnd(), title.getPaddingBottom());
            }
        }
        boolean showBundles = home && NavigationStyle.bundlesShortcut() &&
            (NavigationStyle.hideBundles() || NavigationStyle.hideNavigation());
        boolean showRewards = home && NavigationStyle.freeMbsShortcut();
        boolean showLoan = home && NavigationStyle.loanShortcut();
        boolean showControls = bundles && NavigationStyle.bundleControlsToggle();
        if (showControls) changed |= BundleControls.apply(root);
        View toolbar = find(root, "layoutToolbar");
        ImageButton bundlesButton = bundlesReference.get();
        ImageButton rewardsButton = rewardsReference.get();
        ImageButton loanButton = loanReference.get();
        ImageButton controlsButton = controlsReference.get();
        if (toolbar instanceof ViewGroup) {
            if (showBundles && bundlesButton == null) {
                bundlesButton = createButton(root, (ViewGroup)toolbar, "bundle_icons", "Bundles", true);
                bundlesReference = new WeakReference<>(bundlesButton);
                changed = true;
            }
            if (showRewards && rewardsButton == null) {
                rewardsButton = createButton(root, (ViewGroup)toolbar, "ic_daily_reward", "Free MBs", false);
                rewardsReference = new WeakReference<>(rewardsButton);
                changed = true;
            }
        }
        if (showLoan && loanButton == null && toolbar instanceof ViewGroup) {
            loanButton = createButton(root, (ViewGroup)toolbar, "ic_loan", "Loan", false);
            loanReference = new WeakReference<>(loanButton);
            changed = true;
        }
        if (showControls && controlsButton == null && toolbar instanceof ViewGroup) {
            controlsButton = createButton(root, (ViewGroup)toolbar, "ic_filter", "Hide bundle controls", false);
            controlsReference = new WeakReference<>(controlsButton);
            changed = true;
        }
        int slot = 0;
        for (String name : new String[]{"btnHamBurger", "btnRefresh", "ivSearchRoot"}) {
            View nativeButton = find(root, name);
            if (nativeButton != null && nativeButton.getVisibility() == View.VISIBLE) slot++;
        }
        changed |= positionButton(bundlesButton, toolbar, showBundles, slot, accent);
        if (showBundles) slot++;
        changed |= positionButton(rewardsButton, toolbar, showRewards, slot, accent);
        if (showRewards) slot++;
        changed |= positionButton(loanButton, toolbar, showLoan, slot, accent);
        if (showLoan && loanButton != null) {
            View nativeLoan = find(root, "btnLoan");
            if (nativeLoan instanceof TextView) loanButton.setContentDescription(((TextView)nativeLoan).getText());
        }
        if (showLoan) slot++;
        changed |= positionButton(controlsButton, toolbar, showControls, slot, accent);
        if (showControls && controlsButton != null) {
            boolean collapsed = BundleControls.hidden(root);
            if (controlsButton.isSelected() != collapsed) controlsButton.setSelected(collapsed);
            String label = collapsed ? "Show bundle controls" : "Hide bundle controls";
            if (!label.contentEquals(controlsButton.getContentDescription())) controlsButton.setContentDescription(label);
        }
        if (title != null) {
            int count = (showBundles ? 1 : 0) + (showRewards ? 1 : 0) + (showLoan ? 1 : 0) + (showControls ? 1 : 0);
            int end = originalEndPadding + dp(root, count * 48);
            if (title.getPaddingEnd() != end)
                title.setPaddingRelative(title.getPaddingStart(), title.getPaddingTop(), end, title.getPaddingBottom());
        }
        return changed;
    }
    private static ImageButton createButton(View root, ViewGroup toolbar, String iconName, String label, boolean bundles) {
        ImageButton button = new ImageButton(root.getContext());
        button.setId(View.generateViewId());
        int icon = root.getResources().getIdentifier(iconName, "drawable", "com.zong.customercare");
        if (icon != 0) {
            android.graphics.drawable.Drawable drawable=root.getResources().getDrawable(icon,root.getContext().getTheme());
            button.setImageDrawable((bundles || iconName.equals("ic_filter"))?SizedIcon.wrap(drawable,dp(root,20)):
                SizedIcon.bold(drawable,dp(root,16),root.getResources().getDisplayMetrics().density*0.3f));
        }
        button.setContentDescription(label);
        button.setScaleType(android.widget.ImageView.ScaleType.CENTER_INSIDE);
        int padding = dp(root, 12);
        button.setPadding(padding, padding, padding, padding);
        button.setBackgroundColor(Color.TRANSPARENT);
        TypedValue background = new TypedValue();
        if (root.getContext().getTheme().resolveAttribute(android.R.attr.selectableItemBackgroundBorderless, background, true)
                && background.resourceId != 0) button.setBackgroundResource(background.resourceId);
        button.setOnClickListener(clicked -> {
            if (iconName.equals("ic_filter")) {
                BundleControls.toggle(root);
                boolean collapsed = BundleControls.hidden(root);
                button.setSelected(collapsed);
                button.setContentDescription(collapsed ? "Show bundle controls" : "Hide bundle controls");
            } else if (iconName.equals("ic_loan")) {
                View nativeLoan = find(root, "btnLoan");
                if (nativeLoan != null) nativeLoan.performClick();
            } else if (bundles) {
                View navigation = find(root, "bottomNav");
                if (navigation == null) return;
                int destination = root.getResources().getIdentifier("navigation", "id", "com.zong.customercare");
                try { navigation.getClass().getMethod("setSelectedItemId", int.class).invoke(navigation, destination); }
                catch (ReflectiveOperationException ignored) { }
            } else {
                View host = find(root, "navigationHostFragment");
                if (host == null) return;
                int destination = root.getResources().getIdentifier("fragDailyRewards", "id", "com.zong.customercare");
                try {
                    Object controller = Class.forName("androidx.navigation.Navigation")
                        .getMethod("findNavController", View.class).invoke(null, host);
                    controller.getClass().getMethod("navigate", int.class).invoke(controller, destination);
                } catch (ReflectiveOperationException ignored) { }
            }
        });
        toolbar.addView(button, new ViewGroup.LayoutParams(dp(root, 48), ViewGroup.LayoutParams.MATCH_PARENT));
        return button;
    }
    private static boolean positionButton(ImageButton button, View toolbar, boolean show, int slot, ColorStateList accent) {
        if (button == null) return false;
        int visibility = show ? View.VISIBLE : View.GONE;
        boolean changed = button.getVisibility() != visibility;
        if (changed) button.setVisibility(visibility);
        if (show && toolbar != null) {
            button.setX(Math.max(0, toolbar.getWidth() - dp(toolbar, 56 + slot * 48)));
            button.setY(0);
            if (button.getImageTintList() != accent) button.setImageTintList(accent);
        }
        return changed;
    }
}
