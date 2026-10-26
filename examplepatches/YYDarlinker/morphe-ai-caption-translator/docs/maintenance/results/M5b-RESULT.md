# M5b v1 执行结果 — 完成待复核

日期2026-10-24（Asia/Shanghai）。仅执行M5b v1；执行完成，**统筹待复核**。活动仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`，证据目录 `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M5b-01`。文中证据文件名相对此独占目录；命令均在活动仓库执行。没有进入F2–F5或其他阶段。

## 入场身份与保存

- 进入/退出分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`。没有切分支、另建worktree、commit/tag、推送、PR、发布、签名安装、清数据或真实付费模型调用。
- 入场2197个Git可见文件，包括已有未提交/未跟踪工作，保存在 `entry-originals.zip`、`entry.json`、`entry-working-tree.patch`、`entry-index.patch`；镜像另入ZIP。入场指纹 `8bfb5b6a6945267a497a664706dd36212a580f6986b199f968ec7f8034133807`，ZIP SHA-256 `9ad3fba59141f0fe1c9813d7623cb37ffdfc7ce1083422170af1a28a309ddc2c`。本批diff按入场字节，不把HEAD累计修改算成本轮。
- `entry-ignored-tools.json` / ZIP冻结实际使用的六个忽略前端：dev.cmd/ps1、verify-full.cmd/ps1、Enter-Dev.ps1、workspace.init.gradle。`historical-artifacts.json`冻结8848个历史交付/候选文件。保护工具、缓存和旧证据，不移动共享C盘工具。
- 入场M5a候选 `build/maintenance/M1a/20261024-M5a-candidate-01/patches-1.5.8.mpp`，SHA-256 `939ccdbcc3e532cbb45a37cff2726a4d9dfcadef94557e43e355d8d3b407a7f8`。入场生产1.5.8 / local-1.5.8-m4a；公开仍1.5.7。

## 最小修复及合同

1. `caption-shared/.../RetryAfter.java`：复用现有RFC_1123_DATE_TIME日期路径。trim后纯ASCII数字按秒处理，逐位累积饱和，仍继续验证所有字符，避免超长数字parse溢出变0或非法尾字符被接受。秒→毫秒超过边界饱和到Long.MAX_VALUE，无120秒或其他短cap。日期差值和after加法也饱和，负delay作0。
2. `translation-core/.../RebuildApi.java`：只将原parseLong/min120替换成共享RetryAfter调用。日期使用wall clock算剩余delay，请求体、认证、协商/stream、deadline、blocked与终态不变。
3. `translation-core/.../RebuildController.java`：只改直接接收wait的sourceRetry与rejected中的retryAt/providerRetry。后两门捕获同一个elapsedRealtime；仍取本地backoff与serverDelay较长者，providerRetry仍与已有较晚门取max。邻近“失败回显原文”的陈旧注释修正，实际显示路径未改。
4. `gradle.properties`仅captionBuildId改local-1.5.8-m5b；产品version仍1.5.8。公开元数据、字幕/分页/Overlay、AI/CC/语言、超时/并发/次数限制、缓存/配置/诊断、依赖、验证工具、CI和发布链保持入场字节。

缺失、空白、无效、负值、带符号（如+2，不属于delta-seconds数字语法）和过期日期回退0，由原本地等待策略接管；0不会忙循环。超大但语法有效的正数饱和，不视为解析失败；最大可精确毫秒秒值为Long.MAX_VALUE/1000，其下一值开始饱和。有效未来GMT日期按请求前后wall-clock界限校验；已有elapsed门不重新解析日期或读取wall clock，后续系统日期变化不会缩短它。没有新增sleep/timer或改变主线程行为。常见GMT日期已验证，未实现/认证全部obsolete HTTP-date形式，不声称完整RFC认证。系统时钟跳变的设备实测未做。

## 红测、绿测和实际等待

生产未改时运行：

```powershell
.\.devenv\dev.cmd :translation-core:testDebugUnitTest --tests app.yydarlinker.deepseekcaptions.RetryAfterContractTest --offline
```

`red.log` / `red-exit.txt` / `red-xml/`保存退出1、2 tests / 2 failures / 0 errors / 0 skipped：300秒实际120000ms，未来日期实际0。红测源码由 `prepare.py` 从入场helper加两项应有行为断言生成；最终冻结 `red-test-source.java`、`red-baseline.json`列生产入场哈希和XML哈希。它不是断言旧缺陷合理的现状测试。

修复后针对性运行同入口，分别`--tests ...RetryAfterContractTest`及`--tests ...NetworkFailureContractTest --offline`；`green-01.log` / XML记录9+12=21项通过。最终有效结果统一用源码/测试/来源固定后的完整入口，不混用旧XML。

| 新增测试 | 观察与结果 |
| --- | --- |
| providerKeepsThreeHundredSeconds / providerKeepsFutureGmtDate | 同红测应有断言绿；真实429保持300000ms，503日期在请求前后wall-clock界内；各1 HTTP |
| fixedClockParsingAndSaturatingArithmetic | 固定now验证17/300秒、未来/等时/过去日期、缺失/非法/空白/负/带符号/超长非法尾；乘法临界、超long数字、日期差值和加法临界均通过；0 HTTP |
| ordinarySchedulerWaitsFullThreeHundredSecondsAndRecovers | send→Failure→真实rejected→schedule/dispatch→真实POST→接纳：elapsed=300099时retryAt/providerRetry=300100，HTTP保持1、jobs为空；300100时HTTP=2、Plan非空且READY |
| ordinarySchedulerWaitsParsedDateAndRecovers | 本次解析delay=299110；elapsed=299209时门299210保持1 HTTP，299210恢复为2并接纳；日期等待进入单调调度，不实际等待五分钟 |
| shorterServerDelayCannotShortenLocalBackoffOrExistingProviderGate | 后续1秒错误仍取第3次本地15000ms，保留原300秒provider门；走过短block门后普通schedule仍不发POST；共2 HTTP |
| hugeWireDelaySaturatesActualProviderAndBlockGates | 三个真实HTTP值9223372036854776、Long.MAX_VALUE秒、超long纯数字均产生Long.MAX_VALUE delay；实际双门饱和，推进300000ms仍不发；隔离block门亦不发，较短503仍保留较晚provider门；共3 HTTP |
| sourceLoadFailureSaturatesActualSourceGateWithoutBusyLoop | 受控Host抛超大SourceRecoveryPolicy.Failure进入真实load捕获；sourceRetry=Long.MAX_VALUE；推进300000ms再kick三次，load计数仍1、loading=false，0 HTTP；不冒称此项真实源HTTP |
| wireInvalidMissingAndOrdinaryDelaysHaveNoInternalReplay | 429/503 × 17、0、负、无效、空白、缺失，共12 HTTP；Failure与实际block/provider本地回退符合原策略，无内部重发 |

调度测试直接触发真实schedule模拟普通调度事件，时钟由ShadowSystemClock推进；网络与工作线程真实执行，接纳用latch/Plan/READY正向证明。未只看helper/字段，也不冒称完整设备tick或所有page/hole路径。没有新增sleep或修改生产时间常量。fixture仅回环服务器和测试key；源加载未映射时抛错，旧SourceHttpFailureContractTest连/sw.js也显式受控路由，不能回退真实YouTube。

`http-and-gates.json`取自最终归档XML：新增9项共23 HTTP；M5a保留12项provider合同28 HTTP、3项source合同9 HTTP，本组24项共60 HTTP（不含全套其他测试的HTTP）。精确各测试计数、等待门和实际值都在该机器文件与XML的system-out。

M5a断言映射：`providerRetryAfterCurrentDateAndCapDiscrepancyIsExplicit` → `providerRetryAfterPreservesDateAndLongDeltaM5b`，只将date=0/cap=120000改成动态未来日期界限/300000；17秒、无效/负/缺失、6次HTTP及audit、非configuration与HTTP_CONFIG诊断计数保持。其他11项网络合同方法及其余既有测试原字节不变。历史M5a报告/矩阵/XML/原件全部保留。边界/策略回归由完整套件中的401终止、429恢复、deadline/取消、协商/stream、源日期/鉴权、视频/配置切换、publication/cache等共同提供。

## core来源审查

`review-before-provenance.diff`审查实际最小生产/旧测试变化；`provenance-reviewed-drift.json`在record前确认仅RebuildApi和RebuildController目的哈希漂移，snapshot均匹配。按授权追加adaptation_scope说明，再运行：

```powershell
work/toolchain/python/python.exe -X utf8 tools/record_core_provenance.py
work/toolchain/python/python.exe -X utf8 tools/record_core_provenance.py --check
```

最终check退出0（`check-provenance-final.log`）。仅两项destination sha256、适配说明与派生 `docs/core-upstream.patch`更新；上游commit `ac65fe803ec2b11821b1131040f807922a2b8505`、snapshot字节、upstream_sha256、其他来源项/新文件记录、protected_abi不变，literal检查通过。共享RetryAfter不在core目的清单中，没有人为添加无上游来源项。未放宽工具/来源检查，未只重算哈希隐藏漂移。原换行约定保留；首次生成的审查diff因读取CRLF方式显示全文件，已用原字节生成最终局部diff，源码未做整文件格式化。

## 完整验证与候选

```powershell
.\.devenv\verify-full.cmd -RunId 20261024-M5b-candidate-01 -EvidenceDirectory validation/runs/20261024-M5b-01/final -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m5b -Offline -RerunTests
```

退出0，`final/summary.json` passed；源码指纹 `ba028a4d4f50d535482f0fb0b5375d5fe1fc1309def4fd81109c855c0d7cbdc7`，前后相同。core **278**、extension **459**，合计 **737**，failures/errors/skipped均0；基线728加9，无删除有效测试。两Test任务均本轮实际执行，编译/构建的64执行、61缓存、51up-to-date按receipt说明，不把有效构建复用写成测试重跑。XML在 `final/tests/translation-core/` 与 `final/tests/extensions-extension/`。

来源/协议/提示词、81 compiled core、独立UI无core泄漏、MPP/MPE、14 locale包、本地化232×14、凭据matches=[]全部通过；工具15项、发布合同14项通过。`negative-gates.json`额外绑定本次候选，旧m4a冒充m5b、错配MPE、local冒充release三项均实际退出1。

- MPP：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M5b-candidate-01\patches-1.5.8.mpp`，585156B，1.5.8 / local-1.5.8-m5b，SHA-256 `ef74553a70071010db948063f13c3a6c951dd00f6c347d500ad62c4c4f94465e`。
- MPE：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M5b-candidate-01\extension.mpe`，717444B，SHA-256 `6605630528516f973d9ea4a97dd73bdea42029077dc8a8bb6e99e3756ac32274`；内嵌与独立原字节相同。
- 候选沿用已接受工具M1a目录布局，属于本轮M5b；不为路径名改验证工具。
- `candidate-structural-diff.json`：对冻结M5a，MPP条目集合相同，只manifest和extension.mpe内容变化；Kotlin补丁DEX/资源原字节相同。MPE类集合不增不减，Hook/NativeCaptionBridge签名表相同，无测试/退役回环泄漏。

## 真实组合与DEX审计

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File validation/runs/20261024-M5b-01/run-composition.ps1
work/toolchain/python/python.exe -B -X utf8 validation/runs/20261024-M5b-01/dex-audit.py
```

脚本通过dev.cmd实际运行 `:patches:verifyComposition -Pcomposition.compile=true` 与 `:patches:auditComposition`，独占build/输出，全部退出0。完整参数在 `composition-command.json` / `audit-command.json`，日志 `composition.log` / `composition-audit.log`；runtime/输入清单固定实际依赖，而非仅引用历史成功。

- 原始21.41.525-SECONDARY SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`，官方MPP1.48.0 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`。绝对路径与入场哈希见 `composition-inputs.json`。
- 实际Patcher2.0.0 JAR SHA-256 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`，保留共享安装缓存原位置。AI根+104官方默认根，selection/official-defaults与M4a原字节相同，不启用default=false的Spoof signature。
- 已完成实际补丁、DEX序列化、资源重编译、未签名APK输出和现有Hook/Shorts/quick toggle/原生遮罩/会话权限DEX审计。
- APK：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M5b-01\composition-M5b\patched-unsigned.apk`，SHA-256 `63a8b4b29e9029a88c24f41b4cde4183f7e42fa8a76a95b13c277e8e7c8b72b7`；16DEX/64564类，重复定义0，RetryAfter定义恰好1，测试/回环类型泄漏0。
- 对冻结M4a真实组合，条目集合相同，仅classes13.dex变化，其余18390条目原字节相同，含Manifest/resources.arsc/设置及原生资源。详见 `composition-structural-diff.json`。未签名安装，也不把组合当设备认证。

## 保护、遗留与安全回退

`final-audit.py` / `protection.json`对入场ZIP逐文件自检，比较范围外源码、旧测试、验证工具/CI/依赖/公开元数据、六忽略前端及8848历史候选/交付；`batch.diff`按入场生成。分支、HEAD、索引不变；当前状态镜像逐字节相同。`source-protection.json`单列来源保护；`assertion-preservation.json`说明F1映射及旧断言保护。最终机器摘要 `delivery-summary.json`、索引 `evidence-index.json`固定日志/报告/产物哈希。

未闭环：F2 page/hole绕过普通等待/过滤门、F4 retire允许后续协商POST保持原样；F3保留同语义磁盘缓存复用，F5分类兼容性另卡。普通门修复不代表所有请求路径都遵守Retry-After。未覆盖远端CI、其他APK/官方/选择组合、真实设备/日期跳变/TLS/完整断网超时/全部并发交错、真实供应商或收费、全部历史HTTP日期形式。上述范围不妨碍本卡限定的工程修复与一组组合交付；设备/费用不做认证。

安全回退：`rollback.py`默认dry-run，先一次性核对本批文件仍为退出哈希及镜像未被后续改动，全部符合才允许`--apply`。只恢复入场原件并移除本批新增测试；保留结果报告、证据、新旧候选，不reset/clean或覆盖未来修改。无用户数据/缓存迁移，不需清数据。回退会恢复m4a的F1旧缺陷，之后应重新运行当前完整入口并标明旧候选身份。

```powershell
work/toolchain/python/python.exe -B -X utf8 validation/runs/20261024-M5b-01/rollback.py
# 仅明确决定回退且dry-run全通过后追加 --apply；本轮未执行apply。
```

需要统筹判断：按M5b v1复核红绿、普通真实调度等待/恢复、溢出、来源、737项完整验证、一组组合及保护证据是否接受；无新增产品取舍。建议统筹复核本卡后，另卡处理F2/F4；本轮已停止，不自动进入下一阶段。
