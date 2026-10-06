# N27r 真机反馈与撤回决定

日期：2026-10-01。用户已安装N27r并进入视频播放，提供三张真机截图。N27r启动分支修复的离线报告见`N27R-LOCAL-TEST-BUILD.md`；本轮没有重新执行产品测试/构建。以下是用户反馈，不用离线PASS覆盖它。

## 用户反馈与观察边界

1. 相比原生字幕仅稍高于进度条，项目字幕上移过高；普通详情页截图中字幕接近顶部。N27算法把中央播放/前后项按钮也作为障碍，当前行为不能等同“只挪到进度条上方”。不继续调整，因为用户明确放弃本期避让开发。
2. 控件隐藏后字幕直接回原位，没有过渡。现有`CaptionControlsAvoidance.reset()`会取消动画并直接`anchor.setTranslationY(0f)`，与这一反馈吻合。生命周期瞬间清理与一般UI隐藏的动画要求不能靠此前200ms正向动画测试代替。
3. 拖到画面中间偶发视频停播但UI显示未暂停，暂停键似乎被反复触发。这是用户真实观察；本轮没有手势/播放器事件日志，未证明具体触摸分发或停播根因，也不认定回退必定修好所有播放故障。用户要求撤回，故不继续做在此版本的专项修复。
4. 每次开视频出现`Debug: Ignoring unplayable video (VISIONOS_1_02)`。

## VISIONOS提示的已核实来源

只读搜索真实N27r最终APK与历史N26最终APK，两包均在官方类`Lapp/morphe/extension/shared/spoof/requests/StreamingDataRequest;->buildPlayerResponseBuffer(...)`中包含上述提示；`VISIONOS_1_02`也在官方视频流伪装ClientType和相关Settings中。它不来自`app/yydarlinker/deepseekcaptions`避让事件。

官方源码的`buildPlayerResponseBuffer`在客户端响应的playability status非OK时触发该debug toast；`handleDebugToast`受DEBUG与DEBUG_TOAST_ON_ERROR控制。[官方StreamingDataRequest源码](https://github.com/MorpheApp/morphe-patches/blob/main/extensions/shared-youtube/library/src/main/java/app/morphe/extension/shared/spoof/requests/StreamingDataRequest.java)。实际本地1.44.0两包的相同类/方法/字符串是本轮来源判断依据，官方main用于语义交叉核对，不假定与1.44.0每个细节都相同。

因此，N26回退可能仍出现此提示；不能承诺撤回避让能解决它，也不能只隐藏Toast就说播放故障已修。本卡保持官方包/选择集合/客户端/Debug配置不变；回退后若仍有影响，应另登记研究，不趁本卡改官方流策略。

## 用户决定与实现安排

用户明确停止N27/N27r版本继续开发，项目回退到N26交付后阶段，**N27播放器避让需求搁置**。既有N27任务卡与N27r修复卡只作历史记录，不再自动继续修复/派发，也不再要求先验收避让才进入未来计划。

当前准备的`N26R-ROLLBACK-TASK.md`采用7f9c639基线（N26源码509d50a之后仅文档收尾）：以新提交恢复全部非docs跟踪树，保留历史提交/锚点/产物/证据；N27r纯审计工具归档供独立最终DEX检查，运行源码/构建/测试均恢复N26。不重写Git历史，不清用户设置，不提前修三项延期本地化或自动开展语言/菜单任务。

**后续更新：用户授权本聊天直接执行，N26r完整回退、验证与三件套交付已完成，详见N26R-LOCAL-TEST-BUILD.md；手机验收仍由用户进行。** N27需求继续搁置。

## 截图本地存档

三张原图已复制到`E:\Projects\morphe-caption-v2\.verification\n27r-device-feedback\`：`device-feedback-01.jpg`、`device-feedback-02.jpg`、`device-feedback-03.jpg`，附`manifest.json`记录原路径/字节/SHA256。不是模拟fixture、不编辑图像、不作为字幕语义或触摸根因的证明。原始临时文件路径也在manifest内，避免上下文压缩或临时文件清理后丢失材料。

**用户关闭第四项（最新反馈）**：VISIONOS_1_02已确认N26也存在，属于官方patch问题，并已解决；本项目不再处理或登记为待办。以上源码定位只保留历史证据。
