# M5d / 任务卡 v1 执行结果

日期：2026-10-25（Asia/Shanghai）。**执行结论：完成待复核；统筹状态：待复核。** 仅F2，停止交回统筹，未下发或执行下一阶段。任务卡 `docs/maintenance/tasks/M5d.md` v1；M5c已统筹接受，入场1.5.8 / local-1.5.8-m5c、746项；公开仍1.5.7。

## 1. 入场、范围和实际修改

- 唯一工作目录 `E:\Projects\DeepSeek morphe-ai-caption-translator`。进入/退出分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`；保留既有已修改/未跟踪/已删除文件，未commit/tag/推送/PR/发布/签名安装/清数据。
- 独占证据 `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5d-01`；入场 `entry.json`、`entry-originals.zip`、`entry-working-tree.patch`、`entry-index.patch`、`entry-ignored-tools.json/zip`、`historical-artifacts.json`、`entry-seal.json`。源码快照是实际工作树原件，不以HEAD代替基线；本批差异 `batch.diff` 和 `exit.json`。
- 生产只改 `translation-core/src/main/java/app/yydarlinker/deepseekcaptions/RebuildController.java`。共用modelEligible和失败原因决策；普通schedule/pendingFocus、page入口及三处实际RebuildApi.translate之前检查Session providerRetry、父retryAt、terminal、sourceOnly和父filter。Session monitor给逻辑准入/门更新排序，不持锁做HTTP、磁盘或等待；准入后建立的门属于已合法准入的重叠调用，内部协商原规则保留。
- filteredBlocks独立于READY/FAILED和Plan，Session内seek/resetDisplay不解除过滤，新有效Session重建集合。page/hole失败共用等待/停止决策；repairRejected不依赖独立子Job等于s.jobs，不清别人的Job/provisional。hole使用独立传输Job，旧generation成功不能merge，新代际但同Session的子失败仍建立正确门。
- 发送资格与内容分开：子失败保留已验证Plan/事件、READY及已显示译文；terminal配置故障在存在有效Plan的块继续显示该内容，无内容时保留原提示/空白规则，不加原文兜底。过滤只停本父块，其他父块可成功；configuration停止本Session所有新模型逻辑调用。
- 普通执行端门拒绝仅返还自己仍拥有的attempt/repair/slow reservation，临时门后恢复WAITING以便原语义修复到期继续。page的queuedPages独立保存未准入归属，执行拒绝退key/count，历史set的128清理不丢返还资格；已经合法准入/失败保持记录、原每父块4次及同页去重。hole门前拒绝不增加slowRetries，pendingHoles/queuedHoles只在既有kick恢复原来尚未花的一次hole额度，无新timer/线程/全局费用预算。
- `RepairAdmissionTest.java`新增24项；139个入场测试文件原字节未改，无删测/skip/黄金期望更新。`gradle.properties`仅captionBuildId为local-1.5.8-m5d；产品版本1.5.8不变。来源只更新Controller目的哈希、adaptation_scope及派生patch；固定上游commit/snapshot/upstream_sha256、其他记录/new_files、协议/提示词/Hook ABI与工具保持。
- 文档：当前网络/状态合同、维护README、路线、PROJECT-STATE及字节相同镜像。原M5a/M5b/M5c调查/结果/复核/矩阵/XML和旧候选保留。

## 2. 红测、绿测和HTTP事实

生产未改的m5c上仅运行两条相关应有断言，未重跑746项。`red-baseline.json`核对所有入场/src/main字节及Controller/测试/XML哈希；`red.xml`为2 tests / 2 failures / 0 errors / 0 skipped，每例2 batch / 2 attempts / 2 fixture POST。真实429带Retry-After=300形成实际等待后，page仍发第二POST；普通400 inspected形成content_filter后，同父块page仍发第二POST。期望均为1，服务端原请求、原响应和时序在system-out。**这是受控环境旁路/额外POST证据，不是实际收费证明。**

修复后同两方法体/应有断言保持，相应HTTP均降为1；`green-red-pair.xml`记录2项转绿。`targeted-results.json`逐方法比较红/最终原方法体哈希。之后增强的是fixture清理/观测及其他边界，未放松红测断言。

最终针对性78项：RepairAdmission、RetryAfterContract、NetworkFailureContract、AttemptAdmission、PublicationLifecycle、StreamingDisplay、CoreSessionIntegration、ContinuousDisplay和N52DisplayRepair。独立重复新增24项，均失败/错误/跳过0。两轮新增用例均47 batch / 46 attempts / 46 received；本次完整验证的24项也单独从最终XML解析，见 `http-attempt-scope.json`。

| 最终完整验证中的新增用例 | logical batch | audit HTTP attempt | fixture received |
| --- | ---: | ---: | ---: |
| `pageCapAndAdmittedFailureDedupRemainFourWithoutSamePageRetry` | 4 | 4 | 4 |
| `ordinary429MustBlockPageWithoutSpendingItsQuota` | 1 | 1 | 1 |
| `page503EstablishesGatesPreservesPlanAndDifferentPageRecovers` | 2 | 2 | 2 |
| `blockedHoleSpendsNothingAndOriginalSingleHoleCanRecover` | 2 | 2 | 2 |
| `queuedOrdinaryRechecksFilterAndConfigurationWithRetainedReadyPlan` | 2 | 2 | 2 |
| `hugeChildDelaySaturatesBothGatesAndNeverWraps` | 2 | 2 | 2 |
| `queuedOrdinaryRechecksChildGateAndReturnsAttemptAndRepairQuota` | 2 | 2 | 2 |
| `overlappingShortChildFailureCannotShortenEstablishedGates` | 2 | 2 | 2 |
| `queuedPageRechecksWaitReturnsReservationAndRecoversAtDeadline` | 2 | 2 | 2 |
| `legallyAdmittedPageCancelledBeforeFirstAttemptKeepsItsReservation` | 1 | 0 | 0 |
| `oldGenerationSuccessfulHoleCannotMergeIntoNewDisplayGeneration` | 1 | 1 | 1 |
| `boundedHistoryClearCannotLoseOwnershipOfDeniedQueuedPageQuota` | 2 | 2 | 2 |
| `deferredQueuedHoleRechecksChangedGateAndNormalKickRecovers` | 3 | 3 | 3 |
| `finishFilteredHoleStopsOnlyParentAcrossSeekAndFreshSessionWorks` | 3 | 3 | 3 |
| `hole429EstablishesGatesForOrdinaryAndPageWithPlanRetained` | 2 | 2 | 2 |
| `sourceOnlyHasZeroModelsAtAllThreeEntries` | 0 | 0 | 0 |
| `queuedPagesRecheckFilterAndTerminalWithoutSpendingQuota` | 2 | 2 | 2 |
| `childConfigurationFailureKeepsAlreadyDisplayedTranslationAndGuardValid` | 1 | 1 | 1 |
| `providerAndLocalWaitEachGatePageAndHoleThenRecoverAtDeadline` | 4 | 4 | 4 |
| `oldGenerationHoleCannotPublishButItsFilterStillStopsSameSessionParent` | 1 | 1 | 1 |
| `pendingSlowRetryDeniedByNewWaitReturnsReservationAndCanResume` | 2 | 2 | 2 |
| `childConfigurationStopsEveryNewLogicalRequestButRetainsContent` | 2 | 2 | 2 |
| `inspectedPageStopsOnlyParentAcrossSeekAndFreshSessionWorks` | 3 | 3 | 3 |
| `ordinaryFilterMustBlockSameParentPage` | 1 | 1 | 1 |
| 合计 | 47 | 46 | 46 |

上述是各用例所有正负/恢复对照总数，不是全部都被门拒绝的数量。COUNTS时序另记父attempt、page、slowRetries、session repairs、retryAt/provider与terminal。47比46多的1 batch来自合法逻辑准入的page在audit begin时被STOPPED：page额度保留，0 physical attempt/0 HTTP；M5c原用例另保护物理attempt准入后取消的1 attempt/0 HTTP。不能将这些单位视为消费/退款。

实际执行链：普通translate→真实429/408→rejected/applyFailure→page/hole/schedule拒绝，provider与仅retryAt分别推进300秒且门前1ms无新增batch/attempt/POST，到期page实际POST/合并；被拒hole尚未花额度，经真实kick恢复。page→真实503→repairRejected→父/provider门，保留旧事件且另一页到期可请求，同失败页仍去重；hole→真实429→同门→普通/另一个子范围拒绝，到期page实际恢复。超大wire值使两deadline为Long.MAX_VALUE；已准入短hole失败晚于长page失败到达时，不缩短已有父/provider等待。

过滤/终止链：普通400 inspected的同父page红绿；page inspected422、hole200 finish_reason各自建立父filter，保留READY也不能通过普通/page/hole，seek不解除；同Session其他父块可实际POST成功，新Session正向成功。page/hole401实际终止Session，不销毁旧Plan。原网络分类、stream降级、协商、finishSent、STOPPED、publication/cache、源/CC/配置切换由针对性及完整既有回归补充。

排队链：以有界latch扣住两个真实priority worker，排入真实page或普通任务，其间用真实HTTP失败建立wait/filter/terminal，再放行；执行端拒绝且归还未准入资格。普通语义修复到期重新schedule成功；pending slow reservation也返还后按原上限恢复；递延hole排队后再次建立等待，执行拒绝不花slowRetries，正常kick在门前1ms不发、到期POST成功。历史set清理与queued page归属另有回归。没有新增Thread.sleep碰时序；所有新HTTP仅本地fixture、未映射源抛错/模型路径拒绝，测试finally释放latch/Future/队列并还原Host/Audit/Output，停止连接。

开发阶段失败原件保留：首次red因PowerShell未引用点号-P参数，Gradle在测试前拒绝receipt；随后fixture visible=true让render grace掩盖旁路，0失败结果单独归档，不作为红测。targeted-02/03的显示layout未初始化、重复block时窗选错焦点、fixture人为visible=false导致guard无效均按实际错误修正前置条件，日志/XML保留。候选负向证据脚本最初误把新候选作为old输入，正确地通过正向检查后触发脚本断言；`negative-fixture-selfcheck-not-old.log`保留，纠正为冻结m5c路径后3条真正负向均拒绝。没有为这些前置失败放松产品断言。

## 3. 最终实际命令、完整入口和身份

所有项目输出/临时/证据在E:，开发入口使用workspace-local TEMP/TMP、Gradle/Android user home，未改全局Windows环境/共享缓存。完整有效argv、退出码与日志对应见本轮 `commands.json`；针对性CLI中附带的ProviderEndpointTest过滤名属于extension，不计入78项core结果，extension由完整入口实际执行。

```powershell
.\.devenv\dev.cmd :translation-core:testDebugUnitTest --tests app.yydarlinker.deepseekcaptions.RepairAdmissionTest '-Pverification.buildRoot=build/maintenance/M5d/20261025-M5d-01/red' --init-script tools/verification.init.gradle '-Pverification.receipt=validation/runs/20261025-M5d-01/red-receipt.json' '-Pverification.rerunTests=true' --offline
# 同入口targeted以报告列出的9个实际core suite作--tests过滤；最终78项，repeat只RepairAdmissionTest 24项。
work/toolchain/python/python.exe -B -X utf8 tools/record_core_provenance.py --check
.\.devenv\verify-full.cmd -RunId 20261025-M5d-candidate-01 -EvidenceDirectory validation/runs/20261025-M5d-01/final -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m5d -Offline -RerunTests
powershell.exe -NoProfile -ExecutionPolicy Bypass -File validation/runs/20261025-M5d-01/run-composition.ps1
work/toolchain/python/python.exe -B -X utf8 validation/runs/20261025-M5d-01/dex-audit.py
```

完整入口由 `full-and-archive.ps1`执行并在下一Gradle前立即复制同次compiled core；日志 `full.log`、`final/gradle.log`、实际receipt/XML及前后manifest在final；编译归档 `compiled-core-from-full/`、`compiled-core-archive.json`（逐文件与同次原目录比对、绑定receipt/指纹），归档后独立复查compiled/UI/MPP/MPE边界通过。没有借用旧轮次classes或只用全套绿代替F2红绿/组合。

- 最终完整：core **311 tests / 0 failures / 0 errors / 0 skipped**；extension **459 / 0 / 0 / 0**；共 **770**，两组均本轮实际执行，非UP-TO-DATE旧XML。完整入口退出0，来源/协议/提示词/ABI、本地化14语种232键、release/verification自检、候选凭据/包内与compiled边界均通过。
- 固定输入指纹 `a07e9693da61061498531983879db27a1b8920f1cd56d8104583ef54180fc135`，最终复算相同；`full-xml-manifest.json`保存实际XML哈希/计数。没有无理由重复全套770项。
- 负向：冻结m5c冒充m5d、当前MPP配m5c独立MPE、local冒充release均退出1；实际命令与日志 `negative-gates.json`。未下载/覆盖历史包。
- 候选MPP：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5d-candidate-01\patches-1.5.8.mpp`；SHA-256 `127e01ee5d7d33c510600a069092e01126a3a43b38d5d85e684b28915ba59e24`。
- 独立MPE：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5d-candidate-01\extension.mpe`；SHA-256 `ac122db112139bcde5b5fa785ff02933468578a9a4402b806ddef41a5942a89a`，与本MPP内嵌扩展同字节。
- UI APK：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5d-candidate-01\ui-preview-debug.apk`；SHA-256 `8d78932840498183194a013293ba56075e0b8288533da09a8fbe07d5149a13dc`。
- 版本 **1.5.8 / local-1.5.8-m5d**；公开 **1.5.7 / release-1.5.7**不变。

## 4. 本卡新候选真实组合和DEX审计

输入：同一原始21.41.525-SECONDARY APK SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`；官方MPP1.48.0 SHA-256 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`；实际运行Patcher2.0.0 SHA-256 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`。输入路径/哈希、运行classpath与选择均归档，不自动找最新包。

104个官方默认根+AI caption translator，真实verifyComposition含资源重编译及auditComposition均退出0。脚本 `run-composition.ps1`、`composition-command.json`、`composition.log`、`composition-audit.log`、两份exit/runtime JSON；输出 `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5d-01\composition-M5d\patched-unsigned.apk`，SHA-256 `02ee10a81c8157cbd72d1af7fb91202a9084807772472072c40542b126571fef`。未签名/安装。

独立DEX/ZIP结构审计：`candidate-structural-diff.json`、`composition-structural-diff.json`。对冻结m5c候选，MPP仅manifest与extensions/extension.mpe内容变更，根补丁DEX/其他资源及Hook方法签名保持；扩展无测试/回环类泄漏。组合APK仅classes13.dex变化，其余18390条目同字节；64565类定义无重复，RetryAfter恰一份；选择/104根与m5c相同。允许的新增类仅Controller编译产生的synthetic辅助，实差以JSON为准，不将扩展变化误称所有DEX字节不变。

## 5. 保护、未覆盖和安全回退

- 入场Git可见文件2205个；本批范围外文件2196个、历史交付/候选/证据文件189545个、六个忽略前端全部按SHA-256通过；分支/HEAD/暂存内容保持。158个其他/src/main文件与139个既有/src/test文件原字节保持，F4/读取方法体不改；细节 `source-protection.json`、`protection.json`、`exit.json`。历史源码来源快照/协议/ABI守卫及原任务卡/复核/结果保持。PROJECT-STATE与镜像字节相同。
- `rollback-manifest.json`记录每个本批可恢复文件的entry/exit SHA、entry ZIP成员和退出原件；`rollback.py --check`已执行且只检查。**先检查退出哈希，匹配后才允许逐文件恢复**，任何后续修改/路径越界/快照哈希不符即拒绝。示例 `work/toolchain/python/python.exe -B -X utf8 validation/runs/20261025-M5d-01/rollback.py --restore gradle.properties`，仅示例、未执行恢复。需要完整源码回退时按manifest逐项选出Controller、新测试、build ID、来源JSON/patch及当前合同/入口/状态与镜像；状态文件成对选择。新测试只在仍匹配本轮退出哈希时删除，已有文件恢复入场字节，入场前修改不丢；不reset/clean，不覆盖后续工作。结果报告、证据和新旧候选始终保留。
- 无用户数据或缓存格式迁移，回退不是卸载/清数据；旧MPP不宣称能恢复用户数据。候选保护含m5c冻结MPP/MPE哈希和所有已有交付，不重写旧资产。
- 未覆盖远端CI、其他APK/官方选择/语言设备组合、真实Android设备UI/性能、真实供应商/收费/TLS/退款、全部HTTP状态码×子路径×stream乘积和任意宿主线程交错。fixture使用局部真实控制器入口，只有递延恢复特例明确经过正常kick，不冒称每项都从宿主hook端到端触发。合法逻辑准入后的重叠门建立不撤销该调用，物理attempt仍由M5c生命周期保护，不承诺字节原子性或零收费。
- 没有缺失本卡规定的原始APK/官方MPP/Patcher输入；上述未覆盖不冒充通过，也未以770绿测替代红绿或组合。F3保持同语义缓存复用，F5保留原诊断格式，未进入M6等其他任务。

需要统筹判断：复核本卡实现、红绿、门/内容/额度的独立资格、候选与组合证据后决定是否接受F2范围。下一步仅建议统筹复核；执行已停止，不自行接受或进入下一阶段。
