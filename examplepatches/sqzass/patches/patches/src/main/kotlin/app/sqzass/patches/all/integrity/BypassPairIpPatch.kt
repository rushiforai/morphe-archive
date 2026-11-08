package app.sqzass.patches.all.integrity

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.sqzass.patches.shared.removeElements
import java.util.logging.Logger
import org.w3c.dom.Element

private val logger = Logger.getLogger("BypassPairIpPatch")

private const val STUB_TYPE = "Lcom/pairip/application/Application;"
private const val STUB_NAME = "com.pairip.application.Application"
private const val PAIRIP_LIB = "libpairipcore.so"

// Set by the internal bytecode patch before the resource patch runs (dependencies
// execute first): the stub's superclass, which is the application class the
// protection wrapped (android.app.Application when the app had none of its own).
private var originalApplicationClass: String? = null

// Internal patch that is not shown in Morphe Manager or the CLI patch list.
// It only reads the PairIP stub class; all mutations happen in the parent patch.
// ponytail: PairIP classes in dex cannot be deleted through the patch API and
// remain as dead code once nothing references them.
@Suppress("unused")
private val bypassPairIpInternalPatch = bytecodePatch {
    execute {
        originalApplicationClass = null
        classDefForEach { classDef ->
            if (classDef.type == STUB_TYPE) {
                originalApplicationClass = classDef.superclass
                logger.info("PairIP stub found; wrapped application superclass: ${classDef.superclass}")
            }
        }
    }
}

@Suppress("unused")
val bypassPairIpPatch = resourcePatch(
    name = "Bypass PairIP protection",
    description = "Defeats Google Play's PairIP guard: restores the original application class so the protection gate never starts, deletes libpairipcore.so, and strips PairIP components.",
    default = false,
) {
    category("Integrity")

    val restoreApplicationOption = booleanOption(
        key = "restoreApplicationClass",
        default = true,
        title = "Restore Application Class",
        description = "Point android:application back at the class PairIP wrapped, based on the stub's superclass.",
    )
    val deleteNativeCoreOption = booleanOption(
        key = "deleteNativeCore",
        default = true,
        title = "Delete Native Core",
        description = "Remove libpairipcore.so from every ABI so the guard cannot run even if something loads it.",
    )
    val stripComponentsOption = booleanOption(
        key = "stripPairIpComponents",
        default = true,
        title = "Strip PairIP Components",
        description = "Remove com.pairip activities, services, receivers, providers, and instrumentations from the manifest.",
    )

    dependsOn(bypassPairIpInternalPatch)

    execute {
        if (restoreApplicationOption.value != true &&
            deleteNativeCoreOption.value != true &&
            stripComponentsOption.value != true
        ) {
            logger.info("All options disabled.")
            return@execute
        }

        var protectedApp = false
        document("AndroidManifest.xml").use { document ->
            val appNodes = document.getElementsByTagName("application")
            val appElement = appNodes.item(0) as? Element
            if (appElement != null && appElement.getAttribute("android:name") == STUB_NAME) {
                protectedApp = true

                if (restoreApplicationOption.value == true) {
                    val original = originalApplicationClass
                    if (original == null || original == "Landroid/app/Application;") {
                        // The app had no custom application class of its own.
                        appElement.removeAttribute("android:name")
                    } else {
                        appElement.setAttribute(
                            "android:name",
                            original.removePrefix("L").removeSuffix(";").replace('/', '.'),
                        )
                    }
                    logger.info("Restored application class: ${original ?: "android.app.Application (stub superclass unreadable)"}")
                }
            }

            if (stripComponentsOption.value == true) {
                val components = removeElements(
                    document,
                    listOf("activity", "activity-alias", "service", "provider", "receiver", "instrumentation"),
                ) { element ->
                    element.getAttribute("android:name").startsWith("com.pairip.")
                }
                if (components.isNotEmpty()) {
                    logger.info("Removed PairIP components: $components")
                }
            }
        }

        if (deleteNativeCoreOption.value == true) {
            val libs = listApkEntries("lib/").filter {
                it.substringAfterLast('/') == PAIRIP_LIB
            }
            for (path in libs) {
                delete(path)
            }
            if (libs.isNotEmpty()) {
                logger.info("Deleted $PAIRIP_LIB from ${libs.size} ABI directories.")
            }
        }

        if (!protectedApp && originalApplicationClass == null) {
            logger.info("No PairIP stub declared in the manifest; nothing to restore.")
        }
    }
}