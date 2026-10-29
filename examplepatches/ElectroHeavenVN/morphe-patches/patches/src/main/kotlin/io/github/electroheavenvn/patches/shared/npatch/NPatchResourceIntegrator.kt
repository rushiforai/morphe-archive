package io.github.electroheavenvn.patches.shared.npatch

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val PROXY_APP_COMPONENT_FACTORY = "top.nkbe.npatch.metaloader.LSPAppComponentFactoryStub"
private const val PROVIDER_CLASS = "bin.mt.file.content.MTDataFilesProvider"
private const val DOCUMENTS_PROVIDER_ACTION = "android.content.action.DOCUMENTS_PROVIDER"
private val DEX_NAME = Regex("^classes(\\d+)?\\.dex$")
private val REMOVED_METADATA = setOf("xposedmodule", "xposeddescription", "xposedminversion", "npatch")

fun ResourcePatchContext.integrateNPatch(
    injectProvider: Boolean,
    useMicroG: Boolean,
    usesCleartextTraffic: Boolean,
) {
    val manifest = document("AndroidManifest.xml")
    val packageName: String
    val originalFactory: String
    val configBytes: ByteArray
    val configBase64: String

    manifest.use { document ->
        packageName = document.documentElement.getAttribute("package")
            .ifBlank { packageMetadata.packageName }
        require(packageName.isNotBlank()) { "AndroidManifest.xml has no package name" }

        val application = document.singleElement("application")
        originalFactory = application.androidAttribute("appComponentFactory")
            .takeUnless { it == PROXY_APP_COMPONENT_FACTORY }
            .orEmpty()
        val config = NPatchConfig(
            packageName = packageName,
            appComponentFactory = originalFactory,
            injectProvider = injectProvider,
            useMicroG = useMicroG,
            usesCleartextTraffic = usesCleartextTraffic,
        )
        configBytes = config.toJsonBytes()
        configBase64 = config.toManifestBase64(configBytes)
        rewriteManifest(document, application, packageName, configBase64, injectProvider, usesCleartextTraffic)
    }

    val largestDexIndex = listApkEntries()
        .asSequence()
        .mapNotNull { entry -> DEX_NAME.matchEntire(entry)?.groupValues?.get(1)?.toIntOrNull() ?: if (entry == "classes.dex") 1 else null }
        .maxOrNull() ?: 0

    copyResource("npatch/metaloader.dex", "classes${largestDexIndex + 1}.dex")
    copyResource("npatch/loader.bin", "assets/npatch/loader.bin")
    this["assets/npatch/config.json"].writeBytes(configBytes)
    copyResource("modules/app-release.apk", "assets/npatch/modules/io.github.electroheavenvn.zaloxposed.apk")
    copyResource("npatch/so/arm64-v8a/libnpatch.so", "assets/npatch/so/arm64-v8a/libnpatch.so")
    copyResource("npatch/so/x86_64/libnpatch.so", "assets/npatch/so/x86_64/libnpatch.so")

    if (injectProvider) {
        copyResource("npatch/mtprovider.dex", "assets/npatch/mtprovider.dex")
    } else {
        delete("assets/npatch/mtprovider.dex")
    }
    delete("assets/npatch/origin.apk")
}

private fun rewriteManifest(
    document: Document,
    application: Element,
    packageName: String,
    configBase64: String,
    injectProvider: Boolean,
    usesCleartextTraffic: Boolean,
) {
    val manifest = document.documentElement
    val usesSdk = document.elements("uses-sdk").firstOrNull() ?: document.createElement("uses-sdk").also { element ->
        manifest.insertBefore(element, manifest.firstChild)
    }
    val minSdk = usesSdk.androidAttribute("minSdkVersion").toIntOrNull()
    if ((minSdk == null) || (minSdk < 28)) usesSdk.setAndroidAttribute("minSdkVersion", "28")

    application.setAndroidAttribute("appComponentFactory", PROXY_APP_COMPONENT_FACTORY)
    if (usesCleartextTraffic) {
        application.setAndroidAttribute("usesCleartextTraffic", "true")
    } else {
        application.removeAndroidAttribute("usesCleartextTraffic")
    }

    application.childElements("meta-data")
        .filter { it.androidAttribute("name") in REMOVED_METADATA }
        .forEach(application::removeChild)
    // Maybe we don't need to write config to manifest metadata
    // document.createElement("meta-data").also { metadata ->
    //     metadata.setAndroidAttribute("name", "npatch")
    //     metadata.setAndroidAttribute("value", configBase64)
    //     application.appendChild(metadata)
    // }

    application.childElements("provider")
        .filter { it.androidAttribute("name") == PROVIDER_CLASS }
        .forEach(application::removeChild)
    if (injectProvider) application.appendChild(document.createProvider(packageName))
}

private fun Document.createProvider(packageName: String): Element = createElement("provider").also { provider ->
    provider.setAndroidAttribute("name", PROVIDER_CLASS)
    provider.setAndroidAttribute("authorities", "$packageName.MTDataFilesProvider")
    provider.setAndroidAttribute("exported", "true")
    provider.setAndroidAttribute("permission", "android.permission.MANAGE_DOCUMENTS")
    provider.setAndroidAttribute("grantUriPermissions", "true")
    provider.appendChild(createElement("intent-filter").also { intentFilter ->
        intentFilter.appendChild(createElement("action").also { action ->
            action.setAndroidAttribute("name", DOCUMENTS_PROVIDER_ACTION)
        })
    })
}

private fun ResourcePatchContext.copyResource(resourcePath: String, apkPath: String) {
    val input = NPatchResourceIntegratorAnchor::class.java.classLoader.getResourceAsStream(resourcePath)
        ?: error("Packaged NPatch resource missing: $resourcePath")
    input.use { source -> this[apkPath].outputStream().use(source::copyTo) }
}

private object NPatchResourceIntegratorAnchor

private fun Document.singleElement(tagName: String): Element =
    elements(tagName).singleOrNull() ?: error("AndroidManifest.xml must contain exactly one <$tagName>")

private fun Document.elements(tagName: String): List<Element> {
    val nodes = getElementsByTagName(tagName)
    return (0 until nodes.length).map { nodes.item(it) as Element }
}

private fun Element.childElements(tagName: String): List<Element> =
    (0 until childNodes.length)
        .map { childNodes.item(it) }
        .filterIsInstance<Element>()
        .filter { it.tagName == tagName }

private fun Element.androidAttribute(name: String): String =
    getAttributeNS(ANDROID_NAMESPACE, name).ifBlank { getAttribute("android:$name") }

private fun Element.setAndroidAttribute(name: String, value: String) =
    setAttributeNS(ANDROID_NAMESPACE, "android:$name", value)

private fun Element.removeAndroidAttribute(name: String) {
    removeAttributeNS(ANDROID_NAMESPACE, name)
    removeAttribute("android:$name")
}
