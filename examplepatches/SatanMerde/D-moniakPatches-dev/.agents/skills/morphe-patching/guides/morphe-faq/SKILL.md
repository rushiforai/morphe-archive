---
name: morphe-faq-and-app-notes
description: Morphe FAQ, current pinned official app targets, and app-specific notes. Use when answering capability, supported-version, or app-format questions; verify live source before promising support.
---

# Morphe FAQ & App Notes

Pinned official patches revision: `92dd0ef86d12e1806152b454486269983b8db139`
(recorded 2026-09-29). Upstream targets change frequently; inspect the current bundle/source or run
`list-versions` before directing a user to download an APK.

## Official targets at the pinned revision

| App | Package | Stable targets | Experimental targets | Input type |
|---|---|---|---|---|
| YouTube | `com.google.android.youtube` | 21.16.256, 21.13.164, 20.31.42, 20.21.37 | 21.38.123, 21.37.42, 21.28.208 | `APK_REQUIRED` |
| YouTube Music | `com.google.android.apps.youtube.music` | 9.15.51 | 9.37.54, 9.36.50, 9.35.54 | `APK_REQUIRED` |
| Reddit | `com.reddit.frontpage` | 2026.14.0, 2026.04.0 | 2026.38.0, 2026.37.0, 2026.24.0 | `APKM` |

Reddit compatibility also has a legacy inclusion for 2024.02.0 in patches that explicitly use it.

## App-specific notes

- Non-root YouTube/YouTube Music account login generally requires the compatible MicroG-RE/GmsCore
  support patch and companion app.
- Reddit is distributed as an APKM split container; preserve and patch the complete container.
- Re-signing can break signature-bound Google or vendor APIs unless a dedicated compatibility patch
  exists. This is app/feature specific, not a claim that every Google login always fails.
- Server-validated credits, purchases, account state, and attestation cannot be solved by a local
  client patch.
- Pre-patched APKs from unknown third parties are unsafe; patch a trusted original yourself.

## Current CLI checks

```bash
java -jar morphe-cli.jar list-versions --patches patches.mpp
java -jar morphe-cli.jar list-patches --patches patches.mpp \
  --filter-package-name com.google.android.youtube --with-packages --with-versions
```

Add `--include-experimental` only when the user accepts experimental targets.

## Key URLs

- Website: https://morphe.software
- MicroG: https://morphe.software/microg
- Official patches: https://github.com/MorpheApp/morphe-patches
- Patch issues: https://github.com/MorpheApp/morphe-patches/issues
