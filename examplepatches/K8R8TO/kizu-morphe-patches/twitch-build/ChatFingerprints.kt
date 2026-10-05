package io.github.bakwudo.uyu.patches.twitch.chat

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

internal object DeletedMessageSpanCtorFingerprint : Fingerprint(
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

internal object DeletedMessageFormatterFingerprint : Fingerprint(
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
