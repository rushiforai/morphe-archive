package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import kotlin.test.*

class ScreenHostsTest {
    @Test fun theFactoryAsksHostScreensFirstAndHandsOverTheApplication() {
        val activity = factoryActivity()
        val application = factoryApplication()
        val stockActivity = activity.implementation!!.instructions.toList()
        val stockApplication = application.implementation!!.instructions.toList()
        injectFactory(activity, application)

        val code = activity.implementation!!.instructions.toList()
        val call = code[0] as RegisterRangeInstruction
        assertEquals("$HOST_SCREENS->activityFor(Ljava/lang/String;Landroid/content/Intent;)Landroid/app/Activity;",
            (call as ReferenceInstruction).reference.toString())
        // p2 and p3, the class name and the intent, sit after `this` and the class loader: v10 and v11 of 12.
        assertEquals(10, call.startRegister)
        assertEquals(2, call.registerCount)
        assertEquals(listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ, Opcode.RETURN_OBJECT), code.subList(1, 4).map { it.opcode })
        assertTrue(code.subList(1, 4).all { (it as OneRegisterInstruction).registerA == 0 })
        // Anything that isn't a HushMessenger screen goes to the untouched stock body.
        assertEquals(code[2].codeUnits + code[3].codeUnits, (code[2] as OffsetInstruction).codeOffset)
        assertEquals(stockActivity, code.drop(4))

        val app = application.implementation!!.instructions.toList()
        assertEquals(stockApplication.size + 1, app.size)
        assertEquals(stockApplication.dropLast(1), app.take(stockApplication.size - 1))
        val handover = app[app.size - 2] as RegisterRangeInstruction
        assertEquals("$HOST_SCREENS->applicationCreated(Landroid/app/Application;)V", (handover as ReferenceInstruction).reference.toString())
        // The call passes the register the method returns, just before it returns.
        assertEquals(1, handover.startRegister)
        assertEquals(1, handover.registerCount)
        assertSame(stockApplication.last(), app.last())
    }

    @Test fun aChangedFactoryFailsBeforeAnyEdit() {
        fun rejected(activity: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod = factoryActivity(),
                     application: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod = factoryApplication()) {
            val before = activity.implementation!!.instructions.toList() to application.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { injectFactory(activity, application) }
            assertEquals(before, activity.implementation!!.instructions.toList() to application.implementation!!.instructions.toList())
        }
        // No local register for the result.
        rejected(activity = factoryActivity(registers = 4))
        rejected(activity = factoryActivity(id = INSTANTIATE_ACTIVITY.replace("instantiateActivity", "instantiateService")))
        rejected(activity = factoryActivity(id = INSTANTIATE_ACTIVITY.replace("M4aAppComponentFactory", "Other")))
        rejected(application = factoryApplication("""
            invoke-super {p0, p1, p2}, Landroid/app/AppComponentFactory;->instantiateApplication(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroid/app/Application;
            move-result-object v1
            if-eqz v1, :missing
            return-object v1
            :missing
            const/4 v0, 0x0
            return-object v0
        """.trimIndent()))
        rejected(application = factoryApplication("""
            invoke-super {p0, p1, p2}, Landroid/app/AppComponentFactory;->instantiateApplication(Ljava/lang/ClassLoader;Ljava/lang/String;)Landroid/app/Application;
            move-result-object v1
            if-eqz v1, :done
            :done
            return-object v1
        """.trimIndent()))
        val static = fixtureMethod(INSTANTIATE_ACTIVITY, "const/4 v0, 0x0\nreturn-object v0", 12,
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        rejected(activity = static)
    }

    @Test fun theControlListHoldsEveryAppliedKeyInOrder() {
        val method = bundledControlsMethod()
        method.writeBundledControls(setOf("people"))
        method.writeBundledControls(sortedSetOf("people", "ads", "menu_row"))
        val code = method.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.CONST_STRING, Opcode.RETURN_OBJECT), code.map { it.opcode })
        assertEquals("ads,menu_row,people", ((code[0] as ReferenceInstruction).reference as StringReference).string)
        assertEquals(0, (code[0] as OneRegisterInstruction).registerA)
        assertFailsWith<PatchException> { bundledControlsMethod("const/4 v0, 0x0\nreturn-object v0").writeBundledControls(setOf("ads")) }
        assertFailsWith<PatchException> {
            fixtureMethod(BUNDLED_CONTROLS.replace("bundledControls", "other"), "const-string v0, \"\"\nreturn-object v0", 1,
                AccessFlags.STATIC.value).writeBundledControls(setOf("ads"))
        }
    }
}
