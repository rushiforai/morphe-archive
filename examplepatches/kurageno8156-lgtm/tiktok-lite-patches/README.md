# TikTok Lite Patches

<img src="assets/tiktok-lite-neon-icon.svg" width="180" alt="TikTok Lite neon icon" />

Morphe patches for TikTok Lite.

## How to use

Add this source to Morphe: https://morphe.software/add-source?github=kurageno8156-lgtm/tiktok-lite-patches

## Supported app

- Package: `com.ss.android.ugc.tiktok.lite`
- Version: `43.5.3`

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.4.2](https://github.com/kurageno8156-lgtm/tiktok-lite-patches/releases/tag/v1.4.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;13 patches total
<details open>
<summary>📦 com.ss.android.ugc.tiktok.lite&nbsp;&nbsp;•&nbsp;&nbsp;12 patches</summary>
<br>

**🎯 Supported versions:**

| 43.5.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable Auto Scroll](#enable-auto-scroll) | TikTok Liteの自動スクロール機能を有効化します |  |
| [Feed Filter & Hide Ads](#feed-filter-hide-ads) | 広告・LIVE 判定抑制 |  |
| [Force show Auto scroll](#force-show-auto-scroll) | TikTok Lite 43.5.3の自動スクロール機能ゲートと表示ゲートを強制的に有効化します |  |
| [Hide Shop / Promo UI](#hide-shop-promo-ui) | ショップ入口抑制 |  |
| [Playback Speed](#playback-speed) | 速度メニュー解放。speed_list 等を強制（8倍リスト自体は別途配列改変が必要） |  |
| [Remember Clear Display](#remember-clear-display) | クリア表示の維持補助 |  |
| [Remove Splash Ads](#remove-splash-ads) | TikTok Liteのスプラッシュ広告を削除します |  |
| [Remove Watermark](#remove-watermark) | without_watermark / with_watermark / add_watermark を 43.5.3 実文字列で強制 |  |
| [SIM Spoof / Region Unlock](#sim-spoof-region-unlock) | リージョンゲート緩和 |  |
| [Settings Hook Stub](#settings-hook-stub) | 設定フック検出スタブ |  |
| [Show Seekbar](#show-seekbar) | シークバー常時表示（43.5.3 実文字列対応） |  |
| [Unlimited Downloads](#unlimited-downloads) | allow_download を強制 true（43.5.3 確認済み文字列） |  |

</details>

<details open>
<summary>📦 XYZ app&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.0.0 | 1.0.2 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Example Patch](#example-patch) | Example patch to start with. |  |

</details>

<!-- PATCHES_END -->

## Build

```bash
./gradlew buildAndroid
```

The built patch bundle is generated under `patches/build/libs/`.

## Icon artwork

The repository icon artwork is at [assets/tiktok-lite-neon-icon.svg](assets/tiktok-lite-neon-icon.svg).