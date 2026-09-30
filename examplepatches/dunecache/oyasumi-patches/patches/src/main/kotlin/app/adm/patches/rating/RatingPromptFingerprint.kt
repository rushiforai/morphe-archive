package app.adm.patches.rating

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * `Lv2/p1;->run()V` is the delayed-callback dispatcher. Each of its packed-switch
 * cases loads the owning `Main` activity, restores the saved `Paint`, performs one
 * action and returns.
 *
 * The automatic `RATE_APP10` prompt is the case that calls `Main.n(7)`. 14.0.27 had a
 * dedicated `Main.W(Main)` wrapper for it, but 14.0.39 inlines the call into this
 * dispatcher, so the case is located by the neighbouring `Main.s()` case, which is
 * unique in the method, followed by the literal `7` and the `Main.n(I)` call it
 * guards. The trailing `return-void` confirms the case boundary.
 */
object RatingPromptFingerprint : Fingerprint(
    definingClass = "Lv2/p1;",
    name = "run",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/dv/get/Main;",
            name = "s",
            parameters = listOf(),
            returnType = "V"
        ),
        literal(7, listOf(Opcode.CONST_4)),
        methodCall(
            definingClass = "Lcom/dv/get/Main;",
            name = "n",
            parameters = listOf("I"),
            returnType = "V"
        ),
        opcode(Opcode.RETURN_VOID, location = InstructionLocation.MatchAfterWithin(0))
    )
)
