# M5d-R1 / M5d任务卡v1补正01 执行结果

日期2026-10-25（Asia/Shanghai）。**执行结论：完成待复核；统筹状态：待复核。** 属于原M5d补正，未自行接受F2完整闭环，未进入M5e/M6或其他任务。产品1.5.8 / **local-1.5.8-m5d-r1**；公开仍1.5.7 / release-1.5.7。原M5d-RESULT、770项原验证、封存/统筹探针和旧候选原件保留。

## 1. 入场、授权和本轮实际范围

- 唯一活动仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`；进入/退出分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`。复用当前工作树，入场2209个Git可见实际文件原件，包含原有已修改/未跟踪内容和删除状态；不以HEAD作为完整基线。
- 独占证据 `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5d-R1-01`。`entry.json`、`entry-originals.zip`、entry-working-tree/index.patch保存完整入场；源快照在任何生产/测试修改前完成。只读历史扫描原范围过宽，停止其Python后改用任务卡允许的有限保护范围，未重新捕获已编辑源码。`entry-seal.json`准确说明范围和快照哈希；`protected.json`与六忽略前端哈希独立保存。
- 生产只改 `translation-core/src/main/java/app/yydarlinker/deepseekcaptions/RebuildController.java`：共用`deferRetry`取已有父门与`RetryAfter.after(now,delay)`的max；所有运行时retryAt元素写入集中于此。普通/子失败一致，取消500ms收尾、pending退休500ms、成功语义review1200ms都不能缩短已建立较晚门。`repairRejected`去掉外围重复max。没有新增字段、timer、线程、固定延长或重试次数。
- provider仍取max，Failure分类/RetryAfter解析与安全相加不变。sourceOnly、过滤/terminal、Plan/已显示文字、原尝试/page4次/hole一次/去重、预约返还、F1/F4、finishSent/STOPPED、Publication/cache、F3/F5、源/Cookie/协议/提示词/Hook/UI不改。新Session及首次源接纳初始化仍依原合同；seek/display generation不清同父块门。
- 测试只改既有`RepairAdmissionTest`增加7项及一个夹具helper，并更新任务卡明确授权的两项旧deadline断言。原24项方法体逐项相同，137个其他/src/test文件原字节保持，158个其他/src/main文件原字节保持；无删测/skip/有效断言放宽。
- `gradle.properties`只改build ID；`docs/core-provenance.json`只更新Controller目的哈希/适配说明，派生core-upstream.patch按实际diff生成。固定上游commit/snapshot/upstream_sha256、其他来源记录/new_files、协议/提示词字面量/Hook ABI与验证工具均保持。当前网络合同、状态合同、维护README/路线、PROJECT-STATE及同字节镜像更新；原卡/复核/结果历史不改。
- 本批差异见`batch.diff`/`source-review.diff`，对照入场原件而非HEAD总diff。回退清单13项含状态镜像，原M5d结果和本结果/证据/新旧候选不参与删除。

## 2. 有效红绿、实际HTTP和旧断言映射

**有效红测**：`red-equivalent/`，仅正式`laterOrdinaryFailureMustRespectEarlierLongChildDeadline`，生产所有入场/src/main逐项相同（command.json中的production_identical_to_entry=true）。普通POST扣住408→hole实际408/Retry-After=300建立retryAt=300100、providerRetry=0→普通无header408晚到→elapsed推进1200→page。应有断言期望服务器仍2个POST、实际3；1 test/1 failure/0 error/0 skipped。receipt/XML/源码均已归档。

**同断言绿测**：`green-pair/`，相同完整方法体SHA-256 `5badda5fdd8b7b163f3ea63a6dd9f49280133adf977894328f1e15a9819e5d57`；1/0/0/0。父门保持300100，elapsed=1300及门前1ms仍2个原POST；到期按原资格page实际成功，才有第3个POST，保留旧事件并合并范围6–11。父attempt=1、hole slowRetries=1、page=1、session repair=0，无门前费用单位新增。

普通/子两种晚到失败顺序都测providerRetry=0的父门；page、hole及普通schedule门前逻辑调用不新增batch/attempt/POST，门前1ms不发、到期恢复。超大429使父/provider门饱和Long.MAX_VALUE，短普通408晚到不能改短；原重叠短子失败保留provider与父门测试原样继续通过。不能表达到期的饱和值没有伪造恢复结论。

本次完整验证中7项新增用例的总计数（包含正向恢复）：

| 用例 | logical batch | audit attempt | fixture POST |
| --- | ---: | ---: | ---: |
| `pendingFocusSlotReleasePreservesSameParentOnlyWait` | 2 | 2 | 2 |
| `seekCancelledUnsentOrdinaryReturnsQuotaWithoutErasingChildWait` | 3 | 2 | 2 |
| `lateSuccessfulOrdinaryReviewCannotEraseChildWait` | 3 | 3 | 3 |
| `laterOrdinaryFailureMustRespectEarlierLongChildDeadline` | 3 | 3 | 3 |
| `laterShortChildFailureRetainsOrdinaryParentOnlyWaitAndRecovers` | 3 | 3 | 3 |
| `admittedSuccessfulHoleKeepsLaterOrdinaryWaitAndOriginalEvents` | 3 | 3 | 3 |
| `lateOrdinaryFailureRetainsSaturatedChildAndProviderGates` | 2 | 2 | 2 |
| 新7项合计 | 19 | 18 | 18 |
| 原24项+新7项合计 | 66 | 64 | 64 |

新seek取消用例在真实audit begin扣住未sent普通Job；hole真实408建长门后通过真实time(20000) seek取消离开范围的未sent任务，实际rejected→finishCancelled返还原attempt为0，保留Plan与300秒父门；到期page成功。多出的1 batch没有物理attempt/POST。原page合法逻辑准入后STOPPED的1/0/0保持，不能把batch、attempt、received等同消费/退款。

其他写点：成功普通回复触发possible_polarity_change的原语义review收尾保留并发hole门，门到期真实schedule成功，attempts=2/session repair=1；真实未dispatch pendingFocus在同父hole门建立后走schedule→releaseGatedJob保留门并返还预约；成功hole晚到仍合并旧有效事件且不抹普通门。`retirePendingFocus`在有效门存在时被前置gate释放拦住，不能虚构未来门绕过该检查；仍共用安全更新。完整写点/初始化/取消/收尾可达性审查见`retry-write-audit.md`。

获准的两项旧→新精确期望（原件在entry ZIP）：

| 原测试 | 旧父deadline期望 | 新期望及保留保护 |
| --- | --- | --- |
| NetworkFailureContractTest.controllerWaitUsesMaximumAndProviderGateWithoutSleeping | 已有now+17000后，普通网络失败覆盖为now+15000 | 精确保持now+17000；provider精确now+17000不改；独立新Session精确now+15000，provider=0 |
| RetryAfterContractTest.shorterServerDelayCannotShortenLocalBackoffOrExistingProviderGate | 已有now+300000后，短429覆盖为now+15000 | 精确保持原gate；provider与原schedule等待断言不改；独立新Session精确15秒backoff，对1秒server delay的provider精确至少5秒 |

没有把断言换成宽泛不等式；JSON映射`old-assertion-mapping.json`。原服务端等待与backoff取长、provider保护均实质保留。

## 3. 所有运行结果与非成功记录

- 各次Gradle顺序运行。开发测试在下一次前归档本次XML/HTML/receipt/源码哈希；完整入口归档两组XML/receipt，并在下一次Gradle前归档同次compiled。`run-tests.py`的每轮command.json记录完整argv；独占development build root只用于本轮。测试网络全为本地fixture，未映射源/模型拒绝，仅fixture key；新增测试有界latch/Future、受控elapsed clock，无新增Thread.sleep或真实供应商。
- `red/`首次夹具开发失败：宽泛noNewRequests在第3个提前page后又调度第4个普通请求，最终停在drain的有界等待；不计有效回归红。完整原日志/XML保留。改成第三个page处立即断言后`red-equivalent/`进入期望2实际3的应有断言。HTML长路径归档首次失败后用Windows extended path前缀补归档，未覆盖或删除原失败。
- `green-pair/`1项通过；`targeted/`9 suite共85项，84通过/1失败/0错误/0跳过，失败是未修改的ContinuousDisplayTest.aHoleSubRequestFillsTheMissingHalf在第215行等待第x句显示10秒超时。随后同源码`repeat/`31 RepairAdmission+7 ContinuousDisplay共38项全部通过，本次完整入口也通过；未修改或放宽该旧测试。不宣称已查明该一次性超时的根因，保留为复核限制。
- review-source脚本首次解析测试方法时将注释中的英文撇号当作字符常量，修正仅证据解析器；最终逐方法原24项及主红绿完整方法体比较通过。该脚本不是产品/验证工具更改。
- 文档汇总脚本首次未处理文件末段没有双空行的情况，在网络合同已更新后停止；改为从入场原件重新生成这5份授权文档并处理末段，成功后再次完成保护/状态镜像/退出快照检查。未重新捕获入场源码，也未改变固定构建输入。
- 修复后完整固定输入指纹 `ee5133445a0074f8acdbe0d3c594a7b183bbffa84b2f7fd1c54aef7a27a2de2c`；`fixed-source-manifest.json`与完整source-manifest/source-manifest-after及最终复算相同。

## 4. 完整入口、候选和负向身份

实际有效入口（完整argv/退出与日志在final/summary.json；无无理由重跑全套）：

```powershell
work/toolchain/python/python.exe -B -X utf8 tools/record_core_provenance.py --check
.\.devenv\verify-full.cmd -RunId 20261025-M5d-R1-candidate-01 -EvidenceDirectory validation/runs/20261025-M5d-R1-01/final -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m5d-r1 -Offline -RerunTests
powershell.exe -NoProfile -ExecutionPolicy Bypass -File validation/runs/20261025-M5d-R1-01/run-composition.ps1
work/toolchain/python/python.exe -B -X utf8 validation/runs/20261025-M5d-R1-01/dex-audit.py
```

| 测试模块 | tests | failures | errors | skipped | 本轮执行 |
| --- | ---: | ---: | ---: | ---: | --- |
| translation-core | 318 | 0 | 0 | 0 | executed |
| extensions:extension | 459 | 0 | 0 | 0 | executed |

共777项，两组实际执行，非UP-TO-DATE旧XML；102份XML归档/哈希在`full-xml-manifest.json`。来源/协议/提示词/ABI、14 locales×232 keys、release/verification自检、候选/compiled/UI边界与凭据扫描通过。`full-and-archive.ps1`在完整入口结束后、下一次Gradle前立即复制同次core compiled；`compiled-core-archive.json`逐文件对原目录比对、绑定本次receipt/指纹，之后`archived-boundaries.json`用该归档再次检查，不借用旧轮classes。

- MPP：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5d-R1-candidate-01\patches-1.5.8.mpp`；586963 B；SHA-256 `ca8e4ddf27156312d8b07aabd6677f83dc7bd7c8d6f3772d2eb1e864b414f477`。
- **明确独立MPE**：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5d-R1-candidate-01\extension.mpe`；721296 B；SHA-256 `0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e`，与MPP内嵌extensions/extension.mpe同字节。
- UI APK：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5d-R1-candidate-01\ui-preview-debug.apk`；SHA-256 `9bf766f99c79ce47f7acabfe8b8115c89ec6cfa4667ee6dbf923d6e3b48fe20f`。
- 三项真实负向：冻结m5d冒充m5d-r1、当前MPP搭配冻结m5d独立MPE、local冒充release，均退出1并保留日志/命令于`negative-gates.json`。未覆盖旧候选。

## 5. 同输入真实补丁组合与既有DEX审计

原始21.41.525-SECONDARY APK SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`；官方MPP1.48.0 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`；实际classpath Patcher2.0.0 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`。输入路径/哈希与实际runtime JSON保存，没有自动找最新包或下载替代。

104个官方默认根+AI caption translator；verifyComposition含真实资源重编译退出0，现有auditComposition退出0，选择文件与冻结m5d相同。输出未签名APK：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5d-R1-01\composition-M5d-R1\patched-unsigned.apk`，SHA-256 `71b77e0a6758f0417a135ee3f8c2ea24e4a1814f6f844f30f6483cdbc329c34c`。

候选MPP与冻结m5d仅META-INF/MANIFEST.MF, extensions/extension.mpe内容不同，根patch DEX/其他条目同字节，Hook方法签名相同，独立/内嵌MPE一致；扩展无测试/回环类。组合APK相对冻结m5d只classes13.dex不同，其余18390条目同字节；16 DEX、64565类定义无重复，RetryAfter恰1份，无测试/回环类泄漏。详见candidate/composition-structural-diff.json及composition/audit日志；未签名/安装，不将该组合扩成设备或真实费用认证。

## 6. 保护、未覆盖和退出哈希逐文件回退

- 入场2209文件中范围外2197个原字节保持；1284项历史记录/相关XML/probe/compiled/冻结产物及6个忽略前端通过SHA-256复核。1285入场保护项含1个本轮授权更新的状态镜像，实际历史/产物复查1284项；**这是有限复查口径，不是所有历史文件或发布产物总数**。未再次枚举/哈希所有解码中间树，已有封存inventory/audit/index原字节保留；准确清单在protected.json和entry-seal.json。原M5d-RESULT及统筹probe源码/receipt/XML/log在保护范围，未改写。
- 分支/HEAD/暂存内容及index原字节保持；当前PROJECT-STATE与`.verification/state-mirror/PROJECT-STATE.md`逐字节相同。源码/来源工具/固定snapshot/守卫按source-protection及完整入口复核；所有项目工作/报告/临时/候选在E:，进程环境由.devenv设置，未改全局环境或清共享缓存。
- `rollback-manifest.json`含13个可恢复文件的entry/exit SHA、entry ZIP成员；`exit-originals.zip`保留退出原件。`rollback.py --check`实际只读核验通过，未执行恢复。**必须先匹配退出哈希和快照哈希，后续修改立即拒绝覆盖；状态和镜像必须成对选择。** 示例：`work/toolchain/python/python.exe -B -X utf8 validation/runs/20261025-M5d-R1-01/rollback.py --restore gradle.properties`。完整回退按manifest逐项明确选择Controller、3个既有测试、build ID、来源JSON/patch、当前合同/维护入口/路线/状态镜像；恢复入场字节保留此前未提交内容，不reset/clean，不删报告/证据/新旧候选。
- 未覆盖：远端CI、其他APK/官方选择/设备语言组合、真实设备UI/性能、真实供应商/TLS/收费/退款、全部状态码×子路径×stream乘积、任意宿主线程排列；没有逐一扣住成功后每个取消检查或cache提交后generation变化的机器指令窗口，它们共用已审查/动态覆盖的finishCancelled更新点，原Publication/generation回归继续有效。一次既有显示等待超时根因未认定，复查和完整入口通过仍保留原失败供统筹判断。
- 本卡必要输入和本地工程/红绿/完整入口/新候选/指定组合/DEX/保护/回退均已完成。未把未覆盖项写成通过；没有commit/tag/推送/PR/发布、签名安装、清用户数据、真实付费API、共享缓存清理。执行停止；需要统筹复核是否接受M5d-R1并关闭原F2范围，执行者未接受、未进入后续阶段。
