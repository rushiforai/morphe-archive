package app.template.extension.mxplayer;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Configuration;
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
import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicLongArray;

/**
 * Zero-allocation, zero-jitter in-memory Classic Theme engine for MX Player 3.4.1.
 *
 * Powers all 32 local Classic Theme swatches (16 solid Light themes + 16 split Dark Slate #1c2939
 * themes) in 1 tap with zero network requests, zero .mxskin downloads, zero per-frame boxing/GC
 * churn during RecyclerView scrolling, and zero transition-frame layout jitter while keeping
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

    // Resource role IDs cached in Lock-Free RES_ROLE_CACHE (0 = uncached)
    private static final int ROLE_NON_MXSKIN = 1;
    private static final int ROLE_COLOR_TOOLBAR_BG = 2;
    private static final int ROLE_COLOR_TOOLBAR_FG = 3;
    private static final int ROLE_COLOR_ACCENT = 4;
    private static final int ROLE_COLOR_BACKDROP = 5;
    private static final int ROLE_COLOR_SURFACE = 6;
    private static final int ROLE_COLOR_CARD = 7;
    private static final int ROLE_COLOR_DIVIDER = 8;
    private static final int ROLE_CSL_STATEFUL_ACCENT = 9;
    private static final int ROLE_DRAWABLE_TOOLBAR_BG = 10;
    private static final int ROLE_DRAWABLE_FAB = 11;
    private static final int ROLE_DRAWABLE_ME_WAVE = 12;
    private static final int ROLE_DRAWABLE_CARD_SHAPE = 13;
    private static final int ROLE_DRAWABLE_FOLDER_SILHOUETTE = 14;
    private static final int ROLE_DRAWABLE_FOLDER_BADGE = 15;
    private static final int ROLE_DRAWABLE_ACCENT_ICON = 16;
    private static final int ROLE_DRAWABLE_SWITCH_TRACK = 17;
    private static final int ROLE_DRAWABLE_SWITCH_THUMB = 18;
    private static final int ROLE_DRAWABLE_AURORA_NAV = 19;
    private static final int ROLE_MXSKIN_OTHER = 20;

    private static final int ROLE_CACHE_SIZE = 4096;
    private static final int ROLE_CACHE_MASK = ROLE_CACHE_SIZE - 1;
    private static final int ROLE_PROBE_LIMIT = 12;

    /**
     * Lock-free open-addressed primitive cache: upper 32 bits = resId, lower 32 bits = role (1..20).
     * Eliminates Integer.valueOf boxing, ThreadLocal lookups, and HashSet<String> scans on hot paths.
     */
    private static final AtomicLongArray RES_ROLE_CACHE = new AtomicLongArray(ROLE_CACHE_SIZE);

    private static final AtomicBoolean LIFECYCLE_REGISTERED = new AtomicBoolean(false);
    private static final ThreadLocal<Boolean> IN_RESOLVE = new ThreadLocal<Boolean>() {
        @Override
        protected Boolean initialValue() {
            return Boolean.FALSE;
        }
    };

    // UI-thread-only per-DecorView styling state to prevent redundant window invalidations & post storms.
    private static final WeakHashMap<View, DecorStamp> DECOR_STAMPS = new WeakHashMap<>();
    private static final ConcurrentHashMap<Class<?>, Field> RES_WRAPPER_FIELD_CACHE = new ConcurrentHashMap<>(4);
    private static volatile WeakReference<Activity> resumedActivityRef = new WeakReference<>(null);
    private static volatile Resources rawBaseResources = null;
    private static volatile int cachedLightWaveSourceId = 0;
    private static volatile int cachedLightWaveTargetId = 0;

    static volatile ThemeState currentState = ThemeState.INACTIVE;

    private static final Map<String, Integer> KEY_TO_ROLE = buildKeyRoleMap();

    private static Map<String, Integer> buildKeyRoleMap() {
        Map<String, Integer> m = new HashMap<>(160);

        putRoles(m, ROLE_COLOR_TOOLBAR_BG,
                "mxskin__toolbar_bg",
                "mxskin__aurora_toolbar_background",
                "mxskin__activate_tv_dialog_toolbar_bg"
        );

        putRoles(m, ROLE_COLOR_TOOLBAR_FG,
                "mxskin__theme_toolbar_primary_color",
                "mxskin__me_tab_toolbar_text_theme",
                "mxskin__activate_tv_dialog_toolbar_title"
        );

        putRoles(m, ROLE_COLOR_BACKDROP,
                "mxskin__f5f7fa_000000",
                "mxskin__f5f7fa_16202b",
                "mxskin__color_f5f9fe_16202b",
                "mxskin__ott_me_bg",
                "mxskin__me_tab_settings_page_theme",
                "mxskin__private_folder_background"
        );

        putRoles(m, ROLE_COLOR_SURFACE,
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
                "mxskin__color_activity_background",
                "mxskin__color_aurora_surface"
        );

        putRoles(m, ROLE_COLOR_CARD,
                "mxskin__card_bg",
                "mxskin__search_tab_card_bg",
                "mxskin__dialog_bg",
                "mxskin__dialog_bg_color",
                "mxskin__alert_dialog_color_back_ground",
                "mxskin__transfer_home_item_bg"
        );

        putRoles(m, ROLE_COLOR_ACCENT,
                "mxskin__color_accent",
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
        );

        putRoles(m, ROLE_COLOR_DIVIDER,
                "mxskin__bottom_tab_divider",
                "mxskin__divider",
                "mxskin__divider_line"
        );

        putRoles(m, ROLE_CSL_STATEFUL_ACCENT,
                "mxskin__tab_text",
                "mxskin__aurora_tab_text_color",
                "mxskin__menu_checkbox_color",
                "mxskin__radio_button",
                "mxskin__radio_text_selector",
                "mxskin__sleep_timer_switch",
                "mxskin__equalizer_switch",
                "mxskin__download_type_switch_color"
        );

        putRoles(m, ROLE_DRAWABLE_TOOLBAR_BG,
                "mxskin__theme_toolbar_bg",
                "mxskin__aurora_top_head_background",
                "mxskin__aurora_top_head_home_background"
        );

        putRoles(m, ROLE_DRAWABLE_FAB, "mxskin__local_last_play_icon");
        putRoles(m, ROLE_DRAWABLE_ME_WAVE, "mxskin__bg_me_page");

        putRoles(m, ROLE_DRAWABLE_CARD_SHAPE,
                "mxskin__ott_me_group_bg",
                "mxskin__mx_home_tab_bg",
                "mxskin__popup",
                "mxskin__popup_bg_corner_16dp",
                "mxskin__popup_big_radius",
                "mxskin__rate_dialog_bg",
                "mxskin__privacy_dialog_bg"
        );

        putRoles(m, ROLE_DRAWABLE_FOLDER_SILHOUETTE,
                "mxskin__ic_default_folder",
                "mxskin__ic_default_folders",
                "mxskin__ic_recycle_bin_folders",
                "mxskin__list_folder_usb",
                "mxskin__share_folder"
        );

        putRoles(m, ROLE_DRAWABLE_FOLDER_BADGE,
                "mxskin__ic_folder_camera",
                "mxskin__ic_folder_download",
                "mxskin__ic_folder_movies",
                "mxskin__ic_folder_mxplayer",
                "mxskin__ic_folder_screenshot",
                "mxskin__ic_folder_transfer",
                "mxskin__ic_folder_whatsapp"
        );

        putRoles(m, ROLE_DRAWABLE_ACCENT_ICON,
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
        );

        putRoles(m, ROLE_DRAWABLE_SWITCH_TRACK, "mxskin__modern_switch_track_activated");
        putRoles(m, ROLE_DRAWABLE_SWITCH_THUMB, "mxskin__modern_switch_thumb_activated");
        putRoles(m, ROLE_DRAWABLE_AURORA_NAV, "mxskin__ic_aurora_back", "mxskin__ic_aurora_close");

        return m;
    }

    private static void putRoles(Map<String, Integer> map, int role, String... keys) {
        Integer boxed = Integer.valueOf(role);
        for (String k : keys) {
            map.put(k, boxed);
        }
    }

    private ClassicThemeEngine() {
    }

    // =========================================================================
    // Initialization & Skin State Synchronization
    // =========================================================================

    public static void init(Object appObj, String skinName) {
        if (appObj instanceof Application) {
            Application app = (Application) appObj;
            try {
                Context base = app.getBaseContext();
                if (base != null) {
                    Resources baseRes = base.getResources();
                    if (baseRes != null) {
                        rawBaseResources = unwrapBaseResources(baseRes);
                    }
                }
            } catch (Throwable ignored) {
            }
            syncSkinName(skinName);
            if (LIFECYCLE_REGISTERED.compareAndSet(false, true)) {
                app.registerActivityLifecycleCallbacks(new LifecycleHook());
            }
        } else {
            syncSkinName(skinName);
        }
    }

    public static void syncSkinName(String skinName) {
        ThemeState prev = currentState;
        if (prev != null && equalsNullable(prev.skinName, skinName)) {
            return;
        }
        ThemeState next = ThemeState.parse(skinName);
        currentState = next;
        Activity resumed = resumedActivityRef.get();
        if (resumed != null && !resumed.isFinishing() && !isPlayerScreen(resumed.getClass().getName())) {
            if (next.active) {
                applyActivityPass(resumed, next, true);
            } else if (prev != null && prev.active) {
                restoreStockActivityBars(resumed, skinName);
            }
        }
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
        if (!state.active || context == null || resId == 0 || origDrawable == null) {
            return origDrawable;
        }
        return overrideResDrawable(context.getResources(), resId, origDrawable);
    }

    public static int overrideResColor(Resources res, int resId, int origColor) {
        ThemeState state = currentState;
        if (!state.active || res == null || resId == 0) {
            return origColor;
        }
        int role = resolveRoleFast(res, resId);
        switch (role) {
            case ROLE_NON_MXSKIN:
                return origColor;
            case ROLE_COLOR_TOOLBAR_BG:
                return state.accentColor;
            case ROLE_COLOR_TOOLBAR_FG:
                return state.toolbarFgColor;
            case ROLE_COLOR_ACCENT:
                return state.readableAccent;
            case ROLE_COLOR_BACKDROP:
                return state.backdropColor;
            case ROLE_COLOR_SURFACE:
                return state.surfaceColor;
            case ROLE_COLOR_CARD:
                return state.cardColor;
            case ROLE_COLOR_DIVIDER:
                return state.dividerColor;
            default:
                return fallbackMxSkinColor(state, origColor);
        }
    }

    public static ColorStateList overrideResColorStateList(
            Resources res,
            int resId,
            ColorStateList origList
    ) {
        ThemeState state = currentState;
        if (!state.active || res == null || resId == 0) {
            return origList;
        }
        int role = resolveRoleFast(res, resId);
        switch (role) {
            case ROLE_NON_MXSKIN:
                return origList;
            case ROLE_CSL_STATEFUL_ACCENT:
                return state.statefulAccentList;
            case ROLE_COLOR_TOOLBAR_BG:
                return state.toolbarBgCSL;
            case ROLE_COLOR_TOOLBAR_FG:
                return state.toolbarFgCSL;
            case ROLE_COLOR_ACCENT:
                return state.accentCSL;
            case ROLE_COLOR_BACKDROP:
                return state.backdropCSL;
            case ROLE_COLOR_SURFACE:
                return state.surfaceCSL;
            case ROLE_COLOR_CARD:
                return state.cardCSL;
            case ROLE_COLOR_DIVIDER:
                return state.dividerCSL;
            default:
                return origList;
        }
    }

    public static Drawable overrideResDrawable(Resources res, int resId, Drawable origDrawable) {
        ThemeState state = currentState;
        if (!state.active || res == null || resId == 0 || origDrawable == null) {
            return origDrawable;
        }
        int role = resolveRoleFast(res, resId);
        switch (role) {
            case ROLE_NON_MXSKIN:
                return origDrawable;
            case ROLE_DRAWABLE_TOOLBAR_BG:
                if (origDrawable instanceof ColorDrawable
                        && ((ColorDrawable) origDrawable).getColor() == state.accentColor) {
                    return origDrawable;
                }
                return new ColorDrawable(state.accentColor);
            case ROLE_DRAWABLE_FAB:
                return state.getOrCreateFabDrawable(res, origDrawable);
            case ROLE_DRAWABLE_ME_WAVE: {
                if (origDrawable.getColorFilter() == state.toolbarBgFilter) {
                    return origDrawable;
                }
                Drawable wave = origDrawable;
                if (state.dark) {
                    Drawable lightWave = loadLightCounterpart(res, resId);
                    if (lightWave != null) {
                        wave = lightWave;
                    }
                }
                return tintClone(res, wave, state.toolbarBgFilter);
            }
            case ROLE_DRAWABLE_CARD_SHAPE:
                if (!state.dark) {
                    return origDrawable;
                }
                return tintClone(res, origDrawable, state.cardFilter);
            case ROLE_DRAWABLE_FOLDER_SILHOUETTE:
                return tintClone(res, origDrawable, state.folderTintFilter);
            case ROLE_DRAWABLE_FOLDER_BADGE:
                return tintClone(res, origDrawable, state.folderBadgeFilter);
            case ROLE_DRAWABLE_ACCENT_ICON:
            case ROLE_DRAWABLE_SWITCH_THUMB:
                return tintClone(res, origDrawable, state.accentFilter);
            case ROLE_DRAWABLE_SWITCH_TRACK:
                return tintClone(res, origDrawable, state.switchTrackFilter);
            case ROLE_DRAWABLE_AURORA_NAV:
                return tintClone(res, origDrawable, state.toolbarIconFilter);
            default:
                return origDrawable;
        }
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
        if (drawable.getColorFilter() != filter) {
            drawable.mutate().setColorFilter(filter);
        }
        return filter;
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

    /**
     * Zero-allocation fast lookup in RES_ROLE_CACHE; resolves via Resources.getResourceEntryName
     * only once per unique resId across the entire app session.
     */
    private static int resolveRoleFast(Resources res, int resId) {
        int baseSlot = mixInt(resId) & ROLE_CACHE_MASK;
        for (int p = 0; p < ROLE_PROBE_LIMIT; p++) {
            long entry = RES_ROLE_CACHE.get((baseSlot + p) & ROLE_CACHE_MASK);
            if (entry == 0L) {
                break;
            }
            if (((int) (entry >>> 32)) == resId) {
                return (int) (entry & 0xFFL);
            }
        }

        if (Boolean.TRUE.equals(IN_RESOLVE.get())) {
            return ROLE_NON_MXSKIN;
        }

        int computedRole = ROLE_NON_MXSKIN;
        IN_RESOLVE.set(Boolean.TRUE);
        try {
            String raw = res.getResourceEntryName(resId);
            if (raw != null && raw.startsWith("mxskin")) {
                String normalized = normalizeMxSkinEntryName(raw);
                Integer mapped = KEY_TO_ROLE.get(normalized);
                computedRole = mapped != null ? mapped.intValue() : ROLE_MXSKIN_OTHER;
            }
        } catch (Throwable ignored) {
            computedRole = ROLE_NON_MXSKIN;
        } finally {
            IN_RESOLVE.set(Boolean.FALSE);
        }

        long newEntry = (((long) resId) << 32) | (computedRole & 0xFFL);
        for (int p = 0; p < ROLE_PROBE_LIMIT; p++) {
            int slot = (baseSlot + p) & ROLE_CACHE_MASK;
            long existing = RES_ROLE_CACHE.get(slot);
            if (existing == 0L) {
                if (RES_ROLE_CACHE.compareAndSet(slot, 0L, newEntry)) {
                    break;
                }
                existing = RES_ROLE_CACHE.get(slot);
            }
            if (((int) (existing >>> 32)) == resId) {
                break;
            }
        }
        return computedRole;
    }

    private static int mixInt(int x) {
        int h = x * 0x9E3779B9;
        return h ^ (h >>> 16);
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

    private static Resources unwrapBaseResources(Resources res) {
        Resources current = res;
        for (int depth = 0; depth < 4 && current != null && current.getClass() != Resources.class; depth++) {
            Class<?> cls = current.getClass();
            Field delegateField = RES_WRAPPER_FIELD_CACHE.get(cls);
            if (delegateField == null) {
                Field fallbackField = null;
                for (Field f : cls.getDeclaredFields()) {
                    if (!Modifier.isStatic(f.getModifiers()) && f.getType() == Resources.class) {
                        f.setAccessible(true);
                        if (Modifier.isFinal(f.getModifiers())) {
                            delegateField = f;
                            break;
                        }
                        if (fallbackField == null) {
                            fallbackField = f;
                        }
                    }
                }
                if (delegateField == null) {
                    delegateField = fallbackField;
                }
                if (delegateField == null) {
                    break;
                }
                RES_WRAPPER_FIELD_CACHE.putIfAbsent(cls, delegateField);
            }
            try {
                Object inner = delegateField.get(current);
                if (inner instanceof Resources && inner != current) {
                    current = (Resources) inner;
                } else {
                    break;
                }
            } catch (Throwable ignored) {
                break;
            }
        }
        return current != null ? current : res;
    }

    private static Drawable loadLightCounterpart(Resources res, int darkResId) {
        IN_RESOLVE.set(Boolean.TRUE);
        try {
            // Unwrap ResourcesSkin (`Lkug;`) / MXMultiLanguageResourceWrapper (`Lztb;`) to raw
            // framework `android.content.res.Resources` so `getDrawable(id, null)` never re-maps
            // `mxskin__bg_me_page__light` back to `mxskin__bg_me_page__dark` on Dark Classic Themes.
            Resources unskinned = rawBaseResources;
            if (unskinned == null || unskinned.getClass() != Resources.class) {
                unskinned = unwrapBaseResources(res);
                if (unskinned != null && unskinned.getClass() == Resources.class) {
                    rawBaseResources = unskinned;
                }
            }
            if (unskinned == null) {
                return null;
            }
            if (cachedLightWaveSourceId == darkResId && cachedLightWaveTargetId != 0) {
                return unskinned.getDrawable(cachedLightWaveTargetId, null);
            }
            // Check delta = 0 FIRST: XML layouts pass `mxskin__bg_me_page__light` (`resId`) into
            // `ResourcesSkin` / `ThemeStrategyBase`, which mapped `origDrawable` to `resId - 1` (`__dark`)
            // while still passing the original `__light` `resId` into our hook!
            int[] offsets = new int[]{0, 1, -1, 2, -2};
            for (int delta : offsets) {
                int candidateId = darkResId + delta;
                try {
                    String name = unskinned.getResourceEntryName(candidateId);
                    if (name != null && name.startsWith("mxskin__bg_me_page__light")) {
                        cachedLightWaveSourceId = darkResId;
                        cachedLightWaveTargetId = candidateId;
                        return unskinned.getDrawable(candidateId, null);
                    }
                } catch (Throwable ignored) {
                }
            }
        } catch (Throwable ignored) {
        } finally {
            IN_RESOLVE.set(Boolean.FALSE);
        }
        return null;
    }

    private static Drawable tintClone(Resources res, Drawable src, PorterDuffColorFilter filter) {
        if (src == null || filter == null) return src;
        // Skip duplicate clone+mutate when ResourcesSkin already tinted this Drawable in the same call!
        if (src.getColorFilter() == filter) {
            return src;
        }
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
        copy.setColorFilter(filter);
        return copy;
    }

    // =========================================================================
    // Activity Window, System Bars & Toolbar Live Styling (Zero-Jitter)
    // =========================================================================

    public static void styleActivity(final Activity activity) {
        final ThemeState state = currentState;
        if (!state.active || activity == null) {
            return;
        }
        if (isPlayerScreen(activity.getClass().getName())) {
            return;
        }
        boolean foundToolbar = applyActivityPass(activity, state, false);
        if (!foundToolbar) {
            Window window = activity.getWindow();
            final View decor = window != null ? window.getDecorView() : null;
            if (decor != null) {
                final DecorStamp stamp = getOrCreateStamp(decor);
                if (!stamp.postScheduled) {
                    stamp.postScheduled = true;
                    decor.post(new Runnable() {
                        @Override
                        public void run() {
                            stamp.postScheduled = false;
                            ThemeState latest = currentState;
                            if (latest.active && !activity.isFinishing()) {
                                applyActivityPass(activity, latest, false);
                            }
                        }
                    });
                }
            }
        }
    }

    private static DecorStamp getOrCreateStamp(View decor) {
        DecorStamp stamp = DECOR_STAMPS.get(decor);
        if (stamp == null) {
            stamp = new DecorStamp();
            DECOR_STAMPS.put(decor, stamp);
        }
        return stamp;
    }

    private static boolean applyActivityPass(Activity activity, ThemeState state, boolean forceWindowUpdate) {
        try {
            Window window = activity.getWindow();
            if (window == null) return false;
            View decor = window.getDecorView();
            if (decor == null) return false;

            boolean foundToolbar = styleToolbarsInTree(decor, state);
            if (!foundToolbar) {
                return false;
            }

            DecorStamp stamp = getOrCreateStamp(decor);
            if (!forceWindowUpdate && stamp.appliedState == state) {
                return true;
            }
            stamp.appliedState = state;

            if (state.dark) {
                if (stamp.windowBgColor != state.surfaceColor) {
                    stamp.windowBgColor = state.surfaceColor;
                    window.setBackgroundDrawable(new ColorDrawable(state.surfaceColor));
                }
            } else if (stamp.windowBgColor != 0xFFFFFFFF) {
                stamp.windowBgColor = 0xFFFFFFFF;
                window.setBackgroundDrawable(new ColorDrawable(0xFFFFFFFF));
            }

            window.addFlags(FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
            window.clearFlags(FLAG_TRANSLUCENT_STATUS);
            window.setStatusBarColor(state.accentColor);
            window.setNavigationBarColor(state.navBarColor);

            applySystemBarAppearance(window, decor, state.lightToolbarBar, !state.dark);
            return true;
        } catch (Throwable ignored) {
            return false;
        }
    }

    private static void restoreStockActivityBars(Activity activity, String newSkinName) {
        try {
            Window window = activity.getWindow();
            if (window == null) return;
            View decor = window.getDecorView();
            if (decor == null) return;

            boolean stockDark = "black".equals(newSkinName)
                    || ("follow_system".equals(newSkinName)
                    && (activity.getResources().getConfiguration().uiMode
                    & Configuration.UI_MODE_NIGHT_MASK) == Configuration.UI_MODE_NIGHT_YES);

            int bg = stockDark ? 0xFF121212 : 0xFFFFFFFF;
            try {
                Resources actRes = activity.getResources();
                int statusId = actRes.getIdentifier(
                        "mxskin__status_bar__light",
                        "color",
                        activity.getPackageName()
                );
                if (statusId != 0) {
                    bg = actRes.getColor(statusId, null);
                }
            } catch (Throwable ignored) {
            }
            int fg = stockDark ? 0xFFFFFFFF : 0xFF1C2939;
            PorterDuffColorFilter resetFilter = new PorterDuffColorFilter(fg, PorterDuff.Mode.SRC_IN);

            DecorStamp stamp = getOrCreateStamp(decor);
            stamp.appliedState = null;
            stamp.windowBgColor = bg;
            window.setBackgroundDrawable(new ColorDrawable(bg));
            window.setStatusBarColor(bg);
            window.setNavigationBarColor(bg);
            applySystemBarAppearance(window, decor, !stockDark, !stockDark);
            resetToolbarsInTree(decor, bg, fg, resetFilter);
        } catch (Throwable ignored) {
        }
    }

    private static void applySystemBarAppearance(
            Window window,
            View decor,
            boolean lightStatus,
            boolean lightNav
    ) {
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

        int oldVis = decor.getSystemUiVisibility();
        int vis = oldVis;
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
        if (vis != oldVis) {
            decor.setSystemUiVisibility(vis);
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

    private static void resetToolbarsInTree(
            View view,
            int bg,
            int fg,
            PorterDuffColorFilter filter
    ) {
        if (view == null) return;
        if (view instanceof Toolbar) {
            Toolbar toolbar = (Toolbar) view;
            toolbar.setBackgroundColor(bg);
            toolbar.setTitleTextColor(fg);
            Drawable nav = toolbar.getNavigationIcon();
            if (nav != null) {
                nav.mutate().setColorFilter(filter);
                nav.invalidateSelf();
            }
            int childCount = toolbar.getChildCount();
            for (int i = 0; i < childCount; i++) {
                styleToolbarChildWithColors(toolbar.getChildAt(i), fg, filter);
            }
            return;
        }
        if (view instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) view;
            int count = vg.getChildCount();
            for (int i = 0; i < count; i++) {
                resetToolbarsInTree(vg.getChildAt(i), bg, fg, filter);
            }
        }
    }

    private static void styleSingleToolbar(Toolbar toolbar, ThemeState state) {
        Drawable existingBg = toolbar.getBackground();
        if (!(existingBg instanceof ColorDrawable)
                || ((ColorDrawable) existingBg).getColor() != state.accentColor) {
            toolbar.setBackgroundColor(state.accentColor);
        }
        toolbar.setTitleTextColor(state.toolbarFgColor);
        toolbar.setSubtitleTextColor(state.toolbarSubtitleFgColor);

        // Mutate and tint in place without re-calling setNavigationIcon unless instance changed,
        // avoiding unnecessary Toolbar.requestLayout() passes during screen transitions!
        Drawable nav = toolbar.getNavigationIcon();
        if (nav != null) {
            Drawable navMut = nav.mutate();
            if (navMut.getColorFilter() != state.toolbarIconFilter) {
                navMut.setColorFilter(state.toolbarIconFilter);
                navMut.invalidateSelf();
            }
            if (navMut != nav) {
                toolbar.setNavigationIcon(navMut);
            }
        }

        Drawable overflow = toolbar.getOverflowIcon();
        if (overflow != null) {
            Drawable ovMut = overflow.mutate();
            if (ovMut.getColorFilter() != state.toolbarIconFilter) {
                ovMut.setColorFilter(state.toolbarIconFilter);
                ovMut.invalidateSelf();
            }
            if (ovMut != overflow) {
                toolbar.setOverflowIcon(ovMut);
            }
        }

        Menu menu = toolbar.getMenu();
        if (menu != null) {
            int size = menu.size();
            for (int i = 0; i < size; i++) {
                MenuItem item = menu.getItem(i);
                if (item != null) {
                    Drawable icon = item.getIcon();
                    if (icon != null && icon.getColorFilter() != state.toolbarIconFilter) {
                        Drawable mut = icon.mutate();
                        mut.setColorFilter(state.toolbarIconFilter);
                        mut.invalidateSelf();
                    }
                }
            }
        }

        int childCount = toolbar.getChildCount();
        for (int i = 0; i < childCount; i++) {
            styleToolbarChildWithColors(toolbar.getChildAt(i), state.toolbarFgColor, state.toolbarIconFilter);
        }
    }

    private static void styleToolbarChildWithColors(
            View child,
            int fgColor,
            PorterDuffColorFilter iconFilter
    ) {
        if (child == null) return;
        if (child instanceof TextView) {
            TextView tv = (TextView) child;
            if (tv.getCurrentTextColor() != fgColor) {
                tv.setTextColor(fgColor);
            }
            return;
        }
        if (child instanceof ImageView) {
            Drawable d = ((ImageView) child).getDrawable();
            if (d != null && d.getColorFilter() != iconFilter) {
                Drawable mut = d.mutate();
                mut.setColorFilter(iconFilter);
                mut.invalidateSelf();
            }
            return;
        }
        if (child instanceof ViewGroup) {
            ViewGroup vg = (ViewGroup) child;
            int n = vg.getChildCount();
            for (int i = 0; i < n; i++) {
                styleToolbarChildWithColors(vg.getChildAt(i), fgColor, iconFilter);
            }
        }
    }

    private static boolean isPlayerScreen(String className) {
        return className != null && (className.contains("ActivityScreen") || className.contains("PlayerActivity"));
    }

    // =========================================================================
    // Color Math & Pre-Cached Immutable Theme Snapshot
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

    private static final class DecorStamp {
        ThemeState appliedState;
        int windowBgColor;
        boolean postScheduled;
        boolean toolbarPostScheduled;
    }

    private static final class LifecycleHook implements Application.ActivityLifecycleCallbacks {
        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            ThemeState state = currentState;
            if (state.active && activity != null && !isPlayerScreen(activity.getClass().getName())) {
                applyActivityPass(activity, state, false);
            }
        }

        @Override
        public void onActivityStarted(Activity activity) {
            styleActivity(activity);
        }

        @Override
        public void onActivityResumed(final Activity activity) {
            resumedActivityRef = new WeakReference<>(activity);
            ThemeState state = currentState;
            if (state.active && activity != null && !isPlayerScreen(activity.getClass().getName())) {
                applyActivityPass(activity, state, false);
                // Schedule a lightweight toolbar-only post-pass so MenuItem & overflow icons
                // inflated during first traversal (`onCreateOptionsMenu` / `onPrepareOptionsMenu`
                // after `onResume`) receive `toolbarIconFilter` on bright Light Classic Themes
                // without touching Window flags or system bars (zero layout jitter).
                Window window = activity.getWindow();
                final View decor = window != null ? window.getDecorView() : null;
                if (decor != null) {
                    final DecorStamp stamp = getOrCreateStamp(decor);
                    if (!stamp.toolbarPostScheduled) {
                        stamp.toolbarPostScheduled = true;
                        decor.post(new Runnable() {
                            @Override
                            public void run() {
                                stamp.toolbarPostScheduled = false;
                                ThemeState latest = currentState;
                                if (latest.active && !activity.isFinishing()) {
                                    styleToolbarsInTree(decor, latest);
                                }
                            }
                        });
                    }
                }
            }
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
            if (resumedActivityRef.get() == activity) {
                resumedActivityRef = new WeakReference<>(null);
            }
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
        final int toolbarSubtitleFgColor;
        final boolean lightToolbarBar;
        final int surfaceColor;
        final int backdropColor;
        final int cardColor;
        final int navBarColor;
        final int dividerColor;
        final int folderTintColor;
        final int folderBadgeColor;

        // Pre-built reusable ColorFilters (zero allocations during scroll/bind!)
        final PorterDuffColorFilter toolbarBgFilter;
        final PorterDuffColorFilter toolbarIconFilter;
        final PorterDuffColorFilter cardFilter;
        final PorterDuffColorFilter folderTintFilter;
        final PorterDuffColorFilter folderBadgeFilter;
        final PorterDuffColorFilter accentFilter;
        final PorterDuffColorFilter switchTrackFilter;

        // Pre-built reusable ColorStateLists (zero allocations during scroll/bind!)
        final ColorStateList statefulAccentList;
        final ColorStateList toolbarBgCSL;
        final ColorStateList toolbarFgCSL;
        final ColorStateList accentCSL;
        final ColorStateList backdropCSL;
        final ColorStateList surfaceCSL;
        final ColorStateList cardCSL;
        final ColorStateList dividerCSL;

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
                this.toolbarSubtitleFgColor = 0;
                this.lightToolbarBar = false;
                this.surfaceColor = 0;
                this.backdropColor = 0;
                this.cardColor = 0;
                this.navBarColor = 0;
                this.dividerColor = 0;
                this.folderTintColor = 0;
                this.folderBadgeColor = 0;
                this.toolbarBgFilter = null;
                this.toolbarIconFilter = null;
                this.cardFilter = null;
                this.folderTintFilter = null;
                this.folderBadgeFilter = null;
                this.accentFilter = null;
                this.switchTrackFilter = null;
                this.statefulAccentList = null;
                this.toolbarBgCSL = null;
                this.toolbarFgCSL = null;
                this.accentCSL = null;
                this.backdropCSL = null;
                this.surfaceCSL = null;
                this.cardCSL = null;
                this.dividerCSL = null;
                return;
            }

            this.accentColor = 0xFF000000 | (rawAccentColor & 0xFFFFFF);
            double lum = luminance(this.accentColor);
            this.lightToolbarBar = lum > 0.62;
            this.toolbarFgColor = this.lightToolbarBar ? 0xFF1C2939 : 0xFFFFFFFF;
            this.toolbarSubtitleFgColor = withAlpha(this.toolbarFgColor, 0xCC);

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

            this.toolbarBgFilter = new PorterDuffColorFilter(this.accentColor, PorterDuff.Mode.SRC_IN);
            this.toolbarIconFilter = new PorterDuffColorFilter(this.toolbarFgColor, PorterDuff.Mode.SRC_IN);
            this.cardFilter = new PorterDuffColorFilter(this.cardColor, PorterDuff.Mode.SRC_IN);
            this.folderTintFilter = new PorterDuffColorFilter(this.folderTintColor, PorterDuff.Mode.SRC_IN);
            this.folderBadgeFilter = new PorterDuffColorFilter(this.folderBadgeColor, PorterDuff.Mode.SRC_IN);
            this.accentFilter = new PorterDuffColorFilter(this.readableAccent, PorterDuff.Mode.SRC_IN);
            this.switchTrackFilter = new PorterDuffColorFilter(
                    withAlpha(this.readableAccent, 0x90),
                    PorterDuff.Mode.SRC_IN
            );

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
            this.toolbarBgCSL = ColorStateList.valueOf(this.accentColor);
            this.toolbarFgCSL = ColorStateList.valueOf(this.toolbarFgColor);
            this.accentCSL = ColorStateList.valueOf(this.readableAccent);
            this.backdropCSL = ColorStateList.valueOf(this.backdropColor);
            this.surfaceCSL = ColorStateList.valueOf(this.surfaceColor);
            this.cardCSL = ColorStateList.valueOf(this.cardColor);
            this.dividerCSL = ColorStateList.valueOf(this.dividerColor);
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

            paint.setColor(0x10000000);
            canvas.drawCircle(cx, cy + size * 0.045f, radius * 1.06f, paint);
            paint.setColor(0x18000000);
            canvas.drawCircle(cx, cy + size * 0.030f, radius * 1.02f, paint);
            paint.setColor(0x22000000);
            canvas.drawCircle(cx, cy + size * 0.018f, radius * 0.99f, paint);

            paint.setColor(circleColor);
            canvas.drawCircle(cx, cy, radius, paint);

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
