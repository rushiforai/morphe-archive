# N37 执行卡：小窗即时隐藏、暂停时钟一致、设置无阻塞绑定与压力验收

日期：2026-10-05（Asia/Shanghai）。单执行者Codex或DeepSeek；完整完成本卡后停止，不自派N37r/N38。推荐Codex处理C的UI/异步snapshot。

## 0. 目标、基线和开工判据

用户四项：①小窗转换后旧字幕立即消失，快转场不能回退；②最新位置为“字幕样式”标题与预览框上缘之间的跳位卡顿；③审阅本次压力测试，修机制问题；④暂停不能因旧时间退回上一句，真实往回seek仍可用。

先读N37-N36-REVIEW-AND-REPLAN.md与最新PROJECT-STATE。规划者已查原设计目标与根因，执行者按本卡实施，不再只改预览缓存/固定时间偏移/延长超时。每项交付回答原目的→保留目标→具体分支→替换实现→before/after→边界。

- 唯一仓库E:\Projects\morphe-caption-v2。
- N36产品 6319fd69900b1f08b231b14161713021d0fb616d；完成 3bf88d2c0047bb1ecd88f4389ec42627bc219aa9。
- anchor/n36-6319fd6=6319fd69900b1f08b231b14161713021d0fb616d；anchor/n36-final=3bf88d2c0047bb1ecd88f4389ec42627bc219aa9。
- backup/pre-n37-n36-3bf88d2=3bf88d2c0047bb1ecd88f4389ec42627bc219aa9；旧N35/N34标签、回退脚本和三包保留。
- N37-N36-BASELINE.json包含产物/input/原输入身份；N37-RESTORE-N36.ps1只InspectOnly验证，未恢复。
- **docs-only后继合法**：HEAD为N36后继、与产品6319fd69900b1f08b231b14161713021d0fb616d比较的非docs文件无差异，则按实际HEAD施工，不因新增卡/状态文档误停。保护用户原未跟踪patches-1.45.0.mpp。
- 两份状态读入核对，已有管理更新保留并合并；禁止整文件盖回旧副本。保存工作/失败证据，不reset/amend/删历史包。

## 1. 原输入、before证据与权限

诊断D:\HONOR Share\Honor Share\caption-diagnostics-1.3.5-20261005-084534.txt，3,824,470B；包含N35旧历史，分析用.verification/n37-planner/084534-n36-history.json的已确认N36区间并注明起点。用户补充“字幕样式与预览框之间”优先于早前描述。

物理手机ASQHUT6422001234本轮只读：已取logcat/dumpsys/gfx和现有APK。390个自有类方法身份与正式包一致。采集时前台不是设置，窗口累计jank不是边界现场栈。**本卡不安装/启动/触摸/改设置/push/app_process/清数据/签名实体手机。**用户最终自行装机after。已有emulator-5554的SDK35可测试独立签名host，正式APK仍unsigned；必须明确serial，禁止adb默认目标。

无远程翻译API、无新依赖/工具/SDK下载。测试使用原official设置/原资源/生产DEX，不能用HTML或纯setText替代Android交互。

before无需重跑整N36或重建原包，已保留：

- mechanism-before-01：实际回调进入COMPACT，原showEvent anchor仍VISIBLE；官方paused28290但旧media27922获freeze优先；mixed compact type行为。3条，后者是分类观察，不能凭substring猜转场方向。
- settings-binding-before-01：SDK28/35同Locale setter仍requestLayout，2实例。
- preview-bind-before-01：同输入、暖预览的外层getView仍isLayoutRequested。
- diagnostic-ui-before-02：收起诊断行普通getView，主线程等归档FIFO；完整栈已保存。
- request-count-before-01：四调用可以是两focus+两prefetch、四block各一次；不是原full失败身份台账。
- 真SDK35自然滚动已测，无canvas.requestFocus。旧模拟器1500×2400/density480不同于手机1264×2736/density560；本轮对照手机几何后已恢复原override。

探针在.verification/n37-planner/probes，只作因果证据，不抄成after证明坏行为。

## 2. A：许可否定必须撤掉已绘制字幕

N36正式入口不再走Overlay.setPlayerType隐藏分支；Guard的COMPACT分支没有hide，WATCH/tick只停止未来render。补上**许可否定的View副作用**，保留Authority及N36转场减负。

1. 唯一authority/guard主线程提交中，进入COMPACT、有效compact transition、CLOSED或owner失效：先作废该owner的queued render/恢复任务，再同步隐藏其已绘制anchor、结束未完字幕拖动。状态否定后下一绘制帧不能有旧字。
2. 仅常数时间View操作，不能refreshSurface/查树/measure/分页/读API配置/网络/KeyStore/等待barrier。
3. 可用INVISIBLE降低parent重排，须证明不绘制、不拦触摸、不留accessibility/focus幽灵；普通event过期/清Session的原隐藏语义保持。
4. 不清接纳计划/pending event/cache/保存位置。恢复REGULAR时原guard确认surface，选择当前合法页；过期句不复活，不为恢复重新翻译。
5. 隐藏比较owner epoch，旧Activity不能藏新字幕。off-main回调主线程首次接纳即隐藏，不能等句末/80ms轮询。state修改归主线程，off-main捕获epoch须有可见性保证。
6. 正式HookV2→inner→Controller→Guard必须after验证，不能只改未被调用的Overlay.setPlayerType。
7. 同owner同批outer/inner责任按OR合并；新owner/batch重置，不能最后inner覆盖outer。无新宿主hook、无官方class替换。

**A验收**：真实短句/长句/翻译中三种，zh/ja/ar；正式MINIMIZED/HIDDEN/PiP/实际sliding枚举，立刻断言anchor not-visible/触摸0，再推进clock/句末。state变化本身不算显示验收。重复通知、旧owner迟到、close、快速MIN→MAX→MIN，回来只当前window。扫描/measure/key解密不增加，快转场保持。

## 3. B：暂停冻结消费同一组选中播放证据

position(s)先选native，但PAUSED又freeze rawMedia；time(ms)先算新presentation又freeze hook ms；displayPosition优先freeze，形成更高优先级旧时间通道。

1. 复用或增加一致Observation：position/state/speed/sample origin/time/owner-video/clock-seek epoch及选源/降级reason。
2. 保持合法native优先，不可用才合法MediaSession、再hook/frozen。**position和state同源**，不能native position配旧media PAUSED，或native PAUSED配旧rawMedia position。
3. position/time/displayPosition/frame与paused调度门消费一致证据；已计算的regular/presentation为native时freeze取它，禁止另取未胜出的raw/hook。
4. 进入暂停建立一次owner/video/session/epoch绑定freeze；旧低优先级报文不覆盖。重复读稳定，不因±16ms报文抖页。resume/video/owner/stop使freeze失效。
5. **真实暂停seek及时有效**，包括小幅往回，以合法当前新时间更新freeze；不能Math.max(lastFrame,lastPage)或page单调。native不可用时保留原明确hook seek降级；不将1.5秒阈值机械当所有来源真实性判据。
6. 保留seek只登记一次/generation、old epoch拒绝、1500ms freshness与采样原点；source/ref/event/page/cache身份不改。不加固定偏移、延后下一页或延长暂停句到原窗外。
7. layout后guard仍取当前合法clock；选event/page与actual render不能新旧双时轴。
8. 真native暂停位置较早或实际seek须反映真实时间，不为了不回退显示未来句；验收拒绝的是旧低优先级证据回滚。

**B验收**：诊断28290/27922、32235/31861、43120/43060只作fixture；无seek、native paused不变时旧media/hook不能换上一句。边界前后±20/100/400ms，1x/1.5x/2x，native playing+stale media paused、反向、native不可用、fresh/stale media、jitter、explicit paused seek、seek后旧样本、resume/owner/target/video切换。用真实adapter/Controller入口，至少中文日语阿语。旧raw-only pause测试区分native有无，保留jitter/小backward目的不删不弱化。输出temporal ledger。新增一次pause状态/异常选源字段，走有界writer，不每80ms重复。

## 4. C：诊断snapshot和幂等绑定，解决标题／间隙处整页卡顿

### C1 UI热路径不等待归档

1. DeepSeekDiagnosticsPreference的onCreateView/getView/refreshCaptionText/TextSlot supplier和preview热路径只读**已脱敏有界内存snapshot**；不得drainNow/Future.get/扫目录/格式化整历史/KeyStore/完整config load。
2. 默认收起不计算全文。普通滚动不触发report IO，不能为保持最新把读取塞进每次语言binding。
3. 后台writer/有界report lane生成immutable/volatile snapshot，管理app/profile/clear epoch与locale格式版本。无snapshot显示“正在读取诊断”而非无请求；如新增UI文案，14locale/catalog/source keys/fallback同步。
4. 展开/显式refresh立即显示最近安全snapshot/读取提示，后台读取格式化，主线程一次更新。合并重复refresh，callback核对weak View/root-window/attach/request/locale/clear epoch，不借别窗/旧结果盖新语言。
5. pendingSummary来自raw queue，**不能直接当已脱敏UI snapshot**；不得raw凭据/签名URL上界面、剪贴板或磁盘。保留N36指纹与旧profile脱敏。
6. fullText/export仍后台等待完整性barrier，不能省掉旧记录。保存本来后台保持；复制最近完整panel snapshot，首次loading不可当报告。
7. clear主线程仅撤销snapshot/队列epoch/UI请求，物理清理后台；旧写入不复活，UI不等30秒。验证旧断言用background report/helper，不恢复生产UI阻塞。
8. appendSummary/readSummary目前append整历史再扫全目录；改有界最新slot/尾读索引并检查epoch/原子完成。旧history/quality/timing/失败证据不删不改；旧summary后台一次迁移/有界尾读，不截完整export。
9. 面板语言只影响可见标题说明；程序raw英文，源/译文原样。N33字符串Context不逃出读取，不改窗口Context为资源Context。

### C2 同值不再次破坏TextView布局

- CaptionTextResolver.direction：direction/TextLocale(s)实际变才setter；同Locale再次setter已证明requestLayout。
- CaptionSettingPreference.TextSlot.refresh/refreshRow：安全CharSequence/TextUtils等价判断，有变化才setText/setHint；真实span样式、locale/profile/user变化仍更新。
- 合并一轮getView内重复slots刷新；不跳过native必要enabled/summary/navigation，不替换official adapter/OnScroll/Insets listener。
- 暖preview外层row同输入重绑定无layout请求，真实字号/宽度/locale/config变才重建。
- 4个editor ID、bound profile/revision、default/custom保护、composition/selection不退；不得每次重绑setText/改focus遮住跳位。
- 档名若trace仍证明长任务：宽高测量放onMeasure，按locale/字体/density/width key缓存，onLayout只放置；不每次new5TextView或增长minHeight。保留坐标、RTL唯一映射、不裁切/省略、两轨道相等。
- 首绑定允许必要测量；禁止固定height剪字、关动画、挪走预览/禁滚动过关。

### C3 硬场景验收

- 真SDK35/原official设置/资源，**带长期日志工作量**（已脱敏本诊断或等量synthetic）；不能只有空日志host。archive受控backlog，collapsed getView不等待；展开/刷新后台完成后内容完整。
- 收起/展开，zh/ja/ar，font1.0/1.3；自然焦点及曾编辑prompt后IME隐藏。**不canvas.requestFocus，不给preview抢焦点**。
- 手机1264×2736/density560和320dp窄屏；慢/快拖/fling各3次，真正让“标题→间隙→preview上缘”越过ListView上界。记录viewport/Insets/first-top/相邻row高度-identity/focus-IME/dataset/layout-measure/frame成本/reportIO；未经过边界不算。
- main该场景report barrier/read/drain/redaction/key解密0；同输入文本/Locale重复setter/额外layout0；行高稳定无非手势跳位。注明测试机与OEM边界，不把累积数称现场fps。
- 归档阻塞期间手势仍能完成；释放仅当前panel接受结果。销毁/换语言/clear/二次refresh旧结果不复活；export仍全记录且正确脱敏。
- OEM若仍跳，沿同计数/有界trace定位剩余调用，允许共享设置链最小修复，不能再只塞画布缓存宣称完成；没有手机现场不谎称其唯一分支已复现。

### C4 旧IME测试缺口必须补成有效验证

N36 static InputConnection在IME的:ime进程，instrumentation读另一份static。这是测试设计问题，不是平台不能commit。既有test IME加仅test包的命令/ack：服务本进程用平台提供的真实InputConnection执行composing/commit/delete并回传，instrumentation核对实际EditText和保存值。不可setText替代；测试组件不能进正式包。

4字段至少一轮真实输入/删除/paste、prompt中日composing、scroll recycle重开、profile切换，用dummy profile/key、不触网。尤其C2不能破坏N36稳定身份；不要求用户重读14语言。

## 5. D：压力、类别对账及原n24失败

### D1 错误分类

本段2条明确cancelled而总表cancelled0：TransportFailure统一network_前缀，Audit先network再cancel。改显式互斥category：CANCELLED/DEADLINE_EXPIRED/CONNECT_TIMEOUT/READ_TIMEOUT/NETWORK_IO/HTTP-CONFIG，不用network前缀吞取消/截止。

保留timer事实/主动取消/finishSent，真IO不伪称cancel、close不伪称deadline；旧job不影响新。新分类改增量，旧累计不猜测重分配；attempts/success/total failure/tokens可对账。fixture取消/deadline/readtimeout/socket至少4类。

### D2 REUSED边沿记录

本段1310条REUSED/merged0。按session/request/block/lane/generation状态变更记一次，累计重复次数；不要仅queue tail能合并就宣称其他交错重复已合并。总重复/drop可导出，开始/send/response/rejection/cancel/首显/owner变化保留；不重回同步日志。

### D3 失败测试先记录请求身份

N36 full为716/1fail，不可当成功。保留fail XML/原断言，原场景记录Mock请求session/block/purpose/requestID/time/cancel/publication。判断合法prefetch、同block重复、跨测试遗留。

- 合法预取：fixture计数明确focus与prefetch，用可控门锁定观察阶段；保留focus不重复与prefetch/总额约束，不机械2改4，不sleep/放宽deadline。
- 同block重复或跨测试遗留：修真实生命周期或fixture cleanup，保留负例。不每类独立JVM/skip/mute/再跑绿掩盖。
- 本轮before证明4可能是4个不同block，不代替原full身份调查。
- after保持focus2/prefetch2/总4、30s lookahead、空闲focus机会、pending landing合并和retry/semantic/过滤合同。

### D4 数据与回放

已确认N36区间42请求/39response/2cancel/1未结束；slot max67、source queue max15、network中位4070/p90 4916/max6518ms。没有证据要求增并发/延deadline/改预取。local stub交叉seek/pause/resume/target-video/MIN-MAX/带cache开关/旧response-failure；请求可对账、不重复、旧结果不盖新，真失败安全空白。A/B跨语言机制一起覆盖。

## 6. 允许与保护范围

允许最小必要：Authority/Guard/OverlayV2/现有Hook隐藏-owner责任，Controller与Observation/Adapter/Clock的pause统一，Diagnostics/Writer/Archive/DiagnosticsPreference的snapshot，SettingPreference/TextResolver/Preview/必要Slider测量，Api/TokenAudit类别，测试/薄工具/记录。其余editor仅必要稳定绑定回归，不重构窗口/导航。无新宿主接缝/app.morphe replacement。

冻结：N35参照/partial retime/source安全、event/page/semantic切口/容量与cache身份，prompt/schema，Cache Publication/CAS/锁/5s后台barrier，focus2/prefetch2/总4/deadline/attempt/费用，N33十四语言-default/custom-导航-两roots-自动语言menu，profiles/prefs/Keystore保存删除，位置/字高/16:9/Shorts，ACCEPTANCE/frozen4/4/4与invisible口径。N27不恢复。官方1.45.0/YouTube21.16.256/minSdk28/1.3.5不变。新loading文案14语同步；videoID/句子/时间只fixture。

## 7. 验证效率与正式交付

1. A/B定向→C真实UI/阻塞snapshot→D身份分类；失败只复跑关联，保留证据。不整N36开工仪式。
2. 首命令既有JDK21/--offline/watchdog，不JDK25试错/下载工具。没有真实IME ack和自然边界证明不可声称通过。
3. 稳定身份**一次最终全量**：保留N36 716业务目标加新回归，failure/error/skipped0，数量看XML；旧口径修订附before/合同，不删失败。Python27/27、发行11/11、实际keys×14/frozen同口径。
4. 同源/资源/参数/input证据复用，docs-only/anchor不重跑/重建。新实质改动才失效关联。共享中文日语阿语＋现有全量，不母语全表。
5. AI-only/Remember-only/both仍真实composition；正式both APK一次。MPP自身组合、内嵌MPE一致，11DEX/类型/分支/接口/资源/CRC/aapt/unsigned真实审计。
6. **不能继承N36 final_checks“产物/目录存在=通过”弱判据，不能assert ... or True**。actual COMPOSITION_PASS/auditor exit/status与日志绑定最终SHA；全量明确fail/error/skip0。必要安全闸不省，但不堆重复。
7. 原N36/N35/N34包和input哈希核对一次，Git保护文件，不扫几十万history。-n37包，完整SHA/bytes/source anchor/验证身份/时间lane。
8. 包必须含最后代码；candidate/正式分开。未过硬闸保留候选/WIP与失败报告，不称完整正式交付、不自派修订。完成本地提交/状态同步，首行/§0/最新段均为实际N37，保留规划管理更新。

## 8. 用户after与回退

最后3-5分钟：有字详情→小窗立即无字、回来当前句3次；最新标题/间隙位置慢快拖3次及IME后隐藏滚动；两句边界暂停/续播与一次暂停往回seek；快速换视频/target/带cache开关；完整diagnostic。无需14语言母语表。

N37-RESTORE-N36.ps1可逆恢复，N35/N34旧路径保留。先保存失败试验WIP/commit与包/证据，再由用户明确选择恢复。不reset/amend/删证据/清数据/签名/安装/推送/发布；源码恢复不等于手机已换包。本卡完成即停。
