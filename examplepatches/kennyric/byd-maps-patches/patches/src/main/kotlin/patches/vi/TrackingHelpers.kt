package patches.vi

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

context(patchContext: app.morphe.patcher.patch.BytecodePatchContext)
internal fun measurementRequestFilter() {
    val owner = "Lcom/google/android/datatransport/cct/CctTransportBackend;"
    val request = "Lcom/google/android/datatransport/runtime/backends/BackendRequest;"
    val definition = exact(owner, "send($request)Lcom/google/android/datatransport/runtime/backends/BackendResponse;").classDef
    check(definition.methods.none { it.name == "morpheMeasurementRequest" })
    val method = MutableMethod(ImmutableMethod(owner, "morpheMeasurementRequest",
        listOf(ImmutableMethodParameter(request, emptySet(), null)), request, 9, emptySet(), emptySet(),
        ImmutableMethodImplementation(6, emptyList(), emptyList(), emptyList())))
    val excluded = listOf("FIREBASE_CRASHLYTICS_REPORT", "FIREBASE_APPQUALITY_SESSION",
        "FCM_CLIENT_EVENT_LOGGING", "GDT_CLIENT_METRICS", "FIREPERF", "FIREPERF_AUTOPUSH",
        "FIREPERF_INTERNAL_LOW", "FIREPERF_INTERNAL_HIGH").joinToString("\n") { name -> """
        const-string v4, "$name"
        invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        move-result v4
        if-nez v4, :next
    """.trimIndent() }
    method.addInstructions(0, """
        new-instance v0, Ljava/util/ArrayList;
        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
        invoke-virtual {p0}, $request->getEvents()Ljava/lang/Iterable;
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
        $excluded
        invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        goto :next
        :done
        invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v1
        if-eqz v1, :keep
        const/4 v0, 0x0
        return-object v0
        :keep
        invoke-static {}, $request->builder()Lcom/google/android/datatransport/runtime/backends/BackendRequest${'$'}Builder;
        move-result-object v1
        invoke-virtual {p0}, $request->getExtras()[B
        move-result-object v2
        invoke-virtual {v1, v0}, Lcom/google/android/datatransport/runtime/backends/BackendRequest${'$'}Builder;->setEvents(Ljava/lang/Iterable;)Lcom/google/android/datatransport/runtime/backends/BackendRequest${'$'}Builder;
        move-result-object v1
        invoke-virtual {v1, v2}, Lcom/google/android/datatransport/runtime/backends/BackendRequest${'$'}Builder;->setExtras([B)Lcom/google/android/datatransport/runtime/backends/BackendRequest${'$'}Builder;
        move-result-object v1
        invoke-virtual {v1}, Lcom/google/android/datatransport/runtime/backends/BackendRequest${'$'}Builder;->build()Lcom/google/android/datatransport/runtime/backends/BackendRequest;
        move-result-object v0
        return-object v0
    """.trimIndent())
    definition.methods.add(method)
}
