# M5i / 任务卡 v1：翻译与源字幕缓存故障、恢复及必要修复

2026-10-25（Asia/Shanghai）。**执行结论：完成待复核；统筹：待复核。** 同一对话顺序完成 A、B、C、固定最终输入后的统一验证/规定真实组合及交付。不自行接受缓存组，不进入诊断、性能或下一阶段。

唯一仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`。入场/退出分支 `codex/fix-cc-authority-1.5.8`，HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`，索引保持。最后接受身份为 **1.5.8 / local-1.5.8-m5h / candidate-03**，843项；本轮候选为 **1.5.8 / local-1.5.8-m5i / candidate-01**，861项。公开仍 **1.5.7**。

证据根：`E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5i-01`。入场原件 ZIP/manifest 保存2245项（含六忽略前端、状态镜像和两项既有删除状态），ZIP SHA-256 `b9a63048ec3c1bd67f4fb00cbf56542d8738b2e52e6991c4cb392eaaf3f036ed`。只保存本轮必要源码/报告/候选与有限历史哈希，没有重复制解码树。当前批次差异以入场字节为基准，见 batch.diff / batch-review.diff，不能将相对HEAD的全工作树diff当作本轮成果。

## A：当前合同、已有覆盖与范围

唯一当前缓存合同是 [CACHE-FAILURE-CONTRACT](../../architecture/CACHE-FAILURE-CONTRACT.md)，包含真实键/格式/目录/线程/TTL/限额、read后parse/review、prepare/ordinal、clear/publication及源缓存epoch边界。状态/网络/配置合同相邻引用保持。

RebuildCache已有的按块重新解析/可操作review拒绝、原子move及Prepared新旧序数满足本卡规定路径，未改其生产或Controller。已有PublicationLifecycleTest、NetworkFailureContractTest/F3、AuthoredCueContractTest、CoreSessionIntegrationTest、AttemptAdmissionTest、RepairAdmissionTest/RetryAfter、RawCaptionSourceFallbackTest、SourceHttpFailureContractTest及真实应用/源模式/失败无原文回归继续作为有效保护；没有改旧测试期望、移除断言或制造另一套覆盖率数字。

源缓存已满足：解析后才写入；LoadedTrack实际parse且至少一个cue；坏body单项回源；丢失/错误MIME可按内容识别合法格式；已有EPOCH拒绝clear前排队/已开始但尚未提交的旧写入。仅下述三个IO缺口有真实红测并局部修复。

## B/C：三项真实故障与必要最小修复

生产逻辑只改 `infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/SourceCaptionCache.java`：

1. 旧 replace 先delete旧目标，临时文件不存在时旧合法文件丢失。改为 `Files.move(REPLACE_EXISTING, ATOMIC_MOVE)`，失败保留目标，不走先删再rename fallback。
2. 旧body先换、type失败后body已经变。当前同提交锁内先保存旧type字节并发布新type，body最后原子发布；type发布失败不触碰旧body。
3. 旧body失败但type继续变成新值。当前body发布失败恢复旧type（原无type则删新type）；读取/remove也取原COMMIT_LOCK，进程内读者等待成对提交。若恢复本身再失败，仅尝试失效本键，保留原异常及suppressed，不清其他键。

另按卡改 gradle.properties 的 build ID为local-1.5.8-m5i。没有core生产/来源清单/派生patch变化，没有新依赖、线程、UI文案、资源、缓存格式/身份/目录版本/TTL/配额/淘汰策略变化。weakerThanCached的同文native timing保留逻辑原样。

有效红绿：`source-red02`在未改m5h生产上实际8项、3失败；缺失temp、非空type目录、非空body目录均为真实fixture文件操作，不是mock返回false。`source-green01`同8项原断言全部通过；之后只追加两个有界并发用例，旧8个方法体保持。完整原始log、XML、receipt、基线/绿色源码ZIP和受影响extension compiled均保留。

新测试core8 + extension10 = **18项**，不改变原843项：

| 用例组 | 实际调用链与可观察结果 |
| --- | --- |
| 译文坏/截断/空/超大/错误block/引文/源 | 真实RebuildCache.read/parseBound/review拒绝，其他键/有效条目保留，随后合法写入可命中 |
| review风险/身份 | 重新计算actionable score>0拒绝read/prepare；仅换凭据语义key相同、正常命中；不同源身份不同 |
| 译文prepare/move故障 | fixture文件阻塞缓存目录使prepare=null；实际删除staging使move=false；旧合法JSON原字节保持，后续写恢复 |
| 实际恢复/失败 | Controller.restore/schedule→RebuildApi→本地POST→Plan/render；坏条目1 POST恢复并重入命中；401后terminal/1 POST/无源文显示 |
| 旧恢复/clear | 真实旧CacheLookup撤权不能给新Session装Plan；clearCache撤销、等permit、准入旧提交可完成后被clear删；未准入旧Prepared不能复活；新写可用 |
| 源坏/缺/过期/超大/body-type部分状态 | 真实SourceCaptionCache→SourceLoadFlights→RawCaptionSource→CaptionDocument→本地GET；恢复后重入不增请求，其他轨/语言的键/字节保留 |
| 源写失败/临时文件 | staging实际IO失败、body/type目标阻塞、缺失temp，不损坏另一合法键；去掉fixture障碍后合法写恢复；孤立temp不当body |
| 源clear/读写并发 | 单writer有界latch固定排队前clear、已开始写入后clear，旧EPOCH不复活、新EPOCH命中；提交锁内暂停writer，reader等待后取得完整新pair |

这些是实际组件链及受控端口验证：core使用真实缓存/Controller/Session/Publication/RebuildApi/guard，源/平台Host是受控端口，未知源调用直接AssertionError；extension使用真实源加载、解析、HTTP，只将Hook的YouTube timedtext Cronet连接明确映射到本地MockWebServer，未知连接抛AssertionError，未整体fake TrackFetcher。缓存目录全部测试自有且位于E: work/temp。不是设备播放器/实体文件系统/真实付费服务认证。

## 实际请求计数和既有预算

`test-and-request-evidence.json`从最终110份XML及system-out提取各18项的原始计数、routes和并发trace。**仅新缓存18项合计 source GET=9，provider POST=2，core audit attempt=2**，不能把它写成全部861项的HTTP总数。

| 新测试情形 | source GET | provider POST | 恢复对照 |
| --- | ---: | ---: | --- |
| 空/坏JSON/HTML/零cue四类源body | 4 | 0 | 各1 GET恢复，再次load为0新增GET；另一轨保持 |
| 缺失/25小时过期/16MiB+1源body | 3 | 0 | 各1 GET，重入命中 |
| 错MIME+坏body、仅type/孤立temp | 2 | 0 | 各1 GET；合法JSON3缺/错type直接0 GET |
| 全部源IO/clear/成对读写对照 | 0 | 0 | 旧有效body/新epoch无需回源；无模型入口 |
| 正常译文命中→坏条目实际schedule恢复 | 0 | 1 | 命中0 POST，坏条目1 POST，恢复后重入0新增POST |
| 坏译文缓存→401 | 0 | 1 | terminal挡住后续schedule，无源文输出 |

未增加原F1等待、F2普通/page/hole配额、F4物理尝试资格；F3语义磁盘复用、finishSent/STOPPED、旧scope已准入提交和F5诊断分类保持。源模式零模型请求、翻译失败无原文和M5h配置/凭据保护由原回归加完整入口共同确认。没有Thread.sleep、扩大等待、整测重试或黄金重录。

## 固定最终输入、完整验证和明确身份

聚焦绿色检查：core-green03实际 **72项**，source-adjacent02实际 **88项**，均失败/错误/跳过0；包含原Publication/F1/F2/F4/F3、源HTTP/回退/共享flight、真实应用以及M5h配置相邻路径。每次有效检查点在下一Gradle前保存所用XML/receipt/源码及compiled；早期辅助路径偏差见后文，不冒称旧0项摘要为实际结果。

```powershell
.\.devenv\verify-full.cmd -RunId 20261025-M5i-candidate-01 `
  -EvidenceDirectory validation/runs/20261025-M5i-01/final `
  -ExpectedVersion 1.5.8 -ExpectedBuildId local-1.5.8-m5i -Offline -RerunTests
```

此唯一最终完整入口退出0，**core328 + extension533 = 861项**；两组实际执行、失败/错误/跳过均0，**110份XML**逐份哈希。原843项源文件全部保持。238键×14语言、本地化/metadata、发布14与验证工具15合同、来源/协议提示词/Hook ABI、compiled/UI/包边界及凭据扫描通过。

固定输入/前后manifest一致，源码指纹 `9439ef3e8c329b860c374bd76fe5e2cc84e1c5814fb7702d2b1b9ffe7d750b12`；`fixed-final-inputs.json/zip`保存最终工程输入。同次555个生产compiled类在下一次Gradle（规定组合）之前立即归档，ZIP SHA-256 `ed9a89601e85f620fc41d4b6c629ac0cca1fc81f38f1152ccae4f3b80ec8cfaf`，receipt SHA-256 `d1571af86de1ea16650fc1e0c37a79b92748db9de7a567894c696e777af41890`，绑定文件 `final/compiled-binding.json`。core81类与接受M5h同字节，来源清单/派生patch也原字节不变。

从同次归档提取core，明确MPP/MPE/UI再次运行边界与candidate检查通过；两个负向均实际退出1：本地冒充release缺 `release-1.5.8`，接受的M5h冒充M5i缺 `local-1.5.8-m5i`。见 independent-commands.json；输入文件确实存在，不用缺文件当身份拒绝。

| 产物 | 绝对路径 | 字节数 | SHA-256 |
| --- | --- | ---: | --- |
| MPP | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5i-candidate-01\patches-1.5.8.mpp` | 596140 | `8e960b4d4e471df805871c0f67c12eccf07d145ebdd27e26a96d1cc0664f4d99` |
| 独立/内嵌MPE | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5i-candidate-01\extension.mpe` | 731840 | `120143e1711c3884b51f655b163c2c719df9219bc95e0c9237421d8496eda070` |
| UI preview APK | `E:\Projects\DeepSeek morphe-ai-caption-translator\build\maintenance\M1a\20261025-M5i-candidate-01\ui-preview-debug.apk` | 3512580 | `800430e0e6e0a97810974573f2016ada09280131e436e1ccff4640512e506e2f` |

内嵌/独立MPE一致，UI不含translation core。只有本地候选，不发布或覆盖公开1.5.7。

## 同输入规定组合、资源与包体

`run-composition.ps1`通过 `.devenv/dev.cmd`实际运行 `:patches:verifyComposition`（compile=true）及 `:patches:auditComposition`。全部退出0，104官方默认根+AI；命令、Gradle receipts、实际runtime classpath及输入哈希分别保留。

- 原始YouTube21.41.525-SECONDARY SHA-256 `ed46af10609636fa9159a684518e3b576b03b70bdf75bf639a411cacede2f712`。
- 官方MPP1.48.0 SHA-256 `82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7`。
- 实际Patcher2.0.0 JAR SHA-256 `251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c`。
- 未签名APK `E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5i-01\composition-M5i\patched-unsigned.apk`，227137129 B，SHA-256 `3d7133011e91b046aa9eef645507436d9103f211bfcbee838b03a1c20ee2236c`；既有 `DEX_AUDIT_PASS classes=64580`，无重复/测试/回环泄漏。本轮不签名安装。

对冻结接受M5h实际ZIP逐条目比较：APK仅 **classes13.dex** 改变，**18390**其他条目同字节，无增删，包含resources.arsc、全部XML/资源和AndroidManifest。无需重解码原字节不变的资源再冒充新语义认证；本轮实际资源重编译已通过。MPP74条目只有manifest和内嵌MPE变化，另外**72**条目同字节，无增删，根补丁DEX/全部14语言资源保持。

两个DEX（含未变classes12以直接检查Bridge）的839类canonical内容审计保留成员/代码/debug；无新增/删除。835类原样；4个raw变化中CaptionDiagnostics/BuildConfig仅两已知build ID字面量；另为SourceCaptionCache及其Entry。额外 `entry-debug-proof.json`去掉方法debug后证明Entry内容完全相同，变化仅方法debug/行号；业务逻辑变化只在SourceCaptionCache。Hook、HookV2、NativeCaptionBridge原类内容相同，不以DEX整体偏移替代逐类说明。

| MPP主要压缩条目 | M5h | M5i | 增量 |
| --- | ---: | ---: | ---: |
| 内嵌MPE | 343895 | 344022 | +127 B |
| manifest | 261 | 261 | 0 B |
| 资源/其余条目 | 同字节 | 同字节 | 0 B |
| ZIP结构 | 相同 | 相同 | 0 B |
| MPP总量 | 596013 | 596140 | **+127 B，约0.0213%** |

MPE未压缩731456→731840，+384 B；MPP中的二次压缩增量127 B不能与384相加。增长对应源缓存替换/恢复/锁边界和身份变化，没有新依赖、类、资源或测试/诊断资产泄漏。组合APK增285 B。测试、报告、fixture、封存类及历史增长均不装入MPP；不能由包体推断主线程/内存/帧率。

## 保护检查、辅助失败及证据时点

`protection-audit.json`按入场2245项核验：159个生产main文件只改变SourceCaptionCache，其他生产原字节保持；146个原测试/资源文件保持；2233个范围外现存文件、六前端、190个工具/CI/构建文件及15194项有限历史/交付保持。两项原删除状态、分支/HEAD/索引保持；状态镜像同字节。core生产/来源和原黄金值均未变。

保留且明确区分以下开发/审计偏差，不计产品红测、不删原日志：

- source-red第一次因Android编译classpath无Files.readString而编译失败，测试未执行；最初helper拷入的127项旧XML是stale，不能作为本轮结果。修fixture API后source-red02才是有效8项/3失败基线。
- core-green01缺Host抽象方法而编译失败，0测试；core-green02实际8项/1失败源于手工Session fixture未初始化displayLayouts，不是产品故障。旧helper误找模块build目录输出0项；下一Gradle前已从receipt指明的真实目录补存 `core-green02-actual-xml` 与 compiled-v2，原失败/0项摘要均保留。补完整fixture后core-green03通过72项，原应有断言未放宽。
- 初次内容审计只枚举变化DEX，Bridge位于原字节不变classes12，因缺查询项KeyError失败；保留attempt01，扩入该未变DEX后直接证明Hook/Bridge边界，没有修改生产/组合/审计器规则。
- 初次有限历史保护发现Gradle切换构建输出目录后移除旧M5h candidate-03下44项测试编译中间文件（43 class及previous-compilation-data.bin）。交付MPP/MPE、封存compiled ZIP及原XML/receipt未变。没有缩减清单；从现存工作区编译目录逐项找到**全部44项与入场SHA相同的原件**，全体预检后精确恢复，并封存restored-entry-intermediates.zip/逐项来源/哈希，复查全清单通过。未清共享缓存、未重新编译伪造旧输入。
- 入场原件ZIP/manifest在10:38:17 UTC完成，新测试首写10:40:44、首Gradle命令10:41:04。历史哈希清单完成10:41:10，晚于首次命令6秒；它只读取本轮不应改动的旧历史，前置M5h接受清单和本轮完整退出复查交叉保护。准确保留这个时点偏差，不写成整份历史清单在首Gradle之前完成。

最终完整输入仅一次，没有因上述fixture/审计问题重复全861项或规定组合。完整入口后没有工程输入变化，后续仅文档/证据/只读审计与恢复精确入场中间文件；source指纹再次核对。

## 保留限制与统筹需判断内容

缓存合同分别列明事实、动态缺陷及源码窗口：源checkActive→put不是与clear的原子事务，clear后才调用put可能取得新epoch；这不授予旧Session显示或请求权。两文件格式没有跨进程/断电原子性；第二次IO导致metadata恢复失败时只尝试本键失效，删除本身永久受阻未认证；ATOMIC_MOVE不支持时放弃缓存写。可解析的合法文本没有外部video/language真实性或全部截断完整性认证；未擅自改格式/身份解决这些产品策略问题。

真实设备/OEM/硬件/ACL/磁盘满、落盘/杀进程/断电、任意线程排列、TTL时钟跳变、全部格式/源候选组合、其他YouTube/官方根选择、远端CI、真实YouTube/provider/费用未认证。测试只在自己目录恢复fixture，不读取、清除用户真实缓存/profile/密文，不将测试原件ZIP当作用户备份/产品恢复工具。M5h多store/orphan/备份/硬件限制保持。

请统筹复核本卡修复、规定验证和上述边界，决定是否接受缓存组；执行者没有下发下一卡或自行宣布总体成熟化完成。

## 逐文件回退与交付状态

当前合同、维护入口/路线、架构摘要、收尾清单及PROJECT-STATE/同字节镜像已更新。退出计划 **13目标**，exit-originals.zip SHA-256 `e49a26e43144f08c047561da089c814608309d356ac92d124e43d1bd010a8e86`；逐项entry/exit SHA、原件、可读diff均已封存。回退包括本轮SourceCaptionCache/build ID/相关文档、状态/镜像成对、两新测试和新缓存合同；结果、证据、历史与所有新旧包排除在外。

```powershell
& 'E:\Projects\DeepSeek morphe-ai-caption-translator\work\toolchain\python\python.exe' -X utf8 `
  'E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261025-M5i-01\rollback.py'
```

**实际仓库默认dry-run通过，没有实际apply。** 只有显式追加--apply才恢复本批入场字节；先校验所有退出SHA/两ZIP/安全路径，任一后续编辑/删除整体拒绝且零写入。E: `.tmp/M5i-rollback-rehearsal-02`实际演练dry-run、后续编辑拒绝且零写、恢复正确退出字节后apply、13目标精确还原/新增文件仅在演练移除、状态镜像成对一致。

全部项目工作在E:；共享安装工具原位保留。没有commit/tag、推送、PR、发布、签名安装、清用户数据或真实缓存、真实付费API、共享缓存清理、reset或clean。最终仅标记**完成待复核，统筹待复核**，交回本结果。
