package app.fblite.patches.coexist

import app.fblite.patches.shared.Constants.COMPATIBILITY_FACEBOOK_LITE
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Attr
import org.w3c.dom.Element

/**
 * Permissions Facebook Lite declares at signature level that Facebook, Messenger and other Meta
 * apps declare too. Android lets only one signing key own a permission name, so a re-signed Lite
 * fails with INSTALL_FAILED_DUPLICATE_PERMISSION when one of those apps is installed.
 *
 * The only code that names one of them registers a config-override receiver guarded by
 * FB_APP_COMMUNICATION, which other Meta apps send to, so renaming the manifest is enough.
 */
private val SHARED_PERMISSIONS = listOf(
    "com.facebook.permission.prod.FB_APP_COMMUNICATION",
    "com.facebook.receiver.permission.ACCESS",
)

private const val FACEBOOK_PREFIX = "com.facebook."
private const val RENAMED_PREFIX = "app.morphefblite."

private fun renamed(name: String) = RENAMED_PREFIX + name.removePrefix(FACEBOOK_PREFIX)

private val renameSharedPermissionsPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            var declared = 0
            val elements = document.getElementsByTagName("*")
            for (index in 0 until elements.length) {
                val element = elements.item(index) as? Element ?: continue
                val attributes = element.attributes
                for (at in 0 until attributes.length) {
                    val attribute = attributes.item(at) as? Attr ?: continue
                    if (attribute.value !in SHARED_PERMISSIONS) continue
                    if (element.tagName == "permission") declared++
                    attribute.value = renamed(attribute.value)
                }
            }
            if (declared == 0) throw PatchException("No shared permission declaration found in the manifest")
        }
    }
}

@Suppress("unused")
val installBesideMetaAppsPatch = bytecodePatch(
    name = "Install beside Meta's apps",
    description = "Lets the patched app install while Facebook, Messenger or other Meta apps are installed, " +
        "by renaming the permissions it shares with them.",
    default = true
) {
    compatibleWith(COMPATIBILITY_FACEBOOK_LITE)

    dependsOn(renameSharedPermissionsPatch)
}
