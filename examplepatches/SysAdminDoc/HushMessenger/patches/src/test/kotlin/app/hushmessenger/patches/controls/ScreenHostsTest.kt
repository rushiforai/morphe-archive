package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
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

    @Test fun everySupportedBuildRecordsItsNameCodeAndMapping() {
        for ((name, codes) in app.hushmessenger.patches.MessengerTarget.VERSIONS) for (code in codes) {
            val profile = controlProfiles.getValue(code)
            val mapping = if (profile === BASE_PROFILE) "base" else controlProfiles.filterValues { it === profile }.keys.min().toString()
            assertEquals("$name|$code|$mapping", originalBuild(name, code.toString(), controlProfiles), "$code")
        }
        // A build that shares another profile reports the lowest code of the builds that share it.
        val shared = controlProfiles + mapOf(348000002 to SYNTHETIC_PROFILE, 348000001 to SYNTHETIC_PROFILE)
        assertEquals("585.0.0.1.91|348000002|348000001", originalBuild("585.0.0.1.91", "348000002", shared))
        // Anything that could break the string, or isn't a version at all, is left for the report to call unknown.
        for ((name, code) in listOf(null to "346814894", "584.0.0.49.98" to null, "584 0" to "346814894", "584\"x" to "346814894",
            "" to "346814894", "584.0.0.49.98" to "0", "584.0.0.49.98" to "2147483648", "584.0.0.49.98" to "-1", "x584" to "346814894")) {
            assertEquals("", originalBuild(name, code, controlProfiles), "$name $code")
        }
    }

    @Test fun theBuildRecordReplacesOnlyTheStubsConstant() {
        val method = originalBuildMethod()
        method.writeOriginalBuild("584.0.0.49.98|346814894|base")
        val code = method.implementation!!.instructions.toList()
        assertEquals(listOf(Opcode.CONST_STRING, Opcode.RETURN_OBJECT), code.map { it.opcode })
        assertEquals("584.0.0.49.98|346814894|base", ((code[0] as ReferenceInstruction).reference as StringReference).string)
        assertEquals(0, (code[0] as OneRegisterInstruction).registerA)
        assertFailsWith<PatchException> { originalBuildMethod("const/4 v0, 0x0\nreturn-object v0").writeOriginalBuild("x") }
        assertFailsWith<PatchException> {
            fixtureMethod(ORIGINAL_BUILD, "const-string v0, \"\"\nreturn-object v1", 2, AccessFlags.STATIC.value).writeOriginalBuild("x")
        }
        assertFailsWith<PatchException> {
            fixtureMethod(ORIGINAL_BUILD.replace("originalBuild", "other"), "const-string v0, \"\"\nreturn-object v0", 1,
                AccessFlags.STATIC.value).writeOriginalBuild("x")
        }
    }

    /** Messenger's push, add and set go through HostScreens on the same registers, results and all. Nothing else changes. */
    @Test fun messengersShortcutWritesGoThroughHostScreens() {
        val method = fixtureMethod(SHORTCUT_WRITER, """
            invoke-virtual {p1, p2}, Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V
            move-object v0, p1
            move-object v1, p3
            invoke-virtual/range {v0 .. v1}, Landroid/content/pm/ShortcutManager;->addDynamicShortcuts(Ljava/util/List;)Z
            move-result v2
            invoke-virtual {p1, p3}, Landroid/content/pm/ShortcutManager;->setDynamicShortcuts(Ljava/util/List;)Z
            move-result v2
            invoke-virtual {p1, p3}, Landroid/content/pm/ShortcutManager;->removeDynamicShortcuts(Ljava/util/List;)V
            return-void
        """.trimIndent())
        val before = method.implementation!!.instructions.toList()
        assertEquals(3, method.followShortcutWrites())
        val after = method.implementation!!.instructions.toList()
        assertEquals(before.size, after.size)
        val helpers = SHORTCUT_WRITES.values.toList()
        for ((index, helper) in listOf(0 to helpers[0], 3 to helpers[1], 5 to helpers[2])) {
            val stock = before[index]
            val call = after[index]
            assertEquals(if (stock is RegisterRangeInstruction) Opcode.INVOKE_STATIC_RANGE else Opcode.INVOKE_STATIC, call.opcode, "$index")
            assertEquals(helper, (call as ReferenceInstruction).reference.toString())
            assertEquals(registers(stock), registers(call), "$index")
        }
        // Moves, results and Messenger's removals stay as they were.
        for (index in listOf(1, 2, 4, 6, 7, 8)) assertSame(before[index], after[index], "$index")
        assertEquals(0, method.followShortcutWrites())
    }

    /** HostScreens writes the pair itself, so its own calls are never sent back through it. */
    @Test fun theExtensionsOwnShortcutWritesStayDirect() {
        val write = "invoke-virtual {p1, p2}, Landroid/content/pm/ShortcutManager;->pushDynamicShortcut(Landroid/content/pm/ShortcutInfo;)V\nreturn-void"
        val messenger = fixtureClass("LX/8fT;", listOf(fixtureMethod(SHORTCUT_WRITER, write), fixtureMethod("LX/8fT;->A01()V", "return-void")))
        val ours = fixtureClass(HOST_SCREENS, listOf(fixtureMethod(SHORTCUT_WRITER.replace("LX/8fT;", HOST_SCREENS), write)))
        assertEquals(mapOf("LX/8fT;" to setOf(SHORTCUT_WRITER)), shortcutWriters(listOf(messenger, ours)))
    }

    /**
     * 584 pushes conversation shortcuts from seven places, adds from two in its compat helper and sets from one for page
     * message notifications. A new build has to have its count written here.
     */
    @Test fun everySupportedBuildSendsEveryShortcutWriteThroughHostScreens() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        org.junit.jupiter.api.Assumptions.assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val expected = app.hushmessenger.patches.MessengerTarget.VERSION_CODES
            .associateWith { mapOf("messengerPushed" to 7, "messengerAdded" to 2, "messengerSet" to 1) }
        val apks = java.nio.file.Files.list(java.nio.file.Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-').toInt()
            val dex = com.android.tools.smali.dexlib2.DexFileFactory.loadDexContainer(apk.toFile(),
                com.android.tools.smali.dexlib2.Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
            val writers = shortcutWriters(classes.values).flatMap { (type, ids) ->
                classes.getValue(type).methods.filter { it.hookId() in ids }.map { MutableMethod(it) }
            }
            val calls = writers.flatMap { it.shortcutWrites().values }
            assertEquals(expected[code], calls.groupingBy { it.substringAfter("->").substringBefore('(') }.eachCount(), "$code")
            assertEquals(calls.size, writers.sumOf { it.followShortcutWrites() }, "$code")
            assertTrue(writers.all { it.shortcutWrites().isEmpty() }, "$code")
        }
    }
}

private const val SHORTCUT_WRITER = "LX/8fT;->A00(Landroid/content/pm/ShortcutManager;Landroid/content/pm/ShortcutInfo;Ljava/util/List;)V"

private fun registers(instruction: com.android.tools.smali.dexlib2.iface.instruction.Instruction): List<Int> = when (instruction) {
    is RegisterRangeInstruction -> (instruction.startRegister until instruction.startRegister + instruction.registerCount).toList()
    is com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction ->
        listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG)
            .take(instruction.registerCount)
    else -> emptyList()
}
