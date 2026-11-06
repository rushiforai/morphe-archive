# YouTube Morphe — Bilibili 弹幕独立补丁 2.1.0

这是单独的 Bilibili danmaku 补丁包，需要和官方 Morphe Patches 一起使用。目前按 YouTube 原版 **21.30.216**、官方补丁 **2.1.0-dev.7** 验证过实际修补。使用未经修改的 Google 原版 APK；已修补的 Morphe APK 不能作为输入。

补丁源：`https://cdn.jsdelivr.net/gh/RizkLee/morphe-bilibili-danmaku@main/patches-bundle.json`。GitHub 备用源：`https://github.com/RizkLee/morphe-bilibili-danmaku`。元数据直链：`https://raw.githubusercontent.com/RizkLee/morphe-bilibili-danmaku/main/patches-bundle.json`。

## Morphe Manager 安装

1. 在来源中保留官方 Morphe Patches 2.1.0-dev.7，并添加上面的 Bilibili 补丁源；若先前曾添加旧版整合包，更新或删除旧来源，避免重复选择同名补丁。
2. 选择原版 YouTube 21.30.216 APK，选择官方补丁及本来源的 **Bilibili danmaku**。官方补丁中需启用 **Mute button** 和 **SponsorBlock**，以提供播放器按钮、视频 ID 和时间事件；相应功能可在修补后的应用设置中关闭。缺少这些事件时，独立补丁会在修补时报出明确提示。
3. 完成修补并安装。若签名不同而无法覆盖安装，需要使用原来的签名密钥，或先备份数据再卸载旧应用；卸载可能删除应用数据。
4. 打开视频后，在 **设置 → Morphe → 播放器 → 悬浮按钮** 中启用 B 站弹幕按钮，返回播放器点击按钮。弹幕菜单可直接粘贴 B 站分享文本，也能搜索、选分 P、调整同步或导入本地 XML。

独立补丁通过官方 Add-on 接口接收事件，不再打包一份官方补丁，避免双来源重复修改视频 ID 指纹。它需要支持上述 Add-on 接口的官方补丁版本；未来官方更新后仍需验证兼容性。

## B 站登录

登录是可选的：搜索、视频信息和弹幕分段在未登录时也能请求（WBI 签名密钥由 nav 接口在 `-101` 响应中一并返回）。推荐在菜单中**扫码登录**：生成网页登录二维码，用户可在同一台手机上跳转 B 站 App（`bilibili://browser?url=…`）确认，也可保存二维码后在 B 站 App 中从相册识别。扫码登录得到独立的网页会话，保存 `SESSDATA`、`bili_jct`、`DedeUserID` 等登录 Cookie 和 `refresh_token`，补丁按 B 站网页端官方流程（cookie/info → correspond → cookie/refresh → confirm/refresh）每 12 小时检查并续期，遇到 `-101` 时也会尝试续期一次。

2.1.0 移除了手动导入 `SESSDATA`（与电脑浏览器共用会话，浏览器轮换后即失效且无法续期）；2.0.x 保存的旧凭证仍可读取，直到失效后提示扫码登录。所有凭证仅以 Android Keystore + AES-GCM 加密保存在本机，只发送给 B 站官方 HTTPS 域名。

## 开发构建

配置 JDK 21、Android SDK 36、build-tools 36.1.0 和项目的本地 Maven 依赖后，在仓库根目录运行 `scripts/build-bilibili-addon.ps1`。产物是 `bilibili-addon/patches/build/libs/patches-2.1.0.mpp`。脚本会运行 Android 单元测试、生成独立 DEX，并使用未纳入版本控制的 `morphe-signing.key` 签名。发布前将签名包复制到 `dist/`，更新清单后运行 `python scripts/verify-bilibili-source.py`；`created_at` 必须使用无时区后缀的 UTC 时间。请勿提交或公开私钥。
