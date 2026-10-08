/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.chats

import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Where the clean-up switches of Facebook's own Chats hook, on 577, 580 and 581. Chats is
 * `messaginginblue`'s InboxActivity, the same list the Get Messenger card sits in (see
 * MessengerCardAnchors.kt).
 *
 * The row of tiles above the chats, friends' notes and who's active now, lives in one immutable
 * state object that Chats rebuilds on every result: a note result, an active-now result, a story
 * result. Its constructor takes the builder, null-checks the builder's tile list with the Kotlin
 * parameter name `activeNowTiles` (kept in all three builds, because the check carries it as a
 * literal) and stores the list. The component that draws the row and the section builder both read
 * that field, so the patch hands the constructor an empty list while the switch is on and nothing
 * downstream has a tile to draw. That empties the list the row is built from: friends' notes, who's
 * active now and, if it sits in the same list, your own "Your note" tile. Whether the row then
 * leaves with no gap is a phone check. The state class and its builder are Redex names (`E7k` and
 * `E7j` on 581, `EBq` and `EBp` on 580, `E4x` and `E4w` on 577); only the literal and the
 * constructor's shape find them.
 *
 * Chats also builds a group of top banners, each its own plugin answering a show question. Two of
 * them are promotions: the one asking you to turn on notifications (its builder tags the banner
 * `mib-notification-push-upsell-banner`) and the progressive diode card (`inbox_progressive_diode_top_view`).
 * Each tag is loaded by one builder in one plugin class, which also carries the show question the
 * Get Messenger card hook uses. The patch has each of them answer no while the switch is on, and
 * the list takes the next banner that says yes, as it does without them.
 *
 * Not hooked, and why: Messenger's inbox ad filter and quick-promotion kill switches are literals
 * that don't exist in Facebook's dex, so there is no inbox ad or quick-promotion plugin to anchor,
 * and no literal that all three builds keep ties Meta AI's chat list entry or the AI sticker tab
 * to one method.
 */
internal const val CHAT_LIST_PATCH = "Clean up Facebook's chat list"

/** The Kotlin parameter name the tile state's constructor checks its list against. */
internal const val NOTES_TILES = "activeNowTiles"

/** The tags the two promotion banners' builders load. */
internal const val PUSH_UPSELL_TAG = "mib-notification-push-upsell-banner"
internal const val DIODE_TAG = "inbox_progressive_diode_top_view"
internal val PROMOTION_TAGS = listOf(PUSH_UPSELL_TAG, DIODE_TAG)

internal const val IMMUTABLE_LIST_TYPE = "Lcom/google/common/collect/ImmutableList;"

/** Where the tile list is stored: the constructor, the iput-object's index and the register holding the list. */
internal class NotesTrayStore(val method: Method, val store: Int, val list: Int)

/**
 * The tile state's constructor, when [method] is it: a constructor of one parameter that loads
 * `activeNowTiles`, passes a register and that string to a call, and then stores that register
 * into an ImmutableList field of its own class. Null for any other method.
 */
internal fun notesTrayStore(owner: ClassDef, method: Method): NotesTrayStore? {
    if (method.name != "<init>" || method.parameterTypes.size != 1 || !holdsString(method, NOTES_TILES)) return null
    if (AccessFlags.STATIC.isSet(method.accessFlags)) return null
    val code = method.implementation?.instructions?.toList() ?: return null
    val load = code.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == NOTES_TILES
    }
    if (load < 0) return null
    val text = (code[load] as OneRegisterInstruction).registerA
    val check = (load + 1 until code.size).firstOrNull { at ->
        val call = code[at] as? FiveRegisterInstruction
        call != null && call.opcode == Opcode.INVOKE_STATIC && call.registerCount == 2 && call.registerD == text
    } ?: return null
    val list = (code[check] as FiveRegisterInstruction).registerC
    val store = (check + 1 until code.size).firstOrNull { at ->
        val field = (code[at] as? ReferenceInstruction)?.reference as? FieldReference
        code[at].opcode == Opcode.IPUT_OBJECT && field != null && field.definingClass == owner.type &&
            field.type == IMMUTABLE_LIST_TYPE && (code[at] as OneRegisterInstruction).registerA == list
    } ?: return null
    return NotesTrayStore(method, store, list)
}

/** The tile state constructor of [owner], or null when it isn't the state class. */
internal fun notesTrayOf(owner: ClassDef): NotesTrayStore? =
    owner.methods.mapNotNull { notesTrayStore(owner, it) }.singleOrNull()

private fun Method.isInstanceWithBody(): Boolean =
    implementation != null && !AccessFlags.STATIC.isSet(accessFlags) && !AccessFlags.ABSTRACT.isSet(accessFlags)

/** A banner plugin's builder: an instance method taking the list's `ThreadListParams` that loads [tag]. */
internal fun buildsBanner(method: Method, tag: String): Boolean =
    method.isInstanceWithBody() && method.returnType.startsWith("L") &&
        THREAD_LIST_PARAMS in method.parameterTypes.map { it.toString() } && holdsString(method, tag)

/**
 * The show question of the plugin that builds the banner tagged [tag], when [owner] is that
 * plugin: one builder loading the tag and one show question. Null for any other class.
 */
internal fun bannerQuestion(owner: ClassDef, tag: String): Method? {
    if (owner.methods.count { buildsBanner(it, tag) } != 1) return null
    return owner.methods.filter(::isShowQuestion).singleOrNull()
}
