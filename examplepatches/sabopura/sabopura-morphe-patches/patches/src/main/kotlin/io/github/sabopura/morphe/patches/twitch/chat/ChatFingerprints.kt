// Adapted from Hooman's patches (GPL-3.0); see NOTICE.
package io.github.sabopura.morphe.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// The ClickableSpan put on a deleted chat message. Its boolean field gates both revealing the original
// message and drawing the placeholder as clickable. R8 renames the class, so pin it as the only
// ClickableSpan subclass with this constructor shape.
object DeletedMessageSpanCtorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Landroid/text/SpannedString;",
        "Z",
        "Ltv/twitch/android/core/mvp/viewdelegate/EventDispatcher;",
    ),
    custom = { _, classDef ->
        classDef.superclass == "Landroid/text/style/ClickableSpan;"
    },
)

// The IRC parser: one IRC line to a chat event. CLEARCHAT without a target user clears the whole chat.
object IrcEventParserFingerprint : Fingerprint(
    strings = listOf("target-user-id", "target-msg-id", " but no target-msg-id in tags found"),
)

// The formatter rebuilds a deleted-message span with the row's live EventDispatcher, but only when its
// input does not already contain one. Twitch now sends it a placeholder that has a span with a null
// dispatcher, so the existing-span fast path returns a link that cannot dispatch the reveal event.
// The exact parameter and return types uniquely identify this static formatter.
object DeletedMessageFormatterFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/text/Spanned;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Landroid/text/SpannedString;",
        "Landroid/content/Context;",
        "Ltv/twitch/android/core/mvp/viewdelegate/EventDispatcher;",
        "Z",
    ),
)

