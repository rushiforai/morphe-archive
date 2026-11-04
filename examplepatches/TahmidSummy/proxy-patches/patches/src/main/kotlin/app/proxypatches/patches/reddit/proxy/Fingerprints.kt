package app.proxypatches.patches.reddit.proxy

import app.morphe.patcher.Fingerprint

/** Earliest app code that runs: start the forwarder here, before any network client exists. */
internal object ApplicationAttachBaseContextFingerprint : Fingerprint(
    definingClass = "Lcom/reddit/frontpage/FrontpageApplication;",
    name = "attachBaseContext",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * Chromium (Cronet) pushes Android's system proxy (none) into its native network stack whenever
 * a PROXY_CHANGE broadcast arrives, which switches Cronet to direct connections and QUIC.
 * The method takes Chromium's (obfuscated) ProxyConfig object.
 */
internal object CronetProxySettingsChangedFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/net/ProxyChangeListener;",
    name = "proxySettingsChanged",
    returnType = "V",
    parameters = listOf("L"),
)

/** Google Play Services' copy of Cronet (used by reCAPTCHA) can't be patched, so disable it. */
internal object PlayServicesCronetProviderIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/net/PlayServicesCronetProvider;",
    name = "isEnabled",
    returnType = "Z",
    parameters = listOf(),
)
