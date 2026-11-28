# Anchored AI Captions

使用你自己的 **OpenAI 兼容 API** 实时翻译 YouTube 已有字幕。Anchored AI Captions 是独立维护、兼容 Morphe 的开源补丁包，为普通视频、全屏播放和 Shorts 提供可自定义的字幕。

[English](../README.md) · [添加到 Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator) · [下载补丁](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases) · [反馈问题](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues)

## 功能

- 使用 YouTube 原生的「自动翻译」菜单和官方 **Captions** 补丁选择目标语言。视频已有目标语言字幕，或你直接选择原字幕时，会显示已有字幕，不调用翻译 API。作者上传的字幕保留原有换行。
- 可调整字幕字号和背景透明度，长按字幕框即可自由拖动。播放普通视频时，字幕会自动避开显示中的底部进度条和播放控件，控件隐藏后回到保存的位置。
- 字幕会随可用画面区域调整，打开 Shorts 评论区时也一样。
- 设置采用 Morphe 风格的圆角弹窗，支持 14 种语言。可在列表中直接切换、重命名或删除 API 方案，并为每套方案单独设置地址、密钥和模型。

视频需要有可用字幕，你也需要一个兼容 OpenAI 聊天补全接口的 API 服务。本补丁翻译已有字幕，不做音频转写。

## 支持版本

需要 **Morphe Manager 2.8.0+** 或 **Morphe Desktop 2.4.0+**，搭配[官方 Morphe Patches 2.4.0](https://github.com/MorpheApp/morphe-patches/releases/tag/v2.4.0)。请选择未经打补丁的原版 YouTube **21.30.216（稳定）**或 **21.47.483（实验）** APK。APK 要求和已验证组合见[兼容说明](COMPATIBILITY.md)。

## 安装

1. 安装 [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases/tag/v2.8.0) 或 [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop/releases/tag/v2.4.0)。使用 Manager 时，在设置中启用「专家模式」。
2. 在 Manager 中使用上方的「添加到 Morphe」，或在「补丁源 → 添加 → 远程」粘贴 `https://github.com/YYDarlinker/morphe-ai-caption-translator`。使用 Desktop 时，从上方的「下载补丁」获取本项目的 `.mpp`，与官方补丁包一起加载。
3. 选择匹配的原版 YouTube APK，保留官方 **Captions** 补丁，并在本补丁源中选中 **AI caption translator**。避免叠加功能重叠的字幕补丁。
4. 按 Morphe 指引打补丁、签名和安装。如果选用的官方补丁需要 GmsCore，按指引完成配置。

## 配置与使用

1. 打开「YouTube → 设置 → Morphe → 视频 → AI 字幕翻译」。
2. 填写 API 地址、密钥和模型，点击「测试 API」。使用多个服务商时，可以分别保存为命名方案。
3. 开启 AI 字幕，在视频字幕菜单中选择「自动翻译 → 目标语言」。
4. 在预览中调整字幕字号和背景透明度。播放视频时长按字幕框即可移动。

关闭 AI 字幕即可恢复 YouTube 原生字幕。

## 费用、隐私与限制

- 所选视频的字幕及有限上下文会发给你配置的 API 服务商。翻译和预取可能消耗付费 token，请查看服务商的价格和用量限制。
- API 密钥在设备上通过 Android Keystore 加密。分享诊断前请检查内容。即使凭据已脱敏，诊断仍可能包含视频标识、字幕、服务商响应和端点信息。
- 翻译质量和延迟取决于源字幕、网络和服务商。

## 排查与更新

- 「测试 API」失败时，检查地址、密钥和模型后重试。
- 找不到目标语言时，查看 YouTube 原生「自动翻译」列表。该列表由官方 **Captions** 补丁管理。
- 字幕没有显示或等待过长时，检查视频是否有可用字幕，以及 API 和网络是否正常。可以在 AI 字幕设置中导出诊断，脱敏后随问题一起提交。
- 更新补丁时，在 Manager 中刷新远程补丁源，或为 Desktop 下载新的 `.mpp`，然后重新给 YouTube 打补丁。使用原签名密钥覆盖安装可保留应用数据。

## 开发与许可

参阅[开发指南](DEVELOPMENT.md)和[发布流程](RELEASING.md)。

Anchored AI Captions 由 YYDarlinker 独立维护，采用 GPLv3 许可。
