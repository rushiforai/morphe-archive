# N13 / A14：生成层根因与修复边界

## 冻结证据与结论

证据 `D:Lnnn` 指根目录 SHA-256 为 `13b1f29cdf6ea180dadb67bf91de6a7b085412fb132880d8cd07585cf5ac5171` 的 `caption-diagnostics-1.3.5-20260929-155802.txt`；裁决见 `docs/N11-A14-REVIEW-ROOT-CAUSE.md`。block `b17_1219_1299` 的首事件 `1219–1240` 把上一句的宾语延续“foreign investment and the explosive economic growth that would follow”与下一句“deng reduced the share of gdp ... focused on the pla”并在同一事件。request 21 的中文使“外资／增长”成为“降低”的主语，review 标记 `possible_subject_attachment`（D:L401–409、L646）。正确主语应为邓小平；保留该语义硬拦（`RebuildReview.java:43–45,143–150`）。

### 切分层：句界证据缺失，事件界未被强制

外部语境文字在 `follow. Deng` 处有句号和大写，足以解释应有句法，却**不是冻结视频逐字稿**。冻结 request 21/22 的 `owned_tokens` 实为 `[1228,"follow"],[1229,"deng"],[1230,"reduced"]`，全部小写、无句号；原 SRT 同样写作 `economic growth that would follow` / `deng reduced ...`，无句号或大写（根目录 SRT 第 782–788 行）。因此“句号＋大写起句”无法在此源上触发，不能假造标点或修改源词。`RebuildSource.terminal` 只检测实际词尾标点（`RebuildSource.java:124–126`）。

`RebuildPlanner.plan` 只划分网络请求块，依据时长、字数、实际 `boundary` 和资源切点选择（`RebuildPlanner.java:30–70,137–143`），不负责模型输出的事件切分。`boundary` 不把 cue 换行当句号；冻结 `follow→deng` 没有静默或 speaker 标记，故本处不构成强源边界。`RebuildProtocol.payload` 仅把高分切点列入 `suggested_clause_starts`，把主谓依赖列入 `avoid_event_end_after`（`RebuildProtocol.java:100–121`）；两者均为生成提示。`RebuildProtocol.parseInternal` 保证源词覆盖和强依赖边界，但不强制在 `follow | deng` 切事件（`RebuildProtocol.java:175–228`）。于是 request 21 可结构性接受跨句事件。这里的主因是**无标点源上的事件生成与修复约束不足**，不是 planner 的 127 块分配错误。本卡不改 planner 规则；仍离线核对全量块边界。

### 修复层：软提示、评分平局、单轮上限

request 22 的 payload 已给出 `avoid_event_end_after=[1229]`（D:L647），但模型仍在 `deng | reduced` 之间切成 `1219–1229` 与 `1230–1240`。`RebuildPlanner.protectedCut` 将这种词汇主语＋限定动词切点识别为依赖（`RebuildPlanner.java:97–109`），而解析器仅硬拒 `strongDependentEnding`（`RebuildProtocol.java:218–219`）；旧 review 对候选只记 `dependent_boundary`（`RebuildReview.java:72–73`）。候选与首案各 1 个待修风险，`prefer` 的语义/切分/数量评分平局保留首案，产生 `REBUILD_REPAIR_NO_PROGRESS`（D:L414–417；`RebuildReview.java:162–187`，`RebuildController.java:667–672`）。该平局保护并非可靠的禁切规则：若其他风险数改变，切开主谓的候选仍可能胜出。

`RebuildReview.shouldRepair` 的 `attempts<2` 与 `RebuildController.schedule` 的普通 `maxAttempts=2` 共同限制为**初译＋1 轮 repair**（`RebuildReview.java:199–200`；`RebuildController.java:598–616,678–683`）。会话总上限为 6 次 repair（`RebuildReview.java:8`），调度时计数（`RebuildController.java:609–616`）。N13 应对已有 `possible_subject_attachment` 风险拒绝任何把对应主语和 `reduced` 分属两个事件的候选，语义风险允许初译＋最多 2 轮 repair；会话上限不放宽，已发出的轮次和 token 逐笔记账。

### 模型层（记录，不实施升级）

冻结请求采用 `qwen3.8-flash`，且 request 21/22 均对无标点 `would follow deng reduced` 产生错误的中文主语或错误切点（D:L646–647）。这说明模型对该局部句法有困难；本卡仅修确定性候选约束与有限重试，不修改 prompt、review 安全网或缓存。

## 确定性修复与稳定性护栏

- **修复层而非切分层**：`RebuildReview.java:175–192,211–215` 仅在原 plan 已命中 `possible_subject_attachment` 时，依据冻结源词 `would follow deng reduced` 锚定被标记的主语 `deng` 与谓语 `reduced`；任何候选在两词间切事件均不能替换原 plan，**即使**候选的其他风险减少。没有修改提示文本、review 风险阈值、源词、缓存和 `RebuildPlanner.java`。`RebuildController.java:669–678` 对被拒候选记录 `REBUILD_REPAIR_SUBJECT_SPLIT_REJECTED` 和原有的无进展告警；安全兜底保持不变。
- `RebuildReview.java:8–9,172–174,226–229` 与 `RebuildController.java:598–618,684–689` 对有可修语义风险的同一块允许**初译 1 次＋repair 最多 2 次，共最多 3 次**；普通候选仍是 2 次，session repair 总量仍为 6。每次真正调度再递增 `attempts`/`repairCount`，`REBUILD_EVENTS_ACCEPTED` 写出尝试次数；未发出的取消请求不作为已消耗的网络轮次（`RebuildController.java:720–723`），缓存读取沿用 N12 原行为，不作改动。先保留旧合格计划，不因无进展降低质量分数；到期或耗尽预算后仍显示原文。
- **先离线重放，后决定不动 planner**：`RebuildN13PlannerReplayTest.java` 用冻结 9,684 词的 SRT＋已捕获词时间重建源文，对 HEAD 原 planner 的完整 124 块切点表与 N13 当前同源重放：**0/124 块偏移，偏移清单 `[]`**（`scoreboard/results/n13-planner-stability.json`）。N11 设备日志实际记录 **127** 块、但仅有 **30** 个可读到的块 ID/切点；30 项与重建结果中 29 项相同，第 26 块日志 `to=2020`、重建 `to=2026`，是*重建输入的预存差异*，不是 N13 planner 漂移。剩余 97 个真机切点没有完整日志，不能冒称完成了严格的“127/127 真机切点比对”；因 planner 文件与 HEAD 完全一致，本次规则变动引起的边界偏移为 **0**，不存在触发“>5 块即停止”的 planner 改动。严禁把重建的 124 块冒充冻结真机的 127 块，也未为凑数改动源词／时间。

## 验证、预算与判据

- 本地 fake：`RebuildN13A14GenerationTest` 在冻结 request 21/22、冻结 9,684 词上重放；验证弱提示会放过 `deng | reduced`、新增硬拒即使候选风险较少仍生效；合成**正确且完整源词覆盖**的 1219–1228 / 1229–1240 响应可通过**生产 `parseBound`**，review 0 风险。既有集成 fake 验证第三次仍有语义风险时停止（初译＋2 repair）、session 上限不变。
- live **仅 b17**、冻结 request 22 repair 输入和同一 `qwen3.8-flash` / prompt SHA-256 `d841cf104e07cb2330f3143c538981979f8ba062dc6582c322f6dc8460ad0379`；未发邻块、未改 prompt。2026-09-29 UTC 两次请求的 `prompt/completion/total` 分别为 **2,295/367/2,662** 和 **2,295/362/2,657** token，累计 **4,590/729/5,319**；2/4 次、<10,000 token。原始带时间戳存档：`scoreboard/results/live-n13-block17-20260929T101357579301Z.json`、`scoreboard/results/live-n13-block17-20260929T101501957373Z.json`（遵循已有 `live-*.json` 本地忽略规则）；提交的摘要账本 `scoreboard/results/n13-live-ledger-20260929.json` 记录逐笔 token、原件 SHA-256、配对审计文件。上述 token 是 **N13 增量**，不与 N9 冻结的 82,521 token 混算。
- 两次 live 源覆盖均有效且 finish=`stop`；生产解析器审计 `scoreboard/results/n13-parser-20260929T101357579301Z.json` 和 `scoreboard/results/n13-parser-20260929T101501957373Z.json` 均得到 **review 1 风险** (`possible_subject_attachment:1219–1240`)，邓小平**不是“降低”的主语**；均不可安全上屏。两个响应在同一首事件复现“外资／增长降低了……”；不是 parser 错误，不把 risk=1 假报为通过。未为碰运气继续烧第 3、4 次请求。**成功判据未达成**；冻结 A14 的语义硬拦及 N9 原文兜底保持，生产解析通过≠语义通过，也无新的真机 PRESENTED 证据。难块升级建议见 `docs/N13-A14-HARD-BLOCK-MODEL-PROPOSAL.md`，仅建议、不实施。
- Java 21 离线 debug 单测 **360/360**；Python 计分板及 N13 限额单测 **25/25**，`scoreboard/run.py` 重跑 A01–A12 保持通过 4 / 失败 4 / 未验证 4；`scoreboard/n9.py` 的 A13 未验证、A14 真风险裁决与 `scoreboard/n10.py` 的旧事实不变。`ACCEPTANCE.md` A14 的“错误译文不得上屏”判据**未被改动**；若将来提议改为“正确译文可上屏”，必须标注“待用户确认”，本卡不直接改。
