# M2a v1 执行结果 — 已完成待复核

日期：2026-10-24（Asia/Shanghai）。任务卡：`docs/maintenance/tasks/M2a.md` v1。执行已完成；**统筹复核待复核，未自行接受**。只执行 M2a，未进入其他 M2 工作或 M3。

活动仓库及本文命令工作目录：`E:\Projects\DeepSeek morphe-ai-caption-translator`。

证据根目录：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M2a-01`。下文证据文件名均相对此目录；实际绝对路径、命令和退出状态另见 `summary.json` 与各 `*-command.json`、`*-exit.json`。

## 1. 入场身份和保护

- 进入/退出分支均为 `codex/fix-cc-authority-1.5.8`；HEAD 均为 `de844402776e1046a5bec87aac94e2e65f05bea7`。没有切分支、另建工作区/worktree、提交、建 tag 或推送。
- 以实际入场工作树为基准，保留既有 N69–N75、M1a 及维护文档修改；没有将 HEAD 当成完整 N75。
- `entry-status.txt`、`entry-working-tree.patch`、`entry-index.patch`、`entry-identity.json` 保存入场 Git 状态；2181 个文件的原字节保存在 `entry-originals.zip`，逐文件哈希见 `entry-manifest.json`，该清单 SHA-256 为 `bcf85ef1cfc351889f178b055a039ab2e42aa5c30d17f86d6246cbc942971e74`。包含非忽略的未跟踪文件，以及涉及的忽略本地验证前端/状态镜像；不声称包含整台机器或全部共享缓存。
- 进入时重新核验冻结 M1a MPP 为 `253b28f9d86bd766667f6005ee166bf08db95c71fbc73bd9e3d5752626322b3c`。`historical-artifacts.json` 另记录 `build/delivery` 和已有 `build/maintenance/M1a` 中 2180 个文件的入场哈希；交付时全部重新核对，变化 0。公开 1.5.7、N69–N75、M1a 候选及其历史证据保持原字节。
- 本轮增量与保护结果以 `batch-changes.json`、`batch-only.patch`、`exit-manifest.json`、`protection.json` 为准；不是相对 HEAD 的累计差异。原有索引状态保持不变。
- 最终批次共 15 个文件（含状态镜像和交付文档）；入场 2169 个文件保持原字节，范围外变化 0。明确保护的 134 个其他生产 Java/Kotlin 文件、104 个其他测试 Java/Kotlin 文件均原字节相同。M1a 验证工具、公开元数据和任务卡/复核记录也在这项入场对照中。

## 2. 调用关系和实际修改

`entry-callgraph.json` 从入场原件搜索生产源码、测试、构建/资源/验证入口，排除历史施工探针；未发现反射字符串或生产工厂调用退役类。现行广域 keep 规则不是调用入口，本轮没有收紧 R8。

| 文件 | 本轮修改与依据 |
| --- | --- |
| `infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/LoopbackCaptionServer.java` | 删除。入场引用仅为类内自引用和下述两项测试；生产链路不再调用。 |
| `application-host/src/main/java/app/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2.java` | 删除未调用的 private `concreteAiUrl()`、其唯一依赖 `loopbackTarget()` 和失去用途的 Context/Uri/Base64/StandardCharsets imports；修正 loopback 注释。 |
| `patches/src/main/kotlin/app/yydarlinker/patches/deepseekcaptions/CaptionSettingsPatch.kt` | 删除 `allowLoopbackTraffic()`、三个专用常量及 execute 接线；保留设置页构建及 finalize 插入逻辑。 |
| `patches/src/main/kotlin/app/yydarlinker/patches/deepseekcaptions/AiCaptionTranslatorPatch.kt` | 仅修正请求 Hook 注释：保留原生 URL/数据，按 committed selection 协调并通过 draw mask 控制可见性。 |
| `gradle.properties` | 仅将 `captionBuildId` 从 `local-1.5.8-n75` 改为 `local-1.5.8-m2a`。版本仍为 1.5.8。 |
| `extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/CaptionStartupOrderTest.java` | 退役整个只含两项旧服务器测试的文件，原件保留于入场 ZIP。 |
| `extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/ReintegratedApplicationTest.java` | 新增两项实际 V2 请求入口回归；纠正一处“原生收到空轨”的旧注释。原有 40 项测试实现和断言保持。 |
| `patches/src/test/kotlin/validation/CaptionSettingsResourceTest.kt` | 新增可选资源集成验证：从明确 MPP 加载实际设置资源补丁，decode→执行→compile→再次 decode；检查网络、设置和证书字节。另提供只读资源快照模式。 |
| `patches/src/test/resources/caption-settings/generate_fixtures.py` | 生成三个小型无专有内容的资源 APK 夹具。只使用当前 SDK/aapt2，不新增依赖。 |
| `patches/build.gradle.kts` | 仅新增可选 `verifyCaptionSettingsResources` JavaExec 入口，复用现有 test runtime。生产依赖、既有验证/发布入口没有修改。 |

维护文档只更新本结果、PROJECT-STATE 及镜像、维护 README 和路线当前执行状态；任务卡 v1、M1a 结果及统筹 REVIEW 原字节保留。源码文件保留入场换行格式。

`hook-method-preservation.json` 核对 V2 的全部 8 个保留方法：`setMainActivity`、`onVideoId`、`onPlayerType`、`deferToMainThread`、`deliverQueuedPlayerType`、`onNativeCaptionButtonController`、`onVideoTime`、`rewriteUrl` 去掉注释/空白后的实现均相同。公开 `rewriteUrl(Object,String)`、向真实 Hook 的委托、forceNativeRendererScan/kick 保留。字幕控制器、分页/调度、CC/语言权威、N74/N75 有效机制、设置行为、API 提示词、缓存/profile/Cookie/网络提供方没有更改。

## 3. 网络策略前后差异

旧 helper 有两条不同增量：输入无配置时，给 Manifest 指定专用 `deepseek_caption_network_security`，同时生成“基础禁明文、仅系统证书锚”及 127.0.0.1 例外；输入已有 `@xml/...` 配置时，保留原内容并追加一个回环 domain-config。它不只是一个字符串。

现在该资源修改整体停止。输入无配置时仍无配置，Manifest 既有 `usesCleartextTraffic` 等属性保留；输入有自定义证书/明文规则时原样保留；已有回环规则也保留，不再重复追加。不借此重设全局 HTTP/HTTPS 策略，也不清扫其他补丁或宿主的回环字符串。

三个资源场景均实际构建夹具 APK，分别运行冻结 M1a 的 legacy 正向对照和新 M2a 的 preserved 验证，共 **3 个有效场景 + 3 个旧包正向对照**：

| 输入 | 旧包实测 | 新包实测 |
| --- | --- | --- |
| 无 networkSecurityConfig；已有 usesCleartextTraffic=true | 新增专用配置和回环例外 | Manifest 全部属性保持，未生成专用配置；两个 stock 设置页加入完整 AI 页，宿主设置行不变 |
| 已有自定义配置、系统/自定义/用户证书锚、域名明文规则和 debug-overrides | 在原配置追加回环例外 | Manifest、策略语义及 raw 证书资源原字节保留；三种 Morphe 设置页的功能和位置验证通过 |
| 原配置已有回环规则（模拟宿主/其他补丁提供） | 再追加一条规则 | 保留原有回环规则且不重复；其他策略和设置行保留 |

每项日志在 `resources-legacy-*.log`、`resources-M2a-*.log`，前后解码 XML、编译输出 APK 和 `result.txt` 在各同名目录。新增设置页检查包含 key/title、关键设置项、Morphe video 页归属及紧邻 VOT 的插入位置；还比较移除新增 AI 页后的宿主设置树，保证原设置未被改写。最终汇总见 `network-resource-diff.json`。

## 4. 测试映射、退役和新增

退役 2 项：`anUncachedRequestAnswersWithoutWaitingForTheSourceMirror`、`theNextRequestMasksTheSourceOnceTheMirrorIsCached`。两者均直接启动旧 ServerSocket 服务，测试立即空响应/缓存镜像遮罩；已不对应当前产品的原生数据保留/draw mask 链路。没有改名冒充新覆盖，也没有为维持计数保留死代码。

新增 2 项，均走真实应用端口、MockWebServer 源字幕/翻译协议及保留视图：

- `v2RequestsPreserveNativeDataAndAiOffReleasesTheDrawMaskM2a`：真实会话取得译文后由 V2 入口分别发送源/译文 URL，验证 URL 不改写；AI OFF 保留 CC/语言、解除 native draw mask、不再取源/翻译且会话不复活。
- `v2PrefetchAndDepartedRequestsCannotRetargetTheRealSessionM2a`：活动会话收到其他目标语言及旧视频请求后，URL、当前目标、画面与源/翻译计数均保持；CC OFF 后这些请求及当前视频请求也不能重启会话或发起请求。

已有覆盖先映射后复用：NativeOnlyCaptionTest 5 项保留 URL 和原生选择契约；NativeLanguageAuthorityTest 16 项包含预取、晚到旧视频、CC OFF/AI OFF、默认/手选 handoff；ReintegratedApplicationTest 原有 40 项包含 CC/AI 恢复、原文零翻译请求、延迟回复失效和 N75 真实源/译文恢复，新增后 42 项。N74 AnimationDiagnostics 4、CaptionAnimationIdle 3、ShortsCommentViewport 2，以及 CaptionCcStartup 15、ShortsCaptionAuthority 32 均通过。详见 `test-preservation.json` 和归档 XML。

计数：core 254 不变；extension `445 - 2 + 2 = 445`；合计仍 699，这是按实际有效测试得出的结果。三个资源场景是额外可选集成验证，不混入 Android JUnit 计数。其余既有测试文件与黄金断言未改。

## 5. 最终有效验证命令与结果

在上述仓库执行：

```powershell
.\.devenv\verify-full.cmd -RunId 20261024-M2a-candidate-02 -EvidenceDirectory validation/runs/20261024-M2a-01/final -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m2a -Offline -RerunTests
```

退出 0，`final/summary.json` 为 passed；当前源码输入指纹 `6e6063c166db45137d37a76b68e3e5fd4610669f62693e45c8cd27164dc5ac6d`，构建前后相同。交付时再次核对，范围为工具定义的 Git 跟踪/非忽略源码、构建和验证输入，忽略本地前端另外保护，不声称覆盖整台机器环境。

| 模块/检查 | 本轮结果 | 证据 |
| --- | --- | --- |
| translation-core | tests=254 / failures=0 / errors=0 / skipped=0，实际执行 | `final/tests/translation-core`、`final/gradle-receipt.json` |
| extensions:extension | tests=445 / failures=0 / errors=0 / skipped=0，实际执行 | `final/tests/extensions-extension`、同 receipt |
| 验证工具合同 | 15/15 通过 | `final/verification-contract.log`、JSON |
| 发布元数据合同 | 14/14 通过 | `final/release-contract.log` |
| 本地化 | 232 keys × 14 locales | `final/localization.log` |
| 来源/提示词/compiled/UI/包边界 | errors=[]；81 compiled core classes；独立 UI 不含翻译引擎 | `final/source-boundaries.json`、`final/boundaries.json` |
| 候选/内嵌 MPE/凭据 | 通过，MPE 相等；凭据 matches=[] | `final/bundle.json`、`final/credential-scan.json` |

R8/syncExtension 在最终有效 run 由 Gradle 确认有效复用；本轮前一构建已因删除服务器/改变 build ID 重新生成 MPE。没有把最终复用写成重新运行 R8。两个 Test 任务则均强制实际执行。

资源夹具生成：

```powershell
work/toolchain/python/python.exe -X utf8 patches/src/test/resources/caption-settings/generate_fixtures.py --sdk work/toolchain/android-sdk --addon build/maintenance/M1a/20261024-M1a-candidate-03/patches-1.5.8.mpp --output validation/runs/20261024-M2a-01/resource-fixtures
```

之后通过 `.devenv/dev.cmd :patches:verifyCaptionSettingsResources`，显式传入 `-Pverification.buildRoot=build/maintenance/M2a/20261024-M2a-01/harness` 和四个 `captionResources.input/addon/output/expect` 属性；实际完整参数见 `resources-M2a-*-command.json` 及 `run-resource.ps1`。所有有效执行退出 0。脚本解析为绝对输入/输出路径；不修改 M1a 验证实现，不升级依赖、Patcher 或 SDK。

额外实际 CLI 负向检查 `negative-gates.py`：将旧 M1a 包冒充 m2a build、为新包指定旧独立 MPE、将 local 新包按严格 release 身份验证，三项都实际退出 1 并记录拒绝原因；正向新候选由完整入口退出 0。`negative-gates.json` 和三个 `reject-*.log` 保存参数/状态。没有放松检查或重算受保护期望值。

## 6. 新候选身份与包内退役证明

- 实际路径：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M2a-candidate-02\patches-1.5.8.mpp`。这是 M2a 候选，沿用已接受工具的 M1a 目录布局，没有为目录名改造工具。
- Version 1.5.8 / `local-1.5.8-m2a` / Patcher 2.0.0；584881 B。
- MPP SHA-256：`f7839db2ff51c62e5410f817b49e9075076ac9e38aaac706925d64c12bf392b9`。
- 同目录 `extension.mpe`：716832 B，SHA-256 `363edd633b9a26a25d95b351af637eaf37ff72a2516ebe1643314e3437c707ef`；与 MPP 内嵌 MPE 原字节相同。
- 同目录 `ui-preview-debug.apk`：3480976 B，SHA-256 `b13a6df4587ff1b428f686352e9068426e3485cbcf63a49c8a436340abcf5da0`。仅独立 UI 验证产物，没有安装。
- `audit-retirement.py` 读取 DEX string/type/method/class 表，而非只搜索源码。冻结旧包正向对照含服务器/派生类 6 个、旧 helper 2 个；新 MPP、独立 MPE 和合成 APK 的这些类定义、类型引用、helper 均为 0；新 MPP 的专用网络配置生成标识也为 0。V2 rewriteUrl 的 `(Object,String)String` ABI 保留。证据：`legacy-dex.json`、`candidate-dex.json`、`mpe-dex.json`、`composition-M2a-dex.json`。

## 7. 真实 Patcher 组合及资源/DEX 核查

只使用本机已有输入，没有下载或分发专有 APK。`composition-inputs.json`、`input-badging.txt`、`input-signature.txt`、`original-dex.json` 验证输入身份：

| 输入 | 路径 / 版本 | SHA-256 |
| --- | --- | --- |
| 原始 YouTube | 仓库 `YouTube` 下完整文件名见 composition-inputs；21.41.525-SECONDARY，versionCode 1561303419，208382164 B | `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712` |
| 官方 MPP | `E:\Projects\DeepSeek morphe-ai-caption-translator\.tmp\n72-shorts\patches-1.48.0.mpp` / Morphe 1.48.0 | `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7` |
| Patcher | 2.0.0，E: 已有 jar 与实际 test runtime 从既有共享 Maven cache 读取的 jar 哈希一致 | `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c` |

原始 APK `apksigner verify --print-certs` 退出 0，Google 现行/轮换证书信息留在日志；8 个 DEX、56360 类、插件类 0，未把打过补丁的 APK 当输入。共享 Maven 缓存位于 C: 是已安装工具缓存，未移动/删除，项目处理与 JVM TEMP 都在 E:。实际 runtime 路径与版本见 `runtime-verifyComposition.json`。

选择集：`AI caption translator` + 对 21.41.525 兼容的官方 default=true 根补丁 **104 项**（含 Captions，不含 default=false 的 Spoof signature）及各自依赖。两组 `official-defaults.txt`、`selection.txt` 原字节相同。通过 `run-composition.ps1 -Candidate M1a` 和 `-Candidate M2a`，分别显式加载冻结 M1a MPP、新 M2a MPP，同一 APK/官方 MPP/Patcher/选择集；未回改源码重建旧包。

两组均实际执行 `:patches:verifyComposition -Pcomposition.compile=true`，完成补丁执行、DEX 序列化、资源重编译及未签名 APK 写出/对齐，再执行现有 `:patches:auditComposition`；各退出 0。完整命令/日志为 `composition-{M1a,M2a}-command.json`、对应 `.log`、`audit-{M1a,M2a}-command.json` 与日志。

| 结果 | M1a 对照 | M2a 新包 |
| --- | --- | --- |
| 最终 APK | `composition-M1a/patched-unsigned.apk` | `composition-M2a/patched-unsigned.apk` |
| SHA-256 | `b0888721f6cd9aebfe0dae6b2a4d3a431aac7a631cc2fe235aac0e75d16a839f` | `b746722a8f290f238bc78e4dd3e874c2a836f00de8fabd22d7a1c2055acee523` |
| DEX | 16 个，64569 类 | 16 个，64563 类；无重复定义，退役类/引用/helper=0 |
| 有效网络配置 | 原配置追加一个回环 domain-config | 原始配置原字节保留 |

`auditComposition` 同时通过现行 Host Hook 单一接线、quick toggle 寄存器、N72 Shorts setter/官方状态读取、N73 两个引擎回调不写 player authority、原生选轨 dispatcher/视频归属等检查。aiInstalled=1；rewriteUrl、suppressNativeDraw、initialize、onNativeTrackApplied 等实际 Host Hook 均唯一。

真实输入的有效引用本来就是 `@xml/network_security_config_ct`，归档资源为 `res/OAv.xml`。原策略包含 base cleartext=true/system 锚、certificateTransparency、domainEncryption、YouTube/Google 域名 cleartext=false、debug user/system 锚；M2a 全部保留。原始该二进制资源 SHA-256 与 M2a 相同：`ebf381704cc748c2f715c308b7c0a7f93a109e775d7c8e0ca77719bd976f03eb`。M1a 则为 `751359539c872036002bdd23e19db12b7144a95ba4f6bcb7437e33db9e6b00d5`，解码比较恰好只多一个 127.0.0.1 domain-config。三个 Morphe 设置页和两组 Manifest 解码原字节相同。

更强的整包比较：两组 APK 条目集合相同，**仅 `classes13.dex` 与 `res/OAv.xml` 内容不同，其余 18389 个条目原字节相同**（包含 AndroidManifest.xml、resources.arsc 和其他网络/证书资源）。`network-resource-diff.json`、`composition-archive-diff.json` 和 `real-{original,M1a,M2a}-resources` 保存核查证据。已有回环规则的夹具仍保有其原规则，验收不要求整个 APK 没有回环字符串。

## 8. 失败记录、限制与交付判断

- 初次完整 run `20261024-M2a-candidate-01` 的两组测试/构建/包检查通过，但当时还在补充资源验证文件，输入指纹发生变化；验证入口如期拒绝整批。保留 `full/summary.json` 和全部日志，不把它算成最终通过。源码固定后最终 run 02 强制重跑两组测试并全部通过。
- 资源入口调试中，第一次未引用的 PowerShell `-P` 参数没有按预期传递；重试发现 JavaExec 默认从 patches 子目录解析相对输入。修正新任务的可选参数接线与根工作目录，统一脚本绝对路径后通过。失败日志 `resources-legacy-absent.log`、`resources-legacy-absent-retry.log` 保留；本轮生成的错误相对路径目录已移动到本证据的 `failed-relative-output`，未删除任何入场文件。第一次参数失败只产生默认 build/n39 的 problems report，未改变旧交付资产。
- 临时实现脚本首次受 Windows 默认文本编码影响，在读取中文 Kotlin 时失败；改用显式 UTF-8，并依入场原件恢复修改文件的原换行风格。最终批次 diff 没有整文件换行变更。
- 附加 DEX 表审计在合成 APK 初次运行时把跨 DEX 正常的同一 method_id 引用重复误算为 ABI 重复；已改为按完整方法签名去重，另记录引用数。现有 `auditComposition` 原工具未修改，始终通过；最终类定义重复仍严格为 0。没有放松产品 ABI/来源/包校验。
- 累计 `git diff --check` 会把此仓库 `* -text` 下保留的 CRLF 行尾报告为 trailing whitespace，包含大量入场已有的 M1a/历史改动；没有借此格式化范围外文件。相对入场的批次检查在审阅 diff 中只规范行终止符，新增实际尾随空格/制表符为 0；精确原字节仍由原件和哈希保存。
- 本卡规定的资源场景、当前行为回归、新候选、包内退役和至少一组真实完整组合均已完成。仍未执行远端 CI、其他版本/选择集矩阵、设备视觉/导航/性能复测、真实付费服务、正式 prepare/publish。没有签名/安装 APK、清用户数据或外部发布。真实组合不等于设备运行；输出 APK 仅本机证据，不作为签名安装或分发交付。
- 没有工具实质问题需要修改 M1a 工具；`tools/verify_current.py`、验证 init、verify_bundle/verify_integration、CI、发布链、依赖版本和受保护黄金文件均保留入场字节。

## 9. 回退和统筹交接

本批可回退到入场原件，不能硬 reset、clean 或用旧 ZIP 整体覆盖工作树。`rollback.py` 按 `batch-changes.json` 对每个当前文件先核对退出哈希；只要后续有新修改就整体拒绝。默认只 dry-run，`--apply` 才逐文件恢复本批涉及原件并删除本批新增的两份资源验证源码；保留结果报告和所有证据。文档状态/镜像亦回到入场字节。缺失的旧服务器/测试仅从入场 ZIP 恢复。没有用户数据迁移，无需回退用户数据。

```powershell
work/toolchain/python/python.exe -X utf8 validation/runs/20261024-M2a-01/rollback.py
# 仅在明确决定回退且 dry-run 全通过时，使用同命令追加 --apply。
```

回退后应重新运行当前验证入口，而非把冻结旧包当成源码已回退的证明。历史交付从未覆盖，不需要恢复它们。源码回退和 APK 安装是不同操作，本轮不做安装。

维护入口和项目状态记录为“已完成待复核”，镜像逐字节相同。需要统筹判断：按 M2a v1 复核实际批次、资源对照和组合证据是否接受；没有本卡外实施决定。建议仅先完成这次复核，再由统筹决定是否下发下一任务；未执行其他 M2 清理或 M3。
