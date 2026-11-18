package dev.rikunode.fairemail

import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val compatibility = Compatibility(
    name = "FairEmail",
    packageName = "eu.faircode.email",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x157B9B,
    targets = listOf(
        AppTarget(version = "1.2337", versionCode = 2337),
        AppTarget(version = "1.2338", versionCode = 2338),
    ),
)

@Suppress("unused")
val hideSupportBannerPatch = resourcePatch(
    name = "Permanently hide donation banner",
    description = "Hide the FairEmail support/Pro message above the inbox without affecting mail, notifications, or Pro features.",
    default = true,
) {
    compatibleWith(compatibility)

    execute {
        document("res/layout/fragment_messages.xml").use { document ->
            val nodes = document.getElementsByTagName("*")
            fun view(id: String): Element {
                val matches = (0 until nodes.length).mapNotNull { nodes.item(it) as? Element }
                    .filter { it.getAttribute("android:id").substringAfterLast('/') == id }
                require(matches.size == 1) {
                    "Unsupported FairEmail support layout: expected one $id, found ${matches.size}"
                }
                return matches.single()
            }

            val label = view("tvSupport")
            val separator = view("vSeparatorSupport")
            val group = view("grpSupport")
            require(label.tagName == "TextView") { "Unexpected support text type" }
            require(separator.tagName == "View") { "Unexpected support separator type" }
            require(group.tagName == "androidx.constraintlayout.widget.Group") { "Unexpected support group type" }
            require(group.getAttribute("app:constraint_referenced_ids") == "tvSupport,vSeparatorSupport") {
                "Unsupported FairEmail support group layout; refusing to modify other views"
            }

            label.setAttribute("android:visibility", "gone")
            separator.setAttribute("android:visibility", "gone")
            group.removeAttribute("app:constraint_referenced_ids")
            group.setAttribute("android:visibility", "gone")
        }
    }
}
