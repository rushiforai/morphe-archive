# M5c v1 执行结果 — 完成待复核

日期2026-10-25（Asia/Shanghai）。仅执行M5c v1，执行完成、**统筹待复核**。活动仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`，证据独占目录 `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5c-01`。下文证据名相对此目录；未自行进入F2或其他阶段。

## 入场身份与保存

- 进入/退出分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`；复用原工作树，没有新工作区/worktree、切分支、commit/tag、推送/PR、发布、签名安装、清用户数据或真实供应商/付费API。
- 入场生产1.5.8 / local-1.5.8-m5b，公开仍1.5.7；已接受M5b MPP `build/maintenance/M1a/20261024-M5b-candidate-01/patches-1.5.8.mpp`，SHA-256 `ef74553a70071010db948063f13c3a6c951dd00f6c347d500ad62c4c4f94465e`，实际核对并保护。
- 入场2201个Git可见文件（含已有未提交/未跟踪）及状态镜像保存于 `entry-originals.zip`；`entry.json`、`entry-working-tree.patch`、`entry-index.patch`保存身份/索引。入场清单指纹 `f09b204942a8eda4b61f4b6fd215b11b9bfe3920bd509eb20e19f7a284537ea0`，ZIP SHA-256 `35205b305fbea347b5c1a93571cbcbcdf9febfa307dd35f9ae54dba6e4ff41f8`。
- 六个实际忽略前端保存 `entry-ignored-tools.json` / ZIP：dev.cmd/ps1、verify-full.cmd/ps1、Enter-Dev.ps1、workspace.init.gradle；`historical-artifacts.json`冻结10287个入场历史候选/交付文件。工作/证据均在E:，共享工具和缓存不迁移或清理。入场快照为本机私有证据，不是公开交付。

## 最小修复与准入点

1. `DeepSeekApiClient.RequestControl`新增默认 `tryBeginAttempt()`，默认!isCancelled，兼容已有调用者/控制器。未新增通用网络框架或helper。
2. `RebuildController.Job.tryBeginAttempt()`只返回!cancelled && current(session)。current同时检查active身份、Publication.OPEN、session取消及video归属；其中Publication.isOpen的同步读取与revoke在同一monitor排序。退休已经发生再进入此点时必拒绝；active替换/取消仍由现有volatile状态检查。该检查不授予输出/缓存permit，不持生命周期锁做HTTP、等待或清理。
3. `RebuildApi.translate`每轮循环在原checkActive后、body序列化/TranslationAudit.beginAttempt及私有send之前检查tryBeginAttempt。首发、可选参数协商、HTTP拒绝stream降级和200流内error回退都经过同一循环。拒绝抛现有InterruptedException，无新错误payload/协议字面量、attempt或连接/POST，也没有循环重试。
4. `Job.sent`、`isCancelled`、onRequestBodySent、send读取/取消、Publication和缓存实现原字节保留。已发送旧HTTP仍按sent && finishSent读取/完成；STOPPED升级仍撤销读取。准入成功后才发生的重叠退休/取消按原onConnection/checkActive及finishSent规则处理，可能有attempt而无HTTP，或已合法准入的传输继续；不宣称网络字节原子零竞态、服务端未处理或退款。
5. `gradle.properties`仅captionBuildId从m5b改local-1.5.8-m5c，version仍1.5.8。F1等待/解析、F2 page/hole策略、F3语义缓存、F5诊断、源/Cookie/格式、并发/次数/超时、prompt/协议、UI/Hook/设置和公开元数据保持入场字节。

## 红测、绿测与真实HTTP计数

生产未改时执行：

```powershell
.\.devenv\dev.cmd :translation-core:testDebugUnitTest --tests '*AttemptAdmissionTest.retired*RefusesSecondPost' --offline
```

`red.log` / `red-exit.txt` / `red-xml/`：退出1，**3 tests / 3 failures / 0 errors / 0 skipped**。三个测试均按应有行为要求旧调用不发第二POST；实际各1个batch、2次attempt、2个旧POST并得到Plan，因没有拒绝而失败。`red-test-source.java`与`red-baseline.json`固定当时测试/三项生产哈希；实际Authorization、完整请求body、首bodySent、扣响应/退休/释放时序、audit及XML均保存。未重跑全部737制造红测。

修复后：

```powershell
.\.devenv\dev.cmd :translation-core:testDebugUnitTest --tests '*AttemptAdmissionTest' --tests '*NetworkFailureContractTest' --tests '*RetryAfterContractTest' --tests '*PublicationLifecycleTest' --tests '*StreamingDisplayTest' --tests '*ProviderEndpointTest' --tests '*CoreSessionIntegrationTest' --offline
.\.devenv\dev.cmd :translation-core:testDebugUnitTest --tests '*AttemptAdmissionTest' '-Pverification.rerunTests=true' --init-script tools/verification.init.gradle '-Pverification.receipt=validation/runs/20261025-M5c-01/repeat-receipt.json' --offline
```

`green-01`最初43项通过；随后强化fixture/audit记录并增加两个正向/交错用例，`green-02`最终45项通过；独立`repeat`9项再次实际执行通过。XML及 `targeted-results.json`保存每组测试计数/哈希。最初repeat因PowerShell未引号的点号-P参数传递失败，Gradle初始化退出1、没有执行测试，保留 `repeat-setup-failure.log`；误复制的上轮XML单独明确标为 `repeat-stale-xml-not-executed/`，不计入有效结果。修正引号后的receipt证明Test实际执行。

| 新测试/场景 | 旧或本次逻辑调用 | 当前新会话正向对照 / 有效结论 |
| --- | --- | --- |
| retiredOptionalNegotiationRefusesSecondPost | bodySent后扣住400 response_format unsupported，retire再释放；旧1 batch / 1 attempt / 1 POST，无第二旧POST | 新key/new model真实Job成功1 POST；合计2 batch/2 attempt/2 HTTP |
| retiredHttpStreamFallbackRefusesSecondPost | 同时序，首HTTP400 stream unsupported；旧1/1/1 | 当前新会话成功1，合计2/2/2 |
| retiredInStreamErrorRefusesSecondPost | 同时序，200 SSE error；旧1/1/1，stream_error审计保留 | 当前新会话成功1，合计2/2/2 |
| retiredSentSuccessStillCompletesWithoutPublication | 旧已发送成功响应可完整解析Plan，usage total_tokens=7仍记账；current=false、reserve=null、sent=true | 新会话成功；合计2/2/2，不把禁止新POST测成旧读取失败 |
| stoppedUpgradeRevokesSentReadAndFreshSessionWorks | retire后升级STOPPED，撤销读取，旧已发送attempt/audit保留 | 当前新会话成功；合计2/2/2 |
| queuedUnsentJobRefusesFirstPostAfterReplacement | latch扣住尚未进入API的旧Job，退休/替换后释放：旧0 attempt/0 POST，sent=false | 当前成功1 POST；总2 batch/1 attempt/1 HTTP（旧逻辑batch可在发送准入前建立） |
| currentInStreamErrorFallsBackAndSucceeds | 真实当前Job的200 SSE error→非流式成功，stream true→false | 1 batch / 2 attempts / 2 HTTP |
| currentJobKeepsTwoAndThreePostNegotiation | 真实当前Job：非流式可选参数协商2次；stream拒绝+可选参数协商3次，request选项断言有效 | 两逻辑调用合计2 batch / 5 attempts / 5 HTTP |
| admittedAttemptStoppedBeforeTransportKeepsAuditWithoutHttp | audit attempt中latch扣住已经合法准入的Job，STOPPED后释放，在连接/发送前拒绝 | 1 batch / 1 attempt / 0 HTTP，sent=false，无response/usage；不抹去已发生attempt |

最终完整套件中九项合计 **16 batch / 19 attempts / 18 HTTP**，含当前正向对照，详见 `http-attempt-scope.json`；这些不是整个746项套件的总HTTP数。case调用是同步的，Future有界完成后再检查服务器数；无sleep碰时序。使用真实RebuildApi/Job/Session和MockWebServer；源Host未映射抛AssertionError，新增持有响应dispatcher只接受fixture路径/方法，不读取用户profile或调用真实服务。finally释放latch、cancel、shutdownNow并join线程；setup/teardown恢复Host/Audit并reset协商/stream记忆。

前三个红测方法体与最终相同，required行为断言未放松；第一轮绿后只强化helper审计/fixture断言和新增正向场景。历史 `NetworkFailureContractTest.retiredSentNegotiationKeepsOldCredentialAndAuditWhileUnsentWorkStops` 按已授权产品决定映射为 `retiredSentNegotiationRefusesNewAttemptWhileOldAuditAndUnsentRulesRemainM5c`：旧第二POST成功改为InterruptedException，总HTTP/attempt3→2（旧1+新1）；旧key/audit、未sent拒绝、current/publication撤权和model cache identity断言保留。其余11方法及全部其他已有测试原字节；M5a/M5b原报告/矩阵/XML不改。

这里新增的旧Plan收尾测试直接调用API并检查真实current/Publication；完整应用显示/缓存拒绝由既有PublicationLifecycle、ReintegratedApplication、CoreSessionIntegration等回归共同覆盖，不把单个直接API用例冒称全引擎显示链或任意线程认证。

## 来源适配与完整验证

`review-before-provenance.diff`审查实际三项最小core变更；`provenance-reviewed-drift.json`确认仅DeepSeekApiClient/RebuildApi/RebuildController漂移、snapshot全匹配。追加适配说明，再实际执行：

```powershell
work/toolchain/python/python.exe -B -X utf8 tools/record_core_provenance.py
work/toolchain/python/python.exe -B -X utf8 tools/record_core_provenance.py --check
.\.devenv\verify-full.cmd -RunId 20261025-M5c-candidate-01 -EvidenceDirectory validation/runs/20261025-M5c-01/final -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m5c -Offline -RerunTests
```

来源check退出0；只三个目的sha256、adaptation_scope及派生patch更新，固定commit `ac65fe803ec2b11821b1131040f807922a2b8505`、snapshot字节/upstream_sha256、其他来源项/new_files、protected_abi不变。来源/协议提示词守卫和校验工具不放松。

完整入口退出0、`final/summary.json` passed；源码指纹 **`b11e5bd4a9c38e015ac34aca58db516f5ecc6c61fc4ddbec8ea4d66badc89e82`** 构建前后相同，源码/测试/来源自此未变。core **287** + extension **459** = **746**，failures/errors/skipped全部0；基线737+9。两Test任务均本轮实际执行，构建编译的缓存/up-to-date按receipt记录，不冒称全部步骤重新执行。原协商/stream、F1、取消、配置/视频切换、publication/cache、源模式零provider等均保留。XML在 `final/tests/translation-core/` 与 `final/tests/extensions-extension/`，逐文件哈希 `full-xml-manifest.json`。

本地化232×14、来源/提示词/协议、81 compiled core、UI无core泄漏、MPP/MPE、14 locale、凭据matches=[]通过；工具15项、发布合同14项通过。`negative-gates.json`将本次MPP/MPE绑定三条拒绝：旧m5b冒充m5c、错配旧MPE、local冒充release均实际退出1。

编译证据：完整入口已在本次编译目录做compiled检查；入口完成后、下一次Gradle之前立即将receipt指向的core classes逐字节复制到 `compiled-core-from-full/`，`compiled-core-archive.json`绑定原路径/源指纹/receipt及逐文件sha256，并使用归档结果再次运行原boundary工具通过。未重新编译或用历史目录名冒称中间物存在；后续Gradle可能回收原中间目录，归档与候选/XML保留。

## 新候选身份与真实组合

- MPP：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5c-candidate-01\patches-1.5.8.mpp`，585282 B，**1.5.8 / local-1.5.8-m5c**，SHA-256 `b5ddc4eb94abbebce8a82406eef7db156ce947eac5877a7dc9ba7b700cbd677a`。
- MPE：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5c-candidate-01\extension.mpe`，717616 B，SHA-256 `461d4f33b09a90ee6f6001f6989c3d998e311e2a23b3262278c07f00dcdd45ec`；内嵌与独立同字节。
- 工具沿用已接受M1a目录布局，独占本轮RunId，不因目录名改工具或覆盖旧包。`candidate-structural-diff.json`对冻结M5b：MPP条目集合相同，仅manifest与extension变化；Kotlin补丁DEX/资源原字节，类集合与Hook/NativeCaptionBridge签名表相同，无测试/回环泄漏。预期变更是core/内部控制接口/build ID。

```powershell
work/toolchain/python/python.exe -B -X utf8 validation/runs/20261025-M5c-01/post-full.py
powershell.exe -NoProfile -ExecutionPolicy Bypass -File validation/runs/20261025-M5c-01/run-composition.ps1
work/toolchain/python/python.exe -B -X utf8 validation/runs/20261025-M5c-01/dex-audit.py
```

最终有效命令均退出0。组合首次在Gradle初始化因本轮证据用Groovy脚本带UTF-8 BOM失败，尚未执行补丁，原日志/命令/输入/原脚本保存在 `composition-setup-failure/`；仅去除该证据脚本BOM后重跑，生产/测试/验证工具和源指纹未变。composition脚本复用dev.cmd运行 `:patches:verifyComposition -Pcomposition.compile=true` 与 `:patches:auditComposition`，使用独占build root、未签名APK输出；完整参数和退出状态在 `composition-command.json` / `audit-command.json` / `composition-exit.json` / `audit-exit.json`，日志 `composition.log` / `composition-audit.log`。

- 原始YouTube21.41.525-SECONDARY SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`；官方MPP1.48.0 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`；实际绝对输入路径/hash见 `composition-inputs.json`。
- 实际Patcher2.0.0 JAR SHA-256 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`，依赖/runtime清单 `runtime-verifyComposition.json`；共享缓存原位保留。
- 104官方默认根＋AI根，selection/official-defaults与冻结M5b同字节；未启用default=false的Spoof signature。真实补丁、DEX序列化、资源重编译及既有Hook/Shorts/quick toggle/原生遮罩/会话权限DEX审计完成。
- APK：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5c-01\composition-M5c\patched-unsigned.apk`，SHA-256 `ecf09deab6381f949ea3e5e4a350a7c5fe5fa53e23ee16771533be6ea38b7a13`；16 DEX / 64564类，重复定义0，RetryAfter恰好1，无测试/回环泄漏。对冻结M5b仅classes13.dex不同，其余18390条目同字节，含Manifest/resources.arsc/设置和原生资源；详见 `composition-structural-diff.json`。这是指定单组工程组合，不是设备认证。

## 保护、限制及安全回退

`final-audit.py` / `protection.json`按入场ZIP核对所有范围外文件、旧测试、历史交付、六前端、公开元数据/CI/工具/依赖；`batch.diff`只表示本批差异，不把HEAD累计工作计为本轮。`assertion-preservation.json`列旧F4映射/红绿断言及其余方法保护；`source-protection.json`列固定来源保护。分支/HEAD/索引不变，PROJECT-STATE镜像同字节。`delivery-summary.json`及`evidence-index.json`绑定主要结果/日志/产物哈希。

F2 page/hole等待/过滤门仍未闭环；F1普通/直接门修复保持，F3语义缓存复用、F5诊断格式原样。未验证远端CI、其他APK/官方/选择组合、设备运行、TLS/全部真实超时、所有并发交错、真实供应商/收费退款、完整HTTP-date历史形式或系统时钟跳变。准入后的重叠操作按现有完成/取消作用域处理，不扩大为全局费用/线程安全认证。这些范围不阻止M5c限定修复、746项和一组真实组合的工程交付。

安全回退使用 `rollback.py`，默认dry-run；先一次性检查所有本批文件仍等于退出sha256及镜像未有后续变化，再允许--apply，只恢复入场原件并删除本批新增AttemptAdmissionTest。保留本报告、证据及新旧候选；不reset/clean、不盲目整仓覆盖或清用户数据。回退会恢复m5b的F4追加POST旧行为；无数据/缓存迁移，之后应重新运行完整入口并准确标记候选身份。

```powershell
work/toolchain/python/python.exe -B -X utf8 validation/runs/20261025-M5c-01/rollback.py
# 仅明确决定回退且dry-run全通过后追加 --apply；本轮未执行apply。
```

需要统筹判断：按M5c v1复核权限分离/准入点、红绿及实际计数、旧成功/STOPPED/新会话/正常2/3协商、来源/746项/组合和保护证据后决定接受，无新增产品取舍。下一步仅建议统筹接受后另卡处理F2；本卡到此结束，没有自动进入其他阶段。
