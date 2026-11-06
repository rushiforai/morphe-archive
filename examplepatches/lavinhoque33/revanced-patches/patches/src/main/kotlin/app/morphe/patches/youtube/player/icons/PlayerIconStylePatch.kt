/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3287
 * https://github.com/MorpheApp/morphe-patches/pull/3451
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 *
 * Modified by lavinhoque33, 2026-10-29
 */

package app.morphe.patches.youtube.player.icons

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.filePathOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.mapping.ResourceType
import app.morphe.patches.shared.mapping.getResourceId
import app.morphe.patches.shared.mapping.resourceMappingPatch
import app.morphe.patches.youtube.player.miniplayer.general.MiniplayerModernCloseButtonFingerprint
import app.morphe.patches.youtube.player.miniplayer.general.MiniplayerSetIconsFingerprint
import app.morphe.patches.youtube.utils.compatibility.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patches.youtube.utils.extension.sharedExtensionPatch
import app.morphe.patches.youtube.utils.patch.PatchList.PLAYER_ICON_STYLE
import app.morphe.patches.youtube.utils.playservice.is_20_49_or_greater
import app.morphe.patches.youtube.utils.playservice.versionCheckPatch
import app.morphe.patches.youtube.utils.settings.ResourceUtils.addPreference
import app.morphe.patches.youtube.utils.settings.settingsPatch
import app.morphe.util.ResourceGroup
import app.morphe.util.Utils.printWarn
import app.morphe.util.copyResources
import app.morphe.util.findInstructionIndicesReversed
import app.morphe.util.getReference
import app.morphe.util.indexOfFirstInstructionReversed
import app.morphe.util.inputStreamFromBundledResource
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element
import java.io.File
import java.util.logging.Logger
import java.util.zip.ZipFile
import javax.xml.parsers.DocumentBuilderFactory

// A style does not have to cover every icon, so its variants are copied only when bundled.
// Player button patches do not depend on playerIconStylePatch, the styles are only added when it is included.
private val iconStyleSuffixes = listOf(
    "_fluent",
    "_phosphor", "_phosphor_light", "_phosphor_fill", "_phosphor_duotone",
    "_ionicons",
    "_sharp"
)

private fun iconStyleVariants(resourceDirectory: String, baseNames: Array<out String>) =
    baseNames.flatMap { baseName -> iconStyleSuffixes.map { suffix -> "$baseName$suffix.xml" } }
        .filter { file ->
            inputStreamFromBundledResource(resourceDirectory, "drawable/$file")?.use { true } ?: false
        }

private val logger = Logger.getLogger(ResourcePatchContext::class.java.name)

/**
 * Names used by Morphe icon packs, by the base name this fork registers for the same button.
 * Such a pack names its files after Morphe's player icon style option, so it works unchanged.
 * A pack that supplies both names keeps the fork's own one.
 */
private val morpheIconNames = mapOf(
    "morphe_reload_video_button" to "morphe_reload_video",
    "morphe_fullscreen_video_scale_fit" to "revanced_fullscreen_video_scale_fit",
    "morphe_fullscreen_video_scale_stretch" to "revanced_fullscreen_video_scale_stretch",
    "morphe_fullscreen_video_scale_zoom" to "revanced_fullscreen_video_scale_zoom",
    "morphe_ic_sc_speed" to "morphe_player_speed",
    // Morphe names the state of the mute button, the fork names the volume icon it shows.
    "morphe_mute_video_button_on" to "morphe_player_volume_muted",
    "morphe_mute_video_button_off" to "morphe_player_volume_unmuted",
    "morphe_yt_download_button" to "morphe_player_download",
)

// The reverse direction, the icons of the included patches are copied by the fork's base name.
private val morpheIconNamesByBaseName = morpheIconNames.entries.associate { (morpheName, baseName) ->
    baseName to morpheName
}

/**
 * User provided icons of the Custom style, by the base name of the icon each one replaces.
 * Only the icons of the included patches are copied, so the file can have more than those.
 */
internal class CustomIcons(path: String) {
    private class Icon(val bytes: ByteArray, val png: Boolean)

    private val icons: Map<String, Icon>
    private val copied = mutableSetOf<String>()

    init {
        val source = File(path.trim())
        if (!source.exists()) throw PatchException("Custom icons file not found: ${source.absolutePath}")

        icons = readIconFiles(source)
            .groupBy { (name, _) -> name.substringBeforeLast('.') }
            .mapValues { (baseName, found) -> toIcon(baseName, found) }

        if (icons.isEmpty()) throw PatchException("No icons found in: ${source.absolutePath}")
    }

    fun copy(context: ResourcePatchContext, baseNames: Array<out String>) {
        baseNames.forEach { baseName ->
            val aliasName = morpheIconNamesByBaseName[baseName]
            val icon = icons[baseName] ?: aliasName?.let(icons::get) ?: return@forEach
            // A bitmap of the highest density, the system scales it down for the other densities.
            val file = if (icon.png) {
                context["res/drawable-xxxhdpi/${baseName}_custom.png"].also { it.parentFile.mkdirs() }
            } else {
                context["res/drawable/${baseName}_custom.xml"]
            }
            file.writeBytes(icon.bytes)

            copied += baseName
            // Both names are valid for this icon, so the unused one is not a misspelled file name.
            if (aliasName != null && icons.containsKey(aliasName)) {
                copied += aliasName
            }
        }
    }

    /**
     * Logs the icons no included patch asked for, usually a misspelled file name.
     */
    fun warnUnused() {
        val unused = icons.keys.filter { it !in copied }.sorted()
        if (unused.isNotEmpty()) {
            logger.warning("Custom icons not used by any included patch: ${unused.joinToString()}")
        }
    }

    private companion object {
        val PNG_SIGNATURE = byteArrayOf(0x89.toByte(), 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A)

        // Archives made on macOS carry a "._" metadata file next to every file.
        fun isIcon(name: String) =
            (name.endsWith(".xml") || name.endsWith(".png")) && !name.startsWith("._")

        /**
         * @return The file name and content of every icon in the zip file or folder.
         */
        fun readIconFiles(source: File): List<Pair<String, ByteArray>> {
            // A folder works too, which is easier than a zip file when patching with the CLI.
            if (source.isDirectory) {
                return source.walk()
                    .filter { it.isFile && isIcon(it.name) }
                    .map { it.name to it.readBytes() }
                    .toList()
            }

            return ZipFile(source).use { zip ->
                zip.entries().asSequence()
                    .filter { !it.isDirectory && isIcon(it.name.substringAfterLast('/')) }
                    .map { entry ->
                        entry.name.substringAfterLast('/') to zip.getInputStream(entry).use { it.readBytes() }
                    }.toList()
            }
        }

        fun toIcon(baseName: String, found: List<Pair<String, ByteArray>>): Icon {
            // Two files for one icon, either in both formats or in two folders, leave it unclear which one to use.
            if (found.size > 1) {
                throw PatchException(
                    "Custom icon $baseName is in the file more than once: ${found.joinToString { it.first }}"
                )
            }

            val (name, bytes) = found.single()
            val png = name.endsWith(".png")
            if (png) validatePng(name, bytes) else validateVector(name, bytes)

            return Icon(bytes, png)
        }

        fun validatePng(name: String, bytes: ByteArray) {
            // The signature is followed by the IHDR chunk, which starts with the width and height.
            if (bytes.size < 24 || !bytes.copyOfRange(0, 8).contentEquals(PNG_SIGNATURE)) {
                throw PatchException("Custom icon $name is not a PNG image")
            }

            fun int(offset: Int) =
                (0 until 4).fold(0) { value, i -> (value shl 8) or (bytes[offset + i].toInt() and 0xFF) }

            val width = int(16)
            val height = int(20)
            // The buttons are square, a different shape would be squeezed.
            if (width != height) {
                throw PatchException("Custom icon $name must be square, found ${width}x$height")
            }
        }

        fun validateVector(name: String, bytes: ByteArray) {
            val root = try {
                DocumentBuilderFactory.newInstance().apply {
                    isNamespaceAware = true
                    // Only the desktop parser knows this feature, the Android one does not resolve entities anyway.
                    runCatching { setFeature("http://apache.org/xml/features/disallow-doctype-decl", true) }
                }.newDocumentBuilder().parse(bytes.inputStream()).documentElement.tagName
            } catch (ex: Exception) {
                throw PatchException("Custom icon $name is not valid XML: ${ex.message}")
            }

            if (root != "vector" && root != "animated-vector") {
                throw PatchException("Custom icon $name must be a vector drawable, found <$root>")
            }
        }
    }
}

/**
 * Icons of the Custom player icon style, or null if the patch option is not set.
 */
internal var customPlayerIcons: CustomIcons? = null
    private set

// Resource directory by base name of the icons of the included patches.
// The player icon style patch copies their styles in its finalize block, once every patch has executed.
private val styledPlayerIcons = LinkedHashMap<String, String>()

/**
 * Copies the style variants and the custom icons of the given icons.
 */
internal fun ResourcePatchContext.copyIconStyles(
    resourceDirectory: String,
    baseNames: Array<out String>,
    customIcons: CustomIcons?,
) {
    copyResources(
        resourceDirectory,
        ResourceGroup("drawable", *iconStyleVariants(resourceDirectory, baseNames).toTypedArray())
    )
    customIcons?.copy(this, baseNames)
}

/**
 * Copies icons that have no bold variant.
 */
internal fun ResourcePatchContext.copyPlayerIcons(resourceDirectory: String, vararg baseNames: String) {
    copyResources(resourceDirectory, ResourceGroup("drawable", *baseNames.map { "$it.xml" }.toTypedArray()))
    copyPlayerIconStyles(resourceDirectory, *baseNames)
}

/**
 * Copies player button icons, the base and bold icons must exist.
 */
internal fun ResourcePatchContext.copyPlayerButtonIcons(resourceDirectory: String, vararg baseNames: String) {
    copyResources(
        resourceDirectory,
        ResourceGroup("drawable", *baseNames.flatMap { listOf("$it.xml", "${it}_bold.xml") }.toTypedArray())
    )
    copyPlayerIconStyles(resourceDirectory, *baseNames)
}

/**
 * Adds the style variants of the icons if the player icon style patch is included.
 * Called alone for an icon whose thin and bold icons are copied some other way.
 */
@Suppress("UnusedReceiverParameter")
internal fun ResourcePatchContext.copyPlayerIconStyles(resourceDirectory: String, vararg baseNames: String) {
    baseNames.forEach { styledPlayerIcons[it] = resourceDirectory }
}

internal fun customIconsOptionDescription(example: String) = """
    Zip file with icons to use as the 'Custom' icon style.

    Each icon is named after the icon it replaces, such as '$example'.
    An icon is a vector drawable (.xml), or a white square PNG image (.png, 96x96 pixels is recommended).
    Icons of Morphe icon packs are accepted too, their file names are matched to the same icon here.
    Icons missing from the file keep the 'Automatic' style.
"""

internal const val PLAYER_ICONS_RESOURCE_DIRECTORY = "youtube/playericons"

private const val APP_PLAYER_ICON_DRAWABLE =
    "app.morphe.extension.youtube.videoplayer.AppPlayerIconDrawable"

/**
 * An app icon, the name its original is moved to, and the wrapper that takes its place.
 */
private class AppPlayerIcon(val appName: String, val originalName: String, val wrapperClass: String)

private val appPlayerIcons = listOf(
    AppPlayerIcon(
        "yt_outline_experimental_player_full_enter_vd_theme_24",
        "morphe_yt_player_full_enter",
        "FullscreenEnter"
    ),
    AppPlayerIcon(
        "yt_outline_experimental_player_full_enter_alt_vd_theme_24",
        "morphe_yt_player_full_enter_alt",
        "FullscreenEnterAlt"
    ),
    AppPlayerIcon(
        "yt_outline_experimental_player_full_enter_portrait_vd_theme_24",
        "morphe_yt_player_full_enter_portrait",
        "FullscreenEnterPortrait"
    ),
    AppPlayerIcon(
        "yt_outline_experimental_player_full_exit_vd_theme_24",
        "morphe_yt_player_full_exit",
        "FullscreenExit"
    ),
    AppPlayerIcon(
        "yt_outline_experimental_player_full_exit_alt_vd_theme_24",
        "morphe_yt_player_full_exit_alt",
        "FullscreenExitAlt"
    ),
)

/** Other resource consumers need the original vector, not the runtime player-style wrapper. */
internal fun ResourcePatchContext.originalAppPlayerIconName(appName: String): String {
    val icon = appPlayerIcons.firstOrNull { it.appName == appName } ?: return appName

    return icon.originalName.takeIf { get("res/drawable/$it.xml").exists() } ?: appName
}

// Bitmap versions of the same icons, the bold player shows these. The wrapper falls back to the vector above.
private val appPlayerBitmapIcons = listOf(
    "yt_outline_experimental_player_full_enter_black_24" to "FullscreenEnter",
    "yt_outline_experimental_player_full_enter_alt_black_24" to "FullscreenEnterAlt",
    "yt_outline_experimental_player_full_enter_portrait_black_24" to "FullscreenEnterPortrait",
    "yt_outline_experimental_player_full_exit_black_24" to "FullscreenExit",
    "yt_outline_experimental_player_full_exit_alt_black_24" to "FullscreenExitAlt",
)

// Selectors the skip buttons show without the bold player, and the wrapper of their icons.
private val appSkipSelectors = listOf(
    "player_next" to "SkipNext",
    "player_prev" to "SkipPrevious",
)

// Every configuration of a resource type, such as drawable-xxhdpi for drawable.
private fun ResourcePatchContext.resourceDirectories(type: String) =
    get("res", false).listFiles { file ->
        file.isDirectory && file.name.startsWith(type)
    }.orEmpty()

/**
 * Replaces an app icon that exists only as density specific bitmaps with a wrapper.
 * A density specific bitmap wins over a default drawable, so every bitmap is removed.
 * An installed app can also have bitmaps in a split APK, such as the xxhdpi one, which this patch cannot remove.
 * The wrapper is therefore also filed under anydpi, which wins over every density.
 *
 * @param originalName Name to keep the original bitmaps under, or null to drop them.
 * @return false if the app has no such icon.
 */
internal fun ResourcePatchContext.wrapAppBitmapIcon(
    appName: String,
    wrapperClass: String,
    originalName: String? = null,
): Boolean {
    val bitmaps = resourceDirectories("drawable").flatMap { directory ->
        listOf("png", "webp").map { extension -> directory.resolve("$appName.$extension") }
    }.filter { it.exists() }
    if (bitmaps.isEmpty()) return false

    bitmaps.forEach { bitmap ->
        val directory = bitmap.parentFile.name
        if (originalName != null) {
            bitmap.copyTo(get("res/$directory/$originalName.${bitmap.extension}"), overwrite = true)
        }
        delete("res/$directory/${bitmap.name}")
    }

    val wrapper = appPlayerIconWrapper(wrapperClass)
    get("res/drawable/$appName.xml").writeText(wrapper)
    get("res/drawable-anydpi/$appName.xml").apply { parentFile.mkdirs() }.writeText(wrapper)
    return true
}

/**
 * @param appIcon The app icon the wrapper keeps for the default style, or null if the wrapper class names it.
 */
private fun appPlayerIconWrapper(wrapperClass: String, appIcon: String? = null): String {
    val drawable = appIcon?.let { " android:drawable=\"$it\"" }.orEmpty()
    return $$"""
    <?xml version="1.0" encoding="utf-8"?>
    <drawable xmlns:android="http://schemas.android.com/apk/res/android"
        class="$${APP_PLAYER_ICON_DRAWABLE}$$${wrapperClass}"$$drawable />
    """.trimIndent()
}

/**
 * Puts a wrapper around every icon of an app selector, which keeps its states.
 * The wrapper gets the app icon as android:drawable, since the icon differs per screen size.
 */
private fun ResourcePatchContext.wrapAppSelectorIcons(selectorName: String, wrapperClass: String) {
    resourceDirectories("drawable").filter { it.resolve("$selectorName.xml").exists() }.forEach { directory ->
        document("res/${directory.name}/$selectorName.xml").use { document ->
            val items = document.getElementsByTagName("item")
            for (i in 0 until items.length) {
                val item = items.item(i) as Element
                // The disabled item is a tinted <bitmap> child instead of an android:drawable attribute.
                val bitmap = item.getElementsByTagName("bitmap").item(0) as Element?
                val icon = item.getAttribute("android:drawable").ifEmpty {
                    bitmap?.getAttribute("android:src").orEmpty()
                }
                if (icon.isEmpty()) continue

                item.removeAttribute("android:drawable")
                bitmap?.let(item::removeChild)
                val disabled = if (item.getAttribute("android:state_enabled") == "false") "Disabled" else ""
                item.appendChild(document.createElement("drawable").apply {
                    setAttribute("class", $$"$${APP_PLAYER_ICON_DRAWABLE}$$${wrapperClass}$${disabled}")
                    setAttribute("android:drawable", icon)
                })
            }
        }
    }
}

/**
 * Replaces the app's fullscreen icons with wrappers, which keep the original icon for the default style.
 */
private fun ResourcePatchContext.wrapAppFullscreenIcons() {
    // The app loads these by resource id from code, so the wrapper replaces the resource itself.
    val wrapped = appPlayerIcons.filter { icon ->
        val appIcon = get("res/drawable/${icon.appName}.xml")
        // Targets before the bold player do not have these icons.
        if (!appIcon.exists()) return@filter false

        appIcon.copyTo(get("res/drawable/${icon.originalName}.xml"), overwrite = true)
        appIcon.writeText(appPlayerIconWrapper(icon.wrapperClass))
        true
    }.map { it.wrapperClass }

    // A bitmap wrapper falls back to the vector copy, so it is only safe where that copy exists.
    appPlayerBitmapIcons.filter { (_, wrapperClass) -> wrapperClass in wrapped }
        .forEach { (appName, wrapperClass) -> wrapAppBitmapIcon(appName, wrapperClass) }
}

/**
 * Without the bold player the settings button keeps the gear of its layout, which other screens share,
 * so only the button points to a wrapper. The wrapper keeps whatever icon the layout had.
 */
private fun ResourcePatchContext.wrapAppSettingsButtonIcon() {
    var settingsIcon: String? = null

    resourceDirectories("layout")
        .flatMap { it.listFiles().orEmpty().toList() }
        .filter { it.readText().contains("\"@id/player_overflow_button\"") }
        .forEach { layout ->
            document("res/${layout.parentFile.name}/${layout.name}").use { document ->
                val elements = document.getElementsByTagName("*")
                for (i in 0 until elements.length) {
                    val element = elements.item(i) as Element
                    if (element.getAttribute("android:id") != "@id/player_overflow_button") continue

                    val icon = element.getAttribute("android:src")
                    // Only the icon of the first layout goes into the wrapper, another icon stays as it is.
                    if (icon.isEmpty() || (settingsIcon != null && icon != settingsIcon)) continue

                    settingsIcon = icon
                    element.setAttribute("android:src", "@drawable/morphe_player_settings_app")
                }
            }
        }

    settingsIcon?.let {
        get("res/drawable/morphe_player_settings_app.xml").writeText(appPlayerIconWrapper("Settings", it))
    }
}

private const val EXTENSION_PLAY_PAUSE_ICONS =
    "Lapp/morphe/extension/youtube/videoplayer/PlayPauseIcons;"

// The cast button, which loads the icon of each cast state itself.
private const val MDX_ENTRY_POINT_BUTTON_CLASS =
    "Lcom/google/android/libraries/youtube/mdx/mediaroute/entrypoint/MdxEntryPointButton;"

private const val EXTENSION_PLAYER_BUTTON_ICONS =
    "Lapp/morphe/extension/youtube/videoplayer/PlayerButtonIcons;"

// The extension takes an ImageView, so only calls on these classes can be redirected to it.
private val imageViewClasses = listOf(
    "Landroid/widget/ImageView;",
    TOUCH_IMAGE_VIEW_CLASS,
)

private val drawableLoaderClasses = listOf(
    "Landroid/content/res/Resources;",
    "Landroid/content/Context;",
)

/**
 * @return The registers of the invoke instruction at the index, for an invoke-static with the same arguments.
 */
private fun MutableMethod.invokeRegisters(index: Int): String {
    val call = getInstruction<FiveRegisterInstruction>(index)
    return listOf(call.registerC, call.registerD, call.registerE, call.registerF, call.registerG)
        .take(call.registerCount)
        .joinToString { "v$it" }
}

/**
 * Routes the icons a class sets by resource id through the extension, which swaps in the style icon.
 * Calls with other icons keep their original behavior.
 */
private fun MutableClass.hookIconsSetFromCode() {
    methods.filter { it.implementation != null }.forEach { method ->
        method.hookSetImageResource()
        method.hookGetDrawable()
        method.hookIconRangeHelper()
    }
}

private fun MutableMethod.hookSetImageResource() {
    imageViewClasses.forEach { imageViewClass ->
        findInstructionIndicesReversed(
            methodCall(
                opcode = Opcode.INVOKE_VIRTUAL,
                definingClass = imageViewClass,
                name = "setImageResource",
                parameters = listOf("I")
            )
        ).forEach { index ->
            replaceInstruction(
                index,
                "invoke-static { ${invokeRegisters(index)} }, " +
                        "$EXTENSION_PLAYER_BUTTON_ICONS->setImageResource(Landroid/widget/ImageView;I)V"
            )
        }
    }
}

// Loads the icon by id to tint it before setting it. Same registers, same result type.
private fun MutableMethod.hookGetDrawable() {
    drawableLoaderClasses.forEach { loaderClass ->
        findInstructionIndicesReversed(
            methodCall(
                opcode = Opcode.INVOKE_VIRTUAL,
                definingClass = loaderClass,
                name = "getDrawable",
                parameters = listOf("I")
            )
        ).forEach { index ->
            replaceInstruction(
                index,
                "invoke-static { ${invokeRegisters(index)} }, $EXTENSION_PLAYER_BUTTON_ICONS->" +
                        "getDrawable(${loaderClass}I)Landroid/graphics/drawable/Drawable;"
            )
        }
    }
}

// A helper that loads the icon by id and adds its own effects, the style replaces its result.
// It returns nothing, so no move-result has to stay right after it.
private fun MutableMethod.hookIconRangeHelper() {
    findInstructionIndicesReversed(
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL_RANGE,
            returnType = "V",
            parameters = listOf("Landroid/widget/ImageView;", "I", "I", "I", "I", "I")
        )
    ).forEach { index ->
        val view = getInstruction<RegisterRangeInstruction>(index).startRegister + 1
        addInstruction(
            index + 1,
            "invoke-static { v$view, v${view + 1} }, " +
                    "$EXTENSION_PLAYER_BUTTON_ICONS->applyStyle(Landroid/widget/ImageView;I)Z"
        )
    }
}

/**
 * Hooks the icons the class of the fingerprint sets from code, or warns if the class is not found.
 */
private fun BytecodePatchContext.hookIconsSetFromCode(fingerprint: Fingerprint, description: String) {
    // A resource the fingerprint needs may be missing on some targets, the patcher then throws instead.
    val classDef = runCatching { fingerprint.classDefOrNull }.getOrNull()
    if (classDef == null) {
        printWarn("Player icon style: the $description are not found, their icons keep the default style.")
        return
    }

    classDef.hookIconsSetFromCode()
}

/**
 * Hooks the play, pause and replay icons, each state sets its content description before its icon.
 */
private fun BytecodePatchContext.hookPlayPauseIcons() {
    val play = getResourceId(ResourceType.STRING, "accessibility_play")
    val pause = getResourceId(ResourceType.STRING, "accessibility_pause")
    val replay = getResourceId(ResourceType.STRING, "accessibility_replay")
    val method = runCatching { PlayPauseButtonStateFingerprint.methodOrNull }.getOrNull()
    if (play == null || pause == null || replay == null || method == null) {
        printWarn("Player icon style: the play and pause button is not found, its icons keep the default style.")
        return
    }

    val states = setOf(play, pause, replay)

    method.apply {
        findInstructionIndicesReversed(
            methodCall(
                opcode = Opcode.INVOKE_VIRTUAL,
                definingClass = "Landroid/widget/ImageView;",
                name = "setImageDrawable"
            )
        ).forEach { index ->
            // Every state first sets its content description, which tells what the button shows.
            val stateIndex = indexOfFirstInstructionReversed(index) {
                this is WideLiteralInstruction && wideLiteral in states
            }
            if (stateIndex < 0) return@forEach
            val state = getInstruction<WideLiteralInstruction>(stateIndex).wideLiteral
            val call = getInstruction<FiveRegisterInstruction>(index)

            // The morph animations are animated vector drawables, the still icons are plain drawables.
            fun animated(): Boolean {
                val fieldIndex = indexOfFirstInstructionReversed(index) {
                    opcode == Opcode.IGET_OBJECT && (this as TwoRegisterInstruction).registerA == call.registerD
                }
                if (fieldIndex < 0) return false
                return getInstruction(fieldIndex).getReference<FieldReference>()?.type !=
                        "Landroid/graphics/drawable/Drawable;"
            }

            val hook = when (state) {
                play -> if (animated()) "setPauseToPlay" else "setPlay"
                pause -> if (animated()) "setPlayToPause" else "setPause"
                else -> "setReplay"
            }

            // The app may use the drawable register again after this call, so it is left untouched.
            replaceInstruction(
                index,
                "invoke-static { ${invokeRegisters(index)} }, $EXTENSION_PLAY_PAUSE_ICONS->$hook" +
                        "(Landroid/widget/ImageView;Landroid/graphics/drawable/Drawable;)V"
            )
        }
    }
}

private const val DRAWABLE_TYPE = "Landroid/graphics/drawable/Drawable;"

/**
 * Hooks the icon of the miniplayer's play, pause and replay button.
 * The setter receives the icon together with the content description of its state,
 * which tells the extension what it shows. Hooking it covers every caller.
 */
private fun BytecodePatchContext.hookMiniplayerActionIcons() {
    val setter = runCatching { MiniplayerSetIconsFingerprint.methodOrNull }.getOrNull()
    if (setter != null) {
        // The icon is the first parameter and the description the second, both set before the call.
        setter.addInstructions(
            0,
            "invoke-static { p1, p2 }, $EXTENSION_PLAY_PAUSE_ICONS->miniplayerIcon" +
                    "(${DRAWABLE_TYPE}I)$DRAWABLE_TYPE\n" +
                    "move-result-object p1"
        )
        return
    }

    // Targets without the setter set the icon in the method that picks the state of the button.
    val method = runCatching { MiniplayerActionButtonStateFingerprint.methodOrNull }.getOrNull()
    if (method == null) {
        printWarn(
            "Player icon style: the miniplayer play and pause button is not found, its icons keep the default style."
        )
        return
    }

    method.apply {
        val ownClass = definingClass

        findInstructionIndicesReversed {
            opcode == Opcode.INVOKE_VIRTUAL && getReference<MethodReference>()?.let { reference ->
                reference.definingClass == ownClass &&
                        reference.returnType == "V" &&
                        reference.parameterTypes.map { it.toString() } == listOf(DRAWABLE_TYPE, "I")
            } == true
        }.forEach { index ->
            val call = getInstruction<FiveRegisterInstruction>(index)
            val icon = call.registerD
            val description = call.registerE

            addInstructions(
                index,
                "invoke-static { v$icon, v$description }, $EXTENSION_PLAY_PAUSE_ICONS->miniplayerIcon" +
                        "(${DRAWABLE_TYPE}I)$DRAWABLE_TYPE\n" +
                        "move-result-object v$icon"
            )
        }
    }
}

/**
 * Finds where the close icon is in a register, the app tints it or hands it to the view right after loading it.
 *
 * @return Instruction index that uses the icon, and its register.
 */
private fun MutableMethod.closeIconLocation(): Pair<Int, Int>? {
    for (name in listOf("setTint", "setTintMode")) {
        val index = findInstructionIndicesReversed {
            opcode == Opcode.INVOKE_VIRTUAL && getReference<MethodReference>()?.let { reference ->
                reference.definingClass == DRAWABLE_TYPE && reference.name == name
            } == true
        }.firstOrNull()

        if (index != null) {
            return index to getInstruction<FiveRegisterInstruction>(index).registerC
        }
    }

    // A version that hands the icon on without tinting it, such as a shadow wrapper.
    val index = findInstructionIndicesReversed {
        getReference<MethodReference>()?.returnType == DRAWABLE_TYPE
    }.firstOrNull()
    if (index != null) {
        val result = instructions.getOrNull(index + 1)
        if (result?.opcode == Opcode.MOVE_RESULT_OBJECT) {
            return index + 1 to getInstruction<OneRegisterInstruction>(index + 1).registerA
        }
    }

    return null
}

/**
 * Hooks the icon of the miniplayer's close button, which the app tints right after loading it.
 */
private fun BytecodePatchContext.hookMiniplayerCloseIcon() {
    val method = runCatching { MiniplayerModernCloseButtonFingerprint.methodOrNull }.getOrNull()
        ?: runCatching { MiniplayerCloseButtonFallbackFingerprint.methodOrNull }.getOrNull()
    if (method == null) {
        printWarn("Player icon style: the miniplayer close button is not found, its icon keeps the default style.")
        return
    }

    val location = method.closeIconLocation()
    if (location == null) {
        printWarn("Player icon style: the miniplayer close icon is not found, its icon keeps the default style.")
        return
    }

    val (index, register) = location
    method.addInstructions(
        index,
        "invoke-static { v$register }, $EXTENSION_PLAYER_BUTTON_ICONS->miniplayerCloseIcon" +
                "($DRAWABLE_TYPE)$DRAWABLE_TYPE\n" +
                "move-result-object v$register"
    )
}

/**
 * Applies the style to the app's player buttons that get their icons from code.
 */
private val playerButtonIconStylePatch = bytecodePatch {
    dependsOn(sharedExtensionPatch, versionCheckPatch, resourceMappingPatch)

    execute {
        // The same icons are on screens outside the player, so only these classes are changed.
        hookIconsSetFromCode(PlayerOverlayControlsFingerprint, "player overlay controls")
        // Older targets do not have this loader.
        if (is_20_49_or_greater) {
            hookIconsSetFromCode(PlayerControlIconLoaderFingerprint, "player control icon loader")
        }
        hookIconsSetFromCode(PlayerCaptionsButtonFingerprint, "captions button icons")

        val castButtonClass = mutableClassDefByOrNull(MDX_ENTRY_POINT_BUTTON_CLASS)
        if (castButtonClass != null) {
            castButtonClass.hookIconsSetFromCode()
        } else {
            printWarn("Player icon style: the cast button is not found, its icons keep the default style.")
        }

        hookPlayPauseIcons()
        hookMiniplayerActionIcons()
        hookMiniplayerCloseIcon()
    }
}

/**
 * Adds the player icon style picker and applies the style to the app's own player buttons.
 */
@Suppress("unused")
val playerIconStylePatch = resourcePatch(
    PLAYER_ICON_STYLE.title,
    PLAYER_ICON_STYLE.summary,
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        versionCheckPatch,
        playerButtonIconStylePatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE)

    val customIcons by filePathOption(
        key = "customIcons",
        title = "Custom icons",
        description = customIconsOptionDescription("morphe_player_play.xml"),
        allowedExtensions = listOf("zip"),
    )

    execute {
        customPlayerIcons = customIcons?.takeIf { it.isNotBlank() }?.let(::CustomIcons)

        // The variant with the Custom entry is shown only when the user gave custom icons.
        // The names must not start with each other, the markers are matched as plain text.
        val styleSetting = if (customPlayerIcons == null) {
            "SETTINGS: PLAYER_ICON_STYLE_BUNDLED"
        } else {
            "SETTINGS: PLAYER_ICON_STYLE_WITH_CUSTOM"
        }
        addPreference(
            arrayOf(
                "PREFERENCE_SCREEN: PLAYER",
                "PREFERENCE_SCREENS: PLAYER_BUTTONS",
                styleSetting,
            ),
            PLAYER_ICON_STYLE
        )

        // The base icons are the Thin style, the app has no thin fullscreen icon of its own.
        copyPlayerIcons(PLAYER_ICONS_RESOURCE_DIRECTORY, "morphe_fullscreen_enter", "morphe_fullscreen_exit")

        wrapAppFullscreenIcons()

        // The app has its own icons for these in every style, so only the style variants are copied.
        copyPlayerIconStyles(
            PLAYER_ICONS_RESOURCE_DIRECTORY,
            "morphe_player_play",
            "morphe_player_pause",
            "morphe_player_replay",
            "morphe_player_next",
            "morphe_player_previous",
            "morphe_player_settings",
            "morphe_player_captions_on",
            "morphe_player_captions_off",
            "morphe_player_cast",
            // The minimal miniplayer's close button.
            "morphe_player_close",
        )

        // Older players show these selectors from the layout, the bold player sets its icons from code.
        appSkipSelectors.forEach { (selectorName, wrapperClass) ->
            wrapAppSelectorIcons(selectorName, wrapperClass)
        }

        wrapAppSettingsButtonIcon()
    }

    finalize {
        styledPlayerIcons.entries.groupBy({ it.value }, { it.key }).forEach { (resourceDirectory, baseNames) ->
            copyIconStyles(resourceDirectory, baseNames.toTypedArray(), customPlayerIcons)
        }
        styledPlayerIcons.clear()

        customPlayerIcons?.warnUnused()
    }
}
