/*
 * Copyright 2026 Nyandex contributors.
 *
 * Nyandex: Yandex Music patches for Morphe Patcher.
 * Licensed under the GNU General Public License v3.0; see LICENSE and NOTICE.
 */

package app.nyandex.patches.yandexmusic.util

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.getAllClassesWithStrings
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableAnnotation
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

/**
 * One literal that is replaced wherever it occurs in a string constant of the app.
 *
 * If [from] is only a part of a larger literal, only that part is replaced. This keeps
 * URLs with a path and formatted AppsFlyer endpoints intact while redirecting the host.
 */
internal data class StringReplacement(val from: String, val to: String)

/**
 * Find the Parcelable music-session DTO that carries the client-side subscription flags.
 *
 * R8 renames the class and its referenced types between builds (`Lu8e;` in 2026.11.1,
 * `Lipe;` in 2026.11.2), but the field layout and the constructor signature are stable:
 * `a` object, `b` int, `c` String, `d` boolean, `e` object, `f`/`g`/`h` booleans,
 * `i` List, `j` object. Matching the shape avoids hard-coding one build's class name.
 */
internal fun findMusicSessionClass(): String {
    val classDef = classDefByOrNull { candidate ->
        candidate.interfaces.contains("Landroid/os/Parcelable;") &&
            candidate.fields.any { it.name == "a" && it.type.startsWith("L") } &&
            candidate.fields.any { it.name == "b" && it.type == "I" } &&
            candidate.fields.any { it.name == "c" && it.type == "Ljava/lang/String;" } &&
            candidate.fields.any { it.name == "d" && it.type == "Z" } &&
            candidate.fields.any { it.name == "e" && it.type.startsWith("L") } &&
            candidate.fields.any { it.name == "f" && it.type == "Z" } &&
            candidate.fields.any { it.name == "g" && it.type == "Z" } &&
            candidate.fields.any { it.name == "h" && it.type == "Z" } &&
            candidate.fields.any { it.name == "i" && it.type == "Ljava/util/List;" } &&
            candidate.fields.any { it.name == "j" && it.type.startsWith("L") } &&
            candidate.methods.any { method ->
                method.name == "<init>" &&
                    method.parameterTypes.size == 9 &&
                    method.parameterTypes[0].startsWith("L") &&
                    method.parameterTypes[1] == "I" &&
                    method.parameterTypes[2] == "Ljava/lang/String;" &&
                    method.parameterTypes[3] == "Z" &&
                    method.parameterTypes[4].startsWith("L") &&
                    method.parameterTypes[5] == "Z" &&
                    method.parameterTypes[6] == "Z" &&
                    method.parameterTypes[7] == "Z" &&
                    method.parameterTypes[8] == "Ljava/util/List;"
            }
    } ?: throw PatchException("Music session DTO with subscription flags was not found")

    return classDef.type
}

/**
 * Replace every write of [classType] -> [fieldName] : Z with [value].
 *
 * The value is written immediately before the original `iput-boolean`, so every existing
 * branch keeps its own write and can no longer overwrite the forced value. This is more
 * reliable than appending instructions before `return-void`, because a branch can jump
 * directly to that return instruction.
 *
 * @return The number of writes that were changed.
 */
internal fun forceBooleanField(classType: String, fieldName: String, value: Boolean): Int {
    val mutableClass = mutableClassDefBy(classType)
    var changed = 0

    mutableClass.methods.toList().forEach { method ->
        val implementation = method.implementation ?: return@forEach
        val fieldWriteIndexes = implementation.instructions.mapIndexedNotNull { index, instruction ->
            if (instruction.opcode != Opcode.IPUT_BOOLEAN) return@mapIndexedNotNull null

            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                ?: return@mapIndexedNotNull null

            index.takeIf {
                field.definingClass == classType &&
                    field.name == fieldName &&
                    field.type == "Z"
            }
        }

        fieldWriteIndexes.asReversed().forEach { index ->
            val sourceRegister = (implementation.instructions[index] as TwoRegisterInstruction).registerA
            method.addInstructions(index, booleanConstantInstruction(sourceRegister, if (value) 1 else 0))
            changed++
        }
    }

    if (changed == 0) {
        throw PatchException("No write of $classType->$fieldName:Z was found")
    }

    return changed
}

/**
 * Replace string literals in the instructions of every class that contains one of them.
 *
 * Longer replacements are preferred, so replacing `...IAppUpdateServiceCallback` does not
 * leave a broken `...IAppUpdateService` suffix behind.
 *
 * @return The number of replaced instructions.
 */
internal fun replaceStringConstants(vararg replacements: StringReplacement): Int {
    require(replacements.isNotEmpty()) { "At least one replacement is required" }

    val classesByType = linkedMapOf<String, com.android.tools.smali.dexlib2.iface.ClassDef>()
    replacements.forEach { replacement ->
        classDefByStrings(replacement.from, StringComparisonType.CONTAINS).forEach { classDef ->
            classesByType[classDef.type] = classDef
        }
    }

    var changed = 0
    classesByType.values.forEach { classDef ->
        val mutableClass = mutableClassDefBy(classDef.type)

        mutableClass.methods.toList().forEach { method ->
            val implementation = method.implementation ?: return@forEach
            val matchingIndexes = implementation.instructions.mapIndexedNotNull { index, instruction ->
                val literal = (instruction as? ReferenceInstruction)?.reference as? StringReference
                    ?: return@mapIndexedNotNull null

                index.takeIf { findReplacement(literal.string, replacements) != null }
            }

            matchingIndexes.asReversed().forEach { index ->
                val instruction = implementation.instructions[index]
                val register = (instruction as OneRegisterInstruction).registerA
                val literal = (instruction as ReferenceInstruction).reference as StringReference
                val replacement = findReplacement(literal.string, replacements)
                    ?: return@forEach

                method.replaceInstruction(
                    index,
                    constantStringInstruction(register, replacement),
                )
                changed++
            }
        }
    }

    return changed
}

/**
 * Replace string literals that are exactly equal to [from] with [to].
 *
 * Unlike [replaceStringConstants], this does not touch longer strings that merely contain
 * [from]. That matters for the Passport account type: action names, permissions and
 * provider authorities share the `com.yandex.passport` prefix but must keep their
 * original values.
 *
 * @return The number of replaced instructions.
 */
internal fun replaceExactStringConstants(from: String, to: String): Int {
    require(from != to) { "The replacement must differ from the original string" }

    var changed = 0
    classDefByStrings(from, StringComparisonType.EQUALS).forEach { classDef ->
        val mutableClass = mutableClassDefBy(classDef.type)

        mutableClass.methods.toList().forEach { method ->
            val implementation = method.implementation ?: return@forEach
            val matchingIndexes = implementation.instructions.mapIndexedNotNull { index, instruction ->
                val literal = (instruction as? ReferenceInstruction)?.reference as? StringReference
                index.takeIf { literal?.string == from }
            }

            matchingIndexes.asReversed().forEach { index ->
                val instruction = implementation.instructions[index]
                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, constantStringInstruction(register, to))
                changed++
            }
        }
    }

    // Static field initial values are encoded values, not const-string instructions.
    getAllClassesWithStrings().forEach { classDef ->
        if (classDef.staticFields.none { field ->
                (field.initialValue as? StringEncodedValue)?.value == from
            }
        ) {
            return@forEach
        }

        val mutableClass = mutableClassDefBy(classDef.type)
        mutableClass.staticFields.forEach { field ->
            val value = field.initialValue as? MutableStringEncodedValue ?: return@forEach
            if (value.value == from) {
                value.setValue(to)
                changed++
            }
        }
    }

    return changed
}

/**
 * Replace string literals inside annotations (for example Retrofit `@GET` paths).
 *
 * Instruction-only replacement cannot see these values because annotation values are
 * not `const-string` instructions, so endpoint annotations need their own pass.
 *
 * @return The number of annotation values that were changed.
 */
internal fun replaceAnnotationStrings(
    classType: String,
    vararg replacements: StringReplacement,
): Int {
    require(replacements.isNotEmpty()) { "At least one replacement is required" }

    val mutableClass = mutableClassDefBy(classType)
    var changed = 0

    fun MutableAnnotation.patchElements() {
        elements.forEach { element ->
            val value = element.value as? MutableStringEncodedValue ?: return@forEach
            val replacement = findReplacement(value.value, replacements) ?: return@forEach
            value.setValue(replacement)
            changed++
        }
    }

    mutableClass.annotations.forEach { it.patchElements() }
    mutableClass.methods.forEach { method -> method.annotations.forEach { it.patchElements() } }
    mutableClass.fields.forEach { field -> field.annotations.forEach { it.patchElements() } }

    return changed
}

private fun findReplacement(value: String, replacements: Array<out StringReplacement>): String? {
    // Exact matches first: "auth/games" must not win over "auth/games_lite".
    replacements.firstOrNull { it.from == value }?.let { return it.to }

    // Then the most specific partial match.
    return replacements
        .filter { value.contains(it.from) }
        .maxByOrNull { it.from.length }
        ?.let { value.replace(it.from, it.to) }
}

private fun booleanConstantInstruction(register: Int, value: Int): String = when {
    register < 16 -> "const/4 v$register, 0x${value.toString(16)}"
    register < 256 -> "const/16 v$register, 0x${value.toString(16)}"
    else -> throw PatchException("Register v$register is too large for a boolean constant")
}

private fun constantStringInstruction(register: Int, value: String): String =
    "const-string/jumbo v$register, ${value.toSmaliStringLiteral()}"

/**
 * Encode a Kotlin string as a smali string literal. The endpoint and header values used
 * here are ASCII, but escaping is kept complete so a future replacement cannot inject
 * an invalid string into the assembled DEX.
 */
private fun String.toSmaliStringLiteral(): String = buildString {
    append('"')
    this@toSmaliStringLiteral.forEach { character ->
        when (character) {
            '\\' -> append("\\\\")
            '"' -> append("\\\"")
            '\n' -> append("\\n")
            '\r' -> append("\\r")
            '\t' -> append("\\t")
            else -> when {
                character.code < 0x20 || character.code > 0x7e ->
                    append("\\u${character.code.toString(16).padStart(4, '0')}")
                else -> append(character)
            }
        }
    }
    append('"')
}
