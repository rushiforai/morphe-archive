# N33 Codex 执行卡：N30 独立重建设置本地化、功能说明与两根交付

日期：2026-10-03（Asia/Shanghai）。Codex 单执行者实现、验证、独立建包、本地提交，完成即停。**本卡取代旧 N31/N32 卡；不得继续 N32 WIP，不自动开始 N34。**

## 0. 成果与最高优先级

从已恢复的 N30 产品树重新实现用户需求1–4：

1. 自动翻译语言小字准确说明“把所选语言添加到 YouTube 自动翻译列表”；列表只有本地化语言名和勾选框，没有视频可用/不可用等状态；外观保持 N30/Morphe；繁体中文名字纠正。
2. AI 入口说明明确启用后在原生自动翻译列表选择目标语言，使用配置的 AI 服务实时翻译。
3. 十四语种完整覆盖本补丁设置树、动态控件、默认要求显示、样式预览、五档名、诊断UI及所有按钮/提示/弹窗。仅对未自定义默认要求提供本地化显示，不覆盖用户数据，不改变请求策略。
4. **直接删除**独立公开补丁 Add Simplified Chinese to auto-translate，公开根只剩 AI caption translator 和 Remember caption selection。AI 内既有多选添加语言能力照常保留，AI运行关闭也能保留用户选入的原生语言。

N31/N32 仅可作为失败历史。N31 的 catalog/XML 字符串值可以校对复用，**不得移植任何其他31/32源码、hook、UI/window binding、epoch/owner guard、测试替身、脚本或构建结果**。也不能以回滚N31代码后重新加回来作为独立实现。

本卡不处理字幕漏/晚/短机制：已由规划者定位，安排 N34。Rebuild分页、源计时、调度、缓存、提示词策略均保持N30。把设置和呈现两种变更混在一包，会失去明确验收边界。

## 1. 开工核对与允许的 docs 后继

实际仓库 E:/Projects/morphe-caption-v2。先读 docs/PROJECT-STATE.md 最新§4ar/4as、docs/N30-SECOND-RESTORATION.md、docs/N33-REPLAN-AND-DIAGNOSTIC-REVIEW.md，再读本卡。

- 源产品基线 d5ca720ecf0c83349ea232d929ee09b11840c65a / anchor/n30-d5ca720。
- 新恢复提交 7d6821e772b9959158dd7ac41bd7e626aef48d1c / anchor/n30-restored-7d6821e：全部 tracked 非 docs 与 d5ca720 相等。之后本规划聊天增加新执行卡/状态等docs是正常开工HEAD，**不要因docs-only后继短哈希不同停工**。
- 开工HEAD需为恢复提交后继，且相对d5ca720所有tracked非docs无差异。没有产品差异、只有docs增补即直接开工并记录实际HEAD；若有他人产品改动先保留并审阅，不能覆盖。
- 两份PROJECT-STATE先比字节/SHA：仓库docs/PROJECT-STATE.md及 C:/Users/14776/Documents/kimi/tasks/2026-09-29/00-35-52-ec1208d7/PROJECT-STATE.md。无差异跳过；保留本规划者新段落，不用旧交接包覆盖。
- 唯一允许的未跟踪官方输入 patches-1.45.0.mpp：SHA256 DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93。原版YouTube宿主21.16.256/minSdk28；使用既有original APK，不把手机已打补丁APK再次作为宿主。
- 本轮80件历史交付哈希已捕获于 .verification/n33-planner/rollback-delivery-artifacts-before.json 与after.json，均不改。新卡开工再捕获历史产物/原证据身份，交付复核。
- 所有产物/记录用新 n33 路径，不覆盖N30/N31/N32、provisional包或旧证据。

## 2. 独立设计已经定案，执行者不另做架构选择

### 2.1 文本解析入口只返回 String / Locale

在本补丁命名空间新增小型、无持久化副作用的UI文本解析器。可用新类名；不得恢复 CaptionUiLocale / CaptionPreferenceBindings / CaptionUiWindows 等旧31/32类型。

1. 优先只读官方1.45.0的 BaseSettings.MORPHE_LANGUAGE。其类型为 EnumSetting，public get()返回Enum；实际AppLanguage实例的getLocale()返回Locale。先核对对象类型/方法，再调用；DEFAULT跟随宿主资源locale。读取失败使用宿主locale，最后英文。
2. 不改变Locale.setDefault，不调用全局Resources.updateConfiguration，不写Morphe设置，不切官方ResourceUtils.useActivityContextIfAvailable/Utils全局Context。
3. official ResourceUtils.getString与getStringByLocale实际未保证override，这一点已从本轮原MPP独立读DEX确认。不要再只转发它们并宣称locale已适配。
4. 在函数内部复制调用方Configuration、设置已解析Locale，仅用临时资源Context读本补丁cap_*字符串。优先沿用原XML资源ID/实际宿主资源包名解析，不把改包后的manifest名字当作资源表包名保证；最终APK实测资源ID能够读取目标locale。**函数对外不返回Context，任何状态对象不保存资源Context/Activity/Window；资源Context不传给View、Dialog、PopupWindow、Toast、Intent或业务动作。**
5. normalize范围：en/zh-Hans/zh-Hant/es/fr/de/pt/ru/ja/ko/ar/hi/id/vi，Android资源qualifier zh-rCN/zh-rTW、id/in别名正确；对未覆盖locale使用英文fallback。中文script和CN/TW/HK/MO按现有语言映射，不靠字幕内容猜UI语言。
6. XML、catalog、生成fallback完全同步。所需语言资源缺失时用对应locale的生成文本或英文完整文本，不向UI暴露key，不默默回中文。
7. 主入口 CaptionStrings.settings/get 的本补丁UI调用统一到该解析器；严格把下面2.3中运行时默认要求读取隔离，防止取字修复改变模型请求。

源依据：.verification/n33-planner/official-145-locale-api.txt来自本轮独立官方MPP解读，不是旧31/32成果。

### 2.2 刷新限定自有Preference/View生命周期；导航、窗口、动作沿用N30

不hook官方 AbstractPreferenceFragment.initialize/lambda/语言确认分支；不改该官方类的DEX，不为这张卡添加新的设置字节码hook。使用Android标准Preference构造/绑定/自有View attach和重新进入界面的时机。

- 每个自有控件明确绑定原始资源名或稳定key。普通标题与summary可从XML AttributeSet原title/summary资源名绑定，避免按当前中文可见标题搜索/部分替换。
- **android.preference.PreferenceScreen是final，禁止尝试继承它或替换其导航。** AI根仍原Framework PreferenceScreen；由现有自有child（建议DeepSeekEnabledPreference）在onAttachedToActivity/自有bind里getParent()取真实AI父组，精确核对morphe_vot_screen__ai_captions后只setTitle/setSummary。onAttachedToHierarchy阶段parent可能尚未assign，不能把此阶段未找到parent当永久失败。分类可使用本补丁轻量PreferenceCategory子类，从原AttributeSet资源ID保存文字slot，只刷新title并调用super。其他Morphe屏/YouTube页类型不动。
- 原category没有key时保留原排序键语义；不因增加android:key让它改变宿主_sort_by_key顺序。内部文字标识可以是自有私有slot，不改变Preference持久化/排序key。
- 自有现存Preference在onCreateView/onBindView/重新进入时用原metadata刷新；分类、页面标题、动态子TextView全部覆盖。不能仅改Preference标题却让其自绘title TextView继续读旧中文。
- 显式语言在同一设置树变更时，由上述自有child绑定**一个标准SharedPreferences监听器**：读取MORPHE_LANGUAGE实例继承的public Setting.key作为实际locale key、Setting.preferences（static SharedPrefCategory），再读该category的public preferences得到SharedPreferences。不猜存储文件名/硬写key，不回调Setting.save/load，不改官方对象。只过滤该locale key；main Handler合并一次post，在官方保存调用栈返回后读取新Enum/locale并刷新弱引用持有的AI自有树及其当前可见控件。首次attach同步刷新；DEFAULT/system configuration变化靠正常重建/bind。不得提前在官方语言确认对话框尚未保存时刷新。
- 监听器每个实际AI父组只注册一次，弱引用child/root，不持有Activity；onPrepareForRemoval/父组替换时注销并取消旧post，弱目标已消失时自注销。无窗口epoch、无click许可；每次locale change只遍历缓存定位的AI子树一次，不扫描全Morphe树或View树，不轮询。现有字段/方法已由本轮官方DEX确认于 .verification/n33-planner/official-145-setting-lifecycle-api.txt。
- 不另建Fragment、全局树扫描器、周期轮询、导航代理、跨Activity窗口owner注册或epoch许可系统。
- View/Dialog/PopupWindow创建以及按钮实际动作全部保留N30 getContext()/已有活动Context及处理路径。调用边界只换已解析的String/Locale，不换Context，不修改listener职责或加可能吞点击的owner/attach/epoch先决条件。
- AI仍在视频页紧跟Voice over translation之后，单一入口，无图标；返回层级、Preference keys/17个历史持久化key、SharedPreferences名、Keystore alias不变。
- 语言窗口以N30现有 AlertDialog.Builder(getContext())、multi-choice列表及当前Activity主题为基线：只换label和说明，不重建一套dialog chrome/颜色，不调用setTheme猜宿主主题。与Morphe同一明暗主题逐项实测。
- 若本地Morphe显式阿语而Activity中文，自有标题/说明/样例设置正确textLocale，自有行/slider/preview内容设置正确layoutDirection/textDirection；仅自有View调整，API URL/key/model等数据仍LTR，保留N25物理映射和N30几何。不得改目标字幕方向策略。
- 异步API/model/save结果在原UI handler里按结果提交时当前UI locale格式化文字；保持N30的profile保护、启禁与真正业务调用。不得因切语言把按钮长久禁用或静默丢结果。

### 2.3 默认翻译要求显示与模型请求分离，用户数据零损失

先核对实际N30：DeepSeekConfig.DEFAULT_PROMPT是中文；Snapshot.effectivePreference的program_default是固定英文；CaptionLanguageContext.preference在en→zh-Hans/Hant读cfg.prompt、其他方向读effectivePreference。直接把runtime defaultPrompt接入新UI解析会改变请求与缓存，禁止这样实施。

- 新增或使用单独的displayDefaultPrompt入口，仅供默认编辑器显示，按UI locale取default_prompt文字；不要把该显示值作为cfg.prompt/effectivePreference/fingerprint/请求JSON/cache identity。
- N30运行时默认读取和既有canonical内容单独保留：可将原CaptionStrings的官方/宿主读取逻辑局限到runtime default读取的private legacy函数，使UI新解析与模型旧路径分离。该例外必须明确标记只用于业务默认，不再供任何可见文字调用。
- 默认/自定义判定沿用N30原持久化sentinel与preferenceProvenance；UI editor额外记录“默认展示、programmatic更新、用户真实编辑”。语言切换的显示rebind不能变成用户编辑或触发850ms autosave。
- 切语言、滚动重建、切profile、flush、保存/复制方案时，未编辑默认不得被locale旧显示串存成stored_custom；clear/reset仍恢复program_default；不把所有恰好等于某locale默认句的已存自定义值强制迁移。
- custom requirements、URL、key、模型名、profile名、选中语言集合原文原字节保留。用户输入中文在日语界面保留中文是正确行为，不应全局“去中文”。
- before/after探针必须覆盖默认与自定义、en→zh-Hans/Hant以及neutral路径。比较cfg.prompt、effectivePreference、RebuildApi.prompt/hash、实际request JSON、RebuildCache.identity、source/block/page输出；在同一N30业务Context/config/target下全部相等。新增UI resolver的locale、显示文字变化不得影响这些比较。
- 不修改CaptionLanguageContext、RebuildApi/Protocol/Cache/Planner/Source/Pager/Controller业务实现来掩盖identity漂移。本卡只允许DeepSeekConfig/文本编辑器作最小显示/默认状态隔离。

## 3. 用户需求1/2的精确文字与语言选择行为

简中最终固定文案：

- AI入口summary：启用后，在 YouTube 的“自动翻译”语言列表中选择目标语言，即可使用已配置的 AI 服务实时翻译视频字幕。
- 自动翻译语言summary：将所选语言添加到 YouTube 的“自动翻译”语言列表，可同时选择多种语言。
- 简中picker名：中文（简体） / 中文（繁体）；繁中picker名：中文（簡體） / 中文（繁體）。不能出现中文（繁体中文）、中文（繁體中文）。

十四语言都有意义等价的完整资源，不拼中文短句/状态。N31翻译文字可从dc304cb的catalog/XML读取或本轮纯文案导出校对；只复制string值，不带旧代码/测试/绑定器。

CaptionLanguagesPreference：

- summary始终说明添加到原生列表，不随选中数量、视频、available状态或AI运行开关替换成别的文字。需要数量时可另附简单本地化辅助文本，不遮住功能说明。
- 14项仍使用CaptionLanguageSelection.CODES；多选/save/cancel合同不变。每行只有对应UI locale语言名+checkbox；完全移除NativeCaptionBridge.languageStatus取值和languages_entry状态拼接在这个picker中的使用，不改原生菜单可用性逻辑。
- 12个非中文语言名可用Locale.getDisplayLanguage(uiLocale)，简/繁用明确本地化资源防止ICU生成重复script称呼。标签、排序、placeholder不能从中文Activity误取。
- 保持N30 picker的语言顺序/多选逻辑；保存不改未选项，取消/Back不写入。独立语言列表初次仍为空，禁止强制添加简中。
- 设置picker用Morphe override；YouTube原生菜单继续使用其实际locale及原生排序。不要把新的Morphe UI locale强塞给整个原生菜单Collator，不对宿主已有项做全局重排。
- 已存在原生语言不重复添加；添加语言按现有N30排序规则融入原菜单。没有视频/AI关闭仍可配置，纯原生路径API0。

## 4. 全UI本地化逐角落清单

必须提交实际控件→来源资源/key→locale→运行时观察的inventory，不只提交键齐全报告。规划者已从N30扫描出141个UI调用点、22类，保存在 .verification/n33-planner/n30-ui-call-inventory.json；执行者扩展任何漏项后覆盖下表。

| 区域 | 必验内容 |
| --- | --- |
| 视频入口/AI屏 | title、固定summary、AI开关、普通/Shorts快捷菜单说明、screen/category标题、返回标题、accessibility |
| 自动翻译语言 | 14纯语言名、标题、save/cancel、固定summary、选中状态；无视频status；明暗主题与N30一致 |
| API方案 | 当前方案/列表、create/copy/rename/delete/key-clear确认、按钮、验证错误、空态；用户名称原样 |
| URL/Key/Model | 标题、hint、说明、自动保存状态、校验错误、显示/隐藏、刷新与载入状态、模型PopupWindow无数据/失败；key/url/model数据原样 |
| API测试及动作 | 未填key/失败/成功/重试说明、reset position、clear cache、清key、所有Toast；按钮真实响应 |
| 翻译要求 | 默认locale文案、恢复默认/placeholder/hint、custom原样、切语言与profile无自动写入 |
| 字幕样式 | 样式标题、五档名、上下详情/全屏数值模板、opacity说明、示例句、样式预览（全屏）、拖动/reset提示；预览不新增重复标题 |
| 诊断 | expand/collapse、refresh/copy/save/clear、长说明、确认与成功/失败、Android9分段标题/项/Toast、debug说明、Token audit UI壳 |
| 内嵌编辑/quick toggle | 自有hint/accessibility/已有动作文本；UI与播放器状态文本符合当前patch UI语言，不改原生选项 |

技术诊断与可见UI分层：

- 技术报告heading、stage、field name、reason、unit/header等程序性内容英文。导出fullText原始稳定结构不因UI语言变化；内部原本中文描述若确为技术信息，可仅修文字为英文，不改事件/判断/参数。
- 控件标题、按钮、提示、说明、保存成功等按Morphe UI语言。需英文的报告正文不能自动作为“日语适配没完成”误报。
- source/translation/custom要求/模型/provider原文等数据保留原文，包含中文也合法。不对诊断全体做“不能有任何Han字符”的测试。
- 不拿localize的中文substring替换用户文本、URL、key或原始报告。常量UI用stable resource key，动态句子完整模板+参数，避免双冒号与拼接残留。
- 字号轨道尺寸、五档与N25 inset/fraction、CaptionSettingsStyle色值/间距、字号默认/保存和preview测量保持。只调整文案/本补丁UI方向，不能缩字掩盖未适配或砍断标签。

## 5. 直接删除独立简体root的最小范围

从N30 CaptionFeaturePatches.kt删除simplifiedCaptionLanguagePatch公开声明；正式生成器重生成patches-list.json，README公开清单改为两项。不得照抄N32合并实现。

- AI原本已经拥有语言菜单添加能力，不需要重新“合并”菜单/导航/实体hook。
- 如保留现有内部simplified布尔/安装函数签名，必须只能保持false并证明无第三root能置true；无需为移除一个公开项重写NativeCaptionBridgePatch实体hook。若删除无调用的内部数据，仅限受影响签名，序列化DEX必须不改变其余hook逻辑。
- AI-only、Remember-only、AI+Remember三种有效root组合必须通过；未知旧root选择具名拒绝，不悄悄选别的root。
- AI安装但运行OFF，选择法语+简中后仍可加入native菜单、已有简中不重复、API0。Remember-only无AI设置入口、不注入用户自选语言，记忆选择仍正常。
- final MPP、内嵌extension、patches-list/manifest实际反读确认两根，不能只看README或源码声明。

## 6. 冻结范围与低风险施工边界

完整保留：N30缓存优先bootstrap；focus2/prefetch2/total4、lookahead/seek storm、retry/repair caps；R1/CAS发布与后台barrier、同key提交顺序；N30延后/合并几何分发；原生draw遮罩许可；源650ms/speaker硬拆块；全部现有翻译/分块/语义/分页/字体/缓存策略。N27避让和Always show shim继续不存在；VISIONOS已由用户解决不碰。

允许改动：本补丁设置Preference/preview/slider的文字绑定与UI方向、CaptionStrings和生成纯翻译资源、显示默认状态所需DeepSeekConfig/ApiProfiles最小改动、CaptionDiagnostics/TokenCostAudit纯文本分层、公开root/metadata、资源装配中自有Category tag与自有文字metadata（原Screen tag/导航保持）、相应新验证和交付记录。

不得修改Controller/Session/Cache调度、target/source语言政策、provider request参数、字幕事件正文/时间、host General导航、官方设置Fragment字节码。captionoverlay/quicktoggle若需统一状态文字，只换UI读取调用，不改render时机、许可或geometry。

本卡所有标准UI修正及本地检查已授权，不因docs后继、resource string新增、旧UI断言需更新或编译缓存失效再次暂停。真正需要新增依赖/下载/远程API/手机写入或业务范围扩张时才记录并停止。

## 7. 验证必须把“读到文字”和“点击起作用”分开

### 7.1 先建立N30 before，再验证实际N33控件

- 用实际N30生成XML、现有生产Preference及原官方1.45.0，构造“Activity中文、Morphe显式ja/en”before。只将整个测试Context改成日语是无效本地化证明。
- 同样结构after覆盖14显式locale＋DEFAULT，至少包括反向“Activity日语/英语，Morphe中文”、zh scripts及id/in。official API test stub只可依据本轮官方DEX签名重新写，不能借用N31 stub；模拟器必须用真正官方类，不用stub假冒。
- 截取真正自有PreferenceScreen/ListView及真实child views的文字、hint、contentDescription、分类、默认输入、slider、preview、diagnostics壳。不要手拼14张TextView截图。
- 14×{320,420dp}×{fontScale1.0,1.3}×{light,dark}做运行时测量；long文本不省略、不裁切、不重叠，档名最多两行且中心/端点合同保持。preview真实生产View最大档完整单行、lineEnd全长、墨迹在视频框内。
- 至少导出中文/英文/日语/阿语320dp大字明暗屏幕及picker，核对文字位置/按钮/配色，不只资源字符串池。

### 7.2 真实Android交互是交付门槛

本机已有SDK35模拟器；可以在**明确选定的emulator序列号**中运行最终APK测试副本或从最终DEX/resources独立构建的自有验证宿主。不要使用N32 host脚本/类/候选；新宿主独立实现。实际最终APK副本优先。测试副本签名/安装仅限模拟器独立临时位置；正式交付APK仍unsigned且不改哈希。

物理手机仍只读：不安装/启动/清数据/log clear/push/app_process。不能把模拟器操作省略序列号而落到手机。

- 完整Morphe根→视频→AI→真实ListView经官方debounced listener→语言窗口可见（非仅Dialog创建/handler进入），save/cancel/Back返回AI页，不出现General误导航或进程意外重启。正常General原入口也测试返回。
- picker全14纯名称、checkbox/save/cancel、无status；选两语种、保存、重开、取消修改、返回后持久化一致；明暗两次。Morphe原语言选择若官方要求确认/重启遵从官方流程，本功能不能另触发重启。
- **真正点按API测试、模型刷新、保存完整诊断**：不是直接调用performAction函数。API和model通过本地mock provider/loopback或明确10.0.2.2，不发远程翻译API；assert请求到达本地端点、完成后UI反馈、按钮恢复enabled、模型popup可见且选择生效。
- 空key路径可用本地化Toast验证，但不能只测空key代替真实本地response完成链。
- 保存诊断：SDK>=29验证MediaStore实际文件写入完成/IS_PENDING清除、内容与raw报告一致和成功反馈；SDK28按既有分段复制验证标题/序号/点击/clipboard数据。不要擅自把N30导出改成文件选择器。
- 重命名/删除profile、清key、清cache、reset position与清diagnostics各验证一次；local mock失败/成功、切profile后的结果合同保留。不因窗口显示正常就宣称每个按钮都起作用。
- 对新代码确认没有把resource Context用于任何窗口/View/service动作，没有新的静默early-return吞点击；真实WMS/ART日志无VerifyError/BadToken，PopupWindow确实可见。
- 若真正宿主环境不能跑某项，明确未验证，保留候选，**不标本卡完成/不让用户装大包替代基本交互验收**。不以Robolectric Dialog shadow或Class.forName成功作WMS证据。

### 7.3 业务和最终产物

- N30历史Java为669/669，Python27/27；重新运行当前真实全量，报告实际新增分母，不虚报695或旧全量。新测试对应locale失配、click与数据副作用，不能只镜像新实现。
- 旧UI断言若明确要求status/旧summary，允许只修该断言并逐项留before/after理由；不得削弱源覆盖、默认请求、中文golden、分页、Publication/lock/lifecycle等原断言。旧测试文件差异清单留档。
- 18组中文golden与原专项/受控并发回归不改；default/custom请求与cache/source/page对照必须同N30。UI刷新写配置=0，UI单独变化新增API=0。
- localization检查基于实际最终key数×14，检查placeholder/转义/fallback；finalAPK真实resources.arsc及生成XML必须与生产控件资源一致。
- 三组合＋正式MPP自身组合通过；现有结构84项保留，第三root有关分母/marker差异如实说明；未知root/残缺bundle仍reject。实际11 root DEX逐个branch/API/hook/resources/aapt审计；类总数按新增类型实报。
- 特别确认最终DEX无CaptionSettingsBindingPatch所致官方设置方法修改、无31/32新增类型、无N27callback/avoidance；从最终APK对照official settings方法与N30语义一致。
- MPP内嵌MPE与独立MPE字节相等，ZIP/DEX/resources/metadata通过，unsigned由apksigner按预期拒绝验签确认；不签正式交付包。
- 冻结scoreboard保持4通过/4既有失败/4未验证，三invisible_ms=0；ACCEPTANCE/frozen原事实不改。不能拿冻结结果宣称所有语义通过。
- 历史80件及开工捕获的新增旧候选/原失败证据均大小/哈希不变。模块编译缓存可清理，但不要跑root clean或递归删root build/，它含全部历史交付。新编译不能借用N31/N32 build classes/fixture，不使用被保存的n32工具。旧测试的N25_PREVIEW_OUTPUT/CAPTION_UI_PREVIEW_OUTPUT/N30_EVIDENCE_DIR等输出变量全部指定新n33目录，避免覆盖历史fixture。

## 8. 独立交付与停止

产物必须是新的：

- E:/Projects/morphe-caption-v2/build/local-test/patches-1.3.5-本地测试包-n33.mpp
- E:/Projects/morphe-caption-v2/build/local-test/extension-1.3.5-本地测试包-n33.mpe
- E:/Projects/morphe-caption-v2/build/n33-composition-final/YouTube-21.16.256-本地测试包-n33-unsigned.apk
- docs/N33-LOCAL-TEST-BUILD.md：完整hash/bytes、源码身份、scope/locale/default协议、真实UI/WMS点按结果与未覆盖、旧测试改动、用户短复验。
- .verification/n33/：before/after、真实控件inventory、frame/主题对照、API/model/save动作记录、request/cache parity、三组合与最终DEX、历史哈希。

产品版本仍1.3.5，官方组合1.45.0；host compatibility原21.16.256/minSdk28不扩大未经证实版本。正式metadata/README与两根一致；发布URL、仓库公开源信息不改。

通过后本地一个实现提交并建anchor/n33-<真实源码短hash>；不amend。允许docs-only身份补记后继，源树必须与锚点相等。两份PROJECT-STATE同步，工作区除官方输入外干净。失败候选/负例保留，不以最后成功覆盖旧失败。

最终汇报先写真正完成行为、源码/anchor、三件套绝对路径与完整SHA、真实测试/模拟器边界。用户短复验仅需：入口说明、语言选择save/cancel/返回、API/model/save三动作、日语默认/preview/档名/diagnostics壳、原custom/key/profile仍在；不要求14语种母语语义验收。

完成即停，不生成DeepSeek卡、不自动执行N34、不安装用户手机、不清数据、不推送/发布；远程翻译API/新依赖/下载=0。
