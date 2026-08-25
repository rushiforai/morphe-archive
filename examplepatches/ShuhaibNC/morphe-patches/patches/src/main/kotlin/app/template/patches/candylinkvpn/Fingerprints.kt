package app.template.patches.candylinkvpn

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object IsPremiumFingerprint : Fingerprint(
    definingClass = "Lcom/candylink/core/provider/PreferenceProvider;",
    name = "isPremiumPurchased",
    returnType = "Z",
    parameters = emptyList(),
)

object IsTrackingFingerprint : Fingerprint(
    definingClass = "Lcom/candylink/core/provider/PreferenceProvider;",
    name = "isStatisticsTrackingEnabled",
    returnType = "Z",
    parameters = emptyList(),
)