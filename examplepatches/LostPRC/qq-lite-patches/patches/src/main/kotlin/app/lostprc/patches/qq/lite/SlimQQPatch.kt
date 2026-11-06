package app.lostprc.patches.qq.lite

import app.lostprc.patches.shared.Constants.COMPATIBILITY_QQ
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.util.logging.Logger

private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

@Suppress("unused")
val slimQQPatch = resourcePatch(
    name = "Slim QQ",
    description = "Reproduces the QQ Lite build: removes game center / mini games, Super QQ Show (ZPlan, UE4, " +
        "Filament), crash/monitoring native libraries and other bundled extras, " +
        "together with their AndroidManifest components.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_QQ)

    val removeGameCenter by booleanOption(
        key = "removeGameCenter",
        default = true,
        title = "Remove game center",
        description = "Game center, cloud games, mini games and game widgets.",
    )
    val removeZPlan by booleanOption(
        key = "removeZPlan",
        default = true,
        title = "Remove Super QQ Show",
        description = "ZPlan / Zootopia / CMShow 3D avatars with the UE4, Filament and Wwise engines.",
    )
    val removeTelemetry by booleanOption(
        key = "removeTelemetry",
        default = true,
        title = "Remove telemetry libraries",
        description = "Bugly, Matrix, RMonitor, Beacon, QIMEI and WeChat crash native libraries.",
    )
    val removeMisc by booleanOption(
        key = "removeMisc",
        default = true,
        title = "Remove miscellaneous extras",
        description = "VIP ad guide, bundled plugin APKs, payment SDK archive and festival red-packet assets.",
    )

    execute {
        val logger = Logger.getLogger("SlimQQ")

        val groups = buildList {
            if (removeGameCenter == true) add(GAME_CENTER)
            if (removeZPlan == true) add(ZPLAN)
            if (removeTelemetry == true) add(TELEMETRY)
            if (removeMisc == true) add(MISC)
        }
        if (groups.isEmpty()) return@execute

        // region Files

        val existing = listApkEntries().toSet()
        var deletedFiles = 0
        groups.flatMap { it.apkEntries }.forEach { entry ->
            val present = if (entry.endsWith("/")) {
                existing.any { it.startsWith(entry) }
            } else {
                entry in existing
            }
            if (present) {
                delete(entry)
                deletedFiles++
            } else {
                logger.fine("Not present, skipping: $entry")
            }
        }

        // endregion

        // region Manifest

        val componentNames = groups.flatMapTo(HashSet()) { it.manifestComponents }
        var removedComponents = 0

        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val children = application.childNodes
            val toRemove = (0 until children.length)
                .map(children::item)
                .filterIsInstance<Element>()
                .filter { element ->
                    val name = element.getAttributeNS(ANDROID_NS, "name")
                        .ifEmpty { element.getAttribute("android:name") }
                    name in componentNames
                }

            toRemove.forEach { element ->
                // Drop the indentation text node too, so the manifest stays tidy.
                element.previousSibling?.takeIf { it.nodeType == Node.TEXT_NODE && it.textContent.isBlank() }
                    ?.let(application::removeChild)
                application.removeChild(element)
            }
            removedComponents = toRemove.size
        }

        // endregion

        logger.info("Slim QQ: deleted $deletedFiles APK entries/directories and $removedComponents manifest components")
    }
}
