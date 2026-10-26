# M1a 执行结果 — 任务卡 v1

执行结论：**已完成待复核**。统筹复核：**待复核，未标记接受**。本卡到此停止；未进入 M1 后续补项或 M2。

## 1. 身份、基线与证据边界

- 活动仓库：`E:\Projects\DeepSeek morphe-ai-caption-translator`。始终使用进入时现有工作树，未创建 workspace/worktree、切换分支、提交 commit/tag、推送或发布。
- 进入和退出分支：`codex/fix-cc-authority-1.5.8`；进入和退出 HEAD：`de844402776e1046a5bec87aac94e2e65f05bea7`。HEAD 单独不是完整 N75；N69–N75 已有未提交和未跟踪修改全部保留。
- 本批次 run ID：`20261024-M1a-185000`；最终有效入口 run ID：`20261024-M1a-candidate-03`。日期为北京时间 2026-10-24；run ID 是唯一标签，不替代日志内实际起止时间。
- 进入时 Git 跟踪 + 非忽略未跟踪普通文件 2,169 个：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\entry-manifest.json`；其定义范围的指纹为 `64ad1db8fd464ad33380eb08db569c0ebb353c9ec89fab220332bbf9f4f0519d`。进入时状态、相对 HEAD 的原始补丁分别是 `entry-status.txt` / `entry-working-tree.patch`，用于保留历史基线，不作为本轮 diff。
- 待改文件原件在 `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\entry-files.zip`。该 ZIP 还保存被忽略的 `.devenv` 文件与状态镜像；它们的原件哈希单列在 `supplemental-entry.json`。根构建脚本原件已与入场 manifest 哈希逐字节核对后补入 ZIP。
- 355 个受保护文件记录于 `protected-entry.json`：全部 Git 范围内 `*/src/*`、产品版本/公开元数据、来源记录、现有 build MPP/MPE 和 delivery 全部字节，另补入默认 extension 构建目录的独立 MPE。历史构建包及交付原件的备份是 `protected-artifacts.zip`。没有复制工具链或清理共享缓存。
- 最终有效构建/测试/校验输入清单 366 个文件：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\source-manifest.json`；SHA-256 **`2029cf3bcf014c962fb857af87d29086d8052275a08ca7779d936d392490391c`**。范围是 Git 跟踪与非忽略未跟踪的模块源码/测试、上游快照、资源/本地化、Gradle 配置/Wrapper、当前工具/工作流与来源 JSON；排除叙述性 Markdown、证据、缓存和 Python 字节码。被忽略的本地 `.devenv` 前端另由原件 ZIP、最终清单及批次 diff 记录，不谎称在此 Git 范围指纹内。
- `source-manifest-after.json` 与构建前清单完全相同；交付时再核对仍相同。文档与状态随后追加，不改候选构建输入。

## 2. 实际修改及必要性

| 文件或文件组 | 本轮改动与收益 |
| --- | --- |
| `.devenv/verify-full.ps1`、`.devenv/README.md` | 移除当前入口的固定 v1.5.4/tag 检查和默认模型访问；复用 Enter-Dev 及现有 CMD wrapper，明确当前候选、报告、运行 ID 和真实服务边界。这两份文件被 Git 忽略，但实际改动及原件均有保存。 |
| `tools/Verify.ps1`、`tools/Enter-Workspace.ps1` | 变为对应 `.devenv` 入口的兼容别名，取消另一套环境/选包/交付逻辑。 |
| `tools/verify_current.py`（新增） | 可跨 Windows/Linux 的完整入口；显式两组 Test 任务、共享工具自测、候选构建与指定包校验，保存命令/退出码/模块计数/输入指纹。子进程失败、报告缺失、零测试、全部跳过、身份不符均失败，不扫描旧 XML 直接报通过。候选模式不生成公开元数据、不调用真实模型。 |
| `tools/verification.init.gradle`（新增） | 由本次 Gradle 调用记录所有任务状态、实际报告/输出路径、工具版本及构建完成时的产物哈希；只接受实际执行或 Gradle 确认的 UP-TO-DATE/FROM-CACHE，拒绝 NO-SOURCE。 |
| `build.gradle.kts` | 仅加可选 `verification.buildRoot`，使当前候选的其他模块使用独占构建根；默认行为仍为 n39。extension 保持标准目录，因为 R8 使用其标准规则路径；未改模块、依赖、SDK 或工具版本。 |
| `.github/scripts/verify_bundle.py` | 接受显式 MPP/MPE、期望 version/build ID 和 candidate/release 模式。解析 DEX 字符串做精确 build ID 检查，验证 DEX 长度/SHA-1/Adler-32、必需类/资源与测试类泄漏；与指定独立 MPE 字节比对。默认和原有位置 VERSION 调用仍是严格 release 模式，要求 release-ID 且拒绝 local-ID。 |
| `tools/verify_integration.py` | 完整检查必须显式输入 core classes、MPP、独立 MPE 和 UI APK；删除“最新 MPP”以及遍历 build 找相等 MPE 的逻辑；检查候选语言资源与当前源码相同。来源/协议/ABI 的原有约束未放宽。 |
| `.github/scripts/validate_morphe_metadata.py`、`test_release_contract.py` | 增加 published 内部一致性模式；release 默认仍要求源码版本与公开元数据一致。合同 fixture 自身版本一致，并新增两种模式的拒绝测试；临时 fixture 固定在工作区 work/temp。未改真实公开元数据。 |
| `tools/test_verification.py`（新增） | 15 项有意义的工具合同测试，包含失败传播、报告有效性、候选/release 身份、多个旧包、MPE 不匹配、Windows 长 HTML 路径及 CI/prepare 接线；保留 fixture 和机器可读结果。 |
| `.github/workflows/validate.yml` | dev/codex/**/fix/** push，main/dev 目标 PR，调用同一 portable 入口，包含 core + extension；归档当前独占候选、core 报告和实际 extension/build 报告，失败时也执行归档。候选不运行公开 patch-list 生成。 |
| `.releaserc`、`.github/workflows/release.yml` | semantic-release prepare 在 git/GitHub publisher 前调用严格 release 入口，包含两组测试；用进程 Gradle 属性注入 release build ID，生成 patch-list 后严格检查元数据。无新发布分支同样运行当前候选入口，并使用 published 元数据契约；真正发布后保留严格契约。失败证据 always 归档，semantic-release 仍是唯一发布者。 |
| `CONTRIBUTING.md`、`docs/RELEASING.md` | 记录当前入口、候选/公开/真正发布三种一致性、报告路径和未指定组合输入时的边界。 |
| `docs/maintenance/README.md`、`docs/PROJECT-STATE.md` 及其镜像、本报告 | 只更新本卡交接/执行状态和必要摘要，保留既有历史；统筹状态为待复核。 |

没有改生产 Java/Kotlin、已有字幕行为测试/黄金断言、提示词、协议、profile/缓存身份、原生 CC/选轨权威、产品版本/build ID；没有进行 M2 清理或全项目重构。

本轮精确差异：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\batch-only.patch`，比较对象是入场原件（包括入场已有修改），不是完整 HEAD diff。`scope-diff.json` / `exit-manifest.json` 包括被忽略的本地入口和状态镜像。

## 3. 最终有效命令、工具和测试

最终完整入口命令（退出 **0**）：

```powershell
.\.devenv\verify-full.cmd -RunId 20261024-M1a-candidate-03 -EvidenceDirectory 'E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03'
```

完整 argv 和每步开始/结束、退出码见 `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\summary.json`。它实际调用：

```text
:translation-core:testDebugUnitTest
:extensions:extension:testDebugUnitTest
:ui-preview:assembleDebug
:patches:buildAndroid
--no-daemon --no-parallel --console=plain
--init-script tools/verification.init.gradle
--init-script .devenv/gradle/workspace.init.gradle
-Pverification.buildRoot=build/maintenance/M1a/20261024-M1a-candidate-03/gradle
-Ptranslation.live=false
```

另带本次 receipt 和 scheduler evidence 的绝对路径参数；不是旧报告目录扫描。正式 Gradle 命令退出 0，`BUILD SUCCESSFUL in 4m 53s`；176 actionable tasks，47 executed / 68 from cache / 61 up-to-date。

工具：JDK `21.0.12.1`、Gradle `9.6.1`、Python `3.12.14 (main, Aug 25 2026, 14:01:42) [MSC v.1944 64 bit (AMD64)]`；Android SDK 35/36 与原 `.devenv` 配置保持。GRADLE_USER_HOME=`E:\Projects\DeepSeek morphe-ai-caption-translator\work\gradle-home`，TEMP/TMP=`E:\Projects\DeepSeek morphe-ai-caption-translator\work\temp`，ANDROID_USER_HOME=`E:\Projects\DeepSeek morphe-ai-caption-translator\work\android-user-home`；均为进程局部，未改全局环境。

| 模块 | tests | failures | errors | skipped | 有效性 | 本轮归档 XML |
| --- | ---: | ---: | ---: | ---: | --- | --- |
| `translation-core` | 254 | 0 | 0 | 0 | 本轮实际执行；28 XML | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\tests\translation-core` |
| `extensions:extension` | 445 | 0 | 0 | 0 | 本轮实际执行；67 XML | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\tests\extensions-extension` |

两组共 **699** 项，均有本次 receipt 的 `executed=true, skipped=false, did_work=true`；不是历史 N75 699 项证据引用。原始 XML/HTML 的路径、逐 XML SHA-256 及归档路径在 summary 中；HTML 在 `tests/translation-core-html` / `tests/extensions-extension-html`，包括 Windows 长测试方法名页面。

MPE 的 `minifyReleaseWithR8` / `syncExtension` 由本次 Gradle 确认 **UP-TO-DATE 有效复用**；不能描述为重新跑了 R8。当前 core 编译/资源等任务部分 FROM-CACHE，按本次输入重建或复用；构建完成时记录 MPP/MPE/UI 的哈希，再复制并校对，单凭另一次 MPE 碰巧相等不是通过依据。

| 检查步骤 | 退出码 | 实际日志 |
| --- | ---: | --- |
| localization | 0 | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\localization.log` |
| source-boundaries | 0 | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\source-boundaries.log` |
| release-contract | 0 | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\release-contract.log` |
| verification-contract | 0 | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\verification-contract.log` |
| metadata | 0 | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\metadata.log` |
| gradle | 0 | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\gradle.log` |
| bundle | 0 | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\bundle.log` |
| boundaries | 0 | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\boundaries.log` |
| credential-scan | 0 | `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\credential-scan.log` |

- 本地化：232 keys × 14 locales，通过。
- source/compiled 边界：`errors=[]`；pinned 来源、protected ABI、提示词/协议字面量保持；81 compiled core classes 无宿主/UI 依赖；UI APK 无翻译引擎/INTERNET；候选 14 locale 资源与源码相同。
- 工具合同 **15/15**；发布元数据合同 **14/14**；不是新增字幕行为测试。
- 本轮完整候选泄漏扫描：已知环境凭据值 6 个，matches=[]，不输出值；交付完成后另扫本批次 evidence/候选，结果见 `final-credential-scan.json`。
- PowerShell 三个当前入口语法解析通过，证据 `powershell-syntax.json`。工作流/JSON 配置经过本地合同检查和人工源码自查；**远端 GitHub CI 未运行**，没有冒称 GitHub 已验证。未安装额外 YAML 框架。
- `git -c core.whitespace=cr-at-eol diff --check` 退出 0。普通 diff --check 会把既有 Windows CRLF 及入场基线也计作行尾空白；未为此重写生产/历史文件。

## 4. 有意义的拒绝路径

`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\attempt-03\verification-contract.json` 和 `negative-fixtures/` 保存对应测试结果及副本。真实包和真实报告没有被改坏以制造故障。

| 注入方式 | 预期/实际 |
| --- | --- |
| 临时 XML 删除 extension 报告；一模块为零、另一模块有测试；缺本次任务 receipt；NO-SOURCE；XML 带 failure | collect_tests/require_task 拒绝，工具合同通过；任何一种不汇总成整体成功。 |
| 将编排器的 Gradle 执行阶段替换为真实子进程退出 7（模拟单测失败）/13（模拟构建失败） | 子命令退出码保留在 summary；编排器返回 1、status=failed，未进入 bundle。其他步骤在此 fixture 内有受控替身，不能描述为运行过一套失败的产品 Gradle 测试。 |
| 同目录多个旧 fixture 包、错误 version/build ID、仅有 build ID 前缀、错误独立 MPE | 精确检查指定输入并拒绝错误身份/不一致；不挑最新旧包。 |
| local fixture 在 candidate；同包在 release；release fixture 加入 local 标识 | candidate 通过；release 拒绝 local；纯 release fixture 通过。fixture 不是本轮正式发布构建。 |
| `tools/Verify.ps1 -ExpectedVersion 9.9.9` | 实际兼容入口退出 1；`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\alias-wrong-version\summary.json` 为 failed，未开始测试/构建。 |

另对本轮真实候选和保留的历史资产做了 10 个实际 CLI 检查：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M1a-185000\additional-checks\summary.json` 记录完整命令/退出码，逐条日志位于同目录。

| 实际场景 | 期望退出 | 实际退出 | 结论 |
| --- | ---: | ---: | --- |
| candidate-explicit | 0 | 0 | 符合预期 |
| wrong-version | 1 | 1 | 符合预期 |
| wrong-build-id | 1 | 1 | 符合预期 |
| old-n74-not-selected | 1 | 1 | 符合预期 |
| local-rejected-as-release | 1 | 1 | 符合预期 |
| local-release-parameter-rejected | 1 | 1 | 符合预期 |
| existing-release-legacy-version-compatible | 0 | 0 | 符合预期 |
| published-metadata-independent | 0 | 0 | 符合预期 |
| strict-release-metadata-rejects-current-local-mismatch | 1 | 1 | 符合预期 |
| implicit-full-integration-input-rejected | 1 | 1 | 符合预期 |

其中真实 1.5.7 仅用于检查严格 release 位置版本调用的兼容性，**不是本轮候选**。实际的完整 release 构建/semantic-release prepare 未执行：那需要已经准备好的下一版公开元数据，并会生成公开 patch-list；本卡仅完成本地契约、配置接线和拒绝检查，没有触发发布入口。

## 5. 最终候选身份

| 项目 | 本轮指定值 |
| --- | --- |
| MPP 绝对路径 | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M1a-candidate-03\patches-1.5.8.mpp` |
| version / build ID / Patcher | `1.5.8` / `local-1.5.8-n75` / `2.0.0` |
| MPP 大小 / SHA-256 | 591,314 B / `253b28f9d86bd766667f6005ee166bf08db95c71fbc73bd9e3d5752626322b3c` |
| 同次构建原件 | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M1a-candidate-03\gradle\patches\libs\patches-1.5.8.mpp`，哈希与候选复制件相同 |
| 独立 MPE | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M1a-candidate-03\extension.mpe`；725,940 B；SHA-256 `06172e3df255db3ec206a9b5423906031a2caac590f372289f6afeadf9453d2b` |
| 本次 Gradle 有效复用的 MPE 输出 | `E:\Projects\DeepSeek morphe-ai-caption-translator\extensions\extension\build\morphe\extensions\extension.mpe`；构建完成时 receipt 哈希与候选、内嵌 MPE 三者相同 |
| UI 隔离验证件 | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M1a-candidate-03\ui-preview-debug.apk`；SHA-256 `8da4457ee2e973c4c65692fbb33b2a19000ee56fa06d7092c88d3f334cdb43ea`；仅开发 fixture，未放进 MPP |
| 输入身份 | HEAD `de844402776e1046a5bec87aac94e2e65f05bea7` 加本轮 366-file 工作树指纹 `2029cf3bcf014c962fb857af87d29086d8052275a08ca7779d936d392490391c`；生产行为仍为进入时完整 N75 |

MPP ZIP/DEX/必需类/14 locale 资源/测试 harness 泄漏/仓库身份检查通过；根 DEX 与扩展 DEX 的长度、签名和校验和有效。内嵌 MPE 与指定独立 MPE逐字节相同。

与保留的 N75 交付逐条目比较：没有增减条目，唯一内容差异是 `META-INF/MANIFEST.MF` 的新构建 Timestamp；全部其他条目（包括 DEX、MPE、资源）相同。证据 `candidate-vs-n75-content.json` / `candidate-manifest.diff`。新 MPP 容器 SHA 不同，不替换历史包。

## 6. 初次失败、执行偏差与修正

- `attempt-01`：通过新入口用 `-RerunTests` 实际完成两组测试及构建（Gradle 退出 0），但复制深层 HTML 时 Windows MAX_PATH 报错；收尾也暴露同类复制问题。入口最终退出 1，原 `summary.status=failed` 保留，不拿它作为整体验收通过。修正为 Win32 扩展路径归档并保护失败收尾。
- `attempt-02`：新增长路径合同的报告归档已工作，但工具测试自身的 fixture 备份/清理仍用普通路径，产生 2 个 cleanup error；入口在工具合同阶段退出 1，未进入 Gradle。随后修正 fixture 的长路径备份/受限清理；失败残余 fixture 以目录重命名移入 attempt-02/failed-long-fixture 保存，没有清除其证据。
- `tool-repair-checks`：15 项工具合同全部通过，之后完整 `attempt-03` 再跑当前入口并通过所有必需项。前两次失败及其起点均保留，没有伪造全新起点。
- 初次直接运行元数据工具自测未先加载 `.devenv`，其 TemporaryDirectory 短暂使用系统 C: TEMP（14 个受控 fixture，已自动删除，无交付/持久工作区留在 C:）。这是执行路径偏差；随后把该工具的临时 fixture 明确限制为本仓库 `work/temp`，全部有效完整入口均使用 E: 进程环境。首次独立自测产生的两个本仓库 pyc 缓存也已按精确路径移除，之后 bytecode 写入 `work/pycache`。没有移动或清理共享工具/应用/系统存储。

## 7. 保护检查、未覆盖项与交接

- 最终 `scope-diff.json` 核对 355 个保护文件：**0 变化**，包含生产 Java/Kotlin、已有行为测试/黄金资源、gradle.properties、README 发布表、CHANGELOG、patches-list/bundle、来源记录和历史 delivery/build 包。旧 N75 SHA 仍为 `f7899cf810cdac9948644afc575d5d71589f092614ceecf1b27cf2aa5f760678`；公开 1.5.7 仍为 `41d96e4b65ed9419854e02013ba71d73b884ad444683ddd559ec32e74da77159`。
- 本卡外所有进入时文件保留；只追加本卡报告/状态记录及允许范围内工具改动。状态文件与 `.verification/state-mirror/PROJECT-STATE.md` **逐字节相同**；PROJECT-STATE 原历史前缀保持原 CRLF/字节，未重排整份历史。
- 未运行远端 Actions、真正 semantic-release prepare/publish、真实 APK/官方包组合、设备/安装/签名/清数据、真实付费模型、14 语言母语验收或设备性能测试；也没有 commit/tag/push/PR。真实组合本卡未指定官方 MPP/原始 APK/Patcher/选择集，summary 标记 not executed，而不是从历史目录猜输入。
- 本卡要求的源码、双模块单测、候选、工具拒绝路径及本地接线检查已完成；以上远端/组合/设备边界不属于本卡必须完成的输入，不当作“已通过”。全量正式发布和真实兼容性仍需后续独立授权及输入。
- Gradle 9.6.1 输出 Gradle 10 弃用警告；本轮未升级工具。初始化脚本使用的 Gradle 生命周期回调也应在未来 Gradle 升级任务中复查；不影响当前锁定版本的有效结果。

## 8. 本批次回退办法

不使用 reset/checkout/clean，也不把整个工作树还原到 HEAD。先核对 `exit-manifest.json`，若目标文件自交付后已有新修改，停止覆盖并人工合并。

1. 从 `entry-files.zip` 取出本轮实际修改的既有文件，逐个恢复；该 ZIP 保存的是进入本轮字节，包含 N69–N75 已有 CONTRIBUTING/PROJECT-STATE 内容和被忽略的 `.devenv` 文件。根据 `scope-diff.json` / `batch-only.patch` 选择文件，不覆盖 ZIP 内未改文件。
2. 撤销对新入口的引用后，按最终哈希核对并移除本轮新增的 `tools/verify_current.py`、`tools/verification.init.gradle`、`tools/test_verification.py`；已有生产/行为测试完全不需要回退。
3. 状态文档和镜像一起恢复到 ZIP 中的入场原字节；若统筹已追加复核记录，则只撤回本批段落并保持镜像，不覆盖统筹新增内容。维护入口同理按入场状态合并回退。
4. 本结果报告、validation 证据及独占候选可保留为历史，不影响产品；历史 delivery/release 及用户数据不动。`protected-artifacts.zip` 仅作额外恢复保险，本轮不需要用它覆盖任何旧资产。

建议统筹先核对 `scope-diff.json`、`batch-only.patch`、最终 summary/receipt、负向 fixture、保护结果及初次临时目录偏差，再记录接受/补正/暂缓。下一卡由统筹决定；执行者未自动进入 M2。
