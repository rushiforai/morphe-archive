# M5a v1 执行结果 — 已完成待复核

日期：2026-10-24（Asia/Shanghai）。本卡分析、文档、必要测试、验证和交付已完成，**统筹待复核**；发现的生产策略问题未修复，测试通过不表示这些问题已消除。只执行M5a，未进入生产整理或下一卡。

活动仓库：`E:\Projects\DeepSeek morphe-ai-caption-translator`。证据独占目录：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261024-M5a-01`。正文证据相对路径均以该目录为根；机器摘要 `delivery-summary.json`、故障矩阵 `failure-matrix.json` / `failure-matrix.csv`。

## 入场、身份与允许范围

- 进入/退出分支均 `codex/fix-cc-authority-1.5.8`，HEAD均 `de844402776e1046a5bec87aac94e2e65f05bea7`。当前工作树复用，无分支/worktree切换，无commit/tag/推送/PR/发布/安装/用户数据清理。
- 入场2191个Git可见文件（含全部非忽略未跟踪修改）保存为 `entry-originals.zip`、`entry.json`；镜像额外收入ZIP。入场指纹 `a035f95cd359d57f38bb8a00cefe76c1afc6f3caa2d4385d2f709b0ce63ab6ff`；ZIP SHA-256 `2f7604161094102e10f844cb67741dc2b0273d2a391c3abb078fe83bd78b3188`。`entry-working-tree.patch`、`entry-index.patch` 保留累计差异，不能把HEAD当本轮起点。
- `historical-artifacts.json` 冻结7764个已有build/delivery、build/maintenance文件。六个实际使用的忽略前端/初始化脚本在 `entry-ignored-tools.json`、`entry-ignored-tools.zip` 单独保存入场原件/哈希；受保护的tracked工具也在ZIP中。
- 产品仍 **1.5.8 / local-1.5.8-m4a**，公开仍1.5.7。没有生产Java/Kotlin、资源、Gradle/依赖、工具/CI/发布、配置键/缓存格式/提示词/协议、版本/build ID变化。

## 实际交付与已有覆盖核查

1. 新增 `docs/architecture/NETWORK-FAILURE-CONTRACT.md`：分源获取、provider传输、参数协商、输出修复、控制器调度、诊断六层；记录请求单位、上限、时钟和作用域，并列F1–F5问题与限制。
2. 新增 `translation-core/src/test/java/app/yydarlinker/deepseekcaptions/NetworkFailureContractTest.java` **12项**；新增 `extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/SourceHttpFailureContractTest.java` **3项**。无新依赖，旧测试文件及断言原字节保留。
3. ARCHITECTURE、CAPTION-STATE-CONTRACT增加准确交叉入口；维护README/路线、PROJECT-STATE及字节相同镜像记录完成待复核；本结果新增。旧任务卡/RESULT/REVIEW不改，统筹未自行接受。

先审阅CoreSessionIntegrationTest已有401终止/429恢复/切视频与目标/取消，PublicationLifecycleTest已有撤权、sent/unsent、缓存CAS及新model隔离，ContinuousDisplayTest已有过滤/结构恢复/hole，StreamingDisplayTest已有stream拒绝/流内error，RebuildStreamTest已有分片/截断，ProviderEndpointTest已有参数/认证，RawCaptionSourceFallbackTest/N38SourceFlightsTest已有源轨回退/共享取消，ApiProfileSnapshotTest已有原子快照。

`failure-matrix.json` 共 **28行**，含15个新增方法和13个已有代表方法；每行保存源码分支位置/哈希、测试位置/哈希、注入、初始身份、层级、次数、决策、有效XML及限制。其他已审阅方法在合同说明，不把28行说成全部728项的穷举。新增用例针对缺失的真实HTTP次数、跨层差异和旧任务后续协商，没有将已有401/取消/回退改名重加。

## 本地故障与实际请求证据

| 场景 | 观察和计数 | 范围 |
| --- | --- | --- |
| 401/普通403/404阻断记忆 | 三种首次各1 HTTP；同身份重试均0；换key及reset后各1；合计5 HTTP/5 attempts | 真实RebuildApi/HTTP，401控制器终止另有已有E2E |
| 可选参数拒绝/记忆 | 首逻辑2 HTTP，后逻辑1；2 batches/3 attempts，response_format移除 | 真实协商和请求body |
| stream拒绝+参数协商 | **1逻辑batch / 3 HTTP / 3 attempts**；stream true,false,false | 各自fallback不是同一重试预算 |
| inspection与403 | 400 inspection为content_filter且后调用可成功；同文字403为配置阻断；共3 HTTP | 不以响应文案统一403策略 |
| Retry-After模型 | 429六次输入17/date2031/300/invalid/-2/missing，delay分别17000/0/120000/0/0/0；均非configuration，审计均HTTP_CONFIG | 已定位F1，不把现状断言当合规确认 |
| 实际HTTP→控制器等待决策 | 429与503各1 HTTP；真实rejected把retryAt及providerRetry设now+17000；attempt3普通网络backoff=15000，原provider门保留 | PAUSED时钟，反射调用真实私有决策；不是全tick链等待 |
| 坏JSON/length | 各1 HTTP；JSONException / Invalid(output_truncated)，均无返回Plan，无内部自动重发 | 非法输出不由传输自己变成无限重试 |
| 实际断连 | DISCONNECT_AT_START：1 HTTP/1 attempt，TransportFailure.NETWORK_IO | 真实传输入口；不冒称真实connect/read超时 |
| 发送前取消 / deadline优先级 | 取消0 HTTP/0 attempts；实际guard定时器断开受控连接，cancel优先于timer，connect/read类别分别核对 | 不缩短10/16/30s生产常量；guard测试无网络 |
| 旧sent任务退休时扣住400 | 退休后仍有第二协商POST，前两次旧key/旧audit，第三次新model/key；unsent旧任务0新增attempt；publication关闭 | 真实Session/Job+HTTP；不是完整profile UI切换，已保留F4 |
| 仅换凭据 | credential hash不同但磁盘semantic identity相同，0 HTTP；新model则identity不同 | 如实记录F3，不保证profile级磁盘隔离 |
| 源401 | 主轨401 + 本地/sw.js + 原轨成功=**3 HTTP**；fixture Cookie进第二轨请求 | 真实RawCaptionSource.fetch与Cookie刷新，未替换TrackFetcher |
| 源持续403 | JSON3两次 + 原格式两次 + 一次Cookie=**5 HTTP**；最终http_403/nonretryable | 来源层与provider阻断不同，无注册ASR候选 |
| 源429日期 | **1 HTTP**，无Cookie/格式重发，日期等待>120s且delay取max保留 | 真实源HTTP；不等待到2031 |

最终XML的system-out含 `M5A_HTTP` / `M5A_SOURCE` 实测计数，提取到 `actual-requests.json`；15个新增测试合计37次fixture HTTP（provider28、源及Cookie9），不是全套728项的总HTTP数。新测试的等待为takeRequest/latch/Future.get/guard的2–3秒上限，服务器/连接、Cookie静态状态、host/fixture/reset均清理；无新增Thread.sleep，不调整生产时钟或常量。

源测试shadow仅映射 `https://www.youtube.com/api/timedtext` 与 `/sw.js` 到本地MockWebServer，未映射协议/host/path直接AssertionError；不返回null让生产URL备用连接生效，FreshYouTubeCookies的catch(Exception)也不能吞掉此拒绝。provider配置全部本地fixture和测试key。完整入口显式 `translation.live=false` 且Gradle offline，不访问真实YouTube/模型或用户profile发请求。`test-network-source-review.txt` 保留对测试网络入口的源码审查。

## 有效验证、顺序和输入固定

最终完整命令（退出0）：

```powershell
.\.devenv\verify-full.cmd -RunId 20261024-M5a-candidate-01 -EvidenceDirectory validation/runs/20261024-M5a-01/final -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m4a -Offline -RerunTests
```

`final/summary.json` 为passed；源码/测试/工具范围指纹 **`e90908b4a4f96cf57c8e7e8d00fa86662f643fc67d928e993024c4789c51300f`**，前后相同。与冻结M4a的工程输入差异应仅两个新增测试文件；完整入口receipt证明本轮两组Test均实际执行，未将旧XML/缓存当新运行。

| 检查 | 结果 | 证据 |
| --- | --- | --- |
| core | **269 tests / 0 failures / 0 errors / 0 skipped**（257+12） | final/tests/translation-core |
| extension | **459 tests / 0 failures / 0 errors / 0 skipped**（456+3） | final/tests/extensions-extension |
| 合计 | **728项**；713项原有 + 15项新增 | final/summary.json / gradle-receipt.json |
| 发布/验证工具合同 | 14 / 15通过；各工具的负向自检保留 | final/release-contract.log、verification-contract.json |
| 本地化 / 来源 | 232 keys × 14 locales；来源/提示词/生产边界通过 | final/localization.log、source-boundaries.json |
| compiled/UI/包边界 | 通过；compiled core81，无测试或引擎泄漏 | final/boundaries.json |
| 候选 / 内嵌MPE / 凭据 | 通过，credential matches=[] | final/bundle.json、credential-scan.json |
| 新用例顺序独立性 | 正序15 + 反序15，**30次均1项/0failure/0ignored**；每组在同JVM按显式顺序执行 | order-check.log、order-results.json、order.init.gradle |

顺序命令：

```powershell
.\.devenv\dev.cmd :translation-core:m5aOrderForward :translation-core:m5aOrderReverse :extensions:extension:m5aOrderForward :extensions:extension:m5aOrderReverse --init-script validation/runs/20261024-M5a-01/order.init.gradle --offline
```

只在独占证据目录新增初始化脚本/JUnit标准Request.method runner，不修改已接受的任何验证工具。针对性最终命令（targeted-05，退出0；core由Gradle确认有效复用、extension本轮执行）：

```powershell
.\.devenv\dev.cmd :translation-core:testDebugUnitTest --tests app.yydarlinker.deepseekcaptions.NetworkFailureContractTest :extensions:extension:testDebugUnitTest --tests app.yydarlinker.deepseekcaptions.SourceHttpFailureContractTest --offline
```

随后测试输出加了机器计数，最终输入在顺序检查前固定；顺序检查和final使用同一测试字节，未再次修改测试来迁就full结果。最终完整入口统一为验收XML来源。

## 新工程候选与冻结M4a对照

- MPP：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M5a-candidate-01\patches-1.5.8.mpp`，585114 B；SHA-256 **`939ccdbcc3e532cbb45a37cff2726a4d9dfcadef94557e43e355d8d3b407a7f8`**。
- Version 1.5.8 / local-1.5.8-m4a / Patcher2.0.0，公开版本未动。沿用已接受工具的M1a目录布局，实际为M5a验证。
- 独立MPE：`E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261024-M5a-candidate-01\extension.mpe`，717356 B；SHA-256 `77e41d6a74431570abdb49463dc270e1ee37a61937f580bdeb69f4531ab24788`；内嵌/独立/冻结M4a的MPE全相同。
- 冻结M4a MPP SHA-256 `378213982117303065a340df446bea7c3fa4213db4b5a1098291137c6c41db97`。逐项74条目，73个内容相同，唯一内容差异为manifest Timestamp：`1792848675741` → `1792851510784`；补丁DEX、扩展原始DEX/MPE和全部资源相同。ZIP条目日期字段变化0，逐项记录在 `candidate-comparison.json`，未把构建时间当产品变化。
- 生产编译/R8/syncExtension的实际执行或有效缓存复用见receipt，不要求纯测试改动强制重新制造不同生产字节。工程输入指纹区别本轮验证，不能因为产品同m4a就混用旧测试XML。

无生产/资源变化，未重复真实APK组合、资源harness、设备或真实模型。M4a已接受组合的来源是 `validation/runs/20261024-M4a-01/composition-M4a/patched-unsigned.apk` 及M4a结果/复核：21.41.525-SECONDARY、官方1.48.0/Patcher2.0.0/104默认根，16DEX/64564类；本卡不把那次执行写成本轮重新组合，也不扩大其他版本/设备认证。

## 失败记录与已发现问题

`targeted-01.log` 首次命令把--tests放在最后一个task后，core实际跑267项；新controller夹具没使用现存video owner而current=false，新断言正确失败。`targeted-02.log` 修正owner后，sent Job回调因缺测试Host报translation_host_not_installed。`targeted-03.log` 安装Host后，初版“只换key必须改变磁盘identity”的假设被真实代码否定；失败XML均原样归档。

经检查RebuildCache.identity及CaptionLanguageContext.fingerprint，磁盘语义身份有意实现为endpoint/model/prompt等语义字段而非凭据。保留原新model隔离断言，将退休场景replacement明确设为新model+key；另新增独立现状测试固定credential-only身份相同，并将策略含糊交统筹。未删除任何已有/有效生产断言，没有用更新黄金或忽略来掩盖失败。`targeted-04.log` extension夹具误传Context给只接收Activity的initialize编译失败；仅改新夹具为真实Robolectric Activity后，targeted-05通过。所有失败阶段均不作为最终通过结果。

需要统筹判断（生产保持入场字节）：

1. **F1 已复现缺陷**：模型Retry-After日期丢失和120秒截断，可能早于服务端要求重试；与源路径行为不一致。建议独立修复卡覆盖解析、调度及长等待。
2. **F2 源码确认策略风险**：page/hole修复不走普通rejected等待/终止门；页面入口没检查providerRetry/retryAt/content_filter原因，可能在限流/过滤后增加子请求。现有限额/去重仍在；本轮未声称端到端重现额外收费。
3. **F3 已观察身份共享/待决策略**：仅换key/profile但语义配置相同时共用磁盘key；M3a的新model隔离不能泛化成凭据/profile隔离。需明确允许语义复用还是要求namespace隔离。
4. **F4 已复现现行边界**：sent逻辑任务retire后还能以旧key发协商第二POST，审计仍旧作用域；取消/退休不等于退款。是否缩小finishSent含义属费用策略，另卡决定。
5. **F5 已观察报告粒度问题**：HTTP_CONFIG包括429/503/content_filter，实际controller却可等待/块失败；不能仅凭枚举解释用户行为。

无单一“每块一次”或统一失败重试策略。持续结构拒绝的动态maxAttempts可能使固定原因no-plan调度达到9次dispatch而非简单3+3，此项为源码推导，未做完整动态穷举；源恢复也只有限速而非总次数上限，合同明确区分。

## 保护、未覆盖与安全回退

`final-audit.py` 核验入场ZIP、范围外文件、旧测试、历史候选、六个忽略脚本、分支/HEAD/索引、工程指纹和状态镜像；`protection.json`、`exit.json`、`assertion-preservation.json`、`batch.diff` 为最终依据。相对入场仅9个Git可见文件变动，另同步镜像；2186个范围外入场文件、7764个历史交付/候选原字节相同。旧测试Java/Kotlin全部原字节相同，产品/配置/协议/工具无变化。

全仓`git diff --check`对既有CRLF/累计修改报trailing whitespace；本轮不格式化已有文件，新增/本批差异另行核对。它不能用来否定入场已有工作或把整个HEAD diff算成本轮。

未验证：真实connect/read超时全链路、真实TLS/DNS/服务端计费、10/16/30秒完整deadline等待、并发negotiation_pending、全部page/rate-limit交错、全部源候选组合、结构9次调度动态穷举；远端CI、其他APK/官方版本/选择集、设备视觉/性能/导航、真实付费API及正式发布均未执行。上述限制不被分类单测或冻结M4a证据替代。

`rollback.py` 默认dry-run，先同时核对每个本批文件仍为退出哈希，全部匹配才可--apply；只恢复本轮5个已有文档和状态镜像、删除本轮2个测试及新合同，保留M5a结果、证据和候选。不硬重置/clean、不覆盖后续修改、不动用户数据。任何后续编辑都拒绝自动回退。

```powershell
work/toolchain/python/python.exe -B -X utf8 validation/runs/20261024-M5a-01/rollback.py
# 明确决定回退且dry-run通过后再加 --apply；回退后按当时工作树重新验证。
```

建议先统筹复核合同、真实请求计数、F1–F5及覆盖限制，再决定是否单独下发生产策略修复。未执行下一卡。
