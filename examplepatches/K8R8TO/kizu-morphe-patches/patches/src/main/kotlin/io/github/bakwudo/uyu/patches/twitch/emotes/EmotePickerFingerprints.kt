package io.github.bakwudo.uyu.patches.twitch.emotes

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Twitch 31.3.1 obfuscated descriptors. Classes in the default package have no
// prefix — the "defpackage" folder in a jadx dump is a display convention, not
// part of the DEX type descriptor.
internal const val EMOTE_PICKER_PRESENTER_CLASS = "Loqf;"
internal const val EMOTE_PICKER_STATE_BUILDER_RETURN = "Lmtf;"
internal const val EMOTE_PICKER_EMOTE_SET = "Lesf;"
internal const val EMOTE_PICKER_SECTION = "Lqqf;"
internal const val EMOTE_PICKER_TUID = "Ltv/twitch/android/models/Tuid;"

/** `EmotePickerPresenter.G2(EmoteSet, Integer, EmotePickerSection) -> EmoteUiSet` */
internal object EmotePickerStateBuilderFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = EMOTE_PICKER_STATE_BUILDER_RETURN,
    parameters = listOf(
        EMOTE_PICKER_EMOTE_SET,
        "Ljava/lang/Integer;",
        EMOTE_PICKER_SECTION,
    ),
    custom = { _, classDef -> classDef.type == EMOTE_PICKER_PRESENTER_CLASS },
)

/** `EmotePickerPresenter.H2(Tuid, EmotePickerSection) -> void` */
internal object EmotePickerOpenFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        EMOTE_PICKER_TUID,
        EMOTE_PICKER_SECTION,
    ),
    custom = { _, classDef -> classDef.type == EMOTE_PICKER_PRESENTER_CLASS },
)
