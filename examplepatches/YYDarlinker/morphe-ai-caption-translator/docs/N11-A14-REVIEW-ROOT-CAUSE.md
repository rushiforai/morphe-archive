# N11 / A14：384.6s `event_review` 裁决（先于验收表修订）

证据 `D:Lnnn` 指根目录 SHA-256 为 `13b1f29cdf6ea180dadb67bf91de6a7b085412fb132880d8cd07585cf5ac5171` 的 `caption-diagnostics-1.3.5-20260929-155802.txt`。本卡裁决 block 17 首事件词 `1219–1240` 的**译文能否显示**；N9 的 `[原文 / Original]` 兜底已经存在，不在本卡重做。

**裁决：真语义风险，保留 `possible_subject_attachment` 硬拦截。** 源词 `1219–1240` 是“外资和随后到来的经济增长”接续上文，随后是 **Deng reduced**（邓小平降低了用于解放军的 GDP 份额）。冻结请求 21 的译文“外资以及邓之后爆发的经济增长，降低了GDP中用于解放军的份额”却让外资／增长成为“降低”的主语（D:L646）。此前事件 `1206–1218` 说邓小平为参与全球经济奠定基础（D:L422–423）；后继事件 `1241–1264` 则说他的改革释放增长并抬高军费总额（D:L433–434），两侧语境也支持区分“占比降低”和“增长推高总额”。[University of Alberta 的一篇相关学位论文，PDF 零基页索引 P21](https://www.ualberta.ca/en/political-science/media-library/honors-thesis/eamonn-trofimuk.pdf#page=22) 在 `growth that would follow.` 后用句号断开，并另起句明确写 `Deng reduced`；这只是同主题文字的语境旁证，**不是视频逐字稿**，判定仍以冻结源词及译文为准。

| 环节 | 冻结证据与代码判定 |
| --- | --- |
| 首次接受及风险 | request 21 对 block `b17_1219_1299` 预取、HTTP 200、4 个事件被接受；首事件 `1219–1240` 命中唯一 `possible_subject_attachment`，`repair_candidate=true`（D:L401–409、L646）。`RebuildReview.inspect` 在同一源事件出现 `would follow [name] reduced` 且译文含“之后”时发出此风险（`RebuildReview.java:L43–45`）。 |
| repair 候选 | request 22 返回 5 个事件（D:L647）：把 `1219–1229` 截在 `deng`，把 `1230–1240` 从 `reduced` 开始；两句中文连起来仍是“外国投资以及邓小平之后将随之而来的经济爆发式增长，降低了……”，没有恢复邓小平为“降低”的主语。请求元数据明确给出 `avoid_event_end_after=[1229]`（D:L647）；`RebuildPlanner.protectedCut` 保护这种词汇主语和 `reduced` 之间的切分，`RebuildReview.inspect` 对此生成 `dependent_boundary`（`RebuildPlanner.java:L97–109`；`RebuildReview.java:L72–73`）。候选的具体 issue 类型是依据响应与规则推导；诊断只打印**最终保留计划**的 warning，并不单独列出候选 issue。 |
| 无进展与上屏 | request 22 HTTP 200 后记录 `old_risks=1;candidate_risks=1` 和 `REBUILD_REPAIR_NO_PROGRESS`（D:L410–417）。`RebuildReview.prefer` 在语义风险、分段罚分、repair 数未改善时保留原计划（`RebuildReview.java:L180–187`；`RebuildController.java:L674–679`）；所以 D:L416 再次打印首案的 `possible_subject_attachment`。`semanticBlocked` 保留该风险硬拦（`RebuildReview.java:L143–150`），显示链因此选择 `event_review`（`RebuildController.java:L885–913`）。冻结真机在 384,647–391,748 ms 显示旧状态，共 7,101 ms；次事件从 391,748 ms 正常显示（D:L426–434）。N9 后的离线镜像改为该事件归属窗 `384,639–391,744 ms` 显示 `[原文 / Original]`；尚无新版真机 `REBUILD_PRESENTED` 记录。 |

与 N2 的 A07 `paragraph` 逐项比较：

| 判别项 | N2 / A07 | N11 / A14 |
| --- | --- | --- |
| 触发条件 | 66 个可见字、12,548 ms 的长度/时长提示（`RebuildProtocol.java:L212–214`；`docs/A07-ROOT-CAUSE-N2.md` 第 7 段）。 | `would follow deng reduced` 的主语边界与“之后”译法同时出现，且实际译文错置动作主体（D:L408、L646）。 |
| 风险性质 | `paragraph` 提醒分句可读性，源文归属和译意本身未被证明有错；N2 放行后仍由实际布局测量把关。 | `possible_subject_attachment` 指向可见的语义错接；repair 未修正，候选还切断 `deng reduced`。 |
| 策略与结果 | N2 只把 `paragraph` 从硬显示拦截移除，保留真正的语义与布局风险（`RebuildReview.java:L131–150`）。 | 沿用语义硬拦，不放宽锚点、极性、算术、布局等安全网；A14 显示 N9 的原文兜底，不让这份错误译文上屏。 |

本卡新增 live API 调用 **0 次**，新增输入/输出 token **0/0**。N9 冻结整段真机记录已有 72,128 输入 + 10,393 输出 = **82,521 token**（`scoreboard/results/n9-evidence.json` 的 `frozen_token_audit`），属于既有证据，不计入 N11 增量。A01–A14 的旧真机事实不变；本卡对新版显示的结论限于 Java 策略及离线镜像，真机待验。
