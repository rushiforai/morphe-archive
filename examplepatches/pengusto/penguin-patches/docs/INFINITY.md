# Infinity+ custom OAuth

This opt-in patch targets only the official **Infinity+ 8.3.4**, package `ml.docilealligator.infinityforreddit.plus`, versionCode **232**. Input APK SHA-256: `826d6f20476c78c52ce7a53b47d83c67e6f850be13e6eb89074fe2592f933ac6`. Source/release: https://github.com/Docile-Alligator/Infinity-For-Reddit/releases/tag/v8.3.4 (source commit `3668c0f3d39a20627319a751609b13c203a17d8f`). Standard Infinity, Patreon variants and other versions are not verified.

## Configure and patch

Choose **Configure custom OAuth for Infinity+** on the original APK. It is standalone: do not also select Breal's Spoof client or feed it an already patched APK. No APK, shared public client ID, client secret, account password, cookie or login token is distributed in the patch bundle.

Provide three values at patch time:

- `client-id`: the public Reddit installed-app OAuth client ID you are authorized to use. Do not paste a password, client secret or token.
- `redirect-uri`: the exact registered custom-scheme URI for that client. No default is supplied; query, fragment, embedded credentials and http(s) redirects are rejected. HTTPS verified app links require a different integration and are outside this patch.
- `user-agent`: the API identification string for your configured client.

These are build settings, not Reddit account credentials. Creating/approving a Reddit OAuth client remains subject to Reddit's current service requirements; the patch does not grant API approval or server-side access. OAuth consent is still handled by Reddit. Browser sign-in remains available. The patch adds no credential collection, automatic consent or CAPTCHA handling.

## Behavior

The public client-ID getter is replaced locally. Authorization and token-exchange redirects are updated across named activities and R8 root-package helpers, together with the callback manifest and AuthTab scheme. The custom API uses its configured user-agent. Infinity+'s subscription launcher is disabled and its billing-wrapper state/observer are kept at the local ready state for this custom-client setup. This does not create a Google Play purchase or a Reddit entitlement. The existing login flow, account storage and token exchange stay in use.

## Updates and settings

Morphe signs each user's patched APK. Keep the same package ID and **the same signing key** for later updates. Back up that key and export Infinity settings before migration. Another signature cannot normally update the installed APK; do not uninstall to dismiss a signature conflict without verifying your backup. Local-only data and account sessions are not guaranteed by a settings export. Changing patch sources does not itself require a new signing key.

## Validation and release gates

The normal Gradle Android bundle build succeeds. Desktop applies the complete MPP to the original APK with synthetic options. Decoded output passes billing state/observer regression, all redirect contracts, standalone client getter and user-agent checks; invalid options fail closed. See `tests/infinity/README.md` and its scripts.

Standalone runtime acceptance (2026-10-25, Android 15/API 35 ARM64 emulator): this bundle, applied alone to the original APK with a registered public installed-app client and signed with a disposable key, showed no subscription gate, opened Login from Add an account, completed Reddit OAuth, imported the account, loaded the authenticated Home feed and kept the session after force-stop and restart. Same-key settings-update acceptance, physical-device and on-device Morphe Manager execution are not yet verified. Long-duration token renewal is untested.

A transient Reddit page displayed Internal Server Error in the earlier live test; Back returned to consent, and one retry of Accept succeeded with the unchanged APK. Exact server status/cause was not captured. Do not claim the patch fixes Reddit outages or add blind retries for login/consent.

## Evidence

Android 15 / API 35 ARM64 emulator, original Infinity+ 8.3.4. Screenshots without account data are pinned to evidence commit [`8177428`](https://github.com/pengusto/penguin-patches/tree/8177428db162ed2e1a1b8de245cce479969046d3/infinity-834/2026-10-25/).

| Breal 1.4.123, billing state 4 | Penguin patch, Add an account |
| --- | --- |
| <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/infinity-834/2026-10-25/before-breal-1.4.123.png" width="280" alt="Breal 1.4.123 shows the Subscription dialog when opening Login" /> | <img src="https://raw.githubusercontent.com/pengusto/penguin-patches/8177428db162ed2e1a1b8de245cce479969046d3/infinity-834/2026-10-25/after-penguin-login.png" width="280" alt="Penguin-patched Infinity+ opens Login without a Subscription dialog" /> |

## Attribution

Infinity is by Docile Alligator and contributors. The subscription-state and redirect diagnosis was cross-checked against Breal Morphe Patches 1.4.123 and the inherited Patcheddit custom-client flow (wchill). The standalone implementation here uses the original app's getter/token exchange directly and does not bundle or depend on the Breal/Patcheddit runtime. The Breal contribution preserves upstream attribution and licensing. See repository LICENSE and NOTICE.
