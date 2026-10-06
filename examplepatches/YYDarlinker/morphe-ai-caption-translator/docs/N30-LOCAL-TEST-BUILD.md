# N30 性能回退修复、AI 多语种菜单与本地化闭环 — 本地测试交付

任务日期：2026-10-02；恢复与交付日期：2026-10-03（Asia/Shanghai）。Codex 单执行者，继续同一 N30，无 N30r。**工程交付通过，未签名、未安装；手机观感与母语语义验收仍待用户短复验。**

## 1. 真实基线、范围恢复与输入

- 开工及恢复 HEAD：`b6dd6c68a6415e5e920586b3e004a3d006281240`；产品基线 `3eefe00ee1491ea4c6bb4e076dbc511fc120fe65` / `anchor/n29-3eefe00`。两者仅 docs 差异，原管理更新、任务卡和全部未提交草稿保留。实际仓库 `E:\Projects\morphe-caption-v2`，未在 C 盘旧 worktree 施工。
- 两份 PROJECT-STATE 开工 SHA 一致 `7D70CB6B454B002FB17D88A777CE158051C3EAEEC8BFBB500EFC85A446640088`，无盲目覆盖。范围阻断、恢复定案均保留在 `docs/N30-SCOPE-BLOCKER.md` 与状态档案。
- 官方输入仅 `patches-1.45.0.mpp`，SHA256 `DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93`；原版 YouTube 21.16.256 / minSdk28，不使用用户已打补丁 APK 作为宿主。产品版本仍 1.3.5，官方 1.45.0 未改成产品版本号。
- 222525/224950 原诊断及两张截图只读；manual/auto 各 VTT/JSON3 四文件直接 LiteralPath 读取并复核，完整身份 `.verification/n30/source-inputs.json`。
- 既有 JDK21、SDK36、Patcher1.14.1 与缓存依赖离线使用。远程翻译 API、下载、新依赖、签名、安装、清用户数据、卸载、推送、发布全部 0；本地 MockWebServer 受控请求不是远程翻译 API。
- 已验证源码核心提交：`d5ca720ecf0c83349ea232d929ee09b11840c65a`；锚点：`anchor/n30-d5ca720`。本报告身份补记为 docs-only 后继，不改变已验证的产品源码/三件套。

## 2. 四项用户问题的根因与修复

| 问题 | 根因 | N30 落点 |
|---|---|---|
| 播放器菜单“路” | Java 拼接标题、硬编码分隔字、状态词 | 完整资源 `cap_ai_quick_toggle_on/off`，14 语言；无 Java 状态词拼接，缺资源 fallback 英文完整标签，不裸露 key |
| AI 入口“修改后自动保存” | 页面 summary 误绑 `cap_autosave` | 独立 `cap_ai_summary` 功能说明；仍在旁白翻译后，无图标；只有实际输入项保留自动保存说明 |
| 等待／连接失败与 1:57 整块空白 | 首焦点未接纳便远程 bootstrap；650–899ms 硬断点可被 Planner 跨过，重复请求同一非法 Block | 首焦点接纳前邻块 cache-only；连接原因/阶段/deadline 分开；Planner 按所有 650ms 硬源断点与 speaker marker 在请求前拆块，不放宽 Protocol |
| 播放器切换卡顿风险 | 内层 overlay 同步 render/几何查找；外层 V2 仍直接 force scan；普通类型帧探测及反复树摘要 | 真实内层/外层只轻量通知；单个合并帧请求读取最新文本/guard；几何缓存合法复用/失效；仅 compact 延迟观察，原生已知窗维护与低频退避 |

## 3. 启动与连接：稳定性优先，不包装零等待

首焦点未 sent 或未结构接纳时，不派生远程邻块翻译。SOURCE_IO 锁外 cache 读取，Session/generation/source/key/job 校验与命中提前展示保留。焦点接纳后恢复 focus2/prefetch2/总4、30 秒 lookahead、seek storm 暂停5秒及原 attempt/repair 上限；没有新线程、无界队列、合并请求、无限重试或字幕持有延长。

新增 `bootstrap_remote_suppressed`、`bootstrap_cache_hit/miss`、`focus_accepted_at`、`first_prefetch_sent_at`。Socket/connect/read interruption 分别英文 reason，包含 request/block/session、phase、elapsed、remaining deadline、attempt；2xx 结构拒绝不伪装连接错误。Socket 失败成本汇总现在计入 network；导出 manifest 和 draw-hook 标记为 build=n30，presentation 仍 n29-presentation-v3，缓存／prompt 合同不改。

同一受控 startup 回放：

| 指标 | N29 | N30 |
|---|---:|---:|
| 首焦点发送 / 接纳壁钟 | 815 / 3350ms | 815 / 3350ms |
| 邻块发送 | 815ms（首焦点未接纳） | 3448ms（首焦点接纳后） |
| 邻块就绪 | 6436ms | 9069ms |
| 7040ms 边界真实等待 | 0ms | 2029ms |
| 两块逻辑请求 | 2 | 2 |
| 首焦点接纳前邻块远程请求 | 1 | 0 |

这明确放弃理想回放的零边界等待，以收敛投机请求风险，不声称更快或更便宜。cache 命中邻块 API=0；慢响应仍真实 pending。真实本地 Socket 断连 2 次按既有两次 attempt 收敛 FAILED，无 pending plan／旧显示权／额外语义 repair。

N29 真机有界去重事件为40 begin/37 response/3 SocketException，最高成功 RTT 10163ms；since-reset 成本表是41 attempts/38 successes，reported tokens 67745=58766+8979，两个统计域不混用。**没有 N30 真机 after RTT／连接失败率／token 数据**；fixture 不报告真实 provider usage，不能把0 token当作成本降低。详情 `delivery-records/before-after-comparison.json`。

## 4. 通用硬断点分块，不做视频特判

650ms 硬断点及显式 speaker marker 与普通标点/句界分开；每个 Block owned token 完整、顺序不变、独立请求/缓存/失败收敛，空白不借时。实际 b7 / 381 只存在 test fixture 和历史证据，不进入生产条件、prompt、资源或缓存配置。

- 修前三次跨断点响应及112140–127282ms fallback证据保留，原跨断点响应仍被 `crosses_source_break` 拒绝。
- 修后真实 device owned token 在380/381两侧独立规划；manual/auto × VTT/JSON3 四个生产解析回放中，1:52–2:07各合法片段按各自 owned 时间进入合法 Block，非法跨断点 Block=0。
- 4语言 × 3 timing precision、不同长度/断点位置的12个通用合成变体，以及标点非硬断点负例通过。真实源回放的译文为本地确定性 fixture，不冒作远程模型语义改善。
- 原 N28B 硬断点负例仍使用同一 source 强制构造非法 owner，精确断言 `crosses_source_break`；只将旧“Planner必须生成一个非法块再失败”前提改成请求前拆块。中文 golden、生命周期权限断言、ACCEPTANCE/frozen未改。
- 生产源码/生成 DEX 特异性审计通过；没有该视频ID、block、样本文本/381/112140/127282生产特判。

## 5. 完整回调、合并、失效与性能边界

scope-probe before 原样保留：inner callback 同步 geometry refresh=1，30604700ns仅本机观察。恢复授权后覆盖实际注入 `DeepSeekCaptionHookV2.onPlayerType` 及 inner 完整调用链，不 mock render，使用实际 overlay、平台字体和真实 View 树：

- 两条 callback 返回前 geometry/native scan=0；下一条实际 UI 消息可先运行；返回后合法布局确实 render，不把“没有执行”当优化。
- fullscreen/rotation/detail-return 各10轮，compact展开/收起10轮；100次快速类型通知只产生一个合并 renderer request。同一转场中的新字幕/新 guard 必须在同一帧请求读取最新值，不被旧 render revision 阻止。
- stop/clear/换视频或目标/Activity销毁/再次compact：旧帧任务无 attach/render/clear 副作用，新显示状态不被覆盖；后台到UI通知也带 epoch 失效。没有合法几何安全空白，后续真实 layout 恢复一次。
- 普通变化立即释放guard，不启动完整稳定帧轮询；compact仅有界Choreographer观察，12帧上限，缺/不稳定几何不强制恢复。记录实际frame timestamp，不写死手机FPS。
- 已知原生字幕窗每40ms维护，树扫描低频备用/强制重建，失败指数退避至5秒；无默认16KB tree dump，详细树只显式采样。draw防线仍必须存在，缺失审计失败。
- 几何缓存仅复用当前attached/shown且边界合法的已有View/Surface，Activity、player模式与layout失效，保留原player选择、相对坐标、字号/颜色/透明度/拖动位置和N27搁置。

20 个 inner/V2 timing行、30普通路径行与扫描/帧指标可追溯。Robolectric耗时不当作手机帧预算或“解决了真机卡顿”证明；手机观感待有限短复验。

## 6. AI设置内14语种多选与最终本地化

- 原生 Preference/Dialog，“启用AI”order0、语言入口order1，在API配置前，AI关闭仍可编辑；默认空集合，独立存规范化code，排序/去重/区域脚本别名归一，错误code/错误存储类型被拒绝，不迁移Remember/API profile/原zh-Hans来源。
- AI根已包含通用 metadata/URL/label clone 接缝；Simplified根保留兼容独立选择入口，Remember独立。三个根七种非空组合均从同一最终MPP重新加载真实Patcher并序列化/重读DEX；native-only AI许可false、API0由生产测试确认。
- 原生条目对象与顺序保留，不按code字典序或固定中文排位；按当前实际原生标签接缝和Collator插入，canonical code已存在则不重复。4 locale × AI off/on/off的12菜单行保存code/display name/位置/原生对象保留证据。离线host模型不是14语言真机菜单截图。
- 全部原220键保留，加12键=**232×14**。运行时逐键对照每个locale作者值，不接受裸key或静默English/Chinese fallback；320dp、1.3字体、RTL、长语言名/原生多选行与原生PreferenceScreen入口均无省略号/漏字。中文/英文/法文及RTL截图在最终full目录。
- default prompt、字号档/说明、preview sample、全屏preview hint、对话/按钮/Toast、诊断保存/模型/审计壳沿既有运行时测试覆盖；用户prompt/profile名称/provider/源文/译文保留原数据。技术导出标题、事件、字段、reason英文，用户壳按应用语言；不把静态232×14或工程资源解析冒作全部手机/母语语义验收。
- 最终APK三套已编译Morphe XML summary确绑cap_ai_summary，语言项order1，无图标；新12键×14值确在resources.arsc。缺资源/重复资源/重复语言/错误code变异由同一validator或捕获的真实生产输出QA拒绝。

## 7. 真实PASS分母与冻结边界

| 验证 | 最终结果 |
|---|---|
| Java全量 | **669/669**，failure/error/skipped=0 |
| 原专项 / R1 pager / K12 | **68/68**，failure/error/skipped=0；全量main11/11 |
| 受控并发 | 全量200 + 专项200 = **400轮** |
| N30专项 | connection3、menu5、localization5、source4、transition9；原bootstrap8及renderer3在全量通过 |
| Python | **27/27** |
| 中文golden | **18组逐字段相等**，prompt/cache/time/text/pages/font不改 |
| 几何/非中文 | 原40几何、28冷热、两SDK语义和非中文1200ms/两行/字素合同继续通过 |
| 冻结计分 | **4通过 / 4既有失败 / 4未验证**；三个invisible_ms=0，不代表语义全绿 |
| 七组合 | **7/7**真实Patcher/最终序列化DEX审计；native-only API0 |
| 最终DEX | **11 DEX / 58236类 / 322868方法 / 626591分支**；invalid/problem/binding=0 |
| hook/resource/CRC/aapt/verify_bundle/N8Verify | 通过；内嵌MPE=独立MPE逐字节一致 |
| 负例 | 未知/多匹配/人工缺draw/用户残缺APK具名拒绝；4资源/语言/code变异拒绝 |

全量与专项同一输入SHA `8ce60f53289c22e06d75f1eee0d4439ac5598b200dc727e3be9c0c724969b8fb`；debug/release170产品class逐字节相等。R1 publication/permit/CAS、锁顺序、同key cache提交、main退休非阻塞与后台barrier的冻结方法逐字相等；ACCEPTANCE/frozen零diff。12646份既有历史输入/产物SHA与字节复核不变。

所有中间失败/候选保留：原范围阻断、首次四项专项、旧bootstrap/硬断点/根组合合同、原生Preference测试宿主/RTL条件、Windows中文脚本编码；前两套N30候选留 `provisional-*` 非交付。没有删失败、放宽生命周期/golden/时限，修正后同源码重跑。

## 8. 独立交付与身份

| 文件 | 字节 | SHA256 |
|---|---:|---|
| patches-1.3.5-本地测试包-n30.mpp | 1,149,147 | `7FEB7313460239B9F8C7315F11C4B8D599FCFED3640A24EADCA8B38317056880` |
| extension-1.3.5-本地测试包-n30.mpe | 2,786,164 | `6AB8823E239634E414117CA6A1C997775DFAD1CF8F2AE5D105DE43A3508DE9BC` |
| YouTube-21.16.256-本地测试包-n30-unsigned.apk | 198,113,758 | `AD0DBDA174002BA1FF6D363814A9D5A62AA3FEA15A71EECC5FE06A2C1CB2BF0E` |

三件套位于 `build/local-test` 与 `build/n30-composition-final`；APK未签名，没有安装或自动发布。完整命令/输入/结果在 `.verification/n30`，复现入口 `tools/n30`。

## 9. 完成即停：只做一次短复验

1. 中文播放器菜单开/关标签；AI功能summary与多选入口（AI关时也能保存，默认空）。
2. 一次稳定播放，并看实际视频1:52–2:07源断点两侧；一次详情页↔悬浮窗/全屏切换。
3. 日语和另一非中文切口，提供完整诊断。无需14语种母语全表，不要求清数据，不主动发布。

工程通过不等于翻译语义全通过，未取得N30真机after数据，不宣称RTT/总token/帧率或母语质量已改善。N30结束，不开始下一张卡。

原始VTT/JSON3测试副本逐字节保留（含原生空行/空格），由特定 `.gitattributes` 标明不做文本换行转换或空白清理；不为Git空白检查改写用户证据。已知本地Python编译缓存不提交。
