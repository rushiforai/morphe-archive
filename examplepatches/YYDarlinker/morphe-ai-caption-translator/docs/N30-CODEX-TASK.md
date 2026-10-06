# N30 Codex执行卡：性能回退修复、AI设置多语种菜单与最终本地化闭环

> **2026-10-03恢复定案**：已核实N30-SCOPE-BLOCKER的真实调用链，允许本卡内调整播放器入口的render/几何查找分发时机；以新增C0/C3和第7节为准。保留未提交草稿继续，不另开N30r。R1/CAS、显示权限、紧凑隔离、几何安全与用户字幕位置仍冻结。

日期：2026-10-02（Asia/Shanghai）。本卡由Codex完整执行、验证、独立建包、本地提交，完成即停。N29已工程交付并经过一次手机复查；本卡结束前不开始下一张卡，不交DeepSeek，不自动发布。

本卡把三个确定性UI问题、N29真机暴露的等待/转场副作用、第四期语言菜单和三项长期本地化问题合并处理，避免继续拆出小卡。产品源码基线为N29核心提交 `3eefe00ee1491ea4c6bb4e076dbc511fc120fe65` / `anchor/n29-3eefe00`；docs-only后继允许保留。实际仓库是 `E:\Projects\morphe-caption-v2`，C盘worktree不得施工。

## 1. 开工核对与输入

1. 开工先比对仓库 `docs/PROJECT-STATE.md` 和外部状态副本；无差异跳过覆盖，有差异先读内容。HEAD到N29源码锚点只有docs差异时允许开工并记录真实HEAD；不要因为本卡文档或已知外部官方MPP未跟踪而机械停工。真正产品源码差异、并行执行者或未知二进制才停止核对。
2. 读取本卡、`docs/N29-DEVICE-FEEDBACK-REVIEW.md`、`docs/N29-LOCAL-TEST-BUILD.md`、R1/N29状态和既有N28根因记录。用户诊断 `caption-diagnostics-1.3.5-20261002-222525.txt` 及两张截图只读使用，不改外部文件。
3. 官方输入固定为 `patches-1.45.0.mpp`，SHA256 `DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93`；宿主仍为真实已验证的YouTube 21.16.256、minSdk28。不要下载或加入其他APK，不把官方1.45.0改成产品版本号。
4. 不签名、安装、清数据、卸载、推送或发布。远程翻译API、新依赖和下载均为0。R1/N29历史交付、失败包、用户安装APK、官方MPP不覆盖、不默认git add。

## 2. A：修复播放器菜单和AI设置页的确定性文案问题

### A1 播放器弹出菜单

源码当前 `CaptionQuickToggle.java` 把 `" 路 "`硬编码在AI标题和开关状态之间。删除该硬编码。使用资源化完整菜单标签，至少提供 `cap_ai_quick_toggle_on`、`cap_ai_quick_toggle_off` 两类14语种文案，或一个经过资源格式校验的带状态参数文案；Java不得拼接中文、英文状态词或固定分隔字。

目标效果是“AI字幕翻译 + 当前状态”，风格与同一原生弹出菜单一致；不出现“路”、孤立标点、重复状态或语言混杂。AI开关点击语义、普通视频/Shorts入口、隐藏时下次打开生效规则保持。测试14种资源、中文开/关、英文开/关、RTL开/关和字符串缺失fallback；缺少资源不得显示原始key。

### A2 AI字幕翻译设置页 summary

`DeepSeekCaptionResourcePatch.buildPreferenceScreen()` 当前把AI页面summary绑定到 `cap_autosave`，导致中文“修改后自动保存”。新增独立资源键 `cap_ai_summary`，内容介绍AI字幕翻译功能，例如“使用你配置的AI服务实时翻译视频字幕”，具体文案由14语种资源统一维护；不得把“修改后自动保存”或API地址保存说明继续作为AI页面summary。

保持入口位置“旁白翻译之后”、无图标、原生PreferenceScreen风格。summary应简短、自然、可在窄屏显示；各语言至少做运行时资源解析和320dp/大字体无省略号检查。只有实际自动保存的输入项继续使用 `cap_autosave`。

## 3. B：重新收敛翻译等待和连接失败风险

N29在固定回放中把邻块边界等待降为0，但真机出现3次SocketException，成功请求RTT最高约10.16秒，焦点请求也出现9.52/6.12秒。N29的远程bootstrap属于高风险收益优化，本卡优先稳定性和失败收敛。

### B1 启动策略

- 首个焦点请求尚未`sent=true`或尚未成功接纳前，邻块只允许内存/磁盘cache读取，**禁止远程翻译请求**。保留cache读取在SOURCE_IO锁外执行、按Session/generation/source/key/job校验，命中则可提前显示对应内容。
- 首个焦点计划完成结构接纳后，恢复N29之前已有的prefetch2/总4、30秒lookahead、seek storm暂停5秒、focus2、attempt/repair预算。此后预取可以继续并发，但不得超过既有上限。
- 不引入无界队列、额外线程、无限重试、请求合并、延长字幕持有或隐藏“翻译中”。用户看到真实等待或安全空白应由诊断说明原因。
- 在N29逻辑上补充 `bootstrap_remote_suppressed`、`bootstrap_cache_hit/miss`、`focus_accepted_at`、`first_prefetch_sent_at` 字段。请求/缓存身份、中文旧namespace、非中文presentation-v3身份不变。

### B2 连接失败收敛

- 对`SocketException`、连接建立失败、读取中断分别记录英文reason、request/block/session、elapsed、remaining deadline、attempt；不得将所有连接错误归成“翻译内容错误”。
- 保持当前有限attempt和repair上限；一次连接错误不能触发超出预算的语义repair。失败块按既有安全空白或下一次合法重试收敛，不能永久处于pending，也不能让旧Session重新获得显示权。
- 不因本卡修改provider URL、模型、API key、HTTP协议或用户配置。连接错误与真正的2xx结构/语义拒绝必须在诊断中可区分。

### B3 源断点必须在请求前拆块

本次实际视频的 `b7_354_387` 在 `source_breaks_before=[381]`，token 380→381 之间有约722ms断点。模型三次返回的事件都含 `380–387`，被 `crosses_source_break` 拒绝；整块失败使112140–127282ms进入fallback，造成用户在1:57附近看不到翻译。该问题必须在规划阶段解决，不得放宽 `RebuildProtocol` 的硬断点安全网。

- `RebuildPlanner` 在生成翻译Block前，必须按硬源断点和显式speaker marker切分；任何Block不得跨越硬断点。Block边界可以落在断点前的最后一个owned token与断点后的第一个owned token之间，保留原source-owned时间、完整token覆盖、context和顺序。
- 不要依赖模型自己理解 `source_breaks_before`，也不要在验证失败后反复发送同一个跨断点Block。对实际 `b7_354_387`，规划结果必须拆为不跨381的两个或多个Block；每个Block单独请求、单独缓存、单独安全收敛。该样本只是回归夹具，不得把`b7_354_387`、视频ID、token 381、112140/127282ms、英文原句或任何具体字幕文本写入生产条件、分支、词表、prompt特例或运行时配置。
- 断点两侧短片段仍可翻译；不得把断点当作删除文本、合并时间或跨断点借时的理由。断点间的空白保持为空白，事件起止仍使用真实owned cue时间。规则必须适用于所有视频、语言、字幕来源和任意断点位置。
- 硬断点与普通标点/分页边界区分：`crosses_source_break`、speaker marker仍硬拒绝；N29非中文presentation-v3的句/词分页只作用于已合法的单个翻译Block内部。

实现后必须对生产源码和生成DEX做特异性审计：禁止出现本视频ID、`b7_354_387`、具体token 381、112140/127282ms、原句文本或同类样例条件。历史测试/fixture可以保留这些值，但生产类、资源、prompt、缓存key和运行时配置不能引用它们。除本视频夹具外，再使用至少三种不同长度、不同断点位置、不同语言/源字幕来源的合成和真实事件验证同一通用规则。

实际回归固定使用本次视频的 `b7_354_387`、`source_breaks_before=[381]` 和 manual/auto字幕输入：

1. 修前证据保留三次拒绝和112140–127282ms fallback；修后不再产生跨381事件或同一Block的重复repair。
2. 1:52–2:07每个有源字幕的合法片段都能按各自Block进入翻译/安全空白路径，1:57附近不再因整块失败而整段缺失。
3. 断点两侧请求/缓存身份各自稳定，切视频/seek/stop不会让前一块结果写入后一块；中文18组golden和既有硬断点测试继续通过。

### B4 验证

用N29真实device-events和一个固定慢/失败连接的受控fake clock重放：证明首焦点未接纳时没有远程bootstrap；cache命中API=0；焦点成功后相邻prefetch按规则启动；同一block只请求一次；SocketException有界收敛；暂停、seek storm、切视频和stop不会派生旧请求。与N29 before/after对比请求数、连接失败数、首句可见时间、边界等待和总token，不能只用“边界0ms”单指标翻绿。

## 4. C：降低详情页/悬浮窗/全屏/旋转切换卡顿

诊断中有41次`NATIVE_RENDERER_VIEW_NOT_FOUND`、498条树摘要、3次稳定事件对应多种玩家转场；源码在40ms循环和转场回调中进行有界树扫描，并对普通非紧凑播放器类型也启动帧探测。目标是让扩展在转场关键路径只做常数级状态更新。

### C0 已定位的入口冲突与明确允许范围（2026-10-03）

范围阻断复现成立：`DeepSeekCaptionHook.onPlayerType → Dynamic/Page/ContextualController → RebuildController.player → CaptionOverlay.setPlayerType → render → CaptionSurface.refresh`在guard之前同步查找。原卡只放开guard/suppressor，无法兑现完整宿主回调目标，这是规划范围遗漏。本节明确允许修改该链的**UI分发时机**，不是解冻显示规则或调度架构。

- 允许最小修改`CaptionOverlayV2.setPlayerType`、`restoreAfterGuardedExpansion`及必要render请求/失效管理；允许`DeepSeekCaptionHook`和**实际注入目标`DeepSeekCaptionHookV2.onPlayerType`**的轻量通知/重扫分发，以及`RebuildController.player`必要的渲染通知接缝。不要把整个player/model更新延迟：compact标志、显示抑制、隔离和待恢复责任须及时更新，进入compact/hidden时旧字幕立即隐藏。
- 几何发现/render留在UI线程，但延后至宿主回调已返回、布局可用的既有layout/pre-draw/主线程调度接缝。同一转场只保留一个可合并的待处理任务，读取最新type/文本/RenderGuard，不能每次重复type通知都排完整重扫。不得修改全局`main(Runnable)`以使所有生命周期调用都无条件延后。
- 已有WATCH、时间tick、restore路径也要遵从新调度的去重/隔离；不会因二次setPlayerType重复render、旧队列排空又重扫，或普通相同type回调把当前布局恢复等待反复重启。验证非UI线程调用时仍正确转入UI线程处理。
- 必要时允许`CaptionSurface`最小的现有几何缓存复用/失效标记，减少同一布局反复findView/遍历；保留原player选择、相对坐标、shorts区别、视频矩形验证和边界规则，不另造搜索器/猜坐标/新增宿主资源匹配范围。
- V2在内层返回后还调用`forceNativeRendererScan()`，它目前可直接`maskNativeRenderer()`。须让转场重扫成为标记或有界合并的待处理工作，不能留第二个同步扫描出口。draw防线和已知View保护照旧，不能隐藏日志/禁掉全部扫描以制造扫描次数0。
- 使用既有Activity/转场generation/显示guard校验延后任务；切视频、切目标、stop/clear、Activity销毁、再次compact均使旧任务失效。旧任务不能重新attach、显示旧文本/旧位置、恢复旧native View，也不能误取消或隐藏新Session的字幕。没有合法几何保留安全空白和既有恢复责任；后续有效布局恢复一次，不能通过任意延时猜已经稳定。
- 光把原完整树遍历放进一次`Handler.post`不是性能完成证据。仍需验证延后工作量、重复扫描次数和布局/下一帧响应；保留低频有界恢复，不把工作量全部压到下一帧，也不新增每帧全树轮询、线程或后台架构。

该调整适用于所有视频/语言/播放器转场，禁止视频ID、片段时间或样本文本条件。`scope-probe`的同步refresh=1是before证明，30,604,700ns只含本机测试开销，不推断手机帧耗时。

### C1 转场职责

1. `CaptionPlayerTransitionGuard.onPlayerType`区分“真实紧凑播放器展开/收起”和普通全屏/横竖屏/详情页播放器类型变化。只有前者保留必要的延迟恢复观察；普通变化不得启动完整6帧以上的稳定探测，不得因字幕插件额外等待YouTube详情页导航。
2. 普通变化流程只更新播放器类型、切换已有overlay基准、保留当前AI轨逻辑，然后立即释放transition guard；不能同步等待网络、磁盘、disconnect、缓存或树扫描。
3. 真实紧凑展开仍需安全保护时，使用最短可证实的观察窗口，并设置明确上限；在受控测试中记录帧数、耗时和overlay恢复时刻。不能用42帧上限掩盖迟延，也不能在没有稳定几何时贸然把字幕画到错误位置。

### C2 原生字幕扫描

1. 已经有`SubtitleWindowView.draw(Canvas)`防线。转场期间只保持已发现View的alpha/guard，不主动进行新的大范围View树扫描；扫描不是每次转场的主路径。
2. 将`CaptionMusicSuppressor`的树扫描限定为低频备用恢复或明确强制重扫。40ms tick只保持已知View状态，不得每次tick遍历1200个View。`treeSummary`不得在主线程反复导出16KB整树；普通未找到只发一次精简英文reason，详细树只在显式debug采样时输出。
3. View重建/Activity变化时仍能重新发现字幕窗；已发现窗脱离后允许一次player-local scan，失败后退避，不持续刷屏。原生draw防线缺失时审计必须失败，不能靠扫描器“碰巧找到”掩盖。
4. 保留N27搁置；不要恢复控件避让、不要改字幕位置、不要扫描Activity无关窗口。

### C3 性能和正确性验证

新增受控主线程测试/diagnostic probe：

- 调用真实生产外层`DeepSeekCaptionHookV2.onPlayerType`及内层`DeepSeekCaptionHook.onPlayerType`，覆盖实际注入的enum入口；最终DEX检查调用目标与测试入口一致。两条完整callback栈内不得同步调用网络、磁盘、disconnect、`treeSummary`、几何discover/refresh或完整`scanTree`。记录callback返回前扫描计数与返回后的独立几何次数，不能只测guard、mock掉render，或把内层无扫描等同外层无扫描。
- 保留当前scope-probe before=1原JSON/日志；after要求callback返回前几何/扫描0，并验证回调返回后合法布局真的render、draw仍被阻断、原文本/位置/分页未变。一次转场只触发合并后的几何工作，快速全屏↔详情↔compact多通知无任务堆积；旧任务遇stop/换视频/Activity销毁必须无attach/render/clear副作用。非UI线程路径和实际下一条UI消息也覆盖。
- 性能分别报告UI状态更新、延后render和扫描耗时/帧次数；Robolectric壁钟只作本机观察，不冒充手机延迟或“解决真机卡顿”。用受控次数/阻塞屏障证明减少关键路径工作，再由一次有限手机复验确认观感。
- 普通全屏/旋转/详情页返回各至少10轮；紧凑播放器展开/收起至少10轮；目标是扩展额外主线程工作恒定且不超过一帧预算，真实稳定恢复仍不晚于安全窗口。若设备帧率不同，以Choreographer帧时间记录，不写死设备毫秒假设。
- 证明在AI开启、等待、safe blank、AI关闭、原生字幕和View重建下，draw防线与overlay生命周期不漏遮、不恢复旧字幕；证明切换后下一条主线程消息不依赖网络/磁盘/扫描完成。
- 诊断统计`NATIVE_RENDERER_VIEW_NOT_FOUND`、`tree_summary_count`、扫描耗时和transition guard耗时；目标是正常转场不产生重复树摘要，且未找到事件按退避增长，不再每个tick刷一条。

## 5. D：AI设置页内的十四语种多选入口

该入口放在“AI字幕翻译”的设置子屏内部，不放回视频页顶层、不放播放器菜单。保持Morphe原生Preference风格、同样的标题/summary/间距/无自定义图标；优先使用宿主/现有扩展的标准多选Preference或同风格选择Dialog，不手写与设置页不同的卡片UI。

### D1 入口与存储

- 新增“自动翻译语言”子项，放在AI页“启用AI字幕翻译”之后、API配置之前或与语言相关项相邻；由真实Preference排序确认，不靠XML文件顺序。
- 默认选择为空集合；AI关闭时仍可编辑和保留集合。已有用户的`zh-Hans`来源、Remember配置和API profile不得被改写。
- 存储规范化code集合，不存显示文本；支持code别名归一。每次保存排序并去重，保持用户选择集合的稳定顺序。
- 目标集合限定项目14种语言，并记录“已存在于YouTube菜单/新增/不支持”状态；不把UI语言或任意YouTube全集误当成目标集合。

### D2 原生菜单注入

- 复用N29 `NativeCaptionBridge.augmentTranslations`的元数据、URL和排序接缝，把选中集合逐项加入YouTube自动翻译菜单。
- 语言已存在时不重复；同一语言的地区/脚本别名按规范化code合并；菜单原生条目保留原对象/顺序，新增项按当前YouTube真实语言标签和Collator位置插入。
- 单次菜单打开只能产生一次每种新增语言；重复打开、切换应用语言、AI开关关闭/开启、切换视频均不能重复克隆或改变用户集合。
- 目标选择仍由原生菜单决定；AI关闭时新增语言能力仍存在，但不得发AI请求。第二个“Add Simplified Chinese”根补丁并入AI根，Remember独立，兼容七种组合并保证native-only API=0。
- 不硬编码中文排位、不按字符串字典序替代YouTube实际排序；保存运行时菜单中代码、显示名、去重和插入位置的证据。

### D3 多语种资源

新增入口标题、summary、已选数量、保存/取消、已存在/新增/不可用状态、空选择说明等全部资源。覆盖14语言，320dp、1.3字体、RTL和长语言名无截断/重叠。不要把程序性字段本地化；用户自定义prompt与API profile名称保持原样。

## 6. E：长期本地化闭环

本卡必须关闭三项拖延问题，不能只增加静态key数量：

1. AI入口summary使用功能介绍；播放器菜单状态标签也纳入14语言运行时检查。
2. 全面审计运行时应用语言：AI默认要求、字号档名/说明、预览sample、`样式预览（全屏）`、对话/按钮/Toast、诊断保存项、模型/审计行、新多选入口。中文、英文、法文至少做截图/运行时；其他11种做key解析、fallback检测、布局边界和RTL检查。220×14静态检查只能作为必要条件，不作为完成证明。
3. 技术性诊断标题、事件、字段、reason统一英文；用户可见的按钮、说明和设置壳随应用语言。源文、译文、API原始response、用户prompt和provider内容保持原始数据，不翻译/改写证据。检测任何技术字段出现中文、应用语言资源key裸露或fallback到中文即失败。

## 7. 冻结边界与不处理项

冻结R1/N29锁顺序、Publication/CAS、Cache同key提交排序、main non-blocking、后台barrier、中文legacy_n26/n28b策略、N29非中文presentation-v3的1200ms/两行/字素合同、18组中文golden、字号/颜色/透明度/拖动位置、N27控件避让、VISIONOS问题。

允许修改：CaptionQuickToggle文案、资源patch/catalog、AI Preference screen、多选设置/存储/菜单注入、bootstrap调度资格/失败诊断、通用Planner请求前硬断点分块、CaptionPlayerTransitionGuard与CaptionMusicSuppressor的转场扫描开销，以及C0明确的DeepSeekCaptionHook/HookV2通知、RebuildController.player渲染通知、CaptionOverlayV2分发/失效和必要CaptionSurface几何缓存接缝。**这一分发范围已获规划定案，保持其合同即继续N30，不因触及上述文件再次停工。**不得改R1/CAS/显示权限、player识别/坐标规则、compact隔离、用户字幕位置或安全网，不清cache、不加重试/付费/prompt特例。

若旧测试断言直接要求N29 bootstrap在焦点接纳前发远程请求，允许保存before证据并定点改为本卡稳定性合同；中文golden、ACCEPTANCE/frozen和原有生命周期权限断言不可改。任何要改冻结业务层或新增后台架构必须停止并带证据回规划者。

### 7.1 继续当前未提交施工（2026-10-03）

当前HEAD仍是N29，不包含N30工作区草稿；保留全部已知产品/测试/资源及管理差异，不reset/清工作区、不当作未知并行施工。范围阻断报告作为历史证据保留，本卡C0是恢复依据。先核对草稿与受控before，修正入口分发并复验真实V2/inner链，再继续既有N30各模块。

最近23项专项为19通过/4失败，随后fixture修正未复跑。恢复后逐项检查失败是否fixture或真实实现缺陷，并重新运行同一cohort；不能把“已改fixture”当通过，不能删失败/改业务输入掩盖。最后仍完成全量、main/K12、400轮、硬断点/14菜单及运行时本地化、最终真实组合/DEX与独立三件套，不另发残缺草稿。

外部手动/自动字幕四文件在`D:\下载\.deno\bin\manual_en`、`D:\下载\.deno\bin\auto_en`，同名`The Truth About the Bezelless Concept Phone [ngPkbaZliaU].en.vtt`及`.en.json3`；使用LiteralPath/直接Path，含方括号不得用通配匹配。输入已授权只读，若首查未定位需按明确目录核对，不能默默省略双来源完整回放。

## 8. 最终验证与交付

- Java全量、专项、本卡多选/文案/启动/转场测试全部通过，failure/error/skipped=0；原N29 400轮受控并发与N28 main/K12继续通过。性能测试同时证明不依赖网络/磁盘的主线程返回。
- Python27/27、本地化220×14并新增运行时覆盖；冻结4通过/4既有失败/4未验证、三个invisible_ms=0、ACCEPTANCE/frozen零diff。该冻结分数不等于语义全通过。
- 官方1.45.0完整组合、七种非空根选择、API0 native-only、内嵌MPE等值、最终全部DEX/branch/API/resource/aapt/CRC/verify_bundle/N8Verify通过。未知/残缺hook、重复语言、错误存储code和缺资源变异必须被测试拒绝。
- 建立N30前后请求/连接/RTT/SocketException、首句显示、bootstrap请求数、转场callback/帧/扫描耗时和菜单打开耗时对照。没有证据的“更快”不写进报告。
- 独立交付：`build/local-test/patches-1.3.5-本地测试包-n30.mpp`、`build/local-test/extension-1.3.5-本地测试包-n30.mpe`、`build/n30-composition-final/YouTube-21.16.256-本地测试包-n30-unsigned.apk`；历史N29/R1/C/B产物和用户APK不覆盖。内嵌MPE与独立MPE逐字节一致。
- 交付 `docs/N30-LOCAL-TEST-BUILD.md`：四个问题根因、bootstrap选择、转场性能证据、多选菜单code/去重/排序、14语言运行时检查、完整SHA/字节、真实PASS分母和未覆盖语义边界。提交一个核心commit和 `anchor/n30-<真实短哈希>`，docs-only身份可后继补记；同步两份PROJECT-STATE。
- 该卡完成后停止，只要求用户做一次短复验：中文开关/菜单标签、AI设置summary和多选入口、一次稳定播放、一次详情页↔悬浮窗/全屏切换、日语/另一非中文切口。用户提供完整诊断即可，不要求14语种母语阅读，不主动发布。
