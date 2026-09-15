package app.epxec.patches.daylio.Fingerprints

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.patcher.fieldAccess

object DaylioPurchaseListCheckFingerprint : Fingerprint(
    definingClass = "Lnet/daylio/modules/purchases/g0\$a\$a;",
    name = "c",
    returnType = "V",
    parameters = listOf(
        "Ljava/util/List;",
    ),
    filters = listOf(
        string("subs")
    ),
)

object DaylioSecondPurchaseListCheckFingerprint : Fingerprint(
    filters = listOf(
        string("number of all purchased in-app purchases - ")
    ),
)

object DaylioAcknowledgementFingerprint : Fingerprint(
    filters = listOf(
        string("Acknowledge not necessary.")
    ),
)
