# 🎨 PixivPatched

针对 Pixiv 的 [Morphe](https://morphe.software) 补丁。

[![License: GPL-3.0](https://img.shields.io/badge/License-GPL%203.0-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Target App](https://img.shields.io/badge/目标版本-Pixiv%20v6.203.0-0096FA.svg)](https://play.google.com/store/apps/details?id=jp.pxv.android)

支持版本：**6.203.0 / 6.202.1**。

---

## 添加到 Morphe

<a href="https://morphe.software/add-source?github=Piracola/Pixiv-Patched">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

---

## 功能说明

| 补丁 | 作用 |
| :--- | :--- |
| 🤖 **AI Work Flagger** | 依据 `illustAiType` 字段识别 AI 作品：缩略图变暗加 `[AI]` 角标或直接隐藏、详情页横幅与标题标签、可自动屏蔽 AI 作者或按标签黑名单过滤。显示选项可在 Pixiv-Patched 页调整。 |
| 🚫 **Adblocker** | 隐藏底栏横幅广告、AppLovin 插屏、评分弹窗，以及信息流和插画详情页的推广作品。 |
| 📥 **Downloader** | 详情页加保存按钮，原图下载到 `Pictures/Pixiv`，文件名含作品 ID、标题、作者；多页作品可选页。Android 9 及以下存到 App 私有目录（存储路径会显示在提示里）。 |
| ⭐ **Premium Features** | 模拟客户端会员状态，解除屏蔽标签数量上限。 |
| 🕘 **Browsing History** | 在本机记录打开过的插画、漫画和小说，并接管 Pixiv 的浏览记录页（漫画/小说分两页）。 |
| 🏠 **Drawer Entry** | 侧边栏增加「Pixiv-Patched」入口。页面里放着 AI 显示设置、热门搜索排序和收藏数门槛三项可调项，另显示各补丁状态和本地浏览记录。 |
| 🔥 **Popular Search Trial** | 锁定试用期的 7 天倒计时，试用账号一直留在热门标签页。无试用资格的免费账号不受影响。 |
| 🧪 **Popular Search Unlock** | 伪造搜索页会员标志。服务端仍对免费账号按时间返回。 |
| 🔎 **Search Ranking** | 把热门标签页换成 Pixiv 免费热度预览接口的结果（约 30 件）。可在 Pixiv-Patched 页切换开关。 |
| 💮 **Bookmark Threshold** | 在客户端筛掉收藏数不足的搜索结果，不够一页时自动补页。可在 Pixiv-Patched 页调数值。 |
| 🌑 **OLED Dark Theme** | 暗色主题的表面/背景色改写为纯黑 `#000000`。 |
| 🖼️ **Enhanced Viewer** | 全屏查看器用标准图占位，原图加载期间即可缩放拖动，加载完成无缝切换。 |
| 📋 **Novel Text Copy** | 解锁小说正文/简介/系列说明的文字选中，阅读器菜单加「复制标题」「复制作者」「下载全文」（存到下载目录）。 |

装好后能在 App 内调整的只有这三项（AI 显示设置、热门搜索排序、收藏数门槛）。其余补丁在 Morphe Manager 里选定后就固定了，App 内没有开关。

补丁大体互相独立。三个热度搜索补丁作用在同一处判断上：**Search Ranking** 需要在免费账号下发出「热门度顺序」请求，会自动带上 **Popular Search Unlock**；会员标志被钉成 true 后，**Popular Search Trial** 的试用流程就不再触发。

---

## 补丁列表

<!-- PATCHES_START EXPANDED -->
> **[v1.7.2](https://github.com/Piracola/Pixiv-Patched/releases/tag/v1.7.2)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;13 patches total
<details open>
<summary>📦 Pixiv&nbsp;&nbsp;•&nbsp;&nbsp;13 patches</summary>
<br>

**Package name:** `jp.pxv.android`

**🎯 Supported versions:**

| 6.202.1 | 6.203.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Pixiv AI Work Flagger](#pixiv-ai-work-flagger) | Identifies AI-generated works from Pixiv's illustAiType field, dims their thumbnails with an [AI] badge or hides them, adds a warning banner and an [AI] title pill on the detail screen, and can auto-block AI artists or drop works whose tags match a blacklist. Adjustable in the Pixiv-Patched page. |  |
| [Pixiv Adblocker](#pixiv-adblocker) | Removes the bottom banner frame on every screen, blocks AppLovin interstitials, suppresses rate-this-app dialogs, and hides sponsored works in feeds and on the illustration detail screen. |  |
| [Pixiv Bookmark Threshold](#pixiv-bookmark-threshold) | Drops works below the chosen bookmark count from search results on the device, for illusts and novels alike, and tops a short page up from the following pages so it does not turn blank. The request itself is left alone, so the floor works with search words in any language. Adjustable in the Pixiv-Patched page. |  |
| [Pixiv Browsing History](#pixiv-browsing-history) | Records the illustrations, manga and novels opened in the app into a history kept on the device, and takes over Pixiv's history screen with it (manga and novels on separate tabs). |  |
| [Pixiv Downloader](#pixiv-downloader) | Adds a save button to the illustration and manga detail screen that writes the original artwork to Pictures/Pixiv, named after the work id, title and author. Android 9 and older save into the app's private folder. |  |
| [Pixiv Enhanced Viewer & Instant Zoom](#pixiv-enhanced-viewer-instant-zoom) | Shows the standard-resolution artwork as an instant placeholder while the full-resolution image loads, so pinch-to-zoom and panning work right away and keep their position when the full image replaces the placeholder. |  |
| [Pixiv Novel Text Copy](#pixiv-novel-text-copy) | Re-enables text handling on the novel reader: long-press selection in the body, caption and series description, and a reader menu with copy title, copy author and download-full-text (title, caption, link and body saved as a .txt in Downloads). |  |
| [Pixiv OLED Dark Theme](#pixiv-oled-dark-theme) | Overrides the dark theme's surface and background colours with pure black (#ff000000). |  |
| [Pixiv Popular Search Trial](#pixiv-popular-search-trial) | Pins the 7-day popular-search trial countdown so a trial account keeps getting the trial version of the popular tab instead of falling back to the preview/paywall. Does not change what Pixiv returns for accounts without the trial. |  |
| [Pixiv Popular Search Unlock](#pixiv-popular-search-unlock) | Fakes the premium flag in the search pager so the app asks for popular_desc. Pixiv still answers a free account with date order. |  |
| [Pixiv Premium Features](#pixiv-premium-features) | Emulates client-side Pixiv Premium membership status and removes the mute list limits. |  |
| [Pixiv Search Ranking](#pixiv-search-ranking) | Fills the Popular search tab on a free account with Pixiv's free popularity preview (about 30 illusts or novels), for both illust and novel search. Adjustable in the Pixiv-Patched page. |  |
| [Pixiv-Patched Drawer Entry](#pixiv-patched-drawer-entry) | Adds a Pixiv-Patched item to Pixiv's home drawer. The page it opens holds the AI work display settings, the popular-search ranking and the bookmark threshold, shows the state of the other patches, and lists the browsing history kept on this device. |  |

</details>

<!-- PATCHES_END -->

---

## 已知限制

- **Premium Features 是纯客户端的**，服务端权益（会员专属下载、更高分辨率等）不受影响。
- **热度排序由服务端决定**：免费账号的 `popular_desc` 会被忽略。Search Ranking 换成 Pixiv 自己的免费热度预览接口，只有约 30 条、不能翻页；
- **Adblocker 是界面层隐藏**，广告 SDK 仍在运行，仍可能发出请求。
- **Browsing History** 分漫画/小说两个标签页，背后是同一份本地列表，共保留最近 200 条。
- **AI 标记**依赖 `illustAiType`，只有上传时勾选 AI 的作品才有这个值，可用标签黑名单兜底。
- **小说正文是 WebView**，「可选中」靠注入样式实现，Pixiv 改版可能失效；「下载全文」不受影响。
- **「下载全文」需 Android 10+**（写系统下载目录走 MediaStore），8/9 会提示不支持。
- **部分 Compose 文字无法选中**：作者个人页、评论正文、小说底栏操作。标题和作者名可从阅读器菜单复制。
- **小说简介里的链接会让位给选择**：「可选中」和「链接可点」只能二选一，这里优先复制；插画页简介不受影响。

---

## 自行构建

环境：JDK 21、Android SDK（compileSdk 35）。

```bash
./gradlew buildAndroid
```

产物位于 `patches/build/libs/patches-<版本号>.mpp`。

---

## 致谢

- [RookieEnough/De-Vanced](https://github.com/RookieEnough/De-Vanced) — 热度搜索解锁与插屏广告拦截（GPL-3.0）
- [MorpheApp/morphe-patches-template](https://github.com/MorpheApp/morphe-patches-template) — 项目骨架（GPL-3.0）

移植文件在文件头保留了来源说明。

---

## 许可

GNU General Public License v3.0 — 见 [LICENSE](LICENSE)。
