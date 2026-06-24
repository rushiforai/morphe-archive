package hoodles.morphe.patches.shared.misc.signature

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object GetSignatureFingerprint : Fingerprint (
    definingClass = Constants.SPOOF_CLASS_SMALI_NAME,
    name = "getSignature"
)

object AttachBaseContextFingerprint : Fingerprint (
    definingClass = Constants.SPOOF_CLASS_SMALI_NAME,
    name = "attachBaseContext",
)

object ConstructorFingerprint : Fingerprint (
    definingClass = Constants.SPOOF_CLASS_SMALI_NAME,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR)
)