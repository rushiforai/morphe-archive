# N32 本地测试交付：修复设置类型与窗口所有权，重新交付 AI＋Remember 两根

日期：2026-10-03（Asia/Shanghai）。本报告只记录本地可复现证据、正式包字节身份和已知边界。最终门禁由 `tools/n32/finish_evidence.py` 生成：缺少证据记为 `PENDING` 并以非零码退出，证据矛盾记为 `FAIL`，只有所有必要证据闭合才记为 `PASS`。

<!-- N32_DYNAMIC_SUMMARY_BEGIN -->

**尚未运行最终证据门禁。** 运行 `python tools/n32/finish_evidence.py` 后，本段会由门禁用最终结果、哈希和证据路径回填。未执行的检查不能在这里写成通过。

<!-- N32_DYNAMIC_SUMMARY_END -->
## 当前状态：按用户反馈暂停，不作为交付包

用户在 2026-10-03 试用临时包后报告了三个发布阻断问题：设置页中的“测试 API”“刷新模型”“保存诊断”等点按没有反应；自动翻译语言窗口的视觉风格没有与 Morphe 设置界面及 N30 保持一致；繁体标签显示为“中文（繁体中文）”。这些现象是在本轮最终门禁之后由用户实际观察到的，当前报告不把它们解释成已修复，也不把这组三件套标为可安装交付。

本地 SDK35 宿主已保留语言窗口真实 attach/token、确认后语言刷新、平台 fallback 和生命周期证据，但最终正常流程仍有阻断：`after-final-attempt01`/`02`/`03`/`04` 在模型 PopupWindow 主流程处失败，未形成完整 after PASS。此前的 695/695 Java 全量、设置 DEX 审计和九个序列化负例，只证明静态/离线合同与已覆盖分支，不能覆盖用户新报告的点按无响应或视觉一致性。

本卡在此停止修复工作。当前源码、失败宿主事件、before/候选包、最终未签名包和审计日志均保留在本地；下一张任务应先复现并修复上述交互与文案/样式问题，再重新生成和验收包。物理 SDK37 手机没有安装本轮包，未执行手机写入、清数据、推送或发布。

## 基线、两个实机 before 与根因

唯一工程是 `E:\Projects\morphe-caption-v2`。N32以恢复的N31产品 `dc304cbe3ae995e7e0edad2754b160c959cafce3` 为业务基线，不整仓回退N30；N30只提供窗口所有权合同。开工及历史保护证据见 `.verification/n32/input-manifest.json`、`.verification/n32/delivery-records/history-after.json` 与 `.verification/n32/delivery-records/scope-proof.json`。

两份实机 before 必须分开引用：

| 阶段 | APK身份 | 现场结论 | 证据 |
|---|---|---|---|
| 原N31，设置不能加载 | 199,529,446 bytes；SHA256 `FB7B28B425A3DCE8884EF9BBFEB6EF8D93FC7B782B9E2E24EDC472D9A9116C38` | SDK37 ART `VerifyError`：设置初始化的receiver寄存器实际是 `PreferenceScreen`/synthetic lambda，却按 `PreferenceFragment` 形参调用 | `.verification/n32-device-review/device-input.json`、`phone-crash-key-lines.txt` |
| 可加载撤回版 | 199,529,446 bytes；SHA256 `BFF42C488842FE793BCEA5028208D23FE47F831B867480676FAA99AB86E2E111` | 真实语言行点击经过官方 `PreferenceScreen.onItemClick → DebouncedItemClickListener → Preference.performClick → CaptionLanguagesPreference.onClick → showLanguages`，在 `Dialog.show` 以 `token null` 抛 `BadTokenException` | `.verification/n32-device-review/navigation-current-input.json`、`withdrawn-navigation-root-cause.json` |

第一根是设置 hook 的ART类型错误。最终检查必须验证Fragment入口、PreferenceScreen树、写入 `MORPHE_LANGUAGE` 后的刷新receiver、确认框写入后的receiver，以及异常/取消/返回路径的类型和时序；不能用 `check-cast`、吞异常或按lambda名字猜寄存器来规避验证。第二根是N31把本地化资源Context当成普通Dialog的窗口owner。`createConfigurationContext`能提供locale资源，却不能提供设置Activity的window token；复制Theme也不能恢复Activity归属。N32把资源Context留在文本/布局职责，普通Dialog由当前有效设置Activity或以它为base的wrapper拥有。无owner、finishing、destroyed、旧页面或旧View失效时安全拒绝并保留用户数据。

`docs/N32-WINDOW-OWNERSHIP-INVENTORY.md` 是窗口构造点、owner来源、生命周期和验证边界的逐点清单。它覆盖14语言多选、官方CustomDialog和platform fallback、API profile、model popup、Key/诊断确认、Android9分段复制、异步UI回调、PopupWindow与Toast的不同token合同。N32不把Toast或纯字符串读取误改成Dialog owner问题。

## 交付内容与功能合同

最终文件名固定为：

- `build/local-test/patches-1.3.5-本地测试包-n32.mpp`
- `build/local-test/extension-1.3.5-本地测试包-n32.mpe`
- `build/n32-composition-final/YouTube-21.16.256-本地测试包-n32-unsigned.apk`

MPP必须含Android root DEX；其中 `extensions/extension.mpe` 必须与独立local-test MPE及 `extensions/extension/build/morphe/extensions/extension.mpe` 逐字节相等。最终APK的全部 `classes*.dex` 必须与正式资源合成产生的 `build/n32-composition-final/serialized-dex.zip` 逐entry相等。报告中的字节数和SHA256由最终门禁从这些路径重新读取；旧包或临时composition不能代替当前交付包。

公开根恰好两根：`AI caption translator` 与 `Remember caption selection`。AI安装但运行关闭时仍能保存语言选择；Remember-only不注入语言、不发API；AI-only不带记忆副作用。正式MPP metadata计数为2，非空AI-only、Remember-only、AI+Remember三组合都用实际序列化DEX审计，同一进程重复加载后不能泄漏旧feature状态。简体中文属于14个候选及用户selected_codes，不保留冗余的第三个public root。

## 验证分母与可复现输入

N32最终Java全量预期为695：N31原680，加上本卡类型/窗口合同新增13项及功能合同净增2项。门禁同时保存并校验以下结果身份：

- full final：695 tests，failure/error/skipped均为0；
- 已保存的 full-final-01：695 tests、2 failures，作为失败现场保留，不能被覆盖成PASS；
- special final：70 tests，failure/error/skipped均为0，其中含中文18组原方法/原样本/原断言回放；
- main final：11 tests，failure/error/skipped均为0；
- custom final：9 tests，failure/error/skipped均为0；
- full与special各执行200轮调度回归，合计400轮；门禁同时核对源码中的200轮循环与两份成功结果。

每一份最终Java结果必须有自己的 `inputs.json`，门禁会按Windows路径规范化后逐文件重新计算SHA，并验证full/special/custom的输入文件集合和 `input_sha` 完全一致。main的输入清单单独校验，允许其为11项专项运行自己的输入身份。JS输入路径、最终包路径和嵌入MPE比较都使用规范化后的绝对路径，避免把Windows反斜杠差异当成新输入。

中文golden是raw比较：`.verification/n31/n30-chinese-before/legacy-activate.json` 与 `.verification/n32/special-final/legacy-activate.json`，以及对应的 `legacy-region-golden.json`，必须逐字节相等；region文件必须保持18组。历史英语UI请求的授权漂移保留在旧N30证据中，不改旧样本来翻绿。

冻结事实继续是4通过、4失败、4未验证；`pending_translation`、`event_review`、`overflow` 的 `invisible_ms` 必须都是0。`ACCEPTANCE.md`必须与开工manifest一致且git工作树/暂存区无差异。234个资源键覆盖14个locale的分母由最终localization日志核对，不能用旧的234以外分母替代。

类型门禁要求同一最终审计链中至少5个typed settings seams，并有至少8个序列化负例被拒绝；当前实现的SettingsHookRegression目标为9个负例。root DEX、MPP、MPE、APK分支审计必须逐项记录DEX units/classes/methods/branch edges，并保持 `invalid_branches=0`、`dex_problems=0`、`binding_failures=0`。另外需要资源/CRC结构报告、fresh aapt的minSdk28与YouTube 21.16.256、verify_bundle provenance、官方CC链和metadata的2根报告；缺任何一项，门禁保持PENDING。

## 真实窗口证据与边界

主after必须来自最终source的SDK35本地ART/WMS fixture，并且其 `host-inputs.json` 的APK路径、字节数和SHA绑定当前unsigned APK。主流程必须包含真实设置树中的官方初始化、实际ListView行点击、14项语言Dialog可见、Cancel、Save和返回链；Dialog root须attached、拥有有效window token，同一Activity不能跳出或重启。platform fallback另有独立SDK35证据，但不能冒充正式官方分支。

`.verification/n32/ui-host/before-typed-safe-attempt05/ui-events.json` 保留资源Context owner失败的真实BadToken before。旧provisional、fallback和失败attempt全部保留；最终门禁只接受 `after-final*/ui-events.json` 的成功navigation事件，并要求其绑定当前APK。

本报告明确不把本地SDK35 fixture写成用户手机after。物理SDK37手机after尚未覆盖；用户没有被自动安装、卸载、启动页面、清日志、清数据、推送探针或写入MPP。官方YouTube native视频启动、真实provider/API fetch、SDK28实体系统、软键盘完整视觉矩阵和14语种母语审阅也不由本地fixture推导。用户看到的“通用页”在BadToken前的独立视觉来源没有被采到，报告保留为UNKNOWN；不捏造General路由，也不把本地宿主当作首页/native video证明。

## 重跑入口、失败语义与最终用户短验

在最终Java和最终包均稳定后，按顺序保存结果并运行：

```powershell
powershell -File tools/n32/run_tests.ps1 -Label full-final-02
powershell -File tools/n32/run_tests.ps1 -Label special-final
powershell -File tools/n32/run_tests.ps1 -Label main-final
python tools/n32/verify_host_resources.py
python tools/n32/verify_aapt.py
powershell -File tools/n32/run_final_audits.ps1
python tools/n32/write_combinations.py --combinations
python tools/n32/write_combinations.py --same-process
python tools/n32/finish_evidence.py
```

`finish_evidence.py` 会把完整结果写到 `.verification/n32/delivery-records/final-summary.json`，并回填本报告上方动态表。退出码为0才是本地证据闭合；退出码2表示仍有PENDING，退出码1表示已有证据互相矛盾。它不会因为存在旧的full-final失败结果、provisional宿主或fallback宿主就把当前最终包判为通过。

用户自行传包、合成并签名覆盖安装后，只需短验：打开Morphe设置，从Video进入AI子屏，点真实语言项，确认14项语言窗口、保存/取消/返回；再查看AI-only、Remember-only及AI+Remember三根状态，以及清Key/诊断确认/model popup等几个共享窗口。保持系统语言，只在Morphe内切换中文→日语→英语并查看说明与selected_codes。用户安装/签名之后的结果应单独记录，不回写本地before，也不要求重装旧坏包。

<!-- N32_DYNAMIC_ARTIFACTS_BEGIN -->

最终三件套的完整bytes/SHA256由 `final-summary.json` 的 `packages.artifacts` 提供；在最终门禁运行前不在这里复制临时包身份。

<!-- N32_DYNAMIC_ARTIFACTS_END -->

本卡交付范围到本地可复现包、审计和边界报告为止；不上传、不发布、不自动安装，不引入远程API、下载或新依赖。
