package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.isLegacyXrFoundationSteamLinkBuild
import app.template.patches.shared.Constants.isNativeXrSteamLinkBuild
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val SHIZUKU_BRIDGE_EXTENSION = "extensions/shizuku-bridge.mpe"
internal const val SHIZUKU_BRIDGE_PROVIDER = "gxr.shizuku.ShizukuBridge"

private const val SHIZUKU_PACKAGE = "moe.shizuku.privileged.api"
private const val SHIZUKU_PERMISSION = "moe.shizuku.manager.permission.API_V23"
private const val SHIZUKU_V3_SUPPORT = "moe.shizuku.client.V3_SUPPORT"

// The bridge touches no Steam Link code, so it is not tied to one native layout.
internal fun isShizukuBridgeBuild(version: String, versionCode: String): Boolean =
    isLegacyXrFoundationSteamLinkBuild(version, versionCode) ||
        isNativeXrSteamLinkBuild(version, versionCode)

internal fun shizukuBridgeResource(name: String): ByteArray =
    (object {}.javaClass.getResourceAsStream("/$name")
        ?: throw PatchException("Missing bundled resource: $name"))
        .use { it.readBytes() }

private fun Document.elements(tag: String): List<Element> =
    getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

/**
 * Declares what Shizuku needs to hand its binder to the app. Shizuku looks the provider up by the
 * authority "<package>.shizuku", so it is derived from the manifest's current package. An
 * application can have only one such provider, which is why every patch that needs Shizuku shares
 * this one.
 */
internal fun addShizukuBridgeManifestEntries(document: Document) {
    val manifest = document.documentElement
    val application = document.elements("application").single()

    if (document.elements("uses-permission").none { it.getAttribute("android:name") == SHIZUKU_PERMISSION }) {
        val permission = document.createElement("uses-permission")
        permission.setAttribute("android:name", SHIZUKU_PERMISSION)
        manifest.insertBefore(permission, application)
    }

    if (document.elements("package").none { it.getAttribute("android:name") == SHIZUKU_PACKAGE }) {
        val queries = document.createElement("queries")
        val shizuku = document.createElement("package")
        shizuku.setAttribute("android:name", SHIZUKU_PACKAGE)
        queries.appendChild(shizuku)
        manifest.insertBefore(queries, application)
    }

    if (document.elements("meta-data").none { it.getAttribute("android:name") == SHIZUKU_V3_SUPPORT }) {
        val support = document.createElement("meta-data")
        support.setAttribute("android:name", SHIZUKU_V3_SUPPORT)
        support.setAttribute("android:value", "true")
        application.appendChild(support)
    }

    val provider = document.elements("provider")
        .firstOrNull { it.getAttribute("android:name") == SHIZUKU_BRIDGE_PROVIDER }
        ?: document.createElement("provider").also { application.appendChild(it) }
    provider.setAttribute("android:name", SHIZUKU_BRIDGE_PROVIDER)
    provider.setAttribute("android:authorities", "${manifest.getAttribute("package")}.shizuku")
    provider.setAttribute("android:enabled", "true")
    provider.setAttribute("android:exported", "true")
    provider.setAttribute("android:multiprocess", "false")
    provider.setAttribute("android:permission", "android.permission.INTERACT_ACROSS_USERS_FULL")
}

// gxr.shizuku.ShizukuBridge and the Shizuku API classes; no fragment of an existing Steam Link class.
internal val shizukuBridgeExtensionPatch = bytecodePatch {
    extendWith(SHIZUKU_BRIDGE_EXTENSION)
}

internal val shizukuBridgeManifestPatch = resourcePatch {
    execute {
        if (isShizukuBridgeBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            ensureIdsXml(get("res/values/ids.xml"))
        }
    }
    finalize {
        if (!isShizukuBridgeBuild(packageMetadata.versionName, packageMetadata.versionCode)) {
            return@finalize
        }
        document("AndroidManifest.xml").use { document ->
            addShizukuBridgeManifestEntries(document)
        }
    }
}
