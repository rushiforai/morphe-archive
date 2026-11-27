package app.linenotifications.patches

import app.linenotifications.patches.settings.notificationSettingsPatch
import app.linenotifications.patches.shared.*
import app.linenotifications.patches.shared.Constants.COMPATIBILITY_LINE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.w3c.dom.Element

private const val NATIVE_MUTE_LABEL = 0x7f152a17
private const val NATIVE_REPLY_LABEL = 0x7f152a18

private val nativeReadActionResourcesPatch = resourcePatch {
    execute {
        // The runtime recognizes the native mute action by its localized label,
        // never by its array position. Pin the resource names used by LINE's builder.
        document("res/values/public.xml").use { document ->
            val ids = mutableMapOf<String, Int>()
            val entries = document.getElementsByTagName("public")
            for (i in 0 until entries.length) {
                val entry = entries.item(i) as Element
                if (entry.getAttribute("type") == "string")
                    ids[entry.getAttribute("name")] = java.lang.Long.decode(entry.getAttribute("id")).toInt()
            }
            if (ids["notification_button_mute"] != NATIVE_MUTE_LABEL || ids["notification_button_reply"] != NATIVE_REPLY_LABEL)
                throw PatchException("Native notification action label resources changed")
        }
    }
}

private fun Instruction.call(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

/** Reflection is deliberately pinned to the native menu's inspected public contracts. */
private fun BytecodePatchContext.requireReadBindings() {
    fun method(owner: String, name: String, parameters: List<String>, result: String): com.android.tools.smali.dexlib2.iface.Method =
        classDefBy(owner).methods.singleOrNull {
            it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result
                && AccessFlags.PUBLIC.isSet(it.accessFlags)
        } ?: throw PatchException("Native read method changed: $owner->$name")
    fun field(owner: String, name: String, type: String) {
        if (classDefBy(owner).fields.none { it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) })
            throw PatchException("Native read field changed: $owner->$name")
    }
    fun calls(owner: String, name: String, parameters: List<String>, result: String,
              targetOwner: String, target: String) {
        val body = method(owner, name, parameters, result).implementation
            ?: throw PatchException("Native read body missing: $owner->$name")
        if (body.instructions.count { it.call()?.let { call -> call.definingClass == targetOwner && call.name == target } == true } != 1)
            throw PatchException("Native read flow changed: $owner->$name to $targetOwner->$target")
    }
    field("Lx30/d;", "a", "Lx30/d\$a;")
    field("Lyl3/s0;", "a", "Ltn3/e;")
    field("Lj34/h;", "c", "Lj34/h\$a;")
    method("Lbd0/f;", "a", listOf("Landroid/content/Context;", "Lbd0/a;"), "Ljava/lang/Object;")
    method("Lx30/d;", "b", emptyList(), "Lyl3/s0;")
    method("Ltn3/e;", "e", listOf("Ljava/lang/String;"), "Ly08/w;")
    method("Lq08/a;", "a", listOf("Lq08/b;"), "V")
    method("Lq08/b;", "onComplete", emptyList(), "V")
    method("Lq08/b;", "b", listOf("Lr08/b;"), "V")
    method("Lq08/b;", "onError", listOf("Ljava/lang/Throwable;"), "V")
    method("Lr08/b;", "dispose", emptyList(), "V")
    method("Lj34/l\$a;", "<init>", listOf("Ljava/lang/String;"), "V")
    method("Lj34/l\$c;", "<init>", listOf("Ljava/lang/String;"), "V")
    method("Lj34/h;", "c", listOf("[Lj34/l;"), "V")
    if (classDefBy("Ly08/w;").superclass != "Lq08/a;" || !AccessFlags.INTERFACE.isSet(classDefBy("Lq08/b;").accessFlags))
        throw PatchException("Native read observer hierarchy changed")
    val menuProvider = classDefBy("Lt72/c;").methods.any { candidate ->
        candidate.name == "<init>" && candidate.implementation?.instructions?.let { body ->
            body.count { it.call()?.let { call -> call.definingClass == "Lx30/d;" && call.name == "b" } == true } == 1 &&
                body.any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
                    field.definingClass == "Lyl3/s0;" && field.name == "a" && field.type == "Ltn3/e;"
                } == true }
        } == true
    }
    if (!menuProvider) throw PatchException("Native chat-list cached read provider changed")
    calls("Lt72/h;", "invokeSuspend", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;", "Ltn3/e;", "e")
    calls("Lt72/h;", "invokeSuspend", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;", "Lj34/h;", "c")
    calls("Ltn3/c;", "run", emptyList(), "V", "Ltn3/e;", "a")
    calls("Ltn3/c;", "run", emptyList(), "V", "Ltn3/e;", "d")
    for ((name, action, label) in listOf(
        Triple("b", "MUTE_CURRENT_CHAT_ACTION", NATIVE_MUTE_LABEL),
        Triple("c", "SEND_MESSAGE_ACTION", NATIVE_REPLY_LABEL),
    )) {
        val body = method("Lyi8/n;", name, listOf("Landroid/content/Context;", "Ljava/lang/String;"), "Landroidx/core/app/h;")
            .implementation?.instructions?.toList() ?: throw PatchException("Native notification action builder missing")
        val expectedAction = "jp.naver.line.android.access.remote.action.$action"
        val expectedRemoteInputs = if (name == "b") 0 else 1
        if (body.count { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == expectedAction } != 1
            || body.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == label }
            || body.count { it.call()?.let { call -> call.definingClass == "Landroid/app/PendingIntent;" && call.name == "getService" } == true } != 1
            || body.count { it.call()?.let { call -> call.definingClass == "Landroidx/core/app/z;" && call.name == "<init>"
                && call.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "Landroid/os/Bundle;", "Ljava/util/HashSet;") } == true } != expectedRemoteInputs
            || body.count { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
                field.definingClass == "Landroidx/core/app/h\$a;" && field.name == "f" && field.type == "Ljava/util/ArrayList;" } == true } != expectedRemoteInputs)
            throw PatchException("Native mute/reply action identity changed")
    }
}
private fun MutableMethod.callIndex(owner: String, name: String): Int =
    implementation!!.instructions.withIndex().filter { (_, i) -> i.call()?.let { it.definingClass == owner && it.name == name } == true }
        .single().index

private fun MutableMethod.replaceCall(index: Int, target: String) {
    val instruction = implementation!!.instructions[index]
    val registers = when (instruction) {
        is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD, instruction.registerE, instruction.registerF, instruction.registerG)
            .take(instruction.registerCount).joinToString(", ") { "v$it" }
        is RegisterRangeInstruction -> "v${instruction.startRegister} .. v${instruction.startRegister + instruction.registerCount - 1}"
        else -> throw PatchException("Unsupported invocation encoding")
    }
    val suffix = if (instruction is RegisterRangeInstruction) "/range" else ""
    replaceInstruction(index, "invoke-static$suffix {$registers}, $target")
}

/** These names and signatures were checked against both supplied APKM files' identical DEX. */
private val notificationIntegrationPatch = bytecodePatch {
    dependsOn(notificationSettingsPatch)
    execute {
        // Reject structural drift before enabling the reflection adapter.
        mapOf("Ldw3/b;" to listOf("M1"), "Lgw3/a;" to listOf("b"),
            "Lln3/k;" to listOf("b", "m", "n"), "Lln3/k\$d;" to listOf("b"),
            "Lyi8/e;" to listOf("p"), "Lch8/c\$a;" to listOf("c"),
            "Leh8/e;" to listOf("b")).forEach { (owner, fields) ->
            val found = classDefBy(owner).fields.map { it.name }.toSet()
            if (!found.containsAll(fields)) throw PatchException("Unsupported LINE metadata layout: $owner")
        }
        val sink = mutableClassDefBy("Landroidx/core/app/r;").methods.single {
            it.name == "a" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I", "Landroid/app/Notification;")
        }
        sink.replaceCall(sink.callIndex("Landroid/app/NotificationManager;", "notify"),
            "$NOTIFICATIONS->post(Landroid/app/NotificationManager;Ljava/lang/String;ILandroid/app/Notification;)V")

        // Push notifications can precede this synchronous local save. Refresh only
        // active notifications after LINE has committed the received message/count.
        val stored = mutableClassDefBy("Lkk8/c3;").methods.single {
            it.name == "f" && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljm8/nd;", "J", "Ljk8/r;", "Ljava/lang/String;", "Lhi8/o;", "Z", "Z", "J"
            )
        }
        val save = stored.callIndex("Liq8/g;", "a")
        val result = stored.getInstruction<OneRegisterInstruction>(save + 1)
        val move = stored.getInstruction<TwoRegisterInstruction>(save + 2)
        val cast = stored.getInstruction<ReferenceInstruction>(save + 3)
        val chatResult = stored.getInstruction<OneRegisterInstruction>(10)
        if (stored.implementation!!.registerCount != 29 || save != 30
            || result.opcode != Opcode.MOVE_RESULT_OBJECT || result.registerA != 0
            || move.opcode != Opcode.MOVE_OBJECT || move.registerA != 14 || move.registerB != 0
            || cast.opcode != Opcode.CHECK_CAST || (cast as OneRegisterInstruction).registerA != 14
            || (cast.reference as? TypeReference)?.type != "Lln3/a\$b;"
            || stored.getInstruction<Instruction>(9).call()?.let { it.definingClass == "Lyk8/a;" && it.name == "b" } != true
            || chatResult.opcode != Opcode.MOVE_RESULT_OBJECT || chatResult.registerA != 9) {
            throw PatchException("Native message-save completion layout changed")
        }
        stored.addInstructionsWithLabels(save + 4, """
            if-eqz v14, :native_after_save
            invoke-static {v9}, $NOTIFICATIONS->onMessageStored(Ljava/lang/String;)V
        """, ExternalLabel("native_after_save", stored.getInstruction(save + 4)))

        val service = mutableClassDefBy("Ljp/naver/line/android/access/remote/LineAccessServiceForNotification;").methods.single {
            it.name == "onStartCommand" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Intent;", "I", "I") && it.returnType == "I"
        }
        if (service.implementation!!.registerCount != 31 || service.implementation!!.instructions.none {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "jp.naver.line.android.access.remote.action.MUTE_CURRENT_CHAT_ACTION"
            }) throw PatchException("Native notification service action layout changed")
        // Dispatch the patch read action and optional quiet-mute action. Unrecognized
        // intents retain the native body, including manual inline reply.
        service.addInstructionsWithLabels(0, """
            invoke-static/range {p0 .. p1}, $LINE_SETTINGS->interceptNotificationAction(Landroid/content/Context;Landroid/content/Intent;)Z
            move-result v0
            if-eqz v0, :native_action
            const/4 v0, 0x2
            return v0
        """, ExternalLabel("native_action", service.getInstruction(0)))


        val pair = mutableClassDefBy("Lh34/f;").methods.single {
            it.name == "b" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I", "I", "Lyi8/e;", "Z")
        }
        // v0 is a local and is assigned by the native body before use (verified in original DEX).
        check(pair.implementation!!.registerCount == 9)
        pair.addInstructionsWithLabels(0, """
            invoke-static/range {p4 .. p4}, $NOTIFICATIONS->suppressBuilder(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :native
            return-void
        """, ExternalLabel("native", pair.getInstruction(0)))
    }
}

@Suppress("unused")
val noReplyPatch = bytecodePatch(
    name = "No reply",
    description = "Hides suggested replies while keeping manual inline reply. Enable in LINE notification patch settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LINE)
    dependsOn(notificationIntegrationPatch)
    execute { markIncluded("noReplyIncluded") }
}

@Suppress("unused")
val markAsReadPatch = bytecodePatch(
    name = "Mark as read",
    description = "Replaces mute with a button that marks the whole chat as read and clears its notification using LINE's native chat-list path. Enable in LINE settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LINE)
    dependsOn(notificationIntegrationPatch, nativeReadActionResourcesPatch)
    execute {
        requireReadBindings()
        markIncluded("readIncluded")
    }
}

private fun BytecodePatchContext.requireAvatarCacheBindings() {
    fun method(owner: String, name: String, parameters: List<String>, result: String): com.android.tools.smali.dexlib2.iface.Method =
        classDefBy(owner).methods.singleOrNull {
            it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result
                && AccessFlags.PUBLIC.isSet(it.accessFlags)
        } ?: throw PatchException("Native avatar cache method changed: $owner->$name")
    fun field(owner: String, name: String, type: String) {
        if (classDefBy(owner).fields.none { it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) })
            throw PatchException("Native avatar cache field changed: $owner->$name")
    }
    method("Lcom/bumptech/glide/c;", "c", listOf("Landroid/content/Context;"), "Lqo/l;")
    method("Lqo/l;", "f", listOf("Landroid/content/Context;"), "Lcom/bumptech/glide/o;")
    method("Lcom/bumptech/glide/o;", "j", emptyList(), "Lcom/bumptech/glide/n;")
    method("Lcom/bumptech/glide/o;", "n", listOf("Luo/i;"), "V")
    method("Lcom/bumptech/glide/n;", "W", listOf("Ljava/lang/Object;"), "Lcom/bumptech/glide/n;")
    method("Lcom/bumptech/glide/n;", "X", listOf("I", "I"), "Lto/c;")
    method("Lto/a;", "g", listOf("Lco/l;"), "Lto/a;")
    method("Lto/a;", "d", emptyList(), "Lto/a;")
    val cacheOnly = method("Lto/a;", "r", listOf("Z"), "Lto/a;")
    if (cacheOnly.implementation?.instructions?.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == 524288 } != false)
        throw PatchException("Glide onlyRetrieveFromCache bitmask changed")
    val overrideSize = method("Lto/a;", "t", listOf("I", "I"), "Lto/a;")
    if (overrideSize.implementation?.instructions?.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == 512 } != false)
        throw PatchException("Glide override bitmask changed")
    field("Lco/l;", "b", "Lco/l\$c;")
    method("Lx55/e;", "<init>", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z"), "V")
}

private fun BytecodePatchContext.requireMediaPreviewBindings() {
    fun method(owner: String, name: String, parameters: List<String>, result: String): com.android.tools.smali.dexlib2.iface.Method =
        classDefBy(owner).methods.singleOrNull {
            it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result
                && AccessFlags.PUBLIC.isSet(it.accessFlags)
        } ?: throw PatchException("Native media preview method changed: $owner->$name")
    fun field(owner: String, name: String, type: String) {
        if (classDefBy(owner).fields.none { it.name == name && it.type == type && AccessFlags.PUBLIC.isSet(it.accessFlags) })
            throw PatchException("Native media preview field changed: $owner->$name")
    }
    field("Ljp/naver/line/android/common/LineCommonFileProvider;", "g",
        "Ljp/naver/line/android/common/LineCommonFileProvider\$a;")
    method("Ljp/naver/line/android/common/LineCommonFileProvider\$a;", "d",
        listOf("Landroid/content/Context;", "Ljava/io/File;"), "Landroid/net/Uri;")
    field("Lq41/a;", "C8", "Lq41/a\$b;")
    method("Lq41/a;", "a", listOf("Lq41/c;"), "Ljava/io/File;")
    method("Lq41/a;", "j", listOf("Lq41/c;", "Lq41/e;"), "Ljava/io/File;")
    method("Lq41/c;", "<init>", listOf("Ljava/lang/String;", "J"), "V")
    field("Lq41/e;", "IMAGE_STANDARD", "Lq41/e;")
    field("Lq41/e;", "IMAGE_ORIGINAL", "Lq41/e;")
    method("Lp80/e;", "<init>",
        listOf("Ljava/lang/String;", "Ljava/lang/String;", "J", "Ljava/lang/String;",
            "Lfi1/a\$c;", "Ljava/lang/String;", "Z"), "V")
    field("Lco/l;", "d", "Lco/l\$e;")
    field("Lf16/d;", "W2", "Lf16/d\$a;")
    method("Lf16/d;", "p", listOf("J", "J"), "Ljava/io/File;")
    method("Lf16/d;", "k", listOf("J", "J"), "Ljava/io/File;")
    method("Lf16/d;", "o", listOf("J", "J"), "Ljava/io/File;")
    field("Lf16/p;", "Z2", "Lf16/p\$a;")
    method("Lf16/p;", "o", listOf("Ln16/e;"), "Ljava/lang/String;")
    method("Ln16/e;", "<init>", listOf("J", "J", "J", "Ln16/f;", "Ljava/lang/String;"), "V")
    method("Lfi1/a\$c;", "<init>", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;"), "V")
}

@Suppress("unused")
val moreChatInfoPatch = bytecodePatch(
    name = "More Chat Info",
    description = "Shows configurable recent unread messages (1–25) in conversation style with total unread count, sender profile avatars (local cache only), optional inline photo/video/sticker thumbnail previews (loaded via LINE's image loader when enabled), and typed attachment labels ([Photo], [Video], [Sticker], [File] filename, [Location] place) across notifications, popups, and the chat list. Enable in LINE settings.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LINE)
    dependsOn(notificationIntegrationPatch)
    execute {
        requireAvatarCacheBindings()
        requireMediaPreviewBindings()
        val chatListItem = mutableClassDefBy("Lu52/i;").methods.single {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z", "Z", "Z",
                "Ljp/naver/line/android/model/ChatData\$c;", "Ljava/lang/String;", "Lne8/z;",
                "Ljava/lang/Long;", "I", "Z", "Z", "Z", "Z", "Z"
            )
        }
        val chatListLastMessage = chatListItem.implementation!!.instructions.withIndex().single { (_, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == "Lu52/i;" && field.name == "h"
        }
        val lastMsgAssign = chatListLastMessage.value as TwoRegisterInstruction
        if (chatListItem.implementation!!.registerCount != 17
            || lastMsgAssign.registerA != 8 || lastMsgAssign.registerB != 0) {
            throw PatchException("Native chat-list last-message presentation layout changed")
        }
        chatListItem.addInstructions(chatListLastMessage.index, """
            invoke-static {v1, v8, v10, v15}, $LINE_SETTINGS->chatListLastMessage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Long;Z)Ljava/lang/String;
            move-result-object v8
        """)
        markIncluded("infoIncluded")
    }
}

@Suppress("unused")
val notTooMuchSilentPatch = bytecodePatch(
    name = "Not Too Much Silent",
    description = "Turns chat-menu, chat-list, and notification mute into local silent mode with optional @mention and keyword alert bypass; adds a completely-hidden chat menu option.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LINE)
    dependsOn(notificationIntegrationPatch, nativeReadActionResourcesPatch)
    execute {
        val registrant = mutableClassDefBy("Lk34/i;").methods.single {
            it.name == "b" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Lj34/d;")
        }
        registrant.replaceCall(registrant.callIndex("Lke8/z;", "z"),
            "$NOTIFICATIONS->allowMuted(Ljava/lang/Object;Ljava/lang/String;)Z")

        // Locally fetched messages are filtered before MessageNotificationRegistrant is
        // reached. Change only that notification gate; keep the OpenChat thread-parent
        // check, active-chat exclusion, global switches and PREVENT_NOTIFICATION intact.
        val fetched = mutableClassDefBy("Lyi8/a;").methods.single {
            it.name == "d" && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljk8/r;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
                "Ljm8/nd;", "J", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
                "Leh8/b;", "Z", "Z", "Ljava/lang/String;", "Ljava/lang/String;"
            )
        }
        val muteChecks = fetched.implementation!!.instructions.withIndex().filter { (_, i) ->
            i.call()?.let { it.definingClass == "Lke8/z;" && it.name == "z"
                    && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;")
                    && it.returnType == "Z" } == true
        }
        if (fetched.implementation!!.registerCount != 33 || muteChecks.size != 2) {
            throw PatchException("Fetched-message notification mute gates changed")
        }
        val threadCheck = muteChecks[0].value as? FiveRegisterInstruction
        val chatCheck = muteChecks[1].value as? FiveRegisterInstruction
        if (threadCheck?.registerCount != 2 || threadCheck.registerC != 6 || threadCheck.registerD != 2
            || chatCheck?.registerCount != 2 || chatCheck.registerC != 6 || chatCheck.registerD != 8) {
            throw PatchException("Fetched-message notification gate registers changed")
        }
        fetched.replaceCall(muteChecks[1].index,
            "$NOTIFICATIONS->allowMuted(Ljava/lang/Object;Ljava/lang/String;)Z")

        // Intercept only the native chat-menu button, after LINE has constructed its
        // result callback. The extension can keep server delivery enabled for quiet
        // rooms; returning false preserves LINE's original toggle, including OpenChat.
        val toggle = mutableClassDefBy("Li60/w1;").methods.single {
            it.name == "invoke" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/Object;"
        }
        val callbackIndex = toggle.callIndex("Lkotlin/jvm/internal/m;", "<init>")
        val callback = toggle.getInstruction<RegisterRangeInstruction>(callbackIndex)
        if (toggle.implementation!!.registerCount != 17 || callbackIndex != 31
            || callback.startRegister != 1 || callback.registerCount != 7) {
            throw PatchException("Native notification-toggle callback layout changed")
        }
        val continuationIndex = callbackIndex + 1
        toggle.addInstructionsWithLabels(continuationIndex, """
            invoke-static {v3, v1}, $LINE_SETTINGS->interceptToggle(Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v2
            if-eqz v2, :native_toggle
            sget-object v0, Llm8/i0;->a:Llm8/i0;
            return-object v0
        """, ExternalLabel("native_toggle", toggle.getInstruction(continuationIndex)))

        // This Parcelable is menu presentation state, not LINE's persisted chat model.
        // Apply the local quiet state to initial loads, copies and live menu updates.
        val menuData = mutableClassDefBy("Li60/a4;").methods.single {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
                "Ljp/naver/line/android/model/ChatData\$a;", "Li60/q5;", "Z", "Li60/x4;", "I",
                "Ljava/lang/String;", "Z", "Z", "Ljava/lang/Boolean;", "Landroid/net/Uri;", "Landroid/net/Uri;",
                "Ll60/b;", "Ll60/a;"
            )
        }
        val notifiableAssignment = menuData.implementation!!.instructions.withIndex().single { (_, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IPUT_BOOLEAN && field?.definingClass == "Li60/a4;" && field.name == "l"
        }
        val assignment = notifiableAssignment.value as TwoRegisterInstruction
        if (menuData.implementation!!.registerCount != 18 || notifiableAssignment.index != 17
            || assignment.registerA != 12 || assignment.registerB != 0) {
            throw PatchException("Native notification-toggle presentation layout changed")
        }
        menuData.addInstructions(notifiableAssignment.index, """
            invoke-static {v1, v12}, $LINE_SETTINGS->menuNotifiable(Ljava/lang/String;Z)Z
            move-result v12
        """)

        // Chat-list UI model (presentation only): reflects local quiet state in the
        // muted bell icon and long-press menu label without altering LINE's stored model.
        val chatListItem = mutableClassDefBy("Lu52/i;").methods.single {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z", "Z", "Z",
                "Ljp/naver/line/android/model/ChatData\$c;", "Ljava/lang/String;", "Lne8/z;",
                "Ljava/lang/Long;", "I", "Z", "Z", "Z", "Z", "Z"
            )
        }
        val chatListNotifiable = chatListItem.implementation!!.instructions.withIndex().single { (_, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IPUT_BOOLEAN && field?.definingClass == "Lu52/i;" && field.name == "f"
        }
        val chatListAssign = chatListNotifiable.value as TwoRegisterInstruction
        if (chatListItem.implementation!!.registerCount != 17
            || chatListAssign.registerA != 6 || chatListAssign.registerB != 0) {
            throw PatchException("Native chat-list notification presentation layout changed")
        }
        chatListItem.addInstructions(chatListNotifiable.index, """
            invoke-static {v1, v6}, $LINE_SETTINGS->menuNotifiable(Ljava/lang/String;Z)Z
            move-result v6
        """)

        // Chat-list long-press mute/unmute toggle for ordinary chats (Lu52/j). OpenChat
        // (Lu52/z) and ServiceChat (Lu52/w) remain on their native branches.
        val chatListToggle = mutableClassDefBy("Lt72/c;").methods.single {
            it.name == "E5" && it.parameterTypes.map(CharSequence::toString) == listOf("Lu52/l;") && it.returnType == "V"
        }
        val chatListBody = chatListToggle.implementation!!.instructions.toList()
        val chatListIdLoad = chatListBody[21] as? TwoRegisterInstruction
        val chatListIdField = (chatListBody[21] as? ReferenceInstruction)?.reference as? FieldReference
        if (chatListToggle.implementation!!.registerCount != 7
            || chatListBody[16].opcode != Opcode.INSTANCE_OF
            || (chatListBody[16] as? ReferenceInstruction)?.reference?.let { (it as? TypeReference)?.type } != "Lu52/j;"
            || chatListBody[19].call()?.let { it.definingClass == "Lu52/j;" && it.name == "f" } != true
            || chatListIdLoad?.opcode != Opcode.IGET_OBJECT || chatListIdLoad.registerA != 0 || chatListIdLoad.registerB != 0
            || chatListIdField?.definingClass != "Lu52/i;" || chatListIdField.name != "a"
            || chatListBody[29].call()?.let { it.definingClass == "Lt72/k;" && it.name == "<init>" } != true) {
            throw PatchException("Native chat-list notification toggle layout changed")
        }
        chatListToggle.addInstructionsWithLabels(22, """
            invoke-static {v0}, $LINE_SETTINGS->interceptChatListToggle(Ljava/lang/String;)Z
            move-result v3
            if-eqz v3, :native_chat_list_toggle
            return-void
        """, ExternalLabel("native_chat_list_toggle", chatListToggle.getInstruction(22)))

        // Pin the global event bus contract used to refresh the chat list after quiet toggles.
        if (classDefBy("Lcom/linecorp/rxeventbus/d;").fields.none {
                it.name == "a" && it.type == "Lcom/linecorp/rxeventbus/d\$a;" && AccessFlags.PUBLIC.isSet(it.accessFlags)
            } || classDefBy("Lcom/linecorp/rxeventbus/d;").methods.none {
                it.name == "b" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Object;")
                    && it.returnType == "V" && AccessFlags.PUBLIC.isSet(it.accessFlags)
            } || classDefBy("Ln88/b;").fields.none {
                it.name == "CHAT_LIST" && it.type == "Ln88/b;" && AccessFlags.PUBLIC.isSet(it.accessFlags)
            }) {
            throw PatchException("Native chat-list refresh event bus changed")
        }

        val menu = mutableClassDefBy("Lcom/linecorp/chathistory/menu/ChatHistoryMenuFragment;").methods.single { it.name == "onViewCreated" }
        val calls = menu.implementation!!.instructions.withIndex().filter { (_, i) ->
            i.call()?.let { it.definingClass == "Lyb8/f;" && it.name == "n" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/Collection;") } == true
        }
        if (calls.size != 1) throw PatchException("Native chat-menu list submission changed")
        calls.reversed().forEach { (index, instruction) ->
            val call = instruction as? FiveRegisterInstruction ?: throw PatchException("Changed chat-menu call")
            val listRegister = call.registerD
            menu.addInstructions(index, "invoke-static/range {v$listRegister .. v$listRegister}, $LINE_SETTINGS->addChatMenu(Ljava/util/Collection;)V")
        }
        menu.addInstructions(0, "invoke-static/range {p0 .. p0}, $LINE_SETTINGS->captureChatMenu(Ljava/lang/Object;)V")
        markIncluded("silentIncluded")
    }
}
