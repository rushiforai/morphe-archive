# N34 本地测试交付

日期：2026-10-04（Asia/Shanghai）。N34 已完成单执行者实现、验证、独立建包、SDK35 实际 DEX/资源宿主验证和本地交付；未写入物理手机、未签名发布、未调用远程翻译 API。

## 结论与边界

本轮修复的是已接纳译文的呈现与可信源输入接缝，不是“所有情况下零空白”保证。已保留真实物理容量不足、非法 Unicode、结构/语义拒绝、源无 owned 时间、翻译 pending/failure、owner 无效、播放器隐藏/PIP 等合法空白。

- 中文读速/样式阈值不再单独清空完整两行译文；旧合法分页优先保留，全文能在首选字号和实际宽度放下时使用原 owned 窗单页，只有真实几何/页时间/Unicode 容量不足才拒绝。
- lead 不再为了未来合并先隐藏；独立当前事件是 primary，merge 仅为当前时间、邻接、完整单页和实际几何均满足时的可选候选；候选失败退回 primary。
- 所有有 owned 窗的页查询严格使用 [start,end)，未到或到 end 立即隐藏；主线程应用/延后绘制在实际 TextView 可见前再次读取同 Session 最新 position/owner。
- 最终 TextView 完整文本、最多两行、无 ellipsis、真实宽度和 Unicode 边界均复核；紧凑宽度最多一次回退到已批准最大视频内宽，不缩字号、不借邻窗。
- display trace 分开记录 SELECTED、最终 REBUILD_PRESENTED/REBUILD_DISPLAY_RESULT、outside_owned_window、hard_textview_geometry、late_arrival_watch、merge_rejected_keep_primary 等原因；诊断 revision 为 n34-owned-display-v1。
- 源计时只做可信连续局部段采用；本轮人工源 1,224 words 中按 reference 采用 10 段、191 words，51 段跳过并保留原估计时刻。原 NATIVE 源不改、硬 gap/speaker boundary 不跨越、不全片 shift。191 words 是 supplied manual/auto JSON3 的离线结果，不是 N34 真机 runtime aligned 计数；原 093813 诊断的 17,840B reference 未导出正文，不能与用户提供的 106,667B auto JSON3 冒称同一 payload。
- WebVTT 只在输入适配层按结构解析 cue、实体、voice/style/ruby、inline timestamp 和可证明的 carry/snapshot；普通重复文字不全局去重，carry 证据不足时保留文字并 estimated。显式 [music] 等非语音 cue 也保留与 JSON3 一致的源归属，允许合法空译文，不因 VTT 格式误变成 source_empty/格式失败。

## 输入与源码身份

- 本地实现提交：`26edf555c8956e12a4b0448b72aef34597141409`；源码锚点：`anchor/n34-26edf55`。本报告身份补记为随后 docs-only 提交，main/test/tools 与实现锚点保持相等；不 amend、不推送、不发布。

- 开工源码 HEAD：`38a1ce447b3bd57e1e97d3fbe93e86f0baea6b5b`，为 N33 源锚点的 docs-only 后继；tracked 产品源码相对 N33 无并行差异。官方输入仍为 `patches-1.45.0.mpp`，SHA256 `DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93`。
- 原版 YouTube 输入 APK 为 184,012,881B / SHA256 `724D2BF15D31DAC98DB00D82914DB3876EDF66E62FE2845001F204209ECF4C00`，独立复核与已提交 N18r/N28A 历史身份相同；未使用手机已 patch APK。
- 原始诊断、人工 JSON3/VTT、旧交付和 N33/N34 规划证据按原路径保存；N34 独立证据目录为 `E:/Projects/morphe-caption-v2/.verification/n34`。权威历史身份清单包含 281,140 个文件条目，最终重核 changed=0；未删除旧失败候选或 N33/N32 证据。
- 人工 manual JSON3/VTT 仍为 23,150B / 12,061B，169 cues；两格式规范化文字/start/end 相等，普通 VTT 没有逐词 timestamp，不被伪升级为 NATIVE。

源时刻/precision 合法变化会自然改变原 RebuildCache.identity；测试证明新 identity 冷 miss/写入后热 hit，旧 identity 文件未删除或改写。缺 reference 或没有安全段时仍保持原源字段/identity。本轮没有强读旧时间缓存，也不宣称源改善的首次冷请求没有成本；source_gap 只表示轨中无 owned 词/窗，不等于实测音频静默。

## 独立三件套

| 本地文件 | bytes | SHA256 |
| --- | ---: | --- |
| [patches-1.3.5-本地测试包-n34.mpp](E:/Projects/morphe-caption-v2/build/local-test/patches-1.3.5-本地测试包-n34.mpp) | 1,254,604 | `EFBB62E81FA430365FD1B1F1856F915439DAD475CB56884509B4DC224A0C7195` |
| [extension-1.3.5-本地测试包-n34.mpe](E:/Projects/morphe-caption-v2/build/local-test/extension-1.3.5-本地测试包-n34.mpe) | 3,066,504 | `84743177DAAEC8DEF9D539A6E2655D7BDE92A2FABA4885FDEEE5194D23FD3FF1` |
| [YouTube-21.16.256-本地测试包-n34-unsigned.apk](E:/Projects/morphe-caption-v2/build/n34-composition-final/YouTube-21.16.256-本地测试包-n34-unsigned.apk) | 198,231,898 | `859D5D74F52E3AFDB9A72973E01A038A7DBE7D142A3DC743867EABD188390FF7` |

MPP 内嵌 MPE 与独立 MPE 字节一致；公开 root 仍只有 AI caption translator / Remember caption selection；产品版本 1.3.5、官方组合 1.45.0、兼容声明仍限 YouTube 21.16.256/minSdk28。正式 APK 是 unsigned；`apksigner verify` 按预期以缺少 `META-INF/MANIFEST.MF` 拒绝验签。SDK35 测试副本使用独立 N34 本地 key，不替换正式包 bytes。

## 回归与回放结果

- Gradle 全量：**704/704**，failures/errors/skipped = 0；其中含 N34 原生显示/源格式/响应回放和既有 676 项基线。
- Python scoreboard：**27/27**；发行合同：**11/11**。
- 真实质量响应回放：本轮 50 条为 49 accepted、1 条 source_quote_mismatch 正确 reject；5 个纯 layout-only 请求不再因排版告警触发付费语义修复；额外独立 RebuildApi loopback 探针实际发出 82 次本地请求、81 accepted/1 correctly rejected、remote_calls=0。旧样本与当前样本保留分开，不把 HTTP 2xx 当作呈现成功。
- N34 原生 SDK28/35 显示矩阵覆盖 14 target × 12 owned windows × 2 widths × 2 font tiers；当前 7 条原 renderInput 与旧 18 fallback/14 deferred lead 的字形容量对照共 78 行（简/繁各 39 行），完整两行可容纳的行均实际 TextView visible，exclusive end 均隐藏。原 79.905s 合并 union 行是几何容量重放，不是许可提前完整 merge；按原 82.402s 选择位点回放时，剩余 867ms 不满足候选准入，实际显示当前独立“大家现在看看。”，不叠加 union 时长。
- 真实 SDK35 final DEX/resources 宿主固定使用 **emulator-5554**，`owned` 场景 PASS；截图显示中文当前 owned caption 实际可见，过期/未来/排队旧 position 均不恢复。`actions` 场景也 PASS，N33 设置/多选/save/cancel/Back/API/model/save/profile/诊断路径保持通过。该宿主使用合成 player surface，不冒称真实 YouTube 网络视频、音频同步或物理手机 after。
- 源双格式/缓存身份：manual JSON3/VTT 169 cues、1,224 words、planner/request/cache identity 对照通过；同句不同 cue 窗保留。自动 VTT 结构回放记录 1,412 words、167 carry 行、167 display-only snapshots、10 carry_unproven，不以词数等同 JSON3。
- 对齐证据：1,131 unique anchors、1,122 native candidates、10 adopted segments、191 aligned words；冲突/硬 gap 段跳过，source text/id/order 完整保持。
- 性能计数在同一 SDK28、同一字体/几何、同一 80 次 position callback 下保存于 `.verification/n34/performance-before-01` 与 `.verification/n34/performance-final-03`：before plan=3/layout=42，after plan=1/layout=15；position callback median 3us→3us，p95 19us→30us；首次冷布局 216,055us→409,030us。p95/首次冷布局变慢不被掩盖或解释成稳定收益；本轮只确认重复 plan/layout 次数下降和结果等价，额外完整性/ICU/trace 的冷成本如实保留，未设置未经基准的宽松性能承诺。

## 组合、DEX 与范围审计

- AI-only、Remember-only、AI+Remember 三组合均 PASS；obsolete root 按名称拒绝。实际选定组合记录 92 PASS，N33 同官方 1.45.0 完整组合也是 92，N30 历史对照为 93；没有硬套旧 84/92 分母。
- 最终 APK 11 DEX、58,267 classes；MPP 1,525 DEX classes；MPE 1,478 classes。APK/MPP/MPE branch audit 均 invalid_branches=0、dex_problems=0、binding_failures=0。
- 官方方法反读 39 项与 N33 官方基线相等；extension 无官方类替换、无验证 host/fixture 泄漏。公开 roots、资源、metadata、ZIP/DEX 检查和 N34 scope audit 通过。
- 冻结 `ACCEPTANCE.md`、`scoreboard/`、N33/N32 交付和原输入 bytes/SHA 未变；原失败 probe 保留。旧断言只改了明确代表 N34 修复范围的 CPS/defer/late/layout/strict-window 预期，没有放宽 semantic/quote/number/source ownership 安全网。

## 最终压力观察与旧断言依据

额外压力探针保留首次英文 1,979 字符/9000ms 样本耗时约 6.3s 的记录，未以宽松阈值忽略。仅增加同事件/同 spec/几何下完整相同 part 的结果等价测量 memo，并不为硬拒绝的几何计算未使用的软计数；168 个脚本/宽度/时窗对照 text/start/end 完全相等。随后同长样本约 172ms、中文 700 字符约 241ms，均仍因真实容量不足空白，不截尾、不缩字、不借时间。clock-only 更新的已判定硬空白保持当前 plan/原因；13 次 80ms position 更新无额外 plan/layout。以上是本机原生测试观测，不是 OEM/手机延迟保证。

每个旧测试文件的确切 diff 与授权依据另存 `.verification/n34/old-assertion-changes.json`。原 NATIVE 源禁止 retime 的旧错误 fixture 已补原值不变断言，并用 ESTIMATED 主源保留原成功对齐断言；不是把坏时间或 source coverage 放宽。

首次 branch auditor 在默认模式要求旧 N27 controls-callback 必须存在，因此产生误报；最终以与 N33 完全相同的 require-ai=false 审计撤回的旧观察器，实际 AIInstalled/现行 callback/fingerprint/原生绑定由三个 CompositionDexAudit 继续强校验，不为通过恢复 N27 hook。

## 证据入口

- 全量结果：`.verification/n34/full-final-06/result.json`
- N34 source/display tests：`.verification/n34/full-final-06/`
- SDK35 final DEX/WMS：`.verification/n34/android/owned-final-04/`、`.verification/n34/android/actions-final-02/`
- 最终三件套反读：`.verification/n34/artifacts-final-03/`、`.verification/n34/final-serialized-checks-03.json`
- DEX branch audit：`.verification/n34/final-03-apk-branch-audit.txt`、`.verification/n34/final-03-mpp-branch-audit.txt`、`.verification/n34/final-03-mpe-branch-audit.txt`
- 源局部对齐/格式覆盖：`.verification/n34/full-final-06/supplied-local-alignment-sdk28.json`、`.verification/n34/full-final-06/auto-vtt-structured-coverage-sdk28.json`
- 历史与冻结审计：`.verification/n34/baseline/`、`.verification/n34/scope-audit.json`

最终 source main/test/resource 210 文件清单在 `.verification/n34/full-final-06/inputs.json`，SHA256 `904c8368030aaf86b148c349830ca289125c3048c83c5e03527b93d815c21c38`，结束后逐文件复核。额外 loopback/非语音/clock硬拒绝/memo 等价 probes 6/6，性能计数独立 probe 1/1；不并入 704 的全量分母。

SDK35 实际应用 visible/empty 记录独立存 `.verification/n34/actual-ui-applied-visibility-observations.json`；按同 identity 的 applied wall/uptime/media position 观察而不是 SELECTED 差值。合成媒体窗跳转和截图时刻不得等同每页实际物理观看 1.2 秒或真实视频总漏显时长；pause/buffering 倍速测试区分媒体位点与 fixture wall，不将重叠 union 时长相加。

## 用户短复验

交付后只需在同视频复验：中文 25s、71–83s、168–170s、251–255s，以及旧 119–122s lead；日语同片段加一次 pause/seek/fullscreen 返回；保存完整诊断。源听感早/晚仍以真实音频和画面判断，本地源计时证据不能替代用户听感。
