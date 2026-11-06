<div align="center">

# Bilibili Danmaku for YouTube Morphe

**在 YouTube Morphe 播放器里看哔哩哔哩弹幕。**<br>
A standalone Morphe add-on that brings Bilibili danmaku to the YouTube player on Android.

[开始安装](#从零开始安装) · [使用弹幕](#开启和使用弹幕) · [常见问题](#常见问题) · [下载补丁](https://github.com/RizkLee/morphe-bilibili-danmaku/releases/latest)

</div>

> 这是一个**社区开发的独立补丁**，不是 Morphe、YouTube 或哔哩哔哩的官方产品。补丁包只提供 Bilibili danmaku，使用时还需要官方 Morphe Patches。项目不会分发已修补的 YouTube APK。

## 能做什么？

- 在 YouTube 播放器的 Morphe 悬浮按钮栏中打开弹幕菜单，选择开启或关闭弹幕。
- 按 YouTube 视频标题搜索并匹配 B 站视频；也可自行搜索，粘贴 B 站分享文本、链接或 BV/av/番剧编号，选择分 P 或剧集。
- 查看来源视频封面与标题，点击来源卡片打开对应 B 站视频；也支持导入本地 XML 弹幕文件。
- 在播放器内调整字号、透明度、行距、滚动速度、显示区域、过滤规则，以及同步倍率和时间偏移，并实时预览样式。
- 用自己的 B 站 App 扫码 / 授权登录（可选）；登录会按 B 站官方规则自动续期，凭证由手机的 Android Keystore 加密保存在本机。

自动匹配可能选错视频，尤其是标题差别大、存在多个版本或分 P 时；请在弹幕菜单中手动核对。B 站接口、网络、地区和账号权限也可能影响加载。

## 兼容性

| 项目 | 已验证的组合 |
| --- | --- |
| 手机系统 | Android 10 / API 29 或更新版本（取决于所选 YouTube APK） |
| YouTube 原版 APK | **21.30.216**，包名 `com.google.android.youtube` |
| 官方 Morphe Patches | **2.1.0-dev.7**，同时启用 **Mute button** 和 **SponsorBlock** |
| 本项目补丁 | 在 Manager 中显示为 **Bilibili danmaku** |

以上组合使用原版 APK 和官方补丁完成过**电脑端混源修补测试**。手机机型、Morphe Manager、官方补丁更新或 B 站接口变化都可能带来兼容问题；不能保证其他版本可用。竖屏弹幕布局尚未经过充分的多设备实机验收。

## 开始前：先弄清三个东西

1. **Morphe Manager（Morphe）**：Android 上的工具，负责把补丁打进原版 APK 并安装。可从 [Morphe 官网](https://morphe.software/)或 [Morphe Manager 官方仓库](https://github.com/MorpheApp/morphe-manager/releases)获取。
2. **YouTube 原版 APK**：Google 发布的安装文件，Manager 需要读取它进行修补。**YouTube Morphe** 是修补后生成的应用，不是用于再次修补的输入文件。
3. **补丁源**：Manager 读取补丁包的位置。需要保留官方 Morphe Patches，再添加本项目的 B 站弹幕源；两者一起用于一次修补。

## 从零开始安装

### 第 1 步：安装并设置 Morphe Manager

1. 在 Android 手机上打开 [Morphe 官网](https://morphe.software/)，下载并安装 Android 版 Morphe / Morphe Manager。按系统提示允许当前浏览器或文件管理器安装应用。
2. 打开 Manager，等待自带的 **Morphe Patches** 官方补丁源加载完成。准备至少 1 GB 可用空间，并保持网络连接。
3. 进入 Manager 的**设置 → 修补（Patching）**，开启**专家模式（Expert mode）**。这样才能在同一次修补中分别选择官方源和本项目源的补丁。不同 Manager 版本的界面文字可能略有不同。

### 第 2 步：添加 B 站弹幕补丁源

打开 Manager 的 **来源（Sources）→ + → 远程（Remote）**，粘贴下面完整地址并添加：

```text
https://cdn.jsdelivr.net/gh/RizkLee/morphe-bilibili-danmaku@main/patches-bundle.json
```

也可以尝试 [一键添加 GitHub 补丁源](https://morphe.software/add-source?github=RizkLee/morphe-bilibili-danmaku&app=com.google.android.youtube)，或手动输入 `https://github.com/RizkLee/morphe-bilibili-danmaku`。仓库曾名为 `RizkLee/morphe-patches`；已有旧 CDN 源的用户建议改用上面的新地址。保留官方 Morphe Patches 源；不要把本项目源和旧版的「Morphe Patches + Bilibili danmaku」整合包同时用于 YouTube，否则可能重复执行同一补丁。

如果远程源下载失败，在[发布页](https://github.com/RizkLee/morphe-bilibili-danmaku/releases/latest)下载 `.mpp` 文件，再通过 **来源 → + → 本地（Local）** 选择它。本地导入不会自动更新，以后需要重新选择新文件。添加远程源的步骤可参考 [Morphe 官方说明](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md)。

### 第 3 步：准备原版 YouTube APK

1. 下载 Google 签名的 **YouTube 21.30.216** 原版单文件 APK：[APKMirror 对应下载页](https://www.apkmirror.com/apk/google-inc/youtube/youtube-21-30-216-release/youtube-21-30-216-2-android-apk-download/)（`nodpi`，支持多种 CPU 架构，Android 10+）。在页面上选择 **Download APK**，不要误选广告按钮。
2. 保存下载的 `.apk` 文件，记住它的位置。不要选择已安装的 YouTube Morphe、之前修补过的 APK，也不要把输出 APK 再次作为输入。
3. 在 Manager 中确认官方补丁源使用 **2.1.0-dev.7**。如果当前官方源已更新且不兼容，可从 [官方 2.1.0-dev.7 发布页](https://github.com/MorpheApp/morphe-patches/releases/tag/v2.1.0-dev.7)下载其 `.mpp`，以本地来源添加；为避免重复，只在本次修补中使用一份官方来源。新版本需自行确认兼容性。

### 第 4 步：一次选择两个来源的补丁

1. 回到 Manager 首页选择 **YouTube**，选择版本 **21.30.216**，然后选择刚下载的原版 APK。
2. 在专家模式的补丁选择界面，确认官方源与 B 站弹幕源都对 YouTube 启用。多个来源通常显示为不同标签页；如果少了某个标签，检查来源是否启用、是否为 YouTube 排除，或在界面的提示中恢复该来源。
3. 切到 **Morphe Patches 官方源**标签，保留需要的官方补丁，并确认启用 **Mute button** 和 **SponsorBlock**。非 root 常规安装还应保留官方 **GmsCore support**。这两个前置补丁为弹幕提供播放器按钮和播放时间事件；不想使用静音按钮或 SponsorBlock 功能时，可以在修补后应用的设置中关闭它们。
4. 切到本项目源标签，勾选 **Bilibili danmaku**。检查其他选项后点击 **修补（Patch）**。Manager 可能提示混用来源存在风险；本项目独立补丁正是为与上述官方版本一同修补而设计，但其他版本仍需自行验证。
5. 等待修补完成后点击**安装**，按 Android 提示允许安装。不要中途删除原 APK。

> 已有 YouTube Morphe 的用户：如果安装时提示签名不一致，先备份应用数据并检查能否使用原来的 Manager 签名；卸载旧版可能清除数据。普通非 root 修补可能使用独立包名，可与原版 YouTube 共存，具体以 Manager 的安装提示为准。

### 第 5 步：首次启动和 Google 登录

打开修补后的 YouTube Morphe。非 root 安装若提示需要 GmsCore，请按提示安装官方 [Morphe MicroG-RE](https://github.com/MorpheApp/MicroG-RE/releases)，再返回 YouTube Morphe 登录 Google 账号。按设备和安装方式，是否需要 GmsCore 可能不同；请以 Manager 和应用提示为准。

## 开启和使用弹幕

1. 在 YouTube Morphe 打开 **设置 → Morphe → 播放器 → 悬浮按钮**，启用 **B 站弹幕按钮**。
2. 播放一个普通视频，点击播放器上的 B 站弹幕悬浮按钮，打开底部菜单，再打开**显示弹幕**。
3. 默认尝试按当前 YouTube 标题匹配 B 站来源。请检查菜单中的封面与标题；不准确时使用**搜索视频**或**粘贴链接**。支持粘贴分享原文，例如：

   ```text
   【视频标题-哔哩哔哩】https://www.bilibili.com/bangumi/play/ep258000
   ```

4. 若是分 P 或番剧，选择实际对应的分 P / 剧集。加载完成后，弹幕将随 YouTube 播放进度显示。
5. 两个视频的剪辑不同步时，在 **时间轴同步**中调整倍率与偏移；点击数字即可手动输入。视频开头相差固定时间时通常先调偏移；越播越偏时再考虑倍率。

大多数视频无需登录即可加载弹幕。首次打开菜单时会显示登录引导，可以直接跳过；登录后可获取更完整的弹幕，遇到需要账号权限的内容时菜单也会提示登录。

## 登录 B 站账号（可选）

推荐使用**扫码登录**，无需复制任何 Cookie：

1. 在弹幕菜单底部点 **账号 → 登录 B 站账号**（首次打开菜单时会自动显示）。
2. **同一台手机**：点 **打开哔哩哔哩 App 确认登录**，在 B 站 App 中确认后返回 YouTube Morphe，菜单会自动完成登录。
3. 无法跳转时：点 **保存二维码**，在 B 站 App 首页「扫一扫」中从相册选择该图片（登录成功后补丁会自动删除这张图片）；也可以用另一台设备上的 B 站 App 直接扫描屏幕上的二维码。

扫码登录会为本机创建一个**独立的网页登录会话**，并保存 B 站官方续期所需的凭证。补丁会在后台按 B 站的要求定期刷新登录，因此不需要每隔几天重新导入。登录信息只在本机经 Android Keystore 加密保存，只发送给 B 站官方域名；可以在 **账号** 页随时检查状态、切换账号或退出登录。

## 常见问题

**找不到弹幕按钮？** 确认两套来源同时启用，已勾选本项目的 Bilibili danmaku 以及官方 Mute button、SponsorBlock；安装后打开一个视频，再检查 **Morphe → 播放器 → 悬浮按钮**。如果设置项缺失，请用原版 APK 重新修补。

**提示缺少官方播放器事件？** 在官方来源补丁列表里启用 **Mute button** 和 **SponsorBlock**，与本补丁一起重新修补；不要只选择本项目的单个补丁。

**提示 `MORPHE_BRANDING.TXT` 或 APK 已修改？** 选错了输入文件。下载并选择未经修补的 Google 原版 APK，不能在已有 YouTube Morphe 上再叠加打补丁。

**显示需要登录或登录已失效？** 在菜单中扫码登录即可；扫码登录会自动续期。也请检查网络、地区和视频权限。

**旧版导入的 SESSDATA 过几天就失效？** 2.1.0 起不再支持手动导入 `SESSDATA`：它与电脑浏览器共用会话，浏览器轮换登录后就会失效。旧版凭证仍可使用到失效为止，之后请在菜单中扫码登录，补丁会自动续期。

**弹幕不匹配或不同步？** 在菜单里手动选择正确的 B 站视频、分 P / 剧集，然后调整时间偏移与倍率。

**补丁源无法下载或更新？** 先检查手机能否访问源地址；可试用上面的 GitHub 地址，或从[发布页](https://github.com/RizkLee/morphe-bilibili-danmaku/releases/latest)下载 `.mpp` 后以本地来源导入。网络访问、镜像缓存和 Manager 版本都可能影响更新。

**修补或安装仍失败？** 在 Manager 失败页面复制完整日志，到 [Issues](https://github.com/RizkLee/morphe-bilibili-danmaku/issues)说明 Android、Manager、YouTube APK、官方补丁及本补丁版本和复现步骤。提交前删除 Cookie、`SESSDATA` 等敏感信息。

## 开发与致谢

独立补丁入口位于 [`bilibili-addon/`](bilibili-addon/)，Android 扩展位于 [`extensions/youtube/`](extensions/youtube/src/main/java/app/morphe/extension/youtube/bilibilidanmaku/)。本地构建与签名说明见 [BILIBILI_DANMAKU_SETUP.md](BILIBILI_DANMAKU_SETUP.md)。

本项目的弹幕功能建立在 [ahaduoduoduo/bilibili-youtube-danmaku](https://github.com/ahaduoduoduo/bilibili-youtube-danmaku) 插件及其仓库的工作之上，衷心感谢作者和贡献者的开源与付出。

本仓库基于 [Morphe Patches](https://github.com/MorpheApp/morphe-patches) 分支开发，感谢 Morphe 及其上游项目贡献者。许可证和附加条款见 [LICENSE](LICENSE) 与 [NOTICE](NOTICE)。
