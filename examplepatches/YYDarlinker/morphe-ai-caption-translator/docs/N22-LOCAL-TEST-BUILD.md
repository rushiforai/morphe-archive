# N22 本地测试重建包记录

- 日期：2026-09-30；构建及完成审计时源码 HEAD 均为 `66c1e00c3ae7b1b24df76d8c97daa0a8fe9b5189`（N21b）。N19–N21b 改动首次进入本地三件套。本卡提交仅包含本记录及同步档案，源码、验收判据、冻结证据均未改。
- 开工按 §2.8 从外部档案原样覆盖 `docs/PROJECT-STATE.md`：28,527 字节，SHA-256 `87D070D7018A0D542CE65B009E26BD891B20D5E391854B5704B5F2FD41791D1F`。提交前再次确认两处逐字节一致，未改写档案内容。
- 本地附注标签 `anchor/n21b-66c1e00` 创建成功，指向 `66c1e00`，注释为“N21b 完成后、语言菜单功能开发前的回退锚点”；未推送。
- 翻译 API **0 次 / 0 tok**；新增依赖 **0**、下载 **0**。未执行真机测试、签名或发布。

沿用 N18r 的路径及组合：原版 YouTube **21.16.256** + 官方补丁集 **1.44.0** + Patcher **1.14.1**，输入哈希全部与 N18r 一致（`build/n22-records/inputs.json`）。Patcher 使用 `.verification/toolchain/morphe-patcher-1.14.1-all.jar`，其 SHA-256 为 `8CF6A9EAB4EE9DAB146BDDC24681897851564F53116BAEC11F36BA2FA2F589BE`，Gradle 构建配置确认内置版本 1.14.1。MPP manifest 的 `Patcher-Version: 1.12.0` 是既有补丁编译工具版本字段，组合 APK 实际使用 Patcher 1.14.1；未修改既有版本声明。

Gradle 使用嵌套 Zulu JDK 21：`D:\Program\zulu21.46.19-ca-jdk21.0.9-win_x64\zulu21.46.19-ca-jdk21.0.9-win_x64`，`ANDROID_HOME=C:\Users\14776\AppData\Local\Android\Sdk`。执行既有 `:extensions:extension:assembleRelease :patches:buildAndroid`、`:patches:verifyComposition`、`:patches:auditComposition`，全部 `--offline --console=plain`，沿用 `-Dorg.gradle.jvmargs=-Xmx2g -XX:MaxMetaspaceSize=1g`。组合选择仅 `AI caption translator` 加官方兼容默认补丁，输出新目录 `build/n22-composition-1141`。

| 产物完整路径 | 字节数 | 比 N18r | SHA-256 |
| --- | ---: | ---: | --- |
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n22.mpp` | 1,054,972 | +3,625 | `D9888B4C2FE0154AE78C74EC71DA5BCCC04E247DD8AD7167ED4901396640F86E` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n22.mpe` | 2,687,056 | +6,040 | `0F1B8D760CF76B89C737C0AA330D94F922706B709C1AA40337F404CC1C27FD21` |
| `E:\Projects\morphe-caption-v2\build\n22-composition-1141\YouTube-21.16.256-本地测试包-n22-unsigned.apk` | 196,797,207 | +5,120 | `72FB8F9898E0D56F0BCA38E20E421F9D5B03D70589C3623108A3641F859EBC9F` |

N18r 基准为 1,051,347 / 2,681,016 / 196,792,087 字节。11 个历史产物的前后哈希和长度全部一致，包括 N18r 三件套、既有本地 MPP/MPE、`recovered/1.3.5` 两个 MPP；不覆盖任何历史发布资产。

验证结果：

- **84/84 PASS / COMPOSITION_PASS**。逐项、多重集对比 `build/n18-composition.log` 的既有 **82/82** 均包含且通过；官方新增 `Channel search`、`Force fullscreen landscape` 为 **2/2 PASS**。选择算法、特征旗标及 hook 判据未改。
- 既有 **DEX_AUDIT_PASS classes=58025**，所有原有 DEX 守卫通过。特征旗标 `aiInstalled=1, memoryInstalled=0, simplifiedInstalled=0`。
- `.github/scripts/verify_bundle.py 1.3.5` 及既有 `build/N8Verify.java` 通过。MPP ZIP CRC、72 个唯一条目、根及扩展 DEX 头/长度/校验和、manifest 版本 1.3.5 与仓库身份、14 个 locale 全通过；14 语种 XML 与当前源码逐字节一致；独立 MPE 从交付 MPP 提取，与内嵌扩展逐字节一致；无 validation 条目或 DEX 类泄漏。
- 交付 MPE 和 APK 分别完成内容检查：五档 34/39/44.5/50/56 常量、全屏 ×55.5/44.5、预览调用全屏比例的实际间接调用链、滑轨绘制刻度、`lastBlankIdentity`、`pausedDisplayPosition`/`pausedHookState`/`displayPosition` 均在；已删计数器与 overflow 技术文案键无残留。内容检查只是包内代码存在性核验，不替代真机验收。
- APK ZIP CRC、唯一条目、11 个根级 DEX 头/长度/校验和、AndroidManifest 均通过，无 validation 类泄漏。`aapt dump badging` 确认包名 `app.morphe.android.youtube`、版本 21.16.256 / 1561068412、最低 SDK 28；无 META-INF 签名文件；`apksigner verify` 返回 1、`DOES NOT VERIFY / Missing META-INF/MANIFEST.MF`，确认未签名。
- 离线 `scoreboard/run.py`、`n9.py`、`n10.py` 通过；冻结计分板 **4 通过 / 4 既有失败 / 4 未验证**，三类不可见时长全 0；源码、ACCEPTANCE.md 和冻结结果 Git diff 为零。Java 单测沿用 N21b 已审阅的 413/413，本卡执行构建相关校验与审计。

异常与处理：组合/审计的 `testClasses` 依赖会重跑 `:patches:jar`，将临时 `patches/build/libs/patches-1.3.5.mpp` 还原为没有根 DEX 的 JVM 包；首次在该临时位置运行 bundle 校验因此失败。交付 MPP 已在 `buildAndroid` 完成后独立复制保存，始终含根 DEX；审计结束后将该交付包复制回临时位置，再按原脚本通过校验。额外内容检查初稿误把预览当成直接调用、按源文件名寻找类；核对源码后改为检查实际间接调用链及 `CaptionOverlay` 类，MPE/APK 均通过。未修改产品源码、既有检查或判据。Windows 中文路径沿用 N18r 的 ASCII 硬链接解决 `aapt` 限制；Gradle 弃用警告不影响构建。

证据：`build/n22-android-build.log`、`build/n22-composition-1141.log`、`build/n22-final-dex-audit.log`、`build/n22-content-dex.log`、`build/n22-verify-bundle.log`、`build/n22-n8-verify.log`、`build/n22-apksigner.log`、`build/n22-scoreboard.log`、`build/n22-n9.log`、`build/n22-n10.log`，及 `build/n22-records/` 中的输入/历史哈希、结构/产物 JSON、APK 元数据、只读内容检查工具。

构建完成后核对源码 HEAD 为 `66c1e00`。遵守每卡提交纪律另提交本卡文档，最终 Git HEAD 因此为文档提交；其父提交及最后源码提交仍为 `66c1e00`，源码树保持一致。完成即停，建议不执行。
