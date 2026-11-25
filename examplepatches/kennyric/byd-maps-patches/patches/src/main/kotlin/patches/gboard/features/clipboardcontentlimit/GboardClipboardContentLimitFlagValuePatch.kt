package patches.gboard.features.clipboardcontentlimit

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardClipboardContentLimitFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Apply the user setting after the stock text_clip_item_char_limit result.",
    feature = GboardFlagFamilyFeature.CLIPBOARD_CUSTOM_CHARACTER_LIMIT,
)
