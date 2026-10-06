# N28C-R1 最终本地交付：主线程生命周期响应与非中文最短页

日期：2026-10-02（Asia/Shanghai）。状态：**ENGINEERING_PASS / UNSIGNED_DELIVERY / DEVICE_NOT_VERIFIED**。

两个放行前工程缺口已分别补受控现状证明、实现和最终验证。不是恢复旧B、N27或撤回N28实验；原C锁环修复与呈现功能保留。本记录不代表手机/OEM/远程实况/母语语义验收，也没有改变冻结4/4/4。第四期暂不发，交付闭合后停止。

## 1. 身份与冻结范围

- 真实开工HEAD：`ce372cf4100a3a9af27ae0c1bcb5779341845221`；产品源码：`4d98eec20f9f9d1d9a8b2bf0e52934cade8d93b0` / `anchor/n28c-4d98eec`。两点之间只有docs；工作区原规划docs和两份状态档案获准保留。
- 最终完整产品/测试输入SHA：`3c6b788861fe19f093ec18dcb19e4095ae9bc3849e482194ed591056d462b01e`（`full-final/inputs.json`逐文件清单）。核心实现提交：`9a7bdf35351b9a052233bac8b9004241548eb1eb`；真实新锚点：`anchor/n28c-r1-9a7bdf3`，精确指向该提交。本段身份附记为独立docs-only后继，不改产品树或重新建包。
- 产品只改5个文件：`RebuildController.java`、`RebuildCache.java`、`CaptionLanguagePager.java`、`CaptionRenderSpec.java`、`CaptionOverlayV2.java`，均在 `E:\Projects\morphe-caption-v2\extensions\extension\src\main\java\app\yydarlinker\deepseekcaptions`。
- 65份原Java测试逐文件SHA不变，中文fixture、18组golden和legacy activate全字段相等。请求/prompt、n28b-policy-v1、scope、源文/token/owned时间/数字语义、供应商调度、配置、字号/颜色/透明度/拖动位置、菜单/patch/resources/build/dependencies均冻结。
- focus2/prefetch2/总4、seek storm、attempt/repair预算、旧HTTP已在途允许完成规则不变。
- 原4d98eec/ce372cf、B/C三件套、失败证明和历史记录保留。11787份本轮捕获历史文件、原168份证据和62件历史产物SHA/字节均复核不变。

## 2. A：UI逻辑完成与后台物理完成分离

### 实际现状证明，不以静态审阅冒充测试

`main-before-03`在SDK28、INSTRUMENTATION_TEST真实main Looper，使用生产schedule→prepare→reserve→commit入口，在实际Prepared.commit边界持有屏障。main发布stop和下一条Handler消息：许可未释放时stop未返回，下一条消息也未执行；外部250ms观测截止捕获完整线程栈。释放commit屏障后两者继续。未增加production的5秒期限，未用sleep碰运气，也未声称复现手机ANR。

前两次测试工具编译/主线程Activity构造错误保留于`main-before`/`main-before-02`，修正工具后才得到上述现状证明；产品当时仍是原C。

### 完成语义与清理

| 调用 | 返回/完成含义 |
|---|---|
| main Looper上的公开stop、video、activate/refresh及native/开关链 | Publication已revoke，active交换完成，旧render无权应用，最小Session标记完成，旧UI清除已提交；**不代表**旧许可文件和disconnect物理结束 |
| off-main公开stop/cancel/retire | 同样先撤销/标记，再执行显式物理barrier；许可与清理共用原5秒截止，失败明确抛英文reason |
| off-main `Session.awaitRetirement()` | 可对已经逻辑撤销的Session等待/重试物理完成；main显式调用该barrier会报`retirement_barrier_on_main`，普通UI入口不调用它 |

Controller的短区只交换active/epoch和CAS撤销；最小Session标记在独立短S区完成。connections短区立即复制并从逻辑集合移除旧连接，保存在Session的待disconnect集合，真正disconnect/诊断落到后台。stop/video的clear在后台barrier之前发出；清理任务不发迟到clear、不更改新字幕。

专用清理执行器：**1个线程、容量16的有界任务队列**，Session级CAS去重；清理任务自身**不等待Publication许可**，不进入会被它等待的source/translation执行器。容量拒绝保存`retirement_cleanup_capacity`和清理资格，绝不伪称完成；显式后台await可重试。40个受控重复请求验证队列上限/去重/拒绝状态/释放后的恢复。retire完成后仍可升级stop并实际disconnect，generation只推进一次。

后台permit超时为`publication_commit_timeout`，中断为`publication_commit_interrupted`（保留线程interrupt位）；cleanup超时/异常有独立英文reason。失败保持cancelled、publication revoked、旧plan不能更新/重新启用；UI入口无该等待和未捕获barrier异常。

### 许可线性化与同key顺序

reserve/revoke继续共用同一Publication CAS。撤销后，包括已经fsync但尚未reserve的旧结果，均不能取得新许可、写新scope或接纳旧plan。撤销前已reserve许可只能收尾其准备好的原key；不把失败commit标true。

Prepared在锁外完成序列化/temp/fsync后登记写入序号，最终Cache monitor内同时检查“同目的key最新成功序号”和atomic move。旧Prepared未关闭期间，引用计数保留该key的新成功序号；较新写入完成并close后旧写入仍被拒绝，最后一个Prepared关闭即移除索引，索引不随缓存key永久增长。真实请求的prepare先于reserve，先前许可序号因此先于撤销后新会话prepare。新的同key成功提交不会被迟到旧许可覆盖。

retire允许旧已发送HTTP完成原请求；stop取消/后台disconnect。两者都禁止迟到结果取得新资格。acceptance、generation、source/job/key/context和UI onApplied/renderSubmission等旧保护继续成立。

### 新main与后台验证

`MainLooperLifecycleTest` **11/11**：持实际commit屏障的main stop/换视频/native onSelection(null)/真实用户setEngine(false)链；切fr目标在旧文件仍持屏障时新会话已READY并显示；下一条实际main消息在许可未释放时执行；5秒后台超时、中断位和释放后可重新await；同key新旧成功/拒绝排序；迟到disconnect不能卡main或清掉新字幕；retire→stop升级；有界清理/去重/容量恢复。

成功后的main/held-permit全线程栈和结构JSON位于`full-final/main-held-permit-*-threads.txt`、`main-lifecycle-*.json`。原K12 **12/12**：原权限/迟到/UI应用/锁环断言保持。最后源码完整套件中的200轮，再以相同输入SHA受控运行200轮，合计**400轮同一最终C**；不是要求用户回测旧B，也不是重复随机试绿。

源码/实际javap审计**28个Controller同步区**，没有C/S/connections嵌套、跨锁诊断/磁盘/媒体/网络/disconnect工作；Publication/Permit无monitor。12个Controller/Cache相关debug/release class逐字节相同，绑定正式release构建。

## 3. B：非中文1200ms合同及实际短页对照

- 完整事件fitsTwo、字素/像素可行且duration≤7000ms，直接优先完整单页；CPL/CPS超参考只watch。
- 整个源窗<1200ms，只允许几何可行的完整单页，时长严格等于源窗；不拆页、借时、改译文、重复字或拉长。
- 真正多页的DP包含页数维度，容量为`floor(duration/1200)`，所有页硬两行/合法字素切口。每页先给**整数1200ms**，剩余按阅读权重作整数商/余数累积分配；不是1ms底座/浮点四舍五入。首尾、单调、完整logical text/原事件ID与时间保持。
- 七秒仍soft目标；无法合法分时而完整页几何可行则保留全文并watch。无合法两行+最短页方案，明确`page_time_capacity_unresolved`/`hard_geometry_unresolved`安全空白；几何/时间观察不触发额外付费repair。
- 中文旧分页、8CPS、评分/时长分配、fixture及cache key/namespace不变。非中文word/grapheme、NBSP、CRLF、BiDi、地区locale和旧C呈现保护保留。
- 非中文版本为`n28c-presentation-v2`，仅其现有缓存身份追加项升级；prompt、n28b-policy、scope不重做。没有清用户全cache，也不覆盖v1包/证据。

| 同一原输入/窗口 | v1 | R1 |
|---|---|---|
| en：`Model J-20 (12) remains visible with every complete word.`，原40矩阵首个tier0组合，100–1100ms | `Model J-20 (12) remains ` 100–521（421ms）；`visible with every complete word.` 521–1100（579ms） | 完整原文一页100–1100（1000ms） |
| ko：`완전한 자막 표시를 확인합니다.`，原生产矩阵0–2400ms | `완전` 0–283（283ms）；`한 자막 표시를 확인합니다.` 283–2400（2117ms） | 完整原文一页0–2400（2400ms） |
| 同一1000ms/54字符几何矩阵中硬两行无法容纳的16个组合 | 快速多页伪装全文覆盖 | 0页、安全空白、capacity/hard reason；不改变字体/输入/窗口以制造可见通过 |
| 原warm cache source2400ms，宽280几何 | 缓存全文重分成短碎片 | 时间容量不足安全空白，cache hit/attempt0/provider calls不增加、不付费repair |

原短页JSON保存为**预期不合格**样本：`short-pages-before.json`及`presentation-before/`；修改前测试在`tests-before/`。逐行原文与实际before/after页时段：`delivery-records/short-pages-comparison.json`（40+28行）。

| 实际矩阵 | 行/组合 | min page | min multi page | sub1200违规多页 | 安全空白 |
|---|---:|---:|---:|---:|---:|
| 原40几何（输入文本/1000ms/尺寸/五档/密度/fontScale不变） | 40 | 1000ms，短窗完整单页例外 | 无多页 | 0 | 16；其余24完整单页 |
| 14目标28冷/热生产行 | 28 | 1200ms（非中文统计） | 1200ms | 0 | 0；全部可见 |
| 汇总C生产trace（含7 required pair等） | 43 | 1200ms（非中文统计） | 1200ms | 0 | 1，原窄宽warm cache |

`N28CR1PagerTest` **10/10**覆盖600/700/1000完整短窗、2400 fitsTwo优先单页、真实421/579与ko283案例、283ms完整短窗例外、多页整数1200下限/完整文本/精确尾时、长事件无合法切口soft watch、容量安全空白、高CPS全文可见、NBSP/CRLF/字素切口及硬字形不足。没有扩大旧视频预算或重写旧输入。

## 4. 既有新C测试差异，65原测试和中文不放宽

| 文件 | 修订与保留的保证 |
|---|---|
| N28CGeometryTest | 同一700ms德国长词不再期待闪页；同一600ms/70单元原事件实测三行，改为capacity安全空白。validate区分短窗完整单页、合法多页每页≥1200、硬容量无法解的空白；Unicode/40矩阵原输入不变 |
| N28CProductionTest | presented/trace显式区分可见与容量空白；相同280宽warm cache与800ms原长事件不能继续“只需end>start”。空白trace记录0行/0宽而不是伪造渲染；冷/热缓存、attempt/repair、所有文本/owned时间保持 |
| N28CCounterTest | 增一方法验证1200和v2/中文旧namespace，SDK28与35各执行一次，增加2个测试实例；原12个实例保留 |
| SchedulerLifecycleRegressionTest | 原显式stop后立即断言connections物理清理的一个新K用后台线程调用stop并join，继续断言实际完成和原权限。其余K断言保留，并另加独立main契约；不删测试、不放宽权限 |

首轮定向工具/NATIVE配置及中断诊断保留位修正、首次完整3个失败、后续614通过与最终UI clear-before-barrier后全量614均保留独立目录，不能把失败或旧代码通过替代最终源码通过。

## 5. 最终验证，专项不替代全量

| 门槛 | 实际结果 |
|---|---|
| 最终全量C | **614/614**，zero failure/error/skipped = 538原基础 + 43既有C实例（原41+counter新2）+ 10 R1 Pager + K12 + 11 main生命周期 |
| 原44专项同一cohort | **46/46 = 原44 + 新counter在SDK28/35的2个实例**；单独`special-original44-plus-sdk`，不是把R1 Pager混入原cohort伪称44 |
| 受控并发 | full-final 200 + special-and-concurrency 200 = **400轮最终同输入C**；共享单轮5秒外部硬截止 |
| 中文 | 65原Java测试源码字节不变；legacy activate + **18组golden**相等 |
| 自动生产/几何 | 14目标28冷热 + 7 required pair + 40原几何；非中文违规多页0，安全空白数明确见上表 |
| SDK | SDK28主线程/后台/Native几何回归；counter SDK28/35；aapt minSdkVersion **28** |
| Python/本地化/冻结 | **27/27**、**220×14**；**4通过/4既有失败/4未验证**，三类invisible_ms全部0；ACCEPTANCE/frozen零diff |
| 正式MPP自身组合 | **84/84**；structure/selection与B/C相同 |
| 实际MPP/MPE/APK | 全根DEX、接口绑定、分支/异常边/归档CRC/头校验、资源设置XML与14 preview hint、aapt均通过；11 DEX / **58052 classes / 322123 methods / 625182 branch edges / 112402 switch cases / 46648 try blocks**；invalid_branches/dex_problems/binding_failures均0 |
| unsigned | apksigner仅verify：exit1，Missing META-INF/MANIFEST.MF；ZIP签名文件0，实际中央目录前没有APK Signing Block |
| 历史保护 | 捕获11787文件、原168证据/62产物及C三件套SHA/字节不变；没有reset/amend旧提交 |

## 6. 独立交付三件套

| 完整路径 | 字节 | SHA-256 |
|---|---:|---|
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n28c-r1.mpp` | 1125252 | `DB94A582AD7E895F68425AE029C78CB7788DD4627DCD163E85825B31E6B5119C` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n28c-r1.mpe` | 2757968 | `DB1C80C46AD5DDFC6D4A966C3B6E6C0E5F15E7DC8198DE708B31265F9507319F` |
| `E:\Projects\morphe-caption-v2\build\n28c-r1-composition-final\YouTube-21.16.256-本地测试包-n28c-r1-unsigned.apk` | 196959323 | `585A7F47D7937C7F744040865CCE0F9B506EFB53E44A8C7890CC7D430E3F7038` |

正式MPP72唯一ZIP项，内嵌MPE与独立MPE一致；与C只有manifest/extension内容差异，root patch DEX和所有资源相同。Gradle模块中间MPP不是额外交付渠道，以表内local-test包及其实际组合APK为准。

全部本轮证据根：`E:\Projects\morphe-caption-v2\.verification\n28c-r1`；最终原始全量：`full-final`；原44专项：`special-original44-plus-sdk`；另一200轮：`special-and-concurrency`；最终汇总/审计/hash：`delivery-records/engineering-final.json`及同目录日志；锁审计：`lock-audit`。复现工具在`E:\Projects\morphe-caption-v2\tools\n28c-r1`，构建全部offline，用既存JDK/SDK/patcher/审计工具，无新依赖或下载。

## 7. 仅一次有限真机复验，尚未进行

现在工程证据已闭合；用户下一步仅针对正式R1候选做一次有限观察，不先装/回测已知旧B锁环，不要求14语种阅读或母语语义判断：

1. 正常启动与中文对照；暂停、关闭/重新打开字幕、切目标、换视频、seek、旋转，无明显卡住。
2. 已有少数目标中看ar+Latin数字，ja/ko或de/fr是否裁剪、方向异常或快闪页。菜单没有的目标不新增第四期菜单；自动14目标矩阵已提供覆盖。
3. 保留完整诊断、异常时间段、设备/Android版本、target/UI locale与设置，回规划者分析；不要只给一段摘录。

手机YouTube/OEM ICU和字体、真实远程供应商、母语语义仍未覆盖。**未签名、未安装、未清用户数据、未推送/发布；零远程翻译API；本卡完成即停，第四期暂不发。**

## 8. 实现提交与docs-only身份闭合

核心实现：`9a7bdf35351b9a052233bac8b9004241548eb1eb`。源锚点：`anchor/n28c-r1-9a7bdf3`。该提交的父提交仍是原`ce372cf4100a3a9af27ae0c1bcb5779341845221`，原`4d98eec`/`anchor/n28c-4d98eec`和历史包/证据不动；实现提交同时保留本轮规划的N28C-REVIEW、R1任务卡与PROJECT-STATE管理更新。

本节及两份状态档案中的真实身份由后续docs-only提交写实。最终HEAD/工作区/产品输入/所有产物hash闭合记录位于`E:\Projects\morphe-caption-v2\.verification\n28c-r1\final-state.json`；后继源码/资源/build/测试必须与本实现锚点相同，不回写历史C记录或amend实现提交。
