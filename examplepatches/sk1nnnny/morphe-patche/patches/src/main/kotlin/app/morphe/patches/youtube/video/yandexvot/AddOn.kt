/*
 * Add-on support code for the custom Morphe Patches bundle.
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
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.util.Collections
import java.util.IdentityHashMap

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

private val bundledResourcesMergedContexts =
    Collections.synchronizedSet(Collections.newSetFromMap(IdentityHashMap<ResourcePatchContext, Boolean>()))

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
            """
                ##########################
                
                Could not find Morphe Add-on support files.
                
                This patch bundle requires Morphe official patches.
                Try again and include this patch bundle and recommended/preferred patches from Morphe official bundle.
                 
                ##########################
            """
        )

    val registerMethod = addOnManagerClass.methods.firstOrNull {
        it.name == ADD_ON_MANAGER_REGISTER_METHOD_NAME &&
                it.returnType == "V" &&
                it.parameters.isEmpty() &&
                AccessFlags.PUBLIC.isSet(it.accessFlags) &&
                AccessFlags.STATIC.isSet(it.accessFlags)
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
            """
                <?xml version="1.0" encoding="utf-8"?>
                <morphe-add-on-preferences xmlns:android="http://schemas.android.com/apk/res/android">
                </morphe-add-on-preferences>
            """.trimIndent()
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
 * Deduplicates by resource `name` attribute so overriding existing Morphe strings never fails aapt2.
 */
context(context: ResourcePatchContext)
internal fun addBundledResources() {
    if (!bundledResourcesMergedContexts.add(context)) return

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
                    """
                        <?xml version="1.0" encoding="utf-8"?>
                        <resources xmlns:android="http://schemas.android.com/apk/res/android">
                        </resources>
                    """.trimIndent()
                )
            }

            sourceStream.use { stream ->
                context.document(destinationPath).use { destinationDocument ->
                    val destinationResources = destinationDocument.getNode("resources")
                    val existingByName = mutableMapOf<String, Element>()
                    destinationResources.forEachChildElement { existing ->
                        val name = existing.getAttribute("name")
                        if (name.isNotEmpty()) {
                            existingByName[name] = existing
                        }
                    }

                    context.document(stream).use { sourceDocument ->
                        sourceDocument.getNode("resources").forEachChildElement { element ->
                            val name = element.getAttribute("name")
                            if (name.isNotEmpty()) {
                                existingByName[name]?.let { destinationResources.removeChild(it) }
                            }
                            val imported = destinationDocument.importNode(element, true) as Element
                            destinationResources.appendChild(imported)
                            if (name.isNotEmpty()) {
                                existingByName[name] = imported
                            }
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
    titleKey: String? = "${key}_title",
    tag: String = "Preference",
    selectable: Boolean = false,
) = Preference(
    tag = tag,
    key = key,
    titleKey = titleKey,
    summaryKey = "${key}_summary",
    extraAttributes = mapOf("android:selectable" to selectable.toString()),
)
