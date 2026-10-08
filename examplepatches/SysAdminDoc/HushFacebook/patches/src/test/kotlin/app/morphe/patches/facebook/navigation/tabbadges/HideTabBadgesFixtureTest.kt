/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.tabbadges

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide tab badges' launcher anchor on every Facebook build the bundle declares: the generic launcher
 * badge writer names itself, its one interface declares the badge write and getAnalyticsName, and
 * the twelve launcher families' writers implement it, each naming itself. Then the patch on those
 * classes: every writer's write hands its count to the extension first and writes what comes back.
 * The tab half shares Hide the Reels tab dot's count hook, which HideReelsTabDotFixtureTest holds.
 * Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class HideTabBadgesFixtureTest {
    private val families = listOf(
        "Generic", "Samsung", "Honor", "Htc", "Huawei", "Motorola", "Oppo", "Sony", "Transsion", "Vivo",
        "Xiaomi", "Zte",
    ).map { "$it$BADGER_SUFFIX" }

    /** The writer interface and every class implementing it, the extension's left out. */
    private fun writerClasses(bundle: java.io.File): Pair<ClassDef, List<ClassDef>> {
        val generic = FixtureDex.classesHolding(bundle, GENERIC_BADGER).filterNot { it.type.startsWith(EXTENSION_CLASSES) }
        assertEquals("${bundle.name}: classes naming \"$GENERIC_BADGER\"", 1, generic.size)
        val contract = generic.single().interfaces.single()
        val writerInterface = FixtureDex.classes(bundle, setOf(contract))[contract]
            ?: throw AssertionError("${bundle.name} has no $contract")
        val writers = mutableListOf<ClassDef>()
        FixtureDex.forEach(bundle) { dex ->
            for (classDef in dex.classes) {
                if (contract in classDef.interfaces) writers += ImmutableClassDef.of(classDef)
            }
        }
        return writerInterface to writers
    }

    @Test
    fun `each declared build has the twelve launcher writers, and the extension goes first in each`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val (writerInterface, writers) = writerClasses(bundle)
                assertEquals("$name: badge writes the interface declares", 1, writerInterface.methods.count(::isBadgeWrite))
                assertEquals("$name: the launcher writers", families.sorted(), writers.map { badgerName(it) }.sortedBy { it })

                val context = PatchContexts.of(writers + writerInterface + ExtensionDex.classDef(SETTINGS_STATUS))
                hideTabBadgesPatch.execute(context)

                for (writer in writers) {
                    val write = writer.methods.single(::isBadgeWrite)
                    val original = write.implementation!!.instructions.toList()
                    val patched = context.mutableClassDefBy(writer.type).methods
                        .single { it.name == write.name && isBadgeWrite(it) }.implementation!!
                    val code = patched.instructions.toList()
                    val count = patched.registerCount - 1
                    val first = code[0]
                    assertTrue("$name ${badgerName(writer)} ${writer.type}->${write.name}: the first instruction is " +
                        code.take(4).map { it.opcode } + ", registers ${patched.registerCount}",
                        first is RegisterRangeInstruction)
                    assertEquals("$name ${badgerName(writer)}: the first call", ICON_COUNT,
                        ((first as ReferenceInstruction).reference as MethodReference).toString())
                    assertEquals("$name ${badgerName(writer)}: the count is handed over", count,
                        (first as RegisterRangeInstruction).startRegister)
                    assertEquals("$name ${badgerName(writer)}: one register handed over", 1, first.registerCount)
                    assertEquals("$name ${badgerName(writer)}: the answer", Opcode.MOVE_RESULT, code[1].opcode)
                    assertEquals("$name ${badgerName(writer)}: the answer replaces the count", count,
                        (code[1] as OneRegisterInstruction).registerA)
                    assertEquals("$name ${badgerName(writer)}: Facebook's write is kept after the hook",
                        original.size + 2, code.size)
                }

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "tabBadges" }
                assertEquals("$name: SettingsStatus.tabBadges() isn't switched on", 1,
                    (status.implementation!!.instructions.first() as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
