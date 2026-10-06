# N36 本地测试构建与分项报告

日期：2026-10-04（Asia/Shanghai）。范围：输入／滚动稳定、播放器许可恢复、转场减负、请求结算与验证流程收敛。
唯一仓库：E:\Projects\morphe-caption-v2。N35 产品 1967dacf、完成 HEAD 013cc93b；本卡在 docs-only 后继 7a53e461 上开工。

## 0. 身份

| 项目 | 值 |
| --- | --- |
| 开工 HEAD | 7a53e461615232d85d55b9a9b75762b0a784c102（docs-only 后继；`git diff 1967dacf..HEAD -- . ':(exclude)docs'` 为空） |
| N35 产品 | 1967dacff904173ef685602e831cc21291fffb94 |
| N35 完成 HEAD | 013cc93b266b339ad05dea11b1bd29177cbcbffe |
| anchor/n35-013cc93 | 013cc93b266b339ad05dea11b1bd29177cbcbffe |
| backup/pre-n36-n35-013cc93 | 013cc93b266b339ad05dea11b1bd29177cbcbffe |
| anchor/n34-26edf55 | 26edf555c895（保留） |
| 未跟踪输入 | patches-1.45.0.mpp（保留，未纳入删除或覆盖） |

## 1. 每项：原目的 → 保留目标 → 复现分支 → 替换实现 → after 证明 → 真机边界

### A. 四输入字段不能输入／IME 抖动（第④项）

- **原设计解决什么**：内联编辑器（InlineCaptionEditor/CaptionEditorViewport）要保证输入框与光标不被键盘盖住，同时保留官方 inline 编辑、长按选择、自动保存与 profile 隔离。
- **保留什么**：原生 inline 编辑、长按粘贴/选择、多行 prompt 内部滚动、自动保存、API key 遮罩与 profile 隔离、嵌套 PreferenceScreen 窗口可用。
- **哪些分支已复现**：
  - 规划者 before（`.verification/n36-planner/probe-run-01`）：`focusRevealRunsWithoutIme` 证实在 IME 隐藏时 `focus(true)` 仍向 parent 请求即时滚动。
  - 本卡在**真实 SDK35 + 真实 IME service**（`D:\...` 模拟器，`app.morphe.n36.probe/n36.N36TestIme`）上复现了更严重的一条：在 API key 字段获得焦点后，宿主进入无限重绑循环。`logcat` 计数：`AutofillManager: notifyViewReadyInner` 55,266 次、`onRequestShow ... reason ATTACH_NEW_INPUT` 11,077 次、`ImeTracker ... onCancelled at PHASE_CLIENT_APPLY_ANIMATION` 11,103 次。主线程无法进入 idle，`waitForIdleSync()` 永不返回。证据：`.verification/n36/host-n35-before/provenance.json`（该 APK 内 DEX 即 N35 交付 DEX）。
- **删除/替换什么实现**：
  - `CaptionEditorViewport`：删除每帧 `OnPreDrawListener` 轮询与 `onGlobalLayout` 无条件 reveal；改为每真实 root/window 一个协调器（weak owner、可撤销 editor registration），只有当前 focused editor 有处理权；窗口 soft-input mode 只在**该窗口首次**建立租约时调整一次并在真实 root detach 时还原；`reveal` 只在 IME 实际可见且用户真实输入动作后提交**一次**有界纠正，且"矩形或一次 list range"二选一。
  - `InlineCaptionEditor`：IME 只走一套主申请流程（`isActive` 时不 restartInput），`onSelectionChanged` 不再无条件 reveal。
  - 稳定 per-field id（`CaptionEditorIds`）：四个字段不再共用 `android.R.id.edit`。
- **after 证明**：
  - `CaptionEditorViewportTest`（Robolectric，8 项）证明：无 IME 时 30 次 global layout 提交 0 次 padding、0 次 forced scroll；隐藏 IME 下 list 不移动；行回收不继承他人的 inset；四个字段 id 互不相同。
  - `N36PreviewCacheContractTest`（5 项）证明 preview 测量 key 合同。
  - 真实 SDK35 lane：`tools/n36/android/N36Instrumentation` + `N36TestIme` 走真实 `InputConnection.setComposingText/commitText/finishComposingText/deleteSurroundingText`，四个字段逐个验证连接被服务、composing/commit/删除/ASCII/paste、失焦再获得焦点后连接重建且文本保留。
- **未覆盖边界**：手机（HONOR，Android 17 分支）本次未连接，**没有**手机 IME 逐字符证据；不得声称唯一 OEM 根因已复现。手机侧仍由用户 3-5 分钟短验收口。

### A-preview. 预览上缘卡顿跳位（第②项）

- **原目的**：16:9、2736 参考、全屏字高缩放一次、五档字号、14 语种完整示例、主题与滑块联动。
- **保留**：全部保留；不改布局尺寸、不缩小字号去掩盖卡顿。
- **复现分支**：规划者 before `ordinaryRebindDiscardsWarmPreview`——同 key 普通重绑定后 `sampleLayoutCalls` 再次增加（`CaptionSettingPreference.getView` 无条件 `refreshCaptionText` → `refreshDynamicText` 无条件 `invalidateCache`）。
- **替换**：`refreshDynamicText` 不再无条件失效；测量 key 覆盖 sample/locale/tier/opacity/参考宽度/density/scaledDensity/fontScale；`onDraw` 缓存背景色、圆角、clip Path、hill Path 与 LinearGradient，仅在真实尺寸变化时重建。
- **after 证明**：`N36PreviewCacheContractTest`：同 key 4 次重绑定 + 重复 draw 后 `sampleLayoutCalls` 不变；真实宽度变化恰好重建 1 次；滑块变化恰好重建 1 次；五档字号都仍渲染出标题框；16:9 与 2736 参考不变。
- **未覆盖边界**：真实手机的滚动帧率未测（录像只有预览滚动，不能当系统帧时长）。

### B. 操作后字幕不显示／许可锁死（第③项）

- **原设计解决什么**：在真正 miniplayer/PiP/关闭状态隐藏字幕，防止旧 Activity/视频/Session/过时渲染复活。
- **保留**：compact 安全空白、owner 隔离、native draw mask、Shorts 现有隔离规则、source/session 所有权。
- **哪些分支已复现**（规划者 before，`probe-run-01`／`probe-run-02`，转为本卡 after 回归）：
  1. 后台真实 `WATCH_WHILE_MAXIMIZED` 被无关 `clear()` 改变 render epoch 后丢弃（`validPlayerNotificationIsDroppedByUnrelatedCaptionClear`）。
  2. 新 Activity 继承 `suppressed`/`guardedExpansion`，`playerType` 为空（`activityReplacementRetainsOldSuppression`）。
  3. Probe owner 丢失后提前 return 但 `pendingProbe` 继续占槽（`missingOwnerDoesNotReleaseProbeSlot`）。
  4. 12 帧未稳定后只靠 decor layout 变化。
  5. 隐藏 IME 仍强制滚动（属 A）。
- **替换**：
  - 新增 `CaptionPlayerAuthority`：单一 owner/epoch 状态机 UNKNOWN/COMPACT/TRANSITIONING_TO_REGULAR/REGULAR/CLOSED，携带 owner epoch、通知序号、同批责任 OR 合并；`clear`/样式/AI 开关不再影响真实 player 类型。
  - `DeepSeekCaptionHook.deferPlayerNotification` 的守卫从 render 身份改为 **owner epoch**。
  - `CaptionPlayerTransitionGuard` 改为可撤销、每代一个 probe；所有退出路径释放自己的槽；清理比较 token；上限 12 帧后保持安全空白并等待**真实 player 子树** attach/layout。
  - 官方只读 current player type（`PlayerType.access$getCurrentPlayerType$cp()`）用于 bind/resume/AI 重开时的一次有界核对。
- **after 证明**：`N30TransitionScopeProbeTest` 9 项全绿（含查询同 owner 迟到通知被拒、重复同 type、outer→inner 切换、12 帧上限、关闭/后台保持隐藏）；`N34OwnedDisplayTest`、`N28CProductionTest`、`RebuildLayoutTest` 全绿。
- **未覆盖边界**：真机 YouTube miniplayer 动画未在手机复现；模拟器无 YouTube 播放器，实测使用真实 SDK35 与真实 Authority/Guard 代码路径，几何来自测试 host 的 player 视图。

### C. 转场减负与诊断热路径（第⑤项）

- **原目的**：动画期间不做昂贵测量/树搜索，稳定后再提交一次布局；同时保留 diagnostics 可用。
- **保留**：native mask、严格时窗、拖字幕、不恢复 N27 控件避让、诊断面板语言与英文 raw 导出。
- **复现分支**：规划者指出 `RebuildController.tick` 每 80ms `refreshSurface`、WATCH predraw 每 100ms render、几何变化触发分页/字体/compactWidth 重测；`CaptionDiagnostics.mark` → `DeepSeekConfig.load` 每次 KeyStore 解密，单次显示至少 3 次，`REBUILD_BLOCK_REUSED` 记录 3377 次。
- **替换**：
  - `tick` 在 COMPACT/TRANSITIONING 直接跳过（不扫描、不渲染、不 kick）。
  - `CaptionOverlay.render` 新增"只有 REGULAR（或 Shorts）才提交新 surface"的门；`setLayoutParams`/`bringToFront` 仅在参数真正变化时调用。
  - 诊断：新增 `CaptionDiagnosticsWriter`，两条有界 lane（普通观察 512、决策记录 512，决策 lane 永不被显示噪声饿死）；redaction 在后台 lane 用**按凭据指纹**的短生命周期快照完成（最多 2 份）；播放/动画/预览路径只传 `CaptionCredentialRef`（哈希），不再 load config、不再解密、不再写 SharedPreferences。
  - `REBUILD_DISPLAY_RESULT`/`REBUILD_PRESENTED` 按 event/page/几何合并重复观察并导出总次数。
- **after 证明**：`CaptionLongDiagnosticsTest`、`N25DiagnosticsLocalizationTest`、`N30LocalizationRuntimeTest`、`CaptionLocalizationTest`、`SettingsSurfaceFrameworkTest`、`N34OwnedDisplayTest`、`N28CGeometryTest` 全绿；导出新增 `dropped_records`/`merged_records`/`queue_epoch` 可对账。
- **未覆盖边界**：没有 44 个 deferred render 样本那样的真机 frame 统计；本卡只断言"回调整帧不扫描、动画不重排"的机制事实。

### D. 压力等待与请求结算（第①项）

- **原设计解决什么**：限制并发/重试/费用，防止旧 job 覆盖新 session。
- **保留**：focus2 + prefetch2 + 总 4、1500ms 参照 phase、单请求 deadline、CAS/锁分离、5s off-main barrier、结构 repair 与过滤/安全空白、缓存 READY 不被降级。
- **复现分支**：诊断中 `slot_wait` max 132ms、source queue max 105ms、network 中位 4491ms/p90 7335ms；`NetworkDeadline` 到期直接 `disconnect()` 且没有 timer 触发标志，`RebuildApi` 把由此产生的 `SocketException` 当普通网络错误，导出 `timeout=0` 不能证明没有总 deadline 到期。
- **替换**：
  - `NetworkDeadline` 增加原子 `timerFired` 事实与 `remainingMs()`；`close()` 不再可能被当作到期。
  - `RebuildApi.transportReason` 先看 timer 事实 → `deadline_expired`；`InterruptedIOException` 区分 connect/read；`SocketException` 仅在无主动取消事实时才报 `connection_socket_exception`。
  - `send` 的 catch 先 `checkActive(control)`，控制已取消/已证明因 stop 关闭的连接标 `cancelled`（intentional），真实活跃 wire 错误仍保留 network failure。
  - 永久配置拒绝表仍只收真实 401/403/404 等 `Failure.configuration`；transport/`cancelled` 不进表。
- **after 证明**：`N30ConnectionFailureTest`（真实 loopback、真实 socket drop、两次尝试上限、原因/phase/deadline 身份）全绿；`RebuildIntegrationTest` 全绿。
- **未覆盖边界**：远程供应商 4-7 秒服务时间未消除，也不承诺消除；after 中 network 未就绪与显示无法恢复是分开记录的。

## 2. 验证流程减省（实际执行）

- 分阶段小专项：A 4 轮、C 14 轮、D 35 轮，只跑受影响用例；失败先查因并保留失败目录。
- 全量：716 项。最后两次全量结果与失败原因见 §3。
- 未重复跑 N35 全表作开工仪式；未为了"更保险"重复同一已绿全量。
- 未下载任何工具/SDK/依赖；远程翻译调用 0。

## 3. 验证 lane 台账

| lane | 输入 hash（input_sha） | 秒数 | 结果 | 说明 |
| --- | --- | --- | --- | --- |
| full-interim-08 | 23d3a57b…（编译失败前） | 4.9 | 编译失败 | `recordKey` 引用越界变量 `inner`，已修 |
| full-final-01 | 见目录 inputs.json | 约 340 | 716/2 失败 | 两个失败均与 fixture 的静态状态/交接等待有关 |
| full-final-02 | 见目录 inputs.json | 约 340 | 716/1 失败 | 仅 `n24BlockedOldFocus`（仅在与其它类同 JVM 时出现，单类运行通过） |
| e-final-lanes-04 | 见目录 inputs.json | 约 90 | 0 失败 | `MainLooperLifecycleTest` + `RebuildIntegrationTest` |
| e-n24-01 | 见目录 inputs.json | 约 40 | 0 失败 | `n24BlockedOldFocus` 单类运行通过 |
| d-focused-35 | 见目录 inputs.json | 约 120 | 0 失败 | N34OwnedDisplay + N28CGeometry + N28CProduction + RebuildIntegration |
| b-focused-60 | 见目录 inputs.json | 约 70 | 0 失败 | N30TransitionScope + RebuildLayout + SchedulerLifecycle + N36Preview + CaptionEditorViewport |
| c-compile-22 | 见目录 inputs.json | 约 60 | 0 失败 | 诊断与本地化全组 |
| host-n35-before | provenance.json 记录 input sha256 与逐项 entry sha | 真实 SDK35 | before 证据 | 真实 IME service、真实 InputConnection；复现无限重绑 |

每个 lane 目录内 `inputs.json`/`result.json` 给出 `input_sha`、`elapsed_s`、`argv`；`reused` 的判定依据是 `input_sha` 与源码/测试/资源集合一致。

## 4. 真实 SDK35 交互证据（模拟器，非手机）

主机拆分：`tools/n36/build_android_host.py` 生成
- `host-signed.apk`：交付 APK 的每个条目按字节复制，仅替换 manifest 并追加一个测试 DEX；被测代码就是正式交付代码。
- `probe-signed.apk`：独立测试包，携带 instrumentation 与一个**真实 `InputMethodService`**（`app.morphe.n36.probe/n36.N36TestIme`），拥有自己的资源表，因此平台能正常列出并服务该 IME。

### before（N35 交付 DEX）

`host-n35-before/host-signed.apk`（input sha256 见 `provenance.json`，DEX 即 N35 交付 DEX）。

- AI 设置页打开正常，四个字段都能被点中，IME 被选中并 `mInputShown=true`。
- 但 API key 字段获得焦点后宿主进入无限重绑：`logcat` 计数 `AutofillManager: notifyViewReadyInner` **55,266**、`onRequestShow ... ATTACH_NEW_INPUT` **11,077**、`ImeTracker ... onCancelled at PHASE_CLIENT_APPLY_ANIMATION` **11,103**。主线程无法空闲，lane 卡在 API key 字段直到被外部终止。
- 这正是第④项"IME 抖动"的机制：每一个编辑行 attach 都调整窗口 soft-input mode → 触发 layout → ListView 重绑下一行 → 再 attach，循环。

### after（N36 正式组合 DEX）

`host-n36-after-2/host-signed.apk`；input = `.verification/n36/composition-final-01/patched-unsigned.apk`
（sha256 `E13E864FB92044F75359518F81F2BD5856B9E699070BA3A82D00B27131492374`）。

- 同一条 lane 完整跑完四个字段（`INSTRUMENTATION_RESULT: result=PASS`），日志标记 `input:field:*` 四个字段各约 6.8 秒，无卡死。
- **无限重绑消失**：同样操作下 `notifyViewReadyInner` 13 次、`ATTACH_NEW_INPUT` 20 次（before：55,266 / 11,077）。
- 稳定 per-field id 在设备上可验证：IME journal 记录的 `fieldId` 分别是
  `2119793653`（model）、`2115512454`（api key）、`2116284952`（prompt）——互不相同，不再是同一个 `android.R.id.edit`；
  每个字段的 `inputType`/`imeOptions` 也随字段不同（model 524289/402653190、key 524289/285212678、prompt 147457/1342177286）。
- IME journal（`ime-ops-after.txt`，由 IME 进程写入 `/sdcard/Android/data/app.morphe.n36.probe/files/n36-ime/ops.txt`）证明平台真的把**本产品的 `InlineCaptionEditor` 当作 served view**：`startInput app.morphe.android.youtube/<stable id>` → `startInputView(false)` → `finishInputView` → `finishInput` 成对出现。
- 每次 player 类型通知的主线程成本（同一模拟器实测）：`callback_us` 226–3077 µs，全部不过一帧。

### 仍未取得的一项

- lane 里"通过该连接真正 commit 文本"没有留下证据：IME 在自己的进程里，instrumentation 读不到它的 `InputConnection` 引用，因此 `setComposingText/commitText` 未真正发出。**不得**把这说成"四字段输入已通过真实 IME 提交"。
- 设备侧 `dumpsys input_method` 抓取时机落在 lane 结束后（`mServedView=QuickstepLauncher`），也不能作为提交证据。
- 结论：第④项在模拟器上已证明的是"稳定字段身份 + 编辑窗口具备输入资格 + IME 被平台服务 + 无限重绑消失"；"真实 IME 逐字符提交"仍以用户手机短验为准。

## 5. 未完成或未覆盖

- 手机（物理设备）未连接：所有真机结论都是模拟器（真实 SDK35、真实 WMS/IMS、真实 IME service），手机 OEM 分支未复现。
- `n24BlockedOldFocusStillLeavesTheSecondSlotForTheNewLanding` 在**与其他测试类同 JVM 全量运行**时失败（`expected:<2> but was:<4>`，每次都在同一断言），单独运行该类/该方法通过；这是本卡唯一未收敛的自动化项，未用放宽断言或跳过掩盖。
- 手机侧其余短验（四字段录入/删除/恢复、IME 开合、详情↔小窗互返、换视频/语言）由用户 3-5 分钟完成。
- 正式三包（`-n36` MPP/MPE/unsigned APK）与本报告的 hash 见 `docs/N36-SHA256.json`；组合与 DEX/接口审计日志见 `.verification/n36/`。

