package mightymich.morphe.patches.pl.mobimax.cameraopus

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val wearEngineFixPatch = bytecodePatch(
    name = "Wear Engine Scope Fix (Experimental)",
    description = "Fixes Wear Engine scope authorization errors by forcing the error code check to succeed. WARNING: May cause crashes.",
    default = true
) {
    compatibleWith(CameraOpusCompatibility.CAMERA_OPUS)

    val errorCodeFingerprint = Fingerprint(
        definingClass = "Lcom/huawei/wearengine/common/WearEngineErrorCode;",
        name = "checkSuccess",
        returnType = "Z"
    )

    execute {
        errorCodeFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find checkSuccess method in WearEngineErrorCode.")

            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
