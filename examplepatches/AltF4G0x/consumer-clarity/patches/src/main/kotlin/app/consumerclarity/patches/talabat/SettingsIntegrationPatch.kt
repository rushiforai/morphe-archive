package app.consumerclarity.patches.talabat

import app.morphe.patcher.patch.BytecodePatchBuilder
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import java.io.File

private const val CATALOG_ASSET = "assets/consumerclarity/settings.tsv"

private val settingsExtensionPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
}

val settingsIntegrationPatch = resourcePatch {
    compatibleWith(TALABAT_COMPATIBILITY)
    dependsOn(settingsExtensionPatch)

    execute {
        decode("AndroidManifest.xml")
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as org.w3c.dom.Element
            val activity = manifest.createElement("activity").apply {
                setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", "app.consumerclarity.ConsumerClarityActivity")
                setAttributeNS("http://schemas.android.com/apk/res/android", "android:exported", "true")
                setAttributeNS("http://schemas.android.com/apk/res/android", "android:theme", "@android:style/Theme.Material.NoActionBar")
            }
            val filter = manifest.createElement("intent-filter")
            filter.appendChild(manifest.createElement("action").apply {
                setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", "android.intent.action.VIEW")
            })
            filter.appendChild(manifest.createElement("category").apply {
                setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", "android.intent.category.DEFAULT")
            })
            filter.appendChild(manifest.createElement("category").apply {
                setAttributeNS("http://schemas.android.com/apk/res/android", "android:name", "android.intent.category.BROWSABLE")
            })
            filter.appendChild(manifest.createElement("data").apply {
                setAttributeNS("http://schemas.android.com/apk/res/android", "android:scheme", "consumerclarity")
                setAttributeNS("http://schemas.android.com/apk/res/android", "android:host", "settings")
            })
            activity.appendChild(filter)
            application.appendChild(activity)
        }
        listOf("en", "ar", "ckb").forEach { locale ->
            val file = get("assets/flutter_assets/i18n/$locale.json")
            val updated = file.readText()
                .replace(Regex("\"about\\.app\\.facebook\"\\s*:\\s*\"[^\"]*\""), "\"about.app.facebook\": \"Consumer Clarity\"")
                .replace(Regex("\"about\\.app\\.facebook\\.url\"\\s*:\\s*\"[^\"]*\""), "\"about.app.facebook.url\": \"consumerclarity://settings\"")
            file.writeText(updated)
        }
        get(CATALOG_ASSET, false).writeText("")
    }
}

private fun String.clean() = replace('\t', ' ').replace('\n', ' ')

fun File.registerSetting(
    key: String,
    title: String,
    description: String,
    category: String,
    kind: String = "runtime",
    default: Boolean = true,
) {
    appendText(listOf(key, title, description, category, kind, default.toString()).joinToString("\t") { it.clean() } + "\n")
}

fun consumerBytecodePatch(
    name: String,
    description: String,
    category: String,
    key: String = name,
    default: Boolean = false,
    defaultSetting: Boolean = true,
    kind: String = "runtime",
    block: BytecodePatchBuilder.() -> Unit,
) = bytecodePatch(name, description, default) {
    block()
    compatibleWith(TALABAT_COMPATIBILITY)
    dependsOn(resourcePatch {
        dependsOn(settingsIntegrationPatch)
        execute {
            get(CATALOG_ASSET).registerSetting(key, name, description, category, kind = kind, default = defaultSetting)
        }
    })
}

fun consumerBuildBytecodePatch(
    name: String,
    description: String,
    category: String,
    block: BytecodePatchBuilder.() -> Unit,
) = bytecodePatch(name, description, false) {
    block()
    compatibleWith(TALABAT_COMPATIBILITY)
    dependsOn(resourcePatch {
        dependsOn(settingsIntegrationPatch)
        execute {
            get(CATALOG_ASSET).registerSetting(name, name, description, category, kind = "build")
        }
    })
}

fun consumerResourcePatch(
    name: String,
    description: String,
    category: String,
    key: String = name,
    default: Boolean = false,
    action: ResourcePatchContext.() -> Unit,
) = resourcePatch(name, description, default) {
    compatibleWith(TALABAT_COMPATIBILITY)
    dependsOn(settingsIntegrationPatch)
    execute {
        get(CATALOG_ASSET).registerSetting(key, name, description, category, kind = "build")
        action()
    }
}
