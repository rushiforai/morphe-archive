# N68 · 退出再进入同一视频 AI 字幕不显示 / 特定视频字幕重复与跳变的根因与修复

- 版本基线：UI/Engine 1.5.7，core `rebuild-1.4.0/ac65fe8`，build `local-1.5.7-n71`
- 诊断：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.7-20261024-001310.txt`
- 视频字幕：`D:\下载\.deno\bin\manual\Minecraft Speedrunner VS 6 Hunters FINALE [g22Z__ShvVY].en.vtt` / `.en.json3`
- 本文只从诊断读数、这两份字幕文件和当前代码推导；不引用旧结论作为证据。

## 0. 一句话

两个问题不是同一个缺陷：

1. **再次进入同一视频不显示**：离开视频时的 `WATCH_WHILE_MINIMIZED` 把 player authority 锁成 `COMPACT`；同一视频再进入时 YouTube 复用播放器、不再发第二次 player type 回调，而当时的代码没有任何“resume 时重新核对当前播放器”的路径，`REBUILD_PRESENTED` 一直被 `blocked()` 拒绝。
2. **特定视频重复/跳变**：该 JSON3 是 `wpWinPosId` 逐词高亮轨道，每个 event 都是“整行文本的快照”。解析器只认旧的 `wWinId`，把每次高亮快照都当成新台词；同时多个 `wpWinPosId` 说话窗口被拍平成一条词流，导致整行重复 + 多说话人逐词交错。

## 1. 问题一：同一视频再次进入后 AI 字幕不显示

### 1.1 现场时间线（诊断）

```
1792771925851  REBUILD_DISPLAY_RESULT id=114:1:0:0-6 mode=caption visible=true
                text=我发现亚马逊有些奇怪。
1792771929375  PLAYER_TRANSITION_STABLE type=WATCH_WHILE_MINIMIZED;state=COMPACT
1792771931720  REBUILD_SEEK session=114;from=4000;to=81
1792771931722  REBUILD_PRESENTED id=114:2:0:0-6 mode=suppressed
                reason=player_suppressed
1792771931722  REBUILD_SELECTED id=114:2:0:0-6 time=81;text=我发现亚马逊有些奇怪。
...
1792771985968  PLAYER_TRANSITION_STABLE type=WATCH_WHILE_MINIMIZED;state=COMPACT
```

关键点：

- 会话 114 的源、译文、选中事件都在（`REBUILD_SELECTED` 有文本），不是翻译没跑；
- 同一时刻 `REBUILD_PRESENTED` 是 `suppressed/player_suppressed`；
- :29.375 之后到 :58.968 之间没有任何 `PLAYER_TRANSITION_*`，说明 authority 从未离开 `COMPACT`；
- `INTENT_SESSION` 在再进入时是 `fresh=false`，`applied_key` 未变，所以也不会重新启动会话。

### 1.2 代码链

`CaptionOverlayV2.blocked()`（`ui/.../CaptionOverlayV2.java:296`）在 `COMPACT` / `TRANSITIONING_TO_REGULAR` 时返回 true；`render()` 于是走 `hideView()` 并记 `player_suppressed`（`:1777-1786`）。

为什么 authority 一直是 `COMPACT`：

- `CaptionPlayerAuthority.setVideo()` 对相同 id 直接返回（`CaptionPlayerAuthority.java:166-174`），不会把 authority 重置为 `UNKNOWN`；
- `CaptionSessionReconciler.onVideo()` 的 session/video/epoch 未变，`fresh=false`；`appliedKey` 仍匹配，`apply()` 不会重新应用（`CaptionSessionReconciler.java:65-86,327-342`）；
- `CaptionSessionReconciler.onPlayerRegular()` 的 `needsResume()` 要求 `!CaptionActions.isVisibleActive() && !ownsNativeTrack()`；本会话仍 `visible=true` 且仍拥有原生轨，因此返回 false（`:417-426`）；
- 旧代码里唯一能重新读当前播放器类型的地方是 `CaptionOverlay.refreshSurface()`，但它在 `COMPACT` 时读完就 `return`（`CaptionOverlayV2.java:561-581`），而且再进入路径不保证调用它；
- 因此没有“resume 时核对当前 player type”的路径，`WATCH_WHILE_MINIMIZED` 会一直保留。

这不是“状态没保存”，而是**上一次观测到的紧凑状态被当成永久权威**，且没有恢复入口。

### 1.3 修复

1. `CaptionApplication.playback()`（每次播放 tick）在 authority 未 settled（`COMPACT`/`UNKNOWN`/`TRANSITIONING_TO_REGULAR`）时调用 `CaptionPlayerAuthority.reconcileCurrentPlayerTypeIfUnsettled()`；同一视频的 `VIDEO` 事件也调用一次（`CaptionApplication.java:65-78,130-144`）。
2. `CaptionPlayerAuthority`：
   - 先读官方只读当前 player type；`NONE` 不再当作有效类型（该镜像由可选的官方 hook 更新，未安装时恒为 `NONE`，不能拿它覆盖回调得到的状态）。
   - 一个已经 settles 的非滑动类型（`WATCH_WHILE_MAXIMIZED` / `WATCH_WHILE_FULLSCREEN`）从 `COMPACT` 直接恢复到 `REGULAR`，不再等一个可能永远不来的 layout 事件；滑动类型仍走几何 probe（`:235-348`）。
   - 改状态时记 `PLAYER_TYPE_RECONCILED reason=official|geometry`，下一次诊断可直接验证。
3. 兜底：若类型仍是 `WATCH_WHILE_MINIMIZED`（官方镜像不可用或回调缺失），用**当前可见播放器 surface 的真实几何**判断是不是真的 miniplayer；只有可见高度达到竖屏 15% / 横屏 40% 且宽度 ≥ 35% 屏幕宽时，才允许它推翻这一条 compact 名称（`CaptionPlayerTransitionGuard.java:247-274`）。真正的 miniplayer、Shorts、`NONE`/`HIDDEN`/`INLINE_MINIMAL` 不会被这条兜底打开。
4. 恢复时 `moveTo(REGULAR)` 触发既有 authority listener，`CaptionPlayerTransitionGuard` 的 `REGULAR` 分支调用 `CaptionOverlay.requestPlayerRender()`，既有 pending 页立即重画，不需要重新请求翻译。

### 1.4 回归

- `CaptionPlayerTypeContractTest`：compact → 官方 `WATCH_WHILE_MAXIMIZED` 直接恢复；sliding 仍等几何；stuck sliding 被下一次 settled 类型恢复；miniplayer/regular 几何判定。
- `ReintegratedApplicationTest.aCompactStateFromThePreviousVisitRecoversOnAReentryTick`：真实 port + 真实 overlay，先显示译文，收到 `WATCH_WHILE_MINIMIZED` 隐藏，同一视频 `onVideoId` + tick 后重新显示。

## 2. 问题二：特定视频字幕重复、不断跳变

### 2.1 字幕文件的实际形状

`...g22Z__ShvVY.en.json3` 有 18,532 个 event，每个 event 形如：

```json
{ "tStartMs": 307257, "dDurationMs": 260, "wpWinPosId": 3, "pPenId": 715,
  "segs": [
    { "utf8": "Incy" },
    { "utf8": " wincy spider", "pPenId": 716 }
  ] }
```

- `segs` 拼接出的是**整行文本**（`Incy wincy spider`），不是“这一步新说的话”；
- 没有 `pPenId` 的段是已经说出的前缀；带 `pPenId`（= event pen + 1）的段是同一行尚未说到的后半句；
- 同一行在连续的 event 里重复出现，只是高亮前缀变长；`wpWinPosId` 是说话窗口/行位置（1–12），多个窗口可以同时显示。

VTT 是同一轨道的另一种编码（每个 cue 一行，`<c.color…>` 标出已说/未说），所以两种文件都呈现“整行重复”的外观。

### 2.2 诊断读数

```
REBUILD_SOURCE_READY | words=20939; estimated=20939; coarse_reconstructed=true;
  coarse_cues=4903; blocks=3858; raw_fragments=102759; cue_anchors=9806;
  detected_fmt=json3
```

- 102,759 个 `segs` 被展开成 20,939 个词；
- 质量证据里的源文本直接重复：

```
"We'll not only do it again We'll not only do it again but we'll release full but we'll release full"
```

- 同一段文本被切成 b16/b17/b18/b19/b20 这类 2–3 词的块，分别请求翻译（诊断 quality evidence），于是屏幕上的译文在 `未剪辑的猎人第一人称视角。` / `由你来分析。` / `供你分析。` / `请欣赏视频。` 之间反复切换；
- 多个 `wpWinPosId` 窗口的词按时间拍平后还会逐词交错，例如 58 s 附近同一时刻有 w2 的 `There's water…` 与 w3 的 `Jump in the water!`，旧重建把两行拆成词后交错。

### 2.3 根因

`RebuildSource.json3Spans()` 原实现只处理 `event.has("wWinId")`：

- 该轨道没有 `wWinId`，只有 `wpWinPosId`，所以每个 event 都走 `spans.add(new Span(text, …))`，即“每次高亮都新增一条整行台词”；
- 没有读取 `pPenId` 的高亮语义，未说出的后半句也被当成新词；
- 没有按说话窗口成行，多个窗口的词被 `spans.sort(start)` 后交错。

结果：源词数约为真实语音的 1.9 倍，块数 3,858，重复块被独立翻译，显示层自然“不断变化、重复”。

### 2.4 修复

`RebuildSource`（`translation-core/.../RebuildSource.java:776-976`）：

1. 识别 `wpWinPosId`，走新的 `karaokeEvent()`；
2. `karaokeSpeech()` 只取**最后一个非 dim `pPenId` 段之前**的文本，得到当前已经说出的前缀；
3. 每个窗口按 episode 累积：文本是前缀增长就更新同一行；完全相同就是高亮/保持，不新增；不相关才结束上一行、开始新行；
4. 所有窗口结束后 `flushKaraoke()` 输出“一行一个 span”，而不是一个词一个 span；
5. 起点相差 ≤250 ms 的同时说话窗口合并为一条同时字幕，避免同刻两行在源流里逐词交错；重叠但起点更晚的长行不会被并进来（不会把后续台词串到上一行）。

旧 `wWinId` 逐词窗口行为保留；`wpWinPosId` 无 `pPenId` 的轨道仍按整行前缀/后缀去重。

### 2.5 真实文件结果

用同一份 6,701,998 B 的 JSON3 跑修复后的 `RebuildSource.read()`：

| 指标 | 修复前（诊断） | 修复后（本机离线） |
|---|---:|---:|
| words | 20,939 | 11,090 |
| 开头文本 | 重复的 `This video six … This video six …` | `This video six of my friends try and hunt me down and stop me from beating Minecraft. If they kill me they win. If I beat the Ender Dragon, I win.` |
| 58 s 文本 | 逐词交错 | `Oh. Yeah. Go to the right; there's water over here. He's in the top of the- Oh my god there's so many! …` |

同样的 `src/test` 合成用例覆盖：

- `karaokeWindowSnapshotsOnlyAddNewlySpokenWords`
- `theSameWordsInDifferentKaraokeWindowsAreDifferentSpeakers`
- `aKaraokeLineStaysOneLineThroughItsFinalHold`
- 既有 `coarseRollingWindowsProduceOnlyNewSpeech` / `identicalSpokenRepetitionsAreNotProofOfRolling` / `explicitAppendIsNewContentEvenWhenWordsRepeat`

## 3. 验证

```powershell
.\.devenv\dev.cmd :translation-core:testDebugUnitTest
.\.devenv\dev.cmd :extensions:extension:testDebugUnitTest
```

- `:translation-core:testDebugUnitTest`：254 tests，0 failures / 0 errors / 0 skipped
- `:extensions:extension:testDebugUnitTest`：344 tests，0 failures / 0 errors / 0 skipped
- 本地化检查：232 keys × 14 locales 通过

### 3.1 N72 测试包

- 版本仍为 **1.5.7**，本地构建号 `local-1.5.7-n72`（用于区分上一版 n71）。
- 构建命令：
  ```powershell
  .\.devenv\dev.cmd :patches:buildAndroid `
    --init-script validation/runs/20261024-n72/build-dir.init.gradle
  ```
- 产物：`build/n72/gradle/patches/libs/patches-1.5.7.mpp` **587,249 B**，
  SHA-256 `63C949BA07D468260DC091C2D135670A0DF22182F81424F890685D82AB4F0963`。
- 测试副本：`build/delivery/patches-1.5.7-n72.mpp`（同字节）；证据副本在
  `validation/runs/20261024-n72/patches-1.5.7-n72.mpp`。
- 正式发布构建（同一源码，`captionBuildId=release-1.5.7`）：`patches-1.5.7.mpp`
  **587,256 B**，SHA-256 `41D96E4B65ED9419854E02013BA71D73B884AD444683DDD559EC32E74DA77159`；
  作为 GitHub release `v1.5.7` 的资产。
- manifest 为 `Version: 1.5.7`、`Patcher-Version: 2.0.0`；内嵌 `extension.mpe` 719,208 B，
  含 `release-1.5.7`、`PLAYER_TYPE_RECONCILED`、`karaokeSpeech`，不含 `local-1.5.7-n72`。
- `patches-list.json`（1.5.6）、`patches-bundle.json`、README、CHANGELOG 未改；
  `docs/core-provenance.json` / `docs/core-upstream.patch` 已按 reviewed core adaptation 重录。

## 4. 未做 / 边界

1. **VTT 源字幕模式**（AI 关闭、只显示原文）仍走 `WebVttSourceReader`，本次没有改它的颜色高亮去重。翻译路径请求 JSON3，已由本修复覆盖；若以后要在 source-only 模式处理同一轨道，需要把同样的“已说前缀 + 按行”规则补到 VTT 读取器。
2. **真机复验**：本次只做 Robolectric + 真实字幕文件离线验证，没有连接手机。下一次真机诊断应出现：
   - `PLAYER_TYPE_RECONCILED reason=official|geometry`；
   - 同一视频再进入后紧跟 `REBUILD_PRESENTED … visible=true`，而不是一条 `player_suppressed` 后沉默；
   - 该视频 `REBUILD_SOURCE_READY` 的 `words` 明显低于 20,939，`blocks` 明显低于 3,858。
3. 没有构建 APK，也没有改发布产物；只构建了上述 1.5.7 本地测试 MPP。
