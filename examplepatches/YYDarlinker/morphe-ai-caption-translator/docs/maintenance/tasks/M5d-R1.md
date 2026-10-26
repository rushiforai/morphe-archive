# M5d 补正01 — 保留同一父块已经建立的较晚等待

任务ID `M5d-R1`；2026-10-25下发。属于[M5d v1](M5d.md)的补正，不进入下一维护阶段。M5d原交付770项及组合证据保留，但统筹复核发现可动态重现的等待旁路，**F2完整闭环暂不接受**。先读[M5d统筹复核](../reviews/M5d-REVIEW.md)。

## 1. 已复现问题与应有行为

当前交付 `1.5.8 / local-1.5.8-m5d`，源指纹 `a07e9693da61061498531983879db27a1b8920f1cd56d8104583ef54180fc135`。冻结MPP `build/maintenance/M1a/20261025-M5d-candidate-01/patches-1.5.8.mpp`，SHA-256 `127e01ee5d7d33c510600a069092e01126a3a43b38d5d85e684b28915ba59e24`。入场核对，保护原件和已有修改。

统筹探针在实际RebuildApi/Controller和本地HTTP中固定以下顺序：

1. 普通请求已发出，扣住它的HTTP408响应。
2. 同父块hole合法准入，收到HTTP408、Retry-After=300；建立retryAt=300100，providerRetry=0。
3. 释放较早普通请求的无Retry-After 408；普通rejected→applyFailure将retryAt改成1300。
4. elapsed推进到1300，再触发page，服务端收到第3个POST；原300秒等待尚未到期。

原有24项只覆盖较晚返回的子失败保留门，遗漏较晚返回的普通失败。根因是保留已有较晚父块deadline只包在repairRejected里，普通applyFailure仍直接赋值。

**本次明确采用：同一有效Session/父块已经建立、仍有效的等待截止点，不能被后来较短的失败或任务收尾缩短。** 普通和子修复应用同一规则；已有provider门继续取max，安全相加保持。等待自然到期后，按原资格恢复；新会话及原本明确的失效/重建边界仍依当前合同。不能靠禁止所有408、丢弃Retry-After、全局延长固定backoff或冻结所有补翻译解决。

这是M5d原等待合同的补足。已合法准入的重叠调用仍可按原作用域完成，但它的晚到结果不能让**后续新逻辑调用**提前发送。该缺陷与“准入后不承诺物理零字节”属于不同边界。

## 2. 最小修复范围

- 首选在RebuildController的共用等待更新边界处理，避免普通/子路径各有不同规则。审查本卡相关retryAt写点：applyFailure、repairRejected，以及同父块并发时的取消/slot释放和修复收尾写入。分别给出保留门或依据现有明确失效规则重建的理由；动态覆盖直接相关、实际可达的交错，不要求虚构所有线程排列。
- 保留modelEligible、入口/执行端复查、filteredBlocks、terminal、有效Plan/事件/显示、queuedPages和pending/queuedHoles的归属与原配额。被门拒绝的未准入任务正常返还，已准入记录保留；不增加page/hole次数或新timer/线程，不重构整个Controller。
- F1共享RetryAfter及饱和运算、F4每次物理attempt生命周期检查、finishSent/STOPPED/Publication、F3缓存、F5诊断、源/Cookie/协议/提示词/Hook/UI/工具/依赖不改。
- build ID改为 `local-1.5.8-m5d-r1`，version1.5.8、公开1.5.7保持。仅按实际生产diff更新core目的哈希/适配说明和派生patch，固定来源/ABI/字面量和守卫不变。

## 3. 红绿与回归

统筹证据目录 `validation/runs/20261025-M5d-coordinator-review/`：

- `blocking-finding.json`、`probe-02-xml/`、`probe-02-gradle-receipt.json`、`probe-02-tests.log`。
- `probe-source/app/yydarlinker/deepseekcaptions/M5dCoordinatorProbeTest.java`及`probe.init.gradle`。探针位于证据目录，通过临时init增加test source；未修改生产或既有测试文件。复用时先理解其夹具，不盲跑其他历史脚本。

先在未改m5d生产代码上将等价回归纳入合适的正式测试，取得相同应有断言红测，再最小修复并转绿。保留“普通已发/扣响应→子失败长等待→普通晚到短失败→门前无新POST→到期可恢复”的实际HTTP/时序/计数，不能只断言一个新max helper。

至少验证：

1. providerRetry=0时，父块retryAt单独仍保护page、hole和普通新逻辑调用。明确证明门前1ms不发、到期后合法请求真实成功；保留Plan和原配额。
2. 普通/子失败两个顺序共用同一原则；较晚provider门、超大饱和等待仍保留。取消/收尾相关写点按实际可达性补必要回归，防止只修失败分支而另一个写点抹掉同一个门。
3. 原24项RepairAdmission、M5b/M5c、Publication及显示/源模式等回归继续有效；只做少量重复或顺序检查，所有网络仅fixture、有界latch/Future与受控时钟。

注意有两项旧测试明确刻画了“普通失败覆盖父块deadline、由provider另行兜底”的旧细节：

- NetworkFailureContractTest.controllerWaitUsesMaximumAndProviderGateWithoutSleeping
- RetryAfterContractTest.shorterServerDelayCannotShortenLocalBackoffOrExistingProviderGate

允许按本卡强化后的合同更新直接冲突的父块deadline期望，保存旧→新映射。保留provider不缩短、backoff与服务端等待取长等原有效断言；需要时在无旧长门的独立Session证明15秒本地backoff，不能删除该保护或把所有期望换成宽泛不等式。其他既有断言非直接冲突不得放松；全部变化如实列明。

## 4. 交付、保护及停止点

只在E:活动仓库、原分支/工作树执行，遵守AGENTS和维护入口。保存本轮入场原件及本批diff；保留M5d原结果、封存证据、统筹探针和新旧候选。保护历史资产与证据不授权清理；无需为数字增加再次枚举所有解码中间文件，采用与实际范围相称的清单并准确披露复查口径。

固定来源/源码/测试后，已接受verify-full入口以 `1.5.8 / local-1.5.8-m5d-r1`、Offline和RerunTests完成两组真实验证，新候选/独立MPE/UI/负向身份检查；归档同次compiled证据。生产改变后仍需相同原始21.41.525-SECONDARY/官方1.48.0/Patcher2.0.0/104默认根+AI的真实组合和既有DEX审计，保护其他资源/Hook/条目。各次Gradle顺序执行，先归档报告再开始下一次。

新证据独占 `validation/runs/<date>-M5d-R1-<unique>/`；新结果 `docs/maintenance/results/M5d-R1-RESULT.md`。保留原 `M5d-RESULT.md`原字节，其历史770结果仍有效，但不代表这次发现的缺口已关闭。补正报告说明实际修复、红绿/请求、旧断言映射、完整结果/来源/组合、候选身份、未覆盖、保护和退出哈希检查的逐文件回退。

更新当前合同、维护入口/路线、PROJECT-STATE及字节相同镜像，执行完成待复核，统筹保持待复核。修正后以实际结果判断是否完成原M5d全部要求，不自行接受，不进入M5e/M6或其他阶段。

不commit/tag、推送/PR/发布、签名安装/清用户数据、真实供应商/付费API或共享缓存清理，不reset/clean。无新增产品取舍需要非程序员用户决定；范围外发现如实列出。
