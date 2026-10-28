/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.videooverlays

import app.morphe.Fixtures
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Test

private const val CONTROLS = "Lapp/morphe/extension/tiktok/feed/FeedOverlayControls;"

/**
 * What Hide the LIVE row on Following hooks (#262), held to each declared build: the one static
 * toggle on the row's view model that logs its own isShow. The hook hands isShow to the switch
 * and writes the answer back into the same parameter, with no branch of its own (#264), so
 * TikTok's body runs as it was on every swipe.
 */
class FollowingSkylightAnchorsTest {
    @Test
    fun `each declared build has one skylight toggle and the fingerprint takes exactly it`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val byShape = methodsOf(apk) { _, method -> isSkylightToggle(method) && logsIsShow(method) }
            val byFingerprint = methodsOf(apk) { classDef, method -> FollowingSkylightToggleFingerprint.takes(method, classDef) }
            assertEquals("$version: toggles ${byShape.map { it.second.name }}", 1, byShape.size)
            assertEquals(
                "$version: the fingerprint took ${byFingerprint.map { it.second.name }}",
                byShape.map { it.first.type to it.second.name },
                byFingerprint.map { it.first.type to it.second.name },
            )
        }
    }

    @Test
    fun `the hook rewrites isShow in place and leaves the toggle's body as it was`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val native = methodsOf(apk) { _, method -> isSkylightToggle(method) && logsIsShow(method) }.single().second
            val before = native.implementation!!.instructions.toList()
            // The view model is p0 and isShow p1: eight parameter registers in all.
            val isShow = native.implementation!!.registerCount - 7

            val hooked = MutableMethod(native)
            hooked.keepFollowingSkylightFolded("Hide video overlays")
            val after = hooked.implementation!!.instructions.toList()

            // Two straight-line instructions, then TikTok's own in their own order.
            assertEquals("$version: the hook", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT), after.take(2).map { it.opcode })
            val call = after[0].getReference<MethodReference>()!!
            assertEquals(CONTROLS, call.definingClass)
            assertEquals("skylightShown", call.name)
            assertEquals(listOf("Z"), call.parameterTypes.map(CharSequence::toString))
            assertEquals("Z", call.returnType)
            assertEquals(isShow, (after[0] as FiveRegisterInstruction).registerC)
            assertEquals(isShow, (after[1] as OneRegisterInstruction).registerA)
            assertEquals(before.map { it.opcode }, after.drop(2).map { it.opcode })
        }
    }

    @Test
    fun `a toggle that no longer takes isShow second stops the patch untouched`() {
        val moved = MutableMethod(
            ImmutableMethod(
                SKYLIGHT_VIEW_MODEL, "Y23",
                listOf(SKYLIGHT_VIEW_MODEL, "Ljava/lang/String;").map { ImmutableMethodParameter(it, null, null) }, "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
                ImmutableMethodImplementation(2, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null),
            ),
        )
        val before = moved.implementation!!.instructions.toList()
        assertThrows(PatchException::class.java) { moved.keepFollowingSkylightFolded("Hide video overlays") }
        assertEquals(before, moved.implementation!!.instructions.toList())
    }

    private fun logsIsShow(method: Method) = method.implementation?.instructions?.any {
        it.getReference<StringReference>()?.string == SKYLIGHT_TOGGLE_LOG
    } == true

    /** Every method of one build the filter takes, walked once and never held (the dex has millions). */
    private fun methodsOf(apk: File, accept: (ClassDef, Method) -> Boolean): List<Pair<ClassDef, Method>> {
        val found = mutableListOf<Pair<ClassDef, Method>>()
        val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
        for (entry in container.dexEntryNames) {
            for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                for (method in classDef.methods) {
                    if (accept(classDef, method)) found += classDef to method
                }
            }
        }
        return found
    }
}
