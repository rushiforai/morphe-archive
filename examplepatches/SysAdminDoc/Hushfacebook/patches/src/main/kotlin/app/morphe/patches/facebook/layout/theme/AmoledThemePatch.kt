/*
 * Forked from:
 * https://github.com/andrewliang25/morphe-patches/blob/5db2e57e133aede5297c48b419168cf30fd89953/patches/src/main/kotlin/app/andrewliang/patches/facebook/amoledtheme/AmoledThemePatch.kt
 * Copyright 2026 Andrew Liang (GPL-3.0).
 *
 * Modified for Hushfacebook (Facebook), 2026.
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.facebook.misc.extension.facebookExtensionPatch
import app.morphe.patches.facebook.misc.extension.enableStatus
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.patches.facebook.misc.extension.requireLocals
import app.morphe.patches.facebook.misc.extension.requireParameterIntact
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element
import app.morphe.patches.facebook.misc.settings.settingsPatch

/** The largest value a channel can have and still count as a background. */
private const val MAX_CHANNEL = 0x2A

/**
 * The largest difference between the channels of a background. A grey has almost none. A dark green
 * or dark brown banner has much more, and it keeps its colour.
 */
private const val MAX_SPREAD = 8

/** The framework type of the one parameter FDS's dark check takes. */
private const val CONTEXT = "Landroid/content/Context;"

/** Opaque black, as the signed int that a colour holds. */
private const val BLACK = -0x1000000

/**
 * Facebook's text in dark mode, its PRIMARY_TEXT token on 577 and 580. A background colour has to
 * leave it readable on every surface AMOLED makes from that colour.
 */
private const val DARK_MODE_TEXT = 0xFFF2F4F7.toInt()

/** WCAG 2.2's AA contrast for text. */
private const val TEXT_CONTRAST = 4.5

/**
 * How far above the background colour the lightest surface AMOLED makes sits: an input's fill from
 * the lightest raised grey, AmoledTheme's MAX_RAISED_CHANNEL (0x42) less its FILL_SHIFT (0x0D).
 */
internal const val LIGHTEST_STEP = 0x42 - 0x0D

/** Gets the resolved colour and its token. Gives the colour to draw. */
internal const val APPLY = "Lapp/morphe/extension/facebook/theme/AmoledTheme;->apply(ILjava/lang/Object;)I"

/** Gets the status bar's colour and whether Facebook's theme is dark. Gives the colour to paint. */
internal const val STATUS_BAR = "Lapp/morphe/extension/facebook/theme/AmoledTheme;->statusBar(IZ)I"

/** The same for the navigation bar. */
internal const val NAVIGATION_BAR = "Lapp/morphe/extension/facebook/theme/AmoledTheme;->navigationBar(IZ)I"

/** The framework type of the window each bar painter takes. */
private const val WINDOW = "Landroid/view/Window;"

/** The framework call that turns a colour string, such as `"#FF252728"`, into a colour. */
internal const val PARSE_COLOR = "Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I"

/** The extension call that replaces it. It has the same signature. */
internal const val PARSE_COLOR_DARK = "Lapp/morphe/extension/facebook/theme/AmoledTheme;->parseColor(Ljava/lang/String;)I"

/** The classes of the extension. Route four skips them, because the replacement calls the original. */
internal const val EXTENSION_PACKAGE = "Lapp/morphe/extension/"

private const val AMOLED = "Lapp/morphe/extension/facebook/theme/AmoledTheme;"

/** Facebook's answer for whether its dark mode is on goes through this on its way back. */
internal const val DARK_MODE_ANSWER = "Lapp/morphe/extension/facebook/theme/DarkMode;->answer(Z)Z"

/** The framework calls that read a colour resource, which route two's rewrites reach code through. */
internal const val CONTEXT_GET_COLOR = "Landroid/content/Context;->getColor(I)I"
internal const val RESOURCES_GET_COLOR = "Landroid/content/res/Resources;->getColor(I)I"
internal const val RESOURCES_GET_THEMED_COLOR =
    "Landroid/content/res/Resources;->getColor(ILandroid/content/res/Resources\$Theme;)I"
internal const val TYPED_ARRAY_GET_COLOR = "Landroid/content/res/TypedArray;->getColor(II)I"

/**
 * The static method of [owner] that stands in for the framework call [framework]: same name and
 * parameters, with the object a virtual call was made on in front. `Color.parseColor` is static
 * itself and has nothing in front.
 */
internal fun standIn(owner: String, framework: String): String {
    val receiver = framework.substringBefore("->")
    val call = framework.substringAfter("->")
    return if (framework == PARSE_COLOR) {
        "$owner->$call"
    } else {
        "$owner->${call.substringBefore("(")}($receiver${call.substringAfter("(")}"
    }
}

/**
 * Where AMOLED sends each framework colour call: route four's `Color.parseColor`, and the reads of
 * a colour resource, which in light mode give a black route two wrote back as Facebook's colour.
 */
internal val AMOLED_COLOUR_CALLS: Map<String, String> =
    listOf(PARSE_COLOR, CONTEXT_GET_COLOR, RESOURCES_GET_COLOR, RESOURCES_GET_THEMED_COLOR, TYPED_ARRAY_GET_COLOR)
        .associateWith { standIn(AMOLED, it) }

/**
 * Route two's table for the extension, which the resource half writes and the bytecode half puts
 * in AmoledTheme.routeTwoColours: each colour resource it wrote black over, with Facebook's colour.
 */
internal var routeTwoRestores = ""

/**
 * The colour the Background colour option asks for (issue #34): black when it's blank, or the
 * `#RRGGBB` given, `#FFRRGGBB` too, as a colour picker writes it. Null for anything else: a colour
 * that isn't opaque, or one so light that Facebook's dark-mode text would fall under 4.5:1 on the
 * lightest surface AMOLED makes from it.
 */
internal fun backgroundColour(value: String?): Int? {
    val hex = value?.trim()?.removePrefix("#").orEmpty()
    if (hex.isEmpty()) return BLACK
    if (hex.length != 6 && !(hex.length == 8 && hex.startsWith("ff", ignoreCase = true))) return null
    if (!hex.all { it.isDigit() || it.lowercaseChar() in 'a'..'f' }) return null
    val colour = (0xFF000000L or hex.takeLast(6).toLong(16)).toInt()
    return colour.takeIf { contrast(DARK_MODE_TEXT, raised(colour, LIGHTEST_STEP)) >= TEXT_CONTRAST }
}

/** [colour] with [step] added to each channel, as far as white. The extension raises a card the same way. */
internal fun raised(colour: Int, step: Int): Int {
    fun channel(shift: Int) = minOf(0xFF, (colour shr shift and 0xFF) + step) shl shift
    return BLACK or channel(16) or channel(8) or channel(0)
}

/** WCAG 2.2's contrast ratio between two opaque colours. */
internal fun contrast(first: Int, second: Int): Double {
    val (light, dark) = listOf(luminance(first), luminance(second)).sortedDescending()
    return (light + 0.05) / (dark + 0.05)
}

private fun luminance(colour: Int): Double {
    fun linear(shift: Int): Double {
        val channel = (colour shr shift and 0xFF) / 255.0
        return if (channel <= 0.04045) channel / 12.92 else Math.pow((channel + 0.055) / 1.055, 2.4)
    }
    return 0.2126 * linear(16) + 0.7152 * linear(8) + 0.0722 * linear(0)
}

/**
 * Route two's new text for one colour resource: [written] (the background colour) over a dark grey,
 * or null to leave it. Facebook's own black stays black, as route three leaves a black literal.
 */
internal fun routeTwoValue(value: String, written: String): String? = when {
    !isDarkBackground(value) -> null
    argb(value) == BLACK -> value
    else -> written
}

/**
 * True for a dark grey, which is what a background uses. False for a dark colour with a hue, which
 * is a banner and keeps its colour. The extension holds the same rule for the colours it gets.
 */
private fun isDarkNeutral(red: Int, green: Int, blue: Int): Boolean {
    val high = maxOf(red, green, blue)
    return high <= MAX_CHANNEL && high - minOf(red, green, blue) <= MAX_SPREAD
}

private const val DEFAULT_COLORS = "res/values/colors.xml"
private const val NIGHT_COLORS = "res/values-night/colors.xml"

/**
 * A colour reaches the screen by four routes, and this patch covers all four with one rule.
 *
 * The first route is a resolver: a component asks the design system, and the bytecode half hooks
 * the four methods that answer. The second is a resource: a view reads a colour by id, so no int
 * passes a hook, and the resource half below rewrites it. The third is a literal written in code,
 * which the bytecode half rewrites in place, except where a method hands it to a system bar: the bar
 * painters' hooks decide those, since they ask Facebook's theme. The fourth is a string that the
 * server sends, which the app parses with `Color.parseColor`. The bytecode half sends each of those
 * calls through the extension.
 *
 * The Video tab stays dark in light mode, from the same dark style and the same colour resources as
 * dark mode, so the extension also asks Facebook's own answer for dark mode ([hookDarkModeAnswer]).
 * In light mode routes one and four leave Facebook's colour, and the code's reads of a colour
 * resource get back what route two wrote black over ([routeTwoTable], [rerouteColourCalls]).
 *
 * Routes two, three and four match on the **value** or on a framework call, with no class, method
 * or resource name.
 * Facebook strips resource names and renames its classes about every two weeks, so a name is not an
 * anchor here. A value of this exact shape is a colour and nothing else.
 */
private fun amoledThemeResourcePatch(background: () -> Int) = resourcePatch {
    execute {
        val written = "#%08x".format(background())
        var changed = 0
        val rewritten = mutableMapOf<String, Int>()
        val rewrittenAtNight = mutableSetOf<String>()
        val references = mutableMapOf<String, String>()

        listOf(DEFAULT_COLORS, NIGHT_COLORS)
            .filter { get(it, false).exists() }
            .forEach { path ->
                document(path).use { document ->
                    val colors = document.getElementsByTagName("color")
                    for (index in 0 until colors.length) {
                        val color = colors.item(index) as? Element ?: continue
                        val name = color.getAttribute("name")
                        val value = color.textContent.trim()
                        if (path == DEFAULT_COLORS && value.startsWith("@color/")) references[name] = value.removePrefix("@color/")
                        val text = routeTwoValue(value, written) ?: continue
                        if (path == DEFAULT_COLORS) rewritten[name] = checkNotNull(argb(value)) else rewrittenAtNight += name
                        color.textContent = text
                        changed++
                    }
                }
            }

        check(changed > 0) { "No dark colour resource found, so the theme would stay grey" }

        routeTwoRestores = routeTwoTable(rewritten, rewrittenAtNight, references) { name ->
            resourceIds.getOrNull(ResourceType.COLOR, name) ?: decodedColourId(name)
        }
        check(routeTwoRestores.isNotEmpty()) {
            "No colour route two rewrote has a resource id, so light mode's Video tab would stay black"
        }
    }
}

/**
 * Route two's table for AmoledTheme.routeTwoColours: each default colour it wrote black over, with
 * the colour Facebook had there, and each default colour that only points at one of those, as
 * `"id=colour;..."` in hex and sorted by id.
 *
 * Facebook keeps its dark palette in the default configuration: the dark style points at it, and so
 * does the Video tab, which stays dark in light mode. In light mode the extension reads a black from
 * one of these as Facebook's colour again. A colour route two also wrote over at night is left out,
 * since there a black could be the night one, and so is one that was black already.
 */
internal fun routeTwoTable(
    rewritten: Map<String, Int>,
    rewrittenAtNight: Set<String>,
    references: Map<String, String>,
    id: (String) -> Long?,
): String {
    val restorable = rewritten.filter { (name, colour) -> name !in rewrittenAtNight && colour != BLACK }
    val pointing = references.mapNotNull { (name, target) ->
        restorable[target]?.takeIf { name !in rewrittenAtNight }?.let { name to it }
    }
    return (restorable + pointing).mapNotNull { (name, colour) -> id(name)?.let { it to colour } }
        .sortedBy { it.first }
        .joinToString(";") { (id, colour) -> "%x=%08x".format(id, colour) }
}

/**
 * The id in the name the resource decoder gives a colour whose name Facebook stripped, such as
 * `color_0x7f0601f4` for 0x7f0601f4. The patcher's own id table only knows names the APK carries,
 * and Facebook's dark palette carries none.
 */
internal fun decodedColourId(name: String): Long? =
    Regex("color_0x([0-9a-f]{8})").matchEntire(name)?.groupValues?.get(1)?.toLong(16)

/**
 * A resource colour's value as an int, for `#rgb`, `#argb`, `#rrggbb` and `#aarrggbb`, or null for
 * anything else, a reference such as `@color/foo` included.
 */
internal fun argb(value: String): Int? {
    val hex = value.trim().removePrefix("#")
    if (hex.length !in setOf(3, 4, 6, 8)) return null
    if (!hex.all { it.isDigit() || it.lowercaseChar() in 'a'..'f' }) return null

    // Widen #rgb and #argb to two digits for each channel.
    val wide = if (hex.length <= 4) hex.map { "$it$it" }.joinToString("") else hex
    return (if (wide.length == 6) "ff$wide" else wide).toLong(16).toInt()
}

/**
 * True when this resource value is an opaque dark grey. A reference such as `@color/foo` gives
 * false, and so does a translucent value, which is a scrim and not a background.
 */
private fun isDarkBackground(value: String): Boolean {
    val colour = argb(value) ?: return false
    if (colour ushr 24 != 0xFF) return false
    return isDarkNeutral((colour shr 16) and 0xFF, (colour shr 8) and 0xFF, colour and 0xFF)
}

@Suppress("unused")
val amoledThemePatch = bytecodePatch(
    name = "AMOLED black theme",
    description = "Makes Facebook's dark mode black, or a dark colour you pick, instead of dark grey. " +
        "Turn on dark mode in Facebook first.",
    default = false,
) {
    category("Interface")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.facebook())

    // Issue #34. Routes two and three write the colour into resources and code, so it's chosen
    // when patching, not in Hushfacebook's settings.
    val backgroundOption by colorOption(
        key = "backgroundColour",
        default = "#000000",
        title = "Background colour",
        description = "The colour dark mode's backgrounds take, as #RRGGBB. Cards and inputs take a lighter " +
            "step of it. Leave it blank for black. A colour too light for Facebook's white text is refused.",
        required = false,
    ) { backgroundColour(it) != null }
    val background = {
        backgroundColour(backgroundOption)
            ?: throw PatchException("Background colour $backgroundOption is not a dark #RRGGBB colour")
    }

    dependsOn(amoledThemeResourcePatch(background))

    dependsOn(facebookExtensionPatch)

    execute {
        // Facebook's own answer for whether its dark mode is on, which every route asks: the Video
        // tab stays dark in light mode, from the same dark style and colour resources.
        hookDarkModeAnswer()

        // Route one. Four methods and six returns. Each hook keeps the body of the method and
        // sends the value through the extension before the method returns it.
        hookColourResolvers(mig = APPLY, fds = APPLY)
        fillBackgroundColour(background())

        // The system bars. A tab's bar colour can come from a resolver route one doesn't reach, or
        // be written in code for both themes, so the methods that paint the bars ask the extension
        // first, with Facebook's answer for whether the theme is dark (issue #22).
        val darkCheck = fdsDarkCheck()
        hookStatusBarColour(darkCheck)
        hookNavigationBarColour(darkCheck)

        // Route three. The palette tables, the top bar of the feed and each Litho component that
        // draws its own chrome all write a colour instead of asking for one, so no resolver and no
        // resource reaches them.
        check(blackenColourLiterals(background()) > 0) { "No dark colour written in code, so the chrome would stay grey" }

        // Route four. The server sends some colours as strings, and the app parses them with
        // Color.parseColor. Each of those calls goes to the extension instead, and so does each
        // read of a colour resource, where light mode gets back what route two wrote black over.
        val rerouted = rerouteColourCalls(AMOLED_COLOUR_CALLS)
        check(rerouted.getValue(PARSE_COLOR) > 0) { "No call to Color.parseColor found, so server colours would stay grey" }
        check(rerouted.getValue(CONTEXT_GET_COLOR) > 0) {
            "No call to Context.getColor found, so light mode's Video tab would keep route two's black"
        }
        check(routeTwoRestores.isNotEmpty()) { "Route two's table is empty, so light mode's Video tab would stay black" }
        fillRouteTwoTable(routeTwoRestores)

        // React Native screens such as Marketplace home, whose colours come from their JavaScript
        // as ints on props, past every route.
        hookReactColours()

        enableStatus("amoledTheme")
    }
}

/**
 * Route one: the Mig dark scheme's resolver sends its colours to [mig], and the FDS resolvers send
 * theirs to [fds]: each resolver on FDSColors and the [fdsThemeResolver]. Both themes run it, AMOLED
 * from its execute block and Material You after it.
 */
internal fun BytecodePatchContext.hookColourResolvers(mig: String, fds: String) {
    DarkSchemeResolveFingerprint.method.hookColorReturns(tokenParameterIndex = 0, target = mig)
    hookFdsColorsResolvers(target = fds)
    fdsThemeResolver().hookColorReturns(tokenParameterIndex = 1, target = fds)
}

/**
 * The resolver of the view code, which takes a Context and the FDS token. It has a Redex name, thus
 * its descriptor comes from the wrapper in `FdsColorScheme` that calls it. It hands both on to the
 * [fdsThemeResolver], and its class holds FDS's dark check.
 */
internal fun BytecodePatchContext.fdsViewResolver(): MutableMethod {
    val resolverCall = FdsSchemeResolveFingerprint.instructionMatches[1].instruction
    val resolver = (resolverCall as ReferenceInstruction).reference as MethodReference

    // If Facebook moves the resolver into the wrapper, this reaches 1 caller and not 894.
    check(resolver.definingClass.toString() != FDS_COLOR_SCHEME) {
        "The FDS colour resolver is now inside FdsColorScheme. Find the seam again."
    }

    return mutableClassDefBy(resolver.definingClass.toString()).methods.single {
        it.name == resolver.name &&
            it.returnType == "I" &&
            it.parameterTypes.map(CharSequence::toString) ==
            resolver.parameterTypes.map(CharSequence::toString)
    }
}

/**
 * The FDS theme resolver: the one method the [fdsViewResolver] calls that answers an int, taking the
 * same Context and token. The view resolver only checks the context and returns its answer, and
 * most of the view code calls it directly, the code that makes the system bars' own views on
 * Android 15 and newer included: the navigation bar is made with NAV_BAR_BACKGROUND's colour from
 * here (on 577, through a static that returns its answer). So route one hooks this and not the
 * view resolver, and every colour the view resolver gave still goes through the hook, once.
 */
internal fun BytecodePatchContext.fdsThemeResolver(): MutableMethod {
    val viewResolver = fdsViewResolver()
    val calls = viewResolver.implementation!!.instructions
        .mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        .filter { it.returnType == "I" }
    val resolver = calls.singleOrNull() ?: throw PatchException(
        "The FDS view resolver calls ${calls.size} methods that answer an int, expected the theme resolver",
    )
    val parameters = viewResolver.parameterTypes.map(CharSequence::toString)
    if (resolver.parameterTypes.map(CharSequence::toString) != parameters) {
        throw PatchException("The FDS theme resolver $resolver doesn't take the view resolver's $parameters")
    }
    return mutableClassDefBy(resolver.definingClass.toString()).methods.single {
        it.name == resolver.name && it.returnType == "I" && it.parameterTypes.map(CharSequence::toString) == parameters
    }
}

/**
 * FDS's test for a dark theme, as a method descriptor: the one static method on the view resolver's
 * class that takes a Context and answers a boolean. It has a Redex name and no literal. The class's
 * own colour picker asks the same question before it takes a colour's `darkThemeColor`, and
 * SystemBarsController asks this method for the bar's icons.
 */
internal fun BytecodePatchContext.fdsDarkCheck(): String {
    val resolverClass = fdsViewResolver().definingClass
    val checks = classDefBy(resolverClass).methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Z" &&
            method.parameterTypes.map(CharSequence::toString) == listOf(CONTEXT)
    }
    val check = checks.singleOrNull() ?: throw PatchException(
        "The FDS view resolver's class has ${checks.size} static (Context) boolean methods, expected its one dark check",
    )
    return "${check.definingClass}->${check.name}($CONTEXT)Z"
}

/**
 * The method that paints the status bar: StatusBarUtil's one static `(Window, int)` method that
 * calls `Window.setStatusBarColor`. The other static `(Window, int)` method sets the bar's icons
 * and paints nothing.
 */
internal fun BytecodePatchContext.statusBarPainter(): MutableMethod {
    val painters = mutableClassDefBy(STATUS_BAR_UTIL).methods.filter { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/Window;", "I") &&
            method.implementation?.instructions?.any {
                (it as? ReferenceInstruction)?.reference?.toString() == SET_STATUS_BAR_COLOR
            } == true
    }
    return painters.singleOrNull() ?: throw PatchException(
        "StatusBarUtil has ${painters.size} static (Window, int) methods that call setStatusBarColor, expected one",
    )
}

/**
 * The method that paints the navigation bar: [NavigationBarPainterFingerprint], which has to match
 * one method only.
 */
internal fun BytecodePatchContext.navigationBarPainter(): MutableMethod {
    val painters = NavigationBarPainterFingerprint.matchAllOrNull().orEmpty()
    return painters.singleOrNull()?.method ?: throw PatchException(
        "${painters.size} static (Activity, Window, int) methods call setNavigationBarColor, expected one",
    )
}

/**
 * Sends the colour of the status bar through the extension method [target], first thing in the
 * [statusBarPainter]. [target] takes the colour and whether the theme is dark, and gives the colour
 * to paint: AmoledTheme.statusBar here, MaterialYouTheme.statusBar when Material You is in the build
 * without AMOLED.
 *
 * On Android 15 and newer the framework ignores `setStatusBarColor` for Facebook's target SDK, so
 * that method paints a view behind the bar as well. It remembers the last colour per window and
 * skips a colour it already painted. The hook goes in before that cache, so what it remembers is
 * what the extension answered. The extension recolours only in the dark theme, [darkCheck]
 * answering for the window's context, because light mode asks the same tokens for the same dark
 * greys.
 */
internal fun BytecodePatchContext.hookStatusBarColour(darkCheck: String, target: String = STATUS_BAR) =
    statusBarPainter().hookBarColour("Status bar colour", window = 0, colour = 1, darkCheck, target)

/**
 * The same for the [navigationBarPainter], whose window and colour are its second and third
 * parameters. [target] is AmoledTheme.navigationBar here, MaterialYouTheme.navigationBar when
 * Material You is in the build without AMOLED.
 */
internal fun BytecodePatchContext.hookNavigationBarColour(darkCheck: String, target: String = NAVIGATION_BAR) =
    navigationBarPainter().hookBarColour("Navigation bar colour", window = 1, colour = 2, darkCheck, target)

/**
 * Puts the bar hook first in this painter: the colour in parameter [colour] goes through [target]
 * with [darkCheck]'s answer for the context of the window in parameter [window].
 *
 * `invoke` names its registers in four bits, so the window and the colour are copied down into two
 * locals first, and the answer goes back into the colour's own parameter register.
 */
private fun MutableMethod.hookBarColour(what: String, window: Int, colour: Int, darkCheck: String, target: String) {
    requireLocals(what, 2)
    addInstructions(
        0,
        """
            move-object/from16 v0, p$window
            invoke-virtual { v0 }, $WINDOW->getContext()Landroid/content/Context;
            move-result-object v0
            invoke-static { v0 }, $darkCheck
            move-result v0
            move/from16 v1, p$colour
            invoke-static { v1, v0 }, $target
            move-result p$colour
        """,
    )
}

/**
 * The methods that hand a colour to a system bar: each one that calls the [statusBarPainter], the
 * [navigationBarPainter] or a method of its class that passes a colour on to it, or makes the config
 * SystemBarsController applies, whose colour the controller hands to the status bar's painter.
 *
 * Route three leaves their colours as Facebook wrote them, for the painters' hooks to decide. The
 * Video tab keeps a dark surface in light mode as well, and writes its bars' #252728 into code for
 * both themes. A literal can't say which theme is on, and the hooks ask Facebook.
 */
internal fun BytecodePatchContext.systemBarColourMethods(): (Method) -> Boolean {
    fun Method.descriptor() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
    fun Method.calls(descriptors: Set<String>) = implementation?.instructions?.any {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() in descriptors
    } == true

    val status = statusBarPainter().descriptor()
    val navigation = navigationBarPainter()
    val passesOn = classDefBy(navigation.definingClass).methods
        .filter { it.parameterTypes.lastOrNull()?.toString() == "I" && it.calls(setOf(navigation.descriptor())) }
    val painters = passesOn.map { it.descriptor() }.toSet() + navigation.descriptor() + status

    val applies = classDefBy(SYSTEM_BARS_CONTROLLER).methods.filter {
        it.parameterTypes.size == 2 && it.parameterTypes[0].toString() == WINDOW && it.calls(setOf(status))
    }
    val config = applies.singleOrNull()?.parameterTypes?.get(1)?.toString() ?: throw PatchException(
        "SystemBarsController has ${applies.size} (Window, config) methods that paint the status bar, expected one",
    )

    return { method ->
        method.calls(painters) || method.implementation?.instructions?.any {
            it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as? TypeReference)?.type == config
        } == true
    }
}

/**
 * Hooks every FDS colour resolver on `FDSColors`: each instance method answering an int that takes
 * the colour token and asks the Integer-answering source itself.
 *
 * <p>577 had two of them, one for Litho and one from a Context. 580 split the Litho one into a
 * thin wrapper and a second Context resolver, so a fingerprint per resolver matched the wrong one
 * or none. The token type is read off the source's own signature, the one static method answering
 * `Integer` from a Context, the token and a palette.
 */
internal fun BytecodePatchContext.hookFdsColorsResolvers(target: String) {
    val colors = mutableClassDefBy(FDS_COLORS)
    val source = colors.methods.singleOrNull { method ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Ljava/lang/Integer;" &&
            method.parameterTypes.size == 3 && method.parameterTypes[0].toString() == "Landroid/content/Context;"
    } ?: error("FDSColors has no single Integer colour source taking a Context, a token and a palette")
    val tokenType = source.parameterTypes[1].toString()

    val resolvers = colors.methods.filter { method ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "I" &&
            method.parameterTypes.any { it.toString() == tokenType } &&
            method.implementation?.instructions?.any { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                reference != null && reference.definingClass == FDS_COLORS && reference.returnType == "Ljava/lang/Integer;"
            } == true
    }
    check(resolvers.isNotEmpty()) { "No FDSColors resolver asks the Integer colour source" }
    resolvers.forEach { method ->
        method.hookColorReturns(
            tokenParameterIndex = method.parameterTypes.indexOfFirst { it.toString() == tokenType },
            target = target,
        )
    }
}

/**
 * Route three over the whole app: each dark grey written in code turns black, or the [background]
 * colour the option asks for, except in the [systemBarColourMethods]. The sweep reads every class
 * and rewrites only the classes that hold one, which takes about 30 seconds. Answers how many it
 * rewrote.
 */
internal fun BytecodePatchContext.blackenColourLiterals(background: Int = BLACK): Int {
    val handsToBar = systemBarColourMethods()
    val owners = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.methods.any { it.hasDarkColor() }) owners += classDef.type
    }
    return owners.sumOf { type ->
        mutableClassDefByOrNull(type)?.methods?.sumOf { if (handsToBar(it)) 0 else it.blackenDarkColors(background) } ?: 0
    }
}

/** True when this instruction writes an opaque dark grey. */
private fun Instruction.isDarkColor(): Boolean {
    if (this !is NarrowLiteralInstruction || this !is OneRegisterInstruction) return false
    if (narrowLiteral == BLACK || (narrowLiteral ushr 24) != 0xFF) return false
    return isDarkNeutral(
        (narrowLiteral shr 16) and 0xFF,
        (narrowLiteral shr 8) and 0xFF,
        narrowLiteral and 0xFF,
    )
}

/** The framework call this instruction makes, when it's one [rerouteColourCalls] may move. */
private fun Instruction.movableCall(): String? = when (opcode) {
    // Only calls that dispatch as before once the extension makes them. A super call inside an
    // override would come back to the override and never end.
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE ->
        (this as ReferenceInstruction).reference.toString()
    else -> null
}

/**
 * Route four and route two's read back, over the whole app: each call to a key of [calls] goes to
 * the extension method it maps to instead. Answers how many calls it sent, for each key.
 *
 * One sweep reads every class and rewrites only the classes that make one of the calls. The
 * extension is skipped, because its methods make the framework calls themselves.
 */
internal fun BytecodePatchContext.rerouteColourCalls(calls: Map<String, String>): Map<String, Int> {
    val owners = mutableSetOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PACKAGE)) return@classDefForEach
        if (classDef.methods.any { method -> method.implementation?.instructions?.any { it.movableCall() in calls } == true }) {
            owners += classDef.type
        }
    }
    val counts = calls.keys.associateWith { 0 }.toMutableMap()
    owners.forEach { type -> mutableClassDefByOrNull(type)?.methods?.forEach { it.rerouteColourCalls(calls, counts) } }
    return counts
}

/**
 * Sends each call to a key of [calls] in this method to the extension method it maps to, and counts
 * it in [counts].
 *
 * The stand-in is static, takes the object a virtual call was made on as its first parameter and
 * has the call's own parameters after it, so it reads the same registers in the same order and the
 * `move-result` that follows stays correct. A call in the range form stays in the range form,
 * because its registers can be above v15.
 */
internal fun MutableMethod.rerouteColourCalls(calls: Map<String, String>, counts: MutableMap<String, Int>) {
    val sites = (implementation ?: return).instructions.withIndex()
        .mapNotNull { (index, instruction) -> instruction.movableCall()?.takeIf { it in calls }?.let { Triple(index, instruction, it) } }

    sites.asReversed().forEach { (index, instruction, framework) ->
        val target = calls.getValue(framework)
        val call = when (instruction) {
            is RegisterRangeInstruction -> {
                val last = instruction.startRegister + instruction.registerCount - 1
                "invoke-static/range { v${instruction.startRegister} .. v$last }, $target"
            }
            is FiveRegisterInstruction -> {
                val registers = listOf(instruction.registerC, instruction.registerD, instruction.registerE,
                    instruction.registerF, instruction.registerG).take(instruction.registerCount)
                "invoke-static { ${registers.joinToString { "v$it" }} }, $target"
            }
            else -> error("$definingClass->$name: unexpected call form ${instruction.opcode}")
        }
        replaceInstruction(index, call)
        counts[framework] = counts.getValue(framework) + 1
    }
}

/** Puts the Background colour option's [colour] in AmoledTheme.backgroundColour, for routes one and four and the bars. */
internal fun BytecodePatchContext.fillBackgroundColour(colour: Int) {
    val stub = mutableClassDefBy(AMOLED).methods.singleOrNull {
        it.name == "backgroundColour" && it.parameterTypes.isEmpty() && it.returnType == "I"
    } ?: throw PatchException("AmoledTheme has no backgroundColour() for the Background colour option")
    stub.returnEarly(colour)
}

/** Puts route two's [table] in AmoledTheme.routeTwoColours, for light mode to read colours back. */
internal fun BytecodePatchContext.fillRouteTwoTable(table: String) {
    val stub = mutableClassDefBy(AMOLED).methods.singleOrNull {
        it.name == "routeTwoColours" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    } ?: throw PatchException("AmoledTheme has no routeTwoColours() for route two's table")
    stub.returnEarly(table)
}

/**
 * Sends each answer of Facebook's dark mode controller through [DARK_MODE_ANSWER], right before
 * [DarkModeFingerprint]'s method returns it. Facebook asks that method as each activity applies its
 * theme, and again after the setting or the system's night mode changes, so the extension always
 * has its latest answer. Both themes call this, and the second finds the hook already there.
 */
internal fun BytecodePatchContext.hookDarkModeAnswer() {
    val method = DarkModeFingerprint.method
    if (method.implementation!!.instructions.any { (it as? ReferenceInstruction)?.reference?.toString() == DARK_MODE_ANSWER }) {
        return
    }
    method.hookReturns("dark mode answer") { register -> "invoke-static { v$register }, $DARK_MODE_ANSWER" }
}

/** True when this method writes a dark grey. It only reads, thus it needs no proxy of the class. */
private fun Method.hasDarkColor(): Boolean =
    implementation?.instructions?.any { it.isDarkColor() } == true

/**
 * Replaces each dark grey that this method writes with black, or with [background]. Answers how
 * many it replaced.
 *
 * A `const-wide/32` carries its value as a narrow literal too, so a colour kept in a long matches.
 * It stays a `const-wide/32`: a narrow `const` in its place leaves the long's upper register
 * unset, and ART rejects the whole class ("register v0 has type IntegerConstant but expected
 * Long (Low Half)", a static initializer on 580 with every patch on).
 */
internal fun MutableMethod.blackenDarkColors(background: Int = BLACK): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .filter { it.value.isDarkColor() }
        .map { Triple(it.index, (it.value as OneRegisterInstruction).registerA, it.value.opcode) }

    sites.asReversed().forEach { (index, register, opcode) ->
        val black = when (opcode) {
            Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32 -> "const-wide/32 v$register, $background"
            else -> "const v$register, $background"
        }
        replaceInstruction(index, black)
    }
    return sites.size
}

/**
 * Sends each `int` that this method returns through the extension method [target], which takes
 * the colour and the colour token and returns a colour. The token is in parameter
 * [tokenParameterIndex]; the first declared parameter is index 0.
 *
 * The hooks go in from last to first, because an insert moves every later index.
 *
 * Both registers get a test. `invoke-static` has 4-bit operands, thus a register above v15
 * assembles into something else and the patch applies but does nothing.
 *
 * A `return` must not be a branch target. The new instructions go in before it, thus a jump onto
 * the `return` would miss them and lose a colour without an error.
 *
 * The token has to still be in its parameter's register at every return. The hook reads it there,
 * at the end of the method, and Facebook's code reuses a parameter's register once it's done with
 * it: a resolver that did would hand the extension some other object as the token, which verifies
 * just the same and recolours by the wrong token.
 */
internal fun MutableMethod.hookColorReturns(tokenParameterIndex: Int, target: String) {
    val tokenRegister = parameterRegisterNumber(tokenParameterIndex)

    check(tokenRegister < 16) {
        "$definingClass->$name: token register v$tokenRegister is out of invoke-static range"
    }
    requireParameterIntact("Colour token hook", tokenParameterIndex, returnSites("int to recolour").map { it.first })

    hookReturns("int to recolour") { register -> "invoke-static { v$register, v$tokenRegister }, $target" }
}

/**
 * Each `return` of this method, with the register it returns, checked for a hook before it: none
 * is a branch target, and each register fits `invoke-static`. [what] names what the method returns.
 */
private fun MutableMethod.returnSites(what: String): List<Pair<Int, Int>> {
    val implementation = checkNotNull(implementation) { "$definingClass->$name has no body" }
    val instructions = implementation.instructions.toList()

    val addresses = instructions.runningFold(0) { address, it -> address + it.codeUnits }
    val indexOfAddress = addresses.withIndex().associate { (index, address) -> address to index }
    val branchTargets = instructions.withIndex().mapNotNull { (index, instruction) ->
        if (instruction is OffsetInstruction) {
            indexOfAddress[addresses[index] + instruction.codeOffset]
        } else {
            null
        }
    }.toSet()

    val returns = instructions.withIndex()
        .filter { it.value.opcode == Opcode.RETURN }
        .map { it.index to (it.value as OneRegisterInstruction).registerA }

    check(returns.isNotEmpty()) { "$definingClass->$name returns no $what" }
    returns.forEach { (index, register) ->
        check(register < 16) {
            "$definingClass->$name: return register v$register is out of invoke-static range"
        }
        check(index !in branchTargets) {
            "$definingClass->$name: the return at index $index is a branch target"
        }
    }
    return returns
}

/**
 * Puts [call] (made on the returned register) and a `move-result` into it before each `return` of
 * this method, so what it returns is what the call answers. The hooks go in from last to first,
 * because an insert moves every later index.
 */
private fun MutableMethod.hookReturns(what: String, call: (register: Int) -> String) {
    returnSites(what).asReversed().forEach { (index, register) ->
        addInstructions(
            index,
            """
                ${call(register)}
                move-result v$register
            """,
        )
    }
}
