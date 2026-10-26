# M5f / 任务卡 v1 执行结果

2026-10-25（Asia/Shanghai）。**配置与凭据持久化调查、当前合同、必要离线测试与指定完整验证已完成，交统筹复核；统筹状态保持待复核。** 发现的保护差距未修复，不宣称当前实现完全满足资料保护要求。生产仍 **1.5.8 / local-1.5.8-m5d-r1**，公开仍1.5.7。未进入缓存迁移、F5、性能或其他任务。

## 1. 入场与本批差异

唯一仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`；进入/退出均为 `codex/fix-cc-authority-1.5.8`、HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`，复用原工作树/分支，没有commit/tag/推送/PR。先读AGENTS、当前身份/最新维护记录、维护入口、M5e REVIEW、M5f卡、路线M5、状态及网络合同。M5e受控顺序/夹具改善接受范围、历史原始交错仍未知，以及F1/F2/F4接受范围、F3语义缓存和F5诊断决定保持。

证据独占 `validation/runs/20261025-M5f-01/`：

- `entry.json`保存全部状态、branch/HEAD/index哈希、2215个现存Git可见文件及既有删除清单；`entry-originals.zip`保存原件，`entry-working-tree.patch`/`entry-index.patch`保留原差异。不以HEAD作为完整基线。
- `entry-seal.json`绑定入场ZIP及冻结M5e MPP；`protected.json`有限2754项覆盖继承保护清单、M5e执行/复核、相关历史候选，未枚举旧解码树；`entry-ignored-tools.json`含六个前端。保护清单/原证据/历史资产均不改。
- **首次新Gradle前**，`prior-reports/`保存203份当前XML/HTML，逐文件哈希在`prior-reports.json`。每轮新报告由run-tests.py在退出后归档完成才启动下一轮；完整入口也先归档当前XML/receipt及同次compiled。
- 本批只改4个已有文档：`docs/ARCHITECTURE.md`（最小合同入口）、维护README/路线（交回状态）、PROJECT-STATE；同步本地状态镜像。新增当前合同、ConfigCredentialFailureTest及本结果，共3个Git可见新文件。`batch.diff`是入场原件→退出差异，包含新增文件；其他既有测试/生产均保持。

## 2. 当前合同、测试盘点与主要事实

[CONFIG-CREDENTIAL-CONTRACT](../../architecture/CONFIG-CREDENTIAL-CONTRACT.md)给出完整源码→操作→写入/异常→testcase矩阵、所有者与UI调用链、坏数据表、问题清单。证据`investigated-sources/`保存10份主要源码，`source-matrix-inputs.json`绑定哈希；测试源码在各轮sources/中保存。真实字段链为ApiProfilesPreference→ApiProfiles.select/flush→ProfileEditorPreference→DeepSeekTextPreference/DeepSeekModelPreference→DeepSeekConfig/SecureApiKey。

先盘点已有ApiProfilesTest（8）、ApiProfileSnapshotTest（1）、ProfileUiRegressionTest（13）、SettingsSurfaceFrameworkTest（5）、N37SnapshotBindingTest（SDK28/35共6）、AnimationDiagnosticsTest（4）、ProviderEndpointTest（8）。其中Snapshot/N37整体load返回fake key，Animation连decryptStored也映射cipher-a/b；它们支持上层归属/线程/次数，不能作为真实加密故障证明。ApiProfiles/UI测试中手放占位密文支持字段/清除/origin/装配，缺少可信加密正向对照。

新增22项保留真实SecureApiKey/ApiProfiles/DeepSeekConfig/UI字段与实际Cipher：正常A/B save/load、坏Base64/截断/非法IV/翻GCM tag、缺alias/KeyStore拒绝/错master、origin拒绝与诊断capture/resolve区别、legacy绑定、坏JSON/字段类型/ghost active/坏endpoint、加密前/后保存失败、真实编辑拒绝/部分flush、create/select/delete跨store部分失败、明确clear和正常legacy删除及恢复。每个代表性故障比较完整fixture偏好；另一个有效profile和全局设置作为保留对照，恢复后再次真实读取/保存。每个JUnit方法的具体断言及替身边界见合同第5节；`fixture-before-after.json`提取原XML的逐次前后快照，`M5F_FINAL`保留恢复后的最终fixture。

实际结论包括：

- default values与全局设置共用deepseek_caption_translator；新profile values独立，index另存，secret同文件按profile ID分键，master alias共享。多次apply不是跨store事务。
- load/decrypt不可读通常返回空、不删除密文、不生成master、不选别人的key；hasSavedValue只检查存在/origin，不证明解密或保存成功。字段类型和origin解析异常可能在decrypt保护层外传播。
- origin缺失兼容读不写；saveBaseUrl先绑定旧origin再写新endpoint。origin拒绝可在改回旧origin后恢复。captureCredential只为延后诊断脱敏，不作请求key装载，也不执行origin拒绝；真实请求settings及延后models supplier保持原锁/身份约束。
- 创建values先于names，删除index先于secret/values，选择先逐项flush再active/changed。失败可以部分完成，提示保留不等于实际旧数据全保留。没有修改任何生产策略来让测试通过。

## 3. 问题清单与保护要求差距

| 编号 / 建议 | 已观察到的当前行为 | 应有要求 / 状态 |
| --- | --- | --- |
| C1 / P1 | **真实UI编辑链**：先URL保存成功、后key因KeyStore拒绝，select=false且旧active保持，但旧endpoint已变；原密文仍在，因origin不匹配暂不可用；无全局refresh，模型通知已发生 | 失败时不应悄悄暗示完整旧配置保留；原子预验证/补偿/显式部分成功由统筹另卡决定。已动态复现，未修复 |
| C2 / P2 | 注入index/secret/values apply失败分别产生orphan values、index先变/密文还在、目标key已删但values未清；active apply后throw可新active已可见而revision/通知未变 | 部分失败的资料/可达性/通知语义需明确。目标方法真实、底层代理注入，设备实际故障可达性待验证；未修复 |
| C3 / P2 | 坏JSON/类型错误抛异常，ghost active不自动修复、数字名称optString；坏endpoint可在origin层抛异常 | 保留原数据并有明确不可读/恢复路径。返回/异常已动态复现；完整设备UI路径仅源码风险，未修复 |
| C4 / P2 | 代理apply后throw：UI错误/拒绝切换，密文已经替换；代理drop：save正常返回但旧key仍读到 | 保存/提示不能误称落盘或完整保留。已动态复现替身，不等同Android真实apply失败；未修复 |
| C5 / 待定 | recreate忽略flush=false；save后通知失败也可能进入retained提示 | 源码确认，未独立动态复现。草稿/提示契约留待后续，不宣称已修 |

本轮代表性读取失败都保留了完整fixture偏好，并有B可读/故障撤除后A恢复对照；没有发现自动删密文或跨profile回退。绿色测试刻画了包含差距的当前事实，**不代表C1–C5已解决或资料保护全部通过**。删除路径本来就是用户明确删除，部分删除不能改写成读取失败自动删除。本调查未清空配置、删除不可读资料或改变生产期望来隐藏问题，没有实现迁移策略。

## 4. 注入、零外部HTTP及验证边界

测试只用fixture-m5f系列明文、测试AES master和Robolectric偏好。JVM测试provider接管AndroidKeyStore查询与缺alias生成拒绝，原provider及顺序在finally恢复；实际Cipher provider为Conscrypt，没有shadow load/decrypt/Cipher。正常密文由真实SecureApiKey.save生成；篡改tag/错master真实触发解密失败。未碰Windows凭据、用户profile/密文或真实设备Keystore。

Context/SharedPreferences包装器委托真实Robolectric store，在目标apply前、完成后、吞写处注入；它们证明控制流与部分状态，不证明真实磁盘满/断电/硬件故障。缺alias读不生成master；缺alias保存进入真实generator.init，测试provider拒绝并确认原密文不变，未声称硬件新master创建/跨重启恢复。

新测试阻断模型onCredentialsChanged/配置refresh的外部效果并计数，Catalog/Cronet未映射调用抛AssertionError，临时ProxySelector拒绝其余默认HTTP；每例断言discovery/connections=0。新测试零连接尝试；相关/完整套件沿用既有本地fixture HTTP，不访问真实YouTube/模型/外部配置端点，完整Gradle有translation.live=false及offline。未调用真实付费API。

清理恢复provider/ProxySelector/ApiProfiles editors、flushing和revision，取消本fixture pending字段callback并结束Activity；未改Host/Output/Audit。`cleanup-evidence.json`检查失败夹具21次及有效22/22/22次的cleanup标记，全部恢复true；完整套件其他测试继续正常。无新增Thread.sleep/随机循环/整测重试；只做聚焦与相关组两次有效检查，之后完整入口。

SharedPreferences.apply的进程内可见与真实异步落盘不同，本实现不提供落盘确认。Robolectric getAll、Application Context读取和代理丢写不证明真实硬件/进程杀死重启、断电、磁盘满、卸载重装、认证失效或真实设备UI。全局旧style迁移回填与诊断副作用依据源码/已有测试，不把本轮扩成所有字段乘积或所有通知失败验证。

## 5. 实际命令、失败记录与固定输入

以下命令均在E:运行；.devenv进程环境设置TEMP/TMP/Gradle/Android home，没有改全局环境。各次Gradle顺序执行，前一轮XML/HTML/receipt已归档才启动下一次。完整argv在每轮command.json/full-command.json及final/summary.json。

```powershell
$devInfo = . ./.devenv/Enter-Dev.ps1
& $devInfo.Python -X utf8 validation/runs/20261025-M5f-01/entry.py
& $devInfo.Python -X utf8 validation/runs/20261025-M5f-01/run-tests.py focused-first ConfigCredentialFailureTest
& $devInfo.Python -X utf8 validation/runs/20261025-M5f-01/run-tests.py focused-runtime ConfigCredentialFailureTest
& $devInfo.Python -X utf8 validation/runs/20261025-M5f-01/run-tests.py focused-boundaries ConfigCredentialFailureTest
& $devInfo.Python -X utf8 validation/runs/20261025-M5f-01/run-tests.py related-order ConfigCredentialFailureTest ApiProfilesTest ApiProfileSnapshotTest ProfileUiRegressionTest SettingsSurfaceFrameworkTest N37SnapshotBindingTest AnimationDiagnosticsTest ProviderEndpointTest
powershell.exe -NoProfile -ExecutionPolicy Bypass -File validation/runs/20261025-M5f-01/full-and-archive.ps1
```

full-and-archive.ps1实际调用：

```powershell
.\.devenv\verify-full.cmd -RunId 20261025-M5f-candidate-01 -EvidenceDirectory validation/runs/20261025-M5f-01/final -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m5d-r1 -Offline -RerunTests
```

| 轮次 | tests / failures / errors / skipped | 真实结果与说明 |
| --- | --- | --- |
| focused-first | 0 / 0 / 0 / 0 | 编译失败：Android API只提供Provider(String,double,String)，fixture使用了String版本构造；非产品红测 |
| focused-runtime | 21 / 21 / 0 / 0 | setup错误预设SunJCE，实际Conscrypt；均在setup验证点失败，原件/cleanup保留，不能计入目标故障通过 |
| focused-boundaries | 22 / 0 / 0 / 0 | 修正构造及provider假设，保留真Cipher；增加一个apply后抛错/UI提示对照，22目标边界有效 |
| related-order | 67 / 0 / 0 / 0 | 8 suite，含新增22与原45，无既有测试修改 |
| final translation-core | 320 / 0 / 0 / 0 | 本次实际执行 |
| final extensions:extension | 481 / 0 / 0 / 0 | 本次实际执行，较入场增加22 |

完整共 **801项**，103份XML归档并逐份哈希，failure/error/skipped均0；两组Test都executed/did_work=true、非UP-TO-DATE。固定输入指纹 `938bf5d457a8972da294334c5ab07939b38f20a4fb86481e30da2b79fcebcd41`，source-manifest前/后及退出复算相同。没有产品修复红→绿主张；前两轮开发错误的来源、命令、receipt、日志和报告保留，不把它们写成加密缺陷发现。相关组是有限顺序检查，未声明随机排列或长期统计稳定性。

完整入口localization（14 locales×232 keys）、来源/协议/提示词/ABI、release/verification自检、metadata、Gradle、候选、compiled/UI/包边界及凭据扫描均退出0。metadata核验公开1.5.7，不改变当前本地身份。构建任务执行/缓存复用按receipt如实记录，尤其R8若UP-TO-DATE或FROM-CACHE不冒称重新执行。`compiled-core-from-full/`在完整入口结束后立即归档；81 class逐文件与接受M5e相同。

## 6. 新候选、生产同字节与历史组合引用

| 产物 | 独占绝对路径 | 大小 / SHA-256 |
| --- | --- | --- |
| MPP | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5f-candidate-01\patches-1.5.8.mpp` | 586963 B / `5ad37d9ffcdce377898f25f72d8af6badf8e9c4302e5512c661719a59bf132b8` |
| 独立MPE | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5f-candidate-01\extension.mpe` | 721296 B / `0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e` |
| UI APK | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5f-candidate-01\ui-preview-debug.apk` | 3481784 B / `9bf766f99c79ce47f7acabfe8b8115c89ec6cfa4667ee6dbf923d6e3b48fe20f` |

未覆盖旧候选。对入场M5e MPP `e007601dd93da64925acb624bc66e3187746404b4389533b1ae2e78641288958`逐条目比较：74条目中73原字节相同，唯一变化META-INF/MANIFEST.MF仅Timestamp；根DEX/资源及扩展MPE同字节。独立/内嵌MPE均为 `0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e`。`candidate-entry-comparison.json`和`manifest-timestamp.diff`保留条目哈希/实际差异；159个/src/main含资源生产文件、来源/build ID/协议/alias/键/格式/依赖/工具均保持入场原字节。

**生产同字节证明后，只引用而未重做** [M5d-R1结果第5节](M5d-R1-RESULT.md#5-同输入真实补丁组合与既有dex审计)的一组历史组合：原始YouTube21.41.525-SECONDARY APK `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`、官方MPP1.48.0 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`、Patcher2.0.0 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`；104官方默认根+AI caption translator。历史未签名APK `validation/runs/20261025-M5d-R1-01/composition-M5d-R1/patched-unsigned.apk` SHA `71b77e0a6758f0417a135ee3f8c2ea24e4a1814f6f844f30f6483cdbc329c34c`，16 DEX/64565唯一类、真实资源重编译及DEX审计属于那一轮。本卡不扩大到其他组合/设备/真实服务/费用，也不冒称本轮重新组合或安装。

## 7. 退出保护与逐文件回退

`source-protection.json`/`verification-audit.json`核对：2215入场现存文件中2211范围外原字节保持；159生产文件、140原测试文件、2754有限历史项、六忽略前端、两个既有删除状态保持；index/分支/HEAD不变，状态镜像字节相同。入场ZIP各成员哈希验证通过。未删除资产/旧失败/报告、未清共享缓存、未reset/clean。

`batch.diff`按入场原件生成；`exit-originals.zip`保存本批退出字节；`rollback-manifest.json`列7个可回退文件（4个既有文档+状态镜像+新合同/新测试）的逐文件entry/exit SHA及原件位置。新结果文档、所有证据和新旧候选明确保留。`rollback.py --check`只读实查；任何文件与退出哈希不符则拒绝覆盖，原件ZIP/退出ZIP哈希也须匹配，状态与镜像必须成对选择。

```powershell
work/toolchain/python/python.exe -X utf8 validation/runs/20261025-M5f-01/audit.py
work/toolchain/python/python.exe -X utf8 validation/runs/20261025-M5f-01/rollback.py --check
# 将来若统筹明确选择单文件回退，可用：
work/toolchain/python/python.exe -X utf8 validation/runs/20261025-M5f-01/rollback.py --restore docs/ARCHITECTURE.md
# PROJECT-STATE与镜像必须在同一次--restore中成对指定。
```

恢复原有文件时还原入场字节，保留本卡前的未提交修改；撤回新合同/测试时将文件移至本轮证据rollback-withdrawn/，不删除证据。全量回退需逐项明确选择manifest中的7个路径；本轮只执行--check，没有实际恢复。`exit.json`记录退出status/哈希，`evidence-index.json`绑定本轮关键证据。后续修改后旧退出哈希不再可用，不能绕过保护覆盖。

执行到此停止，交统筹决定接受与后续修复卡。未commit/tag/推送/PR/发布、手工签名安装、清用户数据、调用真实付费API或清共享缓存。真实设备/硬件Keystore/落盘与进程重启、远端CI、其他组合、任意线程交错和长期统计稳定性均未验证。
