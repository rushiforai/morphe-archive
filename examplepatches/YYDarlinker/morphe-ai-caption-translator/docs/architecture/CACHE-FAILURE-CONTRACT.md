# 翻译结果与源字幕缓存故障、恢复合同

2026-10-25，M5i v1经[统筹复核](../maintenance/reviews/M5i-REVIEW.md)接受本轮损坏读取/故障恢复、三项替换修复、put后epoch及Publication规定范围和披露限制。当前接受本地1.5.8 / local-1.5.8-m5i / candidate-01，公开1.5.7；原[结果](../maintenance/results/M5i-RESULT.md)与证据保留。以下进程内成对提交、源checkActive→put窗口、跨文件崩溃/双IO等界限不被扩大为全部事务认证。

## 当前边界与身份

| 项目 | 翻译结果 | 源字幕 |
| --- | --- | --- |
| 实现/读取调用 | `RebuildCache` → `RebuildController.restoreCandidate`；成功翻译在 run 中 prepare/reserve/commit | `SourceCaptionCache` → `RawCaptionSource.loadTrackOwned` → LoadedTrack/CaptionDocument.parse |
| 目录/格式 | 应用 cacheDir 下 `caption-events-r2.12`；`<identity>-<block.id>.json` | cacheDir 下 `deepseek-source-captions`；`<key>.source` 与 `.type`；版本盐 `source-caption-v3-layout-identity` |
| 身份 | 协议版本、语言策略 fingerprint、endpoint/model/有效 prompt、target、表现策略、源字词/时间/精度；authored 时还含 cue 合同版本与 cue 分组 | SHA-256(版本盐+描述符语义)：video/id、lang、kind、name、fmt/xosf 列表、variant、exp；无 video/id 则原 URL；签名及 expire 等不在显式语义字段；reference 使用 `reference-` 前缀 |
| 大小/寿命 | 单条 256000 B；最多 256 个 `.json`、64 MiB；按修改时间保留最新，不设 TTL | 单条 16 MiB；最多 180 个 `.source`、80 MiB；24h，命中触碰 body/type 修改时间；按 body 时间淘汰 |
| 线程 | prepare/fsync、read、commit 均在生命周期锁外；class monitor 保护 commit 顺序、clear/trim；Session/Publication 单独控制资格 | 原有一个 daemon 单写线程；staging 在提交锁外；get/remove、成对提交、clear 共用原 COMMIT_LOCK；clear 增加原 EPOCH |

本轮不改变以上身份、格式、目录版本、TTL、上限、淘汰策略或线程数量。F3 保留：仅替换 key/profile、其余语义相同时可复用译文磁盘条目；缓存键不是租户命名空间。真实请求凭据、audit 和输出仍归本次 Session/scope；命中本身不批准旧 Job 发送、reserve 或显示。[状态合同](CAPTION-STATE-CONTRACT.md)、[网络合同](NETWORK-FAILURE-CONTRACT.md)与 [配置/凭据合同](CONFIG-CREDENTIAL-CONTRACT.md)继续约束邻接边界。

缓存不是带签名的证据库。文件名/调用参数给出身份，译文内容按当前源块重新解析/审查；源 body 没有独立 video/language 认证字段。把一个完全合法 body 人为放到另一个合法键名下，不属于当前格式能够检测的全部篡改情形，不能声称获得语义真实性认证。本轮没有为此改格式或迁移。

## 命中、拒绝与用户继续路径

译文 read 先限制单条大小，再以当前 source/block/language `parseBound`，非英译中还做 layout review；actionable review 的 score 必须为 0。空、截断、坏 JSON、错误 block、错误引文及不兼容源范围抛错时删除单项并返回 miss；review 风险返回 miss，不一定删除该 JSON。prepare 不缓存有开放 review 风险的计划；生产调用者还拒绝 partial。前缀/部分显示不是可持久化的完整成功。

Controller 在恢复前后检查 CacheLookup 捕获的 Session、generation、source、key、job 槽位；旧会话即使读到合法条目，也不能装入新会话或记作新会话恢复。正常命中不增加 provider 请求；合法 miss 进入原 schedule/attempt/repair/provider 等门。损坏缓存不增加预算、不绕过 F1/F2/F4；失败不显示源文。M5i 实际调度测试为命中 0 POST、坏条目后 1 POST 成功并再次命中、401 后 1 POST/terminal/无源文输出。

源 get 拒绝缺失、过期、零长和超大 body，单项 remove 不清其他轨道；文件读取异常返回 miss。type 缺失或空用 octet-stream，错误 MIME 本身不要求回源：CaptionDocument 按 body 标记识别 JSON3/XML/VTT/SRT。LoadedTrack 必须实际 parse 且至少一个 cue；坏 JSON、HTML/垃圾或零 cue 即使 get 返回 Entry，仍在这里拒绝、remove 本键再回源。合法 JSON3 搭配缺失 type 或 text/html 仍为有效命中，这是现有内容识别合同。

正常源命中 0 GET；M5i 的九个坏/缺/过期/超大/部分条目各需 1 个本地 GET，恢复后重入均为 0 新 GET。坏缓存没有触发额外模型 POST。源网络的鉴权/原格式/同语言 fallback 仍按原 loadFormats/loadFallback 和 deadline/MAX_ATTEMPTS；已有 SourceHttpFailureContractTest/RawCaptionSourceFallbackTest 保留其各自有限预算与取消断言，没有将缓存 miss 解释成无限请求。正常模式、源模式、翻译失败显示保护另外由完整入口中的实际引擎/应用回归约束。

## 写入失败与本轮必要修复

### 翻译结果保持已有实现

prepare 在本目录创建唯一 `events-*.tmp`，序列化并 fsync；失败删自己临时文件并返回 null。Prepared.commit 用 `Files.move(REPLACE_EXISTING, ATOMIC_MOVE)`，失败返回 false，不预删旧目标。WriteOrder 只在尚有 Prepared 持有期间保留该目标最新成功 ordinal；旧 Prepared 不能覆盖新成功候选，close 释放序数/清自己临时文件。临时文件不是 read/trim 的 JSON 条目；显式 clear 会清目录内普通文件。

真实 IO 对照验证目录路径被 fixture 文件阻塞导致 prepare=null；staging 被受控删除导致 move=false，而旧合法 JSON 原字节保持；下次合法写入恢复。没有重写 RebuildCache/Controller 或重算 core 来源。actionable review、旧候选顺序、退休已发送及取消规则使用现有生产和原回归。

### 源缓存修复的三个可复现缺口

旧 replace 为先 delete(target)、再 renameTo(temp)，忽略布尔失败。真实文件实验复现：missing-temp 删除旧目标；type 是受控非空目录时，body 已更新而 type 失败；body 目标受控阻塞时，type 仍变成新值。三条应有行为红测均保留原 XML/log/receipt/基线源码，修后原断言转绿；不是在 mock 方法上返回 false。

当前同一目录 staging/save/flush/sync 策略保持；提交使用 ATOMIC_MOVE，不预删目标。持 COMMIT_LOCK 时先保存旧 type 字节、发布新 type，最后原子发布 body。type 发布失败不触碰 body；body 发布失败时原子恢复旧 type（原无 type 则删除新 type）。get/remove 也取此锁，进程内读者不跨过半套提交；weakerThanCached 的同文 native timing 比较保持。单写线程的 staging 清理仍在 finally。

若 body 发布和 type 恢复同时遭遇第二次真实 IO 失败，代码尝试失效本键 body/type，保留主异常并附 suppressed；不会清其他键。该双失败和删除本身被硬件/权限永久阻止的情形未动态认证，不能声称一切 IO 故障都保住旧值。源缓存是可丢弃优化；网络已成功解析的本次 Source 不因缓存写失败而变成请求失败，后续可合法重新获取。ATOMIC_MOVE 不被文件系统支持时放弃此次缓存写，没有引入先删再 rename 的非原子 fallback。

## clear、旧候选和发布权限

译文 clear 的产品入口是 `RebuildController.clearCache`：先 stop/撤销，再在 CLEANUP 等已准入 Publication permits 与物理 cleanup，之后 clear 译文和源缓存；只有 publicationEpoch 未变且 active=null 才在主队列恢复选中会话。直接 RebuildCache.clear 是文件操作，不是独立的会话撤权 API；Prepared 本身不是提交许可证。

M5i 用真实 Session/permit/Prepared/clearCache 确认：撤销前已准入的原 scope 磁盘提交仍可完成；clear 等 permit 关闭后删它；未准入旧候选无法在清理后凭临时文件复活；停止后的排队 restart 失效，新合法写入可用。PublicationLifecycleTest 继续验证较新成功 ordinal 拒绝旧候选、RETIRED sent 可收尾、unsent/STOPPED 不可新准入。没有把这些边界改成“所有旧写入一律禁止”。

源 clear 在 COMMIT_LOCK 中增加全局 EPOCH 并清自己的目录。put 记录 epoch，队列开始前和提交时均比较；M5i 分别用单写队列 latch 与写入已开始后的 Context IO 边界 latch，固定 clear 前排队/已经开始、clear 返回、释放 writer 的顺序，证明旧 epoch 不复活，新 epoch 命中，临时文件被清理。read/commit 的有界 latch 对照还证明读者等待成对提交并最终取得新 body/new type。

保留限制：RawCaptionSource 的 checkActive→put 不是与 clear 的原子操作；若旧 consumer 在检查后、clear 后才调用 put，它会捕获新 epoch。当前合同不声称完全杜绝所有可复用源字节晚到，也不把源磁盘写等同显示权限。Controller 的 current/generation/输出 guard 继续独立拒绝旧显示。这一源码确认窗口与本轮实际复现的三项文件替换缺陷分开，不据此改变目录身份或产品 clear 语义。

## 证据层级、保护与未覆盖

新用例 `M5iRebuildCacheTest` 与 `M5iSourceCacheFailureTest` 的每个 fixture 目录均在 E: `work/temp` 测试自有子目录；正式证据在 `validation/runs/20261025-M5i-01/`。source 测试走真实 SourceCaptionCache、SourceLoadFlights、RawCaptionSource、CaptionDocument 和 HttpURLConnection；仅 Hook Cronet 路由 shadow 明确将 YouTube timedtext 映射到本地 MockWebServer，未知协议/host/path 直接 AssertionError，未装 TrackFetcher fake。core 测试走真实缓存、Session、restore/schedule/RebuildApi、Publication 和 render guard；源/平台 Host 是受控端口，未映射源调用直接失败；本地 provider 是实际 POST。请求数以服务器收到数、audit attempts 和各自调用层分别记录。

没有新增 Thread.sleep、提高等待上限、整测重试或削弱黄金断言。原 843 项回归保持；正常请求次数、F1/F2/F4、F3 复用、F5 分类、源模式、失败无原文、原生语言/CC、M5h配置/凭据保护随统一完整入口验证。唯一本轮生产逻辑修改为 SourceCaptionCache，另按卡更新 build ID；没有依赖、UI 或资源改动。

未覆盖：真实设备/OEM 文件系统、断电/杀进程/跨进程事务、磁盘满/ACL/硬件故障、所有线程排列、TTL 时钟跳变、全部格式/候选乘积、其他 YouTube/官方选择组合、真实 YouTube/provider/费用与远端 CI。两文件格式没有跨文件系统崩溃原子性，fsync 不等于断电认证；合法但被人为截断成仍可解析非空文件的全部语义完整性也没有外部真值可验证。不得把 fixture 文件恢复当作产品备份/迁移工具。M5i 不进入诊断、性能或下一阶段。


## 当前统筹结论

M5i规定范围与限制已接受，独立core72+extension88=160项通过，完整861项/同次compiled/包身份和指定组合可追溯。新18项独立请求计数仍为9 source GET/2 provider POST/2 audit attempt。源put捕获epoch之前的晚到窗口按源码限制保留，不授予旧scope显示/请求权，不称本轮已修。下一[M6a](../maintenance/tasks/M6a.md)诊断解释/性能机制基线不改变本合同身份/格式/配额。
