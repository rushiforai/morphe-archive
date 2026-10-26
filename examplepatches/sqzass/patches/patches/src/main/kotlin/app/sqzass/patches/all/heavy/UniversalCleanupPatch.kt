package app.sqzass.patches.all.heavy

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.sqzass.patches.shared.TrackerPrefixes
import app.sqzass.patches.shared.collectElements
import app.sqzass.patches.shared.removeElements
import java.util.logging.Logger

private val logger = Logger.getLogger("UniversalCleanupPatch")

private val DEBUG_COMPONENT_MARKERS = setOf(".debug.", ".staging.", ".test.", "leakcanary", "stetho", "chucker")

private val keepLocalesOption = stringOption(
    key = "keepLocales",
    default = "en",
    title = "Keep Locales",
    description = "Comma-separated locale qualifiers to keep; other locale resource directories are deleted.",
    validator = { true },
)
private val stripGmsOption = booleanOption(
    key = "stripGmsComponents",
    default = false,
    title = "Strip GMS Components",
    description = "Remove Google and Firebase service, receiver, and provider components.",
)
private val stripDebugOption = booleanOption(
    key = "stripDebugComponents",
    default = true,
    title = "Strip Debug Components",
    description = "Remove debug, staging, and test components plus LeakCanary, Stetho, and Chucker.",
)
private val stripLocalesOption = booleanOption(
    key = "stripExtraLocales",
    default = false,
    title = "Strip Extra Locales",
    description = "Delete locale resource directories not on the keep list.",
)

// ponytail: unused-component detection via dex reference scan, ABI/density
// splits, and large-asset removal are not covered — no patch API lists dex
// references or rewrites binary resource tables.
@Suppress("unused")
val universalCleanupPatch = resourcePatch(
    name = "Universal cleanup",
    description = "Debloats the app: removes debug and tracking components, extra locales, and stale install files. ABI splits, density filtering, and asset size filtering are not covered.",
    default = false,
) {
    category("Heavy")

    stripDebugOption()
    stripGmsOption()
    stripLocalesOption()
    keepLocalesOption()

    execute {
        var components = 0

        document("AndroidManifest.xml").use { document ->
            if (stripDebugOption.value == true) {
                val removed = removeElements(
                    document,
                    listOf("activity", "activity-alias", "service", "receiver", "provider"),
                ) { element ->
                    val name = element.getAttribute("android:name").lowercase()
                    DEBUG_COMPONENT_MARKERS.any { it in name }
                }
                components += removed.size
            }

            if (stripGmsOption.value == true) {
                val removed = removeElements(
                    document,
                    listOf("service", "receiver", "provider", "activity"),
                ) { element ->
                    TrackerPrefixes.matchesAny(element.getAttribute("android:name"), TrackerPrefixes.GOOGLE)
                }
                components += removed.size
            }
        }

        var locales = 0
        if (stripLocalesOption.value == true) {
            val keep = keepLocalesOption.value
                ?.split(",")
                ?.map { it.trim().lowercase().removePrefix("-") }
                ?.filter { it.isNotEmpty() }
                ?.toSet()
                .orEmpty() + "en"

            fun isLocaleQualifier(qualifier: String): Boolean =
                qualifier.startsWith("b+", ignoreCase = true) ||
                    Regex("^[a-zA-Z]{2,3}(-r[a-zA-Z]{2})?$").matches(qualifier)

            fun localeOf(qualifier: String): String =
                if (qualifier.startsWith("b+", ignoreCase = true)) {
                    qualifier.substring(2).substringBefore('+').lowercase()
                } else {
                    qualifier.substringBefore('-').lowercase()
                }

            val resDir = get("res")
            if (resDir.exists()) {
                resDir.listFiles { f -> f.isDirectory }?.forEach { dir ->
                    if (dir.name.startsWith("values-")) {
                        val qualifier = dir.name.removePrefix("values-")
                        if (isLocaleQualifier(qualifier) && localeOf(qualifier) !in keep) {
                            delete("res/${dir.name}")
                            locales++
                        }
                    }
                }
            }

            val entries = listApkEntries("res/").filter { entry ->
                val segment = entry.removePrefix("res/").substringBefore('/')
                val qualifier = segment.substringAfter('-', "")
                qualifier.isNotEmpty() && isLocaleQualifier(qualifier) && localeOf(qualifier) !in keep
            }
            for (path in entries) {
                delete(path)
                locales++
            }
        }

        // META-INF v1 signature leftovers are stale once re-signed.
        val metaLeftovers = listApkEntries("META-INF/").filter {
            it.endsWith(".SF") || it.endsWith(".RSA") || it.endsWith(".DSA") || it.endsWith(".EC")
        }
        for (path in metaLeftovers) {
            delete(path)
        }

        logger.info("Removed $components components, $locales locale entries, ${metaLeftovers.size} signature leftovers.")
    }
}
