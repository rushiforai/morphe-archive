# N34 Codex执行卡：全语种owned-window显示修复、中文软门槛及保守源计时/格式

日期：2026-10-04（Asia/Shanghai）。Codex单执行者完整实现、验证、独立建包、本地提交；完成即停。不恢复N31/N32/N27，不另外派收尾卡。

## 0. 目标与已授权范围

用户六项N33手机复验已完成，除既有漏字幕无异常。N33设置、十四语种UI、多选/两根、API/model/save与数据保护视为本轮稳定基线；不再重新开发本地化/窗口/设置导航。

N34目标是**所有目标语言下，已接纳且实际能够在原owned时间窗/两行几何完整显示的译文，不因软读速、合并偏好、排队旧时刻或紧凑背景测量被误丢；所有实际页严格遵守[start,end)，保留真正不够容量、结构/语义拒绝和owner隔离**。不是保证缺少源字幕/接口失败/信息密度超出物理容量时也能显示全文。

本卡按同一闭合任务顺序完成：

- A：中文8CPS/样式门槛与纯排版repair解耦、lead/merge/late的通用机制修复。
- B：所有语言严格页时窗/最新绘制时间、真实TextView有界测量与准确trace。
- C：纯源数据的可信局部计时对齐、结构化VTT fallback，独立于目标语种。
- D：实际诊断重放、14目标情境回归、保留N33设置与调度合同、最终三件套交付。

上面各接缝、旧错误测试预期调整、必要纯Java helper/trace字段均已授权，不因“旧卡冻结Controller.render/CaptionOverlay/RebuildSource”重复停工。旧冻结约束只继续保护调度/Publication/缓存提交合同、prompt/业务语义与用户数据，不保护本卡明确要修的8CPS/defer/clamp错误。依赖/下载/远程API/手机写入或架构扩张才是真停止线。

## 1. 开工身份、输入与历史保护

实际仓库 E:/Projects/morphe-caption-v2。先读docs/PROJECT-STATE最新§4au/4av、docs/N33-REPLAN-AND-DIAGNOSTIC-REVIEW.md（前轮根因与边界）、docs/N34-DISPLAY-RISK-REVIEW.md（本轮新增实证），再读本卡。不能在C盘旧worktree施工。

- N33源码b52b65b7a206f1a07464dae62dc30cabc164bf10 / anchor/n33-b52b65b；当前开卡前HEAD4a76cd4，仅docs-only。之后本规划聊天新增N34卡/状态等docs-only后继是合法开工HEAD，记录真实身份，**不要因短哈希不等4a76cd4暂停**。
- 开工需是锚点后继且tracked非docs相对N33无差异；若只有docs增补直接施工，产品并行改动先保留并阅读、不覆盖。两份PROJECT-STATE先比字节/SHA，无差异跳过，有差异阅读最新段落再同步。
- 官方input patches-1.45.0.mpp保持 SHA256 DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93；原版YouTube21.16.256/minSdk28，原APK输入不使用手机已patch APK。
- N33交付三件套：MPP F60F7B50295566D0FC887A3392E78B017685E9B37F4C3C9EC36BE45CBE1C866E、MPE 5D501610F230FC28ADDDF9D3F363586933C61DF434FE8DE75E11403620F26970、APK 08AA970CC8A63643083108DE8732B92247C0A08212C2FF87C47EF95AB172B4CC。开工独立核hash，所有历史包/候选/失败证据保留，禁止root clean/build递归删除。
- 新诊断 D:/HONOR Share/Honor Share/caption-diagnostics-1.3.5-20261004-093813.txt，780916B / 24494E5EE4F379CC9C4716C91918B12179951676BC26938E7DEC4F4D60150380。
- 人工JSON3 D:/下载/.deno/bin/manual_en/The Truth About the Bezelless Concept Phone [ngPkbaZliaU].en.json3，23150B / 505C5A99A6C08A0546A67DD4D8E2070CE17A7FBBD391772B5DAAB3256148C399。
- 人工VTT D:/下载/.deno/bin/manual_en/The Truth About the Bezelless Concept Phone [ngPkbaZliaU].en.vtt，12061B / 24C447B2DD1885A7D63033D62C554B50F8C3AE4FA9DC84E23A408B24B33C993D。已核对169 cues与manual JSON3全文/开始/结束相等（规范化空白后），无内嵌word timestamp/样式tag；旧独立生产解析的1224词时间/precision也相等。.verification/n34-planner/manual-vtt-json3-parity.json记录证据。
- 前轮200407诊断/auto JSON3/VTT四源/纯输入探针按docs/N33-REPLAN-AND-DIAGNOSTIC-REVIEW读取；这些材料是回归数据，不允许video id、词句、固定时间点/源token范围进入生产判断。
- .verification/n34-planner/input-identities.json、093813-diagnostic-review.json、diagnostic-quality-records.json、probe-before-02与原probe源码均为规划者独立before证据；probe-before初次编译失败保留。before3测试通过的意思是缺陷已复现，不是修复通过。

当前情况：中文7 layout fallback、全部8CPS拒绝；当前defer=0，历史200407有14个defer；日语无layout/hard presentation reject，有1次quote错配后及时重试成功；两目标source词time与manual全捕获一致且全estimated。2812history/50quality、50HTTP2xx不能冒作全语义通过。

## 2. A1 中文软指标与正确旧切口保护

生产入口RebuildPageLayout.plan(text,start,end,budget,spec)目前legacy为所有中文目标；非中文原CaptionLanguagePager合同已是soft CPS/CPL。修复所有Chinese family source pair，不限定英文→简中。

推荐最小实现：

1. 保留现有中文正确页选择/代价/标点切口作为首选候选：旧算法返回合法非空plan，且全文无丢失、各页真实geometry/完整ICU cluster、原窗与多页>=1200ms都满足时，页文本/start/end保持N33逐字段相等。
2. 旧中文plan empty不能直接宣告overflow。先测**全文在用户首选字号、可用内宽下的真实完整两行**；能放下即输出原窗单页，允许原窗本身<1200ms，不需8CPS/最小字格/偏好长度/偏好单行批准。全文>7000ms也不是单独清空理由；soft watch留档。
3. 全文真的放不下才进入**容量/Unicode语义回退**：复用已有CaptionLanguagePager的完整文本、ICU sentence/clause/word/line与protected number/NBSP/标识符/quote机制，或等价最小helper；保持中文常规标点优先。多页仅需真实两行/完整cluster/连续页窗/每页>=1200ms，8CPS/最小半字格不得继续隐藏在requiredMs/allocate/candidate capacity里导致empty。
4. 不把全部中文切换到一个新算法，正确旧golden优先保留；旧算法若在emoji/combining/ZWJ等位置产生非grapheme切口则不是“正确旧golden”，须走安全回退。
5. 全文放不下且没有满足上述几何/时间/合法切口的完整方案，则明确page_time_capacity_unresolved或hard_geometry_unresolved；不能砍尾、ellipsis、删标点/品牌、概括、字号降档、提前未来词、借邻事件时间或一页极速闪过来翻绿。
6. 非中文原有short-full-page优先、1200ms多页、语义分割/RTL/measured glyph不改参数；同样验收soft rate/CPL不独立清空。不要推广中文codepoint CPS到Latin/Indic/Arabic。

RebuildReview.withLayoutReview必须在所有source/target中把**纯显示速度/几何/时间容量**记录为advisory observation，不再以layout_overflow repair=true发远程语义修复或阻止正确译文缓存。可保留issue code为兼容trace，但repair=false、semanticBlocked=false。句意/源覆盖/数字/实体/断点等原安全网仍按N33。

RebuildProtocol.PROMPT/FIDELITY_PROMPT、schema、source_quote/from/to/coverage、numeric/semantic checks、request policy和语言策略不修改。不能“重译更短”代替显示修复，也不扩大neutral exactQuoteRebind权限。

验收：当前7条在1121px标准字号下实际完整显示；相同文本的繁中target机制对照通过。两条79.905起的重叠记录分开验证，不算两份独立缺失时长。当前5个layout-only额外requests在固定mock回应/原source下不再触发；block8 fragmentary风险与日语quote错误的原有限repair保留。

## 3. A2 lead、合并、晚到结果与技术前缀

RebuildController.render/ displayMergeForCurrent / RebuildDisplayMerge是本卡明确允许的呈现范围，Controller.schedule/Job/Publication不改。

### lead与合并

- 删除“为合页先把已接纳lead压为空”的选择分支；同样删除/替换shouldDeferLead在生产的调用。lead是否短/无句末标点都不能许可先隐藏它。到自身start立即选其独立正文，不能为了读到下一句提前完整merge。
- continuation.start到来后才可考虑原有中文display-only merge；允许范围仍严格source邻接、没有真实gap/speaker break、同owner/generation、两句均结构/语义合格，不扩大到其他语种或跨资源非法范围。
- **独立当前事件始终作为primary，merge只是optional candidate。** 在Session锁内只提取不可变候选和guard元数据；几何、layout和候选时间检查在锁外/现有主renderer，禁止在Session锁里做StaticLayout或查View。
- 要保留merge，必须以当前实际几何、当前absolute页窗及剩余可见时窗证明候选比独立当前事件不会造成漏显/短闪。不满足即primary；不是另一个blank/status。后到的候选页若把primary尚未显示的正文放到已过期前页，也必须退primary。
- 一个简单且安全的准入：不新增多页merge，只有全文两行可显示、当前>=right.start、到end仍>=1200ms的完整单页候选才可入；否则保持primary。这是候选准入，不改变真实短独立event的显示许可。不能硬写某句/时间/ID。
- 延后UI应用时重新看同一个current displayPosition；候选失效/过期而primary仍有效时自动退primary，不复用旧geometry批准。candidate失败不侵入source/accepted plan，所有from/to/原event数据不改。
- display merge为纯呈现，不写入磁盘翻译cache、不开API/repair。不为保留旧“独立引导页必须消失”错误代理牺牲已就绪有信息的原句；旧A11语义改进应由原已归属的正确events而不是强制先空白实现。

### late arrival

- lateUnreadable/withheldEvent把已接纳正文替为翻译中是旧中文专属soft门槛；改为late_arrival_watch，仅进trace，不再决定隐去正文。事件原窗内选当前实际页，已过期不追播。
- 多页计划以**完整原窗的绝对时间**选择当前页，不用“响应刚到/旋转刚完成”重新从第一页播放，不把过去页挪入未来。不保证已过期内容可以补看，也不新增gap rescue请求/暂停视频。
- 正常waiting仍只在当前源cue拥有窗显示本地化“翻译中”，最终失败/semanticBlocked为空，未产生正文时不伪装caption；API已接纳且有可行current page则不继续waiting。
- RebuildController.render中的“〔原字幕数字存疑〕”技术前缀移到English diagnostic，只呈现原accepted e.text。译文原有的自然不确定措辞/数字保留；RebuildNumbers/semantic安全网不变，不改源/译文正文。

## 4. B1 所有目标严格半开页窗与最新应用时间

RebuildPageLayout.indexAt为空列表、position<first.start、position>=last.end或任一页间隙都应返回-1；只在page.start<=position<page.end返回对应index。禁止首尾clamp。标准测试覆盖start-1/start/end-1/end、多页分界与非法gap；有效old pageAt行为不变。

CaptionOverlay.position/render/showEvent：

- 不能把-1统一当“排版失败/overflow”；区分outside_owned_window与page_plan_unresolved。到end立即使当前owned caption不可见，before start不显示；保留pending信息以便尚有效owner在正常进入窗/新geometry时恢复，不能扩大到新的Session。尤其“before start被hide→position首次进入owned窗”即使pendingPages尚为空也要dirty/render；不能只看next!=shownPage让它永远不恢复。
- waiting/sourceOnly/status各沿原N20/N33合同；无时间窗的普通showCaption/status不可套用虚构start/end。由Controller已确定时窗的waiting同样不能抢先/持后。
- showEvent主线程实际应用、coalesced player frame及normal render都读取**同Session最新displayPosition**，包含现有pausedDisplayPosition。可以给RenderGuard新增default轻量time accessor，或加现有showEvent的LongSupplier；supplier不获Controller/Session锁、不调用媒体/网络/View扫描、不持强Activity、不改CLOCK，应用前先isValid。
- supplied position只是对无生产supplier的fixture/旧调用fallback；主线程late command不能覆写较新的观测值回过去。不同owner/generation、seek后的旧time update/queued callback不能影响新track。
- position任务如需携owner/generation，可最小添加guard重载并改两个既有调用点time/tick；不修改seek检测、任务取消、prefetch调度/Lock/CAS/stop5秒barrier。
- pause仍冻结在真实暂停/显式seek时刻，不能用wall clock强制翻页或关字幕；倍速时跟随source媒体时间而非私自放慢字幕/视频，已有1200ms多页阈值是媒体窗，不得伪称2倍速手机实际观看仍每页>=1200ms；pause下小rewind/原media stale report的现有合同保留。
- hide/clear/owner撤销优先，miniplayer/PIP隔离保持；恢复详情页/全屏后从**当前绝对位置**选页，不重新播放过去page，不残留未来page。

before生产探针已证：indexAt99→0、end2500→last，实际Overlay七家族在end仍可见/before start也可见。after必须翻转成“不显示”，而不删掉before负例数据。

## 5. B2 实际测量、转场和诊断可信性

- 所有目标owned caption/每个page的真实TextView最终结果必须<=2行、lineEnd覆盖全文、可用width内、不ellipsis、保持完整grapheme。target方向/paint/font/无hyphen规则仍N33，不按UI locale翻转正文、不手工reverse阿语。
- 保留正常compact背景宽度。若紧凑宽下**实际TextView**不合格，最多一次改用当前视频矩形已经批准的最大内宽（加原padding），按同字号/方向/字体测完整text；成功即显示，仍失败明确hard_textview_geometry。不能越视频矩形、减字号、循环试错、增加View树扫描。
- 显式保证测量StaticLayout与实际TextView locale/direction/paint一致；现有中文默认font设置不擅自全局更换。要改spec.apply等只限使硬完整性判定一致，保留普通旧golden；无证据不要重调各语言数字参数。
- 可对**同一当前owned事件**复用已计算page plan，key需完整text/spec/size/width/start/end，变化即失效；不用新磁盘/跨Session缓存，不改翻译cache。page时钟推进本身不重新做整段DP。reflow只基于新geometry＋当前位置，不偷改page数据掩盖漏页。
- 不在播放器回调同步查View，不取消N30 frame合并/几何cache合法复用、紧凑播放器抑制；drag存储仍用户原基准、不碰播放器play/pause，不恢复N27避让。
- 上述compact兜底是有界风险防护，本次日语没发生hard_textview_geometry，不把它写成手机已证根因。

trace必须English、owner/session/generation/event/request可关联且bounded/dedup，不每帧拼几千字符：

1. REBUILD_SELECTED仅表示模型选中，不等于真显示；保留其兼容含义。
2. REBUILD_PRESENTED在最终测量/文本/visibility决定之后写，标mode/page/window/render_position（实际同Session位置）、可见或empty reason。不再先写caption后又hard reject。可新建REBUILD_DISPLAY_RESULT表示ui_applied，不声称物理屏幕录像。
3. 原因区分：source_gap / non_speech / pending_translation / translation_failed / semantic_blocked / outside_owned_window / page_time_capacity_unresolved / hard_geometry_unresolved / hard_textview_geometry / owner_invalid / player_suppressed / merge_rejected_keep_primary / late_arrival_watch。
4. 因geometry/time/soft watch没有发API的证明；merge只日志候选一次、不写固定video/token/time特判；晚结果显示的是剩余原窗而非延长。
5. manifest build=n34，追加独立presentation_revision=n34-owned-display-v1。缓存用到的CaptionRenderSpec.POLICY_VERSION/legacy标识保留，或将diagnostic revision单独隔离；不为了改trace造成所有正确翻译缓存失效。payload里的既有request presentation_policy及prompt内容本卡不改，也不将旧请求identity伪称新行为字段。

## 6. C1 源共享的保守局部计时对齐

只改RebuildSource.align及必要pure source helper/metadata。主源优先人工内容，自动轨是timing reference；不得自动切换成ASR文本、删除人工词或根据译文字数生成时间。

1. 沿用已有unique三词键/同序匹配证据，不添加实体词典/fuzzy/LCS重写/语义模型；target不参与。全局足够锚证据的条件保留（当前>=6），单段必须含完整可信anchor、reference词实际NATIVE且start<end。
2. 用matches中的实际NATIVE替换候选形成最大连续source-id、reference顺序连续的段；原source已NATIVE词不改，若混合段分开保护。相隔歧义词/非native/重复/失序不能并成虚构连续锚。
3. 每段验证内部时刻严格合法/同序、不重叠；两侧对比当前已接纳源序列邻词边界，不能剪短/挪动未匹配词来“让它适配”。遇到冲突跳过整段，继续其他安全段；缺证据/无安全段返回原source对象或全字段相等。
4. 已有speaker标志和**原真实>=650ms源gap的硬断点不抹掉/跨越**，只对有证据的同一source speech段对齐。至少验证每个原硬断点在结果仍保持；不为了alignment平滑填silence，不能制造倒序/新间隙使原词coverage丢失。
5. 所有词text/id/cue顺序不变；仅通过验证的原estimated词改start/end/precision=ALIGNED。不能整片漂移、按某视频零点偏移、改句末占下一句。
6. 读取source和reference时记录format/track_kind/source_code/hash/byte count/native/estimated/aligned/可信段/跳过原因，URL/signature/cookie/key不出日志。没有runtime reference正文就不能断言与测试auto JSON3同payload。
7. RawCaptionSource.reference本来只用同视频同language签名descriptor的1.5秒预算；该网络、候选选择、截止/重试和SOURCE_IO机制不改变。不新开请求“追齐”，不给源IO创建线程/无界队列。
8. RebuildCache.identity本来hash每词time/precision/text；正确让changed source得到新key，不强读旧缓存、不清全缓存、不覆盖旧文件。相同source/no-ref/无法安全align时identity同N33；新source冷热结果一致。JSON3所有word text/id不变、老source native词不改；VTT解码去掉元数据造成的token身份变化单独验证。源改善导致首次冷cache成本如实记录，不声称所有旧缓存零额外请求。

验证独立：supplied manual/auto JSON3（旧探针1131anchors/44交界冲突）、两个安全段＋中间冲突、重复短语、少锚、错序、语言不同、全NATIVE、speaker/gap、reference取消、缺ref；至少一个安全段仍采用，冲突不导致整片已安全段回滚。不能只assert aligned数量>0而不验text/边界/无重叠/coverage。

## 7. C2 结构化WebVTT fallback与源覆盖

本次人工JSON3直接症状不由VTT造成，但签名fmt固定/JSON3-format-fallback是合法既有入口，风险对所有targets相同。本卡允许一个纯输入适配器（可新增WebVttSourceReader），只改RebuildSource的VTT解析与必要CaptionDocument合法payload解码；不改transport/network/cache提交架构。

- 正常JSON3与人工SRT/XML路径保持；普通manual VTT语音文字、cue顺序、native onset/end意义保留。JSON3优先和SourceFormatPolicy对sparams包含fmt的签名的保护保留，不修改签名URL强取JSON3。
- 按WebVTT grammar读cue ID/start/end/settings、内嵌timestamp、c/voice/style/ruby等payload结构及实体；字幕标记不作为语音tokens。保留逻辑文字/说话人边界和真正口头重复，给有独立合法timestamp的词NATIVE，否则ESTIMATED。
- 时间标签必须在cue有效窗口、同序，无法确认的段不能捏造word onset。完整plain text使用cue coarse窗，不按拼写长度分配时间。
- 只有已验证的滚动显示状态/连续窗口＋内嵌timestamp结构＋精确carry行关系能剔除旧display carry。文本相等自身不能证明carry，不能全视频去重或删除重复短语。10ms display-only重复帧与“very very”/两次同句/不同speaker的真语音分开测试。
- 不能简单regex删所有<...>，这样会破坏原文中的literal比较/实体；合法tag按语法处理，未知/非法格式明确reason或保守decoded coarse，绝不静默截尾/抓第二行全部删除。
- 对supplied auto VTT，时间标签/c>碎片不得进入tokens/request，语音增量coverage逐项与可见payload证据对照，不硬要求词数等于JSON3（两载荷词表/断句/标点可能不同）。JSON3受影响词数1260/1221native等是before事实，不写成生产常量。
- VTT与JSON3/普通人工VTT/SRT、实体、voice、timestamp非法、自然重复、标点、Unicode各独立fixtures；不要把视频名/ID/固定10ms删帧阈值写进适配器。
- 如果carry证据不足，保留decoded文字并estimated，记录carry_unproven；不拿dedup猜测换零重复分数。真正unsupported input可显式source格式失败，遵守已有waiting/failure合同；不把markup伪翻译当通过。

## 8. 允许改动与保持冻结的明确边界

允许的生产文件/接缝：RebuildPageLayout、CaptionLanguagePager（容量回退/完整性）、CaptionRenderSpec（measurement/diagnostic最小一致性）、RebuildDisplayMerge、RebuildController仅render/display candidate/guard当前时间/两position调用与技术prefix日志、CaptionOverlayV2（时间/实际布局/trace/当前plan复用）、RebuildReview仅layout→advisory及相关直接分数分层、RebuildSource.align/VTT纯适配、必要CaptionDocument payload处理、RawCaptionSource只格式/哈希trace、CaptionDiagnostics build标记及纯English字段。新增纯Java helper、tests/tools/n34、管理文档已授权。

保护逐字节/方法语义不改：Controller类锁/Session.cancel/retire/Publication/Cache prepare-reserve-commit/fsync/stop5秒barrier/schedule/retry/attempt/seek检测/CLOCK/原prefetch；RebuildApi provider/schema/prompt/request JSON、RebuildProtocol所有prompt/结构/数字/coverage安全、Planner 650ms/speaker/来源语义/语言策略、RebuildCache identity和磁盘提交合同、NativeCaptionBridge/实体hook/draw许可、settings/UI/resolver/default与key/profile、字体五档/style/位置、root两项/compatibility。

可以调整纯display测试或诊断标记预期，不借此弱化源/语义/时间归属/旧correct中文golden。冻结ACCEPTANCE/frozen scoreboard事实不动；当前合法visible对照结果新增另存live n34，不把旧 frozen invisible0视作本轮所有新缺陷为0。

不存在“去掉正确安全网可以所有字幕永不空白”的承诺。不可显示的真实超容量和没取得译文的情况分类保留。无证据不升级供应商并发、不放宽结构quote检查、不新增带用户不懂的技术说明UI、不修改N33刚验收的设置。

## 9. 验证：先负例before，再after及全目标/场景

### 9.1 已知样本，真实production链

- **双格式不回退门槛**：对本轮同轨manual VTT/JSON3，在无reference或相同已验证reference条件下，比较169段的起止/规范化文字、完整source words的text/id/cue/start/end/precision、Planner blocks/hard breaks，以及相同cfg/source_code/target下的request payload和RebuildCache翻译身份，全部一致。覆盖14target context；格式传输的SourceCaptionCache URL key可不同，不强行合并signed URL缓存。169/1224仅fixture期望，不是生产判断常量。没有word timestamp的普通人工VTT不能为了提高native计数把插值升级成NATIVE。
- **格式负例**：manual两个相同句子/短词分别有独立cue窗，均保留；无内嵌timestamp的manual不能套auto滚动carry规则。把纯人工对照与有timestamp/rolling结构的auto VTT逐增量检查分开，不因整体词数接近就认定解析正确。
- **时间间隙口径**：source_gap只表示源轨中此时没有有效owned词/cue，不证明音频中无人说话。manual常见82ms cue间隙既可能是制作者排轴间距也可能有真实停顿，不通过统一补齐/延长字幕或删除短cue消除它。原>=650ms/speaker硬源断点仍保留，未经音频证据不称为已实测静默。

- 保存原093813/200407/source文件只读身份；新输出统一 .verification/n34，任何环境输出N25_PREVIEW_OUTPUT/CAPTION_UI_PREVIEW_OUTPUT/N30_EVIDENCE_DIR等转到新n34，不能覆写旧fixture。
- 重放新50 quality响应，以(session,block,attempt)关联原事件；两会话分开记50HTTP2xx/49accepted/1rejected。日语quote错配仍reject，其成功重试仍accept；本卡不提升nonChinese exactQuoteRebind权限来抹掉这次正确拒绝。不能只拿最后绿响应替换负例。
- 原source/no-ref回放证明当前7条真实两行可见；取old200407的18fallback/14defer逐项区分rate/time/geometry/late/candidate，能放下的显示、真的不合格有原因。译文全文/owned IDs/times保持，新页串接回原accepted text。
- 回放源时间改善单独用相同主轨＋安全ref，不把原source下的固定block反应硬套新时间/Planner边界。mock响应按合法新owned tokens生成可验证协议；不能强开旧cache跨source身份。
- merge旧风险、legacy晚到、indexAt早/晚负例after转正确，真实Overlay需要断言visible/text/page/getLayout；只测函数返回或REBUILD_SELECTED字符串不够。
- 相同cfg/原source/target下prompt/hash/request body内容保持N33；仅纯layout付费repair少发，原semantic/structural有限重试保留。source格式/时间合法改变引起block/key差异单独报告，不伪称所有调用必须与N33逐字段相同。

### 9.2 全十四目标机制矩阵（无需母语语义硬打分）

en/zh-Hans/zh-Hant/es/fr/de/pt/ru/ja/ko/ar/hi/id/vi，目标取实际session metadata，不取UI语言猜测。

- 原窗80/283/600/830/1000/1199/1200/2399/2400/3601/7000/9000ms：短窗完整可两行必须单页；多页>=1200、连续覆盖原窗、全文串接、语义/字形切口；物理容量不够准确blank，不任意缩字或借时间。
- 宽窄/标准与超大字体、详情/横屏；高速CPS/CPL、中文含Latin型号、日语标点、韩语组合、德语长词、法语重音、vi combining、Arabic混合LTR数字/括号/连接字、Indic conjunct/ZWJ、emoji/旗帜、NBSP/CRLF。完整Unicode/合字不能被切坏。
- start-1/start/end-1/end，page分界、实际页间隙；response提前/正在窗中/晚到仍剩余/完全过期；main队列被延迟但同owner有效；coalesced player frame应用时位点更新，不能timestamp回退。
- pause在页分界附近＋等待时、resume、paused explicit seek/小rewind、连续forward/backwardseek、换target/视频、旧结果/cache任务/旧frame晚到，均owner/generation/time不串。另覆盖0.5/1/1.5/2倍速、buffering停住、后台→前台的已有合法回调；视频media时刻决定字幕页，不按wall timer推进暂停/卡缓冲页面。
- 详情↔全屏↔评论收窄↔miniplayer/PIP/hidden↔恢复、一次旋转和拖动字幕。保留compact抑制设计、暂停不翻页、拖动不写避让偏移、不调用play/pause、外/内官方播放器callback仍无同步View扫描。
- RTL→Latin/中文→等待来回切换，不残留方向/paintlocale，UI locale变化不改变target/canonical要求；N33日语设置、多选save/cancel/返回、API/model/save用本地mock各一次smoke。
- 真实hard geometry/非法Unicode仍明确blank；没有对source/translation做全局删除/特殊列表。新诊断字段不会增加后台布局修复请求。

用既有SDK28/SDK35平台ICU/Robolectric NATIVE和已有SDK35本地模拟器。Android硬完整性与before probe实测，不能只用自制HTML/字符宽度估算。至少最终SDK35从真正交付DEX/resources运行代表Chinese/ja/ar/hi/Latin的当前时窗/过期/main延后/窄屏caption；沿用N33合法独立宿主方法但**输出和artifact路径改n34，不能原样运行硬写n33路径脚本覆盖历史**。源/转场合成fixture不冒称真实YouTube网络视频帧。

所有emulator写入/签名测试副本操作必须明确已有模拟器序列号；**用户物理手机只读，不安装/启动/push/app_process/清数据/logclear**。正式产物unsigned，模拟器测试副本独立路径，不改交付bytes。

### 9.3 原回归、性能与独立交付审计

- N33历史Java676/676＋Python27/27/发行11/11。最终全量重新跑真实分母，失败/error/skipped0；原400轮并发/主线程退休/同key提交/5秒barrier及R1、Unicode、N30转场回归保留。
- 18正确中文业务golden（source/quote/text/prompt/hash）保留；已授权显示错误预期如legacyDoesRejectCps/shouldDeferLead/late waiting/页clamp改为新合同并逐条留变更依据。只有表现旧错误的assert可以改，不能扩大超容量/丢token的允许范围。
- 当前7条/native14行、before窗泄漏14行、旧18/14条每项记录after可见/合法blank/原因；别把重叠窗相加成总时长。所谓实际可见时长从真实应用时间/position记录，区分媒体窗和wall观看时长（暂停/倍速/缓冲），不能只算event duration或SELECTED差值。
- 新旧同caption geometry下统计planning calls/layout次数与frame/callback耗时；不设未经基准的巨大容忍线，不借并行重负载把慢测忽略。保证StaticLayout不进入Session锁或同步player callback，不每80ms重排未变的整个事件，无新增API/线程/无界队列。模型恶意长文本/大量弱切口做有界压力观察；若需优化，只做结果等价的本事件复用/measure memo或早期硬容量判断，不增加任意字符截断/重写架构。
- 冻结scoreboard4通过/4既有失败/4未验证、三invisible_ms0、ACCEPTANCE/frozen原字节不改。新093813live结果另存，不能拿旧冻结0覆盖本次7空白。
- AI-only/Remember-only/AI+Remember三root组合实际Patcher/serializedDEX通过。官方1.45下N33完整组合92项只是历史分母，本卡按实际selection报，不假称所有版本固定84/92。回调/fingerprint资源注入保持N33，无第三简中root、无N27/31/32设置hook。
- 最终MPP内嵌MPE=独立MPE；ZIPCRC/resource/metadata/aapt及全部root DEX branch/API/hook审核，通过apksigner按预期拒绝验签确认unsigned。类数按新增纯source/display helper实际报，不虚用旧58257。39官方设置方法和N33控件资源/语言/keys保持；新类型不混fixture/验证host。
- 历史包/失败证据/用户输入前后hash不变。不root clean、不覆盖n33/n32/旧probe、不修改公开URL/产品号/兼容范围，不下载/远程翻译API。

## 10. 交付、状态与用户短复验

新产物：

- E:/Projects/morphe-caption-v2/build/local-test/patches-1.3.5-本地测试包-n34.mpp
- E:/Projects/morphe-caption-v2/build/local-test/extension-1.3.5-本地测试包-n34.mpe
- E:/Projects/morphe-caption-v2/build/n34-composition-final/YouTube-21.16.256-本地测试包-n34-unsigned.apk
- docs/N34-LOCAL-TEST-BUILD.md：实际scope/identity/SHA/bytes、source与显示各部分before/after、真实phone未覆盖、cache失配边界、旧测试assert差异、全量/组合/DEX及代表模拟器frame。
- .verification/n34：可重跑probe/replay/matrix、原失败保留、source对齐段/格式coverage、trace与真实layout/frame/visible结果、history hash；不能只交汇总表。

产品仍1.3.5、官方1.45.0、已证host21.16.256/minSdk28，两根和N33设置照旧。完成本地一个实现提交＋anchor/n34-<真实源码短hash>，可有docs-only身份补记后继，源树与锚点相等；两份PROJECT-STATE同步并保留规划管理段落，工作区除官方输入外干净，不amend/推送/发布。

用户交付后只需：同视频中文25s/71–83s/168–170s/251–255s，以及旧119–122s一个lead例；日语同片段＋一次pause/seek/全屏返回；保存完整诊断。源实际听感晚/早仍以音频目视判断，不能由本地自动计时自签。以上定位时间只写fixture/用户清单，不入生产。

完成即停，不自派N34r/N35或DeepSeek。若最终不满足任何核心窗口/coverage/owner/正确安全网合同，保留失败候选如实报告，不把测试数字绿当作真正交付。
