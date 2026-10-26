# M3a 执行结果 — 当前状态职责、异步失效边界与事件顺序回归

任务：**M3a / 任务卡 v1**。日期：2026-10-24（Asia/Shanghai）。执行结论：**已完成待复核**；统筹：**待复核**。M1a/M2a 的接受结论及旧 REVIEW 原文保持；本卡不自行接受、不进入 M4。

活动仓库：`E:\Projects\DeepSeek morphe-ai-caption-translator`。进入/退出均为分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`，复用原工作树，没有切分支或新 worktree。产品保持 **1.5.8 / local-1.5.8-m2a**，公开版仍为 **1.5.7**；继续独立补丁维护，未提交官方 PR。

职责文档：`E:\Projects\DeepSeek morphe-ai-caption-translator\docs\architecture\CAPTION-STATE-CONTRACT.md`。

独占证据：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M3a-01\`。以下相对证据路径均以该目录为根；实际完整命令/时间/退出码见 `full/summary.json`、各日志和本报告命令块。

## 1. 入场与修改归属

开始前读取根 AGENTS、PROJECT-STATE 的当前身份和最新 M1a/M2a 接受记录、维护 README、M2a REVIEW、M3a v1 和路线产品/M3/交付约束。实际源码优先于路线理想表述。保存入场：

- `entry.json`：原分支/HEAD、完整 porcelain 状态、2,178 个 Git 跟踪/非忽略未跟踪文件的路径、大小、SHA-256；含既有 N69–N75、M1a/M2a 修改，未把它们算作本轮工作。
- `entry-originals.zip`：上述原件及单独保存的状态镜像；SHA-256 `67a38b0932ddb320e4e4bac42ade7dbb9e5293a349ffec7119f9f12402e81246`。
- `entry-fingerprint.json`：入场清单指纹 `2dfa8cca81c8e9fc8ea906816ac52f38b45f69e040ae6e0cddfebf6520dba15c`。这是全工作文件清单指纹，不等于验证工具的源码输入指纹。
- `historical-artifacts.json`：4,801 个既有 delivery/maintenance 文件的哈希；没有复制整棵历史构建树。本轮冻结对照为 M2a `build/maintenance/M1a/20261024-M2a-candidate-02/patches-1.5.8.mpp`，入场及退出均为 `f7839db2ff51c62e5410f817b49e9075076ac9e38aaac706925d64c12bf392b9`。

入场清单范围说明：`.devenv/` 被 Git 忽略，不在上面 2,178 文件清单或既有验证工具的 Git 范围输入指纹内。本轮读取并复用它们，没有修改；`ignored-tool-comparison.json` 另核对 Enter-Dev、dev.ps1/.cmd、verify-full.ps1/.cmd 五个执行包装器与已接受 M2a 退出清单逐字节相同，并记录其余环境文件的退出哈希。这个补充是**历史基准对照**，不是伪称本轮入场时已独立保存所有忽略环境文件的哈希；该取证范围限制如实保留。后续涉及环境工具维护时应显式纳入入场清单，本卡没有修改验证工具的指纹定义。

本轮仅改变文档及测试，共 10 个 Git 可见文件，另同步忽略目录中的 PROJECT-STATE 镜像：

| 文件（仓库相对路径） | 本轮变化/原因 |
| --- | --- |
| docs/architecture/CAPTION-STATE-CONTRACT.md | 新增当前职责、双 AI 记录、线程/锁、代际标识、撤销与物理完成、16 行矩阵和待确认边界 |
| translation-core/src/test/java/app/yydarlinker/deepseekcaptions/PublicationLifecycleTest.java | 新增 3 个生命周期/缓存提交隔离合同，真实 Session/Publication/磁盘，受控连接替身 |
| extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/ShortsCaptionAuthorityTest.java | 新增 3 个 held ready 回归及读取实际 pending Runnable 的测试 helper |
| extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/ReintegratedApplicationTest.java | 新增 1 个真实应用端口的 held source→切视频回归；dispatcher 增加可控源响应和 teardown 释放 |
| extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/CaptionSessionReconcilerTest.java | 新增 1 个双记录门控/兼容回填对照 |
| docs/ARCHITECTURE.md | 局部更新当前职责入口，不重排历史章节 |
| docs/maintenance/README.md | 更新 M3a 执行状态/结果入口，统筹保持待复核 |
| docs/MAINTENANCE-ROADMAP.md | 仅更新顶部执行摘要和 M3 状态行；产品约束/后续阶段不变 |
| docs/PROJECT-STATE.md | 追加第 53 条本轮摘要，不重写旧历史或产品身份 |
| docs/maintenance/results/M3a-RESULT.md | 本报告 |

`batch.diff` 从入场 ZIP 比较，独立于相对 HEAD 的全仓 diff；`exit.json`、`protection.json`、`assertion-preservation.json` 给出退出核对。原有三个受影响测试类的 **90 个既有 @Test 方法体逐项相同**；只改必要 fixture/helper，不改旧行为断言、黄金文件或测试名称。除允许文件外 **2,171 个入场文件**逐项保持哈希；生产 Java/Kotlin、补丁/资源、Gradle/CI/发布工具、配置/协议/缓存实现、版本/build ID 全部保持入场字节。PROJECT-STATE 入场全文字节作为原前缀保留，只追加本轮摘要；镜像同步。`git -c core.whitespace=cr-at-eol diff --check` 退出 0，保留工作树现有 CRLF 风格。

## 2. 职责及覆盖发现

重要结论都能沿职责文档找到方法及实际断言，不能用一个“全局 epoch/单一权威”替代当前实现：

1. **两个 AI 记录各有读取点。** Config.enabled 决定 draw mask、UI 状态及 displayAllowed/引擎配置；Intent.aiEnabled/revision 额外约束 reconciler.apply。用户开关经 onUserSwitched 写两个存储；CC ON 在 Config=true 时可以回填旧版缺失的 Intent。两个 SharedPreferences 写入不是跨存储事务。Bridge 不直接写 Intent，但 explicit/CC 路径可能经 onUserActivated 兼容回填；保留这个真实例外。
2. **当前语言由原生选择决定，CC 是独立显示事实。** post-filter committed、PREFERRED_TRACK、DEFAULT/reason=1、普通 DEFAULT、forced Off 的角色不同。目录、请求 URL、预取不能自行选择目标；handoff 必须属于新访问且重查 manager/model video。AI OFF、CC OFF、UNKNOWN、暂时过渡和真实 Shorts exit 不是同一个停用状态。
3. **owner/selection/Intent/ready/core generation/publication 分开撤销。** ready 合并时不保存语言，执行时读最新投影；旧 owner、teardown 等需拒绝已投递回调。引擎 sessionOpened/stopped 当前不写真实播放器归属。
4. **逻辑撤销不等于立即物理终止。** stop/cancel 为 STOPPED；直接 scope replacement 的 retire 为 RETIRED，允许已发送网络在原作用域完成，但无新 permit/显示资格。撤销前已准入的磁盘提交可以完成；drain 等它结束后才构成清缓存屏障。旧作用域缓存存在不等于污染新配置，Prepared ordinal 还防止旧候选覆盖新提交。源缓存的 shared-flight consumer 检查与译文 Publication 不是同一协议。
5. **线程结论按代码限定。** Authority 部分入口、Overlay 显式投递主线程；Bridge/Reconciler/Hook 整条流水线并非统一 toMain。core 的源/翻译/cleanup 和源共享 worker 是不同线程池；生命周期锁之外进行网络、prepare/fsync、磁盘 commit/断开/等待。未证明任意宿主线程顺序下的全局线程安全。

`event-matrix.json/.csv` 保存 **16 行 / 32 组**源码方法体断言与本轮有效 XML 的对应，包括方法体哈希、实际 assert/fail 行、报告路径、通过状态和覆盖层级。`coverage-review.md` 保存先有覆盖及缺口判断。既有 N69–N75/M2a 已覆盖大部分顺序，没有换名重复添加。

新增 8 项的价值：

| 新方法/类别 | 扣住点、介入事件、对照和真实断言 |
| --- | --- |
| S.aHeldReadyCallbackCannotApplyAfterTeardownM3a | 扣住真实 pending ReadyTask；teardown 后直接执行旧 callback + idle；无启动、无 active、session 清空，AI 意图保留 |
| S.aHeldOldOwnerReadyCallbackCannotTakeOverTheNewOwnerM3a | 扣住 task 后 owner epoch 更换并允许新表面；旧 callback 不授 CC/不启动；当前 owner 的新 ready 正向启动一次 fr |
| S.coalescedReadyReadsTheLatestSelectionInsteadOfTheQueuedLanguageM3a | 队列不放行时重复 ready、fr 改 ja、强 geometry 升级同一个 task；最终只启动一次 ja |
| A.aHeldSourceReplyCannotPublishIntoTheNextVideoM3a | MockWebServer latch 扣住源响应；真实 VIDEO B 撤销后释放并等待单源 lane fence；无旧输出/active/提供方请求；B 正向源会话显示原文、sourceGets=2、posts=0 |
| R.dualAiRecordsGateDifferentDecisionsAndCcOnBackfillsLegacyModeM3a | 两种存储不一致的受控输入区分 displayAllowed/apply，CC ON 回填有条件，用户 OFF 同步两记录但不改 CC/选轨 |
| P.mainCancelRevokesImmediatelyWhileDisconnectAndAdmittedWorkAreHeldM3a | 假 disconnect latch 和真实 permit 分别扣住；main cancel 已返回/禁止新 reserve；main await 抛正确原因；后台 drain 在 permit 未关时不完成，关后通过 |
| P.retireAllowsOnlySentTransportAndCancelEscalatesItM3a | sent 与 unsent 旧 Job 为对照；RETIRED 只允许 sent transport，仍非 current/无新 permit；cancel 升级 STOPPED 后 sent 也被取消 |
| P.admittedOldCacheWriteCanFinishButCannotReplaceANewerCommittedCandidateM3a | 真实 prepare/commit/文件；旧准入可提交；实际 model 不同的 key 不命中；持有的未提交旧候选晚于新不同文本提交时拒绝覆盖；无 tmp 泄漏 |

S/N/R/A/C/P/I 的全类名、源码链接和旧测试对应见职责文档第 7 节。新增不使用 Thread.sleep；bounded latch/Future 等待均有上限，100ms Future 超时仅验证尚持有 permit 时 barrier 不能完成。源 fence 等的是 core 单源 lane，不宣称所有共享 source worker 已排空。

真实范围：S 为真实 bridge/reconciler/authority + geometry/原生 accessor shadows、应用端口 recorder；R 还用 Actions/epoch shadows，覆盖局部协调。A 保持真实 CaptionApplication、core、源 transport/shared-flight、Overlay/TextView 和模拟 HTTP，几何、安装标志、KeyStore、混淆模型 accessor、Cronet 路由为替身。P 是真实生命周期/缓存隔离合同、受控物理连接，无完整 provider 网络。它们互相补强，不冒称真机端到端。

## 3. 实际验证命令及结果

全部命令工作目录均为 `E:\Projects\DeepSeek morphe-ai-caption-translator`；包装器仅设置进程内 E: TEMP/TMP/Gradle/Android user home，无全局环境改动。验证期间没有真实模型调用。

针对性第一次运行（日志 `targeted-01.log`）：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .devenv/dev.ps1 :translation-core:testDebugUnitTest --tests app.yydarlinker.deepseekcaptions.PublicationLifecycleTest :extensions:extension:testDebugUnitTest --tests app.yydarlinker.deepseekcaptions.ShortsCaptionAuthorityTest --tests app.yydarlinker.deepseekcaptions.ReintegratedApplicationTest --offline
```

core 当时 3 项通过；extension 78 项中 1 项失败，退出 1。失败为新 owner 测试前置错误：在扣住 task 后调用 Activity.setup，Robolectric 框架推进 main queue，使事件介入前已启动。保留失败 extension XML 于 `targeted-01-xml/extension/`，把 Activity 创建提前到扣住队列前，并加介入前 inactive/starts 空检查；没有放宽被测合同。首次 core XML 未及时独立归档，后捕获的 `targeted-01-xml/core-captured-after-targeted-02/` 明确是第二轮报告，不用它声称首次独立 XML。

针对性第二、三次运行（命令相同，日志 `targeted-02.log` / `targeted-03.log`）：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .devenv/dev.ps1 :translation-core:testDebugUnitTest --tests app.yydarlinker.deepseekcaptions.PublicationLifecycleTest :extensions:extension:testDebugUnitTest --tests '*M3a' --offline
```

- targeted-02 退出 0：core 3、extension 新增 5 均实际执行通过。之后加强 core 磁盘断言为“尚未提交旧候选 vs 较新不同文本”并使用实际配置 key；不改产品/预期。
- targeted-03 退出 0：core 最终 3 实际重新执行通过；extension 5 为 Gradle 确认 UP-TO-DATE，有效复用第二轮结果，未冒称第三次执行。各自 XML 在对应 `targeted-02-xml/`、`targeted-03-xml/`。

最终源码固定后的完整入口：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .devenv/verify-full.ps1 -RunId 20261024-M3a-candidate-01 -EvidenceDirectory validation/runs/20261024-M3a-01/full -Mode candidate -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m2a -Offline -RerunTests
```

退出 **0**，`full/summary.json.status=passed`。本轮实际执行 20:35:01–20:40:05 左右（Asia/Shanghai；逐步 UTC 时间在 summary），Gradle 4m56s；不是设备性能数据。

| 检查 | 实际结果 | 证据 |
| --- | --- | --- |
| translation-core:testDebugUnitTest | **257 tests / 0 failures / 0 errors / 0 skipped；executed**，29 XML | full/tests/translation-core/；receipt 与 summary 记录哈希 |
| extensions:extension:testDebugUnitTest | **450 / 0 / 0 / 0；executed**，66 XML | full/tests/extensions-extension/ |
| 总数/变化 | **707**；入场 699，新增 core 3 + extension 5 = 8，无退役或改名重复 | 95 份 XML、矩阵及 assertion-preservation.json |
| 验证工具合同/发布合同 | 15 / 14 均通过；默认模型访问关闭 | full/verification-contract.json、release-contract.log |
| 本地化 | 232 keys × 14 locales | full/localization.log |
| 来源/源码与 compiled 边界 | 81 core classes、协议/提示词/来源、48 UI 保护文件、14 包内 locale、UI APK 无 core 泄漏均通过 | full/source-boundaries.json、boundaries.json |
| UI/MPP/指定 MPE 验证 | assembleDebug/buildAndroid 成功；内嵌 MPE 与指定独立 MPE 一致 | full/gradle-receipt.json、bundle.json |
| 生产编译复用边界 | R8/syncExtension 为 UP-TO-DATE；部分其他编译 FROM-CACHE；不声称本轮重新执行 R8 | full/gradle.log、receipt |
| 输入固定/凭据扫描 | source manifest 前后相同、候选扫描通过 | full/source-manifest*.json、credential-scan.json |

有限顺序独立性检查使用证据区的标准 JUnit `Request.method` runner，原 Test runtime classpath/system properties，按 forward/reverse 各跑新增 core 3、extension 5 方法；每个模块/方向在单个 JVM 内按指定顺序执行。实际命令：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .devenv/dev.ps1 :translation-core:m3aOrderForward :translation-core:m3aOrderReverse :extensions:extension:m3aOrderForward :extensions:extension:m3aOrderReverse --init-script validation/runs/20261024-M3a-01/order.init.gradle --offline
```

有效日志 `order-check-02.log` 与机器摘要 `order-results.json`；16 次方法执行均 tests=1/failures=0/ignored=0，退出 0。首次 `order-check.log` 在 core 正序 3 项通过后，runner 未显式退出，Robolectric 框架 executor 令进程存活；只停止该证据 runner，保留退出 1 日志，给证据 harness 增加与 JUnitCore.main 同类的显式进程退出后重跑。没有停止/跳过失败断言，没有改变生产或 Gradle 工具文件。该检查不计入 707，也不穷举所有排列。

## 4. 候选及冻结 M2a 逐条目对照

新工程验证候选（工具沿用 M1a 布局，本次任务为 M3a）：

- MPP：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M3a-candidate-01\patches-1.5.8.mpp`，**584,881 B**，SHA-256 **`fb04a85d0a1e55b386fce7152a60de4f619c9e2b560671eb08770a01a5b0303a`**。
- 身份：Version **1.5.8** / build ID **local-1.5.8-m2a** / Patcher **2.0.0**；沿用 m2a 有意为之，测试变化不宣称新产品版本。
- 独立 MPE：同候选目录 `extension.mpe`，716,832 B，SHA-256 `363edd633b9a26a25d95b351af637eaf37ff72a2516ebe1643314e3437c707ef`，与新 MPP 内嵌以及冻结 M2a 内嵌字节一致。
- 本次 build/test/tool 范围输入指纹：**`f71167b12aa01ae0cb9cea479c67b0cb80bef6ed1ceafb003f681ff6289453c3`**，不同于 M2a 的 `6e6063c166db45137d37a76b68e3e5fd4610669f62693e45c8cd27164dc5ac6d`，变化来自本卡测试源码；叙述文档及证据不在该工具指纹范围。before/after 相同。

`bundle-comparison.json` 对全部 74 条目计算内容 SHA-256 和 ZIP date：73 内容相同，唯一不同条目 `META-INF/MANIFEST.MF` 只有 `Timestamp: 1792841176937` → `1792845317687`。版本/公开身份等其余 manifest 行一致；所有 ZIP 条目时间字段均与冻结包一致（固定 1980-02-01 00:00:00），不是猜测“可能只有容器差异”。生产 patch DEX、extension MPE、Kotlin class/metadata、补丁资源字节均相同；包整体哈希变化仅由已解释的 manifest 生成时刻导致。

`protection.json` 与 `exit.json` 检查除本卡允许文档/测试以外所有入场文件、4,801 个旧交付/候选文件均保持哈希；PROJECT-STATE 与镜像逐字节相同。没有覆盖 M2a 或公开 1.5.7，不创建 commit/tag、不推送/发布/签名安装/清用户数据。

## 5. 未覆盖项与历史证据边界

没有生产/资源变化，本轮**未重复真实 APK 组合、资源 harness、设备安装或真实模型调用**，符合本卡要求。历史来源明确为：

- `E:\Projects\DeepSeek morphe-ai-caption-translator\docs\maintenance\results\M2a-RESULT.md` 及 `validation/runs/20261024-M2a-01/`：原始 Google 签名 YouTube **21.41.525-SECONDARY** + 官方 Morphe **1.48.0** / Patcher **2.0.0**，同一 **104 个官方默认根 + AI 根**，冻结 M1a/M2a 对照的完整真实组合、资源重编译和 DEX 审计。
- `E:\Projects\DeepSeek morphe-ai-caption-translator\docs\maintenance\reviews\M2a-REVIEW.md` 及 `validation/runs/20261024-M2a-coordinator-review/`：统筹独立重验原始签名/输入哈希、资源与 DEX 对比；新组合 16 DEX/64,563 类无重复，两个 APK 仅扩展 DEX 和退役网络增量资源不同。

这是**历史一组**组合证据；本卡只以相同生产字节及新测试/候选验证支撑延用，不声称 M3a 重新执行，也不扩展到其他 YouTube 版本/选择集、OEM/真机导航或模型语义质量。资源 harness 仍需显式调用，不因存在于仓库就自动纳入本轮 JUnit。

其他待确认：宿主 native hook 实际线程合同和任意并发入口顺序；共享源缓存检查到写入的所有交错；真实提供方物理取消/计费；设备动画/Shorts 几何与导航、远端 CI/正式 release prepare/publish。现有测试没有证明这些；未发现阻止本卡交付的有效生产缺陷。不得把 finish-sent 等同退款、无请求、无旧缓存或自动获得新会话权限。

## 6. 安全回退与交接

证据区 `rollback.py` 默认 dry-run；按 `rollback-manifest.json` 逐文件核对仍等于本轮退出 SHA 后，才允许恢复入场 ZIP 原件/删除本轮新文件，并恢复原状态镜像。先运行：

```powershell
.\work\toolchain\python\python.exe -X utf8 validation/runs/20261024-M3a-01/rollback.py
# 需要实际回退时，在审阅 dry-run 且没有后续修改后，加 --apply。
```

一旦检测后续修改即拒绝，不硬重置 HEAD、不清工作树、不覆盖既有 N69–N75/M1a/M2a 工作。回退只撤文档/测试，不涉及用户数据；本轮候选和证据继续保留，不替换历史发布。回退脚本 dry-run 已验证；没有实际执行回退。

交统筹复核当前职责事实、16 行矩阵、8 项回归、707 有效结果、生产字节保护和候选时间戳差异。建议后续若进入 M4，以本文多种独立失效边界为约束；AI 记录收敛/线程统一若要做，必须另卡明确兼容与验证，不在本轮实施。完成本卡后结束。
