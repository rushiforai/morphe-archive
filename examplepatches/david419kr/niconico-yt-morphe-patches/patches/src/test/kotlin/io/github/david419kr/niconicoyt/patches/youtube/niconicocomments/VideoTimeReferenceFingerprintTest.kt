package io.github.david419kr.niconicoyt.patches.youtube.niconicocomments

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.PatcherConfig
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction22c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Test
import java.io.File

class VideoTimeReferenceFingerprintTest {
    @Test
    fun matchesLogPrefixBeforeCall() = checkMatch(logFirst = true)

    @Test
    fun matchesLogPrefixAfterCall() = checkMatch(logFirst = false)

    @Test
    fun matchesJumboString() = checkMatch(jumbo = true)

    @Test
    fun rejectsUnrelatedLog() = checkMatch(log = "Other progress: %d", expected = false)

    @Test
    fun requiresAdjacentFieldRead() = checkMatch(adjacent = false, expected = false)

    private fun checkMatch(
        logFirst: Boolean = true,
        jumbo: Boolean = false,
        log: String = "Media progress reported outside media playback: %d",
        adjacent: Boolean = true,
        expected: Boolean = true,
    ) {
        val type = "Ltest/Player;"
        val logReference = ImmutableStringReference(log)
        val logInstruction = if (jumbo) {
            ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO, 0, logReference)
        } else {
            ImmutableInstruction21c(Opcode.CONST_STRING, 0, logReference)
        }
        val target = ImmutableMethodReference(type, "setTime", listOf("J"), "V")
        val call = listOf(ImmutableInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 0, 3, target)) +
            (if (adjacent) emptyList() else listOf(ImmutableInstruction10x(Opcode.NOP))) +
            ImmutableInstruction22c(Opcode.IGET_OBJECT, 0, 1,
                ImmutableFieldReference(type, "state", "Ljava/lang/Object;"))
        val instructions = if (logFirst) listOf(logInstruction) + call else call + logInstruction
        val method = ImmutableMethod(type, "reportProgress", emptyList(), "V", AccessFlags.PUBLIC.value,
            null, null, ImmutableMethodImplementation(3,
                instructions + ImmutableInstruction10x(Opcode.RETURN_VOID), null, null))
        val classDef = ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
            null, null, null, emptyList(), listOf(method))
        val fingerprint = VideoTimeReferenceFingerprint
        fingerprint.clearMatch()
        try {
            val match = with(context()) { fingerprint.matchOrNull(method, classDef) }
            if (expected) {
                assertNotNull(match)
                // The patch consumes the first match as the playback-time call.
                assertEquals(Opcode.INVOKE_DIRECT_RANGE, match!!.instructionMatches!!.first().instruction.opcode)
                assertEquals(if (logFirst) 1 else 0, match.instructionMatches!!.first().index)
            } else {
                assertNull(match)
            }
        } finally {
            fingerprint.clearMatch()
        }
    }

    private fun context(): BytecodePatchContext {
        val metadata = PackageMetadata::class.java.declaredConstructors.single { it.parameterCount == 4 }
            .apply { isAccessible = true }.newInstance("com.google.android.youtube", "fixture", "1", null)
        // Use Kotlin's default arguments so this also runs with Patcher 2's changed constructor.
        val constructor = PatcherConfig::class.java.declaredConstructors.single { it.isSynthetic }
        val arguments: Array<Any?> = constructor.parameterTypes.map<Class<*>, Any?> {
            when (it) {
                Boolean::class.javaPrimitiveType -> false
                Int::class.javaPrimitiveType -> 0
                else -> null
            }
        }.toTypedArray()
        arguments[0] = File("unused.apk")
        arguments[arguments.lastIndex - 1] = -2 // Default every parameter except apkFile.
        val config = constructor.newInstance(*arguments)
        return BytecodePatchContext::class.java.declaredConstructors.single { it.parameterCount == 2 }
            .apply { isAccessible = true }.newInstance(config, metadata) as BytecodePatchContext
    }
}
