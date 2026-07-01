# Pepper Morphe Patches

> 📦 **Also available for ReVanced** → [pepper-revanced-patches](https://github.com/PawiX25/pepper-revanced-patches) — same patch set, upstream [ReVanced Patcher](https://github.com/ReVanced/revanced-patcher) bundle for use with [ReVanced Manager](https://github.com/ReVanced/revanced-manager).

Morphe-framework port of [pepper-revanced-patches](https://github.com/PawiX25/pepper-revanced-patches).

This is a 1:1 port of the upstream ReVanced patch bundle to the
[Morphe](https://github.com/MorpheApp) patcher framework. The patch logic,
fingerprints, and every injected smali instruction are unchanged — the only
edits are package and import renames required to compile against
`app.morphe.patcher` instead of `app.revanced.patcher`. Patched APKs are
expected to be byte-equivalent to those produced by the ReVanced build.

For the full description of every patch (Hide ads, Compact deal cards,
all T1–T10 telemetry patches, dependency graph, verification commands, etc.)
see the upstream README:
https://github.com/PawiX25/pepper-revanced-patches#readme

## Supported apps

| Region | Package | App name |
|---|---|---|
| 🇵🇱 Poland | `com.tippingcanoe.pepperpl` | Pepper PL |
| 🇳🇱 Netherlands | `com.tippingcanoe.peppernl` | Pepper NL |
| 🇩🇪 Germany | `com.tippingcanoe.mydealz` | Mydealz |
| 🇬🇧 UK | `com.tippingcanoe.hukd` | HotUKDeals |
| 🇫🇷 France | `com.dealabs.apps.android` | Dealabs |
| 🇲🇽 Mexico | `com.tippingcanoe.promodescuentos` | PromoDescuentos |
| 🇪🇸 Spain | `com.chollometro` | Chollometros |
| 🇦🇹 Austria | `com.preisjaeger` | Preisjäger |
| 🇸🇪 Sweden | `se.pepperdeals` | Pepper SE |
| 🇺🇸 USA | `com.pepperdeals` | Pepper.com |

## Use with Morphe Manager

In Morphe Manager → **Sources → Patches**, add this repository as a custom
source. The release workflow publishes `patches-bundle.json` and
`patches-list.json` against every push to `main`/`dev`.

## Build from source

Requires **JDK 17** and a GitHub PAT with `read:packages` scope, exported as
`GITHUB_ACTOR` + `GITHUB_TOKEN` (the Morphe patcher dependency is hosted on
GitHub Packages). See
[Morphe patcher setup](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment).

```bash
./gradlew :patches:buildAndroid generatePatchesList
# Output: patches/build/libs/pepper-morphe-patches-<version>.mpp
```

## Mapping from upstream

| ReVanced | Morphe |
|---|---|
| `app.revanced.patcher.*` | `app.morphe.patcher.*` |
| `app.revanced.patches.pepper.*` | `app.pepper.patches.*` |
| `app.revanced.com.android.tools.smali.*` | `com.android.tools.smali.*` |
| `bytecodePatch(use = false, ...)` | `bytecodePatch(default = false, ...)` |
| `.rvp` bundle (`buildPatchBundle`) | `.mpp` bundle (`buildAndroid`) |

All patch bodies — fingerprint queries, smali stubs, register growth,
dependency graphs, every injected `const-string` / field / annotation — are
identical to upstream. Names that ship in the final DEX (e.g.
`revanced_pepper`, `revancedMockHwid`, `revanced-blocked-pepper-ocular`)
are intentionally **not** renamed, to keep the patched output byte-identical
to the ReVanced build.

## Patches

<!-- PATCHES_START -->
<!-- PATCHES_END -->

## License

[GPL-3.0](LICENSE). Patches originate from
[PawiX25/pepper-revanced-patches](https://github.com/PawiX25/pepper-revanced-patches)
(GPL-3.0). This port is not affiliated with Atolls, ReVanced, or Morphe.
