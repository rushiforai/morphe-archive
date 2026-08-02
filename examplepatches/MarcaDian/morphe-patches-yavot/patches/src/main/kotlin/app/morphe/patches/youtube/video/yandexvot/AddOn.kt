/*
 * Add-on support code for the Yandex VoT bundle.
 *
 * An add-on bundle is loaded by the patcher in its own class loader, so it cannot reference
 * anything of the Morphe Patches bundle at patch time. Everything in this file therefore talks
 * to the base bundle through the patched app only:
 *
 * - Bytecode: a call to the add-on registration method is added to `AddOnManager.registerAddOns()`,
 *   which the Morphe Patches extension provides.
 * - Preferences: declared in the add-on preference file, which the Morphe settings patch merges
 *   into the Morphe settings and then removes.
 * - Strings, arrays and drawables: written into the app resources directly.
 */

package app.morphe.patches.youtube.video.yandexvot

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.util.forEachChildElement
import app.morphe.util.getNode
import app.morphe.util.inputStreamFromBundledResource
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Class of the add-on manager of Morphe Patches, which declares the registration injection point.
 */
private const val ADD_ON_MANAGER_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/youtube/addon/AddOnManager;"

private const val ADD_ON_MANAGER_REGISTER_METHOD_NAME = "registerAddOns"

/**
 * File the Morphe settings patch reads add-on preference declarations from.
 * Not a resource file, so a leftover declaration cannot break resource compilation.
 */
private const val ADD_ON_PREFERENCES_FILE_PATH = "morphe_addon_prefs.xml"

/**
 * Source locale folder of this bundle, mapped to the resource folder of the app.
 */
private val bundledResourceLocales = mapOf(
    "values" to "values",
    "values-ru-rRU" to "values-ru",
    "values-uk-rUA" to "values-uk",
)

/**
 * Adds a call to the registration method of this add-on to the add-on manager of Morphe Patches.
 *
 * Must be called from a finalize block, since the extension of the base bundle
 * is merged while its patches execute.
 *
 * @param registrationMethodDescriptor Descriptor of the static registration method of this add-on.
 */
context(context: BytecodePatchContext)
internal fun registerAddOn(registrationMethodDescriptor: String) {
    val addOnManagerClass = context.mutableClassDefByOrNull(ADD_ON_MANAGER_CLASS_DESCRIPTOR)
        ?: throw PatchException(
            "Add-on support is missing. The installed Morphe Patches version is too old for this add-on."
        )

    val registerMethod = addOnManagerClass.methods.firstOrNull {
        it.name == ADD_ON_MANAGER_REGISTER_METHOD_NAME && it.parameters.isEmpty()
    } ?: throw PatchException(
        "Could not find $ADD_ON_MANAGER_REGISTER_METHOD_NAME(). " +
                "The installed Morphe Patches version is not compatible with this add-on."
    )

    registerMethod.addInstruction(0, "invoke-static { }, $registrationMethodDescriptor")
}

/**
 * Declares preferences to add to the Morphe settings.
 *
 * @param afterKey Key of the Morphe preference to add the preferences after.
 * @param screenKey Key of the Morphe settings screen to add the preferences to,
 *                  used if no preference with [afterKey] exists.
 */
context(context: ResourcePatchContext)
internal fun addAddOnPreferences(
    vararg preferences: Preference,
    afterKey: String? = null,
    screenKey: String? = null,
) {
    val declarationFile = context[ADD_ON_PREFERENCES_FILE_PATH]
    if (!declarationFile.exists()) {
        declarationFile.parentFile?.mkdirs()
        declarationFile.writeText(
            "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n" +
                    "<morphe-add-on-preferences>\n</morphe-add-on-preferences>"
        )
    }

    context.document(ADD_ON_PREFERENCES_FILE_PATH).use { document ->
        val screenElement = document.createElement("screen")
        afterKey?.let { screenElement.setAttribute("after", it) }
        screenKey?.let { screenElement.setAttribute("key", it) }
        preferences.forEach { screenElement.appendChild(it.serialize(document)) }

        document.getNode("morphe-add-on-preferences").appendChild(screenElement)
    }
}

/**
 * Adds the strings and arrays bundled with this add-on to the app resources.
 */
context(context: ResourcePatchContext)
internal fun addBundledResources() {
    bundledResourceLocales.forEach { (sourceFolder, destinationFolder) ->
        arrayOf("strings", "arrays").forEach { resourceType ->
            val sourceStream = inputStreamFromBundledResource(
                "addresources",
                "$sourceFolder/youtube/$resourceType.xml"
            ) ?: return@forEach

            val destinationPath = "res/$destinationFolder/$resourceType.xml"
            val destinationFile = context[destinationPath]
            if (!destinationFile.exists()) {
                destinationFile.parentFile?.mkdirs()
                destinationFile.writeText(
                    "<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n</resources>"
                )
            }

            sourceStream.use { stream ->
                context.document(destinationPath).use { destinationDocument ->
                    val destinationResources = destinationDocument.getNode("resources")

                    context.document(stream).use { sourceDocument ->
                        sourceDocument.getNode("resources").forEachChildElement { element ->
                            destinationResources.appendChild(
                                destinationDocument.importNode(element, true)
                            )
                        }
                    }
                }
            }
        }
    }
}

/**
 * A preference of the Morphe settings.
 *
 * Mirrors the XML the preference classes of Morphe Patches generate,
 * which an add-on bundle cannot use.
 */
internal open class Preference(
    private val tag: String,
    private val key: String? = null,
    private val titleKey: String? = key?.let { "${it}_title" },
    private val summaryKey: String? = null,
    // Not named "attributes", which inside the element builder below
    // resolves to the attributes of the element itself.
    private val extraAttributes: Map<String, String> = emptyMap(),
    private val preferences: List<Preference> = emptyList(),
) {
    fun serialize(document: Document): Element = document.createElement(tag).apply {
        key?.let { setAttribute("android:key", it) }
        titleKey?.let { setAttribute("android:title", "@string/$it") }
        summaryKey?.let { setAttribute("android:summary", "@string/$it") }
        extraAttributes.forEach { (name, value) -> setAttribute(name, value) }
        preferences.forEach { appendChild(it.serialize(document)) }
    }
}

/**
 * How the preferences of a screen or category are sorted at runtime.
 * The sort type is part of the preference key.
 */
internal enum class Sorting(private val keySuffix: String) {
    BY_TITLE("_sort_by_title"),
    BY_KEY("_sort_by_key"),
    UNSORTED("");

    fun appendTo(key: String?) = if (key == null) null else key + keySuffix
}

internal fun preferenceScreen(
    key: String,
    titleKey: String = "${key}_title",
    summaryKey: String? = null,
    sorting: Sorting = Sorting.BY_TITLE,
    preferences: List<Preference>,
) = Preference(
    tag = "PreferenceScreen",
    key = sorting.appendTo(key),
    titleKey = titleKey,
    summaryKey = summaryKey,
    preferences = preferences,
)

internal fun noTitlePreferenceCategory(
    key: String,
    sorting: Sorting = Sorting.UNSORTED,
    preferences: List<Preference>,
) = Preference(
    tag = "app.morphe.extension.shared.settings.preference.NoTitlePreferenceCategory",
    key = sorting.appendTo(key),
    titleKey = null,
    preferences = preferences,
)

internal fun switchPreference(
    key: String,
    titleKey: String = "${key}_title",
    summary: Boolean = false,
) = Preference(
    tag = "SwitchPreference",
    key = key,
    titleKey = titleKey,
    summaryKey = if (summary) "${key}_summary" else null,
)

internal fun listPreference(
    key: String,
    entriesKey: String = "${key}_entries",
    entryValuesKey: String = "${key}_entry_values",
) = Preference(
    tag = "app.morphe.extension.shared.settings.preference.CustomDialogListPreference",
    key = key,
    extraAttributes = mapOf(
        "android:entries" to "@array/$entriesKey",
        "android:entryValues" to "@array/$entryValuesKey",
    ),
)

internal fun textPreference(key: String, inputType: String = "text") = Preference(
    tag = "app.morphe.extension.shared.settings.preference.ResettableEditTextPreference",
    key = key,
    summaryKey = "${key}_summary",
    extraAttributes = mapOf("android:inputType" to inputType),
)

internal fun seekBarPreference(key: String) = nonInteractivePreference(
    key = key,
    tag = "app.morphe.extension.shared.settings.preference.SeekBarPreference",
    selectable = true,
)

internal fun colorPickerPreference(key: String) = nonInteractivePreference(
    key = key,
    tag = "app.morphe.extension.shared.settings.preference.ColorPickerPreference",
    selectable = true,
)

internal fun nonInteractivePreference(
    key: String,
    tag: String = "Preference",
    selectable: Boolean = false,
) = Preference(
    tag = tag,
    key = key,
    summaryKey = "${key}_summary",
    extraAttributes = mapOf("android:selectable" to selectable.toString()),
)
