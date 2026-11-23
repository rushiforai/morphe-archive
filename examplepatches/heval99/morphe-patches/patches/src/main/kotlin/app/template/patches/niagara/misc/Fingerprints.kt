package app.template.patches.niagara.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.opcode
import com.android.tools.smali.dexlib2.Opcode

/**
 * The suspend method that adds a widget to a stack and throws "Widget stack at N/max". Match
 * indices: 0 = the Pro `iget-boolean`, 1 = its `if-eqz`, 2 = the `const/4 4` (the Pro maximum).
 */
internal object WidgetStackAddFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    strings = listOf("Widget stack at "),
    filters = listOf(
        fieldAccess(opcode = Opcode.IGET_BOOLEAN, type = "Z"),
        opcode(Opcode.IF_EQZ, location = MatchAfterImmediately()),
        literal(4, location = MatchAfterImmediately()),
    ),
)

/**
 * The stack-full pre-check over the stack's widget list, restricted to [classType] (the class of
 * the add method, read from its match at patch time). Match indices: 0 = `List.size`,
 * 1 = its `move-result`, 2 = the `const/4 4`, 3 = the `if-lt size, 4`.
 */
internal fun widgetStackFullCheckFingerprint(classType: String) = Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/util/List;", "Z", "L"),
    custom = { _, classDef -> classDef.type == classType },
    filters = listOf(
        methodCall(definingClass = "Ljava/util/List;", name = "size"),
        opcode(Opcode.MOVE_RESULT, location = MatchAfterImmediately()),
        literal(4, location = MatchAfterImmediately()),
        opcode(Opcode.IF_LT, location = MatchAfterWithin(3)),
    ),
)
