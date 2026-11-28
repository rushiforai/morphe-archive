package app.xposed.patches.twitter.badges

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.matchSingle
import app.xposed.patches.twitter.Constants.BRIDGE_CLASS
import app.xposed.patches.twitter.Constants.HOOKS_CLASS
import app.xposed.patches.twitter.util.Abstract
import app.xposed.patches.twitter.util.RegisterFlow
import app.xposed.patches.twitter.util.argumentRegisters
import app.xposed.patches.twitter.util.descriptor
import app.xposed.patches.twitter.util.field
import app.xposed.patches.twitter.util.fieldRef
import app.xposed.patches.twitter.util.instructionList
import app.xposed.patches.twitter.util.methodRef
import app.xposed.patches.twitter.util.replaceStub
import app.xposed.patches.twitter.util.single
import app.xposed.patches.twitter.util.toStringFields
import app.xposed.patches.twitter.util.typeRef
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Compose's text Placeholder: the size of one piece of inline content. */
private object PlaceholderToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("Placeholder(width="),
)

/**
 * Name rows that lay badges out as inline text content (the profile header, chat headers and
 * mini profiles) give each badge a square placeholder one badge size wide, which shrinks ours
 * to fit. After such a row casts a badge item it calls Hooks.noteInlineBadge, and the placeholder
 * it then builds passes through Hooks.inlineBadgePlaceholder, which gives ours their own shape.
 * The cast must reach the placeholder without a branch, so each note pairs with its placeholder.
 */
internal fun BytecodePatchContext.hookInlineBadges(nameRows: List<Method>, itemType: String, url: FieldReference) {
    val toString = PlaceholderToStringFingerprint.matchSingle()
    val placeholderClass = toString.originalClassDef
    val placeholder = placeholderClass.type
    val fields = toStringFields(toString.originalMethod)
    val width = fields.field("Placeholder", "width", "J")
    val height = fields.field("Placeholder", "height", "J")
    val align = fields.field("Placeholder", "placeholderVerticalAlign", "I")
    val constructor = placeholderClass.methods.filter { it.name == "<init>" && it.types.sorted() == listOf("I", "J", "J") }
        .single("Placeholder constructor")

    // Which constructor parameter becomes which field.
    val flow = RegisterFlow(constructor)
    fun parameterOf(field: FieldReference): Int = flow.instructions.indices
        .filter { flow.instructions[it].fieldRef?.descriptor == field.descriptor && flow.instructions[it].opcode in STORES }
        .mapNotNull { i -> flow.valuesAt(i, (flow.instructions[i] as TwoRegisterInstruction).registerA).singleOrNull() as? Abstract.Parameter }
        .map { it.index }.distinct().singleOrNull()
        ?: throw PatchException("Placeholder doesn't store ${field.name} from one parameter")
    val roles = mapOf(parameterOf(width) to "p0", parameterOf(height) to "p2", parameterOf(align) to "p4")
    if (roles.size != 3) throw PatchException("Placeholder stores two sizes from one parameter")

    // placeholder(width, height, align): p0-p1, p2-p3 and p4, moved into the constructor's order.
    var register = 1
    val moves = constructor.types.mapIndexed { i, type ->
        val move = (if (type == "J") "move-wide/from16" else "move/from16") + " v$register, ${roles.getValue(i)}"
        register += if (type == "J") 2 else 1
        move
    }
    fun stub(name: String, locals: Int, smali: String) = replaceStub(BRIDGE_CLASS, name, locals, smali)
    stub(
        "placeholder", register,
        """
        new-instance v0, $placeholder
        ${moves.joinToString("\n")}
        invoke-direct/range { v0 .. v${register - 1} }, ${constructor.descriptor}
        return-object v0
        """,
    )
    stub("placeholderWidth", 2, "check-cast p0, $placeholder\niget-wide v0, p0, ${width.descriptor}\nreturn-wide v0")
    stub("placeholderHeight", 2, "check-cast p0, $placeholder\niget-wide v0, p0, ${height.descriptor}\nreturn-wide v0")
    stub("placeholderAlign", 1, "check-cast p0, $placeholder\niget v0, p0, ${align.descriptor}\nreturn v0")
    stub(
        "badgeUrl", 1,
        """
        instance-of v0, p0, $itemType
        if-eqz v0, :none
        check-cast p0, $itemType
        iget-object v0, p0, ${url.descriptor}
        return-object v0
        :none
        const/4 v0, 0x0
        return-object v0
        """,
    )

    // A row's badge items are cast to the item type or one of its supertypes.
    val itemTypes = generateSequence(classDefBy(itemType)) { c -> c.superclass?.let { classDefByOrNull(it) } }
        .flatMap { sequenceOf(it.type) + it.interfaces.asSequence() }.toSet() - "Ljava/lang/Object;"
    var sites = 0
    nameRows.forEach { row ->
        val method = mutableMethodOf(row)
        val instructions = method.instructionList
        val inserts = mutableListOf<Pair<Int, String>>()
        instructions.forEachIndexed { i, instruction ->
            if (instruction.methodRef?.descriptor != constructor.descriptor) return@forEachIndexed
            val cast = (i - 1 downTo 0).firstOrNull { j ->
                instructions[j].opcode == Opcode.CHECK_CAST && instructions[j].typeRef in itemTypes
            } ?: throw PatchException("No badge item before a placeholder in ${row.definingClass}->${row.name}")
            if ((cast + 1 until i).any { instructions[it].endsBlock() }) {
                throw PatchException("A badge item doesn't reach its placeholder in ${row.definingClass}->${row.name}")
            }
            val item = (instructions[cast] as OneRegisterInstruction).registerA
            val receiver = instruction.argumentRegisters()[0]
            if (receiver > 255) throw PatchException("Placeholder register v$receiver is out of reach")
            inserts += cast + 1 to "invoke-static/range { v$item .. v$item }, $HOOKS_CLASS->noteInlineBadge($OBJECT)V"
            inserts += i + 1 to """
                invoke-static/range { v$receiver .. v$receiver }, $HOOKS_CLASS->inlineBadgePlaceholder($OBJECT)$OBJECT
                move-result-object v$receiver
                check-cast v$receiver, $placeholder
            """
            sites++
        }
        inserts.sortedByDescending { it.first }.forEach { (index, smali) -> method.addInstructions(index, smali) }
    }
    if (sites == 0) throw PatchException("No name row lays out badges as inline content")
    requirePublic(placeholder, constructor, width, height, align, itemType, url)
}

private val STORES = setOf(Opcode.IPUT, Opcode.IPUT_WIDE)

private fun Instruction.endsBlock() = this is OffsetInstruction || opcode in setOf(
    Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW,
)

private val Method.types get() = parameterTypes.map { it.toString() }