# N31 Codex执行卡：设置运行时语言统一、功能说明与语言选择去状态

> **历史卡已失效（2026-10-03用户新定案）**：N31/N32开发均已停止，产品树已恢复N30。本文仅保留失败过程/旧要求审计，不继续施工、不复用实现。当前入口为 docs/N33-CODEX-TASK.md 与 PROJECT-STATE最新§4as；仅N31文字翻译可校对提取。

日期：2026-10-03（Asia/Shanghai）。Codex单执行者完整实现、验证、独立建包、本地提交，完成即停。N30工程交付保留，用户日语真机反馈证明其本地化没有闭环；本卡专门关闭本地化与文案问题，不恢复翻译实验、播放器避让或增加请求。

## 1. 基线与明确授权

- 唯一仓库E:\Projects\morphe-caption-v2；产品d5ca720ecf0c83349ea232d929ee09b11840c65a / anchor/n30-d5ca720；参考HEAD fa10360（docs-only）。后续只有docs差异就允许开工，记录实际HEAD，不因规划docs或已知官方MPP未跟踪停工。保留本轮管理文件随本卡提交，不reset历史产品。
- 先比对仓库与外部PROJECT-STATE，无差异跳过覆盖；有差异先读。读N30交付、N30-LOCALIZATION-REVIEW及本卡。本轮复核的原N31草稿保存于.verification/n31-planning，不作为另一张卡。
- 官方1.45.0、原版YouTube21.16.256、minSdk28及现有工具链保持；使用新的-n31交付路径，历史N30/N29/R1及原始输入不覆盖。没有授权签名/安装/卸载/清用户数据/推送/发布，远程翻译API/新增依赖/下载均0。
- 允许修改本补丁UI资源、资源装配、CaptionStrings及必要UI语言解析/绑定器、动态Preference/预览/滑条/诊断壳/对话/Toast/无障碍文字；允许官方设置页的最小UI加载/重绑接缝和必要校验，不因涉及这些文件再次机械停工。DeepSeekConfig只允许内建默认的显示与业务值分层，不改用户存储/模型策略。必须保持其余N30业务合同。

## 2. A：两处说明与每语种状态删除

### A1 自动翻译语言说明，始终存在

`CaptionLanguagesPreference.refresh()`目前以languages_empty/count替换summary，即使cap_languages_summary存在也没显示。改成始终显示功能说明，中文定案：

“将所选语言添加到 YouTube 的‘自动翻译’语言列表，可同时选择多种语言。”

14语种传达相同意思，空集合/保存后/滚动重绑/切语言都不能把功能说明替换成“未选择”或只有“已选N种”。已选数量若保留，只能作为说明后的附加句或弹窗内辅助信息，不得挤掉说明，不新增功能状态提示。

### A2 多选每行只有语言名与勾选框

`showLanguages()`目前用languages_entry格式化语言名加`NativeCaptionBridge.languageStatus`（已存在/新增/不可用）。删除这个UI拼接与调用，每行只显示当前设置语言下的语言名称、标准多选勾选框。隐藏全部视频相关状态，不能只删“不可用”保留其他状态；不改成图标/灰字/summary继续显示它们。

无视频、视频尚未加载、视频不同、AI关/开时，候选仍为同一14种且可多选，已保存勾选集合不变；单纯隐藏状态不能删候选、禁用选项、重新计算用户集合或移除实际语言能力。内部NativeCaptionBridge能力判断/原生菜单去重与排序保持，状态资源可作为历史保留但不再成为任何用户可见行。多选设置入口仍在AI子屏内、原生Morphe风格。

语言名读取使用同一设置UI locale；可以增加纯display-locale参数的名称接口，**不得改变LanguageMenuOrder用于真实YouTube自动翻译列表的排序locale/比较行为**。

### A3 AI字幕翻译功能说明

更新cap_ai_summary，中文定案：

“启用后，在 YouTube 的‘自动翻译’列表中选语言，使用已配置的 AI 服务实时翻译字幕。”

14语种明确“启用AI → 原生自动翻译菜单选目标 → 配置的AI服务译字幕”，不能写成任意原生字幕选择都会调用AI或仅说明自动保存。视频页唯一入口仍紧跟旁白、无图标；相关AI子屏说明若重复出现须一致。播放器开关完整资源标签继续保留，不能回退“路”字拼接。

## 3. B：修复UI语言来源，不能只继续补翻译表

### 已核实的源码和测试缺口

N30LocalizationRuntimeTest把测试Context资源直接换成目标locale，再检查资源作者值与少量TextView；没有模拟Morphe选ja而Activity/Application仍zh-CN。它未完整打开实际默认编辑器、预览、滑轨和诊断控件，232×14通过不能关闭用户报告。

规划者已反读N30最终APK的官方方法（.verification/n31-planning/n30-final-resourceutils.txt及n30-final-utils-context.txt）：ResourceUtils.getString取getActivityOrContext再getString；在useActivityContextIfAvailable时可能读取Activity而非Utils中的语言化Context。getStringByLocale在该交付方法体中没有应用locale参数。Utils.setContext才读取BaseSettings.MORPHE_LANGUAGE、AppLanguage.getLocale并建ConfigurationContext。**不能继续依据方法名/注释认定ResourceUtils.getString或getStringByLocale始终尊重Morphe覆盖。** 没有用户手机线程/Context快照，因此具体分支仍需受控复现，不虚称已读取手机选项内部值。

### 固定修复方向

1. 增加统一设置UI语言快照/解析入口：读取官方1.45实际BaseSettings.MORPHE_LANGUAGE（EnumSetting.get、AppLanguage.getLocale）。显式非DEFAULT覆盖优先；DEFAULT跟随实际宿主设置/app Context配置，不能直接等同Locale.getDefault系统语言；官方类未就绪/缺失时采用明确Context fallback。
2. 在本补丁边界复制Configuration并createConfigurationContext按确定locale读取cap_*；如有缓存，只缓存带locale/config/theme身份的Context/资源句柄，locale、fontScale/density、Activity资源变化需失效。不修改全局Locale.setDefault、宿主Resources.updateConfiguration、Utils.setContext或ResourceUtils.useActivityContextIfAvailable，以免改变其他设置/播放器/网络。
3. 同一快照用于文本、语言名称、文字方向、无障碍label、格式模板和自定义Dialog；保持Morphe当前主题、间距和布局。UI方向与视频翻译RenderSpec方向分离，不让UI语言改变翻译目标、源语言或原生菜单排序。
4. 所有界面文案按稳定key取值，替换CaptionStrings.localize对整段中文/用户数据做子串替换的主路径。可保留兼容映射但必须分类，仅已知静态UI句可经过它；profile名称、地址/Key、模型ID、自定义prompt、source/translation/provider/raw错误不可被替换。
5. 显式支持的14语种不静默回落中文/英文。运行时缺资源可以安全fallback以避免崩溃，但验收必须失败并报告locale/key/控件/调用路径；未知语言不假称支持。日语可包含正常汉字，“出现Han就失败”不能作为日语残留检查；逐key与该语言作者值、实际View属性对照。
6. 先受控复现N30“显式ja + 原Activity中文 + 官方ResourceUtils可返回中文”条件，然后修复；不要先把主Context改ja而绕过问题。最终包必须审计所依赖的官方字段/方法访问性，不能只在无官方类的fallback测试中通过。

## 4. C：稳定key绑定实际Preference和动态界面

- 以正式生成的Morphe设置XML加载真实本补丁PreferenceScreen与所有自定义Preference，不用手工拼几行已翻译TextView作为主验收。按稳定Preference key绑定title/summary，包含视频页外层AI入口和AI子屏。
- keyless PreferenceCategory/预览元素可添加本补丁专用展示标识或等价稳定绑定信息；既有持久化key/SharedPreferences/Keystore不改。不从旧中文title反向猜身份，不按不稳定行号绑定；保持内部order/父屏/排序/样式并验证没有改旁白邻接。
- 在实际装配完成/页面重开/onBind/设置语言更新时重绑。类别、getTitle/getSummary传递、TextView缓存、滑轨标签、预览hint/sample、诊断壳、所有自定义Dialog/Toast/contentDescription都要覆盖。若需宿主hook，限实际设置页面加载/刷新、只遍历本补丁拥有的项；不改官方其他功能、全局语言或每帧播放器路径。
- 不能在绑定语言时覆盖动态业务summary：模型/连接测试状态/配置错误/已选数量等要按稳定状态+key+原数据重新呈现，不能重置运行状态或隐藏错误。未变文字不重复notify造成绑定递归/抖动。
- 同一Activity内改官方语言后重新绑定/重开子屏与Dialog，得到当前语言；允许真实宿主原有语言重载行为，但不能为了测试通过要求改系统语言或清数据。旧语言的已销毁Dialog/视图不再参与重绑。

## 5. D：默认要求的显示与数据分离

当前DeepSeekTextPreference.initialValue直接取Snapshot.prompt，Snapshot/load又会调用defaultPrompt资源，存在UI默认显示与API偏好混用风险。沿现有program_default/stored_custom provenance处理：

- 未自定义的内建默认要求，在编辑器中显示当前UI语言的default_prompt。程序化换语言/重新绑定不被TextWatcher当作用户编辑，不写SharedPreferences、不生成自动保存事务、不改变API profile revision或切目标。
- 用户自定义要求、尚未保存的有效编辑草稿与profile名称原样保留，不能因文字是中文或恰好类似模板而翻译/覆盖。只有已有明确内建默认provenance及既有历史默认升级规则可显示本地化模板；不要新增“任何值等于某语言翻译模板就删除”的粗糙规则。
- 接口侧保持既有策略内容：中文兼容内建默认沿N30中文基线；非中文program_default沿既有固定effectivePreference；stored_custom沿用户原值。必要时仅分离内建默认展示与业务值读取。对N30曾随UI发生请求值漂移的场景保存before，使用上述明确分层修正，不因此另开范围卡。
- 必须验证只切UI语言zh→ja→en→fr→ar时同一翻译源/目标/profile的有效prompt、请求JSON/hash/cache scope稳定，中文18golden相等；自定义原值、API endpoint/model/Key与用户selected_codes逐字不变。清空恢复内建默认才改变preset状态，自动语言刷新不做这项操作。

## 6. E：逐角落inventory与诊断分层

提交docs/N31-UI-LOCALIZATION-INVENTORY.md（证据可另在.verification/n31），每项列文件/方法、Preference/View/dialog身份、文案key/格式参数、UI/技术/用户数据类别、当前语言来源、刷新时机、14结果与截图/快照路径。至少包含：

- 视频页AI title/新summary、AI子屏title、启用/普通视频与Shorts菜单开关、菜单on/off标签；
- 语言多选固定summary、候选纯语言名/勾选框、空集合/保存/取消、已选统计若保留；被删除视频状态列为“不再显示”，不可再把状态展示设为验收要求；
- 所有类别/分隔标题、API方案默认名/新增改名删除确认/校验/保存/清Key、地址/Key提示与输入错误、模型选择/自动加载/手动输入/失败提示/测试连接所有状态；
- 翻译要求title、内建默认、恢复默认、保存/错误说明；
- 字幕样式类别、预览sample/contentDescription/hint“样式预览（全屏）”，五档名称/选中无障碍描述/px说明、透明度标签/百分比/说明、恢复位置/缓存清理与完成Toast；
- 文本调试开关、字幕诊断title/hint、展开/收起、刷新/复制/保存完整诊断/清空/确认/保存成功失败、Android9分段复制所有文案；
- 所有残存fallback、format字符串、后台UI回调结果、Toast、原生Dialog与入口行的可见/无障碍文字。

技术诊断stage/字段名/heading/reason/error code在界面报告正文和导出中都用英文；diagnostics设置项、按钮、帮助提示与交互壳随UI语言。原始source、译文、用户prompt/profile、provider响应/错误及实际显示文本证据原样保留，不能为了“无中文”修改证据。自有中文程序异常改稳定英文code，UI另以资源key显示本地化说明；原始provider消息不翻译。

不假称旧历史record自动变英文。若有旧中文技术标签，区分本卡新生成technical字段与旧raw记录，明确历史兼容和展示边界；旧导出证据不回写、不删除。diagnostic刷新/保存不调用供应商。

## 7. 验证必须覆盖N30漏掉的条件

1. 核心差异矩阵：系统/全局locale=zh-CN；Activity/Application保留zh-CN；官方BaseSettings真实接口形态可用，ResourceUtils获取路径允许仍zh-CN；分别将Morphe覆盖设为14个目标。通过实际生成Preference树、全部动态控件和Dialog读取当前语言，不调用setLocale把原Activity偷换成目标来跳过覆盖问题。官方类不存在的Context-fallback矩阵另做，不混为主矩阵。
2. 同一树从zh→ja→en→fr→ar及回zh，重绑、滚动回收、子屏返回、开/关Dialog后无旧文字；也覆盖Morphe DEFAULT跟随宿主语言、地区脚本别名zh-Hans/Hant、en-US、pt-BR、id/in。用户自定义中文数据在ja界面照旧原样，不能被残留检测误删。
3. 实际打开编辑器/五档滑轨/预览Canvas/诊断展开面板/API方案和模型Dialog/多选Dialog，断言每个真实可见View属性是当前作者key值。preview用真实绘制与测量，slider用真实档名布局，不只调用CaptionStrings循环检查232键。
4. 故意保留旧中文Context、ResourceUtils误取Activity、某控件缺重绑、缺locale资源、重复资源或遗留每行状态等负例应被同一检查拒绝。恢复N30旧解析器的对照必须至少在覆盖locale不一致的场景失败，证明测试能发现用户的问题。
5. 多选行文本精确等于该code的UI语言名称；在无视频和不同视频/AI off-on/原生已存在与不可用模拟下完全相同，所有14项可勾选/保存；内部去重/排序/能力仍与N30同结果。固定说明保存后不能消失。
6. 320/420dp、fontScale1.0/1.3、LTR/RTL、长summary/语言名、大字号：无裁切/省略/重叠，真实Morphe属性和主题接缝保留。14语种至少保存实际控件树快照；zh/ja/en/fr/ar保存包含真实控件的完整截图，不能只拿静态字符串图替代。
7. 编译与模拟验证不宣称手机/母语已过。技术诊断英文字段、UI壳locale与原始证据逐字保留同验；数据页不要用Han/语言猜测来判断翻译是否正确。

## 8. 冻结与闭环交付

- N30的语言集合/原生菜单去重排序与Clone、650ms硬断点请求前拆块、cache-only启动/连接预算、transitions任务合并与失效、draw权限、R1锁/Publication/CAS/同key/后台barrier、中文legacy/18golden、非中文n29-presentation-v3、字号/位置/颜色/透明度全部保持；不恢复N27/VISIONOS，不添加视频/句子/token时间特例。
- 仅UI界面显示/绑定、默认展示分层和上述UI-only接缝已授权。控件错误文案若参与逻辑判断改稳定enum/boolean/code，不改业务语义；必要新展示标识/官方UI hook与校验不构成再次范围停工理由。其他真正业务改变带明确证据回规划者。
- 全量N30 669及新增/适当UI断言修订后实际总数，failure/error/skipped0；原main/K12、中文18golden、native-only API0、原分页/冷热矩阵与N30 400轮继续成立。旧测试如要求每语言状态或仅Context切换就代表应用覆盖，保存before后定点换强断言，不能删生命周期安全网或改样本使之绿。
- Python27、232×14基础及新增键（按实际总数）、全inventory14主/降级矩阵、上述负例；冻结4通过/4既有失败/4未验证、invisible_ms0、ACCEPTANCE/frozen零diff。
- 从正式MPP自身+官方1.45.0+原版21.16.256做N30三根7组合/最终全部DEX（实际数量/类数，不机械写死）、branch/API访问/新UI接缝/资源/CRC/aapt/minSdk28/verify_bundle/N8Verify。内嵌MPE=独立MPE；兼容metadata仍21.16.256/minSdk28，不改旧发布URL/日期。
- 独立build/local-test/patches-1.3.5-本地测试包-n31.mpp、extension-1.3.5-本地测试包-n31.mpe；build/n31-composition-final/YouTube-21.16.256-本地测试包-n31-unsigned.apk。历史输入/产物按捕获清单前后SHA不变，不覆盖。
- docs/N31-LOCAL-TEST-BUILD.md报告真实语言来源根因/静态测试漏项、固定说明/去状态、实际控件inventory/14覆盖/负例、default展示与请求分离及自定义字节不变、完整SHA/字节/实际分母/未覆盖手机边界。不能再用“232×14通过”一句宣称所有实际界面适配。
- 本地一个核心commit/anchor/n31-<真实短哈希>，docs-only身份可后继补记；规划docs随卡保留，两份PROJECT-STATE同步，已知外部输入及ignored证据以外工作区干净。完成即停，未签名/未安装/未清用户数据/未推送/未发布。
- 下一次用户只需保持系统语言，切Morphe中文→日语→英语，查看视频页AI summary、AI子屏类别/默认要求/预览/档名/诊断、多选纯语言名与说明（无视频也可）；自定义要求应原样。给截图或诊断即可，不要求14语种母语全表。
