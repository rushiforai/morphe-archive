package app.template.patches.onefootball.betting

import app.morphe.patcher.Fingerprint

// The generated registry of every remote feature flag, kept by name. The Flutter side reads a flag
// through this one method (the remoteConfigValue channel): a switch on the key that answers
// "true" / "false", or the raw string for string-wrapped flags.
internal object FeatureFlagValueByKeyFingerprint : Fingerprint(
    definingClass = "Lcom/onefootball/opt/featureflag/generated/AllRemoteFeatureFlags;",
    name = "getFeatureFlagValueByFeatureFlagKeyAsString",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;"),
)

// Every native flag class (BettingCardEnabledFeatureFlagImpl, ...) reads its value through this
// one final getter; its isEnabled() is inherited, so the flag classes cannot be hooked one by one.
internal object FeatureFlagGetValueFingerprint : Fingerprint(
    definingClass = "Lcom/onefootball/opt/featureflag/AbstractFeatureFlag;",
    name = "getValue",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(),
)
