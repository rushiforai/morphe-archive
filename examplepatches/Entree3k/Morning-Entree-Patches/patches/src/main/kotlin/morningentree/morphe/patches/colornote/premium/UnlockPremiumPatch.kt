package morningentree.morphe.patches.colornote.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import morningentree.morphe.patches.colornote.shared.Constants
import morningentree.morphe.util.returnEarly
import org.w3c.dom.Element

private val adPermissions = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

private val stripAdIdPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val permissionNodes = document.getElementsByTagName("uses-permission")
            for (index in permissionNodes.length - 1 downTo 0) {
                val node = permissionNodes.item(index) as Element
                if (node.getAttribute("android:name") in adPermissions) {
                    manifest.removeChild(node)
                }
            }
        }
    }
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks Premium",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(stripAdIdPatch)

    execute {
        IsPremiumFingerprint.method.returnEarly(true)
    }
}
