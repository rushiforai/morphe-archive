/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.feed.postbuttons

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
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
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
 * Hide post buttons on each declared build: the like, reply, repost, share and save buttons' Compose
 * functions each ask the extension first thing whether to draw, and return before anything else
 * when it says no. Each function the notes find is checked against something of its own button's
 * that the notes don't use, and a second holder of a note is refused before any function changes.
 */
class HidePostButtonsFixtureTest {
    @Test
    fun `each declared build asks the extension first thing in each post button`() {
        val extension = ExtensionDex.classDef(POST_BUTTONS)
        for (button in PostButton.entries) {
            val show = extension.methods.single { it.name == button.show }
            assertTrue(button.name, AccessFlags.STATIC.isSet(show.accessFlags) && AccessFlags.PUBLIC.isSet(show.accessFlags))
            assertTrue(button.name, show.parameterTypes.isEmpty())
            assertEquals(button.name, "Z", show.returnType)
        }

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val context = context(build)
            assertEquals(where, 0, status(context))
            val stock = PostButton.entries.associateWith { button ->
                context.postButtonFunction(button).let { found -> fixture(build).classes.flatMap { it.methods }.single { it.same(found) } }
            }
            // Read apart from the notes: each function carries its own button's mark.
            for ((button, method) in stock) {
                assertTrue("$where: ${button.name} is ${method.definingClass}->${method.name}", marked(build, button, method))
            }
            BY_HAND[where.substringAfterLast('-').substringBefore('.')]?.let { names ->
                assertEquals(where, names, stock.mapValues { (_, method) -> "${method.definingClass}->${method.name}" })
            }
            // No other button's mark sits in a function the notes picked, so no two notes name one button.
            assertEquals(where, PostButton.entries.size, stock.values.map { "${it.definingClass}->${it.name}" }.toSet().size)

            hidePostButtonsPatch.execute(context)
            for ((button, method) in stock) {
                val patched = context.mutableClassDefBy(method.definingClass).methods.single { it.same(method) }.body()
                val original = method.body()
                assertEquals(where, original.size + 4, patched.size)
                assertEquals(where, Opcode.INVOKE_STATIC, patched[0].opcode)
                assertEquals(where, "$POST_BUTTONS->${button.show}()Z", patched[0].getReference<MethodReference>().toString())
                assertEquals(where, Opcode.MOVE_RESULT, patched[1].opcode)
                val answer = (patched[1] as OneRegisterInstruction).registerA
                // A register the function only writes before it reads, so the answer clobbers nothing.
                assertTrue(where, answer < method.implementation!!.registerCount - method.parameterWords())
                assertEquals(where, Opcode.IF_NEZ, patched[2].opcode)
                assertEquals(where, answer, (patched[2] as OneRegisterInstruction).registerA)
                assertEquals(where, Opcode.RETURN_VOID, patched[3].opcode)
                // The draw path is Threads' own function from its first instruction on, unchanged:
                // the if-nez jumps over itself (two code units) and the return-void (one).
                assertEquals(where, 3, (patched[2] as OffsetInstruction).codeOffset)
                assertEquals(where, original.map { it.opcode }, patched.drop(4).map { it.opcode })
            }
            assertEquals(where, 1, status(context))
        }
    }

    @Test
    fun `a second function holding a button's note is refused before any button changes`() {
        for (build in Fixtures.declaredBuilds()) {
            for (button in PostButton.entries) {
                val context = context(build)
                val found = context.postButtonFunction(button)
                val holder = context.mutableClassDefBy(found.definingClass)
                holder.methods.add(
                    ImmutableMethod(
                        found.definingClass, "hushThreadsOther", found.parameters, found.returnType,
                        found.accessFlags, found.annotations, found.hiddenApiRestrictions, found.implementation,
                    ).toMutable(),
                )
                val error = assertThrows(build.name, PatchException::class.java) { hidePostButtonsPatch.execute(context) }
                assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("the ${button.name.lowercase()} button") &&
                    error.message.orEmpty().contains("expected exactly one match, found 2"))
                assertEquals(build.name, 0, status(context))
                for (other in PostButton.entries) {
                    val method = fixture(build).classes.flatMap { it.methods }.single { it.holdsNote(other.note) }
                    assertFalse("${build.name}: ${other.name}", context.mutableClassDefBy(method.definingClass).methods
                        .single { it.same(method) }.body().any { it.getReference<MethodReference>()?.definingClass == POST_BUTTONS })
                }
            }
        }
    }

    @Test
    fun `a button function that answers a value is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val found = context.postButtonFunction(PostButton.SAVE)
            val holder = context.mutableClassDefBy(found.definingClass)
            holder.methods.remove(found)
            holder.methods.add(
                ImmutableMethod(
                    found.definingClass, found.name, found.parameters, "Ljava/lang/Object;",
                    found.accessFlags, found.annotations, found.hiddenApiRestrictions, found.implementation,
                ).toMutable(),
            )
            val error = assertThrows(build.name, PatchException::class.java) { hidePostButtonsPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("isn't a static void function"))
            assertEquals(build.name, 0, status(context))
        }
    }

    /** Whether [method] carries [button]'s own mark, read off 512708508 by hand. */
    private fun marked(build: File, button: PostButton, method: Method): Boolean {
        val body = method.body()
        val created = body.filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.getReference<TypeReference>()?.type }
        fun createdHolds(string: (String) -> Boolean) = created.any { type ->
            fixture(build).classes.singleOrNull { it.type == type }?.methods?.any { m -> m.body().any { it.string()?.let(string) == true } } == true
        }
        return when (button) {
            // The like button builds its multi-account state, named after the button.
            PostButton.LIKE -> createdHolds { it.startsWith("LikeButtonWithMultiAccount") }
            // The reply button's coroutine keeps its source name, and the button its test tag.
            PostButton.REPLY -> REPLY_COROUTINE in created && body.any { it.string() == "feed_post_ufi_reply_button" }
            PostButton.REPOST -> body.any { it.string() == "feed_post_ufi_repost_button" }
            // The share button's content lambda sets its test tag.
            PostButton.SHARE -> createdHolds { it == "feed_post_ufi_share_button" }
            // The save button draws a bookmark, outlined or filled: threads_icons_cotton_bookmark_outline_24 and _filled_24.
            PostButton.SAVE -> listOf(BOOKMARK_OUTLINE, BOOKMARK_FILLED).all { id ->
                body.any { (it as? NarrowLiteralInstruction)?.narrowLiteral == id }
            }
        }
    }

    private class Fixture(val classes: List<ClassDef>)

    /** The classes holding the buttons' notes, and every class their functions create, read once per build. */
    private fun fixture(build: File): Fixture = fixtures.getOrPut(build) {
        val holders = FixtureDex.classesWhere(build, { true }) { method -> PostButton.entries.any { method.holdsNote(it.note) } }
        val created = holders.flatMap { it.methods }.filter { method -> PostButton.entries.any { method.holdsNote(it.note) } }
            .flatMap { it.body() }.filter { it.opcode == Opcode.NEW_INSTANCE }.mapNotNull { it.getReference<TypeReference>()?.type }
            .toSet() - holders.map { it.type }.toSet()
        Fixture((holders + FixtureDex.classes(build, created).values).distinctBy { it.type })
    }

    private fun context(build: File) = PatchContexts.of((ExtensionDex.classes() + fixture(build).classes).distinctBy { it.type })

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "hidePostButtons" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.same(other: Method) = definingClass == other.definingClass && name == other.name &&
        returnType == other.returnType && parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }

    private fun Method.parameterWords() = parameterTypes.sumOf { if (it == "J" || it == "D") 2L else 1L }.toInt() +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1

    private fun Instruction.string() =
        if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) getReference<StringReference>()?.string else null

    private companion object {
        const val REPLY_COROUTINE = "Lcom/instagram/barcelona/feed/post/ufi/ui/PostDenseUfiKt\$ReplyButton\$1\$1;"
        const val BOOKMARK_OUTLINE = 0x7f08139d
        const val BOOKMARK_FILLED = 0x7f08139c

        /** The five functions on 512708508, read off by hand. */
        val BY_HAND = mapOf(
            "512708508" to mapOf(
                PostButton.LIKE to "LX/6sL;->A01", PostButton.REPLY to "LX/6sL;->A05", PostButton.REPOST to "LX/6sL;->A04",
                PostButton.SHARE to "LX/6sL;->A03", PostButton.SAVE to "LX/6sL;->A07",
            ),
        )

        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<Fixture>()
    }
}
