package app.template.patches.rustore.background

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

/** Starts RuStore's foreground VPN-based Connect session. */
object ConnectSessionLauncherStartFingerprint : Fingerprint(
    definingClass = "Lnd1/m;",
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

/** Establishes the TUN interface used by a Connect session. */
object ConnectSessionEstablishTunnelFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/connect/session/impl/presentation/ConnectSessionService;",
    name = "b",
    returnType = "Landroid/os/ParcelFileDescriptor;",
    parameters = emptyList(),
)

/** Exempts a socket from RuStore's VPN tunnel. */
object ConnectSessionProtectSocketFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/connect/session/impl/presentation/ConnectSessionService;",
    name = "a",
    returnType = "Z",
    parameters = listOf("I"),
)

/** Detects whether another application's VPN is active. */
object ConnectSessionExternalVpnCheckFingerprint : Fingerprint(
    definingClass =
        "Lru/vk/store/feature/connect/session/impl/presentation/ConnectSessionService;",
    name = "e",
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
