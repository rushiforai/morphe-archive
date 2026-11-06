package app.revanced.patches.sudoku

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.fingerprint

internal val initAdsFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.FINAL)
    parameters("Ljava/lang/Object")
    returns("Ljava/lang/Object")
    strings("removeAdsPurchased", "configManager", "ad_module_disabled", "Required value was null.")
}
