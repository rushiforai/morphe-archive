# M7b candidate-02：设备交接与有限验收记录

> 本页保留已完成的m7b candidate-02设备观察与当时交接身份。当前公开已为1.5.8 / release-1.5.8，正式包/CI/组合见[发布结果](results/RELEASE-1.5.8-RESULT.md)；未把旧设备反馈倒填为新release重新安装认证，也不要求为结束本卡重复安装。

2026-10-26（Asia/Shanghai）。**本地工程和用户当前单设备短使用验收已接受；M7及首轮工程成熟化按规定范围完成。** 当前本地产品 **1.5.8 / local-1.5.8-m7b / candidate-02**，公开1.5.7。见[最终验收](reviews/M7-FINAL-ACCEPTANCE.md)；原[M7b本地复核](reviews/M7b-REVIEW.md)及执行结果保留其当时事实，不倒填成已做设备工作。

## 当前设备依据与限制

用户对上一轮手机更新和观察清单回复“都没有问题”，提供`caption-diagnostics-1.5.8-20261026-083958.txt`。用户报告Manager2.2.0 / YouTube21.20.405 / 官方1.48.0、原始APK可用、Manager数据/签名未重置。接受该总体确认作为人工使用反馈；没有代理设备操作、现场逐项自动测试或故障注入。

诊断第112行manifest和第206行首次draw Hook均为`local-1.5.8-m7b`。原诊断367556 B、SHA-256 `5484d29406ce5de59aafdcf408cd5f3c3c4509270c00c49d3c2b3b1c07043b64`，私有副本及字段分析在`validation/runs/20261026-M7-final-acceptance-01/`。运行身份佐证与手机APK逐字节/签名证明分开；未读取型号/Android/ABI/安装包SHA/实际包名/code/证书/完整根选择，环境版本按用户报告，不强加电脑104根集合。

## 短设备结果

| 观察项 | 本轮结果及证据层级 |
| --- | --- |
| 手动重打补丁/更新、启动、原设置保留 | 按用户对上轮清单的总体无问题确认接受；运行m7b由诊断佐证，未独立审计安装器/签名链；离线/坏值故障注入未做 |
| CC/AI开关和源字幕 | 用户总体确认无问题；日志有原生选轨/CC和两个source_passthrough会话，所记录会话HTTP begin为0；不扩大到所有交错 |
| 普通/全屏、Shorts评论开合 | 用户总体确认无问题；日志含DETAIL/FULL/SHORTS_FULL/SHORTS_REDUCED和可见字幕记录；不是自动视觉或硬件帧时认证 |
| 切视频、返回、退出重入 | 用户总体确认无问题；日志含多个视频/owner/会话切换及源/译文显示，不能逐项重建用户全部手势 |
| 诊断导出及来源 | 实际收到导出，manifest/首次draw身份一致；unknown/runtime_unverified与构建预期分开，是预期行为，不伪称官方版本已实读 |
| 用户自行真实翻译 | 有界日志13次HTTP均200，头部13成功/0失败/0内部重试；有质量建议、累计25284 tokens。仅单用户服务样本，不认证账单/语义完全正确，也不授权代理未来调用 |
| 性能/硬件和故障注入 | 用户未报告明显问题；未采集帧时/内存/耗电/硬件IO/Keystore故障数据，保持未认证 |

不把含翻译的整段日志记成零模型调用。三个去重后的preparing_layout暂态均在同事件5/8/14ms后有可见结果；不据此作性能承诺。原日志含字幕/模型响应，作为私有证据保存，不随本次验收发布。

## 明确交付（电脑工件；本次未改）

| 层级 | 实际输入/交付 | 状态 |
| --- | --- | --- |
| Addon MPP | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M7b-candidate-02\patches-1.5.8.mpp`，600263 B，SHA-256 `d0f84dfab104c6167126042247734e2b1d4e6c33de332df6d59ff49aa153cd30` | 补丁包，不能直接安装 |
| 独立MPE | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M7b-candidate-02\extension.mpe`，733284 B，SHA-256 `1d9cc55df0a158fa89d8c7b6190c946f5b67d6ecc14aff23aba3f5139880d6a0` | raw DEX；与MPP内嵌逐字节相同 |
| 主组合APK | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M7b-01\composition-primary-02\composed\patched-unsigned.apk`，227146154 B，SHA-256 `379d1643ea7ba088f3f9c707fdf69bcc6dea6e98a4d0cdb9c81cbf54d5714d67` | **未签名**；签名安装包尚未生成 |
| 补充组合APK | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M7b-01\composition-supplement-02\composed\patched-unsigned.apk`，217311407 B，SHA-256 `dd83936dbc2351efd8cae36d2b8516ffe07efb892a1a05ef397eba71f4f7cde9` | **未签名**；另一版本独立证据，不建议跨versionCode降级 |

两组均实际使用官方1.48.0（SHA `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`）、Patcher2.0.0（SHA `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`）、104兼容官方默认根+AI。主输入21.41.525-SECONDARY SHA `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`；补充输入21.28.208 SHA `1c186be5074d4f027d2cf8cb1beb4fc8964782e196037b6ebf2eee44b03ba6d1`。选择清单、实际命令、编译/资源/DEX及输入验签见[M7b结果](results/M7b-RESULT.md)和 `validation/runs/20261025-M7b-01/` 的各自binding/receipt/log。

| 核验项 | 主组合 | 补充组合 |
| --- | --- | --- |
| 输出包名 | `app.morphe.android.youtube` | `app.morphe.android.youtube` |
| versionName / versionCode | 21.41.525-SECONDARY / 1561303419 | 21.28.208 / 1561185128 |
| minSdk / targetSdk | 29 / 37 | 29 / 37 |
| native ABI | arm64-v8a, armeabi-v7a, x86, x86_64 | arm64-v8a, armeabi-v7a, x86, x86_64 |
| 签名 | apksigner按预期拒绝，缺签名；无JAR签名项 | 同左 |
| 已有设备/安装身份 | ADB未列出设备；型号、SDK、ABI、现有包版本和签名均unknown | 同左 |

原始输入包名是com.google.android.youtube，官方默认GmsCore选择后实际输出为app.morphe.android.youtube；安装/升级检查必须使用实际输出包名。原始Google证书不能用于签此输出，也不能由原APK证书推断设备现有改包签名。UI preview debug APK仅为完整验证的预览工件，不是本表的YouTube交付。

以上“设备/安装身份unknown”表行保留的是电脑组合执行时的独立实读层级；现已收到用户安装/使用反馈，但未新增ADB读取。21.20.405手机输出有运行/用户观察证据，没有第三组电脑资源/DEX receipt；电脑两份unsigned APK与手机Manager生成的签名APK不能互换SHA或当成同一安装包。UI preview始终不是YouTube安装包。

## 本轮采用的手动路径（后续操作参考）

以下保留已交接给用户的步骤，当前结果以本页上方为准；不是还需再安装/重复观察的任务。未来代理签名/安装或真实服务调用仍需具体授权，不卸载/清数据绕过签名冲突。

已准备便于辨认的同字节手机交接副本（本机归档：`build/maintenance/M7b/device-handoff-20261026/anchored-ai-captions-1.5.8-m7b-candidate-02.mpp`）：`anchored-ai-captions-1.5.8-m7b-candidate-02.mpp`，600263 B，SHA-256仍为`d0f84dfab104c6167126042247734e2b1d4e6c33de332df6d59ff49aa153cd30`。原候选未覆盖。仅文件名不同，不是新构建/新发布。用户报告、入场文档原件和交接核验在`validation/runs/20261026-M7b-phone-handoff-01/`。

1. 将这个MPP传至手机。打开现有Manager 2.2.0，在底栏「Sources/补丁源」点「＋→Local/本地」选择该文件；若已有同名本地源，可用该源的「Update/更新」选替换文件；出现更新同名源提示时更新已有源。确认AI源显示1.5.8且启用，官方源保持1.48.0，不同时应用重复AI源。
2. 如未启用专家模式，进入「Settings/设置→Patching/打补丁→Expert mode/专家模式」。从YouTube的「Patch/打补丁」进入，明确选择21.20.405和「Use saved APK/使用保存的APK」；若原件单独存储，则选「No, I already have an APK/我已有APK」。必须用原始未打补丁的APK，不提取当前已修改应用作为输入。
3. 检查官方源仍为1.48.0，沿用上次官方补丁选择及选项，并确认本次本地AI源的「AI caption translator」勾选。保持原GmsCore/包名等身份选项。不把电脑104默认根数量强加给用户原选择；实际不同选择的手机结果只对应其实际集合。
4. 执行打补丁，由原Manager使用既有签名配置完成。成功后，若Android识别为更新现有目标应用，可由用户选择更新；若要求先卸载、报签名冲突/版本冲突，或变成意外的并列新应用，停止并保留原应用及报错，不通过卸载/清数据/换密钥绕过。不要直接安装电脑unsigned APK或UI preview。
5. 更新后先不开视频，在「YouTube→设置→Morphe→视频→AI字幕翻译」确认原设置可读、暂关AI；查看诊断确认`build=local-1.5.8-m7b`。找一段已有源字幕的普通视频，AI关闭时先明确选择人工/自动生成的原始源轨，再开启AI观察同源字幕。Shorts也先在AI关闭时确认原始源轨，不沿用自动翻译目标；未能确认源轨时暂跳过该项。不要点测试API/刷新模型，不选择自动翻译目标。
6. 依次简短观察CC/AI开关、普通/全屏切换、Shorts评论开合、切视频后返回及退出重入；看字幕是否可读、不重复、不串台、AI关闭后原生绘制恢复。诊断中观察新增模型请求应为0，不清空历史累计；`official=unknown/runtime_unverified`与`build_expected_official=1.48.0`并存是预期来源分层，不是安装失败。只记录实际观察，未做的保持未执行。

建议反馈：补丁/更新成功或原始错误；诊断build ID；旧设置是否保留；普通/全屏、Shorts评论、退出重入各为通过/问题/未执行。无需发送key、keystore或完整私人配置。以上步骤是有限验收，不扩展为硬件性能、全部供应商或真实费用认证。

Manager入口依据固定版本v2.2.0官方说明：[补丁源](https://github.com/MorpheApp/morphe-manager/blob/v2.2.0/docs/patch-sources.md)、[专家模式](https://github.com/MorpheApp/morphe-manager/blob/v2.2.0/docs/patching-expert-mode.md)、[重打补丁更新](https://github.com/MorpheApp/morphe-manager/blob/v2.2.0/docs/updating-patched-apps.md)、[签名与备份](https://github.com/MorpheApp/morphe-manager/blob/v2.2.0/docs/backup-and-keystore.md)。界面译名可能不同，以实际对应项目为准；原Manager/签名条件由用户报告支持，Android实际更新检查仍为最终条件。
