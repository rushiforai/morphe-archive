/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.stories.autoadvance

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class StoryAdvanceHookTest {
    private val reelItem = "Lcom/instagram/model/reels/ReelItem;"

    /** The hook the patch writes is in the StoryAdvance the bundle ships, public and static. */
    @Test
    fun theHookIsInTheExtension() {
        val type = HOLD.substringBefore("->")
        val declared = ExtensionDex.classDef(type).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$HOLD is not in the extension: $declared", HOLD.substringAfter("->") in declared)
    }

    /** The finished-item bridge asks first; the other bridge, holding "sponsored", stays as it was. */
    @Test
    fun theFinishedItemHandlerAsksBeforeMovingOn() {
        val context = PatchContexts.of(listOf(viewer()))

        context.holdFinishedStories()

        val patched = context.mutableClassDefBy(STORY_VIEWER)
        assertGuardFirst("finished", patched.methods.single { it.name == "FrS" })
        assertEquals("the sponsored bridge was touched", 3, patched.methods.single { it.name == "FrU" }.instructions().size)
    }

    @Test
    fun aHandlerThatDoesNotCastToAStoryItemFailsThePatch() {
        val context = PatchContexts.of(listOf(viewer(firstCast = "Ljava/lang/String;")))
        val failure = assertThrows(PatchException::class.java) { context.holdFinishedStories() }
        assertTrue(failure.message!!, failure.message!!.contains(reelItem))
    }

    @Test
    fun withoutTheViewerThePatchFails() {
        val context = PatchContexts.of(listOf(viewer(type = "Lfixture/SomeOtherFragment;")))
        assertThrows(PatchException::class.java) { context.holdFinishedStories() }
    }

    /** In each declared build the handler is the viewer's one bridge that fits, and it gets the guard. */
    @Test
    fun eachDeclaredBuildHoldsTheFinishedStory() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val viewer = FixtureDex.classes(bundle, setOf(STORY_VIEWER))[STORY_VIEWER]
                    ?: error("${bundle.name}: no $STORY_VIEWER")
                val context = PatchContexts.of(listOf(viewer))

                context.holdFinishedStories()

                val bridges = viewer.methods.filter {
                    AccessFlags.BRIDGE.isSet(it.accessFlags) && it.parameterTypes.map(Any::toString) == listOf("Ljava/lang/Object;")
                }
                assertEquals("${bundle.name}: the viewer's one-Object bridges", 2, bridges.size)
                val handler = bridges.single { method -> method.instructions().any { it.string() == "userSession" } }
                val after = context.mutableClassDefBy(STORY_VIEWER).methods.single {
                    it.name == handler.name && it.parameterTypes.map(Any::toString) == listOf("Ljava/lang/Object;")
                }
                assertEquals("${bundle.name}: handler size", handler.instructions().size + 4, after.instructions().size)
                assertGuardFirst(bundle.name, after)
                val other = bridges.single { it !== handler }
                assertTrue(
                    "${bundle.name}: the other bridge no longer holds \"sponsored\"",
                    other.instructions().any { it.string() == "sponsored" },
                )
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private fun assertGuardFirst(what: String, handler: Method) {
        val code = handler.instructions()
        assertEquals(
            "$what: the guard's opcodes",
            listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.CHECK_CAST),
            code.take(5).map { it.opcode },
        )
        assertEquals("$what: the hook called", HOLD, (code[0] as ReferenceInstruction).reference.toString())
        val jump = code[2] as OffsetInstruction
        assertEquals("$what: the branch lands on the cast", code[2].codeUnits + code[3].codeUnits, jump.codeOffset)
    }

    /**
     * A story viewer shaped like Instagram 449's: two public bridges taking one Object, each casting
     * it to a ReelItem first, one holding "userSession" and the other "sponsored".
     */
    private fun viewer(type: String = STORY_VIEWER, firstCast: String = reelItem): ClassDef {
        fun bridge(name: String, string: String, cast: String) = ImmutableMethod(
            type, name, listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)), "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or AccessFlags.BRIDGE.value or AccessFlags.SYNTHETIC.value,
            null, null,
            ImmutableMethodImplementation(
                4,
                listOf(
                    ImmutableInstruction21c(Opcode.CHECK_CAST, 3, ImmutableTypeReference(cast)),
                    ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(string)),
                    ImmutableInstruction10x(Opcode.RETURN_VOID),
                ),
                null, null,
            ),
        )
        return ImmutableClassDef(
            type, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Landroidx/fragment/app/Fragment;",
            null, null, null, null,
            listOf(bridge("FrS", "userSession", firstCast), bridge("FrU", "sponsored", reelItem)),
        )
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
}
