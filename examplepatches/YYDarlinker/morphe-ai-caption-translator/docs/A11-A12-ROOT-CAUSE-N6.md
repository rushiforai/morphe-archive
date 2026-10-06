# N6 A11/A12 根因（先于实现）

证据范围：冻结诊断 `caption-diagnostics-1.3.5-20260927-084217.txt`（D）、`ACCEPTANCE.md` A11/A12、当前 `RebuildProtocol.java` / `RebuildPlanner.java`。本文件先记录根因，后续修复只改变本地显示投影；源词归属和冻结 API 响应不改。

| 案例 | 事件切点证据 | 对三类候选根因的判断 |
|---|---|---|
| A11（622–637） | D:L345 的 block 8 为 `b8_572_628`，`continued_after=true`，`context_after` 已包含 `the budget holistic ...`；accepted response 把 622–628 单独译为“我要问的问题是”。D:L346 的 block 9 从 629 开始，再把 629–637 译成“预算是否全面？有没有遗漏？”。 | **主因是块末端/源词所有权边界**：模型不能把 629–637 放进 block 8；上下文是只读，不提供可归属的后续词。当前 prompt 明确要求事件只覆盖 owned token、不能跨 marked boundary（`RebuildProtocol.java` PROMPT），所以在块末端留下引导语。不是 prompt 鼓励碎片：同一 prompt 同时要求 clause-complete、保持 dependent phrases、不要生成 3–6 词碎片。时长/字数目标是次因/放大器：引导语只有 7 个中文字符，但没有最小事件硬门槛，`RebuildProtocol` 只对过长/布局风险做检查；因此它可被接受。 |
| A12（638–641） | D:L346 的 block 9 仍覆盖 629–686，`suggested_clause_starts=[]`，`context_after` 仍有后续句；模型却把 638–641 `that should be included` 单独译为“有没有应该纳入的内容？”。D:L332 记录该事件 886 ms、11 字、12.42 CPS，D:L333 仍 accepted。 | **主因是模型对事件粒度/从属成分的错误切分**：这是同一问题的后置从句，却被当成独立问句；与块末端无关。prompt 已明确要求把 dependent phrases 留在一起、不要拆出孤立补语，故不是指令本身要求这样切。时长/字数评分是可观测的放大器：11 字低于目标下沿 12，且 886 ms 小于 A12 局部阈值 1000 ms；但日志将其作为 advisory readability warning，未形成拒收条件，故没有阻止生成。 |

## 选择修复

选择 **a：本地显示合并**，不动 prompt、协议、API 请求或源词归属。原因是 A11 的跨块问题不能靠本块 prompt 让模型合法拥有下一块词；A12 的短页已经有完整、连续的 accepted source ownership，最小风险是把相邻 accepted events 组合成显示窗口，而不是重新生成或重分配时间。合并只在相邻 source range、相邻 source time、且至少一侧是识别出的引导/短事件时发生；显示文本取两事件文本的连接，显示时间取二者的原时间并集，不挪用后续事件之外的时间、不改写 event.from/to。

新调用：0；prompt 哈希对照：不适用（prompt 未改）。展示证据继续标注“仅生成/真机未验证”。
