package io.github.sabopura.morphe.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.callRegisters
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.insertBeforeKeepingLabels
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import java.util.logging.Logger

private const val RECAPS = "Lio/github/sabopura/morphe/extension/twitch/app/Recaps;"
private const val FEED_ITEM = "Ltv/twitch/android/shared/viewer/pub/FeedItem"
private const val RECAPS_ITEM = "$FEED_ITEM\$RecapsItem;"
private const val RECAPS_SHELF_ITEM = "$FEED_ITEM\$StreamRecapsShelfItem;"
private const val FEED_RECAP_ENTRY = "OnFeedRecap(id="
private const val CHANNEL_SHELF_KEY = "streamRecapsShelfKey"
private const val FEED_SHELF_SWITCH = "Android-Stream-Recaps-Native-Feed-Shelf"

private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.string() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

private fun Instruction.call() = (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Instruction.builds(type: String) =
    opcode == Opcode.NEW_INSTANCE && ((this as ReferenceInstruction).reference as TypeReference).type == type

/** The first call after instruction [index], with the registers of its arguments. */
private fun List<Instruction>.callAfter(index: Int): Triple<Int, MethodReference, List<Int>>? =
    (index + 1 until size).firstOrNull { this[it].call() != null }?.let { Triple(it, this[it].call()!!, this[it].callRegisters()) }

/** Register [register] at instruction [index]; [type] where the hook has to restore it. */
internal data class Slot(val index: Int, val register: Int, val type: String = "")

/**
 * In the feed parser, the null test that decides whether a recap item is built: the response's
 * recap entry is read, tested, and the item built right after.
 */
internal fun recapEntryTest(parser: Method, isRecapEntry: (String) -> Boolean): Slot {
    val code = parser.code()
    val built = code.indices.filter { code[it].builds(RECAPS_ITEM) }.uniqueContract("Hide recaps: recap item built by the feed parser")
    val read = code.getOrNull(built - 2)
    val test = code.getOrNull(built - 1)
    val entry = ((read as? ReferenceInstruction)?.reference as? FieldReference)?.type
    if (read?.opcode != Opcode.IGET_OBJECT || test?.opcode != Opcode.IF_EQZ || entry == null || !isRecapEntry(entry) ||
        (read as OneRegisterInstruction).registerA != (test as OneRegisterInstruction).registerA
    ) throw PatchException("Hide recaps: the feed parser no longer tests the recap entry right before building its item")
    return Slot(built - 1, test.registerA, entry)
}

/** On a channel page, the items of the recap shelf section: the call after the section's key takes (key, items, …). */
internal fun channelShelfItems(page: Method): Slot {
    val code = page.code()
    val key = code.indices.filter { code[it].string() == CHANNEL_SHELF_KEY }.uniqueContract("Hide recaps: channel shelf key")
    val (index, call, registers) = code.callAfter(key)
        ?: throw PatchException("Hide recaps: nothing is called with the channel shelf key")
    val parameters = call.parameterTypes.map { it.toString() }
    // A call on an object passes it in the first register; R8 also emits static forms that take it as a parameter.
    val receiver = registers.size - parameters.size
    val keyAt = parameters.indexOf("Ljava/lang/String;")
    if (keyAt < 0 || parameters.getOrNull(keyAt + 1) != "Ljava/util/List;" ||
        registers.getOrNull(keyAt + receiver) != (code[key] as OneRegisterInstruction).registerA
    ) throw PatchException("Hide recaps: the channel shelf section is no longer added as (key, items) right after its key")
    return Slot(index, registers[keyAt + 1 + receiver])
}

/**
 * In the static initializer that defines Twitch's switch [name]: the constant with its name, handed
 * to a constructor as (name, default, …) with the default off. An unknown name only keeps the
 * switch off while off is its default.
 */
internal fun switchName(initializer: Method, name: String): Slot {
    val code = initializer.code()
    val constant = code.indices.filter { code[it].string() == name }.uniqueContract("Hide recaps: name of $name")
    val register = (code[constant] as OneRegisterInstruction).registerA
    val (index, call, registers) = code.callAfter(constant) ?: throw PatchException("Hide recaps: $name is not handed to a constructor")
    if (call.name != "<init>" || call.parameterTypes.take(2).map { it.toString() } != listOf("Ljava/lang/String;", "Z") ||
        registers.getOrNull(1) != register
    ) throw PatchException("Hide recaps: $name is no longer defined as (name, default, …)")
    val default = (0 until index).lastOrNull {
        code[it].opcode.setsRegister() && (code[it] as? OneRegisterInstruction)?.registerA == registers[2]
    }?.let { code[it] as? NarrowLiteralInstruction }
    if (default?.narrowLiteral != 0) throw PatchException("Hide recaps: $name is no longer off by default")
    return Slot(constant, register)
}

/** Recap cards of the native feed, on every supported version. */
private fun BytecodePatchContext.hideFeedRecaps(): String {
    val entries = classDefByStrings(FEED_RECAP_ENTRY).map { it.type }.toSet()
    fun parses(method: Method) = method.definingClass != RECAPS_ITEM && method.name != "createFromParcel" &&
        method.implementation?.instructions?.any { it.builds(RECAPS_ITEM) } == true
    val owner = classesMatching { type -> type.methods.any(::parses) }.uniqueContract("Hide recaps: feed parser class")
    val parser = mutableClassDefBy(owner).methods.filter(::parses).uniqueContract("Hide recaps: feed parser")
    val entry = recapEntryTest(parser, entries::contains)
    parser.insertBeforeKeepingLabels(entry.index, """
        invoke-static/range {v${entry.register} .. v${entry.register}}, $RECAPS->feedEntry(Ljava/lang/Object;)Ljava/lang/Object;
        move-result-object v${entry.register}
        check-cast v${entry.register}, ${entry.type}
    """)
    return "feed parser ${owner.type}->${parser.name}"
}

private fun BytecodePatchContext.hideChannelShelf(): String {
    val owner = classesWithStrings(CHANNEL_SHELF_KEY).uniqueContract("Hide recaps: channel page class")
    val page = mutableClassDefBy(owner).methods.filter { method -> method.code().any { it.string() == CHANNEL_SHELF_KEY } }
        .uniqueContract("Hide recaps: channel page list")
    val items = channelShelfItems(page)
    page.insertBeforeKeepingLabels(items.index, """
        invoke-static/range {v${items.register} .. v${items.register}}, $RECAPS->channelShelf(Ljava/util/List;)Ljava/util/List;
        move-result-object v${items.register}
    """)
    return "channel page ${owner.type}->${page.name}"
}

/**
 * The native feed's recap shelf is one switch read in three places, which also decides whether the
 * stories shelf shows. Twitch's switch for viewers is not touched: the React Native home loads the
 * recap it opens through that one.
 */
private fun BytecodePatchContext.keepFeedShelfOff(): String {
    val switch = classesWithStrings(FEED_SHELF_SWITCH).uniqueContract("Hide recaps: feed shelf switch")
    val initializer = mutableClassDefBy(switch).methods.filter { it.name == "<clinit>" }
        .uniqueContract("Hide recaps: feed shelf switch initializer")
    val name = switchName(initializer, FEED_SHELF_SWITCH)
    initializer.addInstructions(name.index + 1, """
        invoke-static/range {v${name.register} .. v${name.register}}, $RECAPS->feedShelfSwitch(Ljava/lang/String;)Ljava/lang/String;
        move-result-object v${name.register}
    """)
    return "feed shelf switch ${switch.type}"
}

/**
 * Hooks the places where Twitch's native screens get their stream recaps. Twitch 30.7.2 has only
 * the feed's recap cards; the two shelves came later, with the shelf item this checks for.
 */
internal val hideRecapsHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val hooked = mutableListOf(hideFeedRecaps())
        if (classDefByOrNull(RECAPS_SHELF_ITEM) != null) {
            hooked += hideChannelShelf()
            hooked += keepFeedShelfOff()
        }
        Logger.getLogger("SabopuraTwitch.HideRecaps").info("Hide recaps: ${hooked.joinToString("; ")}")
    }
}
