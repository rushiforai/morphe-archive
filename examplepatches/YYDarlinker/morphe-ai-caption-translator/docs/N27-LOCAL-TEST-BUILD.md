# N27 交付记录：普通播放器控件避让

日期：2026-10-01（N27）。执行仓库 `E:\Projects\morphe-caption-v2`，开工 HEAD `7f9c639`（N26 文档收尾），源码锚点 `anchor/n26-509d50a` 存在且指向 `509d50a`，与卡片一致；`git log --oneline anchor/n26-509d50a..7f9c639` 只有 docs 两文件变化，源与最终文案一致。开工按 §2.8 核对两处状态档案：卡片给出的仓库档案读数（74,240 字节 / SHA-256 `34DE0FB85E0D46A3C4D3693F7262C4500AE93B8650E11CDB895E311E3F140B09`）与 `docs/PROJECT-STATE.md` 一致，故按该点开工；执行中途规划者在 2026-10-01 17:49 又更新了同一文件（现 77,463 字节 / SHA-256 `EC78EFBC93AD9F87FE22FDDB226FB6E8C41DDED738E4DE966AA7B4B35AC5516B`，新增 §0 接手须知、§3 审阅规程、§4l 交接节），外部副本 `C:\Users\14776\Documents\kimi\tasks\2026-09-29\00-35-52-ec1208d7\PROJECT-STATE.md` 与仓库文件逐字节相同。**该管理更新原样保留并随本卡提交**，未还原成任何旧反馈。

翻译 API **0 次 / 0 tok**，新增依赖 **0**，下载 **0**；不真机、不签名、不发布、不推送。正文、页索引与时间归属、字体大小/样式、API 协议/调度/重试、原生与 AI 轨道 ownership、缓存、菜单、语言策略、设置入口及全部用户持久化值均未改动。卡片 §2 列出的三项延期问题**继续未关闭**，本卡未触碰。

## A：可见性输入与运行时接入

**定位沿用官方模式**。Morphe 官方 1.44.0 用 `PlayerControlsVisibilityEntityModelFingerprint`（公开无参 `getPlayerControlsVisibility`、返回 `L`、过滤器 `IGET` + `INVOKE_STATIC`）定位 YouTube 的控件可见性读数，并把观察者写进该实体模型的构造器。本卡在**本 patch 内**定义同构指纹 `PlayerControlsVisibilityFingerprint`（`Fingerprints.kt`），不引用、不重打包、不替换、不删除官方任何类或 hook。

**真实解析结果**（对交付 APK 逐字节读出，见 `.verification/n27/controls-hook-check.txt`）：

| 项 | 值 |
| --- | --- |
| 唯一匹配 | `CONTROLS_READER_MATCHES=1` |
| 读数方法 | `classes3.dex Lbfec;->getPlayerControlsVisibility()Lbfee;` |
| 状态字段 | `Lbfed;->e:I`（int） |
| enum 工厂 | `Lbfee;->a(I)Lbfee;`（`I → Lbfee;`，返回类型等于读数方法返回类型） |
| 实体模型 | `Lbfec;`（`toString()` 自带 `PlayerControlsVisibilityEntityModel{`，非猜测） |
| 模型构造器 | `<init>(Lbfed;)V`，3 条指令，持有者存储 `iput-object v1, v0, Lbfec;->c:Lbfed;` 恰 1 次，其后无 return，末尾 `RETURN_VOID` |
| enum 身份 | `Lbfee;` 确为 `Ljava/lang/Enum;` 子类，常量名 `PLAYER_CONTROLS_VISIBILITY_{UNKNOWN,WILL_HIDE,HIDDEN,WILL_SHOW,SHOWN}` |

**注入路径与并发安全**。按官方同一条构造器注入路径，把**已初始化**的 enum 交给自有回调：

```smali
iget-object v1, v0, Lbfec;->c:Lbfed;
if-eqz v1, :yydarlinker_caption_controls_ready
iget v1, v1, Lbfed;->e:I
invoke-static { v1 }, Lbfee;->a(I)Lbfee;
move-result-object v1
invoke-static { v1 }, Lapp/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2;->onPlayerControlsVisibility(Ljava/lang/Enum;)V
:yydarlinker_caption_controls_ready
```

与官方块的关键差别是**先从 owner 寄存器重载持有者**再读状态字段。官方块自身会把 `v1` 覆写成 enum，而两个 patch 的注入顺序在真实装配里不由本卡决定；重载让本卡在两种顺序下都成立，也让空持有者（YouTube 自己的读数此时会 NPE，其 `a(I)` 返回 null 时也按 UNKNOWN 处理）不会变成新的崩溃点。**交付 APK 内实测并存**（`.verification/n27/injected-constructor.txt`）：

```
[0] invoke-direct      Object.<init>
[1] iput-object        v1, v0, Lbfec;->c:Lbfed;
[2] iget               v1, v1, Lbfed;->e:I
[3] invoke-static      Lbfee;->a(I)Lbfee;
[4] move-result-object v1
[5] invoke-static      PlayerControlsVisibilityHookPatch;->setPlayerControlsVisibility(Enum)   <-- 官方 hook
[6] iget-object        v1, v0, Lbfec;->c:Lbfed;                                                <-- 本卡重载
[7] if-eqz             v1
[8] iget               v1, v1, Lbfed;->e:I
[9] invoke-static      Lbfee;->a(I)Lbfee;
[10] move-result-object v1
[11] invoke-static     DeepSeekCaptionHookV2;->onPlayerControlsVisibility(Enum)                <-- 本卡观察者
[12] return-void
```

`.verification/n27/tools/N27ControlsHookCheck.java` 用同一份 dexlib2（本地 patcher 包内）独立重放两种顺序并做保守的寄存器类型抽象解释：`ORDER_A_TYPE_SAFE=true` / `ORDER_B_TYPE_SAFE=true` / `TYPE_SAFE_SUMMARY=true`；把重载指令删掉的对照重放得到 `INFO_SELFTEST_NO_RELOAD_TYPE_SAFE=false`，即该检查确实能识别它排除的那种冲突，不是空转。`TYPE_SAFE_SUMMARY` 与“官方块 + 本卡块同处一个 `<init>`”的 DEX 事实一致，两个 hook 并存无 VerifyError 级冲突。

**触发与判定分离**。`onPlayerControlsVisibility(Enum)` 只是重新检查的**触发信号**；它把 enum 名归一为 `UNKNOWN/WILL_SHOW/SHOWN/WILL_HIDE/HIDDEN` 后投递到主线程，由协调器在**主线程/下一绘制帧**读真实控件几何，从不在构造器里改 YouTube 视图。跨 Activity/视频/播放模式的排队回调按 epoch 丢弃（`signalsApplied` 计数在 N27 测试里直接证明陈旧回调不落地）。绑定失败一律具名抛出：找不到唯一读数方法、状态字段不是 `I`、工厂签名不符、持有者存储不唯一、构造器可提前 return 或末尾不是 `return-void` 都会 `PatchException`，不猜混淆类名或字段语义、不静默回退。

## B：控件与坐标

资源 id **按名称**在运行时解析（`Resources.getIdentifier(name, "id", packageName)`），全卡无 `0x7f` 硬编码。规划者给出的 14 个名称已对交付 APK 的 `resources.arsc` 复核（`.verification/n27/tools/check_control_ids.py`、`res_ids.py`），真实编号一并留证：

| 名称 | 真实 id |
| --- | --- |
| `youtube_controls_bottom_ui_container` | `0x7f0b1841` |
| `player_seekbar` | `0x7f0b0ee1` |
| `timestamps_container` | `0x7f0b163e` |
| `time_bar_current_time` / `time_bar_total_time` / `time_bar_live_label` | `0x7f0b1614` / `0x7f0b161c` / `0x7f0b1618` |
| `time_bar_chapter_title_container` | `0x7f0b1612` |
| `bottom_end_container` | `0x7f0b0261` |
| `player_control_play_pause_button` / `_replay_button` | `0x7f0b0ebb` / `0x7f0b0ebc` |
| `player_control_previous_button` / `next_button` | `0x7f0b0ebe` / `0x7f0b0eb9` |
| `youtube_controls_overlay` / `inset_controls_overlay_wrapper`（**排除**） | `0x7f0b1844` / `0x7f0b09bb` |

交付 APK 自带布局也已解出（`.verification/n27/host-layouts/`）：`res/QYO.xml` 与 `res/Q1y.xml` 是 `youtube_controls_bottom_ui_container`（ConstraintLayout，`wrap_content` 高，含 `timestamps_container`（出厂 `visibility=invisible`）、`player_seekbar`（heatseeker）、`bottom_end_container`、`quick_actions_container`）；`res/zi9.xml`（`player_control_button_wrapper`）含 `player_control_play_pause_replay_button` 与 `previous/next` 各自的 `*_touch_area`；`res/zmf.xml` 证实 `youtube_controls_overlay` 与 `inset_controls_overlay_wrapper` 都是全屏容器——本卡因此只按名称取操作区域，绝不把这两个全屏矩形当障碍。

范围与排除：底部控制条、进度条、时间文本、章节标题、按钮行、以及它们真实可见的 `touch_area`/wrapper；Shorts、小窗/迷你、PiP 与透明整页父层即使在树上也不参与。绑定只在**当前 player 子树**内按确切 id `findViewById`（不做 Activity 全树扫描），弱引用缓存；重绑发生在既有低频路径（≈500ms）与可见性触发信号上，不新增无界定时器。矩形要求已附着、`isShown()`、祖先 alpha 连乘 ≥0.15、`getGlobalVisibleRect` 非空并已按真实裁剪，再与视频矩形求交。控件晚 inflate/重建/脱离树在下一次刷新或触发时重绑。

**折叠进度红线**有双保险：底部簇以 `youtube_controls_bottom_ui_container` 可见为前提，且合并后的簇高度小于 12dp 时判为进度线而非控件（`reason=thin_progress_line_only`）。字幕碰撞盒用**真实 TextView 的盒**（含背景与内边距），不使用 anchor 全宽透明条，N27 测试直接断言 `base.width() == text.getWidth() < anchor 宽`。

## C：避让算法与动画

算法（`CaptionControlsAvoidance.solve`）：以本帧基准盒为起点，对当前可见障碍求“刚好放到其上方 + 8dp”的最小上移量；抬起后若与更高障碍相交则继续，迭代次数以障碍数为界（不循环、不震荡）；结果必须完整落在视频矩形内，否则保留原位置、`offset_px=0` 并记一次 `no_safe_space`。**不缩字、不隐藏有效正文、不把字幕推出视频**。

实施参数（本卡参数，未宣称真机已测）：间隔 8dp；动画 200ms、`DecelerateInterpolator`；有效几何当拍即开始（≤100ms 内）；目标取整到像素，同一目标不重启，变化 <1px 不重启；目标变化从**当前视觉位置**重新定向。显示偏移用 anchor 的 `translationY`：基准布局与临时偏移彻底分离——`render()` 每次照旧重设 `LayoutParams`（基准），协调器只动 `translationY`，所以底层重 render 不会把动画归零，上移也不会漂移进基准。水平位置/宽度/字体/字号/正文/分页计划完全不变，未改 `LayoutBudget` 宽度，未触发翻译或重译（机器可查，见 §E 契约检查）。

生命周期：隐藏/空白/GONE、guard 抑制、Activity 销毁、换视频、播放器类型切换都取消动画并清偏移与几何；旋转或视频矩形变化先取消旧方向的目标再按新矩形与**原归属基准**重算。拖动沿用 N26 长按 350ms 阈值与保存行为：开始拖动只取消动画、保留当时视觉偏移（不突跳），拖动期间冻结该偏移，保存仍是“原基准 + 用户手势增量”，避让偏移从不写入配置；结束/取消后按最新基准与当前控件重算。空白/最终失败状态不创建空框，只有本来会显示的正文或既有等待占位参与避让。

## D：与现有渲染、拖动及生命周期整合

`CaptionOverlay`（实际 class `CaptionOverlay`）只在 attach/render/hideView/detach 与 drag 路径加了协调器通知：`onActivity`、`onPlayerType`、`onCaptionPlaced`、`onCaptionCleared`、`onDragStart/onDragEnd`、以及 WATCH 里既有的 100ms 低频块内调用 `tick()`。正文选择、`RebuildPageLayout`、`RebuildController`、API 调用逻辑一行未动；V2 门面 `DeepSeekCaptionHookV2` 新增 `public static void onPlayerControlsVisibility(Enum<?>)` 并在 `setMainActivity`/`onPlayerType`/`onVideoId` 转发清理信号。协调器除了平台视图/几何/动画、自有包与 `CaptionDiagnostics.mark` 外不引用任何其它类——由 §E 的 DEX 契约检查强制。

## E：诊断与离线验证

新增事件 `CAPTION_UI_AVOIDANCE_BOUND / TARGET / RESET / UNAVAILABLE`，字段 `epoch / player_type / controls_state / video_rect / caption_base_rect / obstacle_rects / offset_px / reason / trigger / obstacle_ids`，事件名、字段名与全部 reason 值**从第一行起就是英文**（`bound`、`bottom_cluster`、`no_intersection`、`no_safe_space`、`thin_progress_line_only`、`oversized_container_excluded`、`controls_not_visible`、`controls_not_bound`、`player_not_bound`、`player_not_regular`、`caption_hidden`、`detached`、`activity_changed`、`video_changed`、`player_type_changed`、`caption_placed`、`refresh`、`drag_finished`、`controls_<state>`）。按 `epoch|offset|reason`、`epoch|reason`、`epoch|绑定集合` 去重，稳定障碍只记一次；源文、译文与提供商证据不为诊断改写，密钥仍走既有脱敏。

**验证的是生产接入，不是一段没被调用的纯数学函数**：N27 测试全部经真实 `CaptionOverlay.showCaption/showEvent/hide/drag` 与真实协调器运行。`N27ControlsAvoidanceTest` 24 条（+1 套件）：

- 无碰撞/隐藏 UI 偏移 0；底部碰撞最小上移（断言 `offset == base.bottom + 8 - obstacle.top`）；多障碍有限迭代且停在首个 8dp 间隙；无安全空间回原位并只记一次。
- 同坐标与非零 host 偏移（player 下移 40px，障碍必须报 320..340 而不是 280..320）、祖先 alpha 0.05 排除、不可见/脱离 View 排除、全视频透明容器排除、折叠红线单独存在不抬高。
- 原基准、字体、文本、页身份、保存位置不变；避让只改 `translationY`。
- 显示→隐藏→显示、目标不变不重启、1px 级别变化不重启、中途重定向不跳变、动画在受控时钟下推进并在 200ms 内收敛、暂停/seek 不参与避让链路。
- 拖动视觉冻结、临时偏移不写入配置、隐藏后回新基准；换视频/旋转取消旧目标并重算；空白与失败态不建空框；陈旧 epoch 回调丢弃；晚 inflate 控件在低频路径被拾起。
- 诊断全英文、无重复、字段齐全；Shorts/迷你/PiP 明确不应用。

**帧图**由既有 Android 渲染路径（Robolectric NATIVE 图形 + 真实 overlay/控件视图树，非 HTML）导出 24 张：`{detail 360×640, fullscreen 640×360} × {小/标准/超大} × {before, showing, after, hidden}`，见 `.verification/n27/frames/`；`showing` 帧用交付资源里读出的底部条形状（全宽条 + 进度线 + 时间文本 + 中央按钮）绘制，断言该样例确实需要上移。

**DEX 契约检查**（`.verification/n27/avoidance-contract.txt`，`.verification/n27/tools/N27AvoidanceContractCheck.java`，作用于交付 MPE）：`CaptionControlsAvoidance` 56 方法 / 1475 条指令，只引用 `android/app|content/res|graphics|os|util|view|view/animation|widget`、`java/lang|lang/ref|util`、自有包，以及 `CaptionDiagnostics.mark` 与 `CaptionSurface.isShorts/player`；禁用面（API 客户端、翻译/分页/重建、缓存、质量追踪、诊断归档、目录字符串、`getSharedPreferences`/`edit()`、`LayoutBudget`/`RebuildPageLayout` 成员）**命中 0**，`N27_AVOIDANCE_CONTRACT_PASS`。

## 验证

- Java 全套离线单测 **464/464**（0 失败 / 0 错误 / 0 跳过，**59 套件**；N26 为 440/58）。新增 `N27ControlsAvoidanceTest` 24 条 + 1 套件。
- Python `unittest discover -s scoreboard` **27/27**；`tools/check_localization.py` 通过（**220 keys × 14 语种**）。
- `scoreboard/run.py`、`n9.py`、`n10.py`：**4 通过 / 4 既有失败 / 4 未验证**，`pending_translation`／`event_review`／`overflow` 不可见时长**全 0**；`ACCEPTANCE.md` 与 `scoreboard/results/frozen-baseline.json` Git 无差异。
- 组合 **84/84 PASS**（`COMPOSITION_PASS`），`structure.txt` 的 hooks 含 `onPlayerControlsVisibility=1`；`DEX_AUDIT_PASS classes=58034`（N26 为 58028）。
- `verify_bundle.py 1.3.5` PASS（74 条目 / 14 locales / root DEX / extension）；N27 独立产物审计 `build/n27-records/verify_artifacts.py`：MPP 74 条目唯一、CRC、根 DEX 与扩展 DEX 头/长度/SHA-1/Adler-32、内嵌扩展与交付 MPE 逐字节一致、14 份 locale XML 与源一致、N25 标记与 N26 导航键与十四语种 `preview_hint` 全部保留、12 个 N27 控件名在扩展内、`youtube_controls_overlay`/`inset_controls_overlay_wrapper` **不在**扩展内；APK 16604 条目、11 个根 DEX、无 `META-INF` 签名文件、三套设置 XML 仍是新 key 且无旧 key、`resources.arsc` 字符串池含十四语种新说明且不含旧说明、**官方 hook 与本卡观察者同处 `classes.dex`**。
- `aapt dump badging`：`app.morphe.android.youtube` 21.16.256 / 1561068412 / minSdk **28** / targetSdk 36；`apksigner verify` 返回 `DOES NOT VERIFY / Missing META-INF/MANIFEST.MF`，**确认未签名**（`build/n27-records/apk-badging.txt`、`apksigner.log`，ASCII 硬链接 `apk-metadata-input.apk` 与交付 APK 逐字节相同）。
- 39 个历史产物（`build/local-test` 全部旧包、`recovered/1.3.5` 两个 MPP、N18/N18r/N22/N23/N24/N25/N26 组合 APK）前后 SHA-256 与字节数**全部一致**：`HISTORY_HASH_PASS 39/39`。

**构建可复现性如实报告**：MPP/MPE/APK 的 ZIP 内 `META-INF/MANIFEST.MF` 带构建时间戳，因此同一源码两次构建整包哈希不同；两次构建的 `classes.dex` 与 `extensions/extension.mpe` **逐字节相同**，两次组合的 APK 之间 16604 个条目里只有 `classes2.dex`（patcher 品牌/元数据）不同。交付哈希因此是**本次构建实例**的哈希，不代表逐字节可复现。此外交付 APK 由**交付 MPP 本身**组合而成（先修好 `:patches:buildAndroid` 与 `:patches:jar` 交替覆盖同名 `patches-1.3.5.mpp` 的取值，再以交付文件重跑组合与 DEX 审计）。

**覆盖边界如实报告**：控件 id 名称与真实编号、宿主布局、注入指令与并存顺序都在离线侧有真实交付物证据，但 **YouTube 运行时是否真的把那些 View 挂到当前 player 上、以及 100ms/200ms/8dp 的真机观感，仍需用户真机确认**——离线用的是名称→id 注入 + 既有 `CaptionSurface` 几何接缝，合成播放器不能证明真实控件已绑定。Robolectric 的 `ValueAnimator` 会把整条时间线塌缩成一拍，因此动画改由主 Handler 按 `SystemClock` 逐帧驱动（生产同为主线程逐帧，200ms 减速不变），这样离线受控时钟下的推进/取消/重定向才是真的可验证；真机时延未测。未做真机截图、未执行真机验收。

## 交付

| 产物完整路径 | 字节数 | 比 N26 | SHA-256 |
| --- | ---: | ---: | --- |
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n27.mpp` | 1,117,781 | +13,961 | `BB197188AB16B1EC57EA8AEB0BA9E80D1ACA56C915381E47F7560B6C83FDEEDC` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n27.mpe` | 2,727,272 | +13,736 | `45F2C9B6694507113D79FE544A04208C24C6544AA2C51ECE3846778E01064489` |
| `E:\Projects\morphe-caption-v2\build\n27-composition-final\YouTube-21.16.256-本地测试包-n27-unsigned.apk` | 196,943,040 | +7,756 | `BF4C53EB8D8F8666A0DDBB190E474F34BD5D6980BE7E9302F9ADE456A4776103` |

MPE 与交付 MPP 内嵌扩展逐字节一致。MPP 增量来自新指纹/绑定/注入与新增 `CaptionControlsAvoidancePatchKt` 类；MPE 增量来自协调器与 4 个英文事件名；APK 增量来自扩展 DEX 与 patcher 元数据。工具链沿用 N26：YouTube **21.16.256** ＋ 官方 **1.44.0** ＋ Patcher **1.14.1**，嵌套 JDK 21（`E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1`）、`C:\Users\14776\AppData\Local\Android\Sdk`、离线 Gradle 9.6.1，全程 `--offline`；未安装新 SDK、未加依赖。

本卡为**一个实现提交** `62c4916`（源码、测试、交付记录与状态档案），锚点标签 `anchor/n27-62c4916` 指向该提交，即含全部源码与最终文案的点。其后若另有把本记录里的占位短哈希写实的状态补记提交，它不含任何源码或文案改动，源锚点与 HEAD 的关系以 `git log --oneline anchor/n27-62c4916..HEAD` 为准。N26 及其前的提交未被 amend。开工 HEAD `7f9c639`；提交后工作区除被忽略的 `build/`（本地产物与记录）与 `.verification/n27/`（离线证据）外无未跟踪源码改动。

**§2 三项延期问题继续未关闭**：AI 入口 summary 仍是“修改后自动保存”；十四语种运行时适配仍不完整；程序性诊断正文仍出现中文。按用户要求，全部功能完成后仍须执行最终全面检查修复阶段，本卡不提前修改、不宣称十四语种已全部适配。

**真机仍待用户验证**：普通详情页与横屏全屏下 UI 出现且遮挡时字幕自然上移、不遮挡时不动；UI 隐藏后回原位置；暂停不因本功能翻页；拖动/旋转/seek/换视频无跳跃或残留；Shorts 原样。本卡不做真机、不签名、不发布、不推送；下一阶段仍为语言档案/计数/方向及接入，本卡不执行、不自派。
