# M6a统筹复核：接受F5解释与有限性能机制基线

2026-10-25（Asia/Shanghai）。**接受M6a v1的F5解释/实际决定事实、有限机制测量及两项局部修复，M6本轮代码与机制工作收尾。** 接受本地1.5.8 / local-1.5.8-m6a / candidate-01，公开1.5.7。设备帧率/内存/耗电、硬件Keystore和物理IO长尾仍未认证，不等同“性能全部合格”。原[任务](../tasks/M6a.md)、[结果](../results/M6a-RESULT.md)及历史证据保留。独立证据 `validation/runs/20261025-M6a-coordinator-review/`。

## 实现审查与接受理由

- Controller的applyFailure仍执行原来的terminal/filter/state与取较晚deadline规则；仅适配Job参数并在更新后trace。统筹将新trace及Job→index适配移除后，与入场Controller正文精确相同，未改变重试/预算。事件读取实际configuration或unknown、父块state/filter、Session terminal及同次elapsed下更新后的retry/provider门，由原Job带session/request/block归属，不由HTTP_CONFIG分类推断。
- HTTP_CONFIG及历史统计保留，一个说明键×14语言进入真实report/fullText；请求batch、attempt、服务器收到、quality和cache边界解释正确。对应本地HTTP/真实Controller/Application/Audit测试401、429/503、过滤、断连、结构拒绝、准入前取消，旧桶计数和调度事实分别断言，诊断不参与准入。
- RequestSettings是一次ApiProfiles.LOCK范围内的临时ProviderSettings+resolved key，应用构造原TranslationSettings时复用它；UI的ProviderSettings仍无明文。没有静态key缓存、持久格式或origin规则变化。真实Conscrypt/内存KeyStore SPI的单次严格请求读取2→1有有效红绿；这是操作次数优化，硬件耗时未知。
- writer只补双lane积压显示，旧pending/累计字段含义、容量、脱敏、默认可见性保持。Overlay/缓存/正常调度不改，没有为测量去关闭功能。

## 独立复核结果

1. **统筹实际运行18类103项，全部通过**，0 failures/errors/skipped。包括四M6a新类、既有配置/UI/真实应用/审计/诊断、N37快照、Shorts稳定事件和idle保护；XML/receipt见targeted-evidence.json。不是重复全部872项。
2. **操作基线独立复现**：同凭据20条caller key read=0/writer decrypt=1；1220条writer突发normal512/decision512、merge19/drop177、caller文件目录访问0；archive4096排队再2条实际丢2、UTF-8段180035 B/60000字符截断；40组稳定输入/200 pre-draw不增分页/文本/布局、真实字号变化新增1计划；六会话/120活动time新增key和严格配置读取0、两轨重入2GET/0模型请求、旧publication/排队任务排空，主线程缓存目录访问0。消费读锁线程CaptionSharedSourceIO、提交线程DeepSeekCaptionSourceCache与原报告一致。
3. **红绿及保护**：三个有效红检查点的受影响生产源码与入场ZIP相同；缺决定事实/解释、遗漏decision backlog、配置读2次分别取得应有失败。148既有测试/资源中仅Shorts追加一方法，旧两方法正文保持；旧TokenCostAudit黄金值/配置保护未放宽。其他fixture预期/归档辅助失败原件保留，不能计作产品红测。
4. **完整872项绑定当前输入**：114份XML逐项SHA/receipt确认core328+extension544实际执行，失败/错误/跳过0；当前和完整前后manifest一致，指纹 `30b8cc6a4f236df8038f1e971bcde9bbb323c30d8bc6b5760f021efda9bc798d`。557类ZIP/逐类SHA/receipt/指纹绑定核验，下一Gradle前归档。来源只更新实际Controller目的项/适配说明/派生patch，上游/snapshot/协议/提示词/ABI不变。统筹从本ZIP取core实际重查来源/compiled/UI/包边界通过，旧m5i及local-release冒充按身份拒绝。
5. **候选和组合**：MPP `6eed1d80efa2de6b2209aa180f5e5a29c14821d03ecdcc130390a8dc5ed2227e`，600147 B；独立/内嵌MPE `c6034c0c6d5d81858bfac402b34640e18e5c0a09d1bd90432a71be3b35d2220f`；UI `a9e2e70913f6bd62d91de894c0c7d9a5a9b1219b1c275c15744d3dab075f9209`相符。原始YouTube/官方MPP/Patcher及104根输入、组合/既有DEX64581类退出0核验。APK `e1effef6c49298e9126f383a644ffc17759c306606adfb10dace93dabc536de6`，227145902 B；18383条目原字节相同。统筹重编只读canonical/资源工具：839→840类仅新增RequestSettings，逻辑变化精确为五个本卡生产类，其他变化仅debug/build ID，Hook/Bridge保持。六变化XML语义相同，3332旧cap值/ID保持，仅新14值等于一个说明键×14语言。
6. **包体**：MPP较m5i增4007 B（0.6722%），文案压缩3529 B、扩展压缩478 B、ZIP结构0；无新依赖/测试资产。独立真实ZIP条目分解见package-audit.json，不把MPE未压缩增量与压缩增量重复相加。
7. **保护和回退**：2251入场项/ZIP核验，33个已有文件变化，2216范围外现存及两删除状态保持；13910有限历史和368封存索引逐项相符，六前端/分支/HEAD/索引保持。38目标退出ZIP/哈希和默认dry-run在统筹改文档前通过，实际仓库未恢复；隔离拒绝/零写入记录与计划相符。状态镜像同字节，本统筹更新文档后旧回退因后续编辑拒绝是正常保护。

## 不能扩大为已完成的结论

会话启动仍在调用主线程做严格配置/凭据读取；只将一次重复解析减为一次，没有证明硬件Keystore启动延迟达标。活动播放time的120次观察不等同所有宿主事件。source writer是原有非硬容量队列，有限会话排空不等同无限输入有界；诊断决策lane满也会丢，不是永不丢证据。真实设备/OEM帧时、内存、耗电、硬件/磁盘长尾、远端CI、其他组合、服务接收/收费、任意交错均未认证。保留设备小组操作清单供后续有限验收，不再为了这些未测事实虚构JVM指标。

导出仍有历史静态`official=1.45.0`，本轮已准确披露而未当实际版本证据；**后续兼容/产物身份收尾必须处理这个容易误读的字段，不能最终宣称运行来源说明已准确而保留该无标注旧值**。应区分构建预期、组合实测和设备实际，未知不猜填当前1.48.0。该相邻身份问题不阻止F5请求失败分类解释的本卡接受。

## 下一步

下一[M7a v1](../tasks/M7a.md)合并当前维护资料收敛、可分发的开发入口和环境复现演练，生产行为/版本冻结，不引入更多产品重构。统筹确认当前`.devenv/`被本地.git/info/exclude忽略、Git可见文件为空；CONTRIBUTING/RELEASING直接依赖这些本机文件，以及环境脚本的旧工作区fallback、mavenLocal依赖来源，都需要在M7a变成接手者可用的明确入口/前提。

预计还**2–3张实质卡，含M7a**：M7a环境/维护资料、M7b有限兼容/设备及来源说明验收，必要独立补正/收尾才再一张。外部设备/CI输入与未覆盖项仍分别判断，不将“资料已写”自动等同真实设备验收。

本统筹只审查/针对性运行及维护文档，未改生产、旧测试、工具实现，未commit/tag、推送/PR/发布、签名安装、清用户数据/真实缓存、真实付费API、清共享缓存/reset/clean。
