/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.stories.suggested

import app.morphe.patches.facebook.feed.TREE_JNI
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.treeFieldKey
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/*
 * How a Stories tray gets its buckets, read from Facebook 577 and 580 (2026-09-27).
 *
 * One fetch controller feeds every Stories tray, the one at the top of the feed and the Friends
 * feed's. Each answer it gets, from the network or from the cache, goes through the one method
 * holding the trace name [POST_PROCESS_RESULT] (580 LX/1fA;->A03, 577 LX/1jf;->A03). That method
 * ranks and checks the buckets, one per person or Page with a story, and hands the list, as an
 * ImmutableList, to the one constructor of the tray data class it answers (580 LX/1yk;, 577
 * LX/1t4;). Nothing else builds that class. Both trays draw from it: the classic tray's receiver,
 * the one method holding [OPTIMISTIC_RECEIVES] (580 LX/1vu;->A05, 577 LX/2f1;->A05), copies the list
 * into the tray model it draws, and the unified tray's Stories tab hands the same object to that
 * receiver.
 *
 * Every bucket is a tree model behind one interface (580 LX/43P;, 577 LX/3Uy;). The tree class
 * implementing it answers one of the interface's ()Z methods (580 BZd, 577 BbH) with
 * TreeJNI.getBooleanValue of [SUGGESTED_FLAG_FIELD], and the receiver calls that method on the
 * buckets it counts. The card the tray draws for a bucket says "Suggested" (580 string 0x7f146c02,
 * 577 0x7f146a31) when that flag is true or when the bucket's first label is SUGGESTED, a constant
 * of the label enum that also names NEWFRIEND and TRENDING (580 LX/2yG;, 577 LX/2y8;). One static
 * helper answers that label for a bucket (580 LX/2Qy;->A00, 577 LX/2DS;->A00).
 */

/** Kept trace name of the tray fetch's post-processing, the one builder of the tray data. */
internal const val POST_PROCESS_RESULT = "StoriesTrayLightFetchControllerQueryOps.postProcessResult"

/** Kept literal of the classic tray's receiver, which reads the tray data's bucket list. */
internal const val OPTIMISTIC_RECEIVES = "optimistic_data_adapter_receives"

/** The GraphQL field a suggested bucket carries as true. Its key is the name's String.hashCode(). */
internal const val SUGGESTED_FLAG_FIELD = "is_story_bucket_suggested"

/** Names the bucket label enum's static initializer holds. NEWFRIEND is in no other class. */
internal val LABEL_NAMES = listOf("NEWFRIEND", "SUGGESTED", "TRENDING")

internal const val IMMUTABLE_LIST = "Lcom/google/common/collect/ImmutableList;"

private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Method.parameters(): List<String> = parameterTypes.map { it.toString() }

private fun Method.isStatic() = AccessFlags.STATIC.isSet(accessFlags)

private fun Instruction.methodReference(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.fieldReference(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference

/**
 * Whether this reference names [method]. The parameter lists are compared by their spelling: a
 * reference's immutable list and a method's don't compare equal even when they print the same.
 */
private fun MethodReference.refersTo(method: Method): Boolean =
    definingClass == method.definingClass && name == method.name && returnType == method.returnType &&
        parameterTypes.map { it.toString() } == method.parameters()

/** Whether [method] is the tray fetch's post-processing: the trace name, and an app object back. */
internal fun isPostProcess(method: Method): Boolean =
    method.returnType.startsWith("L") && !method.returnType.startsWith("Ljava/") &&
        holdsString(method, POST_PROCESS_RESULT)

/** The declared parameters of [method] that are an ImmutableList. */
internal fun listParameters(method: Method): List<Int> =
    method.parameters().indices.filter { method.parameters()[it] == IMMUTABLE_LIST }

/** Whether [method] builds an object through [constructor]: a new-instance of its class, then the call. */
internal fun constructs(method: Method, constructor: Method): Boolean {
    val body = method.body()
    return body.any {
        it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == constructor.definingClass
    } && body.any {
        (it.opcode == Opcode.INVOKE_DIRECT || it.opcode == Opcode.INVOKE_DIRECT_RANGE) && it.methodReference()?.refersTo(constructor) == true
    }
}

/**
 * The field of its own class that [constructor] keeps declared parameter [index] in, when it keeps
 * it in exactly one, typed ImmutableList.
 */
internal fun listField(constructor: Method, index: Int): FieldReference? {
    val register = constructor.parameterRegisterNumber(index)
    return constructor.body().filter { it.opcode == Opcode.IPUT_OBJECT && (it as TwoRegisterInstruction).registerA == register }
        .mapNotNull { it.fieldReference() }
        .filter { it.definingClass == constructor.definingClass && it.type == IMMUTABLE_LIST }
        .singleOrNull()
}

/** Whether [method] reads [field]. */
internal fun readsField(method: Method, field: FieldReference): Boolean = method.body().any {
    val read = it.fieldReference()
    it.opcode == Opcode.IGET_OBJECT && read != null && read.definingClass == field.definingClass &&
        read.name == field.name && read.type == field.type
}

/**
 * The interface methods of the app taking nothing and answering a boolean that [method] calls, each
 * once. A framework interface's, such as Iterator.hasNext, can't be a bucket's.
 */
internal fun interfaceFlagCalls(method: Method): List<MethodReference> = method.body()
    .filter { it.opcode == Opcode.INVOKE_INTERFACE || it.opcode == Opcode.INVOKE_INTERFACE_RANGE }
    .mapNotNull { it.methodReference() }
    .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() }
    .filterNot { it.definingClass.startsWith("Ljava/") || it.definingClass.startsWith("Landroid/") }
    .distinctBy { "${it.definingClass}->${it.name}" }

/**
 * Whether [method] answers the tree's boolean [field]: an instance method with no arguments and a
 * boolean back, loading the field's key and reading it with TreeJNI.getBooleanValue(int).
 */
internal fun isTreeFlagReader(method: Method, field: String): Boolean {
    if (method.isStatic() || method.parameterTypes.isNotEmpty() || method.returnType != "Z") return false
    val body = method.body()
    val key = treeFieldKey(field)
    return body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == key } &&
        body.any { instruction ->
            val call = instruction.methodReference()
            instruction.opcode == Opcode.INVOKE_VIRTUAL && call != null && call.definingClass == TREE_JNI &&
                call.name == "getBooleanValue" && call.returnType == "Z" && call.parameterTypes.map { it.toString() } == listOf("I")
        }
}

/** Whether [method] is a static helper that answers a [label] for one of [buckets]. */
internal fun isLabelHelper(method: Method, buckets: Set<String>, label: String): Boolean =
    method.isStatic() && method.implementation != null && method.returnType == label &&
        method.parameters().size == 1 && method.parameters().single() in buckets
