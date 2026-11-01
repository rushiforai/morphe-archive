package dev.jason.gboardpatches.patches.gboard.features.clipboardcontentlimit

import dev.jason.gboardpatches.patches.gboard.shared.GboardFlagFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardClipboardContentLimitFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "在 text_clip_item_char_limit 原始結果後套用使用者設定值",
    feature = GboardFlagFamilyFeature.CLIPBOARD_CUSTOM_CHARACTER_LIMIT,
)
