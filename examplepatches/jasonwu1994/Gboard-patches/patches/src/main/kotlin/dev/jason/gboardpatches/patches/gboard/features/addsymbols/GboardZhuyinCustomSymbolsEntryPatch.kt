package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import dev.jason.gboardpatches.patches.gboard.shared.GboardSoftKeyFamilyFeature
import dev.jason.gboardpatches.patches.gboard.shared.gboardSoftKeyFamilyFeaturePatch

internal val gboardZhuyinCustomSymbolsEntryPatch = gboardSoftKeyFamilyFeaturePatch(
    description = "對注音逗號長按 popup 注入 jasondev_symbol 入口。",
    feature = GboardSoftKeyFamilyFeature.CUSTOM_SYMBOLS,
)
