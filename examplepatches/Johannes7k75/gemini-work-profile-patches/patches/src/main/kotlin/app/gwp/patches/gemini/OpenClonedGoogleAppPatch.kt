package app.gwp.patches.gemini

import app.gwp.patches.shared.Constants.COMPATIBILITY_GEMINI
import app.gwp.patches.shared.Constants.GOOGLE_CLONE_PACKAGE
import app.gwp.patches.shared.Constants.GOOGLE_PACKAGE
import app.gwp.patches.shared.clonePackagePatch
import app.gwp.patches.shared.replaceStringConstants
import app.gwp.patches.shared.standaloneInstallPatch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.patch
import org.w3c.dom.Element
import java.util.logging.Logger

/**
 * The Gemini app is a thin launcher: the assistant UI lives in the Google app. The clone has to open the
 * cloned Google app ("Google (Morphe)"), which signs in with microG and works in work profiles.
 */
@Suppress("unused")
val openClonedGoogleAppPatch = patch(
    name = "Open cloned Google app",
    description = "Installs Gemini as a separate clone that opens the patched Google app " +
        "(patch the Google app with this bundle too).",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GEMINI)
    dependsOn(clonePackagePatch, standaloneInstallPatch)

    execute {
        val replaced = replaceStringConstants(GOOGLE_PACKAGE, GOOGLE_CLONE_PACKAGE)
        if (replaced == 0) throw PatchException("No reference to the Google app found")
        Logger.getLogger("OpenClonedGoogleAppPatch").info("Redirected $replaced references to $GOOGLE_CLONE_PACKAGE")

        document("AndroidManifest.xml").use { document ->
            (document.getElementsByTagName("application").item(0) as Element).setAttribute("android:label", "Gemini (Morphe)")
            listOf("activity", "activity-alias").forEach { tag ->
                val nodes = document.getElementsByTagName(tag)
                for (i in 0 until nodes.length) {
                    val node = nodes.item(i) as Element
                    if (node.hasAttribute("android:label")) node.setAttribute("android:label", "Gemini (Morphe)")
                }
            }
        }
    }
}
