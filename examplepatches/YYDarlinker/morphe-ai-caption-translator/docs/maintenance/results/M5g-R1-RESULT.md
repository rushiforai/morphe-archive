# M5g-R1 / M5g任务卡v1补正01执行结果

2026-10-25（Asia/Shanghai）。**执行结论：完成待复核；统筹复核：待复核。** 本执行不自行接受C1闭环，不下发下一卡。当前本地版本 **1.5.8 / local-1.5.8-m5g-r1**，公开版本仍 **1.5.7**。

唯一活动仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`；进入/退出分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`，索引保持入场状态。原脏工作树、未跟踪文件及两个删除状态保留。证据根目录 **`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5g-R1-01`**。原M5g报告、两张任务卡、统筹复核/探针、原候选与旧证据均未改写；本轮不复播M5f，也不补造旧时点原件。

## 实际改动与通知归属

本轮生产Java只修改 `infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/ApiProfiles.java`；另改 `gradle.properties` 的build ID。159个入场生产文件中，其他158个保持原字节，包括ProfileEditorPreference、SecureApiKey、CaptionActions、CaptionApplication及全部core生产；配置键、密文格式/alias、来源、协议/提示词、Hook ABI、资源、依赖和验证工具冻结。

- 直接flushCurrent/flushExceptKey在所有编辑结束、flushing清理后，只要实际保存过字段便通知一次。成功返回也不依赖下一动作必然成功、用户确认或API测试完成；无改动/全部拒绝保持零通知。
- 私有FlushResult只携带本次accepted/changed两个事实，无新增线程或全局临时事务状态。select成功flush暂缓中间通知，写入active并重绑后，在LOCK外发新active的一次最终通知。后续index写入/重绑失败时，本次成功保存的字段仍能通知；已有拒绝/异常语义与M5g失败路径保留。
- 与本次通知归属直接相关的回调异常：通知失败不把已保存值说成回滚。已有Editor/切换异常保持主异常，通知异常追加suppressed；单独通知异常向上传播。flushing事先清理，不自动重试。没有处理其他C5重建/字段saved后置回调风险，也没有解决C2的任意active apply后部分失败。
- 正常debounce自动保存、失败草稿/错误及revision绑定、origin和原密文、跳过key、其他profile/global和迟到编辑/确认目标保护保持。逐字段自动保存继续生效，不引入整表单事务、回滚、自动重绑key或删除密文。

测试改动：ConfigCredentialFailureTest保留原28个方法体文本并新增7个；M5gRuntimeConfigurationBoundaryTest保留原1个方法体、在端口回调加LOCK/flushing断言并新增3个；新增M5gApplicationConfigurationTest两条真实应用测试。原M5f21个非冲突方法文本未变，原C1刻画的M5g通知断言本轮也未再改。方法正文比较统一CRLF/LF；逐字节原件和换行事实另存，不能把文本保护误称整个改动文件字节不变。

当前合同、架构摘要、维护README、路线、首轮收尾清单及PROJECT-STATE/镜像已更新，均保持执行“完成待复核”、统筹“待复核”，不宣布接受C1。工程输入在完整验证后未再变化，仅填写文档实测结果。

## 入场、真实批次差异与历史缺口

第一次改源码/Gradle前，`capture-entry.py`保存2234项入场清单（含已有删除）、`entry-originals.zip`并逐文件校验；保存分支/HEAD、完整工作树状态、索引diff和入场总diff。六忽略前端及状态镜像也在ZIP内。合理有限历史清单为6376项，包括原M5g交付和统筹探针；另独立复查已接受M5f的2754项历史保护清单。源码快照不包含.git、共享缓存或整个工具链，不承诺从源码ZIP重建全部环境。

ZIP SHA-256 `bf57e06befa591fafecf321aa6196b05775e7860c95f347d28b87519335e4b6d`。本轮回退目标12个文件；新增结果报告特意保留在回退之外。`batch.diff`来自入场/退出实际字节解码后的逐行差异，`batch-review.diff`仅统一换行便于阅读；`line-ending-facts.json`披露ApiProfiles等改动文件的LF/CRLF规范化。两个ZIP、退出逐文件SHA-256才是准确字节恢复依据，未以相对HEAD总diff冒充本批次。原工作树总diff只作为入场事实保存。

原M5g证据缺口保持如下，不能由本轮结果倒填：

| 缺口 | 本轮可查事实与限制 |
| --- | --- |
| 原红测只有red-test-summary概述 | 未找到对应原始红测XML、完整log或基线测试source；本轮红测完全独立，不能称找回旧红测 |
| 原m5g-production.diff相对HEAD，夹带先前变化 | 原错误diff保留；统筹actual-M5g-production.diff和reconstructed-pre-M5g-matching-bytes.zip来自已接受M5f ZIP，七文件与原M5g入场哈希匹配，是有来源事后重建 |
| 原声称的同次compiled归档未找到 | 统筹保存的81类是复核入场副本，与M5f相同，不冒称原执行结束时归档；本轮另有本次完整入口551类绑定归档 |
| 原入/退出仅9/13项哈希，不足以恢复全部文档 | 七文件有重建来源，缺少其余原件仍不能精确整体恢复原M5g前文档。本轮12文件具备当前入场原字节及退出哈希，不能扩大为旧批次完整回退 |

## 三个有效红测及绿测

先阅读统筹 `probe-source/.../M5gCoordinatorProbe.java`、probe-02-evidence及XML/receipt，转入正式ConfigCredentialFailureTest后在原m5g生产上执行。`red-inputs.zip`保存当时ApiProfiles、ProfileEditorPreference、测试source和gradle.properties，入场生产与ZIP对应。

有效红测公共命令如下（全部在活动仓库运行，完整参数数组见 `commands.json`）：

```powershell
.\.devenv\dev.cmd :extensions:extension:testDebugUnitTest `
  --tests '*ConfigCredentialFailureTest.successfulDirectFlushMustSynchronizeSavedConfiguration' `
  --tests '*ConfigCredentialFailureTest.successfulSkipKeyFlushMustSynchronizeSavedConfiguration' `
  --tests '*ConfigCredentialFailureTest.cancellingClearKeyConfirmationStillSynchronizesSavedUrl' `
  --offline --init-script tools/verification.init.gradle `
  '-Pverification.receipt=validation/runs/20261025-M5g-R1-01/red-02-receipt.json' `
  '-Pverification.rerunTests=true'
```

| 正式回归 | 修改生产前 | 修复后的实际行为 |
| --- | --- | --- |
| successfulDirectFlushMustSynchronizeSavedConfiguration | URL已保存、ready=false，刷新期望1实际0 | 成功直接flush通知1次，重复无改动仍1 |
| successfulSkipKeyFlushMustSynchronizeSavedConfiguration | URL已保存，key草稿/原密文保持，刷新期望1实际0 | flushExceptKey通知1次；重复无改动不增加，跳过key草稿/密文保持 |
| cancellingClearKeyConfirmationStillSynchronizesSavedUrl | 真实clearCurrentKey弹确认后点击取消，URL仍保存、key未删，刷新期望1实际0 | 取消后配置已同步1次，active/密文保持 |

有效红测：**3 tests / 3 failures / 0 errors / 0 skipped**，退出1；不是编译错误或no-tests-found。完整 `red-02.log`、`red-02-receipt.json`、`red-02-xml/`及 `red-02-evidence.json`保存失败原句、M5F_SNAPSHOT/M5F_FINAL偏好事实和清理记录。第一次`red`因未引用PowerShell的-P属性而在init阶段缺receipt被拒绝，未执行测试；`red-xml/`是当时误复制的旧报告，明确无效、不计本轮红测。该尝试也保留。

修复后green-01 **38项**通过；补足通知异常/正常新active回调及相邻suite后green-02 **86项**通过，均为本次实际执行、失败/错误/跳过0，XML/receipt在下一次Gradle前已归档。green-02包含配置35、有限端口4、真实应用2及profile/UI/snapshot/endpoint/诊断相邻suite，原M5g28+1与M5f21非冲突保护继续有效。全部命令/各testcase及模块事实见 `commands.json`、`green-02-evidence.json`，非整测重试碰运气。

新增验证还覆盖真实testApi在flush后因缺credential提前返回（无需调用API）、捕获profile ID后的迟到清key确认、成功URL后index写入前拒绝、成功切换后编辑器重绑抛错、独立debounce、直接重复无改动、通知异常不泄漏flushing、原异常与通知异常同时出现。正常成功select只通知一次，而且端口回调当时读取的是新active endpoint；回调不持LOCK且flushing=false。相关新测试无Thread.sleep。

## 真实CaptionApplication与旧运行作用域

M5gRuntimeConfigurationBoundaryTest继续只负责端口传递、通知次数/时点和回调异常；原测试自建CaptionPort读取endpoint的有限结论不再写作真实运行更新。

新增两条M5gApplicationConfigurationTest实际将CaptionApplication.INSTANCE安装到CaptionActions与TranslationRuntime，并设置应用Context。未shadow CaptionActions、CaptionApplication、RebuildController、SecureApiKey、DeepSeekConfig或Cipher。复用真实编辑字段、真实GCM及受控AndroidKeyStore SPI；模型发现/未知连接明确拒绝，显示样式和原生扫描用设备替身。旧运行起点是显式植入的真实ready Session、真实Job、控制器实际positionGuard，不是一次完整播放器启动/HTTP传输。

两条场景为真实URL成功/key失败拒绝select，以及本次修正的成功直接flushCurrent。每条先证明旧Session.ready=true、旧Job.tryBeginAttempt=true、旧guard有效；配置动作随后真实执行 `CaptionActions → CaptionApplication.command(CONFIGURATION) → RebuildController.refresh → stop/activate`，检查：

- 新Session不是旧对象，绑定已保存新URL、apiKey空、ready=false并terminal；样式配置命令恰1次，未发出连接或模型发现。
- 旧Session.cancelled、publication关闭/不能再reserve；旧current=false、Job.tryBeginAttempt=false/isCancelled=true、旧RenderGuard=false。
- URL/key失败时active不切，失败key草稿/错误与原密文保持；恢复Keystore后origin仍拒绝旧key，其他profile真key仍可读。直接flush重复无改动不替换Session、不增加通知。

`M5G_R1_APPLICATION`原始事实在两轮针对性及完整XML中，重复执行未使用整测重试或sleep。测试恢复静态端口/应用Context/运行Host/Output/控制器字段，取消核心MAIN回调/字段debounce，使用有界Executor屏障等待真实retirement，恢复provider/顺序、ProxySelector及编辑器。实际覆盖控制器撤权与新运行ready，未声称执行旧HTTP回复、设备渲染或硬件KeyStore。

## 完整入口、同次compiled及独立边界

```powershell
.\.devenv\verify-full.cmd -RunId 20261025-M5g-R1-candidate-01 `
  -EvidenceDirectory validation/runs/20261025-M5g-R1-01/final `
  -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m5g-r1 -Offline -RerunTests
```

退出0、`final/summary.json` passed。core **320** + extension **500** = **820**，两组均executed，failures/errors/skipped全部0；完整105份suite XML（core 33份、extension 72份）及receipt已归档。本地化232键×14语言、来源/提示词/ABI/源码边界、release/verification contracts、metadata、候选、compiled/UI/包边界、凭据扫描均通过。完整运行source前后manifest一致，指纹：

`e5333b6691507e660182fd4c718243be85ac0e23deda2f9cf3066e17b2b957d0`

本次Gradle结束后立即尝试归档，首次普通路径触发Windows长路径错误；第二次修正辅助脚本存在引号语法错误，均非产品失败。修正使用扩展路径后，在**下一次Gradle开始前**完成同一次完整入口的551个production compiled类归档：`final/compiled-from-this-full.zip`、`final/compiled-binding.json`，包含core/shared/contracts、extension debug/release及patches Kotlin。绑定同次receipt、源码指纹、逐类哈希与归档时间；未更换源码或执行中间Gradle，未倒签旧时点。

归档ZIP SHA-256 `9c041f3daf6ea2c013acd468a10a8259d908e21d6a37afe94995e557994d7ebd`；receipt SHA-256 `315fb5ef125056dfe74a78585d39bb3790522fc7b182aba0de80f471d53aa5ae`。不完整attempt01 ZIP、三次archive日志及最初未找到binding的独立检查尝试保留在attempt-ledger。随后独立检查从该ZIP提取core81类，而非后来构建目录，配合明确候选MPP/独立MPE/UI通过。两个负向检查实际非0拒绝：本地候选冒充release-1.5.8、冻结旧M5g冒充m5g-r1，均拒绝于缺少期望build ID，不是缺文件假阴性；见 `independent-commands.json`。

| 产物 | 绝对路径 | 字节数 / SHA-256 |
| --- | --- | --- |
| MPP | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5g-R1-candidate-01\patches-1.5.8.mpp` | 587567 / `8a8ec9e90c96b24d03b54d767ce9006177a1a13b23d93acf43ed0cd24d88fc1f` |
| 独立MPE | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5g-R1-candidate-01\extension.mpe` | 722380 / `40d3bdd83dad0766b4c5e7247e664fb6834d6f192a4c1e126c0f12996f988c5b` |
| UI preview APK | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5g-R1-candidate-01\ui-preview-debug.apk` | 3483228 / `e046756f0986a7fe4f144656c1e71c75e15d4b555232c88304e546d055938d28` |

内嵌MPE与独立MPE逐字节相同；UI APK不含translation core。产物是候选，不覆盖公开1.5.7，也不自动替换最后已接受m5d-r1生产内容。

## 同输入真实组合、资源与DEX内容保护

实际命令在 `run-composition.ps1`、`composition-command.json` / `audit-command.json`，对应独占receipt。通过 `.devenv/dev.cmd`顺序执行 `:patches:verifyComposition`（compile=true）和 `:patches:auditComposition`，输出不覆盖旧M5g。

输入和选择与原M5g一致：

- 原始YouTube21.41.525-SECONDARY：SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`。
- 官方MPP1.48.0：SHA-256 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`。
- Patcher2.0.0：runtime classpath中的JAR SHA-256 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`，共享已装工具只读。
- 明确AI caption translator + **104**官方默认根，完整选择和official-defaults.txt保留。

真实组合与资源重编译退出0，现有DEX审计退出0、`DEX_AUDIT_PASS classes=64566`。未签名APK：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5g-R1-01\composition-M5g-R1\patched-unsigned.apk`，227115576 B，SHA-256 `e7960256c45cee45d036dc37358f5787aff640ad9a69bb78c47805cee22e525a`。

新对照以冻结M5g为基线：MPP只改变MANIFEST.MF/内嵌MPE，其他72条目相同；组合APK仅 **classes13.dex**改变，其他 **18390**条目相同，无新增/删除条目，包含classes12.dex、根补丁DEX和全部资源。原M5g相对接受M5d-R1改变classes12/13的事实继续保留，不能把本轮对M5g的一DEX结论倒套旧比较。

补充只读DexContentInventory使用现有dexlib2，把变化DEX中的每个类独立写入canonical pool，比较全部成员/代码/debug内容，排除仅容器索引/偏移变化。520→521类：新增ApiProfiles$FlushResult；原始内容改变ApiProfiles、CaptionDiagnostics、生成的extension.BuildConfig；仅统一两个已知build ID字面量及其拼接文本后，后两类内容相同，逻辑变化仅ApiProfiles。其余517类同内容、无类移动/删除，Hook类未变化，未新增测试或回环类。Java原始清单、命令、源码/编译日志和分类报告见 `package-content-audit.json`、`*-class-content-02.tsv`、`class-content-commands.json`。

审计前两次分类断言失败也保留：第一次只规范化整串build ID漏掉CaptionDiagnostics拼接文本，第二次把生成BuildConfig错误限定在deepseekcaptions包前缀；检查原始类清单后精确识别两类仅身份字面量变化。未修改产品/放宽既有DEX审计/重试测试来通过。

## 保护检查、范围与未覆盖

`protection-audit.json`确认：生产159文件仅ApiProfiles变化；原M5g28+1方法正文未变，M5f21非冲突方法正文未变；六忽略前端、6376有限历史项、另2754已接受历史项全部匹配；core81 compiled类与统筹入场归档逐字节相同；分支/HEAD/索引保持，删除的CaptionStartupOrderTest与LoopbackCaptionServer未恢复。PROJECT-STATE与镜像逐字节相同。既有profile/UI/snapshot/GCM/旧会话、M5e显示保护和F1/F2/F4均在完整入口继续通过，未改F3缓存身份/F5诊断分类。

C2–C5继续留待后续，尤其apply后异常/丢写、多store部分失败、坏数据恢复和其他重建/后置回调风险。通过的是JVM受控偏好/真实Cipher、应用/控制器运行边界与指定输入静态组合，不是fsync、进程死亡后读取、断电/磁盘满、硬件Keystore、OEM设备、远端CI、其他YouTube组合、真实供应商/费用或任意线程交错认证。没有运行真实用户key、模型发现、YouTube或付费API。真实组合只读本地APK/MPP/工具。

没有commit/tag、推送、PR、发布、交付APK签名安装、清用户数据、清共享缓存、reset或clean；所有项目写入/临时工作均在E:。没有进入下一阶段。需要统筹判断：是否接受本卡C1规定范围；执行对话不自行决定。

## 退出哈希逐文件回退

`rollback-plan.json`列12目标的入场存在/原件SHA及退出SHA；`entry-originals.zip`和`exit-originals.zip`提供精确字节。默认仅检查，**实际workspace dry-run通过**：

```powershell
& 'E:\Projects\DeepSeek morphe-ai-caption-translator\work\toolchain\python\python.exe' -X utf8 `
  'E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5g-R1-01\rollback.py'
```

只有明确执行同一命令追加 `--apply` 才恢复本轮入场12目标；全体退出哈希和ZIP哈希先检查，任一后续修改/删除立即整体拒绝、零写入。恢复源码/当前文档/身份及状态镜像，删除本轮新增应用测试；状态与镜像同一计划成对恢复。结果报告、本轮证据、新旧候选/组合包均保留，不清用户数据，不操作Git历史。回到的入场身份是带已知缺口的m5g，不冒称接受版本或自动回退到m5d-r1。

隔离演练 `rehearse-rollback.py`在 `E:\Projects\DeepSeek morphe-ai-caption-translator\.tmp\M5g-R1-rollback-rehearsal-01`实际验证：默认dry-run、模拟后续gradle.properties修改时整体拒绝且所有目标零写入、恢复正确退出字节后apply成功、全部入场字节吻合/新增测试仅在演练中移除、状态镜像一致。实际仓库未执行apply。证据 `rollback-dry-run.log`、`rollback-rehearsal.json`及各日志。退出ZIP SHA-256 `dd42b4164df0829035ef45e3f059eafdbc34d5cf69b0d859da55c1a6464b7998`。

至此完成待复核，交回统筹；不自动执行下一项。
