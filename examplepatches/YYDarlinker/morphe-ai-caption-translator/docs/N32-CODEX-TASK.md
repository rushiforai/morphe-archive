# N32 Codex执行卡：修复N31设置类型与窗口所有权，重新交付AI＋Remember两根

> **历史卡已失效（2026-10-03用户新定案）**：N31/N32开发均已停止，产品树已恢复N30。本文仅保留失败过程/旧要求审计，不继续施工、不复用实现。当前入口为 docs/N33-CODEX-TASK.md 与 PROJECT-STATE最新§4as；仅N31文字翻译可校对提取。

日期：2026-10-03（Asia/Shanghai）。本卡由新Codex执行对话完整实现、验证、独立建包、本地提交，完成即停。当前源码仍是用户指定的原N31恢复；本卡不整仓回退N30，只以N30正确的窗口所有权为合同重做N31失误的设置UI接缝，保留N31本地化成果。

本卡整体覆盖先前N32中“错页尚无任何实际click证据、优先怀疑Adapter误路由”的排序：当前手机已取得真实语言行click→Dialog.show→BadToken before，**先修两项确定根因**，再用完整导航after验证“通用页”观察是否消失；不等一个无证据的General人工错误才能施工，也不把未采集的视觉跳转写成已证明路由根因。

## 1. 活动基线、输入与手机边界

- 唯一仓库E:\Projects\morphe-caption-v2；原产品dc304cbe3ae995e7e0edad2754b160c959cafce3 / anchor/n31-dc304cb。已恢复提交282d155fd08e126a36c4eec8b6ef8be85eff1827 / anchor/n31-restored-282d155，当前为docs-only后继（ad492b3、c834bdb或之后）。除docs外跟踪源码/测试/metadata/build与dc304cb相等即允许开工，记真实HEAD，不为docs-only变化重复询问。
- 指定原MPP AF084C20C32636EBA051B2891BDAFC5419BD54A98DBB28974CD441BE18AF913C、1,165,680字节及原-n31三件套保持；旧66a/1bc包、backup/n31-later-150c91f、相关失败证明与原诊断不覆盖。不cherry-pick旧整修复提交冒充新卡验证。
- 先比对两份PROJECT-STATE，无差异跳过覆盖，有差异读内容。读N32-DEVICE-CRASH-AND-REQUIREMENTS-REVIEW的最新§6、N31-ROLLBACK-AND-NAVIGATION-REVIEW、N31原交付与本卡。附带N31对话只取用户要求，不把执行者旧PASS或给手机写文件当新授权。
- 官方1.45.0输入 SHA DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93；已有原版YouTube21.16.256/minSdk28、Patcher1.14.1/JDK21/SDK不变，不下载工具/APK或加依赖，远程翻译API0。
- **用户手机只读**：此前和本轮仅adb读取现有logcat/dumpsys/getprop/pm及pull APK。禁止push任何探针/MPP、app_process主动测试、安装/卸载/启动页面、清数据/清日志、写UI测试文件。最终文件只放本地，由用户自己传手机/合成/签名安装。主动ART/UI仅用已有本地测试宿主或现有read-only模拟器，不能自动把这项权限扩成手机操作。

### 1.1 两套不同实机before，禁止混淆

证据都在.verification/n32-device-review。

| 当前安装阶段 | APK与日志 | 证明 |
| --- | --- | --- |
| 原N31，有AI＋Remember、未选简体根 | 199529446字节/SHA FB7B28B425A3DCE8884EF9BBFEB6EF8D93FC7B782B9E2E24EDC472D9A9116C38；更新14:58:23，crash14:58:34.080 | initialize/lambda返回receiver VerifyError，不能加载设置；methods同原N31 |
| 用户后来安装可加载的撤回版 | 199529446字节/SHA BFF42C488842FE793BCEA5028208D23FE47F831B867480676FAA99AB86E2E111；更新15:24:44，crash15:25:58.048 | methods同1bc94ae typed-hook；真实语言行click进入showLanguages，在Dialog.show:42报BadToken token null |

后者栈是`PreferenceScreen.onItemClick → 官方DebouncedItemClickListener → Preference.performClick → CaptionLanguagesPreference.onClick → showLanguages → Dialog.show`。正确语言handler确实被调用，不是仅存在helper或手工p.showLanguages。这足以证明当前弹窗不显示/应用重启根因；未捕获异常前General page实际创建路径，保持该边界。

## 2. A：两项根因与N30正确合同

1. **原N31 Settings hook类型错误**：initialize/lambda$return前传p0，R8已复用成PreferenceScreen/synthetic lambda/boolean/exception，ART拒绝Fragment形参。旧N31即存在，选择简体root与否不相关。
2. **原N31本地化资源Context错误作窗口owner**：CaptionUiLocale.Snapshot用ContextThemeWrapper(base.createConfigurationContext(config),0)并复制theme；CaptionLanguagesPreference把ui.context直接交AlertDialog.Builder。它有正确locale资源，却绕过Activity的WINDOW_SERVICE/parent window token。复制theme不能修WindowManager，手机实测token=null。
3. N30语言Dialog Builder用原getContext（实际Activity UI owner）；N31为本地化改成资源Context，所以引入UI基础回归。原dc304cb/两根66a/typed-hook1bc的语言类/CaptionUiLocale完全相同：typed-hook修复仅暴露第二个潜伏bug。根数删除没有造成或解决它。
4. 同样错误在CaptionSettingsDialogs.confirm/show的官方CustomDialog和platform fallback、Android9诊断分段复制及其他共享Dialog中，不只语言项。Toast/纯字符串/预览label有不同窗口需求，不能为修Dialog删除全部本地化。

已有本地AOSP主源码核查保存在android-window-context-source-excerpts.txt/source-sha.json：SDK sources/android-37.0的Activity WINDOW_SERVICE、ContextWrapper/ContextImpl configuration、ContextThemeWrapper service委托、Dialog构造取WindowManager。它解释机制，不替代手机after或用户机型版本认定。

## 3. B：先闭合ART类型安全

- 不再遍历所有return盲传p0。实例入口receiver只有在仍存活且正确类型时可传Fragment；getPreferenceScreen紧邻move-result用rebind(PreferenceGroup)，不能强cast Fragment；所有分支/异常路径正确。
- 语言刷新放在MORPHE_LANGUAGE实际写入之后，取该阶段真实存活receiver（FiveRegister第一个实际寄存器是registerC，不是根据名字猜）。完整descriptor/访问位/唯一位置验证，不只按lambda名字任选。
- 不用吞VerifyError/任意check-cast/手工相对PC逃过验证；必要分支使用ExternalLabel绑定真实BuilderInstruction，生成DEX序列化后检验所有调用类型与标签。
- 把旧settings-crash审计作为对照，提取必要类型/时序检查审阅后集成新的最终auditComposition；旧FB7原包/错误receiver/写新语言前重绑负例非0拒绝。
- 主动ART class-load实际4设置类通过后还要执行初始化/语言变更/点击，不把Class.forName成功当导航或挂窗成功。

## 4. C：重做通用Activity-safe窗口层，保留独立locale文本层

这是本卡已明确授权的通用修复范围，不需再为UI owner helper或这些Dialog接缝开新卡。

### C1 owner解析与资源分层

1. 文本读取、locale/方向/字体配置继续CaptionUiLocale当前Morphe覆盖，不退回中文Activity资源；**资源Context不能直接作为普通Dialog owner**。
2. 正常Dialog从当前实际设置Activity或保留其WINDOW_SERVICE的Activity-base主题wrapper创建。若要Dialog内部Android系统文字也本地化，使用以live Activity为base的ContextThemeWrapper，先applyOverrideConfiguration再访问resources/theme，或等价只覆盖资源/Inflater且WINDOW_SERVICE仍委托原owner的wrapper。不得继续把createConfigurationContext生成的ContextImpl当base，也不全局改系统/官方Resources。
3. Preference.getContext可能已是资源wrapper/非Activity，不能简单instanceof不成功就取全局播放器Activity。先unwrap有效ContextWrapper链；必要在真实settings Fragment/PreferenceScreen/View加载时绑定当前settings Activity owner（弱引用、按树/窗口身份，生命周期失效），无关播放器/其他窗口不借用。不得把首个全局Activity作为所有对话框owner。
4. 校验owner未finishing/destroyed、处于正确UI/window归属，使用main Looper。尚无有效owner/token不得创建普通窗口；记录一次英文受控原因并安全返回/等待下次用户操作，不改selected_codes或用户配置，不自动跳General，不派网络请求。owner变化/销毁释放旧Dialog和listener，不缓存带旧window token的context。
5. 单个owner/同一个操作合并重复打开，关闭后可重新打开。不能仅调用setOwnerActivity、setType overlay/alert权限、手工assign token、catch BadToken吞掉或连续retry挂窗当根治。可以对真正生命周期竞争做受控清理，但有效owner正常点击必须实际显示Dialog。

### C2 全部窗口调用点审计

生成docs/N32-WINDOW-OWNERSHIP-INVENTORY.md：构造点、资源locale来源、window owner来源、wrapper/system service、显示/取消/销毁/重开、token before/after测试证据、是否需窗口。

至少覆盖：

- CaptionLanguagesPreference 14多选dialog与列表adapter；每行纯UI locale语言名/勾选，固定summary及AI说明不变；
- CaptionSettingsDialogs.confirm/show：Morphe官方CustomDialog与平台fallback都使用有效owner，不能只修fallback；
- API profile列表/新增/改名/更多/删除/清Key，模型选择/手动输入/错误Dialog，诊断清空确认、Android9分段复制；
- 其他AlertDialog.Builder/new Dialog/PopupWindow/系统输入菜单及异步UI结果回调。PopupWindow按anchor归属验证，不能把它与Activity Dialog/Toast混为同一token合同；Toast与纯资源Context不作不必要架构变更。

owner已结束的后台API/导出回调不挂旧窗口、不覆盖新页、不写回待撤销选择。保存/取消仍原集合规则，N31默认展示/业务偏好与custom数据原样。

## 5. D：实际列表点击和“通用”页面/返回验收

- 从正式host设置XML及官方settings Fragment路径创建页面，视频页→AI子屏→**真实ListView行点击**→语言Dialog.show实际可见。通过adapter原listener/官方debouncer/Preference.performClick，不能p.showLanguages或mock掉WindowManager作为主验收。
- before使用当前BFF42 APK/BadToken栈和本地N31最小typed安全候选，证明原资源Context作为owner挂窗失败；after同操作真实显示14项窗口，不抛异常，勾选/保存/取消/返回仍AI子屏，退出不重新创建YouTube首页。
- 记录clicked preference key/class、row文字、list/root/fragment/dialog类型、delegate和窗口owner/token、activity finish与dialog_open/close顺序。现有手机栈已证明handler正确，优先修窗口层；不再仅凭“用户看到通用”就假定root清理或固定行号route坏。
- General视觉来源如果仍复现，记录真实Activity/Preference root/标题/返回链再最小定位。若根治BadToken后完整after不再出现General或重启，报告“已修确定窗口根因且所测完整链正常，原视觉General来源未独立采到”，不要虚称已证明其一切路由细节。不得硬编码General标题/行index/拦截所有官方导航，不能把缺一个独立General-before当理由忽略已确定的BadToken。
- 仍审阅N31全root重绑在onPreferenceTreeClick入口的必要性：点击中不能换root/adapter/listener/order/Intent；类型安全初始化、写新语言后、子屏创建和owned onBind负责文案刷新。可以删除/收紧click入口whole-tree rebind以避免notify重入，须保持语言变化和所有owned UI不回中文；只有前后证据支持才说它是路由根因。
- official General行自身应按原生进入和正常返回；不能因语言修复把官方页面导航全阻断。首次/滚动复用/rapid点击/语言zh→ja→en→fr→ar/有无视频/AI off-on覆盖，owner正常一次click只开一个Dialog。

## 6. E：两个public补丁重新交付

原N31 AI已经含通用14语言metadata/clone/selected_codes，本卡只删除冗余public Add Simplified Chinese，不再合并一套语言UI或把普通Preference变成Screen。

- 公开集合精确AI caption translator＋Remember caption selection；删CaptionFeatures.simplified/standalone强制zh-Hans/simplifiedInstalled，简体中文随14候选/用户selected_codes加入；默认空集合、旧用户集合不清不迁移。
- installed与enabled分开：AI installed但运行OFF仍新增已选语言/API0；Remember-only独立原生记忆、没有语言强制注入/API0；AI-only无多余记忆副作用。
- 正式MPP加载元数据只有2根，AI-only/Remember-only/AI+Remember三非空组合3/3；同process多次patching不泄漏旧feature状态。生成patches-list/README/metadata发行校验一致，旧published URL/日期/assets不变。
- 保存旧Standalone断言before，定点改两根归属更强合同；错误第三根/漏简中/重复zh-Hans/集合清空负例拒绝。不把旧7/7当当前两根验收。

## 7. 补充要求、冻结边界与验证

用户N31对话明确：最后两根、14语言AI子屏内、纯语言名无状态、正确功能说明、保持系统语言只切Morphe语言、诊断技术英文但source/prompt/provider数据原文、最终仅本地文件。其“加速”是收敛范围，不是删关键测试。

冻结翻译源/目标选择权、650ms拆块/Protocol硬网、cache-only启动/连接retry、prompt/default business与custom分层、缓存scope、播放器合并render/原native draw、R1 lock/CAS/Permit/退休barrier、中文18golden、非中文n29-v3页合同、用户字号/位置/颜色和selected_codes/API profile/Keystore。N27/VISIONOS不处理，不引入视频/句子/token/时间特判。

允许CaptionSettingsBindingPatch及必要最终audit、CaptionUiLocale/新UI window-owner helper、CaptionSettingsDialogs、CaptionLanguagesPreference/诊断分页等真实窗口调用点、owned Preference binder的非侵入UI刷新/生命周期、两根移除与metadata/tests/docs；UI-only边界已定，无须为碰这些类机械暂停。不得全仓回退N30或取消本地化以省修复。

必要验证：

1. 已有本地真实Android环境WMS/ART，保证原缺token候选失败、最终有效Activity/window token显示成功。Robolectric的AlertDialog shadow可能允许资源Context挂窗，不能只沿旧p.showLanguages绿测；类型验证和窗口运行分别给报告。
2. 真实settings tree点击/保存取消/返回和所有共享窗口矩阵；14语言×Activity中文的覆盖保持，DEFAULT/显式Morphe/主题/320及420dp/1.3/RTL；无合法owner/finishing/destroyed/旋转/旧settings Activity关闭的负例受控不崩，背景owner失效不改数据。有效窗口after不存在新General路由、异常或重启。
3. 原Java680+必要新增/定点合同改后全量、原68/main/K12/中文18golden/14控件/default请求/用户字节不变；原调度400轮按既有验证完成，不为旧失败添sleep或放宽时限。Python27、metadata真实分母、234×14、冻结4通过4既有失败4未验证/3 invisible0、ACCEPTANCE/frozen零diff。
4. 正式MPP自身+1.45+原版21.16.256的3组合，全部根DEX/指令边界/数据流寄存器类型/语言写入后时序/访问位/API/必要hooks、ART设置类和实际UI挂窗、resources/CRC/aapt/min28/verify_bundle/N8Verify、内嵌MPE=独立MPE。数据流错误、token错误、未知签名/缺hook、错root或重复窗口由同一审计/实际UI验证拒绝；负例不能成为production特判。
5. before原log和候选不覆盖。各模块专项后一次最终全量与正式包，不能不断重建大APK掩盖未测试点击。历史输入/产物SHA保护，不回写手机或要求用户重装before以证bug。

## 8. 独立交付和边界

后缀统一-n32：build/local-test/patches-1.3.5-本地测试包-n32.mpp、extension-1.3.5-本地测试包-n32.mpe；build/n32-composition-final/YouTube-21.16.256-本地测试包-n32-unsigned.apk。原31/两根/settings-crash-fixed所有历史保留。

报告docs/N32-LOCAL-TEST-BUILD.md应逐项说明两种before APK/日志身份、N30与原N31差异、ART receiver根因与资源Context/token根因、owner全调用inventory、真实列表/窗口/General返回链结果、2根3组合、所有测试/完整SHA/字节及物理手机after未覆盖。不能把本地SDK35 ART成功冒作SDK37手机点击成功，不能捏造原General视觉来源。

本地核心commit/anchor/n32-真实短哈希，两份状态同步，docs-only身份后继允许。未签名/未传手机/未安装/未清数据/未Git推送/未发布，零远程API/下载/新依赖。完成即停；用户自行传最终MPP、合成签名覆盖安装，再短验打开Morphe、AI语言14选保存取消/返回、几个共享Dialog、中日英变更及官方General返回，不让用户回装旧坏包。
