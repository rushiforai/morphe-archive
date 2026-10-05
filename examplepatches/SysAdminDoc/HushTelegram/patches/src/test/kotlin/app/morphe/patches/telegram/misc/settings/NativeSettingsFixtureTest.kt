/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.settings

import app.morphe.FixtureDex
import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patches.telegram.misc.commerce.CommerceTarget
import app.morphe.patches.telegram.misc.commerce.hideCommercePatch
import app.morphe.patches.telegram.misc.commerce.resolveCommerceHooks
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.util.ControlFlow
import app.morphe.util.RegisterKinds
import app.morphe.util.namedRegisters
import app.morphe.util.registerReads
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.*
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference
import java.security.MessageDigest

class NativeSettingsFixtureTest {
    @Test fun clickInputAndCallbackCastsRefuseDriftAtomically() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf("item clobber", "owner clobber", "item cast", "view cast", "boxed argument")) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            if (change.endsWith("clobber")) {
                val input = plan.click.parameterRegisterNumber(if (change == "item clobber") 1 else 0)
                plan.click.addInstruction(plan.clickIndex - 1, "const/16 v$input, 0x0")
            } else {
                val tap = classes(context).flatMap { it.methods.toList() }.single { method ->
                    method.name == "run" && method.returnType == "V" && method.parameterTypes.size == 5 &&
                        method.body().any { it.ref() == plan.click.toString() }
                }
                val mutable = context.mutableClassDefBy(tap.definingClass).methods.single { it.toString() == tap.toString() }
                when (change) {
                    "item cast" -> mutable.replaceInstruction(1, "check-cast v1, Ljava/lang/String;")
                    "view cast" -> mutable.replaceInstruction(1, "check-cast v2, Ljava/lang/String;")
                    else -> mutable.replaceInstruction(3, "invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I")
                }
            }
            refusesUnchanged("$build $change", context)
        }
    }

    @Test fun nativeCellsAndDispatchKeepOrdinaryRowsOnBothFixtures() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            val originals = methods(context).associate { it.toString() to operations(it) }
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { settingsPatch.execute(context) })
            val owner = context.mutableClassDefBy(plan.builder.definingClass)
            val row = owner.methods.single { it.name == NATIVE_ROW_BRIDGE }
            val factory = plan.builder.body().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .first { it.parameterTypes.map { p -> p.toString() } == ROW_PARAMS }
            assertEquals(1, row.body().count { it.ref() == "$ENTRY->nativeSettingsTitle()Ljava/lang/String;" })
            assertEquals(1, row.body().count { it.ref() == factory.toString() })
            assertEquals(1, row.body().count { it.ref() == APPEND })
            assertEquals(NATIVE_ROW_ID, (row.body().first() as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(listOf(0, 1, 2, 3, 4, 5, 6), row.body().single { it.ref() == factory.toString() }.namedRegisters())
            assertEquals(listOf(7, 0), row.body().single { it.ref() == APPEND }.namedRegisters())
            val builder = owner.methods.single { it.toString() == plan.builder.toString() }
            val bridge = row.toString()
            assertEquals(1, builder.body().count { it.ref() == bridge })
            assertEquals(originals.getValue(builder.toString()), operations(builder, skip = { it.ref() == bridge }))
            val click = owner.methods.single { it.toString() == plan.click.toString() }
            val body = click.body()
            val start = body.indexOfFirst { (it as? NarrowLiteralInstruction)?.narrowLiteral == NATIVE_ROW_ID }
            assertEquals(plan.clickIndex, start)
            assertEquals(1, body.count { it.ref() == "$ENTRY->openFromNative(Landroid/app/Activity;)V" })
            assertEquals(originals.getValue(click.toString()), operations(click, excluded = start until start + 6))
            val flow = ControlFlow.of(click)
            assertEquals(setOf(start + 2, start + 6), flow.normal[start + 1].toSet())
            assertEquals(Opcode.IF_NE, body[start + 1].opcode)
            assertEquals(Opcode.RETURN_VOID, body[start + 5].opcode)
            for (id in (1..24).toList() + listOf(-1, 0, NATIVE_ROW_ID)) {
                val next = if (id == NATIVE_ROW_ID) start + 2 else start + 6
                assertTrue(next in flow.normal[start + 1])
                assertEquals(if (id == NATIVE_ROW_ID) Opcode.INVOKE_VIRTUAL else Opcode.CONST_STRING, body[next].opcode)
            }
            for (method in listOf(row, builder, click)) {
                val kinds = RegisterKinds.of(method)
                for ((index, instruction) in method.body().withIndex()) {
                    val state = kinds.at(index) ?: continue
                    if (method === row || method === click && index in start until start + 6 ||
                        method === builder && instruction.ref() == bridge) {
                        for ((register, use) in method.registerReads(instruction))
                            assertTrue("$build: $method at $index reads v$register as $use", use.fits(state, register))
                    }
                }
            }
            val changed = setOf(plan.builder.toString(), plan.click.toString()) +
                SettingsPatchHosts.all().flatMap { it.methods.toList() }.map { it.toString() }
            for (method in methods(context).filter { it.toString() in originals && it.toString() !in changed })
                assertEquals("retains $method", originals.getValue(method.toString()), operations(method))
        }
    }

    @Test fun commerceFilteringRetainsNativeAndOrdinaryAccountRows() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            settingsPatch.execute(context)
            val plan = context.resolveCommerceHooks()
            assertEquals(setOf(CommerceTarget.SETTINGS), plan.hooks.keys)
            assertEquals(5, plan.hooks.getValue(CommerceTarget.SETTINGS).size)
            val method = plan.hooks.getValue(CommerceTarget.SETTINGS).first().method
            val before = operations(method)
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            assertEquals(2, warnings.size)
            assertEquals(1, method.body().count { it.ref()?.contains("->$NATIVE_ROW_BRIDGE(") == true })
            assertEquals(5, method.body().count { it.ref()?.contains("->addSettingsRow(") == true })
            assertEquals(before.filterNot { it[1] == APPEND }, operations(method).filterNot {
                it[1] == APPEND || it[1]?.toString()?.contains("->addSettingsRow(") == true })
            for ((name, expected) in mapOf("hideCommerce" to 1, "commerceSettingsRows" to 1,
                "commerceProfileGifts" to 0, "commerceChannelGift" to 0)) {
                val flag = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }
                assertEquals(expected, (flag.body().first() as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    @Test fun changedRowOperandsRefuseAtomically() {
        for (build in Fixtures.declaredBuilds()) for (title in TITLES) for (change in listOf("icon", "title", "identity", "factory", "append")) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            val body = plan.builder.body()
            val at = body.indexOfFirst { it.ref() == label(title) }
            val call = (at + 1 until at + 12).first { body[it].ref()?.contains("(IIIILjava/lang/CharSequence;") == true }
            when (change) {
                "icon" -> plan.builder.replaceInstruction(at - 1,
                    "sget v" + body[at - 1].namedRegisters().single() + ", Lorg/telegram/messenger/R\$drawable;->settings_gift:I")
                "title" -> plan.builder.replaceInstruction(at,
                    "sget v" + body[at].namedRegisters().single() + ", Lorg/telegram/messenger/R\$string;->TelegramFAQ:I")
                "identity" -> plan.builder.replaceInstruction(call - 3,
                    "const/16 v" + body[call - 3].namedRegisters().single() + ", 0x7b")
                "factory" -> plan.builder.replaceInstruction(call, "nop")
                else -> plan.builder.replaceInstruction(call + 2, "nop")
            }
            refusesUnchanged("$build $title $change", context)
        }
    }

    @Test fun changedOrAmbiguousBindingsClicksAndEntriesRefuseAtomically() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf(
            "missing builder", "ambiguous builder", "missing click", "ambiguous click", "row bridge collision",
            "click identity", "click title", "click switch", "ordinary account click", "click callback target",
            "click capture", "fill dispatch", "fill route", "view binding", "view owner", "parent access",
            "factory access", "factory store", "factory mask", "factory title", "renderer title",
        ) + listOf("openFromNative", "nativeSettingsTitle").flatMap { listOf("missing $it", "access $it", "ambiguous $it") }) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            val owner = context.mutableClassDefBy(plan.builder.definingClass)
            val click = plan.click
            val tap = classes(context).single { type -> type.methods.any { method ->
                method.name == "run" && method.returnType == "V" && method.body().any { it.ref() == click.toString() }
            } }
            val tapRun = tap.methods.single { it.name == "run" && it.returnType == "V" && it.parameterTypes.size == 5 }
            val fill = classes(context).single { type -> type.methods.any { method ->
                method.name == "run" && method.body().any { it.ref() == plan.builder.toString() }
            } }
            val fillRun = fill.methods.single { it.name == "run" && it.returnType == "V" && it.parameterTypes.size == 2 }
            val view = owner.methods.single { it.name == "createView" }
            val rowFactory = plan.builder.body().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .first { it.parameterTypes.map { p -> p.toString() } == ROW_PARAMS }
            val factory = context.mutableClassDefBy(rowFactory.definingClass).methods.single { it.toString() == rowFactory.toString() }
            when (change) {
                "missing builder" -> owner.methods.remove(plan.builder)
                "ambiguous builder" -> owner.methods.add(copyNamed(plan.builder, "ambiguousNativeRows"))
                "missing click" -> owner.methods.remove(click)
                "ambiguous click" -> owner.methods.add(copyNamed(click, "ambiguousNativeClick"))
                "row bridge collision" -> owner.methods.add(copyNamed(plan.builder, NATIVE_ROW_BRIDGE))
                "click identity" -> click.replaceInstruction(plan.clickIndex - 1, "nop")
                "click title" -> click.replaceInstruction(plan.clickIndex, "const/4 v0, 0x0")
                "click switch" -> click.replaceInstruction(plan.clickIndex + 1, "nop")
                "ordinary account click" -> {
                    val at = click.body().indexOfFirst { it.opcode == Opcode.NEW_INSTANCE && it.ref() == "Lorg/telegram/ui/UserInfoActivity;" }
                    click.replaceInstruction(at, "new-instance v8, Lorg/telegram/ui/ThemeActivity;")
                }
                "click callback target" -> tapRun.replaceInstruction(tapRun.body().indexOfFirst { it.ref() == click.toString() }, "nop")
                "click capture" -> tap.methods.single { it.name == "<init>" }.replaceInstruction(0, "nop")
                "fill dispatch" -> fillRun.replaceInstruction(1, "const/4 v1, 0x0")
                "fill route" -> fillRun.replaceInstruction(fillRun.body().indexOfFirst { it.ref() == plan.builder.toString() }, "nop")
                "view binding" -> view.replaceInstruction(view.body().indexOfFirst { instruction ->
                    instruction.ref() == tap.methods.single { it.name == "<init>" }.toString() }, "nop")
                "view owner" -> view.replaceInstruction(0, "const/4 v0, 0x0")
                "parent access" -> context.mutableClassDefBy(owner.superclass!!).methods.single { it.name == "getParentActivity" }
                    .accessFlags = AccessFlags.PRIVATE.value
                "factory access" -> factory.accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value
                "factory store" -> factory.replaceInstruction(3, "nop")
                "factory mask" -> factory.replaceInstruction(12, "const-wide v5, 0x7fffffff")
                "factory title" -> {
                    val text = factory.body()[5].ref()!!
                    val subtitle = factory.body()[6].ref()!!
                    factory.replaceInstruction(5, "iput-object v5, v0, $subtitle")
                    factory.replaceInstruction(6, "iput-object v6, v0, $text")
                }
                "renderer title" -> context.mutableClassDefBy(rowFactory.definingClass).methods.single { it.name == "bindView" }
                    .replaceInstruction(38, "nop")
                else -> {
                    val entry = context.mutableClassDefBy(ENTRY)
                    val name = change.substringAfter(' ')
                    val method = entry.methods.single { it.name == name }
                    when {
                        change.startsWith("missing") -> entry.methods.remove(method)
                        change.startsWith("access") -> method.accessFlags = AccessFlags.PRIVATE.value or AccessFlags.STATIC.value
                        else -> entry.methods.add(copyNamed(method, name, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, "I"))
                    }
                }
            }
            refusesUnchanged("$build $change", context)
        }
    }

    @Test fun nativeCellFieldsKeepTheirRealPublicWritableTypes() {
        for (build in Fixtures.declaredBuilds()) for (slot in listOf(3, 4, 5, 6, 7, 15))
            for (change in listOf("missing", "private", "static", "final", "type")) {
                val context = context(build)
                val plan = context.resolveNativeSettings()!!
                val ref = plan.builder.body().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                    .first { it.parameterTypes.map { p -> p.toString() } == ROW_PARAMS }
                val factory = context.mutableClassDefBy(ref.definingClass).methods.single { it.toString() == ref.toString() }
                val fieldRef = (factory.body()[slot] as ReferenceInstruction).reference.toString()
                val item = context.mutableClassDefBy(ref.returnType)
                val field = item.fields.single { it.toString() == fieldRef }
                when (change) {
                    "missing" -> item.fields.remove(field)
                    "private" -> field.accessFlags = AccessFlags.PRIVATE.value
                    "static" -> field.accessFlags = field.accessFlags or AccessFlags.STATIC.value
                    "final" -> field.accessFlags = field.accessFlags or AccessFlags.FINAL.value
                    else -> {
                        item.fields.remove(field)
                        item.fields.add(ImmutableField(field.definingClass, field.name,
                            if (field.type == "I") "J" else "I", field.accessFlags, null,
                            field.annotations, field.hiddenApiRestrictions).toMutable())
                    }
                }
                refusesUnchanged("$build cell slot $slot $change", context)
            }
    }

    @Test fun rendererReceiverLoadsAndProvenanceRefuseAtomically() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf(
            "title null", "subtitle null", "wrong object", "swapped fields", "title clobber", "subtitle clobber",
        )) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            val factory = plan.builder.body().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .first { it.parameterTypes.map(CharSequence::toString) == ROW_PARAMS }
            val renderer = context.mutableClassDefBy(factory.definingClass).methods.single { it.name == "bindView" }
            val code = renderer.body()
            val title = code[10].namedRegisters().first()
            val subtitle = code[11].namedRegisters().first()
            val view = code[5].namedRegisters().single()
            when (change) {
                "title null" -> renderer.replaceInstruction(10, "const/16 v$title, 0x0")
                "subtitle null" -> renderer.replaceInstruction(11, "const/16 v$subtitle, 0x0")
                "wrong object" -> renderer.replaceInstruction(10, "iget-object v$title, v${view + 1}, ${code[10].ref()}")
                "swapped fields" -> {
                    renderer.replaceInstruction(10, "iget-object v$title, v$view, ${code[11].ref()}")
                    renderer.replaceInstruction(11, "iget-object v$subtitle, v$view, ${code[10].ref()}")
                }
                "title clobber" -> renderer.replaceInstruction(37, "const/16 v$title, 0x0")
                else -> renderer.replaceInstruction(45, "const/16 v$subtitle, 0x0")
            }
            refusesUnchanged("$build $change", context)
        }
    }

    @Test fun ordinaryClickConstructorsRequireTheirAllocatedReceiverAndExactMode() {
        for (build in Fixtures.declaredBuilds()) for (target in listOf("ThemeActivity", "SessionsActivity"))
            for (change in listOf("receiver", "argument", "producer")) {
                val context = context(build)
                val click = context.resolveNativeSettings()!!.click
                val at = click.body().indexOfFirst { it.ref() == "Lorg/telegram/ui/$target;-><init>(I)V" }
                assertTrue(at > 0)
                val instruction = click.body()[at]
                val args = instruction.namedRegisters()
                when (change) {
                    "receiver" -> click.replaceInstruction(at, "invoke-direct {v${args[1]}, v${args[1]}}, ${instruction.ref()}")
                    "argument" -> click.replaceInstruction(at, "invoke-direct {v${args[0]}, v2}, ${instruction.ref()}")
                    else -> {
                        val producer = click.body().indices.single {
                            (click.body()[it] as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
                                click.body()[it].namedRegisters() == listOf(args[1]) }
                        assertEquals(app.morphe.util.RegisterKind.ZERO, RegisterKinds.of(click).at(at)!![args[1]])
                        click.replaceInstruction(producer, "const/4 v${args[1]}, 0x1")
                    }
                }
                refusesUnchanged("$build $target $change", context)
            }
    }

    @Test fun cellTextRolesAndConstructionHelpersRefuseDriftAtomically() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf("title store", "subtitle store",
            "column orientation", "append argument", "append return", "column return", "private title")) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            val factory = plan.builder.body().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .first { it.parameterTypes.map(CharSequence::toString) == ROW_PARAMS }
            val renderer = context.mutableClassDefBy(factory.definingClass).methods.single { it.name == "bindView" }
            val cell = context.mutableClassDefBy(renderer.body()[5].ref()!!)
            val constructor = cell.methods.single { it.name == "<init>" }
            val body = constructor.body()
            when (change) {
                "title store" -> constructor.replaceInstruction(27, "iput-object v2, v11, ${body[40].ref()}")
                "subtitle store" -> constructor.replaceInstruction(40, "iput-object v2, v11, ${body[51].ref()}")
                "column orientation" -> constructor.replaceInstruction(22, "const/4 v0, 0x0")
                "append argument" -> constructor.replaceInstruction(38, "invoke-static {v1, v0, v4, v12}, ${body[38].ref()}")
                "private title" -> cell.fields.single { it.toString() == body[27].ref() }.accessFlags =
                    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value
                else -> {
                    val ref = (body[if (change == "append return") 38 else 23] as ReferenceInstruction).reference as MethodReference
                    val helper = context.mutableClassDefBy(ref.definingClass).methods.single { it.toString() == ref.toString() }
                    helper.replaceInstruction(3, "return-object v1")
                }
            }
            refusesUnchanged("$build $change", context)
        }
    }

    @Test fun absentNativeOwnerKeepsLauncherAndAppInfoFallbackTruthful() {
        for (build in Fixtures.declaredBuilds()) {
            val hosts = NativeSettingsFixtures.hosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + SettingsPatchHosts.all() + hosts.drop(1))
            assertNull(context.resolveNativeSettings())
            val warnings = PatchLogCapture.warnings { settingsPatch.execute(context) }
            assertEquals(1, warnings.size)
            assertTrue(warnings.single().contains("launcher shortcut and Android App info entry remain available"))
            for (hook in listOf("onApplicationCreate", "onActivityCreate", "onNewIntent"))
                assertTrue(methods(context).any { it.body().any { instruction -> instruction.ref()?.startsWith("$ENTRY->$hook(") == true } })
            assertTrue(methods(context).none { it.name == NATIVE_ROW_BRIDGE })
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + SettingsPatchHosts.all() + NativeSettingsFixtures.hosts(build))
    private fun classes(context: BytecodePatchContext) = mutableListOf<String>().also { types ->
        context.classDefForEach { types += it.type }
    }.map { context.mutableClassDefBy(it) }
    private fun methods(context: BytecodePatchContext) = classes(context).flatMap { it.methods.toList() }
    private fun refusesUnchanged(detail: String, context: BytecodePatchContext) {
        val before = snapshot(context)
        try {
            settingsPatch.execute(context)
            fail("$detail was accepted")
        } catch (expected: PatchException) {
            assertTrue("$detail: " + expected.message, expected.message.orEmpty().contains("before editing"))
        }
        assertEquals("$detail retains every class, field, method, lifecycle hook and build fact", before, snapshot(context))
    }
    private fun snapshot(context: BytecodePatchContext) = classes(context).associate { type ->
        val text = listOf(type.type, type.accessFlags, type.superclass, type.interfaces.sorted(),
            type.fields.sortedBy { it.toString() }.map { listOf(it.toString(), it.accessFlags, it.initialValue) },
            type.methods.sortedBy { it.toString() }.map { method -> listOf(method.toString(), method.accessFlags,
                method.implementation?.registerCount, method.body().map { instruction -> listOf(
                    instruction.opcode, instruction.ref(), instruction.namedRegisters(),
                    (instruction as? WideLiteralInstruction)?.wideLiteral,
                    (instruction as? OffsetInstruction)?.codeOffset,
                    (instruction as? SwitchPayload)?.switchElements?.map { it.key to it.offset }) },
                method.implementation?.tryBlocks?.map { block -> listOf(block.startCodeAddress, block.codeUnitCount,
                    block.exceptionHandlers.map { it.exceptionType to it.handlerCodeAddress }) }) }).toString()
        type.type to MessageDigest.getInstance("SHA-256").digest(text.toByteArray()).joinToString("") { "%02x".format(it) }
    }
    private fun copyNamed(method: Method, name: String, flags: Int = method.accessFlags, result: String = method.returnType): MutableMethod =
        ImmutableMethod(method.definingClass, name, method.parameters, result, flags,
            method.annotations, method.hiddenApiRestrictions, method.implementation).toMutable()
    private fun Method.body() = implementation?.instructions?.toList().orEmpty()
    private fun Instruction.ref() = (this as? ReferenceInstruction)?.reference?.toString()
    private fun operations(method: Method, excluded: IntRange = IntRange.EMPTY, skip: (Instruction) -> Boolean = { false }) =
        method.body().withIndex().filter { it.index !in excluded && it.value.opcode != Opcode.NOP && !skip(it.value) }
            .map { listOf(it.value.opcode, it.value.ref(), it.value.namedRegisters(),
                (it.value as? WideLiteralInstruction)?.wideLiteral) }
    private fun label(title: String) = "Lorg/telegram/messenger/R\$string;->Settings$title:I"
    private companion object {
        val TITLES = listOf("Account", "Chat", "PrivacySecurity", "Notifications", "Data", "Folders", "Devices", "PowerSaving", "Language")
        val ROW_PARAMS = List(4) { "I" } + List(3) { "Ljava/lang/CharSequence;" }
        const val APPEND = "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z"
    }
}

/** Loads only the native owner and the factory/callback types its actual list constructor binds. */
internal object NativeSettingsFixtures {
    private val cached = mutableMapOf<File, SoftReference<List<ClassDef>>>()
    fun hosts(build: File): List<ClassDef> = cached[build]?.get() ?: run {
        val owners = FixtureDex.classesWhere(build, { true }) { method ->
            method.parameterTypes.map { it.toString() } == listOf(method.definingClass, "Ljava/util/ArrayList;") &&
                method.implementation?.instructions?.any { instruction ->
                    (instruction as? ReferenceInstruction)?.reference?.toString() ==
                        "Lorg/telegram/messenger/R\$string;->SettingsAccount:I"
                } == true
        }
        check(owners.size == 1) { "$build has no unique self-settings owner" }
        val owner = owners.single()
        val builder = owner.methods.single { method ->
            method.parameterTypes.map { it.toString() } == listOf(owner.type, "Ljava/util/ArrayList;") &&
                method.implementation?.instructions?.any {
                    (it as? ReferenceInstruction)?.reference?.toString() ==
                        "Lorg/telegram/messenger/R\$string;->SettingsAccount:I"
                } == true
        }
        val factory = builder.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }.first { it.parameterTypes.map { p -> p.toString() } ==
            List(4) { "I" } + List(3) { "Ljava/lang/CharSequence;" } }
        val view = owner.methods.single { it.name == "createView" }.implementation!!.instructions.toList()
        val list = view.indexOfFirst { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            call?.name == "<init>" && call.parameterTypes.any { it.toString() ==
                "Lorg/telegram/messenger/Utilities\$Callback5;" }
        }
        check(list >= 8)
        val callbacks = view.subList(list - 8, list).filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { (it as ReferenceInstruction).reference.toString() }
        val factoryClass = FixtureDex.classes(build, setOf(factory.definingClass)).getValue(factory.definingClass)
        val cellType = factoryClass.methods.single { it.name == "bindView" }.implementation!!.instructions
            .first { it.opcode == Opcode.CHECK_CAST }.let { (it as ReferenceInstruction).reference.toString() }
        val cell = FixtureDex.classes(build, setOf(cellType)).getValue(cellType)
        val helperTypes = cell.methods.single { it.name == "<init>" }.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { call ->
                call.returnType in listOf("Landroid/widget/TextView;", "Landroid/widget/LinearLayout;")
            }?.definingClass
        }
        (owners + listOf(factoryClass, cell) + FixtureDex.classes(build, (callbacks + helperTypes +
            listOf(owner.superclass!!, factory.returnType)).toSet()).values).also { cached[build] = SoftReference(it) }
    }
}
