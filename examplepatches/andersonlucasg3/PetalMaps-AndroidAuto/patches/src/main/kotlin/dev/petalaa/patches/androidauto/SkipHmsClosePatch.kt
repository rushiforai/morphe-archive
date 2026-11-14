/*
 * Copyright 2026 PetalAA.
 * https://github.com/petalaa/PetalMaps-NonHuawei
 *
 * This file is part of the PetalAA patches project and is licensed under
 * the GNU General Public License version 3 (GPLv3).
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 */

package dev.petalaa.patches.androidauto

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS

/**
 * Fingerprint for `HmsUpdateUtil.h(Context)` — the entry point that runs the
 * HMS Core availability/update check.
 *
 * `public static int h(Context)` (the private `l(Context)` it delegates to has
 * the same signature, hence the access flags filter). Unique string:
 * "Hms update result is: ".
 */
internal object HmsUpdateCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "I",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("Hms update result is: "),
)

/**
 * Fingerprint for the `AvailableAdapter.AvailableCallBack.onComplete` callback
 * of `HmsUpdateUtil`, which calls `activity.finish()` when HMS Core is missing.
 *
 * Unique string: "Hms update failed: ".
 */
internal object HmsUpdateCallbackFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("I"),
    strings = listOf("Hms update failed: "),
)

/**
 * Fingerprint for `AvailableAdapter.isUserResolvableError(int)` — the HMS SDK
 * method that decides whether a missing/outdated HMS Core error can be resolved
 * by showing the install/update dialog.
 */
internal object HmsResolvableErrorFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("I"),
    custom = { method, classDef ->
        classDef.type == "Lcom/huawei/hms/adapter/AvailableAdapter;" &&
            method.name == "isUserResolvableError"
    },
)

/**
 * Fingerprint for `AvailableAdapter.isUserNoticeError(int)` — the HMS SDK
 * method that decides whether to show the HMS Core notice dialog.
 */
internal object HmsNoticeErrorFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("I"),
    custom = { method, classDef ->
        classDef.type == "Lcom/huawei/hms/adapter/AvailableAdapter;" &&
            method.name == "isUserNoticeError"
    },
)

/**
 * Bytecode patch that neutralises the app's HMS Core requirement on devices
 * without HMS Core.
 *
 * ## Problem
 * `HmsUpdateUtil.h(Context)` runs at splash time and checks HMS Core. Because
 * [ManufacturerCheckBypassPatch] makes `up2.g()` return true, the check runs
 * even on non-Huawei devices. Without HMS Core the SDK shows the
 * "HMS Core not installed" dialog, and its callback calls `activity.finish()`,
 * closing the map — so the app is unusable without HMS Core.
 *
 * ## Fix
 * - `h(Context)` returns 0 (HMS Core considered available), so the app never
 *   starts the update/resolution prompt and never blocks the splash flow.
 * - The HMS SDK no longer treats a missing HMS Core as a resolvable/noticeable
 *   error, so the "HMS Core not installed" dialog is not shown for the Kits
 *   that fail at startup (e.g. Awareness Kit).
 * - As a safety net, the `activity.finish()` call in the callback is removed.
 */
@Suppress("unused")
val skipHmsClosePatch = bytecodePatch(
    name = "Skip HMS Core checks",
    description = "Skips the HMS Core availability prompt and prevents Petal Maps " +
            "from closing the map activity when HMS Core is missing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    execute {
        HmsUpdateCheckFingerprint.method.returnEarly(0)
        HmsResolvableErrorFingerprint.method.returnEarly(false)
        HmsNoticeErrorFingerprint.method.returnEarly(false)

        val method = HmsUpdateCallbackFingerprint.method
        val instructions = method.implementation!!.instructions.toList()
        val index = instructions.indexOfFirst { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference
            reference is MethodReference &&
                reference.definingClass == "Landroid/app/Activity;" &&
                reference.name == "finish"
        }
        require(index >= 0) { "Activity.finish() call not found in HMS update callback" }
        method.removeInstructions(index, 1)
    }
}
