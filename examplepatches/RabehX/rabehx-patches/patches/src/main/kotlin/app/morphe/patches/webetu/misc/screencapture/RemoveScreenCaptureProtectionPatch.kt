/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.webetu.misc.screencapture

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.webetu.shared.WebetuConstants

/**
 * The app blocks screenshots via expo-screen-capture's ScreenCaptureModule.
 * The module's AsyncFunction lambda calls Window.addFlags(FLAG_SECURE) —
 * replace the lambda body with a no-op so capture never gets blocked.
 */
@Suppress("unused")
val removeScreenCaptureProtectionPatch = bytecodePatch(
    name = "Allow screenshots",
    description = "Removes the screen capture block so screenshots and recordings work.",
    default = true,
) {
    compatibleWith(WebetuConstants.COMPATIBILITY_WEBETU)

    execute {
        val screenCaptureModuleFingerprint = object : Fingerprint(
            name = "invoke",
            definingClass = "Lexpo/modules/screencapture/ScreenCaptureModule\$definition\$lambda\$9\$\$inlined\$AsyncFunction\$7;",
            filters = listOf(
                literal(0x2000), // WindowManager.LayoutParams.FLAG_SECURE
                methodCall(
                    definingClass = "Landroid/view/Window;",
                    name = "addFlags",
                ),
            ),
        ) {}

        screenCaptureModuleFingerprint.method?.let { method ->
            method.removeInstructions(0)
            method.addInstructions(
                0,
                """
                    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                    return-object v0
                """,
            )
        }
    }
}
