/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.storywise.misc.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.dart.DART_AOT_LIBRARY
import app.morphe.patches.shared.misc.dart.dartAotLibrary
import app.morphe.patches.shared.misc.requireArm64
import app.morphe.patches.shared.replaceMasked

private class AotEdit(val name: String, val pattern: String, val mask: String, val replacement: String)

private val PASS_STATUS_EDITS = listOf(
    AotEdit(
        "missing user document",
        "d0c20091103001b8703b55f9e04100a9a191f597ef031daafd79c1a8c0035fd6a10b40f9",
        "ffffffffffffffffff03c0ffffffffff000000fcffffffffffffffffffffffffffffffff",
        "d0820091",
    ),
    AotEdit(
        "missing pass field",
        "d0c20091103001b8703b55f9e04100a97191f597ef031daafd79c1a8c0035fd660f05ff8",
        "ffffffffffffffffff03c0ffffffffff000000fcffffffffffffffffffffffffffffffff",
        "d0820091",
    ),
    AotEdit(
        "inactive pass",
        "c3c20091a0031ef8f1d21294a1035ef8",
        "ffffffffffffffff000000fcffffffff",
        "c3820091",
    ),
    AotEdit(
        "expired pass",
        "7bfcff97a0031ef8703b55f95e4b40f9fe4100a9ae90f597e10300aa",
        "000000fcffffffffff03c0ffff03c0ffffffffff000000fcffffffff",
        "c0820091",
    ),
)

@Suppress("unused")
val unlockPremiumPatch = resourcePatch(
    name = "Unlock premium",
    description = "Unlocks locked lessons, quizzes and the full Report Card without a pass. " +
        "The server caps the AI tutor at five questions a day and withholds lectures and live sessions. " +
        "Signing in requires GmsCore support.",
) {
    compatibleWith(AppCompatibilities.STORYWISE)
    availability(requireArm64)

    execute {
        val library = dartAotLibrary()

        PASS_STATUS_EDITS.forEach { edit ->
            val replaced = library.replaceMasked(
                edit.pattern.hexToByteArray(),
                edit.mask.hexToByteArray(),
                mapOf(0 to edit.replacement.hexToByteArray()),
            )
            if (!replaced) throw PatchException("Could not find the ${edit.name} check in $DART_AOT_LIBRARY")
        }
    }
}
