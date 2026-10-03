package app.morphe.patches.toffee.config

import app.morphe.patcher.Fingerprint
import app.morphe.patches.shared.Type
import com.android.tools.smali.dexlib2.AccessFlags

object SplashAdVisibilityGetterFingerprint : Fingerprint(
    definingClass = $$"Lcom/api/model/baseConfig/Configuration$SplashAd;",
    name = "getVisibility",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = Type.BOOLEAN,
    parameters = emptyList(),
)