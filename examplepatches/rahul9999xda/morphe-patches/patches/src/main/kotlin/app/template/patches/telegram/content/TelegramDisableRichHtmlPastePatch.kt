package app.template.patches.telegram.content

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.ChatActivityEnterViewHandleRichHtmlPasteFingerprint
import app.template.patches.telegram.ChatActivityEnterViewRichHtmlPastePlusFingerprint
import app.template.patches.telegram.ChatActivityEnterViewRichHtmlPasteCurrentFingerprint
import app.template.patches.telegram.ChatActivityEnterViewRichHtmlPasteTelegram1303Fingerprint

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
        // Current Telegram/Web 13.1.1 and Plus 13.1.1.0: only intercept the Android Paste menu item
        // (0x01020022), then delegate directly to the same superclass that the
        // original method uses for its non-rich-HTML fallback. All other menu
        // actions continue through the original method unchanged.
        val currentTargets = listOf(
            // Current Telegram/Web and the matching historical Web descriptor share `of`;
            // both invoke Components/mg for the normal paste fallback.
            ChatActivityEnterViewRichHtmlPasteCurrentFingerprint to
                "Lorg/telegram/ui/Components/mg;",
            // Plus current/legacy versions share qh0(I)Z; preserve its explicit EditText fallback.
            ChatActivityEnterViewRichHtmlPastePlusFingerprint to
                "Landroid/widget/EditText;",
            // Telegram 13.0.3 uses a different owner and superclass.
            ChatActivityEnterViewRichHtmlPasteTelegram1303Fingerprint to
                "Lorg/telegram/ui/Components/lg;",
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
                    if-ne p1, v0, :morphe_rich_html_paste_continue
                    invoke-super {p0, p1}, $superClass->onTextContextMenuItem(I)Z
                    move-result p1
                    return p1
                    :morphe_rich_html_paste_continue
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
