package me.toidicakhia.patches.locket

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.resourcePatch
import me.toidicakhia.patches.shared.Constants.LOCKET_COMPATIBILITY

private const val PATCH_NAME = "Unlock Locket Gold"

/**
 * Hermes bytecode of androidGoldSubscriptionOverride() in Locket 1.247.3.
 * The compiled function reads the android_gold_subscription_override remote
 * config flag:
 *
 *   GetEnvironment r0
 *   ...
 *   LoadConstString r0, "android_gold_subscription_override"
 *   Call2 r0, getBoolean
 *   Ret r0
 *
 * Verified against the exact 1.247.3 (version code 636) XAPK. Older builds
 * compile the same function to different bytes and are intentionally unsupported.
 */
private val GOLD_OVERRIDE_METHOD =
    "2900002e000002360100015c76005102010037010202c56d730091d353000102005c00".hexToByteArray()

/** androidFeatureGatesOverride() in the same build. */
private val FEATURE_GATES_OVERRIDE_METHOD =
    "2900002e000002360100015c76005102010037010202c56d730084d353000102005c00".hexToByteArray()

@Suppress("unused")
val locketUnlockGoldPatch = resourcePatch(
    name = PATCH_NAME,
    description = "Makes the app treat the signed-in account as a Locket Gold subscriber, " +
        "enabling the Gold-only feature gates and replacing the paywall with subscription " +
        "management. Client-side only: features validated by Locket's servers still need a " +
        "real subscription.",
    default = true
) {
    compatibleWith(LOCKET_COMPATIBILITY)

    val forceFeatureGates by booleanOption(
        key = "forceFeatureGates",
        default = true,
        title = "Force feature gates",
        description = "Also stub androidFeatureGatesOverride() to true, so client-side feature " +
            "gates follow the Gold state even when Remote Config disagrees."
    )

    execute {
        val bundle = get(HERMES_BUNDLE_PATH)
        val bytecode = bundle.readBytes()
        bytecode.requireHermes96(HERMES_BUNDLE_PATH)

        bytecode.stubHermesBoolGetter(
            GOLD_OVERRIDE_METHOD,
            value = true,
            label = "androidGoldSubscriptionOverride"
        )
        if (forceFeatureGates == true) {
            bytecode.stubHermesBoolGetter(
                FEATURE_GATES_OVERRIDE_METHOD,
                value = true,
                label = "androidFeatureGatesOverride"
            )
        }
        bundle.writeBytes(bytecode)
    }
}

private fun String.hexToByteArray(): ByteArray =
    chunked(2).map { it.toInt(16).toByte() }.toByteArray()
