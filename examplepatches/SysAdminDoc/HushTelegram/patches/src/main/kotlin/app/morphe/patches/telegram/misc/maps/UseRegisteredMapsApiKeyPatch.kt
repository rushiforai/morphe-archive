/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.maps

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.shared.compat.AppCompatibilities
import org.w3c.dom.Document
import org.w3c.dom.Element
import javax.xml.parsers.DocumentBuilderFactory

private const val PATCH = "Use registered Maps API key"
internal const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
internal val MAPS_KEY_NAMES = setOf("com.google.android.maps.v2.API_KEY", "com.google.android.geo.API_KEY")
private val KEY_FORMAT = Regex("AIza[0-9A-Za-z_-]{35}")

/** Google's Maps SDK checks the key against the installed package and its real signing certificate. */
@Suppress("unused")
val useRegisteredMapsApiKeyPatch = resourcePatch(
    name = PATCH,
    description = "Lets maps in your patched Telegram use a Google Maps key you registered. Leave the option empty to " +
        "keep Telegram's key. It has no switch and isn't selected by default. Turn on Expert mode in Morphe " +
        "Manager to pick it and enter your key.",
    default = false,
) {
    category("Fixes")
    compatibleWith(*AppCompatibilities.telegram())
    val apiKey by stringOption(
        key = "apiKey", default = null, title = "Your Google Maps key",
        description = "A Google Maps key for Android apps, made in your own Google Cloud project. Limit it " +
            "to Telegram's package name and your signing certificate (SHA-1).",
        required = false,
    )
    execute { applyRegisteredMapsApiKey(apiKey) }
}

internal fun checkedMapsApiKey(key: String?): String? {
    if (key == null) return null
    if (!KEY_FORMAT.matches(key)) throw PatchException("$PATCH: apiKey must be a 39-character Google API key.")
    return key
}

internal fun ResourcePatchContext.applyRegisteredMapsApiKey(key: String?) {
    val registered = checkedMapsApiKey(key) ?: return
    // Validate the file without the patcher's saving DOM. A refusal leaves its bytes untouched.
    val readOnly = DocumentBuilderFactory.newInstance().apply {
        setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
        setFeature("http://xml.org/sax/features/external-general-entities", false)
        setFeature("http://xml.org/sax/features/external-parameter-entities", false)
        isXIncludeAware = false
        isExpandEntityReferences = false
    }.newDocumentBuilder().parse(this["AndroidManifest.xml"])
    val stock = resolveMapsApiKey(readOnly).getAttribute("android:value")
    document("AndroidManifest.xml").use { manifest ->
        val target = resolveMapsApiKey(manifest)
        requireMapsShape(target.getAttribute("android:value") == stock, "Maps metadata changed during validation")
        target.setAttribute("android:value", registered)
    }
}

internal fun resolveMapsApiKey(document: Document): Element {
    val root = document.documentElement
    requireMapsShape(root.tagName == "manifest" && root.getAttribute("xmlns:android") == ANDROID_NAMESPACE,
        "manifest Android namespace changed")
    val applications = document.getElementsByTagName("application")
    requireMapsShape(applications.length == 1 && applications.item(0).parentNode === root,
        "manifest application is missing or ambiguous")
    val metadata = document.getElementsByTagName("meta-data")
    val keys = (0 until metadata.length).map { metadata.item(it) as Element }
        .filter { it.getAttribute("android:name") in MAPS_KEY_NAMES }
    requireMapsShape(keys.size == 1, "Maps API key metadata is missing or ambiguous")
    val target = keys.single()
    requireMapsShape(target.parentNode === applications.item(0) && !target.hasAttribute("android:resource") &&
        KEY_FORMAT.matches(target.getAttribute("android:value")), "Maps API key is not a direct application literal")
    return target
}

private fun requireMapsShape(valid: Boolean, reason: String) {
    if (!valid) throw PatchException("$PATCH: $reason. Refuses to replace an unverified key.")
}
