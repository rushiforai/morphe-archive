/*
 * Copyright 2026 icysymmetra/tiktok-patches-for-morphe contributors
 * https://github.com/icysymmetra/tiktok-patches-for-morphe
 */
package app.morphe.patches.pinedrama.interaction.searchfeatures

import app.morphe.patcher.Fingerprint

internal object NonPersonalizedSearchGateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("enable_non_personalized_search"),
)

internal object NonPersonalizedSearchStateFingerprint : Fingerprint(
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("non_personalized_search_state_"),
)

internal object LiveSearchGateFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/android/livesdk/livesetting/feed/LiveDrawerSearchEnableSetting;",
    name = "getValue",
    returnType = "Z",
    parameters = emptyList(),
)
