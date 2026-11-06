/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3287
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-10-24
 */

package app.morphe.extension.youtube.patches.shortsicons;

import androidx.annotation.Nullable;

import app.morphe.extension.shared.utils.ResourceType;
import app.morphe.extension.shared.utils.ResourceUtils;
import app.morphe.extension.youtube.settings.Settings;

/**
 * Picks the Shorts action button icon for the selected style, a suffix on the base name such as
 * {@code morphe_shorts_heart_fluent}. A missing variant falls back to the icon of the app.
 */
public final class ShortsIcons {

    public enum Style {
        AUTO(null),
        FLUENT("_fluent"),
        PHOSPHOR("_phosphor"),
        PHOSPHOR_LIGHT("_phosphor_light"),
        PHOSPHOR_DUOTONE("_phosphor_duotone"),
        IONICONS("_ionicons"),
        SHARP("_sharp");

        @Nullable
        public final String suffix;

        Style(@Nullable String suffix) {
            this.suffix = suffix;
        }
    }

    // Buttons keep the drawable they were created with, so a style change only applies after a restart.
    private static final Style STYLE = Settings.SHORTS_ICON_STYLE.get();

    private ShortsIcons() {
    }

    /**
     * @return Drawable name of the selected style variant of {@code baseName}, or {@code appName}.
     */
    public static String resolve(String baseName, String appName) {
        return resolve(STYLE, baseName, appName);
    }

    public static String resolve(Style style, String baseName, String appName) {
        if (style.suffix == null) return appName;

        String styled = baseName + style.suffix;
        return exists(styled) ? styled : appName;
    }

    public static boolean exists(String drawableName) {
        return ResourceUtils.getIdentifier(ResourceType.DRAWABLE, drawableName) != 0;
    }
}
