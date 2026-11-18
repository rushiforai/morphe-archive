package patches.gboard.registry

import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.ResourcePatchBuilder
import patches.gboard.features.accesspointsmenu.gboardAccessPointsMenu1853Patch
import patches.gboard.features.accesspointsmenu.gboardAccessPointsMenuFlagValuePatch
import patches.gboard.features.cursortrackpad.gboardCursorTrackpadFlagValuePatch
import patches.gboard.features.cursortrackpad.gboardCursorTrackpadPreferencePatch
import patches.gboard.features.writingtools.gboardAiWritingToolsFlagValuePatch
import patches.gboard.features.writingtools.gboardAiWritingTools1853PreferenceObserverPatch
import patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsCorpusPatch
import patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsEmoticonStatePatch
import patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsEntryPatch
import patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsHistoryPatch
import patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsRecyclerPatch
import patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsRoutingPatch
import patches.gboard.features.advancedvoice.gboardAdvancedVoice1803ZhTwPatch
import patches.gboard.features.advancedvoice.gboardAdvancedVoiceFlagValuePatch
import patches.gboard.features.englishqwerty.gboardEnglishQwertyPointerPatch
import patches.gboard.features.englishqwerty.gboardEnglishQwertySoftKeyPatch
import patches.gboard.features.longpressquickactions.gboardLongPressQuickActionsInputEventPatch
import patches.gboard.features.longpressquickactions.gboardLongPressQuickActionsGesturePatch
import patches.gboard.features.longpressquickactions.gboardLongPressQuickActionsPointerOwnerPatch
import patches.gboard.features.longpressquickactions.gboardLongPressQuickActionsSoftKeyPatch
import patches.gboard.features.ocr.gboardOcrFlagValuePatch
import patches.gboard.features.ocr.gboardOcrRuntimePatch
import patches.gboard.features.rambler.gboardRambler1803OfficialSelectorPatch
import patches.gboard.features.roundedkeyboard.gboardRoundedKeyboardBytecodePatch
import patches.gboard.features.spacebarlogo.gboardSpacebarLogoSoftKeyPatch
import patches.gboard.features.toprowswipe.gboardTopRowSwipeGesturePatch
import patches.gboard.features.toprowswipe.gboardTopRowSwipePointerPatch
import patches.gboard.features.toprowswipe.gboardTopRowSwipeSoftKeyPatch
import patches.gboard.features.zhuyinslide.gboardZhuyinSlidePointerAnchorPatch
import patches.gboard.features.zhuyinslide.gboardZhuyinSlideSoftKeyPatch
import patches.gboard.features.zhuyintraditionalsimplifiedtoggle.gboardZhuyinTraditionalSimplifiedToggleGesturePatch
import patches.gboard.features.zhuyintraditionalsimplifiedtoggle.gboardZhuyinTraditionalSimplifiedTogglePopupPatch
import patches.gboard.features.zhuyintraditionalsimplifiedtoggle.gboardZhuyinTraditionalSimplifiedToggleSoftKeyPatch

import patches.gboard.features.languagemodels.gboardLanguageModelFlagValuePatch
import patches.gboard.features.languagemodels.gboardLanguageModelCachePatch
import patches.gboard.features.languagemodels.gboardLanguageModelHmmPatch
import patches.gboard.features.languagemodels.gboardLanguageModelDecoderPatch

internal class GboardContributionWiringUnit(
    val contributionIds: Set<String>,
    private val dependencySupplier: () -> Array<Patch<*>>,
) {
    fun dependencies(): Array<Patch<*>> = dependencySupplier()
}

internal object GboardContributionWiring {
    private val unitsByFeature = mapOf(
        "language_model_versions" to listOf(
            unit("language_model_versions.flag") { arrayOf(gboardLanguageModelFlagValuePatch) },
            unit("language_model_versions.cache") { arrayOf(gboardLanguageModelCachePatch) },
            unit("language_model_versions.hmm") { arrayOf(gboardLanguageModelHmmPatch) },
            unit("language_model_versions.decoder") { arrayOf(gboardLanguageModelDecoderPatch) },
        ),
        "ai_writing_tools" to listOf(
            unit("ai_writing_tools.flag") { arrayOf(gboardAiWritingToolsFlagValuePatch) },
            unit("ai_writing_tools.preference_observer") { arrayOf(gboardAiWritingTools1853PreferenceObserverPatch) },
        ),
        "access_points_menu_style" to listOf(
            unit("access_points_menu_style.flag") { arrayOf(gboardAccessPointsMenuFlagValuePatch) },
            unit("access_points_menu_style.bytecode") { arrayOf(gboardAccessPointsMenu1853Patch) },
        ),
        "enable_cursor_trackpad_mode" to listOf(
            unit("enable_cursor_trackpad_mode.flag") { arrayOf(gboardCursorTrackpadFlagValuePatch) },
            unit("enable_cursor_trackpad_mode.preferences") { arrayOf(gboardCursorTrackpadPreferencePatch) },
        ),
        "advanced_voice_typing" to listOf(
            unit("advanced_voice_typing.flag") {
                arrayOf(gboardAdvancedVoiceFlagValuePatch)
            },
            unit("advanced_voice_typing.bytecode") {
                arrayOf(
                    gboardAdvancedVoice1803ZhTwPatch,
                    gboardRambler1803OfficialSelectorPatch,
                )
            },
        ),
        "custom_symbols" to listOf(
            unit("custom_symbols.soft_key") {
                arrayOf(gboardZhuyinCustomSymbolsEntryPatch)
            },
            unit("custom_symbols.bytecode") {
                arrayOf(
                    gboardZhuyinCustomSymbolsCorpusPatch,
                    gboardZhuyinCustomSymbolsRoutingPatch,
                    gboardZhuyinCustomSymbolsEmoticonStatePatch,
                    gboardZhuyinCustomSymbolsHistoryPatch,
                    gboardZhuyinCustomSymbolsRecyclerPatch,
                )
            },
        ),
        "enable_ocr_scan_text" to listOf(
            unit("enable_ocr_scan_text.flag") {
                arrayOf(gboardOcrFlagValuePatch)
            },
            unit("enable_ocr_scan_text.bytecode") {
                arrayOf(gboardOcrRuntimePatch)
            },
        ),
        "english_qwerty_up_flick_uppercase" to listOf(
            unit("english_qwerty_up_flick_uppercase.soft_key") {
                arrayOf(gboardEnglishQwertySoftKeyPatch)
            },
            unit("english_qwerty_up_flick_uppercase.pointer") {
                arrayOf(gboardEnglishQwertyPointerPatch)
            },
        ),
        "g_logo_on_spacebar" to listOf(
            unit(
                "g_logo_on_spacebar.before_bind",
                "g_logo_on_spacebar.after_bind",
            ) {
                arrayOf(gboardSpacebarLogoSoftKeyPatch)
            },
        ),
        "long_press_editing_shortcuts" to listOf(
            unit("long_press_editing_shortcuts.soft_key") {
                arrayOf(gboardLongPressQuickActionsSoftKeyPatch)
            },
            unit("long_press_editing_shortcuts.input_event") {
                arrayOf(gboardLongPressQuickActionsInputEventPatch)
            },
            unit("long_press_editing_shortcuts.pointer") {
                arrayOf(gboardLongPressQuickActionsPointerOwnerPatch)
            },
            unit("long_press_editing_shortcuts.gesture") {
                arrayOf(gboardLongPressQuickActionsGesturePatch)
            },
        ),
        "rounded_keyboard_panel" to listOf(
            unit(
                "rounded_keyboard_panel.admission",
                "rounded_keyboard_panel.style",
            ) {
                arrayOf(gboardRoundedKeyboardBytecodePatch)
            },
        ),
        "swipeable_custom_top_row" to listOf(
            unit(
                "swipeable_custom_top_row.soft_key",
                "swipeable_custom_top_row.soft_key_after",
            ) {
                arrayOf(gboardTopRowSwipeSoftKeyPatch)
            },
            unit("swipeable_custom_top_row.pointer") {
                arrayOf(gboardTopRowSwipePointerPatch)
            },
            unit("swipeable_custom_top_row.gesture") {
                arrayOf(gboardTopRowSwipeGesturePatch)
            },
        ),
        "zhuyin_quick_traditional_simplified_toggle" to listOf(
            unit("zhuyin_quick_traditional_simplified_toggle.gesture") {
                arrayOf(gboardZhuyinTraditionalSimplifiedToggleGesturePatch)
            },
            unit(
                "zhuyin_quick_traditional_simplified_toggle.soft_key",
                "zhuyin_quick_traditional_simplified_toggle.soft_key_after",
            ) {
                arrayOf(gboardZhuyinTraditionalSimplifiedToggleSoftKeyPatch)
            },
            unit("zhuyin_quick_traditional_simplified_toggle.popup") {
                arrayOf(gboardZhuyinTraditionalSimplifiedTogglePopupPatch)
            },
        ),
        "zhuyin_slide_input" to listOf(
            unit("zhuyin_slide_input.soft_key") {
                arrayOf(gboardZhuyinSlideSoftKeyPatch)
            },
            unit("zhuyin_slide_input.pointer") {
                arrayOf(gboardZhuyinSlidePointerAnchorPatch)
            },
        ),
    )

    val registeredContributionIdsByFeature: Map<String, Set<String>> =
        unitsByFeature.mapValues { (_, units) ->
            units.flatMapTo(linkedSetOf()) { unit -> unit.contributionIds }
        }

    fun activeContributionIds(featureId: String, admitted: Set<String>): Set<String> =
        activeUnits(featureId, admitted).flatMapTo(linkedSetOf()) { unit -> unit.contributionIds }

    fun wireAdmitted(
        featureId: String,
        admitted: Set<String>,
        builder: ResourcePatchBuilder,
    ) {
        activeUnits(featureId, admitted).forEach { unit ->
            builder.dependsOn(*unit.dependencies())
        }
    }

    private fun activeUnits(
        featureId: String,
        admitted: Set<String>,
    ): List<GboardContributionWiringUnit> {
        val units = unitsByFeature[featureId] ?: return emptyList()
        val registeredIds = units.flatMapTo(linkedSetOf()) { unit -> unit.contributionIds }
        check(admitted.all { contributionId -> contributionId in registeredIds }) {
            "$featureId admits unregistered contribution IDs ${(admitted - registeredIds).sorted()}"
        }
        units.forEach { unit ->
            val admittedUnitIds = unit.contributionIds.intersect(admitted)
            check(admittedUnitIds.isEmpty() || admittedUnitIds == unit.contributionIds) {
                "$featureId partially admits indivisible execution unit " +
                    "${unit.contributionIds.sorted()}: ${admittedUnitIds.sorted()}"
            }
        }
        return units.filter { unit -> unit.contributionIds.all(admitted::contains) }
    }

    private fun unit(
        vararg contributionIds: String,
        dependencySupplier: () -> Array<Patch<*>>,
    ) = GboardContributionWiringUnit(contributionIds.toSet(), dependencySupplier)
}
