package local.wazemaps

import app.morphe.patcher.patch.PatchException
import com.reandroid.arsc.chunk.xml.AndroidManifestBlock
import com.reandroid.arsc.chunk.xml.ResXmlElement

/** Add only the embedded companion's install permission, query and private components. */
internal fun companionManifest(bytes: ByteArray): ByteArray {
    val manifest = AndroidManifestBlock.load(bytes.inputStream())
    if (manifest.packageName != "com.waze") throw PatchException("Expected Waze manifest")
    val root = manifest.manifestElement
    fun ResXmlElement.named(tag: String, name: String): ResXmlElement {
        val children = getElements(tag)
        while (children.hasNext()) {
            val child = children.next() as ResXmlElement
            if (AndroidManifestBlock.getAndroidNameValue(child) == name) return child
        }
        return newElement(tag).also { it.getOrCreateAndroidAttribute("name", 0x01010003).setValueAsString(name) }
    }
    root.named("uses-permission", "android.permission.REQUEST_INSTALL_PACKAGES")
    root.getOrCreateElement("queries").named("package", "local.waze.aainstaller")
    val application = manifest.applicationElement ?: throw PatchException("Waze application missing")
    application.named("activity", "local.wazemaps.themes.CompanionSetupActivity").apply {
        getOrCreateAndroidAttribute("exported", 0x01010010).setValueAsBoolean(false)
        getOrCreateAndroidAttribute("theme", 0x01010000).apply {
            valueType = com.reandroid.arsc.value.ValueType.REFERENCE
            data = 0x01030241 // Theme.Material.Light.NoActionBar (verified against android.jar).
        }
    }
    application.named("provider", "local.wazemaps.themes.CompanionApkProvider").apply {
        getOrCreateAndroidAttribute("authorities", 0x01010018).setValueAsString("com.waze.morphe.aa-companion")
        getOrCreateAndroidAttribute("exported", 0x01010010).setValueAsBoolean(false)
        getOrCreateAndroidAttribute("grantUriPermissions", 0x0101001b).setValueAsBoolean(true)
    }
    manifest.refreshFull()
    return manifest.bytes
}
