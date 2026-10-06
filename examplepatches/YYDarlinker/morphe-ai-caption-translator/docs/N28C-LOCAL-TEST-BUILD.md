# N28C 最终本地交付：调度基础修复＋非中文呈现

日期：2026-10-02，Asia/Shanghai。状态：**ENGINEERING_PASS / UNSIGNED_DELIVERY / DEVICE_NOT_VERIFIED**。本页后半的原施工阻塞记录按原文保存；其578/578、44/44、未交付与UNFIXED只描述历史阶段，不取代下列最终结果。

本次已实施独立“既有N28B调度基础修复”，保留全部N28C Pager/RenderSpec、font locale、Unicode/RTL等工作。详细锁协议、线性化、文件范围、失败尝试与证据见 [N28C-DEADLOCK-ROOT-CAUSE.md](N28C-DEADLOCK-ROOT-CAUSE.md) 新增记录。原纯B与原C各2/2死锁保留不动；本次B仅三个基础修复文件，未混入C呈现。

## 最终源码验证

- B＋基础修复：**550/550 = 538＋12**；完整C：**591/591 = 原579＋K12**；零failure/error/skipped。最终目录 b-full-final-03 / c-full-final-03。
- 每树200轮真实stop/schedule竞争，总400轮；单轮共享5秒硬截止、方法30秒。另覆盖scope替换/retire间隙、迟到HTTP/cache、source failure、明确stop、reuse和UI清理。12项新增测试验证状态/配额/cache。
- 65个原Java测试及断言字节不变；既有41项C测试未改；**44/44专项、中文legacy activate＋18组地区golden相等**。
- **14目标28冷/热production行、7 required pair行、40 geometry组合**；native ar/ja/de/hi PNG仅fixture目检。
- **Python27/27，本地化220×14**；冻结 **4通过/4既有失败/4未验证**，三个invisible_ms指标0，原baseline文件不变。
- 每树26 Controller同步区＋实际class审计无C/S双向嵌套；11个相关debug/release class字节相同。缓存reserve/revoke同一CAS，prepare/fsync锁外，撤销等待已经获准短提交并禁止新资格；acceptance在持久化操作完成之后。
- 实际冻结额度 **focus2/prefetch2/total4**。任务卡prefetch1与源码及原N23/N24断言冲突，本卡未改变实际额度。
- 两份PROJECT-STATE继续保持输入SHA `8C739406C32265EEBF71B5CA8E99B2CC3D8AAABA8FFA9452E2924F7E6493D2A2`；校验工具绑定保存的获准输入，没有回退或变更产品冻结内容。

## 三件套与审计

| 完整路径 | 字节 | SHA-256 |
|---|---:|---|
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n28c.mpp` | 1122526 | `E5AD4D348F235523488436466D9ED9D20B7104C963544DA671381B9259F34FFD` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n28c.mpe` | 2752676 | `877014E05618B54E321FAA34DE52CE5461747AA1594A642AF3C599F312BA5103` |
| `E:\Projects\morphe-caption-v2\build\n28c-composition-final\YouTube-21.16.256-本地测试包-n28c-unsigned.apk` | 196956968 | `8260BEEC8BE026ACDE107F6FA28586DD693C5EE2326DC68E1963CFA9C9F6F9DA` |

从最终源码 buildAndroid，再从上表交付MPP自身组合；内嵌MPE与独立MPE一致；root patch DEX/全部资源与B相同，72唯一ZIP项/CRC通过。**84/84**、structure/selection与B相等。最终 **11 DEX / 58047类 / 322101 methods / 625106 branch edges / 112402 switch cases / 46628 try blocks**；invalid_branches、dex_problems、binding_failures各0；MPP/MPE/APK branch与API绑定、归档审计工具自测、资源/设置XML/14 preview hint、aapt均通过。

apksigner仅verify，实际退出1并报告Missing META-INF/MANIFEST.MF；无ZIP签名条目/Signing Block，保持 **unsigned**。无签名、安装、发布或第四期。62旧历史产物与168原证据门槛/收尾SHA保护；N28B锚点及三件套原字节不变。

本轮全部新日志：`E:\Projects\morphe-caption-v2\.verification\n28c-scheduler-fix\2026-10-02T05-46-38-772884Z`。正式审计：`E:\Projects\morphe-caption-v2\.verification\n28c-scheduler-fix\2026-10-02T05-46-38-772884Z\delivery-records`。失败输入和完整线程栈也保存于独立子目录，详见根因报告；不把旧失败或部分绿色包装成最终通过。

## 有限真机观察（尚未进行）

仅观察正式未签名候选：启动/主页/设置；中文分页/字号/位置/time对照；pause、seek、换视频、rotate；少量ar RTL+Latin数字、ja/ko宽字、de/fr长词；冷/热cache和target/UI切换不串字幕。异常保留完整诊断、设备/Android/target/UI locale/时间段回流Codex。用户不承担14语种母语语义审校。真机YouTube/OEM ICU字体/远程供应商实况/母语语义均明确未验证。

---

## 交付实现身份

核心实现提交：`4d98eec20f9f9d1d9a8b2bf0e52934cade8d93b0`。真实锚点：`anchor/n28c-4d98eec`，精确引用该实现提交。该提交同时包含“既有调度基础修复”和“非中文呈现”，并保留进入本卡前获准的PROJECT-STATE改动。实现提交完成后，工作区已核验干净。

此身份段仅由后续 docs-only 提交补充；最终产品及测试树与核心实现提交相同。全部交付字节/原始测试/源码输入/锁清单/历史保护见本轮证据目录，最终HEAD是核心实现的docs-only后继。

---

# 原施工与阻塞记录（原文保留）

# N28C 本地施工与阻塞记录（未正式交付）

日期：2026-10-02，Asia/Shanghai。状态：**BLOCKED_NOT_DELIVERED**。本文件不是最终工程验收通过声明，也不是安装包交付确认。Codex 保留本卡实现、测试与证据，没有转交 DeepSeek，没有开始第四期，没有恢复 N27。

## 0. 2026-10-02 死锁隔离更新（仍未修复／未交付）

**根因已从疑似提升为确认：既有 N28B 产品锁顺序反转。** 纯 `anchor/n28b-d02d7cc` 与完整未提交 N28C 输入分别独立编译；同一受控 stop/schedule 输入两边各 2/2 复现，MXBean 与 jcmd 都捕获 1 个死锁。原有 `N28BProductionTest.actualPolicyColdWarmAndUiMatrix` 本轮各一次 PASS，不作为排除并发缺陷或恢复交付依据。

本轮按任务卡的既有基线／未闭合停止分支保存根因、锁图与独立修复方案，没有产品修复提交。详见 `docs/N28C-DEADLOCK-ROOT-CAUSE.md`（包括全部21个同步区B/C行号、真实编译class对照、回流清单）。已有用户授权不缺失；后续是 Codex 独立调度基础修复，不由用户技术排查，也不伪称 C 几何修正。回退纯 B 不能消除此环。

只读快照保留1,893个原文件内容/SHA与完整二进制diff，位于 `.verification/n28c-deadlock/snapshot-2026-10-02T04-39-36-427Z/`。原源码/测试/旧证据逐一SHA一致，62/62历史产物字节/SHA保持；原 `test-worker-observation.txt`、`baseline-lock-scope-check.json` 未覆盖。新纯B/C完整栈分别在 `.verification/n28c-deadlock/n28b-probe-confirm/` 与 `n28c-probe-confirm/`。

**最终579、修复后并发回归、正式三件套/84/最终DEX/branch/aapt/apksigner均未完成；没有安装、签名、发布、真机或第四期。** 下方原有专项/黄金/14目标结果仍为历史阶段证据，不能包装成最终通过。HEAD仍26692ed，未新增源码提交或C锚点，原未提交C代码完整保留，工作区不干净。

## 1. 实际开工基线与不变项

- 实际开工 HEAD：`26692ed03344cadda443bca584e2c91c7eb54206`（短 `26692ed`），用户在本次对话明确确认。
- 产品基线仍等价于 `8e28f4b`；两者仅 docs 差异，保留 `docs/N28C-CODEX-TASK.md`，没有回退或删除。
- N28B 源码／锚点保持 `d02d7ccefbd3847d7c1df3b0306e22a3a14429f0` / `anchor/n28b-d02d7cc`。
- 按用户最新补充，两份 PROJECT-STATE **均不修改**，SHA-256 保持 `8096FE01947D04F333735324983D11E6FF782C696CA176BB2B4ACB2D1147DCE4`。
- N28B 三件套与全部 62 个既有历史产物保持原字节／hash。开工记录 `build/n28c-records/start.json`；历史清单 `history-before.json`，阻塞检查 `history-checkpoint.json`。
- 工作区当前保留本卡未提交改动；未创建实现提交或 N28C 锚点。禁止把当前 HEAD 或首轮候选当作最终 N28C 源码／交付。

## 2. 本卡实现范围（尚未完成最终交付验证）

既有产品文件修改 8 个：CaptionLanguageContext、CaptionOverlayV2、CaptionUnicode、RebuildCache、RebuildController、RebuildPageLayout、RebuildReview、SubtitleStylePreview。新增 CaptionRenderSpec、CaptionLanguagePager。新增三个 N28C 测试类、六个交付检查工具。65 个原有 Java 测试文件字节不变，旧断言没有放宽。

冻结：RebuildSource、NativeCaptionBridge、TargetLanguage、CaptionLanguageProfile 参数、请求／prompt／鉴权／供应商／预算／并发／预取／storm／重试实现、菜单／patch 字节码源码、N19 字号与 FontMetrics 比例、用户配置、UI 资源、build/dependencies、ACCEPTANCE 与 frozen baseline。

Controller 的变化仅是交付目标 RenderSpec 给现有呈现入口、提供只读 preview context、在非中文呈现中停用中文短句跨事件合并与旧迟到可读性门槛、把旧码点警告留在中文 legacy；没有修改锁顺序或调度。

冻结证明采用确认的 Git `26692ed` 产品 blob；并发生成的 filesystem manifest 只用来检查批准写集以外的文件，不能把它误作已改文件的开工内容。证明见 `frozen-blobs.json`。

## 3. profile / counter / pager 参数

| 目标 | 方向 | 非中文软 CPS / CPL |
|---|---|---|
| zh-Hans / zh-Hant（所有 zh family 保留 legacy） | 保留 N26 TextView 默认行为 | 实际旧 8 CPS、12–18 偏好／评分、旧最小页与分配；不启用新软参数 |
| ja | LTR | 4 / 13 |
| ko | LTR | 12 / 16 |
| en | LTR | 20 / 42 |
| es / fr / de / pt / ru / vi / id | LTR | 17 / 42 |
| ar | RTL | 20 / 42 |
| hi | LTR | 22 / 42 |
| 其他目标 | FIRST_STRONG | generic 17 / 42 |

N28A 档案的中文 referenceCps=9 字段仍冻结，**没有取代 N26 实际 8 CPS 路径**。完整 target code／地区／脚本用于 RenderSpec.locale；profile 从 N28B context 取得，不从 UI locale 或文本脚本猜语言。pt-PT / pt-BR 都使用 pt profile，但完整 locale、scope、cache 独立。

非中文 reading 为可见完整扩展字素，控制／格式／单独组合 mark 不增加 reading；空格／NBSP 沿 N28A 定义计数。CPL 使用独立半单位算法，韩语 Latin／空格／标点的 0.5 权重只用于 CPL，不进入 CPS 或分页时间权重。字符串不 NFKC、不倒序、不插方向标记。

平台 Android ICU character 边界给出 UTF-16 安全切口；line 边界取 character 边界交集。沿用 N28A Devanagari virama/nukta/ZWJ 安全过滤，不把 ZWNJ 当作连接。优先 locale 合法断行及其标点候选；locale 候选几何无解才使用完整字素应急切口，页面切口不拆 NBSP glue／CRLF。

非中文枚举候选：每页基础评分 200，两行额外 1800，合法标点 seam 优惠 80，CPL 超额平方及超过 7000ms 的软评分；它们只能影响偏好，不能单独拒绝正文。最多两行、完整字素、实际宽度与 accepted event 窗为硬约束。分页在同一 event 内按可见 reading 权重分配，页长只需正整数毫秒；不应用中文 1200ms／最小格／全局 8 CPS。页面连接完整还原 accepted text，没有重复／借邻窗。硬几何或 malformed Unicode 无解走既有安全空白。

实际测试后端：SDK28 ICU **60.2 / Unicode 10.0**；SDK35 ICU **75.1 / Unicode 15.1**。计数版本仍 `n28a-counters-v1`，安全边界版本仍 `android-icu+devanagari-virama-v1`。SDK28 不是最新 Unicode 实现；不能据本测试承诺所有未来字符、OEM 字体／ICU 或设备表现。原固定 26 项 Unicode contract 在 SDK28/35 保留；native 页面测试覆盖其可见内容及单独 malformed/orphan 安全空白。

## 4. 真实 geometry / RTL / cache / diagnostics

RenderSpec 是 immutable context 的 final 字段，经实际 Controller.showEvent 进入 CaptionOverlay.LayoutBudget、StaticLayout.Builder、TextView、compact 和 preview 测量。非中文显式 text locale 与 LTR／RTL／FIRSTSTRONG_LTR heuristic；同一 spec 验证完整布局末尾、每个内部分行的字素边界、getLineMax 宽度及两行限制。TextView 完成真实测量后再次核对，不能用 maxLines 截掉尾部伪装成功。

中文不主动重置默认 font locale；从非中文返回时仅恢复此前的 legacy font defaults／方向，不留 RTL 残留。五档、标准默认、55.5/44.5 全屏比例、位置、透明度与拖动基准没有改。没有控件避让／动画／新 N27 生命周期。

测试 manifest 不含 supportsRtl，最初方向断言失败。原 YouTube 输入的 aapt2 manifest 已核实 minSdk=28 / targetSdk=36 / supportsRtl=true；新测试仅设置等价 ApplicationInfo flag，不修改产品 manifest／资源。还修正了新测试自己的 metrics-reset、导出时间戳比较、paused displayPosition 与 source-video fixture 假设，未修改旧断言。

N28B request/prompt/display_hint 字节冻结，包括其旧 legacy_n26 观察文案；实际呈现与 cache 的 policy 独立为 `n28c-presentation-v1`，不能把旧请求文案或 B 测试的历史 trace 注释当作 C 呈现证据。非中文 cache key 附加新 presentation policy，中文旧空间不加；读取与呈现按相同 context/spec 重验，不清 UI locale cache、不动旧文件。

新诊断 `REBUILD_PRESENTATION`、`REBUILD_PRESENTATION_WATCH`、`REBUILD_PRESENTATION_HARD_REJECT` 按变化去重；至少包含 target_code/profile_id/direction/reading_units/line_units/max_lines/actual_width_px/line_count/soft_reading_target/soft_cpl_target/presentation_policy。soft watch 标注 advisory_only=true / repair_candidate=false；不加入准确率，不触发付费 repair。原文／译文／provider 原始证据不改写，没有密钥或签名 URL。

## 5. 已完成的验证与准确边界

| 项目 | 真实结果 |
|---|---|
| 首轮完整 Java + buildAndroid（最终 locale 保护之前） | 578/578：538 原有＋40 新增；零 failure/error/skipped。日志 full-test-build-first.log，首轮 MPP/MPE 保留。**不是最终代码的全量声明** |
| 最终代码 scoped Java | **44/44：41 个 N28C 新测试＋3 个原有中文生产测试**；零 failure/error/skipped，5 suites。日志 scoped-final-render-and-golden.log |
| 最终完整 Java 目标 | 538＋41＝579；复跑在 B 冻结锁路径死锁，**未完成**。不能用 scoped pass 替代 |
| 中文生产 golden | legacy-activate 与 18 组 en/en-US/en-GB × Hans/Hant/地区／别名所有字段，与已交付 N28B JSON 相等；包含 request/prompt/key/tokens/blocks/events/pages/time/font/warm cache |
| 14 目标 cold/hot | 实际 activate → HTTP fixture → Job → parse → review → cache → Overlay → TextView，28 行；非中文换 UI 为 ar 后 key/pages 不变 |
| 必要 source/target / 地区 | fr→ar、en→en、zh→en、ja→fr、de→ar、hi→en、vi→fr、ko→en、pt-PT/pt-BR；另有 source/target/duplicate→UNKNOWN、签名复用、旧 Job 迟到、cache 重测与 video/pause/seek/rotate 新测试 |
| 字体／几何 | 40 组合：详情／全屏 × 五档 × density 1/3 × fontScale .85/1.4；实际 TextView 每页 ≤2 行、完整 text；compact/preview 同 spec |
| Unicode | NFC/NFD、越语 multi-mark、Arabic marks、Devanagari virama/nukta/ZWJ/ZWNJ、Jamo、emoji ZWJ/flag/modifier、surrogate、NBSP、CRLF；logical text 重建及安全切口 |
| Python | 27/27 |
| localization | 220 keys × 14 resources，原文件字节不变 |
| 冻结 scoreboard | 4通过 / 4既有失败 / 4未验证，pending_translation/event_review/overflow 均 0，文件 hash 不变 |
| 历史／状态／B 锚点 | 62/62 历史产物、两份状态、N28B 锚点与三件套不变 |
| 84 组合、最终 DEX/branch/aapt/apksigner | **未执行**：受正式验证门槛阻塞。工具已准备，不能把旧 B 结果冒充 C |
| 手机／14 语言语义 | 未验证；没有实际 YouTube 启动／安装或母语语义审校 |

4 张 native-ar/ja/de/hi PNG 已由 Codex目检，Arabic + J-20 / 12 / ١٢、Hindi १२、组合符和两行长词未见本 fixture 截断。这些是 SDK28 Robolectric native TextView fixture，不是真机 YouTube 截图或语义验收。

## 6. 首次阻塞记录：冻结 Controller 锁顺序（历史，后续结论见§0）

2026-10-02 **11:49:37 +08:00** 采集的 `test-worker-observation.txt`，JVM 明确报告 **Found 1 deadlock**。触发于 N28BProductionTest.actualPolicyColdWarmAndUiMatrix 的 stop：

1. SDK28 Main Thread：`stop()` 持有 RebuildController.class → `cancel()` / `retire()` 等待 Session monitor。
2. CaptionPriorityIO：`schedule()` 持有同一 Session monitor → `current()` 等待 RebuildController.class。

`cancel/retire`、`current/stop`、`schedule` 三段与 d02d7cc **逐字节相同**，SHA 对照见 baseline-lock-scope-check.json。当前 C 复跑确实触发；**未在纯 N28B 运行独立复现**，没有把先前 B 的 538 pass 说成能排除这一并发窗口。

只终止经 CIM command line 确认的本次 Gradle Test Executor 进程 **34200**，没有杀其他 Java／Gradle daemon／用户程序。完整失败日志保留为 full-test-build-final.log，worker 身份保留 stopped-test-worker.json。没有以修改 frozen 调度、禁测、加睡眠、重跑绿来宣布解决。

以上为首次11:49阻塞时的历史事实。本轮用户已通过 N28C-DEADLOCK-ISOLATION-TASK 授权专项核实/修复范围；纯B运行现已确认既有死锁，详见§0及根因报告。修复尚未实施，不在C几何修改中悄悄掩盖B问题，不启动第四期、不回退当前或B。

## 7. 产物状态、hash 与未完成工作

以下正式三件套 **尚未创建**，SHA-256 不适用：

- build/local-test/patches-1.3.5-本地测试包-n28c.mpp
- build/local-test/extension-1.3.5-本地测试包-n28c.mpe
- build/n28c-composition-final/YouTube-21.16.256-本地测试包-n28c-unsigned.apk

仅保留第一次通过 buildAndroid 的研究候选，位于 build/n28c-records/candidates；它们**早于最终 font-locale 保护及复核，不能作为当前源码交付／安装**：

| 候选文件 | 字节 | SHA-256 |
|---|---:|---|
| `first-pass-before-font-locale-review.mpp` | 1117156 | `DBA189C4268F53A8FD15F813289EA96730A926C47907E761EA6C1A46574D5661` |
| `first-pass-before-font-locale-review.mpe` | 2740288 | `EB8508B735C3AE75AFB8FFA01AA317138AF9470A5C98F0740148494941F9F3C1` |

输入仍为已有 YouTube 21.16.256、官方 1.44.0、Patcher 1.14.1、既有 JDK21/SDK36.0.0。原 host supportsRtl 核验仅是输入 manifest 检查；最终 composition 输入锁定、输出 hash、DEX 动态类数/差异、branch/API binding、unsigned apksigner 证明仍待执行。未签名、未推送、未发布；无模型／依赖／SDK下载、无远程翻译 API。N27 最终 DEX 0 类/事件/回调尚未审计，不伪造结果。

阻塞解除后必须重新做最终 579 全量与 buildAndroid，冻结/历史/中文 golden → 锁定 C MPP/MPE → 84 实际组合 → 正式 unsigned APK → DEX/branch/资源/aapt/apksigner/历史 hash → 一次实现提交与实际短哈希锚点 → docs-only 写实（如需要）。当前不能跳过以上门槛。

## 8. 真机清单（全部未开始）

仅在正式候选交付之后由用户按既有流程安装观察，不使用上面的首轮研究候选。用户不承担母语语义审校：

- [ ] 启动／主页／设置／中文目标；pause/seek/换视频/rotate 无闪退或明显回退。
- [ ] N26 中文对照：分页、字号、位置、时间归属不变。
- [ ] 少量 ar（RTL+Latin/数字）、ja/ko（宽度）、de/fr（长词）：截断、>2行、孤立 mark、方向/混排、消失/跨窗。
- [ ] UI/target 切换、换视频回看同段，冷/热 cache 不串字幕。
- [ ] 完整诊断与版本／设备／Android／target／UI locale／时间段；异常原样回传，不现场改代码、清数据或随机重复。

停止点为冻结调度阻塞，不是工程或真机验收完成。VISIONOS 关闭、N27 搁置、最终 summary/UI 多语种/技术英文问题仍留统一审计。
