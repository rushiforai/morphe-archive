/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3287
 * https://github.com/MorpheApp/morphe-patches/pull/3451
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-25
 */

package app.morphe.extension.youtube.videoplayer;

import android.graphics.drawable.Drawable;

import androidx.annotation.Nullable;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import app.morphe.extension.shared.utils.Logger;
import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.utils.PlayerControlsPatch;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Picks the player icon for the selected style, a suffix on the base name such as {@code morphe_reload_video_fluent}.
 * A style does not have to cover every icon, a missing variant falls back to what {@link Style#AUTO} shows.
 */
public final class PlayerIcons {

    public enum Style {
        AUTO(null),
        REGULAR(""),
        BOLD("_bold"),
        FLUENT("_fluent"),
        PHOSPHOR("_phosphor"),
        PHOSPHOR_LIGHT("_phosphor_light"),
        PHOSPHOR_FILL("_phosphor_fill"),
        PHOSPHOR_DUOTONE("_phosphor_duotone"),
        IONICONS("_ionicons"),
        SHARP("_sharp"),
        // Icons of a zip file given to the patch, so any of them can be missing.
        CUSTOM("_custom");

        @Nullable
        public final String suffix;

        Style(@Nullable String suffix) {
            this.suffix = suffix;
        }
    }

    // Follows the thin or bold buttons the player itself shows, not the style of the settings screens.
    private static final String AUTO_SUFFIX = PlayerControlsPatch.restoreOldPlayerButtons() ? "" : "_bold";

    // Buttons keep the drawable they were created with, so a style change only applies after a restart.
    private static final Style STYLE = Settings.PLAYER_ICON_STYLE.get();

    // Some buttons resolve their icon on every tap.
    private static final Map<String, String> names = new ConcurrentHashMap<>();

    private PlayerIcons() {
    }

    /**
     * @return Drawable name of a player button icon.
     */
    public static String name(String baseName) {
        return names.computeIfAbsent(baseName, base -> resolve(STYLE, base));
    }

    public static int id(String baseName) {
        return ResourceUtils.getIdentifierOrThrow(name(baseName), ResourceType.DRAWABLE);
    }

    /**
     * For an icon the app sets from code, such as play and pause.
     *
     * @return The selected style variant of {@code baseName}, or null to keep the app icon.
     */
    @Nullable
    public static Drawable styledDrawable(String baseName) {
        String styled = styledVariant(STYLE, baseName);
        if (styled == null) return null;

        try {
            return Utils.getContext().getDrawable(
                    ResourceUtils.getIdentifierOrThrow(styled, ResourceType.DRAWABLE));
        } catch (Exception ex) {
            Logger.printException(() -> "Could not load player icon: " + styled, ex);
            return null;
        }
    }

    /**
     * For an icon the app itself provides in the thin and bold styles.
     *
     * @return Drawable name of the selected style variant of {@code baseName},
     *         or the app icon that matches the thin or bold style.
     */
    public static String name(String baseName, String appRegularName, String appBoldName) {
        String styled = styledVariant(STYLE, baseName);
        if (styled != null) return styled;

        final boolean useRegular = STYLE == Style.REGULAR
                || (STYLE != Style.BOLD && AUTO_SUFFIX.isEmpty());
        return useRegular ? appRegularName : appBoldName;
    }

    public static String resolve(Style style, String baseName) {
        String styled = styledVariant(style, baseName);
        if (styled != null) return styled;

        String auto = baseName + AUTO_SUFFIX;
        if (exists(auto)) return auto;

        return baseName;
    }

    @Nullable
    private static String styledVariant(Style style, String baseName) {
        if (style.suffix == null) return null;

        String styled = baseName + style.suffix;
        return exists(styled) ? styled : null;
    }

    public static boolean exists(String drawableName) {
        return ResourceUtils.getIdentifier(drawableName, ResourceType.DRAWABLE) != 0;
    }
}
