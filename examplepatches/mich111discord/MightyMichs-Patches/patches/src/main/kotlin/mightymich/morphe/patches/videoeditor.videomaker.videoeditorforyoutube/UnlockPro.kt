package mightymich.morphe.patches.videoguru

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro Features",
    description = "Unlocks Pro features in Video Guru by forcing the premium check to return true."
) {
    compatibleWith(VideoGuruCompatibility.VIDEO_GURU)

    // 1. Fingerprint: locate the method that contains the string "SubscribePro".
    //    This method (a()Z) is responsible for checking the subscription status.
    val subscribeProFingerprint = Fingerprint(
        filters = listOf(
            string("SubscribePro")
        )
    )

    execute {
        subscribeProFingerprint.let { fingerprint ->
            // 2. Get the matched method. In Morphe Patcher, 'match' is a function.
            val method = fingerprint.match()?.method
                ?: throw PatchException("Could not find the method with 'SubscribePro' string.")

            // 3. Insert instructions at the very beginning of the method:
            //      const/4 v0, 0x1  -> load 1 (true) into register v0
            //      return v0        -> return true immediately
            //    This forces the premium check to always succeed.
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
