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
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import dev.petalaa.patches.androidauto.Constants.COMPATIBILITY_PETAL_MAPS

/**
 * Fingerprint for [AccountPickerSignInHubPresenter.checkMinVersion].
 *
 * Original body checks HMS Core availability via [HMSAPKVersionCheckUtil] and
 * branches between APK sign-in (HMS OK), H5 WebView fallback (SERVICE_MISSING),
 * and failure (any other error code).
 *
 * Method signature: `public void checkMinVersion()`
 * Declared in `com.huawei.hms.support.picker.activity.AccountPickerSignInHubPresenter`.
 *
 * Unique string: "checkMinVersion start." — only appears in this method.
 */
internal object AccountPickerCheckMinVersionFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("checkMinVersion start."),
)

/**
 * Bytecode patch that forces the AccountPicker sign-in flow to always use the
 * WebView H5 path, bypassing HMS Core availability checks.
 *
 * ## Problem
 * [AccountPickerSignInHubPresenter.checkMinVersion] checks HMS Core availability
 * before deciding which sign-in path to use. On non-Huawei devices without HMS
 * Core, [HMSAPKVersionCheckUtil] may return an error code other than
 * SERVICE_MISSING (e.g., SERVICE_VERSION_UPDATE_REQUIRED, DEVELOPER_ERROR,
 * LICENSE_CHECK_FAILED), causing [onSignInFailed] which closes the activity
 * immediately — the user never sees a login UI.
 *
 * ## Fix
 * Replace the entire body of [checkMinVersion] with a direct call to
 * [getSignInIntentByH5], which launches the WebView-based sign-in flow that
 * works without HMS Core.
 *
 * ## Compatibility
 * This patch is independent of [huaweiLoginFixPatch] — it operates on a
 * downstream method in the AccountPicker flow. Both patches can coexist,
 * but [huaweiLoginFixPatch] is the one that routes to this activity in the
 * first place.
 *
 * @see docs/login-analysis.md for the full login-flow analysis.
 */
@Suppress("unused")
val accountPickerH5Patch = bytecodePatch(
    name = "AccountPicker WebView force",
    description = "Forces AccountPickerSignInHubPresenter to always use the WebView H5 " +
            "login path, bypassing HMS Core availability checks that fail on non-Huawei devices.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PETAL_MAPS)

    execute {
        val method = AccountPickerCheckMinVersionFingerprint.method
        val instructionCount = method.implementation?.instructions?.size ?: return@execute

        // Clear the original body (HMS availability check + branching logic)
        if (instructionCount > 0) {
            method.removeInstructions(0, instructionCount)
        }

        // Replace with: invoke getSignInIntentByH5(); return;
        method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Lcom/huawei/hms/support/picker/activity/AccountPickerSignInHubPresenter;->getSignInIntentByH5()V
                return-void
            """
        )
    }
}