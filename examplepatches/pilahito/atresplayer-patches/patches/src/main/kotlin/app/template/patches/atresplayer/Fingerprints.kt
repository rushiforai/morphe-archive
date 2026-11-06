package app.template.patches.atresplayer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Callback of the IMA player that receives the VAST ads response and asks the
 * IMA SDK to load it. In 5.8.0 this is zb.i.a0(String, zb.i), a static synthetic
 * accessor, so it is matched by the IMA calls it makes and not by its obfuscated name.
 */
object ImaRequestAdsFingerprint : Fingerprint(
    definingClass = "Lzb/i;",
    name = "a0",
    accessFlags = listOf(AccessFlags.PRIVATE, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "L")
)
