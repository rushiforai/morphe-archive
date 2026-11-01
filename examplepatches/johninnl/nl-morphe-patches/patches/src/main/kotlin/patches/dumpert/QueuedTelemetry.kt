package patches.dumpert

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val CCT = "Lcom/google/android/datatransport/cct/CctTransportBackend;"
private const val REQUEST = "Lcom/google/android/datatransport/runtime/backends/BackendRequest;"
private const val BUILDER = "Lcom/google/android/datatransport/runtime/backends/BackendRequest\$Builder;"
private const val RESPONSE = "Lcom/google/android/datatransport/runtime/backends/BackendResponse;"

/** New collection flags do not cover WorkInitializer's persisted event batches. */
context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun suppressPersistedMeasurement() {
    val target = exact(CCT, "send($REQUEST)$RESPONSE")
    val method = target.method
    check(method.instructions.size == 72 && method.implementation!!.registerCount == 6)
    check(target.classDef.methods.none { it.name == "morpheMeasurementBatch" })
    val reject = listOf("FIREBASE_CRASHLYTICS_REPORT", "FIREBASE_APPQUALITY_SESSION",
        "FCM_CLIENT_EVENT_LOGGING", "GDT_CLIENT_METRICS").joinToString("\n") { name -> """
        const-string v4, "$name"
        invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v4
        if-nez v4, :next
    """.trimIndent() }
    target.classDef.methods.add(MutableMethod(ImmutableMethod(CCT, "morpheMeasurementBatch",
        listOf(ImmutableMethodParameter(REQUEST, emptySet(), null)), REQUEST,
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        ImmutableMethodImplementation(7, emptyList(), emptyList(), emptyList()),
    )).apply { addInstructions(0, """
        new-instance v0, Ljava/util/ArrayList;
        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
        invoke-virtual {p0}, $REQUEST->getEvents()Ljava/lang/Iterable;
        move-result-object v1
        invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;
        move-result-object v1
        :next
        invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z
        move-result v2
        if-eqz v2, :done
        invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;
        move-result-object v2
        check-cast v2, Lcom/google/android/datatransport/runtime/EventInternal;
        invoke-virtual {v2}, Lcom/google/android/datatransport/runtime/EventInternal;->getTransportName()Ljava/lang/String;
        move-result-object v3
        $reject
        invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :next
        :done
        invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v1
        if-eqz v1, :keep
        const/4 v0, 0x0
        return-object v0
        :keep
        invoke-static {}, $REQUEST->builder()$BUILDER
        move-result-object v1
        invoke-virtual {v1, v0}, $BUILDER->setEvents(Ljava/lang/Iterable;)$BUILDER
        move-result-object v1
        invoke-virtual {p0}, $REQUEST->getExtras()[B
        move-result-object v3
        invoke-virtual {v1, v3}, $BUILDER->setExtras([B)$BUILDER
        move-result-object v1
        invoke-virtual {v1}, $BUILDER->build()$REQUEST
        move-result-object v0
        return-object v0
    """.trimIndent()) })
    // Preserve the actual backend and every response for retained events. An
    // entirely suppressed batch uses the native fatal/delete path, never OK.
    method.addInstructionsWithLabels(0, """
        invoke-static {p1}, $CCT->morpheMeasurementBatch($REQUEST)$REQUEST
        move-result-object p1
        if-nez p1, :original
        invoke-static {}, $RESPONSE->fatalError()$RESPONSE
        move-result-object v0
        return-object v0
    """.trimIndent(), ExternalLabel("original", method.getInstruction(0)))
}
