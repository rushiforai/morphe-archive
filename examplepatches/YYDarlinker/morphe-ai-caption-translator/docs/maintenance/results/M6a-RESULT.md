# M6a / 任务卡 v1：诊断可解释性与性能机制基线

2026-10-25（Asia/Shanghai）。**执行结论：完成待复核；统筹：待复核。** 同一对话顺序完成A诊断/F5、B有限机制测量、C有证据的必要局部修复，固定最终输入后统一验证/指定真实组合和交付。不自行接受F5/M6，不进入资料、兼容或下一阶段。

唯一仓库`E:\Projects\DeepSeek morphe-ai-caption-translator`。入场/退出分支`codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`，索引保持。**最后接受仍1.5.8 / local-1.5.8-m5i / candidate-01，861项**；本轮候选**1.5.8 / local-1.5.8-m6a / candidate-01，872项**，公开仍**1.5.7 / release-1.5.7**。

证据根：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M6a-01`。入场2251项含六前端、镜像和两项既有删除状态；entry-originals.zip SHA-256 `6128baf82a5f524733d7af5cee82ede70bf807e6d26529d0606b5a13fdbd42c1`。首改/首Gradle前已经完成入场原件和13910项有限历史哈希；新清单重点保护交付/源码/封存log、XML、receipt、compiled ZIP及回退原件，排除可再生成Gradle class/内部编译缓存，没有重写旧清单和44项恢复历史。本轮差异见batch.diff/source-review.diff，以入场字节比较，不将相对HEAD的旧脏树算成本轮工作。

## A：F5原因、计账和实际决定

当前唯一说明为[诊断/性能合同](../../architecture/DIAGNOSTICS-PERFORMANCE-CONTRACT.md)及[网络合同第11节](../../architecture/NETWORK-FAILURE-CONTRACT.md)。真实链路：RebuildApi/Job→Controller实际决定→TranslationAudit/Runtime→**真实CaptionApplication**→TokenCostAudit/Writer/Archive→实际report/fullText。测试只预置合法Session/源块和本地服务器；未手设terminal模拟分类，未整体fake审计/报告组件。

旧REBUILD_HTTP_FAILURE已有reason/category，但不足以准确还原控制器当时实际门。在**applyFailure更新完成之后**由原Job.trace补`REBUILD_FAILURE_DECISION`，保留session/request/block；记录真实reason、Failure.configuration及delay（非该类型明确unknown）、已更新state/terminal/父块filter、同一次elapsed采样及实际retryAt/providerRetry。字段直接读决定结果，包含此前更晚门，不按HTTP_CONFIG或文案猜重试；普通/page/hole沿同一入口。`failure_delay_ms`可能为服务器等待或negotiation_pending本地等待，不统一称服务端Retry-After。

面板与英文导出增加一个解释段，**完整14语言、一个新键**：HTTP_CONFIG是旧计账桶，含429/503/过滤，本身不代表配置错误、永久停止或必须修改配置；缺失事实为未知。batch/逻辑调用、获准physical attempt、服务器收到、response/quality/cache分别解释；次数不认证收费或退款。旧FailureCategory、TokenCostAudit字段/累计/持久格式及黄金报告全部保留，不重算旧账。

| 实际本地链输入 | 旧计账/实际HTTP | 控制器与诊断事实 |
| --- | --- | --- |
| 401 | 1batch/1attempt/1POST，HTTP_CONFIG | configuration=true、FAILED、terminal=true；schedule无新增POST |
| 429 + Retry-After17 | 同桶、1POST | configuration=false、WAITING、terminal=false；父/provider门均now+17000；门前无新POST |
| 503 + Retry-After17 | 同桶、1POST | 同实际17秒等待；不提示为配置错误或永久停止 |
| 400 data_inspection_failed | 同桶、1POST，保留http_other旧统计 | content_filter、configuration=false、父块filtered=true、FAILED，Session不被伪设terminal |
| 实际wire断连 | 1attempt/1POST，NETWORK_IO | 真实transport reason、configuration=unknown、WAITING，保留实际本地门 |
| 200 finish_reason=length | 1attempt/1POST，quality_rejected_units+1 | output_truncated，无Plan；沿原quality边界，不虚增failure/HTTP_CONFIG |
| 准入前取消 | 0attempt/0HTTP/0failure | 原InterruptedException路径，无伪造Controller决定 |

上述新诊断测试合计**6个provider HTTP**，不能当作完整872项的HTTP总数。原RetryAfter/RepairAdmission真实HTTP回归继续验证到门后恢复、保留更晚父门、page/hole过滤/终止等；不是穷举全部状态码×子范围。

有效a-red01在入场m5i生产上4项/3失败，缺决定事实与解释；a-green02四项全部通过。三个红检查点的受影响生产源码与入场原件逐项匹配，见validation-evidence.json。仍用原credential/scope在writer脱敏；不可读凭据走原pattern规则/credential_unavailable，未扩大默认源文或响应记录，异步snapshot/export/clear epoch保持。

## B：有限可复现机制基线

完整场景、组件/替身、输入、线程/操作/队列、原保护和设备缺口在诊断/性能合同表中。最终114份XML的原始M6A/既有观察行抽入validation-evidence.json，保留每份XML SHA；不以JVM总耗时描述帧率/耗电。

| 固定输入 | 实际结果 |
| --- | --- |
| 同凭据20条诊断 | caller key read=0、enqueue文件目录访问0；writer解密1，线程caption-diagnostics-writer；复用AnimationDiagnostics/N37保护 |
| writer屏障下1220条（20同mergeKey+600普通+600决策） | 两lane各512，merge19/drop177，单次drain投递；批次≤64、60000字符截断和12000字符决策尾保持，截断和丢弃可观察 |
| archive屏障4096任务（1真append+4094自有no-op+尾屏障）再2append | 硬队列4096、overflow丢2；60010中文字符截断至60000字符，实际UTF-8分段180035 B；不把字符限额误写字节限额 |
| writer旧排队→clear→新排队及真实导出 | 旧epoch不复活、新记录可用；导出仍bounded_not_guaranteed并保留drop/merge/epoch；原rotation/expiry、N37 snapshot/面板测试补充 |
| 40组相同viewport/字号/Shorts宽度、200pre-draw | 新分页0、同输入TextWatcher变更0、布局变化回调0，glyph/traversal帧无滞留；真实字号改变新增分页1 |
| 6真实源会话×20次播放time，两个轨道重入 | 120次活动time新增key/严格配置读取0；6次启动的严格配置读取仍在主线程；2源GET、0模型batch/attempt；新会话仍能工作 |
| 同组源cache真实IO/锁观测 | 消费getLocked在CaptionSharedSourceIO；提交临界区内weakerThanCached重入读在DeepSeekCaptionSourceCache；source-ready在CaptionSourceIO；主线程缓存目录访问0 |
| 同组切换/stop/off-main退休屏障 | 各旧Publication拒绝reserve、sourceJob/jobs空；source/cache/diagnostics排队工作排空、flights=0，stop后推进已有tick使tickPosted=false；允许daemon常驻 |

观测不是整个fake组件返回零：配置/SecureApiKey/Conscrypt实际运行，AndroidKeyStore使用已建立的内存SPI；源cache/RawCaptionSource/CaptionDocument/shared flight及HTTP实际运行，仅YouTube连接显式映射到本地fixture，未知host/path/连接拒绝。源生命周期测试的Host适配真实CaptionApplication.settings/load，显示端口为空；不冒称此组是完整播放器设备测试。UI分页用真实Overlay/TextView/native文本测量，只有几何shadow；既有真实应用/CC/语言用例由完整入口验证。

没有新Thread.sleep、扩大等待或整测重试。所有latch/执行器有界，测试自有listener移除，provider/proxy/端口恢复。源WRITES依然是既有单worker队列，本次有限工作可以收尾，不声称其全局硬有界；原PublicationLifecycle/M5i读写屏障作为补充，不要求全JVM线程归零。

## C：只修有证据的问题

生产只改5个既有Java文件及build ID：

1. **RebuildController**：只读失败决定事件及将同一Job传入以携带原request/credential。source-review.json通过精确逆变换证明：移除这段trace并还原Job.index适配后，全部原决策源码与入场完全一致。来源清单仅更新该目的哈希/适配说明，派生patch按真实diff更新；固定upstream/snapshot/协议/提示词/ABI不变。
2. **CaptionDiagnostics / Writer**：14语言说明段及pending_decisions/pending_total。旧pending仍只指普通lane，旧累计字段保持；修正“决策永不丢”注释，明确满决策lane也会丢，未增限额/禁用默认诊断。
3. **DeepSeekConfig / CaptionApplication**：B真实SPI输入证明旧一次严格设置快照重复解析凭据2次。C在允许的最小应用适配边界引入临时RequestSettings(provider, apiKey)，应用转成原不可变TranslationSettings时复用同次已解析key，**2→1**。UI ProviderSettings继续无明文；没有静态明文缓存、持久字段/格式、store事务、origin/alias/配置策略改变。坏类型关闭/空key、origin不匹配不释放key与主动save独立Crypto均实测，M5h保护和通知/编辑相邻回归全部通过。

Overlay、源/译文cache、重试/协商预算及清理生产机制已满足有限测量要求，保持不动。未为缩行、拆类或测试数重构。

| 实际检查点 | tests | failures | exit |
| --- | ---: | ---: | ---: |
| a-red01 | 4 | 3 | 1 |
| a-green01 | 4 | 2 | 1 |
| a-green02 | 4 | 0 | 0 |
| b-queue-red01 | 3 | 1 | 1 |
| b-config-red01 | 1 | 1 | 1 |
| b-session01 | 1 | 1 | 1 |
| b-ui-session02 | 17 | 0 | 0 |
| c-green01 | 90 | 1 | 1 |
| c-green02 | 90 | 0 | 0 |

所有检查点原始log、同次XML/receipt、inputs ZIP/指纹、compiled ZIP及绑定在下一Gradle前归档。有效红绿分别是a-red01→a-green02、b-queue-red01→c-green02、b-config-red01→c-green02；b-session01和c-green01的下列新fixture预期错误不算产品红测。

开发/审计偏差均保留且未冒称通过：

- a-green01：异步clear尚未完成可能晚清审计，另opaque fixture key不可解析导致原pattern无法替换任意opaque文本。增加前置writer barrier及可解析fixture key后恢复真实审计/原脱敏断言；修正新测试拼错的quality计数名。未放宽既有保护。
- 历史generate_localization.py先生成XML后因退役CaptionTranslationCatalog路径失败。本轮生成当前Android资源，没有重建退役源码目录；index/source-keys仅换行变化已从入场ZIP精确恢复。旧值/映射逐项保持，工具本身未改。
- b-session01：新测试误猜getLocked由CaptionSourceIO进入，且把writer的weakerThanCached重入读混入消费读集合。真实调用栈显示shared source worker读取，writer提交锁中重入读；修正观测分类后b-ui-session02的17项通过，未改缓存生产。
- c-green01：90项仅1失败，新测试预期writer的batch marker，而archive同60000字符上限实际保留record truncated marker。改为断言真实可观察截断标记，未放宽限额/改生产行为；c-green02同组90通过。
- 首次只读源码复查helper误读取入场已删除LoopbackCaptionServer，未写该路径；改为现存源码内容核验并另检查两删除状态，复查通过。首次包审计因`utf8-sig`错误编码别名退出，原log保留；改为`utf-8-sig`，第二次只读审计通过。没有重跑完整测试或真实组合掩盖辅助错误。

## 固定输入与统一验证

```powershell
.\.devenv\verify-full.cmd -RunId 20261025-M6a-candidate-01 `
  -EvidenceDirectory validation/runs/20261025-M6a-01/final `
  -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m6a -Offline -RerunTests
```

唯一最终完整入口退出0：**core328 + extension544 = 872**，两组均executed，失败/错误/跳过0，**114份XML**逐份校验。原861项既有断言保持，新增11项；148项原测试/资源除Shorts测试末尾追加一个新方法外原字节保持，该文件所有旧方法也原字节保持。239键×14语言、发布合同14/验证工具合同15、metadata、来源/协议/提示词/Hook ABI、compiled/UI/包边界、凭据扫描全部通过。

最终源码指纹 **`30b8cc6a4f236df8038f1e971bcde9bbb323c30d8bc6b5760f021efda9bc798d`**；fixed-final-inputs.json/zip与完整前后manifest及退出工程相同。**同次557类**在下一Gradle之前封存，ZIP SHA-256 `8dc087034e330517ce9c8dc261069a7439d7a5965287d487de8874149865eac7`，receipt SHA-256 `4b8f35f1170039d589eb0cc07e6aa2704ff539538171722a6113892e00d7a396`；compiled-binding.json含归档时刻和逐类SHA。新增临时类各有debug/release编译副本，所以归档较接受M5i555类增加2；实际DEX只新增1类。

从该ZIP取core独立复查明确MPP/MPE/UI边界与candidate身份通过。两个真实存在的输入负向均exit1：本地冒充release缺release-1.5.8，接受M5i冒充M6a缺local-1.5.8-m6a；见independent-commands.json及原log。没有用缺文件冒充身份拒绝。

| 产物 | 绝对路径 | 字节数 | SHA-256 |
| --- | --- | ---: | --- |
| MPP | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M6a-candidate-01\patches-1.5.8.mpp` | 600147 | `6eed1d80efa2de6b2209aa180f5e5a29c14821d03ecdcc130390a8dc5ed2227e` |
| 独立/内嵌MPE | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M6a-candidate-01\extension.mpe` | 732892 | `c6034c0c6d5d81858bfac402b34640e18e5c0a09d1bd90432a71be3b35d2220f` |
| UI preview APK | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M6a-candidate-01\ui-preview-debug.apk` | 3521748 | `a9e2e70913f6bd62d91de894c0c7d9a5a9b1219b1c275c15744d3dab075f9209` |

独立/内嵌MPE同字节；UI不含translation core。未覆盖任何旧交付或公开1.5.7。

## 指定真实组合、资源与包体

实际`run-composition.ps1`经`.devenv/dev.cmd`顺序执行`:patches:verifyComposition`（compile=true）及`:patches:auditComposition`，均exit0；实际完整参数、runtime classpath、Gradle receipts和输入哈希保存于composition-command.json/audit-command.json及相邻文件。

- 原始YouTube21.41.525-SECONDARY SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`。
- 官方MPP1.48.0 SHA-256 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`。
- 实际Patcher2.0.0 JAR SHA-256 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`。
- **104官方默认根+AI**，实际资源重编译和既有DEX审计 **64581唯一类**，无重复/测试/回环泄漏。未签名APK `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M6a-01\composition-M6a\patched-unsigned.apk`，227145902 B，SHA-256 `e1effef6c49298e9126f383a644ffc17759c306606adfb10dace93dabc536de6`；未签名安装。

对接受M5i ZIP逐条目检查：APK变化为AndroidManifest.xml、classes13.dex、res/Yak.xml、res/layout/morphe_settings_with_toolbar.xml、res/xml/morphe_prefs.xml、res/xml/morphe_prefs_icons.xml、res/xml/morphe_prefs_icons_bold.xml、resources.arsc；其他**18383条目**原字节相同，无增删。实际只读ARSCLib工具对这6份XML证明语义相同，对compiled table证明**3332旧cap值及ID全保持**，只新增一个诊断说明键×14语言并逐项等于catalog。没有将新资源误报为同字节。

classes12/13共839→840类的canonical审计保留成员/代码/debug，再仅去除已知build ID和方法debug用于分类：**826类raw同字节**；13既有raw变化中只有CaptionApplication、CaptionDiagnostics、CaptionDiagnosticsWriter、DeepSeekConfig、RebuildController **5类有逻辑变化**，其余8类仅debug/build ID；唯一新增DeepSeekConfig$RequestSettings。Hook、HookV2、NativeCaptionBridge直接比较原类内容保持。无新依赖、测试类/资产、通用遥测线程或服务。

| MPP增量来源 | 相对接受M5i |
| --- | ---: |
| 14语言说明资源压缩增量 | +3529 B |
| 内嵌MPE二次压缩增量 | +478 B |
| manifest/其他/ZIP结构 | 0 B |
| **MPP总量** | **596140→600147 B，+4007 B，约0.6722%** |

MPE未压缩731840→732892 B（+1052），不能与二次压缩478相加。组合APK增加8773 B。MPP74条目中16变化（manifest、MPE、14语言XML），另**58条目**原字节保持。增长来自实际诊断说明/事实/队列展示及凭据单次快照，没有无意依赖/测试/调试资产泄漏；测试、报告和历史不打入MPP，不由包体推断运行性能。

## 保护、限制与交付状态

protection-audit.json确认：138个既有生产Java/Kotlin输入仅上述5文件改变；**2216范围外现存文件**、148项原测试/资源的既有内容、六前端、**13910有限历史项**及两项既有删除状态保持；分支/HEAD/索引保持。SourceCaptionCache/RebuildCache身份、格式、目录版本、TTL、限额、F1/F2/F4、正常请求预算/finishSent/STOPPED/Publication、F3语义复用、源模式零模型请求、失败无源文、原生CC/语言与M5h保护均保持。状态与镜像逐字节一致。

更新了诊断/性能合同、网络F5当前状态、状态合同、配置合同的同次key说明、维护README/路线、架构摘要、收尾清单及PROJECT-STATE/镜像。工程在完整入口之后没有变化；文档不自行接受F5/M6、没有下发/执行下一阶段。

未认证：真实设备/OEM、硬件Keystore/物理磁盘长尾、帧率/内存/耗电、远端CI、其他APK/官方组合、真实服务器接收/处理/收费和任意线程交错。源WRITES不是被本轮认证为硬有界队列；源checkActive→put晚到窗口、跨文件断电/双IO、配置多store/orphan等原限制保持。导出既有`official=1.45.0`是历史静态标记，不当实际加载官方版本认证；真实组合以本轮哈希/receipt为准。少量同设备后续验收场景在合同列出，本轮未签名安装或请求付费服务。

## 逐文件回退

**38目标**退出哈希回退；exit-originals.zip SHA-256 `2f44dbf16948cca39423582fc0a952c0845629a98ddc4045e228ea835c535cb1`。包括本轮生产/build ID、catalog/14语言、四新测试及Shorts追加、来源记录、当前文档和状态/镜像成对；排除结果报告、证据及所有新旧包。原件来自入场ZIP，不使用HEAD/reset/clean。batch.diff、rollback-plan.json和exit-target-hashes.json供逐文件审阅。

```powershell
& 'E:\Projects\DeepSeek morphe-ai-caption-translator\work\toolchain\python\python.exe' -X utf8 `
  'E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M6a-01\rollback.py'
```

**实际仓库默认dry-run通过，未实际apply。** 只有显式--apply才回到本轮入口字节；先全体检查退出哈希、原件ZIP及安全路径，任一后续改动/删除整体拒绝且零写。E: `.tmp/M6a-rollback-rehearsal-02`实际演练dry-run、后续编辑拒绝且零写、恢复正确退出字节后隔离apply、38目标精确入口还原/新增文件仅在演练移除、状态镜像一致。文案复查前第一次退出ZIP/计划和演练原件另名保留，没有覆盖旧证据。

全部项目工作和fixture在E:；共享工具/系统存储原位保留。没有commit/tag、推送、PR、发布、签名安装、清用户数据或真实缓存、真实付费API、清共享缓存、reset或clean。**交统筹复核本卡F5解释/事实、操作基线、两项局部机制修复和上述披露限制；执行者只标记完成待复核。**
