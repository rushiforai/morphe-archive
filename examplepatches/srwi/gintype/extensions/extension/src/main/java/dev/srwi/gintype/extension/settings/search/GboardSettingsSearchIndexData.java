package dev.srwi.gintype.extension.settings.search;

import dev.srwi.gintype.extension.R;

final class GboardSettingsSearchIndexData {
    private GboardSettingsSearchIndexData() {
    }

    static final String[][] PATHS = {
            {"dev.srwi.gintype.extension.multiglide.GboardMultiGlideSettingsFeature"},
            {"dev.srwi.gintype.extension.multiglide.GboardMultiGlideSettingsFeature",
                    "dev.srwi.gintype.extension.multiglide.GboardKineticaSettingsFeature"},
            {"dev.srwi.gintype.extension.multiglide.GboardMultiGlideSettingsFeature",
                    "dev.srwi.gintype.extension.multiglide.GboardMultiGlideDiagnosticsFeature"},
            {"dev.srwi.gintype.extension.thicctopbar.GboardThiccTopBarSettingsFeature"}
    };

    static final int[][] ENTRIES = {
            {0, R.string.gboard_patches_multiglide_title, R.string.gboard_patches_multiglide_summary, 1},
            {0, R.string.gboard_patches_multiglide_enabled_title, R.string.gboard_patches_multiglide_enabled_summary, 0},
            {0, R.string.gboard_patches_multiglide_combine_enabled_title, R.string.gboard_patches_multiglide_combine_enabled_summary, 0},
            {0, R.string.gboard_patches_multiglide_combine_delay_title, R.string.gboard_patches_multiglide_combine_delay_summary, 0},
            {0, R.string.gboard_patches_multiglide_tap_to_multiglide_enabled_title, R.string.gboard_patches_multiglide_tap_to_multiglide_enabled_summary, 0},
            {0, R.string.gboard_patches_multiglide_tap_to_multiglide_delay_title, R.string.gboard_patches_multiglide_tap_to_multiglide_delay_summary, 0},
            {0, R.string.gboard_patches_multiglide_smart_tap_swipe_split_enabled_title, R.string.gboard_patches_multiglide_smart_tap_swipe_split_enabled_summary, 0},
            {0, R.string.gboard_patches_multiglide_backspace_mode_title, R.string.gboard_patches_multiglide_backspace_mode_summary, 0},
            {0, R.string.gboard_patches_multiglide_auto_space_title, R.string.gboard_patches_multiglide_auto_space_summary, 0},
            {0, R.string.gboard_patches_multiglide_space_placement_title, R.string.gboard_patches_multiglide_space_placement_summary, 0},
            {0, R.string.gboard_patches_multiglide_auto_space_delay_title, R.string.gboard_patches_multiglide_auto_space_delay_summary, 0},
            {0, R.string.gboard_patches_multiglide_spacebar_timer_indicator_title, R.string.gboard_patches_multiglide_spacebar_timer_indicator_summary, 0},
            {0, R.string.gboard_patches_multiglide_word_ready_vibration_title, R.string.gboard_patches_multiglide_word_ready_vibration_summary, 0},
            {1, R.string.gboard_patches_kinetica_title, R.string.gboard_patches_kinetica_summary, 1},
            {1, R.string.gboard_patches_multiglide_beam_width_title, R.string.gboard_patches_multiglide_beam_width_summary, 0},
            {1, R.string.gboard_patches_multiglide_freq_weight_floor_title, R.string.gboard_patches_multiglide_freq_weight_floor_summary, 0},
            {1, R.string.gboard_patches_multiglide_geo_exponent_title, R.string.gboard_patches_multiglide_geo_exponent_summary, 0},
            {1, R.string.gboard_patches_multiglide_beam_freq_weight_title, R.string.gboard_patches_multiglide_beam_freq_weight_summary, 0},
            {1, R.string.gboard_patches_kinetica_reset_title, R.string.gboard_patches_kinetica_reset_summary, 0},
            {2, R.string.gboard_patches_multiglide_section_diagnostics, R.string.gboard_patches_multiglide_diagnostics_summary, 1},
            {2, R.string.gboard_patches_multiglide_trace_logging_title, R.string.gboard_patches_multiglide_trace_logging_summary, 0},
            {2, R.string.gboard_patches_multiglide_trace_export_title, R.string.gboard_patches_multiglide_trace_export_summary, 0},
            {2, R.string.gboard_patches_multiglide_trace_clear_title, R.string.gboard_patches_multiglide_trace_clear_summary, 0},
            {3, R.string.gboard_patches_thicc_top_bar_title, R.string.gboard_patches_thicc_top_bar_summary, 1},
            {3, R.string.gboard_patches_thicc_top_bar_enable_title, R.string.gboard_patches_thicc_top_bar_summary, 0},
            {3, R.string.gboard_patches_thicc_top_bar_topbar_scale_title, R.string.gboard_patches_thicc_top_bar_topbar_scale_summary, 0},
            {3, R.string.gboard_patches_thicc_top_bar_swipe_sensitivity_title, R.string.gboard_patches_thicc_top_bar_swipe_sensitivity_summary, 0},
            {3, R.string.gboard_patches_thicc_top_bar_invert_swipe_title, R.string.gboard_patches_thicc_top_bar_invert_swipe_summary, 0},
            {3, R.string.gboard_patches_thicc_top_bar_multi_word_select_title, R.string.gboard_patches_thicc_top_bar_multi_word_select_summary, 0}
    };
}
