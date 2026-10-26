# M5g-R1：成功直接flush同步运行配置及交付补正

M5g任务卡v1补正01；2026-10-25下发。前置[统筹复核](../reviews/M5g-REVIEW.md)暂不接受C1闭环。本卡是M5g原范围补正，不进入C2–C5或下一维护阶段。

## 1. 起点及明确要求

唯一仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`，原分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`。实际入场仍要核对；保留脏工作树、未跟踪/删除状态、旧结果和全部候选。读AGENTS、PROJECT-STATE最新记录、维护入口、路线、本卡、M5g原卡/结果/复核和配置凭据合同相关部分。

当前1.5.8 / local-1.5.8-m5g，公开1.5.7；完整入口808项通过，工程指纹 `179a05037e3fad027687f479857ff7d87ccb172e527b0186b41be021ebb9575f`。冻结MPP `build/maintenance/M1a/20261025-M5g-candidate-01/patches-1.5.8.mpp`，SHA-256 `283b9f0b70c0e75cb6af5f729a5b942ec3173a8b7c2123963249729d068249ae`；独立/内嵌MPE `78a1d24629b309579d63a3f0e8149931808c1a6a3468f349e67a9f1f338ce2aa`。这是带已知缺口的交付，不是已接受生产版本。

明确合同仍为逐字段自动保存：成功值保持生效，失败草稿可纠正，切换拒绝时active不变，origin/原密文/其他profile/global不改。**无论后续flush返回true、false或抛出，只要有实际成功字段，操作结束后运行配置必须与已保存值同步。** 正常成功切换用新active的一次最终通知合并刷新；直接flush不能依赖未来动作必然成功或用户必然确认。无改动/全部拒绝不通知，不做跨store事务、全表单回滚或自动重绑key。

## 2. 已证实遗漏与最小修复

字段commit在flushing期间压住自己的通知，但ApiProfiles仅在changed且result=false时补发。统筹三个探针实际3项失败，都是期望refresh=1、实际0：

1. `flushCurrent()`成功保存新URL直接返回。
2. `flushExceptKey()`成功保存URL，跳过的key草稿/原密文保持。
3. 真实`clearCurrentKey()`先成功flush，再显示确认，用户点击取消；URL仍已改变，不能等确认成功才通知。

证据 `validation/runs/20261025-M5g-coordinator-review/`中的`probe-02-evidence.json`、XML/receipt/log、`probe-source/.../M5gCoordinatorProbe.java`和`probe.init.gradle`。探针未改生产或原测试。先阅读理解，可以转为正式回归；不盲跑无关历史脚本。

允许主要修改ApiProfiles与ProfileEditorPreference，以及确有必要的直接flush调用入口；优先清楚的通知归属/合并边界，避免新增框架、线程或全局通用事务。查齐select、profile管理、testApi、clear-key前flush：直接成功的保存不能被下一动作取消、返回或失败吞掉；正常成功切换仍一次最终通知，不制造旧profile/新profile连续重启。

flushing及本次临时状态在所有正常/异常路径清理，高层回调在LOCK外。保留返回false/异常语义、失败草稿/错误与绑定revision、正常debounce自动保存、迟到编辑/确认目标ID。与本次通知归属直接相关的异常需说明；不借此全面修C2–C5。

core生产、来源、协议/提示词、Hook ABI、配置键、密文格式/alias、F1/F2/F4、F3缓存身份、F5诊断、资源/依赖/验证工具冻结。保留M5g已有失败路径修复及原有测试有效断言。build ID改为 `local-1.5.8-m5g-r1`，version1.5.8及公开1.5.7不变。

## 3. 红绿及真实应用验证

修复生产前将等价应有回归放入正式测试，取得三个遗漏场景的有效红测，保存实际命令、完整日志/XML/receipt、基线源码/测试及偏好/通知事实。不要用开发编译失败、no tests found或测试自己的预设错误当产品红测；不改成期望0来转绿。

修复后要求：

- 成功直接flushCurrent/flushExceptKey各一次刷新，正确读取已保存值；重复无改动flush不额外刷新。skipKey不保存/清除key，草稿/原密文保持。
- 实际清key确认取消及至少一个其他直接调用者的提前返回/失败分支仍同步已保存值，不依赖成功测试API或完成profile管理动作。迟到确认仍只作用于捕获ID，取消不删除key。
- 正常成功select仍只有新active的一次最终通知；部分成功后拒绝/抛出各一次通知、active不切、失败草稿和origin保护保持；全部拒绝/无改动0次，自动保存仍及时刷新。
- **补足真实应用层回归**：真实CaptionActions→CaptionApplication.command(CONFIGURATION)→RebuildController.refresh，观察旧运行Session/Job/RenderGuard撤权或实际运行ready变化，并证明新配置不会继续沿用旧请求许可。至少覆盖C1真实URL成功/key失败的路径；也让修正的成功直接flush到达该边界。可复用受控KeyStore/真实Cipher和本地HTTP/设备替身，写明层级；不能以自建CaptionPort在回调里load endpoint代替真实应用/控制器更新。保留旧端口spy测试的有限用途。
- 原M5f21个非冲突方法、M5g28+1项、相关profile/UI/snapshot/GCM/旧会话及M5e显示保护继续有效。新断言不放宽既有保护；少量顺序/重复、有界latch/受控时钟、可靠恢复静态端口/编辑器/代理/队列，无Thread.sleep或整测重试碰碰运气。

所有连接只fixture或明确拒绝，不真实测试用户key、不连接外部发现/模型。不要通过整体shadow load/decrypt成功返回假key替代origin/加密保护验证。

## 4. 补齐证据、完整验证、组合与回退

第一次改动/Gradle前保存**本补正入场原件**、工作树/索引/六忽略前端与合理有限历史清单；按入场字节作batch diff，不再相对HEAD总diff。原M5g报告、卡、叙述红测、错误diff与所有候选/统筹探针保留。

原M5g只有红测概述，未找到原始红测XML/log/source；未找到其声称的同次compiled归档。无法找回就准确披露，不补造旧时点。统筹的`reconstructed-pre-M5g-matching-bytes.zip`及`actual-M5g-production.diff`来自已接受M5f ZIP，七文件与M5g入场哈希匹配，是事后有来源重建；可据其修正差异/回退说明。若需要复播M5f行为，独立隔离输入、保留记录并标为事后复播，不覆盖当前生产文件或称作原红测。不要为了补历史数字重跑无关任务。

固定本次源码/测试/必要文档后，以已接受verify-full入口、新独占RunId、ExpectedVersion1.5.8、ExpectedBuildId local-1.5.8-m5g-r1、Offline+RerunTests完成两组实际验证、明确候选/独立MPE/UI和身份负向拒绝。**每次Gradle顺序执行，下一次Gradle前归档本次XML/receipt；最终完整入口结束后立即归档同次compiled并绑定源指纹/receipt，再做独立边界复查。** 不把后来的当前构建目录副本倒签为先前归档。

生产变化后仍用相同21.41.525-SECONDARY / 官方1.48.0 / Patcher2.0.0 / 104默认根+AI进行真实组合、资源重编译及现有DEX审计。原M5g组合对接受M5d-R1实际改变classes12.dex和classes13.dex，其他18389条目相同；新对照先用冻结M5g，按真实内容解释变化，不预设只准某一个DEX不同。保护根补丁DEX、Hook签名、其余类/资源和无测试/回环泄漏。

新结果 `docs/maintenance/results/M5g-R1-RESULT.md`；证据 `validation/runs/<date>-M5g-R1-<unique>/`。报告写明实际范围、三个红绿、应用边界/草稿保护、原历史证据缺口与可恢复部分、完整/组合/候选、未覆盖及回退。提供入场字节与退出哈希的逐文件回退，默认只检查，dry-run实际通过；后续变化整体拒绝覆盖。状态/镜像成对恢复，保留报告/证据/新旧包，不需要清用户数据。

更新当前合同、架构摘要、维护入口/路线/收尾清单、PROJECT-STATE及同字节镜像，执行完成待复核、统筹待复核。不能自行宣布C1接受或进入C2–C5、缓存、诊断、性能/下一阶段。不commit/tag、推送/PR/发布、签名安装/清数据、真实付费API/共享缓存清理、reset/clean。无需用户再决定实现技术方案。
