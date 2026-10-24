# N67 · 执行方案与执行对话提示词

- 依据：`docs/N66-CAPTION-SYNC-AND-SESSION-INTENT-20261023.md`（根因与目标机制）
- 本文用途：把 N66 的设计切成可独立验收的施工阶段，并给出可直接粘贴给执行会话的提示词
- 角色：本对话是**指导对话**（持有验收权）；执行会话每次只领一张任务卡

---

## 1. 指导对话的工作方式

### 1.1 每轮只允许一个阶段

执行会话一次只能提交一个 Phase。跨阶段混提交一律打回，不评审内容。
理由：每个 Phase 都有自己的指标门，混在一起时指标读数无法归因。

### 1.2 四道门

| 门 | 检查内容 | 不通过的处理 |
|---|---|---|
| 契约门 | 是否触碰 §1.4 红线 | 直接打回，不看后续 |
| 证据门 | 每条结论是否有 `path:line` + 命令输出 | 退回补证据 |
| 指标门 | 本 Phase 的验收指标是否达标 | 退回重做，不接受"预期会好" |
| 回归门 | 全量测试 + 构建是否通过 | 退回修复 |

### 1.3 指导对话的偏差检测清单（每轮逐条问）

1. 有没有在 `OnPreDraw` / `onDraw` / `dispatchDraw` 里做布局（`measure` / `setLayoutParams` / `requestLayout` / `setText`）？
2. 有没有新增"等一会儿"的时间常数？（grep `_MS`、`postDelayed`、`SystemClock.uptimeMillis()` 差值）
3. 有没有把连续量又变成档位？（presentation 包里出现 `enum` / `Kind` / `switch` 就是信号）
4. 旧机制是"删掉"还是"并存"？并存是否写了下一切除计划？
5. 测试是**新增契约测试**，还是**改老测试让它过**？
6. 有没有把"观测"当"命令"、把"投影"当"权威"？（AI 侧专用）

任一条为"是"且未在任务卡允许范围内 → 打回。

### 1.4 全局红线（任何阶段都禁止）

- **禁止**在 draw / pre-draw / dispatchDraw 里调用 `measure`、`setLayoutParams`、`requestLayout`、`setText`、`setTextSize`。
- **禁止**新增任何以"等了 N 毫秒"为依据决定视觉参数的逻辑（`CLASS_SETTLE_MS`、`LAYOUT_HOLD_MS`、`SETTLE_MS` 这一类）。
- **禁止**为新机制保留旧的 class/enum 档位当 fallback。要么换掉，要么不做。
- **禁止**修改 `translation-core`、`patches`、`caption-contracts` 的语义。
- **禁止**为了过新实现而修改既有测试断言；被删除机制对应的测试必须**同阶段替换**并说明替换理由。
- **禁止**引入新依赖。
- **禁止**改用户可见的设置项/文案（本方案不需要任何新设置）。
- **禁止**产出 release 产物、改 `patches-list.json` / `releases`。
- **禁止**在 Phase 6 之前更新 `docs/PROJECT-STATE.md` 及其镜像。

### 1.5 证据标准

执行会话每次交付必须包含：

```
## 变更清单
- <path>:<line-range> — 改了什么，为什么

## 命令与输出
- 命令：<完整命令>
- 结果：<关键片段的原文，不要转述>

## 指标读数
- <指标名> = <值>（采集位置：<path:line> / 日志片段）

## 未做 / 做不了
- <明确列出，不允许沉默>
```

缺任一项视为未完成。

---

## 2. 通用规约（执行会话开场必贴）

见 §4 的 `P0 通用规约`。

---

## 3. 阶段计划

### 阶段总览

| Phase | 目标 | 依赖 | 可并行 | 交付物 |
|---|---|---|---|---|
| 0 | 基线冻结 + 影子指标 | — | — | 指标可采集，行为零变化 |
| 1 | 计划层（纯函数 + 后台 StaticLayout） | 0 | 与 4、5 并行 | `CaptionPlanFactory` + 测试 |
| 2 | 呈现层 `CaptionLayer`（draw-only，默认关闭） | 1 | — | 图层 + 开关 |
| 3 | 默认切换 + 删除旧状态机 + 静态契约检查 | 2 | — | 旧代码归零 + CI 守卫 |
| 4 | AI 会话意图统一 | 0 | 与 1、2、3 并行 | 意图 + reconciler + 测试 |
| 5 | 启动并行化 + 回环非阻塞 | 4 | — | 首帧指标 |
| 6 | 收尾（回归、文档、状态双写） | 3、5 | — | 验收报告 |

**推荐执行序（严格串行）**：`0 → 1 → 2 → 3 → 4 → 5 → 6`

**唯一允许的重叠窗口**：Phase 2 通过后、Phase 3 开始前，有一段真机浸泡期（2–3 天）。这段等待期可以启动 Phase 4（文件集与呈现链基本不重叠）。除此之外一律串行。

**禁止的重叠**：Phase 3 与 Phase 4 不得同时进行；两条链不得在同一时段修改 `CaptionOverlayV2.java`。

**理由**：
- Phase 2 之后是一个"安全高原"——新渲染器在开关后面，旧路径完好，可以长期浸泡而不影响发布。
- Phase 3 是删除型改动，风险最高，必须等 Phase 2 的真机证据齐全再做。
- 会话链（4/5）与呈现链的文件集几乎不重叠，放在浸泡期并行，既不抢评审注意力，也不增加合并冲突。

---

### Phase 0 · 基线冻结与影子指标

**目标**：不改行为，先把"看得见"建起来。

**允许变更**
- `infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/CaptionDiagnostics.java`（新增事件名不改语义）
- `ui/src/main/java/app/yydarlinker/deepseekcaptions/CaptionOverlayV2.java`（仅在 `displayResult` / `render` 末尾加只读埋点）

**实现要点**
1. 新增事件 `PRESENTATION_SYNC`，字段：
   `video_rect`、`local_rect`、`scale`、`screen_short`、`size_px`、`frames_since_geometry_change`。
   - **输出时机**：只在"一次真实的 `size_px` 变化"时输出，**不是每帧输出**。否则诊断队列会被淹没，埋点本身变成新的卡顿源。
   - 仅 `textDebug` 开启时输出。
   - 必须带 `mergeKey`（如 `"SYNC|"+identity+"|"+sizePx`），命中 `CaptionDiagnostics.mark(...mergeKey)` 的去重路径。
   - **不要**把它加入 `CaptionDiagnostics.isDecision()`（那是保留优先级，不是高频观测）。
   - 帧号用 `Choreographer` 自增计数器；若拿不到帧时钟，退化为毫秒并同时输出 `unit=ms`。
2. 新增计数器 `OVERLAY_LAYOUT_IN_TRANSITION`：统计叠加层子树在一个"玩家类型通知窗口"内触发的 `requestLayout` 次数。
   - 窗口定义：从上一次 `CaptionPlayerAuthority` 通知到下一次通知。**不使用任何时间常量。**
   - 在下一次通知到来时关闭窗口；`count > 0` 才输出，字段 `from_type`、`to_type`、`count`。
   - 计数点：把字幕 anchor 的 `FrameLayout` 换成子类，覆写 `requestLayout()` 自增；**不得改变其 tag、层级、LayoutParams 或触摸处理**。只计本子树，不拦父级。
   - `detach()` 时清零并重置窗口，避免把"首次 attach 的正常布局"算进去。
3. 新增 `FIRST_AI_PIXEL`：`video id → 首个非"翻译中…"的译页上屏` 的毫秒数。
4. 新增 `INTENT_APPLY`：占位，Phase 4 填内容。

**禁止**
- 不改任何视觉参数、不改任何时序。
- 不改 `applyCommentScale` / `updatePresentationClass`。

**验证命令**
```powershell
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest
```

**证据**
- 新旧诊断日志各一段（同一视频，进入/退出/开评论），证明只多了事件、旧字段不变。
- `BuildConfig.CAPTION_BUILD_ID` 未变。

**完成判据**
- 全量单测通过。
- 真实设备日志里能 grep 到 4 个新事件。
- **基线可复现**：同一台设备、同一视频、横屏全屏开/关评论各 3 次，`frames_since_geometry_change` 三次读数偏差 ≤ 2 帧。
- 记录基线数值（预期在 10 帧以上，因为现状有 248 ms 的提交后等待）。**本阶段不要求数值好看，只要求可复现。**

**回滚**：删掉 4 个埋点即可，无状态。

---

### Phase 1 · 计划层：纯函数 + 后台 StaticLayout

**目标**：把"文本 → 页 → 局部坐标下的 `StaticLayout`"变成一个**与动画无关的纯函数**，在后台线程完成。

**新增文件**（`presentation/src/main/java/app/yydarlinker/deepseekcaptions/`）
- `CaptionPlanGeometry.java`：`{ int localInnerWidth; float glyphLocalPx; int paddingPx; }`
- `CaptionPlan.java`：`{ String key; List<Page> pages; float glyphLocalPx; int boxWidth; int boxHeight; }`，`Page = { String text; long start, end; float line1Px, line2Px; StaticLayout layout; }`
- `CaptionPlanFactory.java`：`static CaptionPlan build(String text, long start, long end, CaptionPlanGeometry g, CaptionRenderSpec spec)`
- `CaptionSizeLaw.java`：见下

**`CaptionSizeLaw`（取代 `CaptionPresentationClass.glyphHeightPx` 的调用面）**

```java
/** 屏幕字号：只依赖"视频在屏幕上的短边"，端点与现有设计一致，中间连续。 */
static float glyphPx(float videoShortOnScreen, float screenShort, int tier, boolean shorts) {
    float k  = screenShort / 1264f;
    float gF = CaptionFontSize.fullGlyphHeightPx(tier) * k;    // 1264 短边 → 55.5
    float gD = CaptionFontSize.detailGlyphHeightPx(tier) * k;  // 1264 短边 → 44.5
    if (shorts) return gD;
    float r = clamp(videoShortOnScreen / Math.max(1f, screenShort), 0f, 1f);
    float t = clamp((1f - r) / (1f - 9f / 16f), 0f, 1f);
    return gF + (gD - gF) * t;
}
```

性质（必须写成测试）：
- `r = 1` → 55.5；`r = 9/16` → 44.5；`r` 单调 → `glyph` 单调。
- 与屏幕方向无关（横竖屏同一公式）。
- `screenShort = 1264` 时端点精确等于现值。

**实现要点**
1. `StaticLayout.Builder.obtain(...).setAlignment(ALIGN_CENTER).setIncludePad(false).setMaxLines(2).setBreakStrategy(BREAK_STRATEGY_BALANCED).setHyphenationFrequency(NONE).build()`。
2. `boxWidth = ceil(max(lineWidth)) + padding`，`boxHeight = layout.getHeight()`。
3. 纯函数：不读 `Activity`、不读 SharedPreferences、不读时钟。`spec` 与 `geometry` 全量入参。
4. 线程安全：可以在后台线程 build（`StaticLayout.Builder` 允许）。
5. 复用现有 `CaptionPageExecutor` 的缓存（LRU 64）与 `CaptionPageLayout` 的页切分逻辑；`planKey = text|start|end|localInnerWidth|glyphLocalPx|specKey`。

**禁止**
- 不在这个 Phase 改 `CaptionOverlayV2` 的渲染路径（只允许删掉 `applyVisibleText` 里与新实现重复的测量，但**必须单独提交并说明**）。
- 不让 `CaptionPlanFactory` 依赖 `CaptionPresentationClass`（该类在 Phase 3 删除）。

**测试**（`extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/`）
- `CaptionSizeLawTest`：端点、单调、横竖屏一致、tier 缩放。
- `CaptionPlanFactoryTest`：
  - 2067px / 55.5px 下与现有 `CaptionPageLayout` 的页切分逐页一致（用同一段真实字幕）。
  - 1163px / 44.5px 下页数与行数符合预期。
  - 同一输入两次 build 产出相同 `key` 与相同行宽。
  - 在后台线程 build 不抛异常。

**验证命令**
```powershell
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest --tests "app.yydarlinker.deepseekcaptions.CaptionSizeLawTest" --tests "app.yydarlinker.deepseekcaptions.CaptionPlanFactoryTest"
```

**完成判据**
- 两个测试类全绿。
- `CaptionPlanFactory` 无 `android.app.Activity` 引用。
- 现有行为零变化（旧路径未被调用）。

**回滚**：删除新增 4 个文件与 2 个测试，无其他改动。

---

### Phase 2 · 呈现层：`CaptionLayer`（draw-only，默认关闭）

**目标**：让字幕的**位置与缩放**完全由"视频平面的当前帧矩阵"决定，且不产生任何 layout。

**新增文件**（`ui/src/main/java/app/yydarlinker/deepseekcaptions/`）
- `CaptionViewport.java`：一帧一次读数
  ```java
  final class CaptionViewport {
      final Rect   localVideo;    // 相对图层坐标系的视频矩形（未变换，来自 surface.getWidth/Height）
      final Matrix surfaceToGlobal; // surface.transformMatrixToGlobal
      final Matrix layerToGlobal;   // layer.transformMatrixToGlobal
      final float  scale;         // 由 surfaceToGlobal 的行列式开方得到
      final float  screenShort;   // min(displayMetrics)
      float videoShortOnScreen() { return Math.min(localVideo.width(), localVideo.height()) * scale; }
  }
  ```
- `CaptionLayer.java`：`extends View`，`setWillNotDraw(false)`，`match_parent`。

**`onDraw` 唯一算法**

```java
protected void onDraw(Canvas canvas) {
    CaptionPlan plan = this.plan;               // 只读引用，不构建
    if (plan == null) return;
    CaptionViewport v = viewport;               // 由 onSizeChanged / 每帧 postFrameCallback 更新
    float g = CaptionSizeLaw.glyphPx(v.videoShortOnScreen(), v.screenShort, tier, shorts);
    float k = g / (plan.glyphLocalPx * v.scale);

    Matrix m = new Matrix(v.layerToGlobal);
    if (!m.invert(m)) return;
    m.preConcat(v.surfaceToGlobal);             // m = layerToGlobal⁻¹ ∘ surfaceToGlobal

    canvas.save();
    canvas.concat(m);                           // 进入视频局部坐标系（含 YouTube 本帧变换）
    canvas.scale(k, k, plan.boxWidth / 2f, plan.boxHeight / 2f);
    drawBox(canvas, plan);
    canvas.translate(plan.left, plan.top);
    plan.page(now).layout.draw(canvas);
    canvas.restore();
}
```

**关键点（务必写进代码注释）**
- `m = layerToGlobal⁻¹ ∘ surfaceToGlobal` 对所有挂载位置都成立，**不依赖"字幕是否在被打描的子树里"**——这直接消除 N66 §2.4 的坐标系二义性。
- `v.scale` 用 `surfaceToGlobal` 的行列式：`sqrt(|ax*dy - ay*dx|)`，退化时用 `ax`。**不要**用 `getGlobalVisibleRect`（它会被窗口裁剪，评论面板升起时会把高度截掉，正是现有 `progress` 失真的来源）。
- `v.videoShortOnScreen()` 用**未裁剪**的局部短边 × `scale`。
- 只允许 `invalidate()`；禁止 `requestLayout()`、`measure()`、`setTextSize()`。

**开关**（Phase 2 默认关闭）
- `CaptionOverlay` 内 `static final boolean LAYER_V2 = false;`
- 关闭时走旧 `render()`；开启时只走 `CaptionLayer`。
- 两条路径共用同一份 `pendingText / pendingPages`，不得双写视图。

**必须保留的既有行为**（有测试）
- 拖动：`CaptionTouchProxyTest`、`CaptionMotionContractTest.draggingStillMovesTheCaption`
- 命中测试：`captionHit`
- 隐藏/显示：`anchorVisible`
- 短暂无 surface 不闪：`CaptionMotionContractTest.aTransientMissingSurfaceDoesNotFlashTheCaption`

**新增测试**
- `CaptionLayerNoLayoutTest`（Robolectric）：连续 30 帧改变矩阵并 `dispatchDraw`，断言 `requestLayout` 计数 = 0、`measure` 计数 = 0。
- `CaptionMatrixTest`：给定 surface 与 layer 的已知矩阵，校验 `m` 把局部矩形映射到预期屏幕矩形（误差 ≤ 0.5 px）。
- `CaptionLayerContinuityTest`：在 `r: 1 → 0.5625 → 1` 的 30 帧序列里，相邻帧的**屏幕字号**变化 ≤ 1.5%，且在端点处等于 55.5 / 44.5。

**验证命令**
```powershell
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest --tests "app.yydarlinker.deepseekcaptions.CaptionLayer*" --tests "app.yydarlinker.deepseekcaptions.CaptionMotionContractTest"
```

**完成判据**
- 新测试全绿 + 既有 motion/touch 测试全绿。
- 本地把 `LAYER_V2` 临时置 `true` 跑一遍诊断：`PRESENTATION_SYNC.frames_since_geometry_change` 在开评论时 ≤ 1；`OVERLAY_LAYOUT_IN_TRANSITION` = 0。
  （临时置 true 的提交**不得**保留在分支里。）

**回滚**：`LAYER_V2 = false` 即回到旧路径；`CaptionLayer` 不被 attach 时零开销。

---

### Phase 3 · 默认切换 + 删除旧状态机 + 静态契约检查

**目标**：旧机制归零，且用 CI 守住"不许再长回来"。

**实现要点**
1. `LAYER_V2 = true`（并删除这个开关本身），删掉旧 `render()` 路径中与呈现有关的部分。
2. 删除（与 N66 §5.5 一致）：
   `commentTransitionActive`、`commentProgress`、`commentTransitionArmed`、`reducedVideoWidth`、
   `classCandidate/classCandidateSince`、`CLASS_SETTLE_MS`、`SETTLE_MS`、`moving`、`noteGeometry`、
   `preplanEndpoint`、`PREPLAN_INTERVAL_MS`、`holdingLayout`、`layoutHoldSince`、`LAYOUT_HOLD_MS`、
   `appliedClass`、`commentCommitAt`、`commentCommitClass`、`commentPlanReady`、`commentSamples`、
   `sampleSheet`、`markSheetEndpoint`、`geometryFrame()` 里的 `render()` 调用、
   `CaptionText.onDraw` 里的 `setText("");hideView();`、`CaptionHorizontalPlacement` 整类。
3. 删除 `CaptionPresentationClass` 整类；其测试 `CaptionPresentationClassTest` 用
   `CaptionSizeLawTest` 替换（同阶段提交，说明替换理由）。
4. 内容切换改到 `Choreographer.postFrameCallback`（traversal 之前）：
   - 页边界：`scheduleNextPage` 改为 `Choreographer.postFrameCallbackDelayed` 或精确 `postFrameCallback` + 时间检查。
   - 模式切换：由 `PlayerType` 模型事件预热目标 plan；在 frame callback 里一次性换 `plan` 引用。
   - **plan 未就绪时保持上一版，永不 hide**。
5. 新增静态守卫 `tools/verify_presentation_contract.py`：
   - 在 `CaptionLayer.java` / `CaptionOverlayV2.java` 的 `onDraw`/`onPreDraw` 方法体内，出现
     `requestLayout(`、`.measure(`、`setLayoutParams(`、`setTextSize(`、`setText(` → 退出码 1。
   - 在 `presentation/` 包内出现 `enum Kind` → 退出码 1。
   - 挂到 `build.gradle.kts` 的 `verifyIntegrationSources` 之后（或 `:patches:buildAndroid` 依赖）。

**测试**
- 全量单测。
- `CaptionContinuityTest`（沿用）+ 新增断言：页边界切换时 `visible` 不出现 false。

**验证命令**
```powershell
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest
tools\Verify.ps1 -Offline
```

**完成判据**
- `tools/Verify.ps1 -Offline` 全绿（含 `:patches:buildAndroid`）。
- `grep -r "commentProgress\|commentTransitionActive\|CLASS_SETTLE_MS\|holdingLayout\|CaptionPresentationClass" --include=*.java .` 无结果。
- 真机：开/关评论、转屏、切视频各 5 次，`PRESENTATION_SYNC.frames_since_geometry_change ≤ 1`，`OVERLAY_LAYOUT_IN_TRANSITION = 0`，无 `visible=false`。

**回滚**：本阶段是删除型，回滚需整体 revert 本 Phase 的提交（Phase 2 的开关已在上一提交中）。

---

### Phase 4 · AI 会话意图统一

**目标**："AI 开 + 目标语言"变成唯一持久权威；观测永不升级为命令；应用幂等。

**新增文件**（`application-host/src/main/java/app/yydarlinker/deepseekcaptions/`）
- `CaptionSessionIntent.java`
  ```java
  final class CaptionSessionIntent {
      // 持久化：SharedPreferences("deepseek_caption_session")
      boolean aiEnabled; String targetLanguage; long revision; String provenance; // USER | NONE
      static CaptionSessionIntent load(Context c);
      void save(Context c);
      void userToggled(boolean on);      // revision++
      void userSelected(String code, boolean translate); // revision++
      static void resetForTests();
  }
  ```
- `CaptionSessionReconciler.java`
  ```java
  final class CaptionSessionReconciler {
      static void onVideo(String id);          // 记 (video, epoch)，立刻起 fetch + 首块翻译
      static void onTrackList(List<?> t);      // 只更新投影
      static void onCcMenuSelection(...);      // 写 intent
      static void onPlayerRegular();           // 幂等应用
      static void onTeardown();                // 只销毁 session
      // 内部：appliedKey = video + "|" + ownerEpoch + "|" + revision
  }
  ```
- `CaptionNativeProjection.java`：只读的"原生当前选中了什么"，供 UI 用，不参与决策。

**删除 / 降级**
- 删除 `CaptionChoice`、`EngineResume`、`CaptionLifecycleRestore`、`CaptionButtonController.captionIntent`。
- `CaptionButtonController.onVideoId` 的 `captionIntent=UNKNOWN` + `CaptionChoice.reset()` 删除。
- `NativeCaptionBridge.refreshNativeTrack` / `refreshFromCatalog` / `onCaptionsShown` 不再是决策入口：合并为 `observe(manager, event, epoch)` → 更新 `CaptionNativeProjection` + 通知 reconciler。
- `commitNativeCaptionOff` 只写投影，不写 intent、不发 DEACTIVATE。
- `DEACTIVATE` 拆成 `USER_OFF` / `NATIVE_RESET` / `TEARDOWN` 三种 action。
- `DeepSeekCaptionHook.rewriteUrl` 的 `selectionEvidence` 改为读 intent（`aiEnabled && target != null`），不再依赖 UI 观测。

**测试**（新增 `CaptionSessionIntentTest` / `CaptionSessionReconcilerTest`）
1. 拆卸不写 intent：`onTeardown()` 后 `revision` 不变、`aiEnabled` 不变。
2. 观测不等于命令：连续 10 次"原生 off"投影，intent 与 `aiEnabled` 不变，且下次 `onVideo` 仍会应用。
3. 幂等：同一 `(video, epoch, revision)` 连续 `onPlayerRegular()` 3 次，只应用 1 次。
4. 重进同视频：`onVideo(v)` → `onTeardown()` → `onVideo(v)` → `onPlayerRegular()` 应用成功。
5. 用户关：`userToggled(false)` 后 `onVideo` 不应用；`userToggled(true)` 后应用。
6. 陈旧事件：旧 `epoch` 的 `onTrackList` 不改变当前会话。

**验证命令**
```powershell
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest --tests "app.yydarlinker.deepseekcaptions.CaptionSession*"
```

**完成判据**
- 上述 6 条测试全绿。
- 真机：开 AI → 退出 → 重进同一视频，`INTENT_APPLY applied=true` 且出现在 `NATIVE_TRACK_LIST_READY` 后 1 帧内，无需手动操作。
- 手动关 CC 菜单 → 退出 → 重进，仍不自动打开（用户意图优先）。

**回滚**：本阶段改动集中在会话链，`git revert` 即可；呈现链不受影响。

---

### Phase 5 · 启动并行化与回环非阻塞

**目标**：首帧只等"物理下界"（首次 LLM 往返）。

**实现要点**
1. `onVideo(id)` 立刻触发源字幕 fetch（不等 track list、不等 CC 观测）。签名 URL 来自 `SourceCatalog`；未就绪时等 track list 再补，但 fetch 线程已就位。
2. 首块可用即开始翻译；`SOURCE_WAIT_MS` 期间用源文上屏。
3. 删除 `LoopbackCaptionServer.awaitSource` 的阻塞（`SOURCE_WAIT_MS = 1_600`）：立即用兜底空轨响应，源镜像就绪后下次请求替换。
4. 删除 `LoopbackCaptionServer.trackFor` 里的两次 `forceNativeRendererScan()`。
5. `CaptionMusicSuppressor` 的 40 ms tick 只在 `ownsNativeTrack()` 期间运行（现状已是），并把 `MAX_SCAN_VIEWS` 的回退扫描限制在"从未找到过"的情况下（找到过就只靠 `keepKnownMasked`）。
6. `RebuildController.prewarm` 无条件化（不依赖 `captionsKnownOn()`）。
7. 删除 `CaptionButtonController` 的 4.5 s `PLAYER_TRANSITION_QUIET_MS`：过渡期只暂停"写投影"，不暂停"应用 intent"。

**测试**（新增 `CaptionStartupOrderTest`）
1. 假 catalog + 假时钟：`onVideo` 后 0 ms 内 fetch 已被请求。
2. 冷缓存时回环响应耗时 < 50 ms（不阻塞）。
3. `first_caption_ms` 计算正确（video id → 首个译页）。

**验证命令**
```powershell
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest --tests "app.yydarlinker.deepseekcaptions.CaptionStartup*"
```

**完成判据**
- 真机冷启动：`FIRST_AI_PIXEL` ≤ 原生首帧 + 首次 LLM 往返 + 1 帧（记录实测值）。
- 真机热启动（缓存命中）：≤ 原生 + 50 ms。
- 日志中不再出现 `NATIVE_RENDERER_MASK_FALLBACK | Source track not ready`（因为不再等待）。

**回滚**：逐条可回滚；1–3 是主要收益，4–7 是附带收益，可分两次提交。

---

### Phase 6 · 收尾

**目标**：可发布的状态。

**实现要点**
1. `tools\Verify.ps1 -Offline` 全绿。
2. 更新 `docs/PROJECT-STATE.md` 与 `.verification/state-mirror/PROJECT-STATE.md`（**必须字节一致**）。
3. 写一份验收报告到 `validation/runs/<timestamp>/`：指标读数、真机日志片段、与 N66 目标逐条对照。
4. 若实现了"详情态同比例"决策，单独记录为产品变更。

**禁止**：不改 release 产物、不改 `patches-list.json`。

---

## 4. 执行对话提示词（可直接粘贴）

### P0 · 通用规约（每次会话开场必贴）

```text
【角色】
你是本仓库的执行会话。指导会话已完成根因分析，结论在 docs/N66-CAPTION-SYNC-AND-SESSION-INTENT-20261023.md，
执行计划在 docs/N67-EXECUTION-PLAN-AND-PROMPTS-20261023.md。你的任务是按任务卡施工，不是重新设计。

【仓库与环境】
- 仓库：E:\Projects\DeepSeek morphe-ai-caption-translator
- 禁止在 C: 下新建工程/交付副本；一切构建产物、证据、临时文件都在 E: 的仓库内。
- 构建/测试统一用 .\.devenv\dev.ps1（不要直接 gradlew，除非任务卡明确要求）。
- 全量验证：tools\Verify.ps1 -Offline，证据落在 validation\runs\<timestamp>\。
- 临时文件放 .tmp\；不要动 work\ 下的共享缓存。

【硬性禁止（违反即视为任务失败）】
1. 禁止在 onDraw / OnPreDraw / dispatchDraw 里调用 measure、setLayoutParams、requestLayout、setText、setTextSize。
2. 禁止新增任何"等 N 毫秒再决定视觉参数"的逻辑（_MS 常量、postDelayed 定时器）。
3. 禁止为新机制保留旧的 class/enum 档位作为 fallback。
4. 禁止修改 translation-core、patches、caption-contracts 的语义。
5. 禁止改既有测试断言来让新实现过；被删机制的测试必须同阶段替换并说明理由。
6. 禁止引入新依赖、禁止新增用户可见设置项或文案。
7. 禁止产出 release 产物；Phase 6 之前禁止改 docs/PROJECT-STATE.md。

【工作方式】
- 一次只做一个 Phase。不要顺手重构、不要跨阶段提交。
- 每个结论必须给 path:line 和命令输出原文；不接受"应该/大概/预期"。
- 先读任务卡里列出的现有文件，再动笔。改动前先用一句话说明你要改什么、为什么。
- 如果任务卡与代码现实冲突（例如某个方法不存在），停下来报告，不要自行改设计。

【交付格式】
## 变更清单
- <path>:<line-range> — 改了什么，为什么
## 命令与输出
- 命令：...
- 结果：<原文片段>
## 指标读数
- <指标> = <值>（来源：<path:line> 或日志片段）
## 未做 / 做不了
- ...
```

---

### P1 · Phase 0 任务卡

```text
【任务】Phase 0：基线冻结与影子指标。行为零变化，只加可观测性。

【只允许改】
- infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/CaptionDiagnostics.java
- ui/src/main/java/app/yydarlinker/deepseekcaptions/CaptionOverlayV2.java（只在 render()/displayResult() 末尾加只读埋点）

【要做】
1. 新增诊断事件 PRESENTATION_SYNC，字段：video_rect、local_rect、scale、screen_short、size_px、frames_since_geometry_change。仅 textDebug 开启时输出。
2. 新增 OVERLAY_LAYOUT_IN_TRANSITION 计数：在叠加层子树外包一个计数 ViewGroup，覆写 requestLayout()，统计"TRANSITIONING_TO_REGULAR 期间本子树触发的 requestLayout 次数"。
3. 新增 FIRST_AI_PIXEL：video id → 首个非"翻译中…"的译页上屏的毫秒数。
4. 预留 INTENT_APPLY 事件（Phase 4 填内容）。

【不要做】
- 不改 applyCommentScale / updatePresentationClass / 任何视觉参数 / 任何时序。
- 不改 BuildConfig.CAPTION_BUILD_ID。

【必须运行】
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest

【必须证明】
- 全量单测通过（贴结尾 20 行）。
- 给出新增埋点的 path:line。
- 说明每个新事件在什么条件下会输出、开销多大（是否在每帧路径上）。

【完成判据】
日志里能 grep 到 4 个新事件；开评论时 PRESENTATION_SYNC 的 frames_since_geometry_change ≥ 8（复现现状）。
```

---

### P2 · Phase 1 任务卡

```text
【任务】Phase 1：把"文本→页→局部坐标 StaticLayout"做成与动画无关的纯函数，后台可构建。

【只允许新增】（presentation/src/main/java/app/yydarlinker/deepseekcaptions/）
- CaptionPlanGeometry.java
- CaptionPlan.java
- CaptionPlanFactory.java
- CaptionSizeLaw.java
【只允许新增测试】（extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/）
- CaptionSizeLawTest.java
- CaptionPlanFactoryTest.java

【必须实现】
1. CaptionSizeLaw.glyphPx(videoShortOnScreen, screenShort, tier, shorts)：
   gF=fullGlyph(tier)*(screenShort/1264)，gD=detailGlyph(tier)*(screenShort/1264)；
   shorts 直接返回 gD；
   否则 r=clamp(videoShortOnScreen/screenShort,0,1)，t=clamp((1-r)/(1-9/16),0,1)，返回 gF+(gD-gF)*t。
2. CaptionPlanFactory.build(text,start,end,geometry,spec) 返回不可变 CaptionPlan：
   pages（text/start/end/line1Px/line2Px/StaticLayout）、boxWidth、boxHeight、glyphLocalPx、key。
   StaticLayout 用 Builder：ALIGN_CENTER、setIncludePad(false)、maxLines 2、BREAK_STRATEGY_BALANCED、HYPOTHENATION_FREQUENCY_NONE。
3. plan key = text|start|end|localInnerWidth|glyphLocalPx|spec.measurementKey()。
4. 纯函数：不读 Activity、SharedPreferences、SystemClock。

【不要做】
- 不改 CaptionOverlayV2 的渲染路径（本阶段不接线）。
- 不依赖 CaptionPresentationClass（它在 Phase 3 被删除）。

【测试必须覆盖】
- 端点：screenShort=1264 时 r=1→55.5、r=9/16→44.5；tier 缩放线性。
- 单调：r 从 1 线性降到 9/16，glyph 单调不增。
- 横竖屏同一输入同一输出。
- 2067px/55.5px 下的页切分与现有 CaptionPageLayout 逐页一致（用仓库里已有的真实字幕样本）。
- 同一输入两次 build 的 key 与行宽相同。
- 在后台线程 build 不抛异常。

【必须运行】
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest --tests "app.yydarlinker.deepseekcaptions.CaptionSizeLawTest" --tests "app.yydarlinker.deepseekcaptions.CaptionPlanFactoryTest"

【完成判据】
两个测试类全绿；CaptionPlanFactory 无 Activity 引用；旧路径零调用（贴 grep 证据）。
```

---

### P3 · Phase 2 任务卡

```text
【任务】Phase 2：新增 CaptionLayer（draw-only），位置与缩放完全由"视频平面当前帧矩阵"决定。
默认关闭（CaptionOverlay.LAYER_V2=false），旧路径保持默认。

【只允许新增】
- ui/src/main/java/app/yydarlinker/deepseekcaptions/CaptionViewport.java
- ui/src/main/java/app/yydarlinker/deepseekcaptions/CaptionLayer.java
【只允许改】
- ui/src/main/java/app/yydarlinker/deepseekcaptions/CaptionOverlayV2.java（只加开关与 attach 分支，不改旧路径行为）
【只允许新增测试】
- CaptionLayerNoLayoutTest.java
- CaptionMatrixTest.java
- CaptionLayerContinuityTest.java

【必须实现】
1. CaptionViewport 每帧读一次：
   localVideo（surface.getWidth/Height 组成的矩形）、surfaceToGlobal、layerToGlobal、
   scale=sqrt(|ax*dy-ay*dx|)（退化用 ax）、screenShort=min(displayMetrics)。
2. CaptionLayer.onDraw：
   m = layerToGlobal⁻¹ ∘ surfaceToGlobal；
   g = CaptionSizeLaw.glyphPx(videoShortOnScreen, screenShort, tier, shorts)；
   k = g / (plan.glyphLocalPx * v.scale)；
   canvas.concat(m)；canvas.scale(k,k,boxW/2,boxH/2)；画背景；translate；plan.page.layout.draw。
3. 只允许 invalidate()。禁止 requestLayout/measure/setTextSize/setText。
4. 不得使用 getGlobalVisibleRect 计算 scale 或短边（会被窗口裁剪）。

【必须保留的既有行为（有测试）】
拖动、命中测试、anchorVisible、短暂无 surface 不闪。

【测试必须覆盖】
- 连续 30 帧改矩阵并 dispatchDraw：requestLayout 计数=0，measure 计数=0。
- 已知矩阵下局部矩形映射到预期屏幕矩形，误差 ≤0.5px。
- r:1→0.5625→1 的 30 帧里，相邻帧屏幕字号变化 ≤1.5%，端点精确。
- 拖动、命中、短暂无 surface 四条既有行为仍通过。

【必须运行】
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest --tests "app.yydarlinker.deepseekcaptions.CaptionLayer*" --tests "app.yydarlinker.deepseekcaptions.CaptionMotionContractTest" --tests "app.yydarlinker.deepseekcaptions.CaptionTouchProxyTest"

【必须证明】
临时把 LAYER_V2 置 true 跑一次真机诊断（提交前必须改回 false）：
PRESENTATION_SYNC.frames_since_geometry_change ≤ 1；OVERLAY_LAYOUT_IN_TRANSITION = 0。
```

---

### P4 · Phase 3 任务卡

```text
【任务】Phase 3：切换为 CaptionLayer 默认路径，删除旧状态机，并加静态守卫防止回潮。

【必须删除】（与 N66 §5.5 一致）
commentTransitionActive、commentProgress、commentTransitionArmed、reducedVideoWidth、
classCandidate/classCandidateSince、CLASS_SETTLE_MS、SETTLE_MS、moving、noteGeometry、
preplanEndpoint、PREPLAN_INTERVAL_MS、holdingLayout、layoutHoldSince、LAYOUT_HOLD_MS、
appliedClass、commentCommitAt、commentCommitClass、commentPlanReady、commentSamples、
sampleSheet、markSheetEndpoint、geometryFrame() 里的 render() 调用、
CaptionText.onDraw 里的 setText("")+hideView()、CaptionHorizontalPlacement 整类、CaptionPresentationClass 整类。

【必须替换的测试】
CaptionPresentationClassTest → CaptionSizeLawTest（同阶段提交，说明替换理由）。
CaptionMotionContractTest 中被删机制相关的断言 → 改为对 CaptionLayer 的等价断言。

【必须新增】
tools/verify_presentation_contract.py：
- 在 CaptionLayer.java 与 CaptionOverlayV2.java 的 onDraw/OnPreDraw 方法体内出现
  requestLayout(、.measure(、setLayoutParams(、setTextSize(、setText( → exit 1。
- presentation/ 包内出现 "enum Kind" → exit 1。
- 接入构建（verifyIntegrationSources 之后或 :patches:buildAndroid 依赖）。

【必须实现】
1. 内容切换改到 Choreographer.postFrameCallback（traversal 之前）：页边界与 plan 切换都在这里。
2. plan 未就绪时保持上一版，永不 hideView。
3. 模式切换由 PlayerType 模型事件预热目标 plan，frame callback 里一次性换引用。

【必须运行】
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest
tools\Verify.ps1 -Offline

【必须证明】
- Verify 全绿（贴结尾）。
- grep -r "commentProgress|commentTransitionActive|CLASS_SETTLE_MS|holdingLayout|CaptionPresentationClass|CaptionHorizontalPlacement" --include=*.java . 无结果。
- 真机：开/关评论、转屏、切视频各 5 次，frames_since_geometry_change ≤1，OVERLAY_LAYOUT_IN_TRANSITION=0，无 visible=false。
```

---

### P5 · Phase 4 任务卡

```text
【任务】Phase 4：把"AI 开 + 目标语言"变成唯一持久权威；观测永不升级为命令；应用幂等。

【新增】
- application-host/.../CaptionSessionIntent.java（持久化、revision）
- application-host/.../CaptionSessionReconciler.java（按 (video, ownerEpoch, revision) 幂等）
- application-host/.../CaptionNativeProjection.java（只读投影）

【删除】
CaptionChoice、EngineResume、CaptionLifecycleRestore、CaptionButtonController.captionIntent、
CaptionButtonController.onVideoId 里的 captionIntent=UNKNOWN 与 CaptionChoice.reset()。

【改造】
- NativeCaptionBridge.refreshNativeTrack/refreshFromCatalog/onCaptionsShown → 合并为
  observe(manager,event,epoch)，只更新投影 + 通知 reconciler。
- commitNativeCaptionOff 只写投影，不写 intent、不发 DEACTIVATE。
- DEACTIVATE 拆成 USER_OFF / NATIVE_RESET / TEARDOWN。
- DeepSeekCaptionHook.rewriteUrl 的 selectionEvidence 改为读 intent。

【测试必须覆盖】
1 拆卸不写 intent；2 观测≠命令（10 次原生 off 后 intent 不变且仍会应用）；
3 幂等（同键 3 次只应用 1 次）；4 重进同视频成功应用；5 用户关后不应用、再开后应用；
6 旧 epoch 的 track list 不改变当前会话。

【必须运行】
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest --tests "app.yydarlinker.deepseekcaptions.CaptionSession*"

【必须证明】
真机：开 AI → 退出 → 重进同视频，INTENT_APPLY applied=true 且出现在 NATIVE_TRACK_LIST_READY 后 1 帧内，无需手动操作。
```

---

### P6 · Phase 5 任务卡

```text
【任务】Phase 5：首帧只等物理下界（首次 LLM 往返）。

【要做】
1. onVideo(id) 立刻触发源字幕 fetch，不等 track list、不等 CC 观测。
2. 首块可用即翻译；SOURCE_WAIT_MS 期间用源文上屏。
3. 删除 LoopbackCaptionServer.awaitSource 阻塞（SOURCE_WAIT_MS=1600）：立即回兜底空轨，源镜像就绪后下次替换。
4. 删除 LoopbackCaptionServer.trackFor 的两次 forceNativeRendererScan()。
5. MAX_SCAN_VIEWS 回退扫描只在"从未找到过"时启用。
6. RebuildController.prewarm 无条件化。
7. 删除 CaptionButtonController 的 4.5s PLAYER_TRANSITION_QUIET_MS（过渡期只暂停写投影，不暂停应用 intent）。

【测试必须覆盖】
- onVideo 后 0ms 内 fetch 已请求。
- 冷缓存时回环响应 < 50ms。
- first_caption_ms 计算正确。

【必须运行】
.\.devenv\dev.ps1 :extensions:extension:testDebugUnitTest --tests "app.yydarlinker.deepseekcaptions.CaptionStartup*"

【必须证明】
真机冷启动 FIRST_AI_PIXEL ≤ 原生首帧 + 首次 LLM 往返 + 1 帧；热启动 ≤ 原生 + 50ms；
日志不再出现 NATIVE_RENDERER_MASK_FALLBACK | Source track not ready。
```

---

### P7 · Phase 6 任务卡

```text
【任务】Phase 6：收尾与状态归档。

【要做】
1. tools\Verify.ps1 -Offline 全绿。
2. 更新 docs/PROJECT-STATE.md 与 .verification/state-mirror/PROJECT-STATE.md，两者必须字节一致。
3. 在 validation/runs/<timestamp>/ 写验收报告：指标读数、真机日志、与 N66 目标逐条对照。
4. 若实现了"详情态同比例"的产品变更，单独记录。

【不要做】
- 不改 release 产物、不改 patches-list.json。
```

---

## 5. 指导对话的审查提示词

把执行会话的交付原样贴给指导会话，用这段触发审查：

```text
【审查请求】
下面是执行会话的 Phase <N> 交付。请按 docs/N67 §1.2 四道门逐条判定，输出：
1. 契约门：通过 / 不通过（列出触碰的红线，带 path:line）
2. 证据门：通过 / 不通过（缺哪些 path:line 或命令输出）
3. 指标门：通过 / 不通过（本阶段指标 vs 实测值）
4. 回归门：通过 / 不通过（测试与构建）
5. 偏差检测 §1.3 的 6 条，逐条回答 是/否
6. 结论：放行下一阶段 / 打回（打回必须给出最小修复清单，不要泛泛说"再完善"）
```

**打回模板**

```text
【打回 · Phase <N>】
不通过的门：<契约/证据/指标/回归>
最小修复清单：
1. <具体到 path:line 的改动>
2. ...
不要做：<明确指出不要顺手改的部分>
重新提交时只需给：变更清单 + 上述 1..n 的证据 + 指标读数。
```

---

## 6. 里程碑

| 里程碑 | 判定 |
|---|---|
| M1 呈现同步达标 | Phase 3 完成：`frames_since_geometry_change ≤1`、`OVERLAY_LAYOUT_IN_TRANSITION=0`、无空白帧 |
| M2 会话恢复达标 | Phase 4 完成：重进同视频自动恢复，且用户关掉的仍然关闭 |
| M3 首帧达标 | Phase 5 完成：冷启动 ≤ 原生 + 一次 LLM 往返 |
| M4 可发布 | Phase 6 完成：Verify 全绿 + 状态双写 + 验收报告 |

---

## 7. 已知风险与预设应对

| 风险 | 触发信号 | 预设应对 |
|---|---|---|
| 自绘图层与 YouTube 的层级冲突 | 评论面板盖不住字幕 | 保持现有 host；`m` 的计算与 host 无关，只调 attach 位置即可 |
| `transformMatrixToGlobal` 在动画帧取到旧值 | `frames_since_geometry_change` 稳定 = 1 | 允许 1 帧；若 >1，改在 `Choreographer.postFrameCallback` 缓存矩阵、`onDraw` 使用 |
| 低端机每帧重绘掉帧 | 掉帧统计 | 加"r 变化 > 0.5% 才 invalidate"的节流（仍无 layout） |
| 端点换行仍可见 | 用户反馈 | 这是产品参数问题；提供"详情态同比例"开关作为备选，需产品决策 |
| Phase 4 删除面过大导致回归 | 测试红灯 | 先加新类并接线（双读），再删旧类；两次提交 |
