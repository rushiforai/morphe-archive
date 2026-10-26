# M4a v1 执行结果 — 已完成待复核

日期：2026-10-24（Asia/Shanghai）。仅执行 M4a v1；执行完成，**统筹待复核，未自行接受或进入下一卡**。

活动仓库和命令工作目录：`E:\Projects\DeepSeek morphe-ai-caption-translator`。证据独占目录：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M4a-01`。本文相对证据文件名均相对该目录，具体机器摘要见 `delivery-summary.json`。

## 入场与范围

- 进入/退出分支均为 `codex/fix-cc-authority-1.5.8`；HEAD 均为 `de844402776e1046a5bec87aac94e2e65f05bea7`。复用原工作树，没有切分支、worktree、commit/tag、推送或 PR。
- 原工作树已有 N69–N75、M1a–M3a 修改，完整保存为 `entry-originals.zip`、`entry.json`、`entry-fingerprint.json`、`entry-working-tree.patch` 和 `entry-index.patch`，共 2183 个入场 Git 可见文件；镜像另收入 ZIP。比较基准是入场字节，绝非 HEAD 累计 diff。
- `historical-artifacts.json` 保存 5881 个入场 build/delivery、build/maintenance 文件；最终逐文件保护结果见 `protection.json`。实际使用的六个忽略前端/初始化脚本在 `entry-ignored-tools.json` 和 ZIP 中单独冻结，不把退出哈希冒充入场。
- 核对已接受 M3a 候选 SHA-256 `fb04a85d0a1e55b386fce7152a60de4f619c9e2b560671eb08770a01a5b0303a`；公开产品/订阅元数据仍 1.5.7。产品 version 保持 1.5.8，仅 captionBuildId 改为 local-1.5.8-m4a。

## 实际实现和收益

1. `presentation/src/main/java/app/yydarlinker/deepseekcaptions/CaptionGlyphTransition.java`：新增一个 package-private 普通 Java 类，独占 displayed/from/to/start/pending 数值状态；提供 noteTarget、advance、displayedPx、reset、settle。由传入 frameTimeNanos 推进，不依赖 Android、时钟、线程、timer，无每帧对象分配或字体测量。
2. `ui/src/main/java/app/yydarlinker/deepseekcaptions/CaptionOverlayV2.java`：删除相应数值字段，目标、帧推进、读值、reset/settle 薄委托；只保留 glyphFrameScheduled、Android callback/post 去重及实际 TextView scale。现有测试入口签名保留，GLYPH_FRAME 和 scheduleGlyphFrame 的实现原样保持。
3. `gradle.properties`：只替换本地 build ID。新增组件测试、真实 Overlay 排队对照、冻结资源和真实视图 callback 用例；未改已有测试 setup/teardown、方法体或断言。
4. 更新 ARCHITECTURE 中当前职责、维护 README/路线执行状态、PROJECT-STATE/字节相同镜像及本结果。旧任务卡、结果和 REVIEW 不改。

收益是数值过渡可以用普通 JUnit 和传入时间验证，Overlay 不再管理五项互相关联的过渡字段。没有引入动画框架、重复状态、转发接口或模块/依赖。180_000_000ns、两种用途不同的 2% 比较、算术顺序、首帧和重新设目标均原样保留。尺寸法则、分页/预排、视口、触摸、原生遮罩、N74/N75、AI/CC/语言、会话/网络/缓存均未改变。

## 可信旧行为与两层对照

- **先运行旧实现，后提取**：实际入场 Overlay 原件为 `CaptionOverlayV2.entry.java`，SHA-256 `5b36a9d87c7f35f674354f781317c1e2d9f16bc081e360c9f8a585de68bb83b2`。`OldOverlayCaptureTest.java`、`old-capture.log` 和 `old-capture-xml/` 记录旧实现真实 Robolectric 执行；`extract.py` 在写生产源码前断言当前 Overlay 原字节仍等于入场 ZIP。
- `old-sequences.tsv` 的 **12 组 / 97 步**由旧 Overlay 产生 `old-overlay-trace.tsv`，其 SHA-256 为 `0503d294c74fad4530bd94e2e78063ecc3a66deb9ff6e3fb4888ec90e7a5200c`。永久 fixture `extensions/extension/src/test/resources/glyph-transition-v1.tsv` 与之原字节相同；未用新算法生成 expected，未保留两份生产算法。完整来源和哈希在 `old-behavior-provenance.json`。
- 序列覆盖初始化/无效目标、上下行 2% 临界、首帧/90ms/180ms/终点后、相近重复目标、首帧前/中途改目标、靠近当前值取消、reset/settle 的 pending/active/排队回调、零/负/倒退/溢出时间及 NaN/Infinity 的原有处理。有限数值比较原始 float bits；NaN 由 Float.floatToIntBits 规范化，无有限值容差。
- `CaptionGlyphTransitionTest.componentMatchesFrozenOldOverlay` 直接驱动新组件，核对显示数值、advance 返回和最小 adapter 排队模型；另有三个独立固定数值性质测试。普通 JUnit 不使用 Robolectric runner。`numeric-only-javac.json`（exit_code=0）及对应日志记录只给新组件源码、不提供 Android classpath 的 javac 成功。
- `CaptionGlyphTransitionOverlayTest.frozenOldOverlaySequences` 驱动真实生产 Overlay，截获实际 postFrameCallback，并直接交付队列中的真实 GLYPH_FRAME 对象；逐事件核对数值、后续帧需求、去重标记、累计 post 数及排队数量。reset 不撤销旧 callback、settle 不清去重位等旧语义也固定在 fixture 中。
- `CaptionLayerOverlayTest.glyphCallbackAdvancesAndAppliesThePaintedSizeM4a` 在现有真实 Activity/字幕视图夹具中，通过现有 surface 几何建立目标，交付真实 GLYPH_FRAME 的 0/90ms 时间，断言首帧不跳、下一帧实际 TextView 的 painted height 等于中间值。回调应用阶段会重新计算目标，测试沿用实际产品路径。
- 全部 707 个原测试保留，新增 6 项，最终合计 713。原 CaptionLayerOverlayTest 14 个 @Test 方法体相同，其余旧测试文件原字节相同，详见 `assertion-preservation.json`。

## 最终有效验证

```powershell
.\.devenv\verify-full.cmd -RunId 20261024-M4a-candidate-02 -EvidenceDirectory validation/runs/20261024-M4a-01/final -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m4a -Offline -RerunTests
```

退出 0；`final/summary.json` 为 passed，源码输入指纹 `504c27d112a55b15555ae34f5b827ba524f50f3dd05cc913f9b7f51439718afc`，构建前后相同。两组 Test 均强制本轮实际执行，未把旧 XML 或 FROM-CACHE 冒充本轮执行；本次 R8 与 syncExtension 也实际执行。其他编译/构建任务的实际执行/有效复用按 `final/gradle-receipt.json` 记录。

| 检查 | 最终结果 | 证据 |
| --- | --- | --- |
| translation-core | 257 tests，failures/errors/skipped=0 | final/tests/translation-core |
| extension | 456 tests，failures/errors/skipped=0 | final/tests/extensions-extension |
| 相关合同 | 帧时、CaptionLayerOverlay、ShortsCommentViewport、CaptionAnimationIdle、AnimationDiagnostics 以及新组件/调度全部通过，逐套计数见 related-tests.json | 最终 XML，不混用失败批次 |
| 发布/工具合同 | 14 / 15 通过 | final/release-contract.log、verification-contract.json |
| 本地化 | 232 keys × 14 locales | final/localization.log |
| 来源、提示词、compiled、UI、包边界 | 通过，81 compiled core classes；无测试/引擎泄漏 | final/source-boundaries.json、boundaries.json |
| 候选、MPE 一致性、凭据 | 通过；独立与内嵌 MPE 相同；凭据 matches=[] | final/bundle.json、credential-scan.json |
| 包身份负向注入 | 旧 m2a 包冒充 m4a、MPE 不匹配、local 包冒充 release，实际均退出 1 | negative-gates.json 及三个 reject 日志 |

针对性运行使用 `.devenv/dev.cmd :extensions:extension:testDebugUnitTest`，`--tests` 分别选择 CaptionGlyphTransitionTest、CaptionGlyphTransitionOverlayTest、CaptionLayerOverlayTest、ShortsCommentViewportTest、CaptionAnimationIdleTest、AnimationDiagnosticsTest 并 `--offline`。首次/第二次运行除新视图夹具外的合同均通过；最终有效结果统一使用完整入口归档。单独修正后视图回调运行命令及 XML 见 `targeted-commands.json`、`callback-03.log`、`callback-03-xml/`。

## 新候选与包/DEX 对照

- MPP：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M4a-candidate-02\patches-1.5.8.mpp`；585114 B；Version 1.5.8 / local-1.5.8-m4a / Patcher 2.0.0。
- MPP SHA-256：`378213982117303065a340df446bea7c3fa4213db4b5a1098291137c6c41db97`。
- 独立 MPE：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M4a-candidate-02\extension.mpe`；717356 B；SHA-256 `77e41d6a74431570abdb49463dc270e1ee37a61937f580bdeb69f4531ab24788`；与内嵌 MPE 原字节相同。
- 沿用已接受工具的 M1a 目录布局，实际本轮是 M4a，没有为目录名改验证工具。
- 对照冻结 M3a，MPP 的 Kotlin 补丁 DEX/classes.dex 与全部资源原字节相同，仅 manifest 和扩展 MPE 内容变化。新 MPE 增加 CaptionGlyphTransition 一个类，没有删除原类；Hook/NativeCaptionBridge 方法签名表相同。无测试类泄漏，旧回环类/类型引用及网络生成标识均为 0。详见 `candidate-structural-diff.json`，允许 DEX 索引重排，不将所有旧类 DEX 片段逐字节相同作为判据。

## 真实组合与现有 DEX 审计

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File validation/runs/20261024-M4a-01/run-composition.ps1
```

脚本实际通过 `.devenv/dev.cmd` 调用 `:patches:verifyComposition -Pcomposition.compile=true` 与 `:patches:auditComposition`，退出均 0。完整参数、runtime、选择集、日志和退出码分别为 `composition-command.json`、`audit-command.json`、`runtime-*.json`、`composition.log`、`composition-audit.log`、`*-exit.json`。所有处理和 Java TEMP 在 E:；共享安装缓存保留原位置。

- 原始 YouTube：21.41.525-SECONDARY，SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`；官方 Morphe MPP 1.48.0：`82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`。实际绝对路径及入场核对见 `composition-inputs.json`，与 M2a 确认输入相同，无新下载。
- 实际 Patcher 2.0.0 runtime JAR：SHA-256 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`。同一 AI 根 + **104 个官方默认根**及依赖；selection 和 official-defaults 与 M2a 原字节相同，不启用 default=false 的 Spoof signature。
- 完成实际补丁、DEX 序列化、资源重编译、未签名 APK 写出/对齐和现有 Hook/Shorts/quick toggle/原生遮罩/会话权限 DEX 审计，没有安装。
- APK：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M4a-01\composition-M4a\patched-unsigned.apk`；SHA-256 `61ae76783c7d68b4846c1a581f6c34c216c27d7b02ccdb0d4be0c8b0f0b0a749`；16 DEX / 64564 类，重复定义 0，新组件定义恰好 1。测试泄漏/退役回环引用为 0。
- 与 M2a 冻结真实组合 APK 的条目集合相同，仅 classes13.dex 内容变化，其余 **18390** 个条目原字节相同，包括 Manifest、resources.arsc、网络配置与原生资源。`composition-structural-diff.json` 保存具体对照；不以数值测试替代组合。

## 失败记录和限制

- 新视图用例第一次手工设目标，实际 applyCommentScale 重新计算目标将其覆盖；第二次通过几何设目标但还没等异步页面真正提交。依现有夹具等待真实字幕后再驱动帧，修正后通过。`targeted.log`、`targeted-02.log` 及两份 failed-xml 保留；未改生产、删断言或调整冻结期望。
- 首次完整 run 01 出现新调度夹具 Choreographer 对象的跨测试 shadow 类型污染（ShadowPausedChoreographer 不能转成 Frames）。只在新增夹具中让 getInstance 返回该 sandbox 的时钟对象，不更改真实 Overlay 调度。`full/summary.json` 和日志原样保留为失败，使用源码固定后的 run 02 完整通过取代，不把首次失败算作通过。
- 原有负/倒退/溢出时间、NaN/Infinity 及 reset 后旧排队回调行为保持，并未修算法边缘或改变视觉体验；本轮对照无提取差异，不提出另行产品修复。
- 未运行远端 CI、其他 APK/官方版本/选择矩阵、设备视觉/导航/帧时/耗电/性能复测、真实付费模型或正式 prepare/publish。组合不等于设备认证，单测耗时不证明更流畅。未签名安装、清数据、访问真实模型或对外发布。
- 源码入场换行风格已保留；取证脚本中间写入 CRLF 后在最终验证前恢复入场 LF，不产生整文件格式化差异。验证工具、CI、依赖、R8、公开元数据、旧卡/结果/REVIEW 保持入场字节。
- 交付审计首次导入现有验证模块时生成了一个新的 tools/__pycache__ 字节码文件；下一次范围检查准确拒绝了这项范围外产物。已将该本轮新增文件移动到证据目录，并仅对证据脚本设置 dont_write_bytecode，重新完成保护核对。`protection-audit-02-pycache.log` 保留拒绝记录，没有改验证工具或删除入场文件。

## 保护、回退与统筹交接

`final-audit.py` 自检 ZIP 对每个入场文件哈希，逐文件核对范围外/历史候选/实际忽略前端；`batch.diff` 为本轮相对入场的差异，`protection.json`、`exit.json`、`assertion-preservation.json` 记录结果。PROJECT-STATE 仅改当前身份并追加本轮记录，旧历史保留；镜像逐字节相同。

保护核对通过：本轮 13 个 Git 可见变更文件，另同步状态镜像；2176 个范围外入场文件、5881 个历史交付/候选及六个实际忽略前端/初始化脚本原字节相同。Overlay 除允许的 glyph 字段/委托块和读值外完全相同，旧 14 个 Layer 测试方法体及其他旧测试均保留。分支、HEAD、索引未变，交付源码指纹与最终完整验证一致。

`rollback.py` 默认 dry-run，先一次性检查本批文件仍为退出哈希和镜像未被后续修改，全部符合才允许 `--apply`。只恢复入场原件、删除本批新增的组件/测试/fixture，回退文档和 build ID；保留结果报告、证据和候选。任一后续改动会拒绝回退，不能 git reset/clean 或整 ZIP 覆盖未来工作树。无用户数据迁移，不需要清数据。

```powershell
work/toolchain/python/python.exe -X utf8 validation/runs/20261024-M4a-01/rollback.py
# 明确决定回退且 dry-run 全通过后，追加 --apply；之后重新运行当前完整验证入口。
```

需要统筹判断：按 M4a v1 复核本批数值职责、旧来源、两层调度/真实绘制、713 项测试、组合和保护证据是否接受；无额外产品取舍。建议先复核本卡，后续卡由统筹决定。其他 Overlay/Controller 整理和下一维护阶段均未执行。
