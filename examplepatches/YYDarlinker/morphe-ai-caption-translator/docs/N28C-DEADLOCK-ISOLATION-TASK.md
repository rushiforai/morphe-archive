# N28C-DEADLOCK-ISOLATION-TASK：先处理调度死锁，再继续正式交付

日期：2026-10-02（Asia/Shanghai）。Codex执行本卡。当前N28C未完成正式交付，禁止安装/签名/发布当前N28C工作区，也禁止启动第四期。

## 1. 当前事实与真机决定

N28B已完成工程交付，呈现仍是`legacy_n26`，没有新分页、字体、RTL或控件视觉行为；N28B真机不是进入N28C的强制门槛。用户可以使用既有N28B包做可选冒烟：启动、主页/设置、中文字幕、换视频/返回；只有异常才导出诊断。用户不需要理解其他语种，也不需要为N28B逐语种审阅。没有N28B真机结果也不得阻塞本卡。

当前工作区保留N28C未提交代码和证据；不能把专项44/44、中文golden、14目标矩阵等结果包装成最终通过。N28C正式三件套、84组合、最终DEX/branch/aapt/apksigner均尚未完成。

首轮578/578是在最终字体locale保护加入前，最终目标579全量未完成。N28C交付记录为`docs/N28C-LOCAL-TEST-BUILD.md`，完整死锁线程证据为`build/n28c-records/test-worker-observation.txt`，N28B锁路径对照为`build/n28c-records/baseline-lock-scope-check.json`（若实际路径名称不同，先按`Get-ChildItem build/n28c-records`找真实文件，不覆盖证据）。

## 2. 先保存与隔离

1. 核对当前Git状态，确认只保留N28C文件和docs/证据；不要reset、stash、clean或删除未提交代码。
2. 以当前工作区只读快照保存源码/测试/证据的文件SHA与`git diff --binary`，记录N28C开工HEAD `26692ed`、N28B源码锚点`anchor/n28b-d02d7cc`、N28B基线`8e28f4b`的关系。N28C不具备源码提交/锚点。
3. 建立临时、只读的N28B对照运行输入（优先从`anchor/n28b-d02d7cc`或N28B交付源生成，不在主工作区改动）。避免两个Codex进程同时写主仓库；临时对照日志放`.verification/n28c-deadlock/`。
4. 当前任何N28C候选APK都不是交付物；不得安装。

## 3. 根因核实矩阵（必须先做，不要直接改锁）

复现同一触发序列：测试线程执行`RebuildController.stop()`/Session.cancel/retire，调度线程执行`kick → schedule → current`。用超时看门狗和`jcmd <pid> Thread.print -l`/JVM MXBean死锁检测输出，保存完整线程栈、线程名、持有/等待对象、测试名和提交SHA。禁止用重复重跑、放宽超时、禁用测试或只杀Gradle进程掩盖。

对照至少两次：
+
+* **N28B纯基线**：`anchor/n28b-d02d7cc`/N28B交付源码，不加载N28C classes。执行同一`N28BProductionTest.actualPolicyColdWarmAndUiMatrix`及最小化stop/schedule复现；记录PASS、FAIL或未复现。
+* **N28C当前树**：保持所有N28C分页/RenderSpec改动，运行同一复现；若首轮已死锁，必须用自动超时确定性捕获。
+
+若N28B也复现，标为“既有N28B调度阻塞”，不要伪称N28C引入；在N28C前先给出最小独立调度修复/回退决策。若仅N28C复现，继续定位N28C新增调用链/锁持有时间。两种结果都要保留相同输入和线程dump。
+
+审阅以下真实方法，不接受“源码大体相同”结论：`RebuildController.stop/current/schedule/kick/translate`、`Session.cancel/retire`及所有` synchronized(RebuildController.class)`/`synchronized(s)`/锁对象；用调用图和每个同步块行号列出持锁顺序。重点验证是否存在：
+
+* Controller class lock → Session lock（停止线程）
+* Session lock → Controller class lock（调度线程）
+
+这两个方向同时存在就已是锁顺序反转。Baseline对照必须按实际源码和实际编译class检查，不能只看文本或N28B交付说明。
+
+## 4. 修复约束与推荐方向
+
+先给出根因报告和最小修复方案，再修改。修复目标是消除嵌套锁反转，而不是改业务策略：
+
+* 不得在持有Controller class lock时进入Session synchronized，也不得在持有Session lock时调用会获取Controller class lock的`current/stop/schedule`。
+* 优先“两阶段”方案：在Controller锁内只读取/替换active/generation等不可变快照，释放Controller锁；之后在Session锁内更新该Session；或反向固定唯一锁顺序，但必须覆盖所有stop/cancel/schedule/late-result路径。
+* 不在锁内调用网络、MockWebServer等待、Handler/Executor、UI、诊断回调或需要另一把锁的函数。
+* `current(s)`若必须读active，使用无锁generation/引用快照或明确的单锁协议，不用拿锁再回调Session；`Session.retire/cancel`不能在持Session锁时进入Controller锁。
+* 保留N28B调度语义：不改并发槽位、预取、storm、retry额度、source ownership、cache写入规则；不通过跳过cancel、吞异常或加无限超时绕过。
+
+如果baseline也死锁，修复必须单独记录为调度基础修复，不能假装只是N28C几何修正；中文黄金和N28B工程行为必须继续不变。若能证明为测试生命周期/执行器问题而非产品锁，修测试fixture/生命周期也必须说明，不能把测试删掉。
+
+## 5. 必须新增的确定性回归
+
+* 一个最小的生产级并发回归：停止/换Session与调度/迟到结果并发至少重复足够次数，受控屏障确保覆盖锁竞争；每轮有硬超时，失败输出线程dump/锁图。
+* stop→cancel→retire完成后，旧Session不发布plan、不写新scope cache；新Session可正常schedule/translate。
+* late HTTP/cache结果到达、source失败、换视频、UI/测试结束清理均不死锁。
+* N28B纯基线复现结论保留；锁修后N28C测试达到最终579目标，专项、中文golden、44/44及14目标矩阵继续通过。
+* 不删/放宽原有N28B测试；测试数量、冻结4/4/4、Python27、本地化220×14及ACCEPTANCE/frozen准确报告。
+
+## 6. 正式交付停止线
+
+死锁未能被根因解释、修复并由并发回归重复验证前：不构建正式N28C三件套，不运行最终DEX/84/aapt/apksigner作为通过，不安装手机，不进入真机观察，不开始第四期。
+
+修复后重新执行N28C完整579、Python27、220×14、冻结计分板、84组合、最终11DEX/branch/资源/历史hash保护；从交付MPP自身组合APK，产物使用`-n28c`独立路径。提交一个核心实现，锚点`anchor/n28c-<actual>`，工作区干净；更新`N28C-LOCAL-TEST-BUILD.md`并写明baseline对照结果和死锁不再复现。
+
+只有正式交付和静态审计通过后，才把未签名N28C包交用户做真机观察。用户重点看启动/中文回归/多语种客观几何与RTL混排；不承担母语翻译质量审校。
+
+## 7. 输出要求
+
+本卡完成时必须提供：死锁根因/锁图/两个基线结果、修改文件与代码契约、并发回归/最终579结果、三件套全路径/字节/SHA、提交/锚点/工作区、未覆盖边界。若只是baseline既有问题或仍未闭合，停止并给出Codex回流清单，不交付半成品。
