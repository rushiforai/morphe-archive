# N31 UI 本地化逐角落 inventory

日期：2026-10-03（Asia/Shanghai）。主矩阵为系统/global=zh-CN、原 Activity/Application=zh-CN、官方形态 EnumSetting/AppLanguage 可用且 ResourceUtils 可继续读中文；14覆盖×320/420dp×fontScale1.0/1.3=56真实生成树。官方类缺失的14树降级矩阵单列。每树23个本补丁节点，实际编辑器、Canvas、五档轨道、展开诊断与原生Dialog均加载。

文本依据稳定 Preference key 与资源 key；4个原 keyless 类别新增 cap_ui_category_* 展示身份并 persistent=false。既有存储 key 不变。配置 Context/主题由弱句柄缓存，locale/source/config/resources/theme/density/fontScale/屏幕指标参与身份；不缓存译后文案，主题每次从原主题复制。

刷新：实际 XML 装配完成、官方设置创建/语言变更回调、子屏点击、原生 ListView 全局布局（依据 adapter 的真实 Preference 对象身份）、自有 onBind/getView；后台结果在主线程按当前 key+状态+raw 参数呈现。用户输入没有子串本地化。技术正文固定英文；旧 raw record（含旧中文）原样保留，不重写。

## 可见控件与数据分层

| 文件/方法与身份 | key / 格式参数 | 类别与语言来源 | 刷新与14结果 | 实际证据 |
|---|---|---|---|---|
| CaptionPreferenceBindings.bind / morphe_vot_screen__ai_captions | ai_title / ai_summary | UI；统一快照 | 装配/语言更新/重开，14 PASS | .verification/n31/full-final-04/tree-{locale}.json / controls-{zh-CN,ja,en,fr,ar}.png |
| DeepSeekEnabledPreference.updateSummary / enabled | enable_ai / message_7b7480271fa5 / message_1cc3c4b0aab0 / message_2c107e436145 | UI+原启用/Key状态 | 绑定/用户切换；14资源与实际行 PASS | .verification/n31/full-final-04/tree-{locale}.json |
| CaptionFlyoutPreference / CaptionShortsFlyoutPreference / flyout | flyout_title/summary / shorts_flyout_title/summary | UI；统一快照 | 绑定，14 PASS；布尔存储不变 | .verification/n31/full-final-04/tree-{locale}.json |
| CaptionQuickToggle.label / 唯一播放器入口 | ai_quick_toggle_on/off（完整句） | UI；统一快照 | 每次菜单读取；14作者值；原main菜单测试 PASS | .verification/n31/full-final-04/Java XML / N30LocalizationRuntimeTest |
| CaptionLanguagesPreference.refresh / languages | languages_title / languages_summary | UI；固定功能说明 | 空集/保存/取消/重绑均保留，14 PASS | .verification/n31/full-final-04/n31-languages-dialogs.json |
| CaptionLanguagesPreference.showLanguages / 14 CheckedTextView | LanguageMenuOrder.label(code, ui.locale)；languages_save / cancel | UI语言名；纯display参数 | AI off/on、全部14勾选保存/重开、取消，14 PASS | .verification/n31/full-final-04/languages-{locale}-{false,true}.json |
| 历史 languages_existing/new/unavailable/entry/empty/count | 历史资源；无用户行；无数量追加句 | 不再显示；内部能力/去重/排序不变 | 最终DEX无 languageStatus UI调用；14行精确纯名称 | .verification/n31/full-final-04/N31RuntimeUiTest / final DEX audit |
| CaptionPreferenceBindings.bind / 4 cap_ui_category_* | api_config / translation / style / cache_diagnostics | UI；统一快照 | 装配/重绑/滚动，14 PASS | .verification/n31/full-final-04/tree-{locale}.json |
| ApiProfiles.list / 默认与用户方案名 | profile_default；用户名称 raw | 内建名 UI；用户名数据 | 无写入；用户中文原样，14 PASS | .verification/n31/full-final-04/profiles-{locale}.json / custom prompt test |
| ApiProfilesPreference.showProfiles/showActions/beginRename | profiles_title / profile_add/rename/delete/more/collapse/current/name/name_error/save/cancel | UI外壳；name参数原数据 | 打开/展开/改名校验，14 PASS | .verification/n31/full-final-04/profiles-/profile-rename-{locale}.json |
| ApiProfilesPreference.beginDelete/addProfile/clearCurrentKey | profile_keep/confirm_delete/new_summary/clear_key/clear_key_summary；name raw | UI；用户数据不替换 | 原生Dialog/内联删除/新增/清Key确认，14 PASS | .verification/n31/full-final-04/profile-delete-/profile-add-/profile-key-clear-{locale}.json |
| DeepSeekTextPreference.configureEditor/updateState / 地址、Key | api_address / api_key / key_saved / enter_key / saved / autosave / message_10d1b374429d | UI壳；endpoint/key raw | 创建/绑定/错误/保存；14 PASS | .verification/n31/full-final-04/tree-/dynamic-states-{locale}.json |
| DeepSeekTextPreference.commit/errorText / 输入错误 | message_bafa7b1ca6cb / api_address_invalid / message_7da9039cc193 / keep_last_valid；稳定本地错误code | UI；本地校验独立于文字 | scheme/缺host/credentials/fragment/native端点，14实际getError PASS；值不写坏 | .verification/n31/full-final-04/n31-dynamic-states.json / runtime Java XML |
| DeepSeekModelPreference.setState/setFailure/updatePickerLabel/showModelMenu | model_hint_* / model_loading_* / model_list_updated / model_pick_or_type / model_saved / model_empty / model_load_failed(%s raw) / selected_suffix | UI壳；模型ID/provider raw | 8状态/失败/空模型校验/实际popup，14 PASS | .verification/n31/full-final-04/models-/dynamic-states-{locale}.json |
| DeepSeekActionPreference.testApi/rebindUi / test_api | test_api / message_49562bf14c82 / api_test_retry_hint / api_test_ok/failed(%s raw) | UI状态+未翻译响应；可用性boolean | 受控UI状态14；既有真实loopback API测试；远程0 | .verification/n31/full-final-04/n31-dynamic-states.json / Java XML |
| DeepSeekTextPreference.initialValue/rebindUi / prompt | translation_requirements / prompt_summary / default_prompt / saved | program_default展示UI；stored_custom原数据 | 只换UI不保存；相同日语模板的显式用户paste保留custom；清空才恢复，14 PASS | .verification/n31/full-final-04/n31-default-layering.json / N31RuntimeUiTest |
| DeepSeekConfig.load / Snapshot.prompt/effectivePreference | 中文固定DEFAULT_PROMPT；非中文既有effectivePreference；stored_custom raw | 业务；不来自UI资源 | 5 UI语言×3目标×2 provenance 请求JSON/hash/cache稳定；修前漂移另存 | .verification/n31/full-final-04/n31-prompt-request-cache-matrix.json |
| SubtitleStylePreview.Preview.onDraw/sampleLabel / Canvas | preview / preview_hint / preview_sample / 16:9技术比例 | UI；不使用视频RenderSpec方向 | 真实测量/绘制/sample/CD，14×4 PASS | .verification/n31/full-final-04/controls-{locale}.png / tree-{locale}.json |
| DeepSeekSliderPreference.tierLabel/updateTierNames/tierDescription / 5档 | size / size_tier_xs/s/standard/l/xl / size_tier_hint(%s,%s,%s px) | UI名/无障碍；px技术值 | 5档真实标签与当前档CD、对齐/RTL，14 PASS | .verification/n31/full-final-04/n31-dynamic-states.json / 56树 / 原轨道回归 |
| DeepSeekSliderPreference / opacity | opacity / opacity_hint / 百分比数值 | UI+原数值 | 绑定/轨道联动；14树 PASS，松手策略不变 | .verification/n31/full-final-04/tree-{locale}.json / 原slider测试 |
| DeepSeekActionPreference.performAction / reset/cache | reset_position / message_fd1ada5395a0 / clear_cache / message_a25bd037963d / message_e8b2177e1cd3 | UI/Toast；统一显示Context | 稳定key；14资源+实际入口；原动作回归 | .verification/n31/full-final-04/tree-{locale}.json / Java XML |
| DeepSeekDisplayTextDebugPreference / text_debug | text_debug / message_261f1c6f0fde / message_f496dd228d0b | UI；原开关数据 | 当前状态重呈现，14 PASS | .verification/n31/full-final-04/tree-{locale}.json |
| DeepSeekDiagnosticsPreference / 展开面板 | diagnostics / diagnostic_hint / diagnostics_hint / expand/collapse / refresh/copy/save_diagnostics/clear_diagnostics | UI；统一快照 | 实际展开/按钮/CD/重绑，14 PASS | .verification/n31/full-final-04/tree-/diagnostic-confirm-{locale}.json |
| CaptionDiagnostics.uiText/fullText / TokenCostAudit报告 | Engine/Mode/Latest stage/技术heading/stage/reason/error code 英文 | 技术；新报告英文，raw evidence原文 | 界面与导出；历史中文原记录不改；provider API0 | .verification/n31/full-final-04/tree-{locale}.json / N25DiagnosticsLocalizationTest |
| DeepSeekDiagnosticsPreference.saveFile/saveReport/copyPages | save_ok(%s name) / save_failed(%s class) / copy_parts_title / copy_part_label/done(%s,%s) | UI外壳；report/文件内容 raw | 后台结果主线程按当前locale；Android9分段复制14实际Dialog/Toast/clipboard PASS | .verification/n31/full-final-04/n31-dynamic-states.json / runtime XML / 原导出测试 |
| CaptionSettingsDialogs.confirm/show / Morphe与platform | 调用者稳定UI键；cancel显式提供 | UI；主题保留；不读官方错误cancel路径 | 公开API/last-child area核查；两种Dialog实现；14 PASS | .verification/n31/full-final-04/custom-host-final / full-final-04 |
| InlineCaptionEditor.performLongClick / 原生粘贴/全选/复制 | android.R.string.paste/selectAll/copy 稳定资源ID | UI；同一14语言配置解析入口；输入raw | 实际inline生命周期/粘贴安全网通过；OS具体菜单母语/手机表现未验收 | .verification/n31/full-final-04/InlineEditorFrameworkTest / stable-key source inventory |
| CaptionStrings.get/settings/localize / fallback | 234键×14；English安全fallback；compat仅已知整句静态UI | UI；未知不声明支持；用户/provider无生产localize调用 | 主/降级逐key作者值；缺资源/重复/错locale/旧解析/缺重绑/状态泄漏负例拒绝 | .verification/n31/full-final-04/mutation-sensitivity.json / 14主与降级树 |

## 全部稳定key调用位置

下表列出实际源码行、所在方法和key/表达式；格式参数、用户/技术边界及刷新身份见上表。所有已声明234键都有14作者值；可见23节点与动态控件按实际View属性检查。未运行手机或14语种母语审校。

| 文件:行 / 方法 | 稳定key或格式表达式 | 来源 / 14结果 |
|---|---|---|
| CaptionPreferenceBindings.java:12 / class/init | morphe_vot_screen__ai_captions, ai_title, ai_summary | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:13 / class/init | deepseek_caption_enabled, enable_ai | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:14 / class/init | deepseek_caption_languages, languages_title, languages_summary | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:15 / class/init | deepseek_caption_flyout_menu, flyout_title, flyout_summary | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:16 / class/init | deepseek_caption_shorts_flyout_menu, shorts_flyout_title, shorts_flyout_summary | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:17 / class/init | deepseek_caption_profiles, profiles_title | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:18 / class/init | deepseek_caption_base_url, api_address, autosave | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:19 / class/init | deepseek_caption_api_key, api_key | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:20 / class/init | deepseek_caption_model, model, model_hint | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:21 / class/init | deepseek_caption_test_api, test_api | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:22 / class/init | deepseek_caption_delete_key, profile_clear_key | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:23 / class/init | deepseek_caption_prompt, translation_requirements, prompt_summary | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:24 / class/init | deepseek_caption_style_preview, preview | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:25 / class/init | deepseek_caption_text_size, size, size_hint | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:26 / class/init | deepseek_caption_background_opacity, opacity, opacity_hint | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:27 / class/init | deepseek_caption_reset_position, reset_position, message_fd1ada5395a0 | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:28 / class/init | deepseek_caption_clear_cache, clear_cache | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:29 / class/init | deepseek_caption_display_text_debug, text_debug | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:30 / class/init | deepseek_caption_diagnostics, diagnostics, diagnostic_hint | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:32 / class/init | cap_ui_category_ | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:38 / bind | String title=CaptionStrings.settings(p.getContext(),keys[0]); | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionPreferenceBindings.java:40 / bind | if(keys[1]!=null){String summary=CaptionStrings.settings(p.getContext(),keys[1]); | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionUiPreference.java:16 / getView | CaptionPreferenceBindings.view(this,result);CaptionUiViewBindings.refresh(result,getContext()); | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionUiPreference.java:21 / onBindView | CaptionPreferenceBindings.view(this,view);CaptionUiViewBindings.refresh(view,getContext()); | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionUiPreference.java:23 / onBindView | void rebindUi(){if(uiView!=null)CaptionUiViewBindings.refresh(uiView,getContext());} | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionUiViewBindings.java:14 / text | render(v,()->CaptionStrings.settings(c,key)); | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionUiViewBindings.java:23 / hint | hint | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionUiViewBindings.java:26 / description | description(v,()->CaptionStrings.settings(c,key)); | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionLanguagesPreference.java:15 / text | private String text(String key){return CaptionStrings.settings(getContext(),key);} | 统一快照；14作者值/对应上述实际控件证据 |
| AddonSwitchPreference.java:22 / onCreateView | CaptionUiViewBindings.description(widget,()->getTitle());widget.setChecked(checked); | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionFlyoutPreference.java:20 / initialize | setTitle(CaptionStrings.settings(getContext(),titleKey())); | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionFlyoutPreference.java:21 / initialize | setSummary(CaptionStrings.settings(getContext(),summaryKey())); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekEnabledPreference.java:56 / updateSummary | message_7b7480271fa5 | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekEnabledPreference.java:57 / updateSummary | message_1cc3c4b0aab0 | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekEnabledPreference.java:58 / updateSummary | message_2c107e436145 | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDisplayTextDebugPreference.java:53 / updateSummary | setSummary(CaptionStrings.settings(getContext(), | 统一快照；14作者值/对应上述实际控件证据 |
| ApiProfiles.java:33 / values | legacy_deleted, profile_default | 统一快照；14作者值/对应上述实际控件证据 |
| ApiProfiles.java:89 / delete | profile_keep_one | 统一快照；14作者值/对应上述实际控件证据 |
| ApiProfilesPreference.java:38 / text | private String text(String key){return CaptionStrings.settings(getContext(),key);} | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekTextPreference.java:113 / onCreateView | CaptionUiViewBindings.render(title,()->getTitle()); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekTextPreference.java:196 / configureEditor | key_saved, enter_key | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekTextPreference.java:244 / commit | message_7da9039cc193 | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekTextPreference.java:285 / updateState | keep_last_valid | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekTextPreference.java:291 / updateState | CaptionUiViewBindings.text(state,getContext(), !SecureApiKey.hasSavedValue(getContext()) | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekTextPreference.java:296 / updateState | saved | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekTextPreference.java:297 / updateState | autosave | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekTextPreference.java:305 / errorText | String known=CaptionStrings.settings(getContext(),key);return known.isEmpty()?raw:known; | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:148 / onCreateView | CaptionUiViewBindings.render(title,()->getTitle()); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:159 / onCreateView | model_hint_manual_only | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:174 / onCreateView | refresh | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:304 / fetchModels | refresh | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:336 / updatePickerLabel | model | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:338 / updatePickerLabel | model | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:356 / showModelMenu | model | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:389 / showModelMenu | CaptionUiViewBindings.refresh(surface,getContext()); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:402 / modelMenuRow | selected_suffix | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:445 / commit | CaptionUiViewBindings.render(state,()->{ | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:446 / commit | String own=CaptionStrings.settings(getContext(),rawDetail); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:447 / commit | keep_last_valid | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:450 / commit | if (reportInvalid && editor != null){String own=CaptionStrings.settings(getContext(),detail);editor.setError(own.isEmpty()?detail:own);} | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:460 / setState | CaptionUiViewBindings.text(state,getContext(),text); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekModelPreference.java:465 / setFailure | CaptionUiViewBindings.render(state,()->String.format(java.util.Locale.ROOT,CaptionStrings.settings(getContext(),key),raw)); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekActionPreference.java:12 / class/init | @Override void rebindUi(){if(KEY_TEST.equals(getKey()))setSummary(CaptionStrings.settings(getContext(),summaryKey));super.rebindUi();} | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekActionPreference.java:60 / performAction | message_a25bd037963d | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekActionPreference.java:65 / performAction | message_e8b2177e1cd3 | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekActionPreference.java:70 / performAction | message_8bfb437edfc4 | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekActionPreference.java:76 / testApi | profile_invalid_edits | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekActionPreference.java:80 / testApi | enter_key | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekActionPreference.java:86 / testApi | message_49562bf14c82 | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekActionPreference.java:108 / testApi | api_test_retry_hint | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekActionPreference.java:111 / testApi | api_test_ok, api_test_failed | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekSliderPreference.java:95 / onCreateView | CaptionUiViewBindings.render(title,()->getTitle()); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekSliderPreference.java:114 / onCreateView | size, opacity | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekSliderPreference.java:138 / onCreateView | CaptionUiViewBindings.render(summary,()->KEY_TEXT_SIZE.equals(getKey())?tierDescription(slider.getProgress()+minimum):getSummary()); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekSliderPreference.java:273 / tierLabel | CaptionUiViewBindings.text(name,getContext(),key); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekSliderPreference.java:339 / updateTierNames | String current = CaptionStrings.settings(getContext(), SIZE_TIER_KEYS[selected]); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekSliderPreference.java:341 / updateTierNames | java.util.function.Supplier<CharSequence> accessible=()->getTitle()+": "+CaptionStrings.settings(getContext(),SIZE_TIER_KEYS[CaptionFontSize.clampTier(slider.ge | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekSliderPreference.java:342 / updateTierNames | CaptionUiViewBindings.description(slider,accessible); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekSliderPreference.java:343 / updateTierNames | CaptionUiViewBindings.description(names,accessible); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekSliderPreference.java:635 / tierDescription | size_tier_hint | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekSliderPreference.java:636 / tierDescription | CaptionStrings.settings(getContext(), SIZE_TIER_KEYS[CaptionFontSize.clampTier(tier)]), | 统一快照；14作者值/对应上述实际控件证据 |
| SubtitleStylePreview.java:70 / onCreateView | preview_hint | 统一快照；14作者值/对应上述实际控件证据 |
| SubtitleStylePreview.java:78 / sample | static String sample(Context c){return CaptionStrings.settings(c,SAMPLE_KEY);} | 统一快照；14作者值/对应上述实际控件证据 |
| SubtitleStylePreview.java:120 / sampleLabel | preview | 统一快照；14作者值/对应上述实际控件证据 |
| SubtitleStylePreview.java:132 / onDraw | String sample=LOCALIZE_SAMPLE?sample(getContext()):CaptionStrings.get(getContext(),SAMPLE_KEY); | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:17 / onCreateView | diagnostics | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:18 / onCreateView | expand, ai_diagnostics_toggle | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:19 / onCreateView | diagnostics_hint | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:25 / onInterceptTouchEvent | refresh, ai_diagnostics_refresh | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:26 / onInterceptTouchEvent | copy, ai_diagnostics_copy, diagnostics, message_896c4b51d7e9 | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:28 / onInterceptTouchEvent | save_diagnostics, ai_diagnostics_save | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:36 / onInterceptTouchEvent | save_ok, save_failed | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:39 / onInterceptTouchEvent | clear_diagnostics, ai_diagnostics_clear | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:40 / onInterceptTouchEvent | refresh, copy | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:41 / onInterceptTouchEvent | save_diagnostics, clear_diagnostics | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:42 / onInterceptTouchEvent | collapse, expand | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:43 / onInterceptTouchEvent | collapse, expand | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:45 / onInterceptTouchEvent | clear_diagnostics | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:46 / onInterceptTouchEvent | clear_diagnostics_confirm | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:47 / onInterceptTouchEvent | clear_diagnostics | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:57 / onInterceptTouchEvent | collapse, expand, collapse, expand | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:61 / saveReport | save_ok | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:88 / copyPages | copy_part_label | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:90 / copyPages | copy_parts_title | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:95 / copyPages | copy_part_label | 统一快照；14作者值/对应上述实际控件证据 |
| DeepSeekDiagnosticsPreference.java:97 / copyPages | copy_part_done | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionSettingsDialogs.java:33 / confirm | cancel | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionSettingsDialogs.java:34 / confirm | cancel | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionSettingsDialogs.java:41 / confirm | cancel | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionSettingsDialogs.java:52 / show | CaptionUiViewBindings.refresh(content,c); | 统一快照；14作者值/对应上述实际控件证据 |
| InlineCaptionEditor.java:59 / onCreateActionMode | menu.add(0,android.R.id.paste,0,ui.getString(android.R.string.paste)).setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS); | 统一快照；14作者值/对应上述实际控件证据 |
| InlineCaptionEditor.java:60 / onCreateActionMode | menu.add(0,android.R.id.selectAll,1,ui.getString(android.R.string.selectAll)); | 统一快照；14作者值/对应上述实际控件证据 |
| InlineCaptionEditor.java:61 / onCreateActionMode | if(!sensitive)menu.add(0,android.R.id.copy,2,ui.getString(android.R.string.copy)); | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionQuickToggle.java:25 / onMenu | ai_quick_toggle_on, ai_quick_toggle_off | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionQuickToggle.java:46 / setEngine | configure_api | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionQuickToggle.java:58 / setEngine | mode_pending, mode_off_pending | 统一快照；14作者值/对应上述实际控件证据 |
| CaptionQuickToggle.java:60 / setEngine | choose_translation | 统一快照；14作者值/对应上述实际控件证据 |

## 边界与不再显示

三种视频状态文字及 languages_entry 均保留历史资源，没有用户行或无障碍状态拼接。LanguageMenuOrder原真实菜单 locale/compare/sort逐字不变，仅增加display-locale名称重载。既有profile/model/URL/key/custom prompt、source/translation/provider raw不做子串替换。Android平台动作菜单和Morphe主题的手机表现、母语语义仍未验证。完整截图是实际控件栅格；截图前仅将测试编辑器scroll位置归零并启用software layer以避免Robolectric离屏软件Canvas隐藏输入文本，没有用静态文本图代替控件。
