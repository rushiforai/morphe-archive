/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.pinterest.misc.extension.handleTargets
import app.morphe.patches.pinterest.misc.extension.parameterRegister
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.settings.settingsPatch

internal const val FEED_FILTER = "$EXTENSION_PACKAGE/ads/FeedFilter;"

// The shared hook fails for whichever list patch was selected, so its messages name both.
private const val PATCH = "Feed list filter (Hide ads, Hide AI-labeled pins)"

private const val LIST = "Ljava/util/List;"

/** How many of the three list holders the last run hooked. The family patches read it after this one runs. */
internal var feedListHoldersHooked = 0
    private set

/**
 * Passes the items each list holder is built with through `FeedFilter.filter`, first thing in its
 * constructor, so what a family drops never reaches Pinterest's adapters. A holder whose class
 * isn't in a build is warned about and skipped; a build with none of the three stops the patch.
 */
internal val feedListHookPatch = bytecodePatch {
    dependsOn(settingsPatch, pinterestExtensionPatch)

    execute {
        // A run that stops below must not leave the last run's count for the family patches.
        feedListHoldersHooked = 0
        val holders: List<Pair<Fingerprint, String>> = listOf(
            FeedToStringFingerprint to "feed",
            PagedResponseToStringFingerprint to "paged response",
            ModelListToStringFingerprint to "model list with bookmark",
        )
        feedListHoldersHooked = handleTargets(PATCH, "list holders", holders) { (fingerprint, what) ->
            val toString = fingerprint.methodOrNull ?: return@handleTargets "no $what class describes itself the way 14.25 does"
            val constructors = mutableClassDefBy(toString.definingClass).methods.filter { method ->
                method.name == "<init>" && method.implementation != null &&
                    method.parameterTypes.count { it.toString() == LIST } == 1
            }
            if (constructors.isEmpty()) return@handleTargets "the $what class ${toString.definingClass} has no constructor taking one list"
            constructors.forEach { constructor ->
                val items = constructor.parameterRegister(constructor.parameterTypes.indexOfFirst { it.toString() == LIST })
                // Before the superclass constructor: only the list's own register is touched, and a
                // static call on it is allowed there.
                constructor.addInstructions(
                    0,
                    """
                        invoke-static/range { $items .. $items }, $FEED_FILTER->filter($LIST)$LIST
                        move-result-object $items
                    """,
                )
            }
            null
        }
    }
}
