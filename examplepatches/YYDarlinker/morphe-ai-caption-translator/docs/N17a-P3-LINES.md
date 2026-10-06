# N17a P3：诊断 `lines` 页内口径根因

**根因（修改前确认）。** 直接核对第二轮真机诊断原件 `D:\HONOR Share\Honor Share\caption-diagnostics-1.3.5-20260929-230749.txt`：L300 的事件 268–313 第 1 页为「的印象，」，标 `lines=3;page=1/2`；L302 的第 2 页文字不同，却也标 `lines=3;page=2/2`。L301 的 `REBUILD_SELECTED` 给出未分页的整事件译文。这两个行数描述的是整事件译文，不能描述各自上屏页。代码证据是 `CaptionOverlayV2.java` L397–408 把当前页赋给 `shown`，而 L434–435 用 `lines(a, pendingText, size, inner)` 写入诊断；`pendingText` 是未分页的整事件。因而只要一个事件跨页，所有页都重复同一个整事件行数，诊断无法证明页内 ≤2 行。

**口径与修复。** `REBUILD_PRESENTED`、布局兜底及时间例外共用的诊断字段 `lines` 应表示该条记录的实际显示文本行数，即用同一字号与宽度对 `shown` 测量。分页记录由页文本计算；单页正文、状态和兜底也以相同口径记录。不改变分页计划、字幕文字、时窗、原文兜底或任何既有验收判据。冻结历史诊断仍按原值保存；新增测试检查新的页内口径。

**离线验证。** `RebuildLayoutTest.presentedLinesDescribeEachShownPage` 对每页日志 `lines` 与实际 `TextView` 布局行数逐页比较；修改前失败，改为 `shown` 后通过，完整 `RebuildLayoutTest` 类亦通过。`scoreboard/test_n17a_lines.py` 锁定新真机夹具 45 组旧记录的整事件行数事实，并确认 N15r 离线分页镜像的行数按页记录（存在同事件页行数不同的例子）；两项不能把旧诊断的 `lines=3` 冒充为页内实测。
