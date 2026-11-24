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

private const val NATIVE_MUTE_LABEL = 0x7f152825
private const val NATIVE_REPLY_LABEL = 0x7f152826

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
    field("Ln30/d;", "a", "Ln30/d\$a;")
    field("Lue3/y0;", "a", "Lqg3/e;")
    field("Lfw3/h;", "c", "Lfw3/h\$a;")
    method("Lsc0/f;", "a", listOf("Landroid/content/Context;", "Lsc0/a;"), "Ljava/lang/Object;")
    method("Ln30/d;", "b", emptyList(), "Lue3/y0;")
    method("Lqg3/e;", "e", listOf("Ljava/lang/String;"), "Li78/w;")
    method("La78/a;", "a", listOf("La78/b;"), "V")
    method("La78/b;", "b", emptyList(), "V")
    method("La78/b;", "c", listOf("Lb78/b;"), "V")
    method("La78/b;", "onError", listOf("Ljava/lang/Throwable;"), "V")
    method("Lb78/b;", "dispose", emptyList(), "V")
    method("Lfw3/l\$a;", "<init>", listOf("Ljava/lang/String;"), "V")
    method("Lfw3/l\$c;", "<init>", listOf("Ljava/lang/String;"), "V")
    method("Lfw3/h;", "c", listOf("[Lfw3/l;"), "V")
    if (classDefBy("Li78/w;").superclass != "La78/a;" || !AccessFlags.INTERFACE.isSet(classDefBy("La78/b;").accessFlags))
        throw PatchException("Native read observer hierarchy changed")
    val menuProvider = classDefBy("Ld42/d;").methods.any { candidate ->
        candidate.name == "<init>" && candidate.implementation?.instructions?.let { body ->
            body.count { it.call()?.let { call -> call.definingClass == "Ln30/d;" && call.name == "b" } == true } == 1 &&
                body.any { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
                    field.definingClass == "Lue3/y0;" && field.name == "a" && field.type == "Lqg3/e;"
                } == true }
        } == true
    }
    if (!menuProvider) throw PatchException("Native chat-list cached read provider changed")
    calls("Ld42/i;", "invokeSuspend", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;", "Lqg3/e;", "e")
    calls("Ld42/i;", "invokeSuspend", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;", "Lfw3/h;", "c")
    calls("Lqg3/c;", "run", emptyList(), "V", "Lqg3/e;", "a")
    calls("Lqg3/c;", "run", emptyList(), "V", "Lqg3/e;", "d")
    for ((name, action, label) in listOf(
        Triple("b", "MUTE_CURRENT_CHAT_ACTION", NATIVE_MUTE_LABEL),
        Triple("c", "SEND_MESSAGE_ACTION", NATIVE_REPLY_LABEL),
    )) {
        val body = method("Lip8/p;", name, listOf("Landroid/content/Context;", "Ljava/lang/String;"), "Landroidx/core/app/h\$a;")
            .implementation?.instructions?.toList() ?: throw PatchException("Native notification action builder missing")
        val expectedAction = "jp.naver.line.android.access.remote.action.$action"
        if (body.count { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == expectedAction } != 1
            || body.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == label }
            || body.count { it.call()?.let { call -> call.definingClass == "Landroid/app/PendingIntent;" && call.name == "getService" } == true } != 1
            || body.count { it.call()?.let { call -> call.definingClass == "Landroidx/core/app/h\$a\$a;" && call.name == "a"
                && call.parameterTypes.map(CharSequence::toString) == listOf("Landroidx/core/app/u;") } == true } != if (name == "b") 0 else 1)
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
        mapOf("Lap3/b;" to listOf("k0"), "Ldp3/a;" to listOf("b"),
            "Lig3/k;" to listOf("b", "m", "n"), "Lig3/k\$d;" to listOf("c"),
            "Lip8/g;" to listOf("p")).forEach { (owner, fields) ->
            val found = classDefBy(owner).fields.map { it.name }.toSet()
            if (!found.containsAll(fields)) throw PatchException("Unsupported LINE metadata layout: $owner")
        }
        val sink = mutableClassDefBy("Landroidx/core/app/k;").methods.single {
            it.name == "a" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I", "Landroid/app/Notification;")
        }
        sink.replaceCall(sink.callIndex("Landroid/app/NotificationManager;", "notify"),
            "$NOTIFICATIONS->post(Landroid/app/NotificationManager;Ljava/lang/String;ILandroid/app/Notification;)V")

        // Push notifications can precede this synchronous local save. Refresh only
        // active notifications after LINE has committed the received message/count.
        val stored = mutableClassDefBy("Luq8/z2;").methods.single {
            it.name == "f" && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Lts8/od;", "J", "Ltq8/r;", "Ljava/lang/String;", "Lso8/m;", "Z", "Z", "J"
            )
        }
        val save = stored.callIndex("Lrw8/h;", "a")
        val result = stored.getInstruction<OneRegisterInstruction>(save + 1)
        val move = stored.getInstruction<TwoRegisterInstruction>(save + 2)
        val cast = stored.getInstruction<ReferenceInstruction>(save + 3)
        val chatResult = stored.getInstruction<OneRegisterInstruction>(10)
        if (stored.implementation!!.registerCount != 29 || save != 30
            || result.opcode != Opcode.MOVE_RESULT_OBJECT || result.registerA != 0
            || move.opcode != Opcode.MOVE_OBJECT || move.registerA != 14 || move.registerB != 0
            || cast.opcode != Opcode.CHECK_CAST || (cast as OneRegisterInstruction).registerA != 14
            || (cast.reference as? TypeReference)?.type != "Lig3/a\$b;"
            || stored.getInstruction<Instruction>(9).call()?.let { it.definingClass == "Lir8/a;" && it.name == "b" } != true
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


        val pair = mutableClassDefBy("Ldw3/f;").methods.single {
            it.name == "b" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;", "I", "I", "Lip8/g;", "Z")
        }
        // v0 is a local and is assigned by the native body before use (verified in original DEX).
        check(pair.implementation!!.registerCount == 8)
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
    method("Lcom/bumptech/glide/c;", "c", listOf("Landroid/content/Context;"), "Lxn/o;")
    method("Lxn/o;", "f", listOf("Landroid/content/Context;"), "Lcom/bumptech/glide/o;")
    method("Lcom/bumptech/glide/o;", "g", emptyList(), "Lcom/bumptech/glide/n;")
    method("Lcom/bumptech/glide/o;", "n", listOf("Lbo/j;"), "V")
    method("Lcom/bumptech/glide/n;", "b0", listOf("Ljava/lang/Object;"), "Lcom/bumptech/glide/n;")
    method("Lcom/bumptech/glide/n;", "g0", emptyList(), "Lao/c;")
    method("Lao/a;", "h", listOf("Lkn/l;"), "Lao/a;")
    method("Lao/a;", "d", emptyList(), "Lao/a;")
    val cacheOnly = method("Lao/a;", "s", listOf("Z"), "Lao/a;")
    if (cacheOnly.implementation?.instructions?.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == 524288 } != false)
        throw PatchException("Glide onlyRetrieveFromCache bitmask changed")
    val overrideSize = method("Lao/a;", "u", listOf("I", "I"), "Lao/a;")
    if (overrideSize.implementation?.instructions?.none { (it as? NarrowLiteralInstruction)?.narrowLiteral == 512 } != false)
        throw PatchException("Glide override bitmask changed")
    field("Lkn/l;", "b", "Lkn/l\$c;")
    method("Le80/l0;", "<init>", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Z"), "V")
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
    field("Lj31/a;", "I4", "Lj31/a\$b;")
    method("Lj31/a;", "e", listOf("Lj31/c;"), "Ljava/io/File;")
    method("Lj31/a;", "k", listOf("Lj31/c;", "Lj31/e;"), "Ljava/io/File;")
    method("Lj31/c;", "<init>", listOf("Ljava/lang/String;", "J"), "V")
    field("Lj31/e;", "IMAGE_STANDARD", "Lj31/e;")
    field("Lj31/e;", "IMAGE_ORIGINAL", "Lj31/e;")
    method("Le80/d;", "<init>",
        listOf("Ljava/lang/String;", "Ljava/lang/String;", "J", "Ljava/lang/String;",
            "Llg1/a\$c;", "Ljava/lang/String;", "Z"), "V")
    field("Lkn/l;", "d", "Lkn/l\$e;")
    field("Lsu5/d;", "sa", "Lsu5/d\$a;")
    method("Lsu5/d;", "n", listOf("J", "J"), "Ljava/io/File;")
    method("Lsu5/d;", "k", listOf("J", "J"), "Ljava/io/File;")
    method("Lsu5/d;", "m", listOf("J", "J"), "Ljava/io/File;")
    field("Lsu5/o;", "va", "Lsu5/o\$a;")
    method("Lsu5/o;", "h", listOf("Lzu5/d;"), "Ljava/lang/String;")
    method("Lzu5/d;", "<init>", listOf("J", "J", "J", "Lzu5/e;", "Ljava/lang/String;"), "V")
    method("Llg1/a\$c;", "<init>", listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;"), "V")
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
        val chatListItem = mutableClassDefBy("Lf22/i;").methods.single {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z", "Z", "Z",
                "Ljp/naver/line/android/model/ChatData\$c;", "Ljava/lang/String;", "Lyk8/z;",
                "Ljava/lang/Long;", "I", "Z", "Z", "Z", "Z", "Z"
            )
        }
        val chatListLastMessage = chatListItem.implementation!!.instructions.withIndex().single { (_, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == "Lf22/i;" && field.name == "h"
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
    dependsOn(notificationIntegrationPatch)
    execute {
        val registrant = mutableClassDefBy("Lgw3/i;").methods.single {
            it.name == "c" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Lfw3/d;")
        }
        registrant.replaceCall(registrant.callIndex("Lwk8/l0;", "x"),
            "$NOTIFICATIONS->allowMuted(Ljava/lang/Object;Ljava/lang/String;)Z")

        // Locally fetched messages are filtered before MessageNotificationRegistrant is
        // reached. Change only that notification gate; keep the OpenChat thread-parent
        // check, active-chat exclusion, global switches and PREVENT_NOTIFICATION intact.
        val fetched = mutableClassDefBy("Lip8/c;").methods.single {
            it.name == "d" && it.returnType == "V" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Ltq8/r;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
                "Lts8/od;", "J", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
                "Lpn8/b;", "Z", "Z", "Ljava/lang/String;", "Ljava/lang/String;"
            )
        }
        val muteChecks = fetched.implementation!!.instructions.withIndex().filter { (_, i) ->
            i.call()?.let { it.definingClass == "Lwk8/l0;" && it.name == "x"
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
        val toggle = mutableClassDefBy("Lz50/y0;").methods.single {
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
            sget-object v0, Lvs8/i0;->a:Lvs8/i0;
            return-object v0
        """, ExternalLabel("native_toggle", toggle.getInstruction(continuationIndex)))

        // This Parcelable is menu presentation state, not LINE's persisted chat model.
        // Apply the local quiet state to initial loads, copies and live menu updates.
        val menuData = mutableClassDefBy("Lz50/t2;").methods.single {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;",
                "Ljp/naver/line/android/model/ChatData\$a;", "Lz50/i4;", "Z", "Z", "Lz50/r3;", "I",
                "Ljava/lang/String;", "Z", "Z", "Ljava/lang/Boolean;", "Landroid/net/Uri;", "Landroid/net/Uri;",
                "Lc60/b;", "Lc60/a;"
            )
        }
        val notifiableAssignment = menuData.implementation!!.instructions.withIndex().single { (_, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IPUT_BOOLEAN && field?.definingClass == "Lz50/t2;" && field.name == "m"
        }
        val assignment = notifiableAssignment.value as TwoRegisterInstruction
        if (menuData.implementation!!.registerCount != 19 || notifiableAssignment.index != 18
            || assignment.registerA != 13 || assignment.registerB != 0) {
            throw PatchException("Native notification-toggle presentation layout changed")
        }
        menuData.addInstructions(notifiableAssignment.index, """
            invoke-static {v1, v13}, $LINE_SETTINGS->menuNotifiable(Ljava/lang/String;Z)Z
            move-result v13
        """)

        // Chat-list UI model (presentation only): reflects local quiet state in the
        // muted bell icon and long-press menu label without altering LINE's stored model.
        val chatListItem = mutableClassDefBy("Lf22/i;").methods.single {
            it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(
                "Ljava/lang/String;", "Ljava/lang/String;", "Z", "Z", "Z", "Z",
                "Ljp/naver/line/android/model/ChatData\$c;", "Ljava/lang/String;", "Lyk8/z;",
                "Ljava/lang/Long;", "I", "Z", "Z", "Z", "Z", "Z"
            )
        }
        val chatListNotifiable = chatListItem.implementation!!.instructions.withIndex().single { (_, instruction) ->
            val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
            instruction.opcode == Opcode.IPUT_BOOLEAN && field?.definingClass == "Lf22/i;" && field.name == "f"
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

        // Chat-list long-press mute/unmute toggle for ordinary chats (Lf22/j). OpenChat
        // (Lf22/z) and ServiceChat (Lf22/w) remain on their native branches.
        val chatListToggle = mutableClassDefBy("Ld42/d;").methods.single {
            it.name == "u3" && it.parameterTypes.map(CharSequence::toString) == listOf("Lf22/l;") && it.returnType == "V"
        }
        val chatListBody = chatListToggle.implementation!!.instructions.toList()
        val chatListIdLoad = chatListBody[21] as? TwoRegisterInstruction
        val chatListIdField = (chatListBody[21] as? ReferenceInstruction)?.reference as? FieldReference
        if (chatListToggle.implementation!!.registerCount != 7
            || chatListBody[16].opcode != Opcode.INSTANCE_OF
            || (chatListBody[16] as? ReferenceInstruction)?.reference?.let { (it as? TypeReference)?.type } != "Lf22/j;"
            || chatListBody[19].call()?.let { it.definingClass == "Lf22/j;" && it.name == "f" } != true
            || chatListIdLoad?.opcode != Opcode.IGET_OBJECT || chatListIdLoad.registerA != 0 || chatListIdLoad.registerB != 0
            || chatListIdField?.definingClass != "Lf22/i;" || chatListIdField.name != "a"
            || chatListBody[29].call()?.let { it.definingClass == "Ld42/l;" && it.name == "<init>" } != true) {
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
            } || classDefBy("Lxe8/b;").fields.none {
                it.name == "CHAT_LIST" && it.type == "Lxe8/b;" && AccessFlags.PUBLIC.isSet(it.accessFlags)
            }) {
            throw PatchException("Native chat-list refresh event bus changed")
        }

        val menu = mutableClassDefBy("Lcom/linecorp/chathistory/menu/ChatHistoryMenuFragment;").methods.single { it.name == "onViewCreated" }
        val calls = menu.implementation!!.instructions.withIndex().filter { (_, i) ->
            i.call()?.let { it.definingClass == "Lji8/f;" && it.name == "n" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/util/Collection;") } == true
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
