package app.cesbar.patches.minesweeperthecleanone

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags


object purchaseCheckFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    strings = listOf("cache", ",")
)


val premiumPatch = bytecodePatch (
    name = "Enable Premium",
    description = "Unlock all purchasables options"
){
    compatibleWith(*Constants.COMPATIBILITY)

    execute {
        purchaseCheckFingerprint.method.returnEarly(true);
    }
}