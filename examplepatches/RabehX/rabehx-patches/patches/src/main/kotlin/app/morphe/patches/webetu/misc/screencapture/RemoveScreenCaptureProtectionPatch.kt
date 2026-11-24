/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.webetu.misc.screencapture

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patches.shared.removeElements
import app.morphe.patches.shared.returnEarlyVoidAll
import app.morphe.patches.webetu.shared.WebetuConstants

@Suppress("unused")
val removeScreenCaptureProtectionPatch = patch(
    name = "Allow screenshots",
    description = "Removes the FLAG_SECURE screen capture block and disables Android 14+ " +
            "screenshot detection callbacks so screenshots and recordings work everywhere.",
    default = true,
) {
    category("Security")
    compatibleWith(WebetuConstants.COMPATIBILITY_WEBETU)

    execute {
        // Match preventScreenCapture lambda by prefix + FLAG_SECURE (0x2000) + Window.addFlags.
        Fingerprint(
            definingClass = "Lexpo/modules/screencapture/ScreenCaptureModule\$",
            name = "invoke",
            parameters = listOf("[Ljava/lang/Object;"),
            returnType = "Ljava/lang/Object;",
            filters = listOf(
                literal(0x2000),
                methodCall(definingClass = "Landroid/view/Window;", name = "addFlags"),
            ),
        ).method.addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """,
        )

        mutableClassDefByOrNull("Lexpo/modules/screencapture/ScreenCaptureModule;")
            ?.returnEarlyVoidAll { it.name == "registerCallback" || it.name == "emitEvent" }

        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.removeElements(listOf("uses-permission")) {
                it.attribute("android:name") == "android.permission.DETECT_SCREEN_CAPTURE"
            }
        }
    }
}
