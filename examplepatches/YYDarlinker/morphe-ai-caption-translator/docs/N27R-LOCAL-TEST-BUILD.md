# N27r 交付记录：修复启动 VerifyError ＋ 补齐最终 DEX 分支审计

日期：2026-10-01（N27r）。执行仓库 `E:\Projects\morphe-caption-v2`，开工 HEAD `28229e0`。

本卡只做两件事：把 N27 的空值保护分支改为绑定**真实 `return-void`** 的 `ExternalLabel`；把「最终交付 DEX 的分支边界」与「本卡宿主构造器接入」变成仓库内、常规管线会跑、能拒绝历史坏包的验证。N27 协调器 Java、Overlay、HookV2 显示算法、8dp/100ms/200ms、五档字号、分页/正文/时间归属、原生/AI ownership、缓存、调度、API 与全部持久化值**一行未改**。三项延期语言/文案问题继续未关闭。

## 0. 开工基线与档案一致性

- HEAD `28229e0`；源码锚点 `anchor/n27-62c4916` 指向 `62c4916`；`git log --oneline anchor/n27-62c4916..28229e0` 只有 docs 两文件。
- 开工工作区：`M docs/PROJECT-STATE.md`、`?? docs/N27-CRASH-REVIEW.md`、`?? docs/N27R-CRASH-REPAIR-TASK.md`（规划者管理改动，**原样保留并随本卡提交**，未回滚）。
- §2.8 两份状态档案逐字节一致：93,402 字节 / SHA-256 `ED27285C411A5D21E38D8CA8842FEC5CDE974780F75AD8CDD65D43E86E60A918`（仓库副本与 `C:\Users\14776\Documents\kimi\tasks\2026-09-29\00-35-52-ec1208d7\PROJECT-STATE.md` 相同），无差异故不覆盖。
- 翻译 API **0 次 / 0 tok**；新增依赖 **0**；下载 **0**；不真机、不签名、不安装、不清数据、不推送。

## A 最小生产修复（唯一源码改动）

文件：`patches/src/main/kotlin/app/yydarlinker/patches/deepseekcaptions/CaptionControlsAvoidancePatch.kt`

**修前**：片段用普通 `addInstructions` 插入，末尾带一个没有后继 opcode 的裸标签 `:yydarlinker_caption_controls_ready`。序列化后 `if-eqz` 的标签重定位落在错误 code unit，交付 APK 实测：

```text
PC=0x10 width=2 if-eqz v1   signed_offset=-3  target_pc=0x0d
0x0b width=3 invoke-static  PlayerControlsVisibilityHookPatch;->setPlayerControlsVisibility(Enum)
```

`0x0d` 落在宽 3 的官方 `invoke-static`（`0x0b..0x0d`）操作数字内部 → ART 类验证直接拒绝整个 `bfec`（`VerifyError: [0x10] target dex pc 0xd is not at instruction start`），与手机 7 个进程的崩溃原文一致。

**修后**：插入前捕获构造器末尾真实 `RETURN_VOID` 的 `BuilderInstruction` 对象与索引，改用 `addInstructionsWithLabels` ＋ `ExternalLabel("yydarlinker_caption_controls_return", originalReturn)`；片段里不再有末尾裸标签，不计算、不写死任何 relative/PC。

```kotlin
val returnIndex = instructions.size - 1
val originalReturn = instructions[returnIndex]
if (originalReturn.opcode != Opcode.RETURN_VOID) { throw PatchException(...) }
constructor.addInstructionsWithLabels(returnIndex, """…iget-object / if-eqz / iget / invoke-static / move-result-object / invoke-static…""",
    ExternalLabel("yydarlinker_caption_controls_return", originalReturn))
```

保留不变：唯一指纹与 holder/store/int/factory/enum 类型约束、从 owner 重载 holder 的第一条 `iget-object`、空 holder 保护、本卡 enum 回调、官方 hook（未删除、未挪走、未替换）、错误兼容结构抛具名 `PatchException`。未使用数值偏移、未加 nop、未删空值判断、未关闭避让、未给 host/hook 加 catch-all、未回退 N26、未改 API/分页/语言策略。

**交付 APK 内实测（`build/n27r-records/new-n27r-branch-audit.txt`）**：同一条构造器、同一 PC，偏移由 `-3` 变为 `+11`：

| index | pc | width | 指令 |
| ---: | ---: | ---: | --- |
| 5 | 0x0b | 3 | `invoke-static` 官方 `PlayerControlsVisibilityHookPatch;->setPlayerControlsVisibility(Enum)` |
| 6 | 0xe | 2 | `iget-object v1, v0, Lbfec;->c:Lbfed;`（本卡重载 holder） |
| 7 | **0x10** | 2 | `if-eqz v1` → **signed_offset=+11 → target_pc=0x1b** |
| 8 | 0x12 | 2 | `iget v1, v1, Lbfed;->e:I` |
| 9 | 0x14 | 3 | `invoke-static { v1 }, Lbfee;->a(I)Lbfee;` |
| 10 | 0x17 | 1 | `move-result-object v1` |
| 11 | 0x18 | 3 | `invoke-static` 本卡 `DeepSeekCaptionHookV2;->onPlayerControlsVisibility(Enum)` |
| 12 | 0x1b | 1 | `return-void` ← 空值分支的真实目标 |

`target_is_method_last=true same_method=true`；非空路径按「重载 holder → 读 int → 工厂返回 Enum → move-result-object 相邻 → 本卡 callback → 落入同一 return」逐条通过，寄存器/参数 word 数/类型未倒退。

## B 最终 DEX 审计（仓库内、常规管线）

新增/扩展全部位于 `patches/src/test/kotlin/validation/`（既有 `CompositionHarness`/`CompositionDexAudit` 同一约定），入口由 Gradle 任务驱动，不是 ignored 目录、不要求手工记得运行。

| 文件 | 作用 |
| --- | --- |
| `DexBranchAudit.kt` | 容器遍历（APK／MPE／MPP／裸 DEX，含嵌套 MPE）＋ 逐方法 16 位 code unit 地址映射＋分支合法性判定＋裸 `code_item` 交叉核对＋内置变异自检 |
| `ControlsHookBindingAudit.kt` | 本卡宿主构造器接入审计（按真实方法引用＋指纹形状识别实体模型，不硬编码 `Lbfec;`） |
| `FinalDexBranchAudit.kt` | CLI 入口（`--input/--report/--require-ai/--label`），非 0 退出 |
| `InjectionOrderRegression.kt` | 真 patcher 注入 → 序列化 → 重新读取的生产回归 |

**B1 控制流地址检查**（单位＝16 位 code unit）：遍历指令累计 `codeUnits` 建立 PC→指令边界与 opcode 集合；`goto`/`if-*` target＝`当前PC + 有符号 codeOffset`，必须在同方法内且是可执行 opcode 起点（payload 不是合法目标）；`packed-switch`/`sparse-switch` 分别检查 payload 引用、payload 种类、4 字节对齐，**每个 case 的 offset 相对 switch 指令**（不是 payload）；`fill-array-data` 同样只按 payload 规则判，不按普通 goto 误判；有 try/catch 的方法保留合法范围规则（handler 必须是 opcode 起点、try end 可以等于方法末端、不得越界）。异常、解析失败、方法漏读、code size 不一致一律 FAIL，不能当 PASS。

**独立地址核对**：除 dexlib2 的 code-unit 累计外，另用自写解析器直接读 DEX（string/type/proto/method_ids、class_defs、class_data uleb128、`code_item.insns_size`），逐方法比对 `Σ codeUnits == insns_size`，并双向核对方法集合。交付 APK：`code_unit_checks=30108/13039/…` 全部相等，`raw_methods_with_code == methods_with_code`。

**内置变异自检**（每次审计都会跑，证明扫描器不是空转）：用 dexlib2 写出一份真实序列化的合成 DEX，基线必须通过；把 `if-eqz` 的操作数改成 `+1` 必须被拒（`target_inside_instruction containing_pc=0x1 containing_width=2 containing_opcode=if-eqz`）；改成 `+1000` 必须被拒（`target_outside_method code_size=0x4`）。

**B2 宿主构造器语义检查**：先按**真实方法引用**找到唯一调用 `DeepSeekCaptionHookV2;->onPlayerControlsVisibility` 的宿主方法（该组合里恰好 1 处），再用与生产指纹相同的读数形状（public 无参、返回 `Ljava/lang/Enum;` 子类、`IGET` int ＋ 静态 `(I)` 工厂）交叉确认同一实体模型；随后检查 null guard 的目标恰为非空路径落入的同一个 `RETURN_VOID`、路径顺序、`invoke` 与 `move-result` 相邻、寄存器界限与参数 word 数、本卡 callback 恰 1 次、官方 hook ≤1 次，并打印真实混淆名与整张 PC 表。`--require-ai=false` 时只要求「全宿主无本卡 callback 调用点」，不要求任何注入——validator 不会让补丁变成无条件注入。此检查命名为 **DEX 结构与接入验证**，不是「完整 ART 验证／真机启动已通过」。

**接入常规入口**：`patches/build.gradle.kts` 新增 `:patches:auditFinalDex`（任意容器）与 `:patches:verifyInjectionOrder`；同时 `CompositionDexAudit.kt`（既有的交付/组合 DEX 审计入口，`:patches:auditComposition`）在**原有判据之前**调用同一个 `FinalDexBranchAudit.audit`，失败即 `check` 失败、构建非 0 退出。旧的 `TYPE_SAFE_SUMMARY` 类型模拟与其产物保留，但不再充当分支/最终产物证明。

## C 回归与审计反证

1. **旧 N27 真实坏包被拒**：直接读 `build/n27-composition-final/YouTube-21.16.256-本地测试包-n27-unsigned.apk`（196,943,040 B / `BF4C53EB…6103`，未覆盖、未修改）：

   ```text
   FAIL_BRANCH dex=…!classes.dex class=Lbfec; method=<init>(Lbfed;)V kind=if source_pc=0x10 signed_offset=-3
     target_pc=0xd target_opcode=<none> target_valid=false reason=target_inside_instruction
     containing_pc=0xb containing_width=3 containing_opcode=invoke-static
   FAIL_BINDING … problem=guard_target_not_instruction_start target_pc=0xd
   SUMMARY … invalid_branches=1 dex_problems=0 binding_failures=1
   DEX_BRANCH_AUDIT_FAIL label=n27-old-bad invalid_branches=1 dex_problems=0 binding=false
   ```

   同一坏包送进**既有组合入口**同样被拒：`:patches:auditComposition` 在新增检查处抛 `IllegalStateException: Final DEX branch/controls-hook audit failed`，`BUILD FAILED`（`build/n27r-records/n27r-old-bad-through-composition-audit.log`）。坏包在回归中就是**预期失败样本**，其 FAIL 未被包装成产物 PASS。

2. **真实生产注入回归**（真 patcher → 序列化 → 从磁盘重读，非 ArrayList 重排、非手写「正确 smali」），每一行都来自修改后的生产函数与交付 MPP：

   | order | 选择 | 结果 |
   | --- | --- | --- |
   | `official-first` | 官方默认（含安装官方 hook 的补丁）→ AI root，83+1 | `signed_offset=11 target_pc=0x1b return-void`，`invalid_branches=0`，`ai_callback_count=1 official_hook_count=1` |
   | `ai-first` | AI root 先入集合 → 官方默认 | 同上，PC 表逐条一致 |
   | `no-ai` | 官方默认 ＋ 原生补丁，`require_ai=false` | `DEX_BRANCH_AUDIT_PASS`，无本卡 callback 调用点 |

   `official-first` 与 `ai-first` 两种施工顺序在本 bundle 下被 patcher 归一成同一布局（官方块固定在 `iput-object` 之后、本卡块之前），故两者 PC 表相同——**如实报告，不宣称两序产生了不同宽度前缀**。

3. **新最终 APK**：`DEX_BRANCH_AUDIT_PASS label=n27r-final dex_units=11 invalid_branches=0`；`dex_units=11` 是**实际读到的**根 DEX 数（审计不写死 11 作为通过条件），另有 322,002 个方法、624,712 条分支边、112,402 个 switch case、46,579 个 try 块全部通过。与旧包并列保留：`old-n27-bad-branch-audit.txt` ↔ `new-n27r-branch-audit.txt`。

4. **验证会报错**：内置变异自检（分支目标落入操作数字 / 越出方法）每次审计都执行并要求被拒；此外旧 N27 真实坏包本身即为反证。未为测试新增生产分支、未改验收判据、未改冻结数据。

5. **接入证明**：`:patches:auditComposition` 对新包输出以 `DEX_BRANCH_AUDIT_PASS label=composition` 开头，随后才是既有 `DEX_AUDIT_PASS classes=58034`；对旧坏包则在同一阶段直接失败。证据 `n27r-final-dex-audit.log`、`n27r-old-bad-through-composition-audit.log`。

**「无官方hook」组合的边界（三次真实尝试，如实报告）**：官方 1.44.0 下无法构造出不安装官方 hook 的有效组合——

- 只选 AI root（`no-official`）：`PatchException: Could not find class: Lapp/morphe/extension/youtube/patches/utils/FlyoutUtils;`（AI root 的 finalize 需要官方 YouTube 扩展）。
- 官方默认去掉 `Hide player overlay buttons`：运行成功（83 补丁）但 `official_hook_count=1`，因为 `GmsCore support` 的声明依赖里就含它。
- 官方默认再去掉 `GmsCore support`：运行成功（82 补丁）`official_hook_count` 仍为 1，说明该 hook 还可经共享内部依赖到达。
- 只留 `Hide player flyout menu components` ＋ AI root：`res/xml/morphe_prefs.xml declares 0 'morphe_settings_screen_12_video_sort_by_key' screens`（AI 入口需要官方 Morphe 设置页）。

依赖关系由 patcher 自己的 `Patch.getDependencies()` 读出并留档（`official-patch-list.txt`），注入方由官方 bundle 内携带该 smali 串的类定位（`PlayerControlsOverlayVisibilityPatchKt`，`official-hook-patch-probe.txt`），不是猜测。validator 仍按产物报告 `official_hook_count` 并在 >1 时失败，官方未选中时报告 0；本卡不因无法构造该组合而放宽任何判据。

## 验证

- Java 全套离线单测 **464/464**（0 失败 / 0 错误 / **0 跳过**，**59 套件**；与 N27 基线一致，本卡未新增 JUnit 用例——新增回归以既有 `patches/src/test/kotlin/validation` 入口方式落地）。`CAPTION_UI_PREVIEW_OUTPUT` 指向 `.verification/n27r/frames` 时 N27 帧导出用例照常运行。
- Python `unittest discover -s scoreboard` **27/27**（`Ran 27 tests / OK`）。
- `tools/check_localization.py`：**220 keys × 14 语种**，XML 与源映射有效。
- 冻结计分板 `scoreboard/run.ps1`：**4 通过 / 4 既有失败 / 4 未验证**，`pending_translation`／`event_review`／`overflow` 不可见时长**全 0**；`ACCEPTANCE.md` 与 `scoreboard/results/frozen-baseline.json` **Git 无差异**。
- 组合 **84/84 PASS**（`COMPOSITION_PASS`，`structure.txt` 的 hooks 含 `onPlayerControlsVisibility=1`），`DEX_AUDIT_PASS classes=58034`。
- 新增审计在**同一入口**另列结果：`DEX_BRANCH_AUDIT_PASS`（11 根 DEX / 624,712 分支 / 0 非法），并已对交付 MPE、交付 MPP（内嵌扩展 DEX ＋ patcher `classes.dex`）与未补丁原版 APK 分别运行（`--require-ai=false`），全部 PASS。
- `build/n27r-records/verify_artifacts.py` PASS：MPP 74 条目唯一、CRC、根 DEX 与扩展 DEX 头/长度/SHA-1/Adler-32、内嵌扩展与交付 MPE 逐字节一致、14 份 locale XML 与源一致、N25/N26 标记全保留、**交付 patch dex 含新 `ExternalLabel` 名 `yydarlinker_caption_controls_return` 且不再含旧裸标签 `yydarlinker_caption_controls_ready`**、12 个控件名在扩展内、两个全屏容器 id 不在扩展内；APK 16,604 条目、**官方 hook 与本卡观察者同处 `classes.dex`**、无 `META-INF` 签名文件、三套设置 XML 仍为新 key、`resources.arsc` 含十四语种新说明且不含旧说明。
- `verify_bundle.py 1.3.5`、`N8Verify`、ZIP CRC、11 个根 DEX 头、`aapt dump badging`（`app.morphe.android.youtube` 21.16.256 / minSdk 28 / targetSdk 36）、`apksigner verify` 报 `DOES NOT VERIFY`（未签名确认）。
- 历史产物前后 SHA-256 全部一致（`history.py` / `history_compare.py`，排除本卡新产物）。**N27 与 N26 等旧包均未被覆盖**。

## 交付

| 产物完整路径 | 字节数 | 比 N27 | SHA-256 |
| --- | ---: | ---: | --- |
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n27r.mpp` | 1,117,960 | +179 | `5428E17A1F29CAE340FD135EB642D08CA9FFB71DE5EB61BF7A95AE9813364FDF` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n27r.mpe` | 2,727,272 | 0 | `45F2C9B6694507113D79FE544A04208C24C6544AA2C51ECE3846778E01064489` |
| `E:\Projects\morphe-caption-v2\build\n27r-composition-final\YouTube-21.16.256-本地测试包-n27r-unsigned.apk` | 196,943,036 | −4 | `31071874010CA7532CD7A8A1EA7E5A396D0AF356AB02D5119EE8A958A48276F4` |

MPP 增量来自标签绑定改动后的 `CaptionControlsAvoidancePatchKt` 字节码（+179 B）；**MPE 与 N27 逐字节相同**（本卡未改扩展 Java，SHA-256 与 N27 交付值一致，如实报告增量为 0）；APK 增量来自该 patch dex 与 patcher 元数据。交付 APK 由**交付 MPP 本身**组合而成（组合前先把 `buildAndroid` 产物另存，避免 `:patches:jar` 覆盖同名 `patches-1.3.5.mpp`），组合后再从磁盘重读该 APK 做新增审计。工具链沿用 YouTube **21.16.256** ＋ 官方 **1.44.0** ＋ Patcher **1.14.1**，嵌套 Zulu JDK 21、既有 `ANDROID_HOME`、全程 `--offline`。

**构建可复现性如实报告**：MPP/MPE/APK 的 ZIP 内 `META-INF/MANIFEST.MF` 带构建时间戳，同一源码两次构建整包哈希不同；交付哈希是**本次构建实例**的哈希，不代表逐字节可复现。MPE 因本卡未触碰扩展源码而未重新生成（`assembleRelease` 判定 UP-TO-DATE），其字节与 N27 完全一致。

## 边界

- **未做真机**：本卡不签名、不安装、不启动、不采集新日志。**最终 DEX 检查通过，启动修复待用户装机验证**；不得据此写「实测不再闪退」。
- 用户真机复验顺序：先应用正常启动／主页／设置；再普通详情页与横屏全屏显示、隐藏控件；然后暂停／旋转／seek／换视频／拖字幕，确认避让仍工作且无新闪退。可读日志只保留新时间段，旧崩溃不得当作新复验失败，短日志无异常也不等于已正常启动。
- 本卡未新增 JUnit 用例，Java 计数与 N27 基线一致；新增回归以 `patches/src/test/kotlin/validation` 的 Gradle 入口落地，与仓库既有 `CompositionHarness`/`CompositionDexAudit` 同一约定。
- 「官方 hook 未被选中」的组合在官方 1.44.0 下不可构造（见 §C 第 5 条），该情形由 validator 的 `official_hook_count` 字段与 `--require-ai=false` 路径覆盖，本卡未因此放宽判据。
- N27 协调器 Java、Overlay、HookV2 显示算法、避让参数与诊断事件本期未改；未提前处理三项延期本地化/文案问题，最终全面审计仍为必须步骤。

## 提交与锚点

一个实现提交 `4c1d33f` 含源码（`CaptionControlsAvoidancePatch.kt`）、验证（4 个新 validator ＋ `CompositionDexAudit.kt` 接入 ＋ `patches/build.gradle.kts` 两个任务）、管理档案（`docs/PROJECT-STATE.md`、`docs/N27-CRASH-REVIEW.md`、`docs/N27R-CRASH-REPAIR-TASK.md`）与本交付记录；标签 `anchor/n27r-4c1d33f` 指向该提交，即含全部修复源码的点。未 amend 任何既有 N27/N26 提交，未推送。其后若另有把本记录里的占位短哈希写实的状态补记提交（`docs: N27r write the real anchor hash`），它不含任何源码改动，源锚点与 HEAD 的关系以 `git log --oneline anchor/n27r-4c1d33f..HEAD` 为准（本次为 1 个仅 docs 的提交）。
