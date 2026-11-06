package app.revanced.patches.reddit

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.fingerprint

internal val httpClientNewCallFingerprint = fingerprint {
    accessFlags(AccessFlags.PUBLIC)
    parameters("Lokhttp3/Request")
    returns("Lokhttp3/Call")
    opcodes(Opcode.RETURN_OBJECT)
    strings("request")
}
