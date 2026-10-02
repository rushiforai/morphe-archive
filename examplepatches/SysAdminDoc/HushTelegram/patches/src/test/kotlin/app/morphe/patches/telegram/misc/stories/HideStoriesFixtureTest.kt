/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.stories

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import java.io.File

/** Exercises the real declared fixture's state merges, including cached rings and community taps. */
class HideStoriesFixtureTest {
    @Test
    fun `every declared build has all five targets and preserves stock profile archive and community paths`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val plan = context.resolveStoryHooks()
            assertEquals("${build.name}: complete coverage", StoryTarget.entries.toSet(), plan.hooks.keys)
            assertTrue("${build.name}: avatar scope is discovered", plan.scope != null)
            // Freeze offsets before dexlib moves the builder instructions and their labels.
            val originalMethods = plan.hooks.mapValues { (_, hook) -> ImmutableMethod.of(hook.method) }
            val original = originalMethods.mapValues { (_, method) -> method.instructions() }
            val unchanged = hosts.flatMap { it.methods.toList() }.filter { method ->
                plan.hooks.values.none { it.method.sameSignature(method) && it.method.definingClass == method.definingClass }
            }
            val warnings = PatchLogCapture.warnings { hideStoriesPatch.execute(context) }
            assertEquals("${build.name}: no missing target", emptyList<String>(), warnings)

            for ((target, hook) in plan.hooks) {
                val after = hook.method.instructions()
                val before = original.getValue(target)
                val injection = INJECTIONS.getValue(target)
                val added = injection.size
                val descriptor = "$STORIES->${HOOKS.getValue(target)}"
                assertEquals("${build.name}: $target explicit injection", injection,
                    after.subList(hook.index, hook.index + added).map { it.opcode })
                assertEquals("${build.name}: $target asks the extension at the resolved site", descriptor,
                    after[hook.index].reference())
                assertEquals("${build.name}: $target reads the result", Opcode.MOVE_RESULT, after[hook.index + 1].opcode)
                val beforePadding = payloadPadding(before)
                val afterPadding = payloadPadding(after)
                val oldIndices = before.indices.filter { it !in beforePadding }
                val newIndices = after.indices.filter { it !in hook.index until hook.index + added && it !in afterPadding }
                assertEquals("${build.name}: $target leaves the original body intact",
                    oldIndices.map { operation(before[it]) }, newIndices.map { operation(after[it]) })
                val oldToNew = oldIndices.zip(newIndices).toMap()
                val beforeFlow = ControlFlow.of(originalMethods.getValue(target))
                val afterFlow = ControlFlow.of(hook.method)
                for (oldIndex in oldIndices) {
                    val destinations = beforeFlow.normal[oldIndex].map { destination ->
                        if (destination == hook.index && target != StoryTarget.REQUESTS) hook.index
                        else oldToNew.getValue(destination)
                    }
                    assertEquals("${build.name}: $target retains flow from original instruction $oldIndex",
                        destinations, afterFlow.normal[oldToNew.getValue(oldIndex)])
                }
                val beforePayloads = payloadTargets(before)
                val afterPayloads = payloadTargets(after)
                assertEquals("${build.name}: $target retains every payload reference", beforePayloads.size, afterPayloads.size)
                for ((source, payload) in beforePayloads) {
                    assertEquals("${build.name}: $target retains payload target from original instruction $source",
                        oldToNew.getValue(payload), afterPayloads.getValue(oldToNew.getValue(source)))
                }
                if (target != StoryTarget.REQUESTS && target != StoryTarget.CAMERA) {
                    assertTrue("${build.name}: $target no old branch bypasses the guard",
                        afterFlow.normal.withIndex().none { (index, targets) -> index !in hook.index until hook.index + added &&
                            hook.index + added in targets && index != hook.index + added - 1 })
                }
            }
            val request = plan.hooks.getValue(StoryTarget.REQUESTS)
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
                request.method.instructions().take(4).map { it.opcode })
            assertEquals(listOf(4), ControlFlow.of(request.method).normal[2].filter { it != 3 })

            val camera = plan.hooks.getValue(StoryTarget.CAMERA)
            val cameraBody = camera.method.instructions()
            val cameraDecision = cameraBody[camera.index].namedRegisters().single()
            assertEquals(cameraDecision, cameraBody[camera.index + 1].namedRegisters().single())
            assertEquals("${build.name}: only the camera receives the filtered decision", cameraDecision,
                cameraBody[camera.index + 2].namedRegisters()[1])
            assertFalse("${build.name}: compose update is before the camera filter",
                cameraBody.take(camera.index).any { it.reference() == "$STORIES->showStoryCamera(Z)Z" })

            val bar = plan.hooks.getValue(StoryTarget.BAR)
            val barBody = bar.method.instructions()
            assertEquals("${build.name}: both own-story and cached peer visibility become empty", listOf(0, 0),
                barBody.subList(bar.index + 3, bar.index + 5).map { (it as NarrowLiteralInstruction).narrowLiteral })
            val avatars = plan.hooks.getValue(StoryTarget.AVATARS)
            val avatarBody = avatars.method.instructions()
            assertEquals("${build.name}: story state, unread state and animation are empty", listOf(0, 0, 0),
                avatarBody.subList(avatars.index + 3, avatars.index + 6).map { (it as NarrowLiteralInstruction).narrowLiteral })
            assertEquals("${build.name}: cached loading state is empty", 0,
                (avatarBody[avatars.index + 6] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.IPUT, avatarBody[avatars.index + 7].opcode)
            assertEquals("I", (avatarBody[avatars.index + 7] as ReferenceInstruction).reference.let { it as FieldReference }.type)
            assertEquals("${build.name}: a cached transition is completed", 0x3f800000,
                (avatarBody[avatars.index + 8] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.IPUT, avatarBody[avatars.index + 9].opcode)
            assertEquals("F", (avatarBody[avatars.index + 9] as ReferenceInstruction).reference.let { it as FieldReference }.type)

            val touches = plan.hooks.getValue(StoryTarget.TOUCHES)
            val touchBody = touches.method.instructions()
            val touchFlow = ControlFlow.of(touches.method)
            val originalCommunityGoto = original.getValue(StoryTarget.TOUCHES).indices.last { it < touches.index &&
                original.getValue(StoryTarget.TOUCHES)[it].opcode in GOTOS }
            assertEquals("${build.name}: story suppression joins the stock community merge",
                touchFlow.normal[originalCommunityGoto], touchFlow.normal[touches.index + 4])
            assertEquals("${build.name}: community true branch bypasses the story suppression", touches.index - 1, originalCommunityGoto)
            assertEquals(0, (touchBody[touches.index + 3] as NarrowLiteralInstruction).narrowLiteral)

            val scope = context.mutableClassDefBy(STORIES).methods.single { it.name == "isDialogAvatar" }.instructions()
            assertEquals(Opcode.INSTANCE_OF, scope[0].opcode)
            assertEquals(Opcode.CHECK_CAST, scope[2].opcode)
            assertEquals(Opcode.IGET_OBJECT, scope[3].opcode)
            assertEquals(Opcode.IGET_BOOLEAN, scope[4].opcode)
            assertEquals(Opcode.IF_NEZ, scope[5].opcode)
            assertEquals(1, (scope[6] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(0, (scope[8] as NarrowLiteralInstruction).narrowLiteral)
            val scopedParams = hosts.single { it.type == (scope[0] as ReferenceInstruction).reference.toString() }
            val scopeOwner = (scope[3] as ReferenceInstruction).reference as FieldReference
            val scopeShare = (scope[4] as ReferenceInstruction).reference as FieldReference
            val scopedCell = hosts.single { it.type == scopeShare.definingClass }
            assertTrue("${build.name}: extension can access the avatar params class", AccessFlags.PUBLIC.isSet(scopedParams.accessFlags))
            assertTrue("${build.name}: extension can access the cell class", AccessFlags.PUBLIC.isSet(scopedCell.accessFlags))
            assertTrue("${build.name}: extension can read the params owner", AccessFlags.PUBLIC.isSet(
                scopedParams.fields.single { it.name == scopeOwner.name && it.type == scopeOwner.type }.accessFlags))
            assertTrue("${build.name}: extension can read Share to Story state", AccessFlags.PUBLIC.isSet(
                scopedCell.fields.single { it.name == scopeShare.name && it.type == scopeShare.type }.accessFlags))
            for (flag in listOf("hideStories") + StoryTarget.entries.map { it.capability }) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.instructions()
                assertEquals("${build.name}: $flag is a build fact", 1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(Opcode.RETURN, status[1].opcode)
            }
            // Kept peer/archive request constructors are included in the small fixture context.
            for (method in unchanged) {
                val after = context.mutableClassDefBy(method.definingClass).methods.single { it.sameSignature(method) }
                assertEquals("${build.name}: keeps $method", method.instructions().map(::operation), after.instructions().map(::operation))
            }
            assertTrue("${build.name}: peer story fetch is retained", unchanged.any { it.constructs(PEER_STORIES) })
            assertTrue("${build.name}: archive fetch is retained", unchanged.any { it.constructs(STORIES_ARCHIVE) })
        }
    }

    @Test
    fun `changed cached bar geometry refuses before any hook or build fact is written`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveStoryHooks()
            val bar = plan.hooks.getValue(StoryTarget.BAR).method
            val changed = bar.instructions().indexOfFirst { it.opcode == Opcode.IPUT_BOOLEAN &&
                ((it as ReferenceInstruction).reference as FieldReference).definingClass == bar.definingClass }
            bar.replaceInstruction(changed, "nop")
            val before = plan.hooks.mapValues { it.value.method.instructions().map(::operation) }
            try {
                hideStoriesPatch.execute(context)
                fail("${build.name}: changed state geometry was accepted")
            } catch (expected: PatchException) {
                assertTrue(expected.message.orEmpty().contains("before editing"))
            }
            for ((target, hook) in plan.hooks) {
                assertEquals("${build.name}: no partial $target mutation", before.getValue(target), hook.method.instructions().map(::operation))
            }
            for (flag in listOf("hideStories") + StoryTarget.entries.map { it.capability }) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.instructions()
                assertEquals("${build.name}: $flag remains false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    @Test
    fun `overwritten or unguarded cached bar values refuse before any hook or build fact is written`() {
        for (build in Fixtures.declaredBuilds()) for (mutation in listOf("self", "visible", "wide", "merge", "bypass")) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveStoryHooks()
            val bar = plan.hooks.getValue(StoryTarget.BAR).method
            val instructions = bar.instructions()
            val stores = instructions.indices.filter { instructions[it].opcode == Opcode.IPUT_BOOLEAN &&
                ((instructions[it] as ReferenceInstruction).reference as FieldReference).definingClass == bar.definingClass }
            val self = instructions[stores[0]].namedRegisters()[0]
            val visible = instructions[stores[2]].namedRegisters()[0]
            when (mutation) {
                "self" -> bar.addInstruction(stores[0] + 1, "const/16 v$self, 0x1")
                "visible" -> bar.addInstructionsAtControlFlowLabel(stores[2], "const/16 v$visible, 0x1")
                "wide" -> bar.addInstructionsAtControlFlowLabel(stores[2], "const-wide/16 v${visible - 1}, 0x1")
                "merge" -> bar.replaceInstruction(stores[0] + 5, "const/16 v$self, 0x1")
                "bypass" -> bar.addInstructionsWithLabels(0, "goto/32 :unguarded",
                    ExternalLabel("unguarded", bar.getInstruction(stores[2])))
            }
            val before = plan.hooks.mapValues { it.value.method.instructions().map(::operation) }
            try {
                hideStoriesPatch.execute(context)
                fail("${build.name}: $mutation mutation was accepted")
            } catch (expected: PatchException) {
                assertTrue(expected.message.orEmpty().contains("before editing"))
            }
            for ((target, hook) in plan.hooks) {
                assertEquals("${build.name}: $mutation leaves $target intact", before.getValue(target),
                    hook.method.instructions().map(::operation))
            }
            for (flag in listOf("hideStories") + StoryTarget.entries.map { it.capability }) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.instructions()
                assertEquals("${build.name}: $mutation leaves $flag false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    @Test
    fun `ambiguous chat list anchor refuses before any target is changed`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val dialogs = hosts.single { it.methods.any { method -> method.instructions().any { instruction ->
                instruction.reference() == STORY_CAMERA_ICON
            } } }
            val create = dialogs.methods.single { it.name == "createView" }
            val duplicateType = "Lorg/telegram/ui/StoryAmbiguityFixture;"
            val duplicate = ImmutableMethod(duplicateType, create.name, create.parameters, create.returnType,
                create.accessFlags, create.annotations, create.hiddenApiRestrictions, create.implementation)
            val second = ImmutableClassDef(duplicateType, AccessFlags.PUBLIC.value, dialogs.superclass,
                dialogs.interfaces, dialogs.sourceFile, null, null, listOf(duplicate))
            val context = PatchContexts.of(ExtensionDex.classes() + hosts + second)
            try {
                hideStoriesPatch.execute(context)
                fail("${build.name}: ambiguous chat-list anchor was accepted")
            } catch (expected: PatchException) {
                assertTrue(expected.message.orEmpty().contains("ambiguous chat list"))
            }
            for (classDef in hosts) for (method in classDef.methods) {
                val after = context.mutableClassDefBy(classDef.type).methods.single { it.sameSignature(method) }
                assertEquals("${build.name}: ambiguity leaves $method intact", method.instructions().map(::operation),
                    after.instructions().map(::operation))
            }
            for (flag in listOf("hideStories") + StoryTarget.entries.map { it.capability }) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.instructions()
                assertEquals("${build.name}: ambiguity leaves $flag false", 0, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    /** Copies only anchor classes and the params/utility classes they reference, never the whole APK. */
    private fun hosts(build: File): List<ClassDef> {
        val anchors = FixtureDex.classesWhere(build, { true }) { method ->
            method.constructs(GET_ALL_STORIES) || method.constructs(PEER_STORIES) || method.constructs(STORIES_ARCHIVE) ||
                method.instructions().any { it.reference() == STORY_CAMERA_ICON || it.reference() == CHAT_PREVIEW_ACTION }
        }
        val cell = anchors.single { classDef -> classDef.methods.any { it.name == "getCurrentDialogFolderId" } }
        val touch = cell.methods.single { it.name == "onInterceptTouchEvent" }.instructions()
        val callAt = touch.indexOfFirst { (it as? ReferenceInstruction)?.reference.let { ref -> ref is MethodReference &&
            ref.parameterTypes.map { it.toString() } == listOf("Landroid/view/MotionEvent;", "Landroid/view/View;") } }
        val base = ((touch[callAt] as ReferenceInstruction).reference as MethodReference).definingClass
        val params = ((touch[callAt - 1] as ReferenceInstruction).reference as FieldReference).type
        val utilities = cell.methods.single { it.name == "onDraw" }.instructions().mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }.single { it.parameterTypes.map { type -> type.toString() } == listOf("J", "Landroid/graphics/Canvas;",
            "Lorg/telegram/messenger/ImageReceiver;", base) }.definingClass
        return (anchors + FixtureDex.classes(build, setOf(base, params, utilities)).values).distinctBy { it.type }
    }

    private fun Method.constructs(type: String) = instructions().any { it.opcode == Opcode.NEW_INSTANCE && it.reference() == type }
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun operation(instruction: Instruction) = instruction.opcode to instruction.reference()
    private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }

    /** dexlib adds/removes only this one-code-unit pad to keep payload addresses even. */
    private fun payloadPadding(instructions: List<Instruction>): Set<Int> {
        var address = 0
        val padding = mutableSetOf<Int>()
        for ((index, instruction) in instructions.withIndex()) {
            if (instruction.opcode == Opcode.NOP && address % 2 == 1 &&
                instructions.getOrNull(index + 1)?.opcode in PAYLOADS) padding += index
            address += instruction.codeUnits
        }
        return padding
    }

    /** Data/switch references point to payloads, which aren't normal execution successors. */
    private fun payloadTargets(instructions: List<Instruction>): Map<Int, Int> {
        val addresses = IntArray(instructions.size + 1)
        instructions.forEachIndexed { index, instruction -> addresses[index + 1] = addresses[index] + instruction.codeUnits }
        return instructions.indices.filter { instructions[it].opcode in PAYLOAD_REFERENCES }.associateWith { source ->
            val target = addresses.indexOf(addresses[source] + (instructions[source] as OffsetInstruction).codeOffset)
            assertTrue("payload reference $source resolves to a payload", target in instructions.indices && instructions[target].opcode in PAYLOADS)
            target
        }
    }

    private companion object {
        const val PEER_STORIES = "Lorg/telegram/tgnet/tl/TL_stories\$TL_stories_getPeerStories;"
        const val STORIES_ARCHIVE = "Lorg/telegram/tgnet/tl/TL_stories\$TL_stories_getStoriesArchive;"
        val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
        val PAYLOADS = setOf(Opcode.ARRAY_PAYLOAD, Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD)
        val PAYLOAD_REFERENCES = setOf(Opcode.FILL_ARRAY_DATA, Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH)
        val INJECTIONS = mapOf(
            StoryTarget.REQUESTS to listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
            StoryTarget.CAMERA to listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT),
            StoryTarget.BAR to listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_16, Opcode.CONST_16, Opcode.NOP),
            StoryTarget.AVATARS to listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ,
                Opcode.CONST_16, Opcode.CONST_16, Opcode.CONST_16, Opcode.CONST_4, Opcode.IPUT, Opcode.CONST_HIGH16, Opcode.IPUT, Opcode.NOP),
            StoryTarget.TOUCHES to listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_16, Opcode.GOTO_32, Opcode.NOP),
        )
        val HOOKS = mapOf(
            StoryTarget.REQUESTS to "skipStoryRequests()Z",
            StoryTarget.BAR to "hideStoryBar()Z",
            StoryTarget.CAMERA to "showStoryCamera(Z)Z",
            StoryTarget.AVATARS to "hideAvatarStories(Ljava/lang/Object;)Z",
            StoryTarget.TOUCHES to "hideAvatarStoryTouches(Ljava/lang/Object;)Z",
        )
    }
}
