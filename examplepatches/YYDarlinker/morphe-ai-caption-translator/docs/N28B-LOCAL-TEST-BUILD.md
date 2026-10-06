# N28B 本地测试交付：语言范围、请求策略与缓存接入

日期：2026-10-02（Asia/Shanghai）。Codex 完成本卡实现、生产关键/全量离线验证、正式 MPP 组合、最终 DEX 审计、交付与两份状态同步。没有 DeepSeek 收尾，没有启动 N28C。

## 1. 基线、范围与提交

唯一施工仓库 `E:\Projects\morphe-caption-v2`；开工 HEAD `c518823`，源码 `d683e59` / `anchor/n28a-d683e59`。开工规划者改动为 CODEX-EXECUTION-WORKFLOW、PROJECT-STATE、N28A-REVIEW 和 N28B-CODEX-TASK；全部保留随卡提交。两份实时状态开工 SHA 相同：`4ABDF88AA70FB233E0E0EA25ECE23096F50504589E52662E6582CD80D37581F7`。未读取撤回 N28 的实现/旧改动测试来恢复产品。

实际产品修改十个既有 Java 文件：CaptionLanguageContext、DeepSeekConfig、RebuildController、RebuildApi、RebuildProtocol、RebuildPlanner、RebuildReview、RebuildSemantics、RebuildNumbers、RebuildCache。没有新增可变 currentLanguage，全链路使用一个 immutable Session/Job context；新增逻辑类型是 RebuildNumbers.Result enum。源码提交与锚点：`d02d7ccefbd3847d7c1df3b0306e22a3a14429f0（短d02d7cc，anchor/n28b-d02d7cc）`（首次实现提交后以 docs-only 写实）。

冻结 blob 与 N28A 完全相同：RebuildPageLayout、CaptionOverlayV2 / LayoutBudget、字号/FontMetrics/RTL/触摸、NativeCaptionBridge、TargetLanguage、RebuildSource、CaptionUnicode、CaptionLanguageProfile，所有 patch Kotlin/指纹与资源（27 个跟踪文件）、build 配置、依赖、ACCEPTANCE 和 frozen-baseline。源 word/token/quote/time/静音/显式 speaker 生成未改。调度槽位、预取/storm、超时、重试额度和 provider 鉴权/参数协商/response format 未改。所有用户值、保存函数、UI 默认显示/资源、Keystore 与 profile 管理均保留。

## 2. 严格身份和来源

政策版本为 **`n28b-policy-v1`**，独立于 BuildConfig 的 1.3.5 和 N28A reference 版本。依据当前已绑定源 URL 中唯一有效 lang 与现有确认 target，不用 UI locale/tlang 猜源，不增加取轨下载/native 模糊推断或文本脚本纠正。重复、非法、缺失、und 为 UNKNOWN，中立 scope；in→id 只规范元数据，不改签名 URL 或原文。

Session 在复用决策前建立 context；Job 持有同一个 final 对象，API、payload、parse、Review、数字、cache、repair 候选比较显式接收它。源/目标 code 保留地区与脚本；已确认中文目标别名在 metadata 中保留实际 URL code，兼容请求仍用旧 Session.target。pt-PT/pt-BR 的 profile 同为 pt，scope/cache 独立。

同 source/target/policy 的签名/expire 轮换复用 Session、调用数不增。已知源变更、duplicate→UNKNOWN、目标/有效偏好改变建立新身份，撤销旧 Session 的 publish 资格及 generation；已发送旧 HTTP 可以沿原 transport 完成，当前检查禁止将其 plan 或 durable write 交给新 Session。用户关闭/换视频的既有 disconnect 行为保留。实际迟到回归中旧 request 完成、old.plans 为空、old cache 未写、新 scope 的内存和磁盘都是 NEW_SCOPE_ONLY。

无有效目标的入口不建立翻译 Session；源 UNKNOWN 且目标有效可走中立策略，播放不因 UNKNOWN 停止。实际 sourceOnly、manual/native 和 AI 关闭路径 provider 0。

## 3. 规则、prompt 与缓存边界

完整逐条表见 [N28B-RULE-SCOPE.md](N28B-RULE-SCOPE.md)。结构/JSON/schema、整数 ID 完全有序覆盖、精确 quote、owned 时间、静音/speaker、非语音空 text、明确 literal ASCII model ID 跨事件保护仍保留。不能核实的外语词义是 UNKNOWN，不因未出现在中文设备词表而拒绝。

只有明确 primary=en 且目标档案 Hans/Hant 启用 **legacy_en_zh**；地区 English 也包含在内。generic zh 脚本未知、其他 Latin 源、UNKNOWN、Japanese 纯 Han 不启用中英语义词表。所有中文目标的呈现基线仍是 **presentation_policy=legacy_n26**，它与中英语义 scope 独立。

兼容通道原 PROMPT/FIDELITY 字节、有效表达/hash、request JSON/schema、hint、tokens/blocks 与旧 cache key 保留。常量 SHA：PROMPT `9f4ddd4be3f3cee1e068d1d710f78b2b41bf88c6c4f4438ca1874ba206448d54`，FIDELITY `67bcd4e94c65d47c51abf1dcecf45f46e80bbd0bfce90e4d4893f5628b64fdaa`。历史中文 default UI 表达参与 fingerprint 的行为继续保留：切 UI 可能改变该兼容空间，这是明确边界。

中立模板明列完整命题、否定/条件/型号/数字、精确 source quote/ID 覆盖与 source-owned range、不得摘要/增解释/schema；没有 SAM/坦克等旧领域例句与 CJK12–30/Latin30–76 长度指导。只有明确 English 源附通用依存提醒。目标按完整实际 code 指定，用户语气/风格偏好保留并服从目标菜单约束。中立 display_hint 只含真实 available_width_px、max_lines 和 profile/direction 元数据，不将 approx_cjk_columns 当作外语实际预算。

load 根据原真实存储识别 absent/两种已知旧默认，Snapshot 附 final provenance/effectivePreference；程序默认在中立策略用固定语言中立含义，旧构造器来源不明保守按自填。自填中文文本不会因“看起来像默认”被改写。固定回归证明偏好存储映射和用户字符串 UTF-8 字节保持，UI 默认变化不换中立 key，自填改变换 key；没有做整套持久化迁移。

cache 保留目录 `caption-events-r2.12`、原子写、fsync、容量/淘汰与旧中文数据，无清空/伪造迁移。中立 identity 纳入 source/target 完整 code、policy version、有效 prompt/偏好及 base URL/model；自然隔离旧非中文 cache。读写都显式 context，热读取再次执行相同 parse/Review/数字规则并重测中立可读性观察。可读性/参考 CPL/旧 LayoutBudget 超标仅 advisory，不为此付费 repair；结构错误保留原上限。无 context helper 仅明确 legacy fixture 入口，所有实际播放/网络/cache/repair 都用 context-aware 入口。

## 4. 数字确定性与请求 seam

legacy Numbers.safe 行为原封保留，旧 English/Chinese 日期与不确定数量测试仍通过。中立只对两端完整文本都是 Unicode Nd 十进制整数作数值比较：12、١٢、१२、全角/数学数字和前导零可等值；12→13/١٣/१३ 为高置信 CONTRADICTED。等值比较不改正文。

逗号 decimal/grouping、localized 日期、范围/多个数字、单位/货币/数量级、书写数字和嵌入 prose 的数量都为 UNKNOWN。numeric_unknown 单独记录，UNKNOWN 没有计作“100% 语义通过”。未实现 14 语种等价器，未修 ASR 或改 source_number_ambiguity。

明确 English 的词法保护/resource 提示保持；非 English/UNKNOWN 中立 seam 只用标点和原边界/cue。固定 240 token 样例：旧 lexical blocks `b0_0_118,b1_119_238,b2_239_239`，French scope 中立 blocks `b0_0_119,b1_120_239`；原 token/text/hash/250ms owned 时间逐项未变。差异在本卡授权的 request soft seam 范围，证据 `planner-scope-difference.json`。

## 5. 实际自动化与边界

Java **538/538，65 套件，0 失败/错误/跳过**：原 N28A 490 保留，新增 **48**（3 套件）。2026-10-02 用户明确允许更新两个直接冲突的 N28A 观察期断言：strategy=legacy_unchanged 与 duplicate-lang 继续复用旧 Session。除此之外只在两个旧固定英中 fixture 类的三处构造调用补显式 legacy scope，原断言/fixture 全部保留；未删例句或修改黄金数据来过测试。

真实 activate→source→Job→RebuildApi→parse/Review→write→read→Controller 接受路径只用本地 MockWebServer，远程翻译 API **0**。`policy-trace-matrix.json` **68 行**，含实际输入 source/target/UI、systemPromptHash、policy、cacheKeyHash、network/cache、调用数和拒绝/观察/数字结果；无请求的 provider0 行 hash 为 null，不伪造。调用数按各场景记录，不能把包含场景累计数/冷热对照的行简单求和当唯一调用总数。

兼容证据包括原 N28A `legacy-activate.json` 全字段相同；另在本仓库临时读取精确 d683e59 产品 blob，用同一测试/fixture 跑出 18 组独立黄金，再 finally 恢复 B 源码。source=en/en-US/en-GB × target=zh-Hans/zh-Hant/zh-CN/zh-TW/zh_Hans/zh-Hant-TW 的实际 request、prompt、identity/cache/source key、tokens/blocks/events/pages、owned 时间、字号与暖缓存逐字段一致。既有 2400ms 单页和 48.27118682861328px 固定呈现保持；没有将一条样例泛称全部视频质量。

非兼容实际矩阵含 fr→ar、zh→en、ja Han→fr、UNKNOWN Latin→fr、en→Japanese 纯 Han、fr→中文，分别切 zh/en/ar UI；中立 cold/warm 规则/结果一致，中文历史 UI fingerprint 边界单独验证。覆盖签名复用、known/duplicate scope 更换、ar/en 和 pt-PT/pt-BR 不同 key、旧 Job 迟到、旧非中文 cache 文件原字节保留、默认与自填来源、Unicode 整数和 localized 歧义、ID gap/重复/逆序、quote 错误、真实源 silence/speaker 越界以及 provider0。结构拒绝走原预算，长中立事件不启动 readability 付费 repair。

Python **27/27**；本地化 **220键×14资源**；冻结计分板 **4通过/4既有失败/4未验证**，pending_translation/event_review/overflow 三类不可见时长均 **0**。ACCEPTANCE/frozen 文件零 diff。SDK28 实际执行新增数据/生产路径，原 SDK28/35 ICU counter 范围测试继续通过；无 List.of/Map.of 假设、无新依赖/SDK/工具下载。

## 6. 正式组合与真实 DEX

本次锁定交付 MPP + 原 YouTube **21.16.256** + 官方 **1.44.0** + 实际 Patcher **1.14.1**，**84/84 PASS**；structure/selection 与 N28A 逐字节相同。manifest 中冻结的 Patcher-Version:1.12.0 构建标注仍继承，实际组合引擎是已核对的 1.14.1 JAR。输入 hash 见 `composition-inputs.json`。

MPP **72 个唯一条目、CRC 正常**；相对 N28A 只有 META-INF/MANIFEST.MF 与内嵌 MPE 改变，根 patch classes.dex 与全部资源逐字节相同；独立 MPE 与内嵌完全一致。宿主三种设置 XML、新导航 key 和 14 preview_hint 的编译资源检查全部通过。

实际 class inventory：APK **58034→58036**，MPE **1417→1419**；新增 **4**、移除 **2**，净增 **2**，不固定旧数量。新增 Result enum、Numbers synthetic lambda，以及 Protocol 两个重排 lambda；移除仅 Protocol 两个旧 synthetic lambda，无逻辑产品类移除。全清单见 `dex-class-inventory.json`。N27 类/事件/回调 **0**，没有启用新 pager/renderer。

只读归档审计工具 `.verification/n26-rollback/audit-tool` 的 **34 个文件 SHA** 全部与 manifest 一致，使用 `--require-ai false` 排除 N27 observer 要求；正常 AI 翻译仍启用。两项故意损坏 branch 的工具自测均拒绝。MPP/MPE/最终 APK 的 branch audit 与 CompositionDexAudit 全部通过；最终 APK 实际 **11 根 DEX / 58036 类 / 322028 methods / 624733 branch edges / 112402 switch cases / 46584 try blocks**，invalid_branches、dex_problems、binding_failures 均 **0**。

APK badging：`app.morphe.android.youtube`、versionName=21.16.256、versionCode=1561068412、minSdk=28。apksigner verify 明确 DOES NOT VERIFY / Missing META-INF/MANIFEST.MF，结合无签名条目检查，交付保持 unsigned。

## 7. 三件套、候选与哈希

正式文件均在 `E:\Projects\morphe-caption-v2` 下：

| 文件 | 字节 | SHA-256 |
|---|---:|---|
| `build/local-test/patches-1.3.5-本地测试包-n28b.mpp` | 1112063 | `93B8A2BA6B2C1127B7DC928F0187D4A476C7CF7FCB233CAD5117651EF79FFB91` |
| `build/local-test/extension-1.3.5-本地测试包-n28b.mpe` | 2732120 | `15C0703670BE698B9EE931FDF174BF9751895D7F6831E4597D67FB307E8C1845` |
| `build/n28b-composition-final/YouTube-21.16.256-本地测试包-n28b-unsigned.apk` | 196945780 | `D36DCB776FD61240F5F3103481B60E45B2B60E59137DA20AC7D21CB4851DD0A4` |

初次候选已保留在 `build/n28b-records/candidates/`：MPP 1112062 字节、SHA `B3822CF8B6AB7EA051437A81037E82B49B20940D7AA07C6C9D81B2617EBCA0EA`；MPE 字节/hash 与最终相同。最后全量 test/build 更新了构建 manifest；包内容对比只有该条目变化，候选未丢弃。正式组合读上表锁定 local-test MPP。组合/audit 的 Gradle 依赖会重新生成模块中间 archive，`patches/build/libs` 当前输出由 `module-intermediate.json` 单独记录；交付读取上表路径。

历史三件套/包/组合 APK 的开工与收尾逐文件 SHA 比较见 history-before/history-after，**57/57 文件字节/hash 未变**，无覆盖。实际证据目录 `E:\Projects\morphe-caption-v2\build\n28b-records`；所有测试、golden、trace、资源/输入/产物/类清单/分支报告/签名 stdout 保留。

## 8. 复现与停止点

本机既有 JDK21：`E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1`；SDK：`C:\Users\14776\AppData\Local\Android\Sdk`；Python：`C:\Users\14776\Documents\kimi\tasks\2026-09-29\00-35-52-ec1208d7\proj\work\p4d\python\cpython-3.11.16-windows-x86_64-none\python.exe`。N28A_EVIDENCE_DIR 与 N28B_EVIDENCE_DIR 均指本期 records，避免覆盖 A 证据。

复现顺序：`tools/n28b/capture_n28a_baseline.py`（baseline 存在则拒绝覆盖，finally 恢复源码/fixture）、`gradlew.bat :extensions:extension:testDebugUnitTest :patches:buildAndroid --offline --console=plain --no-build-cache`、`verify_delivery.py results/frozen/package`、`run_composition.ps1`、`verify_delivery.py finalize_apk`、`run_final_audits.ps1`、`verify_dex_inventory.py`、`verify_host_resources.py`、`verify_delivery.py finish`。打包/组合拒绝覆盖正式路径。Python unittest、check_localization.py、verify_bundle.py 1.3.5 与 aapt2/apksigner 命令 stdout 已保留。

未做手机启动/安装/视觉或母语审校；不保证翻译自然度提升、完整多语种 UI/RTL 可用或所有视频语义等价。呈现始终 **legacy_n26**；新 CPS/CPL/7000ms 参考没有改变分页，旧 CPS>8 可能空页的问题仍留 N28C。工程交付不强制用户逐语种视觉验收才能提交下一张卡，完整可见多语种真机检查集中 N28C 后安排。

Codex 完成本卡后停止，不自动开发 N28C。不签名、安装、清数据、推送、发布；无远程翻译 API。N27 搁置、VISIONOS 已由用户解决关闭；三个旧 summary/本地化/技术英文问题留最后，菜单与全面迁移没有提前实施。
