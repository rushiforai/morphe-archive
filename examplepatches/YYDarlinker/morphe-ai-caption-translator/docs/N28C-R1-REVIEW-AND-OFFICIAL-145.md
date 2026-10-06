# N28C-R1审阅与官方1.45.0兼容核查

日期：2026-10-02，Asia/Shanghai。规划者本轮审阅，不是产品实现或全量复跑。

结论：R1两个工程阻断已闭合，允许进入有限手机验证。用户随后指定官方1.45.0为后续基线；实际包检查发现确定的菜单接口不兼容，以及默认字幕策略变化。因此先执行N28C-R2兼容迁移，交付新候选后只做一次手机复验，再决定第四期。尚未把R1与1.45.0实际组合，不宣称新基线已适配。

## 1. R1身份与证据

实际仓库E:\Projects\morphe-caption-v2。HEAD=f7c0c462dcd31f57f1336678007793570cbd4818，产品/锚点=9a7bdf35351b9a052233bac8b9004241548eb1eb / anchor/n28c-r1-9a7bdf3；后继只有两份docs差异。核查前仅用户新输入patches-1.45.0.mpp未跟踪，没有产品改动。

已核对源码修订、交付记录及.verification/n28c-r1/final-state.json：main不等许可/disconnect，后台明确5秒barrier；非中文presentation-v2优先短窗完整单页、多页每页1200ms、硬容量不足明确空白。原中文路径、18组golden、请求/缓存scope、focus2/prefetch2/总4保持。

执行者证据为614全量、46专项、400受控轮、14目标28冷热行、40几何（24完整1000ms/16容量空白）、84组合/11DEX；规划者没有重新跑这些产品检查。手机/OEM/远程实况/母语语义仍未验证，冻结4/4/4不是译文质量认证。

规划者本轮实际重算三产物SHA，均与交付相同：

| R1文件 | 字节 | SHA-256 |
| --- | ---: | --- |
| build/local-test/patches-1.3.5-本地测试包-n28c-r1.mpp | 1,125,252 | DB94A582AD7E895F68425AE029C78CB7788DD4627DCD163E85825B31E6B5119C |
| build/local-test/extension-1.3.5-本地测试包-n28c-r1.mpe | 2,757,968 | DB1C80C46AD5DDFC6D4A966C3B6E6C0E5F15E7DC8198DE708B31265F9507319F |
| build/n28c-r1-composition-final/YouTube-21.16.256-本地测试包-n28c-r1-unsigned.apk | 196,959,323 | 585A7F47D7937C7F744040865CCE0F9B506EFB53E44A8C7890CC7D430E3F7038 |

## 2. 官方包身份与支持范围

用户输入E:\Projects\morphe-caption-v2\patches-1.45.0.mpp：11,039,984字节，SHA-256 DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93。与[官方1.45.0发布资产](https://github.com/MorpheApp/morphe-patches/releases/tag/v1.45.0)的GitHub API size/digest一致；发布时间2026-10-02T08:55:35Z。该输入保留，不默认提交大二进制。

用本地Patcher1.14.1加载两个真实MPP的Patch定义成功：1.44.0=150、1.45.0=162。只加载元数据，没有执行patcher组合或安装。

实际YouTube targets（Captions及本次枚举的YouTube项一致）：

| 官方1.45.0目标 | 标记 | minSdk |
| --- | --- | ---: |
| 21.39.522 / 21.38.130 / 21.28.208 | experimental | 29 |
| 21.23.492 | experimental | 28 |
| 21.16.256 / 21.13.164 / 20.31.42 | 非实验 | 28 |
| 20.21.37 | 非实验 | 26 |

继续使用现有原版21.16.256及项目minSdk28，不必为迁移改YouTube宿主。我们的Constants.kt、patches-list.json及README目前仍声明21.07.247；它不在新官方目标内，须修正为通过本次真实组合的21.16.256。其余官方版本没有本项目指纹/组合证据，不自动扩大兼容声明，也不把实验版本当稳定版。1.45.0是官方包版本，不是本项目产品版本。

## 3. 接口与行为差异

直接读取两版youtube/shared/shared-youtube扩展DEX，比较类/方法/访问位，结果如下。

| 接入面 | 核查结果与影响 |
| --- | --- |
| PlayerFlyoutMenuComponentsFilter.isFiltered | 路径参数String→CharSequence；后继仍是byte[]。本项目CaptionQuickTogglePatch.kt要求该参数严格为String，然后注入observeMenuPath(String,byte[])；新版确定不满足该guard，会报AI quick toggle: menu path signal unavailable。这是实际签名与现有严格guard的冲突判断，尚未冒充已运行失败组合。 |
| FlyoutUtils菜单API | addFlyoutButton/addFlyoutElements/getFlyoutMenuInfo/menuContainer/dismissFlyout等本项目使用的接口未缺失。onCommentsLoaded返回V→byte[]，本项目未直接调用该评论接口。菜单内部结构是否仍满足divider/guard定位须真patcher验证。 |
| ShortsPlayerState、PlayerType | 本次比较的公开方法签名没有变化；最终绑定/类型仍须交付APK审计。 |
| AbstractPreferenceFragment、ThemeUtils、CustomDialog | 本次比较的公开方法签名没有变化。排序/视频父屏/旁白邻接必须从新交付资源及官方真实排序代码复核，不能只看旧fixture。 |
| 官方AutoCaptionsPatch | [官方修订](https://github.com/MorpheApp/morphe-patches/commit/a92b8edc30e31e16ca61e072540ac722a2616ff9)把BOTH_ENABLED判断提前，始终返回false，不再经过手动CC的150ms guard；包内Settings初始化默认也是BOTH_ENABLED。因此不是只有用户另选某个罕见配置才可能触发。对AI模式，必须保留此前手动关闭/打开语义；原生模式仍遵循新官方行为。 |
| 旁白/播放器控件 | 官方有按钮状态/无障碍及旧控件解耦改动；没有发现其公开接口直接取代本项目AI字幕。N27避让继续搁置，不能借本次迁移恢复。 |

AI模式兼容定案：只在AI根已安装且用户AI开关开启时，恢复旧版已有的“guard结束后尊重original”路径；guard初始加载阶段以及AI关闭/未安装时，原1.45.0逻辑完整保留。不改官方共享偏好或默认值，不全局取消官方Always show，不用缓存/临时渲染可见性决定用户的模式。具体执行约束见N28C-R2任务卡。

新包有91个带YouTube兼容声明的具名patch（旧84），21.16.256匹配的具名default项90（旧83）。这些元数据计数不是组合PASS数；新组合按实际选中及依赖报告，不能继续机械规定恰好84，更不能为保持旧数删除官方新默认项。新增Universal Spoof signature的default=false，不擅自打开。

## 4. 下一步与延期项

执行docs/N28C-R2-CODEX-TASK.md：必要菜单桥接、AI模式手动CC兼容、新官方真实组合及版本元数据。独立-n28c-r2产物，不覆盖R1/B/C或失败证明。用户收到新包后按docs/N28C-DEVICE-CHECKLIST.md做一次有限观察，提供完整诊断和异常时段，不要求阅读14种语言。

收到诊断并评估后再第四期多选语言菜单。最终三项（入口介绍summary、十四语种运行时适配、程序性诊断英文）仍必须后置闭环，不能因220×14检查通过而关闭。VISIONOS问题用户已解决，不再处理。

发版约束另登记：当前validate/release流程仍含v1.3.5的recovered Smali路径；本次候选必须从当前Java/Kotlin源码构建，旧recovered构建不能替代其验证。未来发布新版本时必须走最新源码/实际兼容元数据生成，并先核对发布流程与产物一致；不能覆盖已发布v1.3.5资产。本轮不运行发布、不改历史发布URL/日期。

## 5. 本轮证据与操作边界

本轮工具与原始结果在.verification/official-145-review：OfficialInventory.java及两版metadata JSON、OfficialDexAbi.java及三扩展ABI TSV、DexProbe、145-settings-clinit.txt、两版manifest、输入与产物SHA记录。工具只使用已有JDK/Patcher依赖。GitHub release API/官方页面为只读资料查询，没有远程翻译API/新依赖/软件下载。

本轮仅审阅、编写管理卡/清单并同步状态，没有修改产品源码、重跑产品测试、构建新MPP/APK、签名/安装/清数据/推送/发布。
