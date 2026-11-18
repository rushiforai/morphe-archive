package io.github.electroheavenvn.patches.shared.loader

import app.morphe.patcher.patch.deleteResource
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.listApkEntries
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.resourceFile
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.io.File

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val NPATCH_PROXY_APP_COMPONENT_FACTORY = "top.nkbe.npatch.metaloader.LSPAppComponentFactoryStub"
private const val LSPATCH_PROXY_APP_COMPONENT_FACTORY = "org.lsposed.lspatch.metaloader.LSPAppComponentFactoryStub"
private const val NPATCH_PROVIDER_CLASS = "bin.mt.file.content.MTDataFilesProvider"
private const val LSPATCH_PROVIDER_CLASS = "org.lsposed.lspatch.loader.LSPatchDocumentsProvider"
private const val DOCUMENTS_PROVIDER_ACTION = "android.content.action.DOCUMENTS_PROVIDER"
private val DEX_NAME = Regex("^classes(\\d+)?\\.dex$")
private val REMOVED_METADATA = setOf("xposedmodule", "xposeddescription", "xposedminversion", "npatch", "lspatch")

fun integrateXposedLoader(
    loader: XposedLoader = XposedLoader.NPATCH,
    injectProvider: Boolean = false,
    usesCleartextTraffic: Boolean = false,
) {
    val manifest = document("AndroidManifest.xml")
    val packageName: String
    val originalFactory: String

    manifest.use { document ->
        packageName = document.documentElement.getAttribute("package")
            .ifBlank { packageMetadata.packageName }
        require(packageName.isNotBlank()) { "AndroidManifest.xml has no package name" }

        val application = document.singleElement("application")
        originalFactory = application.androidAttribute("appComponentFactory")
            .takeUnless { it == NPATCH_PROXY_APP_COMPONENT_FACTORY || it == LSPATCH_PROXY_APP_COMPONENT_FACTORY }
            .orEmpty()

        rewriteManifest(
            document = document,
            application = application,
            packageName = packageName,
            loader = loader,
            injectProvider = injectProvider,
            usesCleartextTraffic = usesCleartextTraffic,
        )
    }

    val largestDexIndex = listApkEntries()
        .asSequence()
        .mapNotNull { entry -> DEX_NAME.matchEntire(entry)?.groupValues?.get(1)?.toIntOrNull() ?: if (entry == "classes.dex") 1 else null }
        .maxOrNull() ?: 0

    when (loader) {
        XposedLoader.NPATCH -> {
            val config = NPatchConfig(
                packageName = packageName,
                appComponentFactory = originalFactory,
                injectProvider = injectProvider,
                usesCleartextTraffic = usesCleartextTraffic,
            )
            val configBytes = config.toJsonBytes()

            copyResource("npatch/metaloader.dex", "classes${largestDexIndex + 1}.dex")
            copyResource("npatch/loader.bin", "assets/npatch/loader.bin")
            resourceFile("assets/npatch/config.json").writeBytes(configBytes)
            copyResource("modules/app-release.apk", "assets/npatch/modules/io.github.electroheavenvn.zaloxposed.apk")
            copyResource("npatch/so/arm64-v8a/libnpatch.so", "assets/npatch/so/arm64-v8a/libnpatch.so")
            copyResource("npatch/so/x86_64/libnpatch.so", "assets/npatch/so/x86_64/libnpatch.so")

            if (injectProvider) {
                copyResource("npatch/mtprovider.dex", "assets/npatch/mtprovider.dex")
            } else {
                deleteResource("assets/npatch/mtprovider.dex")
            }
            deleteResource("assets/npatch/origin.apk")

            ensureUncompressed(
                "assets/npatch/loader.bin",
                "assets/npatch/so/arm64-v8a/libnpatch.so",
                "assets/npatch/so/x86_64/libnpatch.so",
            )
        }

        XposedLoader.LSPATCH -> {
            val config = LSPatchConfig(
                injectDocumentsProvider = injectProvider,
            )
            val configBytes = config.toJsonBytes()

            copyResource("lspatch/metaloader.dex", "classes${largestDexIndex + 1}.dex")
            copyResource("lspatch/loader_patched.dex", "assets/lspatch/loader.dex")
            resourceFile("assets/lspatch/config.json").writeBytes(configBytes)
            copyResource("modules/app-release.apk", "assets/lspatch/modules/io.github.electroheavenvn.zaloxposed.apk")
            copyResource("lspatch/so/arm64-v8a/liblspatch.so", "assets/lspatch/so/arm64-v8a/liblspatch.so")
            copyResource("lspatch/so/armeabi-v7a/liblspatch.so", "assets/lspatch/so/armeabi-v7a/liblspatch.so")
            copyResource("lspatch/so/x86/liblspatch.so", "assets/lspatch/so/x86/liblspatch.so")
            copyResource("lspatch/so/x86_64/liblspatch.so", "assets/lspatch/so/x86_64/liblspatch.so")

            deleteResource("assets/lspatch/origin.apk")

            ensureUncompressed(
                "assets/lspatch/loader.dex",
                "assets/lspatch/so/arm64-v8a/liblspatch.so",
                "assets/lspatch/so/armeabi-v7a/liblspatch.so",
                "assets/lspatch/so/x86/liblspatch.so",
                "assets/lspatch/so/x86_64/liblspatch.so",
            )
        }
    }
}

private fun ensureUncompressed(vararg extraPaths: String) {
    val filesToUpdate = mutableSetOf<File>()

    try {
        val dummyFile = resourceFile("uncompressed-files.json")
        filesToUpdate.add(dummyFile)
        dummyFile.parentFile?.let { parent ->
            filesToUpdate.add(File(parent, "uncompressed-files.json"))
            parent.parentFile?.let { grandParent ->
                filesToUpdate.add(File(grandParent, "uncompressed-files.json"))
            }
        }
    } catch (_: Exception) {}

    try {
        val manifestFile = resourceFile("AndroidManifest.xml")
        manifestFile.parentFile?.let { manifestParent ->
            filesToUpdate.add(File(manifestParent, "uncompressed-files.json"))
            manifestParent.parentFile?.let { manifestGrandParent ->
                filesToUpdate.add(File(manifestGrandParent, "uncompressed-files.json"))
            }
        }
    } catch (_: Exception) {}

    for (targetFile in filesToUpdate) {
        val content = if (targetFile.exists() && targetFile.length() > 0) targetFile.readText() else ""

        val extensions = parseJsonStringArray(content, "extensions").toMutableSet()
        val paths = parseJsonStringArray(content, "paths").toMutableSet()

        extensions.add(".so")
        extensions.add("so")
        paths.addAll(extraPaths)

        val jsonOutput = buildString {
            append("{\n")
            append("  \"extensions\": [\n")
            append(extensions.joinToString(",\n") { "    \"$it\"" })
            append("\n  ],\n")
            append("  \"paths\": [\n")
            append(paths.joinToString(",\n") { "    \"$it\"" })
            append("\n  ]\n")
            append("}")
        }

        try {
            targetFile.parentFile?.mkdirs()
            targetFile.writeText(jsonOutput)
        } catch (_: Exception) {}
    }
}

private fun parseJsonStringArray(json: String, key: String): List<String> {
    val keyIndex = json.indexOf("\"$key\"")
    if (keyIndex == -1) return emptyList()

    val bracketStart = json.indexOf('[', keyIndex)
    if (bracketStart == -1) return emptyList()

    val bracketEnd = json.indexOf(']', bracketStart)
    if (bracketEnd == -1) return emptyList()

    val arrayText = json.substring(bracketStart + 1, bracketEnd)
    val regex = Regex("\"([^\"]+)\"")
    return regex.findAll(arrayText).map { it.groupValues[1] }.toList()
}

private fun rewriteManifest(
    document: Document,
    application: Element,
    packageName: String,
    loader: XposedLoader,
    injectProvider: Boolean,
    usesCleartextTraffic: Boolean,
) {
    val manifest = document.documentElement
    val usesSdk = document.elements("uses-sdk").firstOrNull() ?: document.createElement("uses-sdk").also { element ->
        manifest.insertBefore(element, manifest.firstChild)
    }
    val minSdk = usesSdk.androidAttribute("minSdkVersion").toIntOrNull()
    if ((minSdk == null) || (minSdk < 28)) usesSdk.setAndroidAttribute("minSdkVersion", "28")

    val proxyFactory = when (loader) {
        XposedLoader.NPATCH -> NPATCH_PROXY_APP_COMPONENT_FACTORY
        XposedLoader.LSPATCH -> LSPATCH_PROXY_APP_COMPONENT_FACTORY
    }
    application.setAndroidAttribute("appComponentFactory", proxyFactory)

    if (usesCleartextTraffic) {
        application.setAndroidAttribute("usesCleartextTraffic", "true")
    } else {
        application.removeAndroidAttribute("usesCleartextTraffic")
    }

    application.childElements("meta-data")
        .filter { it.androidAttribute("name") in REMOVED_METADATA }
        .forEach(application::removeChild)

    application.childElements("provider")
        .filter {
            val name = it.androidAttribute("name")
            name == NPATCH_PROVIDER_CLASS || name == LSPATCH_PROVIDER_CLASS
        }
        .forEach(application::removeChild)

    if (injectProvider) {
        val providerElement = when (loader) {
            XposedLoader.NPATCH -> document.createNPatchProvider(packageName)
            XposedLoader.LSPATCH -> document.createLSPatchProvider(packageName)
        }
        application.appendChild(providerElement)
    }
}

private fun Document.createNPatchProvider(packageName: String): Element = createElement("provider").also { provider ->
    provider.setAndroidAttribute("name", NPATCH_PROVIDER_CLASS)
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

private fun Document.createLSPatchProvider(packageName: String): Element = createElement("provider").also { provider ->
    provider.setAndroidAttribute("name", LSPATCH_PROVIDER_CLASS)
    provider.setAndroidAttribute("authorities", "$packageName.lspatch.documents")
    provider.setAndroidAttribute("exported", "true")
    provider.setAndroidAttribute("permission", "android.permission.MANAGE_DOCUMENTS")
    provider.setAndroidAttribute("grantUriPermissions", "true")
    provider.appendChild(createElement("intent-filter").also { intentFilter ->
        intentFilter.appendChild(createElement("action").also { action ->
            action.setAndroidAttribute("name", DOCUMENTS_PROVIDER_ACTION)
        })
    })
}

private fun copyResource(resourcePath: String, apkPath: String) {
    val input = XposedResourceIntegratorAnchor::class.java.classLoader.getResourceAsStream(resourcePath)
        ?: error("Packaged resource missing: $resourcePath")
    input.use { source -> resourceFile(apkPath).outputStream().use(source::copyTo) }
}

private object XposedResourceIntegratorAnchor

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