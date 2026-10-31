package com.sj010.gboardclipboard.patches

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val GBOARD_SETTINGS_ACTIVITY_CLASS =
    "com.google.android.apps.inputmethod.latin.preference.SettingsActivity"
private const val HEADER_PREFERENCE_TAG =
    "com.google.android.libraries.inputmethod.settings.widget.HeaderPreference"
private const val CLIPBOARD_PREF_KEY = "pref_key_clipboard_history_manager"

private val GBOARD_SETTINGS_PATHS = listOf(
    "res/xml/settings.xml",
    "res/xml/settings_legacy.xml",
)

val clipboardHistoryPatch = resourcePatch(
    name = "Gboard Clipboard History",
    description = "Provides persistent, unlimited clipboard history management integrated natively into Gboard settings.",
) {
    compatibleWith(
        Constants.COMPATIBILITY_GBOARD,
        Constants.COMPATIBILITY_PIXELBOARD,
    )

    // The runtime extension (activity + provider + repository) lives in a separate DEX.
    // Without this dependency the carrier patch is never scheduled and the merged APK
    // would reference classes that do not exist.
    dependsOn(gboardClipboardCarrierPatch)

    execute {
        applyClipboardActivityDeclaration()
        applyClipboardProviderIdentity()
        applyClipboardSettingsXmlModifications()
    }

    // The package rename patch rewrites the manifest package in its own execute
    // phase, so the authority and the permission are (re)computed here, once the
    // final host package is known. The activity declaration does not depend on
    // the package name and is therefore not repeated.
    finalize {
        applyClipboardProviderIdentity()
    }
}

/**
 * Declares the clipboard history activity. The declaration does not depend on the
 * host package, so it only has to be written once.
 */
context(context: ResourcePatchContext)
private fun applyClipboardActivityDeclaration(): Unit = with(context) {
    document("AndroidManifest.xml").use { doc ->
        val manifest = doc.documentElement
        val application = manifest.childElements("application").firstOrNull() ?: return@use

        // Find or create GboardClipboardHistoryActivity declaration
        val activity = application.childElements("activity").firstOrNull {
            it.manifestAndroidAttribute("name") == Constants.CLIPBOARD_ACTIVITY_CLASS
        } ?: doc.createElement("activity").also { application.appendChild(it) }

        activity.setManifestAndroidAttribute("name", Constants.CLIPBOARD_ACTIVITY_CLASS)
        activity.setManifestAndroidAttribute("label", "Clipboard History")
        // Integrate into Gboard: Not exported outside app, no launcher entry
        activity.setManifestAndroidAttribute("exported", "false")

        // Inherit Gboard's native settings theme if available
        val settingsActivity = application.childElements("activity").firstOrNull {
            it.manifestAndroidAttribute("name") == GBOARD_SETTINGS_ACTIVITY_CLASS
        }
        val settingsTheme = settingsActivity?.manifestAndroidAttribute("theme")
        if (!settingsTheme.isNullOrBlank()) {
            activity.setManifestAndroidAttribute("theme", settingsTheme)
        }

        // Clean any residual launcher filters so it never shows as a separate home app icon
        val launcherFilters = activity.childElements("intent-filter").filter { filter ->
            val hasLauncher = filter.childElements("category").any {
                it.manifestAndroidAttribute("name") == "android.intent.category.LAUNCHER"
            }
            val hasMain = filter.childElements("action").any {
                it.manifestAndroidAttribute("name") == "android.intent.action.MAIN"
            }
            hasLauncher && hasMain
        }.toList()
        launcherFilters.forEach { activity.removeChild(it) }

        Unit
    }
}

/**
 * Exposes the clipboard history to companion apps through a read-only provider.
 *
 * The authority and the permission are derived from the host package, so that several
 * patched keyboards can be installed side by side without clashing on the global
 * namespaces.
 */
context(context: ResourcePatchContext)
private fun applyClipboardProviderIdentity(): Unit = with(context) {
    document("AndroidManifest.xml").use { doc ->
        val manifest = doc.documentElement
        val application = manifest.childElements("application").firstOrNull() ?: return@use
        val packageName = manifest.getAttribute("package") ?: ""
        val providerAuthority = Constants.providerAuthorityFor(packageName)
        val permissionName = Constants.permissionNameFor(packageName)

        removeStaleClipboardPermissions(doc, manifest, permissionName)
        ensureManifestPermission(doc, manifest, permissionName)
        val provider = ensureManifestComponent(doc, application, "provider", Constants.CLIPBOARD_PROVIDER_CLASS)
        provider.setManifestAndroidAttribute("authorities", providerAuthority)
        provider.setManifestAndroidAttribute("exported", "true")
        provider.setManifestAndroidAttribute("grantUriPermissions", "false")

        Unit
    }
}

/**
 * Drops clipboard history permission declarations that were created for an
 * earlier host package name (for example the pre-rename Gboard package).
 */
context(context: ResourcePatchContext)
private fun removeStaleClipboardPermissions(
    doc: Document,
    manifest: Element,
    keepPermissionName: String,
): Unit = with(context) {
    manifest.childElements("permission").filter { permission ->
        val name = permission.manifestAndroidAttribute("name") ?: return@filter false
        name != keepPermissionName && name.endsWith(Constants.CLIPBOARD_PERMISSION_NAME_SUFFIX)
    }.toList().forEach { permission ->
        permission.parentNode?.removeChild(permission)
    }
}

context(context: ResourcePatchContext)
private fun applyClipboardSettingsXmlModifications(): Unit = with(context) {
    val packageName = try {
        document("AndroidManifest.xml").use { it.documentElement.getAttribute("package") ?: "" }
    } catch (_: Throwable) {
        ""
    }

    // 0. Inject string resources in res/values*/strings.xml
    try {
        val resDir = get("res", false)
        if (resDir.exists() && resDir.isDirectory) {
            val stringFiles = resDir.walkTopDown()
                .filter { it.isFile && it.name == "strings.xml" }
                .toList()

            for (file in stringFiles) {
                var text = file.readText()
                if (!text.contains("name=\"gboard_clipboard_history_title\"")) {
                    val endIdx = text.lastIndexOf("</resources>")
                    if (endIdx >= 0) {
                        text = text.substring(0, endIdx) +
                            "    <string name=\"gboard_clipboard_history_title\">Clipboard History</string>\n" +
                            "    <string name=\"gboard_clipboard_history_summary\">View, export, and manage persistent clips</string>\n" +
                            text.substring(endIdx)
                        file.writeText(text)
                    }
                }
            }
        }
    } catch (_: Throwable) {
    }

    // 1. Create vector icon
    try {
        val iconFile = get("res/drawable/ic_clipboard_history_entry.xml", false)
        iconFile.parentFile?.mkdirs()
        iconFile.writeText(
            """<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="24dp"
    android:height="24dp"
    android:viewportWidth="24"
    android:viewportHeight="24"
    android:tint="?android:attr/colorControlNormal">
    <path
        android:fillColor="@android:color/white"
        android:pathData="M19,2h-4.18C14.4,0.84 13.3,0 12,0c-1.3,0 -2.4,0.84 -2.82,2H5c-1.1,0 -2,0.9 -2,2v16c0,1.1 0.9,2 2,2h14c1.1,0 2,-0.9 2,-2V4C21,2.9 20.1,2 19,2zM12,2c0.55,0 1,0.45 1,1s-0.45,1 -1,1 -1,-0.45 -1,-1 0.45,-1 1,-1zM14,17H7v-2h7V17zM17,13H7v-2h10V13zM17,9H7V7h10V9z"/>
</vector>
"""
        )
    } catch (_: Throwable) {
    }

    // 2. Clean up from root settings screens (settings.xml, settings_legacy.xml)
    // As per user directive: Keep "Clipboard history" only in the Clipboard settings section.
    GBOARD_SETTINGS_PATHS.forEach { path ->
        removeClipboardPrefFromSettings(path)
    }

    // 3. Inject only into Gboard -> Settings -> Clipboard (setting_clipboard.xml)
    try {
        document("res/xml/setting_clipboard.xml").use { doc ->
            val root = doc.documentElement
            val existing = root.childElements().firstOrNull {
                it.manifestAndroidAttribute("key") == CLIPBOARD_PREF_KEY
            }
            val pref = existing ?: doc.createElement(HEADER_PREFERENCE_TAG).also { root.appendChild(it) }
            pref.setManifestAndroidAttribute("persistent", "false")
            pref.setManifestAndroidAttribute("selectable", "true")
            pref.setManifestAndroidAttribute("key", CLIPBOARD_PREF_KEY)
            pref.setManifestAndroidAttribute("title", "@string/gboard_clipboard_history_title")
            pref.setManifestAndroidAttribute("summary", "@string/gboard_clipboard_history_summary")
            pref.setManifestAndroidAttribute("icon", "@drawable/ic_clipboard_history_entry")

            val intent = pref.childElements("intent").firstOrNull()
                ?: doc.createElement("intent").also { pref.appendChild(it) }
            intent.setManifestAndroidAttribute("action", "android.intent.action.MAIN")
            if (packageName.isNotBlank()) {
                intent.setManifestAndroidAttribute("targetPackage", packageName)
            }
            intent.setManifestAndroidAttribute("targetClass", Constants.CLIPBOARD_ACTIVITY_CLASS)
            Unit
        }
    } catch (_: Throwable) {
    }
    enforceClipboardIntentTargetPackage("res/xml/setting_clipboard.xml", packageName)
}

/**
 * Removes the clipboard history preference from a settings file if present.
 */
context(context: ResourcePatchContext)
private fun removeClipboardPrefFromSettings(path: String): Unit = with(context) {
    try {
        document(path).use { doc ->
            val root = doc.documentElement
            val elements = root.childElements().flatMap { parent ->
                if (parent.tagName == "androidx.preference.PreferenceCategory") {
                    parent.childElements()
                } else {
                    sequenceOf(parent)
                }
            }.filter {
                it.manifestAndroidAttribute("key") == CLIPBOARD_PREF_KEY
            }.toList()
            elements.forEach { it.parentNode?.removeChild(it) }
            Unit
        }
    } catch (_: Throwable) {
    }

    try {
        val file = get(path, false)
        if (!file.exists()) return@with
        val original = file.readText()
        val regex = Regex(
            """<[^>]*key="$CLIPBOARD_PREF_KEY"[^>]*>.*?</[^>]+>|<[^>]*key="$CLIPBOARD_PREF_KEY"[^>]*/>\s*""",
            RegexOption.DOT_MATCHES_ALL
        )
        val updated = regex.replace(original, "")
        if (updated != original) {
            file.writeText(updated)
        }
    } catch (_: Throwable) {
    }
}

/**
 * Forces `android:targetPackage` of the clipboard history `<intent>` to [packageName].
 *
 * The resource patcher does not consistently flush DOM attribute mutations of the decoded
 * preference documents back into the workspace, so the attribute is also enforced directly on
 * the raw XML. This keeps the entry resolvable regardless of whether the package rename patch
 * already ran or still has to run.
 */
context(context: ResourcePatchContext)
private fun enforceClipboardIntentTargetPackage(path: String, packageName: String): Unit = with(context) {
    if (packageName.isBlank()) return@with
    try {
        enforceIntentTargetPackage(get(path, false), packageName, "", Constants.CLIPBOARD_ACTIVITY_CLASS)
    } catch (_: Throwable) {
    }
}
