/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.idn

import app.fakh.patches.idn.shared.Constants.COMPATIBILITY_IDN
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.smali.ExternalLabel

/** TopUpGoldBottomSheet.show: shows the Gold packages sheet; the live rooms, the short movie player and the QR scanner call it. */
private object GoldSheetFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("topupgold_bottom_sheet"),
    custom = { method, _ -> method.parameterTypes.size == 2 && method.parameterTypes[1].toString() == "Ljava/lang/String;" },
)

/** ProfileActivity's screen router: opens the screen the activity was started for, such as Settings or Top up Gold. */
private object ProfileScreenFingerprint : Fingerprint(
    definingClass = "Lmedia/idn/profile/presentation/ProfileActivity;",
    returnType = "V",
    custom = { method, _ -> method.parameterTypes.size == 1 && method.parameterTypes[0].toString() != "Landroid/os/Bundle;" },
)

@Suppress("unused")
val redirectGoldPurchasePatch = patch(
    name = "Redirect Gold purchase",
    description = "Opens connect.idn.media/my-account/gold in the browser instead of the in-app Gold top up.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IDN)
    category("Feature")
    extendWith("extensions/extension.mpe")

    execute {
        // The packages sheet never shows.
        GoldSheetFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, $EXTENSION_SETTINGS->openGoldTopUp()V
                return-void
            """,
        )
        // The full-screen Top up Gold page, reached from the Gold card on the profile, opens the browser and closes.
        ProfileScreenFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_SETTINGS->redirectGold(Landroid/app/Activity;Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :show
                    return-void
                """,
                ExternalLabel("show", getInstruction(0)),
            )
        }
    }
}
