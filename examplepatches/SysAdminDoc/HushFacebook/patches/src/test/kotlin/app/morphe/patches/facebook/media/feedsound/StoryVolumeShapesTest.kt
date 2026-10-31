/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.media.feedsound

import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The story viewer's volume setter, on stand-ins shaped like 585's: one static method holding
 * [STORY_AUDIBLE] that builds a volume request right before handing it and the volume to the
 * player. The ask goes in front of the request's build, and a setter that jumps into the build,
 * makes two player calls or builds the request in the volume's register is refused.
 */
class StoryVolumeShapesTest {
    private val owner = "Lfixture/StoryViewer;"
    private val player = "Lfixture/Player;"
    private val request = "Lfixture/VolumeRequest;"
    private val trigger = "Lfixture/Trigger;"

    private fun setter(body: String): ClassDef {
        val method = MutableMethod(
            ImmutableMethod(
                owner, "set", listOf(player, "F").map { ImmutableMethodParameter(it, null, null) }, "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                ImmutableMethodImplementation(5, emptyList(), null, null),
            ),
        ).apply { addInstructionsWithLabels(0, body.trimIndent()) }
        return ImmutableClassDef(owner, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
            listOf(ImmutableMethod.of(method)))
    }

    /** 585's shape: the quiet branch sets the volume to 0 and jumps back to the trigger's read. */
    private fun shaped(sendAt: String = ":send", build: String = "v0") = setter(
        """
            const-string v2, "$STORY_AUDIBLE"
            if-eqz p0, :quiet
            :send
            sget-object v1, $trigger->auto:$trigger
            ${if (sendAt == ":build") ":build" else ""}
            new-instance $build, $request
            invoke-direct {$build, v1}, $request-><init>($trigger)V
            invoke-virtual {p0, $build, p1}, $player->volume(${request}F)V
            return-void
            :quiet
            const/4 p1, 0x0
            goto $sendAt
        """,
    )

    @Test
    fun `the ask goes in front of the request and the quiet branch still reaches it`() {
        val classes = listOf(shaped())
        val context = PatchContexts.of(classes)
        val volume = context.storyVolume()
        assertEquals(owner, volume.owner)
        assertEquals("the volume is the second parameter", 4, volume.volume)
        assertEquals(3, volume.askAt)

        context.askStorySound(volume)
        val body = context.mutableClassDefBy(owner).methods.single { it.name == "set" }.implementation!!.instructions.toList()
        val ask = body[volume.askAt]
        assertEquals(Opcode.INVOKE_STATIC, ask.opcode)
        assertEquals(OWN_STORY_VOLUME, (ask as ReferenceInstruction).reference.toString())
        assertEquals(4, (ask as FiveRegisterInstruction).registerC)
        assertEquals(Opcode.MOVE_RESULT, body[volume.askAt + 1].opcode)
        assertEquals(4, (body[volume.askAt + 1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.NEW_INSTANCE, body[volume.askAt + 2].opcode)
        // The quiet branch jumps to the trigger's read, so it passes through the ask too.
        val jump = body.last()
        assertEquals(Opcode.GOTO, jump.opcode)
        val target = (jump as? BuilderOffsetInstruction)?.target?.location?.index
            ?: (body.indexOf(jump) + (jump as OffsetInstruction).codeOffset)
        assertTrue("the quiet branch skips the ask (lands on $target)", target < volume.askAt)
        assertEquals(Opcode.SGET_OBJECT, body[target].opcode)
    }

    @Test
    fun `a jump into the request's build is refused`() {
        val failure = assertThrows(PatchException::class.java) { PatchContexts.of(listOf(shaped(sendAt = ":build"))).storyVolume() }
        assertTrue(failure.message, failure.message!!.contains("jump into its volume call"))
    }

    @Test
    fun `a request built in the volume's register is refused`() {
        val failure = assertThrows(PatchException::class.java) { storyVolume(shaped(build = "p1")) }
        assertTrue(failure.message, failure.message!!.contains("volume's register"))
    }

    @Test
    fun `a second player call is refused`() {
        val twice = setter(
            """
                const-string v2, "$STORY_AUDIBLE"
                sget-object v1, $trigger->auto:$trigger
                new-instance v0, $request
                invoke-direct {v0, v1}, $request-><init>($trigger)V
                invoke-virtual {p0, v0, p1}, $player->volume(${request}F)V
                invoke-virtual {p0, v0, p1}, $player->volume(${request}F)V
                return-void
            """,
        )
        val failure = assertThrows(PatchException::class.java) { storyVolume(twice) }
        assertTrue(failure.message, failure.message!!.contains("2 player calls"))
    }

    @Test
    fun `a call without its request built right before it is refused`() {
        val apart = setter(
            """
                const-string v2, "$STORY_AUDIBLE"
                sget-object v1, $trigger->auto:$trigger
                new-instance v0, $request
                invoke-direct {v0, v1}, $request-><init>($trigger)V
                const/4 v3, 0x0
                invoke-virtual {p0, v0, p1}, $player->volume(${request}F)V
                return-void
            """,
        )
        val failure = assertThrows(PatchException::class.java) { storyVolume(apart) }
        assertTrue(failure.message, failure.message!!.contains("doesn't build its volume request"))
    }
}
