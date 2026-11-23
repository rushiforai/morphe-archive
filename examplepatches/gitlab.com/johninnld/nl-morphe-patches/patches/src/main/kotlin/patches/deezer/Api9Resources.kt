package patches.deezer

import org.w3c.dom.Element
import org.w3c.dom.Node
import patches.shared.CAR_APP_ANDROID_NS
import patches.shared.CarAppResources
import patches.shared.carPrepareAttribute
import patches.shared.carResourceDestination
import patches.shared.carRewriteDocumentReferences
import patches.shared.carRewriteReferences

internal const val AUTO_PREFIX = "morphe_deezer_auto_"
internal const val AUTO_ANDROID = CAR_APP_ANDROID_NS

internal fun api9ResourceDestination(path: String): String = carResourceDestination(AUTO_PREFIX, path)

internal fun api9PrepareAttribute(node: Element, names: Map<Pair<String, String>, String>) =
    carPrepareAttribute("Deezer", node, names)

internal fun api9RewriteReferences(text: String, names: Map<Pair<String, String>, String>): String =
    carRewriteReferences(text, names)

internal fun api9RewriteDocumentReferences(node: Node, names: Map<Pair<String, String>, String>) =
    carRewriteDocumentReferences(node, names)

/** Link the independently compiled library without replacing any of Deezer's resources. */
internal fun Api9Resources() = CarAppResources(
    label = "Deezer",
    prefix = AUTO_PREFIX,
    archive = "/deezer-auto/resources.zip",
    themeStyle = "${AUTO_PREFIX}DeezerCarTheme",
    themeColors = linkedMapOf("carColorPrimary" to "#FFA238FF", "carColorPrimaryDark" to "#FFA238FF",
        "carColorSecondary" to "#FFFFFFFF", "carColorSecondaryDark" to "#FFFFFFFF"),
)
