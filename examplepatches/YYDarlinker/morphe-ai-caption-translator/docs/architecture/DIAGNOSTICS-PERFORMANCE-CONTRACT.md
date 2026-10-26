# 诊断解释与性能机制合同

M6a v1，2026-10-25（Asia/Shanghai）；经[统筹复核](../maintenance/reviews/M6a-REVIEW.md)接受F5解释/实际决定、有限性能机制基线及两项局部修复。接受本地1.5.8 / local-1.5.8-m6a / candidate-01，公开1.5.7；原[M6a结果](../maintenance/results/M6a-RESULT.md)及证据保留。设备/硬件/物理IO长尾不由本合同认证。

本文记录真实组件中的事实和有限输入的操作基线。JVM测试总耗时、Robolectric帧推进和包体大小均不能认证设备帧率、内存、耗电或硬件Keystore延迟。

## F5：原因、旧计账和调度分别读取

真实路径是RebuildApi/Controller → TranslationAudit/TranslationRuntime → CaptionApplication → TokenCostAudit/CaptionDiagnosticsWriter → Archive、Snapshot、面板与导出。失败决定来自控制器；诊断只记录已应用的值，不参与准入。

| 事实 | 来源及解释 | 不能据此推断 |
| --- | --- | --- |
| `reason` | API Failure.code、TransportFailure.reason、Invalid.code或实际异常类型 | 不能按文案猜配置、过滤、费用或重试资格 |
| `HTTP_CONFIG` / `category_http_config` | 保留历史枚举及累计字段；RebuildApi.Failure包括401、429/503、content_filter等 | 不等于configuration=true、terminal或必须修改配置；不重算历史账 |
| `REBUILD_FAILURE_DECISION` | applyFailure完成同一Session/父块状态更新后，由该Job.trace记录session/request/block、reason及下表事实 | 是当时决定快照；既非永久当前状态，也非每帧状态探针 |
| `logical_requests` / batch | 一次逻辑translate调用的审计开始；普通块、page/hole或协商有各自边界 | 一批不一定只有一个POST；提前blocked/取消可能未开始batch |
| `attempts` | 每次物理尝试获准之后的审计计数；协商和stream fallback会分别增加 | 不能证明服务端已收到、处理或收费；取消不证明退款 |
| response / quality / cache | 供应商响应计数、结构/质量拒绝和磁盘恢复分别记账 | 结构拒绝可能已记响应/quality而没有failure桶增量；不能把这些数互相替代 |

新增决定事实全部来自实际对象及已更新门，没有按分类重建决策：

| 字段 | 实际读取点 |
| --- | --- |
| `configuration` | 真实RebuildApi.Failure.configuration；非该类型为`unknown` |
| `failure_delay_ms` | 真实Failure.delay；非该类型为`unknown`。这是失败携带的delay，可能来自Retry-After，也可能为negotiation_pending本地等待，不能统一称服务器等待 |
| `state` | 本父块实际READY / FAILED / WAITING；已有Plan与发送资格分开 |
| `terminal` / `filtered` | 实际Session.terminal和本父块filteredBlocks成员 |
| `decided_at_elapsed_ms` | 与本次失败门更新相同的elapsedRealtime采样 |
| `retry_at_elapsed_ms` / `provider_retry_at_elapsed_ms` | 更新后的实际父块/会话门，包含此前更晚的门；毫秒值是进程单调时钟坐标，不是UTC时间 |

门前、terminal或filtered会挡住新调度；到门后仍需current/Publication/配额/任务归属等所有原检查，事件本身不承诺一定发请求。普通失败、page/hole失败共用同一实际决定入口；取消或退休已经拒绝该决定时不伪造新会话决定。已发旧调用可以按finishSent收尾，但新attempt仍经F4准入。

面板和英文导出均增加一个说明段，完整14语言；没有新增开关。旧TokenCostAudit序列化、计数、历史统计和黄金报告保持。事件由原credential/scope在writer上脱敏；完整源/响应仍受原debug开关控制，缺少密钥按现有pattern脱敏并标记credential_unavailable，不写原始错误响应来猜原因。缺失事件、满队列、截断和旧版本无字段均解释为未知。

## 有限机制测量

证据根为`validation/runs/20261025-M6a-01/`。最终有效数字以结果和同次XML为准；早期失败区分产品缺口与夹具错误，不以随后通过重写历史。

| 场景及固定输入 | 真实组件／替身边界 | 线程、操作、队列及清理事实 | 基线保护与设备未验范围 |
| --- | --- | --- | --- |
| 同凭据20条动画诊断 | 真实mark/capture/writer/archive；SecureApiKey解密端口shadow计数 | 调用线程key read=0；writer解密1，线程caption-diagnostics-writer；enqueue不调用getFilesDir | 复用AnimationDiagnosticsTest；shadow不是硬件延迟测量，真实GCM另行验证 |
| 播放热路径：6会话×20次time | 真实Controller、严格配置、RawCaptionSource、解析、源缓存、shared flight；Host仅适配真实CaptionApplication.settings/load，源连接限定本地fixture，输出端口为空 | 120次活动播放time不新增key/严格配置读取；主线程缓存目录访问0；6次启动的严格配置读取仍在调用主线程 | 不宣称启动从不访问Keystore；不把prefs读取等同已测物理磁盘IO |
| 严格配置→请求快照及主动保存 | 真实M5h严格读取、SecureApiKey、Conscrypt AES/GCM，内存AndroidKeyStore SPI | 红测一次app.settings读取同凭据2次；局部修复后1次；用户主动save独立1次Crypto读取 | 同一ApiProfiles.LOCK内验证及交付；坏元数据、origin/缺key规则保持，设备硬件耗时未知 |
| writer突发1220条 | 真实双lane，writer前置有界latch；20同mergeKey+600普通+600决策 | 两lane各512；合并19、丢177，单个drain投递；批次≤64，批次文本上限60000字符，决策尾12000字符；截断可见 | 普通噪声不能占决策lane；决策lane满也会丢。旧pending仍是普通lane，新增pending_decisions/pending_total；不提高限额 |
| archive满载及中文长记录 | 真实4096任务队列；1条真实append+4094个测试自有no-op+尾屏障；再2条真实append | 队列4096，overflow丢2并显示计数；60010中文字符按60000字符截断并记录marker；实际UTF-8字节另记 | 单记录/批次上限为字符，不冒充字节；每channel32×256KiB分段、24h保留由原rotationAndExpiryAreBounded补充；不能保证永不丢 |
| clear后恢复与导出 | 真实writer/archive epoch，旧排队记录→clear→新记录；真实report/fullText | 旧记录不复活、新记录可导出；manifest保留bounded_not_guaranteed/drop/merge/epoch | N37SnapshotBindingTest验证异步面板、旧epoch/语言/profile快照；导出可等待后台，播放入口不调用该屏障 |
| 稳定视口/字号/Shorts宽度 | 真实Overlay、TextView、分页线程和布局；仅视频几何shadow | 40组重复事件、200次pre-draw：新分页0、同输入TextWatcher变更0、布局变化回调0；没有滞留glyph/traversal帧；真实字号改变产生1次新分页 | comment仅缩图不缩字幕计划；复用ShortsCommentViewport/N37/CaptionAnimationIdle；不等同OEM帧时 |
| 六次源会话启动/切换/stop/重入 | 同上真实源组件；仅两条轨道，测试独有目录 | source GET=2、model batch/attempt=0；每个旧Publication拒绝reserve、sourceJob/jobs清理；off-main awaitRetirement、source/cache/writer/archive屏障结束，flights=0，排队工作清空；新会话仍可用 | 不要求daemon worker退出，不关闭无关全局线程；不清用户缓存；已有PublicationLifecycleTest补充已准入permit/退休sent/取消收尾 |
| M5i源cache锁的实际调用者 | ContextWrapper观察真实getCacheDir调用栈及Thread.holdsLock，无缓存整体fake | getLocked消费读取在CaptionSharedSourceIO；写提交临界区内weakerThanCached重入读在DeepSeekCaptionSourceCache；source-ready在CaptionSourceIO；本次没有主线程缓存IO/锁等待 | 不能凭源码Files调用就称主线程阻塞；未测所有宿主入口/文件系统长尾。M5i成对读写屏障验证worker读者等待后取得完整pair |

writer的executor容量64、archive4096、snapshot pending2/每项callback16、分页worker/prefetch各队列2及plan LRU64均沿用原设计。源缓存WRITES是既有单worker队列；本次仅有限6会话并显式排空，不宣称它是有硬容量的队列或所有输入全局有界。core的tick在stop后至多已有一次回调执行，执行时current拒绝并不再续投；本测试推进100ms确认tickPosted=false。

## 有证据的局部修复与保持项

1. `REBUILD_FAILURE_DECISION`补齐当时实际门和状态；不改变请求/重试/终态/过滤逻辑。
2. 队列报告补pending_decisions/pending_total；旧pending和累计written/merged/dropped含义保持。clear仍按epoch清排队和密钥快照，不重置历史累计计数。
3. 严格读取生成临时RequestSettings（ProviderSettings+已解析key），CaptionApplication直接转成原TranslationSettings。UI取得的ProviderSettings继续无明文；不增加静态缓存、持久字段、密文格式或跨store事务。真实同输入SPI读数2→1，显式用户保存独立进行。

已有热路径异步脱敏、队列/分页/退出机制满足上述有限要求，保持生产不动。没有为了缩行/拆类、缩短测试耗时或增加测试数改Overlay/调度/缓存实现。

F1/F2/F4、正常请求/协商/修复预算、Publication/旧scope、源模式零模型请求、失败无源文、原生CC/语言、M5h配置保护及F3/M5i缓存身份/格式/TTL/配额不变。源checkActive→put晚到窗口、跨文件崩溃/双重IO及配置多store/orphan/硬件限制仍按原合同披露。

## 设备与外部验收缺口

本卡不安装、签名、不访问真实付费服务。后续同设备、同YouTube/官方MPP/输入可执行以下小组观察，由统筹决定时机：

- 同一60秒片段，普通播放和Shorts评论开合各20次，保存同输入前后frame-time trace；确认字号真实变化仍生效，记录OEM、刷新率和模型网络条件。
- 同机启动/切换/退出10次，分别记录启动阶段Keystore/严格配置读取和播放阶段IO；检查停止后本产品回调、source/model flight及队列收尾，允许daemon按设计常驻。
- 同一10分钟观看条件比较进程内存曲线和能耗观察，保留网络/亮度/温度/后台状态；不能以本机JVM运行时长换算这些指标。

未认证远端CI、其他APK/官方根组合、真实服务器收到/计费、硬件Keystore、OEM物理磁盘/长锁尾延迟、任意线程交错或无限突发。F5以“已解释／已补真实事实、旧分类兼容、未知范围保留”经统筹接受；设备性能等边界继续保留。

## M6a历史固定输入验证

完整入口Offline+RerunTests实际core328+extension544=872，失败/错误/跳过0；M6a当时工程指纹`30b8cc6a4f236df8038f1e971bcde9bbb323c30d8bc6b5760f021efda9bc798d`。同次compiled/XML/receipt在下一Gradle前封存，规定21.41.525-SECONDARY / 官方1.48.0 / Patcher2.0.0 / 104默认根+AI真实组合、资源重编译与既有DEX审计通过；明确MPP/MPE/UI及身份负向见结果。MPP 600147 B，较接受M5i增4007 B，细分资源/MPE/ZIP见结果和package-content-audit.json。F5/有限机制规定范围经统筹复核接受，独立103项通过；M7a工具/资料后来已接受；M7b最终来源补正见下节。

M6a历史export manifest中的`official=1.45.0`是静态字段，不是实际已加载来源；M7b已最小修正当前导出，映射见下节。此字段不参与失败决定或请求统计。


## 当前统筹结论

完整872项/同次编译/包与组合可追溯，统筹独立18类103项通过；本表20记录、突发双lane/归档丢弃、稳定视口和6会话数据均独立复现。主线程启动配置读取不改称后台读取，source writer非硬有界、决策满可丢等限制保持。M7a工具/资料规定范围已接受；M7b来源补正及有限组合经统筹接受本地范围，设备待安装/待观察。旧日志的official=1.45.0只按历史静态标记解释，当前字段映射见下节。

## M7b：来源元数据合同与旧→新映射（本地规定范围已接受）

接受本地1.5.8 / local-1.5.8-m7b / candidate-02，见[M7b复核](../maintenance/reviews/M7b-REVIEW.md)；公开1.5.7，设备未安装/未观察。生产只改变CaptionDiagnostics.fullText的技术manifest拼接、NativeCaptionBridge首次draw-hook事件的来源文字，以及gradle.properties build ID。没有可靠运行时读取官方MPP/Patcher/组合receipt的接口，故不引入反射、网络版本探测、线程或用户开关。不新增UI文案；原14语言界面和英文report标题保持，技术manifest使用明确英文值。

| 字段/旧断言 | M7b含义与直接验证 | 兼容处理 |
| --- | --- | --- |
| `ui`, `engine`, `build` | addon版本1.5.8、真实BuildConfig build ID；不是宿主YouTube版本 | 字段名和旧身份断言保留；build为local-1.5.8-m7b |
| `core` | 仍为rebuild-1.4.0/ac65fe8 | 不变；不把固定core版本改成addon或官方版本 |
| 无来源类别的静态 `official=1.45.0` → `official=unknown` | 运行时未确认官方包；新增`official_source=runtime_unverified` | 保留字段名；解析器须接受unknown，不再假定纯数字。旧日志不重写；没有既有测试要求该旧静态值，无旧保护断言被删除 |
| 新 `patcher=unknown; patcher_source=runtime_unverified` | 设备运行时未确认补丁器身份 | 不能从本地Gradle/Patcher输入倒填手机运行事实 |
| 新 `build_expected_official=1.48.0`, `build_expected_patcher=2.0.0` | 当前构建目标/本地已验证的输入元数据 | 预期不等于实际加载；升级依赖时须重新核对这些值及声明，不自动探测 |
| 新 `composition=unverified` | 插件没有验证设备安装与离线组合receipt的对应关系 | 即使本机有限组合通过，导出也保持unverified；准确组合SHA在外部结果/binding |
| 新 `core_source`, `core_adaptation=local`, `core_provenance=docs/core-provenance.json` | 固定仓库及完整commit ac65fe803ec2b11821b1131040f807922a2b8505；本地适配依据 | 来源不是“完全未修改的上游”；固定源码/协议/提示词/ABI保护继续有效 |
| `presentation` / `presentation_revision` | 沿用内部呈现修订标记 | 不作为依赖、APK版本或设备认证 |
| completeness/drop/merge/epoch/records/debug及历史统计 | 原有真实队列、限额和累计语义 | 不变；旧缺失字段及被丢/截断记录仍为未知，不回算历史账 |

有效红测在入场m6a生产上执行真实writer→archive→report/fullText，两项均因official实际1.45.0与应有unknown冲突失败，非缺文件/构造异常；原log/XML/receipt/compiled及源码输入ZIP保留。最小修复后同类及诊断相邻19项通过；固定输入完整core328+extension547=875，无失败/错误/跳过。新测试中core_adaptation的初稿期望含分号，绿测前拆成两个合法manifest字段断言，official红断言未变；没有放宽既有身份/脱敏/历史/限额保护。

真实导出兼容semicolon key=value解析，无重复字段；真实旧日志`official=1.45.0`仍逐字存在于历史，当前manifest单独为unknown；credential脱敏与summary身份保持。实际MPP内嵌/独立MPE及组合DEX另核验新来源字段，不能只靠新常量测试。完整输入/红绿/有限组合/包体/设备缺口见[M7b结果](../maintenance/results/M7b-RESULT.md)。设备、OEM、真实服务、性能数值及本合同原有配置/缓存/线程限制均未扩大认证范围；短设备步骤见[验收准备](../maintenance/M7b-DEVICE-ACCEPTANCE.md)。

M7b首候选包审计进一步发现NativeCaptionBridge首次draw-hook事件当时仍为`build=n30;official=1.45.0`；这不是仅存的历史记录，而是candidate-01当时仍会发出的文字；candidate-02已修正。对应真实suppressNativeDraw→writer→fullText红测3项中1项失败，最小文字修正后含原生/开关相邻24项通过。旧→新为`build=n30`→实际BuildConfig build ID、`official=1.45.0`→`unknown;official_source=runtime_unverified`；保留事件名/采样一次门/原draw返回逻辑和旧历史。没有为了该字段重构原生桥或版本探测框架。先前candidate-01的完整874项和两个组合保留但被candidate-02取代；新候选统一875项及两个组合全部重做。


2026-10-26统筹独立29项通过，完整875项与两组合来源/包体/资源核验；两份生产源码精确逆替换后与入场全文相同，本地来源说明规定范围接受。设备实际输入与运行仍未知，unknown/runtime_unverified在设备装好之后也不自动变成已加载版本；手机Manager重打的receipt/选择与签名单独核对。
