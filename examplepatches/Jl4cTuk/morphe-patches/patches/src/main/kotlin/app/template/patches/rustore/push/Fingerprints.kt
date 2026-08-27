package app.template.patches.rustore.push

import app.morphe.patcher.Fingerprint

/** Blocks both automatic and explicit initialization of RuStore Push. */
object RuStorePushInitializeFingerprint : Fingerprint(
    definingClass = "Lc51/c;",
    name = "b",
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Application;",
        "Ljava/lang/String;",
        "Lh51/b;",
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

object RuStoreMessagingServiceBindFingerprint : Fingerprint(
    definingClass = "Lu51/a;",
    name = "onBind",
    returnType = "Landroid/os/IBinder;",
    parameters = listOf("Landroid/content/Intent;"),
)

object RuStoreMessagingServiceCreateFingerprint : Fingerprint(
    definingClass = "Lu51/a;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

object RuStoreMessagingServiceStartFingerprint : Fingerprint(
    definingClass = "Lu51/a;",
    name = "onStartCommand",
    returnType = "I",
    parameters = listOf(
        "Landroid/content/Intent;",
        "I",
        "I",
    ),
)

object RuStoreMessageReceivedFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/push/client/impl/presentation/PushClientMessagingService;",
    name = "c",
    returnType = "V",
    parameters = listOf("Lt51/b;"),
)

object RuStorePushTokenReceivedFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/push/client/impl/presentation/PushClientMessagingService;",
    name = "d",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/** VK Push provider startup coroutine. */
object VkPushProviderInitializedFingerprint : Fingerprint(
    definingClass = "Lmd0/f;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
)

/** VK Push authentication startup coroutine. */
object VkPushAuthInitializedFingerprint : Fingerprint(
    definingClass = "Lkb0/l;",
    name = "invokeSuspend",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
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

val vkPushLifecycleFingerprints = vkPushLifecycleMethods.map { (name, parameters) ->
    Fingerprint(
        definingClass = "Lgc0/a;",
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

object VkPushBaseServiceBindFingerprint : Fingerprint(
    definingClass = "Lpe0/a;",
    name = "onBind",
    returnType = "Landroid/os/IBinder;",
    parameters = listOf("Landroid/content/Intent;"),
)

object VkPushBaseServiceCreateFingerprint : Fingerprint(
    definingClass = "Lpe0/a;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)

object VkPushBaseServiceStartFingerprint : Fingerprint(
    definingClass = "Lpe0/a;",
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

val vkPushBinderServiceClasses = listOf(
    "Lcom/vk/push/pushsdk/work/multiprocess/service/WorkManagerRegistratorService;",
    "Lcom/vk/push/pushsdk/work/multiprocess/service/WorkManagerExecutorService;",
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

val pushWorkerClasses = listOf(
    "Lcom/vk/push/pushsdk/work/CheckThatDeletedAppIsHostWorker;",
    "Lcom/vk/push/pushsdk/work/InitiateMasterElectionsWorker;",
    "Lcom/vk/push/pushsdk/work/multiprocess/MultiProcessWorker;",
    "Lcom/vk/push/pushsdk/work/NotifyOldMasterWorker;",
    "Lcom/vk/push/pushsdk/work/OneTimePushReceiveWorker;",
    "Lcom/vk/push/pushsdk/work/scheduler/DeleteTokensFromServerWorker;",
    "Lcom/vk/push/pushsdk/work/StopDeliverToRemovedAppWorker;",
    "Lcom/vk/push/pushsdk/work/StopDeliverToUninstalledWork;",
    "Lcom/vk/push/pushsdk/work/TokensHealthCheckWorker;",
    "Lru/rustore/sdk/pushclient/internal/work/ArbiterUpdateFallbackWorker;",
    "Lru/rustore/sdk/pushclient/internal/work/DeletePushTokenIfNoHostsWorker;",
)

val pushWorkerFingerprints = pushWorkerClasses.map { definingClass ->
    Fingerprint(
        definingClass = definingClass,
        name = "b",
        returnType = "Ljava/lang/Object;",
        parameters = listOf("Lyt0/e;"),
    )
}
