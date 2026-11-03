package app.morphe.patches.pinedrama.feedfilter

import app.morphe.Fixtures
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.pinedrama.interaction.blockauthor.PlayerProgressAidFingerprint
import app.morphe.takes
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Latest first on Following sorts below the video the reader has reached, and the player's
 * progress report is the only thing on PineDrama that names it.
 */
class FollowingCurrentVideoReportTest {
    private val extension = "Lapp/morphe/extension/pinedrama/feedfilter/FollowingLatestFirst;"

    @Test
    fun `the progress report hands its video id to the sort on each declared build`() {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = container.dexEntryNames.flatMap { container.getEntry(it)!!.dexFile.classes }
            val controller = classes.single { it.type.endsWith("/feed/controller/PlayerController;") }
            val report = controller.methods.single { PlayerProgressAidFingerprint.takes(it, controller) }
            assertTrue("the report is an instance method", !AccessFlags.STATIC.isSet(report.accessFlags))
            val method = MutableMethod(report)
            method.reportCurrentVideoToLatestFirst()

            val instructions = method.implementation!!.instructions.toList()
            val call = instructions[0] as RegisterRangeInstruction
            assertEquals(Opcode.INVOKE_STATIC_RANGE, instructions[0].opcode)
            val target = (instructions[0] as ReferenceInstruction).reference as MethodReference
            assertEquals(extension, target.definingClass)
            assertEquals("onCurrentVideo", target.name)
            assertEquals(listOf("Ljava/lang/String;"), target.parameterTypes.map(CharSequence::toString))
            // p0 is the controller, then the id and two wide values: the id is 5 from the top.
            assertEquals("${apk.name}: the id register", method.implementation!!.registerCount - 5, call.startRegister)
            assertEquals(1, call.registerCount)
        }
    }

    @Test
    fun `a report that does not take the id first stops the patch`() {
        val method = MutableMethod(
            ImmutableMethod(
                "LX/Report;",
                "report",
                listOf(ImmutableMethodParameter("J", null, null)),
                "V",
                AccessFlags.PUBLIC.value,
                null,
                null,
                ImmutableMethodImplementation(3, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null),
            ),
        )
        val error = assertThrows(PatchException::class.java) { method.reportCurrentVideoToLatestFirst() }
        assertTrue(error.message!!, error.message!!.contains("does not take the video id first"))
    }
}
