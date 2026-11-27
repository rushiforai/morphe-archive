package com.awt.regain.patches

import app.morphe.patcher.Fingerprint

/**
 * Fingerprint targeting [ai.blox100.feature_subscription.domain.model.SubscriptionState.isProUser].
 *
 * Original method:
 *   .method public final isProUser()Z
 *       .registers 2
 *       iget-boolean v0, p0, Lai/blox100/feature_subscription/domain/model/SubscriptionState;->isProUser:Z
 *       return v0
 *   .end method
 */
internal object IsProUserFingerprint : Fingerprint(
    definingClass = Constants.SUBSCRIPTION_STATE_CLASS,
    name = "isProUser",
    returnType = "Z",
    parameters = emptyList(),
)
