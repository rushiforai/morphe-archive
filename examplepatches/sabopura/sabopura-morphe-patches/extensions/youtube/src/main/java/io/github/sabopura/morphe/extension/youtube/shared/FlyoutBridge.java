package io.github.sabopura.morphe.extension.youtube.shared;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.PopupWindow;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import io.github.sabopura.morphe.extension.youtube.ambient.AmbientLightController;
import io.github.sabopura.morphe.extension.youtube.ambient.AmbientLightSettings;
import io.github.sabopura.morphe.extension.youtube.danmaku.DanmakuController;
import io.github.sabopura.morphe.extension.youtube.danmaku.DanmakuSettings;

/**
 * Adds native YouTube rows to the player's settings flyout: one row with an on/off switch per
 * patched feature, like YouTube's own "Loop video" row. Long-pressing a row opens that
 * feature's detailed settings.
 */
@SuppressWarnings("unused")
public final class FlyoutBridge {
    private static final String TAG = "SabopuraPlayer";
    private static final String ROW_TAG_PREFIX = "sabopura_flyout_";
    private static final String LONG_PRESS_HINT_SHOWN = "flyout_long_press_hint_shown";
    static final String DANMAKU_SETTINGS_ACTION = "io.github.sabopura.morphe.action.OPEN_DANMAKU_SETTINGS_V2";
    static final String AMBIENT_SETTINGS_ACTION = "io.github.sabopura.morphe.action.OPEN_AMBIENT_LIGHT_SETTINGS";

    private static WeakReference<Dialog> dialogRef = new WeakReference<>(null);
    private static WeakReference<PopupWindow> popupRef = new WeakReference<>(null);

    private FlyoutBridge() {
    }

    public static void setBottomSheetFlyout(Dialog dialog) {
        if (dialog == null || dialog.getWindow() == null || features().isEmpty()) return;
        dialogRef = new WeakReference<>(dialog);
        try {
            View decor = dialog.getWindow().getDecorView();
            ViewTreeObserver observer = decor.getViewTreeObserver();
            observer.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
                @Override public void onGlobalLayout() {
                    try {
                        Dialog current = dialogRef.get();
                        if (current == null || !current.isShowing()) {
                            if (observer.isAlive()) observer.removeOnGlobalLayoutListener(this);
                            return;
                        }
                        if (inject(current) && observer.isAlive()) {
                            observer.removeOnGlobalLayoutListener(this);
                        }
                    } catch (Throwable throwable) {
                        Log.w(TAG, "Unable to add rows to bottom sheet", throwable);
                    }
                }
            });
        } catch (Throwable throwable) {
            Log.w(TAG, "Unable to observe bottom sheet", throwable);
        }
    }

    public static void setPopupWindowFlyout(PopupWindow popup) {
        if (popup == null || popup.getContentView() == null || features().isEmpty()) return;
        popupRef = new WeakReference<>(popup);
        popup.getContentView().post(() -> {
            try {
                inject(popup);
            } catch (Throwable throwable) {
                Log.w(TAG, "Unable to add rows to popup settings", throwable);
            }
        });
    }

    /** @return true when this flyout is finished (rows added or not a player-settings menu). */
    private static boolean inject(Object flyout) {
        LinearLayout container = findMenuContainer(flyout);
        if (container == null) return false;
        List<Feature> features = features();
        if (features.isEmpty()) return true;
        if (findByTag(container, ROW_TAG_PREFIX + features.get(0).id) != null) return true;
        if (!looksLikePlayerSettings(container)) return false;

        Context context = container.getContext();
        int first = flyout instanceof Dialog ? Math.min(1, container.getChildCount()) : 0;
        int index = first;
        for (Feature feature : features) {
            feature.initialize(context);
            View row = createRow(context, container, feature.label(), feature.icon);
            if (row == null) return true;
            row.setTag(ROW_TAG_PREFIX + feature.id);
            TextView text = findText(row);
            FlyoutSwitch toggle = addSwitch(row, text);
            if (toggle != null) {
                toggle.setChecked(feature.enabled(), false);
            } else if (text != null) {
                text.setText(feature.toggleTitle());
            }
            row.setOnClickListener(view -> {
                feature.toggle(view.getContext());
                if (toggle != null) {
                    toggle.setChecked(feature.enabled(), true);
                } else if (text != null) {
                    text.setText(feature.toggleTitle());
                }
                showLongPressHintOnce(view.getContext());
            });
            row.setOnLongClickListener(view -> {
                Context viewContext = view.getContext();
                int textColor = text != null ? text.getCurrentTextColor() : 0xFFFFFFFF;
                dismissFlyouts();
                QuickSettingsSheet.show(viewContext, feature.label(), feature::enabled,
                        () -> feature.toggle(viewContext), feature.sliders(),
                        Views.isJapanese() ? "光の見せ方" : "How the light looks",
                        feature.looks(),
                        () -> openSettings(viewContext, feature.settingsAction), textColor);
                return true;
            });
            row.setAccessibilityDelegate(new View.AccessibilityDelegate() {
                @Override public void onInitializeAccessibilityNodeInfo(
                        View host, AccessibilityNodeInfo info) {
                    super.onInitializeAccessibilityNodeInfo(host, info);
                    info.setClassName(Switch.class.getName());
                    info.setCheckable(true);
                    info.setChecked(feature.enabled());
                    info.addAction(new AccessibilityNodeInfo.AccessibilityAction(
                            AccessibilityNodeInfo.ACTION_LONG_CLICK, feature.settingsTitle()));
                }
            });
            container.addView(row, Math.min(index++, container.getChildCount()));
        }
        moveListTopGap(container, first, index);
        return true;
    }

    /**
     * YouTube's list starts with a gap meant to sit under the sheet's drag handle. With the
     * rows added above the list, the gap belongs above the first added row instead.
     */
    private static void moveListTopGap(ViewGroup container, int firstRow, int listIndex) {
        View list = childAt(container, listIndex);
        View row = childAt(container, firstRow);
        int gap = list == null ? 0 : list.getPaddingTop();
        if (gap <= 0 || row == null || !list.getClass().getName().contains("RecyclerView")
                || !(row.getLayoutParams() instanceof ViewGroup.MarginLayoutParams)) return;
        list.setPadding(list.getPaddingLeft(), 0, list.getPaddingRight(), list.getPaddingBottom());
        ((ViewGroup.MarginLayoutParams) row.getLayoutParams()).topMargin += gap;
        row.requestLayout();
    }

    /** The settings row is gone, so the first toggle tells once how to reach the settings. */
    private static void showLongPressHintOnce(Context context) {
        try {
            android.content.SharedPreferences store = SettingsStore.open(context);
            if (store.getBoolean(LONG_PRESS_HINT_SHOWN, false)) return;
            store.edit().putBoolean(LONG_PRESS_HINT_SHOWN, true).apply();
            Toast.makeText(context, Views.isJapanese() ? "長押しで設定を開けます"
                    : "Long-press for settings", Toast.LENGTH_LONG).show();
        } catch (Throwable throwable) {
            Log.w(TAG, "Unable to show the long-press hint", throwable);
        }
    }

    private static void openSettings(Context context, String action) {
        Intent intent = new Intent(action);
        intent.setPackage(context.getPackageName());
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        try {
            context.startActivity(intent);
        } catch (Throwable throwable) {
            Log.w(TAG, "Settings screen unavailable: " + action, throwable);
        }
    }

    private static List<Feature> features() {
        List<Feature> features = new ArrayList<>(2);
        if (FeatureFlags.danmaku()) features.add(Feature.DANMAKU);
        if (FeatureFlags.ambientLight()) features.add(Feature.AMBIENT);
        return features;
    }

    private static LinearLayout findMenuContainer(Object flyout) {
        if (flyout instanceof PopupWindow) {
            View content = ((PopupWindow) flyout).getContentView();
            if (content instanceof FrameLayout) {
                View first = childAt((ViewGroup) content, 0);
                if (first instanceof ViewGroup) {
                    View menu = childAt((ViewGroup) first, 0);
                    if (menu instanceof LinearLayout) return (LinearLayout) menu;
                }
            }
            return findLargestLinearLayout(content, null);
        }
        if (!(flyout instanceof Dialog)) return null;
        Window window = ((Dialog) flyout).getWindow();
        if (window == null) return null;
        View decor = window.getDecorView();
        int containerId = Views.resource(decor.getContext(), "id", "container");
        View base = containerId == 0 ? decor : decor.findViewById(containerId);
        return findLargestLinearLayout(base == null ? decor : base, null);
    }

    private static LinearLayout findLargestLinearLayout(View root, LinearLayout current) {
        if (root == null) return current;
        if (root instanceof LinearLayout && ((LinearLayout) root).getChildCount() >= 1) {
            long area = (long) root.getWidth() * root.getHeight();
            long oldArea = current == null ? -1L : (long) current.getWidth() * current.getHeight();
            if (area > oldArea) current = (LinearLayout) root;
        }
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                current = findLargestLinearLayout(group.getChildAt(i), current);
            }
        }
        return current;
    }

    /**
     * The main player menu. Its "More" page also lists loop and sleep timer, but the rows belong
     * on the first page only: in Japanese that page never matched, so the rows showed up once in
     * Japanese and twice in English.
     */
    private static boolean looksLikePlayerSettings(View root) {
        Set<String> labels = new HashSet<>();
        collectText(root, labels);
        if (!containsLabel(labels, "quality") && !containsLabel(labels, "画質")
                && !containsLabel(labels, "playback speed")
                && !containsLabel(labels, "再生速度")) return false;
        int matches = 0;
        String[] expected = {
                "quality", "playback speed", "captions", "additional settings", "loop video",
                "stable volume", "sleep timer", "lock screen",
                "画質", "再生速度", "字幕", "その他の設定", "ループ再生", "音量の安定化",
                "スリープタイマー", "画面のロック"
        };
        for (String item : expected) {
            if (containsLabel(labels, item)) matches++;
        }
        return matches >= 2;
    }

    private static boolean containsLabel(Set<String> labels, String item) {
        for (String label : labels) {
            if (label.equals(item) || label.startsWith(item + " ")) return true;
        }
        return false;
    }

    private static void collectText(View view, Set<String> result) {
        CharSequence description = view.getContentDescription();
        if (description != null) result.add(clean(description));
        if (view instanceof TextView) {
            CharSequence value = ((TextView) view).getText();
            if (value != null) result.add(clean(value));
        }
        collectRenderedText(view, result);
        if (view instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) view;
            for (int i = 0; i < group.getChildCount(); i++) collectText(group.getChildAt(i), result);
        }
    }

    private static String clean(CharSequence value) {
        return value.toString().replaceAll("\\s+", " ").trim().toLowerCase(Locale.ROOT);
    }

    /** Newer flyouts render labels through Litho ComponentHost instead of TextView. */
    private static void collectRenderedText(View view, Set<String> result) {
        try {
            Object textContent = view.getClass().getMethod("getTextContent").invoke(view);
            if (textContent == null) return;
            Object items = textContent.getClass().getMethod("getTextItems").invoke(textContent);
            if (!(items instanceof Iterable<?>)) return;
            for (Object item : (Iterable<?>) items) {
                if (item instanceof CharSequence) result.add(clean((CharSequence) item));
            }
        } catch (Throwable ignored) {
        }
    }

    private static View createRow(Context context, ViewGroup parent, String title, String iconName) {
        int layout = Views.resource(context, "layout", "modern_bottom_sheet_enableable_list_item");
        if (layout == 0) layout = Views.resource(context, "layout", "bottom_sheet_enableable_list_item");
        if (layout == 0) return null;
        View row = LayoutInflater.from(context).inflate(layout, parent, false);
        TextView text = findText(row);
        if (text != null) {
            text.setText(title);
            // YouTube's own rows are drawn in the medium weight of the same font and size.
            if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.P) {
                text.setTypeface(android.graphics.Typeface.create(text.getTypeface(), 500, false));
            }
        }

        int iconId = Views.resource(context, "id", "list_item_icon_primary");
        ImageView icon = iconId == 0 ? null : row.findViewById(iconId);
        int drawableId = 0;
        for (String candidate : (iconName + "|yt_outline_message_bubble_left_vd_theme_24")
                .split("\\|")) {
            drawableId = Views.resource(context, "drawable", candidate);
            if (drawableId != 0) break;
        }
        if (icon != null && drawableId != 0) {
            Drawable drawable = context.getDrawable(drawableId);
            icon.setImageDrawable(drawable);
            if (text != null) icon.setImageTintList(ColorStateList.valueOf(text.getCurrentTextColor()));
        }
        TypedArray attributes = context.obtainStyledAttributes(
                new int[]{android.R.attr.selectableItemBackground});
        try {
            row.setForeground(attributes.getDrawable(0));
        } finally {
            attributes.recycle();
        }
        return row;
    }

    /** Puts a switch where the row shows its chevron or detail text; null if there is no slot. */
    private static FlyoutSwitch addSwitch(View row, TextView text) {
        int secondaryId = Views.resource(row.getContext(), "id", "list_item_secondary_container");
        View secondary = secondaryId == 0 ? null : row.findViewById(secondaryId);
        if (!(secondary instanceof ViewGroup)) return null;
        ViewGroup slot = (ViewGroup) secondary;
        for (int i = 0; i < slot.getChildCount(); i++) slot.getChildAt(i).setVisibility(View.GONE);
        FlyoutSwitch toggle = new FlyoutSwitch(row.getContext());
        if (text != null) toggle.setTextColor(text.getCurrentTextColor());
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT,
                android.view.Gravity.CENTER_VERTICAL);
        // YouTube's own switches end 5 dp further in than this layout's chevron slot.
        params.setMarginEnd(Math.round(5 * row.getResources().getDisplayMetrics().density));
        slot.addView(toggle, params);
        slot.setVisibility(View.VISIBLE);
        return toggle;
    }

    private static TextView findText(View row) {
        int textId = Views.resource(row.getContext(), "id", "list_item_text");
        View text = textId == 0 ? null : row.findViewById(textId);
        return text instanceof TextView ? (TextView) text : null;
    }

    private static View findByTag(View root, String tag) {
        if (tag.equals(root.getTag())) return root;
        if (root instanceof ViewGroup) {
            ViewGroup group = (ViewGroup) root;
            for (int i = 0; i < group.getChildCount(); i++) {
                View result = findByTag(group.getChildAt(i), tag);
                if (result != null) return result;
            }
        }
        return null;
    }

    private static View childAt(ViewGroup group, int index) {
        return index >= 0 && index < group.getChildCount() ? group.getChildAt(index) : null;
    }

    private static void dismissFlyouts() {
        Dialog dialog = dialogRef.get();
        if (dialog != null) dialog.dismiss();
        PopupWindow popup = popupRef.get();
        if (popup != null) popup.dismiss();
    }

    private enum Feature {
        DANMAKU("danmaku", DANMAKU_SETTINGS_ACTION, "yt_outline_message_bubble_left_vd_theme_24"),
        AMBIENT("ambient", AMBIENT_SETTINGS_ACTION,
                "yt_outline_experimental_ambient_mode_vd_theme_24|yt_outline_brightness_vd_theme_24");

        final String id;
        final String settingsAction;
        final String icon;

        Feature(String id, String settingsAction, String icon) {
            this.id = id;
            this.settingsAction = settingsAction;
            this.icon = icon;
        }

        void initialize(Context context) {
            if (this == DANMAKU) DanmakuSettings.initialize(context);
            else AmbientLightSettings.initialize(context);
        }

        boolean enabled() {
            return this == DANMAKU ? DanmakuSettings.isMasterEnabled()
                    : AmbientLightSettings.isEnabled();
        }

        void toggle(Context context) {
            if (this == DANMAKU) DanmakuSettings.toggleMaster(context);
            else AmbientLightSettings.toggleEnabled(context);
        }

        String label() {
            boolean japanese = Views.isJapanese();
            if (this == DANMAKU) return japanese ? "弾幕" : "Danmaku";
            return japanese ? "アンビエントライト" : "Ambient light";
        }

        String toggleTitle() {
            boolean japanese = Views.isJapanese();
            boolean on = enabled();
            String state = japanese ? (on ? "オン" : "オフ") : (on ? "On" : "Off");
            return label() + (japanese ? "：" : ": ") + state;
        }

        String settingsTitle() {
            return Views.isJapanese() ? label() + "の設定" : label() + " settings";
        }

        /** The effects switchable from the long-press sheet while watching. */
        java.util.List<QuickSettingsSheet.Toggle> looks() {
            if (this == DANMAKU) return java.util.Collections.emptyList();
            return java.util.Arrays.asList(
                    new QuickSettingsSheet.Toggle(AmbientLightSettings.PICTURE_BACKDROP,
                            "背景に動画の映像を映す", "Show the video behind the page", false),
                    new QuickSettingsSheet.Toggle(AmbientLightSettings.FALLOFF,
                            "画面の下に行くほど暗くする", "Darker towards the bottom", false),
                    new QuickSettingsSheet.Toggle(AmbientLightSettings.SCENE_WAVE,
                            "場面が変わったら光を広げる", "Spread the light on scene changes",
                            false),
                    new QuickSettingsSheet.Toggle(AmbientLightSettings.BREATHE,
                            "一時停止中は光をゆっくり明滅", "Pulse slowly while paused", true));
        }

        /** The values the long-press sheet offers, the same lists as the settings screen. */
        java.util.List<QuickSettingsSheet.Slider> sliders() {
            boolean japanese = Views.isJapanese();
            int[] percents = {20, 35, 50, 65, 75, 90, 100};
            if (this == DANMAKU) {
                return java.util.Arrays.asList(
                        new QuickSettingsSheet.Slider("danmaku_font_size", "文字サイズ", "Text size",
                                new int[]{12, 16, 20, 22, 24, 28, 32, 40, 48},
                                DanmakuController.configFontSizeSp(), " sp"),
                        new QuickSettingsSheet.Slider("danmaku_opacity", "不透明度", "Opacity",
                                percents, DanmakuController.configOpacityPercent(), "%"),
                        new QuickSettingsSheet.Slider("danmaku_duration", "画面を横切る時間",
                                "Scroll duration", new int[]{3, 5, 8, 10, 12, 15, 20},
                                DanmakuController.configTravelDurationSeconds(),
                                japanese ? "秒" : " s"),
                        new QuickSettingsSheet.Slider("danmaku_coverage", "縦方向の表示範囲",
                                "Vertical coverage", percents,
                                DanmakuController.configLaneCoveragePercent(), "%"));
            }
            return java.util.Arrays.asList(
                    new QuickSettingsSheet.Slider("ambient_brightness", "明るさ", "Brightness",
                            new int[]{50, 70, 85, 100, 115, 130, 150, 175, 200},
                            AmbientLightController.configBrightnessPercent(), "%"),
                    new QuickSettingsSheet.Slider("ambient_saturation", "彩度", "Colour saturation",
                            new int[]{0, 50, 80, 100, 120, 140, 160, 200, 250},
                            AmbientLightController.configSaturationPercent(), "%"),
                    new QuickSettingsSheet.Slider("ambient_smoothing", "なめらかさ（ちらつき軽減）",
                            "Smoothing (flicker reduction)", new int[]{0, 25, 50, 70, 85}, 50, "",
                            japanese ? new String[]{"オフ", "弱", "中", "強", "最大"}
                                    : new String[]{"Off", "Low", "Medium", "High", "Maximum"}));
        }
    }
}
