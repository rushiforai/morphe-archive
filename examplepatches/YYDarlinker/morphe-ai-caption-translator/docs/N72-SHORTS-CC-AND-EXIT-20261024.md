# N72 — Shorts 默认字幕启动与退出残留（1.5.8 本地测试）

施工基线：已交付的 `local-1.5.8-n71`，保留 N69 CC 总开关、N70 原生选轨语言权威、N71 稳定后 CC 确认加速。
输入诊断 `caption-diagnostics-1.5.8-20261024-123002.txt`（1,234,429 B），导出构建 N71；
SHA-256 `70AB383C32D53102A97541C2FA27E91F619CF9E49325B50B9729B32F1C5E1C88`。
截图中退出后的字幕“让它弹起来。”与日志 session 42 的实际显示文本一致。文件内容只作诊断数据。

## 根因

### Shorts 启动缺的是 CC 观测，不是语言

`5mU6SRS2Bxo` 进入后 92 ms 已报告当前原生默认轨道 `zh-Hans`，但 `cc=-1`。
重复 DEFAULT 事件仍保持未知；14,859 ms 后用户手选原生语言，14,870 ms 才确认 CC ON，
14,896 ms 才启动引擎。`T_SMf9j50uc` 也在默认选轨后保持 CC 未知，直到手选轨道。

普通播放器的精确 CC hook 绑定 `TouchImageView` 控制器；Shorts 默认恢复字幕的链路不保证
调用该控制器。N69 的“UNKNOWN 不显示”门禁是正确边界，但未补齐 Shorts 的 CC 初始化证据。
N70 已正确获取默认语言，N71 只是加速实际到达的普通 CC 观察，不能补出不存在的观察。
手选语言走 `PREFERRED_TRACK`，会确认 CC，因此偶然解开门禁，造成“必须手动选语言”。

### 退出缺少独立的 Shorts 生命周期撤权，绘制拒绝也没有收起旧画面

Shorts 内部播放器使用 `NONE`，旧 authority 允许可见 Shorts 容器覆盖该 compact 类型。
仓库只读取官方 `ShortsPlayerState.isOpen()` 来决定菜单，未将其关闭事件送入显示 authority。
同 Activity 导航后，旧字幕宿主/旧 reel 容器可继续存活；播放器不保证再发送不同的 type/time。
`displayPermitted()` 只记住 REGULAR，不核对曾经获得权限的 Shorts 表面是否还存在。
`geometryFrame()` 在被拒绝或缺少视频区域时直接 return，旧 TextView 的最后一帧没有隐藏。

日志记录“让它弹起来。”的成功绘制，之后 16,372 ms 才有下一次隐藏绘制；**旧日志没有
独立的退出时间戳，不能将这 16,372 ms 当成退出后实测残留时长**。退出残留由用户截图与上述
可复现的权限/绘制路径共同确认。

## 修改

- 给原生投影增加 `committed` 证据位：只有现有共享 native dispatcher 在完成过滤后提交的
  轨道才具有该位，原始选择请求/目录/预取 URL 不具有该位；待入场 handoff 保留此证据。
- 仅当前视频、真实 Shorts 表面和有效 display owner，才可用原生最终轨道初始化 UNKNOWN
  CC。明确 OFF 不被默认非空轨道覆盖；Off 和强制字幕回退不授予 ON；AI 偏好不因此改变。
  默认选轨早于表面时，现有 playback reconciliation 补做初始化，不引入新轮询。
  自动 null/reset 只撤销本次显示许可，不冒充用户明确关闭；后续真实默认轨道可完成初始化。
  仅官方仍为 open 且真实 Shorts 表面有效时，native reset 停止的会话才可恢复。
- Shorts 中不接受同 Activity 残留的普通 CC ImageView 作为其 CC 状态证据。
- 在官方 `ShortsPlayerState$Companion.setOpen(Z)` 所有返回点后通知扩展，既覆盖静态包装器
  调用，也覆盖 Kotlin 直接 Companion 调用；回调读取官方最终状态。关闭时同步撤销显示、
  隐藏 anchor、失效已排队的 render，不等待字幕/API/播放时间回调。
- 退出同时取消旧 AI 会话，清除该次访问的 CC/选轨观察；重进同一个视频也从新的默认选轨
  初始化，不保留之前 OFF 的锁存或手选语言。已经接管的普通视频不受晚到的 Shorts 关闭影响。
- 官方关闭状态优先于仍附着的 reel 容器；Surface 清除旧 Shorts/player/host 几何缓存，
  discovery 和恢复不能借旧视图重新授予权限。新的正常播放器通知仍能恢复普通视频显示。
- 退出许可同时约束启动和最终绘制；旧反馈把引擎 owner 重绑成 UNKNOWN，也不能绕过关闭。
  只有新的 Shorts open 或已证明的正常播放器 REGULAR 才能结束这项退出保护。
- 对曾由 Shorts 表面获得的显示权限，持续核对该表面仍有效；缺少退出通知但表面已消失时，
  下一次 pre-draw 收起已有画面。此路径只做当前视图有效性检查，不增加树扫描或排版。

## 验证设计

N71 未修复逻辑下先运行同批两个测试：默认轨道自动启动、表面消失后撤权，**2/2 失败**。
原始 JUnit 保存于 `validation/runs/20261024-n72/before-tests.xml`。

Shorts 专项检查默认选轨、当前语言、CC OFF/UNKNOWN、AI OFF、原始请求、后台预取、
强制字幕 Off、选轨早于表面、下一视频默认语言、普通播放器旧 CC 控件、退出时旧 reel
仍显示、返回普通视频、实际 TextView 同步隐藏、晚到绘制拒绝及没有退出回调的 pre-draw 清理。
另用真实 CaptionSurface 证明旧 reel 无法被重新发现；真实应用 + MockWebServer 检查默认
Shorts 自动显示法语译文、关闭后实际译文不会被后续 tick 再次画出。

补丁合成需要官方 Morphe 1.48.0 与真实 YouTube 输入，序列化后检查每个官方 setter 返回点
均调用生命周期桥，以及桥仍读取官方 isOpen。验证产物仅本地保存，不签名、不发布到 GitHub。

本轮尚无实体设备连接；手机上的实际入场、滑动、返回导航最终仍由用户复测确认。

## 最终验证与交付

- core **254** + extension **410** = **664 tests**，0 failures/errors/skipped。
  Shorts 专项 **20/20**；N71 未修复时的两个直接合同 **2/2 失败**，最终均通过。
  另有真实 Surface 生命周期测试与两项真实应用/API/显示回归。
- N69 CC、N70 原生默认/手选语言、N71 启动时序全部回归通过；虚拟时钟的普通播放器
  稳定后精确 CC 确认 **0 ms**、扫描 **120 ms**，不是手机端完整字幕耗时。
- 本地化 232×14、源码/compiled core/独立 UI 依赖边界及 MPP/MPE 检查通过。
- 官方 Morphe **1.48.0** + YouTube **21.41.525 / 21.23.492** 的真实 Patcher 合成、DEX 序列化
  和序列化代码审计通过；所有官方 Shorts setter 返回点连接生命周期桥，桥读取官方最终状态。
  此项只验证代码合成及序列化，未进行整包资源重编译、签名或实体安装。
- 交付：`build/delivery/1.5.8-n72/patches-1.5.8.mpp`，**589,508 B**，
  SHA-256 `B5F02DDD861EE695DC15EFF6B0ECB264ECC86F01455275935E717ADF39F06A95`；`local-1.5.8-n72`，Version 1.5.8 / Patcher 2.0.0。
- 原公开 1.5.7 及 N69/N70/N71 包哈希保持原值。原有 `build/n72/` 历史输出不复用，
  本轮输出使用 `build/n72-shorts/`，公开订阅及 GitHub 未变更。
- ADB 未连接设备。最终实体导航、滚动及字幕效果仍待用户复测；诊断可核对
  `reason=shorts_native_commit`、`SHORTS_DISPLAY_REVOKED` 和 `build=local-1.5.8-n72`。
