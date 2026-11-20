package app.parchefacemoji.patches.facemoji.tracking

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.patch
import app.parchefacemoji.patches.facemoji.shared.Constants.COMPATIBILITY_FACEMOJI
import app.parchefacemoji.patches.facemoji.shared.Ajustes
import app.parchefacemoji.patches.facemoji.shared.bloquearVoidSiActivo
import java.util.logging.Logger

private val logger = Logger.getLogger("ParcheFacemoji")

/**
 * Rastreador -> huellas de los metodos que envian datos.
 */
private val TRACKER_SURFACES: Map<String, List<Fingerprint>> = linkedMapOf(
    "Firebase Analytics: eventos" to listOf(FirebaseAnalyticsEventFingerprint),
    "Firebase Analytics: propiedades" to listOf(FirebaseAnalyticsUserPropertyFingerprint),
    "Firebase Analytics: usuario" to listOf(FirebaseAnalyticsUserIdFingerprint),
    "Firebase Analytics: parametros" to listOf(FirebaseAnalyticsDefaultParamsFingerprint),
    "Crashlytics: registros" to listOf(CrashlyticsLogFingerprint),
    "Crashlytics: usuario" to listOf(CrashlyticsUserIdFingerprint),
    "Crashlytics: excepciones" to listOf(CrashlyticsRecordExceptionFingerprint),
    "Facebook: eventos" to listOf(FacebookAppEventFingerprint),
    "AppsFlyer: eventos" to listOf(AppsFlyerEventFingerprint),
)

/**
 * Neutraliza el envio de eventos de analitica y atribucion.
 *
 * Solo se interceptan los metodos que envian datos, no los que inicializan los SDK, para
 * no dejar objetos a medio construir: si la app llama despues a otro metodo del SDK
 * (por ejemplo para leer un valor de configuracion remota), todo sigue funcionando igual.
 *
 * Por eso el parche no rompe la app, pero tampoco es un "modo avion" de la telemetria:
 * los SDK pueden seguir enviando datos propios por su cuenta en segundo plano.
 */
@Suppress("unused")
val disableTrackingPatch = patch(
    name = "Desactivar rastreo",
    description = "Deja de enviar los eventos de Firebase Analytics, Crashlytics, Facebook y AppsFlyer. " +
            "Desactiva tambien el envio de registros de fallos.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FACEMOJI)

    category("Privacidad")

    extendWith("extensions/facemoji.mpe")

    execute {
        val neutralized = TRACKER_SURFACES.filter { (surface, fingerprints) ->
            fingerprints.any { fingerprint ->
                fingerprint.bloquearVoidSiActivo(
                    surface = surface,
                    ajuste = Ajustes.RASTREO,
                    extensionMethod = "logTrackerBlocked",
                )
            }
        }.keys

        // Este parche es opcional: si la version de la app no incluye ningun rastreador
        // conocido, no hay nada que hacer y fallar solo molestaria al usuario.
        if (neutralized.isEmpty()) {
            logger.warning("No se ha encontrado ningun rastreador conocido en esta version de Facemoji.")
        } else {
            logger.info("Rastreadores desactivados (${neutralized.size}): ${neutralized.joinToString()}")
        }
    }
}
