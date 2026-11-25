package app.template.patches.telegram.content

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.CheckCanOpenChat2NormalFingerprint
import app.template.patches.telegram.CheckCanOpenChat3NormalFingerprint
import app.template.patches.telegram.CheckCanOpenChat4NormalFingerprint
import app.template.patches.telegram.CheckCanOpenChat4NormalCurrentFingerprint
import app.template.patches.telegram.CheckCanOpenChat4WebCurrentFingerprint
import app.template.patches.telegram.CheckCanOpenChat2PlusFingerprint
import app.template.patches.telegram.CheckCanOpenChat3PlusFingerprint
import app.template.patches.telegram.CheckCanOpenChat4PlusFingerprint
import app.template.patches.telegram.CheckCanOpenChat4Plus1302Fingerprint
import app.template.patches.telegram.CheckSensitiveNormalFingerprint
import app.template.patches.telegram.CheckSensitivePlusFingerprint
import app.template.patches.telegram.ShowCantOpenAlertNormalFingerprint
import app.template.patches.telegram.ShowCantOpenAlertPlusFingerprint
import app.template.patches.telegram.CheckCanOpenChat4Web1303Fingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency
import app.template.patches.telegram.Telegram1331GetRestrictionReasonNormalFingerprint
import app.template.patches.telegram.Telegram1331GetRestrictionReasonWebFingerprint
import app.template.patches.telegram.Telegram1331ShowSensitiveContentNormalFingerprint
import app.template.patches.telegram.Telegram1331ShowSensitiveContentWebFingerprint
import app.template.patches.telegram.TelegramR8GetRestrictionReasonNormalFingerprint
import app.template.patches.telegram.TelegramR8GetRestrictionReasonWebFingerprint
import app.template.patches.telegram.TelegramR8IsSensitiveNormalFingerprint
import app.template.patches.telegram.TelegramR8IsSensitiveWebFingerprint
import app.template.patches.telegram.TelegramR8ShowSensitiveContentNormalFingerprint
import app.template.patches.telegram.TelegramR8ShowSensitiveContentWebFingerprint
import app.template.patches.telegram.TelegramR8ShowCantOpenAlertNormalFingerprint
import app.template.patches.telegram.TelegramR8ShowCantOpenAlertWebFingerprint
import app.template.patches.telegram.TelegramPlusR8GetRestrictionReasonFingerprint
import app.template.patches.telegram.TelegramPlus13221R8GetRestrictionReasonFingerprint
import app.template.patches.telegram.TelegramPlusR8IsSensitiveFingerprint
import app.template.patches.telegram.TelegramPlus13221R8IsSensitiveFingerprint
import app.template.patches.telegram.TelegramPlusR8MessageObjectIsSensitiveFingerprint
import app.template.patches.telegram.TelegramPlus13221R8MessageObjectIsSensitiveFingerprint
import app.template.patches.telegram.TelegramPlusR8ShowSensitiveContentFingerprint
import app.template.patches.telegram.TelegramPlus13221R8ShowSensitiveContentFingerprint

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

        // Resolve a single complete current-R8 variant. Do not mix fingerprints
        // from Android, Web and Plus: the obfuscated owners are different even
        // where method names happen to be the same.
        val current1331Android = Telegram1331GetRestrictionReasonNormalFingerprint.methodOrNull
        val current1331Web = Telegram1331GetRestrictionReasonWebFingerprint.methodOrNull
        val normalGetRestrictionReason = current1331Android
            ?: TelegramR8GetRestrictionReasonNormalFingerprint.methodOrNull
        val webGetRestrictionReason = current1331Web
            ?: TelegramR8GetRestrictionReasonWebFingerprint.methodOrNull
        val plusGetRestrictionReason = TelegramPlus13221R8GetRestrictionReasonFingerprint.methodOrNull
            ?: TelegramPlusR8GetRestrictionReasonFingerprint.methodOrNull
        val matchedCurrentVariants = listOfNotNull(
            current1331Android?.let { "android1331" },
            current1331Web?.let { "web1331" },
            normalGetRestrictionReason?.takeIf { current1331Android == null }?.let { "android" },
            webGetRestrictionReason?.takeIf { current1331Web == null }?.let { "web" },
            plusGetRestrictionReason?.let { "plus" },
        )
        require(matchedCurrentVariants.size <= 1) {
            "Multiple current R8 Bypass Channel Restrictions variants matched: $matchedCurrentVariants"
        }
        val currentVariant = matchedCurrentVariants.singleOrNull()
        if (currentVariant == "android1331" || currentVariant == "web1331") {
            // In 13.3.1 the restriction-reason parser is H1(ArrayList)String,
            // the sensitive-content visibility gate is f5()Z. These are distinct
            // from the old controller methods; do not patch the broad chat-opening callback.
            requireNotNull(if (currentVariant == "android1331") current1331Android else current1331Web)
                .addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
            val showSensitive = if (currentVariant == "android1331")
                Telegram1331ShowSensitiveContentNormalFingerprint.methodOrNull
            else Telegram1331ShowSensitiveContentWebFingerprint.methodOrNull
            requireNotNull(showSensitive) { "Missing 13.3.1 sensitive-content visibility gate" }
                .addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            return@execute
        }
        if (currentVariant != null) {
            val getRestrictionReason = when (currentVariant) {
                "android" -> requireNotNull(normalGetRestrictionReason)
                "web" -> requireNotNull(webGetRestrictionReason)
                else -> requireNotNull(plusGetRestrictionReason)
            }
            getRestrictionReason.addInstructions(0, """
                const/4 v0, 0x0
                return-object v0
            """)

            val isSensitive = when (currentVariant) {
                "android" -> requireNotNull(TelegramR8IsSensitiveNormalFingerprint.methodOrNull) {
                    "Missing Android R8 MessagesController.isSensitive(ArrayList)Z"
                }
                "web" -> requireNotNull(TelegramR8IsSensitiveWebFingerprint.methodOrNull) {
                    "Missing Web R8 MessagesController.isSensitive(ArrayList)Z"
                }
                else -> requireNotNull(TelegramPlus13221R8IsSensitiveFingerprint.methodOrNull
                    ?: TelegramPlusR8IsSensitiveFingerprint.methodOrNull) {
                    "Missing Plus R8 MessagesController.isSensitive(ArrayList)Z"
                }
            }
            isSensitive.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)

            // Plus keeps a separate MessageObject-level restriction predicate.
            // It reads message.restriction_reason and caches the sensitive result;
            // leaving it active would still hide/blur restricted media after the
            // controller-level checks above have been bypassed. Do not touch the
            // unrelated MessageObject forwarding/send-state predicates.
            if (currentVariant == "plus") {
                requireNotNull(
                    TelegramPlus13221R8MessageObjectIsSensitiveFingerprint.methodOrNull
                        ?: TelegramPlusR8MessageObjectIsSensitiveFingerprint.methodOrNull,
                ) { "Missing Plus MessageObject.isSensitive()Z" }.addInstructions(0, """
                    const/4 v0, 0x0
                    return v0
                """)
            }

            // Do not override MessageObject.q4()/y3() or the broad controller E(...)
            // callback. DEX inspection shows q4 is a send-state predicate and y3 is
            // the imported-forward predicate; E participates in normal message actions.
            // They are not restriction gates and their old constant returns broke
            // normal share-with-comment / forwarding flows.

            val showSensitiveContent = when (currentVariant) {
                "android" -> requireNotNull(TelegramR8ShowSensitiveContentNormalFingerprint.methodOrNull) {
                    "Missing Android R8 showSensitiveContent()Z"
                }
                "web" -> requireNotNull(TelegramR8ShowSensitiveContentWebFingerprint.methodOrNull) {
                    "Missing Web R8 showSensitiveContent()Z"
                }
                else -> requireNotNull(TelegramPlus13221R8ShowSensitiveContentFingerprint.methodOrNull
                    ?: TelegramPlusR8ShowSensitiveContentFingerprint.methodOrNull) {
                    "Missing Plus R8 showSensitiveContent()Z"
                }
            }
            showSensitiveContent.addInstructions(0, """
                const/4 v0, 0x1
                return v0
            """)

            if (currentVariant != "plus") {
                val showCantOpenAlert = if (currentVariant == "android") {
                    requireNotNull(TelegramR8ShowCantOpenAlertNormalFingerprint.methodOrNull) {
                        "Missing Android R8 showCantOpenAlert(String, ActionBar)"
                    }
                } else {
                    requireNotNull(TelegramR8ShowCantOpenAlertWebFingerprint.methodOrNull) {
                        "Missing Web R8 showCantOpenAlert(String, ActionBar)"
                    }
                }
                showCantOpenAlert.addInstructions(0, "return-void")
            }

            return@execute
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
            ShowCantOpenAlertNormalFingerprint,
            ShowCantOpenAlertPlusFingerprint,
            showCantOpenAlertPlusFingerprint,
            methodName = "showCantOpenAlert",
        ).addInstructions(0, "return-void")

        checkChannelErrorFingerprint.method.addInstructions(0, "return-void")

        resolveVariantMethod(
            checkSensitiveWebFingerprint,
            checkSensitiveNormalFingerprint,
            CheckSensitiveNormalFingerprint,
            CheckSensitivePlusFingerprint,
            checkSensitivePlusFingerprint,
            methodName = "checkSensitive",
        ).addInstructions(
            0,
            """
                if-eqz p4, :morphe_check_sensitive_skip
                invoke-interface {p4}, Ljava/lang/Runnable;->run()V
                :morphe_check_sensitive_skip
                return-void
            """,
        )

        listOf(
            resolveVariantMethod(
                checkCanOpenChat2WebFingerprint,
                checkCanOpenChat2NormalFingerprint,
                CheckCanOpenChat2NormalFingerprint,
                CheckCanOpenChat2PlusFingerprint,
                checkCanOpenChat2PlusFingerprint,
                methodName = "checkCanOpenChat/2",
            ),
            resolveVariantMethod(
                checkCanOpenChat3WebFingerprint,
                checkCanOpenChat3NormalFingerprint,
                CheckCanOpenChat3NormalFingerprint,
                CheckCanOpenChat3PlusFingerprint,
                checkCanOpenChat3PlusFingerprint,
                methodName = "checkCanOpenChat/3",
            ),
            resolveVariantMethod(
                checkCanOpenChat4WebFingerprint,
                checkCanOpenChat4NormalFingerprint,
                CheckCanOpenChat4NormalCurrentFingerprint,
                CheckCanOpenChat4WebCurrentFingerprint,
                CheckCanOpenChat4PlusFingerprint,
                CheckCanOpenChat4Web1303Fingerprint,
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
