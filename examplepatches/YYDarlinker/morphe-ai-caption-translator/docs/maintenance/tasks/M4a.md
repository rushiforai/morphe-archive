# M4a — 提取字幕字形大小的帧时间过渡状态

任务卡 v1；下发日期 2026-10-24。前置 M1a、M2a、M3a 已由统筹接受。只完成本卡，不继续拆分整个 Overlay 或翻译控制器。

## 1. 目标及基线

将 CaptionOverlayV2.java 中独立的一组字形大小过渡数值状态，提取成不依赖 Android View、Context、Choreographer、系统时钟或线程的普通 Java 组件。Overlay 保留帧回调、调度去重和实际绘制，通过简明委托使用该组件。

维护收益：过渡算法及状态可以不搭建窗口直接验证，Overlay 少管理一组相互关联的数值字段；之后调整尺寸算法时能清楚区分数值决策与 Android 帧调度。本卡不追求删行数量，不引入通用动画框架或多层转发接口。

唯一活动仓库：`E:\Projects\DeepSeek morphe-ai-caption-translator`。复用当前工作树/分支，保留既有修改。读取 AGENTS、PROJECT-STATE 当前身份及最新维护记录、维护入口、M3a REVIEW、路线 M4/产品约束和本卡。

已接受工程基线：M3a 工作树及 707 项测试；产品仍 `1.5.8 / local-1.5.8-m2a`，冻结候选 `build/maintenance/M1a/20261024-M3a-candidate-01/patches-1.5.8.mpp`，SHA-256 `fb04a85d0a1e55b386fce7152a60de4f619c9e2b560671eb08770a01a5b0303a`。实际进入时先核对，不覆盖后来已有工作。

## 2. 范围

生产允许范围：

- `ui/src/main/java/app/yydarlinker/deepseekcaptions/CaptionOverlayV2.java` 中仅与 displayed glyph 过渡直接有关的字段、方法、取值委托及相邻注释。
- 一项小型 package-private 数值状态组件，优先放在现有 presentation 源目录，名称由实际职责决定，例如 CaptionGlyphTransition。现有构建已经编入该目录，不新增模块/依赖。
- `gradle.properties` 仅将 captionBuildId 改为 `local-1.5.8-m4a`，version 仍为 1.5.8，公开版和订阅元数据仍为 1.5.7。

测试允许新增该组件的独立行为测试，以及必要的 Overlay 委托/帧调度验证。保留已有有效测试和断言；测试侧若必须适配 private 实现位置，说明映射，不降低原行为判据。文档只更新当前职责入口、任务状态及结果。

本卡不改 glyphHeightPxForVideo 的尺寸法则、captionScale、视口分类/几何、字号档位、字体度量、分页/预排、触摸、原生绘制遮罩、N74/N75、AI/CC/语言和会话权限、网络、缓存、诊断默认策略或 shared clocks。不重写 public Hook/ABI，不改工具/CI/发布链或依赖。不要全仓库格式化或更名。

## 3. 入场阅读与行为冻结

先检查 Overlay 的 `noteGlyphTarget`、`advanceDisplayedGlyph`、`scheduleGlyphFrame`、GLYPH_FRAME、`resetDisplayedGlyph`、`settleDisplayedGlyphForTests`、glyph 读写处，以及当前 CaptionLayerOverlayTest 的帧时用例和 N74 动画/评论区合同。

当前状态集中在 displayedGlyphPx、glyphFromPx/glyphToPx、glyphStartNanos、glyphPending；glyphFrameScheduled 是 Android 回调去重状态，应保留在 Overlay。当前过渡时长是 **180_000_000 ns**，存在两个不同用途的 **2%** 比较，不能将它们合并简化。

在改动前保存原件与有意义的旧行为序列/结果：初始化、小变化直接跟随、大步进的首帧/中间/终点、同目标附近重复通知、首帧前/中途改目标、reset/settle 后的行为。明确比较的数值、返回的后续帧需求与调度状态，保证旧输出来自冻结旧实现或可信独立期望，而不是改后算法自我生成 expected。

可使用小型冻结测试/证据 fixture 做前后对照，标明来源和哈希，不为对照复制整个旧产品或永久维护两套生产动画算法。测试序列数量按边界需要决定，不为凑大数字穷举。

## 4. 必须保持的语义

- 仍只由传入 frameTimeNanos 推进；组件自己不读系统时间、不投递任务，不新增 timer、线程或 Android 依赖。
- 初次有效目标直接建立显示值；当前无效输入处理按入场行为保持，不顺手收紧/放宽浮点输入规则。
- 小于或等于现行 2% 条件的目标按原规则直接跟随并结束原过渡；较大变化按原先顺序建立 pending。
- 第一帧建立时间起点并保持原值；随后线性插值，180 ms 终点精确到目标，完成后不继续振荡。
- 已在朝相近目标运动时不被重复通知重启；首帧前和运动中重新设目标的语义都与原实现一致。不要顺手“修好”旧实现的其他边缘行为。
- 帧回调的 post 次数/去重、返回值驱动的后续帧安排、reset/settle 对现有已排队 callback 的影响保持原来语义。GLYPH_FRAME 的 Android 调用顺序和 applyCommentScale 行为保留，不能只验证数值而漏掉调度。
- 数值状态有一个拥有者，不同时留一份 Overlay 字段和组件字段需要双向同步；Overlay 的现有测试入口可以薄委托保留签名。
- 热路径只更新数值和必要帧标记，不每帧 new 状态对象、不测量字体、不排版、不访问配置/磁盘/KeyStore。不要借提取增加新的观察器或监听器。

API 形状由执行者简明设计，例如目标更新/帧推进返回“是否需要帧”、提供当前值与 reset/settle；不要求采用某种设计模式。保持等价结果优先。

## 5. 验证

1. 保存入场清单、准备修改原件、受保护生产/测试/工具/身份和历史候选哈希；实际使用的忽略本地前端/初始化脚本也显式记录，不把退出哈希冒称入场。
2. 完成旧行为冻结后提取。直接测试新数值组件，并由 Overlay 入口测试确认真实委托和帧调度仍生效。覆盖升/降、阈值附近、重复目标、重定向、零/异常时间输入按现有处理、reset/settle/无 pending 等实际边界；用传入时间控制，不以 sleep 验动画。
3. 运行当前已有帧时、CaptionLayerOverlay、ShortsCommentViewport、CaptionAnimationIdle、AnimationDiagnostics 等相关合同，确认分页次数、测量/日志开销和当前视口行为没有被改变。只添加有价值的新断言，不为过关更新黄金值。
4. 源码固定后通过已接受完整入口运行两组测试、来源/compiled/UI/包边界与新候选；报告实际计数和有效复用。公开元数据不生成、不手改；独占候选不覆盖旧包。验证工具目前输出目录含 M1a，按实际路径记录本轮为 M4a，不为名字改工具。
5. 对当前 source/DEX/包做有边界的对照：允许新数值类、Overlay 委托和 build ID 引起的扩展变化；其余源文件、补丁 Kotlin/资源应原字节保留。DEX 索引重排可能影响二进制表达，用符号结构/源码保护解释，不要求所有旧类的 DEX 片段逐字节不变。确认无测试类泄漏、旧回环类不回流、公开入口/遮罩钩子仍在。
6. 这是首批生产提取：用 M2a 已确认的同一组原始 APK/官方 MPP/Patcher/选择集完成新候选真实组合及现有 DEX 审计，明确输入哈希和结果，不自行扩大版本矩阵、不安装。输入如已不可用则如实交付部分完成，不能以纯数值测试冒称完成组合。

没有目标要改用户视觉效果，也不据单元测试耗时宣称设备更流畅。若等价测试发现差异，先判断是不是提取错误并在本卡修复；属于旧行为缺陷或需要改变体验的设计，记录并交统筹另卡，不自行修产品算法。

## 6. 交付和接受

结果写 `docs/maintenance/results/M4a-RESULT.md`，证据在独占 `validation/runs/<date>-M4a-<run-id>/`。包含提取前后职责和维护收益、原实现行为来源、事件序列对照、调度/视图合同、实际测试计数、新 build ID/候选哈希、受保护范围、真实组合和未覆盖项、逐文件安全回退办法。

更新维护入口、状态及字节相同镜像：完成待复核或准确部分状态，统筹待复核。不能改旧任务卡/执行结果/REVIEW 或自动进入其他 Overlay/Controller 提取。不创建 commit/tag，不推送、开 PR、发布、签名安装、清数据或调用真实模型。

统筹接受条件：数值职责真正独立且 Overlay 生产路径使用；旧语义与 Android 调度均有等价证据；相关及完整验证有效；差异限于允许范围；至少一组真实组合/DEX 审计通过；保护和回退证据完整。只有文件挪动、只测新组件而绕过真实 Overlay，或用新算法生成同一份期望，都不足以验收。
