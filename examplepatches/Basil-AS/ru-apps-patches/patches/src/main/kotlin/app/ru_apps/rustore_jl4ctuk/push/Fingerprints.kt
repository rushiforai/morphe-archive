// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/push/Fingerprints.kt.
package app.ru_apps.rustore_jl4ctuk.push

import app.morphe.patcher.Fingerprint

/**
 * Blocks both automatic and explicit initialization of RuStore Push. A live
 * decompile (ru.vk.store 1.111.0.3, 2026-10) found the init-guard class
 * renamed Lc51/c; -> Ld51/c; and the logger parameter type renamed
 * Lh51/b; -> Lj51/b; - confirmed by matching the method body (the
 * `Ld51/c;->a:Z` already-initialized guard flag and the "Client SDK is
 * initialized" log line), not just the shape.
 */
object RuStorePushInitializeFingerprint : Fingerprint(
    definingClass = "Ld51/c;",
    name = "b",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Application;",
        "Ljava/lang/String;",
        "Lj51/b;",
    ),
)

object RuStorePushInitProviderFingerprint : Fingerprint(
    definingClass =
        "Lru/rustore/sdk/pushclient/provider/RuStorePushClientInitProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

object RuStorePushArbiterReceiverFingerprint : Fingerprint(
    definingClass =
        "Lru/rustore/sdk/pushclient/internal/arbiter/ArbiterBroadcastReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Landroid/content/Intent;",
    ),
)

// definingClass renamed Lu51/a; -> Lw51/a; (confirmed via live decompile,
// ru.vk.store 1.111.0.3, 2026-10): the old Lu51/a; is now an unrelated sealed
// class (extends the app's own Lm41/c; RuStoreException, not Service) with
// just a boolean c() method - the real PushClientMessagingService base moved
// to Lw51/a;, which still directly extends Landroid/app/Service; and declares
// the same onBind/onCreate/onStartCommand trio.
object RuStoreMessagingServiceBindFingerprint : Fingerprint(
    definingClass = "Lw51/a;",
    name = "onBind",
    returnType = "Landroid/os/IBinder;",
    parameters = listOf("Landroid/content/Intent;"),
)

object RuStoreMessagingServiceCreateFingerprint : Fingerprint(
    definingClass = "Lw51/a;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

object RuStoreMessagingServiceStartFingerprint : Fingerprint(
    definingClass = "Lw51/a;",
    name = "onStartCommand",
    returnType = "I",
    parameters = listOf(
        "Landroid/content/Intent;",
        "I",
        "I",
    ),
)

// Parameter type renamed Lt51/b; -> Lv51/b; alongside the Lw51/a; base-class
// rename above (same live decompile) - PushClientMessagingService.c() still
// overrides the base class's message-received callback unchanged otherwise.
object RuStoreMessageReceivedFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/push/client/impl/presentation/PushClientMessagingService;",
    name = "c",
    returnType = "V",
    parameters = listOf("Lv51/b;"),
)

object RuStorePushTokenReceivedFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/push/client/impl/presentation/PushClientMessagingService;",
    name = "d",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * VK Push provider startup coroutine. A live decompile (ru.vk.store 1.111.0.3,
 * 2026-10) found the old pinned definingClass (Lmd0/f;) now belongs to an
 * unrelated RequestBatcher.kt class - the real startup lambda moved to
 * Lw02/e; (sourceFile VkPnsInitializer.kt), which constructs the provider's
 * config with the "VkpnsPushProvider" logger tag. Re-anchored on sourceFile +
 * that logger-tag string instead of a bare definingClass, since the
 * obfuscated class name itself is exactly what drifted last time.
 */
object VkPushProviderInitializedFingerprint : Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("VkpnsPushProvider"),
    custom = { method, classDef ->
        classDef.sourceFile == "VkPnsInitializer.kt" && method.implementation != null
    },
)

/**
 * VK Push authentication startup coroutine. Same live decompile found this
 * moved to Lw02/d; (sourceFile VkPnsInitializer.kt, logger tag "VkpnsAuth"),
 * alongside the provider startup lambda above - re-anchored the same way.
 */
object VkPushAuthInitializedFingerprint : Fingerprint(
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings = listOf("VkpnsAuth"),
    custom = { method, classDef ->
        classDef.sourceFile == "VkPnsInitializer.kt" && method.implementation != null
    },
)

val vkPushLifecycleMethods = linkedMapOf(
    "onActivityCreated" to listOf(
        "Landroid/app/Activity;",
        "Landroid/os/Bundle;",
    ),
    "onActivityDestroyed" to listOf("Landroid/app/Activity;"),
    "onActivityPaused" to listOf("Landroid/app/Activity;"),
    "onActivityResumed" to listOf("Landroid/app/Activity;"),
    "onActivitySaveInstanceState" to listOf(
        "Landroid/app/Activity;",
        "Landroid/os/Bundle;",
    ),
    "onActivityStarted" to listOf("Landroid/app/Activity;"),
    "onActivityStopped" to listOf("Landroid/app/Activity;"),
)

// definingClass renamed Lgc0/a; -> Ldc0/a; (confirmed via live decompile,
// ru.vk.store 1.111.0.3, 2026-10): sourceFile ActivityLifecycleDataSource.kt.
// Confirmed by call-site archaeology, not just shape - it is `new-instance`'d
// and passed to `Application.registerActivityLifecycleCallbacks` inside the
// already-confirmed VkPnsInitializer.kt startup coroutine (Lw02/e;), and
// `unregisterActivityLifecycleCallbacks` on push-client teardown (Ljd0/c;).
val vkPushLifecycleFingerprints = vkPushLifecycleMethods.map { (name, parameters) ->
    Fingerprint(
        definingClass = "Ldc0/a;",
        name = name,
        returnType = "V",
        parameters = parameters,
    )
}

val vkPushReceiverClasses = listOf(
    "Lcom/vk/push/pushsdk/broadcast/VkpnsReceiver;",
    "Lcom/vk/push/pushsdk/broadcast/FullyPackageRemovedReceiver;",
    "Lcom/vk/push/pushsdk/broadcast/TimeChangedReceiver;",
)

val vkPushReceiverFingerprints = vkPushReceiverClasses.map { definingClass ->
    Fingerprint(
        definingClass = definingClass,
        name = "onReceive",
        returnType = "V",
        parameters = listOf(
            "Landroid/content/Context;",
            "Landroid/content/Intent;",
        ),
    )
}

// definingClass renamed Lpe0/a; -> Lme0/a; (confirmed via live decompile,
// ru.vk.store 1.111.0.3, 2026-10): the old Lpe0/a; package was entirely
// repurposed to an unrelated BroadcastNetworkStateManager.kt lambda helper -
// the real abstract Service base (sourceFile BasePushService.kt) moved to
// Lme0/a;, which still declares the same onBind/onCreate/onStartCommand trio
// and exposes a Lqb0/e; network-state-manager accessor, tying it back to the
// renamed pe0/* NetworkStateManager classes that construct it.
object VkPushBaseServiceBindFingerprint : Fingerprint(
    definingClass = "Lme0/a;",
    name = "onBind",
    returnType = "Landroid/os/IBinder;",
    parameters = listOf("Landroid/content/Intent;"),
)

object VkPushBaseServiceCreateFingerprint : Fingerprint(
    definingClass = "Lme0/a;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

object VkPushBaseServiceStartFingerprint : Fingerprint(
    definingClass = "Lme0/a;",
    name = "onStartCommand",
    returnType = "I",
    parameters = listOf(
        "Landroid/content/Intent;",
        "I",
        "I",
    ),
)

val vkPushDirectServiceClasses = listOf(
    "Lcom/vk/push/pushsdk/masterhost/MasterSelectionService;",
    "Lcom/vk/push/pushsdk/service/TestPushService;",
)

val vkPushDirectServiceBindFingerprints = vkPushDirectServiceClasses.map { definingClass ->
    Fingerprint(
        definingClass = definingClass,
        name = "onBind",
        returnType = "Landroid/os/IBinder;",
        parameters = listOf("Landroid/content/Intent;"),
    )
}

val vkPushDirectServiceStartFingerprints = vkPushDirectServiceClasses.map { definingClass ->
    Fingerprint(
        definingClass = definingClass,
        name = "onStartCommand",
        returnType = "I",
        parameters = listOf(
            "Landroid/content/Intent;",
            "I",
            "I",
        ),
    )
}

// WorkManagerRegistratorService/WorkManagerExecutorService (confirmed via live
// decompile, ru.vk.store 1.111.0.3, 2026-10) no longer exist: the SDK's
// multiprocess/service/ package was dropped entirely and its one remaining
// class (VkpnsWorkerService.kt) now extends AndroidX's own stock
// androidx.work.multiprocess.RemoteWorkerService directly, instead of a
// VK-push-specific binder wrapper. That base class is shared WorkManager
// plumbing used by any feature's multiprocess work, not push-specific, so
// blanket-disabling its onBind would risk breaking unrelated background work;
// the push-specific Worker bodies are already fully neutralized to no-op
// success stubs via pushWorkerFingerprints below, which is what actually
// matters for privacy (no push logic executes), so the two removed binder
// classes are dropped from this list rather than re-targeted at shared infra.
val vkPushBinderServiceClasses = listOf(
    "Lcom/vk/push/authsdk/ipc/AuthService;",
)

val vkPushBinderServiceFingerprints = vkPushBinderServiceClasses.map { definingClass ->
    Fingerprint(
        definingClass = definingClass,
        name = "onBind",
        returnType = "Landroid/os/IBinder;",
        parameters = listOf("Landroid/content/Intent;"),
    )
}

object VkPushDeviceIdProviderCreateFingerprint : Fingerprint(
    definingClass =
        "Lcom/vk/push/core/deviceid/contentprovider/VkpnsDeviceIdContentProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

object VkPushDeviceIdProviderQueryFingerprint : Fingerprint(
    definingClass =
        "Lcom/vk/push/core/deviceid/contentprovider/VkpnsDeviceIdContentProvider;",
    name = "query",
    returnType = "Landroid/database/Cursor;",
    parameters = listOf(
        "Landroid/net/Uri;",
        "[Ljava/lang/String;",
        "Ljava/lang/String;",
        "[Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

// Lcom/vk/push/pushsdk/work/multiprocess/MultiProcessWorker; (confirmed via
// live decompile, ru.vk.store 1.111.0.3, 2026-10) no longer exists: the whole
// multiprocess/ subpackage was dropped and its one remaining class
// (VkpnsWorkerService.kt) now extends AndroidX's stock RemoteWorkerService
// directly, with no suspend-function worker body of its own to neutralize -
// the actual work logic it used to delegate to is already covered by the
// other VK-push worker classes below, so it is dropped from this list (same
// reasoning as the WorkManagerRegistratorService/WorkManagerExecutorService
// removal in vkPushBinderServiceClasses above).
val pushWorkerClasses = listOf(
    "Lcom/vk/push/pushsdk/work/CheckThatDeletedAppIsHostWorker;",
    "Lcom/vk/push/pushsdk/work/InitiateMasterElectionsWorker;",
    "Lcom/vk/push/pushsdk/work/NotifyOldMasterWorker;",
    "Lcom/vk/push/pushsdk/work/OneTimePushReceiveWorker;",
    "Lcom/vk/push/pushsdk/work/scheduler/DeleteTokensFromServerWorker;",
    "Lcom/vk/push/pushsdk/work/StopDeliverToRemovedAppWorker;",
    "Lcom/vk/push/pushsdk/work/StopDeliverToUninstalledWork;",
    "Lcom/vk/push/pushsdk/work/TokensHealthCheckWorker;",
    "Lru/rustore/sdk/pushclient/internal/work/ArbiterUpdateFallbackWorker;",
    "Lru/rustore/sdk/pushclient/internal/work/DeletePushTokenIfNoHostsWorker;",
)

// The suspend worker body's method letter name drifted b -> c for all nine
// com.vk.push.* workers above, while the two ru.rustore.sdk.pushclient.*
// workers kept b (confirmed via live decompile, ru.vk.store 1.111.0.3,
// 2026-10) - two different R8 runs/modules renamed independently, so the
// method name is no longer uniform across this class list.
val pushWorkerFingerprints = pushWorkerClasses.map { definingClass ->
    Fingerprint(
        definingClass = definingClass,
        name = if (definingClass.startsWith("Lcom/vk/push/")) "c" else "b",
        returnType = "Ljava/lang/Object;",
        parameters = listOf("Lyt0/e;"),
    )
}
