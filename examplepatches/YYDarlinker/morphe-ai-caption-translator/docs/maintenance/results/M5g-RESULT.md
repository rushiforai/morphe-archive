# M5g v1 结果：部分字段保存后同步实际配置，保留失败草稿

日期：2026-10-25（Asia/Shanghai）。本卡执行完成，统筹状态保持待复核；执行到此停止。生产版本为 **1.5.8**，本地 build ID 为 **`local-1.5.8-m5g`**，公开版本仍为 **1.5.7**。本轮复用分支 `codex/fix-cc-authority-1.5.8`、HEAD `de844402776e1046a5bec87aac94e2e65f05bea7` 和现有脏工作树；入场状态、身份、目标文件哈希保存在 `validation/runs/20261025-M5g-01/entry-status.txt`、`entry-identity.txt`、`entry-head.txt`、`entry-target-hashes.json`。

本卡只关闭 C1 的通知/运行作用域缺口。实现继续采用逐字段自动保存：已成功字段保持生效，后续字段拒绝或抛出时 active 仍不切换，失败字段草稿和错误保留；只要本次 flush 已有成功字段，失败路径在 `flushing` 清理后向实际 `CaptionActions.CONFIGURATION` 边界补发一次刷新。正常成功切换仍由最终 `changed()` 发送一次通知，全部拒绝或无改动不刷新。没有引入跨 store 事务、全表单回滚、自动 key 重绑定、密文清除或配置格式迁移。

## 改动

- `infrastructure/.../ApiProfiles.java`：`Editor` 增加默认的本次 flush 变更标记；`flushCurrent`/`flushExceptKey` 共用的 flush 路径记录实际成功字段，在后续返回 `false` 或抛出时只发一次运行配置刷新，随后保持原拒绝/异常语义。`flushing` 在回调前可靠恢复为 false，不持 `ApiProfiles.LOCK` 做高层通知。
- `ui/.../ProfileEditorPreference.java`：每个显式 flush 清零并计算 `lastFlushChanged`，只有提交值真正替换 `lastCommitted` 才记为成功字段；自动保存仍沿用原即时刷新路径。
- `extensions/.../ConfigCredentialFailureTest.java`：保留 M5f 的真实 Conscrypt AES/GCM、故障偏好代理、origin、原密文、其他 profile/global、失败草稿和恢复断言；将 C1 旧通知刻画 `refreshes=0` 更新为 `refreshes=1`，并新增返回 false、Editor 抛出、`flushExceptKey`、成功切换单通知、无改动不刷新和独立自动保存回归。
- `extensions/.../M5gRuntimeConfigurationBoundaryTest.java`：不 shadow `CaptionActions`，通过真实 `CaptionPort` 捕获 `Action.CONFIGURATION`，并在该边界读取已保存 endpoint，验证应用配置更新确实到达真实 UI-to-application port。
- `gradle.properties`：`captionBuildId=local-1.5.8-m5g`。
- 当前合同、维护入口、路线、架构摘要、PROJECT-STATE 及字节相同镜像已更新；M5f 历史结果和调查证据未改写。C2–C5 仍明确保留待处理。

## 红测与绿测

在生产修复前加入两条应有行为断言，红测命令和实际失败记录见 `validation/runs/20261025-M5g-01/red-test-summary.txt`。真实 URL 先提交、key 受控 Keystore 拒绝，以及 URL 成功后后续 Editor 抛出，两条均在旧实现下因 `refreshes` 仍为 0 而失败；旧实现不会把已保存 URL 的变化通知运行配置。

修复后针对性测试转绿，覆盖：

- 真实 URL/key 编辑的部分成功、`select=false`、active 不变、原密文保持、origin 保护、失败 key 草稿和恢复重试；
- 部分成功后 Editor 返回 false 与抛出，异常/拒绝语义保持，`flushing` 清理；
- `flushExceptKey` 的直接入口；成功切换只发一次最终通知；独立 debounce 自动保存及时刷新；全部拒绝和无改动不刷新；
- 迟到编辑不能写入新 profile，其他 profile/global 不改；
- 不 shadow `CaptionActions` 的真实 `Action.CONFIGURATION` 边界：部分 flush 后命令恰 1 次，运行边界读取到 `https://edited.invalid/v1`。

针对性测试 XML 和同次 compiled/receipt 由完整入口归档；extension 中 M5g 配置边界相关 XML 包括 `ConfigCredentialFailureTest.xml` 与 `M5gRuntimeConfigurationBoundaryTest.xml`。

## 完整入口与候选

实际命令：

```powershell
.\.devenv\verify-full.cmd -RunId 20261025-M5g-candidate-01 -EvidenceDirectory validation/runs/20261025-M5g-01/final -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m5g -Offline -RerunTests
```

结果：`summary.json` 状态 `passed`；localization、source boundaries、release/verification contracts、metadata、Gradle、bundle、boundaries、credential scan 全部退出 0。core **320** + extension **488** = **808**，失败/错误/跳过均为 0，两组测试均为本轮实际执行；source fingerprint 为 `179a05037e3fad027687f479857ff7d87ccb172e527b0186b41be021ebb9575f`，验证期间源码未变化。完整 XML、receipt、同次 compiled、日志和 manifest 均在 `validation/runs/20261025-M5g-01/final/`。

候选身份：

- MPP：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5g-candidate-01\patches-1.5.8.mpp`，587,225 B，SHA-256 `283b9f0b70c0e75cb6af5f729a5b942ec3173a8b7c2123963249729d068249ae`。
- 独立/内嵌 MPE：SHA-256 `78a1d24629b309579d63a3f0e8149931808c1a6a3468f349e67a9f1f338ce2aa`，bundle boundary 通过。
- UI preview APK：SHA-256 `34c0647a53f7188fdaebc79dd6090302f69717244ca30a8e85bc26ae9f249fbe`，UI boundary 通过。
- `verify_bundle.py`、来源/compiled/包边界、公开 release 身份拒绝和凭据扫描均按本轮候选实际路径通过；没有把公开 1.5.7 包冒充本轮候选。

## 同输入真实组合与 DEX 审计

按 M5g 任务卡执行了与 M5d-R1 相同的组合输入，输出和 receipt 独占于 `validation/runs/20261025-M5g-01/`：

- 原始 YouTube `21.41.525-SECONDARY`：`YouTube/com.google.android.youtube_21.41.525-SECONDARY-1561303419_minAPI29(arm64-v8a,armeabi-v7a,x86,x86_64)(nodpi)_apkmirror.com.apk`，SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`。
- 官方 Morphe Patches `1.48.0`：`.tmp/n72-shorts/patches-1.48.0.mpp`，SHA-256 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`。
- Patcher `2.0.0`：实际 classpath `C:\Users\14776\.m2\repository\app\morphe\morphe-patcher\2.0.0\morphe-patcher-2.0.0.jar`，SHA-256 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`。
- 选择：`AI caption translator`，harness 实际读取 **104** 个官方默认根并归档为 `composition-M5g/official-defaults.txt`；选择文件、结构文件和命令/输入/receipt 均保存。
- 资源重编译/组合命令：`validation/runs/20261025-M5g-01/run-composition.ps1`；`composition.log` 和 `composition-exit.json` 退出 0。
- 输出未签名 APK：`validation/runs/20261025-M5g-01/composition-M5g/patched-unsigned.apk`，227,115,209 B，SHA-256 `61982bea6b5d9768f53c5550575b1edffe0d63eb123b5a31c702a8e15a4f709c`。
- 现有 DEX 审计：`composition-audit.log` / `audit-exit.json` 退出 0，包含 `DEX_AUDIT_PASS classes=64565`；未签名、未安装，不宣称设备运行或真实服务质量。

## 保护、未覆盖与回退

本轮保留 origin、原密文、其他 profile/global、active、失败草稿、迟到 editor 绑定、模型/网络合同、线程/队列清理和全局公开版本。所有网络只使用本地 fixture 或明确拒绝；未访问真实 YouTube、模型发现或付费 API。

C2 多 store 部分失败、C3 坏数据可读错误/恢复、C4 代理 after/drop 的提示/落盘一致性、C5 recreate/后置回调风险仍未处理；真实磁盘落盘、进程重启、断电、硬件 Keystore、设备、远端 CI、其他组合、任意线程交错和真实供应商仍未认证。`apply` 返回不是 fsync 或持久化 receipt；本卡不把运行配置刷新写成落盘确认。

安全回退只针对本批次：先核对退出哈希 `validation/runs/20261025-M5g-01/exit-target-hashes.json` 与入场哈希 `entry-target-hashes.json`，批次生产差异见 `m5g-production.diff`，逐文件确认目标文件仍是本轮退出版本，再恢复入场字节；不得用 `git reset --hard`、`git checkout --`、`clean` 或覆盖用户在本轮之后产生的修改。保留本轮结果、候选、组合输出和历史证据；不回退 M5f/M5e 原件。

统筹复核前不进入 C2–C5、缓存、诊断、性能或其他维护任务。
