# 原初N31回退与双补丁设置导航核查

日期：2026-10-03（Asia/Shanghai）。用户本轮明确授权本规划对话直接回退，再核验双补丁失败原因并给新执行对话任务。附带N31执行对话文本是历史材料，不直接照抄其结论为本轮指令。

## 1. 已执行恢复

- 回退前HEAD：150c91f67f4612a94674aef0ee5c8da48a51ed26；工作区产品干净，只有已知未跟踪patches-1.45.0.mpp。
- 用户指定原包：E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n31.mpp；1,165,680字节，SHA256 AF084C20C32636EBA051B2891BDAFC5419BD54A98DBB28974CD441BE18AF913C，与N31原交付一致。
- 原源码：dc304cbe3ae995e7e0edad2754b160c959cafce3 / anchor/n31-dc304cb；1a3c555为其仅文档后继，非另一套产品。
- 已恢复28条源码/测试/构建工具/metadata/README/发行校验路径至dc304cb；后续添加的settings-crash和two-patches构建/测试工具从当前跟踪树撤回，历史提交及证据仍存在。**全部非docs跟踪树与原N31逐文件一致**，不是只关闭两根开关，也没有混留新hook修复。
- 没有git reset --hard、rebase或amend。回退采用新本地提交，旧HEAD另存backup/n31-later-150c91f；源快照later-head-150c91f.zip、完整diff、路径清单和状态before在.verification/n31-rollback-review。
- 52份已捕获历史MPP/MPE/APK的字节/SHA全不变，包括原N31、双补丁、设置崩溃修复及更早版本。未生成重建的“N31”，未覆盖指定原包。原MPE 2,803,268/SHA 05F60BEDC300BB2AAAE1ED3788EF1FA2F26F4C2066117A1DD275EAC27331BCEF；原APK 198,125,124/SHA 0174A5D8AF707501CF6A42135307B178121A3B4362BE6B16656F79D86EE72075。
- docs保留后续沿革，PROJECT-STATE明确恢复当前状态。新回退提交/锚点在后续身份补记登记。本轮没有安装、签名、清用户数据、传手机、网络翻译、下载、推送或发布。

## 2. 根数变化与设置修复须分开

| 阶段 | 核心提交 | 内容 |
| --- | --- | --- |
| 原N31 | dc304cb | 三根，AI已自带14语言多选/clone，本地化与设置binder |
| 删除冗余根 | 66a2584 | 删除Add Simplified Chinese public root及独立强制zh-Hans标志；保留AI+Remember |
| 设置崩溃修复 | 1bc94ae | 修改官方initialize/language callback绑定位置及寄存器，增加类型审计 |

静态证据排除了“合并时把语言项XML直接改成通用页”这一原因：

1. 三个正式工程APK的res/xml/morphe_prefs.xml经各自真实aapt解码后**全树输出逐字相同**（SHA256 6F71503B97272032F2F274DEDE268A8C891046A4AA3B2AAD4A7F66F2732BC569）。语言项一直是AI子屏下的CaptionLanguagesPreference、key=deepseek_caption_languages、order=1，没有Intent/fragment指向通用页。
2. CaptionLanguagesPreference、CaptionPreferenceBindings、CaptionUiViewBindings、CaptionUiLocale及资源patch在dc304cb/66a2584/1bc94ae间相同。最新工程APK反读onClick只调用showLanguages并return，没有导航general的代码。
3. 66a2584没有改CaptionSettingsBindingPatch；后续1bc94ae才改官方设置入口。不能把后来的所有设置问题一概归于“根数3→2”。

这也说明修复不应给deepseek_caption_languages硬编码重定向、替换官方general页、重写所有ListView listener或按固定行号拦截点击。

## 3. 已证实设置注入错误及独立未复现项

### 已知根因：原N31就存在ART类型缺陷

原N31在initialize和lambda$new$4的所有RETURN_VOID前使用p0作为Fragment。实际R8会在这些分支复用其物理寄存器：initialize返回时v2是PreferenceScreen；lambda分支v2可能是synthetic lambda、boolean或exception。旧实机SDK37 crash及本地SDK35 ART日志明确拒绝Fragment参数类型，见保留的.verification/n31-settings-crash/device-crash-before.txt和art-local-emulator-before.log。

这个缺陷先于删除冗余根，回退原N31也把它按原样恢复。**当前回退是用户指定的源码/产物基线恢复，不是重新证明该原包安全**；不让用户再装旧包作排查或宣称回退后全部设置已正常。

1bc94ae修了已知类型问题，最新APK的getter结果绑定是PreferenceGroup，lifecycle入口receiver与updatePreference后receiver也有类型审计；保存的ART after仅Class.forName几类成功，不等于真实点击导航已验。

### 用户新问题：点语言项却进“通用”页

本轮尚未有该错误点击的执行链/截图/当前安装包身份，也没有操作用户手机来复现。已有测试N31RuntimeUiTest直接调用p.showLanguages验证Dialog，再在Dialog内点多选和按钮；这绕过了“视频页→AI子屏→真实ListView行→原生Preference/官方listener”的路径。静态hook计数、3组合和ART class-load都不能证明这条导航正确。

明确可疑接缝：CaptionSettingsBindingPatch在onPreferenceTreeClick入口重绑整个root；语言回调/initialize重绑位置改变；CaptionPreferenceBindings会触发Preference文本更新/notify，并关联ListView adapter的当前位置与View。需要记录点击时真实adapter/root/key/class、原listener收到的对象，以及重绑前后identity/order，才能区分误点击对象、标签和对象失配、过期adapter或hook时序。本轮不把这些假设写成已复现根因，也不凭方法名就删它们。

**已定位的通用缺陷是设置hook类型/时序和缺少完整点击路径验收；“跳通用页”的具体分支仍需新卡先确定性复现。** 任务必须先复現再改，不能再次只做三根删二根和几条控件断言。

## 4. 后续定案

执行docs/N32-CODEX-TASK.md，以已恢复原N31为唯一基线。先修/验证已知ART类型安全以能进入真实设置链，核实三个历史候选完整点击行为；对导航异常保存before与能解释实际分支的证据，最小处理设置hook/UI绑定时序。之后独立删除冗余根，使MPP实际只含AI和Remember，并在最终两根同一产物上完成真实点击/保存/返回/语言切换/ART/DEX与原业务回归。

旧修复可以作为对照和审计来源，不整提交cherry-pick或沿用旧二根包。本卡最多新增必要UI-only接缝，不能重做翻译/缓存/播放器或加特例。路径无关/视频无关，不用固定row index、视频ID或语言名称判断功能。

N32交付必须独立-n32，原N31原包及历史坏包全部保留；再由用户自行传手机、合成签名安装、短查导航。没有授权自动安装/数据操作。计划与实际事实同步到两份PROJECT-STATE。

## 5. 本轮证据

.verification/n31-rollback-review包含rollback-inputs/rollback-verified、navigation-review/unchanged-ui-files、later-head快照/状态before、root-removal与settings-hook-fix diff、三APK xmltree、最新版fragment/onClick/sort/debounce反读。aapt使用只读ASCII硬链接避免中文路径报错，原APK无变化。没有新产品全量测试；回退证明来自源码树相等与原产物SHA保护，不把旧680/682结果说成重新跑过。

恢复实际提交：`282d155fd08e126a36c4eec8b6ef8be85eff1827`；锚点：`anchor/n31-restored-282d155`。本段为仅docs身份补记，产品/测试/原N31产物无后续修改。


## 6. 后续当前手机只读核验（2026-10-03）

用户进一步确认原N31三补丁/不选简体都进入Morphe自动重启并授权读手机。规划者读取新crash和实际base.apk，SDK37/arm64，FB7B28B4…/199529446字节；AI与Remember为true，simplifiedInstalled=false，14:58:34.080仍报同一lambda[0xC]/initialize[0x3E] VerifyError。方法体与原N31工程dump完全相同，所以此前“原N31已知风险”现升级为当前实机实证，排除是否选择简体。具体资料见N32-DEVICE-CRASH-AND-REQUIREMENTS-REVIEW。

撤回方案的错页仍独立：当前手机无法加载设置，没有现场复现那个after方案，旧XML/onclick排除项保持；新卡明确先修类型后再真实点击。已提取用户在N31对话的删除冗余根、诊断原始数据不改、最终本地-only、加快收尾等补充要求。无手机写入/安装/主动UI操作，无新产品修改或测试复跑。
