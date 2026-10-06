# N28A 下一步执行卡：语言上下文与计数基础（Codex 完整负责）

日期：2026-10-02。本卡是撤回未完成N28后重新规划的第一张卡。Codex负责本卡全部源码、验证、建包、提交与交付，不生成DeepSeek收尾卡，也不自行实施后续N28B/N28C。当前有效规程为`docs/CODEX-EXECUTION-WORKFLOW.md`。

## 1. 开工基线与范围

唯一施工仓库：`E:\Projects\morphe-caption-v2`。恢复基线为N26交付后`7f9c639`（源码`509d50a`），N26r源码锚点`anchor/n26r-1b9e429`。本次2026-10-02重新恢复检查点为`45a7cc4`，标签`anchor/n26-restored-20261002`指向该点；开工核对它实际存在及当前HEAD关系，不能从名字猜SHA。锚点后的仅docs变化可保留；全部非docs跟踪树必须相对`7f9c639`零差异、无N28新增产品文件。如有真正产品新改动，先核对执行者状态，不能覆盖在途工作。

先读PROJECT-STATE最新§4t及回退记录`N28-RESET-TO-N26.md`、本卡。N26基线Java440/440（58套件）、Python27/27、220键×14资源、84组合、DEX类58028。本次此前未提交的N28已全部撤回并归档，不能直接恢复归档实现或沿用它修改过的旧测试。

**本卡目标**：确定真实的语言code来源与不可变profile、实现可独立验证的计数/边界基础，并在真实AI Session中以只读技术记录证明选对了profile。现有翻译/分页策略不变；这是基础能力交付，不能宣称已解决全语种策略或UI适配。

必须冻结：现有生效prompt及hash、模型请求JSON、源token/分块、结构/语义/数字检查、cache key/namespace/read-write、分页切口/时间/字号/方向/触摸、native菜单/字节码、调度并发/预取/重试、配置存储/API/profile/用户文本。新基础不参与任何现有策略判断。尤其不改`DeepSeekConfig`的默认/自填判定、不改`TargetLanguage`旧空值处理，不把兼容问题扩大为迁移任务。

## 2. 允许的生产改动

原则上只增加`CaptionLanguageProfile.java`、`CaptionLanguageContext.java`、`CaptionUnicode.java`（按实际约定可合并，但不可加未用RenderSpec/Pager），并在`RebuildController.java`的真实Session创建/技术记录路径作小范围接入。这些类不依赖播放器View，不新增线程、轮询或供应商请求。

既有`RebuildApi/Cache/Protocol/Review/Semantics/Numbers/Planner/Source/PageLayout/CaptionOverlayV2/NativeCaptionBridge/DeepSeekConfig/TargetLanguage`保持基线blob不变；构建配置/资源/patch Kotlin本卡不变。新增测试、新固定数据、验证导出脚本及允许docs可新增。现有440条测试不删断言、不按新结果重做旧fixture。若为实现观察上下文确实需要修改这份冻结清单，先定位具体阻断并向规划者报告，不自行跨进N28B。

## 3. A：14档案，固定数据而非运行调参

不可变profile集中维护：profile ID、代表locale、direction元数据、reading counter、line counter、reference CPS/CPL、soft page duration、policyVersion。有效profile从**目标code**选择，与UI语言无关。下表仅外部普通成人字幕参考/未来工程指导，本期不作为过滤/分页/修复门槛。

| profile | 参考CPS / CPL | Reading单位 | CPL单位 | Direction元数据 |
|---|---:|---|---|---|
| zh-Hans、zh-Hant（两项） | 9 / 16 | `legacy_codepoints`，未来仍保留既有8CPS | `legacy_chinese`，仅记录 | LTR |
| ja | 4 / 13 | visible grapheme | 全角1/半角0.5 | LTR |
| ko | 12 / 16 | visible grapheme | Latin/空格/标点0.5、其他1 | LTR |
| en | 20 / 42 | visible grapheme | grapheme | LTR |
| es/fr/de/pt/ru/vi/id（七项） | 17 / 42 | visible grapheme | grapheme | LTR |
| ar | 20 / 42 | visible grapheme | grapheme | RTL |
| hi | 22 / 42 | visible grapheme | grapheme | LTR |

未知但合法目标保留`generic`元数据（软17/42/7000ms、FIRST_STRONG），不得禁用原有其他菜单语言或改写成中文。所有非中文未来参考速率/CPL/7000ms只为软目标；最大两行/真实像素/源归属等是后续卡硬约束。本卡存参数、测量参考，无策略行为启用。韩语0.5只用于CPL，不移植到CPS；reading计数与line计数是不同方法。

旧研究草案的`pending/unapproved`与ko weighted-reading描述按本卡定案覆盖。语言参考不等同整套Netflix字幕认证，具体字素计数是工程契约，不能声称出版社character=这个实现。中文9/16外部参考不替换既有8CPS/12–18行为。

## 4. B：实际Session的只读语言上下文

新增不可变上下文，包含实际sourceCode、targetCode、profile、sourceProvenance和`canApplyEnglishToChinese`（仅元数据，不本卡启用规则）。

- source从当前有效原始源请求`CaptionEngine.sourceCaptionUrl(url)`里的`lang`解析；target取**现有流程已确认的Session.target**，不要重新按UI名/系统默认推导。tlang不是源语。
- 无source码、und、非法code均标UNKNOWN；不凭Latin/Han/假名猜。代码明确primary=en且profile为Hans/Hant时，适用标志才true；French/纯汉字Japanese/unknown全部false。
- 校验并规范空格/大小写/下划线，in→id；保留实际目标地区/脚本（pt-PT与pt-BR、en-GB与en-US不互改）。profile选择primary或显式zh脚本/地区：Hans/CN/SG，Hant/TW/HK/MO；generic zh标中文族未知脚本，不无证据硬猜Hans，但未来仍留中文兼容通道。
- code规范化只用于新上下文元数据，**不改原URL、TargetLanguage结果、Session.identity/target或缓存键**。
- 每个新Session建立自己的final上下文，停止/切轨/换视频后不把上个Session上下文覆盖新Session。已有in-flight的身份判定继续原逻辑，不为新元数据重写生命周期。
- 若现有prevSession重用时仅URL签名变化，不重复log；若新观察源码发现实际source code变化但既有复用身份未变化，本卡记录明确的`LANGUAGE_CONTEXT_MISMATCH`观察，不静默修改旧Session策略、不接受metadata作为修过identity的证明；下一N28B解决该边界。
- 使用既有`CaptionDiagnostics.mark`，每个新Session至多一条`LANGUAGE_PROFILE_BOUND`，技术字段source_code/target_code/profile_id/policy_version/source_provenance/reading_counter/line_counter/direction/strategy=legacy_unchanged；可选上述异常按值变化去重。不得在80/100ms tick写计数，不输出API密钥或签名URL。

这个小接入必须通过真实`activate`证明，而不只测试工厂函数；不会更换正文、fallback或request参数。不得为取得“准确source”新增下载/native字节码读数：此卡只声明URL lang的来源，若后来真实native元数据冲突，留下一卡处理。

## 5. C：平台Unicode基础与明确计数契约

使用Android已有`android.icu.text.BreakIterator`，显式locale，封装独立每调用/每线程实例，不跨线程共享可变iterator。getCharacterInstance输出UTF-16边界索引；getLineInstance给合法换行候选，最终候选与character边界取交集。仅输出边界/数值，不调用现有分页器，不修改字符串。

非中文visible grapheme：空格/标点各1，换行和孤立方向格式控制不增加reading单位，combining mark/ZWJ/variation selector不是独立阅读单位。保留逻辑字符串不做NFKC、倒转或给provider文本插方向控制符。中文legacy计数精确保持基线codePointCount的单位语义，不因为新counter存在就替换旧计数。

日语CPL按完整cluster的全/半宽类别（含普通/全角空格与标点）；韩语按已定Latin/space/punctuation权重，组合mark不再额外计权；未知cluster保守记1。基础返回整数halfUnits可避免浮点累计漂移；接口文档说明1 whole=2 half。真实Paint宽度在本卡不受这些数值影响。

覆盖NFC/NFD、越语多个重音、阿语组合符、Devanagari virama/nukta/ZWJ、Hangul Jamo、emoji modifier/ZWJ/flag、surrogate pair、NBSP和CRLF。API28自带ICU版本不是最新UAX29，记录backend/Unicode版本及SDK；不声明全Unicode18合规。若实测平台对目标用例拆开关键组合，Codex负责小而明确的边界安全排除并测试，不加运行时库、不以Character.length/codepoint循环冒充字素算法。不得为“读速更好”调unit定义。

## 6. D：验证指标——无行为回退是本卡硬门槛

Codex完成所有检查，不能把任何收尾任务交DeepSeek。

1. 参数/profile覆盖14个目标加generic；alias大小写、zh地区、pt地区保留、in/id；空/unknown不构造英文源或中文目标。
2. 计数/边界固定期望样例，不是调用生产函数算expected；至少给重音/ZWJ/Indic/Jamo/Arabic明确完整cluster边界、ja/ko权重和counter版本。test fixtures使用简单等义示例，不需真人母语自然度签字。
3. 在离线已具备的SDK28环境测试平台ICU关键行为，并记录SDK/backend；最新环境若本地可用可加测，不自动下载新SDK。没有最低SDK证据就不宣称最低系统通过。
4. 真实Session `activate`测试en→Hans、en→Hant、fr→ar、zh→en、unknown→fr；UI locale在中文/英文/阿语切换不改变新上下文profile。人工/原生/AI关闭继续API0；必要MockWebServer只本地，不远程模型。
5. 对同输入同配置，legacy有效prompt字符串/hash、请求JSON、cache身份、原token/blocks、页面文本/时间/字号保持基线结果。冻结生产文件blob0差异提供强证据，Session小接入还须实际调用回归证明没有多发请求或更改身份。不能只因440测试绿说兼容。
6. 既有Java **440条仍全部存在且通过**，新增测试数按实际总数报告；Python27/27、本地化220×14、冻结4/4/4且三类不可见时长0，ACCEPTANCE/frozen-baseline零diff。新增简单模块不另做海量非必要组合。
7. 从正式交付MPP组合实际YouTube21.16.256＋官方1.44.0＋Patcher1.14.1；既有84组合通过、DEX接口/可见性/全部根DEX分支审计；采用已归档工具`.verification/n26-rollback/audit-tool`，`--require-ai false`表示无N27观察者，正常AI仍启用。不得固定期望58028类，新类数如实核对。
8. 14资源、输入/输出SHA、包CRC/MPE内嵌一致/unsigned/实际宿主资源等沿现有流程；所有旧产物SHA不变。N27类/事件/回调仍为0；只多了本卡基础类和每Session记录。

## 7. 完整交付与停止

独立三件套使用`-n28a`，不覆盖N26/N26r/N27/N27r或此前N28任何候选：
- `build/local-test/patches-1.3.5-本地测试包-n28a.mpp`
- `build/local-test/extension-1.3.5-本地测试包-n28a.mpe`
- `build/n28a-composition-final/YouTube-21.16.256-本地测试包-n28a-unsigned.apk`

源提交/锚点`anchor/n28a-<实际短哈希>`，一个实现提交，docs写实可另提交，说明其后无产品变动。`docs/N28A-LOCAL-TEST-BUILD.md`记录生产接入、计数定义/版本、明确未启用的策略、测试/组合/DEX/hash和真机未覆盖；两份PROJECT-STATE同步。无DeepSeek handoff JSON、无DeepSeek任务卡。

最后给用户三件套完整路径、字节/hash、源码锚点/HEAD/工作区、实际检查与未覆盖。正常完成后停止，等待用户/规划者审阅，不自动开始N28B；本卡不宣称修好了全语种翻译或UI遗漏。未经明确授权不签名/安装/清数据/推送/发布，无远程翻译API、无依赖/模型/工具下载。

## 8. 后续已保留的需求和依据

N28B将上下文用于规则/prompt/cache；N28C再做非中文分页与RTL实际测绘，两者都由Codex完整执行，后续另发具体卡。第四期多选候选14、默认空集合、AI关闭仍保留、原生已有不重复/真实排序、简中补丁并AI root；原“记住字幕”补丁独立。三个旧问题到功能完成后统一修：入口summary功能说明、运行时所有UI语种及程序性诊断英文。

资料可复用：`C:\Users\14776\.codex\visualizations\2026\10\01\01a0f56a-7d8c-75e0-8def-3fa2f0b542ef\future-plan-research`的profile草案/逐语种指南/开源计数/Unicode相关来源。本卡profile与单位定义覆盖旧草案；数据只作参考，未实现代码归档不能当标准库直接恢复。

平台依据为Android ICU BreakIterator与Unicode UAX29/UAX14；外部普通成人CPS/CPL来源在`language-profile-draft.json`逐项列明。无需再次做无边界标准搜索；若平台支持结论不确定，查官方API/本地SDK并如实记录。
