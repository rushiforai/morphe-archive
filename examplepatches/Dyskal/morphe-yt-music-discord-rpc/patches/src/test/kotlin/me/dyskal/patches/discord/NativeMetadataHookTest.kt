package me.dyskal.patches.discord

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse

class NativeMetadataHookTest {
    @Test
    fun `queue helper reads provider from initialized instance receiver`() {
        val owner = "Lmusic/Metadata;"
        val helper = createQueueCaptureHelper(owner,
            ImmutableFieldReference(owner, "provider", "Lmusic/Provider;"),
            ImmutableMethodReference("Lmusic/Provider;", "get", emptyList(), "Ljava/lang/Object;"),
            ImmutableMethodReference("Lmusic/Queue;", "current", emptyList(), "Lmusic/Entry;"),
            ImmutableFieldReference("Lmusic/Song;", "renderer", "Lmusic/Renderer;"),
            ImmutableFieldReference("Lmusic/Video;", "renderer", "Lmusic/Renderer;"))
        assertFalse(AccessFlags.STATIC.isSet(helper.accessFlags))
        assertEquals(0, helper.parameterTypes.size)
        val implementation = helper.implementation!!
        val first = implementation.instructions.first()
        assertEquals(Opcode.IGET_OBJECT, first.opcode)
        // ART initializes only the final register with `this` at entry to this method.
        assertEquals(implementation.registerCount - 1, (first as TwoRegisterInstruction).registerB)
    }
}
