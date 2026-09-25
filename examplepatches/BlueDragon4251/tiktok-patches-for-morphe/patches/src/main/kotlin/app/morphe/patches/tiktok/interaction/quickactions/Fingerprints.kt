/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.patches.tiktok.interaction.quickactions

import app.morphe.patches.tiktok.shared.discovery.TikTokFingerprint as Fingerprint

/** Legacy quick-comment experiment gate retained as a fail-soft fallback. */
internal object QuickCommentReactionGateLegacyFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("I"),
    custom = { method, classDef ->
        classDef.type == "LX/0BIZ;" && method.name == "LIZ"
    },
)

/** Exact TikTok 46.7.3 personalized/exposed emoji experiment gate. */
internal object QuickCommentReactionGateBooleanFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/comment/experiment/PersonalizedEmojiExperiment;",
    name = "LIZ",
    returnType = "Z",
    parameters = emptyList(),
)

/** Legacy quick-share experiment gate retained for older bytecode layouts. */
internal object LongPressQuickShareGateLegacyFingerprint : Fingerprint(
    returnType = "I",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == "LX/0BJV;" && method.name == "LIZ"
    },
)

internal object LongPressQuickShareGateBooleanFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == "LX/0BJV;" && method.name == "LIZ"
    },
)

/** Exact TikTok 46.7.3 provider for `im_long_press_share_button_to_quick_share`. */
internal object LongPressQuickShareProviderFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    strings = listOf("im_long_press_share_button_to_quick_share"),
)
