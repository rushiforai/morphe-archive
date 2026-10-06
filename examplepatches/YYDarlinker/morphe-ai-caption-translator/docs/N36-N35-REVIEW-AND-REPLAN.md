# N36 规划审阅：N35 的五项反馈、原设计目的与机制修复

日期：2026-10-04（Asia/Shanghai）。角色：规划／审阅，未实施 N36 产品代码。

## 0. 身份、输入与证据边界

- 唯一仓库：E:\Projects\morphe-caption-v2。产品实现 1967dacff904173ef685602e831cc21291fffb94；N35 完成 HEAD 013cc93b266b339ad05dea11b1bd29177cbcbffe；anchor/n35-013cc93 指向完成 HEAD，产品树与实现提交相同。
- 本轮已建 backup/pre-n36-n35-013cc93。N35 与 N34 的源码、产物保留，不自动回退或将 N35 缺陷宣称为修复。
- 手机诊断：D:\HONOR Share\Honor Share\caption-diagnostics-1.3.5-20261004-215344.txt，2,209,813 B；manifest build=n35 / official=1.45.0，extended history 7,640 条。文件前部有重复摘要，分析按 extended history，不能加算成更多运行事件。
- 录像：D:\HONOR Share\Honor Share\SVID_20261004_220011_1.mp4，14.270625 秒，1264×2736。已逐帧读取并保存 29 张半秒关键帧与 contact sheet。录像只有预览附近来回滚动，没有键盘、字幕消失现场或悬浮窗转场，不能声称这些场景已经录像复现。
- ADB 查询无设备。未写手机、安装、启动 App、清数据、签名、调用远程翻译、下载工具。用已有本地 Chromium 解码录像，用已存在 JDK21/Robolectric 做最小机制探针；没有跑全量或创建 N36 产品包。
- 本轮五项探针全部复现当前缺陷：probe-run-01 4/4，probe-run-02 1/1。它们是 before 证据，不是修复后验收，也不替代真实 IME/WMS。
- 证据目录：.verification/n36-planner。核心文件：215344-evidence-review.json、215344-network-failure-correlation.json、215344-source-queue.json、n35-verification-timeline.json、probe-run-01/result.json、probe-run-02/result.json、video-contact-sheet.jpg。

## 1. 开发／验证为什么花了四小时，可精简什么

### 原目的及是否保留

全量测试保护中文时间、所有权、安全空白、缓存／CAS、既有设置；最终 DEX／类型／分支审计防止 N27/N31 的真实启动失败。必须保留这些安全目标。提前生成 MPP 只能证明一个候选可以打包，不能证明交付已经通过。

### 实际时序与原因

- N35 开始前规划提交 17:41:36；产品提交 21:48:41；完成文档 HEAD 21:54:26。
- candidate-02 构建记录 21:10:28，第三次组合结束 21:18:08。不能据 MPP 首次出现的时间断言其后一个小时全是检验。
- 有 24 个记录了结果的测试调用，累计实际测试运行约 1,985.405 秒（33 分 5 秒）。首轮全量 6分24秒失败10项；两次成功全量为5分56秒和5分15秒。其余大部分时间是实现、失败定位和修改，而非全量检查本身。
- 两次成功全量的 212 个 production/test 文件及 input_sha 完全相同：2e0828612962d5e5024fa3f496533fb69488c35c176bc15262c6a24e3ce4fbb8。第二次完整复跑是确定可减省的一项。其他失败后的复跑不能全部算冗余。
- 有三次候选组合，不能在没有输入身份比较时一概认定都重复。下卡改为按源码／资源／patcher输入身份复用已通过证据；同输入不得无故全量重跑或重新装配。
- 更重要的缺口是检验种类：N35 验证了 softInputMode 与 InputConnection 标志，未验证四个实际设置字段能在 IME composition/commit 后继续输入；preview warm draw 测试也漏了普通 Preference.getView 重绑定。

### 替代流程

先小专项和真实输入／滚动／转场交互；稳定源码后一次全量；同冻结字节只建一次正式三包并做正式组合／DEX。失败后只复跑关联专项，修复触及全量通过的源文件时再跑一次全量。文档修订不触发产品构建。同一次构建不要为了 docs-only 哈希多建包。三类根组合仍验证，但无需把每种选择都重复打成完整 198MB APK。已有测试／证据保持；冻结计分仍4/4/4。

不能承诺四小时压为几十分钟：实现难度仍在。可以避免已证明的重复，并把时间投向真正能发现用户问题的交互。

## 2. 预览上缘滚动停顿／跳位

### 原目的及是否保留

预览要保持16:9、全屏字高缩放一次、十四语种示例、主题和滑块联动。IME viewport 原本用于防止输入框或光标被键盘盖住。两个目标都保留；不保留会主动拉回列表的实现。

### 代码机制与已证实根因

1. CaptionEditorViewport.focus(true) 无 IME 可见性判断，直接 reveal；onSelectionChanged 也直接 reveal。onGlobalLayout 和每帧 onPreDraw 只检验 editor.hasFocus，未要求用户正在输入／IME 已显示。
2. reveal 同时调用 bringPointIntoView、requestRectangleOnScreen(immediate=true) 与 scrollListBy；焦点仍在上一个输入框时，普通手势滚动可以被重新拉向光标。无键盘探针已观察 parent rectangle 请求，表明这是代码真实行为。
3. N35 把窗口 lease 延长至 root detach，解决了原先行回收切换调整模式的一条路径，但没有去掉上述自动追焦与双重滚动。不能继续只修 softInputMode。
4. SubtitleStylePreview.refreshDynamicText 每次调用都 invalidateCache。CaptionSettingPreference.getView 每次无条件 refreshCaptionText，于是同 locale/style/width 的普通重绑定也丢掉 warm label。探针证明第二次同 key 重绑定后 sampleLayoutCalls 再增加；纯连续 draw 的缓存通过不能覆盖此处。
5. onDraw 仍重复读取样式／locale、分配背景 Path/Shader；这属于可避免的绘制成本，不能只优化 TextView 创建后就宣称滚动问题关闭。

录像确实反复显示边界附近停顿／跳位，但不能把录屏压缩帧当手机系统帧时长。上述机制探针是独立的因果证据；必须在 after 中再走真实拖动／fling，而不是只截图。

### 方案

使用真实设置窗口的原生 IME 布局作为主路径；viewport 只在确有焦点、IME可见且实际遮挡时一次性补偿。在用户拖动／fling时不强制 reveal，不做每帧 padding＋scroll 双补偿。普通行回收只注销该 editor 的任务，窗口 detach 才清窗口管理。

preview 按完整测量 key（locale、sample、tier、opacity、width、density、fontScale/theme）增量失效；普通 getView 重绑定、裁剪、滚动位置变化不失效。稳定 key 跨回收／重绑定保留测量；不把locale配置上下文用于挂窗。不扩大字号／改变16:9去掩盖卡顿。

## 3. 操作后 AI 不显示，以及压力等待更长

### 原目的及是否保留

原保护用于在真正的 miniplayer/PiP/关闭状态隐藏字幕，防止旧 Activity、视频、Session 或过时渲染复活；请求限流／重试上限限制费用。必须保留。

### 确定的逻辑缺陷

A. DeepSeekCaptionHook.deferPlayerNotification 把真实 player type 回调绑定到 CaptionOverlay.playerDispatchIdentity。该编号在 caption clear、隐藏、样式／布局任务作废等操作中改变，远大于播放器 owner 的生命周期。后台有效 WATCH_WHILE_MAXIMIZED 回调排队后，字幕清理改变编号；主线程在第57行将回调直接丢掉。独立探针已复现：MINIMIZED →后台MAXIMIZED→clear→主线程执行，最终仍MINIMIZED且suppressed=true。此路径可在同一Activity发生，不必猜Activity一定重建。

B. CaptionOverlay.setActivity 改 owner时重置 playerType，但不清理 suppressed/guardedExpansion 的旧owner状态。新Activity可继承旧隔离而没有相应恢复事件。探针已复现新owner/playerType为空，而两个旧标志仍true。

C. CaptionPlayerTransitionGuard.Probe.run 在 Activity/decor 消失时提前 return，却未释放 pendingProbe。后续 same type 回调看到 pendingProbe非空直接return，失去恢复机会。setActivity也没有完整重置旧owner compact/expansion状态。探针已复现空owner退出后恢复槽仍被占用。

D. 达12帧未稳定后只依赖 decor 的 layout change 重试；播放器子树迟到 attach／尺寸变化而decor不变时没有恢复通知。这是代码可见的缺口，需 after 夹具覆盖，不能盲目超过上限时强制显示。

### 诊断支持及不能证明的事

- 635 条 display result中，65条player_suppressed、18条owner_invalid、73条pending_translation、156条outside_owned_window、85条source_gap。后四种有不少是正常窗口到期／源间隙／未就绪，不得把它们全算漏字幕。
- 现有 suppressed 记录不含实际playerType、Activity/视频owner、guard token或真实几何，末尾也可能是用户正常进入小窗／关闭视频。**不能凭此确定用户那次长时间无字幕的唯一时刻与唯一状态**。但A/B/C是真实、可稳定复现、能使开关也无法解除隔离的通用机制，应该修复。
- 请求106、2xx89、失败17；106条wait中slot_wait中位24ms/p90 53ms/max132ms；25个source queue样本中位14ms/p90 38ms/max105ms。因此本次没有证据支持“主要是工作线程排队积压”。network中位4491ms/p90 7335ms/max16000ms；6个有当前Session拒绝记录的请求在10/16秒deadline附近失败。NetworkDeadline到期直接disconnect，但没有保存timer确实触发的标志；RebuildApi将由此形成的SocketException按普通network错误包装，因此导出timeout=0不能证明没有总deadline到期。另一些错误紧邻会话切换，且没有有效Session拒绝记录，可能由主动disconnect触发，但缺少取消原因，不能把17个全说成服务故障，也不能全说成取消。
- 翻译不是流式逐词显示。新目标/新块无匹配缓存时，完整response通过结构和所有权检查后才能显示；这几秒是远程模型返回阶段，不能靠本地动画或增加线程保证消失。已有有效缓存应直接读取，不能因显示恢复而重新翻译。

### 方案

建立独立的 player-authority owner epoch＋通知序号（与caption render revision分离）；同owner只合并最新player type，outer恢复责任不能被inner覆盖。字幕clear不让真实player状态失效；真实Activity/video变化才拒绝旧通知。

转场恢复采用同一owner的可撤销状态机：owner变化撤销旧probe/监听并释放槽位；不直接授予普通播放器显示许可。绑定、恢复、AI重新开启时用已有官方只读player type和真实player几何做一次有界核对；保持真正小窗/PiP/已关闭安全空白。

取消／retire／deadline／wire-failure拆开：总deadline定时器保存原子触发/完成事实，正常close不被记为timeout，也不延长预算。：有主动取消证据时标cancelled；已发送允许finishSent的旧请求依旧按合同结束，真实socket错误仍保留。旧job不能覆盖新job状态，不能将socket错误永久加入配置拒绝表。保留2+2/总4、重试／截止预算、CAS与5秒后台barrier。失效队列任务可有界撤销；同identity重复激活复用Session/已就绪结果；不得把不同语言/profile混并。

补最小原因字段（owner/session/generation、player type、guard、clock源和sample age、geometry状态、request/outcome）及一次恢复事件；不每80ms输出重复字符串。

## 4. 四个字段不能输入、键盘异常／展开拖动抖动

### 原目的及是否保留

原生inline编辑、自动保存、API key保密、长按粘贴、默认要求展示保护和profile隔离都保留。文本显示Context和窗口Context分开仍是N33正确方案，不恢复N31/N32的旧窗口方案。

### 已确认机制和真机边界

- 四个字段共用 InlineCaptionEditor/CaptionEditorViewport。后者把onGlobalLayout、onPreDraw、手工padding、光标即时reveal和两种scroll绑在一起；前者还同时请求 InputMethodManager show/restartInput 和 WindowInsetsController.show。两套显示请求不是单一IME交互合同。
- 每个editor都安装root监听，共享同一ListView却各自保留originalBottom/appliedBottom。焦点转移、行回收和IME动画可能互相恢复/覆盖留白。
- IME底部一会儿来自root visible frame，一会儿来自Context WindowManager.getCurrentWindowMetrics；nested PreferenceScreen可能是Dialog，Context指标和实际root窗口不是同一坐标系统。键盘期间尺寸变化被每帧转成setPadding/requestLayout和立即scroll。
- 无IME自动reveal已经探针证明；重复布局／焦点恢复／serve input connection重建是有明确代码路径的风险。
- **这次输入失效没有手机IME/logcat堆栈，录像也不含输入。不能声称已在Android17手机逐字符复现或判定唯一OEM原因**。下一卡必须补真正IME composition/commit before/after，识别输入连接无效、编辑Dialog的ALT_FOCUSABLE_IM/NOT_FOCUSABLE与model popup残留、focused row detach/rebind、窗口focus丢失、文字被程序性重设的具体分支，不能再用setText或键盘可见截图冒称输入通过。

### 替代方案

一个实际window/root只管一个当前focused editor；先用平台原生IME resize/insets和TextView光标处理，删除viewport每帧强拉。确实需要fallback的nested窗口使用本root的坐标，IME结束只提交一次欠缺的可滚动空间，不能与已resize尺寸叠加。不接管官方OnScrollListener，不重写其他Morphe设置UI。

稳定row/editor identity与InputConnection：普通重绑不setText、不换EditText、不卡住composing；选取profile才合法替换内容，活跃编辑需先flush。手势滚动不自动把焦点移给新回收行，inactive任务须失效。保留API key遮罩/隐私标志/空输入不能擦掉旧key。

## 5. 详情页↔悬浮小窗抖动，字幕可见时更明显

### 原目的及是否保留

原设计用compact隔离和最多12帧只读几何观察，避免动画中的不确定矩形、原生字幕回流或旧结果覆盖。目标保留；不用扩大轮询／sleep/强制恢复来解决抖动。

### 根因链

1. 上述通知／隔离状态缺陷让恢复事件被丢弃，或者恢复槽遗留；这是“何时恢复”的错误。
2. RebuildController.tick 每80ms都refreshSurface；后者在guard/compact时也可能每500ms做geometry refresh并设置dirty。WATCH predraw每100msrender、position变化和player type派发也入render。有字幕时存在多个重叠触发源。
3. native动画矩形不断变化，CaptionOverlay.render把宽高变化转换成分页/字体/compactWidth测量、新背景、text.measure、anchor.setLayoutParams和bringToFront。这把动画几何当作一系列稳定排版场景，而不是等settled布局再提交。已有dirty/plan cache降低部分工作，但几何变化仍真实触发重排。
4. **明确的额外主线程成本**：CaptionDiagnostics.mark调用DeepSeekConfig.load→SecureApiKey.load；后者每次都创建AndroidKeyStore/Cipher并解密，且在ApiProfiles.LOCK内。displayResult又先load一次用于redact，再在debug开启时标REBUILD_PRESENTED与REBUILD_DISPLAY_RESULT各load一次。单次显示记录至少三次秘钥读取/解密，presentation/watch还有额外记录。3377条REBUILD_BLOCK_REUSED被80ms调度重复写出，mark本身没有debug门。日志文件追加在IO线程不等于整条日志生产已离开主线程。
5. 此诊断44个deferred-render增量样本（累积计数相减）平均成本的中位约57.431ms、p90约71.281ms、最大119.908ms；真实caption记录的layout_cost中位18ms/p95 47ms/max82ms。它们证明扩展工作可跨越多个显示帧，但不是完整SurfaceFlinger帧率／抖动量，也不能将所有时间定量归给Keystore。
6. renderStartedUptime在render外的suppressed/clear路径未重新取值，造成77640ms/6061ms假layout cost；要修测量口径，不能据假77秒设计修复。

### 替代方案

分离“播放器状态/显示许可”与“昂贵测量/布局”：唯一owner状态机在原生动画中保持仅常数时间隐藏/已有native draw masking；禁止动画每步全面树搜索／reflow。compact时字幕不可见但不破坏接受结果；非compact完成后只查一次有效surface、必要的一次mask恢复、选择当前合法event/page并重排一次。两帧同一真实surface几何确认，或既有可靠原生settled信号；12帧上限后安全等待可撤销attach/layout事件，不无休止poll，也不永久占槽。

布局key包含稳定surface owner/width/mode、text/page、字体/locale/spec/opacity。文字/字号/宽度不变只更新位置或visibility；参数值相同不setLayoutParams、不bringToFront。可用INVISIBLE维持既有overlay占位，避免GONE来回触发parent重排，但必须检验没有截获触摸、无障碍幽灵、Compact字幕泄漏与生命周期残留。

诊断采用已有immutable Session/config脱敏信息或profile绑定的只读脱敏snapshot，在后台合并/脱敏/写日志；**播放/动画/预览热路径不得为记录日志解密key或读完整config**。不通过停诊断/记录明文密钥换速度。旧profile与retired key脱敏照旧有效；更换profile不能让尚未写出的日志被错误秘钥脱敏。高频REUSED按request/状态变化合并，累计次数和丢弃数可导出。调用出错仍保留一次完整原因。

## 6. 本轮额外确认：N35时间成果应保留

新diagnostic已经完整捕获并校验原先缺失的f40f...17840B真实body，95 JSON3 events、94个时窗、0个tOffsetMs。不是supplied auto的106667B样本。第二份ref87c68...33047B也已恢复校验。

f40参照虽无词级offset，但运行日志明确partial anchors_seen188/mapped178/adopted108/components54/actual_retimed752。NATIVE/ALIGNED依然为0不等于没采用：内部词按照正确语义仍ESTIMATED。保留N35时间参照/partial映射、完整event单页、官方player getter、同一时轴与页basis；不回退这些成功成果去解决窗口问题。旧f40正文缺失的边界仅对历史N35交付报告成立，本轮已补上证据。

## 7. 后续安排

一张N36卡，单执行者（Codex推荐，DeepSeek允许），内部顺序：输入/预览→通知/恢复状态→转场热路径/日志→请求分类与分项证据→一次最终验证/交付。不给不同对话同时施工；不自动N36r/N37。必须有真实SDK35 IME和拖动检查；物理手机仍只读，用户after短验为最终OEM边界。

详细实施、合并范围、验收和流程减省见N36-EXECUTION-TASK.md。回退见N36-ROLLBACK-READY.md与N36-RESTORE-N35.ps1；N34仍有旧恢复路径。只准备和InspectOnly，未实际回退。

## 8. 外部依据（主源；用于平台行为，不代替本项目证据）

- Android官方 WindowInsetsAnimation.Callback：动画进度的处理应避免每帧昂贵layout，onPrepare/onStart/onEnd区分阶段。https://developer.android.com/reference/android/view/WindowInsetsAnimation.Callback
- Android官方IME可见性与窗口焦点说明：显示请求依赖editor/window focus，IME Insets可明确判可见。https://developer.android.com/develop/ui/views/touch-and-input/keyboard-input/visibility
- Android官方InputConnection：commitText、setComposingText与连接有效性必须真正验证。https://developer.android.com/reference/android/view/inputmethod/InputConnection
