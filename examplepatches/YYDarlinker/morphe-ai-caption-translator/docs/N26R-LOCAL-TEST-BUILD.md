# N26r 交付记录：完整回退 N26，搁置播放器避让

日期：2026-10-01（Asia/Shanghai）。用户在N27r真机试用后要求回到N26交付后阶段，随后明确授权本聊天直接执行本次回退。本次已执行源码回退、实际测试、离线构建、组合、最终产物验证和本地提交；不签名、安装、清数据、推送或发布。VISIONOS_1_02用户确认N26也存在、属于官方patch问题且已解决，此项关闭，本期没有继续调查或修改官方设置。

## 提交与恢复边界

开工HEAD `cd5d38f`（N27r的docs收尾），恢复基线 `7f9c639`（N26交付后收尾），N26源码锚点 `anchor/n26-509d50a`→`509d50a`。核对 `509d50a..7f9c639` 只有docs变化。

使用Git从明确基线恢复两个源码模块及patch构建脚本，恢复6个原有文件、删除7个N27/N27r新增文件；源码、资源、依赖、构建脚本、测试的全部非docs跟踪树与7f9c639 **零差异**。N27协调器、生命周期/渲染/拖动通知、字节码注入及相关测试/新增Gradle审计入口全部撤回。官方播放器控件hook仍保留，未删除或替换任何官方功能；N26入口位置、无图标、全屏预览说明、N24调度与中文质量基线保持。

不改HEAD指针、不重写/amend原提交、不删除旧锚点与历史产物。原管理档案、真机反馈/截图/崩溃证据及历史任务卡保留。N27r纯审计工具的34个来源文件/已编译class已独立归档于 `.verification/n26-rollback/audit-tool`，附来源4c1d33f及SHA清单。恢复后的产品源码/构建不重新接入这些工具，它们仅独立只读检查交付字节。

本次实现提交与源码锚点：见文末收尾记录。若另有docs写实哈希提交，仅管理文档变化，源码锚点仍指向包含全部回退源码及最终交付记录的实现点。

## 构建与真实验证

工具链沿N26：本地JDK21 `E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1`、Android SDK `C:\Users\14776\AppData\Local\Android\Sdk`、Gradle9.6.1，全部 `--offline`。清理前明确核对两个模块build目录位于执行仓库内；清理仅 `patches/build` 与 `extensions/extension/build`，根build历史三件套/组合及.verification均保留。先归档工具再clean，避免旧class混入恢复包。

- 首次clean/构建利用按源码输入匹配的Gradle缓存；随后明确以 `--rerun-tasks --no-build-cache` 实际重跑Java测试，28个相关任务全部executed。结果 **440/440，58套件，0失败/错误/跳过**；N27的24条/1套件随授权完整撤回，不保留为“464更好”。
- Python **27/27**；localization **220 keys × 14 locales**。仅资源/键覆盖，不宣称真实十四语种本地化已完成。
- 冻结计分板 **4通过/4既有失败/4未验证**，pending_translation/event_review/overflow三类不可见时长全0；ACCEPTANCE与frozen-baseline Git无差异。Windows外部PowerShell脚本执行策略不允许直接运行run.ps1，本期改为顺序调用同一run.py/n9.py/n10.py，未更改系统执行策略或判据。
- 从**本期实际交付MPP**组合YouTube21.16.256＋官方1.44.0＋Patcher1.14.1；根选择与N26一致（AI caption translator），**84/84 PASS**。structure.txt/selection.txt与历史N26逐字节相同，本卡控件回调不再存在。
- N26原常规DEX契约 **DEX_AUDIT_PASS classes=58028**。
- 归档的只读最终分支审计对交付MPP（2单元）、MPE（1单元）与APK（11个实际根DEX）全部通过。APK扫描 **321938方法、624507分支边**，invalid_branches0/dex_problems0/binding_failures0； `--require-ai false`表示无N27避让观察者，正常AI字幕仍启用。
- 宿主 `Lbfec;-><init>(Lbfed;)V` 已恢复7条指令：原构造＋官方hook，PC0x0e return-void；没有本卡reload/if-eqz/enum callback。最终所有DEX无CaptionControlsAvoidance及其合成/嵌套类或避让事件。
- verify_bundle、N8Verify、ZIP CRC/唯一条目、根/扩展DEX头长度及校验和、14份实际交付locale与源一致、最终APK三套设置XML与预览说明资源池检查通过。
- aapt确认 `app.morphe.android.youtube` 21.16.256 / minSdk28 / targetSdk36；apksigner `DOES NOT VERIFY / Missing META-INF/MANIFEST.MF`，确认未签名；中文路径元数据读取使用本期ASCII硬链接，不引用任何旧版本别名。
- **37/37去重历史产物路径SHA与字节不变**，覆盖旧N27r保护清单的全部43条记录（含重复路径）并新增保护N27r三件套。历史MPP/MPE/APK未覆盖。

## 与真实 N26 黄金包的字节差异

新MPP全部条目与N26相同，只有 `META-INF/MANIFEST.MF` 的构建清单信息变化；**补丁classes.dex逐字节相同，MPE逐字节相同，全部资源逐字节相同**。

新APK与N26的归档条目集合相同，只有 `classes2.dex` 不同。进一步定位：该DEX仅 `Lapp/morphe/extension/shared/checks/PatchInfo;->PATCH_TIME:J` 的静态编码值变化（4个数据字节），以及DEX checksum/signature（24个头字节）；**无方法指令变化、无其他数据变化、字符串集合相同**。该字段为官方打包时间，新APK压缩后比N26少12字节，不是功能差异。详细文件 `bundle-equality.json`、`apk-equality.json`、`apk-metadata-difference.json`。

## 三产物

| 绝对路径 | 字节 | ΔN26 | SHA-256 |
|---|---:|---:|---|
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n26r.mpp` | 1,103,820 | +0 | `3A2BE84D9B78FF7F86390CE890095B4F9EFD67312DE7BC57809FA7878EC27BF3` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n26r.mpe` | 2,713,536 | +0 | `4C0D21FFC946F660FFF444140E8CE4A241F158028E7742399DAF21AA231F985C` |
| `E:\Projects\morphe-caption-v2\build\n26r-composition-final\YouTube-21.16.256-本地测试包-n26r-unsigned.apk` | 196,935,272 | -12 | `F5A9D242D21FFDFDA5AB9C0849B735A8C38F56CAE50038658B563088F9EBF0D9` |

所有执行日志与机器可读检查在 `build/n26r-records`；独立工具及来源/脚本在 `.verification/n26-rollback`。N26原包、N27/N27r坏包/修复包和截图均保留。

## 状态与覆盖边界

运行源码/资源已恢复N26，N27播放器避让需求搁置，不自动恢复。三项延期（入口功能说明、真实全语种本地化、旧程序性诊断英文）仍开放；语言策略/菜单规划保留，本次结束等待用户指示，不自派后续阶段。

本期没有安装手机、签名、清数据或作真机验收；新APK为未签名本地测试产物，用户按既有签名/安装流程复验。已有API/profile/字幕位置等用户配置不改，用户之前手动拖动保存的坐标不擅自重置。没有远程翻译API、下载或新增依赖。代码与实际交付字节的N26一致性已证实，不把它扩大为所有历史质量问题已解决。

## 提交收尾

实现提交 **1b9e429**（完整回退源码/测试/构建与交付记录），源码锚点 **anchor/n26r-1b9e429** 指向该点。随后仅有写实此哈希及状态的docs收尾提交，不含源码/资源变化；HEAD关系以Git日志为准。工作区提交后干净；未推送、签名、安装或发布。
