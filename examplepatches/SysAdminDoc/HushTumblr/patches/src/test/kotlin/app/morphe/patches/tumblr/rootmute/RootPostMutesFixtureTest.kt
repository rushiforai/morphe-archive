/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.rootmute

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.patches.tumblr.timeline.POST
import app.morphe.patches.tumblr.timeline.postJsonPresencePatch
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import org.junit.Assert.*
import org.junit.Test
import org.junit.experimental.categories.Category

@Category(FixtureTests::class)
class RootPostMutesFixtureTest {
    private val owners = setOf(POST, POST.removeSuffix(";") + "JsonAdapter;", ROOT_POST_WRAPPER, ROOT_MENU_OWNER,
        LOCAL_TIMELINE, ROOT_TIMELINE_OBJECT, "Lxrl;", "Liwj;", "Lag9;", "Lfnm;",
        "Lcom/tumblr/ui/widget/PostCardHeader;", "Lcom/tumblr/ui/fragment/TimelineFragment\$a;",
        "Lcom/tumblr/components/bottomsheet/b\$a;", "Lcom/tumblr/components/bottomsheet/b\$b;")

    @Test
    fun `native root bridges menu action and local cache rebind preserve their actual values`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            postJsonPresencePatch.execute(context)
            val plan = context.resolveRootPostMutes()
            assertEquals(listOf("$POST->K0()Ljava/lang/String;", "$POST->G0()Ljava/lang/String;", "$POST->z0()Ljava/lang/String;",
                "$POST->B0()Ljava/util/List;"), plan.roots[0].getters)
            muteRootPostsPatch.execute(context)
            for (root in plan.roots) {
                val owner = context.mutableClassDefBy(root.owner)
                assertTrue(HUSH_ROOT_POST in owner.interfaces)
                val bridge = owner.methods.single { it.name == "hushRootId" }.instructionList()
                if (root.owner == POST) {
                    assertEquals(root.getters + CANONICAL_ROOT, bridge.mapNotNull { it.methodRef()?.toString() })
                    assertEquals(ROOT_TRAIL_PRESENT, bridge[8].fieldRef().toString())
                    assertEquals(listOf(0, 1, 2, 3, 4), (bridge[9] as FiveRegisterInstruction)
                        .let { listOf(it.registerC, it.registerD, it.registerE, it.registerF, it.registerG) })
                } else assertEquals(WRAPPED_CANONICAL_ROOT, bridge.first().fieldRef().toString())
            }
            val capture = plan.wrapperConstructor.instructionList()
            assertEquals("$HUSH_ROOT_POST->hushRootId()Ljava/lang/String;", capture[1].methodRef().toString())
            assertEquals(WRAPPED_CANONICAL_ROOT, capture[3].fieldRef().toString())
            val reader = context.mutableClassDefBy(POST.removeSuffix(";") + "JsonAdapter;").methods.single {
                it.name == "fromJson" && it.returnType == "Ljava/lang/Object;"
            }.instructionList()
            assertEquals(ROOT_JSON_SET, reader[2170].methodRef().toString())
            assertEquals(listOf(4, 154, 158), reader.subList(2167, 2170).map { (it as TwoRegisterInstruction).registerB })
            assertEquals(listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_FROM16, Opcode.MOVE_FROM16), reader.subList(2167, 2170).map { it.opcode })
            val presence = context.mutableClassDefBy(POST)
            assertEquals(setOf("hushRootTrailPresent", "hushPaidContextKnown"), presence.fields.filter {
                it.name in setOf("hushRootTrailPresent", "hushPaidContextKnown") && it.type == "Z"
            }.map { it.name }.toSet())
            assertEquals(1, presence.methods.count { it.name == "hushSetJsonPresence" })
            assertFalse(presence.methods.any { it.name == "hushPaidContextKnown" })
            val body = plan.menu.instructionList()
            assertEquals(ROOT_MENU_HOOK, body[plan.at + 2].methodRef().toString())
            assertEquals(listOf(11, plan.scratch[0], 10, plan.scratch[1]), (body[plan.at + 2] as FiveRegisterInstruction)
                .let { listOf(it.registerC, it.registerD, it.registerE, it.registerF) })
            val finalizer = plan.at + 3
            val flow = ControlFlow.of(plan.menu)
            assertEquals(listOf(finalizer - 1), flow.normal.indices.filter { finalizer in flow.normal[it] })
            val timeline = context.mutableClassDefBy(LOCAL_TIMELINE)
            val snapshot = timeline.methods.single { it.name == "hushTimelineItems" }.instructionList()
            assertEquals("$LOCAL_TIMELINE->z:Ljava/util/List;", snapshot[1].fieldRef().toString())
            assertEquals("Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V", snapshot[2].methodRef().toString())
            val local = timeline.methods.single { it.name == "hushApplyTimelineItems" }.instructionList()
            assertEquals("Lxrl;->FROM_CACHE:Lxrl;", local[0].fieldRef().toString())
            assertEquals("$LOCAL_TIMELINE->l6(Lxrl;Ljava/util/List;)V", local[1].methodRef().toString())
            assertTrue("Lag9;" in context.mutableClassDefBy(ROOT_ACTION).interfaces)
            val add = context.mutableClassDefBy(ROOT_MENU).methods.single { it.name == "addNative" }.instructionList()
            assertEquals("Lcom/tumblr/components/bottomsheet/b\$b;->c(Ljava/lang/String;Lag9;)Lcom/tumblr/components/bottomsheet/b\$b;", add[1].methodRef().toString())
            val unit = context.mutableClassDefBy(ROOT_MENU).methods.single { it.name == "unit" }.instructionList()
            assertEquals("Lfnm;->a:Lfnm;", unit[0].fieldRef().toString())
            for (name in listOf("muteRootPosts", "rootPostMutes")) assertEquals(1,
                (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    @Test
    fun `redesigned header menus include the local action before native finalization`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            postJsonPresencePatch.execute(context)
            val plan = context.resolveRootPostMutes()
            val before = ControlFlow.of(plan.header.method)
            muteRootPostsPatch.execute(context)
            val menu = plan.header.method
            val body = menu.instructionList()
            assertEquals(1, body.count { it.methodRef()?.toString() == ROOT_MENU_HOOK })
            assertEquals(listOf(11, 3, 2, plan.header.scratch), (body[165] as FiveRegisterInstruction)
                .let { listOf(it.registerC, it.registerD, it.registerE, it.registerF) })
            assertEquals(24, (body[164] as TwoRegisterInstruction).registerB)
            assertEquals("Lcom/tumblr/components/bottomsheet/b\$b;->h()Lcom/tumblr/components/bottomsheet/b;", body[166].methodRef().toString())
            assertEquals(listOf(165), ControlFlow.of(menu).normal.indices.filter { 166 in ControlFlow.of(menu).normal[it] })
            assertNativePreserved(before, ControlFlow.of(menu), 164, 2)
            val callback = context.mutableClassDefBy(ROOT_MENU_CALLBACK)
            assertTrue(HUSH_ROOT_MENU_HOST in callback.interfaces)
            val bridge = callback.methods.single { it.name == "hushTimelineOwner" }
            assertEquals(HUSH_LOCAL_TIMELINE, bridge.returnType)
            assertEquals(listOf(Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT), bridge.instructionList().map { it.opcode })
            assertEquals("$ROOT_MENU_CALLBACK->a:$LOCAL_TIMELINE", bridge.instructionList()[0].fieldRef().toString())
        }
    }

    @Test
    fun `owned blog native menus include the same account gated local action`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            postJsonPresencePatch.execute(context)
            val plan = context.resolveRootPostMutes()
            val before = ControlFlow.of(plan.owned.method)
            muteRootPostsPatch.execute(context)
            val menu = plan.owned.method
            val body = menu.instructionList()
            assertEquals(1, body.count { it.methodRef()?.toString() == ROOT_MENU_HOOK })
            assertEquals(listOf(10, 2, plan.owned.scratch, 0), (body[236] as FiveRegisterInstruction)
                .let { listOf(it.registerC, it.registerD, it.registerE, it.registerF) })
            assertEquals("$ROOT_MENU_CALLBACK->a:$LOCAL_TIMELINE", body[233].fieldRef().toString())
            assertEquals("Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;", body[234].methodRef().toString())
            assertEquals(listOf(239, 273), body.indices.filter {
                body[it].methodRef()?.toString() == "Lcom/tumblr/components/bottomsheet/b\$b;->h()Lcom/tumblr/components/bottomsheet/b;"
            })
            assertNativePreserved(before, ControlFlow.of(menu), 233, 4)
        }
    }

    @Test
    fun `a redesigned menu with a replaced callback refuses every menu mutation`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            context.mutableClassDefBy(ROOT_HEADER).methods.single { it.name == "H2" }
                .replaceInstruction(163, "move-object/from16 v24, v23")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    @Test
    fun `a redesigned menu with another card refuses before installing bridges`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            context.mutableClassDefBy(ROOT_HEADER).methods.single { it.name == "H2" }
                .replaceInstruction(1, "move-object/from16 v3, v23")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    @Test
    fun `a callback retaining another fragment refuses before installing menu hooks`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            context.mutableClassDefBy(ROOT_MENU_CALLBACK).methods.single { it.name == "<init>" }
                .replaceInstruction(0, "iput-object p0, p0, $ROOT_MENU_CALLBACK->a:$LOCAL_TIMELINE")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    @Test
    fun `an owned blog menu with another builder refuses before installing menu hooks`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            context.mutableClassDefBy(ROOT_MENU_CALLBACK).methods.single { it.name == "a" }
                .replaceInstruction(269, "invoke-virtual { v11 }, Lcom/tumblr/components/bottomsheet/b\$b;->h()Lcom/tumblr/components/bottomsheet/b;")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    @Test
    fun `neither owned blog finalizer may bypass the common local action site`() {
        for (build in Fixtures.declaredBuilds()) for (finalizer in listOf(235, 269)) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            val menu = context.mutableClassDefBy(ROOT_MENU_CALLBACK).methods.single { it.name == "a" }
            val body = menu.implementation!!
            body.replaceInstruction(232, BuilderInstruction20t(Opcode.GOTO_16, body.newLabelForIndex(finalizer)))
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    private fun assertNativePreserved(before: ControlFlow, after: ControlFlow, at: Int, count: Int) {
        val kept = after.instructions.take(at) + after.instructions.drop(at + count)
        assertEquals(before.instructions.size, kept.size)
        before.instructions.zip(kept).forEach { (old, actual) ->
            assertEquals(old.opcode, actual.opcode)
            if (old is ReferenceInstruction) assertEquals(old.reference.toString(), (actual as ReferenceInstruction).reference.toString())
            if (old is OneRegisterInstruction) assertEquals(old.registerA, (actual as OneRegisterInstruction).registerA)
            if (old is TwoRegisterInstruction) assertEquals(old.registerB, (actual as TwoRegisterInstruction).registerB)
            if (old is ThreeRegisterInstruction) assertEquals(old.registerC, (actual as ThreeRegisterInstruction).registerC)
            if (old is FiveRegisterInstruction) assertEquals(listOf(old.registerCount, old.registerC, old.registerD, old.registerE, old.registerF, old.registerG),
                (actual as FiveRegisterInstruction).let { listOf(it.registerCount, it.registerC, it.registerD, it.registerE, it.registerF, it.registerG) })
            if (old is RegisterRangeInstruction) assertEquals(listOf(old.startRegister, old.registerCount),
                (actual as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
            if (old is WideLiteralInstruction) assertEquals(old.wideLiteral, (actual as WideLiteralInstruction).wideLiteral)
        }
        for (old in before.instructions.indices) {
            val index = if (old < at) old else old + count
            fun target(value: Int) = if (value <= at) value else value + count
            assertEquals(before.normal[old].map(::target), after.normal[index])
            assertEquals(before.exceptional[old].map(::target), after.exceptional[index])
        }
    }

    @Test
    fun `a missing root key refuses before the post menu list or capability changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            val writer = context.mutableClassDefBy(POST.removeSuffix(";") + "JsonAdapter;").methods.single {
                it.name == "toJson" && it.parameterTypes.size == 2 && it.returnType == "V"
            }
            val at = writer.instructionList().indexOfFirst { it.stringRef() == "reblogged_root_id" }
            val register = (writer.instructionList()[at] as OneRegisterInstruction).registerA
            writer.replaceInstruction(at, "const-string v$register, \"unknown_root_key\"")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    @Test
    fun `an append cache mode refuses before installing a local action`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            val mode = context.mutableClassDefBy("Lxrl;").methods.single { it.name == "g" }
            mode.replaceInstruction(4, "const/4 p0, 0x1")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    @Test
    fun `another JSON mask cannot prove the original post's trail was present`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            val reader = context.mutableClassDefBy(POST.removeSuffix(";") + "JsonAdapter;").methods.single {
                it.name == "fromJson" && it.returnType == "Ljava/lang/Object;"
            }
            reader.replaceInstruction(2070, "move/from16 v158, v6")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    @Test
    fun `a trail presence bit cleared into another register refuses before edits`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            val reader = context.mutableClassDefBy(POST.removeSuffix(";") + "JsonAdapter;").methods.single {
                it.name == "fromJson" && it.returnType == "Ljava/lang/Object;"
            }
            reader.replaceInstruction(394, "and-int/lit8 v4, v7, -0x2")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    @Test
    fun `a root only installation refuses a replaced first presence mask`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            val reader = context.mutableClassDefBy(POST.removeSuffix(";") + "JsonAdapter;").methods.single {
                it.name == "fromJson" && it.returnType == "Ljava/lang/Object;"
            }
            reader.replaceInstruction(2126, "move/from16 v154, v9")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    @Test
    fun `another successful return cannot bypass the shared presence hook`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            val reader = context.mutableClassDefBy(POST.removeSuffix(";") + "JsonAdapter;").methods.single {
                it.name == "fromJson" && it.returnType == "Ljava/lang/Object;"
            }
            reader.replaceInstruction(2093, "return-object v4")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    @Test
    fun `a replaced current card parameter refuses before its menu is edited`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, owners).values)
            val menu = context.mutableClassDefBy(ROOT_MENU_OWNER).methods.single { it.name == "y" }
            menu.replaceInstruction(224, "move-object/from16 v24, v25")
            assertThrows(PatchException::class.java) { postJsonPresencePatch.execute(context); muteRootPostsPatch.execute(context) }
            assertUnchanged(context)
        }
    }

    private fun assertUnchanged(context: app.morphe.patcher.patch.BytecodePatchContext) {
        assertFalse(HUSH_ROOT_POST in context.mutableClassDefBy(POST).interfaces)
        assertFalse(HUSH_LOCAL_TIMELINE in context.mutableClassDefBy(LOCAL_TIMELINE).interfaces)
        assertFalse("Lag9;" in context.mutableClassDefBy(ROOT_ACTION).interfaces)
        assertFalse(HUSH_ROOT_MENU_HOST in context.mutableClassDefBy(ROOT_MENU_CALLBACK).interfaces)
        assertFalse(context.mutableClassDefBy(ROOT_HEADER).methods.single { it.name == "H2" }.instructionList()
            .any { it.methodRef()?.toString() == ROOT_MENU_HOOK })
        assertFalse(context.mutableClassDefBy(ROOT_MENU_CALLBACK).methods.single { it.name == "a" }.instructionList()
            .any { it.methodRef()?.toString() == ROOT_MENU_HOOK })
        assertFalse(context.mutableClassDefBy(ROOT_MENU_OWNER).methods.single { it.name == "y" }.instructionList()
            .any { it.methodRef()?.toString() == ROOT_MENU_HOOK })
        for (name in listOf("muteRootPosts", "rootPostMutes")) assertEquals(0,
            (context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructionList().first() as NarrowLiteralInstruction).narrowLiteral)
    }
}
