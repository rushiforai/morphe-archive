package app.revanced.patches.jakdojade

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.fingerprint

internal val bannerAdManagerFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.FINAL)
    parameters("Lkotlin/jvm/functions/Function0", "Lkotlin/jvm/functions/Function0")
    returns("V")
    strings("successCallback", "loadBanner ")
}
