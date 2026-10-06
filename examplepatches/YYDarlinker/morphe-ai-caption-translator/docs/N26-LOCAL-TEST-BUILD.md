# N26 交付记录：设置入口迁入 Morphe 视频页 ＋ 预览说明改为全屏

日期：2026-10-01（N26）。执行仓库 `E:\Projects\morphe-caption-v2`，开工 HEAD `2f7841d`（N25 文档收尾），源码回退锚点 `anchor/n25-99e7be5` 存在且指向 `99e7be5`，与卡片一致。开工按 §2.8 核对两处状态档案：外部 `C:\Users\14776\Documents\kimi\tasks\2026-09-29\00-35-52-ec1208d7\PROJECT-STATE.md` 与 `docs/PROJECT-STATE.md` 均为 **65,453 字节、SHA-256 `608F1D616D2978C380A2B6D4AC4C80BCDFFE3238A23407CBA79939421D43C63E`，无差异**，故开工时未覆盖；该文件当前未提交的管理更新（§4i）随本卡提交，未回滚成 `2f7841d` 的旧档案。本卡只做入口迁移、入口样式、预览说明文案与其验证：播放器、翻译、原生遮蔽、调度、协议、质量检查、分页、字号几何与校准、缓存、用户配置存储、诊断 raw 格式全部未动；ACCEPTANCE.md、冻结计分板与历史诊断证据逐字节未改。

翻译 API **0 次 / 0 tok**，新增依赖 **0**，下载 **0**；不真机、不签名、不发布、不推送。

## A：设置入口迁入 Morphe 视频页

**只改外层导航 key**：`morphe_settings_screen_13_ai_captions` → `morphe_vot_screen__ai_captions`。AI 子屏内部 17 个持久化 Preference key、类名、控件顺序与绑定一字未动，SharedPreferences 名称与 Keystore alias 未动，**不发生任何用户数据迁移**。旧导航 key 作为删除别名保留在补丁常量里：任何仍带该 key 的节点（旧版本补丁留下的副本）在装配时被删除，旧链接不会残留成失效入口。

**结构绑定**（`addMorphePreferenceScreen`）：按字面 key 定位 `morphe_settings_screen_12_video_sort_by_key`。该 key 由官方 Morphe 设置补丁用 `PreferenceScreenPreference$Sorting.appendSortType` 在**打补丁阶段**拼出（`_sort_by_key` 后缀），三套 N25 资源实测一致，因此本期按已验证契约绑定，不按中文标题搜索、不匹配其他含 `video` 的 key。先确认父屏**唯一存在**，再删除本补丁拥有的节点，最后插入：**查找失败不会先破坏旧结构**。旁白翻译子屏 `morphe_vot_screen` 存在时插在其直接后继，不存在时正常挂入视频父屏尾部——不新增对旁白补丁的依赖，也不回退顶层。存在 Morphe 设置却找不到唯一视频父屏时抛 `PatchException`，不回退顶层、不回退原版 YouTube 设置、不自造「视频」分类。

**为什么 DOM 位置不等于最终相邻**：宿主排序在运行时发生，并重新赋 `android:order`（三套资源里 `android:order` 出现次数为 0）。从交付的官方扩展 DEX（`patches-1.44.0.mpp!extensions/shared.mpe`）反读 `AbstractPreferenceFragment`，其真实逻辑为：

```
sortPreferenceGroups(group):
  groupSort = Sort.fromKey(group.getKey(), UNSORTED)        // 后缀 → BY_TITLE(0)/BY_KEY(1)/UNSORTED(2)
  for child in group:                                        // 文档顺序
      if child instanceof PreferenceGroup { sortPreferenceGroups(child); childSort = groupSort }
      else                                childSort = Sort.fromKey(child.getKey(), groupSort)
      BY_TITLE  → 排序键 = removePunctuationToLowercase(child.getTitle())
      BY_KEY    → 排序键 = child.getKey()；为 null 且是 NoTitlePreferenceCategory 时取 getPreference(0).getKey()，
                  否则 throw IllegalStateException("Group is sort by key but preference has null key: ")
      UNSORTED  → 跳过（保持原位）
  list.sort((a,b) -> collator.compare((String)a.first, (String)b.first))
  for i, pref in list: pref.setOrder(i - 1000)               // 例外分支不减 1000
getCollator() = Collator.getInstance(MORPHE_LANGUAGE.get().getLocale()) 后 setStrength(1)  // SECONDARY
```

即：视频父页是 `_sort_by_key` 组，其子项**一律按自身 key 用当前应用语言的 Collator 排序**，子屏也参与；`morphe_vot_screen` 是新 key 的严格前缀，故两者在任何语言下都相邻。`app:iconSpaceReserved` 由官方 `morphe_preference_with_icon.xml` 与 YouTube 的 `setIconSpaceReserved` 协作，属宿主既有契约。

## B：入口样式与同页普通选项一致

AI 入口的图标属性面是**空的**：不设 `android:icon`、不设 `android:layout`、不设 `app:iconSpaceReserved`。这不是「顺手省掉」——三套交付资源里 **25 个嵌套子屏（含紧邻的 `morphe_vot_screen`）全部是同样空属性面**，只有根级子屏在 icons 主题里带图标；因此本项与所在页的普通行**逐属性相同**，而不是新增第二种行样式。根级子屏自己的图标、其他条目图标与 Morphe 全局图标开关未受影响。

`@layout/preference_with_icon`（由官方补丁注入到 APK 的 `res/layout/`）实测结构为横向 `LinearLayout`：`@android:id/icon` 的 `ImageView`（`layout_marginHorizontal=18dp`）+ `@android:id/title` 的 `TextView`。旧的根级入口曾用它换来图标位，现在该引用已从入口移除；`@drawable/deepseek_caption_settings` 也**不再被任何设置行引用**（该 drawable 仍由补丁生成，因为 `CaptionQuickToggle` 仍在用它，属冻结范围，未动）。

**渲染证据**（`N26EntryRowTest`，Robolectric＋真实 framework preference 控件，420dp）：AI 入口、紧邻的旁白项、同页普通叶子项三者标题左侧内缩**全为 16px**；对照行（真带图标）标题内缩 **72px**、图标实宽 32px——探针能看见图标占位，所以「无内缩」不是探针失明。亮/暗两个主题数值相同，帧见 `.verification/n26/frames/n26-video-page-rows-{light,dark}.png`。

## C：预览说明改为「样式预览（全屏）」

只改 `preview_hint` 的显示值，十四语种按卡片表格逐字落地。未新增重复标题、未改 `preview_sample`、未动预览比例/字体/五档/透明度/交互；N24 删除的「横屏全屏预览」标题未恢复（画布 `contentDescription` 仍用 `preview` 键，与本键不同）。

同步面：`localization/catalog.json`（14 处）→ `tools/generate_localization.py` 重生成 → 14 份 `caption_addon_strings.xml`、`source-keys.tsv`、`CaptionTranslationCatalog.java`（英文 fallback）。新增 `tools/apply_n26_preview_hint.py` 承担本次赋值并保持幂等与换行/键序不变。**核对过重跑生成器不会还原旧文案**：`preview_hint` 不在 `tools/n25_ui_strings.py` 的 `EN`/`REUSE` 里，故 `tools/apply_n25_catalog.py` 不在本键上写值；只更新本 key，其他 N25 翻译逐字未改（`git diff` 仅 14 行 `cap_preview_hint`）。

窄屏/大字体：`N26PreviewHintTest` 对 **14 语种 × {320dp,420dp} × {1.0,1.3 字体缩放}** 断言渲染文本等于表格值、无 ellipsize、`getLineEnd(最后一行的行尾) == 文本长度`（未被截断）、说明行底边不超出所在行且不与上方画布重叠。参考宽 420dp/默认字体下十四语种均为 1 行、行高 18px。中/英/俄/阿四张 320dp 大字体帧见 `.verification/n26/frames/n26-preview-hint-<locale>-320dp-large-font.png`。

## 验证

- **结构与幂等**（`.verification/n26/tools/n26_structure.py`、`n26_idempotency.py`，对**新构建的三套资源**运行）：新 key 的 AI 屏恰为 1 个、直接父屏是唯一视频页；旧导航 key、遗留对话框与根级 AI 入口均为 0；入口在文档顺序上紧邻旁白项；视频父页排序标记未变、无固定 `android:order`；入口图标属性面与该页 25 个嵌套子屏及旁白项**完全一致**；AI 内部 17 键、12 类与 N25 基线子树**逐节点相同**（仅导航 key 归一化）。二次装配后仍恰 1 个且结构完全不变；父屏缺失、父屏重复两种输入都被明确拒绝；交付 MPP 根 DEX 内含该结构失败消息，证明失败是具名错误而非静默回退。
- **宿主真实排序**（`.verification/n26/tools/N26HostOrderingCheck.java`，JDK21 真实 `java.text.Collator`）：把上面反读出的宿主算法回放到真实兄弟项集合上，**14 语种 × 3 套资源**全部满足「旁白的下一项恰为 AI」，且其余原生项相对顺序与 N25 基线逐一相同、根级条目顺序不变。证据 `host-ordering.json`。**没有用 XML 原始顺序代替该验证。**
- Java 全套离线单测 **440/440**（0 失败 / 0 错误 / 0 跳过，**58 套件**；N25 为 437/56）。新增 `N26EntryRowTest` 1 条与 `N26PreviewHintTest` 2 条。
- Python `unittest discover -s scoreboard` **27/27**；`tools/check_localization.py` 通过（**220 keys × 14 语种**）。
- `scoreboard/run.py`、`n9.py`、`n10.py`：**4 通过 / 4 既有失败 / 4 未验证**，`pending_translation`／`event_review`／`overflow` 不可见时长**全 0**；`scoreboard/results/frozen-baseline.json` 与 `ACCEPTANCE.md` Git 无差异。
- 组合 **84/84 PASS**（与 N25 的 82 既有 + 官方新增 2 一致，`PASS` 行数 84），`structure.txt` 与 N25 逐字节一致；`DEX_AUDIT_PASS classes=58028`。
- `verify_bundle.py 1.3.5` PASS（72 条目 / 14 locales / root DEX / extension）；`build/N8Verify.java` PASS（CRC、仓库身份、版本、DEX 头、交付 MPE 与包内扩展逐字节一致）。
- **交付包内部**核验（`build/n26-records/verify_artifacts.py`）：三套 `res/xml/morphe_prefs*.xml` 实际来自最终 APK —— 均含新 key、均不含旧 key、均不再引用旧图标 drawable；APK 的 `resources.arsc` 字符串池解析后**逐条精确**包含十四语种新说明，且**不再包含**任何一条旧说明（先前的字节包含判断会把「旧串是新串前缀」误判为残留，已改为解析字符串池后精确比对）。11 个根 DEX 头/长度/SHA-1/Adler-32、ZIP CRC、唯一条目、`META-INF` 无签名文件全部通过。
- `aapt dump badging`：`app.morphe.android.youtube` 21.16.256 / 1561068412 / minSdk 28 / targetSdk 36；`apksigner verify` 返回 `DOES NOT VERIFY / Missing META-INF/MANIFEST.MF`，**确认未签名**。中文路径沿用 ASCII 硬链接（`build/n26-records/apk-metadata-input.apk`），其 SHA-256 与交付 APK **逐字节相同**（避免了 N25 记录里 `apk-metadata-input.apk` 实为 N23 字节的问题）。
- 20 个历史产物（N18／N18r／N22／N23／N24／N25 三件套与既有本地包、`recovered/1.3.5` 两个 MPP）前后 SHA-256 与字节数**全部一致**，未覆盖任何历史输出（`build/n26-records/history-after.txt` = `HISTORY_HASH_PASS 20/20`）。

**覆盖边界如实报告**：宿主真实主题下的行观感（YouTube 的 preference 布局 ＋ Morphe 图标补丁）无法离线 inflate，本期以「交付 APK 内真实资源 ＋ 与 25 个原生嵌套子屏逐属性相同 ＋ framework 行渲染 16px 对比 72px」三条证据共同支撑，真机仍须目检；Robolectric 的合成 `Preference` 行对阿拉伯语标题不落墨（N25 已记录的 RTL 不向下传导限制），阿拉伯语的**说明行**帧正常右对齐渲染，条目**字符串**十四语种全部由运行时读取核验；未做真机截图，未执行真机验收。

## 交付

| 产物完整路径 | 字节数 | 比 N25 | SHA-256 |
| --- | ---: | ---: | --- |
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n26.mpp` | 1,103,820 | +2,707 | `01B80F88B1BE1233C59F184E44814E5A58C8BE49CAB227B54DC186909E0F7588` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n26.mpe` | 2,713,536 | +16 | `4C0D21FFC946F660FFF444140E8CE4A241F158028E7742399DAF21AA231F985C` |
| `E:\Projects\morphe-caption-v2\build\n26-composition-final\YouTube-21.16.256-本地测试包-n26-unsigned.apk` | 196,935,284 | +16 | `4BC022286C5EC05837F0A170BB4BE1C66AD4F152C596650A2F2871190539FA9B` |

MPE 与交付 MPP 内嵌扩展逐字节一致。MPP 增量来自入口装配重写（含具名失败与幂等处理）；MPE/APK 各 +16 字节来自十四语种说明文案的字形增量（多数语种只是加后缀，阿/印/俄等更长，资源池净增 16 字节）。工具链沿用 N25：YouTube **21.16.256** ＋ 官方 **1.44.0** ＋ Patcher **1.14.1**，嵌套 JDK 21（`E:\morphe-ai-caption-translator-next\build\isolated-toolchains\jdk-21.0.12.1+1`）、`C:\Users\14776\AppData\Local\Android\Sdk`、离线 Gradle 9.6.1，全程 `--offline`。

本卡提交序列：**`509d50a`（源码、十四语种文案、两项新测试、交付记录与状态档案，一个实现提交）**，锚点标签 `anchor/n26-509d50a` 指向该提交，即含全部源码与最终文案的点。其后若另有把占位短哈希写实的状态补记提交，它不含任何源码或文案改动，源锚点与 HEAD 的关系以 `git log --oneline anchor/n26-509d50a..HEAD` 为准。N25 历史提交未被 amend。

**真机仍待用户验证**：顶层旧 AI 入口已消失（Morphe 顶层不再有 AI 项）；视频页有一个正常风格的 AI 入口且紧跟在旁白翻译之后；旁白项与其他设置不受影响；原 API／方案、字号、透明度、位置与开关读回不变；进入子屏、返回视频页、再返回 Morphe 的导航正常；预览框下方说明显示「样式预览（全屏）」且随应用语言变化。本卡不做真机、不签名、不发布、不推送；L 线语言菜单仍未启动，播放器避让尚未执行。
