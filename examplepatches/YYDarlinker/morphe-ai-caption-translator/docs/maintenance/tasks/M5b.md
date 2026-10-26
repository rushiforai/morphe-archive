# M5b — 修复provider Retry-After解析及普通等待时间溢出

任务卡v1；下发日期2026-10-24。前置M5a已统筹接受调查交付，F1仍未修。只执行本卡，不同时处理F2–F5或重写网络层。

## 1. 缺陷、目标与基线

当前RebuildApi.send只Long.parseLong读取Retry-After并截到120秒：标准GMT日期被丢成0，300秒变为120秒。正常controller.rejected虽然取本地backoff与serverDelay的max，但不能恢复已丢失的等待。共享RetryAfter已支持秒数和常见HTTP日期；改接共享结果时，毫秒转换和deadline相加又必须防止极大值溢出变成负数/短等待。

目标：模型路径保留有效秒值和常见标准HTTP日期所要求的等待；正常调度等待不因120秒上限或long溢出被提前。保持缺失/无效/已过期头的合理回退，保留源和provider各自重试/终态策略及monotonic调度。

唯一活动仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`，复用现有工作树/分支，保留已有修改。先读AGENTS、PROJECT-STATE当前身份/最新维护条目、维护入口、M5a REVIEW、NETWORK-FAILURE-CONTRACT、路线M5及本卡。

基线为M5a工作树/728项测试，产品仍 `1.5.8 / local-1.5.8-m4a`。冻结候选 `build/maintenance/M1a/20261024-M5a-candidate-01/patches-1.5.8.mpp`，SHA-256 `939ccdbcc3e532cbb45a37cff2726a4d9dfcadef94557e43e355d8d3b407a7f8`，生产内容与M4a相同。进入时核对实际状态，不覆盖后来工作。

## 2. 允许的生产与来源变更

- `translation-core/.../RebuildApi.java`：仅响应Retry-After读取/转换及必要局部变量；优先调用共享helper，不维护两套解析。不改请求体、stream/参数协商、terminal/blocked、deadline或认证。
- `caption-shared/.../RetryAfter.java`：有必要时局部补强有效秒值/常见标准日期解析和安全饱和运算；不增加依赖。正常源路径语义保留。不得把极大但语法有效的正秒值因parse/乘法溢出当作0，也不得新增任意较短上限。
- `translation-core/.../RebuildController.java`：仅直接接收这些等待值的retryAt/providerRetry/sourceRetry时间戳计算，使用安全相加并保持max/backoff/原有providerRetry不提前的规则。可对这几个门捕获一致的当前monotonic时间；不调整等待表、调用上限、调度槽位、终止规则或page/hole入口。
- `gradle.properties`仅captionBuildId改为 `local-1.5.8-m5b`，version仍1.5.8，公开1.5.7元数据不变。

新增/更新有意义的回归和相应当前文档。允许有明确理由更新M5a新刻画中的F1测试（原来断言date=0/cap=120s），使其断言修正后的产品行为并可适当改名；逐项说明映射。M5a历史报告/矩阵/原件不改，其他有效断言保留。不把所有错误策略改成统一重试。

这是有意修改core的任务，允许在最终diff/测试核验后更新 `docs/core-provenance.json` 中实际改到的destination哈希及适配说明，并重录 `docs/core-upstream.patch`。使用现有record工具前先读其用途和完整diff，确认无其他未解释漂移；固定upstream commit、snapshot字节、upstream_sha256、协议/提示词字面量、protected ABI与其他来源记录不变。不能只重算哈希压掉未经审查的变化，不能放宽verify_integration的字面量规则。

## 3. 明确不在本卡内

F2 page/hole限流/过滤旁路、F4 retire后追加协商POST、F3语义缓存复用和profile/key namespace、F5诊断类别均不变。修好普通等待不等于所有外发路径已遵守Retry-After；结果必须继续列出这些边界。

不改HTTP/HTTPS策略、Cookie/来源选择、模型输出/提示词、结构修复、分页/Overlay、AI/CC/语言权威、API profile/凭据存储、网络请求总预算、并发/超时常量、依赖/Patcher/R8/SDK、验证工具/CI/发布链。邻近陈旧注释可以准确修正，不借此改显示行为。

## 4. 行为要求

- 17秒仍为17000ms；300秒保持300000ms，不截成120000。有效未来GMT日期按wall clock算剩余等待，过期/零值不为负。
- 单调调度与wall clock解析分开：已经得到的delay转换成elapsed deadline后，不因系统时间后续跳动提前；不新增后台sleep或timer阻塞UI。
- 本地backoff比服务端更长时取本地值，服务端更长时不缩短。providerRetry已存在更晚等待时不得被较短新错误覆盖。
- 较大秒值的毫秒转换、now+delay及三个直接等待门不能溢出成负/已到期时间。超出可表达的有效正值可以保守饱和到Long.MAX_VALUE；不能忙循环或用人为较短cap放行。临界与非法输入的处理要说明。
- 缺失/空白/无效头、负值或过期日期按现有合理回退；不要因解析失败导致崩溃或永久错误封禁。普通配置错误/过滤/重试类别保持。
- 标准常见GMT HTTP-date和delta-seconds必须有证据。若没有实现/验证RFC的全部历史日期兼容形式，明确不声称完整HTTP-date/RFC认证，不为此引入大型解析库。[RFC9110](https://www.rfc-editor.org/rfc/rfc9110.html#section-10.2.3)

## 5. 先红后绿与等待门验证

先在未改生产时，用新的应有行为断言重现至少“未来日期不丢失、300秒不截断”的失败，保存命令/XML/实际值及固定基线；不要求为红绿重复跑整个728项。然后完成最小修复，运行同批回归并通过。

测试分层且观察范围准确：

1. **解析/算术**：用固定传入now测试秒值、GMT未来/过去日期、缺失/无效/空白、乘法与加法临界/超大值，避免测试几年后因固定未来日期过期失效。
2. **真实模型HTTP**：MockWebServer返回429/503的17、300、未来日期及非法/缺失header，走真实send→Failure，检查等待值和实际HTTP计数。日期可用明确的前后wall-clock边界，时钟容差解释清楚，不需真等几分钟。
3. **真实等待决策**：将实际HTTP Failure送到当前controller决策，检查retryAt/providerRetry/sourceRetry中与之相关的门；受控monotonic clock证明到期前普通调度不发新POST、到期后可恢复，并有计数/接纳正向对照。不能只测helper或私有字段就宣称完整调度通过。
4. **溢出保护**：极大delay到达实际deadline计算仍保守等待，不变负值；较短后续等待不取消已有较长provider门。测试不用实际等Long.MAX_VALUE，使用受控时钟/门与断言。
5. **保护回归**：既有正常429恢复、401终止、deadline/取消、协商/stream、源日期/认证回退、配置/视频切换仍有效；不让新日期处理触发无限协商或额外HTTP。

所有网络都只在受控fixture；源/sw.js回退仍显式映射或拒绝未映射地址，不调用真实YouTube/模型，不读用户真实profile发请求。使用测试密钥，不等待生产长超时，不依赖sleep或修改生产时间常量。静态记忆、服务器、执行器和拦截器在失败时也可靠复位。

## 6. 实施、完整验证与交付

1. 保存入场原件/清单、实际忽略前端、范围外和历史候选哈希。按入场而非HEAD计算本批diff。
2. 保存F1红测；最小修改并绿测。复核core diff后记录必要来源适配，检查snapshot/ABI/提示词/协议未变，record工具的check模式无漂移。
3. 测试/源码/来源记录固定后，用已接受完整入口完成两组测试、来源/compiled/UI/包、凭据和新候选验证，报告实际增量及有效复用。不得修改工具来放行新身份或绕过来源检查。
4. 新候选身份 `1.5.8 / local-1.5.8-m5b`，独占输出；记录本次源指纹、MPP/MPE哈希及内嵌一致性，保护旧交付，不手改公开发布元数据。
5. 这是core生产修复：使用M4a已确认的一组原始21.41.525-SECONDARY/官方1.48.0/Patcher2.0.0/104默认根+AI输入完成真实组合及现有DEX审计，核对输入/选择集和实际产物。仅预期扩展core相关变化与build ID变化；补丁Kotlin/资源、原生Hook公开签名及既有设置应保持。缺输入准确报告部分完成，不把单测当组合。
6. 更新当前NETWORK-FAILURE-CONTRACT对F1的描述和新产品身份/来源，清楚保留m4a历史观察与m5b修正的区别；不要重写M5a证据。F2/F4未闭环和F3/F5处置继续列明。
7. 结果写 `docs/maintenance/results/M5b-RESULT.md`，证据在独占 `validation/runs/<date>-M5b-<run-id>/`。包含旧失败/新通过、真实请求和等待门证据、core来源差异、测试/组合/保护、未覆盖和逐文件安全回退。
8. 更新维护入口、状态及字节相同镜像，完成待复核或准确部分状态，统筹保持待复核。只完成本卡，不自动修F2–F5或进入后续阶段。

不创建commit/tag、不推送/开PR/发布、不签名安装/清数据、不调用真实付费模型。不重写旧包、源快照或共享缓存。

## 7. 接受条件

F1目标有固定基线红绿证据；真实传输入口保留日期/长等待；普通调度门不提前且有恢复正向对照；直接时间运算无溢出提前；正常错误策略不变；来源/协议保护、完整验证、至少一组真实组合及旧产物保护有效；报告不把本次局部修复扩大成所有修复路径已统一。
