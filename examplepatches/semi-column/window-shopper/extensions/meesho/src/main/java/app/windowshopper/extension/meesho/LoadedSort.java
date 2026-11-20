package app.windowshopper.extension.meesho;

import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.Typeface;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.lang.reflect.Field;
import java.util.List;

public final class LoadedSort {
    private static final String TAG = "WindowShopper";
    private static final String BUTTON_TAG = "window-shopper-sort-loaded";

    private LoadedSort() {}

    public static void show(Object fragment) {
        if (!Settings.enabled(Settings.Feature.FLOATING_SORT)) return;
        try {
            Activity activity = activity(fragment);
            if (activity == null) return;
            ViewGroup content = activity.findViewById(android.R.id.content);
            if (!(content instanceof FrameLayout)) {
                throw new IllegalStateException("Search activity has no FrameLayout content");
            }
            if (content.findViewWithTag(BUTTON_TAG) != null) return;
            SortControl button = new SortControl(activity);
            button.setElevation(SettingsUi.dp(activity, 6));
            button.setContentDescription("Sort loaded results by rating count");
            button.setTag(BUTTON_TAG);
            button.setOnClickListener(view -> sort(fragment, activity));
            FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, SettingsUi.dp(activity, 48),
                Gravity.BOTTOM | Gravity.END);
            params.setMargins(0, 0, SettingsUi.dp(activity, 16), SettingsUi.dp(activity, 16));
            content.addView(button, params);
        } catch (ReflectiveOperationException | IllegalStateException error) {
            Log.e(TAG, "Cannot show loaded-results sort button", error);
        }
    }

    public static void hide(Object fragment) {
        try {
            Activity activity = activity(fragment);
            if (activity == null) return;
            ViewGroup content = activity.findViewById(android.R.id.content);
            View button = content == null ? null : content.findViewWithTag(BUTTON_TAG);
            if (button != null) content.removeView(button);
        } catch (ReflectiveOperationException error) {
            Log.e(TAG, "Cannot remove loaded-results sort button", error);
        }
    }

    private static Activity activity(Object host) throws ReflectiveOperationException {
        if (host instanceof Activity) return (Activity) host;
        return (Activity) host.getClass().getMethod("getActivity").invoke(host);
    }

    // Category pages keep their cards in obfuscated fields, so find the largest card list nearby.
    private static List<?> cardList(Object root, Class<?> card) throws IllegalAccessException {
        List<?> best = null;
        java.util.ArrayDeque<Object[]> queue = new java.util.ArrayDeque<>();
        java.util.Set<Object> seen = java.util.Collections.newSetFromMap(new java.util.IdentityHashMap<>());
        queue.add(new Object[] {root, 0});
        while (!queue.isEmpty()) {
            Object[] next = queue.poll();
            Object value = next[0];
            int depth = (int) next[1];
            if (value == null || !seen.add(value)) continue;
            if (value instanceof List) {
                List<?> list = (List<?>) value;
                if ((best == null || list.size() > best.size())
                        && list.stream().anyMatch(card::isInstance)) best = list;
                continue;
            }
            String name = value.getClass().getName();
            if (depth >= 3 || value.getClass().isArray() || name.startsWith("java.") || name.startsWith("android.")
                    || name.startsWith("kotlin.") || value instanceof View) continue;
            for (Class<?> type = value.getClass(); type != null && type != Object.class
                    && !type.getName().startsWith("android."); type = type.getSuperclass()) {
                for (Field field : type.getDeclaredFields()) {
                    if (field.getType().isPrimitive() || java.lang.reflect.Modifier.isStatic(field.getModifiers())) continue;
                    try {
                        field.setAccessible(true);
                        queue.add(new Object[] {field.get(value), depth + 1});
                    } catch (RuntimeException ignored) {
                        // Inaccessible framework field; skip it.
                    }
                }
            }
        }
        return best;
    }

    private static final class SortControl extends LinearLayout {
        private final Runnable collapse;
        private ValueAnimator animator;

        SortControl(Activity activity) {
            super(activity);
            int diameter = SettingsUi.dp(activity, 48);
            int iconSize = SettingsUi.dp(activity, 22);
            int padding = SettingsUi.dp(activity, 18);
            int gap = SettingsUi.dp(activity, 8);
            setGravity(Gravity.CENTER);
            setMinimumWidth(diameter);
            setPadding(padding, 0, padding, 0);
            setBackground(SettingsUi.buttonBackground(activity, true));
            setFocusable(true);
            ImageView icon = new ImageView(activity);
            icon.setImageDrawable(new SettingsUi.SortIcon());
            addView(icon, new LinearLayout.LayoutParams(iconSize, iconSize));
            TextView label = new TextView(activity);
            label.setText("Sort loaded");
            label.setTextSize(14);
            label.setTextColor(Color.WHITE);
            label.setTypeface(Typeface.create("sans-serif-medium", Typeface.NORMAL));
            label.setSingleLine(true);
            label.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_NO);
            LinearLayout.LayoutParams labelParams = new LinearLayout.LayoutParams(-2, -2);
            labelParams.setMarginStart(gap);
            addView(label, labelParams);
            collapse = () -> {
                int labelWidth = label.getWidth();
                int endPadding = (diameter - iconSize) / 2;
                animator = ValueAnimator.ofFloat(0, 1);
                animator.setDuration(240);
                animator.addUpdateListener(animation -> {
                    float remaining = 1 - animation.getAnimatedFraction();
                    labelParams.width = Math.round(labelWidth * remaining);
                    labelParams.setMarginStart(Math.round(gap * remaining));
                    label.setLayoutParams(labelParams);
                    label.setAlpha(remaining);
                    int side = endPadding + Math.round((padding - endPadding) * remaining);
                    setPadding(side, 0, side, 0);
                });
                animator.start();
            };
        }

        @Override public CharSequence getAccessibilityClassName() { return Button.class.getName(); }

        @Override protected void onAttachedToWindow() {
            super.onAttachedToWindow();
            postDelayed(collapse, 1000);
        }

        @Override protected void onDetachedFromWindow() {
            removeCallbacks(collapse);
            if (animator != null) animator.cancel();
            super.onDetachedFromWindow();
        }
    }

    private static void sort(Object fragment, Activity activity) {
        try {
            String version = activity.getPackageManager()
                .getPackageInfo(activity.getPackageName(), 0).versionName;
            boolean older = "29.9".equals(version);
            if (!older && !"30.0".equals(version)) {
                throw new IllegalStateException("Unsupported Meesho version");
            }
            Class<?> home = Class.forName("com.meesho.supply.home.HomeFragment");
            Class<?> card = Class.forName(older ? "z6e" : "tx.p0");
            Class<?> catalog = Class.forName("com.meesho.discovery.api.catalog.model.Catalog");
            Class<?> summary = Class.forName("com.meesho.discovery.api.product.model.ReviewSummary");
            Object value = fragment instanceof Activity ? cardList(fragment, card)
                : home.getField(older ? "r0" : "q0").get(fragment);
            if (!(value instanceof List)) throw new IllegalStateException("Search list unavailable");
            Field catalogField = card.getField("a");
            int count = LoadedSortCore.sort((List<?>) value, card, catalogField,
                catalog.getField(older ? "x0" : "w0"), summary.getField("c"), summary.getField("j"));
            if (count == 0) {
                Toast.makeText(activity, "No loaded products to sort", Toast.LENGTH_SHORT).show();
                return;
            }
            Log.i(TAG, "Sorted loaded product count: " + count);
            try {
                Object recycler;
                if (fragment instanceof Activity) {
                    recycler = activity.findViewById(activity.getResources()
                        .getIdentifier("catalog_recycler_view", "id", activity.getPackageName()));
                } else {
                    Object binding = home.getField(older ? "o0" : "n0").get(fragment);
                    if (binding == null) throw new IllegalStateException("Search binding unavailable");
                    recycler = binding.getClass().getField("c").get(binding);
                }
                if (recycler == null) throw new IllegalStateException("Search list view unavailable");
                recycler.getClass().getMethod(older ? "r0" : "s0", int.class).invoke(recycler, 0);
                Toast.makeText(activity, "Sorted " + count + " loaded products", Toast.LENGTH_SHORT).show();
            } catch (ReflectiveOperationException | IllegalStateException error) {
                Log.e(TAG, "Sorted results but could not scroll to the top", error);
                Toast.makeText(activity, "Sorted; scroll to the top manually", Toast.LENGTH_LONG).show();
            }
        } catch (ReflectiveOperationException | PackageManager.NameNotFoundException
                | IllegalStateException error) {
            Log.e(TAG, "Cannot sort loaded search results", error);
            Toast.makeText(activity, "Could not sort loaded results", Toast.LENGTH_LONG).show();
        }
    }
}
