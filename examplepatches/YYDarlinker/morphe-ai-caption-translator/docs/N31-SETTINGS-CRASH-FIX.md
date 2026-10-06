# N31 设置页重启修复：寄存器类型与语言回调时序

日期：2026-10-03（Asia/Shanghai）。执行 HEAD：`e17fa5537e6f91c9e68b9b647b55bb22765e03ac`。原 N31／双补丁包与历史证据保留，本轮仅修复设置注入接缝；最终交付保存在本地。

## 已确认原因

连接手机读取 crash buffer 与已安装 APK：包名 app.morphe.android.youtube，版本21.16.256，用户安装时间2026-10-03 12:56:49。设备 MEP-AN00 / Android17（SDK37）/ arm64-v8a。实际安装包 SHA256：`C32217BBCEA1AACB936D63F45573A3975B8F75BAC5CEABDCD0998D8ECE5668F9`。

进入 Morphe 时，Android 在加载 AbstractPreferenceFragment 及其子类时抛出 VerifyError。N31 把重绑调用注入 initialize() 和 lambda$new$4() 的返回路径，并一直将 p0 当作 PreferenceFragment。官方R8代码已复用该物理寄存器v2：initialize 中变成 PreferenceScreen；lambda callback 的早退分支中变成 ExternalSyntheticLambda9，正常与异常分支还会变成boolean/Throwable。手机日志分别指出 lambda [0xC] 和 initialize [0x3E] 的参数类型不符，整个设置类被拒绝，应用呈现重启。

这是本项目N31注入造成的错误。此前hook计数／分支检查与Robolectric控件检查没有做官方类ART真实类型验证，不能据此声称设备设置页已通过。手机日志、准确安装包、本地原官方DEX寄存器轨迹和 ART 旧包负例已保留于 .verification/n31-settings-crash。

## 最终修复

- initialize：在 getPreferenceScreen() 的紧邻 move-result-object 后读取已证实为 PreferenceScreen 的结果寄存器，调用 rebind(PreferenceGroup)。不再在返回路径将被覆盖的p0当作Fragment。
- onCreateView／onPreferenceTreeClick：只在入口注入，p0仍为各自实际Fragment receiver；没有新增寄存器或写入宿主寄存器。
- lambda$new$4 为 PRIVATE | SYNTHETIC（flags4098），不是static。最终hook紧随 updatePreference(Preference, Setting, boolean, boolean)，位于 updateUIAvailability() 之前，使用原调用中仍存活的Fragment receiver（FiveRegisterInstruction.registerC）。这时官方已将新语言同步到 MORPHE_LANGUAGE，避免入口hook读到旧语言，也避免末尾寄存器复用。安装前验证精确描述符、相邻调用和两次同一receiver。
- onSettingsView 继续使用返回View的结果寄存器，紧邻 return-object。
- 新 SettingsHookRegisterAudit 检查真实寄存器身份、相邻 typed move-result、hook位置与语言写入顺序；集成最终CompositionDexAudit。相同检查拒绝实际坏安装包，也拒绝虽可ART加载但在语言写入前重绑的中间候选。

运行时Java、用户配置／语言集合／翻译请求／缓存／分页／播放器／234×14资源与双补丁metadata逐字不变。MPE与上一双补丁MPE完全一致；MPP仍只有AI caption translator、Remember caption selection两个public root。

## 验证及边界

| 验证 | 实际结果与范围 |
|---|---|
| 手机原包 | SDK37／arm64，读取真实崩溃日志；Class.forName(name,true,loader)实际复现VerifyError，退出1 |
| 最终ART | 本地只读模拟器Android15／SDK35／x86_64；相同旧包退出1，最新最终包退出0；4设置类 ART_SETTINGS_VERIFICATION_PASS |
| callback时序 | 最终DEX为 updatePreference → onSettingsLoaded(v2) → updateUIAvailability；原receiver活跃，language_after_write=1 |
| 负例 | 原坏包 SETTINGS_RECEIVER_REUSED；中间入口重绑包 SETTINGS_LANGUAGE_REBIND_BEFORE_WRITE；两者明确拒绝 |
| 控件Java专项 | N31RuntimeUiTest＋BeforeLocaleProbe 10/10，本轮实际复跑，failure/error/skipped0 |
| 原全量基线 | 原682/682结果沿用，不冒称本轮全量重跑；所有原Java/source/test输入SHA与该全量逐字相同：`d17a2b182966cb732425b759ee6864c69bcbefba9b8de296daf347413969f7a0` |
| 全部DEX | 11DEX／58,261类／322,981方法／626,701分支；invalid/problem/binding0；完整UI/native hooks审计通过 |
| 工程包 | 原版21.16.256＋官方1.45.0＋最终MPP实际合成；CRC／DEX头checksum／内嵌MPE相等／verify_bundle／N8Verify／aapt minSdk28通过 |
| 冻结 | 原ACCEPTANCE、scoreboard、资源和metadata不变；6份开工捕获历史输入／产物SHA字节不变 |

仅Class.forName(name,false,loader)加getDeclaredMethods()的初始探针没有触发ART验证而出现假通过；已留存为metadata-only对照，并将正式探针改为true初始化。中间候选删lambda hook或入口绑定的产物均保留为provisional，不作为交付。之前手机ART验证通过的是入口hook候选SHA F3052AAA…；最终时序修正版为下表SHA1982448D…，二者不可混用。

最终包没有再传给实体手机、未安装或点击真实设置页。用户要求“任何东西自己传手机”之后，只运行本地模拟器验证；AVD以read-only/no-window/no-snapshot-save/load启动，完成后关机，config SHA不变。用户仍需在自己的Morphe中用最终MPP重新合成并签名安装，再实际打开设置短复验。不能将本地SDK35 ART结果宣称为最终SDK37实体手机UI验收。

## 本地交付

| 文件 | 字节 | SHA256 |
|---|---:|---|
| patches-1.3.5-本地测试包-n31-settings-crash-fixed.mpp | 1,167,633 | `5AC2509DB8C1A32C2AF0CC5A6579039AE58ED27A1D0CD23690011A30CEB8B6ED` |
| extension-1.3.5-本地测试包-n31-settings-crash-fixed.mpe | 2,803,164 | `315026FAE1C851BDAB502BC07E2699A86F6D80D302FB0F1A24D25D5357CABA8F` |
| YouTube-21.16.256-本地测试包-n31-settings-crash-fixed-unsigned.apk | 198,125,055 | `1982448D2FF7D29CC1A7882D1036C5972021D6546221F28D46A30D484B2D9651` |

位置：build/local-test 与 build/n31-settings-crash-fixed-composition-final。手机合成时使用上表最新 MPP；APK为未签名工程产物，签名保持用户自己Morphe的已有身份以覆盖安装。不要再用原n31-two-patches包或旧中间候选。

用户本地-only指令前，曾将前一入口候选MPP复制到手机Download（SHA01792C50…），以及将ART探针／候选放到/data/local/tmp；已坦诚告知，文件没有自动安装、没有删除或清用户数据。最终新包SHA5AC2509D…仅本地交付，旧手机副本不是最终版。后续传输完全由用户自行完成。

本轮没有签名、安装、卸载、清数据、推送Git或发布；供应商API／下载／新增依赖0。下一步仅用户重新合成覆盖安装后：设置→Morphe可打开，再在同一语言设置里中文→日语→英语检查AI子屏，确认不重启及文案刷新。完成代码交付后停止。

证据：.verification/n31-settings-crash/summary.json、register-and-timing-negative-final.log、composition-dex-audit-timing-final.log、art-local-emulator-final.json、art-local-emulator-before.log/after.log、device-crash-before.txt、integrity-timing-final.json。源码核心commit／anchor以身份补记登记。

身份补记：核心提交 `1bc94aed459300b79bd5ee93dca03d2db99d593c`；本地锚点 `anchor/n31-settings-crash-1bc94ae`。本次docs-only身份补记不改变已验证产物和产品源码。
