/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.feed

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The feed unit model that answers `getTypeName()` with exactly [typeName].
 *
 * Facebook's generated GraphQL models keep that method's name while Redex renames their classes
 * every release, and each returns its GraphQL type as a literal. The extension's feed filter
 * compares the name a unit answers, so the literal being there is the evidence the rule needs.
 * `PaginatedPeopleYouMayKnowFeedUnit` is `LX/3zk;` in 580, and is in 577 under another name.
 */
internal fun typeNameFingerprint(typeName: String) = Fingerprint(
    name = "getTypeName",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == typeName
        } == true
    },
)

/** Stops the patch when no model answers [typeName], so a rename fails here, not silently. */
internal fun BytecodePatchContext.requireFeedTypeName(typeName: String) {
    if (typeNameFingerprint(typeName).methodOrNull == null) {
        throw PatchException("No feed unit answers getTypeName() with \"$typeName\" in this APK")
    }
}

/** Kept name and member. The type tag every tree model's `getTypeName()` switches on. */
private const val TYPE_TAG_FIELD = "Lcom/facebook/graphservice/tree/TreeJNI;->mTypeTag:I"

private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.methodCall(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.readsTypeTag(): Boolean = opcode == Opcode.IGET &&
    ((this as? ReferenceInstruction)?.reference as? FieldReference)?.let {
        "${it.definingClass}->${it.name}:${it.type}" == TYPE_TAG_FIELD
    } == true

/** A method's instructions, each with its code-unit address, so switch and branch targets resolve. */
private fun addressed(method: Method): Map<Int, Instruction> {
    val byAddress = LinkedHashMap<Int, Instruction>()
    var address = 0
    for (instruction in method.implementation?.instructions ?: return byAddress) {
        byAddress[address] = instruction
        address += instruction.codeUnits
    }
    return byAddress
}

/** Where the method's first switch sends [key], or null when it has no switch or no case for it. */
private fun switchTarget(byAddress: Map<Int, Instruction>, key: Int): Int? {
    val (switchAddress, switch) = byAddress.entries.firstOrNull {
        it.value.opcode == Opcode.SPARSE_SWITCH || it.value.opcode == Opcode.PACKED_SWITCH
    } ?: return null
    val payload = byAddress[switchAddress + (switch as OffsetInstruction).codeOffset] as? SwitchPayload ?: return null
    val element = payload.switchElements.singleOrNull { it.key == key } ?: return null
    return switchAddress + element.offset
}

/** The literal a string table method, a static `(I)Ljava/lang/String;`, returns for [index]. */
private fun tableString(table: Method, index: Int): String? {
    val byAddress = addressed(table)
    val target = switchTarget(byAddress, index) ?: return null
    return byAddress[target]?.string()
}

/**
 * The name [method], a tree model's `getTypeName()`, answers for a model tagged [tag], or null.
 *
 * The method switches on the tree's type tag. A case answers a literal of its own, or loads an
 * index and asks a static string table (`(I)Ljava/lang/String;`) for it, the way Redex outlines a
 * literal it finds in more than one place. [resolve] finds that table, and the name is the literal
 * its switch case for the index returns. Anything else (no case for the tag, the super call, a table
 * [resolve] can't find, a case that doesn't end in a literal) answers null.
 */
internal fun taggedTypeName(method: Method, tag: Int, resolve: (MethodReference) -> Method?): String? {
    val byAddress = addressed(method)
    if (byAddress.values.none { it.readsTypeTag() }) return null
    var address = switchTarget(byAddress, tag) ?: return null
    val constants = HashMap<Int, Int>()
    // A case is a handful of instructions; the bound only stops a goto loop.
    repeat(16) {
        val instruction = byAddress[address] ?: return null
        instruction.string()?.let { return it }
        val call = instruction.methodCall()
        when {
            instruction is NarrowLiteralInstruction && instruction is OneRegisterInstruction &&
                instruction.opcode.name.startsWith("const") ->
                constants[instruction.registerA] = instruction.narrowLiteral
            instruction is OffsetInstruction && instruction.opcode.name.startsWith("goto") -> {
                address += instruction.codeOffset
                return@repeat
            }
            call != null -> {
                if (instruction.opcode != Opcode.INVOKE_STATIC || call.returnType != "Ljava/lang/String;" ||
                    call.parameterTypes.map { it.toString() } != listOf("I")
                ) {
                    return null
                }
                val register = (instruction as? FiveRegisterInstruction)?.registerC ?: return null
                val index = constants[register] ?: return null
                return resolve(call)?.let { tableString(it, index) }
            }
            else -> return null
        }
        address += instruction.codeUnits
    }
    return null
}

/**
 * Whether [method] is a tree model's `getTypeName()` that answers [typeName] for the type tag of
 * that name (the MD5 prefix [treeTypeTag] computes), by a literal or through a string table.
 */
internal fun answersTaggedTypeName(method: Method, typeName: String, resolve: (MethodReference) -> Method?): Boolean {
    if (method.name != "getTypeName" || method.returnType != "Ljava/lang/String;" || method.parameterTypes.isNotEmpty()) {
        return false
    }
    if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags)) return false
    return taggedTypeName(method, treeTypeTag(typeName), resolve) == typeName
}

/**
 * Stops the patch when no model answers [typeName] for its type tag. For a type that shares a
 * model class with others, whose `getTypeName()` answers it through a string table rather than a
 * literal of its own, which [requireFeedTypeName] can't see.
 */
internal fun BytecodePatchContext.requireTaggedFeedTypeName(typeName: String) {
    val tag = treeTypeTag(typeName)
    val resolve = { call: MethodReference -> classDefByOrNull(call.definingClass)?.let { resolveStatic(it, call) } }
    val fingerprint = Fingerprint(
        name = "getTypeName",
        returnType = "Ljava/lang/String;",
        parameters = listOf(),
        custom = { method, _ ->
            // The tag as a switch key is cheap to look for, and rules out nearly every model
            // before a string table is read.
            method.implementation?.instructions?.any { payload ->
                payload is SwitchPayload && payload.switchElements.any { it.key == tag }
            } == true && answersTaggedTypeName(method, typeName, resolve)
        },
    )
    if (fingerprint.methodOrNull == null) {
        throw PatchException("No feed unit answers getTypeName() with \"$typeName\" for its type tag in this APK")
    }
}
