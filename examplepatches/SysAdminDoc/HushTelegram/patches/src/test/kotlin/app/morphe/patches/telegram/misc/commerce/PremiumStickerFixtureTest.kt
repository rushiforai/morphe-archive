/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.commerce

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import java.io.File
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

/** Premium stickers and emoji packs under Hide Premium, gifts and Stars, against both real builds. */
class PremiumStickerFixtureTest {
    @Test
    fun `the sticker filters and the keyboard ask Commerce and the effect player asks first`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolvePremiumStickerHooks()
            assertEquals("${build.name}: every target", PremiumStickerTarget.entries.toSet(), plan.keys)

            val stickers = plan.getValue(PremiumStickerTarget.STICKERS)
            assertEquals("${build.name}: two filters and the keyboard pass", 3, stickers.size)
            val filters = stickers.filter { it.method.origDefiningClass == CONTROLLER }
            assertEquals("${build.name}: one pack and a list of packs", setOf(STICKER_SET, "Ljava/util/ArrayList;"),
                filters.map { it.method.parameterTypes.single().toString() }.toSet())
            assertTrue("${build.name}: both filters are filterPremiumStickers", filters.all { it.method.origName == "filterPremiumStickers" })
            val keyboard = stickers.single { it.method.origDefiningClass != CONTROLLER }
            assertEquals("${build.name}: the keyboard pass takes the refresh flag", listOf("Z"),
                keyboard.method.parameterTypes.map { it.toString() })
            val effects = plan.getValue(PremiumStickerTarget.EFFECTS)
            val tooltip = effects.single { it.replace }
            val player = effects.single { !it.replace }
            assertTrue("${build.name}: the tooltip names Premium stickers",
                tooltip.method.instructions().any { it.reference() == STICKER_TOOLTIP })
            assertEquals("${build.name}: the guard comes first", 0, player.index)
            assertEquals("${build.name}: one class plays effects and shows the tooltip", tooltip.method.definingClass, player.method.definingClass)

            val emoji = plan.getValue(PremiumStickerTarget.EMOJI_PACKS).single()

            val swaps = stickers + tooltip
            val originals = swaps.associate { it.method.key() to ImmutableMethod.of(it.method) }
            val playerBefore = ImmutableMethod.of(player.method)
            val sorterBefore = ImmutableMethod.of(emoji.method)
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            // Every warning names the patch, so look for the sticker capabilities themselves.
            assertTrue("${build.name}: no Premium sticker warning $warnings",
                warnings.none { warning -> PremiumStickerTarget.entries.any { it.capability in warning } })

            for (swap in swaps) {
                val before = originals.getValue(swap.method.key()).instructions()
                val after = swap.method.instructions()
                assertEquals("${build.name}: ${swap.method.name} keeps its length", before.size, after.size)
                for (index in before.indices) {
                    if (index != swap.index) {
                        assertEquals("${build.name}: ${swap.method.name} keeps $index", operation(before[index]), operation(after[index]))
                        continue
                    }
                    assertEquals("$CONTROLLER->premiumFeaturesBlocked()Z", before[index].reference())
                    assertEquals(Opcode.INVOKE_STATIC, after[index].opcode)
                    assertEquals("$COMMERCE->premiumStickersBlocked(Ljava/lang/Object;)Z", after[index].reference())
                    assertEquals("${build.name}: the same controller is asked", before[index].namedRegisters(), after[index].namedRegisters())
                    assertEquals(Opcode.MOVE_RESULT, after[index + 1].opcode)
                }
            }

            val before = playerBefore.instructions()
            val after = player.method.instructions()
            val guard = after.size - before.size
            assertEquals("${build.name}: an eight-instruction guard", 8, guard)
            for (index in before.indices) {
                assertEquals("${build.name}: the player keeps $index", operation(before[index]), operation(after[index + guard]))
            }
            val cell = player.method.implementation!!.registerCount - 3
            assertEquals(listOf(Opcode.IF_EQZ, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC,
                Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.NOP), after.take(guard).map { it.opcode })
            assertEquals("${build.name}: the cell is checked and read", listOf(cell), after[0].namedRegisters())
            assertEquals("${player.method.parameterTypes[0]}->getMessageObject()Lorg/telegram/messenger/MessageObject;", after[1].reference())
            assertEquals("$COMMERCE->skipPremiumEffect(Ljava/lang/Object;)Z", after[3].reference())
            assertTrue("${build.name}: the guard uses a local, not a parameter", after.take(guard).drop(2).dropLast(1)
                .all { it.namedRegisters().all { register -> register < cell - 1 } })
            val flow = ControlFlow.of(player.method)
            // The keep label is the guard's own nop, which falls into the stock start; a label that
            // moved onto the guard would make it jump to itself.
            val keep = guard - 1
            assertEquals("${build.name}: a null cell skips the question", setOf(1, keep), flow.normal[0].toSet())
            assertEquals("${build.name}: a kept effect skips the return", setOf(6, keep), flow.normal[5].toSet())
            assertEquals("${build.name}: the keep path reaches the stock start", listOf(guard), flow.normal[keep])
            assertTrue("${build.name}: nothing jumps back into the guard",
                (guard until after.size).none { from -> flow.normal[from].any { it < guard } })

            // The emoji pass hands the view's cleared-and-refilled pack list to Commerce right before
            // the tab strip's read, and every way out of its loops still runs through it.
            val sorted = sorterBefore.instructions()
            val handed = emoji.method.instructions()
            val at = emoji.index
            assertEquals("${build.name}: two instructions before the strip", sorted.size + 2, handed.size)
            for (index in sorted.indices) {
                assertEquals("${build.name}: the pack pass keeps $index", operation(sorted[index]),
                    operation(handed[if (index < at) index else index + 2]))
            }
            assertTrue("${build.name}: the strip takes the packs two later", handed[at + 4].reference()!!.endsWith(EMOJI_PACKS))
            val view = handed[at + 4].reference()!!.substringBefore("->")
            val viewRegister = handed[at + 4].namedRegisters().single()
            val borrowed = handed[at] as TwoRegisterInstruction
            val clear = sorted.indexOfFirst { it.reference() == "Ljava/util/ArrayList;->clear()V" }
            assertEquals(Opcode.IGET_OBJECT, handed[at].opcode)
            assertEquals("${build.name}: the list the pass cleared is handed over", sorted[clear - 1].reference(), handed[at].reference())
            assertTrue("${build.name}: the list is the view's", handed[at].reference()!!.startsWith("$view->"))
            assertEquals("${build.name}: read from the view", viewRegister, borrowed.registerB)
            assertEquals("$COMMERCE->dropLockedEmojiPacks(Ljava/lang/Object;Ljava/util/List;)V", handed[at + 1].reference())
            assertEquals("${build.name}: the view and its packs", listOf(viewRegister, borrowed.registerA), handed[at + 1].namedRegisters())
            assertEquals("${build.name}: the strip's read overwrites the borrowed register", borrowed.registerA,
                (handed[at + 2] as TwoRegisterInstruction).registerA)
            val sortedFlow = ControlFlow.of(sorterBefore).normal
            val handedFlow = ControlFlow.of(emoji.method).normal
            val into = sortedFlow.indices.filter { at in sortedFlow[it] }
            assertTrue("${build.name}: the loops reach the strip", into.isNotEmpty())
            for (from in into) {
                assertTrue("${build.name}: $from reaches the hand-over", at in handedFlow[if (from < at) from else from + 2])
            }
            assertTrue("${build.name}: nothing skips the hand-over", handedFlow.indices.none { it != at + 1 && at + 2 in handedFlow[it] })

            for (target in PremiumStickerTarget.entries) assertFact(context, target.capability, 1)
            val stubs = context.tgMutableClassDefBy(COMMERCE).methods.associateBy { it.name }
            val viewPremium = stubs.getValue("emojiViewPremium").instructions()
            assertTrue(viewPremium.any { it.reference() == "Lorg/telegram/messenger/UserConfig;->isPremium()Z" })
            assertEquals("${build.name}: the view's account and its every-emoji flag", listOf(Opcode.IGET, Opcode.IGET_BOOLEAN),
                viewPremium.filter { it.reference()?.startsWith("$view->") == true }.map { it.opcode })
            val free = stubs.getValue("emojiPackFree").instructions().single { it.opcode == Opcode.IGET_BOOLEAN }.reference()!!
            assertTrue("${build.name}: the free flag is on the pack the pass builds", sorted.any {
                it.opcode == Opcode.NEW_INSTANCE && it.reference() == free.substringBefore("->") })
            assertTrue("${build.name}: a featured pack's free answer goes into it", sorted.indices.any {
                sorted[it].opcode in FLIPS && sorted[it + 1].reference() == free })
            assertTrue(stubs.getValue("premiumBlocked").instructions().any { it.reference() == "$CONTROLLER->premiumFeaturesBlocked()Z" })
            assertTrue(stubs.getValue("premiumAccount").instructions().any { it.reference() == "Lorg/telegram/messenger/UserConfig;->isPremium()Z" })
            assertTrue(stubs.getValue("premiumSticker").instructions().any { it.reference() == "Lorg/telegram/messenger/MessageObject;->isPremiumSticker()Z" })
            assertTrue(stubs.getValue("messageAccountPremium").instructions().any {
                it.reference() == "Lorg/telegram/messenger/MessageObject;->currentAccount:I" })
        }
    }

    @Test
    fun `a missing keyboard pass leaves the stickers out whole and the effects still apply`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val keyboard = context.resolvePremiumStickerHooks().getValue(PremiumStickerTarget.STICKERS)
                .single { it.method.origDefiningClass != CONTROLLER }
            val filters = context.resolvePremiumStickerHooks().getValue(PremiumStickerTarget.STICKERS)
                .filter { it.method.origDefiningClass == CONTROLLER }.map { it.method to it.method.instructions().map(::operation) }
            val register = keyboard.method.instructions()[keyboard.index].namedRegisters().single()
            keyboard.method.replaceInstruction(keyboard.index, "invoke-virtual {v$register}, $CONTROLLER->isClientActivated()Z")
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertTrue("${build.name}: $warnings", warnings.any { "commercePremiumStickers" in it })
            assertFact(context, "commercePremiumStickers", 0)
            assertFact(context, "commercePremiumEffects", 1)
            assertFact(context, "commercePremiumEmojiPacks", 1)
            for ((method, before) in filters) {
                assertEquals("${build.name}: ${method.name} is left as it was", before, method.instructions().map(::operation))
            }
        }
    }

    @Test
    fun `a filter that no longer asks premiumFeaturesBlocked leaves the stickers out and the rest still apply`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val stickers = context.resolvePremiumStickerHooks().getValue(PremiumStickerTarget.STICKERS)
            val changed = stickers.first { it.method.origDefiningClass == CONTROLLER }
            val register = changed.method.instructions()[changed.index].namedRegisters().single()
            changed.method.replaceInstruction(changed.index, "invoke-virtual {v$register}, $CONTROLLER->isClientActivated()Z")
            val before = stickers.map { it.method to it.method.instructions().map(::operation) }
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertTrue("${build.name}: $warnings", warnings.any {
                "commercePremiumStickers left out" in it && "no longer asks premiumFeaturesBlocked once" in it })
            assertFact(context, "hideCommerce", 1)
            assertFact(context, "commercePremiumStickers", 0)
            assertFact(context, "commercePremiumEffects", 1)
            assertFact(context, "commercePremiumEmojiPacks", 1)
            for ((method, operations) in before) {
                assertEquals("${build.name}: ${method.name} is left as it was", operations, method.instructions().map(::operation))
            }
        }
    }

    @Test
    fun `an effect player that jumps back to its start is left out and the rest still apply`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val effects = context.resolvePremiumStickerHooks().getValue(PremiumStickerTarget.EFFECTS)
            val player = effects.single { !it.replace }.method
            val tooltip = effects.single { it.replace }.method
            // A guard put in front of the start would run again here, over whatever the loop holds.
            val cell = player.implementation!!.registerCount - 3
            player.addInstructionsWithLabels(1, "if-eqz v$cell, :start", ExternalLabel("start", player.getInstruction(0)))
            val before = listOf(player, tooltip).map { it to it.instructions().map(::operation) }
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertTrue("${build.name}: $warnings", warnings.any {
                "commercePremiumEffects left out" in it && "jumps back to its start" in it })
            assertFact(context, "commercePremiumEffects", 0)
            assertFact(context, "commercePremiumStickers", 1)
            assertFact(context, "commercePremiumEmojiPacks", 1)
            for ((method, operations) in before) {
                assertEquals("${build.name}: ${method.name} is left as it was", operations, method.instructions().map(::operation))
            }
        }
    }

    @Test
    fun `an emoji pass that no longer hands its packs to the strip is left out and the stickers still apply`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val sorter = context.resolvePremiumStickerHooks().getValue(PremiumStickerTarget.EMOJI_PACKS).single().method
            val body = sorter.instructions()
            val tabs = body.indexOfFirst { it.reference()?.endsWith(EMOJI_PACKS) == true }
            sorter.replaceInstruction(tabs, "invoke-virtual {v${body[tabs].namedRegisters().single()}}, Ljava/lang/Object;->toString()Ljava/lang/String;")
            val before = sorter.instructions().map(::operation)
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertTrue("${build.name}: $warnings", warnings.any { "commercePremiumEmojiPacks" in it })
            assertFact(context, "commercePremiumEmojiPacks", 0)
            assertFact(context, "commercePremiumStickers", 1)
            assertFact(context, "commercePremiumEffects", 1)
            assertEquals("${build.name}: the pack pass is left as it was", before, sorter.instructions().map(::operation))
            assertTrue("${build.name}: no emoji stubs without the pass", context.tgMutableClassDefBy(COMMERCE).methods
                .single { it.origName == "emojiPackFree" }.instructions().none { it.opcode == Opcode.IGET_BOOLEAN })
        }
    }

    @Test
    fun `an emoji pass that no longer marks featured packs free is left out after its other places are read`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val sorter = context.resolvePremiumStickerHooks().getValue(PremiumStickerTarget.EMOJI_PACKS).single().method
            // The pass is still found by what it references, and the strip, the clear and the account
            // read are all where they were, so only the free flag is missing.
            sorter.replaceInstruction(sorter.instructions().indexOfFirst { it.opcode in FLIPS }, "nop")
            val before = sorter.instructions().map(::operation)
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertTrue("${build.name}: $warnings", warnings.any {
                "commercePremiumEmojiPacks left out" in it && "marks a pack free" in it })
            assertFact(context, "commercePremiumEmojiPacks", 0)
            assertFact(context, "commercePremiumStickers", 1)
            assertFact(context, "commercePremiumEffects", 1)
            assertEquals("${build.name}: the pack pass is left as it was", before, sorter.instructions().map(::operation))
            assertTrue("${build.name}: no emoji stubs without the pass", context.tgMutableClassDefBy(COMMERCE).methods
                .single { it.origName == "emojiPackFree" }.instructions().none { it.opcode == Opcode.IGET_BOOLEAN })
        }
    }

    @Test
    fun `a third sticker filter leaves the stickers out and the rest still apply`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val controller = hosts.single { it.origType == CONTROLLER }
            val filter = controller.methods.single { it.origName == "filterPremiumStickers" && it.parameterTypes.single().toString() == STICKER_SET }
            // The build's own class, and the source name, which no table row renames for this new descriptor.
            val third = ImmutableMethod(controller.type, "filterPremiumStickers", listOf(ImmutableMethodParameter("Ljava/lang/Object;", null, null)),
                filter.returnType, filter.accessFlags, filter.annotations, filter.hiddenApiRestrictions, filter.implementation)
            val altered = ImmutableClassDef(controller.type, controller.accessFlags, controller.superclass, controller.interfaces,
                controller.sourceFile, controller.annotations, controller.fields, controller.methods.toList() + third)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.filter { it.origType != CONTROLLER } + altered)
            val filters = context.tgMutableClassDefBy(CONTROLLER).methods.filter { it.origName == "filterPremiumStickers" }
            val before = filters.map { it to it.instructions().map(::operation) }
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertTrue("${build.name}: $warnings", warnings.any {
                "commercePremiumStickers left out" in it && "3 Premium sticker filters, not two" in it })
            assertFact(context, "commercePremiumStickers", 0)
            assertFact(context, "commercePremiumEffects", 1)
            assertFact(context, "commercePremiumEmojiPacks", 1)
            for ((method, operations) in before) {
                assertEquals("${build.name}: ${method.name} is left as it was", operations, method.instructions().map(::operation))
            }
        }
    }

    @Test
    fun `a filter call this reading doesn't follow leaves the stickers out instead of stopping the patch`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val stickers = context.resolvePremiumStickerHooks().getValue(PremiumStickerTarget.STICKERS)
            val changed = stickers.first { it.method.origDefiningClass == CONTROLLER }
            val register = changed.method.instructions()[changed.index].namedRegisters().single()
            // Still one premiumFeaturesBlocked call read right after, but with a register the plan can't place.
            changed.method.replaceInstruction(changed.index, "invoke-virtual {v$register, v$register}, $PREMIUM_BLOCKED")
            val before = stickers.map { it.method to it.method.instructions().map(::operation) }
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertTrue("${build.name}: $warnings", warnings.any {
                "commercePremiumStickers left out" in it && "IllegalArgumentException" in it })
            assertFact(context, "hideCommerce", 1)
            assertFact(context, "commercePremiumStickers", 0)
            assertFact(context, "commercePremiumEffects", 1)
            assertFact(context, "commercePremiumEmojiPacks", 1)
            for ((method, operations) in before) {
                assertEquals("${build.name}: ${method.name} is left as it was", operations, method.instructions().map(::operation))
            }
        }
    }

    @Test
    fun `a second tooltip refuses before anything changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val initial = PatchContexts.of(ExtensionDex.classes() + hosts)
            val tooltip = initial.resolvePremiumStickerHooks().getValue(PremiumStickerTarget.EFFECTS).single { it.replace }.method
            val original = hosts.single { it.origType == tooltip.origDefiningClass }
            val duplicate = ImmutableMethod(tooltip.definingClass, "tooltipAmbiguity", tooltip.parameters, tooltip.returnType,
                tooltip.accessFlags, tooltip.annotations, tooltip.hiddenApiRestrictions, tooltip.implementation)
            val altered = ImmutableClassDef(original.type, original.accessFlags, original.superclass, original.interfaces,
                original.sourceFile, original.annotations, original.fields, original.methods.toList() + duplicate)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.filter { it.origType != original.origType } + altered)
            try {
                hideCommercePatch.execute(context)
                fail("${build.name}: a second tooltip was accepted")
            } catch (expected: PatchException) {
                assertTrue(expected.message.orEmpty(), expected.message.orEmpty().contains("ambiguous Premium sticker tooltip"))
            }
            for (classDef in hosts) for (stock in classDef.methods) {
                val after = context.tgMutableClassDefBy(classDef.type).methods.single { it.key() == stock.key() }
                assertEquals("${build.name}: ambiguity retains $stock", stock.instructions().map(::operation), after.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 0)
            for (target in PremiumStickerTarget.entries) assertFact(context, target.capability, 0)
        }
    }

    /** MessagesController and the two classes that hold the places, found by what they reference. */
    private fun hosts(build: File): List<ClassDef> {
        val anchors = FixtureDex.classesWhere(build, { true }) { method ->
            val refs = method.instructions().mapNotNull { it.reference() }.toSet()
            refs.contains(STICKER_TOOLTIP) || (refs.contains(PREMIUM_BLOCKED) && refs.contains(PREMIUM_DOCUMENT)) ||
                (refs.contains(PREMIUM_EMOJI_PACK) && refs.contains(FREE_EMOJI))
        }
        return (anchors + FixtureDex.classes(build, setOf(CONTROLLER)).values).distinctBy { it.type }
    }

    private fun assertFact(context: BytecodePatchContext, name: String, value: Int) {
        val body = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.instructions()
        assertEquals("$name is a build fact", value, (body[0] as NarrowLiteralInstruction).narrowLiteral)
    }

    private fun Method.key() = "$definingClass->$name(${parameterTypes.joinToString("")})"
    private fun operation(instruction: Instruction) = listOf(instruction.opcode, instruction.reference(), instruction.namedRegisters(),
        if (instruction is OffsetInstruction) null else (instruction as? NarrowLiteralInstruction)?.narrowLiteral)
    private fun Instruction.reference() = origRef()
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private companion object {
        const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
        const val STICKER_SET = "Lorg/telegram/tgnet/TLRPC\$TL_messages_stickerSet;"
        /** The featured pack's free flip: 13.2's R8 folds its constant into xor-int/lit8. */
        val FLIPS = setOf(Opcode.XOR_INT_2ADDR, Opcode.XOR_INT_LIT8)
    }
}
