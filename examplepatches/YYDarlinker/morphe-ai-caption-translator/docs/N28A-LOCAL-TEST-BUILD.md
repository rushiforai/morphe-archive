# N28A 本地测试交付：语言上下文与计数基础

日期：2026-10-02（Asia/Shanghai）。Codex 独立完成本卡的实现、离线验证、三件套组合与审计、本地提交及档案同步。不生成 DeepSeek 收尾任务或 handoff，不实施 N28B/N28C。

## 1. 开工基线与严格边界

- 唯一施工仓库：`E:\Projects\morphe-caption-v2`。
- 开工 HEAD：`c771c53de765c99a83e0069d406df1a0a4894030`。实际存在的恢复检查点 `45a7cc499c63866207742018f24e6132d45d13e1` 与 `anchor/n26-restored-20261002` 对应；该点到开工 HEAD 仅 docs 变化。
- N26 产品基线 `7f9c639`（源码 `509d50a`）、N26r 源码锚点 `anchor/n26r-1b9e429` 保留。开工非 docs 跟踪树相对 N26 零差异、工作区干净，没有恢复此前撤回的 N28 实现或修改过的旧测试。
- 已阅读 `docs/CODEX-EXECUTION-WORKFLOW.md`、PROJECT-STATE §4t、回退记录与 N28A 卡。没有改 build 配置、依赖、资源、patch Kotlin、ACCEPTANCE 或 frozen-baseline。

## 2. 生产接入：仅三项基础类与 14 行 Controller 增量

新增 `CaptionLanguageProfile.java`、`CaptionLanguageContext.java`、`CaptionUnicode.java`，均在既有 `app.yydarlinker.deepseekcaptions` 包内，不依赖播放器 View。

既有产品仅 `RebuildController.java` 增加 14 行：Session 构造时建立自己的 final 上下文；实际 activate 的新 Session 分支记录一次 `LANGUAGE_PROFILE_BOUND`；旧 Session 复用时仅观察源码变化、按值变化去重记录 `LANGUAGE_CONTEXT_MISMATCH`。新增计数器不在 Controller、请求、审查或分页策略中被调用，没有新线程、tick 计数或轮询。

来源：从 `CaptionEngine.sourceCaptionUrl(url)` 的单一 `lang` 读取原始源 code，绝不把 `tlang` 当源语言。目标直接用既有流程确认的 Session.target。新元数据规范大小写、外围/分隔符 ASCII 空白、下划线及 in→id，保留地区/脚本；不改 URL、旧 TargetLanguage 结果、Session.target、identity、cache key。

缺失、und、非法 code 或重复 lang 无法唯一确认时 source_code/source_provenance 为 UNKNOWN，不从正文脚本或 UI locale 猜语言。明确 primary=en 且档案为 Hans/Hant 时 canApplyEnglishToChinese 才为 true，仍只是元数据。裸 zh 为 generic、chineseFamily=true、未知脚本，不凭空选择 Hans。未知合法目标保留其规范化 code 与 generic 档案。

绑定字段：source_code、target_code、profile_id、policy_version、source_provenance、reading_counter、line_counter、direction、strategy=legacy_unchanged。日志不包含密钥或签名 URL。停止、切轨、换视频创建独立上下文；同轨仅签名变化复用、不再绑定。重复 lang 的实际 activate 回归证明：旧身份按首个 lang 复用，而观察者拒绝歧义并记录 mismatch，旧 final 上下文、身份和策略不被“修复”。此类身份边界留 N28B。

所有冻结文件（RebuildApi/Cache/Protocol/Review/Semantics/Numbers/Planner/Source/PageLayout、叠层、NativeCaptionBridge、DeepSeekConfig、TargetLanguage 等）相对 N26 的 blob 差异为 0；58 份原有 Java 测试源码以及旧 fixtures 也为 0。两项归档锚点/历史交付均保留。

## 3. 不可变参考档案与版本

政策版本：`n28a-reference-v1`。14 档案 + generic，固定不可变 Map、final 字段与显式代表 Locale，不按 UI 语言或运行时反馈调参。

| 档案 | 参考 CPS / CPL | Reading | Line | Direction |
|---|---:|---|---|---|
| zh-Hans / zh-Hant（两项） | 9 / 16 | legacy_codepoints | legacy_chinese，仅记录 | LTR |
| ja | 4 / 13 | visible_grapheme | japanese_width | LTR |
| ko | 12 / 16 | visible_grapheme | korean_width | LTR |
| en | 20 / 42 | visible_grapheme | grapheme | LTR |
| es / fr / de / pt / ru / vi / id（七项） | 17 / 42 | visible_grapheme | grapheme | LTR |
| ar | 20 / 42 | visible_grapheme | grapheme | RTL |
| hi | 22 / 42 | visible_grapheme | grapheme | LTR |
| generic | 17 / 42 | visible_grapheme | grapheme | FIRST_STRONG |

softPageDurationMs=7000 存为参考元数据，**不参与本期任何判定**。中文外部 9/16 不替换旧 8CPS/12–18 行为；其他语种也仍走旧策略。本卡覆盖旧研究草案 pending/unapproved 以及 ko weighted-reading 描述：韩语半权只用于 CPL，绝不用于 CPS。参考取本任务卡定案，外部普通成人指南索引可追溯到既有 future-plan-research/language-profile-draft.json；不是 Netflix 整套认证，出版社 character 不等同本实现字素。

## 4. Unicode 工程契约及最低平台证据

计数版本 `n28a-counters-v1`；边界版本 `android-icu+devanagari-virama-v1`。

- 主字素算法为 Android 现有 ICU BreakIterator.getCharacterInstance(explicit Locale)，返回 UTF-16 边界。每次独立 iterator，不跨线程共享。字符不是用 length/codepoint 循环伪装出来的。
- getLineInstance 的候选与安全 character 边界取交集；仅返回数值/边界，不改正文，不接入现有分页器，不做 NFKC、不倒转、不添加方向控制符。
- visible grapheme：每个有可见 base 的完整 cluster 为 1；普通空格、NBSP、标点各 1；换行/控制/孤立 format、combining mark、ZWJ、variation selector 不单独增加单位。
- 中文 legacy reading 精确 codePointCount(0,length)，包含基线会计入的 mark/CR/LF/format。legacy_chinese line 仅以两倍同一 codepoint 单位记录，不作为旧分页器替身。
- CPL 返回整数 halfUnits，**1 whole = 2 halfUnits**。日语完整 cluster 的可见 base 按 ICU East_Asian_Width：Narrow/Halfwidth 为 1 half，Wide/Fullwidth/未知为 2；emoji presentation/flag/keycap 完整 cluster 保守为 2。附加 mark 不另计权；不做宽度折叠或 Paint 替代。
- 韩语：Latin script、空白和标点为 1 half，其余/未知为 2，emoji cluster 为 2。组合 mark 不另计权；数字不是 Latin script，样例 123 为 6 half。Reading 无这些半权。
- 边界保护仅排除 Devanagari 辅音—virama—可选 mark/ZWJ—辅音内部的切口，限定已列明辅音范围；ZWNJ 与独立元音不被强行合并。不是通用 Indic 新标准实现。

实际使用离线已安装的 Robolectric Android 平台 SDK28 和 SDK35（不是手机或启动模拟器）：

| 平台 | 实际 backend / Unicode | 固定样例 |
|---|---|---:|
| SDK28 | android.icu，ICU 60.2.0.0 / Unicode 10.0.0.0 | 26 |
| SDK35 | android.icu，ICU 75.1.0.0 / Unicode 15.1.0.0 | 26 |

SDK28 原始 ICU 将 क्ष 分成 [0,2,3]、क्‍ष 分成 [0,3,4]、क़्‍ष 分成 [0,4,5]；安全排除分别输出 [0,3]、[0,4]、[0,5]。SDK35 原始 ICU 已合并这些用例。本地两平台均通过同一手写固定期望，不由生产函数计算 expected。

固定数据还包括 NFC/NFD、越语多个重音、阿语 mark、nukta、Hangul NFC/Jamo、emoji modifier/ZWJ/family/flag/keycap、surrogate pair、NBSP、CRLF、孤立 mark/方向符与反例。Ja 固定样例 reading=9、halfUnits=13；ko 固定样例 reading=7、halfUnits=8。平台 EAW 分类未强制 NFC 化，例如 é（Ambiguous）与 e+accent（Narrow base）可有不同日语 line 半权；两者 Reading 均 1。真实 Paint 完全不受这些数值影响。

证据：`build/n28a-records/icu-sdk28.json`、`icu-sdk35.json`。SDK35 是本地已有额外运行平台，不声称最新；没有下载新 SDK/运行时库。这里只确认这些最低平台基础用例，不声称全 Unicode18/UAX29 合规或 API28 整个 YouTube 真机验收通过。

## 5. 真实调用与无行为回退

- 原有 **440/440（58 套件）** 完整保留；新增 **50/50**，合计 **490/490（62 套件，0失败/错误/跳过）**。新增最初 49 条后，另补一条“配置已就绪时原文/AI关闭仍API0”，全量再次实际运行。
- 32 条不可变参数/alias/地区/generic 回归；6 条真实 activate/生命周期/去重/异常及语言元数据回归；5 项 Unicode 检查各运行 SDK28/35（10 条）；2 条真正运行既有 Session/请求/原文路径的兼容回归。
- activate 5 组 en→Hans、en→Hant、fr→ar、zh→en、unknown→fr，各在中文/英文/阿语 UI locale 下建立真实 Session，共 15 次，profile 不随 UI 变化。该矩阵使用未就绪 API 配置只验证 Session 创建/绑定；不是五组模型翻译质量验收。
- 就绪的 en→Hans 正常 AI Session 从本地原始源 fixture 到 MockWebServer 真正发送一次模型请求，收到合法响应、审查/接受事件并实际渲染。N26 原 Controller 的黄金证据在产品修改前获取，后又用精确 N26 Controller 与既有原生图形/可控几何桩强化页面文本/时间/字号，最后与 N28A 全字段相等。未使用已撤回 N28 实现或旧改动测试。
- 真实请求 JSON **7207 bytes** 完全相同；PROMPT hash=`9f4ddd4be3f3cee1e068d1d710f78b2b41bf88c6c4f4438ca1874ba206448d54`；FIDELITY hash=`67bcd4e94c65d47c51abf1dcecf45f46e80bbd0bfce90e4d4893f5628b64fdaa`。也逐字段比较有效正文、cache key/source key/identity、5个原token、block、接受事件和页面。
- 黄金页面“这是一条完整的测试字幕。”为 [0,2400]ms，实际字号 48.27118682861328px，绑定受控 600×340 视频几何；一次原始源 GET、一次本地模型请求。签名复用后仍同 Session/身份、请求总数不增加。此为 Android 图形运行的工程回归，不是真机截图。
- 原文 Session 在**配置已就绪**且目标 en/Hans 时均 provider 0；人工/原生代理/AI关闭路径继续 API0。包含英文→Hans元数据 true 但 original 模式不启用翻译的反证。所有模型调用只在本地 MockWebServer，无远程模型 API。
- Python **27/27**；本地化 **220键×14资源**；冻结 **4通过/4既有失败/4未验证**，pending_translation/event_review/overflow 三类不可见时长均 0；ACCEPTANCE/frozen-baseline **零 diff**。

证据：`java-counts.json`、`language-session-matrix.json`、`baseline/legacy-activate.json`、`legacy-activate.json`、`legacy-equality.json`、`frozen-blobs.json`及全量日志，均在 `E:\Projects\morphe-caption-v2\build\n28a-records`。

## 6. 构建、正式组合与最终 DEX

离线使用既有 JDK21、Gradle9.6.1、Android SDK。清模块 build 路径之前确认均在施工根内，不清 root build/历史交付/.verification。首次清理被旧 Gradle daemon 持有 classes.zip 阻断，停止旧 daemon 后清理/重编译成功；清理重建 59 项中 57 executed、2 up-to-date。最初本机 JDK25 与既有 Robolectric/ASM 不兼容，未改依赖，切换归档已有 JDK17 验证基线，最终使用原链路本地 JDK21 全量重跑。

正式交付 MPP → **YouTube21.16.256 + 官方1.44.0 + 实际 Patcher1.14.1**；既有正式组合 **84项 PASS**，structure/selection 与 N26 逐字节相等。不是宣称 84 种新增语言策略已验证。输入 SHA 见下表及 inputs.json。

注意：冻结 MPP 构建清单中的 Patcher-Version:1.12.0 继承不改，它不是此次组合引擎版本；实际组合 JAR 的 version.properties 明确 version=1.14.1。

- MPP 72 个唯一条目、CRC通过，所有14资源及根 patch classes.dex 与 N26 逐字节一致；仅 manifest 构建信息与内嵌 MPE 改变。独立 MPE 与内嵌字节完全相同。
- DEX class inventory：N26 APK **58028** → 本包 **58034**；MPE 1411→1417，仅新增三基础类及 profile 的三个 enum，零删除。没有 RenderSpec/Pager/旧N28其他产品类；N27避让类/事件/回调仍为 **0**。
- 常规 CompositionDexAudit：接口签名/可见性、native视频来源、dispatcher/菜单/Settings bridge 等全部通过，DEX_AUDIT_PASS classes=58034。
- 使用 `.verification/n26-rollback/audit-tool` 的已归档只读工具，34个文件按 manifest SHA核对一致。`--require-ai false`只表示无N27避让观察者，**正常AI仍启用**。
- 三件套全分支审计：MPP 2个DEX、MPE 1个DEX、APK全部 **11个根DEX**；APK **321988方法 / 624617分支边**，invalid_branches=0、dex_problems=0、binding_failures=0，含故意坏分支 mutation 拒绝自测。没有固定期望58028类来逃避新类核对。
- 实际宿主 16604个唯一ZIP条目、CRC、全部DEX长度/SHA1/checksum通过；三套 settings XML 的 N26键/无旧图标与14份 preview_hint 在真实 resources.arsc 中均确认；无 validation 类泄漏。
- aapt：app.morphe.android.youtube 21.16.256，minSdk28/targetSdk36；apksigner：DOES NOT VERIFY / Missing META-INF/MANIFEST.MF，确认 **unsigned**。中文路径元数据读取使用本期 ASCII hardlink，未动历史别名。
- **56/56 历史交付/候选路径字节数和 SHA 未变**，覆盖 N26/N26r/N27/N27r 与撤回 N28 归档材料，不覆盖任何旧三件套或候选。

### 正式输入

| 完整路径 | 字节 | SHA-256 |
|---|---:|---|
| `E:\Projects\morphe-caption-v2\com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk` | 184,012,881 | `724D2BF15D31DAC98DB00D82914DB3876EDF66E62FE2845001F204209ECF4C00` |
| `E:\Projects\morphe-caption-v2\patches-1.44.0.mpp` | 9,844,976 | `936E67FA18BA361D4757EE2B640BDB08195AF3420088AAB9D0E1F03BA76A9B22` |
| `E:\Projects\morphe-caption-v2\.verification\toolchain\morphe-patcher-1.14.1-all.jar` | 46,727,564 | `8CF6A9EAB4EE9DAB146BDDC24681897851564F53116BAEC11F36BA2FA2F589BE` |

### 独立 -n28a 三件套

| 完整路径 | 字节 | SHA-256 |
|---|---:|---|
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n28a.mpp` | 1,107,877 | `333139875D3DC35305E61842C87BAE67E4E507A885B18A86E71D81EF6CB25E07` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n28a.mpe` | 2,723,188 | `FE93BF3ACF45E78B1D7C618B10711401D116605A7E007AFE79E5C3BDB4270395` |
| `E:\Projects\morphe-caption-v2\build\n28a-composition-final\YouTube-21.16.256-本地测试包-n28a-unsigned.apk` | 196,940,044 | `A8EB1EABE30D1C75373C004C7738B9E32EC8DD4379AD3E474C799087D9AEE4A9` |

## 7. 复现入口与停止点

均从 `E:\Projects\morphe-caption-v2` 运行，JAVA_HOME 指向既有 `E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1`；Python 使用本地已有解释器 `C:\Users\14776\Documents\kimi\tasks\2026-09-29\00-35-52-ec1208d7\proj\work\p4d\python\cpython-3.11.16-windows-x86_64-none\python.exe`（下文 python 为该路径的简写），没有下载。测试导出目录通过 N28A_EVIDENCE_DIR 指定。

- `gradlew.bat :extensions:extension:testDebugUnitTest :patches:buildAndroid --offline --no-build-cache`；最终另全量 `testDebugUnitTest`，新50/总490。
- `tools/n28a/verify_delivery.py` 的 prepare/frozen/package/results/finish：保护历史、范围/旧blob、打包、黄金/测试计数和正式产物检查；package与组合拒绝覆盖既有路径，已经交付时不重新执行这两步。
- `tools/n28a/run_composition.ps1`：必须 fresh composition output，从正式 MPP 组合。
- `tools/n28a/run_final_audits.ps1` + `audit.init.gradle`：独立归档分支工具，不修改冻结 build 配置。
- `tools/n28a/verify_dex_inventory.py`、`verify_host_resources.py`：读取实际交付类清单/宿主资源；后者沿 N26验证方法对 N28A路径重跑。
- `python -m unittest discover -s scoreboard -p test_*.py`、`tools/check_localization.py`、`.github/scripts/verify_bundle.py 1.3.5`。具体 stdout、JSON、输入/产物 hash 与全 DEX 报告均在本期 records 下。

未覆盖：真实手机/全宿主生命周期验收、真实14语言翻译自然度、RTL实际绘制、最新平台全面Unicode一致性和多语种UI遗漏。未更换 prompt/cache/审查/源切块/字号/方向/触摸/native菜单/调度/重试/用户存储。新基础不参与任何旧策略判断，**不宣称修好了全语种翻译或UI**。

没有签名、安装、清数据、推送、发布、远程翻译或工具/模型/依赖下载。N27继续搁置，VISIONOS已由用户关闭；三项旧UI/诊断问题留后续。正常完成后停止，等待用户/规划者审阅，**不自动开始N28B**。

## 8. 提交收尾

实现提交 **d683e5927191928c335957b3e9fe4fb4816ac518**（短哈希 **d683e59**），源码锚点 **anchor/n28a-d683e59** 实际指向该提交。一个实现提交包含源码、50个新增测试、固定数据、验证工具和交付记录。随后仅 docs 写实上述哈希/档案，不再含产品变动；HEAD 是其后 docs 收尾，具体 SHA 以最终 Git 核对及 build/n28a-records/final-state.json 为准。两份 PROJECT-STATE 已同步，收尾提交后工作区干净；未推送、签名、安装或发布。
