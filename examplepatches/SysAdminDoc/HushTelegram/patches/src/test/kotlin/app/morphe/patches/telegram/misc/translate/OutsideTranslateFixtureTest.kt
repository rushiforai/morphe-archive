/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.translate

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.forward.FORWARDS
import app.morphe.patches.telegram.misc.forward.IS_PREMIUM
import app.morphe.patches.telegram.misc.forward.NAME_HIDE
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.messagemenu.CHOSEN
import app.morphe.patches.telegram.misc.messagemenu.FILL
import app.morphe.patches.telegram.misc.messagemenu.messageMenuPatch
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.superclassChain
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/** The message's translation decision, the menu builder and choice, the header item and its click, and the runtime. */
class OutsideTranslateFixtureTest {
    private val list = "Ljava/util/ArrayList;"
    private val fixed = setOf(
        "Lorg/telegram/messenger/MessageObject;", "Lorg/telegram/tgnet/TLRPC\$Message;", "Lorg/telegram/tgnet/TLRPC\$TL_textWithEntities;",
        "Lorg/telegram/messenger/TranslateController;", "Lorg/telegram/messenger/NotificationCenter;", "Lorg/telegram/messenger/UserConfig;",
        "Lorg/telegram/messenger/LocaleController;", "Lorg/telegram/messenger/R\$drawable;", "Lorg/telegram/messenger/MessagesController;",
    )

    /** What the message menu family reads besides the chat screen, for the shared-method test. */
    private val menuFixed = setOf(
        "Lorg/telegram/messenger/MessageObject\$GroupedMessages;", "Lorg/telegram/tgnet/TLRPC\$MessageFwdHeader;",
        "Lorg/telegram/tgnet/TLRPC\$MessageMedia;", "Lorg/telegram/tgnet/TLRPC\$Photo;", "Lorg/telegram/tgnet/TLRPC\$PhotoSize;",
        "Lorg/telegram/tgnet/TLRPC\$Document;", "Lorg/telegram/tgnet/TLRPC\$TL_messageMediaPaidMedia;",
        "Lorg/telegram/tgnet/TLRPC\$TL_messageActionEmpty;", "Lorg/telegram/messenger/MessagesController;",
        "Lorg/telegram/messenger/ChatObject;", "Lorg/telegram/messenger/UserObject;", "Lorg/telegram/messenger/DialogObject;",
        "Lorg/telegram/messenger/FileLoader;", "Lorg/telegram/messenger/ApplicationLoader;", "Landroidx/core/content/FileProvider;",
        "Lorg/telegram/messenger/SendMessagesHelper;", "Lorg/telegram/tgnet/TLRPC\$Dialog;", "Lorg/telegram/tgnet/TLRPC\$Chat;",
        "Lorg/telegram/messenger/R\$string;",
    )

    private fun Instruction.shape() = listOf(opcode, namedRegisters(), (this as? ReferenceInstruction)?.reference?.toString())
    private fun signature(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    /** The chat screen, the header delegate and the item adder, plus what the message menu family reads when [neighbours]. */
    private fun hosts(build: File, neighbours: Boolean = false): List<ClassDef> {
        val found = FixtureDex.classesWhere(build, { true }) { m ->
            val params = m.parameterTypes.map(CharSequence::toString)
            params == listOf("Lorg/telegram/messenger/MessageObject;", list, list, list) && m.controlBody().any { it.controlRef() == "Lorg/telegram/messenger/R\$string;->Forward:I" } ||
                params == listOf("I") && m.returnType == "V" && m.controlBody().any { it.controlRef() == "Lorg/telegram/messenger/TranslateController;->toggleTranslatingDialog(JZ)Z" } ||
                params.size == 3 && params[0] == "I" && params[1] == "I" && params[2] in setOf("Ljava/lang/String;", "Ljava/lang/CharSequence;") &&
                m.returnType.startsWith("Lorg/telegram/ui/ActionBar/") ||
                neighbours && (AccessFlags.STATIC.isSet(m.accessFlags) && params == listOf("I", "I", list, list) && m.returnType == "V" ||
                    m.name == "getParentActivity" && params.isEmpty() ||
                    m.controlBody().map { it.controlRef() }.let { IS_PREMIUM in it && FORWARDS in it && NAME_HIDE in it })
        }
        val items = found.flatMap { it.methods }.filter { m ->
            m.parameterTypes.map(CharSequence::toString) in listOf(listOf("I", "I", "Ljava/lang/String;"), listOf("I", "I", "Ljava/lang/CharSequence;")) &&
                m.returnType.startsWith("Lorg/telegram/ui/ActionBar/")
        }.map { it.returnType }.toSet()
        val types = (if (neighbours) fixed + menuFixed else fixed) + items
        // The screens' base classes, where the chat screen's account getter is declared.
        val bases = mutableListOf<ClassDef>()
        var next = found.mapNotNull { it.superclass }.filter { it.startsWith("Lorg/telegram/") }.toSet()
        while (next.isNotEmpty()) {
            val loaded = FixtureDex.classes(build, next).values
            bases += loaded
            next = loaded.mapNotNull { it.superclass }.filter { it.startsWith("Lorg/telegram/") }.toSet() - bases.map { it.type }.toSet()
        }
        return (FixtureDex.classes(build, types).values + found + bases).distinctBy { it.type }.map(ImmutableClassDef::of)
    }

    @Test fun `each site calls the extension first and Telegram's own code follows unchanged`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build))
            val site = context.resolveOutsideTranslate()
            // 13.1.0's R8 gave both builds the same wrapper and menu names (13.0.3's web build had w0 and y0).
            val itemType = "Lorg/telegram/ui/ActionBar/v0;"
            val menuType = "Lorg/telegram/ui/ActionBar/x0;"
            assertEquals("$name: the stock lazy item adder", "$menuType->u(IILjava/lang/String;)$itemType", site.lazyAdd.toString())
            assertEquals("$name: the wrapper's renamed text setter", "$itemType->d(Ljava/lang/CharSequence;)V", site.setHeaderText.toString())
            assertEquals("$name: the stock Translate item uses the same wrapper", itemType, site.translateItem.type)
            val oldUpdate = ImmutableMethod.of(site.update)
            val oldFill = ImmutableMethod.of(site.fill)
            val oldChoose = ImmutableMethod.of(site.choose)
            val oldVisibility = ImmutableMethod.of(site.visibility)
            val oldDelegate = ImmutableMethod.of(site.delegate)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { outsideTranslatePatch.execute(context) })

            // The message's decision: the extension's answer first, a yes returns true, a no runs Telegram's own.
            val updateTop = site.update.implementation!!.registerCount - 2
            val before = oldUpdate.controlBody()
            val after = site.update.controlBody()
            assertEquals("$name: five instructions", before.size + 5, after.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.RETURN), after.take(5).map { it.opcode })
            assertEquals("$OUTSIDE_TRANSLATE->show(Ljava/lang/Object;)Z", after[0].controlRef())
            assertEquals("$name: the message", listOf(updateTop), after[0].namedRegisters())
            assertEquals("$name: a no runs Telegram's code", listOf(3, 5), ControlFlow.of(site.update).normal[2].sorted())
            for (i in before.indices) assertEquals("$name: stock update $i", before[i].shape(), after[i + 5].shape())

            // The menu builder: the call sits where its one return was, and every branch to that return lands on the call.
            val builtBefore = oldFill.controlBody()
            val builtAfter = site.fill.controlBody()
            val end = builtBefore.size - 1
            val top = site.fill.implementation!!.registerCount
            assertEquals("$name: one instruction", builtBefore.size + 1, builtAfter.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, builtAfter[end].opcode)
            assertEquals("$OUTSIDE_TRANSLATE->fill(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V", builtAfter[end].controlRef())
            assertEquals("$name: the chat and the four arguments", (top - 5 until top).toList(), builtAfter[end].namedRegisters())
            assertEquals(Opcode.RETURN_VOID, builtAfter[end + 1].opcode)
            for (i in 0 until end) assertEquals("$name: stock $i", builtBefore[i].shape(), builtAfter[i].shape())
            val into = { flow: ControlFlow, at: Int -> flow.normal.indices.filter { at in flow.normal[it] } }
            assertEquals("$name: the branches land on the call", into(ControlFlow.of(oldFill), end), into(ControlFlow.of(site.fill), end))

            // The choice handler: the call first, Telegram's own code after it (switch padding comes and goes).
            val stock = oldChoose.controlBody().filter { it.opcode != Opcode.NOP }
            val chosen = site.choose.controlBody().filter { it.opcode != Opcode.NOP }
            val chooseTop = site.choose.implementation!!.registerCount
            assertEquals(stock.size + 1, chosen.size)
            assertEquals(Opcode.INVOKE_STATIC_RANGE, chosen[0].opcode)
            assertEquals("$OUTSIDE_TRANSLATE->chosen(Ljava/lang/Object;I)V", chosen[0].controlRef())
            assertEquals("$name: the chat and the number", listOf(chooseTop - 2, chooseTop - 1), chosen[0].namedRegisters())
            for (i in stock.indices) assertEquals("$name: stock choice $i", stock[i].shape(), chosen[i + 1].shape())

            // The chat's translate item updater gains one call at its top.
            val shownBefore = oldVisibility.controlBody()
            val shownAfter = site.visibility.controlBody()
            val visibilityTop = site.visibility.implementation!!.registerCount - 1
            assertEquals("$name: one instruction", shownBefore.size + 1, shownAfter.size)
            assertEquals("$OUTSIDE_TRANSLATE->headerMenu(Ljava/lang/Object;)V", shownAfter[0].controlRef())
            assertEquals("$name: the chat", listOf(visibilityTop), shownAfter[0].namedRegisters())
            for (i in shownBefore.indices) assertEquals("$name: stock updater $i", shownBefore[i].shape(), shownAfter[i + 1].shape())

            // The header's click delegate: the extension first, its own item returns, anything else runs Telegram's code.
            val delegateTop = site.delegate.implementation!!.registerCount - 2
            val clickBefore = oldDelegate.controlBody().filter { it.opcode != Opcode.NOP }
            val clickAfter = site.delegate.controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals("$name: four instructions", clickBefore.size + 4, clickAfter.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID), clickAfter.take(4).map { it.opcode })
            assertEquals("$OUTSIDE_TRANSLATE->headerClick(Ljava/lang/Object;I)Z", clickAfter[0].controlRef())
            assertEquals("$name: the delegate and the ID", listOf(delegateTop, delegateTop + 1), clickAfter[0].namedRegisters())
            assertEquals(listOf(0), clickAfter[1].namedRegisters())
            for (i in clickBefore.indices) assertEquals("$name: stock click $i", clickBefore[i].shape(), clickAfter[i + 4].shape())

            // The stubs reach what Telegram's own translation reads, and nothing of its Premium path.
            val stub = { n: String -> context.mutableClassDefBy(OUTSIDE_TRANSLATE).methods.single { it.name == n }.controlBody() }
            val everything = listOf("selected", "original", "translatable", "messageType", "dialog", "id", "entities", "isTranslated", "applyTranslated",
                "notifyTranslated", "notifyDialog", "translateIcon", "appLocale", "dialogTarget", "hasTranslateItem", "addHeaderItem", "setHeaderText", "chatOf",
                "chatDialog", "owner", "chatOwner")
                .flatMap { stub(it) }.mapNotNull { it.controlRef() }
            assertFalse("$name: Telegram's Premium and availability stay untouched",
                everything.any { it.contains("isFeatureAvailable") || it.contains("isPremium") || it.contains("setHideTranslateDialog") || it.contains("toggleTranslatingDialog") })
            assertTrue("$name: the selected message", stub("selected").any { it.controlRef() == site.selected.toString() })
            assertTrue("$name: Telegram's content check", stub("translatable").any { it.controlRef() == "Lorg/telegram/messenger/TranslateController;->isTranslatable(Lorg/telegram/messenger/MessageObject;)Z" })
            assertTrue("$name: the translation goes in Telegram's fields", stub("applyTranslated").any { it.controlRef() == "Lorg/telegram/tgnet/TLRPC\$Message;->translatedText:Lorg/telegram/tgnet/TLRPC\$TL_textWithEntities;" })
            assertTrue("$name: the flag is set", stub("applyTranslated").any { it.opcode == Opcode.IPUT_BOOLEAN && it.controlRef() == "Lorg/telegram/messenger/MessageObject;->translated:Z" })
            assertTrue("$name: the chat is told through Telegram's own notice", stub("notifyTranslated").any { it.controlRef() == "Lorg/telegram/messenger/NotificationCenter;->messageTranslated:I" })
            assertEquals("Lorg/telegram/messenger/R\$drawable;->msg_translate:I", stub("translateIcon").first().controlRef())
            // The translate bar's language comes from the message's own account and chat, as Telegram reads it there.
            assertEquals("$name: Telegram's translate bar language", listOf("Lorg/telegram/messenger/MessageObject;",
                "Lorg/telegram/messenger/MessageObject;->currentAccount:I",
                "Lorg/telegram/messenger/MessagesController;->getInstance(I)Lorg/telegram/messenger/MessagesController;",
                "Lorg/telegram/messenger/MessagesController;->getTranslateController()Lorg/telegram/messenger/TranslateController;",
                "Lorg/telegram/messenger/MessageObject;->getDialogId()J",
                "Lorg/telegram/messenger/TranslateController;->getDialogTranslateTo(J)Ljava/lang/String;"),
                stub("dialogTarget").mapNotNull { it.controlRef() })
            assertEquals(Opcode.RETURN_OBJECT, stub("dialogTarget").last().opcode)
            assertEquals("$name: adds through the item adder Telegram's own Translate uses", site.lazyAdd.toString(), stub("addHeaderItem").single { it.opcode == Opcode.INVOKE_VIRTUAL }.controlRef())
            assertEquals("$name: the native item is returned for later updates", listOf(Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
                stub("addHeaderItem").takeLast(2).map { it.opcode })
            assertTrue("$name: the returned item stays in the same register", stub("addHeaderItem").takeLast(2).all { it.namedRegisters() == listOf(0) })
            assertEquals("$name: the bridge returns an object", "Ljava/lang/Object;",
                context.mutableClassDefBy(OUTSIDE_TRANSLATE).methods.single { it.name == "addHeaderItem" }.returnType)
            val setter = stub("setHeaderText")
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID), setter.map { it.opcode })
            assertEquals("$name: the cast uses the resolved native item", itemType, setter[0].controlRef())
            assertEquals("$name: the label is changed on that item", site.setHeaderText.toString(), setter[1].controlRef())
            assertEquals(listOf(0, 1), setter[1].namedRegisters())
            assertEquals("$name: the delegate's chat", site.outer.toString(), stub("chatOf").single { it.opcode == Opcode.IGET_OBJECT }.controlRef())
            // Both owners end at the account's user ID, never at its slot number.
            val userId = "Lorg/telegram/messenger/UserConfig;->getClientUserId()J"
            val accountConfig = "Lorg/telegram/messenger/UserConfig;->getInstance(I)Lorg/telegram/messenger/UserConfig;"
            assertEquals("$name: a message's account", listOf("Lorg/telegram/messenger/MessageObject;->currentAccount:I", accountConfig, userId),
                stub("owner").mapNotNull { it.controlRef() }.filter { it.contains("->") })
            assertEquals(Opcode.RETURN_WIDE, stub("owner").last().opcode)
            val chatOwner = stub("chatOwner").mapNotNull { it.controlRef() }.filter { it.contains("->") }
            assertEquals("$name: the chat screen's account", listOf(site.accountGetter, accountConfig, userId), chatOwner)
            val base = site.accountGetter.substringBefore("->")
            assertTrue("$name: the getter is on the chat screen or a class above it", site.accountGetter.endsWith(";->getCurrentAccount()I") &&
                context.classDefByOrNull(base) != null && base in context.superclassChain(site.chat).toList())
            assertEquals(Opcode.RETURN_WIDE, stub("chatOwner").last().opcode)
            assertTrue("$name: the delegate is public", site.delegate.definingClass.isNotEmpty() && AccessFlags.PUBLIC.isSet(site.delegate.accessFlags))
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "outsideTranslate" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `missing or inaccessible native text updates refuse before hooks stubs or status change`() {
        for (build in Fixtures.declaredBuilds()) {
            val hostClasses = hosts(build)
            val types = hostClasses.map { it.type } + listOf(OUTSIDE_TRANSLATE, SETTINGS_STATUS)
            for (mutation in listOf("missing setter", "private setter", "static setter", "no visible text update", "missing bridge")) {
                val context = PatchContexts.of(ExtensionDex.classes() + hostClasses)
                val site = context.resolveOutsideTranslate()
                val owner = context.mutableClassDefBy(site.setHeaderText.definingClass)
                val setter = owner.methods.single { signature(it) == site.setHeaderText.toString() }
                when (mutation) {
                    "missing setter" -> owner.methods.remove(setter)
                    "private setter" -> setter.accessFlags = setter.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value
                    "static setter" -> setter.accessFlags = setter.accessFlags or AccessFlags.STATIC.value
                    "no visible text update" -> setter.controlBody().mapIndexedNotNull { index, instruction ->
                        index.takeIf { instruction.controlRef()?.contains("->setText(Ljava/lang/CharSequence;)V") == true }
                    }.asReversed().forEach { setter.replaceInstruction(it, "nop") }
                    "missing bridge" -> context.mutableClassDefBy(OUTSIDE_TRANSLATE).methods.removeAll { it.name == "setHeaderText" }
                }
                val before = state(context, types)
                assertThrows("${build.name}: $mutation", PatchException::class.java) { outsideTranslatePatch.execute(context) }
                assertEquals("${build.name}: $mutation leaves all host methods, runtime bridges and build flags unchanged",
                    before, state(context, types))
            }
        }
    }

    private fun state(context: BytecodePatchContext, types: List<String>) = types.associateWith { type ->
        context.mutableClassDefBy(type).let { cls ->
            listOf(cls.accessFlags, cls.methods.associate { method -> signature(method) to listOf(
                method.accessFlags, method.implementation?.registerCount,
                method.controlBody().map { instruction -> instruction.shape() + listOf(
                    (instruction as? WideLiteralInstruction)?.wideLiteral, (instruction as? OffsetInstruction)?.codeOffset) },
                method.implementation?.tryBlocks?.map { block -> listOf(block.startCodeAddress, block.codeUnitCount,
                    block.exceptionHandlers.map { listOf(it.exceptionType, it.handlerCodeAddress) }) },
            ) })
        }
    }

    /**
     * Hide translate bar swaps the item updater's hidden-bar read for its own, and the message menu
     * adds its own calls to the same builder and choice handler, whichever patch runs first.
     */
    @Test fun `Hide translate bar and the message menu share the chat's methods in either order`() {
        for (build in Fixtures.declaredBuilds()) for (translateFirst in listOf(true, false)) {
            val name = "${build.name} (${if (translateFirst) "translate first" else "translate last"})"
            val context = PatchContexts.of(ExtensionDex.classes() + hosts(build, neighbours = true))
            val site = context.resolveOutsideTranslate()
            val shownBefore = ImmutableMethod.of(site.visibility).controlBody()
            val builtBefore = ImmutableMethod.of(site.fill).controlBody()
            val chosenBefore = ImmutableMethod.of(site.choose).controlBody().filter { it.opcode != Opcode.NOP }
            val neighbours = listOf(hideTranslateBarPatch, messageMenuPatch)
            for (patch in if (translateFirst) listOf(outsideTranslatePatch) + neighbours else neighbours + outsideTranslatePatch) {
                assertEquals("$name: ${patch.name}", emptyList<String>(), PatchLogCapture.warnings { patch.execute(context) })
            }

            val shown = site.visibility.controlBody()
            assertEquals("$name: one call more in the item updater", shownBefore.size + 1, shown.size)
            assertEquals("$name: the header menu call comes first", "$OUTSIDE_TRANSLATE->headerMenu(Ljava/lang/Object;)V", shown[0].controlRef())
            assertEquals("$name: the bar read is Hide translate bar's", listOf(BAR_HIDDEN_HOOK),
                shown.mapNotNull { it.controlRef() }.filter { it == BAR_HIDDEN || it == BAR_HIDDEN_HOOK })

            val built = site.fill.controlBody()
            assertEquals("$name: both builder calls and nothing else", builtBefore.size + 2, built.size)
            assertEquals(Opcode.RETURN_VOID, built.last().opcode)
            assertEquals("$name: both calls sit right before the return",
                setOf(FILL, "$OUTSIDE_TRANSLATE->fill(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V"),
                built.takeLast(3).dropLast(1).map { it.controlRef() }.toSet())

            val chosen = site.choose.controlBody().filter { it.opcode != Opcode.NOP }
            assertEquals("$name: both choice calls and nothing else", chosenBefore.size + 2, chosen.size)
            assertEquals("$name: both choice calls come first", setOf(CHOSEN, "$OUTSIDE_TRANSLATE->chosen(Ljava/lang/Object;I)V"),
                chosen.take(2).map { it.controlRef() }.toSet())

            for (flag in listOf("outsideTranslate", "hideTranslateBar", "messageMenuRepeat")) {
                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }.controlBody()
                assertEquals("$name: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }
}
