package dev.alastorkaneki.morphe.patches.operagx

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import dev.alastorkaneki.morphe.patches.operagx.Constants.OPERA_GX
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.util.zip.ZipInputStream

private const val ICON_PACKAGE =
    "dev.alastorkaneki.morphe.extension.operagx.icons"
private const val ICON_ACTIVITY = "$ICON_PACKAGE.GxIconPackActivity"
private const val ICON_PROVIDER = "$ICON_PACKAGE.GxIconPackInitProvider"
private const val DEFAULT_ALIAS = "$ICON_PACKAGE.GxIconAlias_default"

private object GxIconPackResources

private data class IconAlias(val component: String, val resource: String)

private fun Element.directChildren(tag: String): List<Element> =
    (0 until childNodes.length)
        .map { childNodes.item(it) }
        .filter { it.nodeType == Node.ELEMENT_NODE && it.nodeName == tag }
        .map { it as Element }

private fun Element.isLauncherFilter(): Boolean {
    val actions = directChildren("action").map { it.getAttribute("android:name") }
    val categories = directChildren("category").map { it.getAttribute("android:name") }
    return "android.intent.action.MAIN" in actions &&
        "android.intent.category.LAUNCHER" in categories
}

private val addGxIconPackResourcesPatch = resourcePatch(
    description = "Adds the standalone GX launcher icon selector and its 56 icon resources."
) {
    compatibleWith(OPERA_GX)

    execute {
        val indexBytes = GxIconPackResources::class.java.getResourceAsStream(
            "/gx-icon-pack/index.txt"
        )?.readBytes() ?: throw PatchException("Bundled GX icon index was not found.")
        val iconAliases = indexBytes.toString(Charsets.UTF_8)
            .lineSequence()
            .filter { it.isNotBlank() }
            .map { line ->
                val parts = line.split('|', limit = 3)
                if (parts.size != 3 || !parts[1].matches(Regex("gxip_[a-z0-9_]+"))) {
                    throw PatchException("Invalid GX icon index row: $line")
                }
                IconAlias(
                    component = "GxIconAlias_${parts[1].removePrefix("gxip_")}",
                    resource = parts[1]
                )
            }
            .toList()
        if (iconAliases.size != 56 || iconAliases.distinctBy { it.resource }.size != 56) {
            throw PatchException("GX icon index must contain 56 unique icons.")
        }
        val indexOutput = get("res/raw/gx_icon_pack_index.txt")
        indexOutput.parentFile.mkdirs()
        indexOutput.writeBytes(indexBytes)

        listOf("basic", "holo", "holo-gx", "neon").forEach { archive ->
            val bundled = GxIconPackResources::class.java.getResourceAsStream(
                "/gx-icon-pack/gx-icon-pack-$archive.zip"
            ) ?: throw PatchException("Bundled GX icon archive was not found: $archive")

            ZipInputStream(bundled).use { zip ->
                while (true) {
                    val entry = zip.nextEntry ?: break
                    if (!entry.isDirectory) {
                        val fileName = entry.name.substringAfterLast('/')
                        if (!fileName.matches(Regex("gxip_[a-z0-9_]+\\.png"))) {
                            throw PatchException("Invalid GX icon resource name: $fileName")
                        }
                        val output = get("res/drawable-nodpi/$fileName")
                        output.parentFile.mkdirs()
                        output.outputStream().use { zip.copyTo(it) }
                    }
                    zip.closeEntry()
                }
            }
        }

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val application = document.getElementsByTagName("application").item(0) as Element

            val launcherSource = sequenceOf("activity", "activity-alias")
                .flatMap { application.directChildren(it).asSequence() }
                .mapNotNull { component ->
                    component.directChildren("intent-filter")
                        .firstOrNull { it.isLauncherFilter() }
                        ?.let { filter -> component to filter }
                }
                .firstOrNull()
                ?: throw PatchException("Opera GX launcher activity was not found.")

            val (sourceComponent, launcherFilter) = launcherSource
            val targetActivity = if (sourceComponent.tagName == "activity-alias") {
                sourceComponent.getAttribute("android:targetActivity")
            } else {
                sourceComponent.getAttribute("android:name")
            }
            if (targetActivity.isBlank()) {
                throw PatchException("Opera GX launcher target activity was empty.")
            }

            val label = sourceComponent.getAttribute("android:label")
                .ifBlank { application.getAttribute("android:label") }
            val originalIcon = sourceComponent.getAttribute("android:icon")
                .ifBlank { application.getAttribute("android:icon") }

            sourceComponent.removeChild(launcherFilter)

            fun addAlias(className: String, icon: String?, enabled: Boolean) {
                val alias = document.createElement("activity-alias").apply {
                    setAttribute("android:name", className)
                    setAttribute("android:targetActivity", targetActivity)
                    setAttribute("android:enabled", enabled.toString())
                    setAttribute("android:exported", "true")
                    if (label.isNotBlank()) setAttribute("android:label", label)
                    if (!icon.isNullOrBlank()) setAttribute("android:icon", icon)
                    appendChild(launcherFilter.cloneNode(true))
                }
                application.appendChild(alias)
            }

            addAlias(DEFAULT_ALIAS, originalIcon, true)
            iconAliases.forEach { icon ->
                addAlias(
                    "$ICON_PACKAGE.${icon.component}",
                    "@drawable/${icon.resource}",
                    false
                )
            }

            val activity = document.createElement("activity").apply {
                setAttribute("android:name", ICON_ACTIVITY)
                setAttribute("android:exported", "true")
                setAttribute("android:excludeFromRecents", "true")
                setAttribute("android:label", "GX Icon Pack")
                setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
                appendChild(document.createElement("intent-filter").apply {
                    appendChild(document.createElement("action").apply {
                        setAttribute(
                            "android:name",
                            "dev.alastorkaneki.morphe.OPEN_GX_ICON_PACK"
                        )
                    })
                    appendChild(document.createElement("category").apply {
                        setAttribute("android:name", "android.intent.category.DEFAULT")
                    })
                })
            }
            application.appendChild(activity)

            val packageName = manifest.getAttribute("package").ifBlank { "com.opera.gx" }
            application.appendChild(document.createElement("provider").apply {
                setAttribute("android:name", ICON_PROVIDER)
                setAttribute("android:authorities", "$packageName.gxiconpack.init")
                setAttribute("android:exported", "false")
                setAttribute("android:enabled", "true")
                setAttribute("android:initOrder", "90")
            })
        }
    }
}

@Suppress("unused")
val gxIconPackPatch = bytecodePatch(
    name = "GX icon pack",
    description =
        "Adds a separate native selector for all 56 Opera GX launcher icons. " +
            "Open it from the GX Icon Pack long-press shortcut.",
    default = false
) {
    compatibleWith(OPERA_GX)
    dependsOn(addGxIconPackResourcesPatch)
    extendWith("extensions/extension.mpe")
    execute { }
}
