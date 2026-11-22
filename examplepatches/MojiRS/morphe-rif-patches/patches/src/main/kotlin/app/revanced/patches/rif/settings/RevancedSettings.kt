package app.revanced.patches.rif.settings

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fingerprint
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.revanced.patches.rif.ads.platinumAdSlotFixPatch
import app.revanced.patches.rif.shared.RIF_COMPATIBILITY
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val REVANCED_PREFS = "res/xml/revanced_preferences.xml"

// Name of our settings entry and the title bar of the screen it opens.
private const val SETTINGS_TITLE = "rif patches"

private const val SETTINGS_FRAGMENT = "app.revanced.extension.rif.RevancedSettingsFragment"

// Key of Patcheddit's settings entry in rif's root settings.
private const val PATCHEDDIT_ENTRY_KEY = "morphe_settings_entry"

/**
 * Shared framework patch: creates an empty "rif patches" preference screen and adds
 * a top-of-list entry that opens it. Feature patches depend on this and add their
 * own [PreferenceCategory][addRevancedPreferenceCategory] to the screen.
 *
 * The screen is displayed by our extension's RevancedSettingsFragment (which
 * extends rif's own base settings fragment), so it gets rif's native styling.
 */
val revancedSettingsResourcePatch = resourcePatch(
    description = "Adds a rif patches settings screen to rif's settings.",
) {
    compatibleWith(*RIF_COMPATIBILITY)

    execute {
        // Create the (initially empty) preference screen. rif's base fragment shows the
        // screen's android:title in the title bar, falling back to "rif is fun" without one.
        get(REVANCED_PREFS, false).writeText(
            """<?xml version="1.0" encoding="utf-8"?>
<PreferenceScreen android:title="$SETTINGS_TITLE" xmlns:android="http://schemas.android.com/apk/res/android" xmlns:app="http://schemas.android.com/apk/res-auto" />
""",
        )

        // Add our entry at the very top of the root settings list.
        document("res/xml/root_preferences.xml").use { doc ->
            val screen = doc.documentElement
            val entry = doc.createElement("Preference")
            entry.setAttribute("android:fragment", SETTINGS_FRAGMENT)
            entry.setAttribute("app:title", SETTINGS_TITLE)
            screen.insertBefore(entry, screen.firstChild)
        }
    }

    // Patcheddit adds its own styled entry near the top. Put ours just below it. Patch
    // order across bundles isn't guaranteed, so this runs in finalize, after every execute.
    finalize {
        document("res/xml/root_preferences.xml").use { doc ->
            val prefs = doc.getElementsByTagName("*")
            val all = (0 until prefs.length).map { prefs.item(it) as Element }
            val ours = all.firstOrNull { it.getAttribute("android:fragment") == SETTINGS_FRAGMENT }
            val theirs = all.firstOrNull {
                it.getAttribute("android:key") == PATCHEDDIT_ENTRY_KEY || it.getAttribute("app:key") == PATCHEDDIT_ENTRY_KEY
            }
            if (ours != null && theirs != null) {
                theirs.parentNode.insertBefore(ours, theirs.nextSibling)
            }
        }
    }
}

// rif's Application; we hook onCreate to hand the app Context to our extension so
// preference reads never rely on hidden-API ActivityThread reflection.
private val rifApplicationOnCreateFingerprint = fingerprint {
    custom { method, classDef ->
        classDef.type == "Lcom/andrewshu/android/reddit/RedditIsFunApplication;" &&
            method.name == "onCreate" &&
            method.parameterTypes.isEmpty()
    }
}

/**
 * Bytecode side of the settings framework: brings the extension into the app and
 * initializes its Context from Application.onCreate. Feature patches depend on this
 * so their settings reads work.
 */
val revancedSettingsPatch = bytecodePatch(
    description = "Initializes the rif patches settings framework.",
) {
    compatibleWith(*RIF_COMPATIBILITY)
    // Platinum crash fix, carried here so it comes with any of our patches.
    dependsOn(revancedSettingsResourcePatch, platinumAdSlotFixPatch)
    extendWith("extensions/extension.mpe")

    execute {
        rifApplicationOnCreateFingerprint.method.addInstructions(
            0,
            "invoke-static { p0 }, Lapp/revanced/extension/rif/Settings;->init(Landroid/content/Context;)V",
        )
    }
}

/**
 * Appends a titled `<PreferenceCategory>` (a subheader + its preferences) to the
 * shared rif patches settings screen. Call from a feature patch's resource patch
 * that depends on [revancedSettingsResourcePatch].
 */
internal fun ResourcePatchContext.addRevancedPreferenceCategory(
    title: String,
    buildPreferences: (doc: Document, category: Element) -> Unit,
) {
    document(REVANCED_PREFS).use { doc ->
        val category = doc.createElement("PreferenceCategory")
        category.setAttribute("app:title", title)
        buildPreferences(doc, category)
        doc.documentElement.appendChild(category)
    }
}

/**
 * Builds a `<CheckBoxPreference>` (default-on unless [default] is false), optionally with a
 * [summary] line and greyed out via [dependency].
 */
internal fun Document.checkBoxPreference(
    key: String,
    title: String,
    dependency: String? = null,
    summary: String? = null,
    default: Boolean = true,
): Element = createElement("CheckBoxPreference").apply {
    setAttribute("android:key", key)
    setAttribute("app:title", title)
    if (summary != null) setAttribute("app:summary", summary)
    setAttribute("android:defaultValue", default.toString())
    if (dependency != null) setAttribute("android:dependency", dependency)
}

/**
 * Builds an int setting shown as a slider with its value, moving in steps of [increment],
 * optionally greyed out via [dependency]. Uses the extension's StepSeekBarPreference (a
 * SeekBarPreference that snaps drags to its increment; needs the inline images patch's
 * SeekBar hook, so only use it from patches that depend on that).
 */
internal fun Document.seekBarPreference(
    key: String,
    title: String,
    min: Int,
    max: Int,
    increment: Int,
    default: Int,
    dependency: String? = null,
): Element = createElement("app.revanced.extension.rif.StepSeekBarPreference").apply {
    setAttribute("android:key", key)
    setAttribute("app:title", title)
    setAttribute("app:min", min.toString())
    setAttribute("android:max", max.toString())
    setAttribute("app:seekBarIncrement", increment.toString())
    setAttribute("app:showSeekBarValue", "true")
    setAttribute("android:defaultValue", default.toString())
    if (dependency != null) setAttribute("android:dependency", dependency)
}
