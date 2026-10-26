/**
 * Universal "Enable debugging" patch.
 *
 * Sets android:debuggable="true" on <application> so the patched (resigned) build can be
 * debugged: attach a JDWP debugger, `run-as` to inspect app files, richer logs.
 *
 * Universal: no compatibleWith(), offered for every app.
 * Note: debuggable builds can influence anti-debug / Play Integrity checks in some apps.
 */

package app.cavla.patches.all.manifest.debug

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

@Suppress("unused")
val enableDebugPatch = resourcePatch(
    name = "Enable debugging",
    description = "Enables Android debugging (android:debuggable=\"true\") for the patched build.",
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            (document.getElementsByTagName("application").item(0) as Element)
                .setAttribute("android:debuggable", "true")
        }
    }
}
