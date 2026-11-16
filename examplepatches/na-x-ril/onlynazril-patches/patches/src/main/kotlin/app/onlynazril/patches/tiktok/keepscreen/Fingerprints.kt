package app.onlynazril.patches.tiktok.keepscreen

import app.morphe.patcher.Fingerprint

/**
 * Anchors for the keep-screen patch.
 *
 * `BaseActivity` is the real-named ByteDance base every TikTok screen extends, and its lifecycle
 * overrides keep their names; only the method pair matters, so no obfuscated type is written down.
 */
internal object BaseActivityOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/ies/foundation/activity/BaseActivity;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * The pause side. On 47.7.3 the override is a two-instruction wrapper that forwards to a `twin`
 * method; the wrapper is the one the framework calls, so it is the one hooked.
 */
internal object BaseActivityOnPauseFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/ies/foundation/activity/BaseActivity;",
    name = "onPause",
    returnType = "V",
    parameters = emptyList(),
)
