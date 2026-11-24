package patches.stickman3

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.*
import org.junit.Test
import java.nio.file.Files
import java.security.MessageDigest

class PrivacyFixesTest {
    @Test fun nullCallbackCannotReachTheOriginalSdkBody() {
        val method = MutableMethod(ImmutableMethod(STICKMAN_ADS, "getToken",
            listOf(ImmutableMethodParameter(STICKMAN_TOKEN_LISTENER, emptySet(), null)), "V",
            AccessFlags.PUBLIC.value, emptySet(), emptySet(),
            ImmutableMethodImplementation(4, emptyList(), emptyList(), emptyList())))
        method.addInstructions(0, "invoke-static {}, Ltest/OriginalSdk;->send()V\nreturn-void")
        val changed = stickmanAdBody(method, 0, """
            if-eqz p1, :done
            const/4 p0, 0x0
            invoke-interface {p1, p0}, $STICKMAN_TOKEN_LISTENER->onUnityAdsTokenReady(Ljava/lang/String;)V
            :done
            return-void
        """)
        val body = changed.implementation!!.instructions.toList()
        assertTrue(body.none { ((it as? ReferenceInstruction)?.reference)?.toString()?.contains("OriginalSdk") == true })
        val branch = body.first() as BuilderOffsetInstruction
        assertEquals(Opcode.RETURN_VOID, body[branch.target.location.index].opcode)
        assertTrue(body.any { ((it as? ReferenceInstruction)?.reference)?.toString()?.contains("onUnityAdsTokenReady") == true })
        assertEquals(2, method.implementation!!.instructions.count())
    }
    @Test fun nativeGuardsValidateAllEntriesBeforeWritingAnyAndKeepOtherBytesIntact() {
        val file = Files.createTempFile("stickman-privacy", ".so").toFile()
        val original = ByteArray(64) { it.toByte() }
        val hash = MessageDigest.getInstance("SHA-256").digest(original).joinToString("") { "%02x".format(it.toInt() and 255) }
        try {
            file.writeBytes(original)
            val bad = listOf(StickmanPrivacyEdit("first", 4, "0405060708090a0b", "40008052c0035fd6"),
                StickmanPrivacyEdit("later changed", 20, "ffffffff", "c0035fd6"))
            assertThrows(IllegalStateException::class.java) { applyStickmanPrivacy(file, hash, bad) }
            assertArrayEquals(original, file.readBytes())
            applyStickmanPrivacy(file, hash, bad.take(1))
            val after = file.readBytes()
            assertArrayEquals(byteArrayOf(0x40, 0, 0x80.toByte(), 0x52, 0xc0.toByte(), 3, 0x5f, 0xd6.toByte()), after.copyOfRange(4, 12))
            assertArrayEquals(original.copyOfRange(0, 4), after.copyOfRange(0, 4))
            assertArrayEquals(original.copyOfRange(12, 64), after.copyOfRange(12, 64))
            assertThrows(IllegalStateException::class.java) { applyStickmanPrivacy(file, hash, bad.take(1)) }
        } finally { file.delete() }
    }
}
