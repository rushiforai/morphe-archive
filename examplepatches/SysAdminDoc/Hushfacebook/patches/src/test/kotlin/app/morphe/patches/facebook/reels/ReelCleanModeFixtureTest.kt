/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.methodsHolding
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Always use Clean mode on every Facebook build the bundle declares: the one Clean mode event, the
 * store whose flag it sets beside the event, and one read of that flag in each of the four viewer
 * parts, kept by a move-result as a boolean or, through Facebook's boxing helper, a Boolean. Then
 * the patch on those classes: the extension right after each move-result on the same register,
 * and nothing else in the method moved. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and
 * skips without it.
 */
class ReelCleanModeFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)

    private fun Method.sameAs(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map(CharSequence::toString) == other.parameterTypes.map(CharSequence::toString)

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    @Test
    fun `each declared build reads the remembered Clean mode flag once in each viewer part, and the hook keeps the register`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val literals = listOf(CLEAR_MODE_EVENT) + CLEAN_MODE_PARTS
                val holding = literals.associateWith { literal ->
                    FixtureDex.classesHolding(bundle, literal).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                }
                // Every class owning an AtomicBoolean a part's method reads could be the store.
                val owners = CLEAN_MODE_PARTS.flatMap { part ->
                    holding.getValue(part).flatMap { methodsHolding(it, part) }.flatMap { method ->
                        method.code().mapNotNull { instruction ->
                            ((instruction as? ReferenceInstruction)?.reference as? FieldReference)
                                ?.takeIf { instruction.opcode == Opcode.IGET_OBJECT && it.type == ATOMIC_BOOLEAN }?.definingClass
                        }
                    }
                }.toSet()
                val candidates = FixtureDex.classes(bundle, owners)
                val hooks = cleanModeHooks(holders = holding::getValue, classOf = candidates::get)
                assertEquals("$name: one read per part", CLEAN_MODE_PARTS.size, hooks.size)

                val event = clearModeEvent(holding.getValue(CLEAR_MODE_EVENT))!!
                val stores = candidates.values.filter { store ->
                    store.fields.any { field -> isCleanModeFlag(store, field, event) }
                }
                assertEquals("$name: the Clean mode store", 1, stores.size)

                // A boxed read goes through a static helper that only boxes the flag's get().
                val helpers = hooks.filter { it.third.boxed }.map { (_, method, read) ->
                    method.code()[read.moveResult - 1].called()!!
                }
                val helperClasses = FixtureDex.classes(bundle, helpers.map { it.definingClass }.toSet())
                for (helper in helpers) {
                    val body = helperClasses.getValue(helper.definingClass).methods.single {
                        it.name == helper.name && it.parameterTypes.map(CharSequence::toString) == listOf(ATOMIC_BOOLEAN)
                    }
                    assertTrue("$name: $helper isn't static", AccessFlags.STATIC.isSet(body.accessFlags))
                    assertEquals("$name: $helper does more than box the flag",
                        listOf("$ATOMIC_BOOLEAN->get()Z", "Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;"),
                        body.code().mapNotNull { it.called()?.toString() })
                }

                val pool: Collection<ClassDef> = (holding.values.flatten() + candidates.values).associateBy { it.type }.values
                val context = PatchContexts.of(pool)
                with(context) { startReelsInCleanMode() }
                for ((owner, method, read) in hooks) {
                    val where = "$name: ${owner.type}->${method.name}"
                    val original = method.code()
                    val patched = context.mutableClassDefBy(owner.type).methods.single { it.sameAs(method) }.code()
                    val at = read.moveResult + 1
                    assertEquals("$where gains two instructions", original.size + 2, patched.size)
                    assertEquals("$where: Facebook's code up to the read stays", original.take(at).map { it.opcode },
                        patched.take(at).map { it.opcode })
                    val call = patched[at]
                    assertEquals("$where: the extension is asked", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                    assertEquals("$where: the extension is asked", if (read.boxed) START_CLEAN_BOXED else START_CLEAN,
                        call.called().toString())
                    assertEquals("$where: with the flag's answer", read.register, (call as RegisterRangeInstruction).startRegister)
                    assertEquals("$where: with the flag's answer", 1, call.registerCount)
                    assertEquals("$where: its answer goes back in the same register",
                        if (read.boxed) Opcode.MOVE_RESULT_OBJECT else Opcode.MOVE_RESULT, patched[at + 1].opcode)
                    assertEquals("$where: its answer goes back in the same register", read.register,
                        (patched[at + 1] as OneRegisterInstruction).registerA)
                    assertEquals("$where: Facebook's code after the hook stays", original.drop(at).map { it.opcode },
                        patched.drop(at + 2).map { it.opcode })
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
