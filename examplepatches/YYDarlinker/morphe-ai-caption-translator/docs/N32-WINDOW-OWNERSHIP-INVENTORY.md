# N32 设置窗口所有权与调用点清单

**状态（2026-10-03）：暂停交付。用户实际反馈测试 API/刷新模型/保存诊断点按无响应、语言窗样式与 N30 不一致、繁体文案错误；最终宿主的模型 PopupWindow 流程仍未形成 after PASS。以下证据只表示已覆盖的分支，不表示当前包可交付。**

日期：2026-10-03（Asia/Shanghai）。本表把资源语言和 Android 窗口 owner 分开记录。代码核查完成；最终 APK 的真实 WMS 状态将在精确最终输入可用后更新。

## 上下文与 token 合同

- `CaptionUiLocale.snapshot/context` 返回设置资源快照。`ResourceContext` 使用 `createConfigurationContext` 读取 Morphe 语言资源，并仅弱引用原始 Context；它本身不作为 Dialog 的窗口 owner。
- `CaptionUiWindows.unwrap` 可穿过 ContextWrapper 和 ResourceContext 的原始 Context。不能直接找到 Activity 的设置 Context，只能来自实际 `onSettingsLoaded(fragment)` / 同树 View 的显式绑定；不查询“最近 Activity”全局变量。
- `Session.context` 是以有效 Activity 为 base 的 ContextThemeWrapper，保留 source 设置资源的完整配置（包括字号），再施加 UI Locale、继承 Activity 主题。Activity decor 必须已 attach、有真实 token、未 finishing/destroyed、未 stopped，且调用在主线程。
- Session 固定 owner、token 与 lifecycle epoch。`show` 再验三者；`guard` 要求原 Dialog 仍显示。`Lease` 固定实际请求 View、Activity、application token 与 epoch；View detach / stop / destroy 后旧回调不能借新 owner 继续。
- 同 owner/operation 的可见 Dialog 通过 `find` 合并；stop/destroy 关闭该 owner 的 Dialog/Popup。失效 owner 绑定被拒绝，销毁后的 state 不复活；竞争设置树 Context 不转给另一 Activity。

## 全部自有窗口调用点

| 调用点 | 资源 Context | owner / token | 退出、失效和数据保护 | 实际覆盖状态 |
| --- | --- | --- | --- | --- |
| `CaptionLanguagesPreference.showLanguages` | 原 Preference Context 的 Morphe Snapshot；14标签用同一个 Locale | `acquire(context,"languages")`；Activity rooted display 给 AlertDialog.Builder | operation 合并；Positive 保存前 `window.current`；Cancel/Back 不保存草稿 | 最终 WMS 待跑；before 原 ListView/debouncer 实际点击已报 token null |
| `CaptionSettingsDialogs.show` 官方 `CustomDialog.create` 分支 | 字符串和自有 content 保持资源 Context；刷新已绑定控件 | `acquire` 后给官方 create 的是 Session display；通过统一 show 挂窗 | 自有 Dialog close；scroll 和 footer 属于同一个 Dialog；operation 合并 | 最终官方 profile list/add WMS 待跑 |
| `CaptionSettingsDialogs.show` 平台 fallback | 同上 | 只有官方类/方法不可用时走 AlertDialog.Builder(Session display) | 同一 Session show / owner 检查；失败的 content 挂接先解除 | source02 MPE 真实 SDK35 WMS PASS：fallback-final-attempt01；最终 source03 完整字节尚待重跑；不改正式 APK DEX 强制 fallback |
| `CaptionSettingsDialogs.confirm` 官方 CustomDialog 分支 | 标题/消息/两个按钮用 Morphe 字符串；官方 chrome 保留 | `acquire(context,"confirm:"+title)`，Activity rooted display 给 create | confirm Runnable 经 Session.guard；显式 Cancel/confirm 修复官方系统 Cancel 资源问题 | 最终 clear-key、diagnostics confirm WMS 待跑 |
| `CaptionSettingsDialogs.confirm` 平台 fallback | 同上 | AlertDialog.Builder(Session display) | Positive 同一 guard；Cancel 不执行确认 | source02 MPE fallback WMS PASS：普通窗+确认窗均 attach/token 非空；最新 source03 待重跑 |
| `ApiProfilesPreference.showList / addProfile` | Preference Context；已有 profile 名原文保留；通用 label 经绑定刷新 | 共用 `CaptionSettingsDialogs.show`；`dialog/listDialog` 保存同一实际 Dialog | 旧 dismiss 不清新 row；add/save 要求当前可见 Dialog和有效 owner；rename/delete 是 Dialog 内行控件，不另造窗口 | 最终实际 profile list→add→Cancel 待跑；rename/delete 数据合同由单元矩阵覆盖 |
| `ApiProfilesPreference.clearCurrentKey`（由 Delete Key 行调用） | Preference Context；active profile 名原文 | 先 valid 再 common confirm；固定发起的 profile id | confirm 的 Session.guard 保护清除操作；Cancel 无清 key | 最终官方列表点击 clear-key confirm 待跑 |
| `DeepSeekDiagnosticsPreference` clear confirmation | 原 inline content Context | 共用 CaptionSettingsDialogs.confirm | 同一 guard，取消不清诊断 | 最终 shared helper 的实际诊断确认窗待跑；从已显示 inline clear Button 的点击由既有单元矩阵覆盖 |
| `DeepSeekDiagnosticsPreference.copyPages` | 原报文不翻译；页标签/提示用 Morphe UI语言 | `acquire(context,"diagnostic-copy")`；AlertDialog.Builder(Session display) | 页点击先 current；owner 无效不改 clipboard，不继续挂窗 | SDK35 上实际执行 Android9 copy-pages 方法分支待跑；不是 SDK28 系统覆盖 |
| `DeepSeekModelPreference.showModelMenu` | anchor 与 popup 内容沿 Preference 的资源 Context | PopupWindow 必须经 `CaptionUiWindows.popup`；实际已 attach anchor 的 application token 与 Activity 匹配 | profile/revision/current anchor 检查；anchor detach 与 owner stop/destroy 关闭 popup；旧 row 不向新 owner提交 | 最终真实 inline anchor click 的 WMS popup 待跑；两条离线 fixture 模型名，不发 fetch |

## 非自有 Dialog 的 UI 接缝

| 接缝 | 窗口关系和行为 | 覆盖边界 |
| --- | --- | --- |
| 官方 `YouTubePreferenceFragment → ToolbarPreferenceFragment → AbstractPreferenceFragment.initialize` | 保留官方 PreferenceScreen、PreferenceGroupAdapter 和 native Dialog 路由；binder 只绑定自有键 | 四个真实 ART 类、官方 initialize 和语言 SharedPreferences 回调在宿主运行；不把类加载单独当作列表导航通过 |
| 官方 Video / AI / General PreferenceScreen | 原 Native PreferenceScreen Dialog 和原列表 delegate；General 不新增自有 route | 实际 root→Video→AI→语言 Save/Cancel/Back；AI→Video→root→官方 General→Back 待最终 WMS |
| `CaptionPreferenceBindings.onSettingsLoaded/onSettingsView/rebind` | 初始化时绑定实际 Fragment Activity；View 刷新仅自有 Preference identity；不替换 root、官方 row delegate 或 General listener | final DEX 静态 receiver/数据流审计与实际 UI 两份证据分别记录 |
| `DeepSeekActionPreference.testApi` | 工作线程之前捕获原请求 View Lease；回来必须同 View、current Lease、同 profile，才更新 UI/Toast | 不发远程 API；Lease/旧 callback 的生命周期拒绝由 WMS 生命周期与单元矩阵验证 |
| `DeepSeekDiagnosticsPreference` background export | 捕获 Save Button Lease；return UI 前验相同发起 View/owner；Android9 回来再调 copyPages | 宿主直接执行 copyPages，未导出 MediaStore 文件；SDK28 文件导出分支未在实际 SDK28 系统运行 |
| `DeepSeekTextPreference / SliderPreference / DisplayTextDebugPreference` | 自有 inline editor、slider、诊断展开内容，未新增 Dialog | 实际设置树包含这些真实类；对应文本/profile/字节、语言、尺寸主题完整矩阵由专项测试记录 |
| `InlineCaptionEditor` 和 profile rename IME | IME 系统管理；View的 attach/当前 row 保护延迟请求；不是以资源 Context 构建 Dialog | 本宿主未声称完整软键盘视觉矩阵 |
| `Toast.makeText`（actions/quick toggle/profile/diagnostics） | Android Toast API接收 UI资源 Context，由系统Toast管理；不以缺 Activity token 的 Context 直接 add Dialog | 异步 owned UI结果由 Lease/guard 控制；未把系统 Toast token 与 Dialog token 混为一谈 |

## 证据和设备边界

- before：`.verification/n32/ui-host/before-typed-safe-attempt05/ui-events.json`。原历史 typed-safe APK的全部根 DEX/资源原样进入 test-only宿主；真实官方初始化、Video→AI→普通语言 Preference 的 ListView/debouncer 点击，ART堆栈从 `CaptionLanguagesPreference.onClick/showLanguages` 到 `WindowManagerGlobal.addView`，最终 `BadTokenException: token null`。原事件和旧产物保留。
- after 正常接缝阶段证据：provisional01-attempt03 的4个ART类和官方 initialize 通过，实际官方列表→语言窗2次可见，Cancel保留集合，Save保留 ja/fr 并加入 zh-Hans；AI仍显示、同Activity。此attempt在第一个官方语言变更确认前停止：官方的 user-confirmation 弹窗尚未点OK，缓存枚举仍DEFAULT；这不证明产品语言回调失败。宿主已补原生OK→取消原生restart提示，同时记录真实listener/持久值。
- after 最新最终 source03：待root quiet Java全量后提供GO与最后输入。宿主只替换 Application/native video startup/manifest，并增加测试 Activity DEX；从正式合成 APK 保留所有根 DEX、resources.arsc、res、assets 的字节和 SHA。`host-inputs.json` 将绑定输入 SHA 和每个保留 entry。
- fallback：另以独立真实 MPE raw DEX 构建测试宿主，官方 CustomDialog 真正不存在，以验证实际平台 fallback；这是备用分支证据，不宣称等于正式 APK 的正常官方分支。
- 所有 ADB 写操作固定 `emulator-5580`，先确认 model含SDK且SDK=35；不自动选择设备。不向物理手机写文件、安装、启动、清数据或执行探针。安装的是 debug test-only宿主，绝不是最终交付 unsigned APK。
- 附带PNG来自实际已 attach Android View 的 `draw`，用于检查真实绘制结果；窗口 token 和 ART/WMS结果才是挂窗证据。不是shadow、mock窗口或SDK37手机截图。
- 物理 SDK37 after、完整 YouTube native视频启动、真实 provider/API fetch、实际SDK28系统、软键盘与全部主题/尺寸视觉组合仍按最终主报告明确边界；不能从SDK35局部宿主推成已覆盖。

当前保持：按root要求暂停模拟器运行/大包构建，配合原Main线程2秒冻结时限的串行测试。

source02 fallback已验证MPE SHA256 AE4BDA3B6B686D8DEEE9BAE8B724C8A8F0CC8819D1B9DEAC8E391AE6BBEC380B。两类fallback实际窗口共2个，主结论PASS；它不含source03字号配置一行后续改动，因此不能替代最终字节重跑。
