# M5d v1 统筹复核 — 需补正

日期2026-10-25（Asia/Shanghai）。结论：**暂不接受F2完整闭环，M5d需补正01**。原770项完整结果、红绿及组合证据保留；统筹新增实际HTTP探针复现较晚普通失败缩短子修复已建立的父块等待，允许后续page提前POST。尚未进入下一维护阶段。

原执行结果 [M5d-RESULT](../results/M5d-RESULT.md)及 `validation/runs/20261025-M5d-01/`不改。独立复核 `validation/runs/20261025-M5d-coordinator-review/`；下一任务是本卡补正 [M5d-R1](../tasks/M5d-R1.md)。当前m5d候选仍为已交付但带本复核已知缺口的候选，不替换历史已接受m5c。

## 必须修复的缺口

RebuildController.applyFailure直接赋值retryAt；只有repairRejected在外围保存previousRetry并取max。因而子失败保留较晚门，普通失败晚到时仍能覆盖同一父块的较晚门。

统筹以真实Session/Job、RebuildApi、受控HTTP和有界latch固定以下顺序，无sleep或真实供应商：

| 时序 | 实际结果 |
| --- | --- |
| 普通请求已发送，扣住HTTP408响应 | 普通逻辑调用已经合法准入，属于允许收尾的重叠调用 |
| 同父块hole收到HTTP408、Retry-After=300 | elapsed=100；retryAt=300100；providerRetry=0；已有Plan保留 |
| 释放普通请求的无Retry-After 408 | rejected→applyFailure把retryAt改为1300 |
| 推进1200ms，再触发同父块page | elapsed=1300，收到第3个POST；原300秒父块等待未到期 |

补充测试 `M5dCoordinatorProbeTest.laterOrdinaryFailureMustRespectEarlierLongChildDeadline`实际执行1项、失败1项；断言期望服务器仍只有两个原请求，实际为三个。`blocking-finding.json`及`probe-02-xml/`、receipt/日志保存源码身份和精确轨迹：`established=300100 afterOrdinary=1300 now=1300 received=3`。

probe-source及临时Gradle init均在独立证据目录，通过额外test source编译探针，未编辑生产或既有测试文件。原24项中overlappingShortChildFailureCannotShortenEstablishedGates覆盖的是较晚返回的短子失败，缺少反向的普通晚到失败。

此处providerRetry=0，父块retryAt必须独立起作用。HTTP408的Retry-After经过真实传输解析，未手工伪造门。问题是既有门被改短后批准了**后续新逻辑调用**，不能用已合法准入的旧调用允许完成或不承诺物理字节原子性解释为通过。它证明了受控环境中的额外POST，不证明真实供应商收费。

## 已核验且应保留的交付

- 相对入场diff，生产仅Controller；公共资格、filter集合、page预约归属/额度返还、递延hole恢复及有效Plan保留均有实现和对应测试。复核不要求撤销整批工作。
- 独立核对102份归档XML/哈希及receipt，core311+extension459=770实际执行通过，失败/错误/跳过0。红测原件/生产哈希及两项应有方法体相符，原m5c各多发一个page的缺陷有实际证据。
- 独立重新顺序执行原78项针对性测试，全部通过；新增24项再次观察47 logical batch / 46 audit attempts / 46 fixture received。其覆盖范围与新补充失败分别记录，不用通过的数量替代缺失的交错。
- 固定来源只更新Controller目的哈希/适配说明/派生patch，上游/snapshot/其他记录/协议提示词/Hook ABI及工具保护保持。源码指纹仍 `a07e9693da61061498531983879db27a1b8920f1cd56d8104583ef54180fc135`。来源、候选、local冒充release拒绝和同次compiled归档边界复查记录见evidence-audit.json及对应日志。
- MPP `127e01ee5d7d33c510600a069092e01126a3a43b38d5d85e684b28915ba59e24`，独立/内嵌MPE `ac122db112139bcde5b5fa785ff02933468578a9a4402b806ddef41a5942a89a`一致；MPP仅manifest/扩展变更。指定真实组合与冻结m5c仅classes13.dex不同，其他18390条目相同，16 DEX/64565唯一类。APK `02ee10a81c8157cbd72d1af7fb91202a9084807772472072c40542b126571fef`；单组工程组合不等于设备或真实费用认证。
- 范围外2196文件、189545历史候选/交付/旧证据文件、六忽略前端和封存索引按独立audit核对；189545是混合证据口径，不能当作发布产物数。分支/HEAD/索引保持，状态镜像同字节。复核源码/测试/工具实现未改。

## 复核自身的执行记录

首次原针对性调用尚未结束时，统筹提前启动补充探针，发生两次Gradle重叠；发现后停止该探针。首针对性调用以EOFException失败，保留其日志/receipt及不计入有效结果的XML，不能归因于产品断言。该探针中断日志另存probe-overlap-interrupted.log。

随后使用独占review build root顺序重跑：targeted-02的78项成功并先归档XML，再单独运行probe-02，实际进入新增应有断言并失败。有效结论仅取这两次顺序执行及原封存证据。未通过删除初始化失败记录制造全部成功。

## 补正范围及后续停点

M5d-R1仅关闭已建立的父块等待被晚到失败/相关收尾缩短的缺口，普通/子路径应用一致规则，审查相关deadline写点。原过滤/terminal、内容保护、次数/去重、F1/F4/Publication和源规则保持；新增真实HTTP红绿、到期恢复及必要相邻回归，之后完整入口/新候选/同输入真实组合再次交付。

两项旧合同测试明确期待普通失败重写本地deadline、由provider门另行兜底，补正卡允许有依据强化直接冲突的父块deadline断言，同时保留provider和本地backoff的实质保护。不得删除或放宽有效断言。原M5d结果、候选和封存证据保持，补正另写M5d-R1-RESULT。

F3语义缓存与F5诊断保持，M6/其他阶段未下发。远端CI、其他组合、设备、真实供应商/费用与任意宿主线程交错仍按原限制。下一步仅执行补正并交回复核，不自动接受或发布。
