package app.template.patches.flashscore.spoiler

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.flashscore.controls.flashscoreControls
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val STRING = "Ljava/lang/String;"
private const val VIEW = "Landroid/view/View;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"

private fun Method.params() = parameterTypes.map(CharSequence::toString)
private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

/** The duel row binder: instance V method taking (row, EventListDuelHolder) (26.11.6: m30.d(ig7, ...)). */
internal class RowBinder(val type: String, val method: Method) {
    val rowType: String get() = method.parameterTypes[0].toString()
}

/** Finds the one (row, EventListDuelHolder)V row binder by shape; throws on any other count. */
internal fun BytecodePatchContext.findRowBinder(): RowBinder {
    val binders = mutableListOf<RowBinder>()
    classDefForEach { classDef ->
        classDef.methods.forEach {
            if (it.returnType == "V" && !it.isStatic() && it.implementation != null &&
                it.parameterTypes.size == 2 && it.params()[1] == DUEL_HOLDER && !it.params()[0].startsWith("Ljava/")
            ) binders += RowBinder(classDef.type, it)
        }
    }
    return binders.singleOrNull()
        ?: throw PatchException("${binders.size} (row, EventListDuelHolder)V row binders, expected one")
}

/**
 * EventModel's event id: the String field its (String, ...) constructor stores its first parameter
 * in (26.11.6: jn7.<init>(String, na7, o9c) -> jn7.c), before p1 is reused. Exactly one field.
 */
private fun eventIdField(model: ClassDef): FieldReference {
    val fields = model.methods.filter {
        it.name == "<init>" && it.params().firstOrNull() == STRING && it.implementation != null
    }.mapNotNull { ctor ->
        val code = ctor.implementation!!
        val p1 = code.registerCount - ctor.params().sumOf { if (it == "J" || it == "D") 2 else 1 }
        code.instructions.takeWhile { insn ->
            !(insn.opcode.setsRegister() && (insn as? OneRegisterInstruction)?.registerA == p1)
        }.firstNotNullOfOrNull { insn ->
            val field = (insn as? ReferenceInstruction)?.reference as? FieldReference
            field?.takeIf {
                insn.opcode == Opcode.IPUT_OBJECT && (insn as TwoRegisterInstruction).registerA == p1 &&
                    it.definingClass == model.type && it.type == STRING
            }
        }
    }.distinctBy { it.name }
    return fields.singleOrNull()
        ?: throw PatchException("${model.type}: ${fields.size} String fields take the constructors' first parameter, expected one (the event id)")
}

/** Rewrites the body of an extension stub (it answers stock until patched). */
internal fun MutableMethod.rewriteStub(smali: String) {
    if ((implementation?.registerCount ?: 0) < 1) throw PatchException("$definingClass->$name has no register")
    addInstructionsChecked(0, smali)
}

/** The one static method [name] of an extension class [methods] belong to. */
internal fun Iterable<MutableMethod>.stub(owner: String, name: String) = singleOrNull { it.name == name && it.isStatic() }
    ?: throw PatchException("$owner has no static $name")

/**
 * The match row hook shared by "Spoiler-free mode" and "Hide competitions" (2026-11-14, stage B2; split
 * out of the spoiler patch so either patch works without the other). The duel row binder calls
 * SpoilerFree.unmaskRow(holder) first and SpoilerFree.maskRow(row, holder) before its only return-void;
 * maskRow installs the row's long press (whose dialog offers the entries of the switches that are on)
 * and masks marked matches. Writes SpoilerFree.eventId(row) (the row's EventModel id) and
 * SpoilerFree.eventModel(row) (the row's EventModel). Checks the kept holder members SpoilerFree
 * reaches by reflection for the dialog title (getRoot, getEventViewHolder, homeName, awayName).
 */
internal val flashscoreMatchRowPatch = bytecodePatch(
    description = "Adds a long-press dialog to Flashscore's match list rows.",
) {
    compatibleWith(COMPATIBILITY_FLASHSCORE)

    // The Flashscore extension comes with the Patch settings host (its Settings row lives there).
    dependsOn(flashscoreControls.patch)

    execute {
        classDefBy(SPOILER_FREE)

        // Find every site before the first edit.
        val found = findRowBinder()
        val binder = mutableClassDefBy(found.type).methods.filter {
            it.implementation != null && it.name == found.method.name && it.params() == found.method.params() && it.returnType == "V"
        }.singleOrNull() ?: throw PatchException("${found.type}->${found.method.name}: the row binder is not unique")
        val rowType = found.rowType
        val registers = binder.implementation!!.registerCount
        val p1 = registers - 2
        val p2 = registers - 1
        val insns = binder.instructions.toList()
        val returns = insns.indices.filter { insns[it].opcode == Opcode.RETURN_VOID }
        val ret = returns.singleOrNull() ?: throw PatchException("${found.type}->${binder.name} has ${returns.size} return-voids, expected one")
        if (insns.any { insn ->
                insn.opcode.setsRegister() && (insn as? OneRegisterInstruction)?.registerA.let { it == p1 || it == p2 } ||
                    insn.opcode.setsWideRegister() && (insn as? OneRegisterInstruction)?.registerA.let { it == p1 - 1 || it == p2 - 1 }
            }
        ) throw PatchException("${found.type}->${binder.name} writes p1 or p2")
        binder.requireNoBranchTargetAt(0, "Match row unmask hook")
        binder.requireNoBranchTargetAt(ret, "Match row mask hook")

        // The row's EventModel and its event id.
        val model = classByToString(EVENT_MODEL_TO_STRING)
        val modelFields = classDefBy(rowType).fields.filter { it.type == model.type && !AccessFlags.STATIC.isSet(it.accessFlags) }
        val modelField = modelFields.singleOrNull()
            ?: throw PatchException("$rowType has ${modelFields.size} ${model.type} fields, expected one (the event)")
        val idField = eventIdField(model)

        // The holder's kept members SpoilerFree reaches by reflection (Class.getMethod / getField see
        // only public members): getRoot (the long press) and the name views (the dialog title).
        fun publicGetter(type: String, name: String, returns: String? = null): Method {
            val method = classDefBy(type).methods.singleOrNull { it.name == name && it.parameterTypes.isEmpty() && !it.isStatic() }
                ?: throw PatchException("$type has no $name()")
            if (!AccessFlags.PUBLIC.isSet(method.accessFlags)) throw PatchException("$type.$name() is not public (SpoilerFree calls it by reflection)")
            if (returns != null && method.returnType != returns) throw PatchException("$type.$name() returns ${method.returnType}, expected $returns")
            return method
        }
        publicGetter(DUEL_HOLDER, "getRoot", VIEW)
        val eventView = publicGetter(DUEL_HOLDER, "getEventViewHolder").returnType
        listOf("homeName", "awayName").forEach { name ->
            val field = classDefBy(eventView).fields.singleOrNull { it.name == name && it.type == TEXT_VIEW }
                ?: throw PatchException("$eventView no longer has the TextView field $name")
            if (!AccessFlags.PUBLIC.isSet(field.accessFlags)) throw PatchException("$eventView.$name is not public (SpoilerFree reads it by reflection)")
        }

        val extension = mutableClassDefBy(SPOILER_FREE).methods
        val eventIdStub = extension.stub(SPOILER_FREE, "eventId")
        val eventModelStub = extension.stub(SPOILER_FREE, "eventModel")

        // Edits.
        eventIdStub.rewriteStub(
            """
                check-cast p0, $rowType
                iget-object p0, p0, $rowType->${modelField.name}:${model.type}
                iget-object p0, p0, ${model.type}->${idField.name}:$STRING
                return-object p0
            """,
        )
        eventModelStub.rewriteStub(
            """
                check-cast p0, $rowType
                iget-object p0, p0, $rowType->${modelField.name}:${model.type}
                return-object p0
            """,
        )

        // Later index first, so index 0 stays valid.
        binder.addInstructionsChecked(ret, "invoke-static/range { p1 .. p2 }, $SPOILER_FREE->maskRow(Ljava/lang/Object;Ljava/lang/Object;)V")
        binder.addInstructionsChecked(0, "invoke-static/range { p2 .. p2 }, $SPOILER_FREE->unmaskRow(Ljava/lang/Object;)V")
    }
}
