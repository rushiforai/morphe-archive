package app.abeja.patches.ztegallery

import app.morphe.patcher.patch.bytecodePatch
import app.abeja.patches.shared.Constants.ZTE_GALLERY
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions

private const val EXTENSION_CLASS = "Lapp/template/extension/ExamplePatch;"

@Suppress("unused")
val FixBackgroundServicePatch = bytecodePatch(
    name = "Fix Background Service",
    description = "Patch to make the PolicyForegroundService background service not start.",
    default = true
) {
    compatibleWith(ZTE_GALLERY)

    // dependsOn(internalPatch)

    extendWith("extensions/extension.mpe")

    execute {

        WakeLockForegroundServiceHelperFingerprint.method.replaceInstructions(
            0,
            """
            const/4 v0, 0x1
            return v0
            """
        )

    }
}
