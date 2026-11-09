/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.settings

import app.morphe.FixtureDex
import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patches.telegram.misc.commerce.CommerceTarget
import app.morphe.patches.telegram.misc.commerce.PremiumStickerTarget
import app.morphe.patches.telegram.misc.commerce.hideCommercePatch
import app.morphe.patches.telegram.misc.commerce.readsWalletAvailable
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
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.*
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference
import java.security.MessageDigest
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

class NativeSettingsFixtureTest {
    @Test fun clickInputAndCallbackCastsRefuseDriftAtomically() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf("item clobber", "owner clobber", "item cast", "view cast", "boxed argument")) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            if (change.endsWith("clobber")) {
                val input = plan.click.parameterRegisterNumber(if (change == "item clobber") 1 else 0)
                plan.click.addInstruction(plan.clickIndex - 1, "const/16 v$input, 0x0")
            } else {
                val tap = classes(context).flatMap { it.methods.toList() }.single { method -> tapsInto(method, plan.click) }
                val mutable = context.tgMutableClassDefBy(tap.definingClass).methods.single { it.toString() == tap.toString() }
                // 13.2's click callback casts its five arguments in order: item, view, position, then the two touch points.
                when (change) {
                    "item cast" -> mutable.replaceInstruction(0, "check-cast v1, Ljava/lang/String;")
                    "view cast" -> mutable.replaceInstruction(1, "check-cast v2, Ljava/lang/String;")
                    else -> mutable.replaceInstruction(2, "check-cast v3, Ljava/lang/Long;")
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
            val stock = plan.builder.body()
            val account = plan.rowIndex
            assertEquals(label("Account"), stock[account].ref())
            val stockFlow = ControlFlow.of(plan.builder)
            // Play 13.2.1 loads a later row's constant between the Wallet row and Account, and the
            // Wallet skips land on that constant; the divider's append jumps over it straight to Account.
            val hoisted = stock[account - 1].opcode == Opcode.CONST
            val landing = if (hoisted) account - 1 else account
            val skips = stock.indices.filter { landing in stockFlow.normal[it] && it != landing - 1 }
            assertEquals("$build: the new Wallet row's time and availability skips", 2, skips.size)
            val divider = (landing - 1 downTo 0).first { stock[it].opcode !in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32) }
            assertEquals(APPEND, stock[divider].ref())
            assertTrue("$build: the divider reaches Account", account in stockFlow.normal[landing - 1])
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { settingsPatch.execute(context) })
            val owner = context.tgMutableClassDefBy(plan.builder.definingClass)
            val row = owner.methods.single { it.origName == NATIVE_ROW_BRIDGE }
            val factory = plan.builder.body().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .first { it.parameterTypes.map { p -> p.toString() } == ROW_PARAMS }
            assertEquals(1, row.body().count { it.ref() == "$ENTRY->nativeSettingsTitle()Ljava/lang/String;" })
            assertEquals(1, row.body().count { it.ref() == factory.origString() })
            assertEquals(1, row.body().count { it.ref() == APPEND })
            // The way's switch is asked first, and the row is only built when it answers yes.
            assertEquals("$ENTRY->nativeRowShown()Z", row.body().first().ref())
            assertEquals(Opcode.MOVE_RESULT, row.body()[1].opcode)
            assertEquals(Opcode.IF_EQZ, row.body()[2].opcode)
            assertEquals(NATIVE_ROW_ID, (row.body()[3] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN_VOID, row.body().last().opcode)
            assertEquals(listOf(0, 1, 2, 3, 4, 5, 6), row.body().single { it.ref() == factory.origString() }.namedRegisters())
            assertEquals(listOf(7, 0), row.body().single { it.ref() == APPEND }.namedRegisters())
            val builder = owner.methods.single { it.toString() == plan.builder.toString() }
            val bridge = row.toString()
            assertEquals(1, builder.body().count { it.ref() == bridge })
            assertEquals(originals.getValue(builder.toString()), operations(builder, skip = { it.ref() == bridge }))
            // HushTelegram leads the account rows: right before Account, reached by the divider
            // above it and by both Wallet skips, so the new Wallet row shown or hidden it comes first.
            val call = builder.body().indexOfFirst { it.ref() == bridge }
            assertEquals("$build: the row goes in where Account began", account, call)
            assertEquals(label("Account"), builder.body()[call + 1].ref())
            val patchedFlow = ControlFlow.of(builder)
            assertEquals(listOf(call + 1), patchedFlow.normal[call])
            for (from in skips) assertTrue("$build: $from reaches the row", landing in patchedFlow.normal[from])
            if (hoisted) assertEquals("$build: the hoisted constant falls into the row", listOf(call), patchedFlow.normal[landing])
            assertTrue("$build: the divider reaches the row", call in patchedFlow.normal[landing - 1])
            assertTrue("$build: nothing jumps past the row into Account",
                builder.body().indices.none { call + 1 in patchedFlow.normal[it] && it != call })
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
            for (id in (1..27).toList() + listOf(-1, 0, NATIVE_ROW_ID)) {
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
            val context = commerceContext(build)
            settingsPatch.execute(context)
            val plan = context.resolveCommerceHooks()
            assertEquals(setOf(CommerceTarget.SETTINGS), plan.hooks.keys)
            assertEquals("five replaced rows and two Wallet gates", 7, plan.hooks.getValue(CommerceTarget.SETTINGS).size)
            val method = plan.hooks.getValue(CommerceTarget.SETTINGS).first().method
            val before = operations(method)
            val warnings = PatchLogCapture.warnings { hideCommercePatch.execute(context) }
            // Only Settings is loaded here: the profile, channel, Wallet menu, Send Gram and Premium
            // sticker targets each report themselves missing, and so do the emoji status, Premium
            // app icon and local emoji status switches.
            assertEquals(CommerceTarget.entries.size - 1 + PremiumStickerTarget.entries.size + 3, warnings.size)
            assertEquals(1, method.body().count { it.ref()?.contains("->$NATIVE_ROW_BRIDGE(") == true })
            assertEquals(5, method.body().count { it.ref()?.contains("->addSettingsRow(") == true })
            val body = method.body()
            val gates = body.indices.filter { body[it].ref()?.contains("->showWalletRow(") == true }
            assertEquals(2, gates.size)
            assertTrue(gates.all { body[it + 1].opcode == Opcode.MOVE_RESULT })
            val added = gates.flatMap { listOf(body[it], body[it + 1]) }
            assertEquals(before.filterNot { it[1] == APPEND }, operations(method, skip = { instruction -> added.any { it === instruction } }).filterNot {
                it[1] == APPEND || it[1]?.toString()?.contains("->addSettingsRow(") == true })
            for ((name, expected) in mapOf("hideCommerce" to 1, "commerceSettingsRows" to 1,
                "commerceProfileGifts" to 0, "commerceChannelGift" to 0, "commerceAttachWallet" to 0, "commerceMenuWallet" to 0,
                "commerceProfileSendGram" to 0, "commerceAddressSendGram" to 0, "commerceTransferSendGram" to 0,
                "commerceProfileGiftMenu" to 0,
                "commercePremiumStickers" to 0, "commercePremiumEffects" to 0, "commercePremiumEmojiPacks" to 0,
                "commerceEmojiStatus" to 0, "commercePremiumIcons" to 0, "commerceLocalEmojiStatus" to 0)) {
                val flag = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }
                assertEquals(expected, (flag.body().first() as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    @Test fun changedRowOperandsRefuseAtomically() {
        for (build in Fixtures.declaredBuilds()) for (title in TITLES) for (change in listOf("icon", "title", "identity", "factory", "append")) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            val body = plan.builder.body()
            val (at, call, args) = row(body, title)
            // 0x7f000001 names no resource: an icon or title id the row no longer loads.
            when (change) {
                "icon" -> lastWrite(body, args[3], call).let { icon ->
                    plan.builder.replaceInstruction(icon, "const v${args[3]}, 0x7f000001")
                }
                "title" -> plan.builder.replaceInstruction(at, "const v" + body[at].namedRegisters().single() + ", 0x7f000001")
                "identity" -> plan.builder.replaceInstruction(lastWrite(body, args[0], call), "const/16 v${args[0]}, 0x7b")
                "factory" -> plan.builder.replaceInstruction(call, "nop")
                else -> plan.builder.replaceInstruction(call + 2, "nop")
            }
            refusesUnchanged("$build $title $change", context)
        }
    }

    // The account row's empty value is const/4 or const/16, depending on the build; any other value refuses.
    @Test fun changedAccountRowValueRefusesAtomically() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            val body = plan.builder.body()
            val (_, call, args) = row(body, "Account")
            plan.builder.replaceInstruction(lastWrite(body, args[6], call), "const/16 v${args[6]}, 0x1")
            refusesUnchanged("$build account value", context)
        }
    }

    @Test fun changedOrAmbiguousBindingsClicksAndEntriesRefuseAtomically() {
        for (build in Fixtures.declaredBuilds()) for (change in listOf(
            "missing builder", "ambiguous builder", "missing click", "ambiguous click", "row bridge collision",
            "click identity", "click title", "click switch", "ordinary account click", "click callback target",
            "click capture", "fill dispatch", "fill route", "view binding", "view owner", "parent access",
            "factory access", "factory store", "factory mask", "factory title", "renderer title",
        ) + listOf("openFromNative", "nativeSettingsTitle", "nativeRowShown").flatMap { listOf("missing $it", "access $it", "ambiguous $it") }) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            val owner = context.tgMutableClassDefBy(plan.builder.definingClass)
            val click = plan.click
            // 13.2 renames both callbacks' methods; they're found by shape and by what they call.
            val tap = classes(context).single { type -> type.methods.any { tapsInto(it, click) } }
            val tapRun = tap.methods.single { tapsInto(it, click) }
            val tapInit = tap.methods.single { it.origName == "<init>" }
            val fill = classes(context).single { type -> type.type != owner.type && type.methods.any { fills(it, plan.builder) } }
            val fillRun = fill.methods.single { fills(it, plan.builder) }
            val view = owner.methods.single { it.origName == "createView" }
            val rowFactory = plan.builder.body().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .first { it.parameterTypes.map { p -> p.toString() } == ROW_PARAMS }
            val factory = context.tgMutableClassDefBy(rowFactory.definingClass).methods.single { it.toString() == rowFactory.toString() }
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
                    // Into the stock register: 13.2's click has eight registers, so v8 isn't one of them.
                    click.replaceInstruction(at, "new-instance v${click.body()[at].namedRegisters().single()}, Lorg/telegram/ui/ThemeActivity;")
                }
                "click callback target" -> tapRun.replaceInstruction(tapRun.body().indexOfFirst { it.ref() == click.origString() }, "nop")
                "click capture" -> tapInit.replaceInstruction(0, "nop")
                "fill dispatch" -> fillRun.replaceInstruction(1, "const/4 v1, 0x0")
                "fill route" -> fillRun.replaceInstruction(fillRun.body().indexOfFirst { it.ref() == plan.builder.origString() }, "nop")
                "view binding" -> view.replaceInstruction(view.body().indexOfFirst { it.ref() == tapInit.origString() }, "nop")
                "view owner" -> view.replaceInstruction(0, "const/4 v0, 0x0")
                "parent access" -> context.tgMutableClassDefBy(owner.superclass!!).methods.single { it.origName == "getParentActivity" }
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
                "renderer title" -> renderer(context.tgMutableClassDefBy(rowFactory.definingClass).methods, rowFactory.returnType)
                    .replaceInstruction(45, "nop")
                else -> {
                    val entry = context.tgMutableClassDefBy(ENTRY)
                    val name = change.substringAfter(' ')
                    val method = entry.methods.single { it.origName == name }
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
                val factory = context.tgMutableClassDefBy(ref.definingClass).methods.single { it.toString() == ref.origString() }
                val fieldRef = (factory.body()[slot] as ReferenceInstruction).reference.origString()
                val item = context.tgMutableClassDefBy(ref.returnType)
                val field = item.fields.single { it.toString() == fieldRef }
                when (change) {
                    "missing" -> item.fields.remove(field)
                    "private" -> field.accessFlags = AccessFlags.PRIVATE.value
                    "static" -> field.accessFlags = field.accessFlags or AccessFlags.STATIC.value
                    "final" -> field.accessFlags = field.accessFlags or AccessFlags.FINAL.value
                    else -> {
                        item.fields.remove(field)
                        item.fields.add(ImmutableField(field.definingClass, field.name,
                            if (field.origType == "I") "J" else "I", field.accessFlags, null,
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
            val renderer = renderer(context.tgMutableClassDefBy(factory.definingClass).methods, factory.returnType)
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
                "title clobber" -> renderer.replaceInstruction(44, "const/16 v$title, 0x0")
                else -> renderer.replaceInstruction(53, "const/16 v$subtitle, 0x0")
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
            "column orientation", "column clobber", "append argument", "append return", "column return", "private title")) {
            val context = context(build)
            val plan = context.resolveNativeSettings()!!
            val factory = plan.builder.body().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
                .first { it.parameterTypes.map(CharSequence::toString) == ROW_PARAMS }
            val renderer = renderer(context.tgMutableClassDefBy(factory.definingClass).methods, factory.returnType)
            val cell = context.tgMutableClassDefBy(renderer.body()[5].ref()!!)
            val constructor = cell.methods.single { it.origName == "<init>" }
            val body = constructor.body()
            when (change) {
                "title store" -> constructor.replaceInstruction(28, "iput-object v2, v11, ${body[41].ref()}")
                "subtitle store" -> constructor.replaceInstruction(41, "iput-object v2, v11, ${body[52].ref()}")
                "column orientation" -> constructor.replaceInstruction(1, "const/4 v0, 0x0")
                "column clobber" -> constructor.replaceInstruction(4, "const/4 v0, 0x0")
                "append argument" -> constructor.replaceInstruction(39, "invoke-static {v1, v0, v4, v12}, ${body[39].ref()}")
                "private title" -> cell.fields.single { it.toString() == body[28].ref() }.accessFlags =
                    AccessFlags.PRIVATE.value or AccessFlags.FINAL.value
                else -> {
                    val ref = (body[if (change == "append return") 39 else 24] as ReferenceInstruction).reference as MethodReference
                    val helper = context.tgMutableClassDefBy(ref.definingClass).methods.single { it.toString() == ref.origString() }
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
            assertTrue(methods(context).none { it.origName == NATIVE_ROW_BRIDGE })
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + SettingsPatchHosts.all() + NativeSettingsFixtures.hosts(build))
    /**
     * Hide Premium reads 13.2's row titles through LocaleController's getString(int) wrapper, which R8
     * inlined into the rows, and the Wallet gates through the merged walletAvailable flag class.
     */
    private fun commerceContext(build: File): BytecodePatchContext {
        val hosts = NativeSettingsFixtures.hosts(build)
        val flags = hosts.flatMap { it.methods }.flatMap { it.implementation?.instructions?.toList().orEmpty() }
            .filter { it.readsWalletAvailable() }
            .map { ((it as ReferenceInstruction).reference as FieldReference).type }.toSet()
        val kept = FixtureDex.classes(build, setOf("Lorg/telegram/messenger/LocaleController;") + flags).values
        return PatchContexts.of((ExtensionDex.classes() + SettingsPatchHosts.all() + hosts + kept).distinctBy { it.type })
    }
    private fun classes(context: BytecodePatchContext) = mutableListOf<String>().also { types ->
        context.classDefForEach { types += it.type }
    }.map { context.tgMutableClassDefBy(it) }
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
    private fun Instruction.ref() = origRef()
    private fun operations(method: Method, excluded: IntRange = IntRange.EMPTY, skip: (Instruction) -> Boolean = { false }) =
        method.body().withIndex().filter { it.index !in excluded && it.value.opcode != Opcode.NOP && !skip(it.value) }
            .map { listOf(it.value.opcode, it.value.ref(), it.value.namedRegisters(),
                (it.value as? WideLiteralInstruction)?.wideLiteral) }
    private fun label(title: String) = "Lorg/telegram/messenger/R\$string;->Settings$title:I"
    /** A row's title load, its factory call and the call's seven argument registers. */
    private fun row(body: List<Instruction>, title: String): Triple<Int, Int, List<Int>> {
        val at = body.indexOfFirst { it.ref() == label(title) }
        val call = (at + 1 until minOf(body.size, at + 17)).first { body[it].ref()?.contains("(IIIILjava/lang/CharSequence;") == true }
        return Triple(at, call, body[call].namedRegisters())
    }
    private fun lastWrite(body: List<Instruction>, register: Int, before: Int) = (before - 1 downTo 0).first {
        body[it].opcode.setsRegister() && body[it].namedRegisters().firstOrNull() == register
    }
    private fun tapsInto(method: Method, click: Method) = method.returnType == "V" && method.parameterTypes.size == 5 &&
        method.body().any { it.ref() == click.origString() }
    private fun fills(method: Method, builder: Method) = method.returnType == "V" && method.parameterTypes.size == 2 &&
        method.body().any { it.ref() == builder.origString() }
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
                    instruction.origRef() ==
                        "Lorg/telegram/messenger/R\$string;->SettingsAccount:I"
                } == true
        }
        check(owners.size == 1) { "$build has no unique self-settings owner" }
        val owner = owners.single()
        val builder = owner.methods.single { method ->
            method.parameterTypes.map { it.toString() } == listOf(owner.type, "Ljava/util/ArrayList;") &&
                method.implementation?.instructions?.any {
                    it.origRef() ==
                        "Lorg/telegram/messenger/R\$string;->SettingsAccount:I"
                } == true
        }
        val factory = builder.implementation!!.instructions.mapNotNull {
            (it as? ReferenceInstruction)?.reference as? MethodReference
        }.first { it.parameterTypes.map { p -> p.toString() } ==
            List(4) { "I" } + List(3) { "Ljava/lang/CharSequence;" } }
        val view = owner.methods.single { it.origName == "createView" }.implementation!!.instructions.toList()
        val list = view.indexOfFirst { instruction ->
            val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            call?.origName == "<init>" && "Lorg/telegram/messenger/Utilities\$Callback5;" in call.origParameterTypes
        }
        check(list >= 8)
        val callbacks = view.subList(list - 8, list).filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { (it as ReferenceInstruction).reference.origString() }
        val factoryClass = FixtureDex.classes(build, setOf(factory.definingClass)).getValue(factory.definingClass)
        val cellType = renderer(factoryClass.methods, factory.returnType).implementation!!.instructions
            .first { it.opcode == Opcode.CHECK_CAST }.let { (it as ReferenceInstruction).reference.origString() }
        val cell = FixtureDex.classes(build, setOf(cellType)).getValue(cellType)
        val helperTypes = cell.methods.single { it.origName == "<init>" }.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { call ->
                call.origReturnType in listOf("Landroid/widget/TextView;", "Landroid/widget/LinearLayout;")
            }?.definingClass
        }
        (owners + listOf(factoryClass, cell) + FixtureDex.classes(build, (callbacks + helperTypes +
            listOf(owner.superclass!!, factory.returnType)).toSet()).values).also { cached[build] = SoftReference(it) }
    }
}

/** The row renderer: 13.2 renames bindView, so it's the instance method that takes a view, the row item and a flag. */
internal fun <M : Method> renderer(methods: Iterable<M>, item: String): M = methods.single {
    !AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
        it.parameterTypes.take(3).map(CharSequence::toString) == listOf("Landroid/view/View;", item, "Z")
}
