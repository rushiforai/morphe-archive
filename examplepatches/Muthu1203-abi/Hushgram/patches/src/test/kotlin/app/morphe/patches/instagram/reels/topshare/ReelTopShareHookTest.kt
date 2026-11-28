/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.reels.topshare

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.instagram.FixtureDex
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class ReelTopShareHookTest {
    /** The hook the patch writes is in the ReelTopShare the bundle ships, public and static. */
    @Test
    fun theHookIsInTheExtension() {
        val declared = ExtensionDex.classDef(REEL_TOP_SHARE).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$TOP_SHARE_HOOK is not in the extension: $declared", TOP_SHARE_HOOK.substringAfter("->") in declared)
    }

    /**
     * On each Instagram APK in the fixture folder, the Reels viewer's double tap is found and asks the
     * hook first thing, with the listener's View field and the tap, and returns true when it says so.
     */
    @Test
    fun everyBuildAsksTheHookFirstInTheReelsDoubleTap() {
        for (apk in Fixtures.apks()) {
            val listeners = FixtureDex.subclasses(apk, setOf("Landroid/view/GestureDetector\$SimpleOnGestureListener;"))
            val context = PatchContexts.of(FixtureDex.withStringPools(apk, listeners))
            val found = context.findReelDoubleTap()
            context.hookReelTopShare(found)

            val method = context.mutableClassDefBy(found.listener).methods.single { it.name == "onDoubleTap" }
            val code = method.implementation!!.instructions.toList()
            val what = apk.name
            assertEquals("$what: copies this down", Opcode.MOVE_OBJECT_FROM16, code[0].opcode)
            assertEquals("$what: reads the page", Opcode.IGET_OBJECT, code[1].opcode)
            val field = (code[1] as ReferenceInstruction).reference as FieldReference
            assertEquals("$what: the page is a View", "Landroid/view/View;", field.type)
            assertEquals("$what: copies the tap down", Opcode.MOVE_OBJECT_FROM16, code[2].opcode)
            val call = (code[3] as ReferenceInstruction).reference as MethodReference
            assertEquals("$what: asks the hook", TOP_SHARE_HOOK.substringAfter("->"),
                "${call.name}(${call.parameterTypes.joinToString("")})${call.returnType}")
            assertEquals("$what: the hook is asked once", 1, code.count {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == REEL_TOP_SHARE
            })
            assertEquals("$what: returns when it shared", Opcode.RETURN, code[7].opcode)
        }
    }
}
