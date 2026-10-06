/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.screenshots

import app.morphe.Fixtures
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Allow screenshots on every Facebook build the bundle declares: every call that can set a window's
 * flags is one the patch sends to the extension, and the screens known to set the secure flag
 * are among the methods it changes. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and
 * skips without it.
 */
class AllowScreenshotsFixtureTest {
    private val flagCalls = setOf("addFlags(I)V", "setFlags(II)V")

    private fun windowFlagCalls(method: Method): List<Instruction> = (method.implementation?.instructions ?: emptyList()).filter { instruction ->
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@filter false
        call.definingClass == WINDOW && call.name + call.parameterTypes.joinToString("", "(", ")") + call.returnType in flagCalls
    }

    private fun loadsSecure(method: Method) = method.implementation?.instructions?.any {
        it.opcode.name.startsWith("const") && (it as? WideLiteralInstruction)?.wideLiteral == 0x2000L
    } == true

    @Test
    fun `each declared build sends every window flag call and the known secure screens`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val changed = FixtureDex.methodsWhere(bundle, { true }) { setsWindowFlags(it) || windowFlagCalls(it).isNotEmpty() }
                val calls = changed.flatMap(::windowFlagCalls)
                assertTrue("${bundle.name}: ${calls.size} window flag calls", calls.size > 50)
                assertEquals(
                    "${bundle.name}: window flag calls the patch can't send",
                    emptyList<String>(),
                    calls.filter { ownWindowCall(it) == null }.map { it.opcode.name },
                )
                val writes = changed.sumOf { method -> method.implementation!!.instructions.count(::writesLayoutFlags) }
                assertTrue("${bundle.name}: $writes layout flags writes", writes > 10)
                val secure = changed.filter(::loadsSecure).map { "${it.definingClass}->${it.name}" }
                assertTrue("${bundle.name}: ${secure.size} methods setting the secure flag", secure.size >= 10)
                for (screen in listOf(
                    "Lcom/facebook/payments/paymentmethods/cardform/CardFormActivity;->onActivityCreate",
                    "Lcom/facebook/xapp/messaging/threadview/renderer/photo/components/FullScreenPhotoFragment;->onResume",
                )) {
                    assertTrue("${bundle.name}: $screen sets the secure flag through a call the patch changes", screen in secure)
                }
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
