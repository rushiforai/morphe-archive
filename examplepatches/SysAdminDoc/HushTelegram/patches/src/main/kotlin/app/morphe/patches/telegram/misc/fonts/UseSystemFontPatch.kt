/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.fonts

import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.definitionReaches
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val SYSTEM_FONT = "$EXTENSION_PACKAGE/misc/SystemFont;"
internal const val ANDROID_UTILITIES = "Lorg/telegram/messenger/AndroidUtilities;"
internal const val GET_TYPEFACE = "$ANDROID_UTILITIES->getTypeface(Ljava/lang/String;)Landroid/graphics/Typeface;"
private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val STRING = "Ljava/lang/String;"
private const val TYPEFACE_CACHE = "$ANDROID_UTILITIES->typefaceCache:Ljava/util/Hashtable;"
private const val CACHE_HAS = "Ljava/util/Hashtable;->containsKey(Ljava/lang/Object;)Z"
private const val FROM_ASSET = "Landroid/graphics/Typeface;->createFromAsset(Landroid/content/res/AssetManager;Ljava/lang/String;)Landroid/graphics/Typeface;"
private const val BUILDER_FROM_ASSET = "Landroid/graphics/Typeface\$Builder;-><init>(Landroid/content/res/AssetManager;Ljava/lang/String;)V"

/** The bundled Roboto files the switch replaces, as Telegram names them. */
internal val ROBOTO_ASSETS = setOf("fonts/rmedium.ttf", "fonts/rmediumitalic.ttf", "fonts/ritalic.ttf",
    "fonts/rextrabold.ttf", "fonts/rcondensedbold.ttf", "fonts/rmono.ttf")

/**
 * Bundled files Telegram builds a face from itself, through Typeface.Builder at a weight it sets,
 * rather than through getTypeface: Telegram 13.0's Wallet, for card numbers and amounts. Wallet's
 * gram.ttf stays Telegram's own, since it carries the Gram currency sign no phone font has.
 */
internal val BUILT_ASSETS = setOf("fonts/rmono_var.ttf")
private const val BUILDER = "Landroid/graphics/Typeface\$Builder;"
private const val BUILD = "$BUILDER->build()Landroid/graphics/Typeface;"
private val CONST_STRINGS = setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)
private val CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16) + CONST_STRINGS

@Suppress("unused")
val useSystemFontPatch = bytecodePatch(
    name = "Use system font",
    description = "Draws Telegram's bold, italic and code text in your phone's font instead of the one built into the " +
        "app. Starts off. Turn it on in HushTelegram settings > Look and feel, then restart Telegram.",
    default = true,
) {
    category("Theme")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveSystemFont()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        site.insert(MutableMethod(ImmutableMethod.of(site.method)))
        site.built.forEach { it.insert(MutableMethod(ImmutableMethod.of(it.method))) }
        site.insert(site.method)
        // Later sites first, so an earlier insert doesn't move a later one in the same method.
        site.built.sortedByDescending { it.result }.forEach { it.insert(it.method) }
        enableStatus("useSystemFont")
    }
}

/**
 * A face Telegram builds from asset path register [asset], whose built face lands in register
 * [face] at instruction [result]. The hook goes right after it and swaps the face it hands on.
 */
internal class BuiltFontSite(val method: MutableMethod, val result: Int, val asset: Int, val face: Int) {
    fun insert(target: MutableMethod) {
        target.addInstructions(result + 1, """
            invoke-static {v$asset, v$face}, $SYSTEM_FONT->built(Ljava/lang/String;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
            move-result-object v$face
        """)
    }
}

/** AndroidUtilities.getTypeface, which takes the asset path in [asset], and the faces built outside it. */
internal class SystemFontSite(val method: MutableMethod, val asset: Int, val built: List<BuiltFontSite> = emptyList()) {
    fun insert(target: MutableMethod) {
        val (result) = target.freeLocalsAt("Use system font", 0, 1, highest = 255)
        target.addInstructionsWithLabels(0, """
            invoke-static/range {v$asset .. v$asset}, $SYSTEM_FONT->typeface(Ljava/lang/String;)Landroid/graphics/Typeface;
            move-result-object v$result
            if-eqz v$result, :hush_stock
            return-object v$result
        """, ExternalLabel("hush_stock", target.getInstruction(0)))
    }
}

/**
 * Telegram draws regular text in the phone's font and loads every other face it uses from its
 * assets through AndroidUtilities.getTypeface, which keys typefaceCache by the path and builds the
 * face from that same file. bold() and every screen that wants medium, italic, extra bold, condensed
 * or monospace text name the file there, so one hook at its start covers them. A null answer runs
 * Telegram's own path, cache included.
 */
internal fun BytecodePatchContext.resolveSystemFont(): SystemFontSite {
    requireStatusMethod("useSystemFont")
    controlHook(SYSTEM_FONT, "typeface", listOf(STRING), TYPEFACE)

    val owner = tgMutableClassDefByOrNull(ANDROID_UTILITIES)
    controlShape(owner != null, "AndroidUtilities is missing")
    val loader = owner!!.methods.filter { it.origString() == GET_TYPEFACE }.controlSingle("asset font loader")
    controlShape(AccessFlags.STATIC.isSet(loader.accessFlags), "the asset font loader is no longer static")
    val body = loader.controlBody()
    val asset = loader.localRegisterCount()

    // The path is the cache key and the file every load opens.
    val keyed = body.filter { it.controlRef() == CACHE_HAS }
    controlShape(body.any { it.controlRef() == TYPEFACE_CACHE } && keyed.isNotEmpty() &&
        keyed.all { it.namedRegisters().getOrNull(1) == asset }, "the asset font loader no longer caches by the path it's given")
    val loads = body.filter { it.controlRef() == BUILDER_FROM_ASSET || it.controlRef() == FROM_ASSET }
    controlShape(loads.isNotEmpty() && loads.all { it.namedRegisters().lastOrNull() == asset },
        "the asset font loader no longer opens the path it's given")

    // Every screen that names one of the Roboto files hands it to this loader.
    val strays = mutableListOf<String>()
    forEachClassMentioning(Mention.anyOf(ROBOTO_ASSETS.map { Mention.string(it) })) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { method ->
            val methodBody = method.controlBody()
            if (methodBody.any { it.controlString() in ROBOTO_ASSETS } && methodBody.none { it.controlRef() == GET_TYPEFACE }) {
                strays += "${method.definingClass}->${method.name}"
            }
        }
    }
    controlShape(strays.isEmpty(), "a Roboto font is loaded outside getTypeface (${strays.take(3).joinToString()})")

    // Every method that names one of the files Telegram builds a face from itself does it through
    // a builder chain proved here; each gets its own hook right after the face is built.
    controlHook(SYSTEM_FONT, "built", listOf(STRING, TYPEFACE), TYPEFACE)
    val chains = mutableMapOf<String, List<BuiltChain>>()
    val unbuilt = mutableListOf<String>()
    forEachClassMentioning(Mention.anyOf(BUILT_ASSETS.map { Mention.string(it) })) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.forEach { method ->
            val methodBody = method.controlBody()
            if (methodBody.none { it.controlString() in BUILT_ASSETS }) return@forEach
            val found = methodBody.indices.filter { methodBody[it].controlRef() == BUILDER_FROM_ASSET }
                .mapNotNull { builtChain(method, it) }
            if (found.isEmpty()) unbuilt += "${method.definingClass}->${method.name}" else chains[method.toString()] = found
        }
    }
    controlShape(unbuilt.isEmpty(), "a Wallet font is built outside a known Typeface.Builder chain (${unbuilt.take(3).joinToString()})")
    val built = chains.flatMap { (key, found) ->
        val method = tgMutableClassDefBy(key.substringBefore("->")).methods.single { it.toString() == key }
        found.map { BuiltFontSite(method, it.result, it.asset, it.face) }
    }

    return SystemFontSite(loader, asset, built)
}

private class BuiltChain(val result: Int, val asset: Int, val face: Int)

/**
 * The Typeface.Builder chain started by the asset constructor at [start], when its path is a
 * [BUILT_ASSETS] constant: straight-line code that sets options on the same builder and then
 * builds it, with the path still in its register right after the face lands. Null for any other
 * asset; a changed chain for one of those files refuses.
 */
private fun builtChain(method: Method, start: Int): BuiltChain? {
    val body = method.controlBody()
    val (builder, _, path) = body[start].namedRegisters()
    val constant = (0 until start).lastOrNull { body[it].writesRegister(path) } ?: return null
    if (body[constant].opcode !in CONST_STRINGS || body[constant].controlString() !in BUILT_ASSETS) return null
    val name = "${method.definingClass}->${method.name}"
    var current = builder
    var at = start + 1
    var result = -1
    while (result < 0) {
        val step = body.getOrNull(at)
        val call = step?.call()
        when {
            step == null -> controlShape(false, "$name's font builder never builds")
            call?.toString() == BUILD && step.namedRegisters() == listOf(current) -> {
                controlShape(body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT, "$name's built font is dropped")
                result = at + 1
            }
            call != null && call.origDefiningClass == BUILDER && call.origReturnType == BUILDER &&
                step.opcode == Opcode.INVOKE_VIRTUAL && step.namedRegisters().first() == current -> {
                controlShape(body.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT, "$name's font builder loses its chain")
                current = body[at + 1].namedRegisters().single()
                at += 2
            }
            step.opcode in CONSTANTS && step.namedRegisters().single() != current -> at++
            else -> controlShape(false, "$name's font builder runs other code before building")
        }
    }
    val face = body[result].namedRegisters().single()
    val flow = ControlFlow.of(method)
    controlShape(face != path && flow.definitionReaches(constant, result, path), "$name's font path doesn't survive until the face is built")
    controlShape((start until result).all { flow.normal[it] == listOf(it + 1) } &&
        body.indices.none { it !in start until result && flow.normal[it].any { target -> target in start + 1..result } },
        "$name's font builder has another way in")
    controlShape(path <= 15 && face <= 15, "$name's font registers can't be passed on")
    return BuiltChain(result, path, face)
}

private fun Instruction.writesRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = namedRegisters().firstOrNull() ?: return false
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}
