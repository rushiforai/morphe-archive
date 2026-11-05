package app.template.patches.fotmob.misc.refresh

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.opcode
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

private const val MATCH_ACTIVITY = "Lcom/fotmob/android/feature/match/ui/MatchActivity;"

/**
 * The match page's one-second ticker: a case of an R8 switch-merged Runnable (240: pz.run) that
 * reads MatchActivity's int tick counter, compares it with `const/16 15` (`if-lt`) and, when it
 * is reached, logs "Refreshing match facts!". MatchActivity is a manifest activity (name kept);
 * the counter field's name is not used. The same log string appears in another case of the same
 * Runnable (a 30 s postDelayed with no counter), which this instruction sequence does not match.
 */
internal object MatchFactsRefreshFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(definingClass = MATCH_ACTIVITY, type = "I", opcode = Opcode.IGET),
        literal(15, location = MatchAfterImmediately()),
        opcode(Opcode.IF_LT, location = MatchAfterImmediately()),
        string("Refreshing match facts!", location = MatchAfterWithin(3)),
    ),
)
