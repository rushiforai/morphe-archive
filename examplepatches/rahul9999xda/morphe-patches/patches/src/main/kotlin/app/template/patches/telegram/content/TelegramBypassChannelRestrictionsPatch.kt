package app.template.patches.telegram.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.CheckCanOpenChat2Normal1311Fingerprint
import app.template.patches.telegram.CheckCanOpenChat3Normal1311Fingerprint
import app.template.patches.telegram.CheckCanOpenChat4Normal1311Fingerprint
import app.template.patches.telegram.CheckCanOpenChat4Web1311Fingerprint
import app.template.patches.telegram.CheckCanOpenChat2Plus1303Fingerprint
import app.template.patches.telegram.CheckCanOpenChat3Plus1303Fingerprint
import app.template.patches.telegram.CheckCanOpenChat4Plus1303Fingerprint
import app.template.patches.telegram.CheckCanOpenChat4Plus1302Fingerprint
import app.template.patches.telegram.CheckSensitiveNormal1311Fingerprint
import app.template.patches.telegram.CheckSensitivePlus1303Fingerprint
import app.template.patches.telegram.ShowCantOpenAlertNormal1311Fingerprint
import app.template.patches.telegram.ShowCantOpenAlertPlus1303Fingerprint
import app.template.patches.telegram.CheckCanOpenChat2Normal1303Fingerprint
import app.template.patches.telegram.CheckCanOpenChat3Normal1303Fingerprint
import app.template.patches.telegram.CheckCanOpenChat4Normal1303Fingerprint
import app.template.patches.telegram.CheckCanOpenChat4Web1303Fingerprint
import app.template.patches.telegram.CheckCanOpenChat4Web1310Fingerprint
import app.template.patches.telegram.CheckSensitiveNormal1303Fingerprint
import app.template.patches.telegram.ShowCantOpenAlertNormal1303Fingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency

private val getRestrictionReasonFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "getRestrictionReason",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/ArrayList;"),
)

private val setContentSettingsFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "setContentSettings",
    returnType = "V",
    parameters = listOf("Z"),
)

private val messagesControllerIsSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isSensitive",
    returnType = "Z",
    parameters = listOf("Ljava/util/ArrayList;"),
)

private val messageObjectIsSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isSensitive",
    returnType = "Z",
    parameters = emptyList(),
)

private val messageObjectIsHiddenSensitiveFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessageObject;",
    name = "isHiddenSensitive",
    returnType = "Z",
    parameters = emptyList(),
)

private val showSensitiveContentFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showSensitiveContent",
    returnType = "Z",
    parameters = emptyList(),
)

// Telegram Web 13.0.2 legacy/current descriptor; Web 13.0.3 keeps s2.
private val showCantOpenAlertWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showCantOpenAlert",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/ui/ActionBar/s2;",
        "Ljava/lang/String;",
    ),
)

// Telegram 13.0.2 legacy descriptor; Telegram 13.0.3 uses ActionBar/r2.
private val showCantOpenAlertNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showCantOpenAlert",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/ui/ActionBar/s2;",
        "Ljava/lang/String;",
    ),
)

private val showCantOpenAlertPlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "showCantOpenAlert",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/ui/ActionBar/i2;",
        "Ljava/lang/String;",
    ),
)

private val checkChannelErrorFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkChannelError",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "J"),
)

private val checkSensitiveWebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkSensitive",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/ui/ActionBar/s2;",
        "J",
        "Ljava/lang/Runnable;",
        "Ljava/lang/Runnable;",
    ),
)

// Telegram 13.0.2 legacy descriptor; Telegram 13.0.3 uses ActionBar/r2.
private val checkSensitiveNormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkSensitive",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/ui/ActionBar/s2;",
        "J",
        "Ljava/lang/Runnable;",
        "Ljava/lang/Runnable;",
    ),
)

private val checkSensitivePlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkSensitive",
    returnType = "V",
    parameters = listOf(
        "Lorg/telegram/ui/ActionBar/i2;",
        "J",
        "Ljava/lang/Runnable;",
        "Ljava/lang/Runnable;",
    ),
)

private val checkCanOpenChat2WebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/s2;",
    ),
)

// Telegram 13.0.2 legacy descriptor; Telegram 13.0.3 uses ActionBar/r2.
private val checkCanOpenChat2NormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/s2;",
    ),
)

private val checkCanOpenChat2PlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/i2;",
    ),
)

private val checkCanOpenChat3WebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/s2;",
        "Lorg/telegram/messenger/MessageObject;",
    ),
)

// Telegram 13.0.2 legacy descriptor; Telegram 13.0.3 uses ActionBar/r2.
private val checkCanOpenChat3NormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/s2;",
        "Lorg/telegram/messenger/MessageObject;",
    ),
)

private val checkCanOpenChat3PlusFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/i2;",
        "Lorg/telegram/messenger/MessageObject;",
    ),
)

// Telegram Web 13.0.2 legacy descriptor; Web 13.0.3 uses Lje/e;.
private val checkCanOpenChat4WebFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/s2;",
        "Lorg/telegram/messenger/MessageObject;",
        "Lie/e;",
    ),
)

// Legacy Telegram 13.0.2 descriptor; Telegram 13.1.1 uses Lge/e;.
private val checkCanOpenChat4NormalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkCanOpenChat",
    returnType = "Z",
    parameters = listOf(
        "Landroid/os/Bundle;",
        "Lorg/telegram/ui/ActionBar/s2;",
        "Lorg/telegram/messenger/MessageObject;",
        "Lfe/e;",
    ),
)


@Suppress("unused")
val telegramBypassChannelRestrictionsPatch = bytecodePatch(
    name = "Bypass channel restrictions",
    description = "Allows opening and viewing content from restricted, sensitive, and copyright-restricted channels.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
    )
    dependsOn(telegramSpoofDependency())

    execute {
        fun resolveVariantMethod(
            vararg fingerprints: Fingerprint,
            methodName: String,
        ) = requireNotNull(
            fingerprints.firstNotNullOfOrNull { it.methodOrNull },
        ) {
            "Failed to match Telegram/Plus fingerprint for $methodName"
        }

        getRestrictionReasonFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )

        setContentSettingsFingerprint.method.addInstructions(0, "const/4 p1, 0x1")

        messagesControllerIsSensitiveFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        messageObjectIsSensitiveFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        messageObjectIsHiddenSensitiveFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
        showSensitiveContentFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        resolveVariantMethod(
            showCantOpenAlertWebFingerprint,
            showCantOpenAlertNormalFingerprint,
            ShowCantOpenAlertNormal1311Fingerprint,
            ShowCantOpenAlertPlus1303Fingerprint,
            ShowCantOpenAlertNormal1303Fingerprint,
            showCantOpenAlertPlusFingerprint,
            methodName = "showCantOpenAlert",
        ).addInstructions(0, "return-void")

        checkChannelErrorFingerprint.method.addInstructions(0, "return-void")

        resolveVariantMethod(
            checkSensitiveWebFingerprint,
            checkSensitiveNormalFingerprint,
            CheckSensitiveNormal1311Fingerprint,
            CheckSensitivePlus1303Fingerprint,
            CheckSensitiveNormal1303Fingerprint,
            checkSensitivePlusFingerprint,
            methodName = "checkSensitive",
        ).addInstructions(
            0,
            """
                if-eqz p4, :skip
                invoke-interface {p4}, Ljava/lang/Runnable;->run()V
                :skip
                return-void
            """,
        )

        listOf(
            resolveVariantMethod(
                checkCanOpenChat2WebFingerprint,
                checkCanOpenChat2NormalFingerprint,
                CheckCanOpenChat2Normal1311Fingerprint,
                CheckCanOpenChat2Plus1303Fingerprint,
                CheckCanOpenChat2Normal1303Fingerprint,
                checkCanOpenChat2PlusFingerprint,
                methodName = "checkCanOpenChat/2",
            ),
            resolveVariantMethod(
                checkCanOpenChat3WebFingerprint,
                checkCanOpenChat3NormalFingerprint,
                CheckCanOpenChat3Normal1311Fingerprint,
                CheckCanOpenChat3Plus1303Fingerprint,
                CheckCanOpenChat3Normal1303Fingerprint,
                checkCanOpenChat3PlusFingerprint,
                methodName = "checkCanOpenChat/3",
            ),
            resolveVariantMethod(
                checkCanOpenChat4WebFingerprint,
                checkCanOpenChat4NormalFingerprint,
                CheckCanOpenChat4Normal1311Fingerprint,
                CheckCanOpenChat4Web1311Fingerprint,
                CheckCanOpenChat4Plus1303Fingerprint,
                CheckCanOpenChat4Normal1303Fingerprint,
                CheckCanOpenChat4Web1303Fingerprint,
                CheckCanOpenChat4Web1310Fingerprint,
                CheckCanOpenChat4Plus1302Fingerprint,
                methodName = "checkCanOpenChat/4",
            ),
        ).forEach { method ->
            method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """,
            )
        }
    }
}
