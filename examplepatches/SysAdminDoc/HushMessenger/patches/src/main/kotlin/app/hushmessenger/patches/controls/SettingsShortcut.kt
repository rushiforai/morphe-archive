package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val SHORTCUTS_PATH = "res/los.xml"
internal const val SHORTCUT_LABEL_PATH = "res/values/strings.xml"
internal val shortcutLabels = mapOf("hushmessenger_patch_controls" to "Patch controls", "hushmessenger_restart" to "Restart Messenger")

internal fun Document.validateShortcutLabels() {
    if (documentElement.tagName != "resources" || documentElement.children("string").any {
            it.getAttribute("name") in shortcutLabels
        }) throw PatchException("Messenger controls: shortcut labels differ from the stock APK.")
}

internal fun Document.addShortcutLabels() {
    validateShortcutLabels()
    shortcutLabels.forEach { (name, label) ->
        documentElement.appendChild(createElement("string").apply {
            setAttribute("name", name)
            textContent = label
        })
    }
}

private fun Element.children(tag: String) = (0 until childNodes.length)
    .mapNotNull { childNodes.item(it) as? Element }.filter { it.tagName == tag }

/** Keep Messenger's direct-share target and attach the same shortcuts to every launcher icon. */
internal fun Document.addSettingsAccess(shortcuts: Document) {
    fun invalid(): Nothing = throw PatchException(
        "Messenger controls: launcher shortcuts differ from the tested build. Start with an unmodified supported APK.",
    )
    val applications = getElementsByTagName("application")
    if (applications.length != 1) invalid()
    val app = applications.item(0) as Element
    val launchers = (app.children("activity") + app.children("activity-alias")).filter { entry ->
        entry.children("intent-filter").any { filter ->
            filter.children("action").any { it.getAttribute("android:name") == "android.intent.action.MAIN" } &&
                filter.children("category").any { it.getAttribute("android:name") == "android.intent.category.LAUNCHER" }
        }
    }
    fun Element.shortcutMetadata() = children("meta-data").filter {
        it.getAttribute("android:name") == "android.app.shortcuts"
    }
    val primary = launchers.singleOrNull {
        it.getAttribute("android:name") == "com.facebook.orca.auth.StartScreenActivity"
    } ?: invalid()
    val reference = primary.shortcutMetadata().singleOrNull()?.getAttribute("android:resource") ?: invalid()
    if (!reference.startsWith("@") || reference.length < 2) invalid()
    for (launcher in launchers) {
        val metadata = launcher.shortcutMetadata()
        if (metadata.size > 1 || metadata.any { it.getAttribute("android:resource") != reference }) invalid()
    }
    val root = shortcuts.documentElement
    if (root.tagName != "shortcuts" || root.children("share-target").count {
            it.getAttribute("android:targetClass") == "com.facebook.messenger.intents.ShareIntentHandler"
        } != 1 || root.children("shortcut").any {
            it.getAttribute("android:shortcutId") in setOf("hushmessenger_controls", "hushmessenger_restart")
        }) invalid()

    // Validate both documents before changing either, including the existing-settings guard.
    addSettingsEntry()
    for (launcher in launchers.filter { it.shortcutMetadata().isEmpty() }) {
        launcher.appendChild(createElement("meta-data").apply {
            setAttribute("android:name", "android.app.shortcuts")
            setAttribute("android:resource", reference)
        })
    }
    val first = root.firstChild
    for ((id, label, activity, icon) in listOf(
        listOf("hushmessenger_controls", "hushmessenger_patch_controls", "SettingsActivity", "ic_menu_preferences"),
        listOf("hushmessenger_restart", "hushmessenger_restart", "RestartActivity", "ic_popup_sync"),
    )) {
        val shortcut = shortcuts.createElement("shortcut").apply {
            setAttribute("android:shortcutId", id)
            setAttribute("android:enabled", "true")
            setAttribute("android:icon", "@android:drawable/$icon")
            setAttribute("android:shortcutShortLabel", "@string/$label")
            setAttribute("android:shortcutLongLabel", "@string/$label")
            appendChild(shortcuts.createElement("intent").apply {
                setAttribute("android:action", "android.intent.action.VIEW")
                setAttribute("android:targetPackage", "com.facebook.orca")
                setAttribute("android:targetClass", "app.hushmessenger.extension.$activity")
            })
        }
        root.insertBefore(shortcut, first)
    }
}
