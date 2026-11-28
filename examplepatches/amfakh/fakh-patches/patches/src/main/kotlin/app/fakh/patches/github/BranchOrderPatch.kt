/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.github

import app.fakh.patches.github.shared.Constants.COMPATIBILITY_GITHUB
import app.fakh.patches.github.shared.Constants.PIN_IMPORTANT_BRANCHES
import app.fakh.patches.github.shared.Constants.PIN_RECENT_BRANCHES
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val BRANCH_CLASS = "Lapp/fakh/extension/github/BranchOrder;"

private const val BRANCH = "Lapp/fakh/extension/github/BranchOrder\$Branch;"

private const val PICKER = "Lapp/fakh/extension/github/BranchOrder\$Picker;"

private const val STRING = "Ljava/lang/String;"

private const val OBJECT = "Ljava/lang/Object;"

private const val LIST = "Ljava/util/List;"

/** The one class whose `toString` writes all of [labels]. */
private fun modelClass(vararg labels: String): ClassDef {
    val found = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val written = classDef.methods.filter { it.name == "toString" }.flatMap { it.instructions }.mapNotNull { it.string }
        if (labels.all { label -> written.any { label in it } }) found += classDef
    }
    return found.singleOrNull() ?: throw PatchException("Expected one ${labels.first()} model, found ${found.size}")
}

/** The registers a value of [type] takes. */
private fun width(type: CharSequence) = if (type.toString() == "J" || type.toString() == "D") 2 else 1

/** The register of the parameter at [index] of this static method. */
private fun Method.parameterRegister(index: Int) =
    implementation!!.registerCount - parameterTypes.sumOf(::width) + parameterTypes.take(index).sumOf(::width)

/** The field the constructor writes the parameter at [index] into. */
private fun ClassDef.fieldOfParameter(index: Int): FieldReference {
    val constructor = methods.single { it.name == "<init>" }
    // The register of `this` comes before the parameters.
    val register = constructor.parameterRegister(index)
    return constructor.instructions.firstNotNullOfOrNull {
        it.field?.takeIf { _ -> (it as TwoRegisterInstruction).registerA == register }
    } ?: throw PatchException("Field of parameter $index not found in $type")
}

/** Adds a method with the given body. A static one does not get `this`. */
private fun addMethod(
    owner: String,
    name: String,
    parameters: List<String>,
    returns: String,
    registers: Int,
    smali: String,
    static: Boolean = false,
) {
    mutableClassDefBy(owner).methods.add(
        ImmutableMethod(
            owner,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            returns,
            AccessFlags.PUBLIC.value or if (static) AccessFlags.STATIC.value else 0,
            null,
            null,
            MutableMethodImplementation(registers),
        ).toMutable().apply { addInstructionsWithLabels(0, smali) },
    )
}

/** Makes the app's branch model something the extension can read and make more of. */
private fun implementBranch(branch: ClassDef) {
    val repository = branch.fieldOfParameter(0)
    val name = branch.fieldOfParameter(3)
    mutableClassDefBy(branch.type).interfaces.add(BRANCH)
    listOf("fakhRepositoryId" to repository, "fakhName" to name).forEach { (method, field) ->
        addMethod(
            branch.type, method, emptyList(), STRING, 2,
            """
                iget-object v0, p0, ${field.smali}
                return-object v0
            """,
        )
    }
    addMethod(
        branch.type, "fakhCopy", listOf(STRING, STRING, STRING), OBJECT, 10,
        """
            new-instance v0, ${branch.type}
            iget-object v1, p0, ${repository.smali}
            move-object v2, p1
            move-object v3, p2
            move-object v4, p3
            const/4 v5, 0x0
            invoke-direct/range { v0 .. v5 }, ${branch.type}-><init>($STRING$STRING$STRING${STRING}Z)V
            return-object v0
        """,
    )
}

/**
 * Has the branch picker's view model arrange every list it publishes, and publish it again once the extension knows
 * the branches that go on top.
 */
private fun hookPicker() {
    val found = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.methods.any { method ->
                method.name == "<init>" && method.instructions.mapNotNull { it.string }
                    .containsAll(listOf("EXTRA_REPO_OWNER", "EXTRA_REPO_NAME", "EXTRA_CURRENT_BRANCH"))
            } && classDef.methods.any { it.returnType == STRING && it.parameterTypes.isEmpty() && it.name != "toString" }
        ) {
            found += classDef
        }
    }

    // The lists are published by passing the flow and the list to one static setter.
    class Publish(val owner: String, val method: Method, val at: Int, val flow: FieldReference)

    val publishes = mutableListOf<Publish>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val body = method.instructions
            body.forEachIndexed { at, instruction ->
                if (instruction.opcode != Opcode.INVOKE_STATIC) return@forEachIndexed
                val called = instruction.method ?: return@forEachIndexed
                if (called.returnType != "V" || called.types.size != 2 || called.types[1] != OBJECT) return@forEachIndexed
                val register = (instruction as FiveRegisterInstruction).registerC
                val flow = body.take(at).lastOrNull {
                    it.opcode == Opcode.IGET_OBJECT && (it as TwoRegisterInstruction).registerA == register
                }?.field ?: return@forEachIndexed
                if (flow.type == called.types[0] && found.any { it.type == flow.definingClass }) {
                    publishes += Publish(classDef.type, method, at, flow)
                }
            }
        }
    }
    val flow = publishes.map { it.flow }.distinct().singleOrNull()
        ?: throw PatchException("Branch list of the picker not found: ${publishes.map { it.flow }.distinct()}")
    val picker = found.single { it.type == flow.definingClass }

    // The view model reads its own list where it adds the next page.
    val reader = publishes.map { it.method }.firstOrNull { method ->
        method.instructions.any { it.method?.definingClass == flow.type }
    } ?: throw PatchException("Branch list reader not found")
    val body = reader.instructions
    val valueAt = body.indexOfFirst {
        it.method?.let { m -> m.definingClass == flow.type && m.types.isEmpty() && m.returnType == OBJECT } == true
    }
    if (valueAt < 0) throw PatchException("Branch list value not found")
    val value = body[valueAt].method!!
    val data = body.drop(valueAt + 1).firstOrNull {
        it.opcode == Opcode.INVOKE_INTERFACE && it.method?.let { m -> m.types.isEmpty() && m.returnType == OBJECT } == true
    }?.method ?: throw PatchException("Branch list data not found")
    val publish = body[publishes.first { it.method == reader }.at].method!!

    publishes.groupBy { it.owner to it.method }.forEach { (target, calls) ->
        val method = mutableClassDefBy(target.first).methods.first {
            it.name == target.second.name && it.parameterTypes == target.second.parameterTypes
        }
        calls.sortedByDescending { it.at }.forEach { call ->
            val invoke = method.instructions[call.at] as FiveRegisterInstruction
            method.addInstructions(
                call.at,
                """
                    invoke-static { v${invoke.registerC}, v${invoke.registerD} }, $BRANCH_CLASS->arrange($OBJECT$LIST)$LIST
                    move-result-object v${invoke.registerD}
                """,
            )
        }
    }

    val constructor = picker.methods.single { method ->
        method.name == "<init>" && method.instructions.any { it.string == "EXTRA_CURRENT_BRANCH" }
    }
    val code = constructor.instructions
    fun repositoryField(extra: String) = code.drop(code.indexOfFirst { it.string == extra }).firstNotNullOfOrNull {
        it.field?.takeIf { field -> it.opcode == Opcode.IPUT_OBJECT && field.type == STRING }
    } ?: throw PatchException("Field of $extra not found")
    val owner = repositoryField("EXTRA_REPO_OWNER")
    val repository = repositoryField("EXTRA_REPO_NAME")
    val query = picker.methods.single {
        it.returnType == STRING && it.parameterTypes.isEmpty() && it.name != "toString"
    }
    val listAt = code.indexOfFirst { it.opcode == Opcode.IPUT_OBJECT && it.field == flow }
    if (listAt < 0) throw PatchException("Branch list is not set in the constructor")

    mutableClassDefBy(picker.type).interfaces.add(PICKER)
    addMethod(
        picker.type, "fakhQuery", emptyList(), STRING, 2,
        """
            invoke-virtual { p0 }, ${picker.type}->${query.name}()$STRING
            move-result-object v0
            return-object v0
        """,
    )
    addMethod(
        picker.type, "fakhLoad", emptyList(), "V", 4,
        """
            iget-object v0, p0, ${flow.smali}
            iget-object v1, p0, ${owner.smali}
            iget-object v2, p0, ${repository.smali}
            invoke-static { p0, v0, v1, v2 }, $BRANCH_CLASS->load($PICKER$OBJECT$STRING$STRING)V
            return-void
        """,
    )
    addMethod(
        picker.type, "fakhRefresh", emptyList(), "V", 4,
        """
            iget-object v0, p0, ${flow.smali}
            invoke-virtual { v0 }, ${value.smali}
            move-result-object v1
            check-cast v1, ${data.definingClass}
            invoke-interface { v1 }, ${data.smali}
            move-result-object v1
            instance-of v2, v1, $LIST
            if-eqz v2, :end
            check-cast v1, $LIST
            invoke-static { v0, v1 }, $BRANCH_CLASS->arrange($OBJECT$LIST)$LIST
            move-result-object v2
            if-eq v1, v2, :end
            invoke-static { v0, v2 }, ${publish.smali}
            :end
            return-void
        """,
    )
    mutableClassDefBy(picker.type).methods.single {
        it.name == "<init>" && it.parameterTypes == constructor.parameterTypes
    }.addInstructions(listAt + 1, "invoke-virtual/range { p0 .. p0 }, ${picker.type}->fakhLoad()V")
}

/** Gives each row an id that follows its note, where the app turns branches into rows. */
private fun hookRowIds(branch: ClassDef, row: ClassDef) {
    val name = branch.fieldOfParameter(3)
    val found = mutableListOf<Pair<String, Method>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val body = method.instructions
            if (body.any { it.opcode == Opcode.NEW_INSTANCE && it.typeReference == row.type } &&
                body.any { it.field == name }
            ) {
                found += classDef.type to method
            }
        }
    }
    val (owner, target) = found.singleOrNull()
        ?: throw PatchException("Expected one branch row builder, found ${found.map { it.first }}")
    val method = mutableClassDefBy(owner).methods.first {
        it.name == target.name && it.parameterTypes == target.parameterTypes
    }
    val body = method.instructions
    val hashAt = body.indices.singleOrNull { at ->
        at > 0 && body[at].method?.let { it.definingClass == STRING && it.name == "hashCode" } == true &&
            body[at - 1].field == name
    } ?: throw PatchException("Branch row id not found")
    val read = body[hashAt - 1] as TwoRegisterInstruction
    if (read.registerA != (body[hashAt] as FiveRegisterInstruction).registerC || read.registerB > 15) {
        throw PatchException("Unexpected branch row id registers")
    }
    // The hash's result register receives the id instead.
    method.replaceInstruction(hashAt - 1, "invoke-static { v${read.registerB} }, $BRANCH_CLASS->key($OBJECT)I")
    method.removeInstruction(hashAt)
}

/** Shows a row's note in the badge the app draws for the default branch. */
private fun hookRowBadge(row: ClassDef) {
    val id = row.fields.single { it.type == "J" && !AccessFlags.STATIC.isSet(it.accessFlags) }
    val isDefault = row.fieldOfParameter(1)
    addMethod(
        row.type, "fakhBadge", listOf(row.type, "Z"), "Z", 4,
        """
            iget-wide v0, p0, ${row.type}->${id.name}:J
            invoke-static { v0, v1, p1 }, $BRANCH_CLASS->badge(JZ)Z
            move-result v0
            return v0
        """,
        static = true,
    )
    addMethod(
        row.type, "fakhLabel", listOf(row.type, STRING), STRING, 4,
        """
            iget-wide v0, p0, ${row.type}->${id.name}:J
            invoke-static { v0, v1, p1 }, $BRANCH_CLASS->label(J$STRING)$STRING
            move-result-object v0
            return-object v0
        """,
        static = true,
    )

    val found = mutableListOf<Pair<String, Method>>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            if (AccessFlags.STATIC.isSet(method.accessFlags) && row.type in method.types &&
                method.instructions.any { it.opcode == Opcode.IGET_BOOLEAN && it.field == isDefault }
            ) {
                found += classDef.type to method
            }
        }
    }
    val (owner, target) = found.singleOrNull()
        ?: throw PatchException("Expected one branch row composable, found ${found.map { it.first }}")
    val method = mutableClassDefBy(owner).methods.first {
        it.name == target.name && it.parameterTypes == target.parameterTypes
    }
    val body = method.instructions

    val defaultAt = body.indexOfFirst { it.opcode == Opcode.IGET_BOOLEAN && it.field == isDefault }
    val read = body[defaultAt] as TwoRegisterInstruction
    if (read.registerA == read.registerB || read.registerA > 15 || read.registerB > 15) {
        throw PatchException("Unexpected default badge registers")
    }

    // The badge call takes its text and what is read aloud from the two strings loaded at the start of the row.
    val badgeAt = (defaultAt + 1 until body.size).firstOrNull { at ->
        body[at].method?.types?.let { it.size > 3 && it[2] == STRING && STRING in it.drop(3) } == true
    } ?: throw PatchException("Default badge call not found")
    val types = body[badgeAt].method!!.types
    val start = (body[badgeAt] as? RegisterRangeInstruction)?.startRegister
        ?: throw PatchException("Unexpected default badge call")
    val texts = listOf(2, types.indexOfLast { it == STRING }).map { index ->
        val argument = start + types.take(index).sumOf(::width)
        val source = body.take(badgeAt).lastOrNull {
            it is TwoRegisterInstruction && it.opcode.name.startsWith("move-object") && it.registerA == argument
        } as TwoRegisterInstruction? ?: throw PatchException("Default badge text not found")
        val loadedAt = body.take(defaultAt).indexOfLast {
            it.opcode == Opcode.MOVE_RESULT_OBJECT && (it as OneRegisterInstruction).registerA == source.registerB
        }
        if (loadedAt < 0) throw PatchException("Default badge string not found")
        source.registerB to loadedAt
    }
    val insertAt = texts.maxOf { it.second } + 1
    // The next instruction writes its register without reading it, so the register is free until then.
    val next = body[insertAt]
    val free = (next as? TwoRegisterInstruction)?.takeIf {
        next.opcode.name.startsWith("and-int/lit") && it.registerA != it.registerB && it.registerA <= 15
    }?.registerA ?: throw PatchException("No free register for the badge text")
    val parameter = method.parameterRegister(method.types.indexOf(row.type))
    val moveAt = body.take(insertAt).indexOfLast {
        it is TwoRegisterInstruction && it.opcode.name.startsWith("move-object") && it.registerB == parameter
    }
    val held = (body.getOrNull(moveAt) as? TwoRegisterInstruction)?.registerA
    if (held == null || held > 15 || held == free ||
        body.subList(moveAt + 1, insertAt).any { (it as? OneRegisterInstruction)?.registerA == held }
    ) {
        throw PatchException("Branch row register not found")
    }

    // From the end, so the first index stays right.
    method.addInstructions(
        defaultAt + 1,
        """
            invoke-static { v${read.registerB}, v${read.registerA} }, ${row.type}->fakhBadge(${row.type}Z)Z
            move-result v${read.registerA}
        """,
    )
    method.addInstructions(
        insertAt,
        texts.joinToString("\n") { (register, _) ->
            """
                move-object/from16 v$free, v$register
                invoke-static { v$held, v$free }, ${row.type}->fakhLabel(${row.type}$STRING)$STRING
                move-result-object v$register
            """
        },
    )
}

/** Has the extension arrange the branch picker, as the patches below set it up. */
private val branchPickerPatch = bytecodePatch {
    dependsOn(apiTokenPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val branch = modelClass("Branch(repositoryId=")
        val row = modelClass("BranchItem(name=", ", isSelected=")
        implementBranch(branch)
        hookPicker()
        hookRowIds(branch, row)
        hookRowBadge(row)
    }
}

@Suppress("unused")
val pinImportantBranchesPatch = patch(
    name = "Pin important branches",
    description = "Lists develop, main, master and staging right after the default branch in the branch picker.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch, branchPickerPatch)

    execute { register(PIN_IMPORTANT_BRANCHES) }
}

@Suppress("unused")
val pinRecentBranchesPatch = patch(
    name = "Pin recent branches",
    description = "Lists the most recently pushed branches near the top of the branch picker, with how long ago.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GITHUB)
    category("Feature")
    dependsOn(githubSettingsPatch, branchPickerPatch)

    execute { register(PIN_RECENT_BRANCHES) }
}
