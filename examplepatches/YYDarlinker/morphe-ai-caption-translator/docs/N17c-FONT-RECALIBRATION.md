# N17c v2：屏幕宽度比例字号与像素标定

2026-09-30。P1–P6；零 API / 0 token。N17b 固定 sp 三形态一致制已撤回，旧键单位隔离保留。分页实现、冻结证据与 ACCEPTANCE 判据未改；本卡不建测试包、不执行真机验收。

## P1 像素锚点与渲染机制

用户定案：按 YouTube 原生标准，详情页↔全屏字幕等比例缩放；主尺度为当前屏幕宽 `displayMetrics.widthPixels`，与视频画面宽高比无关。设置以 Shorts / 竖屏详情页的 glyph 字高 px 标识。

实测锚点来自 66.jpg 的 **2736×1264 原图单字窗口**：B 站横屏全屏「经」55px、「频」56px，平均 glyph 字高 **55.5px**。`r=55.5/2736≈0.0202851≈2.03%`；竖屏屏宽 1264px 时约 **25.6px**，横屏屏宽 2736px 时约 **55.5px**。81.jpg 的 B 站详情页 44.5px 与 85.jpg 插件详情页 68.5px 是纠错材料；默认值由全屏锚点按屏幕宽缩放决定。

存储按万分位整数取 **203**：`r=203/10000`。运行目标为 1264×0.0203=**25.6592px**、2736×0.0203=**55.5408px**；与定案近似值的差分别为 0.0592/0.0408px。滑块一位小数据实际保存比例显示 **25.7px · 2.03%**，不截断数值；第三轮仍按截图 glyph **25–26px / 55–56px** 核对。

`SubtitleStyleMetrics` 用当前 TextView 的 Paint（同 typeface/style/flags）克隆测量；在 1024px em 下分别 `getTextBounds("经")`、`getTextBounds("频")`，取高度平均，得到当前字体及 CJK fallback 的 glyph/em 比例，反解 `textSizePx`。再在候选最终字号上实测 glyph bounds，最多 16 次二分校正，保留观测误差最小的候选；误差 ≤0.25px 时提前结束。这样避免大 em 线性反解在小字号 hinting/整数包围盒处多出约 1px。glyph 平均边界以 0.5px 为步长，极小字号的字体 hinting 可能跳过某些高度，不能承诺任意字体/任意小数目标恰好命中。

TextView 使用 `COMPLEX_UNIT_PX`；布局预算、分页 `fitsOne/fitsTwo`、StaticLayout 行数、背景紧凑宽度都用同一有效 `textSizePx` 和 DEFAULT/NORMAL 字体。density/fontScale 不参与字幕目标字高或主渲染字号求解，仅用于原有边距/阴影/设置控件和诊断。屏幕宽改变即使视频矩形不变也会使预绘制缓存失效。译文 owned 页面保持所求字号；原有非 owned 长状态/兜底缩字逻辑仍保留，其最小值改用当前屏宽下 150bps 的同一像素求解，不加旧 12sp 绝对下限。极端收窄不以绝对字号下限破坏同比缩放。

`FontMetrics.descent−ascent` 是行盒高度，不是截图实心 glyph 高度。代码与诊断分别记录 glyph bounds 和 FontMetrics；没有用 2.66px/sp 或任何假设的 density/fontScale 系数。这里的「经」「频」仅作字体几何标尺，不参与译文匹配、过滤或分页切点。

## P2 设置、范围与旧键去向

新键 `caption_glyph_height_ratio_bps` 存 int；默认 203，读取和保存均裁剪到 **150–300**（`r∈[0.015,0.030]`），滑块每步 1bps。实时值按 `min(displayMetrics.widthPixels,heightPixels)×r` 显示竖屏详情页/Shorts 字高 px，旁列比例；预览在拖动中更新，松手保存并刷新实际叠层。方向切换预览分别按短边/长边求目标，在真实尺寸坐标量字体后整体缩成微缩画面。

| 存储键 | 原单位 | N17c 去向 |
|---|---|---|
| `caption_glyph_height_ratio_bps` | 新 r 万分位 int | 唯一读写的新字号设置 |
| `caption_text_size_tenths` | N17b 0.1sp | 作废；保留磁盘值供历史回溯，永不读取/换算 |
| `caption_text_size` | 更早 8–15 视频相对值 | 作废；保留磁盘值，永不读取/换算 |

未保存新键者一律回到 203，不继承旧用户字号；旧键即使持有错误类型也不会误读。设置仍全局保存，不随 API 配置方案切换。14 语种实际资源、localization/catalog.json、source-keys.tsv 与 Java fallback 的标题/说明同步；防止宿主资源优先后仍显示旧 8–15/sp 文案。

## P3 评论区叠加

保留 N17b 的**同一播放器形态、同一屏幕方向**正常视频宽基准 `W_normal`，只在当前视频矩形 `W_video < 0.8×W_normal` 时触发；恰好收窄 20% 不触发。目标变为 `H=r×W_screen×W_video/W_normal`，矩形恢复时回到 `r×W_screen`，播放器类型/Shorts/方向变化重建基准。正常基准等于屏幕宽的标准路径中，收窄后恰好等效 **r×矩形宽**；正常视频矩形本来小于屏幕宽时按完整通式核对。主机制仅应用一次，收窄缩放仅应用一次。

回归核对了阈值前后、恢复、正常屏宽基准下的 `r×矩形宽` 等价和非屏宽视频基准的组合；实际 glyph 的半像素/小字号 hinting 误差独立于目标公式。收窄原因非仅评论区、进入时已打开无正常基准两项已知边界留在 P6 真机核对，不加评论开关推测或现场修复。

## P4 REBUILD_PRESENTED 像素口径

诊断仍由既有显示文本诊断开关控制。新增字段也进入布局时间例外/兜底详情；`lines` 继续量实际当前页，不回退到整段口径。

| 字段 | 精确定义 |
|---|---|
| `target_glyph_height_px` | 配置 r×当前屏宽，经 >20% 收窄例外后的首选 glyph 目标 |
| `rendered_glyph_target_px` | 非 owned 缩字后的名义目标；owned 译文与首选目标相同 |
| `glyph_height_px` | 最终 TextView Paint 下「经」「频」各自 glyph bounds 高度均值；与截图墨迹对照 |
| `font_metrics_height_px` | 同一最终 Paint 的 `descent−ascent`；解释行盒，不作为 glyph 测量值 |
| `text_size_px` | 实际最终 Paint/TextView 字号，即 em 的物理像素值 |
| `screen_width_px` | 当前 `displayMetrics.widthPixels`；主比例尺度 |
| `video_width_px` | `CaptionSurface.videoBounds(host).width()`；SurfaceView/TextureView 可见视频矩形宽 |
| `normal_video_width_px` | 收窄例外采用的已观测正常视频宽基准 |
| `ratio_bps` | 保存的 150–300 万分位 int |
| `density` / `fontScale` | 当前 DisplayMetrics.density / Configuration.fontScale，仅供复核 |
| `width`（既有） | **StaticLayout 最大可用文本行宽 px**：`round(video_width_px×普通0.92/Shorts0.78)−TextView左右padding`，最小 1；不是屏幕宽，也不是实际紧凑背景宽 |
| `sp`（既有） | `text_size_px/当前实际scaledDensity` 的兼容诊断值，不作为渲染输入，也不能当 glyph px |

背景用 StaticLayout 二分得到紧凑内容宽后加左右 padding；实际背景常比 `width` 小。P5 按卡面把框宽 1163/2042px 直接作为代理可用行宽，不另扣 padding；对比真机 `width` 时须先对齐这个口径。非 owned 状态缩字时目标字段与实测字段可不同，必须同时看 `mode`、`rendered_glyph_target_px` 与 `text_size_px`。

## P5 两组 N15r 捕获语料离线重跑

语料为 `extensions/extension/src/test/resources/r29/captured-events.json`，SHA-256 `1f6b08c80c3fce7b419062adf60f44d94f65151609a56c6922d6f303c6479810`；prompt SHA `d841cf104e07cb2330f3143c538981979f8ba062dc6582c322f6dc8460ad0379`。两组同 540 个接受事件、9576 个中文归属词 ID；历史失败块 108 个原文归属词 ID 独立保留，不算新布局回退。SDK28 Robolectric 原生 StaticLayout/DEFAULT 字体桌面代理，使用与运行时相同的 glyph→em 求解，不是真机字高验收。

入口 `RebuildN15PagingReplayTest`：新增 `MORPHE_N15_WIDTH_PX` 和 `MORPHE_N15_GLYPH_HEIGHT_PX`；无 glyph 变量时保留历史 `MORPHE_N15_FONT_PX` 的 em 代理及默认 1121px/46.7083px，不覆盖 N15r/N17b 历史结果。原分页 12–18 字、2–3.5s 软偏好与全部硬门槛未改。统计页长/CPS均沿既有 Unicode codepoints（含标点）口径；8 汉字格硬门槛独立用 display_half_cells≥16。

| 同一语料 / 同一分页代码 | 竖屏代理 | 横屏代理 |
|---|---:|---:|
| 可用框宽 / 目标 glyph | 1163px / 25.6px | 2042px / 55.5px |
| 最终 Paint glyph 实测均值 | 25.5px | 55.5px |
| 求得 em / FontMetrics descent−ascent | 26.0339 / 30.5085px | 59.2627 / 69.4485px |
| 接受事件 / 页数 | 540 / 791 | 540 / 791 |
| 页长 P10 / 中位 / P90 | 10 / 16 / 27 字 | 10 / 16 / 27 字 |
| 页时长 P10 / 中位 / P90 | 1.986 / 3.484 / 6.269s | 1.986 / 3.484 / 6.269s |
| CPS 中位 / P90 | 4.51 / 6.03 | 4.51 / 6.03 |
| 单行页 | 100.0% | 99.2% |
| 12–18 字软带 | 331/791 = 41.8% | 331/791 = 41.8% |
| 2–3.5s 软带 | 318/791 = 40.2% | 318/791 = 40.2% |
| 两软带交集 | 26.7% | 26.7% |
| 新布局原文回退 / 硬约束违规 | 0 / 0 | 0 / 0 |

两组页数变化事件 **0**。页长分布：<12 字 152页（19.2%）、12–18 字 331页（41.8%）、>18 字 308页（38.9%）；时长分布：<2s 82页（10.4%）、2–3.5s 318页（40.2%）、>3.5s 391页（49.4%），两组相同。软带是偏好，长页例外保留原判据，不能把代理通过写成所有页均在软带内。原两行/CPS≤8/最短1.2s（整事件短窗单页例外）/时间连续与归属/原文完整/≥8汉字格事件每页≥8格均检查通过。

复跑：设 `MORPHE_N15_WIDTH_PX`、`MORPHE_N15_GLYPH_HEIGHT_PX` 为上表每组参数，`MORPHE_N15_LAYOUT_EXPORT` 分别指向 `.verification/n17c-20260930/portrait-layout.json`、`landscape-layout.json`，各执行一次 `gradlew.bat :extensions:extension:testDebugUnitTest --rerun --tests app.yydarlinker.deepseekcaptions.RebuildN15PagingReplayTest --offline`。`--rerun` 防止环境变量变更被任务缓存略过。两组独立运行后清除这些环境变量，正常全套测试继续使用历史代理参数。

汇总入口 `scoreboard/n17c_compare.py`，传入两份 export 与 `scoreboard/results/n17c-font-comparison.json`；JSON 含源/布局 SHA、分布、逐项硬违规数和 0 API/0 token 账目。原始布局 export 留在上述本机验证目录，汇总随卡提交。N17b 错误标定原文未删除，在 `docs/N17b-FONT-ARCHITECTURE.md` 末尾追加更正并指向本记录。两组结果支持保留软带常数，真机观感仍由用户签字。

## P6 第三轮真机标定设计（本卡仅设计，未执行）

使用同一默认设置 `r=203/10000=2.03%`、同一字体及系统设置，保留原分辨率截图；1264px 竖屏宽与 2736px 横屏宽由 `displayMetrics.widthPixels` 和截图尺寸双重核对。测量独立汉字的实心 glyph 包围高度，不把 em、FontMetrics 行高、行间距、黑色背景框、阴影或描边算成字高。沿用 66.jpg 的单字窗口方法，优先量同样的「经」「频」等完整汉字，记录单字结果及均值；截图预览经过缩放时须回到原图测量。每帧保存视频 ID、播放器位置、屏幕方向、字幕事件 ID/页号、系统字体缩放及同刻 `REBUILD_PRESENTED`，对照 `target_glyph_height_px`、`glyph_height_px`（「经」「频」bounds 高度均值）、`font_metrics_height_px`（descent−ascent 行盒高度）、`text_size_px`、屏幕/当前视频矩形/正常视频基准宽及 density/fontScale。目标 glyph 与 glyph bounds 比较；FontMetrics 字段只用于解释行盒和复算，不能冒充截图实心字高。

| 同一默认设置的形态 | 当前屏幕宽 | 原分辨率 glyph 预期 | 核对重点 |
|---|---:|---:|---|
| 竖屏视频详情页 | 1264px | 25–26px（目标 25.6592px，约 25.6px） | 同片源进入详情页，按原图量字并互验诊断 |
| 横屏全屏 | 2736px | 55–56px（目标 55.5408px，约 55.5px） | 详情页↔全屏字高比应约 2736/1264=2.1646 |
| 竖屏 Shorts | 1264px | 25–26px | 与详情页同屏幕宽同字高，矩形和布局宽度可不同 |

这三个区间是本卡提交给用户的第三轮核对目标，尚无 N17c 真机签字。补量滑块两端 `r=1.5%/3.0%`：1264px 屏宽目标 18.96/37.92px，2736px 屏宽目标 41.04/82.08px；另在同一屏幕方向切换不同视频宽高比，未进入矩形收窄例外时，屏幕宽不变应字高不变。调系统 `fontScale` 后互验目标与 glyph 字高，不以任何预设 density/fontScale 换算判定通过；恢复原设置后复核。

### 评论区与主机制叠加

先在同一播放器形态、同一屏幕方向记录正常视频矩形宽基准 `W_baseline`，再开评论区收窄、关闭恢复。现有缩放只在 `W_rect < 0.8 × W_baseline` 时触发，缩放系数 `s=W_rect/W_baseline`；主机制叠加后的目标应为 `H=r×W_screen×s`，恢复时回到 `r×W_screen`，不能再次按 density 或 fontScale 缩放。正常基准等于屏幕宽时，收窄后即为 `r×W_rect`；若正常矩形因视频比例小于屏幕宽，须按诊断中实录的基准核验，不能省略基准而假称等价。记录临界附近（未超过 20% / 已超过 20%）及恢复后的截图和诊断，在 Shorts、详情页、全屏分别重复。

两项已知边界单独列入核对：① 收窄可能由评论区之外的布局变化引起；② 进入时评论区已打开，尚无正常宽度基准。遇到它们记录形态、方向、前后矩形宽和现象，按真机规则回流；本卡不识别评论开关，也不现场修复。控制层显示/隐藏时继续采集可靠可见信号、进度条遮挡边界及截图；N17b 未实施的自动上抬仍无改动，本卡不以播放器形态或 CC 按钮代替控制层信号。

### 85.jpg 后方英文疑点：证据定位与核对程序

仓库文件枚举未发现 85.jpg；本卡只读查看原件 `D:\HONOR Share\Honor Share\85.jpg`（1264×2736），以及 `D:\HONOR Share\Honor Share\caption-diagnostics-1.3.5-20260929-230749.txt`，未复制、覆盖或改写冻结材料。85.jpg 的中文是「看着这些，甚至在入侵之前很久，」；可与该诊断 L272 的 `REBUILD_PRESENTED` 文本对应：`id=1:1:2:127-144`、第 1/2 页、`page_range=36925-39921`、外层时间 `1790693868472`。L273 `REBUILD_SELECTED` 在播放器 `time=36986`、整事件 `range=36925-42719` 选中中文，外层时间 `1790693868488`；L274 在 `1790693871424` 展示下一中文页。

对该诊断全部 `source:` 记录的检查，仅见 L204/L215/L230 的原文 `REBUILD_SELECTED`，归属窗口分别为 3600–9040、3600–7040、80–4880ms；对应 L206/L219/L229 `REBUILD_PRESENTED` 均是 `mode=overflow_status`、中文「字幕过长，原文暂不可用」，并未实际呈现英文兜底。现有记录没有原文 SELECTED 与上述 36.925–39.921s 中文 PRESENTED 窗口重叠。截图文件名及文件修改时间不足以绑定诊断会话，这条对齐只给第三轮提供查找位置，不能证明该图没有原生字幕残留。图中可辨的英文末尾为 `STRONK?`，其与该事件源句不一致；这仍不足以判定它属于视频内容或残留层。

第三轮在同一视频约 36.9–39.9s 暂停于相同画面，先保存默认字幕帧和当次完整诊断，记录外层日志时间与播放器位置；使用既有字幕开关逐一关原生 CC、隐藏插件叠层，保持视频帧不变，分别保存原分辨率截图。英文在两层都隐藏后仍留在同一视频像素位置，才支持其为视频内容；英文随某一字幕层消失，则定位为该层候选残留。切换后若画面或位置移动，重新对齐，不能用不同帧作比较。

诊断核查按 `session:generation` 分组，按外层时间排序，锁定截图附近中文 PRESENTED 的页时间窗；列出所有原文 SELECTED（`id` 含 `source:` 或文本含 `[原文 / Original]`），以及其后对应 PRESENTED、下一次替换、空文本/seek/形态切换记录。先检查原文归属 `range` 与中文 `page_range` 是否交叠，再检查是否存在同一截图时刻的实际英文 PRESENTED，避免把 SELECTED 当成已经渲染，也避免把同一事件重复绘制算成两层。结合 `NATIVE_RENDERER_VIEW_MASKED` 等既有遮罩记录和开关截图核对原生层；仅「日志未出现原文重叠」不能排除未被插件日志覆盖的原生层。若发现疑点，只登记视频位置、原图和相关日志行，保留材料回流用户验收，不在真机轮现场改代码或判据。

## 验证与停止线

Zulu JDK21 + ANDROID_HOME 执行 `gradlew.bat test --offline`：**Java386/386，失败/错误/跳过均0**；实际本机 Python 执行 `-m unittest discover -s scoreboard`：**27/27**；`scoreboard/run.ps1`：冻结计分板**4通过/4既有失败/4未验证**，三类不可见时长全0。Java新增/迁移覆盖旧键隔离及裁剪、滑块实时/松手保存、预览两形态、当前字体两像素锚点、density/fontScale独立、视频比例独立、收窄/恢复/阈值、屏宽独变预绘制、布局与当前页诊断互验。背景长句测试改用能容纳新字号两行的框宽，全文和最后字符覆盖断言保留。

设置原生亮/暗、横/竖 fixture 图片导出 `.verification/n17c-20260930/settings/`，已抽查布局；属于桌面 fixture，不当作手机截图证据。`git diff` 核查 ACCEPTANCE、冻结JSON、N15r/N17b历史结果和 RebuildPageLayout 无变化；N17b文档仅追加8行更正。§2.8已在开工将外部状态原样覆盖入仓库，再记录本卡完成及已有提交事实。API调用0、token0，无依赖/下载/新真机修改，P1–P6完成即停止。
