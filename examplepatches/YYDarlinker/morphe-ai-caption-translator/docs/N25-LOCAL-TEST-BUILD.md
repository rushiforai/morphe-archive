# N25 交付记录：设置排版修正与十四语种完整本地化

日期：2026-10-01（N25）。执行仓库 `E:\Projects\morphe-caption-v2`，开工 HEAD `9049591`（N24），标签 `anchor/n24-9049591` 存在且指向 `9049591`，与卡片一致。开工按 §2.8 核对两处状态档案：外部 `C:\Users\14776\Documents\kimi\tasks\2026-09-29\00-35-52-ec1208d7\PROJECT-STATE.md` 与 `docs/PROJECT-STATE.md` 均为 54,465 字节、SHA-256 `E695FA6E58F28A28B226ADB40F1F6586A52A90F090FCCC87FA41FE9D53AD9A9C`，**无差异，故开工时未覆盖**（§2.8「无差异则跳过」）。本卡只改设置展示、界面本地化与相应验证：翻译提示词、`RebuildReview`、语义分块、协议校验、重试与分页算法、前台2／后台2／总4 调度、源词时间归属、字号五档、全屏缩放、缓存键、用户自填配置全部未动；ACCEPTANCE.md、冻结计分板与历史诊断证据逐字节未改。

翻译 API **0 次 / 0 tok**，新增依赖 **0**，下载 **0**；不真机、不签名、不发布、不推送。

## A：删除预览额外标题，整理间距

`SubtitleStylePreview.onCreateView` 现在是两个子视图：满宽 16:9 画布 + 下方说明行。可见的额外标题（N24 的 `preview` 文案「横屏全屏预览」）已删除，**不是**空字符串占位，也没有换成另一条重复标题；画布 `contentDescription` 仍为该本地化文案，无障碍语义保留。节标题「字幕样式」由外层 section 提供，未动。间距按页面既有 `dp` 量整理：画布上间距 6dp、说明行上间距 2dp，无占位行、无大块空白、无紧贴边框（`InlineEditorFrameworkTest` 断言画布左右边界等于 `root` 的内边距框，`SettingsSurfaceFrameworkTest` 断言只有两个子视图且没有任何子视图文本等于标题）。预览满宽 16:9 与全屏字体比例未改（`CaptionGlyphMetricsTest`、`SettingsPolish113Test` 的 `previewGlyphHeightPx == fullScreenGlyphHeight / 2736 × previewWidth` 断言继续通过）。

顺带修正一处真实缺陷：`sampleLabel` 原先以 `AT_MOST` 测量，`TextView` 遇到「至多」会回答自己想要的完整宽度，长句因此被画到视频框之外、尾部被裁掉。现在按上限 `EXACTLY` 测量并按该宽度排版（上限 = 参考宽 ×0.92 − 2×6dp，即 2505px）。

## B：十四语种五档标签完整显示与 RTL 几何

**几何**：新增一条被两条滑轨共用的「标签让位」内缩 `inset`。它由本页实际渲染的五个档名的**实测宽度**与行宽求出，取满足全部约束的最小值：

- 两端档名要在行内：`i ≥ w_0/2`、`i ≥ w_4/2`；
- 相邻档名不能相碰：刻度间距 `(S−2i)/4 ≥ (w_j + w_{j+1})/2`，即 `i ≥ (2(w_j+w_{j+1}) − S)/4`；
- 上限 `2S/5`，任何情况下都留下可见轨道。

可见轨道 = `[paddingLeft + inset, width − paddingRight − inset]`，首末刻度与两端 thumb 中心仍精确落在这两点；`SizeTierSeekBar` 与 `OpacitySeekBar` 取同一行宽、同一档名，因此两条轨道等长、同边距、同取色（`renderNativeLightAndDarkSettingsFixtures` 断言长度差 0、padding 与 tint 全等）。

**标签排版**：每个档名按实测自然宽度居中落在自己的刻度上；宽度超过该行可用份额时在**份额内换行**（`MAX_TIER_LABEL_LINES=2`），既不用裁切、省略号，也不与邻名重叠。实测（420dp、density 1、row 380、inset=32、轨道 `[41,299]`、长 258px）：`label_widths=[64,32,52,33,62]`、`label_lefts=[9,90,144,218,268]`、`tick_centers=[41,105.5,170,234.5,299]`，最大中心偏差 4.5px（浮点刻度取整）；320dp 窄行同样五名齐全、无重叠、全部落在行内。

**RTL**：新增 `RailBar.physicalFraction()` 与 `physicalCenterX()` 作为唯一的逻辑→物理映射（RTL 取 `1−logical`），thumb、刻度、填充轨道与档名行全部只消费这一个值；`rtl()` 先读已解析的祖先方向，未附着时回退到本地化配置的 `getLayoutDirection()`／locale，绝不用未解析默认值。原有的双重反转（刻度镜像而 thumb 不镜像）已消除。**边界如实报告**：Robolectric 不把布局方向下推到普通 `View`（RTL 父的 RTL 子仍报 LTR，已用探针确认），因此无法在此环境内搭建 RTL 控件树；`N25TierRailTest` 改为验证映射的两半——行的方向等于上下文的已解析方向，且轨道两端、thumb、五刻度、标签中心与填充带边界全部随该方向取值（`railGeometryFollowsTheDirectionTheRowReports`、`physicalFractionMirrorsTheLogicalFractionExactly`），并保留透明度条与字号条几何全等的断言。

保留：超小／小／标准／大／超大、当前档高亮、实时预览、松手保存；未恢复字号标题行右侧数值，未恢复「（详情页）」；五档详情页 34/39/44.5/50/56 与全屏 55.5/44.5 未动。

## C：随应用语言变化的一行示例

新增独立资源键 `preview_sample`，经 `CaptionStrings.settings` 读取（走官方 `ResourceUtils.getString("cap_preview_sample")`，与页面其余文案同源，受 Morphe 语言覆盖），不再依赖「对未登记中文调用 localize 再回退原文」。十四语种文案按卡片给定意图落地，仅俄语一处笔误（混入一个汉字）已修正为「Мир огромен. Посмотрим вместе!」；其余与卡片表格逐字一致。

**实测（Robolectric 原生栅格，真实字体）**：参考宽 2736px、文本预算 2505px，最大档全屏字高 69.84px 时十四语种的完整 advance 最大为**越南语 1277px**，余量 1228px；标准档（55.5px）最大 advance 为越南语 1010px。即五档下十四语种全部**单行完整显示**（`N25PreviewSampleTest` 用 `Layout.getLineCount()==1`、`getLineEnd` 覆盖整串、`Paint.measureText` 完整 advance ≤ 预算、非 ellipsize 四项同时断言，并渲染 14 张 fixture 逐张目检）。未为示例另设字体缩放；更改示例语言不影响播放器翻译目标（示例只读设置目录键，与 `CaptionChoice`／目标语言无任何调用关系）。

另新增 `N25PreviewSampleTest.renderedFrameKeepsTheCaptionInsideTheVideoAndDrawsTheWholeSample`：把真实 `Preview` 画到位图，用墨迹实测字幕底框左右边界，确认字幕整体落在视频框内且每个语种都真实出墨。

## D：用户界面本地化补齐

新增 **76** 个资源键 × 14 语种（`localization/catalog.json`、14 份 `caption_addon_strings.xml`、`source-keys.tsv`、`CaptionTranslationCatalog.java` 同步，`tools/check_localization.py`：**220 keys × 14 语种**）。已修：

| 位置 | 原状 | 现状 |
| --- | --- | --- |
| `DeepSeekDiagnosticsPreference` 长说明 | 无整句映射，substring 会留混合语言 | `diagnostics_hint` 整句模板 |
| 「保存完整诊断」按钮 | 无资源条目 | `save_diagnostics` |
| 复制成功 Toast | 绕过本地化硬编码中文 | `message_896c4b51d7e9` |
| 保存失败／保存位置 | 拼接中文片段 | `save_failed`／`save_ok`（位置参数模板） |
| 清空诊断确认说明 | 未登记中文 | `clear_diagnostics_confirm` |
| Android 9 分段复制 | 标题、选项、成功提示、Clipboard 标签全为硬编码中文 | `copy_parts_title`／`copy_part_label`／`copy_part_done`／`copy_part_failed` |
| `DeepSeekModelPreference` 全部状态与「已选择」无障碍 | 「已选择」无映射 | `selected_suffix` ＋ 12 个 model_* 键 |
| 预览示例 | 无资源条目 | `preview_sample` |
| `CaptionDiagnostics.uiText` | 标题／说明固定英文 | 引擎／模式／调试状态／阶段／时间参照／最近事件／年龄；`label_separator` 与 `display_debug` 为整句模板 |
| `TokenCostAudit.uiText` | 整段固定英文 | 全部 52 个 `audit_*` 键，含失败明细、分页进度、边界复核、磁盘缓存、每用途行、成本与速率行 |

**顺带修一处真实缺陷（自查发现）**：初版 `localizedHeader` 把 `label_separator` 套在已经带冒号的头名上，中文渲染成「引擎：：事件重建」、英文渲染成「Engine: : Event rebuild」。现 `engine`／`mode`／`engine_event_rebuild` 一律为**裸标签**，冒号只由 `label_separator` 提供一次；`apply_n25_catalog.py` 在合并后对全部语种做该归一并在占位符检查中加断言，重复运行幂等。十四语种实测表头：`Engine: Event rebuild / 1.3.5`／`引擎：事件重建 / 1.3.5`／`エンジン：イベント再構築 / 1.3.5`／`المحرّك: إعادة بناء الأحداث / 1.3.5` 等均只出现一次分隔符。

**UI 与 raw 分离**：`CaptionDiagnostics.uiText(c)` 默认本地化并加 `uiText(c,false)` 重载，`fullText` 只调用后者，因此导出的原始报告表头逐字不变（`CaptionLongDiagnosticsTest.exportManifestReportsActualEngineAndBothChannels` 继续通过），本地化 UI 文案不会混入 raw 头部；复制 UI 摘要与保存完整诊断各自用途未变。REBUILD_* 事件名、JSON 键、协议错误码、源文／译文／时间戳／请求ID／计数值全部原样保留。

**顺带修一处真实缺陷**：`DeepSeekActionPreference` 原先用 `message.startsWith("API 可用：")` 判断测试成功——文案一旦本地化该判断即失效，成功时不再刷新配置。现改为布尔标志，并把「API 可用／测试失败／重试提示」各做成整句模板。

**非 UI 字符串分类**（清单见 `.verification/n25/ui-localization-inventory.md`，18 个调用点 → 资源键 → 覆盖状态，另列 8 类「刻意不翻译」项及理由）：质量检测正则、供应商提示词、YouTube 原生按钮识别词、目标语言名表、内部异常标识、原始报告表头、字体标定样本与分词数据、构建与审阅材料。未使用全局 `Locale.setDefault`，未把系统语言当作应用语言；用户自填配置、模型 ID、URL、文件名、提供商返回原文与诊断证据原文均未被改写。

## 验证

- Java 全套离线单测 **437/437**（0 失败 / 0 错误 / 0 跳过，56 套件；N24 为 429，净增 8：`N25PreviewSampleTest` 2 条 + `N25TierRailTest` 4 条 + `N25DiagnosticsLocalizationTest` 2 条）。既有断言改动仅 3 个文件、全部随 A/B 行为变更同步（预览子视图 3→2、raw 报告改走 `uiText(c,false)`、档名行不再等宽单元格）。
- Python `unittest discover -s scoreboard` **27/27**；`tools/check_localization.py` 通过（220 keys × 14 语种）。
- `scoreboard/run.py`、`n9.py`、`n10.py`：**4 通过 / 4 既有失败 / 4 未验证**，`pending_translation`／`event_review`／`overflow` 不可见时长**全 0**；`scoreboard/results/frozen-baseline.json` 与 `ACCEPTANCE.md` Git 无差异。
- 本地化检查不仅查键存在：`tools/apply_n25_catalog.py` 校验十四语种占位符编号／类型与英文一致（含允许的语序重排）、English 源头表与占位符表一致、逐次运行幂等；`verify_artifacts.py` 从**交付包内**的 14 份 XML 用真实 XML 解析器读回 `cap_preview_sample` 并与卡片表格逐字比对。
- 组合 **84/84 PASS**（`STRUCTURE_PASS` 矩阵：84 条 `PASS`，与 N24 的 82 既有 + 官方新增 2 完全一致）；`DEX_AUDIT_PASS classes=58028`；`SHARED_APPLIED_DISPATCH_PASS`／`NATIVE_APPLIED_PATH_PASS`／`INDEPENDENT_FLYOUT_SETTINGS_PASS`／`PROFILE_DIALOG_HOST_API_PASS` 全通过。
- `.github/scripts/verify_bundle.py 1.3.5` PASS（72 条目 / 14 locales / root DEX / extension）；`build/N8Verify.java` PASS（CRC、仓库身份、版本 1.3.5、DEX 头、MPE 与交付包内嵌扩展逐字节一致）。APK ZIP CRC、唯一条目、11 个根级 DEX 头／长度／校验和通过，`META-INF` 无签名文件；`aapt dump badging` 确认 `app.morphe.android.youtube` 21.16.256 / 1561068412 / minSdk 28；`apksigner verify` 返回 `DOES NOT VERIFY / Missing META-INF/MANIFEST.MF`，**确认未签名**。Windows 中文路径沿用 N18r 的 ASCII 硬链接解决 `aapt`／`apksigner` 限制。
- 12 个历史产物（N18／N18r／N22／N23／N24 三件套与既有本地包、`recovered/1.3.5` 两个 MPP）前后 SHA-256 与字节数**全部一致**，N24／N23 三件套未被覆盖。
- **覆盖边界如实报告**：RTL 控件树无法在 Robolectric 内搭建（见 B 段），已用映射两半的等价断言替代并保留透明度条几何全等断言；预览示例的「单行」结论基于参考宽 2736px 的预算，窄于该参考的窗口不在本卡承诺范围；fixture 只覆盖亮／暗 × 标准档 × 320/420/960 与 14 语种最大档预览帧，未做真机截图。

## 交付

| 产物完整路径 | 字节数 | 比 N24 | SHA-256 |
| --- | ---: | ---: | --- |
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n25.mpp` | 1,101,113 | +40,780 | `36F885BEC7A2D0CE2FB1E10677F13B10B8DCFB7C3EB9496F965AF0830577B568` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n25.mpe` | 2,713,520 | +15,484 | `C75B1067F431E495FACE025E821CF8676570A426DFD2B0F048C6033BFE0FA401` |
| `E:\Projects\morphe-caption-v2\build\n25-composition-final\YouTube-21.16.256-本地测试包-n25-unsigned.apk` | 196,935,268 | +134,320 | `9FE3A03F024ED54743589435685342C95D179ADB3112652A1E4CB88EA7D4964F` |

MPE 由交付 MPP 抽取，与包内 `extensions/extension.mpe` 逐字节一致。体积增量几乎全部来自 76 个新键 × 14 语种的资源文本（XML 每语种 +10,226 字节）。本卡提交序列：`8941244`（源码与本地化）→ `c139144`（交付记录与档案同步）→ `99e7be5`（表头分隔符修正、`N25DiagnosticsLocalizationTest` 与最终记录）；锚点标签 `anchor/n25-99e7be5` 指向 `99e7be5`（未推送）。

**真机仍待用户验证**：预览无重复标题后的观感、五档档名在系统大字体下的实际排版、RTL 系统语言下的滑轨方向与拖动一致性、十四语种界面下的示例与档名观感、以及诊断面板与 Token 审计摘要的本地化可读性。本卡不做真机、不签名、不发布；L 线语言菜单仍未启动。
