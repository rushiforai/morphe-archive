package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/** Car App 1.7.0: every connection broadcast refreshes the provider-backed state. */
internal val carConnectionCallbackCode = """
    iget-object v0, p0, Landroidx/car/app/connection/CarConnectionTypeLiveData${'$'}CarConnectionBroadcastReceiver;->this${'$'}0:Landroidx/car/app/connection/CarConnectionTypeLiveData;
    invoke-virtual {v0}, Landroidx/car/app/connection/CarConnectionTypeLiveData;->queryForState()V
    return-void
""".trimIndent()

/** Work 2.11.2: a combining worker succeeds with the original merged input Data. */
internal val continuationWorkCode = """
    invoke-virtual {p0}, Landroidx/work/ListenableWorker;->getInputData()Landroidx/work/Data;
    move-result-object v0
    invoke-static {v0}, Landroidx/work/ListenableWorker${'$'}Result;->success(Landroidx/work/Data;)Landroidx/work/ListenableWorker${'$'}Result;
    move-result-object v0
    return-object v0
""".trimIndent()

internal val mediaNetworkCallbackCode = """
    iget-object v0, p0, Landroidx/media3/common/util/NetworkTypeObserver${'$'}Receiver;->this${'$'}0:Landroidx/media3/common/util/NetworkTypeObserver;
    invoke-static {v0}, Landroidx/media3/common/util/NetworkTypeObserver;->access${'$'}100(Landroidx/media3/common/util/NetworkTypeObserver;)Ljava/util/concurrent/Executor;
    move-result-object v0
    new-instance v1, Landroidx/media3/common/util/b;
    invoke-direct {v1, p0, p1}, Landroidx/media3/common/util/b;-><init>(Landroidx/media3/common/util/NetworkTypeObserver${'$'}Receiver;Landroid/content/Context;)V
    invoke-static {v0, v1}, Landroidx/media3/common/util/NetworkTypeObserver${'$'}Receiver;->execute${'$'}001(Ljava/util/concurrent/Executor;Ljava/lang/Runnable;)V
    return-void
""".trimIndent()

internal val mediaVolumeCallbackCode = """
    iget-object v0, p0, Landroidx/media3/exoplayer/StreamVolumeManager${'$'}VolumeChangeReceiver;->this${'$'}0:Landroidx/media3/exoplayer/StreamVolumeManager;
    invoke-static {v0}, Landroidx/media3/exoplayer/StreamVolumeManager;->access${'$'}000(Landroidx/media3/exoplayer/StreamVolumeManager;)Landroidx/media3/common/util/BackgroundThreadStateHandler;
    move-result-object v0
    new-instance v1, Landroidx/media3/exoplayer/l2;
    invoke-direct {v1, p0}, Landroidx/media3/exoplayer/l2;-><init>(Landroidx/media3/exoplayer/StreamVolumeManager${'$'}VolumeChangeReceiver;)V
    invoke-static {v0, v1}, Landroidx/media3/exoplayer/StreamVolumeManager${'$'}VolumeChangeReceiver;->runInBackground${'$'}001(Landroidx/media3/common/util/BackgroundThreadStateHandler;Ljava/lang/Runnable;)V
    return-void
""".trimIndent()

internal val mediaRequirementsCallbackCode = """
    invoke-static {p0}, Landroidx/media3/exoplayer/scheduler/RequirementsWatcher${'$'}DeviceStatusChangeReceiver;->isInitialStickyBroadcast${'$'}001(Landroid/content/BroadcastReceiver;)Z
    move-result v0
    if-nez v0, :done
    iget-object v0, p0, Landroidx/media3/exoplayer/scheduler/RequirementsWatcher${'$'}DeviceStatusChangeReceiver;->this${'$'}0:Landroidx/media3/exoplayer/scheduler/RequirementsWatcher;
    invoke-static {v0}, Landroidx/media3/exoplayer/scheduler/RequirementsWatcher;->access${'$'}200(Landroidx/media3/exoplayer/scheduler/RequirementsWatcher;)V
    :done
    return-void
""".trimIndent()

internal val mapConnectivityCallbackCode = """
    iget-object v0, p0, Lorg/maplibre/android/net/ConnectivityReceiver;->connected:Ljava/lang/Boolean;
    if-nez v0, :done
    invoke-static {p0}, Lorg/maplibre/android/net/ConnectivityReceiver;->isNetworkActive${'$'}001(Lorg/maplibre/android/net/ConnectivityReceiver;)Z
    move-result v0
    invoke-static {p0, v0}, Lorg/maplibre/android/net/ConnectivityReceiver;->notifyListeners${'$'}002(Lorg/maplibre/android/net/ConnectivityReceiver;Z)V
    :done
    return-void
""".trimIndent()

internal val navigationEndCallbackCode = """
    iget-object v0, p0, Lorg/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigationNotification${'$'}1;->this${'$'}0:Lorg/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigationNotification;
    invoke-static {v0}, Lorg/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigationNotification;->a(Lorg/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigationNotification;)V
    return-void
""".trimIndent()

internal val nightModeCallbackCode = """
    iget-object v0, p0, Landroidx/appcompat/app/AppCompatDelegateImpl${'$'}AutoNightModeManager${'$'}1;->this${'$'}1:Landroidx/appcompat/app/AppCompatDelegateImpl${'$'}AutoNightModeManager;
    invoke-static {v0}, Landroidx/appcompat/app/AppCompatDelegateImpl${'$'}AutoNightModeManager${'$'}1;->onChange${'$'}001(Landroidx/appcompat/app/AppCompatDelegateImpl${'$'}AutoNightModeManager;)V
    return-void
""".trimIndent()

internal val workTrackerCallbackCode = """
    invoke-static {p1}, Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker${'$'}broadcastReceiver${'$'}1;->getClass${'$'}001(Ljava/lang/Object;)Ljava/lang/Class;
    invoke-static {p2}, Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker${'$'}broadcastReceiver${'$'}1;->getClass${'$'}002(Ljava/lang/Object;)Ljava/lang/Class;
    iget-object v0, p0, Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker${'$'}broadcastReceiver${'$'}1;->this${'$'}0:Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker;
    invoke-static {v0, p2}, Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker${'$'}broadcastReceiver${'$'}1;->onBroadcastReceive${'$'}003(Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker;Landroid/content/Intent;)V
    return-void
""".trimIndent()

internal val timeZoneCallbackCode = """
    const-string v0, "time-zone"
    invoke-static {p2, v0}, Lnet/danlew/android/joda/TimeZoneChangedReceiver;->getStringExtra${'$'}001(Landroid/content/Intent;Ljava/lang/String;)Ljava/lang/String;
    move-result-object v0
    :timezone_start
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;
    move-result-object v1
    invoke-static {v1}, Lorg/joda/time/DateTimeZone;->forTimeZone(Ljava/util/TimeZone;)Lorg/joda/time/DateTimeZone;
    move-result-object v1
    invoke-static {v1}, Lorg/joda/time/DateTimeZone;->setDefault(Lorg/joda/time/DateTimeZone;)V
    const-string v2, "joda-time-android"
    new-instance v3, Ljava/lang/StringBuilder;
    const-string v4, "TIMEZONE_CHANGED received, changed default timezone to \""
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v3, v0}, Lnet/danlew/android/joda/TimeZoneChangedReceiver;->append${'$'}002(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, "\""
    invoke-static {v3, v4}, Lnet/danlew/android/joda/TimeZoneChangedReceiver;->append${'$'}003(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static {v3}, Lnet/danlew/android/joda/TimeZoneChangedReceiver;->toString${'$'}004(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v3
    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :timezone_end
    return-void
    :timezone_invalid
    move-exception v1
    const-string v2, "joda-time-android"
    new-instance v3, Ljava/lang/StringBuilder;
    const-string v4, "Could not recognize timezone id \""
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V
    invoke-static {v3, v0}, Lnet/danlew/android/joda/TimeZoneChangedReceiver;->append${'$'}002(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    const-string v4, "\""
    invoke-static {v3, v4}, Lnet/danlew/android/joda/TimeZoneChangedReceiver;->append${'$'}003(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;
    move-result-object v3
    invoke-static {v3}, Lnet/danlew/android/joda/TimeZoneChangedReceiver;->toString${'$'}004(Ljava/lang/StringBuilder;)Ljava/lang/String;
    move-result-object v3
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    return-void
    .catch Ljava/lang/IllegalArgumentException; {:timezone_start .. :timezone_end} :timezone_invalid
""".trimIndent()

internal val locationModeCallbackCode = """
    iget-object v0, p0, Lhza;->b:Leg7;
    iget-object v0, v0, Leg7;->a:Ljava/lang/Object;
    check-cast v0, Ljza;
    iget-object v0, v0, Ljza;->b:Llza;
    invoke-static {v0}, Lhza;->b${'$'}001(Llza;)Z
    move-result v0
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    move-result-object v0
    iget-object v1, p0, Lhza;->a:Li0d${'$'}a;
    invoke-static {v1, v0}, Lhza;->b${'$'}002(Li0d${'$'}a;Ljava/lang/Object;)V
    return-void
""".trimIndent()

internal val shortcutCallbackCode = """
    iget-object v0, p0, Landroidx/core/content/pm/ShortcutManagerCompat${'$'}1;->val${'$'}callback:Landroid/content/IntentSender;
    move-object v1, p1
    const/4 v2, 0x0
    const/4 v3, 0x0
    const/4 v4, 0x0
    const/4 v5, 0x0
    :send_start
    invoke-static/range {v0 .. v5}, Landroidx/core/content/pm/ShortcutManagerCompat${'$'}1;->sendIntent${'$'}001(Landroid/content/IntentSender;Landroid/content/Context;ILandroid/content/Intent;Landroid/content/IntentSender${'$'}OnFinished;Landroid/os/Handler;)V
    :send_end
    return-void
    :send_failed
    move-exception v0
    return-void
    .catch Landroid/content/IntentSender${'$'}SendIntentException; {:send_start .. :send_end} :send_failed
""".trimIndent()

internal val dockCallbackCode = """
    iget-object v0, p0, Landroidx/compose/ui/adaptive/MediaQuery_androidKt${'$'}obtainUiMediaScope${'$'}4${'$'}1${'$'}receiver${'$'}1;->${'$'}scope:Landroidx/compose/ui/adaptive/UiMediaScopeImpl;
    invoke-static {p2}, Landroidx/compose/ui/adaptive/MediaQuery_androidKt;->access${'$'}isDocked(Landroid/content/Intent;)Z
    move-result v1
    invoke-static {v0, v1}, Landroidx/compose/ui/adaptive/MediaQuery_androidKt${'$'}obtainUiMediaScope${'$'}4${'$'}1${'$'}receiver${'$'}1;->setDocked${'$'}001(Landroidx/compose/ui/adaptive/UiMediaScopeImpl;Z)V
    return-void
""".trimIndent()

internal data class CallbackRestoration(
    val descriptor: String,
    val registers: Int,
    val instructions: Int,
    val program: String,
    val code: String,
    val exceptions: Int = 0,
)

internal val runtimeCallbackRestorations = listOf(
    CallbackRestoration(
        "Landroidx/car/app/connection/CarConnectionTypeLiveData\$CarConnectionBroadcastReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "Dr4dBbMVL1fUdwh9", carConnectionCallbackCode,
    ),
    CallbackRestoration(
        "Landroidx/work/impl/workers/CombineContinuationsWorker;->doWork()Landroidx/work/ListenableWorker\$Result;",
        6, 9, "vXbKgkAw57upg5rB", continuationWorkCode,
    ),
    CallbackRestoration(
        "Landroidx/media3/common/util/NetworkTypeObserver\$Receiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "4Ef7LqTtG2McIaQc", mediaNetworkCallbackCode,
    ),
    CallbackRestoration(
        "Landroidx/media3/exoplayer/StreamVolumeManager\$VolumeChangeReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "nQul9qCZs3mKlESl", mediaVolumeCallbackCode,
    ),
    CallbackRestoration(
        "Landroidx/media3/exoplayer/scheduler/RequirementsWatcher\$DeviceStatusChangeReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "TZCDiOLf8RNWmCmn", mediaRequirementsCallbackCode,
    ),
    CallbackRestoration(
        "Lorg/maplibre/android/net/ConnectivityReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "gSATlwyF4ppHnjJ3", mapConnectivityCallbackCode,
    ),
    CallbackRestoration(
        "Lorg/maplibre/navigation/android/navigation/v5/navigation/MapLibreNavigationNotification\$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "K0NpSU0GTpBB8KFs", navigationEndCallbackCode,
    ),
    CallbackRestoration(
        "Landroidx/appcompat/app/AppCompatDelegateImpl\$AutoNightModeManager\$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "QqEacfrxxNH2xR2o", nightModeCallbackCode,
    ),
    CallbackRestoration(
        "Landroidx/work/impl/constraints/trackers/BroadcastReceiverConstraintTracker\$broadcastReceiver\$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "I2W18NGJ4P3J9qN4", workTrackerCallbackCode,
    ),
    CallbackRestoration(
        "Lnet/danlew/android/joda/TimeZoneChangedReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "Nr6fU41sFaWlDulA", timeZoneCallbackCode, 1,
    ),
    CallbackRestoration(
        "Lhza;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "nb4te9nJow5cnABc", locationModeCallbackCode,
    ),
    CallbackRestoration(
        "Landroidx/core/content/pm/ShortcutManagerCompat\$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "Du2QUEGNa6vaWkHX", shortcutCallbackCode, 1,
    ),
    CallbackRestoration(
        "Landroidx/compose/ui/adaptive/MediaQuery_androidKt\$obtainUiMediaScope\$4\$1\$receiver\$1;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V",
        8, 12, "ng3GOCaNqhRVl8Cc", dockCallbackCode,
    ),
)

private data class RuntimeCatch(val type: String, val start: String, val end: String, val handler: String)

internal fun MutableMethod.addRuntimeCallbackInstructions(code: String, expectedCatches: Int) {
    // Morphe assembles .catch instructions but does not copy their exception table.
    val labels = mutableMapOf<String, Int>()
    val catches = mutableListOf<RuntimeCatch>()
    val pattern = Regex("""\.catch (L[^;]+;) \{(:\w+) \.\. (:\w+)\} (:\w+)""")
    var index = 0
    for (line in code.lineSequence().map(String::trim).filter(String::isNotEmpty)) {
        when {
            line.startsWith(":") -> check(labels.put(line, index) == null) { "Duplicate callback label: $line" }
            line.startsWith(".catch") -> {
                val match = checkNotNull(pattern.matchEntire(line)) { "Unexpected callback catch: $line" }
                val (type, start, end, handler) = match.destructured
                catches += RuntimeCatch(type, start, end, handler)
            }
            else -> {
                check(line.first().isLowerCase()) { "Unexpected callback directive: $line" }
                index++
            }
        }
    }
    check(catches.size == expectedCatches && implementation!!.tryBlocks.isEmpty())
    addInstructions(0, code)
    val target = checkNotNull(implementation)
    for (entry in catches) {
        target.addCatch(entry.type,
            target.newLabelForIndex(labels.getValue(entry.start)),
            target.newLabelForIndex(labels.getValue(entry.end)),
            target.newLabelForIndex(labels.getValue(entry.handler)))
    }
}
