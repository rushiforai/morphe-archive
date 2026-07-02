package dev.jason.gboardpatches.patches.gboard.registry

import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.gboard.features.about.gboardAboutPageResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsCorpusPatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsEmoticonStatePatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsEntryPatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardCustomSymbolsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsHistoryPatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsRecyclerPatch
import dev.jason.gboardpatches.patches.gboard.features.addsymbols.gboardZhuyinCustomSymbolsRoutingPatch
import dev.jason.gboardpatches.patches.gboard.features.chinesevoice.gboardChineseOnlineVoiceBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.chinesevoice.gboardChineseOnlineVoiceResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardAdapterTrimPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardColumnCountPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardItemBindPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardLoaderPatch
import dev.jason.gboardpatches.patches.gboard.features.clipboard.gboardClipboardPrunePatch
import dev.jason.gboardpatches.patches.gboard.features.webclipboard.gboardWebClipboardAssetsPatch
import dev.jason.gboardpatches.patches.gboard.features.webclipboard.gboardWebClipboardCapturePatch
import dev.jason.gboardpatches.patches.gboard.features.webclipboard.gboardWebClipboardFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.webclipboard.gboardWebClipboardManifestPatch
import dev.jason.gboardpatches.patches.gboard.features.englishqwerty.gboardEnglishUppercaseToggleFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.englishqwerty.gboardEnglishQwertySlideResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.englishqwerty.gboardEnglishQwertySoftKeyPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardClipboardEntityExtractionFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardClipboardItemEditFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardDeviceIntelligenceFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardFeatureFlagsBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardGrammarCheckerFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardInlineSuggestionsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.featureflags.gboardKeyShapeSelectionFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.latinglobe.gboardLatinGlobeKeyIgnoreIntervalBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.latinglobe.gboardLatinGlobeKeyIgnoreIntervalFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.packagerename.gboardPackageRenameResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.settingshomepage.gboardSettingsHomepageBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.settingshomepage.gboardSettingsHomepageFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.signaturebypass.gboardSignatureBypassBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.symbolfooter.gboardSymbolFooterOrderBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.symbolfooter.gboardSymbolFooterOrderFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.toprowswipe.gboardTopRowSwipeFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.toprowswipe.gboardTopRowSwipeGesturePatch
import dev.jason.gboardpatches.patches.gboard.features.toprowswipe.gboardTopRowSwipePointerPatch
import dev.jason.gboardpatches.patches.gboard.features.toprowswipe.gboardTopRowSwipeSoftKeyPatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsDependencyPatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsFlagValuePatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsOfficialPreferencesPatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsSettingsVisibilityPatch
import dev.jason.gboardpatches.patches.gboard.features.writingtools.gboardAiWritingToolsSignalPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesSettingsPatch
import dev.jason.gboardpatches.patches.gboard.features.undoredoaccesspoint.gboardUndoRedoAccessPointBytecodePatch
import dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow.gboardZhuyinBottomRowWeightFeatureMarkerPatch
import dev.jason.gboardpatches.patches.gboard.features.zhuyinbottomrow.gboardZhuyinBottomRowWeightSoftKeyPatch
import dev.jason.gboardpatches.patches.gboard.features.zhuyinslide.gboardZhuyinSlidePointerAnchorPatch
import dev.jason.gboardpatches.patches.gboard.features.zhuyinslide.gboardZhuyinSlideResourcePatch
import dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle.gboardZhuyinTraditionalSimplifiedToggleRuntimePatch
import dev.jason.gboardpatches.patches.gboard.features.zhuyintraditionalsimplifiedtoggle.gboardZhuyinTraditionalSimplifiedToggleSoftKeyPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

@Suppress("unused")
val gboardZhuyinSlideInputPatch = resourcePatch(
    name = "Zhuyin Slide Input",
    description = "注音鍵盤支持上下滑輸入\nEnable slide-up and slide-down input on the Zhuyin keyboard.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardAboutPageResourcePatch,
        gboardZhuyinSlideResourcePatch,
        gboardZhuyinSlidePointerAnchorPatch
    )
}

@Suppress("unused")
val gboardEnglishQwertySlideUppercaseTogglePatch = resourcePatch(
    name = "English QWERTY Up-Flick Uppercase",
    description = "英文 QWERTY 鍵盤上滑大小寫\nFlick up on the English QWERTY keyboard to toggle uppercase and lowercase.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardAboutPageResourcePatch,
        gboardPatchesSettingsPatch,
        gboardEnglishUppercaseToggleFeatureMarkerPatch,
        gboardEnglishQwertySlideResourcePatch,
        gboardEnglishQwertySoftKeyPatch
    )
}

@Suppress("unused")
val gboardZhuyinQuickTraditionalSimplifiedTogglePatch = resourcePatch(
    name = "Zhuyin Quick Traditional/Simplified Toggle",
    description = "注音 ㄥ 上滑快速切換繁簡\nSwipe up on Zhuyin ㄥ to quickly toggle Traditional and Simplified Chinese.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardZhuyinSlideInputPatch,
        gboardTopRowSwipeGesturePatch,
        gboardZhuyinTraditionalSimplifiedToggleSoftKeyPatch,
        gboardZhuyinTraditionalSimplifiedToggleRuntimePatch
    )
}

@Suppress("unused")
val gboardCustomSymbolsPatch = resourcePatch(
    name = "Custom Symbols",
    description = "新增獨立的特殊符號分頁，長按逗號->愛心\nAdd a dedicated custom symbols tab and replace the long-press comma entry with a heart shortcut.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardAboutPageResourcePatch,
        gboardCustomSymbolsFeatureMarkerPatch,
        gboardZhuyinCustomSymbolsEntryPatch,
        gboardZhuyinCustomSymbolsCorpusPatch,
        gboardZhuyinCustomSymbolsRoutingPatch,
        gboardZhuyinCustomSymbolsEmoticonStatePatch,
        gboardZhuyinCustomSymbolsHistoryPatch,
        gboardZhuyinCustomSymbolsRecyclerPatch
    )
}

@Suppress("unused")
val gboardCustomTopRowSwipePatch = resourcePatch(
    name = "Swipeable Custom Top Row",
    description = "滑動鍵盤第一排，在原生列與可自訂文字/JavaScript 列之間切換\nSwipe the keyboard top row to switch between the stock row and a customizable text/JavaScript row.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardTopRowSwipeFeatureMarkerPatch,
        gboardTopRowSwipeSoftKeyPatch,
        gboardTopRowSwipePointerPatch,
        gboardTopRowSwipeGesturePatch
    )
}

@Suppress("unused")
val gboardSymbolsFooterOrderPatch = resourcePatch(
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

@Suppress("unused")
val gboardUndoRedoAccessPointPatch = resourcePatch(
    name = "Enable Undo/Redo feature",
    description = "啟用 Undo/Redo 功能\nEnable the Undo/Redo feature.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardUndoRedoAccessPointBytecodePatch
    )
}

@Suppress("unused")
val gboardChineseOnlineVoiceInputPatch = resourcePatch(
    name = "Chinese Online Voice Input",
    description = "強制啟用中文語音\nForce-enable Chinese voice input.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardAboutPageResourcePatch,
        gboardChineseOnlineVoiceResourcePatch,
        gboardChineseOnlineVoiceBytecodePatch
    )
}

@Suppress("unused")
val gboardClipboardEnhancementsPatch = resourcePatch(
    name = "Clipboard Enhancements",
    description = "增強剪貼簿的保留時間、數量上限、預覽行數、倒數/建立時間、順序編號與欄數\nEnhance clipboard retention time, item count limit, preview lines, countdown/creation time labels, order index, and column count.",
    default = true
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
        gboardClipboardItemBindPatch
    )
}

@Suppress("unused")
val gboardWebClipboardPatch = resourcePatch(
    name = "Web Clipboard",
    description = "新增手機自架的 Web Clipboard，支援瀏覽器同步、配對碼與快速設定開關\nAdd the phone-hosted Web Clipboard with browser sync, pairing, and a Quick Settings Tile.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardWebClipboardFeatureMarkerPatch,
        gboardWebClipboardManifestPatch,
        gboardWebClipboardAssetsPatch,
        gboardWebClipboardCapturePatch
    )
}

@Suppress("unused")
val gboardClipboardEntityExtractionFlagPatch = resourcePatch(
    name = "Clipboard Entity Extraction",
    description = "啟用 剪貼簿 > 顯示從最近複製文字中攝取的資訊，例如地址、電話號碼和其他項目\nEnable Clipboard > Show addresses, phone numbers, and other items pulled from recently copied text.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardFeatureFlagsBytecodePatch,
        gboardClipboardEntityExtractionFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardClipboardItemEditFlagPatch = resourcePatch(
    name = "Clipboard Item Edit",
    description = "長按 剪貼簿 顯示編輯\nEnable Edit when long-pressing a clipboard item.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardFeatureFlagsBytecodePatch,
        gboardClipboardItemEditFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardDeviceIntelligencePatch = resourcePatch(
    name = "Enable Inline Autofill Suggestions",
    description = "啟用內嵌自動填入建議 / Enable Inline Autofill Suggestions",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardFeatureFlagsBytecodePatch,
        gboardDeviceIntelligenceFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardGrammarCheckerFlagPatch = resourcePatch(
    name = "Grammar Checker",
    description = "啟用 修正和建議 > 文法檢查\nEnable Text correction > Grammar check.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardFeatureFlagsBytecodePatch,
        gboardGrammarCheckerFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardInlineSuggestionsFlagPatch = resourcePatch(
    name = "Inline Suggestions",
    description = "啟用 修正和建議 > 智慧撰寫\nEnable Text correction > Smart Compose.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardFeatureFlagsBytecodePatch,
        gboardInlineSuggestionsFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardKeyShapeSelectionFlagPatch = resourcePatch(
    name = "Key Shape Selection",
    description = "啟用圓角按鍵，主題詳情 > 按鍵形狀\nEnable Key shape in Theme details.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesExtensionCarrierPatch,
        gboardFeatureFlagsBytecodePatch,
        gboardKeyShapeSelectionFeatureMarkerPatch
    )
}

@Suppress("unused")
val gboardAiWritingToolsPatch = resourcePatch(
    name = "AI Writing Tools",
    description = "啟用 AI 撰寫工具，支援所有語言\nEnable AI writing tools with support for all languages.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardAiWritingToolsFeatureMarkerPatch,
        gboardAiWritingToolsSettingsVisibilityPatch,
        gboardAiWritingToolsFlagValuePatch,
        gboardAiWritingToolsSignalPatch,
        gboardAiWritingToolsOfficialPreferencesPatch,
        gboardAiWritingToolsDependencyPatch
    )
}

@Suppress("unused")
val gboardSettingsHomepagePatch = resourcePatch(
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
val gboardLatinGlobeKeyIgnoreIntervalPatch = resourcePatch(
    name = "Latin Globe Key Ignore Interval",
    description = "新增英文鍵盤地球鍵忽略時間覆寫，可獨立控制輸入後切語言延遲\nAdd an independent English globe key ignore interval override for post-typing language-switch delay.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPatchesSettingsPatch,
        gboardLatinGlobeKeyIgnoreIntervalFeatureMarkerPatch,
        gboardLatinGlobeKeyIgnoreIntervalBytecodePatch
    )
}

@Suppress("unused")
val gboardZhuyinBottomRowWeightPatch = resourcePatch(
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

@Suppress("unused")
val gboardPackageRenamePatch = resourcePatch(
    name = "Package Rename",
    description = "將套件名稱改成 dev.jason.com.google.android.inputmethod.latin 以便共存安裝\nRename the package to dev.jason.com.google.android.inputmethod.latin so it can be installed alongside the official Gboard.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardPackageRenameResourcePatch
    )
}

@Suppress("unused")
val gboardSignatureBypassPatch = resourcePatch(
    name = "Add Gboard Signature Bypass",
    description = "攔截 Gboard 的簽章白名單檢查並強制通過\nBypass Gboard signature whitelist checks and force them to pass.",
    default = true
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(
        gboardSignatureBypassBytecodePatch
    )
}
