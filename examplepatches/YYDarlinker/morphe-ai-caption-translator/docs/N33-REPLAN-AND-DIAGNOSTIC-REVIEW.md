# N30 重建规划与 200407 诊断根因审阅

日期：2026-10-03（Asia/Shanghai）。本规划聊天独立读取 N30 产品源码、用户诊断及 manual/auto 四文件，调用 N30 原生产解析器作本地只读探针；不继承 N31/N32 实现。新功能由后续执行聊天按 N33 卡实现。

## 1. 当前真实开发基线与历史保护

- 实际仓库：E:/Projects/morphe-caption-v2；不使用 C 盘旧 worktree。
- 用户明确要求放弃失败 N31/N32，以 N30 完成树重新开发。本聊天已执行可逆恢复提交 7d6821e772b9959158dd7ac41bd7e626aef48d1c；锚点 anchor/n30-restored-7d6821e。
- 恢复源为 d5ca720ecf0c83349ea232d929ee09b11840c65a / anchor/n30-d5ca720。全部 tracked 非 docs 文件与该提交一致，包含源码、测试、resources、catalog、元数据、README 与构建工具。不是把 N32 上几个文件换成 N30。
- 失败暂存 c88abcc5f9b061a6dd1870bc0ac45f1087d372d2 由 backup/n32-wip-c88abcc 保留；原 N31/N32 提交、临时包、失败日志和历史文档保留。没有 reset/rebase/amend/push。
- 本轮前后 80 件历史交付 MPP/MPE/APK 大小与 SHA256 相同，changed=0。原 N30 MPP 为 1,149,147 bytes / 7FEB7313460239B9F8C7315F11C4B8D599FCFED3640A24EADCA8B38317056880。
- 官方输入仍 patches-1.45.0.mpp / DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93；YouTube 原版宿主 21.16.256 / minSdk28。未改变手机已安装内容，未重新建包。
- N31 允许复用的只有 dc304cb 的翻译文字：独立导出 .verification/n33-planner/n31-text-only-catalog.json。旧稳定 key、文案可校对；不移植源码、窗口、hook、UI binder、测试替身或脚本。

## 2. 诊断身份、请求实况与原字幕判断

输入 caption-diagnostics-1.3.5-20261003-200407.txt，433,812 bytes，SHA256 543C5A6CD01C34F9E08763C7988E2148D2389024FC318F3D21BDE43EF042EAD4。

- Manifest：build=n30 / official=1.45.0 / presentation=n29-presentation-v3。旧N31和N32 WIP的exporter标记为n31，本文件标记n30；没有此次安装APK SHA，因此不把manifest当完整APK验真。字幕核心Rebuild/Overlay/Pager在这些历史点与N30相同，本轮机制证据按N30源码核对。
- 完整 history 1132 条；quality 32 条。原始文件只读，导出有 bounded_not_guaranteed 边界，不能断言记录覆盖每一帧。
- 32 API attempts、32 HTTP 2xx、0 failure、0 internal retry；26 不同逻辑块，6 个额外同块请求。5 个 REBUILD_REPAIR_NO_PROGRESS 事件。成功响应不等于语义或屏幕呈现成功。
- 63,268 tokens = 56,545 input + 6,723 output；RTT min874 / median1366 / p95 1764 / max1945ms。该次漏/晚字幕不能解释成供应商连接失败，当前无证据支持增加并发或重试。
- SOURCE_OK=23150 bytes，REBUILD_SOURCE_READY=1224 words / 169 coarse cues / 0 measured_or_aligned / 1224 estimated。
- 使用 N30 的 CaptionDocument + RebuildSource 原源码独立编译解析四输入。人工 JSON3 恰 23150 bytes；其 1224 个词的 start/end 与诊断所有 1224 diagnostic_only_source_times **全部相等，差异0**。因此本次主翻译源可以确定为人工字幕；自动字幕仅尝试作计时参照，未取代人工文本。
- 运行时参照 ASR_REFERENCE_OK=17840 bytes，其正文未进入本诊断。用户提供自动 JSON3 为106667 bytes，二者不相同。下述离线对齐证据证明代码机制问题，不声称就是手机当次17840-byte响应。

## 3. 已证实的字幕呈现问题

### 3.1 18 次空白全部触发 legacy 中文 8 CPS 硬门槛

RebuildPageLayout.plan 在检查完整文本能否放进两行前，先以 codePointCount * 1000 > duration * 8 返回 empty。CaptionOverlayV2 将 empty 呈现成 overflow_status 空白。RebuildReview.withLayoutReview 又可能把这个纯呈现拒绝登记为 layout_overflow 的 repair risk。

从完整 history 提取18个 REBUILD_LAYOUT_FALLBACK，与近邻同 id 的 REBUILD_SELECTED 实际 renderInput/range 对照：18/18 均触发该门槛。包括：

| 源时间窗 ms | 送入渲染的译文 | 实际代码点/秒 | 结果 |
| --- | --- | ---: | --- |
| 49431–50635 | 小米 MIX Alpha， | 10.80 | overflow_status |
| 130537–132134 | 它真的是……零……边框吗？ | 8.14 | overflow_status |
| 147112–149709 | 我第一次把它从盒子里拿出来时也是这么想的。 | 8.09 | overflow_status |
| 183060–183905 | 那么，秘诀在于， | 9.47 | overflow_status |
| 365821–366935 | 但我发誓，这是我…… | 8.98 | overflow_status |

这证明空计划首先由速率条件触发。实际手机 Paint 下是否每条都能完整占两行，仍须新版本渲染验证；不能直接宣称18条全部可见已完成。Latin 品牌名、数字、空格和省略号也按普通代码点计数，旧门槛与专业字幕字符计数并非同一口径。商业指南的 CPS 是可读性参考，不能成为“句子能放下却完全隐藏”的理由。

低风险解法：保留已有成功中文切口；整句满足实际两行几何时，阅读速度只作 watch，按原拥有的完整事件窗口显示。硬约束仍包括两行、完整文本、不跨原时间、不污染邻句。真正必须多页时保持每页 >=1200ms；整体短窗且完整可放下允许原窗单页。不要统一加时、删字、概括或仅把8调高后继续硬拦截。

非中文当前已优先完整单页，但必须用相同“可读性参考不能独立致空”的合同复核所有14目标。不能把中文门槛复制给字母语种，也不能把 code points 用作所有语种统一计数。

### 3.2 14 个已就绪前导事件被合并逻辑主动压为空白

RebuildController.displayMergeForCurrent + deferredLead 分支只用于 legacy 路径（简/繁中文），会把符合 isLead 的完整已接纳事件一直隐藏到 continuation.start。isLead 的判定只是短文本且无指定终止标点，不能证明该译文必须隐藏。

诊断里14个 REBUILD_SELECTED id=deferred、text为空，对应原拥有窗口合计23526ms。这个数字是原窗总和，不是 measured wall-clock blank duration，更不能与18个fallback叠加当作总漏显时长。

具体强证据：block8 request16 在壁钟1791028736668已接纳；直到1791028772541才进入119338ms的deferred选择，提前约35.9秒就已取得译文。因此不属于网络晚到。

| 源/译文 | 原窗口 | 实际选择 |
| --- | --- | --- |
| with a 6.7- inch display... / 配备6.7英寸显示屏…… | 119316–121314ms | 全段deferred为空；121447ms才选择与“以及”合并的文本，合并窗121714ms结束 |

这样把原约1998ms的可显示时间压缩为合并尾部的极短时间，能直接解释用户看到的晚出、短闪、缺句。

低风险解法：一条已就绪且独立可排的译文按自己的 onset 开始显示；不再为下一句预留空白。continuation 真正开始后，合并仅作可选呈现候选。候选必须满足实际 pager、完整文本、当前剩余窗口及实际几何；失败即呈现当前独立事件，而不能连带吞掉两个原事件。现有 merger 允许12 CPS、pager又按8拒绝的自相矛盾也必须消除。不得提前泄露 continuation、改变原数据的 from/to/start/end，或在Session锁里增加昂贵排版。

### 3.3 时间对齐的全片事务回滚使可用锚点全部失效

N30 RebuildSource.align 使用唯一三词锚，匹配后替换局部原生词时刻，随后只要任何相邻词出现重叠就返回整个原 source。

对用户 supplied manual JSON3 与 auto JSON3 的**原生产函数**离线探针：

- manual=1224 estimated words；auto=1260 words，其中1221 NATIVE、39 estimated。
- 1131 unique anchor words，拟替换1122个NATIVE；拟合序列有44处冲突。
- align 返回同一个原 manual 对象，ALIGNED=0。未匹配的估计词和已匹配的真实词交界存在冲突，整片的其他有效锚也一起放弃。

低风险解法限定为保守局部提交：源文本、顺序、id与人工优先保持；将可信同序NATIVE锚组成局部连续段，验证段内和两侧未对齐边界。合格段独立应用，冲突/重复/语言不匹配/缺证据段继续保持ESTIMATED并说明英文reason，不让一处问题回滚其他安全段。不得靠剪短真实词、全片平移、按目标字数插值或按video id特殊处理来过关。该方案不能保证每个词都有真实对齐；只改善被可靠证明的部分。

现有RebuildCache.identity包含源start/end/precision/text；对齐结果变化会自然产生不同身份，旧cache不能按新时间强读。只改呈现不应清空/重写正确译文；UI语言与语义请求身份不挂钩。冷/热结果须相等。已有缓存不删除，但源时间/precision变更会造成一次合理的冷缓存失配；不伪装成所有旧缓存无成本复用。

### 3.4 格式风险与其他观察边界

同一N30解析器读取 supplied auto VTT得到6963 estimated词，而auto JSON3是1260词：内嵌时间标签与滚动历史行在coarse VTT fallback里不能作为可靠增量语音输入。当前会话人工JSON3的1224词已明确一致，这不是本次18/14事件的原因。

N34须检查现有JSON3优先传输与fallback判别，记录实际format/track_kind/hash/precision。若仅剩滚动VTT，不得把旧行重复当新语音或把时间标签送给模型；只能按格式结构证明carry/increment和原生onset，不能基于“重复词”全局去重。普通人工VTT、真实口头重复、跨说话人文本必须原样保留。该项若需要源格式独立适配，优先采用纯输入适配器与有界测试；不扩散到Session调度或供应商参数。

本次没有 REBUILD_LATE_UNREADABLE 或HTTP失败的证据，不因此修改 late gate / deadlines / retry caps。32结构接纳不能证明所有译文没有语义遗漏；不因本报告关闭冻结的4个既有失败或4个未验证。

## 4. 设置本地化的独立新设计

本轮重新从 patches-1.45.0.mpp 的原shared.mpe/shared-youtube.mpe读取DEX，而非沿用31/32 dump或实现：

- BaseSettings.MORPHE_LANGUAGE 是public EnumSetting；get()返回Enum，AppLanguage.getLocale()返回Locale；DEFAULT有独立分支。
- ResourceUtils.getString(String)及getStringByLocale(String,Locale)实际均调用 getActivityOrContext().getString；后一方法并未消费传入Locale。
- Utils.setContext才建官方ConfigurationContext，但活动Context可被ResourceUtils优先读取。因此单凭“232×14 XML齐全”不能保证中文Activity上的日语Morphe设置实际取日语。

N33仅新建**返回String/Locale的文本解析入口**：显式Morphe语言优先，DEFAULT跟随宿主；configuration副本仅用于本补丁资源读取，不用于构造任何View/Dialog/PopupWindow/Intent或执行动作。所有窗口、样式、click与异步提交保留N30 Context和处理路径，不修改官方设置DEX、不hook initialize/lambda/确认分支、不建跨窗口owner/epoch系统。

以自有稳定key和标准Preference/View生命周期刷新自有标题、summary、分类、输入hint、示例、五档名、按钮/Toast/accessibility。已核对SDK：PreferenceScreen是final，AI Screen保持原Framework类型与导航。由自有child在onAttachedToActivity和bind时通过getParent更新真实AI父屏的title/summary，分类才可用轻量PreferenceCategory子类。public Setting.key/Setting.preferences→SharedPrefCategory.preferences提供标准SharedPreferences语言变化通知，针对locale key合并一次main post，仅更新弱引用的自有树。没有官方DEX hook、全局View扫描或窗口epoch。保持排序、入口紧跟旁白且无图标。

默认翻译要求：UI本地化文字与运行时模型要求必须分离。N30的DEFAULT_PROMPT、effectivePreference、CaptionLanguageContext.preference存在不同路径，不能把新的UI取字函数直接代入runtime defaultPrompt。以N30请求/prompt/hash/cache探针锁定运行时内容，仅给未自定义的编辑器显示当前语言默认说明。任何切语言、rebind、滚动、profile刷新都不得把显示串自动存成custom；自定义原文完全保留。

Morphe设置语言与YouTube原生语言菜单的实际locale应分开：picker用Morphe UI语言，原生菜单排序继续按该原生菜单实际语言及宿主原顺序；不把Morphe override强加到整份YouTube原生列表。

## 5. 后续只分两期，分别封闭交付

| 期次 | 明确范围 | 主要验收 |
| --- | --- | --- |
| N33（下一卡） | 用户1–4：固定功能说明；语言名去状态与繁体校正；全14语种UI；默认显示/自定义保护；直接删除独立简体root | 真实设置树/真实点按、语言窗保存取消返回、API/model/save动作、主题与大字体、最终两根及DEX；字幕请求与呈现不变 |
| N34（随后） | 用户5：CPS硬拦截与defer通用修复、可选merge降级、局部对齐、source格式/呈现trace | 32响应离线重放；18/14事件逐项处理；全14目标高密度/短窗/标点/长词/RTL、冷/热、源覆盖和生命周期回归 |

N34详细执行卡在N33交付后按最终源码身份生成，不自动施工。N34允许修正上述已授权的呈现错误，不能为维持错误页预期而保留CPS拒绝/defer；正确旧黄金继续保护，原请求/译文资料与冻结历史不改，新增呈现差异另存live证据。N33的界面修复单独短验可定位设置问题，不要求用户阅读14语种。N34不重新设计并发，不增加远程调用、不改N30缓存优先启动、不恢复N27避让。

## 6. 证据、标准与边界

全部本地证据在 .verification/n33-planner：input-identities.json、rollback-delivery-artifacts-before/after.json、official-145-locale-api.txt、official-145-setting-lifecycle-api.txt、n30-ui-call-inventory.json、diagnostic-review-summary.json、diagnostic-layout-fallbacks.json、diagnostic-deferred-events.json、n30-production-source-probe.json及独立探针源码。规划过程未运行全项目Java/组合/DEX，不把N30历史669/669当成本轮执行。

一手规范核对：AOSP Activity/Context/ContextThemeWrapper/Preference源码；Android Preference lifecycle参考；W3C WebVTT的cue/时间标签结构；Netflix简中指南（成人参考9 CPS，Latin半字计数）及general要求。参考速率并非网络播放原时间窗里的隐藏许可，不直接更换已有所有语言参数。

- Android Preference：https://developer.android.google.cn/reference/android/preference/Preference
- AOSP ContextThemeWrapper：https://android.googlesource.com/platform/frameworks/base/+/refs/heads/main/core/java/android/view/ContextThemeWrapper.java
- AOSP Activity：https://android.googlesource.com/platform/frameworks/base/+/refs/heads/main/core/java/android/app/Activity.java
- W3C WebVTT：https://www.w3.org/TR/webvtt1/
- Netflix Simplified Chinese：https://partnerhelp.netflixstudios.com/hc/en-us/articles/215986007-Chinese-Simplified-Timed-Text-Style-Guide

不宣称新功能已修复、手机after通过或所有语种母语语义合格；只有源码回退、输入身份、诊断对应及上述原生产解析探针已由本规划者验证。
