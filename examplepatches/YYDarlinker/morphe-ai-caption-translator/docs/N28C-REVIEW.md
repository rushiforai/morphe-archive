# N28C 交付审阅：锁环修复认可，真机放行前仍有两项阻断

日期：2026-10-02，Asia/Shanghai。规划者只读检查代码、提交关系、执行证据与现有矩阵，没有重新运行产品测试或修改产品源码。

## 已核实与可以认可的部分

- 当前HEAD `ce372cf`，核心源码 `4d98eec20f9f9d1d9a8b2bf0e52934cade8d93b0`，`anchor/n28c-4d98eec`指向它；后继只改两份docs，开工工作区干净。
- 三件套实际SHA与汇报逐项一致，正式MPP/MPE/APK存在；未签名APK196956968字节，SHA `8260BEEC8BE026ACDE107F6FA28586DD693C5EE2326DC68E1963CFA9C9F6F9DA`。
- 原纯B和C两次受控锁环、B＋基础修复550/550、C591/591及受控400轮的记录相互对应；锁审计、源码/class/release-debug匹配、cache许可与撤销协议及旧UI命令保护有实质证据。可以认可原Controller/Session锁顺序反转已被针对性处理，不因没有手机就要求回测旧B。
- 保留实际focus2/prefetch2/总4正确。旧卡里prefetch1若与源代码/原断言冲突应以冻结基线为准，不新增一个改变吞吐的修复。
- 中文18组golden、65个原测试、14目标/40几何、84/11DEX、62历史包与168原证据的执行结果保留为执行者提供的证据。本规划者没有冒称全量复跑或真机已通过。

## 阻断1：生命周期在主线程仍可能同步等待缓存许可

真实代码链：设置开关`DeepSeekEnabledPreference`→`CaptionQuickToggle.setEngine`→`DynamicCaptionController.refreshConfiguration`→`PageCaptionController`→`ContextualUnitCaptionController`→`RebuildController.refresh/stop`。native字幕关闭等也调用同一stop，activate替换调用retire。

`Session.finishRetirement()`先调用`publication.drain()`；该函数对尚未完成许可执行`CountDownLatch.await`，共享截止为5秒，超时直接抛`IllegalStateException(publication_commit_timeout)`。因此UI入口可以被后台atomic move/缓存监视器等待拖住，超时异常没有在该UI链路转成受控处理。锁环消失不等于主线程响应已经保证。

现有`reservedCommitDrainsOutsideMonitorsBeforeStopReturns`回归把stop放在单独`Scheduler-DrainAdmittedCommit`线程，证明后台同步barrier与其他锁互不嵌套，却没有覆盖主线程持有未完成permit时的返回/消息处理与超时路径。

本轮未观察到手机ANR或真实闪退，不能称已复现手机故障；这是代码可到达的等待/未捕获异常风险，必须受控验证并修订UI入口。Android官方将主线程等待后台长操作列为ANR典型原因，输入事件5秒未响应可能触发ANR：[Android ANR说明](https://developer.android.com/topic/performance/issues/anr)。

## 阻断2：非中文分成过短页，已有fixture证据

`CaptionLanguagePager`只要求每页正整数毫秒，页面数仅以duration（毫秒）限制，分配为每页1ms加字素比例份额。两行额外评分1800、一页200，会偏向拆成更多一行页；没有最低可读页时长或完整短源窗只一页保护。

独立遍历**已经交付的JSON矩阵**，未跑新测试，结果：
- geometry-matrix的40个多页组合均含<1200ms页面；一段1000ms完整事件拆成421ms和579ms两页。
- fourteen-targets-production-trace有24个多页记录含<1200ms页。
- presentation-trace-matrix有35个多页记录含<1200ms页，其中已有283ms页面。

记录保存在`.verification/n28c-review-20261002/short-pages-review.json`。现有新C测试只断言`end>start`，并明确接受700ms长词拆多页，未覆盖可读的最短页面合同。

旧N28核心规划曾明确1.2秒下限、短源窗仅完整单页；重新拆小卡时N28C简化文本没把非中文这一点写清，执行者因而选“只需正毫秒”。本轮将其补成明确条件，不能归咎于执行者删旧测试，也不能把新C测试的当前正数断言当成人可读性证明。

修订方向：非中文采用1200ms通常最短页，整个源窗不足1200ms时只保留完整单页（必须硬几何可行），不拉长/借时间；短窗不能切多个闪页。整段≤7000ms且完整fitsTwo时优先单页，速率/CPL超参考仍只告警。硬两行、字素、源归属保持；无法满足这些与时间容量时安全空白/明确reason，不能靠快闪塞入全部字。

## 当前结论与下一步

**N28C已完成工程打包和原锁环修复，但整体审阅未放行手机候选。** 先执行`docs/N28C-R1-CODEX-TASK.md`补主线程生命周期回归/非阻塞入口与非中文最短页，再独立交付`-n28c-r1`，保留当前C包/锚点和全部原证据。

不用安装/回测旧N28B；纯B已证实也有原锁环。用户现在不需要逐语种测试或提供诊断来复现这两个已可静态定位的问题。修订通过后再安排一次正式候选的有限手机复验，用户只观察中文、播放稳定、字幕不闪页/截断、RTL与数字，诊断由本规划对话分析，不要求母语语义判断。第四期暂不发卡。
