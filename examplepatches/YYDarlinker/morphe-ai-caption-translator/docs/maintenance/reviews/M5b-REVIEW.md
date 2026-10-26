# M5b v1 统筹复核

日期2026-10-24。结论：**接受本卡交付，F1在模型解析及普通/直接等待门范围内关闭**。日期丢失、120秒截断及直接时间运算溢出已经修正；F2子修复准入和F4退休追加POST仍未修，不能将此结论扩大成所有外发路径已统一等待。

原结果 `docs/maintenance/results/M5b-RESULT.md` 和执行证据 `validation/runs/20261024-M5b-01/` 保留。独立复核 `validation/runs/20261024-M5b-coordinator-review/`，包含audit.py、review-evidence.json、24项针对性测试及receipt/XML、来源/包/边界复查日志。

## 实际复核

- 阅读三项生产修改、F1刻画更新及九项新回归。共享解析器对ASCII数字全串检查、秒值/毫秒/日期差/加法饱和；模型仅接入该helper，controller仅修改sourceRetry/retryAt/providerRetry的安全相加。原backoff、较晚provider门、状态/次数/并发及其他请求策略未改。
- 重新核对2,186个范围外入场文件、8,848个历史交付/候选文件、六个忽略前端及退出清单，哈希一致。抽取M5a其余11项网络合同方法，入场/退出方法体逐字相同；F1映射是有依据的应有合同更新，旧证据未重写。
- 红XML确有2 tests/2 failures，300秒实得120000、未来日期实得0；XML、红测源码、生产入场哈希相符。红绿两项应有断言的方法体保持一致，非修改期望掩盖失败。
- 独立审查core来源：只RebuildApi、RebuildController目的哈希和adaptation_scope变化，其他记录、固定commit、snapshot字节/upstream_sha256、new_files、protected_abi不变。重新执行record工具check模式通过，来源/协议字面量守卫保持。
- 重新计算当前工程输入指纹仍 `ba028a4d4f50d535482f0fb0b5375d5fe1fc1309def4fd81109c855c0d7cbdc7`，与最终验证前后相同。独立核对100份归档XML、哈希和Gradle receipt，278+459=737均实际执行，失败/错误/跳过0。
- 独立实际重跑新增九项、原模型十二项、源三项共24项，全部通过；本次XML再次得到60次fixture HTTP，其中九项新增23次。没有实际等待数分钟或访问真实供应商。
- 核对真实send→Failure→rejected→schedule/dispatch→POST→Plan/READY证据：普通门前一毫秒保持1 HTTP，到期后2 HTTP并接纳；日期与300秒都经过此链。极大值在实际provider/block/source门保守等待，较短错误不覆盖已有长provider门。source门测试明确是受控Host失败，不冒称真实源HTTP。
- 重新检查候选及release拒绝、compiled/UI/包边界。MPP为 `ef74553a70071010db948063f13c3a6c951dd00f6c347d500ad62c4c4f94465e`，内嵌/独立MPE与记录相同，MPP仅manifest和扩展变化。
- 重新核对组合输入哈希、104默认根选择和组合/DEX日志；实际合成APK与冻结M4a仅classes13.dex不同，其他18,390条目相同。没有无理由重做完整组合，也没有设备或真实收费结论。
- 状态及镜像逐字节一致。统筹只做复核、针对性测试和文档交接，未改产品/测试/工具实现。

## 编译中间物的复核说明

本次针对性Gradle切回默认build root后，旧候选目录的core编译中间物路径已不存在；保留第一次路径检查失败日志，未把缺失当作通过。改用本次targeted receipt所指、同一源指纹和现有工具链产生的真实core编译结果，归档到独立review-compiled-core，再执行compiled边界检查通过。

原完整入口的81类报告/输入身份仍有效；不能承诺编译中间目录在后续Gradle调用后永远保留。源码、归档报告和MPP/MPE是本轮可追溯依据，实际使用的新编译结果已明确来源，历史交付/候选保护哈希未变。后续长期取证策略可完善这一点，不属于F1阻断项。

## 剩余边界与下一任务

没有认证全部历史HTTP-date形式、设备系统日期跳变、所有版本或实际供应商限流/费用。F2仍可能使子修复绕过普通门，F4仍允许退休旧逻辑调用继续协商POST。F3保持语义缓存复用，F5诊断兼容改进另卡。

下一卡 **M5c v1：退休后拒绝新模型HTTP尝试准入，保留已发送传输完成语义**，优先关闭已动态复现的F4。F2随后单独重现/修复，不将几个不同权限变更混成一批。
