package app.lmrcopyleftmusic.patches.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

private const val MAIN_ACTIVITY = "Lcom/lmr/lfm/MainActivity;"
private const val PREMIUM_STATE = "Lcom/lmr/lfm/RestoringBackInterior;"

object MainActivityPremiumFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "isPremium",
    returnType = "Z",
    parameters = listOf(),
)

object RenderPremiumFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "renderPremium",
    returnType = "V",
    parameters = listOf("Z", "Ljava/lang/String;"),
    filters = listOf(
        string("MainActivity: renderPremium="),
        methodCall(definingClass = PREMIUM_STATE, name = "playSettled"),
    ),
)

object PremiumFieldInitializationFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "<init>",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(
            definingClass = MAIN_ACTIVITY,
            name = "isPremium",
            type = "Z",
            opcode = Opcode.IPUT_BOOLEAN,
        ),
    ),
)

object SignatureValidationFingerprint : Fingerprint(
    definingClass = MAIN_ACTIVITY,
    name = "isSignatureValid",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
)

object PremiumStateFingerprint : Fingerprint(
    definingClass = PREMIUM_STATE,
    name = "isPremium",
    returnType = "Z",
    parameters = listOf(),
)
