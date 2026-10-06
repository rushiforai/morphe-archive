# N26r 执行卡：完整回退到 N26 交付后基线，搁置播放器避让

日期：2026-10-01。**最新执行更新：用户明确改由本聊天直接执行，本卡已完成；交付与验证见N26R-LOCAL-TEST-BUILD.md，旧DeepSeek分工描述为开卡时记录。VISIONOS_1_02由用户确认已解决，本项关闭，不再处理。**用户已决定停止N27/N27r功能开发，回到N26交付后阶段；播放器控件避让搁置。DeepSeek Harness只按本卡回退、验证、建包和交付，完成即停，不继续修避让、不自行启动其他功能卡。

## 1. 基线、目标与保留

唯一执行仓库：`E:\Projects\morphe-caption-v2`。
当前开工HEAD：`cd5d38f`；N27r源码`4c1d33f`，锚点`anchor/n27r-4c1d33f`。
**恢复基线：`7f9c639`**（N26交付后的文档收尾点）；N26源码锚点`anchor/n26-509d50a`→`509d50a`。先证明`509d50a..7f9c639`只有docs，没有源码/资源差异。

本期要求：**除管理/历史记录docs之外，整个跟踪源码树恢复到7f9c639**，含源码、资源、构建脚本和测试，不能只注释入口或加一个关闭开关。保留N26的设置入口紧跟旁白翻译、无图标、单入口及“样式预览（全屏）”，并保留N24/N25的字号/布局/取色/调度等基线。

不得`reset --hard`、删除既有提交/标签、amend或force push；不得清空build/历史证据、签名、安装、卸载、清数据、调用翻译API或改变用户配置。新增一个回退提交，保留N27/N27r为历史失败尝试。用户本次截图和四项反馈已记入最新PROJECT-STATE；规划者管理变更须保留并随卡提交。

## 2. 真机反馈与原因边界

用户安装N27r后可进入播放，但反馈：
1. 字幕避让过高，原生字幕只需进度条上方少量位移；普通详情页甚至接近顶部。
2. 控件隐藏时直接跳回，没有过渡。
3. 拖动字幕到画面中部偶发视频停播但UI仍显示播放，暂停键疑似反复触发。
4. 每次开视频出现`Debug: Ignoring unplayable video (VISIONOS_1_02)`。

本卡不继续诊断/优化前三项，执行完整撤回。
第四项已由规划者从N26和N27r真实APK定位：消息来自官方`Lapp/morphe/extension/shared/spoof/requests/StreamingDataRequest;->buildPlayerResponseBuffer`，N26也已有同一提示/客户端代码。官方源码确认它是视频流伪装客户端响应不可播放时的debug toast，不是字幕避让诊断。本卡不更换官方包、客户端顺序或debug开关，不通过隐藏Toast假称播放异常已修。回退后若仍出现，应另登记处理，不阻止本卡客观源码回退交付，也不宣称四个问题全部根治。

## 3. A：开工保护与独立审计工具归档

先只读核对HEAD、标签、工作区和两份状态档案。出现非规划者改动/新提交，先读并核对是否有另一执行者，不覆盖在途变更。

记录所有历史三件套、组合APK、recovered包的路径/字节/SHA256，结束逐项复核；N26/N27/N27r原包不覆盖。

N27r增加的分支审计有价值，但本次构建/测试源也恢复N26，不能留其N27绑定要求影响回退。**回退前**把当前已编译的`patches/build/classes/kotlin/test/validation`目录按原包路径复制归档到：

`.verification/n26-rollback/audit-tool/classes/validation`

同时归档`DexBranchAudit.kt`、`ControlsHookBindingAudit.kt`、`FinalDexBranchAudit.kt`、`InjectionOrderRegression.kt`以及当前`:patches:auditFinalDex`任务定义/来源提交/hash说明，记录这些是N27r旧工具、不能再注入到产品。它们只放ignored证据区；原始源码仍可从`4c1d33f`/锚点恢复。

本地`.verification/toolchain/morphe-patcher-1.14.1-all.jar`已核对内含dexlib2与Kotlin runtime，归档后的CLI可独立读取回退产物，不需要把N27r构建脚本留在源码里。验证命令形状：

```text
<JDK21-java> -Xmx6g -cp "<绝对归档classes目录>;<绝对patcher1.14.1-all.jar>" validation.FinalDexBranchAuditKt --input <最终产物> --require-ai false --report <本期报告> --label n26-rollback
```

**这里false仅表示“不要求N27控件避让观察者”，不表示AI字幕功能关闭。**该旧检查在false模式要求本卡回调调用点为0，正好用于本次移除证明。若归档缺少某个纯工具类/本地classpath，从本次已编译输出补齐并如实记录，不保留或重新加入产品功能代码、不下载依赖。归档完成后才能清理模块生成目录，以免丢失工具。

## 4. B：完整恢复源码树

本轮核对`git diff --name-status 7f9c639..cd5d38f -- . ':(exclude)docs/**'`只有以下13个非docs路径：

需恢复到N26的6个文件：
- `extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/CaptionOverlayV2.java`
- `extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2.java`
- `patches/build.gradle.kts`
- `patches/src/main/kotlin/app/yydarlinker/patches/deepseekcaptions/DeepSeekCaptionPatch.kt`
- `patches/src/main/kotlin/app/yydarlinker/patches/deepseekcaptions/Fingerprints.kt`
- `patches/src/test/kotlin/validation/CompositionDexAudit.kt`

需从当前跟踪树删除的7个N26没有的文件：
- `extensions/extension/src/main/java/app/yydarlinker/deepseekcaptions/CaptionControlsAvoidance.java`
- `extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/N27ControlsAvoidanceTest.java`
- `patches/src/main/kotlin/app/yydarlinker/patches/deepseekcaptions/CaptionControlsAvoidancePatch.kt`
- `patches/src/test/kotlin/validation/ControlsHookBindingAudit.kt`
- `patches/src/test/kotlin/validation/DexBranchAudit.kt`
- `patches/src/test/kotlin/validation/FinalDexBranchAudit.kt`
- `patches/src/test/kotlin/validation/InjectionOrderRegression.kt`

用Git从明确源恢复，例如在核对上述边界后：

```text
git restore --source=7f9c639 --staged --worktree -- extensions/extension patches/src patches/build.gradle.kts
```

不恢复docs目录，不改HEAD指针，不用整仓库reset。不手工拼凑N26代码。恢复后先核对index与worktree的非docs树均相对7f9c639为空差异；若仍有差异，定位真实来源，不能给它白名单或解释为“功能差不多”。

**残留检查**：生产源码中`CaptionControlsAvoidance`、本卡`onPlayerControlsVisibility`、`bindPlayerControlsVisibilityHook`、新增指纹与避让诊断事件均为0；HookV2/Overlay的生命周期、WATCH、drag路径与N26 blob一致。官方`PlayerControlsVisibilityHookPatch`保持N26原样，不删官方模块来满足字符串0。

## 5. C：避免旧编译缓存把功能带回包里

归档工具和历史哈希完成后，只清理实际已恢复模块的生成输出（常规`:extensions:extension:clean`、`:patches:clean`），再按N26交付记录的离线JDK21/Gradle流程重建。先确认clean目标是`E:\Projects\morphe-caption-v2`下这两个模块的生成目录，且不含受保护历史产物；**不得删根build/local-test、n26/n27/n27r组合目录、recovered或.verification证据**。

不使用“当前扩展不需要改所以直接拿最新MPE”：N27r MPE与N27相同，里面仍含避让协调器；本期必须生成/使用N26扩展基线。MPP也必须来自回退后的源码，不只把N27r APK换名字。

沿用YouTube21.16.256＋官方1.44.0＋Patcher1.14.1和原补丁选择集合，不改变video spoof客户端/Debug开关/其他官方功能。以**本期最终交付MPP本身**组成最终APK，防止Android/jar任务覆盖同名中间MPP取错文件。

## 6. D：回退验收与独立控制流审计

1. 全仓跟踪树（排除docs）相对`7f9c639`零差异；源、资源、依赖、构建、测试逐项确认。
2. N26的Java **440/440，58套件**、Python **27/27**、localization **220×14**，冻结4通过/4既有失败/4未验证且三类不可见时长全0；ACCEPTANCE与冻结结果不改。去掉N27的24条/1套件是本次明确回退，不是减少测试掩盖失败；不能仍跑到464而当“更好”。
3. 沿N26常规组合 **84/84**与其DEX契约、verify_bundle/N8Verify；恢复后的结构报告对照N26，不能沿用N27的`onPlayerControlsVisibility=1`检查。`classes`目标参考N26 **58028**；若不同须解释并检查多余类来源，不把旧缓存当正常差异。
4. 最终MPP/MPE/APK中**无本项目**`CaptionControlsAvoidance`及嵌套/合成类，无`DeepSeekCaptionHookV2.onPlayerControlsVisibility`定义/调用，无本卡宿主注入。保留官方hook：实际构造器应恢复N26指令形状，官方回调存在且不重复，不能误删同名官方观察者。
5. 使用归档CLI对最终APK全部根DEX与MPP/MPE做独立分支扫描，`--require-ai false`，明确旧N27 callback调用点0、invalid_branches0。报告输入SHA与实际DEX数，不能在产品源码里重新接入N27要求。
6. 对照历史N26扩展/DEX的类集合与关键方法；同编译环境可逐字节比较的部分直接比较。ZIP时间戳/patcher元数据可能导致整包SHA变化，不能要求新APK整包与N26相同；不相同的DEX必须列出差异来源，不能用一句“时间戳”解释任意产品代码差异。
7. 所有历史产物前后SHA一致，尤其下面已由规划者实核的N26黄金包；不得覆盖或换成新打包文件。

## 7. 交付、命名与黄金参考

本期新产物后缀`-n26r`（回退恢复版），避免误认为继续开发N27：
- `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n26r.mpp`
- `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n26r.mpe`
- `E:\Projects\morphe-caption-v2\build\n26r-composition-final\YouTube-21.16.256-本地测试包-n26r-unsigned.apk`

历史N26参考仍在原位置，本轮实核如下：

| 产物 | 字节 | SHA256 |
|---|---:|---|
| `build/local-test/patches-1.3.5-本地测试包-n26.mpp` | 1103820 | `01B80F88B1BE1233C59F184E44814E5A58C8BE49CAB227B54DC186909E0F7588` |
| `build/local-test/extension-1.3.5-本地测试包-n26.mpe` | 2713536 | `4C0D21FFC946F660FFF444140E8CE4A241F158028E7742399DAF21AA231F985C` |
| `build/n26-composition-final/YouTube-21.16.256-本地测试包-n26-unsigned.apk` | 196935284 | `4BC022286C5EC05837F0A170BB4BE1C66AD4F152C596650A2F2871190539FA9B` |

一个新回退实现提交，标签`anchor/n26r-<实现短哈希>`，保留原N26/N27/N27r锚点。若另有docs写实哈希收尾，报告它与源码锚点关系。两份状态档案同步，记录“运行行为回到N26；N27需求搁置，用户未授权恢复”。新产物输出完整路径/字节/SHA256；不推送、签名、安装或发布。

保留本次截图、历史N27失败/修复日志、审计反证和交付记录；本卡不删除历史错误、不把N27r标成真机验收成功。

## 8. 用户复验与停止点

用户装机检查：启动/主页/设置正常；视频页AI入口与N26一致；普通播放与暂停正常；字幕不再响应控件显隐自动抬升；原字号/位置/拖动行为恢复N26；旋转/seek/换视频/Shorts正常。N26既有位置/API/profile设置不清除；用户此前手动拖动保存的坐标不能擅自恢复默认，若位置异常让用户按原设置调整。

`VISIONOS_1_02` Toast是否还出现单独记录，不给无证据的“已解决”结论；如果仅隐藏debug toast，不能说播放问题已修。用户未授权本卡修改官方流伪装或设置，本卡不改。

三项延期（入口功能说明、全语种运行时本地化、程序性诊断英文）继续开放，留功能完成后统一审计。其余语言策略/菜单规划保留，但本卡完成即停，等用户后续指示，不自行派下一期，也不恢复N27避让。
