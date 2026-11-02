# Windy 51.3.2 local features

## Scope and motivation

Qualify only `com.windyty.android` 51.3.2 / 5103023, Android 12L+.
Older reference patches target 51.0.1. The runtime-interceptor approach leaves
premium-only saved settings gated during cold offline startup; old fixed strings
do not match this build. Removing the entire reset block also retains genuine
subscription-info warnings. This implementation uses app-scoped static edits.

## Contracts

- Validate original package/version/build and signer using the internal shared
  certificate helper, then the canonical original native class hash.
- Require exactly one versioned `mobile.js`, the qualified path and whole-file
  SHA-256. Validate all five unique edit sites before writing any asset.
- Adjust the local tier default, startup latch/body class, `hasAny`, local reset
  tier and tier CSS cleanup. Keep real subscription-info cleanup and original
  account/token/logout operations. Invalid cached CSS tokens cannot throw during
  reset. No account reply, weather request or purchase result is fabricated.
- Modify only `Lnb6;->b()Z`, after checking class and exact method body. Preserve
  the original body behind an early boolean return; do not shortcut its four
  callers, background scheduling or subsequent data/model checks.
- Preserve package/display identity, manifest, unrelated assets/native libraries,
  classes and splits. No runtime extension or WebView interception is introduced.
- One public default-selected policy with internal dependencies. Root mount is
  unavailable; no dependency on another app's patches or a public common option.

## Validation frame

Normal cases: default/explicit selection, pristine APKM and supported ABI inputs;
the existing catalog entries must remain unchanged. Compare outputs against a
fresh independently merged original, not an already patched scratch input.

Failing/nearby cases: cold/offline empty state, cached invalid/free/premium state,
delayed or unauthenticated account response, active tier, on-hold/paused/graced/
canceled info, logout and account switch. Check local UI, saved settings, CSS and
real cleanup separately. Run semantic replay on actual Kotlin-transformed output;
parse the full transformed asset as ESM without executing its network client.

Rejection guards: wrong package/version/build/signer, missing or ambiguous assets,
wrong asset path/hash, changed/missing native class or method, duplicate/missing
edit sites, malformed UTF-8, prior modification and reapplication. Reject before
producing a patched APK. Nonselected policy must perform no app-specific edits.

Local JUnit and release-tooling checks precede push. Required Gradle tasks and
exact-head Verify/Release artifacts must pass; record any dependency-access
limitations explicitly. Bind final APK qualification to the official MPP hash.
Build/static/offline checks are not phone startup, widget refresh or proof of
server-controlled premium weather data. Device and backend acceptance remain
separate.

## References

Independent version-specific implementation informed by the GPLv3 references:

- [Hoodles Windy patch](https://github.com/hoo-dles/morphe-patches/blob/e9c942640130c809fcb908332bf7dc56d59cf86f/patches/src/main/kotlin/hoodles/morphe/patches/windy/premium/EnablePremiumPatch.kt)
- [Doom Windy patch](https://github.com/rushiranpise/morphe-patches/blob/92c0fca0ae103a419c7fc61f9c5b8b38b7d6b82a/patches/src/main/kotlin/app/template/patches/windy/premium/UnlockPremiumPatch.kt)

The original APKM and application bundle are private validation inputs and are
not committed. Public fixtures are synthetic contracts, not application assets.
