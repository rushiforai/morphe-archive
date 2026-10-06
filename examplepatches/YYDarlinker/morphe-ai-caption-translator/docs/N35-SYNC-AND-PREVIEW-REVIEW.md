# N35 全时间链审阅：参照真正采用、时钟一致性与预览滚动

日期：2026-10-04（Asia/Shanghai）。**用户最新要求已取消“小修”限制**：完整审查字幕时间各层机制、对应本次诊断的具体问题、找到代码根因后给执行者明确方案；尤其必须处理参照下载成功却无有效采用的问题。仍保留预览上缘卡顿与N34可逆回退要求。本文件和重写N35执行卡替代未提交/未执行的小修草稿，旧草稿保留于.verification/n35-planner/superseded-small-scope，不进入产品。

## 1. 结论：延后由不同层组成，不能统一提前字幕或只修800ms

N34修复漏显成立；151644没有记录旧CPS/overflow/hard presentation拒绝。但时间问题至少有以下独立机制：

1. 人工cue内按词均分造成源词估计误差；实际参照没有变成有效时间证据。
2. 同语种参照URL覆盖、首个解析成功即返回、无能力验收，可能把粗粒度载荷当可用计时参照。
3. JSON3多个词共享显式segment timestamp时，解析丢弃已知边界；没有完整单词NATIVE不代表没有可用的片段/句段时间。
4. 模型event使用源首末词时间，故继承这些估计误差；目标分页按目标长度分时，不能当真实源子句音频对齐。
5. clock有800ms人为平台期、不同采样时刻直接比较、seek前media样本复用，以及callback/tick证据不一致。
6. N34“测量后读最新位点”仍读main线程更新的s.position；主线程测量期间没有tick更新，读到的可能还是原值。读volatile不是取得新的媒体时刻。
7. 预览上缘卡顿有独立root-lease与每draw重建的证据，不能拿时钟修复代替它。

这些需要按数据来源→时间证据→事件→页→clock→UI应用逐层修，而不是改固定字幕offset或回退已修好的漏显/严格窗/设置。

## 2. 本轮诊断与证据边界

- N34稳定源26edf555c8956e12a4b0448b72aef34597141409 / anchor/n34-26edf55，交付docs后继bfe5a0a83beba8c645ca1d88d06d962c1db8f1dd；当前产品未改。
- 输入151644txt710679B / manifestn34/official1.45/presentation_revision n34-owned-display-v1，2165history/27quality、27HTTP成功/27接纳/0network failure，26blocks，仅block8原片段语义风险多1次。N34原三包bytes/SHA独立核对一致，见N35-N34-BASELINE.json。
- 119个first(id,page)可见应用观测（排除merge），relative page_range.start差值median275/p90 821/max990ms。它是已有媒体窗与UI应用位点差，**不是音频波形实测的固定275ms**，geometry reflow也可能影响个别页统计。
- 大部分延后的译文提前几十秒ready；first-caption事件accepted-before-apply median30438ms，delay>=800的多条ready提前23–39s。重译/增并发不解决这一迟到。
- primary manual JSON3 23150B / SHA505c5a99…与已提供VTT169cue/1224词一致；全source仍ESTIMATED。runtime ref json3/asr17840B / SHAf40f646a77649f9715e7722cb4561d14c81e025debc2cd949e68dcd02a452965，matched_words1131/native_candidates0/adopted_segments0/aligned0。
- **校正此前口径**：native_candidates0只说明当前匹配集合里没有符合N34单词NATIVE条件的可采用候选，不能推断原始payload一定没有时间字段。该17840B正文没有导出，手机本轮未连接（只读adb devices无设备），无法直接区别“字段不存在”“字段存在但多词降级”“有NATIVE但不在匹配集合”。必须补齐可重放实际payload与能力诊断，而不能猜variant后自称查清。
- 本轮只读公开watch取到同视频asr a.en描述，variant=gemini；对应匿名caption请求均200/空正文，原fresh expiry未过。它是**不同于手机的公开web描述**，不能证明手机也有这个variant、更不能把200空当无时间信息。无用户cookie/签名URL持久化，结果仅保留可读flags、HTTP/bytes。
- yt-dlp当前原源码在字幕格式生成时移除unsigned xosf（issue13654相关）；这是格式协商的一手参考，不是本例17840B的确诊。源码没有提供“所有gemini都缺词时间”的证明，本卡不硬编码variant名或视频。

## 3. 原机制逐层对照

| 层 | 当前代码 | 本次暴露/已复现 | 修复决策 |
| --- | --- | --- | --- |
| 主轨取得/缓存 | RawCaptionSource.load、SourceFormatPolicy.json3、SourceCaptionCache | 人工内容正确，不能换成ASR文字 | 主轨/签名/文本保留 |
| ASR描述登记 | NativeAsrTrackReference Map<video,Map<language,url>> | 原生产probe两同语种variant只剩后者，前者丢失 | 同源多候选有界保留 |
| 参照取得 | RawCaptionSource.reference第一条loadTrack可解析就return | HTTP/parse成功被误当参考可用；没有质量选择/继续尝试 | 按matched时间能力选，零能力不宣告READY |
| 参照缓存 | referenceKey按完整URL，但coarse成功也缓存 | 载荷缓存可复用；质量未验证就结束选择有问题 | 每次capability校验；质量与下载成功分层 |
| 源时间解析 | RebuildSource.read/add：nativeOffset且tokens.size==1才NATIVE | probe显式3个offset/6词，matched6但native0；边界全部丢弃 | 保留独立word/segment/cue边界证据，不能伪造词时间 |
| 参照匹配/采用 | unique三词、NATIVE-only连续段、边界冲突跳过 | 真实匹配1131却候选0；partial时证据不能利用 | 精确匹配与安全段保护保留，增加边界锚约束估计通道 |
| 事件/等待时间 | ready event按source词时间，pending仍original raw cue | 采用参照后可能两轴不同；当前aligned0故未触发 | 最终source生成同轴timed windows，raw仅尚未ready时用 |
| 分页时间 | 中文优先旧成功plan、allocate按目标codepoints；非中文权重/1200ms | 目标长度分时不是音频子句定位 | 完整两行整event优先；超容量估计页明确标记，不伪称同步 |
| 播放位点 | RebuildClock、Controller.time/position/tick，未使用官方当前player API | 原生产3个clock负例＋入口不一致；N34已有原player getter绑定 | 原player读取优先，统一time基准、去平台、seek epoch、最新frame |
| UI应用 | N34guard supplier只读s.position | main排版期间值不更新，严格窗可用旧时刻 | frame时从可信snapshot按elapsedRealtime重算，测量后复核 |
| 记录/验收 | DISPLAY_RESULT、source alignment汇总 | 缺raw offset/cue/parse能力与clock样本年龄 | bounded原载荷/clock阶段数据，源码与手机证据分开 |

## 4. 源时间估计的方向并不固定

将本次event源ID与此前supplied auto JSON3的原生产word时间按同一unique三词算法对照：1131 matched，1122 matched NATIVE。manual_start-reference_start：词级median230ms，p90 1007，min-1709/max1704；83个event起点可匹配，median49ms、p90 588、min-1709/max1257。

例如事件22–38，manual10348、suppliedASR9760；39–49，manual15617、suppliedASR14360；184–189反而manual58352、ASR58760。**既有正偏又有负偏**，所以不能全片提前固定量，也不能把median230与UI median275直接相加当音频差（统计对象和资料不同）。这证明源码内估计本身需要时间参照，不能只修软件clock。

supplied auto106667B不是runtime17840B，也不是音频forced alignment真值；它是可独立重放的高精度字幕输入样本。实际phone载荷须保留能力证据补验证。

## 5. 参照链的详细修复设计

### 5.1 多候选、能力选择、有界协商

保留同video/source-language下多条真实ASR描述（包含不同签名/format/variant，exact重复去重），每lang最多4、沿原4video/16lang bounded registry，不能只以language覆盖。当前原生模型与source语言优先，不能用UI/target语言猜ref。

候选取回/parse后检查：raw explicit offset数、单词直接时间数、segment/cue边界数、唯一匹配/eligible锚数、冲突数。优先匹配主轨的真实word/segment锚；仅有coarse cue则进入单独质量层，而不是伪称native reference。HTTP/JSON成功无可用匹配时间则继续有限候选或协商，最终清楚降级原因。

同一reference phase沿用1500ms总预算（多个候选共享而非每个各1.5s），最多3次网络尝试，cache检查优先；禁止长时间拖首译/无界循环/跨播放中途偷偷换source。仅对参照链允许格式协商：json3；如xosf标记确为unsigned、移除该简化显示项；如原ASR variant粗粒度且variant未被sparams/lsparams覆盖，可尝试“省略unsigned variant”的默认ASR profile，**不是指定gemini/classic字符串、更不是构造新track URL**；必要可用同descriptor合法srv3 format。任何被签字段（v/lang/kind/caps/expire/signature等）及nonallowed查询raw bytes保持。

没有质量足够候选仍合法降级，不能把正常翻译一并失败；但标downloaded_coarse/no_usable_timing不能宣告timing_ready。真实API/cookie/防滥用错误按原访问权处理，不新造POtoken、不绕权限；公开匿名读取空正文不是开发者猜测词时间的许可。

### 5.2 同时保留词级与边界级证据

read必须在多词span被均分前记录TimeAnchor（boundary word index、observed source ms、WORD/SEGMENT/CUE start或cue end-bound、字段路径/format/原始hash、speaker/fresh-carry性质）。JSON3 tStartMs+tOffsetMs、srv3 p.t+s.t、WebVTT内嵌timestamp用自己的单位规范，不互猜；未独立测出的内部词仍ESTIMATED。

对3个含2词的timestamp segments，至少留下100/900/1700三个实观测segment starts；不能把6词全部NATIVE，也不能只因6词全EST就把这3个边界抹掉。CUE时间是字幕段边界观测，不能说它就是声学词级时间。滚动carry/重复显示帧不能当新话语anchor。

### 5.3 确定性的两级采用通道

- 完整单词时间仍走N34 unique同序匹配、安全连续native段；不改主轨文字/id/既有NATIVE/硬speaker和源断点。
- 部分segment/cue anchors由相同source键唯一匹配映射到主轨boundary index。仅同video/source-language、单调唯一、非carry、无真实冲突可用；whole-cue exact token sequence唯一匹配可作为coarse fallback，禁止fuzzy删词或仅按相同数字对齐。
- 使用相邻可信锚的已观测time作为端点，在两个锚之间原ESTIMATED区间作局部分段映射；保留原相对源时间形状，使用new(t)=newA+(t-oldA)*(newB-newA)/(oldB-oldA)，整数单次取整。这里是在真实锚之间约束估计，**不是目标字符分配，更不能标为所有词NATIVE**。
- 原NATIVE边界插作不可改约束；相邻interval组成组件，先整体验证再局部提交，避免修改左段后留下右anchor gap。无第二anchor的范围不外推；完整clean cue end可作为observed upper bound但不能谎称speech结束，滚动/重叠end不作词end证据。
- 严格检测边界/内部单调正时长、unmatched邻域、650ms原硬gap/speaker保持；任何冲突只跳该组件，不裁/挪未匹配音词或全片shift。并不保证所有锚能采用，使用/拒绝原因必须有具体数据。
- 记录word_native_aligned、segment/cue_anchors_applied、reference_anchored_estimated_words等分层计数；原timing=estimated/mixed/native按真实词精度，不把cue约束误称word precise。

一次source固定在翻译plan前完成；ready后pending/gap与event必须都使用最终source time，不继续从raw手工cue求另一时窗。当前phone未改source故此不一致还没发生，完整修ref时须一并预防，timed windows由words/cue关联派生，不把raw event index当parsed cue index。source时间合法变化自然进入现有cache identity，不能把旧time强读到新source/改变durable/CAS合同。correct文本缓存与时间变化成本如实报告，不能说全部旧cache零代价。

### 5.4 实际payload可回放

现诊断没有17840B正文，精确缺失原因无法四选一自签。新debug timing evidence需保留成功valid参照body的原字节SHA/格式能力/所选profile/语言/observed原始时间和采用结果；复用现有bounded诊断系统分块存payload（单条<60000chars），不存signed URL/cookie/APIkey，不每frame落盘。Save full diagnostics能够完整重组核SHA；缺part明确truncated而不冒作完整payload。这样phoneafter能直接重放该实际载荷，而不是再拿另一个文件猜。

## 6. event/page的时间合同

Event.from/to与exact source quote/覆盖仍模型结构安全网；start/end只从修正后的source边界派生，不通过播放延迟、字幕字符数或一次截图重写。strict [start,end)与N34正确空白/等待/过期仍在。

完整译文若能在实际首选字号两行显示，统一优先完整event单页，减少中文“能放两行却因偏爱一行拆页”的人工时间点。超两行才做N34语义/Unicode安全分页、每页>=1200媒体ms、不删/缩/借窗。

没有模型提供source-to-target span对齐时，不能用target标点个数或字数比例把一页冒充source子句精确time。超容量页的权重分时明确estimated_page_timing，记录依据/absolute boundaries；不全局把每page前移。读速、倍速、pause、转场不重播已过页。更精确逐页语义声学对齐需要额外对齐输出/音频真值，本轮不偷偷新增有偿AI校对或词典特例来伪造它。

## 7. clock和实际应用完整修复

本轮额外独立核查official与实际N34 APK：VideoInformation.getVideoTime()公开API会调用真实已绑定PlaybackController.patch_getVideoTime；实际getter从Laove/Lakez的原方法取得值，另有MDX fallback，因此必须确认current video/状态/epoch，不能盲采。VideoState.getCurrent/getPlaybackSpeed/getVideoId均已有公开方法，不需要新增hook。证据official-145-public-player-api.txt、official-145-native-time-method-bodies.txt、n34-actual-player-time-bindings.txt。

**方案升级为原player直接当前位点优先、合法MediaSession估算次之、hook/frozen保底。** 当前依赖外层稀疏MediaSession/回调不是唯一可用数据源，不能先认定没有fresh media所以只能保留秒级迟到。frame测量后main有界重读已审计的官方getter，比单纯s.position或插值更有力；只读、没有seek/play/pause调用，不跨video/MDX错归属。public接口未绑定/回收/不一致时清楚降级。

1. existing guards与same-player保留，但比较要在相同time origin：PLAYING mediaAtHook=mediaPosition+(hookAt-mediaUpdated)*speed，与confirmedHook比较，而不是把旧raw_media_position与较新的confirmed直接做1800ms差。timestamp均elapsedRealtime，age/future/epoch/finite speed验证先做，stale不能因对齐公式变可信。
2. valid fresh PLAYING用完整age（原1500 lease内），不min800；callback/time/tick/frame使用同一个来源优先级；无可用原player直接位点时使用同一个pure estimate evaluator。
3. CLOCK.update真正seek时推进time evidence epoch并失效pre-seek cached media；oldfresh media不能覆盖explicitseek。在before原代码probe：seek21000后重新用updated11000的旧22000报告，居然返回22200；after必须保持21000直到post-seek证据，paused小rewind与原hook优先继续保护。
4. 实际frame/测量后读取应从**缓存的已可信数字snapshot按当前elapsedRealtime重新估算**（含pause freeze/owner/generation/lease），不能只重读主线程s.position。原player current getter可读且归属正确时main有界重读它；否则pure cached snapshot再投影。不在UI里新做MediaController IPC/网络/View扫描，snapshot不跨Session/epoch，失效清楚降级。seek/video/paused/buffering/stop/unknown必须打断旧PLAYING推进。
5. Model selection、snapshot时刻、layout耗时、实际应用time都需同源字段可追溯；UI queue用uptime对比，media采样用elapsedRealtime，不拿wall clock或混合时基做差。after source vs clock vs UI三段误差各记，不把其median混加或日志mark-delay当队列等待。

新clock before负例：2x media20000@10000 与hook22000@11000，其实完全一致，raw差2000>1800导致错误拒绝；fresh query11040应22080却22000。所有source/target都受这个shared时钟影响，需要修。

## 8. 预览问题仍保留

原baseline no-edit/no-focus最后editor recycling mode48→16→48→16已证；root-level lease应与window寿命绑定，row detach移除自身监听/padding/pendingreveal但不重排window，真正root关闭cleanup，不动另一Activity/Dialog，不禁focus/IME。

Preview当前每draw newTextView/FontMetrics/多轮StaticLayout/measure；实测8drawcold约232ms/warm8.5–14.2ms（测试机不是phone帧）。仅实例缓存sample label与尺寸scene，locale/theme/字号/透明度/density真正变时失效，保持16:9/2736reference缩放/真实墨迹和五档联动。单卡保留这项，不扩窗架构/设置本地化。

## 9. 实施、验收与回退

用户没有要求仅限小修；N35卡现在允许上述时间证据/能力selector/source边界映射、clock/frame/page策略接缝。保护N34漏显修复、quotes/数字/语义/覆盖、Publication/CAS/锁/请求上限、N33设置/两root/Keystore/custom/字体，不是无边界重构。

涉及source与clock可信性，建议Codex执行；用户若仍选DeepSeek，必须按同一精确卡、单执行者、不得跳真实reference能力和完整时间验证。不是把根因研究交给执行者去猜：已证代码缺陷有7个before测试，方案/公式/边界已定；真实17840B是哪种载荷形状是实机补证项，当前资料缺失须如实写清。

原backup/pre-n35-n34-bfe5a0a、N35-N34-BASELINE.json、N35-RESTORE-N34.ps1与ROLLBACK-READY保留。规划者只测InspectOnly，无N35产品开发，范围扩张后的全部tracked非docs同样可恢复N34，新revert保留trial，不reset/amend/覆盖旧包或手机数据。

证据 .verification/n35-planner：151644summary、119延后、readymargin、manual-vs-supplied-asr-onset-differences、public-only访问边界、yt-dlp源码片段、reference候选覆盖/partial锚丢失、clock原点/seek及preview探针。完整time before7/7，仅额外probe，不是704全量/after；main/test/resource SHA仍904c8368…。

一手依据：Android PlaybackState（elapsedRealtime采样与speed），W3C WebVTT（cue/segment timestamp/voice结构），yt-dlp官方仓库视频extractor格式处理，均只用作语义/格式证据，不拿社区推测替代当前payload。
