# M7b / 任务卡 v1：有限兼容、来源说明与设备验收准备

任务日期2026-10-25；执行收尾2026-10-26（Asia/Shanghai）。**本地工作完成待复核；设备待安装/待观察。** 统筹保持待复核；不自行接受M7或首轮总体。本对话完成A/B/C本地工作，没有签名、安装或真实付费调用。

唯一活动仓库`E:\Projects\DeepSeek morphe-ai-caption-translator`。分支`codex/fix-cc-authority-1.5.8`、HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`保留。最后接受仍**1.5.8 / local-1.5.8-m6a / candidate-01**；本轮最终待复核**1.5.8 / local-1.5.8-m7b / candidate-02**；公开仍**1.5.7 / release-1.5.7**。candidate-01曾完成完整验证，但包审计发现首次draw-hook仍发旧来源，故封存后最小补正、增加有效红绿、重新统一验证和实际双组合，02为唯一最终交付。两次候选和所有失败/中间证据保留。

证据根：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M7b-01`。以本轮entry-originals.zip/entry-manifest.json比较，不把相对HEAD旧脏树当本轮差异。根AGENTS及卡、状态、M7a复核、开发/操作/兼容/发布/诊断合同/收尾清单均已读取。scope仅M7b，没有推进其他任务或擅自接受。

## A：声明、有限实际组合、fixture、设备分层

[兼容表](../../COMPATIBILITY.md)与双语README将以下层级分开：

1. 根Constants.YOUTUBE、当前实际加载addon MPP、公开1.5.7元数据、实际加载官方1.48.0 MPP的对应六个21.x目标及稳定/实验/minSdk标记一致。真实读取/比对见target-declaration-audit.json、official-loaded-targets.log及official-local-metadata.json。官方还包含旧20.x元数据，不等于addon复活20.x；列表不泛化连续范围，旧21.20.405推荐只说明稳定声明，没有当前该版本APK组合或设备认证。
2. 主组合21.41.525-SECONDARY、唯一补充21.28.208，均使用已有签名可核验输入，实际104默认根+AI、compile=true和DEX审计；逐组选择集/命令/receipt/输出独立保存。补充版覆盖较早播放器回调布局，不追六版本矩阵，不下载专有APK。21.42.241/21.20.405/21.16.256缺现存原始APK，21.23.492现存但未选；没有它们的当前组合/设备通过结论。
3. 输入APK用apksigner验证，SDK分段证书SHA-256匹配Constants已有两摘要：`5aad2bee6db95d17e05a08d7d1e64c10a1511879154483916b6ae6c7fd9cb0c6`、`3d7a1223019aa39d9ea0e3436ab7c0896bfb4fb679f4de5fe7c23f326c8f994a`。实际解析定义类：主56360、补充54032，无app/yydarlinker或app/morphe/extension类。不是按文件名判断“原始Google APK”；证书匹配不额外认证原下载渠道或完整信任链所有权。
4. fixture/JVM两组验证原CC/语言/会话/预算/配置/cache/诊断行为；不把测试数换算成设备兼容度。用户有设备但没装当前候选，ADB只读devices未列出任何设备，型号/系统/ABI/已有安装版本和签名均unknown；设备表全部待安装/观察，旧观察不倒填。

历史1.45.0、1.47.0、1.48.0-dev.6及旧发布组合仍保留为历史。旧21.20.405 flyout VerifyError相关寄存器修复有结构/DEX检查，但不声称未测试目标已设备解决。其他根选择、提供方/OEM/语言/硬件范围仍有限。

## B：真实来源说明、有效红绿与最小生产修改

source-metadata-inventory.json盘点report/fullText、manifest、Snapshot/UI导出读取者、BuildConfig/core及首次draw事件。仅两份生产Java与build ID改变：

- CaptionDiagnostics.fullText：保留ui/engine/core/build及所有旧统计字段，旧`official=1.45.0`改为`official=unknown; official_source=runtime_unverified`；新增patcher unknown/类别、build_expected_official=1.48.0、build_expected_patcher=2.0.0、composition=unverified，以及固定core仓库完整commit、local适配和provenance记录路径。没有可靠设备运行来源接口，故即使离线组合已通过也不把export填成实际1.48.0。
- NativeCaptionBridge：包审计发现首候选仍含会实际发出的`NATIVE_DRAW_HOOK_CONNECTED build=n30;official=1.45.0`。先保存真实draw→writer→archive→fullText红测，再只将build改为真实BuildConfig、official改为unknown/runtime_unverified；保留事件名、只采样一次的门及原draw返回判断。该改动属于任务卡直接相关诊断来源适配，未重构native桥。
- gradle.properties：build ID按卡为local-1.5.8-m7b，产品版本1.5.8、公开1.5.7保持。没有依赖/协议/提示词、请求/调度/预算、缓存身份/格式/TTL、配置/凭据、Overlay算法或ABI变化。source-review.json精确逆变换证明：移除两处metadata差异后，两生产文件全部原文与入场一致；原有源码本身为LF，无额外换行改写。

完整旧→新映射见[诊断合同](../../architecture/DIAGNOSTICS-PERFORMANCE-CONTRACT.md)。现有测试无official=1.45.0/build=n30强制字符串断言，故未删除/放宽原断言；所有既有测试/资源保持。新测试的初稿core_adaptation期望带分号，绿测前拆为core_adaptation和core_provenance两合法字段断言，official红断言未变。无新UI开关/文案，无需扩充14语言；原239键×14语言继续通过。旧日志中的1.45.0仍逐字保留，旧累计/限额/脱敏/epoch不回写、不重算；解析器须允许unknown/旧日志缺新字段。

| 检查点 | 实际tests | failures/errors/skipped | exit | 含义 |
| --- | ---: | --- | ---: | --- |
| red-01 | 2 | 2/0/0 | 1 | 入场m6a生产的真实export仍为1.45.0；两个有效来源红断言 |
| green-01 | 19 | 0/0/0 | 0 | export来源及相邻队列/历史/本地化/脱敏通过 |
| final/run，candidate-01 | 874 | 0/0/0 | 0 | 首候选完整验证通过，但后续包内容审计暴露遗漏draw文字；已保留，不作为最终 |
| red-draw-01 | 3 | 1/0/0 | 1 | 实际首次draw事件为build=n30/official1.45.0；非构造失败 |
| green-draw-01 | 24 | 0/0/0 | 0 | draw来源修正、原生字幕/开关与导出相邻保护通过 |
| final-02/run，candidate-02 | **875 = core328+extension547** | **0/0/0** | **0** | 最终固定输入，Offline+RerunTests两组实际执行 |

每个检查点原log、同次XML/receipt、输入指纹/源码和compiled ZIP在下一Gradle前封存。红01源码从入场ZIP及当时新测试精确还原并逐项匹配red before指纹，生产与入场完全相同；red-draw有当时完整源码ZIP且NativeBridge等于入场。实际summary/完整export保留在XML system-out，旧日志不覆盖。没有缺文件红测、线程加时、跳过旧保护或整测重试。

## 固定最终输入、工具和完整验证

入场工程指纹`aa19b7c8815d30105b975a39805ca384e39fcc86a8829584445c67ce7cae7d05`；首候选`e5ac21e4a44268ddd7dd95aba582bab872ad6ac09016053cc4ffb74f23a26d10`；最终 **`7bcddcbc4f76d37f15019a8c919473644c892b5c1d1c45888b0cad80796f6bb6`**。fixed-inputs-02.json/zip、完整入口前后及退出工程一致。

按DEVELOPMENT显式设置本进程JDK21、Python3.12、SDK35/36/build-tools36、Robolectric及E:Gradle/Android home；明确共享只读Maven产物输入`C:\Users\14776\.m2\repository`。GITHUB_ACTOR/TOKEN仅literal offline-cache-only非凭据，全部Gradle离线、translation.live=false；没有读取账号token/真实模型key，没有在线模型调用。

```powershell
.\tools\workspace\verify-full.cmd -RunId 20261025-M7b-candidate-02 `
  -EvidenceDirectory validation/runs/20261025-M7b-01/final-02/run `
  -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m7b -Offline -RerunTests
```

实际含环境的完整args/退出码见各command.json与exit.json。最终完整entry exit0，**115份XML**：core328+extension547=875，两Test任务真实executed，失败/错误/跳过0。工具合同workspace15、verification17、release14；本地化、metadata、固定来源/协议/提示词/Hook ABI、compiled/UI/MPP/MPE、identity与credential边界全部通过。

final-02/run/compiled.zip在下一Gradle前保存**557个不同物理编译文件**；归档按角色有638条目，因为core与translation-core-debug指向同一81文件，双路径内容逐项相等，不把重复条目当新生产类。compiled-binding.json绑定逐条SHA、receipt和固定指纹。独立从本次ZIP提取core，显式MPP/MPE/UI边界通过；真实存在的local冒充release、接受M6a冒充M7b均exit1，理由是身份不符，非缺文件。记录见independent-commands-02.json。

| 最终产物 | 绝对路径 | 字节数 | SHA-256 |
| --- | --- | ---: | --- |
| MPP | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M7b-candidate-02\patches-1.5.8.mpp` | 600263 | `d0f84dfab104c6167126042247734e2b1d4e6c33de332df6d59ff49aa153cd30` |
| 独立/内嵌MPE | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M7b-candidate-02\extension.mpe` | 733284 | `1d9cc55df0a158fa89d8c7b6190c946f5b67d6ecc14aff23aba3f5139880d6a0` |
| UI preview debug APK | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M7b-candidate-02\ui-preview-debug.apk` | 3522156 | `374fe8bb89417d16801a02f03eafc4197ef69c9e6bbcae71fbbc3b7b7bfed89c` |
| 主组合unsigned APK | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M7b-01\composition-primary-02\composed\patched-unsigned.apk` | 227146154 | `379d1643ea7ba088f3f9c707fdf69bcc6dea6e98a4d0cdb9c81cbf54d5714d67` |
| 补充组合unsigned APK | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M7b-01\composition-supplement-02\composed\patched-unsigned.apk` | 217311407 | `dd83936dbc2351efd8cae36d2b8516ffe07efb892a1a05ef397eba71f4f7cde9` |

MPE是raw DEX；独立与内嵌相同。UI preview来自完整入口正常debug构建，仅作验证，不是YouTube安装包；与接受M6a的ZIP差异仅classes5.dex/classes6.dex，其他16条目同内容，对应相同来源文字/build身份。本轮未对组合APK执行签名。公开1.5.7的patches-list/bundle/CHANGELOG与发布资产不变。

## 最终有限组合、逐条目包体和来源核验

在最终完整compiled/XML归档后，canonical dev.cmd分别执行verifyComposition(compile=true)与auditComposition；显式Patcher JAR，不回落历史toolchain路径。四次Gradle实际exit0，选择集合/输入/receipt/runtime classpath/structural hooks独立保存在composition-primary-02、audit-primary-02、composition-supplement-02、audit-supplement-02。

| 输入/检查 | 主组合 | 唯一补充组合 |
| --- | --- | --- |
| 原始YouTube | 21.41.525-SECONDARY / 1561303419 | 21.28.208 / 1561185128 |
| 输入SHA | `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712` | `1c186be5074d4f027d2cf8cb1beb4fc8964782e196037b6ebf2eee44b03ba6d1` |
| 官方MPP | 1.48.0 / `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7` | 同一明确输入 |
| Patcher | 2.0.0 / `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c` | 同一明确输入 |
| 选择/资源 | 104兼容官方默认根+AI，compile=true实际重编译 | 104兼容官方默认根+AI，独立重编译 |
| DEX唯一类/结构 | 64581，quick-toggle寄存器与全部规定hook通过 | 62253，同样审计通过 |
| 输出身份 | `app.morphe.android.youtube` / code1561303419 | `app.morphe.android.youtube` / code1561185128 |
| SDK/ABI/签名 | minSdk29，arm64-v8a/armeabi-v7a/x86/x86_64，unsigned | 同左；APK独立SHA如上 |

相对接受M6a，MPP共74条目，仅manifest(Timestamp)及内嵌MPE变化，其他72内容相同，14语言资源全部相同；无增删条目。package-content-audit.json逐条给出SHA/压缩贡献。主APK差异条目：`classes12.dex, classes13.dex`，其余18389条同字节，无增删。解码XML与compiled-cap字符串/ID核对保持；3346个cap值均同。实际classes12/13有840类，新增/移除0；除debug/build ID后，逻辑变化仅CaptionDiagnostics与NativeCaptionBridge的来源文字，Hook/HookV2、Controller、Overlay、SourceCache等原类保持。新来源字段在真实MPE及两组组合DEX中核验，当前生产不含无标注official1.45.0或build=n30；没有新依赖、测试类/资产/诊断脚本泄漏。

MPP **600147→600263 B，+116 B（0.01933%）**。各变动压缩条目：META-INF/MANIFEST.MF 0 B; extensions/extension.mpe 116 B；ZIP结构差+0 B。MPE未压缩+392 B不能与MPP二次压缩增量相加；主APK227145902→227146154 B。增长是诊断来源字符串及build身份，没有UI语言资源/依赖增长，不从包体推速度/帧率。

## C：安装前/设备准备和未覆盖

[具体安装前与短设备表](../M7b-DEVICE-ACCEPTANCE.md)列最终SHA、实际输出包名、code、minSdk/ABI及unsigned状态。ADB devices没有连接项；没有设备操作、安装、keystore/私钥/密码读取。签名后APK尚未生成；输入已锁定但签名证书/alias与现有安装身份未知。保留数据升级须同包名、允许code、SDK/ABI兼容、现有签名一致/可验证兼容谱系，当前不能保证覆盖，不建议卸载/清数据/强制降级。

短设备表按安装启动/设置错误反馈、原生CC语言与AI源模式、普通/全屏/Shorts评论、切视频/同视频重入/退出、诊断身份脱敏合并。源模式观察窗口新增模型batch/attempt应0，旧累计不清零；不点击测试API或使用保存key。真实翻译须另有对应服务授权；本轮仅fixture。普通视觉/导航通过不等于frame-time/内存/能耗预算认证，没有这些数据就不作数值结论。所有设备行保持待安装/待观察或未执行。

仍未认证：新机空缓存安装/在线registry认证/Maven包原发布commit/Python可执行分发来源/远端CI、其他APK/根组合/OEM/提供方、十四语言母语质量、实际服务接收/计费/退款及任意线程交错。M6a主线程启动严格读取、硬件Keystore/物理IO长尾、源put之前晚到窗口/跨文件断电双IO/配置多store-orphan等原合同限制保留。没有扩大性能或故障认证范围。

## 保护、取证偏差与回退

入场原件/branch/HEAD/index/exclude、公开元数据和生产源码在首改/首Gradle前保存。entry-engineering-from-originals.json从入场字节重建并精确匹配aa19指纹；红源码ZIP逐项核对。17371项有限历史保护清单保留旧交付/不可变log/XML/receipt/compiled ZIP和原件，不纳入可再生成Gradle内部class/工作区。**时序偏差：首个辅助脚本递归遍历过宽，已停止自身进程；最终历史哈希封存晚于首个Gradle开始。** 该事实见capture-scope-note.json，不冒称提前完成；历史资产从未被编辑或作为本轮构建输出，退出再逐项核验。此项是否需要补正由统筹决定，执行者不自行豁免任务卡要求。

其他辅助偏差如实保留：首次签名解析器只接受Signer #n，实际为按SDK分段的Signer (...)，修正解析后两证书真实验签通过；首次Patcher路径假设不存在，改为明确、既存且与M6a相同SHA的共享Maven JAR。第一次包审计错误把raw MPE当ZIP，修为直接DEX读取；其后“不得残留official1.45.0”保护有效暴露draw-hook遗漏，未放宽该保护，而是补红/修正/重做完整验证与组合。包审计辅助器曾按文件名误猜类名CaptionOverlayV2，而实际DEX名为CaptionOverlay；保留已完成的canonical TSV和原辅助器，改用真实类名后原严格同字节断言通过，未重跑Gradle或放宽产品保护。独立Python检查生成了既有tools/__pycache__/verify_current.pyc，已保存本次生成字节并从入场ZIP精确还原，之后显式禁止写源树bytecode。原两删除/未跟踪/index/exclude均保持。

本轮文档更新兼容表、必要双语用户说明、诊断合同、维护入口/操作/开发/发布说明、路线/收尾清单及简明PROJECT-STATE/镜像。状态镜像逐字节一致。结果、证据、历史及所有包不属于回退删除目标；完整差异以batch.diff/rollback-plan.json为准。

默认回退命令（只检查）：

```powershell
& 'E:\Projects\DeepSeek morphe-ai-caption-translator\work\toolchain\python\python.exe' -B -X utf8 `
  'E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M7b-01\rollback.py'
```

退出逐文件哈希与原件ZIP绑定，所有目标先整体检查，任一后续编辑/删除冲突零写拒绝；只有显式--apply才恢复本卡入场字节。状态/镜像同一计划。实际仓库默认dry-run及E:隔离演练的dry-run/后续编辑拒绝零写/显式隔离还原，结果见rollback-rehearsal.json；**实际仓库未apply**。不reset/clean，不覆盖后续修改，不清用户数据。回退只针对本卡源码/资料，不回退Android数据或签名身份。

全部项目工作/临时/证据在E:，共享工具缓存留原位。没有commit/tag、push/PR、发布、对组合APK签名/安装、卸载/清用户数据或真实缓存、真实付费API、清共享缓存、reset/clean。提交统筹判断来源红绿/有限组合/安装准备与历史封存时序偏差；**本地工作完成待复核；设备待安装/待观察。**

退出补记（2026-10-26）：17个逐文件回退目标；exit-originals.zip SHA-256 `04ad0d5a9a90be306c64be9f9101a66dd83434e16c1f943c3df24a6243b0f244`，entry-originals.zip SHA-256 `a97844d3b2f2d2908b77bf52f9e41e0c1593c9ab1f71fc8dca9fabdd81e021d4`。实际default dry-run通过；隔离后续编辑整批拒绝、writes=0及隔离还原通过。退出比较确认2258项既有现存文件同字节、15项既有文件仅本卡允许范围改变、两删除保持；新增仅来源回归测试、设备清单和本结果。17371历史资产逐项SHA检查通过，当前状态/镜像同字节、branch/HEAD/index/exclude保持；工程仍为最终固定指纹。13份当前文档105个本地链接有效。详细索引见evidence-index.json；本结果不属于回退移除目标。
