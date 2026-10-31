package patches.npostarttv

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.atv.exact

internal val trackingEgress = bytecodePatch {
    dependsOn(originalInput)
    execute {
        if (packageMetadata.isNpoPhone) return@execute
        // Optional advertising configuration: the existing DI branch then omits STER
        // targeting at construction, before reflective request serialization.
        exact("Lnl/npo/player/library/sterads/presentation/ads/ImaAdManager;",
            "supplyOptionalConfiguration()Lnl/npo/player/library/jv/l;", 1, 2)
            .addInstructions(0, "const/4 p0, 0x0\nreturn-object p0")

        // These methods schedule telemetry only; functional Cast/media callbacks remain.
        exact("Lnl/npo/player/library/im/i2;", "a(Lnl/npo/player/library/im/g3;I)V", 5, 6)
            .addInstructions(0, "return-void")
        exact("Lnl/npo/player/library/gm/d1;", "c(Lnl/npo/player/library/gm/a;)V", 5, 16)
            .addInstructions(0, "return-void")

        // This build's Transport.send has only a fixed no-op callback, discarded by its
        // scheduler. Stop collection/persistence while preserving all unrelated a9/t code.
        exact("Lnl/npo/player/library/a9/t;", "O(Lnl/npo/player/library/qk/a;)V", 11, 62)
            .addInstructions(0, "return-void")

        // Historical batches can outlive producer suppression. The real CCT uploader maps
        // this typed local 403 to FATAL_ERROR, deletes the batch and completes its job.
        // Transient statuses would reschedule; a synthetic success would reset metrics.
        exact("Lnl/npo/player/library/nw/a;",
            "f(Lnl/npo/player/library/qn/j;)Lnl/npo/player/library/f7/c1;", 20, 210)
            .addInstructions(0, """
                new-instance v0, Lnl/npo/player/library/f7/c1;
                const/16 v1, 0x193
                const/4 v2, 0x0
                const-wide/16 v3, 0x0
                invoke-direct {v0, v1, v2, v3, v4}, Lnl/npo/player/library/f7/c1;-><init>(ILjava/net/URL;J)V
                return-object v0
            """.trimIndent())

        // A previously scheduled measurement alarm must not re-enter its protected VM.
        // This is not the app's media, network, download or authentication receiver.
        exact("Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerSchedulerBroadcastReceiver;",
            "onReceive(Landroid/content/Context;Landroid/content/Intent;)V", 8, 12)
            .addInstructions(0, "return-void")

        // The advertising-ID client's diagnostics thread has its own gen_204 request path.
        exact("Lnl/npo/player/library/el/b;",
            "d(Lnl/npo/player/library/el/a;JLjava/lang/Throwable;)V", 8, 44)
            .addInstructions(0, "return-void")
    }
}
