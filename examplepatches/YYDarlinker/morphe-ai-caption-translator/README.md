# Anchored AI Captions

**Translate YouTube subtitles in real time using your own OpenAI-compatible API.** This independent, open-source patch bundle works with Morphe and adds configurable captions to regular videos, full-screen playback and Shorts.

[中文说明](docs/README.zh-CN.md) · [Add to Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator) · [Releases](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases) · [Report a problem](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues)

<a id="ai-caption-translator"></a>

## What it does

- Translates a video’s existing subtitles when you select a language from YouTube’s **Auto-translate** menu while AI captions are enabled.
- Follows YouTube’s native Auto-translate list and the official Captions patch. Language choices and sorting stay in the official patch, so there is no second language list to maintain.
- Displays captions with adjustable size, background opacity and vertical position. Caption placement uses the video’s physical center, independently of the app’s LTR/RTL interface direction. Captions sit above the player controls, so the progress bar and time labels cannot cover them.
- Uses one stable caption layer across the detail page, fullscreen, Shorts and the comments sheet. Size and pagination are derived from the real video viewport; the comments sheet scales the caption continuously with its animation instead of changing it after the animation ends.
- Supports multiple API profiles, model selection, translation caching and exportable diagnostics. Its settings are localized into 14 languages.
- When the video already has its own subtitles in the language you select, shows them directly in the AI caption style without a translation request. Uploaded subtitles keep their authored line breaks, including two-row subtitles; only auto-generated subtitles have sentence breaks and page turns optimized locally.
- When a video has several subtitle tracks, translates the one in the spoken language first (human-made before automatic, then human-made English) rather than whichever track YouTube preselects.

You need a video with an available subtitle track and an API service that supports the project’s chat-completion protocol. **This is not an audio transcription service.** Original subtitle selections do not make translation API calls.

## Supported versions

| Component | Current declaration | Evidence boundary |
| --- | --- | --- |
| Official Morphe Patches / Patcher | **2.0.0 / 2.0.0**; retained **1.48.0 / 2.0.0** combinations | see the exact compositions in the compatibility guide |
| Original YouTube APK | official 2.0.0: **21.30.216, 21.28.208, 21.23.492**; experimental: **21.43.523, 21.42.241**; retained 1.48.0 targets: **21.41.525, 21.20.405, 21.16.256** | finite declarations; experimental status is preserved; device acceptance is separate |
| Android | minSdk 28; **21.28.208 and newer declared targets** require minSdk 29 | use the exact APK's minSdk/ABI and signature; other variants are separate inputs |

The compatibility repair supports host bindings changed in official Morphe Patches 2.0.0. The older 1.5.9 release fails with that official bundle even when its settings screen is present. See [current state](docs/PROJECT-STATE.md) for verification and device limits.

See [Releases](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases) for downloads and changes, and [compatibility](docs/COMPATIBILITY.md) for checked combinations and limitations.

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases/latest) and enable **Expert mode** in its settings.
2. [Add Anchored AI Captions to Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator). Alternatively, add the repository URL `https://github.com/YYDarlinker/morphe-ai-caption-translator` under **Patch sources → Add → Remote**.
3. Select an **original, unpatched YouTube APK** from the declared list, matching the official bundle; check its exact variant and evidence in the compatibility table.
4. Keep the compatible official default patch selection, including its captions/settings/player support. In this source’s tab, select **AI caption translator**. Caption language is owned by YouTube’s native menu and the official Captions patch (including **Preferred caption language**); this source does not add a separate language-memory patch.
5. Let Morphe patch, sign and install the app. Follow Morphe’s GmsCore instructions if your selected official patches require it.

Do not select the old AI-caption addon or another overlapping caption patch at the same time. The official Captions patch remains the language authority; this source follows the native selection and never fabricates a target. This is an additional patch source, not a replacement for the official bundle. A downloadable `.mpp` is a patch bundle, not an installable YouTube APK.

## Configure and translate

1. Open **YouTube → Settings → Morphe → Video → AI caption translation**.
2. Set your API address, API key and model. Use **Test API** to check the configuration. You can save separate named profiles for different services.
3. Enable AI captions. In a video’s subtitle menu, choose **Auto-translate → your target language**. If the video already has subtitles in that language, they are displayed directly; otherwise, your configured AI service translates the preferred source track.
4. Adjust caption size and background using the live preview if needed.

The AI switch is authoritative: while it is on, YouTube’s native subtitle view is not painted; the add-on shows its own overlay (or a short empty/loading gap while the native track and target are still arriving). Turning it off returns subtitle drawing to YouTube immediately.

Turning AI off returns translation to YouTube’s native behavior. Selecting an original/manual/auto-generated source track displays its original text without translation API requests; uploaded subtitles keep their authored line breaks, while auto-generated subtitles are re-paged locally without a network call or model. Bracketed furigana readings are removed from text sent for translation to avoid repetition. The menu toggle visibility settings for regular videos and Shorts are independent of the engine switch.

### Choosing an API provider

Use a chat-completion endpoint compatible with the request protocol, and compare translation quality, latency and the provider's current token prices on your own subtitles. The repository does not maintain a verified price ranking or guarantee a particular model's quality.

## Costs, privacy and limits

- The selected video’s subtitle text and limited surrounding context are sent to the **API provider you configure**. Translation and prefetch can consume paid tokens. This project supplies no API account or free quota.
- API keys are stored locally using Android Keystore-backed encryption. Keys are visible while you type; consider your keyboard’s privacy settings. Check exported diagnostics before sharing them: they can include video identifiers, caption text, provider responses and endpoint information, even though credentials are redacted.
- Translation quality and startup latency depend on the provider, network and available source subtitles. Source timing can be approximate; perfect audio synchronization is not guaranteed.
- Caption language is whatever YouTube’s native menu / official Captions patch selects. The addon does not keep a separate target across videos or restarts. Source availability and every device/OEM behavior are not guaranteed.

## Troubleshooting and updates

- **API test fails:** check the endpoint, key and model, then test again. Not every endpoint advertising OpenAI compatibility accepts the same request protocol.
- **A language is missing:** choose it from YouTube’s native **Auto-translate** list (the official Captions patch owns that list), then reopen the video’s subtitle menu.
- **No captions or a long wait:** check the video’s source subtitles, your API configuration and network. Export diagnostics from AI settings and report reproducible problems [here](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues/new/choose).
- **Updating:** refresh this remote source in Morphe, then patch YouTube again with the updated source. Updating a patch bundle does not modify an already installed app. Reuse your signing setup to install an update without discarding app data.

## Available patches

The section below is generated from the latest published patch metadata.

<!-- PATCHES_START EXPANDED -->
> **[v1.6.0](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/tag/v1.6.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patch total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;21.43.523 | 🧪&nbsp;21.42.241 | 🧪&nbsp;21.41.525 | 21.30.216 | 21.28.208 | 21.23.492 | 21.20.405 | 21.16.256 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AI caption translator](#ai-caption-translator) | Translates the selected YouTube Auto-translate language in real time through your OpenAI-compatible API. |  |

</details>

<!-- PATCHES_END -->

## Development and license

See [architecture](docs/ARCHITECTURE.md), [contributing](CONTRIBUTING.md), [development environment and commands](docs/DEVELOPMENT.md), [maintenance](docs/MAINTAINING.md), and [the release process](docs/RELEASING.md). Release history belongs in [CHANGELOG.md](CHANGELOG.md).

Anchored AI Captions is independently maintained by YYDarlinker and is not an official Morphe project. Licensed under [GPLv3](LICENSE), with the retained [NOTICE](NOTICE). Morphe is referenced for compatibility only.

## Maintenance and workspace

Use the [documentation index](docs/README.md), [current state](docs/PROJECT-STATE.md) and [workspace map](docs/WORKSPACE.md). Retired reports and generated disassembly are individually recoverable through [history](docs/history/README.md); private inputs and evidence stay local.