/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The anchors of Clean up Facebook's chat list on every declared Facebook build, then the patch on
 * those classes. The tile state: one class whose constructor checks `activeNowTiles` and stores an
 * ImmutableList, found in 577 (`E4x`), 580 (`EBq`) and 581 (`E7k`); the hook goes in front of the
 * store as range calls, because the list's register can sit past v15 elsewhere, and the test reads
 * the instructions back. The promotions: one plugin per tag, each with one show question and a
 * local to borrow; the hook goes first in the question.
 */
class CleanUpChatListFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.target() = (this as? ReferenceInstruction)?.reference?.toString()

    private fun locals(method: Method): Int {
        val self = if (AccessFlags.STATIC.isSet(method.accessFlags)) 0 else 1
        return method.implementation!!.registerCount - self - method.parameterTypes.sumOf {
            if (it.toString() == "J" || it.toString() == "D") 2 else 1
        }
    }

    private fun patched(context: BytecodePatchContext, method: Method): Method =
        context.mutableClassDefBy(method.definingClass).methods.single {
            it.name == method.name && it.returnType == method.returnType &&
                it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
        }

    @Test
    fun `each declared build has one tile state and one plugin per promotion, and the patch hooks them`() {
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name

                // The tile state: two classes hold the literal, the state and its builder, and one is the state.
                val holders = FixtureDex.classesHolding(bundle, NOTES_TILES)
                assertEquals("$name: classes holding the tile list's name", 2, holders.size)
                val states = holders.mapNotNull { owner -> notesTrayOf(owner)?.let { owner to it } }
                assertEquals("$name: tile states", 1, states.size)
                val (state, store) = states.single()
                assertTrue("$name: the store's register is one an instruction can name", store.list in 0..255)
                assertTrue("$name: the constructor has a local for the answer", locals(store.method) >= 1)
                val builder = holders.single { it.type != state.type }
                assertTrue("$name: the builder is the constructor's parameter",
                    store.method.parameterTypes.single().toString() == builder.type)

                // The hook hands the list back through ImmutableList.copyOf(Collection), so every build has to carry it.
                val guava = FixtureDex.classes(bundle, setOf(IMMUTABLE_LIST_TYPE))[IMMUTABLE_LIST_TYPE]
                assertTrue("$name: Guava's ImmutableList is in the dex", guava != null)
                assertTrue("$name: ImmutableList.copyOf(Collection) is public static and returns an ImmutableList",
                    guava!!.methods.any {
                        it.name == "copyOf" && it.returnType == IMMUTABLE_LIST_TYPE &&
                            AccessFlags.STATIC.isSet(it.accessFlags) &&
                            it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/Collection;")
                    })

                // The promotions: one plugin per tag, distinct, each with one show question.
                val plugins = mutableListOf<ClassDef>()
                val questions = PROMOTION_TAGS.map { tag ->
                    val owners = FixtureDex.classesHolding(bundle, tag)
                    assertEquals("$name: classes loading \"$tag\"", 1, owners.size)
                    plugins += owners.single()
                    val question = bannerQuestion(owners.single(), tag)
                    assertTrue("$name: no show question for \"$tag\"", question != null)
                    question!!
                }
                assertEquals("$name: two plugins", 2, plugins.map { it.type }.toSet().size)

                // The patch on those classes.
                val context = PatchContexts.of(listOf(state) + plugins + ExtensionDex.classDef(SETTINGS_STATUS))
                val before = store.method.body()
                cleanUpChatListPatch.execute(context)

                val after = patched(context, store.method).body()
                val at = store.store
                val where = "$name ${state.type} constructor"
                assertEquals("$where: four instructions in", before.size + 4, after.size)
                assertEquals("$where: stock code before the hook", before.subList(0, at).map { it.opcode }, after.subList(0, at).map { it.opcode })
                assertEquals("$where: the hook call", Opcode.INVOKE_STATIC_RANGE, after[at].opcode)
                assertEquals("$where: the hook", NOTES_TILES_HOOK, after[at].target())
                val hook = after[at] as RegisterRangeInstruction
                assertEquals("$where: one register handed over", 1, hook.registerCount)
                assertEquals("$where: the list's register", store.list, hook.startRegister)
                assertEquals("$where: the answer", Opcode.MOVE_RESULT_OBJECT, after[at + 1].opcode)
                assertEquals("$where: lands where the list was", store.list, (after[at + 1] as OneRegisterInstruction).registerA)
                assertEquals("$where: back into an ImmutableList", Opcode.INVOKE_STATIC_RANGE, after[at + 2].opcode)
                assertEquals("$where: copyOf", IMMUTABLE_COPY_OF, after[at + 2].target())
                val copy = after[at + 2] as RegisterRangeInstruction
                assertEquals("$where: copyOf takes the answer", store.list, copy.startRegister)
                assertEquals("$where: copyOf's register count", 1, copy.registerCount)
                assertEquals("$where: the copy", Opcode.MOVE_RESULT_OBJECT, after[at + 3].opcode)
                assertEquals("$where: lands where the list was", store.list, (after[at + 3] as OneRegisterInstruction).registerA)
                assertEquals("$where: the store follows", Opcode.IPUT_OBJECT, after[at + 4].opcode)
                assertEquals("$where: stores the same register", store.list, (after[at + 4] as OneRegisterInstruction).registerA)
                assertEquals("$where: stock code after the hook", before.drop(at).map { it.target() }, after.drop(at + 4).map { it.target() })

                for (question in questions) {
                    val stock = question.body()
                    val hooked = patched(context, question).body()
                    val here = "$name ${question.definingClass}->${question.name}"
                    // A question with no local is copied with its parameters moved down; the hook still goes
                    // first, before those moves, where v0 is free.
                    val moves = hooked.size - stock.size - 5
                    assertTrue("$here: $moves preserved parameters", moves >= 0)
                    assertEquals("$here: moves only when it has no local", locals(question) < 1, moves > 0)
                    assertTrue("$here: a local register for the answer", locals(patched(context, question)) >= 1)
                    assertEquals("$here: the hook call", Opcode.INVOKE_STATIC, hooked[0].opcode)
                    assertEquals("$here: the hook", HIDES_PROMOTION, hooked[0].target())
                    assertEquals("$here: no arguments", 0, (hooked[0] as FiveRegisterInstruction).registerCount)
                    assertEquals("$here: the answer", Opcode.MOVE_RESULT, hooked[1].opcode)
                    assertEquals("$here: lands in v0", 0, (hooked[1] as OneRegisterInstruction).registerA)
                    assertEquals("$here: tested", Opcode.IF_EQZ, hooked[2].opcode)
                    // A "no" returns; a "yes" must land on the first of the stock code, which is the first
                    // preserved parameter move on a cloned method, never past it or back into the hook.
                    assertEquals("$here: a yes continues at the first stock instruction", 5,
                        (hooked[2] as BuilderOffsetInstruction).target.location.index)
                    assertEquals("$here: answers no", Opcode.CONST_4, hooked[3].opcode)
                    assertEquals("$here: returns it", Opcode.RETURN, hooked[4].opcode)
                    assertEquals("$here: stock code follows the moves", stock[0].opcode, hooked[5 + moves].opcode)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
