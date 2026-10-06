# N30 执行范围阻断与未交付草稿记录

执行卡日期：2026-10-02（Asia/Shanghai）。状态：**未完成，按执行卡第 7 节停止产品施工，等待规划者明确冻结入口权限**。本文件不是 N30 本地测试包交付报告。

## 1. 开工核对

- 实际施工仓库：`E:\Projects\morphe-caption-v2`；未在 C 盘旧 worktree 施工。
- 开工 HEAD：`b6dd6c6`；N29 源码锚点：`3eefe00ee1491ea4c6bb4e076dbc511fc120fe65` / `anchor/n29-3eefe00`。HEAD 相对源码锚点只有两份 docs 差异；原有 PROJECT-STATE 管理更新和两份未跟踪任务/审阅文档保留。
- 两份 PROJECT-STATE 开工 SHA256 一致：`7D70CB6B454B002FB17D88A777CE158051C3EAEEC8BFBB500EFC85A446640088`，没有盲目覆盖。
- 固定官方输入 `patches-1.45.0.mpp` SHA256：`DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93`。
- 已只读检查 222525/224950 诊断、播放器菜单截图和 `102.jpg` 设置截图。原始文件未改；真实硬断点回归从 224950 的原始 source-owned 时间/文本和请求 14/15/16 响应提取，没有把样本条件写入生产分支。

## 2. 决定性冻结范围冲突

执行卡 C3 要求实际 `onPlayerType` 回调不得同步树扫描；第 7 节仅允许修改转场 guard / native renderer 扫描开销，冻结 R1/N29 overlay 生命周期，并明确任何要改冻结业务层必须停止带证据回规划者。

当前真实入口顺序如下：

`DeepSeekCaptionHook.onPlayerType`（45–50 行）
→ `DynamicCaptionController.onPlayerType`
→ `PageCaptionController / ContextualUnitCaptionController`
→ `RebuildController.player`（457–466 行）
→ `CaptionOverlay.setPlayerType`（CaptionOverlayV2.java 284–300 行）
→ 同步 `render()`
→ `CaptionSurface.refresh()`（CaptionOverlayV2.java 423–424 行）
→ `CaptionSurface.discover` 遍历 View 树（上限 1800），以及原有 player 几何查找。

**该路径先于 CaptionPlayerTransitionGuard 执行。** 因而仅让 guard 普通转场立即返回、或将 CaptionMusicSuppressor 树扫描退避，不能消除真实宿主回调已经发生的同步几何扫描。这里没有把离线调度函数或 guard 单独测试冒充完整宿主 callback 验证。

新增测试 `N30TransitionScopeProbeTest.actualHostCallbackStillSynchronouslyRefreshesFrozenOverlayGeometry` 调用实际生产入口，并用 test-only shadow 观察 geometry refresh，不修改生产权限。结果：

- 1/1 通过，含义是**成功复现阻断路径**，不是 N30 性能验收通过。
- 同步 geometry refresh 调用：1 次。
- 本机 Robolectric 单次 callback 耗时：30,604,700 ns。此数包含本机测试/渲染开销，**不能当作真机耗时或超过手机帧预算的证明**；决定性证据是同一 callback 内发生同步扫描接缝调用。
- `DeepSeekCaptionHook.java`、`CaptionOverlayV2.java`、`CaptionSurface.java` 相对 N29 源码锚点零 diff；未越界修改它们，也未修改 `RebuildController.player` 方法。

证据：`.verification/n30/scope-probe/n30-transition-scope-blocker.json`、`.verification/n30/logs/scope-probe-02.log`、`.verification/n30/handoff/scope-probe-result.xml`。

## 3. 工作区已保留的草稿，均非交付

- 通用 Planner 按现有 Protocol 同一 650ms 硬断点和显式 speaker marker 请求前拆块；未放宽 Protocol。真实三次响应仍按 `crosses_source_break` 拒绝；新增不同长度、语言、精度/来源和断点位置测试。
- 首焦点接纳前 remote prefetch 阻断；原 SOURCE_IO 锁外 cache 路径与身份校验保留；新增 bootstrap cache 命中/未命中及接纳/发送时间字段。
- 连接异常增加 transport phase、elapsed、remaining deadline 和英文 reason；预算/repair 上限未增加。该部分尚未完成专项失败重放。
- 播放器完整 on/off 标签和 AI 功能 summary；新增 12 键×14 locale 资源，生成 catalog 共 232×14。新增多选设置、规范化 code 集合及元数据/宿主 clone 接缝；Preference 使用显式 order，默认空集合，Remember/API profile 无迁移。
- guard 普通转场立即释放、紧凑恢复缩短观察上限、未稳定保持安全空白的草稿；native renderer 已知窗维护、失败退避和显式树采样草稿。**完整宿主路径仍受第 2 节阻断，不能称转场修复完成。**
- N29 bootstrap 测试旧投机请求断言保存 before 后定点调整；NativeRendererN23Test 将树导出改为显式采样、late View 重建使用明确 scan 信号，原 alpha/显示权断言保留。后续必须复核这些变更与执行卡允许范围，不能用改测试隐藏生命周期回归。

## 4. 真实验证状态与未覆盖项

- 产品 Java + Kotlin 编译：通过（`logs/compile-01.log`）。新测试源码亦已编译；之后没有构建最终 release bundle。
- N29 原 bootstrap before：8/8 通过，原测试与结果保存于 `before`；不是 N30 after 验收。
- 已完成最后一轮综合专项：23 项，19 通过、4 失败（`logs/targeted-03.log`）。真实硬断点 3 项、十四语言资源/布局/英文证据 4 项等通过；4 个失败为慢邻块旧投机等待 fixture、菜单活动 URL 空字符串断言两项、native dialog click fixture 一项。
- 对上述 fixture 已作定点修正，但**停止前没有再次运行，不能将结果写为通过**。草稿仍可能存在真实实现缺陷；未执行 Java 全量、400 轮并发、N28 main/K12、Python27、冻结计分、七组合、生成 DEX 特异性/branch/resource 审计等最终闭环。
- 已产生 `targeted-03/n30-ui-en.png`、`n30-ui-zh-CN.png`、`n30-ui-fr.png`、`n30-ui-ar.png` 和运行时资源/布局 JSON。它们是 **Robolectric 的本地资源/文本布局截图，不是真机/最终 YouTube PreferenceScreen 截图，也不证明所有运行时壳已闭环**。
- 手动/自动 VTT、JSON3 外部输入未定位；当前硬断点回归使用诊断中真实时间/文本。双来源完整回放仍未完成。
- ACCEPTANCE/frozen、18 组中文 golden 和冻结 overlay/host dispatch 源码没有修改；未重跑不得声称黄金或冻结分数已经复验。

## 5. 恢复执行需要规划者明确的最小范围

请明确是否允许针对 `onPlayerType → CaptionOverlay.setPlayerType` 同步几何/render 分发时机作小范围调整，或给出无需触及这些冻结入口且可消除第 2 节真实调用链的方案。若授权，必须保持：

1. miniplayer quarantine 与待恢复责任，不凭未稳定几何恢复；
2. 当前 AI 轨、原生 draw 防线、等待/safe blank/AI 关闭恢复和旧 Session 无显示权；
3. R1 Publication/CAS、cache 同 key 排序、主线程不依赖网络/磁盘、中文字形/位置/透明度与非中文分页合同；
4. 不新增线程/后台架构，不恢复 N27 控件避让。

恢复时先核对工作区草稿，不能把 HEAD 当作已包含本轮源码。保持单执行者，不丢弃当前差异；全量/七组合/最终包闭环完成后才能按原卡提交与交付。

## 6. 未发生的动作与保存身份

没有创建 N30 最终 MPP/MPE/APK，没有核心 commit 或 `anchor/n30-*` 标签，没有签名、安装、清数据、卸载、推送、发布、下载、新依赖或远程翻译 API。

N29 三个历史交付 SHA/字节复核一致，原始诊断/截图与官方 MPP SHA 一致，见 `handoff/n29-deliveries-unchanged.json` 与 `handoff/external-inputs-unchanged.json`。两份 PROJECT-STATE 在本次阻断记录后同步。不要求用户安装草稿或开始真机复验。

## 7. 规划者恢复定案（2026-10-03）

已核对原报告、scope JSON、生产入口与未提交工作区。同步查找确在guard之前；原卡允许文件范围遗漏了上游render分发，所以本次停止有依据。**恢复范围现已明确：继续同一N30，仅允许调整播放器入口render/几何查找分发时机与必要几何缓存失效，不解冻显示权限、compact隔离、字幕位置或R1/CAS合同。** 详见更新后的N30卡C0/C3/§7；不另开N30r，不要求用户安装草稿。

额外发现真实宿主注入指向DeepSeekCaptionHookV2.onPlayerType，其在内层返回后还调用forceNativeRendererScan；最终验收必须覆盖V2+inner完整回调与所有后续render路径，而非仅当前内层before探针。先保存before，验证callback扫描0、延后工作合并且可实际恢复，快速转场/stop/换视频/销毁不使旧任务复活；不能只挪到下一帧就宣称解决卡顿。

保留本文件原始阻断、23项19通过4失败及未复跑事实。恢复后修复/复验专项，再完成全量和最终交付；没有已经完成的新源码/产物或真机通过结论。上述许可只解除此分发范围阻断，N30仍未完成。


## 2026-10-03 执行闭环

已按原卡C0恢复并完成同一N30，未回退/另开卡。原阻断before和所有失败证据保留，真实V2/inner完整回调、合并/失效/新字幕最新guard及最终669+68/400/七组合/独立三件套闭环见 `docs/N30-LOCAL-TEST-BUILD.md`。本历史阻断不再是当前执行状态；手机/母语语义仍待有限复验。
