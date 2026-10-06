# N28C-R2 Codex执行卡：官方1.45.0兼容迁移与YouTube版本声明

> **历史卡，已被2026-10-02的N29-CODEX-TASK.md整体覆盖，请勿再单独执行。** 用户已提供实际1.45安装APK与真机诊断；新卡修复部分注入/缺draw、启动邻块供给和非中文语义翻页。旧B的Always show shim不再无条件预设，按N29的受控回归定界。此处原文保留仅供追溯。

日期：2026-10-02。Codex完整执行、验证、独立建包、本地提交，完成即停。先完成此卡，再由用户做一次有限手机复验；不先装旧B/C，不启动第四期，不生成DeepSeek卡。

## 1. 基线与开工规则

- 唯一施工仓库E:\Projects\morphe-caption-v2。C盘worktree为旧状态，不能在那里实施。
- 产品基线9a7bdf35351b9a052233bac8b9004241548eb1eb / anchor/n28c-r1-9a7bdf3；参考HEAD f7c0c462dcd31f57f1336678007793570cbd4818。实际HEAD到锚点只有docs差异即允许开工，记录实际值；后续docs-only提交不构成停止原因。
- 本轮规划docs/两份PROJECT-STATE的管理更新允许保留随卡提交。用户输入patches-1.45.0.mpp是已授权外部构建输入，未跟踪不是未知产品改动；不删、不改，不默认git add该大文件。发现真正产品差异/并行施工才核对。
- 先比对两份PROJECT-STATE，无差异跳过覆盖；有差异读内容后处理。读N28C-R1交付、本轮REVIEW-AND-OFFICIAL-145及本卡。
- 官方输入必须是11,039,984字节/SHA256 DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93。不拿1.44.0组合结果冒充1.45.0。
- 宿主仍使用现有原版YouTube21.16.256，minSdk28；核对原APK身份/字节/SHA并列入新输入清单。继续已有Patcher1.14.1/JDK21/SDK，已验证新官方元数据可加载；没有理由先升级依赖或下载。

## 2. A：菜单路径CharSequence桥接，保持原行为

确认真实1.45.0扩展：PlayerFlyoutMenuComponentsFilter.isFiltered第4个显式参数由String变为CharSequence，其后为byte[]。旧CaptionQuickTogglePatch.kt在params[bytes-1]严格要求String，必不满足。

实现固定范围：

1. 对真实方法参数列表做唯一性与结构校验，接受明确的String和CharSequence两种形态；不按方法名随便取first，不删除所有校验。除此之外/匹配0或多项继续具名拒绝。
2. 在CaptionQuickToggle运行时提供类型正确的CharSequence入口或等价桥接，必要时保留String旧入口委托。path==null仍无信号，非String CharSequence按其完整toString读取；不cast为String，不把null变成字面量"null"。
3. 注入调用的descriptor/实例p寄存器编号必须与实际形态一致。保留原prefix/closed_caption/closed_captions、Shorts/1500ms/当前video约束，不更改菜单检测范围、AI开关、点击处理或菜单位置。
4. 不改写官方输入MPP文件，不复制官方扩展类，不把默认新菜单项裁掉来迁就旧divider定位。真实addFlyoutElements按结构定位一次hook，共享初始化与onMenu/observeMenuPath不能重复。
5. 实际patcher注入并序列化重读验证String/CharSequence两条签名、StringBuilder或Spannable等非String输入、null、错误前缀及错误签名拒绝。旧形态用已有1.44.0输入做针对性回归即可，不把它作为新交付基线，不再给用户旧包。

## 3. B：AI模式手动CC兼容，原生模式保持1.45.0

新官方AutoCaptionsPatch.disableAutoCaptions(Z)Z先判BOTH_ENABLED并返回false；captionsButtonStatus的150ms手动CC guard在其后。Settings默认BOTH_ENABLED。现有AI体验要求用户在播放器关闭字幕后不会被自动重新启用，因此必须处理该默认行为变化。

采用最小兼容接缝，目标语义固定：

| AI已安装且用户AI开关 | 官方guard状态 | 返回/行为 |
| --- | --- | --- |
| 开启 | 已结束，captionsButtonStatus=true | 返回传入original，保留1.44.0已有手动CC语义 |
| 开启 | 初始窗口，captionsButtonStatus=false | 完整运行原1.45.0逻辑，视频初始自动字幕策略不变 |
| 关闭或未安装 | 任意 | 完整运行原1.45.0逻辑 |

只在AI根安装时对实际官方方法加小型guard/桥接；桥接按已安装标志+已初始化上下文+用户持久AI开关判断，不以字幕暂时可见/READY/API请求是否在途为条件。上下文尚未初始化默认不干预。

官方AtomicBoolean在其自己的类内读取，已验证的方法/字段类型是约束；分支落点绑定插入前原首指令等真实BuilderInstruction，采用addInstructionsWithLabels/ExternalLabel，不裸放尾标签、不写死PC/相对偏移、不混合boolean/reference寄存器。

保持原150ms生命周期，不新增计时器/播放操作/全局窗口扫描；不改官方AUTO_CAPTIONS_STYLE偏好、默认值或用户存储，不重做原生选择派发与CC触摸，也不恢复N27避让。不得修改通用1.45.0的原生Always show行为来让AI测试变绿。

回归至少包括：上表每行、original=true/false；BOTH_ENABLED及其余已有enum策略；AI关闭/未安装/上下文未就绪；同视频手动关闭后不启动新AI翻译/旧render不复活、再打开能恢复；换视频初始guard与用户AI模式不串；只选Remember/Simplified且没有AI时不安装这个官方shim。检查真实序列化方法的分支/寄存器/绑定，不能只测一个手工拼接的字符串片段。

## 4. C：官方基线与发布兼容声明

1. 新交付入口默认官方1.45.0，显式记录输入path/version/SHA；添加新的R2工具或必要共享入口，不批量改写旧Nxx脚本/交付记录中的1.44.0，以免历史不能复现。
2. 继续21.16.256，不换成21.39.522等实验宿主，不下载其他APK。当前卡真实验证的YouTube target只有21.16.256；Constants.kt共享Compatibility更新为该精确版本/minSdk28，三个根patch使用同一来源，签名限制保留。
3. 从当前正式源码构建的MPP运行既有generatePatchesList入口，更新patches-list.json；不得手改JSON让声明先行。核对生成文件、实际交付MPP加载的Compatibility、README中的tested/official基线三者一致。
4. 不宣称全官方目标都适配。21.13.164/20.31.42/20.21.37和四个experimental目前没有本项目的真实组合/指纹证据，不追加通配兼容或任意version=null。
5. 本项目暂为v1.3.5本地测试命名；官方1.45.0不是本项目产品版本。不要因此把产品版本改成1.45.0，也不要修改已发布patches-bundle.json中的历史URL/日期/资产或上传覆盖旧v1.3.5。新正式发版另按语义版本和最新源码完成发布卡。
6. 当前validate/release里有1.3.5 recovered Smali路径，本卡构建/验证必须实际当前Java/Kotlin源码。记录后续发布必须核对CI走最新源码、兼容元数据与上传资产一致的待办；不要用recovered重建代替这张卡。此卡不顺带重写整套发布流程。

## 5. D：设置与官方默认集合真实组合

从1.45.0及交付MPP本身组合，使用实际输入APK，无源码output替代MPP；仍选AI root加匹配宿主的官方default集合及依赖。官方新默认项保留，universal Spoof signature的default=false不主动启用。

官方具名YouTube项已从84增至91，匹配21.16.256的具名default项83→90；此处是元数据枚举，不是组合PASS数量。必须完整报告实际选中/依赖/执行结果；不能规定恰好84，不能裁掉新default来凑84，不能跳过新失败。结构/功能不变量与最终审计继续严格。

核对交付三套设置XML与真实宿主：唯一视频父屏morphe_settings_screen_12_video_sort_by_key；旁白morphe_vot_screen后紧邻morphe_vot_screen__ai_captions；其他兄弟相对顺序保留；实际Collator/排序代码与14语种回放；无旧根入口/无行图标，内部偏好key/SharedPreferences/Keystore不改。不凭源XML排在后面就声称运行时相邻。若新官方确有父键/排序变化，限于此接缝做等价适配并写证据，不改变已定位置。

原Add Simplified Chinese与Remember根patch在本卡仍保留；用既有组合矩阵验证七种非空选择（含AI缺席时零翻译API）。这是兼容回归，不是提前合并第二补丁。第四期才做十四语种菜单多选。

## 6. 冻结与范围

允许：CaptionQuickTogglePatch及小型CharSequence运行时入口；AI开关模式的只读boolean桥接和官方AutoCaptions方法局部兼容注入；必要接缝安装调用；共享Compatibility、生成元数据/README当前信息、新R2构建验证工具、必要回归/管理docs。

冻结：RebuildController/Cache/Publication/Permit、清理执行器、Pager/RenderSpec/Overlay、n28b-policy-v1和n28c-presentation-v2、中文旧namespace/18组golden、请求prompt/hash/JSON/源文token/owned时间、attempt/repair预算、focus2/prefetch2/总4、所有用户配置/字号/拖动位置/颜色。不可因兼容迁移放宽文本/权限/容量规则或清cache。

原65测试、中文fixture、ACCEPTANCE/frozen逐字节保留。现有R1测试不能删除或弱化。新增接口/guard语义测试以实际接缝为目标，失败保存原证据；未知不兼容先定位真实代码后最小修正，真正要动冻结业务层才回规划者。

三项最终UI整改（summary、14语种运行时、技术诊断英文）继续延期未关闭。新增纯技术审计字段全英文，但不顺便改整个旧诊断或承诺全UI适配。VISIONOS用户已解决，不处理；N27事件/类/控件避让仍为零。

## 7. 必要验证与交付

- 全量R1的614及新增回归，记录实际总数，failure/error/skipped=0。既有全量含受控并发/main生命周期；冻结核心未动则不为凑数另重复400轮。原46专项/18中文golden/14目标28冷热/40几何及最短多页规则保留，用既有入口核验所需证据。若核心出现必要改动必须先回规划者定界并重新验证，不私自扩卡。
- Python27/27、localization220×14；冻结4通过/4既有失败/4未验证且三个invisible_ms=0，ACCEPTANCE/frozen零diff，不包装成质量全通过。
- 官方1.45.0实际完整组合和七组合结构；既有菜单/初始化/selection dispatcher唯一性、API0 native-only、N27为零；新CharSequence及手动CC shim最终绑定正确。
- 最终所有根DEX（数量/类数按新官方实际结果，不写死11/58052）、分支/指令边界/寄存器与API访问绑定、minSdk28接口、资源/设置及CRC、verify_bundle/N8Verify/aapt通过；旧坏分支变异依然被审计拒绝。apksigner只确认unsigned，不把拒绝验签写作签名通过。
- 卡前建立相关历史产物/证据清单SHA，卡后对同一清单复核，R1/B/C及旧失败证明不变。不要强制沿用62这个旧总数；报告本次实际捕获总数，不重写历史输入。
- 独立build/local-test/patches-1.3.5-本地测试包-n28c-r2.mpp、extension-1.3.5-本地测试包-n28c-r2.mpe；build/n28c-r2-composition-final/YouTube-21.16.256-本地测试包-n28c-r2-unsigned.apk。从正式MPP自身组合，内嵌扩展与独立MPE逐字节相同；历史路径不可覆盖。
- 交付docs/N28C-R2-LOCAL-TEST-BUILD.md：源码身份/官方1.45.0输入与新目标、真实ABI差异、guard真值表与注入PC、全量/组合实际分母、完整SHA/字节/相对R1差异、生成元数据一致性、未覆盖真机边界、发布CI待办。
- 本地一个核心提交及anchor/n28c-r2-<真实短哈希>；真实锚点写实可用仅docs后继，不amend原提交。两份状态同步，工作区除明确用户输入及ignored证据外干净，规划管理文件随卡保留提交。
- 未授权签名/安装/清数据/卸载/推送/发布；零远程翻译API、零新依赖、零下载。完成即停，只提醒用户按N28C-DEVICE-CHECKLIST一次有限复验，不自行开始第四期。
