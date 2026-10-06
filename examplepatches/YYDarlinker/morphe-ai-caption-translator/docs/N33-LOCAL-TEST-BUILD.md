# N33 本地测试交付

日期：2026-10-04（Asia/Shanghai）。N33 已完成；N34 未开始。

从恢复后的 N30 独立实现：AI 与自动翻译语言入口说明明确功能；语言窗口只有十四个本地化语言名称及勾选框，简繁名称准确，保存/取消/Back 沿用 N30；本补丁设置、默认要求显示、预览、五档名、诊断壳与操作提示跟随 Morphe 设置语言。公开根仅剩 **AI caption translator / Remember caption selection**，AI 内多选添加语言继续保留。字幕请求、缓存、源/分页、调度与播放器策略保持 N30。

## 源码与输入身份

- 实际开工 HEAD：`6cbee8bc7fd8d80364bfb65612efc80c94e35c88`（恢复提交 `7d6821e772b9959158dd7ac41bd7e626aef48d1c` 的 docs-only 后继）。开工 tracked 非 docs 与源基线 `d5ca720ecf0c83349ea232d929ee09b11840c65a` 相等；没有因短哈希差异停工。
- N31 仅校对提取规划者导出的纯 JSON 翻译文字；没有读取/移植 N31/N32 的其他实现、host、stub、hook、脚本或包。API fixtures 本轮依原版 1.45.0 DEX 签名独立编写，均只在 JVM 测试中使用。
- 官方输入 `patches-1.45.0.mpp`：SHA256 `DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93`。原版 YouTube 21.16.256/minSdk28，不使用手机已打补丁 APK 作输入。
- 最终 Java main/test/resource 输入清单：`.verification/n33/full-final-06/inputs.json`，206 文件，输入 SHA256 `599169b13f3da65385f9c1cbf06c6e7c6eab6a930425201e928e81b0dfe0e2f2`；全量结束后逐文件复核一致。纯 N30 before 清单是 `baseline/n30-source-from-before-java.json`；并发捕获的 `baseline/n30-source.json` 已含最初的新 helper，不冒称纯 N30 产品树。
- 实现提交与 `anchor/n33-<源码短hash>` 在提交后的身份补记中记录；本报告随实现提交，随后只允许补记 docs。

## 独立三件套

| 本地文件 | bytes | SHA256 |
| --- | ---: | --- |
| [patches-1.3.5-本地测试包-n33.mpp](E:/Projects/morphe-caption-v2/build/local-test/patches-1.3.5-本地测试包-n33.mpp) | 1,242,450 | `F60F7B50295566D0FC887A3392E78B017685E9B37F4C3C9EC36BE45CBE1C866E` |
| [extension-1.3.5-本地测试包-n33.mpe](E:/Projects/morphe-caption-v2/build/local-test/extension-1.3.5-本地测试包-n33.mpe) | 3,044,228 | `5D501610F230FC28ADDDF9D3F363586933C61DF434FE8DE75E11403620F26970` |
| [YouTube-21.16.256-本地测试包-n33-unsigned.apk](E:/Projects/morphe-caption-v2/build/n33-composition-final/YouTube-21.16.256-本地测试包-n33-unsigned.apk) | 198,221,091 | `08AA970CC8A63643083108DE8732B92247C0A08212C2FF87C47EF95AB172B4CC` |

产品版本仍 1.3.5；官方组合 1.45.0，已证兼容仍仅 YouTube 21.16.256/minSdk28。发布 URL、作者/仓库源信息未改变。MPP 72 ZIP entries、有 manager `classes.dex`，内嵌 MPE 与独立 MPE 字节相等；ZIP CRC、DEX header/length/SHA1/Adler32、资源及 metadata 反读通过。正式 APK 保持 unsigned：apksigner 按预期报告缺少签名而拒绝验签。模拟器测试副本独立签名，正式三件套未签名。

源码经过本轮 Gradle 离线 `:patches:buildAndroid :patches:generatePatchesList` 和真实 Patcher 1.14.1 全量组合独立生成，未使用旧 31/32 的 build classes/产物，没有 root clean。candidate-10 与正式文件字节相等；先前 review-08 与所有失败候选保留。

## UI 与默认要求协议

- 新 `CaptionTextResolver` 只返回 String/Locale；只读真实 `BaseSettings.MORPHE_LANGUAGE`，DEFAULT 跟随调用方资源 locale，支持 zh scripts/CN/TW/HK/MO 与 id/in，未覆盖语言完整英文 fallback。临时 configuration resource Context 只用于函数内取 cap_* 字符串，不保存/返回，不传给 View、Dialog、PopupWindow、Toast、Intent 或业务。
- 原官方 ResourceUtils 会优先读 Activity，不能保证 override；本轮从原/最终 DEX 再次核对，未以转发它宣称修复。240 keys × 14 = 3360 资源/placeholder 配对，catalog/XML/生成 fallback 同步。
- 保持原 final Framework PreferenceScreen、原导航/窗口/动作 Context、分类无 key 的排序语义。自有 child 的标准 attach/bind 更新真实 AI 父屏；一个标准 SharedPreferences 监听器按官方实际 key 过滤、主线程合并 post，只刷新弱引用的自有 AI 树。无官方 Fragment hook、资源 Context 窗口、owner/epoch guard 或全树轮询。
- 自有行/slider/preview/语言窗口设置 UI locale/方向；URL、key、model 等数据继续 LTR，播放器目标字幕方向策略未改。五档词使用完整原生短词，未缩字/省略，保留 N25 的 inset/fraction/端点/中心、字号默认与几何。
- `displayDefaultPrompt` 仅供未自定义编辑器显示。运行时默认通过私有 legacy reader 严格保持 N30；canonical effectivePreference、请求 prompt/hash、cache identity 不使用显示字符串。programmatic/default/userEdited 状态防止语言切换、滚动、flush、profile copy/save 把默认显示串误存为 custom；原已存且恰等于某语言默认的 custom 不迁移。
- 标题/提示用稳定资源 key，原 provider/source/translation/custom/URL/key/model/profile 名原文保留；不替换中文 substring。技术诊断报告结构/field/stage/reason 保持，UI 壳本地化；构建标记改 n33。模型获取的内部“无模型 ID”说明另有完整十四语种资源；只识别 catalog 自身异常的包络，将 HTTP 状态作为技术代码保留，provider body 原文不替换。隐藏的原 N30 preview Preference title 没有再画成第二标题，实际预览画布的说明/样例本地化。

## 官方选项与补丁十四语种实际覆盖

用户已同意按原版官方能力验证，禁止增加官方枚举/语言项。本轮真实 `AppLanguage` 只有泛中文 ZH，**没有繁中显式选项**。

| 覆盖层 | 实际结果 |
| --- | --- |
| 官方显式选项覆盖 | en、ZH→zh-Hans、es、fr、de、pt、ru、ja、ko、ar、hi、id、vi，共 **13 个选项 × 8 维度 = 104 cases** |
| 独立繁中验证 | DEFAULT + 宿主 `zh-Hant-TW`，真实 resolver 返回 **zh-Hant-TW**；两宽/两字级/真实明暗，共 **8 cases** |
| 本补丁十四语种实际覆盖 | 按实际 resolved locale 去重共 **14 语种、112 cases**；并非把 13+DEFAULT 的数量直接当十四语种通过 |
| 额外 DEFAULT 简中 | 宿主 zh-CN，另 8 cases；总运行 120 cases，不计作新增语种 |

维度为 {320,420dp} × {fontScale 1.0,1.3} × {light,dark}。真实 AI Preference/ListView 和 child Views 观察标题、summary、hint、contentDescription、分类、默认输入、五档、诊断展开按钮等；无静态文字裁切，档名不超过两行，最大预览全文单行/lineEnd 完整。实际 onDraw caption box 在视频框内，独立窄窗口检查语言 picker 的十四行与按钮。中文/英文/日语/阿语 320dp 大字明暗 screen/preview/picker PNG，以及繁中同规格帧均保存。

主要证据：`android/matrix-final-10/complete.json`、`presentation-coverage.json`（最终 matrix 内的 onDraw/窄 picker 观察）、`inventory-final/actual-controls.json`、`inventory-final/source-call-sites.json`。inventory 共 11,760 个实际观察，193 个当前源调用点/26 类，将真实控件、资源 slot/模板、locale 与运行时值关联；用户数据和技术报告正文单独注明。原规划者 141 调用点/22 类的历史清单保留。UI locale 变化不写 caption 配置、无新增翻译调用。反向 Activity ja/en + Morphe ZH、script/region、id/in/fallback 由真实宿主/反例测试覆盖。

夜间必须实测官方 `Utils.isDarkModeEnabled` 与 `ThemeUtils.getDialogBackgroundColor`，不能只看传入 dark=true。最终暗色均观察为 true、背景 `#FF080808`；亮色对应亮背景。早期 dark 参数未影响 Resources.getSystem 的错误 fixture 与 profile 键盘遮挡/选择顺序探针失败保留，修正的是独立验证宿主，产品主题/owner/按钮路径未改。

## 真正 Android 交互与边界

明确序列号 **emulator-5554 / SDK35 / ART/WMS**。验证宿主独立从最终 APK 复制所有 11 个 DEX、resources.arsc/生成 XML；只添加新 instrumentation DEX 与最小验证 manifest，没有替换官方类或生产方法。每个 copied entry SHA 在 `android/n33-host-final-10*/provenance.json`，真实 pointer 经过官方 DebouncedItemClickListener。没有手机写入。

- 日语真实 light/dark 完整动作与 DEFAULT+繁中完整动作均 PASS。Morphe 根→视频→AI→真实多选窗口；14 纯名称/checkbox，选法语+简中并保存、重开、取消修改、Back 均保持存储一致；返回 AI/视频/根及正常 General 导航通过，无意外重启/BadToken/VerifyError。
- 真点 API Test：空 key 请求 0；本地 `127.0.0.1:38433` mock 成功和 HTTP503 失败到达端点、结果按当前 UI locale 显示、按钮恢复 enabled。模型真实 GET /models、PopupWindow 可见、选择第二模型持久化；模型 HTTP503/空列表提示和请求途中切换法语后的 UI 反馈另在 `actions-extras-final-10` 验证。
- 真点保存完整诊断：MediaStore 实际新增文件，IS_PENDING=0，UTF-8 内容与 fullText 原始报告相等（仅观察时钟字段归一），成功提示本地化。文件名与 UI 提示分离，不改变 N30 导出方式。
- 实际创建/改名/删除 profile，名称含中文/俄文保留；清 encrypted key、真实 cache 文件、reset 三坐标、清 diagnostics probe 各完成。Android9 copyPages 的真实分段窗口/序号/clipboard 在 SDK35 调用生产分支验证，并保留 SDK28 JVM 分支测试。
- **未运行真正 Android9 WMS 或用户物理手机完整播放**；不把 SDK35 上的分支窗口当 Android9 OS 验证。不宣称十四语种母语审校、真实视频翻译语义全绿或 N34 漏/晚/短已修复。

动作原始事件/Toast/窗口/PNG：`android/actions-final-10-light`、`actions-final-10-dark`、`actions-final-10-hant`；完整资源/模拟器覆盖仅针对本补丁 UI，不扩展官方宿主的语言枚举。

## 请求、旧测试与冻结事实

| 检查 | 最终结果与证据 |
| --- | --- |
| N30 before Java | 669/669，`before-java/result.json` |
| N33 当前真实全量 Java | **676/676**，failure/error/skipped=0，`full-final-06/result.json`；增加 7 个反例测试，没有虚报 695 |
| Python 计分板 / release metadata | **27/27、11/11**，对应两份 python 日志 |
| 实际请求/cache/source/block/page 对照 | N30 与最终 N33 各 104 次 loopback 请求；default/custom × zh-Hans/zh-Hant/ja/ar × 13 UI locale，cfg.prompt、effectivePreference、RebuildApi.prompt、cache identity、actual request JSON、实际 plan JSON **零差异** |
| 18 中文业务 golden、并发/生命周期/源/几何 | 原断言保留，最终全量通过；未改 Controller/Session/Cache/Planner/Source/语言政策/RenderSpec/font/metrics |
| 冻结计分板 | **4 通过 / 4 既有失败 / 4 未验证**；三 invisible_ms=0；ACCEPTANCE/frozen 不改，不据此宣称语义全绿 |
| 原测试文件差异 | 只改 ProfileUiRegressionTest 的 display-only/in-place UI 预期、N30ConnectionFailureTest 的 build 标记，以及 localization-expected.json 的 55 个 UI 值（28 summaries + 27 档名）；旧 profile revision/rebind、HTTP/retry/timing/golden/publication/lock 条件保留 |
| 历史保护 | 80 件历史交付及开工捕获 277,713 个旧文件 bytes/SHA **0 差异**，原失败证据/候选保留；新输出统一 n33 |

实际 HTTP 对照：`actual-request-parity-comparison-final-10.json`、`baseline/n30-actual-request-parity.json`、`android/parity-final-10/ui.json`；既有 UI 值逐项 before/after：`changed-existing-ui-expectations.json`。N30 frozen 49 个受保护路径逐字相等，原诊断构建标签变更是本卡允许项。

## 正式包反读与负例

- AI-only、Remember-only、AI+Remember 共 **3/3** 新 JVM/真实 Patcher 会话与序列化审计通过。AI 关闭仍保留已选原生语言、既有简中不重复/API0；Remember-only 无 AI 设置/自选添加，记忆路径保留。旧公开 root 具名拒绝，不改选别的 root。
- 最终组合实际 **92 个 patch PASS**，N30 同官方 1.45.0 是 93（删除一公开 root）；历史 84 是更旧输入的计数，未硬改成 84。原 hook/resource/结构断言保留，变化分母如实报告；Spoof signature default=false 未选。
- 最终 **11 DEX / 58,257 类；完整方法/分支计数见 final-10-apk-branch-audit.txt**，invalid/dex problem/binding failure=0；N30 58,236 类，增加 21 个本轮 UI/编译生成类。
- MPP（包含自身 root DEX 和内嵌 extension）/独立 MPE 均通过同一分支与原始 code_item 交叉审计；MPP 47 root 类，extension 1468 类，无 JVM fixture、验证 host 或替换官方类。
- 39 个原/最终官方设置相关方法解析后比较寄存器、引用、跳转偏移、异常处理完全一致，含 AbstractPreferenceFragment initialize/onCreate/语言 callback；无 SettingsBindingPatch 或 31/32 新类型，未恢复 N27 callback/avoidance。
- 三份实际 compiled Morphe XML 各一个 AI 入口、视频/旁白之后、无旧根入口；原 Screen/keys 不变，资源表包名 fallback 可读取目标 locale。aapt package/version/minSdk、XML、240×14 XML/实际资源池检查通过。
- 残缺 locale bundle、未知菜单 signature 的 patch/partial DEX、旧公开 root 均拒绝；保留 negative/log/partial，不把最后成功覆盖早期失败。

## 用户短复验

1. 看 AI 和“自动翻译语言”小字是否准确；语言窗口保存两项、重开、取消/Back，返回 AI 页面。
2. 用自己的配置点 API 测试、刷新模型并选择、保存完整诊断。
3. Morphe 日语查看未自定义默认要求、预览、五档名、诊断按钮；确认原 custom、key、model、profile 名与选中语言仍在。官方繁中仅通过 DEFAULT 跟随繁中宿主，不新增枚举。

本轮远程翻译 API、新依赖/下载、手机安装/启动/清数据/写入、Git push/发布均为 0。完成即停，不生成 N34 卡、不开始 N34。


## 实现提交身份补记

- 已验证实现提交：`b52b65b7a206f1a07464dae62dc30cabc164bf10`；锚点：`anchor/n33-b52b65b`。
- 本补记为 docs-only 后继；非 docs 源树与锚点完全一致，三件套哈希及最终测试输入不变。
- 最终 Java 输入 SHA256：`599169b13f3da65385f9c1cbf06c6e7c6eab6a930425201e928e81b0dfe0e2f2`。
- N33 完成并停止；N34 未开始。
