package app.template.patches.rustore.analytics

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val ALTCRAFT_WORKER =
    "Lru/vk/store/lib/analytics/system/altcraft/presentation/AltCraftFlushEventsWorker;"
private const val RADAR_WORKER =
    "Lru/vk/store/lib/analytics/system/radar/presentation/RadarFlushSnapshotWorker;"
private const val START_PERMISSION_TYPE =
    "Lru/vk/store/feature/permission/start/api/domain/StartPermissionType;"

private fun Method.referencesClass(type: String) =
    implementation?.instructions?.any { instruction ->
        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
            is FieldReference -> reference.definingClass == type
            is MethodReference -> reference.definingClass == type
            is TypeReference -> reference.type == type
            else -> false
        }
    } == true

private fun Method.referencesField(definingClass: String, name: String) =
    implementation?.instructions?.any { instruction ->
        val reference =
            (instruction as? ReferenceInstruction)?.reference as? FieldReference
        reference?.definingClass == definingClass && reference.name == name
    } == true

private fun Method.referencesFieldType(definingClass: String, type: String) =
    implementation?.instructions?.any { instruction ->
        val reference =
            (instruction as? ReferenceInstruction)?.reference as? FieldReference
        reference?.definingClass == definingClass && reference.type == type
    } == true

/**
 * Matches `AltCraftAnalyticsImpl.send(String, Map, String, boolean, li2.f)`,
 * the central entry point used for AltCraft events.
 */
object AltCraftSendFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Ljava/lang/String;",
        "Z",
        "L",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "AltCraftAnalyticsImpl.kt" &&
            method.implementation != null
    },
)

/** Matches RuStore's own MyTracker login event producer before it builds event metadata. */
object MyTrackerLoginFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    custom = { method, classDef ->
        classDef.sourceFile == "MyTrackerAnalyticsImpl.kt" &&
            method.referencesClass("Lcom/my/tracker/MyTracker;")
    },
)

/** Matches RuStore's own MyTracker event producer before it launches its reporting coroutine. */
object MyTrackerSendFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Ljava/lang/String;",
        "Z",
        "L",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "MyTrackerAnalyticsImpl.kt" &&
            method.implementation != null
    },
)

/** Matches WorkManagerImpl's `cancelUniqueWork()` override after R8 renaming. */
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

/** Matches VK SuperAppKit's central stat sender by its stable API method names. */
object SuperAppStatSenderFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L", "Z", "Z", "L", "Z"),
    strings = listOf(
        "statEvents.addSAKMobile",
        "statEvents.addSAKMobileAnonymously",
    ),
)

/** Matches the common SuperAppKit event commit path before filtering and serialization. */
object SuperAppStatEventCommitFingerprint : Fingerprint(
    returnType = "L",
    parameters = emptyList(),
    strings = listOf("Event validation error for "),
)

/** Matches the StatLog task scheduler before it posts recurring handler callbacks. */
object SuperAppStatDaemonScheduleFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("post task failure"),
)

/** Matches VK Push's crash-reporter factory, which contains a built-in no-op fallback. */
object PushCrashReporterFactoryFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "L",
        "L",
    ),
    strings = listOf(
        "Using real crash reporter",
        "Using stub crash reporter",
    ),
    custom = { method, classDef ->
        classDef.sourceFile == "CrashSenderRepositoryFactory.kt" &&
            method.implementation != null
    },
)

/** Matches the initializer that creates AltCraft's periodic flush work. */
object AltCraftFlushInitializerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, classDef ->
        classDef.sourceFile == "AltCraftFlushInitializer.kt" &&
            method.referencesClass(ALTCRAFT_WORKER)
    },
)

/** Matches the coroutine implementation of `AltCraftFlushEventsWorker.doWork()`. */
object AltCraftDoWorkFingerprint : Fingerprint(
    definingClass = ALTCRAFT_WORKER,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, _ -> method.implementation != null },
)

/** Matches the initializer that creates Radar's periodic snapshot flush work. */
object RadarInitializerFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;", "L"),
    custom = { method, classDef ->
        classDef.sourceFile == "RadarInitializer.kt" &&
            method.referencesClass(RADAR_WORKER)
    },
)

/** Matches the coroutine implementation of `RadarFlushSnapshotWorker.doWork()`. */
object RadarDoWorkFingerprint : Fingerprint(
    definingClass = RADAR_WORKER,
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, _ ->
        method.implementation != null
    },
)

/**
 * Matches the startup decision for the Usage Stats analytics permission sheet.
 * The aggregate permission builder also references `USAGE_STATS`, so the remote-feature field
 * requirement keeps this fingerprint pinned to the boolean producer.
 */
object UsageStatsPromptEligibilityFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("L"),
    custom = { method, classDef ->
        classDef.sourceFile == "GetStartPermissionsUseCaseImpl.kt" &&
            method.referencesField(START_PERMISSION_TYPE, "USAGE_STATS") &&
            method.referencesFieldType(
                "Lru/vk/store/lib/featuretoggle/b;",
                "Lru/vk/store/lib/featuretoggle/Feature\$Remote\$a;",
            )
    },
)
