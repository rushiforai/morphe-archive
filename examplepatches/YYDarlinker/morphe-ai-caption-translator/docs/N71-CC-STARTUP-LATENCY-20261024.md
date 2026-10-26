# N71 — 播放器稳定后及时确认 CC（基于 N70 的 1.5.8 本地修复）

输入：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.8-20261024-111129.txt`，
导出构建 `local-1.5.8-n69`。施工基线为已交付的 N70 代码，保留 CC 总开关和当前视频选轨权威。

## 根因及证据

以日志 `VIDEO_SWITCHED` 为起点，排除“翻译中…”占位：

| 视频 | CC 确认 | 源字幕加载/处理 | 首条实际译文总耗时 |
|---|---:|---:|---:|
| rVuwIr4wiPw | 182 ms | 599 ms | 1,781 ms |
| 9bgM_nJfxZM | 4,524 ms | 1,166 ms | 7,251 ms |
| Ad3HP6iRyUE | 4,521 ms | 476 ms | 6,317 ms |
| 40aK8ibU0fg（译文缓存命中） | 4,521 ms | 165 ms | 4,762 ms |

`Ad3HP6iRyUE` 在入场约 27 ms 后已记录播放器 `REGULAR`，仍在约 4.52 s 才确认 CC。
缓存命中视频也先等 4.52 s，排除了模型生成是该固定等待来源的解释。

代码有两条独立问题：

1. **同一次转场写入两个保护期限，稳定只解除一个。**
   `onPlayerTransition()` 设置 `transitionQuietUntilMs = now + 4500`；旧 AI 仍可见时，
   还经 `ignoreFor(4500)` 写入 `ignoreUiStateUntilMs`。换视频先进入新 owner 的 UNKNOWN，
   此时上一视频引擎还没停止，正好命中这个分支。随后 `onPlayerStable()` 虽清除转场期限，
   `ignoreFor(900)` 的 `Math.max` 仍保留较远的 4.5 s 输入期限。
2. **已排到远期的扫描不能被更早的稳定信号替换。**
   旧 `scanPosted` 只有“已排队/未排队”，稳定回调请求 120 ms 后扫描时可能直接返回，
   最后仍等旧任务或 2.5 s 的维护扫描。

N69 正确增加了“新视频 CC unknown，确认 on 才启动”的门禁；这两条旧保护问题因此挡住
整个源字幕/翻译启动链。N70 保留同一 CC 控制器，所以本轮在 N70 上作修复。

## 方案与保持的边界

- 转场保护和触摸/菜单/渲染反馈保护分开：转场不再向通用输入保护写入第二个 4.5 s 期限。
  新视频清除上一视频的输入保护；新视频 CC 仍从 UNKNOWN 开始。
- 只有 `CaptionPlayerAuthority.displayPermitted()` 证明真实播放器为 REGULAR 时，稳定回调
  才解除转场保护。几何探针以 safe blank 结束的回调不授予快速确认路径。
- 稳定后将本视频精确控制器的读取重新排到主线程；读取最终控件状态，校验 callback generation
  和当前 Activity 根窗口。没有本视频精确回调时，保留真实当前控件扫描。
- 扫描只保留一个最早截止的任务，更早的稳定请求可以替换原来排到远期的任务；旧 generation
  和已被替换的任务均失效。不加入逐帧树扫描或新的常驻轮询。
- 正常 CC ON 可以立即确认；同一视频已有字幕时，转场后的临时 OFF/UNKNOWN 继续由独立
  900 ms 窗口防抖。真实 CC 触摸和原生菜单的明确关闭仍通过原命令立即停止字幕。
- CC OFF/UNKNOWN 不启动；只有真实 CC ON 也不会创造语言。选轨、原生/default 语言同步、
  URL、请求取消和最终绘制门禁继续使用 N70 逻辑。
- 增加 `CC_STARTUP_READY`：`video_to_cc_ms`、`stable_to_cc_ms`、`source=exact|scan|menu`，
  仅在观察到 CC 由非 ON 变为 ON 时记录，便于手机复测确认等待是否解除。

## 验证方法

在仅增加测试复位入口、未改运行逻辑的 N70 上执行同一批 9 个时序合同：**5 项失败**，
对应稳定后仍无法及时启动/确认、远期扫描阻塞以及关闭状态确认继续受旧长窗口阻塞。
原始结果保留在 `validation/runs/20261024-n71/before-tests.xml`。

修复后使用真实 ImageView、真实播放器 authority listener 和应用命令端口，在 Robolectric
虚拟时钟中验证：

- 精确回调和无精确回调的扫描两条路径，都在稳定后 200 ms 内确认 CC 并启动；扫描测试专门
  先让旧任务停在 4.5 s 截止点，防止精确回调掩盖调度问题。
- 转场未稳定/safe blank、CC OFF、CC UNKNOWN、AI OFF 均不能靠快速确认启动字幕。
- 瞬态 OFF 不停止当前 AI；持久 OFF 能停止；真实关闭点击在保护期内立即生效。
- 已隐藏但属于当前窗口的精确控件可以报告状态；另一个 Activity 的控件不能授予权限；
  延迟读取使用控件最终状态；CC ON 没有真实选轨时仍等待。

实际应用 + MockWebServer 另验证稳定后新视频引擎及时启动并显示该视频的法语译文，以及
CC OFF 的快速扫描不会触发新视频的源字幕获取或翻译请求。

测试时钟验证的是 CC 观察与调度阶段，不等同于手机上完整首译文的真实耗时。源字幕加载和
供应商响应仍影响实际首条字幕时间；尚待用户用 N71 包进行实体设备时序复验。

最终验证：core **254** + extension **387** = **641** tests，0 failures/errors/skipped；本地化 232×14；独立 UI/MPP 构建及包内检查通过。

虚拟时钟结果：稳定后精确回调 **0 ms**，独立扫描 **120 ms**；对照 N70 的 9 个合同 5 失败，修复后 15 个合同全通过。

本地包 `build/delivery/1.5.8-n71/patches-1.5.8.mpp`，**587,241 B**，SHA-256 `EA8FB889CC2A794577F088BE50969ECF0628BD27E38F6BD3CB4B2F3454A6B292`。
