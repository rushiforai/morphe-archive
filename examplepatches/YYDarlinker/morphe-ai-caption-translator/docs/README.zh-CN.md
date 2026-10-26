# Anchored AI Captions

使用你自己的 **OpenAI 兼容 API，实时翻译 YouTube 已有字幕**。这是独立维护、兼容 Morphe 的开源补丁源，适用于普通视频、全屏和 Shorts。

[English](../README.md) · [添加到 Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator) · [下载补丁](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases) · [反馈问题](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues)

当前版本：[v1.5.7](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/tag/v1.5.7)。

## 1.5.8 更新

- 分清AI开关、原生CC和原生语言的职责，加强视频/会话归属及退出重入保护。
- 正确保留服务端重试期限（含日期形式Retry-After），旧会话及page/hole补翻译遵守当前请求权限和等待条件。
- 保留保存失败的编辑草稿，同步实际已保存字段；坏配置显示可理解错误，不静默丢弃凭据。
- 缓存替换失败时保护已有有效源字幕，并让诊断说明实际失败决定和来源边界。
- 退役未使用的回环服务、提取字号过渡状态，补齐可复跑验证和维护资料。实际验证范围见[兼容说明](COMPATIBILITY.md)。

## 功能

- 开启 AI 后，在 YouTube 字幕菜单的「自动翻译」中选择目标语言，使用你配置的服务翻译原字幕。
- 跟随 YouTube 原生「自动翻译」列表与官方 Captions 补丁；语言增减与排序由官方补丁维护，本源不再维护第二套语言列表。
- 自定义字幕字号、背景透明度和垂直位置；字幕外层按视频物理中心定位，不受应用从左到右／从右到左的界面方向影响。字幕位于播放器控件之上，进度条和时间文字不会盖住字幕。
- 多套 API 配置、模型选择、自定义翻译要求、缓存和诊断导出；设置界面适配十四语种。
- 字幕语言完全由 YouTube 原生字幕菜单与官方 Captions 补丁（包括「Preferred caption language」）决定；本源不再保存另一套目标语言。
- 详情页、全屏、Shorts 和评论区共用同一套稳定字幕层；字号与分页按真实视频视口计算，评论区动画中字幕随面板连续缩放，而不是等动画结束后才变。
- 视频已自带所选目标语言的字幕时，直接以 AI 字幕样式显示，不发起翻译请求。上传字幕保留作者原有的换行和双行排版；只有自动生成字幕会在本地优化分句与翻页。
- 视频有多条字幕轨道时，优先翻译口述语言的轨道（人工优先于自动，其次为人工英语），而不是 YouTube 预选的那一条。

视频必须有可取得的字幕。本项目不对无字幕视频进行音频识别。选择原字幕不会产生翻译 API 调用。

## 支持与推荐版本

| 项目 | 当前声明 | 证据边界 |
| --- | --- | --- |
| 官方 Morphe Patches / Patcher | **1.48.0 / 2.0.0** | 已核对实际本地输入元数据；其他选择集另验 |
| 原版 YouTube APK | 稳定声明：**21.20.405、21.16.256**；实验声明：**21.42.241、21.41.525、21.28.208、21.23.492** | 离散列表；稳定标记来自元数据，不是当前候选的设备认证 |
| Android | minSdk 28；**21.42.241、21.41.525、21.28.208** 需 minSdk 29 | 还须核对实际 APK 的 ABI、签名及变体 |

公开仍为 **1.5.7**。本地 **1.5.8 / local-1.5.8-m7b / candidate-02** 已有 **21.41.525-SECONDARY** 和 **21.28.208** 的有限电脑组合证据。2026-10-26用户对手机手动更新/观察清单反馈无问题，诊断确认m7b；报告环境为Manager2.2.0 / YouTube21.20.405 / 官方1.48.0。[首轮工程成熟化](maintenance/reviews/M7-FINAL-ACCEPTANCE.md)按规定范围验收。该单设备使用证据不冒充第三组电脑组合、全设备矩阵或官方认证；旧“推荐21.20.405”仍为稳定目标元数据选择。详见[兼容与验证边界](COMPATIBILITY.md)及[候选安装前/短设备清单](maintenance/M7b-DEVICE-ACCEPTANCE.md)。候选诊断将构建预期与运行时官方包/Patcher的 unknown 来源分开。

## 安装

1. 安装 [Morphe Manager](https://github.com/MorpheApp/morphe-manager/releases/latest)，在设置中启用「专家模式」。
2. 点击[添加到 Morphe](https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator)，或在「补丁源→添加→远程」粘贴 `https://github.com/YYDarlinker/morphe-ai-caption-translator`。
3. 从离散声明列表选择与官方包匹配的**原始、未打补丁 YouTube APK**，先核对兼容表中的实际变体和证据。
4. 保留对应官方默认补丁组合，包含其字幕、设置、播放器接缝支持。在本项目源内只选择 **AI caption translator**；字幕语言由 YouTube 原生菜单/官方 Captions 补丁决定，本源不提供单独的语言记忆补丁。
5. 由 Morphe 完成补丁、签名与安装；若官方补丁要求 GmsCore，按其指引设置。

不要同时选择旧AI字幕addon或其他重叠的字幕补丁。官方 Captions 补丁保持语言决定权；本源只跟随原生选择，不凭空添加目标语言。本源需要与官方补丁组合，不替代官方源。`.mpp` 是补丁包，不能直接作为 YouTube APK 安装。

## 配置与使用

1. 打开「YouTube→设置→Morphe→视频→AI字幕翻译」。
2. 填写 API 地址、密钥与模型，执行「测试API」。不同服务可分别保存为命名配置。
3. 开启AI字幕，在视频字幕菜单中选择「自动翻译→目标语言」，视频已有该目标语言的字幕时直接显示；否则使用你配置的AI服务翻译优先选取的源字幕。
4. 用预览调整字号和背景；可自定义翻译要求，自定义文字在更换界面语言后会原样保留。

AI 开关是字幕绘制方式的唯一开关：开启时 YouTube 原生字幕窗口不绘制，由本源显示 AI 字幕层；关闭时立即恢复 YouTube 原生绘制。字幕是否出现、用哪条语言轨道仍由官方 Captions/播放器 CC 状态决定；没有开启 CC 时不显示任何字幕。若原生轨和目标语言尚未到达，可能出现短暂空白，但不会先显示原生样式。

关闭AI后使用YouTube原生翻译。直接选择人工／自动生成的原字幕时，显示原文，不调用翻译API，上传字幕保留作者原有换行，自动生成字幕才在本地优化分句与翻页（不联网、不使用模型）。发送给翻译服务的文本会移除括号内的日语注音，避免译文重复。普通视频与Shorts的菜单开关显示选项互相独立，也不等同于引擎开关。

### 个人模型推荐

我个人比较下来，**Qwen3.7-Flash（`qwen3.7-flash`）应该是这个补丁最便宜的选择**。在本项目的字幕翻译任务上，它的效果甚至优于我试过的一些更昂贵的模型。

可以通过[阿里云百炼](https://bailian.console.aliyun.com/)使用；海外用户也可以选择[阿里云国际站 Model Studio](https://www.alibabacloud.com/product/modelstudio)。截至 **2026 年 10 月 15 日**，[国际站官方价格](https://www.alibabacloud.com/help/en/model-studio/model-pricing)中，**新加坡区域、International 部署范围**，**单次输入不超过 32K tokens** 时，输入为 **US$0.03／百万 tokens**，输出为 **US$0.13／百万 tokens**。这是实时 API 的标准价格，较长请求适用更高的计费档位；最新价格以链接中的说明为准，国内百炼价格请以其控制台为准。

## 费用、隐私与边界

- 已选视频的字幕及有限上下文会发送至你指定的服务商，翻译和预取可能产生token费用。本项目不提供API账号或免费额度。
- 密钥使用Android Keystore在本地加密存储；输入时可见，请注意输入法隐私。分享诊断前自行检查：虽然会屏蔽凭据，仍可能包含视频标识、字幕、服务商响应和端点信息。
- 网络、服务商和源字幕影响等待时间与翻译自然度；源时间可能为估计值，不承诺与音频绝对同步。未保证每种OEM、视频或组合都无异常。

## 排查与更新

API测试失败时检查地址、key、模型后重测。并非所有声称OpenAI兼容的端点都接受同一协议。缺少目标语言时在 YouTube 原生「自动翻译」列表中选择（该列表由官方 Captions 补丁维护），再重开播放器字幕菜单。没有字幕或等待过长时核查源字幕、API和网络；从AI设置导出诊断，在[项目Issue](https://github.com/YYDarlinker/morphe-ai-caption-translator/issues/new/choose)提供脱敏复现材料。

更新时刷新Morphe内的远程补丁源，再重新打补丁。更新补丁源不会自动修改已安装YouTube。保留原签名配置，便于覆盖更新并保留应用数据。

## 开发与许可

[架构](ARCHITECTURE.md) · [开发与贡献](../CONTRIBUTING.md) · [开发环境与命令](DEVELOPMENT.md) · [维护操作](maintenance/OPERATIONS.md) · [发布流程](RELEASING.md) · [更新历史](../CHANGELOG.md)

YYDarlinker 独立维护，非 Morphe 官方项目。遵循 [GPLv3](../LICENSE) 并保留 [NOTICE](../NOTICE)；Morphe 名称仅用于兼容说明。

## 维护与工作区

当前资料从[文档入口](README.md)进入，目录与归档规则见[WORKSPACE](WORKSPACE.md)，本轮结论见[最终验收](maintenance/reviews/M7-FINAL-ACCEPTANCE.md)。[GitHub发布与整理记录](maintenance/GITHUB-UPDATE-PLAN.md)单独记录本次已授权的1.5.8发布；以实际Release和核验结果为准。旧文档/恢复材料保留可追溯性，原始诊断、源APK、工具链、验证证据和私有备份留在本机。
