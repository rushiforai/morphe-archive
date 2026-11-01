package patches.tvgids

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

/** Stop native collector admission as well as the Dart measurement callers. */
internal val comscoreTracking = bytecodePatch {
    dependsOn(originalInput, trackingNative)
    execute {
        val analytics = "Lcom/comscore/flutter/AnalyticsMethodCallHandler;"
        val config = "Lcom/comscore/flutter/ConfigurationMethodCallHandler;"
        val stream = "Lcom/comscore/flutter/ConfigurationMethodCallHandler\$1;"
        val listener = "Lcom/comscore/flutter/ConfigurationMethodCallHandler\$FlutterCrossPublisherUniqueDeviceIdChangeListener;"
        val call = "onMethodCall(Lin3;Lln3;)V"

        // A native query must not initialize Analytics through its class initializer.
        // Return typed disabled-state queries; other SDK operations report that
        // this optional capability is unavailable instead of fabricating handles
        // or acknowledging that measurements were sent or caches were flushed.
        exact(analytics, call, 1, 6, 201).addInstructions(0, """
            iget-object v0, p1, Lin3;->a:Ljava/lang/String;
            const-string v1, "getVersion"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-nez v1, :version
            const-string v1, "getLogLevel"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-nez v1, :level
            const-string v0, "tracking_disabled"
            const-string v1, "Comscore measurement is disabled"
            const/4 v2, 0x0
            invoke-interface {p2, v0, v1, v2}, Lln3;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
            return-void
            :version
            const-string v0, ""
            invoke-interface {p2, v0}, Lln3;->success(Ljava/lang/Object;)V
            return-void
            :level
            const/4 v0, 0x0
            invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            move-result-object v0
            invoke-interface {p2, v0}, Lln3;->success(Ljava/lang/Object;)V
            return-void
        """.trimIndent())
        exact(config, call, 1, 7, 693).addInstructions(0, """
            iget-object v0, p1, Lin3;->a:Ljava/lang/String;
            const-string v1, "isEnabled"
            invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v1
            if-nez v1, :disabled
            const-string v0, "tracking_disabled"
            const-string v1, "Comscore configuration is disabled"
            const/4 v2, 0x0
            invoke-interface {p2, v0, v1, v2}, Lln3;->error(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Object;)V
            return-void
            :disabled
            const/4 v0, 0x0
            invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
            move-result-object v0
            invoke-interface {p2, v0}, Lln3;->success(Ljava/lang/Object;)V
            return-void
        """.trimIndent())

        // R8 removed EventSink.endOfStream from this app. Reintroduce only that
        // protocol operation on the real sink: atomic one-time termination,
        // active-sink identity, and a null ByteBuffer (not a null success event).
        val sink = target("Luj1;", "a(Ljava/lang/Object;)V").classDef
        exact("Luj1;", "a(Ljava/lang/Object;)V", 17, 4, 20)
        exact("Luj1;", "<init>(Lli9;)V", 65537, 3, 7)
        check(sink.methods.none { it.name == "morpheEndOfStream" }) { "TVgids stream policy already exists" }
        sink.methods.add(MutableMethod(ImmutableMethod("Luj1;", "morpheEndOfStream", emptyList(), "V",
            1, emptySet(), emptySet(), ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList()),
        )).apply { addInstructions(0, """
            iget-object v0, p0, Luj1;->a:Ljava/util/concurrent/atomic/AtomicBoolean;
            const/4 v1, 0x0
            const/4 v2, 0x1
            invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z
            move-result v0
            if-eqz v0, :done
            iget-object v0, p0, Luj1;->b:Lli9;
            iget-object v1, v0, Lli9;->b:Ljava/lang/Object;
            check-cast v1, Ljava/util/concurrent/atomic/AtomicReference;
            invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;
            move-result-object v1
            if-ne v1, p0, :done
            iget-object v0, v0, Lli9;->c:Ljava/lang/Object;
            check-cast v0, Lwj1;
            iget-object v1, v0, Lwj1;->a:Li20;
            iget-object v2, v0, Lwj1;->b:Ljava/lang/String;
            const/4 v0, 0x0
            invoke-interface {v1, v2, v0}, Li20;->c(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
            :done
            return-void
        """.trimIndent()) })
        exact(stream, "onListen(Ljava/lang/Object;Ltj1;)V", 1, 4, 17).addInstructions(0, """
            check-cast p2, Luj1;
            invoke-virtual {p2}, Luj1;->morpheEndOfStream()V
            return-void
        """.trimIndent())
        exact(stream, "onCancel(Ljava/lang/Object;)V", 1, 3, 10).addInstructions(0, """
            iget-object p0, p0, $stream->this${'$'}0:$config
            const/4 p1, 0x0
            invoke-static {p0, p1}, $config->f(${config}Ltj1;)V
            return-void
        """.trimIndent())
        exact(stream, "lambda\$onListen\$0()V", 4098, 4, 22).addInstructions(0, "return-void")
        exact(listener, "lambda\$onCrossPublisherUniqueDeviceIdChanged\$0(Ljava/lang/String;)V", 4098, 2, 6)
            .addInstructions(0, "return-void")
        exact(listener, "onCrossPublisherUniqueDeviceIdChanged(Ljava/lang/String;)V", 1, 5, 24)
            .addInstructions(0, "return-void")
    }
}
