package app.mitrosoft.patches.bergfex

import app.morphe.patcher.patch.resourcePatch
import app.mitrosoft.patches.shared.Constants.COMPATIBILITY_BERGFEX
import org.w3c.dom.Element

private const val DISABLED_PREFIX = "disabled_"

private val adIdPermissions = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
)

@Suppress("unused")
val disableAdIdPatch = resourcePatch(
    name = "Disable advertising ID",
    description = "Disables the AD_ID and ACCESS_ADSERVICES permissions in AndroidManifest.xml so SDKs cannot read the advertising ID.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BERGFEX)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val permissions = manifest.getElementsByTagName("uses-permission")
            for (i in 0 until permissions.length) {
                val element = permissions.item(i) as Element
                val name = element.getAttribute("android:name")
                if (name in adIdPermissions) element.setAttribute("android:name", DISABLED_PREFIX + name)
            }
        }
    }
}
