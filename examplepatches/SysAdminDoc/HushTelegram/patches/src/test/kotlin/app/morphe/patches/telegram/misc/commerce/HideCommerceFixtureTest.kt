/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.commerce

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
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
            assertEquals("${build.name}: exactly five Settings sales appends", 5,
                plan.hooks.getValue(CommerceTarget.SETTINGS).size)
            val profile = plan.hooks.getValue(CommerceTarget.PROFILE_GIFTS)
            assertEquals("${build.name}: fresh and cached edit candidates", 2, profile.count { it.replace })
            assertEquals("${build.name}: cached presence comparison", 1, profile.count { !it.replace })
            assertTrue("${build.name}: presence guard runs before either candidate append",
                profile.single { !it.replace }.index < profile.filter { it.replace }.minOf { it.index })
            val channel = plan.hooks.getValue(CommerceTarget.CHANNEL_GIFT)
            assertEquals(1, channel.size)
            assertEquals("${build.name}: footer visibility guard is before stock UI work", 0, channel.single().index)

            val originals = plan.hooks.mapValues { (_, edits) -> ImmutableMethod.of(edits.first().method) }
            val changed = originals.values.map { it.definingClass to it.name }.toSet()
            val untouched = hosts.flatMap { it.methods.toList() }.filter { (it.definingClass to it.name) !in changed }
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
                assertEdits("${build.name}: $target", originals.getValue(target), edits)
            }
            for (method in untouched) {
                val after = context.mutableClassDefBy(method.definingClass).methods.single { it.sameSignature(method) }
                assertEquals("${build.name}: retains $method", method.instructions().map(::operation), after.instructions().map(::operation))
            }
            assertFact(context, "hideCommerce", 1)
            CommerceTarget.entries.forEach { assertFact(context, it.capability, 1) }
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
                "cached title" -> method.replaceInstruction(labels.last() + 3, "move-object/from16 v8, v15")
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
        for (build in Fixtures.declaredBuilds()) for (anchor in SETTINGS_SALES + listOf(PROFILE_GIFTS, GIFT_BUTTON, GIFT_ICON)) {
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
            val stub = context.mutableClassDefBy(COMMERCE).methods.single { it.name == "giftButtonIndex" }.instructions()
            assertEquals("${build.name}: no invented footer identity", -1, (stub[0] as NarrowLiteralInstruction).narrowLiteral)
        }
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

    private fun hosts(build: File): List<ClassDef> {
        val anchors = FixtureDex.classesWhere(build, { true }) { method ->
            val refs = method.instructions().mapNotNull { it.reference() }.toSet()
            refs.contains(PROFILE_GIFTS) || (refs.contains(GIFT_BUTTON) &&
                method.parameterTypes.map { it.toString() } == listOf("I", "Z", "Z")) ||
                (refs.containsAll(SETTINGS_SALES) && AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.parameterTypes.map { it.toString() } == listOf(method.definingClass, "Ljava/util/ArrayList;")) ||
                (refs.contains(JOIN) && refs.contains(UNMUTE))
        }
        return (anchors + FixtureDex.classes(build, setOf(TABS, CONTROLLER, USER_CONFIG)).values).distinctBy { it.type }
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
    private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
    private fun Method.sameSignature(other: Method) = name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }

    private companion object {
        const val TABS = "Lorg/telegram/ui/Components/ScrollSlidingTextTabStrip;"
        const val CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
        const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
        const val JOIN = "Lorg/telegram/messenger/R\$string;->ChannelJoinNoCaps:I"
        const val UNMUTE = "Lorg/telegram/messenger/R\$string;->ChannelUnmuteNoCaps:I"
    }
}
