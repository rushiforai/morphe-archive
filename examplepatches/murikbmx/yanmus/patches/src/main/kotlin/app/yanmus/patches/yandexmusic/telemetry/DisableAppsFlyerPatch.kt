package app.yanmus.patches.yandexmusic.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.yanmus.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import com.android.tools.smali.dexlib2.AccessFlags

private const val APPS_FLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"

/** Methods of the AppsFlyer implementation that start tracking or send events. */
private val TRACKING_METHODS = setOf(
    "start", "logEvent", "logSession", "logLocation", "logAdRevenue",
    "sendAdRevenue", "sendPushNotificationData", "sendInAppPurchaseData",
)

@Suppress("unused")
val disableAppsFlyerPatch = bytecodePatch(
    name = "Disable AppsFlyer",
    description = "Отключает рекламный трекер AppsFlyer: он не запускается и не отправляет события.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
        // AppsFlyerLib is abstract, its implementation is obfuscated (e.g. com.appsflyer.internal.AFa1zSDK)
        val impls = mutableListOf<String>()
        classDefForEach { if (it.superclass == APPS_FLYER_LIB) impls += it.type }
        if (impls.isEmpty()) throw PatchException("AppsFlyer не найден в APK", null)

        impls.forEach { type ->
            mutableClassDefBy(type).methods.filter { m ->
                !AccessFlags.STATIC.isSet(m.accessFlags) &&
                    m.returnType == "V" &&
                    m.implementation != null &&
                    m.name in TRACKING_METHODS
            }.forEach { it.addInstructions(0, "return-void") }
        }
    }
}
