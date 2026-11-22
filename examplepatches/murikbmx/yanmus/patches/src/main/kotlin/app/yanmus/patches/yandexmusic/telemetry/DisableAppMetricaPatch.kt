package app.yanmus.patches.yandexmusic.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.yanmus.patches.yandexmusic.shared.Constants.COMPATIBILITY_YANDEX_MUSIC
import com.android.tools.smali.dexlib2.AccessFlags

private const val APP_METRICA = "Lio/appmetrica/analytics/AppMetrica;"

/**
 * Static methods of the AppMetrica facade that only send data. They become empty.
 * Not touched: activate, activateReporter, getReporter, requestStartupParams, getDeviceId, getUuid —
 * Yandex apps get device identifiers for the account login through them.
 */
private val REPORTING_METHODS = setOf(
    "reportEvent", "reportError", "reportUnhandledException", "reportAnr", "reportAppOpen",
    "reportReferralUrl", "reportRevenue", "reportAdRevenue", "reportExternalAdRevenue",
    "reportECommerce", "reportUserProfile", "reportExternalAttribution",
    "sendEventsBuffer", "putAppEnvironmentValue", "putErrorEnvironmentValue",
    "setUserProfileID", "setLocation", "setLocationTracking", "setAdvIdentifiersTracking",
    "enableActivityAutoTracking", "resumeSession", "pauseSession", "initWebViewReporting",
    "registerAnrListener",
)

/** Config builders: build() always turns data sending off. */
private val CONFIG_BUILDERS = listOf(
    "Lio/appmetrica/analytics/AppMetricaConfig\$Builder;",
    "Lio/appmetrica/analytics/ReporterConfig\$Builder;",
)

@Suppress("unused")
val disableAppMetricaPatch = bytecodePatch(
    name = "Disable AppMetrica",
    description = "Отключает отправку аналитики AppMetrica: события, ошибки, сессии и местоположение не отправляются. " +
        "Идентификаторы устройства для входа в аккаунт продолжают работать. " +
        "Push-уведомления Яндекса, которые идут через AppMetrica Push, могут перестать приходить.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YANDEX_MUSIC)

    execute {
        val facade = mutableClassDefByOrNull(APP_METRICA)
            ?: throw PatchException("AppMetrica не найдена в APK", null)

        facade.methods.filter { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) &&
                m.returnType == "V" &&
                m.implementation != null &&
                m.name in REPORTING_METHODS
        }.forEach { it.addInstructions(0, "return-void") }

        // AppMetrica.setDataSendingEnabled(enabled): always false.
        facade.methods.firstOrNull { it.name == "setDataSendingEnabled" && it.parameterTypes == listOf("Z") }
            ?.addInstructions(0, "const/4 p0, 0x0")

        CONFIG_BUILDERS.forEach { type ->
            val builder = mutableClassDefByOrNull(type) ?: return@forEach
            val build = builder.methods.firstOrNull { it.name == "build" && it.parameterTypes.isEmpty() }
                ?: throw PatchException("$type: build() не найден", null)
            // build() has local registers before p0, v0 is free at its start.
            if (build.implementation!!.registerCount < 2) throw PatchException("$type: build() без свободных регистров", null)
            build.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    invoke-virtual {p0, v0}, $type->withDataSendingEnabled(Z)$type
                """,
            )
        }
    }
}
