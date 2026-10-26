# N75 — Shorts 历史记录/同视频重新进入后的就绪协调（基于 N74）

## 输入与直接证据

两份输入均导出 `local-1.5.8-n74`：
`caption-diagnostics-1.5.8-20261024-164802.txt` 与 `165150.txt`。
源码、测试和状态在施工前保存到 `validation/runs/20261024-n75-shorts-reentry/before-files/`，
原 N74 MPP SHA-256 为 `344FF653153C9889C27D9EF426CA2561B7EACB5939808A460770290FE9108D36`。

第一份日志的同 Short `PgGj6WKcf5w`：

1. `1792831658251 SHORTS_DISPLAY_REVOKED`：退出后取消旧会话并清除本次选轨/CC。
2. `1792831659377` 新 DEFAULT 提交中文原文，`1792831659412 NATIVE_SELECTION_HANDOFF` 成功。
3. `1792831659429 CAPTION_NATIVE_SELECTION`：语言 zh 正确，但 CC=-1，此时 Shorts 表面尚未就绪。
4. `1792831659793 PLAYER_TRANSITION_STABLE`：381 ms 后播放器变 REGULAR，未见 CC ON 或新引擎。
5. 两秒后同 ID VIDEO 仍 `fresh=false`，随后用户退出；第二次重新进入重复相同链条。

第二份日志的 `em6XoSNWzG8` 也在退出后拿到新的 zh-Hans DEFAULT、完成 handoff，却没有
在延后就绪时启动字幕。正常第一次进入有 CAPTION_REBUILD，重新进入没有，且 API 没有供应商
或结构错误，故障发生在允许启动之前。

## 根因

- 选轨与播放器就绪是独立事件。原生提交到达时会尝试协调 CC；当时表面还未验证，就正确地
  等待。后来 authority 进入 REGULAR 的恢复路径只唤醒 overlay 和普通 CC 控件观察，没有
  唤醒字幕会话。Shorts 没有普通 TouchImageView CC 回调，因而卡在 UNKNOWN。
- 原来的 recoverShorts() 只在 COMPACT / UNKNOWN / 指定 CLOSED 状态探测。实际恢复可以先
  由几何将 state 设为 REGULAR，而 Shorts 表面缓存仍为空；它因此再也不重新验证这个表面。
- 同 ID、同 owner epoch 重入让 session 显示 fresh=false；原 onVideo 仅 apply，不再次协调
  Shorts CC。此前测试手动补充了 type/time 或在表面就绪后选轨，未覆盖这次事件顺序。
- 表面探测本来有 250 ms 的负缓存节流；已经出现真实就绪信号时，还需允许一次新验证，否则
  较早的负探测可能继续阻塞本次唯一事件。

## 方案与约束

- 官方 Shorts open、真实 REGULAR/几何就绪和当前 VIDEO/原生观察可以请求一个主线程任务。
  它只在 REGULAR、owner 有效、当前 Shorts 恢复候选成立时执行，不在动画/authority 回调里
  同步启动源加载，不增加 timer、逐帧轮询或永久监听。
- 同 epoch/video 的请求合并；投递时绑定 epoch、视频和协调 generation。关闭/teardown/
  新 session 撤销旧任务，执行时重新读取当前轨道和 CC，不保留旧语言或旧 CC 快照。
- 几何/REGULAR/open 强就绪信号允许重验一次之前为阴性的 Shorts 表面；普通 VIDEO/观察
  仍保留负探测节流，避免在未就绪时形成频繁 view tree 搜索。
- REGULAR 但 Shorts 表面尚未绑定时允许重新验证。普通已明确 MAXIMIZED/FULLSCREEN 的
  播放器不会仅凭旧 Shorts open 标记获得 Shorts 许可。
- 仍只用本次 foreground 的 committed native track 初始化未知 CC；用户 OFF、AI OFF、
  无新选轨、后台轨道、已退出表面均不能被就绪事件覆盖。N70 的语言权威和 N73 的引擎/播放器
  生命周期分离不回退。
- 新增 SHORTS_READY_RECONCILE 记录触发来源、CC 前后、当前选轨和引擎状态，便于实机复验。

## 验证

N74 的 3 个直接复现合同全部失败；修复后同批全部通过。专项另外覆盖：CC OFF 优先、关闭前
投递的任务失效、无新选轨不回放旧语言、20 个就绪通知只启动一次、AI OFF 保持原生模式、
旧 Shorts open 标记不能授予普通视频 CC。实际 view 层检查负探测节流后的正就绪重验；真实
应用端口 + MockWebServer 检查译文和原文重入后实际显示，均不补发 time/type 回调。

N74 的诊断后台解密、动画辅助发现暂停、Shorts 黑边宽度/分页合同继续运行。
本轮仅更改就绪协调及表面验证；保留 N74 性能与字幕视口实现及历史交付字节。

## 最终验证与交付

- core **254** + extension **445** = **699 tests**，0 failures/errors/skipped。
  新增 N75 12/12 通过；直接故障合同的 N74 基线 3/3 失败，保留原 XML。
- 真正的 Shorts View 探测覆盖 REGULAR 后重新绑定及负探测节流失效；真实应用端口+源服务器/
  翻译服务器覆盖同 Short 重新进入的译文与原文显示，不补发 type/time 回调。原文重入不新增 API 请求。
- N74 的后台解密/空闲发现/Shorts 评论视口 9 项继续通过：调用线程 key read 0，20 条记录
  writer 解密 1；Shorts 预算 974→974，分页调用 1→1。对应性能、视口、CC controller、
  application 与 native handoff 源文件 SHA-256 与 N74 一致。
- 本地化 232×14；源码、compiled core/独立 UI 依赖边界和 UI/MPP 构建通过；内嵌 MPE 与
  独立 MPE 一致，包内 `local-1.5.8-n75`，Version 1.5.8 / Patcher 2.0.0。
- 交付 `build/delivery/1.5.8-n75/patches-1.5.8.mpp`，**591,315 B**，SHA-256
  `F7899CF810CDAC9948644AFC575D5D71589F092614CEECF1B27CF2AA5F760678`。旧 1.5.7 和 N69–N74 交付包保持原哈希。
- 本轮未连接设备，实体历史记录导航及复验待用户使用新包检查；公开发布/订阅元数据仍为 1.5.7。
