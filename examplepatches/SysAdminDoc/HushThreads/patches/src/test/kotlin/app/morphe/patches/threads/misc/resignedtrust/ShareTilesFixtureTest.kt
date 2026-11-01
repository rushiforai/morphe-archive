package app.morphe.patches.threads.misc.resignedtrust

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * On each declared build every share sheet tile launch hands its answer, context and intent to the
 * extension, Messenger's among them, and a lambda with nowhere to put the call stops the patch (#16).
 */
class ShareTilesFixtureTest {
    private val openRefused = "Lapp/morphe/extension/hushthreads/coexist/ShareTiles;->" +
        "openRefused(ZLandroid/content/Context;Landroid/content/Intent;)V"

    /** Read off 512308675: Instagram feed, story and thread, WhatsApp's status, Facebook's story and the app tiles. */
    private val launchesReadByHand = 5

    @Test
    fun `each declared build hands every tile launch's answer to the extension`() {
        for (build in Fixtures.declaredBuilds()) {
            ShareTileLaunchFingerprint.clearMatch()
            val classes = FixtureDex.classesWhere(build, { SHARE_TILE_COMPOSER_EXTRA in it.stringSection }) { method ->
                method.instructions().any { it.string() == SHARE_TILE_COMPOSER_EXTRA }
            }
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val method = with(context) { ShareTileLaunchFingerprint.method }
            // A switch payload's alignment nop comes and goes when code ahead of it moves.
            val stock = method.instructions().filterNot { it.opcode == Opcode.NOP }
            val launches = stock.indices.filter { stock[it].isLaunch() }
            assertEquals(build.name, launchesReadByHand, launches.size)
            val composer = stock.indexOfFirst { it.string() == SHARE_TILE_COMPOSER_EXTRA }
            assertTrue("${build.name}: Messenger's launch", launches.any { it > composer })

            method.openRefusedShareTiles()

            val body = method.instructions().filterNot { it.opcode == Opcode.NOP }
            assertEquals("${build.name}: nothing else moved", stock.size + launches.size * 2, body.size)
            launches.forEachIndexed { done, stockAt ->
                val at = stockAt + done * 2
                val launch = body[at] as FiveRegisterInstruction
                assertEquals("${build.name}: launch $done", Opcode.MOVE_RESULT, body[at + 1].opcode)
                val answer = (body[at + 1] as OneRegisterInstruction).registerA
                val call = body[at + 2]
                assertEquals("${build.name}: launch $done", openRefused, (call as ReferenceInstruction).reference.toString())
                call as FiveRegisterInstruction
                assertEquals("${build.name}: the answer", answer, call.registerC)
                assertEquals("${build.name}: the context", launch.registerD, call.registerD)
                assertEquals("${build.name}: the intent", launch.registerE, call.registerE)
                assertFalse("${build.name}: the answer took the context or intent", answer == launch.registerD || answer == launch.registerE)
                assertEquals("${build.name}: the code after it", stock[stockAt + 1].kind(), body[at + 3].kind())
            }
        }
    }

    @Test
    fun `a lambda with no launch past Messenger's intent stops the patch`() {
        val none = tiles("const/4 v0, 0x0")
        assertTrue(assertThrows(PatchException::class.java) { none.openRefusedShareTiles() }.message!!.contains("no launch"))
    }

    @Test
    fun `a launch that already reads its answer stops the patch`() {
        val reads = tiles("$LAUNCH\nmove-result v0")
        assertTrue(assertThrows(PatchException::class.java) { reads.openRefusedShareTiles() }.message!!.contains("already reads"))
    }

    @Test
    fun `a launch with the answer's only register read after it stops the patch`() {
        val noRoom = MutableMethod(
            ImmutableMethod(
                "Lfixture/Tiles;",
                "invokeSuspend",
                emptyList(),
                "V",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                ImmutableMethodImplementation(3, emptyList(), null, null),
            ),
        ).apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    const/4 v1, 0x0
                    const/4 v2, 0x0
                    const-string v0, "$SHARE_TILE_COMPOSER_EXTRA"
                    $LAUNCH
                    invoke-static { v0, v1, v2 }, Lfixture/Tiles;->read(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
                    return-void
                """,
            )
        }
        assertThrows(IllegalArgumentException::class.java) { noRoom.openRefusedShareTiles() }
    }

    @Test
    fun `an ordinary lambda gets the call right after its launch`() {
        val tiles = tiles(LAUNCH)
        tiles.openRefusedShareTiles()
        val body = tiles.instructions()
        val at = body.indexOfFirst { it.isLaunch() }
        assertEquals(Opcode.MOVE_RESULT, body[at + 1].opcode)
        assertEquals(openRefused, (body[at + 2] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.RETURN_VOID, body[at + 3].opcode)
    }

    /** A lambda with the composer extra named, then [launch], with the launcher in v0, the context in v1 and the intent in v2. */
    private fun tiles(launch: String): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lfixture/Tiles;",
            "invokeSuspend",
            emptyList(),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            ImmutableMethodImplementation(4, emptyList(), null, null),
        ),
    ).apply {
        addInstructions(
            0,
            """
                const-string v0, "$SHARE_TILE_COMPOSER_EXTRA"
                const/4 v0, 0x0
                const/4 v1, 0x0
                const/4 v2, 0x0
                $launch
                return-void
            """,
        )
    }

    private fun Instruction.isLaunch(): Boolean {
        if (opcode != Opcode.INVOKE_VIRTUAL) return false
        val called = (this as ReferenceInstruction).reference as MethodReference
        return called.returnType == "Z" && called.definingClass.startsWith("LX/") &&
            called.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/content/Intent;")
    }

    /** A goto widens when the code it jumps over grows, and is still the same goto. */
    private fun Instruction.kind(): Opcode = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private companion object {
        const val LAUNCH = "invoke-virtual { v0, v1, v2 }, LX/Launcher;->A04(Landroid/content/Context;Landroid/content/Intent;)Z"
    }
}
