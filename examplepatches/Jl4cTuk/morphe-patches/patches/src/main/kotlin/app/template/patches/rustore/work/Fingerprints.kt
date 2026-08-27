package app.template.patches.rustore.work

import app.morphe.patcher.Fingerprint

val restrictedWorkerClasses = listOf(
    "Lru/vk/store/feature/launchericon/impl/presentation/LauncherIconUpdateWorker;",
    "Lru/vk/store/feature/payments/subscription/update/impl/presentation/CancelSubscriptionSyncWorker;",
    "Lru/vk/store/feature/showcase/startDestination/impl/presentation/UpdateStartDestinationWorker;",
    "Lru/vk/store/feature/showcase/tabsOrder/impl/presentation/ShowcaseTabsOrderUpdateWorker;",
    "Lru/vk/store/feature/storeapp/review/remote/impl/presentation/AddAppReviewWorker;",
)

val restrictedWorkerFingerprints = restrictedWorkerClasses.map { type ->
    Fingerprint(
        definingClass = type,
        name = "b",
        returnType = "Ljava/lang/Object;",
        parameters = listOf("Lyt0/e;"),
    )
}

object WorkManagerCancelUniqueImplementationFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("CancelWorkByName_"),
    custom = { method, classDef ->
        classDef.sourceFile == "WorkManagerImpl.java" &&
            classDef.superclass != null &&
            method.implementation != null
    },
)

object LauncherIconScheduleFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("LauncherIconUpdate"),
    custom = { method, classDef ->
        classDef.sourceFile == "LauncherIconUpdateWorkerManager.kt" &&
            method.implementation != null
    },
)

object StartDestinationScheduleFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("J", "Ldx0/c;"),
    strings = listOf("PeriodicUpdateStartDestination"),
    custom = { method, classDef ->
        classDef.sourceFile == "UpdateStartDestinationWorkerManager.kt" &&
            method.implementation != null
    },
)

object TabsOrderScheduleFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("NavigationTabsOrderUpdate"),
    custom = { method, classDef ->
        classDef.sourceFile == "ShowcaseTabsOrderUpdateWorkerManager.kt" &&
            method.implementation != null
    },
)

object CancelSubscriptionInitializerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lau0/d;"),
    strings = listOf("CancelSubscriptionSyncWorker"),
    custom = { method, classDef ->
        classDef.sourceFile == "CancelSubscriptionInitializer.kt" &&
            method.implementation != null
    },
)
