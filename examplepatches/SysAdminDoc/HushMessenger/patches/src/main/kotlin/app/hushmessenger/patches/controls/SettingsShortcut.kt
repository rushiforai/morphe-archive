package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val APP_COMPONENT_FACTORY = "com.facebook.common.appcomponentfactory.m4a.M4aAppComponentFactory"
internal const val SCREEN_HOST = "com.facebook.messaging.about.preference.NeueAboutPreferenceActivity"
internal const val SHORTCUT_HOST = "com.facebook.zero.upsell.activity.ZeroUpsellBuyConfirmInterstitialActivity"

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
        // No affinity: the task Android clears for a launcher shortcut is never Messenger's own.
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
/**
 * The directories a shortcuts file can sit in once decoded: the `xml` type, any configuration. Decode them with one
 * `decode(SHORTCUTS_DIRECTORIES)` call. Patcher 2.0.1 loads the whole APK again for each file it decodes on request,
 * and reading Messenger's thousands of shrunk XML archive entries (`res/eve.xml`) one by one kept Desktop busy for hours.
 */
internal const val SHORTCUTS_DIRECTORIES = "res/xml*"

/** The one XML file among [decodedFiles] whose root is `shortcuts`, under whatever name Meta's resource shrinking gave it. */
internal fun resolveShortcutsPath(
    decodedFiles: List<String>,
    readDocument: (String) -> Document,
): String {
    val candidates = decodedFiles.filter { it.startsWith("res/") && it.endsWith(".xml") && !it.startsWith("res/values") }
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

private fun Element.children(tag: String) = (0 until childNodes.length)
    .mapNotNull { childNodes.item(it) as? Element }.filter { it.tagName == tag }

/**
 * Settings, restart and the app drawer icon. Messenger's shortcuts file stays stock: the extension publishes Patch
 * controls and Restart Messenger as dynamic shortcuts, which its Hide the icon shortcuts switch can take away again
 * (HushFacebook#146). Android gives an app no way to hide the static ones.
 */
internal fun Document.addSettingsAccess() {
    val applications = getElementsByTagName("application")
    if (applications.length != 1) throw PatchException("Messenger controls: expected one application")
    // Validate before changing anything, including the existing-settings guard.
    (applications.item(0) as Element).validateScreenHosts()
    addSettingsEntry()
}
