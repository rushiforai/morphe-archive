/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.parameterRegister
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCall
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val BLACK_THEME = "$EXTENSION_PACKAGE/misc/BlackTheme;"
internal const val SPARSE_INT_ARRAY = "Landroid/util/SparseIntArray;"
internal const val SPARSE_PUT = "$SPARSE_INT_ARRAY->put(II)V"
private const val SPARSE_INIT = "$SPARSE_INT_ARRAY-><init>()V"
private const val STRING = "Ljava/lang/String;"
private const val FILE = "Ljava/io/File;"

/** Telegram's theme file reader takes the file, the built-in theme's asset and a wallpaper slot. */
internal val THEME_FILE_PARAMETERS = listOf(FILE, STRING, "[$STRING")

internal const val PATTERN_INTENSITY = "$BLACK_THEME->patternIntensity($SPARSE_INT_ARRAY" + "Ljava/lang/Object;I)I"

/**
 * Theme.createBackgroundDrawable(theme, picked wallpaper, colors, wallpaper file, link, file offset,
 * intensity, phase, default theme, previous theme, applying accent, motion, document, local), by type.
 */
internal val WALLPAPER_SHAPE = listOf(null, null, SPARSE_INT_ARRAY, FILE, STRING, "I", "I", "I", "Z", "Z", "Z", "Z",
    "Lorg/telegram/tgnet/TLRPC\$Document;", "Z")
internal const val WALLPAPER_PICKED = 1
internal const val WALLPAPER_COLORS = 2
internal const val WALLPAPER_INTENSITY = 6

@Suppress("unused")
val amoledBlackPatch = bytecodePatch(
    name = "AMOLED black",
    description = "Adds a switch, off by default, that turns the screens of Telegram's Night and Dark themes pure black and shows a patterned chat background's pattern over black. Message bubbles and pop-up menus keep the theme's colors. A change takes effect after Telegram restarts.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveBlackTheme()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        site.insert(MutableMethod(ImmutableMethod.of(site.method)))
        site.insertPattern(MutableMethod(ImmutableMethod.of(site.wallpaper)))
        writeStub(BLACK_THEME, "keyId", 1, """
            invoke-static {p0}, ${site.keyLookup}
            move-result p0
            return p0
        """)
        site.insert(site.method)
        site.insertPattern(site.wallpaper)
        enableStatus("amoledBlack")
    }
}

/** Telegram's theme file reader, the register its color set lives in, its key lookup, and the chat background builder. */
internal class BlackThemeSite(val method: MutableMethod, val returns: List<Int>, val colors: Int, val keyLookup: MethodReference, val wallpaper: MutableMethod) {
    /** The pattern's strength goes through the extension first, from the background builder's own parameters. */
    fun insertPattern(target: MutableMethod) {
        val (set, picked, strength) = target.freeLocalsAt("AMOLED black", 0, 3)
        target.addInstructions(0, """
            move-object/from16 v$set, ${target.parameterRegister(WALLPAPER_COLORS)}
            move-object/from16 v$picked, ${target.parameterRegister(WALLPAPER_PICKED)}
            move/from16 v$strength, ${target.parameterRegister(WALLPAPER_INTENSITY)}
            invoke-static {v$set, v$picked, v$strength}, $PATTERN_INTENSITY
            move-result v$strength
            move/from16 ${target.parameterRegister(WALLPAPER_INTENSITY)}, v$strength
        """)
    }

    fun insert(target: MutableMethod) {
        // From the last return up, so each index still names its return.
        for (at in returns.sortedDescending()) {
            val (asset, set) = target.freeLocalsAt("AMOLED black", at, 2)
            target.addInstructionsAtControlFlowLabel(at, """
                move-object/from16 v$asset, ${target.parameterRegister(1)}
                move-object/from16 v$set, v$colors
                invoke-static {v$asset, v$set}, $BLACK_THEME->loaded(Ljava/lang/String;$SPARSE_INT_ARRAY)V
            """)
        }
    }
}

/**
 * Telegram reads every theme's colors from a key=value file through one static method: Night and
 * Dark from the asset it's given, others from the file. Each key goes through one lookup to
 * Telegram's color id and lands in a new SparseIntArray, which the method returns. The hook sees that
 * set, with the asset name, on the way out, before any screen or accent reads it.
 */
internal fun BytecodePatchContext.resolveBlackTheme(): BlackThemeSite {
    requireStatusMethod("amoledBlack")
    controlHook(BLACK_THEME, "loaded", listOf(STRING, SPARSE_INT_ARRAY), "V")
    controlHook(BLACK_THEME, "keyId", listOf(STRING), "I")

    val readers = mutableListOf<MutableMethod>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.forEach { method ->
            if (method.returnType == SPARSE_INT_ARRAY && method.parameterTypes.map { it.toString() } == THEME_FILE_PARAMETERS) {
                val strings = method.controlBody().mapNotNull { it.controlString() }
                if ("WLS=" in strings && "WPS" in strings) readers += mutableClassDefBy(cls.type).methods.single { it.name == method.name &&
                    it.returnType == method.returnType && it.parameterTypes.map { p -> p.toString() } == THEME_FILE_PARAMETERS }
            }
        }
    }
    val reader = readers.controlSingle("theme file reader")
    controlShape(AccessFlags.STATIC.isSet(reader.accessFlags), "the theme file reader is no longer static")
    val body = reader.controlBody()

    // The asset parameter picks the built-in file.
    val asset = reader.parameterRegisterNumber(1)
    controlShape(body.any { it.isStaticCall(listOf(STRING), FILE) && it.namedRegisters() == listOf(asset) },
        "the theme file reader no longer opens the asset it's given")

    // One new color set, filled in place and returned on every way out.
    val created = body.indices.filter { body[it].opcode == Opcode.NEW_INSTANCE && body[it].controlRef() == SPARSE_INT_ARRAY }
        .controlSingle("theme color set")
    val colors = (body[created] as OneRegisterInstruction).registerA
    controlShape(body.getOrNull(created + 1)?.let { it.controlRef() == SPARSE_INIT && it.namedRegisters() == listOf(colors) } == true,
        "the theme color set is no longer built empty")
    val returns = body.indices.filter { body[it].opcode == Opcode.RETURN_OBJECT }
    controlShape(returns.isNotEmpty() && returns.all { body[it].namedRegisters() == listOf(colors) },
        "the theme file reader no longer returns its color set")
    controlShape(returns.all { reachingWrites(reader, colors, it) == setOf(created) },
        "the theme file reader can return something other than its color set")
    reader.requireParameterIntact("AMOLED black", 1, returns)

    // Every color goes in under the id one lookup gives its key.
    val puts = body.indices.filter { body[it].controlRef() == SPARSE_PUT && body[it].namedRegisters().first() == colors }
    val lookups = puts.mapNotNull { put ->
        val key = body[put].namedRegisters()[1]
        // The key's own result, with nothing writing the register between it and the put.
        val written = (put - 1 downTo 1).firstOrNull { body[it].opcode.setsRegister() && (body[it] as? OneRegisterInstruction)?.registerA == key }
        written?.takeIf { body[it].opcode == Opcode.MOVE_RESULT && body[it - 1].isStaticCall(listOf(STRING), "I") }?.let { body[it - 1].controlCall() }
    }
    val keyLookup = lookups.distinctBy { it.toString() }.controlSingle("theme key lookup")
    val lookupOwner = mutableClassDefByOrNull(keyLookup.definingClass.toString())
    val lookup = lookupOwner?.methods?.singleOrNull { it.name == keyLookup.name && it.parameterTypes.map { p -> p.toString() } == listOf(STRING) && it.returnType == "I" }
    controlShape(lookupOwner != null && lookup != null && AccessFlags.PUBLIC.isSet(lookupOwner.accessFlags) &&
        AccessFlags.PUBLIC.isSet(lookup.accessFlags) && AccessFlags.STATIC.isSet(lookup.accessFlags),
        "the theme key lookup can't be called from outside Telegram's theme code")

    // The chat background builder sits beside the reader and takes the pattern's strength as a parameter.
    controlHook(BLACK_THEME, "patternIntensity", listOf(SPARSE_INT_ARRAY, "Ljava/lang/Object;", "I"), "I")
    val wallpaper = mutableClassDefBy(reader.definingClass).methods.filter { m ->
        AccessFlags.STATIC.isSet(m.accessFlags) && m.parameterTypes.size == WALLPAPER_SHAPE.size &&
            WALLPAPER_SHAPE.indices.all { WALLPAPER_SHAPE[it] == null || WALLPAPER_SHAPE[it] == m.parameterTypes[it].toString() }
    }.controlSingle("chat background builder")
    controlShape(wallpaper.parameterTypes[WALLPAPER_PICKED].toString().let { it.startsWith("Lorg/telegram/") && it != wallpaper.parameterTypes[0].toString() },
        "the chat background builder no longer takes a picked wallpaper")
    controlShape(wallpaper.implementation!!.registerCount <= 256, "the chat background builder has too many registers to copy its parameters")
    controlShape(ControlFlow.of(wallpaper).normal.none { 0 in it }, "something jumps back to the start of the chat background builder")
    // The strength is read further down, so the answer reaches the pattern.
    val strength = wallpaper.parameterRegisterNumber(WALLPAPER_INTENSITY)
    controlShape(wallpaper.controlBody().any { strength in it.namedRegisters() }, "the chat background builder no longer reads the pattern's strength")

    return BlackThemeSite(reader, returns, colors, keyLookup, wallpaper)
}

private fun Instruction.isStaticCall(parameters: List<String>, result: String) =
    (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) &&
        controlCall()?.let { it.parameterTypes.map { p -> p.toString() } == parameters && it.returnType == result } == true

/** The writes of [register] that can reach instruction [at], along branches and handlers. */
private fun reachingWrites(method: Method, register: Int, at: Int): Set<Int> {
    val flow = ControlFlow.of(method)
    val predecessors = Array(flow.instructions.size) { mutableSetOf<Int>() }
    for (index in flow.instructions.indices) for (next in flow.normal[index] + flow.exceptional[index]) predecessors[next] += index
    val pending = ArrayDeque(predecessors[at])
    val seen = mutableSetOf<Int>()
    val writes = mutableSetOf<Int>()
    while (pending.isNotEmpty()) {
        val index = pending.removeFirst()
        if (!seen.add(index)) continue
        val instruction = flow.instructions[index]
        val destination = (instruction as? OneRegisterInstruction)?.registerA
        if (instruction.opcode.setsRegister() && (destination == register ||
                instruction.opcode.setsWideRegister() && destination != null && destination + 1 == register)) writes += index
        else pending.addAll(predecessors[index])
    }
    return writes
}
