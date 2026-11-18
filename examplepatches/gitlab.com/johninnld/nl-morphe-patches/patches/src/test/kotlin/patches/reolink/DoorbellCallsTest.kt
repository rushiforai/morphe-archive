package patches.reolink

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import org.junit.Assert.*
import org.junit.Assume.assumeNotNull
import org.junit.Test
import java.io.File

class DoorbellCallsTest {
    @Test fun remainsOptInAndIncludesTheVerifiedPushRegistrationFix() {
        assertFalse(reolinkDoorbellCallsPatch.default)
        assertTrue(reolinkDoorbellCallsPatch.description!!.startsWith("Experimental."))
        assertTrue(reolinkDoorbellCallsPatch.dependencies.contains(reolinkPushNotificationsPatch))
        assertTrue(reolinkDoorbellCallsPatch.dependencies.contains(originalInput))
    }

    @Test fun realDoorbellPushCanBeClaimedWithoutRemovingTheNativeFallbackOrAccountPolicy() {
        val path = System.getenv("REOLINK_ORIGINAL_BASE_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
        val original = classes.single { it.type == FCM_LISTENER }.methods.single { it.name == "onMessage" }
        val before = original.implementation!!.instructions.toList()
        val replacement = withDoorbellCallHook(original)
        val after = replacement.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
            after.take(4).map { it.opcode })
        assertEquals("$CALL_BRIDGE->onMessage(Landroid/content/Context;Ljava/lang/Object;)Z",
            (after[0] as ReferenceInstruction).reference.toString())
        assertEquals(4, (after[2] as BuilderOffsetInstruction).target.location.index)
        assertEquals(before.map { it.opcode }, after.drop(4).map { it.opcode })
        assertEquals(before.map { (it as? ReferenceInstruction)?.reference?.toString() },
            after.drop(4).map { (it as? ReferenceInstruction)?.reference?.toString() })
        assertEquals(original.implementation!!.registerCount, replacement.implementation!!.registerCount)
        assertThrows(IllegalStateException::class.java) { withDoorbellCallHook(replacement) }
    }

    @Test fun backgroundAutoNotificationsCannotBypassTheCallHandoff() {
        val path = System.getenv("REOLINK_ORIGINAL_BASE_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val cls = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == SDK_MESSAGING_SERVICE }
        val original = cls.methods.single { it.name == "dispatchMessage" }
        val before = original.implementation!!.instructions.toList()
        val replacement = withSdkDoorbellCallHook(original)
        val after = replacement.implementation!!.instructions.toList()
        assertEquals("$CALL_BRIDGE->onSdkMessage(Landroid/content/Context;Landroid/content/Intent;)Z",
            (after[0] as ReferenceInstruction).reference.toString())
        assertEquals(4, (after[2] as BuilderOffsetInstruction).target.location.index)
        assertEquals(before.map { it.opcode }, after.drop(4).map { it.opcode })
        assertEquals(before.map { (it as? ReferenceInstruction)?.reference?.toString() },
            after.drop(4).map { (it as? ReferenceInstruction)?.reference?.toString() })
        assertThrows(IllegalStateException::class.java) { withSdkDoorbellCallHook(replacement) }
        // The receipt/SDK message handling methods that own acknowledgement and duplicate filtering are untouched.
        assertTrue(cls.methods.any { it.name == "handleMessageIntent" })
    }

    @Test fun deliverySetupRunsAfterNativeFirebaseInitializationWithoutChangingItsArguments() {
        val path = System.getenv("REOLINK_ORIGINAL_BASE_APK")
        assumeNotNull(path)
        val dex = DexFileFactory.loadDexContainer(File(path!!), Opcodes.getDefault())
        val original = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            .single { it.type == PUSH_ADAPTER }.methods.single { it.name == "initPushSdk" }
        val before = original.implementation!!.instructions.toList()
        val replacement = withAppHandledPushInitialization(original)
        val after = replacement.implementation!!.instructions.toList()
        assertEquals(before.dropLast(1).map { it.opcode }, after.dropLast(2).map { it.opcode })
        assertEquals("$CALL_BRIDGE->initialize(Landroid/content/Context;)V",
            (after[after.lastIndex - 1] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.RETURN_VOID, after.last().opcode)
        assertThrows(IllegalStateException::class.java) { withAppHandledPushInitialization(replacement) }
    }
}
