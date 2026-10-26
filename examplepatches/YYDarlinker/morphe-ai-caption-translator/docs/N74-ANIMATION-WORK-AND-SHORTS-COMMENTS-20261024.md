# N74 — 动画路径减负与 Shorts 评论区字幕视口（基于 N73）

## 范围与输入

用户指出两条动画路径：详情页退出到小窗时 AI on 更卡；横屏全屏中通过播放器评论图标开合
侧边评论面板时，AI/CC 开关不同状态下都可能卡。同时 Shorts 打开底部评论区后可能不显示
或剪裁字幕左右文字。用户截图明确字幕可用区域包括缩小画面左右黑边。

活动基线 `local-1.5.8-n73`，施工前 38 个文件逐一核验并备份在
`validation/runs/20261024-n74-animation/before-files/`。
输入诊断为 `caption-diagnostics-1.5.8-20261024-155621.txt`（1,036,461 B）和
`caption-diagnostics-1.5.8-20261024-160047.txt`（248,335 B），两者均导出 N73。
截图副本和结构化证据在同一验证目录。

## 已证实的原因与证据边界

1. **诊断的 context 重载在主线程解密凭据。** `CaptionDiagnostics.mark(context, stage, detail)`
   是 synchronized 方法，每次调用 `SecureApiKey.credentialRef()`，它又调用 load / Android
   Keystore / AES-GCM。播放器状态、几何重排、原生字幕观察等大量主线程调用都使用这个重载，
   无论 AI 开关是否开启。磁盘写入虽在后台，解密仍留在调用方，违反既有热路径设计。
2. **N73 保留引擎后，原生 renderer 探测仍可在 COMPACT 路径执行。** 即使播放器已缩到小窗，
   retained engine 的 ownsNativeTrack 仍为 true，40 ms tick 和强制刷新能继续查找 view tree。
   同时，无字幕内容时，overlay 的空帧和类型回调仍可进入权限/几何/渲染逻辑。
3. **Shorts 将画面宽度误当成字幕可用宽度。** 评论区动画缩放中央视频后，字幕仍可使用两侧
   黑边；旧代码却按中央 surface 矩形缩小分页预算、紧凑测量和放置参考。新诊断仅 534 条记录
   就有 54 次 CAPTION_STABLE_REPLAN，框宽出现从 986 到 418 的 23 个档位，并有 17 次
   original_fallback 隐藏。多次预算切换、缩小字号和旧框布局交接同时解释了空白/边缘剪裁风险。

第一份日志有 406 次 REBUILD_PRESENTED，其中记录的局部主线程 apply 最高 55 ms，81 次
超过 16 ms；这些不是完整窗口 FrameMetrics，不能当作 FPS 或掉帧统计。日志也没有未打本补丁
的 YouTube 同机 A/B，因此不能断言横屏评论区的全部卡顿均由本补丁造成。本轮移除的是明确
存在、可独立复现的补丁开销；原生动画本身的剩余问题需要手机对比。

## 实施方案

- 3 参数诊断入口只捕获选中 profile 对应的**加密**值；不加载完整设置、不解密、不等待
  ApiProfiles.LOCK。活动 profile id 是 SharedPreferences 的原子快照，后续使用固定 id 读取
  该 profile 的密文；它仅用于诊断脱敏，不作为网络凭据。网络 load 原有 origin 校验和设置
  锁保持。持有凭据引用的 4 参数热路径保持原样。
- writer 在线程内解密密文快照，复用既有最多两个/五分钟的有界明文缓存，再脱敏和持久化。
  记录保持入队时间；排队期间换 key/profile，旧记录仍以旧密文正确脱敏。无效密文继续走模式
  脱敏并标记 unavailable，不输出密钥或密文。
- renderer 的新树查找只在播放器 displayPermitted 时执行；小窗中不继续自循环发现。已知
  renderer 保护保留，回到 REGULAR 由原有生命周期信号恢复；AI off 继续恢复原生 alpha。
- 空白 overlay 在类型通知后仅失效几何缓存，不做排版或诊断提交；无内容且无可见旧画面时，
  pre-draw 和排帧入口直接返回。authority 更新与 Shorts 关闭/CC 许可仍照常执行。
- Shorts 的字幕视口横向采用字幕宿主的可用宽度（含左右黑边、扣 padding），纵向继续使用
  当前视频区域。将视口用于所有 overlay 预算、几何跟随、定位及拖动；不修改真实 Surface
  几何或播放器权威。评论区只改变高度时，原宽度、字号和分页保留，只调整垂直位置。
- 普通视频/横屏侧边评论区继续使用原画面宽度、连续字号与分页规则；没有把竖屏策略套到横屏。

## 回归方法

N73 的四个直接故障合同均失败：动画诊断在调用方解密（含 AI off）、排队换 key 的调用方解密、
Shorts 评论区改变分页预算。原始 XML 保存在 before-*.xml。

新增合同覆盖：20 条动画诊断调用方零 key read/后台只解密一次；AI off；换密钥后的精确脱敏；
profile 解密锁被占用时记录调用不等待；小窗 retained engine 零 renderer 树扫描并能在返回
REGULAR 后恢复；AI off 零发现；Shorts 有计划译文与无计划原文均保持内容完整、宽度/字号
不变、左右边界留在宿主内，开关评论区不触发新分页。

既有 Shorts 水平居中矩阵按新要求改为字幕视口中心；普通视频、全屏、RTL/LTR 方向仍保持原
合同。显示语义断言允许合法软换行；内容完整性与可视左右边界由专项测试单独断言。全部 N69–N73
的 CC、语言权威、启动、小窗/Shorts 退出和再进入测试继续运行。

本轮构建标识 `local-1.5.8-n74`，输出 `build/n74-animation/`，交付
`build/delivery/1.5.8-n74/`。实际动画流畅度和 Shorts 的设备渲染结果仍待用户使用新包复验。

## 最终验证与本地交付

- core **254** + extension **433** = **687 tests**，0 failures/errors/skipped。
  新增 9 个合同全部通过；N73 上的四个直接问题合同 4/4 失败，保留原始 XML。
- 动画诊断 20 条：调用线程 key read **0**，writer 解密 **1**；N73 同批调用在主线程读取 20 次。
  加密快照测试覆盖密钥轮换和 profile 解密锁争用，既有凭据引用/脱敏回归继续通过。
- Shorts 评论区测试：预算宽 **974 → 974**、分页调用 **1 → 1**；源字幕与译文均验证文字完整、
  横向边界在包含黑边的字幕宿主内。该数字属于测试场景，不是手机截图的绝对像素承诺。
- renderer 在小窗/SLIDING 的辅助查找为 0，REGULAR 后恢复；滑动期间 display authority
  保持允许，避免把性能优化变成字幕错误消失。
- N73 的 application、player authority、CC controller、native projection、selection reconciler、
  native bridge、surface 源码逐一 SHA-256 与施工前一致。CC 时序仍为虚拟精确
  0 ms / 扫描 120 ms。
- 本地化 232×14；源码、81 个 compiled core 类和独立 UI 边界检查通过；UI/MPP 构建通过；
  内嵌 MPE 与独立 MPE 相同，包内 `local-1.5.8-n74`，Version 1.5.8 / Patcher 2.0.0。
- 本地包 `build/delivery/1.5.8-n74/patches-1.5.8.mpp`，**590,269 B**，SHA-256
  `344FF653153C9889C27D9EF426CA2561B7EACB5939808A460770290FE9108D36`。旧 1.5.7 / N69–N73 包哈希保持原值；完整 N73 恢复检查点见 checkpoint.json。
- 未发布远端、未安装实体设备。手机上的实际帧率、剩余原生动画开销及最终视觉效果需要新包复测。
