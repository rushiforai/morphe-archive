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
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import app.morphe.patches.threads.misc.extension.parameterRegisterNumber
import app.morphe.patches.threads.misc.theme.holdsNote
import app.morphe.util.argumentRegister
import app.morphe.util.findMutableMethodOf
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Hide ghost post bubbles on each declared build: the profile header's bubble asks the extension
 * for its flag first thing, and the main feed asks it for the row's flag right before its
 * AnimatedVisibility takes it. Anything that would make a hook miss the flag it's meant for is
 * refused before either method changes.
 */
class HideGhostPostBubblesFixtureTest {
    @Test
    fun `each declared build asks the extension whether its ghost post bubbles show`() {
        for (name in listOf("showOnProfile", "showTray")) {
            val extension = ExtensionDex.classDef(GHOST_POST_BUBBLES).methods.single { it.name == name }
            assertTrue(name, AccessFlags.STATIC.isSet(extension.accessFlags) && AccessFlags.PUBLIC.isSet(extension.accessFlags))
            assertEquals(name, "Z", extension.parameterTypes.joinToString(""))
            assertEquals(name, "Z", extension.returnType)
        }

        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val methods = classes(build).flatMap { it.methods }
            // Read apart from the patch: Compose's AnimatedVisibility functions share one class.
            val animated = methods.filter { it.holdsNote(ANIMATED_VISIBILITY_NOTE) }.map { it.definingClass }.distinct().single()

            // The header bubble: one function, whose last parameter, a boolean, goes unchanged into
            // its one AnimatedVisibility call as the flag.
            val bubble = methods.single { it.holdsNote(PROFILE_BUBBLE_NOTE) }
            val bubbleBody = bubble.body()
            val parameter = bubble.parameterTypes.lastIndex
            assertEquals("$where: the flag", "Z", bubble.parameterTypes[parameter].toString())
            // The eighth parameter, after two Compose ints, on 450.
            assertEquals(where, 7, parameter)
            val register = bubble.parameterRegisterNumber(parameter)
            val bubbleCall = bubbleBody.indices.single { bubbleBody[it].callsInto(animated) }
            assertEquals(where, register, bubbleBody[bubbleCall].flagRegister())

            // The feed's row: one function, drawn by one main feed method, whose class one main feed
            // AnimatedVisibility builds. There the flag is a boolean field of the lambda itself.
            val tray = methods.single { method -> FEED_TRAY_NOTES.any { method.holdsNote(it) } }
            val feed = methods.filter { it.holdsNote(MAIN_FEED_NOTE) }
            val drawer = feed.single { method -> method.body().any { it.calls(tray) } }
            val wrapper = feed.single { method ->
                method.body().any { it.opcode == Opcode.NEW_INSTANCE && it.getReference<TypeReference>()?.type == drawer.definingClass } &&
                    method.body().any { it.callsInto(animated) }
            }
            val wrapperBody = wrapper.body()
            val trayCall = wrapperBody.indices.single { wrapperBody[it].callsInto(animated) }
            val flag = wrapperBody[trayCall].flagRegister()
            val set = (trayCall - 1 downTo 0).first { (wrapperBody[it] as? OneRegisterInstruction)?.registerA == flag }
            assertEquals(where, Opcode.IGET_BOOLEAN, wrapperBody[set].opcode)
            assertEquals(where, wrapper.definingClass, wrapperBody[set].getReference<FieldReference>()!!.definingClass)

            val context = context(build)
            assertEquals(where, 0, status(context))
            val profile = context.profileBubble()
            assertEquals(where, bubble.signature(), profile.method.signature())
            assertEquals(where, parameter, profile.parameter)
            assertEquals(where, bubbleCall, profile.call)
            val row = context.feedTray()
            assertEquals(where, wrapper.signature(), row.method.signature())
            assertEquals(where, trayCall, row.call)
            assertEquals(where, flag, row.flag)
            hideGhostPostBubblesPatch.execute(context)

            val patchedBubble = context.mutable(bubble).body()
            assertEquals(where, bubble.implementation!!.registerCount, context.mutable(bubble).implementation!!.registerCount)
            assertEquals(where, bubbleBody.size + 2, patchedBubble.size)
            assertEquals(where, Opcode.INVOKE_STATIC_RANGE, patchedBubble[0].opcode)
            assertEquals(where, SHOW_ON_PROFILE, patchedBubble[0].getReference<MethodReference>().toString())
            assertEquals(where, register, (patchedBubble[0] as RegisterRangeInstruction).startRegister)
            assertEquals(where, 1, (patchedBubble[0] as RegisterRangeInstruction).registerCount)
            // The answer goes back in the flag's own register and nowhere else.
            assertEquals(where, Opcode.MOVE_RESULT, patchedBubble[1].opcode)
            assertEquals(where, register, (patchedBubble[1] as OneRegisterInstruction).registerA)
            assertEquals(where, bubbleBody.map { it.opcode }, patchedBubble.drop(2).map { it.opcode })
            assertEquals(where, register, patchedBubble[bubbleCall + 2].flagRegister())

            val patchedWrapper = context.mutable(wrapper).body()
            assertEquals(where, wrapper.implementation!!.registerCount, context.mutable(wrapper).implementation!!.registerCount)
            assertEquals(where, wrapperBody.size + 2, patchedWrapper.size)
            assertEquals(where, SHOW_TRAY, patchedWrapper[trayCall].getReference<MethodReference>().toString())
            assertEquals(where, flag, (patchedWrapper[trayCall] as RegisterRangeInstruction).startRegister)
            assertEquals(where, 1, (patchedWrapper[trayCall] as RegisterRangeInstruction).registerCount)
            assertEquals(where, Opcode.MOVE_RESULT, patchedWrapper[trayCall + 1].opcode)
            assertEquals(where, flag, (patchedWrapper[trayCall + 1] as OneRegisterInstruction).registerA)
            // The AnimatedVisibility call follows the answer and reads it.
            assertTrue(where, patchedWrapper[trayCall + 2].callsInto(animated))
            assertEquals(where, flag, patchedWrapper[trayCall + 2].flagRegister())
            assertEquals(where, wrapperBody.map { it.opcode },
                patchedWrapper.take(trayCall).map { it.opcode } + patchedWrapper.drop(trayCall + 2).map { it.opcode })

            // Nothing else in the feed or the tray changed.
            assertEquals(where, tray.body().map { it.opcode }, context.mutable(tray).body().map { it.opcode })
            assertEquals(where, drawer.body().map { it.opcode }, context.mutable(drawer).body().map { it.opcode })
            assertEquals(where, 1, status(context))
        }
    }

    @Test
    fun `a header flag written over before its AnimatedVisibility call is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val profile = context.profileBubble()
            val register = profile.method.parameterRegisterNumber(profile.parameter)
            context.mutable(profile.method).addInstructions(profile.call, "const/16 v$register, 0x1")
            val error = assertThrows(build.name, PatchException::class.java) { hideGhostPostBubblesPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("writes over parameter ${profile.parameter}"))
            assertEquals(build.name, 0, status(context))
            assertFalse(build.name, context.mutable(profile.method).body().any { it.calls(SHOW_ON_PROFILE) })
        }
    }

    @Test
    fun `a jump to the feed's AnimatedVisibility call is refused, and the header is left alone`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val profile = context.profileBubble()
            val row = context.feedTray()
            val wrapper = context.mutable(row.method)
            wrapper.addInstructionsWithLabels(0, "goto :call", ExternalLabel("call", wrapper.getInstruction(row.call)))
            val error = assertThrows(build.name, PatchException::class.java) { hideGhostPostBubblesPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("not only from the instruction before it"))
            assertEquals(build.name, 0, status(context))
            // Both are checked before either changes.
            assertFalse(build.name, context.mutable(profile.method).body().any { it.calls(SHOW_ON_PROFILE) })
            assertFalse(build.name, wrapper.body().any { it.calls(SHOW_TRAY) })
        }
    }

    @Test
    fun `a second header bubble note is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val bubble = context.mutable(context.profileBubble().method)
            val note = bubble.body().indexOfFirst { it.getReference<StringReference>()?.string?.startsWith(PROFILE_BUBBLE_NOTE) == true }
            val register = (bubble.body()[note] as OneRegisterInstruction).registerA
            bubble.addInstructions(note + 1, "const-string v$register, \"${PROFILE_BUBBLE_NOTE}94)\"")
            val error = assertThrows(build.name, PatchException::class.java) { hideGhostPostBubblesPatch.execute(context) }
            assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("expected exactly one match, found 2"))
            assertEquals(build.name, 0, status(context))
        }
    }

    @Test
    fun `a missing or second feed tray note is refused before either hook changes`() {
        for (build in Fixtures.declaredBuilds()) {
            for (duplicate in listOf(false, true)) {
                val context = context(build)
                val profile = context.profileBubble()
                val tray = classes(build).flatMap { it.methods }.single { method -> FEED_TRAY_NOTES.any { method.holdsNote(it) } }
                val method = context.mutable(tray)
                val note = method.body().indexOfFirst { instruction ->
                    instruction.getReference<StringReference>()?.string?.let { text -> FEED_TRAY_NOTES.any { text.startsWith(it) } } == true
                }
                val register = (method.body()[note] as OneRegisterInstruction).registerA
                if (duplicate) {
                    method.addInstructions(note + 1, "const-string v$register, \"${FEED_TRAY_NOTE}112)\"")
                } else {
                    method.replaceInstruction(note, "const-string v$register, \"another tray\"")
                }
                val error = assertThrows(build.name, PatchException::class.java) { hideGhostPostBubblesPatch.execute(context) }
                assertTrue(error.message.orEmpty(), error.message.orEmpty().contains("expected exactly one match, found ${if (duplicate) 2 else 0}"))
                assertEquals(build.name, 0, status(context))
                assertFalse(build.name, context.mutable(profile.method).body().any { it.calls(SHOW_ON_PROFILE) })
                assertFalse(build.name, method.body().any { it.calls(SHOW_TRAY) })
            }
        }
    }

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private fun Method.signature() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun Instruction.calls(method: String) = getReference<MethodReference>()?.toString() == method

    private fun Instruction.calls(method: Method) = calls(method.signature())

    /** A static call into [type] that takes one boolean: an AnimatedVisibility function, when [type] holds them. */
    private fun Instruction.callsInto(type: String) =
        (opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE) &&
            getReference<MethodReference>()?.let { it.definingClass == type && it.parameterTypes.count { p -> p.toString() == "Z" } == 1 } == true

    /** The register a call to an AnimatedVisibility function hands its visible flag in, its one boolean. */
    private fun Instruction.flagRegister(): Int {
        val types = getReference<MethodReference>()!!.parameterTypes.map { it.toString() }
        return argumentRegister(types.takeWhile { it != "Z" }.sumOf { if (it == "J" || it == "D") 2 else 1 })!!
    }

    private fun BytecodePatchContext.mutable(method: Method) = mutableClassDefBy(method.definingClass).findMutableMethodOf(method)

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + classes(build))

    private fun classes(build: File): List<ClassDef> = fixtures.getOrPut(build) {
        FixtureDex.classesWhere(build, { dex -> dex.stringSection.any { string -> NOTES.any { string.startsWith(it) } } }) { method ->
            NOTES.any { method.holdsNote(it) }
        }
    }

    private fun status(context: BytecodePatchContext) = (context.mutableClassDefBy(SETTINGS_STATUS).methods
        .single { it.name == "hideGhostPostBubbles" }.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral

    private companion object {
        val NOTES = listOf(PROFILE_BUBBLE_NOTE, MAIN_FEED_NOTE, ANIMATED_VISIBILITY_NOTE) + FEED_TRAY_NOTES

        /** One read of each build serves every test; each test patches its own copy. */
        val fixtures = PerBuild<List<ClassDef>>()
    }
}
