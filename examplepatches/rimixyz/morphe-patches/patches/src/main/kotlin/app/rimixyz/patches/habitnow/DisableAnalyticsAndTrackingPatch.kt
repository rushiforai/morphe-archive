package app.rimixyz.patches.habitnow

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_HABITNOW

private const val ATTR_NAME = "android:name"
private const val ATTR_VALUE = "android:value"
private const val ANALYTICS_DEACTIVATION_KEY = "firebase_analytics_collection_deactivated"
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"

private val ADVERTISING_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
)

/**
 * Patch unificado de privacidade e telemetria do HabitNow 2.5.5.
 *
 * O APK não contém SDK de anúncios: as permissões de ID publicitário são o
 * único vestígio publicitário e são removidas aqui como endurecimento de
 * privacidade, não como remoção de anúncios.
 *
 * A telemetria é desligada no manifesto, usando as chaves oficiais do Firebase
 * já presentes no arquivo: `firebase_analytics_collection_deactivated` passa
 * a `true` e `firebase_crashlytics_collection_enabled` passa a `false`. Isso
 * cobre todos os eventos GA4 (compra, tela, notificação, sign-out, banner de
 * premium etc.) sem tocar nas classes ofuscadas do SDK.
 *
 * Firebase Auth, Storage e Billing são preservados: são usados por conta,
 * backup e compra, e não são coleta de analytics.
 */
@Suppress("unused")
val disableAnalyticsAndTrackingInHabitNowPatch = patch(
    name = "Disable analytics and tracking",
    description = "Disables Firebase Analytics and Crashlytics collection and removes advertising ID permissions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_HABITNOW)

    execute {
        verifyHabitNowTarget()

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

            val adIdPermissions = manifest.root.children("uses-permission")
                .filter { it.attribute(ATTR_NAME) in ADVERTISING_ID_PERMISSIONS }
            adIdPermissions.forEach { it.remove() }

            val remaining = manifest.root.children("uses-permission")
                .filter { it.attribute(ATTR_NAME) in ADVERTISING_ID_PERMISSIONS }
            check(remaining.isEmpty()) {
                "Disable analytics and tracking: ainda restam ${remaining.size} permissões publicitárias"
            }
        }
    }
}
