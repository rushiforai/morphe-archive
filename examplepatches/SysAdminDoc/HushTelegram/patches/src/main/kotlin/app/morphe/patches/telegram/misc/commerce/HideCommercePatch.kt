/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.commerce

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.handleTargets
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireParameterIntact
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

private const val PATCH = "Hide Premium, gifts and Stars"
internal const val COMMERCE = "$EXTENSION_PACKAGE/misc/Commerce;"
internal const val PROFILE_GIFTS = "Lorg/telegram/messenger/R\$string;->ProfileGifts:I"
internal const val GIFT_TAB = "Lorg/telegram/tgnet/TLRPC\$TL_profileTabGifts;"
internal const val PROFILE_TAB = "Lorg/telegram/tgnet/TLRPC\$ProfileTab;"
internal const val GIFT_BUTTON = "Lorg/telegram/messenger/R\$string;->ProfileActionsGift:I"
internal const val GIFT_ICON = "Lorg/telegram/messenger/R\$drawable;->input_gift_s:I"
// Telegram 13.0 renamed My TON's label to GramEarnings; the row (ID 13, its colors and factory) is the same.
internal val SETTINGS_SALES = listOf("TelegramPremium", "TelegramStars", "GramEarnings", "TelegramBusiness", "SendAGift")
    .map { "Lorg/telegram/messenger/R\$string;->$it:I" }
// Telegram 13.0's Wallet row (click identity 25). The builder places it at the top while it's new
// and after Language later, each placement behind the server's walletAvailable flag.
internal const val WALLET_LABEL = "Lorg/telegram/messenger/R\$string;->WalletAttachMoney:I"
internal const val WALLET_AVAILABLE = "Lorg/telegram/messenger/AppGlobalConfig;->walletAvailable:Lorg/telegram/messenger/AppGlobalConfig\$ConfigBoolean;"
private const val CONFIG_GET = "Lorg/telegram/messenger/AppGlobalConfig\$ConfigBoolean;->get()Z"
// 13.2 inlines get(): the flag's handler, cast to its Internal, and that handler's value.
private const val CONFIG_BOOLEAN_INTERNAL = "Lorg/telegram/messenger/AppGlobalConfig\$ConfigBoolean\$Internal;"
private const val CONFIG_BOOLEAN_VALUE = "$CONFIG_BOOLEAN_INTERNAL->value:Z"
private const val WALLET_ROW = 25
// The chat list's menu, found by the entries Telegram adds before Wallet with the same add.
internal val MENU_NEIGHBORS = listOf("NewGroup", "SavedMessages").map { "Lorg/telegram/messenger/R\$string;->$it:I" }
private val MENU_ADD = listOf("I", "Ljava/lang/CharSequence;", "Ljava/lang/Runnable;", "Z")
internal const val MENU_WALLET_LABEL = "hush_menu_wallet"
// Telegram 13.0's Send Gram item. A profile's menu, the popup for a tapped TON address and a Gram
// transfer's message menu each offer it behind their own walletAvailable read.
internal const val SEND_GRAM = "Lorg/telegram/messenger/R\$string;->WalletSendMoney:I"
internal const val COPY_ADDRESS = "Lorg/telegram/messenger/R\$string;->WalletCopyAddress:I"
internal const val GRAM_TRANSFER = "Lorg/telegram/tgnet/TLRPC\$TL_messageActionGramTransfer;"
private const val PROFILE_ACTIVITY = "Lorg/telegram/ui/ProfileActivity;"
// A profile's menu adds Send a Gift for a person and for a channel, each behind Telegram's purchase check.
internal val PROFILE_GIFT_ITEMS = listOf("ProfileSendAGift", "ProfileSendAGiftToChannel")
    .map { "Lorg/telegram/messenger/R\$string;->$it:I" }
internal const val PROFILE_GIFT_GATE = "Lorg/telegram/messenger/MessagesController;->premiumPurchaseBlocked()Z"
/** The field premiumPurchaseBlocked() returned, which 13.2's R8 reads in its place. */
internal const val PROFILE_GIFT_FIELD = "Lorg/telegram/messenger/MessagesController;->premiumLocked:Z"

/** Where the purchase check at [check] leaves its answer: the call's result, or 13.2's inlined field read. */
internal fun profileGiftAnswer(body: List<Instruction>, check: Int): Int? = when {
    body[check].origRef() == PROFILE_GIFT_GATE -> (check + 1).takeIf { body.getOrNull(it)?.opcode == Opcode.MOVE_RESULT }
    body[check].opcode == Opcode.IGET_BOOLEAN && body[check].origRef() == PROFILE_GIFT_FIELD -> check
    else -> null
}
private const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
private const val LINK_STYLE = "Landroid/text/style/CharacterStyle;"
private const val STRINGS = "Lorg/telegram/messenger/R\$string;->"
private const val TABS = "Lorg/telegram/ui/Components/ScrollSlidingTextTabStrip;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"
private const val APPEND = "$ARRAY_LIST->add(Ljava/lang/Object;)Z"
private const val INSERT = "$ARRAY_LIST->add(ILjava/lang/Object;)V"
private const val PAIR = "Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V"
private const val LOCALE = "Lorg/telegram/messenger/LocaleController;"
private const val STRING = "$LOCALE->getString(I)Ljava/lang/String;"
private const val BOX_INT = "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;"
private val SALES_FACTORY = List(4) { "I" } + List(3) { "Ljava/lang/CharSequence;" }
private val FOOTER_LABELS = listOf("ProfileActionsGift", "ChannelOpenDirect", "Search", "BroadcastGroupInfo")
    .map { "Lorg/telegram/messenger/R\$string;->$it:I" }
private val MOVES = setOf(Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16)
private val CONSTANTS = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16)
private val STORES = listOf("IPUT", "SPUT", "APUT").flatMap { kind ->
    listOf("", "_WIDE", "_OBJECT", "_BOOLEAN", "_BYTE", "_CHAR", "_SHORT").map { Opcode.valueOf(kind + it) }
}.toSet()

@Suppress("unused")
val hideCommercePatch = bytecodePatch(
    name = PATCH,
    description = "Removes Premium, Stars, My Grams, Wallet, Business and Send a Gift from Settings, Wallet and Send Gram " +
        "from the chat, profile and link menus, Gifts tabs on profiles, the Gift button in channels, and Premium stickers, " +
        "their effects and Premium emoji packs for an account without Premium, for a less cluttered app. On by default. Turn it off in " +
        "HushTelegram settings > Ads.",
    default = true,
) {
    category("Ads")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())

    execute {
        requireStatusMethod("hideCommerce")
        CommerceTarget.entries.forEach { requireStatusMethod(it.capability) }
        PremiumStickerTarget.entries.forEach { requireStatusMethod(it.capability) }
        // Every operand, identity and cached path is proved before the first instruction changes.
        val plan = resolveCommerceHooks()
        val stickers = resolvePremiumStickerHooks()
        val emoji = resolveEmojiStatus()
        val icons = resolvePremiumIcons()
        val local = resolveLocalEmojiStatus()
        shape(plan.hooks.isNotEmpty() || stickers.isNotEmpty(), "no sales presentation target")
        if (plan.giftTabId != null) writeStub(COMMERCE, "giftTabId", 1,
            "const/16 v0, ${plan.giftTabId}\nreturn v0")
        if (plan.giftButtonIndex != null) writeStub(COMMERCE, "giftButtonIndex", 1,
            "const/16 v0, ${plan.giftButtonIndex}\nreturn v0")
        stickers.stubs.forEach { (stub, smali) -> writeStub(COMMERCE, stub, 2, smali) }
        // One list, so the patch refuses only when the build has none of them at all.
        handleTargets(PATCH, "sales presentation targets", CommerceTarget.entries + PremiumStickerTarget.entries) { target ->
            // The profile's Send a Gift shares its method with Send Gram, which goes in just before it.
            val edits = if (target == CommerceTarget.PROFILE_GIFT_MENU) plan.hooks[target]?.let { profileGiftMenuEdits(it.first().method) }
                else if (target is CommerceTarget) plan.hooks[target] else stickers[target as PremiumStickerTarget]
            val capability = if (target is CommerceTarget) target.capability else (target as PremiumStickerTarget).capability
            val changed = (target as? PremiumStickerTarget)?.let { stickers.leftOut[it] }
            if (changed != null) "$capability left out, $changed"
            else if (edits == null) "no structurally matching $capability target"
            else {
                // Inserted code is what can fail to assemble, so within a target its methods go first
                // and a failure leaves the replace-only ones as they were. Later places first keep
                // earlier indexes.
                edits.groupBy { it.method }.values.sortedBy { inMethod -> inMethod.all { it.replace } }.forEach { inMethod ->
                    inMethod.sortedByDescending { it.index }.forEach { edit ->
                        if (edit.replace) edit.method.replaceInstruction(edit.index, edit.code)
                        else edit.method.addInstructionsAtControlFlowLabel(edit.index, edit.code, *edit.labels.toTypedArray())
                    }
                }
                when (target) {
                    CommerceTarget.SETTINGS -> enableCapability("commerceSettingsRows")
                    CommerceTarget.PROFILE_GIFTS -> enableCapability("commerceProfileGifts")
                    CommerceTarget.CHANNEL_GIFT -> enableCapability("commerceChannelGift")
                    CommerceTarget.ATTACH_WALLET -> enableCapability("commerceAttachWallet")
                    CommerceTarget.MENU_WALLET -> enableCapability("commerceMenuWallet")
                    CommerceTarget.PROFILE_SEND_GRAM -> enableCapability("commerceProfileSendGram")
                    CommerceTarget.ADDRESS_SEND_GRAM -> enableCapability("commerceAddressSendGram")
                    CommerceTarget.TRANSFER_SEND_GRAM -> enableCapability("commerceTransferSendGram")
                    CommerceTarget.PROFILE_GIFT_MENU -> enableCapability("commerceProfileGiftMenu")
                    PremiumStickerTarget.STICKERS -> enableCapability("commercePremiumStickers")
                    PremiumStickerTarget.EFFECTS -> enableCapability("commercePremiumEffects")
                    PremiumStickerTarget.EMOJI_PACKS -> enableCapability("commercePremiumEmojiPacks")
                }
                null
            }
        }
        if (emoji.missing == null) {
            emoji.apply()
            enableCapability("commerceEmojiStatus")
        } else {
            patchLog.warning("$PATCH: ${emoji.missing}. The patch goes on without the emoji status switch.")
        }
        if (icons.missing == null) {
            icons.apply()
            enableCapability("commercePremiumIcons")
        } else {
            patchLog.warning("$PATCH: ${icons.missing}. The patch goes on without the Premium app icon switch.")
        }
        if (local.missing == null) {
            local.apply(this)
            enableCapability("commerceLocalEmojiStatus")
        } else {
            patchLog.warning("$PATCH: ${local.missing}. The patch goes on without the local emoji status switch.")
        }
        enableStatus("hideCommerce")
    }
}

internal enum class CommerceTarget(val capability: String) {
    SETTINGS("commerceSettingsRows"), PROFILE_GIFTS("commerceProfileGifts"), CHANNEL_GIFT("commerceChannelGift"),
    ATTACH_WALLET("commerceAttachWallet"), MENU_WALLET("commerceMenuWallet"),
    PROFILE_SEND_GRAM("commerceProfileSendGram"), ADDRESS_SEND_GRAM("commerceAddressSendGram"),
    TRANSFER_SEND_GRAM("commerceTransferSendGram"), PROFILE_GIFT_MENU("commerceProfileGiftMenu"),
}

/**
 * One place that offers Send Gram: [add] is how it adds an item, taking the title as operand
 * [title], and [hook] is the Commerce question asked at its gate.
 */
private class SendGramSite(val where: String, val hook: String, val title: Int, val add: (MethodReference) -> Boolean)

// 13.2's R8 folded addSubItem(int, int, String) into the CharSequence overload on the menu item's base.
private val PROFILE_GRAM = SendGramSite("profile menu", "showProfileSendGram", 3) { call ->
    call.parameterTypes.map { it.toString() }.let { it == listOf("I", "I", "Ljava/lang/String;") || it == listOf("I", "I", "Ljava/lang/CharSequence;") }
}
private val ADDRESS_GRAM = SendGramSite("TON address popup", "showAddressSendGram", 2) { call ->
    call.origReturnType == "V" && call.parameterTypes.map { it.toString() } == MENU_ADD
}
private val TRANSFER_GRAM = SendGramSite("Gram transfer menu", "showTransferSendGram", 2) { call -> call.toString() == INSERT }

internal data class CommerceEdit(
    val method: MutableMethod,
    val index: Int,
    val code: String,
    val replace: Boolean = false,
    val labels: List<ExternalLabel> = emptyList(),
)
internal data class CommercePlan(
    val hooks: Map<CommerceTarget, List<CommerceEdit>>,
    val giftTabId: Int?,
    val giftButtonIndex: Int?,
)

/** Kept resources and TL types identify the surfaces; all renamed classes and members come from their bodies. */
internal fun BytecodePatchContext.resolveCommerceHooks(): CommercePlan {
    val classes = mutableMapOf<String, ClassDef>()
    classDefForEach { if (!it.origType.startsWith("Lapp/hushtelegram/extension/")) classes[it.type] = it }
    // Each search below reads only the methods of classes that might mention what it looks for,
    // still in the app's order and still checked in full.
    fun methods(mentioning: Mention) = classDefsMentioning(mentioning).mapNotNull { classes[it.type] }.flatMap { it.methods.toList() }
    fun mutable(method: Method) = tgMutableClassDefBy(method.definingClass).methods.single { it.sameSignature(method) }
    for (stub in listOf("giftTabId", "giftButtonIndex")) {
        shape(tgMutableClassDefBy(COMMERCE).methods.count { it.origName == stub && it.hasShape(emptyList(), "I") &&
            AccessFlags.STATIC.isSet(it.accessFlags) } == 1, "extension has no single integer $stub stub")
    }
    val hooks = mutableMapOf<CommerceTarget, List<CommerceEdit>>()
    val titles = titleCall()

    val settings =methods(Mention.anyReference(SETTINGS_SALES)).filter { method ->
        method.origReturnType == "V" && AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.map { it.toString() } == listOf(method.definingClass, ARRAY_LIST) &&
            SETTINGS_SALES.any { resource -> method.instructions().any { it.reference() == resource } }
    }.unique("Settings sales row builder")
    if (settings != null) {
        shape(SETTINGS_SALES.all { resource -> settings.instructions().any { it.reference() == resource } },
            "partially changed Settings sales labels")
        hooks[CommerceTarget.SETTINGS] = settingsEdits(mutable(settings), titles)
    }

    var giftTabId: Int? = null
    val profile = methods(Mention.reference(PROFILE_GIFTS)).filter { method -> method.hasShape(listOf("Z"), "V") &&
        method.instructions().any { it.reference() == PROFILE_GIFTS } }.unique("profile Gifts tab builder")
    if (profile != null) {
        val mapper = classes.getValue(profile.definingClass).methods.filter { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.hasShape(listOf(PROFILE_TAB), "I") &&
                method.instructions().any { it.opcode == Opcode.INSTANCE_OF && it.reference() == GIFT_TAB }
        }.unique("Gifts tab identity mapper") ?: throw PatchException("$PATCH: no Gifts tab identity mapper (before editing)")
        val body = mapper.instructions()
        val type = body.indices.single { body[it].opcode == Opcode.INSTANCE_OF && body[it].reference() == GIFT_TAB }
        val literal = body.getOrNull(type + 2) as? NarrowLiteralInstruction
        shape(body.getOrNull(type + 1)?.opcode == Opcode.IF_EQZ && literal != null &&
            body[type + 2].opcode in CONSTANTS &&
            body[type].namedRegisters()[1] == mapper.parameterRegisterNumber(0) &&
            body[type].namedRegisters().first() == body[type + 1].namedRegisters().single() &&
            body.getOrNull(type + 3)?.opcode == Opcode.RETURN &&
            body[type + 2].namedRegisters() == body[type + 3].namedRegisters() &&
            ControlFlow.of(mapper).normal[type + 1].contains(type + 4), "Gifts tab mapper has changed branches")
        giftTabId = literal!!.narrowLiteral
        shape(giftTabId in 0..32767, "Gifts tab ID does not fit the extension fact")
        val tabStrip = classes[TABS] ?: throw PatchException("$PATCH: no kept profile tab strip (before editing)")
        val hasTab = tabStrip.methods.filter { method -> method.hasShape(listOf("I"), "Z") &&
            method.instructions().any { it.reference() == "Landroid/util/SparseIntArray;->get(II)I" }
        }.unique("profile cached tab lookup") ?: throw PatchException("$PATCH: no profile cached tab lookup (before editing)")
        val clear = tabStrip.methods.filter { method -> method.hasShape(emptyList(), "Landroid/util/SparseArray;") &&
            method.instructions().any { it.reference() == "Landroid/view/ViewGroup;->removeAllViews()V" }
        }.unique("profile tab strip rebuild") ?: throw PatchException("$PATCH: no profile tab strip rebuild (before editing)")
        shape(clear.instructions().any { it.reference() == "Landroid/util/SparseIntArray;->clear()V" },
            "profile rebuild no longer clears cached tab identities")
        hooks[CommerceTarget.PROFILE_GIFTS] = profileEdits(mutable(profile), giftTabId, hasTab.toString(), clear.toString(), titles)
    }

    var giftButtonIndex: Int? = null
    val footer = methods(Mention.anyReference(FOOTER_LABELS)).filter { method -> method.hasShape(listOf("I", "Z", "Z"), "V") &&
        FOOTER_LABELS.any { resource -> method.instructions().any { it.reference() == resource } }
    }.unique("channel footer button visibility")
    if (footer != null) {
        shape(FOOTER_LABELS.all { resource -> footer.instructions().any { it.reference() == resource } },
            "partially changed channel footer labels")
        val method = mutable(footer)
        giftButtonIndex = footerGiftIndex(classes.getValue(footer.definingClass), method)
        val index = method.parameterRegisterNumber(0)
        val visible = method.parameterRegisterNumber(1)
        shape(visible == index + 1 && visible <= 255, "footer visibility operands cannot be passed intact")
        hooks[CommerceTarget.CHANNEL_GIFT] = listOf(CommerceEdit(method, 0,
            "invoke-static/range {v$index .. v$visible}, $COMMERCE->showChannelGiftButton(IZ)Z\nmove-result v$visible"))
    }

    // Telegram 13.0's attach menu: the button binder is the one bound by position that labels a
    // button Wallet.
    val binder = methods(Mention.reference(WALLET_LABEL)).filter { method -> method.origReturnType == "V" && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.parameterTypes.size == 2 && method.parameterTypes[1].toString() == "I" &&
        method.instructions().any { it.reference() == WALLET_LABEL }
    }.unique("attach menu button binder")
    if (binder != null) hooks[CommerceTarget.ATTACH_WALLET] = attachWalletEdits(mutable(binder), ::methods, ::mutable)

    // The chat list's menu adds Wallet after New Group and Saved Messages.
    val menu = methods(Mention.reference(WALLET_LABEL) and Mention.allReferences(MENU_NEIGHBORS)).filter { method ->
        method.hasShape(emptyList(), "V") && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.instructions().let { body -> body.any { it.reference() == WALLET_LABEL } &&
            MENU_NEIGHBORS.all { label -> body.any { it.reference() == label } } }
    }.unique("chat list menu with Wallet")
    if (menu != null) hooks[CommerceTarget.MENU_WALLET] = listOf(menuWalletEdit(mutable(menu), titles))

    // Send Gram, found by the kept types around it: the profile's menu builder, the static popup a
    // TON address link's style opens, and the message menu builder that fills three lists.
    val sendGram = methods(Mention.reference(SEND_GRAM)).filter { method -> method.instructions().any { it.reference() == SEND_GRAM } }
    val profileGram = sendGram.filter { it.origDefiningClass == PROFILE_ACTIVITY && it.hasShape(listOf("Z"), "V") }
        .unique("profile menu with Send Gram")
    if (profileGram != null) hooks[CommerceTarget.PROFILE_SEND_GRAM] = listOf(sendGramEdit(mutable(profileGram), PROFILE_GRAM, titles))
    val giftMenu = methods(Mention.allReferences(PROFILE_GIFT_ITEMS)).filter { method ->
        method.origDefiningClass == PROFILE_ACTIVITY && method.hasShape(listOf("Z"), "V") &&
            method.instructions().let { body -> PROFILE_GIFT_ITEMS.all { label -> body.any { it.reference() == label } } }
    }.unique("profile menu with Send a Gift")
    if (giftMenu != null) hooks[CommerceTarget.PROFILE_GIFT_MENU] = profileGiftMenuEdits(mutable(giftMenu))
    val addressGram = sendGram.filter { AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypes.lastOrNull()?.toString() == LINK_STYLE }
        .unique("TON address popup with Send Gram")
    if (addressGram != null) {
        // The popup's own items stay: Copy address is the one every TON address gets.
        shape(addressGram.instructions().any { it.reference() == COPY_ADDRESS }, "TON address popup no longer offers Copy address")
        hooks[CommerceTarget.ADDRESS_SEND_GRAM] = listOf(sendGramEdit(mutable(addressGram), ADDRESS_GRAM, titles))
    }
    val transferGram = sendGram.filter { !AccessFlags.STATIC.isSet(it.accessFlags) &&
        it.hasShape(listOf(MESSAGE_OBJECT, ARRAY_LIST, ARRAY_LIST, ARRAY_LIST), "V") }.unique("message menu with Send Gram")
    if (transferGram != null) {
        val edit = sendGramEdit(mutable(transferGram), TRANSFER_GRAM, titles)
        val body = edit.method.instructions()
        val skip = ControlFlow.of(edit.method).normal[edit.index].single { it != edit.index + 1 }
        shape((edit.index + 1 until skip).any { body[it].opcode == Opcode.INSTANCE_OF && body[it].reference() == GRAM_TRANSFER },
            "Gram transfer menu no longer offers Send Gram only on Gram transfers")
        hooks[CommerceTarget.TRANSFER_SEND_GRAM] = listOf(edit)
    }
    return CommercePlan(hooks, giftTabId, giftButtonIndex)
}

/**
 * Telegram adds Send a Gift to a profile's menu only while premiumPurchaseBlocked() reads false, on
 * the person path and on the channel path. The hook answers that check, so the menu comes out as an
 * account with blocked purchases gets it. The menu's later setSubItemShown calls find no item with
 * that tag and do nothing.
 */
internal fun profileGiftMenuEdits(method: MutableMethod): List<CommerceEdit> {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    return PROFILE_GIFT_ITEMS.map { label ->
        val at = body.indices.filter { body[it].reference() == label }.unique("$label in the profile menu")
            ?: throw PatchException("$PATCH: missing $label (before editing)")
        val check = (at - 1 downTo 0).firstOrNull { body[it].reference() == PROFILE_GIFT_GATE || body[it].reference() == PROFILE_GIFT_FIELD }
            ?: throw PatchException("$PATCH: no purchase check before $label (before editing)")
        val answer = profileGiftAnswer(body, check)
        val branch = (answer ?: check) + 1
        shape(answer != null && body.getOrNull(branch)?.opcode == Opcode.IF_NEZ &&
            body[branch].namedRegisters() == body[answer].namedRegisters().take(1), "$label has no purchase check branch")
        val skip = flow.normal[branch].single { it != branch + 1 }
        shape(at in branch + 1 until skip, "the purchase check does not skip $label")
        val blocked = body[branch].namedRegisters().single()
        CommerceEdit(method, branch, "invoke-static/range {v$blocked .. v$blocked}, $COMMERCE->profileGiftMenuBlocked(I)Z\nmove-result v$blocked")
    }
}

/**
 * Telegram 13.0 offers Send Gram from a profile's menu, the popup for a tapped TON address and a
 * Gram transfer's message menu, each only while the server's walletAvailable flag reads true. In
 * each of them the flag's branch adds Send Gram and nothing else, and its skip is where the menu
 * goes on for an account without Wallet. The hook takes the flag's answer just before the branch,
 * so a hidden item leaves the menu exactly as that account gets it. Receiving, viewing and
 * claiming Gram never pass through these branches.
 */
private fun sendGramEdit(method: MutableMethod, site: SendGramSite, titles: TitleCall): CommerceEdit {
    val where = site.where
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val reads = body.indices.filter { body[it].readsWalletAvailable() }
    val labels = body.indices.filter { body[it].reference() == SEND_GRAM }
    shape(reads.size == 1 && labels.size == 1, "$where no longer reads walletAvailable and Send Gram once")
    val gate = gateAfter(body, reads.single(), where)
    val skip = flow.normal[gate].singleOrNull { it != gate + 1 }
    shape(skip != null && skip > gate + 1 && flow.normal[gate].size == 2, "$where Wallet availability no longer skips forward")
    val branch = gate + 1 until skip!!
    shape(branch.all { at -> flow.normal[at].all { it in branch || it == skip } } &&
        body.indices.none { at -> at !in branch && at != gate && (flow.normal[at] + flow.exceptional[at]).any { it in branch } },
        "$where Send Gram has another way in or out")
    val label = labels.single()
    val read = titles.call(body, flow, label)
    shape(label in branch && read != null &&
        body.getOrNull(read + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT, "$where Send Gram has no title")
    val title = body[read!! + 1].namedRegisters().single()
    val add = (read + 2 until skip).firstOrNull { body[it].call() != null && title in body[it].namedRegisters() }
    shape(add != null && site.add(body[add].call()!!) && body[add].namedRegisters().getOrNull(site.title) == title &&
        (read + 2 until add).none { body[it].writes(title) }, "$where no longer adds Send Gram as an item")
    // Nothing else waits behind the flag: no other label, and nothing stored beyond the item.
    shape(branch.none { at -> at != label && body[at].reference()?.startsWith(STRINGS) == true } &&
        branch.none { body[it].opcode in STORES },
        "$where Wallet branch holds more than Send Gram")
    val available = body[gate].namedRegisters().single()
    shape(available <= 255, "$where Wallet answer is out of a result's reach")
    return CommerceEdit(method, gate,
        "invoke-static/range {v$available .. v$available}, $COMMERCE->${site.hook}(Z)Z\nmove-result v$available")
}

/**
 * Telegram 13.0's attach menu numbers its buttons each time the menu is built, and gives Wallet a
 * number only while the server's walletAvailable flag reads true. The binder puts the Wallet label
 * on whatever number that is. The hook takes the flag's answer just before its branch, so a hidden
 * button leaves the numbering exactly as an account without Wallet gets it, every other button
 * (Gallery and File included) still bound to its own number.
 */
private fun attachWalletEdits(binder: MutableMethod, methods: (Mention) -> List<Method>, mutable: (Method) -> MutableMethod): List<CommerceEdit> {
    val bound = binder.instructions()
    val label = bound.indices.filter { bound[it].reference() == WALLET_LABEL }.singleOrNull()
        ?: throw PatchException("$PATCH: attach menu labels more than one button Wallet (before editing)")
    val read = bound.getOrNull(label - 2)
    val position = binder.parameterRegisterNumber(1)
    val field = read?.reference()
    val number = read?.namedRegisters()?.firstOrNull()
    shape(read?.opcode == Opcode.IGET && field != null && field.startsWith("${binder.definingClass}->") && field.endsWith(":I") &&
        bound[label - 1].opcode == Opcode.IF_NE && number != null && number != position &&
        bound[label - 1].namedRegisters().sorted() == listOf(position, number).sorted(),
        "attach menu no longer labels Wallet by its own button number")
    try {
        binder.requireParameterIntact(PATCH, 1, listOf(label - 1))
    } catch (overwritten: PatchException) {
        shape(false, "attach menu button position is overwritten before Wallet's label")
    }
    // Only a class that mentions the field can read or write it.
    val touching = methods(Mention.reference(field!!))
    shape(touching.sumOf { method -> method.instructions().count { it.opcode == Opcode.IGET && it.reference() == field } } == 1,
        "attach menu Wallet number is read outside its binder")
    val writers = touching.filter { method -> method.instructions().any { it.opcode == Opcode.IPUT && it.reference() == field } }
    shape(writers.size == 1 && writers.single().origDefiningClass == binder.origDefiningClass &&
        writers.single().hasShape(emptyList(), "V"), "attach menu Wallet number has no single numbering pass")
    val rows = mutable(writers.single())
    val body = rows.instructions()
    val flow = ControlFlow.of(rows)
    val reads = body.indices.filter { body[it].readsWalletAvailable() }
    shape(reads.size == 1, "attach menu numbering no longer reads walletAvailable once")
    val gate = gateAfter(body, reads.single(), "attach menu")
    val skip = flow.normal[gate].singleOrNull { it != gate + 1 }
    shape(skip != null && skip > gate + 1 && flow.normal[gate].size == 2, "attach menu Wallet availability no longer skips forward")
    val block = gate + 1 until skip!!
    shape(block.all { at -> flow.normal[at].all { it in block || it == skip } } &&
        body.indices.none { it !in block && it != gate && flow.normal[it].any { target -> target in block } },
        "attach menu Wallet number has another way in or out")
    val writes = body.indices.filter { body[it].opcode == Opcode.IPUT && body[it].reference() == field }
    val reset = writes.firstOrNull()
    // The reset runs before anything branches, so every pass starts with Wallet unnumbered.
    shape(writes.size == 2 && writes.last() in block && reset != null && reset < gate &&
        constantBefore(body, reset, body[reset].namedRegisters().first()) == -1 &&
        (0 until reset).all { flow.normal[it] == listOf(it + 1) } &&
        body.indices.none { at -> flow.normal[at].any { it in 1..reset && it != at + 1 } },
        "attach menu no longer numbers Wallet only behind walletAvailable")
    val available = body[gate].namedRegisters().single()
    return listOf(CommerceEdit(rows, gate,
        "invoke-static/range {v$available .. v$available}, $COMMERCE->showAttachWallet(Z)Z\nmove-result v$available"))
}

/**
 * The chat list's menu adds Wallet while walletAvailable reads true and then skips the side menu
 * mini apps, which it only lists for accounts without Wallet. Answering "unavailable" there would
 * bring those back, so the hook instead jumps from the start of the Wallet entry to the point both
 * stock paths meet once their entries are in, leaving the menu as a Wallet account has it, minus
 * Wallet.
 */
private fun menuWalletEdit(method: MutableMethod, titles: TitleCall): CommerceEdit {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val reads = body.indices.filter { body[it].readsWalletAvailable() }
    val labels = body.indices.filter { body[it].reference() == WALLET_LABEL }
    shape(reads.size == 1 && labels.size == 1, "chat list menu no longer reads walletAvailable and Wallet once")
    val gate = gateAfter(body, reads.single(), "chat list menu")
    val available = body[gate].namedRegisters().single()
    val skip = flow.normal[gate].singleOrNull { it != gate + 1 }
    shape(skip != null && skip > gate + 1 && flow.normal[gate].size == 2, "chat list menu Wallet availability no longer skips forward")
    val label = labels.single()
    val read = titles.call(body, flow, label)
    shape(label in gate + 1 until skip!! && read != null &&
        body.getOrNull(read + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT, "chat list menu Wallet entry has no title")
    val title = body[read!! + 1].namedRegisters().single()
    val add = (read + 2 until skip).firstOrNull { body[it].opcode in setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE) }
        ?: throw PatchException("$PATCH: chat list menu no longer adds Wallet as an entry (before editing)")
    val call = body[add].call()
    shape(call != null && call.origReturnType == "V" && call.parameterTypes.map { it.toString() } == MENU_ADD &&
        body[add].namedRegisters().getOrNull(2) == title && (read + 2 until add).none { body[it].writes(title) },
        "chat list menu no longer adds Wallet as an entry")
    val saved = body.indexOfFirst { it.reference() == MENU_NEIGHBORS.last() }
    shape(saved in 0 until reads.single() && (saved until reads.single()).any { body[it].reference() == body[add].reference() },
        "chat list menu no longer adds Wallet with Saved Messages' add")
    val entry = gate + 1..add
    val exit = add + 1
    // One straight run from the branch to the add, and the instruction after it is where the menu
    // also arrives without Wallet, so the jump takes a path Telegram already takes.
    shape(entry.all { flow.normal[it] == listOf(it + 1) && flow.exceptional[it].isEmpty() } &&
        body.indices.none { at -> at != gate && at !in entry && flow.normal[at].any { it in entry } } &&
        exit < skip && body.indices.any { at -> at !in gate..add && exit in flow.normal[at] },
        "chat list menu Wallet entry has another way in or out")
    shape(available <= 255, "chat list menu Wallet answer is out of a branch's reach")
    return CommerceEdit(method, gate + 1,
        "invoke-static/range {v$available .. v$available}, $COMMERCE->showMenuWallet(Z)Z\n" +
            "move-result v$available\nif-eqz v$available, :$MENU_WALLET_LABEL",
        labels = listOf(ExternalLabel(MENU_WALLET_LABEL, method.getInstruction(exit))))
}

/** The if-eqz right after walletAvailable's read, which decides on its answer alone. */
private fun gateAfter(body: List<Instruction>, read: Int, where: String): Int =
    walletGate(body, read) ?: throw PatchException("$PATCH: $where Wallet availability no longer decides its branch at once (before editing)")

/**
 * walletAvailable, known by its owner and name: 13.2 merges ConfigBoolean into a class that other
 * source classes share, so the field's type no longer reads as ConfigBoolean.
 */
internal fun Instruction.readsWalletAvailable(): Boolean = field()?.let {
    it.origDefiningClass == WALLET_AVAILABLE.substringBefore("->") && it.origName == "walletAvailable"
} == true

/**
 * Whether [getter], called on a flag of the build's [flagType], is 13.2's get(): R8 merged
 * ConfigBoolean into a class other sources share, so get() is known by its body, the same handler,
 * cast and value the inlined sites read, and nothing else.
 */
private fun mergedConfigGet(getter: MethodReference, flagType: String): Boolean {
    if (getter.definingClass != flagType || getter.parameterTypes.isNotEmpty() || getter.returnType != "Z") return false
    val method = tgClassDefByOrNull(flagType)?.methods?.singleOrNull { it.name == getter.name && it.parameterTypes.isEmpty() && it.returnType == "Z" }
    val implementation = method?.implementation ?: return false
    val body = implementation.instructions.toList()
    val self = implementation.registerCount - 1
    val handler = body.getOrNull(0)?.field()
    return !AccessFlags.STATIC.isSet(method.accessFlags) && implementation.tryBlocks.isEmpty() &&
        body.map { it.opcode } == listOf(Opcode.IGET_OBJECT, Opcode.CHECK_CAST, Opcode.IGET_BOOLEAN, Opcode.RETURN) &&
        handler?.definingClass == flagType && handler.type == "Ljava/lang/Object;" && body[0].namedRegisters() == listOf(0, self) &&
        body[1].reference() == CONFIG_BOOLEAN_INTERNAL && body[1].namedRegisters() == listOf(0) &&
        body[2].reference() == CONFIG_BOOLEAN_VALUE && body[2].namedRegisters() == listOf(0, 0) && body[3].namedRegisters() == listOf(0)
}

/**
 * The if-eqz that decides on the walletAvailable value read at [read], with nothing else in
 * between: through ConfigBoolean.get() (13.2's merged one included) and its result, or, where 13.2
 * inlines get(), through the flag's handler cast to its Internal and that handler's value. Null for
 * any other shape.
 */
internal fun walletGate(body: List<Instruction>, read: Int): Int? {
    val flag = body[read].namedRegisters().firstOrNull()
    if (body[read].opcode != Opcode.IGET_OBJECT || !body[read].readsWalletAvailable() || flag == null) return null
    val called = read + 3
    val getter = body.getOrNull(read + 1)?.takeIf { it.opcode == Opcode.INVOKE_VIRTUAL }?.call()
    if ((body.getOrNull(read + 1)?.reference() == CONFIG_GET || (getter != null && mergedConfigGet(getter, body[read].field()!!.type))) &&
        body[read + 1].namedRegisters() == listOf(flag) &&
        body.getOrNull(read + 2)?.opcode == Opcode.MOVE_RESULT &&
        body.getOrNull(called)?.opcode == Opcode.IF_EQZ && body[called].namedRegisters() == body[read + 2].namedRegisters()
    ) return called
    val inlined = read + 4
    val handler = body.getOrNull(read + 1)
    val cast = body.getOrNull(read + 2)
    val value = body.getOrNull(read + 3)
    val answer = value?.namedRegisters()?.firstOrNull()
    return inlined.takeIf {
        handler?.opcode == Opcode.IGET_OBJECT && handler.namedRegisters() == listOf(flag, flag) &&
            handler.field()?.let { it.definingClass == body[read].field()!!.type && it.type == "Ljava/lang/Object;" } == true &&
            cast?.opcode == Opcode.CHECK_CAST && cast.namedRegisters() == listOf(flag) && cast.reference() == CONFIG_BOOLEAN_INTERNAL &&
            value?.opcode == Opcode.IGET_BOOLEAN && value.reference() == CONFIG_BOOLEAN_VALUE && value.namedRegisters().getOrNull(1) == flag &&
            body.getOrNull(inlined)?.opcode == Opcode.IF_EQZ && body[inlined].namedRegisters() == listOf(answer)
    }
}

/**
 * Where [body] reads the Wallet title's resource: each instruction that reads a WalletAttachMoney
 * load's register while that load is the only value it can hold. 13.1 loaded the resource inside
 * each Wallet branch; 13.2 loads it once ahead of both and reads it in each.
 */
internal fun walletLabelReads(body: List<Instruction>, flow: ControlFlow): List<Int> =
    body.indices.filter { body[it].reference() == WALLET_LABEL }.flatMap { load ->
        val register = body[load].namedRegisters().first()
        body.indices.filter { at -> at != load && register in body[at].namedRegisters() && flow.preservesValue(load, at, register) }
    }

private fun settingsEdits(method: MutableMethod, titles: TitleCall): List<CommerceEdit> {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val factories = mutableSetOf<String>()
    val destinations = mutableSetOf<Int>()
    val edits = SETTINGS_SALES.map { resource ->
        val at = body.indices.filter { body[it].reference() == resource }.unique("$resource Settings label")
            ?: throw PatchException("$PATCH: missing $resource Settings label (before editing)")
        val read = titles.call(body, flow, at)
        shape(read != null && body.getOrNull(read + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT,
            "$resource does not produce a row title")
        val title = body[read!! + 1].namedRegisters().single()
        val factory = (read + 2 until minOf(body.size, at + 64)).firstOrNull { index ->
            body[index].call()?.parameterTypes?.map { it.toString() } == SALES_FACTORY &&
                body[index].opcode in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
        } ?: throw PatchException("$PATCH: no $resource Settings row factory (before editing)")
        shape(body[factory].namedRegisters().getOrNull(4) == title &&
            (read + 2 until factory).none { body[it].writes(title) }, "$resource Settings title is not intact")
        factories += body[factory].reference()!!
        val row = body.getOrNull(factory + 1)
        val append = factory + 2
        shape(row != null && row.opcode == Opcode.MOVE_RESULT_OBJECT && body.getOrNull(append)?.reference() == APPEND &&
            body[append].namedRegisters().size == 2 && body[append].namedRegisters()[1] == row.namedRegisters().single() &&
            body.indices.filter { append in flow.normal[it] } == listOf(append - 1), "$resource has no distinct row append")
        destinations += body[append].namedRegisters()[0]
        appendEdit(method, append, "addSettingsRow")
    }
    shape(factories.size == 1 && destinations.size == 1 && edits.map { it.index }.distinct().size == SETTINGS_SALES.size,
        "Settings sales rows do not share one factory and destination")
    val rows = destinations.single()
    val alias = body.indices.filter { body[it].opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16) &&
        body[it].namedRegisters() == listOf(rows, method.parameterRegisterNumber(1)) }.unique("Settings destination parameter alias")
    shape(alias != null && body.indices.none { it != alias && body[it].writes(rows) }, "Settings destination is overwritten")
    return edits + walletEdits(method, factories.single(), rows)
}

/**
 * Telegram adds its Wallet row and the divider after it only while the server's walletAvailable
 * flag reads true. The hook takes that answer just before its branch, so a hidden row leaves the
 * list exactly as it is for accounts without Wallet. A build without the row gets no edit.
 */
private fun walletEdits(method: MutableMethod, factory: String, rows: Int): List<CommerceEdit> {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val labels = walletLabelReads(body, flow)
    val reads = body.indices.filter { body[it].readsWalletAvailable() }
    shape(labels.size == reads.size, "Wallet labels and availability reads no longer pair up")
    return reads.map { read ->
        val gate = walletGate(body, read)
            ?: throw PatchException("$PATCH: Wallet availability no longer decides its branch at once (before editing)")
        val available = body[gate].namedRegisters().single()
        val skip = flow.normal[gate].singleOrNull { it != gate + 1 }
        shape(skip != null && skip > gate + 1 && flow.normal[gate].size == 2, "Wallet availability no longer skips forward")
        val block = gate + 1 until skip!!
        val rejoin = walletRejoin(body, flow, block)
        shape(rejoin != null && block.all { at -> flow.normal[at].all { it in block || it == rejoin } } &&
            body.indices.none { it !in block && it != gate && flow.normal[it].any { target -> target in block } },
            "Wallet row has another way in or out")
        // The divider closes the block, ahead of the jump back when the block ends with one.
        val end = if (rejoin == skip) block.last else block.last - 1
        val label = labels.filter { it in block }.singleOrNull()
        val made = block.filter { body[it].reference() == factory }
        val appends = block.filter { body[it].reference() == APPEND }
        shape(label != null && made.size == 1 && made.single() > label, "Wallet branch no longer builds one Wallet row")
        val row = made.single()
        shape(constantBefore(body, row, body[row].namedRegisters().first()) == WALLET_ROW &&
            body.getOrNull(row + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT && appends.firstOrNull() == row + 2 &&
            body[row + 2].namedRegisters() == listOf(rows, body[row + 1].namedRegisters().single()),
            "Wallet branch no longer adds row $WALLET_ROW to the Settings list")
        shape(appends.size == 2 && appends.last() == end && body[end].namedRegisters().first() == rows,
            "Wallet branch no longer ends with the row's divider")
        CommerceEdit(method, gate,
            "invoke-static/range {v$available .. v$available}, $COMMERCE->showWalletRow(Z)Z\nmove-result v$available")
    }
}

/**
 * Where a Wallet [block] rejoins the builder: the skip right after it, where it falls through.
 * 13.2's R8 ends the first placement with a jump past constants the skipping path loads at its own
 * start, as the block already holds each of them in the same register; it lands just after them.
 * Null for any other way out.
 */
private fun walletRejoin(body: List<Instruction>, flow: ControlFlow, block: IntRange): Int? {
    val skip = block.last + 1
    val last = block.last
    if (body[last].opcode !in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) return skip
    val target = flow.normal[last].singleOrNull() ?: return null
    if (target == skip) return skip
    if (target < skip) return null
    val shared = (skip until target).all { at ->
        val load = body[at] as? NarrowLiteralInstruction
        val register = body[at].namedRegisters().firstOrNull()
        body[at].opcode in CONSTANTS && load != null && register != null && flow.normal[at] == listOf(at + 1) &&
            block.any { held ->
                body[held].opcode in CONSTANTS && body[held].namedRegisters().firstOrNull() == register &&
                    (body[held] as? NarrowLiteralInstruction)?.narrowLiteral == load.narrowLiteral &&
                    flow.preservesValue(held, last, register)
            }
    }
    return target.takeIf { shared }
}

private fun profileEdits(method: MutableMethod, gifts: Int, hasTab: String, clear: String, titles: TitleCall): List<CommerceEdit> {
    val body = method.instructions()
    val flow = ControlFlow.of(method)
    val resources = body.indices.filter { body[it].reference() == PROFILE_GIFTS }
    shape(resources.size == 2 && body.count { it.reference() == clear } == 1 &&
        body.count { it.reference() in listOf("Lorg/telegram/tgnet/TLRPC\$UserFull;->stargifts_count:I",
            "Lorg/telegram/tgnet/TLRPC\$ChatFull;->stargifts_count:I") } == 2,
        "profile Gifts lacks fresh, cached edit and stock rebuild paths")
    // The fresh candidate is `if-eqz visible`, `new Pair`, `Integer.valueOf(id)`. 13.1 loads the title
    // after it; 13.2's R8 hoists that load above the branch.
    val hoisted = body.getOrNull(resources.first() + 1)?.opcode == Opcode.IF_EQZ
    val allocation = if (hoisted) resources.first() + 2 else resources.first() - 3
    shape(body.getOrNull(allocation)?.opcode == Opcode.NEW_INSTANCE &&
        body[allocation].reference() == "Landroid/util/Pair;", "fresh Gifts candidate lacks its Pair allocation")
    val receiver = body[allocation].namedRegisters().single()
    val nextAllocation = (allocation + 1 until body.size).firstOrNull { body[it].writes(receiver) } ?: body.size
    val freshPair = (resources.first() + 1 until nextAllocation).filter { index ->
        body[index].reference() == PAIR && body[index].namedRegisters().first() == receiver
    }.unique("fresh Gifts candidate constructor")
        ?: throw PatchException("$PATCH: no fresh Gifts candidate constructor (before editing)")
    val label = resources.last()
    // The title may go through a copy on its way to the jump (12.10) or straight from the string
    // lookup (13.0).
    val read = titles.call(body, flow, label) ?: label
    val copied = body.getOrNull(read + 2)?.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
    val settled = if (copied) read + 3 else read + 2
    // 13.2 also sets up constants the shared code reads before it jumps.
    val jump = (settled until body.size).firstOrNull { body[it].opcode !in CONSTANTS } ?: settled
    shape(read != label &&
        body.getOrNull(read + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        body.getOrNull(jump)?.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32),
        "cached Gifts label no longer jumps to its shared Pair constructor")
    val cachedPair = flow.normal[jump].single()
    val title = body[read + 1].namedRegisters().single()
    shape(body[cachedPair].reference() == PAIR &&
        (!copied || title == body[read + 2].namedRegisters()[1]) &&
        (if (copied) body[read + 2].namedRegisters()[0] else title) == body[cachedPair].namedRegisters()[2] &&
        (settled until jump).none { body[it].writes(body[cachedPair].namedRegisters()[2]) },
        "cached Gifts label no longer supplies the Pair title")
    val appends = listOf(freshPair, cachedPair).map { pair ->
        val append = pair + 1
        shape(body.getOrNull(append)?.reference() == APPEND && body[append].namedRegisters().size == 2 &&
            body[append].namedRegisters()[1] == body[pair].namedRegisters().first(), "Gifts pair has no distinct candidate append")
        append
    }
    shape(appends.map { body[it].namedRegisters().first() }.distinct().size == 1, "Gifts candidates use different tab lists")
    val freshBox = allocation + 1
    shape(body.getOrNull(freshBox)?.reference() == BOX_INT &&
        constantBefore(body, freshBox, body[freshBox].namedRegisters().single()) == gifts &&
        body.getOrNull(freshBox + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        body[freshBox + 1].namedRegisters().single() == body[appends.first() - 1].namedRegisters()[1],
        "fresh Gifts candidate does not use the discovered tab ID")
    val cachedLabelBranch = (0 until resources.last()).filter { index ->
        body[index].opcode == Opcode.IF_EQ && resources.last() in flow.normal[index]
    }.unique("cached Gifts label branch") ?: throw PatchException("$PATCH: no cached Gifts label branch (before editing)")
    val labelOperands = body[cachedLabelBranch].namedRegisters()
    val identityOperand = labelOperands.filter { constantBefore(body, cachedLabelBranch, it) == gifts }
        .unique("cached Gifts label identity") ?: throw PatchException("$PATCH: no cached Gifts label identity (before editing)")
    val tabIndex = labelOperands.single { it != identityOperand }
    val identitySource = (0 until cachedLabelBranch).last { body[it].writes(identityOperand) }
    val first = body[appends.last() - 1].namedRegisters()[1]
    val cachedBox = (0 until cachedLabelBranch).lastOrNull { body[it].reference() == BOX_INT &&
        body[it].namedRegisters() == listOf(tabIndex) && body.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT &&
        body[it + 1].namedRegisters() == listOf(first) }
    val cachedReceiver = body[appends.last() - 1].namedRegisters().first()
    shape(cachedBox != null && first != tabIndex && cachedReceiver !in listOf(first, tabIndex) &&
        body.getOrNull(cachedBox - 1)?.opcode == Opcode.NEW_INSTANCE &&
        body[cachedBox - 1].reference() == "Landroid/util/Pair;" &&
        body[cachedBox - 1].namedRegisters() == listOf(cachedReceiver) &&
        flow.preservesValue(identitySource, cachedLabelBranch, identityOperand) &&
        flow.preservesValue(cachedBox, cachedLabelBranch, tabIndex) &&
        flow.preservesValue(cachedBox + 1, cachedPair, first) &&
        flow.preservesValue(cachedBox - 1, cachedPair, cachedReceiver),
        "cached Gifts label and Pair identity do not share the tab index")
    val cached = body.indices.filter { index -> body[index].reference() == hasTab &&
        body[index].namedRegisters().size == 2 && constantBefore(body, index, body[index].namedRegisters()[1]) == gifts
    }.unique("cached Gifts presence comparison") ?: throw PatchException("$PATCH: no cached Gifts presence comparison (before editing)")
    shape(body.getOrNull(cached + 1)?.opcode == Opcode.MOVE_RESULT && body.getOrNull(cached + 2)?.opcode == Opcode.IF_EQ,
        "cached Gifts presence no longer compares its stock visibility")
    val exists = body[cached + 1].namedRegisters().single()
    val operands = body[cached + 2].namedRegisters()
    shape(operands.size == 2 && operands.count { it == exists } == 1, "cached Gifts comparison aliases its operands")
    val visible = operands.single { it != exists }
    val fresh = allocation - 1
    shape(body.getOrNull(fresh)?.opcode == Opcode.IF_EQZ && ControlFlow.of(method).normal[fresh].any { it > appends.first() },
        "fresh Gifts candidate has no stock way past it")
    val freshVisible = body[fresh].namedRegisters().single()
    val copy = (cached + 3 until fresh).lastOrNull { body[it].opcode in MOVES &&
        body[it].namedRegisters() == listOf(freshVisible, visible) }
    shape(copy != null && (copy + 1 until fresh).none { body[it].writes(freshVisible) } && visible <= 255,
        "cached and fresh Gifts presence do not share one decision")
    return appends.map { appendEdit(method, it, "addProfileTab") } + CommerceEdit(method, cached + 2,
        "invoke-static/range {v$visible .. v$visible}, $COMMERCE->showGiftsTab(Z)Z\nmove-result v$visible")
}

private fun footerGiftIndex(classDef: ClassDef, method: Method): Int {
    val body = method.instructions()
    val label = body.indices.single { body[it].reference() == GIFT_BUTTON }
    val compare = body.getOrNull(label - 1)
    val operands = compare?.namedRegisters().orEmpty()
    val button = method.parameterRegisterNumber(0)
    shape(compare?.opcode == Opcode.IF_NE && operands.count { it == button } == 1, "footer Gift label has no distinct button branch")
    val gift = constantBefore(body, label - 1, operands.single { it != button })
        ?: throw PatchException("$PATCH: no footer Gift index (before editing)")
    shape(gift in 0..32767, "footer Gift index does not fit the extension fact")
    val init = classDef.methods.singleOrNull { it.origName == "<clinit>" }
        ?: throw PatchException("$PATCH: no footer icon table (before editing)")
    val icons = init.instructions()
    val icon = icons.indices.singleOrNull { icons[it].reference() == GIFT_ICON }
        ?: throw PatchException("$PATCH: no distinct footer Gift icon (before editing)")
    val array = (icon + 1 until icons.size).firstOrNull { icons[it].opcode == Opcode.FILLED_NEW_ARRAY }
        ?: throw PatchException("$PATCH: no footer icon array (before editing)")
    val iconRegister = icons[icon].namedRegisters().single()
    shape(icons[array].reference() == "[I" && icons[array].namedRegisters().getOrNull(gift) == iconRegister &&
        (icon + 1 until array).none { icons[it].writes(iconRegister) } &&
        icons.getOrNull(array + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT && icons.getOrNull(array + 2)?.opcode == Opcode.SPUT_OBJECT,
        "footer Gift index does not match its icon array slot")
    val table = icons[array + 2].reference()
    shape(body.indices.any { index -> body[index].reference() == table && body[index].opcode == Opcode.SGET_OBJECT &&
        body.getOrNull(index + 1)?.opcode == Opcode.AGET && body[index + 1].namedRegisters().getOrNull(2) == button },
        "footer Gift branch does not read its discovered icon table")
    return gift
}

private fun appendEdit(method: MutableMethod, index: Int, hook: String): CommerceEdit {
    val registers = method.instructions()[index].namedRegisters()
    shape(registers.size == 2 && registers.all { it <= 15 }, "$hook append operands cannot be passed intact")
    return CommerceEdit(method, index,
        "invoke-static {v${registers[0]}, v${registers[1]}}, $COMMERCE->$hook(Ljava/util/ArrayList;Ljava/lang/Object;)Z", true)
}

/**
 * The constant [register] last got before [before], in code order, through plain copies: from 13.0
 * Telegram keeps the Gifts tab ID in one register and copies it where it's compared.
 */
private fun constantBefore(body: List<Instruction>, before: Int, register: Int, copies: Int = 4): Int? {
    val write = (0 until before).lastOrNull { body[it].writes(register) } ?: return null
    return when (body[write].opcode) {
        in CONSTANTS -> (body[write] as? NarrowLiteralInstruction)?.narrowLiteral
        in MOVES -> if (copies == 0) null else constantBefore(body, write, body[write].namedRegisters()[1], copies - 1)
        else -> null
    }
}

/**
 * How the build reads an item's title from its string resource. Telegram calls
 * LocaleController.getString(int), a wrapper that passes the id on with a null beside it, and 13.2's
 * R8 inlined that wrapper into its callers, which now make the forwarded call themselves.
 */
private class TitleCall(private val forward: String?, private val id: Int) {
    /**
     * The index of the call that reads the text of the resource loaded at [load]: the next
     * instruction, or the one after when the null the forwarded call takes is set up in between.
     */
    fun call(body: List<Instruction>, flow: ControlFlow, load: Int): Int? {
        if (body.getOrNull(load + 1)?.reference() == STRING) return load + 1
        val resource = body.getOrNull(load)?.namedRegisters()?.firstOrNull() ?: return null
        return (load + 1..load + 2).firstOrNull { at ->
            val made = body.getOrNull(at) ?: return@firstOrNull false
            val operands = made.namedRegisters()
            forward != null && made.opcode == Opcode.INVOKE_STATIC && made.call()?.toString() == forward &&
                operands.size == 2 && operands[id] == resource &&
                (load + 1 until at).all { body[it].opcode in CONSTANTS && body[it].writes(operands[1 - id]) } &&
                flow.onlyZeroReaches(at, operands[1 - id])
        }
    }
}

/** What getString(int) forwards to, when it's the plain wrapper; without one only getString(int) itself counts. */
private fun BytecodePatchContext.titleCall(): TitleCall {
    val wrapper = tgClassDefByOrNull(LOCALE)?.methods?.filter { it.origName == "getString" &&
        AccessFlags.STATIC.isSet(it.accessFlags) && it.origParameterTypes == listOf("I") && it.origReturnType == "Ljava/lang/String;"
    }?.singleOrNull() ?: return TitleCall(null, 0)
    val body = wrapper.instructions()
    val absent = body.firstOrNull()?.namedRegisters()?.singleOrNull()
    val operands = body.getOrNull(1)?.namedRegisters().orEmpty()
    val id = wrapper.parameterRegisterNumber(0)
    val plain = body.size == 4 && body[0].opcode == Opcode.CONST_4 && (body[0] as NarrowLiteralInstruction).narrowLiteral == 0 &&
        body[1].opcode == Opcode.INVOKE_STATIC && operands.size == 2 && operands.toSet() == setOf(absent, id) && absent != id &&
        body[2].opcode == Opcode.MOVE_RESULT_OBJECT && body[3].opcode == Opcode.RETURN_OBJECT &&
        body[2].namedRegisters() == body[3].namedRegisters()
    return if (plain) TitleCall(body[1].call().toString(), operands.indexOf(id)) else TitleCall(null, 0)
}

/** Every value [register] can hold at [use] is the constant 0, a null for an object. */
private fun ControlFlow.onlyZeroReaches(use: Int, register: Int): Boolean {
    val predecessors = Array(instructions.size) { mutableListOf<Pair<Int, Boolean>>() }
    instructions.indices.forEach { at ->
        normal[at].forEach { predecessors[it] += at to false }
        exceptional[at].forEach { predecessors[it] += at to true }
    }
    if (predecessors[use].isEmpty()) return false
    val seen = mutableSetOf<Pair<Int, Boolean>>()
    val pending = ArrayDeque(predecessors[use])
    while (pending.isNotEmpty()) {
        val step = pending.removeFirst()
        if (!seen.add(step)) continue
        val (at, thrown) = step
        val instruction = instructions[at]
        if (instruction.writes(register)) {
            if (instruction.opcode !in CONSTANTS || (instruction as? NarrowLiteralInstruction)?.narrowLiteral != 0) return false
            // An instruction that throws never writes, so its handler also sees what came before.
            if (!thrown) continue
        }
        // Reaching the entry means the value comes from the caller or was never set.
        if (at == 0) return false
        pending.addAll(predecessors[at])
    }
    return true
}

/** Bound provenance by its source definition, including handlers and paths that jump backward. */
private fun ControlFlow.preservesValue(source: Int, use: Int, register: Int): Boolean {
    val pending = ArrayDeque<Int>()
    val bypass = mutableSetOf<Int>()
    pending += 0
    pending.addAll(exceptional[source])
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == source || !bypass.add(at)) continue
        if (at == use) return false
        pending.addAll(normal[at] + exceptional[at])
    }

    val predecessors = Array(instructions.size) { mutableListOf<Int>() }
    instructions.indices.forEach { at ->
        (normal[at] + exceptional[at]).forEach { predecessors[it] += at }
    }
    val reachesUse = mutableSetOf<Int>()
    pending += use
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == source || !reachesUse.add(at)) continue
        pending.addAll(predecessors[at])
    }
    val afterSource = mutableSetOf<Int>()
    pending.addAll(normal[source])
    while (pending.isNotEmpty()) {
        val at = pending.removeFirst()
        if (at == source || !afterSource.add(at)) continue
        if (at in reachesUse && instructions[at].writes(register)) return false
        pending.addAll(normal[at] + exceptional[at])
    }
    return use in afterSource
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val destination = namedRegisters().firstOrNull() ?: return false
    return destination == register || opcode.setsWideRegister() && destination + 1 == register
}
private fun Instruction.reference() = origRef()
private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference
private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
private fun MethodReference.hasShape(parameters: List<String>, result: String) =
    origParameterTypes == parameters && origReturnType == result
private fun MethodReference.sameSignature(other: MethodReference) = name == other.name &&
    returnType == other.returnType && parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }
private fun <T> List<T>.unique(what: String): T? {
    shape(size <= 1, "ambiguous $what ($size candidates)")
    return singleOrNull()
}
private fun shape(ok: Boolean, what: String) {
    if (!ok) throw PatchException("$PATCH: $what (before editing)")
}
