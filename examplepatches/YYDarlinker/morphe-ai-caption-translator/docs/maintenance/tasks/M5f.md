# M5f — 配置与凭据持久化故障合同及离线验证

任务卡v1；2026-10-25下发。前置[M5e复核](../reviews/M5e-REVIEW.md)已接受受控时序/夹具改善，历史原始交错仍未知。当前基线779项，产品 `1.5.8 / local-1.5.8-m5d-r1`，公开1.5.7。当前只调查配置/凭据持久化及补必要测试；不修改生产行为或进入缓存格式迁移、F5诊断或M6/M7其他工作。

## 1. 目标与调查方式

请求/等待/退休的F1/F2/F4已有各自接受范围。下一步需要知道：配置损坏、凭据不可解密、保存/切换部分失败时，现有程序会返回什么、修改什么，以及用户已有资料是否保留。

交付当前实现的来源合同和有意义的故障验证，区分：当前事实、用户资料保护要求、已复现缺陷/源码风险、未覆盖硬件或磁盘行为。调查中发现的问题列为独立后续修复候选；不能靠修改生产、清空profile、删除密文或改变断言期望，宣布故障已解决。

默认保护要求是：读取失败不能自动删除保存的密文/其他profile，不能把别的profile凭据当作当前key；保存/编辑拒绝不应悄悄覆盖其他profile或全局设置。当前代码是否完全满足必须实查。不存在、存在但不可读、origin不匹配、用户明确清除是不同情形；不能把hasSavedValue当作成功解密/持久化证明。

## 2. 入场及范围

唯一活动仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`；复用当前分支/工作树，保留全部既有修改，按入场原件而非HEAD总diff核对。先读AGENTS、PROJECT-STATE当前/最新、维护入口、M5e REVIEW、本卡及路线M5相关部分。读取现有状态/网络合同中配置快照、F3语义缓存及凭据诊断身份的决定，避免另创相冲突的隔离策略。

当前冻结MPP `build/maintenance/M1a/20261025-M5e-candidate-01/patches-1.5.8.mpp`，SHA-256 `e007601dd93da64925acb624bc66e3187746404b4389533b1ae2e78641288958`，内嵌/独立MPE `0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e`。入场核对并保护，生产身份不变。

主要阅读范围：

- infrastructure中的ApiProfiles、SecureApiKey、DeepSeekConfig及确有关联的ProviderEndpoint/配置加载入口。
- UI中真实profile选择/编辑flush、密钥保存/清除/错误显示入口，按调用关系读取，非全UI重审。
- 已有ApiProfilesTest、ApiProfileSnapshotTest、ProfileUiRegressionTest、SettingsSurfaceFrameworkTest、N37SnapshotBindingTest及相关密钥/诊断测试，先确认哪些是真组件，哪些用shadow直接返回fake key。

允许修改：新合同 `docs/architecture/CONFIG-CREDENTIAL-CONTRACT.md`、最小架构入口、必要的新测试/测试夹具、维护入口/路线/PROJECT-STATE及镜像、本卡结果。优先新增聚焦故障测试，不机械重复已有正常场景；仅有明确夹具必要性时局部修正已有测试并说明，保留原有效断言。

生产源码/资源、gradle.properties/build ID、core来源/协议提示词/Hook ABI、配置键/密文格式/Keystore alias、缓存身份、工具/CI/依赖均冻结。不得引入生产测试缝或通用存储框架。F3同语义缓存复用不变；profile/凭据存储隔离与模型翻译缓存复用是不同职责。

## 3. 合同需要说明的实际边界

建立精简源码→操作→实际结果/写入→测试/XML的矩阵，重点包括：

1. legacy/default与新profile的index、values、secret三个存储及全局设置分别由谁拥有。创建/重命名/选择/删除/clearKey/编辑flush的写入次序，失败后active、names、values、密文和全局enabled/style实际怎样。多次apply不能写成跨store事务。
2. 读取、成功解密、hasSavedValue、ProviderSettings就绪、请求凭据及StoredCredential诊断捕获的用途。origin检查在哪一层，legacy缺origin绑定的兼容路径是什么；captureCredential只用于延后诊断脱敏，不能被描述成请求key装载。
3. 无key、Keystore无alias/不可用、坏Base64、截断/非法IV、GCM验证失败、origin不匹配时的返回/抛出与持久化副作用。旧密文是否保留、是否会生成新master key、是否会切到其他profile，逐项据源码或动态证据判断。
4. SharedPreferences缺失、字段类型错误、names JSON损坏、active指向不存在profile、endpoint异常等代表性坏数据的实际处理。默认值、迁移/自动写回、异常传播与UI提示分别说明，不能把崩溃或兜底写成完整恢复。
5. 保存与切换失败：flush拒绝/抛出、加密前后失败、一个store写入后下一个失败等代表性边界。原数据保留/部分写入/未通知或已通知的实际状态是什么；是否可继续读取其他profile。只选实质不同的代表性路径，不做全部字段乘积穷举。
6. apply的内存可见与真实落盘完成不同，Robolectric与真实Android进程重启/磁盘/硬件Keystore的范围不同。没有实测的断电、磁盘满、卸载重装或硬件失效不要写成通过。

## 4. 必要离线验证与故障注入

先盘点已有覆盖，再补缺口，不要求固定新增数量。

- 至少对真实读取/解码边界的代表性坏密文、origin拒绝、profile数据损坏、保存/切换失败做可检查验证，比较操作前后的完整fixture偏好数据。证明未越权触碰其他profile/全局设置，或如实记录已经观察到的相反结果。
- 对密钥读取建立一个可信正向对照和对应失败对照。可用测试JVM内的受控KeyStore/加密provider、局部shadow或Context/SharedPreferences包装器注入底层依赖；每项注明替身层级。若要证明AES/GCM解析/鉴别行为，应保留真实SecureApiKey和实际Cipher路径；用整个load/decrypt返回fake值的shadow只证明上层装配，不算加密故障证明。
- 只使用测试生成/明确fixture key和测试拥有的偏好/文件/provider。不得读取用户真实profile/密文、操作Windows凭据或真实设备Keystore，不向用户目录写测试数据，不真实填满磁盘来制造故障。
- SharedPreferences代理丢写/抛错、可控KeyStore拒绝等是底层替身，不等于真实断电/硬件/磁盘满。注入必须到达实际目标方法，不能只测mock本身。保留正常恢复/另一个有效profile正向对照，避免把所有key都返回空的替身误当保护正确。
- 本卡默认零HTTP。profile changed/模型列表发现等副作用必须在测试中阻断或显式映射本地fixture，未映射连接直接拒绝，不得访问真实YouTube/模型/外部配置端点；fixture endpoint也不应触发真实DNS/网络。
- 测试清理恢复注册的JVM安全provider、Context/静态编辑器/Host/Output/Audit等真实修改项；线程和队列有界等待，无新增Thread.sleep碰时序。做少量必要顺序/重复检查，不运行大量随机循环。

如果出现违反资料保护要求的行为，保存能区分当前与应有行为的证据。可以用明确命名的当前行为刻画测试和独立应有红测记录问题；绿色完整套件不代表该问题已修复。不要为保持绿测把缺陷从合同/结果中删掉，也不要在本调查卡中暗改生产。

## 5. 验证、交付与停止

全部项目操作在E:，使用.devenv进程环境；保存入场原件、本批diff、六忽略前端及与本卡相关的有限历史保护清单。无需枚举旧解码中间树；不清理旧资产/证据。各次Gradle顺序运行，当前XML/receipt先归档再启动下一次；优先用已有受保护归档保全历史，不在新任务已启动后才补称调用前取证。

固定测试/文档后运行已接受verify-full入口，Offline/RerunTests，ExpectedVersion 1.5.8、ExpectedBuildId local-1.5.8-m5d-r1；新RunId独占候选，不覆盖旧包。两组真实结果、输入指纹/receipt/XML、compiled/UI/包/来源等检查如实记录。

生产冻结，核对159个生产文件及范围外内容、MPP条目/独立内嵌MPE；新MPP预期至多manifest Timestamp变化，其余生产DEX/MPE/资源原字节。发生其他差异先查明，不改哈希/身份掩盖。生产同字节证明完成后仅引用M5d-R1指定一组历史组合及限制，本卡不要求重做组合。

结果 `docs/maintenance/results/M5f-RESULT.md`，证据独占 `validation/runs/<date>-M5f-<unique>/`。交付当前合同、源码/测试矩阵、注入与正常/失败/恢复结果、替身/硬件/磁盘限制、问题清单及优先级建议、完整验证/候选/生产保护和逐文件退出哈希保护回退。发现的问题标记已动态复现/源码确认/待验证，不由执行者自行选择新的数据迁移/清除策略。

更新维护入口/路线/PROJECT-STATE及字节相同镜像，执行完成待复核或准确部分，统筹保持待复核。合同调查可完成并留下待修缺陷，但不能因此宣称保护要求已全部满足。停止交统筹决定修复卡，不自动进入缓存/诊断/性能/资料整理。

不commit/tag、推送/PR/发布、签名安装/清用户数据、调用真实供应商/付费API或清共享缓存，不reset/clean。原报告/候选/封存证据保持。
