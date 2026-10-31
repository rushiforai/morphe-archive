package com.nmnvan.patches.thescore.scorecast

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.nmnvan.patches.thescore.settings.settingsPatch
import com.nmnvan.patches.thescore.shared.Constants.COMPATIBILITY_THESCORE
import com.nmnvan.patches.thescore.shared.Constants.EXTENSION_PACKAGE
import com.nmnvan.patches.thescore.shared.filterReturnedObjects
import com.nmnvan.patches.thescore.shared.isFrom
import com.nmnvan.patches.thescore.shared.setExtensionIsPatchIncluded

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/patches/ScorecastPatch;"

/**
 * The Scorecast (matchup) page is built from per-sport strategy classes in MatchupPageStrategy.kt.
 * Each has getters returning the ordered list of block types (an enum); the page builder adds one
 * block per entry. Filtering those lists removes whole blocks.
 */
private const val STRATEGY_SOURCE_FILE = "MatchupPageStrategy.kt"

@Suppress("unused")
val hideScorecastBlocksPatch = bytecodePatch(
    name = "Hide Scorecast blocks",
    description = "Adds options in Morphe Settings to hide blocks on a game's Scorecast tab, such as Game News and Odds.",
    default = true
) {
    compatibleWith(COMPATIBILITY_THESCORE)

    dependsOn(settingsPatch)

    execute {
        setExtensionIsPatchIncluded(EXTENSION_CLASS)

        val strategyClasses = buildList { classDefForEach { if (it.isFrom(STRATEGY_SOURCE_FILE)) add(it) } }

        var hooked = 0
        strategyClasses.forEach { classDef ->
            val getters = classDef.methods.filter { method ->
                method.returnType == "Ljava/util/List;" &&
                    method.parameterTypes.isEmpty() &&
                    method.implementation != null
            }
            if (getters.isEmpty()) return@forEach

            mutableClassDefBy(classDef).methods
                .filter { mutable -> getters.any { it.name == mutable.name && it.parameterTypes.isEmpty() } }
                .forEach { getter ->
                    getter.filterReturnedObjects(
                        "$EXTENSION_CLASS->filterBlocks(Ljava/util/List;)Ljava/util/List;"
                    )
                    hooked++
                }
        }

        if (hooked == 0) throw PatchException("No Scorecast strategy getters found in $STRATEGY_SOURCE_FILE")
    }
}
