/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.commerce

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.archive.ARCHIVED_CHATS
import app.morphe.patches.telegram.misc.archive.ARCHIVE_HIDDEN
import app.morphe.patches.telegram.misc.archive.ARCHIVE_ICON
import app.morphe.patches.telegram.misc.archive.ARCHIVE_MENU
import app.morphe.patches.telegram.misc.archive.MESSAGES_CONTROLLER
import app.morphe.patches.telegram.misc.archive.SELECTED_ACCOUNT
import app.morphe.patches.telegram.misc.archive.disableArchivePullPatch
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.insertAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import java.io.File

/** The real fixture proves the presentation sites and the code the patch must retain. */
class HideCommerceFixtureTest {
    @Test
    fun `all sales surfaces are hooked and purchase account and channel controls remain intact`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val plan = context.resolveCommerceHooks()
            assertEquals("${build.name}: full surface coverage", CommerceTarget.entries.toSet(), plan.hooks.keys)
            val settings = plan.hooks.getValue(CommerceTarget.SETTINGS)
            assertEquals("${build.name}: exactly five Settings sales appends", 5, settings.count { it.replace })
            // 13.0's Wallet row sits at the top while it's new and after Language later.
            val wallet = settings.filter { !it.replace }
            assertEquals("${build.name}: both Wallet placements", 2, wallet.size)
            val builder = settings.first().method.instructions()
            for (gate in wallet) {
                assertEquals("${build.name}: Wallet gate reads walletAvailable", WALLET_AVAILABLE, builder[gate.index - 3].reference())
                assertEquals(Opcode.IF_EQZ, builder[gate.index].opcode)
                val skip = ControlFlow.of(settings.first().method).normal[gate.index].single { it != gate.index + 1 }
                assertEquals("${build.name}: the skipped block holds one Wallet label", 1,
                    (gate.index + 1 until skip).count { builder[it].reference() == WALLET_LABEL })
            }
            val profile = plan.hooks.getValue(CommerceTarget.PROFILE_GIFTS)
            assertEquals("${build.name}: fresh and cached edit candidates", 2, profile.count { it.replace })
            assertEquals("${build.name}: cached presence comparison", 1, profile.count { !it.replace })
            assertTrue("${build.name}: presence guard runs before either candidate append",
                profile.single { !it.replace }.index < profile.filter { it.replace }.minOf { it.index })
            val channel = plan.hooks.getValue(CommerceTarget.CHANNEL_GIFT)
            assertEquals(1, channel.size)
            assertEquals("${build.name}: footer visibility guard is before stock UI work", 0, channel.single().index)

            // 13.0's attach menu gives Wallet's button its number only past the gate. Gallery and
            // File get theirs outside it, so their buttons don't depend on the answer.
            val attach = plan.hooks.getValue(CommerceTarget.ATTACH_WALLET).single()
            assertFalse(attach.replace)
            val numbering = attach.method.instructions()
            assertEquals("${build.name}: attach gate reads walletAvailable", WALLET_AVAILABLE, numbering[attach.index - 3].reference())
            assertEquals(Opcode.IF_EQZ, numbering[attach.index].opcode)
            val skipped = attach.index + 1 until ControlFlow.of(attach.method).normal[attach.index].single { it != attach.index + 1 }
            val bound = binder(context, attach.method.definingClass).instructions()
            fun numberOf(label: String): String {
                val at = bound.indexOfFirst { it.reference() == label }
                return bound[(0 until at).last { bound[it].opcode == Opcode.IGET }].reference()!!
            }
            val walletNumber = numberOf(WALLET_LABEL)
            val walletWrites = numbering.indices.filter { numbering[it].opcode == Opcode.IPUT && numbering[it].reference() == walletNumber }
            assertEquals("${build.name}: Wallet's number is reset, then given only past the gate", listOf(false, true),
                walletWrites.map { it in skipped })
            for (label in listOf("ChatGallery", "ChatDocument").map { "Lorg/telegram/messenger/R\$string;->$it:I" }) {
                val number = numberOf(label)
                assertTrue("${build.name}: $label is numbered outside the Wallet block", numbering.indices.any {
                    numbering[it].opcode == Opcode.IPUT && numbering[it].reference() == number && it !in skipped })
                assertFalse("${build.name}: $label is not numbered inside it", skipped.any { numbering[it].reference() == number })
            }

            // The chat list menu: the hook starts the Wallet entry and jumps to where the menu goes
            // on after it, a path that never reaches the side menu mini apps.
            val menu = plan.hooks.getValue(CommerceTarget.MENU_WALLET).single()
            val entries = menu.method.instructions()
            assertEquals("${build.name}: menu gate reads walletAvailable", WALLET_AVAILABLE, entries[menu.index - 4].reference())
            assertEquals(Opcode.IF_EQZ, entries[menu.index - 1].opcode)
            val menuExit = labelTarget(menu)
            assertEquals("${build.name}: the entry holds one Wallet label", 1, (menu.index until menuExit).count { entries[it].reference() == WALLET_LABEL })
            val menuFlow = ControlFlow.of(menu.method)
            val miniApps = reach(menuFlow, menuFlow.normal[menu.index - 1].single { it != menu.index })
            assertTrue("${build.name}: the side menu mini apps sit behind the gate", miniApps.any { entries[it].reference() == SIDE_MENU })
            assertTrue("${build.name}: the jump never reaches them", reach(menuFlow, menuExit).none { entries[it].reference() == SIDE_MENU })

            // Send Gram: each place adds it past its own walletAvailable gate and nothing else sits
            // there, so the gate's skip is the place as an account without Wallet has it.
            for ((target, kept) in mapOf(
                CommerceTarget.PROFILE_SEND_GRAM to listOf("StartEncryptedChat"),
                CommerceTarget.ADDRESS_SEND_GRAM to listOf("WalletCopyAddress", "WalletViewInExplorer", "WalletAddressNoLinkedAccount"),
                CommerceTarget.TRANSFER_SEND_GRAM to listOf("WelcomeMessageRevert"),
            )) {
                val gate = plan.hooks.getValue(target).single()
                assertFalse(gate.replace)
                val body = gate.method.instructions()
                val flow = ControlFlow.of(gate.method)
                assertEquals("${build.name}: $target gate reads walletAvailable", WALLET_AVAILABLE, body[gate.index - 3].reference())
                assertEquals(Opcode.IF_EQZ, body[gate.index].opcode)
                val skip = flow.normal[gate.index].single { it != gate.index + 1 }
                val branch = gate.index + 1 until skip
                assertEquals("${build.name}: $target branch labels Send Gram and nothing else", listOf(SEND_GRAM),
                    branch.mapNotNull { body[it].reference() }.filter { it.startsWith("Lorg/telegram/messenger/R\$string;->") })
                val after = reach(flow, skip)
                for (label in kept.map { "Lorg/telegram/messenger/R\$string;->$it:I" }) {
                    assertTrue("${build.name}: $target keeps $label past the gate", after.any { body[it].reference() == label })
                }
            }
            val transfer = plan.hooks.getValue(CommerceTarget.TRANSFER_SEND_GRAM).single()
            val transferBody = transfer.method.instructions()
            val transferSkip = ControlFlow.of(transfer.method).normal[transfer.index].single { it != transfer.index + 1 }
            assertTrue("${build.name}: the message menu offers Send Gram only on a Gram transfer", (transfer.index + 1 until transferSkip).any {
                transferBody[it].opcode == Opcode.INSTANCE_OF && transferBody[it].reference() == GRAM_TRANSFER })

            val originals = plan.hooks.mapValues { (_, edits) -> ImmutableMethod.of(edits.first().method) }
            // The Premium sticker places are checked edit by edit in PremiumStickerFixtureTest.
            val stickers = context.resolvePremiumStickerHooks()
            assertEquals("${build.name}: every Premium sticker and emoji target", PremiumStickerTarget.entries.toSet(), stickers.keys)
            val changed = originals.values.map { it.definingClass to it.name }.toSet() +
                stickers.values.flatten().map { it.method.definingClass to it.method.name }
            // Hide emoji statuses swaps the two getters and points the status readers that must stay
            // real at Telegram's own chat getter.
            val getters = hosts.filter { it.type == EMOJI_USERS || it.type == EMOJI_DIALOGS }.flatMap { it.methods.toList() }
                .filter { it.name == EMOJI_GETTER && it.parameterTypes.map { type -> type.toString() } == listOf(EMOJI_STATUS_TYPE) }
            assertEquals("${build.name}: one status getter each for people and chats", setOf(EMOJI_USERS, EMOJI_DIALOGS),
                getters.map { it.definingClass }.toSet())
            assertEquals(2, getters.size)
            val keepers = statusKeepers(hosts)
            assertTrue("${build.name}: the changed check keeps the real status", keepers.any { it.name == "emojiStatusesEqual" })
            assertTrue("${build.name}: the appearance editor keeps the real status", keepers.any { it.definingClass !in setOf(EMOJI_DIALOGS, MESSAGE_OBJECT) })
            assertTrue("${build.name}: the admin log keeps the real status", keepers.any { it.definingClass == MESSAGE_OBJECT })
            val swapped = (getters + keepers).map { it.key() }.toSet()
            val originalBodies = (getters + keepers).associate { it.key() to it.instructions().map(::operation) }
            // Unlock Premium app icons asks after the flag read in the icon list's tap, lock and
            // filter. The Premium page's preview reads the flag too and stays stock.
            val premiumFlag = iconFlag(hosts)
            val iconBodies = iconReaders(hosts).associate { it.key() to it.instructions() }
            assertEquals("${build.name}: the icon list's tap, lock and filter", 3, iconBodies.size)
            assertEquals("${build.name}: the tap and the lock ask about the account", 2,
                iconBodies.values.count { body -> body.any { it.reference() == PREMIUM_ON_ACCOUNTS } })
            // Emoji status on this phone asks after the chat list title's status reads and Premium
            // checks, and first thing in the account's own status send.
            val title = titleStatus(hosts)
            val send = statusSend(hosts)
            val localBodies = listOf(title, send).associate { it.key() to it.instructions() }
            val untouched = hosts.flatMap { it.methods.toList() }.filter {
                (it.definingClass to it.name) !in changed && it.key() !in swapped && it.key() !in iconBodies && it.key() !in localBodies
            }
            assertTrue("${build.name}: includes the Premium page's icon preview", untouched.any { method ->
                method.instructions().any { it.opcode == Opcode.IGET_BOOLEAN && it.reference() == premiumFlag }
            })
            assertTrue("${build.name}: includes the ordinary channel footer controls", untouched.any { method ->
                method.instructions().any { it.reference() == JOIN } && method.instructions().any { it.reference() == UNMUTE }
            })
            for (gate in listOf("premiumFeaturesBlocked", "premiumPurchaseBlocked", "starsPurchaseAvailable")) {
                assertTrue("${build.name}: includes stock $gate", untouched.any { it.definingClass == CONTROLLER && it.name == gate })
            }
            assertTrue("${build.name}: includes stock Premium entitlement", untouched.any {
                it.definingClass == USER_CONFIG && it.name == "isPremium"
            })
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertEquals("${build.name}: no missing surface", emptyList<String>(), warnings)

            for ((target, edits) in plan.hooks) {
                if (target == CommerceTarget.MENU_WALLET) assertMenuEdit("${build.name}: $target", originals.getValue(target), edits.single(), menuExit)
                else assertEdits("${build.name}: $target", originals.getValue(target), edits)
            }
            for (method in untouched) {
                val after = context.mutableClassDefBy(method.definingClass).methods.single { it.sameSignature(method) }
                assertEquals("${build.name}: retains $method", method.instructions().map(::operation), after.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 1)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 1) }
            PremiumStickerTarget.entries.forEach { assertFact(context, it.capability, 1) }
            assertFact(context, "commerceEmojiStatus", 1)
            assertFact(context, "commercePremiumIcons", 1)
            assertFact(context, "commerceLocalEmojiStatus", 1)
            assertLocalTitle(build.name, localBodies.getValue(title.key()),
                context.mutableClassDefBy(title.definingClass).methods.single { it.key() == title.key() })
            assertLocalSend(build.name, send, context.mutableClassDefBy(CONTROLLER).methods.single { it.key() == send.key() })
            for ((key, before) in iconBodies) {
                val after = context.mutableClassDefBy(key.substringBefore("->")).methods.single { it.key() == key }
                    .instructions().filter { it.opcode != Opcode.NOP }
                val read = after.indices.single { after[it].opcode == Opcode.IGET_BOOLEAN && after[it].reference() == premiumFlag }
                val register = (after[read] as TwoRegisterInstruction).registerA
                val call = after[read + 1] as RegisterRangeInstruction
                assertEquals("${build.name}: $key asks AppIcons right after the read", ICON_PREMIUM, after[read + 1].reference())
                assertEquals(listOf(register, 1), listOf(call.startRegister, call.registerCount))
                assertEquals(Opcode.MOVE_RESULT, after[read + 2].opcode)
                assertEquals(register, (after[read + 2] as OneRegisterInstruction).registerA)
                // A goto past the new code can widen, which is still the same jump.
                assertEquals("${build.name}: $key is otherwise stock", before.filter { it.opcode != Opcode.NOP }.map(::stockOperation),
                    after.filterIndexed { index, _ -> index != read + 1 && index != read + 2 }.map(::stockOperation))
            }
            for (getter in getters) {
                val owner = context.mutableClassDefBy(getter.definingClass)
                val stockName = if (getter.definingClass == EMOJI_USERS) STOCK_USER_STATUS else STOCK_DIALOG_STATUS
                val stock = owner.methods.single { it.name == stockName }
                assertEquals("${build.name}: $stockName is Telegram's getter whole", originalBodies.getValue(getter.key()),
                    stock.instructions().map(::operation))
                assertTrue("${build.name}: $stockName is static", AccessFlags.STATIC.isSet(stock.accessFlags))
                val wrapper = owner.methods.single { it.sameSignature(getter) }
                assertEquals("${build.name}: the wrapper keeps the getter's access", getter.accessFlags, wrapper.accessFlags)
                val body = wrapper.instructions()
                assertEquals("${build.name}: the wrapper asks the switch first", EMOJI_HIDE, body.first().reference())
                assertEquals("${build.name}: and otherwise answers Telegram's own", 1,
                    body.count { it.reference() == "${getter.definingClass}->$stockName($EMOJI_STATUS_TYPE)${getter.returnType}" })
            }
            for (keeper in keepers) {
                val after = context.mutableClassDefBy(keeper.definingClass).methods.single { it.sameSignature(keeper) }
                assertEquals("${build.name}: $keeper reads the real status and is otherwise stock",
                    originalBodies.getValue(keeper.key()).map { op -> op.map { if (it == DIALOG_STATUS_ID) STOCK_DIALOG_STATUS_ID else it } },
                    after.instructions().map(::operation))
            }
            for ((stub, identity) in mapOf("giftTabId" to plan.giftTabId, "giftButtonIndex" to plan.giftButtonIndex)) {
                assertTrue("${build.name}: discovered $stub", identity != null && identity >= 0)
                val body = context.mutableClassDefBy(COMMERCE).methods.single { it.name == stub }.instructions()
                assertEquals("${build.name}: writes the discovered $stub", identity, (body[0] as NarrowLiteralInstruction).narrowLiteral)
                assertEquals(Opcode.RETURN, body[1].opcode)
            }
        }
    }

    @Test
    fun `changed cached Gifts append refuses before any hook or build fact changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveCommerceHooks()
            val cached = plan.hooks.getValue(CommerceTarget.PROFILE_GIFTS).filter { it.replace }.maxBy { it.index }
            cached.method.replaceInstruction(cached.index, "nop")
            val before = plan.hooks.mapValues { it.value.first().method.instructions().map(::operation) }
            assertRefuses { hideCommercePatch.execute(context) }
            for ((target, edits) in plan.hooks) {
                assertEquals("${build.name}: no partial $target edit", before.getValue(target), edits.first().method.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 0)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 0) }
            assertUnwrittenIdentities(context)
        }
    }

    @Test
    fun `changed candidate provenance and overlapping wide writes refuse before editing`() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf("allocation", "cached title", "cached ID", "cached source", "cached backedge", "cached label identity", "visibility")) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveCommerceHooks()
            val edits = plan.hooks.getValue(CommerceTarget.PROFILE_GIFTS)
            val method = edits.first().method
            val body = method.instructions()
            val labels = body.indices.filter { body[it].reference() == PROFILE_GIFTS }
            val cachedPair = edits.filter { it.replace }.maxOf { it.index } - 1
            when (change) {
                "allocation" -> method.replaceInstruction(labels.first() - 3, "nop")
                "cached title" -> {
                    val title = body[labels.last() + 2].namedRegisters().single()
                    method.replaceInstruction(labels.last() + 2, "move-result-object v${if (title == 8) 9 else 8}")
                }
                "cached ID" -> {
                    val branch = body.indices.single { body[it].opcode == Opcode.IF_EQ &&
                        labels.last() in ControlFlow.of(method).normal[it] }
                    val first = body[cachedPair].namedRegisters()[1]
                    method.addInstructionsAtControlFlowLabel(branch, "const-wide/16 v${first - 1}, 0x0")
                }
                "cached source", "cached backedge", "cached label identity" -> {
                    val branch = body.indices.single { body[it].opcode == Opcode.IF_EQ &&
                        labels.last() in ControlFlow.of(method).normal[it] }
                    val first = body[cachedPair].namedRegisters()[1]
                    val box = (0 until branch).last { body[it].reference() == "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;" &&
                        body[it + 1].opcode == Opcode.MOVE_RESULT_OBJECT && body[it + 1].namedRegisters() == listOf(first) }
                    val tabIndex = body[box].namedRegisters().single()
                    val identity = body[branch].namedRegisters().single { it != tabIndex }
                    if (change == "cached source") {
                        method.addInstructionsAtControlFlowLabel(branch, "move/from16 v$tabIndex, v$identity")
                    } else {
                        val write = if (change == "cached label identity") {
                            "move/from16 v$identity, v$tabIndex"
                        } else "move/from16 v$tabIndex, v$identity"
                        method.addInstructionsAtControlFlowLabel(branch + 1,
                            "$write\ngoto/32 :hush_changed_comparison",
                            ExternalLabel("hush_changed_comparison", body[branch]))
                    }
                }
                "visibility" -> {
                    val guard = labels.first() - 4
                    val visible = body[guard].namedRegisters().single()
                    method.addInstructionsAtControlFlowLabel(guard, "const-wide/16 v${visible - 1}, 0x0")
                }
            }
            val before = plan.hooks.mapValues { it.value.first().method.instructions().map(::operation) }
            assertRefuses { hideCommercePatch.execute(context) }
            for ((target, targetEdits) in plan.hooks) {
                assertEquals("${build.name}: $change preserves $target", before.getValue(target),
                    targetEdits.first().method.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 0)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 0) }
            assertUnwrittenIdentities(context)
        }
    }

    @Test
    fun `partial anchor changes are not misreported as missing sales modules`() {
        for (build in Fixtures.declaredBuilds()) for (anchor in SETTINGS_SALES + listOf(WALLET_LABEL, PROFILE_GIFTS, GIFT_BUTTON, GIFT_ICON)) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveCommerceHooks()
            val target = when (anchor) {
                PROFILE_GIFTS -> CommerceTarget.PROFILE_GIFTS
                GIFT_BUTTON, GIFT_ICON -> CommerceTarget.CHANNEL_GIFT
                else -> CommerceTarget.SETTINGS
            }
            val host = plan.hooks.getValue(target).first().method
            val method = if (anchor == GIFT_ICON) {
                context.mutableClassDefBy(host.definingClass).methods.single { it.name == "<clinit>" }
            } else host
            val at = method.instructions().indices.first { method.instructions()[it].reference() == anchor }
            val register = method.instructions()[at].namedRegisters().single()
            method.replaceInstruction(at, "const/16 v$register, 0x1")
            val before = plan.hooks.mapValues { it.value.first().method.instructions().map(::operation) }
            assertRefuses { hideCommercePatch.execute(context) }
            for ((surface, edits) in plan.hooks) {
                assertEquals("${build.name}: changed $anchor preserves $surface", before.getValue(surface),
                    edits.first().method.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 0)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 0) }
            assertUnwrittenIdentities(context)
        }
    }

    @Test
    fun `a changed Wallet row refuses before any hook or build fact changes`() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf("row identity", "divider", "availability read", "way in")) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveCommerceHooks()
            val settings = plan.hooks.getValue(CommerceTarget.SETTINGS)
            val method = settings.first().method
            val body = method.instructions()
            val gate = settings.filter { !it.replace }.minOf { it.index }
            val skip = ControlFlow.of(method).normal[gate].single { it != gate + 1 }
            val row = (gate + 1 until skip).single { body[it].opcode == Opcode.INVOKE_STATIC_RANGE &&
                body.getOrNull(it + 2)?.reference() == "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z" }
            when (change) {
                "row identity" -> {
                    val id = (gate + 1 until row).single { (body[it] as? NarrowLiteralInstruction)?.narrowLiteral == 25 }
                    method.replaceInstruction(id, "const/16 v${body[id].namedRegisters().single()}, 0x18")
                }
                "divider" -> method.replaceInstruction(skip - 1, "nop")
                "availability read" -> method.replaceInstruction(gate - 2, "nop")
                // A jump from before the gate straight to the row skips Telegram's own answer. The
                // jumped-over registers would fail ART's verifier, and the patch must still turn it
                // down, so it's built unchecked.
                "way in" -> {
                    method.insertAtControlFlowLabel(gate - 3, "goto/32 :hush_row", ExternalLabel("hush_row", body[row - 1]))
                    assertTrue("the jump really enters the row", row in ControlFlow.of(method).normal[gate - 3])
                }
            }
            val before = plan.hooks.mapValues { it.value.first().method.instructions().map(::operation) }
            assertRefuses { hideCommercePatch.execute(context) }
            for ((target, edits) in plan.hooks) {
                assertEquals("${build.name}: $change preserves $target", before.getValue(target),
                    edits.first().method.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 0)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 0) }
            assertUnwrittenIdentities(context)
        }
    }

    @Test
    fun `a changed attach menu Wallet button refuses before any hook or build fact changes`() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf("availability read", "reset", "second reader", "way in", "label")) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveCommerceHooks()
            val gate = plan.hooks.getValue(CommerceTarget.ATTACH_WALLET).single()
            val method = gate.method
            val body = method.instructions()
            val binder = binder(context, method.definingClass)
            val bound = binder.instructions()
            val label = bound.indexOfFirst { it.reference() == WALLET_LABEL }
            val number = bound[label - 2].reference()!!
            when (change) {
                "availability read" -> method.replaceInstruction(gate.index - 2, "nop")
                "reset" -> method.replaceInstruction(body.indexOfFirst { it.opcode == Opcode.IPUT && it.reference() == number }, "nop")
                // Something else reading Wallet's number could use it for more than the label.
                "second reader" -> method.addInstructions(0, "iget v0, p0, $number")
                "way in" -> {
                    method.insertAtControlFlowLabel(gate.index - 3, "goto/32 :hush_number", ExternalLabel("hush_number", body[gate.index + 1]))
                    assertTrue("the jump really enters the block", gate.index + 2 in ControlFlow.of(method).normal[gate.index - 3])
                }
                // The binder compares the button with something other than Wallet's number.
                "label" -> binder.replaceInstruction(label - 2, "iget v${bound[label - 2].namedRegisters().first()}, " +
                    "v${bound[label - 2].namedRegisters()[1]}, ${body.first { it.opcode == Opcode.IPUT && it.reference() != number }.reference()}")
            }
            val before = plan.hooks.mapValues { it.value.first().method.instructions().map(::operation) }
            assertRefuses { hideCommercePatch.execute(context) }
            for ((target, edits) in plan.hooks) {
                assertEquals("${build.name}: $change preserves $target", before.getValue(target),
                    edits.first().method.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 0)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 0) }
            assertUnwrittenIdentities(context)
        }
    }

    @Test
    fun `a changed chat list menu Wallet entry refuses before any hook or build fact changes`() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf("availability read", "add", "way in", "title")) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveCommerceHooks()
            val entry = plan.hooks.getValue(CommerceTarget.MENU_WALLET).single()
            val method = entry.method
            val body = method.instructions()
            val exit = labelTarget(entry)
            when (change) {
                "availability read" -> method.replaceInstruction(entry.index - 3, "nop")
                "add" -> method.replaceInstruction(exit - 1, "nop")
                "way in" -> {
                    method.insertAtControlFlowLabel(entry.index - 4, "goto/32 :hush_entry", ExternalLabel("hush_entry", body[exit - 1]))
                    assertTrue("the jump really enters the entry", exit in ControlFlow.of(method).normal[entry.index - 4])
                }
                // Something other than Wallet's own title goes into the entry.
                "title" -> {
                    val title = body.indexOfFirst { it.reference() == WALLET_LABEL } + 2
                    method.addInstructionsAtControlFlowLabel(exit - 1,
                        "const-string v${body[title].namedRegisters().single()}, \"\"")
                }
            }
            val before = plan.hooks.mapValues { it.value.first().method.instructions().map(::operation) }
            assertRefuses { hideCommercePatch.execute(context) }
            for ((target, edits) in plan.hooks) {
                assertEquals("${build.name}: $change preserves $target", before.getValue(target),
                    edits.first().method.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 0)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 0) }
            assertUnwrittenIdentities(context)
        }
    }

    @Test
    fun `a changed Send Gram item refuses before any hook or build fact changes`() {
        val places = mapOf(
            CommerceTarget.PROFILE_SEND_GRAM to listOf("availability read", "way in", "other item", "add"),
            CommerceTarget.ADDRESS_SEND_GRAM to listOf("availability read", "way in", "other item", "add", "copy address"),
            CommerceTarget.TRANSFER_SEND_GRAM to listOf("availability read", "way in", "other item", "add", "transfer check"),
        )
        for (build in Fixtures.declaredBuilds()) for ((target, changes) in places) for (change in changes) {
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val plan = context.resolveCommerceHooks()
            val gate = plan.hooks.getValue(target).single()
            val method = gate.method
            val body = method.instructions()
            val skip = ControlFlow.of(method).normal[gate.index].single { it != gate.index + 1 }
            val label = body.indexOfFirst { it.reference() == SEND_GRAM }
            val title = body[label + 2].namedRegisters().single()
            when (change) {
                "availability read" -> method.replaceInstruction(gate.index - 2, "nop")
                "way in" -> {
                    method.insertAtControlFlowLabel(gate.index - 3, "goto/32 :hush_gram", ExternalLabel("hush_gram", body[label]))
                    assertTrue("the jump really enters the branch", label + 1 in ControlFlow.of(method).normal[gate.index - 3])
                }
                // A second label behind the gate would hide more than Send Gram.
                "other item" -> method.addInstructionsAtControlFlowLabel(label,
                    "sget v${body[label].namedRegisters().single()}, Lorg/telegram/messenger/R\$string;->Copy:I")
                "add" -> method.replaceInstruction((label + 3 until skip).first { at ->
                    (body[at] as? ReferenceInstruction)?.reference is MethodReference && title in body[at].namedRegisters() }, "nop")
                // The popup's own items: Copy address is the one every TON address gets.
                "copy address" -> {
                    val copy = body.indexOfFirst { it.reference() == COPY_ADDRESS }
                    method.replaceInstruction(copy, "const/16 v${body[copy].namedRegisters().single()}, 0x1")
                }
                "transfer check" -> method.replaceInstruction((gate.index + 1 until skip).single { body[it].opcode == Opcode.INSTANCE_OF }, "nop")
            }
            val before = plan.hooks.mapValues { it.value.first().method.instructions().map(::operation) }
            assertRefuses { hideCommercePatch.execute(context) }
            for ((surface, edits) in plan.hooks) {
                assertEquals("${build.name}: $target $change preserves $surface", before.getValue(surface),
                    edits.first().method.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 0)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 0) }
            assertUnwrittenIdentities(context)
        }
    }

    @Test
    fun `Disable archive pull and the Wallet entry share the chat list menu in either order`() {
        for (build in Fixtures.declaredBuilds()) for (commerceFirst in listOf(true, false)) {
            val kept = FixtureDex.classes(build, setOf(MESSAGES_CONTROLLER, ARCHIVE_HIDDEN, SELECTED_ACCOUNT, ARCHIVED_CHATS, ARCHIVE_ICON)
                .map { it.substringBefore("->") }.toSet()).values
            val context = PatchContexts.of(ExtensionDex.classes() + (kept + hosts(build)).distinctBy { it.type })
            val menu = context.resolveCommerceHooks().hooks.getValue(CommerceTarget.MENU_WALLET).single().method
            val stock = ImmutableMethod.of(menu).instructions()
            val first = if (commerceFirst) hideCommercePatch else disableArchivePullPatch
            val second = if (commerceFirst) disableArchivePullPatch else hideCommercePatch
            for (patch in listOf(first, second)) {
                assertEquals("${build.name}: ${patch.name}", emptyList<String>(), PatchLogCapture.warnings { patch.execute(context) })
            }
            val after = menu.instructions()
            assertEquals("${build.name}: both hooks and nothing else", stock.size + 6, after.size)
            assertEquals(1, after.count { it.reference() == ARCHIVE_MENU })
            val ask = after.indexOfFirst { it.reference() == "$COMMERCE->showMenuWallet(Z)Z" }
            val jump = ControlFlow.of(menu).normal[ask + 2].single { it != ask + 3 }
            val saved = after.indexOfFirst { it.reference() == "Lorg/telegram/messenger/R\$string;->SavedMessages:I" }
            val add = after.drop(saved).first { it.opcode == Opcode.INVOKE_VIRTUAL && it.reference().orEmpty().endsWith(MENU_ADD) }.reference()
            assertEquals("${build.name}: the jump still lands right after the Wallet add", add, after[jump - 1].reference())
            assertEquals(1, (ask until jump).count { after[it].reference() == WALLET_LABEL })
            assertFact(context, "commerceMenuWallet", 1)
            assertFact(context, "disableArchivePull", 1)
        }
    }

    @Test
    fun `ambiguous Settings builder refuses rather than hiding arbitrary appends`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val initial = PatchContexts.of(ExtensionDex.classes() + hosts)
            val method = initial.resolveCommerceHooks().hooks.getValue(CommerceTarget.SETTINGS).first().method
            val original = hosts.single { it.type == method.definingClass }
            val duplicate = ImmutableMethod(method.definingClass, "salesBuilderAmbiguity", method.parameters,
                method.returnType, method.accessFlags, method.annotations, method.hiddenApiRestrictions, method.implementation)
            val altered = ImmutableClassDef(original.type, original.accessFlags, original.superclass, original.interfaces,
                original.sourceFile, original.annotations, original.fields, original.methods.toList() + duplicate)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.filter { it.type != original.type } + altered)
            assertRefuses("ambiguous Settings") { hideCommercePatch.execute(context) }
            for (classDef in hosts) for (stock in classDef.methods) {
                val after = context.mutableClassDefBy(classDef.type).methods.single { it.sameSignature(stock) }
                assertEquals("${build.name}: ambiguity retains $stock", stock.instructions().map(::operation), after.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 0)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 0) }
            assertUnwrittenIdentities(context)
        }
    }

    @Test
    fun `missing footer coverage is reported independently without claiming that capability`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val initial = PatchContexts.of(ExtensionDex.classes() + hosts)
            val footer = initial.resolveCommerceHooks().hooks.getValue(CommerceTarget.CHANNEL_GIFT).single().method.definingClass
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.filter { it.type != footer })
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertEquals("${build.name}: one missing footer warning", 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().contains("commerceChannelGift"))
            assertFact(context, "hideCommerce", 1)
            assertFact(context, "commerceSettingsRows", 1)
            assertFact(context, "commerceProfileGifts", 1)
            assertFact(context, "commerceChannelGift", 0)
            assertFact(context, "commerceAttachWallet", 1)
            assertFact(context, "commerceMenuWallet", 1)
            assertFact(context, "commerceProfileSendGram", 1)
            assertFact(context, "commerceAddressSendGram", 1)
            assertFact(context, "commerceTransferSendGram", 1)
            val stub = context.mutableClassDefBy(COMMERCE).methods.single { it.name == "giftButtonIndex" }.instructions()
            assertEquals("${build.name}: no invented footer identity", -1, (stub[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    @Test
    fun `a build without the emoji status check keeps every status and the rest of the patch`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val dialogs = hosts.single { it.type == EMOJI_DIALOGS }
            // With both sides of that check hidden, a new status picked for a channel would read as no
            // change and the editor wouldn't save it, so a build without it leaves every getter alone.
            val altered = ImmutableClassDef(dialogs.type, dialogs.accessFlags, dialogs.superclass, dialogs.interfaces,
                dialogs.sourceFile, dialogs.annotations, dialogs.fields, dialogs.methods.filter { it.name != "emojiStatusesEqual" })
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.filter { it.type != EMOJI_DIALOGS } + altered)
            val readers = (hosts.filter { it.type != EMOJI_DIALOGS } + altered).flatMap { it.methods.toList() }.filter { method ->
                method.name == EMOJI_GETTER || method.instructions().any { it.reference() == DIALOG_STATUS_ID }
            }.associate { it.key() to it.instructions().map(::operation) }
            assertTrue("${build.name}: the fixture still reads statuses", readers.size > 2)
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertEquals("${build.name}: one emoji status warning", 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().contains("emoji status"))
            assertFact(context, "hideCommerce", 1)
            assertFact(context, "commerceEmojiStatus", 0)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 1) }
            for (type in listOf(EMOJI_USERS, EMOJI_DIALOGS)) {
                assertFalse("${build.name}: no stock copy in $type", context.mutableClassDefBy(type).methods.any {
                    it.name == STOCK_USER_STATUS || it.name == STOCK_DIALOG_STATUS })
            }
            for ((key, before) in readers) {
                val type = key.substringBefore("->")
                val after = context.mutableClassDefBy(type).methods.single { it.key() == key }
                assertEquals("${build.name}: $key is stock", before, after.instructions().map(::operation))
            }
        }
    }

    @Test
    fun `a build without the App Icon list's enum keeps every icon locked and the rest of the patch`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val icons = iconFlag(hosts).substringBefore("->")
            val readers = iconReaders(hosts).associate { it.key() to it.instructions().map(::operation) }
            assertEquals("${build.name}: the fixture still weighs icons against Premium", 3, readers.size)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.filter { it.type != icons })
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertEquals("${build.name}: one Premium app icon warning", 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().endsWith("The patch goes on without the Premium app icon switch."))
            assertFact(context, "hideCommerce", 1)
            assertFact(context, "commercePremiumIcons", 0)
            assertFact(context, "commerceEmojiStatus", 1)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 1) }
            for ((key, before) in readers) {
                val after = context.mutableClassDefBy(key.substringBefore("->")).methods.single { it.key() == key }
                assertEquals("${build.name}: $key is stock", before, after.instructions().map(::operation))
            }
        }
    }

    @Test
    fun `a build whose chat list title no longer draws the status keeps the send and the rest of the patch`() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = hosts(build)
            val title = titleStatus(hosts)
            val send = statusSend(hosts)
            val owner = hosts.single { it.type == title.definingClass }
            val altered = ImmutableClassDef(owner.type, owner.accessFlags, owner.superclass, owner.interfaces,
                owner.sourceFile, owner.annotations, owner.fields, owner.methods.filter { it.key() != title.key() })
            val context = PatchContexts.of(ExtensionDex.classes() + hosts.filter { it.type != owner.type } + altered)
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertEquals("${build.name}: one local emoji status warning", 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().endsWith("The patch goes on without the local emoji status switch."))
            assertFact(context, "hideCommerce", 1)
            assertFact(context, "commerceLocalEmojiStatus", 0)
            assertFact(context, "commerceEmojiStatus", 1)
            assertFact(context, "commercePremiumIcons", 1)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 1) }
            val after = context.mutableClassDefBy(CONTROLLER).methods.single { it.key() == send.key() }
            assertEquals("${build.name}: the status send is stock", send.instructions().map(::operation), after.instructions().map(::operation))
            val stub = context.mutableClassDefBy(LOCAL_STATUS).methods.single { it.name == "statusDocument" }.instructions()
            assertFalse("${build.name}: the stubs stay empty", stub.any { it.reference() != null })
        }
    }

    /**
     * Each status read in the title is followed by LocalEmojiStatus.documentId on the read's result
     * and user, and each Premium check by LocalEmojiStatus.premium on its answer, each answer going
     * back into the register stock code reads next. Nothing jumps past them, and the rest is stock.
     */
    private fun assertLocalTitle(where: String, before: List<Instruction>, method: Method) {
        val after = method.instructions()
        val asks = after.indices.filter { after[it].reference() == LOCAL_STATUS_ID || after[it].reference() == LOCAL_STATUS_PREMIUM }
        assertEquals("$where: two status reads", 2, asks.count { after[it].reference() == LOCAL_STATUS_ID })
        assertEquals("$where: two Premium checks", 2, asks.count { after[it].reference() == LOCAL_STATUS_PREMIUM })
        val flow = ControlFlow.of(method)
        fun into(index: Int) = after.indices.filter { index in flow.normal[it] || index in flow.exceptional[it] }
        for (at in asks) {
            val result = after[at - 1].namedRegisters().single()
            if (after[at].reference() == LOCAL_STATUS_ID) {
                assertEquals("$where: reads the getter", USER_STATUS_ID, after[at - 2].reference())
                assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at - 1].opcode)
                assertEquals("$where: passes the id and the user", listOf(result) + after[at - 2].namedRegisters(), after[at].namedRegisters())
                assertEquals(Opcode.MOVE_RESULT_OBJECT, after[at + 1].opcode)
            } else {
                assertEquals("$where: asks isPremiumUser", IS_PREMIUM_USER, after[at - 2].reference())
                assertEquals(Opcode.MOVE_RESULT, after[at - 1].opcode)
                assertEquals(Opcode.INVOKE_STATIC_RANGE, after[at].opcode)
                assertEquals(listOf(result), after[at].namedRegisters())
                assertEquals(Opcode.MOVE_RESULT, after[at + 1].opcode)
            }
            assertEquals("$where: the answer replaces Telegram's", listOf(result), after[at + 1].namedRegisters())
            for (step in at..at + 2) assertEquals("$where: only the hook reaches $step", listOf(step - 1), into(step))
        }
        val inserted = asks.flatMap { listOf(it, it + 1) }.toSet()
        assertEquals("$where: the title is otherwise stock", before.filter { it.opcode != Opcode.NOP }.map(::stockOperation),
            after.filterIndexed { index, _ -> index !in inserted }.filter { it.opcode != Opcode.NOP }.map(::stockOperation))
    }

    /** The send asks LocalEmojiStatus first, returns when it kept the status, and otherwise runs whole. */
    private fun assertLocalSend(where: String, original: Method, method: Method) {
        val after = method.instructions()
        assertEquals("$where: register allocation stays stock", original.implementation!!.registerCount, method.implementation!!.registerCount)
        assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), after.take(4).map { it.opcode })
        assertEquals(LOCAL_STATUS_KEEP, after[0].reference())
        val receiver = method.implementation!!.registerCount - 3
        assertEquals("$where: passes the controller and the status", listOf(receiver, receiver + 1), after[0].namedRegisters())
        assertEquals("$where: a sent status goes on to stock code", setOf(3, 4), ControlFlow.of(method).normal[2].toSet())
        assertEquals("$where: the send is otherwise stock", original.instructions().map(::stockOperation), after.drop(4).map(::stockOperation))
    }

    /** No early return or new stock branch: every original operation and handler survives. */
    private fun assertEdits(where: String, original: Method, edits: List<CommerceEdit>) {
        val before = original.instructions()
        val method = edits.first().method
        val after = method.instructions()
        val inserted = edits.filter { !it.replace }
        assertEquals("$where: only two instructions per decision", before.size + inserted.size * 2, after.size)
        assertEquals("$where: register allocation stays stock", original.implementation!!.registerCount, method.implementation!!.registerCount)
        fun site(index: Int) = index + inserted.count { it.index < index } * 2
        fun stock(index: Int) = site(index) + if (inserted.any { it.index == index }) 2 else 0
        val replaced = edits.filter { it.replace }.associateBy { it.index }
        for (index in before.indices) {
            val next = after[stock(index)]
            if (index in replaced) {
                assertEquals("$where: stock append was scoped", "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z", before[index].reference())
                assertEquals(Opcode.INVOKE_STATIC, next.opcode)
                assertTrue("$where: append belongs to Commerce", next.reference().orEmpty().startsWith(COMMERCE))
                assertEquals("$where: receiver and row are unchanged", before[index].namedRegisters(), next.namedRegisters())
            } else assertEquals("$where: retains stock instruction $index", operation(before[index]), operation(next))
        }
        val oldFlow = ControlFlow.of(original)
        val newFlow = ControlFlow.of(method)
        fun destination(index: Int) = if (inserted.any { it.index == index }) site(index) else stock(index)
        for (index in before.indices) {
            assertEquals("$where: retains normal flow from $index", oldFlow.normal[index].map(::destination), newFlow.normal[stock(index)])
            assertEquals("$where: retains exception flow from $index", oldFlow.exceptional[index].map(::destination), newFlow.exceptional[stock(index)])
        }
        for (edit in inserted) {
            val at = site(edit.index)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, after[at].opcode)
            assertTrue("$where: scoped decision", after[at].reference().orEmpty().startsWith(COMMERCE))
            assertEquals(Opcode.MOVE_RESULT, after[at + 1].opcode)
            assertEquals("$where: result replaces only visibility", after[at].namedRegisters().last(), after[at + 1].namedRegisters().single())
            assertEquals("$where: question reaches its result", listOf(at + 1), newFlow.normal[at])
            assertEquals("$where: result reaches stock code", listOf(at + 2), newFlow.normal[at + 1])
            assertFalse("$where: no stock branch bypasses the visibility decision", newFlow.normal.withIndex().any { (index, targets) ->
                index !in at..at + 1 && at + 2 in targets
            })
        }
        assertEquals("$where: no server, purchase or entitlement call was removed",
            before.filterIsInstance<ReferenceInstruction>().map { it.reference.toString() }.filterNot { it == "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z" },
            after.filterIsInstance<ReferenceInstruction>().map { it.reference.toString() }.filterNot {
                it == "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z" || it.startsWith(COMMERCE)
            })
    }

    /**
     * The chat list menu's one decision: three instructions at the start of the Wallet entry, the
     * last a jump to the entry's stock exit [exit]. Every stock instruction and edge stays.
     */
    private fun assertMenuEdit(where: String, original: Method, edit: CommerceEdit, exit: Int) {
        val before = original.instructions()
        val after = edit.method.instructions()
        val at = edit.index
        assertEquals("$where: three instructions", before.size + 3, after.size)
        assertEquals("$where: register allocation stays stock", original.implementation!!.registerCount, edit.method.implementation!!.registerCount)
        fun stock(index: Int) = if (index < at) index else index + 3
        for (index in before.indices) {
            assertEquals("$where: retains stock instruction $index", operation(before[index]), operation(after[stock(index)]))
        }
        val available = before[at - 1].namedRegisters().single()
        assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ), (at..at + 2).map { after[it].opcode })
        assertEquals("$COMMERCE->showMenuWallet(Z)Z", after[at].reference())
        assertTrue("$where: the question and its answer use the gate's register",
            (at..at + 2).all { after[it].namedRegisters() == listOf(available) })
        val oldFlow = ControlFlow.of(original)
        val newFlow = ControlFlow.of(edit.method)
        assertEquals("$where: a hidden entry jumps to its stock exit", setOf(at + 3, stock(exit)), newFlow.normal[at + 2].toSet())
        assertEquals(listOf(at + 1), newFlow.normal[at])
        assertEquals(listOf(at + 2), newFlow.normal[at + 1])
        fun destination(index: Int) = if (index == at) at else stock(index)
        for (index in before.indices) {
            assertEquals("$where: retains normal flow from $index", oldFlow.normal[index].map(::destination), newFlow.normal[stock(index)])
            assertEquals("$where: retains exception flow from $index", oldFlow.exceptional[index].map(::destination), newFlow.exceptional[stock(index)])
        }
        for (step in at + 1..at + 3) {
            assertEquals("$where: only the hook reaches $step", listOf(step - 1), newFlow.normal.indices.filter { step in newFlow.normal[it] })
        }
    }

    /** The binder that labels an attach menu button Wallet, from the context so a test can change it. */
    private fun binder(context: BytecodePatchContext, type: String) = context.mutableClassDefBy(type).methods.single { method ->
        method.parameterTypes.size == 2 && method.instructions().any { it.reference() == WALLET_LABEL }
    }

    /** Where a decision's jump lands, as an index into its unchanged method. */
    private fun labelTarget(edit: CommerceEdit): Int {
        val label = edit.labels.single()
        val body = edit.method.instructions()
        return body.indices.single { label.copy(instruction = body[it]) == label }
    }

    /** Every instruction reachable from [from], handlers included. */
    private fun reach(flow: ControlFlow, from: Int): Set<Int> {
        val seen = mutableSetOf(from)
        val pending = ArrayDeque(listOf(from))
        while (pending.isNotEmpty()) {
            val at = pending.removeFirst()
            for (next in flow.normal[at] + flow.exceptional[at]) if (seen.add(next)) pending += next
        }
        return seen
    }

    private fun hosts(build: File): List<ClassDef> {
        val icons = FixtureDex.classesWhere(build, { true }) { method ->
            method.name == "<clinit>" && method.instructions().any { it.reference() == "VintageIcon" }
        }
        val flag = iconFlag(icons)
        val anchors = FixtureDex.classesWhere(build, { true }) { method ->
            method.instructions().any { it.opcode == Opcode.IGET_BOOLEAN && it.reference() == flag }
        } + FixtureDex.classesWhere(build, { true }) { method ->
            val refs = method.instructions().mapNotNull { it.reference() }.toSet()
            refs.contains(WALLET_LABEL) || refs.contains(SEND_GRAM) || refs.contains(PROFILE_GIFTS) || (refs.contains(GIFT_BUTTON) &&
                method.parameterTypes.map { it.toString() } == listOf("I", "Z", "Z")) ||
                (refs.containsAll(SETTINGS_SALES) && AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.parameterTypes.map { it.toString() } == listOf(method.definingClass, "Ljava/util/ArrayList;")) ||
                (refs.contains(JOIN) && refs.contains(UNMUTE)) ||
                refs.contains(STICKER_TOOLTIP) || (refs.contains(PREMIUM_BLOCKED) && refs.contains(PREMIUM_DOCUMENT)) ||
                (refs.contains(PREMIUM_EMOJI_PACK) && refs.contains(FREE_EMOJI)) || refs.contains(STATUSES_EQUAL)
        }
        val title = FixtureDex.classesWhere(build, { true }) { method ->
            method.parameterTypes.map { it.toString() } == listOf(USER, "Z") && method.instructions().any { it.reference() == LIST_STAR }
        }
        val kept = FixtureDex.classes(build, setOf(TABS, CONTROLLER, USER_CONFIG, EMOJI_USERS, EMOJI_DIALOGS, MESSAGE_OBJECT)).values
        return (icons + anchors + title + kept).distinctBy { it.type }
    }

    /** The chat list title's one method that draws the account's status or the Premium star. */
    private fun titleStatus(hosts: List<ClassDef>) = hosts.flatMap { it.methods.toList() }.single { method ->
        val refs = method.instructions().mapNotNull { it.reference() }
        method.returnType == "V" && method.parameterTypes.map { it.toString() } == listOf(USER, "Z") &&
            LIST_STAR in refs && USER_STATUS_ID in refs && IS_PREMIUM_USER in refs
    }

    /** MessagesController's send of the account's own new status. */
    private fun statusSend(hosts: List<ClassDef>) = hosts.single { it.type == CONTROLLER }.methods.single { method ->
        method.name == SEND_STATUS_NAME && method.parameterTypes.map { it.toString() } == SEND_STATUS_PARAMETERS
    }

    /** The App Icon list's Premium flag: the one instance boolean of the enum naming the launcher aliases. */
    private fun iconFlag(hosts: List<ClassDef>): String {
        val icons = hosts.single { classDef ->
            classDef.methods.any { method -> method.name == "<clinit>" && method.instructions().any { it.reference() == "VintageIcon" } }
        }
        return "${icons.type}->${icons.fields.single { it.type == "Z" && !AccessFlags.STATIC.isSet(it.accessFlags) }.name}:Z"
    }

    /** The methods that weigh the icon's Premium flag against Premium, which the switch answers for. */
    private fun iconReaders(hosts: List<ClassDef>): List<Method> {
        val flag = iconFlag(hosts)
        return hosts.flatMap { it.methods.toList() }.filter { method ->
            val refs = method.instructions().mapNotNull { it.reference() }
            method.instructions().any { it.opcode == Opcode.IGET_BOOLEAN && it.reference() == flag } &&
                (PREMIUM_ON_ACCOUNTS in refs || PREMIUM_BLOCKED in refs)
        }
    }

    /**
     * The methods that must go on reading a chat's real emoji status: the changed check, the
     * appearance editor that calls it, and the admin log's line for a status change.
     */
    private fun statusKeepers(hosts: List<ClassDef>): List<Method> {
        val editors = hosts.filter { classDef -> classDef.type != EMOJI_DIALOGS &&
            classDef.methods.any { method -> method.instructions().any { it.reference() == STATUSES_EQUAL } } }.map { it.type }.toSet()
        return hosts.flatMap { it.methods.toList() }.filter { method ->
            method.instructions().any { it.reference() == DIALOG_STATUS_ID } && (method.definingClass in editors ||
                method.definingClass == EMOJI_DIALOGS && method.name == "emojiStatusesEqual" ||
                method.definingClass == MESSAGE_OBJECT && method.name == "<init>" &&
                method.parameterTypes.any { it.toString() == ADMIN_LOG_EVENT })
        }
    }

    private fun assertFact(context: BytecodePatchContext, name: String, value: Int) {
        val body = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.instructions()
        assertEquals("$name is a build fact", value, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, body[1].opcode)
    }

    private fun assertUnwrittenIdentities(context: BytecodePatchContext) {
        for (name in listOf("giftTabId", "giftButtonIndex")) {
            val body = context.mutableClassDefBy(COMMERCE).methods.single { it.name == name }.instructions()
            assertEquals("$name was not written before validation", -1, (body[0] as NarrowLiteralInstruction).narrowLiteral)
        }
    }

    private fun assertRefuses(detail: String = "before editing", run: () -> Unit) {
        try {
            run()
            fail("changed fixture shape was accepted")
        } catch (expected: PatchException) {
            assertTrue(expected.message.orEmpty(), expected.message.orEmpty().contains(detail))
        }
    }

    private fun operation(instruction: Instruction) = listOf(instruction.opcode, instruction.reference(), instruction.namedRegisters(),
        if (instruction is OffsetInstruction) null else (instruction as? NarrowLiteralInstruction)?.narrowLiteral)
    private fun stockOperation(instruction: Instruction) = operation(instruction).let {
        if (instruction.opcode == Opcode.GOTO_16 || instruction.opcode == Opcode.GOTO_32) listOf(Opcode.GOTO) + it.drop(1) else it
    }
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
    private fun Method.key() = "$definingClass->$name${parameterTypes.joinToString("", "(", ")")}$returnType"

    private companion object {
        const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
        const val ADMIN_LOG_EVENT = "Lorg/telegram/tgnet/TLRPC\$TL_channelAdminLogEvent;"
        const val TABS = "Lorg/telegram/ui/Components/ScrollSlidingTextTabStrip;"
        const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
        const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
        const val USER = "Lorg/telegram/tgnet/TLRPC\$User;"
        const val JOIN = "Lorg/telegram/messenger/R\$string;->ChannelJoinNoCaps:I"
        const val UNMUTE = "Lorg/telegram/messenger/R\$string;->ChannelUnmuteNoCaps:I"
        const val SIDE_MENU = "Lorg/telegram/tgnet/TLRPC\$TL_attachMenuBot;->show_in_side_menu:Z"
        const val MENU_ADD = "(ILjava/lang/CharSequence;Ljava/lang/Runnable;Z)V"
    }
}
