/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.literalReads
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Issue #37's "What's on your mind?" row, on each declared build. The feed's inline composer reads
 * SURFACE_BACKGROUND's theme attribute as a drawable: Litho resolves the attribute to its colour
 * resource and hands it to the read that fails with "Drawable resource not found for ID #0x", which
 * asks `Context.getDrawable`. Material You sends every such call to its stand-in, which gives a dark
 * surface's ColorDrawable the palette, so the row needs no hook of its own. The patch only checks that
 * some getDrawable call moved somewhere in the app, so this holds the row's own way there: if Facebook
 * read the row another way, the patch would still apply and the row would stay #252728.
 *
 * Read from 581, 580 and 577 (2026-10-07): the composer is `LX/2a3`, `LX/2Xr` and `LX/2PM`, the
 * attribute read `LX/2b3;->A04`, `LX/2Z3;->A04` and `LX/23p;->A04`, and the lookup `LX/1Mx;->A0B`,
 * `LX/1KP;->A0B` and `LX/1T3;->A0A`. None of those names is used here.
 *
 * 585 (arm64, read 2026-10-30) asks for the colour instead: the composer `LX/02dD;->A0C` hands
 * SURFACE_BACKGROUND's constant `LX/029b;->A3Q` to `LX/02It;->A00`, which passes it through
 * `LX/02Jl;->A03` to FDSColors' resolver `LX/02Jm;->A0B`, and wraps the answer in a ColorDrawable.
 * Route one hooks that resolver, so the row takes the palette there.
 */
class ComposerRowColourFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun bundles(version: String) = Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.parameters() = parameterTypes.map(CharSequence::toString)

    private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Method.descriptor() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    @Test
    fun `the composer row's surface reaches the drawable call Material You reroutes, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                val source = fdsColourSource(fdsColorsOf(bundle))!!
                val tokenType = source.parameterTypes[1].toString()
                val tokenClass = FixtureDex.classes(bundle, setOf(tokenType)).getValue(tokenType)
                val constants = tokenConstants(tokenClass.methods.single { it.name == "<clinit>" }, tokenType)
                val surface = constants.attributes.getValue("SURFACE_BACKGROUND")

                // The attribute goes into a register and straight on to a static (Litho context, attribute) read.
                val composers = FixtureDex.classesHolding(bundle, INLINE_COMPOSER)
                assertEquals("$name: one inline composer", 1, composers.size)
                val reads = composers.single().methods.flatMap { method ->
                    method.body().zipWithNext().mapNotNull { (load, next) ->
                        val register = (load as? OneRegisterInstruction)?.registerA
                        val call = next as? FiveRegisterInstruction
                        val reference = next.call()
                        val read = (load as? NarrowLiteralInstruction)?.narrowLiteral == surface && register != null &&
                            next.opcode == Opcode.INVOKE_STATIC && call != null && call.registerCount == 2 &&
                            call.registerD == register && reference?.returnType == DRAWABLE
                        reference.takeIf { read }
                    }
                }
                // Why: 585 asks the token's colour and makes the ColorDrawable itself, so route one themes the row.
                if (reads.isEmpty()) {
                    val surfaceFields = constants.fields.filterValues { it == "SURFACE_BACKGROUND" }.keys
                    assertColourRead(name, bundle, composers.single(), tokenType, surfaceFields)
                    checked += version
                    continue
                }
                assertEquals("$name: the composer reads SURFACE_BACKGROUND as a drawable once", 1, reads.size)

                // That read turns the attribute into its resource and asks the read that fails for a missing one.
                val litho = FixtureDex.classes(bundle, setOf(reads.single().definingClass)).getValue(reads.single().definingClass)
                val reader = litho.methods.single { it.descriptor() == reads.single().toString() }
                val resourceReads = reader.body().mapNotNull { it.call() }.filter { call ->
                    call.definingClass == litho.type && call.returnType == DRAWABLE &&
                        call.parameterTypes.map(CharSequence::toString) == reader.parameters()
                }
                assertEquals("$name: the attribute read hands its resource on once", 1, resourceReads.size)
                val resourceRead = litho.methods.single { it.descriptor() == resourceReads.single().toString() }
                assertTrue("$name: to the read that fails for a missing resource", holdsString(resourceRead, NOT_FOUND))

                // Which asks one lookup, and the lookup is Context.getDrawable.
                val lookups = resourceRead.body().mapNotNull { it.call() }.filter { call ->
                    call.returnType == DRAWABLE && call.parameterTypes.map(CharSequence::toString) == listOf("I")
                }
                assertEquals("$name: the resource read asks one lookup", 1, lookups.size)
                val owner = FixtureDex.classes(bundle, setOf(lookups.single().definingClass)).getValue(lookups.single().definingClass)
                val lookup = owner.methods.single { it.descriptor() == lookups.single().toString() }
                val gets = lookup.body().withIndex().filter { it.value.call()?.toString() == CONTEXT_GET_DRAWABLE }
                assertEquals("$name: the lookup is Context.getDrawable", 1, gets.size)
                val framework = gets.single().value as FiveRegisterInstruction
                // A super call stays put (it would come back to its override), so it isn't counted.
                val drawableReads = owner.methods.sumOf { method ->
                    method.body().count {
                        it.call()?.toString() == CONTEXT_GET_DRAWABLE &&
                            it.opcode != Opcode.INVOKE_SUPER && it.opcode != Opcode.INVOKE_SUPER_RANGE
                    }
                }

                for (amoled in listOf(false, true)) {
                    val themes = "$name, AMOLED $amoled, Material You"
                    val context = PatchContexts.of(listOf(owner))
                    fun lookupCall() = context.mutableClassDefBy(owner.type).methods
                        .single { it.descriptor() == lookup.descriptor() }.body()[gets.single().index]
                    val counts = with(context) {
                        if (amoled) {
                            rerouteColourCalls(AMOLED_COLOUR_CALLS)
                            assertEquals("$themes: AMOLED leaves the lookup, its route two blackened the resource",
                                CONTEXT_GET_DRAWABLE, lookupCall().call()?.toString())
                        }
                        rerouteColourCalls(YOU_COLOUR_CALLS)
                    }
                    assertEquals("$themes: Material You sends every drawable read in the lookup's class", drawableReads,
                        counts.getValue(CONTEXT_GET_DRAWABLE))
                    val call = lookupCall()
                    assertEquals("$themes: to its stand-in", standIn(MATERIAL_YOU, CONTEXT_GET_DRAWABLE), call.call()?.toString())
                    assertEquals("$themes: static", Opcode.INVOKE_STATIC, call.opcode)
                    assertEquals("$themes: on the context and the resource", listOf(framework.registerC, framework.registerD),
                        (call as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    /** The instructions reading the value the instruction at [index] writes, through any plain moves of it. */
    private fun Method.usesOf(index: Int, seen: MutableSet<Int> = mutableSetOf()): List<Int> {
        if (!seen.add(index)) return emptyList()
        val code = body()
        return literalReads(index).flatMap { use -> if (code[use].opcode in MOVES) usesOf(use, seen) else listOf(use) }
    }

    /**
     * The row on a build that asks SURFACE_BACKGROUND's colour, not its drawable (585): the composer
     * hands the token's constant to a static resolver answering an int, wraps the answer in a
     * ColorDrawable, and the resolver passes the token down to an FDSColors resolver route one hooks.
     */
    private fun assertColourRead(name: String, bundle: File, composer: ClassDef, tokenType: String, surfaceFields: Set<String>) {
        assertTrue("$name: no SURFACE_BACKGROUND constant on the token class", surfaceFields.isNotEmpty())
        val resolvers = composer.methods.flatMap { method ->
            val code = method.body()
            code.indices.filter { at ->
                val field = (code[at] as? ReferenceInstruction)?.reference as? FieldReference
                code[at].opcode == Opcode.SGET_OBJECT && field?.definingClass == tokenType && field.name in surfaceFields
            }.flatMap { load -> method.usesOf(load) }.mapNotNull { at ->
                val call = code[at].call()
                val static = code[at].opcode == Opcode.INVOKE_STATIC || code[at].opcode == Opcode.INVOKE_STATIC_RANGE
                val drawn = call != null && static && call.returnType == "I" && code.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT &&
                    method.usesOf(at + 1).any { code[it].call()?.toString() == COLOR_DRAWABLE_INIT }
                call.takeIf { drawn }
            }
        }
        assertEquals("$name: the composer reads SURFACE_BACKGROUND's colour into a ColorDrawable once (${resolvers.map { it.toString() }})",
            1, resolvers.size)

        val colors = fdsColorsOf(bundle)
        val context = PatchContexts.of(listOf(colors))
        with(context) { hookFdsColorsResolvers(target = FDS_STAND_IN) }
        val hooked = context.mutableClassDefBy(colors.type).methods
            .filter { method -> method.body().any { it.call()?.toString() == FDS_STAND_IN } }.map { it.descriptor() }.toSet()
        assertTrue("$name: route one hooks no FDSColors resolver", hooked.isNotEmpty())

        // The token goes down the int resolvers that take it, three calls deep at most.
        val reached = mutableSetOf<String>()
        var level: Set<MethodReference> = setOf(resolvers.single())
        repeat(3) {
            level = level.filter { reached.add(it.toString()) }.let { calls ->
                val owners = FixtureDex.classes(bundle, calls.map { it.definingClass }.toSet() - colors.type) + (colors.type to colors)
                calls.flatMap { call ->
                    owners[call.definingClass]?.methods?.singleOrNull { it.descriptor() == call.toString() }?.body().orEmpty()
                        .mapNotNull { it.call() }
                        .filter { it.returnType == "I" && it.parameterTypes.any { type -> type.toString() == tokenType } }
                }.toSet()
            }
        }
        reached += level.map { it.toString() }
        assertTrue("$name: SURFACE_BACKGROUND's colour reaches no FDSColors resolver route one hooks ($reached, $hooked)",
            reached.any { it in hooked })
    }

    private companion object {
        const val INLINE_COMPOSER = "InlineComposerV2RootComponentSpec.InlineComposerButtonClick.%s"
        const val NOT_FOUND = "Drawable resource not found for ID #0x"
        const val DRAWABLE = "Landroid/graphics/drawable/Drawable;"
        const val COLOR_DRAWABLE_INIT = "Landroid/graphics/drawable/ColorDrawable;-><init>(I)V"
        const val FDS_STAND_IN = "$MATERIAL_YOU->fds(ILjava/lang/Object;)I"
        val MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16, Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
    }
}
