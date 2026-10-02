package mightymich.morphe.patches.com.wakeup.howear

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockVipPatch = bytecodePatch(
    name = "Unlock VIP Features",
    description = "Unlocks VIP features in Wearfit Pro by forcing getIsVip() to return 1.",
    default = true
) {
    compatibleWith(WearfitProCompatibility.WEARFIT_PRO)

    // Fingerprint: locate the getIsVip() method in UserModel class.
    // According to the BinMT tutorial, this method returns an int (I).
    val getIsVipFingerprint = Fingerprint(
        definingClass = "Lcom/wakeup/common/storage/model/UserModel;",
        name = "getIsVip",
        returnType = "I"
    )

    execute {
        getIsVipFingerprint.let { fingerprint ->
            val method = fingerprint.method
                ?: throw PatchException("Could not find getIsVip method in UserModel.")

            // Insert instructions at the very beginning of the method:
            //      const/4 v0, 0x1  -> load 1 (VIP active) into register v0
            //      return v0        -> return 1 immediately
            //    This forces the VIP check to always succeed.
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
