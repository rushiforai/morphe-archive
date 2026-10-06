"""Write the factual N29 delivery report only after final engineering closure."""
from pathlib import Path
import json,re,hashlib
R=Path(__file__).resolve().parents[2];V=R/'.verification/n29';O=V/'delivery-records'
summary=json.loads((O/'engineering-final.json').read_text(encoding='utf-8'));assert summary['status']=='ENGINEERING_PASS_UNSIGNED_DEVICE_NOT_VERIFIED'
art=summary['artifacts'];table='\n'.join(f"| `{x['path']}` | {x['bytes']:,} | `{x['sha256']}` |" for x in art)
raw=json.loads((V/'full-final-06/n29-device-exact-sdk28.json').read_text(encoding='utf-8'))['rows']
ja=next(r for r in raw if r['target']=='ja' and '145-169' in r['case'] and r['width']==1160)
def pages(rows):return '\n'.join(f"{p['start']}–{p['end']} ms ({p['end']-p['start']} ms): {p['text']}" for p in rows)
startup=json.loads((V/'full-final-06/n29-startup-fixed-after.json').read_text());old=json.loads((V/'startup-before-run/n29-startup-fixed-before.json').read_text())
body=f'''# N29 完整1.45接入、启动连续供给与非中文语义翻页 — 本地测试交付

日期：2026-10-02。唯一执行者 Codex。工程验收通过；未签名、未安装，手机复查与母语语义验收不是本报告中的 PASS。

## 1. 真实基线、输入与范围

- 开工 HEAD：`f7c0c462dcd31f57f1336678007793570cbd4818`。产品锚点 `9a7bdf35351b9a052233bac8b9004241548eb1eb` / `anchor/n28c-r1-9a7bdf3`；两者只有两份 docs 差异。
- 开工时两份 PROJECT-STATE SHA256 同为 `A210E6E37DC2B4F36796B6ED31DA279B100A6AD4BB44D742B5FE4761710FEBB9`，未盲目覆盖。已知规划文档保留随卡提交；旧 R2 不作为额外串行任务执行。
- 官方输入：`E:\\Projects\\morphe-caption-v2\\patches-1.45.0.mpp`，11,039,984 字节，SHA256 `DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93`。
- 原版输入为仓库已有 YouTube 21.16.256 / minSdk28 APK，184,012,881 字节；不是用户已打补丁 APK。所有原始输入身份见 `.verification/n29/input-manifest.json`。
- 用户残缺 APK 199,492,582 字节，SHA256 `8676787F0C5DB0636CA72C8DAC08071B6263BFEC7DBA4D592E408BBC0EF0B5C4`，仅只读回归。
- 真机诊断 SHA256 `BCD70B494B0C1EB21E2357727602078F40D1ACC72C6EBBEA2F1444874A4D36F5`；源 SRT SHA256 `B86A06B339D36D63FFF0B75598B5DF6C3C3EB80230863717E713CA542DAAE9C8`，两份原外部文件读后复核不变，见 `delivery-records/external-device-inputs-unchanged.json`。
- 既有 JDK21、Patcher1.14.1、SDK 与缓存依赖离线使用。远程翻译 API、下载、新依赖、签名、安装、清数据、卸载、推送、发布均 0。

## 2. A：真实失败重现、完整 finalizer 与不可变 AI 许可

真实 Patcher + R1交付MPP + 1.45 + 原版APK 重现 `AI quick toggle: menu path signal unavailable`。第一次异常完整日志为 `reproduce-before.log`；随后同一真实序列保存 `reproduce-partial-state/failure-structure.txt`，不把人工片段当成宿主序列：

```text
before: aiInstalled=1; initialize=1; onNativeTrackApplied=1; onMenu=1
before: observeMenuPath=0; suppressNativeDraw=0; consumePathCopy=0
exception: CaptionQuickTogglePatch.kt String guard
```

该状态与用户安装包吻合；**没有获得 Manager 的原始异常处理日志，因此不声称实测了 Manager 吞异常机制**。

- `prepareCaptionQuickToggle` 在修改前检查唯一 inflater/menu/top/Shorts/container、divider目标和运行时桥接签名。isFiltered 只接受两个已知完整结构（String 或 CharSequence），未知参数/多匹配具名拒绝。
- 实例 receiver 及 `J/D` 的寄存器宽度按参数推导，不写死 PC。1.45 真实路径是 `p4/p5`，观察桥为 `(CharSequence, byte[])`。1.44 真实 String 序列另由 Patcher序列化后审计通过。
- CharSequence 完整 `toString()`；null 无信号、不写成 `"null"`、不 cast 为 String。Shorts前缀、子菜单排除、当前video和1500ms语义保持。
- draw 与原内部长按路径也在前置阶段校验。所有必需宿主接缝唯一性计数成功后，最后才生成 `aiInstalled=true`；失败保留默认false。
- **真实生产** `rewriteUrl` 入口在许可false时直接返回原生URL；NativeCaptionBridge 的AI入口也尊重该许可。运行负例调用生产入口，零AI调用、不建AI Session、不清开关或API设置。不能把存在 helper 当宿主已调用。
- 最终APK：onMenu / observeMenuPath / suppressNativeDraw / initialize / onNativeTrackApplied / consumePathCopy / rewriteUrl 各1。内部长按delegate仍为private、invoke-direct/range与参数宽度正确；旧 manual-only 派发0。
- 用户残缺 APK 被同一 `auditComposition` 非0拒绝，明确 `observeMenuPath=0, suppressNativeDraw=0, consumePathCopy=0`，与签名/文件名无关。
- 新MPP的未知签名、同名多候选通过真实Patcher产生未完成快照并序列化DEX，安装许可均false；同一审计非0拒绝。人工从最终APK移除真实draw方法的独立变异也被拒绝。它是**审计负例**，不是把“签名后任意篡改的静态许可”误称为运行时自检。

### 遮罩与 Always show

真实draw使用既有 `suppressNativeDraw`，判断为用户AI开且当前仍持有AI轨，或原已认可的visible/source-only显示语义；等待、安全空白和旋转转场继续拦截，关闭AI/字幕、失去当前Session恢复原生绘制。

受控证明旧 visible-only 谓词在“持轨但未visible”时可漏绘制；重挂、alpha恢复、同Activity重新绑定均可使alpha防线暂时恢复，但有真实draw许可时不能绘制底框。关闭后立刻允许原生绘制。**未重构扫描器、未增加频率/线程/新监听架构**；测试fixture的draw行为与最终APK真实覆盖分别验证，不冒称手机实测。

实际1.45序列化 `disableAutoCaptions`、Off判定 `Laosh.h()`、已挂接的 `Laoqs.n()` 至 native capture前的字节码由受控执行器逐条执行，覆盖4种官方模式 × 0/149/150/151ms × 安装许可 × 用户AI开关 × Off/On = **128行**；另核验新video reset及150ms compareAndSet guard。BOTH_ENABLED 的手动Off对象未被清掉，原生dispatcher仍提交 DISABLE_CAPTIONS_OPTION；运行时Off/on与AI off行为由生产测试覆盖。最终APK同链再验通过。**未复现手动OFF撤销，因此不安装shim、不改官方偏好。** 这不是新的真机CC录像验收。

## 3. B：仅首块在途的紧邻块提前供给

focus2 / prefetch2 / 总4 / 30秒lookahead、seek storm 3秒两次→5秒暂停、播放fresh/未暂停、attempt/repair预算、退休请求规则不变。

首块真实sent后、source/blocks已确认时，即使尚无当前块接纳，也只允许 `index+1`。已有job/内存/磁盘优先；真正miss才走现有prefetch lane。新邻块cache reservation沿Session/source/generation/job与reading数组身份，只交给既有单线程SOURCE_IO；锁外读取、短区接纳。失效撤销flag但不能把旧结果写入新scope；不主线程等待新增磁盘工作。

相邻cache命中不把“首块未接纳”变成无限远预取资格；它成为当前块且READY后恢复原资格。已sent focus在预热但尚未visible的有效Session也可供给，未发送focus、paused、stale clock、storm等不能供给。关闭/切目标/迟到result继续走R1许可与stop/retire，不改CAS和锁序。

### 固定虚拟时间 + 真实HTTP/发表屏障

原session7数据：首HTTP0.815s，首网络2.535s，邻块网络5.621s，边界视频7.040s。真实手机壁钟等待2095ms来自tick；下表的固定回放边界按精确7.040s定义，因此旧等待2029ms，二者不混写：

| 指标 | 原R1 scheduler受控回放 | N29同输入 |
|---|---:|---:|
| 首块发送 wall ms | {old['first_sent_wall_ms']} | {startup['first_sent_wall_ms']} |
| 首块接纳 wall ms | 3350 | 3350 |
| 邻块发送 wall ms | {old['neighbor_sent_wall_ms']} | {startup['neighbor_sent_wall_ms']} |
| 邻块就绪 wall ms | {old['neighbor_ready_wall_ms']} | {startup['neighbor_ready_wall_ms']} |
| 视频块边界 ms | 7040 | 7040 |
| 边界等待 ms | {old['boundary_wait_ms']} | {startup['boundary_wait_ms']} |
| 两个逻辑块 / local provider请求 | 2 / 2 | 2 / 2 |

修后邻块发送时首块响应仍被真实屏障扣住，首块plan仍null，非sleep猜测。相邻cache hit则邻块API0；真实job复用、仅邻块、seek storm/pause/unsent阻断、上限、退役cache、main stop均覆盖。故意延长邻块仍显示真实pending_translation，不冻结旧句、不延迟播放。

代价：提前结束一个新Session可能多发送**至多一个**bootstrap紧邻块。稳定完整播放同段不增加逻辑block/正常重试；极慢服务器不承诺零等待。

## 4. C：非中文语义翻页，中文完全保持

- 非中文仅呈现身份 `n29-presentation-v3`；中文仍 `legacy_n26`。n28b-policy-v1、prompt/hash/JSON、中文缓存key不变，不清用户全cache。旧完整译文按现有scope合同，不把新分页缓存冒作旧命中。
- 平台ICU word/sentence用目标locale和线程局部实例；普通切口用word与line交集，Unicode句末/分句标点提供强候选。小数、Unicode数字、型号/带点复合单元、缩写/大写歧义点降级；开/闭括号和引号接缝、NBSP、CRLF、字素、Devanagari、RTL保护。
- 硬可行计划按应急切口少→弱词切口少→页面少→句末/分句与几何平衡排序，移除额外两行1800罚分。完整<=7000ms且fitsTwo仍优先一页；<1200ms只能完整几何可行单页，多页整数>=1200ms，7秒仍软参考。
- 应急字素仅开放于一个普通不可分单元本身超过两行的区间。单纯时间不够不能切正常词强凑。所有全文/顺序/字符/首尾时间保留，无硬可行方案仍安全空白；不缩字号/借时/截字/新增paid repair。
- 原40几何、14目标28冷热的原非空方案仍可行；新增40语义行×SDK28/35未发现新增安全空白。SDK28/35真实ICU的应急/弱边界输出可追溯；不把词边界兜底包装成完整语法分析或14语言全部语义正确。

### 原诊断完整事件145–169：42.719–51.974s

完整原文、不缩短：

> {ja['text']}

手机记录font `58.32203px`；逐条配对的内宽1103/1101/1160均回放。**1160px同宽同字号**恰重现手机三页切口；其它动态宽度的旧平台方案可能为四页，单独交付，不把它们冒作同一手机三页。

原R1算法同条件：

```text
{pages(ja['before'])}
```

N29：

```text
{pages(ja['after'])}
```

切口是 `一方で、 | 中国の…`，weak0/emergency0；无 `誇張す | る`，不再 `中国 | の`。完整98–126 /28.920–36.925s及阿拉伯原长句/数字的13组**原诊断字体+宽度配对**，每组before/after完整页与时段见 `n29-device-exact-sdk28.json` / `sdk35.json`。人工标准58px另作最初受控样本，不替代最终真实捕获尺寸回放。

日语b4比较方向风险不由分页修复；原请求/响应与SRT引用完整保存在 `japanese-b4-semantic-risk-unmodified.json`，未改prompt、未加本视频特判、未做付费语义评审。

## 5. 测试断言与施工失败记录

原中文18golden、ACCEPTANCE/frozen字节未改。原R1 K12、main lifecycle、permit下条消息、同key/late-result/切目标均继续通过。

| 原测试文件 | 定点改动 | 更强或对应的新合同 |
|---|---|---|
| N28ALanguageContextTest | fixture显式完整安装AI shadow | 生产rewriteUrl新许可不能由默认false测试stub绕过；新增未完成安装直接生产入口API0负例 |
| N28BProductionTest | 同上 | 原请求/源only/不ready断言保留；完整/残缺许可区分 |
| N28CCounterTest | 非中文v2→v3精确期望 | 中文legacy与n28b版本不变；新版本缓存隔离 |
| N28CProductionTest | no-spam helper只取timestamped真实REBUILD_PRESENTATION事件 | 避免把“about0/1秒”动态UI标题当事件；实际事件全文仍严格相等 |

未整套删除/跳过/改短输入；没有改变614中的其他断言。完整原文件备份 `.verification/n29/tests-before`。

新测试=installation6 + bootstrap8 + semantic14（7方法×SDK28/35）+实际monitor probe1 =29；614+29=**643**。新增scope probe20轮仅证明应等实际Session monitor而非任意BLOCKED，不改原R1测试。最终专门复核=原44+两个SDK实例46 + R1 pager10 + K12共**68**；main11由最终全量执行，不被跳过。最终 full-final-06 与 special-and-concurrency-final-03 的同一输入SHA `{summary['final_input_sha']}`；受控200+200=400。

所有旧失败日志保留：真实1.45签名失败；targeted-01失效cacheReading保留问题（已修）；targeted-02 fixture编译；targeted-03重复正则扫描长串性能（改为一次保护区/线性compound扫描）；targeted-04任意BLOCKED观察；full-final旧诊断manifest顺序和human-age伪no-spam比较；special main冷Activity fixture2秒setup超时（stack为RUNNABLE Android初始化、非业务stop调用或死锁）。不提高R1 5秒/测试2秒截止，最终full含main全绿；另68与400精确同源码全绿。

最终范围审查发现一次编辑意外删除miniplayer restore的visible条件，已把整个restore方法逐字恢复并收起中间包；`provisional-01`及`pre-seam-certainty`均**非交付**，不覆盖其日志。之后正式最终树full643/extra68与当前三件套重新验收。范围证明只允许Controller四个原方法（load/schedule/restoreCandidates/onRequestBodySent）变化，其它R1生命周期/restore/锁/CAS/Publication/Permit严格原样。最终29个monitor与编译指令审计通过，debug/release166产品class逐字节一致。

## 6. 最终交付、组合与审计

正式1.45匹配官方defaults根 **{summary['official_default_roots']}**，依赖/PASS总数 **{summary['actual_patch_passes']}**（含三根）；Spoof signature default=false未开启。真实最终 **{summary['root_dex_count']}根DEX / {summary['classes']:,}类 / 322,812方法 / 626,445分支边 / 112,423 switch cases / 46,709 try blocks**；invalid branches、dex problems、binding failures全0。不强制旧84/11/58052报告身份。

七种非空三根组合均由**同一正式MPP自身**重新加载真实Patcher，六种结构组合也真正序列化DEX重读审计，all-three为正式APK。native-only组合不选官方根、AI许可false且API0由生产测试验证。String1.44的真实回归、未知/多匹配和missing hook负例也已重新审计。

Compatibility与generatePatchesList来自当前正式源码：三个根targets仅21.16.256/minSdk28，README一致；不宣称其他稳定/experimental版本；产品仍1.3.5，本地n29身份，不修改发布资产URL/日期。

CRC/DEX头/校验和、72条目、内嵌MPE=独立MPE、实际14 locale×220键、三套最终宿主XML入口key/无图标/父屏、真实Collator排序与voice-over邻接既有测试、resources.arsc预览字符串、verify_bundle、原N8Verify、aapt均通过。aapt Windows中文参数失败日志保留，ASCII只读硬链接与最终APK同字节后验证minSdk28；不借此另建假APK。apksigner仅记录unsigned拒绝验签，不写作已签名。

| 绝对路径 | 字节 | SHA256 |
|---|---:|---|
{table}

最终证据总入口 `E:\\Projects\\morphe-caption-v2\\.verification\\n29\\delivery-records\\engineering-final.json`；正式源/测试输入与报告不依赖临时产品树。

## 7. 工程结果与未覆盖边界

- Java **643/643**；同代码专项**68/68**；400受控轮；failure/error/skipped均0。
- 中文18golden逐字段等；旧40几何/28冷热可行性保留；新40×2SDK与13组捕获精确几何×2SDK；多页<1200违规0、普通词内翻页0。
- Python **27/27**；本地化**220×14**只代表既有静态工程覆盖，不代表N30全UI运行时三项问题已解决。
- frozen **4通过/4既有失败/4未验证**；pending_translation/event_review/overflow invisible_ms全0。ACCEPTANCE与冻结输入/事实零diff，不包装全质量通过。
- 本次捕获的历史文件 **{summary['history_files_unchanged']:,} / {summary['history_files_unchanged']:,} SHA/字节不变**，包括用户APK、1.44/1.45、R1/C/B产物和原失败证据；大二进制不提交。
- 未做手机启动/安装/旋转观察或14语言母语自然度验收；ICU非完整语法分析。b4比较方向仍待审阅。没有创建N30，没有交DeepSeek，没有继续N27/VISIONOS。

用户下一次仅需：中文启动连续播放；日语原生底框及42–52秒切口；AI/CC开关与旋转各一次；异常给完整诊断/时段。**不要求重读14语种或全表复测**。本卡完成即停；规划者审阅后再发N30，第四期与三项UI/本地化收尾合并完成，不自行拆卡。

## 8. 本地提交身份

核心提交和 `anchor/n29-<实际短哈希>` 将在验证关闭后的独立docs身份补记中写实；不amend既有提交，不推送。
'''
(R/'docs/N29-LOCAL-TEST-BUILD.md').write_text(body,encoding='utf-8')
p=R/'docs/PROJECT-STATE.md';state=p.read_text(encoding='utf-8');lines=state.splitlines();lines[2]='> 最后更新：2026-10-02。N29已由Codex完整实现、验证和独立建包：1.45类型正确菜单与finalizer最后AI许可、原生draw、首块邻块供给、非中文n29-presentation-v3；最终Java643/643、同代码专项68/68及400受控轮通过，中文18golden相等，实际7组合/11DEX/58229类审计通过。未签名/安装/推送/发布，待有限手机复查与规划者审阅；未开始N30，后续第四期与三项UI本地化收尾仍同卡，不拆卡。最新§4ac及N29-LOCAL-TEST-BUILD。'
state='\n'.join(lines)+'\n'
state+='''\n## 4ac. N29完整交付（2026-10-02，Codex，工程通过/手机待复查）\n\n'''
state+=f'''执行HEAD f7c0c462、产品锚点9a7bdf3，旧docs规划保留。原1.45实际Patcher重现String guard失败，部分状态aiInstalled1/onMenu1/observe0/draw0/copy0与用户包吻合；不冒称Manager吞异常。现接受已知完整String/CharSequence签名、宽度推p寄存器、先验late guards、必要hook唯一计数后最后发布AI许可；生产rewriteUrl/NativeBridge未安装零API/原生直通/不清AI设置。真实最终onMenu/observe/draw/initialize/selection/copy各1，manual-only0，private copy正确；用户坏包、未知/多匹配、人工缺draw由同一审计非0具名拒绝。持轨waiting/安全空白/rotation阻断draw，OFF/离轨恢复，source-only旧语义保持，未重构扫描器。官方CC实际序列128真值表及生产链未复现Always show撤销手动Off，未装shim/不改官方偏好。\n\n启动仅sent focus后的index+1 cache-before-prefetch、既有SOURCE_IO异步/短锁接纳，focus2/prefetch2/总4/30秒/storm/预算/R1 CAS等不变。真实屏障固定时间回放邻块3448→815ms、就绪9069→6436ms，7040ms边界wait2029→0，两块各1请求；手机原tick壁钟2095ms另记。慢服务器仍真实pending，提前结束最多多1紧邻投机块。\n\n非中文平台ICU sentence/word/line+Unicode保护、应急/弱切口→页数→平衡，无单行1800罚；真正超几何不可分单元才应急，不用时间不足切正常词。n29-presentation-v3隔离，中文legacy/n28b/prompt/key不变。原ja145–169全文同58.32203px/1160px三页碎词→两页“一方で、 | 中国の…”，42719–48173/48173–51974ms；13组原诊断尺寸×SDK28/35完整before/after保留，98–126/ar也验。b4比较方向风险原响应/SRT保存，未改prompt/视频特判/付费语义审校。\n\n最终同输入SHA {summary['final_input_sha']}：Java643/643=614+新29，专项68/68，main/K12/permit下条消息/同key/迟到/切目标继续成立，200+200=400轮。中文18golden逐字段相等，原40几何/14目标28冷热、新40×SDK2合同通过；Python27，本地化220×14。冻结4/4/4，三个invisible_ms0，ACCEPTANCE/frozen零diff。原测试定点变化仅安装fixture、非中文版本和no-spam真实事件filter；完整before及所有失败/中间非交付包保留，不跳失败/加时限。最终scope proof恢复并冻结miniplayer/R1生命周期，Controller仅4原方法改；debug/release166class相等。\n\n正式官方1.45默认根{summary['official_default_roots']}、PASS{summary['actual_patch_passes']}，7组合均真实Patcher序列化/审计，最终11DEX/58229类/322812方法/626445分支，invalid/dex/binding0。共享Constants/生成JSON/README仅21.16.256/minSdk28，产品1.3.5/原资产URL日期不变。CRC/资源/设置/Collator/aapt/verify_bundle/N8Verify及MPE内嵌等值通过。{summary['history_files_unchanged']}历史文件SHA/字节一致；大用户APK/官方MPP不提交。\n\n'''
state+='\n'.join(f"交付：{a['path']}；{a['bytes']} B；SHA256 {a['sha256']}。" for a in art)+'\n'
state+='''\n未签名/安装/清数据/卸载/推送/发布；远程API/下载/依赖0。工程结果不等于手机或14语言语义全通过。用户仅中文连续启动、日语底框/42–52秒切口、开关/旋转一次并给诊断，不再次十四语言全表。Codex本卡完成即停，不开N30、不交DeepSeek；第四期与三项本地化收尾仍等规划者同一N30授权。核心提交/anchor由后续docs-only写实；两份状态同步。\n'''
p.write_text(state,encoding='utf-8')
external=Path(r'C:\Users\14776\Documents\kimi\tasks\2026-09-29\00-35-52-ec1208d7\PROJECT-STATE.md');temp=external.with_name('PROJECT-STATE.n29.tmp');temp.write_bytes(p.read_bytes());temp.replace(external)
assert p.read_bytes()==external.read_bytes()
print('N29 delivery report written, planner docs preserved, both states synchronized')
