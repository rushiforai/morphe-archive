# N37 本地测试交付与收尾

日期：2026-10-05（Asia/Shanghai）。收尾记录时间：2026-10-05T14:38:57+08:00。

源码：`98ac1a16440f64d8b1e095d0f4496cae7cdcece9`；源码锚点 `anchor/n37-98ac1a1`；完成锚点 `anchor/n37-final`（从 Git 解析，不由旧短哈希猜测）。

## 0. 结论与边界

N37 本地实现、验证、三包整理已完成；实体手机 after 仍待用户执行。没有安装、启动、触摸、清数据、改设置、push/app_process、签名或发布实体手机；没有远程翻译请求、新依赖、工具或 SDK 下载。只使用已有 JDK21、离线构建及明确 serial 的 SDK35 emulator-5554。

最终稳定产品身份：full-04 共 727 项，failure/error/skipped 全为 0。保留 N36 的全部 716 个原测试身份，新增 11 项；旧失败 XML、原断言文本、各候选包和试验记录均保留。full-01 为 727/3fail，full-02 为 727/1fail；full-03 在后续真实审计前为 727/0fail，最后 Hook 外层→原内层接缝修订后运行 full-04，绑定最后代码。不是只把同一输入多跑一次直到绿；每次失效及修订见下文。

## 1. 原目的 → 保留目标 → 分支 → 替换实现 → before/after → 边界

### A 小窗即时隐藏

- 原目的／保留：N36 Authority 主导许可，转场禁止扫描、测量和不必要排版；小窗安全空白与快转场继续保留。
- 分支：正式 DeepSeekCaptionHookV2 → 原公开 inner Hook → Controller → Guard；COMPACT、CLOSED、UNKNOWN／owner 无效的主线程许可否定。
- 替换：Guard 在同次提交调用 denyDisplay；先撤销 queued player render 与旧 command，按 owner epoch 拒绝旧清理，结束 drag/input/focus，anchor 置 INVISIBLE 并屏蔽 accessibility 子树；不清计划、事件、cache 或位置。真正恢复仍走原 Guard surface 判据。外层/内层同批责任 OR 合并，owner epoch 用 volatile 发布。
- before：mechanism-before-01 原 showEvent anchor 在 MIN 后仍 VISIBLE；after：N37PlayerEvidenceTest 实际入口中/日/阿语短句、长句、loading，MIN/HIDDEN/PiP/sliding 立即 not-visible、触摸拒绝、无新增 scan/planning，重复通知、旧 owner 和 off-main 外层责任验证。
- 边界：sliding 只按安全否定，不猜混合枚举方向；普通句末／clear 原隐藏语义保持。没有把 native fixture 当 OEM 小窗录像。

### B 暂停与显示时间同源

- 原目的／保留：暂停稳定、不被旧低优先级时间回滚；真正 paused rewind 仍即时有效，不把页面强制单调。
- 分支：Controller time/position/displayPosition、frame guard 与 paused scheduler 消费 RebuildClock Observation。
- 替换：native position/state/speed/origin 成组选中，native 不可用才合法同 owner MediaSession 再 hook/frozen；freeze 按 session/owner/clock epoch 绑定；旧 media/hook 不能给 native pause 捐时间，真实 native rewind 和原 native-unavailable explicit hook seek 保留；seek serial 避免 query 与 hook 双登记。
- before：native paused 28290 被 media 27922 freeze 覆盖；after：28290/27922、32235/31861、43120/43060，±20/100/400ms、1/1.5/2x、中日阿语，选源与冻结一致，playing/paused 反向、native rewind、旧样本、resume 等进入真实 adapter/Controller。temporal ledger 在最终全量证据中。原 jitter、1500ms fallback safety、小 backward 与 timer projection 回归仍保留。
- 边界：1500ms 仍是旧 native-unavailable 降级目的，不作为所有源真实性判断；真实较早 native 暂停可以显示较早字幕，拒绝的只是失选旧时间回滚。未加固定偏移／延时下一页。

### C 非阻塞诊断与幂等绑定

- 原目的／保留：普通滚动不等待归档，展开／刷新／复制／完整导出可用，14语言、4编辑字段、profile、composition/selection 和暖预览仍保持。
- 分支：诊断 getView/onCreateView/TextSlot 只 peek 已脱敏 snapshot；explicit refresh 走 report lane，callback 核对 weak root/body、attach、window token/root、request、locale/profile/clear epoch。
- 替换：bounded serialized writer 处理 redaction/credential/append；report lane 生成 immutable volatile panel snapshot；初次显示 14语言 loading，不以 raw pendingSummary 当安全文本；复制仅完整且当前 snapshot。clear 立即撤销 epoch/snapshot，物理清理后台；完整 export 仍经过后台 materialization 与 archive 读取。summary 为 atomic latest slot，legacy log 只后台 bounded tail 迁移，完整 history/quality/timing 不截掉。
- 绑定：仅真实 direction/LocaleList、text/hint 或 authored span 样式变更才 setter；忽略 native NoCopySpan 选择标记的文字等价；首绑定先设置 canvas direction，同输入 preview 外层行不 requestLayout。native enabled/navigation 路径不替换。
- before：collapsed getView 被归档 Future.get 阻塞；同 Locale setter 与暖 preview 外层行再次 requestLayout；after：SDK28/35 受控 backlog 下普通 getView/clear 返回、main credential load=0、安全 snapshot；SDK35 原 official 设置＋资源＋生产 DEX，约 3.8MB synthetic safe archive，12 个中/日/阿语 × font1.0/1.3 × 手机1264×2736/density560／320dp 窄屏场景，3轮 slow/fast/fling 实际跨预览上缘，无 dataset change，forced scroll/padding 增量0；单独归档阻塞14999ms期间自然手势完成。
- IME：test-only :ime 接收命令，通过平台 InputConnection 操作并回 ACK；52 条真实跨进程命令，4字段 composing/commit/delete/paste、prompt 中文 composing／日文 commit，实际 EditText 与保存值一致，scroll recycle/reopen、dummy profile 往返保留 custom prompt。测试组件不进入 MPE/正式 APK。
- 边界：未宣称所有帧无 jank；矩阵最大帧间隔有149ms，仅作为共享机制／自然边界证据，不能证明已捕获 OEM 的唯一现场栈。带 archive backlog 场景与 unit main-load 计数不等于对每个 Android 系统调用的全量 tracing。未关动画、固定剪字、移走 preview 或请求 canvas focus。Slider 轨道/测量未重构。

### D 压力分类、边沿与请求身份

- 原目的／保留：费用、attempt、focus2/prefetch2/总4、30s lookahead、deadline 和 retry/semantic/过滤/Publication 合同不变。
- 替换：TransportFailure 显式互斥 category CANCELLED/DEADLINE_EXPIRED/CONNECT_TIMEOUT/READ_TIMEOUT/NETWORK_IO/HTTP_CONFIG，timer fact 和 intentional cancel 保留；Audit 新增量分类，不重分配旧累计。REUSED 以每 Job 的 generation/lane/dispatched/sent edge 记录，重复次数总表及 job 结束可导出，保留开始/response/cancel/首显/owner 证据。
- after：类别 fixture 验证 cancel、deadline、connect/read timeout、socket（deadline timer fact fixture，不伪称远程超时复现）；原 n24 场景收到两 focus＋两不同 block 的合法 prefetch，4个唯一 requestID／block，门控 before acceptance focus2、after acceptance prefetch2／总4，每 block1次，30秒范围仍检查；原 fail XML及expected2原断言存档。
- 另一全量失败是容量 fixture rapid seek 在首请求尚未发送时合法替换未发送 job，却后面要求 block0/1 完成；改用实际送达 gate 锁定阶段，保留并发上界与负例，未 sleep 放宽或独立 JVM 过关。旧 N29 pause fixture 补同 owner MediaController package；旧 editor LEGACY root traversal把真实 editor尺寸重置0，改 native／有效窗口尺寸并新增非零断言、生命周期 destroy，保留原 focus/action-mode/paste 目的。
- 输入事实：诊断 N36 已确认段以首次可确认时间1791160215527为起点；42 request/39 response/2 cancel/1 unfinished；slot max67ms、source queue max15ms、network median4070/p90 4916/max6518ms，1310 REUSED。没有据此增并发／延deadline，也没有把 mixed N35历史累计作新压力数据。

## 2. 最终验证与可复查证据

| 闸门 | 最终结果 |
|---|---|
| Java 全量 full-04 | 727/727；fail/error/skip=0；N36 716身份全保留＋11 |
| Python／发行 | 27/27；11/11 |
| 本地化 | 241 keys ×14=3374，XML/catalog/source-map/fallback 同步 |
| 冻结计分 | 4通过/4失败/4未验证；三类 invisible_ms=0，不改变 ACCEPTANCE |
| Composition | AI-only与Remember-only真实结构组合各 STRUCTURE_PASS；both真实编译 COMPOSITION_PASS |
| 三包 raw DEX/分支 | APK11 DEX；invalid_branches/dex_problems/binding_failures=0；MPP2/MPE1 DEX 同通过 |
| N27 接缝审计口径 | require-ai=false：N27控制避让 observer原已撤回，不恢复；最初误用true所得ai_callback_missing失败保留，不当产品回归 |
| 官方方法 | 39个选定原官方设置方法与N33基线完全相同，非官方全类全方法承诺 |
| 资源／CRC／签名 | MPP内MPE逐字节一致；ZIP CRC／DEX头校验／3 settings XML导航／14 preview_hint；正式APK仍unsigned |
| 原生输入 | 最后candidate-09/10 host使用最终 APK原DEX与资源，输入、保存、回收、profile往返通过 |
| 原生滚动 | 12自然边界场景＋归档backlog通过；复用 UI证据时源码只差两个player Hook，身份有校验 |

- 全量 input SHA：`501a9342e5811927f4689cf494b211bcd561fdd90231f1641ccbb9a90c5a10a2`。
- build input digest：`579960cb1b4c737465439621eb3f94d7867e3b93c69e13d05dea0f0f2414d8e1`。
- final-checks.json 已核对 source snapshot、实际 XML 计数、COMPOSITION/STRUCTURE markers、成功日志、最终三包 SHA、真实分支 report、CRC、旧 identity，未使用 assert ... or True 或“目录存在即通过”。
- 证据根：E:/Projects/morphe-caption-v2/.verification/n37；原 before 根：.verification/n37-planner。最后审计 .verification/n37/final-checks.json 和 final-checks-source-bound.log。
- 失败保留：full-01/full-02、各focused fail XML、apk-branch-audit-01/02、resources-01/02及原生candidate输入失败／crash；candidate与最终包路径分离。
- 有新实质改动才复跑受影响lane；最后稳定源码全量full-04，其后的收尾为docs/打包副本与身份核对，未再次构建产品。

## 3. 交付三包

### MPP
- 文件：E:\Projects\morphe-caption-v2\build\local-test\patches-1.3.5-本地测试包-n37.mpp
- Bytes：1,283,677
- SHA256：`A4D50BCF9C045318EF17F7AD5D86463B3F89ACD207E02EE71F69DD5ABC2BAA31`

### MPE
- 文件：E:\Projects\morphe-caption-v2\build\local-test\extension-1.3.5-本地测试包-n37.mpe
- Bytes：3,135,748
- SHA256：`5445055CDF8992C792B0FFC72961D5D5320EA25E2907BE97408EB4DAB29776AE`

### APK
- 文件：E:\Projects\morphe-caption-v2\build\n37-composition-final\YouTube-21.16.256-本地测试包-n37-unsigned.apk
- Bytes：198,261,990
- SHA256：`B6CC3D0AC0DC9E6CFAD1298EA5409CFD0D2871C0E4112CC3685319D5CA3B5118`

## 4. 最后用户短验与回退

1. 有字详情 → 小窗立即无字 → 回来当前句，3次；快 MIN→MAX→MIN。
2. “字幕样式”标题／间隙／preview上缘慢快拖3次；prompt输入后隐藏IME，再滚动。
3. 两句边界暂停／续播；一次暂停时真正小幅往回seek。
4. 快速换视频／target／带cache开关；导出完整 diagnostic。

原 N36/N35/N34 三包和输入哈希已开工一次核对；backup/pre-n37-n36-3bf88d2、原N35/N34标签与脚本保留。N37-RESTORE-N36.ps1只在用户明确选择恢复时执行，先保留WIP/commit/包/证据，不reset/amend/删证据；源码恢复不等于手机换包。

SDK35 emulator原override1500×2400/density480及原IME已恢复并核对。实体手机全程没有写入。本卡收尾后停止；不自派N37r/N38、不推送或发布。
