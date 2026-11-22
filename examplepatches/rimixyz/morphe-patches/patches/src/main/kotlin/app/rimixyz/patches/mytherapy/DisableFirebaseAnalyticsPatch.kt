package app.rimixyz.patches.mytherapy

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY

private const val METADATA_NAME = "android:name"
private const val METADATA_VALUE = "android:value"
private const val DEACTIVATION_KEY = "firebase_analytics_collection_deactivated"

/**
 * Desativa o Firebase Analytics permanentemente pelo metadado oficial lido pelo próprio SDK.
 *
 * A amostra não continha nenhuma das chaves de configuração de coleta no manifesto, e o destino
 * do app chama `FirebaseAnalytics.setAnalyticsCollectionEnabled(Z)` em runtime. A chave declarada
 * no manifesto tem precedência sobre essa chamada, conforme a documentação do Firebase.
 *
 * Firebase Messaging, Installations, Remote Config, UMP, Alarmes e demais destinos de analytics
 * (AppsFlyer, Sentry, CleverTap) permanecem intactos: apenas a chave de desativação é ajustada.
 */
@Suppress("unused")
val disableFirebaseAnalyticsInMyTherapyPatch = patch(
    name = "Disable Firebase Analytics in MyTherapy",
    description = "Disables Firebase Analytics collection through the SDK's official manifest flag, keeping push, remote config and the consent UI.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    execute {
        verifyMyTherapyTarget()

        resourceXml("AndroidManifest.xml").use { manifest ->
            val applications = manifest.elements("application").toList()
            check(applications.size == 1) {
                "Disable Firebase Analytics in MyTherapy: esperado 1 elemento application, encontrado ${applications.size}"
            }

            val application = applications.single()
            val existing = application.children("meta-data")
                .filter { it.attribute(METADATA_NAME) == DEACTIVATION_KEY }

            check(existing.size <= 1) {
                "Disable Firebase Analytics in MyTherapy: ${existing.size} metadados '$DEACTIVATION_KEY' conflitantes"
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
                "Disable Firebase Analytics in MyTherapy: falha ao confirmar o metadado final"
            }
        }
    }
}
