# M6a：诊断可解释性与性能机制基线

任务卡v1；2026-10-25下发。前置[M5i复核](../reviews/M5i-REVIEW.md)接受缓存组本轮规定范围及限制。按同职责合并工作量，本卡完成诊断/F5解释、关键机制测量和有证据的必要局部修复，再统一验证交付；不把基线测量另拆一张只清点卡。

## 1. 起点和目标

活动仓库仅 `E:\Projects\DeepSeek morphe-ai-caption-translator`。读AGENTS、当前PROJECT-STATE最新记录、维护README/路线、本卡、网络/状态合同中相关部分、M5i复核。原分支 `codex/fix-cc-authority-1.5.8`、HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`，实际核对；保护既有脏树/未跟踪/删除状态，以入场字节比较。

接受1.5.8 / local-1.5.8-m5i / candidate-01，公开1.5.7；core328+extension533=861。MPP `build/maintenance/M1a/20261025-M5i-candidate-01/patches-1.5.8.mpp`，SHA-256 `8e960b4d4e471df805871c0f67c12eccf07d145ebdd27e26a96d1cc0664f4d99`；独立/内嵌MPE `120143e1711c3884b51f655b163c2c719df9219bc95e0c9237421d8496eda070`；工程指纹 `9439ef3e8c329b860c374bd76fe5e2cc84e1c5814fb7702d2b1b9ffe7d750b12`。

目标是让用户/维护者能理解“为什么失败、现在在等待还是终止、请求计数代表什么”，并建立热路径、队列和退出清理的可检查基线。测量已有行为，发现真实回归才优化；不承诺JVM测试能测出设备帧率/耗电，不为性能名义改产品请求/诊断策略。

生产变化时build ID改为 `local-1.5.8-m6a`；仅测试/合同变化则保持m5i生产身份。version1.5.8/公开1.5.7不变。

## 2. A：F5与诊断解释收尾

真实链路为RebuildApi/Controller → TranslationAudit/TranslationRuntime → CaptionApplication → TokenCostAudit/CaptionDiagnosticsWriter → 当前面板与导出。先核对现有字段/事件能表达什么，复用已验证fixture。

F5已知事实：HTTP_CONFIG是旧记账分类，包含429/503/content_filter等，并不直接表示configuration=true、terminal或用户配置必须修改。逻辑batch、physical attempt准入、服务器实际收到HTTP、response/quality/cache计账各有边界；旧已发调用退休后可收尾，新attempt禁止，不能从某个分类名称推断当前资格或真实费用。

要求：

- 面向用户的诊断摘要/导出解释准确区分原始失败原因、旧计账桶与实际调度决定。至少说明HTTP_CONFIG的含义，避免把429/503/过滤笼统提示成配置错误或永久终止。
- 优先利用现有reason/status、terminal/filter、retryAt/providerRetry和已有事件。如果确有缺字段，可以在最接近实际决定的地方增加少量只读诊断事实；不得让诊断重新决定重试、扩大日志全文或增加每帧记录。字段必须来自真实决定，不由分类名/文案猜测；不掌握的信息明确未知。
- 保留既有FailureCategory枚举/累计字段、记账含义与历史统计，不重算旧账、不改密文/持久格式迁移；可增加有解释的摘要/导出字段。用户界面若确需文字，复用准确既有文本或少量新增键并完整14语言，不新增用户开关或实现细节流程。
- 用真实本地HTTP/Controller/Audit链验证代表性401、429/503有服务等待、content_filter、传输/取消或结构拒绝：相同旧桶可以有不同等待/停止结果；请求数、reason及实际门一致。复用已有HTTP用例做必要断言，不穷举全部路径乘积，不以手工设置terminal模拟完整分类正确性。
- 诊断仍按原credential/scope脱敏，异步导出/快照与清空epoch保护保持。不可读key走现有脱敏规则，不为了可解释性把明文key、完整响应或原字幕默认写入日志。

仅与新增解释合同直接冲突的显示/导出断言允许保存旧→新映射；TokenCostAudit旧计数、敏感值脱敏和所有有效保护不得放宽。F5最终按“已解释/已补事实、原分类兼容、仍未知范围”交统筹，不声称所有服务费用可准确认证。

## 3. B：有限、可复现的性能机制测量

新增 `docs/architecture/DIAGNOSTICS-PERFORMANCE-CONTRACT.md`，一张表记录场景、真实组件/替身、输入规模、线程/操作/队列结果、基线保护和设备未验范围。优先引用已有证据（N74/AnimationDiagnostics/N37SnapshotBinding/CaptionAnimationIdle/ShortsCommentViewport等），只补实质缺口。

至少覆盖下列机制，避免把测试总耗时当产品性能：

1. 播放/动画/preview及诊断enqueue调用线程是否出现新增配置解密、同步文件写入或等待writer。保留调用线程key read=0、同凭据20记录writer解密1的既有机制；明确SPI/shadow计数与真实硬件差别。用户主动保存key的Crypto与每帧/播放热路径分别说明。
2. 诊断突发记录、决策/普通记录合并与队列/批量/字节上限、drop/merge计数、清空epoch及导出。固定有限输入和可控writer屏障，验证有界性和可观察降级；不许虚称有限队列永不丢所有事件，不悄悄提高限额或默认关闭诊断。
3. 相同视口/字号/Shorts宽度不变的重复事件，分页/布局/帧投递次数不无故增长；相应真实变化仍能工作。可用计数/实际UI机制，不能从Robolectric帧时推断OEM流畅度。
4. 一组有界的会话启动/切换/stop/清理循环，检查本测试拥有的Job、监听/回调、Publication、缓存/诊断排队工作能正常收尾，后续新会话仍可用。现有daemon worker可按设计常驻，不以全JVM线程=0作为条件；不动无关全局线程/用户缓存。
5. 记录M5h严格配置读取及M5i源缓存read/commit锁实际由哪些调用线程进入；识别是否有被本轮真实触发的主线程IO/长锁等待，不凭源码存在Files调用就断言播放器阻塞。需要时通过真实调用链+最小观测端口区分线程，不能整个fake组件返回零。

测量输出以操作次数/线程归属/队列深度/清理结果为主；可保留同机固定输入的相对耗时作为本机观察，不能设无来源统一毫秒门槛。真实设备帧率/内存/耗电需要后续同设备同输入观察，本卡只给少量可执行验收场景和具体缺口，不安装、签名或请求付费服务。

## 4. C：只优化已证实的问题

如果A/B发现真实重复IO/解密/请求、无界工作或退出不收尾，在同职责内先保留有效红测/操作基线，再最小修复并同输入比较；必须保留正常事件、诊断可用性和错误处理。已有机制满足要求的保持生产不动，不为拆类/缩行或测试数继续重构。

主要允许范围：CaptionDiagnostics/Writer/Snapshot/Archive、TokenCostAudit、相关诊断UI/导出与最小应用适配；真实证据证明必要时允许Overlay/会话/缓存调用边界的局部机制修复。core原则冻结；仅为准确记录实际决定确需改时，局部只读诊断适配并按diff更新目的来源/派生patch，固定上游/snapshot/协议/提示词/ABI守卫不变。新增帮助类只承载本职责，不引入通用遥测/性能框架、服务、线程或依赖。

F1/F2/F4、正常重试/协商/预算、finishSent/STOPPED/Publication、源模式/翻译失败显示、原生CC/语言、M5h配置/凭据、F3与M5i缓存身份/格式/配额均冻结。不得用降低日志可见性、吞错误或禁用行为制造“更快”。不同产品策略或跨系统设计依赖留证交统筹，不自行扩卡。

## 5. 验证、证据及停止点

首次改动/Gradle前保存入场原件/索引/实际身份及六前端，保护源码、旧交付和封存报告/receipt/XML/compiled ZIP/回退材料。按[M5i复核](../reviews/M5i-REVIEW.md)的证据口径，**无需把可再生成的Gradle class/previous-compilation-data等中间输出反复纳入新历史清单**；正常构建可管理自身输出，不主动删除历史交付/封存证据，不重写旧清单。

A/B/C在同一对话顺序完成，内部检查点不提前交回。生产修复先有效红绿、必要源码/log/XML/receipt；线程/队列用有界latch/受控执行器，不增加Thread.sleep、扩大等待或整测重试。测量及网络只fixture/明确拒绝未知连接，静态端口/provider/proxy/本测试队列可靠恢复。

固定最终源码/测试/必要来源后，已接受verify-full以Offline+RerunTests、1.5.8及真实build ID、新独占RunId完成两组实际验证和MPP/独立MPE/UI及身份负向拒绝；下一Gradle前归档同次compiled/XML/receipt并绑定指纹。生产变化后做指定原始21.41.525-SECONDARY / 官方1.48.0 / Patcher2.0.0 / 104默认根+AI的一组真实组合/资源重编译/既有DEX审计；生产同字节可逐条目证明引用接受M5i组合及其限制。记录包体压缩增量来源，无意依赖/测试/调试泄漏检查。

结果 `docs/maintenance/results/M6a-RESULT.md`，证据 `validation/runs/<date>-M6a-<unique>/`。交付诊断/性能合同、F5事实映射与兼容说明、操作基线及必要前后对照、完整验证/候选/组合、范围外保护、未覆盖和退出哈希逐文件回退；默认只检查，实际dry-run，后续变化拒绝覆盖，状态镜像成对，保留报告/证据/所有包。

更新网络合同F5当前状态、维护入口/路线、必要架构摘要/收尾清单、PROJECT-STATE及同字节镜像，执行完成待复核、统筹待复核；不自行接受F5/M6或进入资料/兼容下一阶段。不commit/tag、推送/PR/发布、签名安装、清用户数据/真实缓存、真实付费API、清共享缓存、reset/clean。全部项目工作在E:，复用原分支/工作树。
