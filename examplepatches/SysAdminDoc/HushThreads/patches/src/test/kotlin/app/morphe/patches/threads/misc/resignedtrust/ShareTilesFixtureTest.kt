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
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
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

    /**
     * Read off 512508359 and 512508358: Instagram's feed and reel thread, Facebook's reel, WhatsApp's
     * status and the app tiles. The builds split them over different lambdas, five in all, and the
     * ARMv7 builds and the first x86 one launch the four app tiles through a static helper.
     */
    private val launchesReadByHand = 5

    @Test
    fun `each declared build hands every tile launch's answer to the extension`() {
        val markers = SHARE_TILE_ACTIONS + MESSENGER + FACEBOOK_SHARE_ALIAS
        for (build in Fixtures.declaredBuilds()) {
            val lambdas = FixtureDex.classesWhere(build, { dex -> markers.any { it in dex.stringSection } }) { method ->
                method.instructions().any { it.string() in markers }
            }
            // The static helpers a launch may have been outlined into.
            val helpers = lambdas.flatMap { it.methods }.flatMap { it.instructions() }.filter { it.isOutlinedCall() }
                .map { it.called().definingClass }.toSet() - lambdas.map { it.type }.toSet()
            val context = PatchContexts.of(ExtensionDex.classes() + lambdas + FixtureDex.classes(build, helpers).values)
            val tiles = with(context) { shareTiles() }
            assertTrue("${build.name}: Messenger's tile", tiles.lambdas.any { lambda ->
                lambda.instructions().any { it.string() == MESSENGER || it.string() == FACEBOOK_SHARE_ALIAS }
            })
            val twins = tiles.outlined.associate { it.toString() to with(context) { answeringTwin(it) } }
            for ((helper, twin) in twins) {
                val owner = context.mutableClassDefBy(twin.definingClass).methods
                val stock = owner.single { it.toReference() == helper }.instructions()
                val copy = owner.single { it.toReference() == twin.toString() }.instructions()
                assertEquals("$helper still drops the answer", Opcode.RETURN_VOID, stock.last().opcode)
                assertEquals(stock.dropLast(1).map { it.opcode }, copy.dropLast(2).map { it.opcode })
                val launch = copy[copy.size - 3] as FiveRegisterInstruction
                assertEquals(tiles.launcher.toString(), launch.called().toString())
                assertEquals(Opcode.MOVE_RESULT, copy[copy.size - 2].opcode)
                assertEquals(launch.registerC, (copy[copy.size - 2] as OneRegisterInstruction).registerA)
                assertEquals(Opcode.RETURN, copy.last().opcode)
                assertEquals(launch.registerC, (copy.last() as OneRegisterInstruction).registerA)
            }
            var launched = 0
            for (lambda in tiles.lambdas) {
                val method = with(context) { mutableTile(lambda) }
                // A switch payload's alignment nop comes and goes when code ahead of it moves.
                val stock = method.instructions().filterNot { it.opcode == Opcode.NOP }
                val launches = stock.indices.filter { stock[it].isLaunch() || stock[it].isOutlinedCall() && stock[it].called().toString() in twins }
                assertTrue("${build.name}: ${lambda.definingClass} launches", launches.isNotEmpty())
                launched += launches.size

                method.openRefusedShareTiles(tiles.launcher, tiles.outlined.associateWith { twins.getValue(it.toString()) })

                val body = method.instructions().filterNot { it.opcode == Opcode.NOP }
                assertEquals("${build.name}: nothing else moved", stock.size + launches.size * 2, body.size)
                launches.forEachIndexed { done, stockAt ->
                    val at = stockAt + done * 2
                    val before = stock[stockAt] as FiveRegisterInstruction
                    val launch = body[at] as FiveRegisterInstruction
                    // The launcher takes the context and intent after itself, the helper's twin takes them alone.
                    val (handed, intent) = if (before.opcode == Opcode.INVOKE_STATIC) {
                        assertEquals("${build.name}: launch $done", twins.getValue(before.called().toString()).toString(), launch.called().toString())
                        assertEquals("${build.name}: launch $done", listOf(before.registerC, before.registerD), listOf(launch.registerC, launch.registerD))
                        launch.registerC to launch.registerD
                    } else {
                        assertEquals("${build.name}: launch $done", before.called().toString(), launch.called().toString())
                        launch.registerD to launch.registerE
                    }
                    assertEquals("${build.name}: launch $done", Opcode.MOVE_RESULT, body[at + 1].opcode)
                    val answer = (body[at + 1] as OneRegisterInstruction).registerA
                    val call = body[at + 2]
                    assertEquals("${build.name}: launch $done", openRefused, (call as ReferenceInstruction).reference.toString())
                    call as FiveRegisterInstruction
                    assertEquals("${build.name}: the answer", answer, call.registerC)
                    assertEquals("${build.name}: the context", handed, call.registerD)
                    assertEquals("${build.name}: the intent", intent, call.registerE)
                    assertFalse("${build.name}: the answer took the context or intent", answer == handed || answer == intent)
                    assertEquals("${build.name}: the code after it", stock[stockAt + 1].kind(), body[at + 3].kind())
                }
            }
            assertEquals(build.name, launchesReadByHand, launched)
        }
    }

    @Test
    fun `an app with no share tiles stops the patch`() {
        val context = PatchContexts.of(ExtensionDex.classes())
        val refused = assertThrows(PatchException::class.java) { with(context) { shareTiles() } }
        assertTrue(refused.message!!.contains("no share tile starts"))
    }

    @Test
    fun `a lambda with no launch stops the patch`() {
        val none = tiles("const/4 v0, 0x0")
        assertTrue(assertThrows(PatchException::class.java) { none.openRefusedShareTiles(LAUNCHER) }.message!!.contains("no launch"))
    }

    @Test
    fun `a launch that already reads its answer stops the patch`() {
        val reads = tiles("$LAUNCH\nmove-result v0")
        assertTrue(assertThrows(PatchException::class.java) { reads.openRefusedShareTiles(LAUNCHER) }.message!!.contains("already reads"))
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
                    $LAUNCH
                    invoke-static { v0, v1, v2 }, Lfixture/Tiles;->read(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V
                    return-void
                """,
            )
        }
        assertThrows(IllegalArgumentException::class.java) { noRoom.openRefusedShareTiles(LAUNCHER) }
    }

    @Test
    fun `an ordinary lambda gets the call right after its launch`() {
        val tiles = tiles(LAUNCH)
        tiles.openRefusedShareTiles(LAUNCHER)
        val body = tiles.instructions()
        val at = body.indexOfFirst { it.isLaunch() }
        assertEquals(Opcode.MOVE_RESULT, body[at + 1].opcode)
        assertEquals(openRefused, (body[at + 2] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.RETURN_VOID, body[at + 3].opcode)
    }

    /** A lambda running [launch], with the launcher in v0, the context in v1 and the intent in v2. */
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

    /** A static call taking a context and an intent and answering nothing. */
    private fun Instruction.isOutlinedCall(): Boolean {
        if (opcode != Opcode.INVOKE_STATIC) return false
        val called = called()
        return called.returnType == "V" &&
            called.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/content/Intent;")
    }

    private fun Instruction.called() = (this as ReferenceInstruction).reference as MethodReference

    private fun Method.toReference() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    /** A goto widens when the code it jumps over grows, and is still the same goto. */
    private fun Instruction.kind(): Opcode = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private companion object {
        const val LAUNCH = "invoke-virtual { v0, v1, v2 }, LX/Launcher;->A04(Landroid/content/Context;Landroid/content/Intent;)Z"
        val LAUNCHER = ImmutableMethodReference(
            "LX/Launcher;", "A04", listOf("Landroid/content/Context;", "Landroid/content/Intent;"), "Z",
        )
    }
}
