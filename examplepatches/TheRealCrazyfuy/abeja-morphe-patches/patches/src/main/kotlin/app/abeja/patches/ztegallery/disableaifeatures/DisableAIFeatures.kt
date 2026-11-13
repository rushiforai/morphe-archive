package app.abeja.patches.ztegallery.disableaifeatures

import app.morphe.patcher.patch.bytecodePatch
import app.abeja.patches.shared.Constants.ZTE_GALLERY
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions

private const val EXTENSION_CLASS = "Lapp/template/extension/ExamplePatch;"

@Suppress("unused")
val DisableAIFeaturesPatch = bytecodePatch(
    name = "Disable AI features",
    description = "Patch to disable the AI features.",
    default = true
) {
    compatibleWith(ZTE_GALLERY)

    extendWith("extensions/extension.mpe")

    execute {

        IsSupportAIGenerationFingerprint.method.replaceInstructions(
            0,
            """
            const/4 v0, 0x0
            return v0
            """
        )
    }
}
