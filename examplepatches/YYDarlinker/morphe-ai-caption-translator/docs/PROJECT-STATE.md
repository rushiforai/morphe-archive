# PROJECT-STATE — 1.4.0 正式发布完成（N37R2＋历史菜单接缝适配）

> README勘误（2026-10-05）：按用户确认将实际设置入口改为YouTube→Settings→Morphe→Video→AI caption translation；中文同步增加「视频」层级。仅文档更新，1.4.0标签/产物不变，不触发新版本。

> 最新状态（2026-10-05）：用户已授权直接发布。v1.4.0正式发布成功，tag/自动版本提交17c41ae；Release工作流37307657885全通过，匿名Manager源链/MPP哈希复验通过。正式MPP1,291,654B，SHA256 6A95B2A4…81F9D。推荐官方1.45.0＋YouTube21.16.256，稳定历史目标21.13.164、21.07.247（官方范围自1.42.0起，须匹配组合）。英文/中文README、当前架构/兼容/贡献/发布/Issue、About/topics已整理。完整CI750通过，本地定向77、Python27/发行11、本地化241×14；旧1.42/21.07结构与DEX审计、推荐1.4候选组合/11DEX/branch审计通过。发布rootDEX/MPE与验证候选字节相同，仅文本换行/manifest时间戳不同。字幕Java生产源码仍与N37R2一致。详docs/RELEASE-1.4.0.md。手机居中after/全部OEM和语义未新增证据；21.13未在本轮独立组合。社区申请与介绍仅备稿未外发；无APK发布/手机安装/清数据/翻译API调用。旧锚点/三包和备份保留。本任务结束，不自派后继开发。下方记录为历史。

> 1.4.0发布施工（2026-10-05）：用户已授权按方案直接发布，并将稳定目标扩为21.16.256（推荐）、21.13.164、21.07.247，官方历史兼容自1.42.0起、推荐1.45.0，具体交集见docs/COMPATIBILITY.md。已准备双语README、架构/发布/贡献/Issue说明及CI修正；产品运行时仍为N37R2，未更改字幕机制。当前正在验证当前源码和历史组合，尚未发布。发布前备份分支backup/pre-release-1.4.0-a54ad5a保留；工作在dev，社区申请/帖子仅备稿未外发。实体手机居中after没有新增证据。

> 发布规划（2026-10-05）：用户要求将N37R2作为1.4.0正式发布并先核查汇报方案。本轮完成官方模板/patcher架构/Manager补丁源/社区规则及现有仓库只读审阅，方案见 docs/RELEASE-1.4.0-PLAN.md。重点先修复按1.3.5版本误走旧recovered树的CI、重写用户README与中文指南、补齐Issue链接/活动架构、建立dev→main非squash流程，复用semantic-release自动生成并发布1.4.0；产品保留6ff1053基线。官网已链接社区索引，当前未收录本源；Awesome Morphe有明确Bundle Request渠道。未改产品/README/版本/CI，未推送、发布或对外投递；实体手机居中after未新增证据。

> 工作区维护（2026-10-05）：本项目 C 盘开发资料已校验迁入 E:\Projects\morphe-caption-v2；76,347 个文件、逻辑约 15.18 GiB，清单内 C 盘原文件剩余 0。产品仍为 N37R2（核心 6ff1053；原完成锚点 a6fcbbb 不变），本次仅文档/AGENTS 工作区规则更新，无产品修改或发布。后续全部项目写入使用 E 盘；E 盘未挂载时停止，不自动回退 C 盘。新的状态副本为 E:\Projects\morphe-caption-v2\.verification\state-mirror\PROJECT-STATE.md。路径映射、保留的共享工具/发现索引/空目录详见 docs/WORKSPACE-MIGRATION-20261005.md。

> 最新状态（2026-10-05T17:43:37+08:00）：N37R2 单执行者完成。核心 `6ff1053c74c2deaa10bf733f5328d3b6756abd49` / `anchor/n37r2-6ff1053`，完成锚点 `anchor/n37r2-final`。Java750/750（原N37的727身份全保留）；Python27/27、发行合同11/11；SDK35交付DEX实测86次、定位事件91条，最大中心误差0.5px；三包组合、DEX/分支/API28、资源、内嵌MPE和unsigned审计通过。实体手机未写，真实YouTube/OEM after待用户确认。没有README/版本/补丁源元数据修改、发布或推送。本卡完成即停，不自派后继卡；详`docs/N37R2-LOCAL-TEST-BUILD.md`、`docs/N37R2-SHA256.json`与最新§4bd。下方N37段落作为历史保留。

> 最后更新：2026-10-05T14:38:57+08:00（Asia/Shanghai）。N37实现与本地验证、最终三包整理完成；源码98ac1a16440f64d8b1e095d0f4496cae7cdcece9 / anchor/n37-98ac1a1，完成锚点anchor/n37-final。最终Java727/727、fail/error/skip0；Python27/27、发行11/11；241keys×14、原生IME/profile与12边界场景＋归档backlog已核对。N36历史与规划更新保留；实体手机未写，真实OEM after待用户3–5分钟短验。本卡停止，不自派N37r/N38。详docs/N37-LOCAL-TEST-BUILD.md及docs/N37-SHA256.json；最新§4bc覆盖旧待施工口径。
>
> **N36 身份**：开工 HEAD `7a53e461615232d85d55b9a9b75762b0a784c102`（N35 完成 HEAD `013cc93b266b339ad05dea11b1bd29177cbcbffe` 的 docs-only 后继，`git diff 1967dacf..HEAD -- . ':(exclude)docs'` 为空）；本卡产品提交见 `docs/N36-SHA256.json` 的 `source_commit` / `source_anchor`。
>
> **N36 交付三包**（本地测试名，hash 见 `docs/N36-SHA256.json`）：
> - MPP `A7F391CC0CC6EB14564C2B8ACAD685C3798AE6B5A2A4A54411E841E71AB5E558`（1,276,197 B）
> - MPE `A8EB1C8D034D9A6CC35F06CD93544BCE445E8E7C6728B66A05E46F76D8E6F1C2`（3,113,144 B）
> - unsigned APK `E13E864FB92044F75359518F81F2BD5856B9E699070BA3A82D00B27131492374`（198,253,159 B）
>
> **N36 做了什么**：①输入/IME：删除每帧 onPreDraw 轮询与无条件 reveal，一个 root 一个协调器、只有 focused editor 有处理权、IME 只走一套主申请流程、四个字段使用稳定 per-field id；真实 SDK35 加真实 IME service 上，N35 的"API key 字段无限重绑"（`notifyViewReadyInner` 55,266 次 / `ATTACH_NEW_INPUT` 11,077 次）降到 13 / 20 次，且 lane 正常跑完四个字段。②预览：测量 key 覆盖 locale/sample/tier/opacity/宽度/density/fontScale，普通重绑不再丢缓存，热 draw 不再分配 Path/Shader。③播放器许可：新增 `CaptionPlayerAuthority` 单一状态机（UNKNOWN/COMPACT/TRANSITIONING_TO_REGULAR/REGULAR/CLOSED），真实 player 类型不再被 render epoch 过滤，probe 每代一个且所有退出路径释放自己的槽，上限 12 帧后只等真实 player 子树 attach/layout。④转场：COMPACT/TRANSITIONING 期间 tick 不扫描不渲染，位置更新不再 setLayoutParams/bringToFront。⑤诊断：新增两条有界 lane 的 `CaptionDiagnosticsWriter`，播放/动画/预览路径不再 load config、不再 KeyStore 解密、不再写 SharedPreferences，redaction 在后台按凭据指纹进行。⑥请求：`NetworkDeadline` 增加 timer 触发事实，`SocketException` 不再把真实 deadline 报成普通网络错误，主动 stop/disconnect 的连接标记 intentional cancel。
>
> **N36 验证**：716 项 Java 全量（`.verification/n36/full-delivered-01`）中 `n24BlockedOldFocus` 在与其他测试类同 JVM 全量运行时失败（单独运行通过），其余全绿；A/B/C/D 分项 lane 全绿；正式组合与 DEX/MPE 审计通过（`tools/n36/final_checks.py`：11 DEX、MPP 内嵌同一 MPE、N34/N35 旧三包 hash 未变）。手机未连接，真实 IME 逐字符提交证据仍未取得，第四项最终以用户手机短验为准。
>
> **回退**：`docs/N36-RESTORE-N35.ps1`（回 N35 源）与 `docs/N35-RESTORE-N34.ps1`（回 N34 源）都生成可逆恢复提交；`anchor/n35-013cc93`、`anchor/n34-26edf55` 未动；`patches-1.45.0.mpp` 保留为未跟踪输入。
>


> 历史更新（已由2026-10-05最新状态覆盖）：2026-10-04（Asia/Shanghai）。N35已交付并完成用户after，当前产品1967dac/完成HEAD013cc93；本轮规划者审阅诊断215344与14.27秒滚动录像，确认五条通用机制before5/5：无IME强拉、preview重绑失缓存、旧owner隔离继承、恢复probe占槽、真实player通知被caption clear作废。另查主线程日志反复Keystore解密/动画重排；压力请求队列并非主要延迟，network与取消需分辨。N36详细卡/审阅/回退资料已准备，尚未产品施工；backup/pre-n36-n35-013cc93固定。N35/N34/官方三包SHA未变，恢复脚本仅InspectOnly。N35真实f40参照body本轮已取得并SHA验证，partial实际retime752词，保留时间成果。最新§4ba覆盖旧N35待执行口径；单执行者Codex推荐、DeepSeek允许，真实IME/滚动/转场先于一次最终全量，同输入不重复建包。
> **用户签字（2026-09-30，N20 显示策略）**：① 等待期（译文未就绪：启动、暂停后、拖动进度条后）字幕区显示 **“翻译中…”**；② 译文最终失败或被安全网拦截时字幕区**完全空白**；③ 不再向屏幕输出 `[原文 / Original]` 与技术文案，原因一律只进诊断；④ 授权按此修订 ACCEPTANCE.md 的 A01 与 A13 判据（其余判据与冻结证据不得改动）；⑤ 字号档位可视化：滑轨上加 **5 个刻度点**、轨道下方一排**档名（超小/小/标准/大/超大）**并与刻度对齐，当前档高亮；**档名行不标注 px 数值**；拖动吸附与松手保存不变。
> **字号设计核验（2026-09-30，审阅者用 PIL 直接量 66.jpg / 67.jpg 原图）**：B站横屏全屏单字墨迹高 median **57px**（30 字样本，直方图峰值 58px，阈值 190；档案早前另一阈值测得“经”55/“频”56），B站竖屏详情页 median **45px**（20 字样本，峰值 46px）；与设定值 55.5 / 44.5 相差 ≤1.5px（全屏 2.7%、详情页 1.1%），属单字取样与阈值差异。五档常量、默认档、全屏 ×1.247、预览比例、旧值迁移、诊断字段均已逐项核对，**未发现谬误**。三处需知细节（均为既有设计，非缺陷）：排版排不下时字号下限压到**超小档**（34/42.4px）；评论区收窄 >20% 时字高随视频矩形同步缩小（N19 未改）；旧 r 值迁移以 1264px 为参考屏宽换算，仅影响升级瞬间一次。各档设备值（1264×2736 屏）：详情页 34 / 39 / 44.5 / 50 / 56px，全屏 42.4 / 48.6 / 55.5 / 62.4 / 69.8px。
> **用户最终决策（N19，覆盖 N17c 的单一 r 方案）**：
> 1. 默认大小按 B站实测：竖屏详情页 glyph **44.5px**（屏宽 1264 的 **3.52%**）、横屏全屏 **55.5px**（屏宽 2736 的 **2.03%**）；B站缩放比 = **55.5/44.5 ≈ 1.247**，详情页→全屏一律按此比例缩放，禁止再按屏宽等比。
> 2. 滑块保留现有交互（实时联动、松手保存），但只能吸附五个档位：**超小 34 / 小 39 / 标准 44.5（默认）/ 大 50 / 超大 56**（详情页 glyph px，1264 屏宽基准）；全屏值 = 详情页值 × 1.247。Shorts 同详情页。
> 3. 设置界面显示的字号数值一律为详情页大小；每档说明文案精简为只含关键信息（如“标准：详情页 44.5px · 全屏 55.5px”），常识性解释删除。
> 4. 设置预览（N17d 单幅 16:9 横屏）必须按“全屏 glyph px ÷ 2736 × 预览图实际宽度”渲染字幕，与真机全屏效果一一对应；切档即时生效。
> 5. 底层实现继续用运行时 Paint/FontMetrics 实测反解 textSize，禁止假设 density/fontScale 系数；跨设备用 r 换算保持可移植。计算采用精确实测比 55.5/44.5，1.247 为近似值。
> 6. 零 API 调用、零新增依赖；14 语种 XML、catalog、source-keys、Java fallback 同步更新；不动冻结计分板与任何验收判据；旧的无极 r 设置值需有迁移逻辑（旧值映射到最近档）。
> **N19 审阅结论（2026-09-30，审阅者复核）**：实现与上述六条决策一致（`CaptionFontSize` 五档常量、默认档 2=44.5、全屏 ×55.5/44.5、预览按 `fullScreenRatio × 预览宽度`、旧 `caption_glyph_height_ratio_bps` 单向迁移后写 `caption_size_tier`、滑块 0–4 五档并显示“档名 + 详情页px + 全屏px”）。提交 `10e9c85` 单卡单提交、工作区干净；Java 394/394、Python 27/27；冻结计分板复跑维持 4通过/4失败/4未验证、三类不可见时长全 0；冻结结果与 ACCEPTANCE.md 无改动；亮/暗×标准/超大四张 fixture 已目检，预览随档位变化正确。
> **像素实测来源（2736×1264 原图单字窗口测量）**：B站横屏全屏 glyph 55.5px（66.jpg“经”55/“频”56）、竖屏详情页 glyph 44.5px（81.jpg）；插件旧竖屏详情页 glyph 68.5px（85.jpg）。N17c 的详情页 25.6px、全形态单一 r=2.03%、连续范围 1.5%–3.0% 已被 N19 覆盖。
> 用途：任何 AI 会话（Kimi 或 Codex）接续本项目时，先读本文件，无需翻阅长对话历史。
> 本文件是唯一的“记忆”，对话记录不是。仓库 `docs/PROJECT-STATE.md` 为权威副本，每卡开工时同步。

## 0. 上下文压缩后恢复须知（2026-10-05，N37收尾）

1. **当前阶段**：N37本地交付完成，源码 `98ac1a16440f64d8b1e095d0f4496cae7cdcece9`、`anchor/n37-98ac1a1`；完成锚点`anchor/n37-final`。先读最新§4bc、docs/N37-LOCAL-TEST-BUILD.md、docs/N37-SHA256.json；旧§4bb规划事实保留为历史，不再按N36待施工继续运行。
2. **角色与停止线**：Codex单执行者完成实现、验证、打包副本和本地提交；没有派新卡、远程API或实体手机写入。等待用户原卡3–5分钟after，不自行N37r/N38，不推送或发布。
3. **最新硬证据**：全量full-04为727/727，failure/error/skipped0；N36原716身份全保留＋11。Python27/27、发行11/11；241keys×14；actual composition、CRC/DEX/分支、原生IME与保存/profile回收、自然边界和archive backlog记录绑定最后代码。旧full失败与原断言保留，不拿candidate当最终。
4. **边界**：手机OEM现场未复现／未安装，不能宣称用户现场已修复闭环或全部帧无jank。自然矩阵仅共享机制验证。N27避让不恢复，ACCEPTANCE/frozen4/4/4与invisible口径不变。
5. **保护与回退**：原N36/N35/N34包、official1.45.0未跟踪输入、各锚点、规划docs/历史证据保留。N37-RESTORE-N36.ps1未执行，只有用户明确选择后方可恢复，先保存WIP/证据；源码恢复不代表手机换包。
6. **状态同步**：仓库docs/PROJECT-STATE.md为权威，与外部kimi档案一致；保留旧管理历史，不整文件回盖旧副本。唯一仓库E:/Projects/morphe-caption-v2，旧C盘worktree不施工。

## 1. 项目与路径

- 产品：Morphe字幕补丁（本地测试1.3.5），YouTube原生自动翻译选择→用户自配OpenAI兼容API→播放器字幕。当前已交付N33两公开root、十四语种设置闭环及N30业务，YouTube21.16.256/minSdk28＋官方1.45.0。下一卡N34通用呈现/源修复；旧已发布资产保持，官方版本号不等于产品号，N31/N32已撤回。
- 工作仓库：`E:\Projects\morphe-caption-v2`（从 GitHub main=v1.3.5 全新克隆）。
- 只读档案：`E:\Projects\morphe-ai-caption-translator-next`（旧研究区，39 提交/10 分支；ADR-006、P4d 失败报告在内；**禁止延续其任务序列，仅点名时查阅**）。
- 材料（均在仓库根目录）：`caption-diagnostics-1.3.5-20260927-084217.txt`（旧真机）、`caption-diagnostics-1.3.5-20260929-155802.txt`（0929 诊断）、英文源 SRT、`字幕参考.zip`；真机诊断输出目录 `D:\HONOR Share\Honor Share\`。
- API 环境变量（本机已配置，开发期可自由调用，成本可忽略）：`MORPHE_P4_API_KEY / MORPHE_P4_BASE_URL / MORPHE_P4_MODEL`（当前 qwen3.8-flash）。
- 测试环境：Gradle 用 **Zulu JDK 21**，路径注意嵌套：`D:\Program\zulu21.46.19-ca-jdk21.0.9-win_x64\zulu21.46.19-ca-jdk21.0.9-win_x64`（C 盘只有 JDK 25，与 Robolectric/ASM 不兼容，会环境性失败）；另需 `ANDROID_HOME=C:\Users\14776\AppData\Local\Android\Sdk`。计分板 `powershell -File scoreboard/run.ps1`（Python 走本机回退路径，WindowsApps 占位 python 不可用）。

## 2. 治理规则（不可违反）

本节施工限制约束执行者；规划者按用户授权进行资料研究、方案定案与管理文档维护，角色边界以§0为准。历史“新增案例”建议须先经用户授权，不自行修改ACCEPTANCE。

1. **任务卡制**：每张卡一个封闭任务，新会话执行，做完即停；汇报 ≤半页（改动文件、分数、建议不执行）。
2. **停止线**：新增依赖 / 任何下载（除卡内允许的 API）/ 改动超范围 / 单项超半天 / 想重设计架构 → 停下问用户。
3. **验收权在用户**：ACCEPTANCE.md 的判据只有用户能改；AI 提议修订须标“待用户确认”。自然度类最终由用户目检签字。
4. **禁止事项**：打包/运行时下载模型；新增运行时依赖；自我派生下一阶段；写研究文档/ADR；hard-coded 词表特判。
5. **计分板纪律**：冻结层（旧真机会话）保持历史原样；live 层单独存档带时间戳，永不混入冻结基线；token 必记账。
6. **提交纪律**：每卡结束提交、工作区干净；失败实验保留文档、回滚代码。
7. **真机规则**：真机发现新问题不现场改，记录时间位置+现象，回流为 ACCEPTANCE.md 新案例。
8. **状态档案同步**：每卡开工先比对仓库 `docs/PROJECT-STATE.md` 与外部 `C:\Users\14776\Documents\kimi\tasks\2026-09-29\00-35-52-ec1208d7\PROJECT-STATE.md`；无差异则跳过，有差异先读内容与最新反馈再同步，不按路径盲目覆盖。规划者管理更新须保留并按卡提交；审阅结束同步两处。交接包快照不自动覆盖实时文件。

## 3. 审阅与规划规程（当前角色修订）

1. 在实际E盘仓库分别执行只读Git状态、日志、锚点和差异检查，核对提交边界；保留正在执行的改动与管理档案改动。
2. 审阅执行者按卡产出的计分板/测试/组合/DEX及哈希证据；冻结须维持4通过/4既有失败/4未验证、三类不可见时长全0。未亲自运行的结果明确为执行者报告。
3. 必要时只读源码、diff、fixture与真实诊断；区分离线证据、实际运行证据和用户真机签字；不足以判定的项目不能写“完成”。
4. 报告本卡结论、整体进度与开放问题，将新反馈/决策同步两份档案。用户已经定案的选择不反复询问。
5. 研究与具体设计由本聊天规划者完成；后续由Codex完整执行细化卡、验证/建包/交付，用户已取消DeepSeek接力。禁止为翻绿放宽安全网、偷改冻结事实/验收判据或恢复被回退的样例特判。

## 4. 案例状态（A01–A17）

- 冻结计分板（旧会话）：通过 4 / 失败 4 / 未验证 4；三类不可见时长全 0。
- **A01 启动**：✅ 机制在（等待期有可读内容、译文同窗替换）。**判据已修订（用户 2026-09-30 签字，随 N20 落地）**：等待期不再显示源语言原文，改为显示“翻译中…”，译文仍只在同一归属窗内替换。
- **A02/A03/A05**：✅ 自然度用户已签（N7 live 新译；生效 prompt SHA `d841cf10…`）。
- **A04/A08**：✅ 结构 + N9 修复误杀（复数 `t-62s` 锚点）；真机复验待第三轮补测。
- **A06/A10**：🟡 N15r 新布局镜像 A06=3页/A10=4页；真机排版待第三轮补测。
- **A07**：✅（N2 解放 paragraph 误拦）。
- **A09**：📌 已知遗留（电报式源文，两轮引导无效，已止损回滚）。
- **A11/A12**：✅ 生成层（N6 本地显示合并）。真机待验。
- **A13**：✅ 机制（失败兜底：归属时间窗内的可读内容）。**判据已修订（用户 2026-09-30 签字，随 N20 落地）**：失败或被拦截时字幕区留空，不再显示 `[原文 / Original]`；原因只记录于诊断（`REBUILD_FALLBACK_BEGIN` 的 reason 等字段不变）。
- **A14**：📌 已签·已知遗留（双模型不可修复 + 复发变体绕过字面检测；检测到时原文兜底，漏检时接受偶发错译上屏）。
- **A15**：📌 已签（b109 块原文兜底为正确安全网行为；待补看 845s 后区段）。
- **A16**：📌 已签·已知遗留（比较极性反转，接受偶发上屏，依赖真机目检）。
- **A17**：📌 已签（登记为 A14 证据升级，不另立判据）。
- **孤字页**：N17a P1 已修（每页 ≥8 汉字格硬门槛）；第三轮补测复查。

## 4b. 第二轮真机结果（诊断 0929-230749，观看 631s，34/34 API 成功，80,429 tok）

**健康项**：启动源就绪 591ms；形态切换缩放正常；播放器过渡守卫工作；prompt SHA 无漂移；缓存 0 命中属预期（首轮冷缓存）。字号当时 23.18sp。
**问题（已回流立案）**：A16 比较极性反转（84.110–99.736s，ASR 把 than 误作 then）；A14 复发主语错接换壳（384.6–391.7s，措辞漂移绕过检测）；A17 孤字页×2（84.1s/125.6s）；`lines` 字段口径混乱（N17a 已修）。

## 4c. 第三轮真机首轮结果（诊断 `caption-diagnostics-1.3.5-20260930-140013.txt`，观看 233s，17/17 API 成功，37,663 tok，9,709 tok/观看分钟）

**包**：N18r 产物（YouTube 21.16.256 + 官方 1.44.0 + Patcher 1.14.1，84/84 PASS），**不含 N19 字号改动**。
**健康项**：prompt SHA `d841cf10…` 无漂移；字号标定机制工作正常（r=203bps 时详情页 25.66px/全屏 55.54px；r=300bps 时 37.92px/82.08px，两形态均命中目标，`glyph_height_px` 实测值与目标一致）；启动源就绪 786ms；形态切换与视频矩形识别正常。
**用户当场决策（已落地/待落地）**：
- 字号两难（详情页偏小、全屏偏大）→ 用户拍板 B站基准五档制 → **N19 已实现并审阅通过**。
- 暂停/拖动时反复出现“字幕过长，原文暂不可用”→ 用户要求字幕只显示译文、等待与报错只进诊断，并选择“等待期极简提示”方案 → **待落卡 N20**。
**问题（真机规则：只记录，回流立案）**：
- **待确认项（未真正执行）·缓存复看命中**：`Request-block disk cache: lookups 12 · hit blocks 0 · missed units 13`。该轮在 seek 回 0（232761→0）后即结束，未形成“同包复看同一段”的完整复看，判据不成立，**下轮须刻意复看**（先看一段 → 拖回已看区间 → 确认 hit > 0）。
- **overflow_status 文案（→ N20）**：`REBUILD_LAYOUT_FALLBACK mode=overflow_status` 时显示技术文案“字幕过长，原文暂不可用”，触发点集中在暂停、启动（`pending_engine`）与 seek（`late_unreadable`）。根因：原文兜底（英文整句）在大字号下排不进可用宽度，安全网从“显示原文”降级为“显示状态文案”。
- **大字号分页退化（观察，暂不立卡）**：r=300bps（全屏 82px）下出现碎片页，如事件 587-621 拆成 4 页、page2“例用于新装备和现代化，而”、page4“资、训练或维护现有系统。”，事件 687-721 出现 page3/5“在专门讨论了中国为何现”。N19 已将上限压到 56px/69.8px，第三轮补测时重点看大字档是否仍退化。

## 4d. 第三轮真机第二轮（诊断 `caption-diagnostics-1.3.5-20260930-222916.txt`，N22 包，观看 616s）

**健康项**：27/27 API 成功、0 失败、63,497 tok（**6,180 tok/观看分钟**，较上轮 9,709 明显下降）、输入缓存命中 49.5%；`size_tier=2`（标准档）全程生效，两形态 glyph 实测 44.0 / 55.0px（目标 44.5 / 55.5）；168 条 PRESENTED = 99 `caption_page` + 68 `caption` + 1 `status`；**`REBUILD_LAYOUT_FALLBACK` / `overflow_status` / `LATE_UNREADABLE` / 各类错误 / `CACHE_WRITE_FAILED` 全部为 0**；等待占位“翻译中…”出现 9 次（取代原文兜底），空白正文仅 1 条；无 <1.2s 短页；`REBUILD_FALLBACK_BEGIN` 仅 3 次且全为 pending 类；语义护栏 0 拦截。
**用户观察**：整体满意，仅提出一处版式小改（字号滑条与透明度滑条的长度/配色不一致 → 见 §6 小改卡）。
**审阅者发现**：
1. **长页偏多（建议后续处理，非阻塞）**：166 正文页中 **66 页 >4s**（占 40%），最长 **9.71s**，另有 8.02s / 8.46s 页；根因是长事件文本排得下 ≤2 行时不再按时间分页。Netflix 通用要求的单事件上限为 **7 秒**，我们已有多页越线；建议后续考虑“长事件按时间再分页”或设事件时长上限（属新版式议题，需用户确认）。
2. **孤字页已修复**：125.6s 处原 6 字碎片页现为整页“到2017年，部署在中国大陆的地对空导弹射程将覆盖台湾本身” ✓；本轮 9 条 3 字页全部是“翻译中…”占位，不是碎片页。
3. **A16 比较极性本轮未反转**：84.1s 段译为“……有些人对俄罗斯…印象深刻 / 胜过中国从无到有建立起航母舰队 / 在除美国外的所有国家之前部署第五代战斗机”，方向与原文一致（A16 仍为已签已知遗留，不作质量承诺）。
4. **缓存命中仍 0（26 lookups）**：与 N21 裁决一致（同 session 首次访问）；**仍需按 §6 第 4 项的新会话程序补测**。
5. **A15 未覆盖**：本轮观看 616s，未到 845s 区段。
6. 新增可见标记 `NATIVE_RENDERER_VIEW_NOT_FOUND`×4、`NATIVE_RENDERER_MASK_FALLBACK`×1；本轮无可见异常，暂记录观察。
7. 可读性告警 5 条（cps 4.36–6.03，均远低于 8）、质量告警 13 条全为 advisory，无需修复。
8. **译文准确性审阅（2026-09-30，审阅者用英文源 SRT 与 158 页逐段对齐核）**：总体准确，**实质性错误 2 处**（约 1.3%），其余为措辞生硬或可接受。**未复发的历史案例**：A02（"indexes"→"排名"）、A04（条件反问跨页重组后通顺）、A05（时间修饰已归位："甚至在入侵发生很久之前，我看到这些时真正想到的问题是：那中国呢？"）、A06（四类装备保留、2 页）、A11/A12（引导语不再独页、886ms 短页已消除）。**专名与数字抽检正确**：苏-57/歼-20/国民党/T-14"阿玛塔"、224 亿美元（22.4 billion）、2020/2035/21 世纪中叶。
   - **新发现 ①（实质漏译，327.0–331.2s）**：原文 "were either licensed or unlicensed copies or derivatives of soviet designs whether…" 的中文页仅作"无论是经授权还是未经授权，"，**丢掉中心词"苏联设计的仿制品或衍生型"**，与前后页拼起来语义不完整。建议登记为新案例（待用户签字）。
   - **新发现 ②（A14 复发第二轮，384.6–391.7s）**：原文 "foreign investment and the explosive economic growth that would follow **deng reduced** the share of gdp…"，中文页作"外资以及…经济爆发式增长，/ 降低了国内生产总值中用于解放军的份额"，**主语错接再次上屏且本轮语义护栏 0 拦截**。作为 A14 已知遗留的证据升级记录（与 A17 同类）。
   - **观察 ③（A16 相关，76.1–99.7s）**：比较方向本轮正确，但"印象深刻 / 胜过中国从无到有建立起航母舰队"被分页切断，"胜过…"单独成页为残句，属跨页硬断类问题（A08 同类）。
   - **轻微 ④（125.6–131.3s）**：原文过去时 "come 2017 … could range out over taiwan itself" 译作"…射程**将**覆盖台湾本身"，"将"读作未来；对应 N7 已签里"覆盖台湾本身"的措辞遗留观察。
   - **轻微 ⑤（468.7–470.9s）**：〔原字幕数字存疑〕前缀落在无数字的短页"相反，"上，提示位置不够精准（数字存疑判定为事件级，方向正确）。
   - **备注（设计后果，非缺陷）**：冷启动首个事件的头一页在"翻译中…"占位期内被跳过，其内容本轮未上屏（A01 选项 2 的固有代价）。
9. **两处问题的根因分析（2026-09-30，审阅者用 540 事件离线语料 + 源码定位）**：
   - **① 属采样方差，不是系统缺陷**：同一视频、同一 prompt SHA 的 N15r 全片语料里，**同一个源词范围 1043-1052** 的译文是"要么是授权或未经授权**仿制苏联设计的复制品或衍生型号**"（25 汉字，汉字/源词=2.50），而本轮同一范围只给了 11 汉字（1.10）并丢掉中心词 → 同一输入两次采样，一次完整一次漏译。**压缩比硬阈值不可行**：语料 540 事件比值中位 1.32，取 `ratio<1.10 且 words≥8` 会命中 105/540（**19.4% 误报**）。可行修法=扩展现有窄规则（`RebuildReview:67` 已存在 `licensed or unlicensed` 规则）：源含该短语而译侧未保留"仿制/复制/衍生/型号"类语义时报 `possible_omission`（repair=true）。
   - **② 属检测器条件过窄（wording drift bypass）**：`RebuildReview:45` 的 `possible_subject_attachment` 要求源匹配 `would follow <name> reduced` **且中文含"之后|之後"**；本轮译文用"**随之而来**"，条件不成立 → 未报警 → 无修复轮 → 错译上屏。语料里同一段被切成两个事件且主语归位（1219-1228"外资以及随之而来的经济爆发式增长" + 1229-1240"**邓小平降低了**国内生产总值中用于解放军的比例"）→ **模型能做对、修复轮有效**。最小修法=放宽或去掉中文侧条件（源侧模式本身已足够窄），命中后走既有修复轮；修不好则按已签 A14 策略**留空**，不再让错译上屏。
   - **验证方式**：两者都可在 540 事件语料上离线回放，报告新规则各命中多少条（预期 0–2 条，须给出实际数字），冻结计分板与验收判据不得变动。

## 4e. 频跳压力测试（诊断 0930-230120 luna / 0930-230442 qwen，用户主动每 1–2 秒跳转）

**场景**：用户以 luna（`openai/gpt-6-luna`）与 qwen3.8-flash 各跑一轮，相邻 seek 间隔中位 1.1s / 1.6s。
**问题一：频跳时等待偏长**（实测：luna 34 次 seek，seek→首个正文页等待中位 **4.41s**、p90 29.7s、**17/34 超过 3s**；qwen 13 次 seek，中位 **2.71s**、p90 13.5s、6/13 超 3s；占位页"翻译中…"分别出现 61 / 27 次）。三层根因：
1. **物理层**：一次块翻译＝一次模型往返，HTTP 中位 **5.6s / 5.5s**（luna 尾延迟 13–15s）。跳到未翻译位置必然要等一次往返，这是"块级翻译＋远程模型"的架构下限。
2. **调度层（可改）**：`RebuildController.IO` 是 `Executors.newCachedThreadPool`（**无并发上限**），seek 风暴下同时打出大量请求互相争抢——luna 一轮 34 seek 产生 50 请求／仅 39 响应，并出现 10 次失败（SocketException、output_truncated）与 13–15s 尾延迟；`REBUILD_HTTP_RESPONSE` 全部为 200，说明失败发生在传输/校验层而非 4xx。**当前块没有专属通道，预取与当前块同池竞争。**
3. **模型层**：luna 失败率约 20%、尾延迟更高；qwen3.8-flash 更稳（2/17 失败、尾 7.4s）。
   **缓存的实际作用**：luna 34 次 seek 中仅 1 次命中块缓存（`REBUILD_CACHE_RESTORED;block=16;network_calls=0`）——因为用户是向前探索而非回看；**回到已翻译区间会很快，向前探索一定慢**。
   **结论**：能显著改善（并发上限＋当前块优先通道＋风暴期暂停预取＋模型选择），但**不能消除**跳到未翻译处需等一次模型响应的下限（约 3–7s）。
**问题二：原生字幕空黑块（截图 90.jpg），AI 字幕同时不显示**。根因明确：插件靠"找到并隐藏 YouTube 原生字幕窗口 `SubtitleWindowView`"避免原生字幕出现，诊断里有两类失败标记——`NATIVE_RENDERER_VIEW_NOT_FOUND`（"TimedText is invisible, but no YouTube native caption window was found to hide in this player"，`CaptionMusicSuppressor:167`）与 `NATIVE_RENDERER_MASK_FALLBACK`（"Source track not ready within the short wait window; falling back to invisible ownership track"，`LoopbackCaptionServer:230-243`）。当"原生窗口未被隐藏"且"我们提供的轨/叠层此刻是空的（等待或按 N20 策略留空）"同时成立时，YouTube 就绘出**无文字的原生字幕底框** = 黑块。
**可修性**：问题二属工程健壮性缺陷，可直接修（无条件隐藏＋持续重试＋缓存视图引用＋扩大查找并补诊断）；问题一部分可修（调度层），物理下限不可消除，需在文案/预期上说清。

## 4f. N23 真机反馈与处置（2026-09-30 深夜，用户）

**用户反馈**：① 反应速度有提升，但仍有提升空间（D 段有效、未到位）；② 字号滑条**拉到最大/最小时两端刻度点不在轨道最左/最右端**；③ 预览应标注为**全屏**状态、并用**更长的示例句**；④ 滑条右上角不必再标数值（下方小字已有）；⑤ 标题去掉"（详情页）"；⑥ **翻译质量相关一律回退到 N22**。
**处置**：
- **B 段整体回退**（`RebuildReview` 两处：把 `possible_subject_attachment` 的中文侧条件 `之后|之後` 加回；删除 N23 新增的 `licensed or unlicensed → possible_omission` 整段），并同步回退 `RebuildN23ReviewTest` 中对应两条用例。**A14 回到已签基线**：检测到时留空，漏检时接受偶发错译上屏；320–331s 的漏译不再拦截。
- **A 段继续调整**：滑条可见轨道与 thumb 行程统一（两条滑条同一几何），使首/末刻度与轨道两端重合；删右上角数值；标题去括注（14 语种同步）；预览标注全屏 + 换长示例句，仍按全屏比例渲染。
- **C/D 保留**（原生空黑块修复、并发闸门与风暴期暂停预取）。
- **新锚点**：本卡产物 `-n24` + 标签 `anchor/n24-<短哈希>`。
**待用户确认（仍未决）**：327s 漏译与 384s A14 复发是否登记进 ACCEPTANCE（默认不登记，只留 §4d 观察记录）。

## 4g. N24 执行结果（2026-10-01 凌晨，用户卡：质量回退 N22 + 设置界面修正 + 保留 N23 工程改进 + 有界调度优化）

**A 翻译质量回退（用户明确决定撤销 N23 的 B 段）**：`RebuildReview.java` 用 `git checkout a482262 -- …` 还原，**相对 a482262 逐字节零差异**（blob 同为 `0a00c7049224b106293084600e6305b0ca613683`）。撤销两项：① `possible_subject_attachment` 恢复中文侧 `之后|之後` 条件（措辞漂移不再被救回，A14 回到已签基线：检测到留空、漏检时接受偶发错译上屏）；② 删除 N23 新增的 `licensed or unlicensed → possible_omission` 整段（327s 漏译不再拦截），仅保留 N22 的 `possible_authorization_expansion`。测试同步：撤销 2 条要求新行为成立的用例，新增 2 条反向回归用例证明回到 N22；540 事件回放台账保留，输出改到 `.verification/n24/review-hits.json`（`.verification/n23/` 历史结果未覆盖），实测两规则命中均为 0。**N23 的 C/D 工程改动全部保留**（`CaptionMusicSuppressor`、`LoopbackCaptionServer`、`RebuildController`、`DeepSeekSliderPreference` 及对应新增测试）。本回退**不代表** A09/A14/A16 已知遗留得到解决。

**B 字号滑条端点统一**：修前实测（420dp、density 1）平台轨道绘于 `[22,357]`（两端各内缩 6px，且内缩量与布局宽度无关），刻度却按 `[16,364]` 计算，thumb 行程又是第三套——三者互不相同，即用户所见「两端刻度不在轨道两端」。修法：新增 `DeepSeekSliderPreference.RailBar` 基类，两条滑条共用，自行绘制轨道/刻度并按同一公式落 thumb；可见轨道 = `[paddingLeft, width − paddingRight]`，刻度 = 端点 + 四等分，thumb 中心 = 同源插值。修后实测（亮/暗 × 超小/标准/超大）：两条轨道长度差 **0px**（均 362px，`[9,371]`）；首/末刻度 vs 轨道端点 **0.0px**；thumb 中心 vs 刻度 **0.0px**（5 档）；档名 vs 刻度 **0.5px**。等长、同边距、同取色来源，五档吸附/实时预览/松手保存/当前档高亮/档名对齐/RTL 全部保留；字号五档与 55.5/44.5 缩放、运行时字体测量、旧值迁移未改。

**C 文案与全屏预览**：`size` key 14 语种去掉「（详情页）」；**仅字号条**移除标题行右侧数值（透明度条保留实时百分比，新增回归用例锁死）；当前档说明继续显示详情页/全屏 px；`preview` key 14 语种改为「横屏全屏预览」语义。预览本就按全屏比例渲染（字幕在 2736px 参考系排版后整幅缩放一次），本卡补断言 `预览字高/预览宽 == 全屏字高/2736`。**示例句长度的硬限制**：预览宽 380px、字幕最大宽 ≈347px，标准档单字 advance 59px → 两行仅容约 11 字、超大档约 7 字；故示例句取「窄预览 + 五档全档位都不截断且为完整句」的 `字幕要自然。`，并由用例在 320/420/960 × 五档下断言不截断且行数 ≤2。这是预览画布尺寸限制，不是字号规则改动，未单独缩小预览字体。

**D 有界调度优化（本卡为执行段，设计由规划者给定）**：`MAX_FOCUS_CONCURRENCY=2`（`PRIORITY_IO` 1→2 路）、`MAX_PREFETCH_CONCURRENCY=2`、`MAX_TRANSLATION_CONCURRENCY=4`；前后台分池，后台结构上不占前台槽位；预算按**实际在途**统计（含旧位置在途请求）。新增 `Session.pendingFocus`：至多保留一个**已选中未派发**的最新前台请求，新 seek 直接替换旧待办，被替换者释放 `jobs[i]`、状态回 WAITING、**attempts/repairCount 零消耗**（尝试与修复改为在真正派发时 `markDispatched()` 记账）；一条在途 + 一条空闲时新落点立即使用空闲槽位。seek 仍不强行取消已发送请求。同块在途复用（`REBUILD_BLOCK_REUSED`，含后台转当前）、缓存恢复仍在网络派发之前。`allowAhead` 去掉「存在任何非当前块在途作业即禁止」条件，改由后台预算 + 30 秒范围 + 暂停/时钟条件决定，取消「每轮只起一个新作业」限制。供应商请求、超时、429/5xx 冷却、Retry-After、校验与修复上限**逐字未改**；本卡 0 次远程 API。诊断新增 `REBUILD_FOCUS_PENDING_HELD`/`_REPLACED`/`_PROMOTED`、`REBUILD_LANE_RELEASED`、`REBUILD_BLOCK_REUSED` 与 `focus_in_flight`/`prefetch_in_flight`/`pending_focus_block`/`dispatched`/`sent`；排队与网络、本地处理分列。**离线只证明调度与排队行为**（6 条新用例驱动生产 `schedule()`/`time()` 与真实 dispatch/translate 生命周期 + 本地 MockWebServer 门闸：旧前台阻塞时新落点用第二槽位、两条在途时只留最新待办且不耗重试额度、两路合格预取可并存且超 30 秒不派发、在途总数 ≤4/前台 ≤2/后台 ≤2、同块复用与缓存恢复与会话结束释放、旧结果不上新落点）；**不代表真实 API 延迟改善**。

**交付**：`build/local-test/patches-1.3.5-本地测试包-n24.mpp`（1,060,333 B，+3,714 相对 N23，`F7811B72…`）、`extension-1.3.5-本地测试包-n24.mpe`（2,698,036 B，+6,620，`A12CBA46…`）、`build/n24-composition-final/YouTube-21.16.256-本地测试包-n24-unsigned.apk`（196,800,948 B，+2,972，`59C0B243…`；未签名确认）。组合 **84/84 PASS**（既有 82/82 全在 + 官方新增 2/2）；`DEX_AUDIT_PASS classes=58028`；`verify_bundle` / `N8Verify`（72 条目 / 14 locales / CRC / root DEX）通过；12 个历史产物前后 SHA-256 全一致（N22/N23/N18r/v1.3.5 均未覆盖）。Java **429/429**（53 套件，0 失败/错误/跳过）、Python **27/27**、本地化 129 keys × 14 语种、冻结计分板 **4 通过 / 4 既有失败 / 4 未验证**且三类不可见时长全 0、冻结证据与 ACCEPTANCE.md 未改。
**真机仍待用户验证**：滑条两端刻度/thumb/档名、全屏预览比例、原生空黑块，以及缓存命中与未翻译区间各自的等待表现；并对比未缓存落点的 `slot_wait_ms` 与 `network_ms`、停止频跳后首条译文呈现时间、缓存恢复时间、请求数与 token 消耗。**离线不做任何延迟改善承诺。**

## 4h. N25 执行结果（2026-10-01，用户卡：设置排版修正与十四语种完整本地化）

**A 预览去重复标题**：`SubtitleStylePreview.onCreateView` 删掉可见的「横屏全屏预览」标题（非空串占位、未换重复标题），节标题「字幕样式」由外层 section 提供；画布 `contentDescription` 保留该本地化文案。现为「画布 + 说明行」两个子视图，上间距 6dp／说明 2dp。**顺带修一处真实缺陷**：`sampleLabel` 原以 `AT_MOST` 测量，`TextView` 会回答自己想要的完整宽度，长句因此被画到视频框外、尾部被裁；现按上限（参考宽 ×0.92 − 2×6dp = 2505px）`EXACTLY` 测量并排版。

**B 五档标签与 RTL 几何**：新增两条滑轨共用的「标签让位」内缩 `inset`，由**实测档名宽度**与行宽取满足「两端档名在行内 `i ≥ w/2`」与「相邻档名不相碰 `i ≥ (2(w_j+w_{j+1}) − S)/4`」的最小值，上限 `2S/5`。可见轨道 = `[paddingLeft+inset, width−paddingRight−inset]`，首末刻度＝轨道端点＝对应 thumb 中心，五档等距；两条条同宽同档名故等长同边距同取色。实测 420dp/row 380/inset 32/轨道 `[41,299]` 长 258px：`label_widths=[64,32,52,33,62]`、`label_lefts=[9,90,144,218,268]`、`tick_centers=[41,105.5,170,234.5,299]`，最大中心偏差 4.5px；320dp 窄行五名齐全、无重叠、全在行内。超份额的档名在**份额内换行**（≤2 行），不裁切／不省略号／不重叠。**RTL**：新增唯一映射 `physicalFraction()`／`physicalCenterX()`（RTL 取 `1−logical`），thumb／刻度／填充带／档名行全部只消费它，消除原「刻度镜像而 thumb 不镜像」的双重反转；`rtl()` 先读已解析祖先方向，未附着时回退到本地化配置，绝不用未解析默认值。**边界如实报告**：Robolectric 不把布局方向下推到普通 `View`（RTL 父的 RTL 子仍报 LTR，探针实测），无法搭建 RTL 控件树；`N25TierRailTest` 因此验证映射的两半（行方向＝上下文已解析方向；轨道端点／thumb／五刻度／标签中心／填充带边界全部随该方向取值）＋透明度条与字号条几何全等，**RTL 真机仍须目检**。

**C 示例资源键**：新增 `preview_sample`，经 `CaptionStrings.settings` 读取（与页面其余文案同源、受 Morphe 语言覆盖），不再依赖「对未登记中文调用 localize 再回退」。十四语种按卡片意图落地，仅俄语一处笔误（混入一个汉字）已修为「Мир огромен. Посмотрим вместе!」。**实测**（参考宽 2736/预算 2505、最大档全屏字高 69.84px）：十四语种完整 advance 最大为**越南语 1277px**（余量 1228px），标准档最大 1010px——五档下全部单行完整显示，断言用 `Layout.getLineCount()==1` ＋ `getLineEnd` 覆盖整串 ＋ `measureText` ≤ 预算 ＋ 非 ellipsize 四项，并渲染 14 张 fixture 目检。另新增「真实 `Preview` 画到位图、用墨迹实测字幕底框左右边界」的用例。

**D UI 本地化补齐**：新增 **76** 键 × 14 语种，总数 129→**220**。修掉：诊断长说明无整句映射（substring 留混合语言）、「保存完整诊断」无资源条目、复制成功 Toast 绕过本地化、保存失败／保存位置拼接中文片段、清空确认说明、Android 9 分段复制的标题／选项／成功提示／Clipboard 标签、模型行全部状态与「已选择」无障碍（`selected_suffix`）、预览示例、`CaptionDiagnostics.uiText` 与 `TokenCostAudit.uiText` 的固定英文标题与说明（52 个 `audit_*` 键）。**UI 与 raw 分离**：`uiText(c)` 默认本地化、新增 `uiText(c,false)`，`fullText` 只调后者，导出原始报告表头逐字不变；REBUILD_* 事件名／JSON 键／错误码／源文译文时间戳请求ID计数值全保留。**顺带修一处真实缺陷**：`DeepSeekActionPreference` 原用 `message.startsWith("API 可用：")` 判断成功，文案本地化后即失效、成功时不再刷新配置；改为布尔标志并把三句各做成整句模板。非 UI 字符串（质量检测正则、供应商提示词、YouTube 原生按钮识别词、目标语言名表、内部异常标识、原始报告表头、字体标定样本、构建材料）分类留档，清单 `.verification/n25/ui-localization-inventory.md`（18 调用点 → 资源键 → 覆盖状态 ＋ 8 类「刻意不翻译」及理由）。未用全局 `Locale.setDefault`，未改写用户数据。

**交付**：`build/local-test/patches-1.3.5-本地测试包-n25.mpp`（1,101,113 B，+40,780 相对 N24，`36F885BE…`）、`extension-1.3.5-本地测试包-n25.mpe`（2,713,520 B，+15,484，`C75B1067…`）、`build/n25-composition-final/YouTube-21.16.256-本地测试包-n25-unsigned.apk`（196,935,268 B，+134,320，`9FE3A03F…`；**未签名确认**）。组合 **84/84 PASS**；`DEX_AUDIT_PASS classes=58028`；`verify_bundle`／`N8Verify`（72 条目 / 14 locales / CRC / root DEX / MPE 与包内扩展逐字节一致）通过；12 个历史产物前后 SHA-256 全一致（N18/N18r/N22/N23/N24 及既有本地包均未覆盖）。Java **437/437**（56 套件，0 失败/错误/跳过；N24 为 429）、Python **27/27**、本地化 **220 keys × 14 语种**、冻结计分板 **4 通过 / 4 既有失败 / 4 未验证**且三类不可见时长全 0、冻结证据与 ACCEPTANCE.md 未改。提交 `99e7be5`，锚点 `anchor/n25-99e7be5`（未推送）。
**自查修正（记录在案）**：初版本地化表头把 `label_separator` 套在已带冒号的头名上（中文「引擎：：」、英文「Engine: :」），已改为裸标签＋单一分隔符模板并在管线内加断言与幂等归一；相应产物与哈希为本卡最终值。
**真机仍待用户验证**：预览去标题后的观感、系统大字体下五档档名排版、RTL 系统语言下滑轨方向与拖动一致性、十四语种界面文案与诊断摘要可读性。**本卡不做真机、不签名、不发布；L 线未启动。**
**未解决（沿用观察，本卡未改）**：§4d 的两处译文问题（327.0–331.2s 中心词漏译、384.6–391.7s A14 主语错接复发）与另两处轻微项仍为观察记录，未登记进 ACCEPTANCE；560s「到本世纪中叶」错接修饰对象只有生成记录、未见上屏记录；353.559–355.513s「军队拥有数百万人员」关联源字幕 shared、疑似源字幕 ASR 错误，**无音频故不得把推测的 shed 当作已确认原文**；另一视频的 3 次 `source_quote_mismatch` 属源引用格式差异而非网络失败；7 条 `overflow_status` 展示记录只涉及 3 个事件，其中选中译文按码点计 CPS 为 9.026／9.020／8.286，均越过既有 8 门槛，分页器在测量布局前即返回空计划——**不能一概归因于像素溢出**。这些问题的通用且低回退修法仍未确立，本卡未动提示词、CPS 口径、修复候选排序、源引用容错或分页参数。

## 4i. 后续规划用户定案与 N26 待执行（2026-10-01）

用户已确认九项选择：
1. 1A：AI 字幕设置迁入“视频”，只留一个入口。
2. 用户最新调整：固定紧邻旁白翻译，前后位置由规划者决定；已确定放在旁白翻译之后。保留视频父页现有 sort_by_key，利用外层导航key morphe_vot_screen__ai_captions 在宿主排序中紧跟 morphe_vot_screen，内部持久化key不变；旧外层导航key作为移除旧入口的别名保留。若旁白补丁未安装，则在视频页正常排序位置显示。此决定覆盖先前2A的自然放置安排，不改其他项目顺序。先前BY_TITLE描述已纠正，N25实际父屏为 morphe_settings_screen_12_video_sort_by_key。
3. 3A：首轮播放器避让仅常规详情页与横屏全屏；Shorts 暂不纳入。
4. 4C：追加语言集合默认空，不自动勾选简中或十四种语言。
5. 5A：AI 关闭时仍保留所选追加语言，原生路径需验证。
6. 6A：保留现有中文体验，繁中补回归，不将9CPS/16字参考直接改成中文新门槛。
7. 7A：新语种读速先作为软目标/告警，结构与几何仍为硬约束。
8. 8A：新语种7秒展示页目标，中文先不变，不设全部语种7秒硬上限。
9. 9A：菜单目标语言优先，已保存自定义要求不改写。

用户已装机目视确认 N25 本轮提出的内容修复妥当。此为所观察界面问题签字，不扩大为十四种译文语义均已验收。下次小改已授权：预览框下说明改为“样式预览（全屏）”，十四语种同步，不恢复删除的重复标题。

四阶段：
- 第一阶段/N26：入口迁入视频并紧跟旁白翻译之后、无图标、单入口、保留父页实际排序和其他条目顺序；修改 preview_hint；必要验证与新测试包。只改资源和文案。
- 第二阶段：常规播放器控件避让；仅显示层临时偏移，保留用户基准，不改字体、分页、归属或API请求。
- 第三阶段：十四语种参数档案、字素/行长计数、方向、实际源/目标语言路由；可拆为“档案与计数回归”和“接入呈现/提示/缓存并验证”两个闭合执行卡。中文基线保留。
- 第四阶段：十四种候选多选补入自动翻译菜单、默认空集合、去重/排序/持久化、第二个简中补丁合并到AI root；保留字幕记忆独立补丁。

先完成并审阅上一阶段再发下一阶段执行卡，任何时刻只允许一个执行者修改仓库。各阶段保留独立回退锚点。历史中让新DeepSeek对话承担研究/规划或直接启动旧L1调查卡的安排，由本节最新角色分工与四阶段顺序覆盖；DeepSeek只执行本聊天已明确的任务卡。

N26 开工基线为 2f7841d；本节是规划者的管理文件更新，当前 docs/PROJECT-STATE.md 未提交修改应随 N26 提交，不回滚成旧档案。四阶段中**第一阶段（N26）已执行完毕**（见 §4j），第二至第四阶段仍未实现；其他历史真机清单与验收判据不变。

## 4j. N26 执行结果（2026-10-01，用户卡：设置入口迁入视频页 ＋ 全屏预览说明）

**A 入口迁入视频页**：外层导航 key `morphe_settings_screen_13_ai_captions` → **`morphe_vot_screen__ai_captions`**；旧 key 作为删除别名保留，带它的残留节点在装配时被清除。AI 子屏内部 17 个持久化 Preference key、类名、控件顺序、SharedPreferences 名称与 Keystore alias 全部未动，**无用户数据迁移**。装配按字面 key 绑定已验证的 `morphe_settings_screen_12_video_sort_by_key`（该后缀由官方补丁 `PreferenceScreenPreference$Sorting.appendSortType` 在打补丁阶段拼出），**先确认父屏唯一存在再删除、最后插入**；旁白项 `morphe_vot_screen` 存在时插其直接后继，不存在时挂入视频父屏尾部，不新增旁白补丁依赖；存在 Morphe 设置却找不到唯一视频父屏时**抛具名 `PatchException`**，不回退顶层、不回退原版 YouTube 设置。**排序事实**：宿主排序在运行时进行并重赋 `android:order`（三套资源中该属性出现 0 次），故 DOM 位置不是相邻性的证明。从交付的官方扩展 DEX 反读 `AbstractPreferenceFragment`：`_sort_by_key` 组内所有子项（含子屏）以 `Collator.compare(childKeyA, childKeyB)` 排序，Collator = `Collator.getInstance(MORPHE_LANGUAGE.get().getLocale())` 且 `setStrength(SECONDARY=1)`，无 key 的 `NoTitlePreferenceCategory` 取 `getPreference(0).getKey()`，其余 null key 抛异常；子项排序模式默认继承父组。新 key 是旁白 key 的严格前缀，故十四语种下均紧随其后。规划者先前把默认 `BY_TITLE` 当作视频页实际排序的说法**已在 §4i 纠正并在此以字节码证据定案**。

**B 入口样式**：入口图标属性面为空（不设 `android:icon`／`android:layout`／`app:iconSpaceReserved`），与三套资源中 **25 个原生嵌套子屏（含紧邻旁白项）逐属性相同**；旧 `@layout/preference_with_icon`（含 18dp 边距的 `@android:id/icon` 槽）与旧 `@drawable/deepseek_caption_settings` 引用已从设置行移除，该 drawable 仍因 `CaptionQuickToggle` 使用而保留生成。framework 行渲染：AI 项／旁白项／同页叶子项标题左内缩**同为 16px**，真带图标的对照行为 **72px**（探针灵敏度已验证），亮暗主题一致。

**C 预览说明**：`preview_hint` 十四语种改为「样式预览（全屏）」系，只改该键显示值；未新增重复标题、未改 `preview_sample`／比例／字体／五档／透明度／交互；N24 删除的「横屏全屏预览」标题未恢复。`localization/catalog.json` → `tools/generate_localization.py` 重生成 14 份 XML ＋ `source-keys.tsv` ＋ Java fallback；新增 `tools/apply_n26_preview_hint.py`。`preview_hint` 不在 `n25_ui_strings.py` 的 `EN`/`REUSE` 中，故重跑 `apply_n25_catalog.py` 不会还原旧文案；`git diff` 仅 14 行改动。

**验证**：Java **440/440**（58 套件；N25 为 437/56，新增 `N26EntryRowTest` 1 条 ＋ `N26PreviewHintTest` 2 条）；Python **27/27**；本地化 **220 keys × 14 语种**；冻结计分板 **4 通过 / 4 既有失败 / 4 未验证**且三类不可见时长全 0，`frozen-baseline.json` 与 `ACCEPTANCE.md` 未改；组合 **84/84 PASS**、`DEX_AUDIT_PASS classes=58028`；结构/幂等（二次装配不变形、父屏缺失与重复均被拒绝、交付 DEX 内含具名失败消息）、**宿主真实排序 14 语种 × 3 套资源**、**交付 APK 内三套 XML 含新 key 且不含旧 key**、**`resources.arsc` 字符串池精确包含十四语种新说明且不含任何旧说明**、`verify_bundle`／`N8Verify`／ZIP CRC／11 根 DEX 头均通过；20 个历史产物前后 SHA-256 全一致。未做真机、未签名、未发布、未推送。

**交付**：`build/local-test/patches-1.3.5-本地测试包-n26.mpp`（1,103,820 B，+2,707 相对 N25，`01B80F88…`）、`extension-1.3.5-本地测试包-n26.mpe`（2,713,536 B，+16，`4C0D21FF…`）、`build/n26-composition-final/YouTube-21.16.256-本地测试包-n26-unsigned.apk`（196,935,284 B，+16，`4BC02228…`；**未签名确认**，aapt 确认 `app.morphe.android.youtube` 21.16.256／minSdk 28／targetSdk 36）。详见 `docs/N26-LOCAL-TEST-BUILD.md`。

**真机仍待用户验证**：顶层旧 AI 入口消失、视频页只有一个正常风格且紧跟旁白翻译之后的 AI 入口、旁白与其他设置不受影响、原 API/profile 与字号/透明度/位置/开关读回不变、进入子屏与返回导航正常、预览下方为「样式预览（全屏）」且随应用语言变化。**离线不做真机结论**；下一阶段为常规详情页与横屏全屏的播放器控件避让（尚未执行），本卡未启动。

## 4k. N26 真机新反馈、最终语言闭环与 N27 边界（2026-10-01）

N26提交边界已核对：509d50a含源码/文案，anchor/n26-509d50a指向它；HEAD7f9c639较锚点仅改docs两文件。用户已装机，报告三项新问题，以下全部未关闭：
1. 视频页AI入口summary仍是“修改后自动保存”，应像旁白翻译summary一样介绍功能；最终阶段更新为功能说明并适配全部界面语言。
2. 十四语种运行时适配不完整且表现不同。英语/法语等切换后，默认翻译要求、预览示例、字号/档名等仍有中文。不能因catalog/交付资源/离线fixture通过而宣称运行时适配完整；最后必须从应用语言实际解析、配置默认值来源与绑定、资源fallback/缓存和所有用户可见调用点统一审计，并明确按应用语言取值。用户自定义内容不得被误当默认值而改写。
3. 用户最新明确要求程序性诊断内容为英文，当前仍出现中文。最终阶段统一检查：技术正文/表头/字段/事件/原因/状态/计数等使用英文；设置页外壳、功能说明、按钮与Toast等用户操作文案适配界面语言。源字幕、实际译文、用户自填配置与提供商原始证据不为“英文诊断”而改写。

用户明确：暂不执行以上修复，留待已规划全部功能做好后最后统一检查，避免中途改动再次引入遗漏。后续闭环顺序为：N27避让 → 语言档案/计数/方向及接入 → 菜单多选与简中root合并 → 最终全面本地化/功能说明/诊断英文审计修复。最终阶段不是可选项；在它完成前不写“十四语种适配已全部完成”。本次真实反馈优先于N25/N26此前对本地化覆盖的推断，历史离线测试事实保持，不重写历史结果。

N27只做普通视频详情页和横屏全屏的显示避让，默认生效，不新增设置控件；Shorts/小窗/PiP排除。仅在与已验证控件矩形相交且存在安全空间时临时上移；控件隐藏后回原基准，不修改用户保存的位置、字体、分页、源时间、原生/AI ownership和API调度。新增N27诊断事件/字段/原因全部英文，不趁机重构旧诊断正文或修复本节语言问题。

N27开工HEAD7f9c639。本节是规划者管理更新，docs/PROJECT-STATE.md未提交改动须保留并随N27提交，两份档案同步。研究和任务设计由本聊天负责；DeepSeek只按已明确的N27任务卡执行，不自派后续阶段。

## 4l. 历史交接准备（用户随后取消，当前以§4n为准）

已准备交接目录 `C:\Users\14776\Documents\morphe-caption-handoff\2026-10-01`，入口 `HANDOFF.md`，新对话首条提示词 `START-HERE.txt`，附N27当前执行卡、研究草案、语言参数草案、N24审阅记录、N26交付记录和本档案快照。新对话仍是规划/审阅者，DeepSeek只执行。此交接只修订管理说明，未改产品源码、未跑测试/构建、未生成N27产物、未提交/签名/推送/发布。

交接核对：E盘HEAD7f9c639、源码锚点anchor/n26-509d50a；规划者只修改docs/PROJECT-STATE.md管理文档；末次只读核对另见DeepSeekCaptionPatch.kt、Fingerprints.kt修改，以及CaptionControlsAvoidance.java和CaptionControlsAvoidancePatch.kt新增未跟踪文件，均不是规划者修改。N27卡已交付用户，执行疑似已开始；未收到N27报告，尚无N27提交/锚点证据。不读取在途工作为最终实现，也不清除这些改动。接任者必须读取实时Git状态，若N27已在执行或已完成，不重复派发卡片。

**研究旧值注意**：§7b–§7d为历史调查记录，不作为当前执行指令。英文普通成人字幕参考读速已由2026-10-01逐语种指南复核为20CPS，旧“英文17”不可套用；中文保留现行基线，外部9CPS/16CPL不是新门槛；字素/行长计数与断行参数需要在第三阶段明确化和校验。研究JSON中的“pending/unapproved”是草案生成时的旧标签，九项原则性选择已经确定，不能因此再问用户一遍，也不能把尚未实现的细节宣称已经上线。

## 4m. N27 执行结果（2026-10-01，用户卡：普通播放器控件避让）

**A 可见性输入**：本 patch 内自建 `PlayerControlsVisibilityFingerprint`（公开无参 `getPlayerControlsVisibility`、返回 `L`、过滤器 `IGET`＋`INVOKE_STATIC`，即官方 `PlayerControlsVisibilityEntityModelFingerprint` 的同构模式），**唯一匹配**为 `classes3.dex Lbfec;->getPlayerControlsVisibility()Lbfee;`；真实状态字段 `Lbfed;->e:I`、真实 enum 工厂 `Lbfee;->a(I)Lbfee;`（`Lbfee;` 经确认是 `Ljava/lang/Enum;` 子类，常量名与 `UNKNOWN/WILL_HIDE/HIDDEN/WILL_SHOW/SHOWN` 对应）。注入点是与官方**同一条实体模型构造器路径**：`<init>(Lbfed;)V` 内确认持有者存储 `iput-object v1, v0, Lbfec;->c:Lbfed;` 恰一次、其后无 return、末尾 `return-void`，再把**已初始化**的 enum 交给自有回调 `DeepSeekCaptionHookV2;->onPlayerControlsVisibility(Ljava/lang/Enum;)V`。与官方块的关键差别是**先从 owner 寄存器重载持有者**，使官方 hook 先行把该寄存器覆写成 enum 时本卡仍成立；**交付 APK 内实测两个 hook 同处该构造器**（13 条指令，官方在 [2]–[5]、本卡在 [6]–[11]），两种注入顺序的寄存器类型抽象解释均为 safe，删掉重载的对照重放会被判 collision（非空转）。绑定失败一律具名 `PatchException`，不猜混淆名与字段语义、不静默回退；作为 AI root 内部字节码依赖接入，用户不需另选补丁，官方同名类未重打包、官方 hook 未替换或删除。enum 通知只是触发信号，几何在**主线程/下一绘制帧**读，跨 Activity/视频/模式的排队回调按 epoch 丢弃。

**B 控件与坐标**：12 个控件名**按名称**运行时解析（无 `0x7f` 硬编码），并已对交付 APK 的 `resources.arsc` 复核真实编号（如 `youtube_controls_bottom_ui_container=0x7f0b1841`、`player_seekbar=0x7f0b0ee1`、`timestamps_container=0x7f0b163e`）；交付 APK 自带布局亦已解出（`res/QYO.xml`/`res/Q1y.xml` 为底部条，`res/zi9.xml` 为按钮行与各 `*_touch_area`，`res/zmf.xml` 证明 `youtube_controls_overlay` 与 `inset_controls_overlay_wrapper` 都是全屏透明容器，**明确排除**）。绑定只在当前 player 子树内 `findViewById`，弱引用缓存，重绑走既有 ≈500ms 低频路径与可见性触发，不开无界定时器；矩形要求已附着、`isShown()`、祖先 alpha 连乘 ≥0.15、真实裁剪后非空并与视频矩形求交。折叠进度红线双重防护：底部簇以底部容器可见为前提，且合并簇高 <12dp 判为进度线。字幕碰撞盒取**真实 TextView 的盒**（含背景与内边距），不用 anchor 全宽透明条。

**C 算法与动画**：以本帧基准盒求“刚好放到相交障碍上方 +8dp”的最小上移；抬起后再遇更高障碍继续上移，迭代次数以障碍数为界；结果必须完整落在视频矩形内，否则保留原位、记一次 `no_safe_space`，不缩字、不隐藏有效正文、不推出视频。控制器隐藏即目标归 0、回用户原基准。偏移用 anchor 的 `translationY`，**基准布局与临时偏移分离**：`render()` 照旧重设 `LayoutParams`，动画不会被重 render 归零、上移也不会漂移进基准；水平位置/宽度/字体/字号/正文/分页完全不变，未改 `LayoutBudget`、未触发翻译或重译。参数（本卡实施值，未宣称真机已测）：8dp 间隔、200ms 减速、有效几何当拍即开始、目标取整像素、同目标不重启、<1px 不重启、目标变化从当前视觉位置重新定向。隐藏/空白/GONE、guard 抑制、Activity 销毁、换视频、播放模式切换均取消动画并清偏移；旋转或视频矩形变化先取消旧方向目标再按新矩形与原归属基准重算。拖动沿用 N26 350ms 阈值与保存行为：开始拖动只取消动画并保留当时视觉偏移，拖动期间冻结该偏移，保存仍为“原基准 + 手势增量”，**避让偏移从不写入配置**；空白/最终失败态不建空框。

**D 整合**：`CaptionOverlay`（实际 class `CaptionOverlay`）仅在 attach/render/hideView/detach 与 drag 路径新增协调器通知；正文选择、`RebuildPageLayout`、`RebuildController` 与 API 调用逻辑未动；V2 门面新增 `onPlayerControlsVisibility` 并转发 Activity/video/type 清理。DEX 契约检查证明协调器只引用平台视图/几何/动画、自有包、`CaptionDiagnostics.mark` 与 `CaptionSurface.isShorts/player`，禁用面（API 客户端、翻译/分页/重建、缓存、质量追踪、诊断归档、目录字符串、`getSharedPreferences`/`edit()`、`LayoutBudget`/`RebuildPageLayout` 成员）**命中 0**。

**E 诊断与验证**：新增 `CAPTION_UI_AVOIDANCE_BOUND/TARGET/RESET/UNAVAILABLE`，字段 `epoch/player_type/controls_state/video_rect/caption_base_rect/obstacle_rects/offset_px/reason/trigger/obstacle_ids`，事件名、字段名与全部 reason 值**从第一行起全部英文**（新代码不重构旧诊断正文、不补本期无关文案）；按 `epoch|offset|reason` 等键去重，稳定障碍只记一次。N27 测试 **24 条 + 1 套件**，全部经真实 `CaptionOverlay` 渲染/隐藏/拖动路径与真实协调器运行：无碰撞与隐藏 UI 偏移 0、底部碰撞最小上移、多障碍有限迭代、无安全空间回原位并只记一次、非零 host 偏移换算、祖先 alpha/不可见/脱离 View/全视频透明容器排除、折叠红线单独存在不抬高、原基准与字体/文本/页身份/保存位置不变、显示→隐藏→显示、同目标不重启、中途重定向不跳变、受控时钟下 200ms 收敛、拖动视觉冻结且偏移不入配置、换视频/旋转取消旧目标、晚 inflate 在低频路径重绑、陈旧 epoch 回调丢弃、Shorts/迷你/PiP 不应用、诊断全英文无重复。**帧图**由既有 Android 渲染路径（Robolectric NATIVE ＋ 真实 overlay/控件树，非 HTML）导出 **24 张**：`{详情页 360×640, 横屏全屏 640×360} × {小/标准/超大} × {before, showing, after, hidden}`，`showing` 帧使用从交付资源读出的底部条形状。

**离线范围与实测边界**：控件名与真实编号、宿主布局、注入指令与两 hook 并存顺序均有交付物证据；**YouTube 运行时是否真的把这些 View 挂到当前 player、以及 8dp/100ms/200ms 的真机观感仍待用户真机确认**（离线用名称→id 注入 ＋ 既有 `CaptionSurface` 几何接缝，合成播放器不能证明真实控件已绑定）。Robolectric 的 `ValueAnimator` 会把时间线塌缩成一拍，故动画改由主 Handler 按 `SystemClock` 逐帧驱动（生产同为主线程逐帧、200ms 减速不变），使离线受控时钟下的推进/取消/重定向真正可验证；真机时延未测。MPP/MPE/APK 的 ZIP manifest 带构建时间戳，同一源码两次构建整包哈希不同；两次构建的内部 `classes.dex` 与 `extension.mpe` 逐字节相同，两次组合的 APK 之间只有 `classes2.dex`（patcher 元数据）不同——交付哈希为**本次实例**哈希。交付 APK 由**交付 MPP 本身**重新组合与审计。

**验证**：Java **464/464**（59 套件；N26 为 440/58）；Python **27/27**；本地化 **220 keys × 14 语种**；冻结计分板 **4 通过 / 4 既有失败 / 4 未验证**且三类不可见时长全 0，`ACCEPTANCE.md` 与 `frozen-baseline.json` 未改；组合 **84/84 PASS**（`structure.txt` 含 `onPlayerControlsVisibility=1`）、`DEX_AUDIT_PASS classes=58034`；`verify_bundle` 与 N27 产物审计通过（MPP 74 条目、内嵌扩展逐字节一致、14 份 locale XML 与源一致、N25/N26 标记全保留、12 个 N27 控件名在扩展内、两个全屏排除 id **不在**扩展内；APK 16604 条目 / 11 根 DEX / 无签名文件 / 三套设置 XML 仍为新 key / `resources.arsc` 含十四语种新说明且不含旧说明 / 官方 hook 与本卡观察者同处 `classes.dex`）；39 个历史产物前后 SHA-256 全一致。

**交付**：`build/local-test/patches-1.3.5-本地测试包-n27.mpp`（1,117,781 B，+13,961 相对 N26，`BB197188…`）、`extension-1.3.5-本地测试包-n27.mpe`（2,727,272 B，+13,736，`45F2C9B6…`）、`build/n27-composition-final/YouTube-21.16.256-本地测试包-n27-unsigned.apk`（196,943,040 B，+7,756，`BF4C53EB…`；**未签名确认**，aapt 确认 `app.morphe.android.youtube` 21.16.256／minSdk 28／targetSdk 36）。锚点 `anchor/n27-62c4916` 指向唯一实现提交。详见 `docs/N27-LOCAL-TEST-BUILD.md`。

**真机仍待用户验证**：普通详情页与横屏全屏下 UI 出现且遮挡时字幕自然上移、不遮挡时不动；UI 隐藏后回原位置；暂停不因本功能翻页；拖动/旋转/seek/换视频无跳跃或残留；Shorts 原样。**离线不做真机结论**；下一阶段仍为语言档案/计数/方向及接入（本卡未执行、未自派），最终全面本地化/功能说明/诊断英文审计修复仍为必须步骤。

## 4n. N27 真机启动失败、根因与 N27r 修复定案（2026-10-01）

**用户最新要求**：取消换对话，继续由本聊天负责研究/判断/任务卡/审阅，DeepSeek Harness只执行。所有必要状态与资料索引需落本地，确保上下文压缩后仍可恢复，不依赖旧对话全文或旧交接快照。

**提交边界核对**：E:\Projects\morphe-caption-v2 HEAD28229e0；源码62c4916，anchor/n27-62c4916指向它；其后只有docs。N27执行者报告Java464/464（59套件）、Python27/27、组合84/84、DEX类58034及三件套见§4m/交付记录，这些是其有限离线检查结果，不能等同ART/真机启动通过。用户已安装，确认“点开应用立即闪退”。此前N27在途快照已过时。

**已证实根因**：用户连接手机授权读取日志。只读adb crash buffer中7个此包进程（18:47:59–18:52:03）均为`java.lang.VerifyError: Verifier rejected class bfec: void bfec.<init>(bfed): [0x10] target dex pc 0xd is not at instruction start.`。已装包21.16.256/minSdk28/targetSdk36，手机Android17/API37。对本地最终N27交付APK独立读取codeUnits/PC/signed offset亦完全相同：PC0x10 `if-eqz` relative=-3→0x0d；官方invoke在0x0b、宽3，故落入其操作数字。正确目标应是实际RETURN_VOID（当前坏包0x1b，修复不能硬编码）。不是API/语言/几何问题，类验证发生在方法运行之前，即使holder非空也会拒绝。

**机制与漏检**：N27的CaptionControlsAvoidancePatch.kt以普通addInstructions插入含分支及末尾裸标签片段，最终序列化标签重定位失效。旧N27ControlsHookCheck用原始APK+独立assemble+ArrayList拼接，主要做寄存器类型模拟，未校验真实patcher注入后的最终分支地址；旧dump无PC/offset，Java/Robolectric渲染回归不执行宿主构造器DEX。不得因历史PASS忽略真机失败，不改写历史冻结结果。

**N27r方案已定**：只把本卡注入改为addInstructionsWithLabels，ExternalLabel绑定插入前捕获的真实return指令，保留owner重载、空值保护、enum callback与官方hook；不得数值修补/裸标签/nop碰运气/删除避让/try-catch掩盖。补常规管线中的最终APK全根DEX分支边界与本卡目标审计；生产标签API注入→序列化→重新读回的回归覆盖官方先后与无官方hook。新增审计必须拒绝保留的旧N27坏包，报告0x10→0x0d；新包target必须是正确return。

**本期卡与证据**：`docs/N27R-CRASH-REPAIR-TASK.md`（完整执行卡），`docs/N27-CRASH-REVIEW.md`（根因/漏检/边界）。证据目录 `C:\Users\14776\.codex\visualizations\2026\10\01\01a0f56a-7d8c-75e0-8def-3fa2f0b542ef\n27-crash-review`：`n27-crash-androidruntime.txt`仅此包PID日志、`n27-final-constructor-pc.txt`直接从最终APK读出的PC/宽度/relative/target、`patcher-instruction-extensions-javap.txt`确认现有标签API。原始buffer含其他应用记录，仅本地留存，不作为分享材料。只读DEX分析工具在同目录，不是产品改动。

**当前状态与交付约束**：N27标记“已交付，真机启动失败，未验收”，优先N27r；不推进语言功能。**（本节为N27r开工前的定案记录；N27r已于同日执行完毕，结果见§4o。）** N27r尚未执行，没有修复产物；须保留本轮管理文件改动随修复卡提交。新产物用-n27r独立路径/新源码锚点，旧N27/N26及其他历史产物不覆盖；不要amend、推送、签名或发布。静态新审计通过不宣称真机修复完成，用户装机复验正常启动及避让后才闭环。未授权安装/清数据/卸载，规划者本轮也未做这些。

**后续顺序**：N27r恢复启动＋N27普通播放器避让复验 → 十四语种档案/计数/方向/源目标路由与接入 → 菜单十四语种多选/简中root合并 → 必须执行的最终入口功能说明/全部运行时本地化/程序性诊断英文审计修复。三项延期不趁此卡修改；九项定案不再询问。

**研究恢复索引**：`C:\Users\14776\.codex\visualizations\2026\10\01\01a0f56a-7d8c-75e0-8def-3fa2f0b542ef\future-plan-research\N25-next-feature-study.md`与`language-profile-draft.json`，逐语种官方指南和开源实现均在该目录。旧pending/unapproved及2A自然放置已被§4i决定覆盖；英文普通成人参考20CPS（旧§7d英文17不可套），中文保持现行，新语种速率软、几何/两行硬。N24质量审阅与诊断拆解在同根`caption-n24-review`目录，真实诊断/SRT路径见根因记录与该审阅。所有细节草案尚未上线，不把接口资源覆盖当运行时或语义质量通过。

## 4o. N27r 执行结果（2026-10-01，用户卡：修复启动VerifyError ＋ 补齐最终DEX分支审计）

**A 最小生产修复**：`patches/src/main/kotlin/app/yydarlinker/patches/deepseekcaptions/CaptionControlsAvoidancePatch.kt` 由普通 `addInstructions`＋片段末尾裸标签，改为 `addInstructionsWithLabels` ＋ `ExternalLabel("yydarlinker_caption_controls_return", originalReturn)`；`originalReturn` 是插入前捕获的构造器末尾真实 `RETURN_VOID` 的 `BuilderInstruction` 对象，不计算、不写死 relative/PC。交付 APK 实测同一条 `Lbfec;-><init>(Lbfed;)V`：PC0x10 的 `if-eqz` 由 `signed_offset=-3 → target_pc=0x0d`（落在 0x0b、宽 3 的官方 `invoke-static` 操作数字内部，即 ART 报的 `[0x10] target dex pc 0xd is not at instruction start`）变为 **`signed_offset=+11 → target_pc=0x1b return-void`**（`target_is_method_last=true same_method=true`）。官方 hook 与本卡观察者仍并存且顺序未变，从 owner 重载 holder／空值保护／enum 回调／指纹与类型约束全部保留。**未采用**数值偏移、盲加 nop、删除空值判断、关闭避让、host/hook catch-all、回退 N26；未改 API/分页/语言策略。MPE 与 N27 逐字节相同（本卡未触碰扩展源码）。

**B 最终 DEX 审计（进入常规管线）**：新增 `patches/src/test/kotlin/validation/`：`DexBranchAudit.kt`（容器遍历 APK／MPE／MPP／裸 DEX＋嵌套、逐方法 16 位 code unit 地址映射、goto/if 目标、`packed-switch`/`sparse-switch` 的 payload 引用/种类/对齐与 case 目标「相对 switch 指令」、`fill-array-data` payload、try/catch 范围、并用自写解析器读裸 `code_item.insns_size` 与 `Σ codeUnits` 双向核对；方法漏读／解析失败／code size 不一致一律 FAIL；内置变异自检每次运行都必须拒绝「落入操作数字」与「越界」两种改写）、`ControlsHookBindingAudit.kt`（按真实方法引用＋读数指纹形状识别实体模型，检查 null guard 目标恰为非空路径落入的同一 `RETURN_VOID`、路径顺序、invoke 与 move-result 相邻、寄存器界限/word 数/类型、本卡 callback 恰 1 次、官方 hook ≤1 次，并打印真实混淆名与整张 PC 表）、`FinalDexBranchAudit.kt`（CLI 入口，非 0 退出）、`InjectionOrderRegression.kt`（真 patcher 注入→序列化→从磁盘重读）。Gradle 新增 `:patches:auditFinalDex`、`:patches:verifyInjectionOrder`；**同时接入既有组合/交付入口** `CompositionDexAudit`（`:patches:auditComposition`），在旧判据之前调用同一 validator，失败即构建非 0。旧 `TYPE_SAFE_SUMMARY` 类型模拟与其产物保留，不再充当分支/最终产物证明。审计如实输出实际读到的 DEX 数，不写死 11。

**C 证据**：① 旧 N27 真实坏包被新 validator 直接拒绝——`FAIL_BRANCH … class=Lbfec; method=<init>(Lbfed;)V source_pc=0x10 signed_offset=-3 target_pc=0xd target_valid=false reason=target_inside_instruction containing_pc=0xb containing_width=3 containing_opcode=invoke-static` ＋ `FAIL_BINDING guard_target_not_instruction_start target_pc=0xd`，非 0 退出；同一坏包送进既有组合入口同样 `IllegalStateException: Final DEX branch/controls-hook audit failed` → `BUILD FAILED`（坏包是预期失败样本，未被包装成 PASS）。② 新交付 APK `DEX_BRANCH_AUDIT_PASS label=n27r-final dex_units=11 methods=322002 branch_edges=624712 switch_cases=112402 try_blocks=46579 invalid_branches=0`，随后既有 `DEX_AUDIT_PASS classes=58034`。③ 真 patcher 注入回归 `official-first`／`ai-first`／`no-ai` 三组，序列化后重读全部 `signed_offset=11 target_pc=0x1b return-void`；两种顺序在本 bundle 下被 patcher 归一成同一布局，**如实报告未产生不同宽度前缀**。④ 同一 validator 亦通过交付 MPE（1 unit／12,600 方法）、交付 MPP（内嵌扩展＋patcher `classes.dex`，2 units）与未补丁原版 APK（7 units）。**边界（三次真实尝试）**：官方 1.44.0 下无法构造「官方 hook 未被选中」的组合——只选 AI root 会因缺 `FlyoutUtils` 失败；去掉 `Hide player overlay buttons`（83 补丁）后 hook 仍在，因为 `GmsCore support` 声明依赖它；再去掉 `GmsCore support`（82 补丁）hook 仍可经共享内部依赖到达；只留 `Hide player flyout menu components` 则缺 `morphe_settings_screen_12_video_sort_by_key`。依赖表由 patcher 自身 `Patch.getDependencies()` 读出留档（`build/n27r-records/official-patch-list.txt`），注入方由官方 bundle 内携带该 smali 串的类定位（`PlayerControlsOverlayVisibilityPatchKt`），未猜测；validator 仍报告 `official_hook_count` 并在 >1 时失败，未因无法构造该组合而放宽判据。

**验证**：Java **464/464**（0 失败／0 错误／0 跳过，59 套件，与 N27 基线一致；本卡未新增 JUnit，新增回归以仓库既有 `validation` 入口方式落地）；Python **27/27**；localization **220 keys × 14 语种**；冻结计分板 **4 通过 / 4 既有失败 / 4 未验证** 且三类不可见时长全 0，`ACCEPTANCE.md` 与 `frozen-baseline.json` Git 无差异；组合 **84/84 PASS**（`onPlayerControlsVisibility=1`）；`verify_bundle.py 1.3.5` 与 `N8Verify`（74 条目／14 语种／CRC／根 DEX／内嵌扩展逐字节一致／交付 patch dex 含新 `ExternalLabel` 名且不再含旧裸标签）通过；`aapt` 确认 `app.morphe.android.youtube` 21.16.256／minSdk 28／targetSdk 36；`apksigner` 报 `DOES NOT VERIFY`（未签名）；**43 个历史产物 SHA-256 前后全一致**（含 N27 坏包本身，未被覆盖）。

**交付**：`build/local-test/patches-1.3.5-本地测试包-n27r.mpp`（1,117,960 B，+179，`5428E17A…`）、`extension-1.3.5-本地测试包-n27r.mpe`（2,727,272 B，+0，`45F2C9B6…`，与 N27 逐字节相同）、`build/n27r-composition-final/YouTube-21.16.256-本地测试包-n27r-unsigned.apk`（196,943,036 B，−4，`31071874…`；未签名确认）；交付 APK 由**交付 MPP 本身**组合、组合后从磁盘重读做新增审计。详见 `docs/N27R-LOCAL-TEST-BUILD.md`。

**真机未覆盖**：**最终 DEX 检查通过，启动修复待用户装机验证**；本卡未签名、未安装、未启动、未采新日志，不写「实测不再闪退」。用户复验顺序：先启动／主页／设置，再普通详情页与横屏全屏显示隐藏控件，然后暂停／旋转／seek／换视频／拖字幕。三项延期语言/文案问题与最终全面本地化/功能说明/诊断英文审计仍为必须步骤，本卡未提前修改。

## 4p. N27r 真机问题、停止避让开发与回退 N26 定案（2026-10-01）

**用户最新决定**：安装N27r并进入视频后，对本期效果不接受，明确停止N27/N27r版本继续开发、项目回到N26交付后阶段；播放器控件避让需求搁置。此决定覆盖§4i第三项的执行安排和所有“先N27避让验收”的旧卡序，不自动恢复。其他八项既定选择、质量基线和延期本地化要求保持；不是取消整个字幕项目。

**N27r结果核对**：E盘HEADcd5d38f，源码4c1d33f，anchor/n27r-4c1d33f指向源码，其后仅docs，开工工作区干净；报告的新标签目标+11→0x1b及最终DEX审计等离线事实保留。用户实际已装机进入视频，本次继续问题不能被离线464/464或84/84视作通过；N27r不标记真机功能验收成功。

**四项真实反馈**：①字幕避让比原生高很多，普通详情页甚至接近顶部；②控件隐藏直接跳回、无过渡；③拖到画面中间偶发停播但UI仍显示播放，暂停键似乎反复触发；④每次开视频有`Debug: Ignoring unplayable video (VISIONOS_1_02)`。截图与说明见`docs/N27R-DEVICE-FEEDBACK.md`。第三项触摸/播放根因本轮未证实，不继续诊断修此版本；第一/二项与现有中央障碍与reset直设translationY行为相符，不再优化。

**VISIONOS来源已核实**：只读查询N26及N27r最终APK，二者都在官方`app/morphe/extension/shared/spoof/requests/StreamingDataRequest.buildPlayerResponseBuffer`含同一debug提示，官方ClientType含VISIONOS_1_02。官方main源码交叉确认它针对客户端响应不可播放、受Debug/DebugToast设置控制。不能说这是N27专属诊断或承诺回退后一并消失；本期不改官方流伪装、客户端、Debug开关，回退后如仍影响播放另行登记，不隐藏Toast冒充修复。

**回退方案固定**：恢复基线7f9c639（N26交付后收尾；与anchor/n26-509d50a源码/资源一致），以新回退提交恢复所有非docs跟踪树，包括运行源码/资源/依赖/构建/测试。当前仅13个非docs路径变化：恢复6个既有文件、删除7个新增文件，完整清单和Git restore范围见`docs/N26R-ROLLBACK-TASK.md`。不reset/rewrite/amend既有历史、不删除旧锚点/交付/证据、不清数据或用户保存位置，不只关开关或注释入口。N27r纯DEX审计源码/已编译工具独立归档，回退后用于最终产物分支检查，不让其N27绑定要求进入产品构建；require-ai=false只表示无N27观察者，AI字幕本身保留。

**当前待办**：N26r卡已准备供用户交DeepSeek执行，代码回退尚未执行、没有新恢复产物。源恢复后非docs树相对7f9c639须零差异；Java回到440/58是授权回退24条N27测试，其他Python27/220×14/冻结4/4/4/84组合与N26类58028核对。最终MPP/MPE/APK无本项目避让类/回调/注入，官方hook保留；归档审计检查invalid_branches0；新产物-n26r，历史N26/N27/N27r全保留。完成即停，用户复验，不继续修N27，也不自派语言阶段。

**N26黄金包实核**：MPP1103820字节，SHA256 `01B80F88B1BE1233C59F184E44814E5A58C8BE49CAB227B54DC186909E0F7588`；MPE2713536字节，`4C0D21FFC946F660FFF444140E8CE4A241F158028E7742399DAF21AA231F985C`；APK196935284字节，`4BC022286C5EC05837F0A170BB4BE1C66AD4F152C596650A2F2871190539FA9B`。原路径分别build/local-test两件及build/n26-composition-final；可按既有签名/安装流程先恢复手机使用，规划者未签名/安装。

**本地截图存档**：E:\Projects\morphe-caption-v2\.verification\n27r-device-feedback\device-feedback-01.jpg、02.jpg、03.jpg及manifest.json，原始临时文件已复制不编辑，便于压缩后恢复。本聊天继续规划/研究/审阅，DeepSeek只执行；两份实时档案同步，旧交接快照不能覆盖此决定。三项延期（入口功能说明、全语种运行时适配、技术诊断英文）未修，仍留最终闭环。

## 4q. 用户授权本聊天直接执行 N26r 回退（2026-10-01，执行中）

用户最新明确“由你直接执行回退”；本次本聊天承担源码回退、测试、构建、交付、提交与锚点，其余阶段默认规划/DeepSeek执行分工不变。VISIONOS_1_02由用户确认N26也存在、官方patch问题且已解决，本项关闭，不再诊断或修改。

开工HEADcd5d38f，恢复基线7f9c639；只存在先前规划者docs管理改动。保护清单在`build/n26r-records/history-before.json`；旧验证工具已复制到`.verification/n26-rollback/audit-tool`（classes/source/manifest），后续恢复构建与测试源到N26也能独立读取最终DEX。当前尚未提交，按实时Git/日志判断执行断点，不重复启动另一个执行者。

下一步：git restore明确模块范围至7f9c639 → 核对非docs源码树 → 清实际模块生成输出并离线测试/构建 → 从交付MPP组合-n26r APK → 独立DEX审计/历史SHA保护 → 更新两份状态、交付记录、提交/锚点。执行过程详细日志在build/n26r-records；没有授权真机安装、签名或发布。

## 4r. N26r 完整回退已执行与交付（2026-10-01，本聊天直接执行）

用户授权直接执行，已从开工HEADcd5d38f恢复到7f9c639（N26交付后收尾；源码509d50a）。恢复6个既有文件、删除7个N27/N27r新增文件，非docs跟踪树/资源/构建/测试与基线零差异；不改Git历史，N27/N27r及旧锚点/产物/证据保留。本次实现提交1b9e429含全部回退源码与交付记录，锚点anchor/n26r-1b9e429指向它；随后仅docs写实，产品树仍与7f9c639相同。

**本次实际验证**：Java以--rerun-tasks --no-build-cache实际执行440/440、58套件、0失败/错误/跳过；Python27/27；本地化220×14（不宣称运行时遗漏解决）；冻结4/4/4、三类不可见时长0且判据/冻结事实未改；从交付MPP组合84/84，selection/structure与N26逐字节相同；常规DEX契约58028类；最终11DEX共321938方法/624507分支invalid0，MPP2单元/MPE1单元分支审计亦通过。宿主构造器只剩原始结构与官方hook7条指令、PC0x0e return，无本卡回调/协调器/事件。verify_bundle/N8Verify/CRC/DEX头/实际资源/aapt与未签名确认通过。

**黄金包一致性**：新MPP根DEX、扩展MPE及全部资源与N26逐字节一致，只有Manifest构建清单不同；新APK全部条目除classes2.dex均一致，该DEX只有官方PatchInfo.PATCH_TIME静态时间值4个数据字节及校验和/签名24头字节不同，无方法指令或其他数据变化。新APK比N26少12字节压缩差额。37/37去重历史保护路径SHA不变，覆盖此前43条保护记录及N27r三件套；同版本旧包不覆盖。

**交付**：build/local-test/patches-1.3.5-本地测试包-n26r.mpp（1103820字节，SHA3A2BE84D9B78FF7F86390CE890095B4F9EFD67312DE7BC57809FA7878EC27BF3）；extension-1.3.5-本地测试包-n26r.mpe（2713536字节，SHA4C0D21FFC946F660FFF444140E8CE4A241F158028E7742399DAF21AA231F985C，与N26完全相同）；build/n26r-composition-final/YouTube-21.16.256-本地测试包-n26r-unsigned.apk（196935272字节，SHAF5A9D242D21FFDFDA5AB9C0849B735A8C38F56CAE50038658B563088F9EBF0D9）。全路径/增量/验证见docs/N26R-LOCAL-TEST-BUILD.md。执行日志与JSON在build/n26r-records；旧DEX审计工具34个文件/classes独立归档.verification/n26-rollback/audit-tool，不进入产品构建。

**用户决策闭环**：VISIONOS_1_02用户明确确认N26也有、官方patch问题且已解决，关闭，不继续诊断或改变官方设置。N27避让需求搁置，当前运行源码回N26；API/profile/字号/位置等用户数据不清除。没有翻译API、依赖/下载、签名/安装/清数据/推送/发布，本次仍需用户按既有签名安装流程复验，不宣称真机通过。三个延期本地化/入口说明/诊断英文问题仍开放；其他语言/菜单规划保留，本任务完成即停，等用户指示。

## 4s. 历史接力安排（2026-10-01；2026-10-02用户取消，以§4t为准）

用户明确按原计划进入第三期。为节省本规划对话/Codex额度，三期、四期及此前三个延期问题都改用接力：Codex承担重要复杂部分，完成实际接入/关键回归后生成DeepSeek任务卡，DeepSeek处理确定性高的收尾；用户收尾完成后回本对话审阅。不要求本规划对话本轮直接编程，也不把接力当并行代理授权。

**本期卡**：`docs/N28-CODEX-CORE-TASK.md`，基线HEADefe1f8c/anchor/n26r-1b9e429，N28尚未执行。Codex负责14语言档案、源/目标/UI分离、实际Session→请求→解析/Review→cache→布局/绘制上下文、Unicode/RTL、中文兼容、检查适用范围、prompt/cache版本和真实候选包/DEX；不能只建表/函数，把实际集成留DeepSeek。

**参数与边界已明确**：中文保留8CPS/既有12–18与黄金行为；非中文reading按可见扩展字素（空格/标点1，换行/方向控制不加），ja4/13、ko12/16、en20/42、es/fr/de/pt/ru/vi/id17/42、ar20/42、hi22/42，CPS/CPL软，7秒软，2行/像素/字素/源窗硬。ja行长全/半1/0.5，ko行长Latin/space/punctuation0.5，不能自动把CPL权重套CPS；旧JSON ko weighted-reading由本卡工程计数定案覆盖。出版社字符单位与工程字素不是认证等价，diagnostics记录counter/version。平台ICU与实际低版本边界由Codex验证，不能声称API28等于最新Unicode18。

**语言范围**：真实代码才决定英语源/中文目标，不凭Latin/Han脚本猜；中英特化仅en→Hans/Hant。通用结构/归属校验保持，其他语种不受中英日期/词法误杀；数字支持明确Unicode十进制等值/单整数不等，歧义UNKNOWN。14主目标外的合法现有菜单语言保留generic软17/42/7秒fallback，不改成中文/禁用；地区码保留实际目标，in别名归id。原生/人工API0、调度与用户存储不变，非中文超读速不单独触发付费修复。

**接力规程**：`docs/HYBRID-EXECUTION-WORKFLOW.md`。Codex交付`N28-CORE-IMPLEMENTATION.md`、真实冻结SHA/版本/预期的`N28-CORE-HANDOFF.json`及必须根据已实现结果生成的`N28-DEEPSEEK-FINISH-TASK.md`。后者本轮不预先虚构生成（真实锚点/命令/预期尚不存在）。DeepSeek只能按卡跑全量回归/固定多语言矩阵、导帧JSON、正式-n28三件套及记录，第三期核心源码/参数/测试冻结不许改。核心故障保留证据回Codex修，更新冻结清单后接续，不能改判据/吞异常/宣称通过。

**第四期与最终三个问题**：第四期Codex承担宿主桥接/签名URL/ownership/排序去重/集合与新UI运行绑定、简中root合并，DeepSeek落逐字批准14语种资源表/固定验证/包。最终Codex承担全UI调用点根因、应用override/fallback/刷新、默认vs用户内容、程序性英文与UI本地化边界和批准文案，DeepSeek同步资源/导帧/全量验证/包；入口说明的小改只需Codex明确表与绑定，再交DeepSeek，不为简单文字再做复杂研发。三个问题仍留功能完成后统一闭环，新功能本身不能继续漏适配。

**当前状态**：本轮只进行只读核对、必要官方标准复核及任务/档案编写，未改产品源码/跑产品构建或测试；工作区管理docs更新须随Codex核心卡提交，两份状态同步。N27避让继续搁置，VISIONOS用户已解决，不再处理。用户推进决定有效，未提供的N26r新真机细节不被虚构成已验收。

## 4t. 撤回未完成 N28 与 Codex 全权负责新安排（2026-10-02）

用户要求此前N28开发全部回到N26完成状态，并明确今后Codex全权负责，不再由DeepSeek执行。本次先执行撤回，没有自动开发下一卡；旧§4s接力模式及旧核心任务卡均失效。

**实际撤回**：开工HEADefe1f8c，仍为N26r的docs收尾，N28没有提交。23个已修改产品/测试文件、9个新增产品/测试文件以及管理docs共35个变更/新增文件，完整归档到`.verification/n28-abandon-20261002/files`及manifest/二进制diff，旧N28日志与中间包一并保留为废弃实验。随后明确restore至7f9c639并删除经hash比对已归档的9个新增源码/测试文件。非docs跟踪树/index/worktree全部与N26零差异，没有未跟踪产品文件；两个模块生成输出clean重建，不动历史根build/.verification。不用reset/rewrite，不清用户配置，不重新启用N27。

**本次实际验证**：Java440/440、58套件、零失败/错误/跳过（--no-build-cache清理后实际执行）；Python27/27、220×14资源，冻结4/4/4与三类不可见0且ACCEPTANCE/frozen文件不改。新MPP根DEX/扩展/所有资源与N26逐字节一致，只有manifest构建清单不同；没有N28或N27新增类。41/41去重历史产物SHA不变。保留N26r APK全11DEX检查58028类/321938方法/624507分支invalid0。使用原N26/N26r三件套，不多生成相同功能的新APK或覆盖旧包；本次没有真机安装、签名、推送或发布。

**恢复记录**：`docs/N28-RESET-TO-N26.md`，本次logs/JSON在build/n28-reset-records，恢复检查点anchor/n26-restored-20261002指向本轮管理提交，产品树保持7f9c639；实际提交45a7cc4，标签指向该管理/规划检查点；其后仅docs写实，无产品变化。已有N26r源码锚点anchor/n26r-1b9e429仍保留。

**当前有效规程**：`docs/CODEX-EXECUTION-WORKFLOW.md`。Codex负责每卡实现、全部关键及全量验证/资源/矩阵/建包/最终DEX/记录/状态；不交DeepSeek，不生成其任务/冻结handoff。下一卡`docs/N28A-CODEX-TASK.md`：新增14不可变档案/语言上下文/Unicode计数边界，在真实AI Session创建时仅元数据记录，现有prompt/request/cache/token/规则/分页/方向等全部不变；整个卡仍须由Codex完成正式-n28a三件套与验证。N28A在本恢复记录时尚未实现；其后完整交付见§4u。

**之后规划**：N28B单独接入规则适用范围、prompt/cache；N28C再做非中文分页/真实测量/RTL，均独立卡/提交/包，上一卡审阅后再发。第四期菜单与最终三个问题继续Codex全责，不能把大阶段塞一张卡并自派。原参数原则仍有效：中文基线保持、非中文速率/CPL/7秒软、几何/两行/归属/字素硬，明确实际语言code、保留地区、未知不猜英语/中文。

**已知与延期**：N27播放器避让继续搁置；VISIONOS官方问题用户已解决关闭；入口功能说明/运行时全UI语种/程序性诊断英文仍开放，功能阶段结束后统一闭环。旧JSON草案/旧卡只作研究历史，不把未经验收的N28归档代码重新复制入生产。两份实时状态同步，本轮只新增管理/任务文档提交。

## 4u. N28A 语言上下文与计数基础完整交付（2026-10-02）

**范围**：基于实际开工 HEAD c771c53、恢复检查点45a7cc4/anchor/n26-restored-20261002，新增 CaptionLanguageProfile/Context/Unicode；唯一旧生产改动是 RebuildController 的14行只读 Session绑定/异常观察。14不可变档案+generic、policy n28a-reference-v1、counter n28a-counters-v1。source取原请求lang，target取已确认Session.target；unknown不猜，地区保留，裸zh未知脚本。日志LANGUAGE_PROFILE_BOUND每新Session一次，签名复用不重复；歧义source观察只记LANGUAGE_CONTEXT_MISMATCH、不修identity。计数器不接入现有请求/规则/分页，中文8CPS和旧Paint/方向/触摸等全部不变。

**完整验证**：原Java440条/58套件与旧fixtures零修改；新增50条，合计490/490、62套件、0失败/错误/跳过。已就绪原文/AI关闭仍API0；有效en→Hans本地MockWebServer实际请求/接受/原生图形分页与精确N26 Controller黄金证据全字段相等：有效prompt/hash、7207字节JSON、缓存身份、原tokens/blocks、页面文本/时段/字号和请求次数。另五组源目标×三种UI locale共15次实际activate绑定，矩阵配置未就绪、不是模型语义质量验收。Python27/27，220×14资源；冻结4/4/4、三类不可见0，ACCEPTANCE/frozen-baseline零diff。除Controller外全部旧非docs blob差异0。

**Unicode证据**：离线已安装Robolectric SDK28 ICU60.2/Unicode10.0与SDK35 ICU75.1/Unicode15.1，26个手写固定边界/计数样例均通过。API28确有Devanagari virama/ZWJ拆分，增加限定辅音范围的小切口安全排除，保留ZWNJ/独立元音反例；不做NFKC、不宣称全Unicode18或整台最低系统验收。reading和CPL halfUnits独立，韩语半权不用于CPS，真实Paint不受新数值影响。

**正式交付与审计**：从-n28a正式MPP组合YouTube21.16.256＋官方1.44.0＋实际Patcher1.14.1，84项PASS，structure/selection与N26一致。MPP72条目、14资源、根patch DEX与N26逐字节一致，独立MPE=内嵌MPE；实际宿主三套XML/14提示/CRC/DEX校验通过，unsigned、minSDK28。归档工具34文件SHA核对后审计MPP2/MPE1/APK11个DEX，APK58034类（仅比N26多三基础类+三enum，零删除）、321988方法/624617分支，invalid/dex_problems/binding_failures均0。N27类/事件/回调0；56/56历史交付/候选路径字节/hash未变。

**三件套**：`build/local-test/patches-1.3.5-本地测试包-n28a.mpp` 1107877字节；`extension-1.3.5-本地测试包-n28a.mpe` 2723188字节；`build/n28a-composition-final/YouTube-21.16.256-本地测试包-n28a-unsigned.apk` 196940044字节。完整路径/SHA/输入/复现/边界见`docs/N28A-LOCAL-TEST-BUILD.md`，所有机器证据在build/n28a-records。

**提交与停止**：实现源码d683e5927191928c335957b3e9fe4fb4816ac518（短d683e59），锚点anchor/n28a-d683e59实际指向该点；一个实现提交，其后只docs写实、不再产品改动。最终HEAD/干净工作区见Git和build/n28a-records/final-state.json。Codex全责完成，没有DeepSeek收尾卡/handoff。两份实时状态同步；未签名/安装/清数据/推送/发布、无远程翻译API或工具/依赖下载。真机、真实多语种自然度、RTL实际几何和全UI遗漏未覆盖；不宣称解决全语种翻译/UI。等待用户/规划者审阅，不自动开始N28B。N27继续搁置、VISIONOS关闭、三项旧问题仍留最后统一闭环。

## 4v. N28A 工程审阅通过、验收方式与 N28B 定案（2026-10-02）

用户反馈N28A不便做真机验收，要求规划者判断下一步。已核对真实仓库、源码diff/新增测试/固定证据、三件套实际SHA及两份状态，未重新运行产品测试/构建。HEADc518823、源码d683e59/anchor/n28a-d683e59其后仅docs、开工工作区干净。

**限定结论**：N28A基础/只读观察范围工程审阅通过，没有本期返工阻断。三个基础类/profile enum＋既有Controller14行只读接入，不影响有效prompt、请求/缓存、分页/字体或RTL；解析对比build/n28a-records/baseline/legacy-activate.json与当期JSON相同，冻结原生产/测试blob与类清单一致；SDK28/35报告明确ICU/Unicode实际版本和限定Indic保护，未称最新规范合规。报告490/490/27/84/DEX等属于执行者提供的测试证据，本规划者没有冒称复跑。三件套实际hash与用户汇报全一致。

**验收方式**：N28A没有预期视觉改善，不能强迫用户“找字幕变化”或人工逐语种核算字素；允许凭其范围内自动化+真实调用/实际产物证据继续B。手机启动/系统兼容和母语自然度仍未验证，可在已安装时顺手做日常中文/启动回归，但不是开B的强制前置。首次完整可见多语种呈现对照集中N28C之后，不把离线接受说成已通过手机验收。

**下一卡**：docs/N28B-CODEX-TASK.md，基线c518823/anchor/n28a-d683e59；Codex全程实现、关键/全量验证、最终MPP/MPE/APK/DEX与提交/状态，尚未执行。复用A语言上下文→strict Session/Job范围→请求/payload/prompt→parse/review/numbers→cache读写重验；只有明确English→Hans/Hant中英特化，unknown/script不猜；known源变化/duplicate变UNKNOWN不能再仅观察而复用冲突scope；cold/warm、旧Job、地区码、默认来源/自填保护都必须实际验证。

**B兼容/风险边界**：英文→中文固定样本有效prompt/request/hash、source tokens/blocks、旧cache空间保持；neutral pair不套中英字典/日期/片段误杀，明确Unicode整数等值与简单不等、歧义UNKNOWN。程序默认/自填provenance只在内部请求语义需要处新增只读元数据，不改存储/显示文案/全面迁移。新scope版隔离非中文旧cache，所有网络/cache/repair生产入口都显式context。B会改变其他pair请求与审查、可能影响译文，但分页/字体/真实几何/RTL仍冻结，旧8CPS导致空页是N28C已知待办，不让B假称多语种呈现完成。

**对应文件**：docs/N28A-REVIEW.md（只读结论/验收安排），docs/N28B-CODEX-TASK.md（具体执行方案/范围/矩阵/产物），CODEX-EXECUTION-WORKFLOW已补工程与真机验收区别。本次只写上述管理文档，未改产品源、未安装手机/签名/推送。两份状态同步，规划改动后续随B提交，避免执行者回滚成“待A真机确认”。

N27继续搁置、VISIONOS已由用户解决；第四期菜单及最终summary/全UI多语种/程序性诊断英文三项问题顺序保持。Codex-only分工不变，不再交DeepSeek，不自动执行N28C。用户不承担14语种母语语义认证，客观呈现与语义自然度分开。

## 4w. N28B 完整工程交付、真实生产策略与停止（2026-10-02）

**施工/来源**：Codex独立负责本卡全部实现、关键/全量验证、建包、交付、提交和两份状态。开工HEADc518823，N28A源码d683e59/anchor/n28a-d683e59；规划者CODEX-EXECUTION-WORKFLOW、PROJECT-STATE、N28A-REVIEW、N28B-CODEX-TASK四份变化保留。没有恢复撤回旧N28源码/改动测试、没有DeepSeek收尾。源码与锚点 d02d7ccefbd3847d7c1df3b0306e22a3a14429f0（短d02d7cc，anchor/n28b-d02d7cc）（首次实现提交后docs-only写实）。

**实际实现**：n28b-policy-v1不可变context在Session复用决策前确定，Job持有同对象；request/prompt/payload、parse/Review/Semantics/Numbers、cache读写重验与repair比较显式scope。源为当前已绑定请求的唯一有效lang，UNKNOWN/duplicate/非法不猜English；完整地区/脚本保留，确认中文别名的实际metadata与旧Session.target分别保留。源/目标/policy/有效自填偏好变更独立身份；签名同scope复用，已发旧HTTP可完成，但无旧Job发布或新scope cache串用。无有效target不创建翻译Session，sourceOnly/人工/native/AI关闭实际provider0。

**兼容/范围**：明确English→Hans/Hant为legacy_en_zh，旧PROMPT/FIDELITY/有效表达/hash、payload/request/schema/hint、tokens/blocks、页面/时间/字号和旧cache保持；generic zh、其他Latin、UNKNOWN和Japanese纯Han不套中英词表。中立模板保真、完整命题、source-owned quote/ID全覆盖，无领域例句或泛化长度指导；程序默认provenance仅只读内部请求元数据，自填/存储/显示/保存/Keystore/profile不改。新中立cache包含实际source/target/policy/有效偏好/provider，旧非中文自然隔离且原文件保留；UI默认变化不破坏中立cache，legacy UI默认参与fingerprint行为保留。Unicode Nd完整十进制整数数值等值及简单不等可确定；日期/小数/范围/多数字/数量级/单位/书写数字UNKNOWN有观察，不假称语义100%。规则逐条见N28B-RULE-SCOPE.md。

**冻结/差异**：分页/CaptionOverlayV2/LayoutBudget/字号/FontMetrics/RTL/触摸、native菜单/桥/字节码指纹、源word/token/time/静音/speaker、调度/槽位/storm/超时/重试额度、provider鉴权/参数与所有持久化值保持；27份patch/资源及ACCEPTANCE/frozen blob与A一致。非English soft request seam可用中立标点/既有边界：固定240token样例3blocks→2blocks，原tokens/text/250ms时间完全一致，非呈现算法改动。presentation_policy=legacy_n26；新CPS/CPL/7000ms未影响页面，旧CPS>8空页仍为N28C项。

**验证**：Java538/538（65套件，原490＋48，0失败/错误/跳过），Python27/27、本地化220键×14、冻结4通过/4既有失败/4未验证，pending_translation/event_review/overflow不可见0。用户明确批准更新两个冲突N28A观察期断言（strategy与duplicate复用）；两个旧固定英中fixture类只补三处显式scope参数，原断言/fixture保留。真实activate→source→Job→local MockWebServer→parse/review→write→read→Controller接受，68行policy-trace-matrix.json；source/target/UI/实际prompt/key hash、network/cache/calls/拒绝观察齐全且无密钥，远程翻译API0。en/en-US/en-GB×6中文写法18组独立N28A源码黄金逐字段一致；冷暖/UI/签名/known→UNKNOWN/目标地区码/迟到/默认与自填/Unicode数字/歧义/ID/quote/silence/speaker硬约束/provider0均覆盖。不是手机或母语质量认证。

**组合/DEX**：本次交付MPP＋YouTube21.16.256＋官方1.44.0＋实际Patcher1.14.1，84/84；structure/selection与A相同。MPP72条目、根patch DEX/全部资源与A一致、独立/内嵌MPE相同。34个归档审计工具文件SHA一致，--require-ai false只排除N27 observer，正常AI仍启用。实际11DEX/58036类（A58034→B58036），新增4/移除2仅enum/合成lambda与重排；MPE1417→1419，完整清单保留。接口及branch审计PASS，invalid_branches/dex_problems/binding_failures均0，N27类/事件/回调0，损坏branch自测拒绝。

**三件套**：build/local-test/patches-1.3.5-本地测试包-n28b.mpp（1112063字节，SHA93B8A2BA6B2C1127B7DC928F0187D4A476C7CF7FCB233CAD5117651EF79FFB91）；extension-1.3.5-本地测试包-n28b.mpe（2732120字节，SHA15C0703670BE698B9EE931FDF174BF9751895D7F6831E4597D67FB307E8C1845）；build/n28b-composition-final/YouTube-21.16.256-本地测试包-n28b-unsigned.apk（196945780字节，SHAD36DCB776FD61240F5F3103481B60E45B2B60E59137DA20AC7D21CB4851DD0A4）。所有路径相对E:\Projects\morphe-caption-v2，完整报告N28B-LOCAL-TEST-BUILD.md；build/n28b-records保留实际测试/golden/trace/输入/DEX/资源/候选/签名/hash证据，历史三件套保护不覆盖。初次候选B包保留records/candidates，正式组合绑定最终local-test MPP。

**停止/验收**：本卡完整结束待审阅，不自动开发N28C，不交DeepSeek；两份状态比对后同步。未做真机启动/安装/视觉/母语审校，不声称翻译自然度改善、完整多语种呈现/UI/RTL可用。工程节点不强制用户逐语种视觉验收才能继续；完整可见多语种真机检查集中N28C后。未签名/安装/清数据/推送/发布、无下载/远程翻译API。N27搁置、VISIONOS已解决关闭、第四期菜单与三个summary/全UI本地化/技术英文遗留顺序保持。

## 4x. 历史N28C死锁阻塞记录（2026-10-02；修复交付/审阅见§4y）

N28C当前保留未提交产品改动，报告专项44/44、中文golden、14目标冷/热几何矩阵和Python/localization通过，但最终579全量未完成；正式三件套、84组合、最终DEX/branch/aapt/apksigner未执行。`build/n28c-records/test-worker-observation.txt`明确发现1个Java死锁：停止线程持Controller class lock等待Session lock；调度线程持Session lock等待Controller class lock。N28B源码锁路径对照尚未证明纯N28B运行不会复现，不能简单归因给N28C，也不能继续以重复重跑/禁用测试掩盖。

**真机判断**：N28B仍保持legacy_n26呈现，N28B核心为请求/规则/cache，已有中文golden、cold/warm/迟到Job/trace自动化证据；不需要把N28B真机作为N28C前置。用户可以可选安装N28B做中文启动/播放/换视频冒烟，有异常再给诊断，不需要逐语种理解。不安装当前N28C，因其未正式交付且死锁未闭合。

**下一步**：先执行`docs/N28C-DEADLOCK-ISOLATION-TASK.md`。Codex必须保存当前N28C快照、建立只读N28B baseline对照、用硬超时/JVM MXBean或jcmd捕获同一复现，逐段检查stop/cancel/retire/current/schedule/kick/translate的锁顺序；判断是N28B既有阻塞还是N28C接入引发。未完成根因和修复回归前不打包/签名/安装/第四期。

**修复停止线**：不允许吞异常、增无限超时、删测试、放宽判据；优先取消锁内跨锁调用/使用两阶段快照，保持N28B调度、cache、ownership、重试和中文golden不变。修复后并发回归覆盖stop/换Session/迟到HTTP/cache/source失败/测试清理，最终579全量、84/DEX/历史hash都通过，再交用户做C的真机客观观察。

**当前未完成事项**：N28C未提交/无锚点/无正式包；N28C卡面原开工HEAD8e28f4b与实际26692ed的docs-only差异已经确认不构成产品基线错误，当前代码快照由N28C记录保留。Codex全权负责，不交DeepSeek。N27继续搁置、VISIONOS关闭、最终三个summary/UI/诊断问题留最终闭环。

## 4y. N28C修复交付审阅与R1真机放行前修订（2026-10-02）

**已交付事实**：用户报告C死锁修复完成并正式交付，实际Git核对核心4d98eec20f9f9d1d9a8b2bf0e52934cade8d93b0、anchor/n28c-4d98eec，最终HEADce372cf4100a3a9af27ae0c1bcb5779341845221只有根因/交付两文档差异，开工工作区干净。三件套实际SHA/字节均与报告相同：MPP1122526/E5AD4D348F235523488436466D9ED9D20B7104C963544DA671381B9259F34FFD；MPE2752676/877014E05618B54E321FAA34DE52CE5461747AA1594A642AF3C599F312BA5103；APK196956968/8260BEEC8BE026ACDE107F6FA28586DD693C5EE2326DC68E1963CFA9C9F6F9DA。最终源码和包不是旧首轮候选。

**原锁环证据认可**：原纯B/C各2/2确定性死锁证明是已有B基础问题，不能靠回退B修；基础修复B550/550、C591/591（旧579＋K12）/400轮、18golden、44专项、14冷热/40几何、Python27/220×14/冻结4/4/4、84组合及11DEX/58047类与权限/锁协议报告有实质对应。调度保留focus2/prefetch2/总4正确，不按旧卡数字错误改为1。报告debug/release11class一致、C/S/connections monitor无嵌套、许可CAS/撤销/旧UI保护可接受为原锁环解决证据；不是手机验收或所有生命周期风险保证。

**规划审阅发现1（真实手机故障未复现）**：UI设置开关→QuickToggle→refreshConfiguration→Controller.stop，以及native关闭/切目标，可能同步走Session.finishRetirement→Publication.drain。未完成permit时await最多5秒并抛IllegalStateException；现有drain回归stop在后台线程，不证明main不卡/超时无未捕获异常。需main Looper受控屏障回归，再将立即撤销/旧UI失效与后台物理收尾分离；CAS/旧scope/同key排序/原锁环防护保持，不靠catch吞掉或延长等待。Android官方将主线程等待长后台操作列为ANR风险，不声称本机已发生ANR。

**规划审阅发现2（已有JSON证据）**：CaptionLanguagePager只要求正毫秒；geometry-matrix40个多页案例含<1200ms，一段1000ms事件拆421/579ms；生产trace24个多页记录、presentation trace35个记录含短页（有283ms）。独立只读遍历保存.verification/n28c-review-20261002/short-pages-review.json，没有重新跑产品测试。原新C测试只检查正页长，不能代表人可读性。旧规划1.2秒/短窗单页在简化C卡未写清，本轮补为明确合同，不把这归咎删旧测试。

**当前结论**：原锁环修复与工程交付证据认可；N28C整体仍不放行手机/第四期。先docs/N28C-R1-CODEX-TASK.md：UI请求立即撤销/响应，不等物理文件工作；后台显式barrier语义/超时处理受控，不能异步旧提交覆盖新同key；非中文通常最短页1200ms，整个源窗不足则只完整单页，≤7s全文fitsTwo优先单页，多页时间容量严格。不引入8CPS硬拒，保留中文golden/source归属/Unicode/几何；新presentation版本隔离非中文v1cache，不清中文或原cache。

**下一步与用户负担**：本轮未修产品/未构建/未安装，只编写N28C-REVIEW.md及R1卡并同步管理状态。由Codex完整执行R1、实际并发/main回归与新增最短页/14矩阵/full591＋新增/84/最终DEX/hash，独立-n28c-r1交付与锚点，当前C历史保留。R1完成后才做一次少量中文/播放/RTL/版式/不闪页真机；用户只提供诊断/时段，不读14语种语义。不需要再装已知旧锁环的B作本次排查，不把冻结4/4/4包装成全质量通过。

**证据索引**：docs/N28C-DEADLOCK-ROOT-CAUSE.md与N28C-LOCAL-TEST-BUILD.md顶部当前修复记录、其后原失败历史保留；实际数据目录.verification/n28c-scheduler-fix/2026-10-02T05-46-38-772884Z/delivery-records，统计与本轮分析在.verification/n28c-review-20261002。新执行参考HEADce372cf/源码4d98eec，之后docs-only允许直接记录实际HEAD，不再次无谓询问；真正源码差异才停止核对。

N27仍搁置、VISIONOS用户已解决，最终summary/UI多语种/程序性诊断英文仍开放，Codex-only分工不变。当前R1仅任务准备，尚无新源码或包。

## 5. 已确认的关键决策

- **字号五档制（N19）**：见文首决策块。旧的单一 r（203bps）与连续滑块范围作废。
- **分页风格（N15r）**：偏好 12–18 字/2–3.5s、硬上限两行/CPS≤8、硬下限≥1.2s、刀口只在语义接缝、页数上限由窗长推导；全片对比改后中位 16 字/3.468s、一行 86.3%、12–18 字页 41.6%、零硬违规。
- **设置预览（N17d）**：单幅满宽 16:9 横屏，字高按 N19 的全屏比例渲染。
- **review risk=0 ≠ 语义正确**（N13b 实证）——真机目检不可省略。
- **成本**：第三轮真机 9,709 tok/观看分钟；全片捕获一次性 32 万 tok（N15r 授权）。

## 6. 待办队列

> 当前队列以最新§4ay/N35完整时间链定案为准，N33已短验、N34已工程交付；下列历史队列保留作审计，不代表继续执行N31/N32或N27。

当前优先级以§4ad为准：先N30完成N29手机反馈的确定性修正、等待/转场稳定、AI设置内多选语言菜单和最终本地化/技术诊断英文；随后只做一次短真机复验与发布来源预检。旧R2卡和N29任务列表是沿革，不据旧HEAD或旧官方版本重启已完成任务。

**当前推进：C原锁环修复和正式包已交付；规划整体审阅未放行，先docs/N28C-R1-CODEX-TASK.md处理main同步等待风险与非中文短页。R1未执行，手机不必现在随机测试，第四期暂不发。**

- ~~N17a 修复卡~~ ✅ `d40cfa3`（孤字页 ≥8 汉字格硬门槛）。
- ~~N17b 字号架构卡~~ ✅ `640905c`（后被用户推翻）。
- ~~N17c v2 字号重标定~~ ✅ `2ddfa14`（已被 N19 覆盖）。
- ~~N17d 预览简化卡~~ ✅ `00f53c8` 已审阅通过（设置页样式预览只保留满宽 16:9 横屏；14 语种文案同步；Java 388/388、Python 27/27、API 0）。
- ~~N18r 重建包卡~~ ✅ `581112b` 已审阅通过（YouTube 21.16.256 + 官方 1.44.0 + Patcher 1.14.1；84/84 PASS；三产物 mpp 1,051,347 / mpe 2,681,016 / apk 196,792,087 字节；未签名确认；API 0）。**该包不含 N19 改动。**
- ~~N19 字号五档卡~~ ✅ `10e9c85` 已审阅通过（五档 34/39/44.5/50/56、默认标准 44.5、全屏 ×1.247、预览按全屏比例、旧值迁移；Java 394/394、Python 27/27、14 语种 ×129 keys、API 0）。
- ~~N20 字幕文案与档位可视化卡~~ ✅ `c124fb5` 已审阅通过：A 部分等待类显示“翻译中…”、失败与拦截留空、`[原文 / Original]` 与 `caption_overflow` 全链路移除（主源码与 14 语种资源零残留）、源/配置类提示保留、诊断字段逐项保留（空白仍打点且去重）；B 部分滑轨 5 刻度 + 档名行，审阅者像素实测刻度中心等距 72–73px、档名中心偏差 ≤1.5px、当前档高亮、档名行无 px。Java 402/402、Python 27/27、14 语种 ×129 键；被删断言 11 条全属原文兜底类，新增断言 90 条；A10 整行与历史证据列未动。
- **审阅发现（N20，三项均非阻塞）**：**F1（建议修）** ACCEPTANCE 的 A01/A13“可自动检测的判据”列在替换时削薄了证据纪律——A01 丢了“不得用预装全部响应制造‘启动通过’”与冻结值 `event_end − first_caption_time`（3.845 秒）引用，A13 丢了“锁定源词归属、状态抢跑和 0ms 状态独占的离线策略镜像；真机待验”；**F2（可顺手修）** 空白/等待态持续时预绘制监听每 ~100ms 走一次完整 render（identity 非空且 anchor 为 GONE 使早退不成立），可见行为不变、仅属无谓文本测量；**F3（记录）** `render()` 中 `String source` 成死变量、`fallback` 恒为空，且“仅原文”模式不再带 `[原文 / Original]` 前缀（模式本身保留，测试已同步）。
- **审阅补充（N20 后专项核查，用户提问：暂停是否翻页 / 无原字幕段是否残留）**：**暂停**——时钟 `RebuildClock.position()` 仅在 `STATE_PLAYING` 按速度外推，`STATE_PAUSED` 直接返回上报位置并清掉累积外推，80ms tick 重算分页索引，故暂停期间**不会因时间推进而翻页**；位置越过末页 `end` 后 `RebuildPageLayout.indexAt` 返回 -1 → 空白并隐藏视图。两个例外（均非时间翻页）：① 暂停期间当前区块的译文/修复响应到达会重建分页，屏上文字随之变化（正在等待占位时属期望行为）；② 恰好停在页边界且播放器上报位置有 ±1 帧抖动时（暂停分支无死区）理论上可能来回跳一次。**空档**——静音 ≥650ms 是硬边界：`RebuildPlanner.boundary()` 用它切块，`RebuildProtocol` 对事件做结构硬拒（`crosses_source_break`，且属 `RebuildReview` 不可放行类），故跨静音事件上不了屏；位置落在无 cue/无事件的空档时控制器每 tick 重算得到空串 → `CaptionOverlay.hide()`，N20 后空串统一 `hideView()`（视图 GONE）→ **不残留上一句、不留空字幕框**，最坏 ~80ms 残留（tick 周期）。边界说明：<650ms 短停顿视为连续语音（有意），词级时间全为 `ESTIMATED`（cue 内均匀分配），边界精度受 cue 时间精度限制。
- ~~N21 缓存命中调查卡~~ ✅ `c5f3f57` 已审阅通过（审阅者独立重跑：50 套件 / 405 测试 / 0 失败 / 0 错误 / 0 跳过；`.verification/n21/cache-lookup-output.txt` 13 次 `N21_LOOKUP` 全部 `miss_reason=file_not_present`、namespace 无漂移、且自标 `key_scope=partial_source_and_fixture_config_not_device`）。**裁决 (b) 设计内行为**：块 key = 协议版本 | 配置 fingerprint(baseUrl+model+prompt) | 目标语言 | 生效 prompt SHA | **整片全部源词**（文本/起止/精度），文件名另含块序号与词区间；不含 API key、视频 ID、session/generation；零风险计划在 `ACCEPTED` 前同步落盘（临时文件 + fsync + ATOMIC_MOVE），风险非零不写盘；上限 256 块/64MiB 按写入时间淘汰、**无 TTL**；源缓存为独立子目录。12 次记账 = 启动 1 次查 2 块 + 后续 11 次各查 1 块，13 missed units 与逐块文件读取一一对应；三次修复不再查盘。**同 session 拖回复看走内存复用、不查盘，故 `hit blocks` 本可恒为 0；`current block hits` 两处调用点均传 `false`，结构上恒为 0，不得用作判据。** 无需修复、无需清缓存。
- **第三轮真机清单第 4 项程序修正（依 N21 证据，判据 `hit blocks > 0` 不变）**：改为“**新会话**复看”——同包先看一段至 `REBUILD_EVENTS_ACCEPTED;review_risks=0` 且无 `REBUILD_CACHE_WRITE_FAILED`，**保留 app 数据与缓存**，重启 app 或退出重进同一视频（须见新的 engine session/启动链），保持模型/base URL/prompt/目标语言与源轨不变；首两块看 `REBUILD_SOURCE_READY.cache_hits>0`，懒读块看 `REBUILD_CACHE_RESTORED;block=…;network_calls=0`，汇总 `hit blocks` 必须 >0。同 session 拖回仅算“未执行盘命中验证”，不得据此翻绿；不得用 current block hits、提供商 cached tokens 或仅 `REBUILD_REQUEST` 判定命中。
- ~~N21b 微修卡~~ ✅ `66c1e00` 已审阅通过（审阅者独立重跑：50 套件 / **413 测试** / 0 失败 / 0 错误 / 0 跳过）。五项逐条核对：① A01 判据补回请求时序、防预装“启动通过”与冻结值 3.845 秒引用，A13 补回源词归属/状态抢跑/0ms 独占镜像条款，并追加 N21b 签字记录；② 死计数器 `unit_cache_current_hits` 已删（形参、两处 add、摘要片段一并移除），摘要行现为 `Request-block disk cache: lookups 12 · hit blocks 0 · missed units 13`，取证测试改为断言字段不存在；③ 空白态早退用 `lastBlankIdentity` 实现，同一 identity 且视图 GONE 时跳过文本测量，新空白 cue 仍各自渲染与打点；④ `render()` 死变量 `source` 与恒空 `fallback` 清理，`showEvent` 形参语义保留；⑤ 暂停期位置粘滞落地——`pausedDisplayPosition`/`pausedHookState` 随 session、cancel 清空，`displayPosition()` 只影响显示与分页（`s.position` 调度时钟不变，诊断 `time=` 记原始观测值），非暂停态一律清冻，显式 hook 优先于抖动，1500ms 严格安全阀，并已按契约补齐四条取证测试（页面边界抖动 16ms 的真实回归夹具、恢复推进、暂停 seek 立即生效并递增 generation、换 session 清冻），另覆盖全部非暂停态与缺状态清冻。
- **遗留文档小瑕疵（F4，不影响判据与产物，随时可顺手修）**：ACCEPTANCE.md 的 A14 行仍写“N9 原文兜底已有 Java 单测与离线镜像”，而 N20 起该窗已改为留空；建议措辞改为“该归属窗留空已有 Java 单测与离线镜像”。**不改判据语义，故不单独开卡**，与后续任一改文档的卡一起处理即可。
- **N23 合并卡**：✅ `45a830a` 已完成（滑条一致性 + C 原生黑块修复 + D 频跳调度），**B 段两条护栏修正已被 N24 按用户决定撤销**；锚点 `anchor/n23-45a830a` 保留（不推送）。
- **N24 执行卡**：✅ `9049591` 已提交并打标签 `anchor/n24-9049591`（不推送）。四段全部完成，详见 §4g 与 `docs/N24-LOCAL-TEST-BUILD.md`。**质量行为已回到 N22**（`RebuildReview` 与 `a482262` 逐字节一致），N23 的 C/D 工程改进保留且 D 段升级为有界调度（前台 2 路 / 后台 2 路 / 总 4 路 / 最新待办替换 / 两路预取生效）。测试数 421→429。产物 `-n24` 三件套与 84/84、`DEX_AUDIT_PASS classes=58028` 见 §4g。
- **N25 执行卡**：✅ `99e7be5` 已提交并打标签 `anchor/n25-99e7be5`（不推送）。四段全部完成，详见 §4h 与 `docs/N25-LOCAL-TEST-BUILD.md`。测试数 429→**437**，本地化 129→**220 keys × 14 语种**，产物 `-n25` 三件套与 84/84、`DEX_AUDIT_PASS classes=58028` 见 §4h。**未改**：翻译提示词、`RebuildReview`、语义分块、协议校验、重试与分页算法、前台2／后台2／总4 调度、源词时间归属、字号五档与 55.5/44.5 缩放、缓存键、用户自填配置；ACCEPTANCE.md、冻结计分板与历史诊断证据逐字节未改。
- **N27r 修复卡（历史，用户决定撤回）**：已执行完毕并交付 `-n27r`，用户装机进入播放后发现效果问题，需求搁置、回退N26待执行（§4p），详见 §4o 与 `docs/N27R-LOCAL-TEST-BUILD.md`。生产注入改为 `ExternalLabel` 绑定真实 `return-void`（`signed_offset` −3→+11、target 0x0d→0x1b），新增仓库内最终 DEX 分支审计并接入既有 `:patches:auditComposition`；旧 N27 坏包被直接拒绝。测试数 **464/59 未变**（新增回归以 `patches/src/test/kotlin/validation` 入口落地，非 JUnit）；MPE 与 N27 逐字节相同。**未改**：N27 协调器 Java、Overlay、HookV2 显示算法、8dp/100ms/200ms、五档字号、分页/正文/时间归属、原生与 AI ownership、缓存、调度、API、语言策略及全部用户持久化值；ACCEPTANCE.md 与冻结证据逐字节未改。**四阶段顺序不变**，下一阶段仍是语言档案/计数/方向及接入，本卡不执行、不自派。
- **N27 执行卡（历史，需求搁置）**：⚠ 已交付但用户真机启动闪退、未验收（见§4n/§4o）；已提交并打标签 `anchor/n27-62c4916`（不推送，指向含全部源码与最终文案的提交；本条状态补记与文档收尾为其后的独立提交，源锚点与 HEAD 的关系见下）。五段（可见性输入与运行时接入 ＋ 已确认控件与坐标 ＋ 避让算法与动画 ＋ 渲染/拖动/生命周期整合 ＋ 英文诊断与离线验证）全部完成，详见 §4m 与 `docs/N27-LOCAL-TEST-BUILD.md`。测试数 440→**464**（套件 58→59，新增 `N27ControlsAvoidanceTest` 24 条），产物 `-n27` 三件套与 84/84、`DEX_AUDIT_PASS classes=58034` 见 §4m。**未改**：正文、页索引与时间归属、字体大小/样式、API 协议/调度/重试、原生与 AI 轨道 ownership、缓存、菜单、语言策略、设置入口及全部用户持久化值；翻译提示词、`RebuildReview`、语义分块、协议校验、分页算法、`LayoutBudget`；ACCEPTANCE.md、冻结计分板与历史诊断证据逐字节未改。**四阶段顺序不变**，下一阶段是语言档案/计数/方向及接入，本卡不执行、不自派。**源锚点 `anchor/n27-62c4916` 指向源码与最终文案提交；其后仅有把本行占位短哈希写实的状态补记提交，不含任何源码或文案改动。**
- **N26 执行卡**：✅ `509d50a` 已提交并打标签 `anchor/n26-509d50a`（不推送，指向含全部源码与最终文案的提交；本条状态补记与文档收尾为其后的独立提交，源锚点与 HEAD 的关系见下）。三段（入口迁入视频页 ＋ 入口样式与同页普通项一致 ＋ 预览说明改全屏）全部完成，详见 §4j 与 `docs/N26-LOCAL-TEST-BUILD.md`。测试数 437→**440**（套件 56→58），产物 `-n26` 三件套与 84/84、`DEX_AUDIT_PASS classes=58028` 见 §4j。**未改**：播放器与避让、翻译提示词、`RebuildReview`、语义分块、协议校验、重试与分页算法、调度、源词时间归属、字号与几何、缓存键、用户配置存储、诊断 raw 格式、`preview_sample` 与预览交互；ACCEPTANCE.md、冻结计分板与历史诊断证据逐字节未改。**四阶段顺序不变**，下一阶段是常规详情页／横屏全屏的播放器控件避让，本卡未启动。**源锚点 `anchor/n26-509d50a` 指向源码与最终文案提交；其后仅有把本行占位短哈希写实的状态补记提交，不含任何源码或文案改动。**
- **N24 真机验收清单（用户本人执行；发现问题只记录不现场改）**：
  1. **滑条两端**：拉到超小/超大档，确认两端刻度点落在可见轨道两端，thumb 中心压在刻度上，档名与刻度对齐；两条滑条等长、同左右边距、同取色。亮/暗主题、RTL 布局各看一次。
  2. **全屏预览比例**：设置页预览标题应为「横屏全屏预览」；字幕占画面比例应与真机全屏一致；切五档与拖动透明度时即时更新、示例句不被截断。
  3. **字号文案**：标题为「字号」（无「（详情页）」）；字号滑条标题行右侧无 px 数值；下方档位说明仍显示「详情页 xx px · 全屏 xx px」；**透明度条右上角百分比保留**。
  4. **原生黑块**：频跳与等待期观察是否仍出现无文字原生底框（N23 C 段效果）。
  5. **等待表现对比（D 段核心）**：未缓存落点记录 `REBUILD_WAIT_BREAKDOWN` 的 `slot_wait_ms` 与 `network_ms`（重点：旧前台阻塞时新落点是否不再排在其后，即 `slot_wait_ms` 是否不再是秒级）；停止频跳后到第一条译文呈现的时间；缓存命中时 `REBUILD_CACHE_RESTORED` 的恢复时间；请求数（`REBUILD_REQUEST` 计数）与 token 消耗。**离线不做延迟改善承诺，以上为真机待验证项。**
  6. 缓存命中（**新会话**复看，程序见 §6 N21 行）：首两块 `cache_hits>0`、懒读块 `REBUILD_CACHE_RESTORED;network_calls=0`，汇总 `hit blocks` 必须 >0。
  7. 既有第三轮补测项（字号五档逐档、A15 845s 后、A16 84.1s 抽查、视频比例不变性、评论区边界、85.jpg 疑点）继续按 §6 清单执行。
- **L 线（自动翻译语言菜单多选）**：**等 N25（或 N24）真机验证通过后，从新锚点 `anchor/n25-*` 开分支 `feature/lang-menu` 开发**（原计划的 `anchor/n23-*`、`anchor/n24-*` 起点依次作废）。改由新开的 DeepSeek Harness 对话承担规划与审阅；覆盖范围=本 patch 的 14 个 UI 语种；**不承诺任何语种的译文质量**（用户 2026-09-30 决定），只承诺版式合规与平台可用。详见 §7b/§7c/§7d。
- **N22 重建包卡**：✅ `a482262`（三产物 n22：mpp 1,054,972 / mpe 2,687,056 / apk 196,797,207 字节；锚点标签同卡创建）——已由用户在 2026-09-30 真机验证（见 §4d）。
- **第三轮真机补测清单（用户本人，用 N22 新包执行；发现问题只记录不现场改）**：
  1. 字号五档逐档核对：详情页 34/39/44.5/50/56px、全屏 42.4/48.6/55.5/62.4/69.8px（全屏=详情页×1.247）；默认档应为标准 44.5/55.5。量法：原分辨率截图、单字窗口、只量实心字（不算黑框/阴影/描边）。
  2. 预览一致性：设置页预览中字幕占画面比例应与真机全屏一致，切档即时变化。
  3. 文案行为：暂停/启动/拖动进度条时**不得**再出现“字幕过长，原文暂不可用”或 `[原文 / Original]`；等待期只显示约定占位。
  4. 缓存命中（程序见 §6 N21 行）：**新会话**复看，首两块 `cache_hits>0`、懒读块 `REBUILD_CACHE_RESTORED;network_calls=0`，汇总 `hit blocks` 必须 >0。
  5. 孤字页复查：84.1s、125.6s 两处应无 <8 格页 —— **125.6s 已复验通过（§4d），84.1s 段落本轮未见碎片页**；A06/A10 位置（约 183s 起）排版；大字档（大/超大）分页是否退化。
  6. A15 补看：845s 后 b109 块行为（本轮只看到 616s，**未覆盖**）；A16 位置（84.1s）译文抽查（本轮方向正确）。
  7. 视频比例不变性：同方向切换不同宽高比视频，字高应不变。
  8. 评论区边界：收窄 >20% 缩放、关闭恢复；进入时已打开的现象记录（已知边界）。
  9. 控制层采集（为 T3 供料）：三形态点按露出/隐藏控制层，记录进度条遮挡与截图。
  10. 85.jpg 疑点定案：同一视频 36.9–39.9s 暂停同画面，分别关原生 CC / 隐藏插件叠层各截原分辨率图对照（程序见 `docs/N17c-FONT-RECALIBRATION.md` P6 节）。
- **T3 控制层上抬小卡**（第三轮控制层采集信号后补）：播放器界面露出时字幕上抬让进度条，隐藏回落，系统默认短动画。
- **发布流程**（第三轮真机通过后另议）：版本号/CHANGELOG/semantic-release；不得覆盖 v1.3.5 资产。

- **待用户拍板 ①（登记）**：两处译文问题是否登记进 ACCEPTANCE —— 327.0–331.2s 中心词漏译（建议登记为新案例）与 384.6–391.7s A14 主语错接复发（建议登记为 A14 证据升级）。根因见 §4d 第 9 条；不登记则仅保留观察记录。
- **待用户拍板 ②（新版式议题）**：§4d 第 1 条观察——166 正文页中 66 页 >4s、最长 9.71s，超 Netflix 单事件 7 秒上限；是否立"长事件按时间再分页"卡，由用户决定。
- **预期管理（已建议写入说明文案）**：块级翻译 + 远程模型的架构下，跳到未翻译位置必然要等一次模型往返（实测中位 2.7–4.4s）；N24 的 D 段已把**调度层**的排队（旧前台串行阻塞、无界线程池争抢、预取预算不生效）按 §4g 修掉，但只能把等待压到接近单次往返，做不到"跳过去立刻有译文"，也**不代表网络往返本身变快**。

## 7. 提交序列（morphe-caption-v2）

`c67d63b` 基线对齐 → `fb41189` 验收表+计分板 → `c198c21` N2 → `dc24b7e` N3 → `1ecb662` N4 → `a97bbae` N5 → `7ecc94c` N6 → `4d3e97f` N7 → `c3af18d` N7b记录 → `f360a12` N7b回滚 → `a31f778` N9 → `a1c0541` N10 → `932d24d` N11 → `f2c3aa9` N12 → `5b51c8b` N13 → `d67e8e1` N13b → `a063e47` N14 → `30deae4` N15 停止记录 → `cd97869` N15r → `33c288e` N16 建包 → `d40cfa3` N17a → `640905c` N17b（被推翻）→ `cc29229` N18 旧包（作废）→ `2ddfa14` N17c v2 → `00f53c8` N17d → `581112b` N18r 重建包 → `10e9c85` N19 五档字号 → `c124fb5` N20 字幕只显译文 + 字号档位可视化 → `c5f3f57` N21 块缓存 0 命中离线取证 → `66c1e00` N21b 判据补回 + 暂停粘滞 + 诊断清理 → `a482262` N22 重建包 n22 + 回滚锚点 → `45a830a` N23 滑条一致性 + 原生遮蔽 + 有界重建调度 → `9049591` N24 质量回退 N22 + 滑条端点统一 + 字号文案与全屏预览 + 有界调度（前台 2 路 + 最新待办替换 + 两路预取），锚点 `anchor/n24-9049591` → `8941244` + `c139144` + `99e7be5` N25 设置排版修正（预览去重复标题）+ 五档标签完整显示与统一 LTR/RTL 几何 + 预览示例资源键 + 十四语种完整 UI 本地化 + 表头分隔符修正与交付记录，锚点 `anchor/n25-99e7be5` → **`509d50a` N26 设置入口迁入 Morphe 视频页（新导航 key `morphe_vot_screen__ai_captions`，紧跟旁白翻译）+ 入口与同页普通项同样式 + 预览说明改「样式预览（全屏）」十四语种**，锚点 `anchor/n26-509d50a`（指向源码与最终文案提交）→ **N27 普通播放器控件避让**（本 patch 自建可见性指纹并沿官方同一实体模型构造器路径注入自有观察者，字幕与真实可见操作控件相交时最小上移、隐藏回原基准，Shorts/小窗/PiP 排除，新增诊断事件全英文），锚点 `anchor/n27-62c4916`（指向含全部源码与最终文案的提交；短哈希由本卡提交后不含源码改动的状态补记提交写实）→ **N27r 启动 VerifyError 修复 ＋ 最终 DEX 分支审计**（本卡注入改用 `ExternalLabel` 绑定构造器真实 `return-void`，空值分支 offset −3→+11、target 0x0d→0x1b；新增仓库内 `FinalDexBranchAudit`／`DexBranchAudit`／`ControlsHookBindingAudit`／`InjectionOrderRegression` 并接入既有 `:patches:auditComposition`，旧 N27 坏包被直接拒绝），锚点 `anchor/n27r-4c1d33f`（指向含全部修复源码的提交；其后仅有一个把占位短哈希写实的 docs 补记提交）。

## 7b. 后续功能线：自动翻译语言菜单多选（L 线，交接给新 DSH 对话）

- **目标**：把现有第二个补丁 `simplifiedCaptionLanguagePatch`（"Add Simplified Chinese to auto-translate"，单语言、default=false）升级为**用户自选多语言**加入 YouTube 自动翻译语言菜单，并**合并进 "AI caption translator" 补丁**。
- **既有轮子检索（2026-09-30，审阅者）**：本机官方 `patches-1.44.0.mpp` 全量字符串扫描显示，官方与字幕相关的补丁只有 `captions`、`autoCaptionsPatch`（禁止自动开启字幕）、`captionCookiesPatch`（Timed Text API 请求带 cookies）、`transcriptPatch`，以及 `voiceOverTranslationPatch`（"Voice over translation"，语音配音翻译，另一功能）；**没有任何补丁改动自动翻译语言列表**。GitHub 在本机 web_fetch 被策略拦截（解析到非公网 IP），故为"官方包权威扫描 + 搜索引擎（含 anddea/revanced-patches、4pda Morphe 帖）指示性结果"；**开卡第一步仍需 Codex 联网复核**一次。
- **本仓机制现状（可直接泛化）**：`NativeCaptionBridge.augmentTranslations()` 已实现"找 timedtext 原型条目 → 克隆 → 改写 code/标签/URL → 按 Collator 顺序插入 → 已存在则修正而非重复"；`LanguageMenuOrder` 用 UI 语言环境的 Collator 对 NFKC 归一化后的显示名排序（即"遵照 YouTube 在各语言下的排序"）；`CaptionLanguageMetadata` 写入条目字节字段（目前硬编码 `zh-Hans`）；`simplifiedUrl/simplifiedVss` 负责 `tlang`/`t<code>` 改写。**用户四项要求里，去重、排序、插入已有实现，缺的是"多选集合 + 每个 code 的元数据/URL 改写 + 设置项 UI"。**
- **用户已拍板（2026-09-30）**：① 覆盖范围 = **本 patch 支持的 14 个 UI 语种**（不用 YouTube 原生全集；理由：后续要按语种适配翻译策略，收窄范围才能保证体验）；② 多选 UI 落点 = 设置页新增一项（候选列表 + 已存在标记 + 不支持标记）；③ **不承诺任何语种的译文质量**——用户明确表示不会核查其他语种效果，“尽力适配即可”；因此 §7c 的标定成本不由用户承担，改为“标准值先行 + 客观版式指标 + 运行时验证”（见 §7d）。
- **建议卡序列**：L1 调查/设计卡（联网复核现成轮子 + 定位承载语言列表的类与挂点 + 候选来源与 tlang 编码规则 + 多选 UI 落点 + 最小实现方案与风险，只查不改）→ L2 实现卡（多选/去重/排序/14 语种文案/测试/fixture）→ L3 建包 + 真机验证。
- **回退锚点**：`66c1e00`（N21b，语言菜单开发前的最后代码点）。建议在下一张卡里创建 `anchor/n21b-66c1e00` 标签；功能线在独立分支（如 `feature/lang-menu`）上开发，主线保持可回退。

## 7c. 翻译策略的语言对适配性（审阅者核查结论）

- **架构上语言对无关**：`RebuildApi.prompt(cfg,lang)` = 主 prompt + 保真 prompt + `Target language: <lang>` + 用户偏好；源语言不显式声明（由 `source_text` 推断）；`RebuildSource.tokens()` 是脚本感知的（Han/假名/谚文逐字切，拉丁按词，数字/百分号/复合词单独成 token）；排版由 Android `StaticLayout` 按真实字体测量；目标语言就是所选菜单条目的 code，全链路可换目标。
- **但阈值是为"英文源→中文目标"标定的**：`RebuildPageLayout` 的偏好 12–18 码点、`MAX_CPS=8`、`8L*|len−15|` 计分、12/18 惩罚项、`MIN_PAGE_MS=1200` 全部按**字符数**；拉丁/西里尔目标下同样字符数承载信息少得多，CPS=8 也偏紧，会明显多分页。`RebuildProtocol` 段落护栏已按 `cj ? 60 : 155` 自适应（部分自适应）。`RebuildReview`/`RebuildSemantics` 的语义护栏（主语错接、数字替换、锚点泄漏、比较极性）来自中英失败样本，换语言对最好情况是惰性、最坏情况是误报。
- **结论**：换语言对"能跑通但不等于体验成立"；每加一个目标语言，工程代价 = 重标定分页/可读性阈值 + 一轮该语言对的真机样本。这直接影响 §7b 的覆盖范围决策。

## 7d. 分语种参数依据：Netflix Timed Text Style Guide 实测数值（2026-09-30 检索，审阅者）

- **检索方法**：`web_fetch` 对 github.com / *.github.io 被策略拦（解析到保留段 198.18.0.111），改用 shell 的 `curl` 抓 Netflix Partner Help Center 正文 + `gh` 做社区检索。
- **通用要求**（[General Requirements](https://partnerhelp.netflixstudios.com/hc/en-us/articles/215758617-Timed-Text-Style-Guide-General-Requirements)）：最短 5/6 秒、最长 7 秒、**最多两行**、"不超过字符上限时保持一行"；断行规则=标点后断、连词/介词前断，不得拆开冠词与名词、形容词与名词、名与姓、动词与主语代词、动词与助动词/否定。每事件两行上限与我们的"每页 ≤2 行"是同一单位，可直接对齐。
- **每行字符上限**（[官方 QC 表](https://partnerhelp.netflixstudios.com/hc/en-us/articles/215274938-What-is-the-maximum-number-of-characters-per-line-allowed-in-Timed-Text-assets)）：多数语言建议 **42**；强制上限——韩 23、简中 23、繁中 23、阿 50（Originals 档：韩/简中/繁中 **16**、阿 42）。
- **阅读速度（正片 / 儿童 / SDH）**，取自各语言 TTSG：**简中·繁中 9 / 7 / 11**（每行 16 全角）；**日 4（重对话 7）/ — / 7**，每行 13 全角（SDH 16），半角与空格按 0.5 计；**韩 12 / 9 / 14**，每行 16（拉丁/空格/标点按 0.5 计）；**阿 20 / 17 / 23**；**印地 22 / 18 / 25**；**英·德·法·西·葡·俄·越·印尼 17 / 13 / 20**。
- **对现行常量的判定**：`MAX_CPS=8` 全局单一值**只对中日文成立**（中文 8 与官方 9 同档、日文官方仅 4 需下调），对拉丁/西里尔/阿拉伯/印地/越南/印尼**过严约一倍**（官方 17–22），会造成大量无谓分页；"12–18 码点"只适用于 CJK，拉丁语种应以**实测行宽**为预算；计数单位应改为**显示宽度单位**（全角=1、半角/空格/标点=0.5，韩日官方即此口径）或**字素簇**（印地/阿拉伯），而非 `codePointCount`。
- **质量承诺范围建议（待用户拍板）**：把"能把语言加进菜单"（14 种，平台能力）与"承诺译文质量"（仅中文简繁，可选加英文）分开；其余语种只承诺**版式合规与平台可用**，设置页文案如实标注，避免对无法验收的语言作质量承诺。

## 8. 项目由来（一句话）

旧研究线（morphe-ai-caption-translator-next）两天几百元、10 分支、以 413MB 本地模型方案 FAIL 收场；本线（v2）以“验收案例表 + 冻结计分板 + 任务卡”模式重启，是目前唯一有效的工程路线。教训：约束先行、任务切碎、验收权归人、每步可测。

## 4z. N28C-R1工程闭合与有限手机复验（2026-10-02）

本节记录R1完整交付，覆盖§4y的“R1尚未执行”，但不删除该规划审阅或原C/B失败证明。后续用户指定1.45.0的下一步调整以§4aa为准。

- Codex已在真实HEAD ce372cf、产品4d98eec/anchor/n28c-4d98eec的docs-only后继上串行完成。产品仅5文件生命周期/Cache顺序/Pager/RenderSpec/最小Overlay reason；原65测试、中文fixture/18 golden、所有业务/配置/资源/build/预算冻结。
- 主线程真实Android Looper在实际commit屏障未释放时可以完成stop/换视频/native关闭/真实开关关闭/切目标并执行下一条消息；新目标已显示而旧文件仍收尾。UI返回是逻辑撤销/旧UI无效，不是物理完成；后台await共用5秒截止且timeout/interrupted明确失败，保留状态/资格。
- reserve/revoke仍同一CAS；Prepared同key新成功写入序号阻止迟到旧许可覆盖。清理执行器1线程/队列16，按Session去重，不在等待它的网络执行器排队、不在任务内等Publication许可。迟到disconnect/clear不能抹新字幕。
- 非中文n28c-presentation-v2：≤7000ms完整fitsTwo优先单页；<1200ms整个源窗只能可行完整单页且不延时；多页每页整数1200底座/合法切口；容量不足明确安全空白。中文8CPS/评分/时间/cache namespace不改，不新增付费repair，不清用户全cache。
- 最终614/614=原591+main11+Pager10+counter新SDK实例2，failure/error/skipped0。原44专项同cohort现46/46；400轮同一最终C受控竞争；Python27/27、220×14、冻结4/4/4/三类不可见0、ACCEPTANCE/frozen零diff。
- 14目标28冷热全部可见，7 required pair、40原几何；40中24个完整1000ms单页/16个硬容量安全空白。原421/579→完整1000；ko283/2117→完整2400。所有非中文sub1200违规多页0。
- 正式MPP自身组合84/84；最终11DEX/58052类、接口/分支/资源/aapt全部通过。无签名文件/Signing Block，apksigner verify预期exit1。C三件套及11787捕获历史文件、原168证据/62产物SHA不变。
- 独立产物：build/local-test/patches-1.3.5-本地测试包-n28c-r1.mpp、extension-1.3.5-本地测试包-n28c-r1.mpe；build/n28c-r1-composition-final/YouTube-21.16.256-本地测试包-n28c-r1-unsigned.apk。实际hash/页时段/失败尝试/源码身份见docs/N28C-R1-LOCAL-TEST-BUILD.md；证据.verification/n28c-r1。
- 工程通过后仅一次有限手机复验：正常启动/中文；暂停/字幕关再开/切目标/换视频/seek/旋转不卡；已有ar+Latin数字、ja/ko或de/fr不裁剪/方向异常/快闪。没有菜单项不加第四期菜单；完整诊断/时间段/设备Android版本回规划者分析。不要求14语种阅读，不先装旧B。
- 未签名/安装/清用户数据/推送/发布；零远程翻译API、零新依赖/下载。手机YouTube/OEM字体ICU/远程实况/母语语义未覆盖，不能把614绿或交付当全验收。第四期暂不发，本卡完成即停。

R1身份闭合：核心实现 `9a7bdf35351b9a052233bac8b9004241548eb1eb` / `anchor/n28c-r1-9a7bdf3`。后续仅docs补记真实身份；产品/测试/资源/build与此锚点相同。最终HEAD和清洁工作区记录见`.verification/n28c-r1/final-state.json`，不以原591或614绿色替代未覆盖的手机/OEM/远程/语义验收。

## 4aa. R1工程审阅、官方1.45.0真实包核查与R2定案（2026-10-02）

用户请求告知R1下一步，提供根目录patches-1.45.0.mpp，并指定后续所有版本按该官方版本适配、发版YouTube兼容声明更新。此决定改变原“立即测R1”的顺序，不取消R1成果；先兼容迁移后只测一次候选，避免两轮重复装机。

- 真实仓库HEAD f7c0c462dcd31f57f1336678007793570cbd4818，产品9a7bdf3/anchor/n28c-r1-9a7bdf3；后继仅2docs，核查前仅用户1.45输入未跟踪。三件套实际SHA与交付相同；已读源码修订/交付/final-state，认可R1工程闭合，未亲自复跑614/400/84。手机/OEM/远程/语义未覆盖。
- 官方输入11,039,984字节/SHA256 DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93，与GitHub v1.45.0资产size/digest一致（2026-10-02T08:55:35Z发布）。本地Patcher1.14.1加载Patch定义成功，162项（旧150）；未进行1.45真实patcher组合。
- 实际官方YT非实验targets为21.16.256/21.13.164/20.31.42（SDK28）、20.21.37（SDK26）；实验21.39.522/21.38.130/21.28.208（SDK29）、21.23.492（SDK28）。继续现有原版21.16.256、项目SDK28，无需先换宿主/下载。当前Constants/生成patches-list/README21.07.247陈旧，新卡只声明真实验证的21.16.256，不照抄全部官方目标。
- 确定接口冲突：实际1.45 PlayerFlyoutMenuComponentsFilter.isFiltered路径String变CharSequence，当前CaptionQuickTogglePatch的String guard必不满足；新增类型正确桥接，保留null/非String/Shorts/视频owner限制，不删严格唯一/签名校验。FlyoutInfo/Shorts/PlayerType/AbstractPreferenceFragment/ThemeUtils/CustomDialog此次公开接口未缺失；真实内部结构/资源/排序/最终DEX还待组合验证。
- 默认行为风险：AutoCaptionsPatch.disableAutoCaptions新BOTH_ENABLED分支提前跳过150ms手动guard，Settings默认亦BOTH_ENABLED。R2只在AI已安装且用户开关ON、官方guard已结束时返回original，恢复旧已认可手动CC语义；初始guard与AI关闭/未安装保持原1.45行为，不改共享偏好/默认、不以临时字幕可见性决定模式，不重做CC触摸/播放。
- 新官方具名YT91（旧84），21.16匹配default90（旧83）；这些不是组合PASS分母。新组合完整选择新default及依赖，实际报告，不为凑旧84裁掉项。Universal Spoof signature default=false，不擅自打开。
- 已编写docs/N28C-R1-REVIEW-AND-OFFICIAL-145.md、docs/N28C-R2-CODEX-TASK.md、docs/N28C-DEVICE-CHECKLIST.md。R2严格只兼容接缝/元数据/独立构建，Controller/Cache/Pager/Overlay/中文golden/请求预算全部冻结；真实新MPP组合-n28c-r2、最终全部DEX审计/7组合、metadata生成与包内targets一致，不覆盖R1或旧证据。允许docs-only HEAD和已知用户输入，不因此再次机械停工。
- 发布待办：validate/release仍有旧1.3.5 recovered Smali路径，不能作为新代码验证/发版来源；未来新正式发布须走当前Java/Kotlin源码并核对生成元数据/真实资产。此卡不顺带重写整套CI，不改已发布v1.3.5 URL/日期/资产，不将官方1.45版本号套给本产品。
- 后续用户只需对R2一次5–10分钟正常启动/中文、手动CC及AI开关、seek/换视频/旋转、英文及已有RTL/长词观察，发完整诊断+异常时段+设备Android。没有语种项跳过，不要求14语种阅读/截图，不清cache。AI OFF时官方Always show可能仍显示原生字幕，须与AI继续请求/渲染区分。收到实况后再第四期；三项summary/14语种运行时/旧程序性诊断中文仍未关闭，N27继续搁置，VISIONOS用户已解决不处理。
- 本轮仅只读源码/包/官方资料，编译已有工具做metadata/DEX ABI读取、实际SHA核对、管理docs和状态同步；没有产品修改、产品测试/建包、远程翻译API、新依赖/下载、签名/安装/清数据/推送/发布。原始核查证据.verification/official-145-review。两份状态同步后，规划docs留给R2执行者保留随卡提交。

## 4ab. R1+官方1.45手机实况、最终APK缺draw根因与两卡收敛（2026-10-02）

用户已按清单测试，反馈高强度操作后日语原生底框持续闪现，AI关再开可暂时恢复；第一句后第二句又waiting；非中文应像中文在标点及可理解语义位置翻页。用户明确要求加快收尾并生成下一卡。已获实际安装APK路径，不能再按“用户尚未测R1”安排两轮重复装机。

- 当前实际HEAD f7c0c462dcd31f57f1336678007793570cbd4818、产品9a7bdf3，源码未动；已知规划docs/官方输入保留。新增用户YouTube_Morphe-v21.16.256-patches-v1.3.5.apk=199,492,582/SHA256 8676787F0C5DB0636CA72C8DAC08071B6263BFEC7DBA4D592E408BBC0EF0B5C4，只读，不作原版重补丁输入。
- 真机诊断D:/HONOR Share/Honor Share/caption-diagnostics-1.3.5-20261002-180521.txt=1,262,317/SHA256 BCD70B494B0C1EB21E2357727602078F40D1ACC72C6EBBEA2F1444874A4D36F5；mH5TlcMo_m4英文SRT SHA B86A06B339D36D63FFF0B75598B5DF6C3C3EB80230863717E713CA542DAAE9C8。2436history/27quality，跨通道去重2438事件/约389.6s；观看263s、28调用27成功1SocketException、52,627tokens。请求仅zh-Hans15/ar6/ja6，93响应事件，不能写14语言真机都已验或结构接纳即语义通过。
- 实际APK classes2官方isFiltered确为CharSequence/AutoCaptions新BOTH_ENABLED提前return，证实用新官方；但onMenu宿主调用1、observeMenuPath0，classes6的SubtitleWindowView完全没有draw覆盖，suppressNativeDraw helper有定义但引用0；selection dispatcher1，核心仍可跑。原R1+1.44工程APK有真实draw防线。源码QuickToggle在先插onMenu后因String guard不匹配而中断，之后draw/copy接缝未安装；实际残缺形态吻合。未直接获得Manager日志，异常怎样被处理仍需真实patcher重现，不虚称已证明Manager吞异常。
- 黑框方向已从纯扫描推测升级为最终APK核心draw钩子缺失。ja session43连续VIEW_NOT_FOUND，重启49于1790935464250又mask到SubtitleWindowView。先修CharSequence完整finalize/审计/AI许可最后发布，恢复draw防线；不先新造高频扫描/监听架构或重开N27。上轮“必然不能混用”表述修正为“可以产出并运行部分接入包，完整兼容不合格”。
- 启动：session7首HTTP1790935147260、接纳9809，next HTTP9893，晚2633ms；视频7040块边界后wall1790935153482–55577等待2095ms。ja49在28.111s首可见后29.066s又pending，到35.048s出（墙钟约6797ms）。schedule/restoreCandidates的everReady门使后续请求串行。N29授权当前请求真实sent后仅邻块index+1提前cache→prefetch，播放fresh/未暂停/无seek storm，旧focus2/prefetch2/总4/30秒/attempt预算保持；不冻旧字/隐藏waiting/延迟播放。提前结束最多多一个bootstrap投机块，正常同段请求数不增加，不保证极慢网络零等待。
- 非中文实样：ja145–169/42.719–51.974秒被切“誇張す | る…中国 | の…”。lineBreak候选不是语义翻页，DP两行罚1800大于每页200/标点奖励80。N29采用平台ICU sentence/word/line+Unicode标点层次，完整句/可行强边界优先、词兜底、真正超几何长词才字素应急；减少应急/弱切口→页数→平衡，去掉单行偏好造成的额外拆页。中文legacy与18golden不动，1200/两行/字素/源首尾保持；非中文n29-presentation-v3隔离，不改prompt/n28b策略/中文cache，不清全cache。ICU/Unicode/Netflix官方原则已联网复核。
- 译文语义开放项：ja49 b4在“more impressed with Russia … than … China”出现“中国…方が感心する”比较方向风险；现无可保证低回退的纯规则修正，不把它硬塞成一个视频专门规则/新增付费评审或宣称分页修正了语义。保存原响应与SRT；非中文母语自然度仍未完全验证。
- 1.45官方Always show不再仅凭改动就强制shim。N29先受控验实际手动CC关闭链，只有确证AI OFF意图被撤销才做仅完整AI已安装/开关ON/guard已结束尊重original的最小接缝；原生/AI OFF保持官方行为，不改共享偏好。Compatibility/真实MPP生成patches-list/README21.16声明一起修，官方新defaults完整选择，实际PASS/DEX数量动态报告。
- **仅两张剩余卡**：N29（当前）接入/防残缺、原生draw、首块邻块供给、非中文语义翻页；审阅后N30第四期多选14语种菜单+三项UI/实际运行语言切换+技术诊断英文一起闭合、发布来源/元数据预检。N30不再拆N31/N32，不新增DeepSeek接力；AI入口介绍仍旁白后/无图标，用户自定义要求不覆盖，菜单默认空/AI OFF保留/去重遵真实YouTube排序/Remember独立。已知三问题不能再仅凭220×14静态键齐全关掉。
- 已生成docs/N29-DEVICE-REVIEW-AND-PLAN.md、docs/N29-CODEX-TASK.md；旧N28C-R2-CODEX-TASK.md置历史覆盖提示，不能再单独串行执行。明确许可定点更新与新合同直接冲突的旧测试断言并保存before/更强替代，不机械停工；中文golden/ACCEPTANCE/frozen仍禁改。R1 CAS/锁/主线程/后台barrier/同key保护不重构；Controller新资格改后既有400受控轮复核。
- 用户下一包只复查漏框/开关、启动第二块等待和日语42–52秒原句，给完整诊断/异常时段，不再要求十四语言读取或全表重复。冻结4/4/4与旧事实不变，用户反馈进live观察；N27搁置，VISIONOS已解决。
- 本轮仅只读源码/最终APKDEX/日志/SRT/官方标准与管理写入，原始证据.verification/n28-device-review；ADB无设备，没有新手机操作/安装/签名/产品建包/产品测试复跑/远程翻译API/新增依赖/下载/推送/发布。两份PROJECT-STATE已同步，规划docs留给N29保留随卡提交。

## 4ac. N29完整交付（2026-10-02，Codex，工程通过/手机待复查）

执行HEAD f7c0c462、产品锚点9a7bdf3，旧docs规划保留。原1.45实际Patcher重现String guard失败，部分状态aiInstalled1/onMenu1/observe0/draw0/copy0与用户包吻合；不冒称Manager吞异常。现接受已知完整String/CharSequence签名、宽度推p寄存器、先验late guards、必要hook唯一计数后最后发布AI许可；生产rewriteUrl/NativeBridge未安装零API/原生直通/不清AI设置。真实最终onMenu/observe/draw/initialize/selection/copy各1，manual-only0，private copy正确；用户坏包、未知/多匹配、人工缺draw由同一审计非0具名拒绝。持轨waiting/安全空白/rotation阻断draw，OFF/离轨恢复，source-only旧语义保持，未重构扫描器。官方CC实际序列128真值表及生产链未复现Always show撤销手动Off，未装shim/不改官方偏好。

启动仅sent focus后的index+1 cache-before-prefetch、既有SOURCE_IO异步/短锁接纳，focus2/prefetch2/总4/30秒/storm/预算/R1 CAS等不变。真实屏障固定时间回放邻块3448→815ms、就绪9069→6436ms，7040ms边界wait2029→0，两块各1请求；手机原tick壁钟2095ms另记。慢服务器仍真实pending，提前结束最多多1紧邻投机块。

非中文平台ICU sentence/word/line+Unicode保护、应急/弱切口→页数→平衡，无单行1800罚；真正超几何不可分单元才应急，不用时间不足切正常词。n29-presentation-v3隔离，中文legacy/n28b/prompt/key不变。原ja145–169全文同58.32203px/1160px三页碎词→两页“一方で、 | 中国の…”，42719–48173/48173–51974ms；13组原诊断尺寸×SDK28/35完整before/after保留，98–126/ar也验。b4比较方向风险原响应/SRT保存，未改prompt/视频特判/付费语义审校。

最终同输入SHA 74132d8ec69ffbe96fa2acac15a75d1b8415ff3913b9cee5c13fb8384091af21：Java643/643=614+新29，专项68/68，main/K12/permit下条消息/同key/迟到/切目标继续成立，200+200=400轮。中文18golden逐字段相等，原40几何/14目标28冷热、新40×SDK2合同通过；Python27，本地化220×14。冻结4/4/4，三个invisible_ms0，ACCEPTANCE/frozen零diff。原测试定点变化仅安装fixture、非中文版本和no-spam真实事件filter；完整before及所有失败/中间非交付包保留，不跳失败/加时限。最终scope proof恢复并冻结miniplayer/R1生命周期，Controller仅4原方法改；debug/release166class相等。

正式官方1.45默认根90、PASS93，7组合均真实Patcher序列化/审计，最终11DEX/58229类/322812方法/626445分支，invalid/dex/binding0。共享Constants/生成JSON/README仅21.16.256/minSdk28，产品1.3.5/原资产URL日期不变。CRC/资源/设置/Collator/aapt/verify_bundle/N8Verify及MPE内嵌等值通过。12643历史文件SHA/字节一致；大用户APK/官方MPP不提交。

交付：E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n29.mpp；1137101 B；SHA256 F2A4818A5B5DE9159BEFAEE735E375A1D280D687A88853CB30639DF38F82B394。
交付：E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n29.mpe；2766868 B；SHA256 E96301FF59D73740582E59CAC6D3C2E461ACF4151779B43B121512B31AD3B45E。
交付：E:\Projects\morphe-caption-v2\build\n29-composition-final\YouTube-21.16.256-本地测试包-n29-unsigned.apk；198090986 B；SHA256 7D741BE68E4C215B800FD378042BDAED793C86658D28FC19A00CA13461EF5EF9。

未签名/安装/清数据/卸载/推送/发布；远程API/下载/依赖0。工程结果不等于手机或14语言语义全通过。用户仅中文连续启动、日语底框/42–52秒切口、开关/旋转一次并给诊断，不再次十四语言全表。Codex本卡完成即停，不开N30、不交DeepSeek；第四期与三项本地化收尾仍等规划者同一N30授权。核心提交/anchor由后续docs-only写实；两份状态同步。

N29真实身份补记：核心提交 `3eefe00ee1491ea4c6bb4e076dbc511fc120fe65`，源码锚点 `anchor/n29-3eefe00`，父HEAD f7c0c462。本次只补docs身份，不amend核心/旧提交；产品与测试/工具/规划docs均提交，已知未跟踪官方1.45输入MPP保留不纳入Git。

## 4ad. N29手机复查、问题定界与N30范围（2026-10-02）

用户已安装N29+官方1.45.0候选并完成短复查，提供诊断 `D:\HONOR Share\Honor Share\caption-diagnostics-1.3.5-20261002-222525.txt`（1,228,830字节，SHA256 `F604DE8F66828B24BA892BA1943659D375C202556CCD746D3B568390ABDC4A03`）和两张截图。N29工程交付本身仍按§4ac记录；本轮未修改源码、未重跑产品测试。

- **确定文案问题**：`CaptionQuickToggle.java`把`" 路 "`硬编码在AI标题和on/off状态之间，截图中的“路”不是字体/官方1.45/翻译引擎问题，N30删除硬编码并改为14语种资源化完整菜单标签。`DeepSeekCaptionResourcePatch.buildPreferenceScreen()`把AI页面summary绑定`@string/cap_autosave`，所以显示“修改后自动保存”；N30新增`cap_ai_summary`功能说明并逐语言运行验证。
- **等待/连接问题**：诊断去重事件2670，40次请求、37次成功、3次SocketException；多个成功请求RTT在4–8秒，最高约10.16秒，焦点请求也有9.52/6.12秒。N29新增邻块远程bootstrap在焦点接纳前增加并发压力，固定回放收益不能证明真机稳健。N30把焦点成功前bootstrap限制为cache-only，焦点接纳后恢复prefetch2/总4；保留有限失败收敛、英文reason和原有CAS/attempt预算，不隐藏waiting、不无限重试、不改provider/API。
- **转场卡顿问题**：诊断有`NATIVE_RENDERER_VIEW_NOT_FOUND`41次、`NATIVE_RENDERER_VIEW_TREE`498条、`PLAYER_TRANSITION_CAPTION_GUARD`6次，说明N29在转场相关路径重复原生窗扫描、树摘要和帧稳定探测。N30只保留紧凑播放器必要探测；普通详情页/悬浮窗/全屏/旋转变化走常数级状态更新；40ms tick只维护已发现窗，树扫描低频退避，树摘要不再每次主线程输出。draw防线、AI/原生/等待/safe blank恢复语义保留；N27避让不恢复。
- **N30第四期落点**：十四语种多选入口必须放在AI字幕翻译设置子屏内，使用Morphe原生Preference/Dialog风格，无顶层重复入口。默认空集合，存规范化code，去重/别名归一，新增项按真实YouTube当前排序，AI关闭仍保留，Simplified根并入AI、Remember独立。
- **最终本地化一次闭环**：AI功能summary、播放器菜单状态标签、默认要求、字号/预览/样式预览（全屏）、对话/按钮/Toast/诊断shell/模型/审计/多选入口统一做运行时覆盖；技术字段/事件/reason英文，用户可见壳随应用语言，源文/译文/用户prompt/provider原始证据保持原文。220×14静态key不能单独关闭问题。
- **执行状态**：已生成`docs/N29-DEVICE-FEEDBACK-REVIEW.md`与`docs/N30-CODEX-TASK.md`。N30是唯一剩余开发卡；不另建N29r/N31/N32，不交DeepSeek。N27与VISIONOS继续搁置；中文golden/ACCEPTANCE/frozen、N29非中文分页合同、R1生命周期/CAS/缓存顺序冻结。
- 本轮诊断与截图只用于规划/审阅；没有安装新包、签名、清数据、推送、发布或远程翻译API。N30完成后用户只需做一次中文/菜单/summary/稳定播放/详情页↔悬浮窗/全屏短复验并给完整诊断，不要求重测十四语言全表。

## 4ae. 新视频1:57缺字幕根因与N30补充（2026-10-02）

用户提供视频 `The Truth About the Bezelless Concept Phone [ngPkbaZliaU]` 的手动/自动英文VTT、JSON3和诊断 `caption-diagnostics-1.3.5-20261002-224950.txt`。本轮只读分析，未修改产品代码或复跑产品测试。

- 外部输入：手动VTT 12,061字节/SHA `24C447B2DD1885A7…`，手动JSON3 23,150字节/SHA `505C5A99A6C08A05…`；自动VTT 63,248字节/SHA `494A1C1B67E0A91E…`，自动JSON3 106,667字节/SHA `0F0AECF0193E60C8…`；诊断560,032字节、完整文件1,228,830字节读取得SHA `34F7C61084349A07…`/此前复核 `F604DE8F66828B24BA892BA1943659D375C202556CCD746D3B568390ABDC4A03` 的外部导出差异以实际交付记录为准，不把文件头字节误作事件内容。
- 手动字幕1:52–2:07连续覆盖“all right…this is a big…smartphone…zero bezels”。诊断Block `b7_354_387`的`source_breaks_before=[381]`，token380→381有约722ms硬断点。模型第一次响应以及两次修复均生成跨断点事件`380–387`；生产请求14/15/16连续被`crosses_source_break`拒绝，块7失败，fallback从112140ms持续到127282ms。因此1:57附近缺失是整块安全空白，不是单句响应为空或模型没有覆盖该视频。
- N30已补入严格要求：在请求前由Planner按硬`source_breaks_before`及speaker marker拆Block；任何Block不得跨硬断点。真实b7样本必须在381前拆成独立合法Block，分别请求/缓存；断点处保留真实空白，不放宽Protocol硬安全网、不跨断点借时/删文本、不重复发送同一非法Block。修前三次拒绝和112140–127282ms fallback保留为回归证据；修后1:52–2:07各合法源片段逐块进入翻译或安全空白，1:57不再因整块失败而缺失。
- N30仍同时处理播放器菜单硬编码“路”、AI summary错误、远程bootstrap收敛、转场主线程扫描减负、AI设置内十四语种多选和最终本地化/技术诊断英文。中文golden、既有硬断点测试、N29非中文分页合同和R1生命周期/CAS冻结。
- 已更新 `docs/N29-DEVICE-FEEDBACK-REVIEW.md` 与 `docs/N30-CODEX-TASK.md`；两份PROJECT-STATE继续同步。用户下一包只需短测中文、该视频1:52–2:07、菜单/summary和一次播放器转场，不要求十四语种全表。

## 4af. 特异性修复审计确认（2026-10-02）

用户要求确认1:57修复必须是通用机制，不能针对视频/句子/时间特判。已对生产源码 `extensions/extension/src/main`、`patches/src/main` 和 `tools` 检索该视频ID `ngPkbaZliaU`、block `b7_354_387`、token 354–387/381、112140/127282ms、英文原句和“zero bezels”等条件；未发现进入生产逻辑，当前仅存在于诊断、测试/fixture及规划文档。`legacy_en_zh`等按语言对设计的通用策略不属于视频特判。

N30卡已补强：实际视频只作回归夹具；生产Planner按所有硬`source_breaks_before`和speaker marker在请求前拆Block，任何视频、语言、字幕来源和断点位置都适用；生产源码/生成DEX必须做特异性审计，禁止引用该样本ID/token/时间/文本，并至少增加三种不同断点位置、长度、语言或字幕来源回归。不得放宽`crosses_source_break`安全网或加入句子词表特判。用户可以继续发下一条执行指令，执行者应按更新后的N30卡实施并在报告中证明通用性。

## 4ag. N30 施工范围阻断：未交付草稿，等待冻结入口授权

本节为停止时的历史记录；2026-10-03规划者已补明确入口分发权限，恢复方案见§4ah。N30仍未完成，原验证缺口与未提交草稿全部保留。

N30 按 `docs/N30-CODEX-TASK.md` 开工，真实 HEAD `b6dd6c6`，源码基线 `3eefe00` / `anchor/n29-3eefe00`，两份状态 SHA 一致、官方1.45.0输入匹配。Codex 单执行者在 E 盘完成部分草稿与专项验证后，依卡第7节停止，不交DeepSeek，不进入下一卡。详细交接 `docs/N30-SCOPE-BLOCKER.md`。

- 决定性冲突：实际 `DeepSeekCaptionHook.onPlayerType` 先调用 Dynamic/Contextual/RebuildController.player，再调用 transition guard；前者在冻结 `CaptionOverlay.setPlayerType → render → CaptionSurface.refresh` 同步触发 View 树几何查找。单独优化 guard/MusicSuppressor 不能兑现C3完整宿主callback无扫描合同。新增受控生产入口探针1/1复现、同步refresh1次；本机30,604,700ns仅测试观察，不冒作手机帧耗时证据。三处冻结入口源码零diff，未越界。
- 已保留未提交草稿：通用650ms/speaker断点请求前拆块，cache-only bootstrap与连接阶段诊断，完整菜单标签/AI summary，12新键×14资源，多选code存储/原生菜单与显式Preference排序，guard/扫描退避。真实样本仅在test fixture，Protocol硬安全网不放宽。草稿非最终实现证明。
- 验证实况：Java/Kotlin产品编译通过；原N29 bootstrap before8/8；最后综合专项23项=19通过/4失败；其fixture修正后尚未复跑。scope探针1/1是阻断复现，不计功能验收。资源/320dp/1.3文本及en/zh/fr/ar截图为本地Robolectric，不是真机/最终宿主screen，也不等于最终本地化闭环。Java全量/400轮/Python27/冻结/七组合/最终DEX与产物均未完成。
- 后续须规划者明确能否仅调整冻结onPlayerType→overlay同步几何/render分发时机，保持miniplayer隔离/稳定恢复、draw/等待/safe blank/Session权限、R1锁/CAS/cache顺序和位置/中文/分页不变；或提供不触及冻结层的可验证方案。未授权前不继续产品施工/建包/提交/锚点，不让用户安装草稿。
- 原始222525/224950诊断与两张截图、官方MPP只读复核未变；N29历史MPP/MPE/未签APK SHA/字节未变。无下载/新依赖/翻译API/签名/安装/清数据/卸载/推送/发布。两份PROJECT-STATE同步，原规划文档保留。证据 `.verification/n30/handoff` 与 `.verification/n30/scope-probe`。

## 4ah. N30入口分发范围补充与继续施工定案（2026-10-03）

用户转交N30停止报告询问是否允许最小修改。规划者核对真实E盘工作区、N30-SCOPE-BLOCKER与probe JSON/测试以及生产源码，确认入口在guard前执行overlay.render→CaptionSurface.refresh。原卡要求完整宿主回调无扫描但遗漏了上游UI分发的允许面，执行者按冻结边界停止有依据，这是规划范围遗漏。

- HEAD仍b6dd6c6，N29锚点3eefe00；N30产品/测试/14资源/菜单/Planner/调度草稿全在未提交工作区。DeepSeekCaptionHook/HookV2、CaptionOverlayV2、CaptionSurface相对N29零diff；规划者本轮未改产品，不reset/提交/建包，不让用户安装草稿。
- 原受控生产probe inner入口同步refresh1次、callback_elapsed_ns30604700；1/1通过表示before成功复现，不是修复通过。本机纳秒包含测试/渲染开销，不能转成手机帧时延判据。最近专项23=19通过4失败，随后fixture修正未跑，必须重新复验真实缺陷/工具误差，不跳过失败。
- **明确允许继续同一N30**：仅DeepSeekCaptionHook/HookV2通知、RebuildController.player必要UI通知、CaptionOverlayV2.setPlayerType/restoreAfterGuardedExpansion/渲染请求合并和失效、必要CaptionSurface既有几何缓存复用/失效。禁止改变R1锁/CAS/Publication/Permit/cache提交顺序、main退休非阻塞/后台barrier、显示权限、compact隔离/待恢复责任、player识别/坐标/字体/位置/分页合同；不加线程/新后台架构、不恢复N27。
- 轻量模式更新/进入compact隐藏必须及时生效，几何/render在宿主callback返回与合法布局后调度；同一转场待处理有界合并、读最新状态，重复type不排队，不改全局main(Runnable)以延后所有生命周期。stop/clear/切视频目标/Activity毁/再compact使旧task无attach/render/clear副作用，新Session不被迟到任务覆盖或抹字。没有合法几何安全空白，后续有效布局恢复一次。
- 实际宿主注入指向HookV2，其在inner后仍forceNativeRendererScan；最终测试需覆盖真实V2+inner完整链/后续WATCH tick restore，不只测guard或inner。callback返回前几何/完整scan0，返回后真的render且保护仍有效，快速转场无任务堆积；仅把完整遍历放Handler.post不构成性能完成，要证工作量/重复次数/延后帧并留手机观感未验证。
- 已更新原N30卡C0/C3/§7与恢复说明，在N30-SCOPE-BLOCKER追加2026-10-03规划者定案；原阻断文本/证据与失败证明不改。恢复先复验专项，再继续剩余N30，最后全量main/K12/400轮/资源/最终组合DEX及独立MPP/MPE/unsignedAPK，不另开修订卡、不把编译或probe通过当交付。
- 卡内已知外部手动/自动字幕四文件路径为D:/下载/.deno/bin/manual_en、auto_en中同名The Truth About the Bezelless Concept Phone [ngPkbaZliaU].en.vtt及.en.json3，已授权只读；使用LiteralPath直接Path，方括号不能当通配，不默默省双来源回放。
- 本轮仅核对/更新管理docs/同步状态，无产品施工或测试复跑/远程API/依赖下载/签名安装/清数据/推送发布。两份实时状态比对一致后同步，保留草稿和规划改动给原执行对话继续N30。此定案只解除已证明的分发范围阻断，N30仍未验收。

## 4ai. N30 完整本地工程交付（2026-10-03，完成即停）

继续原 N30，保留范围阻断和授权前草稿；开工/恢复HEAD b6dd6c6，N29源码锚点3eefe00。最终源码核心提交 `d5ca720ecf0c83349ea232d929ee09b11840c65a` / `anchor/n30-d5ca720`（提交后docs-only身份补记）；当前产品源码与三件套仍对应该核心。详见 `docs/N30-LOCAL-TEST-BUILD.md`；未签名/未安装，手机观感和母语语义不是本节PASS。

- 已完成完整资源菜单on/off标签（删除硬编码“路”）和AI功能summary；232键×14实际locale解析、fallback作者值对照、320dp/1.3、RTL及原生PreferenceScreen/多选布局。AI设置内新语言项order1（enabled0），无图标；默认空规范code集合，排序/别名去重，AI关闭可编辑，Remember/API profile/原zh-Hans来源不迁移。AI根包含generic菜单接缝，Simplified保留兼容选择，三根七组合。
- 启动cache-only bootstrap，首焦点接纳前remote邻块0；cache在SOURCE_IO锁外依Session/generation/source/key/job接纳，原focus2/prefetch2/总4、30秒/seekstorm5秒/attempt/repair保留。Socket/connect/read interruption英文phase/elapsed/remaining/request/block/session诊断，network成本汇总正确；export/draw标记build=n30，presentation仍n29-v3。受控startup放弃N29边界0ms收益，邻块3448发送/9069就绪/2029等待，两块各1请求；不声称真机更快或更省。
- 通用Planner请求前650ms/speaker硬断点拆块，完整owned token/context/真实时间保留，Protocol不放宽。真实b7三次旧跨断点响应仍拒绝，380/381两侧独立Block；manual/auto×VTT/JSON3四回放、12不同语言/长度/precision合成通过，生产源/DEX无视频/句子/token381/112140/127282特判。
- 真实HookV2+inner完整callback扫描0，合法布局后实际render；100快速通知合并，执行读取最新文本/guard，旧render revision不阻止新字幕。stop/clear/视频目标/Activity/compact使旧帧task失效，非UI通知有epoch保护；普通转场立即释放，compact仅有界Choreographer观察、不稳定保持blank并由后续真实layout恢复。已知native窗维护/低频退避，无自动16KB树摘要；draw缺失具名拒绝。位置/字体/颜色/透明度、N27搁置和R1/CAS未解冻。
- 同一最终Java输入SHA `8ce60f53289c22e06d75f1eee0d4439ac5598b200dc727e3be9c0c724969b8fb`：全量669/669、专项68/68、main11、K12与200+200=400受控轮，failure/error/skipped0；170 debug/release产品class逐字节相等；中文18golden所有字段相等；旧40几何/28冷热与两SDK分页合同继续成立。Python27，冻结4通过/4既有失败/4未验证，三个invisible_ms0；ACCEPTANCE/全部scoreboard及R1冻结方法零diff。
- 最终官方1.45输入一致，90官方默认根、93实际patch PASS；七组合从同一正式MPP加载真实Patcher/序列化DEX审计，native-only API0。11DEX/58236类/322868方法/626591分支，invalid/problems/APIbinding0；资源/aapt/CRC/verify_bundle/原N8Verify、内嵌MPE等值通过；未知/多匹配/缺draw/用户残缺APK及4资源/语言/code变异具名拒绝。
- 独立交付：MPP 1149147字节/SHA 7FEB7313460239B9F8C7315F11C4B8D599FCFED3640A24EADCA8B38317056880；MPE 2786164字节/SHA 6AB8823E239634E414117CA6A1C997775DFAD1CF8F2AE5D105DE43A3508DE9BC；unsignedAPK 198113758字节/SHA AD0DBDA174002BA1FF6D363814A9D5A62AA3FEA15A71EECC5FE06A2C1CB2BF0E。路径 `build/local-test/*-n30.mpp/mpe`、`build/n30-composition-final/YouTube-21.16.256-本地测试包-n30-unsigned.apk`。
- 12646份既有历史/输入SHA/字节未变，原始诊断/截图与四外部字幕只读复核未变；中间失败/前三阶段候选及前两套named候选均保留为非交付。无远程API/下载/依赖/签名/安装/清用户数据/卸载/推送/发布。
- 运行时与截图是平台/受控host工程证据，不冒作全部YouTube手机/14母语验收；N29真实bounded history40/37/3 vs since-reset audit41/38、67745tokens域分开，N30没有device-after RTT/token/帧率。仅请一次短复验：中文开关/summary/多选、稳定播放及真实1:52–2:07、详情↔悬浮窗/全屏、日语/另一非中文切口并完整诊断。N30完成后停止，不另开N30r或下一卡，不自动发布。

## 4aj. N30工程交付后运行时本地化未闭环与N31定案（2026-10-03）

N30核心d5ca720/anchor/n30-d5ca720、身份docs fa10360及三件套已完成；工程669/669、68专项、400轮、Python27、7组合/11DEX、232×14静态/受控资源检查通过。用户安装后切日语仍观察到翻译要求、字幕预览、字号滑条说明和字幕诊断大量中文。本轮只读审阅源码/报告和用户反馈，未修改产品代码、未重建包。

- 结论：232×14键齐全、resources.arsc解析、Robolectric布局和fallback扫描不能证明真实Morphe PreferenceScreen运行时语言。当前风险在XML inflate后的Preference/Category标题与summary可能已固定、Morphe ResourceUtils语言覆盖未贯穿动态控件、动态Preference/预览/滑条/诊断分别取getTitle/getSummary或中文fallback，或用户看到的是旧Context/缓存文本。
- N30源码仍有大量ResourcePatch动态生成XML标题/summary、PreferenceCategory及Java动态控件；CaptionStrings.settings虽能通过ResourceUtils取key，但没有证据证明所有生成Preference、动态刷新、预览、滑条和诊断入口都由同一运行时绑定器统一覆盖。用户真机反馈优先于静态证据，三项旧本地化问题不能关闭。
- 自动翻译语言入口summary必须明确“把语言添加到YouTube自动翻译语言列表”；AI入口summary必须明确“选择自动翻译语言中的语言后，使用已配置AI服务实时翻译字幕”。N31需14语种资源与运行时验证。
- N31只做本地化/文案闭环，冻结N30菜单去重排序、硬断点请求前拆块、cache-only bootstrap、Socket错误预算、转场分发/失效、draw权限、R1/CAS、中文golden、n29 presentation、字号/颜色/位置、N27和VISIONOS。必要Preference运行时绑定可触及Preference装配/动态控件，但不得改业务语义。
- N31必须建立inventory覆盖视频页AI入口、AI子屏/分类、API/模型/测试、翻译要求/默认prompt、预览/sample/样式预览全屏、五档字号/透明度/位置、缓存/调试/诊断/复制保存/Toast、语言多选Dialog和所有fallback；程序性诊断stage/field/reason/error code英文，用户壳随语言，source/translation/prompt/provider原始证据不改。
- 已生成docs/N30-LOCALIZATION-REVIEW.md、docs/N31-CODEX-TASK.md。N31是下一张任务卡，Codex完整执行、验证、建包、交付；未开始源码施工，没有N31产物/锚点。完成后用户只需中文/日语/英语短复验，不要求十四语种母语全表。
- 本轮无产品修改/测试复跑/远程API/下载/新依赖/签名安装/清数据/推送发布；两份PROJECT-STATE同步。N30工程交付状态不因本地化反馈撤销，但不能把N30静态本地化PASS当作运行时闭环。

## 4ak. N31补强：实际语言API断层、固定说明、每语种去状态（2026-10-03）

用户转交N30完成报告，并真机指出：语言添加说明不清晰且每语种带当前视频“不可用”等状态；AI summary没有说必须在原生自动翻译列表选语言；日语默认要求/预览/字号/诊断等仍中文。当前E盘HEAD fa10360、产品d5ca720，无源码差异，仅已有N31规划文件/状态；已先读这些草稿并保存before于.verification/n31-planning，再补强，没有盲目覆盖。

- 明确**N30本地化未闭环**，资源232×14、ARSC、合成Context/Robolectric的PASS不推翻用户手机证据；669等是执行者报告，本轮不宣称亲自复跑。其翻译/650ms硬断点/启动稳定/转场/CAS等工程成果保留。
- 确定说明丢失：CaptionLanguagesPreference.refresh用languages_empty/count盖掉已有languages_summary；N31固定说明在无选择/已选/保存/重绑时都必须出现。中文定案“将所选语言添加到 YouTube 的‘自动翻译’语言列表，可同时选择多种语言。”，AI说明“启用后，在 YouTube 的‘自动翻译’列表中选语言，使用已配置的 AI 服务实时翻译字幕。”；14语种完整传达。
- 确定状态来源：showLanguages把UI语言名与NativeCaptionBridge.languageStatus按languages_entry拼接；**用户最新要求覆盖旧显示状态方案**。N31所有候选仅语言名+标准勾选框，隐藏已存在/新增/不可用全部状态，不以灰字/图标/summary继续呈现。无视频/不同视频/AI开关仍同14候选、可选与存储不变；内部去重/克隆/能力保持，不改变LanguageMenuOrder真实YouTube插入排序locale。原状态资源可留历史但不再可见。
- 本轮已反读**最终N30 unsigned APK** classes2：ResourceUtils.getString是getActivityOrContext→Context.getString，flag可取Activity；getStringByLocale同样未使用传入locale；Utils.setContext才读取BaseSettings.MORPHE_LANGUAGE/AppLanguage.getLocale建语言化Context。当前CaptionStrings注释“必尊重override”没有保障；N30测试把Context直接改目标语言，没测Morphe选ja而Activity仍中文，且多数图是手拼TextView。最终DEX证据n30-final-resourceutils.txt/n30-final-utils-context.txt，不冒作手机内部设置快照。
- N31以真实Morphe显式语言优先、DEFAULT跟随宿主Context确定UI快照，在本补丁ConfigurationContext读取资源；不改系统Locale/官方全局Utils或ResourceUtils flag。按稳定key覆盖实际生成PreferenceScreen/Category、动态编辑器/模型/API/Preview/Slider/诊断/Dialog/Toast/无障碍等，必要UI-only hook和非持久展示标识已准，不因此重新范围停工；不从中文title猜身份、不将整段用户数据送替换器。
- Snapshot既有program_default/stored_custom分层：只内建默认在编辑器显示当前locale，不被TextWatcher当用户提交；自定义/草稿/profile原值保持。必要仅分开默认展示与业务偏好，中文兼容基线/非中文effectivePreference稳定，跨UI请求hash/JSON/cache scope不漂；18golden不改，界面语言不决定翻译目标。
- 诊断壳/title/hint/buttons随语言；报告body/导出技术heading/stage/field/reason英文；用户prompt/源译文/provider/raw错误及实际显示文字证据原样，不以“有汉字”误判日语，逐key对作者资源与实际View属性验。
- N31主矩阵需保持系统/Activity中文，真实官方接口形态存在且ResourceUtils可错取中文，Morphe覆盖14目标；另做缺官方类fallback，不能混为主覆盖。实际默认编辑器/预览Canvas/五档/展开诊断/多选及API模型Dialog必须创建；切zh→ja→en→fr→ar/回收重开没有旧文，故意旧解析/缺绑定/缺资源/残视频状态被同一检查拒绝。缺Morphe覆盖复现或只有232循环/TextView图不验收。
- 已补写docs/N31-CODEX-TASK.md（完整说明/去状态/有效locale/全inventory/默认与数据/主矩阵/边界）和N30-LOCALIZATION-REVIEW追加真实证据，N31尚无产品实现/产物。保护N30菜单/调度/缓存/Renderer/CAS/18golden；原3根7组合兼容入口不借本卡再合并，不恢复N27或VISIONOS。
- 本轮只读源码/最终DEX/资源/测试与管理写入，两份实时状态同步，未产品修改/产品复跑/网络翻译/下载/依赖/签名安装/清数据/提交推送发布。下一卡交Codex完整做N31，用户只需保持系统语言并Morphe中日英短复验全部所列UI，不承担14母语审校。


## 4al. N31 工程闭环交付（2026-10-03）

实际HEAD fa10360、产品d5ca720，仅docs差异；初始两份状态SHA一致。统一官方MORPHE_LANGUAGE快照，DEFAULT随宿主Context；本补丁配置Context、稳定key、4类别展示标识和设置加载/重绑接缝，仅自有UI。两处summary按定案14语种，多选14纯名称/标准勾选无视频状态；原native locale/sort/clone/去重保持。默认展示随UI，业务中文DEFAULT固定、非中文effective既有、自定义raw；语言刷新无存储/revision/request变化，显式同模板paste保持custom。技术正文英文、壳本地化、旧raw不改，所有源/译文/provider/user证据原样。

Java680/680，原专项68+原中文golden探针2、Morphe形态Dialog9；failure/error/skipped0，main/K12/R1/400轮保持。234×14，中文原Activity/Application/system与14显式覆盖×4尺寸字体共56真实23节点树，另14缺官方类完整fallback；zh/ja/en/fr/ar真实控件截图，所有动态状态/错误/5档/对话/Android9复制有14证据。原英语UIgolden曾把英默认带入中文请求：before不改，D分层后仅请求/hash/cache身份修正；准确N30提交以原方法/样本/断言中文配置回放，18组和activate与N31逐字段相等。

7组合/全部11DEX/58261类/322982方法/626704分支、公开API/新UI接缝/CRC/资源/aapt/min28/verify_bundle/N8Verify通过，MPE内嵌独立等值。Python27，冻结4/4/4与invisible_ms0、ACCEPTANCE/业务源码零diff；12972历史文件+8外部输入SHA字节不变。正式MPP使用Android根DEX；失败普通build与旧候选保留为provisional。三件套build/local-test与build/n31-composition-final，完整SHA/字节见N31-LOCAL-TEST-BUILD，逐角落清单见N31-UI-LOCALIZATION-INVENTORY。远程API/依赖/下载/签名/安装/卸载/清数据/推送/发布均0。

完成即停；用户保持系统语言只切Morphe中→日→英短查，手机/母语边界未验证；不要求用户全表母语审校。

N31身份补记：核心提交 `dc304cbe3ae995e7e0edad2754b160c959cafce3` / `anchor/n31-dc304cb`；docs-only 后继仅登记身份，未修改已验证产品/测试/产物。


## 4am. 用户指令：删除冗余独立语言补丁（2026-10-03）

本节为已撤回的后续历史：用户最新指定原N31回退，当前施工状态与新卡见§4ao；不覆盖旧证据，也不再推荐此历史包为当前修复候选。

本轮用户明确覆写旧三根冻结：自动翻译14语言功能已在AI caption translator中，直接删除Add Simplified Chinese to auto-translate。已删public root、CaptionFeatures.simplified、simplifiedInstalled及独立强制zh-Hans加入；简体中文和其余13语言全部沿AI设置保存集合提供，AI开关关闭仍有效，默认空集合/用户selected_codes不变。保留Remember独立原生记忆；2根3个非空组合通过。README、生成patches-list及本地发行校验一致，旧公开URL/日期/patches-bundle不变，不发布。

682/682 Java（680+2菜单归属/简体去重）、12/12元数据，原N31语言控件/中文18golden/activate继续相等；翻译调度/分页/cache/overlay源码逐字不变。最终11DEX/58261类/322981方法/626701分支与公开UI/native hooks、CRC/resources/aapt/min28/verify_bundle/N8Verify通过；MPP自身只有AI和Remember，内嵌MPE独立等值，旧root名与installed标记从DEX删除。新交付build/local-test/*-n31-two-patches及build/n31-two-patches-composition-final；全SHA/字节见N31-PATCH-CONSOLIDATION。55份历史捕获SHA/字节不变，旧N31全量交付保留。未签名/安装/清数据/推送/发布，远程API/下载/新依赖0。完成即停；实际核心commit/anchor另补记。

N31两根后续身份：核心 `66a258466a912e43ff67fb174cb5052ee3d5d548` / `anchor/n31-two-patches-66a2584`；docs-only身份后继，原N31源码与交付作为历史保留，新双补丁包为本轮交付。


## 4an. N31 设置页重启：真实VerifyError与本地修复（2026-10-03）

本节为已撤回的后续历史：用户最新指定原N31回退，当前施工状态与新卡见§4ao；不覆盖旧证据，也不再推荐此历史包为当前修复候选。

用户手机使用双补丁MPP自行合成安装，进入Morphe即重启。SDK37／arm64的真实crash buffer和安装APK显示AbstractPreferenceFragment.lambda$new$4 [0xC]、initialize [0x3E]的v2类型不符：N31返回前onSettingsLoaded把已成为synthetic lambda／boolean／exception／PreferenceScreen的p0按Fragment传入，类验证失败。旧安装包SHA C32217BB…保留。本项目注入错误，既有离线hook计数/分支检查未验证ART类型；不把682控件全量当设备页验收。

最终只改设置Kotlin接缝：initialize紧邻typed getPreferenceScreen move-result→rebind(PreferenceGroup)，生命周期入口p0仍为Fragment；lambda4098是实例方法，hook在updatePreference写新语言后、updateUIAvailability前用同一FiveRegister.registerC活receiver；View返回hook不变。新的SettingsHookRegisterAudit集成最终审计，拒绝坏旧包寄存器和入口绑定的旧语言时序候选。实际Java/UI10通过，原运行时Java/tests/resource/metadata和MPE逐字不变，沿用相同输入SHA682基线；翻译请求/paging/cache/overlay/用户selected_codes不改。

最新本地只读emulator SDK35/x86_64 ART Class.forName(true)同旧包失败、新包通过4设置类，最终APK SHA1982448D2FF7D29CC1A7882D1036C5972021D6546221F28D46A30D484B2D9651；11DEX/58261类/322981方法/626701分支审计0问题、资源CRC/N8/aapt/min28通过。修复MPP SHA5AC2509DB8C1A32C2AF0CC5A6579039AE58ED27A1D0CD23690011A30CEB8B6ED；MPE315026FA…与双补丁上一版相等。新路径build/local-test/*-n31-settings-crash-fixed及build/n31-settings-crash-fixed-composition-final。旧N31/双补丁/失败候选均留存，不覆盖。

用户最新明确所有需要文件自行传手机，最终仅放本地，不再手机push/安装。此前已推前一入口候选MPP01792C50…至Download与/data/local/tmp验证，坦诚告知，非最终版；不删除/不安装/不清数据。最终实机SDK37安装点击未验证，用户自己用最新本地MPP重新合成签名覆盖安装，再开Morphe、中文→日→英短查。本轮未签名安装卸载清数据/Git推送发布、API下载新依赖0。完整SHA/证据/验证边界见N31-SETTINGS-CRASH-FIX，完成交付即停；身份commit/anchor另补记。

N31设置重启修复身份：核心 `1bc94aed459300b79bd5ee93dca03d2db99d593c` / `anchor/n31-settings-crash-1bc94ae`；最终修复MPP5AC2509D…、APK1982448D…仅本地交付，等待用户自行合成覆盖安装后打开设置验证。

## 4ao. 用户授权原N31回退与两根导航复核、新N32卡（2026-10-03）

用户观察“合并为两个补丁后，点AI里的自动翻译语言进入通用设置”，明确要求规划者先直接回到build/local-test/patches-1.3.5-本地测试包-n31.mpp原初版，再核验原因并给新执行对话卡。本轮已执行回退，不仅提建议。

- 原初N31源码dc304cbe3ae995e7e0edad2754b160c959cafce3/anchor/n31-dc304cb，1a3c555是docs后继；MPP1165680字节/SHA AF084C20C32636EBA051B2891BDAFC5419BD54A98DBB28974CD441BE18AF913C，原MPE2803268/SHA05F60BEDC300BB2AAAE1ED3788EF1FA2F26F4C2066117A1DD275EAC27331BCEF，原APK198125124/SHA0174A5D8AF707501CF6A42135307B178121A3B4362BE6B16656F79D86EE72075均未改。
- 回退前HEAD150c91f67f4612a94674aef0ee5c8da48a51ed26、工作区仅外部1.45MPP未跟踪。新提交恢复28个非docs路径：生产/测试/metadata/README/发行校验/构建工具全与dc304cb一致，原三根也准确恢复，不混留1bc安全hook或两根标志。未git reset/rebase/amend，旧HEAD保留backup/n31-later-150c91f及ZIP、完整diff和状态before在.verification/n31-rollback-review；52历史产物字节/SHA全一致。
- 两根删除66a2584与设置crash修复1bc94ae是独立变更。三正式APK的morphe_prefs.xml真实aapt全树输出SHA同6F71503B97272032F2F274DEDE268A8C891046A4AA3B2AAD4A7F66F2732BC569；语言项仍CaptionLanguagesPreference/deepseek_caption_languages/order1，没有general路由。语言控件/binder/locale/资源patch源码在三点相同；最新onClick仍只showLanguages，66a没改settings binding hook。不能凭“减少root”先后关系断言直接原因。
- 原N31已有真实p0返回寄存器复用缺陷：initialize返回v2是PreferenceScreen、lambda分支是synthetic/boolean/exception，却按Fragment传入，SDK37旧crash/SDK35 ART before有明确VerifyError。它先于根数清理；用户指定准确恢复后该风险一并回到基线。**当前恢复不宣称旧N31安全、不让用户再装旧包测试**。新卡必须闭合类型安全，不保留此缺陷发布。
- 最新历史修复ART after只是Class.forName四类验证，不是菜单点击签字。现有N31RuntimeUiTest直接showLanguages绕过视频→AI→真实ListView→官方listener→Preference链；此为确定的验收缺口。新错跳general尚无完整点击记录/当前实机包身份/本轮复现；可能settings hook重绑/adapter对象与行标签失配/时序问题，**不写已经复现根因**，新卡先对照并记录adapter/key/class/root/点击对象再最小修。
- docs/N31-ROLLBACK-AND-NAVIGATION-REVIEW.md、docs/N32-CODEX-TASK.md已生成。N32从当前原N31基线，明确允许仅设置hook/UI绑定与删除冗余根/metadata测试修改；先复现精确路由/修类型，再最终AI+Remember2根3非空组合。没有跳页证据不能用手工错listener负例或类加载结果宣称完成；不硬编码语言标题/position/general跳转，不盲cherry-pick旧整提交。
- 保护N31UI本地化/default业务分层/用户prompt/API/profile/selected_codes、原native权限/650ms断点/cache-only启动/连接预算/转场render权限/R1CAS/golden/分页/字号位置，N27/VISIONOS不处理。独立-n32三件套，原-n31/-two-patches/-settings-crash-fixed历史不覆盖；最终真实列表点击/保存取消返回/general自身导航/语言变更、真实序列化ART/types/branches/API/资源验收，不只p.showLanguages。
- 本轮只回退与静态对照/管理记录，没有产品全量复跑或新包构建。旧680/682不冒作本轮通过。没有签名/安装/卸载/清用户数据/向手机push/翻译API/下载/新依赖/Git推送/发布。两份状态同步，恢复commit/anchor另补实际身份；新Codex执行N32，用户自行操作最终手机安装。

回退实际身份闭合：本地恢复提交 `282d155fd08e126a36c4eec8b6ef8be85eff1827` / `anchor/n31-restored-282d155`，其全部非docs跟踪树与原N31 `dc304cb`相等。后续只补docs身份，指定MPP AF084C20…未改，活动三根为准确恢复，不是新修复候选。执行N32允许此回退HEAD/doc后继，无需再回dc304cb或丢规划文档。

## 4ap. 当前手机原N31重启实证与补充N32要求（2026-10-03）

用户进一步确认三根全打/不选加入简体中文均在Morphe重启，授权读取连接手机并要求结合N31执行对话补充安排N32。规划者仅adb devices/logcat -d/dumpsys/getprop/pm path及pull base.apk；没有logcat清空、push/安装/app_process/启动页面/卸载/清数据，没有产品修改或产品测试复跑。

- 当前包app.morphe.android.youtube 21.16.256/minSdk28/target36，SDK37/arm64；更新2026-10-03 14:58:23，base.apk199529446字节/SHA FB7B28B425A3DCE8884EF9BBFEB6EF8D93FC7B782B9E2E24EDC472D9A9116C38。实际flags aiInstalled=true/memoryInstalled=true/simplifiedInstalled=false，未选简中这一条件已读包验证。
- 14:58:34.080 FATAL EXCEPTION main，VerifyError拒绝AbstractPreferenceFragment并连带Toolbar/YouTubePreferenceFragment。lambda$new$4 [0xC] v2=synthLambda9、initialize[0x3E] v2=PreferenceScreen，却传onSettingsLoaded(PreferenceFragment)。当前APK三个相关方法dump与原N31unsigned方法dump逐字相同，**旧p0末尾方案就是本次重启根因，非简中root、网络或签名**。ART类加载验证所有方法，不等错误分支执行，所以点入口即崩溃。
- 修法已固定为活Fragment入口/typed screen结果与实际语言写入之后的类型安全重绑；禁止每个return盲传p0、cast/吞异常骗验证。必须测试生成DEX类型/语言时序与真实设置初始化/导航，不能将680控件绿或四类Class.forName绿等同完整设置能用。
- 当前手机装回原N31且类加载失败，不能现场执行已撤回方案的导航。此前三包settings XML/语言onclick相同排除项仍成立，点击重绑root/adapter/View身份和listener时序是待查接缝，**不虚构已抓到General错页分支**。N32需先B1类型安全才能执行A/B2导航，比照N30、撤回1bc和最小安全N31，在完整ListView点击链保存对象/key/class/root/打开窗口证据；不能直接showLanguages或固定位置拦截伪装。若不能复现独立导航故障，要保留缺口而非把实机重启根因冒作两bug根因。
- 已重读用户N31对话附件307行，提取补充要求：12:29明确删除/合并第二root（已有AI14功能只需删冗余）、诊断原始source/prompt/provider中文原样、技术字段英文、本地化/default请求分层保留；13:44明确所有文件只放本地用户自传；加快收尾不省关键测试。本轮读手机授权不含写入/安装，新执行对话只在已有本地模拟器主动ART/UI测试。
- docs/N32-DEVICE-CRASH-AND-REQUIREMENTS-REVIEW.md已创建，既有N32卡增加当前实机input/阶段顺序/N31补充要求、完整实际点击与精简事件标记，本地输出-n32不覆盖原31/两根/旧crashfix。只AI+Remember2根3组合、234×14 UI/用户原值/R1CAS/650ms断点/cache-only/转场/分页/字号不变；不重开语义/供应商开发，零下载依赖API。
- 原只读证据.verification/n32-device-review/installed-current.apk、device-input/phone-analysis-summary、crash-current/phone-crash-key-lines、current-root-flags、current-installed-settings-methods/original-n31-settings-methods、package-info。说明用户自己的安装APK SHA不与unsigned工程包硬比较；按实际method/hook判定版本。
- 源码仍原N31恢复，原MPP AF084C20…/52产物保留；本輪無新MPP/修复代码/签名安装/手机push/Git推送发布。两份状态同步，管理docs可docs-only提交后继，N32新对话继续，用户不必为before重新安装或重现崩溃。

## 4aq. 可开设置撤回版真实BadToken，N31双回归与N32窗口定案（2026-10-03）

用户自行安装可开设置的撤回版，仍称语言项后显YouTube通用页、退出重启，并询问原N31是否已有以及是否回N30。规划者读取已有logcat、dumpsys activity/window/package并pull当前APK；没有主动点击/安装/启动/app_process或手机写文件，当前产品仍已恢复原N31。

- 新安装更新15:24:44，base.apk199529446字节/SHA BFF42C488842FE793BCEA5028208D23FE47F831B867480676FAA99AB86E2E111；三个settings methods与撤回1bc94ae typed-hook最终dump相同。这是可开设置阶段，不能继续只引旧FB7原31 VerifyError解释所有现象。
- 15:25:58.048 FATAL main是WindowManager.BadTokenException，token null。在Dialog.show→CaptionLanguagesPreference.showLanguages:42→onClick:22→Preference.performClick→PreferenceScreen.onItemClick→官方DebouncedItemClickListener→ListView实际点击链，正确语言handler已收到click。它直接证明弹窗挂窗失败/重启机制，不是单纯猜adapter误选General。
- N30语言Builder(getContext)沿原Activity/window；N31将其改为Builder(CaptionUiLocale.snapshot.context)。Snapshot是ContextThemeWrapper(base.createConfigurationContext(config),0)＋copyTheme，配置资源Context丢Activity专属WINDOW_SERVICE/parent token，主题复制不补窗口归属。现有SDK AOSP源android-37.0：Activity.getSystemService WINDOW返回mWindowManager，ContextWrapper配置委托ContextImpl新Context，ContextThemeWrapper其余services委托base，Dialog构造读WindowManager；源码摘要/sha存证，并非下载或偷换用户系统版本。
- 版本blob确认语言类N30bb2d494…→原dc304cb/66a/1bc均33192c6…，locale类N30不存在→原/后续均51aa8ce…。所以**原N31就有两个独立工程回归**：返回p0类型错导致设置先不可达；typed修完后资源Context错owner才显现。不是用户要求改导航、不是删除第三根造成，不把scope合理当实现无错。
- 共享CaptionSettingsDialogs.confirm/show把同context给Morphe CustomDialog和platform fallback，Android9诊断copy页也用资源Context；须全窗口inventory统一activity-safe，不给语言弹窗加特例。Toast/纯资源/临时预览不按普通Dialog token合同盲改。
- 方案：保留CaptionUiLocale资源/文本与本地化绑定，Dialog用当前真实settings Activity或Activity-base localized wrapper，theme/config仅资源变化而WINDOW_SERVICE仍归owner。getContext非Activity时在真实Fragment/tree/View接缝绑定活owner弱引用；不拿Application/主播放器Activity替代，无活owner/销毁只受控拒绝，不猜token、不overlay权限、不仅setOwnerActivity/catch BadToken吞掉。所有共享Dialog/异步结果/旋转返回owner失效一起验。
- 手机记录尚无General创建前完整路由trace。日志排除“本次语言handler完全没被点”主要猜测；用户所见General可能背景/恢复副作用但未独立证，不宣称实际导航绝无bug。N32以已有BadToken真实点击before修确定机制，after实际14窗/保存取消/返回AI不首页/官方General正常；若General依旧，查actual root/activity/delegate事件最小修。不能硬编码标题/固定行号或等不到一个General-before就暂停已定根因修复。
- 评估不全仓回退N30：其核心翻译/缓存/播放器成果均保持，问题集中N31新设置层。恢复N30窗口所有权合同并重新接安全本地化更小、更快，整退会丢已需UI/default分层并重做同批工作。用户本轮是询问方案，不授权自动全仓回30；原31恢复基线保留。
- N32卡已整体精简重定序：ART types→Activity/WMS全部窗口→真实list/返回→2root3组合，保留UI14/default用户数据/诊断原始文案/N30安全网，严格before/after主测试不要Robolectric fake窗口/仅Class.forName；最终本地只读emulator主动验证，手机用户自行安装。N31对话补充本地-only/两根/诊断原样/加速要求保留。
- 双agent本轮独立只读版本对照结果一致，未改任何产品。新证据.verification/n32-device-review/installed-navigation-current.apk、navigation-current-input、crash-latest-user/current-navigation-language/current-navigation-fragment、withdrawn-navigation-root-cause/versionblobs、android-window-context-source-excerpts/source-sha。旧N32卡before副本保留，N32-DEVICE-CRASH-AND-REQUIREMENTS-REVIEW追加§6。
- 本轮无产品修改/构建测试复跑/远程翻译/下载/依赖/手机写入/安装/清数据/Git推送发布。两份PROJECT-STATE一致后同步；当前仅docs可提交后继，下一新对话按更新卡N32施工，不再补旧通用页hack。

## 4ar. 用户停止失败N32、恢复N30并独立重新规划（2026-10-03）

- 用户报告暂存N32中测试API/刷新模型/保存诊断无响应、语言窗风格偏离N30/Morphe、繁体标签错误。执行者以c88abcc暂存后停止，不是交付；695离线测试不能覆盖这些问题。
- 用户授权本规划聊天直接恢复N30开发环境，并要求下一阶段独立设计，N31仅允许文字翻译成果，禁止其他31/32实现复用。
- 全tracked非docs树已恢复到d5ca720 / anchor/n30-d5ca720，恢复前c88abcc以backup/n32-wip-c88abcc保留。旧文档/包/失败证据保留，用户官方输入1.45.0未改。
- 新要求：说明添加到原生自动翻译列表、纯语言名无视频可用状态且宿主风格；中文（繁体）准确命名；AI summary说明选自动翻译目标后用AI实时翻译；14语种所有设置角落独立闭环；直接删除独立简体中文root；深入分析200407诊断和manual/auto四源文件，通用修复漏/晚/短呈现。
- 最新诊断build=n30、32/32HTTP成功，不等于字幕呈现或语义合格；需从源时间/事件/排版检查。规划者本轮不实现新功能、不签名/安装/启动手机、不远程API。后续新卡完成即停。

## 4as. N30重新开发的两期定案、200407原生产探针与N33卡（2026-10-03）

### 当前身份与已执行动作

- 恢复提交7d6821e772b9959158dd7ac41bd7e626aef48d1c，anchor/n30-restored-7d6821e；源基线d5ca720/anchor/n30-d5ca720。全部tracked非docs逐字节相等；随后规划文档后继不改变产品树。backup/n32-wip-c88abcc保留失败暂存。80件历史MPP/MPE/APK前后hash0差异，未重新建包/签名/安装/清数据/手机启动/远程API/下载。
- N31只允许文字翻译；从dc304cb导出纯catalog存 .verification/n33-planner/n31-text-only-catalog.json。其余31/32源码/窗口/owner epoch/hook/stub/脚本/构建候选禁止复用。N32失败暂停文档保留，不写交付通过。

### 本轮诊断及原字幕的强证据

- 200407输入433812B / 543C5A6CD01C34F9E08763C7988E2148D2389024FC318F3D21BDE43EF042EAD4，manifest n30/official1.45.0/presentation n29-v3，1132 history＋32 quality。旧31和32WIP的exporter实际标签为n31；没有安装APK SHA after，不拿manifest替代完整APK验真。
- 32/32 HTTP2xx，无failure/internal retry；26逻辑block＋6额外同block请求，5repair_no_progress。tokens63268=56545+6723；RTT874/median1366/p95 1764/max1945ms。本次漏/晚不因网络失败；不调高并发/retry。
- N30真实CaptionDocument/RebuildSource独立javac原生产探针，manual JSON3的1224词start/end与诊断全部1224 IDs完全一致，且source bytes23150、169 coarse cues。实际主源人工字幕；全1224 timing仍ESTIMATED。ASR reference实际17840B但未导出正文，与supplied auto JSON3 106667B不能混作同payload。
- 18个layout fallback用实际REBUILD_SELECTED renderInput/range复核，18/18都触发RebuildPageLayout在几何前的8CPS硬拒绝。不能由此直接声称18条全部真机放得下；新任务须实际两行测量，soft reading watch不能单独致空。
- 14个deferred lead记录，原owned windows合计23526ms（不是实测blank_ms，不与fallback叠加）。其中119316–121314ms的“配备6.7英寸显示屏……”提前35.9s已接纳，却119338ms仍为空，121447ms才显示merge且窗121714ms结束，直接解释晚/短闪。
- supplied manual/auto JSON3的align生产探针：1131唯一锚词/拟1122native替换、44交界冲突；当前全片事务返回原对象，aligned0。仅说明该通用代码机制，不冒认手机17840B参照正文。safe连续片段局部提交，歧义/冲突保留估计，不全片shift/裁词。
- supplied auto VTT原解析6963 estimated词，含内嵌时间/标签与滚动旧行；auto JSON3 1260词（1221native/39estimated）。当前manual1224没有该异常，N34需格式判别/JSON3优先与结构carry证据检查，不按重复词全局去重。

### 两期安排与独立UI设计

1. **N33下一张卡**：用户1–4固定AI/语言功能说明、picker纯语言名无状态/繁体名校正、14语种全部UI与默认显示/自定义保护、直接删独立简中公开root。以N30 Activity/dialog/click原处理路径，仅String/Locale解析＋自有Preference/View标准生命周期刷新。PreferenceScreen是final，保留原Screen，由child getParent更新父标题/说明；分类才可轻量子类，locale变化通过官方public Setting.key/preferences→SharedPrefCategory.preferences标准监听器弱持有自有树、main合并一次post。不改官方Fragment DEX或恢复31/32绑定/owner guard。真正点按API/model/save、保存/取消/返回、明暗大字与14控件树是交付门槛，不能靠资源齐全/离线数量替代。
2. **N34随后**：通用soft CPS/几何呈现、禁止为merge先压空lead、候选merge不合格退当前独立事件、可信局部alignment和source/presentation trace/格式，14目标冷热/时窗/语义切口复核。不额外改vendor容量、focus2/prefetch2/total4、N30启动缓存优先、R1/CAS生命周期或N27避让。新卡按N33实际交付身份再生成，尚未开始。

- UI locale显式Morphe override优先；官方 ResourceUtils.getString及getStringByLocale实际上均可直接读Activity，本轮独立官方MPP DEX已证。资源ConfigurationContext只在取字函数内部读cap_*，不对外返回Context，不给窗口/View/业务。DEFAULT跟随宿主；native菜单按其实际YouTube locale排序，不强套Morphe设置locale。
- 默认要求显示与runtime分开：N30DeepSeekConfig.DEFAULT_PROMPT、effectivePreference及CaptionLanguageContext.preference路径不同，新的UI取字不能代入runtime defaultPrompt。runtime保持N30既有内容/identity；未自定义editor显示localeDefault，真实custom原文不翻译。切语言/rebind/profile不得误autosave/改keys。
- 程序报告heading/stage/field/reason英文；UI壳本地化；原source/translation/custom/provider数据原样。N33不更改字幕业务，只调整构建标记/纯文案等允许项。
- 入口仍视频页旁白之后无图标；多选列表内14项、初次empty、cancel不写；AI已装但OFF仍保留native添加且API0。N30恢复树当前仍是三公开root，删独立简中属于N33待实现，不能说回退时已完成两根。
- N33真实最终包测试只用明确emulator序列号，最终交付仍unsigned、手机只读；独立重建fixture不复用N32 host。旧正确source/request/prompt/cache/中文golden不变，旧UI错summary/status断言可具名改；冻结4/4/4与invisible0、ACCEPTANCE历史不动。

### 新文档与证据

- docs/N33-CODEX-TASK.md：完整闭合任务、实现边界、真实交互测试与-n33独立三件套要求。
- docs/N33-REPLAN-AND-DIAGNOSTIC-REVIEW.md：本轮逐问题根因、可行方案/边界、两期计划与一手规范。
- .verification/n33-planner/：inputs/hash、80历史before/after、独立official locale dump、141 UI调用点/22类、18 fallback、14defer、生产source probe和JSON总结。本规划聊天未跑全项目Java/组合/DEX；669/669为历史N30执行记录。

后续执行者先读这节与N33卡，产品基线允许docs-only后继自动开工，避免重复HEAD短hash暂停。所有新产物-n33不覆盖旧包，完成停；用户下一步将N33卡交新执行聊天。


## 4at. N33 从恢复 N30 独立完成、十四语种实际覆盖及两根交付（2026-10-04）

- 已按 N33 卡完整实现/验证/独立建包；开工 HEAD 6cbee8bc7fd8d80364bfb65612efc80c94e35c88 是 7d6821e 的 docs-only 后继，tracked 非 docs 与 d5ca720 相等。N31 仅提取纯翻译 string 值，其余 N31/N32 实现、hook、host、stub、脚本和产物未复用。
- AI 与语言入口固定说明；语言窗口十四个纯名称/checkbox，无视频可用状态，简繁名称准确，save/cancel/Back 多选与 N30 Activity/窗口/导航路径保留。直接删除公开独立简中 root，正式 MPP/patches-list/README 两根为 AI caption translator、Remember caption selection；AI OFF 的既有原生多选添加能力保留。
- 新 UI-only String/Locale resolver，只读真实 Morphe EnumSetting；临时资源 Context 仅内部取字，不给窗口/View/业务。final Framework PreferenceScreen 不继承/换导航，自有 child 标准 getParent/attach/bind + 一个按官方实际 locale key 过滤的 weak SharedPreferences listener 合并 main post，只刷新自有 AI 树；无官方 Fragment 字节码改动、owner/epoch guard 或全树轮询。
- 240 keys × 14 / 3360 配对，XML/catalog/fallback 同步。标题、summary、分类、hint、accessibility、五档、默认显示、preview、诊断 UI 与按钮/Toast 覆盖；模型获取的内部空列表说明本地化，HTTP 状态包络规范为技术代码，provider 原文保留。档名完整原生短词、不缩字；N25 几何/物理端点、主题与动作职责保持。
- displayDefaultPrompt 与 N30 legacy runtime 默认/canonical effectivePreference 分开；切语言、rebind、滚动、flush/profile copy/save 不误存默认显示串，已存 custom 原文不迁移。字幕调度/缓存/源/目标政策/render spec/font/metrics 和 18 中文业务 golden 保持，未施工漏/晚/短机制。
- 官方真实 AppLanguage 只有泛中文 ZH、没有繁中显式项。用户明确同意：官方 13 个显式选项 × {320,420dp} × {1.0,1.3} × 真 light/dark = 104 cases；独立 DEFAULT+繁中宿主实际解析 zh-Hant-TW，另 8 cases。按实际 locale 去重，本补丁十四语种实际覆盖为 112 cases；额外 DEFAULT 简中 8 cases 不计为新增语言，不把 13+DEFAULT 的数量冒称十四语种通过，未新增官方枚举。
- 最终实际 DEX/resources 独立验证宿主、emulator-5554/SDK35/ART/WMS：真实官方 debounced listener 点按根→视频→AI→语言窗口，保存/取消/Back/General 正常；API 空 key 0、本地成功/503、模型刷新 popup/选择、MediaStore 写入 IS_PENDING=0/raw UTF-8、profile 改名/删除、清 key/cache/diagnostics/reset 均 PASS。模型失败/无数据及请求途中切法语的反馈/按钮恢复另有真实事件。Android9 分段标题/序号/clipboard 生产分支在 SDK35 真窗口及 SDK28 JVM 验证，不冒称 Android9 OS WMS或用户手机播放验证。
- 真明暗由官方 isDarkModeEnabled/背景色确认；完整最大档 preview 全文单行/lineEnd 与实际 onDraw box 在框内，所有 picker 行按真实 320/420dp 窗口完整测量。当前控件→资源/key→locale→运行时 inventory 11760 观察、193 调用点/26 类；繁中设置/默认/preview/五档/diagnostics/语言窗口均实测。
- 本轮 N30 before 669/669，最终 N33 Java 676/676（新增 7 反例、failure/error/skipped=0），Python27/27及 release11/11。N30/最终各104实际 loopback 请求，default/custom × zh-Hans/Hant/ja/ar ×13 UI locale 的 cfg.prompt/effectivePreference/prompt SHA/cache identity/request/plan JSON 全部零差异。最终 Java 输入 SHA 599169b13f3da65385f9c1cbf06c6e7c6eab6a930425201e928e81b0dfe0e2f2；206 文件逐项复核一致。
- 三有效 root 组合3/3；旧 root、残缺 locale bundle、未知 menu signature/partial DEX 拒绝。实际 patch PASS92，相同 N30 官方1.45组合93，删除一 root；不硬改旧84计数。最终11DEX/58257类/322999方法/626770分支，invalid/problem/binding=0；39个官方设置相关方法的寄存器/指令/偏移/异常处理与 N30 完全一致，无旧31/32绑定类型/替换官方类/验证 fixture 泄漏。MPP72 entries，内嵌MPE=独立MPE；CRC/resource/aapt/metadata全通过，正式APK unsigned预期拒绝验签。
- 冻结计分4通过/4既有失败/4未验证及三invisible_ms=0保持，ACCEPTANCE/frozen无diff；80旧交付及277713旧文件SHA/bytes零差异。失败候选/负例全部保留，新输出n33，未root clean。docs/N33-LOCAL-TEST-BUILD.md完整记录哈希/源码/默认协议/真实交互/边界/旧UI断言55值变化与用户短复验。
- 正式新三件套（版本1.3.5、官方1.45.0、原host21.16.256/min28）：build/local-test/patches-1.3.5-本地测试包-n33.mpp，1242450B / F60F7B50295566D0FC887A3392E78B017685E9B37F4C3C9EC36BE45CBE1C866E；extension-1.3.5-本地测试包-n33.mpe，3044228B / 5D501610F230FC28ADDDF9D3F363586933C61DF434FE8DE75E11403620F26970；build/n33-composition-final/YouTube-21.16.256-本地测试包-n33-unsigned.apk，198221091B / 08AA970CC8A63643083108DE8732B92247C0A08212C2FF87C47EF95AB172B4CC。
- 本地实现提交及 anchor/n33-<真实源码短hash> 的具体身份在随后的 docs-only 身份补记中落定，源码不得 amend；两份 PROJECT-STATE 同步。远程翻译API/新依赖下载/手机写入安装启动清数据/Git push发布为0。N33完成即停，N34未开始、不生成下一卡。


### N33 本地提交身份补记

- 实现提交 `b52b65b7a206f1a07464dae62dc30cabc164bf10`，锚点 `anchor/n33-b52b65b`；随后仅本 docs-only 身份补记，不 amend，不改变非 docs 源树或已验证三件套。
- 最终实际覆盖：官方 13 显式选项104 cases；DEFAULT＋宿主繁中解析 zh-Hant-TW，另8 cases；补丁实际去重十四语种112 cases，extra DEFAULT简中8 cases不作新语种。
- 两份 PROJECT-STATE 字节/SHA同步；工作区仅保留原官方输入未跟踪，未推送/发布/手机写入。N33完成停止，N34未开始。

## 4au. N33用户六项短验通过、093813漏显根因和N34定案（2026-10-04）

### N33当前产品与用户验收

- 用户原话“六项测试均完成，除漏字幕外未发现任何问题”。登记设置入口/返回、多选与纯语言名/说明、API-model-save动作、日语本地化/默认保护、亮暗与原数据、原生菜单/播放冒烟短验通过；不宣称14语种母语语义和所有显示情境全绿。
- 当前源码b52b65b7a206f1a07464dae62dc30cabc164bf10 / anchor/n33-b52b65b，HEAD4a76cd4及新规划docs-only后继；非docs与锚点零差异。MPP/MPE/APK独立hash与交付相等；唯一未跟踪官方输入1.45.0不动。旧N30恢复只是历史，不能按旧§0的N31/N32顺序回退施工。

### 新诊断实证

- caption-diagnostics-1.3.5-20261004-093813.txt，780916B / 24494E5EE4F379CC9C4716C91918B12179951676BC26938E7DEC4F4D60150380；manifestn33/official1.45.0，2812history/50quality。50HTTP2xx/0network failures、49structure accepted/1rejected；qwen3.8-flash，81834tokens（70808+11026）。与前轮deepseek不同，不能跨provider按RTT直接判版本回退。
- zh-Hans会话1：26请求/20逻辑块，7layout fallback均8CPS硬拒绝；没有deferred/lateUnreadable。7句包括25.193–26.023“情况一直在改善。”、71.571–73.766、79.905两重叠候选、168.169–170.077、251.431–253.045、253.127–255.011。实际1121px标准几何前就被清空；原生产Android NATIVE测试7句全部两行可放，简/繁机制14行全fit但shown空，SDK/OEM不冒作手机after。
- 额外6同block请求中5纯layout（2/4/5/11/12），1fragmentary（8），4repair_no_progress；应将纯显示指标/容量改advisory不触发付费语义repair，原语义/结构repair保留。
- ja会话31：24请求/23逻辑块，0layout/hard display reject；唯一request39/block5 source_quote_mismatch把and放进272–287错误引用，安全拒绝正确。request41重试1791077646052接纳，第一次该block选择1791077662718，提前约16.7秒；三事件正常selected。所有ja none选择均落source无词gap；不能把speech外小空档算漏译。
- 两session source_ready同manual JSON3的1224词/169cue，全estimated、aligned0。捕获zh934/ja1065词time逐项与独立manual原解析相等，主源人工。reference17840B实际正文仍缺；不能冒用supplied auto106667B。旧align1131anchor/1122native/44冲突整片回退及autoVTT6963metadata污染仍是有效通用before。

### 全语种风险研判与修复边界

- 中文专属（所有source→简/繁）：8CPS/minimumcells拒绝、lead-defer、未验证merge、late withholding；本次只证7rate，defer本次0但旧200407实证14，所以N34仍修通用机制，不按video特化。
- 跨所有14target：RebuildPageLayout.indexAt首尾clamp、queued show旧position/缺owned窗check；beforeprobeSDK28 Native已复现七家族14行实际early/expired仍visible。Owner valid不代表时间有效；改严格[start,end)与同session最新displayPosition，不改CLOCK/暂停/seek检测。
- compact/StaticLayout与TextView差异是潜在false blank，最多一次恢复许可最大内宽重测，不缩字/越界；日志REBUILD_PRESENTED目前在真实TextView检查前写需后移，区分selection与实际UI applied，不当录屏。无新ja该故障实证，不误标根因。
- 纯source局部计时与结构VTT适配对所有target共享，段内/边界/硬gap/Native保护；不能全片shift或按target字数编时间，无法安全对齐则逐字段保持原source。time/precision改后新cache身份自然失配，旧cache不清也不强读。
- 不改变quote/numeric/semantic safeguards、true geometry/time capacity blank、source gap/non-speech、pending/failure、PIP/compact隔离；无证据不重写调度/源fetch/ref预算/并发/字体/用户drag/N33窗口UI。对pause/seek/旋转/target/video切换、RTL/Unicode、native遮罩及0.5/1/1.5/2倍速、缓冲/前后台做回归；1200ms为media页窗，倍速wall观看时长另计，不能承诺任何条件下永不空白。

### N34下一卡与独立证据

- docs/N34-CODEX-TASK.md：A中文软门槛/候选merge/late/技术prefix→B全语种严格窗/最新渲染时间/真实测量trace→C源局部align/VTT纯适配→D新50及旧32响应/14目标场景/全量及三组合/最终DEX/n34独立交付。同一封闭卡，不另自派N34r/N35或DeepSeek，完成即停。
- docs/N34-DISPLAY-RISK-REVIEW.md：已发生/探针/潜在/设计正确各风险及低风险方案、不可消除条件、source引用与验证边界。输入/汇总/50quality和before测试源/输出在 .verification/n34-planner。
- 规划者本轮before3/3仅复现当前缺陷（native7CPS句及page边界/实际Overlay）；初次probe编译失败因SDK28无Files.writeString保留，改外部probeFiles.write后通过，tracked产品及原测试字节未改。N33全量676/676等是执行者历史结果，不冒称规划者复跑。
- 旧正确中文golden事件文本/source/prompt不改，错误CPS/defer/clamp/late显示assert具名修订；新live呈现另存，冻结4/4/4及invisible0和ACCEPTANCE历史不动。
- 新版正式输出-n34，产品1.3.5/官方1.45/原host21.16.256/min28、两root不变。手机只读，不签名安装/启动/清数据/下载/远程API/推送发布；模拟器有界测试明确序列号，正式APK保持unsigned。N34源码尚未实现。

用户下一步只需将N34卡交执行对话。交付后短验中文上述区间/旧119–122秒lead、日语一个切口和一次pause/seek/fullscreen返回，发完整diagnostic；不要求14种母语全表。

## 4av. 人工VTT补充与N34继承/验收加强（2026-10-04）

- 用户再次提供manual_en VTT并询问分析是否结合N33前轮成果、N34是否需优化。已独立核SHA，12061B / 24C447B2DD1885A7D63033D62C554B50F8C3AE4FA9DC84E23A408B24B33C993D，与前轮文件相同；169cue规范化文字/start/end与manual JSON3逐项相等，无inline timestamp/样式tag。旧原生产1224词text/time/precision对照相等，解析源码未变；证据manual-vtt-json3-parity.json。
- 新VTT对同人工轨格式对照与普通VTT无误去重有帮助，不含word timing，不能补出runtime17840B ASR参考正文或推翻7个8CPS显示误拒绝。N34已引用/继承N33-REPLAN的18fallback/14defer、align44冲突全片回滚、autoVTT6963污染；在开工必读中进一步明确。
- 同一卡加强：manual VTT/JSON3全cue/word/precision/Planner/request/RebuildCache身份相等（相同cfg/target/ref条件）；SourceCaptionCache signed URL层可不同，不能强合并。manual无timestamp不能升级NATIVE，真实同句不同cue窗保留，不套rolling auto carry去重。
- 源轨164个gap（初段常见82ms）不等于实测音频静默；source_gap原因只描述源数据无owned时间，不据此统一补齐/持有字幕、删除短cue或改hard650ms/speaker合同。
- docs/N34-CODEX-TASK.md与N34-DISPLAY-RISK-REVIEW已补充，仍同一N34，无新修订/后续阶段，产品还是N33，两个状态副本同步；未实现/建包/手机操作/远程API。


## 4aw. N34 已完成实现、验证与独立交付（2026-10-04）

- N34 已按单卡闭合完成：当前源码/测试/纯输入 helper 修订，未恢复 N31/N32/N27；产品设置、两 root、prompt/semantic/source ownership、Publication/CAS/Cache 提交和用户数据合同保持。实现源码从 N33 docs-only 后继 HEAD 38a1ce4 开工。
- A/B/C/D 结果：中文完整两行不再被 8CPS/样式 advisory 单独清空；lead/merge/late 使用 primary + optional candidate；所有 owned page 严格 [start,end)，测量完成后再次读取同 Session 最新 position/owner；真实 TextView 最多两行/完整文本/无 ellipsis；源计时 10 个安全局部段、191 words 采用，冲突/硬 gap 段保留 estimated；VTT 结构/实体/voice/style/ruby/timestamp/carry 适配只在纯输入层。
- 最终 Gradle 全量 704/704，Python scoreboard 27/27，release contract 11/11。SDK35 final DEX/resources actual host 固定 emulator-5554 的 owned/actions 均 PASS；物理手机未写入、未安装、未启动、未清数据。
- N34 三件套：MPP EFBB62E81FA430365FD1B1F1856F915439DAD475CB56884509B4DC224A0C7195 / 1,254,604B；MPE 84743177DAAEC8DEF9D539A6E2655D7BDE92A2FABA4885FDEEE5194D23FD3FF1 / 3,066,504B；unsigned APK 859D5D74F52E3AFDB9A72973E01A038A7DBE7D142A3DC743867EABD188390FF7 / 198,231,898B。详见 docs/N34-LOCAL-TEST-BUILD.md。
- 最终 APK 11 DEX/58,267 classes；MPP/MPE/APK branch audit 全部 invalid_branches=0、dex_problems=0、binding_failures=0；官方方法反读 39 项与 N33 相等；AI-only/Remember-only/AI+Remember 组合 PASS，obsolete root 按名称拒绝。N34 实际 composition 92 PASS，N33 同官方也是92、N30历史对照93，不硬套旧 84/92 分母。
- 历史权威身份清单 281,140 条、N33/N32/失败候选原件保留；ACCEPTANCE.md、scoreboard、官方输入与旧交付 bytes/SHA 未改。实现提交 26edf555c8956e12a4b0448b72aef34597141409 / anchor/n34-26edf55 已创建，main/test/tools 与锚点保持相等；本次只做随后 docs-only 身份补记；完成即停，不自派 N34r/N35。
- 用户短复验仍为：中文 25s/71–83s/168–170s/251–255s 与旧 119–122s lead；日语同片段加 pause/seek/fullscreen 返回，保存完整诊断。SDK35 宿主为合成 player surface，不冒称真实视频/音频同步或物理手机 after。

### N34最终本地身份

- 源码提交 `26edf555c8956e12a4b0448b72aef34597141409`，tag `anchor/n34-26edf55`；无 amend/推送/发布。两份状态同步，工作区除官方输入 `patches-1.45.0.mpp` 外干净。
- 最新最终源码全量 evidence `full-final-06`：704/704（failure/error/skipped0），input SHA `904c8368030aaf86b148c349830ca289125c3048c83c5e03527b93d815c21c38`、210 main/test/resource 文件；额外 actual-response-replay-04 6/6、82 loopback requests/81 accepted/1 source_quote_mismatch correct reject/remote0，performance-final-03 1/1。
- candidate-03/正式三件套同字节，SDK35 final-03宿主 copied DEX/resources provenance、owned-final-04/actions-final-02 PASS，final-03三件套 branch audit0错误，39官方方法相等。历史281140条hash changed0。
- 已停止N34工程任务，仅待用户上述短复验与完整诊断；实际音频早/晚、物理手机效果不自签通过。

## 4ax. N34手机同步/预览反馈、N35小修与回退保障（2026-10-04）

### 用户要求与身份

- 用户已安装N34，漏字幕缓解但字幕声音不同步、设置preview触上缘卡住/跳到预期位置。随后用标注明确：首次显示relative页start median约275ms/部分近1s就是本轮同步问题，务必详细查机制并放执行卡。不能仅说全estimated搁置。要求简单快，允许DeepSeek先试、不佳Codex，同一卡单执行者，稳定成果须可方便回退。
- 稳定源码26edf555c8956e12a4b0448b72aef34597141409 / anchor/n34-26edf55，交付后继bfe5a0a83beba8c645ca1d88d06d962c1db8f1dd；tracked非docs相等，工作区仅official未跟踪。原三包SHA/bytes已规划者独立核验与§4aw一致。
- 已建立 backup/pre-n35-n34-bfe5a0a，固定交付后继；docs/N35-N34-BASELINE.json记录源/交付/备份及原包身份，N35新候选不得盖-n34。docs/N35-RESTORE-N34.ps1已InspectOnly测试，恢复模式没有运行，当前还是N34。

### 新诊断与同步机制

- 151644txt710679B，manifestn34/official1.45/presentation_revision n34-owned-display-v1，2165history/27quality/27HTTP2xx/27结构接纳/0network failure，26blocks，额外1是block8原片段语义repair。当前无旧hard geometry/CPS/overflow拒绝，不据此说全部帧无漏。
- 排除merge后的119首id/page应用relative页起点median275/p90 821/max990ms；普通event已accepted-before-apply margin median30438ms，delay>=800的多个提前23–39秒ready，不能改provider并发/重译处理。relative媒体窗不是音频波形测量，geometry reflow等影响局部统计，N35 after须现有同源当前time对照和用户听感。
- 主source manual23150B；runtime ref json3/asr17840B、SHAf40f646a…matched1131但native_candidates0/adopted0/aligned0，全1224estimated。不是N34又因44冲突回滚，而无独立native候选；旧supplied106667B的191 aligned实验不冒认手机实况。此轮不新取ref、不做cue提前/假NATIVE。
- RebuildClock目前valid guard1500ms，却只推min(800,age)。直接原函数probe年龄880/1040/1200/1440ms，真实freshplaying应20880/21040/21200/21440而旧20800，额外lag80/240/400/640已证。callback已读同player state却走CLOCK.presentation不给媒体信息，tick才position；统一同数据且去已可信分支800cap是最小修复。原fresh/epoch/±1800/finite speed/playing/paused/seek规则不改，无fresh证据不外推。
- 旧诊断缺hook_age/media_age/state/speed，不能说两代码点解释手机全部延后；N35只在原caption apply trace附有界clock numeric证据，不每80ms多一条persist log。素材时间/估计子句/权重分页余差仍保留，先改善软件额外迟到，不承诺无音频证据全词同步。

### 预览滚动机制与小修

- 最后inline prompt row位于preview前。CaptionEditorViewport当前root lease与可见editor用户数绑定，最后row因scroll detach会恢复softInput模式，回滑attach又切resize。原SDK28 NATIVE no-focus/no-edit probe窗口48→16→48→16，发生无需IME。该窗口重排高度吻合上缘fling跳位，但不是手机FrameMetrics根因自签。
- lease改为root/window寿命；row detach移除自身listener/pendingreveal/padding，不改windowmode，复附复用；window实际dismiss/detach时clean弱lease、可安全则恢复，token gone不强update。保留firstTap/IME/caret/隐私和activity/dialog独立，不全局禁focus或抢OnScrollListener。
- Preview.onDraw每次new TextView/FontMetrics/多轮StaticLayout/measure/layout，重复内容8draw测试cold232ms、warm8.5–14.2ms，每draw9resource reads；只是本机Native观测。N35实例缓存label/layout及size-dependent scene，只有sample/locale/style/density/size等真变重建，保持2736缩放/五档/opacity/preview文案和真几何。

### 执行和恢复合同

- docs/N35-EXECUTION-TASK.md精确限定6生产文件（clock、Controller.time与trace、Overlay trace、viewport、preview、diagnostic build）＋tests/tools/docs；不改source/align/Protocol/Review/provider/cache/CAS/锁/调度/N33设置/native许可/字体。旧clock800cap、lease最后row立即restore预期可具名修，其他assert保留。
- final全量N34704基线一次＋Python27/27/发行11/11＋三组合/最终DEX一次；不重做全14UI/82响应/281140临时文件hash大矩阵。N34原三包/官方/N33final/冻结hash保护，旧文件不删不覆写root clean。实际SDK35 scroll和有界freshclock字幕场景，新路径-n35；物理手机仍只读。
- DeepSeek/Codex都按同一方案，核心未过先WIP本地commit＋backup/n35-trial-tag、保留-n35候选即停。可直接交Codex继续，也可用户显式运行N35-RESTORE-N34工具：拒未保存work，先保存trialtag，恢复全部tracked非docs至N34并新revert commit，保留docs与所有包/证据，state两侧同步。无reset/amend/清数据/手机操作，代码回退不自动安装旧包。
- docs/N35-SYNC-AND-PREVIEW-REVIEW.md完整机制与证据边界；docs/N35-ROLLBACK-READY.md操作说明；.verification/n35-planner input/151644summary/119page delays/ready margins/probe-before-01失败＋before-02原生产3/3。最初probePath导入冲突已改外部probe，tracked产品及原测试无改；本轮没有新包或full704复跑。

后续交付用户同慢片段30–60秒＋pause/seek/fullscreen一次，无IME快慢滑preview上缘各三次，导出诊断。N35开始前只管理文档，source依然N34；不得自派N35r/N36或继续旧N31/N32。

## 4ay. 用户取消小修限制、N35完整时间链定案（2026-10-04）

### 最高优先级与草稿处理

- 用户连续明确：275ms/近1s首显延后就是同步问题；要求检视为何未真正使用计时参照并解决；取消小修限制，系统审查source/ref/parser/match/event/page/clock/frame每层根因，再明确任务交执行对话。覆盖§4ax“仅6文件小修”。预览卡顿和随时恢复N34要求保留。
- 原小修卡/审阅/当时state草稿保存 .verification/n35-planner/superseded-small-scope；从未产品施工/建包，未交付执行。现在同路径N35-EXECUTION-TASK/N35-SYNC-AND-PREVIEW-REVIEW是新版完整链，不另开N35r。N34稳定源/三包、backup/pre-n35-n34-bfe5a0a、baseline JSON/恢复脚本保留。

### 参照链已证根因与必要口径纠正

- runtimef40f17840B参照只记录matched1131/eligibleNative0/adopted0；原body缺，当前adb无设备，不能知道其rawoffset是否无/分段多词/被误降級/只NATIVE未匹配。先前“native0故数据本身无逐词时间”口径过强，新稿已纠正，不猜gemini后自签旧case。
- 原NativeAsrTrackReference同language只存一个URL、Raw.reference首个可parse成功就return，质量与HTTP下载混同。before两samevideo/lang不同variant只保留后coarse、rich丢失已复现。
- 原Parser单span需nativeOffset且tokens.size1才NATIVE；3显式offset/6多词在100/900/1700的真实segment边界全部变EST，匹配6仍eligible0，当前无法采用时间边界已复现。正确方案保留word/segment/cue观测等级，不把内部估計升级词NATIVE。
- 新reference选择 bounded多desc、capability与matched evidence优先、总1500ms/max3 attempts cache先看质量、unsigned fmt/xosf/variant固定有限profile（sparams+lsparams保护，未被签才允许），native主人工内容不换ASR，访问失败正常降级不declare_ready。没有words时clean cue/segment anchors可真正约束内部estimated，本卡要求B实际用，不只多日志。
- 两级采用：沿用N34directNative安全局部段；unique边界锚monotone映射primary token index，相邻可信锚间按source旧时间shape分段仿射，Native不可变constraint，原650/speaker保护，组件/邻域整体验证不剪词/跨空窗/全片shift。内部仍EST，origin/time_basis和实际改时/与ref本来一致分开计。
- 新debug timing evidence multipart bounded每payload256KiB/每session3body，原SHA/parts完整/缺块标截断、不存URL/cookies/key；full save导出可重放真实实际ref，不每frame写。原f40body若未取不能冒用另106667B/公开空response。

### 源误差、event/page与clock/frame系统修复

- manual与supplied auto经同uniquegram得到1131match/1122native，词起点manual-ref median230/p90 1007、正负-1709..1704；83个event起点median49/p90 588/-1709..1257。某10348 vs9760迟588、15617 vs14360迟1257；也有manual早408。资料不同且非声学真值，不和UI275median相加，不固定提前。
- 采用ref后ready event/pending/gap必须同最终source轴，raw cue仅source未ready时用；timed windows从word.cue组派生不误用raw index、主线程有界查找，避免双轴闪现。Event仍source首末归属；完整两行整event优先，特别中文不为一行偏好人为分页。>2行正常N34semantic/Unicode/1200ms容量，多page时无可信source-targetspan只标estimated_page_timing，不能字数/标点zip假声学对应。不修改翻译prompt/schema/quote/数/语义安全。
- CLOCK现已before证800–1500ms平台；raw不同采样时刻相比致2x误拒；seek21000后旧22000@11000样本返回22200。MEDIA fallback需同time-origin投影到hookAt比容差，fresh playing无800截断，seek epoch清preseek样本。
- 额外原MPP＋**actualN34APK**独立DEX读取确认public VideoInformation.getVideoTime/getVideoId/getPlaybackSpeed和VideoState.getCurrent已存在，getTime通过PlaybackController.patch_getVideoTime包装原Lakez/Laove方法，另有MDX fallback。可复用而不加hook：owner/id稳定、epoch/state验证后currentplayer直接位点优先，MediaSession估算次之，hook/frozen保底。公式不能仅靠dummy callback忽略media。
- Native与rawHook独立观测/路由，避免每80ms强读数后稍旧hook制造backseek；真跳按同旧seek处理块和去重，不只换s.position忘generation/取消。explicit paused/small rewind仍优先。
- main测量阻塞时s.position不更新，重读volatile不等最新frame。测量后main有界重读原player当前位点，失效用合法数字snapshot当前elapsedProjection，不新读MediaControllerIPC/网络/View扫描。frame仅时间/guard验证，不递归time/kick/seek。

### 公共核查和before边界

- 只读公开watch200取得a.en、variant=gemini；三profile＋同匿名cookie会话caption均200/空（expiry未过）。不是手机descriptor/f40body，不证明variant缺时间。未保存signedURL/cookie值，没用用户账号。yt-dlp原extractor对xosf的处理只格式方案参考，不是本例定因。
- 完整time7/7原productionbefore已完成（外部probe）：desc覆盖、partial锚丢失、clock800cap/时间原点误比/preseek复用、no-focus row窗口模式、preview反复layout。N34source main/test/resource输入SHA904c8368…不变，未复跑全704或产品after。
- official-145-clock-api.txt/public-player-api/method-bodies及n34-actual-player-time-bindings.txt、full-timing-root-cause-register、manual-vs-supplied-asr差、public参考访问边界均在 .verification/n35-planner。根因研究与具体算法由本规划者完成，执行者只照卡实现与验，不猜源参数/偷改全局偏移。

### 执行/回退安排

- N35完整卡授权Reference registry/format/capability/Evidence Reader/partial source mapping、必要sourceCache质量meta、Controller.load/time/guard/时钟与frame/page basis、boundeddiagnostic timing capture及preview/viewport。旧6文件限制失效，但原语义/quote/numeric、N34 strictowned/capacity、R1-CAS/locks/durable/请求限额、N33设置/两root/用户key/custom/字体和N27撤回保护不变。
- 建议Codex承担这张完整链，因为已不是小修；用户如仍DeepSeek先试按同合同单执行，不跳能力/真实采用/时基测试。核心不合格WIP保存及trialtag再停，同卡可交Codex接手或用户用已准备工具恢复全部tracked非docs N34源，新revert保留历史。
- actualcapability/锚/source/event/page/clock/frame逐层证据＋十四target代表/原704基线/400并发/SDK35实际getter与settingfling/三组合/finalDEX/原N34包hash保护，一次闭合-n35交付，真实phone音频和旧f40body缺失边界不能测试绿替代。

当前产品仍N34，没有实现N35/新包/手机写入或远程翻译API。本轮网络仅用户要求的公开视频caption/primary文本只读核验；新依赖/工具/音视频未下载，Git未push/release。


## 4az. N35 完整时间链执行、验证与本地交付（2026-10-04）

- N35 已完成源码实现与验证：参照 descriptor 多候选/能力选择/1500ms-3-attempt budget；WORD/SEGMENT/CUE evidence；partial boundary-constrained local retiming；source/event/page basis；official player read-only adapter + same-origin media fallback + hook/frozen clock；root-lifetime IME lease；preview label/layout cache。保持 quote/from/to/数字/semantic safety、R1-CAS/locks/durable/cache/请求预算、650ms/speaker hard break、N33 settings/two-root 与 N34 owned-window 保护。
- 本地实现提交：1967dac（feat(n35): repair caption timing chain and preview frame stability）。后续仅补本状态/身份记录，不 amend/push。
- 全量 JDK21 isolated verification：708 tests，failures=0，errors=0，skipped=0；N35 timing/source replay 18/18；display/preview/viewport focused 69/69；integration/contract/connection 136/136。默认 JDK25 的 ASM major 69 问题单独留在 .verification/n35/failed-default-jdk25，不作为产品失败。
- 独立离线 source build、patch-list、Patcher composition 通过；组合 92 PASS lines/COMPOSITION_PASS，final APK 11 root DEX/58,281 classes；MPP/MPE/APK n35 bytes/SHA 见 docs/N35-LOCAL-TEST-BUILD.md 与 .verification/n35/final-checks.json。N34 三包、official input、baseline SHA/bytes 未变。
- reference 口径保持诚实：机制 fixture 已证明 partial offsets 会被保留并实际局部采用；旧 runtime f40f646a... 的 17,840B body 仍未取得，未连接真实手机，不能宣称实际音频波形或用户短验同步。新诊断会记录 downloaded/parsed/matched/capable/chosen/applied 和 bounded body capture。
- preview root lease 与缓存改动已通过 69 项 focused regression；未进行物理手机写入/安装/启动/push/清数据/发布。交付产物为独立 -n35 路径，N34 可按 N35-RESTORE-N34.ps1 回退。用户自行完成 after 短验后停止，不自派 N35r/N36。


## 4ba. N35真实反馈审阅及N36规划（2026-10-04，最新管理状态）

### 当前身份和授权

- N35产品提交 1967dacff904173ef685602e831cc21291fffb94；完成HEAD与anchor/n35-013cc93=013cc93b266b339ad05dea11b1bd29177cbcbffe；本轮只有docs规划与忽略目录before探针，无N36产品改动/包。
- backup/pre-n36-n35-013cc93=013cc93b266b339ad05dea11b1bd29177cbcbffe。N35三包、N34三包和官方1.45输入实际SHA/bytes核对不变。N36-N35-BASELINE.json记录242个保护路径及诊断/录像输入身份。
- 已准备N36-RESTORE-N35.ps1、N36-ROLLBACK-READY.md，-InspectOnly成功，product差异0；**没有实际回退**。N35已知UI缺陷保留，若用户选择稳定设置可明确退N34，旧N35-RESTORE-N34.ps1也保留。不得自行reset/amend、删失败包或写手机。
- 用户补充第五项详情↔小窗抖动，并要求五项均解释原设计目的/必要性/替代方案。已纳入同一N36卡，不拆出漫长额外阶段。DeepSeek或Codex单执行者允许，推荐Codex；不自动开发、不自派新卡。

### 本轮证据

- input215344：2209813B，manifest n35/1.45、extended history7640；录像14.270625s/1264×2736。实际逐帧查看，只含preview滚动，不含IME和小窗。ADB无设备，没有物理写入/远程API/工具下载。
- .verification/n36-planner/probe-run-01当前坏机制4/4复现；probe-run-02另1/1证明同owner真实MAXIMIZED回调因caption clear改变render epoch被误丢弃。这是before，不是after/708全量。
- 635 display记录65 suppressed、18 owner_invalid、73 pending、156 outside-window、85 source_gap，不能把正常compact/合法源gap都算漏字幕；旧log缺player type/owner，不能定位用户那次长期无字幕的唯一手机状态。代码可稳定复现的authority误关联、owner残留、probe占槽应修。
- 106 attempts，89 2xx/17 error。translation slot median24/p90 53/max132ms；source queue median14/p90 38/max105ms。network median4491/p90 7335/max16000ms，含6个active拒绝记录的deadline附近错误和紧邻退役的错误；NetworkDeadline timer只disconnect未记触发cause，故timeout=0不能证明未到期；不一律算供应商或取消。保留并发/attempt/deadline，精确区分取消结算，cached READY恢复不应重新发请求。
- preview相同key普通getView会refreshDynamicText→invalidateCache；viewport无IME也reveal、逐帧padding/双scroll；四字段失效没有手机InputConnection堆栈，不假装唯一OEM原因已复现。下卡必须记录实际window flags/旧model popup归属，核查ALT_FOCUSABLE_IM等阻断；真实SDK35 IME composition/commit、四字段持续输入是硬闸，不能setText/仅键盘可见代替。
- 转场多渲染触发＋每步geometry重排；displayResult/mark→DeepSeekConfig.load→SecureApiKey.load每次Keystore/Cipher解密，并在ApiProfiles.LOCK中。debug显示日志单次至少3次key解密；REBUILD_BLOCK_REUSED3377条。下一卡必须热路径0密码学/文件IO，保留正确脱敏和有界日志，不用关闭诊断省时间。
- deferred-render增量成本44样本median57.431/p90 71.281/max119.908ms，不等同系统fps；旧全局renderStarted导致77秒/6秒假layout记录，修正测量口径。
- 新raw timing已完整恢复SHA一致f40f...17840B（95events/94timed、0offset）及87c68...33047B。f40 partial anchors188/178/108、54components、actual_retimed752，内部仍ESTIMATED属正确，不再声称本轮参照没实际采用。保留N35时间和N34漏字幕成果。

### 验证流程与执行顺序

- N35的24个result测试调用累计1985.405s≈33m，四小时主要是实现/回归；成功full02与full03的212文件/input_sha完全相同，后者5m15s属确认可省重复；失败后复跑不能全算浪费。MPP21:10是候选，不能等同正式完成。
- N36顺序：A输入/preview → B authority/recovery → C转场/日志 → D取消/压力复验 → E一次全量和最终三包。先真实交互小专项再冻结，708基线和安全组合/DEX不省；同输入复用，docs-only不重跑/重建，不扫281140历史文件，不重复额外400轮。
- official1.45、YouTube21.16.256/minSdk28、1.3.5/14locale/两roots、source/clock/page/reference、prompt/schema/cache identity、CAS/锁/5s barrier、安全空白/数字引用、key/profile/默认自定义、本地化与Shorts全保护。N27不恢复。frozen4/4/4与ACCEPTANCE/history不动。
- 下卡：docs/N36-EXECUTION-TASK.md；细审：docs/N36-N35-REVIEW-AND-REPLAN.md；回退：docs/N36-ROLLBACK-READY.md、N36-N35-BASELINE.json、N36-RESTORE-N35.ps1。用户after约3-5min：四字段输入/IME/滚动、已有字幕详情↔小窗3次/开关、换视频/语言返回及完整diag。

### 停止点

规划完成并本地持久化，不实施N36，不签名/安装/推送/发布。等用户交执行聊天或提供新指示。


## 4bb. N36用户after审查及N37规划（2026-10-05，最新管理状态）

### 身份与真实权限

- 产品6319fd69900b1f08b231b14161713021d0fb616d、完成3bf88d2c0047bb1ecd88f4389ec42627bc219aa9；anchor/n36-6319fd6、anchor/n36-final及backup/pre-n37-n36-3bf88d2核实。N36/N35/N34三包及official1.45原SHA/bytes均不变。N37尚未实施/建包。
- 实体手机ASQHUT6422001234连接，只有读取logcat/dumpsys/gfx与拉安装APK；未安装/启动/input/push/app_process/清数据/改设置。自有390类method canonical比较全部一致，整APK签名/宿主不同不要求字节等。安装更新时间2026-10-05 08:28:43，21.16.256/minSdk28/targetSdk36。
- .verification/n37-planner保存本轮证据。手机capture前台是通知栏/文件管理器，AI设置窗累计242帧/13jank/p99 73ms，不当作精确边界现场trace，不把10月3日旧crash归N36。
- 既有SDK35 emulator5554用原N36 DEX/资源/官方设置的测试host观察；测试独立签名，正式包未签。自然焦点，未强制preview focus；原模拟器override1500×2400/density480与手机1264×2736/560对照后已恢复原值。无API/新工具下载。

### 四项根因与限制

1. 小窗残留：正式Hook→Controller.player不走Overlay.setPlayerType隐藏支路；Guard COMPACT只停未来扫描/render，没有hide已绘制anchor。真实showEvent＋正式通知before，Authority COMPACT而anchor VISIBLE。修许可否定的廉价同步hide/revoke，不清计划/cache，不回退N36快转场。
2. 用户纠正位置为“字幕样式与预览上缘之间”。上游两条已复现：a) DeepSeekDiagnosticsPreference即使收起仍uiText body supplier，普通getView→CaptionDiagnostics.uiText→drainNow→summary/readSummary/Future.get，归档受控暂停时主线程绑定被卡住；b) TextResolver同Locale无条件setTextLocale仍parent requestLayout（SDK28/35），暖preview外层同输入getView仍layoutRequested。N36appendSummary实际append多文件，reader扫全历史。后卡用已脱敏内存snapshot、后台显式刷新/export与有界最新slot；同文案/Locale变化才setter。物理某一次edge全部原因未现场trace，不谎称OEM唯一分支，交付前真实重日志自然边界after。
3. 压力：报告有N35旧数据。已确认N36段3645history，42request/39response/2cancel/1未terminal，slot median16/p90 54/max67ms，source queue13样本median13/max15ms，network median4070/p90 4916/max6518ms。累计21errors不能算本段新网络失败。1310REUSED/merged0尚未真正降噪。RebuildApi network_cancelled/network_deadline_expired被Audit network优先吃掉，新增类别应显式映射，旧累计不猜重分配、尝试/tokens保留。
4. 暂停：同session12/generation0无seek可见时间28290→27922/32235→31861/43120→43060，换回旧句。position(s)选native后又freeze rawmedia；time(ms)freeze hook；displayPosition先读这个旧优先通道。受控Controller native paused28290/media27922原路径确复现。修同源position+state的暂停Observation/freeze，保留jitter与真实paused小backward seek，不能Math.max/钉最后页/固定提前量。

### Before与未收敛验证

- mechanism-before-01 3/3（含mixed type分类观察，不一概算3bug）；settings-binding-before-01 2/2 SDK28/35；preview-bind-before-01 1/1；diagnostic-ui-before-02 1/1完整blocked-main栈；request-count-before-01 1/1合法两focus＋两prefetch四block各一次。均before，不是N37 after。编译失败diagnostic-ui-before-01原样保留，不计为测试通过。
- N36真实full-delivered-01=716/1failure/0error/0skip；原n24total=2 vs4缺逐request身份。新probe证明4可能是合法prefetch，但不冒称原full唯一原因。N37按原失败场景记identity，合法预取则分focus/预算计数，真重复/泄漏则修实际生命周期；禁止2机械改4、独立JVM/skip遮盖。最终完整全量必须0fail/error/skip。
- N36真实IME commit未取证是:ime与instrumentation两份static导致测试没发送命令；后卡在test服务本进程经真实连接执行命令/ack并验证字段/保存值，不以“平台不能验证”为永久限制。正式产品无测试类。

### 后卡与保护

- N37一张卡内：A廉价同步hide → B暂停同源 → C诊断snapshot/幂等绑定 → D压力分类/原测试身份 → 一次最终验证/三包。Codex推荐，DeepSeek允许，单执行者完成停。
- 文件：N37-EXECUTION-TASK.md、N37-N36-REVIEW-AND-REPLAN.md、N37-N36-BASELINE.json、N37-ROLLBACK-READY.md、N37-RESTORE-N36.ps1。恢复脚本只InspectOnly；没有实际回退。N36有已知缺陷，回它只代表本轮起点；旧N35/N34恢复保留。
- 保留N35ref/retime/source/event/page/cache/prompt/schema、N34安全、N33十四语/default-custom/导航/两roots/menu、N36快转场/指纹脱敏、profiles/Keystore、CAS/锁/5s barrier、2+2/总4/请求预算、字幕字高/位置/16:9/Shorts、official1.45/21.16.256/minSdk28/1.3.5、ACCEPTANCE/frozen4/4/4。N27不恢复。
- UI热路径report barrier/IO/drain/redaction/key0；暖同值setter/layout0；导出仍后台完整性barrier。必要loading文案14语言；不改窗口Context/官方类，不扩大并发/deadline，不视频特化。
- 一次稳定identity全量＋真实UI/IME专项在打包前；doc-only不重跑/建包，formal MPP自身组合与DEX/分支/接口审计真实闸，不能继承exists-only/assert-or-True判据。原历史保护范围Git＋指定包，不扫几十万文件。

### 状态同步修正与停止

- 本轮发现外部PROJECT-STATE仍逐字等于前规划提交7a53e46，没有N36管理头；仓库有完整N36头。已保存两份before在n37-planner，确认外部没有独立新内容，按仓库完整保留管理记录后新增本段，再同步两侧，不丢管理更新。
- 规划完成，产品未改、正式N37未建；未签名/安装实体手机/推送/发布。等待用户交执行聊天或新指示。

## 4bc. N37本地交付与停止（2026-10-05，最新执行状态）

- 源码 `98ac1a16440f64d8b1e095d0f4496cae7cdcece9` / `anchor/n37-98ac1a1`；完成锚点 `anchor/n37-final` 由Git解析；基线N36产品6319fd6/完成3bf88d2原样保留。N37三包路径、完整SHA/bytes、time lane、source/verification身份见docs/N37-SHA256.json，before/after/合同修订及边界见docs/N37-LOCAL-TEST-BUILD.md。
- A：正式outer→原inner→Controller→Guard主线程许可否定同次撤绘，owner epoch拒旧、queued render作废、touch/focus/a11y清理；不清计划/cache。B：native/media/hook选源Observation一致，暂停freeze/current selection共享，真实rewind可用且seek一次。
- C：UIpeek已脱敏snapshot，后台writer/report/archive，weak窗口／request／locale／profile／clear epoch门；atomic latest summary和旧后台尾读迁移；幂等文字/locale/preview绑定。D：显式失败category增量，REUSED per-job边沿与重复累计，原n24身份focus2+prefetch2/四block各一次，不机械总2改4。
- 最终全量full-04：727tests、0failure、0error、0skip；原716identity全保留＋11。之前full-01=3fail/full-02=1fail及原断言/身份/试验包保留。稳定代码一次最后全量，此后docs-only不复跑。
- Python27/27；发行11/11；241keys×14=3374。冻结4通过/4失败/4未验证，三类invisible_ms0，ACCEPTANCE/版本/原输入/Publication/CAS/预算/deadline/source-cache语义未变。
- 真SDK35 test-only host使用实际最终APK生产DEX/原资源/官方设置，52跨进程IME回执，4字段输入/delete/paste/真实保存、prompt中日composing、回收重开和dummy profile往返通过。12中日阿×1.0/1.3×手机／320dp自然标题-间隙-preview边界场景与14999msarchive backlog通过；无canvas.requestFocus，不作OEM唯一栈/零jank承诺。UI矩阵复用身份仅两个player Hook接缝变化，其他UI输入一致。
- actual AI-only／Remember-only结构组合与both编译通过；三包DEX分支invalid0/problems0/binding0；APK11DEX，MPP内MPE一致、CRC/DEX头/resources/aapt链、官方选定39方法一致、正式APKunsigned。审计require-ai=false是N27observer已撤回，不改审计或恢复N27；最初错误口径失败保留。
- 实体手机未写、未签名安装、未触网、新依赖或工具下载0、未push/publish/reset/amend/清数据。模拟器原override1500×2400/density480／原IME恢复核对。
- 用户最后短验：有字详情MIN/MAX3次；最新标题/间隙边界慢快拖及prompt后隐藏IME；两句边界pause/resume与一次真实paused rewind；换video/target/cache，导出完整diagnostic。手机after待用户，本卡完成即停止，不自派N37r/N38。


## 4bd. N37R2：所有可显示 AI 字幕场景的物理水平居中（2026-10-05）

- 基线 `anchor/n37-final` / `3c36bf4`，产品 `98ac1a1`；本卡核心 `6ff1053c74c2deaa10bf733f5328d3b6756abd49`，核心锚点 `anchor/n37r2-6ff1053`，完成锚点 `anchor/n37r2-final`。
- 复现：物理 leftMargin 配 `Gravity.START` 在 RTL 宿主被右侧解析；14组合 before 中阿语UI11项偏移，Shorts＋英语字幕偏差685px。
- 改动：统一物理 LEFT/LTR 外层＋视频可见rect中心公式；内部目标语言/Bidi规则不改；消除旧 horizontal translation/relative margin；真实布局后诊断有 owner/render/session 有效性保护。
- 验证：Java750/750，新增23并保留727旧身份；焦点31/31，Python27/27，发行合同11/11；API35真实交付DEX 86观测覆盖要求14×4矩阵、Shorts下一条、全屏进出；91生产定位记录逐观测核对，最大误差0.5px。
- 交付：n37r2 MPP/MPE/unsigned APK，SHA-256见`docs/N37R2-SHA256.json`；两单根结构及联合组合、11/2/1 DEX分支、77新增指令引用maxAPI24、3374资源、MPE内嵌一致、39宿主方法不变均通过。
- N35计时、N36authority、N37输入/诊断优化保持原源码与旧测试合同；原冻结语义4通过/4失败/4未验证不改。
- 停止：实体手机未写/未验；未改README、发布1.4.0或补丁源元数据，也未push。真实实体机确认各应用语言与播放器场景都居中前不进入发布。本卡完成即停，不派后继。
