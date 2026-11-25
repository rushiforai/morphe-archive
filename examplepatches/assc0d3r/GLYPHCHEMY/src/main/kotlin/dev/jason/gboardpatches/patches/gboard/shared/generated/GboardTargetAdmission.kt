package dev.jason.gboardpatches.patches.gboard.shared.generated

import app.morphe.patcher.patch.ApkFileType

internal object GboardTargetAdmission {
    const val targetVersion = "18.6.3"
    const val profileVersion = "1.7.0"
    const val projectionSha256 = "ce992bb07dcf0fe4735746ce133cb9f43f91d42159da9ce3dec751f358778e4c"
    const val packageName = "com.google.android.inputmethod.latin"
    val apkFileType = ApkFileType.APK
    val signatures = setOf("7ce83c1b71f3d572fed04c8d40c5cb10ff75e6d87d9df6fbd53f0468c2905053", "f0fd6c5b410f25cb25c3b53346c8972fae30f8ee7411df910480ad6b2d60db83")
    val versionNames = listOf("18.6.3.1002251336-release-arm64-v8a")

    val admittedContributionIdsByFeature: Map<String, Set<String>> = mapOf(
        "access_point_count" to setOf("access_point_count.flag"),
        "access_points_menu_style" to setOf("access_points_menu_style.bytecode", "access_points_menu_style.flag"),
        "add_gboard_signature_bypass" to setOf("add_gboard_signature_bypass.bytecode"),
        "advanced_voice_typing" to setOf("advanced_voice_typing.bytecode", "advanced_voice_typing.flag"),
        "ai_writing_tools" to setOf("ai_writing_tools.flag", "ai_writing_tools.preference_observer"),
        "backup_restore" to setOf("backup_restore.resources"),
        "change_emoji_size" to setOf("change_emoji_size.flag"),
        "clipboard_custom_character_limit" to setOf("clipboard_custom_character_limit.flag"),
        "clipboard_enhancements" to setOf("clipboard_enhancements.bytecode"),
        "close_proactive_suggestions" to setOf("close_proactive_suggestions.flag"),
        "custom_symbols" to setOf("custom_symbols.bytecode", "custom_symbols.soft_key"),
        "custom_theme" to setOf("custom_theme.bytecode_and_resources"),
        "developer_options" to setOf("developer_options.resources"),
        "editing_access_points" to setOf("editing_access_points.runtime"),
        "emojis_stickers_gifs_tab_order" to setOf("emojis_stickers_gifs_tab_order.bytecode"),
        "enable_accessibility_layout" to setOf("enable_accessibility_layout.flag"),
        "enable_cursor_trackpad_mode" to setOf("enable_cursor_trackpad_mode.flag", "enable_cursor_trackpad_mode.preferences"),
        "enable_inline_autofill_suggestions" to setOf("enable_inline_autofill_suggestions.flag"),
        "enable_ocr_scan_text" to setOf("enable_ocr_scan_text.bytecode", "enable_ocr_scan_text.flag"),
        "enable_split_keyboard" to setOf("enable_split_keyboard.bytecode"),
        "english_qwerty_up_flick_uppercase" to setOf("english_qwerty_up_flick_uppercase.pointer", "english_qwerty_up_flick_uppercase.soft_key"),
        "floating_web_search" to setOf("floating_web_search.access_point"),
        "frosted_glass" to setOf("frosted_glass.lifecycle"),
        "g_logo_on_spacebar" to setOf("g_logo_on_spacebar.after_bind", "g_logo_on_spacebar.before_bind"),
        "grammar_checker" to setOf("grammar_checker.flag"),
        "incognito_mode_toggle" to setOf("incognito_mode_toggle.bytecode"),
        "inline_suggestions" to setOf("inline_suggestions.flag"),
        "key_shape_selection" to setOf("key_shape_selection.flag"),
        "keypress_haptics" to setOf("keypress_haptics.flag"),
        "lan_ftp_server" to setOf("lan_ftp_server.resources"),
        "language_model_versions" to setOf("language_model_versions.cache", "language_model_versions.decoder", "language_model_versions.flag", "language_model_versions.hmm"),
        "latin_globe_key_ignore_interval" to setOf("latin_globe_key_ignore_interval.bytecode"),
        "long_press_editing_shortcuts" to setOf("long_press_editing_shortcuts.gesture", "long_press_editing_shortcuts.input_event", "long_press_editing_shortcuts.pointer", "long_press_editing_shortcuts.soft_key"),
        "package_rename" to setOf("package_rename.resources"),
        "quick_insert" to setOf("quick_insert.flag"),
        "rounded_keyboard_panel" to setOf("rounded_keyboard_panel.admission", "rounded_keyboard_panel.style"),
        "settings_homepage_override" to setOf("settings_homepage_override.bytecode"),
        "simple_calculator" to setOf("simple_calculator.lifecycle"),
        "swipe_down_to_dismiss_keyboard" to setOf("swipe_down_to_dismiss_keyboard.dispatch"),
        "swipeable_custom_top_row" to setOf("swipeable_custom_top_row.gesture", "swipeable_custom_top_row.pointer", "swipeable_custom_top_row.soft_key", "swipeable_custom_top_row.soft_key_after"),
        "use_bluetooth_microphone" to setOf("use_bluetooth_microphone.flag"),
        "web_clipboard" to setOf("web_clipboard.bytecode"),
        "zhuyin_bottom_row_key_sizes" to setOf("zhuyin_bottom_row_key_sizes.soft_key"),
        "zhuyin_quick_traditional_simplified_toggle" to setOf("zhuyin_quick_traditional_simplified_toggle.gesture", "zhuyin_quick_traditional_simplified_toggle.popup", "zhuyin_quick_traditional_simplified_toggle.soft_key", "zhuyin_quick_traditional_simplified_toggle.soft_key_after"),
        "zhuyin_slide_input" to setOf("zhuyin_slide_input.pointer", "zhuyin_slide_input.soft_key"),
    )

    fun admittedContributions(featureId: String): Set<String> =
        admittedContributionIdsByFeature[featureId].orEmpty()
}
