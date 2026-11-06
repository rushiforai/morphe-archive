// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/rustore/background/Fingerprints.kt.
package app.ru_apps.rustore_jl4ctuk.background

import app.morphe.patcher.Fingerprint

/** Auto-start provider for the process-wide connectivity callback. */
object NetworkStateListenerProviderCreateFingerprint : Fingerprint(
    definingClass = "Lru/mail/network/NetworkStateListenerProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList(),
)

/** Registers the process-wide default-network callback. */
object NetworkCallbackStateProviderInitFingerprint : Fingerprint(
    definingClass = "Lru/mail/network/NetworkCallbackStateProvider;",
    name = "init${'$'}network_sdk_release",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/**
 * Starts RuStore's foreground VPN-based Connect session.
 * `definingClass` moved from `Lnd1/m;` (now an unrelated Retrofit-API lambda
 * bridge for `ConnectSessionConfigV1Api`) to `Lrd1/t;`
 * (`ConnectSessionLauncherImpl.kt`) - confirmed via live decompile (2026-10)
 * by matching the `startForegroundService` body, not just the method shape.
 */
object ConnectSessionLauncherStartFingerprint : Fingerprint(
    definingClass = "Lrd1/t;",
    name = "start",
    returnType = "V",
    parameters = emptyList(),
)

/** Service entry point kept inert for root-mount installations. */
object ConnectSessionServiceStartFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/connect/session/impl/presentation/ConnectSessionService;",
    name = "onStartCommand",
    returnType = "I",
    parameters = listOf(
        "Landroid/content/Intent;",
        "I",
        "I",
    ),
)

// ConnectSessionService's letter-named methods (a/b/c/.../e below) are
// reassigned by R8 on every rebuild - a live decompile (2026-10) confirmed,
// by matching each method's body (not just its shape) against the old
// fingerprints, that the three methods below rotated: the old "a" (protect,
// Z, [I]) is now "b", the old "b" (tunnel, ParcelFileDescriptor, no params)
// is now "c", and the old "e" (external-VPN check, Boolean, no params) is
// now "a".

/** Establishes the TUN interface used by a Connect session. */
object ConnectSessionEstablishTunnelFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/connect/session/impl/presentation/ConnectSessionService;",
    name = "c",
    returnType = "Landroid/os/ParcelFileDescriptor;",
    parameters = emptyList(),
)

/** Exempts a socket from RuStore's VPN tunnel. */
object ConnectSessionProtectSocketFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/connect/session/impl/presentation/ConnectSessionService;",
    name = "b",
    returnType = "Z",
    parameters = listOf("I"),
)

/** Detects whether another application's VPN is active. */
object ConnectSessionExternalVpnCheckFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/connect/session/impl/presentation/ConnectSessionService;",
    name = "a",
    returnType = "Ljava/lang/Boolean;",
    parameters = emptyList(),
)

/** Handles downloads routed through the disabled Connect VPN session. */
object ConnectDownloadWorkerFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/connect/session/impl/presentation/ConnectDownloadWorker;",
    name = "b",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lyt0/e;"),
)
