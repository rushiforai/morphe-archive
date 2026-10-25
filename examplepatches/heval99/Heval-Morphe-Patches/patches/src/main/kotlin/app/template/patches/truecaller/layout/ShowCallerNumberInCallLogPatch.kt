package app.template.patches.truecaller.layout

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.truecaller.shared.toStringFields
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

internal const val CALL_LOG_SUBTITLE_HELPER = "morpheCallLogSubtitle"

private const val STRING = "Ljava/lang/String;"

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

// The revamped call log shows a caller who is not in the phonebook by the name Truecaller found,
// with the call type or a text label (block reason, spam score) underneath, but never the number.
// The row mapper builds each row (HistoryEntry) from a CallLogHistoryEntryData and picks the
// subtitle label in a chain of branches that all meet right before the row is built. There a new
// static helper replaces the label: for a non-contact (phonebookId 0, the same test the mapper uses
// for "Save contact") that is not blocked and has a name and a number, the number (formatted for the
// row's country when that is a two-letter code), after " · " when there already is a text label.
// Resource labels (recording, video, WhatsApp, screening, voicemail) are kept as they are (owner
// decision). Any exception in the helper keeps the stock label. Only the revamped call log uses this
// mapper; with "Restore classic call log" the classic list is shown instead.
@Suppress("unused")
val showCallerNumberInCallLogPatch = bytecodePatch(
    name = "Show caller number in call log",
    description = "Shows the caller's number in the new call log for callers who aren't in your contacts.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // 1. CallLogHistoryEntryData, mapped by its toString labels. The spam and block labels are not
        // read by the helper, but the mapper's text labels come from them, so a reshaped model fails here.
        val sourceType = CallLogHistoryEntryDataToStringFingerprint.classDef.type
        val sourceFields = toStringFields(CallLogHistoryEntryDataToStringFingerprint.method, sourceType)
        fun sourceField(name: String, type: String) = sourceFields.single(sourceType, name, type)
        val phonebookId = sourceField("phonebookId", "J")
        val number = sourceField("normalisedNumber", STRING)
        val countryCode = sourceField("countryCode", STRING)
        val callerName = sourceField("name", STRING)
        val isBlocked = sourceField("isBlocked", "Z")
        sourceField("isSpam", "Z")
        sourceField("spamScoreLabel", STRING)
        sourceField("blockReasonLabel", STRING)

        // 2. The row (HistoryEntry): its normalisedNumber and subtitleLabel fields.
        val rowClass = CallLogHistoryRowToStringFingerprint.classDef
        val rowFields = toStringFields(CallLogHistoryRowToStringFingerprint.method, rowClass.type)
        val rowNumber = rowFields.single(rowClass.type, "normalisedNumber", STRING)
        val rowSubtitle = rowFields.single(rowClass.type, "subtitleLabel", null)
        val labelType = rowSubtitle.type
        if (!labelType.startsWith("L")) throw PatchException("HistoryEntry.subtitleLabel has type $labelType, expected a class")

        // 3. The mapper builds exactly one row, with invoke-direct/range; the constructor's stores
        // say which arguments are the subtitle label and the number.
        val mapperClass = CallLogRowMapperFingerprint.classDef
        val mapper = CallLogRowMapperFingerprint.method
        val where = "${mapperClass.type}->${mapper.name}(List)"
        val instructions = mapper.instructions.toList()
        val constructions = instructions.indices.filter { instructions[it].call()?.isConstructorOf(rowClass.type) == true }
        val construction = constructions.singleOrNull()
            ?: throw PatchException("$where builds ${constructions.size} HistoryEntry rows, expected one")
        val build = instructions[construction] as? RegisterRangeInstruction
            ?: throw PatchException("$where does not build its HistoryEntry with invoke-direct/range")
        val constructorParameters = instructions[construction].call()!!.parameterTypes.map(CharSequence::toString)
        val constructor = rowClass.methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == constructorParameters
        } ?: throw PatchException("${rowClass.type} has no constructor $constructorParameters")
        val subtitleParameter = constructor.parameterStoredIn(rowSubtitle)
        val numberParameter = constructor.parameterStoredIn(rowNumber)
        if (constructorParameters[subtitleParameter] != labelType) {
            throw PatchException("${rowClass.type}.<init> takes the subtitle label as ${constructorParameters[subtitleParameter]}")
        }
        fun argumentRegister(parameter: Int) =
            build.startRegister + 1 + constructorParameters.take(parameter).sumOf { if (it == "J" || it == "D") 2 else 1 }
        val labelRegister = argumentRegister(subtitleParameter)
        val numberArgument = argumentRegister(numberParameter)
        if (labelRegister > 255) throw PatchException("$where: the subtitle label is in v$labelRegister, out of move/from16 range")

        // 4. The CallLogHistoryEntryData element: the first check-cast to it, kept up to the row. The
        // mapper passes its normalisedNumber as the row's normalisedNumber.
        val cast = instructions.indexOfFirst { it.opcode == Opcode.CHECK_CAST && it.type() == sourceType }
        if (cast !in 0 until construction) throw PatchException("$where does not cast its list elements to $sourceType")
        val entryRegister = (instructions[cast] as OneRegisterInstruction).registerA
        if ((cast + 1 until construction).any { instructions[it].writes(entryRegister) }) {
            throw PatchException("$where overwrites the CallLogHistoryEntryData in v$entryRegister before building the row")
        }
        val passesNumber = (cast until construction).any { index ->
            val read = instructions[index]
            if (read.opcode != Opcode.IGET_OBJECT || !read.field().sameAs(number) || (read as TwoRegisterInstruction).registerB != entryRegister) {
                return@any false
            }
            val value = read.registerA
            if (value == numberArgument) return@any true
            val next = (index + 1 until construction).firstOrNull { instructions[it].writes(value) || instructions[it].writes(numberArgument) }
                ?.let { instructions[it] }
            next is TwoRegisterInstruction && next.opcode in MOVE_OBJECTS && next.registerA == numberArgument && next.registerB == value
        }
        if (!passesNumber) throw PatchException("$where does not pass ${number.name} as the row's normalisedNumber (v$numberArgument)")

        // 5. The join: the label branches each store into the label register and fall through or jump
        // to one instruction, after which nothing writes it before the row is built.
        val lastRead = (construction - 1 downTo 0).firstOrNull { labelRegister in instructions[it].reads() } ?: -1
        val labelWrites = (lastRead + 1 until construction).filter { instructions[it].writes(labelRegister) }
        if (labelWrites.isEmpty()) throw PatchException("$where never sets the subtitle label (v$labelRegister)")
        val join = labelWrites.last() + 1
        if (join + 1 >= construction) throw PatchException("$where has no join between the subtitle label and the row")
        for (write in labelWrites) {
            val next = instructions[write + 1]
            val reachesJoin = write + 1 == join ||
                (next.opcode in GOTOS && (next as BuilderOffsetInstruction).target.location.index == join)
            if (!reachesJoin) throw PatchException("$where: the subtitle label set at $write does not go on to the join at $join")
        }
        if (labelWrites.size > 1 && instructions[join].location.labels.isEmpty()) {
            throw PatchException("$where: the join at $join is no branch target")
        }

        // 6. Two scratch registers that are dead at the join: its first instruction writes one without
        // reading it, the second writes the other, neither reads the second, and no catch covers them.
        val first = instructions[join]
        val second = instructions[join + 1]
        val scratchLabel = first.singleWritten()
        val scratchEntry = second.singleWritten()
        if (first is BuilderOffsetInstruction || !first.opcode.canContinue() || scratchLabel == null || scratchEntry == null ||
            scratchLabel == scratchEntry || scratchLabel in first.reads() || scratchEntry in first.reads() ||
            scratchEntry in second.reads()
        ) {
            throw PatchException("$where: the join's first two instructions (${first.opcode}, ${second.opcode}) do not free two registers")
        }
        if (scratchLabel > 15 || scratchEntry > 15 || setOf(scratchLabel, scratchEntry).any { it == labelRegister || it == entryRegister }) {
            throw PatchException("$where: scratch registers v$scratchLabel / v$scratchEntry are unusable")
        }
        if (mapper.implementation!!.tryBlocks.any { join + 1 >= it.start.location.index && join < it.end.location.index }) {
            throw PatchException("$where: the join is inside a try block")
        }
        // The element is still read as CallLogHistoryEntryData after the join (so the verifier knows its type there).
        if ((join until construction).none { instructions[it].field()?.definingClass == sourceType && instructions[it].objectRegister() == entryRegister }) {
            throw PatchException("$where does not read the CallLogHistoryEntryData after the join")
        }

        // 7. The text label: the class the mapper builds with (String) whose superclass is the label type,
        // and whose toString prints "Text(text=".
        val textTypes = instructions.mapNotNull { instruction ->
            val call = instruction.call() ?: return@mapNotNull null
            call.definingClass.takeIf {
                (instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) &&
                    call.name == "<init>" && call.parameterTypes.map(CharSequence::toString) == listOf(STRING)
            }
        }.distinct().filter { type ->
            instructions.any { it.opcode == Opcode.NEW_INSTANCE && it.type() == type } && classDefByOrNull(type)?.superclass == labelType
        }
        val textType = textTypes.singleOrNull()
            ?: throw PatchException("$where builds ${textTypes.size} (String) subtitle labels $textTypes, expected one")
        val textClass = classDefByOrNull(textType) ?: throw PatchException("$textType not found")
        val printsText = textClass.methods.any { method ->
            method.name == "toString" && method.parameterTypes.isEmpty() &&
                method.implementation?.instructions?.any { it.string()?.startsWith("Text(text=") == true } == true
        }
        if (!printsText) throw PatchException("$textType.toString does not print \"Text(text=\"")
        val textFields = textClass.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == STRING }
        val textField = textFields.singleOrNull() ?: throw PatchException("$textType has ${textFields.size} String fields, expected one")
        val textConstructor = textClass.methods.singleOrNull {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(STRING)
        } ?: throw PatchException("$textType has no (String) constructor")
        if (textConstructor.parameterStoredIn(textField) != 0) throw PatchException("$textType.<init> does not store its text in ${textField.name}")

        // 8. The helper morpheCallLogSubtitle(entry, label): label. v0..v3 are locals, p0 = v4, p1 = v5.
        // Every early exit and the catch-all for Exception return the label unchanged.
        if (mapperClass.methods.any { it.name == CALL_LOG_SUBTITLE_HELPER }) {
            throw PatchException("${mapperClass.type} already has $CALL_LOG_SUBTITLE_HELPER")
        }
        val helper = ImmutableMethod(
            mapperClass.type,
            CALL_LOG_SUBTITLE_HELPER,
            listOf(ImmutableMethodParameter(sourceType, null, null), ImmutableMethodParameter(labelType, null, null)),
            labelType,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(6),
        ).toMutable().apply {
            addInstructionsWithLabelsChecked(
                0,
                """
                    iget-wide v0, p0, ${phonebookId.smali()}
                    const-wide/16 v2, 0x0
                    cmp-long v0, v0, v2
                    if-nez v0, :keep
                    iget-boolean v0, p0, ${isBlocked.smali()}
                    if-nez v0, :keep
                    iget-object v0, p0, ${callerName.smali()}
                    if-eqz v0, :keep
                    invoke-static {v0}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I
                    move-result v0
                    if-eqz v0, :keep
                    iget-object v0, p0, ${number.smali()}
                    if-eqz v0, :keep
                    invoke-static {v0}, Landroid/text/TextUtils;->getTrimmedLength(Ljava/lang/CharSequence;)I
                    move-result v1
                    if-eqz v1, :keep
                    const/4 v1, 0x0
                    if-eqz p1, :format
                    instance-of v2, p1, $textType
                    if-eqz v2, :keep
                    move-object v2, p1
                    check-cast v2, $textType
                    iget-object v1, v2, ${textField.smali()}
                    :format
                    iget-object v2, p0, ${countryCode.smali()}
                    if-eqz v2, :text
                    invoke-virtual {v2}, Ljava/lang/String;->length()I
                    move-result v3
                    add-int/lit8 v3, v3, -0x2
                    if-nez v3, :text
                    const/4 v3, 0x0
                    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C
                    move-result v3
                    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z
                    move-result v3
                    if-eqz v3, :text
                    const/4 v3, 0x1
                    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C
                    move-result v3
                    invoke-static {v3}, Ljava/lang/Character;->isLetter(C)Z
                    move-result v3
                    if-eqz v3, :text
                    sget-object v3, Ljava/util/Locale;->ROOT:Ljava/util/Locale;
                    invoke-virtual {v2, v3}, Ljava/lang/String;->toUpperCase(Ljava/util/Locale;)Ljava/lang/String;
                    move-result-object v2
                    invoke-static {v0, v2}, Landroid/telephony/PhoneNumberUtils;->formatNumber(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v2
                    if-eqz v2, :text
                    move-object v0, v2
                    :text
                    if-eqz v1, :number_only
                    invoke-virtual {v1}, Ljava/lang/String;->length()I
                    move-result v2
                    if-eqz v2, :number_only
                    new-instance v2, Ljava/lang/StringBuilder;
                    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
                    const-string v3, "$SEPARATOR_SMALI"
                    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
                    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
                    move-result-object v0
                    :number_only
                    new-instance v1, $textType
                    invoke-direct {v1, v0}, $textType-><init>(Ljava/lang/String;)V
                    return-object v1
                    :keep
                    return-object p1
                """,
            )
            val implementation = implementation!!
            val keep = implementation.instructions.size - 1
            val last = implementation.instructions[keep]
            if (last.opcode != Opcode.RETURN_OBJECT || (last as OneRegisterInstruction).registerA != 5) {
                throw PatchException("$CALL_LOG_SUBTITLE_HELPER does not end with return-object p1")
            }
            implementation.addCatch(
                "Ljava/lang/Exception;",
                implementation.newLabelForIndex(0),
                implementation.newLabelForIndex(keep),
                implementation.newLabelForIndex(keep),
            )
        }
        mapperClass.methods.add(helper)

        // 9. At the join: label = helper(entry, label), through the two scratch registers. The join's
        // labels move to the inserted code, so every label branch runs it.
        mapper.addInstructionsAtControlFlowLabelChecked(
            join,
            """
                move-object/from16 v$scratchLabel, v$labelRegister
                move-object/from16 v$scratchEntry, v$entryRegister
                invoke-static {v$scratchEntry, v$scratchLabel}, ${mapperClass.type}->$CALL_LOG_SUBTITLE_HELPER($sourceType$labelType)$labelType
                move-result-object v$scratchLabel
                move-object/from16 v$labelRegister, v$scratchLabel
            """,
        )
    }
}

internal const val CALL_LOG_NUMBER_SEPARATOR = " · "

/** " · " (middle dot) as a smali string literal. */
private const val SEPARATOR_SMALI = " \\u00b7 "

private val MOVE_OBJECTS = setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)

private fun List<Pair<String, FieldReference>>.single(owner: String, name: String, type: String?): FieldReference {
    val fields = filter { it.first == name }.map { it.second }.distinctBy { it.smali() }
    val field = fields.singleOrNull() ?: throw PatchException("$owner.toString prints $name from fields ${fields.map { it.name }}")
    if (type != null && field.type != type) throw PatchException("$owner.$name (${field.name}) has type ${field.type}, expected $type")
    return field
}

private fun FieldReference.smali() = "$definingClass->$name:$type"

private fun FieldReference?.sameAs(other: FieldReference) = this != null && smali() == other.smali()

private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.type() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun MethodReference.isConstructorOf(type: String) = definingClass == type && name == "<init>"

/** The object register of an instance field access. */
private fun Instruction.objectRegister() = (this as? TwoRegisterInstruction)?.registerB

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

/** The register a non-wide write sets, or null. */
private fun Instruction.singleWritten(): Int? {
    if (!opcode.setsRegister() || opcode.setsWideRegister()) return null
    if (opcode == Opcode.MOVE_RESULT || opcode == Opcode.MOVE_RESULT_OBJECT || opcode == Opcode.MOVE_EXCEPTION) return null
    return (this as? OneRegisterInstruction)?.registerA
}

/** Registers the instruction may read; errs towards too many (wide operands count both halves). */
private fun Instruction.reads(): Set<Int> {
    val opcodeName = (opcode as Enum<*>).name
    val read = when (this) {
        is RegisterRangeInstruction -> return (startRegister until startRegister + registerCount).toSet()
        is FiveRegisterInstruction -> return listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount).toSet()
        is ThreeRegisterInstruction -> listOfNotNull(registerB, registerC, registerA.takeUnless { opcode.setsRegister() })
        is TwoRegisterInstruction ->
            listOfNotNull(registerB, registerA.takeIf { !opcode.setsRegister() || opcodeName.endsWith("_2ADDR") })
        is OneRegisterInstruction -> listOfNotNull(registerA.takeIf { !opcode.setsRegister() || opcode == Opcode.CHECK_CAST })
        else -> emptyList()
    }
    val wide = listOf("WIDE", "LONG", "DOUBLE").any { it in opcodeName }
    return if (wide) read.flatMap { listOf(it, it + 1) }.toSet() else read.toSet()
}

/** Index of the constructor parameter stored into [field] (directly or through one move from a parameter). */
private fun Method.parameterStoredIn(field: FieldReference): Int {
    val implementation = implementation ?: throw PatchException("$definingClass.$name has no code")
    val parameters = parameterTypes.map(CharSequence::toString)
    val thisRegister = implementation.registerCount - 1 - parameters.sumOf { if (it == "J" || it == "D") 2 else 1 }
    val parameterOf = parameters.runningFold(thisRegister + 1) { register, type -> register + if (type == "J" || type == "D") 2 else 1 }
        .dropLast(1).withIndex().associate { (index, register) -> register to index }
    val instructions = implementation.instructions.toList()
    val store = instructions.indexOfFirst {
        it.opcode in INSTANCE_FIELD_STORES && it.field().sameAs(field) && (it as TwoRegisterInstruction).registerB == thisRegister
    }
    if (store < 0) throw PatchException("$definingClass.$name does not store ${field.name}")
    val value = (instructions[store] as TwoRegisterInstruction).registerA
    // A parameter register that nothing wrote before the store, or one move away from such a register.
    fun untouchedParameter(register: Int, before: Int) =
        parameterOf[register]?.takeIf { instructions.subList(0, before).none { it.writes(register) } }
    untouchedParameter(value, store)?.let { return it }
    val moveIndex = instructions.subList(0, store).indexOfLast { it.writes(value) }
    val move = instructions.getOrNull(moveIndex) as? TwoRegisterInstruction
    return move?.takeIf { it.opcode in MOVE_OBJECTS || it.opcode == Opcode.MOVE_FROM16 || it.opcode == Opcode.MOVE_16 }
        ?.let { untouchedParameter(it.registerB, moveIndex) }
        ?: throw PatchException("$definingClass.$name stores ${field.name} from v$value, not from a parameter")
}

private val INSTANCE_FIELD_STORES = setOf(
    Opcode.IPUT, Opcode.IPUT_WIDE, Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN,
    Opcode.IPUT_BYTE, Opcode.IPUT_CHAR, Opcode.IPUT_SHORT,
)
