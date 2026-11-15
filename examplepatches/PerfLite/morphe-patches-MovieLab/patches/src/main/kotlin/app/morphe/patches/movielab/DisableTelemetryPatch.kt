package app.morphe.patches.movielab

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import java.io.File

private fun replaceAll(file: File, target: ByteArray, replacement: ByteArray): Int {
    if (!file.exists()) return 0
    require(target.size == replacement.size) {
        "Target (${target.size}) and replacement (${replacement.size}) sizes must match"
    }
    val data = file.readBytes()
    var count = 0
    var i = 0
    val limit = data.size - target.size
    while (i <= limit) {
        var match = true
        for (j in target.indices) {
            if (data[i + j] != target[j]) {
                match = false
                break
            }
        }
        if (match) {
            System.arraycopy(replacement, 0, data, i, replacement.size)
            count++
            i += target.size
        } else {
            i++
        }
    }
    if (count > 0) {
        file.writeBytes(data)
    }
    return count
}

private val TARGET_ARCHITECTURES = listOf(
    "arm64-v8a",
    "armeabi-v7a",
    "x86_64",
)

private object FirebaseAnalyticsFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
)

private object FirebaseAnalyticsRegistrarFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/firebase/analytics/FlutterFirebaseAppRegistrar;",
    name = "getComponents",
)

private object FirebaseCrashlyticsRegistrarFingerprint : Fingerprint(
    definingClass = "Lio/flutter/plugins/firebase/crashlytics/FlutterFirebaseAppRegistrar;",
    name = "getComponents",
)

private object OneSignalNotificationsFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/flutter/OneSignalNotifications;",
    name = "onMethodCall",
)

private object OneSignalPushSubscriptionFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/flutter/OneSignalPushSubscription;",
    name = "onMethodCall",
)

private object OneSignalUserFingerprint : Fingerprint(
    definingClass = "Lcom/onesignal/flutter/OneSignalUser;",
    name = "onMethodCall",
)

@Suppress("unused")
val disableTelemetryPatch = patch(
    name = "Отключение телеметрии",
    description = "Нейтрализация аналитики и отслеживания Firebase Analytics, Crashlytics и OneSignal.",
    default = true,
) {
    compatibleWith(MOVIELAB_COMPATIBILITY)

    execute {
        // 1. Neutralize Firebase Analytics direct reporting
        FirebaseAnalyticsFingerprint.classDefOrNull?.methods?.forEach { method ->
            if (method.returnType == "V" && (
                method.name == "a" ||
                method.name == "b" ||
                method.name == "setCurrentScreen"
            )) {
                method.apply {
                    replaceInstruction(0, "return-void")
                }
            }
        }

        // 2. Prevent Firebase Analytics & Crashlytics from registering Flutter components
        listOf(
            FirebaseAnalyticsRegistrarFingerprint,
            FirebaseCrashlyticsRegistrarFingerprint,
        ).forEach { fingerprint ->
            fingerprint.matchOrNull()?.method?.apply {
                replaceInstruction(0, "invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;")
                addInstruction(1, "move-result-object v0")
                addInstruction(2, "return-object v0")
            }
        }

        // 3. Neutralize OneSignal Flutter MethodChannel calls
        listOf(
            OneSignalNotificationsFingerprint,
            OneSignalPushSubscriptionFingerprint,
            OneSignalUserFingerprint,
        ).forEach { fingerprint ->
            fingerprint.matchOrNull()?.method?.apply {
                val resultType = parameterTypes.lastOrNull()?.toString() ?: return@apply
                replaceInstruction(0, "const/4 v0, 0x0")
                addInstruction(1, "invoke-interface {p2, v0}, $resultType->success(Ljava/lang/Object;)V")
                addInstruction(2, "return-void")
            }
        }

        // 4. Neutralize Firebase Analytics logging channel in libapp.so
        val dartReplacements = listOf(
            "dev.flutter.pigeon.firebase_analytics_platform_interface.FirebaseAnalyticsHostApi.logEvent"
                .toByteArray(Charsets.US_ASCII) to
            "dev.flutter.pigeon.firebase_analytics_platform_interface.FirebaseAnalyticsHostApi.logDisab"
                .toByteArray(Charsets.US_ASCII),
        )

        TARGET_ARCHITECTURES.forEach { arch ->
            val path = "lib/$arch/libapp.so"
            try {
                val libFile = resourceFile(path, true)
                if (libFile.exists()) {
                    dartReplacements.forEach { (target, replacement) ->
                        replaceAll(libFile, target, replacement)
                    }
                }
            } catch (_: Exception) {
                // Ignore missing architecture
            }
        }
    }
}
