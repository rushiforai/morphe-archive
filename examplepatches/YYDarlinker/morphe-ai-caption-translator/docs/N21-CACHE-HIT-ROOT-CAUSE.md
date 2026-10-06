# N21：第三轮块缓存 0 命中的离线取证

**裁决：(b) 本轮计数及同 session 复看路径符合设计内行为，未复现 key 或落盘时机缺陷。设备每次 read 未返回有效计划的具体原因，现有证据不能唯一定位。** 本轮查的是该 session 首次访问的块；同 session 已完成块拖回复看复用内存，不再查盘，因此即使继续复看，`hit blocks` 也不保证增加。原有 **`hit blocks > 0`** 判据不变；执行该判据须让同包重新建立 session，读取此前成功落盘的区块。本卡不实施任何修复或真机操作。

`D:Lnnn` 指 `D:\HONOR Share\Honor Share\caption-diagnostics-1.3.5-20260930-140013.txt` 原件，SHA-256 `c6932c7eb4f415ec7d65b60bc1e5855610e2b24c5f0c1a8792f20b06325fdd99`。代码行号以本卡父提交 `c124fb5` 为准；N18r `581112b` 至父提交的缓存、规划、计数代码相同，Controller 后续修改仅涉及显示。全文权威档案已按 §2.8 原样同步，不另写状态更新。

## 1. key、落盘和读取

`RebuildCache.java:24–42` 的 namespace 为以下 UTF-8 字符串的 SHA-256，文件名在 hash 后拼 `-b<index>_<from>_<to>.json`（`RebuildPlanner.java:27–29`）。

| 输入 | 实际内容 |
| --- | --- |
| 协议/引擎版本 | `RebuildProtocol.VERSION` = `BuildConfig.CAPTION_PATCH_VERSION`，该包为 `1.3.5`；目录版本另为 `caption-events-r2.12`，不是额外哈希字段。 |
| 配置 fingerprint | `baseUrl + '\n' + model + '\n' + prompt`（`DeepSeekConfig.java:233–234`）：原始 base URL、配置模型、用户 prompt，未再次规范化。 |
| 目标语言 | 原始 target 字符串，如 `zh-Hans`。 |
| 生效 prompt SHA | `SHA256(RebuildApi.prompt(config,target))`；包括内置主 prompt、保真 prompt、目标语言、用户 prompt（`RebuildApi.java:36–42`）。 |
| 源内容 | **整片全部源词**，按原顺序逐词拼 `\nstart:end:precision:text`，不是仅当前块。文本、起止毫秒和 NATIVE/ESTIMATED/ALIGNED 精度全部参与。 |
| 区块区间 | index、from、to 组成文件名后缀；区块起止毫秒已通过整片源词进入 namespace。 |
| 不参与 | API key 或其哈希、源字幕缓存 key、视频 ID、session、generation、当前时间/播放位置、cue 编号、字幕窗口/字号/布局预算、repair、请求序号；视频与源缓存 key、API key 哈希属于 Controller **session identity**（`276–303`），不是块盘 key。 |

响应在 `RebuildApi.java:142–150` 经 `parseBound`（源词归属、结构、语义等）和布局 review；Controller 选定最终 plan 后，仅 `RebuildReview.score==0` 同步写盘（`RebuildController.java:700–715`）。`RebuildCache.java:70–99` 写临时文件、`fsync`、`ATOMIC_MOVE`；完成后才记录 `REBUILD_EVENTS_ACCEPTED`，失败记录 `REBUILD_CACHE_WRITE_FAILED`。有质量风险的接受计划仍可留内存，但不写盘；过期 session/已取消 job 在 `666–668` 提前返回不写。命中不重复写。

读取只有两处：初始化查当前焦点块及下一块（Controller `472–488`）；其余块第一次 translate、`cacheChecked=false` 时懒查（`656–661`）。重试与同 session READY 块复看不重复查。每次读取还须文件存在、≤256000 字节、`parseBound` 成功、review score 0；异常删除文件并 miss，review 非零 miss 但不删（Cache `56–67`）。

目录为 `<app cacheDir>/caption-events-r2.12`；上限 **256 个 JSON / 64 MiB**，每次成功写后按 `lastModified` 从新到旧保留，超限删除；读不更新时间，故是写入时间淘汰，**无 TTL**（Cache `50–53,86–93`）。源字幕在独立子目录 `deepseek-source-captions`（80 MiB/180 条、24h 访问刷新 TTL、异步写）；旧整页译文在独立 `deepseek-captions`（150 MiB/300 条、无 TTL），不是本次 R2 请求块路径。三者只共享父 cacheDir；设置的显式清缓存会一起清除（`DeepSeekActionPreference.java:60–62`）。

## 2. 同视频同包再次请求仍 miss 的代码条件

| 因素 | 判定与证据 |
| --- | --- |
| 会话/时间漂移 | 不会因此换块 key：上述字段均不参与；seek 只更新 generation/显示去重，不清 plans/states/cacheChecked（Controller `335–358`）。 |
| 配置或源变化 | 协议、base URL、模型、任一 prompt、语言，或**整片任一词**的文本/时间/精度变化会换 namespace。参考字幕对齐可改变时间/精度（Controller `455–472`、Source `351–380`）；本轮未据此认定发生漂移。 |
| 区块边界/窗口 | planner 对整片 source 确定计算，不依赖播放窗口（Planner `32–73`）；cue 分组可经 `resourceScore`（`135`）影响切点和后缀，但 cue 不直接进 namespace。相同源与 cue 分组下，seek/字号变化不重切块。 |
| 跳过写/仅内存 | 风险非零、结构拒绝、job 取消/失效均可没有盘文件。D:L291/303/314 的 b4 三次仍 risk 2/1/1，不能期望该块盘命中；b10 首轮 risk 1、次轮 risk 0（L417/434），仅最终零风险计划满足落盘条件。 |
| 不可写/文件无效 | I/O/目录/原子替换失败由 write 返回 false 并打 WRITE_FAILED；损坏、超大、重新校验非零可 miss。本轮可见日志未见 WRITE_FAILED；零风险 ACCEPTED 在 write 返回之后，支持落盘成功，但没有目录/留存快照，不能证明后续每个文件仍存在。 |
| 容量/TTL/清除 | 256/64MiB 淘汰及显式 clear 有代码路径；块缓存无 TTL。没有设备文件证据，不能认定本轮由淘汰/清除造成。源缓存 TTL 不直接删除块缓存。 |
| 并发去重 | RUNNING/READY 与 cacheChecked 防重复调度/查盘（Controller `571–628,656–661`）。READY 复用和修复重试属于**未查盘**，不是额外 miss。 |

0929-230749 与本轮可见的重叠 **900 词**逐 ID 比较 text/start/end/precision 均相同，b0–b12 的 ID/区间、protocol/model/prompt SHA/target 也相同，两轮 SOURCE_READY 都为 9684 词/743 coarse cues/127 块。旧轮这些块最终均 risk 0 且可见日志未见 WRITE_FAILED，支持当时 write 返回成功。**这仍不足证明两轮完整 namespace 相同或文件仍在**：未记录整片余下 8784 词、base URL 原值及设备目录；日志不能代替文件留存快照。不能用“首次冷缓存”、安装清除或权限问题填补这个证据缺口。

## 3. 12 次 lookups 与 13 missed units

只取 extended chronological history，避免把顶部 recent 摘要重复计入。`TokenCostAudit.java:176–193` 每次 `recordUnitCacheOutcome` 把 lookups 加 **1**，missed units 加 `total-restored`；它不是文件读取次数或 API 请求次数。

| lookup 记账序号 | 读取的文件后缀 | 来源（D 行号；request） |
| --- | --- | --- |
| 1（2 块） | b0_0_24、b1_25_97 | 启动缓存阶段 L192–194；随后 r3/r4 已 checked |
| 2 | b2_98_180 | L229；r5 |
| 3 | b3_181_242 | L259；r6 |
| 4 | b4_243_313 | L283；r7 |
| 5 | b5_314_382 | L320；r10 |
| 6 | b6_383_474 | L328；r11 |
| 7 | b7_475_571 | L341；r12 |
| 8 | b8_572_628 | L356；r13 |
| 9 | b9_629_686 | L371；r14 |
| 10 | b10_687_776 | L391；r15 |
| 11 | b11_777_850 | L459；r17 |
| 12 | b12_851_899 | L504；r18 |

启动 1 次统计查 2 块，后续 11 次各查 1 块，精确得到 **12/0/13**。r8/r9 是 b4 修复，r16 是 b10 修复，三次不新增 lookup。D:L512 的 seek 后只有在途 b12 接受（L516），没有新查盘路径。R2 的两处记账均传 `currentUnitHit=false`（Controller `534,660`），所以 **current block hits 恒为 0**，不能用它判定盘命中失败。N21b 已移除该死计数器，命中判读改用 cache_hits / REBUILD_CACHE_RESTORED / hit blocks。

新增 `RebuildN21CacheEvidenceTest` 与 `n21/device-140013-cache-evidence.json` 从原件提取原词 0–899、16 次请求/响应与 trace。空临时 cacheDir 同序回放逐次打印 `N21_LOOKUP` JSON（`audit_call`、完整 `identity`/`filename`、`miss_reason=file_not_present`），调用真实 read/记账代码复现 12/0/13；修复打印 `N21_RETRY_NO_LOOKUP;cache_checked=true`。还以真实零风险响应在测试临时目录写入后由独立读取器重新读取，证明同 namespace 可命中，并核对 key 字段变化与 b4 有风险计划拒写。**打印的 namespace 是部分 source 的 replay key，绝非设备全片 key；file_not_present 仅是回放的实际判因。** 设备日志只证明当时 read 未返回有效 plan，不区分缺文件、I/O、读后校验失败或完整 key 不同。

本次 13 次文件读取的 replay namespace 全为 `b20fc931af23742de8f5875e71bed7e8caaf48fd294ba1f797aab3485c9dc77e`，后缀即上表 13 个 block ID；不存在 session 内 namespace 漂移。逐次完整 stdout 在本地 `.verification/n21/cache-lookup-output.txt`，也在该测试的 JUnit XML `system-out`，重新离线跑测试可重建。夹具 35 条 history + 16 条 quality 的 raw 与原文件逐行比较，**51/51 一致**。

导出 manifest 为 `bounded_not_guaranteed`（D:L144），保存质量记录 16 条、可见 r3–r18；累计 API 17/17 不能补造成第 17 条历史请求，也不能直接当作 17 次查盘。

## 4. 复看判读与停止边界

同 session seek：READY 跳过 schedule（Controller `597`），render 读取 `s.plans`（`890`）。既有 `seekBackToGeneratedBlockDoesNotRequestAgain` 验证不增 API；这能确认内存复用，却不能算原盘命中判据通过。新 session：既有 `acceptedResponseIsDurableBeforeImmediateRestart` 验证接受后立即重启，同 key、缓存恢复、零新增 API。无需改 key/写入时机，**无需清缓存**。

第三轮补测建议（本卡不执行）：

1. 同包先看 b0/b1 至 `REBUILD_EVENTS_ACCEPTED;review_risks=0` 且无 `REBUILD_CACHE_WRITE_FAILED`，导出一次诊断记录基线。可先拖回确认译文复用；仅此动作不保证盘读取。
2. 保留 app 数据与缓存，重启同一 app 再进同一视频，或离开视频再进入，确认有**新的 engine session/启动链**。保持模型、base URL、prompt、目标语言与源轨；新安装/清缓存会破坏此次验证的前提。
3. 首两块看新的 `REBUILD_SOURCE_READY.cache_hits > 0`；懒读取看 `REBUILD_CACHE_RESTORED;block=...;network_calls=0`。汇总 `Request-block disk cache.hit blocks` 必须 **>0**，同一计数作用域复看前后应增加；若重新切换了计数作用域则看新作用域值。不能用提供商 cached tokens、current block hits 或仅 REBUILD_REQUEST 判断盘命中；懒读命中也可能先记录 REBUILD_REQUEST，但不发 HTTP。N21b 已移除该死计数器，命中判读改用 cache_hits / REBUILD_CACHE_RESTORED / hit blocks。
4. 新 session 确实查到此前零风险成功块后，`cache_hits=0`、无 RESTORED、hit blocks 无增加且同块重新 `REBUILD_HTTP_BEGIN`，才说明本次没有复用；记录 session/block/prompt hash 与 WRITE_FAILED/ACCEPTED/HTTP。保持原 `hit blocks >0` 门槛，未触发新读取的同 session 拖回标为“未执行盘命中验证”，不改判据、不翻绿。

验证：Zulu JDK 21 + ANDROID_HOME，`gradlew.bat test --offline --no-daemon` 全套 **405/405**（新增 3 项，失败/错误/跳过均 0）；Robolectric 强制 offline，只使用本机既有 SDK 28/35 instrumented jars。Python 单测 **27/27**；`scoreboard/run.ps1` 保持 **4 通过 / 4 既有失败 / 4 未验证**，三类不可见时长全 **0**。ACCEPTANCE.md 与 scoreboard/ 全部 61 个文件复跑前后逐文件 SHA-256 相同。新增 live API **0**，新增输入/输出 token **0/0**；本轮原件既有 37,663 tok 不记入本卡增量。不改产品逻辑、验收判据或冻结证据；建议不执行修复、清缓存、建包或真机。
