package app.parchefacemoji.patches.facemoji.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.parchefacemoji.patches.facemoji.shared.Constants.COMPATIBILITY_FACEMOJI
import app.parchefacemoji.patches.facemoji.shared.Ajustes
import app.parchefacemoji.patches.facemoji.shared.forzarBooleanSiActivo
import java.util.logging.Logger

private val logger = Logger.getLogger("ParcheFacemoji")

/**
 * Superficie publicitaria -> huella que la apaga (se fuerza a `false`).
 */
private val AD_SWITCHES: Map<String, Fingerprint> = linkedMapOf(
    "Peticion de sugerencias" to AdSuggestionMasterGateFingerprint,
    "Sugerencias de comercio" to AdSuggestionCommerceGateFingerprint,
    "Interruptor de sugerencias" to AdSuggestionSwitchEnableFingerprint,
    "Interruptor de comercio" to AdSuggestionEcommerceEnableFingerprint,
    "Configuracion de estilo" to AdSuggestionGpConfigEnableFingerprint,
)

/**
 * Apaga las sugerencias patrocinadas que Facemoji muestra dentro del teclado.
 *
 * El teclado ofrece, entre las palabras sugeridas, enlaces patrocinados a apps y tiendas.
 * Todas esas sugerencias pasan por `AdSuggestionUtils`: sus dos metodos de decision
 * (`b()` y `c()`) devuelven `true` cuando hay que pedirlas, y se alimentan de tres
 * configuraciones remotas que se consultan con `getEnable()`.
 *
 * El parche fuerza esos cinco puntos a `false`. Al no pedirse nunca, la app no descarga la
 * lista de sugerencias ni pinta la fila de anuncios; el resto del teclado (prediccion,
 * correccion, emojis) no se ve afectado porque usa otro motor distinto.
 *
 * Limitacion conocida: la publicidad de pantalla completa (bienvenida y emergentes) la sirve
 * Pangle/CSJ con las clases renombradas por R8, asi que en 3.7.0 no queda un punto de enganche
 * estable para ella. Este parche no la elimina.
 */
@Suppress("unused")
val removeAdsPatch = patch(
    name = "Eliminar anuncios",
    description = "Apaga las sugerencias patrocinadas que la app inserta en el teclado. " +
            "Se puede activar o desactivar en los ajustes de Minecraco sin volver a parchear. " +
            "En la version 3.7.0 la publicidad a pantalla completa la sirve Pangle con las clases " +
            "renombradas, por lo que ese formato no se puede bloquear de forma estable.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACEMOJI)

    category("Anuncios")

    // Anade las clases de diagnostico (PatchHooks) al DEX de la app.
    extendWith("extensions/facemoji.mpe")

    execute {
        val disabled = AD_SWITCHES.filter { (surface, fingerprint) ->
            fingerprint.forzarBooleanSiActivo(
                value = false,
                surface = "anuncio: $surface",
                ajuste = Ajustes.ANUNCIOS,
            )
        }.keys

        if (disabled.isEmpty()) {
            throw PatchException(
                "No se ha encontrado el motor de sugerencias patrocinadas en esta version de " +
                        "Facemoji. Es probable que la app haya cambiado de SDK o que esta version " +
                        "aun no este soportada. Desactiva este parche o abre una incidencia en " +
                        "https://github.com/Minecraco/Parche-facemoji/issues indicando la version " +
                        "de la app.",
            )
        }

        logger.info("Anuncios apagados (${disabled.size}/${AD_SWITCHES.size}): ${disabled.joinToString()}")
    }
}
