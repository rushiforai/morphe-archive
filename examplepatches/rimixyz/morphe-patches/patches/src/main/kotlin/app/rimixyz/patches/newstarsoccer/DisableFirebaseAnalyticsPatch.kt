package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

private const val METADATA_NAME = "android:name"
private const val METADATA_VALUE = "android:value"
private const val DEACTIVATION_KEY = "firebase_analytics_collection_deactivated"

/**
 * Desativa o Firebase Analytics permanentemente pelo metadado lido pelo próprio SDK
 * (com.google.android.gms.measurement.internal.zzag.zzx em classes3.dex).
 *
 * Mantém FirebaseInitProvider, Firebase Messaging, a UI de consentimento UMP, Play Games e
 * a cobrança intactos: apenas a chave documentada de desativação é acrescentada/ajustada.
 * A verificação de duplicatas evita um manifesto ambíguo.
 */
@Suppress("unused")
val disableFirebaseAnalyticsPatch = patch(
    name = "Disable Firebase Analytics",
    description = "Disables Firebase Analytics collection through the SDK's official manifest flag, while keeping push notifications and the consent UI.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        resourceXml("AndroidManifest.xml").use { manifest ->
            val applications = manifest.elements("application").toList()
            check(applications.size == 1) {
                "Disable Firebase Analytics: esperado 1 elemento application, encontrado ${applications.size}"
            }

            val application = applications.single()
            val existing = application.children("meta-data")
                .filter { it.attribute(METADATA_NAME) == DEACTIVATION_KEY }

            check(existing.size <= 1) {
                "Disable Firebase Analytics: ${existing.size} metadados '$DEACTIVATION_KEY' conflitantes"
            }

            if (existing.isEmpty()) {
                application.appendChild("meta-data") {
                    setAttribute(METADATA_NAME, DEACTIVATION_KEY)
                    setAttribute(METADATA_VALUE, "true")
                }
            } else {
                existing.single().setAttribute(METADATA_VALUE, "true")
            }

            val finalEntries = application.children("meta-data")
                .filter { it.attribute(METADATA_NAME) == DEACTIVATION_KEY }
            check(finalEntries.size == 1 && finalEntries.single().attribute(METADATA_VALUE) == "true") {
                "Disable Firebase Analytics: falha ao confirmar o metadado final"
            }
        }
    }
}
