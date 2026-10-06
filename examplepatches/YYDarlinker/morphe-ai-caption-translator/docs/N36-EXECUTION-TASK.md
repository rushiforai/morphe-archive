# N36 执行卡：输入／滚动稳定、播放器许可恢复、转场减负与验证流程收敛

日期：2026-10-04（Asia/Shanghai）。Codex 或 DeepSeek 单执行者；完成本卡即停，不自派 N36r/N37。不把本卡仅当文案或缓存小修。

## 0. 目标和明确职责

用户反馈五项必须一起处理：①耗时流程可减省；②预览上缘卡顿跳位；③操作后字幕不显示、压力等待；④四输入字段不能输入／IME抖动；⑤详情页↔悬浮小窗抖动，有字幕更明显。

本卡沿 N35 成果修复，保留其真实参照采用和字幕时间安全。执行者先读 N36-N35-REVIEW-AND-REPLAN.md 中每项“原目的→是否保留→机制证据→替代方案”；每项最终报告都按这四点回答，并加实际before/after和未覆盖边界。不能把测试变绿、只缩短超时或固定视频绕过当完成。

顺序已确定：A输入／预览 → B播放器状态许可与恢复 → C转场/诊断热路径 → D压力请求分类和复验 → E最终一次验证/交付。本卡内部工作顺序，不是五张卡。发现同一路径的必要最小修复可以继续，不因旧卡冻结名单而无故停止；超出本卡语义目标时保留证据并说明，不扩大翻译产品策略。

## 1. 开工身份与回退

- 唯一仓库 E:\Projects\morphe-caption-v2。
- N35 产品 1967dacff904173ef685602e831cc21291fffb94；完成 HEAD 013cc93b266b339ad05dea11b1bd29177cbcbffe；anchor/n35-013cc93=013cc93b266b339ad05dea11b1bd29177cbcbffe。
- backup/pre-n36-n35-013cc93=013cc93b266b339ad05dea11b1bd29177cbcbffe；N34 anchor/n34-26edf55 保留。
- docs/N36-N35-BASELINE.json 记录三包、official input、核心文件SHA与新diagnostic/录像身份；docs/N36-RESTORE-N35.ps1 已准备，只做过-InspectOnly，未回退。另有N35-RESTORE-N34.ps1可恢复N34。
- **开工不要求HEAD逐字符等于旧报告**。HEAD为N35完成提交的后继，且 git diff 1967dacff904173ef685602e831cc21291fffb94..HEAD -- . ':(exclude)docs' 无产品差异、工作区无未保存产品改动，即接受docs-only任务卡/状态后继。docs-only或本卡规划before证据不是暂停理由。
- patches-1.45.0.mpp 是原用户未跟踪输入，保留；不要纳入删除/覆盖。核对两份PROJECT-STATE；如已有执行管理补记，合并保留，不整文件盖回旧版本。
- 开工先记录基线，产品施工全部在本仓库。错误试验先本地WIP保存再回退；不reset --hard、不amend旧提交、不删除失败日志/历史包、不清手机数据。

## 2. 证据与原生产before

输入：D:\HONOR Share\Honor Share\caption-diagnostics-1.3.5-20261004-215344.txt；D:\HONOR Share\Honor Share\SVID_20261004_220011_1.mp4。

规划者已用当前生产路径复现：

1. 隐藏IME仍focus/reveal向parent请求即时滚动。
2. 相同测量key的普通Preview Preference重绑定丢掉缓存，sampleLayoutCalls增加。
3. 新Activity继承suppressed/guardedExpansion，但playerType为空。
4. 恢复Probe owner丢失退出，却pendingProbe继续占槽。
5. 后台真实MAXIMIZED通知被无关字幕clear改变render epoch而丢弃，最终仍MINIMIZED。

源码在.verification/n36-planner/probes，结果probe-run-01=4/4、probe-run-02=1/1。它们是“当前坏机制成功复现”，不可挪为after通过。先保留before，不必再全量复跑N35或重建before198MB APK。可直接利用原N35 MPP/MPE/APK做before host。

手机当前未连接。只允许物理手机读日志/拉取现有APK；不安装、不启动、不input、不push/app_process、不签名、不清数据。真实SDK35可用已有模拟器和独立测试host；使用明确emulator serial，禁止任意adb默认设备。无新依赖、SDK或工具下载，远程翻译调用0。

## 3. A：统一IME／滚动，稳定预览

### A1 先补真正的输入before，不能冒称已锁定OEM唯一原因

四个生产字段：DeepSeekModelPreference、API key、base URL、prompt，均经InlineCaptionEditor/CaptionEditorViewport。在实际官方1.45主题及nested PreferenceScreen窗口下建立可见host；用当前N35记录实际window/root token及window flags（NOT_FOCUSABLE、ALT_FOCUSABLE_IM）、model PopupWindow/drawer的焦点归属、focused view identity、active InputConnection、attach/detach、getView重绑、composing/text watcher与滚动请求计数。

必须走真正IME service的setComposingText/finishComposingText/commitText/deleteSurroundingText，或实际模拟器键盘输入；**不是setText、EditorInfo flag检查、仅调用onCreateInputConnection，也不是绕开served editor拿一个人工连接就判输入可用**。如果现成host需要最小TestIme服务，可只给测试包新增，不进入MPE/正式APK；不下载第三方IME。

追踪以确认具体失效分支：连接没建立、已建立但focus/row重绑失效、composition被重置、程序性setText覆盖、其他窗口取得focus或编辑窗口被ALT_FOCUSABLE_IM阻断、主线程热路径长阻塞。手机Android17分支未离线复现时如实记录；后续after仍要证明实际四字段可持续输入。

### A2 生产修改方案（保留inline和自动保存）

1. 每个实际root/window只保留一个editor viewport协调器，使用weak owner和可撤销editor registration。当前focused editor才有处理权。行回收注销该字段及queued任务；root真实detach释放窗口资源。不能让旧editor恢复另一个editor的padding。
2. 主路径优先平台原生IME resize/insets与TextView光标逻辑。**删除每帧onPreDraw的padding/reveal/scroll轮询**；global layout也不因为editor.hasFocus就强拉。没有IME、不在用户输入动作、用户正在drag/fling时，本功能的scroll请求应为0。
3. inline长按选择文本和多行prompt内部滚动仍正常；外层手势从输入框开始的纵向drag应交给父ListView。不能禁用focus/IME、将输入框设不可编辑或用新弹窗替换来过测试。
4. 编辑所在实际窗口必须具备输入资格；核查lazy PreferenceScreen/Dialog构建及旧model popup是否留下FLAG_ALT_FOCUSABLE_IM/NOT_FOCUSABLE或夺走focus。只有已证明属于自有编辑窗口的错误flag才修正；不全局clear宿主flag，也不改本应非编辑overlay的属性。IME显示只走一套主申请流程；避免同一手势反复restartInput和两套show。Window focus与editor已attach/owner有效才申请；IME已服务同一editor时不restart。普通getView/recycle不能触发自动show/抢焦点。
5. 普通重绑保持同一字段、同profile的EditText和InputConnection；不无条件setText，不丢composition/selection，不换成其他字段回收View。需要不同唯一viewId时用稳定的per-field ID，禁止几项都是android.R.id.edit导致错误焦点恢复；先用before证据判断此处是否参与失效。真正profile切换才flush并换内容；保持N33默认展示/自定义要求保护。
6. 无法原生resize的实际窗口才用fallback。坐标全来自同一root/window：root屏幕位置、root WindowInsets、list实际viewport。不能混用Activity WindowMetrics与Dialog root visible frame。
7. fallback在IME打开/结束或明确用户输入/光标动作时计算真实剩余遮挡；可按animation回调做只读状态/必要translation，**不要每帧setPadding或requestLayout**。底部scroll range只提交缺额一次，IME隐藏恢复一次。已经resize不得再叠加完整IME高度。
8. 一个修正只选平台rectangle或一次明确scroll，不同时bringPointIntoView＋requestRectangleOnScreen＋scrollListBy重复补偿。用户拖动/fling中延后自动校正；结束后仅在当前editor依旧输入且确实被IME挡住时纠正。
9. 不能替换官方OnScrollListener、WindowInsets listener、主题、整个Preference导航或global Locale。必须保留官方其他功能的listener和insets传播，不消费它们。

### A3 preview真实缓存

- SubtitleStylePreview.refreshDynamicText只在实际locale/sample/style/config/theme变化时失效。相同key调用不invalidate。
- 缓存key包括locale/sample、字号档/opacity、布局width、density/scaledDensity/fontScale和影响绘制的theme/style。普通重绑、root scroll、剪裁到顶部、进入/离开viewport不算测量变化。
- 同Preference跨安全行回收保留preview/measurement，禁止与其他行错误复用；不得持Activity强引用跨窗口寿命。
- 连同场景Path/Shader、FontMetrics等不变量缓存。热draw不得newTextView/重measure或反复读完整API配置；缓存真实失效时一次重算，滑块联动和locale刷新仍正确。
- 保留16:9、2736参考、缩放一次、五档glyph高度与14语种完整示例，不改变布局尺寸掩盖卡顿。

### A4 硬验收

- 四字段连续输入/删改/中文日文composing/英文ASCII/paste都能生效；完成/失焦后保存，重新打开值一致。Key使用dummy测试profile，测试后还原，不使用真实API或真实密钥。
- 展开/隐藏IME、四字段切换、prompt多行、滚动使focused row离开/回来、旋转/返回后重开；连接持续有效或合法重建，旧任务不能覆盖新文本。不可只验证“键盘显示”。
- 隐藏IME时向预览上缘快慢各3次／fling3次：viewport的forced scroll、window mode flip、padding变化为0；顶端保持用户scroll意图。
- warm key连续draw及重复getView/recycle时label rebuild=0；真正locale/字号/宽度改变产生受控重建。中/英/日/阿选择足够，不重做14语言母语验收。
- 真实SDK35 before/after截图/短录屏加InputConnection/布局计数；Robolectric补边界但不能替代。

## 4. B：独立播放器许可、关闭恢复槽残留

### B1 owner状态与render状态分离

- 新的player authority记录至少：weak Activity/root owner、video identity、authority epoch、last authoritative player type、latest notification sequence、outer恢复责任。
- caption render revision/submission只用于作废渲染。**真实player type不得用playerDispatchIdentity过滤**。同owner的caption clear、AI开关/样式/重新布局不能丢有效player回调。
- off-main通知主线程合并最新type，不重复扫描。连续outer/inner回调不得因为后来的inner覆盖而失去outer的native scan恢复责任；同owner同批次责任按OR合并，新的owner不能继承旧批次责任。
- Activity/video变更作废旧authority，迟到旧回调拒绝；same Activity正常重复install不得破坏当前有效owner。无Activity/video信息时保持未知，不用猜测授予显示。

### B2 状态机替换孤立布尔残留

使用单一、可审计状态：UNKNOWN / COMPACT / TRANSITIONING_TO_REGULAR / REGULAR / CLOSED，状态携带owner epoch。实际miniplayer/PiP/hidden/closed仍抑制，Shorts保留既有隔离规则。

- owner改变：撤销旧probe/frame callbacks/layout/attach监听、清busy槽和旧owner标志；新owner先UNKNOWN，而不是直接suppressed=false强行显示。
- 所有Probe退出路径（owner失效、decor消失、token变更、超时、完成）必须释放它自己的pending槽。清理须比较token，旧probe不能清新probe。每代仅一个probe/恢复任务。
- MAX12帧未稳定：结束本轮观察且释放槽；保持安全空白，等待**实际player子树**attach/layout或一次新的权威通知。不要只靠decor外框变化；事件共用同一恢复入口，不能叠加永久轮询。
- 重新bind、resume或显式AI重新开启时做一次有界current-player核对，而不是等待一定会再次发生的type callback。优先用已存在的官方1.45只读public表面：VideoInformation/VideoState保持N35；PlayerType public synthetic accessor PlayerType.access$getCurrentPlayerType$cp() 在既有official-145-clock-api.txt已验证public/static，实际交付DEX再确认。无需私有字段反射、修改官方class或新bytecodehook。读值必须同时核对owner/video，未知/关闭类型不能凭几何强制普通许可。
- 如果getter不可用，使用当前owner已接收的权威type＋真实player geometry；不能借用另一个Activity/视频的缓存。首次UNKNOWN且没有证明时安全空白，订阅一次有效attach/通知恢复，不永久锁死。
- REGULAR和几何有效后，在一次恢复提交中解除当前owner隔离，显示此刻合法event/page。不是回放旧caption，不能使用之前miniplayer的坐标。有效缓存/计划复用，不因恢复发翻译请求。

### B3 必须的机制回归

规划者五个before转换为after回归；再覆盖：MIN→MAX通知在clear/AI开关/样式变化夹杂时仍接纳；真正旧owner通知被拒；Activity/decor中途离开，重开同视频；重复同type；outer→inner/inner→outer；12帧不稳定后仅player child迟到attach；关闭/后台/PiP保持隐藏。

多个目标语言至少zh-Hans/ja/ar，以共享路径证明不是中文专用。已READY结果在合法window、valid REGULAR surface重新开放后不等远程请求；本地显示在既定UI dispatch内恢复，不能再显示过时页。

## 5. C：转场关键路径和诊断热路径减负

### C1 本轮要保留的目的

compact安全、source/session所有权、native draw mask与严格时窗均保留；撤掉的只是重复工作及错误状态依赖。不能取消native mask、提前解除compact、禁止用户拖字幕，或恢复N27播放器控件避让。

### C2 唯一转场协调及稳定布局提交

1. type回调只更新权威状态／dirty标记，必要的常数时间隐藏，不同步树扫描/字体测量/网络/KeyStore操作。统一B的coordinator，不保留另一个独立layout尾随循环。
2. collapse进COMPACT立即令overlay不可见。可以保持已有overlay anchor以INVISIBLE处理，减少GONE/reparent造成parent布局；仅在它不截获触摸、无无障碍残留、真正不绘制时使用。owner销毁正常detach。
3. TRANSITIONING时RebuildController.tick／refreshSurface／WATCH predraw／position更新都不得绕过coordinator重新扫描或reflow。pending event与时间到期仍更新，geometry/UI昂贵部分暂不提交。native只维持已知view alpha/draw mask。
4. 几何观察只读cached当前player rect；不要每帧从decor找全部ID。owner/root确实变化时一次有界发现。两帧同一surface有效几何稳定后提交一次布局，再允许当前event按正常节奏更新。上限12帧仍执行B的可撤销事件等待，不能sleep/无限延期/不稳定时强显示。
5. 详情↔全屏也是同一协调入口：尺寸/模式变化等待稳定；未变的合法布局可以保留。不可每一个动画宽度都完整分页/compactWidth/text.measure。
6. stable layout key包含surface owner/mode/width、当前text/page、render spec/locale、字体档、density/fontScale和background style。纯time advance且同页/相同布局不重测、不重复setBackground。位置改变且尺寸没变只更新位置；FrameLayout参数一致不setLayoutParams、不bringToFront。
7. native renderer晚attach恢复一次既有player-local检查。pauseDiscovery、结束恢复、outer hook responsibility均归同一状态机；原生字幕不能在切换后闪回，也不能为找native view做连续full-decor搜索。

### C3 修正日志主线程密码学和重复记录

当前确定调用链：displayResult先DeepSeekConfig.load取key做redact；debug两条mark各再次load；mark→SecureApiKey.load每次KeyStore/Cipher解密并持ApiProfiles.LOCK。REBUILD_BLOCK_REUSED记录3377次。文件append异步不能解决这一前半段。

- 播放/动画/preview热路径为日志作记录时，**完整config load、KeyStore解密、文件读写计数必须0**；不得用关闭诊断或跳过密钥脱敏满足。
- 优先向日志层传已在Session建立时读取的immutable config/redaction信息；通用UI记录使用profile/credential origin绑定的只读脱敏snapshot，在后台解密/脱敏/批处理。不要为了日志全局永久缓存plaintext key。任何fallback不得在main或持session/controller/ApiProfiles锁时进行密码学。
- 待写记录绑定产生时的profile/凭据身份，防止稍后profile改变后用错误key脱敏。retired Session旧key仍正确脱敏。未脱敏raw数据不能落盘／export；不保存signed URL/cookie/key。Key加密保存、alias、profile/origin隔离、删除语义全不变；可为只读snapshot增加最小helper，不重构凭据业务。
- 内存队列有界；合并只合并同request同状态的高频REUSED/稳定观察，保留累计数量和drop/truncation计数。请求开始/结束、结构拒绝、source修复、cancel原因、实际caption首显、owner恢复和错误不能吞掉。
- SharedPreferences latest/history更新批量且后台；export已有barrier保证包含先前排队记录，不main等待30秒读取。clear与正在写入有epoch，旧记录不能在清空后复活。必要时修改diagnostic Preference的导出分发，不改变面板语言与英文raw。
- 不改TokenCostAudit既有历史；新增结果分类保持API尝试/成功/failure和tokens可对账。

### C4 时间与最小telemetry

- renderStartedUptime不能作为全局旧时间写进render外clear/suppressed。每次dispatch/job提供它的本地起点，分queue_delay/render_compute/apply时间；纯隐藏layout_cost=0或not_applicable，不能记两次render之间77秒。
- 补唯一owner state change和blank reason：authority_epoch、activity/root短id、video/session/generation、player_type、guard_state/reason、surface_valid、clock_source/sample_age与position。无敏感参数，不在每80ms重复输出全文。
- 同一event/page有稳定布局且无实际文案/几何变化时，可以合并重复观察，首显／状态变化仍真实记录。

### C5 转场验收

在本地真实SDK35和production hook outer/inner入口下：①无字幕、②已有合法字幕、③pending status，详情↔小窗各3次及一次全屏返回，测实际callbacks/geometry search/measure/requestLayout。

- 动画关键区额外full-tree搜索0，额外key解密0；跨frame重排不随动画逐步宽度增长，settled提交至多1次有效重测（若真实新event/page恰换页另记原因，不能混为同transition重复）。
- steady相同key无重测/布局重复；有效字幕内容、大小、位置、触摸拖动和两行容量不回退。
- 没有旧owner残留；COMPACT/PiP/关闭无字幕；回REGULAR只显示合法current window。提供before/after实际frame统计和计数，注明test机与手机区别，不用累计render cost冒称手机fps。

## 6. D：压力等待与请求结算

本次数据slot_wait max132ms、source queue max105ms；network中位4491ms/p90 7335ms，实际10/16秒deadline失败存在。不能以扩大并发/拉长deadline或缩短它丢更多字幕解决。

1. 记录实际job生命周期：queued→sent→response/transport_failure/deadline/cancelled→published或discarded。取消原因来自真实cancel/owner退役/连接主动关闭事实，而不是“发生了socket exception”就猜取消。
2. NetworkDeadline只增加可审计的原子触发/正常完成事实，不改变total deadline或retry预算；现有timer直接disconnect而没有cause，会让真正deadline报成SocketException。区分timer实际触发、底层read/connect timeout、主动stop、普通wire故障；不能仅凭remaining=0猜哪一方先发生。正常close/完成取消timer不生成timeout。总deadline边界与stop并发用受控clock/屏障回归。RebuildApi catch在控制已取消、已证明此连接因stop/disconnect关闭时标intentional cancel；真实活跃wire错误保留network failure。已sent且finishSent允许完成的退役请求继续合约结算，不能伪造cancel。retired failure不影响新session的FAILED/config/providerRetry。
3. RebuildController job的attempt/retry/state修改需要相同job identity、current session和publication；旧job finally不能清掉新lane/覆盖新block。新本地trace含cancelReason和publication/outcome；次数/tokens不丢账。
4. 配置永久拒绝表只收原规则的真实401/403/404等configuration，socket/deadline不进永久配置锁。保持已有2次transport尝试、结构repair与过滤/安全空白规则，不额外无限重试。已READY缓存计划不能被失败/旧结果降回WAITING或重翻。
5. 保留focus2/prefetch2/总4、1500ms参照phase、单请求deadline及CAS/锁分离、5s off-main retirement barrier。主线程不await/disconnect/fsync。不要为了快增加prefetch、降低结构/引用覆盖检查、加固定字幕提前偏移。
6. 无意义重复activate（同video/source/target/profile/prompt/config identity）应复用已有session；不同真实selection/config仍合法新session。场景状态变更只恢复display许可，不触发translate重启。取消尚未发送且已失效的队列任务以有界方式清理，不能让错误恢复占着slot。
7. 真实本地stub演练：focus成功、活跃read deadline、主动off后disconnect、切目标后旧响应、切视频后旧failure、快速切回相同identity带READY缓存；使用固定可控response时间，远程API0。逐个核对当前结果能呈现或按真实失败安全空白，不能混淆成“都不漏了”。

对于真实供应商4-7秒服务时间，本卡不承诺消除。本卡应消除本地无谓重新请求／热路径卡住／许可锁死，在after原因中诚实区分network未就绪和显示无法恢复。

## 7. 允许修改与保护边界

允许最小共用路径：InlineCaptionEditor、CaptionEditorViewport/必要新window coordinator、SubtitleStylePreview、CaptionSettingPreference/四个editor Preference的稳定bind、DeepSeekCaptionHook/V2的已有通知分发、CaptionPlayerTransitionGuard、CaptionOverlayV2、CaptionSurface、CaptionMusicSuppressor与必要Button/Lifecycle observer调度、RebuildController的显示/激活/trace及job结算、RebuildApi取消分类／NetworkDeadline只读原因与原子结算、CaptionDiagnostics/Archive/QualityTrace、diagnostic导出分发、只读redaction helper。可为缺少的owner/state/change追踪增加纯helper。

不能复制N31/N32其他成果，不能替换app.morphe class或新增未经审计宿主bytecode hook；现有hook签名保持。不得用catch Throwable吞失败假装解决，不加入静默跳过关键检查。

冻结：N35 source/reference/alignment evidence、clock/math/page timing及中文/非中文输出/semantic split；有效prompt/schema/cache identity；RebuildCache publication/commit/lock/5秒barrier；request数量与费率上限；source字符/引用/数字/coverage与失败安全空白；N33默认/自定义要求隔离、14locale、profile/keys/Keystore、2 public roots和自动翻译菜单、Shorts；N27不恢复；official1.45.0/YouTube21.16.256/minSdk28/1.3.5。若这些冻结算法不是缺陷根因就不得顺便改。ACCEPTANCE/frozen scoreboard/history/旧包不变。

## 8. 新的验证与交付流程（减省必须执行）

### E1 每阶段小专项

修改A只跑editor/preview/IME；修改B/C跑owner/dispatch/geometry/display/native mask；D跑取消、connection、cache复用和最小scheduler/CAS回归。测试失败先查因、保留失败，改后只复跑相关。无新修改不得为了“更保险”重复同一已绿全量或400轮压力。

N35成功全量已708/708；不重跑纯N35全表作开工仪式。旧测试真与新IME合同冲突时，可精确改期待并保留before证明，不能删用例/把focus检查弱化；65旧业务文件等历史冻结证据按实际范围保护，不要求复制几十万文件逐个哈希。

### E2 一次真实SDK35交互硬闸

A4/C5实际host交互、五个机制after以及D本地stub必须先通过再冻结生产源码。保存artifact/code digest，临时host明确候选且不交付。没有实际IME commit证据不能关闭第四项；此硬闸优先于生成MPP。

### E3 一次最终全量与组合

- 使用仓库已有isolated JDK21，从第一条验证命令就指定，--offline；不先试默认JDK25再失败。使用已有watchdog/报告脚本，可新n36薄入口，不下载工具。
- 全量一次：至少保留N35已有708条＋本卡新回归，fail/error/skipped=0。不事先编造最终数量。Python27/27、发行合同11/11；本地化实际当前234×14等由目录核实，不硬套旧版本220。
- frozen score4通过/4既有失败/4未验证，不可见三项按既有同口径；ACCEPTANCE/frozen-baseline Git零diff。
- 两公开roots选择AI-only/Remember-only/both的真实组合合同仍审计。共用最终MPP/source identity，正式both APK只合成一次；其他选择可以使用现有patcher/harness真实分支审计/DEX，不要仅查JSON，也不要求各建完整大APK。
- 正式MPP自身组合；MPP内MPE=独立MPE；final11DEX/接口/类型/分支/资源/ZIP/aapt/apksigner unsigned全走既有审计，不能因为省时间跳过ART风险。复用既有工具，n35固定冻结名单需要按本卡允许文件和保留不变量正确更新，不能把冲突审计注释掉。
- 正式产物hash/size与N35/N34/官方input核对一次。保护范围用指定旧三包＋输入＋Git protected paths＋本卡读用证据；不全面扫描281140个build/worktree文件。新产物自身只SHA一次，后续复用hash。证据目录元数据不算产品差异。
- 为源码/测试/资源/build参数/official input建立verification identity。已绿E3后同identity无变化直接提交/写报告，不全量复跑。docs-only、anchor写实不改build字节，**不再建包**。有实质新修改只失效关联证据；进入最终源码identity的新修改须重新一次全量/关联最终包，保留候选说明原因。

### E4 成果、时间台账和停止

输出-n36 MPP/MPE/unsigned APK；N36-LOCAL-TEST-BUILD.md、N36-SHA256.json、分项before/after/未覆盖报告、每个验证lane输入hash/秒数/reused或rerunReason。时间台账区分实现/失败定位/必要测试/重复测试/打包/文档；不以首次MPP时间判断完成。

核心本地提交和source anchor覆盖全部代码与最终文案，后继docs-only可以写实身份；不固定“一张卡必须一提交”造成反复重建。两份PROJECT-STATE同步，首行和§0必须更新为实际状态，不能只末尾追加而顶部仍写N35待做。交付即停，不推送/发布/安装。

## 9. 用户最终短验与回退

只需用户约3-5分钟：四字段用安全测试profile录入/删除/恢复→IME开合和preview上下滚动→已有字幕详情/小窗互返3次，开关一次→换视频/语言后返回。保存带state/cancel/clock原因的完整diagnostic；不要求母语检验14种或看完长片。

原N35三包与N34三包不能覆盖。若N36用户实测失败，先保存代码commit/WIP和失败包，再由用户明确选择恢复N35源或N34源；规划者准备的两个脚本都会生成可逆恢复提交，保留文档与证据，不reset/amend。恢复源码不等于手机已换包，手机操作由用户决定。

## 10. 给执行者的最终检查清单

每项必须回答：原设计解决什么→保留什么目标→哪些具体分支已复现→删除/替换什么实现→after证明→真机边界。对不能input和用户某次no-caption的确切手机链，没有证据就不得写“唯一根因已手机复现”；但必须修复本卡已证明的通用机制，真实IME交互与可观测恢复不可留成纸面建议。

禁止video ID/固定时间点/特定句子生产规则；所有负样本仅fixture。无调大并发／缩短字幕／放松安全／随意提前X毫秒／禁输入／关debug／关native mask。完整交付后停止。
