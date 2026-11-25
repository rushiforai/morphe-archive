/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.theme

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PerBuild
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.patches.threads.misc.extension.holdsNote
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderPackedSwitchPayload
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * HushThreads header logo (#26) on each declared build: the lambdas that draw the Threads logo and
 * wordmark ask the extension first thing and return when it drew HushThreads' logo, and the two
 * stubs reach the canvas and size the way Threads' logo lambda does. The canvas helper is checked
 * by Compose's own error message in it, apart from how the patch finds it.
 */
class HeaderLogoFixtureTest {
    @Test
    fun `each declared build asks the extension first in the logo and wordmark drawings`() {
        val extension = ExtensionDex.classDef(HEADER_LOGO)
        for ((name, signature) in listOf("draw" to "(Ljava/lang/Object;)Z", "canvasOf" to "(Ljava/lang/Object;)Landroid/graphics/Canvas;",
            "sizeOf" to "(Ljava/lang/Object;)J")) {
            val method = extension.methods.single { it.name == name }
            assertTrue(name, AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
            assertEquals(name, signature, "(${method.parameterTypes.joinToString("")})${method.returnType}")
        }

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = context(build)
            assertEquals(where, 0, status(context))
            val logo = context.logoDrawing(LOGO_INDICATOR, "the logo")
            val wordmark = context.logoDrawing(WORDMARK_INDICATOR, "the wordmark")
            assertFalse(where, logo.lambda == wordmark.lambda)
            val path = context.canvasPath(logo.invoke)

            // Read apart from the patch: Compose's helper says which canvas it unwraps.
            val helper = fixture(build).classes.single { it.type == path.nativeCanvas.definingClass }.methods
                .single { it.name == path.nativeCanvas.name && it.parameterTypes.map(CharSequence::toString) == listOf(path.canvas.type) }
            assertTrue(where, helper.body().any { it.string() == ANDROID_CANVAS_CAST })
            // The draw parameters hold the canvas and one size.
            val params = fixture(build).classes.single { it.type == path.params.type }
            assertEquals(where, listOf(path.size.name), params.instanceFields.filter { it.type == "J" }.map { it.name })
            assertTrue(where, params.instanceFields.any { it.name == path.canvas.name && it.type == path.canvas.type })
            assertEquals(where, path.params.type, path.size.definingClass)

            BY_HAND[where.substringAfterLast('-').substringBefore('.')]?.let { expected ->
                assertEquals(where, expected, listOf(
                    logo.lambda, wordmark.lambda, path.scope, path.context.toString(), path.contextImpl, path.drawScope.toString(),
                    path.params.toString(), path.canvas.toString(), path.size.toString(), path.nativeCanvas.toString(),
                ))
            }

            val stock = listOf(logo, wordmark).associateWith { drawing ->
                fixture(build).classes.single { it.type == drawing.lambda }.methods.single { it.same(drawing.invoke) }
            }
            headerLogoPatch.execute(context)
            for ((drawing, method) in stock) {
                val patched = context.mutableClassDefBy(drawing.lambda).methods.single { it.same(method) }.body()
                val original = method.body()
                assertEquals(where, original.size + 5, patched.size)
                assertEquals(where, Opcode.INVOKE_STATIC_RANGE, patched[0].opcode)
                assertEquals(where, "$HEADER_LOGO->draw(Ljava/lang/Object;)Z", patched[0].getReference<MethodReference>().toString())
                // p1, the draw scope Compose hands the lambda.
                assertEquals(where, method.implementation!!.registerCount - 1, (patched[0] as RegisterRangeInstruction).startRegister)
                assertEquals(where, Opcode.MOVE_RESULT, patched[1].opcode)
                val answer = (patched[1] as OneRegisterInstruction).registerA
                assertTrue(where, answer < method.implementation!!.registerCount - 2)
                assertEquals(where, Opcode.IF_EQZ, patched[2].opcode)
                assertEquals(where, answer, (patched[2] as OneRegisterInstruction).registerA)
                assertEquals(where, Opcode.SGET_OBJECT, patched[3].opcode)
                assertEquals(where, "Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;", patched[3].getReference<FieldReference>().toString())
                assertEquals(where, Opcode.RETURN_OBJECT, patched[4].opcode)
                // Threads' drawing from its first instruction on, unchanged: the if-eqz jumps over
                // itself (two code units), the sget-object (two) and the return (one).
                assertEquals(where, 5, (patched[2] as OffsetInstruction).codeOffset)
                assertEquals(where, original.map { it.opcode }, patched.drop(5).map { it.opcode })
            }

            assertEquals(where, listOf(
                Opcode.CHECK_CAST to path.scope, Opcode.INVOKE_INTERFACE to path.context.toString(),
                Opcode.MOVE_RESULT_OBJECT to null, Opcode.CHECK_CAST to path.contextImpl,
                Opcode.IGET_OBJECT to path.drawScope.toString(), Opcode.IGET_OBJECT to path.params.toString(),
                Opcode.IGET_OBJECT to path.canvas.toString(), Opcode.INVOKE_STATIC to path.nativeCanvas.toString(),
                Opcode.MOVE_RESULT_OBJECT to null, Opcode.RETURN_OBJECT to null,
            ), stub(context, "canvasOf"))
            assertEquals(where, listOf(
                Opcode.CHECK_CAST to path.scope, Opcode.INVOKE_INTERFACE to path.context.toString(),
                Opcode.MOVE_RESULT_OBJECT to null, Opcode.CHECK_CAST to path.contextImpl,
                Opcode.IGET_OBJECT to path.drawScope.toString(), Opcode.IGET_OBJECT to path.params.toString(),
                Opcode.IGET_WIDE to path.size.toString(), Opcode.RETURN_WIDE to null,
            ), stub(context, "sizeOf"))
            assertEquals(where, 1, status(context))
        }
    }

    @Test
    fun `a second function holding the logo's note is refused before anything changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val found = fixture(build).classes.flatMap { it.methods }.single { it.holdsNote(LOGO_INDICATOR) }
            context.mutableClassDefBy(found.definingClass).methods.add(
                ImmutableMethod(
                    found.definingClass, "hushThreadsOther", found.parameters, found.returnType,
                    found.accessFlags, found.annotations, found.hiddenApiRestrictions, found.implementation,
                ).toMutable(),
            )
            val error = assertThrows(build.name, PatchException::class.java) { headerLogoPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("the Threads logo") &&
                error.message.orEmpty().contains("expected exactly one match, found 2"))
            assertEquals(build.name, 0, status(context))
            assertEquals(build.name, Opcode.NEW_INSTANCE, context.mutableClassDefBy(HEADER_LOGO).methods.single { it.name == "canvasOf" }
                .body().first().opcode)
        }
    }

    @Test
    fun `a logo lambda that switches is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val logo = context.logoDrawing(LOGO_INDICATOR, "the logo")
            val lambda = context.mutableClassDefBy(logo.lambda)
            val invoke = lambda.methods.single { it.same(logo.invoke) }
            // A real switch needs its payload: dexlib2 refuses a switch aimed anywhere else before the patch looks.
            val implementation = invoke.implementation!!
            val payload = BuilderPackedSwitchPayload(0, listOf(implementation.newLabelForIndex(0)))
            implementation.addInstruction(payload)
            implementation.addInstruction(0, BuilderInstruction31t(Opcode.PACKED_SWITCH, 0, payload.location.addNewLabel()))
            val error = assertThrows(build.name, PatchException::class.java) { headerLogoPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("switches"))
            assertEquals(build.name, 0, status(context))
        }
    }

    /** Each instruction of the stub [name] as its opcode and, when it has one, its reference. */
    private fun stub(context: BytecodePatchContext, name: String): List<Pair<Opcode, String?>> =
        context.mutableClassDefBy(HEADER_LOGO).methods.single { it.name == name }.body().map { instruction ->
            val named = when (val reference = (instruction as? ReferenceInstruction)?.reference) {
                is TypeReference -> reference.type
                null -> null
                else -> reference.toString()
            }
            instruction.opcode to named
        }

    private class Fixture(val classes: List<ClassDef>)

    /**
     * The classes holding the two notes, the lambdas their functions create, Compose's helpers that
     * return an Android canvas from one argument, and the classes the lambdas read fields of, read
     * once per build.
     */
    private fun fixture(build: File): Fixture = fixtures.getOrPut(build) {
        val noted = { method: Method -> method.holdsNote(LOGO_INDICATOR) || method.holdsNote(WORDMARK_INDICATOR) }
        val holders = FixtureDex.classesWhere(build, { true }, noted)
        val created = holders.flatMap { it.methods }.filter(noted)
            .flatMap { it.body() }.filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.getReference<TypeReference>()?.type }
            .toSet() - holders.map { it.type }.toSet()
        val helpers = FixtureDex.classesWhere(build, { true }) {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "Landroid/graphics/Canvas;" && it.parameterTypes.size == 1
        }
        val lambdas = FixtureDex.classes(build, created).values
        val read = lambdas.flatMap { it.methods }.flatMap { it.body() }.mapNotNull { it.getReference<FieldReference>() }
            .map { it.definingClass }.toSet()
        Fixture((holders + lambdas + helpers + FixtureDex.classes(build, read).values).distinctBy { it.type })
    }

    private fun context(build: File) = PatchContexts.of((ExtensionDex.classes() + fixture(build).classes).distinctBy { it.type })

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "headerLogo" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.same(other: Method) = definingClass == other.definingClass && name == other.name &&
        returnType == other.returnType && parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }

    private fun Instruction.string() =
        if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) getReference<StringReference>()?.string else null

    private companion object {
        /** Compose's message in nativeCanvas when the canvas isn't its Android one. */
        const val ANDROID_CANVAS_CAST = "null cannot be cast to non-null type androidx.compose.ui.graphics.AndroidCanvas"

        /** What 512708508 reads, by hand: the two lambdas, then the path to the canvas and size. */
        val BY_HAND = mapOf(
            "512708508" to listOf(
                "LX/1lP;", "LX/3hC;", "LX/0DL;", "LX/0DL;->BR3()LX/6hE;", "LX/0DV;", "LX/0DV;->A02:LX/0DP;",
                "LX/0DP;->A02:LX/6hD;", "LX/6hD;->A01:LX/6hC;", "LX/6hD;->A00:J", "LX/0FL;->A00(LX/6hC;)Landroid/graphics/Canvas;",
            ),
        )

        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<Fixture>()
    }
}
