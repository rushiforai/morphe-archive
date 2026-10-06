# N24 交付记录：翻译质量回退 N22、设置界面修正、保留 N23 工程改进、有界调度优化

日期：2026-09-30（N24）。开工先全文读取 PROJECT-STATE，按 §2.8 原样同步外部档案（两处 SHA-256 一致，`1047121A6986641FBC2E4193D1423343F052F10F3849900BE2576BBF1F916036`，档案随本卡提交）。N23 基线 `45a830a` / `anchor/n23-45a830a`，翻译质量回退参考 `a482262`（N22）。翻译 API **0 次 / 0 tok**，新增依赖 0，下载 0；不真机、不签名、不发布、不推送。ACCEPTANCE.md 与冻结计分板逐字节不变。

## A：翻译质量回退至 N22

`RebuildReview.java` 用 `git checkout a482262 -- …` 还原，**相对 a482262 逐字节零差异**（两侧 blob 均为 `0a00c7049224b106293084600e6305b0ca613683`，`git diff a482262 -- RebuildReview.java` 为空）。撤销内容：

| 撤销项 | N23 行为 | N24（＝N22）行为 |
| --- | --- | --- |
| `possible_subject_attachment` | 源侧 `would follow <name> reduced` 即命中（去掉中文侧条件） | 恢复中文侧 `之后\|之後` 条件，措辞漂移不再被救回 |
| `possible_omission`（licensed or unlicensed） | 源侧窄规则 + 译侧缺「仿制/复制/衍生/型号」即命中 | 整段删除，该短语只保留 N22 的 `possible_authorization_expansion` |

测试调整（`RebuildN23ReviewTest`）：撤销两条要求新行为成立的用例，改为两条**回归**用例证明行为已回到 N22——① `subjectAttachmentNeedsTheChineseClauseMarkerAgain`：带「之后」命中且 `semanticBlocked`，用「随之而来」不命中；② `licensedOmissionRuleIsGoneWhileAuthorizationExpansionStays`：缺中心词不再报 `possible_omission`，忠实译文零问题，`possible_authorization_expansion` 仍在。540 事件回放用例保留为台账，输出改写到 `.verification/n24/review-hits.json`（`.verification/n23/review-hits.json` 保持原字节）。实测 **possible_subject_attachment=0、possible_omission=0**（540 事件）。

C/D 段未随 A 段回退：`CaptionMusicSuppressor`、`LoopbackCaptionServer`、`RebuildController`、`DeepSeekSliderPreference` 的 N23 改动与新增的 `NativeRendererN23Test`、`RebuildN23ConcurrencyTest`、`RebuildIntegrationTest` 并发用例全部保留。

## B：字号滑条端点统一

**偏差来源（实测，420dp / density 1，修前）**：字号条 w=380、padding 16、thumb 18、`thumbOffset=0`。平台轨道绘制在 `[22,357]`，两端各内缩 **6px**（内缩量与布局宽度无关），而刻度按 `[16,364]` 计算——端点、刻度、thumb 行程三套几何互不相同，这正是用户看到「最大/最小档刻度不在轨道两端」的原因。`AbsSeekBar.onDraw` 的 `available` 还额外扣掉一个 thumb 宽度，thumb 中心实际只能走到 `padding+halfThumb` 到 `width-padding-halfThumb`。

**修法**：新增 `DeepSeekSliderPreference.RailBar`，两条滑条同基类，自行绘制轨道与刻度、自行按同一公式落 thumb，不再让 `AbsSeekBar` 画轨道（其 drawable 已不足以支撑端点对齐，但仍保留用于测量高度，由 `onMeasure` 显式接管 24dp）。几何：

- 可见轨道 = `[paddingLeft, width − paddingRight]`（左端含该像素）；
- 刻度 = 轨道端点 + 四等分；`tickCenterX` 与 `thumbCenterX` 同源；
- thumb 中心 = `railStart + fraction × (railEnd − railStart)`，level 0/4 精确落在轨道两端。

**实测偏差（Robolectric 原生栅格，420dp）**：

| 指标 | 亮/暗 × 超小/标准/超大 |
| --- | --- |
| 两条可见轨道长度差 | **0px**（同为 362px，均 `[9,371]`，测量行 `[9,370]`） |
| 首/末刻度 vs 可见轨道端点 | **0.0px**（程序化为 0；栅格化刻度墨迹跨度 = 轨道跨度 ± 刻度半径，逐像素吻合） |
| thumb 中心 vs 对应刻度 | **0.0px**（5 档全等，thumb 由同一函数落位并断言） |
| 档名 vs 刻度 | **0.5px**（整数像素取整） |

两条滑条继续等长、同左右边距（padding 9/9）、同取色来源（填充/thumb/当前刻度 = `primary`，未填充轨道/其余刻度 = `sliderUnfilled = tint(primary,64)`）。五档吸附、拖动实时预览、松手保存、当前档高亮、档名对齐全部保留；RTL 由 `tickCenterX` 镜像（刻度 9↔371，档名同步）。字号五档与 55.5/44.5 缩放、运行时字体测量、旧值迁移均未改动。

## C：字号文案精简与全屏预览

- 标题去掉「（详情页）」：`size` key 14 语种改短（en `Font size`、zh-rCN `字号`、zh-rTW `字號`、ja `文字サイズ`、ko `글자 크기` …）。
- 移除字号滑条标题行右侧大小数值**仅对字号条**：`addHeaderValue()` 只为透明度条创建数值标签；新增回归用例 `opacityRowKeepsItsLiveHeaderValue` 锁死透明度条仍有实时百分比、拖动只预览、松手保存。
- 下方当前档说明继续显示「详情页 44.5px · 全屏 55.5px」并随拖动更新；档名行仍不含 px。
- 预览标注「横屏全屏预览」：`preview` key 14 语种改为全屏语义（zh-rCN `横屏全屏预览`、en `Landscape full-screen preview`…），标题与 `contentDescription` 同源。
- 预览**确实**按全屏比例渲染：字幕在 2736px 全屏参考系排版后整幅缩放一次，栅格化字高 = `fullScreenGlyphHeight/2736 × 预览宽度`（新增断言）；未单独缩小预览字体，未改播放器字号规则。
- 示例句：`字幕要自然。`（源字面 `SubtitleStylePreview.LANDSCAPE_SAMPLE`）。**长度受预览画布物理限制**：预览宽 380px、字幕最大宽 92%×380−2×6dp ≈ 347px，标准档单字 advance 59px → 两行只能容约 11 字，最大档（超大）约 7 字。因此把示例句定在「在窄预览 + 五档全档位下都不被截断、且仍是完整句子」的最长可用长度；新增用例 `previewSampleIsALongNaturalLineThatFitsTheLandscapeFrame` 在 320/420/960 三档宽度 × 五档字号下断言「不被截断 + 行数 ≤ 2」。这是预览尺寸的硬限制，不是字号规则改动。
- 切换五档与透明度即时更新（`SubtitleStylePreview.update`，原有链路未变）。
- 本地化同步：`localization/catalog.json`、14 语种 `caption_addon_strings.xml`、`source-keys.tsv`、`CaptionTranslationCatalog.java` 由 `tools/generate_localization.py` 重新生成，`tools/check_localization.py` 通过（129 keys × 14 语种）。撤销被替代的 4 条 source 映射（旧示例句、`字幕预览`/`字幕預覽`、`字号（详情页）`/`字號（詳情頁）`）。
- fixtures（亮/暗 × 超小/标准/超大，共 6 张）：`.verification/n24/fixtures/settings-{light,dark}-{xs,standard,xl}-landscape.png`，元数据 `.verification/n24/fixtures/preview-measurements.json` 记录预览宽度 380px、档位、详情页/全屏 glyph 与预览 glyph 换算。已目检亮/暗标准与超大、超小档。

## D：有界调度优化（D1–D7）

**D1 并发预算**：新增 `MAX_FOCUS_CONCURRENCY=2`、保留 `MAX_PREFETCH_CONCURRENCY=2`、`MAX_TRANSLATION_CONCURRENCY=4`；`PRIORITY_IO` 由 1 路改为 2 路，`PREFETCH_IO` 仍 2 路。前台与后台分属不同线程池，后台结构上不可能占用前台预留槽位。预算按**实际在途**统计（`dispatched()` 遍历 `jobs[]`，不区分当前块），旧位置在途请求继续占额。全部用现有 `Executors` 设施，无新依赖。

**D2 最新前台任务优先**：新增 `Session.pendingFocus`——**至多一个**已选中但尚未交给线程池的前台请求。两条前台都在途时新落点进入该槽位并**替换**旧待办（`retirePendingFocus`），被替换者立刻释放 `jobs[i]`、状态回到 WAITING、`retryAt=now+500`，且 **attempts/repairCount 均未消耗**（尝试与修复额度改为在 `markDispatched()` 真正派发时才记账）。一条在途 + 一条空闲时，新落点直接使用空闲槽位，不等旧请求。seek 仍**不强行取消已发送请求**（保留 N23 策略）。闸门释放后 `schedule()` 会把保留的最新待办提升派发。

**D3 去重与缓存复用**：同一块已有在途作业（无论前台/后台来源）时直接复用，并打 `REBUILD_BLOCK_REUSED;reason=in_flight_prefetch|in_flight_focus`；查找顺序仍是内存计划 → 磁盘缓存 → 网络，缓存恢复在同步块内、位于任何网络派发之前，打 `REBUILD_CACHE_RESTORED;path=memory_then_disk_before_network`。缓存 key、语义分块、源词时间归属未改。

**D4 两路预取预算生效**：`allowAhead` 去掉「存在任何非当前块在途作业即禁止」的条件，改由后台预算 + 候选块资格决定；循环末端的「每轮只起一个新作业」限制取消，两条合格预取可在同一次调度派发。保留暂停（`prefetchPausedUntil`）、播放器时钟有效性（`CLOCK.fresh`）、暂停态与 30 秒范围条件；「3 秒内两次 seek 暂停预取 5 秒」参数未动；风暴期间不新增后台预取，前台仍按 D1/D2 调度。

**D5 供应商请求与失败处理未改**：`RebuildApi` / `RebuildProtocol` / `NetworkDeadline` / 429 与 5xx 冷却 / Retry-After / 输出上限 / 质量校验 / 修复上限逐字未变；未改流式上屏、未缩短源文、未放宽校验。本卡 0 次远程 API 调用（全部走本地 MockWebServer 与离线夹具）。

**D6 诊断**：保留 `REBUILD_WAIT_BREAKDOWN` 的 `slot_wait_ms` / `network_ms` / `validation_ms` / `validation_repair_retries` / `http_rounds`，新增 `dispatched` / `sent`；`REBUILD_REQUEST` 追加 `focus_in_flight` / `prefetch_in_flight` / `pending_focus_block`；新增 `REBUILD_FOCUS_PENDING_HELD`（最新待发前台块）、`REBUILD_FOCUS_PENDING_REPLACED`（未发送任务被替换的原因与 `attempts_consumed=0;session_repairs_consumed=0`）、`REBUILD_FOCUS_PENDING_PROMOTED`、`REBUILD_LANE_RELEASED`（在途数量与 `translation_in_flight`）、`REBUILD_BLOCK_REUSED`。沿用 session/request/block 标识；排队与网络、本地处理分列，不记录 API Key。

**D7 验证（新增 6 条，全部驱动生产 `schedule()`/`time()` 与真实 `dispatch`/`translate` 生命周期，本地 MockWebServer + 可控门闸）**：

1. `n24BlockedOldFocusStillLeavesTheSecondSlotForTheNewLanding`：旧前台被门闸阻塞时，新落点用第二槽位发出（服务端同时见到 2 条在途），无重复请求。
2. `n24TwoFocusInFlightRetainOnlyTheNewestPendingLanding`：两条前台在途时连续 3 次落点只保留最新待办（index=4），中间落点未发送、`attempts=0`、状态回 WAITING；`replacedFocus=2`；释放一个槽位后只派发最新待办，请求总数 2→3。
3. `n24PrefetchBudgetUsesTwoSuccessorsAndStopsAtThirtySeconds`：当前块就绪时两个合格后继均派发（`attempts[1]=attempts[2]=1`、`attempts[3]=0`）；超出 30 秒的块（start 40000 > 0+30000）不派发。
4. `n24TotalInFlightStaysBoundedAndBackgroundKeepsItsOwnLanes`：全部门闸阻塞下反复落点，前台 ≤2、后台 ≤2、总数 ≤4，服务端观测最大并发 ≤4。
5. `n24SameBlockIsReusedCacheRestoresAndSessionEndReleasesEverything`：后台在途块转为当前块时复用（该块请求数恒为 1，保留后台通道）；缓存块恢复零网络请求、零 attempts；会话结束丢弃保留待办并标记 cancelled。
6. `n24LateResultNeverPresentsOnTheWrongLanding`：旧块结果迟到时，屏上仍是新归属块的译文，旧块译文不上屏。

既有 `startupAllowsOnlyOneNeighbourWhileFirstCallIsInFlight` 断言的是 N23 的「只允许一个邻居」策略，按 D4 改写为 `startupPrefetchesUpToTheBackgroundBudgetAndKeepsTheFocusLaneFree`（并存、分道、各 1 次尝试）。

**离线证明的边界**：以上只证明**调度与排队**行为（预算、槽位、替换、复用、归属）。它不等价于真实 API 延迟改善；N23 真机 `request 10: slot_wait_ms=5495 / network_ms=9338` 的槽位等待应由本次改动消除或大幅降低，但**真机未验证**，网络耗时本身未做任何承诺。

## 验证

Java 全套离线单测 **429/429**（0 失败 / 0 错误 / 0 跳过，53 个套件；N23 为 421，本卡净增 8：新增 6 条 D7 + 1 条透明度条回归 + 1 条预览示例句回归，撤销 2 条 N23 断言用例）。Python `unittest discover -s scoreboard` **27/27**。`tools/check_localization.py` 通过（129 keys × 14 语种）。`scoreboard/run.ps1`：**4 通过 / 4 既有失败 / 4 未验证**，`pending_translation` / `event_review` / `overflow` 不可见时长**全 0**，`scoreboard/results/frozen-baseline.json` Git 无差异；ACCEPTANCE.md 与冻结证据未改。

