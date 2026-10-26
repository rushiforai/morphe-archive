# M5d — 子范围补翻译遵守等待与过滤/终止门

任务卡v1；下发日期2026-10-25。M5c已统筹接受，当前基线746项，`1.5.8 / local-1.5.8-m5c`，公开1.5.7。仅处理F2，不进入M6或其他整理。

## 1. 问题及已授权的产品决定

M5a源码已确认：requestPageRepair/repairPage、fillHoles没有经过普通请求的全部providerRetry/retryAt及过滤/终止规则，子修复失败只记mark，不调用普通rejected的状态处理。M5b修正等待解析/溢出，M5c阻止退休后的新尝试，但都没有关闭F2。现阶段不能宣称已经动态证明额外收费。

本卡采用以下产品行为：

1. 当前会话的**每个新逻辑模型请求**，包括普通块翻译、结构/语义重试、page/hole子修复，都要尊重已经建立的Session providerRetry、本父块retryAt、会话terminal及父块content_filter停止状态。排队后门发生变化时，执行前也必须重查。
2. page/hole真实失败也必须按同一原因建立等待或停止门：429/5xx设置provider与父块等待；其他可重试失败保留相应本地等待；configuration故障终止本会话的新模型请求；content_filter终止本会话内该父块的自动模型请求，包括改问小范围。过滤不是全会话终止，其他块仍可工作。普通seek/代际变更不能清掉同一Session父块的过滤停止资格；新有效Session按原生命周期建立新状态。
3. **发送资格与有效内容分开**。已验证Plan、已显示文字、其他未覆盖范围不因补修失败被抹去。已有Plan可以继续READY/显示，同时不获准再次补问；没有译文仍保持原失败/空白规则，不能转用原文兜底。
4. 等待到期后，仍符合原有去重/次数/覆盖规则的请求可以恢复；等待中的拒绝不应永久占住未发出的page去重key或烧掉次数。已经实际发送/合法准入的记录保留。不要借本卡增加同页面重试、重置已消耗配额或改变每块4次page等既有上限。

这是针对已有故障规则的明确收紧。不是全面重写调度，不增加全局费用预算，不绕过提供方过滤，不承诺服务器未计费/退款。逻辑调用内部正常参数协商/stream降级沿用原规则；M5c仍在每次物理attempt检查生命周期。门建立前已合法准入的重叠请求按原作用域完成，不要求物理零字节原子保证。

唯一活动仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`，复用当前分支/工作树/既有修改。读取AGENTS、PROJECT-STATE当前身份/最新条目、维护入口、M5c REVIEW、本卡、当前网络/状态合同及路线相关部分。不得以HEAD代替完整入场工作树。

冻结基线MPP `build/maintenance/M1a/20261025-M5c-candidate-01/patches-1.5.8.mpp`，SHA-256 `b5ddc4eb94abbebce8a82406eef7db156ce947eac5877a7dc9ba7b700cbd677a`；MPE `461d4f33b09a90ee6f6001f6989c3d998e311e2a23b3262278c07f00dcdd45ec`。入场核对并保护。

## 2. 允许范围与实现要求

主要生产范围是RebuildController：schedule/实际调用前准入、requestPageRepair/repairPage/fillHoles及普通/子修复失败的共用原因决策和状态应用。必要时增加很小的内部helper或Session字段；解释其作用和初始化/替换/seek/reset范围。不要引入通用重试框架或借机拆整份controller。

- 尽量共用既有原因判断及RetryAfter.after安全加法，providerRetry取较晚值、服务端等待与原本地backoff取较长值。子修复不能偷偷缩短已有等待、把Long.MAX_VALUE溢出成负数，或用不同分类绕开相同故障。
- 调度入口防止无意义占位，实际逻辑调用前重查，明确准入与门更新的排序。不能只在enqueue检查，也不能只在render检查。若引入统一逻辑准入边界，说明哪些调用经过它；三处RebuildApi.translate及普通重试/排队路径均须核对。
- 拒绝准入应有限返回；仍需正常tick/kick能够在到期后按原资格重试。不要在线程内等待数分钟、增加轮询/timer、长时间持锁或在生命周期锁内做网络/磁盘/等待。
- 子修复Job与s.jobs中的普通Job不一定相同。不能直接套用要求s.jobs[index]==job的rejected而使处理失效，也不能清空/覆盖另一个在途Job。失败分类可共用，任务清理必须保留原归属。
- 过滤不能只靠READY/FAILED推断：已有Plan会保持READY，一般结构失败也会FAILED。保留明确停止原因或等价可靠资格；不要把所有FAILED块都禁掉，也不能让保留Plan掩盖过滤状态。terminal同样与有效Plan是否保留分开。
- 审计attempt/usage保留，逻辑准入、HTTP attempt、服务端收到数分别记录；等待前无发送不能伪造消费。旧有效Publication许可和缓存提交语义不变。
- 只有确实需要时才最小调整其他core文件，并说明为什么controller边界不足。core来源适配只更新实际改变的目的哈希/说明及派生patch；新helper按真实用途记录。固定上游commit/snapshot/upstream_sha256、其他记录、协议/提示词字面量、Hook ABI及校验工具保持。
- gradle.properties只将captionBuildId改为 `local-1.5.8-m5d`；产品1.5.8、公开1.5.7不变。

## 3. 不在本卡改变的行为

F1解析及安全等待、F4新物理attempt生命周期准入、finishSent/STOPPED/Publication、F3同语义缓存复用、F5现有诊断格式保持。源/Cookie/格式回退、模型prompt/协议、布局/分页和合并、sourceOnly零模型请求、AI/CC/原生语言/owner权威、profile/凭据、超时/线程数/并发预算不改。

不增加补修次数、全局总费用上限或新用户设置；不扩大失败原文兜底；不把持久缓存键/格式迁移混入本卡。工具/CI/发布链、依赖/Patcher/R8/SDK不改。确实影响本卡且超出边界的缺陷先如实说明，不能静默扩范围或放宽现有有效断言。

## 4. 先红测，再最小修复

保存入场清单/涉及原件/忽略前端和历史交付哈希。以冻结m5c生产代码先运行应有断言，动态证明代表性F2旁路，例如：真实429形成等待后page仍发POST，或真实content_filter后page再次向同父块发POST。保存原响应、时序、实际请求、XML和生产/测试哈希；仅运行相关红测，不重跑全部746或复制整个项目。

实现后覆盖以下实质边界，优先复用已有有效用例，不要求机械新增固定数量：

1. **等待准入与恢复**：真实受控HTTP→Failure→真实控制器状态；provider门与仅本块retryAt分别阻止page/hole新调用，门前1ms无新增attempt/POST、不烧未发送配额；到期后合法补修实际POST成功/合并。至少一例长于120秒，推进受控elapsed clock，不真实睡300秒；Long.MAX_VALUE不溢出。已有较晚provider门不被较短失败缩短。
2. **子修复失败建立门**：page、hole各经过真实RebuildApi及fixture HTTP，而非只伪造boolean。429/503等失败后，普通调度与另一个子修复都遵守同作用域等待；旧Plan仍保留，失败不写成成功。展示每条实际执行链，避免只测一个新helper就声称所有入口覆盖。
3. **过滤与配置终止**：普通调用或page/hole产生真实content_filter（HTTP inspected与200 finish_reason复用既有分类覆盖），父块不能通过page/hole/普通重试再发；保留已有Plan的READY也不能绕过。其他未过滤块可成功，非全局封锁。子修复configuration故障后，本会话不新发模型请求；已在途/退休完成及新会话规则仍有效。分类代表性与未覆盖组合如实列明，不要求穷举全部状态码乘积。
4. **排队窗口**：用有界latch/可控执行器扣住已排队未准入的page任务，期间建立等待/过滤/terminal，再释放；执行端重查拒绝，任务/去重/次数不会卡死，合法到期情形可恢复。另验证普通已排队任务不会在门建立后偷偷发一个新逻辑调用。明确已合法准入后重叠操作的限制。
5. **正向和内容保护**：正常page/hole成功、普通块协商、暂时故障在原等待/配额下恢复；补修失败保留旧有效事件，不替换已显示文字、不产生失败原文，不准入旧generation新publication。sourceOnly/CC/配置切换和M5b/M5c有效回归继续通过。
6. **次数与清理**：计数表区分父块attempt、page次数、hole slowRetries、逻辑batch、HTTP attempt和真实收到数；说明被门拒绝/合法准入后取消/已发失败分别怎样记账。既有上限及去重不增不减地按实际语义保护，测试失败时也释放队列、连接、线程、Host/Audit/Clock静态状态。

测试网络仅受控fixture，未映射源/模型路径直接拒绝，不回退真实YouTube/供应商；仅测试密钥。以latch/有界Future/可控时钟固定顺序，无新增Thread.sleep碰时序。对新增状态/排队用例做少量重复或顺序独立性检查即可。

若既有测试直接刻画了本卡已授权改变的F2行为，允许更新那一项的对应断言/名称，但必须记录旧→新映射及红绿依据；其他有效保护断言保留。旧报告/矩阵/期望原件不重写，不通过删除测试、放宽黄金断言或跳过失败制造全绿。

## 5. 完整验证及交付

固定源码/测试/来源后使用已接受verify-full入口，`1.5.8 / local-1.5.8-m5d`，Offline和RerunTests；记录两组实际XML/receipt/指纹、候选MPP/明确独立MPE/UI及负向身份拒绝。生产变化需本卡新候选，不覆盖历史包。工具沿用M1a输出布局即可，不因目录名改工具。

同一已确认原始21.41.525-SECONDARY、官方MPP1.48.0、Patcher2.0.0、104默认根+AI完成新候选真实补丁组合/资源重编译及现有DEX审计；保存输入/选择/运行时哈希、新旧APK逐条目差异。核对扩展预期变化及其他资源/Hook保护。缺输入准确写部分，不能单测代替组合。完整验证后及时归档同次compiled classes及receipt/指纹，避免之后Gradle回收中间物。

结果 `docs/maintenance/results/M5d-RESULT.md`，证据 `validation/runs/<date>-M5d-<unique>/`。报告包含实际生产边界/原因表、红绿/真实计数/执行路径、覆盖限制、来源/完整验证/组合、范围外与历史保护、候选身份及逐文件哈希保护回退。F2是否全面满足以上范围要如实判断；未完成不能因为全套绿就写已解决。

更新当前网络合同及必要状态合同、维护入口/路线、PROJECT-STATE和字节相同镜像，保留历史m4a/m5b/m5c观察；执行完成待复核，统筹保持待复核。未验证的远端CI、其他组合、设备、真实服务/收费不计作通过。

不commit/tag、推送/PR/发布、签名安装/清用户数据、调用真实付费API或清共享缓存。回退只针对本批入场原件且先检查退出哈希；后续修改拒绝覆盖，保留报告/证据/新旧候选，不reset/clean。完成后停止，交统筹复核，不自动进入下一任务。
