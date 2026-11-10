// recon 2026-11-09
package app.template.patches.ivy.offline

import app.morphe.patcher.patch.resourcePatch
import app.template.patches.ivy.ads.ivyAdsPatch
import app.template.patches.ivy.telemetry.ivyTelemetryPatch
import app.template.patches.shared.Constants.IVY_COMPATIBILITY
import org.w3c.dom.Element

@Suppress("unused")
val ivyRemoveInternetPermissionPatch = resourcePatch(
 name = "Remove INTERNET permission",
 description = "Strips the INTERNET permission and disables Ivy's ads, telemetry, Firebase and RSS network paths so the app starts fully offline instead of crashing.",
 default = true,
) {
 compatibleWith(IVY_COMPATIBILITY)

 dependsOn(ivyAdsPatch, ivyTelemetryPatch, ivyOfflinePatch)

 execute {
  var removed = 0

  document("AndroidManifest.xml").use { doc ->
   val manifest = doc.getElementsByTagName("manifest").item(0)
   val children = manifest.childNodes
   val toRemove = mutableListOf<Element>()

   for (i in 0 until children.length) {
    val node = children.item(i) as? Element ?: continue

    if (node.tagName == "uses-permission" &&
     node.getAttribute("android:name") == "android.permission.INTERNET"
    ) {
     toRemove.add(node)
    }
   }

   toRemove.forEach { manifest.removeChild(it) }
   removed = toRemove.size
  }

  println("[Remove INTERNET permission] Stripped $removed INTERNET declaration(s).")
 }
}
