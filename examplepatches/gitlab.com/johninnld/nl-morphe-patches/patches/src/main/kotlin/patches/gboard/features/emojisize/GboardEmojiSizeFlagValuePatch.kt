package patches.gboard.features.emojisize

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardEmojiSizeFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Apply the user setting after the stock emoji_scale_supported result.",
    feature = GboardFlagFamilyFeature.CHANGE_EMOJI_SIZE,
)
