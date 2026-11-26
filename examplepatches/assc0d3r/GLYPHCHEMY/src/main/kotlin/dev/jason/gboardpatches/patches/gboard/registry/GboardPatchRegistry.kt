package dev.jason.gboardpatches.patches.gboard.registry

import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.Patch
import dev.jason.gboardpatches.patches.gboard.features.editingaccesspoints.gboardEditingAccessPointsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.editingaccesspoints.gboardEditingAccessPointsLifecyclePatch
import app.morphe.patcher.patch.ResourcePatchBuilder
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.google.gson.GsonBuilder
import com.google.gson.JsonObject
import dev.jason.gboardpatches.patches.gboard.features.accessibilitylayout.gboardAccessibilityLayoutFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.accessibilitylayout.gboardAccessibilityLayoutFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.accesspointcount.gboardAccessPointCountFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.accesspointcount.gboardAccessPointCountFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu.gboardAccessPointsMenuFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.accesspointsmenu.gboardAccessPointsMenuFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.advancedvoice.gboardAdvancedVoiceFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.bluetoothmicrophone.gboardBluetoothMicrophoneFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.backuprestore.gboardBackupRestoreFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.backuprestore.gboardBackupRestoreManifestPatch
import dev.jason.gboardpatches.patches.gboard.features.calculator.gboardCalculatorFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.calculator.gboardCalculatorLifecyclePatch
import dev.jason.gboardpatches.patches.gboard.features.about.gboardAboutPageResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardCustomSymbolsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardAdapterTrimPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardColumnCountPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardItemBindPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardLoaderPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardPrunePatch
import dev.jason.gboardpatches.patches.gboard.features.clipboardcontentlimit.gboardClipboardContentLimitFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboardcontentlimit.gboardClipboardContentLimitFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.closeproactivesuggestions.gboardCloseProactiveSuggestionsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.closeproactivesuggestions.gboardCloseProactiveSuggestionsFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.developeroptions.gboardDeveloperOptionsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.cursortrackpad.gboardCursorTrackpadFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.cursortrackpad.gboardCursorTrackpadFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeAssetsPatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeManifestPatch
import dev.jason.gboardpatches.patches.gboard.features.customtheme.gboardCustomThemeOfficialImportPatch
import dev.jason.gboardpatches.patches.gboard.features.emojisize.gboardEmojiSizeFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.emojisize.gboardEmojiSizeFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.webclipboard.gboardWebClipboardAssetsPatch
import dev.jason.gboardpatches.patches.gboard.features.webclipboard.gboardWebClipboardCapturePatch
import dev.jason.gboardpatches.patches.gboard.features.webclipboard.gboardWebClipboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.webclipboard.gboardWebClipboardManifestPatch
import dev.jason.gboardpatches.patches.gboard.features.websearch.gboardFloatingWebSearchFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.websearch.gboardFloatingWebSearchManifestPatch
import dev.jason.gboardpatches.patches.gboard.features.englishqwerty.gboardEnglishUppercaseToggleFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardDeviceIntelligenceFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardDeviceIntelligenceFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardGrammarCheckerFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardGrammarCheckerFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardInlineSuggestionsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardInlineSuggestionsFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardKeyShapeSelectionFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardKeyShapeSelectionFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.lanftp.gboardLanFtpFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.lanftp.gboardLanFtpManifestPatch
import dev.jason.gboardpatches.patches.gboard.features.immersive.gboardEmojiKeyOnRightPatch
import dev.jason.gboardpatches.patches.gboard.features.immersive.gboardGlassPanelPatch
import dev.jason.gboardpatches.patches.gboard.features.immersive.gboardGlassPressEffectPatch
import dev.jason.gboardpatches.patches.gboard.features.immersive.gboardImmersiveKeyboardPatch
import dev.jason.gboardpatches.patches.gboard.features.immersive.gboardKeyMapperWatchdogPatch
import dev.jason.gboardpatches.patches.gboard.features.immersive.gboardThemeFollowsDarkModePatch
import dev.jason.gboardpatches.patches.gboard.features.immersive.gboardTranslucentBottomBarPatch
import dev.jason.gboardpatches.patches.gboard.features.ioslayout.gboardIosFlickLayoutPatch
import dev.jason.gboardpatches.patches.gboard.features.ioslayout.gboardIosQwertyLayoutPatch
import dev.jason.gboardpatches.patches.gboard.features.latinglobe.gboardLatinGlobeKeyIgnoreIntervalBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.latinglobe.gboardLatinGlobeKeyIgnoreIntervalFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.longpressquickactions.gboardLongPressQuickActionsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.manualincognito.gboardManualIncognitoFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.manualincognito.gboardManualIncognitoLifecyclePatch
import dev.jason.gboardpatches.patches.gboard.features.manualincognito.gboardManualIncognitoPolicyPatch
import dev.jason.gboardpatches.patches.gboard.features.ocr.gboardOcrFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.packagerename.applyGboardApplicationDisplayName
import dev.jason.gboardpatches.patches.gboard.features.packagerename.isValidGboardAppDisplayName
import dev.jason.gboardpatches.patches.gboard.features.quickinsert.gboardQuickInsertFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.quickinsert.gboardQuickInsertFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.roundedkeyboard.gboardRoundedKeyboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.frostedglass.gboardFrostedGlassFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.frostedglass.gboardFrostedGlassLifecyclePatch
import dev.jason.gboardpatches.patches.gboard.features.settingshomepage.gboardSettingsHomepageBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.settingshomepage.gboardSettingsHomepageFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.signaturebypass.gboardSignatureBypassBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.splitkeyboard.gboardSplitKeyboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.splitkeyboard.gboardSplitKeyboardAccessPointPatch
import dev.jason.gboardpatches.patches.gboard.features.splitkeyboard.gboardSplitKeyboardModePatch
import dev.jason.gboardpatches.patches.gboard.features.spacebarlogo.gboardSpacebarLogoFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.symbolfooter.gboardSymbolFooterOrderBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.symbolfooter.gboardSymbolFooterOrderFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.swipedismiss.gboardSwipeDismissBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.swipedismiss.gboardSwipeDismissFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.toprowswipe.gboardTopRowSwipeFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardCompatibility18_8
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch
import dev.jason.gboardpatches.patches.gboard.shared.accesspoint.gboardAccessPointContributions1803Patch
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardTargetAdmission
import dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow.gboardZhuyinBottomRowWeightFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow.gboardZhuyinBottomRowWeightSoftKeyPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import dev.jason.gboardpatches.patches.gboard.features.cursortrackpad.gboardCursorTrackpadPreferencePatch

@Suppress("unused")
val gboardLanguageModelVersionsPatch = gboardPublicResourcePatch(
    featureId = "language_model_versions",
    name = "Dictionaries & Predictions",
    description = "可選擇字典、預測及輸入修正的資源版本\nChoose resource versions for dictionaries, predictions, and input correction.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesSettingsPatch,
        dev.jason.gboardpatches.patches.gboard.features.languagemodels.gboardLanguageModelFeatureMarkerPatch,
        dev.jason.gboardpatches.patches.gboard.features.languagemodels.gboardLanguageModelResourcesPatch)
}

@Suppress("unused")
val gboardKeypressHapticsPatch = gboardPublicResourcePatch(
    featureId = "keypress_haptics",
    name = "Keypress Vibration Intensity Control",
    description = "將按鍵震動由持續時間改為力度控制。\nControl keypress vibration intensity instead of duration.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesSettingsPatch,
        dev.jason.gboardpatches.patches.gboard.features.keypresshaptics.gboardKeypressHapticsFeatureMarkerPatch,
        dev.jason.gboardpatches.patches.gboard.features.keypresshaptics.gboardKeypressHapticsFlagValuePatch)
}

private fun gboardPublicResourcePatch(
    featureId: String,
    name: String,
    description: String,
    default: Boolean,
    block: ResourcePatchBuilder.() -> Unit,
) = GboardTargetAdmission.admittedContributions(featureId).let { admitted ->
    resourcePatch(
        name = name.takeIf { admitted.isNotEmpty() },
        description = description,
        default = default,
    ) {
        if (admitted.isNotEmpty()) {
            block()
            GboardContributionWiring.wireAdmitted(featureId, admitted, this)
        }
    }
}

@Suppress("unused")
val gboardZhuyinSlideInputPatch = gboardPublicResourcePatch(
    featureId = "zhuyin_slide_input",
    name = "Zhuyin Slide Input",
    description = "注音鍵盤支持上下滑輸入\nEnable slide-up and slide-down input on the Zhuyin keyboard.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardAboutPageResourcePatch,
        gboardPatchesExtensionCarrierPatch,
    )
}

@Suppress("unused")
val gboardEnglishQwertySlideUppercaseTogglePatch = gboardPublicResourcePatch(
    featureId = "english_qwerty_up_flick_uppercase",
    name = "English QWERTY Flick Case",
    description = "英文 QWERTY 鍵盤上滑大寫、下滑小寫\nFlick up for uppercase and flick down for lowercase on the English QWERTY keyboard. Flicking down also overrides auto-capitalization.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardAboutPageResourcePatch,
        gboardPatchesSettingsPatch,
        gboardEnglishUppercaseToggleFeatureMarkerPatch,
    )
}

@Suppress("unused")
val gboardLongPressQuickActionsPatch = gboardPublicResourcePatch(
    featureId = "long_press_editing_shortcuts",
    name = "Long-Press Editing Shortcuts",
    description = "在英文 QWERTY 與注音鍵盤加入全選、復原、複製、剪下、貼上與重做長按快捷鍵\n" +
        "Add Select all, Undo, Copy, Cut, Paste, and Redo long-press shortcuts " +
        "to English QWERTY and Zhuyin.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardLongPressQuickActionsFeatureMarkerPatch,
    )
}

// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


@Suppress("unused")
val gboardFloatingWebSearchPatch = gboardPublicResourcePatch(
    featureId = "floating_web_search",
    name = "Floating Web Search",
    description = "直接從 Gboard 開啟懸浮網頁，快速搜尋需要的資訊。\n" +
        "Open a floating web page directly from Gboard to quickly search for the information you need.",
        default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardFloatingWebSearchFeatureMarkerPatch,
        gboardFloatingWebSearchManifestPatch,
        gboardAccessPointContributions1803Patch,
    )
}

// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


@Suppress("unused")
val gboardSwipeDismissPatch = gboardPublicResourcePatch(
    featureId = "swipe_down_to_dismiss_keyboard",
    name = "Swipe Down to Dismiss Keyboard",
    description = "從建議列或工具列向下滑動以關閉鍵盤。\n" +
        "Swipe down from the suggestions or toolbar to close the keyboard.",
    default = true,
) {
    // KeyboardViewHolder.dispatchTouchEvent(MotionEvent)Z is not obfuscated and keeps its six
    // registers on 18.8.0, so the interceptor needs no per-release target and only the gate.
    compatibleWith(gboardCompatibility18_8())

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardSwipeDismissFeatureMarkerPatch,
        gboardSwipeDismissBytecodePatch,
    )
}

@Suppress("unused")
val gboardAdvancedVoiceTypingPatch = gboardPublicResourcePatch(
    featureId = "advanced_voice_typing",
    name = "Advanced Voice Typing",
    description = "啟用進階語音輸入（包含自動標點功能），並另外為不支援進階語音輸入的繁體中文語音啟用自動標點\n" +
        "Enable Advanced Voice Typing with automatic punctuation, and separately enable automatic punctuation for Traditional Chinese voice typing, which does not support Advanced Voice Typing.",
    // Retargeted to the real 18.6.3 chain through GboardVersionBindings: native readiness
    // Lsmi;->a()Z, eligibility Lsmz;, formatter Lsgm;, model download Lsdx;(Context,Lsdy;,,Lacdy;),
    // journal Labue;->bJ, zh-TW callback Lsdw;, and the Leqn;->c:Leqh; config gate. Applies on
    // 18.6.3; not yet runtime-verified on a device, so the flag overrides stay best-effort.
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAdvancedVoiceFeatureMarkerPatch,
    )
}

@Suppress("unused")
val gboardBluetoothMicrophonePatch = gboardPublicResourcePatch(
    featureId = "use_bluetooth_microphone",
    name = "Use Bluetooth Microphone",
    description = "啟用 語音輸入 -> 使用藍芽麥克風\n" +
        "Enable Voice typing -> Use Bluetooth microphone.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardBluetoothMicrophoneFeatureMarkerPatch,
        gboardBluetoothMicrophoneFlagValuePatch,
    )
}

@Suppress("unused")
val gboardEmojiSizePatch = gboardPublicResourcePatch(
    featureId = "change_emoji_size",
    name = "Change emoji size",
    description = "變更表情符號大小\nChange emoji size.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardEmojiSizeFeatureMarkerPatch,
        gboardEmojiSizeFlagValuePatch,
    )
}

// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


@Suppress("unused")
val gboardAccessPointsMenuStylePatch = gboardPublicResourcePatch(
    featureId = "access_points_menu_style",
    name = "Access Points menu style",
    description = "切換新版或舊版 Access Points 選單樣式\n" +
        "Switch between the new and legacy Access Points menu styles.",
    // Not verified on Gboard 18.6.3: its fingerprints still resolve to the older
    // (mitigated) binding set and the patch refuses to apply. Kept disabled by default.
    // 18.6.3 moved the access-point menu onto Lmpq (fields p/r/k still match) but the menu
    // panel contract (Lmte/Lmtc + Lpms body id) no longer exists, so this needs a rewrite,
    // not a rebind. Disabled until that is done.
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAccessPointsMenuFeatureMarkerPatch,
        gboardAccessPointsMenuFlagValuePatch,
    )
}

@Suppress("unused")
val gboardSplitKeyboardPatch = gboardPublicResourcePatch(
    featureId = "enable_split_keyboard",
    name = "Enable split keyboard",
    description = "啟用分離式鍵盤\nEnable the split keyboard layout.",
        default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardSplitKeyboardFeatureMarkerPatch,
        gboardSplitKeyboardAccessPointPatch,
        gboardSplitKeyboardModePatch,
    )
}

@Suppress("unused")
val gboardAccessibilityLayoutPatch = gboardPublicResourcePatch(
    featureId = "enable_accessibility_layout",
    name = "Enable accessibility layout",
    description = "啟用無障礙鍵盤配置\nEnable accessibility layout.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAccessibilityLayoutFeatureMarkerPatch,
        gboardAccessibilityLayoutFlagValuePatch,
    )
}

// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


@Suppress("unused")
val gboardAccessPointCountPatch = gboardPublicResourcePatch(
    featureId = "access_point_count",
    name = "Top Toolbar Item Count",
    description = "自訂 Gboard 頂端工具列項目數量\n" +
        "Customize the Gboard top toolbar item count.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAccessPointCountFeatureMarkerPatch,
        gboardAccessPointCountFlagValuePatch,
    )
}

@Suppress("unused")
val gboardCloseProactiveSuggestionsPatch = gboardPublicResourcePatch(
    featureId = "close_proactive_suggestions",
    name = "Close Proactive Suggestions",
    description = "在主動建議列顯示關閉按鈕\n" +
        "Show a dismiss button in the proactive suggestions bar.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardCloseProactiveSuggestionsFeatureMarkerPatch,
        gboardCloseProactiveSuggestionsFlagValuePatch,
    )
}

// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


@Suppress("unused")
val gboardQuickInsertPatch = gboardPublicResourcePatch(
    featureId = "quick_insert",
    name = "Quick Insert",
    description = "啟用快速插入面板與工具列入口\n" +
        "Enable the Quick Insert panel and toolbar access point.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardQuickInsertFeatureMarkerPatch,
        gboardQuickInsertFlagValuePatch,
    )
}

@Suppress("unused")
val gboardZhuyinQuickTraditionalSimplifiedTogglePatch = gboardPublicResourcePatch(
    featureId = "zhuyin_quick_traditional_simplified_toggle",
    name = "Zhuyin Quick Traditional/Simplified Toggle",
    description = "注音 ㄥ 上滑快速切換繁簡\nSwipe up on Zhuyin ㄥ to quickly toggle Traditional and Simplified Chinese.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardZhuyinSlideInputPatch,
    )
}

@Suppress("unused")
val gboardCustomSymbolsPatch = gboardPublicResourcePatch(
    featureId = "custom_symbols",
    name = "Custom Symbols",
    description = "新增獨立的特殊符號分頁，長按逗號->愛心\nAdd a dedicated custom symbols tab and replace the long-press comma entry with a heart shortcut.",
    // Verified on Gboard 18.6.3 arm64: the provider/receiver wrapper is
    // Lpey; (KeyboardProviderReceiverWrapper, per its own log strings), the keyboard
    // wrapper Lpbw; is Lovs; ("KeyboardWrapper.onKeyboardReady"), metrics is
    // Lidl;->b(Lpwf;)Lxai; and the footer consumer is Lgve;. All six sub-patches apply.
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardAboutPageResourcePatch,
        gboardCustomSymbolsFeatureMarkerPatch,
    )
}

@Suppress("unused")
val gboardCustomTopRowSwipePatch = gboardPublicResourcePatch(
    featureId = "swipeable_custom_top_row",
    name = "Swipeable Custom Top Row",
    description = "滑動鍵盤第一排，在原生列與可自訂文字/JavaScript 列之間切換\nSwipe the keyboard top row to switch between the stock row and a customizable text/JavaScript row.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardTopRowSwipeFeatureMarkerPatch,
    )
}

@Suppress("unused")
val gboardDeveloperOptionsPatch = gboardPublicResourcePatch(
    featureId = "developer_options",
    name = "Developer options",
    description = "啟用 開發人員選項 與 Flag 編輯器，你可以自己修改Flag的值\nEnable Developer options and the Flag Editor, allowing you to modify flag values.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardDeveloperOptionsFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardBackupRestorePatch = gboardPublicResourcePatch(
    featureId = "backup_restore",
    name = "Backup & Restore",
    description = "匯出或還原全部 Patches 設定，並備份、比較及還原 Gboard PB/XML flag store\n" +
        "Export or restore all Patches settings, and back up, compare, or restore the Gboard PB/XML flag store.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardBackupRestoreFeatureMarkerPatch,
        gboardBackupRestoreManifestPatch,
    )
}

@Suppress("unused")
val gboardSymbolsFooterOrderPatch = gboardPublicResourcePatch(
    featureId = "emojis_stickers_gifs_tab_order",
    name = "Emojis, stickers & GIFs Tab Order",
    description = "自訂 Gboard「Emojis, stickers & GIFs」底部 tabs 的排序，支援拖曳調整\nCustomize the bottom tab order in Gboard's Emojis, stickers & GIFs panel with drag-and-drop reordering.",
        default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardSymbolFooterOrderFeatureMarkerPatch,
        gboardSymbolFooterOrderBytecodePatch
    )
}

// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


@Suppress("unused")
val gboardClipboardContentLimitPatch = gboardPublicResourcePatch(
    featureId = "clipboard_custom_character_limit",
    name = "Clipboard Custom Character Limit",
    description = "自訂每個文字剪貼簿項目的最大字元數\nCustomize the maximum character count for each text clipboard item.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardClipboardContentLimitFeatureMarkerPatch,
        gboardClipboardContentLimitFlagValuePatch
    )
}

// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


@Suppress("unused")
val gboardLanFtpServerPatch = gboardPublicResourcePatch(
    featureId = "lan_ftp_server",
    name = "FTP Server",
    description = "新增區域網路 FTP 伺服器，支援檔案瀏覽、傳輸與下載續傳\n" +
        "Add a LAN FTP server with file browsing, transfers, and download resume.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardLanFtpFeatureMarkerPatch,
        gboardLanFtpManifestPatch,
    )
}

@Suppress("unused")
val gboardDeviceIntelligencePatch = gboardPublicResourcePatch(
    featureId = "enable_inline_autofill_suggestions",
    name = "Enable Inline Autofill Suggestions",
    description = "啟用內嵌自動填入建議\nEnable Inline Autofill Suggestions",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardDeviceIntelligenceFlagValuePatch,
        gboardDeviceIntelligenceFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardGrammarCheckerFlagPatch = gboardPublicResourcePatch(
    featureId = "grammar_checker",
    name = "Grammar Checker",
    description = "啟用 修正和建議 > 文法檢查\nEnable Text correction > Grammar check.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardGrammarCheckerFlagValuePatch,
        gboardGrammarCheckerFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardInlineSuggestionsFlagPatch = gboardPublicResourcePatch(
    featureId = "inline_suggestions",
    name = "Inline Suggestions",
    description = "啟用 修正和建議 > 智慧撰寫\nEnable Text correction > Smart Compose.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardInlineSuggestionsFlagValuePatch,
        gboardInlineSuggestionsFeatureMarkerPatch
    )
}

// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


@Suppress("unused")
val gboardSettingsHomepagePatch = gboardPublicResourcePatch(
    featureId = "settings_homepage_override",
    name = "Settings Homepage Override",
    description = "允許切換新版或舊版 Gboard 設定頁面\nAllow switching between the new and legacy Gboard settings pages.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardSettingsHomepageFeatureMarkerPatch,
        gboardSettingsHomepageBytecodePatch
    )
}

@Suppress("unused")
val gboardLatinGlobeKeyIgnoreIntervalPatch = gboardPublicResourcePatch(
    featureId = "latin_globe_key_ignore_interval",
    name = "Latin Globe Key Ignore Interval",
    description = "新增英文鍵盤地球鍵忽略時間覆寫，可獨立控制輸入後切語言延遲\nAdd an independent English globe key ignore interval override for post-typing language-switch delay.",
    // Not verified on Gboard 18.6.3: its fingerprints still resolve to the older
    // (mitigated) binding set and the patch refuses to apply. Kept disabled by default.
    // LatinIme->Q()Lykz is the 18.6.3 globe factory, but Lykz has several float fields and
    // nothing marks which one is the ignore interval; guessing would silently change the
    // keyboard delay. Disabled until the field is confirmed.
    default = false
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardLatinGlobeKeyIgnoreIntervalFeatureMarkerPatch,
        gboardLatinGlobeKeyIgnoreIntervalBytecodePatch
    )
}

@Suppress("unused")
val gboardZhuyinBottomRowWeightPatch = gboardPublicResourcePatch(
    featureId = "zhuyin_bottom_row_key_sizes",
    name = "Zhuyin Bottom Row Key Sizes",
    description = "調整注音鍵盤底排按鍵大小\nAdjust Zhuyin keyboard bottom-row key sizes.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardZhuyinBottomRowWeightFeatureMarkerPatch,
        gboardZhuyinBottomRowWeightSoftKeyPatch
    )
}

// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.


// Duplicate of a patch already shipped by the ported suite: this registration was
// removed so the bundle exposes a single implementation of the feature.



// ---------------------------------------------------------------------------
// Patches that used to be registered from the second, forked copy of this suite
// (src/main/kotlin/patches). They are declared here so every feature has exactly
// one implementation: the forked tree was removed so a fix can no longer land in
// a copy that nothing compiles into the bundle.
// ---------------------------------------------------------------------------
private fun gboardDirectResourcePatch(
    name: String,
    description: String,
    default: Boolean,
    block: ResourcePatchBuilder.() -> Unit,
) = resourcePatch(
    name = name,
    description = description,
    default = default,
) {
    block()
}

@Suppress("unused")
val gboardClipboardEnhancementsPublicPatch = gboardDirectResourcePatch(
    name = "Clipboard Enhancements",
    description = "Enhance clipboard retention time, item count limit, preview lines, countdown/creation time labels, order index, and column count.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardAboutPageResourcePatch,
        gboardPatchesSettingsPatch,
        gboardClipboardFeatureMarkerPatch,
        gboardClipboardLoaderPatch,
        gboardClipboardPrunePatch,
        gboardClipboardColumnCountPatch,
        gboardClipboardAdapterTrimPatch,
        gboardClipboardItemBindPatch,
    )
}

@Suppress("unused")
val gboardWebClipboardPatch = gboardDirectResourcePatch(
    name = "Web Clipboard",
    description = "Add the phone-hosted Web Clipboard with browser sync, pairing, and a Quick Settings Tile.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardWebClipboardFeatureMarkerPatch,
        gboardWebClipboardManifestPatch,
        gboardWebClipboardAssetsPatch,
        gboardWebClipboardCapturePatch,
    )
}

@Suppress("unused")
val gboardEditingAccessPointsPatch = gboardDirectResourcePatch(
    name = "Toolbar Editing Buttons",
    description = "Add Select All, Copy, Cut and Paste to the menu.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardEditingAccessPointsFeatureMarkerPatch,
        gboardEditingAccessPointsLifecyclePatch,
        gboardAccessPointContributions1803Patch,
    )
}

@Suppress("unused")
val gboardCursorTrackpadPatch = gboardDirectResourcePatch(
    name = "Cursor trackpad mode",
    description = "Long-press the space bar to use cursor trackpad and lock modes.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardCursorTrackpadFeatureMarkerPatch,
        gboardCursorTrackpadFlagValuePatch,
        gboardCursorTrackpadPreferencePatch,
    )
}

@Suppress("unused")
val gboardManualIncognitoModePatch = gboardDirectResourcePatch(
    name = "Incognito Mode Toggle",
    description = "Add an Incognito toggle to the Access Point toolbar and configure clipboard and voice typing availability while Incognito mode is active.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardManualIncognitoFeatureMarkerPatch,
        gboardManualIncognitoLifecyclePatch,
        gboardManualIncognitoPolicyPatch,
        gboardAccessPointContributions1803Patch,
    )
}

@Suppress("unused")
val gboardSimpleCalculatorPatch = gboardDirectResourcePatch(
    name = "Simple Calculator",
    description = "Type an expression and show a scrollable equation plus its answer in Gboard's suggestion row.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardCalculatorFeatureMarkerPatch,
        gboardCalculatorLifecyclePatch,
    )
}

// The iOS layouts are resource-only patches: they replace keyboard definition XML and the layouts it
// includes. The keyboard-definition cache keeps the parsed definitions across updates, so both
// depend on the cache refresh to show up on an update of an already patched install.
@Suppress("unused")
val gboardIosQwertyLayoutPublicPatch = gboardDirectResourcePatch(
    name = "iOS QWERTY layout",
    description = "Puts the globe key of the letter keyboards at the bottom left, where it is on the " +
        "Japanese 12-key keyboards, and lays out the English symbol keyboard like the iOS \"123\" and " +
        "\"#+=\" pages. Gboard's number row setting keeps working.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardIosQwertyLayoutPatch)
}

@Suppress("unused")
val gboardIosFlickLayoutPublicPatch = gboardDirectResourcePatch(
    name = "iOS flick layout",
    description = "Changes the Japanese 12-key keyboard to the layout of iOS with \"flick only\" enabled: " +
        "123, ABC and あいう keys and the globe key on the left, and backspace, space and a two-row " +
        "enter key on the right.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardIosFlickLayoutPatch)
}

// Ported from JacksonJones2003/immersive-keyboard-patches (GPLv3). The drawing and theme hooks
// live in that project's runtime extension, bundled here as extensions/immersive-keyboard.mpe.
@Suppress("unused")
val gboardImmersiveKeyboardPublicPatch = gboardDirectResourcePatch(
    name = "Immersive Keyboard",
    description = "Extends the keyboard under the camera cutout in landscape instead of leaving " +
        "an empty strip beside it.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardImmersiveKeyboardPatch)
}

@Suppress("unused")
val gboardEmojiKeyOnRightPublicPatch = gboardDirectResourcePatch(
    name = "Emoji Key On Right",
    description = "Moves the dedicated emoji key from the left of the spacebar to just left of " +
        "the enter / search key.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardEmojiKeyOnRightPatch)
}

@Suppress("unused")
val gboardTranslucentBottomBarPublicPatch = gboardDirectResourcePatch(
    name = "Translucent Bottom Bar",
    description = "Makes the bar under the keyboard (behind the globe and close buttons) match the " +
        "keyboard's color, opacity and blur, for use with transparent themes such as Frosted Glass.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardTranslucentBottomBarPatch)
}

@Suppress("unused")
val gboardGlassPanelPublicPatch = gboardDirectResourcePatch(
    name = "Glass Panel",
    description = "Turns the translucent keyboard panel into glass, with the system's own glass " +
        "material on vivo OriginOS and lit edges and a sheen elsewhere. Keys are left as they are. " +
        "Works on top of Translucent Bottom Bar and Frosted Glass.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardGlassPanelPatch)
}

@Suppress("unused")
val gboardGlassPressEffectPublicPatch = gboardDirectResourcePatch(
    name = "Glass Press Effect",
    description = "Adds vivo-style liquid glass touch feedback: a soft light blooms out from your " +
        "finger across the keyboard background, and the keys around your finger dip and spring back.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardGlassPressEffectPatch)
}

@Suppress("unused")
val gboardThemeFollowsDarkModePublicPatch = gboardDirectResourcePatch(
    name = "Theme Follows Dark Mode",
    description = "Adds a \"Light & dark pair\" menu to the top of Gboard's Themes screen, so the " +
        "keyboard switches theme when the system dark mode changes. It can switch the wallpaper " +
        "between a light and a dark image too.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardThemeFollowsDarkModePatch)
}

@Suppress("unused")
val gboardKeyMapperWatchdogPublicPatch = gboardDirectResourcePatch(
    name = "Key Mapper Watchdog",
    description = "Uses Shizuku to restart Key Mapper's Expert Mode system bridge when it stops. " +
        "Lets Gboard run shell commands, so only use it if you want this.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardKeyMapperWatchdogPatch)
}

object GboardPublishedPatchCatalog {
    val morpheRegistrations: Set<Patch> = linkedSetOf(
        gboardZhuyinSlideInputPatch,
        gboardEnglishQwertySlideUppercaseTogglePatch,
        gboardLongPressQuickActionsPatch,
        gboardFloatingWebSearchPatch,
        gboardSwipeDismissPatch,
        gboardAdvancedVoiceTypingPatch,
        gboardBluetoothMicrophonePatch,
        gboardEmojiSizePatch,
        gboardAccessPointsMenuStylePatch,
        gboardSplitKeyboardPatch,
        gboardAccessibilityLayoutPatch,
        gboardAccessPointCountPatch,
        gboardCloseProactiveSuggestionsPatch,
        gboardQuickInsertPatch,
        gboardZhuyinQuickTraditionalSimplifiedTogglePatch,
        gboardCustomSymbolsPatch,
        gboardCustomTopRowSwipePatch,
        gboardBackupRestorePatch,
        gboardDeveloperOptionsPatch,
        gboardSymbolsFooterOrderPatch,
        gboardClipboardContentLimitPatch,
        gboardLanFtpServerPatch,
        gboardDeviceIntelligencePatch,
        gboardGrammarCheckerFlagPatch,
        gboardInlineSuggestionsFlagPatch,
        gboardLanguageModelVersionsPatch,
        gboardKeypressHapticsPatch,
        gboardSettingsHomepagePatch,
        gboardLatinGlobeKeyIgnoreIntervalPatch,
        gboardZhuyinBottomRowWeightPatch,
        gboardIosQwertyLayoutPublicPatch,
        gboardIosFlickLayoutPublicPatch,
        gboardImmersiveKeyboardPublicPatch,
        gboardEmojiKeyOnRightPublicPatch,
        gboardTranslucentBottomBarPublicPatch,
        gboardGlassPanelPublicPatch,
        gboardGlassPressEffectPublicPatch,
        gboardThemeFollowsDarkModePublicPatch,
        gboardKeyMapperWatchdogPublicPatch,
    ).filterTo(linkedSetOf()) { patch -> patch.name != null }

    fun publishedInventory(version: String): String {
        val publishedPatches = morpheRegistrations.sortedBy { patch -> patch.name }.map { patch ->
            PublishedPatch(
                name = patch.name!!,
                description = patch.description,
                use = patch.default,
                dependencies = patch.dependencies.mapNotNull { dependency -> dependency.name }.sorted(),
                compatiblePackages = patch.compatibility?.mapNotNull { compatibility ->
                    compatibility.publishedPackageVersions()
                }?.toMap(),
                options = patch.options.values.map { option ->
                    PublishedPatch.Option(
                        key = option.key,
                        title = option.title,
                        description = option.description,
                        required = option.required,
                        type = option.type.toString(),
                        default = option.default,
                        values = option.values,
                    )
                },
            )
        }
        val gson = GsonBuilder()
            .serializeNulls()
            .disableHtmlEscaping()
            .setPrettyPrinting()
            .create()
        val inventory = JsonObject().apply {
            addProperty("version", version)
            add("patches", gson.toJsonTree(publishedPatches))
        }

        return gson.toJson(inventory) + "\n"
    }

    // Keeps the published package-to-versions shape that patcher 2.x no longer exposes:
    // stable targets win over experimental ones, and any version-less target means all versions.
    private fun Compatibility.publishedPackageVersions(): Pair<String, Set<String>?>? {
        val packageName = packageName ?: return null
        val listedTargets = targets.filter { target -> !target.isExperimental }.ifEmpty { targets }
        if (listedTargets.isEmpty() || listedTargets.any { target -> target.version == null }) {
            return packageName to null
        }
        return packageName to listedTargets.mapTo(linkedSetOf()) { target -> target.version!! }
    }

    private class PublishedPatch(
        val name: String,
        val description: String?,
        val use: Boolean,
        val dependencies: List<String>,
        val compatiblePackages: Map<String, Set<String>?>?,
        val options: List<Option>,
    ) {
        class Option(
            val key: String,
            val title: String?,
            val description: String?,
            val required: Boolean,
            val type: String,
            val default: Any?,
            val values: Map<String, Any?>?,
        )
    }
}
