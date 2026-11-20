package app.parchefacemoji.patches.facemoji.settings

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.parchefacemoji.patches.facemoji.shared.Constants.COMPATIBILITY_FACEMOJI
import app.parchefacemoji.patches.facemoji.shared.registroLibre
import com.android.tools.smali.dexlib2.Opcode
import java.util.logging.Logger

private val logger = Logger.getLogger("ParcheFacemoji")

/** Clase de la extension que anyade la fila a la pantalla de ajustes. */
private const val ENTRY_CLASS = "Lapp/parchefacemoji/extension/facemoji/settings/SettingsEntry;"

/** Clase de la pantalla de ajustes del parche. */
private const val SETTINGS_ACTIVITY = "app.parchefacemoji.extension.facemoji.settings.SettingsActivity"

/**
 * Pantalla de ajustes principal de Facemoji: la que se ve al abrir *Ajustes* (Idiomas, Entrada,
 * Estilo De Emoji, ...). Vive en una clase ofuscada, `Lef/n`, pero tambien es un
 * `android.preference.PreferenceFragment`. Se identifico en la 3.7.0 siguiendo a
 * `SettingsActivity`, que la instancia con la etiqueta "SettingsMainFragment".
 */
internal object SettingsMainOnResumeFingerprint : Fingerprint(
    definingClass = "Lef/n;",
    name = "onResume",
    returnType = "V",
)

/** Pantalla de ajustes avanzados de Facemoji, en `com/baidu/simeji/settings`. */
internal object SettingsAdvancedOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/settings/SettingsAdvancedFragment;",
    name = "onResume",
    returnType = "V",
)

/**
 * Pantalla de ajustes que se ve de verdad en la app: la construye `SettingFragment`, que en la
 * 3.7.0 es la clase ofuscada `Lcom/baidu/simeji/skins/v0`.
 *
 * No usa preferencias: monta un `RecyclerView` con filas del modelo `La9/b`, guardadas en un
 * `ArrayList`. El metodo `u2` (el `onViewCreated`) es donde se llena esa lista, asi que se
 * engancha justo donde termina, para meter nuestra fila la primera.
 */
internal object SettingsListBuildFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/skins/v0;",
    name = "u2",
    returnType = "V",
)

/** Manejador del toque de una fila de la pantalla de ajustes de la app (`SettingFragment.V2`). */
internal object SettingsListClickFingerprint : Fingerprint(
    definingClass = "Lcom/baidu/simeji/skins/v0;",
    name = "V2",
    returnType = "Lkotlin/Unit;",
)

/**
 * Anade la pantalla "Ajustes de Minecraco" y una entrada en los ajustes de la app.
 *
 * Los ajustes de Facemoji son un `android.preference.PreferenceFragment` clasico (se comprobo
 * en la 3.7.0: `SettingsAdvancedFragment` llama a `addPreferencesFromResource`). Por eso basta
 * con:
 *
 * 1. Declarar la actividad propia en el manifiesto, para poder abrirla.
 * 2. Inyectar una llamada al principio de `onResume()` que anada una `Preference` mas a la
 *    lista; al pulsarla se abre la actividad.
 *
 * La fila se anade desde la extension (no con smali suelto) para que sea tolerante a fallos:
 * si la app cambia esa pantalla, los ajustes se abren igual y solo se pierde la entrada.
 */
@Suppress("unused")
val settingsScreenPatch = patch(
    name = "Ajustes Minecraco",
    description = "Anade una pantalla \"Ajustes Minecraco\" para activar y desactivar los " +
            "parches de anuncios, VIP y rastreo sin volver a parchear. Se abre desde los ajustes " +
            "avanzados de Facemoji y tambien con su propio icono en el cajon de aplicaciones.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FACEMOJI)

    category("Ajustes")

    extendWith("extensions/facemoji.mpe")

    execute {
        // 1. Declarar la actividad en el manifiesto (idempotente: si ya esta, no se duplica).
        resourceXml("AndroidManifest.xml").use { manifiesto ->
            val yaEsta = manifiesto.elementByAttributeOrNull("android:name", SETTINGS_ACTIVITY)

            if (yaEsta == null) {
                val aplicacion = manifiesto.elements("application").first()

                aplicacion.appendChild("activity") {
                    setAttribute("android:name", SETTINGS_ACTIVITY)
                    // exportada + MAIN/LAUNCHER: asi la pantalla se abre tambien como icono
                    // propio en el cajon de aplicaciones. Es la via que no depende de como
                    // construya Facemoji su lista de ajustes, que cambia entre versiones.
                    setAttribute("android:exported", "true")
                    setAttribute("android:label", "Ajustes Minecraco")
                    setAttribute(
                        "android:theme",
                        "@android:style/Theme.DeviceDefault.Light.NoActionBar",
                    )
                    appendChild("intent-filter") {
                        appendChild("action") {
                            setAttribute("android:name", "android.intent.action.MAIN")
                        }
                        appendChild("category") {
                            setAttribute("android:name", "android.intent.category.LAUNCHER")
                        }
                    }
                }
            }
        }

        // 2. Anadir la fila a la lista de la pantalla de ajustes que se ve en la app.
        val lista = SettingsListBuildFingerprint.matchAllOrNull().orEmpty()
        val clics = SettingsListClickFingerprint.matchAllOrNull().orEmpty()

        lista.forEach { match ->
            val implementacion = match.method.implementation

            if (implementacion == null) {
                logger.warning("El metodo que construye la lista no tiene codigo; se omite")
            } else {
                val ultimoRetorno = implementacion.instructions.indexOfLast {
                    it.opcode == Opcode.RETURN_VOID
                }

                val indice = if (ultimoRetorno >= 0) {
                    ultimoRetorno
                } else {
                    implementacion.instructions.size
                }

                match.method.addInstructions(
                    indice,
                    """
                        invoke-static {p0}, $ENTRY_CLASS->agregarFilaEnLista(Ljava/lang/Object;)V
                    """,
                )

                logger.info("Fila anyadida a la lista de ajustes de la app")
            }
        }

        clics.forEach { match ->
            val original = match.originalMethod
            val registro = original.implementation?.registroLibre(original)

            if (registro == null) {
                logger.warning("El manejador de pulsaciones no tiene registros libres; se omite")
            } else {
                match.method.addInstructions(
                    0,
                    """
                        invoke-static {p2}, $ENTRY_CLASS->esNuestraFila(Ljava/lang/Object;)Z
                        move-result v$registro
                        if-eqz v$registro, :parche_facemoji_seguir
                        invoke-static {p1}, $ENTRY_CLASS->abrirDesde(Landroid/view/View;)V
                        sget-object v$registro, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                        return-object v$registro
                        :parche_facemoji_seguir
                    """,
                )

                logger.info("Pulsacion de la fila conectada con la pantalla de ajustes")
            }
        }

        // 3. Anadir la fila a las pantallas de ajustes con preferencias (via secundaria).
        val pantallas = linkedMapOf(
            "principal (SettingsMainFragment)" to SettingsMainOnResumeFingerprint,
            "avanzados (SettingsAdvancedFragment)" to SettingsAdvancedOnResumeFingerprint,
        ).mapValues { (_, huella) -> huella.matchAllOrNull().orEmpty() }

        val total = pantallas.values.sumOf { it.size }

        // Nunca se aborta: aunque no se encuentre la lista, la actividad del manifiesto queda
        // declarada y los ajustes siguen siendo accesibles con su propio icono.
        if (lista.isEmpty()) {
            logger.severe(
                "No se ha encontrado la lista de ajustes principal (SettingFragment). " +
                        "Queda el icono propio y la fila de los ajustes avanzados.",
            )
        }

        if (total == 0 && lista.isEmpty()) {
            logger.severe(
                "Esta version de Facemoji no se parece a la 3.7.0 analizada: ninguna pantalla de " +
                        "ajustes coincide. Abre una incidencia indicando la version exacta.",
            )
        }

        pantallas.forEach { (nombre, coincidencias) ->
            coincidencias.forEach { match ->
                match.method.addInstructions(
                    0,
                    """
                        invoke-static {p0}, $ENTRY_CLASS->agregarEntrada(Ljava/lang/Object;)V
                    """,
                )
            }
            logger.info("Entrada de ajustes anyadida en la pantalla $nombre")
        }

        logger.info("Actividad declarada: $SETTINGS_ACTIVITY")
    }
}
