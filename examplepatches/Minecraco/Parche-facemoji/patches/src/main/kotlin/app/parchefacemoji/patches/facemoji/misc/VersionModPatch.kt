package app.parchefacemoji.patches.facemoji.misc

import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.parchefacemoji.patches.facemoji.shared.Constants.COMPATIBILITY_FACEMOJI
import java.util.logging.Logger

private val logger = Logger.getLogger("ParcheFacemoji")

/** Sufijo que se anyade al nombre de la version de la app parcheada. */
private const val SUFIJO = "-Mod"

/**
 * Marca la app parcheada con el sufijo `-Mod` en su version.
 *
 * En el manifiesto, `android:versionName` pasa de `3.7.0` a `3.7.0-Mod`, de modo que en los
 * ajustes del sistema (y en cualquier sitio donde Android muestre la version) se distingue a
 * simple vista la app parcheada de la original.
 *
 * No cambia `versionCode`: para Android sigue siendo la misma aplicacion y se instala encima de
 * la original sin problemas.
 */
@Suppress("unused")
val versionModPatch = patch(
    name = "Marcar la version como Mod",
    description = "Anyade el sufijo -Mod al nombre de la version de la app (3.7.0 -> 3.7.0-Mod) " +
            "para distinguir la copia parcheada de la original.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACEMOJI)

    category("Ajustes")

    execute {
        resourceXml("AndroidManifest.xml").use { manifiesto ->
            val raiz = manifiesto.root
            val actual = raiz.attribute("android:versionName")

            if (actual == null) {
                logger.warning("El manifiesto no declara android:versionName; no se cambia nada.")
                return@use
            }

            if (actual.endsWith(SUFIJO)) {
                logger.info("La version ya esta marcada: $actual")
                return@use
            }

            val nueva = "$actual$SUFIJO"
            raiz.setAttribute("android:versionName", nueva)
            logger.info("Version de la app: $actual -> $nueva")
        }
    }
}
