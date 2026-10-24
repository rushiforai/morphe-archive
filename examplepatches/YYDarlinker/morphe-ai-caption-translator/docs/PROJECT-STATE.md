# PROJECT-STATE — 1.5.7 发布（N40–N48 修复；N49/N50 上游评估；N51 两层投影；N52 显示保证；1.5.5 发布；N53 字幕图层/字号；N54 原生样式/分页评估；N55 动画双时钟；N56 回归修复/恢复拖动；N57 拖动/抖动根因；N58 稳定图层/触摸代理/视口档位；N59 Patcher 2.0.0/Morphe 1.48.0 适配与语言菜单功能删除；N60 Flyout VerifyError 修复；N61 字幕越界/档位/Shorts 字号图层；N62 评论区快速换档/AI 开关即刻生效/短字幕框宽；N63 评论区动画同步字号/AI 首视频遮挡原生样式；N64 官方 CC 显示权威/无 CC 不显示 AI 译文字幕；N65 评论区端点预排/字号与布局解耦；N66–N68 AI 会话恢复/滚动字幕重建）

## 1. 当前身份

- 活动仓库：`E:\Projects\DeepSeek morphe-ai-caption-translator`
- 分支：`dev/1.5.5-deepseek`
- 基线：`2c96054` / `v1.5.4`（2026-10-14）；1.5.5 发布提交 `40d5d58`，已合并 `origin/main`（`a42c593`）
- 版本：1.5.7；发布构建 `release-1.5.7`（N65 评论区端点预排/字号与布局解耦 + N66–N68 AI 会话意图/恢复与滚动字幕重建）。
  官方 Morphe Patches 1.48.0 / Patcher 2.0.0；YouTube 只声明 21.x 目标：21.42.241、21.41.525、
  21.28.208、21.23.492、21.20.405、21.16.256（按用户要求不再声明或适配 20.x）
- 发布状态：已发布 **1.5.7**：annotated tag `v1.5.7`，发布提交 `18c6141`；`main` 与 `dev`
  已指向该提交。GitHub release
  `https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/tag/v1.5.7`，资产
  `patches-1.5.7.mpp` **587,256 B** /
  `41D96E4B65ED9419854E02013BA71D73B884AD444683DDD559EC32E74DA77159`；匿名下载校验通过
  （大小与 SHA-256 一致）。`patches-list.json`、`patches-bundle.json`、CHANGELOG、README
  均已指向 1.5.7。上一发布 1.5.6：tag `v1.5.6` → `2b96358`，资产
  `patches-1.5.6.mpp` 578,441 B / `E272FCE1…`。旧本地 1.5.5 资产（`CB4D3135…`）保留在证据目录
- 模块：`caption-contracts`、`caption-shared`、`translation-core`、`infrastructure`、`application-host`、`presentation`、`ui`、`patches`、`ui-preview`
- 开发环境：`.devenv/`（JDK 21、Python 3.12、Android SDK 35/36、Robolectric 均在 `work/toolchain/`；Gradle home 为 `work/gradle-home/`）

本文件只描述当前有效状态。`docs/N*`、`docs/WORKSPACE-MIGRATION-20261005.md`、`.verification/`、`recovered/` 中的旧路径、旧锚点和历史交付是证据，不是当前施工入口。

## 2. 本轮诊断

输入诊断：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.4-20261017-231646.txt`（2,531,895 B，导出时间 2026-10-17 23:16，观看 493 s，44 次请求 / 44 次 2xx，模型 `qwen3.7-flash`，`source=ja`、`target=zh-Hans`）。

诊断里被用户看到的现象是“显示原文而非译文”。逐条核对 `REBUILD_PRESENTED`/`REBUILD_DISPLAY_RESULT`：

- 55 帧可见字幕的文本是日语（含假名），其 `id` 形如 `45:5:source:6:154292_157167`，即 `session:generation:source:block:start_end`。这不是“原文模式”（原文模式为 `source:start_end`，且不拥有原生轨道），而是渲染期的原文兜底分支。
- 同一时段还有 23 次 `REBUILD_EVENTS_REJECTED`：`source_quote_mismatch` 20、`json` 1、`event_shape` 1、`output_truncated` 1；即 44 次请求里只有 21 次拿到可用计划。
- 失败高度集中：块 5 请求 5 次、块 6 请求 8 次、块 0 请求 5 次（跨会话），块 7 在 `b6` 修好前一直只能显示原文。

## 3. 根因

### 3.1 原文显示是上一轮自己加的兜底（直接原因）

`RebuildController.render()` 有两条用源 cue 文本替换译文的路径：

- `failed_source`：块 `FAILED`，或 `WAITING` 且已尝试 ≥2 次时，直接把 `originalCue(s, …).text` 当作字幕显示；
- `gap_source`：计划已就绪但当前时刻落在所有显示单元之外时，同样显示源 cue。

它们把“不空白”误实现成“显示原文”，与“任何情况下不显示原文”直接冲突。删除这两条路径即可根除该现象，但这只是症状；必须同时解决“为什么没有译文”。

### 3.2 整块译文被丢弃，是被引文身份判定丢掉，而不是翻译质量差

1. `RebuildSource.join()` 在**非 CJK 标点**后、拉丁字母前插入一个空格：`「` + `AppleUnsold` 渲染成 `「 AppleUnsold`、`と、` + `Apple` 渲染成 `と、 Apple`。提示词里的 `source_text` 和每条应复制的引文都带这个空格，而模型自然复制的是视频里的 `「AppleUnsold`。
2. 旧的引文比较只做 `\s+` → 单空格归一（不忽略空白），一个空格就判 `source_quote_mismatch`，整块 4–9 条译文全部丢弃。
3. 旧 `exactQuoteRebind` 有两个结构性缺口：
   - 仅在 `from/to` 变化时生效（`changed == 0` 直接返回 0），所以“ID 正确、引文只差空白”永远救不回来；
   - 要求引文拼接后**逐字覆盖整个块**。模型在 `がしかし` 处丢掉一个 `が`、或把 `とのこと` 划进上一条，重绑定就整体放弃。
4. 证据（质量证据里的同块多轮回复）：
   - request 71（块 5）被拒时的 `exact source` 是 `「 Appleの展示スタンドや…`，而模型复制的是视频里的 `「Appleの…`；两者只差一个由 `join()` 注入的空格，比较逻辑却判为 mismatch。
   - request 70（块 5）把 `とのこと` 划进上一条、并在 `がしかし` 处丢掉一个 `が`；request 89（块 11）把边界整体后移 4 字但划分完整，靠重绑定救回；request 72（块 7）同理救回。可见失败量与“是否恰好逐字对齐”强相关，与译文质量无关。
   - 用新规则离线重放本诊断里的 6 条已捕获回复（requests 89、82、71、72、70、69）：6/6 全部可接受，其中 request 70/71（原本被拒的两次块 5）只需 1 个字符空洞。
5. 失败后的连锁：拒绝 → 结构重试（每块最多 3–4 次）→ `FAILED`/慢重试 → 当前时刻无计划 → `failed_source` → 用户看到日语。8 次请求的块就是这条链。

### 3.3 分页只看几何，不看阅读量

`RebuildPageLayout.plan()` 与 `CaptionLanguagePager.plan()` 只要整段文本能排进两行就返回单页。本机 `available_width_px=2025`、`text_size_px≈48.7`，两行可容 ~80 个汉字，于是出现：

- `id=45:5:0:63-154` `dur=14709`、`reading_units=67`、`page_duration_above_recommendation=true`，整段 68 字（68 个可见字符，67 个阅读单位）一次性停 14.7 s；
- `id=45:5:2:375-444` `dur=12042`；`id=45:5:9:1332-1374` `dur=11830`；
- 覆层只把 7 s 建议写进 `REBUILD_PRESENTATION`，从未据此切页。

### 3.4 翻页落在模型的事件边界上

显示单元 = 模型给出的一条事件（或若干条合并）。模型的分段会产出 `据该邮件显示，`、`はい、堂々と宣言してしまっています` 这类半句，以及与上一句拆开的短引导（`最近，科技产品行业` / `在全球范围引起热议的` 为流式预览片段）。合并层 `RebuildDisplayGroups.readable()` 原来限制 5 s / 3 行，短引导来不及与后半句合并就单独成页。

### 3.5 第三轮诊断（2026-10-18 15:04）确认的三点

输入：`caption-diagnostics-1.5.4-20261018-150443.txt`（2,277,316 B，观看 165 s，28 次 API，23/26 结构接受，仅 3 次拒绝）。

1. **配对不佳、分句被切开**：上一轮把“每段文本怎么切页”交给了一个按字数和几何打分的代价搜索，它对“这个逗号后面是不是还在说同一件事”没有概念，于是：
   - `当然，` 被留在上一页末尾（`而中国的现代化努力往往被低估 当然，` / `现在有很多不同的声音存在`）——分句只切出前几个字就挂到上一页；
   - `…原因非常简单：` 单独结束一页——冒号是引子，必须和后面一起看；
   - `首先，之所以受到如此关注，` / `原因就在于…` 被拆开。
2. **对轴变差**：99 条页面记录里 **73 条是多页切分**。多页页面的时间只能按阅读量在事件窗口内估算（`page_basis=ESTIMATED_PAGE_TIMING`），一页 1–2 s 的偏移累积起来就明显；而单页页面用的是事件自身的精确窗口（`SOURCE_EVENT`）。
3. **长句被翻坏**：`b4_243_313` 是一条 70 词的英文比较句（"more impressed with russia … than they are with china …"），模型把它切成两条事件，第二条只剩 `他们对中国从一无所有到组建航母舰队、率先美国部署五代战机，` —— 谓语留在上一页，中文不成句。提示词只给了“12–30 个汉字一条”的字数目标，没有说“每条事件必须自己成句、比较结构不许拆开”。

## 4. 本轮修改（第三轮）

### 4.0 一句话

**页面单位回到“模型给的事件”，只有多句事件才按句子切；模型侧明确要求每条事件自己成句，并把“把没说完的句子翻成句号”记成诊断。**

## 4. 本轮修改

### 4.1 引文身份按可见字符判定，并允许极小的源空洞

- `RebuildProtocol.sameSource()`：`source` 引文与源文本按**去掉全部空白后的字符序列**比较；空格、全角空格、换行都不再构成不匹配。
- `RebuildSource.join()`：CJK 标点（`0x3000–0x303F`、`0xFF00–0xFFEF`、全角引号/省略号/破折号）后不再插入空格；英文、俄文等有空格文字仍保留词间空格。
- `RebuildProtocol.alignBySource()`（取代 `exactQuoteRebind`）：把整块源文本压成字符序列，按事件顺序在序列中定位每条引文，起点与终点都必须落在 token 边界；相邻引文之间、块尾允许 `MAX_HOLE_CHARS = 4` 个字符未被翻译（显示时直接不出现），更大空洞、乱序、改写、越界 ID、首条事件不覆盖块起点一律失败关闭（fail closed）。
- `parseInternal` 接受 `from > next` 的小空洞；首条事件仍必须 `from == b.from`。
- `RebuildDisplayGroups.adjacent()` 允许跨该空洞合并，因为空洞本来就不显示。

### 4.2 任何情况下不显示原文

- 删除 `failed_source` 与 `gap_source` 两条兜底；`render()` 在 `FAILED` 或计划就绪但当前时刻无显示单元时不产生文本，走 `hide()`，诊断记 `translation_failed` / `source_gap`。
- 仅当块仍在 `WAITING`（还有请求要发出）时显示中性占位“翻译中…”，不显示任何源语言内容。
- 原文模式（`sourceOnly`）保持原样：那是用户显式选择的“显示原文”会话，不拥有原生轨道，不属于翻译失败路径。

### 4.3 分页标准：一行一页，整分句打包

“分句”指两个标点之间的完整片段。页面按下面四条规则生成：

- **P1 一行一页**：页 = 能排进**一行**的连续若干个完整分句；页边界只落在 `，。！？；：,!?;:` 之后（引号、括号等收尾标点属于前一分句）。任何页面都不会出现“某分句的上半段”。
- **P2 两行的唯一理由**：单个分句本身排不进一行（且排得进两行）时，这一页用两行；分句超过两行才允许在分句内部再切（按测量回退）。
- **P3 引子不落页尾**：页不会以 `：` 或“≤ `referenceCpl/2` 字的连接分句 + 逗号”结尾（`当然，`、`因此，`、`首先，`、`正如其名所示，`）。打包时从候选页尾向前回退到第一个非引子分句；只有该页只有一个引子分句时才保留。
- **P4 缺句末标点不干扰**：只依赖分句标点，不依赖句号是否存在；尾部没有标点的分句就是最后一页。合并/时长判断同时看**源侧句末**（`RebuildSource.terminal`），模型漏写句号不会被误判成“话没说完”。
- **P5 整句为单元**：显示单元（合并后的片段）可以占两行，但页仍由分句打包决定；单元末尾不足 10 字且无标点的残尾并入上一页，不单独闪一页。

时间分配：单元首尾仍取事件/合并单元的精确边界，页内按“可见字数 + 标点停顿”加权，页切换因此落在语句的停顿处。

模型无关性：无论模型把同一段译成一条长事件还是七八条碎事件，最终页面都由“一行 + 完整分句”重新组成——分得太粗由打包切开，分得太碎由显示合并（合并后可占两行，页仍按分句打包）拼回。

模型侧同时收紧（`RebuildGuidance`，追加到每个请求，不改动被审计的 pinned 提示词字面量）：每条事件是一个完整的短语或句子、理想一行、最多两行；长句只在“两侧都各自有主语和谓语”处拆；介词短语、动宾、`more A than B` 这类比较结构、关联词不得跨事件；不得在源句没说完时在译文里收句，也不得为凑长度把事件切短。

诊断侧新增 `invented_sentence_end`（advisory）：源词在边界处不是句末、译文却收句——这正是长比较句被翻坏时的形态，便于后续取证。

### 4.4 第五轮补充：分句页的“引子”和“尾巴”

第五份诊断（`caption-diagnostics-1.5.4-20261018-222712.txt`，deepseek-flash）暴露了第四轮留下的三个缺口：

1. **合并根本没发生**：为了让合并单元 = 一页，第四轮把合并条件收紧成“合并后必须排进一行”。DeepSeek 逐分句输出（`在2月24日之前` / `你在网上不用费多大劲就能找到一些人` / `声称俄罗斯拥有世界第二强大的军队`），三条加起来 41 字、排不进一行 → 不合并 → 一句被拆成三个 1 行页，页页是残句。
   → 合并条件改回**两行**：单元可以是一整句，具体页仍由分句打包决定（一页一行）。
2. **引子分句被留在页尾**：`它之所以引起关注，理由非常简单：正如其名所示，` 把 `正如其名所示，` 留在上一页，而它显然属于下一句。第四轮只把“≤4 字 + 逗号”“冒号结尾”视为引子。
   → 引子判定放宽到 `referenceCpl / 2`（中文 8 字），且打包时**从候选页尾向前回退到第一个非引子分句**；只有整页就只有一个引子时才保留。
3. **残句尾巴闪一页**：`我想谈谈`（4 字、无标点、来自模型把一句切断）单独成页，只显示 0.8 s。
   → 单元末尾不足 10 字且不以标点结尾的“尾巴”并入上一页（该页用两行）。

探针（真实文本、按行容量谓词）：

| 文本 | 每行字数 | 结果 |
|---|---|---|
| qwen 四句块 | 41 | 4 页；`理由非常简单：正如其名所示，该网站专门经营…产品”，` 同页（引子随下一句） |
| 同上 | 23 | 5 页，全部整分句 |
| DeepSeek 三段碎句合并 | 23 | 1 页两行（整句） |
| `虽然…但事实是…` 合并 | 23 | 2 页，第二页两行 |
| `本质上，…` 引子 | 23 | 1 页两行 |
| `…所以…，我想谈谈` 残尾 | 23 | 2 页，尾巴并入上一页 |

## 5. 当前验证

本地 `.devenv`、JDK 21、Robolectric：

- `:translation-core:testDebugUnitTest`：204 tests，0 failures / 0 errors / 0 skipped
- `:extensions:extension:testDebugUnitTest`：290 tests，0 failures / 0 errors / 0 skipped（49 个结果文件）
- 本地化检查：243 keys × 14 locales，通过
- `tools/verify_integration.py`：`errors=[]`，75 个 core class，14 个 locale 文件，MPP `build/n39/gradle/patches/libs/patches-1.5.4.mpp`，内嵌 MPE 与独立 MPE 相同
- 第四轮分页探针（谓词化的行容量，真实文本/时长）：

| 文本 | 每行字数 | 结果 |
|---|---|---|
| qwen 四句块（12.8 s） | 41 | 3 页：`…原因非常简单：这个网站正如其名一样，` / `专门经营…过深的黑暗。` / `这到底是怎么回事呢？` |
| 同上 | 23 | 4 页，全部整分句 |
| DeepSeek 长疑问句（11 s） | 41/23 | 2 页，均整分句（`…如此之少，` / `那么这些…从哪来的？`） |
| 结尾缺句号 | 16 | 3 页，末页无标点即最后一页 |
| `当然，` 引子 | 14 | 2 页，`当然，` 不单独成页 |
| 单个长分句（29 字） | 18 | 1 页两行 |

- 新增/更新回归（第四轮）：
  - `ClausePaginationTest.pagesAreRunsOfWholeClausesThatFitOneLine`（页 = 一行内整分句；两行只能是单分句）
  - `ClausePaginationTest.aMissingFullStopDoesNotChangeThePageBoundaries`、`aMissingFullStopKeepsTheLastClauseOnItsOwnPage`（漏句号不影响分页）
  - `ClausePaginationTest.aBareDiscourseMarkerIsNeverAPage`（`当然，` 不单独成页）
  - `ClausePaginationTest.aLeadInClauseNeverEndsAPage`（引子分句不落页尾）
  - `ClausePaginationTest.aShortDanglingTailDoesNotGetItsOwnPage`（残尾并入上一页）
  - `ClausePaginationTest.aLongUnbrokenClauseStaysOneTwoLinePage`（单分句两行例外）
- 既有回归（第一至三轮）：
  - `RebuildContractTest.aSpaceInsideACjkQuoteIsNotAQuoteMismatch`、`aDroppedParticleBetweenEventsIsRecoveredWithoutInventingText`、`aDroppedClauseIsStillRejected`
  - `ContinuousDisplayTest.aBlockThatFailedToTranslateNeverShowsItsSourceLine`、`aProviderInspectionRefusalOfOneBlockDoesNotStopLaterBlocks`
  - `RebuildDisplayGroupsTest.completeSentencesAndLongWindowsStayIndependent`
  - `PlannerGoldenTest.SYNTHETIC` payload 摘要按 `join()` 不插空格重新录制

尚未完成：

- 真机/实体设备复验（本轮只读诊断，未连接或写入手机）
- 带原始 APK 的完整 composition、签名安装包与发布打包（本轮只出 MPP）
- 14 语种母语人工质量验收


### 4.5 第六轮补充：没有标点也要能断开，且不再插入可见空格

第六份诊断（`caption-diagnostics-1.5.4-20261018-224619.txt`，qwen3.7-flash）里 **102 页有 59 页不以标点结尾**：模型大量省略句末标点，于是
1. 合并后的中文文本在事件之间被插入可见空格（`…排行榜 它们都信誓旦旦…`），读起来像乱码；
2. 分页器只认标点，没有标点就找不到切点，只能整段两行或把残句留在页尾。

修法：
- 合并事件之间的分隔符从**空格改为零宽空格 U+200B**（中文/日文）：屏幕上不可见、不占格，但分页器把它当作合法的页边界（`pageCuts` 识别 U+200B）。英文等有空格文字仍用普通空格。
- 分页器把“单元末尾”也当作一个切点，最后一段可以和前一段同页，不再被强行拆出。
- 请求侧把“不要丢标点”写成正向要求：`RebuildGuidance` 明确“每条事件按自己的源范围加标点：源句结束用句号，子句未完用逗号”。
- `visible()`/`endsClause()`/`leadClause()` 忽略 U+200B，避免零宽字符影响行长、引子与残尾判断。

探针（真实片段、按行容量谓词）：

| 文本 | 每行字数 | 结果 |
|---|---|---|
| 三段无标点碎句 `A​B​C` | 23 | 4 页（每段自成页） |
| 同上 | 41 | 2 页（A+B / C+D），不跨段切 |
| `…标准仍然是​一个国家坦克车队的规模​毕竟，​谁在乎…` | 41 | 2 页，`毕竟，` 不落页尾 |
| 长句 + 三个子句 | 41 | 3 页，每页整子句 |
## 6. 当前已知边界

- 翻译仍可能失败（网络、供应商、结构）；此时机制保证“不显示原文”，显示中性占位或空白，并在慢重试中继续尝试。
- 流式预览仍会先显示模型已返回的首条事件；若模型把一句话切成多个短片段，预览阶段仍可能出现短暂分页（最终计划会替换它）。
- 源字幕本身无语音/无 cue 的静默段不显示字幕，这是正确语义。
- 逐词同步在移动端没有可靠输入；cue 级估算与分页时间是诚实的边界。
- 一条很长的**单个分句**排不进一行时用两行；它超过两行才会在分句内部切。若一句话本身没有可用的标点，就没有切点，整句保持两行。
- 页内时间按“字数 + 标点停顿”估算；单元首尾是精确边界。若模型把一条事件拆成多条碎事件，显示合并只能在“合并后一行放得下”时生效，所以碎事件多时页数仍会略多。
- 模型是否遵守“每条事件自己成句”由供应商侧决定，本轮只能把要求写进请求并记诊断（`invented_sentence_end` / `paragraph`），没有硬校验去伪造语义。
- DeepSeek 一类模型倾向逐分句输出，译文本身可能不成句（如 `胜过对中国建造航母`）；显示层只能保证“不切断、不丢行”，不能替模型补出谓语。
- 空洞容忍上限 4 个可见字符：更大的省略仍按失败处理，避免把“漏译半句”当成成功。
- `possible_*` advisory 仍只写诊断，不阻止展示。

## 7. 2026-10-19 N40 调查与修复

- 输入：`caption-diagnostics-1.5.4-20261019-140237.txt`；根因报告 `docs/N40-ROOT-CAUSE-20261019.md`；修复记录 `docs/N40-REPAIR-20261019.md`；探针 `validation/runs/20261019-root-cause/`。
- 根因：自动原生默认覆盖 `CaptionChoice`、handoff 恢复的是当前 choice 而非记忆、克隆轨 `language` 硬编码 `zh-Hans`；繁体菜单优先原生标签；XML `<s t>` 被 `RebuildSource` 丢弃且 `nativeWordCount()==0` 时跳过 ASR 参照；人工轨一 cue 一请求且非英译中不做目标语言校验。
- 已修复：
  1. `CaptionVideoHandoffV2` 记忆优先；`NativeCaptionBridge` 忽略/重激活不同的自动原生默认；克隆轨保留真实 code；空 code 不再默认简体。
  2. `LanguageMenuOrder`/`translationLabel` 统一中文应用标签；新增 `relabelTranslation`，列表与元数据中的冗余 `中文（繁体中文）` 原位归一且保留 URL/vss/code。
  3. `RebuildSource` 消费 XML `<s t>` 片段（仅首 token 标 native）；自动轨粗计时也尝试 ASR 参照；页面 anchors 从真实停顿/分句边界传入 page planner。
  4. `planAuthored` 连续 cue 成块（≤4 cue/600 字符/20 秒），事件仍按 cue；`validateTarget` 对所有语言对拒绝假名/谚文错配、无目标文字和跨语言源文回声。
- 验证：`:translation-core:testDebugUnitTest` 210 tests、`:extensions:extension:testDebugUnitTest` 295 tests，0 failures/errors/skipped；本地化 243×14 通过；`:patches:buildAndroid` 成功（MPP `build/n39/gradle/patches/libs/patches-1.5.4.mpp`，592,591 B，SHA-256 `F6730F272D3E5D8565098981E7C1A21ADDC93640999BF9513A20C829AD47EE07`）；`core-provenance.json` 已同步。
- 未完成：新 MPP 的实体手机安装/诊断复验（本轮未连接或写入手机）；安装包 `applySelection` 分支身份；运行时 payload `detected_fmt`；非中文目标 fallback 页 anchors；真机 ABI/组合与母语质量验收。

## 8. 2026-10-19 N41 人工字幕 cue 翻页契约修复

- 输入：`caption-diagnostics-1.5.4-20261019-164921.txt`（1,280,827 B；观看 138 s；23 次 API）、`FzRyrjFmZSQ.ja.vtt`（400 cue，人工）、`mH5TlcMo_m4.en.vtt`/`.en.json3`（自动）；根因报告 `docs/N41-ROOT-CAUSE-20261019.md`；修复记录 `docs/N41-REPAIR-20261019.md`；探针 `validation/runs/20261019-authored-paging-root-cause/`。
- 根因：人工 cue 没有作为显示契约贯穿请求、解析、缓存、显示；`authoredUnits()` 是“一个模型 event 一个 Unit”，跨 cue event 由 `shareOut()` 按字符比例切；`reviewCues`/`authoredPrompt`/`cueDirective`/`widenContext` 全部未接线。自动源计时仍可能拿到无 `tOffsetMs` 的 JSON3/SRT 并缓存，页窗靠估计。
- 已修复：
  1. `RebuildPlanner.Block` 新增 `authored` + `cues`（`CueRange` token 范围/时间）；`planAuthored()` 写入 cue 契约。
  2. 新增 `RebuildCueContract`：完整 parse 后硬校验每个 event 只属一个 cue、每个 cue 恰好覆盖、无空洞；跨 cue/跳 cue 失败关闭。缓存 `read()` 也经此校验。
  3. 请求 payload 增加 `authored=true`/`display_cues`/600-token 上下文；prompt 在**同一套 `SENTENCE` 质量指令**后追加“cue 是固定页边界”的显示约束，不替换质量逻辑。
  4. 显示层改为“一个 cue 一个 Unit”：同一 cue 的多 event 合并为该 cue 页，页窗= cue 窗；删除 `shareOut()` 等字符比例切分。
  5. 缓存 identity 加入 authored/cue 序列/契约版本；旧缓存命中也会重新校验。
  6. `sameSource()` 增加去标点后逐字一致容错（仍拒绝改词/漏词）；`formatEvidence` 覆盖 JSON3/SRT；authored 单页标记 `AUTHORED_CUE`；`REBUILD_UNIT_MODE`/`REBUILD_EVENTS_ACCEPTED` 增加 cue summary。
- 真实验证：诊断 block `b5_375_444`（3 cue、7 个模型 event）修复后为 `EVENTS=7 UNITS=3`，三页窗口分别等于 cue 20/21/22；跨 cue event 返回 `authored_cue_boundary`。证据 `validation/runs/20261019-authored-paging-root-cause/fix-probe-output.txt`。
- 验证：`:translation-core:testDebugUnitTest` **218 tests**、`:extensions:extension:testDebugUnitTest` **295 tests**，0 failures/errors/skipped；本地化 243×14 通过；`tools/verify_integration.py` `errors=[]`、`prompt_and_protocol_literals_unchanged=true`；`:patches:buildAndroid` 成功，MPP `build/n39/gradle/patches/libs/patches-1.5.4.mpp` 594,254 B，SHA-256 `2DF97B0B0E9162AD35C06AF5EF262A48CF0E5266D73DD446A6765F2A54C461F6`；`docs/core-provenance.json` 已更新。
- 未完成/边界：cue 译文超过两行时仍受固定两行 UI 限制，会走 cue 内子句分页（本轮诊断 cue 均可两行）；authored 流式预览在完整 cue 覆盖前不显示；块 7 原始响应未保留；未连接/写入手机，真机安装与 after 诊断待用户验证。

## 9. 2026-10-19 N42 人工 cue 溢出、全语种分页、显示时长与“翻译中”

- 输入：`caption-diagnostics-1.5.4-20261019-180635.txt`（1,549,594 B；23 次 API 中的失败
  集中在 session 66 block 2 与 session 1 block 12）；真实 `FzRyrjFmZSQ.ja.vtt`（400 cue）；
  根因报告 `docs/N42-ROOT-CAUSE-20261019.md`；修复记录
  `docs/N42-REPAIR-20261019.md`；探针 `validation/runs/20261019-n42-root-cause/`。
- 根因：
  1. 显示页身份不统一：人工 cue 只在能放进两行时是页；>2 行时静默退回“按标点切”的另一条
     路径，overflow 子页没有身份，极端情况 `fullPage()` 返回 >2 行后空屏/截断。
  2. 不能独立成页的碎片 cue（真实 VTT cue 47 `が` 458 ms、cue 48 `しかし` 667 ms）被当成
     不可合并页；模型 event 868–871 合并二者，block 12 四次
     `authored_cue_boundary`，150.250–157.167 全部“翻译中…”。
  3. 语言被写成 `chinese` 布尔值：中文走 `legacy` 分页器，其它语言走另一套；`compactScript`
     让日语/韩语/泰语按有空格文字处理；`canApplyEnglishToChinese` 让 `ja→zh` 几乎无质量门禁。
  4. 数字按字面比较：`4 and a half` → `4.5` 被判 `numeric_substitution`（session 66 block 2
     请求 71/72 连续拒），整块不发布。
  5. 页规划几何优先：文本能放进两行就返回单页并占满 unit 窗口；诊断中 98 个唯一页里 8 页
     5–7 s、1 页 7.439 s，`softPageDurationMs` 只写诊断，不参与切页。
- 已修复：
  1. `RebuildCueContract` v2：`groups()` 把不能独立成页的 cue 合并为 display group；请求、
     解析、显示、缓存共用同一组边界；`partialUnits()` 支持人工流式完整 group 预览。
  2. `RebuildPageLayout`：删除中文 `legacy` 分页器与死代码；所有 target 走
     `CaptionLanguagePager` + 同一 `unitPages`；人工 cue >2 行显式投影
     `AUTHORED_OVERFLOW` 子页，单分句 >2 行在字形边界 emergency split。
  3. `CaptionScript`（caption-shared）用 ICU `UScript` 决定 compact/空格/目标 script；
     `compactScript` 不再等于“中文”。
  4. 质量门禁去语言特判：`validateTarget` 通用目标 script；`invented_sentence_end`/
     `dependent_boundary`/`fragmented_plan` 去 en→zh 前置；CJK 虚词参与 planner。
  5. `RebuildNumbers` 改为数值等价：分数/小数/全角/分组/万/百万；只有明确一对一值冲突才拒；
     拒绝诊断增加 `range` 与 `source_values/target_values`。
  6. 时间平衡分页：阅读时间 ≥2 s 且时长超过 comfort（3–5 s）时在完整分句上切；每页估计
     ≥2.2 s，否则保持单页；单分句不为时长硬切。
- 真实验证：真实 `b12_868_892` → group 47=868–890 / group 50=891–892，模型 event 868–871
  被接受，`UNITS=2`，窗口 150250–154292 / 154292–157167；`4 and a half`→`4.5` 由
  CONTRADICTED 变 EQUIVALENT；27 字/7 s 两分句 → 2 页（4.156 s + 2.844 s），单分句 9.6 s
  仍 1 页。
- 验证：`:translation-core:testDebugUnitTest` **226 tests**；`:extensions:extension:testDebugUnitTest`
  **295 tests**，0 failures/errors/skipped；本地化 243×14 通过；`tools/verify_integration.py`
  `errors=[]`、`prompt_and_protocol_literals_unchanged=true`、`compiled_core_class_count=76`；
  `:patches:buildAndroid` 成功，MPP `build/n39/gradle/patches/libs/patches-1.5.4.mpp`
  **595,658 B**，SHA-256 `EB29888EA1F9753FB18972F6F4623DAD4EF3E19E6467C3981127EA6A964B1902`；
  `docs/core-provenance.json` 已同步（含 `CaptionScript.java`）。
- 未完成/边界：未连接/写入手机，新 MPP 真机安装与 after 诊断待用户复验；翻译语义仍由供应商
  模型决定；碎片 cue 判定是保守集合（2 字 cue 也会合并）；单分句 >2 行只能 emergency split；
  中文数词/阿拉伯语数词仍为 `UNKNOWN` 不硬拒；语言 `referenceCps/referenceCpl` 仍需母语验收。

## 10. 2026-10-19 N43 机制调查（只读，未改产品代码）

- 输入：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.4-20261019-215759.txt`（2,130,053 B，
  4,890 条记录）；报告 `docs/N43-ROOT-CAUSE-20261019.md`；探针
  `validation/runs/20261019-n43-root-cause/`（3 个，已在本机工作树跑通）。
- 语种记忆根因：目标语言有五个权威（原生默认轨 / 原生显式选择 / timed-text URL 的 `tlang` /
  一次性 handoff / 点击默认），没有单一状态机；没有“用户尚未选择”状态，冷启动时 YouTube
  持久化的 `zh-Hans` 自动翻译默认被 `applySelection(..., remember=true)` 采纳成用户选择；
  记忆 `resolveRemembered()` 只能按当次原生轨道列表寻址，列表里没有该 code 就静默回退原生默认；
  唯一请求路径兜底 `CaptionVideoHandoffV2` 在真实视频切换顺序下被 `mayActivateAiTarget()` 拒绝
  （探针 `TmpLanguageAuthorityProbeTest` 复现；整份诊断 `VIDEO_DEFAULT_AI_RESTORED=0`）；
  请求路径始终按 URL 的 `tlang` 绑定，记忆没有否决权。
- 某些语种长时间无字幕根因：`RebuildNumbers.NUMBER` 左边界只排除 ASCII 字母，西里尔/希腊字母后的
  连字符被当作负号（`Т-14`→`-14` vs 源 `14`），`numeric_substitution` 整块拒绝；失败停留在
  `WAITING` 并进入无上限慢重试。诊断证据：session 58 block 4 在 56.5 s 内 8 次拒绝、9 次请求、
  21 帧等待记录（多为可见的“翻译中…”），该块从未发布；同块在 vi 会话被接受，证明与目标语种相关。
- 全语种翻页根因：页契约几何优先（≤2 行即单页），阅读时间只惩罚“停留太久”、不惩罚“文字太密”
  （实测 es 7/7、vi 4/4、id 3/3、ru 11/14 超参考 cps）；引子/残尾规则只在中文分支；
  `CaptionScript.compact` 把 Hangul 当无空格文字（合并事件丢空格、U+200B 可作词内页缝）；
  `reading_units` 把空格计入；profile 只有 14 种 + GENERIC。
- 状态：本轮只做根因调查与可复现探针；未改产品代码、未重建 MPP、未连接手机。结构性修复
  （单一选择状态机、跨请求 target 不变量、数量/标识符分离、语言无关页契约）尚未实施。

## 11. 2026-10-19 N44 全语种显示保证：设计 + P1/P2/P3 实施 + P4 脚本适配

- 输入：`D:\HONOR Share\Honor Share\` 下 32 份诊断（10-15 至 10-19，152 个会话、946 个接受块、
  177 次拒绝、22 个从未恢复的块）+ 32 例跨语种矩阵 + 全量源码审计 + Netflix/UAX/CLDR 外部标准。
  设计 `docs/N44-ALL-LANGUAGES-DESIGN-20261019.md`；实施记录 `docs/N44-REPAIR-20261019.md`；
  探针与语料脚本 `validation/runs/20261019-n44-language-coverage/`。
- 结论：问题不是“某语种翻译坏了”，而是三处单元/类别错位：
  1. 请求块=校验块=显示块（8–30 s），任何单 event 的任意检查失败都吃掉整块；
  2. 质量启发式（数字/语义/句末）被当成身份门禁；32 份语料里前四类拒绝占 87%；
     最新一份 11 次拒绝中 numeric_substitution 占 7 次；
  3. 语言知识写死在 15 个 profile/14 个菜单 code 里，68 个 code 中 51 个落到 GENERIC；
     裸 `zh` 也落到 GENERIC；RTL 只登记 `ar`；韩语被当无空格文字。
- 已实施（P1/P2/P3 + P4）：
  1. `RebuildProtocol.parseBestEffort()` + 新 `RebuildSalvage`：严格解析失败时逐 event salvage，
     合法 event 立即发布，非法 event 成为显式 `holes`；完整 plan 优先于 partial，partial 不缓存。
  2. 数字冲突改为 `numeric_observation`（advisory，文本发布）；`RebuildNumbers` 修 Unicode/符号
     边界（`Т-14`→14）、阿拉伯 U+066B/U+066C、全角负号、`억/करोड़/लाख/millones` 量级词。
  3. 引文降为提示（ID 权威）；目标文字/回声仍按 event 丢弃；authored 暂不 salvage。
  4. 控制器：partial 立即 READY、慢重试上限 3 次（`REBUILD_BLOCK_ABANDONED`）、
     一次有界缺口补请求 + 互不重叠 event 合并（只补新范围）、partial 洞与 FAILED 块都显示 `…`、
     新增 `REBUILD_PARTIAL_ACCEPTED`/`REBUILD_COVERAGE`/`REBUILD_COVERAGE_REPORT`/`LANGUAGE_PROFILE`。
  5. 语种：韩语空格、裸 `zh`→`zh-Hans`、RTL 脚本 `generic-rtl`、CJK/Hangul/Devanagari 脚本
     profile；阿拉伯/乌尔都/天城文/希伯来/埃塞俄比亚句读；Lao/Khmer/Myanmar 宽脚本。
  6. 人工 cue 也参与 salvage：`unitsPartial()` 只发布完整 cue group，缺失/半覆盖 group 跳过。
  7. 缺口子请求只针对最大洞的 token 范围；`mergeInto()` 只补新范围。`PAGE_DENSITY`、
     `LANGUAGE_TRACKS_AVAILABLE`、Indic virama 扩展、FAILED/`content_filter` 的 `…` 标记已接入。
- 验证：`:translation-core:testDebugUnitTest` **238 tests**、`:extensions:extension:testDebugUnitTest`
  **295 tests**，0 failures/errors/skipped；本地化 243×14 通过；`tools/verify_integration.py`
  `errors=[]`、`prompt_and_protocol_literals_unchanged=true`、core class 77；MPP
  `build/n39/gradle/patches/libs/patches-1.5.4.mpp` **602,726 B**，SHA-256
  `1420857BBDBA7A3731F88C31328BC12EFD8D1A51A85BCDB9B315520330F4669C`，embedded MPE 与独立 MPE 相同。
  矩阵 before/after：**22/32 拒 → 0/32 拒**；4-event 块由整块拒绝变为
  `ACCEPT(partial,events=3,holes=1)`。`docs/core-provenance.json` 已更新（10 个 adapter 哈希 +
  `RebuildSalvage.java`）。
- 未完成/边界：partial 缓存（按设计不启用）、字号按脚本标定（需真机视觉验收）、
  真机安装与 after 诊断；
  数字/语义仍 advisory，不代表译文语义正确。

## 12. 2026-10-20 N43 语言记忆修复（执行）

- 问题：冷启动 YouTube 持久化的 `zh-Hans` 译轨被当成用户选择；换视频后仍回到简体中文。
  上一轮 N44 只做显示/跨语种校验，N43 的记忆链路未执行；本轮补齐。
- 修复：
  1. 新增 `CaptionTargetPolicy`：每个前景译轨请求按“本次启动的显式目标”重写；冷启动剥离 `tlang`
     回源、无目标不启动付费翻译、菜单打开时放行。
  2. `followNativeSelection`：自动译轨永不写选择/不启动引擎；只有显式选择写记忆；本次启动有目标时，
     打开任意视频字幕直接按目标激活。
  3. `onVideoId` 不再 `CaptionChoice.reset()` 或重放上一视频 selection；目标 process-scoped。
  4. `CaptionChoice` 只由显式选择写入；`targetLanguage()` 跨自动重置保留；`markExplicitOff()` 保护菜单 Off。
  5. 原生默认选择器：冷启动无记忆回 `sourceDefault`，目标缺失用 `cloneTranslation` 克隆；
     `DeepSeekCaptionHookV2` 不再依赖一次性 handoff。
  6. `refreshNativeTrack` 用记忆目标的新鲜原生轨激活；自动译轨 deferred；引擎关闭不重选。
  7. 菜单窗口内的译轨请求直接确认目标（`TARGET_CONFIRMED_BY_MENU_REQUEST`），解决“选同一语言无回调、AI 不启动”；
     窗口 30 s，预扫描也算；无目标开启 AI 时提示选择语言。
- 验证：`:translation-core:testDebugUnitTest` **243 tests**、`:extensions:extension:testDebugUnitTest`
  **295 tests**，0 failures/errors/skipped；本地化 243×14；`verify_integration.py` `errors=[]`、
  ABI 记录已更新；MPP `build/n39/gradle/patches/libs/patches-1.5.4.mpp` **603,801 B**，SHA-256
  `E4966DB86841DF1F0BF28E3CAA5D9625909CB8864244930C0B64F0689C000E92`。
- 证据/记录：`docs/N43-REPAIR-20261020.md`；策略测试 `CaptionTargetPolicyTest`（5 tests）；
  `ShortsEngineSwitchTest` 已改为“自动默认不 takeover、显式目标跨视频跟随”。
- 未完成/边界：未连接真机；菜单勾选在个别版本可能仍显示旧项（实际请求/字幕已按本源逻辑）；
  `partial` 缓存、字号按脚本标定仍按 N44 的设计决定未启用。

## 13. 2026-10-20 N45 官方自动字幕策略与持久语言记忆

- 输入诊断：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.4-20261020-105645.txt`（5,832 B，
  SHA-256 `0A877EBEE9B49629E9E681CAFEFDD68D62B715499921BB9B4F3C75BFAE14DA1B`，16 条记录）；
  报告 `docs/N45-CAPTION-MEMORY-20261020.md`；证据
  `validation/runs/20261020-memory-and-official-autocaptions/`。
- 现场：字幕自动显示且 AI 开时显示 YouTube 原生**原文**；AI 关时显示 YouTube 原生**目标译文**。
  根因：`RememberedCaptionSelection` 仅进程内、诊断 `decision=-1`/`choice_known=false`；旧
  `CaptionTargetPolicy` 在无记忆时把 `tlang=zh-Hans` 译请求剥成源请求
  （`TARGET_POLICY_APPLIED decision=-1;from_translated=true`），AI 无目标可启动，原生源字幕显示；
  AI 关时提前返回原始 URL，原生译轨又显示译文。背景轨 `foreground=false` 先于前台应用，说明
  不能只靠原生 selection 触发。
- 修复：
  1. `RememberedCaptionSelection` 用 `caption_selection_memory` SharedPreferences 持久化
     language/translated/asr，`NativeCaptionBridge.initialize()` 在默认轨之前加载；Off 只作会话态、
     不落盘，`resume()` 在新视频恢复；语言码统一归一化比较。
  2. `CaptionTargetPolicy`：无记忆/本次 Off 原样通过；翻译记忆同时改写源请求与译请求；仅源字幕
     去 `tlang`；菜单窗口原样。**无记忆不再把 YouTube 译轨改成源字幕。** 新增 `inferTarget()`：
     AI 开且无记忆时优先用原请求的 `tlang`/可见原生译轨，其次 App 语言、再次已配置菜单语言，
     作为**会话目标**（不持久化）；目标等于源语言时不启动翻译。
  3. `DeepSeekCaptionHook.rewriteUrl` 先应用语言策略再判断 AI：AI 关也返回改写后的原生 URL；
     菜单确认在 AI 关分支之前；AI 开但无记忆时先 `TARGET_INFERRED_FOR_AI` 推断会话目标再改写，
     不再只是放行原生字幕；仅前台有目标请求进 AI。
  4. `CaptionButtonController` 在 CC 变 ON 时调用 `NativeCaptionBridge.onCaptionsShown()`：有原生
     selection 走 `refreshNativeTrack()`；无记忆时先推断目标；“从不显示”没有提交轨道时用当前视频
     签名源轨启动 AI；`onOriginalTrackList` 保存前台源轨并在合适时补触发。
  5. `refreshNativeTrack` 在 AI 关闭时把原生源轨重选为记忆目标；AI 开但无记忆且 CC 已显示时用
     `ENGINE_DEFAULT_TARGET_ACTIVATED` 推断目标并启动；自动事件命中记忆语言/模式时
     `NATIVE_MEMORY_REAPPLIED` 重新武装 `CaptionChoice`。
  6. `hookRememberedDefault` 无记忆回退改为 YouTube 原始默认轨（不再回源）；AI 开且无记忆时
     `DeepSeekCaptionHook` 也不再剥译轨。
  7. `DeepSeekConfig.defaultTargetLanguage` 增加持久记忆回退；`CaptionQuickToggle` 无记忆时
     不再误报“选择翻译语言”，AI 开启且 CC 已显示时用推断目标；`Remember caption selection`
     描述改为跨 App 启动，`patches-list.json` 已重生成。
- 验证：`:translation-core:testDebugUnitTest` **247 tests**、`:extensions:extension:testDebugUnitTest`
  **309 tests**，0 failures / 0 errors / 0 skipped；本地化 243×14 通过；`tools/verify_integration.py`
  `errors=[]`、`prompt_and_protocol_literals_unchanged=true`、core class 77、14 locale、内嵌 MPE 与
  独立 MPE 相同；MPP `build/n39/gradle/patches/libs/patches-1.5.4.mpp` **607,383 B**，SHA-256
  `AF612DB48E8A7A9A1AECA4D2C5959EA4347FBB997A10583C9CDA44782824F981`。新增回归：
  `CaptionTargetPolicyTest`（含推断）、`CaptionMemoryPersistenceTest`、`CaptionHookMemoryTest`、
  `CaptionShownMemoryTest`。
- 未完成/边界：未连接真机、未安装/写入手机；官方四种 Auto captions 模式未逐一真机录像；
  目标语言不在视频原生列表时依赖克隆轨/请求层 `tlang`；“从不显示”且该版本尚未暴露源轨时，
  请求路径仍会推断目标，但首个请求到来前可能短暂没有 AI 字幕；推断目标只属本次会话，不持久化；
  记忆不含视频/API/自动显示策略。

## 14. 工作区规则

- 当前状态以本文件为准，镜像 `.verification/state-mirror/PROJECT-STATE.md` 必须逐字节相同。
- 构建输出在 `build/`，证据在 `validation/runs/` 或 `.verification/`，临时文件在 `.tmp/`；不要写入 C: 项目副本。
- 历史文档与交付字节只读保留；不要用旧 `E:\Projects\morphe-caption-v2` 路径施工。

## 15. 2026-10-20 N46 字幕记忆权威冲突根因调查（只读）

- 输入诊断：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.4-20261020-122129.txt`
  （1,349,694 B，SHA-256 `532F317748C3E38762AC951C4BB52CD7F01CFBEC8E9199567A50167BA93757DD`，
  7,682 行）；报告 `docs/N46-CAPTION-MEMORY-ROOT-CAUSE-20261020.md`；证据
  `validation/runs/20261020-n46-caption-memory-root-cause/`。
- 结论：目标语言存在两个独立权威：YouTube 原生 caption model / 语言菜单，与
  `RememberedCaptionSelection` + 请求层 `CaptionTargetPolicy`。显示与请求由记忆决定，菜单只由原生
  模型决定，二者没有强制同步；`CaptionTargetPolicy` 对源请求也 `TargetLanguage.withCode()` 造
  `tlang`，因此视频没有自动翻译列表时仍会启动 AI；`NATIVE_REMEMBERED_ACTIVATED` 分支直接返回、
  不 `selectNative`；`resolveRemembered` 只搜 `translatedTracks`；诊断中
  `LANGUAGE_REMEMBERED_CLONED=0`。菜单内容是 `CaptionLanguageSelection.menuCodes()` 的配置语言，
  不包含记忆语言。N45 文档 §0 的契约本身把“出现时用哪种语言”交给补丁记忆
  （`docs/N45-CAPTION-MEMORY-20261020.md:5`），用户要求“菜单是语言权威”；这是契约冲突，
  不是实现细节错误。
- 证据：诊断 7 次换视频、29 次 `ENGINE_REMEMBERED_ACTIVATED`、17 次 `NATIVE_TRACK_APPLIED`
  （11 次 `zh-Hans/manual`、2 次 `zh/manual`、1 次 `ru/manual`）；用户选 ru 后原生 applied 再没有
  出现 ru。离线探针 A/B 复现“记忆 ru + 原生默认 zh-Hans”与“无自动翻译列表仍造 ru”，两者均
  `nativeSelects=0`。
- 状态：只读调查；未改产品代码、未重建 MPP、未连接手机。修复方向是建立单一权威（原生菜单/selection
  决定显示与请求），不再在记忆侧增加钩子或克隆；YouTube 自身是否替换人工轨在当前请求改写 + 原生
  渲染遮罩下不可观测。

## 16. 2026-10-20 N47 Morphe 实际字幕轨道决定链调查（只读）

- 报告：`docs/N47-CAPTION-TRACK-DETERMINATION-20261020.md`；只读调查，未改产品代码。
- 结论：`Auto captions` 只决定字幕是否自动显示，不决定语言。实际轨道由
  `SubtitleManager.setSubtitleTrack()` 的最后一个写入者决定；新视频初始轨道在
  `VIDEO_SWITCHED` 之前就由后台 caption model/`getDefaultCaptionTrack()` 选好。
- Morphe 1.47.0 的 `Captions` 含 `Preferred caption language`（`Settings.java:353` 默认 `off`）：
  非 `off` 时它在 `getDefaultCaptionTrack()` 调用点和 `setSubtitleTrack()` 入口覆盖本补丁的
  `hookRememberedDefault`/`selectNative`，且每个新视频重置 `userSelectedTrack`。1.45.0 无此补丁。
- 诊断里的 `official=1.45.0` 是硬编码，不是实际官方版本；项目基线为 1.47.0。当前诊断无法区分
  “Morphe Preferred 覆盖”与“YouTube 默认/本补丁 hook 失败”，必须先确认
  `Morphe → Captions → Preferred caption language` 的值与实际官方补丁版本。
- 设计含义：语言设置只能保留一个入口；若 Morphe Preferred 非 `off`，不能同时让本补丁记忆成为
  菜单权威；若为 `off`，则继续查本补丁默认轨 hook 的路径/时机/`resolveRemembered`。
- 证据：`NATIVE_TRACK_APPLIED` 在 `VIDEO_SWITCHED` 前（QH `1792470011214`/`11266`、
  Dq `1792470022924`/`22976`、Aax `1792470042936`/`42994`、mha `1792470058599`/`58633`）；
  Morphe `PreferredCaptionLanguagePatch.java:82-169`/`:171-219`/`:224-241`；
  `NativeCaptionBridgePatch.kt:553-581`；`NativeCaptionBridge.java:1043-1059`。

## 17. 2026-10-20 N48 删除语言记忆补丁（执行）

- 用户决定：不与官方 `Captions` / `Preferred caption language` 冲突，**完全删除本项目的语言记忆
  补丁及相关覆盖逻辑**，完全尊重官方设计；不新增任何提示。
- 删除：`Remember caption selection` 补丁、`RememberedCaptionSelection`、`CaptionTargetPolicy`、
  `CaptionVideoHandoffV2`、`NativeCaptionBridgePatch.hookRememberedDefault`/`memoryInstalled`、
  `DeepSeekCaptionHook` 的目标推断/请求改写、`NativeCaptionBridge` 的默认轨恢复/`resolveRemembered`/
  `restoreDecision`/`sourceDefault`/`selectNative`、UI/设置中的记忆回退、记忆专项测试；MPP 只保留
  `AI caption translator`。
- 新契约：语言只由 YouTube 原生 caption model / 官方 Captions 选择；源请求永不添加 `tlang`；
  YouTube 已选 Auto-translate 译轨时 AI 才翻译；无跨视频/跨启动语言记忆；无目标时静默显示原生源字幕。
- 验证：`translation-core` **238 tests**、`extensions` **264 tests**，0 failures/errors/skipped；
  新增 `NativeOnlyCaptionTest`（3 tests）；本地化 243×14；`tools/verify_integration.py` `errors=[]`；
  MPP `build/n39/gradle/patches/libs/patches-1.5.4.mpp` **592,741 B**，SHA-256
  `BB906F3EA60EABED517EB7FC7C8F2422547BD6838C2F015A22D96F31522A558D`；MPP/extension 字节中不再
  包含 `RememberedCaptionSelection` / `CaptionTargetPolicy` / `Remember caption selection`。
- 状态：未连接真机，未安装/写入手机；官方 Preferred 仍是独立设置，本补丁只跟随它。

## 18. 2026-10-20 N49 官方 upstream 可行性评估（只读）

- 报告：`docs/N49-MORPHE-UPSTREAM-READINESS-20261020.md`；未改产品代码、未重建 MPP、未连接手机。
- 结论：以当前 31,086 行生产代码（4 个自建 Gradle 模块 + 4 个源码目录）的形态提交 Morphe 官方，
  不会合并；阻断项是规模（官方 VOT 扩展 4,515 行）、127.0.0.1 本地 HTTP 服务 +
  manifest `networkSecurityConfig`、手工设置 XML / 14 语种 TSV、默认诊断档案与抓 Cookie、
  仓库结构/发布链、缺少真机 min/max 验证。
- 精简方向：31k → 12–16k 生产代码（并入官方 Captions/VOT 可到 8–12k），保留核心翻译、分页与
  Overlay；删除重复的设置、诊断、Token 记账、loopback 与 Cookie 抓取。
- 建议：先 RFC，再按 Captions/VOT 子功能拆 3–4 个 PR；或保留第三方源，只上游通用字幕能力。
- 未完成：真机验证、上游维护者预沟通；本评估不构成发布或产品变更。

## 19. 2026-10-20 N50 上游实现路径（计划，未执行）

- 报告：`docs/N50-UPSTREAM-IMPLEMENTATION-PATH-20261020.md`；只读计划，未改产品代码。
- 推荐形态：作为官方 `Captions` 子补丁，补丁放 `youtube/layout/captions/aicaption`，扩展放
  `extensions/youtube/.../patches/aicaption`；不再保留独立 Gradle 模块/MPE。
- 四个 PR：PR1 设置 + 原生字幕接管（无网络）；PR2 Requester/翻译/缓存；PR3 分页/引文/
  人工 cue/全语种；PR4 可选 profile/模型目录/Flyout。
- 关键顺序：先删 loopback（复用现有 `suppressNativeDraw`），再换官方设置/本地化，再换
  `Requester`，最后移植分页算法；目标生产代码 13–16k，并入 VOT 可到 8–11k。
- Gate：先 RFC 取得维护者对 A/B/C 产品位置和范围的确认；未确认前不开始 31k 行搬迁。

## 20. 2026-10-20 1.5.5-local 基线（执行）

- 当前工作树提交为 `1.5.5-local`；`gradle.properties`：`version=1.5.5`、`captionBuildId=local-1.5.5`。
- 不发布：`patches-list.json`、`patches-bundle.json` 和 README 发布表仍指向最后发布的 1.5.4；
  1.5.5 没有 MPP 资产，也没有远程 release。
- 内容：N40–N48 的代码/测试/文档 + N49/N50 评估与路径；语言记忆补丁已删除；公开补丁只剩
  `AI caption translator`；N48 验证结果（238 + 264 tests、MPP 592,741 B）仍是本基线的最后完整验证。
- 后续 upstream 工作区在 `E:\Projects` 独立复制本基线，不共享本仓库 `.git`；具体入口见该工作区的
  `START-HERE.md` / `UPSTREAM-STATUS.md`。

## 21. 2026-10-20 N51 “译文字幕不显示”根因调查（只读 + 探针）

- 输入：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.4-20261020-173353.txt`（531,749 B，
  SHA-256 `D424CC470CA74D1DF10824AE1DB22627569A7653C3FA9D1C4B550A0DF5A561EF`，导出 17:33:53）；
  报告 `docs/N51-NO-TRANSLATION-ROOT-CAUSE-20261020.md`；探针
  `validation/runs/20261020-n51-no-translation-root-cause/`（probe、`probe-output.txt`、
  `time-budget.txt`）。
- 现场构建：`build/n39/gradle/patches/libs/patches-1.5.4.mpp` 592,741 B / SHA-256
  `BB906F3EA60EABED517EB7FC7C8F2422547BD6838C2F015A22D96F31522A558D`（与 N48 记录一致），构建于
  13:31，早于 14:07 的版本提升，因此诊断仍报 1.5.4；代码内容 = HEAD `8ed5866`。
- 现象：块 4（`b4_268_374`，视频 44.250–58.750 s，4 条人工 cue）在 66 s 会话里占 **14.40 s**
  “翻译中…”；全场约 22.9 s（34.7%）没有译文字幕（14.40 占位 + 3.28 `…` + 2.84 播放器/所有权抑制 +
  1.63 `source_gap` + 0.59 首帧布局 + 0.15 页窗缝隙）。
- 根因：模型把块内 107 个 token **全部连续译出**（3 事件，107/107 覆盖），但事件边界（token 24/48）
  与作者 cue 边界不一致；`RebuildCueContract.validate` 以 `authored_cue_boundary` 拒绝整块
  （请求 75/76/84/89，4/4 同错，后两次已把具体范围写进 `repair`）；`RebuildSalvage` 只接受“事件精确
  铺满 cue”，**包含**（cue 16 在事件 0–23 内）与**部分覆盖**（cue 17 前缀 18–23 被事件 1 吞掉）都被
  丢弃 → `unitsPartial` 空 → 块停在 `WAITING` → 按 cue 窗显示占位。第 4 次拒绝后 15 s 退避
  （69.1 s）晚于块结束（58.75 s），重试在原理上不可能成功。
- 结构性问题：显示是 plan-driven，页被绑定为作者 cue；“模型事件边界”被当作页的**身份/有效性**而非
  文本投递格式，缺少“可用译文 → 当前页”的投影层。提示词同时要求“每条事件成句”和“不跨 cue”，当
  cue 边界切在句子中间时两条互斥；HTTP 往返 2.1–3.6 s 与 cue 2.7–4.9 s 同量级，重试不能作为可用性
  兜底。N41/N42 把页从事件改成 cue（修好半句翻页），但把“模型必须与作者切分一致”变成了显示前提；
  N44 的 salvage 只覆盖“精确铺满”，本诊断的“包含/部分覆盖”不在内。
- 探针（3 tests，0 failures）：同回复 107/107 覆盖；严格拒绝 `authored_cue_boundary`；salvage `null`；
  1,894 种与已知 cue 16 边界一致的四 cue 切法中仅 28 种可发布，且全部要求事件边界恰好等于 cue 边界
  （`accepted_elsewhere=0`）；同一回复按事件页投影为 3 页、覆盖 14,500/14,500 ms。
- 附带：3.28 s `…`（块 1 整 cue 空洞，补洞未在 cue 结束前完成）、1.63 s `source_gap`（跨块静默缝）、
  0.59 s 首帧 `preparing_layout` 空白；另有本轮未触发但同属“无译文”的 overlay 粘性空白
  （排版失败后 `lastBlankIdentity` 去重使 watchdog 不再重试，`CaptionOverlayV2.java:936-943`）。
- 修复方向（**已由 §22 实施**）：新增投影层（第一层 cue 页、第二层事件页），发布单位下沉到页，边界类
  错误降为对齐评分，`WAITING` 占位只覆盖无页的 cue，洞级补请求按 cue 截止；验收为本诊断全块有页、
  性质测试“覆盖 t ⇒ t 有页”、真机同段连续显示。明确不采用“只放宽检查 / 只加重试 / 只缩小块”。
- 状态：调查阶段只读 + 离线探针，未改产品代码、未重建 MPP、未连接或写入手机。块内 cue 的 token 切分
  除 cue 16 外为推断，探针遍历所有与已知边界一致的切法，结论不依赖具体推断。

## 22. 2026-10-20 N51 实施：cue 边界不再阻止译文显示（1.5.5 本地构建）

- 记录：`docs/N51-REPAIR-20261020.md`；新增
  `translation-core/.../RebuildCueProjection.java`；真实 N51 回复现在发布为 3 个事件页覆盖 14.5 s。
- 修复：
  1. **两层投影**：第一层对“被事件精确铺满”的 cue 生成 cue 页（窗口 = cue 窗）；第二层把其余事件
     各自成页（窗口 = 事件源时间）。页按源时间有序、不重叠；相邻空隙 < `RebuildDisplayGroups.HOLD_MS`
     时延伸到下一页起点。不切分、不复制、不丢文本；两层由“事件不重叠”保证不重复。
  2. **边界降为呈现**：`RebuildProtocol.parseInternal` 不再调用 `RebuildCueContract.validate`；
     `RebuildSalvage` 不再丢弃跨 cue 事件、不再要求 authored `unitsPartial` 非空；
     `RebuildReview.structuralRetry` 移除三类边界错误；`RebuildCueContract.VERSION` →
     `authored-cue-v3`（参与缓存身份）。
  3. **控制器**：authored 分支改用投影（流式前缀同）；新增 `REBUILD_CUE_PROJECTION`
     （`groups/cue_pages/event_pages/events/partial`），`REBUILD_UNIT_MODE` 增加 `cue_pages/event_pages`；
     删除 `authoredUnits`/`authoredPartialUnits`。
  4. **提示词**：`displayCueRule` 改为 “preferred page boundaries / a complete sentence wins; an event may
     span the boundary”；`display_cues` 与 `SENTENCE` 不变，pinned 字面量不动。
- 测试：新增 `N51AuthoredProjectionTest`（5，含 300 轮随机切分性质测试）与
  `N51AuthoredDisplayTest`（真实引擎端到端：跨 cue 回复在 0.5–6.5 s 各位置都有译文、无空白、无占位）；
  更新 `AuthoredCueContractTest`、`N42RegressionTest`。`:translation-core:testDebugUnitTest` **244
  tests**、`:extensions:extension:testDebugUnitTest` **264 tests**，0 failures/errors；本地化 243×14；
  `tools/verify_integration.py` `errors=[]`、`prompt_and_protocol_literals_unchanged=true`、
  `compiled_core_class_count=79`、内嵌 MPE 与独立 MPE 相同。
- 产物：MPP `build/n39/gradle/patches/libs/patches-1.5.5.mpp` **593,498 B**，SHA-256
  `5F14BBFAB678DD30ABCC70203F30A22372FBDA8CDFFBC083F60534253F96A954`；MPP 内已无 1.5.4 字符串，
  诊断将报 `ui=1.5.5; engine=1.5.5; build=local-1.5.5`；`docs/core-provenance.json` /
  `docs/core-upstream.patch` 已重录。**未发布**：patches-list/bundle 与 README 仍指 1.5.4，
  未签名、未安装、未推送。
- 未完成/边界：真机安装与 after 诊断待复验；`fillHoles` 仍按“最大洞、一次”处理，未按 cue 截止；
  overlay 粘性空白（N51 报告 §6.8）未改；事件页窗口可能比作者 cue 略长/略短（完整句子优先的代价）。

## 23. 2026-10-21 1.5.5 正式版发布准备（执行）

- 目标：把 1.5.5 作为正式版发布，不再使用 `1.5.5-local` 作为 Release 版本或 tag。
- 版本/构建：`gradle.properties` `version=1.5.5`、`captionBuildId=release-1.5.5`。
- 文档/元数据：`CHANGELOG.md` 改为 `## [1.5.5]` 六条用户可见变更；`patches-list.json`
  由 `:patches:generatePatchesList` 生成为 1.5.5 / 1 个公开补丁；`patches-bundle.json`
  为 1.5.5、description 与 CHANGELOG 一致、下载 URL 指 `v1.5.5/patches-1.5.5.mpp`；
  README 发布表由脚本重建为 1.5.5；中文 README 增加当前版本入口。
- 发布合同：`validate_morphe_metadata.py` 对 1.5.5 及以后只接受 `AI caption translator`；
  `verify_bundle.py` 检查 `RebuildCueProjection`、`REBUILD_CUE_PROJECTION`、`release-1.5.5`，
  并拒绝 `RememberedCaptionSelection` / `CaptionTargetPolicy` / `Remember caption selection`；
  `test_release_contract.py` 新增“第二公开补丁必须拒绝”的回归。
- 文档一致性：README 删除“进程内记忆”旧条目；ARCHITECTURE 改为失败显示中性 `…`、不显示源文，
  并记录 cue/event 两层投影；COMPATIBILITY 记录 1.5.5 沿用 1.5.4 目标声明且不新增真机/组合声明；
  COMMUNITY 统一为 1.5.5、1.47.0、21.20.405、单补丁。
- 验证：`:translation-core:testDebugUnitTest` **244 tests**、`:extensions:extension:testDebugUnitTest`
  **264 tests**，0 failures/errors/skipped；本地化 243×14；`test_release_contract.py` 12 tests OK；
  `validate_morphe_metadata.py 1.5.5` OK；`verify_bundle.py 1.5.5` OK；
  `verifyIntegrationSources` `errors=[]`；MPP `build/n39/gradle/patches/libs/patches-1.5.5.mpp`
  **593,495 B**，SHA-256 `CB4D3135B9B483DAB1B098ACDEF720F612FD788BEA44B8E4C9229C14A35ACCFB`。
- 发布计划：正式 tag `v1.5.5` 指向最终 release commit；上传 `patches-1.5.5.mpp`；
  Release 正文使用 CHANGELOG 的六条；不推 `v1.5.5-local`。
- 本地提交：`40d5d58`（29 files，N51 + 1.5.5 元数据/文档）；随后合并 `origin/main`
  为 `a42c593`（仅 README/中文 README 的 Qwen 推荐段），状态提交后创建 annotated tag `v1.5.5`。
  尚未 push。
- 边界：真机安装与 after 诊断未执行；`fillHoles` 仍未按 cue 截止；overlay 粘性空白未改；
  事件页窗口可能略长/略短。

## 24. 2026-10-21 N52 显示保证（1.5.5 重建）

- 输入：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.5-20261021-201213.txt`（7,806,332 B，
  SHA-256 `FE33D6645265F409FE0B4FC9BF23B81DF664368D8EBE0315E7770B5D2B50C7FA`，导出 20:12:13）；
  报告 `docs/N52-DISPLAY-GUARANTEE-20261021.md`；证据
  `validation/runs/20261021-n52-display-guarantee/`（审计脚本、playback-aware 预算、时间线、
  已发布 1.5.5 资产副本）。
- 结论：N51 投影已生效（189 次 `REBUILD_CUE_PROJECTION`，cue/event 混合页），但“不显示”仍是
  **闸门架构**问题：块请求、解析、发布、unit、排版、页窗各自可以独立 hide；请求/重试单位是
  15–30 s 的块，显示单位是 2–5 s 的页，块级失败会吞掉多页。本诊断剩下的闸门：
  `empty_translation` 整块失败（10 次，session 106 两个 3-token 块，5 次/块，1 次
  `REBUILD_BLOCK_ABANDONED`）、salvage 空洞 `…`（1.92 s）、快速拖动占位（session 19 8.4 s，
  focus 往返 2–3 s）、无 unit 空白（其中多数是源轨道无 cue 的**合法静默**：session 106
  14.45/5.16/3.96/3.65 s，session 200 开头 9 s）、overlay 缝隙（0.2/0.1/0.15 s）、原生遮罩
  未证实（418 次 scan miss / 10 次 mask / 13 次 fallback）。
- 通用修复（与模型、语种、句子、切分无关）：
  1. **时间线保证**：`render` 中若 `speechAt(t)` 且文本为空/`…`/块在等待，则保持上一页
     （≤ `DISPLAY_HOLD_MS`=4 s，按 500 ms 量子延伸页窗）或显示中性占位；绝不空白；
     记录 `DISPLAY_GAP`（`gate=hold|placeholder|marker|repair`，约 1 s 限流）。
  2. **页级补请求**：按当前页（人工轨 cue group / 自动轨 `windowAt`）请求一次；去重
     （generation+block+range）、每块 ≤4、块请求在途/流式前缀/terminal 时让位、无计划时
     1.2 s 宽限；返回后 `mergeInto`；块无计划时先发布 `degraded` 全空洞计划；记录
     `REBUILD_PAGE_REPAIRED` / `REBUILD_PAGE_REPAIR_FAILED` / `REBUILD_PAGE_REPAIR_EMPTY` /
     `REBUILD_BLOCK_DEGRADED`。
  3. **空/不可用回复不再整块失败**：`RebuildSalvage` 返回全空洞 partial（不再 null），删除
     自动轨“覆盖 <1/3 判失败”规则；不再 5 次整块重试 + `BLOCK_ABANDONED`。
  4. N51 投影仍是第一层；保证层只在“投影没有当前页”时介入。
- 测试：新增 `N52DisplayRepairTest`（2，真实引擎 + MockWebServer：空回复、整块 HTTP 500 都会在
  页级补请求后上屏，期间不空白）；`LanguageConformanceTest.anUntranslatedEchoIsStillDropped`
  改为“不发布回显、整块空洞”；`:translation-core:testDebugUnitTest` **246 tests** 连续两次全绿、
  `:extensions:extension:testDebugUnitTest` **264 tests**；本地化 243×14；
  `verify_integration.py` `errors=[]`、pinned 字面量不变、core class 79、内嵌 MPE == 独立 MPE。
- 产物：版本 **1.5.5**，`captionBuildId=release-1.5.5`；MPP
  `build/n39/gradle/patches/libs/patches-1.5.5.mpp` **595,638 B**，SHA-256
  `A4B04C537499F6D86DF99350297BBC2FBEB5DD99C835F140D9C2DFA314771E4E`。
  按用户要求，本轮以该 MPP 发布 1.5.5（tag + GitHub release，上传同一文件）。旧本地 1.5.5 资产
  （593,495 B / `CB4D3135…`）保留在 `validation/runs/20261021-n52-display-guarantee/`。
  未签名、未安装、未连接手机。
- 边界：provider 完全不可用或模型对同一页持续返回空/错误 → 4 次页补后保持上一页/占位，
  不空白但无法凭空生成译文；源轨道没有 cue 的静默段不显示字幕（正确语义）；原生字幕遮罩
  仍需真机录屏确认；未连接或写入手机。

## 25. 2026-10-21 N52 发布（执行）

- 用户要求：忽略其他会话在工作区的类似工作，独立按仓库现有做法把该版本推到 GitHub；版本仍为
  **1.5.5**，说明保持简洁、体验向。
- 提交：`ae355be` `fix: keep translated captions on screen while a page is on its way`
  （N52 代码/测试/报告/`core-provenance`）；`49f588f` `chore: Release v1.5.5 [skip ci]`
  （CHANGELOG、`patches-bundle.json`、本状态）；annotated tag `v1.5.5`（tag 对象 `c3d5f70`）→
  `49f588f`。
- 分支：`main` 从 `67dc37b` 快进到 `49f588f`。`dev/1.5.5-deepseek` 无法推送到远端同名分支：
  远端已有 `refs/heads/dev`，Git 不允许 `dev` 与 `dev/1.5.5-deepseek` 同时存在（文件/目录冲突）；
  工作已由 `main` 承载。
- Release：`gh release create v1.5.5`，title `v1.5.5`，非 draft、非 prerelease；资产
  `patches-1.5.5.mpp` **595,638 B**，SHA-256
  `A4B04C537499F6D86DF99350297BBC2FBEB5DD99C835F140D9C2DFA314771E4E`；正文为 CHANGELOG 1.5.5
  的 7 条（含“Captions no longer go blank…”）。
- 验证：`gh release download` 的资产哈希与本地一致；匿名 HEAD 资产 200 / 595,638 B；匿名
  `main/patches-bundle.json` version=1.5.5、download_url 指向 v1.5.5 资产、含新条目；匿名
  `main/patches-list.json` version=1.5.5、唯一补丁 `AI caption translator`；README 表 v1.5.5；
  `validate_morphe_metadata.py 1.5.5`、`verify_bundle.py 1.5.5`、`test_release_contract.py`
  （12 tests）通过。
- 边界：发布提交带 `[skip ci]`，`release.yml` 未触发，因此本次资产没有 CI 构建证明/attestation；
  资产由本地构建并做了字节校验。已上传的 `patches-1.5.5.mpp` 不再替换；后续修正必须新版本。
  发布前的旧本地 1.5.5 资产（`CB4D3135…`，593,495 B）作为历史字节保存在证据目录，未上传。

## 26. 2026-10-22 N53 字幕图层与字号契约（执行）

- 输入：`caption-diagnostics-1.5.5-20261022-140858.txt`；截图 127/128；报告
  `docs/N53-CAPTION-LAYER-AND-SIZE-20261022.md`。
- 根因：块 `b105_1637_1677` 被供应商 `content_filter` 整块拒绝（页补请求 175/178 同样被拒）；
  字幕 anchor 挂在 `android.R.id.content` 最后，压在评论面板之上；字号在 `videoWidth < 0.8×normal`
  时随视频宽度缩小（1478/2247 → 36.5 px）。
- 修复：`CaptionSurface` 新增 `renderedSurface`/`captionHost`/`relative`，字幕挂到视频 Surface 向上
  第一个 FrameLayout；删除 `renderedGlyphHeightPx` 与 `normalVideoWidth`，字号只按模式/显示宽度；
  `CaptionFontSize.modeRatio` 成为唯一模式比例。
- 产物：MPP 596,221 B，SHA-256 `DD51262F3AD6A05D23EC202F4F7D95070B61D588B7DFE88C59BB76F925689AFF`；
  `local-1.5.5-n53`；未发布。
- 边界：未连接真机；该图层后来被 N58 替换为稳定 overlay 层；供应商拒绝的文本仍无译文。

## 27. 2026-10-22 N54 原生字幕样式与分页借用评估（只读）

- 报告：`docs/N54-NATIVE-CAPTION-STYLE-AND-PAGING-EVALUATION-20261022.md`。
- 结论：原生 `SubtitleWindowView`/`Laohf` 渲染可借，分页不可借（`Lapco` 只按时间重叠合并 cue）；
  推荐 A1 原生渲染器是可选后续，不在 1.5.5 实施。B 站可参考轨道/位置/字号元数据，不可参考分句。
- 状态：只读，无产品代码/MPP 变更。

## 28. 2026-10-22 N55 动画双时钟 + 原生安全线（历史）

- 报告：`docs/N55-CAPTION-MOTION-ROOT-CAUSE-20261022.md`。
- 结论：抽搐不是动画曲线，而是几何采样 10 Hz + 每次采样全量排版 + 位置是排版副作用；提出几何/内容
  双时钟、停稳分页、原生安全线。S1/S2 最小实现（`local-1.5.5-n55`）后来被 N56 取代：
  margin/translation 混用导致闪跳，安全线 clamp 让向下拖动无效。
- 产物（历史）：MPP 599,398 B，`E2F020989C02DF907A26CA7D4F2716E04D711DC1FA1CAA3ABE6C798763D6A129`。

## 29. 2026-10-22 N56 回归修复：绝对 translation、删除 UI 避让、拖动不重排（历史）

- 报告：`docs/N56-CAPTION-MOTION-FOLLOWUP-20261022.md`。
- 根因：`placeAt()` 同时改 margin 并清零 translation，下一帧布局前仍画旧位置；安全线 clamp
  把默认底部字幕卡住；拖动走完整 `render()`。
- 修复：`CaptionHorizontalPlacement.position()` 只用绝对 `translationX/Y`，margin 恒 0；删除原生
  字幕几何/安全线；`drag()` 直接 `placeVisibleText()`，不重排；`relative()` 复用矩阵/矩形。
- 产物（历史）：MPP 598,347 B，`C374D49ED6F5A90FCD3AA1553B038CF7608123F04157EE40655FC2538D065FCB`；
  `local-1.5.5-n56`。

## 30. 2026-10-22 N57 横屏拖动与抖动根因：内容/几何分离（历史）

- 报告：`docs/N57-CAPTION-MOTION-AND-DRAG-20261022.md`。
- 根因：拖动用旧内容矩形/方向键；分页 key 含精确几何；`currentVideoBounds` 回退播放器容器；
  `isCompactType` 用子串把 `WATCH_WHILE_SLIDING_MINIMIZED_MAXIMIZED` 判成 compact。
- 修复：拖动 DOWN 捕获实时矩形/方向并抢占父手势；`canReuseCommittedPage()` 放得下不重排；
  `moving()` 120 ms 静默窗；`currentVideoBounds` 只读缓存 Surface；`isCompactType` 精确枚举。
- 验证：core 246 / extension 281 tests；MPP 599,357 B，
  `D6414AC051F1376589BB927F7FF463E7C716EABC7696171C589438C3453EE1B7`；`local-1.5.5-n57`。
- 边界：停稳后仍会重排一次；触摸仍可能到不了 TextView（N58 处理）。

## 31. 2026-10-22 N58 稳定图层、触摸代理、视口档位（1.5.5 本地构建）

- 输入：用户复测（N57 仍抽搐、仍不能拖动、横屏评论动画卡顿、评论打开字号不变）；
  `caption-diagnostics-1.5.5-20261022-201150.txt`（3,289,373 B，408 条 `REBUILD_DISPLAY_RESULT`）；
  录屏 `SVID_20261022_201253_1.mp4`（15.29 s / 60.03 fps / 2736×1264）；
  根因/设计 `docs/N58-CAPTION-OVERLAY-ARCHITECTURE-20261022.md`；实施
  `docs/N58-REPAIR-20261022.md`；证据 `validation/runs/20261022-n58-overlay-evidence/`。
- 现场结论：174/408 条 display 结果的 `laid_out_box_width_px` 落后 `desired` 一帧；
  `caption_host_px` 出现 17 种尺寸，转场中 35–294 ms 连续换宿主（`2599x1201 → 1264x711`、
  `1264x711 → 1579x888 → 2736x1264`）；字号/档位在宿主仍为 2599x1201 时已从 55.5 翻到 44.5。
  录屏 6.2–6.8 s 打开评论、7.3 s 翻页、7.6–8.0 s 关闭评论、11.8–12.2 s 全屏→详情均可见
  2–4 次离散提交。结论：抽搐 = 宿主重挂载 + 停稳后重排 + 一帧旧框 + 档位提前翻转，不是动画曲线。
- 修复：
  1. **稳定视觉层**：`CaptionSurface.stableCaptionHost()` 优先活动 player 内的
     `inset_overlay_view_layout`（Shorts 用 `reel_player_overlay_root`），弱引用缓存；caption
     anchor 插入 index 0（视频之上、控件之下、评论之下）。删除从 Surface 向上找 FrameLayout
     的默认路径（保留 fallback）。
  2. **独立触摸层**：`player_overlays_custom_views_container` 内全屏透明代理；DOWN 命中字幕
     `getGlobalVisibleRect()` 才消费，否则透传；MOVE 只 translation，不 `render()`。TextView 的
     旧监听保留为 fallback。
  3. **视口档位**：新增 `CaptionPresentationClass`（FULL/REDUCED/DETAIL/SHORTS_FULL/
     SHORTS_REDUCED，0.80/0.88 迟滞，短边 1264 绝对参考高度）。横屏评论打开 = REDUCED = 详情
     字号 44.5 px；Shorts 评论打开 = SHORTS_REDUCED = 详情字号；全屏 = 55.5 px。档位只在跨阈值时
     提交一次新 plan，停稳后 `canReuseCommittedPage()` 不再检查“当前页是否放得下”。
  4. **稳定框**：每个 plan 取所有页最大行宽/最大行数，一次设定 TextView 宽与 `minHeight`；
     anchor 宽 = 档位 frame 宽度，动画/翻页不再重设。
  5. **性能清理**：删除 `CaptionText.onDraw()` 的每帧 `postInvalidateOnAnimation`、`beforeDraw`
     双调用、WATCH 每 100 ms 全量 `render`、`bringToFront`、elevation、每次新建
     `GradientDrawable`；页边界用 `nextPageAt` 调度；`render()` 只在 `b == null` 或
     `surfaceDirty` 时 `CaptionSurface.refresh()`。新增 `CAPTION_PRESENTATION_CLASS`、
     `CAPTION_TOUCH`、`CAPTION_TOUCH_PROXY` 诊断。
- 验证：`:translation-core:testDebugUnitTest` **246 tests**、`:extensions:extension:testDebugUnitTest`
  **292 tests**（55 个结果文件），0 failures / 0 errors / 0 skipped；本地化 243×14；
  `tools/verify_integration.py` `errors=[]`、pinned 字面量不变、内嵌 MPE 与独立 MPE 相同。
  新增 `CaptionPresentationClassTest` 7、`CaptionStableHostTest` 2、`CaptionTouchProxyTest` 2
  （真实 `dispatchTouchEvent`）；更新 `CaptionLayerOverlayTest`（评论区打开 = 详情字号 + 一次重排）、
  `CaptionMotionContractTest`（同档停稳不重排）。
- 产物：MPP `build/n39/gradle/patches/libs/patches-1.5.5.mpp` **603,341 B**，SHA-256
  `F0C632BC182B2CB7C561688D88D651C4396BE89559407FDF1FDD6400091386A3`；同一字节副本
  `validation/runs/20261022-n58-overlay-evidence/patches-1.5.5-n58.mpp`；
  `captionBuildId=local-1.5.5-n58`；内嵌 MPE 含 `local-1.5.5-n58`、`CaptionPresentationClass`、
  `CAPTION_TOUCH_PROXY`、`stableCaptionHost`。未签名、未安装、未发布。
- 边界：未连接真机；`inset_overlay_view_layout` 的实际可见性/alpha、Shorts 评论面板层级、
  `player_overlays_custom_views_container` 的 z 序需真机 `CAPTION_LAYER`/`CAPTION_TOUCH_PROXY`
  复核；若 `inset` 在该版本不可见会回退旧 Surface 宿主；稳定框会在短页留额外背景；
  向下拖动仍受视频底边限制；`SHORTS_FULL` 用全屏字号，若偏大可将该档改为详情字号。

## 32. 2026-10-22 N59 Patcher 2.0.0 / Morphe 1.48.0 适配与语言菜单功能删除（执行）

- 输入：Morphe Patcher 2.0.0 对 1.12.0 构建补丁的兼容警告截图；`D:\HONOR Share\Honor Share\
  patches-1.48.0.mpp`；`YouTube/` 下 21.41.525（SECONDARY）、21.28.208、21.23.492、21.40.161、
  20.51.39、20.21.37 APK。用户要求按官方 patch 支持版本适配，且不再适配 20.x。
- 构建链：`app.morphe.patches` 1.3.4 → 2.0.0；`morphe-patcher` 1.12.0（composition 1.14.1）→ 2.0.0；
  smali `d92701d947` → `4220ae75f7`。Patcher 2.0.0 从 tag 源码发布到 Maven Local（本地构建关闭签名）；
  `settings.gradle.kts` 增加 `mavenLocal()`。MPP manifest 现为 `Patcher-Version: 2.0.0`。
- Patcher 2.0.0 语义适配：
  1. `Fingerprint.strings` 由无序包含改为按声明顺序精确匹配；`PlayerTypeEnumFingerprint` 改用
     `filters = [string(...)]` 的官方 1.48.0 顺序并以 `APUT_OBJECT` 结尾。
  2. `BytecodePatchContext.getAllClassesWithString` 已隐藏，改用 `classDefByStrings`。
  3. 资源按需解码：settings 页面探测改用会解码的 `get(path)`；loopback 配置先 `get` 再判断/写，
     不再用 `copy=false` 后误判文件不存在。
- 与官方 1.48.0 Captions 共存：
  1. `findNativeList` 以 `AUTO_TRANSLATE_CAPTIONS_OPTION` 识别 direct-tracks getter，排除官方
     Auto-translate 新增的同签名 List helper。
  2. `findDefaultTrack` 先从 model-ready initializer 的 `IPUT_OBJECT` 推导 model field，再找被它
     调用的默认轨方法，避免官方 Preferred 语言 helper 干扰候选。
  3. 删除本项目对翻译 metadata 与 translated-track getter 的 hook；这些能力由官方
     `AutoTranslateCaptionsPatch` 独家提供，不再重叠。
- 删除“向自动翻译语言列表增加更多语言”功能（用户要求，官方已提供）：
  - 补丁：settings 的 `CaptionLanguagesPreference` 行；`augmentTranslations`、`augmentMetadata`、
    `cloneTranslation`、`relabelTranslation`、`hookTranslatedTrackList`、`hookLanguageMetadata`、
    metadata 二进制 schema 常量与相应 stub 绑定。
  - 扩展：`CaptionLanguageSelection`、`CaptionLanguageMetadata`、`CaptionLanguagesPreference`、
    `LanguageMenuOrder`；`NativeCaptionBridge` 的 language-menu 区、`translationLabel/Url/Vss`、
    `simplifiedVss` 与 `CaptionAddonSupport.simplifiedInstalled`；`CaptionApplication` 的无效
    ASR remember 调用。
  - 资源：`localization/catalog.json`、14 个 locale 的 `cap_languages_*`/`cap_language_zh_*`、
    `source-keys.tsv`；本地化由 243 keys 降为 **232 keys × 14**。
  - 测试/校验：删除 `N30LanguageMenuTest`；`N30LocalizationRuntimeTest`、`N33LocaleAndDataTest`、
    `SecondaryMenusLocalizationTest`、`NativeOnlyCaptionTest` 去掉语言选择器/旧 ABI；
    `CompositionHarness` 与 `CompositionDexAudit` 去掉语言菜单断言；测试 fixture 同步。
- 目标版本：只声明官方 1.48.0 的 21.x 目标（21.42.241、21.41.525、21.28.208、21.23.492、
  21.20.405、21.16.256），不再声明 20.x。
- 验证：
  - `:patches:generatePatchesList` 成功；MPP `build/n39/gradle/patches/libs/patches-1.6.0.mpp`
    **574,617 B**，SHA-256 `9B433BA2DE2B5F5E7D3CB2EF31861C6FFCF03512F13900E2C9F0B5FB8C8591C6`；
    同字节副本 `validation/runs/20261022-adaptation/patches-1.6.0-n59.mpp`；manifest
    `Version: 1.6.0`、`Patcher-Version: 2.0.0`；`patches-list.json` 1.6.0，唯一补丁
    `AI caption translator`，targets 为上述 6 个 21.x 版本。
  - `verifyComposition`（官方 1.48.0 + 本项目，21.41.525）：`COMPOSITION_PASS`，产出
    `validation/runs/20261022-adaptation/21.41.525-final2/patched-unsigned.apk`。
  - `auditComposition`：`FEATURES={aiInstalled=1}`、`DEX_AUDIT_PASS classes=64553`、
    `HOST_HOOKS` 中 `onMenu/observeMenuPath/suppressNativeDraw/consumePathCopy/rewriteUrl/
    onNativeTrackApplied` 各 1，`AI_FINALIZER_COMPLETE`、`SHARED_APPLIED_DISPATCH_PASS`、
    `NATIVE_VIDEO_OWNER_PROVENANCE_PASS`。
  - 21.28.208、21.23.492：`STRUCTURE_PASS AI caption translator`。
  - `aapt2 dump xmltree`：settings 视频页含 `morphe_vot_screen__ai_captions`，不含
    `deepseek_caption_languages`；`aapt2 dump resources` 中 `cap_languages_*` 与
    `cap_language_zh_*` 均为 0。
  - `:translation-core:testDebugUnitTest` **246 tests**、`:extensions:extension:testDebugUnitTest`
    **284 tests**，0 failures / 0 errors / 0 skipped；本地化 232×14；`verify_integration.py
    --source-only` `errors=[]`；`core-provenance.json` 的 `protected_abi` 已按删除后的
    `NativeCaptionBridge` 重录。
- 产物：`build/n39/gradle/patches/libs/patches-1.6.0.mpp`；`captionBuildId=local-1.6.0-n59`；
- 未完成/边界：未签名、未安装真机、未发布；21.42.241、21.20.405、21.16.256 本机没有 APK，
  未逐一 composition；21.40.161 不在官方 1.48.0 目标内，未声明；20.x 按用户要求不再适配。


## 33. 2026-10-22 N60 Flyout VerifyError 修复（1.6.1 本地构建）

- 输入：用户 21.20.405 崩溃日志 `crash_app.morphe.android.youtube_2026-10-22_14-35-34.txt`：
  `VerifyError: FlyoutUtils.addFlyoutElements(Object) [0x70] register v7 has type Boolean but
  expected Reference java.lang.Object`。
- 根因：官方 1.48.0 的 `FlyoutUtils` 在 divider 前新增 VideoDelay 行；`p0`（v7）在 0x65 被
  `VideoDelayPatch.isPatchIncluded()` 的 `move-result v7` 覆盖成 Boolean。本项目的 quick-toggle
  注入仍把 `p0` 当 panel，0x70 传给 `CaptionQuickToggle.onMenu(Object,int)`，ART 校验失败。
- 修复：panel 寄存器不再取 `p0`，改为读 `addDivider` 调用的第一个参数寄存器；index 仍取
  divider guard 的 `IF_LEZ` 寄存器。1.48.0 实测为 `{v1, v2}`（panel=v1，index=v2）。
- 回归：`CompositionDexAudit` 新增 `QUICK_TOGGLE_REGISTERS_PASS`，校验 onMenu 的 panel 寄存器
  等于 addDivider 的 panel 寄存器、index 寄存器等于 guard 寄存器；构建后字节码为
  `invoke-static {v1, v2}, ...onMenu`、`if-lez v2`、`invoke-static {v1, v2}, ...addDivider`。
- 验证：1.6.1 MPP `build/n39/gradle/patches/libs/patches-1.6.1.mpp` **574,827 B**，SHA-256
  `90EEA3605D410D1D8E74571717E1EBFE2A3E77190E383E99F017E4C44FDF262E`；
  `verifyComposition` 21.41.525 `COMPOSITION_PASS`；`auditComposition`
  `QUICK_TOGGLE_REGISTERS_PASS panel=v1 index=v2`、`DEX_AUDIT_PASS classes=64553`。
  21.28.208、21.23.492 的 1.6.1 composition 均 `STRUCTURE_PASS`；1.6.1 未改 1.6.0 的其他 hook。
- 边界：本机没有 21.20.405 APK，未在该版本重跑 composition；`FlyoutUtils` 是官方扩展代码，
  寄存器布局与 21.41.525 相同；未真机复验。

## 34. 2026-10-22 N61 详情页越界、档位抖动、Shorts 字号/行高与图层（1.5.6 本地构建）

- 输入诊断：`D:\HONOR Share\Honor Share\caption-diagnostics-1.6.1-20261022-230359.txt`
  （2,450,118 B，`ui=1.6.1`、`build=local-1.6.1-n60`）；根因/修复记录
  `docs/N61-CAPTION-OVERFLOW-STABILITY-20261022.md`。
- 现场证据：
  1. `1792680454531` 横屏转竖屏时 `CAPTION_PRESENTATION_CLASS class=DETAIL;video=231 0 2366 853;
     screen=1264x2736;class_frame_width=1964`；31 ms 后
     `caption_outer_rect=-350.0,538.0,1614.0,629.0`，而屏幕只有 1264 px。该 1964 一直保持到
     详情页结束（“字幕框可能超出屏幕边缘”）。
  2. 124 条档位记录里 121 次翻转；`1792681385–1792681403` 的 18 s 内 13 次 `FULL↔REDUCED`。
     视频宽度恒为 2135，只有可见高度在 1009↔1118 间变；旧实现用 Surface 宽高比反推
     `full_width`（2675↔2414），比例在 .798↔.884 间跨阈值。每次翻转都重新分页/布局，叠加在
     评论动画上（“打开评论区非常卡顿”）。
  3. Shorts `SHORTS_FULL` 使用 `text_size_px=60.717945 / glyph=55.5`；`stable_lines=2;lines=1`
     的单行页（`1792681202356`、`1792681206850`）继承事件最大行数双行高度。
  4. 视觉宿主仍是 `inset_overlay_view_layout`（控件之下），用户要求字幕在控件之上。
- 修复：
  1. `CaptionPresentationClass` 的全屏参考宽改为固定 16:9（`min(screenW, screenH×16/9)`），
     不再由 Surface 当前宽高比推导；同一宽度下 letterbox 高度变化不改变档位。
  2. 档位只在几何静止（120 ms）、播放器非 `SLIDING`、候选持续 220 ms 后提交；竖屏旋转帧若
     画面仍宽于屏幕则保留上一档；`DETAIL/SHORTS` 的布局宽被屏幕宽夹住。
  3. 有效框宽 = `min(classFrameWidth, video.width(), screenWidth)`；`placeVisibleText()`/
     `computeTarget()`/`canReuseCommittedPage()` 统一使用该宽度；`REDUCED` 记忆宽度夹在
     0.80×参考宽内，进入 `FULL` 时清空。
  4. Shorts 始终 `SHORTS_FULL` + 详情字号 44.5，评论打开不换字号/框宽/计划；
     `size_mode` 诊断改用 `detailSize()`。
  5. 行高由当前页 `linePlan.line2Px` 决定，`stableTextLines` 每页更新；框宽仍取事件最大行宽。
  6. 视觉层迁到 `player_overlays_custom_views_container`（Shorts 为
     `reel_player_overlay_root`）末尾，字幕自己的 TextView 接收拖动；视觉/触摸同层时删除
     全屏透明代理，保留旧宿主 fallback。
- 验证：`:extensions:extension:testDebugUnitTest` **287 tests / 54 result files**，0 failures /
  0 errors / 0 skipped；新增/更新 `CaptionPresentationClassTest`（旋转旧横向帧不判 DETAIL、letterbox
  高度不翻转、Shorts 恒为详情字号）、`CaptionLayerOverlayTest`（单行页不继承双行高）、
  `CaptionStableHostTest`（最上层宿主）等；`tools/verify_integration.py` `errors=[]`、
  pinned prompt/protocol 字面量不变。
- 产物：`build/n39/gradle/patches/libs/patches-1.5.6.mpp` **575,538 B**，SHA-256
  `B015883167D6088A7B9C45CE254CFEEAB3723EE851F6DB6ABDAC653342FB72AC`；manifest
  `Version: 1.5.6`、`Patcher-Version: 2.0.0`；内嵌 MPE 含 `local-1.5.6-n61`；
  `captionBuildId=local-1.5.6-n61`；`patches-list.json`/`patches-bundle.json` 均为 1.5.6。
  未签名、未安装、未发布。
- 边界：未连接真机；真机 after 诊断（尤其 `CAPTION_LAYER` 宿主类名、`CAPTION_PRESENTATION_CLASS`
  在详情页的 class_frame_width、Shorts 单行页高度）待用户复验。字幕在控件之上可能压住进度条/
  时间文字，这是用户选择的取舍。`inset_overlay_view_layout` 兜底路径仍可能让字幕回到控件之下。

## 35. 2026-10-23 N62 评论区快速换档、AI 开关即刻生效与短字幕框宽（1.5.6 本地构建）

- 输入诊断：`caption-diagnostics-1.5.6-20261022-234413.txt`（657,955 B，自动翻译）与
  `caption-diagnostics-1.5.6-20261022-234714.txt`（781,130 B，原文模式）；根因/修复记录
  `docs/N62-CAPTION-SWITCH-AND-AI-TOGGLE-20261022.md`。
- 现象一（评论区字号慢）根因：N61 的 `classTransitionAllowed()` 要求 `!moving(now)`，再加
  `CLASS_SETTLE_MS=220`，档位只能在评论动画完全停稳后提交。修复：参考宽已固定为 16:9，
  档位候选改为 **80 ms**、允许动画中提交；仅 `COMPACT`/`TRANSITIONING` 和官方 `SLIDING`
  （全屏↔详情拖动）仍禁止；阈值 `ENTER=.80/EXIT=.82`；`FULL` 的 class 框宽固定取参考宽，
  实际渲染仍夹到 `videoWidth × .92`。
- 现象二（AI 开关不即刻生效/显示开但没开）根因：
  1. `setEngine(true)` 未清 `CaptionChoice.userOff/explicitOff`，旧的 CC-Off 锁存让
     `refreshNativeTrack()` 返回 `CAPTIONS_OFF`/`DEFERRED`。
  2. `canActivateSnapshot()` 在原生 manager/track 重建时失败，但内存里的 signed selection
     descriptor 仍可用于启动；旧实现直接 `DEFERRED`。
  3. `onCaptionsShown()` 无 current selection 时直接返回；没有源目录 + 当前 native target
     的兜底。
  4. `DEFERRED` 没有重试。诊断证据：`ENGINE_MODE_SAVED enabled=true;native=DEFERRED`
     连续四次（`1792683774078`/`79483`/`979146`），以及
     `CAPTIONS_SHOWN ... native=DEFERRED`（`1792683809923`）。
  修复：开启时清 CC-Off 锁存；descriptor fallback
  （`NATIVE_REFRESH_DESCRIPTOR_FALLBACK`）；`refreshFromCatalog()` 用 `CaptionChoice` 当前
  native target + `SourceCatalog` 源轨启动（`ENGINE_CATALOG_ACTIVATED`）；
  `onCaptionsShown` 兜底；`CaptionQuickToggle` 120/450/1200 ms 重试
  （`ENGINE_ACTIVATION_RETRY`）。原生选择为源轨（`translated=false`）时仍按契约显示原文，
  不会凭空翻译。
- 现象三（短字幕框仍最宽）根因：`stableTextWidth` 是事件所有页的最大行宽，背景又画在整个
  TextView 上。修复：TextView 布局宽度保持稳定，背景改由 `CaptionText.onDraw()` 按当前页
  `Layout.getLineWidth()` 最大值 + padding 绘制，短页只显示文字宽度。触摸区仍是稳定布局
  宽度，本轮未改。
- 验证：全量 `:extensions:extension:testDebugUnitTest` **287 tests / 54 result files**，
  0 failures / 0 errors / 0 skipped；`verifyIntegrationSources` `errors=[]`；本地化
  232×14；`CaptionPresentationClassTest`、`CaptionLayerOverlayTest`、
  `QuickCaptionToggleTest`、`NativeOnlyCaptionTest` 通过。
- 产物：`build/n39/gradle/patches/libs/patches-1.5.6.mpp` **577,186 B**，SHA-256
  `6350FF8C78C38140C8D6F85F16317C7E4BEE696D6E9A98B296175408CBB50331`；manifest
  `Version: 1.5.6`、`Patcher-Version: 2.0.0`；内嵌 MPE 含 `local-1.5.6-n62`；
  `captionBuildId=local-1.5.6-n62`；`patches-list.json`/`patches-bundle.json` 均为 1.5.6。
  未签名、未安装、未发布。
- 边界：未连接真机；AI 目标语言仍必须由原生 Auto-translate 选择；原生源轨时显示原文是
  设计契约；字幕背景收缩后触摸/拖动命中区仍是稳定最宽宽度；评论动画中的一次分页提交
  是否在低端设备上可见掉帧，需真机复验。

## 36. 2026-10-23 N63 评论区动画同步字号、AI 首视频遮挡原生样式（1.5.6 本地构建）

- 输入诊断：`caption-diagnostics-1.5.6-20261023-001408.txt`（1,533,659 B）；根因/修复记录
  `docs/N63-CAPTION-SHEET-SYNC-AND-AI-FIRST-VIDEO-20261023.md`。
- 现象一（评论区字号仍在动画结束后才变）根因：`CaptionSurface.currentVideoBounds(host)` 返回
  宿主局部坐标；YouTube 评论区动画是播放器容器缩放，逆矩阵把缩放抵消了，局部 `video` 宽度在
  动画期间仍是 2422，只有动画结束、容器真正 layout 后才变 1510。N62 的候选/阈值再快也只能等
  终点帧。修复：
  1. `CaptionSurface.visibleVideoWidth()/visibleVideoHeight()` 用渲染 Surface 的
     `getGlobalVisibleRect` 读屏幕上的真实画面；`classify()` 新增 observed width 参与横屏比例。
  2. `CaptionOverlay.applyCommentScale()` 在横屏、非 Shorts、非 `SLIDING`、可见高度缩小或
     宽度 < 参考宽 92% 时，按可见宽度计算 `progress`，连续设置 TextView 的
     `scaleX/scaleY`（55.5↔44.5），不重排、不分页。
  3. 二进制档位只在 `progress <= .02` 或 `>= .95` 的动画端点提交；提交时复位缩放，字号视觉
     连续。`commentTransitionArmed` 保证关闭动画在高度先恢复时仍继续缩放；4:3/21:9 全屏
     letterbox 静止时高度未缩小，不误判。
  4. 端点渲染边距使用屏幕视频宽，避免局部矩形晚一帧导致二次重排。
- 现象二（首视频先显示几秒原生字幕再切 AI）根因：`suppressNativeDraw()` 只在
  `ownsNativeTrack()`/`isVisibleActive()` 为 true 时遮挡；AI 开启初期两者都是 false，原生
  字幕先画。且 `CaptionButtonController.onVideoId()` 只在 `captionIntent==ON` 时启动，首视频
  要等 CC 扫描。修复：
  1. `suppressNativeDraw()` 改为 `enabled()`：AI 开关开即遮挡原生窗口，关即恢复原生。
  2. `CaptionButtonController.onVideoId()` 在 `DeepSeekConfig.enabled` 时立即
     `NativeCaptionBridge.onCaptionsShown()`；用该视频后台已捕获的 native selection 启动，
     没有再走 `refreshFromCatalog()`/等待原生轨。
- 验证：全量 `:extensions:extension:testDebugUnitTest` **288 tests / 54 result files**，
  0 failures / 0 errors / 0 skipped；新增
  `CaptionLayerOverlayTest.theReadingSizeFollowsTheSheetScaleBeforeTheClassCommits`
  （1850 px 中间态：档位仍 FULL、scaleY 在 .8–.96；1478 px 端点：REDUCED、44.5、scale=1）。
  `CaptionPresentationClassTest` 覆盖 observed width；本地化 232×14；
  `verifyIntegrationSources` `errors=[]`。
- 产物：`build/n39/gradle/patches/libs/patches-1.5.6.mpp` **578,359 B**，SHA-256
  `3B18049DE92601E5058143D0D8DEF0B66665D032883861FEEBB471836F4ECCBB`；manifest
  `Version: 1.5.6`、`Patcher-Version: 2.0.0`；内嵌 MPE 含 `local-1.5.6-n63`；
  `captionBuildId=local-1.5.6-n63`；`patches-list.json`/`patches-bundle.json` 均为 1.5.6。
  未签名、未安装、未发布。
- 边界：未连接真机；连续缩放是 View 渲染变换，端点后恢复原生字号渲染；AI 目标语言仍必须由
  原生 Auto-translate 选择，没有目标时不会伪造翻译，但原生样式已被遮挡；全屏↔详情 `SLIDING`
  拖动仍不缩放。

## 37. 2026-10-23 N64 官方 CC 显示权威与 1.5.6 发布

- 用户复测：从有自动翻译的视频切到没有默认译文字幕且没有 Auto-translate 的视频时，官方 CC
  策略是不打开译文，本补丁仍显示目标译文字幕。根因/修复记录
  `docs/N64-OFFICIAL-CC-AUTHORITY-20261023.md`。
- 根因：`CaptionChoice` 的目标语言跨视频保留；`CaptionButtonController.onVideoId()` 只要 AI
  开关开就调用 `onCaptionsShown()`；`applySelection()` 对后台/默认 selection 直接启动；因此
  AI 开关被误当成“显示字幕”，而不是“官方显示时用 AI 样式”。
- 修复：
  1. 换视频时 `captionIntent=UNKNOWN` + `CaptionChoice.reset()`，上一视频目标不泄漏。
  2. `refreshNativeTrack()`、`refreshFromCatalog()`、`applySelection()` 都以
     `CaptionButtonController.captionsKnownOn()` 为显示门禁；CC 未确认打开时只保存 selection，
     不启动可见 AI。
  3. `suppressNativeDraw()` 仍由 AI 开关选择绘制方式：AI 开不画原生，AI 关恢复原生；字幕是否
     出现由官方 CC 决定，CC 关时两边都不显示。
- 验证：全量 `:extensions:extension:testDebugUnitTest` **289 tests / 54 result files**，
  0 failures / 0 errors / 0 skipped；新增
  `NativeOnlyCaptionTest.aNativeTrackWhileTheCcControlIsOffDoesNotStartVisibleAiCaptions`。
  本地化 232×14；`verifyIntegrationSources` `errors=[]`；
  `validate_morphe_metadata.py 1.5.6`、`verify_bundle.py 1.5.6`、`test_release_contract.py`
  均通过。
- 1.5.6 发布产物：`build/n39/gradle/patches/libs/patches-1.5.6.mpp` **578,441 B**，SHA-256
  `E272FCE127BF8B659BF83FDB77C5918D8A59A9B599FCEB60FB39438AE4DED1B1`；manifest
  `Version: 1.5.6`、`Patcher-Version: 2.0.0`；内嵌 MPE 含 `release-1.5.6`；
  `captionBuildId=release-1.5.6`。GitHub release `v1.5.6` 已上传同名资产；README 发布表
  已由 `generate_patches_readme.py` 更新为 v1.5.6；`patches-bundle.json` 使用
  `docs`/release notes 的 1.5.6 说明。
- 边界：未连接真机；官方 CC 状态来自真实 CC 控件扫描，扫描前可能短暂空白；没有原生目标语言时
  不会伪造翻译。

## 38. 2026-10-23 N65 评论区端点预排、字号与布局解耦（1.5.7 本地构建）

- 用户复测：横屏全屏经播放器 UI 打开评论区仍卡顿，字幕字号“明显有一点滞后”；要求从根因给出
  既不影响原生开合动画、又能让字号与动画同时到位的方案。根因/修复记录
  `docs/N65-CAPTION-SHEET-ENDPOINT-20261023.md`。
- 输入诊断：`caption-diagnostics-1.5.6-20261023-120203.txt`（5,545,712 B / 12,711 events）。
  证据：FULL→REDUCED 提交后 **277/294/273/292/303/303 ms** 字号才上屏；反向 REDUCED→FULL 为
  **13/14/13/18/15/13 ms**；提交瞬间字号比目标大 **24.7%**（60.717945/48.68376）。
- 根因：
  1. 档位只在动画端点提交，端点又需要一个从未排过版的新宽度（1483 px）计划；`caption_hold`
     期间原样保留旧 layout 与旧字号，等后台单线程排完（≈280–300 ms）。
  2. `commitPresentationClass()` 在提交帧就 `resetCommentScale()`，而新字号 200–300 ms 后才到，
     旧 layout 以原生 55.5 绘制 → 可见回弹后再缩小。
  3. 关闭方向因为 FULL 计划本就在缓存里（13 ms）且缩放收敛在 1.0，所以只有“开”看得见。
  4. 动画期间每帧重复读 8 次同一块可见矩形（`currentVideoBounds` 2 次 + 进度/缩放各 3 次）；
     `followVisibleText` 在视频窄于框宽后每帧 `setLayoutParams`，让播放器 overlay 每帧重 measure。
  5. `commentProgress()` 无可见矩形时返回 -1，`applyCommentScale()` 未拦截 → 偶发 scale=1.198。
- 修复：
  1. **预排端点**：`preplanEndpoint()` 在动画中用与 `render()` 相同的宽度/字号/key 规则构造预算，
     交给新增的 `CaptionPageExecutor.prefetch()`（独立单线程、只填缓存、不发布、不缓存空结果、
     不占真实请求队列）；`planKey()` 抽出复用，保证预排即端点所需。
  2. **视觉尺寸与布局解耦**：缩放改为 `目标字号 / 已布局档位字号`（`appliedClass`），提交不再
     复位，新计划落地当帧重算为 1.0；提交帧也补一次 `applyCommentScale()`。
  3. **每帧只读一次几何**：`CaptionSurface.observedVideoRect(Rect)` 取代
     `visibleVideoWidth()/visibleVideoHeight()`；转场期间锚点宽度保持 class 宽度，只位移+缩放。
  4. 新增 `COMMENT_SHEET_SYNC`（debug，48 ms/条）与 `COMMENT_SHEET_ENDPOINT`
     （`commit_to_size_ms`、`plan_ready_at_commit`），端点延迟可结构化复测。
  5. 清理本轮被替换的实现：`visibleVideoWidth/Height`、`commentScale` 字段、`classGlyphHeight`
     字段、`applyCommentScale` 的端点复位分支、测试影子里的旧方法。
- 验证：全量 `:extensions:extension:testDebugUnitTest` **291 tests / 54 result files**，
  0 failures / 0 errors / 0 skipped（2026-10-23 12:37）；新增
  `CaptionLayerOverlayTest.theEndpointNeverPaintsTheOldLayoutAtItsOwnSizeWhileThePageIsPlanned`
  （提交帧 painted glyph 已是 44.5，计划落地后 scale=1）与
  `aPrefetchedPlanIsReadyForTheRequestThatNeedsIt`（预排进缓存、只算一次、命中后不再算）；
  更新 `theReadingSizeFollowsTheSheetScaleBeforeTheClassCommits`。本地化 232×14；
  `verifyIntegrationSources` `errors=[]`。
- 本地产物：`build/n65/gradle/patches/libs/patches-1.5.7.mpp` **580,946 B**，SHA-256
  `53190017F4E1EAF12FACAEFEA118508D61C5C6231D352D6C800151D0E958AD70`；manifest
  `Version: 1.5.7`、`Patcher-Version: 2.0.0`；内嵌 MPE 含 `local-1.5.7-n65`；
  `gradle.properties` 为 `version=1.5.7` / `captionBuildId=local-1.5.7-n65`。构建用
  `validation/runs/20261023-n65/build-dir.init.gradle` 把输出隔离到 `build/n65`，已发布
  `build/n39/.../patches-1.5.6.mpp` 未被覆盖（SHA 仍 `E272FCE1…`）。
- 边界：未连接真机；预排依赖“端点宽 = min(本地视频宽, 0.66×参考宽)”的预测，命中失败会退回
  旧路径并在 `COMMENT_SHEET_ENDPOINT.plan_ready_at_commit=false` 可见；动画中仍是 View 渲染
  变换（轻微栅格化），落地后恢复原生字号渲染；全屏↔详情 `SLIDING` 拖动仍不缩放。

## 39. 2026-10-24 N66–N68 会话恢复/滚动字幕重建与 1.5.7 发布

- 输入诊断：`caption-diagnostics-1.5.7-20261023-130333.txt`（N66）与
  `caption-diagnostics-1.5.7-20261024-001310.txt`（N68）；字幕文件
  `g22Z__ShvVY.en.json3` / `.en.vtt`（18,532 events）。
- 根因一（同一视频再进入不显示）：
  1. 离开视频时的 `WATCH_WHILE_MINIMIZED` 把 player authority 锁成 `COMPACT`。
  2. 再进入同一视频时播放器被复用，YouTube 不一定再发 player type 回调；`setVideo` 对相同 id
     直接返回，`CaptionSessionReconciler.onVideo` 为 `fresh=false`，`appliedKey` 仍匹配，
     `needsResume()` 又因引擎仍 `visible/ownsNativeTrack` 返回 false。
  3. 结果 engine 的源/译文/选中事件都在，但 `CaptionOverlayV2.blocked()` 一直拒绝绘制，
     诊断落在 `REBUILD_PRESENTED … suppressed/player_suppressed`，且之后没有恢复入口。
- 根因二（特定视频重复/跳变）：
  1. JSON3 是 `wpWinPosId` 逐词高亮轨道，每个 event 都是整行快照，`pPenId` 标记已说/未说；
     旧 `json3Spans()` 只认 `wWinId`，把每次高亮都当新台词。
  2. 多个 `wpWinPosId` 说话窗口被按时间拍平成一条词流，造成逐词交错。
  3. 诊断 `words=20939 / blocks=3858 / raw_fragments=102759`；同段源文本出现
     `We'll not only do it again We'll not only do it again …` 的重复。
- 修复：
  1. **恢复**：`CaptionApplication.playback()` 每次 tick、以及同一视频 `VIDEO` 事件，调用
     `CaptionPlayerAuthority.reconcileCurrentPlayerTypeIfUnsettled()`；官方镜像 `NONE` 不作为
     有效类型；settled 非滑动类型从 `COMPACT` 直接恢复到 `REGULAR`；滑动类型仍等几何 probe；
     `WATCH_WHILE_MINIMIZED` 可用真实播放器几何兜底（竖屏高度 ≥15% / 横屏 ≥40%，宽 ≥35%），
     真实 miniplayer/Shorts/NONE/HIDDEN/INLINE_MINIMAL 不放行。记
     `PLAYER_TYPE_RECONCILED reason=official|geometry`。
  2. **滚动字幕**：`wpWinPosId` 轨道按窗口 episode 累积；`karaokeSpeech()` 只取最后一个非 dim
     `pPenId` 段之前的已说前缀；一行一个 span；起点相差 ≤250 ms 的同时窗口合并为一条同时字幕。
  3. 旧 `wWinId` 行为保留；`wpWinPosId` 无 `pPenId` 的轨道仍按整行前缀/后缀去重。
- 验证：`:translation-core:testDebugUnitTest` **254 tests**、
  `:extensions:extension:testDebugUnitTest` **344 tests**，0 failures / 0 errors / 0 skipped；
  本地化 232×14；真实 6.7 MB JSON3 从 20,939 words 降到 **11,090 words**，开头与 58 s 文本不再
  重复/交错；`verifyIntegrationSources errors=[]`。
- 发布：MPP `build/n39/gradle/patches/libs/patches-1.5.7.mpp` **587,256 B**，SHA-256
  `41D96E4B65ED9419854E02013BA71D73B884AD444683DDD559EC32E74DA77159`；发布提交
  `18c6141` / tag `v1.5.7`；GitHub release 资产匿名下载为 587,256 B，SHA-256 与上述一致。
  manifest `Version: 1.5.7`、`Patcher-Version: 2.0.0`；内嵌 MPE 含 `release-1.5.7`；
  `patches-list.json` / `patches-bundle.json` / CHANGELOG / README 均为 1.5.7；
  `validate_morphe_metadata.py 1.5.7`、`verify_bundle.py 1.5.7`、
  `test_release_contract.py` 均通过。README 的 1.5.7 说明只保留三条体验差异：
  再进入恢复、滚动字幕不再重复/交错、评论区字号跟随动画。
- 边界：VTT source-only 路径未改颜色高亮去重；未连接真机；未构建/签名 APK；1.5.6 资产字节
  `E272FCE1…` 保持不变。
