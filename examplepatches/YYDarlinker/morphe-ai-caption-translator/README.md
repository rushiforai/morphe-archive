# Anchored AI Captions

**Translate YouTube subtitles in real time using your own OpenAI-compatible API.** This independent, open-source patch bundle works with Morphe and adds configurable captions to regular videos, full-screen playback and Shorts.

[中文说明](docs/README.zh-CN.md) · [Add to Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator) · [Releases](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases) · [Report a problem](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues)

## What it does

- Translates a video’s existing subtitles when you select a language from YouTube’s **Auto-translate** menu while AI captions are enabled.
- Lets you add selected languages to that menu, including Simplified Chinese. This changes the available choices; it does not translate every checked language in the background.
- Displays captions with adjustable size, background opacity and vertical position. Caption placement uses the video’s physical center, independently of the app’s LTR/RTL interface direction.
- Supports multiple API profiles, model selection, custom translation requirements, translation caching and exportable diagnostics. Its settings are localized into 14 languages.
- Optionally remembers your caption selection across videos for the current app session, with or without AI translation.

You need a video with an available subtitle track and an API service that supports the project’s chat-completion protocol. **This is not an audio transcription service.** Original subtitle selections do not make translation API calls.

## Supported versions

| Component | Recommendation | Historical compatibility |
| --- | --- | --- |
| Official Morphe Patches | **1.45.0**, the latest stable release checked for this release | Compatibility scope starts at **1.42.0**; use an official version that supports your chosen YouTube APK |
| Original YouTube APK | **21.16.256** | **21.13.164**, **21.07.247** |
| Android | **9 or later** | minSdk 28 |

The recommended combination is **official 1.45.0 + YouTube 21.16.256**. YouTube 21.07.247 is a historical target in official 1.42.0/1.43.0; it is absent from the current official stable list. Do not combine an older APK with an official bundle that no longer supports it. Experimental YouTube versions are not stable compatibility claims for this addon. See [compatibility and verification boundaries](docs/COMPATIBILITY.md).

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases/latest) and enable **Expert mode** in its settings.
2. [Add Anchored AI Captions to Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator). Alternatively, add the repository URL `https://github.com/YYDarlinker/morphe-ai-caption-translator` under **Patch sources → Add → Remote**.
3. Select an **original, unpatched YouTube APK** from the supported versions above. Prefer 21.16.256.
4. Keep the compatible official default patch selection, including its captions/settings/player support. In this source’s tab, select **AI caption translator**. Select **Remember caption selection** only if you want it.
5. Let Morphe patch, sign and install the app. Follow Morphe’s GmsCore instructions if your selected official patches require it.

Do not select the old AI-caption addon or another overlapping caption-memory patch at the same time. This is an additional patch source, not a replacement for the official bundle. A downloadable `.mpp` is a patch bundle, not an installable YouTube APK.

## Configure and translate

1. Open **YouTube → Settings → Morphe → Video → AI caption translation**.
2. Set your API address, API key and model. Use **Test API** to check the configuration. You can save separate named profiles for different services.
3. Open **Automatic translation languages** in the same settings page and check the languages you want to add to YouTube’s Auto-translate list.
4. Enable AI captions. In a video’s subtitle menu, choose **Auto-translate → your target language**. That selection uses your configured AI service to translate the available source subtitles.
5. Adjust caption size and background using the live preview if needed. You can customize translation requirements; your custom text is preserved when the interface language changes.

Turning AI off returns translation to YouTube’s native behavior. Selecting an original/manual/auto-generated source track displays its original text without translation API requests. The menu toggle visibility settings for regular videos and Shorts are independent of the engine switch.

## Costs, privacy and limits

- The selected video’s subtitle text and limited surrounding context are sent to the **API provider you configure**. Translation and prefetch can consume paid tokens. This project supplies no API account or free quota.
- API keys are stored locally using Android Keystore-backed encryption. Keys are visible while you type; consider your keyboard’s privacy settings. Check exported diagnostics before sharing them: they can include video identifiers, caption text, provider responses and endpoint information, even though credentials are redacted.
- Translation quality and startup latency depend on the provider, network and available source subtitles. Source timing can be approximate; perfect audio synchronization is not guaranteed.
- Caption-selection memory lasts for the app process and resets after a full restart. Source availability and every device/OEM behavior are not guaranteed.

## Troubleshooting and updates

- **API test fails:** check the endpoint, key and model, then test again. Not every endpoint advertising OpenAI compatibility accepts the same request protocol.
- **A language is missing:** add it in Automatic translation languages, then reopen the video’s subtitle menu.
- **No captions or a long wait:** check the video’s source subtitles, your API configuration and network. Export diagnostics from AI settings and report reproducible problems [here](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues/new/choose).
- **Updating:** refresh this remote source in Morphe, then patch YouTube again with the updated source. Updating a patch bundle does not modify an already installed app. Reuse your signing setup to install an update without discarding app data.

## Available patches

<!-- PATCHES_START EXPANDED -->
> **[v1.4.0](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/tag/v1.4.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 21.16.256 | 21.13.164 | 21.07.247 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AI caption translator](#ai-caption-translator) | Translates every YouTube Auto-translate language in real time through your OpenAI-compatible API. |  |
| [Remember caption selection](#remember-caption-selection) | Remembers caption language, source/translation mode and on/off selection across videos for this app session, with or without AI. |  |

</details>

<!-- PATCHES_END -->

## Development and license

See [architecture](docs/ARCHITECTURE.md), [contributing and local builds](CONTRIBUTING.md), and [the release process](docs/RELEASING.md). Release history belongs in [CHANGELOG.md](CHANGELOG.md).

Anchored AI Captions is independently maintained by YYDarlinker and is not an official Morphe project. Licensed under [GPLv3](LICENSE), with the retained [NOTICE](NOTICE). Morphe is referenced for compatibility only.
