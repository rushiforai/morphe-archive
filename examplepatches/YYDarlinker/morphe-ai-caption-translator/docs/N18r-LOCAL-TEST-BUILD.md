# N18r 本地测试重建包记录

- 日期：2026-09-30；产品源码基于 `00f53c8`（N17d），不复用 `cc29229` 产物。
- 用户在本卡中将 APK 输入改为 YouTube **21.16.256**、官方补丁集改为 **1.44.0**，并明确授权自主更新 Patcher 至最新版本及下载更新。翻译 API **0 次 / 0 tok**；未新增产品运行时依赖，产品源码、验收判据与冻结结果未改。
- 开工按 §2.8 原样同步外部档案；两文件均为 13,109 字节，SHA-256 `96BDF40C5BA5E17A19629DA881D456108597BD62B67C11136C60E5F533C45111`。外部档案仍将 N17d 标为待执行，已如实保留；构建源码 HEAD 单独核实为 `00f53c8`。覆盖前的本地档案保存于 `build/n18r-records/PROJECT-STATE.pre-sync.md`。

输入与工具：

- 仓库原版 `com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk`：184,012,881 字节，SHA-256 `724D2BF15D31DAC98DB00D82914DB3876EDF66E62FE2845001F204209ECF4C00`。
- 用户提供的仓库 `patches-1.44.0.mpp`：9,844,976 字节，SHA-256 `936E67FA18BA361D4757EE2B640BDB08195AF3420088AAB9D0E1F03BA76A9B22`，与[官方 1.44.0 发布资产](https://github.com/MorpheApp/morphe-patches/releases/expanded_assets/v1.44.0)一致。此前获授权的同文件下载已在用户随后提供本地文件的消息到达前完成；最终组合构建使用仓库文件。下载副本保留在 `build/n18r-inputs/`。
- 最新稳定版 [Patcher 1.14.1](https://github.com/MorpheApp/morphe-patcher/releases/tag/v1.14.1)。GitHub Packages 返回 401，改用[官方 Desktop 1.17.0 分发包](https://github.com/MorpheApp/morphe-desktop/releases/expanded_assets/v1.17.0)内的 Patcher 库：`build/n18r-toolchain/morphe-desktop-1.17.0-all.jar`，46,727,564 字节，SHA-256 `8CF6A9EAB4EE9DAB146BDDC24681897851564F53116BAEC11F36BA2FA2F589BE`。其 `app/morphe/patcher/version.properties` 为 `version=1.14.1`；仅调用 Patcher 库。
- `patches/build.gradle.kts` 的组合构建测试依赖由 1.12.0 更新并固定为 1.14.1；支持 `composition.patcherJar`，或自动使用 `.verification/toolchain/morphe-patcher-1.14.1-all.jar`。本机该路径为官方分发包的硬链接，构建配置会核验内置 Patcher 版本。`gradle.properties` 保持原始字节，不保存机器路径或修改认证信息。
- Gradle 使用档案指定的嵌套 Zulu JDK 21.0.9；ANDROID_HOME 保持既有配置。工具更新下载后，组合构建与审计均使用 `--offline`。

| 产物完整路径 | 字节数 | 比 cc29229 | SHA-256 |
| --- | ---: | ---: | --- |
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n18r.mpp` | 1,051,347 | +934 | `56B0D5A9F44F2A92E8134D0A99ACCAE0E759E139EDF59A52BE836E5ACE6A236C` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n18r.mpe` | 2,681,016 | +488 | `4FFDF394F90C5F0E869F256C03DBA73B00E41B853321559842A8915B4223DCAC` |
| `E:\Projects\morphe-caption-v2\build\n18r-composition-1141\YouTube-21.16.256-本地测试包-n18r-unsigned.apk` | 196,792,087 | +10,791,444 | `DA828F1CF7800D37439B02CFBCBAC0DD8983BBFC4D864DA9BBE99BD3101F076C` |

cc29229 的三项基准分别为 1,050,413 / 2,680,528 / 186,000,643 字节。APK 差值包含 YouTube 基包、官方补丁集及 Patcher 升级，不能解释为本插件源码独立增量。旧三件套及 `recovered/1.3.5` 两个历史 MPP 的 SHA-256 均与开工基准一致，没有覆盖发布资产。用户提供的根目录 MPP 保留原文件并通过 Git 本地 exclude 排除，不提交二进制输入。

验证结果：

- 既有 `:extensions:extension:assembleRelease :patches:buildAndroid` 生成新 MPP；独立 MPE 从新 MPP 的 `extensions/extension.mpe` 提取。`.github/scripts/verify_bundle.py 1.3.5` 和既有 `build/N8Verify.java` 均通过；最终本地包另核实 ZIP CRC、72 个唯一条目、根及扩展 raw DEX 文件头与长度、manifest 版本及仓库身份、14 个 locale、独立 MPE 与内嵌扩展逐字节一致，无 validation 类泄漏。
- `:patches:verifyComposition`：`COMPOSITION_PASS`，实际 **84/84 PASS**。逐项对比 cc29229 的 `build/n18-composition.log`，其原有 **82/82** 全部包含且通过；官方 1.44.0 新增的默认 `Channel search` 与 `Force fullscreen landscape` 另为 **2/2 PASS**。选择算法、特征旗标和 hook 判据保持原样。
- `:patches:auditComposition`：`DEX_AUDIT_PASS classes=58023`，所有既有 DEX 守卫通过；默认本地工具链路径也完成离线审计。
- APK ZIP CRC、唯一条目、11 个根级 DEX 的头与长度、AndroidManifest 均通过。包名 `app.morphe.android.youtube`，版本 21.16.256 / 1561068412，最低 SDK 28。无 META-INF 签名文件；`apksigner verify` 返回 1、`DOES NOT VERIFY / Missing META-INF/MANIFEST.MF`，符合未签名交付。
- 离线 `scoreboard/run.py`、`n9.py`、`n10.py` 通过；冻结计分板维持 **4 通过 / 4 既有失败 / 4 未验证**，三类不可见时长均为 0；冻结结果 Git diff 为零。Java 全套单测沿用 N17d 已审阅结果，本卡执行与构建相关的结构校验及审计。
- MPP 的兼容声明仍为 21.07.247，遵守不改产品源码的约束；21.16.256 的本轮验证范围为实际组合构建、结构及 DEX 审计，未执行真机验收。

异常与处理：新 APK + 官方 1.43.0 曾报 `Official Captions missing`；官方 1.44.0 + Patcher 1.12.0 曾报 `ResourceType` 缺类，后依用户授权完成工具升级。Maven 401 使用官方已核验分发包解决；旧 Gradle daemon 的 Metaspace 告警通过本次命令参数 `-Xmx2g -XX:MaxMetaspaceSize=1g` 解决。WindowsApps Python 占位程序及 PowerShell 脚本执行策略问题，使用仓库既有本地 Python 回退路径直接执行检查；未修改执行策略。`aapt` 不接受中文路径，使用 `build/n18r-records/apk-metadata-input.apk` 同文件 ASCII 硬链接核验，其 SHA-256 与交付 APK 完全相同。其余 SDK XML / Gradle 弃用 / Kotlin 警告未阻止构建。

复用本机已核验工具时，既有组合命令如下；输出目录必须尚不存在：

```powershell
$env:JAVA_HOME = 'D:\Program\zulu21.46.19-ca-jdk21.0.9-win_x64\zulu21.46.19-ca-jdk21.0.9-win_x64'
.\gradlew.bat :patches:verifyComposition --offline --console=plain '-Dorg.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=1g' '-Pcomposition.input=E:\Projects\morphe-caption-v2\com.google.android.youtube_21.16.256-1561068412_minAPI28(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk' '-Pcomposition.official=E:\Projects\morphe-caption-v2\patches-1.44.0.mpp' '-Pcomposition.addon=E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n18r.mpp' '-Pcomposition.output=E:\Projects\morphe-caption-v2\build\n18r-composition-new' '-Pcomposition.selection=AI caption translator' '-Pcomposition.compile=true'
```

证据保留在 `build/n18r-android-build.log`、`build/n18r-composition-1141.log`、`build/n18r-final-dex-audit.log`、`build/n18r-default-toolchain-audit.log`、`build/n18r-records/bundle-structure.json`、`build/n18r-records/apk-structure.json` 和 `build/n18r-apksigner.log`。本卡产物完成后即停，不执行发布或真机验收。
