package app.morphe.patches.gboard

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.shared.Constants
import app.morphe.patches.shared.PERMISSION_TAGS
import app.morphe.patches.shared.getAttributeValue
import org.w3c.dom.Document
import org.w3c.dom.Element

private fun removeManifestPermissions(doc: Document, blocked: Set<String>): List<String> {
    val removed = mutableListOf<String>()
    for (tagName in PERMISSION_TAGS) {
        val nodes = doc.getElementsByTagName(tagName)
        val toRemove = mutableListOf<Element>()
        for (i in 0 until nodes.length) {
            val elem = nodes.item(i) as? Element ?: continue
            val name = getAttributeValue(elem, "name")
            if (name in blocked) {
                toRemove.add(elem)
                removed.add(name)
            }
        }
        for (elem in toRemove) {
            elem.parentNode?.removeChild(elem)
        }
    }
    return removed
}

@Suppress("unused")
val gboardStripPermissionsPatch = resourcePatch(
    name = "Remove Permissions",
    description = "Removes permissions you pick below.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY_GBOARD)

    val stripContacts by booleanOption(
        key = "stripContacts",
        title = "Contacts",
        description = "Removes contact access (no contact name suggestions).",
        default = false,
        required = false,
    )

    val stripAudio by booleanOption(
        key = "stripAudio",
        title = "Microphone",
        description = "Removes microphone access (no voice dictation).",
        default = false,
        required = false,
    )

    val stripMedia by booleanOption(
        key = "stripMedia",
        title = "Photos & files",
        description = "Removes photo access (no custom image themes).",
        default = false,
        required = false,
    )

    val stripUserDictionary by booleanOption(
        key = "stripUserDictionary",
        title = "Dictionary sync",
        description = "Removes system dictionary access.",
        default = false,
        required = false,
    )

    val stripCrossProfile by booleanOption(
        key = "stripCrossProfile",
        title = "Work profile link",
        description = "Separates work and personal profiles.",
        default = false,
        required = false,
    )

    execute {
        val manifestFile = get("AndroidManifest.xml")
        if (!manifestFile.exists()) {
            println("[Remove Permissions] Skipped: AndroidManifest.xml not found.")
            return@execute
        }

        val blocked = mutableSetOf<String>()
        if (stripContacts == true) {
            blocked.add("android.permission.READ_CONTACTS")
        }
        if (stripAudio == true) {
            blocked.add("android.permission.RECORD_AUDIO")
        }
        if (stripMedia == true) {
            blocked.add("android.permission.READ_MEDIA_IMAGES")
            blocked.add("android.permission.READ_MEDIA_VISUAL_USER_SELECTED")
            blocked.add("android.permission.READ_EXTERNAL_STORAGE")
        }
        if (stripUserDictionary == true) {
            blocked.add("android.permission.READ_USER_DICTIONARY")
            blocked.add("android.permission.WRITE_USER_DICTIONARY")
        }
        if (stripCrossProfile == true) {
            blocked.add("android.permission.INTERACT_ACROSS_PROFILES")
        }

        if (blocked.isEmpty()) {
            println("[Remove Permissions] Skipped: No permissions selected to strip.")
            return@execute
        }

        var removedList: List<String> = emptyList()
        document(manifestFile.absolutePath).use { doc ->
            removedList = removeManifestPermissions(doc, blocked)
        }

        val removedShortNames = removedList.map { it.substringAfterLast('.') }.distinct()
        println("[Remove Permissions] Revoked ${removedList.size} permission(s) from AndroidManifest.xml: ${removedShortNames.joinToString(", ")}")
    }
}
