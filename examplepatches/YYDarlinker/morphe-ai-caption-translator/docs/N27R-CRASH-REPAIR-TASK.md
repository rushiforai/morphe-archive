# N27r 执行卡：修复启动VerifyError，补齐最终DEX分支审计

## 0. 执行职责与终点

本卡根因和主修复方案已由规划者查明并定案。DeepSeek Harness只负责按卡实现、验证、建包、提交、交付，完成即停。本期不是N28语言功能，不自行扩展设计。

目标：修复N27导致应用启动即退出的非法DEX跳转，保留普通详情页/横屏全屏的播放器控件避让。新增验证必须能拒绝历史N27坏包，并检查实际交付APK，避免模拟片段通过而真实文件仍坏。

执行仓库仅`E:\Projects\morphe-caption-v2`。
开工HEAD应为`28229e0`；源码锚点`anchor/n27-62c4916`应指向`62c4916`，后续仅docs。
先读实时`docs/PROJECT-STATE.md`、`docs/N27-CRASH-REVIEW.md`及`docs/N27-LOCAL-TEST-BUILD.md`。
规划者本轮管理改动包括状态档案和本两份docs；必须保留并随卡提交，不能因工作区不干净回滚。先核对两份状态一致，有差异先读内容，不盲目覆盖。

## 1. 确定的根因，不重新调查架构

用户点图标立即闪退；手机已读出7个进程的相同崩溃：

```text
java.lang.VerifyError: Verifier rejected class bfec:
void bfec.<init>(bfed): [0x10] target dex pc 0xd is not at instruction start.
```

本地最终N27交付APK亦证实：`classes.dex Lbfec;-><init>(Lbfed;)V`在PC0x10的`if-eqz v1`编码relative=-3，跳到PC0x0d；0x0d位于PC0x0b、宽3的官方hook `invoke-static`内部。正确语义应跳到最后的`return-void`（坏包中在PC0x1b；修复后不能硬编码此地址）。

根因是N27普通`addInstructions`插入带跳转/末尾裸标签片段，序列化后的标签重定位错误。不是寄存器类型冲突的猜测，不是翻译API/并发/控件几何问题；不得用try/catch或吞异常解决类验证失败。

完整证据位于：
`C:\Users\14776\.codex\visualizations\2026\10\01\01a0f56a-7d8c-75e0-8def-3fa2f0b542ef\n27-crash-review`。
重点读`n27-crash-androidruntime.txt`与`n27-final-constructor-pc.txt`，不要传播原始buffer里的其他应用记录。

## 2. A：最小生产修复，方案固定

改`patches/src/main/kotlin/app/yydarlinker/patches/deepseekcaptions/CaptionControlsAvoidancePatch.kt`：

1. 从当前mutable构造器，在插入前捕获末尾真实`RETURN_VOID`的`BuilderInstruction`对象和插入索引；沿用现有唯一指纹、holder/store/int/factory/enum类型约束。
2. 改用本地patcher已支持的`InstructionExtensions.addInstructionsWithLabels`与`app.morphe.patcher.util.smali.ExternalLabel`。
3. `if-eqz`目标通过`ExternalLabel`绑定上述真实返回指令，片段里不再定义一个没有后继opcode的末尾裸标签；不计算/写死relative或PC。
4. 保留从owner重载holder的第一条`iget-object`，保留空holder保护和本卡enum回调；不删除/挪走官方hook，不改宿主原字段或构造器语义。

推荐形状（类型/索引以当前mutable实现为准，但目标必须绑定真实return对象）：

```kotlin
val returnIndex = constructor.implementation!!.instructions.size - 1
val originalReturn = constructor.getInstruction<BuilderInstruction>(returnIndex)
check(originalReturn.opcode == Opcode.RETURN_VOID)
constructor.addInstructionsWithLabels(
    returnIndex,
    """
        iget-object v$valueRegister, v$ownerRegister, $holderField
        if-eqz v$valueRegister, :caption_controls_return
        iget v$valueRegister, v$valueRegister, $stateField
        invoke-static { v$valueRegister }, $factory
        move-result-object v$valueRegister
        invoke-static { v$valueRegister }, $CAPTION_HOOK_CLASS->onPlayerControlsVisibility(Ljava/lang/Enum;)V
    """.trimIndent(),
    ExternalLabel("caption_controls_return", originalReturn),
)
```

错误兼容结构依旧抛具名`PatchException`，不要新造启发式匹配。参考仓库现有`CaptionQuickTogglePatch.kt`对`ExternalLabel`真实指令的绑定方式；不替换patcher、不加依赖/下载。

**不采用**：写`+11`/`0x1b`数值偏移；在片段尾盲加nop碰碰运气；删除空值判断；关闭/删除避让功能；给整个host或hook加catch-all；整体回退N26；修改API/分页/语言策略。

若实际patcher API与示例类型有差异，只调整导入/BuilderInstruction读取方式，保持上述绑定语义。若主修复无法达成，不交付一个假称修好的新包；记录具体障碍后停止，不自行更换功能方案。

## 3. B：补齐实际交付DEX审计，必须进入常规管线

旧`.verification/n27/tools/N27ControlsHookCheck.java`只对原始APK+独立assemble片段+ArrayList重排做类型模拟，不能作为最终DEX合法性证明。新增/扩展**仓库内**持久验证工具（如`patches/src/test/kotlin/validation`），并接入现有组合/交付验证入口；不得仅放ignored目录或要求手工记得运行。

检查输入必须是真实序列化并从磁盘重新读取的最终APK/DEX，不是刚拼接的Builder指令列表，不是只有MPE的协调器代码，也不是未补丁原版APK。

### B1 真实控制流地址检查

对每个有code的方法：
- 遍历指令累计`codeUnits`，建立PC→指令边界与opcode集合；单位是16位code unit，不是字节/指令序号。
- `goto`/`if-*`的target=`当前PC + 有符号codeOffset`，必须在同方法内且是可执行opcode起点，不能落在操作数字、方法尾外或payload内部。
- `packed-switch`/`sparse-switch`分开检查payload引用、匹配payload种类、对齐及每个case目标；case offset相对switch指令，不相对payload。`fill-array-data`同样检查payload，不能把payload地址按普通goto规则误判。
- 有try/catch的方法保留合法范围规则：catch handler是opcode边界；try end可以是合法方法末端，不允许超过code范围。不得为增加扫描而重写宿主方法。
- 报告至少含文件SHA、DEX名、类/方法签名、source_pc、signed_offset、target_pc、target有效性/原因、扫描方法与分支数；异常/解析失败/漏读DEX不能当PASS。
- 至少对最终交付APK全部11个根DEX执行分支边界扫描；审计实际出现多少DEX如实输出，不写死“11个”作为通过。MPE/MPP中的扩展DEX走既有内容/头审计并补新扫描；对组合产物也使用同一validator。

### B2 本卡宿主构造器语义检查

在AI开启的组合中，通过既有指纹/实际方法引用识别实体模型构造器，不硬编码`Lbfec;`作为唯一跨版本识别办法。本轮21.16.256报告保留真实混淆名便于核对。

- 本卡null guard的真实目标恰为其应返回的`RETURN_VOID`。
- 非空路径从owner重载holder→读I→工厂返回Enum→本卡callback→return，invoke与move-result相邻，寄存器界限/参数word数/类型不倒退。
- 本卡callback恰1次；官方hook若被该组合选中则保留且恰1次，不能为了修复去掉官方hook。官方未被选中的组合仍可独立使用本功能。
- 若模拟两种施工顺序，必须调用真实patcher API、序列化、重新读取后检查，不只对ArrayList换顺序；在不同指令宽度/前插官方块后，目标仍绑定同一正确return。
- 没选AI的组合按既有契约没有本卡回调，不能因新增validator让补丁变成无条件注入。

此检查是DEX结构与本卡接入验证，不得命名成“完整ART验证/真机启动已通过”。保留此前类型检查，但不再用`TYPE_SAFE_SUMMARY`代替分支/最终产物检查。

## 4. C：有意义的回归与审计反证

必须包含以下证据：

1. **旧N27真实坏包**：新validator直接读取已保留的`build/n27-composition-final/YouTube-21.16.256-本地测试包-n27-unsigned.apk`，应以非0/明确FAIL拒绝，并报告`source=0x10,target=0x0d`及落入opcode内部。禁止覆盖坏包、改坏包、把其FAIL包装成产物PASS；在回归中这是预期失败样本。
2. **真实生产注入回归**：对原始目标及已有官方注入的目标，使用修改后的生产函数/同一patcher标签API进行注入、序列化再读；null guard真实target应为return，非空路径callback正确，寄存器状态检查仍成立。至少覆盖官方先/后施工及无官方hook；不得只测试手工写的“正确smali”。
3. **新最终APK**：全DEX分支扫描通过，本卡真实构造器打印PC、宽度、signed offset、target opcode；与旧包并列保留。
4. **验证会报错**：除旧真实坏包，可用仅限测试的分支目标操作数字/越界变异证明扫描拒绝；不能为测试新增生产分支、修改验收判据或改冻结数据。
5. **接入证明**：交付/组合常规入口确实调用这个检查。能按已有组合工具把坏包送进对应校验阶段并得到失败则留证；不要只在新测试调用而常规入口仍旁路。

新审计若发现其他位置已有非法目标，区分N26/N27差异和本卡范围，记录并报告；不为“全0”忽略、白名单放行或擅改其他功能。

## 5. 冻结范围与必要检查

只允许：上述Kotlin标签修复、最小必要验证/测试/组合入口、交付记录与状态管理。N27协调器Java、Overlay、HookV2显示算法本期原则上不改；若查到另一个真实启动阻断点，先提供具体证据，不重写整套协调器。

保留8dp/100ms/200ms、用户位置、五档大小、字体样式、分页/正文/时间归属、原生/AIownership、缓存、调度、API与所有持久化数据。
AI入口summary、十四语种运行时遗漏、旧程序性诊断中文仍按用户要求延期，最终全面审计必须保留。

离线JDK21与既有工具链，零新依赖、零下载、零翻译API。执行适当新增回归、Java全套（N27基线464/59，实际新增如实报）、Python27、localization220×14、冻结计分板4/4/4且三类不可见时长全0；ACCEPTANCE和冻结证据Git无差异；保持原组合84项通过，新增控制流检查另列结果，不改旧判据凑数。DEX/verify_bundle/ZIP与既有契约检查继续执行；历史所有已交付产物哈希前后不变。

## 6. 产物、提交与真机边界

交付使用新后缀`-n27r`，不覆盖任何N27/N26旧文件：
- `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n27r.mpp`
- `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n27r.mpe`
- `E:\Projects\morphe-caption-v2\build\n27r-composition-final\YouTube-21.16.256-本地测试包-n27r-unsigned.apk`

沿用YouTube21.16.256 + 官方1.44.0 + Patcher1.14.1，以**交付MPP本身**组成最终APK，再读取该APK做新增审计；避免Android/普通jar任务覆盖同名MPP取错构建结果。MPE与MPP内嵌扩展逐字节一致。输出绝对路径/字节/SHA-256/相对N27差额，以及旧坏包→新包的控制流证据。

一张卡一个实现提交，含源码/测试/管理与交付记录；标签`anchor/n27r-<实现短哈希>`指向含全部修复源码的点，不amend既有N27、不推送。如需单独docs收尾写实锚点，报告源码锚点与HEAD关系。

不清空手机日志、不清数据、不卸载、不擅自签名/安装/启动测试、不发布。用户之后装机复验；如手机保持连接且用户提供复验机会，按其授权只读采集新日志。未做真机必须写“最终DEX检查通过，启动修复待用户装机验证”，不能写“实测不再闪退”。

用户真机复验顺序：先应用正常启动/主页/设置；再普通详情页与全屏显示隐藏控件；然后暂停/旋转/seek/换视频/拖字幕，确认避让仍工作且无新闪退。可读日志保留新的时间段，不把旧崩溃当新复验失败，也不能只因短日志没异常就判定已正常启动。

最终汇报：修复差异、根因与漏检原因、旧坏包被拒绝证据、新交付PC目标/分支扫描、组合与回归、三件套哈希、提交/锚点/工作区/两份状态哈希、真机未覆盖边界。完成即停，暂不进入语言策略阶段。
