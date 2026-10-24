/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.ui

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.isStatic
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.lookup.sameAs
import app.morphe.patches.tumblr.lookup.strings
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.enableCapability
import app.morphe.patches.tumblr.misc.extension.enableStatus
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.patchLog
import app.morphe.patches.tumblr.misc.extension.requireStatusMethod
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.EXTENSION_ROOT
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import app.morphe.util.extendsClass
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.NodeList

private const val PATCH = "Dark background color"
internal const val DARK_BACKGROUND = "$EXTENSION_PACKAGE/ui/DarkBackground;"
internal const val ACTIVITY_THEME_HOOK = "$DARK_BACKGROUND->onActivityTheme(Landroid/app/Activity;)V"
internal const val COMPOSE_THEME_HOOK = "$DARK_BACKGROUND->onComposeTheme(Landroid/content/res/Resources\$Theme;)V"
internal const val DESIGN_PAGE_HOOK = "$DARK_BACKGROUND->designPage(J)J"
internal const val DESIGN_PANEL_HOOK = "$DARK_BACKGROUND->designPanel(J)J"
internal const val DESIGN_FOOTER_HOOK = "$DARK_BACKGROUND->designFooter(J)J"

/** The Compose note of the footer under a post, the function that paints its background. */
internal const val POST_FOOTER_NOTE = "${FOOTER_CONTROLS}PostFooterSplitNotesCountContent ("

/** The style the patch adds. The extension's `DarkBackground.STYLE` looks it up by this name. */
internal const val DARK_BACKGROUND_STYLE = "HushTumblrDarkBackground"

/** Where the style goes. ARSCLib takes a resource's type from its file's name. */
internal const val DARK_BACKGROUND_STYLES = "res/values/styles.xml"

/**
 * The palette attributes that take the color: the screen behind everything (the window background
 * reads it), its dark twin, the card and second card surfaces, and the navigation bar, which Tumblr
 * paints from its theme right after setting it. The first and third are required, as every other
 * palette surface follows them.
 */
internal val DARK_BACKGROUND_ATTRIBUTES = listOf(
    "themePrimaryColor",
    "themePrimaryColorDark",
    "themeMainContentBackgroundColor",
    "themeSecondaryMainContentBackgroundColor",
    "themeNavigationBarColor",
)
private val REQUIRED_ATTRIBUTES = setOf("themePrimaryColor", "themeMainContentBackgroundColor")

/** A highlighted surface, which gets the color raised by [HIGHLIGHT_STEP] so it still stands apart. */
internal const val HIGHLIGHTED_ATTRIBUTE = "themeHighlightedContentBackgroundColor"
internal const val HIGHLIGHT_STEP = 0x0D

/** The framework's own background attribute, set too when Tumblr's styles name it. */
internal const val WINDOW_BACKGROUND_ATTRIBUTE = "android:colorBackground"

/**
 * The design system's surfaces, which Tumblr's newer layouts read in place of the palette attributes
 * above, that take the color. The Dark palette gives the first four one gray, `ds_colorGray95`
 * (#0d0d0d): the screen behind a design system page, the container behind content, and the side and
 * top menus. The last is the redesigned post card, the next gray up (`ds_colorGray90`, #1a1a1a). It
 * takes the color too, as the older card surface above does, since cards cover most of a feed.
 */
internal val DARK_FLAT_SURFACES =
    listOf("st_chrome", "st_content_mobile_container", "st_side_menu", "st_top_menu", "st_content_panel")

/**
 * The design system's surfaces that sit on a page, `ds_colorGray90` in the Dark palette as well: the
 * bar over a page, a panel on one and a dialog. They take the color raised by [HIGHLIGHT_STEP], so
 * each still stands apart from the page under it.
 */
internal val DARK_RAISED_SURFACES = listOf("st_chrome_mobile", "st_chrome_panel", "st_modal")

/**
 * The note Compose's compiler leaves in the design system's theme function, as far as its source
 * line, and the two grays above as the design system's own color list writes them.
 */
internal const val DESIGN_THEME_NOTE = "com.tumblr.compose.ds.DsTheme ("
internal const val DARK_PAGE_GRAY = 0xFF0D0D0DL
internal const val DARK_PANEL_GRAY = 0xFF1A1A1AL

/** The lightest a color may be, as relative luminance, so the palette's light text stays readable on it. */
private const val MAX_LUMINANCE = 0.05

/** The lightest gray [MAX_LUMINANCE] takes, for the option's advice. DarkBackgroundStyleTest holds it. */
internal const val LIGHTEST_ADMITTED_GRAY = "#3F3F3F"

/** Opaque black, as a color int. */
private const val BLACK = -0x1000000

private const val ACTIVITY = "Landroid/app/Activity;"
private const val CONTEXT = "Landroid/content/Context;"
private const val THEME_WRAPPER = "Landroid/view/ContextThemeWrapper;"
private const val CONFIGURATION = "Landroid/content/res/Configuration;"

/** The kept attribute class and the card surface attribute Tumblr's Compose colors read. */
private const val THEME_ATTRIBUTES = "Lcom/tumblr/themes/R\$attr;"
private const val CARD_ATTRIBUTE = "themeMainContentBackgroundColor"

/**
 * The color the Background color option asks for: black when it's blank, or the `#RRGGBB` given,
 * `#FFRRGGBB` too, as a color picker writes it. Null for anything else, a color that isn't opaque or
 * one too light for the palette's light text included.
 */
internal fun darkBackgroundColor(value: String?): Int? =
    parsedColor(value)?.takeIf { luminance(it) <= MAX_LUMINANCE }

/** The opaque color [value] gives, black when it's blank, before its lightness is judged. */
private fun parsedColor(value: String?): Int? {
    val hex = value?.trim()?.removePrefix("#").orEmpty()
    if (hex.isEmpty()) return BLACK
    if (hex.length != 6 && hex.length != 8) return null
    if (!hex.all { it.isDigit() || it.lowercaseChar() in 'a'..'f' }) return null
    if (hex.length == 8 && !hex.startsWith("ff", ignoreCase = true)) return null
    return (0xFF000000L or hex.takeLast(6).toLong(16)).toInt()
}

/** Why the Background color option refuses [value], in words the person patching can act on, or null. */
internal fun darkBackgroundProblem(value: String?): String? {
    val hex = value?.trim()?.removePrefix("#").orEmpty()
    val looksLikeAColor = (hex.length == 6 || hex.length == 8) && hex.all { it.isDigit() || it.lowercaseChar() in 'a'..'f' }
    return when {
        !looksLikeAColor && hex.isNotEmpty() ->
            "Background color \"$value\" isn't a color. Type it as a six-digit color code (#RRGGBB), like #121212, " +
                "or leave it blank for black."
        parsedColor(value) == null ->
            "Background color $value is see-through. Type a solid six-digit color code (#RRGGBB), like #121212."
        darkBackgroundColor(value) == null ->
            "Background color $value is too light for Tumblr's text to stay readable. Pick a darker color. " +
                "Grays up to $LIGHTEST_ADMITTED_GRAY work."
        else -> null
    }
}

/** [color] with [step] added to each channel, as far as white. */
internal fun raisedColor(color: Int, step: Int): Int {
    fun channel(shift: Int) = minOf(0xFF, (color shr shift and 0xFF) + step) shl shift
    return BLACK or channel(16) or channel(8) or channel(0)
}

/** WCAG 2.2's relative luminance of an opaque color. */
private fun luminance(color: Int): Double {
    fun linear(shift: Int): Double {
        val channel = (color shr shift and 0xFF) / 255.0
        return if (channel <= 0.04045) channel / 12.92 else Math.pow((channel + 0.055) / 1.055, 2.4)
    }
    return 0.2126 * linear(16) + 0.7152 * linear(8) + 0.0722 * linear(0)
}

private fun NodeList.elements(): List<Element> = (0 until length).mapNotNull { item(it) as? Element }

/**
 * Adds [DARK_BACKGROUND_STYLE] to Tumblr's default styles: each of [DARK_BACKGROUND_ATTRIBUTES] and
 * [DARK_FLAT_SURFACES] set to [color], [HIGHLIGHTED_ATTRIBUTE] and each of [DARK_RAISED_SURFACES] a
 * step lighter, and [WINDOW_BACKGROUND_ATTRIBUTE] when the file names it. A design system surface
 * no style in the file sets is left out. Each attribute is written the way the file's own styles
 * write it, so an app attribute keeps whatever package prefix the decoder gave it. The style has no
 * parent: it only goes over a theme that already has the rest. Refuses a file that already has the
 * style, or whose styles never set a required attribute.
 */
internal fun Document.addDarkBackgroundStyle(color: Int) {
    val resources = documentElement
    if (resources?.tagName != "resources") throw PatchException("$DARK_BACKGROUND_STYLES isn't a resources file")
    val styles = resources.getElementsByTagName("style").elements()
    if (styles.any { it.getAttribute("name") == DARK_BACKGROUND_STYLE }) {
        throw PatchException("$DARK_BACKGROUND_STYLES already has $DARK_BACKGROUND_STYLE")
    }
    val written = styles.flatMap { it.getElementsByTagName("item").elements() }.map { it.getAttribute("name") }.toSet()
    fun nameOf(attribute: String): String? = written.firstOrNull { name ->
        name == attribute || (!name.startsWith("android:") && name.substringAfter(':') == attribute)
    }

    val values = linkedMapOf<String, Int>()
    for (attribute in DARK_BACKGROUND_ATTRIBUTES) {
        val name = nameOf(attribute)
        if (name == null) {
            if (attribute in REQUIRED_ATTRIBUTES) {
                throw PatchException("$PATCH: no style in $DARK_BACKGROUND_STYLES sets $attribute")
            }
            continue
        }
        values[name] = color
    }
    val raised = raisedColor(color, HIGHLIGHT_STEP)
    nameOf(HIGHLIGHTED_ATTRIBUTE)?.let { values[it] = raised }
    for (surface in DARK_FLAT_SURFACES) nameOf(surface)?.let { values[it] = color }
    for (surface in DARK_RAISED_SURFACES) nameOf(surface)?.let { values[it] = raised }
    if (WINDOW_BACKGROUND_ATTRIBUTE in written) values[WINDOW_BACKGROUND_ATTRIBUTE] = color

    resources.appendChild(createElement("style").apply {
        setAttribute("name", DARK_BACKGROUND_STYLE)
        values.forEach { (name, value) ->
            appendChild(createElement("item").apply {
                setAttribute("name", name)
                textContent = "#%08x".format(value)
            })
        }
    })
}

/** The style the extension puts over a Dark Mode theme, in the color [background] answers. */
private fun darkBackgroundStylePatch(background: () -> Int) = resourcePatch {
    execute {
        // Patcher 2.0 decodes only the files a patch asks for: an undecoded file does not exist yet.
        decode(DARK_BACKGROUND_STYLES)
        if (!get(DARK_BACKGROUND_STYLES, false).exists()) {
            throw PatchException("$PATCH: Tumblr has no $DARK_BACKGROUND_STYLES")
        }
        document(DARK_BACKGROUND_STYLES).use { it.addDarkBackgroundStyle(background()) }
    }
}

/**
 * Puts the patch's style over Tumblr's Dark Mode palette while its switch is on: right after Tumblr
 * sets an activity's theme, and right after its Compose colors make the theme they read from.
 * `DarkBackground` checks the theme is Dark Mode's (its screen color is Tumblr's own dark one) and
 * leaves every other palette alone. The color is the Background color option's, written into the
 * style when patching.
 *
 * Tumblr's design system keeps its colors in code, one set per palette, so the Dark palette's set
 * also hands its two surface grays to `DarkBackground` as it's built (see [resolveDesignColors]).
 * A build that keeps them some other way gets a warning and the rest of the patch.
 */
@Suppress("unused")
val darkBackgroundPatch = bytecodePatch(
    name = PATCH,
    description = "Makes the background of Tumblr's Dark Mode palette black, which can save battery on OLED screens, or" +
        " another dark color you pick when patching. Other palettes stay as they are. Starts off. Turn it on in" +
        " Tumblr settings > HushTumblr > Interface.",
    default = true,
) {
    category("Interface")

    // Written into a style, so it's chosen when patching, not in HushTumblr's settings.
    val backgroundOption by colorOption(
        key = "backgroundColor",
        default = "#000000",
        title = "Background color",
        description = "The color the Dark Mode palette's background turns, as a six-digit color code (#RRGGBB), like " +
            "#121212. Leave it blank for black. Cards get the same color and highlighted parts a slightly lighter one. " +
            "Grays up to $LIGHTEST_ADMITTED_GRAY work, and lighter colors are refused so text stays readable.",
        required = false,
    ) { darkBackgroundColor(it) != null }
    val background = {
        darkBackgroundColor(backgroundOption)
            ?: throw PatchException(
                darkBackgroundProblem(backgroundOption) ?: "Background color $backgroundOption can't be used",
            )
    }

    dependsOn(settingsPatch, tumblrExtensionPatch, darkBackgroundStylePatch(background))
    compatibleWith(*AppCompatibilities.tumblr())

    execute {
        requireStatusMethod("darkBackground")
        requireStatusMethod("themeBackground")
        // Everything found and checked before any edit, so a refusal leaves the APK as it was.
        val hooks = resolveThemeHooks()
        val designColors = resolveDesignColors()
        // Only with the design colors hooked: the footer's hook only swaps the gray they hand out.
        val footer = designColors?.let { resolvePostFooterColor() }
        hooks.activity.addInstructions(
            hooks.activityIndex,
            "invoke-static/range { v${hooks.activityRegister} .. v${hooks.activityRegister} }, $ACTIVITY_THEME_HOOK",
        )
        hooks.compose.addInstructions(
            hooks.composeIndex,
            "invoke-static/range { v${hooks.composeRegister} .. v${hooks.composeRegister} }, $COMPOSE_THEME_HOOK",
        )
        designColors?.let { colors ->
            val initializer = mutableOf(colors.initializer)
            // Last first, so an earlier read's index still holds. A long takes its register and the next.
            for (read in colors.reads.sortedByDescending { it.index }) {
                initializer.addInstructions(
                    read.index,
                    "invoke-static/range { v${read.register} .. v${read.register + 1} }, ${read.hook}\n" +
                        "move-result-wide v${read.register}",
                )
            }
        }
        footer?.let { (method, read) ->
            mutableOf(method).addInstructions(
                read.index,
                "invoke-static/range { v${read.register} .. v${read.register + 1} }, ${read.hook}\n" +
                    "move-result-wide v${read.register}",
            )
        }
        enableCapability("themeBackground")
        enableStatus("darkBackground")
    }
}

/** The two places a theme gets the style, each as a method, the index the call goes in at, and the register it reads. */
internal class ThemeHooks(
    val activity: MutableMethod,
    val activityIndex: Int,
    val activityRegister: Int,
    val compose: MutableMethod,
    val composeIndex: Int,
    val composeRegister: Int,
)

/**
 * Finds where Tumblr sets an activity's theme and where its Compose colors make theirs, throwing
 * when either is missing, doubled or shaped differently.
 *
 * The activity side is the one instance method taking an activity and an int that calls the
 * activity's own `setTheme(int)` on its first parameter and then reads its class's companion
 * instance (Tumblr 46.5.0.109's palette helper, `J` on the theme companion). The parameter's class
 * must reach `android.app.Activity`. The call goes in right after `setTheme`, before the helper
 * repaints the navigation bar from the theme.
 *
 * The Compose side is the one `(Context, int)` constructor that wraps the context in a
 * `ContextThemeWrapper`, takes its theme, and reads the kept card surface attribute from it. The
 * call goes in right after the theme's `move-result-object`, before any color is read. Neither shape
 * can be an Object method. Found by reading Tumblr 46.5.0.109 (2026-10-11).
 */
internal fun BytecodePatchContext.resolveThemeHooks(): ThemeHooks {
    requireExtensionHook(PATCH, ACTIVITY_THEME_HOOK)
    requireExtensionHook(PATCH, COMPOSE_THEME_HOOK)
    val setters = mutableListOf<Method>()
    val composers = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.forEach { method ->
            if (method.setsActivityTheme()) setters += method
            if (method.makesComposeTheme()) composers += method
        }
    }

    val setter = setters.only(PATCH, "the method that sets an activity's theme from its palette")
    val activityType = setter.parameterTypes[0].toString()
    requireShape(PATCH, extendsClass(activityType, ACTIVITY),"$activityType, whose theme Tumblr sets, isn't an activity")
    val setterBody = setter.instructionList()
    val set = setterBody.indexOfFirst { it.isSetThemeOn(activityType) }
    val activityRegister = (setterBody[set] as FiveRegisterInstruction).registerC

    val composer = composers.only(PATCH, "the constructor that makes the theme Tumblr's Compose colors read")
    val composerBody = composer.instructionList()
    val asked = composerBody.withIndex().filter { (_, instruction) -> instruction.isThemeWrapperTheme() }
        .map { it.index }.only(PATCH, "the Compose colors' call for their theme")
    val answer = composerBody.getOrNull(asked + 1)
    requireShape(PATCH, answer?.opcode == Opcode.MOVE_RESULT_OBJECT, "the Compose colors' theme isn't kept in a register")

    return ThemeHooks(
        activity = mutableOf(setter),
        activityIndex = set + 1,
        activityRegister = activityRegister,
        compose = mutableOf(composer),
        composeIndex = asked + 2,
        composeRegister = (answer as OneRegisterInstruction).registerA,
    )
}

/** An instance `(activity, int)` method that calls `setTheme(int)` on its activity, then reads its companion. */
private fun Method.setsActivityTheme(): Boolean {
    if (isStatic() || returnType != "V" || parameterTypes.size != 2 || parameterTypes[1].toString() != "I") return false
    val activity = parameterTypes[0].toString()
    if (!activity.startsWith("L")) return false
    val body = instructionList()
    val set = body.indexOfFirst { it.isSetThemeOn(activity) }
    if (set < 0) return false
    val next = body.getOrNull(set + 1)
    return (body[set] as FiveRegisterInstruction).registerC == parameterRegisterNumber(0) &&
        next?.opcode == Opcode.SGET_OBJECT && next.fieldRef()?.type == definingClass
}

private fun Instruction.isSetThemeOn(activity: String): Boolean =
    opcode == Opcode.INVOKE_VIRTUAL && methodRef()?.let { call ->
        call.definingClass == activity && call.name == "setTheme" && call.hasShape(listOf("I"), "V")
    } == true

/** A `(Context, int)` constructor that makes a theme wrapper, asks it for its theme and reads the card surface attribute. */
private fun Method.makesComposeTheme(): Boolean {
    if (name != "<init>" || !hasShape(listOf(CONTEXT, "I"), "V")) return false
    val body = instructionList()
    return body.any { it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as? TypeReference)?.type == THEME_WRAPPER } &&
        body.any { it.isThemeWrapperTheme() } &&
        body.any { it.isCardAttribute() }
}

internal fun Instruction.isCardAttribute(): Boolean =
    opcode == Opcode.SGET && fieldRef()?.let { it.definingClass == THEME_ATTRIBUTES && it.name == CARD_ATTRIBUTE } == true

private fun Instruction.isThemeWrapperTheme(): Boolean =
    opcode == Opcode.INVOKE_VIRTUAL && methodRef()?.let { call ->
        call.definingClass == THEME_WRAPPER && call.name == "getTheme" && call.parameterTypes.isEmpty()
    } == true

/** One read of a surface gray: [hook] goes in at [index], on the long kept in [register] and the one after it. */
internal class DesignColorRead(val index: Int, val register: Int, val hook: String)

/** The static initializer that builds the Dark palette's design colors, and each read of a surface gray in it. */
internal class DesignColorHooks(val initializer: Method, val reads: List<DesignColorRead>)

/**
 * Finds where the Dark palette's design colors read their two surface grays, or answers null with a
 * warning when this build doesn't keep them the way 46.5.0.109 does. Null changes nothing: screens
 * drawn with the design system then keep Tumblr's grays, and the rest of the patch still applies.
 *
 * Tumblr's design system (`DsTheme`, found by [DESIGN_THEME_NOTE]) doesn't read a theme. Each palette
 * has a holder class whose static initializer builds its colors once from a shared list of fixed
 * colors, and the theme function picks a holder by palette. For the System palette it asks whether
 * the configuration is in night mode and takes the Dark palette's holder when it is, which is how
 * that holder is told from the others (`xw5` in 46.5.0.109, against `mpk` True Blue, `u8b`
 * Low-Contrast Classic, `lx8` Goth Rave and `ebf` Pride).
 *
 * The holder's initializer is straight-line: it calls a getter on the color list (`lw6`) and keeps
 * the long, over and over. A getter is one of ours when its field is the one the list's own
 * initializer fills from [DARK_PAGE_GRAY] or [DARK_PANEL_GRAY]. In 46.5.0.109 that's `lw6.y()` at
 * 37, 123, 284 and 288 (`Chrome.chrome`, the page behind a design system screen,
 * `Content.mobileContainer` and `Global`'s two menus) and `lw6.x()` at 39, 49, 113 and 292
 * (`Chrome.panel`, `Chrome.mobile`, `Content.panel` and `Global.modal`), the same eight surfaces
 * [DARK_FLAT_SURFACES] and [DARK_RAISED_SURFACES] name in the palette's style. One differs on
 * purpose: a layout's `st_content_panel` is a post card and takes the color, while Compose's
 * `Content.panel` is what the settings screens draw their bar and rows with
 * (`settingshub.impl.hub.c.b` and its siblings read `b05.g()`), so it takes the step up that keeps a
 * row apart from its page. Each hook goes right after the `move-result-wide` and writes its answer
 * back into the same pair of registers. Found by reading Tumblr 46.5.0.109 (2026-10-13).
 */
internal fun BytecodePatchContext.resolveDesignColors(): DesignColorHooks? {
    fun without(why: String): DesignColorHooks? {
        patchLog.warning("$PATCH: $why, so screens drawn with Tumblr's design system keep their own grays")
        return null
    }
    val themes = classDefByStrings(DESIGN_THEME_NOTE, StringComparisonType.STARTS_WITH)
        .filter { !it.type.startsWith(EXTENSION_ROOT) }
        .distinctBy { it.type }
        .flatMap { owner -> owner.methods.filter { method -> method.strings().any { it.startsWith(DESIGN_THEME_NOTE) } } }
    val theme = themes.singleOrNull()
        ?: return without("${themes.size} functions carry the design system theme's note instead of one")
    val holder = theme.nightColors()
        ?: return without("the design system's theme doesn't pick the System palette's colors by night mode in one place")
    val initializer = classDefByOrNull(holder.definingClass)?.methods?.singleOrNull { it.name == "<clinit>" }
        ?: return without("${holder.definingClass}, which holds the Dark palette's design colors, has no static initializer")
    val body = initializer.instructionList()
    if (initializer.implementation?.tryBlocks?.isNotEmpty() != false || body.any { it is OffsetInstruction }) {
        return without("${holder.definingClass} no longer builds the Dark palette's design colors in one straight run")
    }

    val grays = mutableMapOf<String, Long?>()
    val reads = body.indices.mapNotNull { at ->
        val getter = body[at].colorGetter() ?: return@mapNotNull null
        val kept = body.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_WIDE } ?: return@mapNotNull null
        val hook = when (grays.getOrPut(getter.toString()) { fixedColor(getter) }) {
            DARK_PAGE_GRAY -> DESIGN_PAGE_HOOK
            DARK_PANEL_GRAY -> DESIGN_PANEL_HOOK
            else -> return@mapNotNull null
        }
        DesignColorRead(at + 2, (kept as OneRegisterInstruction).registerA, hook)
    }
    if (reads.none { it.hook == DESIGN_PAGE_HOOK } || reads.none { it.hook == DESIGN_PANEL_HOOK }) {
        return without("${holder.definingClass} doesn't read both of the Dark palette's surface grays from the design system's color list")
    }
    // Only once there's somewhere to call them from: a call to a method the extension lacks would crash Tumblr.
    requireExtensionHook(PATCH, DESIGN_PAGE_HOOK)
    requireExtensionHook(PATCH, DESIGN_PANEL_HOOK)
    return DesignColorHooks(initializer, reads)
}

/**
 * Finds where the footer under a post reads the color it paints itself with, or answers null with
 * a warning, which leaves the footer Tumblr's gray and changes nothing else.
 *
 * The footer is a Compose function ([POST_FOOTER_NOTE]) that reads the design system's
 * `Content.panel` and hands it straight to the background modifier, a static
 * `(Modifier, long, Shape)` call answering the modifier's type. The patch hands the Dark palette's
 * `Content.panel` a step up from the picked color for the settings rows, which left the footer a
 * shade lighter than the card above it. The hook goes right after the `move-result-wide`,
 * before the modifier takes the color, and writes its answer back into the same pair of registers.
 * In 46.8.1.100 that's `bjf.d`, `ts5.g()` at 176 and `androidx.compose.foundation.b.c` at 178.
 * Found by reading Tumblr 46.8.1.100 (2026-10-22).
 */
internal fun BytecodePatchContext.resolvePostFooterColor(): Pair<Method, DesignColorRead>? {
    fun without(why: String): Pair<Method, DesignColorRead>? {
        patchLog.warning("$PATCH: $why, so the footer under a post keeps Tumblr's gray")
        return null
    }
    val footers = classDefByStrings(POST_FOOTER_NOTE, StringComparisonType.STARTS_WITH)
        .filter { !it.type.startsWith(EXTENSION_ROOT) }
        .distinctBy { it.type }
        .flatMap { owner -> owner.methods.filter { method -> method.strings().any { it.startsWith(POST_FOOTER_NOTE) } } }
    val footer = footers.singleOrNull() ?: return without("${footers.size} functions carry the post footer's note instead of one")
    val body = footer.instructionList()
    val reads = body.indices.mapNotNull { at ->
        if (body[at].colorGetter() == null) return@mapNotNull null
        val kept = body.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT_WIDE } as? OneRegisterInstruction
            ?: return@mapNotNull null
        body.getOrNull(at + 2)?.takeIf { it.isBackgroundOf(kept.registerA) } ?: return@mapNotNull null
        DesignColorRead(at + 2, kept.registerA, DESIGN_FOOTER_HOOK)
    }
    val read = reads.singleOrNull()
        ?: return without("the post footer hands ${reads.size} design colors straight to a background instead of one")
    requireExtensionHook(PATCH, DESIGN_FOOTER_HOOK)
    return footer to read
}

/** A static `(modifier, long, shape)` call answering the modifier's type, with the long in [register] and the one after. */
private fun Instruction.isBackgroundOf(register: Int): Boolean {
    if (opcode != Opcode.INVOKE_STATIC) return false
    val call = methodRef() ?: return false
    val types = call.parameterTypes.map(CharSequence::toString)
    if (types.size != 3 || types[1] != "J" || !types[0].startsWith("L") || !types[2].startsWith("L") || call.returnType != types[0]) return false
    val five = this as FiveRegisterInstruction
    return five.registerCount == 4 && five.registerD == register && five.registerE == register + 1
}

/**
 * The holder the design system's theme takes its colors from in night mode: the one static call
 * with no arguments that follows a night mode question and its `if-eqz`, answering a type the theme
 * function also takes as a parameter (its own colors argument). Null unless there's exactly one.
 */
private fun Method.nightColors(): MethodReference? {
    val body = instructionList()
    val taken = parameterTypes.map(CharSequence::toString).filter { it.startsWith("L") }
    return body.indices.mapNotNull { at ->
        val asked = body[at].takeIf { it.opcode == Opcode.INVOKE_STATIC }?.methodRef() ?: return@mapNotNull null
        if (!asked.hasShape(listOf(CONFIGURATION), "Z")) return@mapNotNull null
        val answer = body.getOrNull(at + 1)?.takeIf { it.opcode == Opcode.MOVE_RESULT } as? OneRegisterInstruction
        val test = body.getOrNull(at + 2)?.takeIf { it.opcode == Opcode.IF_EQZ } as? OneRegisterInstruction
        if (answer == null || test == null || answer.registerA != test.registerA) return@mapNotNull null
        val night = body.getOrNull(at + 3)?.takeIf { it.opcode == Opcode.INVOKE_STATIC }?.methodRef()
        val kept = body.getOrNull(at + 4)?.opcode == Opcode.MOVE_RESULT_OBJECT
        night?.takeIf { kept && it.parameterTypes.isEmpty() && it.returnType in taken }
    }.singleOrNull()
}

/** The no-argument getter of a long this instruction calls on an object, or null for anything else. */
private fun Instruction.colorGetter(): MethodReference? {
    val alone = when (opcode) {
        Opcode.INVOKE_VIRTUAL -> (this as FiveRegisterInstruction).registerCount == 1
        Opcode.INVOKE_VIRTUAL_RANGE -> (this as RegisterRangeInstruction).registerCount == 1
        else -> false
    }
    return methodRef()?.takeIf { alone && it.parameterTypes.isEmpty() && it.returnType == "J" }
}

/**
 * The fixed color [getter] hands out, as its class wrote it: the getter only returns a static long
 * field of its class, and the class's initializer fills that field once from a `const-wide` passed
 * through a static `(J)J` call (the color's constructor). Null for a getter of any other shape.
 */
private fun BytecodePatchContext.fixedColor(getter: MethodReference): Long? {
    val owner = classDefByOrNull(getter.definingClass) ?: return null
    val read = owner.methods.singleOrNull { it.sameAs(getter) }?.instructionList() ?: return null
    if (read.size != 2 || read[0].opcode != Opcode.SGET_WIDE || read[1].opcode != Opcode.RETURN_WIDE) return null
    val field = read[0].fieldRef()?.takeIf { it.definingClass == owner.type } ?: return null
    val filled = owner.methods.singleOrNull { it.name == "<clinit>" }?.instructionList() ?: return null
    val stored = filled.indices.singleOrNull { at ->
        filled[at].opcode == Opcode.SPUT_WIDE &&
            filled[at].fieldRef()?.let { it.definingClass == owner.type && it.name == field.name } == true
    } ?: return null
    val written = filled.getOrNull(stored - 3)?.takeIf { it.opcode in WIDE_CONSTANTS } as? WideLiteralInstruction
    val made = filled.getOrNull(stored - 2)?.takeIf { it.opcode == Opcode.INVOKE_STATIC }?.methodRef()
    val kept = filled.getOrNull(stored - 1)?.opcode == Opcode.MOVE_RESULT_WIDE
    return written?.wideLiteral?.takeIf { kept && made?.hasShape(listOf("J"), "J") == true }
}

private val WIDE_CONSTANTS = setOf(Opcode.CONST_WIDE, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE_HIGH16)
