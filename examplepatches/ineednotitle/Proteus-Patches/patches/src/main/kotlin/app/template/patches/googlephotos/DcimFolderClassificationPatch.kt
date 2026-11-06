package app.template.patches.googlephotos

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.GOOGLE_PHOTOS_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags

private const val EXTENSION_CLASS = "Lapp/template/extension/extension/PhotosDcimFolderPatch;"

// Based on RevealedSoulEven/XposedPhotosFIX v3 builder hook logic.
@Suppress("unused")
val googlePhotosDcimFolderClassificationPatch = bytecodePatch(
    name = "Fix DCIM folder classification",
    description = "Prevents non-Camera DCIM folders from being grouped as Camera.",
    default = true,
) {
    compatibleWith(GOOGLE_PHOTOS_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // The classification logic lives in the extension; without it this patch can
        // only produce a dangling reference, so skip instead of breaking the APK.
        val extensionAvailable = try {
            classDefBy(EXTENSION_CLASS) != null
        } catch (_: Throwable) {
            false
        }
        if (!extensionAvailable) {
            println(
                "DCIM classification: $EXTENSION_CLASS not found in the merged DEX — skipping.",
            )
            return@execute
        }

        LocalMediaInCameraFolderSetterFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $EXTENSION_CLASS->fixInCameraFolder(Ljava/lang/Object;Z)Z
                move-result p1
            """.trimIndent(),
        )

        LegacyDcimCameraFolderFingerprint.methodOrNull?.let { method ->
            val pathRegister = if (AccessFlags.STATIC.isSet(method.accessFlags)) "p0" else "p1"
            method.addInstructions(
                0,
                """
                    invoke-static {$pathRegister}, $EXTENSION_CLASS->isCameraFolderPath(Ljava/lang/String;)Z
                    move-result $pathRegister
                    return $pathRegister
                """.trimIndent(),
            )
        }
    }
}
