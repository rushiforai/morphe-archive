package app.xposed.patches.twitter.badges

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.matchSingle
import app.xposed.patches.twitter.Constants.BRIDGE_CLASS
import app.xposed.patches.twitter.Constants.MODEL_BRIDGE_CLASS
import app.xposed.patches.twitter.util.Abstract
import app.xposed.patches.twitter.util.RegisterFlow
import app.xposed.patches.twitter.util.descriptor
import app.xposed.patches.twitter.util.field
import app.xposed.patches.twitter.util.fieldRef
import app.xposed.patches.twitter.util.instructionList
import app.xposed.patches.twitter.util.methodRef
import app.xposed.patches.twitter.util.replaceStub
import app.xposed.patches.twitter.util.single
import app.xposed.patches.twitter.util.toStringFields
import app.xposed.patches.twitter.util.typeRef
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** What the conversation screen hands its opened post: the post, its appeal pivot and its view count. */
private object FocalPostStateToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("FocalPostState(timelinePostState="),
)

private object ListsTimelineArgsToStringFingerprint : Fingerprint(
    name = "toString",
    strings = listOf("ListsTimelineArgs(listId="),
)

private val Method.isStatic get() = AccessFlags.STATIC.isSet(accessFlags)
private val Method.types get() = parameterTypes.map { it.toString() }

/**
 * Stops the patch unless [composable], which X calls only for the opened post, still takes
 * what the focal post state holds. If X merged it with the timeline post composables, every
 * post would count as opened and Hide would stop hiding.
 */
internal fun BytecodePatchContext.requireFocalPost(composable: Method, appealPivot: String) {
    val focal = FocalPostStateToStringFingerprint.matchSingle()
    val fields = toStringFields(focal.originalMethod)
    fields.field("FocalPostState", "authorAppealPivot", appealPivot)
    fields.field("FocalPostState", "viewCount", "Ljava/lang/Long;")
    if ("Ljava/lang/Long;" !in composable.types) {
        throw PatchException("${composable.descriptor} has no view count; it may not be the focal post composable")
    }
}

/**
 * ComposeBridge.timelineHost and ModelBridge.isListTimeline. X's timeline screen provides its
 * timeline component to the posts through a CompositionLocal holding a small wrapper. A
 * curated List's component is the one class built from ListsTimelineArgs. Found through X's
 * own reader of that CompositionLocal.
 */
internal fun BytecodePatchContext.writeListTimeline() {
    val args = ListsTimelineArgsToStringFingerprint.matchSingle().originalClassDef.type
    val components = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val first = classDef.methods.filter { it.name == "<init>" }.mapNotNull { it.parameterTypes.firstOrNull()?.toString() }
        if (args in first && classDef.interfaces.any { it.startsWith("Lcom/x/") } && !AccessFlags.INTERFACE.isSet(classDef.accessFlags)) {
            components += classDef
        }
    }
    val component = components.single("List timeline component built from $args")

    // The wrapper: one field of a timeline interface the List component implements.
    val hosts = mutableMapOf<String, FieldReference>()
    classDefForEach { classDef ->
        val fields = classDef.fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) }
        val constructors = classDef.methods.filter { it.name == "<init>" }
        if (fields.size == 1 && fields[0].type.startsWith("Lcom/x/") && fields[0].type in component.interfaces && constructors.size == 1 &&
            constructors[0].types == listOf(fields[0].type)
        ) {
            hosts[classDef.type] = fields[0]
        }
    }

    // Reader: local = sget-object; Composer.consume(local); check-cast to a wrapper.
    data class Reader(val local: FieldReference, val consume: MethodReference, val host: String)
    val readers = mutableSetOf<Reader>()
    classDefForEach { classDef ->
        classDef.methods.forEach methods@{ method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@methods
            val casts = instructions.indices.filter { instructions[it].opcode == Opcode.CHECK_CAST && instructions[it].typeRef in hosts }
            if (casts.isEmpty()) return@methods
            val flow by lazy { RegisterFlow(method) }
            casts.forEach { cast ->
                if (cast < 2 || instructions[cast - 1].opcode != Opcode.MOVE_RESULT_OBJECT) return@forEach
                val call = instructions[cast - 2]
                val consume = call.methodRef ?: return@forEach
                if (call.opcode != Opcode.INVOKE_VIRTUAL || consume.parameterTypes.size != 1 ||
                    consume.returnType != "Ljava/lang/Object;" || !consume.definingClass.startsWith("Landroidx/compose/runtime/")
                ) {
                    return@forEach
                }
                if ((instructions[cast] as OneRegisterInstruction).registerA != (instructions[cast - 1] as OneRegisterInstruction).registerA) {
                    return@forEach
                }
                val local = flow.argumentsAt(cast - 2)[0].filterIsInstance<Abstract.Static>().singleOrNull() ?: return@forEach
                val field = instructions.firstNotNullOfOrNull { ins -> ins.fieldRef?.takeIf { it.descriptor == local.field } }
                    ?: return@forEach
                readers += Reader(field, consume, instructions[cast].typeRef!!)
            }
        }
    }
    val reader = readers.single("reader of the timeline CompositionLocal")
    val hostField = hosts.getValue(reader.host)
    requirePublic(component.type, reader.host, hostField, reader.local, reader.consume)

    replaceStub(
        BRIDGE_CLASS, "timelineHost", 1,
        """
        check-cast p0, ${reader.consume.definingClass}
        sget-object v0, ${reader.local.descriptor}
        invoke-virtual { p0, v0 }, ${reader.consume.descriptor}
        move-result-object v0
        return-object v0
        """,
    )
    replaceStub(
        MODEL_BRIDGE_CLASS, "isListTimeline", 1,
        """
        instance-of v0, p0, ${reader.host}
        if-eqz v0, :no
        check-cast p0, ${reader.host}
        iget-object v0, p0, ${hostField.descriptor}
        instance-of v0, v0, ${component.type}
        return v0
        :no
        const/4 v0, 0x0
        return v0
        """,
    )
}
