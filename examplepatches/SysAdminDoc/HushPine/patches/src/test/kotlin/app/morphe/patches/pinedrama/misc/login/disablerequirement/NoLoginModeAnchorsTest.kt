/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.misc.login.disablerequirement

import app.morphe.Fixtures
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The three places Disable login requirement answers for a signed-out install, held to each
 * declared build.
 *
 * <p>PineDrama's no-login mode hangs on one static yes or no. The new user step turns it into
 * NON_LOGIN or FORCED_LOGIN, and the sign-in pages, deep links and drama feed ask it on their
 * own, so the patch answers the check and not the step. A build where the step picked its mode
 * some other way, or where the check stopped being the one the rest of the app asks, has to fail
 * here and not open on a sign-in page with no way past.
 */
class NoLoginModeAnchorsTest {
    private fun code(method: Method): List<Instruction> = method.implementation!!.instructions.toList()

    private fun forEachBuild(check: (String, Map<String, ClassDef>) -> Unit) {
        Fixtures.forEachDeclared { apk ->
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            val classes = HashMap<String, ClassDef>()
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) classes.putIfAbsent(classDef.type, classDef)
            }
            check(Fixtures.versionOf(apk), classes)
        }
    }

    private fun Map<String, ClassDef>.taken(fingerprint: app.morphe.patcher.Fingerprint): Method {
        val taken = values.flatMap { classDef -> classDef.methods.filter { fingerprint.takes(it, classDef) } }
        assertEquals("the fingerprint takes ${taken.map { "${it.definingClass}->${it.name}" }}", 1, taken.size)
        return taken.single()
    }

    @Test
    fun `the mode is picked by one static yes or no that the rest of the app asks too`() = forEachBuild { version, classes ->
        val mode = classes.taken(DramaNujModeFingerprint)
        val check = noLoginCheck(mode)
        val owner = checkNotNull(classes[check.definingClass]) { "$version: no ${check.definingClass}" }
        val method = owner.methods.single { it.name == check.name && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        assertTrue("$version: the check isn't static", AccessFlags.STATIC.isSet(method.accessFlags))
        assertTrue("$version: no local for the answer", method.implementation!!.registerCount >= 1)

        // The sign-in pages, deep links and the drama feed read the mode from the check itself.
        val askers = classes.values.filter { classDef ->
            classDef.type != mode.definingClass && classDef.methods.any { asker ->
                asker.implementation?.instructions?.any { instruction ->
                    instruction.opcode == Opcode.INVOKE_STATIC &&
                        instruction.getReference<MethodReference>()?.let { call ->
                            call.definingClass == check.definingClass && call.name == check.name &&
                                call.returnType == "Z" && call.parameterTypes.isEmpty()
                        } == true
                } == true
            }
        }.map { it.type }
        for (named in listOf("/DramaLoginServiceImpl;", "/DramaDeepLinkExService;", "/DramaSeriesFeedExServiceImpl;")) {
            assertTrue("$version: $named no longer asks the check, only $askers", askers.any { it.endsWith(named) })
        }
    }

    @Test
    fun `the new user step reads whether the sign-in page was shown and tests it next`() = forEachBuild { version, classes ->
        val step = classes.taken(DramaNujLoginStepFingerprint)
        val body = code(step)
        val at = shownBeforeRead(step)
        assertEquals("$version: not a kept answer", Opcode.MOVE_RESULT, body[at].opcode)
        assertEquals("$version: the answer isn't the key's",
            SHOWN_BEFORE_KEY, body.subList(0, at).mapNotNull { it.getReference<StringReference>()?.string }.last())
        // No is the branch that opens the page, so the test has to send a yes on past it.
        assertEquals("$version: a yes no longer falls through", Opcode.IF_EQZ, body[at + 1].opcode)
    }

    @Test
    fun `the drama route asks about sign-in once and a yes opens the episodes`() = forEachBuild { version, classes ->
        val route = classes.taken(SeriesLoginWallFingerprint)
        val body = code(route)
        val at = signedInRead(route)
        val asked = body[at - 1].getReference<MethodReference>()
        assertEquals("$version: the move keeps another call's answer", "isLogin", asked?.name)
        assertEquals("$version: a yes no longer skips the sign-in page", Opcode.IF_NEZ, body[at + 1].opcode)
        val wall = body.indexOfFirst { it.getReference<MethodReference>()?.name == "showLoginAndRegisterView" }
        assertTrue("$version: the sign-in page no longer comes after the check", wall > at)
    }
}
