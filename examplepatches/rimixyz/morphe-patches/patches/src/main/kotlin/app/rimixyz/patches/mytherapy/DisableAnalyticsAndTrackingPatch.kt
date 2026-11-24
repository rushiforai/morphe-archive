package app.rimixyz.patches.mytherapy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.rimixyz.patches.shared.Constants.COMPATIBILITY_MYTHERAPY

private const val ATTR_NAME = "android:name"
private const val ATTR_VALUE = "android:value"
private const val FIREBASE_DEACTIVATION_KEY = "firebase_analytics_collection_deactivated"
private val ADVERTISING_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

/**
 * Patch unificado de privacidade e telemetria para o MyTherapy 4.16.2.
 *
 * Reúne em um único patch todas as proteções de privacidade e bloqueio de rastreamento:
 *  - Analytics interno (`HasAnalyticsConsentUseCaseImpl.invoke`): retorna sempre `false`,
 *    impedindo o envio de eventos em `TrackEventUseCaseImpl` mesmo se houve aceite prévio.
 *  - Firebase Analytics: adiciona `firebase_analytics_collection_deactivated=true` no manifesto,
 *    mantendo FCM (push) e Remote Config intactos.
 *  - AppsFlyer: transforma `StartAppsFlyerSdkUseCase.invoke` em no-op.
 *  - Sentry: transforma `AndroidSentryInitializer.initialize` em no-op.
 *  - Identificador publicitário: remove `AD_ID` e `ACCESS_ADSERVICES_AD_ID` do manifesto.
 */
@Suppress("unused")
val disableAnalyticsAndTrackingInMyTherapyPatch = patch(
    name = "Disable analytics and tracking",
    description = "Disables Firebase Analytics, AppsFlyer attribution, Sentry diagnostics, internal analytics tracking, and removes Advertising ID permissions.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MYTHERAPY)

    execute {
        verifyMyTherapyTarget()

        // 1. Corta consentimento interno de analytics (TrackEventUseCaseImpl interpreta false como não enviar).
        HasAnalyticsConsentFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                invoke-static {v0}, Lkotlin/coroutines/jvm/internal/Boxing;->boxBoolean(Z)Ljava/lang/Boolean;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )

        // 2. Neutraliza AppsFlyer e Sentry.
        StartAppsFlyerFingerprint.method.addInstructions(0, "return-void")
        SentryInitializeFingerprint.method.addInstructions(0, "return-void")

        // 3. Desativa Firebase Analytics e remove permissões de Advertising ID no AndroidManifest.xml.
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
            check(adIdPermissions.size == ADVERTISING_ID_PERMISSIONS.size) {
                "Disable analytics and tracking: esperadas ${ADVERTISING_ID_PERMISSIONS.size} permissões AD_ID, encontradas ${adIdPermissions.size}"
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
