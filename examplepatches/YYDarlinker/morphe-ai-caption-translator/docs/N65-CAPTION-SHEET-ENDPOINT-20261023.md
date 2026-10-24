# N65 评论区开合的字号端点：预排 + 视觉尺寸与布局解耦（1.5.7 本地构建）

> 状态：**已实现并构建 `local-1.5.7-n65`**；未签名、未安装、未发布。
>
> 输入诊断：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.6-20261023-120203.txt`
> （5,545,712 B；`Engine: Event rebuild / 1.5.6`；`Display text debug: on`；12,711 条事件）。
> 用户复测：横屏全屏经播放器 UI 打开评论区时仍卡顿；字幕字号“明显有一点滞后”。
> 构建隔离脚本：`validation/runs/20261023-n65/build-dir.init.gradle`（本次构建写入
> `build/n65`，不覆盖已发布的 `build/n39/.../patches-1.5.6.mpp`）。
> 版本：`gradle.properties` 为 `version=1.5.7` / `captionBuildId=local-1.5.7-n65`；
> `patches-bundle.json`、`patches-list.json`、CHANGELOG 仍描述已发布的 1.5.6（发布前惯例不改）。

## 1. 一句话

N63 让字号随面板连续缩放，但把“换字号”做成了**布局事实**：档位只在动画端点提交，端点又必须
等一个从未排过版的新宽度计划，于是提交后仍保留旧 layout，而 `resetCommentScale()` 在提交那一帧
就提前复位了缩放——旧 layout 以 55.5 的原生字号画了 200–300 ms。关闭方向因为 FULL 计划本来就在
缓存里（13 ms），所以只有“开”看得见滞后。

## 2. 证据（本次诊断）

59 次 `CAPTION_PRESENTATION_CLASS` 提交与之后第一条真正上屏的 `REBUILD_PRESENTED` 对齐：

| 方向 | 提交 → 字号真正上屏 | 样本 |
| --- | --- | --- |
| FULL→REDUCED（开评论区） | 277 / 294 / 273 / 292 / 303 / 303 ms | 稳定复现 |
| REDUCED→FULL（关评论区） | 13 / 14 / 13 / 18 / 15 / 13 ms | 稳定复现 |

- `60.717945 / 48.68376 = 1.247`：提交瞬间字幕比目标大 **24.7%**（线性），面积约 +55%，
  并持续到新计划落地。
- 端点 `render()` 实测 `main_apply_elapsed_ms=15/17`；全量 1,902 次渲染 p95=20 ms、max=65 ms，
  17% 超过 16 ms。
- 端点提交帧的局部矩形已经是终点（`video=0 212 1492 1051`），说明动画是**真 layout**
  （视频 2247×1264 → 1492×839），而字幕宿主 `caption_host_px` 仍是满宽 2598×1264：字幕不会
  跟着面板自动缩放，视觉字号只能由 `applyCommentScale` 提供。

## 3. 根因

1. **端点必须等一个全新的分页计划。** 开评论区时 REDUCED 宽度（1483 px，字号 44.5）的事件计划
   从未算过，`currentPlan()` 只能丢给单线程 `CaptionPageExecutor`；等待期间走
   `caption_hold`，**原样保留旧文字与旧字号**（`CaptionOverlayV2.render()` 的 hold 分支）。
2. **缩放提前复位。** `commitPresentationClass()` 在提交帧就 `resetCommentScale()`，而新字号
   要到 200–300 ms 后才到；这段时间画的是旧 layout 的原生大小，即上面的 +24.7% 弹回。
3. **只有“开”有滞后。** 关闭时 FULL 计划就是当前正在用的那份，缓存命中（13 ms）；且缩放收敛在
   1.0，复位是无操作。所以关闭看起来是对的，打开不对——与用户描述一致。
4. **动画期间每帧多读了 8 次同一块矩形。** `currentVideoBounds()` 2 次、`updatePresentationClass()`
   里 `commentTransitionActive()`+`commentProgress()` 3 次、`applyCommentScale()` 里又 3 次
   `getGlobalVisibleRect`。
5. **动画末段每帧 `setLayoutParams`。** `followVisibleText()` 用 `min(boxWidth, video.width())`
   当锚点宽度，视频窄于框宽后每帧换一次 `LayoutParams` → 播放器 overlay 容器每帧重新 measure。
   而这段缩小在视觉上是空操作（文字居中、`clipChildren=false`）。
6. **进度缺失时未拦截。** `commentProgress()` 无可见矩形时返回 `-1`，`applyCommentScale()` 只在
   端点分支用它，其余路径会算出 `scale=1.198`（偶发“放大 20%”）。

## 4. 修复

- **A 预排端点计划（消掉 200–300 ms）。** `preplanEndpoint()` 在动画中（`progress` 未到端点时）
  用与 `render()` 完全相同的宽度/字号/key 规则构造预算，交给新的
  `CaptionPageExecutor.prefetch()`：**独立单线程、只填缓存、不发布计划、不缓存空结果、不占
  真实请求的队列**。key 由抽出的 `planKey()` 生成，保证预排的就是端点要的那一份。
  端点提交时 `currentPlan()` 直接命中缓存。
- **B 视觉尺寸与布局解耦（消掉 24.7% 弹回）。** 缩放不再是“档位字号的临时补丁”，而是
  **`目标字号 / 已布局档位的字号`**：`appliedClass` 记录屏幕上这份 layout 属于哪一档，
  `applyCommentScale()` 用它算修正系数。于是提交后旧 layout 仍然按新档绘制（0.806），新计划
  落地当帧立刻重算为 1.0——提交不再复位，落地不再跳变。端点提交帧本身也补一次
  `applyCommentScale()`，保证最后一帧就是目标尺寸。
- **C 动画期间只读一次几何、不动布局。** `CaptionSurface.observedVideoRect(Rect)` 每帧一次，
  分类/进度/缩放共用；评论转场期间锚点宽度保持 class 宽度（只位移+缩放），不再每帧
  `setLayoutParams`；`progress < 0` 时保持上一帧缩放。
- **D 可观测。** 新增 `COMMENT_SHEET_SYNC`（仅文字调试开启时，48 ms 一条：progress / observed /
  scale / layout 档 / 当前档 / plan_ready）与 `COMMENT_SHEET_ENDPOINT`（每次端点一条：
  `commit_to_size_ms`、`plan_ready_at_commit`、`scale`）。旧的 `commit→上屏` 延迟从日志结构上
  就能复测。

## 5. 本轮删除的旧实现

- `CaptionSurface.visibleVideoWidth()` / `visibleVideoHeight()` → 合并为 `observedVideoRect(Rect)`；
- `CaptionOverlay.commentScale` 字段（只写不读）与 `classGlyphHeight` 字段（改为提交内局部变量）；
- `applyCommentScale()` 的“端点即复位”分支（连续公式取代）；
- `constraint`：测试影子 `visibleVideoWidth/Height` 一并删除，改为 `observedVideoRect`。

## 6. 验证

- 全量 `:extensions:extension:testDebugUnitTest`：**291 tests / 54 result files**，
  0 failures / 0 errors / 0 skipped（2026-10-23 12:41，`version=1.5.7`；
  日志 `validation/runs/20261023-n65/tests-1.5.7.log`）。
- 新增：
  - `theEndpointNeverPaintsTheOldLayoutAtItsOwnSizeWhileThePageIsPlanned`：故意放慢分页，
    断言提交帧 paint 出来的字形高度已经是 44.5（旧 layout 不再是 55.5），计划落地后 scale=1。
  - `aPrefetchedPlanIsReadyForTheRequestThatNeedsIt`：预排把计划放进缓存、只算一次、命中后不再算。
  - 更新 `theReadingSizeFollowsTheSheetScaleBeforeTheClassCommits`：中点仍 FULL 且已在缩放，
    端点后为 44.5 且 scale=1。
- 本地化 232×14；`verifyIntegrationSources` `errors=[]`（构建依赖自动执行）。
- 产物：`build/n65/gradle/patches/libs/patches-1.5.7.mpp` **580,946 B**，
  SHA-256 `53190017F4E1EAF12FACAEFEA118508D61C5C6231D352D6C800151D0E958AD70`；
  manifest `Version: 1.5.7`、`Patcher-Version: 2.0.0`；内嵌 MPE 含 `local-1.5.7-n65`；
  已发布产物 `build/n39/gradle/patches/libs/patches-1.5.6.mpp` 未被覆盖
  （SHA-256 仍为 `E272FCE127BF8B659BF83FDB77C5918D8A59A9B599FCEB60FB39438AE4DED1B1`）。

## 7. 边界

- 未连接真机：本轮验证是诊断 + Robolectric 契约 + 打包。真机应复测开/关各 5 次，抽查
  `COMMENT_SHEET_ENDPOINT` 的 `commit_to_size_ms`（目标 ≤ 16 ms）与 `plan_ready_at_commit=true`。
- 预排依赖“端点宽度 = `min(本地视频宽, 0.66×参考宽)`”这一预测；若某机型端点视频宽小于该 cap，
  第一个 key 不命中，行为退回本轮之前的路径（多等一次计划），并在
  `COMMENT_SHEET_ENDPOINT.plan_ready_at_commit=false` 上可见，不会比旧版更差。
- 临时缩放仍是 `View` 渲染变换，动画中文字会轻微栅格化；落地后恢复原生字号渲染。
- 全屏↔详情 `SLIDING` 拖动仍不缩放（上一轮契约不变）。
