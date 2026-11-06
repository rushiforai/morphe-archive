package app.morphe.patches.samsungnotes.menu

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch

private val COMPATIBILITY_SAMSUNG_NOTES = Compatibility(
    name = "Samsung Notes",
    packageName = "com.samsung.android.app.notes",
    appIconColor = 0xFFB300,
    targets = listOf(AppTarget(version = null)) // jede App-Version
)

private const val MENU_ITEM =
    """<item android:id="@+id/action_export_pdf_vectorized" android:title="Export PDF vectorized" />"""

/**
 * Fügt in jedes Menü-XML, das action_print enthält, direkt dahinter
 * den neuen Eintrag "Export PDF vectorized" ein.
 */
private val addMenuItemResourcePatch = resourcePatch {
    compatibleWith(COMPATIBILITY_SAMSUNG_NOTES)

    execute {
        get("res").listFiles { f -> f.isDirectory && f.name.startsWith("menu") }
            ?.flatMap { dir -> dir.listFiles { f -> f.extension == "xml" }?.toList().orEmpty() }
            ?.forEach { file ->
                val xml = file.readText()
                val idPos = Regex("id/action_print\"").find(xml)?.range?.first ?: return@forEach
                if (xml.contains("action_export_pdf_vectorized")) return@forEach

                val itemStart = xml.lastIndexOf("<item", idPos)
                val tagEnd = xml.indexOf('>', idPos)
                // <item ... />  oder  <item ...> ... </item>
                val itemEnd = if (xml[tagEnd - 1] == '/') tagEnd + 1
                else xml.indexOf("</item>", tagEnd) + "</item>".length

                if (itemStart < 0 || itemEnd <= 0) return@forEach
                file.writeText(
                    xml.substring(0, itemEnd) + "\n    " + MENU_ITEM + xml.substring(itemEnd)
                )
            }
    }
}

@Suppress("unused")
val exportPdfVectorizedPatch = bytecodePatch(
    name = "Export PDF vectorized menu",
    description = "Adds an \"Export PDF vectorized\" menu item that opens an empty sub menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_SAMSUNG_NOTES)
    dependsOn(addMenuItemResourcePatch)

    // Dateiname ggf. an das Template anpassen.
    extendWith("extensions/extension.mpe")

    execute {
        // if (ExportPdfVectorizedPatch.onOptionsItemSelected(this, i)) return true;
        listOf(
            OptionsItemSelectedToShareFingerprint,
            OptionsItemSelectedForViewModeFingerprint
        ).forEach { fingerprint ->
            fingerprint.method.addInstructionsWithLabels(
                0,
                """
                    invoke-static { p0, p1 }, Lapp/morphe/extension/samsungnotes/ExportPdfVectorizedPatch;->onOptionsItemSelected(Ljava/lang/Object;I)Z
                    move-result v0
                    if-eqz v0, :continue
                    return v0
                    :continue
                    nop
                """
            )
        }
    }
}