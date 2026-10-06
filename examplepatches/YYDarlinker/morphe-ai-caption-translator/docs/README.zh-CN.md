# Anchored AI Captions

使用你自己的 **OpenAI 兼容 API，实时翻译 YouTube 已有字幕**。这是独立维护、兼容 Morphe 的开源补丁源，适用于普通视频、全屏和 Shorts。

[English](../README.md) · [添加到 Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator) · [下载补丁](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases) · [反馈问题](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues)

## 功能

- 开启 AI 后，在 YouTube 字幕菜单的「自动翻译」中选择目标语言，使用你配置的服务翻译原字幕。
- 可在 AI 设置内勾选需要加入原生「自动翻译」列表的语言，包括简体中文。勾选仅增加可选语言，不会同时后台翻译所有语言。
- 自定义字幕字号、背景透明度和垂直位置；字幕外层按视频物理中心定位，不受应用从左到右／从右到左的界面方向影响。
- 多套 API 配置、模型选择、自定义翻译要求、缓存和诊断导出；设置界面适配十四语种。
- 可选「Remember caption selection」在当前应用进程内记住字幕选择，与 AI 开关独立，完整重启后重置。

视频必须有可取得的字幕。本项目不对无字幕视频进行音频识别。选择原字幕不会产生翻译 API 调用。

## 支持与推荐版本

| 项目 | 推荐 | 历史兼容范围 |
| --- | --- | --- |
| 官方 Morphe Patches | **1.45.0**（本次检查的最新稳定版） | 从 **1.42.0** 起，须与所选 YouTube APK 匹配 |
| 原版 YouTube APK | **21.16.256** | **21.13.164、21.07.247** |
| Android | **9 及以上** | minSdk 28 |

推荐使用官方 **1.45.0＋YouTube 21.16.256**。21.07.247 对应较早的官方1.42.0／1.43.0；当前官方稳定列表已不含它，不能认为任意官方版本都能与任意历史APK组合。实验版 YouTube 不列为本补丁的稳定支持范围。详见[兼容与验证边界](COMPATIBILITY.md)。

## 安装

1. 安装 [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases/latest)，在设置中启用「专家模式」。
2. 点击[添加到 Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator)，或在「补丁源→添加→远程」粘贴 `https://github.com/YYDarlinker/morphe-ai-caption-translator`。
3. 加载上表中的**原始、未打补丁 YouTube APK**，优先21.16.256。
4. 保留对应官方默认补丁组合，包含其字幕、设置、播放器接缝支持。在本项目源内选择 **AI caption translator**；需要记忆字幕选择时，再选 **Remember caption selection**。
5. 由 Morphe 完成补丁、签名与安装；若官方补丁要求 GmsCore，按其指引设置。

不要同时选择旧AI字幕addon或其他重叠的字幕记忆补丁。本源需要与官方补丁组合，不替代官方源。`.mpp` 是补丁包，不能直接作为 YouTube APK 安装。

## 配置与使用

1. 打开「YouTube→设置→Morphe→视频→AI字幕翻译」。
2. 填写 API 地址、密钥与模型，执行「测试API」。不同服务可分别保存为命名配置。
3. 在同一设置页的「自动翻译语言」中勾选需要加入 YouTube 自动翻译列表的目标语言。
4. 开启AI字幕，在视频字幕菜单中选择「自动翻译→目标语言」，即可调用你配置的AI服务翻译已有源字幕。
5. 用预览调整字号和背景；可自定义翻译要求，自定义文字在更换界面语言后会原样保留。

关闭AI后使用YouTube原生翻译。直接选择人工／自动生成的原字幕时，显示原文，不调用翻译API。普通视频与Shorts的菜单开关显示选项互相独立，也不等同于引擎开关。

## 费用、隐私与边界

- 已选视频的字幕及有限上下文会发送至你指定的服务商，翻译和预取可能产生token费用。本项目不提供API账号或免费额度。
- 密钥使用Android Keystore在本地加密存储；输入时可见，请注意输入法隐私。分享诊断前自行检查：虽然会屏蔽凭据，仍可能包含视频标识、字幕、服务商响应和端点信息。
- 网络、服务商和源字幕影响等待时间与翻译自然度；源时间可能为估计值，不承诺与音频绝对同步。未保证每种OEM、视频或组合都无异常。

## 排查与更新

API测试失败时检查地址、key、模型后重测。并非所有声称OpenAI兼容的端点都接受同一协议。缺少目标语言时先在设置勾选，再重开播放器字幕菜单。没有字幕或等待过长时核查源字幕、API和网络；从AI设置导出诊断，在[项目Issue](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues/new/choose)提供脱敏复现材料。

更新时刷新Morphe内的远程补丁源，再重新打补丁。更新补丁源不会自动修改已安装YouTube。保留原签名配置，便于覆盖更新并保留应用数据。

## 开发与许可

[架构](ARCHITECTURE.md) · [开发与贡献](../CONTRIBUTING.md) · [发布流程](RELEASING.md) · [更新历史](../CHANGELOG.md)

YYDarlinker 独立维护，非 Morphe 官方项目。遵循 [GPLv3](../LICENSE) 并保留 [NOTICE](../NOTICE)；Morphe 名称仅用于兼容说明。
