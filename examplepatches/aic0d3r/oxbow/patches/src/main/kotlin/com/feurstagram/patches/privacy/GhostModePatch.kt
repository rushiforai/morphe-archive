package com.feurstagram.patches.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.feurstagram.patches.shared.CONFIG_CLASS
import com.feurstagram.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import com.feurstagram.patches.shared.Constants.EXTENSION
import com.feurstagram.patches.shared.branchesToEntry
import com.feurstagram.patches.shared.loadsString
import com.feurstagram.patches.shared.holdReceipt
import com.feurstagram.patches.shared.rememberStringsIf
import com.feurstagram.patches.shared.returnEarlyIf
import com.feurstagram.patches.shared.returnTrueIf

// Story views. The pending-seen state class builds the media/seen request...
internal object PendingStorySeenStateFingerprint : Fingerprint(
    strings = listOf("media/seen/?reel=%s&live_vod=0"),
)

// ...and its store sends it, in the one void method taking that state.
internal object PendingStorySeenStoreFingerprint : Fingerprint(
    strings = listOf("PendingReelSeenStateStore.deserializeFromDisk"),
)

// What was viewed and when, serialized into the reels_tray request body.
internal object StoriesViewInfoFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/Map;"),
    strings = listOf("reel_media_owner_id", "reel_media_creation_seen_at"),
)

// DM read receipts: the one sender of a chat's seen receipt, the only method that turns one into
// a request. Its second parameter is the queued task's callback.
internal object DmThreadSeenFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("IGDirectItemSeenMutation", "xig_direct_item_seen"),
    custom = { method, _ ->
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.size == 3
    },
)

// Where Instagram queues that receipt: the chat key and the message id it would report, which is
// the only place Ghost mode learns what you read without asking the server.
internal object DmThreadSeenQueueFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("mark_thread_seen-"),
    custom = { method, _ -> AccessFlags.STATIC.isSet(method.accessFlags) },
)

private const val USER_SESSION = "Lcom/instagram/common/session/UserSession;"
private const val TEXT = "Ljava/lang/String;"

/**
 * The chat summary's answer whether a chat shows unread: it asks itself at least one no-argument
 * boolean (Mark as unread; 453 asked three, 454 inlined two into field reads), then whether the
 * account has seen the chat's newest message, a three-String check on itself. That shape is unique
 * to this answer, and unlike its obfuscated name it survives version bumps.
 */
internal object ChatUnreadAnswerFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(USER_SESSION),
    custom = { method, _ -> method.answersWhetherUnread() },
)

private fun MethodReference.isSeenCheck() =
    returnType == "Z" && parameterTypes.map(CharSequence::toString) == listOf(TEXT, TEXT, TEXT)

private fun Method.answersWhetherUnread(): Boolean {
    var flags = 0
    var seenChecks = 0
    for (instruction in implementation?.instructions ?: return false) {
        val call = instruction.getReference<MethodReference>() ?: continue
        if (call.definingClass != definingClass || call.returnType != "Z") continue
        if (call.parameterTypes.isEmpty()) flags++
        else if (call.parameterTypes.map(CharSequence::toString) == listOf(TEXT, TEXT, TEXT)) seenChecks++
    }
    return flags >= 1 && seenChecks == 1
}

// Typing indicator: the one sender of the MQTT "indicate_activity" command.
internal object TypingIndicatorFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("indicate_activity"),
)

// Screenshots. Instagram has two detectors, one watching the phone's media and one scanning the
// screenshot folders. Each hands a new screenshot to every listening screen, and a chat with a
// disappearing photo or video then tells the sender. Returning before either hand-off means no
// screen hears of it. And disappearing media opens in a window marked FLAG_SECURE, so Android
// refuses the screenshot before the detectors ever see one — Instagram marks windows through one
// helper, but other paths set the flag directly, so every Window.setFlags/addFlags call goes
// through stand-ins that drop FLAG_SECURE while the switch is on, and the helper returns before
// it marks (or counts) a window. Approach adapted from HushGram.

// The media detector's session starter, the one method writing both of its log lines.
private const val CONTENT_DETECTOR = "ScreenshotDetectorByContent"
private const val DETECTOR_SESSION = "Started new screenshot session"

// What the folder detector logs as it hands a screenshot to each listener. Some 454 builds also
// keep it in a string pool, so every class loading it is searched, not the first match.
private const val FOLDER_REPORT = "Reporting screenshot: %s -> %s"

// (time, path, list): how the media detector hands on a screenshot it found.
private val CONTENT_HANDOFF = listOf("J", TEXT, "Ljava/util/List;")

// The secure-window helper: the one instance (Window, String) method that marks a window
// FLAG_SECURE through Window.setFlags (and counts it, for its own consistency check). Looked up
// in the same sweep as the detectors — the Fingerprint wrapper misses it on 454.
private const val SET_WINDOW_FLAGS = "Landroid/view/Window;->setFlags(II)V"
private const val ADD_WINDOW_FLAGS = "Landroid/view/Window;->addFlags(I)V"

/** Whether this method pushes FLAG_SECURE (0x2000) through Window.setFlags. */
private fun Method.setsSecureFlag(): Boolean {
    val code = implementation?.instructions ?: return false
    var set = false
    var secure = false
    for (insn in code) {
        when (val reference = (insn as? ReferenceInstruction)?.reference) {
            null -> {}
            else -> if (reference.toString() == SET_WINDOW_FLAGS) set = true
        }
        if ((insn as? WideLiteralInstruction)?.wideLiteral == 0x2000L) secure = true
    }
    return set && secure
}

@Suppress("unused")
val ghostModePatch = bytecodePatch(
    name = "Ghost mode",
    description = "Optional: watch stories without being listed as a viewer, read DMs without " +
        "sending read receipts, type without showing \"typing...\", screenshot disappearing photos " +
        "and videos without the sender being told. Each is a runtime toggle.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    extendWith(EXTENSION)

    execute {
        // Stories: never even build the request (the network block in Block.java is the backstop).
        val stateType = PendingStorySeenStateFingerprint.classDef.type
        val send = PendingStorySeenStoreFingerprint.classDef.methods.singleOrNull {
            it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(stateType)
        } ?: throw PatchException("Story seen store: no single send(state) method")
        mutableClassDefBy(PendingStorySeenStoreFingerprint.classDef).methods
            .first { it.name == send.name && it.parameterTypes == send.parameterTypes }
            .returnEarlyIf("isStorySeenHidden")
        StoriesViewInfoFingerprint.method.returnEarlyIf("isStorySeenHidden", "const-string v0, \"[]\"\nreturn-object v0")

        // Skipping the request alone leaves the queued receipt unfinished, and Instagram clears
        // your own unread mark only once the queue reports it done: finish it here, without the
        // request, so the chat stops showing as unread for you while the sender hears nothing.
        val receipt = DmThreadSeenFingerprint.method
        val done = classDefBy(receipt.parameterTypes[1].toString()).methods.singleOrNull {
            it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.size == 2 && it.parameterTypes[1].toString() == "Ljava/lang/String;"
        } ?: throw PatchException("Receipt callback: no single completion taking (Object, String)")
        receipt.holdReceipt(
            "isDmSeenHidden",
            "${done.definingClass}->${done.name}(${done.parameterTypes.joinToString("")})V",
        )

        // Instagram rebuilds the inbox from the server, which never hears about these receipts, so
        // a ghosted chat comes back unread after a sync. Keep what you read locally here...
        val queued = DmThreadSeenQueueFingerprint.method
        queued.rememberStringsIf(
            "isDmSeenHidden",
            "rememberSeenItem",
            queued.parameterTypes.indices.filter { queued.parameterTypes[it].toString() == TEXT },
        )
        // ...and let the chat summary's own "has this account seen that message" check answer for
        // it, so the chat still reads as read with the receipt never having left.
        val unread = ChatUnreadAnswerFingerprint.method
        val check = unread.implementation?.instructions.orEmpty()
            .mapNotNull { it.getReference<MethodReference>() }
            .singleOrNull { it.definingClass == unread.definingClass && it.isSeenCheck() }
            ?: throw PatchException("Inbox unread answer: no single seen check to hook")
        mutableClassDefBy(unread.definingClass).methods.singleOrNull {
            it.name == check.name && it.returnType == "Z" &&
                it.parameterTypes.map(CharSequence::toString) == check.parameterTypes.map(CharSequence::toString)
        }?.returnTrueIf("isItemSeen", 1)
            ?: throw PatchException("Inbox unread answer: no single ${check.name}")
        TypingIndicatorFingerprint.method.returnEarlyIf("isTypingHidden")

        val sessions = mutableListOf<Method>()
        val reports = mutableListOf<Method>()
        classDefForEach { classDef ->
            for (method in classDef.methods) {
                if (method.loadsString(CONTENT_DETECTOR) && method.loadsString(DETECTOR_SESSION)) sessions += method
                if (method.returnType == "V" && AccessFlags.STATIC.isSet(method.accessFlags) &&
                    method.parameterTypes.map(CharSequence::toString).takeLast(2) == listOf(TEXT, "Ljava/util/List;") &&
                    method.loadsString(FOLDER_REPORT)
                ) {
                    reports += method
                }
            }
        }
        val session = sessions.singleOrNull()
            ?: throw PatchException("Hide screenshots: expected one media screenshot detector, found ${sessions.size}")
        val handoffs = classDefBy(session.definingClass).methods.filter {
            it.returnType == "V" && !AccessFlags.STATIC.isSet(it.accessFlags) && it.implementation != null &&
                it.parameterTypes.map(CharSequence::toString) == CONTENT_HANDOFF
        }
        val handoff = handoffs.singleOrNull()
            ?: throw PatchException("Hide screenshots: expected one hand-off in the media detector, found ${handoffs.size}")
        val report = reports.singleOrNull()
            ?: throw PatchException("Hide screenshots: expected one folder screenshot report, found ${reports.size}")
        for ((what, found) in listOf("media detector hand-off" to handoff, "folder screenshot report" to report)) {
            val method = mutableClassDefBy(found.definingClass).methods.single {
                it.name == found.name && it.returnType == found.returnType && it.parameterTypes == found.parameterTypes
            }
            if (method.branchesToEntry()) throw PatchException("Hide screenshots: something jumps back to the $what's first instruction")
            method.returnEarlyIf("isScreenshotHidden") // throws when no register is free
        }

        // Find the secure-window helper before the routing sweep below replaces its own
        // Window.setFlags call — that call is what identifies it.
        var secure: Method? = null
        classDefForEach { classDef ->
            for (method in classDef.methods) {
                if (method.returnType == "V" && !AccessFlags.STATIC.isSet(method.getAccessFlags()) &&
                    method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/Window;", TEXT) &&
                    method.setsSecureFlag()
                ) {
                    if (secure != null) throw PatchException("Hide screenshots: expected one secure window helper, found several")
                    secure = method
                }
            }
        }
        val found = secure ?: throw PatchException("Hide screenshots: no secure window helper")

        // Let the screenshot happen at all: route every window-flag call through the stand-ins
        // (replacements only, no inserts, so the collected indexes stay valid), so windows stay
        // capturable even where the flag is set without the helper.
        val routed = mutableListOf<Pair<Method, List<Pair<Int, String>>>>()
        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lcom/feurstagram/")) return@classDefForEach
            for (method in classDef.methods) {
                val calls = method.implementation?.instructions?.toList()?.withIndex()
                    ?.mapNotNull { (index, insn) ->
                        when ((insn as? ReferenceInstruction)?.reference.toString()) {
                            SET_WINDOW_FLAGS, ADD_WINDOW_FLAGS -> index to insn
                            else -> null
                        }
                    }.orEmpty()
                if (calls.isNotEmpty()) routed += method to calls.map { (index, insn) ->
                    val standIn = if ((insn.getReference<MethodReference>())!!.name == "setFlags")
                        "$CONFIG_CLASS->setFlags(Landroid/view/Window;II)V"
                    else
                        "$CONFIG_CLASS->addFlags(Landroid/view/Window;I)V"
                    index to when (insn) {
                        is FiveRegisterInstruction -> listOf(insn.registerC, insn.registerD, insn.registerE)
                            .take(insn.registerCount)
                            .joinToString(prefix = "invoke-static { ", postfix = " }, $standIn") { "v$it" }
                        is RegisterRangeInstruction ->
                            "invoke-static/range { v${insn.startRegister} .. v${insn.startRegister + insn.registerCount - 1} }, $standIn"
                        else -> throw PatchException("Hide screenshots: window flags called in a form that can't be moved")
                    }
                }
            }
        }
        if (routed.isEmpty()) throw PatchException("Hide screenshots: found no Window.setFlags or Window.addFlags call")
        for ((found, calls) in routed) {
            val method = mutableClassDefBy(found.definingClass).methods.single {
                it.name == found.name && it.returnType == found.returnType && it.parameterTypes == found.parameterTypes
            }
            for ((index, smali) in calls) method.replaceInstruction(index, smali)
        }
        val helper = mutableClassDefBy(found.definingClass).methods.single {
            it.name == found.name && it.returnType == found.returnType && it.parameterTypes == found.parameterTypes
        }
        if (helper.branchesToEntry())
            throw PatchException("Hide screenshots: something jumps back to the secure window helper's first instruction")
        helper.returnEarlyIf("liftScreenshotBlock")
    }
}
