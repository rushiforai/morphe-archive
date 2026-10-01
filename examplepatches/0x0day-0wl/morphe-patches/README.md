# 0x0day-0wl's patches

A [Morphe](https://morphe.software) patch bundle.

Trimmed fork of [riky-dev/morphe-patches](https://github.com/riky-dev/morphe-patches), which is
built on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
Credit for the framework and the original patches goes to those projects.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v2.1.0](https://github.com/0x0day-0wl/morphe-patches/releases/tag/v2.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Chefkoch&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 8.4.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ads](#remove-ads) | Hides banner, native, interstitial and sponsored ad tiles by treating the user as ad-free, the same state a Chefkoch PLUS subscriber has. Also skips the ad-consent (CMP) prompt. |  |
| [Remove analytics](#remove-analytics) | Drops Firebase Analytics events and user properties before they leave the app. Other telemetry (Snowplow, Audix) is handled by the Remove tracking patch. |  |
| [Remove tracking](#remove-tracking) | Neuters the app tracking middleware: no Snowplow events, no Admo Audix targeting and no Firebase tracking state changes are processed. |  |

</details>

<!-- PATCHES_END -->

## Install

Add this source to Morphe:

https://morphe.software/add-source?github=0x0day-0wl/morphe-patches

Then patch and install through Morphe Manager, or build the `.mpp` yourself:

```bash
make build
# same as: ./gradlew :patches:buildAndroid
```

The bundle is written to `patches/build/libs/`. Apply it with
[Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) or Morphe Manager.

## License

GPL-3.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).
