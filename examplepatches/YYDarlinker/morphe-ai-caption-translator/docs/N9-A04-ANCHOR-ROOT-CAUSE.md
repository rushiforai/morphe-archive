# N9 A04 锚点误杀根因（先于校验器修改）

证据：新真机诊断 `caption-diagnostics-1.3.5-20260929-155802.txt`（下称 D）及修改前 `RebuildSemantics.java`。D:L629–630 保留 request 3、5 原始响应；D:L202、L208 记录两次 `semantic_anchor_leak`，均指向同一事件 `73–97`，repair 后没有进展。该块归属词 25–97、时间 7040–28920 ms；D:L210–215 显示失败后整块被状态字幕覆盖。

| 环节 | 本例实际内容及判定 |
| --- | --- |
| 源文作用域 | 词 53–72 含 `a country's tank fleet`；词 73–97 是一个比较/列举事件：美国有多少 `nuclear aircraft carriers or stealth bombers`（80–84），对照伊万有 `10 000 t-62s`（91–93）。`T-62s` 是本事件自己的坦克型号，不应借用前一事件的 `tank fleet`。 |
| 两次实际译文 | request 3：`毕竟，如果伊万在西伯利亚某处有10000辆生锈的T-62坦克，谁还管美国人有多少核动力航母或隐形轰炸机呢？`；request 5：`毕竟若伊万在西伯利亚某处有1万辆T-62坦克在生锈，谁还在乎美国人有多少核航母或隐身轰炸机`。两句都把航母归给美国、T-62 坦克归给伊万，与源文作用域相符。 |
| 校验器实走分支 | `validatePlan` 逐事件查译文装备概念。译文含 `坦克`；`supports(tank, owned 73–97)` 只认独立 `tank(s)`，漏认复数型号 `t-62s`，返回 false。`supports(tank, all 25–97)` 却因前一事件的 `tank fleet` 返回 true。本事件又有独立 `aircraft carriers`，于是 `evidence(tank)` 将“别处有坦克 + 本处有不同装备”判为 `CONTRADICTED`，抛出 `incompatible explicit equipment anchor`。`MODEL` 的尾界也漏认 `t-62s`，不能在型号分支证实本事件的归属。该具体触发路径由代码和响应推导；诊断只记录最终拒绝原因，并不逐项记录概念布尔值。 |

真泄漏防护必须保留：如果译文把只属于另一事件的航母、坦克或明确型号搬到当前只有不同装备的事件，跨事件 `CONTRADICTED` / 型号归属检查仍应拒绝。这里要修的是比较/列举事件**本来就拥有** `T-62s`，却因词形未识别而被视为仅有航母的事件；按事件自己的源文锚点判定即可，无需放宽阈值、删除检查或跨事件借词。

## 修复后有界验证

校验器现在把明确的 `T-62s` 识别为本事件的坦克锚点，并把复数型号归一到 `t-62` 继续检查跨事件归属；原来的 `CONTRADICTED` 条件未改。Java 回归覆盖 D:L629–630 两份原译均可接受、航母事件偷用别处坦克/型号仍被拒，以及旧 R26 装备漂移仍被拒。

在当前 Java planner/prompt 配置上，**仅对 block 1（25–97）做 1 次 live API 调用**，无 repair/retry；本地原始生成层存于 ignored 的 `scoreboard/results/live-n9-block1-20260929T083940Z.json`。返回 4 个连续事件，精确源文引文与归属检查通过，Java `RebuildProtocol.parseBound` 也接受。关键事件 `73–97` 的实际译文：

> 毕竟，如果伊万在西伯利亚某处有1万辆T-62坦克在生锈，谁还管美国人有多少核航母或隐形轰炸机呢

单次耗用 **输入 1,966 + 输出 313 = 2,279 token**，墙钟约 6.094 秒。该层只证明当前配置的生成和本地解析判定，**没有新真机 `REBUILD_PRESENTED` 证据**。N9-D 原会话另有 82,521 token（72,128 输入 + 10,393 输出），属于已发生的整段真机记录，不计作这次 live 增量。失败可见性 Java 测试和 `scoreboard/results/n9-evidence.json` 镜像预测 A13/A14 在各自归属窗内显示 `[原文 / Original]`；设备显示仍待新诊断验证。
