/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.navigation.starttab

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.settings.MAIN_TAB_ACTIVITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21s
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Open on a chosen tab over a few stand-in classes: which method counts as Facebook's start tab
 * picker and as each of the three start-up steps the patch hooks, what the patch refuses, and the
 * calls it puts in each.
 */
class StartTabPatchTest {
    private val fragmentActivity = "Lcom/facebook/base/activity/FbFragmentActivity;"
    private val context = "Landroid/content/Context;"
    private val session = "Lcom/facebook/auth/usersession/FbUserSession;"
    private val hasExtra = ImmutableMethodReference(INTENT, "hasExtra", listOf("Ljava/lang/String;"), "Z")
    private val getLongExtra = ImmutableMethodReference(INTENT, "getLongExtra", listOf("Ljava/lang/String;", "J"), "J")

    private val startOps = "Lfixture/StartOps;"
    private val tabBar = "Lfixture/TabBar;"
    private val tabBarState = "Lfixture/TabBarState;"
    private val mainViews = "Lfixture/MainViews;"
    private val flag = "$MOBILE_CONFIG->flag(Ljava/lang/Object;J)Z"

    private fun parameters(types: List<String>) = types.map { ImmutableMethodParameter(it, null, null) }

    /**
     * A picker as Facebook writes it, trimmed: this, the context, the intent in v5 and the session;
     * the literal, the two reads of it, and the long it answers. Each part can be left out.
     */
    private fun picker(
        owner: String = "Lfixture/StartTabPicker;",
        literal: String = TARGET_TAB_ID,
        asks: Boolean = true,
        reads: Boolean = true,
        returnType: String = "J",
        parameterTypes: List<String> = listOf(context, INTENT, session),
    ): Method {
        val body = mutableListOf<Instruction>(ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(literal)))
        if (asks) {
            body += ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 5, 0, 0, 0, 0, hasExtra)
            body += ImmutableInstruction11x(Opcode.MOVE_RESULT, 1)
        }
        body += ImmutableInstruction21s(Opcode.CONST_WIDE_16, 1, -1)
        if (reads) {
            body += ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 4, 5, 0, 1, 2, 0, getLongExtra)
            body += ImmutableInstruction11x(Opcode.MOVE_RESULT_WIDE, 1)
        }
        body += ImmutableInstruction11x(Opcode.RETURN_WIDE, 1)
        return ImmutableMethod(
            owner, "A00", parameters(parameterTypes), returnType, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null, null, ImmutableMethodImplementation(7, body, null, null),
        )
    }

    private fun method(
        owner: String,
        name: String,
        parameterTypes: List<String>,
        returnType: String,
        registers: Int,
        static: Boolean,
        smali: String,
    ): MutableMethod = MutableMethod(
        ImmutableMethod(
            owner, name, parameters(parameterTypes), returnType,
            AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0),
            null, null, ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, smali) }

    /**
     * The start-up step that sanitizes the main screen's intent, as Facebook's dispatcher runs it
     * when the step's name comes up: the copy is built in v3 from the action and the link, the last
     * kept extra is copied over, and the screen in p0 gets the copy. Parts can be changed.
     */
    private fun sanitizer(
        step: String = SANITIZE_INTENT,
        kept: String = KEPT_EXTRA,
        copyBuiltFrom: String = "Ljava/lang/String;Landroid/net/Uri;",
        handedOver: String = "v3",
    ) = method(
        startOps, "run", listOf("Landroid/app/Activity;", "Ljava/lang/String;"), "V", 6, static = true,
        smali = """
            const-string v0, "$step"
            invoke-virtual { p1, v0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :done
            invoke-virtual { p0 }, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
            move-result-object v1
            invoke-virtual { v1 }, Landroid/content/Intent;->getAction()Ljava/lang/String;
            move-result-object v2
            invoke-virtual { v1 }, Landroid/content/Intent;->getData()Landroid/net/Uri;
            move-result-object v0
            new-instance v3, Landroid/content/Intent;
            invoke-direct { v3, v2, v0 }, Landroid/content/Intent;-><init>($copyBuiltFrom)V
            const-string v2, "$kept"
            invoke-virtual { v1, v2 }, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
            move-result-object v0
            if-eqz v0, :set
            invoke-virtual { v3, v2, v0 }, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
            :set
            invoke-virtual { p0, $handedOver }, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V
            :done
            return-void
        """,
    )

    /**
     * The tab bar's start position, trimmed: with the boolean off it asks the MobileConfig gate, and
     * with the gate on it hands the start tab it was built with, a long, to a lookup answering the
     * tab's position. [branchOn] and [handed] name the registers the branch and the lookup read.
     */
    private fun startPosition(
        trace: String = START_POSITION,
        parameter: String = "Z",
        branchOn: String = "v0",
        startTabOwner: String = tabBar,
        handed: String = "v0, v1",
        jumpToBranch: Boolean = false,
    ) = method(
        tabBar, "position", listOf(parameter), "V", 6, static = false,
        smali = """
            const-string v0, "$trace"
            if-nez p1, :fallback
            invoke-static { }, Lfixture/Config;->get()Ljava/lang/Object;
            move-result-object v2
            const-wide v0, 0x101001e00e40150L
            invoke-static { v2, v0, v1 }, $flag
            move-result v0
            ${if (jumpToBranch) ":check" else ""}
            if-eqz $branchOn, :fallback
            iget-wide v0, p0, $startTabOwner->startTab:J
            invoke-static { }, $tabBarState->get()$tabBarState
            move-result-object v2
            invoke-virtual { v2, $handed }, $tabBarState->indexOf(J)Ljava/lang/Integer;
            move-result-object v0
            if-eqz v0, :fallback
            invoke-virtual { v0 }, Ljava/lang/Integer;->intValue()I
            move-result v1
            goto :set
            :fallback
            ${if (jumpToBranch) "if-nez p1, :check" else ""}
            const/4 v1, 0x0
            :set
            iput v1, p0, $tabBar->position:I
            return-void
        """,
    )

    /**
     * The main screen's check that it keeps its start tab, trimmed: static, the screen and its own
     * class, the intent's "target_tab_id" against the long it keeps. The answer ends up in p0, v5,
     * which Facebook's code reuses once it's done with the screen.
     */
    private fun keepsCheck(
        owner: String = mainViews,
        static: Boolean = true,
        literal: String = TARGET_TAB_ID,
        screen: String = MAIN_TAB_ACTIVITY,
        keptLongOwner: String = owner,
    ) = method(
        owner, "keeps", listOf(screen, owner), "Z", 7, static,
        smali = """
            invoke-virtual { p0 }, $fragmentActivity->getIntent()Landroid/content/Intent;
            move-result-object v3
            const/4 p0, 0x0
            if-eqz v3, :done
            const-string v2, "$literal"
            invoke-virtual { v3, v2 }, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z
            move-result v0
            if-eqz v0, :done
            const-wide/16 v0, -0x1
            invoke-virtual { v3, v2, v0, v1 }, Landroid/content/Intent;->getLongExtra(Ljava/lang/String;J)J
            move-result-wide v3
            iget-wide v1, p1, $keptLongOwner->startTab:J
            cmp-long v0, v3, v1
            if-nez v0, :done
            const/4 p0, 0x1
            :done
            return p0
        """,
    )

    private fun classOf(vararg methods: Method): ClassDef = ImmutableClassDef(
        methods.first().definingClass, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null,
        methods.toList(),
    )

    /** The main screen with no onCreate of its own, and the base activity that declares it. */
    private fun activities(): List<ClassDef> {
        val onCreate = ImmutableMethod(
            fragmentActivity, "onCreate", parameters(listOf("Landroid/os/Bundle;")), "V", AccessFlags.PUBLIC.value,
            null, null, ImmutableMethodImplementation(6, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null),
        )
        return listOf(
            ImmutableClassDef(MAIN_TAB_ACTIVITY, AccessFlags.PUBLIC.value, fragmentActivity, null, null, null, null,
                emptyList<Method>()),
            ImmutableClassDef(fragmentActivity, AccessFlags.PUBLIC.value, "Landroidx/fragment/app/FragmentActivity;",
                null, null, null, null, listOf(onCreate)),
        )
    }

    /** Everything the patch looks for, each part replaceable. */
    private fun build(
        sanitizers: List<Method> = listOf(sanitizer()),
        positions: List<Method> = listOf(startPosition()),
        checks: List<Method> = listOf(keepsCheck()),
    ): List<ClassDef> =
        activities() + classOf(picker()) + ExtensionDex.classDef(SETTINGS_STATUS) +
            (sanitizers + positions + checks).map { classOf(it) }

    private fun Method.body(): List<Instruction> = implementation!!.instructions.toList()

    private val Instruction.reference: String get() = (this as ReferenceInstruction).reference.toString()

    private val Instruction.register: Int get() = (this as OneRegisterInstruction).registerA

    @Test
    fun `the picker answers a long from an intent's target_tab_id, asked for and read`() {
        assertTrue(picksStartTab(picker()))
        assertFalse("another literal", picksStartTab(picker(literal = "target_tab")))
        assertFalse("never asks whether the intent has it", picksStartTab(picker(asks = false)))
        assertFalse("never reads it as a long", picksStartTab(picker(reads = false)))
        assertFalse("answers no tab id", picksStartTab(picker(returnType = "Z")))
        assertFalse("takes no intent", picksStartTab(picker(parameterTypes = listOf(context, session))))
        // The extension loads the same literal to write it, and must never be taken for Facebook's.
        assertFalse(picksStartTab(picker(owner = "Lapp/morphe/extension/facebook/navigation/Fixture;")))
    }

    @Test
    fun `the sanitizing step is the setIntent that hands over a copy built from the action and the link`() {
        val step = sanitizer()
        val index = sanitizedIntentHandOver(step)!!
        assertEquals("$ACTIVITY_SET_INTENT", step.body()[index].reference)
        assertNull("another step's name", sanitizedIntentHandOver(sanitizer(step = "sanitize_intents")))
        assertNull("no kept extra", sanitizedIntentHandOver(sanitizer(kept = "app_switch_source_user")))
        assertNull("a copy built another way", sanitizedIntentHandOver(sanitizer(copyBuiltFrom = "Landroid/net/Uri;Ljava/lang/String;")))
        assertNull("hands over another intent", sanitizedIntentHandOver(sanitizer(handedOver = "v1")))
    }

    @Test
    fun `the start position gate is the first MobileConfig read, branched on, guarding the start tab lookup`() {
        val position = startPosition()
        val index = startPositionGate(position)!!
        assertEquals(Opcode.MOVE_RESULT, position.body()[index].opcode)
        assertEquals(flag, position.body()[index - 1].reference)
        assertNull("no trace section", startPositionGate(startPosition(trace = "TabBarController.addTabs")))
        assertNull("another parameter", startPositionGate(startPosition(parameter = "I")))
        assertNull("the branch reads another register", startPositionGate(startPosition(branchOn = "v1")))
        assertNull("the long is another class's", startPositionGate(startPosition(startTabOwner = "Lfixture/Other;")))
        assertNull("the lookup isn't handed the start tab", startPositionGate(startPosition(handed = "v2, v3")))
    }

    @Test
    fun `the keep check is static, takes the screen and its own class, and compares the intent's tab with its own`() {
        assertTrue(keepsAskedStartTab(keepsCheck()))
        assertFalse("not static", keepsAskedStartTab(keepsCheck(static = false)))
        assertFalse("another literal", keepsAskedStartTab(keepsCheck(literal = "target_tab")))
        assertFalse("not the main screen", keepsAskedStartTab(keepsCheck(screen = fragmentActivity)))
        assertFalse("keeps no long of its own", keepsAskedStartTab(keepsCheck(keptLongOwner = "Lfixture/Other;")))
    }

    @Test
    fun `the patch puts each call where it belongs, reading only registers Facebook's code already uses`() {
        val context = PatchContexts.of(build())

        openOnChosenTabPatch.execute(context)

        // First in the onCreate the main screen inherits, with the parameters as they come.
        val onCreate = context.mutableClassDefBy(fragmentActivity).methods.single { it.name == "onCreate" }
        val body = onCreate.body()
        assertEquals(2, body.size)
        val call = body.first()
        assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(ROUTE, call.reference)
        // p0 and p1 of a six-register method: this and the saved state, nothing borrowed.
        assertEquals(4 to 2, (call as RegisterRangeInstruction).startRegister to call.registerCount)
        assertEquals(Opcode.RETURN_VOID, body.last().opcode)

        // The sanitizing step's setIntent, now the extension's, on the screen and the copy.
        val step = context.mutableClassDefBy(startOps).methods.single().body()
        val handOver = step.single { (it as? ReferenceInstruction)?.reference?.toString() == SET_SANITIZED_INTENT }
        assertEquals(Opcode.INVOKE_STATIC, handOver.opcode)
        assertEquals(listOf(4, 3), handOver.callRegisters())
        assertTrue("the old setIntent is still there", step.none { (it as? ReferenceInstruction)?.reference?.toString() == ACTIVITY_SET_INTENT })

        // Right after the gate's move-result, and before the branch that reads it.
        val position = context.mutableClassDefBy(tabBar).methods.single().body()
        val gate = position.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == flag } + 1
        assertEquals(Opcode.MOVE_RESULT, position[gate].opcode)
        val asks = position[gate + 1]
        assertEquals(Opcode.INVOKE_STATIC_RANGE, asks.opcode)
        assertEquals(START_ON_ASKED_TAB, asks.reference)
        assertEquals(listOf(0), asks.callRegisters())
        assertEquals(Opcode.MOVE_RESULT, position[gate + 2].opcode)
        assertEquals(0, position[gate + 2].register)
        assertEquals(Opcode.IF_EQZ, position[gate + 3].opcode)
        assertEquals(0, position[gate + 3].register)

        // In place of the check's return, so every branch to the return goes through it.
        val check = context.mutableClassDefBy(mainViews).methods.single()
        val checkBody = check.body()
        val keep = checkBody.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == KEEP_ASKED_START_TAB }
        assertEquals(listOf(5), checkBody[keep].callRegisters())
        assertEquals(Opcode.MOVE_RESULT, checkBody[keep + 1].opcode)
        assertEquals(5, checkBody[keep + 1].register)
        assertEquals(Opcode.RETURN, checkBody[keep + 2].opcode)
        assertEquals(5, checkBody[keep + 2].register)
        assertEquals("a return skips the extension", 1, checkBody.count { it.opcode == Opcode.RETURN })
        val branches = check.implementation!!.instructions.filterIsInstance<BuilderOffsetInstruction>()
            .filter { it.opcode == Opcode.IF_EQZ || it.opcode == Opcode.IF_NEZ }
        assertEquals(3, branches.size)
        branches.forEach { assertEquals("a branch lands past the extension", keep, it.target.location.index) }

        val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "startTab" }
        val answer = status.body().first { it is NarrowLiteralInstruction }
        assertEquals("the settings screen isn't told the patch is in", 1, (answer as NarrowLiteralInstruction).narrowLiteral)
    }

    @Test
    fun `a build whose picker can't be told apart is refused, naming the extra`() {
        val none = assertThrows(PatchException::class.java) {
            openOnChosenTabPatch.execute(PatchContexts.of(activities() + ExtensionDex.classDef(SETTINGS_STATUS)))
        }
        assertTrue(none.message, none.message!!.contains("\"$TARGET_TAB_ID\", found 0"))

        val two = assertThrows(PatchException::class.java) {
            openOnChosenTabPatch.execute(
                PatchContexts.of(build() + classOf(picker(owner = "Lfixture/SecondPicker;"))),
            )
        }
        assertTrue(two.message, two.message!!.contains("found 2"))
    }

    /** A build missing a start-up step, or with two, is refused before anything changes. */
    @Test
    fun `a build whose start-up steps can't be told apart is refused, naming the step`() {
        fun refusal(classes: List<ClassDef>): String {
            val context = PatchContexts.of(classes)
            val message = assertThrows(PatchException::class.java) { openOnChosenTabPatch.execute(context) }.message!!
            val onCreate = context.mutableClassDefBy(fragmentActivity).methods.single { it.name == "onCreate" }
            assertEquals("$message, yet the patch went in", 1, onCreate.body().size)
            return message
        }

        val noStep = refusal(build(sanitizers = emptyList()))
        assertTrue(noStep, noStep.contains("\"$SANITIZE_INTENT\"), found 0"))

        val noGate = refusal(build(positions = listOf(startPosition(branchOn = "v1"))))
        assertTrue(noGate, noGate.contains("\"$START_POSITION\"") && noGate.contains("found 0"))

        val twoChecks = refusal(build(checks = listOf(keepsCheck(), keepsCheck(owner = "Lfixture/OtherViews;"))))
        assertTrue(twoChecks, twoChecks.contains("keeps the start tab") && twoChecks.contains("found 2"))
    }

    @Test
    fun `a gate whose branch something else jumps to is refused`() {
        val context = PatchContexts.of(build(positions = listOf(startPosition(jumpToBranch = true))))
        val refused = assertThrows(PatchException::class.java) { openOnChosenTabPatch.execute(context) }
        assertTrue(refused.message, refused.message!!.contains("has a jump to its start position gate's branch"))
    }

    private companion object {
        const val ACTIVITY_SET_INTENT = "Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V"
    }
}
