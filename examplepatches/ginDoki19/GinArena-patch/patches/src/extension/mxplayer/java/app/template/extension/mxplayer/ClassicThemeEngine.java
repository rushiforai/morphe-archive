package app.template.extension.mxplayer;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.util.DisplayMetrics;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsetsController;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.widget.Toolbar;
import com.mxtech.videoplayer.ad.online.theme.ui.ThemeSkinItem;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * In-memory Classic Theme engine for MX Player (3.3.1 / 3.4.0 / 3.4.1).
 *
 * Powers all local Classic Theme swatches (16 solid Light themes + 16 split Dark Slate #1c2939
 * themes) with zero network requests, zero .mxskin downloads, and zero ad prompts while keeping
 * Row 1 (Adaptive / Light Theme / Dark Theme) 100% stock.
 */
@SuppressWarnings("unused")
public final class ClassicThemeEngine {

    private static final String SKIN_PREFIX = "external_skin_local_classic_";
    private static final String LIGHT_PREFIX = "local_classic_light_";
    private static final String DARK_PREFIX = "local_classic_dark_";

    private static final int ANDROID_STATE_CHECKED = 0x010100a0;
    private static final int ANDROID_STATE_SELECTED = 0x010100a1;
    private static final int ANDROID_STATE_PRESSED = 0x010100a7;
    private static final int ANDROID_STATE_ACTIVATED = 0x010102fe;

    private static final int FLAG_TRANSLUCENT_STATUS = 0x04000000;
    private static final int FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS = 0x80000000;
    private static final int SYSTEM_UI_FLAG_LIGHT_STATUS_BAR = 0x00002000;
    private static final int SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR = 0x00000010;

    private static final AtomicBoolean LIFECYCLE_REGISTERED = new AtomicBoolean(false);
    private static final ConcurrentHashMap<Integer, String> RES_KEY_CACHE = new ConcurrentHashMap<>(512);
    private static final ThreadLocal<Boolean> IN_RESOLVE = new ThreadLocal<Boolean>() {
        @Override
        protected Boolean initialValue() {
            return Boolean.FALSE;
        }
    };

    static volatile ThemeState currentState = ThemeState.INACTIVE;

    private static final Set<String> TOOLBAR_BG_COLOR_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__toolbar_bg",
            "mxskin__aurora_toolbar_background",
            "mxskin__activate_tv_dialog_toolbar_bg"
    ));

    private static final Set<String> TOOLBAR_FG_COLOR_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__theme_toolbar_primary_color",
            "mxskin__me_tab_toolbar_text_theme",
            "mxskin__activate_tv_dialog_toolbar_title"
    ));

    private static final Set<String> PAGE_BACKDROP_COLOR_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__f5f7fa_000000",
            "mxskin__f5f7fa_16202b",
            "mxskin__color_f5f9fe_16202b",
            "mxskin__ott_me_bg",
            "mxskin__me_tab_settings_page_theme",
            "mxskin__private_folder_background"
    ));

    private static final Set<String> SURFACE_COLOR_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__ffffff_1c2939",
            "mxskin__ffffff_000000",
            "mxskin__ffffff_16202b",
            "mxskin__ffffff_181c1f",
            "mxskin__ffffff_22282d",
            "mxskin__ffffff_26374c",
            "mxskin__ffffff_2a2a2a",
            "mxskin__f2f2f2_1c2939",
            "mxskin__f6f7f8_1c2939",
            "mxskin__fafafa_1c2939",
            "mxskin__F3F3F3_18191A",
            "mxskin__aurora_background",
            "mxskin__mx_home_tab_bg_color",
            "mxskin__ott_me_settings_bg",
            "mxskin__color_activity_background"
    ));

    private static final Set<String> CARD_COLOR_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__card_bg",
            "mxskin__search_tab_card_bg",
            "mxskin__dialog_bg",
            "mxskin__dialog_bg_color",
            "mxskin__alert_dialog_color_back_ground",
            "mxskin__transfer_home_item_bg"
    ));

    private static final Set<String> ACCENT_COLOR_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__tag_blue",
            "mxskin__text_color_selected_blue",
            "mxskin__list_selected_text_color",
            "mxskin__tab_select_text_color",
            "mxskin__tab_select_text_color2",
            "mxskin__mx_origin_bottom_indicator_title_selected_color",
            "mxskin__home_tab_indicator_color",
            "mxskin__home_tab_chiclet_selected",
            "mxskin__file_list_last_folder",
            "mxskin__create_folder_color",
            "mxskin__create_new_folder_dialog_ok",
            "mxskin__local_music_folder_color",
            "mxskin__smb_folder_color",
            "mxskin__transfer_folder",
            "mxskin__check_select_all_text_color",
            "mxskin__mx_one_theme_compat_cta_color",
            "mxskin__sleep_timer_radio_checked",
            "mxskin__choose_magic_indicator",
            "mxskin__choose_folder_path_bottom_btn",
            "mxskin__search_tab_home_hot_words_indicator_select_color",
            "mxskin__search_tab_result_indicator_select_color"
    ));

    private static final Set<String> STATEFUL_ACCENT_COLOR_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__tab_text",
            "mxskin__aurora_tab_text_color",
            "mxskin__menu_checkbox_color",
            "mxskin__radio_button",
            "mxskin__radio_text_selector",
            "mxskin__sleep_timer_switch",
            "mxskin__equalizer_switch",
            "mxskin__download_type_switch_color"
    ));

    private static final Set<String> TOOLBAR_BG_DRAWABLE_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__theme_toolbar_bg",
            "mxskin__aurora_top_head_background",
            "mxskin__aurora_top_head_home_background"
    ));

    private static final Set<String> CARD_SHAPE_DRAWABLE_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__ott_me_group_bg",
            "mxskin__mx_home_tab_bg",
            "mxskin__popup",
            "mxskin__popup_bg_corner_16dp",
            "mxskin__popup_big_radius",
            "mxskin__rate_dialog_bg",
            "mxskin__privacy_dialog_bg"
    ));

    private static final Set<String> FOLDER_SILHOUETTE_DRAWABLE_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__ic_default_folder",
            "mxskin__ic_default_folders",
            "mxskin__ic_recycle_bin_folders",
            "mxskin__list_folder_usb",
            "mxskin__share_folder"
    ));

    private static final Set<String> FOLDER_BADGE_DRAWABLE_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__ic_folder_camera",
            "mxskin__ic_folder_download",
            "mxskin__ic_folder_movies",
            "mxskin__ic_folder_mxplayer",
            "mxskin__ic_folder_screenshot",
            "mxskin__ic_folder_transfer",
            "mxskin__ic_folder_whatsapp"
    ));

    private static final Set<String> ACCENT_ICON_DRAWABLE_KEYS = new HashSet<>(Arrays.asList(
            "mxskin__tab_local",
            "mxskin__mx_tab_profile",
            "mxskin__tab_video_selected",
            "mxskin__tab_audio_selected",
            "mxskin__tab_file_selected",
            "mxskin__tab_photo_selected",
            "mxskin__tab_app_selected",
            "mxskin__ic_radio_button",
            "mxskin__ic_ok",
            "mxskin__icon_done",
            "mxskin__ic_search_accent"
    ));

    private ClassicThemeEngine() {
    }

    // =========================================================================
    // Initialization & Skin State Synchronization
    // =========================================================================

    public static void init(Object appObj, String skinName) {
        syncSkinName(skinName);
        if (appObj instanceof Application && LIFECYCLE_REGISTERED.compareAndSet(false, true)) {
            ((Application) appObj).registerActivityLifecycleCallbacks(new LifecycleHook());
        }
    }

    public static void syncSkinName(String skinName) {
        ThemeState prev = currentState;
        if (prev != null && equalsNullable(prev.skinName, skinName)) {
            return;
        }
        currentState = ThemeState.parse(skinName);
    }

    public static boolean isActive() {
        return currentState.active;
    }

    public static boolean isNotActive() {
        return !currentState.active;
    }

    public static boolean isDark() {
        return currentState.dark;
    }

    public static boolean isLocalClassicSkin(String skinName) {
        return skinName != null && skinName.startsWith(SKIN_PREFIX);
    }

    public static boolean shouldLoadExternalSkinPack(boolean isExternalResult) {
        return isExternalResult && !currentState.active;
    }

    public static String resolveBaseStrategyKey(String skinName) {
        syncSkinName(skinName);
        ThemeState state = currentState;
        if (!state.active) {
            return skinName;
        }
        return state.dark ? "black" : "white";
    }

    // =========================================================================
    // Classic Swatch ID Assignment & 1-Tap Click Application
    // =========================================================================

    public static void assignLocalClassicIds(List<?> items) {
        if (items == null) return;
        int size = items.size();
        for (int i = 0; i < size; i++) {
            Object raw = items.get(i);
            if (raw instanceof ThemeSkinItem) {
                ThemeSkinItem item = (ThemeSkinItem) raw;
                if (item.isLocalData()) {
                    String computedId = computeItemId(item.getColors(), i);
                    if (computedId != null) {
                        item.setId(computedId);
                    }
                }
            }
        }
    }

    public static String consumeLocalClassicClick(Object itemObj) {
        if (!(itemObj instanceof ThemeSkinItem)) {
            return null;
        }
        ThemeSkinItem item = (ThemeSkinItem) itemObj;
        if (!item.isLocalData()) {
            return null;
        }
        String id = item.getId();
        if (id == null || id.isEmpty()) {
            id = computeItemId(item.getColors(), 0);
            if (id == null) {
                return null;
            }
            item.setId(id);
        }
        String skinName = "external_skin_" + id + ".mxskin";
        syncSkinName(skinName);
        return skinName;
    }

    private static String computeItemId(Integer[] colors, int fallbackIdx) {
        if (colors == null || colors.length == 0 || colors[0] == null) {
            return null;
        }
        if (colors.length == 1) {
            int accent = colors[0].intValue() & 0xFFFFFF;
            return String.format(Locale.US, "%s%06x", LIGHT_PREFIX, Integer.valueOf(accent));
        }
        int accent = colors[0].intValue() & 0xFFFFFF;
        Integer second = colors[1];
        int bg = (second != null ? second.intValue() : 0x1C2939) & 0xFFFFFF;
        return String.format(Locale.US, "%s%06x_%06x", DARK_PREFIX, Integer.valueOf(bg), Integer.valueOf(accent));
    }

    // =========================================================================
    // Skin Strategy & ResourcesSkin Color / ColorStateList / Drawable Hooks
    // =========================================================================

    public static int overrideStrategyColor(Context context, int resId, int origColor) {
        ThemeState state = currentState;
        if (!state.active || context == null || resId == 0) {
            return origColor;
        }
        return overrideResColor(context.getResources(), resId, origColor);
    }

    public static ColorStateList overrideStrategyColorStateList(
            Context context,
            int resId,
            ColorStateList origList
    ) {
        ThemeState state = currentState;
        if (!state.active || context == null || resId == 0) {
            return origList;
        }
        return overrideResColorStateList(context.getResources(), resId, origList);
    }

    public static Drawable overrideStrategyDrawable(Context context, int resId, Drawable origDrawable) {
        ThemeState state = currentState;
        if (!state.active || context == null || resId == 0) {
            return origDrawable;
        }
        return overrideResDrawable(context.getResources(), resId, origDrawable);
    }

    public static int overrideResColor(Resources res, int resId, int origColor) {
        ThemeState state = currentState;
        if (!state.active || res == null || resId == 0 || Boolean.TRUE.equals(IN_RESOLVE.get())) {
            return origColor;
        }
        String key = lookupMxSkinKey(res, resId);
        if (key.isEmpty()) {
            return origColor;
        }
        Integer mapped = mapColorForKey(state, key);
        if (mapped != null) {
            return mapped.intValue();
        }
        return fallbackMxSkinColor(state, origColor);
    }

    public static ColorStateList overrideResColorStateList(
            Resources res,
            int resId,
            ColorStateList origList
    ) {
        ThemeState state = currentState;
        if (!state.active || res == null || resId == 0 || Boolean.TRUE.equals(IN_RESOLVE.get())) {
            return origList;
        }
        String key = lookupMxSkinKey(res, resId);
        if (key.isEmpty()) {
            return origList;
        }
        if (STATEFUL_ACCENT_COLOR_KEYS.contains(key)) {
            return state.statefulAccentList;
        }
        Integer single = mapColorForKey(state, key);
        if (single != null) {
            return ColorStateList.valueOf(single.intValue());
        }
        return origList;
    }

    public static Drawable overrideResDrawable(Resources res, int resId, Drawable origDrawable) {
        ThemeState state = currentState;
        if (!state.active || res == null || resId == 0 || Boolean.TRUE.equals(IN_RESOLVE.get())) {
            return origDrawable;
        }
        String key = lookupMxSkinKey(res, resId);
        if (key.isEmpty()) {
            return origDrawable;
        }

        if (TOOLBAR_BG_DRAWABLE_KEYS.contains(key)) {
            return new ColorDrawable(state.accentColor);
        }

        if ("mxskin__local_last_play_icon".equals(key)) {
            return state.getOrCreateFabDrawable(res, origDrawable);
        }

        if ("mxskin__bg_me_page".equals(key)) {
            Drawable wave = origDrawable;
            if (state.dark) {
                Drawable lightWave = loadLightCounterpart(res, resId);
                if (lightWave != null) {
                    wave = lightWave;
                }
            }
            return tintClone(res, wave, state.accentColor);
        }

        if (CARD_SHAPE_DRAWABLE_KEYS.contains(key)) {
            if (!state.dark) {
                return origDrawable;
            }
            return tintClone(res, origDrawable, state.cardColor);
        }

        if (FOLDER_SILHOUETTE_DRAWABLE_KEYS.contains(key)) {
            return tintClone(res, origDrawable, state.folderTintColor);
        }

        if (FOLDER_BADGE_DRAWABLE_KEYS.contains(key)) {
            return tintClone(res, origDrawable, state.folderBadgeColor);
        }

        if (ACCENT_ICON_DRAWABLE_KEYS.contains(key)) {
            return tintClone(res, origDrawable, state.readableAccent);
        }

        if ("mxskin__modern_switch_track_activated".equals(key)) {
            return tintClone(res, origDrawable, withAlpha(state.readableAccent, 0x90));
        }

        if ("mxskin__modern_switch_thumb_activated".equals(key)) {
            return tintClone(res, origDrawable, state.readableAccent);
        }

        if ("mxskin__ic_aurora_back".equals(key) || "mxskin__ic_aurora_close".equals(key)) {
            return tintClone(res, origDrawable, state.toolbarFgColor);
        }

        return origDrawable;
    }

    public static ColorFilter overrideToolbarIconFilter(
            Context context,
            Drawable drawable,
            ColorFilter existingFilter
    ) {
        ThemeState state = currentState;
        if (!state.active || drawable == null) {
            return null;
        }
        if (context != null && isPlayerScreen(context.getClass().getName())) {
            return null;
        }
        PorterDuffColorFilter filter = state.toolbarIconFilter;
        drawable.mutate().setColorFilter(filter);
        return filter;
    }

    private static Integer mapColorForKey(ThemeState state, String key) {
        if (TOOLBAR_BG_COLOR_KEYS.contains(key)) {
            return Integer.valueOf(state.accentColor);
        }
        if (TOOLBAR_FG_COLOR_KEYS.contains(key)) {
            return Integer.valueOf(state.toolbarFgColor);
        }
        if (ACCENT_COLOR_KEYS.contains(key) || "mxskin__color_accent".equals(key)) {
            return Integer.valueOf(state.readableAccent);
        }
        if (PAGE_BACKDROP_COLOR_KEYS.contains(key)) {
            return Integer.valueOf(state.backdropColor);
        }
        if (SURFACE_COLOR_KEYS.contains(key) || "mxskin__color_aurora_surface".equals(key)) {
            return Integer.valueOf(state.surfaceColor);
        }
        if (CARD_COLOR_KEYS.contains(key)) {
            return Integer.valueOf(state.cardColor);
        }
        if ("mxskin__bottom_tab_divider".equals(key) || "mxskin__divider".equals(key) || "mxskin__divider_line".equals(key)) {
            return Integer.valueOf(state.dividerColor);
        }
        return null;
    }

    private static int fallbackMxSkinColor(ThemeState state, int origColor) {
        int rgb = origColor & 0x00FFFFFF;
        if (rgb == 0x3C8CF0 || rgb == 0x3C5AF0 || rgb == 0x0080FF ||
                rgb == 0x0F87FF || rgb == 0x0079FB || rgb == 0x1890FF || rgb == 0x2B85E4) {
            return (origColor & 0xFF000000) | (state.readableAccent & 0x00FFFFFF);
        }
        if (state.dark && (origColor >>> 24) == 0xFF) {
            if (rgb == 0x000000 || rgb == 0x121212) {
                return state.surfaceColor;
            }
            if (rgb == 0x16202B) {
                return state.backdropColor;
            }
            if (rgb == 0x18191A || rgb == 0x222222 || rgb == 0x2A2A2A) {
                return state.cardColor;
            }
        }
        return origColor;
    }

    private static String lookupMxSkinKey(Resources res, int resId) {
        Integer boxed = Integer.valueOf(resId);
        String cached = RES_KEY_CACHE.get(boxed);
        if (cached != null) {
            return cached;
        }
        String computed = "";
        IN_RESOLVE.set(Boolean.TRUE);
        try {
            String raw = res.getResourceEntryName(resId);
            if (raw != null && raw.startsWith("mxskin")) {
                computed = normalizeMxSkinEntryName(raw);
            }
        } catch (Throwable ignored) {
            computed = "";
        } finally {
            IN_RESOLVE.set(Boolean.FALSE);
        }
        RES_KEY_CACHE.putIfAbsent(boxed, computed);
        return computed;
    }

    private static String normalizeMxSkinEntryName(String entry) {
        String s = entry;
        int resSuffix = s.indexOf("_res_0x");
        if (resSuffix > 0) {
            s = s.substring(0, resSuffix);
        }
        if (s.endsWith("__light")) {
            s = s.substring(0, s.length() - 7);
        } else if (s.endsWith("__dark")) {
            s = s.substring(0, s.length() - 6);
        } else if (s.endsWith("__black")) {
            s = s.substring(0, s.length() - 7);
        }
        return s;
    }

    private static Drawable loadLightCounterpart(Resources res, int darkResId) {
        // In MX Player's public.xml, __light is adjacent (+1 or -1) to __dark.
        IN_RESOLVE.set(Boolean.TRUE);
        try {
            int[] offsets = new int[]{1, -1};
            for (int delta : offsets) {
                int candidateId = darkResId + delta;
                try {
                    String name = res.getResourceEntryName(candidateId);
                    if (name != null && name.startsWith("mxskin__bg_me_page__light")) {
                        return res.getDrawable(candidateId, null);
                    }
                } catch (Throwable ignored) {
                }
            }
        } finally {
            IN_RESOLVE.set(Boolean.FALSE);
        }
        return null;
    }

    private static Drawable tintClone(Resources res, Drawable src, int color) {
        if (src == null) return null;
        Drawable copy = src;
        Drawable.ConstantState cs = src.getConstantState();
        if (cs != null) {
            try {
                copy = res != null ? cs.newDrawable(res) : cs.newDrawable();
            } catch (Throwable ignored) {
                copy = src;
            }
        }
        copy = copy.mutate();
        copy.setColorFilter(new PorterDuffColorFilter(color, PorterDuff.Mode.SRC_IN));
        return copy;
    }

    // =========================================================================
    // Activity Window, System Bars & Toolbar Live Styling
    // =========================================================================

    public static void styleActivity(final Activity activity) {
        final ThemeState state = currentState;
        if (!state.active || activity == null) {
            return;
        }
        if (isPlayerScreen(activity.getClass().getName())) {
            return;
        }
        applyActivityPass(activity, state);
        Window window = activity.getWindow();
        if (window != null) {
            View decor = window.getDecorView();
            if (decor != null) {
                decor.post(new Runnable() {
                    @Override
                    public void run() {
                        ThemeState latest = currentState;
                        if (latest.active) {
                            applyActivityPass(activity, latest);
                        }
                    }
                });
            }
        }
    }

    private static void applyActivityPass(Activity activity, ThemeState state) {
        try {
            Window window = activity.getWindow();
            if (window == null) return;
            View decor = window.getDecorView();
            if (decor == null) return;

            boolean foundToolbar = styleToolbarsInTree(decor, state);
            if (!foundToolbar) {
                return;
            }

            if (state.dark) {
                window.setBackgroundDrawable(new ColorDrawable(state.surfaceColor));
            }

            window.addFlags(FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.clearFlags(FLAG_TRANSLUCENT_STATUS);
            window.setStatusBarColor(state.accentColor);
            window.setNavigationBarColor(state.navBarColor);

            boolean lightStatus = state.lightToolbarBar;
            boolean lightNav = !state.dark;

            if (Build.VERSION.SDK_INT >= 30) {
                try {
                    WindowInsetsController controller = window.getInsetsController();
                    if (controller != null) {
                        int appearance = (lightStatus ? WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS : 0)
                                | (lightNav ? WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS : 0);
                        int mask = WindowInsetsController.APPEARANCE_LIGHT_STATUS_BARS
                                | WindowInsetsController.APPEARANCE_LIGHT_NAVIGATION_BARS;
                        controller.setSystemBarsAppearance(appearance, mask);
                    }
                } catch (Throwable ignored) {
                }
            }

            int vis = decor.getSystemUiVisibility();
            if (lightStatus) {
                vis |= SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            } else {
                vis &= ~SYSTEM_UI_FLAG_LIGHT_STATUS_BAR;
            }
            if (Build.VERSION.SDK_INT >= 26) {
                if (lightNav) {
                    vis |= SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                } else {
                    vis &= ~SYSTEM_UI_FLAG_LIGHT_NAVIGATION_BAR;
                }
            }
            decor.setSystemUiVisibility(vis);
        } catch (Throwable ignored) {
        }
    }

    private static boolean styleToolbarsInTree(View view, ThemeState state) {
        if (view == null) return false;
        if (view instanceof Toolbar) {
            styleSingleToolbar((Toolbar) view, state);
            return true;
        }
        boolean found = false;
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                if (styleToolbarsInTree(vg.getChildAt(i), state)) {
                    found = true;
                }
            }
        }
        return found;
    }

    private static void styleSingleToolbar(Toolbar toolbar, ThemeState state) {
        toolbar.setBackgroundColor(state.accentColor);
        toolbar.setTitleTextColor(state.toolbarFgColor);
        toolbar.setSubtitleTextColor(withAlpha(state.toolbarFgColor, 0xCC));

        Drawable nav = toolbar.getNavigationIcon();
        if (nav != null) {
            Drawable navMut = nav.mutate();
            navMut.setColorFilter(state.toolbarIconFilter);
            toolbar.setNavigationIcon(navMut);
        }

        Drawable overflow = toolbar.getOverflowIcon();
        if (overflow != null) {
            Drawable ovMut = overflow.mutate();
            ovMut.setColorFilter(state.toolbarIconFilter);
            toolbar.setOverflowIcon(ovMut);
        }

        Menu menu = toolbar.getMenu();
        if (menu != null) {
            int size = menu.size();
            for (int i = 0; i < size; i++) {
                MenuItem item = menu.getItem(i);
                if (item != null) {
                    Drawable icon = item.getIcon();
                    if (icon != null) {
                        icon.mutate().setColorFilter(state.toolbarIconFilter);
                    }
                }
            }
        }

        int childCount = toolbar.getChildCount();
        for (int i = 0; i < childCount; i++) {
            styleToolbarChild(toolbar.getChildAt(i), state);
        }
    }

    private static void styleToolbarChild(View child, ThemeState state) {
        if (child == null) return;
        if (child instanceof TextView) {
            ((TextView) child).setTextColor(state.toolbarFgColor);
            return;
        }
        if (child instanceof ImageView) {
            Drawable d = ((ImageView) child).getDrawable();
            if (d != null) {
                d.mutate().setColorFilter(state.toolbarIconFilter);
            }
            return;
        }
        if (child instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) child;
            int n = vg.getChildCount();
            for (int i = 0; i < n; i++) {
                styleToolbarChild(vg.getChildAt(i), state);
            }
        }
    }

    private static boolean isPlayerScreen(String className) {
        return className != null && (className.contains("ActivityScreen") || className.contains("PlayerActivity"));
    }

    // =========================================================================
    // Color Math & Immutable Theme Snapshot
    // =========================================================================

    private static double luminance(int color) {
        double r = ((color >>> 16) & 0xFF) / 255.0;
        double g = ((color >>> 8) & 0xFF) / 255.0;
        double b = (color & 0xFF) / 255.0;
        return 0.2126 * r + 0.7152 * g + 0.0722 * b;
    }

    private static int blend(int baseColor, int overlayColor, float ratio) {
        float inv = 1.0f - ratio;
        int r = Math.round(((baseColor >>> 16) & 0xFF) * inv + ((overlayColor >>> 16) & 0xFF) * ratio);
        int g = Math.round(((baseColor >>> 8) & 0xFF) * inv + ((overlayColor >>> 8) & 0xFF) * ratio);
        int b = Math.round((baseColor & 0xFF) * inv + (overlayColor & 0xFF) * ratio);
        return 0xFF000000
                | (clampByte(r) << 16)
                | (clampByte(g) << 8)
                | clampByte(b);
    }

    private static int withAlpha(int color, int alpha) {
        return ((alpha & 0xFF) << 24) | (color & 0xFFFFFF);
    }

    private static int clampByte(int v) {
        return v < 0 ? 0 : (v > 255 ? 255 : v);
    }

    private static boolean equalsNullable(String a, String b) {
        return a == null ? b == null : a.equals(b);
    }

    private static final class LifecycleHook implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            styleActivity(activity);
        }

        @Override
        public void onActivityStarted(Activity activity) {
            styleActivity(activity);
        }

        @Override
        public void onActivityResumed(Activity activity) {
            styleActivity(activity);
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
        }
    }

    private static final class ThemeState {
        static final ThemeState INACTIVE = new ThemeState(null, false, false, 0, 0);

        final String skinName;
        final boolean active;
        final boolean dark;
        final int accentColor;
        final int readableAccent;
        final int toolbarFgColor;
        final boolean lightToolbarBar;
        final int surfaceColor;
        final int backdropColor;
        final int cardColor;
        final int navBarColor;
        final int dividerColor;
        final int folderTintColor;
        final int folderBadgeColor;
        final PorterDuffColorFilter toolbarIconFilter;
        final ColorStateList statefulAccentList;

        private volatile Bitmap fabBitmap;
        private volatile int fabBitmapSize;

        private ThemeState(
                String skinName,
                boolean active,
                boolean dark,
                int rawSurfaceColor,
                int rawAccentColor
        ) {
            this.skinName = skinName;
            this.active = active;
            this.dark = dark;
            if (!active) {
                this.accentColor = 0;
                this.readableAccent = 0;
                this.toolbarFgColor = 0;
                this.lightToolbarBar = false;
                this.surfaceColor = 0;
                this.backdropColor = 0;
                this.cardColor = 0;
                this.navBarColor = 0;
                this.dividerColor = 0;
                this.folderTintColor = 0;
                this.folderBadgeColor = 0;
                this.toolbarIconFilter = null;
                this.statefulAccentList = null;
                return;
            }

            this.accentColor = 0xFF000000 | (rawAccentColor & 0xFFFFFF);
            double lum = luminance(this.accentColor);
            this.lightToolbarBar = lum > 0.62;
            this.toolbarFgColor = this.lightToolbarBar ? 0xFF1C2939 : 0xFFFFFFFF;
            this.toolbarIconFilter = new PorterDuffColorFilter(this.toolbarFgColor, PorterDuff.Mode.SRC_IN);

            if (dark) {
                int baseDark = 0xFF000000 | (rawSurfaceColor & 0xFFFFFF);
                this.surfaceColor = baseDark;
                this.backdropColor = blend(baseDark, 0xFF000000, 0.24f);
                this.cardColor = blend(baseDark, 0xFFFFFFFF, 0.06f);
                this.navBarColor = baseDark;
                this.dividerColor = 0x1FFFFFFF;
                this.readableAccent = lum < 0.20 ? blend(this.accentColor, 0xFFFFFFFF, 0.25f) : this.accentColor;
                this.folderTintColor = blend(baseDark, this.accentColor, 0.55f);
                this.folderBadgeColor = 0xFFFFFFFF;
            } else {
                this.surfaceColor = 0xFFFFFFFF;
                this.backdropColor = 0xFFF5F7FA;
                this.cardColor = 0xFFFFFFFF;
                this.navBarColor = 0xFFFFFFFF;
                this.dividerColor = 0x181C2939;
                if (lum > 0.80) {
                    this.readableAccent = blend(this.accentColor, 0xFF1C2939, 0.50f);
                } else if (lum > 0.65) {
                    this.readableAccent = blend(this.accentColor, 0xFF1C2939, 0.26f);
                } else {
                    this.readableAccent = this.accentColor;
                }
                this.folderTintColor = lum > 0.80
                        ? blend(0xFFFFFFFF, 0xFF8C99A8, 0.36f)
                        : blend(0xFFFFFFFF, this.accentColor, 0.34f);
                this.folderBadgeColor = blend(this.readableAccent, 0xFF1C2939, 0.35f);
            }

            int unselected = dark ? 0xFF85929C : 0xFF6B778D;
            this.statefulAccentList = new ColorStateList(
                    new int[][]{
                            new int[]{ANDROID_STATE_SELECTED},
                            new int[]{ANDROID_STATE_CHECKED},
                            new int[]{ANDROID_STATE_ACTIVATED},
                            new int[]{ANDROID_STATE_PRESSED},
                            new int[0]
                    },
                    new int[]{
                            this.readableAccent,
                            this.readableAccent,
                            this.readableAccent,
                            this.readableAccent,
                            unselected
                    }
            );
        }

        static ThemeState parse(String skinName) {
            if (skinName == null || !skinName.startsWith(SKIN_PREFIX)) {
                return new ThemeState(skinName, false, false, 0, 0);
            }
            String body = skinName.substring("external_skin_".length());
            if (body.endsWith(".mxskin")) {
                body = body.substring(0, body.length() - 7);
            }
            try {
                if (body.startsWith(LIGHT_PREFIX)) {
                    String hex = body.substring(LIGHT_PREFIX.length());
                    int accent = Integer.parseInt(hex, 16);
                    return new ThemeState(skinName, true, false, 0xFFFFFF, accent);
                }
                if (body.startsWith(DARK_PREFIX)) {
                    String rest = body.substring(DARK_PREFIX.length());
                    int sep = rest.indexOf('_');
                    if (sep > 0 && sep + 1 < rest.length()) {
                        int bg = Integer.parseInt(rest.substring(0, sep), 16);
                        int accent = Integer.parseInt(rest.substring(sep + 1), 16);
                        return new ThemeState(skinName, true, true, bg, accent);
                    }
                }
            } catch (Throwable ignored) {
            }
            return new ThemeState(skinName, false, false, 0, 0);
        }

        Drawable getOrCreateFabDrawable(Resources res, Drawable orig) {
            int size = 168;
            if (orig != null && orig.getIntrinsicWidth() > 24) {
                size = orig.getIntrinsicWidth();
            } else if (res != null) {
                DisplayMetrics dm = res.getDisplayMetrics();
                if (dm != null && dm.density > 0f) {
                    size = Math.round(84.0f * dm.density);
                }
            }
            Bitmap bmp = this.fabBitmap;
            if (bmp == null || this.fabBitmapSize != size) {
                bmp = renderFabBitmap(size, this.accentColor, this.toolbarFgColor);
                this.fabBitmap = bmp;
                this.fabBitmapSize = size;
            }
            return new BitmapDrawable(res, bmp);
        }

        private static Bitmap renderFabBitmap(int size, int circleColor, int iconColor) {
            Bitmap bmp = Bitmap.createBitmap(size, size, Bitmap.Config.ARGB_8888);
            Canvas canvas = new Canvas(bmp);
            Paint paint = new Paint(Paint.ANTI_ALIAS_FLAG);
            paint.setStyle(Paint.Style.FILL);

            float cx = size * 0.5f;
            float cy = size * 0.48f;
            float radius = size * 0.34f;

            // Soft layered drop shadow matching Material / MX FAB elevation
            paint.setColor(0x10000000);
            canvas.drawCircle(cx, cy + size * 0.045f, radius * 1.06f, paint);
            paint.setColor(0x18000000);
            canvas.drawCircle(cx, cy + size * 0.030f, radius * 1.02f, paint);
            paint.setColor(0x22000000);
            canvas.drawCircle(cx, cy + size * 0.018f, radius * 0.99f, paint);

            // Crisp themed FAB circle
            paint.setColor(circleColor);
            canvas.drawCircle(cx, cy, radius, paint);

            // Crisp centered play triangle
            paint.setColor(iconColor);
            float triHalfH = radius * 0.36f;
            float triLeft = cx - radius * 0.24f;
            float triRight = cx + radius * 0.34f;
            Path path = new Path();
            path.moveTo(triLeft, cy - triHalfH);
            path.lineTo(triRight, cy);
            path.lineTo(triLeft, cy + triHalfH);
            path.close();
            canvas.drawPath(path, paint);

            return bmp;
        }
    }
}
