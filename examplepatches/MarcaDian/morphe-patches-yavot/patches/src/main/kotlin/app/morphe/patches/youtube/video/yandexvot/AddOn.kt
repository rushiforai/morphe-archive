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
import com.android.tools.smali.dexlib2.AccessFlags
import org.w3c.dom.Document
import org.w3c.dom.Element

/**
 * Class of the add-on manager of Morphe Patches, which declares the registration injection point.
 */
private const val ADD_ON_MANAGER_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/youtube/addon/AddOnManager;"

private const val ADD_ON_MANAGER_REGISTER_METHOD_NAME = "registerAddOns"

/**
 * Every method of Morphe Patches this add-on calls at runtime, by class descriptor.
 *
 * The add-on is compiled against the base bundle but shipped separately, so a base bundle that
 * moved or renamed one of these still patches cleanly and then throws `NoSuchMethodError` on the
 * device. Checking the methods here turns that into a patch time error naming what is missing.
 */
private val REQUIRED_HOST_METHODS = mapOf(
    "Lapp/morphe/extension/youtube/addon/AddOnApi;" to setOf(
        "addPlayerOverlayButtonsListener(Ljava/util/function/Consumer;)V",
        "addLegacyPlayerControlsListener(Ljava/util/function/Consumer;)V",
        "addNewVideoStartedListener(Ljava/lang/Runnable;)V",
        "addVideoIdListener(Ljava/util/function/Consumer;)V",
        "addVideoTimeListener(Ljava/util/function/LongConsumer;)V",
        "addVideoStateListener(Ljava/util/function/Consumer;)V",
        "createLegacyButton(Ljava/lang/String;Landroid/view/View;Ljava/lang/String;" +
                "Lapp/morphe/extension/shared/settings/BooleanSetting;" +
                $$"Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)" +
                "Lapp/morphe/extension/youtube/videoplayer/LegacyPlayerControlButton;",
    ),
    "Lapp/morphe/extension/youtube/patches/voiceovertranslation/VoiceOverTranslationPatch;" to setOf(
        "addOnTranslationStateChangeCallback(Ljava/lang/Runnable;)V",
        "isSessionEnabled()Z",
        "deactivateTranslation()V",
    ),
    "Lapp/morphe/extension/youtube/videoplayer/PlayerOverlayButton;" to setOf(
        "addButton(Landroid/view/View;Landroid/widget/ImageView;Ljava/lang/String;" +
                $$"Landroid/view/View$OnClickListener;Landroid/view/View$OnLongClickListener;)" +
                "Landroid/widget/ImageView;",
    ),
    "Lapp/morphe/extension/youtube/videoplayer/LegacyPlayerControlButton;" to setOf(
        "getDialogBackgroundColor()I",
    ),
    "Lapp/morphe/extension/youtube/patches/playback/speed/CustomPlaybackSpeedPatch;" to setOf(
        "getAdjustedBackgroundColor(Z)I",
    ),
    "Lapp/morphe/extension/shared/theme/ThemeUtils;" to setOf(
        "getAppForegroundColor()I",
    ),
    "Lapp/morphe/extension/shared/ui/SheetBottomDialog;" to setOf(
        "createMainLayout(Landroid/content/Context;Ljava/lang/Integer;)" +
                $$"Lapp/morphe/extension/shared/ui/SheetBottomDialog$DraggableLinearLayout;",
        "createSlideDialog(Landroid/content/Context;Landroid/view/View;I)" +
                $$"Lapp/morphe/extension/shared/ui/SheetBottomDialog$SlideDialog;",
    ),
    "Lapp/morphe/extension/shared/ui/CustomDialog;" to setOf(
        "create(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;" +
                "Landroid/widget/EditText;Ljava/lang/CharSequence;Ljava/lang/Runnable;" +
                "Ljava/lang/Runnable;Ljava/lang/CharSequence;Ljava/lang/Runnable;Z)" +
                "Landroid/util/Pair;",
    ),
)

/**
 * Fails the patch unless the base bundle declares every method of [REQUIRED_HOST_METHODS] as
 * public and static. A class that merely exists under the expected name is not enough: the
 * add-on calls these methods directly, so their signatures have to match as well.
 */
private fun BytecodePatchContext.checkHostCompatibility() {
    val missing = REQUIRED_HOST_METHODS.flatMap { (classDescriptor, requiredMethods) ->
        val hostClass = classDefByOrNull(classDescriptor)
            ?: return@flatMap listOf(classDescriptor.trim('L', ';').replace('/', '.'))

        requiredMethods.filter { required ->
            val method = hostClass.methods.firstOrNull {
                it.name + "(" + it.parameters.joinToString("") + ")" + it.returnType == required
            }
            method == null ||
                    !AccessFlags.PUBLIC.isSet(method.accessFlags) ||
                    !AccessFlags.STATIC.isSet(method.accessFlags)
        }
    }

    if (missing.isNotEmpty()) throw PatchException(
        "The installed Morphe Patches version is not compatible with this add-on. " +
                "Missing or changed: " + missing.sorted().joinToString()
    )
}

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
            """
                ##########################
                
                Could not find Morphe Add-on support files.
                
                This patch bundle requires Morphe official patches.
                Try again and include this patch bundle and recommended/preferred patches from Morphe official bundle.
                 
                ##########################
            """
        )

    context.checkHostCompatibility()

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
