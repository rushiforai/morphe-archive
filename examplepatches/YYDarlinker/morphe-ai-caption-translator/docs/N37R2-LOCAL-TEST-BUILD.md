# N37R2 本地测试交付：字幕外层按视频物理中心定位

日期：2026-10-05（Asia/Shanghai）。整理时间：2026-10-05T17:43:37+08:00。

## 1. 结论与停止点

**N37R2 本地实现、焦点验证、全量回归、建包与交付审计完成。** 新包均带 `n37r2` 标识；真实 YouTube/OEM 界面及实体手机 after 仍待用户验证，不能把受控模拟器矩阵写成实体机验收通过。本卡完成即停，不自派后继卡。

- 核心提交：`6ff1053c74c2deaa10bf733f5328d3b6756abd49`。
- 核心锚点：`anchor/n37r2-6ff1053`；完成锚点：`anchor/n37r2-final`（完成文档提交后由 Git 解析）。
- 基线：N37 产品 `98ac1a1`，完成文档 `3c36bf4`，`anchor/n37-final`。
- 回退保留锚点：`backup/pre-n37r2-n37-3c36bf4`；没有执行回退或重置。
- 没有修改 GitHub README、版本号、补丁源元数据；未发布 1.4.0、未推送、未写入实体手机。
- 仅使用已有离线工具链和明确 serial `emulator-5554`；没有翻译 API 请求、依赖下载或 SDK 下载。
- 正式 APK 保持 unsigned。模拟器受控宿主是独立测试签名副本，原产品 DEX/资源逐字节复制，只替换测试 manifest、追加测试 DEX；它不属于三包交付物。

## 2. 六项定位链路核查

| 核查项 | 结果 |
|---|---|
| 根、播放器、外层和 TextView 的方向 | SDK35 实测英语应用根/播放器为 LTR，阿拉伯语为 RTL；修复后字幕外层恒 LTR；英文/西语/日文 TextView 为 LTR，阿语仍 RTL。原 RTL 基线外层继承 RTL。 |
| 外层逻辑定位 | N37 使用物理 leftMargin，却以 `Gravity.TOP | Gravity.START` 应用；RTL 时 START 解析到右侧，导致偏移。修复为物理 LEFT。 |
| 三类字幕父容器 | 外层统一挂在 `android.R.id.content` 的 FrameLayout，不是三套字幕父容器；普通/全屏与 Shorts 的播放器子树及视频 Surface/TextureView 不同。 |
| 视频区域坐标 | 沿用 `CaptionSurface.videoBounds(host)` 的当前播放器内 SurfaceView/TextureView 可见矩形，裁剪至宿主并换成宿主物理坐标；不是以屏幕宽度代替视频宽度。独立测试覆盖偏心矩形、实际视频比播放器窄、裁剪、缓存命中与旧 Surface 替换。 |
| 文字方向来源 | 既有 `CaptionRenderSpec` 按字幕目标语言或 FIRST_STRONG/Bidi 配置内部文本；未修改这个契约，也未把所有 TextView 强制为 LTR。希伯来语混合数字的内部 Bidi 回归通过。 |
| 场景残留与过期回调 | 每次合法应用按当前 videoRect 和本次确定的外层宽度重新算物理左坐标；清理旧 translationX、relative margins 和右边距。诊断延后到真实布局完成，按 owner/render epoch、当前 guard 和字幕身份校验，hide/detach 取消旧观察；旧 owner 不能发布新场景记录。 |

## 3. 改动边界

统一水平规则：

```text
captionLeft = videoRect.left + round((videoRect.width - captionOuterWidth) / 2)
```

FrameLayout 的物理 margin 还会抵消宿主 paddingLeft/scrollX，保证真正落点等于上述物理左坐标，而不是把 padding 当作额外偏移。外层固定 LTR 定位语义，内部文字独立。

生产改动仅四个文件：新增 `CaptionHorizontalPlacement`；`CaptionOverlayV2` 接入物理定位和布局后诊断；`CaptionSurface` 只增缓存播放器方向的只读诊断；`RebuildController` 只增 session 诊断字符串。最后两者去掉诊断新增段后，与 N37 逐文本一致。

未修改分页、断行、合并、字号、垂直位置、避让、计时、翻译请求、authority、输入设置或 N37 原诊断 lane。没有固定偏移量、视频 ID/字幕句子特例、每帧整树扫描、translationX 累加或旧场景坐标回填。相同外层参数不再次 setLayoutParams。

每个实际布局后的定位事件记录以下字段（另附播放器、TextView 的 layout direction）：

```text
player_type app_layout_direction caption_text_direction caption_outer_layout_direction
video_rect caption_outer_rect expected_center_x actual_center_x center_error_px
session owner_epoch render_epoch
```

事件：`CAPTION_HORIZONTAL_PLACEMENT`。方向枚举：layout 0=LTR、1=RTL；本矩阵 text 3=LTR、4=RTL，未知目标使用既有 FIRST_STRONG 规则。

## 4. 验证结果

| 项目 | 结果 |
|---|---|
| N37 真正 RTL before | 14 个组合：英语应用语言 3 项通过、阿拉伯语应用语言 11 项中心偏移。阿语 UI＋英语字幕＋Shorts 复现 685px 偏差。 |
| 修复后同一矩阵 | 14/14；每组合四种文本形态，共 56 次观测。 |
| 横向/场景/owner/timing 焦点 | 31/31，fail/error/skip 均 0。 |
| Java 全量 | **750/750**，fail/error/skip 均 0；保留 N37 原有全部 **727** 个测试身份，新增 23 项，原测试文件未改。 |
| Python 冻结计分板合同 | 27/27；语义计分板原 4 通过、4 失败、4 未验证保持不变，不把合同通过当成语义质量全绿。 |
| 发行合同 | 11/11；只验证既有发行合同，没有执行发布。 |
| 真实 SDK35／交付 DEX 布局矩阵 | **86 次实测**；要求的 14 组合×4 形态=56；另含 Shorts 下一条视频的四种形态及进入/退出全屏。所有观测可见、translationX=0，最大中心误差 **0.5 物理像素**。 |
| 两行/单行 | 实测中的 24 个单行样本都为 1 行，24 个两行样本都为 2 行；长文本与混合文本保持原排版/分页合同。 |
| 生产诊断核对 | 实际发出 91 条定位记录，覆盖全部 86 个应用实例；逐实例匹配实测 videoRect 与中心误差，全部必需字段齐全，最大误差 0.5px。 |
| MPP/MPE/APK 组合 | AI-only、remember-only 实际 STRUCTURE_PASS；联合组合实际 COMPOSITION_PASS 并生成最终 unsigned APK。 |
| 序列化 DEX/分支 | APK 11 DEX、MPP 2 DEX、MPE 1 DEX 均通过；invalid_branches / dex_problems / binding_failures 均 0。 |
| API | 对最终 MPE 指令引用相较 N37 作差分，77 个新增 Android/Java 引用逐一查询已安装官方 SDK API 表；最高 since=24，满足 minAPI28。 |
| 资源／内嵌 MPE | 241 keys×14=3374；ZIP CRC、DEX 头/长度/checksum、3 settings XML、14 preview_hint；MPP 内嵌 MPE 与独立 MPE 逐字节一致。 |
| 宿主一致性／unsigned | 原 official settings 的 39 个方法与 N37 一致；正式 APK 的签名验证预期失败，确认为 unsigned。 |
| 最终来源绑定 | `final-checks.json` 为 PASS；测试输入、建包输入、source commit、三包 SHA、实测宿主来源、旧测试身份及保护范围全部核对。 |

### 必需矩阵

| 应用语言 | 字幕语言 | 已覆盖场景 |
|---|---|---|
| 英语 | 英语 | 普通详情、横屏全屏、Shorts |
| 阿拉伯语 | 英语 | 普通详情、横屏全屏、Shorts |
| 阿拉伯语 | 西班牙语 | 普通详情、横屏全屏、Shorts |
| 阿拉伯语 | 阿拉伯语 | 普通详情、横屏全屏、Shorts |
| 阿拉伯语 | 日语 | 横屏全屏、Shorts |

每组合均覆盖单行、两行、长文本、混合文字和数字。字幕语言、文本形态切换只改变内部排版，不改变外层相对视频的中心。额外验证 RTL/LTR 应用方向切换、padding/scroll、旧 translationX/relative margin 注入、幂等外层布局、旧 owner 的延后诊断、视频裁剪及连续 Surface 替换。模拟器是受控播放器视图，不是实际 YouTube 导航录像。

### 失败记录与修订透明性

保留全部原日志/XML，不以删除失败或修改旧断言制造全绿：`before-01` 是新参数化测试的 runner 注解错误；`before-02` 缺少 supportsRtl 的无效 fixture，不能当作 RTL 证据；修正 fixture 后 `before-03` 才是上述 11 个真实定位失败。`center-01` 修复后 14/14。

`focus-01` 的 4 个失败中，一个暴露诊断对 isLayoutRequested 的等待过严：既有文本 pre-draw 可能申请下一次排版，导致本次已完成布局的诊断不输出，已修正为真实 pre-draw 后读取实际矩形；其余是受控视图尺寸/第二次文本排版 fixture 问题。`focus-02` 保留 fixture 修订尚未完整应用的 3 个失败，`focus-03` 为 31/31。全量最终代码只运行一次 `full-01`，750/750。

首次复用旧 N34 范围检查将 N37 已有 transition guard 改动误判为本卡改变；保留 `resources-01`，改用 N37 为保护基线后 `resources-02` 通过，且最终来源 gate 对全部 N37 原输入单独核对，未放宽本卡可改文件。unsigned 验证的预期非零曾被父脚本误当失败，已修正脚本退出状态；三份 DEX 报告本身均 PASS，未改正式 APK。

## 5. 三包身份

| 类型 | 文件 | 字节数 | SHA-256 |
|---|---|---:|---|
| MPP | `patches-1.3.5-本地测试包-n37r2.mpp` | 1,285,008 | `5709345081F1E8407869A892262B24051E0A1742A61A9D7B1BAC5C0AF77504E6` |
| MPE | `extension-1.3.5-本地测试包-n37r2.mpe` | 3,139,924 | `DE3DF2B7D721B4B4D0B21554E40247FED7A519B933211F21BB407F366B347C27` |
| APK | `YouTube-21.16.256-本地测试包-n37r2-unsigned.apk` | 198,263,738 | `2ECD2395E28DD55222AC0742394D353F60B884D252D119782D7C0C82D85AB5B8` |

完整来源与验证清单见 `N37R2-SHA256.json`；逐观测见 `N37R2-居中验证矩阵.json`，原生布局后事件见 `N37R2-字幕定位诊断.txt`，原始 XML/指令 API/分支/组合证据见 `N37R2-验证证据.zip`。

## 6. 实体手机验收边界

本地结果满足 ≤1px 的计算与受控 Android 布局条件；实体手机尚未安装/触摸/清数据/改语言或推送任何文件。用户仍需确认真实 YouTube 的英语/阿语 UI、英语/西语/阿语/日语字幕、详情/横屏全屏/Shorts，尤其退出全屏、Shorts 下一条及混合文字切换；出现偏移时保留本卡新增定位字段，不能用这次模拟器 PASS 覆盖实体反馈。

在实体机确认应用语言和实际播放器场景都居中前，不进入发布流程。**本卡完成即停止。**
