# N30运行时本地化审阅与N31规划

日期：2026-10-03（Asia/Shanghai）。N30工程交付证据通过，但用户真机日语复查发现设置界面仍有大量中文。本轮只读审阅源码、N30报告和用户反馈，未修改产品代码。

## 1. 结论

N30把静态资源数量从220扩展到232并通过了资源解析、fallback、布局和受控Host测试；这不能证明Morphe实际运行时的PreferenceScreen已经按应用语言渲染。用户切换日语后仍看到中文，说明当前本地化链至少存在以下断层之一：

1. 动态生成的Morphe XML只在打包资源层绑定`@string`，但宿主的语言覆盖由`ResourceUtils`/自有Locale上下文提供，Preference对象实际读取的是宿主默认资源；
2. `CaptionStrings.settings(Context,key)`能取得动态文案，但多数Preference标题/分类/summary在XML inflate阶段已经固定，之后没有统一运行时重绑定；
3. `DeepSeekSliderPreference`、`DeepSeekTextPreference`、`CaptionDiagnostics`、预览组件等动态控件分别取`getTitle()/getSummary()`或局部字符串，未经过同一个应用语言解析器；
4. 默认翻译要求、预览sample、字号档名/说明、诊断正文/按钮虽有资源键，但显示面与导出面没有严格分层，某些技术或用户可见内容仍沿用了中文源字符串。

因此，N30的“232×14”和本地Robolectric截图只能作为必要的静态证据，不能关闭此前三项本地化问题。N31必须以真实Preference树和运行时文本为验收对象。

## 2. 用户已确认问题

- 自动翻译语言入口的summary没有清楚说明“把语言添加到YouTube自动翻译语言列表”；N31要改为完整说明，而不是泛化的“选择语言”。
- AI字幕翻译入口summary没有说明“选择自动翻译语言中的语言后，使用已配置AI服务实时翻译字幕”；N31要用明确功能说明。
- 切换到日语后，翻译要求、字幕预览sample、字号滑条下方的档名/说明、字幕诊断等仍出现中文。N31必须全面检查所有设置页面可见文本和运行时动态文本。

## 3. N31的通用解决方向

N31不再把每个中文源句逐一映射当作主要机制，而建立统一的运行时文本层：

- PreferenceScreen装配完成后，遍历本补丁拥有的Preference和PreferenceCategory，按稳定key调用`CaptionStrings.settings(context,key)`设置title/summary；不依赖Android XML当前Locale是否恰好正确。
- 动态Preference在`onCreateView`/`onBindView`/`notifyChanged`时都从key解析文字，不从中文title/summary反向匹配；输入保存的用户prompt/profile名称/翻译原文不经过本地化。
- 预览、字号滑条、档名、档位说明、透明度、按钮、Toast、确认对话框、语言多选弹窗、模型列表、诊断面板都使用key和当前应用语言上下文。应用语言变化后重新打开页面或触发配置刷新必须得到同一语言，不能保留上一次缓存文本。
- 技术诊断内容分三层：用户可见的标题/按钮/说明随应用语言；程序性stage、字段、reason、错误代码始终英文；source/translation/user prompt/provider原始证据保持原文。N31不能把诊断整段直接翻译，也不能把中文技术字段留在日语界面。
- XML资源仍保留，供宿主和无运行时覆盖场景使用；运行时绑定是最终权威。所有key必须有14语种值，但不以资源表齐全替代运行时检查。

## 4. 审计范围

逐调用点建立inventory：AI入口、启用开关、自动翻译语言入口和summary、普通/Shorts菜单开关、API方案、API地址、Key、模型、测试连接、删除Key、翻译要求、默认要求、字幕预览标题/sample/hint、字号滑条标题/五档标签/档位说明、透明度、恢复位置、缓存清理、文本调试、字幕诊断、复制/保存/清除/展开/收起/失败Toast、语言多选标题/纯语言名/勾选/按钮/空集合（不显示视频状态）、所有自定义Dialog和 fallback。

特别检查四类不易被静态键检查发现的内容：

1. 直接`setText("中文")`、`setTitle("中文")`、`setSummary("中文")`、`Toast`、`AlertDialog`、`PreferenceCategory`和Java/Kotlin fallback；
2. XML inflate后没有运行时重绑定的标题/summary；
3. `getTitle()/getSummary()`读取了已固化的中文而不是key；
4. 诊断正文中把技术字段当作用户可见翻译，或把程序性英文错误误回退成中文。

每个调用点记录：文件、方法、控件key、文案key、数据性质（UI/技术/用户内容/原始证据）、语言来源、刷新时机、14语种运行结果、是否允许fallback。

## 5. N31任务卡范围

N31只做本地化和文案闭环，不重新设计翻译策略、分页、调度、缓存、播放器转场或官方1.45兼容。必要的运行时文本绑定可修改Preference装配和动态控件，但必须保留N30的显示/功能合同。

- 修正两个summary：自动翻译语言入口说明加入YouTube自动翻译列表；AI入口说明加入选择自动翻译语言后使用AI服务实时翻译。
- 建立统一运行时本地化绑定器或等价机制，覆盖XML Preference、动态Preference、预览、滑条、诊断、Dialog、Toast和多选语言入口。
- 运行时切换应用语言，至少验证中文、英文、日语、法语、阿拉伯语；其余9种验证资源解析、fallback禁止、文本长度/RTL/布局边界。禁止用“当前宿主没有该语言”跳过已声明支持的语种。
- 默认翻译要求必须按当前应用语言生成；用户自定义要求原样保存。预览sample和字号档名必须随应用语言变化；诊断用户壳随应用语言，程序性内容英文，原始证据不改写。
- 若Morpe宿主的语言覆盖只在ResourceUtils生效，必须把同一解析器注入所有本补丁自有动态控件；不要只修Android `Resources`或只增加XML文件。
- 运行时审计失败条件：任何声明支持语言的设置页面可见中文源文、上一语言残留、裸key、英文fallback（除明确英文技术字段）、截断/重叠、技术字段中文、用户原始prompt被改写。

## 6. 验证与交付

- Java全量保持通过；原N30 669、68专项、400轮、7组合、11DEX和中文18golden作为回归，不因本地化改动改变业务结果。
- 新增运行时Preference树测试：14语种×所有inventory调用点；至少中文/英文/日文/法文/阿拉伯语输出真实标题/summary/preview/slider/diagnostics；动态刷新前后文本一致且不缓存旧语言。
- 真实APK资源表检查只做辅助；另需最终APK中模拟语言切换的截图或文本快照、技术字段英文扫描、中文源文残留扫描和14语种fallback扫描。
- 保持Python27/27、冻结4/4/4、三个invisible_ms全0、ACCEPTANCE/frozen零diff。N31不重新定义冻结分数，也不把本地化检查变成翻译语义认证。
- 三件套路径使用`*-n31.mpp`、`*-n31.mpe`、`n31-composition-final/*n31-unsigned.apk`；不覆盖N30/N29历史。提交核心commit和`anchor/n31-<真实短哈希>`，两份PROJECT-STATE同步。未签名、未安装、未发布。
- N31完成后用户只需做一次短复验：切换日语/英文，查看视频设置、AI子屏、翻译要求、预览、字号、诊断和多选入口；提供截图/完整诊断即可，不需十四语种母语审校。

## 7. 本轮真实代码与N30最终APK核查，补强N31定案

基线实际HEAD fa10360，源码d5ca720/anchor/n30-d5ca720，只有已存在N31规划docs/状态改动，产品无差异。已阅读现有N31草稿后补强而非盲目覆盖，原草稿快照保存.verification/n31-planning。N30全量669等是执行者证据，本轮没有重跑产品测试/改代码。

### 确定的文案与状态展示原因

CaptionLanguagesPreference.refresh把languages_summary替换为languages_empty或languages_count，所以已有“添加到YouTube菜单”的资源不会成为用户实际summary。修复需让功能说明始终出现：未选/已选/保存/滚动重绑都不能只显示统计。

showLanguages按languages_entry模板拼LanguageMenuOrder.label与NativeCaptionBridge.languageStatus，后者从正在播放视频的metadata得到已存在/新增/不可用。用户要求隐藏，N31每行只保留UI当前语言名称与勾选框；不调用状态显示，不以灰字/图标改写展示，不删或禁用14候选，不改真实YouTube菜单能力和code集合。

中文定案：语言说明“将所选语言添加到 YouTube 的‘自动翻译’语言列表，可同时选择多种语言。”；AI summary“启用后，在 YouTube 的‘自动翻译’列表中选语言，使用已配置的 AI 服务实时翻译字幕。”。其他13种传达同语义。

### 已验证的语言来源断层

N30LocalizationRuntimeTest以createConfigurationContext把Context换成目标语言；它没有保持原Activity/Application中文、同时只修改Morphe语言覆盖的主矩阵。截图主要手工TextView，仅少量真实Preference，未完整创建用户指出的默认编辑器/预览Canvas/滑轨/诊断对象。因此232×14可通过而实际应用仍中文。

反读N30正式unsigned APK classes2：ResourceUtils.getString→getActivityOrContext→Context.getString；getActivityOrContext受useActivityContextIfAvailable影响，可以选择Activity。Utils.setContext根据BaseSettings.MORPHE_LANGUAGE/AppLanguage.getLocale创建语言化Context，但它与Activity并非同一对象。当前CaptionStrings.settings只调用前者，并注释其必尊重覆盖；这项假设没有保证。更值得明确，实际getStringByLocale方法体同样未应用其locale参数，不能仅改成调用这个方法便认定修复。

N31以显式Morphe选项确定UI locale，DEFAULT跟随真实宿主Context，而不是系统Locale猜测；在本补丁自己的ConfigurationContext读取cap资源，统一按key绑定所有拥有的Preference/Category与动态控件。不能改官方全局Utils/ResourceUtils或Locale全局状态。附加before回归须让官方API可用但选择了中文Activity，从而证明新逻辑解决真实断层，不再只测无官方类时的fallback。

证据：.verification/n31-planning/n30-final-resourceutils.txt、n30-final-utils-context.txt、planning-observations.json。它们是最终包静态调用证明，不是用户手机的内部配置快照；具体当前选项来源仍由受控主矩阵/有限手机复验核实。

### 默认要求和技术诊断

Snapshot已区分program_default/stored_custom，initialValue当前直接取Snapshot.prompt。UI修复要分离内建默认展示与业务偏好：只有明确program_default显示当前语言；用户custom/草稿原文不替换，程序语言更新不触发自动保存/改profile。中文兼容默认与既有非中文effectivePreference保持，跨UI变化的请求与cache身份稳定并保留18golden。

诊断交互壳/title/hint/buttons本地化；程序报告body/导出stage/heading/field/reason英文；source/译文/用户内容/provider及实际显示文本证据原样。不能为了残留检查删除中文用户证据或把它们送入子串替换器，也不能把日语正常汉字误报成中文。

### 本轮结论

N30业务工程交付不回退，本地化运行时依然未闭合。N31是一张通用UI来源与绑定修复卡，覆盖14语种全设置inventory，不对日语加独立语言/视频特判。原有N31任务已细化主矩阵、反例、各动态控件、自定义数据/请求稳定性、隐藏状态和准确说明。没有新N31源码/三件套或手机验收结果，完成后再由用户中文→日语→英语短复验。
