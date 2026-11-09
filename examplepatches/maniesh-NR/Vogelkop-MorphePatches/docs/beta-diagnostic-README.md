# Opera Beta Crash Diagnostic Pack — Bisection Testing

This directory contains diagnostic builds of Opera Beta 104.0.5262.91143
(arm64+v7a bundle, versioncode 1910404306). All were built from the SAME
original APKMirror .apkm and the SAME Morphe Desktop CLI; the only difference
between them is which patches were applied.

## v1.2.3 update (2026-11-08)

The signature spoof was redesigned after a code review against five community
Morphe patch collections: it now redirects every signature-reading call site
in the app (158 sites in Beta: 143× `getPackageInfo`, `hasSigningCertificate`,
`getApkContentsSigners`, `getSigningCertificateHistory`, `hasMultipleSigners`)
to a helper that presents the original certificate — deterministic and
reflection-free — with the `PackageInfo.CREATOR` parcel proxy kept only as a
hardened fallback. The parcel-proxy body can no longer fail a binder
transaction, and the racy wholesale clearing of Parcel's creator caches was
replaced with a targeted eviction.

**`opera-beta-DIAG1-sigonly-v123.apk` replaces the old DIAG1** — if the
crash is related to signature spoofing in any way, this build should behave
differently from the v1.2.2 one. DIAG00/DIAG0/DIAG2 are unchanged (their
patches did not change) and remain valid test points.

## How to test (install in order, open once after each)

**Uninstall any installed Opera Beta first (including patched builds).**
Uninstall again between tests. The Play Protect "app hasn't been seen before"
prompt during install is NORMAL for every self-signed sideload — choose
"install anyway" / scan; it is unrelated to the crash.

| Order | File | Patches | What it tests |
|---|---|---|---|
| 1 | `opera-beta-DIAG00-pure-rebuild.apk` | **Zero patches** (pure Morphe rebuild + re-sign) | The rebuild pipeline itself + whether this .apkm runs on your device at all |
| 2 | `opera-beta-DIAG1-sigonly-v123.apk` | Only "Spoof app signature" (v1.2.3 two-layer design) | The redesigned signature-spoof extension |
| 3 | `opera-beta-DIAG2-nosig.apk` | All 6 others, no signature spoof | The bytecode patches (ad modules / SQL / dialog / boot / analytics / whitelist) |
| 4 | (existing) `../opera-beta-104.0.5262-patched-v1.2.3.apk` | All 7 | The full v1.2.3 build |

## Interpreting results

- **Test 1 already crashes** → the problem is in NO patch: either this .apkm
  variant doesn't run on your device, or the Morphe rebuild itself is
  incompatible with Beta 104. Next step: re-patch from an opera.com direct
  APK instead of the APKMirror bundle.
- **1 passes, 2 crashes** → the culprit is still the signature spoof even in
  the new design — that would be extremely valuable to know (tell me, and
  also grab `adb logcat -b crash`).
- **1–2 pass, 3 crashes** → the culprit is one of the 6 bytecode patches.
  Tell me — I'll ship 6 single-patch builds for a second bisection round.
- **All pass, only the full build crashes** → a combination effect. Tell me
  which two passed and I'll target the interaction.
- **Everything passes now** → the v1.2.3 redesign fixed it. Enjoy!

## How to report

Just tell me crash/no-crash per test, e.g. `1 OK, 2 crash, —, —`.
If you have a PC, the fastest path is a crash stack instead:

    adb logcat -b crash

Open Opera Beta, let it crash once, and paste the output to me.

## Build provenance

- Input Beta .apkm SHA-256:
  `bdc02299e88ac7c106f4d28b6125d79108736c4cbeee58c220c4ca2f19b86326`
- Patch bundle v1.2.3 SHA-256: see `../SHA256SUMS-v1.2.3.txt` / the release
  page.

Verified on DIAG1-v123: extension present in the patched dex, all
placeholders replaced (real package name + official Opera certificate),
OperaApplication re-parented to the hook class, 158 signature-reading call
sites redirected, zero placeholders remaining.
