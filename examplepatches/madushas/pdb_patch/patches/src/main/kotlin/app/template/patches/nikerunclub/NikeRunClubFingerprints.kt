package app.template.patches.nikerunclub

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for Nike Run Club 4.80.0 (versionCode 1717895889), package
 * `com.nike.plusgps`.
 *
 * NRC is a large native Kotlin/Compose app (16 dex) built on Nike's own
 * `com.nike.mpe.*` platform modules. Unlike the fully-obfuscated consumer apps,
 * the platform-module class and method names are **kept** (Nike ships keep rules
 * for its plugin surface), so these anchors are real dex names — re-verify them on
 * every app update (a module refactor can rename them).
 */

/**
 * `DefaultDesignManager.useDarkMode()Z` — the single gate behind NRC's colour mode.
 *
 * The real body is `allowDarkMode && (forceDarkMode || systemDarkMode)`:
 *  - `allowDarkMode` comes from a **remote configuration flag** (off by default),
 *  - `forceDarkMode` is a user/forced override,
 *  - `systemDarkMode` mirrors the system `uiMode` (set by an activity-lifecycle observer).
 *
 * `getColorMode()` returns `ColorMode.Dark` when this is `true` and `ColorMode.Light`
 * otherwise, and every Compose design provider reads that static colour mode. So the
 * app already ships a complete dark theme — it is just switched off remotely. Forcing
 * this method to `true` turns the whole Compose surface dark.
 */
val NrcUseDarkModeFingerprint = Fingerprint(
    definingClass = "Lcom/nike/mpe/capability/design/implementation/internal/DefaultDesignManager;",
    name = "useDarkMode",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Adobe Experience Platform `MobileCore.registerExtensions(List, AdobeCallback)V` —
 * the single entry point through which NRC's Adobe (Omniture) analytics extensions
 * (Edge, Identity, Analytics, Optimize, Assurance) are registered. NRC calls it once,
 * from `DefaultAdobeIdentityWrapper.<init>`. No-op'ing it means no Adobe extension ever
 * registers, so no Adobe telemetry is collected or dispatched.
 */
val NrcAdobeRegisterExtensionsFingerprint = Fingerprint(
    definingClass = "Lcom/adobe/marketing/mobile/MobileCore;",
    name = "registerExtensions",
    returnType = "V",
    parameters = listOf(
        "Ljava/util/List;",
        "Lcom/adobe/marketing/mobile/AdobeCallback;",
    ),
)
