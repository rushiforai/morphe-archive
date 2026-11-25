package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** The stories unit's row builder and its own tile, as 587 names them. */
private const val ST_BUILDER = "LX/2K5;"
private const val ST_TILE = "LX/1vA;"
private const val ST_HOOK_SIZE = 3
private val ST_LISTS = IMMUTABLE_LIST.repeat(5)

internal val SYNTHETIC_STORY_CREATE_TILE = "$ST_BUILDER->A01(LX/4eC;${ST_TILE}LX/4eD;$ST_LISTS)$IMMUTABLE_LIST"

/** The builder cut down to the anchor it logs and an early return, with [locals] registers before its parameters. */
private fun stBuilder(id: String = SYNTHETIC_STORY_CREATE_TILE, locals: Int = 32, anchor: String = STORY_TRAY_ANCHOR, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
    fixtureMethod(id, """
        const-string v0, "$anchor"
        const/4 v0, 0x0
        return-object v0
    """.trimIndent(), registers = locals + 9, flags = flags)

/** The own tile's class, whose constructor takes the session, the unit's config, your story and your note. */
private fun stTile(constructor: List<String> = OWN_TILE_CONSTRUCTOR, type: String = ST_TILE) = fixtureClass(type, listOf(
    fixtureMethod("$type-><init>(${constructor.joinToString("")})V", "return-void", registers = constructor.size + 1,
        flags = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value),
))

internal fun storyTrayFixture(): List<MutableClass> = listOf(fixtureClass(ST_BUILDER, listOf(stBuilder())), stTile())

private fun MutableMethod.stCode() = implementation!!.instructions.toList()

private fun Instruction.stReference() = (this as? ReferenceInstruction)?.reference?.toString()

private fun Instruction.stRange() = (this as RegisterRangeInstruction).let { it.startRegister until it.startRegister + it.registerCount }.toList()

class StoryCreateTileTest {
    private fun hook(method: MutableMethod) = injectControl(STORY_CREATE_TILE, mapOf(STORY_CREATE_TILE to listOf(method)))

    @Test fun theFinderAndItsMirrorTakeTheStockBuilder() {
        assertEquals(setOf(SYNTHETIC_STORY_CREATE_TILE), findStoryCreateTile(storyTrayFixture()).map { it.hookId() }.toSet())
        assertEquals(setOf(SYNTHETIC_STORY_CREATE_TILE), mirroredControls(storyTrayFixture()).getValue(STORY_CREATE_TILE).map { it.hookId() }.toSet())
    }

    /** 587's builder has 41 registers, so `this` is v32 and the own tile, its second argument, is v34. */
    @Test fun theOwnTileGoesThroughTheExtensionAndBackAsItsOwnType() {
        val method = stBuilder()
        val before = method.stCode()
        hook(method)
        val code = method.stCode()
        assertEquals(before.size + ST_HOOK_SIZE, code.size)
        assertEquals(STORY_CREATE_TILE_CALL, code[0].stReference())
        assertEquals(listOf(34), code[0].stRange())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[1].opcode)
        assertEquals(34, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.CHECK_CAST, code[2].opcode)
        assertEquals(34, (code[2] as OneRegisterInstruction).registerA)
        assertEquals(ST_TILE, code[2].stReference())
        assertEquals(before.map { it.opcode }, code.drop(ST_HOOK_SIZE).map { it.opcode })
    }

    @Test fun theTileRegisterIsReadFromTheParametersWhateverTheLocals() {
        val method = stBuilder(locals = 3)
        hook(method)
        assertEquals(listOf(5), method.stCode()[0].stRange())
    }

    @Test fun aSecondPassLeavesTheHookAsItIs() {
        val method = stBuilder()
        val size = method.stCode().size
        hook(method)
        method.validateStoryCreateTile()
        hook(method)
        assertEquals(size + ST_HOOK_SIZE, method.stCode().size)
    }

    @Test fun onlyTheStockShapeIsTaken() {
        // A builder that logs something else.
        assertTrue(findStoryCreateTile(listOf(fixtureClass(ST_BUILDER, listOf(stBuilder(anchor = "invalid_user"))), stTile())).isEmpty())
        // Two builders with the shape.
        val second = SYNTHETIC_STORY_CREATE_TILE.replace("->A01(", "->A02(")
        assertTrue(findStoryCreateTile(listOf(fixtureClass(ST_BUILDER, listOf(stBuilder(), stBuilder(id = second))), stTile())).isEmpty())
        // A second argument whose class isn't the own tile.
        assertTrue(findStoryCreateTile(listOf(fixtureClass(ST_BUILDER, listOf(stBuilder())), stTile(OWN_TILE_CONSTRUCTOR.dropLast(1)))).isEmpty())
        assertTrue(findStoryCreateTile(listOf(fixtureClass(ST_BUILDER, listOf(stBuilder())))).isEmpty())
        // Seven lists, or a static builder.
        val shorter = "$ST_BUILDER->A01(LX/4eC;${ST_TILE}LX/4eD;${IMMUTABLE_LIST.repeat(4)}I)$IMMUTABLE_LIST"
        assertEquals(null, stBuilder(id = shorter).storyCreateTileRegister())
        assertEquals(null, stBuilder(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value).storyCreateTileRegister())
        assertFailsWith<PatchException> { stBuilder(id = shorter).validateStoryCreateTile() }
    }

    /** move-result-object and check-cast can't reach past v255. */
    @Test fun aTileRegisterPastTheEightBitRangeIsRefused() {
        val method = stBuilder(locals = 254)
        assertEquals(256, method.storyCreateTileRegister())
        assertFailsWith<PatchException> { method.validateStoryCreateTile() }
    }
}
