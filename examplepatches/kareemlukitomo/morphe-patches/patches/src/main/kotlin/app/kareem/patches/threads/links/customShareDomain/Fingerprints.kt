package app.kareem.patches.threads.links.customShareDomain

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object PlainTextShareIntentBuilderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/content/Intent;",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    strings =
        listOf(
            "android.intent.action.SEND",
            "android.intent.extra.SUBJECT",
            "android.intent.extra.TEXT",
            "text/plain",
        ),
)

internal object ChatInviteShareIntentBuilderFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    strings =
        listOf(
            "ig_text_feed_slide_chat_invite_link",
            "android.intent.action.SEND",
            "android.intent.extra.SUBJECT",
            "android.intent.extra.TITLE",
            "android.intent.extra.TEXT",
            "text/plain",
        ),
    custom = { methodDef, _ ->
        methodDef.name == "invoke"
    },
)

internal object LinkShareSheetCopyLinkFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings =
        listOf(
            "android.intent.extra.TEXT",
            "share_to_system_sheet",
        ),
    custom = { methodDef, _ ->
        methodDef.name == "invoke" &&
            methodDef.implementation
                ?.instructions
                ?.any { instruction ->
                    instruction is com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction &&
                        instruction.reference.toString()
                            .contains("Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V")
                } == true
    },
)

internal object CopyToClipboardUseCaseFingerprint : Fingerprint(
    definingClass = "Lcom/instagram/barcelona/share/usecase/CopyToClipboardUseCase\$copyLink\$result\$1;",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;"),
    strings =
        listOf(
            "copy_link",
            "direct_share_sheet",
        ),
    custom = { methodDef, _ ->
        methodDef.name == "invokeSuspend"
    },
)
