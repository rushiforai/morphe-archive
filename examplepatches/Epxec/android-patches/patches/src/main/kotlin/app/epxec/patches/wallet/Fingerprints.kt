package app.epxec.patches.wallet.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.fieldAccess

object WalletPaidFingerprint : Fingerprint(
    definingClass = "Lcom/ribeez/RibeezUser;",
    name = "isPaid",
    returnType = "Z",
    parameters = emptyList(),
)

object WalletLifetimeFingerprint : Fingerprint(
    definingClass = "Lcom/ribeez/RibeezUser;",
    name = "isLifetime",
)

object WalletFreeFingerprint : Fingerprint(
    definingClass = "Lcom/ribeez/RibeezUser;",
    name = "isFree",
)
