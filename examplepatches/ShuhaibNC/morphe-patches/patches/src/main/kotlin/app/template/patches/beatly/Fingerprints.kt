package app.template.patches.beatly

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

object PremiumFingerprint1 : Fingerprint(
    definingClass = "Lcom/android/library/common/billinglib/data/BillingManager;",
    name = "isVip",
    returnType = "Z",
    parameters = emptyList(),
)

object PremiumFingerprint2 : Fingerprint(
    definingClass = "Lcom/android/library/common/billinglib/data/IapResult;",
    name = "isVip",
    returnType = "Z",
    parameters = emptyList(),
)

object PremiumFingerprint3 : Fingerprint(
    definingClass = "Lcom/android/library/common/billinglib/data/LocalVipStateData;",
    name = "isVip",
    returnType = "Z",
    parameters = emptyList(),
)

object PremiumFingerprint4 : Fingerprint(
    definingClass = "Lcom/ufotosoft/base/b\$a;",
    name = "o0",
    returnType = "Z",
    parameters = listOf("Z"),
)