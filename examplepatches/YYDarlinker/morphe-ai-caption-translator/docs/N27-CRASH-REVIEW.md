# N27 启动闪退：规划者只读排查结论

日期：2026-10-01。用户确认：安装N27后，点击应用图标立即闪退；随后连接手机，授权读取崩溃日志。规划者只读取日志、包元数据和已有交付DEX，没有修改产品源码、运行产品测试/构建、安装/卸载/清数据、签名或发布。

## 已证实的根因

手机crash buffer中至少7个`app.morphe.android.youtube`进程记录相同异常，时间为18:47:59至18:52:03。关键原文：

```text
java.lang.VerifyError: Verifier rejected class bfec:
void bfec.<init>(bfed): [0x10] target dex pc 0xd is not at instruction start.
```

已安装包版本21.16.256，versionCode1561068412，minSdk28、targetSdk36。手机读取为Android17/API37；本缺陷本身是无效DEX分支，不应解读成只针对这个系统版本的问题。

对N27本地最终交付APK独立读取了指令大小、真实DEX code-unit地址和有符号分支偏移，得到完全相同地址：

| PC（16位code unit） | 宽度 | 指令/语义 |
|---|---:|---|
| 0x0b | 3 | 官方`setPlayerControlsVisibility(Enum)`调用，覆盖0x0b..0x0d |
| 0x0e | 2 | 本卡重载holder：`iget-object v1, v0, Lbfec;->c:Lbfed;` |
| 0x10 | 2 | 本卡`if-eqz v1`，relative=-3，target=0x0d |
| 0x12 | 2 | 读int状态 |
| 0x14 | 3 | 调enum工厂 |
| 0x17 | 1 | `move-result-object v1` |
| 0x18 | 3 | 本卡`onPlayerControlsVisibility(Enum)`调用 |
| 0x1b | 1 | 正确的构造器`return-void`，本卡空holder分支应到这里 |

0x0d在官方invoke的操作数字内，不是指令起点。ART验证类时即拒绝整个`bfec`，所以无需进入视频就会闪退，即便实际holder从来非空也会失败。手机日志与本地交付APK相互印证；无需推测API、字体、几何、签名或模型并发。

Android官方约束A6要求`goto`/`if-*`目标是同一方法中的opcode：[AOSP DEX约束](https://source.android.com/docs/core/runtime/constraints)。日志读取采用只读`adb logcat -b crash -d -v threadtime`，未清空原日志：[Android Logcat文档](https://developer.android.com/tools/logcat)。

## 注入错误与审计漏检

`patches/src/main/kotlin/app/yydarlinker/patches/deepseekcaptions/CaptionControlsAvoidancePatch.kt`使用普通`addInstructions`插入含`if-eqz`及片段末尾裸标签的smali。最终序列化结果证明该目标没有正确重定位到真实return。修复应使用现有patcher的`addInstructionsWithLabels`，通过`ExternalLabel`绑定插入前捕获的真实返回指令，而不是用数值偏移修补、依赖裸片段末尾标签或删除空值保护。这个API在本地patcher1.14.1及仓库`CaptionQuickTogglePatch.kt`中已有可核对的使用证据。

N27旧`N27ControlsHookCheck.java`读取原始APK、独立assemble片段，再对Java `ArrayList`拼接后的顺序做抽象寄存器解释。它没有验证真实patcher注入并序列化后的分支地址。旧最终构造器dump也只列指令序号，没有PC/相对偏移，因此显示两个hook存在却没发现非法跳转。Java/Robolectric测试覆盖渲染层，不执行此宿主构造器DEX；ZIP/DEX头校验与84组合结构检查亦不能等同ART验证。历史PASS保留为“当时有限检查结果”，当前N27启动失败、不能验收。

## 修复方向与边界

优先只修标签注入和最终DEX审计，保留N27控件避让功能及原参数。不得给宿主调用或协调器加吞异常以掩盖此错误：类验证发生在方法体执行前。不得回退翻译/字号/调度，也不提前做语言菜单或三项延期本地化。当前修复卡为`docs/N27R-CRASH-REPAIR-TASK.md`。

修复后的静态验证必须直接重读最终交付APK；旧N27坏包必须被新增审计拒绝，新包必须通过。静态通过仍不宣称已完成真机启动验收，由用户装机后复验；执行者不得仅凭464/464与84/84再次宣布闪退已彻底解决。

## 本地证据与当前基线

- E盘HEAD28229e0，源码62c4916，锚点`anchor/n27-62c4916`；起始工作区干净，N26源码509d50a。
- N27 APK：`build/n27-composition-final/YouTube-21.16.256-本地测试包-n27-unsigned.apk`，196943040字节，SHA256 `BF4C53EB8D8F8666A0DDBB190E474F34BD5D6980BE7E9302F9ADE456A4776103`。
- 证据目录：`C:\Users\14776\.codex\visualizations\2026\10\01\01a0f56a-7d8c-75e0-8def-3fa2f0b542ef\n27-crash-review`。
- `n27-crash-androidruntime.txt`：仅此应用相关PID的AndroidRuntime日志；其他应用原始日志不放任务材料。
- `n27-final-constructor-pc.txt`：直接来自交付APK的PC/指令宽度/relative/target。
- `patcher-instruction-extensions-javap.txt`：本地patcher API反读。
- `DexProbe.java`/`DexProbe.class`：基于本地dexlib2的只读分析工具，增加PC与分支偏移输出；不是产品源码。

用户已取消换对话；本聊天继续规划/研究/审阅，DeepSeek只执行。上下文压缩后以最新`docs/PROJECT-STATE.md`及本记录恢复，而不是使用旧交接包的在途快照。
