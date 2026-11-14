/*
 * Copyright 2026 PetalAA.
 * https://github.com/petalaa/PetalMaps-AndroidAuto
 *
 * Adapted from the Morphe patches project.
 *
 * This file is part of the PetalAA patches project and is licensed under
 * the GNU General Public License version 3 (GPLv3).
 *
 * https://www.gnu.org/licenses/gpl-3.0.html
 */

package dev.petalaa.patches.androidauto

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS

/**
 * Fingerprint for the AccountFactory method that decides which sign-in flow
 * to return.
 *
 * Original body: `return up2.g(a81.c()) ? a.g() : b.n();`
 * Patched body: unconditionally returns `b.n()` (AccountPicker path, which
 * falls back to the WebView H5 sign-in when HMS Core is missing).
 *
 * This method is structurally unique: it is the only static method in the
 * APK that returns AccountApi with no parameters AND calls
 * `Lcom/huawei/maps/businessbase/utils/account/b;->n()`.
 */
internal object D4AFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Lcom/huawei/maps/businessbase/utils/account/AccountApi;",
    parameters = emptyList(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/huawei/maps/businessbase/utils/account/b;",
            name = "n",
            parameters = emptyList(),
            returnType = "Lcom/huawei/maps/businessbase/utils/account/b;",
            opcode = Opcode.INVOKE_STATIC,
        )
    ),
)

/**
 * Bytecode patch that forces [d4.a] to always return [b.n] (AccountPicker /
 * ThirdPartyPhoneAccountHelper).
 *
 * ## Problem
 * [ManufacturerCheckBypassPatch] forces [up2.g] → true, which makes [d4.a]
 * return the Huawei ID Auth flow ([a.g]). On devices without HMS Core, that
 * flow cannot show any UI (HwIdSignInHubActivity checks HMS availability and
 * finishes immediately with no WebView fallback), so sign-in silently does
 * nothing.
 *
 * ## Fix
 * Rewrite [d4.a] to unconditionally return [b.n]. That path reaches
 * `AccountPickerSignInHubPresenter.checkMinVersion()`, which
 * [AccountPickerH5Patch] already redirects to `getSignInIntentByH5()` (WebView
 * H5 sign-in). This works without HMS Core and avoids any HMS IPC on the
 * account factory (a runtime availability check here used to block sign-in when
 * HMS Core was installed but not running).
 *
 * ## Compatibility
 * Coexists safely with [ManufacturerCheckBypassPatch]: only the account
 * factory's return value changes, while the rest of the app still uses the
 * manufacturer bypass for splash-screen gating.
 *
 * @see docs/login-analysis.md for the full login-flow analysis.
 */
@Suppress("unused")
val huaweiLoginFixPatch = bytecodePatch(
    name = "Huawei login fix",
    description = "Forces the Account Picker sign-in path (b.n) in AccountFactory, " +
            "which uses the WebView H5 sign-in fallback when HMS Core is missing.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    execute {
        val method = D4AFingerprint.method
        val instructionCount = method.implementation?.instructions?.size ?: return@execute

        // Clear the original body (invoke up2.g → if-eqz → a.g() or b.n())
        if (instructionCount > 0) {
            method.removeInstructions(0, instructionCount)
        }

        // Replace with: return b.n();  (uses only v0, fits original 1-register method)
        method.addInstructions(
            0,
            """
                invoke-static {}, Lcom/huawei/maps/businessbase/utils/account/b;->n()Lcom/huawei/maps/businessbase/utils/account/b;
                move-result-object v0
                return-object v0
            """
        )
    }
}