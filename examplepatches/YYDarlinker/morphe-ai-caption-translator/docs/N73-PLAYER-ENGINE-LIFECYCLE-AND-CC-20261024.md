# N73 — CC / AI 连续开关与同视频恢复（1.5.8 本地测试）

基线为 N72。输入 `caption-diagnostics-1.5.8-20261024-132259.txt`，284,098 B，
导出 `local-1.5.8-n72`；SHA-256 `7BB55CDDA7D07B76CD48E13F3F51CE375F7E9B17444D946C21CD21534FAAF372`。
诊断内容作为数据处理，不作为施工指令。

## 用户要求与状态合同

| 原生 CC | AI 开关 | 显示结果 |
|---|---|---|
| 关闭 | 关闭 | 无字幕 |
| 关闭 | 开启 | 无字幕 |
| 开启 | 关闭 | YouTube 原生字幕 |
| 开启 | 开启 | AI 组件显示当前原生选轨对应语言 |

未知 CC 等待真实观察，不授予显示；离开真实播放界面时收起字幕并阻止旧结果绘制。
CC 操作不改 AI 偏好，AI 操作不改 CC 或选轨；新视频语言只读取当前 native model。

## 根因与证据

1. **AI 会话停止错误地关闭了真实播放器 authority。** `CaptionApplication.stopped()`
   调用 `CaptionPlayerAuthority.close()`，所以 CC OFF、AI OFF、自动 reset 和切换语言都
   清掉仍在播放的播放器类型并增加 owner epoch。`sessionOpened()` 又试图用引擎创建
   重开播放器。N72 的 `shortsExitBlocked()` 会在曾关闭 Shorts 后拦住 CLOSED/UNKNOWN，
   因而启动会话前被挡住，根本走不到“引擎重开播放器”这一步。
   `reconcileCurrentPlayerTypeIfUnsettled()` 也不处理 CLOSED；没有新 type 通知就无法恢复。
   这是 N72 退出保护和既有引擎回调的组合回归，不是供应商翻译请求变慢。

   日志中 CC ON `1792819309519` / `1792819313486` 后均有当前 native track 的正向提交，
   但到下一次 CC 操作前没有 `INTENT_APPLY`。末尾 AI ON revision 97、99 均记录
   `session=false`，随后没有应用。真实播放器仍在播放。

2. **同 Short 的新访问默认选轨先于 VIDEO 到达时被丢弃。** Shorts 关闭时 bridge 将
   `visibleVideo` 清空，但旧应用端 video id 仍存在。新 DEFAULT 到达时，旧代码只与应用端
   id 比较，将其误当为已消费的 foreground 事件；随后同 id 的 VIDEO 清空 projection，
   没有 pending handoff 可以恢复。日志 `mUNahXeLRek` 的新默认提交在 VIDEO 前 **68 ms**，
   与该路径一致。上一视频语言缓存不应被重用，但刚到达的新 native 观察必须保留。

3. **直接 CC 操作没有被完整识别。** 实机日志的直接 CC OFF/ON 是 `origin=DEFAULT;
   reason=1`；语言菜单是 `PREFERRED_TRACK`。原代码只将后者作为明确用户操作，导致
   Shorts 的 CC OFF 可被记成临时 UNKNOWN，随后被默认非空轨道重新开启；反向开启也
   不能解除之前的明确 OFF。实际 dispatcher 的 committed 观察需识别这条原生 CC 操作路径。

上一轮独立 Shorts 与开关测试遗漏了“先退出 Shorts，再在真实应用中连续操作普通播放器”
这一历史上下文，也未覆盖新的同 id DEFAULT 在 VIDEO 前到达的顺序。本轮补真实应用端口、
源字幕/API 请求、retained TextView 的闭环验证。

## 实现

- 引擎 `sessionOpened/stopped` 不再写播放器 authority。实际 Activity/video/type/Shorts
  生命周期继续拥有播放器状态；引擎 stop 已通过 publication revoke、overlay clear 和取消
  请求使旧输出失效。CC/AI/语言切换只管理字幕会话。
- N72 的官方 Shorts 关闭桥、立即收起、旧 render 拒绝与退出保护保留；停止 AI 不再破坏
  正常播放器的 REGULAR/type/owner epoch，因此恢复不依赖额外的 type、时间或导航事件。
- bridge 使用当前已提交访问的 `visibleVideo` 判断 pending handoff；同 id 的新真实观察
  可在下一 VIDEO 消费一次。过去已经消费的手选结果仍不可回放；继续校验 live manager 的
  model video 与 track 所属。诊断 foreground 也按同一访问标准报告。
- 仅已提交 native 事件的 `reason=1` 或 PREFERRED_TRACK 作为明确 CC/菜单用户操作；
  原始请求、目录、后台预取与普通 DEFAULT 不具有该权限。明确 OFF 不被 DEFAULT 覆盖。
  incoming handoff 保留这次明确 CC 状态；新增 `NATIVE_CC_COMMAND` 供复测定位。
- 不修改 pinned translation-core、原生 URL、API 协议或目标语言选择策略。

## 验证设计

修改前在 N72 新增 9 项恢复/优先级合同，**6 失败**；补充 3 项 native DEFAULT/reason=1
合同，**3 失败**；合计 **12 项中 9 失败**。JUnit 原件在
`validation/runs/20261024-n73/before-junit/`。

修复后另加入真实应用 + native bridge 的 Shorts 同 id 新语言恢复、Shorts CC OFF→AI
OFF/ON→CC ON 的完整链路，共 14 项 N73 新合同。既有 CC/语言/启动/退出不残留合同继续回归。
真实应用检查不使用虚构播放器来代替 engine stop，而是执行真实 `RebuildController.stop()`。
两个旧 bridge 单测 fixture 补齐实际 hook 必然先发生的视频访问登记，不改变其行为断言。

还需检查官方 1.48.0 / 实际 YouTube 输入的合成和序列化 DEX，确认最终
`CaptionApplication.stopped/sessionOpened` 两个回调不再调用播放器 authority，且 Shorts
生命周期 hook 仍存在。实体设备行为由本地包复测；自动测试不等同于手机视觉验收。

## 最终验证与交付

- core **254** + extension **424** = **678 tests**，0 failures/errors/skipped。
  新增 N73 合同 **14/14**；未修复 N72 的对应基线为 12 项 / 9 失败。
  Shorts 专项合计 **23/23**，CC 时序 **15/15**；虚拟稳定后 CC 精确 0 ms / 扫描 120 ms。
- 真实应用验证“退出 Shorts 后全屏视频 CC/AI 连续开关”“同 Short 新默认在 VIDEO 前到达”
  “DEFAULT/reason=1 CC OFF→AI OFF/ON→CC ON”。不靠补发 type/time 来掩盖恢复问题。
- 官方 Morphe **1.48.0** + YouTube **21.41.525 / 21.23.492** 实际 Patcher 代码合成、
  DEX 序列化和审计通过；两项引擎回调不再写播放器 authority；官方 Shorts 关闭 hook 保留。
  此项未做资源重编译、签名或实体安装。
- 本地化 232×14、源码/compiled core/独立 UI 依赖边界通过；MPP/MPE 一致。
- 交付 `build/delivery/1.5.8-n73/patches-1.5.8.mpp`，**589,636 B**，SHA-256
  `DC5288B37BF8CF4D73A9E07C8CAEAEEEFFAD1657E1D4C5A909C35F3CA88BA4B6`；`local-1.5.8-n73` / Version 1.5.8 / Patcher 2.0.0。
- 交付文件在所有 Gradle/合成任务完成后复制，避免构建任务刷新 manifest Timestamp 改变
  外层包哈希；原件与交付字节一致。旧 1.5.7、N69/N70/N71/N72 包保留原哈希。
- ADB 无设备；尚未做实体设备视觉复验。本轮仅本地测试，公开 GitHub/订阅仍为 1.5.7。
