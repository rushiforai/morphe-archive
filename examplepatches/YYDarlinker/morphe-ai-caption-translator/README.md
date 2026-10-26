# Anchored AI Captions

**Translate YouTube subtitles in real time using your own OpenAI-compatible API.** This independent, open-source patch bundle works with Morphe and adds configurable captions to regular videos, full-screen playback and Shorts.

[中文说明](docs/README.zh-CN.md) · [Add to Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator) · [Releases](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases) · [Report a problem](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues)

## What's new in 1.5.8

- Keeps AI on/off, native CC and native language selection in their own roles, with stronger video/session ownership and re-entry handling.
- Honors server retry deadlines, including date-form Retry-After, and prevents retired work or page/hole repair from starting requests outside the current permission and waiting rules.
- Preserves failed configuration drafts and synchronizes settings that were actually saved; corrupted settings produce readable recovery errors without silently discarding credentials.
- Protects valid source-cache files when a replacement fails, and makes failure decisions and diagnostic provenance easier to understand.
- Removes the unused loopback server, isolates the glyph-transition state and adds reproducible verification and maintenance guidance. See the [verification scope](docs/COMPATIBILITY.md) for what was actually checked.

## What it does

- Translates a video’s existing subtitles when you select a language from YouTube’s **Auto-translate** menu while AI captions are enabled.
- Follows YouTube’s native Auto-translate list and the official Captions patch. Language choices and sorting stay in the official patch, so there is no second language list to maintain.
- Displays captions with adjustable size, background opacity and vertical position. Caption placement uses the video’s physical center, independently of the app’s LTR/RTL interface direction. Captions sit above the player controls, so the progress bar and time labels cannot cover them.
- Uses one stable caption layer across the detail page, fullscreen, Shorts and the comments sheet. Size and pagination are derived from the real video viewport; the comments sheet scales the caption continuously with its animation instead of changing it after the animation ends.
- Supports multiple API profiles, model selection, custom translation requirements, translation caching and exportable diagnostics. Its settings are localized into 14 languages.
- When the video already has its own subtitles in the language you select, shows them directly in the AI caption style without a translation request. Uploaded subtitles keep their authored line breaks, including two-row subtitles; only auto-generated subtitles have sentence breaks and page turns optimized locally.
- When a video has several subtitle tracks, translates the one in the spoken language first (human-made before automatic, then human-made English) rather than whichever track YouTube preselects.

You need a video with an available subtitle track and an API service that supports the project’s chat-completion protocol. **This is not an audio transcription service.** Original subtitle selections do not make translation API calls.

## Supported versions

| Component | Current declaration | Evidence boundary |
| --- | --- | --- |
| Official Morphe Patches / Patcher | **1.48.0 / 2.0.0** | actual local input metadata; other selections require their own checks |
| Original YouTube APK | stable target declarations: **21.20.405, 21.16.256**; experimental: **21.42.241, 21.41.525, 21.28.208, 21.23.492** | discrete list; stable labels come from metadata, not current candidate device certification |
| Android | minSdk 28; **21.42.241, 21.41.525, 21.28.208** require minSdk 29 | use the exact APK's minSdk/ABI and signature; other variants are separate inputs |

Public release remains **1.5.7**. The local **1.5.8 / local-1.5.8-m7b / candidate-02** has finite local composition evidence on **21.41.525-SECONDARY** and **21.28.208**, and is accepted for that local scope. On 2026-10-26 the user reported no issues after the manual phone checklist; a device export confirms the m7b build. The reported phone environment is Manager 2.2.0 / YouTube 21.20.405 / official 1.48.0. This is a finite user observation, with retained limits in the [first-round acceptance](docs/maintenance/reviews/M7-FINAL-ACCEPTANCE.md), not a third desktop composition, a full device matrix or official certification. The old recommendation remains a metadata choice. See [compatibility and verification boundaries](docs/COMPATIBILITY.md) and the [candidate installation checklist](docs/maintenance/M7b-DEVICE-ACCEPTANCE.md). Local diagnostic exports distinguish build expectations from `unknown` runtime official/Patcher provenance.

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
4. Adjust caption size and background using the live preview if needed. You can customize translation requirements; your custom text is preserved when the interface language changes.

The AI switch is authoritative: while it is on, YouTube’s native subtitle view is not painted; the add-on shows its own overlay (or a short empty/loading gap while the native track and target are still arriving). Turning it off returns subtitle drawing to YouTube immediately.

Turning AI off returns translation to YouTube’s native behavior. Selecting an original/manual/auto-generated source track displays its original text without translation API requests; uploaded subtitles keep their authored line breaks, while auto-generated subtitles are re-paged locally without a network call or model. Bracketed furigana readings are removed from text sent for translation to avoid repetition. The menu toggle visibility settings for regular videos and Shorts are independent of the engine switch.

### Personal model recommendation

From the models I have tried, **Qwen3.7-Flash (`qwen3.7-flash`) seems to be the cheapest option** for this patch. In my experience, its subtitle translations even outperform some of the more expensive models I have tried.

You can access it through [Alibaba Cloud Model Studio (international)](https://www.alibabacloud.com/product/modelstudio). As checked on **October 15, 2026**, the [official international pricing](https://www.alibabacloud.com/help/en/model-studio/model-pricing) for the **Singapore region, International deployment scope**, with **up to 32K input tokens per request**, is **US$0.03 per million input tokens** and **US$0.13 per million output tokens**. These are standard real-time API rates; longer requests use higher pricing tiers, and current prices are listed on the linked page.

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

<!-- PATCHES_START EXPANDED -->
> **[v1.5.8](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/tag/v1.5.8)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patch total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;21.42.241 | 🧪&nbsp;21.41.525 | 🧪&nbsp;21.28.208 | 🧪&nbsp;21.23.492 | 21.20.405 | 21.16.256 |
| :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AI caption translator](#ai-caption-translator) | Translates the selected YouTube Auto-translate language in real time through your OpenAI-compatible API. |  |

</details>

<!-- PATCHES_END -->

## Development and license

See [architecture](docs/ARCHITECTURE.md), [contributing](CONTRIBUTING.md), [development environment and commands](docs/DEVELOPMENT.md), [maintenance operations](docs/maintenance/OPERATIONS.md), and [the release process](docs/RELEASING.md). Release history belongs in [CHANGELOG.md](CHANGELOG.md).

Anchored AI Captions is independently maintained by YYDarlinker and is not an official Morphe project. Licensed under [GPLv3](LICENSE), with the retained [NOTICE](NOTICE). Morphe is referenced for compatibility only.

## Maintenance and workspace

Use the [current documentation index](docs/README.md), [workspace map](docs/WORKSPACE.md) and [first-round acceptance](docs/maintenance/reviews/M7-FINAL-ACCEPTANCE.md). The [GitHub publication and cleanup record](docs/maintenance/GITHUB-UPDATE-PLAN.md) tracks the authorized 1.5.8 release separately from local organization. Historical documents/recovered output remain traceable, and private diagnostics, source APKs, toolchains, evidence and backups stay local.
