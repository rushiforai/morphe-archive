package app.zonghome.patches

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.stringOption

private object LauncherIconAssets

val launcherIconPatch = rawResourcePatch(
    name = "Launcher icon",
    description = "Use a rounded Light or Dark ring for the launcher and static startup logo. Leave unselected to keep the original icon.",
    default = false
) {
    category("Appearance")
    compatibleWith(myZongCompatibility)
    val variant by stringOption(key = "iconVariant", title = "Icon variant", default = "light",
        values = mapOf("Light" to "light", "Dark" to "dark"), required = true,
        description = "Light: off-white background and charcoal ring. Dark: charcoal background and off-white ring.",
        validator = { it in setOf("light", "dark") })
    execute {
        val editor = CharcoalResources()
        val iconId = editor.resourceIds(compiledFile("resources.arsc").readBytes(),
            setOf("ic_launcher_background"), "drawable").getValue("ic_launcher_background")
        val table = compiledFile("resources.arsc")
        val splashId = editor.resourceIds(table.readBytes(), setOf("wrap_splash_logo"), "drawable").getValue("wrap_splash_logo")
        table.writeBytes(editor.drawableAlias(table.readBytes(), splashId, iconId))
        val manifest = compiledFile("AndroidManifest.xml")
        val bytes = manifest.readBytes()
        if (bytes.size >= 8 && bytes[0].toInt() == 3 && bytes[1].toInt() == 0) {
            manifest.writeBytes(editor.launcherIconReferences(bytes, iconId))
        } else {
            // A second source may have requested decoded resources. Preserve its manifest edits.
            document("AndroidManifest.xml").use { doc ->
                val app = doc.getElementsByTagName("application").item(0) as org.w3c.dom.Element
                app.setAttributeNS("http://schemas.android.com/apk/res/android", "android:icon", "@drawable/ic_launcher_background")
                app.setAttributeNS("http://schemas.android.com/apk/res/android", "android:roundIcon", "@drawable/ic_launcher_background")
            }
        }
        val asset = checkNotNull(LauncherIconAssets::class.java.getResourceAsStream("/branding/launcher-$variant.xml")) {
            "Missing launcher icon preset: $variant"
        }.use { it.readBytes() }
        compiledFile("res/drawable/ic_launcher_background.xml").writeBytes(asset)
    }
}
