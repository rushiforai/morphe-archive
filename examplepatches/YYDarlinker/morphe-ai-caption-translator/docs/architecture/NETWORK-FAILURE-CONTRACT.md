# 网络失败、等待、取消和配置作用域合同

M5a调查 / M5b F1与M5c F4已接受 / M5d-R1补正01已统筹接受，2026-10-25；当前本地候选 **1.5.8 / local-1.5.8-m6a**（M6a完成待复核、统筹待复核；最后接受M5i candidate-01），公开仍1.5.7。普通与子修复失败、相关取消/语义修复收尾统一保留同一有效Session/父块已建立的较晚等待；实现及真实HTTP红绿见第10节和 [M5d-R1-RESULT](../maintenance/results/M5d-R1-RESULT.md)。F2在原卡及补正规定范围已接受，见[M5d-R1复核](../maintenance/reviews/M5d-R1-REVIEW.md)；原M5d复核/770项/候选和证据保留。状态归属沿用 [CAPTION-STATE-CONTRACT](CAPTION-STATE-CONTRACT.md)，M5a/M5b/M5c历史调查与结果入口见后文。

## 1. 六个层级不能合并为一个 failure 开关

下表的方法均为当前真实实现。`TC` 指 `translation-core/src/main/java/app/yydarlinker/deepseekcaptions/`，`SH` 指 `caption-shared/src/main/java/app/yydarlinker/deepseekcaptions/`，`INF` 指 `infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/`；正文链接指向源码，不是另一份算法。

| 层级 / 实现 | 表达和实际决策 | 已有有效断言 / 本轮补测 |
| --- | --- | --- |
| 源获取：[RawCaptionSource.fetch/loadFormats/loadFallback](../../infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/RawCaptionSource.java)、[SourceRecoveryPolicy](../../caption-shared/src/main/java/app/yydarlinker/deepseekcaptions/SourceRecoveryPolicy.java) | `Failure.category/retryable/retryAfterMs` 决定 controller 的源重试；格式/轨道回退是本次 load 内另一条决策。401/403 可先刷新匿名 Cookie，再读同一描述符；403 还可触发原格式回退。不是 provider 密钥阻断 | 已有 RawCaptionSourceFallbackTest 四项、N38SourceFlightsTest 三项；新增 SourceHttpFailureContractTest 三项真实 HTTP，连 `/sw.js` 也显式路由 |
| Provider 传输：[RebuildApi.send/transportCategory/transportReason](../../translation-core/src/main/java/app/yydarlinker/deepseekcaptions/RebuildApi.java) | `TransportFailure` 保留 phase、cancelled、timerFired 分类、elapsed/remaining；普通网络故障在 send 内不自动重放 POST | 新增真实断连一发一失败；实际 NetworkDeadline 定时器及取消优先级；connect/read 分类仅受控异常，未冒称两次真实超时 |
| HTTP / 参数协商：[RebuildApi.translate](../../translation-core/src/main/java/app/yydarlinker/deepseekcaptions/RebuildApi.java)、[ProviderRequestPolicy](../../translation-core/src/main/java/app/yydarlinker/deepseekcaptions/ProviderRequestPolicy.java)、[RebuildStream](../../translation-core/src/main/java/app/yydarlinker/deepseekcaptions/RebuildStream.java) | `Failure.configuration` 才是配置阻断开关。400/422 内容检查在协商前；stream 拒绝与可选参数协商分别重发。普通401/403/404阻断 endpoint/model/key 组合 | 已有 ProviderEndpointTest 参数/认证断言和 StreamingDisplayTest 回退；新增精确 2/3 HTTP、阻断记忆/reset、内容检查与普通403的区别 |
| 输出验证 / 修复：[RebuildProtocol](../../translation-core/src/main/java/app/yydarlinker/deepseekcaptions/RebuildProtocol.java)、[RebuildReview](../../translation-core/src/main/java/app/yydarlinker/deepseekcaptions/RebuildReview.java) | `Invalid.code` 与 HTTP 错误不同；JSON 容器损坏还可直接抛 JSONException；finish=length 为 output_truncated；合法前缀/部分计划与完整接受不同 | 已有 RebuildContractTest、RebuildStreamTest、ContinuousDisplayTest、N52DisplayRepairTest；新增外层损坏 JSON/length 各一 HTTP，均不返回 Plan |
| 调度：[RebuildController.schedule/rejected/load/requestPageRepair/fillHoles](../../translation-core/src/main/java/app/yydarlinker/deepseekcaptions/RebuildController.java) | Session.terminal、块 WAITING/FAILED/READY、retryAt、providerRetry、修复和慢重试各自维护；不是诊断枚举驱动 | 已有 CoreSessionIntegrationTest 401终止/429恢复/切视频/停止；M5a 实际HTTP Failure交给 rejected，检查17s及15s；M5b 再驱动真实 schedule、dispatch、HTTP 与接纳，用受控 elapsed clock 验证300s及日期到期前1 POST、到期后2 POST并有Plan。不是完整设备tick/所有子修复认证 |
| 诊断：[TranslationAudit](../../translation-core/src/main/java/app/yydarlinker/deepseekcaptions/TranslationAudit.java)、CaptionApplication → TokenCostAudit | batch 是逻辑调用；attempt 是每轮发送准入；response/quality/batch 是独立记账。所有 RebuildApi.Failure 在 catch 被记为 HTTP_CONFIG，包括429/503/content_filter，不能据此断言 terminal | 旧 TokenCostAuditGoldenTest 固定字段；新增 audit batch/attempt/失败类别计数。分类较粗是报告可解释性问题，不等于控制器将429当配置错误 |

## 2. 错误与终态

- 传输分类优先顺序是 **intentional cancellation → guard.timerFired → SocketTimeoutException 的 connect/read phase → NETWORK_IO**。remaining=0 不是证明 timer 已触发。reason 文本与 category 是两个字段；InterruptedIOException 的 reason 可为 read_interrupted，而 category 仍依实际异常类型决定。
- `TranslationSourceAccess.checkActive` 在发送前或读循环中可直接抛 InterruptedException；这条路径没有经过 IOException 包装，不能承诺所有取消都有 TransportFailure。一次审计 attempt 也可能在连接/发送前被取消，故不能把审计次数自动等同服务端收到次数。
- HTTP401/403/404：`configuration=true`，translate catch 写入进程内 blocked；同 endpoint/model/key 再调用在审计 batch 前拒绝，0新增 HTTP。controller.rejected 同时令本 Session terminal。目标、prompt、profile 名称不参与 blocked key。新凭据/endpoint/model 形成新组合；reset 清掉 blocked、portable、negotiated 和 stream rejected。集合超过128项时有清空逻辑，不是永久磁盘封禁。
- 400/422：命中 inspected 才是块级 content_filter；否则 stream 拒绝先降非流式；非流式再按 reason 协商或 configuration_*。响应文字出现 inspection 但状态403时，实际走普通 http_403 配置阻断。`finish_reason=content_filter` 也为块级过滤。
- 429、普通5xx：`configuration=false`；controller共用失败决策设置本块retryAt及本Session providerRetry；无Plan保留WAITING，有Plan保留READY。其他普通非2xx（如408）通常也为非配置失败，但没有429/5xx的 providerRetry 分支。不得直接套用 SourceRecoveryPolicy 的状态表。
- 结构拒绝/网络失败：通常 WAITING；已有可用Plan时保留READY，包含子修复configuration/content_filter失败；无Plan的过滤/配置失败仍为FAILED。filteredBlocks独立记录父块过滤，terminal独立停止会话的新请求，不从READY推断准入；修复失败不销毁已验证候选。
- 源 Failure 的 retryable：408/425/429/≥500为真，401/403为假；SSL为不可重试，SocketTimeout为可重试，InterruptedException/InterruptedIOException为取消不可重试，普通IOException为 network 可重试。嵌套 cause 的现有遍历顺序也保留，不能泛称所有嵌套 timeout 都一定优先于外层 IOException。
- 源 load 外层在非取消异常且有同语言ASR候选时仍可试轨道回退，**不以 retryable 过滤**。因此“源不可重试”不等于本次 load 绝不再连接；它是外层 controller 源重试的语义。

## 3. 次数、上限及可能增加费用的路径

| 单位 | 计数位置 / 上限 | 范围与限制 |
| --- | --- | --- |
| 逻辑翻译调用 | RebuildApi.translate → TranslationAudit.beginUnitBatch | 可为整块、结构/语义修复、hole或page子范围；不能称每块永远一次 |
| HTTP attempt | translate 每轮 beginAttempt；send 实际连接/写body | 协商重发各有新attempt。已取消准入可能未到服务端，本轮同时核对服务器请求数 |
| 可选参数协商 | round<2；negotiated.add(identity)一次记忆 | 最多一次可选参数降级重发；portable后续请求移除可选项但保留输出budget。并发 negotiation_pending 的delay=1200是另一路，不是网络重试 |
| stream fallback | 400/422拒绝或200流内error时 streaming=false、round-- | 每次调用最多一次；与参数协商组合可达 **3 HTTP / 1逻辑调用**。拒绝stream记忆到后续调用；流内error的fallback不永久关闭后续stream |
| block attempt / repair | markDispatched 增 attempts；job.repair 增 session repairCount | 普通路径2次；结构补救可给第3次；语义 MAX_SEMANTIC_ATTEMPTS=3；MAX_SESSION_REPAIRS=6。未dispatch的pending不收费记次；已dispatch未sent取消可归还次数 |
| no-plan慢重试 | schedule 的 slowRetries，MAX_SLOW_RETRIES=3 | attempts 达正常上限且仍无plan时重置到 maxAttempts-1再发，最多3个慢重试。只描述此循环，不能拿它当所有页面/代际总费用上限 |
| hole修复 | fillHoles，slowRetries从0增1 | 部分接受后最大的hole一次子范围调用，消耗同一slowRetries记忆；不按整块attempt增加。失败保留hole/有效Plan，共用父块等待/停止决策；门前拒绝不增加slowRetries，既有kick可恢复尚未准入的hole |
| page修复 | requestPageRepair / repairPage；每块 MAX_PAGE_REPAIRS_PER_BLOCK=4 | generation:index:range去重；seek重建代际可重置。独立逻辑调用且可再次协商；不按block attempt增加。入口及执行前重查current/sourceOnly/terminal/providerRetry/retryAt/父块filter，并保护job/provisional/coverage；未准入排队任务返还key/次数，已准入失败继续去重，不增加同页重试 |
| 并发 | focus2 + prefetch2；底层两个各2线程执行器 | 槽位和次数不同；page任务派到priority lane但不登记同一个s.jobs计数，不是“每个块至多四次请求”的保证 |
| 主源格式 | loadFormats preferred JSON3→original，至多两个不同格式 | 同一30s主阶段预算；每个格式内401/403可再发一次源请求并触发Cookie刷新；格式fallback只对指定错误开放 |
| 轨道回退 | loadFallback 最多3个同语言已知ASR描述符 | 整个fallback阶段另给30s，共享于候选，不是每个另30s；每候选仍可能两格式/鉴权重发。最坏预算组合不是简单“三HTTP” |
| timing reference | reference 最多3个profile尝试、共享1.5s | 这是loadTrack/profile计数，不是下层原始HTTP上限；缓存/共享flight可减少网络，鉴权Cookie可能增加HTTP |
| 源控制器恢复 | load失败设置sourceRetry；SourceRecoveryPolicy.delay | 750/2000/5000/15000/30000ms与服务端等待取max；持续故障可持续重试，限速而无总次数终点。重复activate可清sourceRetry/terminal并再尝试，不能称所有源路径全局有界 |

一个完全不成功、原因不变的普通block调度循环可理解为2次常规+3次慢重试，即5次dispatch。持续满足structuralRetry时不能简单算成3+3：慢重试把attempts降至1再dispatch到2，随后结构分支又允许第3次，源码可推得3+3×2=9次dispatch（repairCount最终5仍小于6）。这是对固定原因/无plan/无seek/无page的源码分支推导，本轮没有把9次完整调度/HTTP穷举写成动态通过。它不是会话/视频总付费上限。page/hole、重新进入/代际、协商都会改变实际HTTP数。

## 4. 时间、取消和等待

- 模型 translate 每逻辑调用创建一次 `System.nanoTime()` deadline：priority10s、prefetch16s；同调用协商/stream重发共用。send connect timeout≤4s，读timeout取剩余时间；NetworkDeadline 两个daemon定时线程可主动disconnect。每次重试新逻辑调用另有预算。没有为M5a缩短这些生产常量。
- 源主阶段30s、fallback阶段另30s；Cookie refresh共享源deadline且最多3s、进程内30s刷新间隔和single refresh；cache8分钟基于wall clock。源connect≤5s，body≤16MiB；模型body≤2MiB。SourceLoadFlights两worker、队列8、consumer按20ms段检查自己的取消/deadline；最后consumer走独立关闭lane，物理释放与注册表移除分开。
- `RetryAfter.delayMs` 在共享层解释 wall-clock 日期；模型 send 与源 HTTP 都调用它。delta-seconds 为 trim 后的 ASCII 数字（含前导零）；正秒值超出 long 或毫秒乘法边界时饱和至 `Long.MAX_VALUE`，不丢成0，也不加短cap。空白、缺失、无效、负数/带符号、过期/零等待回退0；日期按已有 `RFC_1123_DATE_TIME`，验证常见GMT格式，不声明兼容全部历史HTTP-date形式或完整RFC认证。日期差值也防溢出。
- **m4a 历史缺陷，M5a 原证据保留**：模型send曾只Long.parseLong并截0..120秒；300秒实得120000ms，未来日期实得0ms。**m5b F1修正**：真实429的300秒保留300000ms，真实503未来GMT日期保留wall-clock剩余值，17秒仍17000ms；日期测试用动态未来值及请求前/后wall-clock上下界，不依赖2031永久在未来。
- controller.rejected 仍取首次1200ms、第2次5000ms、第3次起15000ms本地backoff与服务端delay的max；429/5xx providerRetry仍至少5000ms，且与已有provider门取max。一次捕获elapsedRealtime，分别用 `RetryAfter.after` 饱和相加为retryAt/providerRetry。源load失败的sourceRetry用同样安全相加和原SourceRecoveryPolicy等待表。超出可表达范围保守保留Long.MAX_VALUE，无法表达的超长等待不提前。普通单调时钟为非负elapsed；helper也处理负delay和负now边界。
- 日期只在响应解析时读取wall clock；已经得到的delay转换为elapsed deadline后，schedule/kick只比较elapsed，不再读取wall clock，系统日期后续变化不改变已有门。没有新增sleep、timer或UI阻塞。局部饱和不改变超时、并发、重试次数与慢重试表。
- schedule检查providerRetry和retryAt；tick/恢复事件负责再调度，并非send内部sleep。m4a至m5c的page/hole旁路是历史缺陷；M5d以独立红绿实现相同逻辑门，见第9节。pause/seek/退出可能减少或取消请求，不能保证服务端未处理已发送内容；取消不等于退款。
- timerFired先记录再disconnect；取消分类优先于timer事实。主线程stop/retire立即撤权而不等待物理disconnect；off-main retirement barrier有期限且可失败。详见M3a合同和PublicationLifecycleTest。

## 5. 配置、缓存和诊断作用域

`DeepSeekConfig.load` 在 ApiProfiles.LOCK 内取endpoint/model/prompt及credential引用；CaptionApplication.settings取得真实凭据后生成不可变TranslationSettings。Session.config及credential为final；Job从Session取languageContext/config，协商不会重新读取当前profile。

`activate` 的会话身份包含源轨key、语言策略fingerprint、key hash、target/original等；profile ID本身不直接进入身份。配置或视频/目标替换可新建会话；实际调用先stop还是直接activate决定STOPPED或RETIRED，不能把配置切换一律描述为同一种取消。

- STOPPED / cancel：撤销publication、generation增长、取消所有旧请求，物理清理异步。未sent旧Job不得发送。
- RETIRED（m5c起、m5d保持）：publication已关闭、current=false；sent && finishSent继续允许原已发送HTTP读取/完成。新的每次POST另经 `RequestControl.tryBeginAttempt`，Job要求未取消且current；退休先发生再到准入点时拒绝，不新增audit attempt或POST。可选参数、HTTP拒绝stream及流内error三条回退都回到同一准入点；不把sent清零或把退休等同STOPPED。m4a/m5b历史实测曾允许第二旧POST，M5a报告/矩阵/XML保留，该观察不再是当前许可。
- 旧逻辑调用可得到Plan，但 controller.translate 在current/jobs/generation/publication处挡住新显示/提交；provisional也检查current。审计完成留在begin捕获的旧配置；Job.trace携带旧Session.id及credential。测试中的audit sink只证明core捕获配置归属，应用TokenCostAudit落盘仍引用既有映射/黄金测试。
- RebuildCache.identity包含protocol、endpoint/model/有效prompt、target、source字词/时间/精度、语言/表现策略及authored cue分组；**不含key或profile ID**。仅换凭据且其他语义输入相同会共用磁盘缓存；换model实际key不同，M3a已有旧写提交/CAS/clear屏障测试。本轮初版的“只换key则磁盘key必不同”是假设错误，已保留原失败并用独立现状断言澄清，不伪称跨profile缓存隔离。
- 源缓存按源轨/描述符及primary/reference命名，不以翻译key/profile隔离；共享flight也不代表旧consumer获得新画面权限。无用户数据迁移或缓存格式改动。

## 6. 已发现问题、覆盖界限和交接

1. **F1：m5b已修正并统筹接受**。m4a日期丢失/120s截断的调查原件保留；m5b共用解析器并饱和转换/相加，新增9项回归及真实普通调度恢复。红测2失败→修复后同断言通过。M5b原交付仅普通block/provider/source直接门；M5d另以F2用例验证page/hole逻辑门，不将其扩大成所有外发网络的统一策略。
2. **F2：M5d-R1已统筹接受，原卡及补正规定范围关闭**。原M5d的770项及组合有效，但统筹复现晚到普通408将子修复300秒父块门改为1.2秒、page提前POST。补正普通/子失败及相关收尾共用单调、安全相加的父门更新；正式同断言红1失败→绿，门前1ms无新POST、到期恢复；777项完整入口与同输入新组合已交付。见[M5d-R1结果](../maintenance/results/M5d-R1-RESULT.md)、[统筹复核](../maintenance/reviews/M5d-R1-REVIEW.md)及第10节；一次显示超时根因保留待M5e定位。

M5a新增15项与旧覆盖的分工、每个实际HTTP数、注入/等待上限、XML结果及顺序检查见矩阵。真实源鉴权没有替换TrackFetcher：DeepSeekCaptionHook的openWithYouTubeCronet被测试shadow显式映射到本地MockWebServer，包含timedtext和/sw.js；未映射协议/host/path抛AssertionError，绝不return null回真实URL。测试仅fixture密钥/匿名fixture Cookie；不读取用户profile发请求；不修改系统代理。

M5a历史调查范围：connect/read超时分类和guard优先级不等于完整真实网络超时认证；未等待10/16/30秒生产deadline、未测试TLS/真实服务收费/所有并发协商、所有页面门交错、全部源候选乘积和设备断网。现有输入/状态验证支持这些范围内的合同，不证明全局线程安全。没有生产或资源变化，M4a冻结包对照与工程完整验证作为交付依据；真实APK组合、资源harness、设备和真实模型未重复。

## 7. M5b 验证映射与范围

`RetryAfterContractTest` 新增9项：固定now解析/算术边界、真实HTTP 300秒与未来日期、300秒普通调度恢复、日期普通调度恢复、短等待保留较晚provider门/本地backoff、超大wire值的实际block/provider门、实际source load失败门、429/503缺失/无效/17秒等无内部重发。调度从真实send产生的Failure进入rejected，schedule驱动实际POST并以REBUILD_EVENTS_ACCEPTED及Plan为正向对照；直接调用真实schedule模拟调度触发，不冒称整条Android tick链。source超大值测试通过受控Host抛源Failure进入真实load捕获与kick，原有extension源HTTP/Cookie日期用例仍完整运行。

旧 `NetworkFailureContractTest.providerRetryAfterCurrentDateAndCapDiscrepancyIsExplicit` 映射为 `providerRetryAfterPreservesDateAndLongDeltaM5b`：只将date=0/cap=120s的缺陷刻画改为日期上下界/300000ms，保留6 HTTP、17秒、无效/负/缺失、configuration=false和HTTP_CONFIG诊断计数。其余11项方法原字节保留，M5a报告、矩阵、XML均保留。m5b来源只更新RebuildApi/RebuildController目的哈希、adaptation_scope和派生patch；固定上游、snapshot、提示词/协议与受保护ABI不变。

M5b交付时F2子修复等待/过滤旁路、F4退休追加POST仍未闭环；M5c当前F4变化见下节。该历史交付时F2未闭环；M5d当前实现见第9节。F3维持语义缓存复用，F5维持现有计账分类。远端CI、其他APK/官方选择组合、设备、真实供应商/收费、全部历史日期格式和系统时钟跳变的设备实测未覆盖；受控elapsed调度与固定now日期边界不替代这些认证。

## 8. M5c 每次尝试准入与读取权限

准入点位于 `RebuildApi.translate` 每轮循环中，原checkActive之后、序列化/TranslationAudit.beginAttempt及私有send之前。首发与所有continue重发都必须经过它。`RequestControl.tryBeginAttempt` 默认返回!isCancelled，已有控制器保持兼容；真实Job返回!cancelled && current(session)。成功准入中的Publication.isOpen同步读取与revoke在同一monitor排序；如果revoke先发生，检查必拒绝。当前身份/owner还由current的volatile读取检查。检查仅完成短状态读取，不持生命周期锁做HTTP/等待/清理，不创建Publication permit。

准入成功后才发生退休/取消属于重叠操作；既有onConnection/checkActive/finishSent决定发送、读取或撤销。它不是“准入结果与网络字节同时原子化”的承诺。Job.sent仍表示本逻辑Job至少发送过body；isCancelled原方法体、Publication/缓存和STOPPED规则均未改。成功旧Plan只能在旧线程收尾，run/provisional/current/generation及publication仍禁止它取得新会话输出/缓存提交资格。

`AttemptAdmissionTest`九项经过真实RebuildApi/Job、受控HTTP与有界latch/Future：三条退休回退、旧成功读取、新STOPPED升级、未发送排队旧Job、正常流内error回退、当前Job的2/3次协商、准入后发送前STOPPED的审计边界。前三项同应有断言红3失败→绿；明确首bodySent、扣响应、退休、释放、旧/新key和model。成功旧usage及失败audit留在原scope。正常回退保持原次数；queued未发旧Job为0 attempt/0 HTTP，合法准入后STOPPED为1 attempt/0 HTTP。不能把logical batch、admitted attempt、服务器收到数自动等同。

M5a `retiredSentNegotiationKeepsOldCredentialAndAuditWhileUnsentWorkStops` 映射为 `retiredSentNegotiationRefusesNewAttemptWhileOldAuditAndUnsentRulesRemainM5c`：旧第二POST成功改为InterruptedException、总HTTP/attempt从3改2（旧1+当前新1）；旧key/audit、未sent拒绝、current/publication撤权及model cache key差异断言保留。其余11项原字节；M5a/M5b历史原件不改。来源仅三个core目的项、适配说明和派生patch变化；固定上游/协议提示词/Hook ABI及校验工具不变。

结果与红绿/重复/完整验证/真实组合证据见 [M5c-RESULT](../maintenance/results/M5c-RESULT.md) 和 `validation/runs/20261025-M5c-01/`。F2后续M5d实现见第9节；F1、F3、F5及其他请求策略保持。这里不认证任意宿主线程交错、服务端未处理/收费退款、设备运行或所有供应商。


## 9. M5d：逻辑发送资格、子修复失败与保留内容

原执行完成，经[统筹复核](../maintenance/reviews/M5d-REVIEW.md)需补正。结果 [M5d-RESULT](../maintenance/results/M5d-RESULT.md)，独占证据 `validation/runs/20261025-M5d-01/`。生产只改变RebuildController；版本为1.5.8 / local-1.5.8-m5d，公开仍1.5.7。

**原m5d已复现限制（原件保留，补正实现见第10节）**：保留较晚父块deadline原来只在repairRejected外围执行，普通applyFailure直接重写。普通已发响应扣留，hole HTTP408/Retry-After=300建立retryAt=300100、providerRetry=0，普通无header408晚到改为1300；elapsed=1300的page形成第3个POST。统筹原证据 `validation/runs/20261025-M5d-coordinator-review/blocking-finding.json`、原770项及组合不重写为包括补正。当前M5d-R1已统筹接受；下文原24项/139文件原字节等数字描述原M5d交付，当轮原件保持。

`modelEligible` 在Session monitor内读取current、sourceOnly、terminal、filteredBlocks、providerRetry和本父块retryAt。普通schedule/待提升pendingFocus、page入口先检查，普通translate、page实际repairPage、hole实际fillHoles再检查。检查与applyFailure使用同一monitor排序；离开此短临界区即为合法逻辑准入，不持锁做HTTP、磁盘或等待。准入后才建立的门不追溯撤销该重叠逻辑调用，其内部协商沿用原规则；M5c每次物理attempt生命周期检查原方法体保持。逻辑准入不授予publication或缓存permit。

| 实际失败 | 当前门及内容行为 |
| --- | --- |
| 429 / 5xx | 父块等待取原1200/5000/15000ms backoff与服务端delay较长者；provider至少5000ms并与已有值取max。继续用RetryAfter.after饱和相加；普通/子失败统一保留已有较晚父块deadline |
| 其他可重试/结构/网络失败 | 原本地backoff，不凭诊断HTTP_CONFIG误设terminal；保留原provider门。普通/子失败均不缩短已有父块等待 |
| configuration | Session.terminal=true，所有父块的新逻辑调用停止；已有有效Plan/事件继续保留并可显示。无有效内容仍按原失败/配置提示处理 |
| content_filter | filteredBlocks持久记录本Session的父块index，普通/page/hole都停止；其他未过滤块仍可调用。不因READY、seek或display generation重置解除；新有效Session有新集合 |

普通rejected仍只清理属于它的s.jobs/provisional；子修复repairRejected只应用原因决策，不依赖s.jobs[index]==child，不清除别人的Job或provisional。独立hole Job拥有自己的传输/trace与M5c检查，不借父Job曾sent获得权限。子成功合并要求原Plan及generation仍有效；旧generation的成功hole不合并，旧generation但仍属当前Session的真实失败仍建立Session/父块门，退休Session的失败不写入当前Session。

| 计数 / 资格 | 门拒绝、合法准入和恢复 |
| --- | --- |
| 普通attempt / session repair | 原markDispatched预留；执行端被门拒绝时仅在仍拥有该slot时返还attempt及job.repair额度，恢复WAITING以便到期继续原修复。filtered/terminal有Plan则READY，无Plan则FAILED。slow retry的原attempt值及未准入slow reservation一并恢复 |
| page count / key | 入口预留仍受每父块4次和generation:index:range约束；queuedPages独立保存未准入归属，历史set超过128清空不会遗失返还资格。执行端拒绝退还本任务key/count；合法准入即移出queuedPages，失败或后来取消保持消耗/去重，不新增同页重试。seek按原规则重置page generation/count |
| hole slowRetries | 合法逻辑准入才增加原来的一次hole额度。门前拒绝以pendingHoles保留未花资格，已有tick/kick通过queuedHoles去重排队，到期再检查Plan、覆盖、位置、代际与额度后恢复；已实际准入失败不再多给一次hole |
| logical batch / HTTP attempt / received | 分别计数。24项测试为47 / 46 / 46；合法page在audit begin时STOPPED保留1 batch、0 attempt、0 HTTP，其page额度仍已准入。等待门拒绝自身为0 / 0 / 0，不能伪造消费或承诺退款 |

`RepairAdmissionTest` 24项实测：普通429/400 inspected红绿；provider与仅retryAt各自300秒、门前1ms及恢复；page503/hole429失败到真实状态及其他入口；Long.MAX_VALUE、重叠短子失败不缩短较晚门；page inspected422与hole 200 finish_reason过滤、其他父块成功/seek不解除/新Session正向；page/hole401及排队configuration；两条priority worker由有界latch扣住的page/普通/递延hole执行端复查；普通/slow/page预约返还、4次page上限/已发失败同页去重；旧有效事件对象、实际showEvent文字及RenderGuard保留；旧generation hole成功不合并；sourceOnly三入口零调用。直接调用真实控制器入口驱动局部时序，不冒称所有Android tick/任意宿主线程交错；递延hole恢复确实通过正常kick。

红测在生产未改的m5c上各2 batch/2 attempt/2 POST，期望为1，XML和原请求/响应/哈希封存；最终同两个方法的应有断言未改，各1 POST。其余139个入场测试文件原字节保留，不更新旧黄金期望；N52/ContinuousDisplay等待后的正常page仍通过。新测试只连本地fixture，未映射源直接抛错、未映射模型路径拒绝，无Thread.sleep；有界Future/latch、受控elapsed clock及finally释放队列/静态Host/Audit/Output。

代表性分类不等于全部状态码乘积：没有逐一将全部403/404/400/422、流式/非流式和每种子范围组合穷举；原分类/协商回归提供补充。未验证远端CI、其他APK/官方选择组合、设备UI/性能、真实供应商和费用、任意并发及网络字节原子化。F3语义缓存、F5诊断字段与上游协议/提示词/Hook ABI保持，未新增全局费用预算、线程或timer。

## 10. M5d-R1：保留同Session/父块已建立的较晚等待（已统筹接受）

`deferRetry` 是所有运行时父块deadline写入的共用边界，调用者持Session monitor：`retryAt[index] = max(retryAt[index], RetryAfter.after(now, delay))`。普通和子失败仍取原1200/5000/15000ms backoff与服务端delay较长者；provider门仍独立取max，safe-add饱和到Long.MAX_VALUE。保留仍有效的较晚门，不新增固定等待或重试次数；门自然到期后按原内容/覆盖/次数/去重资格恢复。新有效Session及首次源接纳按原边界建立新数组，seek/resetDisplay不清同父块门。

普通`applyFailure`与`repairRejected`共用该规则；移除子路径外围的重复max。`finishCancelled`的500ms收尾和普通成功后语义review的1200ms也统一更新，避免未发送普通请求被seek取消或成功review收尾抹掉并发子失败门。`retirePendingFocus`前已有schedule资格复查，遇有效门会先走不写deadline的`releaseGatedJob`，仍统一安全更新退休短等待。page/hole成功、队列返还与resetDisplay不写父块deadline。逐写点可达性、真实顺序与未逐一注入的提交窗口见 `validation/runs/20261025-M5d-R1-01/retry-write-audit.md`。

正式新增7项实际Controller/RebuildApi/本地HTTP测试。主回归普通已发/扣408→hole408带300秒→普通短失败晚到，在未改m5d生产代码上期望2 POST实际3，修复后1200ms及门前1ms仍2，到期page成功成为第3个POST并保留旧事件。反向普通长门/短子失败、超大饱和/provider门、真实seek取消未sent普通任务的额度返还、成功普通语义review收尾、pendingFocus真实slot释放、成功hole晚到合并均有覆盖。31项RepairAdmission由原24项+7项组成，原24项方法体保持；其他有效断言未删除/跳过/放宽。

两项获准强化的旧期望：NetworkFailureContractTest.controllerWaitUsesMaximumAndProviderGateWithoutSleeping由已有17秒门后的15秒改为精确17秒；RetryAfterContractTest.shorterServerDelayCannotShortenLocalBackoffOrExistingProviderGate由已有300秒门后的15秒改为精确300秒。原provider门断言保持，各自另用独立新Session精确证明15秒本地backoff；后者的1秒服务端等待对应provider至少5秒也精确断言。旧→新映射及入场原件在本轮证据中。

完整入口Offline+RerunTests实际core318+extension459=777，失败/错误/跳过0；同次compiled在下一Gradle前归档。版本1.5.8 / local-1.5.8-m5d-r1、公开1.5.7；同输入104默认根+AI真实组合/既有DEX审计已交付。一次针对性显示等待超时原件保留，同源码小范围复查及完整入口通过，不修改该测试或其断言。远端CI、其他组合、设备、真实供应商/收费、任意宿主线程排列未认证；准入后旧调用可按原范围收尾，不能缩短后续新调用等待，不承诺物理零字节/退款。F1/F4/Publication、内容/过滤/terminal、原配额/去重、源模式、F3/F5保持。本轮[统筹复核](../maintenance/reviews/M5d-R1-REVIEW.md)接受F2规定范围，独立85项及上轮原探针通过；M5e已完成并经[统筹复核](../maintenance/reviews/M5e-REVIEW.md)接受受控顺序与夹具改善：连续播放补齐和seek旧generation拒绝分开验证，历史原始交错仍未知；不把后续通过或可达顺序升级为历史根因。


M5i缓存边界补充（经统筹接受本轮规定范围与限制）：[缓存故障合同](CACHE-FAILURE-CONTRACT.md)记录译文read/review/实际调度、源LoadedTrack重解析/本地回源、prepare/替换失败、clear epoch和已准入提交。生产只局部修复SourceCaptionCache文件替换及进程内成对读写；RebuildCache/Controller、F1/F2/F4、finishSent/STOPPED、F3语义复用和F5计账分类不变。checkActive→put窗口与跨文件崩溃原子性仍有限制，不把源写入等同新Session显示权。完整861项及规定组合见[M5i结果](../maintenance/results/M5i-RESULT.md)，接受范围及限制见[M5i复核](../maintenance/reviews/M5i-REVIEW.md)。

## 11. M6a：F5解释及实际决定事实（规定范围已接受）

F5本轮以“已解释／已补事实、原分类兼容、未知范围保留”经[M6a统筹复核](../maintenance/reviews/M6a-REVIEW.md)接受；独立103项及完整872项有效，未扩大为所有供应商/设备认证。当前[诊断/性能合同](DIAGNOSTICS-PERFORMANCE-CONTRACT.md)和[M6a结果](../maintenance/results/M6a-RESULT.md)记录完整映射。`HTTP_CONFIG`保留所有历史枚举/累计/持久字段，包含429/503/content_filter；不能据此断言configuration=true、terminal或必须修改用户配置。

Controller.applyFailure在同一实际更新之后经原Job.trace记录`REBUILD_FAILURE_DECISION`：session/request/block/reason、真实Failure.configuration或unknown、failure.delay或unknown、实际state/terminal/filtered和采样时刻及更新后的父块/provider elapsed门。普通/page/hole共用此处；不从分类/文案推断，不产生新重试决定。failure_delay也可为negotiation_pending本地等待，不能一概解释成服务端Retry-After。事件可能被有界队列丢弃/截断，缺字段保持未知；决定快照不是永久当前资格。

真实本地HTTP→Job/Controller→实际CaptionApplication/Audit/Writer/导出验证401、429/50317秒、content_filter、断连、结构拒绝及取消前准入计数；同HTTP_CONFIG桶分别得到终止、等待和块过滤。结构拒绝保留quality计数且不虚加failure，取消前0attempt/0HTTP。旧计账黄金报告保持；batch、获准attempt、服务器实际收到与response/quality/cache分别解释，仍不认证真实计费。

生产请求策略、F1/F2/F4、Publication/finishSent/STOPPED及F3/M5i缓存不变。严格配置到应用只复用同次已解析key，M5h校验/脱敏/保存语义保持；队列仅增加可观察pending_decisions/pending_total，旧pending含义不变。完整872项及规定真实组合通过不等于所有服务/设备/任意交错认证。
