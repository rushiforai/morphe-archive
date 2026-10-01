package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val SHORTCUT_LABEL_PATH = "res/values/strings.xml"
internal const val APP_COMPONENT_FACTORY = "com.facebook.common.appcomponentfactory.m4a.M4aAppComponentFactory"
internal const val SCREEN_HOST = "com.facebook.messaging.about.preference.NeueAboutPreferenceActivity"
internal const val SHORTCUT_HOST = "com.facebook.zero.upsell.activity.ZeroUpsellBuyConfirmInterstitialActivity"
internal const val SCREEN_EXTRA = "app.hushmessenger.screen"

/**
 * A Root Mount install keeps the stock manifest in PackageManager, so settings and restart run inside two stock
 * activities there (HostScreens). Each must still look the way it was tested: attributes not listed here, a task
 * affinity, launch mode or process of its own, or any intent filter would change how the screens open.
 */
private val hostAttributes = mapOf(
    SCREEN_HOST to mapOf<String, (String) -> Boolean>(
        "android:exported" to { it == "false" },
        "android:parentActivityName" to { it == "com.facebook.messenger.neue.MainActivity" },
    ),
    SHORTCUT_HOST to mapOf<String, (String) -> Boolean>(
        "android:exported" to { it == "false" },
        // No affinity: the task Android clears for a static shortcut is never Messenger's own.
        "android:taskAffinity" to { it.isEmpty() },
        "android:theme" to { it.endsWith("Theme.Translucent.NoTitleBar") || it.endsWith("01030010") },
        "android:configChanges" to { true },
    ),
)

internal fun Element.validateScreenHosts() {
    fun invalid(detail: String): Nothing = throw PatchException(
        "Messenger controls: $detail. Settings couldn't open on a Root Mount install. Start with an unmodified supported APK.",
    )
    if (getAttribute("android:appComponentFactory") != APP_COMPONENT_FACTORY) invalid("the app component factory differs")
    for ((host, expected) in hostAttributes) {
        val entry = (children("activity") + children("activity-alias")).filter { it.getAttribute("android:name") == host }
            .singleOrNull() ?: invalid("${host.substringAfterLast('.')} is missing")
        val attributes = (0 until entry.attributes.length).associate { entry.attributes.item(it).nodeName to entry.attributes.item(it).nodeValue }
        val changed = attributes.filter { (name, value) -> name != "android:name" && expected[name]?.invoke(value) != true }
        if (entry.tagName != "activity" || changed.isNotEmpty() || expected.keys.any { it != "android:configChanges" && it !in attributes } ||
            entry.children("intent-filter").isNotEmpty()) invalid("${host.substringAfterLast('.')} changed ($changed)")
    }
}
internal val shortcutLabels = mapOf("hushmessenger_patch_controls" to "Patch controls", "hushmessenger_restart" to "Restart Messenger")

internal fun resolveShortcutsPath(apkEntries: List<String>, readDocument: (String) -> Document): String {
    val candidates = apkEntries.filter { it.startsWith("res/") && it.endsWith(".xml") && !it.startsWith("res/values") }
    val matches = candidates.filter { path ->
        runCatching { readDocument(path).documentElement.tagName == "shortcuts" }.getOrDefault(false)
    }
    return when {
        matches.size == 1 -> matches.single()
        matches.isEmpty() -> throw PatchException(
            "Messenger controls: no shortcuts XML found in this APK. Start with an unmodified supported APK.",
        )
        else -> throw PatchException(
            "Messenger controls: found ${matches.size} shortcuts files (${matches.joinToString()}). Expected exactly one.",
        )
    }
}

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
    app.validateScreenHosts()
    addSettingsEntry()
    for (launcher in launchers.filter { it.shortcutMetadata().isEmpty() }) {
        launcher.appendChild(createElement("meta-data").apply {
            setAttribute("android:name", "android.app.shortcuts")
            setAttribute("android:resource", reference)
        })
    }
    val first = root.firstChild
    // Shortcuts start the stock host, which opens the real screen or, on a Root Mount install, the hosted one.
    for ((id, label, screen, icon) in listOf(
        listOf("hushmessenger_controls", "hushmessenger_patch_controls", "settings", "ic_menu_preferences"),
        listOf("hushmessenger_restart", "hushmessenger_restart", "restart", "ic_popup_sync"),
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
                setAttribute("android:targetClass", SHORTCUT_HOST)
                appendChild(shortcuts.createElement("extra").apply {
                    setAttribute("android:name", SCREEN_EXTRA)
                    setAttribute("android:value", screen)
                })
            })
        }
        root.insertBefore(shortcut, first)
    }
}
