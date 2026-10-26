# M5e / 任务卡v1 执行结果

2026-10-25（Asia/Shanghai）。**执行完成待复核；统筹状态：待复核。** 本卡只改善测试可重复性，未自行接受或进入其他阶段。产品仍1.5.8 / **local-1.5.8-m5d-r1**，公开仍1.5.7。

## 1. 入场与范围

唯一活动仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`；进入/退出分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`。复用现有工作树，保留入场已修改、未跟踪和删除状态。已读AGENTS、当前状态身份/最新维护记录、README、M5d-R1 REVIEW、M5e v1、状态/网络合同与路线相关部分。

独占证据 `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5e-01`。`entry.json`/`entry-originals.zip`保存2212个Git可见实际文件原件；entry-working-tree/index.patch和六忽略前端清单独立保存。按入场原件计算本批差异，不以HEAD总diff为本卡成果。有限历史保护清单涵盖旧run根记录、M5d-R1原失败/777项/执行及统筹XML和compiled、原M5d统筹探针、既有候选/交付和M5d-R1组合APK；不枚举旧解码中间树。

生产冻结：159个入场/src/main文件、资源、gradle.properties、core来源、协议/提示词/Hook ABI、Gradle/CI/验证工具与依赖不改。入场接受MPP `ca8e4ddf27156312d8b07aabd6677f83dc7bd7c8d6f3772d2eb1e864b414f477`，MPE `0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e`核对通过。只有ContinuousDisplayTest及维护README/路线/PROJECT-STATE/镜像和本结果改变；run脚本均在本轮证据目录，不修改既有验证工具。

## 2. 原失败可知、未知与实际对照

原 `validation/runs/20261025-M5d-R1-01/targeted/`：85项中该方法在215行等“第x句”10秒超时；原XML只给笼统等待失败，没有HTTP/代际/位置/合并事件链。统筹后续85项、历史38项/777项均通过，不足以补出当时顺序。

本轮原字节方法单项再次在215行失败（baseline-single，1/1），同源码组内一次7/0。随后先只加test-only观察和清理、不改目标方法，运行一次 observed-original：1/0，实际记录普通b1_15_29部分Plan→hole b1_23_29→HOLE_FILLED（elapsed380）→seek 500→8000→seek 8000→12000→有效showEvent“第x句”。后续修改为受控夹具；没有循环原测试直到成功。最初失败和历史失败均没有当时完整链，**历史原始根因仍未知**；当前已有同症状复现与一个可检查的成功排列，不能称原失败全部归因于已修复夹具。

代码核对：普通Plan先发布保留前半句并将echo范围23–29记为hole，fillHoles抓取当时generation及Plan引用。HTTP在Session锁外完成，成功后只有current、generation和原Plan仍相符才merge。RebuildClock.acceptNative把短时间内超出max(2500,elapsed_delta*4+500)的前进识别为seek；time/resetDisplay推进generation、撤旧guard，Plan本身可保留。原play的500→8000和8000→12000在小elapsed下是seek，看到前半句并不保证hole已完成。原方法同时隐含“成功补洞”与“seek期间旧响应有效”两个不兼容前提。

受控场景确证：

- 正向：收到真实hole HTTP后扣响应，连续500ms步进同时推进elapsed和位置，8000处显示原前半句；释放响应并等HOLE_FILLED，原有效event对象仍保留、holes为空；连续推进12000，缺失半句在合法窗口通过有效guard/showEvent显示，generation保持0、无seek。最终单项中缺失半句窗口11050–14900，show at11500。仍经真实引擎、源fixture、RebuildApi、MockWebServer、解析/部分Plan/合并/渲染，没有伪造文字回调。
- 失效：同样扣hole，在响应前执行原式8000/12000跳转，generation增加、旧RenderGuard无效。释放响应并排空两个worker lane后，原部分Plan对象不变、无HOLE_FILLED/“第x句”；使用同一个显示断言短预算明确失败。这是合同要求的拒绝，不是生产缺陷；生产静默return无拒绝mark，测试用捕获generation/Plan引用及完成屏障证明该边界，未虚构生产拒绝日志。
- 缺显示负向：正常连续播放到缺口，仍扣HTTP，完全相同assertMissingHalf以100ms诊断预算失败，包含等待事件/generation/位置/请求和最后文字；随后释放，真实合并与有效显示成功。100ms只用于预期失败控制，正向上限仍10秒。
- 失败清理：临时test-only注入在8000前半句已显示、响应仍扣留处assertTrue(false)，实际1项失败，诊断为指定注入点；@After释放latch、stop/retirement、三lane屏障、MAIN ready任务及server shutdown均完成，记录CLEANUP drained和Host/Output/Audit/stream全部restored=true。finally按fault SHA核对后恢复固定测试原字节，未碰生产；`fault-restoration.json`和失败XML留存。之后最终单项实际通过。

有限事件链原件在各轮XML/system-out及event-chains.txt，汇总 `sequence-excerpts.txt`、`all-test-runs.json`；原失败证据仍在原目录且受哈希保护。上述受控解释不等于复原历史故障的CPU/HTTP交错，也没有证实静态端口或晚到任务就是原始诱因。

## 3. 修改及断言映射

仅测试类：目标方法替换基于sleep的两次跳转协调；新增held-hole与seek两个@Test；原其他六方法体不变。共用fixture增加已存在Host.mark/Output.Sink观察，记录首80+尾80条事件，每条最多1200字符；不转储原始请求/响应、真实key/profile或用户数据。HTTP只接收受控POST /v1/chat/completions，模型为fixture-model/fixture-key；源Host直接构造StartupSchedulingTest.source，无源HTTP，URL是fixture身份，不访问YouTube。相关原有测试也沿用各自本地fixture，完整入口translation.live=false。

保留/增强映射：第0句真实显示、前半句真实显示、缺失半句“第x句”必须经过有效guard、原文sentence不得显示全部保留；补充hole源尾部over time不得显示、blank为空、原Plan改为已合并Plan且hole为空、原有效event对象保持、连续播放generation不变。旧generation不得合并与旧guard失效由独立seek用例保护，原RepairAdmission同类负向仍完整通过。没有删除/skip/放宽有效断言；没有新增Thread.sleep（原两个helper语句原样留给其他六个测试），没有放大10秒、没有整测自动重试。

后台HTTP等待用有界latch，主线程等待用有界事件队列并只idle ready MAIN；等待网络不偷偷推进媒体时间，播放才同步推进elapsed/位置。teardown总是先释放本测试latch，再撤权、off-main有界retirement、每worker一个会合屏障排空SOURCE/PRIORITY/PREFETCH，最后ready MAIN、关server、复位API并恢复原Host/Output/Audit/stream。没有清共享缓存；RebuildCache.clear仅保留原setup的测试fixture边界，未新增缓存清理以掩盖未知问题。各屏障/Future/latch均有限，不在生产引入轮询/等待。

## 4. 全部实际运行及顺序

所有Gradle顺序执行，单次结果在下一次前归档XML/HTML/receipt及源码；选择和argv见各目录command.json。开发build root独占 `build/maintenance/M5e/20261025-M5e-01/development`。

| 轮次 | tests | failures | 进程exit |
| --- | ---: | ---: | ---: |
| baseline-single | 1 | 1 | 1 |
| baseline-group | 7 | 0 | 0 |
| observed-original | 1 | 0 | 0 |
| controlled-first | 3 | 0 | 0 |
| fixed-group | 9 | 0 | 0 |
| fixed-related | 87 | 0 | 0 |
| forced-assertion-cleanup | 1 | 1 | 1 |
| fixed-final-single | 1 | 0 | 0 |

均0 errors/0 skipped。baseline-single是真实原测试失败；forced-assertion-cleanup是明确期望的故障注入，未记作通过。controlled-first为开发中3个受控方法选择，后续fixed-group9及fixed-related87在诊断收敛后通过；87项后仅补充端口恢复记录和原有效event对象断言，最终single及完整入口绑定最终同一测试SHA。

实际相关前置顺序以XML suite timestamp及M5E completion输出为准，**--tests参数顺序不承诺执行顺序**：AttemptAdmission→ContinuousDisplay→CoreSessionIntegration→N52DisplayRepair→NetworkFailureContract→PublicationLifecycle→RepairAdmission→RetryAfterContract→StreamingDisplay。Continuous组内hole前有aBlockThatFailed…，后续其余旧方法及两个新增控制均留证。比较了原单项/原组、固定组/相关Attempt前置、最终独立单项和完整入口自然前置，未穷举任意排列、未运行数百次统计置信度。

完整命令（原样保存full-command.json及full-and-archive.ps1）：

```powershell
.\.devenv\verify-full.cmd -RunId 20261025-M5e-candidate-01 -EvidenceDirectory validation/runs/20261025-M5e-01/final -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m5d-r1 -Offline -RerunTests
```

结果：core **320** + extension **459** = **779**，各0 failures/errors/skipped；receipt两组均executed，RerunTests强制执行，不用旧XML代替。本轮增加2项，入场777项相应变为779。输入指纹 `9ee92d496eea7a14f83db5c8b42272a225aaacd821d04a0d80b0f1ad887f7683`，前后清单相同。来源/字面量/ABI、232 keys×14 locales、release/verification工具自检、metadata、compiled/UI/包边界和凭据扫描由该接受入口实际完成；每步实际命令、exit和报告在final/summary.json及各日志。构建允许FROM-CACHE/UP-TO-DATE，具体task outcome以receipt为准，不声称全部重编/R8重跑；同次core compiled在后续Gradle前立即归档。

归档时点说明：开发core使用新独占root；每轮新结果在下一Gradle前归档。共享extension旧69 XML已有受入场保护的M5d-R1完整归档，本轮额外副本是在full Gradle开始后、extension XML最终覆盖前保存，逐份哈希与已接受归档相同（prior-extension-archive.json），**不冒称这份额外副本在调用前生成**。未丢失原报告；此时点偏差交统筹判断。初次entry保护扫描遇Win32长路径异常，未改源码前改用扩展路径重做；额外归档脚本首次因summary模块键名失败，改正后69份核对完成，均未对生产/历史文件写入。

## 5. 候选和生产保护

候选绝对路径 `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5e-candidate-01\patches-1.5.8.mpp`，586963 B，版本1.5.8 / local-1.5.8-m5d-r1，SHA-256 **e007601dd93da64925acb624bc66e3187746404b4389533b1ae2e78641288958**。

独立MPE `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5e-candidate-01\extension.mpe`，721296 B，SHA-256 **0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e**；与内嵌MPE及已接受M5d-R1 MPE逐字节相同。MPP逐条目比较允许且仅允许manifest构建Timestamp变化，根classes.dex、全部补丁class/资源/14语言和扩展MPE保持原字节（candidate-entry-comparison.json/manifest-timestamp.diff）。生产内容比对检查先于引用历史组合结论；旧接受包未覆盖，新RunId独占候选目录。

本轮**未重做真实APK组合**。在生产内容同字节前提下，仅引用M5d-R1那一组：原始YouTube21.41.525-SECONDARY、官方1.48.0、Patcher2.0.0、104默认根+AI，组合APK `71b77e0a6758f0417a135ee3f8c2ea24e4a1814f6f844f30f6483cdbc329c34c`，历史16 DEX/64565唯一类和无测试/回环泄漏；沿用其输入/选择及设备未验限制。未声称本轮重新组合或设备认证。

逐文件核对实际通过：159个生产文件、139个其他测试文件、1842项有限历史/冻结清单、6个忽略前端保持入场SHA；2208个范围外Git可见原件保持，索引/分支/HEAD相同，状态镜像同字节（protection.json）。MPP共74条目，73条目原字节相同，只有META-INF/MANIFEST.MF的Timestamp从1792894452684变为1792896640728；classes.dex SHA为`aeda0a82d50b8006560e786048c9e5a465b399aa15f15bb59285fc83dd30aa48`，与接受包相同。R8本轮receipt为UP-TO-DATE，buildAndroid实际执行；没有冒称R8重跑。完整入口的9个Continuous用例均记录CLEANUP drained和四端口恢复true，held/seek/旧正向显示失败三个控制事件均实际存在（full-events-check.json/full-event-chains.txt）。批次diff对entry-originals而非HEAD；退出清单/快照、逐文件回退清单及证据索引可供统筹复查。

## 6. 回退、未覆盖与交回

回退脚本 `validation/runs/20261025-M5e-01/rollback.py` 默认只核验；加`--apply`前必须逐文件确认当前内容等于退出SHA。任一后续修改或路径不符则拒绝整批恢复；通过后只恢复本批五个既有文件（测试、维护入口、路线、PROJECT-STATE、镜像）的入场字节。新报告/证据/新旧候选均保留，不reset/clean、不覆盖用户之后的工作。入口原始状态含既有未提交/未跟踪内容，恢复不会退回HEAD。

未覆盖：原历史失败的实际请求交错、任意调度/CPU负载排列、跨进程/所有宿主线程交错、远端CI、其他组合、设备UI/性能、真实YouTube/供应商/付费或退款、长期统计稳定性。未发现需另卡修复的受控生产缺陷；seek拒绝符合现有合同。是否接受“历史原因仍未知，但指定顺序与日常夹具已固定”的交付，以及额外报告归档时点偏差，由统筹决定；执行者不自行宣告历史问题彻底解决。

无commit/tag、推送/PR、发布、签名安装/清用户数据、真实付费API、共享缓存清理或reset/clean。全部项目脚本、scratch、构建和证据在E:，环境只进程级。本轮停止，F3/F5、配置/存储及M6/M7均未进入。
