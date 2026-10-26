# 配置与凭据读取、编辑和故障合同

2026-10-25，M5h v1经[统筹复核](../maintenance/reviews/M5h-REVIEW.md)接受**规定路径与保留限制，配置组本轮有界收尾**。当前接受本地1.5.8 / local-1.5.8-m5h / candidate-03，公开1.5.7。以下C2–C5表中的修复路径/有依据限制按本复核接受，不扩大成所有故障可自动恢复或跨store事务。原M5f/M5g/R1结果、卡和证据保留；执行结果见[M5h-RESULT](../maintenance/results/M5h-RESULT.md)。

[状态合同](CAPTION-STATE-CONTRACT.md)与[网络失败合同](NETWORK-FAILURE-CONTRACT.md)保持。原生 CC/语言、AI 开关正常产品语义、源模式零模型请求、F1/F2/F4、F3 语义缓存复用、F5 诊断分类没有新策略。坏配置的未就绪是 infrastructure/application 的读取保护，不重写 core 错误分类。

## 1. 来源和数据归属

实现：[ApiProfiles](../../infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/ApiProfiles.java)、[DeepSeekConfig / ConfigRead](../../infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/DeepSeekConfig.java)、[SecureApiKey](../../infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/SecureApiKey.java)、[ProfileEditorPreference](../../ui/src/main/java/app/yydarlinker/deepseekcaptions/ProfileEditorPreference.java)、[CaptionApplication](../../application-host/src/main/java/app/yydarlinker/deepseekcaptions/CaptionApplication.java)。ConfigRead 是与 DeepSeekConfig 同源文件的 package-private 小类，沿现有 UI fixture 源码纳入方式编译，未更改构建工具/依赖/SDK。

| 所有者 / store | 冻结的内容 | 边界 |
| --- | --- | --- |
| ApiProfiles / caption_api_profiles | names JSON 对象、active、legacy_deleted | 未删的 default 隐式列出；新增 ID 为 UUID；名称不决定凭据身份 |
| default / deepseek_caption_translator | base_url、model、prompt；删除时也移除 planner_model | 与 enabled/style 共用 store；明确删除 default 只移除它的四个 profile 键 |
| 新 profile / caption_profile_ID | endpoint/model/prompt 等 profile 值 | create 只写 base_url 和空 model，不复制 key/model/prompt；明确 delete 清目标 values |
| SecureApiKey / deepseek_caption_secret | default 为 api_key_ciphertext 及其 _origin；其他为 api_key_ciphertext_ID 及其 _origin | 清目标两键，不删除共享 master，不操作其他 profile |
| AndroidKeyStore | alias yydarlinker.deepseek.caption.api.key.v1 | AES/GCM/NoPadding；Base64(IV 长度字节 + IV + ciphertext/tag)，算法/格式/alias 不变 |
| 全局 DeepSeekConfig | enabled、style、位置、flyout、display_text_debug 等 | 本卡只为配置 enabled 的坏类型适配；旧 style ratio 的既有迁移/质量 trace 清理行为不重构 |

ApiProfiles.LOCK 保护常规 profile/config/credential 快照；它不提供多个 apply 的事务性或物理落盘确认。诊断 activeSnapshot/captureCredential 不等待此锁，继续只用于加密快照脱敏/变更识别，不能用作请求授权；捕获不进入 KeyStore/Cipher。

## 2. 读取结果和恢复

**读取不写回。** 缺失值沿用既有 default/legacy 兼容；存在但不能解释的值不被当成缺失，不清 index/secret，不生成 alias，不猜选另一 profile，不把旧 key 绑定到新 host。

| 读取输入 | 当前结果 | 可用恢复与边界 |
| --- | --- | --- |
| names 缺失、active 缺失，且 default 未删除 | 合法旧安装仍为 default / 空 names；缺失 endpoint/model/prompt 用原默认 | 不创建/迁移存储；合法既有默认及默认 prompt 文字不变 |
| names 坏 JSON、偏好非 String、名称值不是 String；legacy_deleted 类型错 | list/active 的内部读取为脱敏 ConfigRead.Failure；ProviderSettings.readable=false、ready=false | 真实列表/设置行显示可读错误，列表保留重读/返回；不猜测重建。恢复需要**本应用损坏前有效 profile 设置备份（用户原有应用数据副本/设备备份，是否存在及能否还原须单独确认；本轮源码 ZIP 不是用户设置备份）**，本页没有自动恢复、导入或扫描工具；不承诺系统一定已有备份 |
| active 非 String 或不是有效索引中的 ID | 不打开 ghost/default 替代配置，load 无可发送凭据；不改 active | 索引本身可验证时，真实列表列出有效 profile，不标虚假的当前项；用户明确点击一个有效项后选择并通知。索引也坏时需有效备份 |
| endpoint 非 String、空/仅空白、相对或不可解析/不合兼容端点规则 | readable=false、ready=false；不以默认 host 掩盖已存在坏地址 | URL 行保留实际编辑入口，初始化/重建/空文本 debounce 不覆盖原件。用户提交有效地址后只改本字段；绑定过的原密文/origin 保留，新 host 不能取原 key，改回旧 origin 可恢复原 key |
| model/prompt 的存储类型错 | 配置不可读/未就绪；其他正常行可操作 | model 可经真实手工编辑器纠正。prompt 现无可达产品编辑行，本卡不新增产品 prompt 编辑器；需恢复该应用损坏前有效设置备份，或经有效索引明确选择其他 profile。测试恢复自有 fixture 不冒称产品入口 |
| ciphertext/origin 偏好类型错 | checked metadata 读取失败；应用新快照无发送凭据；key 行可读错误 | 用户明确提交新 key 或使用既有明确清 key 确认，才替换/删除目标两键；打开页面不解密额外副本、不删除原件 |
| 密文存在但 Base64/IV/GCM/KeyStore 不可读 | 真 load 返回空、ready=false；hasSavedValue 只说明 contains/origin，不说明解密成功 | decryptStored 不删、不生成 master；依赖恢复后重读。没有新增每次 key UI 查询的主线程解密；硬件 alias 永久丢失不承诺可恢复 |
| enabled 非 Boolean | 普通 enabled 读取拒绝授权（false），ProviderSettings 明确 unreadable；不写回 | 用户明确启用时，以用户给定的新 enabled 验证其余 profile/endpoint/model/prompt/key；其余有效才进入现有 switch/intent 保存链替换 enabled。损坏的其他字段仍不能借开关绕过；原生语言/CC 不被猜造 |
| 无 origin 的旧 key + 原 endpoint 已不可解释 | 用户改地址时也不猜旧 origin、不绑定新地址；保存拒绝、完整原件和草稿保持 | 产品明确说明：恢复损坏前有效备份；或者用户放弃本次编辑后，使用既有明确清 key 确认，再重新配置。读取/重试本身不清除任何资料 |

origin 仍是 endpoint 的 scheme + rawAuthority 小写，含端口、不含 path/query，不新增默认端口等价化。合法旧 key 缺少或空 origin 的读取兼容保留；读取仍不绑定。正常地址编辑只将缺 origin 的旧 key 绑定到**可验证的旧地址**。坏地址本身必须拒绝请求，包括 legacy 无 origin 短路情形。

DeepSeekConfig.load 在锁内把坏读取适配为无 plaintext 的明确不可读 ProviderSettings；没有把失败伪装成另一 profile 的合法默认。CaptionApplication.settings 在该结果不可读时不再次提供 key，真实 CONFIGURATION 仍经过 RebuildController.refresh/stop/activate，旧 Session/publication、Job 的新尝试和 RenderGuard 失效。后台 settings 快照使用相同真实读取。没有请求 core 新分类或新增重试。

## 3. 保存事实、失败草稿与通知

保留逐字段自动保存。**C1 已接受范围继续成立**：成功字段生效，不全表单回滚；后续拒绝/throw 不吞掉此前保存，active 在拒绝时不切。flushCurrent/flushExceptKey 在 flushing 清理后对本次改变通知一次；无变化/全部拒绝不通知；skipKey 保持 key 草稿/原密文。正常 select 合并为新 active 的一次最终通知。高层刷新不持 ApiProfiles.LOCK；独立 debounce 仍及时刷新。

ProfileEditorPreference 的真实 getView/onCreateView 重建先 flush，同一 profile/revision 若仍有未提交文本，保留原始文本、错误、lastCommitted 和反馈；不将草稿标成已保存。key 失败 detach 保留未保存草稿；成功/空 key 的正常空显示不变。没有把未保存 key 写入磁盘草稿或回显已保存 key。明确切换/删除或 profile revision 改变仍撤销旧绑定，旧 editor 的监听器不能写入新 editor。已经 dequeue、无法仅靠 removeCallbacks 撤回的 debounce 还检查捕获的 editor 对象、profile 和 revision，不能恢复旧写权限。未新增线程、全局表单总线或永久任务。

save 返回后 lastCommitted 已保存，saved()/模型刷新或 runtime 回调失败单独表示“字段已保存，但配置同步失败”，不设未保存错误、不重复当成草稿。行内反馈可点击**只重试通知**，不重写字段。重建保留同绑定的同步失败事实；切换绑定不带到别的 profile。saved 回调失败也仍尝试 runtime 刷新。

save 自身 throw 则保留草稿并显示“失败或无法确认”，不声称原值一定未改。字段比较前后的进程内存储 token；若 apply 回调抛错但该字段确已改变，同样刷新一次运行配置。这是内存变化识别，不是解密校验新 key、重新写入、commit/fsync 或磁盘确认。正常保存没有额外 KeyStore 解密，key token 使用加密快照 identity。

原始 Editor/写入/重绑异常保持主异常；随后通知异常作为 suppressed；仅通知失败在 raw flush/select 边界继续传播，不自动重试、也不伪称事务回滚。UI 字段/列表适配为可读反馈；测试连接按钮也捕获前置 flush 的通知异常，停止于启动服务之前。真实应用回调失效、旧 scope 撤权、显式点击同步后无重复写都有动态断言。

## 4. C2–C5 实际可达性和处理决定

下表是本卡唯一的 C2–C5 处理表。**已修规定路径 / 有依据的保留限制 / 需独立决定**是执行分级，经M5h统筹复核接受本轮规定范围，不等于所有分支或物理持久化已认证。

| 条目 / 调用链 | 异常来源、已观察资料变化及替身限制 | 本卡决定 | 动态验证入口 |
| --- | --- | --- | --- |
| C2 create：列表新增 → create → 新 values apply → names apply | 代理 before-index 拒绝可留下 orphan values；after-index 回调可使 profile 已列入而方法抛错。SharedPreferences 真实 listener 是可执行的 after-memory 机制；本项目当前不在这些 store 注册抛错 listener，不声称设备磁盘故障 | **有依据的保留限制**：不扫描 orphan、不补偿清除、不自动重建 index。新增失败留在输入界面，不承诺没有部分资料；重新打开列表检查当前索引。跨 store 恢复策略 **需独立决定** | 原 ConfigCredentialFailureTest.createIndexFailure…；M5f 原矩阵/完整前后 store；未把代理变成真实落盘事故 |
| C2 select/delete/clear：真实列表/确认 → ApiProfiles → active/index/secret/values → rebind/configuration | 实际 listener 在 apply 改内存后抛错已动态复现；select 可先变 active，delete 可移 index/secret 后保留 values，clear 可已去 key。它不是多 store 磁盘原子失败证明 | **已修规定路径**：观察到 active 或 key 已改变时，保留主异常并推进 revision/通知、撤销旧运行身份；列表/确认捕获错误并说明结果可能改变。明确 delete 原有选择剩余 profile 行为保留，仅限用户删除动作；读坏数据不自动选人。部分残留本身 **有依据保留**，自动补偿/清理 **需独立决定** | M5hPreferenceCallbackTest（真 listener，无 apply 代理）；M5gApplicationConfigurationTest 的真实 select/clear listener + Session/Job/RenderGuard；原代理 before/after 多 store 断言映射后保持资料事实 |
| C3 配置读取 → 设置行/列表、DeepSeekConfig → CaptionApplication/settings/CONFIGURATION | 坏 names/active/endpoint/model/prompt/secret/enabled 用真实偏好读写进入真实读取；原 UI/快照异常或身份不一致有红测。真实 AES/GCM/受控 SPI 保留；不是用户偏好/硬件认证 | **已修规定路径**：严格不可读、无新请求、旧 scope 撤权、初始化不写；实际 URL/model/key/开关及有效列表选择可局部恢复。坏 index、隐藏 prompt、原 origin 丢失的备份/明确清 key 限制 **有依据保留**；通用恢复/迁移工具 **需独立决定** | M5hConfigRecoveryTest、实际应用/后台快照测试；invalid endpoint 的真实编辑恢复及原密文/origin/其他 profile/key 断言 |
| C4 字段 save 的 apply-after / drop → 保存反馈 | 代理 after 可在新密文已可读时 throw；真 listener 证实内存变化后异常机制。代理 drop 则方法返回而旧 key 仍在；它违背通常 apply 内存更新语义，只是丢写替身，不能据此称 Android 真实磁盘满 | after 的反馈/内存变化同步 **已修规定路径**；drop/异步磁盘确认 **有依据保留限制**：save 返回只承认本方法返回，未给物理落盘保证。跨 store 事务/commit/fsync/进程重启确认 **需独立决定**，本卡未实现 | 原 applyDropCanReportSaveSuccessWhileOldCredentialRemains（原断言保持）；keyEditor…AfterApply（反馈和通知按新合同映射）；真 endpoint listener 测试 |
| C5 getView/onCreateView、detach、flush/debounce/profile revision | 原生产中真实重建丢 URL 草稿、detach 清失败 key、multiline 错误丢失；已 dequeue 旧 callback 可在新绑定写入，均动态红测 | **已修规定路径**：同绑定保留草稿/错误/提交标识；真正切换/删除仍撤权；旧 editor/profile/revision 三重归属拒绝迟到回调。Activity 被彻底销毁/进程死亡不新增持久草稿恢复，**有依据保留限制** | M5hEditorProtectionTest 的实际 getView 新 row、实际 attached host detach、旧 EditText 和 dequeue Runnable 调用；旧 UI/snapshot/C1 回归 |
| C5 save 返回 → saved/model callback → CaptionActions → application refresh/style | 局部 callback 失败及真实应用到 style 的后置失败有动态测试，字段数据确已保存；设备显示替身负责主动抛错，未称正常设备必然抛错 | **已修规定路径**：保存与通知事实分开，模型通知失败仍刷新 runtime，显示同步失败并可点行内重试，不重复写；raw 边界主异常/通知异常合理区分。真实消费者永不失败/任意线程交错 **有依据保留限制** | M5hEditorProtectionTest 的 callback 测试；M5gApplicationConfigurationTest 的真实应用后置失败/显式重试；R1 原主异常/suppressed/次数回归 |

## 5. 验证层级、断言映射与未认证范围

M5h 测试采用真实 ApiProfiles/DeepSeekConfig/SecureApiKey、真实偏好读写、真实 AES/GCM（Conscrypt）；测试 provider 只替换 AndroidKeyStore 查询/拒绝生成，不整体 mock load/decrypt。Models/Actions 的局部 spy 仅用于计数/回调拒绝；应用测试实际安装 CaptionApplication 到 CaptionActions/TranslationRuntime，经真实 controller 撤权，设备显示/原生扫描替身不等于设备渲染认证。后台线程用有界 Executor/Future，并恢复 provider、ProxySelector、编辑器/端口/队列/静态归属；无新 Thread.sleep、扩大等待或整测重试。所有未映射连接和模型发现拒绝，零外部请求。

M5f 七个与新合同直接冲突的方法按实际旧→新映射：四个坏读取改明确 unreadable/未就绪、after-key 写入改不确定反馈并同步、after-active 改 revision/通知、partial-delete 改撤权通知且恢复有效测试 index 后再次证明原密文可读。完整原数据/其他 profile 真 key/origin/恢复断言保留或加强。apply-drop 等非冲突刻画及全部既有 C1 通知断言不删减；具体方法差异见入场字节 batch-review.diff 和 test-method-audit.json。

完整入口、实际两组 XML/receipt/源码指纹、同次 compiled、明确 MPP/MPE/UI、身份负向拒绝、指定 21.41.525-SECONDARY / 官方 1.48.0 / Patcher 2.0.0 / 104 默认根真实组合/资源重编译与 DEX 差异以结果报告为准。238 键 × 14 语言只增加本卡六个错误/恢复/同步文字键，旧键值/默认 prompt 保持；不通过重算黄金值消除问题。

SharedPreferences.apply 没有提供持久化成功的 boolean；这里不提供 commit/fsync/重启确认。Robolectric 内存可见、Application Context 重读和真实 listener，不证明进程死亡后读取、断电、磁盘满、卸载重装、硬件 Keystore/OEM 认证。设备、其他组合、远端 CI、真实供应商/费用与任意线程交错分别未认证。没有读取用户真实偏好/密文、填盘、换 alias、做格式迁移、清用户数据或自动重绑。M5e 原始显示交错未知仍保持；本卡不进入缓存/诊断/性能或下一阶段。


## 6. 当前统筹结论

M5h的只读错误/编辑恢复/草稿/后置通知和可观察内存变化撤权经独立127项与843项/组合/资源核验接受，C2–C5保留限制继续按表说明。坏index/隐藏prompt的有效用户备份、原origin不可确认后的明确用户决定，不伪称已有自动恢复工具。下一[M5i](../maintenance/tasks/M5i.md)只处理缓存职责，不重新扩写配置框架或改变本合同正常身份语义。

## M6a局部测量修复：同次请求设置只解析一次凭据（完成待复核）

本配置组原接受身份/范围仍按M5h复核；项目最后接受身份M5i candidate-01，M6a候选local-1.5.8-m6a尚待统筹复核。真实Conscrypt+内存AndroidKeyStore SPI测得旧CaptionApplication.settings经DeepSeekConfig.load/loadChecked后再次SecureApiKey.load，同一快照读取2次。当前严格读取产生临时RequestSettings(provider, apiKey)，应用直接转原TranslationSettings，同输入读数1。UI load/forUserEnable仍只取得无明文ProviderSettings；没有静态/磁盘缓存或格式/alias/origin迁移。

严格字段验证和凭据同在ApiProfiles.LOCK，坏元数据返回关闭且空key，origin不匹配不释放旧key；读取不写回，正常保存、失败草稿、通知撤权、C2–C5保护及多store/orphan/硬件限制保持。用户主动save独立执行其Crypto；播放time/动画/preview不因此加入解析。测量及872项统一验证见[M6a结果](../maintenance/results/M6a-RESULT.md)和[诊断/性能合同](DIAGNOSTICS-PERFORMANCE-CONTRACT.md)，不把SPI读数换算成设备延迟。
