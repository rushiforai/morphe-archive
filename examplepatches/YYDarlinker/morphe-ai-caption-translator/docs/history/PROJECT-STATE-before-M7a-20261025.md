# PROJECT-STATE — 1.5.8 本地测试 / 1.5.7 已发布（N40–N48 修复；N49/N50 上游评估；N51 两层投影；N52 显示保证；1.5.5 发布；N53 字幕图层/字号；N54 原生样式/分页评估；N55 动画双时钟；N56 回归修复/恢复拖动；N57 拖动/抖动根因；N58 稳定图层/触摸代理/视口档位；N59 Patcher 2.0.0/Morphe 1.48.0 适配与语言菜单功能删除；N60 Flyout VerifyError 修复；N61 字幕越界/档位/Shorts 字号图层；N62 评论区快速换档/AI 开关即刻生效/短字幕框宽；N63 评论区动画同步字号/AI 首视频遮挡原生样式；N64 官方 CC 显示权威/无 CC 不显示 AI 译文字幕；N65 评论区端点预排/字号与布局解耦；N66–N68 AI 会话恢复/滚动字幕重建）

## 1. 当前身份

- 活动仓库：`E:\Projects\DeepSeek morphe-ai-caption-translator`
- 分支：`codex/fix-cc-authority-1.5.8`；本轮基线 `de844402776e1046a5bec87aac94e2e65f05bea7`
- 基线：`2c96054` / `v1.5.4`（2026-10-14）；1.5.5 发布提交 `40d5d58`，已合并 `origin/main`（`a42c593`）
- 本地版本：1.5.8；测试构建 `local-1.5.8-m6a`（M6a v1经统筹接受F5解释/有限机制及两项修复；candidate-01；完整872项有效、独立103项通过；下一M7a工具/环境/维护资料已下发未执行，产品冻结；F1/F2/F4、F3语义缓存、Publication和M5h配置保护保持）；当前公开发布仍为 1.5.7 / `release-1.5.7`。
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


## 40. 2026-10-24 N69 CC 显示权威 / AI 模式分离（1.5.8 本地测试）

- 输入：`caption-diagnostics-1.5.7-20261024-103945.txt`；SHA-256
  `93076C85E705DA6BE2A3EB0C48BEE64C7D89A8C09F004CAD923D1D55D7A10252`。
  根因/实现/真值表：`docs/N69-CC-AUTHORITY-AND-AI-MODE-20261024.md`。
- 根因：CC off 被写进持久 AI enabled 位，CC on 的观测路径不会恢复；反向 AI on / tick / URL
  入口没有 CC 门禁。点击又以 AI 可见性优先于明确 CC 状态；停止引擎改变 epoch 后，紧随的原生
  事件可能被判 stale。译文请求被换成空轨道也导致 AI off 后原生无内容可画。
- 修复：CC 许可与 AI 模式分离；关闭 CC 保留 AI/目标/revision 并停止显示，重新打开恢复所选
  模式；settled 控件观测也停止/恢复；普通精确回调在忽略窗后重读；当前 epoch 事件立即重绑。
  会话 apply/恢复、URL、应用命令与最终 overlay 都服从 CC，换视频先清 CC 许可并废弃旧控件
  的延迟读取。原生菜单只改语言，不偷开 AI；保留原生真实请求，以 draw hook 选择绘制方式。
- 验证：`:translation-core:testDebugUnitTest` **254 tests**、
  `:extensions:extension:testDebugUnitTest` **352 tests**，共 **606 tests**，
  0 failures / 0 errors / 0 skipped；本地化 232×14；`verifyIntegrationSources errors=[]`；
  独立 UI preview 与 `:patches:buildAndroid` 成功。真实应用端口新增 8 个回归，覆盖真实 CC
  触摸三轮、CC off 切 AI、原生模式、仅观测恢复、源轨零翻译、晚到结果、立即选轨与新视频许可。
- 交付：`build\delivery\1.5.8\patches-1.5.8.mpp` **587,455 B**，SHA-256
  `A724EC503305B8FCA05224A76B7C048B52EC3D35709C1A9F6278C8469E15A5AF`；构建原件 `build\n69\gradle\patches\libs\patches-1.5.8.mpp`。
  manifest `Version: 1.5.8` / `Patcher-Version: 2.0.0`；内嵌 MPE 与独立 MPE 相同，含
  `local-1.5.8-n69`，14 locales；未混入测试类；完整证据在 `validation/runs/20261024-n69/`。
- 发布边界：本轮仅本地测试；`patches-list.json` / `patches-bundle.json` / CHANGELOG / README
  继续指向公开 1.5.7，未修改远端发布。发布前须生成并校验 1.5.8 的公开元数据。
  1.5.7 资产 SHA-256 仍为 `41D96E4B65ED9419854E02013BA71D73B884AD444683DDD559EC32E74DA77159`。
  ADB 未发现连接设备；未构建/签名/安装 YouTube APK，实体设备视觉验收待用户测试。


## 41. 2026-10-24 N70 Morphe / YouTube 原生语言权威（1.5.8 更新本地测试）

- 用户已真机确认 N69 的 CC 总开关问题解决。本轮继续修复语言权威；旧 N69 交付包保留。
- 输入：`caption-diagnostics-1.5.7-20261024-110546.txt`，72,480 B；SHA-256
  `73ECFE886F27BDB15471E2A92F05D0958D09B13A0AABDB2C392EDAE75B4AFF1F`。根因/逻辑/验证：`docs/N70-NATIVE-LANGUAGE-AUTHORITY-20261024.md`。
- 直接证据：`1792810887691` 原生 `DEFAULT` 提交 `zh-Hans`；52 ms 后成为前台的新视频
  `_XxySdqU1Xg`，AI 却以持久 `target=en;translate=false;revision=86;mode=source` 启动。
- 根因：保存的手动目标优先于自动选轨；应用 key 缺原生选轨身份；先于 VIDEO 到达的默认选轨
  没有交接；源请求恢复入口还会补回旧 `tlang`。
- 修改：持久化只保存 AI 开关；旧语言字段不再读取/写入，下一次切 AI 时删除。当前视频实际
  committed 轨道是语言唯一来源，自动/default 与手动都生效，target 来自真实 `tlang`。
  删除用旧目标从源目录回退/猜测/合成轨道的路径。应用 key 加原生 selection revision；切换
  语言先停止旧会话并撤销旧请求/绘制许可。新视频清语言；提前到达的后台提交按当前 manager
  owner 一次性交接，已消费的手动选择不重放；源 URL 恢复保持原 URL。
- 验证：core **254** + extension **370** = **624 tests**，
  0 failures / 0 errors / 0 skipped；新增原生语言权威 14 个回归、真实应用 4 个回归；
  原 CC 回归继续全通过。本地化 232×14；`verifyIntegrationSources errors=[]`；独立 UI/MPP
  构建成功；81 个 compiled core classes 无宿主/UI 依赖，UI APK 无翻译引擎。
- 交付：`build/delivery/1.5.8-n70/patches-1.5.8.mpp` **586,202 B**，SHA-256
  `F9E528EB6433BB9E4D6A8A4DC72A4873EAA813D8F83DF79A7A3A433C7E8CF381`；原件 `build/n70/gradle/patches/libs/patches-1.5.8.mpp`。
  manifest `Version: 1.5.8` / `Patcher-Version: 2.0.0`；内嵌 MPE 与独立 MPE 相同，含
  `local-1.5.8-n70`，14 locales。完整证据 `validation/runs/20261024-n70/`。
  AGP 的最终 preview APK 输出仍在共享 n39 调试目录，已验证 N70 build id 并保存到
  `build/n70/verified-ui-preview/ui-preview-debug.apk`；MPP / core / test 构建输出在 n70 目录。
- 边界：本轮本地构建，公开元数据仍为已发布 1.5.7；未发布 GitHub / 未签名或安装 YouTube
  APK。本轮实体设备复测待用户使用 N70 新包；N69 MPP SHA-256 仍为 `A724EC50…E15A5AF`，
  公开 1.5.7 MPP 仍为 `41D96E4B…DA77159`。


## 42. 2026-10-24 N71 CC 稳定确认与启动延迟（基于 N70 的 1.5.8 本地测试）

- 输入：`caption-diagnostics-1.5.8-20261024-111129.txt`，355,780 B，导出 N69；SHA-256
  `3C3F3E5B8DB62CE0EA9BA85736900022B254F372571DA39F4BC033825FF8B79A`。根因/方案/验证：`docs/N71-CC-STARTUP-LATENCY-20261024.md`。
  旧日志三次 CC 确认约 4.52 s，缓存命中视频首译文仍等 4.762 s；本轮在 N70 上修复。
- 根因一：转场同时写入独立转场截止与通用 UI 忽略截止；稳定后只清前者，`Math.max` 继续保留
  后者的 4.5 s。CC unknown 门禁因此连源字幕加载都一起推迟。根因二：单一 `scanPosted` 阻止
  稳定后的 120 ms 扫描替换已经排在远期的扫描。
- 修改：转场不再写第二个通用输入期限，新视频清除上一视频输入保护；仅真实 REGULAR 且 owner
  有效时释放转场保护并重读本视频精确控件。扫描保留最早截止、可提前替换、generation 失效。
  ON 及时确认；同视频瞬态 OFF 保留独立 900 ms 防抖，真实触摸/原生菜单关闭仍立即停显示。
  排除其他 Activity 的控件；safe blank 不授予快速路径；CC/当前原生选轨门禁继续使用 N70。
- 验证：原 N70 运行逻辑下同批 9 个合同有 **5 个失败**；修复后扩展为 15 个时序/边界合同，
  全通过。Robolectric 虚拟时钟：稳定后精确确认 **0 ms**，独立扫描确认
  **120 ms**；两条路径都受 ≤200 ms 断言约束，不是手机完整首译文实测值。
  另有 2 个真实应用 + MockWebServer 回归验证及时启动和 CC OFF 零新视频请求。
- 全量：core **254** + extension **387** = **641 tests**，
  0 failures / 0 errors / 0 skipped；N69 CC 与 N70 语言同步回归全通过；本地化 232×14；
  `verifyIntegrationSources errors=[]`；独立 UI/MPP 构建成功；compiled core/UI 依赖边界通过。
- 交付：`build/delivery/1.5.8-n71/patches-1.5.8.mpp` **587,241 B**，SHA-256
  `EA8FB889CC2A794577F088BE50969ECF0628BD27E38F6BD3CB4B2F3454A6B292`；原件 `build/n71/gradle/patches/libs/patches-1.5.8.mpp`。
  manifest `Version: 1.5.8` / `Patcher-Version: 2.0.0`；MPE 内嵌/独立一致；
  `local-1.5.8-n71`、14 locales；`CC_STARTUP_READY` 提供 video/stable 到 CC 的耗时。
  证据 `validation/runs/20261024-n71/`；preview 已核验 N71 build id 并存到
  `build/n71/verified-ui-preview/ui-preview-debug.apk`。
- 边界：本轮未连接设备/未安装 YouTube APK；实际总首译文仍取决于源字幕加载、有效 cue 和
  翻译服务响应。N69/N70 与公开 1.5.7 MPP 哈希保持原值；公开订阅元数据仍为 1.5.7，本轮仅本地测试。


## 43. 2026-10-24 N72 Shorts 默认字幕与退出残留（基于 N71 的 1.5.8 本地测试）

- 输入：`caption-diagnostics-1.5.8-20261024-123002.txt`，1,234,429 B，导出 N71；SHA-256
  `70AB383C32D53102A97541C2FA27E91F619CF9E49325B50B9729B32F1C5E1C88`。
  根因/方案/验证：`docs/N72-SHORTS-CC-AND-EXIT-20261024.md`。
- Shorts 默认轨道已有正确 zh-Hans，但普通 TouchImageView CC hook 未报告，CC UNKNOWN
  阻止启动；手选语言因 PREFERRED_TRACK 确认 CC 才恢复。新增 committed 证据，仅当前
  视频、真实 Shorts/owner 初始化未知 CC；用户 OFF 不被默认轨道覆盖，强制回退不授予 ON。
  自动 reset 与用户 OFF 分开；普通播放器残留 CC ImageView 不能覆盖 Shorts。
- 官方 ShortsPlayerState Companion setter 所有返回点通知扩展；关闭立即隐藏/失效绘制，
  取消旧会话、清除本次 CC/选轨观察。旧 reel 不能重新授予权限；无关闭回调但表面消失
  时 pre-draw 收起旧画面。同 Short 重进使用新默认；普通视频接管后不受晚到关闭影响。
- 验证：N71 两个直接故障合同 2/2 失败；最终 Shorts 20/20 通过。core 254 + extension
  410 = **664 tests**，0 failures/errors/skipped；N69/N70/N71 回归全通过；普通播放器
  CC 虚拟精确 0 ms / 扫描 120 ms。14 locales / 232 keys；源码、compiled core 和 UI 边界通过。
- 官方 1.48.0 + YouTube 21.41.525 / 21.23.492 的真实 Patcher 合成、DEX 序列化及审计通过；
  核验官方 setter 的生命周期回调与 isOpen 读取。未进行资源重编译、签名或实体安装。
- 交付 `build/delivery/1.5.8-n72/patches-1.5.8.mpp`，**589,508 B**，SHA-256
  `B5F02DDD861EE695DC15EFF6B0ECB264ECC86F01455275935E717ADF39F06A95`；Version 1.5.8 / Patcher 2.0.0 / `local-1.5.8-n72`。
  本轮构建在 `build/n72-shorts/`，保留历史 `build/n72/` 字节；MPP/MPE 一致，旧 1.5.7、
  N69/N70/N71 哈希未变；证据 `validation/runs/20261024-n72/`。
- ADB 无设备，实际导航/滚动待手机复验。仅本地测试；公开发布及订阅元数据仍为 1.5.7。


## 44. 2026-10-24 N73 连续开关与再进入恢复（基于 N72 的 1.5.8 本地测试）

- 输入 `caption-diagnostics-1.5.8-20261024-132259.txt`，284,098 B，导出 N72，SHA-256
  `7BB55CDDA7D07B76CD48E13F3F51CE375F7E9B17444D946C21CD21534FAAF372`。
  报告 `docs/N73-PLAYER-ENGINE-LIFECYCLE-AND-CC-20261024.md`；证据 `validation/runs/20261024-n73/`。
- 根因：引擎 stopped 调用关闭真实播放器，清掉 type/增加 owner epoch；N72 的退出守卫
  因 CLOSED/UNKNOWN 拒绝下一次启动，形成恢复死锁。此前独立测试缺少先退出 Shorts 的
  历史。两个引擎生命周期回调现不写 player authority；core publication/取消仍使旧输出失效。
- 同 Short 新 DEFAULT 在 VIDEO 前 68 ms 到达，被误当已消费旧访问后清空；pending 现按
  bridge 的有效访问 id 判断，保留新观察一次 handoff，仍禁止回放已消费手选语言。
- 真实 CC 直接点击为 DEFAULT/reason=1，现按 committed 用户操作识别；菜单仍为
  PREFERRED_TRACK。普通 DEFAULT/原始请求不覆盖用户 CC OFF，AI 开关不写 CC/语言。
- 基线 12 项新合同 / 9 失败；最终新增 14/14 通过。core 254 + extension 424 = **678 tests**，
  0 failures/errors/skipped；Shorts 23/23，CC 时序 15/15（虚拟精确 0 ms / 扫描 120 ms）。
  既有语言、CC、退出不残留全部回归通过；232×14 本地化与依赖边界通过。
- 官方 1.48.0 + YouTube 21.41.525 / 21.23.492 真实代码合成、DEX 序列化/审计通过，
  验证两个引擎回调不再写 player authority，且 Shorts lifecycle hook 仍在；无资源重编译或安装。
- 交付 `build/delivery/1.5.8-n73/patches-1.5.8.mpp`，**589,636 B**，SHA-256
  `DC5288B37BF8CF4D73A9E07C8CAEAEEEFFAD1657E1D4C5A909C35F3CA88BA4B6`；Version 1.5.8 / Patcher 2.0.0 / `local-1.5.8-n73`。
  在最后合成任务后固定包并校验原件/交付相等；旧 1.5.7 与 N69–N72 保留原哈希。
- ADB 无设备，手机视觉/导航待用户复测。公开发布及订阅元数据仍为 1.5.7，未推 GitHub。


## 45. 2026-10-24 N74 动画主线程减负与 Shorts 评论区视口（基于 N73）

- 输入 N73 诊断 `caption-diagnostics-1.5.8-20261024-155621.txt` / `160047.txt` 和用户截图；
  详细证据、备份与结果在 `validation/runs/20261024-n74-animation/`；报告
  `docs/N74-ANIMATION-WORK-AND-SHORTS-COMMENTS-20261024.md`。
- 动画原因：3 参数日志在调用线程解析/解密 API key，且使用全局 monitor/profile lock；AI off
  仍会有生命周期/选轨诊断。retained engine 在小窗/SLIDING 时还可触发 renderer 树查找。
  Shorts 将缩小画面的宽当作字幕宽；该短日志 54 条重排、23 档宽度（986→418），17 条原文隐藏。
- 修改：记录调用捕获固定 profile 的密文快照，后台解密/缓存/脱敏，不等待 profile 解密锁；
  网络密钥 load 的 origin 校验和锁保持原逻辑。辅助发现仅在稳定可显示播放器运行，已知遮罩
  和原生 draw hook 保留；空内容 overlay 不做额外渲染/权限几何检查。Shorts 用包含左右黑边
  的字幕宿主宽，仅跟随视频区纵向移动，宽未变时保留字号/分页；普通全屏侧边评论区逻辑保留。
- N73 七个 application/player/CC/selection/surface 关键源文件字节保持原值，生命周期与语言权威
  没有重写。core **254** + extension **433** = **687 tests**，
  0 failures/errors/skipped；新增 9 个合同全通过，原 CC/语言/启动/Shorts 退出恢复回归通过。
  20 条日志调用线程读取 0 / writer 解密 1；Shorts 测试预算 974→974 / 分页次数 1→1；
  小窗与 SLIDING 辅助扫描 0 并可在 REGULAR 后恢复；虚拟 CC 时序保持 0 / 120 ms。
- 本地化 232×14；源码、compiled core/UI 边界和 UI/MPP 构建通过；MPE 内嵌/独立一致。
  包 `build/delivery/1.5.8-n74/patches-1.5.8.mpp` **590,269 B**，SHA-256
  `344FF653153C9889C27D9EF426CA2561B7EACB5939808A460770290FE9108D36`，`local-1.5.8-n74` / Version 1.5.8 / Patcher 2.0.0。
  原件 `build/n74-animation/gradle/patches/libs/patches-1.5.8.mpp`；旧 1.5.7 / N69–N73 保持原哈希。
- 边界：日志不是 FrameMetrics/Perfetto，也没有无本补丁的同机 A/B，不能归因所有原生卡顿。
  本轮优化明确的补丁主线程工作；实体设备动画/裁剪复验待用户测试；未签名安装或发布远端。


## 46. 2026-10-24 N75 Shorts 历史/同视频重入就绪协调（基于 N74）

- 输入 N74 诊断 `caption-diagnostics-1.5.8-20261024-164802.txt` / `165150.txt`。
  SHA-256 分别 `BB93DFCC38C3C76CB1436DEAA1C01CC0C05C3CE50BF4DA94D0552C4BF79A219B` /
  `EADA0066AD7B4DF85696BF40C238ABEF559B4BD2951262D7D6B7828B0477F8EC`；报告 `docs/N75-SHORTS-HISTORY-READY-RECONCILIATION-20261024.md`。
- 原因：新 DEFAULT 和 handoff 均成功，但当时表面未验证；延后 REGULAR 只唤醒 overlay/普通
  CC 控件，没有唤醒会话。Shorts 缺普通 CC 控件回调，CC UNKNOWN 形成无活动引擎/无新 tick 的
  等待；recoverShorts 不再探测 REGULAR 下未绑定的表面，同 ID VIDEO 只 apply 也无法结束等待。
- 方案：open / REGULAR / geometry / 当前 VIDEO、观察事件请求一次带 epoch/video/generation
  校验的主线程协调任务；相同访问合并，退出/teardown/新会话取消。只在 REGULAR 且有效 Shorts
  恢复候选下执行；强就绪事件允许一次表面重验，普通观察仍节流。允许重新绑定 REGULAR 中缺失
  的 Shorts 表面；仍只采纳本次 foreground committed 选轨，用户 CC OFF / AI OFF / 无新轨道
  不被覆盖，不增加 timer/逐帧轮询。
- 验证：N74 直接复现 3/3 失败；N75 新增 12/12 通过，含不补发 type/time 的源/译文真实应用
  恢复、已排队关闭、无新轨道、CC OFF、AI OFF、普通视频不被旧 open 标记授予 CC、合并20次信号。
  core **254** + extension **445** = **699 tests**，0 failures/errors/skipped。
  N74 9 个动画/视口合同继续通过，相关性能/布局/CC controller/application/native handoff 文件
  与 N74 字节相同；本地化 232×14；源码与 compiled core/UI 边界、UI/MPP 构建通过。
- 交付 `build/delivery/1.5.8-n75/patches-1.5.8.mpp` **591,315 B**，SHA-256
  `F7899CF810CDAC9948644AFC575D5D71589F092614CEECF1B27CF2AA5F760678`；原件 `build/n75-shorts-reentry/gradle/patches/libs/patches-1.5.8.mpp`。
  `local-1.5.8-n75` / Version 1.5.8 / Patcher 2.0.0；MPE 内嵌/独立一致，14 locales。
  完整 N74 检查点和本轮证据在 `validation/runs/20261024-n75-shorts-reentry/`。
- 本轮无设备安装；历史记录实机导航待用户复测。公开 1.5.7 / N69–N74 包保留原哈希，未发布远端。

## 47. 2026-10-24 独立补丁长期维护路线（方案）

- 用户决策：继续作为独立包维护，暂不向 Morphe 官方提交 PR；后续以专业、成熟、易维护为目标。
  有效路线为 `docs/MAINTENANCE-ROADMAP.md`；N49/N50 的上游化目标不再作为当前施工目标，历史报告保留。
- 用户反馈 N75 暂未发现明显问题；这是当前实际使用观察，不等同于新增版本矩阵或设备性能认证。
- 本轮保存当前 Git 跟踪及非忽略的未跟踪源码到
  `validation/runs/20261024-maintenance-roadmap/n75-source-tree.zip`，包含未提交的 N69–N75；
  逐文件哈希和 HEAD/工作树记录同目录。de84440 单独不是完整 N75 源码。
- 阶段：M0 本地检查点；M1 统一验证/CI/发布前检查与候选身份；M2 清理失效实现；
  M3 状态职责/事件顺序回归；M4 按职责逐段降耦合；M5 网络/配置/存储契约；
  M6 基于测量的性能与诊断；M7 简明文档/兼容与日常维护。M1–M7 尚未实施。
- 下一批 M1a：当前验证入口和候选身份；补齐 CI/semantic-release prepare 的 core 测试及正确报告路径，
  区分本地候选和公开版元数据。`.devenv/verify-full.ps1` 仍硬编码 v1.5.4；不能直接作为 N75 完整验收。
- 当前 N75 行为、21.x 支持范围、独立命名空间、API profile/KeyStore、原生 CC/语言权威及发布所有权保留。
  不按任意行数删功能，不大规模重写，不为了上游化搬迁官方模块。
- 本轮为基线保存和方案文档：生产代码、测试、Gradle/CI/发布脚本及交付包未更改；未运行付费 API、安装或发布。
  N75 699 项测试是既有结果核验，本轮没有重新运行整套测试。

## 48. 2026-10-24 分轮执行与统筹交接（M1a 待执行）

- 用户指定：每步新开执行对话，完成后将答复交回当前统筹对话复核；由统筹决定下一任务。
- 分轮入口 `docs/maintenance/README.md`；根 AGENTS 已加入任务卡读取、保护既有工作树、持久报告和复核边界。
- 已下发首卡 `docs/maintenance/tasks/M1a.md`（v1）：统一当前源码、core/extension 两组测试与指定候选包验证，
  补齐 CI/semantic-release 发布前 core 测试、报告路径及候选/release 模式的拒绝检查。
- M1a 执行尚未开始，统筹复核未开始；本轮仅准备任务与交接文档，不构成 M1 实现完成。
- 执行结果固定写入 `docs/maintenance/results/M1a-RESULT.md`；具体日志和机器可读证据置于
  `validation/runs/<date>-M1a-<unique-run-id>/`。执行者回报已完成后先处于待复核，不自动推进 M2。
- 首卡保留 N75 生产代码、既有行为测试、产品版本、公开元数据及历史交付；无需 Git 提交/推送/发布。
  受控脚本修改及必要本地验证由执行者直接完成，例行可逆技术选择不反复询问非程序员用户。


## 49. 2026-10-24 M1a v1 当前验证与候选身份（已完成待复核）

- 执行结论：M1a 已完成待复核；统筹复核待复核，未标记接受；M1 后续/M2 未下发或执行。
  结果 `docs/maintenance/results/M1a-RESULT.md`；证据 `validation/runs/20261024-M1a-185000/`。
- 当前完整入口 `.devenv/verify-full.cmd` / `.ps1` → `tools/verify_current.py`；日常 dev.ps1 保留。
  默认不访问真实模型；两组 Test、localization/provenance、UI/MPP 与明确指定 MPE/包联合检查。
  CI 补齐 dev/codex 分支及实际报告路径；semantic-release prepare 共享双模块测试与严格 release gate。
- 最终有效 run `20261024-M1a-candidate-03`：core 254 + extension 445 = 699，均本轮实际执行，
  0 failures/errors/skipped；15 工具合同 + 14 发布合同通过，10 个真实包/模式 CLI 检查符合预期。
  本地化 232×14；81 compiled core classes、UI/包边界与泄漏检查通过。
- 候选 `build/maintenance/M1a/20261024-M1a-candidate-03/patches-1.5.8.mpp`，591,314 B，
  SHA-256 `253b28f9d86bd766667f6005ee166bf08db95c71fbc73bd9e3d5752626322b3c`；仍为 1.5.8 / local-1.5.8-n75 / Patcher 2.0.0。
  指定独立 MPE/内嵌相同；R8/syncExtension 为本次 Gradle 确认有效复用，不冒称新执行 R8。
  源码/构建/工具 Git 范围 366-file 指纹 `2029cf3bcf014c962fb857af87d29086d8052275a08ca7779d936d392490391c`；构建前后相同。
- 生产源/已有行为测试/黄金断言、产品身份、公开元数据、355 个保护文件和旧交付哈希未变；
  仅 MPP 生成 Timestamp 与旧 N75 不同，其他归档条目字节相同。完整入场/批次 diff 可查。
- 初次 HTML 长路径归档和工具 fixture 清理失败已修正并保留失败记录；首次独立工具自测临时
  使用系统 TEMP 的路径偏差及后续固定到 E: 的修正详见结果报告。最终入口各必需项全部通过。
- 未运行远端 CI、真正发布 prepare/publish、真实 APK 组合、签名安装、设备或真实付费服务；
  本卡交付不是兼容性/设备性能认证，公开发布仍为 1.5.7。保持独立包方向，等待统筹复核。

## 50. 2026-10-24 M1a 统筹接受与 M2a 下发

- 统筹结论：接受 M1a v1 本地工程交付；执行报告原样保留，复核记录
  `docs/maintenance/reviews/M1a-REVIEW.md`，独立证据 `validation/runs/20261024-M1a-coordinator-review/`。
- 独立核对 355 保护文件变化 0、退出清单无后续差异；源码输入指纹仍为
  `2029cf3bcf014c962fb857af87d29086d8052275a08ca7779d936d392490391c`。
  95 份归档 XML 的哈希/计数及本次 receipt 一致：254 + 445 = 699，0 failures/errors/skipped。
- 统筹重新执行 15 工具合同及 14 发布合同，均通过；真实候选复查通过、release 模式拒绝 local 包、
  compiled/资源/UI 边界复查通过。未无理由重跑 699 项产品测试，也未冒称远端 CI/正式发布已运行。
- 候选哈希仍 `253b28f9d86bd766667f6005ee166bf08db95c71fbc73bd9e3d5752626322b3c`；
  与历史 N75 只有 manifest Timestamp 差异，其他包条目相同。已披露的首次 TEMP 偏差保留记录，当前工具已修正。
- 下一任务 `docs/maintenance/tasks/M2a.md`（v1）已准备、尚未执行：只清理退役字幕回环服务及专用网络配置，
  允许有依据地退役旧服务器两项测试；保留当前 Hook 调用/原生恢复/N74/N75 行为，需资源和真实组合证据。
- 维护入口和路线已更新。M1a 接受不等于整个 M1 或兼容矩阵完成；M2 其余工作与 M3 尚未下发。
  本统筹轮只进行复核、工具测试/包复查和文档更新，没有修改产品、构建工具实现、公开元数据或历史交付。

## 51. 2026-10-24 M2a v1 退役回环服务及专用网络增量（已完成待复核）

- 执行已完成，统筹复核待复核；结果 `docs/maintenance/results/M2a-RESULT.md`，独占证据
  `validation/runs/20261024-M2a-01/`。仅本卡；M2 其余工作与 M3 尚未下发或执行。
- 删除无生产调用的 LoopbackCaptionServer、V2 的两个旧 private helper、设置补丁的
  allowLoopbackTraffic/常量/execute 接线；修正邻近旧服务注释。8 个保留 Hook 方法实现相同，
  rewriteUrl 委托/签名、forceNativeRendererScan/kick 及 N74/N75/原生 CC/语言权威保持。
- 退役旧服务器测试 2 项，新增实际 V2+应用/模拟源翻译服务回归 2 项；原有 40 个应用测试断言不变。
  最终 run `20261024-M2a-candidate-02`：core 254 + extension 445 = 699，两个 Test 本轮实际执行，
  failures/errors/skipped 均 0；工具合同 15、发布合同 14 通过；232×14 本地化与 81 compiled core/包/UI 边界通过。
- 新候选 `build/maintenance/M1a/20261024-M2a-candidate-02/patches-1.5.8.mpp`，584881 B，
  SHA-256 `f7839db2ff51c62e5410f817b49e9075076ac9e38aaac706925d64c12bf392b9`；Version 1.5.8 /
  local-1.5.8-m2a / Patcher 2.0.0；独立/内嵌 MPE 相同。最终源码指纹
  `6e6063c166db45137d37a76b68e3e5fd4610669f62693e45c8cd27164dc5ac6d`，构建前后相同。
- 三个实际资源处理场景及各自冻结 M1a 正向对照通过：无配置、自定义证书/明文规则、已有回环规则；
  本插件停止新增网络例外，宿主/其他补丁已有策略保留。新 MPP/MPE/合成 DEX 的旧服务器类/引用及 helper 均为 0。
- 本机原始 Google 签名 YouTube 21.41.525-SECONDARY + 官方 1.48.0 / Patcher 2.0.0，
  同一 104 个官方默认根补丁 + AI 根，分别加载冻结 M1a、新 M2a 完成真实完整组合、资源重编译及 DEX 审计；
  新包 16 DEX / 64563 类，无重复定义。输入网络配置 res/OAv.xml 在 M2a 输出中原字节保持，
  相对 M1a 两个完整 APK 仅扩展 classes13.dex 和该网络资源不同，其余 18389 条目相同。
- 2180 个既有历史交付/候选文件哈希保持；M1a 工具/CI/发布链未改，公开元数据仍 1.5.7。
  入场原件、批次差异及带退出哈希检查的逐文件回退脚本均在本批证据目录。首次 run 因验证文件补充触发
  输入变化拒绝，已保留失败记录并以源码固定后的最终 run 通过替代，没有将失败批次冒称通过。
- 未运行远端 CI、其他组合矩阵、设备、真实付费模型或正式发布；未签名安装、清用户数据、提交/tag/推送。
  真实组合不是设备体验认证；等待统筹按任务卡复核，不自行接受或推进下一阶段。

## 52. 2026-10-24 M2a 统筹接受与 M3a 下发

- 统筹接受 M2a v1 本卡工程交付。执行结果原文保留，复核 `docs/maintenance/reviews/M2a-REVIEW.md`；
  独立证据 `validation/runs/20261024-M2a-coordinator-review/`。没有修改产品/测试/工具实现。
- 重新核对 2169 个未改入场文件、2180 个历史交付/候选及退出清单，字节/哈希均一致；
  当前输入指纹仍 `6e6063c166db45137d37a76b68e3e5fd4610669f62693e45c8cd27164dc5ac6d`。
- 独立读取 94 份归档 XML，核对哈希与本次 receipt：core 254、extension 445，均实际执行，0 failures/errors/skipped。
  退役旧测试 2 项、新增有效 V2 应用回归 2 项；保留 Hook 和既有断言经实际差异检查确认。
- 三组资源场景/冻结旧包对照及真实组合产物复核；原始 APK 签名再验退出 0，输入哈希与 104 默认根选择一致。
  两份合成 APK 仅 classes13.dex、res/OAv.xml 改变，18389 条目相同；新网络配置与原始输入字节一致。
- 独立读 DEX 类/类型/方法表确认退役，合成包 16 DEX/64563 类无重复；真实候选/compiled 边界复查通过，
  严格 release 模式拒绝 local 包。候选仍为 `f7839db2ff51c62e5410f817b49e9075076ac9e38aaac706925d64c12bf392b9`。
- 下一卡 `docs/maintenance/tasks/M3a.md` v1 已准备、未开始：当前状态职责、异步失效边界与事件顺序回归。
  先说明真实双记录/多代际关系、对应已有断言并补实质缺口，本卡不改生产实现、版本/build ID 或验证工具。
- M2 其他非紧急清理后续按证据安排，不为了阶段完整继续批量删除。远端 CI、其他版本/选择集、设备、
  真实付费服务与正式发布保持未验证；资源 harness 仍为需显式调用的可选集成验证。

## 53. 2026-10-24 M3a v1 当前职责与事件顺序回归（已完成待复核）

- 执行已完成待复核，统筹保持待复核；只执行 M3a，不进入 M4。结果
  `docs/maintenance/results/M3a-RESULT.md`；证据 `validation/runs/20261024-M3a-01/`。
- 新增 `docs/architecture/CAPTION-STATE-CONTRACT.md`，说明双 AI 记录的实际读取/回填、原生选轨/CC、
  player owner、ready generation、翻译 Session/generation、publication 与物理排空的不同职责；
  16 行事件矩阵对应 32 组实际源码断言及本轮完整入口 XML，现状、待确认与建议分开。
- 先核对既有 N69–N75/M2a 断言，只补 8 项：held ready 的 teardown/owner、合并期间语言更新、
  真实应用端口的 held source/切视频、双 AI 记录兼容，以及 core publication/retirement/cache 提交 3 项。
  旧测试方法/断言保留；新增不使用 Thread.sleep。原有测试的轮询 helper 保留原样，不把隔离合同冒称端到端。
- 最终完整入口 `20261024-M3a-candidate-01`：core **257** + extension **450** = **707**，两组 Test 本轮实际执行，
  failures/errors/skipped 均 0；14 发布合同、15 验证工具合同、232×14 本地化、81 compiled core 及 UI/包边界通过。
  输入指纹 `f71167b12aa01ae0cb9cea479c67b0cb80bef6ed1ceafb003f681ff6289453c3`，构建前后相同。
- 新工程候选 `build/maintenance/M1a/20261024-M3a-candidate-01/patches-1.5.8.mpp`，584881 B，SHA-256
  `fb04a85d0a1e55b386fce7152a60de4f619c9e2b560671eb08770a01a5b0303a`；仍为 **1.5.8 / local-1.5.8-m2a**。
  74 包条目中 73 个内容字节一致，唯一内容差异是 manifest Timestamp；ZIP 条目时间字段也已逐项记录。
  生产 DEX/MPE、Kotlin 补丁、资源及独立/内嵌 MPE 保持冻结 M2a 字节。R8/syncExtension 为 Gradle 有效复用。
- 全部生产/资源/Gradle/CI/发布工具/配置/协议/版本/build ID 保持入场字节，旧交付未覆盖；
  入场快照、逐文件差异、历史候选哈希及带退出哈希保护的回退脚本均在本批证据目录。
- 首次 owner 测试的 Activity.setup 推进队列问题及顺序检查 runner 的进程退出问题保留原日志，均已限定修正于
  测试夹具/证据 harness，没有修改生产、删断言或忽略测试。未发现有效生产缺陷。
- 本轮无真实 APK 重组合、设备安装或付费模型；M2a 一组真实组合的来源和适用限制在结果中明确引用。
  未运行远端 CI、其他组合/供应商或正式发布；公开版仍为 1.5.7，未 commit/tag/推送。

## 54. 2026-10-24 M3a 统筹接受与 M4a 下发

- 统筹接受 M3a v1 本卡交付，执行结果原文保留。复核 `docs/maintenance/reviews/M3a-REVIEW.md`，
  独立证据 `validation/runs/20261024-M3a-coordinator-review/`；本统筹轮未改产品、测试或工具实现。
- 重新核对 2171 个范围外入场文件、4801 个历史交付/候选文件；90 个原 @Test 方法体与入场 ZIP 相同。
  输入指纹仍 `f71167b12aa01ae0cb9cea479c67b0cb80bef6ed1ceafb003f681ff6289453c3`。
- 95 份归档 XML/哈希/本次 receipt 独立核对：core 257 + extension 450 = 707，均实际执行且 0 failures/errors/skipped。
  16 行矩阵的 32 组方法体哈希、断言与有效 XML 一一对应；正反顺序共16次新增用例记录一致。
- 统筹针对性复查 core3 项实际执行通过，extension5 项由本次 Gradle FROM-CACHE 确认有效复用，
  未把复用冒称新执行。候选/compiled 边界复查通过，release 模式拒绝 local。
- M3a 候选哈希 `fb04a85d0a1e55b386fce7152a60de4f619c9e2b560671eb08770a01a5b0303a`；
  与冻结 M2a 的74条目中73相同，仅 manifest Timestamp 不同，ZIP日期字段相同，产品仍为 local-1.5.8-m2a。
- 当前职责合同保留真实双记录、多代际/Publication边界及未确认线程/共享源交错限制；不是全局线程安全认证。
- 下一卡 `docs/maintenance/tasks/M4a.md` v1 已准备、未执行：只从 Overlay 提取字形大小帧时间过渡的纯数值状态，
  保留 Android帧调度/去重、180ms/2%与既有视觉规则；需旧行为对照、组件/Overlay验证和一组真实组合。
  其他Overlay/Controller重构、M5–M7尚未下发；未安装、发布或调用真实模型。


## 55. 2026-10-24 M4a v1 字形帧时间数值状态提取（已完成待复核）

- 执行完成，统筹待复核；仅本卡。结果 `docs/maintenance/results/M4a-RESULT.md`；证据 `validation/runs/20261024-M4a-01/`。
- CaptionGlyphTransition 独占 displayed/from/to/start/pending，Overlay 薄委托并保留 Android callback、去重与真实绘制；180ms/两种 2%/首帧/重复目标/重定向/reset/settle 原样保持。
- 提取前实际入场 Overlay 冻结 12 组/97 步；数值 bits、返回和实际 callback 排队逐步一致，新普通 JUnit 及真实视图 GLYPH_FRAME 用例通过。原 707 项保留，新增 6 项。
- 最终完整入口 run `20261024-M4a-candidate-02`：core 257 + extension 456 = 713，均本轮实际执行，failures/errors/skipped=0；工具15/发布14/本地化232×14/81 compiled core/来源/UI/包边界通过。
- 源码输入指纹 `504c27d112a55b15555ae34f5b827ba524f50f3dd05cc913f9b7f51439718afc`，构建前后相同。Version 1.5.8 / local-1.5.8-m4a，公开仍 1.5.7。
- 新候选 `build/maintenance/M1a/20261024-M4a-candidate-02/patches-1.5.8.mpp`，585114 B，SHA-256 `378213982117303065a340df446bea7c3fa4213db4b5a1098291137c6c41db97`；内嵌/独立 MPE 相同。MPP 除 manifest/扩展 MPE 外原字节相同。
- 同 M2a 原始21.41.525-SECONDARY/官方1.48.0/Patcher2.0.0/104默认根+AI完成真实组合及现有DEX审计：16 DEX/64564类，无重复/测试泄漏/回环回流；对冻结M2a组合仅classes13.dex变化，其余18390条目同字节。
- 入场源码/旧测试/工具/资源/公开元数据和5881历史交付候选受保护；状态镜像相同。新增视图夹具和shadow隔离的失败日志保留，修正仅测试侧，最终独占run通过。
- 未覆盖远端CI、其他组合矩阵、设备/性能与真实模型；未提交/tag/推送/发布、签名安装或清数据。逐文件退出哈希保护回退脚本及原件已保存；不进入其他Overlay/Controller任务。

## 56. 2026-10-24 M4a 统筹接受与 M5a 下发

- 统筹接受M4a v1本卡交付。原执行结果/证据保留，复核 `docs/maintenance/reviews/M4a-REVIEW.md`，
  独立证据 `validation/runs/20261024-M4a-coordinator-review/`；本统筹轮未改产品、测试或验证工具实现。
- 独立检查入场Overlay、新组件及薄委托；从入场原件提取实际数值方法，在无Android classpath的Java探针中
  与新组件、冻结fixture重放12组97步，bits/返回/帧队列状态一致；六项组件/真实Overlay/视图新测试实际执行通过。
- 重新核对2176范围外入场文件、5881历史交付/候选和六个显式入场忽略前端哈希；源输入指纹仍
  `504c27d112a55b15555ae34f5b827ba524f50f3dd05cc913f9b7f51439718afc`。
- 97份归档XML、哈希和本次receipt独立核对：257+456=713，均实际执行且0 failures/errors/skipped。
  候选、release拒绝、compiled/UI/包边界复查通过；未无理由重跑全部713或真实组合。
- 候选仍 `378213982117303065a340df446bea7c3fa4213db4b5a1098291137c6c41db97`；冻结M3a与新MPP
  仅manifest/MPE不同，补丁根DEX/资源相同。组合输入哈希/104默认根一致，实际APK仅classes13.dex变化，
  18390其他条目相同，16 DEX/64564类无重复，新组件一个，旧回环不回流。
- 下一卡 `docs/maintenance/tasks/M5a.md` v1已准备、未执行：网络失败/重试/取消/配置隔离合同与离线故障验证。
  只文档与必要测试，保留当前m4a生产/身份/工具/策略，所有测试连接必须受控，不能触发真实YouTube/模型回退。
- 暂不继续拆分其他UI/Controller，按具体收益另卡。M5生产策略、M6–M7未下发；设备、其他矩阵、远端CI、
  真实服务和发布继续保持各自未验证，公开版仍1.5.7。


## 57. 2026-10-24 M5a v1 网络失败合同与离线故障验证（已完成待复核）

- 执行完成，统筹待复核；仅M5a。结果 `docs/maintenance/results/M5a-RESULT.md`，合同 `docs/architecture/NETWORK-FAILURE-CONTRACT.md`；证据 `validation/runs/20261024-M5a-01/`。
- 先审阅已有覆盖，再补12 core + 3 extension测试；六层失败/逻辑调用/实际HTTP/协商/修复/源回退分开记数。源鉴权连Cookie路径均显式路由本地fixture，未映射立即拒绝；无真实YouTube/模型连接。
- 正反顺序30次通过；最终完整入口core269 + extension459 = 728，均实际执行，failures/errors/skipped=0；来源、81 compiled core/UI/包边界、本地化232×14、发布14/工具15合同通过。输入指纹 `e90908b4a4f96cf57c8e7e8d00fa86662f643fc67d928e993024c4789c51300f`，前后相同。
- 新工程候选 `build/maintenance/M1a/20261024-M5a-candidate-01/patches-1.5.8.mpp`，585114 B，SHA-256 `939ccdbcc3e532cbb45a37cff2726a4d9dfcadef94557e43e355d8d3b407a7f8`。仍1.5.8 / local-1.5.8-m4a，公开1.5.7。对冻结M4a仅manifest构建Timestamp内容不同，生产DEX/MPE和资源原字节相同。
- 发现模型Retry-After日期丢失/120秒截断；page/hole不经过普通等待门；只换凭据时磁盘语义key共享；sent旧任务retire后可继续旧key协商POST；HTTP_CONFIG诊断较粗。事实/风险/未动态覆盖分别记录，交统筹决定，不改费用/生产策略。
- 保护入场2191文件原件、2186范围外文件、7764历史交付/候选、六个忽略前端及全部旧测试；索引/分支/HEAD不变，状态镜像同字节。哈希保护回退仅本批，不硬重置/clean/清数据。
- 未重做真实APK组合/资源harness/设备/真实付费API；M4a组合只作同生产字节来源引用，不冒称本轮执行。真实超时全链路、并发协商/全部子修复交错、结构调度穷举、远端CI/其他组合保持未覆盖。未commit/tag/推送/发布/安装；未进入下一卡。

## 58. 2026-10-24 M5a调查统筹接受与M5b修复卡下发

- 接受M5a调查/合同/离线故障验证交付，生产问题未修。复核 `docs/maintenance/reviews/M5a-REVIEW.md`；
  独立证据 `validation/runs/20261024-M5a-coordinator-review/`，原结果/矩阵保留不改。
- 独立核对2186范围外文件、7764历史交付/候选、110旧测试文件及六前端哈希；当前指纹仍
  `e90908b4a4f96cf57c8e7e8d00fa86662f643fc67d928e993024c4789c51300f`。99份XML/哈希/receipt确认269+459=728实际执行通过。
- 28行矩阵源码/断言文件/最终XML、30次顺序日志核对；统筹实际重跑12+3新增测试，全部通过，
  复现37次fixture HTTP（provider28、源/Cookie9）及F1/F4等观察。没有真实模型/YouTube调用。
- 候选复查、release拒绝、compiled/UI/包边界通过；74条目对冻结M4a仅manifest Timestamp不同，
  产品仍m4a，MPP `939ccdbcc3e532cbb45a37cff2726a4d9dfcadef94557e43e355d8d3b407a7f8`。
- F1确认缺陷：provider日期Retry-After丢0、300秒截成120秒；下一 `docs/maintenance/tasks/M5b.md` v1已下发未执行，
  仅修解析及直接等待时间的溢出保护，需红绿、core来源适配、完整验证/一组真实组合。
- F2 page/hole等待/终止门风险由源码确认，尚无额外费用端到端复现；F4退休后追加协商POST已本地复现，
  二者在F1后优先独立闭环。普通等待修复不能声称所有外发路径都已遵守等待。
- F3当前保留同语义缓存复用，不新增profile/key磁盘namespace；换key同key动态证明，profile缺席由源码确认，
  不夸大为已证明安全漏洞。请求凭据/配置快照仍必须隔离。F5诊断粒度后续兼容改进，非当前终态开关。
- 本统筹轮只复核、针对性测试和文档更新，未修改生产/测试/工具；状态镜像相同，未安装/发布/真实计费验证。


## 59. 2026-10-24 M5b v1 Retry-After与直接等待时间运算修正（已完成待复核）

- 仅M5b，执行完成待统筹复核；结果 `docs/maintenance/results/M5b-RESULT.md`，证据 `validation/runs/20261024-M5b-01/`。未自行接受或进入下一卡。
- 复用原分支/HEAD和工作树，保存2197个入场Git可见文件、六忽略前端原件/哈希及8848个历史交付/候选清单，按入场字节比较。旧修改保留。
- 未改生产时红测2项均失败：300秒实得120000ms，未来GMT日期实得0ms。修复后同断言通过；新增9项固定now解析/算术、真实HTTP/普通schedule等待与恢复、实际source门及溢出回归。
- 模型send复用共享RetryAfter；有效大秒值饱和至Long.MAX_VALUE，retryAt/providerRetry/sourceRetry安全相加，保留max/backoff及既有较晚provider门。M5a仅F1旧刻画更新，其他11项方法及其余旧测试保留。来源只适配两个core目的文件及说明/派生patch，上游/ABI/协议提示词不变。
- 既有完整入口 `20261024-M5b-candidate-01` 通过：core278+extension459=737，失败/错误/跳过0，两组本轮实际执行；工具15、发布14、本地化232×14、81 compiled core、来源/UI/包/凭据通过。源码指纹 `ba028a4d4f50d535482f0fb0b5375d5fe1fc1309def4fd81109c855c0d7cbdc7`，构建前后相同。
- 300秒普通门在elapsed300099保持1 HTTP、300100恢复为2 HTTP并接纳Plan；日期门299209保持1、299210恢复为2。超大wait保守饱和，source load计数保持1无忙循环；M5a/M5b24项故障用例合计60 fixture HTTP（新增9项23），不含其他测试HTTP。
- 新候选 `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M5b-candidate-01\patches-1.5.8.mpp`，585156B，SHA-256 `ef74553a70071010db948063f13c3a6c951dd00f6c347d500ad62c4c4f94465e`；MPE `6605630528516f973d9ea4a97dd73bdea42029077dc8a8bb6e99e3756ac32274`，内嵌/独立相同。产品1.5.8 / local-1.5.8-m5b，公开仍1.5.7。
- 真实21.41.525-SECONDARY/官方1.48.0/Patcher2.0.0/104默认根+AI组合和现有DEX审计通过；APK `63a8b4b29e9029a88c24f41b4cde4183f7e42fa8a76a95b13c277e8e7c8b72b7`，16DEX/64564类，无重复/测试泄漏。对冻结M4a只classes13.dex变化，其余18390条目原字节相同；Hook签名/设置资源不变。
- 当前网络合同区分m4a历史F1和m5b修正。F2 page/hole、F4退休追加POST仍未闭环；F3语义缓存、F5诊断保持。远端CI、其他组合、设备/系统时钟跳变设备实测、真实供应商/收费和全部历史日期格式未认证。
- 不commit/tag/推送/发布/安装/清数据/调用付费模型；本轮回退按入场文件与退出哈希检查执行，保留证据/候选和之后修改。统筹待复核，本卡后停止。

## 60. 2026-10-24 M5b统筹接受与M5c下发

- 接受M5b本卡交付，F1在provider解析/普通与直接等待门范围关闭；不是所有外发路径准入认证。
  复核 `docs/maintenance/reviews/M5b-REVIEW.md`，独立证据 `validation/runs/20261024-M5b-coordinator-review/`。
- 独立核对红测2失败及红绿同方法体、2186范围外文件、8848历史交付候选、六前端、M5a其余11项方法体；
  生产变化限共享解析器、send接入与三个门安全相加。来源仅2个core目的哈希/说明变化，snapshot/ABI/协议不变，check通过。
- 100份归档XML/哈希/receipt确认278+459=737实际执行通过，指纹仍
  `ba028a4d4f50d535482f0fb0b5375d5fe1fc1309def4fd81109c855c0d7cbdc7`。统筹实际重跑21 core+3 extension故障用例，均通过，60 fixture HTTP中新增9项23次。
- 重现真实Failure→rejected→schedule→POST→Plan接纳：门前1ms不发，到期恢复；provider/block/source大等待不溢出。
  候选和release拒绝复查通过；旧候选编译中间目录被后续Gradle切换回收，使用同指纹本次receipt的真实编译归档复查边界，不冒称旧中间物仍在。
- 候选仍 `ef74553a70071010db948063f13c3a6c951dd00f6c347d500ad62c4c4f94465e`。真实组合输入/104默认根核对，
  实际APK只classes13.dex变化，18390其他条目相同；原任务组合/DEX退出有效，未无理由重做组合/737项。
- 下一 `docs/maintenance/tasks/M5c.md` v1已准备未执行：关闭已复现F4，分离新模型HTTP尝试准入与旧已发送读取，
  保留finishSent、Publication、正常2/3次协商回退，需红绿/实际POST与来源/完整验证/组合。F2随后独立处理。
- F2/page/hole、F3语义缓存与F5诊断保持；公开仍1.5.7，本地仍m5b。统筹只复核与文档交接，未改产品/测试/工具，
  状态镜像相同，没有安装、发布或真实供应商/费用验证。


## 61. 2026-10-25 M5c v1 新模型HTTP尝试准入与旧传输读取分离（已完成待复核）

- 仅M5c，执行完成，统筹待复核；结果 `docs/maintenance/results/M5c-RESULT.md`，独占证据 `validation/runs/20261025-M5c-01/`。复用分支/HEAD及既有工作树，不自行接受或进入F2。
- RequestControl增加兼容默认tryBeginAttempt；真实Job要求!cancelled && current。每轮RebuildApi在beginAttempt/send前检查，参数协商、HTTP stream拒绝及流内error回退都回到此点。Publication.isOpen与revoke排序；不持生命周期锁做网络/等待。sent/isCancelled/finishSent、Publication/缓存及STOPPED原语义不变。
- 红测3/3失败各2旧POST→绿测各1旧POST+1当前新会话成功；首bodySent/扣响应/退休/释放及旧新key/model有实际请求和XML。旧成功可完成且无新publication；排队旧Job0 attempt/0 HTTP；合法准入后STOPPED保留1 attempt/0 HTTP。正常Job协商2/3次及stream error两次均成功。
- 最终针对性45项、独立重复9项通过；固定源码/来源后已接受完整入口core287+extension459=746，失败/错误/跳过0，两组实际执行。指纹 `b11e5bd4a9c38e015ac34aca58db516f5ecc6c61fc4ddbec8ea4d66badc89e82`，前后相同。来源/提示词/协议/Hook ABI、81 compiled core/UI/MPP/MPE/14 locale/凭据通过。
- 候选 `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5c-candidate-01\patches-1.5.8.mpp`，585282B，SHA-256 `b5ddc4eb94abbebce8a82406eef7db156ce947eac5877a7dc9ba7b700cbd677a`；MPE `461d4f33b09a90ee6f6001f6989c3d998e311e2a23b3262278c07f00dcdd45ec`，内嵌/独立同字节。版本1.5.8 / local-1.5.8-m5c，公开仍1.5.7。
- 同一原始21.41.525-SECONDARY/官方1.48.0/Patcher2.0.0/104默认根+AI实际组合和DEX审计通过；APK SHA-256 `ecf09deab6381f949ea3e5e4a350a7c5fe5fa53e23ee16771533be6ea38b7a13`，与冻结M5b仅classes13.dex不同，其余18390条目相同。未签名安装或做设备/收费认证。
- 进入2201个Git可见文件原件、六个忽略前端、10287个历史候选/交付哈希保留，按入场字节生成批次diff。core编译结果在完整入口结束后、下一Gradle前立即归档，绑定同次receipt/指纹，不依赖后续可能回收的中间目录。状态/镜像同字节；安全回退按本批退出哈希核对后恢复入场原件，不reset/clean。
- F2 page/hole等待/过滤门仍未闭环；F1、F3语义缓存、F5诊断保持。M5a/M5b历史观察/证据保留。远端CI、其他组合、设备、真实供应商/收费及任意并发交错未验证；准入后的重叠退休/取消不承诺物理零字节或退款。建议统筹先复核本卡，再决定下一卡，尚未执行。

## 62. 2026-10-25 M5c统筹接受与M5d下发

- 接受M5c本卡交付，F4在退休后新模型HTTP尝试准入范围关闭；读取/finishSent、STOPPED、Publication和缓存作用域不变。复核 `docs/maintenance/reviews/M5c-REVIEW.md`，独立证据 `validation/runs/20261025-M5c-coordinator-review/`；原执行结果/证据保留。
- 核对入场原件与实际最小core改动、红3失败/绿断言、三条回退共用准入点、其余11网络合同方法和来源固定项。2189范围外文件、10287历史交付/候选、六个忽略前端、索引/分支/HEAD及主要证据索引哈希相符。
- 独立重跑45项相关测试全部通过；新增九项再次观察16 batch/19 attempts/18 fixture HTTP。三条退休旧调用各仅1 POST，新会话各再成功1 POST；正常2/3次协商保留。旧成功usage保留、无新publication，排队旧Job0 attempt/0 HTTP，合法准入后STOPPED保留1 attempt/0 HTTP。
- 101份归档XML/哈希/receipt确认287+459=746均实际执行且失败/错误/跳过0；当前源码指纹仍 `b11e5bd4a9c38e015ac34aca58db516f5ecc6c61fc4ddbec8ea4d66badc89e82`。同次完整编译归档绑定receipt并复查81 compiled core/UI/包边界通过；不依赖可能回收的旧中间目录。
- 重新执行来源check、候选与release拒绝；MPP仍 `b5ddc4eb94abbebce8a82406eef7db156ce947eac5877a7dc9ba7b700cbd677a`，独立/内嵌MPE一致。实际组合输入/104默认根及日志核对，APK只classes13.dex变化，18390其他条目相同，64564唯一类无测试/回环泄漏；未无理由重复746项或组合。
- 下一 `docs/maintenance/tasks/M5d.md` v1已下发未执行：F2 page/hole与普通新逻辑调用尊重已建立等待/过滤/终止门，子修复失败建立相同作用域规则；保留有效Plan、次数/去重与原到期恢复资格，需红绿/真实HTTP/完整验证/组合。不得借机增加重试、全局预算或改源回退。
- 本地仍1.5.8 / local-1.5.8-m5c，公开1.5.7；F3语义缓存、F5诊断保持。准入后重叠操作、设备、远端CI、其他组合、真实服务/费用及任意并发交错未认证。本统筹轮只复核/针对性测试/文档交接，未改生产/测试/工具，状态镜像同字节，无commit/tag/推送/发布/安装/真实付费调用。


## 63. 2026-10-25 M5d v1 子范围遵守等待、过滤与终止资格（完成待复核）

- 仅执行M5d/F2，统筹状态待复核；结果 `docs/maintenance/results/M5d-RESULT.md`，证据 `validation/runs/20261025-M5d-01/`。复用入场分支/HEAD及既有工作树，未commit/tag/推送/PR/发布/签名安装/清数据，未进入下一阶段。
- 生产仅RebuildController：同Session/父块logical gate覆盖普通/page/hole的入口与执行前；filter集合独立于READY并跨seek保留；共用子失败原因决策不清别人Job；未准入预约返还、未花hole经既有kick恢复。已有有效Plan、实际显示文字、generation/publication、F1安全加法和F4物理attempt生命周期保持。
- m5c生产未改时应有断言红2失败，各2 batch/2 attempt/2 POST；修复后同两方法各1 POST。最终针对性78项及新增24项独立重复通过；新增各47 batch/46 attempts/46 fixture HTTP，含合法逻辑准入后首attempt前取消的1/0/0对照。未映射源/模型拒绝，无真实服务或新增sleep。
- 固定源码/测试/来源后完整入口Offline+RerunTests：core311、extension459，共770，失败/错误/跳过0，两组实际执行。源码指纹 `a07e9693da61061498531983879db27a1b8920f1cd56d8104583ef54180fc135`，前后相同；同次compiled classes在下一Gradle前归档并复查边界；来源、协议/提示词、Hook ABI、本地化/凭据与候选负向身份拒绝通过。
- 候选 `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5d-candidate-01\patches-1.5.8.mpp`，SHA-256 `127e01ee5d7d33c510600a069092e01126a3a43b38d5d85e684b28915ba59e24`；内嵌/独立MPE `ac122db112139bcde5b5fa785ff02933468578a9a4402b806ddef41a5942a89a`同字节。身份1.5.8 / local-1.5.8-m5d，公开仍1.5.7。
- 同一原始21.41.525-SECONDARY、官方1.48.0、Patcher2.0.0、104默认根+AI真实组合/资源重编译和DEX审计通过。APK `02ee10a81c8157cbd72d1af7fb91202a9084807772472072c40542b126571fef`，对冻结m5c仅classes13.dex变更，其余18390条目同字节；无测试/回环类泄漏，Hook/其他资源保护保持。
- 入场原件、范围外源码/测试、六个忽略前端、历史交付和候选按哈希保护，批次差异对入场而非HEAD；镜像逐字节相同。回退仅在每个文件仍匹配本轮退出哈希后逐文件恢复入场字节，拒绝覆盖后续修改，保留结果/证据/新旧候选，不reset/clean。
- 未验证远端CI、其他组合、设备、真实供应商/收费、所有分类乘积和任意并发；合法准入后的重叠操作不承诺物理零字节或退款。F3语义缓存与F5诊断格式未改。停止并交统筹复核，不自行接受或进入下一阶段。

## 64. 2026-10-25 M5d统筹复核需补正与M5d-R1下发

- F2完整闭环暂不接受；复核 `docs/maintenance/reviews/M5d-REVIEW.md`，独立证据 `validation/runs/20261025-M5d-coordinator-review/`。原M5d结果/770项/候选/组合和封存证据保留，不重写历史为包含新探针。
- 独立顺序重跑原78项通过，新增24项再次47 batch/46 attempt/46 fixture HTTP。102份原XML/哈希/receipt确认311+459=770实际执行且失败/错误/跳过0，来源/候选/编译归档与组合按audit核对。源码指纹仍 `a07e9693da61061498531983879db27a1b8920f1cd56d8104583ef54180fc135`，生产/原有测试/工具未改。
- 新增review-only实际HTTP探针1项失败：普通已发HTTP408扣响应→hole 408/Retry-After=300建立retryAt=300100且providerRetry=0→普通无header的408晚到把retryAt改为1300→elapsed=1300触发page，收到第3个POST。精确轨迹和receipt/XML在blocking-finding.json、probe-02-xml/；没有真实供应商/费用结论。
- 根因是只有repairRejected保留既有较晚父块门，普通applyFailure直接覆盖；原24项验证晚到短子失败，遗漏反向普通晚到失败。旧调用允许收尾不授权它缩短后续新调用必须遵守的等待。
- 下一 `docs/maintenance/tasks/M5d-R1.md` 补正01已下发未执行：统一保留已建立的较晚父块等待、检查相关写点，保护过滤/有效内容/原额度及F1/F4，需红绿/门前与到期恢复/完整入口/新组合。允许有依据强化两项直接冲突的旧deadline期望，保留provider与backoff有效断言。补正结果另写M5d-R1-RESULT，原报告保持原字节。
- 复核首次误使两个Gradle调用重叠，中断和EOF初始化/执行记录保留，不计有效通过；随后独占build root顺序运行targeted-02成功并先归档，再运行probe-02实际断言失败。正式结论只用有效顺序执行；无生产修复在统筹对话实施。
- 本地仍m5d且带该已知缺口，公开1.5.7，M5c历史接受不变；F3缓存/F5诊断与M6/其他阶段不混入。镜像同字节，不commit/tag/推送/发布/安装/清数据或真实付费调用。

## 65. 2026-10-25 M5d-R1补正01：保留同Session/父块已建立的较晚等待（完成待复核）

- 原M5d/任务卡v1补正，不进入下一维护阶段；[结果](maintenance/results/M5d-R1-RESULT.md)，独占证据 `validation/runs/20261025-M5d-R1-01/`。执行完成，统筹保持待复核，未自行接受F2完整闭环。原M5d-RESULT、770项、旧候选、封存与统筹探针保持原件。
- 生产仅Controller：所有运行时retryAt写入共用deferRetry/max+RetryAfter.after；普通/子失败一致，取消/slot和语义review收尾不能缩短既有门。provider仍取max，过滤/terminal、有效Plan/显示、原额度/去重、Publication/F1/F4与源模式保持。来源仅Controller目的哈希/适配说明/派生patch更新。
- 未改m5d生产时正式主回归1项失败，期望2 POST实为3；相同方法体修复后1200ms及门前1ms仍2，到期成功为第3个POST。新增7项覆盖反顺序、饱和/provider、真实seek取消未sent返还、成功review、pendingFocus真实释放及成功hole收尾；原24项方法体未改。两项获准旧deadline由15秒强化为原17秒/300秒，独立新Session精确验证15秒本地backoff。
- 固定源码/测试/来源后Offline+RerunTests完整入口core318+extension459=777，失败/错误/跳过0；指纹 `ee5133445a0074f8acdbe0d3c594a7b183bbffa84b2f7fd1c54aef7a27a2de2c`，同次compiled立即归档并复查边界。针对性85项有一次既有显示hole等待超时，原件保留；同源码31+7项复查及本次完整入口通过，未修改该测试。
- 候选 `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5d-R1-candidate-01\patches-1.5.8.mpp`，SHA-256 `ca8e4ddf27156312d8b07aabd6677f83dc7bd7c8d6f3772d2eb1e864b414f477`；独立/内嵌MPE `0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e` 同字节。产品1.5.8 / local-1.5.8-m5d-r1，公开仍1.5.7。
- 同一原始21.41.525-SECONDARY/官方1.48.0/Patcher2.0.0/104默认根+AI实际组合与现有DEX审计通过；APK `71b77e0a6758f0417a135ee3f8c2ea24e4a1814f6f844f30f6483cdbc329c34c`，对冻结m5d仅classes13.dex不同，其他18390条目同字节；Hook/资源/无测试泄漏保持，未签名安装。
- 入场原件以完整工作树保存，非HEAD；按本轮实际范围复查历史根记录/相关XML与compiled/旧新候选，未再次枚举所有解码中间物。逐文件退出哈希保护回退，不覆盖后续修改，报告/证据/新旧候选保留；当前状态与镜像同字节。
- 未覆盖远端CI、其他组合、设备、真实供应商/付费/退款、全部状态乘积和任意宿主线程交错。一次夹具开发红测停在drain而非应有断言，已保留并重做有效红测；未以该失败计有效红。无commit/tag/推送/PR/发布/安装/清数据/共享缓存清理，不进入其他任务或阶段。

## 66. 2026-10-25 M5d-R1统筹接受与M5e下发

- 接受M5d-R1补正，原M5d/F2在任务卡及补正规定范围关闭；复核 `docs/maintenance/reviews/M5d-R1-REVIEW.md`，独立证据 `validation/runs/20261025-M5d-R1-coordinator-review/`。原需补正复核/770项/原失败候选保持历史原义，当前不扩大为全局费用/设备认证。
- 独立检查全部运行时retryAt写点归一到deferRetry/max+safe-add，普通/子失败、真实seek取消/slot和成功review收尾保留父块较晚门。原24项方法体保持，两项授权旧期望强化且独立Session精确backoff/provider保护仍在；来源仅Controller目的项/适配说明/派生patch变化，其他固定来源和字面量/ABI守卫保持。
- 顺序重跑85项全部通过，新增7项再次19 batch/18 attempt/18 fixture HTTP；原24+7共66/64/64。先归档85项XML，再重跑上轮未修改统筹探针，本次1项通过，原m5d失败证据哈希不变。
- 102份完整XML/哈希/receipt确认318+459=777均实际执行且失败/错误/跳过0，源指纹仍 `ee5133445a0074f8acdbe0d3c594a7b183bbffa84b2f7fd1c54aef7a27a2de2c`。独立来源check、候选/release拒绝、同次81 compiled core归档/UI/包边界通过。未无理由重跑全部777项或重复组合。
- MPP仍 `ca8e4ddf27156312d8b07aabd6677f83dc7bd7c8d6f3772d2eb1e864b414f477`，内嵌/独立MPE同字节；指定组合输入/选择核对，实际APK对m5d仅classes13.dex变更，18390其他条目相同，16 DEX/64565唯一类无测试/回环泄漏。2197范围外文件、有限1284历史/冻结清单、六前端及封存交付哈希保持；索引/分支/HEAD不变。
- 既有ContinuousDisplayTest.aHoleSubRequestFillsTheMissingHalf一次超时原件保留，随后38项/777项及本轮85项通过仍不构成根因已定。下一 `docs/maintenance/tasks/M5e.md` v1只定位实际时序/测试隔离并稳定回归，冻结生产和m5d-r1身份；保留有效显示与旧generation拒绝，不增加timeout/自动重试。若查出生产缺陷，留证交统筹单独下卡。
- 配置/存储故障合同、F5诊断及M6/M7其他工作仍待后续；F3语义缓存保持。状态镜像同字节，本统筹轮未改生产/测试/工具实现，不commit/tag/推送/发布/安装/清数据/真实付费调用。M5e只下发未执行。


## 67. 2026-10-25 M5e v1：hole显示时序与测试隔离（完成待复核）

- [结果](maintenance/results/M5e-RESULT.md)，独占证据 `validation/runs/20261025-M5e-01/`。复用原分支/HEAD及工作树；仅改ContinuousDisplayTest、维护入口/路线、本状态与同字节镜像，新增本结果；统筹保持待复核，未进入下一任务。
- 入场原方法单项1项在原215行超时，组内7项通过；仅加观察后的原方法1项通过，记录hole先合并再seek。历史失败和本轮未观察的原单项失败均缺完整请求交错，仍不能确定原始根因。受控对照证明原夹具的两次位置跳转可触发seek，旧generation成功响应依法不合并；不能放松该保护来让正向通过。
- 正向用受控fixture HTTP/latch、事件队列、同步推进的elapsed/位置与主Looper，固定正常连续播放、部分Plan、缺口23–29响应/合并和有效RenderGuard/showEvent；保留前半句与缺失半句译文、原文echo不得显示，并加强原有效事件对象保留。新增held-hole显示断言负向和seek代际拒绝。没有新sleep、超10秒等待、整测重试或生产改动。
- 组内9项、相关87项通过；强制在扣响应时断言失败1项，确到应有注入点，@After释放/排空并恢复Host/Output/Audit/stream；按哈希恢复后最终单项通过。完整入口Offline+RerunTests：core320+extension459=779，失败/错误/跳过0，两组实际执行；输入指纹 `9ee92d496eea7a14f83db5c8b42272a225aaacd821d04a0d80b0f1ad887f7683`。同次compiled在后续Gradle前归档。
- 候选 `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5e-candidate-01\patches-1.5.8.mpp`，SHA-256 `e007601dd93da64925acb624bc66e3187746404b4389533b1ae2e78641288958`；独立/内嵌MPE `0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e`。生产源码/资源、来源记录、提示词/协议、Hook ABI、工具/依赖和build ID保持；MPP至多构建Timestamp变化，DEX/MPE/资源同字节。生产内容比对后仅引用M5d-R1那组真实组合及其限制，本轮未重做组合。
- 历史资产/原失败/原777项及统筹探针、六忽略前端、范围外源码与其他测试受入场哈希保护，状态镜像同字节；退出哈希保护逐文件恢复入场原件，保留报告/证据/候选。完整结果列出报告归档时点偏差及已保存的原报告对照，不伪称所有报告均在调用前新归档。
- 未认证任意线程交错、设备、远端CI、其他组合、真实服务/付费；未发现须本卡改生产的缺陷。历史根因未知与当前夹具改善分开交统筹判断。未commit/tag/推送/PR/发布/安装/清数据/清共享缓存/reset/clean；本轮到此停止。

## 68. 2026-10-25 M5e统筹接受与M5f下发

- 接受M5e“历史原始交错仍未知、指定顺序受控证明、当前夹具改善”的规定范围；复核 `docs/maintenance/reviews/M5e-REVIEW.md`，独立证据 `validation/runs/20261025-M5e-coordinator-review/`。历史失败/原件保留，不把可达解释升级为原根因定论。
- 独立阅读源/测试：正常连续播放同步推进elapsed/位置，实际hole合并与有效showEvent保留前半句/缺失半句/原文禁止断言；独立seek和held控制仍发现旧generation/缺显示，原其他六方法体保持，无新增sleep/扩大timeout/整测重试。失败注入确在指定应有点失败，清理和四端口恢复后固定源码哈希恢复。
- 本统筹轮顺序重跑87项全部通过；九个Continuous用例再次CLEANUP drained及Host/Output/Audit/stream恢复true，held/seek/旧正向断言失败三个控制标记存在。102份完整XML/哈希/receipt确认320+459=779实际执行，失败/错误/跳过0；源指纹仍 `9ee92d496eea7a14f83db5c8b42272a225aaacd821d04a0d80b0f1ad887f7683`。
- 候选 `e007601dd93da64925acb624bc66e3187746404b4389533b1ae2e78641288958`；74条目仅manifest Timestamp不同，其余73内容及独立/内嵌MPE与接受R1同字节。81 compiled类也与接受R1相同；来源/候选/release拒绝/UI/包边界复查通过。不重复779项或真实APK组合，只引用R1同生产内容那一组及其限制。
- 2208范围外文件、159个/src/main含资源生产文件、1842有限历史/冻结清单、六前端及封存索引/入场ZIP独立核对，分支/HEAD/索引不变。额外69份旧extension副本在full启动后保存但与受保护接受归档逐份同哈希，原报告未丢，新779项有自身XML/receipt；偏差接受并保留准确时点，不冒称调用前新取证。
- 下一 `docs/maintenance/tasks/M5f.md` v1已下发未执行：调查配置/凭据持久化损坏、Keystore/解密和保存/切换失败的实际行为/资料副作用，补必要离线测试并注明替身/硬件/落盘限制。生产/build ID冻结，发现缺陷留证交统筹另卡，不混入数据迁移/清除策略。
- 当前仍1.5.8 / local-1.5.8-m5d-r1，公开1.5.7；F3缓存/F5诊断及缓存故障/M6/M7其他工作待后续。镜像同字节，统筹未改生产/既有测试/验证工具，不commit/tag/推送/发布/安装/清数据/真实付费调用。


## 69. 2026-10-25 M5f v1：配置与凭据持久化故障合同（完成待复核）

- [结果](maintenance/results/M5f-RESULT.md)、[当前合同](architecture/CONFIG-CREDENTIAL-CONTRACT.md)，独占证据 `validation/runs/20261025-M5f-01/`。入场原件2215文件、旧报告203文件在首次Gradle前保存；按入场原件保护已有未提交/未跟踪/删除状态，非相对HEAD总diff。
- 只新增ConfigCredentialFailureTest 22项及合同/最小架构入口/维护摘要；既有140测试文件保持。JVM内存KeyStore替身、真实Conscrypt AES/GCM/真实读取与UI flush；无load/decrypt整体fake shadow。聚焦22及相关67项均通过；零外部HTTP，新测试无连接尝试；provider/代理/编辑器静态状态恢复。
- C1真实编辑先URL成功、后key拒绝仍部分改变旧profile；C2/C4代理多store/通知/保留提示差距；C3坏JSON/字段类型/active/endpoint行为；C5源码风险与未验证项分别列出。读取失败未自动删密文/取别人key；不宣称保护已全部满足，未改生产修复。
- 指定完整入口Offline+RerunTests：core320 + extension481 = 801，失败/错误/跳过0，两组实际执行，103份XML/receipt归档；输入指纹 `938bf5d457a8972da294334c5ab07939b38f20a4fb86481e30da2b79fcebcd41`。同次81 compiled类归档并与M5e相同；来源/compiled/UI/包/凭据扫描通过。
- 新MPP `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5f-candidate-01\patches-1.5.8.mpp`，SHA-256 `5ad37d9ffcdce377898f25f72d8af6badf8e9c4302e5512c661719a59bf132b8`；独立/内嵌MPE仍 `0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e`。74条目仅manifest Timestamp差异，73其余条目/DEX/MPE/资源同字节；生产同字节后仅引用M5d-R1指定历史组合及限制，本轮未重做组合。
- 159生产文件、2211范围外入场文件、2754有限历史保护项、六忽略前端及既有删除状态保持；分支/HEAD/index不变；状态镜像同字节。退出快照和逐文件哈希保护回退已提供，只读检查通过，保留结果/历史/候选。
- 真实磁盘落盘/进程重启/断电/硬件Keystore/设备/远端CI/其他组合/真实服务与任意线程交错未验证。两轮夹具开发失败保留且不计产品红测。统筹保持待复核，执行停止；未commit/tag/推送/PR/发布/安装/清数据/真实付费调用/清共享缓存/reset/clean，未进入其他任务。

## 70. 2026-10-25 M5f调查统筹接受、M5g下发及首轮收尾估算

- 接受M5f当前合同/离线调查，未修C1–C5；复核 `docs/maintenance/reviews/M5f-REVIEW.md`，独立证据 `validation/runs/20261025-M5f-coordinator-review/`。原结果/合同调查事实/封存证据保留，绿测不等于数据保护已全部满足。
- 独立运行八类67项通过；22项真实Conscrypt AES/GCM、真实配置/编辑与Keystore SPI/SharedPreferences代理层级核对，无整体load/decrypt fake。provider/proxy/editors清理22次恢复，零连接/发现断言成立。再次复现真实C1的URL已改、active/密文保留、notice=1/refresh=0；C2/C4代理范围、C3坏数据及C5源码风险各自限定。
- 103份完整XML/哈希/receipt确认320+481=801实际执行且失败/错误/跳过0；源指纹仍 `938bf5d457a8972da294334c5ab07939b38f20a4fb86481e30da2b79fcebcd41`。81 compiled与接受M5e同字节，来源/候选/release拒绝/compiled/UI/包边界复查通过。未无理由重跑801项或相同生产组合。
- MPP `5ad37d9ffcdce377898f25f72d8af6badf8e9c4302e5512c661719a59bf132b8`，74条目仅manifest Timestamp不同，其余73/独立内嵌MPE同字节；2211范围外、159生产、140旧测试、2754有限历史、六前端和203份旧报告/363证据索引相符。既有删除状态/分支/HEAD/索引保持。
- 下一 `docs/maintenance/tasks/M5g.md` v1只处理C1部分保存后的配置同步/失败草稿；沿用逐字段自动保存，成功字段生效，后续拒绝/抛出也同步已保存配置，active不变且草稿可重试，不跨store事务/回滚、不自动重绑/删key。需真实编辑/应用更新边界红绿、完整验证/组合，其他发现后续分级。
- 用户询问剩余工作量与最终效果，已新增 `docs/maintenance/COMPLETION-PLAN.md`：首轮估计还约8–12张实质卡（含M5g），补正/外部输入另算；配置凭据2–3、缓存1–2、诊断性能2–3、环境/手册/有限兼容3–4。明确首轮停止条件，不按行数/测试数无限重构，不保证模型质量或所有设备帧率提升，也不等于官方PR接受。
- 本地仍m5d-r1、公开1.5.7，状态镜像同字节，M5g仅下发未执行。统筹未改生产/既有测试/验证工具，不commit/tag/推送/发布/安装/清数据/真实付费调用。设备/硬件落盘/远端CI/其他组合/真实收费及任意线程交错保留未验范围。

## 71. 2026-10-25 M5g v1：部分保存后同步实际配置，保留失败草稿（完成待复核）

- 仅执行[M5g任务卡](maintenance/tasks/M5g.md)规定的C1；结果 `docs/maintenance/results/M5g-RESULT.md`，独占证据 `validation/runs/20261025-M5g-01/`。复用分支/HEAD及脏工作树，按入场原件而非HEAD比较，未commit/tag/推送/PR/发布/签名安装/清用户数据/真实付费调用/共享缓存清理/reset/clean。
- 生产改动限定为 `ApiProfiles.flush` 的成功字段记账与失败/抛出后的单次运行配置刷新，以及 `ProfileEditorPreference` 的本次flush变更标记；build ID为 `local-1.5.8-m5g`，产品1.5.8、公开1.5.7保持。逐字段自动保存、成功字段生效、切换失败active不变、失败草稿/error、origin/原密文/其他profile/global和迟到编辑保护保持；不实现跨store事务、全表单回滚或自动key重绑定。
- 未改生产代码先加入应有行为红测：真实URL先保存、key因受控Keystore拒绝，及先成功字段后Editor抛出，两条均在旧实现下失败于`refreshes=1`断言；修复后转绿。新增/更新配置边界共29项（含真实URL/key、真实AES/GCM与故障偏好快照、flushCurrent/flushExceptKey、返回false/抛出、全部拒绝/无改动、成功切换、独立自动保存、失败草稿恢复、origin/其他profile/迟到编辑）。
- `M5gRuntimeConfigurationBoundaryTest`未shadow `CaptionActions`，实际捕获`Action.CONFIGURATION`并在该边界读取新endpoint；部分flush后命令恰1次，active仍旧profile，运行读取为已保存URL。所有测试fixture仅本地偏好/受控Keystore/明确拒绝连接，未访问YouTube、模型发现或付费API；静态editor、Looper、provider、ProxySelector和Activity均清理。
- 完整入口：Offline + RerunTests，ExpectedVersion 1.5.8，ExpectedBuildId `local-1.5.8-m5g`；core **320** + extension **488** = **808**，失败/错误/跳过0，source fingerprint `179a05037e3fad027687f479857ff7d87ccb172e527b0186b41be021ebb9575f`，候选/独立MPE/UI、来源/包边界、release拒绝和凭据扫描均通过。候选MPP `build/maintenance/M1a/20261025-M5g-candidate-01/patches-1.5.8.mpp` SHA-256 `283b9f0b70c0e75cb6af5f729a5b942ec3173a8b7c2123963249729d068249ae`；独立/内嵌MPE `78a1d24629b309579d63a3f0e8149931808c1a6a3468f349e67a9f1f338ce2aa`；UI APK `34c0647a53f7188fdaebc79dd6090302f69717244ca30a8e85bc26ae9f249fbe`。
- 同输入真实组合已执行：原始YouTube 21.41.525-SECONDARY SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`，官方MPP1.48.0 SHA-256 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`，Patcher2.0.0 SHA-256 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`，选择为AI caption translator并包含官方默认根。资源重编译/组合退出0，输出未签名APK `validation/runs/20261025-M5g-01/composition-M5g/patched-unsigned.apk` SHA-256 `61982bea6b5d9768f53c5550575b1edffe0d63eb123b5a31c702a8e15a4f709c`；既有DEX审计退出0，`DEX_AUDIT_PASS classes=64565`。
- C1关闭范围不扩展为配置存储整体可靠性：C2多store、C3坏数据可读错误、C4代理after/drop提示/落盘、C5重建/后置回调风险仍保留待后续；真实磁盘/进程重启/断电/硬件Keystore/设备/远端CI/其他组合/真实服务未认证。统筹状态保持待复核，执行到此停止。


## 72. 2026-10-25 M5g统筹复核需补正01、M5g-R1下发

- 复核 `docs/maintenance/reviews/M5g-REVIEW.md`，独立证据 `validation/runs/20261025-M5g-coordinator-review/`；暂不接受C1闭环。原M5g卡/结果、808项及真实组合证据保留，当前本地m5g是带已知遗漏的候选，公开仍1.5.7；最后已接受生产内容仍m5d-r1（M5e/M5f同生产内容）。未自动回退/覆盖包。
- 实际源码只增加失败路径通知，成功flush仍压住字段刷新且不补发。统筹额外test source复现成功flushCurrent、成功flushExceptKey、真实clearCurrentKey确认取消三项应有断言失败：URL已保存、active/密文/草稿保持，refresh期望1实际0。probe-02的XML/receipt/log及源码保留；没有修改生产或既有测试。原边界测试使用测试CaptionPort回调读取endpoint，未执行真实应用/控制器撤权。
- 独立顺序重跑九类74项通过；104份完整XML/哈希/receipt确认320+488=808实际执行、失败/错误/跳过0。输入指纹仍179a05037e3fad027687f479857ff7d87ccb172e527b0186b41be021ebb9575f。M5f21个非冲突方法体原样，C1通知方法按原授权更新；工程输入仅两生产、两个测试及build ID变化。
- MPP283b9f0b70c0e75cb6af5f729a5b942ec3173a8b7c2123963249729d068249ae，独立/内嵌MPE78a1d24629b309579d63a3f0e8149931808c1a6a3468f349e67a9f1f338ce2aa，UI34c0647a53f7188fdaebc79dd6090302f69717244ca30a8e85bc26ae9f249fbe相符；来源/候选/release拒绝/UI/包边界复查通过。81当前core类在复核Gradle前复制并与M5f归档相同，这是复核入场副本，不是执行者同次归档。
- 指定APK/官方MPP/Patcher输入哈希、104默认根、组合/DEX审计核验；APK61982bea6b5d9768f53c5550575b1edffe0d63eb123b5a31c702a8e15a4f709c。与接受R1实际仅classes12.dex、classes13.dex改变，其他18389条目同字节，不套用此前单DEX结论。六忽略前端及2754有限历史项保持；分支/HEAD/索引保持。
- 原红测交付只有概述，缺原XML/log/source；原m5g-production.diff实际相对HEAD含既有变化；哈希表不足以恢复缺少原件的文档。统筹从已接受M5f ZIP恢复七个与入场哈希完全匹配的文件并生成真实批次diff，准确标为事后重建。补正须保存自己的入场原件/有效红绿/同次compiled/逐文件回退，不补造旧时点。
- 下一 `docs/maintenance/tasks/M5g-R1.md` 补正01已下发未执行：成功直接通知、成功切换合并、真实应用失效与证据。C2–C5、缓存/诊断/性能未进入。首轮估算仍8–12实质卡含未验收M5g、补正另计；该卡接受后后续约7–11，不按测试数推完成率。
- 复核只新增证据/探针和维护文档，状态镜像同字节；未commit/tag、推送/PR/发布、签名安装/清用户数据、真实付费调用、清共享缓存/reset/clean。设备/硬件落盘/远端CI/其他组合/任意线程交错未认证。

## 73. 2026-10-25 M5g-R1 / v1补正01：完成待复核

- 仅执行[M5g-R1](maintenance/tasks/M5g-R1.md)，结果[ M5g-R1-RESULT](maintenance/results/M5g-R1-RESULT.md)，证据 `validation/runs/20261025-M5g-R1-01/`；分支/HEAD、索引、原脏树/未跟踪/删除状态保留。不进入C2–C5、缓存/诊断/性能或下一阶段，统筹保持待复核。
- 原m5g生产上先加入正式三回归，成功flushCurrent/flushExceptKey、真实clearCurrentKey确认取消均在URL已保存后于refresh期望1实际0失败；red-02的基线源码、XML/完整日志/receipt和偏好事实齐全。第一次缺receipt参数的调用无效，不计产品红测。
- 本轮仅ApiProfiles生产逻辑及build ID变化；直接flush结束一次通知，select成功合并新active一次最终通知，切换/重绑后续失败不吞已保存变更，通知异常保持原异常/已保存事实。原ProfileEditorPreference及其他158个生产文件字节保持；原M5g28+1方法、M5f21非冲突方法正文（统一换行后）保持；失败草稿/origin/原密文/其他profile/global及迟到确认保护继续有效。
- 新增真实CaptionActions→CaptionApplication.command(CONFIGURATION)→RebuildController.refresh/stop/activate验证，真实Cipher/受控Keystore，显式植入真实ready Session/Job/positionGuard：URL成功key失败、成功直接flush均产生新URL且ready=false/terminal的新Session，旧publication/请求尝试/RenderGuard撤权。设备显示替身，未实际运行旧HTTP传输或认证设备启动。
- 完整入口 RunId `20261025-M5g-R1-candidate-01`，Offline/RerunTests，core320+extension500=820，失败/错误/跳过0；源码指纹 `e5333b6691507e660182fd4c718243be85ac0e23deda2f9cf3066e17b2b957d0`。同次551 compiled类与receipt/源码指纹绑定，首次归档长路径错误及辅助脚本失败保留，在下一Gradle前完成有效归档；独立归档core边界/MPP/MPE/UI和release/旧包身份拒绝通过。
- MPP `build/maintenance/M1a/20261025-M5g-R1-candidate-01/patches-1.5.8.mpp` SHA-256 `8a8ec9e90c96b24d03b54d767ce9006177a1a13b23d93acf43ed0cd24d88fc1f`；独立/内嵌MPE `40d3bdd83dad0766b4c5e7247e664fb6834d6f192a4c1e126c0f12996f988c5b`；UI APK `e046756f0986a7fe4f144656c1e71c75e15d4b555232c88304e546d055938d28`。
- 原始YouTube21.41.525-SECONDARY / 官方MPP1.48.0 / Patcher2.0.0及104默认根+AI同输入真实组合/资源重编译通过，现有DEX审计64566类。未签名APK SHA-256 `e7960256c45cee45d036dc37358f5787aff640ad9a69bb78c47805cee22e525a`。相对冻结M5g仅classes13.dex改变，其余18390条目相同；逐类新增ApiProfiles$FlushResult，逻辑改动仅ApiProfiles，CaptionDiagnostics/生成BuildConfig仅build ID字面量变化，其他517类同内容。
- 原M5g红测仅概述、HEAD总diff错误、同次compiled未找到、文档回退原件不足仍准确披露；统筹七文件M5f来源重建不冒称旧时点原件。原报告/卡/候选/探针与有限历史保留。本补正保存入场2234项、保护清单、批次diff及退出哈希逐文件回退，默认仅检查，状态/镜像成对恢复，报告/证据/新旧包保留。
- 六忽略前端、2754已接受历史清单及6376本轮有限保护项保持；81个core编译类与复核入场归档相同，状态镜像逐字节一致。未commit/tag/推送/PR/发布/交付APK签名安装/清用户数据/真实付费API/清共享缓存/reset/clean。真实落盘/硬件Keystore、设备、远端CI、其他组合及任意线程交错仍未认证。


## 74. 2026-10-25 M5g-R1统筹接受、M5h下发及单卡粒度调整

- 接受M5g-R1补正01，C1的逐字段保存通知/失败草稿/实际运行作用域同步规定范围关闭；复核 `docs/maintenance/reviews/M5g-R1-REVIEW.md`，独立证据 `validation/runs/20261025-M5g-R1-coordinator-review/`。当前接受本地1.5.8 / local-1.5.8-m5g-r1，公开1.5.7。原M5g需补正历史、结果和证据缺口保留，未自动回退或替换交付。
- 独立读取ApiProfiles通知归属，直接成功/失败保存均同步；正常select只发新active最终一次，原异常/通知异常与flushing清理保持。red-02原m5g生产/测试源码及三条期望1实际0原始XML/log/receipt核对；最终仅两方法追加重复无改动断言，原应有失败断言未放宽。统筹顺序重跑十类86项全部通过，XML/receipt已归档。
- 两真实应用用例安装真实CaptionApplication/TranslationRuntime，从显式真实ready Session/Job/guard起点执行真实refresh/stop/activate，产生新URL/空key/ready=false/terminal新Session；旧publication/新attempt许可/RenderGuard撤销。显示/原生扫描替身、非完整播放器/旧HTTP传输认证的边界保留。
- 105份完整XML/逐份哈希/receipt确认320+500=820实际执行、失败/错误/跳过0；当前指纹仍e5333b6691507e660182fd4c718243be85ac0e23deda2f9cf3066e17b2b957d0。551类ZIP/receipt/指纹逐项核验，归档时点在后续Gradle前；81 core类与接受旧内容相同，来源/候选/release及旧包身份拒绝/compiled/UI/包边界独立通过。没有重复全套或相同组合构建。
- MPP8a8ec9e90c96b24d03b54d767ce9006177a1a13b23d93acf43ed0cd24d88fc1f，独立/内嵌MPE40d3bdd83dad0766b4c5e7247e664fb6834d6f192a4c1e126c0f12996f988c5b；指定真实组合输入/104根/资源/DEX64566类核对。APK e7960256c45cee45d036dc37358f5787aff640ad9a69bb78c47805cee22e525a，对M5g仅classes13.dex变，其他18390条目同字节；统筹重编只读canonical工具确认仅新增FlushResult，逻辑变化ApiProfiles，另外两类仅build ID。
- 2234入场项/ZIP、原M5g28+1方法、其他158生产、6376本轮有限历史与2754接受历史、269封存索引及六前端核对通过；12目标回退原件/退出哈希/dry-run在本统筹修改文档前通过。本统筹修改当前文档后原回退因后续变化拒绝是预期保护。分支/HEAD/索引保持，状态镜像同字节。
- 用户要求评估增大单卡工作量，统筹决定后续按同职责的一组问题合并调查/必要修复/回归，固定输入后统一完整验证/组合和交付，减少按分支分卡、重复枚举/复制取证；不省略有效断言/实际运行边界/安全回退。下一 `docs/maintenance/tasks/M5h.md` v1已下发未执行：合并C3坏配置恢复、C5编辑保护与C2/C4可达性分级/必要局部修复，不引入跨store事务/自动迁移/清除。
- 收尾清单更新为预计剩5–8实质卡含M5h，补正/外部等待另计：配置1、缓存1–2、诊断性能1–2、环境手册有限兼容2–3。原7–11较细粒度估计被合并计划替代，卡数减少不代表工程工作凭空消失；出现高影响独立问题按影响调整，不为卡数强行收尾。
- 统筹未改生产/既有测试/工具，不commit/tag、推送/PR/发布、签名安装、清用户数据、真实付费API、清共享缓存/reset/clean。C2–C5尚未接受，设备/硬件/落盘/远端CI/其他组合/任意线程交错保留未验范围。

## 75. 2026-10-25 M5h v1：配置错误恢复与编辑保护（完成待复核）

- 执行完成待复核，统筹待复核。仅M5h三个工作包；结果 `docs/maintenance/results/M5h-RESULT.md`，独占证据 `validation/runs/20261025-M5h-01/`。最后接受的配置基线仍M5g-R1/C1，公开1.5.7；不自行关闭配置组或执行下一卡。
- C3：严格读取names/active/endpoint/model/prompt/credential/enabled；坏输入不写回、不猜profile、不删密文或重绑key。真实列表/设置行显示错误，URL/model/key/开关及有效列表选择有明确恢复；坏索引、隐藏prompt及丢失原origin的备份/明确清key限制在产品或合同说明。
- C5：真实getView/onCreateView与detach保留同profile/revision失败草稿/错误；已dequeue的旧debounce同时校验editor/profile/revision。保存完成与后置模型/应用通知分开，显示保存事实并可点击重试通知，不重复写。测试连接前置flush通知异常由UI接住，原始raw异常/主次通知语义保留。
- C2/C4：真SharedPreferences listener和代理before/after/drop分别分级；已观察到active/key/字段内存改变时仍通知并撤销旧scope，不声称多store事务或物理落盘。orphan、丢写替身、断电/硬件等限制保持，完整表见当前合同。
- 最终固定输入为候选03，Offline+RerunTests完整320+523=843，失败/错误/跳过0，两组实际执行；来源/提示词/ABI/compiled/UI/包边界、本地化238×14、发布与验证工具合同均通过。源码指纹 `859d61755591e7a46dde3bab3764c64de2720cd1819bfb5ebc544d9c8029f854`；同次compiled已在下一Gradle前归档，81 core类与接受R1一致。
- MPP `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5h-candidate-03\patches-1.5.8.mpp`，596013 B，SHA-256 `68763b33adaf65d2865a735521701edb18b658ca8be3c831248800130546f560`；独立/内嵌MPE `fd476ff38f84644eede6064867ca587f22b5fc73c604ff2f66ec09cd8a91a260`。1.5.8 / local-1.5.8-m5h，仅本地候选；候选01/02和各自日志/compiled保留，输入修正后没有冒用旧完整结果。
- 指定21.41.525-SECONDARY / 官方1.48.0 / Patcher2.0.0 / 104默认根+AI真实组合、资源重编译/既有DEX审计完成。对冻结R1变化 AndroidManifest.xml, classes12.dex, classes13.dex, res/Yak.xml, res/layout/morphe_settings_with_toolbar.xml, res/xml/morphe_prefs.xml, res/xml/morphe_prefs_icons.xml, res/xml/morphe_prefs_icons_bold.xml, resources.arsc；六个新增键×14语言、旧键值/映射/Hook/core保护及canonical类审计见结果，不把新增资源误报为原字节相同。
- 入场原件/实际字节batch diff、有限历史/工具/旧测试保护、逐文件退出哈希回退和dry-run/隔离拒绝演练见结果；状态与镜像逐字节一致。工程输入/资料原件保留，无commit/tag、推送/PR、发布、签名安装、清数据/共享缓存、真实API、reset或clean。
- 未认证真实落盘/进程死亡/断电/磁盘满、硬件Keystore/OEM设备、其他组合、远端CI、真实服务费用及任意线程交错。执行停止于待复核，不进入缓存、诊断、性能或下一阶段。


## 76. 2026-10-25 M5h统筹接受、包体分解与M5i下发

- 接受M5h A/B/C规定路径与保留限制，配置组本轮有界收尾；复核 `docs/maintenance/reviews/M5h-REVIEW.md`，独立证据 `validation/runs/20261025-M5h-coordinator-review/`。当前接受1.5.8 / local-1.5.8-m5h / candidate-03，公开1.5.7；不扩大为跨store事务/自动恢复/落盘认证，原结果/候选01/02/历史证据保留。
- 统筹独立顺序重跑14类127项全部通过，含最终API动作异常适配；108份完整XML/逐份哈希/receipt确认320+523=843实际执行、失败/错误/跳过0。指纹859d61755591e7a46dde3bab3764c64de2720cd1819bfb5ebc544d9c8029f854与当前和前后输入相同；555类ZIP/receipt/指纹绑定及81 core接受内容相符。来源/compiled/UI/包边界/候选通过，release及旧R1身份冒充实际拒绝。
- 实际配置/编辑/应用路径核对：坏值不可读/无新请求，初始化不写；实际列表/URL/model/开关有局部恢复；同绑定失败草稿、旧editor/profile/revision拒绝，保存与同步失败分开；真listener/代理层级明确，观察到active/key内存变化仍通知及撤权。坏index/隐藏prompt/丢origin、orphan、多store/物理持久化限制按合同接受保留，不宣称所有问题全关。
- MPP68763b33adaf65d2865a735521701edb18b658ca8be3c831248800130546f560，596013 B；独立/内嵌MPE fd476ff38f84644eede6064867ca587f22b5fc73c604ff2f66ec09cd8a91a260。指定原始APK/官方MPP/Patcher和104根组合核对；APK1276ac9b5a5a81d7bb9a8c66ce6854b148cf3dfe5c81a99389b1f9eade036506，16 DEX/64580唯一类。统筹重编只读资源工具从两实际APK核验六变化XML语义相同、3248旧值/ID保持、新84值等于六键×14语言；18382其他条目原字节相同。
- 2239入场项/ZIP和39目标退出哈希、10183有限历史/389封存索引核对；2201范围外现存文件及两原删除状态保持。原28个非冲突配置方法及应用2/端口4正文保持，七个冲突刻画按授权映射。默认回退dry-run在统筹改文档前通过；实际仓库未恢复。分支/HEAD/索引保持，状态镜像同字节。
- 用户询问最终成果及MPP增长，独立size-analysis确认M5h比R1增8446 B（1.44%）：14语言资源压缩增5253 B，扩展压缩增3193 B，ZIP结构增0；较N75/M1a净增4699 B（约0.79%），M2a曾下降。测试/报告/历史未装入MPP，本轮生产源码净增334物理行；精简目标是职责/有效入口/重复失效实现与接手难度，不保证每轮行数/包体/工作区物理总量缩小。实际组合APK增21268 B约0.0094%，不能据包体推断性能。
- 下一 `docs/maintenance/tasks/M5i.md` v1已下发未执行，同卡调查源字幕/翻译结果缓存的损坏/写入失败/clear与旧候选交错、真实恢复/请求计数及必要最小修复；冻结F3语义复用/格式/预算和配置组行为。不无故改身份/格式或清用户缓存。首轮预计剩4–7实质卡含M5i，补正/外部等待另计：缓存1–2、诊断性能1–2、复现资料/有限兼容2–3。
- 统筹只做审查/针对性测试和维护文档，未改生产/原测试/工具，未commit/tag、推送/PR/发布、签名安装、清用户数据/缓存、真实付费API、共享缓存清理/reset/clean。设备/硬件/落盘/远端CI/其他组合/真实服务/任意线程交错继续未验。


## 77. 2026-10-25 M5i v1：翻译与源字幕缓存故障、恢复及必要修复（完成待复核）

- 执行完成待复核，统筹待复核。仅[M5i任务卡](maintenance/tasks/M5i.md) A/B/C；[结果](maintenance/results/M5i-RESULT.md)、[缓存合同](architecture/CACHE-FAILURE-CONTRACT.md)，独占证据 `validation/runs/20261025-M5i-01/`。最后接受仍M5h candidate-03；不自行接受缓存组，不进入诊断/性能或下一阶段。
- 三条真实IO红测复现源缓存先删目标、type失败后body已变、body失败后type已变；原应有断言修后转绿。生产仅SourceCaptionCache：ATOMIC_MOVE保留旧目标，type先/body最后发布，失败恢复type，get/remove共享原提交锁；另按卡改build ID为local-1.5.8-m5i。身份/格式/目录版本/TTL/限额/淘汰和线程不变，core生产/来源/协议/提示词/ABI、UI/资源不变。
- 新增core8+extension10=18项。真实译文read/review、错块/引文/源、prepare/move故障、旧CacheLookup/clear/Publication验证；真实RawCaptionSource/CaptionDocument及本地HTTP恢复。新缓存回归实际合计source GET=9、provider POST=2/audit attempt=2；坏源恢复后重入0新GET，正常命中0模型请求；401无源文显示。相邻core72/extension88项通过，原843项未改。
- 固定最终输入后唯一候选完整入口Offline+RerunTests：core328+extension533=861，失败/错误/跳过0，两组实际执行；110份XML/receipt及555同次compiled在下一Gradle前归档，源码指纹 `9439ef3e8c329b860c374bd76fe5e2cc84e1c5814fb7702d2b1b9ffe7d750b12`。归档core81类与接受M5h同字节；明确MPP/MPE/UI边界通过，本地冒充release和M5h冒充M5i均在期望build ID拒绝。
- MPP `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5i-candidate-01\patches-1.5.8.mpp`，596140 B，SHA-256 `8e960b4d4e471df805871c0f67c12eccf07d145ebdd27e26a96d1cc0664f4d99`；独立/内嵌MPE `120143e1711c3884b51f655b163c2c719df9219bc95e0c9237421d8496eda070`。当前1.5.8 / local-1.5.8-m5i / candidate-01；公开仍1.5.7。与M5h包体/规定真实组合/DEX及资源逐条目审计、入场保护和回退结果以本轮结果报告为准。
- 同输入原始21.41.525-SECONDARY / 官方1.48.0 / Patcher2.0.0 / 104默认根+AI真实组合、资源重编译/既有DEX审计64580类通过。未签名APK `3d7133011e91b046aa9eef645507436d9103f211bfcbee838b03a1c20ee2236c`，227137129 B。相对冻结M5h仅classes13.dex改变，18390其他条目（全部资源/Hook所在未变DEX等）同字节；两DEX839类canonical审计仅SourceCaptionCache逻辑变化，Entry仅方法debug，另外两类仅build ID；Hook/HookV2/Bridge原类内容保持。MPP增127 B全部为压缩MPE；资源/其他/ZIP结构增0，无新增类/依赖/测试泄漏。
- 原分支/HEAD/索引、既有脏树/未跟踪/删除状态保留；状态与镜像逐字节一致。退出哈希逐文件回退默认仅检查并实际dry-run，后续修改整体拒绝；结果/证据/新旧交付保留。未commit/tag、推送/PR/发布、签名安装、清用户数据或真实缓存、真实付费API、共享缓存清理/reset/clean。
- 保留：两文件不认证跨进程/断电原子性；双重IO/恢复再失败仅尝试本键失效；源checkActive→put晚到窗口不等同显示权；真实设备/硬件/落盘/远端CI/其他组合/真实服务/任意线程交错未认证。详见当前缓存合同，不把测试fixture恢复升级为用户数据迁移工具。


## 78. 2026-10-25 M5i统筹接受及M6a下发

- 接受M5i缓存损坏/故障恢复、三项替换修复、put后epoch/Publication规定范围及披露限制，本轮缓存组有界收尾；复核 `docs/maintenance/reviews/M5i-REVIEW.md`，独立证据 `validation/runs/20261025-M5i-coordinator-review/`。接受本地1.5.8 / local-1.5.8-m5i / candidate-01，公开1.5.7；原结果/红绿/候选/历史保留，不扩为跨文件/硬件事务认证。
- 独立顺序重跑core六类72项、extension九类88项，合计160项全部通过，XML/receipt分别归档。18新用例实际仍source GET9/provider POST2/audit attempt2；命中0请求、坏源各1GET恢复、坏译文1POST恢复和401终止/无源文、旧CacheLookup/clear/permit及源epoch顺序有效。三条真实IO红测基线源与入场相同，8项/3失败修后原断言转绿。
- 110份完整XML逐份SHA/receipt确认328+533=861实际执行且失败/错误/跳过0；当前指纹9439ef3e8c329b860c374bd76fe5e2cc84e1c5814fb7702d2b1b9ffe7d750b12与完整前后相同。555类ZIP/receipt/指纹绑定及81 core接受M5h同字节核验；明确候选/来源/compiled/UI/包边界通过，旧M5h及local-release冒充实际按身份拒绝。
- MPP8e960b4d4e471df805871c0f67c12eccf07d145ebdd27e26a96d1cc0664f4d99，596140B；独立/内嵌MPE120143e1711c3884b51f655b163c2c719df9219bc95e0c9237421d8496eda070。指定原始APK/官方MPP/Patcher/104根组合及64580类审计核对；APK3d7133011e91b046aa9eef645507436d9103f211bfcbee838b03a1c20ee2236c，仅classes13.dex变、其余18390条目同字节。统筹重编只读canonical/Entry debug工具确认839类无增删、逻辑仅SourceCaptionCache、Entry仅debug、两类仅build ID。MPP增127B全为MPE压缩，资源/ZIP增0。
- 源get/remove/publish同COMMIT_LOCK，type先/body最后原子替换，失败恢复旧type，不预删目标。保留源checkActive到put之前晚到窗口，接受只保证put捕获epoch后的队列/提交及控制器输出授权；该窗口不等同显示/请求权，未据此改身份/预算。两文件跨进程/断电、双IO/永久删除失败等限制保持，不用总绿测声称全部存储认证。
- 入场2245项/ZIP、2233范围外现存+两删除状态、15194有限历史/343索引、原146测试/资源/六前端/190工具构建保护核对；13目标回退默认dry-run在本统筹更新文档前通过，未实际回退。44旧中间文件精确入场SHA恢复和历史清单晚首Gradle6秒已如实说明；封存档/交付未丢，接受偏差。状态镜像同字节，分支/HEAD/索引保持。
- 下一 `docs/maintenance/tasks/M6a.md` v1已下发未执行：同卡处理F5诊断解释/旧计账兼容、关键热路径线程/IO/解密/队列/分页/退出机制测量和有证据的局部修复，不凭JVM耗时声称设备帧率改善。预计剩3–5实质卡含M6a：诊断性能1–2、环境资料有限兼容2–3，补正/外部等待另计。
- 新历史清单收敛保护源码、交付及封存log/receipt/XML/compiled ZIP/回退原件，Gradle可再生成class/previous-compilation-data等不反复纳入；正常构建可管理自身中间输出，不主动删交付/封存档，不改原清单/44恢复历史。减少重复取证，不降低源码与证据追溯。
- 统筹未改生产/原测试/工具，未commit/tag、推送/PR/发布、签名安装、清用户数据/真实缓存、付费API/共享缓存清理/reset/clean。设备/硬件/落盘/远端CI/其他组合/真实服务/任意线程交错仍未验。

## 79. 2026-10-25 M6a v1：诊断可解释性与性能机制基线（完成待复核）

- 执行完成待复核，统筹待复核；仅[M6a任务卡](maintenance/tasks/M6a.md)A/B/C。[结果](maintenance/results/M6a-RESULT.md)、[诊断/性能合同](architecture/DIAGNOSTICS-PERFORMANCE-CONTRACT.md)，证据`validation/runs/20261025-M6a-01/`。最后接受仍M5i candidate-01，公开1.5.7；不自行接受F5/M6或进入资料/兼容下一阶段。
- F5保留HTTP_CONFIG枚举/旧计数/历史统计；实际applyFailure后Job.trace补reason、真实configuration或unknown、failure delay、实际READY/WAITING/FAILED、terminal/filter及已更新父/provider elapsed门。14语言解释说明429/503/过滤不是自动配置错误或永久终止；batch/attempt/服务器接收/费用/response/quality/cache分开。真实HTTP/Controller/实际Application/Audit/Writer验证，不靠手设terminal或文案猜决定。
- 有限基线：20记录调用线程key0/writer解密1；双lane1220输入→各512、merge19/drop177；archive4096积压→overflow drop2及截断；40组重复viewport/200pre-draw新增分页/文本/布局0，真实字号仍新分页1；6源会话/120time/2GET/0模型batch/attempt、旧Publication/Job及排队工作收尾。真实源读取锁线程CaptionSharedSourceIO、写提交DeepSeekCaptionSourceCache、主线程缓存访问0，严格设置启动读取仍在调用主线程；不推断设备帧率/内存/耗电。
- 局部修复只补诊断决定/双lane积压可观察性及同次严格配置凭据复用（真实Conscrypt/SPI2→1）；无新静态key缓存或持久格式。M5h坏读取/origin/编辑保护及M5i缓存身份/格式/配额、F1/F2/F4/Publication/源模式/原生CC/语言/失败无源文保持。原861项既有断言不放宽，新增11项。
- 固定最终工程后Offline+RerunTests实际core328+extension544=872，失败/错误/跳过0；同次compiled/XML/receipt在下一Gradle前归档，源码指纹`30b8cc6a4f236df8038f1e971bcde9bbb323c30d8bc6b5760f021efda9bc798d`。MPP/MPE/UI边界、238→239键×14语言、旧M5i冒充M6a及local冒充release拒绝；指定21.41.525-SECONDARY / 官方1.48.0 / Patcher2.0.0 / 104默认根+AI真实组合、资源重编译/既有DEX审计通过。
- 候选1.5.8 / local-1.5.8-m6a / candidate-01：MPP `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M6a-candidate-01\patches-1.5.8.mpp`，600147 B，SHA-256 `6eed1d80efa2de6b2209aa180f5e5a29c14821d03ecdcc130390a8dc5ed2227e`；独立/内嵌MPE `c6034c0c6d5d81858bfac402b34640e18e5c0a09d1bd90432a71be3b35d2220f`。较接受M5i增4007 B，资源/扩展压缩增量及新临时RequestSettings类按结果逐项说明，不以包体推断性能。
- 入场2251项原件/13910项有限历史保护，保留原脏树/未跟踪/两删除状态、分支/HEAD/索引；新清单不反复加入可再生成Gradle中间class，不改旧清单/44项恢复历史。逐文件退出哈希回退默认只检查并实际dry-run，后续修改整体拒绝；报告/证据/全部新旧包保留。状态镜像逐字节相同。
- 设备/OEM/硬件Keystore/物理IO长尾/帧时/内存/耗电、远端CI、其他组合、真实服务收到/费用和任意线程交错仍未认证；源put前窗口、跨文件崩溃、多store/orphan等原限制保持。没有commit/tag、推送/PR/发布、签名安装、清用户数据/真实缓存、真实付费API、清共享缓存、reset/clean。


## 80. 2026-10-25 M6a统筹接受及M7a下发

- 接受M6a F5解释/实际决定、有限性能机制基线及两项局部修复；复核 `docs/maintenance/reviews/M6a-REVIEW.md`，独立证据 `validation/runs/20261025-M6a-coordinator-review/`。接受本地1.5.8 / local-1.5.8-m6a / candidate-01，公开1.5.7；不认证设备性能/硬件长尾，旧结果/卡/证据保留。
- 统筹独立18类103项全部通过。真实HTTP/Controller/Application/Audit下同HTTP_CONFIG桶分别终止/等待/块过滤，原因/实际门及unknown正确；source-review对新trace/Job-index适配移除后Controller正文与入场精确相同。RequestSettings同锁临时复用key，真实Conscrypt/SPI单次读取2→1，无静态明文缓存/格式变化。
- 独立复现20记录caller0/writer解密1；1220突发双lane各512/merge19/drop177及caller文件访问0；archive4096队列额外2条丢弃可见；40组稳定输入/200predraw不增分页/文本/布局、真实字号变化1计划；6会话/120活动time新增key/严格配置读0、两轨2GET/0模型请求，缓存消费与提交worker线程及排空有效。启动严格配置仍主线程，不能推断硬件耗时/设备帧率内存耗电。
- 114份XML逐份SHA/receipt确认328+544=872实际执行，失败/错误/跳过0；输入指纹30b8cc6a4f236df8038f1e971bcde9bbb323c30d8bc6b5760f021efda9bc798d与当前/前后相同。557类ZIP/receipt/指纹/归档顺序有效，来源仅Controller实际目的项及适配/派生patch，固定上游/snapshot/协议/提示词/ABI保持；来源/compiled/UI/包边界复查通过，local-release及旧m5i冒充实际拒绝。
- MPP6eed1d80efa2de6b2209aa180f5e5a29c14821d03ecdcc130390a8dc5ed2227e，600147 B；独立/内嵌MPE c6034c0c6d5d81858bfac402b34640e18e5c0a09d1bd90432a71be3b35d2220f。指定输入104根组合/资源/DEX64581类核对；APK e1effef6c49298e9126f383a644ffc17759c306606adfb10dace93dabc536de6，18383其他条目同字节；统筹重编canonical/资源工具确认仅新RequestSettings、五生产类逻辑变化，Hook/Bridge保持，3332旧文案值/ID保持、新说明键×14。MPP增4007 B=资源3529+MPE478，ZIP结构0。
- 2251入场项/ZIP、2216范围外现存+两删除状态、13910有限历史/368封存索引及六前端核验；原148测试/资源仅Shorts追加一方法、旧方法正文保持。38目标回退默认dry-run在统筹改文档前通过，未实际恢复；分支/HEAD/索引保持，状态镜像同字节。新历史口径继续不反复保护可再生成Gradle内部输出。
- 下一 `docs/maintenance/tasks/M7a.md` v1已下发未执行，合并可分发当前开发入口、明确工具/缓存/认证来源、实际新进程/隔离输入演练及维护资料/状态收敛；产品/资源/身份/依赖冻结。已知.devenv被本地exclude忽略，不能要求接手者依赖本机文件或旧工作区fallback。PROJECT-STATE收敛前必须原字节归档并核对，保留历史及镜像。
- 预计剩2–3实质卡含M7a：环境/资料1、M7b有限兼容/设备/来源说明1，必要独立收尾0–1；补正/外部等待另计。M6a导出旧official=1.45.0静态字段登记M7b必须处理，不猜填当前实际官方版本；启动硬件读取/设备性能/远端CI等未验明确保留，不把资料完成等同实测。
- 统筹未改生产/旧测试/工具实现，未commit/tag、推送/PR/发布、签名安装、清用户数据/真实缓存、付费API/共享缓存清理/reset/clean。所有项目证据在E:，未知线程交错/真实服务等原限制保持。
