package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.ChatActivityEnterViewHandleRichHtmlPasteFingerprint
import app.template.patches.telegram.ChatActivityEnterViewRichHtmlPastePlus1302Fingerprint
import app.template.patches.telegram.ChatActivityEnterViewRichHtmlPastePlus1303Fingerprint
import app.template.patches.telegram.ChatActivityEnterViewRichHtmlPaste1311Fingerprint
import app.template.patches.telegram.ChatActivityEnterViewRichHtmlPasteTelegram1303Fingerprint
import app.template.patches.telegram.ChatActivityEnterViewRichHtmlPasteWeb1303Fingerprint

@Suppress("unused")
val telegramDisableRichHtmlPastePatch = bytecodePatch(
    name = "Use normal paste for Rich HTML clipboard content",
    description = "Bypasses Telegram's custom Rich HTML clipboard handling and delegates paste to the normal superclass implementation.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
    )

    execute {
        // Current Telegram/Web 13.1.1 and Plus 13.0.3.0: only intercept the Android Paste menu item
        // (0x01020022), then delegate directly to the same superclass that the
        // original method uses for its non-rich-HTML fallback. All other menu
        // actions continue through the original method unchanged.
        val currentTargets = listOf(
            // Both supplied Telegram 13.1.1 APKs declare this handler on `of`, whose
            // direct superclass is `Components/mg` in both APKs.
            ChatActivityEnterViewRichHtmlPaste1311Fingerprint to
                "Lorg/telegram/ui/Components/mg;",
            // Plus 13.0.3.0 qh0 directly extends EditTextBoldCursor, but its original fallback
            // explicitly invokes EditText.onTextContextMenuItem; preserve that bypass.
            ChatActivityEnterViewRichHtmlPastePlus1303Fingerprint to
                "Landroid/widget/EditText;",
            // Explicitly retained legacy descriptors for older builds.
            ChatActivityEnterViewRichHtmlPasteTelegram1303Fingerprint to
                "Lorg/telegram/ui/Components/lg;",
            ChatActivityEnterViewRichHtmlPasteWeb1303Fingerprint to
                "Lorg/telegram/ui/Components/mg;",
            ChatActivityEnterViewRichHtmlPastePlus1302Fingerprint to
                "Landroid/widget/EditText;",
        )
        val currentTarget = currentTargets.firstNotNullOfOrNull { (fingerprint, superClass) ->
            fingerprint.methodOrNull?.let { it to superClass }
        }

        if (currentTarget != null) {
            val (method, superClass) = currentTarget
            method.addInstructions(
                0,
                """
                    const v0, 0x1020022
                    if-ne p1, v0, :richHtmlPasteContinue
                    invoke-super {p0, p1}, $superClass->onTextContextMenuItem(I)Z
                    move-result p1
                    return p1
                    :richHtmlPasteContinue
                """,
            )
        } else {
            // Legacy releases expose the original named helper. Returning false
            // from that helper lets the caller proceed through its plain-text path.
            val legacyMethod = ChatActivityEnterViewHandleRichHtmlPasteFingerprint.methodOrNull
                ?: throw IllegalStateException(
                    "Rich HTML paste target not found: no current Telegram/Web/Plus handler or legacy handleRichHtmlPaste()Z method matched."
                )
            legacyMethod.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """,
            )
        }
    }
}
