# M5d-R1 补正01统筹复核

日期2026-10-25（Asia/Shanghai）。结论：**接受本补正，原M5d/F2在任务卡及补正规定范围内关闭**。原复核提出的普通晚到失败缩短父块等待问题已修复，取消/相关收尾也统一保留较晚门。原M5d复核及其770项/缺陷证据保持历史原义，当前接受依据是本轮补正及777项，而非把历史记录改成已通过新场景。

执行结果 [M5d-R1-RESULT](../results/M5d-R1-RESULT.md)和 `validation/runs/20261025-M5d-R1-01/`保留原样。独立复核 `validation/runs/20261025-M5d-R1-coordinator-review/`，含audit.py、review-evidence.json、85项新执行的receipt/XML、上轮原始统筹探针在新源码上的独立通过记录，以及来源/候选/release拒绝/compiled边界复查。

## 源码与合同检查

- 相对入场原件，生产只改Controller。新增小方法deferRetry，使用max(已有父块截止点, RetryAfter.after(now,delay))；applyFailure、未发送取消收尾、pending退休及成功语义review共用，repairRejected外围重复max删除。除了首次初始化数组，运行时retryAt元素赋值只剩该共用边界。
- 各调用在原Session monitor内，未将HTTP/磁盘/网络等待移入锁。原provider门继续取max；Failure分类、backoff数值、共享解析器/饱和加法、配额、线程数和timer不变。已到期的旧值不阻止新的合法截止点，新Session仍按原边界重建状态。
- 阅读retry-write-audit及真实入口：seek取消未sent任务后实际进入finishCancelled并归还额度；成功普通Plan含语义风险时实际进入review收尾；pendingFocus在有效门存在时先被schedule→releaseGatedJob释放。没有强行调用不可达private排列冒充生产路径。page/hole成功、预约归还和resetDisplay不写等待，旧generation/Publication/内容保护仍由既有回归约束。
- 两项获准的旧期望精确强化：17秒门保持17秒、300秒门保持300秒；provider断言及普通schedule等待保留，独立新Session精确验证15秒backoff，短429另精确验证5秒provider门。没有用宽泛不等式替换有效保护。原24项RepairAdmission方法体相同，其他范围外测试文件原字节保持。

## 独立验证

- 有效正式红测在未改m5d生产上进入应有断言：期望2 POST，实际3；完整方法体与最终相同。修复后正式绿测及本轮独立85项通过，主场景在1.2秒/门前1ms均无新POST，到期后实际page成功合并，并保留旧有效事件。
- 本统筹轮顺序重跑RepairAdmission、RetryAfterContract、NetworkFailureContract、AttemptAdmission、PublicationLifecycle、StreamingDisplay、CoreSessionIntegration、ContinuousDisplay、N52DisplayRepair共85项，失败/错误/跳过0。31项RepairAdmission再次得到66 batch/64 attempts/64 HTTP，其中新增7项19/18/18，包含真实seek取消首attempt前的1/0/0；计数不冒充真实收费。
- 先归档85项XML，再通过上轮原probe.init.gradle单独重跑**原始未修改的统筹探针**M5dCoordinatorProbeTest.laterOrdinaryFailureMustRespectEarlierLongChildDeadline，本次1项通过。原m5d的失败源码/receipt/XML和blocking-finding.json保护哈希仍相同，补正闭合的是同一个已复现缺口。
- 重新计算输入指纹仍 `ee5133445a0074f8acdbe0d3c594a7b183bbffa84b2f7fd1c54aef7a27a2de2c`。核对102份完整归档XML/哈希和receipt：core318+extension459=777，本轮实际执行，失败/错误/跳过0。不无理由再跑全部777项。
- 来源仅Controller目的哈希/适配说明/派生patch变化，固定commit/snapshot/upstream_sha256、其余来源项/new_files/ABI及协议提示词守卫保持。实际来源check、候选验证、local冒充release拒绝和同次compiled归档的81类/UI/包边界复查通过。
- MPP `ca8e4ddf27156312d8b07aabd6677f83dc7bd7c8d6f3772d2eb1e864b414f477`，586963 B；独立/内嵌MPE `0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e`同字节。MPP相对m5d仅manifest/扩展不同，根补丁DEX/其他资源保持。
- 指定输入/选择/组合及DEX退出记录核对；实际APK对冻结m5d仅classes13.dex不同，其余18390条目同字节，独立读取16 DEX得到64565唯一类，无测试/回环类泄漏。组合APK `71b77e0a6758f0417a135ee3f8c2ea24e4a1814f6f844f30f6483cdbc329c34c`；未重复该组合，不扩大为设备或供应商认证。
- 2197范围外入场文件、有限清单1284项历史/冻结材料和六忽略前端独立复核相符；该口径不称全量旧解码树。封存索引/交付哈希、入场ZIP、分支/HEAD/索引保持；项目状态镜像同字节。本统筹轮未改生产、既有测试或验证工具实现。

## 保留的显示超时与下一卡

执行targeted的85项中，ContinuousDisplayTest.aHoleSubRequestFillsTheMissingHalf曾在215行等待“第x句”超时；其后同源码38项、777项和本统筹85项均通过。测试文件未修改，原失败XML/日志完整，不能把后续通过当作原失败根因已查明。当前没有证据将这一条失败归因于本次deferRetry，也没有把它认定为无害。

本次接受的是已得到红绿/写点/独立原探针证明的F2等待和停止合同；该显示超时继续作为**待定位验证问题**。下一[M5e v1](../tasks/M5e.md)先调查它的真实事件顺序和测试协调/隔离：保留hole实际请求、合并、有效显示断言及旧generation拒绝，建立有界明确时序和失败证据，不用增加timeout或自动重试过关。生产身份/实现冻结；若发现真实生产缺陷，留证后另卡处理，不混入测试稳定化。

F3继续同语义缓存复用，F5诊断兼容改进、配置/存储故障合同、M6/M7其他工作仍待后续下发。远端CI、其他组合、设备、真实供应商/费用、全部状态码乘积和任意宿主线程交错不在本次认证范围。已合法准入调用按原作用域收尾，不承诺物理零字节或退款。下一卡仅下发，统筹本轮不执行。
