/*
 * Copyright (C) 2026 anddea
 *
 * This file is part of the revanced-patches project:
 * https://github.com/anddea/revanced-patches
 *
 * Original author(s):
 * - anddea (https://github.com/anddea)
 *
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-20
 *
 * ------------------------------------------------------------------------
 * GPLv3 Section 7 – Additional Terms & Attribution Requirements
 * ------------------------------------------------------------------------
 *
 * This file contains substantial original work by the author(s) listed above.
 *
 * In accordance with Section 7 of the GNU General Public License v3.0,
 * the following additional terms apply to this file:
 *
 * 1. Source Credit Preservation (Section 7(b)): This specific copyright notice
 *    and the list of original authors above must be preserved in any copy
 *    or derivative work. You may add your own copyright notice below it,
 *    but you may not remove the original one.
 *
 * 2. Origin & Modification Marking (Section 7(c)): Modified versions must be
 *    clearly marked as such (e.g., by adding a "Modified by" line or a new
 *    copyright notice) and must not be misrepresented as the original work.
 *
 * 3. Version Control Attribution (Section 7(b)): Any ports or substantial
 *    modifications must retain historical authorship credit in version control
 *    systems (e.g., Git), listing original author(s) appropriately and
 *    modifiers as committers or co-authors.
 *
 * 4. User Interface Attribution (Section 7(b)): Any works containing or
 *    derived from this material must maintain a visible credit or
 *    acknowledgment to the original author(s) within the application's
 *    user interface (e.g., in an "About" or "Credits" section).
 */

/*
 * Inspired by Morphe.
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to Morphe contributions.
 */

package app.morphe.extension.shared.patches;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.ColorFilter;
import android.graphics.ColorMatrix;
import android.graphics.ColorMatrixColorFilter;
import android.graphics.PixelFormat;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Animatable2;
import android.graphics.drawable.AnimatedVectorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.system.ErrnoException;
import android.system.Os;
import android.system.StructStat;
import android.view.Gravity;
import android.view.ViewGroup;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.view.animation.AnimationSet;
import android.view.animation.ScaleAnimation;
import android.widget.FrameLayout;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

import app.morphe.extension.music.patches.utils.DrawableColorPatch;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.shared.settings.SharedYouTubeSettings;
import app.morphe.extension.shared.settings.preference.IconListPreference;
import app.morphe.extension.shared.utils.BaseThemeUtils;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.theme.ThemePatch;

/**
 * Enables the launcher alias selected in the custom branding settings.
 *
 * <p>The patch creates a normal alias and, when applicable, a system-splash companion for every
 * app-name/icon combination. Android keeps the alias labels and icons in the manifest, while the
 * system-splash theme is persisted with the platform API because activity aliases cannot override
 * their target activity's theme. The application resources themselves remain untouched.</p>
 */
@SuppressWarnings({"deprecation", "unused"})
public final class CustomBrandingPatch {
    private static final String ICON_VALUES_RESOURCE = "morphe_custom_branding_icon_entry_values";
    private static final String NAME_ENTRIES_RESOURCE = "morphe_custom_branding_name_entries";
    private static final String DEFAULT_ICON_RESOURCE = "morphe_custom_branding_default_icon";
    private static final String DEFAULT_NAME_INDEX_RESOURCE = "morphe_custom_branding_default_name_index";
    private static final String MAIN_ACTIVITY_RESOURCE = "morphe_custom_branding_main_activity";
    private static final String ORIGINAL_LAUNCHER_RESOURCE = "morphe_custom_branding_original_launcher";
    private static final String NOTIFICATION_ICON_PREFIX = "morphe_notification_icon_";
    private static final String HEADER_RESOURCE_PREFIX = "morphe_custom_branding_header_";
    private static final String SPLASH_RESOURCE_PREFIX = "morphe_custom_branding_splash_";
    private static final String SYSTEM_SPLASH_STYLE_PREFIX =
            "morphe_custom_branding_system_splash_";
    private static final String BRANDING_STATE = "morphe_branding_state";
    private static final String SYSTEM_SPLASH_STAMP = "system_splash_install_and_theme";
    private static final String LEGACY_SYSTEM_SPLASH_THEME_KEY = "morphe_custom_branding_system_splash_theme_icon";
    private static final String SYSTEM_SPLASH_THEME_SEPARATOR = "__";
    private static final String YOUTUBE_DARK_SPLASH_THEME_PREFIX =
            "morphe_theme_splash_dark_";
    private static final String YOUTUBE_LIGHT_SPLASH_THEME_PREFIX =
            "morphe_theme_splash_light_";
    private static final String MUSIC_SPLASH_THEME_PREFIX = "morphe_theme_splash_";
    private static final String DARK_THEME_KEY = "morphe_dark_theme";
    private static final String LIGHT_THEME_KEY = "morphe_light_theme";
    private static final String LAST_USED_DARK_THEME_KEY = "morphe_theme_last_used_dark_mode";
    private static final String SPLASH_OVERLAY_TAG = "morphe_custom_branding_splash_overlay";
    private static final String SPLASH_SCREEN_STYLE_OPTION =
            "android.activity.splashScreenStyle";
    private static final int SPLASH_SCREEN_STYLE_SOLID_COLOR = 0;
    private static final String SPLASH_ANIMATION_STYLE_KEY = "morphe_splash_screen_animation_style";
    private static final String SPLASH_ANIMATION_STYLE_DEFAULT = "FPS_60_ONE_SECOND";
    private static final String SPLASH_ANIMATION_STYLE_DISABLED = "DISABLED";
    private static final String DISABLE_CAIRO_SPLASH_ANIMATION_KEY =
            "revanced_disable_cairo_splash_animation";
    private static final String SPLASH_ANIMATION_STYLE_60_BLACK_AND_WHITE = "FPS_60_BLACK_AND_WHITE";
    private static final String SPLASH_ANIMATION_STYLE_30_BLACK_AND_WHITE = "FPS_30_BLACK_AND_WHITE";
    private static final String LAUNCHER_RESOURCE_PREFIX = "morphe_launcher_";
    private static final float RVX_SETTINGS_ICON_SCALE = 0.6f;
    private static final float MUSIC_CUSTOM_RVX_SETTINGS_ICON_HORIZONTAL_OFFSET_DP = -3.0f;
    private static boolean systemSplashThemePreparedBeforeLaunch;
    private static final ColorFilter MONOCHROME_SPLASH_FILTER = new ColorMatrixColorFilter(
            new ColorMatrix(new float[]{
                    0.299f, 0.587f, 0.114f, 0, 0,
                    0.299f, 0.587f, 0.114f, 0, 0,
                    0.299f, 0.587f, 0.114f, 0, 0,
                    0, 0, 0, 1, 0,
            }));

    private CustomBrandingPatch() {
    }

    /**
     * Splashless entry point used only for non-stock launcher aliases.
     *
     * <p>It immediately forwards the launch intent to the real host activity. Keeping the host
     * activity out of this class hierarchy avoids breaking applications that initialize their
     * dependency graph using the exact activity type.</p>
     */
    public static class SplashlessLauncherActivity extends Activity {
        @Override
        protected void onCreate(Bundle savedInstanceState) {
            super.onCreate(savedInstanceState);

            String mainActivityName = CustomBrandingPatch.getString(
                    this, MAIN_ACTIVITY_RESOURCE, "");
            if (mainActivityName.isEmpty()) {
                finish();
                return;
            }

            try {
                Intent targetIntent = new Intent(getIntent());
                targetIntent.setComponent(new ComponentName(this, mainActivityName));
                int targetFlags = targetIntent.getFlags()
                        & ~Intent.FLAG_ACTIVITY_NEW_TASK
                        & ~Intent.FLAG_ACTIVITY_RESET_TASK_IF_NEEDED;
                targetIntent.setFlags(targetFlags | Intent.FLAG_ACTIVITY_NO_ANIMATION);
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    // A previous run can have persisted a runtime splash theme. Reset it before
                    // forwarding through the controllable path; the system-splash alias uses its
                    // manifest theme and does not enter this activity.
                    if (!isSystemSplashEnabled(this)) {
                        SplashScreenBridge.resetTheme(this);
                    }
                    // ActivityOptions exposes this publicly only on newer Android releases, but
                    // the Bundle contract exists from API 31. Keep the forwarded activity's
                    // system splash icon-free; the size-controlled custom overlay is installed
                    // once by the main activity during the handoff.
                    Bundle options = new Bundle();
                    options.putInt(SPLASH_SCREEN_STYLE_OPTION, SPLASH_SCREEN_STYLE_SOLID_COLOR);
                    startActivity(targetIntent, options);
                } else {
                    startActivity(targetIntent);
                }
            } finally {
                finish();
                overridePendingTransition(0, 0);
            }
        }
    }

    /** Default used before a branding resource configuration is available. */
    @NonNull
    public static String getDefaultIconStyle() {
        Context context = Utils.getContext();
        return context == null
                ? "original"
                : getString(context, DEFAULT_ICON_RESOURCE, "original");
    }

    /** Default used before a branding resource configuration is available. */
    public static int getDefaultAppNameIndex() {
        Context context = Utils.getContext();
        return context == null
                ? 1
                : parseInt(getString(context, DEFAULT_NAME_INDEX_RESOURCE, "1"));
    }

    /** Entry point injected into the main activity's {@code onCreate}. */
    public static void setBranding(Activity activity) {
        systemSplashThemePreparedBeforeLaunch = false;
        Context context = activity != null ? activity : Utils.getContext();
        if (context != null) applyBranding(context, activity, true);
    }

    /** Applies imported or changed launcher selections before the settings restart resolves a launch intent. */
    public static void prepareLauncherRestart(Context context) {
        Activity activity = context instanceof Activity host ? host : Utils.getActivity();
        applyBranding(context, activity, false);
    }

    private static void applyBranding(Context context, Activity activity, boolean starting) {
        try {
            String[] iconValues = getStringArray(context, ICON_VALUES_RESOURCE);
            String[] nameEntries = getStringArray(context, NAME_ENTRIES_RESOURCE);
            if (iconValues.length == 0 || nameEntries.length == 0) return;

            // A value equal to a Setting's default is intentionally absent from SharedPreferences.
            // Only correct an unavailable selection (for example custom assets omitted after a repatch).
            String selectedIcon = SharedYouTubeSettings.CUSTOM_BRANDING_ICON.get();
            if (!hasIcon(iconValues, selectedIcon)) {
                selectedIcon = getString(context, DEFAULT_ICON_RESOURCE, "original");
                if (!hasIcon(iconValues, selectedIcon)) selectedIcon = iconValues[0];
                SharedYouTubeSettings.CUSTOM_BRANDING_ICON.save(selectedIcon);
            }
            int selectedNameIndex = SharedYouTubeSettings.CUSTOM_BRANDING_NAME.get();
            if (selectedNameIndex < 1 || selectedNameIndex > nameEntries.length) {
                selectedNameIndex = getDefaultAppNameIndex();
                if (selectedNameIndex < 1 || selectedNameIndex > nameEntries.length) selectedNameIndex = 1;
                SharedYouTubeSettings.CUSTOM_BRANDING_NAME.save(selectedNameIndex);
            }

            String label = nameEntries[selectedNameIndex - 1];
            if (!label.isEmpty()) context.getApplicationInfo().nonLocalizedLabel = label;
            IconListPreference.setOriginalLauncherIconName(getString(context, ORIGINAL_LAUNCHER_RESOURCE, ""));

            boolean useSystemSplash = isSystemSplashEnabled(context);
            applySystemSplashTheme(activity, useSystemSplash, starting, false);
            LauncherAliasReconciler.reconcile(context, selectedIcon, selectedNameIndex, useSystemSplash);
        } catch (Exception ignored) {
            // Branding resources can be missing on a root-mounted installation.
        }
    }

    private static boolean hasIcon(String[] values, String icon) {
        for (String value : values) {
            if (value.equals(icon)) return true;
        }
        return false;
    }

    /**
     * Persists the splash theme that Android must use on the next cold or warm launch.
     *
     * <p>{@code activity-alias} cannot declare its own theme, and the platform splash theme is
     * process-persistent. Calling this when the setting or selected icon changes prevents the next
     * launcher restart from reusing the transparent theme installed for the controllable overlay.
     * Calling it from {@link #setBranding(Activity)} also repairs settings changed outside the
     * preference UI.</p>
     */
    public static void updateSystemSplashTheme(Activity activity) {
        applySystemSplashTheme(activity, isSystemSplashEnabled(activity), false, true);
    }

    @SuppressLint("ApplySharedPref") // Save changes before the settings restart can exit the process.
    private static void applySystemSplashTheme(Activity activity, boolean enabled, boolean starting,
                                               boolean forceReset) {
        if (activity == null || Build.VERSION.SDK_INT < Build.VERSION_CODES.S) return;

        try {
            SharedPreferences state = activity.getSharedPreferences(BRANDING_STATE, Context.MODE_PRIVATE);
            String appliedStamp = state.getString(SYSTEM_SPLASH_STAMP, null);
            boolean hasLegacyTheme = Setting.preferences.preferences.contains(LEGACY_SYSTEM_SPLASH_THEME_KEY);
            if (!enabled) {
                if (forceReset || appliedStamp != null || hasLegacyTheme) {
                    SplashScreenBridge.resetTheme(activity);
                    if (appliedStamp != null) state.edit().remove(SYSTEM_SPLASH_STAMP).commit();
                    if (hasLegacyTheme) Setting.preferences.removeKey(LEGACY_SYSTEM_SPLASH_THEME_KEY);
                }
                return;
            }

            String themeName = getSystemSplashThemeName(activity, SharedYouTubeSettings.CUSTOM_BRANDING_ICON.get());
            int themeId = ResourceUtils.getIdentifier(themeName, ResourceType.STYLE, activity);
            if (themeId == 0) return;

            // A patch/reinstall can replace the APK without changing its version or even its path
            // (for example with a bind mount). A previously applied style name is not proof that
            // Android rendered this installation's starting window with that style.
            String source = splashSourceIdentity(activity.getApplicationInfo().sourceDir);
            String stamp = (source == null ? "" : source) + '\n' + themeName;
            if (starting) systemSplashThemePreparedBeforeLaunch = source != null && stamp.equals(appliedStamp);

            SplashScreenBridge.setTheme(activity, themeId);
            if (!stamp.equals(appliedStamp)) state.edit().putString(SYSTEM_SPLASH_STAMP, stamp).commit();
            if (hasLegacyTheme) Setting.preferences.removeKey(LEGACY_SYSTEM_SPLASH_THEME_KEY);
        } catch (Exception ignored) {
            // Leave the host splash theme unchanged when generated resources are unavailable.
        }
    }

    @RequiresApi(Build.VERSION_CODES.S)
    private static String splashSourceIdentity(String path) {
        if (path == null || path.isEmpty()) return null;

        try {
            return splashSourceIdentity(path, Os.stat(path));
        } catch (ErrnoException | SecurityException ignored) {
            return null;
        }
    }

    @RequiresApi(Build.VERSION_CODES.S)
    static String splashSourceIdentity(String path, StructStat source) {
        return path + '\n' + source.st_dev + ':' + source.st_ino + ':' + source.st_size
                + ':' + source.st_mtime + ':' + source.st_mtim.tv_nsec
                + ':' + source.st_ctime + ':' + source.st_ctim.tv_nsec;
    }

    /**
     * Resolves a static Theme-preset background combined with the selected branding animation.
     *
     * <p>YouTube may force an appearance independently of the device configuration, so its last
     * resolved appearance is used before the resolver runs. Music has one dark preset selector.
     * When Theme is not included, or an imported setting is invalid, the icon-only style remains
     * a safe fallback.</p>
     */
    @NonNull
    private static String getSystemSplashThemeName(Context context, String selectedIcon) {
        String baseThemeName = SYSTEM_SPLASH_STYLE_PREFIX + selectedIcon;

        boolean hasYouTubeThemes = ResourceUtils.getIdentifier(
                YOUTUBE_LIGHT_SPLASH_THEME_PREFIX + ThemePatch.DEFAULT_LIGHT_THEME,
                ResourceType.STYLE,
                context) != 0;
        if (hasYouTubeThemes) {
            boolean dark = BaseThemeUtils.isAppThemeResolved()
                    ? BaseThemeUtils.isDarkModeEnabled()
                    : Setting.preferences.getBoolean(
                            LAST_USED_DARK_THEME_KEY,
                            BaseThemeUtils.isDarkModeEnabled());
            String themeKey = Setting.preferences.getString(
                    dark ? DARK_THEME_KEY : LIGHT_THEME_KEY,
                    dark ? ThemePatch.DEFAULT_DARK_THEME : ThemePatch.DEFAULT_LIGHT_THEME);
            String appearanceKey = (dark ? "dark_" : "light_") + themeKey;
            String combinedThemeName = baseThemeName
                    + SYSTEM_SPLASH_THEME_SEPARATOR + appearanceKey;
            if (ResourceUtils.getIdentifier(
                    combinedThemeName, ResourceType.STYLE, context) != 0) {
                return combinedThemeName;
            }

            String fallbackThemeName = baseThemeName + SYSTEM_SPLASH_THEME_SEPARATOR
                    + (dark ? "dark_stock" : "light_white");
            if (ResourceUtils.getIdentifier(
                    fallbackThemeName, ResourceType.STYLE, context) != 0) {
                return fallbackThemeName;
            }
            return baseThemeName;
        }

        boolean hasMusicThemes = ResourceUtils.getIdentifier(
                MUSIC_SPLASH_THEME_PREFIX + DrawableColorPatch.DEFAULT_DARK_THEME,
                ResourceType.STYLE,
                context) != 0;
        if (hasMusicThemes) {
            String themeKey = Setting.preferences.getString(DARK_THEME_KEY, DrawableColorPatch.DEFAULT_DARK_THEME);
            String combinedThemeName = baseThemeName
                    + SYSTEM_SPLASH_THEME_SEPARATOR + themeKey;
            if (ResourceUtils.getIdentifier(
                    combinedThemeName, ResourceType.STYLE, context) != 0) {
                return combinedThemeName;
            }

            String fallbackThemeName = baseThemeName
                    + SYSTEM_SPLASH_THEME_SEPARATOR + DrawableColorPatch.DEFAULT_DARK_THEME;
            if (ResourceUtils.getIdentifier(
                    fallbackThemeName, ResourceType.STYLE, context) != 0) {
                return fallbackThemeName;
            }
        }

        return baseThemeName;
    }

    /**
     * Resolves the selected name for code paths that ask Android for the application name.
     * Launcher aliases still use their manifest labels because Android does not expose a runtime
     * API to change an installed component's label.
     */
    @NonNull
    public static String getApplicationName(String original) {
        String fallback = original == null ? "" : original;
        try {
            Context context = Utils.getContext();
            if (context == null) return fallback;

            String[] nameEntries = getStringArray(context, NAME_ENTRIES_RESOURCE);
            if (nameEntries.length == 0) return fallback;

            int selectedNameIndex = SharedYouTubeSettings.CUSTOM_BRANDING_NAME.get();
            if (selectedNameIndex < 1 || selectedNameIndex > nameEntries.length) {
                selectedNameIndex = getDefaultAppNameIndex();
            }

            String label = selectedNameIndex >= 1 && selectedNameIndex <= nameEntries.length
                    ? nameEntries[selectedNameIndex - 1]
                    : fallback;
            return label.isEmpty() ? fallback : label;
        } catch (Exception ignored) {
            return fallback;
        }
    }

    /** Replaces the stock YouTube wordmark with the selected project's themed wordmark. */
    public static Drawable getHeaderDrawable(
            Context context, int originalAttribute, Drawable original) {
        try {
            String selectedIcon = SharedYouTubeSettings.CUSTOM_BRANDING_ICON.get();
            if ("original".equals(selectedIcon) || "youtube".equals(selectedIcon)) {
                return original;
            }

            int premiumAttribute = ResourceUtils.getIdentifier(
                    "ytPremiumWordmarkHeader", ResourceType.ATTR, context);
            int generalAttribute = ResourceUtils.getIdentifier(
                    "ytWordmarkHeader", ResourceType.ATTR, context);
            if (originalAttribute != premiumAttribute && originalAttribute != generalAttribute) {
                return original;
            }
            String headerResource = originalAttribute == premiumAttribute
                    ? "yt_premium_wordmark_header"
                    : "yt_wordmark_header";
            String theme = BaseThemeUtils.isDarkModeEnabled() ? "dark" : "light";
            int identifier = ResourceUtils.getIdentifier(
                    HEADER_RESOURCE_PREFIX + selectedIcon + "_" + headerResource + "_" + theme,
                    ResourceType.DRAWABLE,
                    context);
            return identifier == 0 ? original : context.getResources().getDrawable(identifier);
        } catch (Exception ignored) {
            return original;
        }
    }

    /**
     * Header wrapper for injected methods that have no free local register to preserve their
     * {@link Context}. The application context is sufficient for resolving themed drawables.
     */
    public static Drawable getHeaderDrawable(int originalAttribute, Drawable original) {
        Context context = Utils.getContext();
        return context == null ? original : getHeaderDrawable(context, originalAttribute, original);
    }

    /** Returns the selected YouTube Music header while preserving the stock resource as fallback. */
    public static int getMusicHeaderDrawableId(int original) {
        try {
            Context context = Utils.getContext();
            if (context == null) return original;

            String selectedIcon = SharedYouTubeSettings.CUSTOM_BRANDING_ICON.get();
            if ("original".equals(selectedIcon) || "youtube_music".equals(selectedIcon)) {
                int stock = ResourceUtils.getIdentifier(
                        "action_bar_logo", ResourceType.DRAWABLE, context);
                return stock == 0 ? original : stock;
            }

            int identifier = ResourceUtils.getIdentifier(
                    HEADER_RESOURCE_PREFIX + selectedIcon + "_action_bar_logo",
                    ResourceType.DRAWABLE,
                    context);
            return identifier == 0 ? original : identifier;
        } catch (Exception ignored) {
            return original;
        }
    }

    private static int getRvxSettingsIconDrawableId(Context context) {
        String resourceName = "morphe_rvx_settings_icon_fallback";
        if (SharedYouTubeSettings.CUSTOM_BRANDING_APPLY_TO_RVX_SETTINGS.get()) {
            String selectedIcon = SharedYouTubeSettings.CUSTOM_BRANDING_ICON.get();
            if (!selectedIcon.isEmpty()) {
                resourceName = "morphe_rvx_settings_icon_" + selectedIcon;
            }
        }

        int identifier = ResourceUtils.getIdentifier(
                resourceName, ResourceType.DRAWABLE, context);
        if (identifier == 0 && !"morphe_rvx_settings_icon_fallback".equals(resourceName)) {
            identifier = ResourceUtils.getIdentifier(
                    "morphe_rvx_settings_icon_fallback", ResourceType.DRAWABLE, context);
        }
        return identifier;
    }

    private static int getStockSettingsIconSize() {
        int identifier = ResourceUtils.getDimenIdentifier("revanced_stock_preference_icon_size");
        return identifier == 0 ? 0 : ResourceUtils.getResources().getDimensionPixelSize(identifier);
    }

    /**
     * Drawable inflated by the Music settings XML so its ordinary Preference can select an icon
     * without calling version-specific AndroidX Preference methods.
     */
    public static final class RvxSettingsIconDrawable extends Drawable {
        private Drawable delegate;
        private final int stockIconSize = getStockSettingsIconSize();

        /**
         * Keeps launcher fallbacks aligned with Music's legacy preference icon slot. Dedicated
         * settings artwork retains its authored bounds and does not receive implicit scaling.
         */
        private void updateDelegateBounds(@NonNull android.graphics.Rect bounds) {
            if (delegate == null) return;

            if (delegate instanceof RvxSettingsIconFallbackDrawable && stockIconSize == 0) {
                Context context = Utils.getContext();
                if (context == null) {
                    delegate.setBounds(bounds);
                    return;
                }

                int horizontalOffset = Math.round(
                        MUSIC_CUSTOM_RVX_SETTINGS_ICON_HORIZONTAL_OFFSET_DP
                                * context.getResources().getDisplayMetrics().density);
                delegate.setBounds(
                        bounds.left + horizontalOffset,
                        bounds.top,
                        bounds.right + horizontalOffset,
                        bounds.bottom);
                return;
            }

            delegate.setBounds(bounds);
        }

        private Drawable getDelegate() {
            if (delegate != null) return delegate;

            Context context = Utils.getContext();
            if (context == null) return null;
            int identifier = getRvxSettingsIconDrawableId(context);
            if (identifier == 0) return null;

            delegate = context.getResources().getDrawable(identifier);
            updateDelegateBounds(getBounds());
            delegate.setState(getState());
            delegate.setLevel(getLevel());
            return delegate;
        }

        @Override
        public void draw(@NonNull Canvas canvas) {
            Drawable drawable = getDelegate();
            if (drawable == null) return;

            updateDelegateBounds(getBounds());
            drawable.draw(canvas);
        }

        @Override
        protected void onBoundsChange(@NonNull android.graphics.Rect bounds) {
            getDelegate();
            updateDelegateBounds(bounds);
        }

        @Override
        protected boolean onStateChange(@NonNull int[] state) {
            Drawable drawable = getDelegate();
            return drawable != null && drawable.setState(state);
        }

        @Override
        protected boolean onLevelChange(int level) {
            Drawable drawable = getDelegate();
            return drawable != null && drawable.setLevel(level);
        }

        @Override
        public boolean isStateful() {
            Drawable drawable = getDelegate();
            return drawable != null && drawable.isStateful();
        }

        @Override
        public int getIntrinsicWidth() {
            if (stockIconSize != 0) return stockIconSize;

            Drawable drawable = getDelegate();
            return drawable == null ? -1 : drawable.getIntrinsicWidth();
        }

        @Override
        public int getIntrinsicHeight() {
            if (stockIconSize != 0) return stockIconSize;

            Drawable drawable = getDelegate();
            return drawable == null ? -1 : drawable.getIntrinsicHeight();
        }

        @Override
        public void setAlpha(int alpha) {
            Drawable drawable = getDelegate();
            if (drawable != null) drawable.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            Drawable drawable = getDelegate();
            if (drawable != null) drawable.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            Drawable drawable = getDelegate();
            return drawable == null ? PixelFormat.TRANSPARENT : drawable.getOpacity();
        }
    }

    private static int getLauncherIconDrawableIdentifier(Context context) {
        String selectedIcon = SharedYouTubeSettings.CUSTOM_BRANDING_ICON.get();
        if (selectedIcon.isEmpty()) selectedIcon = "original";

        String resourceName = "original".equals(selectedIcon)
                ? getString(context, ORIGINAL_LAUNCHER_RESOURCE, "")
                : LAUNCHER_RESOURCE_PREFIX + selectedIcon;
        int identifier = getLauncherResourceIdentifier(context, resourceName);
        if (identifier != 0 || "original".equals(selectedIcon)) return identifier;

        // An icon without bundled launcher layers can still use the stock launcher as a safe
        // fallback instead of leaving the RVX settings row empty.
        return getLauncherResourceIdentifier(
                context, getString(context, ORIGINAL_LAUNCHER_RESOURCE, ""));
    }

    private static int getLauncherResourceIdentifier(Context context, String resourceName) {
        if (resourceName.isEmpty()) return 0;

        int identifier = ResourceUtils.getIdentifier(
                resourceName, ResourceType.MIPMAP, context);
        if (identifier == 0) {
            identifier = ResourceUtils.getIdentifier(
                    resourceName, ResourceType.DRAWABLE, context);
        }
        return identifier;
    }

    /**
     * Draws a launcher icon as a smaller RVX settings icon when no dedicated settings artwork is
     * available. The launcher aliases and manifest continue to use the unscaled resource.
     */
    public static final class RvxSettingsIconFallbackDrawable extends Drawable {
        private Drawable delegate;
        private final int stockIconSize = getStockSettingsIconSize();

        private int getSettingsIconSize() {
            if (stockIconSize != 0) return stockIconSize;

            Context context = Utils.getContext();
            if (context == null) return -1;

            return Math.round(48.0f * context.getResources().getDisplayMetrics().density);
        }

        private Drawable getDelegate() {
            if (delegate != null) return delegate;

            Context context = Utils.getContext();
            if (context == null) return null;

            int identifier = getLauncherIconDrawableIdentifier(context);
            if (identifier == 0) return null;

            try {
                delegate = context.getResources().getDrawable(identifier);
                delegate.setBounds(getBounds());
                delegate.setState(getState());
                delegate.setLevel(getLevel());
                return delegate;
            } catch (Exception ignored) {
                return null;
            }
        }

        @Override
        public void draw(@NonNull Canvas canvas) {
            Drawable drawable = getDelegate();
            if (drawable == null) return;

            android.graphics.Rect bounds = getBounds();
            if (bounds.isEmpty()) return;

            float scale = stockIconSize == 0 ? RVX_SETTINGS_ICON_SCALE : 20.0f / 24.0f;
            int scaledWidth = Math.round(bounds.width() * scale);
            int scaledHeight = Math.round(bounds.height() * scale);
            int left = bounds.left + (bounds.width() - scaledWidth) / 2;
            int top = bounds.top + (bounds.height() - scaledHeight) / 2;

            drawable.setBounds(left, top, left + scaledWidth, top + scaledHeight);
            drawable.draw(canvas);
        }

        @Override
        protected void onBoundsChange(@NonNull android.graphics.Rect bounds) {
            Drawable drawable = getDelegate();
            if (drawable != null) drawable.setBounds(bounds);
        }

        @Override
        protected boolean onStateChange(@NonNull int[] state) {
            Drawable drawable = getDelegate();
            return drawable != null && drawable.setState(state);
        }

        @Override
        protected boolean onLevelChange(int level) {
            Drawable drawable = getDelegate();
            return drawable != null && drawable.setLevel(level);
        }

        @Override
        public boolean isStateful() {
            Drawable drawable = getDelegate();
            return drawable != null && drawable.isStateful();
        }

        @Override
        public int getIntrinsicWidth() {
            return getSettingsIconSize();
        }

        @Override
        public int getIntrinsicHeight() {
            return getSettingsIconSize();
        }

        @Override
        public void setAlpha(int alpha) {
            Drawable drawable = getDelegate();
            if (drawable != null) drawable.setAlpha(alpha);
        }

        @Override
        public void setColorFilter(ColorFilter colorFilter) {
            Drawable drawable = getDelegate();
            if (drawable != null) drawable.setColorFilter(colorFilter);
        }

        @Override
        public int getOpacity() {
            Drawable drawable = getDelegate();
            return drawable == null ? PixelFormat.TRANSPARENT : drawable.getOpacity();
        }
    }

    /**
     * Shows the selected splash in the activity's first rendered frame.
     *
     * <p>When the system-splash preference is enabled, the selected animation is already owned by
     * the Android 12 starting window and this overlay is deliberately skipped.</p>
     */
    public static void applySplashAnimation(Activity activity) {
        applySplashAnimation(activity, false);
    }

    /**
     * Applies the YouTube splash animation style to the custom branding overlay.
     *
     * <p>The style preference belongs to YouTube's splash patch and is intentionally not used by
     * YouTube Music. Music keeps its custom branding animation regardless of that preference.</p>
     */
    public static void applyYouTubeSplashAnimation(Activity activity) {
        applySplashAnimation(activity, true);
    }

    private static void applySplashAnimation(Activity activity, boolean useYouTubeSplashStyle) {
        if (activity == null
                || activity.isFinishing()
                || activity.isDestroyed()
                || (useYouTubeSplashStyle && isSplashAnimationDisabled())
                || (!useYouTubeSplashStyle && isMusicSplashAnimationDisabled())) {
            return;
        }

        try {
            String selectedIcon = SharedYouTubeSettings.CUSTOM_BRANDING_ICON.get();
            if ("original".equals(selectedIcon)) return;

            if (getSplashResourceIdentifier(activity, selectedIcon) == 0) return;

            // The persisted platform theme supplies this same drawable before application code
            // starts. On the first launch after upgrading from the broken implementation, retain
            // the controllable overlay once because the native theme could only be prepared after
            // Android had already created that launch's starting window.
            if (isSystemSplashEnabled(activity) && systemSplashThemePreparedBeforeLaunch) return;

            Runnable showOverlay = () -> {
                int identifier = getSplashResourceIdentifier(activity, selectedIcon);
                if (identifier == 0) return;

                Drawable drawable = activity.getResources().getDrawable(identifier);
                showSplashOverlay(activity, drawable, selectedIcon, useYouTubeSplashStyle);
            };

            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
                // Android 11 and earlier do not expose a splash exit callback. The hook is inserted
                // before the host onCreate body, so attach the overlay now and include it in the
                // host's first frame instead of waiting for a posted callback.
                showOverlay.run();
                return;
            }

            try {
                // The transferred system splash is above the activity decor. Add our overlay
                // during its exit callback, then remove it in the same handoff so no stock icon
                // or empty frame can appear between the two splash implementations.
                SplashScreenBridge.installExitHandoff(activity, showOverlay);
            } catch (Exception ignored) {
                // The posted overlay below remains the fallback if no splash was transferred.
            }

            // Warm launches may not receive a system splash exit callback. Posting also lets
            // YouTube publish its forced appearance before the initial background is resolved.
            activity.getWindow().getDecorView().post(showOverlay);
        } catch (Exception ignored) {
            // Keep the stock host splash if a generated resource is unavailable.
        }
    }

    /** Keeps Android 12 splash-screen classes out of the verifier path on older devices. */
    @RequiresApi(api = Build.VERSION_CODES.S)
    private static final class SplashScreenBridge {
        private SplashScreenBridge() {
        }

        private static void installExitHandoff(Activity activity, Runnable showOverlay) {
            activity.getSplashScreen().setOnExitAnimationListener(splashScreenView -> {
                try {
                    showOverlay.run();
                } finally {
                    splashScreenView.remove();
                }
            });
        }

        private static void resetTheme(Activity activity) {
            setTheme(activity, Resources.ID_NULL);
        }

        private static void setTheme(Activity activity, int themeId) {
            activity.getSplashScreen().setSplashScreenTheme(themeId);
        }

    }

    /**
     * Returns whether the selected custom splash can be rendered by Android 12's starting window.
     *
     * <p>The launcher alias is selected before application code starts, so this method is shared
     * by alias switching and the runtime overlay guard. If the selected branding has no splash
     * drawable, the controllable overlay remains the safe fallback.</p>
     */
    public static boolean isSystemSplashEnabled(Context context) {
        try {
            if (context == null
                    || Build.VERSION.SDK_INT < Build.VERSION_CODES.S
                    || !SharedYouTubeSettings.CUSTOM_BRANDING_USE_AS_SYSTEM_SPLASH.get()
                    || isSplashAnimationDisabled()
                    || isMusicSplashAnimationDisabled()) {
                return false;
            }

            String selectedIcon = SharedYouTubeSettings.CUSTOM_BRANDING_ICON.get();
            return !selectedIcon.isEmpty()
                    && !"original".equals(selectedIcon)
                    && getSplashResourceIdentifier(context, selectedIcon) != 0
                    && ResourceUtils.getIdentifier(
                            SYSTEM_SPLASH_STYLE_PREFIX + selectedIcon,
                            ResourceType.STYLE,
                            context) != 0;
        } catch (Exception ignored) {
            return false;
        }
    }

    /**
     * Resolves a generated theme-specific splash when one exists, falling back to the base splash.
     * The lookup uses YouTube's resolved appearance rather than Android's night qualifier because
     * YouTube can force light or dark mode independently of the device configuration.
     */
    private static int getSplashResourceIdentifier(Context context, String selectedIcon) {
        String theme = BaseThemeUtils.isDarkModeEnabled() ? "dark" : "light";
        int themedIdentifier = ResourceUtils.getIdentifier(
                SPLASH_RESOURCE_PREFIX + selectedIcon + "_" + theme,
                ResourceType.DRAWABLE,
                context);
        if (themedIdentifier != 0) return themedIdentifier;

        return ResourceUtils.getIdentifier(
                SPLASH_RESOURCE_PREFIX + selectedIcon,
                ResourceType.DRAWABLE,
                context);
    }

    private static void showSplashOverlay(
            Activity activity,
            Drawable drawable,
            String selectedIcon,
            boolean useYouTubeSplashStyle) {
        try {
            ViewGroup decor = (ViewGroup) activity.getWindow().getDecorView();
            if (decor.findViewWithTag(SPLASH_OVERLAY_TAG) != null) return;

            FrameLayout overlay = new FrameLayout(activity);
            overlay.setTag(SPLASH_OVERLAY_TAG);
            overlay.setClickable(true);
            int[] backgroundColor = {BaseThemeUtils.getAppBackgroundColor()};
            overlay.setBackgroundColor(backgroundColor[0]);

            ImageView image = new ImageView(activity);
            image.setImageDrawable(drawable);
            float splashScale = SharedYouTubeSettings.CUSTOM_BRANDING_SPLASH_ANIMATION_SIZE.get()
                    / 100.0f;
            image.setScaleX(splashScale);
            image.setScaleY(splashScale);
            if (useYouTubeSplashStyle && isSplashAnimationMonochrome()) {
                image.setColorFilter(MONOCHROME_SPLASH_FILTER);
            }
            image.setScaleType(ImageView.ScaleType.CENTER);
            overlay.addView(image, new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    Gravity.CENTER));
            decor.addView(overlay, new ViewGroup.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.MATCH_PARENT));

            // YouTube can publish its forced appearance after the first Activity callback. Keep
            // the splash aligned with that state instead of falling back to the device dark mode.
            Runnable syncBackground = new Runnable() {
                @Override
                public void run() {
                    if (overlay.getParent() == null) return;

                    int resolvedColor = BaseThemeUtils.getAppBackgroundColor();
                    if (backgroundColor[0] != resolvedColor) {
                        backgroundColor[0] = resolvedColor;
                        overlay.setBackgroundColor(resolvedColor);
                    }
                    overlay.postOnAnimation(this);
                }
            };
            overlay.postOnAnimation(syncBackground);

            Runnable removeOverlay = () -> {
                overlay.removeCallbacks(syncBackground);
                if (overlay.getParent() instanceof ViewGroup parent) {
                    parent.removeView(overlay);
                }
            };

            if (drawable instanceof AnimatedVectorDrawable animatedVector) {
                // Custom AVD durations are not known at compile time. Keep the overlay visible
                // until Android reports completion, with a timeout for malformed animations.
                animatedVector.registerAnimationCallback(new Animatable2.AnimationCallback() {
                    @Override
                    public void onAnimationEnd(Drawable ignored) {
                        overlay.post(removeOverlay);
                    }
                });
                animatedVector.start();
                overlay.postDelayed(removeOverlay, 5000L);
            } else {
                long duration = selectedIcon.startsWith("revancify") ? 1500L : 1000L;
                if (drawable instanceof Animatable) {
                    ((Animatable) drawable).start();
                } else {
                    AnimationSet animation = new AnimationSet(true);
                    animation.setDuration(duration);
                    animation.addAnimation(new AlphaAnimation(0.0f, 1.0f));
                    animation.addAnimation(new ScaleAnimation(
                            0.8f,
                            1.0f,
                            0.8f,
                            1.0f,
                            Animation.RELATIVE_TO_SELF,
                            0.5f,
                            Animation.RELATIVE_TO_SELF,
                            0.5f));
                    image.startAnimation(animation);
                }
                // Resources without AVD callbacks release offline startup after a fixed duration.
                overlay.postDelayed(removeOverlay, duration);
            }
        } catch (Exception ignored) {
            // Keep the stock splash if the activity window cannot host the overlay.
        }
    }

    /** Returns the selected in-app icon for notification small-icon hooks. */
    public static int getSmallIcon(int original) {
        try {
            Context context = Utils.getContext();
            if (context == null) return original;

            String selectedIcon = SharedYouTubeSettings.CUSTOM_BRANDING_ICON.get();
            if ("original".equals(selectedIcon)) return original;

            int identifier = ResourceUtils.getIdentifier(
                    NOTIFICATION_ICON_PREFIX + selectedIcon,
                    ResourceType.DRAWABLE,
                    context);
            return identifier == 0 ? original : identifier;
        } catch (Exception ignored) {
            return original;
        }
    }

    /** Removes the stock notification tint when a custom monochrome icon is selected. */
    public static int getColor(int original) {
        return getSmallIcon(original) == original ? original : Color.TRANSPARENT;
    }

    private static String[] getStringArray(Context context, String name) {
        try {
            int identifier = ResourceUtils.getIdentifier(name, ResourceType.ARRAY, context);
            return identifier == 0 ? new String[0] : context.getResources().getStringArray(identifier);
        } catch (Exception ignored) {
            return new String[0];
        }
    }

    @NonNull
    private static String getString(Context context, String name, @NonNull String fallback) {
        try {
            int identifier = ResourceUtils.getIdentifier(name, ResourceType.STRING, context);
            return identifier == 0 ? fallback : context.getResources().getString(identifier);
        } catch (Exception ignored) {
            return fallback;
        }
    }

    private static int parseInt(String value) {
        try {
            return Integer.parseInt(value);
        } catch (NumberFormatException ignored) {
            return 1;
        }
    }

    /**
     * Reads the existing YouTube splash-style preference without loading YouTube-only settings.
     * The branding runtime is shared with YouTube Music, where that settings class is absent.
     */
    private static String getSplashAnimationStyle() {
        try {
            return Setting.preferences.getString(
                    SPLASH_ANIMATION_STYLE_KEY, SPLASH_ANIMATION_STYLE_DEFAULT);
        } catch (Exception ignored) {
            return SPLASH_ANIMATION_STYLE_DEFAULT;
        }
    }

    private static boolean isSplashAnimationDisabled() {
        return SPLASH_ANIMATION_STYLE_DISABLED.equalsIgnoreCase(getSplashAnimationStyle());
    }

    private static boolean isSplashAnimationMonochrome() {
        String style = getSplashAnimationStyle();
        return SPLASH_ANIMATION_STYLE_60_BLACK_AND_WHITE.equalsIgnoreCase(style)
                || SPLASH_ANIMATION_STYLE_30_BLACK_AND_WHITE.equalsIgnoreCase(style);
    }

    /** Returns whether Music's existing Cairo animation toggle also disables the custom overlay. */
    private static boolean isMusicSplashAnimationDisabled() {
        try {
            return Setting.preferences.getBoolean(DISABLE_CAIRO_SPLASH_ANIMATION_KEY, false);
        } catch (Exception ignored) {
            return false;
        }
    }
}
