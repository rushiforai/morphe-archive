# N35 完整执行卡：字幕时间链根因修复、参照真正采用及预览滚动

日期：2026-10-04（Asia/Shanghai）。**本卡已按用户最新要求重写，覆盖此前未执行的“小修”草稿；不再限制为6文件小补丁。** 单执行者按已定方案实现、验证、独立建包、本地提交，完成停。建议Codex执行；用户若选择DeepSeek，同一合同不降低、不跳步骤，也不自派下一卡。

## 0. 必须完成的目标和禁止的假修复

用户实际要求：完整理解当前字幕时间来源、解析/参照/匹配、模型event、分页、clock、UI应用机制；本次151644中首显相对页start median约275ms/部分近1s就是同步问题，必须处理。尤其下载了计时参照但native候选/实际采用为0，不能用“source estimated，所以本轮不管”收尾。预览框接触设置上缘时卡顿跳位仍需修，稳定N34可随时完整恢复。

目标：有可用真实计时证据就按其精度真正约束source；没有word时间也不能丢掉合法segment/cue边界；所有targets基于同一正确clock和当前frame绝对媒体位点应用，不添加人工平台期/用seek前样本复活。原event/strict[start,end)、正常pending/failure/物理容量保护保持。

禁止：全片提前固定200/300ms、按目标字幕字数编源词时间、把cue估计伪装NATIVE、拍脑袋去variant/改签名URL、当HTTP200就是timing_ready、放宽exact quote/数字/语义/覆盖、播放中途悄悄替换immutable source、回退N34漏显与N33设置、截图几张就宣称实际音频全部同步。

## 1. 开工身份与恢复准备（已由规划者处理）

实际E:/Projects/morphe-caption-v2。先读PROJECT-STATE最新§4ay（覆盖§4ax旧小修范围）、N35-SYNC-AND-PREVIEW-REVIEW.md（新版完整链）、本卡、N35-ROLLBACK-READY.md。

- N34源26edf555c8956e12a4b0448b72aef34597141409 / anchor/n34-26edf55；交付后继bfe5a0a83beba8c645ca1d88d06d962c1db8f1dd。
- backup/pre-n35-n34-bfe5a0a固定该交付点；N35-N34-BASELINE.json原MPP/MPE/APK完整SHA/bytes已核验。原包保留-n34，新产物-n35。
- 后续规划docs-only HEAD是合法开工，不因短hash不同暂停；tracked非docs相对N34零差异才直接施工，其他产品修改先保留/阅读。
- 状态副本repo/docs/PROJECT-STATE.md与C:/Users/14776/Documents/kimi/tasks/2026-09-29/00-35-52-ec1208d7/PROJECT-STATE.md比较SHA/bytes，无差异跳过，有差异先读最新记录再同步，不覆盖规划更新。
- 官方input patches-1.45.0.mpp SHA DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93；原YouTube21.16.256/minSdk28、product1.3.5、两root。不用已patch APK作原宿主。
- 无新依赖/工具或SDK下载、远程翻译API、下载音视频、签名正式APK、手机安装/启动/push/app_process/清数据/logclear、推送发布。允许本卡需要的合法只读公开字幕metadata/timedtext核验（不是翻译API），使用现有访问权/缓存/Cronet，不引入凭证/绕过防滥用。

## 2. 已证before与真实未知项，不让执行者猜研究策略

输入D:/HONOR Share/Honor Share/caption-diagnostics-1.3.5-20261004-151644.txt，710679B；input身份见.verification/n35-planner/input-identities.json。27HTTP/27接纳/0network failure，26blocks，额外1次block8原语义repair；没有旧hard display拒绝。

主轨manual JSON323150B，169cues/1224words全estimated；manual VTT对应一致。runtime ref json3/asr17840B，SHA f40f646a77649f9715e7722cb4561d14c81e025debc2cd949e68dcd02a452965，matched1131/eligibleNative0/实际采用0。**这不能直接证明raw没有timestamp，实际body未导出**，手机当前无ADB设备；不是借用supplied auto106667B当这次body。

已用原production额外probe7/7复现（不是after/704全量）：

1. 同video/lang的rich和coarse两descriptor只剩coarse，URL按language覆盖。
2. ref含3个显式tOffset、6词，first starts100/900/1700，但多词span全部EST，匹配6仍candidate0、source不改；真实部分时间被丢弃。
3. fresh PLAYING sample在800–1500ms平台，额外lag最高640ms。
4. 2x raw media20000@10000与hook22000@11000实际一致，却因raw差2000>1800拒绝，query11040应22080而返回22000。
5. playing seek21000@11200后旧media22000@11000仍可推到22200，epoch未随seek失效。
6. 没focus/editor输入时row attach/recycle/reattach window mode48→16→48→16。
7. 相同preview每draw newTextView/重measure，cold约232ms/warm8.5–14.2ms（测试机）。

还已查明：Raw.reference首个可parse就return、无能力selection；Controller.time不给media信息，tick才读；frame guard只重读main s.position，主线程测量期间没有tick并不“最新”；page权重是target长度估计不是音频map。

统计：119首id/page relative onset median275/p90 821/max990；多个late事件ready提前23–39s。supplied真实auto时间与manual做unique匹配1122词时差正负均有，不能固定shift（这份不是runtime参照/声学真值）。各类beforeJSON在.verification/n35-planner，旧小修草稿保存superseded-small-scope，仅历史不施工。

## 3. 实施顺序：先证据模型/参照再clock/event/frame，最后preview

同一卡分工作顺序，不生成额外执行卡：

A. 时间证据模型、raw能力诊断/可重放capture、参照候选与格式选择。
B. direct-word和partial-boundary两级源采用及confidence，source/cache/hardbreak安全。
C. event/page时间基础与完整两行单event优先，禁止假source-page对齐。
D. 单一clock evaluator、time-origin/seek epoch、frame当前时刻。
E. window lease/preview cache。
F. 真实源/时间/场景回放、704基线全量/三组合/final DEX、-n35交付。

以下数据结构/公式/边界已经由规划者确定；执行者负责实现、测试、反读，不重新选择“先忽略reference”策略。

## 4. A：时间证据保真和按能力选择参照

### A1 Evidence类型：保留实际边界，不把内部估计升级NATIVE

在RebuildSource或pure helper增加immutable时间证据：

- TimeAnchor：ref token boundary index（起点或完整段后exclusive边界）、timeMs、kind=WORD_ONSET/SEGMENT_ONSET/CUE_ONSET/CUE_END_BOUND、origin field/format/raw hash、speaker/fresh-carry标记；不同观察等级分开。
- WORD：源格式确有单词/单词segment直接offset；不等于音频forced alignment真值。
- SEGMENT：多词run的开始有直接offset，内部词时刻没有。
- CUE：独立字幕段显式start/结束upper bound，不能说这个就是每个词的声学时间；滚动展示历史不作新voice锚。
- Primary旧Word.precision NATIVE/ESTIMATED/ALIGNED兼容保留；只有直接词level映射用NATIVE/ALIGNED。内部estimated即使受reference边界约束仍ESTIMATED，并有独立timing_basis和anchored counters。

在span被tokens均分**之前**保存observed锚，再随排序/同onset合并/voice/carry安全处理映射到最终word boundary：

- JSON3读取tStartMs、tOffsetMs、dDurationMs；显式offset的多词run也保留first boundary。没有tOffset不能伪造wordoffset，但独立clean cue开始可保留CUE_ONSET。
- 若使用srv3，依据该format的p.t/s.t/d毫秒与相对起点语义读取，不能把s.t当绝对秒；复用安全XML parser，禁止XXE/external URLs。
- WebVTT用N34结构reader的合法内嵌timestamp/voice/fresh增量，保留cue边界；普通manual/SRT/XML同样保持文本和已给时窗，无runtime ref时不得新改原time。
- 校验单位、有限非负、start<end、相对offset同序/在所属窗内、overlap/rolling carry。已确定native源时间不改，未知/非法锚保留明确reason，不剪词补1ms翻绿。

before fixture的3个显式segment starts必须在afterEvidence中仍为100/900/1700，6内部词不被全标NATIVE。单word精确JSON3原结果/文字/order保持，manual VTT/JSON3无ref对照全等。

### A2 Descriptor保留与选择能力

NativeAsrTrackReference保留同video/source language的多个真实descriptor，不只Map<language,url>。沿原最多4video/16lang，**每lang最多4 distinct URL**；URL重复去重，失效/过期候选可淘汰，registry不持strong manager/Activity。不要凭text推lang或用UI/target替source；same-language先canonical exact，合法primary language alias次之。

QualityAnalyzer解析能力＋与primary的实际唯一匹配：

- body格式/raw explicit offsets/parsed word direct count/segment anchors/cue anchors；source unique matched tokens、可映射anchors、与speaker/gap冲突。
- 质量顺序按可用匹配证据：matched WORD > matched SEGMENT > clean matched CUE > NO_USABLE_TIMING；body存在很多offset但不匹配当前主轨不能算READY。
- 有相同available grade才用覆盖/新鲜度排序；不要靠bytes多、filename auto、a.en label或HTTP2xx替能力判断。
- 参照缓存命中也做能力解析。body cache与质量/采用成功分开；不要删除所有coarse cached data，不能有coarse hit就直接return结束选择。
- Raw.reference接口可增加primary参数/ReferenceSelection result保留legacy overload供旧fixture；production使用primary-aware能力selection，旧测试shadow签名更新仅适配，不落真实网络。新Source一次选定、plan前完成。

### A3 有界格式/参照协商（允许范围明确）

每reference phase维持**总1500ms deadline，最多3次网络尝试**，原cache优先；多个候选共享budget，不把每条都变成1.5s拖首译。取消/换video及时退出，NoUsable是正常降级不是让翻译Session死掉。

对真实同video/source ASR descriptor生成固定有限profile：

1. ORIGINAL_JSON3：沿原SourceFormatPolicy，仅合法fmt。
2. WORD_LAYOUT：xosf为简化显示标记且未被签时，可移除；如果有粗粒度variant且该字段unsigned，可省略该variant回服务器默认ASR（不硬编码gemini/classic名），保留kind=asr/lang/v及其他身份。
3. 最后一个机会用于其他已登记且有更好已知能力descriptor或同descriptor合法srv3 format。按已有能力信息排序，不同时试一堆参数组合。原profile已是目标profile时去重，不浪费第二请求。

修改query前检查**sparams和lsparams的并集、duplicate key/encoded key**。signed fmt/variant/xosf不能动；其他签名/expiry/cookie/POtoken/IP/caps/opi/xoaf等raw bytes不变，不重序列化不相关query、不合成新的unsigned track URL。参数协商只用于reference，主人工内容/URL不改。

只读primary源码证据：yt-dlp格式处理移除xosf，见本地excerpts；公开watch a.en variant gemini仅证明可能存在variant，不证明手机是它，不作为if(videoId/variant==某词)特例。

外部200空/403/timeout是访问失败，不是“没有词时间”；按原访问权/已有Cronet/cookie机制处理，不能新取第三方token/绕认证。完成budget仍无word/segment，则尝试已取得clean cue grade进入B的真实边界采用；完全没有安全匹配则明确unavailable，原source不改，不declare READY。

### A4 实际payload和阶段诊断可复查

debug opt-in开启时，成功且已识别的timedtext body保存原hash/bytes/format/profile/capabilities，供Save full diagnostics完整导出。不能只dumpuniform source times再猜reference本体。

- 复用bounded诊断archive独立timing channel；raw payload base64分块，每record<60000chars（建议原字节<=30000/part），有session/video/source-code/role、payload SHA、totalBytes、partIndex/count/offset。完整重组核SHA；缺part写truncated，不冒完整JSON。
- 不存signed URL/cookie/APIKey/请求headers/错误HTML；debug关闭不记正文。原reference成功payload无需追加网络为了dump；每实际hash/candidate只捕获一次、每session至多3 reference body；每payload正文cap256KiB（本例及supplied106667B可完整），超过明确capturedBytes/capture_truncated并保留原SHA，不假称全量；旧24h/channel容量保护仍在。
- archive clear/retention/export对新channel一致；UI常规diagnostics壳不读大body、不新增设置权限或对话框，保存动作原后台线程路径保持。
- 记录downloaded/parsed/matched/word/segment/cue capable/chosen/applied各阶段，特别区分word_native_count与eligibleMatched、anchors_adopted与actually_retimed。timing_ready只能对应实际可用/采用basis。
- 当前151644的f40f实际body仍缺，报告必须说“已重放相同hash”还是“未取得该旧body”；不可拿公开空正文或supplied106667冒认。新真实phoneafter会有可重放body，不因此只做日志而不实现B。

## 5. B：真正使用部分时间参照，保守局部映射

### B1 原direct-word通道保留

已有N34 unique三词、monotone matching、complete anchor/safe连续Native段和局部冲突跳过继续保留，原primary NATIVE不retime。来源必须同video/source-language，正文/token order/ID/cue归属不变。

### B2 partial segment/cue anchors通道（不能再全因NATIVE0无效）

- 使用same normalization/exact keys，已有unique三词context将ref boundary映射到primary token index。clean完整cue的完整token-key sequence如在primary仅出现一次，也可唯一映射cue两端。重复/歧义/跨speaker/gap/carry/不匹配不能猜。
- 源/参照至少有原global足够唯一证据（沿原>=6 matched words），局部segment有完整可信context或完整唯一cue；只剩一个无相邻端点anchor的区间不全片外推。
- 原primary NATIVE boundary作为不可变constraint插入。有相邻可信mapped anchors A/B，先校验observed times单调、index次序、reference同speech段、旧raw硬break。拟映射只能修改primary ESTIMATED区域。
- 公式：new(t)=newA + round((t-oldA)*(newB-newA)/(oldB-oldA))，保留原source相对时间形状。不得按target字数/单词拼写长度/固定offset决定；anchor本身使用observed值，内部仍estimated。
- 把连续相邻anchor intervals组为component，在副本里一次产生完整proposal，包括右anchor的start与前word end一致约束；只有整个component和两侧unmatched邻域合法才提交。不要只改左interval却留下原right-start形成假的gap。最后无next anchor的tail不猜，完整clean cue end只可作observed upper-bound（非speech精确结束），rolling end不可用。
- proposal必须start>=0/start<end/无倒序重叠，不裁primary已NATIVE、未匹配语音或真实speaker marker；保持原650ms source hardbreak mask。若锚间有原NATIVE或hardbreak则分组件校验，冲突跳本组件，不回滚其他安全组件，不强拼source词。
- 降级标识：REFERENCE_WORD、REFERENCE_SEGMENT_ANCHORED_ESTIMATE、REFERENCE_CUE_ANCHORED_ESTIMATE、PRIMARY_CUE_ESTIMATE。内部estimated不得为了显示native_count>0换Precision；event trace应能查start/end各来源等级。

验收必须同时证明：3个partial offset锚不丢；受锚约束的source起点实际改变或已与参照相同（分别计数）；内部词仍estimated；0wordNative但有匹配segment/cue时不再无意义跳过；冲突/重复/noTime/noMatch时原source逐字段保持。不是仅打印anchors>0、完全不用于source/event。

### B3 source不可变和cache安全

选择/锚映射在plan建立前的SOURCE_IO阶段完成；不在已播放中替换source，现有Session/generation/取消与R1/CAS许可不改。

时间变化自然生成现有RebuildCache.identity的新key；不强读旧time缓存、不清所有用户缓存。reference profile完整URL已有referenceKey保持隔离，加入能力metadata/policy版本时旧record按新能力重审。same source/no adopted anchor原identity与N34全等。

源精度/time_basis新增不误入target语言政策。correct自定义要求、RebuildApi.prompt/hash与quote/schema保护不变；源码时间合法变化引起blocks/source-timing字段/cache差异单独报告，不声称全请求绝对相同。开发只用local mock response，不远程付费翻译。


### B4 源采用后，pending/gap/显示也必须使用同一条时间轴

目前Controller.render的ready event使用s.source首末词，而p==null等待分支用originalCue(s)的raw.document.cues。source一旦被reference改时，这两条轴可能分裂，产生等待占位早/晚/短闪或错误source_gap，不能只改event正文时间。

- source尚未ready时保留raw cue作为当前唯一证据；source ready后由最终source.words派生immutable timed cue/utterance windows（同cue/相邻顺序且无hard speaker/gap的组），不把word.cue值误当raw parsed list下标。
- pending/failure占位只用当前final source所属窗并与current block求交，所有检查同displayPosition。没有owned语音时正常blank，不能为等待把整block延长或用旧raw时间持有上一句。
- source-only/native原文路径未经过ASR校正，保持原义/时序；最终translation路径source_gap/review/event/await/ref evidence都可追到最终source basis。
- 寻址/窗口在SOURCE_IO一次建立，main用有界查找，不每frame重建/扫描所有cues。缓存恢复也复用该次同source windows。测试reference使起点提前/延后、block边缘/真实gap/non-speech以及response未ready/刚ready切换，禁止两条轴各自都“合法”却互相闪。

## 6. C：event/page时间机制修复与可验证边界

- Event仍exact source from/to首start/末end派生；新增start/end timing_basis可查到word/segment/cue或estimated。不挪用邻event、引用context，不按晚到UI重写source e.start/end。
- **统一完整两行优先**：全文在首选字号/真实可用width/完整Unicode两行内可显示时，优先原event完整单页；中文不能只为偏好一行和12–18字分出按target比例的人工翻页。非中文已有合同保持，旧中文正确semantic/text/source golden保护，但旧分页shape因本新要求变化允许具名before/after。
- >2行才用N34正常semantic/Unicode切口和>=1200媒体ms容量分页，不删/概括/缩字/borrow time；高CPS/CPL仍soft，源event<1200且完整可放则一页按原窗。
- 没有可信source↔target page span映射时，多页时间只是estimated_page_timing，不能按标点序号/字符比例声称某页就是音频子句。保留合法absolute时间和权重分配，记录basis；不得凭数字/实体共现硬拼切口。
- 不加一次有偿AI时间校对/新模型对齐接口、不改Protocol输出schema/FIDELITY去满足UI；若未来需要真正逐页语义声学mapping另说明，本卡不得伪造精确数据。
- strict[start,end)和N34窗口外/owner无效/pending/最终失败/真实capacity blank保持。paused冻结、late result只当前页不重播过去，倍速按media time（1.2s媒体窗不等于2x实际观看1.2s）。

## 7. D：时钟单一时间基准与真正最新frame位点

### D0 优先复用已存在的原播放器当前时间 API（规划者已核实）

本轮已从official1.45.0与N34实际APK独立反读：app.morphe.extension.youtube.patches.VideoInformation公开静态getVideoTime()J、getVideoId()String、getPlaybackSpeed()F；app.morphe.extension.youtube.shared.VideoState.getCurrent()返回PLAYING/PAUSED/NEW/ENDED/errors。getVideoTime实际调用已绑定的PlaybackController.patch_getVideoTime，N34包中两实现者包装到原播放器getter（证据n34-actual-player-time-bindings.txt）。initialize/initializeMDX公开接口可在独立SDK35验证宿主中喂控制器，不用替换官方类。

- 新pure adapter缓存这些公开Method/类型解析，不反射private字段、不修改官方getter、不新加宿主bytecode hook/监听窗。仅在现有main time/tick/frame读取一次tuple：videoIdBefore→native time/state/speed→videoIdAfter。两id相等且等于current Session.owner/foreground id，currentGuard/epoch有效、非负有限time，才能进入原播放器级来源。缺class/binding/ref/getTime<0、id不稳/不匹配、init/hidden状态不成立则明确降级D1。
- 每新video/Source Session先用同时间基准hook/原播放器tuple确认归属，避免newId已更新但旧controller尚未替换时采纳旧时间；任何owner/epoch切换清本adapter本次信任/数字snapshot。禁止拿PlayerResponse的预取id当当前video。
- 已确认同owner的**当前直接读取**优先用于time/tick的显示位点和frame实际应用；不会因MediaSession timestamp老而只能等1秒回调。raw hook仍记录自己的confirmed/time，用原seek判据驱动generation/seek storm/取消，不把每80ms native读数喂成external hook再让稍旧hook误报backseek。Native大跳变与显式seek按同一现有生命周期处理/去重，不能出现两次seek生成或frame只换位点不清旧owner。
- explicit paused hook/small rewind仍最高优先，未被player状态/实际新位点确认前不被旧native tuple或旧media恢复；playing实际query反映当前媒体时刻，queued old hook不能覆盖已确认较新的native观察。不要调用patch_seekTo或任何play/pause操作，只读。
- frame位点读数在main测量后通过同adapter重读当前player（一次有界getter）；相同owner current time已过event.end立即隐藏。Getter耗时profile、不得网络/树扫描/循环阻塞；读取失败则用D1的合法cached estimate，不假0/无限外推。后台模型线程不得调用这类播放器接口。
- clock_source区分OFFICIAL_PLAYER_QUERY、FRESH_MEDIA_ESTIMATE、HOOK_ONLY/FROZEN；测试官方getter未初始化/缺binding、视频切换、pause/seek/收回弱controller/remote MDX fallback返回路径。只接受与当前foreground归属一致的数据，不盲称所有getVideoTime返回都是local voice。


原player可用时的输入路由必须具体、单一，防止较旧hook与新native读数互相制造seek：

1. 保留externalHook(position,receivedElapsed)和acceptedNative(position,readElapsed,ownerEpoch)两个独立观测，不把native每80ms读数写成externalHook再比较外部回调。
2. 稳定NATIVE模式中，正常playing选页/调度位点由已确认native tuple提供；externalHook用于原点确认/diagnostic，不用稍旧的数值倒写native current position。暂停中的explicit hook/small rewind按原UI合同优先freeze。
3. 在time/tick的**同一处理器**比较连续acceptedNative样本，用原250ms backward、max(2500,dt*4+500) forward规则标真正跳转，提取并复用既有seek处理块（generation/lastShown/seek-storm/未发请求取消）；不能只native换s.position而忘了生命周期。正常raw模式仍由原hook规则判seek。
4. 同一个native跳转后来由externalHook确认时只是ack，不第二次generation++；raw不一致但native仍保持另一位点时记录hook_lag/unconfirmed，不立刻把播放中的native判为旧。真实pause explicit seek仍建立fence，旧预seek数值不能覆盖。
5. NATIVE↔fallback切换以当前有效position/epoch为桥，不因来源数字不同假造seek；无法证明同基准即freeze/downgrade有理由。video/reset/真正seek清相应历史和pre-epoch snapshot，source/owner不混。
6. frame读取只检查当前owner/epoch和真实now，不在render函数递归调用time/kick或发seek；frame看到jump可先按strict窗隐藏旧正文，下一现有tick在上述处理器完成model lifecycle。这样长layout期间也不能显示错误旧页。

### D1 统一evidence evaluator（用于合法估算/fallback，不能另成第二条不一致时间链）

RebuildClock纯数字：confirmedHook@hookAt、video/seek epoch、最近raw media@updated、state/speed/captureNow；不依赖globalActivity/网络/IPC。

- timestamp用elapsedRealtime，验证known、updated>0<=now且>=epoch、media/hook年龄各<=1500ms、finite speed0<speed<=4、同player（Controller现有package验证）和owner/generation。
- PLAYING时先把raw media投影到hookAt：mediaAtHook=mediaPosition+round((hookAt-updated)*speed)，允许合法负delta（media较新）；比较mediaAtHook与confirmed，沿原1800ms容差。不是投影到now再与旧hook比，也不放大容差掩盖错timebase。
- 通过fresh PLAYING后，nowPosition=mediaPosition+round((now-updated)*speed)，删除min800平台；1500 lease不扩大，过期/未来/错epoch/无state/invalid speed不猜播放。
- PAUSED/buffering/stopped等明确非PLAYING不沿用旧PLAYING推进。fresh stationary报告可冻结真实报告位点；explicit paused hook/small rewind仍最高优先，unknown/stale走保守reason。不能让暂停/缓冲字幕按wall timer翻页。
- video reset清snapshot；真正seek的update推进time epoch并清pre-seek media，post-seek fresh sample才可再次估算。seek判据/seek storm/bounded retry/job取消本身不改；before21000被旧样本推22200 after禁止。
- 单调约束仅正常同epoch playing，不把真实seek/pause硬max成未来；对所有已支持0.5/1/1.5/2/4x验证。

### D2 callback/tick/frame都用它

- Controller.time已获取same-player PlaybackState，用同一evaluator而不是忽略media的presentation(dummy)。tick继续80ms，不新增线程/提高频率。
- clock保存最近一次可信数字snapshot；给frame一个pure currentPosition(now)方法，在现有guard有效且sameepoch时按**当前elapsedRealtime**重新验证lease/估算。
- RenderGuard.displayPosition先守currentSession/generation/visible，再优先现有pausedDisplayPosition；D0已确认且当前main原player tuple可读时用真实位点，否则用该pure cached frame estimate。不得获Session/Controller锁或新读MediaController IPC；D0那一次已审计的当前player getter不是额外UI树/网络查询。无fresh可信证据不外推。
- CaptionOverlay测量开始/完成后、延后frame实际应用前都走同一clock source优先级（原player→合法media→hook/frozen）；耗时layout期间s.position不更新也能正确判断event到期/选当前page。保留N34primary/candidate退回、再测layout/geometry有界规则。
- main queue旧show/position不能回写时钟或复活旧owner；非主线程模型结果只有合法一次发布，Publication/CAS/stop5秒barrier/cache锁契约不动。

### D3 诊断与验收

clock字段至少hookPos/hookAt/hookAge/rawMedia/updated/mediaAge/state/speed/epoch/validReason/mediaAtHook/currentEstimate；source字段reference质量、actualAnchors、event起止basis；原player取值video一致性/read elapsed/cost/state和clock_source；page字段estimated/whole_event；frame字段selectedPosition/postUptime/dispatchUptime/layoutCost/appliedElapsed/renderPosition/window/visible reason。

把这些附到**已有事件变化/页变化/真实应用**有界trace，不每80ms独立persist、不存密钥/URL、不新增日志线程。wall_time仅排序，queue用uptime，媒体用elapsedRealtime，不能混时基算误差。

119 before统计既有诊断只是项目观察；after controlled sparse500/1000ms hooks + fresh media、已readycaption且warm layout，首次event/page应用在到start后首次80ms tick＋frame预算内，不再等下个1秒hook。source时间纠正与clock延迟改善分开，不把median相加；旧f40载荷精确重放/phone音频听感未覆盖如实列。

## 8. E：预览上缘卡顿根因处理仍必须完成

- CaptionEditorViewport root WindowLease寿命改为window/root而不是可见editors数。最后prompt row回收不切softInput mode，重新附着复用；每row移除自己的listener/pendingreveal、仅有改动才restore padding。root真实dismiss/detach清lease，tokengone不强update，不持静态strong Activity/root。原IME first-tap/caret/edge-to-edge/keyPrivacy/另一window attrs保留，不抢host OnScrollListener或禁focus。
- Preview实例缓存未attached sample TextView/FontMetrics/compact/measure/layout；同sample/locale/tier/opacity/density/fontScale/reference预算反复scroll draw不重建。尺寸scene/path/gradient按size变，真实locale/theme/style/size变才invalidate。
- 原16:9/2736scale一次、五档/opacity即时联动、样例/hint/RTL/墨迹/字号和用户captionPosition保持；不引新bitmap管线/窗架构或改播放CaptionRenderSpec。
- 原“last editor detach马上恢复windowmode”错误test可具名改为root寿命；其他输入/保存/导航断言不删。实际ListView无IME快速/慢速穿preview上缘来回至少3次，window mode during recycle0次、无额外requestRectangle跳位，记录实际frame/位置/测量计数。

## 9. 允许范围与保护边界

允许生产：NativeAsrTrackReference/WordTimingReference/SourceFormatPolicy/RawCaptionSource参照链、RebuildSource与N34格式reader/必要安全CaptionDocument（时间证据、能力、sidecar/quality/partial采用）、SourceCaptionCache参照质量metadata及明确隔离（主缓存合同不重写）、RebuildController.load/time/renderGuard和必要source counters、RebuildClock、RebuildPageLayout/CaptionLanguagePager完整两行优先与basis、CaptionOverlayV2 current-clock与trace、CaptionDiagnostics/Archive bounded timing evidence/build=n35、CaptionEditorViewport/SubtitleStylePreview；必要pureJava helper与公开official player只读adapter、tests/tools/n35/docs。

这是用户已授权的完整时间接缝，不因旧“小修6文件”或N34.freeze_source再次问权限。新依赖/下载SDK工具/第三方ASR/远程翻译API/主线程IO/新全局UI/window架构/真实手机写入才是停止线。

不改：Protocol的quote/from/to覆盖/数字/semantic安全和翻译prompt/schema、provider限额/concurrency/deadline/repair、Controller.schedule/locks/Publication/CAS/cache durable/retire5秒、原650ms/speaker硬break、NativeCaptionBridge实体hook/native draw许可、N33 resolver/default/custom/Keystore/API/profile/multiselect/两root、compatibility/productVersion、字体五档/拖动保存/N27避让。

数据合法变化导致event/page/源identity变化按本卡单列，不能强抹为N34完全一样；源正文/id/现有NATIVE/硬break/语义保护必须可证明不回退。旧正确业务golden保护，代表错误时基/缺partial锚/旧分页偏好/row lease的assert具名更新。

## 10. 验证：每层有before/after数据，不用测试数替代时间链

### 10.1 参照取得与证据

- local mock原coarse+随后rich：同language descriptor都保留，先coarse可parse不阻止rich；cache coarse同理；same URL去重/4video16lang4url cap；错video/lang/expire/跨speaker/cancel、budget总1500与最多3网络calls。
- json3精确words、multiword offsets、implicit first offset0、无offset clean ASR cue、srv3相对ms、N34VTT内嵌时间/rolling carry、plain manual/VTT/SRT等；raw字段→parsed anchors→matched→applied逐层表。不把无时间数据或未知timestamp一律NATIVE。
- signed params完整raw保持测试，包括signed fmt/variant/xosf、lsparams、duplicate/encoded key。normalization profiles不硬写视频/词/时间/variant名；主source request URL原样。
- supplied manual/auto对照、既有191word directalign、安全段＋中间冲突、部分锚100/900/1700 + 内部estimate、coarsecue全唯一与重复、no match/no anchors/无ref、全NATIVE、speaker/gap，文本/id/order/单调/真实precision完整。
- timing debug multipart capture >60000 chars载荷，完整export重组核SHA/缺块标记/debugoff0/clear和retention；UI无大payload阻塞，URL/key/cookie泄漏0。
- 当前f40未取得不得冒称重放；如仅真实公开访问200empty，记录访问限制，不作为能力/采用成功。已有不同106667样本仍可机制回放。真实新phoneafter应直接能导出body/质量/采用，为最终参照使用签字补证。

### 10.2 source/event/page与clock/frame

- 同manual VTT/JSON3无ref时169cue/1224word/Planner/request/cache identity相等；相同参照同结果；source timing变更另存再生block/event，strictquote/旧response负例仍正确reject。全目标source同时间basis，不依UI语言。
- source原点偏移正/负样本，都按局部observed anchors；不得把median230ms全部减掉。起点/终点来源可查；无second anchor的tail不外推；主NATIVE/硬mask不改。
- 中文全文2行可容纳与各12非中文对应完整event单页；真正>2行多页完整text拼接、>=1200媒体ms、Unicode/RTL边界和estimated-page basis。对齐Source句段不意味着target每page语义精准，不能以标点数zip伪证。
- clock：800/880/1040/1200/1440/1501ms，sampling origin前/后、0.5/1/1.5/2/4x、invalidspeed/future/stale/wrongepoch/package；pause/buffer/resume/stop/unknown，明确seek＋延迟旧state、小paused rewind/video/target切换。
- 真Controller.time/tick优先actual official player tuple，再sameMediaController估算fallback，用提前readyresponse在稀疏hook但原player实时推进时跨source/page边界；getter缺binding的freshmedia/无证据fallback也必须通过；假Clock函数passed不代替整个选页。
- 主线程测量/queue延迟250–500ms（受控virtual clock，不用长sleep）期间currentframe estimate实际推进、exclusive end隐藏/当前下一page选中，禁止s.position不变就当重新检查完成。invalidatedsource/oldframe/oldcache不能恢复。
- first/last/end-1/end/rowgeometry reflow/全屏返回、PIP/hidden/恢复、sourceGap vs actualAudio边界、live或带X-TIMESTAMP-MAP的输入单位/原点：若没有可验证player基准映射必须明确unsupported_time_base不猜绝对偏移，不把VOD fixture假冒所有live已覆盖。
- 基础14targets en/zh-Hans/Hant/es/fr/de/pt/ru/ja/ko/ar/hi/id/vi，代表RTLltrmixed/Indic/emoji/中含Latin数字，freeze/seek/clock和证据采用共用；母语语义不由这矩阵自签。


### 10.2a 误差分层对照（必须，避免改时后统计偷换）

四条针对性lane，而不是四次全项目大测：

- L0：固定原manual source/原response/原page时窗＋N34clock/frame，保存before。
- L1：同一source/event/page固定不变，只启新原player/clock/frame，比较相对**同一起点**的UI lateness与queue/layout阶段，证明275ms层面的软件额外延迟改善。
- L2：同一播放真值/clock，启新的reference/source时间，比较已知word/segment/cue锚偏差；模型event仍exact source归属。若源blocks变化，用合法fixture response按新owned范围回放，不能强套旧block id或偷偷切译文。
- L3：新的source＋完整两行/event/page策略＋新clock/frame，原ready/pending/已过期/转场全流程，显式记录每层basis。

page形状/time源变了不能直接把新median与旧119页median算同口径性能改善；source/ref对音频的精度、model event grouping、page估计、应用额外迟到分别报告，多个median不相加。无声学音频标注只证明源码时间证据/控制fixture和用户听感，不自签所有音频完全贴合。

### 10.3 preview/旧回归/最终包

现有704全量、Python27/27/发行11/11、原400并发/5s barrier/同key/R1-CAS/N34 strictowned回归，不改正常语义/quotes/数字/字体/配置。重跑真实分母，errors/failure/skipped0，旧assert差异具名记录。

N33日语setting navigation/multiselect/API/model/save localmock一次真实SDK35 smoke；N35实际setting fling/preview warm cache＋真实currentclock/expiry/layout-delay字幕代表从最终DEX/resources运行，明确emulator serial，正式unsigned与模拟器测试签名副本分开。

finalAI-only/Remember-only/both3组合、MPP embedded MPE=独立、全部root DEX branch/API/hook/资源/aapt/metadata/39official settings methods按原入口审计，实际patch count按当前selection报告（N34历史92）。新类型不得含fixture/官方替换，N27/31/32设置hook仍无。冻板4/4/4、invisible0/ACCEPTANCE历史不改，新live另存。

不root clean/覆写旧frames/扫描281140旧临时文件做无意义重研究；至少N34原三包/official/N33final/冻结hash保持，旧failed证据/包不删。新环境输出统一n35，不复用硬写n34路径导致覆盖。

## 11. 交付、未覆盖边界、回退与停止

- build/local-test/patches-1.3.5-本地测试包-n35.mpp
- build/local-test/extension-1.3.5-本地测试包-n35.mpe
- build/n35-composition-final/YouTube-21.16.256-本地测试包-n35-unsigned.apk
- docs/N35-LOCAL-TEST-BUILD.md，.verification/n35：候选/格式能力与reference真实采用表、source/event/page/clock/frame每层证据、实际sdk35/root-lease/preview、SHA/bytes/旧assert/限制。

一个local实现commit＋anchor/n35-<真hash>，可docs-only身份补记，源码不得amend/push、source与anchor相等；状态两份同步保留最新管理段落，工作区仅official未跟踪。完整SDK/全量/审计通过只能称机制交付，不冒认旧f40真实body或phone音频全对齐。报告必须直列word/segment/cue参照实际采用和未取得证据；不能仅写“reference下载成功、沿用估计”满足目标。

失败/需架构越界先WIP localcommit＋backup/n35-trial-<hash>，保留-n35候选/失败后停。可同一卡交Codex接手，或用户决定后运行docs/N35-RESTORE-N34.ps1（已准备并InspectOnly测试）：备份当前trial，restore全部tracked非docs到N34，新revert提交、保留docs/包/证据、state两侧同步；无reset--hard/删除试验/清手机数据。

用户after短验同慢片段30–60秒（含一处子句/页切口）、pause/seek/fullscreen返回，无IME穿preview上缘快慢各3次，保存full diagnostics（本轮新增timing body/capabilities）。如果真实ref仍不可采用，需明确是访问/quality/match/unsafe时间的哪层，不把这当“正常就不用修”或自签同步已好；不自派N35r/N36。
