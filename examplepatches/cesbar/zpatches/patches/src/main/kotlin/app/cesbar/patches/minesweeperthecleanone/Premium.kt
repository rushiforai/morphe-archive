package app.cesbar.patches.minesweeperthecleanone

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility


object purchaseCheckFingerprint : Fingerprint(
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    definingClass = "Lvi1;"
)


val premiumPatch = bytecodePatch (
    name = "Premium",
    description = "Unlock all purchasables options"
){
    compatibleWith(Compatibility(
        name = "Minesweeper The Clean One",
        packageName = "ee.dustland.android.minesweeper",
        appIconColor = 0x3C3C3C,
        targets = listOf(AppTarget("1.21.1"))
    ))

    execute {
        purchaseCheckFingerprint.method.returnEarly(true);
    }
}