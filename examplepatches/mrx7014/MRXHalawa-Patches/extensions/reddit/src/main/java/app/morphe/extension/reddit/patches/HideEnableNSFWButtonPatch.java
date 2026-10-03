/*
 * Copyright 2026 MRX Halawa.
 * https://github.com/mrx7014/MRXHalawa-Patches
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */
package app.morphe.extension.reddit.patches;

@SuppressWarnings("unused")
public final class HideEnableNSFWButtonPatch {
    private HideEnableNSFWButtonPatch() {
    }

    /**
     * Injection point for Reddit's feature-flag resolver.
     *
     * Reddit has used several names for the setting over time. Keep the
     * matching intentionally narrow: only flags that describe an NSFW
     * enable/show/content control are disabled.
     */
    public static boolean hideEnableNSFWButton(String experimentName, boolean original) {
        if (experimentName == null) {
            return original;
        }

        String name = experimentName.toLowerCase(java.util.Locale.ROOT);
        boolean isNSFW = name.contains("nsfw") || name.contains("not_safe_for_work");
        boolean isEnableControl = name.contains("enable")
                || name.contains("show")
                || name.contains("content");
        return isNSFW && isEnableControl ? false : original;
    }
}
