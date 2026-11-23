package dev.jason.gboardpatches.extension.betafeatures;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import dev.jason.gboardpatches.extension.R;

/**
 * One row per beta gate, in the order the screen shows them.  The flag names are the switches
 * {@link GboardBetaFlagRuntime} intercepts; the strings say what each one unlocks.
 */
public final class GboardBetaFeatureCatalog {
    public static final class Entry {
        public final String flagName;
        public final int titleRes;
        public final int summaryRes;

        Entry(String flagName, int titleRes, int summaryRes) {
            this.flagName = flagName;
            this.titleRes = titleRes;
            this.summaryRes = summaryRes;
        }
    }

    private static final List<Entry> ENTRIES = Collections.unmodifiableList(Arrays.asList(
            new Entry(
                    GboardBetaFlagRuntime.PLAIN_TEXT_QUICK_PASTE_CHIP_FLAG,
                    R.string.gboard_patches_beta_flag_quick_paste_title,
                    R.string.gboard_patches_beta_flag_quick_paste_summary),
            new Entry(
                    GboardBetaFlagRuntime.CLIPBOARD_FLOATING_CHIP_FLAG,
                    R.string.gboard_patches_beta_flag_floating_chip_title,
                    R.string.gboard_patches_beta_flag_floating_chip_summary),
            new Entry(
                    GboardBetaFlagRuntime.INVISIBLE_FLOATING_RESIZE_FLAG,
                    R.string.gboard_patches_beta_flag_floating_resize_title,
                    R.string.gboard_patches_beta_flag_floating_resize_summary),
            new Entry(
                    GboardBetaFlagRuntime.EMOJI2_FLAG,
                    R.string.gboard_patches_beta_flag_emoji2_title,
                    R.string.gboard_patches_beta_flag_emoji2_summary),
            new Entry(
                    GboardBetaFlagRuntime.REMOVE_SUGGESTION_V2_FLAG,
                    R.string.gboard_patches_beta_flag_remove_v2_title,
                    R.string.gboard_patches_beta_flag_remove_v2_summary)));

    private GboardBetaFeatureCatalog() {
    }

    public static List<Entry> entries() {
        return ENTRIES;
    }
}
