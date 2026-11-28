# Anchored AI Captions

**Translate YouTube subtitles in real time using your own OpenAI-compatible API.** Anchored AI Captions is an independent, open-source patch bundle for Morphe that adds customizable captions to regular videos, fullscreen playback and Shorts.

[中文说明](docs/README.zh-CN.md) · [Add to Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator) · [Releases](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases) · [Report a problem](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues)

<a id="ai-caption-translator"></a>

## What it does

- Follows YouTube’s native **Auto-translate** menu and the official **Captions** patch for language selection. If the video already has subtitles in that language, or you select an original track, it displays the existing text without calling your API. Uploaded subtitles keep their original line breaks.
- Lets you adjust caption size and background opacity. Long-press and drag the caption box to place it where you want. On regular videos, it moves above the bottom seekbar and playback controls when they appear, then returns to your saved position when they hide.
- Adjusts the caption layout to the available video area, including when the Shorts comments sheet opens.
- Uses rounded Morphe-style settings dialogs and supports 14 languages. You can switch, rename and delete API profiles directly in the list, and set an endpoint, key and model for each profile.

You need a video with an available subtitle track and an OpenAI-compatible chat-completion API. The patch translates subtitles and does not transcribe audio.

## Supported versions

Use **Morphe Manager 2.8.0+** or **Morphe Desktop 2.4.0+** alongside [official Morphe Patches 2.4.0](https://github.com/MorpheApp/morphe-patches/releases/tag/v2.4.0). Choose an original, unpatched YouTube APK for **21.30.216 (stable)** or **21.47.483 (experimental)**. See the [compatibility guide](docs/COMPATIBILITY.md) for APK requirements and tested combinations.

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases/tag/v2.8.0) or [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop/releases/tag/v2.4.0). In Manager, enable **Expert mode**.
2. In Manager, use **Add to Morphe** above or paste `https://github.com/YYDarlinker/morphe-ai-caption-translator` under **Patch sources → Add → Remote**. In Desktop, download the add-on `.mpp` from **Releases** and load it alongside the official Morphe patch bundle.
3. Select a matching original YouTube APK. Keep the official **Captions** patch selected and add **AI caption translator** from this source. Avoid other caption add-ons that overlap with it.
4. Follow Morphe’s instructions to patch, sign and install the app. Set up GmsCore if your official patch selection requires it.

## Configure and translate

1. Open **YouTube → Settings → Morphe → Video → AI caption translation**.
2. Enter your API endpoint, key and model, then select **Test API**. Save separate named profiles if you use more than one provider.
3. Enable AI captions. In the video’s subtitle menu, choose **Auto-translate → your target language**.
4. Adjust the caption size and background opacity in the preview. Long-press the caption box on the video to reposition it.

Turn off AI captions to return to YouTube’s native subtitle display.

## Costs, privacy and limits

- The selected video’s subtitles and limited context are sent to the API provider you configure. Translation and prefetch can use paid tokens. Check your provider’s prices and usage limits.
- Android Keystore encrypts API keys on your device. Review diagnostic exports before sharing them. They can include video identifiers, caption text, provider responses and endpoint information even when credentials are redacted.
- Translation quality and delay depend on the source subtitles, your network and your provider.

## Troubleshooting and updates

- If **Test API** fails, check the endpoint, key and model before trying again.
- If a language is missing, check YouTube’s native **Auto-translate** list. The official **Captions** patch manages that list.
- If captions are missing or slow to appear, check that the video has subtitles and that the API and network are available. You can export diagnostics from the AI caption settings and share a redacted copy when reporting a problem.
- To update the patch, refresh the remote source in Manager or download the new `.mpp` for Desktop, then patch YouTube again. Reuse the same signing key to install it over the existing app and keep your data.

## Available patches

The table below is generated from the latest published patch metadata.

<!-- PATCHES_START EXPANDED -->
> **[v2.0.0](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/tag/v2.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patch total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;21.47.483 | 🧪&nbsp;21.45.82 | 🧪&nbsp;21.44.528 | 🧪&nbsp;21.43.523 | 🧪&nbsp;21.42.241 | 🧪&nbsp;21.41.525 | 21.30.216 | 21.28.208 | 21.23.492 | 21.20.405 | 21.16.256 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AI caption translator](#ai-caption-translator) | Translates the selected YouTube Auto-translate language in real time through your OpenAI-compatible API. |  |

</details>

<!-- PATCHES_END -->

## Development and license

See the [development guide](docs/DEVELOPMENT.md) and the [release process](docs/RELEASING.md).

Anchored AI Captions is independently maintained by YYDarlinker and licensed under GPLv3.
