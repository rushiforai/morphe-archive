# N28C：既有 N28B 调度基础修复与交付闭合

日期：2026-10-02（Asia/Shanghai）。当前状态：**SCHEDULER_FIXED / ENGINEERING_VERIFIED / UNSIGNED_DELIVERY**。以下新增记录描述本卡实现与最终验证；本文件后半部分原隔离报告完整保留，其 UNFIXED、2/2 DEADLOCK、未交付等状态描述修复前历史，不是当前状态。

本卡输入 HEAD `26692ed03344cadda443bca584e2c91c7eb54206`；纯 B 锚点 `anchor/n28b-d02d7cc` / `d02d7ccefbd3847d7c1df3b0306e22a3a14429f0` 保持。修复范围明确为“既有调度基础修复”，同时保留所有 N28C 非中文呈现代码。没有用回退 B、删测试、延长旧超时、随机 sleep 或重跑碰绿替代修复。

## 1. 根因和前后锁图

修复前的实际闭环与四次失败保持原记录：

```text
stop / video / activate：Controller.class -> Session
schedule / load / translate：Session -> current -> Controller.class
C -> S -> C：既有 N28B 产品死锁。
```

修复后的协议：

```text
Controller.class：仅 active/video/tickPosted/publicationEpoch 的短状态交换
Session：仅会话状态、generation、source/job 归属、quota/pending/render 快照
connections：仅集合复制、增删、清空；disconnect 在锁外
Publication：reserve/revoke 的同一原子 CAS；没有 Java monitor
RebuildCache.class：独立的最终 atomic move / clear / trim；无 Controller/Session 回调
诊断、本地化、媒体/Clock、网络、cache read/prepare/fsync、几何、Executor/Handler：生命周期锁外
```

`current(s)` 读取 volatile active/owner 与原子发布状态，不获取 Controller 锁。源码与实际 javap 审计每树 **26 个 Controller 同步区**，无隐式 ACC_SYNCHRONIZED Controller 方法、无双向或嵌套 Controller/Session monitor。Publication/Permit 的实际 class 无 monitorenter。所有 Controller 嵌套类一并审计。debug/release 的 **11 个调度/缓存 class 字节相同**，所以锁审计也绑定实际 release 构建。

证据：`E:\Projects\morphe-caption-v2\.verification\n28c-scheduler-fix\2026-10-02T05-46-38-772884Z\lock-audit-final-03\lock-audit.json`、同目录全部源段与完整 javap、`release-debug-lock-class-equality.json`。审计记录正常控制流的锁内调用；完整 javap 同时保留异常表与异常 monitor 清理路径，未删掉任何指令作比较。

## 2. 撤销、发布与缓存的线性化

- **失效点**：stop/换视频/activate 替换在 C 的短区内先 CAS 关闭旧 Session 的 Publication，再交换 active。C 内不调用 cancel/retire、缓存、诊断、UI 或任务提交。锁外再 drain 与 Session 清理。
- **旧 HTTP**：原子状态区分 RETIRED 与 STOPPED。scope 替换后、旧 retire 尚未取得 S 的窗口，已发送 job 仍可完成原 HTTP；明确 stop/cancel 则 isCancelled=true 并在 connections 锁外 disconnect。旧响应不能取得新提交资格、发布旧 plan 或写入新 scope。
- **Session 原子边界**：同一个 S 区内更新 cancelled/retired、generation、loading/sourceJob、pendingFocus/pendingPlans、暂停与 render 版本。重复撤销不重复推进 generation；STOPPED 不会被迟到 retire 降级为 RETIRED。
- **锁外回接**：load 使用同一 sourceJob/Session/owner；cache 候选核验 generation、source、key、block 与 job 身份；seek 期间旧 cache 候选作废。translate 在外部 review/prepare 后，再在 S 内核验 generation/old plan/job 并 reserve。
- **cache 提交资格**：parseBound、source ownership、scope/target/policy/cache identity、序列化、temp 写入与 fsync 都在锁外。最终资格 reserve 与 revoke 使用同一个 Publication CAS；撤销后到达或仅准备好的结果不能 reserve。已在撤销前 reserve 的提交可以完成其原 key 的短 atomic move，撤销在所有 monitor 外等待这些许可释放，固定上限 **5 秒**，超限明确抛错。它等价于原先 commit 先于 stop 的合法顺序，不允许失效结果取得新资格。
- **发布与 acceptance**：存储完成后才接纳 plan、报告 acceptance。许可覆盖最终提交与回接；stop/cancel/retire 返回时已 drain，旧 Session 不再有发布工作。失效/seek 的发布检查失败时不接纳候选；temp 在 finally 释放。兼容直接 cache.write 也复用 prepare/commit；保留 cache clear/最终 move 的原有缓存监视器序列，不把受保护写入变成任意写。
- **UI 生命周期**：clear 使用 publicationEpoch 与初始 render 状态 guard，不作废新会话的命令。guarded show/hide 在 MAIN 确认有效后才推进 COMMAND。`onApplied` 确認真正 UI 应用，未提交的选择允许主线程再提交；单独 renderSubmission 防止旧同签名提交倒灌。原 renderRevision/signature 去重规则不变，旧 blank-cue 断言继续通过。

## 3. 修改文件与业务冻结

调度基础修复只修改 **RebuildController、RebuildCache、CaptionOverlayV2**。Cache 增加原子 Publication/Permit 和 prepare/commit；Overlay 只增加最小 guard/应用确认，不修改几何、字体、分页或显示内容规则。新增 `SchedulerLifecycleRegressionTest` 的12项真实生产回归及5个离线验证工具。当前 C 的 RenderSpec/Pager、locale、Unicode、RTL、review 与 preview 全保留；总产品范围仍为原卡8个既有文件＋2个新文件。

65个原有 Java 测试及所有原断言保持开始时字节；3个既有 C 测试（41项）也未修改。请求/prompt/auth/provider、source quote/token/time/ownership、attempt/repair/retry/cooldown、seek storm、pendingFocus、菜单/patch/resources、中文字号/FontMetrics/分页/位置/time golden、ACCEPTANCE、frozen baseline 都保持。

**任务卡数字差异**：既有源码 MAX_FOCUS=2、MAX_PREFETCH=2、MAX_TOTAL=4，原 `RebuildN23ConcurrencyTest` 与 N24 原断言明确要求两个预取 slot/两个 successor。卡中 prefetch=1 与其“不得改变额度/原断言”相矛盾；本卡保留实际 **2/2/4** 基线，没有修改成1或放宽旧断言。

PROJECT-STATE 两份输入均为 `8C739406C32265EEBF71B5CA8E99B2CC3D8AAABA8FFA9452E2924F7E6493D2A2`，本卡未修改。交付工具改为绑定本卡保存的已获准输入 SHA；旧工具 `8096...` 期望仍保留在报告为 obsolete_state_expectation，不回退真实状态、不用产品变化改期望。

## 4. 独立基础对照与最终测试

| 输入 | 实际结果 | 证据 |
|---|---|---|
| 原纯B与原完整C受控输入 | 各 **2/2 DEADLOCK_CONFIRMED**，未覆盖 | 原 `.verification/n28c-deadlock/baseline-results.json` |
| 纯B＋最小基础修复，原最小输入 | 1/1 PASS | 本轮 `b-minimal-probe` |
| 完整C，原最小输入 | 1/1 PASS | 本轮 `c-minimal-probe` |
| B＋基础修复全量最终 | **550/550 = 538＋12**，0 failure/error/skipped | `b-full-final-03` |
| 完整C全量最终 | **591/591 = 原579＋新增K12**，0 failure/error/skipped | `c-full-final-03` |
| 44项专项／中文生产 golden | **44/44**，legacy activate＋18组地区/别名字段与已交付B相等 | `c-special44`、delivery-records |
| 14目标 | 14×cold/hot共28 production 行；7 required pair行；40 geometry组合 | 最终 production trace / geometry-matrix |
| Python／本地化 | **27/27**；**220×14** | `python27.log`、`localization.log` |
| 冻结 | **4通过／4既有失败／4未验证**；pending_translation/event_review/overflow各0 | 本轮只重算到新路径，原 frozen JSON 字节不变 |

B 输入从原锚点 archive 独立生成，**仅应用三个基础修复文件**，没有 CaptionRenderSpec/CaptionLanguagePager 源码、引用或编译 class；65个原测试从原B archive保留。`prepare_b_scheduler_input.py` 保存单独 diff 和scope JSON，不能以完整C Controller替换B冒称基础对照。调度/生命周期关键源段两树一致，render/translate 中原有 C 呈现条件维持各自版本。

新增12项覆盖：200轮 stop/schedule/current；active替换而retire未完成；真实迟到HTTP；明确stop取消；迟到disk与seek候选；fsync后撤销；已reserve提交的drain；source failure与换视频；迟到disconnect/UI清理；旧guard命令；选中但未提交render；activate重用与stop。

**最终200轮/树、共400轮**实际竞争都进入停止线程等待 S 的窗口；每轮从创建输入起共享 **5秒硬截止**（不逐阶段延长），方法总硬上限30秒，其他屏障/线程join也固定5秒。断言包括 pending/generation、0误发、attempt/repair/lane/cache/旧新scope/UI状态。失败监听与JVM agent保存测试名、输入SHA、全线程名/栈/锁/owner/锁图；外部看门狗只允许结束已核对agent路径与GradleWorkerMain的本次worker。没有随机sleep触发窗口；agent轮询/既有fixture等候不承担竞争命中。

所有过程失败保留：c-regression-01 是新测试注解限定名编译错误，未运行（其早期脚本拷贝的旧44项XML不是实际结果）；c-full-01 588项有1个matrix UI失败；c-scoped-ui-01 同一UI窗口仍失败，完整trace在c-ui-trace-01；c-scoped-ui-02 应用确认代码插入错误位置的编译失败；c-full-final 591项中原 blank-cue revision 去重断言失败。随后修正提交/应用确认、分离submission与revision，保留旧断言；c-full-final-02与最终03均591通过。B首轮547通过；B最终适配脚本误改hide局部变量的编译失败也保留于b-full-final，最终独立B全量550通过。每次绿色对应明确代码或测试约束修正，未改写旧失败为PASS。

## 5. 三件套与最终静态审计

门槛通过后从最终产品源码重新 buildAndroid（14秒成功）；随后只读交付MPP自身组合APK，不读未锁定的模块中间ZIP作为交付。buildAndroid/组合/API绑定/branch/resources/aapt/unsigned日志都在新目录：`E:\Projects\morphe-caption-v2\.verification\n28c-scheduler-fix\2026-10-02T05-46-38-772884Z\delivery-records`。

| 完整路径 | 字节 | SHA-256 |
|---|---:|---|
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n28c.mpp` | 1122526 | `E5AD4D348F235523488436466D9ED9D20B7104C963544DA671381B9259F34FFD` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n28c.mpe` | 2752676 | `877014E05618B54E321FAA34DE52CE5461747AA1594A642AF3C599F312BA5103` |
| `E:\Projects\morphe-caption-v2\build\n28c-composition-final\YouTube-21.16.256-本地测试包-n28c-unsigned.apk` | 196956968 | `8260BEEC8BE026ACDE107F6FA28586DD693C5EE2326DC68E1963CFA9C9F6F9DA` |

MPP 72唯一条目/CRC正常；内嵌MPE等于独立MPE；相对B root patch DEX与全部资源不变，变化仅构建manifest及内嵌extension。**84/84组合**成功，structure/selection与B逐字节相等。最终APK **11 DEX、58,047类、322,101 methods、625,106 branch edges、112,402 switch cases、46,628 try blocks**，invalid_branches/dex_problems/binding_failures均0。MPE 1,430类，相对B新增16、移除5（均仅synthetic）、净增11；动态类清单未硬编码旧数量。N27类/事件/回调0。

MPP/MPE/APK的branch工具自测、实际分支/API绑定及CompositionDexAudit通过；归档工具34文件SHA核对。设置XML/资源池/14 preview hint通过。aapt确认 app.morphe.android.youtube / 21.16.256 / 1561068412 / minSDK28 / targetSDK36 / supportsRtl=true。apksigner只执行verify，退出1、DOES NOT VERIFY、Missing META-INF/MANIFEST.MF符合unsigned；ZIP无签名条目且无APK Signing Block。没有签名、安装或发布。

62历史产物及168个原证据SHA已在门槛复核，收尾再次逐文件核验在history-after.json；此前两轮B/C原dump、原自然死锁栈及只读快照仍保持原字节。新快照保存1,828个开始文件原内容与SHA、binary diff和未跟踪内容，路径 `E:\Projects\morphe-caption-v2\.verification\n28c-scheduler-fix\2026-10-02T05-46-38-772884Z\snapshot`，不覆盖旧1,893文件快照。

## 6. 交付边界

工程与静态审计仅证明本轮输入/平台/fixture的性质；真机YouTube启动、OEM字体/ICU、设备负载、远程供应商实况及14语言母语语义未验证。已目检最终SDK28 native ar/ja/de/hi四张PNG，只作为fixture几何证据；不伪称手机截图或语义验收。

用户仅观察未签名正式候选的启动、中文对照、pause/seek/换视频/rotate、少量RTL/长词/宽字截断与冷热cache切换；保留设备、Android、target/UI locale、时间段与原诊断。用户不承担逐语种翻译审校。不启第四期。

---

## 交付实现身份

核心实现提交：`4d98eec20f9f9d1d9a8b2bf0e52934cade8d93b0`。真实锚点：`anchor/n28c-4d98eec`，精确引用该实现提交。该提交同时包含“既有调度基础修复”和“非中文呈现”，并保留进入本卡前获准的PROJECT-STATE改动。实现提交完成后，工作区已核验干净。

此身份段仅由后续 docs-only 提交补充；最终产品及测试树与核心实现提交相同。全部交付字节/原始测试/源码输入/锁清单/历史保护见本轮证据目录，最终HEAD是核心实现的docs-only后继。

---

# 修复前隔离报告（原文保留；下列状态仅描述当时）

# N28C 死锁隔离根因与 Codex 回流清单

日期：2026-10-02（Asia/Shanghai）。状态：**EXISTING_N28B_SCHEDULER_BLOCKER / UNFIXED / NOT_DELIVERED**。

本轮完成只读保存、两棵树的实际编译运行、确定性死锁捕获、源码和 class 锁图核实。**没有实施产品修复，没有完成本卡全部要求，不是 N28C 工程验收或交付声明。** 按任务卡第7节“既有基线问题或仍未闭合”的停止分支保存结果并给出 Codex 回流清单，没有用单次绿色测试解锁交付。

## 1. 结论与修复/回退决策

**已证明是既有 N28B 产品锁顺序反转，不是 N28C 分页/字体/RTL 引入，也不是仅有测试生命周期问题。**

- 纯 N28B 从 Git 锚点 `anchor/n28b-d02d7cc` 独立生成、编译，不加载主工作区或 N28C classes；两轮受控输入都被 MXBean 和 jcmd 判定为1个 Java-level deadlock。
- 保留全部分页/RenderSpec 改动的 N28C 快照在同一受控输入上也两轮全部死锁。
- 原有 `N28BProductionTest.actualPolicyColdWarmAndUiMatrix` 两边本次各执行一次并通过。**没有再次自然触发不等于不存在缺陷**；原始 C 全量死锁栈完整保留，不被此次 PASS 覆盖。
- 决策：**不回退到 N28B 作为死锁修复**，因为纯 B 也有同一个环；N28C 保持未交付。修复必须独立标记为“调度基础修复”，不能包装成几何修正。N28B 真机不作为前置条件。
- 本轮不做仅移除 `current` 的 synchronized 的局部补丁：它可能打断已观察环，仍留下 Controller→Session、锁内外部回调和 cache 提交与撤销竞争，不满足任务卡契约。

## 2. 保存、Git 身份和输入隔离

主仓库：`E:\Projects\morphe-caption-v2`。开始/结束 HEAD 均为 `26692ed03344cadda443bca584e2c91c7eb54206`。它相对 `8e28f4bce557fc7e6bcbe2d04430beb2429886fd` 只新增 `docs/N28C-CODEX-TASK.md`。N28B 锚点为 `d02d7ccefbd3847d7c1df3b0306e22a3a14429f0`；锚点到 8e28f4b 只有 N28B 交付文档和 PROJECT-STATE 文档差异。C 无实现提交或锚点。

只读快照：`E:\Projects\morphe-caption-v2\.verification\n28c-deadlock\snapshot-2026-10-02T04-39-36-427Z`。

保存1,893个原文件的内容、字节、SHA-256，`git diff --binary HEAD`、原始 status、Git关系。未跟踪新增文件也保存内容；快照文件已只读。没有 reset、stash、clean 或删除任何未提交代码。原有 PROJECT-STATE 修改进入本轮前已存在，未回退/改写。

隔离输入：

- B：`E:\Projects\morphe-caption-v2\.verification\n28c-deadlock\n28b-input`，从锚点 git archive 提取，只读源码。
- C：`E:\Projects\morphe-caption-v2\.verification\n28c-deadlock\n28c-input`，同一归档基础加开始时的未提交源码快照。C 身份必须引用 HEAD＋快照SHA，不能伪造 C 提交。
- 仅隔离树 build/.gradle 为可写输出，不向主仓库写编译class/trace；所有临时日志/脚本/agent/锁图保存在 `E:\Projects\morphe-caption-v2\.verification\n28c-deadlock`。
- matrix 原有测试两边 LF 内容 SHA 相同：`eda9b25531bccb740d142f6b0ee52171554fa22c39c70e2e9080e8595a77ed12`；raw SHA 差异是 Git archive LF 与 Windows CRLF，不是测试改动。

实际 main class 清单为154（B）和156（C），完整SHA见 `*-compiled-and-lock-inventory.json`。纯B中 C 新类数为0；第二轮探针另用实际 ClassLoader 验证B找不到 CaptionRenderSpec、C能找到。Robolectric instrumented 类 CodeSource location 返回 null，**没有伪造非空加载路径**；栈行号、编译class清单、隔离输入、类存在断言共同提供身份对照。

保存后逐文件校验：原1,893个输入在文档更新前全部SHA一致；62/62历史产物字节/SHA一致。机器清单为 `preserved-input-check-before-docs.json` 与 `history-preservation.json`。所有65个原有Java测试保留，不改断言。

## 3. 实际运行结果

| 树 | 输入 | 结果 | worker PID | 耗时 |
|---|---|---|---:|---:|
| n28b | 受控 stop/schedule 第一次 | DEADLOCK_CONFIRMED | 26992 | 27.304s |
| n28b | 原有 actualPolicyColdWarmAndUiMatrix | PASS | 22828 | 32.107s |
| n28b | 受控 stop/schedule 第二次＋类隔离断言 | DEADLOCK_CONFIRMED | 17752 | 21.485s |
| n28c | 受控 stop/schedule 第一次 | DEADLOCK_CONFIRMED | 47660 | 24.484s |
| n28c | 原有 actualPolicyColdWarmAndUiMatrix | PASS | 17580 | 32.236s |
| n28c | 受控 stop/schedule 第二次＋类隔离断言 | DEADLOCK_CONFIRMED | 47660 | 21.815s |

两轮受控失败各有独立目录，第二轮不覆盖第一轮。早期探针编译失败（Android编译不能直接引用 java.lang.management/Files.writeString）日志也保留于 `n28b-probe` / `n28c-probe`，不计入产品运行结果。修正只涉及外部探针，MXBean逻辑放在真实JVM agent，未改生产/原有测试/依赖。

看门狗：构建硬上限240秒，屏障与每轮竞争硬上限5秒；MXBean每50ms检测。检测到死锁后保存全JVM栈，外部执行 `jcmd <worker-pid> Thread.print -l` 和 `VM.command_line`。**只终止本次agent登记的Test Executor worker**，Gradle如实非零退出；不杀其他daemon/Java/Codex，不增大原测试超时，不禁用/放宽测试。

每个受控失败目录含 `result.json`、`worker.pid`、`gradle.log`、`watchdog-mxbean-full.txt`、`jcmd-Thread.print-l.txt`、`jcmd-command-line.txt`。全栈含全部线程名、monitor、owner、栈帧和同步器，不只截摘要。

证据完整路径：

- 原自然触发：`E:\Projects\morphe-caption-v2\build\n28c-records\test-worker-observation.txt`（11:49:37 +08:00），未覆盖。
- B新dump：`E:\Projects\morphe-caption-v2\.verification\n28c-deadlock\n28b-probe-confirm\jcmd-Thread.print-l.txt`。
- C新dump：`E:\Projects\morphe-caption-v2\.verification\n28c-deadlock\n28c-probe-confirm\jcmd-Thread.print-l.txt`。
- 总表：`E:\Projects\morphe-caption-v2\.verification\n28c-deadlock\baseline-results.json`。
- 原 `build/n28c-records/baseline-lock-scope-check.json` 原字节保留，其“pure runtime not_run”是当时事实，本报告补充新结论，不覆写旧证据。

## 4. 真实调用图与锁反转

C = RebuildController.class，S = 同一个 Session 实例。

```text
测试/停止线程 → stop [持 C] → Session.cancel → Session.retire [等 S]
调度线程     → kick → schedule [持 S] → current [等 C]
C → S → C：锁顺序反转，构成闭环。
```

原自然触发栈含 kick→schedule→current。受控最小输入直接调用真实schedule，并用同一个S monitor的外部屏障固定竞争，不替换/模拟产品锁或方法。

第二轮实际对象和行号：

- B：C=0x00000000e38f16a0，S=0x00000000e3efeba0；stop:282→cancel:116→retire:128，schedule:748→current:238。
- C：C=0x00000000e30bd040，S=0x00000000e3648fc0；stop:288→cancel:122→retire:134，schedule:754→current:244。

不是“源码大体相同”结论：

- cancel、retire、current、stop、schedule、scheduleTick、kick、video、activate 的LF源段相等。
- cancel、retire、current、stop、schedule、scheduleTick、kick 的实际编译操作码/分支目标/调用符号相等；仅剔除常量池索引与javap对齐空格，不剔除操作码/锁标志。current/stop的ACC_SYNCHRONIZED仍在，两边schedule都先monitorenter(S)再invokestatic(current)。**不声称整个class二进制相同**。
- translate 整体不相等：C新增legacy RenderSpec限定可读性诊断，但锁拓扑相同；它不是本次闭环成立的必要条件。

机器证据：`critical-method-source-comparison.json`、`critical-method-bytecode-semantic-comparison.json`、两组完整controller/session javap、逐方法源段/反汇编。原始仅去CP编号但保留对齐空格的比较也保留，不能把对齐空格造成的schedule hash差异当作业务不同。

## 5. 全部同步区及其他持锁依赖

对应隔离树下的 `extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/RebuildController.java`；C行号也对应当前主树。共21个显式/隐式同步区。connections synchronizedSet在B:89 / C:95提供集合操作自己的monitor。

| 方法 | 锁 | B 行号 | C 行号 |
|---|---|---:|---:|
| cancel | connections | 118–122 | 124–128 |
| retire | this | 127–132 | 133–138 |
| current | RebuildController.class (implicit ACC_SYNCHRONIZED) | 237–239 | 243–245 |
| video | RebuildController.class (implicit ACC_SYNCHRONIZED) | 262–277 | 268–283 |
| stop | RebuildController.class (implicit ACC_SYNCHRONIZED) | 279–285 | 285–291 |
| activate | RebuildController.class | 362–397 | 368–403 |
| time | s | 419–438 | 425–444 |
| position | s | 469–487 | 475–493 |
| scheduleTick | RebuildController.class | 509–512 | 515–518 |
| tick | RebuildController.class | 517–519 | 523–525 |
| tick | s | 524–526 | 530–532 |
| kick | s | 536–544 | 542–550 |
| load | s | 560–564 | 566–570 |
| load | s | 608–626 | 614–632 |
| load | s | 659–668 | 665–674 |
| schedule | s | 747–844 | 753–850 |
| translate | s | 898–925 | 904–931 |
| translate | RebuildController.class | 935–941 | 941–947 |
| translate | s | 954–1006 | 960–1012 |
| translate | s | 1014–1023 | 1020–1029 |
| render | s | 1107–1198 | 1113–1205 |

必须一并覆盖：

1. video隐式持C调用stop，activate持C调用prev.retire，也是C→S；不能只修stop。
2. load两个S区和translate发布S区内调用current，也是S→C；不能只修schedule。
3. translate持C缓存区调用RebuildCache.write（写入实现取RebuildCache.class）；schedule在S区做cache.read/几何/diagnostics；cancel在connections区disconnect；time在S区disconnect。属于既有外部锁/长持锁路径，**不另外声称已经捕获第二个死锁**。
4. tick先释放C后才取S，本身不构成C→S嵌套；scheduleTick的MAIN.postDelayed也已在C区之外。
5. retire在S内调用endFallback→static synchronized CaptionDiagnostics.mark及持久化；generation/cancelled/retired的现有更新在S区外，必须审计。
6. position(s)经播放器读取后取RebuildClock monitor，再可能取S；tick/load现有持S调用position(s)，应改为锁外快照，不能留媒体/Clock跨锁回调。

## 6. 最小独立修复方案（提案，未实现）

目标只改变生命周期/持锁协议，不改focus=2、prefetch=1、budget、预取、storm、retry、source ownership、cache scope、中文黄金、C呈现。

1. Controller只做active/video/generation/tickPosted短状态交换。current采用无锁引用/世代快照或完整验证的单锁协议；不得持S调用会取C的函数。
2. stop/换视频/activate用两阶段：C内取出或替换active与失效快照，释放C，再在对应S内撤销发布权/清pending。重用分支在S中二次核验current/epoch；旧取消不能清掉新Session的UI。
3. retire/cancel在S内只更新状态、冻结副作用快照，锁外诊断/UI；connections内只复制和清空，锁外disconnect。保留sent && retired旧请求结束权限，不吞异常/跳过cancel。
4. schedule的lane/attempt/retry/pendingFocus仍在S内一次记账；cache读/几何/diagnostics/executor提交在锁外，回S后核验相同session/epoch/job才接纳。cache命中不占网络配额，禁止重复dispatch。
5. translate HTTP/parse/review尽可能锁外，S内只核验发布。**cache提交与撤销的线性化要专门证明**：不能粗暴删掉现有持C写文件的互斥，变成失效旧job再写cache。选定受控提交/撤销协议并验证原子边界，不得新增锁内Cache/Controller/Session嵌套或网络/UI/诊断。
6. load/cache/source失败/render/结束清理统一二次generation/current核验与不可变副作用快照，保留业务判据/错误分类。

不是仅改一行synchronized。cache线性化、并发activate重用、迟到UI清理尚未实现/验证，是没有把临时改锁当交付的边界。**已有用户授权不缺失；这些是Codex回流实现工作，不转交用户做技术排查。**

## 7. Codex回流与恢复交付门槛

- [ ] 独立标记“既有N28B调度基础修复”，保留纯B失败证据，不回退/覆写当前C，不冒称C几何引入。
- [ ] 实施§6，逐同步区核验无C→S/S→C嵌套、无锁内跨锁/外部回调；保留cache admission、late-result、owner、quota契约。
- [ ] 新增生产并发回归，建议至少200轮受控竞争：stop、换scope/session、schedule、迟到HTTP/cache、source失败、换视频、UI/测试清理。每轮固定硬超时，失败full dump/锁图，不靠睡眠偶然调度。
- [ ] 验证stop→cancel→retire完成后旧Session不发布plan、不写新scope cache，新Session正常schedule/translate；旧已发送job原回归也继续通过。
- [ ] 65个原有Java测试字节/断言不动，完整原目标579全过；新增并发测试另行准确计数，不为写“579”删原测试/漏跑新增。
- [ ] 重新执行专项、中文golden、44项和14目标、Python27、本地化220×14；冻结准确4通过/4既有失败/4未验证，三个invisible_ms指标0。
- [ ] 核对verify_delivery的frozen状态期望：进入本轮时PROJECT-STATE已有获准docs改动，不能用旧期望回退状态，也不能改期望掩盖产品变化。
- [ ] 死锁修复/重复回归通过才buildAndroid/正式-n28c三件套，从交付MPP自身组合APK，再做84组合、11DEX/branch/资源/aapt/apksigner/历史hash。
- [ ] 一个核心实现提交、anchor/n28c-<actual>、真实干净工作区；全部门槛后仅交未签名包让用户观察。不安装/签名/发布，不开始第四期。

## 8. 本轮修改、测试计数和交付状态

本轮主仓库产品/测试/依赖/资源修改数：**0**。仅新增本报告、更新N28C本地阻塞记录；脚本/agent/锁清单在忽略的.verification证据区。原有未提交C完整保留。没有源码修复提交或C anchor，工作区仍有原有未提交内容，不能称为干净。

578/578发生于最后font-locale保护前；本轮没执行最终579。旧44/44、中文golden、14目标、Python27/localization/冻结属于历史证据，不是本轮重新验收。当前冻结文件实际读值仍4/4/4，pending_translation/event_review/overflow的invisible_ms=0。

正式三件套仍不存在；bytes/SHA不适用：

| 完整期望路径 | 状态 | bytes / SHA-256 |
|---|---|---|
| E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n28c.mpp | 未创建，不交付 | N/A |
| E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n28c.mpe | 未创建，不交付 | N/A |
| E:\Projects\morphe-caption-v2\build\n28c-composition-final\YouTube-21.16.256-本地测试包-n28c-unsigned.apk | 未创建，不交付 | N/A |

没有正式84/最终DEX/aapt/apksigner验收，没有安装/签名/发布/手机观察/第四期。停止线维持。

未覆盖：修复后stress/全量、cache线性化、concurrent activate清理、真机、多语种母语语义。之后仅正式交付后由用户检查启动/中文回归/客观几何/RTL混排，不承担逐语种审校。
