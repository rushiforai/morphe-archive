package patches.magicearth

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val TRANSPORT_RUNTIME = "Lcom/google/android/datatransport/runtime/TransportRuntime;"
internal const val CCT_BACKEND = "Lcom/google/android/datatransport/cct/CctTransportBackend;"
private const val CALLBACK = "Lcom/google/android/datatransport/TransportScheduleCallback;"
private const val RESPONSE = "Lcom/google/android/datatransport/runtime/backends/BackendResponse;"

/** Complete callers and drain queued CCT events without serializing or uploading them. */
internal fun withoutGoogleTransport(original: Method): MutableMethod {
    check(original.name == "send" && !AccessFlags.STATIC.isSet(original.accessFlags)) {
        "Magic Earth transport signature changed"
    }
    val references = original.implementation?.instructions?.mapNotNull {
        (it as? ReferenceInstruction)?.reference?.toString()
    }.orEmpty()
    val body: String
    val registers: Int
    when (original.definingClass) {
        TRANSPORT_RUNTIME -> {
            check(original.returnType == "V" && original.parameterTypes.map { it.toString() } ==
                listOf("Lcom/google/android/datatransport/runtime/SendRequest;", CALLBACK))
            check(references.count { it.startsWith("Lcom/google/android/datatransport/runtime/scheduling/Scheduler;->schedule(") } == 1) {
                "Magic Earth transport scheduler changed or patch already applied"
            }
            registers = 3
            body = """
                const/4 v0, 0x0
                invoke-interface {p2, v0}, $CALLBACK->onSchedule(Ljava/lang/Exception;)V
                return-void
            """
        }
        CCT_BACKEND -> {
            check(original.returnType == RESPONSE && original.parameterTypes.map { it.toString() } ==
                listOf("Lcom/google/android/datatransport/runtime/backends/BackendRequest;"))
            check(references.count { it.startsWith("Lcom/google/android/datatransport/runtime/retries/Retries;->retry(") } == 1 &&
                references.count { it == "$RESPONSE->ok(J)$RESPONSE" } == 1) {
                "Magic Earth CCT upload path changed or patch already applied"
            }
            registers = 2
            body = """
                const-wide/16 v0, 0x0
                invoke-static {v0, v1}, $RESPONSE->ok(J)$RESPONSE
                move-result-object v0
                return-object v0
            """
        }
        else -> error("Unexpected Magic Earth transport class")
    }
    return ImmutableMethod(original.definingClass, original.name, original.parameters,
        original.returnType, original.accessFlags, original.annotations, original.hiddenApiRestrictions,
        MutableMethodImplementation(registers)).toMutable().apply { addInstructions(0, body) }
}

@Suppress("unused")
val disableGoogleTransport = bytecodePatch(
    name = "Disable Google telemetry transport",
    description = "Drops new Google DataTransport events and completes queued CCT uploads locally. Does not disable GEM engine telemetry. Runtime validation pending.",
    default = false,
) {
    compatibleWith(magicEarth)
    dependsOn(originalInput)
    execute {
        // Build both guarded replacements before changing either original method.
        val changes = listOf(TRANSPORT_RUNTIME, CCT_BACKEND).map { type ->
            val owner = mutableClassDefBy(type)
            val original = owner.methods.single { it.name == "send" &&
                it.parameterTypes.size == if (type == TRANSPORT_RUNTIME) 2 else 1 }
            Triple(owner, original, withoutGoogleTransport(original))
        }
        changes.forEach { (owner, original, replacement) ->
            check(owner.methods.remove(original)) { "Magic Earth transport method disappeared" }
            owner.methods.add(replacement)
        }
    }
}
