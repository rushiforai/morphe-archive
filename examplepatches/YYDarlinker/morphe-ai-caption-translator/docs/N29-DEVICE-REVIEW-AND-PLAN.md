# N29真机审阅与剩余开发收敛规划

日期：2026-10-02。规划者只读审阅、源码/最终APK核查与任务编写；未实现产品或复跑产品测试。

本记录覆盖上轮“先单独执行N28C-R2、再要求用户做首次复验”的计划。用户已经用官方1.45.0组合安装并完成手机清单，提供完整诊断、源SRT和实际安装APK。后续仅两张完整开发卡：N29解决实际播放器问题与1.45完整接入；N30完成第四期并统一关闭三项UI/本地化问题。两卡均Codex全权执行，完成一张交付一张，不交DeepSeek、不自行派生更多r卡。

## 1. 输入、身份与完整性边界

实际产品仓库HEAD f7c0c462dcd31f57f1336678007793570cbd4818，源码/锚点9a7bdf35351b9a052233bac8b9004241548eb1eb / anchor/n28c-r1-9a7bdf3。工作区产品未改，只有上轮规划docs与官方1.45.0输入，随后新增用户APK。

| 输入 | 字节/身份 |
| --- | --- |
| D:\HONOR Share\Honor Share\caption-diagnostics-1.3.5-20261002-180521.txt | 1,262,317；SHA256 BCD70B494B0C1EB21E2357727602078F40D1ACC72C6EBBEA2F1444874A4D36F5 |
| D:\下载\.deno\bin\China's Military Modernisation Speedrun - Budgets, Industry, and Purchasing Power Parity [mH5TlcMo_m4].en.srt | SHA256 B86A06B339D36D63FFF0B75598B5DF6C3C3EB80230863717E713CA542DAAE9C8 |
| E:\Projects\morphe-caption-v2\YouTube_Morphe-v21.16.256-patches-v1.3.5.apk | 199,492,582；SHA256 8676787F0C5DB0636CA72C8DAC08071B6263BFEC7DBA4D592E408BBC0EF0B5C4；用户确认这是实际安装包 |
| E:\Projects\morphe-caption-v2\patches-1.45.0.mpp | 11,039,984；SHA256 DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93；已对官方资产digest |

诊断导出标记bounded_not_guaranteed、debug=true：2436 history / 27 quality，去重跨通道后2438个时间事件，时间跨度约389.6秒。Token审计观看263秒，28尝试/27成功/1 SocketException、无429，52,627 tokens；27个质量请求仅覆盖zh-Hans15、ar6、ja6，共93个响应事件。这不是14语种全量真机验收，accepted是结构接纳，不是语义认证。源SRT是滚动重叠字幕，不把每条SRT视为独立完整句，更不能凭它强制重写owned时间。

## 2. 原生黑框：实际APK缺少核心draw拦截

这是本轮最重要的最终产物证据：

| 钩子/接口 | 用户实际APK | 原R1+官方1.44工程APK |
| --- | --- | --- |
| 官方PlayerFlyoutMenuComponentsFilter.isFiltered路径参数 | CharSequence，是真实新接口 | String |
| CaptionQuickToggle.onMenu宿主调用 | 1 | 应有1 |
| CaptionQuickToggle.observeMenuPath宿主调用 | **0** | 应有1 |
| SubtitleWindowView.draw(Canvas)自定义覆盖 | **不存在**，类在classes6.dex但只含原方法 | 存在，draw直接调用suppressNativeDraw并在AI持轨时return |
| NativeCaptionBridge.suppressNativeDraw调用 | **0**，只存在未使用的helper | draw中1 |
| 原生字幕选择派发onNativeTrackApplied | 1，核心翻译仍能工作 | 1 |
| 官方AutoCaptionsPatch | 新BOTH_ENABLED提前return逻辑 | 旧guard顺序 |

源码installCaptionQuickToggle先插onMenu、再对isFiltered的String参数做guard；新版此处不满足。调用它的installNativeCaptionBridge在其返回后才添加SubtitleWindowView.draw及最后的长按接缝。实际包“前面已插、后面全缺”与该中断位置吻合。因此“能够播放和翻译”不代表完整兼容，原生draw漏遮与1.45菜单接入在同一条失败链上。

已确定：用户APK的draw防线缺失、菜单路径接入残缺，必须修。尚未从Manager构建日志证明它如何处理finalize异常；不能把“Manager吞异常”写成已经直接观察到的事实。N29由真实patcher重现同一错误与插入状态，并保证自己的组合入口拒绝残缺包。

日语session43有持续VIEW_NOT_FOUND；重新开启后的session49在1790935464250捕获SubtitleWindowView，符合alpha遮罩能暂时补救，而对象重建/查找漏掉后没有draw防线兜底。用户图中的黑色残框与此机制相容；不凭截图推断翻译错误或某个UI点击故障。

规划修正：上轮“R1必然不能与1.45混用”的表述过于绝对。现修正为“能够产生并运行一个部分接入的包；完整功能接入不合格”。1.45专门适配仍需要，但合并到N29，不再先跑一张纯R2。也不再仅因官方Always show变更就预设必须修改它：用户已做开关测试，先验证实际手动CC链，保持官方行为；有受控重复开启回归再加仅AI模式的最小兼容接缝。

## 3. 第二句等待：启动预取被everReady串行门挡住

中文session7：第一块HTTP开始1790935147260，接纳1790935149809；下一块HTTP直到1790935149893开始，晚2633ms。播放7121ms越过7040ms块边界后等待，墙钟1790935153482–1790935155577，共2095ms。第一块只覆盖80–7040ms，下一块网络自身约5621ms，此串行延迟足以造成边界断供。

日语session49又出现相同模式：首个可见事件在视频28.111s到达，下块29.066s又进入pending_translation，到35.048s才退出（墙钟约6797ms）。源窗剩余很短时，首句刚出现就再次等待更明显。

源码schedule的!s.everReady禁止首块接纳前的所有预取，restoreCandidates也有同样门；不是waiting文案自行闪烁或已经READY被误判这一假说得到证实。低风险修正为：当前请求已真实发出、播放时钟新鲜且未暂停/seek storm时，允许**仅紧邻一个块**先查cache再走既有prefetch lane。首块就绪后恢复既有2路规则。focus2/prefetch2/总4、30秒范围/attempt预算不增加，跨session权限/CAS/清理保持。不合并块、不推迟首句、不冻结旧字幕、不靠把“翻译中”藏起来伪装速度提升。极慢网络仍可能等待，不能承诺所有场景零等待。

## 4. 非中文翻页：现有规则不足以保证可理解切口

用户再次澄清目标是“标点及不影响语义理解的位置翻页”，不是只不裁字或只减页数。源码与实机都支持这一问题：

- CaptionLanguagePager用ICU lineBoundaries（合法换行机会）作为翻页候选，缺少word/sentence层次；CJK合法换行可在一个词的字间发生。
- DP每页成本200，但两行页额外1800，偏好更多单行页；标点奖励仅80，无法抵消这个偏向。
- 真实日语42.719–51.974s的同一事件被分成三页：`ロシアは国際的な評判と軍事能力を誇張す` / `るのが非常に上手いと感じる一方で、中国` / `の近代化努力は過小評価されがちだからです`。第一刀劈开动词，后一刀把修饰关系悬空。

新策略是本地呈现候选排序：完整事件可行保持全文；必要多页优先完整句/句末，再标点分句，词边界兜底，确实超几何的单一长词才允许字素应急。先保词与强边界，再比较页数和几何平衡；软CPL/CPS不能驱动更多页/更多空白。中文旧规则与18组golden完全不动；多页1200ms、源窗首尾/全文、两行/真实字形与缓存隔离不动。升级仅非中文presentation-v3，不换请求策略。

标准依据：[ICU](https://unicode-org.github.io/icu/userguide/boundaryanalysis/)分别提供字符/词/句/换行分析，并对日语等自动使用字典；[Unicode UAX14](https://www.unicode.org/reports/tr14/)定义合法换行机会，而非字幕的最佳语义翻页；[Netflix通用规范](https://partnerhelp.netflixstudios.com/hc/en-us/articles/215758617-Timed-Text-Style-Guide-General-Requirements)强调保留相关短语并优先合适的断行位置。采用其原则，不把流媒体字幕全套指标强塞入实时播放器。

边界：本地ICU与标点不能完整理解十四语种句法，无标点长句不保证每刀都是最佳语言学切口；不能宣称“全语种语义已解决”，也不以样例专用助词/实体/词表规则凑过关。该改动解决已确定的分页评分与切词问题，译文意义是否正确是另一层。

质量补充：日语session49 b4在原源文“more impressed with Russia … than … China”处出现`中国…方が感心する`，有把比较方向倒过来的明显风险，且后文碎片残接。NEUTRAL_PROMPT已有比较/否定/条件保真要求；现无证据证明一个低风险机械规则能可靠修全部语种这类错译。本轮不改prompt/新增付费语义评审、不恢复N23例子特判；保留原响应与SRT关联为开放观察。不能把分页修正说成修复了这处译文本身。

## 5. 仅两张剩余开发卡

| 卡 | 一次完整交付范围 | 放行方式 |
| --- | --- | --- |
| **N29（当前下发）** | 1.45真实接入/防残缺包、原生draw防线、启动紧邻预取、非中文语义边界优先分页、真实YouTube21.16.256兼容元数据 | 一次工程全量/真实最终DEX；用户仅复查漏框、开关、第二块等待及日语切口，不重新跑整套14语种手机清单 |
| **N30（N29审阅后下发）** | 第四期多语言添加合并进AI根，加上三项最终UI/本地化/技术诊断英文闭环；发版来源/元数据一致性预检 | 一次最终工程矩阵+有限手机菜单/语言切换验收，之后再准备正式发布 |

N30必须包含，不再延期：

1. 14目标多选、默认空集合；已存在语言/别名不再重复添加，保留原生条目及顺序，新增位置遵真实YouTube当前语言排序；AI开关OFF仍保留菜单能力；目标选择权仍在原生菜单；第二个Add Simplified根并入AI，Remember根独立。使用官方1.45.0及当前已验接缝，无新增翻译API或重新研究一种架构。
2. AI入口summary改功能介绍（建议中文“使用自配AI服务实时翻译视频字幕。”），14语言对应；入口仍在旁白之后/无图标。
3. 真正运行时全UI审计：内建默认要求、字号档名/说明、preview_sample及“样式预览（全屏）”、对话/按钮/Toast/诊断shell/模型与新多选UI。单靠220×14静态键齐全不足以闭环；真实Morphe语言覆盖、Android context以及Locale默认不同的切换矩阵都要测。用户自定义原样保留，不因UI语言变化改其存储或误改目标语言/缓存scope。
4. 程序性诊断标题/事件/字段/原因统一英文，UI按钮与说明随应用语言；源文/译文/用户内容/供应商原始证据保留原文，不能翻译掉证据。新功能当卡就用资源键/英文技术字段，最终逐调用点运行验证。
5. 当前旧1.3.5 recovered Smali发布路径不能验证/上传最新Java/Kotlin开发；在最终发布准备时核对并修正验证路径/语义版本/生成元数据/真实资产关系，不覆盖原已发布资产。本轮没有授权发布。

N29不包含全UI整改和菜单合并，N30不再把它们单独拆成N31/N32。若出现可定位的小回归在同卡闭环；真正超出两个已定范围才带具体证据回规划者，不能因为docs-only HEAD、既有故意改变的测试断言或“官方版本号不同”机械停工。

## 6. 证据目录与下一步

只读核查证据.verification/n28-device-review：timeline.json、quality.json、translated-events.json、review-summary.json、installed-filter.txt、installed-subtitle-class.txt、installed-hook-refs.txt、installed-draw-and-auto.txt、r1-official144-native-draw.txt。原用户材料和当前安装APK不改、不签名、不安装/卸载；本轮ADB无设备，没有新真机日志。

下一步执行docs/N29-CODEX-TASK.md；N28C-R2-CODEX-TASK.md已被覆盖，不再串行追加一张R2。新手机观察记为live，不动冻结ACCEPTANCE或4/4/4。N27继续搁置，VISIONOS用户已解决不处理。
