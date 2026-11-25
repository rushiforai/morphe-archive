package patches.gboard.features.addsymbols

import patches.gboard.shared.GboardSoftKeyFamilyFeature
import patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val gboardZhuyinCustomSymbolsEntryPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "Inject the jasondev_symbol entry into the comma long-press popup.",
    feature = GboardSoftKeyFamilyFeature.CUSTOM_SYMBOLS,
)
