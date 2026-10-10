/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.sharesheet

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.comments.summaries.descriptor
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.upsells.IMMUTABLE_COPY
import app.morphe.patches.facebook.misc.upsells.IMMUTABLE_LIST
import app.morphe.patches.facebook.misc.upsells.SHARE_ITEM_TYPES
import app.morphe.patches.facebook.misc.upsells.SHARE_SHEET_ITEMS
import app.morphe.patches.facebook.misc.upsells.SHARE_TARGETS
import app.morphe.patches.facebook.misc.upsells.SHARE_TO_THREADS
import app.morphe.patches.facebook.misc.upsells.enumConstant
import app.morphe.patches.facebook.misc.upsells.isEnumNaming
import app.morphe.patches.facebook.misc.upsells.isShareItemList
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Share sheet items on every Facebook build the bundle declares: the shared hook finds the one list
 * of share sheet item types, puts the extension and Guava's copy in front of each of its returns on
 * the returned register, and the patch turns on its own status and nobody else's. Reads the fixture
 * bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class ShareSheetItemsFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

    private fun ClassDef.method(like: Method): Method = methods.single {
        it.name == like.name && it.returnType == like.returnType &&
            it.parameterTypes.map(CharSequence::toString) == like.parameterTypes.map(CharSequence::toString)
    }

    @Test
    fun `each declared build's share sheet item list answers through the extension`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val shareEnums = FixtureDex.classesHolding(bundle, SHARE_TO_THREADS).filter { isEnumNaming(it, SHARE_ITEM_TYPES) }
                assertEquals("$name: share sheet item enums", 1, shareEnums.size)
                val threads = enumConstant(shareEnums.single(), SHARE_TO_THREADS)
                val lists = FixtureDex.methodsWhere(bundle, { dex -> dex.fieldSection.any { it.toString() == threads.toString() } }) {
                    isShareItemList(it, threads)
                }
                assertEquals("$name: share sheet item lists", 1, lists.size)
                val list = lists.single()
                val listClass = FixtureDex.classes(bundle, setOf(list.definingClass)).values.single()
                val immutableList = FixtureDex.classes(bundle, setOf(IMMUTABLE_LIST)).values.single()

                val pool = (shareEnums + listClass + immutableList + ExtensionDex.classDef(SETTINGS_STATUS)).associateBy { it.type }.values
                val context = PatchContexts.of(pool)
                // execute() runs only the patch it's called on, so the shared hook goes first.
                shareSheetHookPatch.execute(context)
                shareSheetItemsPatch.execute(context)

                val original = list.code()
                val patched = context.mutableClassDefBy(list.definingClass).method(list).code()
                val returns = original.count { it.opcode == Opcode.RETURN_OBJECT }
                assertEquals("$name: four instructions in front of each of the list's returns", original.size + 4 * returns, patched.size)
                patched.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.forEach { (at, ret) ->
                    val answer = (ret as OneRegisterInstruction).registerA
                    listOf(SHARE_TARGETS, IMMUTABLE_COPY).forEachIndexed { step, hook ->
                        val call = patched[at - 4 + 2 * step]
                        assertEquals("$name: $hook before return v$answer", hook, call.called())
                        assertEquals("$name: $hook handed v$answer", listOf(answer, 1),
                            listOf((call as RegisterRangeInstruction).startRegister, call.registerCount))
                        val result = patched[at - 3 + 2 * step]
                        assertEquals("$name: $hook's answer in v$answer", listOf(Opcode.MOVE_RESULT_OBJECT, answer),
                            listOf(result.opcode, (result as OneRegisterInstruction).registerA))
                    }
                }

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
                fun answer(method: String) = (status.single { it.name == method }.code()[0] as NarrowLiteralInstruction).narrowLiteral
                assertEquals("$name: SettingsStatus.shareSheetItems() isn't switched on", 1, answer("shareSheetItems"))
                assertEquals("$name: the shared hook switched on Hide Meta upsells", 0, answer("metaUpsells"))
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `the extension has the list's hook`() {
        val hook = ExtensionDex.classDef(SHARE_SHEET_ITEMS).methods.singleOrNull { it.name == "targets" }
        assertTrue("the extension has no ShareSheetItems.targets", hook != null)
        assertEquals("targets' shape", SHARE_TARGETS, hook!!.descriptor())
    }
}
