package app.sadmod.patches.happymod

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.deleteResource
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceContext
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption
import app.sadmod.patches.shared.Constants.COMPATIBILITY_HAPPYMOD
import org.w3c.dom.Element
import org.w3c.dom.Node

private const val DEFAULT_PATCHED_PACKAGE = "app.sadmod.patched"
private val PACKAGE_NAME_REGEX = Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$")

@Suppress("unused")
val sadModOverhaulPatch = patch(
    name = "SadMod Material 3 overhaul",
    description = "Replaces the ad-supported UI and packer runtime with a clean Material 3 Expressive client featuring Quad9 DoH, Tor/SOCKS5 proxy routing, a pre-install APK security scanner, and an on-device permission editor.",
    default = true
) {
    category("UI, Privacy & Security")
    compatibleWith(COMPATIBILITY_HAPPYMOD)

    extendWith("extensions/sadmod.mpe")

    val appNameOption = stringOption(
        key = "appName",
        default = "SadMod",
        values = mapOf(
            "SadMod (Default)" to "SadMod",
            "HappyMod" to "HappyMod"
        ),
        title = "App name",
        description = "Launcher display name for the patched app.",
        required = true
    ) { value ->
        !value.isNullOrBlank() && value.trim().length <= 40
    }

    val packageNameOption = stringOption(
        key = "packageName",
        default = DEFAULT_PATCHED_PACKAGE,
        values = mapOf(
            "SadMod (Default)" to DEFAULT_PATCHED_PACKAGE,
            "Original" to "com.happymod.apk"
        ),
        title = "Package name",
        description = "Package name for the patched app. Default 'app.sadmod.patched' allows side-by-side installation and avoids legacy package blocks.",
        required = true
    ) { value ->
        value != null && PACKAGE_NAME_REGEX.matches(value)
    }

    execute {
        @Suppress("DEPRECATION")
        val resContext = resourceContext
        val targetVersion = packageMetadata.versionName ?: "3.4.5"
        val effectiveAppName = appNameOption.value?.trim()?.takeIf { it.isNotEmpty() } ?: "SadMod"
        val effectivePackage = packageNameOption.value?.takeIf { it.isNotBlank() } ?: DEFAULT_PATCHED_PACKAGE

        val libEntries = listApkEntries("lib/")
        val cstampEntries = libEntries.filter { it.endsWith("/libCSTAMP.so") }
        if (cstampEntries.isEmpty()) {
            throw PatchException("Target APK does not contain expected native library libCSTAMP.so.")
        }

        // 1. Dynamically extract protocol parameters from the user's own APK.
        val bridge = BridgeExtractor.extract(resContext, cstampEntries, targetVersion)
        writeResourceBytes("assets/sadmod_bridge.json", bridge.toJson().toByteArray(Charsets.UTF_8))

        // 2. Inject SadMod's isolated Compose/Material3 resources, local permission signer, and native helper.
        copyBundledAsset("sadmod/sadmod_res.apk", "assets/sadmod_res.apk")
        copyBundledAsset("sadmod/patch_signer.pk8", "assets/patch_signer.pk8")
        copyBundledAsset("sadmod/patch_signer.der", "assets/patch_signer.der")

        val presentAbis = libEntries
            .mapNotNull { path ->
                val parts = path.split('/')
                if (parts.size >= 3) parts[1] else null
            }
            .distinct()
            .ifEmpty { listOf("arm64-v8a", "armeabi-v7a") }

        for (abi in presentAbis) {
            val bundledLib = "sadmod/lib/$abi/libandroidx.graphics.path.so"
            if (SadModOverhaulPatchAnchor::class.java.classLoader.getResource(bundledLib) != null) {
                copyBundledAsset(bundledLib, "lib/$abi/libandroidx.graphics.path.so")
            }
        }

        // 3. Remove packer, ad/game scripts, and heavy legacy torrent libraries.
        val libsToDelete = libEntries.filter { entry ->
            val fileName = entry.substringAfterLast('/')
            fileName.startsWith("libSecShell") ||
                fileName == "libHappymodPrincess.so" ||
                fileName.startsWith("libjlibtorrent") ||
                fileName == "libCSTAMP.so"
        }
        val deprecatedAssets = setOf(
            "assets/happygame.js",
            "assets/demo.html",
            "assets/slow.html",
            "assets/filedownloader.properties",
            "assets/rv_binddatas.xml"
        )
        val assetsToDelete = listApkEntries("assets/").filter { entry ->
            entry in deprecatedAssets || entry.startsWith("assets/meta-data/")
        }
        for (entry in libsToDelete + assetsToDelete) {
            deleteResource(entry)
        }

        // 4. Rewrite AndroidManifest.xml with SDK 35 targets, custom package name, and minimal permissions.
        document("AndroidManifest.xml").use { doc ->
            val manifestEl = doc.documentElement
            manifestEl.setAttribute("package", effectivePackage)
            manifestEl.setAttribute("android:compileSdkVersion", "35")
            manifestEl.setAttribute("android:compileSdkVersionCodename", "15")
            manifestEl.setAttribute("platformBuildVersionCode", "35")
            manifestEl.setAttribute("platformBuildVersionName", "15")

            removeChildElements(manifestEl, setOf("uses-permission", "uses-permission-sdk-23", "permission", "queries"))

            val appEl = findFirstChildElement(manifestEl, "application")
                ?: throw PatchException("Invalid AndroidManifest.xml: missing <application> element")

            val usesSdkEl = findFirstChildElement(manifestEl, "uses-sdk")
                ?: doc.createElement("uses-sdk").also { manifestEl.insertBefore(it, appEl) }
            usesSdkEl.setAttribute("android:minSdkVersion", "26")
            usesSdkEl.setAttribute("android:targetSdkVersion", "35")

            val requiredPerms = listOf(
                "android.permission.INTERNET",
                "android.permission.ACCESS_NETWORK_STATE",
                "android.permission.REQUEST_INSTALL_PACKAGES"
            )
            for (perm in requiredPerms) {
                val permEl = doc.createElement("uses-permission")
                permEl.setAttribute("android:name", perm)
                manifestEl.insertBefore(permEl, appEl)
            }

            appEl.setAttribute("android:name", "app.sadmod.client.SadModApp")
            appEl.setAttribute("android:label", effectiveAppName)
            appEl.setAttribute("android:theme", "@android:style/Theme.Material.Light.NoActionBar")
            appEl.setAttribute("android:usesCleartextTraffic", "true")
            appEl.setAttribute("android:enableOnBackInvokedCallback", "true")

            listOf(
                "android:appComponentFactory",
                "android:networkSecurityConfig",
                "android:requestLegacyExternalStorage",
                "android:preserveLegacyExternalStorage"
            ).forEach { attr ->
                if (appEl.hasAttribute(attr)) {
                    appEl.removeAttribute(attr)
                }
            }

            removeChildElements(
                appEl,
                setOf("activity", "activity-alias", "service", "receiver", "provider", "meta-data")
            )

            val mainActivity = doc.createElement("activity").apply {
                setAttribute("android:name", "app.sadmod.client.MainActivity")
                setAttribute("android:exported", "true")
                setAttribute("android:theme", "@android:style/Theme.Material.Light.NoActionBar")
                setAttribute("android:windowSoftInputMode", "adjustResize")
                setAttribute(
                    "android:configChanges",
                    "orientation|screenSize|screenLayout|keyboardHidden|uiMode|locale|layoutDirection"
                )
            }
            val intentFilter = doc.createElement("intent-filter")
            intentFilter.appendChild(doc.createElement("action").apply {
                setAttribute("android:name", "android.intent.action.MAIN")
            })
            intentFilter.appendChild(doc.createElement("category").apply {
                setAttribute("android:name", "android.intent.category.LAUNCHER")
            })
            mainActivity.appendChild(intentFilter)
            appEl.appendChild(mainActivity)

            val apkProvider = doc.createElement("provider").apply {
                setAttribute("android:name", "app.sadmod.client.data.download.SadModApkProvider")
                setAttribute("android:authorities", "$effectivePackage.sadmod.apkprovider")
                setAttribute("android:exported", "false")
                setAttribute("android:grantUriPermissions", "true")
            }
            appEl.appendChild(apkProvider)
        }

        // Ensure package attribute on compiled binary AndroidManifest matches effectivePackage cleanly.
        resourceXml("AndroidManifest.xml").use { xml ->
            xml.root.setAttribute("package", effectivePackage)
        }
    }
}

private object SadModOverhaulPatchAnchor

private fun writeResourceBytes(destPath: String, bytes: ByteArray) {
    val targetFile = resourceFile(destPath, false)
    targetFile.parentFile?.mkdirs()
    targetFile.writeBytes(bytes)
}

private fun copyBundledAsset(bundledPath: String, destPath: String) {
    val cl = SadModOverhaulPatchAnchor::class.java.classLoader
    val bytes = cl.getResourceAsStream(bundledPath)?.use { it.readBytes() }
        ?: throw PatchException("Missing bundled patch resource: $bundledPath")
    writeResourceBytes(destPath, bytes)
}

private fun findFirstChildElement(parent: Element, tagName: String): Element? {
    val children = parent.childNodes
    for (i in 0 until children.length) {
        val node = children.item(i)
        if (node.nodeType == Node.ELEMENT_NODE && node.nodeName == tagName) {
            return node as Element
        }
    }
    return null
}

private fun removeChildElements(parent: Element, tags: Set<String>) {
    val toRemove = mutableListOf<Node>()
    val children = parent.childNodes
    for (i in 0 until children.length) {
        val node = children.item(i)
        if (node.nodeType == Node.ELEMENT_NODE && node.nodeName in tags) {
            toRemove.add(node)
        }
    }
    for (node in toRemove) {
        parent.removeChild(node)
    }
}
