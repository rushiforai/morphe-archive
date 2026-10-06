# N28C Codex执行卡：非中文分页、真实字体测量与RTL呈现

日期：2026-10-02。Codex完整负责本卡实现、验证、建包、最终DEX审计、提交与交付；不交DeepSeek，不自动开始第四期，不恢复N27避让。

## 1. 基线与本卡定位

仓库：`E:\Projects\morphe-caption-v2`。开工HEAD `8e28f4b`；N28B源码 `d02d7cc`，锚点 `anchor/n28b-d02d7cc`，HEAD之后仅docs。先核对两份PROJECT-STATE、N28B交付记录和工作区；若不符先停止，不覆盖其他改动。

N28B已完成源/目标/policy/request/review/cache接入，呈现仍为`legacy_n26`。N28C是首次改变非中文可见呈现的阶段：非中文分页、真实Paint/StaticLayout几何、字素安全切口、RTL/BiDi、数字/Latin混排、14目标固定矩阵，并安排有限真机观察。中文legacy行为必须保持。

冻结：源word/token/quote/time、静音/speaker/ownership、请求/鉴权/供应商/并发/预取/storm/重试、NativeCaptionBridge、菜单/字节码、N19字号/FontMetrics比例、用户配置/UI资源、N27避让、ACCEPTANCE与frozen baseline。无新依赖、无模型/SDK下载、无远程翻译API验证。

## 2. 语言策略硬/软边界

复用N28B immutable context/profile/policy；不从UI locale或文本脚本猜语言。目标完整code/地区/脚本决定profile和方向。覆盖zh-Hans、zh-Hant、ja、ko、en、es、fr、de、pt、ru、vi、id、ar、hi；其他目标保留generic fallback。

中文：保留N26/N28B的8CPS、旧12–18偏好/评分、旧最小页、时间分配、字体和黄金结果。N28C不能通过替换中文路径来统一所有语言。

非中文：reading为可见扩展字素；CPL为软预算/告警，真实TextView/StaticLayout宽度为硬约束；7秒为软目标；最多2行、字素完整、源窗归属、真实几何为硬约束。ja 4/13，ko 12/16，en 20/42，es/fr/de/pt/ru/vi/id 17/42，ar 20/42，hi 22/42；这些参考值不能单独触发空计划、付费repair或删字幕。韩语0.5仅用于CPL，不能移植到CPS。

## 3. 分页与Unicode

将目标context/render spec传入真实`RebuildPageLayout`和现有布局预算，不能用可变全局语言。使用Android ICU `BreakIterator`显式目标locale：character边界生成UTF-16安全切口，line边界生成合法候选；必要时与现有标点/依赖边界取交集。

覆盖NFC/NFD、越语多重mark、阿语组合符、Devanagari virama/nukta/ZWJ、Hangul Jamo、emoji ZWJ/flag/modifier、surrogate、NBSP和CRLF。保留逻辑字符串，不NFKC、不倒序、不插可见方向标记、不按UTF-16 code unit切。API28 ICU版本限制如实记录，不声称全Unicode最新规范。

中文走旧分页路径；非中文取消旧全局8CPS/12–18码点/中文最小格的误杀，但保留两行、真实几何、字素、源归属、静音/speaker和结构拒绝。优先合法locale断行和标点/依赖切口；一行可用优先一行，最多两行；时长仍分配在同一accepted event窗内。超软读速/CPL只记英文watch，不能借邻窗、不重复文字、不加技术占位。硬几何无解时沿既有安全空白策略。

## 4. RTL与真实绘制

RenderSpec必须被真实`CaptionOverlayV2.LayoutBudget`、`StaticLayout.Builder`、TextView绘制和compact/preview测量使用。ar为RTL，其余LTR，generic FIRST_STRONG；UI语言不决定字幕方向。逻辑字符串保持原序，由平台BiDi处理数字/Latin型号，禁止手工reverse。

验证混合`J-20`、`12`/`١٢`/`१२`、标点、括号、Latin型号；每页≤2行、无截断、无孤立组合mark。位置、透明度、五档字号、全屏比例、用户拖动基准不改。不引入控件避让或动画，不重写N27生命周期。

## 5. 缓存、诊断与范围

N28B策略/cache身份继续有效；presentation policy版本进入需要区分的非中文cache/trace，中文legacy旧空间保持。cache读取用相同context/render spec重验；UI locale不清缓存、不改变目标。

新技术字段/reason全部英文，按变化去重，至少记录`target_code/profile_id/direction/reading_units/line_units/max_lines/actual_width_px/line_count/soft_reading_target/soft_cpl_target/presentation_policy`。hard reject和soft advisory分开，不把soft warning算准确率，不写密钥/签名URL；原文、译文、用户内容与provider原始证据不改写。

## 6. 必须由Codex完成的验证

必须经过真实生产入口，不只测纯分页函数：

- en→Hans/Hant保持N28B中文golden；fr→ar、en→en、zh→en、ja→fr、de→ar、hi→en、vi→fr、ko→en、pt-PT/pt-BR各一；UI locale切换不改变source/target策略。
- 固定Unicode边界/计数与页面切口；非中文长词、数字混排、RTL组合、fontScale/density、详情页/横屏全屏、标准/超大字号。
- 切换source/target/地区码/UNKNOWN、签名轮换、旧Job迟到、cache冷/热、换视频、暂停/seek/rotate；不串旧结果、不留RTL残留。
- 非中文超软目标但硬几何可行时仍显示正文并记录watch；sourceOnly/manual/AI关闭API0；调度/ownership/原文时间不回退。

Java基线538加新增测试如实报告，Python27、220×14、冻结4/4/4且三类不可见0、84组合、最终DEX/branch/aapt/apksigner/历史hash全部执行。不得固定旧类数；N27类/事件/回调仍必须0。正式交付使用：

- `build/local-test/patches-1.3.5-本地测试包-n28c.mpp`
- `build/local-test/extension-1.3.5-本地测试包-n28c.mpe`
- `build/n28c-composition-final/YouTube-21.16.256-本地测试包-n28c-unsigned.apk`

## 7. 真机验收（本卡首次强制）

Codex先完成自动化与候选包，再交付未签名包等待用户安装。用户只做客观观察，不承担母语语义审校：

1. 启动/主页/设置/中文目标正常；暂停、seek、换视频、旋转无闪退或明显回退。
2. 中文字幕与N26对照：分页、字号、位置、时间归属不变。
3. 选少量可辨认目标观察版式：ar（RTL+数字/Latin）、ja或ko（宽度/行长）、de或fr（长词）。只看截断、超过两行、孤立组合符、方向/混排、字幕消失或跨窗，不判断译文自然度。
4. 切换应用UI语言与目标语言，确认策略不随UI串变；切视频并回看同段，确认冷/热cache不串字幕。
5. 导出完整诊断和版本/设备/Android/target/UI locale/时间段；异常原样回传，现场不改代码、不清数据、不随机重复。

真机只承担启动、稳定性、客观几何/方向/切换观察；14语种语义准确性不由用户验收。真机失败时Codex根据诊断判断回退B还是修C，不在C里掩盖B问题。

## 8. 交付与停止

一个实现提交，锚点`anchor/n28c-<实际短哈希>`；docs-only写实可另提交，工作区干净。`docs/N28C-LOCAL-TEST-BUILD.md`须记录profile/counter/render/pager参数、中文golden、自动矩阵、真机清单/未覆盖、三件套hash、输入/DEX/history。完成本卡后停止，不自动第四期；未签名、未推送、未发布，无下载/依赖/远程翻译API。N27搁置、VISIONOS关闭、最终summary/UI多语种/诊断英文问题留最后统一审计。
