# N23 合并卡交付记录

日期：2026-09-30。开工先全文读取 PROJECT-STATE，按 §2.8 原样同步外部档案；两处 SHA-256 一致，档案随本卡提交。翻译 API 0 次 / 0 tok，新增依赖 0，下载 0；不运行真机、不签名、不发布。ACCEPTANCE.md 与冻结计分板逐字节不变。

A：移除 SizeTierSeekBar.onSizeChanged 的独有内缩。两条原生 SeekBar 共用 CaptionSettingsStyle.slider，padding 与 thumb 宽度一致，共同 thumbOffset=0；中心行程为 paddingLeft+halfThumb 到 width−paddingRight−halfThumb。五个档名按实际中心定位，RTL 同步镜像。保留 max=4、松手保存、档名不含 px、当前档高亮加粗及当前档 contentDescription。已填充轨道 / thumb / 当前刻度均来自 CaptionSettingsStyle.primary（优先 ThemeUtils.getAppForegroundColor，回退主题 textColorPrimary）；未填充轨道及其余刻度均来自 sliderUnfilled=tint(primary,64)。档名非当前项仍用 secondary。

亮/暗标准 fixture 像素测量：两条轨道均 x=36–383，长度差 0px；墨迹包围盒中心对刻度墨迹中心最大误差 1.0px（本 fixture density=1，亦为 1dp）；Android 布局中心最大误差 0.5px，thumb 行程差 0px。亮/暗 × 标准/超大四张均已目检。文件在 `.verification/n23/fixtures/settings-{light,dark}-{standard,xl}-landscape.png`；测量脚本与数据为 `.verification/n23/measure_fixture.py`、`fixture-pixels.json`。

B：主语错接源模式不再依赖中文“之后/之後”；仍走既有修复及未解决风险留空路径。licensed or unlicensed 的源侧窄规则增加译侧“仿制/复制/衍生/型号”（含繁体）语义缺失检测，possible_omission、repair=true。没有通用词表、全局黑名单或无源特判。生产 RebuildReview 回放 `.verification/n20-20260930/offline-layout-mirror.json` 的 540 事件：B1=0、B2=0，事件清单各为 []，详见 `.verification/n23/review-hits.json`；该语料的授权复制事件译文完整，错接段已切为独立主语事件。§4d 原文构造的两个错译单测分别命中，B1 三轮后仍 semanticBlocked。

C：AI 持轨判定独立于叠层是否有字。已找到的原生窗口每 40ms 重新隐藏，发现扫描起步约 200ms、后续 400ms，播放器过渡也继续；包含类名历史变体、角色容器及有界 decor 树回退。找到的 view 用弱引用缓存；脱离视图树及归还原生轨道时恢复原 alpha，避免复用后继承透明状态。查找失败的父子类名、可见性、尺寸摘要按诊断单条长度分块留档。两处 Loopback MASK_FALLBACK 路径均显式触发重新隐藏。黑块机理：不可见 ownership track 仍会分配带背景的原生窗口，未成功遮蔽窗口时无字也绘底框；该分支与查找失败共同构成 §4e 的黑块条件。离线模拟已覆盖空白、等待、晚出现、重建、归还及 fallback；实际 YouTube 视图识别效果待真机。N20 文案和验收判据未变。

D：源加载 1 路、当前块专用 1 路、后台预取最多 2 路固定线程池。当前块不会被后台池占用；已有当前块作业不重复。3 秒内相邻两次 seek 后暂停新预取 5 秒，命名常量 SEEK_STORM_WINDOW_MS / SEEK_STORM_PAUSE_MS；发送中的作业继续，仍只取消未发送的非当前作业。内存计划优先，懒读磁盘缓存移至网络派发之前并保留 REBUILD_CACHE_RESTORED / network_calls=0。新增 slot_wait_ms、network_round_trip_ms / network_ms、validation_ms、validation_repair_retries、http_rounds，不删旧诊断。离线门闸与本地 MockWebServer 测试验证并发上限、专用通道、风暴暂停 / 恢复和当前块去重；远程往返下限与真机等待改善尚未验证。

最终 JDK 21 全套离线单测 421/421（0 失败 / 错误 / 跳过），Python 27/27；scoreboard/run.ps1：4 通过 / 4 既有失败 / 4 未验证，pending_translation / event_review / overflow 不可见时长全 0。新增 8 个单测，既有断言未放宽。最终测试与构建日志为 `build/n23-final-tests-build.log`，计分板与 Python 日志为 `build/n23-scoreboard.log`、`build/n23-python-tests.log`。

构建沿用 N18r 的本机工具路径与原版 YouTube 21.16.256、官方 1.44.0、Patcher 1.14.1，输入三项哈希均与 N22 一致。全部 Gradle 调用 --offline，使用嵌套 Zulu JDK 21 与既有 ANDROID_HOME。MPP 在 buildAndroid 后独立保存，MPE 从该 MPP 提取。最终组合输出使用 `build/n23-composition-final`；`build/n23-composition-1141` 是最后一次原生 detached-view 修正前的中间结果，不交付。以最终目录为准。

| 交付完整路径 | 字节数 | 相对 N22 | SHA-256 |
| --- | ---: | ---: | --- |
| `E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n23.mpp` | 1,056,619 | +1,647 | `862D7ADB7A900DC85EA739D8D4A44AAE3E31E927241DF491ED53769F2003C7B7` |
| `E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n23.mpe` | 2,691,416 | +4,360 | `C507EAA81913E5337F21E3924FF782EB87A51B577F4949DA78D5217CCCF37175` |
| `E:\Projects\morphe-caption-v2\build\n23-composition-final\YouTube-21.16.256-本地测试包-n23-unsigned.apk` | 196,797,976 | +769 | `51DA671BE326984C60F006E0BAE1EAB43BE643B91F42B9870ACF1A8AD35BA8B6` |

最终组合 **84/84 PASS**：逐项多重集核对既有 82/82 全在，官方新增 Channel search / Force fullscreen landscape 为 2/2。`DEX_AUDIT_PASS classes=58026`，既有所有 DEX 守卫通过；MPP/MPE/APK 另通过 N19–N23 实际字节码存在性审计，包含去除独有 padding、共用三项 tint、独立通道及 fallback 隐藏 hook。内容存在性检查不代替真机验收。

`.github/scripts/verify_bundle.py 1.3.5`、既有 N8Verify 与结构脚本均通过：MPP 72 唯一条目 / 14 locales / CRC / manifest / 两个 DEX 头、长度及校验和；MPE 与内嵌扩展逐字节一致，locale XML 与源码逐字节一致；APK 11 个根 DEX 均通过，包名 app.morphe.android.youtube，版本 21.16.256 / 1561068412，最低 SDK 28，无 validation 泄漏。apksigner 返回 1、DOES NOT VERIFY / Missing META-INF/MANIFEST.MF，符合未签名交付。12 个历史 MPP/MPE/APK 的前后字节数与 SHA-256 全一致，N22 / N18r / v1.3.5 均未覆盖。

证据：`build/n23-final-composition.log`、`build/n23-final-dex-audit.log`、`build/n23-final-content-dex.log`、`build/n23-verify-bundle.log`、`build/n23-n8-verify.log`、`build/n23-apksigner.log`，及 `build/n23-records/` 的输入、产物、结构、历史哈希、84 项核对 JSON。独立交付 MPP 避免了审计依赖 jar 任务临时还原 JVM 包的既有行为；审计后将交付 MPP 放回临时包路径再执行 bundle 校验。

本卡提交后创建本地附注标签 `anchor/n23-<本卡短哈希>`，指向该提交，作为语言菜单线唯一回退锚点；不推送。请用户真机重点观察滑条长度 / 配色、原生空黑块，以及每 1–2 秒跳转时等待是否缩短。建议不执行；完成即停。
