# N34 093813 真机诊断与全语种呈现机制审阅

日期：2026-10-04（Asia/Shanghai）。本规划聊天独立读取N33产品源码、093813诊断、人工JSON3，以及前轮独立源计时探针；调用当前原生产算法做Android原生排版专项。这里只落地分析/计划，不实现产品修复。

## 1. N33验收与本轮输入身份

用户明确报告六项实机检查均完成，除既有漏字幕未发现问题。登记N33设置/导航/多选/按钮/日语本地化/数据保留/播放冒烟短验通过；不能由此声称14语种翻译语义、所有视频呈现或N34已通过。

- 当前HEAD 4a76cd4，源码b52b65b7a206f1a07464dae62dc30cabc164bf10 / anchor/n33-b52b65b；HEAD非docs与源码锚点相等。仅用户官方patches-1.45.0.mpp未跟踪。
- 本轮独立复核N33三件套字节/SHA与交付报告相等：MPP F60F7B50…、MPE 5D501610…、unsigned APK 08AA970C…；详细 .verification/n34-planner/input-identities.json。官方1.45.0 / 原YouTube21.16.256 / minSdk28，不改变官方输入。
- 新诊断780916B / SHA256 24494E5EE4F379CC9C4716C91918B12179951676BC26938E7DEC4F4D60150380，manifest build=n33 / presentation=n29-presentation-v3。完整history2812条，quality50条；bounded_not_guaranteed，不当作全帧录屏或最终安装APK哈希。
- 人工JSON3 23150B / 505C5A99A6C08A0546A67DD4D8E2070CE17A7FBBD391772B5DAAB3256148C399。中文会话1捕获934个source词id、日语会话31捕获1065个，全部start/end与独立原生产解析manual轨一致，差异0。两会话source_ready都是1224词/169coarse cues/estimated1224/aligned0。由此确定这两个会话的主翻译源是人工轨，自动轨只是尝试作计时参照。
- 当次ASR_REFERENCE_OK=17840B，其原正文没有导出；不得与以前用户提供的106667B自动JSON3冒称同一payload。前轮安全对齐机制探针仍有效，但只是代码缺陷证据。

## 2. 当前漏字幕：已就绪译文被中文显示门槛清空

全诊断50次API/50 HTTP2xx/0网络失败；49次结构接纳、1次结构拒绝。不能把HTTP成功说成字幕显示成功。本次provider=qwen3.8-flash，与前轮deepseek不同，不按跨供应商RTT变化推论版本性能退化。

当前完整history只有7次 REBUILD_LAYOUT_FALLBACK，全部会话1/zh-Hans，mode=overflow_status。7/7实际renderInput超过8codepoints/s。它们在同一owned窗内已经选中正文，而RebuildPageLayout.plan在几何判断之前返回empty，Overlay显示空白。

| 源窗秒 | 实际送入排版的译文 | CPS | 判定 |
| --- | --- | ---: | --- |
| 25.193–26.023 | 情况一直在改善。 | 9.64 | 旧8CPS拒绝 |
| 71.571–73.766 | 所以，你知道的，曲面边缘开始消失了。 | 8.20 | 同上 |
| 79.905–82.399 | 就像，这就是……这就是高端手机的样子…… | 8.02 | 同上 |
| 79.905–83.269 | 上句＋大家现在看看。 | 8.03 | 合并候选仍被同一门槛拒绝 |
| 168.169–170.077 | 比如，这是Pixel 11 Pro。 | 9.43 | 同上 |
| 251.431–253.045 | ……都很扎实。屏幕也很不错。 | 8.67 | 同上 |
| 253.127–255.011 | 你知道的，它很亮，支持144Hz刷新率。 | 10.62 | 同上 |

两个79.905开始的记录覆盖重叠，不能加起来当缺字幕总时长；本报告按事件/候选分别登记。源cue间真实小间隙与先后语音空档也不能当漏译。

本规划者专项运行：只在 .verification/n34-planner/probe 添加独立 before test，通过已有--extra-source挂入测试；没有修改tracked产品/测试。SDK28/Robolectric NATIVE在1121px实际字幕内宽、标准字高计算下复放上述7条：全部原文可完整容纳两行；简/繁两个target家族共14行观察均 fits_two=true，但旧生产路径shown为空。字形/OEM并不与手机逐像素相同，因此不冒称手机after已经修好。

此外，中文26 API/20不同逻辑块；6额外同块请求中5由layout-only告警触发（block2/4/5/11/12），1是fragmentary_translation（block8）。4条repair_no_progress说明若同一排版门槛未修，付费重译也不能消除空白。应移除纯速度/屏幕容量导致的付费语义repair，不改变确有源/语义风险的重试合同。

## 3. 中文专属与跨语种风险的准确区分

### R1 中文速率拒绝：已发生，必修

legacy由目标语种是中文家族决定，并非只由英文源决定。zh-Hans和zh-Hant（包括不同source→中文）都使用同一8CPS硬拒绝；中文常量MAX_CPS=8与profile参考9不是同一口径。非中文已经用soft watch、完整短窗单页优先，没有这个同样的硬门槛，不能说14语种都被8CPS拦截。

修复采用窄回退：现有正确中文多页计划保持；若旧计划empty，先验证全文实际两行几何，能放下即原窗完整单页；全文放不下才用已存在的Unicode语义边界/1200ms容量机制作回退。读速/CPL/短页样式偏好不能独立导致empty，真正两行/字形/多页时间容量仍为硬保护。不改用户字号、删字、概括、延长至下一句。

### R2 中文defer、无验证merge、late withholding：仍有代码风险，窄范围修

- 本次deferredLead=0；qwen这次输出的事件没有进入该分支，不能拿旧14次defer当新会话计数。前轮200407已有14次强实证，本轮源码仍同一逻辑，因此应移除为合并而先清空lead的分支。
- 当前merge261-271在82.402s被选择，整体start79.905，但它的独立左事件本次也因CPS拒绝，不能简单把整个2497ms差值算成新的defer。
- merger只以48cp/12CPS/5000ms等静态条件批准，而pager8CPS/语义/几何还可能拒绝；任一候选失败应退回当前独立事件，不能吞掉两个原事件。
- lateUnreadable中文专属：已接纳事件只要迟到>1000ms且剩余<1000ms、长度>12cp，会把正文变为“翻译中”，并以withheldEvent锁住。本次此事件计数0，属于代码级风险。将其变为late_arrival watch，原窗内仍显示当前有效页；不到时/已过期不显示，不借邻窗/不重排以往页。
- source_number_ambiguity会在RebuildController.render给译文额外拼“〔原字幕数字存疑〕”，违背既有技术原因仅进诊断约定，还可增加CPS/占几何。保留模型译文中的真实不确定措辞/数字安全网，技术前缀移入英文trace；本次7条不由此前缀触发，不混作实证。

这些是中文家族现有特殊分支；不得把它们推广给非中文。

### R3 所有语种页时窗钳制：生产探针证实，必修

RebuildPageLayout.indexAt在position<start返回0、position>=end返回最后页，而CaptionOverlay.position只有next>=0且换页才dirty。正常Controller在下一次tick选择none会遮住，但queued render/转场延迟/geometry remeasure期间Overlay本身没有严格owned-window约束。

本规划者 before专项3/3通过，含原页查询边界、实际Overlay视图验证：zh-Hans、zh-Hant、en、ja、ko、ar、hi七家族共14行，在exclusive end仍可见过期正文、before onset也可显示未来正文。这里用有效guard固定为true模拟“模型owner仍有效、但页面时间已经改变”的情况；不宣称本次手机2812条发生了相同全帧异常。这证明Owner许可不能代替时间许可，shared函数作用于所有14目标。

修复：lookup必须[start,end)严格命中才返回page；空/间隙/窗外返回-1。Overlay在过期/未到时hide，不将-1误判排版失败、不回源、不记录overflow。真实主线程应用/延后render读取同Session最新displayPosition（含pause frozen），不可用排队时的旧position重置到过去；不改CLOCK算法、seek判据或model Publication/CAS。增加owner/generation/当前绘制时间的边界回归。

### R4 几何变化、compact与真实TextView：跨语种防护，保留并做一次有界兜底

- 当前非中文最终TextView测量是好的保护：字形/完整文本/两行/ICU边界不合格就hide；本次ja71次presentation均hard_reject=false，无layout fallback。
- 但compact宽度按另一个StaticLayout估算；OEM shaping/舍入等可能让本能在最大内宽显示的正文只在紧凑背景下失败。新版本最多一次恢复到已许可的最大内宽再测，同字号/方向/字体/两行，不无限扩宽、不缩字。完整性判定同样覆盖中文，旧正确布局保持。
- 当前REBUILD_PRESENTED在最终TextView检查之前写出，因此后面若hard_textview_geometry拒绝可能留下“已呈现正文”的误导记录。日志应在最终文本、页面和visibility决定之后记录，区分SELECTED、applied可见/空白/抑制/过期和frame近似时刻，不能用日志标签当物理屏幕录像。
- 旋转/评论收窄/退出全屏等需要新几何，absolute页时窗继续按当前位置，不重新从第一页播放，不恢复旧owner。实际几何不足的短窗不能无成本保证显示全部正文，保留理由明确的安全空白。

### R5 人工/自动时间对齐：源共享，局部修，不全片平移

两个目标会话同人工轨且全部ESTIMATED，说明准确计时不足独立于target。前轮原生产探针在supplied manual/auto JSON3上：1131 unique anchor words、拟1122native替换、44交界冲突，整片返回原对象、aligned0。

改为可信native匹配的连续局部段独立验证/提交；仅更换可靠段的time/precision，保留所有text/id/序。重复/语种不一致/交界冲突/证据不够段仍estimated，不剪未对齐语音，不延长/倒置/全片shift，保留真实650ms/speaker边界。已NATIVE源不改。收益只承诺不让一处冲突取消其他安全段，不能承诺所有词完全音频同步。

时间/precision变化会自然换RebuildCache.identity；旧译文不能强读旧时间缓存，也不清用户全缓存。一次合理冷缓存重新计算有成本，不能宣称源改善同时请求数/Token绝不变化。缺少ref/无法安全align时应回到原source逐字逐时间完全相等。

### R6 滚动VTT标签与历史行：源共享，已证fallback缺陷，一并限于纯输入适配

正常主源JSON3优先。SourceFormatPolicy尊重fmt被sparams签名固定，所以VTT并非永不可达。旧RebuildSource对supplied auto VTT解析6963 estimated词，含内嵌时间/标签/滚动历史；auto JSON3则1260词。不能把载荷标签、carry字幕当语音发送给模型。

按WebVTT grammar在源适配层处理cue payload/内嵌timestamp/实体/voice/style，保留文本逻辑序和真正重复的口头语；滚动旧行只能由明确的连续显示窗口/时间标签和已确认carry状态证明，不按文字重复全局去重。普通manual VTT保持；没有结构证据去carry时保留decoded文字并estimated，格式不合法明确reason，不能靠删词让数量看似相等。短帧并不自动意味着非语音，10ms只作fixture描述，不是生产删除阈值。无需改请求传输或签名URL，不新开网络抓取/ASR。

### R7 合法安全空白与外部不可解条件：不“修”成错误字幕

真正source gap、非语音空cue、owned event已结束/未开始、翻译尚未就绪或结构拒绝/网络最终失败、过短超密却无法在两行与原窗内显示、owner无效、miniplayer/PIP/hidden按现有隔离抑制都是不同原因。用户的“翻译中/最终空白/不回原文”已定合同保持，不能为了零空白提前显示、持有上一句或绕过源/语义检查。

日语唯一source_quote_mismatch（block5 request39）模型把and写进272–287引用，而实际该词归属288；拒绝正确。request41在1791077646052接纳；播放到该block第一次选择在1791077662718，提前约16.7s，三个事件都正常选中。全部ja none选择时刻均落在人工source无词的间隙，没有已证在speech内被清空；不改quote校验/精确rebind权限/repair次数或升并发。

### R8 暂停、seek、切target/视频、原生遮罩、RTL/Unicode：审阅并覆盖回归，不猜测改架构

已读CLOCK同播放器新鲜度/暂停冻结、generation/Publication/CAS和frame合并、native masking/compact隔离。用户六项播放冒烟无异常，现有回归涵盖400轮锁/生命周期、R1 pager、Unicode/RTL/N30转场。没有新证据支持修改调度、retry/deadline、字体档位、drag保存、native许可或设置绑定。N34仅在上述R1–6纯呈现/输入接缝工作，并对这些场景做回归。补充0.5/1/1.5/2倍速、buffering和后台→前台：依现有媒体clock推进，不能因wall timer强行翻页。1200ms是媒体页窗，倍速后的物理观看时长另计，不伪称每页实际仍1.2秒。

语言层：12非中文维持独立profile软目标/ICU边界/RTL。中文也须校验emojis、组合字、混入Latin/numbers的完整grapheme；不能以代码点切口破坏cluster。超长不可拆word在两行都放不下时才用原有emergency grapheme，不能因时间短就切正常单词。母语语义不能由ICU保证，本卡不声称自动母语自然度全通过。

## 4. 范围与分期

N33手机设置短验通过后，本轮直接下**一张N34完整卡**：先纯呈现R1–4及诊断，再纯源局部对齐/格式R5–6，两部分同卡按明确边界分别验证；不再额外开N34r/N35等例行收尾卡，也不把高风险架构改造打包进来。若依赖/手机写入/供应商改造才是必要条件再停，不因docs-only后继或允许的render接缝反复问。

旧正确中文页切口、请求、custom与N33设置保持；新语义/源时间发生允许变化时另存before/after和新live evidence，不改冻结ACCEPTANCE。N34交付后用户只需同视频短片段中文/日语对照、pause/seek/一次转场及完整诊断，不要求14语种母语逐项审校。

## 5. 本轮验证与一手依据

- 专项before 3/3，输入SHA仍与N33全量599169b1…相等；仅外部.extra-source探针。最初编译因SDK28没有Files.writeString失败，证据probe-before保留；改探针Files.write(bytes)后probe-before-02/3测试通过，未改产品。不是修复后通过。
- .verification/n34-planner：input-identities.json、093813-diagnostic-review.json、diagnostic-quality-records.json、probe源码、probe-before/02日志及seven-cps-phone-failures-native.json、page-lookup-clamping-before.json、actual-overlay-window-leak-before.json。旧n33-planner的18fallback/14defer/原生产source probe保留作历史实证。
- Android StaticLayout.Builder规范提供方向、break与measure能力，故硬边界依据真实layout而非字符数估算：https://developer.android.com/reference/android/text/StaticLayout.Builder
- W3C WebVTT定义cue时间和内嵌timestamp/voice/style等payload结构：https://www.w3.org/TR/webvtt1/
- Netflix简中指南给9CPS/两行等正式交付参考；它不提供“直播翻译超速就删除正文”的实现依据。本文选择速率soft watch是项目已授权的实时显示取舍，不冒称Netflix强制如此：https://partnerhelp.netflixstudios.com/hc/en-us/articles/215986007-Chinese-Simplified-Timed-Text-Style-Guide

不声称本轮运行完整676全量/400轮/正式DEX，数值仍是N33历史执行者验证。规划者本轮没有签名/安装/启动手机/清数据/远程翻译API/下载、新依赖；产品修复由后续N34执行聊天完成。

## 6. 用户再次提供人工VTT后的补充核验（2026-10-04）

- 文件SHA24C447B2DD1885A7D63033D62C554B50F8C3AE4FA9DC84E23A408B24B33C993D，与前轮同路径人工VTT一致。12,061bytes/169cue；对manual JSON3规范化空白后每cue文本/start/end全部相等、差异0；无inline timestamp、无payload tag。前轮独立生产解析1224词的time/text/precision完全相等，输入未变且N33对应解析源码未改。
- 它证实同人工主轨的格式一致性，也提供防止普通人工VTT被滚动去重的强回归资料；没有逐词时间，不能当新增ASR参照或证明音频同步准确。当前8CPS/owned窗等根因无需更改。
- N34已结合N33-REPLAN-AND-DIAGNOSTIC-REVIEW：旧18fallback/14defer、1131anchor/1122native/44冲突及autoVTT6963污染，与本轮7fallback/defer0/ja安全拒绝准确分列。已在N34开工读取顺序明确要求读前轮分析，未漏继承其结果。
- 补充N34验收：ordinary manual VTT/JSON3全cue/word/precision/Planner/request/RebuildCache身份对照；同句不同窗的真实重复保留；manual与rolling auto规则分开；格式本身不触发重复翻译/时间升级。SourceCaptionCache依signed URL传输身份可不同，不混淆两个缓存层。
- 164个cue间有源轨gap，初始常见82ms；这不直接证明音频静默。source_gap是源数据时间口径，不能据此改听感判断或统一填gap延长字幕。原既有hard source breaks保持，音频同步仍由用户after观察。
- 没有新增阶段、依赖/网络/产品实现或放宽已有保护；更新仍同一N34任务卡。证据 .verification/n34-planner/manual-vtt-json3-parity.json。
