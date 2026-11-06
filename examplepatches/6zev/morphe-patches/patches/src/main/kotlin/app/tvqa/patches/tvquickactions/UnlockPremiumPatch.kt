/*
 * Patches for tvQuickActions Pro.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.tvqa.patches.tvquickactions

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.tvqa.patches.shared.Constants.TVQUICKACTIONS
import com.android.tools.smali.dexlib2.iface.Method

/**
 * Name of the SharedPreferences file the licence policy owns.
 *
 * It is the only part of the policy class that survives obfuscation, so it is used to locate
 * the class: `r3/i` in 3.7.0 and `J3/i` in 3.8.0, and presumably something else again in the
 * next release.
 */
private const val POLICY_PREFERENCES = "com.google.android.vending.licensing.ServerManagedPolicy"

/**
 * The licence policy refuses a re-signed APK, so the app runs as the free version even though
 * nothing about its functionality was removed. The policy class owns a single no-argument
 * boolean method that decides whether the app is licensed; it is made to always answer yes.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Makes the bundled Google LVL policy always report the app as licensed, which " +
            "unlocks the premium features.",
    default = true
) {
    compatibleWith(TVQUICKACTIONS)

    execute {
        forceLicenceGranted()
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.forceLicenceGranted() {
    val policyClass = classDefByStrings(POLICY_PREFERENCES)
        .firstOrNull { classDef ->
            classDef.methods.any { method -> method.isNoArgumentBoolean() }
        }
        ?: throw PatchException("Could not find the licence policy class")

    val allowAccess = mutableClassDefBy(policyClass.type)
        .methods
        .firstOrNull { method -> method.isNoArgumentBoolean() }
        ?: throw PatchException("Could not find the licence policy allowAccess() method")

    allowAccess.returnEarly(true)
}

private fun Method.isNoArgumentBoolean() =
    returnType.toString() == "Z" && parameterTypes.isEmpty()
