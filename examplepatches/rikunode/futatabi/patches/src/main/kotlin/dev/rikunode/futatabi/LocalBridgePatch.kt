package dev.rikunode.futatabi

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * The initial ContentProvider runs before FlutterActivity and starts the
 * read-only loopback server. Clone app can execute in either order: the
 * provider authority is derived from the current manifest package, and the
 * runtime never relies on a hardcoded provider authority.
 */
private val bridgeManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw IllegalStateException("futatabi: application manifest element missing")
            val providerName = "dev.rikunode.futatabi.bridge.FutatabiProvider"
            val providers = manifest.getElementsByTagName("provider")
            if ((0 until providers.length).none {
                    (providers.item(it) as? Element)?.getAttribute("android:name") == providerName
                }
            ) {
                val provider = document.createElement("provider")
                provider.setAttribute("android:name", providerName)
                provider.setAttribute("android:authorities",
                    manifest.getAttribute("package") + ".futatabi.init")
                provider.setAttribute("android:exported", "false")
                provider.setAttribute("android:initOrder", "100")
                application.appendChild(provider)
            }
            val activityName = "dev.rikunode.futatabi.bridge.FutatabiHomeActivity"
            val activities = manifest.getElementsByTagName("activity")
            if ((0 until activities.length).none {
                    (activities.item(it) as? Element)?.getAttribute("android:name") == activityName
                }
            ) {
                val activity = document.createElement("activity")
                activity.setAttribute("android:name", activityName)
                activity.setAttribute("android:exported", "true")
                activity.setAttribute("android:label", "futatabi 投稿")
                val intentFilter = document.createElement("intent-filter")
                val action = document.createElement("action")
                action.setAttribute("android:name", "android.intent.action.MAIN")
                intentFilter.appendChild(action)
                val category = document.createElement("category")
                category.setAttribute("android:name", "android.intent.category.LAUNCHER")
                intentFilter.appendChild(category)
                activity.appendChild(intentFilter)
                application.appendChild(activity)
            }
            val mebukiLogin = "dev.rikunode.futatabi.bridge.MebukiLoginActivity"
            val matching = manifest.getElementsByTagName("activity")
            if ((0 until matching.length).none {
                    (matching.item(it) as? Element)?.getAttribute("android:name") == mebukiLogin
                }
            ) {
                val login = document.createElement("activity")
                login.setAttribute("android:name", mebukiLogin)
                login.setAttribute("android:exported", "false")
                login.setAttribute("android:label", "Mebuki login")
                application.appendChild(login)
            }
        }
    }
}

@Suppress("unused")
val bridgePatch = bytecodePatch(
    name = "Local board bridge",
    description = "Auto-register boards and run the local bridge with protected posting UI for Aimoge and Animanch.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "futatter",
            packageName = "com.Nanasaki.ftutter",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = "3.1.1", versionCode = 65)),
        )
    )
    dependsOn(bridgeManifestPatch)
    extendWith("extensions/futatter.mpe")
    execute {
        // The extension is merged before this block executes.
    }
}
