# N37 规划审阅：N36 小窗残留、设置边界跳位、压力证据与暂停倒退

日期：2026-10-05（Asia/Shanghai）。规划／审阅完成；尚未实施 N37 产品。

## 0. 身份与证据

唯一仓库 E:\Projects\morphe-caption-v2。N36 产品 6319fd69900b1f08b231b14161713021d0fb616d；完成HEAD 3bf88d2c0047bb1ecd88f4389ec42627bc219aa9，anchor/n36-final 指向完成HEAD，anchor/n36-6319fd6指向产品。产品到完成HEAD只有docs，工作区仅原官方patches-1.45.0.mpp未跟踪。

用户输入：D:\HONOR Share\Honor Share\caption-diagnostics-1.3.5-20261005-084534.txt，3,824,470 B。该报告包括N35历史，不能用全文累计161次尝试／21次失败描述N36新压力测试。按首次n36-player-authority-v1事件及随后的进程边界分离，N36区间有3645条history；首次可确认N36显示时间1791160215527，之前的启动片段单列，不冒称获取整个安装后所有调用。

手机ASQHUT6422001234已连接。只读取得现有logcat/window/activity/IME/gfx和安装APK，未安装、启动、触摸输入、push、清数据、改设置或执行app_process。已核对安装包390个app.yydarlinker自有类的方法签名/访问位/寄存器/指令/引用/分支表/try blocks，与正式N36方法身份全部相等；整APK因签名与宿主组合不同，不要求字节相等。最后更新时间2026-10-05 08:28:43，YouTube21.16.256/minSdk28/targetSdk36。

读手机时前台是通知栏／文件管理器，AI设置窗已隐藏。AI设置窗已有242帧、13个jank、p99 73ms；这些是窗口累计统计，不是某次边界现场的逐帧因果栈，不把旧10月3日崩溃当N36崩溃。

在既有SDK35模拟器，使用正式N36原DEX＋原资源＋真实官方Morphe设置的独立测试host作滚动观测。未改产品；测试host不包含真实供应商凭据、不调用远程API。模拟器原override1500×2400/density480明显不同于手机1264×2736/density560，已对照手机几何进行测试并恢复原override。实体手机未写入。

证据目录.verification/n37-planner；重要文件review-facts.json、084534-n36-history.json、084534-n36-backward-render.json、phone-own-code-identity.txt、phone-gfx-01.txt、mechanism-before-01、settings-binding-before-01、preview-bind-before-01、diagnostic-ui-before-02、request-count-before-01、scroll-phone-geometry-natural-dark-telemetry.json。

## 1. 详情页缩为小窗后，旧字幕留到句子结束

### 原目的／是否保留

N36把播放器许可归于CaptionPlayerAuthority，并在COMPACT/TRANSITIONING期间停止扫描和排版，目的是保持小窗安全空白和转场流畅。目标保留。无需推翻这个状态机，也不恢复N27避让。

### 确定根因

- 原实际通知链DeepSeekCaptionHook.onPlayerType → DynamicCaptionController/PageCaptionController → RebuildController.player → CaptionPlayerTransitionGuard.onPlayerType。
- N36的RebuildController.player只更新compact/URL恢复窗，删除了此前CaptionOverlay.setPlayerType调用。
- Guard.onAuthorityChanged在COMPACT分支只撤销probe／订阅layout／结束native过渡，**没有调用CaptionOverlay隐藏已绘制View**。
- Overlay的WATCH停止render、Controller.tick在COMPACT直接return，都只阻止未来工作，不能撤掉已经可见的anchor。现有hideView藏在Overlay.setPlayerType，但正式入口不会调用它。
- 新机制探针通过正式通知入口：已有真实showEvent绘制且anchor VISIBLE，发送MINIMIZED，Authority已COMPACT而anchor仍VISIBLE。mechanism-before-01中此项已复现；不只是检查state enum。

### 最小改进

许可变为COMPACT、真实compact transition、CLOSED或无效owner时，在同一个主线程许可提交里撤销渲染任务，并直接隐藏当前owner的已绘制anchor。该步只做常数时间View可见性／拖动取消，不能扫描、测量或清翻译计划。pending event/READY cache/保存位置保留；回来后仍由原guard在有效surface上显示此刻合法页。选择INVISIBLE可避免额外layout，但须证明触摸与accessibility不残留；普通event过期仍执行既有安全隐藏。

实际SLIDING_MINIMIZED_MAXIMIZED等名称含两种模式，substring会归COMPACT。这在before也已记录，不能据此断言用户正在进入还是退出；安全否定显示可以先执行，恢复必须等有效稳定状态，不能看到MAXIMIZED子串就提前恢复。

## 2. “字幕样式”与预览上缘之间的跳位／卡顿

用户最新定位覆盖早前“预览框接触顶部”的描述。本轮不再把画布缓存当唯一原因。

### 原目的／是否保留

设置需要随Morphe语言刷新，并允许诊断展开、刷新、复制、保存。预览要复用暖缓存。目标全部保留，尤其N33窗口导航／本地化方案和N36输入ID。

### 已确认的两条上游机制

**A. 普通设置绑定同步读取诊断，即使诊断面板收起。**

- DeepSeekDiagnosticsPreference第52行uiText(body,()->CaptionDiagnostics.uiText(c))在onCreateView即执行；其TextSlot又被CaptionSettingPreference.getView→refreshCaptionText每次重绑定执行，未按expanded可见性或显式操作门控。
- CaptionDiagnostics.uiText的两个重载都先调用CaptionDiagnosticsWriter.drainNow。该函数是同步materialize路径，可能在调用线程处理redaction/凭据快照。
- summary再调用CaptionDiagnosticArchive.readSummary：第78行先等归档FIFO barrier，之后另一个Future.get并读取summary目录所有日志；无summary时还读整个history fallback。两个get各有30秒上限。上限不是本次实际卡顿时长，但证明UI可能等待后台磁盘工作。
- appendSummary名为“latest slot”，实际仍用appendNow写保留24h的多个summary日志；每次读取扫描全部，工作量随日志增长。
- **已作确定性阻塞复现**：把归档lane停在可释放栅栏，主线程仅创建／绑定默认收起的诊断行，另一线程捕获其栈：FutureTask.get → CaptionDiagnosticArchive.readSummary:78 → CaptionDiagnostics.uiText → TextSlot.refresh → DeepSeekDiagnosticsPreference.onCreateView。释放后台栅栏后UI才返回。没有点击刷新、展开或保存。证据diagnostic-ui-before-02/collapsed-ui-blocked-stack.txt。

这证明N36“写日志已移后台”没有覆盖“读日志”的普通设置热路径。滚动让相邻行入/离屏时可以碰到该工作。不能把异步文件append当成整条UI链已异步。

**B. 相同文字/语言仍让原生TextView和父行重新布局。**

- CaptionSettingPreference.TextSlot.refresh每次setText/setHint；refreshRow和direction又重复设置语言/方向。
- CaptionTextResolver.direction无条件TextView.setTextLocale。已有布局时，同一Locale再次设置也请求parent layout。settings-binding-before-01在SDK28/35两实例均复现。
- preview缓存虽温暖，外层Preference.getView相同输入仍令整个预览设置行isLayoutRequested变true。preview-bind-before-01已复现。这是画布缓存测试无法覆盖的层。
- DeepSeekSliderPreference的档名行还在onLayout新建5个TextView测自然宽，并可能requestLayout增加最低高度，属于真实额外排版负担；先修A/B，测量证明其仍参与后才做最小onMeasure/cache改进，不顺带重写滑轨几何。

### 手机／模拟器边界与前卡测试漏洞

手机窗口统计支持有慢帧，但当前前台不是设置，不能宣称捕获了用户那一次精确edge现场栈。模拟器同手机几何的自然滚动，强制滚动/IME padding变化为0；未观察行高突变/数据集通知，这排除了该受控场景下的IME追焦循环，却不能排除带长期诊断数据的OEM现场。

N36旧scroll lane主动canvas.requestFocus，改变了用户的正常焦点条件；模拟器几何也不同。本轮已移除该测试干预。warm canvas不重测不等于整设置页无阻塞。后卡必须使用实际诊断工作量／扩展与收起状态、用户指定的标题/间隙边界、原始焦点，记录完整UI调用时间和请求布局次数。

### 方案

界面读已脱敏的不可变内存snapshot，普通getView/getDraw/getMeasure零barrier、零IO、零KeyStore；诊断展开/刷新在后台获取，再按当前Panel/window/locale/clear epoch投递。收起面板不求完整正文；完整导出仍后台等待完整性barrier。最新summary改有界单槽／尾读索引，原历史证据不删、不重写。

文本、hint、Locale/LocaleList、方向和样式只有值实际变化才setter；保留真实语言切换与首绑定。预览暖缓存、4个编辑器identity、输入连接、默认/自定义要求保护不动。必要的档名测量改在onMeasure且受真实配置key管理，不改变既有RTL映射或label规则。

## 3. 本次压力测试：如何解读，有哪些需要修

### 本次可确认区间

- 42条请求，39条HTTP响应；2条HTTP_FAILURE明确reason=cancelled，均为旧session1在seek／替换附近的断开；1个请求导出时没有terminal记录。不能冒称最后一条已成功或失败。
- slot_wait中位16ms/p90 54/max67；source queue13样本中位13ms/max15；network中位4070/p90 4916/max6518。没有本段出现大排队／活跃网络deadline失败的证据；也不能仅凭这些数字宣布所有压力场景正常。
- REBUILD_BLOCK_REUSED1310条而merged_records=0。Producer没给该事件mergeKey，Writer只合并队尾相邻同key，所以“有合并器”不等于这类噪声已被合并。它增加归档与UI读的工作量，与第2项相互放大。可按request生命周期边沿记录一次＋累计重复计数，不能屏蔽错误／响应／首显。
- 页面级别存在3次无seek的可见字幕倒退，详见第4项。owner_invalid/合法window到期/gap不全部算漏字幕；N36本段6条player_suppressed不能单凭计数证明用户长期锁死。

### 审计分类仍有确定错误

RebuildApi.recordFailure对TransportFailure统一拼network_，故取消变network_cancelled、总deadline变network_deadline_expired。TokenCostAudit.recordFailure先匹配timeout，再network，最后cancel；于是前者落network、后者也落network。这解释了报告头cancelled/interrupted0与本段两条明确取消不一致。补typed category/明确映射，只修新事件的分类；历史累计不猜测重分配，API尝试/总失败/成功/token不丢账。

### N36未通过的n24自动化项

N36真实full-delivered-01是716 tests、1 failure、0 error/skip，不能当全量通过。失败为n24BlockedOldFocus期待totalCalls2实际4。

本轮受控探针已证明：两次focus各一次，接受后允许两个successor prefetch各一次，total4；没有重复focus。原测试“总次数=2”没有区分目标请求和合法预取，容易受异步时序影响。但是原full失败没有逐request身份台账，**不能据新探针断言原失败唯一原因一定是预取**。

下卡必须给原失败场景记录block/lane/request/session身份，判断是合法预取、同block重复还是跨测试遗留；前者修fixture/计数口径，后两者修实际生命周期，不将2机械改4、不跳过、不给每类单独JVM遮盖。保留N24“两个focus不重复”合同，另断言prefetch2／总4和30s范围；一次最终全量必须failure/error/skip0。

## 4. 暂停时从下一句退回上一句

### 诊断直接证据

同一N36 session12/generation0、没有相邻REBUILD_SEEK：

- 原可见id12:0:2:117-131“零售包装盒的开局非常强劲，因为它巨大无比。” render_position28290 → id12:0:2:107-116“所以……我大概能搞清楚它好不好。”27922，倒退368ms（lines14312→14320）。
- id12:0:2:132-138“顶部放着一部手机……”32235 → 上一句12:0:2:117-131，31861，倒退374ms（14344→14353）。
- id12:0:3:161-165“不过我们稍后再看这个。”43120 → 前一句12:0:3:146-160，43060，倒退60ms（14494→14503）。

旧诊断没有每次pause donor／native与media状态组合，不能仅从数字证明三次全部是同一个停机分支，但它已捕捉到用户描述的可见回退。

### 原目的／是否保留

原pausedDisplayPosition用于冻结暂停画面，过滤MediaSession小抖动，并让暂停中真实seek立即有效。目标保留；不得简单把“最后字幕”钉住或所有时间强制单调递增，否则会掩盖真实往回seek和实际源间隙。

### 确定代码根因

RebuildController.position(s)已用OfficialPlayerClockAdapter读取当前player并令regular=CLOCK.current，但当MediaSession报PAUSED，又把pausedDisplayPosition设成其raw reported，displayPosition优先返回此字段，绕过已选择的新clock。

time(ms)也先算新presentation，再因为MediaSession PAUSED把冻结点强设为hook ms。与native sample是否更新无关。冻结字段不是“同一选中时钟的暂停快照”，而是另一个优先级更高的旧时间通道。

mechanism-before-01实际Controller路径：官方当前paused样本28290、同owner旧MediaSession27922；position(s)返回28290，pausedDisplayPosition和displayPosition却27922，完全复现368ms倒退。它同时会造成选事件/调度与实际渲染参照不同。

### 最小修复

不改source/ref/event/page时间轴。选中播放器位置、state、speed和sample origin作为一组一致证据：有合法当前native样本时优先其position/state；只有不可用时才用合法MediaSession；再降级hook/既有frozen。暂停冻结必须取同组选中position，不能另取raw旧值。

进入暂停只建立一个owner/video/session/seek epoch绑定的freeze；后续低优先级旧media／hook不能改它。恢复播放／video/owner失效清freeze；真实暂停seek仍允许更新到真实选中的新位置，包括小幅往回。frame after-layout、选择event/page和调度的paused判定消费一致证据。保留jitter过滤，不能通过加固定提前量、延时显示下一页、禁用暂停seek或强制page index不减解决。

## 5. 修复范围与安排

一张N37卡，内部顺序：先廉价同步隐藏→统一暂停冻结→诊断snapshot/幂等设置绑定→压力分类与原测试身份台账→一次最终验证/三包。C模块是本次最需要正确处理的并发/UI部分，推荐Codex单执行者；用户仍可选DeepSeek，不并行两个执行聊天。

A/B已确定根因，C的UI阻塞和重复布局也已经生产入口／原生TextView复现。物理OEM一次精确跳位并未现场trace；任务卡要求交付前真实SDK35带实际诊断量的自然边界滚动验收，手机after由用户最后短验。不得再把暖画布测试替代整体场景。

不修改N35参照／partial retime／source/cache/page策略、N34缺字幕安全、N33设置导航和14语言、N36快转场目标、CAS/锁/5s后台barrier、focus2+prefetch2/总4、request deadline/attempts、API/profile/Keystore保存、两public roots、官方1.45／YouTube21.16.256/minSdk28／版本1.3.5、Shorts、ACCEPTANCE/frozen计分4/4/4。N27不恢复。

详卡N37-EXECUTION-TASK.md。回退N37-RESTORE-N36.ps1／N37-ROLLBACK-READY.md。backup/pre-n37-n36-3bf88d2固定。旧N35/N34恢复脚本仍保留；只InspectOnly，未实际回退。
