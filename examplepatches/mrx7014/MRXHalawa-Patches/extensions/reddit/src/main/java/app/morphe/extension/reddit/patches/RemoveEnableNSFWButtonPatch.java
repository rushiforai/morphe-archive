/*
 * Copyright 2026 MRX Halawa.
 * https://github.com/mrx7014/MRXHalawa-Patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */
package app.morphe.extension.reddit.patches;

import java.util.Locale;

@SuppressWarnings("unused")
public final class RemoveEnableNSFWButtonPatch {
    private RemoveEnableNSFWButtonPatch() {
    }

    /**
     * Injection point for Reddit's feature-flag resolver.
     *
     * This is intentionally not backed by a Morphe setting: when the patch is
     * included, the Enable NSFW control is always disabled and is not rendered.
     */
    public static boolean removeEnableNSFWButton(String experimentName, boolean original) {
        if (experimentName == null) {
            return original;
        }

        String name = experimentName.toLowerCase(Locale.ROOT);
        boolean isNSFW = name.contains("nsfw")
                || name.contains("not_safe_for_work")
                || name.contains("adult_content")
                || name.contains("adultcontent");
        boolean isEnableControl = name.contains("enable")
                || name.contains("show")
                || name.contains("content")
                || name.contains("setting")
                || name.contains("button");
        return isNSFW && isEnableControl ? false : original;
    }
}
