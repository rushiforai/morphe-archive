# N28B Codex执行卡：语言范围、请求策略与缓存接入

日期：2026-10-02。Codex负责本卡全部实现、关键与全量验证、建包、交付、提交和两份状态更新；不交DeepSeek，不自动做N28C。N28A限定工程审阅通过，本卡不以用户另做视觉验收为开工前置。详见N28A-REVIEW.md。

## 1. 基线和本期边界

唯一施工仓库E:\Projects\morphe-caption-v2。开工HEADc518823；源码d683e59/anchor/n28a-d683e59，之后仅docs。N28A实际Java490/490（N26旧440＋50）、Python27/27、84组合、11DEX/58034类；原生产只有Controller14行只读接入，已记录profile和计数器但未启用策略。

先读PROJECT-STATE最新§4v、CODEX-EXECUTION-WORKFLOW.md、本卡、N28A-REVIEW.md及N28A交付记录。保留本轮规划者docs变化随卡提交；两份状态比对后同步，不盲目覆盖。不得从`.verification/n28-abandon-20261002`直接恢复已撤回的旧N28实现/修改后的旧测试。

**目标**：将实际语言上下文用于Session/Job请求身份、prompt、payload提示、parse/review/数字检查、cache读写与重验，防止其他语言被中英特化误判或旧策略cache串用。保持英文→简/繁中既有有效请求、已验证语义检查与cache行为。

**本卡冻结**：RebuildPageLayout、CaptionOverlayV2与LayoutBudget、字号/FontMetrics/RTL绘制、控件/触摸、原native菜单/NativeCaptionBridge/字节码指纹、源文token生成/词时间/静音/显式speaker归属、调度/前后台槽位/预取storm/超时/重试额度、provider协议/鉴权/模型、所有持久化用户值。N28C才启用非中文分页与方向。B结束仍不能声称新CPS/CPL/7秒已影响呈现；新增记录应说明presentation_policy=legacy_n26。

## 2. A：把观察上下文升级为严格策略输入

复用N28A不可变CaptionLanguageContext/Profile，增加必要的策略标志/版本或小型Policy，不建可变全局currentLanguage。输入为当前源请求的明确lang、现有确认target；source/target/UI三者分开。URL存在重复/非法lang、und/空值，继续UNKNOWN，不猜英语；保留实际地区/脚本，in别名规范但不改源文本/签名URL。

1. Session创建时在决策前确定上下文；Job/API/parse/Review/cache只接收这个同一immutable上下文，不能在异步响应时重新从“当前Session/UI”取语言。旧Job完成不会使用新目标的策略。
2. URL/源上下文变化不能像A一样只log后继续重用有冲突的Session。签名/expire轮换且同source/target/policy仍重用、请求计数不增加；真实source/target/策略变化必须独立身份、取消旧Session的publish资格并创建新上下文。duplicate-lang从已知变UNKNOWN也视为变化，避免源身份函数只取第一个lang导致复用。
3. 控制器Job/缓存响应沿既有owner/generation检查，别改前后台并发或强行取消已发HTTP。旧在途可完成，但不得发表到新Session或占用新cache身份。
4. sourceOnly/原生/人工/AI关闭路径仍按既有方式，远程翻译API0；不因UNKNOWN决定停止播放或偷偷选简中。有有效目标但源UNKNOWN可使用中立策略；无有效目标按原入口契约不创建翻译会话，不从UI默认一个语言。
5. 对既有URL lang provenance明确说明：本期只使用当前已绑定源请求；不增加取轨下载或模糊native推断。如来源冲突无法确定，UNKNOWN与中立scope，不用文本脚本“纠正”。

## 3. B：规则范围清单与明确中文兼容通道

中文保留**呈现基线**，英文→Hans/Hant保留**中英语义策略**，两个概念不同。所有明确中文目标（含generic zh族）本卡页面算法完全未动；只有明确英语source＋Hans/Hant时启用中英语义特化。generic zh且脚本未知不自动猜Hans；未知source或其他Latin语言不启用英语语法。地区English也属于明确英文；各调用点不得继续用“source有Latin/target有Han”选择scope。

产出`docs/N28B-RULE-SCOPE.md`，逐条列出当前：RebuildPlanner词法提示、Protocol数字/段落、Review碎片/主语/否定/授权/词义、Semantics中文词表、Numbers日期数字；每条标“结构通用/源语英语/英→中文/不确定观察”。不要简单把全部guard删掉以让非中文通过。

- 通用硬约束始终保留：JSON/schema、ID有序完全覆盖、精确source quote、owned时间、静音/显式speaker边界、非语音空text契约；命名设备与文字锚点也不能从另一个事件随意搬入。
- `RebuildReview`的english/zh启用条件改明确code；依赖中文长度、English word数、中文词表的修复/拒绝不再应用到其他pair。N23已回退的subject/omission例句特判不加回，不扩张词表。
- `RebuildSemantics`的中英equipment别名与range条件按scope；来源明确的literal ASCII model ID跨事件挪用仍可作通用保护。无法核实语种等价不定义CONTRADICTED，不以“不在词表”拒绝合法译文。
- Protocol的paragraph等属于呈现可读性检查，要去除对非中文的CJK/word猜测误用；这类规则用profile/计数与明确soft/advisory说明，不单因读速或参考CPL超标启动付费repair。结构错误仍按原repair上限。
- English source的protectedCut/resource词法可继续作为所有英语源的提示；非英语/UNKNOWN仅用中立标点/已有静音与speaker边界，不给它英文冠词/短语列表。源词/token/时间证据生成不变，允许上下文感知的request block soft seam选择变化，记录此差异；en→中文的tokens/blocks及黄金结果保持。

已有无上下文旧helper/overload：只能作为明确legacy兼容入口或给旧固定英中测试显式scope；**所有生产网络/缓存/repair必须使用context-aware入口**。不能留一个生产默认成en→zh的parseBound去绕过本卡。必要修改旧测试的调用参数允许，原断言/fixture不可因新输出删改；新增差异按授权范围解释。

## 4. C：保真通用prompt与用户要求来源

**英文→简/繁中兼容通道**：相同URL、配置和样本下N28A有效prompt及hash、payload/request JSON、原schema、旧hint、默认配置表示不变。旧PROMPT/FIDELITY常量不全局修改；保留它们供兼容通道，不把整个中文基线一起换成新模板。

**其他pair**：新通用模板明列保真、source-owned range、quoted source/ID全覆盖、完整命题、否定/条件/数值/型号、不得摘要增解释及schema；不附旧中英例句、SAM/坦克等领域字典，也不用CJK12–30或Latin30–76泛化长度指导。只有source明确English时附通用英语依存提醒；目标按实际完整code指定，不因profile共享改pt-PT等为别的地区。

用户菜单target是强约束；保持用户其他语气/风格偏好，已保存自填文本不改、不能清SharedPreferences/Keystore/profile。

需要区分程序默认与自填值时，在`DeepSeekConfig.load`取得真实存储来源，给Snapshot附只读provenance/effectivePreference（构造重载兼容旧调用），本卡不改UI默认显示文案/资源/保存函数。沿已有absent/known-legacy-default识别，不“看起来像中文”就重写任意自填内容；缺乏来源证据的Snapshot保守按自填。已知默认在新中立策略中使用语言中立含义，确保UI locale换了显示默认字符串不改变该策略。英→中文继续原表达/原hash。

动态display_hint对新策略只提供真实可用宽度/max_lines等及profile元数据；不要把approx_cjk_columns解释成所有语种真实字符预算；旧中文hint不变。B中不要发布新CPS/7秒已应用的指导来代替尚未改变的实际分页。建议包含`presentation_policy=legacy_n26`，真实呈现参数在N28C统一启用。

不更改provider请求URL/参数协商、response format格式、鉴权/速率/Retry-After，也不添加“翻译后另校对”请求。新source code/policy metadata不能混进中文旧schema破坏golden。

## 5. D：缓存和Session身份的一致路径

保留`RebuildCache`原目录/原子写/容量/旧中文数据，不做全cache清空。定义一个明确的新scope版本，例如`n28b-policy-v1`，同一个scope规则用于Session复用、Job、请求prompt、cache key、读取重验、repair候选比较。不要以BuildConfig版本号1.3.5代替策略版本。

- 对明确en→Hans/Hant旧兼容条件，旧cache key/hash保留；en地区变体与原target写法等条件必须有golden验证，不能只测source=en一种就宣称全部兼容。key里原URL源语言已有区分仍保留，不为了canonical碰撞合并旧源。
- 非legacy identity/key包含source/target实际code（有意义的地区/脚本）、policyVersion、有效prompt/偏好及供应商身份。profile有相同主语言也不合并pt-PT/pt-BR；known-source变化、UNKNOWN、duplicate-lang的scope不能复用之前英中计划。
- 未经本scope生成的非中文旧cache不作为新策略hit；自然隔离或重验，不能修改旧文件来伪造迁移通过。
- `RebuildCache.read`和所有cache层调用的parseBound显式context；网络已修而读取仍跑旧无scope语义检查是失败。冷请求→写入→热读取所用规则/prompt一致。
- UI locale变化不决定source/target/profile，程序默认的本地化字符串变化不单独破坏新中立策略cache；真正自填偏好改变仍改变有效身份。legacy中文兼容通道历史UI默认参与fingerprint的行为先保留，不为这一句话全局改旧中文空间，此边界在报告写明。
- 并发同块、签名刷新、切target、旧Job迟到都不串plan，不引入新provider调用/重试机制；hash/log不能泄露apikey或带签名URL。

## 6. E：数字检查与确定性边界

原en→中文Numbers行为保持，作为legacy通道。中立通道至少支持无格式歧义的Unicode十进制整数字符等值：12、١٢、१२匹配；明确单个整数12→13应识别矛盾。比较Unicode digit的**数值**，不把所有非ASCII抛弃或把源“有数字”视为全语义等价。

日期、decimal/grouping、区间、多个数字、千/百万/万/亿、货币/单位转写、书写数字一旦不具备明确解析能力则UNKNOWN/观察，不凭English月份或Chinese单位词表硬拒其他语种的合法表达。不实现14语种完整数值/语义等价检查器；不得把unknown当通过率100%。所有hard reject必须有高置信度来源与反例测试。

不要以此改source_number_ambiguity证据或修原ASR；既有中英不确定数字用例照旧，N28A的token/quote仍原始数据。

## 7. F：必须由Codex完成的生产回归

网络测试只本地MockWebServer，零远程翻译API；在真实activate→source→Job→RebuildApi→parse/review→write→read→控制器接受路径运行，不只比较profile工厂。提供机器可读`policy-trace-matrix.json`，包含输入source/target/UI、实际systemPromptHash/policy/cacheKeyHash、是否network/cache、拒绝/观察原因与调用数（不含密钥）。

最小矩阵：
1. en→Hans/Hant，及明确English地区码，已有N26/N28A固定样本对照：有效prompt/request、tokens/blocks、语义结果/cache身份、页面/时间/字号一致。
2. fr→ar、zh→en、ja（纯Han译文）→fr、unknown Latin→fr：profile一致但scope明确；不触发中英特化，UI zh/en/ar切换不选错策略。源为French且含English同形词仍不启用英语词法；target Japanese纯Han也不启用Chinese词表。
3. 12/١٢/१२等值、12→13明确不等、French逗号小数、localized日期、数量级或混合多数字UNKNOWN；legacy dates/numbers黄金结果保持。
4. 同scope签名变更复用且请求数不增加；source由en→fr或已知→duplicate UNKNOWN不重用；target ar→en／pt-PT→pt-BR不同cache；旧Job迟到不能发布到新scope。
5. cold写入→warm读取规则/结果一致；旧非中文缓存隔离；中文旧cache仍可hit；程序默认UI变更不清新cache、自填值改变换key，存储字节保持。
6. 中性payload仍拒ID gap/重复/逆序、source quote mismatch、crosses_source_break或speaker越界，不能用“多语种”放宽这些。
7. sourceOnly/人工/AI关闭provider0；N28A基础counter/范围测试仍通过。本卡不启用counter改变页面，CPS>8的旧空页行为仍是已知下一卡项，不假造本卡已修。

Java全套（基线490，加新增如实报告）、Python27、本地化220×14、冻结4/4/4与三类不可见0，ACCEPTANCE/frozen文件不改。必要旧测试只有明确scope参数更新、保持原断言；展示/字号/renderer冻结blob与N28A一致。

最终交付MPP自身组合84/84，真实11根DEX接口/分支检查与类增减清单；不要固定58034而忽略新class。现有N28A tools/归档`.verification/n26-rollback/audit-tool`可复用，只读检查`--require-ai false`防N27观察者残留；N27类/事件/回调仍0。SDK28新增数据/API使用可运行，避免List.of/Map.of等运行库可用性假设，不新增依赖/下载SDK。明确实际候选/最终文件与哈希，旧三件套保护不覆盖。

## 8. 完整交付、验收方式及停止点

独立产物-n28b：
- `build/local-test/patches-1.3.5-本地测试包-n28b.mpp`
- `build/local-test/extension-1.3.5-本地测试包-n28b.mpe`
- `build/n28b-composition-final/YouTube-21.16.256-本地测试包-n28b-unsigned.apk`

提交与锚点`anchor/n28b-<实际短哈希>`，docs-only写实可另提交，保留旧历史。`docs/N28B-LOCAL-TEST-BUILD.md`包含范围、兼容条件/例外、rule表、缓存版本、实际测试/trace/DEX/三件套hash和已知N28C事项；两份状态同步。Codex全程自己实现/验证/收尾，完成即停，不自动开发N28C。

本卡工程验收以固定生产回归/真实交付DEX为主，**不强制用户逐语种视觉验收才能推进C**；若用户装机，可观察启动/普通中文回退并读明确英文策略日志。没有真机就写未做，不能声称翻译质量提升或完整UI/RTL可用。完整多语种可见功能真机验收集中在N28C后安排。

未经用户另授权不签名/安装/清数据/推送/发布。三个旧本地化/summary/技术英文问题仍留最后，改默认的内部来源元数据是本卡语义必须，UI资源与全面迁移不是本卡。N27搁置、VISIONOS已解决关闭。
