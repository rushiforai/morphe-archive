# M7a-RESULT — 可复现开发入口与当前维护资料收敛

2026-10-25（Asia/Shanghai）；M7a / 任务卡v1，A/B/C同一执行对话完成。**执行：完成待复核；统筹：待复核。** 只交回结果，不自行接受环境可复现性、M7或首轮总体完成，不进入M7b。

唯一活动仓库：`E:\Projects\DeepSeek morphe-ai-caption-translator`。入场/退出分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`；原索引/本机exclude/脏树/未跟踪及两项删除保留。接受产品始终 **1.5.8 / local-1.5.8-m6a / candidate-01**；公开始终 **1.5.7**。本卡没有改产品身份来标记工具工作。

证据根：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M7a-01`。所有项目临时/隔离/构建/证据均在E:；共享工具/系统存储原位保留。

## 入口和工具合同（A）

六个已知忽略前端/初始化（dev.ps1/cmd、verify-full.ps1/cmd、Enter-Dev.ps1、gradle/workspace.init.gradle）、现有tools两个别名及verify_current真实职责已审查。`.devenv`仍受本机exclude忽略、`git ls-files .devenv`仍为空；没有修改exclude、暂存内容或整套工具链。

通用实现移到 **Git可见的 `tools/workspace/` 六文件**：Enter-Dev.ps1、dev.ps1/cmd、verify-full.ps1/cmd、workspace.init.gradle。`tools/Enter-Workspace.ps1`、`tools/Verify.ps1`及四个需要改动的忽略脚本均为薄别名；另外两个cmd原字节保持，不复制私有配置。新增工具无需忽略目录随源码存在，`source_manifest`明确纳入 `tools/workspace/`，不放开整个历史tools树；`.devenv`不再作为指纹所需前提。当前可分发源码/资料ZIP见 `handoff-manifest.json`，不含work/cache/私有.devenv/.git/专有APK/凭据。

通用初始化从脚本位置计算仓库，要求E:可用；JDK21/Python3.12/SDK35、36/build-tools36及三个Robolectric jar均显式检查。进程变量优先，错误输入直接失败；不查旧工程、Codex Python、Windows账号设置或gh认证。TEMP/TMP/test-temp/Python字节码留本仓库work，Gradle/Android可明确复用E:目录；不修改全局变量，也不重写选定Gradle home的properties。Maven输入在settings之前明确选择，默认本仓库work/maven-local；代理只取本进程host/port，内嵌认证拒绝且不回显。

日常入口先本地化、默认两组测试或传入Gradle任务，完整入口保持candidate/release严格分离、明确MPP/MPE/UI及原输出合同；两者默认禁止live模型。子命令失败码由原生调用直接传播。`tools/test_workspace.py`的**15项**实际新进程合同验证默认任务、带空格参数、模式/身份/flags、localization/Gradle/full失败传播、缺JDK/SDK/Python/Robolectric/包设置、SDK冲突、C:可写缓存拒绝、secret不输出/不落盘/不覆盖私有配置、源码别名及新目录指纹保护。

实际隔离暴露Windows长路径问题：compiled检查不能读长路径class，凭据扫描连深目录枚举都可能跳过。工具仅复用既有verify_current.long_path扩展读取和扫描遍历；生产零改动。新增两条实际回归，隔离取**入场原字节**旧工具执行得到一条读取错误、一条漏扫断言失败，最终同断言转绿；见long-path-red-isolated.json/log、long-path-green-final.json/log及最终17项verification-contract。初期fixture调用cmd转义失败、非UTF8直接调用的额外GBK错误和不完整扫描修补均保留原记录，不冒充产品红测。

## 明确环境输入与实际演练（B）

最终实际命令（由rehearse-entry.py启动新进程，精确环境输入在rehearsal-inputs-04.json）：

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File 'E:\Projects\DeepSeek morphe-ai-caption-translator\.tmp\M7a-source-rehearsal-04\tools\workspace\verify-full.ps1' -RunId 20261025-M7a-rehearsal-04 -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m6a -Offline -RerunTests
```

隔离源码 `E:\Projects\DeepSeek morphe-ai-caption-translator\.tmp\M7a-source-rehearsal-04` 只复制manifest明确的当前源码/通用入口和必要公开根文件，没有复制原work/build/validation、私有.devenv或用户配置。原.git仅只读查询，GIT_WORK_TREE指向隔离树、GIT_INDEX_FILE独立副本、GIT_OPTIONAL_LOCKS=0；没有commit/tag/切分支或写原索引。源码ZIP逐文件对照，隔离/活动仓库/完整前后manifest一致。

| 层级 | 实际输入/来源 | 本轮证明与限制 |
| --- | --- | --- |
| 已装工具 | 活动仓库work/toolchain：Temurin21.0.12.1+1、Python3.12.14、SDK35rev2/36rev2/build-tools36.0.0 | 明确选择、版本/可执行与关键jar哈希记录；没有重新下载安装或认证Python原分发来源 |
| Gradle | Wrapper9.6.1，已锁distribution SHA；活动仓库work/gradle-home | 显式复用E:已解析缓存/已解压分发，不是首次ZIP下载校验或空缓存解析 |
| Maven本地产物 | 显式 `C:\Users\14776\.m2\repository` | Morphe插件marker、plugin、Patcher2.0.0 JAR/POM/module逐文件哈希；仅共享artifact读取，原发布commit未独立建立，不借另一工程私有配置 |
| Robolectric | 活动仓库work/toolchain/robolectric | Android9/13/15三个instrumented i7 jar明确供给并offline使用；Gradle依赖图是另一缓存层 |
| Android构建home | 活动仓库work/android-user-home | 明确复用E:本地debug构建home，签名材料没有复制/归档/输出；UI不是设备安装认证 |
| 包设置 | 清除真实GitHub/model环境，显式无权限offline-cache-only用户/token占位值 | Morphe2.0.0配置期急切读取的非空输入。占位值不是真密钥、不具备权限、不证明在线registry认证 |
| Node/npm | 观察24.19.0 / 11.17.0，CI策略仍lts/* | 只记录已装版本；未运行npm安装或publisher，不将lts/*写成精确锁定 |

完整工具/依赖来源、官方获取链接、SDK安装步骤、认证/代理/首次解析及离线层级已写 `docs/DEVELOPMENT.md`；environment-inventory.json只存工具/产物哈希、配置键名与来源限制，不枚举或归档凭据。

**演练层级：隔离源码＋已装工具＋已缓存依赖。没有认证完全空缓存、新机器首次联网安装或缺权限在线认证。**

实际尝试及必要补跑：

1. attempt01：移除包设置，Morphe配置期IllegalArgumentException，未开始应用测试；从实际source JAR核对eager读取，新增可理解前置错误及显式离线占位输入。原日志/summary见attempt-01与首轮rehearsal-inputs.json。
2. attempt02：core328+extension544、UI、MPP及bundle检查通过；随后普通Win32读取长class路径失败，完整入口仍如实failed。**557类/全部XML/receipt在下一Gradle前封存**于attempt-02，绝不将该summary改写为passed。
3. attempt03：工具回归识别扫描深目录仍漏扫，在verification-contract失败即停，未开始Gradle/应用测试；快照和原log保留。
4. attempt04：最终工具固定后一次完整有效入口；与B演练合并。因02暴露真实工具问题而必要补跑，没有机械再跑原仓库全套，也没有重新组合相同生产内容。

## 最终完整验证与产品对照

最终完整入口exit0，summary.status=passed；实际命令/日志/receipt在final/及原隔离运行目录，归档副本不混称原路径执行。两组均executed，不是UP-TO-DATE或FROM-CACHE跳过测试；编译任务可有效复用已缓存结果。

| 项目 | 实际结果 |
| --- | --- |
| translation-core | 328 tests，0 failures/errors/skipped |
| extension | 544 tests，0 failures/errors/skipped |
| 总计 | **872**；原应用测试/资源文件未改 |
| workspace-contract | 15，通过 |
| verification-contract | 17，通过（原15＋长路径2） |
| release-contract | 14，通过 |
| 本地化 | 239键×14语言，通过 |
| 来源/协议/ABI/compiled/UI/MPP-MPE边界 | 通过，实际明确输入 |
| 包身份与凭据扫描 | 通过；独立与内嵌MPE相同；无真实模型调用 |

最终工程指纹 **`aa19b7c8815d30105b975a39805ca384e39fcc86a8829584445c67ce7cae7d05`**。对接受M6a指纹 `30b8cc6a4f236df8038f1e971bcde9bbb323c30d8bc6b5760f021efda9bc798d` 的13项差异全部是tools输入；生产源码/资源/依赖/build ID/来源、ABI、协议/提示词及配置/缓存行为同字节。工程工具指纹和产品二进制身份属于不同层级。

同次 **557类** ZIP SHA-256 `6695b425cce031f54c8cde38c9bad98e6e0750c18ffc57279ba7e4657533c5d2`；receipt SHA-256 `6b603c271d31af9d33f762781482cc8fee87fdacf45beb47e5ae034603291122`。compiled-binding记录逐类哈希/指纹和归档时刻，在下一Gradle之前封存；之后本卡没有再运行Gradle。114份XML逐份hash/模块计数由完整summary绑定。

本卡复现产物（原隔离输出保留，并逐文件复制到以下E:独占交付目录）：

| 产物 | 绝对路径 | 字节数 | SHA-256 |
| --- | --- | ---: | --- |
| mpp | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M7a\20261025-M7a-rehearsal-04\patches-1.5.8.mpp` | 600147 | `7d09f3fe1cba7f7815e2b83b7c78b4174426379dc7e447609620c716ce881473` |
| mpe | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M7a\20261025-M7a-rehearsal-04\extension.mpe` | 732892 | `c6034c0c6d5d81858bfac402b34640e18e5c0a09d1bd90432a71be3b35d2220f` |
| ui_apk | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M7a\20261025-M7a-rehearsal-04\ui-preview-debug.apk` | 3521748 | `a9e2e70913f6bd62d91de894c0c7d9a5a9b1219b1c275c15744d3dab075f9209` |

接受M6a原MPP仍为 `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M6a-candidate-01\patches-1.5.8.mpp`，600147 B / `6eed1d80efa2de6b2209aa180f5e5a29c14821d03ecdcc130390a8dc5ed2227e`。

package-comparison.json对MPP **74条目**逐一记录SHA/大小/压缩字节；仅manifest Timestamp不同，其他73条目（包括生产DEX、全部资源及内嵌MPE）同字节。MPP总大小差 **0 B**，压缩条目差 0 B；没有新增依赖、测试或调试资源。独立/内嵌MPE及UI整文件SHA保持M6a，UI全部条目亦同字节。没有为工具工作修改build ID或产品资源。

据此**引用原接受M6a真实组合，不重复组合**：YouTube21.41.525-SECONDARY `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`，官方1.48.0 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`，Patcher2.0.0 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`；104官方默认根+AI、64581唯一类审计，原未签名APK `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M6a-01\composition-M6a\patched-unsigned.apk`，227145902 B / `e1effef6c49298e9126f383a644ffc17759c306606adfb10dace93dabc536de6`。保留M6a原设备/场景限制，未新增兼容声明/设备认证。

真实CLI负向见negative-cli-checks.json及log：canonical错误版本、忽略兼容别名错误build ID、tools别名release配local ID、真实本地MPP冒充release均非零拒绝；新前端缺工具/包设置及失败传播在15合同中实际执行。原始APK缺失负向本卡**未调用组合引擎验证**，因为本卡完整入口不组合、并且按生产同字节规则复用原组合；缺原始输入时新组合仍为未验证，不能以旧包/旧报告充当新输入成功。

## 当前资料收敛（C）与保护

CONTRIBUTING和英文/中文README开发链接统一指向真正在源码中的入口；新增开发环境文档及简明OPERATIONS。RELEASING区分local candidate/semantic-release prepare/publish和未执行远端动作。ARCHITECTURE说明现行模块/关键合同，不再将旧施工现状当当前入口。COMPATIBILITY只追加当前证据/待验层级，目标列表与产品未变。

PROJECT-STATE改写**之前**，入场原文已原字节归档 `docs/history/PROJECT-STATE-before-M7a-20261025.md` 并核验：SHA-256 **`5c3798f43ab7de7c5e4b7cda88fd51614852473234ad7e768dfb6d7826bb968d`**。完整原文/所有章节保留，history/README提供81个原二级章节跳转；原归档相对链接保持原docs目录含义，未改写旧N*或封存结果。当前状态收敛为身份、有效操作、接受/保留范围、最近证据及下一步，镜像逐字节一致。当前活动文档没有依赖旧PROJECT-STATE片段的链接；本轮14份当前入口文档检查200条本地链接/锚点，**0失败**。外部旧社区/发布/历史URL未全量联网探测，官方工具/认证获取来源按本轮实际核实记录。

入场2259项原件/ZIP自检；退出**2235项范围外现存原字节**、两项原删除状态保持，16617项有限历史交付/不可变log/XML/receipt/compiled ZIP/回退原件全部SHA一致。138项既有生产Java/Kotlin及154项原测试/资源输入保持；所有构建元数据、公共发布元数据、core来源/ABI/协议/提示词和产品行为输入未改。正常可再生成Gradle中间class不纳入长期历史清单，未清理交付/共享缓存或改44项恢复历史。

原工作树22个已有文件在本卡授权工具/文档范围改变，清单如下（完整逐文件入场/退出hash与batch.diff供审阅，不以HEAD总diff当本轮改动）：

- `.devenv/Enter-Dev.ps1`
- `.devenv/dev.ps1`
- `.devenv/gradle/workspace.init.gradle`
- `.devenv/verify-full.ps1`
- `.verification/state-mirror/PROJECT-STATE.md`
- `AGENTS.md`
- `CONTRIBUTING.md`
- `README.md`
- `docs/ARCHITECTURE.md`
- `docs/COMPATIBILITY.md`
- `docs/MAINTENANCE-ROADMAP.md`
- `docs/PROJECT-STATE.md`
- `docs/README.zh-CN.md`
- `docs/RELEASING.md`
- `docs/maintenance/COMPLETION-PLAN.md`
- `docs/maintenance/README.md`
- `tools/Enter-Workspace.ps1`
- `tools/Verify.ps1`
- `tools/scan_delivery_credentials.py`
- `tools/test_verification.py`
- `tools/verify_current.py`
- `tools/verify_integration.py`

新增通用入口、工具合同、开发/操作文档、原状态历史索引/归档和本结果可被Git非忽略文件枚举（本轮不暂存/提交）。初期ad-hoc Python导入再生成的既有pycache已按入场ZIP精确恢复，若有恢复详见restored-generated-pycache.json；不是用户/共享缓存清理。分支/HEAD/index及.git/info/exclude哈希保持；状态/镜像同字节。

## 退出哈希逐文件回退

**31目标**，exit-originals.zip SHA-256 `6910c4dfc1d594439cb5ff56eac9a2b5376bf873152e2df6a44a8b18c39ff3d2`。原件来自本卡entry-originals.zip，不来自HEAD；计划含状态/镜像成对。结果、证据、原文历史归档/索引、所有新旧包及隔离源码保留，不会被回退删除。

```powershell
& 'E:\Projects\DeepSeek morphe-ai-caption-translator\work\toolchain\python\python.exe' -B -X utf8 'E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M7a-01\rollback.py'
```

**实际活动仓库已执行默认dry-run通过，未apply。** 只有明确--apply才写入；先校验全体目标退出SHA、两个ZIP与原件，任一后续编辑/删除冲突整体拒绝且零写。E: `.tmp/M7a-rollback-rehearsal-docqa`实际dry-run、注入后续编辑拒绝/全树零写、恢复退出字节后隔离apply及逐文件入口精确还原均通过。最终文档QA只补正收尾规划一处“未执行M7a”的陈旧说法，旧seal实际在活动仓库按退出冲突拒绝且零写，随后重新封存；原seal/报告/ZIP/演练完整保存在before-final-doc-qa，不覆盖原证据。rollback-rehearsal.json、计划/原件/退出ZIP和原始log保留。

## 未覆盖与交回边界

- 未做完全空缓存/新机器首装、在线registry真实认证、共享本地Maven产物原发布commit重建、远端CI/实际publisher。上述限制影响能否宣称冷启动/新机认证，本卡仅提交明确缓存复用演练供统筹判断。
- 未做新的APK缺失组合引擎负向、新组合、设备/OEM/硬件Keystore/磁盘长尾、帧时/内存/耗电、真实API接收/费用、任意线程交错或14语母语质量认证。
- 主线程启动严格配置读取、源put前窗口、跨文件断电/双IO、配置多store/orphan/坏索引等原合同限制保持。**导出official=1.45.0为过时静态标记，登记M7b处理；未擅填“实际加载1.48.0”。**
- 没有commit/tag、push/PR/发布、签名安装、清用户数据/真实缓存、真实付费API、共享缓存清理、reset/clean。未进入M7b，未接受M7或首轮总体完成。

交统筹复核本卡可分发入口、工具合同/长路径修补、缓存层级与来源限制、实际演练/完整结果、当前文档/历史保护及回退；**执行完成待复核，统筹待复核**。
