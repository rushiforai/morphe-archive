/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Found by reading 449 and 448 (2026-10-05), and 450 (2026-10-06).
 */
package app.morphe.patches.threads.misc.theme

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.enableStatus
import app.morphe.patches.threads.misc.extension.requireStatusMethod
import app.morphe.patches.threads.misc.extension.threadsExtensionPatch
import app.morphe.patches.threads.misc.settings.settingsPatch
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import app.morphe.util.readsAfter
import app.morphe.util.singleOrPatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val PATCH = "Pure black dark mode"
internal const val PURE_BLACK = "$EXTENSION_PACKAGE/theme/PureBlack;"

/**
 * Compose's note in Threads' theme, the lambda that builds its colors for dark or light mode. It
 * names the source file, so it survives Redex.
 */
internal const val BDS_THEME = "com.instagram.barcelona.bds.theme.BdsTheme.<anonymous> (BdsTheme.kt:"

/** Threads' dark mode background, #101010, as the ARGB literal its theme loads. */
internal const val THREADS_DARK = 0xff101010L
internal const val WHITE = 0xffffffffL

/** A color scheme's constructor takes at least this many colors and nothing else. Threads' takes 39. */
private const val SCHEME_COLORS = 20

/**
 * Dark mode's background is pure black.
 *
 * Threads builds its Compose colors in its theme, BdsTheme. For dark mode it either builds them
 * there from literals or takes a ready color scheme, and Threads holds a dark and a light one of
 * those in static fields of one class. #101010 is the dark background in both. Each place the
 * theme, or a helper it builds its colors in, loads #101010 asks the extension first, and so does
 * each argument of the dark scheme that's
 * #101010 where the light scheme has white. The light scheme's own #101010, a dark color on light
 * backgrounds, isn't one of those, so light mode stays as Threads draws it. The grays of menus,
 * sheets and pressed rows are other colors and stay too.
 *
 * Instagram's own dark palettes and the window behind Threads' screens are left alone: no code of
 * Threads reads the first, and the second only shows for a moment as a screen opens.
 */
@Suppress("unused")
val pureBlackPatch = bytecodePatch(
    name = PATCH,
    description = "Makes Threads' dark mode truly black instead of dark gray behind your feed and posts. It looks " +
        "deeper and can save battery on OLED screens. Starts off. Turn it on in HushThreads settings > " +
        "More settings > Appearance.",
) {
    category("Interface")
    dependsOn(settingsPatch)
    dependsOn(threadsExtensionPatch)
    compatibleWith(*AppCompatibilities.threads())

    execute {
        requireStatusMethod("pureBlack")
        val theme = theme()
        val scheme = darkScheme(theme)
        val builders = (listOf(theme) + themeHelpers(theme)).map { it to it.darkLoads() }.filter { it.second.isNotEmpty() }
            .ifEmpty { throw PatchException("$PATCH: Threads' theme no longer loads #101010") }
        for ((builder, loads) in builders) {
            // From the last, so the earlier indices still point where they did.
            for (index in loads.sortedDescending()) {
                val register = (builder.implementation!!.instructions[index] as OneRegisterInstruction).registerA
                builder.addInstructions(
                    index + 1,
                    """
                        invoke-static/range { v$register .. v${register + 1} }, $PURE_BLACK->argb(J)J
                        move-result-wide v$register
                    """,
                )
            }
        }
        mutableClassDefBy(scheme.holder).findMutableMethodOf(scheme.initializer).addInstructions(
            scheme.call,
            scheme.registers.joinToString("\n") {
                """
                    invoke-static/range { v$it .. v${it + 1} }, $PURE_BLACK->color(J)J
                    move-result-wide v$it
                """
            },
        )
        enableStatus("pureBlack")
    }
}

/** Where the dark color scheme is built: the call to its constructor and the registers of its #101010 backgrounds. */
internal data class DarkScheme(val holder: String, val initializer: Method, val call: Int, val registers: List<Int>)

/** One construction of a color scheme: its call, the colors it passes, and the register of each. */
internal data class SchemeBuild(val call: Int, val field: String, val colors: List<Long?>, val registers: List<Int>) {
    /** How light its opaque colors are on average: a dark scheme's are darker. */
    fun lightness(): Double = colors.filterNotNull().map { it ushr 32 }.filter { it ushr 24 == 0xffL }
        .map { 0.2126 * (it shr 16 and 0xff) + 0.7152 * (it shr 8 and 0xff) + 0.0722 * (it and 0xff) }
        .average()
}

internal fun Method.holdsNote(note: String): Boolean = implementation?.instructions?.any {
    it.getReference<StringReference>()?.string?.startsWith(note) == true
} == true

/** Every place [this] loads [THREADS_DARK]. */
internal fun Method.darkLoads(): List<Int> =
    implementation!!.instructions.withIndex().filter { (_, it) -> it.loadsWide(THREADS_DARK) }.map { it.index }

private fun Instruction.loadsWide(value: Long) = when (opcode) {
    Opcode.CONST_WIDE, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_HIGH16 ->
        (this as WideLiteralInstruction).wideLiteral == value
    else -> false
}

/**
 * The static methods [this] theme calls that build the same kind of colors it does: each returns a
 * type the theme constructs itself. 450 builds its dark colors from literals in one of those. The
 * theme's own loads are read too, since 449 and 448 built them there.
 */
internal fun Method.themeHelpers(): List<MethodReference> {
    val body = implementation!!.instructions
    val built = body.filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.getReference<TypeReference>()?.type }.toSet()
    return body.filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
        .mapNotNull { it.getReference<MethodReference>() }
        .filter { it.returnType in built }
        .distinctBy { it.toString() }
}

private fun BytecodePatchContext.themeHelpers(theme: Method): List<MutableMethod> = theme.themeHelpers().mapNotNull { reference ->
    classDefByOrNull(reference.definingClass)?.let { mutableClassDefBy(reference.definingClass).findMutableMethodOf(reference) }
}

private fun BytecodePatchContext.theme(): MutableMethod {
    val method = classDefByStrings(BDS_THEME, StringComparisonType.STARTS_WITH).flatMap { it.methods }
        .filter { it.holdsNote(BDS_THEME) }
        .distinctBy { "${it.definingClass}->${it.name}${it.parameterTypes.joinToString("")}${it.returnType}" }
        .singleOrPatchException("$PATCH: Threads' theme, the method holding \"$BDS_THEME\"")
    return mutableClassDefBy(method.definingClass).findMutableMethodOf(method)
}

/** Whether [type] is a color scheme: a class whose constructor takes colors and nothing else. */
private fun BytecodePatchContext.isScheme(type: String): Boolean = classDefByOrNull(type)?.methods?.any { method ->
    method.name == "<init>" && method.parameterTypes.size >= SCHEME_COLORS && method.parameterTypes.all { it.toString() == "J" }
} == true

/**
 * The dark scheme of the two [theme] reads. Both must sit in static fields of one class and be built
 * once each in its static initializer, from code that runs straight through, so the colors each
 * gets can be read off the literals. The darker of the two is the dark one.
 */
internal fun BytecodePatchContext.darkScheme(theme: Method): DarkScheme {
    val read = theme.implementation!!.instructions.filter { it.opcode == Opcode.SGET_OBJECT }
        .mapNotNull { it.getReference<FieldReference>() }
        .filter { isScheme(it.type) }
        .distinctBy { "${it.definingClass}->${it.name}" }
        .groupBy { it.definingClass to it.type }
        .filterValues { it.size == 2 }.entries
        .singleOrPatchException("$PATCH: the class holding Threads' dark and light color schemes")
    val (holder, type) = read.key
    val fields = read.value.map { it.name }.toSet()
    val initializer = classDefByOrNull(holder)?.methods?.singleOrNull { it.name == "<clinit>" }
        ?: throw PatchException("$PATCH: $holder builds no color scheme")
    val body = initializer.implementation!!.instructions.toList()
    if (body.any { it is OffsetInstruction && it.opcode != Opcode.FILL_ARRAY_DATA }) {
        throw PatchException("$PATCH: $holder branches while it builds its color schemes")
    }
    val builds = schemeBuilds(body, type).filter { it.field in fields }
    if (builds.size != 2) throw PatchException("$PATCH: $holder builds ${builds.size} of the color schemes Threads' theme reads, not a dark and a light one")
    val (dark, light) = builds.sortedBy { it.lightness() }
    val backgrounds = dark.colors.indices.filter { dark.colors[it] == THREADS_DARK shl 32 && light.colors[it] == WHITE shl 32 }
    if (backgrounds.isEmpty()) {
        throw PatchException("$PATCH: Threads' dark color scheme has no #101010 where its light one has white")
    }
    val registers = backgrounds.map { dark.registers[it] }
    for (register in registers) {
        val later = initializer.readsAfter(dark.call, register) + initializer.readsAfter(dark.call, register + 1)
        if (later.isNotEmpty()) throw PatchException("$PATCH: $holder reads v$register again after building its dark scheme, at $later")
        if (register > 255) throw PatchException("$PATCH: $holder passes a dark background in v$register, past move-result-wide's reach")
    }
    return DarkScheme(holder, initializer, dark.call, registers)
}

/**
 * Each construction of a [type] in [body], with the colors it passes as far as literals, shifts
 * and copies tell them. A color the code computes some other way is null.
 */
private fun schemeBuilds(body: List<Instruction>, type: String): List<SchemeBuild> {
    val wide = HashMap<Int, Long>()
    val narrow = HashMap<Int, Int>()
    fun clobber(register: Int, pair: Boolean) {
        for (r in register..(if (pair) register + 1 else register)) {
            narrow.remove(r)
            wide.remove(r)
            wide.remove(r - 1)
        }
    }
    val builds = mutableListOf<SchemeBuild>()
    for ((index, instruction) in body.withIndex()) {
        when (instruction.opcode) {
            Opcode.CONST_WIDE, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_HIGH16 -> {
                val register = (instruction as OneRegisterInstruction).registerA
                clobber(register, true)
                wide[register] = (instruction as WideLiteralInstruction).wideLiteral
            }
            Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16 -> {
                val register = (instruction as OneRegisterInstruction).registerA
                clobber(register, false)
                narrow[register] = (instruction as NarrowLiteralInstruction).narrowLiteral
            }
            Opcode.MOVE_WIDE, Opcode.MOVE_WIDE_FROM16, Opcode.MOVE_WIDE_16 -> {
                val move = instruction as TwoRegisterInstruction
                val value = wide[move.registerB]
                clobber(move.registerA, true)
                if (value != null) wide[move.registerA] = value
            }
            Opcode.SHL_LONG, Opcode.SHL_LONG_2ADDR -> {
                val (target, source, amount) = if (instruction is ThreeRegisterInstruction) {
                    Triple(instruction.registerA, instruction.registerB, instruction.registerC)
                } else {
                    (instruction as TwoRegisterInstruction).let { Triple(it.registerA, it.registerA, it.registerB) }
                }
                val value = wide[source]
                val shift = narrow[amount]
                clobber(target, true)
                if (value != null && shift != null) wide[target] = value shl (shift and 63)
            }
            Opcode.INVOKE_DIRECT_RANGE -> {
                val call = instruction as RegisterRangeInstruction
                val method = instruction.getReference<MethodReference>()
                if (method?.definingClass == type && method.name == "<init>") {
                    val registers = method.parameterTypes.indices.map { call.startRegister + 1 + 2 * it }
                    val field = body.drop(index + 1).firstOrNull {
                        it.opcode == Opcode.SPUT_OBJECT && (it as OneRegisterInstruction).registerA == call.startRegister
                    }?.getReference<FieldReference>()
                    builds += SchemeBuild(index, field?.name ?: "", registers.map { wide[it] }, registers)
                }
            }
            else -> if (instruction.opcode.setsRegister()) {
                clobber((instruction as OneRegisterInstruction).registerA, instruction.opcode.setsWideRegister())
            }
        }
    }
    return builds
}
