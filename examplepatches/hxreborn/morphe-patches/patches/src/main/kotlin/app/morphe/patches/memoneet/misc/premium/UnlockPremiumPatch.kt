/*
 * Copyright (C) 2026 hxreborn
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.memoneet.misc.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.shared.misc.dart.DART_AOT_LIBRARY
import app.morphe.patches.shared.misc.dart.dartAotLibrary
import app.morphe.patches.shared.misc.requireArm64
import app.morphe.patches.shared.replaceMasked

internal val PRODUCT_ACCESS_CHECK_PROLOGUE =
    (
        "fd79bfa9fd030faaefc100d1e00301aaa1031ff8502740f9ff0110eb290e005403" +
            "b042b863801c8be10303aaa3831ff8457f2994e10300aaa0835ff802f040b84280" +
            "1c8b5f00016b61000054e00316aa02000014e00301aaa0831ff81f00166b"
        ).hexToByteArray()

internal val PRODUCT_ACCESS_CHECK_PROLOGUE_MASK =
    (
        "ffffffffffffffffffffffffffffffffffffffffffffffffffffffff1f0000ffff" +
            "0fe0ffffffffffffffffffffffffff000000fcffffffffffffffffffffffffffff" +
            "ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff"
        ).hexToByteArray()

internal val SHOPPING_SERVICE_COMBO_CHECK_PROLOGUE =
    ("fd79bfa9fd030faaef2101d1a2031ff8502740f9ff0110eba90e0054" +
        "40f043b800801c8b7093409110fa45f91f00106b").hexToByteArray()

internal val SHOPPING_SERVICE_COMBO_CHECK_PROLOGUE_MASK =
    ("ffffffffffffffffffffffffffffffffffffffffffffffff1f0000ff" +
        "ffffffffffffffffff03c0ffff03c0ffffffffff").hexToByteArray()

internal val ACCESS_MANAGER_COMBO_CHECK_PROLOGUE =
    ("fd79bfa9fd030faaefe100d1e00301aaa1831ef8502740f9ff0110ebc90d005441f043b8" +
        "21801c8b70a74091102646f93f00106b").hexToByteArray()

internal val ACCESS_MANAGER_COMBO_CHECK_PROLOGUE_MASK =
    ("ffffffffffffffffff03c0ffffffffffff0fe0ffffffffffffffffff1f0000ffffffffff" +
        "ffffffffff03c0ffff03c0ffffffffff").hexToByteArray()

internal val COMBO_PURCHASE_CHECK_PROLOGUES = listOf(
    SHOPPING_SERVICE_COMBO_CHECK_PROLOGUE to SHOPPING_SERVICE_COMBO_CHECK_PROLOGUE_MASK,
    ACCESS_MANAGER_COMBO_CHECK_PROLOGUE to ACCESS_MANAGER_COMBO_CHECK_PROLOGUE_MASK,
)

internal val RETURN_TRUE = "c0820091c0035fd6".hexToByteArray()

@Suppress("unused")
val unlockPremiumPatch = resourcePatch(
    name = "Unlock premium",
    description = "Unlocks the premium question banks, notes, test series, previous-year papers " +
        "and shop plans, with no energy cost or ads. Signing in requires GmsCore support.",
) {
    compatibleWith(AppCompatibilities.MEMONEET)
    availability(requireArm64)

    execute {
        val library = dartAotLibrary()

        val returnTrueAtEntry = mapOf(0 to RETURN_TRUE)
        if (!library.replaceMasked(PRODUCT_ACCESS_CHECK_PROLOGUE, PRODUCT_ACCESS_CHECK_PROLOGUE_MASK, returnTrueAtEntry)) {
            throw PatchException("Could not find the product access check in $DART_AOT_LIBRARY")
        }
        val comboChecksReplaced = COMBO_PURCHASE_CHECK_PROLOGUES.count { (pattern, mask) ->
            library.replaceMasked(pattern, mask, returnTrueAtEntry)
        }
        if (comboChecksReplaced == 0) {
            throw PatchException("Could not find the combo purchase check in $DART_AOT_LIBRARY")
        }
    }
}
