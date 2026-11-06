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

/*
 * Labels and the icon of the screens HushMessenger adds. Text written straight into the manifest showed as "Messenger"
 * on some phones: a realme launcher listed the settings icon under Messenger's own name and icon (#141), and a Samsung
 * on Android 12 named Bold and Italic "Messenger" in the text menu (#125). Every label is a string resource now,
 * translated where the settings page is, and the icon is a drawable of the app's own instead of one of Android's.
 */
internal const val SETTINGS_LABEL = "hush_settings_label"
internal const val RESTART_LABEL = "hush_restart_label"
internal const val BOLD_LABEL = "hush_text_bold"
internal const val ITALIC_LABEL = "hush_text_italic"
internal const val SETTINGS_ICON = "hush_settings_icon"
internal const val SETTINGS_ICON_PATH = "res/drawable/$SETTINGS_ICON.xml"
internal const val DEFAULT_STRINGS = "res/values/strings.xml"

/** The name the settings label carries in every language, which a clone swaps for its own app name. */
internal const val SETTINGS_LABEL_NAME = "HushMessenger"

/** Each label's text by strings file. The translations are the settings page's own rows (SettingsTextViVN, SettingsTextZhTw). */
internal val MANIFEST_STRINGS: Map<String, Map<String, String>> = linkedMapOf(
    DEFAULT_STRINGS to linkedMapOf(SETTINGS_LABEL to "HushMessenger settings", RESTART_LABEL to "Restart Messenger",
        BOLD_LABEL to "Bold", ITALIC_LABEL to "Italic"),
    "res/values-vi/strings.xml" to linkedMapOf(SETTINGS_LABEL to "Cài đặt HushMessenger", RESTART_LABEL to "Khởi động lại Messenger",
        BOLD_LABEL to "Đậm", ITALIC_LABEL to "Nghiêng"),
    "res/values-zh-rTW/strings.xml" to linkedMapOf(SETTINGS_LABEL to "HushMessenger 設定", RESTART_LABEL to "重新啟動 Messenger",
        BOLD_LABEL to "粗體", ITALIC_LABEL to "斜體"),
)

private fun Element.strings() = children("string")

/** Adds [strings] to a decoded strings file. Refuses, before adding any, a file that already has one of them. */
internal fun Document.addStrings(strings: Map<String, String>) {
    val resources = documentElement
    if (resources?.tagName != "resources") throw PatchException("Messenger controls: a strings file has no resources element")
    val taken = resources.strings().map { it.getAttribute("name") }.toSet()
    strings.keys.firstOrNull { it in taken }?.let {
        throw PatchException("Messenger controls: the APK already has a string called $it. Start with the stock APK.")
    }
    for ((name, text) in strings) resources.appendChild(createElement("string").also {
        it.setAttribute("name", name)
        it.textContent = text
    })
}

/** Rewrites the string [name] of a decoded strings file to [text]. Answers whether the file had it. */
internal fun Document.setString(name: String, text: String): Boolean {
    val string = documentElement?.strings()?.singleOrNull { it.getAttribute("name") == name } ?: return false
    string.textContent = text
    return true
}

// Declared before SETTINGS_ICON_XML, which reads it: top-level values initialize in file order.
internal const val GEAR_PATH = "M19.14,12.94c0.04,-0.3 0.06,-0.61 0.06,-0.94c0,-0.32 -0.02,-0.64 -0.07,-0.94l2.03,-1.58" +
    "c0.18,-0.14 0.23,-0.41 0.12,-0.61l-1.92,-3.32c-0.12,-0.22 -0.37,-0.29 -0.59,-0.22l-2.39,0.96c-0.5,-0.38 -1.03,-0.7 -1.62,-0.94" +
    "L14.4,2.81c-0.04,-0.24 -0.24,-0.41 -0.48,-0.41h-3.84c-0.24,0 -0.43,0.17 -0.47,0.41L9.25,5.35C8.66,5.59 8.12,5.92 7.63,6.29" +
    "L5.24,5.33c-0.22,-0.08 -0.47,0 -0.59,0.22L2.74,8.87C2.62,9.08 2.66,9.34 2.86,9.48l2.03,1.58C4.84,11.36 4.8,11.69 4.8,12" +
    "s0.02,0.64 0.07,0.94l-2.03,1.58c-0.18,0.14 -0.23,0.41 -0.12,0.61l1.92,3.32c0.12,0.22 0.37,0.29 0.59,0.22l2.39,-0.96" +
    "c0.5,0.38 1.03,0.7 1.62,0.94l0.36,2.54c0.05,0.24 0.24,0.41 0.48,0.41h3.84c0.24,0 0.44,-0.17 0.47,-0.41l0.36,-2.54" +
    "c0.59,-0.24 1.13,-0.56 1.62,-0.94l2.39,0.96c0.22,0.08 0.47,0 0.59,-0.22l1.92,-3.32c0.12,-0.22 0.07,-0.47 -0.12,-0.61" +
    "L19.14,12.94zM12,15.6c-1.98,0 -3.6,-1.62 -3.6,-3.6s1.62,-3.6 3.6,-3.6s3.6,1.62 3.6,3.6S13.98,15.6 12,15.6z"

/**
 * The settings icon: a white gear on the blue of HushMessenger's own icon, as an adaptive icon so every launcher shapes
 * it like the icons beside it. The gear is the Material settings glyph, scaled from its 24 unit box into the middle 54
 * of the 108 a launcher masks, inside the 66 it always shows.
 */
internal const val SETTINGS_ICON_XML = """<?xml version="1.0" encoding="utf-8"?>
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background>
        <color android:color="#FF0A6CFF" />
    </background>
    <foreground>
        <vector android:width="108dp" android:height="108dp" android:viewportWidth="108" android:viewportHeight="108">
            <group android:translateX="27" android:translateY="27" android:scaleX="2.25" android:scaleY="2.25">
                <path android:fillColor="#FFFFFFFF" android:pathData="$GEAR_PATH" />
            </group>
        </vector>
    </foreground>
</adaptive-icon>
"""

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
