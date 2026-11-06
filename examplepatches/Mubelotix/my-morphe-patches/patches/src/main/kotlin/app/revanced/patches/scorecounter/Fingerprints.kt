package app.revanced.patches.scorecounter

import app.morphe.patcher.fingerprint
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

internal val bannerAdUnitFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL)
    parameters("Z", "Ljava/lang/String")
    returns("Ljava/lang/String")
    opcodes(Opcode.RETURN_OBJECT)
    strings("ca-app-pub-3940256099942544/2014213617")
}

internal val openAdUnitFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL)
    parameters("Z", "Ljava/lang/String")
    returns("Ljava/lang/String")
    opcodes(Opcode.RETURN_OBJECT)
    strings("ca-app-pub-3940256099942544/3419835294")
}
