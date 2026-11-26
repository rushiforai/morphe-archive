package app.rimixyz.patches.xrecorder

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_XRECORDER

private const val ATTR_NAME = "android:name"
private const val ATTR_VALUE = "android:value"
private const val ANALYTICS_DEACTIVATION_KEY = "firebase_analytics_collection_deactivated"
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"

private val ADVERTISING_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
)

/**
 * EXPERIMENTAL — nao testado em aparelho real.
 *
 * Corta telemetria do XRecorder 2.5.6.1:
 *  - manifest: desativa Firebase Analytics e Crashlytics pelas chaves oficiais
 *    e remove permissoes de ID publicitario;
 *  - `n12.j`: nao registra userSample nem chama FirebaseAnalytics.c;
 *  - `n12.n` e `n12.m`: nao emitem logEvent (eventos ProClick, IAP e PV passam por aqui);
 *  - `x8.f`: nao envia excecoes ao Crashlytics.
 *
 * Firebase Billing, Firebase Auth e Google Play Services sao preservados.
 * Remote Config fica em patch separado (Disable remote config).
 */
@Suppress("unused")
val disableTrackingInXRecorderPatch = patch(
    name = "Disable analytics and tracking",
    description = "Disables Firebase Analytics, Crashlytics, and advertising ID permissions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_XRECORDER)

    execute {
        verifyXRecorderTarget()

        resourceXml("AndroidManifest.xml").use { manifest ->
            val applications = manifest.elements("application").toList()
            check(applications.size == 1) {
                "Disable analytics and tracking: esperado 1 elemento application, encontrado ${applications.size}"
            }
            val application = applications.single()

            fun setMeta(name: String, value: String) {
                val existing = application.children("meta-data")
                    .filter { it.attribute(ATTR_NAME) == name }
                check(existing.size <= 1) {
                    "Disable analytics and tracking: ${existing.size} metadados '$name' conflitantes"
                }
                if (existing.isEmpty()) {
                    application.appendChild("meta-data") {
                        setAttribute(ATTR_NAME, name)
                        setAttribute(ATTR_VALUE, value)
                    }
                } else {
                    existing.single().setAttribute(ATTR_VALUE, value)
                }
            }

            setMeta(ANALYTICS_DEACTIVATION_KEY, "true")
            setMeta(CRASHLYTICS_COLLECTION_KEY, "false")

            manifest.root.children("uses-permission")
                .filter { it.attribute(ATTR_NAME) in ADVERTISING_ID_PERMISSIONS }
                .forEach { it.remove() }

            val remaining = manifest.root.children("uses-permission")
                .filter { it.attribute(ATTR_NAME) in ADVERTISING_ID_PERMISSIONS }
            check(remaining.isEmpty()) {
                "Disable analytics and tracking: ainda restam ${remaining.size} permissoes publicitarias"
            }
        }

        AnalyticsInitFingerprint.method.addInstructions(0, "return-void")
        AnalyticsEventFingerprint.method.addInstructions(0, "return-void")
        AnalyticsBundleEventFingerprint.method.addInstructions(0, "return-void")
        CrashlyticsFingerprint.method.addInstructions(0, "return-void")
    }
}
