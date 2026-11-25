package app.deviceinfo.patches.settings.resource

import app.morphe.patcher.patch.ResourcePatchContext
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Opens a `res/xml` `PreferenceScreen` resource document for editing, the same way
 * [app.deviceinfo.patches.shared.resource.androidManifest] opens `AndroidManifest.xml` - both
 * are just XML files inside the APK's resource tree, so the same `document(path)` API applies.
 */
fun ResourcePatchContext.preferenceScreen(
    path: String,
    block: Document.() -> Unit,
): Document = document(path).use { document ->
    document.apply(block)
}

/**
 * Removes the top-level `PreferenceCategory` whose `android:title` attribute equals
 * [titleReference] (e.g. `"@string/support_us"`), along with all of its child preferences.
 *
 * DeviceInfo's `settings.xml` gives none of its `PreferenceCategory` elements an `android:key`,
 * only a title resource reference, so matching by title is the only option here - stubbing
 * `SettingsActivity`'s bytecode instead would mean rewriting `PreferenceFragmentCompat`
 * inflation logic to hide one specific child, which is far more invasive than deleting the
 * category from the resource it is declared in.
 */
fun Document.removePreferenceCategory(titleReference: String) {
    val root = documentElement ?: return
    val categories = root.getElementsByTagName("PreferenceCategory")

    for (i in categories.length - 1 downTo 0) {
        val category = categories.item(i) as? Element ?: continue
        if (category.getAttribute("android:title") == titleReference) {
            category.parentNode.removeChild(category)
        }
    }
}

/**
 * Removes every preference element (any tag) whose `android:key` equals [key]. A no-op when the
 * key is already gone, e.g. because [removePreferenceCategory] dropped its whole category first.
 *
 * Only safe for keys whose `findPreference(key)` result the settings fragment null-checks - in
 * 3.4.4.0 every key lookup in its `onCreatePreferences` (`Lgi2;`) is followed by `if-eqz`.
 */
fun Document.removePreference(key: String) {
    val root = documentElement ?: return
    val elements = root.getElementsByTagName("*")

    for (i in elements.length - 1 downTo 0) {
        val element = elements.item(i) as? Element ?: continue
        if (element.getAttribute("android:key") == key) {
            element.parentNode.removeChild(element)
        }
    }
}
