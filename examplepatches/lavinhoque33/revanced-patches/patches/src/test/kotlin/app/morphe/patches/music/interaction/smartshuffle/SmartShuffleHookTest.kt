/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.patches.music.interaction.smartshuffle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.*
import org.junit.Test

class SmartShuffleHookTest {
    @Test
    fun olderVersionsNeverEnterFeatureResolution() {
        assertFalse(supportsSmartShuffle("6.20.51"))
        assertFalse(supportsSmartShuffle("8.12.54"))
        assertFalse(supportsSmartShuffle("8.28.54"))
        assertFalse(supportsSmartShuffle("8.30.54"))
        assertFalse(supportsSmartShuffle("9.00.00"))
        assertTrue(supportsSmartShuffle("9.15.51"))
        assertTrue(supportsSmartShuffle("9.40.51"))
        assertTrue(supportsSmartShuffle("9.45.51"))
    }

    @Test
    fun missingUiOrNativePrerequisiteInstallsNothing() {
        val events = mutableListOf<String>()
        val resolveNative: () -> (() -> Unit) = {
            events.add("resolve-native")
            val install: () -> Unit = { events.add("install-native"); Unit }
            install
        }
        val resolveUi: () -> (() -> Unit) = { error("Missing header attachment") }
        try {
            preflightSmartShuffle(resolveNative, resolveUi)
            fail("Expected missing UI prerequisite")
        } catch (_: IllegalStateException) {
            assertEquals(listOf("resolve-native"), events)
        }
    }

    @Test
    fun everyClosureResolvesBeforeAnyFeatureMutation() {
        val events = mutableListOf<String>()
        fun prerequisite(name: String): () -> (() -> Unit) = {
            events.add("resolve-$name")
            val install: () -> Unit = { events.add("install-$name"); Unit }
            install
        }
        val install = preflightSmartShuffle(prerequisite("native"), prerequisite("keep"),
            prerequisite("auto"), prerequisite("ui"))
        assertEquals(listOf("resolve-native", "resolve-keep", "resolve-auto", "resolve-ui"), events)
        install()
        assertEquals(listOf("resolve-native", "resolve-keep", "resolve-auto", "resolve-ui",
            "install-native", "install-keep", "install-auto", "install-ui"), events)
    }

    @Test
    fun inheritedActivityTouchDispatchIsObservedWithoutConsumingNativeEvents() {
        val method = smartShuffleTouchBridge("LMusicActivity;", "LNativeActivity;")
        val code = method.implementation!!.instructions.toList()
        assertEquals("onTouch", code[0].getReference<MethodReference>()!!.name)
        assertEquals(Opcode.INVOKE_SUPER, code[1].opcode)
        assertEquals("LNativeActivity;", code[1].getReference<MethodReference>()!!.definingClass)
        assertEquals(Opcode.MOVE_RESULT, code[2].opcode)
        assertEquals(Opcode.RETURN, code[3].opcode)
    }

    @Test
    fun queueMarkerReceivesNativeOccurrenceWithoutReplacingTheNativeRowBind() {
        val menu = "Lapp/morphe/extension/music/patches/jam/JamMenu;"
        val menuBind = "$menu->bind(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;)V"
        val method = ImmutableMethod(
            "LQueueRow;", "bind", List(3) { ImmutableMethodParameter("Ljava/lang/Object;", null, null) },
            "V", AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(5),
        ).toMutable().apply {
            addInstructions(0, """
                invoke-static {v0, p0, p3}, $menuBind
                return-void
            """)
        }
        val nativeBind = method.implementation!!.instructions.first() as FiveRegisterInstruction
        installSmartShuffleRowHook(method, 0, nativeBind.registerC, nativeBind.registerE)
        val code = method.implementation!!.instructions.toList()
        assertEquals("bind", code[0].getReference<MethodReference>()!!.name)
        assertEquals("onQueueRowBound", code[1].getReference<MethodReference>()!!.name)
        val marker = code[1] as FiveRegisterInstruction
        assertEquals(nativeBind.registerC, marker.registerC)
        assertEquals(nativeBind.registerE, marker.registerD)
        assertEquals(Opcode.RETURN_VOID, code[2].opcode)
    }

    @Test
    fun headerAttachmentRequiresTheCapturedElementsContainerShape() {
        fun call(descriptor: String) = ImmutableMethod(
            "LHeaderTest;", "bind", emptyList(), "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null, null, MutableMethodImplementation(4)
        ).toMutable().apply {
            addInstructions(0, "invoke-static {v0, v1, v2, v3}, $descriptor\nreturn-void")
        }.implementation!!.instructions.first()

        assertTrue(isSmartShuffleHeaderAttach(call(
            "LAttach;->attach(Ljava/lang/Object;Landroid/view/ViewGroup;LContext;LModel;)Landroid/view/View;"
        )))
        assertFalse(isSmartShuffleHeaderAttach(call(
            "LAttach;->attach(Ljava/lang/Object;Landroid/view/View;LContext;LModel;)Landroid/view/View;"
        )))
        assertFalse(isSmartShuffleHeaderAttach(call(
            "LAttach;->attach(Ljava/lang/Object;Landroid/view/ViewGroup;LContext;LModel;)Ljava/lang/Object;"
        )))
    }
}
