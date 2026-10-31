/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.commerce

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.refusedByVerifier
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val EMOJI_STATUS = "$EXTENSION_PACKAGE/misc/EmojiStatus;"
internal const val EMOJI_HIDE = "$EMOJI_STATUS->hide()Z"
internal const val EMOJI_USERS = "Lorg/telegram/messenger/UserObject;"
internal const val EMOJI_DIALOGS = "Lorg/telegram/messenger/DialogObject;"
private const val EMOJI_MESSAGES = "Lorg/telegram/messenger/MessageObject;"
internal const val EMOJI_STATUS_TYPE = "Lorg/telegram/tgnet/TLRPC\$EmojiStatus;"
internal const val EMOJI_GETTER = "getEmojiStatusDocumentId"
/** Telegram's own getters, kept whole under these names for the wrappers and the editor to ask. */
internal const val STOCK_USER_STATUS = "hushStockEmojiStatus"
internal const val STOCK_DIALOG_STATUS = "hushStockEmojiStatusId"
internal const val DIALOG_STATUS_ID = "$EMOJI_DIALOGS->$EMOJI_GETTER($EMOJI_STATUS_TYPE)J"
internal const val STOCK_DIALOG_STATUS_ID = "$EMOJI_DIALOGS->$STOCK_DIALOG_STATUS($EMOJI_STATUS_TYPE)J"
internal const val STATUSES_EQUAL = "$EMOJI_DIALOGS->emojiStatusesEqual($EMOJI_STATUS_TYPE$EMOJI_STATUS_TYPE)Z"
private const val ADMIN_LOG_EVENT = "Lorg/telegram/tgnet/TLRPC\$TL_channelAdminLogEvent;"

/** No status when the switch is on, Telegram's answer otherwise. The user getter answers a boxed id. */
private val USER_WRAPPER = """
    invoke-static {}, $EMOJI_HIDE
    move-result v0
    if-eqz v0, :stock
    const/4 v0, 0x0
    return-object v0
    :stock
    invoke-static {p0}, $EMOJI_USERS->$STOCK_USER_STATUS($EMOJI_STATUS_TYPE)Ljava/lang/Long;
    move-result-object v0
    return-object v0
""".trimIndent()

/** The same for a chat's or a person's status read as a plain id, where 0 means none. */
private val DIALOG_WRAPPER = """
    invoke-static {}, $EMOJI_HIDE
    move-result v0
    if-eqz v0, :stock
    const-wide/16 v0, 0x0
    return-wide v0
    :stock
    invoke-static {p0}, $STOCK_DIALOG_STATUS_ID
    move-result-wide v0
    return-wide v0
""".trimIndent()

/** A getter ([getter], on [owner]) and the two methods that take its place. */
internal class EmojiStatusSwap(
    val owner: MutableClass,
    val getter: MutableMethod,
    val stock: MutableMethod,
    val wrapper: MutableMethod,
)

/**
 * The two getters' swaps and the methods that keep asking Telegram's own chat getter ([keepers]),
 * or [missing], why this build can't have the switch. Everything is found and checked before
 * [apply], so nothing in the app changes until then.
 */
internal class EmojiStatusPlan(
    private val swaps: List<EmojiStatusSwap>,
    private val keepers: List<MutableMethod>,
    val missing: String?,
) {
    fun apply() {
        if (missing != null) return
        // Read again here: an earlier edit in the same method moves indexes, never the calls.
        keepers.forEach { method -> method.statusReads().forEach { (index, call) -> method.replaceInstruction(index, call) } }
        swaps.forEach { swap ->
            swap.owner.methods.remove(swap.getter)
            swap.owner.methods.add(swap.stock)
            swap.owner.methods.add(swap.wrapper)
        }
    }
}

/**
 * Every name's emoji status comes from one of two getters: UserObject's boxed id for a person and
 * DialogObject's plain id for a chat or a person. Both are wrapped. Three readers must keep the real
 * status: the check that tells the channel appearance editor whether a status changed (with both
 * sides hidden every pick reads as no change and the save leaves it out), the editor's own reads of
 * the channel's current status, and the admin log's line for a status change.
 */
internal fun BytecodePatchContext.resolveEmojiStatus(): EmojiStatusPlan {
    controlHook(EMOJI_STATUS, "hide", emptyList(), "Z")
    requireStatusMethod("commerceEmojiStatus")
    fun missing(why: String) = EmojiStatusPlan(emptyList(), emptyList(), why)

    val users = mutableClassDefByOrNull(EMOJI_USERS) ?: return missing("the app has no user helper to ask for emoji statuses")
    val dialogs = mutableClassDefByOrNull(EMOJI_DIALOGS) ?: return missing("the app has no chat helper to ask for emoji statuses")
    val userGetter = users.statusGetter("Ljava/lang/Long;") ?: return missing("people no longer read their emoji status in one place")
    val dialogGetter = dialogs.statusGetter("J") ?: return missing("chats no longer read their emoji status in one place")
    if (users.methods.any { it.name == STOCK_USER_STATUS } || dialogs.methods.any { it.name == STOCK_DIALOG_STATUS }) {
        return missing("emoji statuses are already wrapped")
    }
    val equal = dialogs.methods.singleOrNull { method ->
        method.name == "emojiStatusesEqual" && method.returnType == "Z" && AccessFlags.STATIC.isSet(method.accessFlags) &&
            method.parameterTypes.map { it.toString() } == listOf(EMOJI_STATUS_TYPE, EMOJI_STATUS_TYPE)
    } ?: return missing("the check for a changed emoji status is gone")
    if (equal.statusReads().isEmpty()) return missing("the check for a changed emoji status no longer reads the status")
    val editors = classDefsMentioning(Mention.reference(STATUSES_EQUAL)).filter { classDef ->
        classDef.type != EMOJI_DIALOGS && classDef.methods.any { method -> method.controlBody().any { it.controlRef() == STATUSES_EQUAL } }
    }
    if (editors.isEmpty()) return missing("no screen asks whether an emoji status changed anymore")
    val keepers = mutableListOf<MutableMethod>(equal)
    editors.filter { classDef -> classDef.methods.any { it.statusReads().isNotEmpty() } }.forEach { classDef ->
        keepers += mutableClassDefBy(classDef).methods.filter { it.statusReads().isNotEmpty() }
    }
    mutableClassDefByOrNull(EMOJI_MESSAGES)?.methods?.filter { method ->
        method.name == "<init>" && method.parameterTypes.any { it.toString() == ADMIN_LOG_EVENT } && method.statusReads().isNotEmpty()
    }?.let { keepers += it }

    val swaps = listOf(
        swap(users, userGetter, STOCK_USER_STATUS, AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, 2, USER_WRAPPER),
        swap(dialogs, dialogGetter, STOCK_DIALOG_STATUS, AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, 3, DIALOG_WRAPPER),
    )
    return EmojiStatusPlan(swaps, keepers, null)
}

private fun MutableClass.statusGetter(result: String): MutableMethod? = methods.singleOrNull { method ->
    method.name == EMOJI_GETTER && method.returnType == result && method.parameterTypes.map { it.toString() } == listOf(EMOJI_STATUS_TYPE)
}?.takeIf { AccessFlags.STATIC.isSet(it.accessFlags) && !AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.implementation != null }

private fun BytecodePatchContext.swap(
    owner: MutableClass,
    getter: MutableMethod,
    stockName: String,
    stockAccess: Int,
    registers: Int,
    smali: String,
): EmojiStatusSwap {
    val stock = MutableMethod(ImmutableMethod(owner.type, stockName, getter.parameters, getter.returnType, stockAccess,
        null, null, getter.implementation))
    val wrapper = ImmutableMethod(owner.type, getter.name, getter.parameters, getter.returnType, getter.accessFlags,
        getter.annotations, getter.hiddenApiRestrictions, MutableMethodImplementation(registers))
        .toMutable().apply { addInstructionsWithLabels(0, smali) }
    val refusals = refusedByVerifier(wrapper, { classDefByOrNull(it)?.superclass },
        { classDefByOrNull(it)?.let { found -> AccessFlags.INTERFACE.isSet(found.accessFlags) } })
    if (refusals.isNotEmpty()) throw PatchException("$getter would fail Android's verifier: ${refusals.joinToString("; ")}")
    return EmojiStatusSwap(owner, getter, stock, wrapper)
}

/** Each call to the chat getter in this method, with the same call pointed at the kept original. */
private fun Method.statusReads(): List<Pair<Int, String>> = controlBody().mapIndexedNotNull { index, instruction ->
    if (instruction.controlRef() != DIALOG_STATUS_ID) return@mapIndexedNotNull null
    when (instruction.opcode) {
        Opcode.INVOKE_STATIC -> index to "invoke-static {v${(instruction as FiveRegisterInstruction).registerC}}, $STOCK_DIALOG_STATUS_ID"
        Opcode.INVOKE_STATIC_RANGE -> (instruction as RegisterRangeInstruction).startRegister.let { register ->
            index to "invoke-static/range {v$register .. v$register}, $STOCK_DIALOG_STATUS_ID"
        }
        else -> null
    }
}
