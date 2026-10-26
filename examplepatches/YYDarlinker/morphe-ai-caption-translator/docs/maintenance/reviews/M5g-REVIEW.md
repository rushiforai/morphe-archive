# M5g v1 统筹复核：需补正01

日期2026-10-25（Asia/Shanghai）。结论：**暂不接受C1闭环，进入[M5g-R1](../tasks/M5g-R1.md)**。原[M5g结果](../results/M5g-RESULT.md)、808项通过结果及真实组合保留；统筹独立探针证明成功的直接flush仍会漏通知。本次不进入C2–C5、缓存、诊断或性能阶段。

独立证据在 `validation/runs/20261025-M5g-coordinator-review/`。当前工作树身份仍为1.5.8 / local-1.5.8-m5g，公开1.5.7；该候选带本复核已知缺口，不替代最后已接受的m5d-r1生产内容（M5e/M5f调查候选的生产内容相同）。没有自动回退、替换或删除任何产物。

## 1. 必须修复：直接flush成功时漏通知

`ProfileEditorPreference.commit()`在`ApiProfiles.flushing()`期间压住字段自己的配置刷新。新增`ApiProfiles.flush()`只在`changed && !result`时补发；如果全部字段成功，直接调用者又没有后续`changed()`，成功保存的设置没有同步运行配置。

`select()`正常切换后会`changed()`，但其他调用者不能借用这个假设：`DeepSeekActionPreference.testApi()`可能因新URL没有匹配key而立即返回，或测试失败；`ApiProfilesPreference.clearCurrentKey()`在flush成功后先弹确认，用户可以取消；profile管理也有只修改名称等不重新配置的动作。原任务卡第2节及第3节第4项已要求检查直接调用和清key前flush，因此属于本卡遗漏。

统筹通过证据目录中的额外test source及`probe.init.gradle`运行探针，未改生产或原测试。复用真实URL编辑、配置读取、AES/GCM及受控KeyStore；配置通知局部shadow仅用于计数。三个应有断言均实际失败：

| 探针 | 保存/保护事实 | 应有刷新 | 实际刷新 |
| --- | --- | ---: | ---: |
| successfulDirectFlushMustSynchronizeSavedConfiguration | flushCurrent=true，endpoint新值，origin不匹配后ready=false，flushing已清理 | 1 | 0 |
| successfulSkipKeyFlushMustSynchronizeSavedConfiguration | flushExceptKey=true，URL已保存，key草稿及原密文保持 | 1 | 0 |
| cancellingClearKeyConfirmationStillSynchronizesSavedUrl | 实际clearCurrentKey打开确认，点击取消；active/原密文保持，URL已保存 | 1 | 0 |

证据：`probe-02-evidence.json`、`probe-02-xml/`、`probe-02-gradle-receipt.json`、`probe-02-tests.log`和`probe-source/.../M5gCoordinatorProbe.java`。实际3 tests / 3 failures / 0 errors / 0 skipped，均失败于refresh=1而实际0。原有74项通过不覆盖这三个应有场景。这里证明了真实编辑/确认控制流漏通知，不声称已在设备或真实供应商观察到旧key继续收费。

## 2. 应用边界测试需要补足

`M5gRuntimeConfigurationBoundaryTest`确实未shadow `CaptionActions`，但用自建`CaptionPort.command()`接收动作，再由测试代码调用`DeepSeekConfig.load()`读取endpoint。它证明UI命令传递及偏好读取一致，**没有执行真实`CaptionApplication.command(CONFIGURATION)`→`RebuildController.refresh()`，也没有观察旧Session/请求作用域撤销或实际运行ready变化**。

原任务卡第3节第2项要求后一个层级。保留现有端口测试的有限价值，补充真实应用/控制器配置更新回归；可替换本地HTTP、设备/加密依赖端口，但不能由替身自身重新读取endpoint充当运行配置已更新的证明。

## 3. 已独立核验，应保留的交付

- 两个生产文件及build ID是本次实际生产变化；与已接受M5f的工程输入比较，另外只有原ConfigCredentialFailureTest及新增边界测试，共5个工程输入变化。M5f原22个测试方法没有删除，仅C1通知期望相关方法改变，其他21个方法体相同，新增6个方法及1个新类用例。
- 104份完整XML逐份哈希及receipt核对：core320 + extension488 = 808，两组均实际执行、失败/错误/跳过0；当前输入与完整入口前后manifest相同，指纹 `179a05037e3fad027687f479857ff7d87ccb172e527b0186b41be021ebb9575f`。R8/syncExtension此次receipt为实际执行。
- 统筹顺序独立运行配置/凭据、端口、profile、快照、UI、诊断及endpoint九类74项，全部通过。XML已在探针Gradle前归档，见`targeted-evidence.json`。真实C1失败路径的通知、成功切换单通知、原密文/origin/草稿等已有保护不要求撤销。
- 候选MPP `283b9f0b70c0e75cb6af5f729a5b942ec3173a8b7c2123963249729d068249ae`（587225 B）、独立/内嵌MPE `78a1d24629b309579d63a3f0e8149931808c1a6a3468f349e67a9f1f338ce2aa`、UI APK `34c0647a53f7188fdaebc79dd6090302f69717244ca30a8e85bc26ae9f249fbe`均与实际文件相符。MPP相对M5f只改manifest与内嵌MPE，其他72条目相同；来源、候选、local冒充release拒绝、compiled/UI/包边界独立复查通过。
- 同一原始YouTube、官方MPP和Patcher输入哈希实际相符，官方默认根104个，组合与现有DEX审计退出0、classes=64565。APK `61982bea6b5d9768f53c5550575b1edffe0d63eb123b5a31c702a8e15a4f709c`（227115209 B）。与接受的M5d-R1组合逐条目比对，本次实际改变 **classes12.dex和classes13.dex**，其他18389条目相同，无新增/删除条目；不沿用此前core单文件改动只有classes13.dex的结论。补正需解释两组DEX内容与本次两个生产文件的关系并保护Hook/其他类和资源。
- 已接受M5f的159个生产文件中只变上述两个；其余输入及已有测试符合有限指纹复查，六忽略前端、2754项历史保护清单相符。81个当前core编译类与M5f接受归档相同。分支/HEAD/索引保持；复核未改生产、既有测试或验证工具。

## 4. 证据及回退交付需补齐

执行交付中的`red-test-summary.txt`是叙述，没有对应的原始红测XML、完整日志和基线测试源码，不能独立核对所称两条红测的完整断言。补正自己的红测必须保存原件；若复播M5f基线，要准确标为事后复播，不能新造早期原件或把概述当成原始日志。

`m5g-production.diff`实际相对HEAD，含先前已有的activeSnapshot和1.5.7→1.5.8变化，不是本卡入场差异。统筹从已接受M5f的入场/退出ZIP找到与M5g入场哈希完全匹配的七个文件，保存为`reconstructed-pre-M5g-matching-bytes.zip`，并生成`actual-M5g-production.diff`；这是本次复核的有来源重建，不是M5g当时的新快照。原报告/错误diff保留。

入场仅9项哈希、退出13项哈希没有完整覆盖所有文档入场字节；只有哈希无法按说明恢复文件。原交付也未找到声称归档的同次compiled副本。统筹在复核Gradle前从完整入口原路径保存了81个**复核入场时**编译类，并验证与M5f相同；这不补称执行者在完整入口结束时已归档。补正按当前真实入场保存原件、批次diff、有限保护清单和带退出哈希的逐文件回退，完整入口后/下一Gradle前归档同次compiled。历史无法补出的时点如实列缺口。

## 5. 复核自身的记录与下一步

`audit.py entry/full/packages/protection`、`full-audit.json`、`package-audit.json`、`protection-audit.json`保存独立检查。首次探针init误等候未使用的Android library插件，0 tests/no tests found；修正为projectsEvaluated加入source后第二轮3项在应有断言失败，首轮不是产品红测。历史四条超长路径首次普通路径检查假阴性，改用Windows扩展路径后2754项全部匹配，没有移动或重写历史材料。

下一只执行[M5g-R1补正01](../tasks/M5g-R1.md)：成功直接flush的同步/正常切换合并、真实应用失效边界、必要证据和回退。原M5g结果与808项记录原字节保留。C2–C5和首轮后续范围不扩张；实质卡估算仍8–12含未验收M5g，补正另计。

统筹只新增审查探针/证据及交接文档，不commit/tag、推送/PR/发布、签名安装、清数据、真实服务调用、共享缓存清理或reset/clean。设备、硬件Keystore/真实落盘、远端CI、其他组合及任意线程交错仍未认证。
