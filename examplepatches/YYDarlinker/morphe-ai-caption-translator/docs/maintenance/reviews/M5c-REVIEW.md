# M5c v1 统筹复核

日期2026-10-25（Asia/Shanghai）。结论：**接受本卡交付，F4在退休后新模型HTTP尝试准入范围关闭**。已发送响应继续按finishSent读取/完成，STOPPED撤权、Publication和缓存作用域保留；不扩大为任意并发下的物理零字节、退款或所有模型请求策略认证。F2仍未闭环。

执行结果 [M5c-RESULT](../results/M5c-RESULT.md) 和 `validation/runs/20261025-M5c-01/` 保留原样。独立复核证据 `validation/runs/20261025-M5c-coordinator-review/`：audit.py、audit.log、review-evidence.json、45项针对性执行日志/receipt/XML、来源/候选/release拒绝/编译边界复查日志。

## 实际检查

- 相对入场原件检查三项最小core修改。RequestControl提供默认tryBeginAttempt，真实Job要求未取消且current；RebuildApi每轮在beginAttempt及send前统一检查，首发、参数协商、HTTP stream拒绝和200流内error回退均不能绕过。当前只有一个私有send调用入口，没有新增网络框架。
- Publication.isOpen和revoke在同一monitor排序，已经撤权再检查必拒绝；成功准入之后发生的退休/取消属于重叠操作，继续由现有onConnection/checkActive/finishSent处理。检查不持锁等待HTTP，也不授予显示或磁盘commit permit。Job.sent、isCancelled、onRequestBodySent、Session退休实现原方法体保持；F2三个修复入口本轮未变。
- 核对红测原件/生产哈希及XML：3 tests/3 failures，三条路径各有2个旧POST。三个测试方法体未改变；红绿helper差异是补强审计/usage、拒绝未映射路径、恢复原Sink及增加正向用例，未放松退休后无第二POST的断言。其余11项原网络合同方法体与入场相同，F4刻画到应有行为的映射明确，旧M5a/M5b证据未改。
- 独立重跑AttemptAdmission、NetworkFailureContract、RetryAfterContract、PublicationLifecycle、StreamingDisplay、ProviderEndpoint、CoreSessionIntegration共45项，实际执行通过，失败/错误/跳过0。九项新增再次观察到16 batch / 19 attempts / 18 fixture HTTP，包含当前会话正向对照。退休后的三条旧调用各只发送1 POST，新会话分别再成功1 POST；正常2/3次协商与两次stream回退仍成功。
- 旧已发送成功Plan可完成且usage保留，current=false、reserve=null；STOPPED撤读权限。排队旧Job没有第一attempt/HTTP；合法准入后才STOPPED保留1 attempt、0 HTTP。逻辑batch、审计attempt与服务端收到数没有混为一谈。直接API测试不被描述成完整应用显示链；既有Publication/应用旧回复回归提供补充覆盖。
- 独立重算源输入指纹仍为 `b11e5bd4a9c38e015ac34aca58db516f5ecc6c61fc4ddbec8ea4d66badc89e82`，与最终验证前后清单相同。101份归档XML及哈希/receipt确认core287、extension459，共746项均本轮实际执行，失败/错误/跳过0。没有无理由重跑完整746项。
- 重新检查来源：只DeepSeekApiClient、RebuildApi、RebuildController目的哈希及适配说明/派生patch变化；固定上游、snapshot字节/upstream_sha256、其余项/new_files、protected_abi保持。record工具check再次通过，协议/提示词守卫未放宽。
- 核对完整入口后立即归档的core classes逐文件哈希、同次receipt路径及源指纹，再使用该归档实际复查compiled/UI/MPP/MPE边界通过。此轮取证已避免依赖后续Gradle可能回收的原中间目录；不是借用其他构建的编译物。
- 实际复查候选及local冒充release拒绝。MPP `b5ddc4eb94abbebce8a82406eef7db156ce947eac5877a7dc9ba7b700cbd677a`，585282 B；内嵌/独立MPE `461d4f33b09a90ee6f6001f6989c3d998e311e2a23b3262278c07f00dcdd45ec`同字节。对m5b仅manifest与MPE内容变更，补丁根DEX/资源保持。
- 核对组合输入哈希、104默认根选择、Patcher及组合/DEX退出日志；独立读取新APK DEX定义得到64564个唯一类，无测试/回环类泄漏。实际APK对冻结m5b仅classes13.dex不同，其余18390条目相同。组合APK SHA-256为 `ecf09deab6381f949ea3e5e4a350a7c5fe5fa53e23ee16771533be6ea38b7a13`。没有无理由重复组合，也不作设备或供应商收费结论。
- 独立核对2189个范围外入场文件、10287个历史交付/候选文件、六个忽略前端及退出清单；入场ZIP和主要证据索引哈希相符。分支/HEAD/索引未变，状态镜像相同。本统筹轮不改生产、测试或验证工具。

## 保留限制与下一项

准入后的重叠退休/取消、任意宿主线程交错、远端CI、其他组合、设备和真实供应商/收费仍未认证。原fixture/参数传递/BOM初始化失败证据保留，未作为有效测试通过计入。旧已准入的作用域缓存提交规则不被本结论改写为所有旧磁盘写入立即禁止。

下一张独立卡 [M5d v1](../tasks/M5d.md)处理F2：page/hole补翻译的等待、过滤/终止准入及其失败如何建立相同作用域的门。保留已验证Plan、现有次数/去重/并发及正常补翻译；不借此设计全局预算、增加重试或修改源回退。F1解析/等待修复和F4权限分离继续回归，F3语义缓存复用、F5诊断兼容性另行判断。本轮只下发任务卡，不执行M5d。
