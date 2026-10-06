package mightymich.morphe.patches.ru.zdevs.zarchiver

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium Features",
    description = "Unlocks ZArchiver premium and bypasses login.",
    default = true
) {
    compatibleWith(ZArchiverCompatibility.ZARCHIVER)


    val canuseFingerprint = Fingerprint(name = "canuse", returnType = "Z")
    val isNeedPayFingerprint = Fingerprint(name = "isNeedPay", returnType = "Z")
    val isloginFingerprint = Fingerprint(name = "islogin", returnType = "Z")

    execute {

        canuseFingerprint.let { fingerprint ->
            val method = fingerprint.method
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }


        isNeedPayFingerprint.let { fingerprint ->
            val method = fingerprint.method
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }


        isloginFingerprint.let { fingerprint ->
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
