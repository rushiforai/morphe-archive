# N66 · 字幕与评论区同步、AI 会话恢复：根因分析与机制替换方案

- 版本基线：UI/Engine 1.5.7，core `rebuild-1.4.0/ac65fe8`，presentation `n29-presentation-v3`
- 证据来源：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.7-20261023-130333.txt`（下称"日志"）+ 本仓库源码
- 原则：只从代码与日志推导，不引用任何既有分析结论

---

## 0. 结论摘要

**问题一（横屏全屏开关评论区卡顿、字幕框闪）不是"动画没跟上"，而是六个结构性缺陷叠加（前四个是主因）：**

1. **呈现结果靠布局产生，而布局在 `OnPreDraw` 里发起**。框架一帧的顺序是 `measure → layout → dispatchOnPreDraw → draw`，在 pre-draw 里 `requestLayout/measure` 只能下一帧生效。于是"按本帧几何算出来的内容"永远画在下一帧的几何上。
2. **连续量（动画进度）用错误的自变量重建**：`progress = (参考宽 − 当前可见宽) / (参考宽 − 硬编码 66%)`，且竖屏、`SLIDING` 时整条连续回路直接关闭——而 YouTube 从全屏打开评论的真实流程恰恰是"横屏动一小段→转竖屏"。
3. **坐标系契约自相矛盾**：一处按"字幕已被祖先矩阵缩放过"做逆矩阵抵消，另一处又按"字幕未被缩放过"补一个 `target/base` 缩放；两套假设不可能同时成立，且没有任何断言证明落点。
4. **端点是整页换版而非几何等价**：`classFrameWidth` 2067→1163、行数 1→2、盒宽 1544→668，必然跳变。

日志里 `COMMENT_SHEET_ENDPOINT commit_to_size_ms=248`、`plan_ready_at_commit=false`、以及大量 `visible=false` 空白帧，都是这条流水线的直接读数。

**问题二（退出再进入同一视频 AI 字幕不自动打开、首帧比原生慢）不是"没保存状态"，而是"AI 开"这件事没有单一权威：**

- 只有 `enabled` 这一个布尔量落盘。`on/off + 目标语言` 活在进程内的 `CaptionChoice`、`captionIntent`、`EngineResume` 里；`onVideoId` 会把它清掉（`CaptionButtonController.java:147,151`），此后所有自启动闸门同时失效。
- **一次"观测"被当成了"用户命令"**：`syncNativeCaptionState` 读到 CC 无障碍状态 OFF 就调 `commitNativeCaptionOff`（`:631-641`），后者写 `userOff=true` 并发出 DEACTIVATE；而 `CaptionApplication.command` 只在 500 ms 内发生过 `automaticReset` 时才认作自动（`:58-63`），否则 `EngineResume.declined()`——**恢复路径被永久关死**，直到用户手动点一次。
- 一个"同一视频、上一会话的 `off=true`"残余条目会压过 ON 意图（`NativeCaptionBridge.java:521`），而 catalog 回退只在 `DEFERRED` 时执行（`:611`），所以连"重新打开 AI 开关"都修不回来。
- 全程没有 session epoch：晚到的事件会作用到新会话上。
- 首帧慢的主导项**不是网络**：状态尚存时，从 `onVideoId` 到 `ENGINE_CATALOG_ACTIVATED` 只要 96 ms、到 `AI_STARTED` 只要 109 ms（日志实测）。慢在"先做决定"：意图重置 → CC 扫描（220 ms 首扫 / 2.5 s 维护扫）→ 过渡静默窗 4.5 s → 非幂等的重复激活 → 才轮到 fetch + LLM。

**新方案一句话**：把字幕拆成三条互不耦合的回路（内容 / 计划 / 呈现），呈现只做 canvas 变换并在 `onDraw` 里读当前帧矩阵，计划由模型事件预热，内容只按事件换页；AI 侧改成"一个持久化会话意图 + 一个幂等 reconciler"。

---

## 1. 评估方法

1. 先从日志还原完整时间线，得到"事件 → 决策 → 呈现"的实际延迟。
2. 再在源码里逐条定位产生这些日志字段的代码路径，验证机制而不是验证结论。
3. 最后判断：该机制在物理上能否做到"0 帧延迟"。不能的，就不是参数问题，而是机制问题。

---

## 2. 问题一：根因

### 2.1 现场时间线（1.5.7，横屏全屏打开评论）

| 时刻 (ms) | 事件 | 说明 |
|---|---|---|
| 1792731744707 | `PLAYER_TRANSITION_RENDER_DISPATCH type=WATCH_WHILE_SLIDING_MAXIMIZED_FULLSCREEN` | 玩家开始变化 |
| 1792731744926 | `COMMENT_SHEET_SYNC progress=0.14659686;observed=2135x853;screen=2736x1264;class=FULL` | 视频可见矩形已从 2247 缩到 2135 |
| 1792731744994 | `PLAYER_TRANSITION_RENDER_DISPATCH type=WATCH_WHILE_MAXIMIZED` | 玩家进入 maximized |
| 1792731745132 | `CAPTION_PRESENTATION_CLASS class=DETAIL;video=0 0 1264 711;screen=1264x2736` | 屏幕已转竖屏，提交 DETAIL |
| 1792731745132 | `REBUILD_PRESENTED mode=caption_hold;reason=preparing_layout;desired_box_width_px=1544;laid_out_box_width_px=1544` | 提交后立刻"保持旧页" |
| 1792731745369 | `REBUILD_PRESENTED ... desired_box_width_px=668;laid_out_box_width_px=1544;lines=2` | 新页落地；本帧画出来的仍是 1544 宽 |
| 1792731745381 | `COMMENT_SHEET_ENDPOINT class=DETAIL;commit_to_size_ms=248;plan_ready_at_commit=true` | 提交到真正改变 = 248 ms |

**从玩家开始变化到字幕尺寸真正改变 ≈ 386 ms；其中 248 ms 发生在"已经决定换尺寸"之后。**

### 2.2 RC-1：呈现回路在 pre-draw 里做布局，内容结构性地晚一帧以上

调用链：

```
CaptionOverlayV2.WATCH            (CaptionOverlayV2.java:227-235)   // OnPreDrawListener
  → geometryFrame()               (:1145-1181)
      → updatePresentationClass() (:1261-1321)   // 返回 true 表示换了档
      → render()                  (:1665)        // ← 在 pre-draw 里
          → applyVisibleText()    (:2162-2250)
              → text.setLayoutParams(); text.measure(...)   (:2224-2233)
          → placeVisibleText()    (:2269-2285)
              → CaptionHorizontalPlacement.position()       (CaptionHorizontalPlacement.java:47-70)
                  → outer.setLayoutParams(...)              (:62-64)
```

框架一帧的顺序是 `measure → layout → dispatchOnPreDraw → draw`。因此在 `dispatchOnPreDraw` 里发起的 `requestLayout()` 只能让**下一次** traversal 生效；`measure()` 虽然是同步的，但 `getWidth()/getHeight()` 仍是旧值。

后果：**任何"根据本帧几何算出来的文本/盒宽"都被画在下一帧的几何上**。静止时误差是 1 帧、不可见；动画时 YouTube 的几何每帧都在变，误差随动画速度放大，并且 `placeVisibleText` 用新的 `measuredHeight` 去定位、用旧的 `getWidth()` 去画背景，于是"盒子的一边已经变了、另一边还没变"。

这不是阈值没调好，而是**在错误的时机做布局**。

### 2.3 RC-2：连续量用错误的自变量重建，且真实流程里被整段禁用

```java
// CaptionOverlayV2.java:1380-1389
private static float commentProgress(int screenWidth, int screenHeight, Rect observed) {
    int full = CaptionPresentationClass.referenceVideoWidth(screenWidth, screenHeight);
    int reduced = reducedVideoWidth > 0 ? reducedVideoWidth : Math.round(full * .66f);
    int onScreen = observed == null ? 0 : observed.width();
    float progress = (full - onScreen) / (float) (full - reduced);
    ...
}
```

代入日志实测：`full = 2247`（1264×16/9），`reduced = round(2247×.66) = 1483`，`onScreen = 2135`
→ `(2247−2135)/(2247−1483) = 0.1466`，与日志 `progress=0.14659686` 完全一致。
**证明这条"同步"确实是把"可见宽度比"当成动画进度在用。**

而真正需要它的时刻它被关掉：

```java
// CaptionOverlayV2.java:1351-1358
if (CaptionSurface.isShorts() || screenWidth <= screenHeight) return false;   // 竖屏 → 关
...
if (!type.isEmpty() && type.contains("SLIDING")) return false;                // 滑动中 → 关
```

日志 `1792731745132 screen=1264x2736` 说明 YouTube 从全屏打开评论时**会转竖屏**。于是：

- 横屏动画的极早期（`progress≈0.15`）还在连续回路上；
- 一旦转竖屏，`commentTransitionActive` 立刻返回 false，连续回路消失；
- 剩下的只有 `updatePresentationClass` 的离散路径：`classTransitionAllowed` → 候选稳定 `CLASS_SETTLE_MS=80` → 提交。

**最需要同步的那一段，恰好没有同步。**

### 2.4 RC-3：坐标系契约自相矛盾（要么二次缩放，要么根本不跟手）

两种互斥的假设同时存在于代码里：

**假设 A：字幕在"被 YouTube 缩放过的 host 内部"，因此局部矩形自动抵消缩放。**
- `CaptionSurface.observedVideoRect` 注释（`CaptionSurface.java:469-479`）："local rectangle deliberately cancels such a scale (the caption is placed inside the scaled host)"
- `CaptionSurface.currentVideoBounds`/`relative`（`:230-257`）为此专门做 `transformMatrixToGlobal` 求逆。

**假设 B：字幕不继承缩放，所以要自己补一个比例。**

```java
// CaptionOverlayV2.java:1442-1448
float base = CaptionPresentationClass.glyphHeightPx(presentationTier, screenWidth, screenHeight, appliedClass);
float scale = base > 0f ? target / base : 1f;      // ← base 是“标称字号”，不是“屏幕上的字号”
```

`target/base` 只有在"屏幕上字号 == 标称字号"（即继承缩放 s == 1）时才正确。

- 若 A 成立：字幕已经被 s 缩过一次，再乘 `target/base` → **二次缩放**。用日志数代入（s≈0.95、progress≈0.1466）：预期 53.89 px，实际 ≈ 55.5×0.95×0.971 = **51.2 px**，偏小约 5%，并随动画推进继续偏离。
- 若 B 成立：字幕根本不跟手，`target/base` 只是按 55.5→44.5 的线性插值走，与 YouTube 实际动画曲线无关 → **仍然是晚且不跟手**。

代码无法在两种假设下同时正确，**也没有任何断言或诊断证明它落在哪一种**。这是"闪"和"迟"的共同上游。

### 2.5 RC-4：端点换版不是几何等价的

```java
// CaptionOverlayV2.java:1465-1508 commitPresentationClass
classFrameWidth = ...;        // 2067 → 1163
stableTextWidth = 0; stableTextLines = 0;   // 强制重新分页
```

日志两端：

- 提交前：`desired_box_width_px=1544; lines=1`
- 提交后：`desired_box_width_px=668; lines=2; stable_text_width_px=…`
- 中间那帧：`laid_out_box_width_px=1544`（说明宽度要到下一帧才生效）

**盒宽几乎减半、行数翻倍，是实打实的几何跳变**，不是"闪烁"的错觉。日志里 `laid_out` 与 `desired` 长期不同步（`:681` 1904 vs 261、`:737` 1244 vs 1904、`:808` 668 vs 1544）就是这条"内容已换、布局未换"缝隙的直接证据。

### 2.6 RC-5：三处会产生整框空白帧

1. **计划未就绪 → 保持旧页，超时后清空**
   `CaptionOverlayV2.java:1867-1874`（`caption_hold`，`LAYOUT_HOLD_MS=1200`）→ `:1876-1888`（`overflow_status`）→ `:1944-1955`（`hideView()`）。
   日志 `:1210-1212`：`REBUILD_LAYOUT_FALLBACK … visible=false;reason=preparing_layout`。
2. **绘制期自清空**
   `CaptionText.onDraw`（`:872-888`）在 `pageOwns(paintAt)` 不成立时直接 `setText(""); hideView();` —— 在 draw 里改视图状态，必然造成至少一帧空白。
3. **权威隔离**
   `blocked()`（`:257-259`）在 `COMPACT`/`TRANSITIONING_TO_REGULAR` 时禁止显示；日志 `:1216`、`:33-34` 的 `mode=suppressed;reason=player_suppressed` 即此。

三种空白叠加，就是用户说的"闪"。

### 2.7 RC-6：我们的工作直接压在 YouTube 自己的动画帧上

| 位置 | 在做什么 | 为什么损害 YouTube 动画 |
|---|---|---|
| `CaptionOverlayV2.java:2224-2233` | pre-draw 中 `setLayoutParams` + 最多 3 轮 `measure` | 触发 player overlay 容器向上 requestLayout，与评论面板同一帧抢 layout |
| `:2037-2054` + `CaptionHorizontalPlacement.java:93-97` | 每次 render 都 add/remove `OnPreDrawListener` | 每帧改动 ViewTreeObserver 列表 |
| `:1449-1454` | 每帧 `setScaleX/Y` | 每帧让字幕节点 dirty |
| `CaptionMusicSuppressor.java:29` | 40 ms 常驻 tick | 25 Hz 常驻主线程唤醒 |
| `CaptionMusicSuppressor.java:32,124` | 回退扫描最多 1200 个 view | 与过渡重叠时是整树遍历 |
| `CaptionPlayerTransitionGuard.java:241-274` | 探针帧里对每个 `PLAYER_IDS` 做 `findViewById` | 过渡期间的主线程树搜索 |

注：日志里的 `scan_total_us` 是**累计值**（`scanNanos += …`，`CaptionMusicSuppressor.java:135`，按 `/1000` 输出于 `:143`），111235→153041 是 37→47 次扫描的累计耗时，单次约 3–4 ms。**它不是主因，但会因为 `forceNativeRendererScan()` 反复重置 `nextScanAtMs`（`:94-103`）而在过渡窗口里被反复触发。**

---

## 3. 问题二：根因

> 说明：本节的判定全部有代码或日志支撑；本次日志切片从会话中途开始，未包含"失败的那一次进入"，因此下面按"可证伪的机制"排序，而不是按猜测的单一事件归因。

### 3.1 RC-7：意图不是一等公民——落盘的只有 `enabled`，其余全是进程内缓存

| 状态 | 位置 | 生命周期 | 谁清它 |
|---|---|---|---|
| `DeepSeekConfig.enabled` | SharedPreferences | 持久 | 仅用户（`CaptionQuickToggle.setEngine:125`） |
| `CaptionChoice.{on,language,translation,chosen,userOff,explicitOff}` | 进程静态 | 进程 | `reset()` / `toggle(false)` / `markExplicitOff()` |
| `CaptionButtonController.captionIntent` | 进程静态 | 视频 | `onVideoId` 置 `UNKNOWN` |
| `EngineResume.{owner,url,intent,armed}` | 进程静态 | 视频 | `video(id)` / `declined()` / `take()` |
| `CaptionLifecycleRestore.retainedTargetCode` | 进程静态 | 进程 | 无显式清理 |

**"AI 开 + 目标语言"没有任何一项落盘。** 进程重启、或任意一处 reset，就只剩一个 `enabled=true` 的布尔量——它不足以启动任何东西。

致命顺序（`DeepSeekCaptionHook.java:45-55`）：

```java
NativeCaptionBridge.onVideoId(videoId);        // :49  ← 这里不做选择，只标记 VIDEO_SWITCHED
CaptionActions.onVideoId(videoId);             // :50
CaptionButtonController.onVideoId(videoId);    // :51  ← 这里 reset
```

`CaptionButtonController.onVideoId`（`CaptionButtonController.java:135-157`）：

```java
if (!clean.equals(currentVideoId)) {
    ...
    captionIntent = CaptionIntentPolicy.UNKNOWN;   // :147
    ...
    CaptionChoice.reset();                          // :151
}
```

`CaptionChoice.reset()` 会清掉 `language/translation/on/chosen/userOff/explicitOff`。此后所有自启动闸门同时失效：

- `NativeCaptionBridge.onOriginalTrackList`（`:165-168`）要求 `CaptionButtonController.captionsKnownOn()`；
- `DeepSeekCaptionHook.selectionEvidence`（`DeepSeekCaptionHook.java:151-157`）要求 `isVisibleActive() || CaptionChoice.isOn() || mayActivateAiTarget() || nativeMenuRecentlyOpened() || captionsKnownOn()`；
- `NativeCaptionBridge.refreshFromCatalog`（`:566-567`）要求 `CaptionChoice.targetLanguage()` 非空。

只要 YouTube 在新会话里以 CC off 起步，以上全部为 false → **AI 不会启动，而原生字幕会（原生有自己的全局偏好）**。这与用户描述完全一致。

### 3.2 RC-8：一次"观测"被当成了"用户命令"——`userOff` 闩锁会永久关死恢复路径

`CaptionButtonController.syncNativeCaptionState`（`:631-650`）读的是 CC 按钮的**无障碍状态**：

```java
if (now <= ignoreUiStateUntilMs || now < transitionQuietUntilMs) return;   // :633
int state = nativeCaptionState(button);
if (state == CaptionIntentPolicy.OFF) {
    commitNativeCaptionOff(now <= nativeMenuUntilMs, "…");                 // :636-641
    return;
}
```

`commitNativeCaptionOff`（`:652-663`）：

```java
captionIntent = CaptionIntentPolicy.OFF;          // :654
CaptionChoice.toggle(false);                      // :658  → userOff = true
CaptionActions.deactivateFromNativeCaptionState();// :659  → DEACTIVATE "native_selection"
```

而 `CaptionApplication.command` 只在"500 ms 内发生过 `EngineResume.automaticReset()`"时才把这次 DEACTIVATE 认作自动（`CaptionApplication.java:58-63`，`EngineResume.java:18,68-73`）；`commitNativeCaptionOff` 从不调用 `automaticReset()`。于是：

```java
EngineResume.declined();     // intent = false，恢复路径被关死
```

这一条把**所有**后续路径同时关掉：

- `resume()`（`CaptionApplication.java:151`）→ `CaptionChoice.userOff()` 为 true，直接 return；
- `refreshNativeTrack()`（`NativeCaptionBridge.java:518`）→ `userOff` → `CAPTIONS_OFF`；
- `applySelection()`（`NativeCaptionBridge.java:370`）→ `:387` 因 `userOff` 直接 return；即使放过，`:394` 的 `captionsKnownOn()` 也会拦下。

**即：YouTube 在重建/过渡瞬间短暂显示出"CC off"，就足以被记成"用户关掉了字幕"，此后 AI 永不自动恢复，直到用户手动点一次。**

### 3.3 RC-9：AI 的显示启动被绑在"原生产生 tlang 请求"或"CC 已知为 ON"上

```java
// DeepSeekCaptionHook.java:99-110
TargetLanguage target = TargetLanguage.fromUrl(originalUrl);
if (target == null) return originalUrl;          // 源语言请求 → 原样放行
...
if (!selectionEvidence()) return originalUrl;
```

即：**只有 YouTube 自己发出 `tlang=…` 的请求，AI 才会接管**。而 YouTube 发出 `tlang` 的前提是用户在 CC 长按菜单里选了自动翻译。所以 AI 无法自启动——这正是"必须手动重启"。

日志佐证：

```
:1335  NATIVE_TRACK_APPLIED … off=true;translated=false;reason=1;track=
:1337  NATIVE_TRACK_APPLIED … off=false;translated=true;reason=1;track=zh-Hans/manual   ← 手动重选
:1341  NATIVE_CAPTION_MENU | CC long-press menu has selection authority; …
:1343  NATIVE_CAPTION_MENU | …（再次）
```

### 3.4 RC-10：恢复依赖一个 YouTube 不保证会发出的事件；全程没有 session epoch

```java
// EngineResume.java
static synchronized void departed() { armed = intent && !owner.isEmpty(); }   // :55
static synchronized Session take(String video) {                              // :97
    if (!armed || !intent || owner.isEmpty() || …) return null;
    armed = false; return new Session(url, owner, sourceOnly);
}
```

`armed` 只由 `departed()` 置位（调用点：`CaptionApplication.java:69`，条件是收到 `VIDEO ""` 事件）。
**回到同一个视频时 YouTube 通常不会发空 video id**，所以 `armed` 一直是 false，`take()` 一直返回 null，`resume()`（`CaptionApplication.java:147-170`）永远不执行。

另外 `resume()` 还要求 `RebuildController.activeUrl().isEmpty()`（`:148`）——旧会话只要还残留一个 url，恢复就被挡住。

`EngineResume` 与 `CaptionChoice` 都不落盘，进程重启后全丢。

同源缺陷还有三处：

1. **陈旧的 `off=true` 压过 ON 意图。** `refreshNativeTrack` 的前置判断顺序是
   `userOff → 无 Selection → Selection.off → !enabled → !captionsKnownOn → …`（`NativeCaptionBridge.java:518-526`）。
   一个"同一视频、上一会话残留的 `off=true` 条目"会直接返回 `CAPTIONS_OFF`；而 catalog 回退只在 `DEFERRED` 时才执行（`:611` `if (refreshed == DEFERRED) refreshFromCatalog()`），**`CAPTIONS_OFF` 永远不会触发回退**。所以连"关掉再打开 AI 开关"（`CaptionQuickToggle.setEngine`）都修不回来。
   日志 `:1335` 的 `off=true;translated=false;track=`（`origin=DEFAULT`、`foreground=true`）就是这种条目；它的写入口 `markApplied` 只按 video id 判归属（`NativeCaptionBridge.java:316`），因此"上一会话同视频的 off"和"本会话的 off"在数据上不可区分。

2. **没有 epoch。** `enabled` 是全局持久值，`setEngine` 不携带 session 身份；`CaptionPlayerAuthority.setVideo` 每次都会 `restart(UNKNOWN)` 并 `ownerEpoch++`（`:166-174`），而 `CaptionButtonController` 的状态机没有对应的 epoch 校验。于是晚到的开关/选中事件会作用到新会话上。

3. **4.5 s 静默窗把最该读状态的时刻静音了。** `onPlayerTransition` 设 `transitionQuietUntilMs = now + 4_500`（`CaptionButtonController.java:41,191`），`syncNativeCaptionState` 在该窗口内直接 return（`:633`）；而首扫是 +220 ms（`:155`），维护扫是 2.5 s（`:42,472`）。新视频进入后的头几秒恰好是"字幕该出现"的几秒，也恰好是状态学习被禁用的几秒。

### 3.5 RC-11：首帧——先做决定，再做网络（用日志实测）

会话 67（同一视频、缓存命中）时间线：

| 相对时刻 | 事件 | 累计 |
|---|---|---|
| 0 | `LANGUAGE_PROFILE_BOUND` / `CAPTION_REBUILD`（1792731764667） | 0 |
| +21 ms | 首帧 "翻译中…"（1792731764697） | 21 ms |
| +43 ms | `SOURCE_STARTUP_STAGE load_begin` | 43 ms |
| +276 ms | `load_end`（cache_hit=true） | 276 ms |
| +348 ms | 源文首帧 `mode=caption;reason=pending_translation` | 348 ms |
| +741 ms | 首个译页 `caption_page` | 741 ms |
| +3884 ms | `REBUILD_LAYOUT_FALLBACK visible=false;reason=preparing_layout` | 空白 |

冷启动会话 25（1792731694652 起）：源字幕 fetch 368 ms，首次 LLM RTT **1149 ms**，首个译页出现在 +2.5 s 左右。

对比如下（原生字幕）：track list 就绪即上屏（日志 `NATIVE_TRACK_LIST_READY`，会话 49 时 `elapsed` 约 +1.1 s），不需要 fetch、不需要 LLM、不需要分页、不需要呈现闸门。

**关键对照**：同一份日志里，当状态还在时，从 `onVideoId` 到 `ENGINE_CATALOG_ACTIVATED` 只要 **96 ms**、到 `AI_STARTED` 只要 **109 ms**（1792731764667 → 1792731764763 → 1792731764776）。也就是说**流水线本身不慢**；慢的是"先做决定"这一段。

于是首帧延迟的主因排序是：

1. **决定延迟（可消除）**：意图被重置 → CC 扫描（+220 ms 首扫，之后 2.5 s 维护扫）→ 4.5 s 过渡静默窗 → `captionsKnownOn()` 闸门 → 非幂等的重复激活。
2. **非幂等的重复激活（可消除）**：状态不确定时每次进入都会 `RebuildController.activate` 重新开始。日志 `:1260-1312` 的约 6 组、每组间隔 ~120 ms 的 `ENGINE_NATIVE_ACTIVATED` + `CAPTIONS_SHOWN` 突发，以及 `:248-270` 的 `NATIVE_REFRESH_DESCRIPTOR_FALLBACK` 循环，都是同一个会话被反复重启。
3. **回环服务器阻塞（可消除）**：`LoopbackCaptionServer.trackFor` 在源缓存未命中时 `awaitSource` 最多等 **1_600 ms**（`LoopbackCaptionServer.java:44,252-265`），期间 YouTube 自己的 timed-text 请求拿不到响应；日志 `:904` 的 `NATIVE_RENDERER_MASK_FALLBACK | Source track not ready within the short wait window` 即此。
4. **呈现闸门（可消除）**：`LAYOUT_HOLD_MS=1200` 的 `caption_hold`、`preparing_layout` 的空白，以及分页在后台线程的往返。
5. **网络下界（不可避免）**：首次 fetch（冷启动 368 ms）+ 首次 LLM 往返（1149 ms）。原生字幕不付这一项，这是 AI 字幕的物理下界。

所以目标不是"让 AI 比原生快"，而是：**把 1–4 全部消掉，使 AI 首帧 = 原生首帧 + 首次 LLM 往返（热启动时仅 + 一次分页）。**

---

## 4. 为什么不能在现有机制上"调参数"解决

| 需求 | 现有机制的能力上限 | 原因 |
|---|---|---|
| 尺寸变化与评论区开关 **0 帧**同步 | ≥1 帧，实测 248 ms | 呈现结果由 layout 产生，而 layout 由异步计划 + pre-draw 触发 |
| 动画期间盒子几何正确 | 不可能 | 盒宽要重新分页才有值，分页在后台线程 |
| 旋转/竖屏也同步 | 不可能 | `commentTransitionActive` 对竖屏直接返回 false |
| 不影响 YouTube 动画 | 不可能 | 过渡期间在玩家容器上 requestLayout + measure + 每帧 VTO 改动 |
| 换版无可视跳变 | 不可能 | 端点宽 2067→1163、行 1→2，语义上就变了 |

结论：**这条流水线的下限由"采样→分类→等待→重排→下一帧"决定，改任何阈值都到不了 0 帧。必须换机制。**

---

## 5. 新方案

### 5.1 三条不变量

- **I1 呈现（位置 + 缩放）只在 draw 期由"当前帧矩阵"决定，永不经过 layout。**
- **I2 内容（文本 / 换行 / 盒）只由"事件 + 局部几何"决定，动画期间恒定。**
- **I3 会话意图只有一个持久化权威，任一新会话由幂等 reconciler 应用一次，拆卸不得写入意图。**

### 5.2 呈现层：一个自绘图层 + 每帧矩阵（替换 `applyCommentScale` 全套）

**结构**：一个 `CaptionLayer extends View`，`match_parent`，`setWillNotDraw(false)`，挂在玩家 overlay 容器里（在评论面板之下，保持现有层次关系）。它**不承载子 View**，自己画背景和文字。

**每帧 `onDraw` 的唯一算法**：

```java
protected void onDraw(Canvas canvas) {
    Matrix m = surfaceToLayer();                 // 视频平面 → 本图层坐标（含 YouTube 本帧变换）
    float s = matrixScale(m);                    // 本帧继承缩放
    float v = screenShortSide(m);                // 本帧视频在屏幕上的短边
    float g = CaptionSizeLaw.glyphPx(v, tier);   // 连续尺寸律（见下）
    float k = g / (plan.glyphLocal * s);         // 反向补偿：把“标称字号的布局”映射成“屏幕字号”
    canvas.save();
    canvas.concat(m);                            // 位置 + 几何缩放：与 YouTube 同一矩阵、同一帧
    canvas.scale(k, k, plan.centerX, plan.centerY);
    drawBox(canvas, plan);                       // 背景
    canvas.translate(plan.textLeft, plan.textTop);
    plan.layout.draw(canvas);                    // 预构建 StaticLayout，绝不 measure
    canvas.restore();
}
```

**尺寸律**（端点与现设计完全一致，中间连续）：

```java
// gF, gD = 现设计在 1264px 参考短边上的 full / detail 字号（55.5 / 44.5）
// vF = 全屏时的视频屏幕短边（= screenShort）；vD = 详情态视频的屏幕短边
static float glyphPx(float v, int tier) {
    float k = screenShort / 1264f;                       // 设备无关换算
    float gF = CaptionFontSize.fullGlyphHeightPx(tier) * k;
    float gD = CaptionFontSize.detailGlyphHeightPx(tier) * k;
    float vF = screenShort, vD = detailShortSide();
    float t = clamp((vF - v) / (vF - vD), 0f, 1f);
    return gF + (gD - gF) * t;
}
```

**为什么这是 0 帧同步（可证明）**：

1. `v` 与 `s` 只来自 `m`；`m` 在 `performTraversals` 的 draw 之前就已就绪（RenderNode 动画属性在本帧 draw 前更新）。
2. `g` 只依赖 `v`，`k` 只依赖 `g`、`s`；二者都在同一 `onDraw` 内计算。
3. 字幕与视频用的是**同一个 `m`**，所以"视频缩小 5%"与"字幕缩小对应比例"在数学上是同一个矩阵的同一帧结果，不存在"谁先谁后"。

**代价**：过渡期间每帧重绘一个小 View（两行文字）。这是可控的，且不产生任何 layout。

**对 YouTube 的影响**：零 `requestLayout`、零 `measure`、零 `VTO` 增删。YouTube 的评论面板动画完全按它自己的节奏跑。

### 5.3 计划层：按"局部几何"缓存，按"模型事件"预热

```java
// 计划键只包含动画期间不变的量
planKey = hash(eventIdentity, localInnerWidth, localGlyph, styleKey);
```

- 动画期间 `localInnerWidth`（视频局部宽 × 0.92）与 `localGlyph` 都不变 → **一次计划管整个动画**。
- 模式变化（全屏 ↔ 详情）由**模型事件**（`PlayerType` 通知）先知道，早于布局：
  `WATCH_WHILE_MAXIMIZED` → 目标为详情矩形；`WATCH_WHILE_FULLSCREEN` → 全屏矩形。
  在收到通知时就把目标 `plan` 预热好（现有 `CaptionPageExecutor.prefetch` 能力可直接复用）。
- 换页发生在 `Choreographer.postFrameCallback`（traversal 之前），与几何变化落在同一帧。

### 5.4 内容层：事件驱动，永不碰几何

- 页边界用 `Choreographer.postFrameCallback`（**不是** `OnPreDraw`）切换 `plan` 引用；`StaticLayout` 已构建好，切换是 O(1)。
- `pending → shown` 原子替换；**plan 未就绪时保持上一版，永不 `hideView()`**。
- 删除 `CaptionText.onDraw` 里的 `setText(""); hideView();`——绘制期只允许改变"画什么"，不允许改变视图状态。

### 5.5 删除清单（替换而非叠加）

`CaptionOverlayV2` 中应整体删除：

- `commentTransitionActive`（:1351）、`commentProgress`（:1380）、`commentTransitionArmed`（:159）
- `reducedVideoWidth`（:135）、`classCandidate` / `classCandidateSince`（:157-158）、`CLASS_SETTLE_MS`（:146）
- `SETTLE_MS`（:191）、`moving` / `noteGeometry` / `geometryChangedAt`（:1126-1142）
- `preplanEndpoint` / `PREPLAN_INTERVAL_MS`（:1541-1599 / :152）
- `holdingLayout` / `layoutHoldSince` / `LAYOUT_HOLD_MS`（:956-965 / :84）
- `appliedClass`、`commentCommitAt`、`commentCommitClass`、`commentPlanReady`、`commentSamples`、`sampleSheet`、`markSheetEndpoint`（:1605-1661）
- `geometryFrame()` 里的 `render()` 调用（:1167-1174）
- `render()` 里的 `applyVisibleText` 同步 `measure` 路径（:2162-2250），改为纯绘制
- `CaptionHorizontalPlacement.observe` 每次 render 重挂 pre-draw（`:2037-2054`）

`applyCommentScale`（:1404-1456）由 5.2 的 `k` 取代。

AI 侧应整体删除/降级的决策路径：

- `EngineResume`（整类）、`CaptionChoice`（整类）、`CaptionButtonController.captionIntent`
- `NativeCaptionBridge.refreshNativeTrack` / `refreshFromCatalog` / `onCaptionsShown` 作为**决策**入口（保留为"观测→descriptor"的单一观察者）
- `Selection.off` 作为**权威**（降级为投影）
- `CaptionButtonController.java:147,151` 的两处 reset
- `commitNativeCaptionOff` 里对 intent 的写入（`:652-659` 只允许写"投影"）
- `DeepSeekCaptionHook.selectionEvidence` 里的 UI 观测项（`isVisibleActive`/`captionsKnownOn`/`nativeMenuRecentlyOpened`）作为**启动**条件
- `LoopbackCaptionServer.trackFor` 里的两次 `forceNativeRendererScan()`（`:220,:248`）与 `SOURCE_WAIT_MS` 阻塞（`:44,:252-265`）
- `CaptionButtonController` 的 1800-view 无障碍遍历（`:43,:501-515`）与 `CaptionMusicSuppressor` 的 1200-view 回退扫描（`:32`）作为过渡期路径

### 5.6 AI 会话：一个意图 + 一个 reconciler（替换 `CaptionChoice`/`captionIntent`/`EngineResume`/`CaptionLifecycleRestore`）

```java
final class CaptionSessionIntent {          // 持久化、原子、带版本
    boolean aiEnabled;
    String targetLanguage;
    SourcePolicy source;
    long revision;                          // 每次用户动作 ++
}

final class CaptionSessionReconciler {
    void onVideo(String id);                // 立刻启动源字幕 fetch + 首块翻译（与播放器并行）
    void onTrackList(List<?> tracks);       // 只更新 nativeProjection，绝不写 intent
    void onCcMenuSelection(Track t);        // 写 intent（revision++）
    void onPlayerRegular();                 // 幂等应用：确保选中 track == intent 目标
    void onTeardown();                      // 只销毁 session，不写 intent
}
```

要点：

1. **意图只由用户动作写入**（AI 开关、CC 菜单里的显式选择）。原生状态是"投影"，不是权威。
   - 关键推论：`commitNativeCaptionOff` 由一次**观测**触发，绝不能升级为"用户关了字幕"。
   - 现状 `ENGINE_MODE_SAVED enabled=false;native=CAPTIONS_OFF` 的唯一生产者是 `CaptionQuickToggle.setEngine:125` + `:136`（先存 `enabled=false`，再 refresh，于是 `!enabled()` 必然返回 `CAPTIONS_OFF`，`NativeCaptionBridge.java:522`）——它确实是"用户按了开关"，不是拆卸写入。**但这也说明：拆卸阶段确实没有任何持久写入，所以"退出再进入"能带回来的只有 `enabled`，其余全靠内存，必然丢。**
2. **应用幂等**：以 `(videoId, revision)` 为键，已应用则 no-op。退出再进入同一视频 → 新 session 直接应用同一 intent，一次成功。
3. **DEACTIVATE 必须拆成三种语义**：`USER_OFF`（写 intent）、`NATIVE_RESET`（不写 intent，可恢复）、`TEARDOWN`（不写 intent）。现状把三者压成 `"native_selection"` 一个值，再用 500 ms 的 `takeAutomatic()` 去猜（`CaptionApplication.java:58-63`），这是缺陷的直接来源。
4. **不再有 `Selection.off` 权威**：新会话的显示与否只由 intent 决定；native `off` 只影响"投影/UI 图标"。
5. **去掉 `onVideoId` 里的 `CaptionChoice.reset()` 与 `captionIntent=UNKNOWN`**（`CaptionButtonController.java:147,151`）。新视频的默认值来自 intent，不来自"上一次观测"。
6. **所有事件带 epoch**：`(videoId, ownerEpoch, revision)` 三元组；旧 epoch 的事件直接丢弃。`CaptionPlayerAuthority.setVideo` 已经每次 `ownerEpoch++`（`:166-174`），但下游没有任何一处校验它。

### 5.7 首帧：把串行改成并行

```
onVideo(id) ──┬─ 源字幕 fetch（签名 URL 来自 SourceCatalog，可缓存）
              ├─ track list 观测（只用于确认 URL 与语言）
              └─ 播放器就绪观测量（player type）
                     ↓ 首块可用即开始翻译（不等 track 被 apply）
第一帧：源文直接上屏（今天已有 pending_translation 能力，只是被闸门挡住）
```

- 移除"`captionsKnownOn()` 才允许预取"的约束（保留它作为**显示授权**，不作为**预取**条件）。
- `refreshFromCatalog` 不再要求 `CaptionChoice.targetLanguage()`（已删除），改为读 intent。
- **回环服务器改为非阻塞**：立即用请求格式的兜底空轨响应 YouTube（0 等待），源镜像就绪后下一次请求再替换；删除 `SOURCE_WAIT_MS=1_600` 的 `awaitSource` 轮询（`LoopbackCaptionServer.java:44,252-265`）。这样 YouTube 自己的 timed-text 不再被我们压住。
- **删除回环路径上的 `forceNativeRendererScan()`**（`:220,:248`）：它每次都重置 `nextScanAtMs`（`CaptionMusicSuppressor.java:94-103`），使退避形同虚设。
- **分页在翻译 worker 内完成**，与译页一起随 `showEvent` 下发；删除主线程 `currentPlan`/`retryLayout`/`holdingLayout` 的往返与 1.2 s 保持窗。
- **`RebuildController.prewarm` 无条件化**（`:631-639`），使"进入即预热"不再依赖 `captionsKnownOn()`。
- 冷启动下界 = track list 就绪 + 首次 LLM RTT；热启动（缓存命中）= track list 就绪 + 一次分页（实测 198 ms 的缓存路径可复用）。

### 5.8 迁移顺序（每步可独立验收）

1. **呈现层替换**：新 `CaptionLayer` 与旧 `render()` 并行挂一周，用开关切换；指标 `presentation_lag_frames`。
2. **删除 class 状态机**：确认 `COMMENT_SHEET_ENDPOINT` 不再出现 >2 帧的值。
3. **内容去 layout 化**：确认过渡窗口内 `requestLayout` 计数为 0。
4. **意图统一**：确认 re-entry 一次进入即恢复。
5. **启动并行化**：确认 `first_caption_ms` 与原生同量级。

---

## 6. 验收指标（可直接从现有诊断管道产出）

| 指标 | 采集点 | 目标 |
|---|---|---|
| `size_lag_frames` | 视频几何变化帧 vs 字幕尺寸变化帧 | 0（允许 1） |
| `content_swap_lag_frames` | plan 切换帧 vs 目标几何帧 | 0 |
| `blank_frames_during_transition` | `visible=false` 且视频矩形有效 | 0 |
| `overlay_request_layout_during_transition` | 过渡窗口内的 `requestLayout` 计数 | 0 |
| `overlay_measure_us_during_transition` | 同上 | 0 |
| `ai_resume_on_reentry` | 新 session 应用 intent 成功 | true，且在 track list 后 1 帧内 |
| `first_caption_ms` | video id → 首个译页上屏 | 热启动 ≤ 原生 + 1 帧；冷启动 ≤ 原生 + 首次 LLM RTT |

---

## 7. 取舍与风险

1. **放弃 `TextView`**：需要自己实现无障碍（`contentDescription` 或 `AccessibilityNodeInfo`）、长按/拖动（已有 `CaptionTouchProxy` 可复用）、字体回退（`StaticLayout` 原生支持）。这是自绘方案的唯一实质成本。
2. **端点仍有一次换行变化**：设计上"详情态相对字号更大"（44.5/711 vs 55.5/1264），因此详情态每行字数更少。这是**产品参数决定的语义变化**，无法用几何连续性消除。本方案把它压缩到"与视频几何变化同一帧"，并消除其前后的空白与等待。
   - 若允许把详情态的相对字号改成与全屏同一比例，则全程可做到**零换行、零换版**——这是唯一能彻底消除端点换行的办法，需要产品决策。
3. **自绘层的 dirty 区域**：过渡期间每帧一次小 View 重绘。若目标机在低端设备上出现掉帧，可退化为"只在 `s` 变化超过 0.5% 时重绘"，仍远优于现状。
4. **`surfaceToLayer()` 的成本**：每帧两次 `transformMatrixToGlobal` + 一次求逆，属于常数级；应缓存 surface 与 host 引用，避免每帧查找。

---

## 8. 证据索引

**日志（`caption-diagnostics-1.5.7-20261023-130333.txt`）**
- `:536` `COMMENT_SHEET_ENDPOINT class=FULL;commit_to_size_ms=27;plan_ready_at_commit=false;samples=0`
- `:794` `COMMENT_SHEET_SYNC progress=0.14659686;observed=2135x853;screen=2736x1264;class=FULL`
- `:801` `CAPTION_PRESENTATION_CLASS class=DETAIL;video=0 0 1264 711;screen=1264x2736`
- `:803` `caption_hold;reason=preparing_layout;desired_box_width_px=1544;laid_out_box_width_px=1544`
- `:808` `desired_box_width_px=668;laid_out_box_width_px=1544;lines=2`
- `:811` `COMMENT_SHEET_ENDPOINT class=DETAIL;commit_to_size_ms=248;plan_ready_at_commit=true`
- `:681` / `:737` `laid_out_box_width_px` 与 `desired_box_width_px` 不同步
- `:1210-1212` `REBUILD_LAYOUT_FALLBACK … visible=false;reason=preparing_layout`
- `:1333` `ENGINE_MODE_SAVED enabled=false;native=CAPTIONS_OFF`
- `:1335-1337` `NATIVE_TRACK_APPLIED off=true` → `off=false;translated=true`（手动重选）
- `:1341,1343` `NATIVE_CAPTION_MENU`
- `:1010-1071` `NATIVE_RENDERER_SCAN_SUMMARY` / `retry_backoff_ms=320…5000`

**代码**
- `ui/…/CaptionOverlayV2.java:227-235,1145-1181,1261-1321,1351-1389,1404-1456,1465-1533,1541-1599,1605-1661,1665,1867-1888,1944-1955,2037-2054,2162-2250,2269-2285`
- `ui/…/CaptionHorizontalPlacement.java:47-70,93-97`
- `application-host/…/CaptionSurface.java:230-257,321-359,469-498`
- `application-host/…/CaptionPlayerAuthority.java:111,239-250,291-305`
- `application-host/…/CaptionPlayerTransitionGuard.java:217-227,241-274`
- `application-host/…/CaptionMusicSuppressor.java:29-32,124-160`
- `ui/…/CaptionButtonController.java:37-42,135-157,189-228,446-472,501-515,620-663`
- `ui/…/CaptionChoice.java:24-46,79-82`
- `application-host/…/DeepSeekCaptionHook.java:45-55,99-110,151-157`
- `application-host/…/NativeCaptionBridge.java:105-118,165-168,311-342,404-414,516-554,562-591,599-625`
- `application-host/…/CaptionApplication.java:54-76,127-136,147-170,265-268`
- `application-host/…/EngineResume.java:15,18,49-57,68-73,97-102`
- `ui/…/CaptionQuickToggle.java:120-173`
- `presentation/…/CaptionPageExecutor.java:83-114,150-170`
- `infrastructure/…/LoopbackCaptionServer.java:44-45,217-265`
- `infrastructure/…/DeepSeekConfig.java:12,54-60`（`enabled` 为唯一持久化项）
