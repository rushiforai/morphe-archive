/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.profile

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.PerBuild
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.download.IMAGE_URL
import app.morphe.patches.threads.download.USER
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Full size profile pictures on each declared build: Threads' enlarged profile picture hands its
 * composer, user id and callback to the extension before anything else, and returns when the
 * extension took the picture. The extension's model stubs make the calls Threads' own picture
 * makes. A doubled session read, a missing callback or a missing stub is refused before anything
 * changes.
 */
class FullSizeProfilePictureFixtureTest {
    @Test
    fun `each declared build hands the enlarged profile picture to the extension first`() {
        val extension = ExtensionDex.classDef(PROFILE_PICTURE).methods.single { it.name == "open" }
        assertTrue(AccessFlags.STATIC.isSet(extension.accessFlags) && AccessFlags.PUBLIC.isSet(extension.accessFlags))
        assertEquals("Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;", extension.parameterTypes.joinToString(""))
        assertEquals("Z", extension.returnType)

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            // Read apart from the patch: one static void method carries the note, takes one String
            // and one callback, and reads the session from a parameter once.
            val holders = classes(build).flatMap { it.methods }.filter { method ->
                AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "V" && method.body().any { it.isFocusedPictureNote() }
            }
            assertEquals("$where: methods with the note", 1, holders.size)
            val stock = holders.single()
            val stockBody = stock.body()
            val types = stock.parameterTypes.map { it.toString() }
            val reads = stockBody.filter {
                it.opcode == Opcode.INVOKE_STATIC && it.getReference<MethodReference>()?.returnType == USER_SESSION
            }.map { it.getReference<MethodReference>()!! }
            assertEquals("$where: session reads", 1, reads.size)
            // 454: (composer, modifier, view model, user id, callback, changed, default, flag).
            assertEquals(where, 0, types.indexOf(reads.single().parameterTypes[0].toString()))
            assertEquals(where, 3, types.indexOf("Ljava/lang/String;"))
            assertEquals(where, 4, types.indexOf("Lkotlin/jvm/functions/Function0;"))

            val context = context(build)
            assertEquals(where, 0, status(context))
            val picture = context.focusedPicture()
            assertEquals(where, stock.signature(), picture.method.signature())
            assertEquals(where, 0, picture.composer)
            assertEquals(where, 3, picture.userId)
            assertEquals(where, 4, picture.dismiss)
            assertEquals(where, reads.single().toString(), picture.session.toString())
            fullSizeProfilePicturePatch.execute(context)

            val patched = context.mutable(stock)
            val body = patched.body()
            assertEquals(where, stock.implementation!!.registerCount, patched.implementation!!.registerCount)
            assertEquals(where, stockBody.size + 7, body.size)
            // The composer, the user id and the callback, as they came in, to the extension.
            for ((at, parameter) in listOf(0 to 0, 1 to 3, 2 to 4)) {
                assertEquals(where, Opcode.MOVE_OBJECT_FROM16, body[at].opcode)
                assertEquals(where, at, (body[at] as TwoRegisterInstruction).registerA)
                assertEquals(where, stock.parameterRegisterNumber(parameter), (body[at] as TwoRegisterInstruction).registerB)
            }
            assertEquals(where, Opcode.INVOKE_STATIC, body[3].opcode)
            assertEquals(where, OPEN, body[3].getReference<MethodReference>().toString())
            val call = body[3] as FiveRegisterInstruction
            assertEquals(where, listOf(0, 1, 2), listOf(call.registerC, call.registerD, call.registerE))
            assertEquals(where, Opcode.MOVE_RESULT, body[4].opcode)
            // False goes on to Threads' own first instruction; true returns before it.
            assertEquals(where, Opcode.IF_EQZ, body[5].opcode)
            assertEquals(where, 0, (body[5] as OneRegisterInstruction).registerA)
            assertEquals(where, address(body, 7), address(body, 5) + (body[5] as OffsetInstruction).codeOffset)
            assertEquals(where, Opcode.RETURN_VOID, body[6].opcode)
            assertEquals(where, stockBody.map { it.opcode }, body.drop(7).map { it.opcode })

            // Each stub makes the call Threads' own picture makes.
            val model = context.mutableClassDefBy(PROFILE_MODEL).methods
            fun calls(stub: String) = model.single { it.name == stub }.body().mapNotNull { it.getReference<MethodReference>()?.toString() }
                .filter { it.contains("->") }
            assertEquals(where, listOf(reads.single().toString()), calls("session"))
            assertTrue(where, calls("userCache").single().startsWith("$USER_CACHE->") && calls("userCache").single().endsWith("($USER_SESSION)$USER_CACHE"))
            assertTrue(where, calls("cachedUser").single().startsWith("$USER_CACHE->") && calls("cachedUser").single().endsWith("(Ljava/lang/String;)$USER"))
            assertTrue(where, calls("hdPicture").single().startsWith("$USER->") && calls("hdPicture").single().endsWith("()$PROFILE_PIC_URL_INFO"))
            assertTrue(where, calls("picture").single().startsWith("$USER->") && calls("picture").single().endsWith("()$IMAGE_URL"))
            assertTrue(where, calls("username").single().startsWith("$USER->") && calls("username").single().endsWith("()Ljava/lang/String;"))
            assertEquals(where, listOf("$PROFILE_PIC_URL_INFO->getUrl()Ljava/lang/String;"), calls("hdUrl"))
            assertEquals(where, listOf("$IMAGE_URL->getUrl()Ljava/lang/String;"), calls("pictureUrl"))
            assertEquals(where, listOf("Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;"), calls("dismiss"))
            // Threads' session read is handed the int it passes itself, where it takes one. 455's
            // second ARMv7 build reads it from the composer alone.
            val session = model.single { it.name == "session" }.body()
            val read = session.single { it.getReference<MethodReference>()?.toString() == reads.single().toString() } as FiveRegisterInstruction
            assertEquals(where, reads.single().parameterTypes.size, read.registerCount)
            if (read.registerCount == 2) {
                assertEquals(where, 1, session.filter { it.opcode == Opcode.CONST_4 }.map { (it as NarrowLiteralInstruction).narrowLiteral }.first())
            }
            assertEquals(where, 1, status(context))
        }
    }

    @Test
    fun `a second session read is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val picture = context.focusedPicture()
            val composer = picture.method.parameterTypes[picture.composer]
            context.mutable(picture.method).addInstructions(0,
                "invoke-static { v0, v1 }, LX/Elsewhere;->A00(${composer}I)$USER_SESSION")
            val error = assertThrows(build.name, PatchException::class.java) { fullSizeProfilePicturePatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("through 2 calls, not one"))
            assertEquals(build.name, 0, status(context))
            assertFalse(build.name, context.mutable(picture.method).body().any { it.calls(OPEN) })
        }
    }

    @Test
    fun `an enlarged picture without its callback is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val stock = context(build).focusedPicture().method
            val parameters = stock.parameters.map { parameter ->
                val type = if (parameter.type == "Lkotlin/jvm/functions/Function0;") "Ljava/lang/Object;" else parameter.type
                ImmutableMethodParameter(type, parameter.annotations, parameter.name)
            }
            val changed = ImmutableMethod(stock.definingClass, stock.name, parameters, stock.returnType, stock.accessFlags,
                stock.annotations, stock.hiddenApiRestrictions, stock.implementation)
            val error = assertThrows(build.name, PatchException::class.java) { changed.focusedPictureParts() }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("takes 0 Lkotlin/jvm/functions/Function0; parameters"))
        }
    }

    @Test
    fun `a stub missing from the extension is refused before the hook goes in`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val picture = context.focusedPicture()
            context.mutableClassDefBy(PROFILE_MODEL).methods.removeIf { it.name == "dismiss" }
            val error = assertThrows(build.name, PatchException::class.java) { fullSizeProfilePicturePatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("has no single static dismiss"))
            assertEquals(build.name, 0, status(context))
            assertFalse(build.name, context.mutable(picture.method).body().any { it.calls(OPEN) })
        }
    }

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Instruction.calls(method: String) = getReference<MethodReference>()?.toString() == method

    /** The code unit [index] starts at. */
    private fun address(body: List<Instruction>, index: Int) = body.take(index).sumOf { it.codeUnits }

    private fun BytecodePatchContext.mutable(method: Method) = mutableClassDefBy(method.definingClass).findMutableMethodOf(method)

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + classes(build))

    private fun classes(build: File): List<ClassDef> = fixtures.getOrPut(build) {
        val picture = FixtureDex.classesWhere(build, { dex -> dex.stringSection.any { it.startsWith(FOCUSED_PICTURE_NOTE) } }) { method ->
            method.implementation?.instructions?.any { it.isFocusedPictureNote() } == true
        }
        picture + FixtureDex.classes(build, setOf(USER, USER_CACHE, PROFILE_PIC_URL_INFO, IMAGE_URL)).values
    }

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "fullSizeProfilePictures" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private companion object {
        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<List<ClassDef>>()
    }
}
