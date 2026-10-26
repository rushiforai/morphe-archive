# N69 — CC 显示权威与 AI 模式分离（1.5.8 本地测试）

输入：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.7-20261024-103945.txt`。
施工基线：`de844402776e1046a5bec87aac94e2e65f05bea7`，公开版本 1.5.7。
本地开发分支：`codex/fix-cc-authority-1.5.8`。

## 用户要求与状态表

播放器原生 CC 是显示总开关；AI 开关只选择显示方式。源轨与译文轨都服从这个规则。

| 原生 CC | AI 开关 | 允许显示 |
|---|---|---|
| 关 | 关 | 无 |
| 关 | 开 | 无；保留 AI 模式和目标语言 |
| 开 | 关 | YouTube 原生字幕 |
| 开 | 开 | AI 字幕组件；原文轨不调用翻译 API |
| 未确认 | 任意 | 不启动/提交可见 AI 字幕，等待真实 CC 控件 |

目标语言继续由 YouTube 原生字幕菜单选择。开关不会创造视频中不存在的字幕轨道。

## 根因

1. **同一个持久位混装两种含义。** `CaptionSessionReconciler.onUserOff()` 在 CC 关闭时
   `userToggled(false)`，而 `DeepSeekConfig.enabled` 仍然是 true。随后 CC 打开的观测路径
   `onObservation()` 只会 `apply()`，它又因持久 `aiEnabled=false` 提前返回。用户看到 AI
   开关仍开着，字幕却不能恢复。日志在 `1792809570464`、`1792809571191`、
   `1792809572970`、`1792809573498`、`1792809574401` 连续写入 `INTENT_USER_OFF`，
   revisions 55–59；关闭再打开 AI 后 revision 61 才再次 `INTENT_APPLY applied=true`。
2. **启动和恢复没有 CC 门禁。** `onUserSwitched(true)`、`onVideo()`、播放器 tick 的
   `needsResume()/apply()` 都只检查 AI 意图和目标；`commitNativeCaptionOff()` 仅保存观测，
   不停止显示。`rewriteUrl()` 与应用命令也可直接启动引擎。因此 CC off 时切 AI on 能显示字幕。
3. **点击判定受 AI 可见性反向污染。** `shouldTurnOff()` 将 `aiVisible` 放在最高位，
   即使真实 CC 已明确 off，也仍把下一次点击当作 off。连续 off 记录与这条路径一致。
4. **真实 CC 回调可能在忽略窗中被丢掉。** 旧控制器只为菜单候选安排重读；普通 on/off 回调
   发生在启动忽略窗或播放器过渡窗时，可能再无一次精确读取。
5. **引擎停止改变 owner epoch。** 旧 reconciler 要等下一次播放 tick 才更新 session epoch；
   CC 关闭后立刻使用原生菜单时，真实当前回调可能先被判 stale。日志在 off 之后伴随
   `NATIVE_OBSERVATION_STALE epoch=7;session_epoch=6` 等记录。
6. **AI→原生的交接缺少原生数据。** 译文请求被换成 loopback 空字幕轨道；只放开原生绘制
   不能让已加载的空轨道变回字幕。既有 `SubtitleWindowView.draw` 钩子已经能根据 AI 开关
   遮挡原生绘制，无需再用空轨道表达显示开关。

## 修改

- CC off 只写显示许可并停止引擎，清空已应用 key；保留 AI 开关、目标和 revision。
- CC on 重新应用保留模式；兼容旧 1.5.7 中 feature=true/session=false 的分裂记录。
- CC 控件的 settled off/on 观测也停止/恢复显示，不依赖触摸事件；忽略窗结束后重读真实控件。
- `shouldTurnOff()` 优先使用明确的 CC 状态，未知时再用已知许可/AI 可见性推断。
- `apply()`、恢复判断、原生请求入口、应用启动命令都要求 CC confirmed on；最终 overlay
  提交再次检查，阻断晚到的译文/排版结果。
- 新视频先清除上个视频的 CC 许可，再处理原生轨道和会话启动；同一视频重入保留已知状态。
- 接受真实当前 owner epoch 的回调时先重新绑定 session，旧 epoch 仍拒绝。
- 原生菜单语言选择只更新目标并开启 CC，不改变 AI 开关；移除 `apply()` 偷开 feature 的写入。
- 保留 YouTube 原始字幕请求，AI 只在旁路启动对应会话；AI on 由 draw hook 遮挡原生，
  AI off 后原生视图可立即使用已加载的真实轨道。历史 loopback 类和它的兼容测试仍保留。

## 验证与交付

回归覆盖实际应用端口、MockWebServer 源/供应商传输、真实 Android ImageView 的触摸/点击顺序和
保留的 TextView，包含：连续三轮 CC off/on、CC off 切 AI 开关、原生菜单不偷开 AI、仅控件
观测的关闭/恢复、source-only CC 循环且 API 零调用、迟到排版不能上屏、停止后立即原生菜单选轨。
独立 UI 几何测试显式设置 CC on 作为显示前提。

验证结果与产物清单见 `validation/runs/20261024-n69/`，本地包使用
`version=1.5.8` / `captionBuildId=local-1.5.8-n69`。构建输出隔离在 `build/n69/`。
公开订阅元数据仍描述已发布的 1.5.7；本次只交付本地测试 MPP。

ADB 检查未发现连接设备，未签名或安装 YouTube APK，也没有进行实体设备视觉验收。

最终验证：core **254** + extension **352** = **606** tests，0 failures/errors/skipped；独立 UI/MPP 构建成功。本地化 232×14。

交付 `build\delivery\1.5.8\patches-1.5.8.mpp`，**587,455 B**；SHA-256 `A724EC503305B8FCA05224A76B7C048B52EC3D35709C1A9F6278C8469E15A5AF`。包内版本/构建标识、MPE 一致性、14 个语言文件和发布旧包哈希均已校验。
