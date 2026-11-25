package patches.gboard.features.advancedvoice

import patches.gboard.shared.GboardFlagFamilyFeature
import patches.gboard.shared.gboardFlagFamilyFeaturePatch

internal val gboardAdvancedVoiceFlagValuePatch = gboardFlagFamilyFeaturePatch(
    description = "Apply the Advanced Voice and Rambler typed policy after the stock flag getter.",
    feature = GboardFlagFamilyFeature.ADVANCED_VOICE_TYPING,
)
