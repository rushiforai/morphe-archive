package app.template.patches.actionlauncher.premium

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_ACTIONLAUNCHER

/**
 * Action Launcher decides Plus on-device: the Play Billing flow stores the purchased SKU code and
 * one method answers whether it is the Plus code. Forcing that method true unlocks the Plus
 * features (Quickbar, Shutters, covers, extra grids and the rest of the paid set). Purchases and
 * the Play Billing flow are untouched.
 */
@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks the Plus features.",
) {
    compatibleWith(COMPATIBILITY_ACTIONLAUNCHER)

    execute {
        // The Plus code must be read by exactly one () -> boolean method.
        val readers = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.filter { it.readsPlusPurchaseCode() }.forEach { readers += classDef.type to it.name }
        }
        if (readers.size != 1) {
            throw PatchException("Enable Premium: expected one Plus purchase check, found ${readers.size}: $readers")
        }
        val (type, name) = readers.single()
        mutableClassDefBy(type).methods.single { it.name == name && it.readsPlusPurchaseCode() }.returnEarly(true)
    }
}
