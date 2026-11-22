package app.bardo.letterboxd.patches

import app.bardo.letterboxd.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element

private const val EXTENSION_CLASS = "Lapp/bardo/letterboxd/extension/BardoPatch;"
private const val EXTENSION_FILE = "extensions/extension.mpe"

/*
 * Los dos parches solo insertan una llamada estática al principio de un método de
 * Letterboxd. Toda la lógica vive en la extension Java (BardoPatch).
 *
 * Se usa invoke-static/range porque admite cualquier número de registro: así no importa
 * cuántos registros locales tenga el método original.
 */

@Suppress("unused")
val bardoButtonsPatch = patch(
    name = "Bardo buttons",
    description = "Añade a la ficha de película el logo de Bardo junto al botón de tráiler " +
        "(abre la película en Bardo: la ficha del servidor si está en Plex, o la de Descubrir).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    extendWith(EXTENSION_FILE)

    execute {
        // p0 = this, p1 = Film, p2 = FragmentFilmHeaderBinding
        FilmHeaderConfigurePosterFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p1 .. p2 }, $EXTENSION_CLASS->onFilmHeader(Ljava/lang/Object;Ljava/lang/Object;)V
            """,
        )
    }
}

@Suppress("unused")
val bardoWhereToWatchPatch = patch(
    name = "Bardo where to watch",
    description = "Añade el logo de Bardo a «Dónde verlo» cuando la película está en tu " +
        "servidor (según lo que Bardo deja en el puente). El distintivo OWN sigue siendo el de Letterboxd.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    extendWith(EXTENSION_FILE)

    execute {
        // p0 = this (WhereToWatchFragment), p1 = boolean owned, p2 = List de servicios
        WhereToWatchUpdateServicesIconsFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onServicesIcons(Ljava/lang/Object;)V
            """,
        )
        // Y en la pantalla completa de servicios: p0 = this (FilmAvailabilityFragment).
        FilmAvailabilityOnViewCreatedFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onAvailability(Ljava/lang/Object;)V
            """,
        )
    }
}

private const val BRIDGE_PROVIDER = "app.bardo.letterboxd.extension.BardoBridgeProvider"
private const val BRIDGE_AUTHORITY = "app.bardo.letterboxd.bridge"
private const val BRIDGE_CLASS = "Lapp/bardo/letterboxd/extension/BardoBridgeProvider;"

/*
 * Puerta de solo lectura para Bardo: registra en el manifiesto un ContentProvider cuya clase
 * va en la extension (BardoBridgeProvider). Está exportado porque Bardo es otra app con otra
 * firma; quién puede llamar lo decide el propio proveedor.
 */
@Suppress("unused")
val bardoBridgePatch = patch(
    name = "Bardo bridge",
    description = "Permite a Bardo usar Letterboxd con tu sesión: leer notas, amigos, reseñas y tu " +
        "diario, y actualizar tu watchlist y tu diario. Solo responde a Bardo (comprueba su firma).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    extendWith(EXTENSION_FILE)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as Element
            val providers = application.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val existing = providers.item(i) as Element
                if (existing.getAttribute("android:name") == BRIDGE_PROVIDER) return@use
            }
            val provider = manifest.createElement("provider")
            provider.setAttribute("android:name", BRIDGE_PROVIDER)
            provider.setAttribute("android:authorities", BRIDGE_AUTHORITY)
            provider.setAttribute("android:exported", "true")
            application.appendChild(provider)
        }

        // Anotar las acciones del usuario (guardar o quitar de la watchlist, marcar vista,
        // registrar) para que Bardo las repita en Plex. p0 = this, p1 = String, p2 = petición.
        listOf(
            MeWatchlistFingerprint to "onWatchlist",
            MeWatchFingerprint to "onWatch",
            FilmsUpdateRelationshipFingerprint to "onRelationship",
            LogEntriesCreateFingerprint to "onCreateLog",
        ).forEach { (fingerprint, hook) ->
            fingerprint.method.addInstructions(
                0,
                """
                    invoke-static/range { p1 .. p2 }, $BRIDGE_CLASS->$hook(Ljava/lang/String;Ljava/lang/Object;)V
                """,
            )
        }
    }
}
