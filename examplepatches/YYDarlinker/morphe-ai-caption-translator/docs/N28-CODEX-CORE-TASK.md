> **历史文件，2026-10-02已失效**：用户取消Codex/DeepSeek接力，撤回未完成N28到N26。当前规程是CODEX-EXECUTION-WORKFLOW.md，下一卡是N28A-CODEX-TASK.md。本文件仅供追溯，不执行，不恢复归档代码，不生成DeepSeek收尾卡。

# N28／第三期：Codex核心执行卡——十四语种翻译呈现策略

本卡交给Codex执行。Codex完成核心实现与关键验证后，**必须生成给DeepSeek的具体收尾卡**，然后停止。用户把收尾卡交DeepSeek；DeepSeek完成后回本规划对话审阅。分工总则见`docs/HYBRID-EXECUTION-WORKFLOW.md`。

## 1. 基线、目标与停止范围

唯一施工仓库：`E:\Projects\morphe-caption-v2`。
开工HEAD：`efe1f8c`；源码锚点`anchor/n26r-1b9e429`→`1b9e429`。相对N26交付后`7f9c639`，全部非docs树零差异。
N26r已交付：Java440/440（58套件）、Python27/27、220键×14语种、84组合、DEX58028；执行记录见`N26R-LOCAL-TEST-BUILD.md`。本次用户明确允许推进第三期，不再把“等待后续指示”当停止理由，也不虚构尚未提供的真机验收结论。

先读PROJECT-STATE最新节、§4i九项定案、§4k三个延期问题，以及本卡。保留规划者新增管理文件，随本核心卡提交；两份状态先比对，有差异先读再同步，不能用旧交接快照覆盖。

目标：在实际AI翻译生产链路使用语言档案和源/目标路由，让非中文目标不再被全局中文8CPS/12–18码点及中英规则误约束；保持已验证的英文→简/繁中体验；正确处理Unicode、RTL和缓存。不是只建profile表或演示函数。

本期不做第四期菜单多选/简中root合并，不恢复N27避让，不改调度/供应商重试/源时间归属/字号档位/用户存储值，不提前做三个旧UI/诊断全面修复。新技术事件/字段/reason从第一行起英文。

## 2. Codex与DeepSeek边界

**Codex全部负责**：参数表落地、源目标上下文、计数/断行/布局/方向、检查适用范围、prompt/cache、生产接入、关键回归、真实候选包/最终DEX、安全的验证脚本。重要接口和语义决策不能留给DeepSeek。

**DeepSeek仅收尾**：运行已验证脚本和完整固定矩阵、导出帧图/JSON、全量既有回归、正式组合/建包、历史哈希、允许的文档/状态。第三期没有需DeepSeek自行设计的运行逻辑，也不让它修改profile数值、核心源码或判据。

Codex交接前核心必须可编译、可实际接入且关键测试通过。若未闭合，不生成“核心完成”的收尾卡，先自行解决并说明真实边界。

## 3. A：语言档案与固定参数

新增小型不可变`CaptionLanguageProfile`和`CaptionLanguageContext`（名称可按现有约定调整），集中维护语言code、locale、direction、reading计数器、CPL计数器、策略版本和适用范围。UI语言、源语、目标语是三个不同来源。

覆盖以下14个目标。外部CPS/CPL是**普通成人翻译字幕参考**，不是儿童/SDH，也不是宣称Netflix交付合规。工程计数与出版社“字符”单位的差别必须标明，不只打印模糊cps。

| 目标profile | 外部CPS / CPL | 本期工程策略 |
|---|---:|---|
| zh-Hans | 9 / 16 | 保留中文既有8CPS硬规则、12–18偏好、最小页/评分/时间分配；不重标定 |
| zh-Hant | 9 / 16 | 同中文兼容分支，补繁体字形/术语规则现有两套字形回归 |
| ja | 4 / 13 | 阅读：字素；行长：全角1、半角0.5；LTR |
| ko | 12 / 16 | 阅读：字素；行长：Latin/空格/标点0.5、其他1；LTR |
| en | 20 / 42 | 字素阅读/行长；LTR |
| es、fr、de、pt、ru、vi、id | 17 / 42 | 字素阅读/行长；LTR |
| ar | 20 / 42 | 字素阅读/行长；RTL，保留数字/Latin名称自身方向 |
| hi | 22 / 42 | 字素阅读/行长；LTR，保护Devanagari组合/合字 |

非中文读速/CPL均为软规划目标与告警；展示页7秒为软目标。最多2行、实际字体几何、完整字素与事件源归属为硬约束。现有1.2秒页下限保持：整个源窗短于1.2秒时只允许按既有完整短窗行为显示，不拉长、不借邻窗。

**计数定案**：非中文reading按可见扩展字素计数，空格/标点各1，换行与孤立方向控制字符不增加阅读单位，组合mark/ZWJ不独立计数。韩文0.5规则只用于CPL，不从“行长”推导阅读权重；旧草案的ko weighted-reading字段由本表覆盖。日文CPL按cluster的宽度类别，未知宽度保守记1，真实Paint宽度仍权威。不要把“所有非ASCII记全角”套给阿语/印地语。

别名与地区：大小写/下划线规范化，in→id；zh-CN/SG/Hans→Hans，zh-TW/HK/MO/Hant→Hant；普通地区变体按primary选择profile，但保留完整实际源/目标码作为模型指示与缓存区分，不能把pt-PT改成pt-BR或en-GB改成en-US。generic zh保持既有中文族处理，不能据此推断源是英文。空/未知源标UNKNOWN。

现有菜单的其他合法目标不得突然禁用或改成中文：使用明确的generic profile（字素、软17/42/7秒、FIRST_STRONG方向、无中英特化），如实标工程fallback，不增加“完整支持”承诺；无有效目标时不偷偷默认简中。

## 4. B：实际源/目标上下文和适用范围

从已绑定源轨/源请求取源语。当前`RawCaptionSource.sourceLanguage`读取URL的lang；使用`CaptionEngine.sourceCaptionUrl(url)`和真实native元数据交叉核对，**不能把tlang当源语**。目标以用户所选自动翻译菜单tlang为权威；UI locale只控制UI文案。

上下文在Session创建时确定，传到Job/API、协议解析、Review、缓存读取/写入、事件呈现和布局预算；不要用可变全局“当前language”。源/目标改变要更换身份或使旧任务失效，旧响应/旧cache不能进入新语言。已知源被真实元数据纠正时也遵守这个边界。

真实英文代码才启用英语语法/词法提示；不能凭Latin字符把法语/越语认作英语。中英特化只用于**英文源→zh-Hans/zh-Hant目标**，不能凭Han字形把纯汉字日语判成中文。

逐项审计`RebuildPlanner`的词法提示、`RebuildProtocol`长度/数字检查、`RebuildReview`碎片/段落/语义检查、`RebuildSemantics`字典与锚点、`RebuildNumbers`日期/数字。产出适用范围清单：
- 通用硬约束：JSON结构、ID有序完整覆盖、source quote、ownership、时间窗/静音/显式speaker边界，始终保持。
- 已验证英文→中文规则：保留N26r原行为，其他pair不误用；不恢复N23已回退的例句特判。
- 可跨语种核实的不变量（如来源明确的literal model ID跨事件挪用、两边均明确的简单数字不等）保留；未知词法/日期/单位写法不是矛盾，不借中英字典硬拒其他语言。

一般数字路径至少覆盖Unicode十进制数字的等值（12/١٢/१२）和明确单一整数12→13的不等；逗号/小数/日期/数量级/单位存在歧义时返回UNKNOWN/观察，不武断换算。英文→中文现有日期/数字黄金结果不变。不要求实现14语种完整语义判断器，不让用户做母语审校。

原生/人工/AI关闭路径维持N26r与API0，不把它们改成翻译请求。新语言状态在清空/换视频/切轨后正确退出，不能留下上个RTL目标的显示配置。

## 5. C：Unicode边界、分页与真实呈现

平台方案：`android.icu.text.BreakIterator`的character/line实例，显式传目标locale，不取系统默认locale。集中生成UTF-16边界索引，真实页面切口必须同时是字素边界与可接受的语言断行位置。保留原字符串，不能NFKC改字、逆序字符串、插入可见标记或按码点强拆。

覆盖NFC/NFD重音、Vietnamese多重mark、Arabic变音符/连接、Devanagari virama/nukta/ZWJ、Hangul Jamo、emoji modifier/ZWJ/flag、surrogate pair、NBSP、混合数字与Latin名称。最小SDK28自带ICU不能直接等同最新Unicode；记录实际backend/version。必要的低版本边界保护由Codex实现并验证，不把该问题交DeepSeek，不声称全Unicode18合规。

**中文兼容**：既有正常中英语料的页面文本/切口/时间/字号与N26r黄金结果保持相同，prompt与既有cache空间见下节。对基线未覆盖的非法字素切口可加安全排除，但必须有独立样本与差异清单；中文CPS/评分/12–18等常量不改变，不把兼容分支一起换成新算法。

**非中文分页**：
1. 替换仅该分支的全局8CPS提前返回空计划、12–18码点评分和中文最短字格门槛；不能保留一个隐藏的8CPS过滤器。
2. 沿现有有界分页结构，候选切口以标点/locale合法词边界优先，保护完整字素、数字/模型ID和词内部。不要把越语空格当英文单词数，也不宣称ICU证明句法完整。
3. 使用真实字体的fitsOne/fitsTwo决定几何，一行可用时优先一行，最多两行。CPL作为偏好，不能以超CPL独立导致空白。
4. 页时间在同一accepted event窗内分配，连续、正数、单调、首尾与原窗一致；拼回页文本保留全部accepted text，无丢字/重字。只以硬最小页/几何限制可行性，不把units/CPS当硬minimumMs。
5. 7秒软目标在合法内容切口可实现时采用；一条完整短语长显且不可再分时保留原窗并告警，不重复文字凑页、不引入技术占位。无法满足硬几何才走原安全空白策略。
6. 读速超目标只进入英文technical watch，不仅凭它启动额外API修复或丢字幕。段落/碎片检查中依赖中文长度或英文word数的部分同样需要范围控制，不能换了分页器却被上游旧检查再次误杀。

统一目标RenderSpec必须被**真实LayoutBudget、StaticLayout测量、compactWidth与TextView绘制**消费；不能测量LTR再画RTL、或预算用一种locale实际用另一种。阿语基方向显式RTL、其他14语种LTR，generic FIRST_STRONG；数字/Latin局部走系统BiDi逻辑，保持逻辑字符串不变。实际行边界也检查字素安全，不只检查页边界。

保留N19五档、55.5/44.5全屏比例、真实FontMetrics标定、opacity/position、现有最低档应急规则；没有播放器避让/触摸/动画或新增设置开关。Overlay只允许本期上下文/测量/方向/分页接入所需变化，WATCH/拖动/控件处理不重设计。

## 6. D：prompt、cache与诊断接入

英文→中文兼容pair在相同配置/输入下保留N26r有效prompt与hash；不改原常量来影响中文全部样本。其他pair使用清楚的通用source-owned协议＋适用源语提示＋目标profile短说明，避免把旧中英例句、CJK12–30偏好或中文名称硬铺给所有目标。Schema/from-to/source/ownership硬协议保持。

目标菜单码是强约束；用户要求不覆盖它，其他用户风格要求保持。已保存prompt逐字不改、不迁移；可以在构造实际请求时区分程序默认与自填内容，非中文有效默认应是语言中立。此区分属于Codex核心，不能把默认来源判定留给DeepSeek。现有UI里的默认要求/示例/字号显示全面本地化仍留最终阶段。

`display_hint`对新语言报告profile、实际width/max_lines、reading_unit/counter_version、软目标、方向；不能把approx_cjk_columns当所有语种真实字符容量。中文既有hint保持兼容。

新语言cache身份包含实际source/target（含有意义的地区/脚本）、profile/计数/策略版本、**有效**prompt及配置语义；UI语言不能选profile或清空缓存，程序默认显示文案不应单独改变非中文有效请求/cache。中文原namespace/key在同一legacy条件下保留；非中文旧策略cache必须隔离/重验，不误当本次结果。`RebuildCache.read`的parseBound必须收到相同上下文，不能网络路径已修、cache路径仍套中英旧规则。原子写入、容量、dedup/调度不变。

新增技术记录至少给出source_code/target_code/profile_id/profile_version/counter_id/reading_units/actual_cps/reference_cps/max_page_ms/line_count/direction；reason/字段全英文，按变化去重，不100ms刷日志，不写密钥/完整URL凭据。未知语义/参考超速不被记录成accuracy=100%。

## 7. E：Codex核心必须自己完成的验证

开工记录N26r关键中文基线（现有fixtures/断言及固定样本），不改冻结计分板。沿真实生产入口测试上下文与调用链；不要只验证profile构造器/数学函数。

最低关键矩阵：
- English→Hans/Hant黄金prompt/hash、检查、页面/时长/字号与原cache身份；允许给旧测试明确补真实语言上下文，不删原断言凑绿。
- French源→Arabic、Chinese源→English、unknown Latin源→French；UI分别设中文/英文/阿语但目标/策略/缓存选择不串用。
- 14目标的code/alias/地区/方向/计数器覆盖；空/unknown不假造英语源或中文目标；合法其他菜单语言generic仍可运行。
- NFD重音、Vietnamese、Arabic marks＋Latin型号＋١٢、Hindi conjunct/१२、Hangul Jamo、emoji/ZWJ/flag、长德语词、NBSP，计数/页边界/实际行边界都验证。
- 超参考CPS但硬几何成立仍有正文；>7秒有合法切口时规划，无可分短句只观察；font/宽度改变不破归属；sub1.2s保持完整源窗。
- 网络与缓存读取同一scope；版本隔离；切换target/source、旧Job迟到、旧RTL残留被拒/清理；原生/人工API0，source quote与源窗硬约束不变。
- 最低SDK28API兼容：不使用Map.of/List.of/String.isBlank或仅高版本可用接口而假定Java语法desugar等于运行库兼容；在可用离线Android测试环境验证ICU关键边界，记录具体SDK/backend。缺环境的边界如实报告，Codex负责闭合核心风险，不能让DeepSeek猜。

核心阶段运行受影响既有回归＋全部新增重要测试，离线编译，并至少从真实候选MPP组合一次实际APK、读取最终DEX做接口/分支审计。使用已归档`.verification/n26-rollback/audit-tool`，`--require-ai false`仅要求N27观察者不存在，不关闭正常AI。N27相关类/回调必须仍0；新增类数按真实结果登记，不要求仍58028。未做真机不宣称实际启动/十四语种自然度通过。

不增加远程翻译API调用或运行时依赖、不下载模型/工具、不增调用层/重试，不改4前后台并发/预取风暴参数。研究依据已附，可针对本机平台实现作必要primary核查，不重新展开无边界研究。

## 8. F：核心提交与必须生成的DeepSeek收尾卡

核心完成后一个实现提交，锚点`anchor/n28-core-<真实短哈希>`指向完整核心源码。可以随后仅docs收尾写实真实锚点与任务卡，不amend旧锚点、不推送。工作区交接时干净。

必须新增：
1. `docs/N28-CORE-IMPLEMENTATION.md`：具体接口/上下文流、规则范围、counter定义/依据、中文兼容证据、cache策略、实际关键测试/候选APK/DEX与未覆盖边界。
2. `docs/N28-CORE-HANDOFF.json`：真实core提交/锚点、来源基线、所有冻结核心/参数/测试与脚本文件SHA；允许DeepSeek改动的精确文件列表（第三期通常只有收尾文档）；实际测试预期、构建工具路径、候选产物hash。不能填占位符。
3. **`docs/N28-DEEPSEEK-FINISH-TASK.md`**：可独立执行的收尾卡，内容必须根据本次实际实现生成；本卡不是该文件的替代品。

收尾卡必须包含：
- 开工真实源码锚点与允许的docs-only HEAD关系；冻结核对命令/工具；保留两份状态管理更新。
- Codex已编写并运行过的固定脚本：全量Java/Python/220×14/冻结/84组合/最终DEX/历史哈希；全部命令、参数、目录、预期退出码。动态测试/类数填写实际core预期，不抄N26r440或58028。
- 多语言fixture/JSON固定输入与导出入口；14目标×详情页/全屏×标准/超大，含RTL/组合符案例、UI语言不决定target的交叉场景。DeepSeek只运行导出/检查，不能改断言、补算法或重写样本译文来通过。
- 沿同一核心源码打包 `build/local-test/*-n28.mpp`、`extension-1.3.5-本地测试包-n28.mpe`、`build/n28-composition-final/YouTube-21.16.256-本地测试包-n28-unsigned.apk`；MPP完整名`patches-1.3.5-本地测试包-n28.mpp`。从交付MPP组合并审计，保留历史和core候选文件，缓存不带回N27。
- 不修改冻结核心、参数或测试；失败保留日志/命令/输入hash/复现，不吞错/改判据。确属步骤或路径错误按卡里明确修正；逻辑/ABI/Unicode/方向/cache/显示失败输出Codex回流清单，停止打包验收。
- DeepSeek只提交批准的收尾文档/固定生成输出，打独立交付锚点，状态同步，输出三件套路径/字节/SHA及核心未动证据，然后停止。签名/安装/发布/推送不在授权内。

Codex最后向用户交付：核心提交/锚点、核心结果简述、上述**DeepSeek收尾卡全文或可点击本地文件**，明确“下一步把此卡交DeepSeek”；不要只说可继续，不自行代替DeepSeek完成整个收尾。核心不能达标时说明具体未闭合项，不能生成虚假完成的接力。

## 9. 依据与旧草案覆盖关系

详细逐语种来源已在：
`C:\Users\14776\.codex\visualizations\2026\10\01\01a0f56a-7d8c-75e0-8def-3fa2f0b542ef\future-plan-research\language-profile-draft.json`及同目录`N25-next-feature-study.md`、Netflix指南抓取和SubtitleEdit计数实现。

本卡参数/九项已定选择覆盖旧pending/unapproved、旧2A自然位置、旧英文17及ko reading-weighted草案标签，不再次询问用户，也不宣称草案已上线。

本轮已复核：[英文普通成人20CPS](https://partnerhelp.netflixstudios.com/hc/en-us/articles/217350977-English-USA-Timed-Text-Style-Guide)、[日语4CPS/横排13与半宽规则](https://partnerhelp.netflixstudios.com/hc/en-us/articles/215767517-Japanese-Timed-Text-Style-Guide)、[韩语12CPS/16与行长权重](https://partnerhelp.netflixstudios.com/hc/en-us/articles/216001127-Korean-Timed-Text-Style-Guide)。其他11语种具体来源URL在JSON逐项给出，不将儿童/SDH规则混进本表。

平台与边界：[Android ICU BreakIterator](https://developer.android.com/reference/android/icu/text/BreakIterator)、[Unicode UAX29字素](https://www.unicode.org/reports/tr29/)、[UAX14行边界](https://www.unicode.org/reports/tr14/)。Android自带ICU从API24可用，但其Unicode版本随系统变化，最新规范不是旧系统实现保证；CPS/CPL工程计数、参考标准和真实像素是三类指标，必须分开。
