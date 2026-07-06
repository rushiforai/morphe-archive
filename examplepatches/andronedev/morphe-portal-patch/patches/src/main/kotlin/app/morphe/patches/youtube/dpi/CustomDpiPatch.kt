package app.morphe.patches.youtube.dpi

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patches.youtube.dpi.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.dpi.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.util.findFreeRegister
import app.morphe.util.traverseClassHierarchy

private const val EXTENSION_INIT =
    "Lapp/morphe/extension/dpi/DensityPatch;->init(Landroid/app/Application;I)V"

@Suppress("unused")
val customDpiPatch = bytecodePatch(
    "Custom DPI",
    "Forces a higher display density for this app only, so the whole UI scales " +
        "up without changing the system density. Intended for low-dpi devices such as Meta " +
        "Portal (160 dpi).",
    false,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE, COMPATIBILITY_YOUTUBE_MUSIC)

    extendWith("extensions/youtube.mpe")

    val dpiOption = intOption(
        key = "dpi",
        default = 240,
        title = "Custom DPI",
        description = "Forced display density in dots-per-inch for this app only. " +
            "160 = system default (mdpi), 240 is roughly 1.5x larger. Range 96-640.",
        required = false,
        validator = { it == null || it in 96..640 },
    )

    execute {
        val dpi = dpiOption.value ?: 240

        val applicationType = ApplicationFingerprint.methodOrNull?.definingClass ?: return@execute
        val applicationClass = mutableClassDefByOrNull(applicationType) ?: return@execute

        var injected = false
        traverseClassHierarchy(applicationClass) {
            if (injected) return@traverseClassHierarchy

            val onCreate = methods.firstOrNull {
                it.name == "onCreate" && it.parameters.isEmpty() && it.returnType == "V"
            } ?: return@traverseClassHierarchy

            val register = onCreate.findFreeRegister(1)
            onCreate.addInstructions(
                0,
                """
                    const v$register, $dpi
                    invoke-static { p0, v$register }, $EXTENSION_INIT
                """,
            )
            injected = true
        }
    }
}
