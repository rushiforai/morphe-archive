package app.morphe.patches.all.manifest.appicon

import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.adoptChild
import app.morphe.util.asSequence
import app.morphe.util.childElementsSequence
import app.morphe.util.getNode
import org.w3c.dom.Element
import java.util.logging.Logger

fun showAppIconPatch(
    launcher: Boolean = false,
    leanbackLauncher: Boolean = false,
) = resourcePatch {
    if (!launcher && !leanbackLauncher) return@resourcePatch

    execute {
        document("AndroidManifest.xml").use { document ->
            var changed = false

            val manifest = document.getNode("manifest") as Element
            val intentFilters = manifest.getElementsByTagName("intent-filter")
            for (node in intentFilters.asSequence().filterIsInstance<Element>()) {
                var hasMainAction = false
                var hasLauncher = false
                var hasLeanbackLauncher = false

                for (child in node.childElementsSequence()) {
                    when (child.tagName) {
                        "action" -> {
                            if (child.getAttribute("android:name") == "android.intent.action.MAIN") {
                                hasMainAction = true
                            }
                        }

                        "category" -> {
                            when (child.getAttribute("android:name")) {
                                "android.intent.category.LAUNCHER" -> {
                                    hasLauncher = true
                                }

                                "android.intent.category.LEANBACK_LAUNCHER" -> {
                                    hasLeanbackLauncher = true
                                }
                            }
                        }
                    }
                }

                if (hasMainAction) {
                    if (launcher && !hasLauncher) {
                        node.adoptChild("category") {
                            setAttribute("android:name", "android.intent.category.LAUNCHER")
                        }
                        changed = true
                    }

                    if (leanbackLauncher && !hasLeanbackLauncher) {
                        node.adoptChild("category") {
                            setAttribute(
                                "android:name",
                                "android.intent.category.LEANBACK_LAUNCHER",
                            )
                        }
                        changed = true
                    }
                }
            }

            if (!changed) {
                Logger
                    .getLogger(this::class.java.name)
                    .warning("No changes made: Did not find any launcher intent-filters to change.")
            }
        }
    }
}
