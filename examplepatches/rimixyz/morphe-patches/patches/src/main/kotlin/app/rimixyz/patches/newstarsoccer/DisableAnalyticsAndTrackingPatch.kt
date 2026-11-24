package app.rimixyz.patches.newstarsoccer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_NEWSTARSOCER

private const val ATTR_NAME = "android:name"
private const val ATTR_VALUE = "android:value"
private const val FIREBASE_DEACTIVATION_KEY = "firebase_analytics_collection_deactivated"
private val ADVERTISING_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

/**
 * Patch unificado de privacidade e telemetria para o New Star Soccer 4.34.
 *
 * Reúne em um único patch:
 *  - Firebase Analytics: adiciona `firebase_analytics_collection_deactivated=true` no manifesto.
 *  - Identificador publicitário: remove `AD_ID` e `ACCESS_ADSERVICES_AD_ID` do manifesto.
 *  - Flurry Analytics: neutraliza `BBFlurry.onStartSession`.
 *  - Flurry startup measurement: neutraliza `FlurryContentProvider.onCreate` e `query` (retorna
 *    `null` com segurança sem remover o componente do manifesto).
 */
@Suppress("unused")
val disableAnalyticsAndTrackingInNssPatch = patch(
    name = "Disable analytics and tracking",
    description = "Disables Firebase Analytics, Flurry analytics and startup measurement, and removes Advertising ID permissions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_NEWSTARSOCER)

    execute {
        verifyNewStarSoccerTarget()

        // 1. Flurry analytics session.
        FlurrySessionStartFingerprint.method.addInstructions(0, "return-void")

        // 2. Flurry startup measurement provider (onCreate -> true, query -> null).
        FlurryProviderOnCreateFingerprint.method.addInstructions(
            0,
            """
                const/4 v3, 0x1
                return v3
            """.trimIndent(),
        )
        FlurryProviderQueryFingerprint.method.addInstructions(
            0,
            """
                const/4 v1, 0x0
                return-object v1
            """.trimIndent(),
        )

        // 3. Firebase Analytics flag + remoção das permissões AD_ID no AndroidManifest.xml.
        resourceXml("AndroidManifest.xml").use { manifest ->
            val applications = manifest.elements("application").toList()
            check(applications.size == 1) {
                "Disable analytics and tracking: esperado 1 elemento application, encontrado ${applications.size}"
            }

            val application = applications.single()
            val existing = application.children("meta-data")
                .filter { it.attribute(ATTR_NAME) == FIREBASE_DEACTIVATION_KEY }
            check(existing.size <= 1) {
                "Disable analytics and tracking: ${existing.size} metadados '$FIREBASE_DEACTIVATION_KEY' conflitantes"
            }
            if (existing.isEmpty()) {
                application.appendChild("meta-data") {
                    setAttribute(ATTR_NAME, FIREBASE_DEACTIVATION_KEY)
                    setAttribute(ATTR_VALUE, "true")
                }
            } else {
                existing.single().setAttribute(ATTR_VALUE, "true")
            }

            val adIdPermissions = manifest.root.children("uses-permission")
                .filter { it.attribute(ATTR_NAME) in ADVERTISING_ID_PERMISSIONS }
            check(adIdPermissions.isNotEmpty()) {
                "Disable analytics and tracking: nenhuma permissão publicitária encontrada no manifesto"
            }
            adIdPermissions.forEach { it.remove() }

            val remaining = manifest.root.children("uses-permission")
                .filter { it.attribute(ATTR_NAME) in ADVERTISING_ID_PERMISSIONS }
            check(remaining.isEmpty()) {
                "Disable analytics and tracking: ainda restam ${remaining.size} permissões publicitárias"
            }
        }
    }
}
