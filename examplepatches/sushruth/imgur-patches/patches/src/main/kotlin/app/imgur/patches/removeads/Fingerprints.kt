package app.imgur.patches.removeads

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

object IsForceEmeraldEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/imgur/mobile/util/FeatureUtils;",
    name = "isForceEmeraldEnabled",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC)
)
