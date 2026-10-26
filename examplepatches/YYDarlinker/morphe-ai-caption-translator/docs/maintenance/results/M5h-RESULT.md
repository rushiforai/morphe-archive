# M5h / 任务卡 v1：配置错误恢复与编辑保护收尾

2026-10-25（Asia/Shanghai）。**执行结论：完成待复核；统筹：待复核。** 同一对话顺序完成 A、B、C 和统一交付；没有进入缓存、诊断、性能或下一阶段。执行者不宣布配置组全部接受。

唯一仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`；进入/退出分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`，索引保持。入场接受身份 1.5.8 / local-1.5.8-m5g-r1，820 项；本轮最终候选 **1.5.8 / local-1.5.8-m5h / candidate-03**，843 项。最后接受的配置身份仍是 M5g-R1/C1，公开仍 **1.5.7**。

证据根 `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5h-01`。入场 `entry-originals.zip` / `entry-manifest.json` 保存 2239 项 Git 可见文件及指定镜像/忽略前端；原件 ZIP 自检通过，SHA-256 `9db43f19fdc72ac85f8e6c48f87d6e28ee9e9452f8ddae84cecf1b230d269c77`。原脏树、未跟踪文件和两项删除状态保留；本批 diff 按入场字节生成，**不是 HEAD 总 diff**。

## 本轮行为和生产范围

当前唯一合同及 C2–C5 处理表为 [CONFIG-CREDENTIAL-CONTRACT](../../architecture/CONFIG-CREDENTIAL-CONTRACT.md)，不在本结果再复制一套等价故障合同。

- **A / C3**：names JSON/类型/名称值、active 类型/未知 ID、endpoint（含空/相对/不可解析）、model/prompt/credential/enabled 类型通过真实读取进入明确 unreadable/未就绪结果。真实列表/设置行可读报错、保留重读/返回；初始化、重建、debounce 不覆盖坏值。真实 URL/model 编辑、有效索引下的实际列表点击及显式 enabled 开关可恢复对应状态。其他 profile 真 key、原密文、origin、global 原件保留；不自动删、迁移、选人、换 alias 或把旧 key 绑定新 host。
- **B / C5**：真实 getView/onCreateView、attached host detach 保留同 profile/revision 下 URL/key 失败草稿和错误，保存后正常空 key 不回显；旧 EditText 和已经 dequeue 的旧 debounce 均校验归属，不能在 profile/revision/编辑器重新绑定后写入。保存已完成与 saved/model/runtime 回调失败分开；字段显示“已保存、同步失败”，可点击行内只重试通知，不重复写。模型后置失败仍尝试 runtime 刷新；测试连接前置 flush 通知失败也被真实 UI 动作接住，未启动服务请求。
- **C / C2、C4**：真实 SharedPreferences listener 的 after-memory 异常和代理 before/after/drop 分开记载。本项目目前不在这些 store 注册抛错 listener；测试证实的是框架可执行的回调机制，不是设备磁盘事故。可观察的字段/active/key 已改变时仍推进通知/revision、撤销旧 scope；保留原主异常及合理 suppressed。UI 不再以“原值保留”断言未发生写入。跨 store 部分状态、orphan、drop/落盘确认保留为限制/独立决定。

11 个生产 Java 文件各有直接必要性：

| 文件 | 本卡职责 |
| --- | --- |
| infrastructure / ApiProfiles | 校验索引及 active；有效索引下允许显式恢复选择；部分内存变化后仍撤权/通知，保留 C1 单通知和原异常 |
| infrastructure / DeepSeekConfig | 只读 typed 失败结果、独立字段读取、显式 enabled 恢复；ConfigRead 与 Failure 同源文件，不改 UI staging/工具 |
| infrastructure / SecureApiKey | 错类型/坏 endpoint 的读取保护；旧 origin 不可确认时拒绝猜绑；加密 token 与明确清 key 的内存状态识别，不额外解密 |
| application-host / CaptionApplication | 配置不可读时不给新请求装载 key，配置刷新仍实际经过控制器撤权 |
| ui / ProfileEditorPreference | 真实重建/失败草稿、旧 callback 归属、保存与通知事实、部分写入识别及显式同步重试 |
| ui / DeepSeekTextPreference | URL 独立读取、失败 key detach 保护、加密存储 token |
| ui / DeepSeekModelPreference | model 独立纠正入口、不可读配置下禁止模型发现、存储 token |
| ui / ApiProfilesPreference | 真实列表错误/重读/显式选择，操作异常可读反馈 |
| ui / DeepSeekEnabledPreference | 设置行明确显示配置不可读 |
| ui / CaptionQuickToggle | 仅用户明确 enable 时使用其新 enabled 验证其余真实配置，不让坏 enabled 永久阻断恢复；正常开关语义不变 |
| ui / DeepSeekActionPreference | 测试连接前的 unreadable/flush 通知异常适配，保存事实保留且不发请求 |

另改 build ID 的 gradle.properties、localization/catalog.json 和 14 份资源 XML，新增六键×14语言（238 键/语言）；旧 232 键、默认 prompt、source map/index 原字节/映射保持。生成器连带重写的 index/source-keys 已从入场 ZIP **逐字节恢复**；未改生成器或复活退休 Java catalog。

## 红绿、测试层级和保护断言

原始 log/XML/receipt 和最小源码见各 `*-inputs.zip`、`*-xml/`、`*-receipt.json`。A-red02 的生产基线还可与 entry ZIP、随后 A-app-red-inputs.zip 中同一读取测试/未修生产逐项对照。

- A-red02 实跑 5 项失败，typed getter、坏 endpoint、坏 names 的实际就绪/读取差距有效；其中 unknown-active 首次失败是 fixture 注册出空 store 的观察，**不当作真实写盘红证据**。该项最终加强为 readable=false 和真实列表点击恢复。A-app-red 在真实应用 CONFIGURATION 以 ClassCastException 失败，旧 scope 不能正常撤权。
- B-red 5 项真实重建/detach/多行 key/后置通知断言均失败；C-red 4 项真实 listener 的选择/列表/endpoint/删除断言失败；A-enabled-red 与 C-clear-red 各 1 项；guard-red 3 项明确空地址、原 origin 丢失说明和 dequeue 回调缺口；action-red 1 项实际应用到测试连接按钮的通知异常退出。均保留原始失败，不以编译失败充红。
- 绿色检查点：A-green01：9 项，failures/errors/skipped=0/0/0；B-green01：34 项，failures/errors/skipped=0/0/0；C-green01：84 项，failures/errors/skipped=0/0/0；recovery-green：61 项，failures/errors/skipped=0/0/0；final-adjacent01：126 项，failures/errors/skipped=0/0/0；action-green：49 项，failures/errors/skipped=0/0/0。针对性只随修改运行，没有扩大等待或整测重试。
- M5h 新增 3 类共 17 项，既有 M5gApplicationConfigurationTest 增加 6 项，合计 **23** 项；35 个 ConfigCredentialFailureTest 方法保留，其中仅 7 个与新读取/反馈/撤权合同冲突的方法按旧→新映射，完整资料、其他 profile 真 key、origin、恢复断言保留/加强。剩余 28 方法正文不变；原应用 2 方法和端口 4 方法正文不变。见 `test-method-audit.json`。

真实 ApiProfiles/DeepSeekConfig/SecureApiKey、真实偏好读写、Conscrypt AES/GCM 运行；AndroidKeyStore 用测试内存 SPI，只替换查询/拒绝生成，没有整体 fake load/decrypt。实际 getView 和 detach 进入框架；真实 CaptionActions → CaptionApplication → RebuildController 的替换配置、旧 Session/publication/Job/RenderGuard 拒绝与后台 settings 快照均有断言。旧 ready scope 是显式植入的真实对象，设备显示/扫描是替身，不冒称完整播放器启动/设备认证。post-save 异常由局部 callback 或实际应用的设备边界替身主动注入，不报告为已观察到的用户设备事故。

各 fixture 拒绝未映射连接/模型发现并要求零外部请求，恢复 provider/ProxySelector/编辑器/端口/队列和测试静态归属；无新增 Thread.sleep、扩大等待、重算黄金值或真实付费/YouTube 调用。

## 最终完整入口与候选身份

```powershell
.\.devenv\verify-full.cmd -RunId 20261025-M5h-candidate-03 `
  -EvidenceDirectory validation/runs/20261025-M5h-01/final03 `
  -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m5h -Offline -RerunTests
```

实际退出 0，`final03/summary.json` passed。**core 320 + extension 523 = 843**，两组 executed，failures/errors/skipped 全 0；108 份 suite XML（原 105 + 3 新类）、各报告哈希/receipt/源码指纹归档。本地化 238×14、来源/提示词/Hook ABI/compiled/UI/包边界、发布14/验证工具15合同、metadata 及凭据扫描通过。输入前后 manifest 一致，最终指纹：

`859d61755591e7a46dde3bab3764c64de2720cd1819bfb5ebc544d9c8029f854`

同一次完整入口的 **555 compiled 类**在下一 Gradle 前归档为 `final03/compiled-from-this-full.zip`；ZIP SHA-256 `fb96dd0e32fdb651835fddc47eb6b75fa5f7636dff2bea451cf9becf14d90ac8`，同次 receipt SHA-256 `14b32909623954120071daadf6175b5db5104649a10f730a30a4d3720edfe37a`。绑定时间、逐类哈希、源码指纹、receipt 和下次 Gradle 的开始顺序均在 compiled-binding/组合日志中。81 core 类与接受 R1 的归档同字节。

从该归档提取 core 后，使用明确 MPP/独立 MPE/UI 重新检查边界和候选，均退出 0。两个负向实际退出 1：本地候选冒充 release-1.5.8 拒绝于缺失 release build ID；冻结接受的 R1 冒充 M5h 拒绝于缺失 local-1.5.8-m5h。不是缺文件假阴性；见 `independent-commands.json` 和对应 JSON/log。

| 产物 | 绝对路径 | 字节数 | SHA-256 |
| --- | --- | ---: | --- |
| MPP | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5h-candidate-03\patches-1.5.8.mpp` | 596013 | `68763b33adaf65d2865a735521701edb18b658ca8be3c831248800130546f560` |
| 独立 MPE | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5h-candidate-03\extension.mpe` | 731456 | `fd476ff38f84644eede6064867ca587f22b5fc73c604ff2f66ec09cd8a91a260` |
| UI preview APK | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5h-candidate-03\ui-preview-debug.apk` | 3511892 | `c82ae93a6dd364085bdf1644630043d947a01bf005c0556384b5de2be5049217` |

内嵌/独立 MPE 同字节，UI 不含 translation core。候选是本地交付，不发布、不覆盖公开1.5.7。candidate-01/02 仍保留但不是最终交付，即使同 build ID 也不能靠 ID 替代本表 SHA/receipt。

## 为什么保留三次完整入口和辅助失败

candidate-01 / final：320+522=842，通过；同次 555 compiled 已归档。之后实际 API 按钮红测暴露同边界通知异常，修 UI 适配/加第23项测试并调整新文案的“设置”指引，输入改变，旧结果不再作为最终依据。

candidate-02 / final02：320+523=843，通过；同次 compiled 已归档。有限保护预检查又拦住生成器连带的 index 换行与 source map 多两个既有 catalog 映射；恢复两文件入场原字节后输入改变，按卡再次验证。**最终固定输入仅 candidate-03 / final03**；之后只改当前文档/证据，没有再改工程输入。这不是同输入整测重试或复用旧绿测。

辅助失败全部区分：首次 A-red 因参数未传到 receipt，0 测试；locale pt-rBR/pt 键错、旧生成器 Java 输出路径已退休；保护预检查识别无关 metadata；两次 inline shell/Python 参数构造失败，未写工程；包差异初次错误假设只有 arsc，随后按六个实际 XML 检查；ARSCLib decodeXMLFile 在锁定包是未实现 stub，改用同包 loadResXmlDocument.serializeToXml；qualifier 的前导“-”按目录语法归一；分类器初次不识别 DeepSeekConfig-IA，独立证明其是空 synthetic 标记且被 ProviderSettings 构造器引用后精确纳入。原失败 log/source/工具输出和成功原始数据保留，不改工具/放宽既有生产审计；见 `attempt-ledger.json`。

## 同输入真实组合、资源和类内容

实际通过 `.devenv/dev.cmd` 运行 `:patches:verifyComposition`（compile=true）及 `:patches:auditComposition`，参数/receipt 见 run-composition.ps1、composition-command.json、audit-command.json 及各同次 receipt。只做这一组最终候选组合，未扩版本矩阵。

- 原始 YouTube 21.41.525-SECONDARY SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`；官方 MPP1.48.0 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`；Patcher2.0.0 JAR `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`。104 官方默认根+AI，选择/输入哈希保留。
- 实际组合/资源重编译退出 0，既有 `DEX_AUDIT_PASS classes=64580`，无重复/测试/回环泄漏。未签名 APK `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5h-01\composition-M5h\patched-unsigned.apk`，227136844 B，SHA-256 `1276ac9b5a5a81d7bb9a8c66ce6854b148cf3dfe5c81a99389b1f9eade036506`。
- 对冻结接受 R1，APK 仅 classes12.dex、classes13.dex、resources.arsc、AndroidManifest.xml、res/Yak.xml、toolbar 与三份 morphe_prefs XML 改变；**18382** 其他条目同字节，无新增/删除条目。六个 XML 按各自资源表解析后结构/属性/文本语义完全相同，不把二进制差异掩成原字节相同。
- 直接读取实际编译资源表：旧 **3248** 个 cap_* 值不变，新增 **84** 值与六键×14语言的 catalog 逐项相等；旧 cap_* ID 变动数 0。仅解析这六个 changed XML 和 cap_* 表，没有重建/枚举全部解码中间树。`resource-content-audit.json` 给出键/qualifier/ID。
- MPP 74 条目中 manifest、内嵌 MPE、14 份文案 XML 改变，其余 **58** 同字节（含根 DEX、index/source map）；没有新增/删除条目。
- 两个变化 DEX 的 canonical 单类池审计保留成员、代码与 debug：825→839 类，无删除，14 新增为 ConfigRead/Failure 2 类、11 个编辑/列表 lambda、D8 的 DeepSeekConfig-IA 空 synthetic 构造标记。原类中 781 内容不变，44 raw 变化中 2 个仅 build ID；其余变化都属于本卡11生产文件及其内部/合成类，含行号/编译访问适配，不冒称每个变化类都有新业务逻辑。仅规范化两个已知 build ID 字面量；Hook、HookV2、NativeCaptionBridge 的实际类内容原样。见 package-content-audit.json、原始 TSV、generated-marker-proof.json。

## 保护、未覆盖和需要统筹判断的事项

`protection-audit.json`：159 个入场生产 main 文件只改变上述11 Java+14资源 XML，其余134原字节保持；141 个其他旧测试/资源文件同字节，两个旧测试类的原方法正文保护见方法审计。2201 个范围外入场文件、10183 项有限历史/候选/证据、六忽略前端、190 项工具/CI/构建文件保持。分支/HEAD/索引及两项既有删除状态不变；PROJECT-STATE 与镜像同字节。首个保护清单沿用前卡有限历史与本卡前置 R1 的指定目录，后续按清单核验，不复制大目录当新证据。

保留限制：跨 store create/delete 的 orphan/部分残留不是已修事务；apply-drop 仅代理，apply 返回不保证物理落盘；不提供 fsync/杀进程/断电/磁盘满认证。坏 index、隐藏 prompt 没有新增产品恢复/导入编辑器；原 origin 丢失时不能保 key 猜绑。其恢复需要本应用损坏前有效设置/数据备份（是否有、能否还原另验；工程 entry ZIP 不是用户设置备份），或用户在既有流程明确放弃编辑/清 key 后重配。测试恢复自己持有的 fixture 字节不当作产品恢复入口。credential 类型错有初始化保留/禁止请求；key 的真实提交/恢复使用原 GCM/依赖恢复路径，没有声称认证每种坏类型替换与所有线程交错。

设备/OEM/硬件 Keystore/用户认证、真实落盘/进程死亡、其他 YouTube 组合、远端 CI、真实供应商/费用和任意线程交错未认证。M5e 历史原始显示交错未知、F3/F5 保持。需统筹复核本卡规定路径和上述保留限制；自动修复/迁移/orphan 清理/跨 store 事务及新产品恢复工具需独立决定，执行者不下发下一卡。

## 退出哈希回退与交付状态

入场字节 `batch.diff`、可读换行归一 `batch-review.diff`、逐文件 line-ending facts、exit-originals.zip 和 rollback-plan.json 已封存 **39 目标**（36 个入场文件+3新测试）。退出 ZIP SHA-256 `ba802355251932864675572b07f6b37e1ada8d50b8606950fe69f82ccef7577f`。结果报告、证据和所有新旧包均排除在回退之外。

```powershell
& 'E:\Projects\DeepSeek morphe-ai-caption-translator\work\toolchain\python\python.exe' -X utf8 `
  'E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5h-01\rollback.py'
```

**实际仓库默认 dry-run 通过，未实际 apply。** 只有追加 `--apply` 才恢复本批入场字节；先核验全体退出 SHA/ZIP/安全路径，任一后续编辑/删除整体拒绝且零写入。状态/镜像同一计划成对。E: `.tmp/M5h-rollback-rehearsal-01` 实际验证 default dry-run、模拟后续编辑时拒绝/零写入、还原正确退出字节后 apply、全39目标精确还原（新测试只在隔离演练删除）、状态/镜像一致。见 rollback-rehearsal.json 与各日志。

当前合同、维护入口、路线、收尾清单、架构摘要、PROJECT-STATE/镜像已更新；只标完成待复核、统筹待复核。全部项目/临时/构建在 E:；没有 commit/tag、推送、PR、发布、签名安装、清用户数据、真实付费 API、共享缓存清理、reset 或 clean。执行到此停止，交回统筹。
