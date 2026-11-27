/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.shared.register
import app.fakh.patches.github.shared.Constants.HEADER_LABELS
import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val LABELS_FIELD = "fakhLabels"

private const val HEADER_LABELS_CLASS = "Lapp/fakh/extension/github/HeaderLabels;"

private const val LIST = "Ljava/util/List;"

/** The `toString` of the app's issue or pull request model, which names each of its fields. */
private object IssueModelFingerprint : Fingerprint(
    name = "toString",
    strings = listOf(", assignees=", ", labels=", ", viewerCanDeleteHeadRef="),
)

/** The constructor of the data behind the header of the issue and pull request screen. */
private object HeaderModelFingerprint : Fingerprint(
    name = "<init>",
    custom = { method, _ ->
        method.parameterTypes.size == 21 &&
            method.parameterTypes[2].toString() == "Lcom/github/service/models/response/Avatar\$Type;" &&
            method.parameterTypes[7].toString() ==
            "Lcom/github/service/models/response/issueorpullrequest/IssueType;"
    },
)

private val Instruction.typeName get() = ((this as? ReferenceInstruction)?.reference as? TypeReference)?.type

/** Whether this is a label chips composable: `(Modifier, List, TextStyle, Composer, Int, Int)` reading each label's name and color. */
private fun Method.drawsLabels(composer: String): Boolean {
    val types = parameterTypes.map(CharSequence::toString)
    if (types.size != 6 || types[1] != LIST || types[3] != composer || types[4] != "I" || types[5] != "I") return false
    val calls = implementation?.instructions?.mapNotNull { it.method } ?: return false
    return calls.any { it.name == "getName" && it.returnType == "Ljava/lang/String;" } &&
        calls.any { it.returnType == "I" && it.parameterTypes.isEmpty() && it.definingClass != composer }
}

/**
 * Adds a static `fakhLabels(model, composer)` composable to [owner] that draws the model's labels in one horizontally
 * scrolling row. Every Compose call in it is copied from the header's own row of chips in [chips], from [start] on,
 * since R8 renames them in each version.
 */
private fun addLabelsRow(
    owner: String,
    model: String,
    composer: String,
    chips: List<Instruction>,
    start: Int,
): String {
    val after = chips.drop(start)
    fun call(what: String, match: (MethodReference) -> Boolean) =
        after.firstNotNullOfOrNull { it.method?.takeIf(match) } ?: throw PatchException("Header row: $what not found")
    fun fieldAt(opcode: Opcode, what: String, match: (FieldReference) -> Boolean) =
        after.firstNotNullOfOrNull { it.field?.takeIf { field -> it.opcode == opcode && match(field) } }
            ?: throw PatchException("Header row: $what not found")

    val padding = call("padding") {
        it.types.size == 6 && it.types.subList(1, 6) == listOf("F", "F", "F", "F", "I") && it.returnType == it.types[0]
    }
    val modifier = padding.returnType
    val companion = fieldAt(Opcode.SGET_OBJECT, "Modifier companion") { it.type == it.definingClass }
    val fillWidth = call("fillMaxWidth") { it.types == listOf(modifier, "F") && it.returnType == modifier }
    val scrollState = call("rememberScrollState") {
        it.types == listOf(composer) && it.returnType.startsWith("L") && it.returnType != "Ljava/lang/String;"
    }
    val scroll = call("horizontalScroll") {
        it.types == listOf(modifier, scrollState.returnType, "Z") && it.returnType == modifier
    }
    val measure = call("row measure policy") { it.types.size == 4 && it.types[2] == composer && it.types[3] == "I" }
    val measureAt = after.indexOfFirst { it.method == measure }
    val rowArguments = after.take(measureAt).filter { it.opcode == Opcode.SGET_OBJECT }.takeLast(2).map { it.field!! }
    val keyHash = fieldAt(Opcode.IGET_WIDE, "composite key hash") { it.definingClass == composer && it.type == "J" }
    val locals = call("composition locals") {
        it.definingClass == composer && it.types.isEmpty() && it.returnType.startsWith("L")
    }
    val materialize = call("materialize") { it.types == listOf(composer, modifier) && it.returnType == modifier }
    val inserting = fieldAt(Opcode.IGET_BOOLEAN, "inserting") { it.definingClass == composer }
    val insertingAt = after.indexOfFirst { it.field == inserting }
    val nodeCalls = after.drop(insertingAt - 1).mapNotNull { it.method }.filter { it.definingClass == composer }
    val startNode = after.take(insertingAt).last { it.method?.definingClass == composer }.method!!
    val createNode = nodeCalls.first { it.types.size == 1 && it.returnType == "V" && it.types[0].startsWith("L") }
    val useNode = nodeCalls.first { it.types.isEmpty() && it.returnType == "V" && it.name != startNode.name }
    // The node factory is loaded into a register near the top of the method, before the case that uses it.
    val factory = chips.firstNotNullOfOrNull {
        it.field?.takeIf { field ->
            it.opcode == Opcode.SGET_OBJECT &&
                classDefByOrNull(field.type)?.interfaces?.contains(createNode.types[0]) == true
        }
    } ?: throw PatchException("Header row: node factory not found")
    val setters = after.drop(insertingAt).filter { it.opcode == Opcode.SGET_OBJECT }.take(4).map { it.field!! }
    val set = after.drop(insertingAt).mapNotNull { it.method }.first {
        it.types.size == 3 && it.types[1] == composer && it.types[2] == "Ljava/lang/Object;"
    }
    val applied = after.drop(insertingAt).mapNotNull { it.method }.first {
        it.definingClass == set.definingClass && it.types == listOf(composer)
    }
    val spacer = call("spacer") { it.types == listOf(composer, modifier) && it.returnType == "V" }
    val endGroup = call("end group") { it.definingClass == composer && it.types == listOf("Z") && it.returnType == "V" }
    val startGroup = call("start group") { it.definingClass == composer && it.types == listOf("I") && it.returnType == "V" }

    var chipsMethod: MethodReference? = null
    classDefForEach { classDef ->
        classDef.methods.firstOrNull { it.drawsLabels(composer) }?.let {
            if (chipsMethod != null) throw PatchException("More than one label chips composable")
            chipsMethod = it
        }
    }
    val labelChips = chipsMethod ?: throw PatchException("Label chips composable not found")

    val name = "fakhLabels"
    mutableClassDefBy(owner).methods.add(
        ImmutableMethod(
            owner,
            name,
            listOf(ImmutableMethodParameter(model, null, null), ImmutableMethodParameter(composer, null, null)),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            MutableMethodImplementation(11),
        ).toMutable().apply {
            // Registers: v0 the labels, v1 their count, v2 the index; p0 is v9 and p1 is v10.
            addInstructionsWithLabels(
                0,
                """
                    const v0, 0x66616b68
                    invoke-virtual { p1, v0 }, ${startGroup.smali}
                    iget-object v0, p0, $model->$LABELS_FIELD:$LIST
                    if-eqz v0, :end
                    invoke-interface { v0 }, Ljava/util/List;->isEmpty()Z
                    move-result v1
                    if-nez v1, :end

                    sget-object v1, ${companion.smali}
                    const/4 v2, 0x0
                    const/4 v3, 0x0
                    const/4 v4, 0x0
                    const/high16 v5, 0x41800000
                    const/4 v6, 0x7
                    invoke-static/range { v1 .. v6 }, ${padding.smali}
                    move-result-object v1
                    const/high16 v2, 0x3f800000
                    invoke-static { v1, v2 }, ${fillWidth.smali}
                    move-result-object v1
                    invoke-static { p1 }, ${scrollState.smali}
                    move-result-object v2
                    const/4 v3, 0x0
                    invoke-static { v1, v2, v3 }, ${scroll.smali}
                    move-result-object v1
                    sget-object v2, ${rowArguments[0].smali}
                    sget-object v3, ${rowArguments[1].smali}
                    const/4 v4, 0x0
                    invoke-static { v2, v3, p1, v4 }, ${measure.smali}
                    move-result-object v2
                    iget-wide v3, p1, ${keyHash.smali}
                    invoke-static { v3, v4 }, Ljava/lang/Long;->hashCode(J)I
                    move-result v3
                    invoke-virtual { p1 }, ${locals.smali}
                    move-result-object v4
                    invoke-static { p1, v1 }, ${materialize.smali}
                    move-result-object v1
                    invoke-virtual { p1 }, ${startNode.smali}
                    iget-boolean v5, p1, ${inserting.smali}
                    if-eqz v5, :reuse
                    sget-object v5, ${factory.smali}
                    invoke-virtual { p1, v5 }, ${createNode.smali}
                    goto :update
                    :reuse
                    invoke-virtual { p1 }, ${useNode.smali}
                    :update
                    sget-object v5, ${setters[0].smali}
                    invoke-static { v5, p1, v2 }, ${set.smali}
                    sget-object v5, ${setters[1].smali}
                    invoke-static { v5, p1, v4 }, ${set.smali}
                    invoke-static { v3 }, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                    move-result-object v3
                    sget-object v5, ${setters[2].smali}
                    invoke-static { v5, p1, v3 }, ${set.smali}
                    invoke-static { p1 }, ${applied.smali}
                    sget-object v5, ${setters[3].smali}
                    invoke-static { v5, p1, v1 }, ${set.smali}

                    invoke-interface { v0 }, Ljava/util/List;->size()I
                    move-result v1
                    const/4 v2, 0x0
                    :next
                    if-ge v2, v1, :done
                    sget-object v3, ${companion.smali}
                    const/high16 v4, 0x41000000
                    if-nez v2, :gap
                    const/high16 v4, 0x41800000
                    :gap
                    const/4 v5, 0x0
                    const/4 v6, 0x0
                    const/4 v7, 0x0
                    const/16 v8, 0xe
                    invoke-static/range { v3 .. v8 }, ${padding.smali}
                    move-result-object v3
                    invoke-static { p1, v3 }, ${spacer.smali}
                    invoke-interface { v0, v2 }, Ljava/util/List;->get(I)Ljava/lang/Object;
                    move-result-object v3
                    invoke-static { v3 }, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;
                    move-result-object v4
                    const/4 v3, 0x0
                    const/4 v5, 0x0
                    move-object/from16 v6, p1
                    const/4 v7, 0x0
                    const/4 v8, 0x5
                    invoke-static/range { v3 .. v8 }, ${labelChips.smali}
                    add-int/lit8 v2, v2, 0x1
                    goto :next
                    :done
                    sget-object v3, ${companion.smali}
                    const/4 v4, 0x0
                    const/4 v5, 0x0
                    const/high16 v6, 0x41800000
                    const/4 v7, 0x0
                    const/16 v8, 0xb
                    invoke-static/range { v3 .. v8 }, ${padding.smali}
                    move-result-object v3
                    invoke-static { p1, v3 }, ${spacer.smali}
                    const/4 v0, 0x1
                    invoke-virtual { p1, v0 }, ${endGroup.smali}

                    :end
                    const/4 v0, 0x0
                    invoke-virtual { p1, v0 }, ${endGroup.smali}
                    return-void
                """,
            )
        },
    )
    return "$owner->$name($model$composer)V"
}

@Suppress("unused")
val headerLabelsPatch = patch(
    name = "Labels in the header",
    description = "Shows the labels of an issue or pull request under its title, in a row you can swipe sideways.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch)
    extendWith("extensions/extension.mpe")

    execute {
        register(HEADER_LABELS)

        // The GraphQL fragments have a `toString` like this one too; the model is the one the header is built from.
        val issueModels = IssueModelFingerprint.matchAll().map { it.originalMethod }.associateBy { it.definingClass }

        val model = HeaderModelFingerprint.method.definingClass

        // The header composable takes the model right before the composer and the changed and default bit masks.
        val headers = mutableListOf<Pair<String, String>>()
        val rows = mutableListOf<Pair<String, String>>()
        val builders = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions ?: return@forEach
                val types = method.parameterTypes.map(CharSequence::toString)
                val key = classDef.type to method.name
                if (AccessFlags.STATIC.isSet(method.accessFlags) && types.size > 3 && types.indexOf(model) == types.size - 4) {
                    headers += key
                }
                if (classDef.type != model &&
                    instructions.any { it.opcode == Opcode.CHECK_CAST && it.typeName == model } &&
                    instructions.any { it.field?.definingClass == model }
                ) {
                    rows += key
                }
                if (instructions.any { it.method?.let { ref -> ref.definingClass == model && ref.name == "<init>" } == true } &&
                    instructions.any { it.field?.definingClass in issueModels }
                ) {
                    builders += key
                }
            }
        }
        val header = headers.singleOrNull() ?: throw PatchException("Header composable not found: $headers")
        val row = rows.singleOrNull() ?: throw PatchException("Header chip row not found: $rows")
        if (builders.isEmpty()) throw PatchException("Header model is not built from the issue")
        val issue = builders.flatMap { (type, name) ->
            classDefBy(type).methods.filter { it.name == name }
                .flatMap { it.implementation?.instructions?.mapNotNull { read -> read.field?.definingClass }.orEmpty() }
        }.filter { it in issueModels }.distinct().singleOrNull() ?: throw PatchException("Issue model not found")
        val toString = issueModels.getValue(issue).implementation!!.instructions.toList()
        val labelsAt = toString.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == ", labels="
        }
        val labels = toString.drop(labelsAt).firstNotNullOfOrNull {
            it.field?.takeIf { field -> field.definingClass == issue && field.type == LIST }
        } ?: throw PatchException("Issue labels field not found")

        mutableClassDefBy(model).instanceFields.add(
            ImmutableField(model, LABELS_FIELD, LIST, AccessFlags.PUBLIC.value, null, null, null).toMutable(),
        )

        builders.forEach { (type, name) ->
            val method = mutableClassDefBy(type).methods.first { candidate ->
                candidate.name == name && candidate.implementation?.instructions?.any { it.method?.definingClass == model } == true
            }
            val instructions = method.implementation!!.instructions.toList()
            val initAt = instructions.indexOfFirst { it.method?.let { ref -> ref.definingClass == model && ref.name == "<init>" } == true }
            val read = instructions.take(initAt).first { it.opcode == Opcode.IGET_OBJECT && it.field?.type == issue }
            val holder = (read as TwoRegisterInstruction).registerB
            val built = (instructions[initAt] as RegisterRangeInstruction).startRegister
            // The instruction after the constructor loads a fresh value, so its register is free here.
            val free = (instructions[initAt + 1] as OneRegisterInstruction).registerA
            if (instructions[initAt + 1].opcode != Opcode.IGET_OBJECT || free == holder || free == built || free > 15 ||
                (instructions[initAt + 1] as TwoRegisterInstruction).registerB == free) {
                throw PatchException("No free register after the header model in $type")
            }
            method.addInstructions(
                initAt + 1,
                """
                    iget-object v$free, v$holder, ${read.field!!.smali}
                    iget-object v$free, v$free, ${labels.smali}
                    invoke-static/range { v$free .. v$free }, $HEADER_LABELS_CLASS->labels($LIST)$LIST
                    move-result-object v$free
                    iput-object v$free, v$built, $model->$LABELS_FIELD:$LIST
                """,
            )
        }

        val chipsMethod = mutableClassDefBy(row.first).methods.first { candidate ->
            candidate.name == row.second &&
                candidate.implementation?.instructions?.any { it.opcode == Opcode.CHECK_CAST && it.typeName == model } == true
        }
        val chips = chipsMethod.implementation!!.instructions.toList()
        val start = chips.indexOfFirst { it.opcode == Opcode.CHECK_CAST && it.typeName == model }

        val headerMethod = mutableClassDefBy(header.first).methods.first { candidate ->
            candidate.name == header.second && candidate.parameterTypes.any { it.toString() == model }
        }
        val types = headerMethod.parameterTypes.map(CharSequence::toString)
        val composer = types[types.size - 3]
        val draw = addLabelsRow(header.first, model, composer, chips, start)

        // The labels go right under the title block, the largest call of the header, inside its column.
        val instructions = headerMethod.implementation!!.instructions.toList()
        val titleAt = instructions.indices.filter { instructions[it].method != null }
            .maxByOrNull { instructions[it].method!!.parameterTypes.size }!!
        val modelRegister = headerMethod.implementation!!.registerCount -
            types.drop(types.size - 4).sumOf { if (it == "J" || it == "D") 2 else 1 }
        headerMethod.addInstructions(
            titleAt + 1,
            "invoke-static/range { v$modelRegister .. v${modelRegister + 1} }, $draw",
        )
    }
}
