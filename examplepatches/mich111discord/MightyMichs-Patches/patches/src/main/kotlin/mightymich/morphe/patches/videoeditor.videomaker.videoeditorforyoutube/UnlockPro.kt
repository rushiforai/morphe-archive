package mightymich.morphe.patches.videoguru

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro Features",
    description = "Unlocks Pro features in Video Guru by forcing the premium check method a()Z to return true."
) {
    compatibleWith(VideoGuruCompatibility.VIDEO_GURU)


    val aFingerprint = Fingerprint(
        name = "a",
        returnType = "Z",
        parameters = listOf()
    )

    execute {
        aFingerprint.let { fingerprint ->
            val method = fingerprint.method
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
