package app.belkart.patches.wallet

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

internal const val WALLET_SERVICE_CLASS =
    "app.belkart.extension.wallet.BelkartQuickAccessWalletService"

private const val WALLET_CONFIG_NAME = "belkart_quick_access_wallet"
private const val WALLET_TILE_ICON_NAME = "belkart_wallet_tile"

private const val ACTION_MAIN = "android.intent.action.MAIN"
private const val CATEGORY_LAUNCHER = "android.intent.category.LAUNCHER"

/**
 * Registers a QuickAccessWalletService in the manifest and adds the wallet
 * configuration xml + a monochrome tile icon.
 *
 * This is what SystemUI looks for in the default wallet / NFC payment app to enable
 * the Quick Settings wallet tile, the lock screen wallet shortcut, and the
 * power button / gesture wallet launch.
 */
internal val quickAccessWalletResourcePatch = resourcePatch(
    description = "Registers the Quick Access Wallet service in the app manifest."
) {
    execute {
        fun enableScreenOffPayments() {
            val resDir = get("res")
            if (!resDir.exists()) return

            resDir.walkTopDown()
                .filter { it.isFile && it.extension == "xml" }
                .forEach { file ->
                    val source = file.readText()
                    val root = Regex("""<host-apdu-service\b[^>]*>""").find(source)
                        ?: return@forEach
                    if (root.value.contains("android:requireDeviceScreenOn")) return@forEach

                    val replacement = root.value.dropLast(1) +
                        " android:requireDeviceScreenOn=\"false\">"
                    file.writeText(source.replaceRange(root.range, replacement))
                }
        }

        var launcherActivity = ""

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val packageName = manifest.getAttribute("package")
            val application = document.getElementsByTagName("application").item(0) as Element

            launcherActivity = findLauncherActivity(application, packageName)
                ?: error("Could not find the launcher activity in AndroidManifest.xml")

            // Idempotency: do not add the service twice.
            if (application.childElements("service").any {
                    it.getAttribute("android:name") == WALLET_SERVICE_CLASS
                }
            ) return@use

            val appLabel = application.getAttribute("android:label")
            val appIcon = application.getAttribute("android:icon")

            val service = document.createElement("service").apply {
                setAttribute("android:name", WALLET_SERVICE_CLASS)
                setAttribute("android:exported", "true")
                setAttribute(
                    "android:permission",
                    "android.permission.BIND_QUICK_ACCESS_WALLET_SERVICE"
                )
                if (appLabel.isNotEmpty()) setAttribute("android:label", appLabel)
                setAttribute("android:icon", "@drawable/$WALLET_TILE_ICON_NAME")
                if (appIcon.isNotEmpty()) setAttribute("android:logo", appIcon)
            }

            val intentFilter = document.createElement("intent-filter")
            intentFilter.appendChild(document.createElement("action").apply {
                setAttribute(
                    "android:name",
                    "android.service.quickaccesswallet.QuickAccessWalletService"
                )
            })
            intentFilter.appendChild(document.createElement("category").apply {
                setAttribute("android:name", "android.intent.category.DEFAULT")
            })
            service.appendChild(intentFilter)

            service.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", "android.quickaccesswallet")
                setAttribute("android:resource", "@xml/$WALLET_CONFIG_NAME")
            })
            service.appendChild(document.createElement("meta-data").apply {
                setAttribute("android:name", "android.quickaccesswallet.tile")
                setAttribute("android:resource", "@drawable/$WALLET_TILE_ICON_NAME")
            })

            application.appendChild(service)
        }

        // Android 12+ can activate the existing HCE payment service while the screen is off.
        // Patch the app's own host-apdu-service declaration, rather than adding a second NFC
        // payment service that could steal the Belkart AIDs.
        enableScreenOffPayments()

        get("res/xml").apply { mkdirs() }.resolve("$WALLET_CONFIG_NAME.xml").writeText(
            """<?xml version="1.0" encoding="utf-8"?>
<quickaccesswallet-service xmlns:android="http://schemas.android.com/apk/res/android"
    android:settingsActivity="$launcherActivity"
    android:targetActivity="$launcherActivity"
    android:shortcutShortLabel="Белкарт Pay"
    android:shortcutLongLabel="Оплатить через Белкарт Pay" />
"""
        )

        // Material "account_balance_wallet" icon, monochrome so SystemUI can tint it.
        get("res/drawable").apply { mkdirs() }.resolve("$WALLET_TILE_ICON_NAME.xml").writeText(
            """<?xml version="1.0" encoding="utf-8"?>
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="24dp"
    android:height="24dp"
    android:viewportWidth="24"
    android:viewportHeight="24">
    <path
        android:fillColor="#FFFFFFFF"
        android:pathData="M21,18v1c0,1.1 -0.9,2 -2,2H5c-1.11,0 -2,-0.9 -2,-2V5c0,-1.11 0.89,-2 2,-2h14c1.1,0 2,0.9 2,2v1h-9c-1.11,0 -2,0.9 -2,2v8c0,1.1 0.89,2 2,2h9zM12,16h10V8H12v8zM16,13.5c-0.83,0 -1.5,-0.67 -1.5,-1.5s0.67,-1.5 1.5,-1.5 1.5,0.67 1.5,1.5 -0.67,1.5 -1.5,1.5z" />
</vector>
"""
        )
    }
}

private fun Element.childElements(tag: String): List<Element> {
    val result = mutableListOf<Element>()
    val nodes = childNodes
    for (i in 0 until nodes.length) {
        val node = nodes.item(i)
        if (node is Element && node.tagName == tag) result += node
    }
    return result
}

private fun findLauncherActivity(application: Element, packageName: String): String? {
    val nodes = application.childNodes
    for (i in 0 until nodes.length) {
        val component = nodes.item(i) as? Element ?: continue
        if (component.tagName != "activity" && component.tagName != "activity-alias") continue
        if (component.getAttribute("android:enabled") == "false") continue

        val isLauncher = component.childElements("intent-filter").any { filter ->
            filter.childElements("action").any { it.getAttribute("android:name") == ACTION_MAIN } &&
                filter.childElements("category").any { it.getAttribute("android:name") == CATEGORY_LAUNCHER }
        }
        if (isLauncher) return resolveClassName(component.getAttribute("android:name"), packageName)
    }
    return null
}

private fun resolveClassName(name: String, packageName: String) = when {
    name.startsWith(".") -> packageName + name
    !name.contains('.') -> "$packageName.$name"
    else -> name
}
