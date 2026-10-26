# M7b统筹复核：本地交付接受，设备验收待输入

2026-10-26（Asia/Shanghai）。**接受M7b v1 A/B/C的本地工程、兼容/来源说明、两组有限组合及安装前准备；设备仍待安装/待观察，M7及首轮总体尚未作最终接受。** 当前接受本地产品为1.5.8 / local-1.5.8-m7b / candidate-02，公开1.5.7。candidate-01及M6a/M7a旧包不覆盖。原[任务卡](../tasks/M7b.md)、[结果](../results/M7b-RESULT.md)、失败/红绿/组合证据保留；独立复核 `validation/runs/20261026-M7b-coordinator-review/`。

## 接受的修正及范围

CaptionDiagnostics保留official字段，明确unknown/runtime_unverified；patcher运行来源同样未知，build_expected与实际离线组合分别解释。固定core commit/local adaptation记录准确，不将本地已通过组合倒填成设备运行来源。NativeCaptionBridge首draw的build=n30/official1.45.0也取得有效红测后改为当前BuildConfig和qualified unknown。保留事件名/一次采样门、旧日志/累计/脱敏。

统筹对两生产文件做精确逆替换，去掉本轮来源文字改动后全部正文与入场相同；绘制判断/Hook/请求/调度/配置/缓存/Overlay算法未变，core/依赖/资源未改。工程差异仅这两生产文件、新测试和build ID。导出unknown是对可观察能力的如实说明，不是缺少本地组合证据。

## 独立验证

- **29项实际重跑全部通过**：七类包含M7b真实report/fullText/首次draw三个用例、原诊断长归档/本地化/原生字幕/AI开关、TokenCostAudit黄金及M6a实际失败决定链。0 failures/errors/skipped，XML/receipt见targeted-evidence.json。没有重复全部875项或组合构建。
- **原始红绿有效**：red-01的两条真实导出来源断言失败于official期望unknown实际1.45.0；red-draw-01三项中仅首次真实draw断言失败，原文build=n30/official1.45.0。受影响生产源码与入场ZIP完全相同，修后最终断言继续保护unknown/真实build、旧历史字面值和脱敏，没有构造失败冒充红测。所有既有152项/src/test路径文件保持原字节。
- **最终875项对应当前源码**：final-02/run的115份XML逐项SHA/receipt核对，core328+extension547实际执行、失败/错误/跳过0。当前与完整入口前后manifest相同，指纹 `7bcddcbc4f76d37f15019a8c919473644c892b5c1d1c45888b0cad80796f6bb6`。compiled ZIP/receipt/每条SHA及归档顺序有效：638归档条目含81份core路径别名，别名字节相同；按采集路径映射为557份编译输出，不把638称新增类数。归档core重查来源/compiled/UI/包边界通过；candidate通过，旧m6a冒充m7b和local冒充release实际拒绝。
- **两组有限输入/输出实际核验**：重新apksigner验证两个原始输入，SDK分段签名证书匹配项目已有两摘要；重新解析输入8 DEX分别56360/54032类，无addon/official-extension命名空间，不按文件名认定原始。该证书摘要匹配不额外认证下载渠道/原发布所有权。官方1.48.0/Patcher2.0.0输入哈希、各组104根及实际Gradle成功记录核对；主16 DEX/64581类、补充16 DEX/62253类，无重复。aapt实际读取包名均app.morphe.android.youtube、minSdk29、四ABI；主code1561303419、补充1561185128。两输出apksigner均因缺签名拒绝，没有生成签名安装包。
- **产物及内容**：MPP `d0f84dfab104c6167126042247734e2b1d4e6c33de332df6d59ff49aa153cd30`，600263 B；独立/内嵌MPE `1d9cc55df0a158fa89d8c7b6190c946f5b67d6ecc14aff23aba3f5139880d6a0`；UI `374fe8bb89417d16801a02f03eafc4197ef69c9e6bbcae71fbbc3b7b7bfed89c`。主unsigned APK `379d1643ea7ba088f3f9c707fdf69bcc6dea6e98a4d0cdb9c81cbf54d5714d67`，补充 `dd83936dbc2351efd8cae36d2b8516ffe07efb892a1a05ef397eba71f4f7cde9`。MPP其余72条目同字节；主APK对接受M6a仅classes12/13改变，其余18389相同。统筹重编审阅过的只读canonical/资源工具，840类无增删，排除build ID/debug后只有CaptionDiagnostics/NativeCaptionBridge变化；3346个cap值/ID及六XML语义相同。MPP增加116 B全部MPE压缩，资源/ZIP结构0。
- **保护/回退**：2275入场项原件及哈希核对，15既有变化、2258范围外现存+两原删除状态保持；17371历史项、911证据索引相符。本轮17个回退目标的原件/退出SHA与默认dry-run在本统筹改文档前通过，实际仓库未apply；不沿用M7a的31目标计划。分支/HEAD/index/exclude与完整历史归档保持，状态镜像一致。

## 历史封存时序偏差

接受已披露偏差，但不改写事实：源码/文档/索引/exclude原件在首改/Gradle前保存；首历史helper遍历过宽被停止，最终历史SHA封存在首Gradle之后。统筹本轮重新逐项核对全部17371项，且16617项可与前次已接受M7a历史清单的SHA完全交叉匹配，未发现旧资产变化；新M7a封存记录本身也在其原索引/本轮清单中。证明了现有资产与可用基线相符，**不能倒证所有新增清单项都曾在首Gradle前封存**。该时点缺口保留，不需要通过重跑无关全套伪造历史。

统筹自身包审计首轮把source-stamp证书也混入APK signer比较，第二轮辅助脚本缺collections导入；限定^Signer及补齐导入后完成独立签名/类/包体/资源检查，原失败log保留。不是产品或原有断言失败，没有修改候选/放宽两处文字以外的生产保护。

## 当前结论及设备收尾

本轮规划内**本地工程、工具、资料和有限组合准备已收尾，不再预设新的功能/重构卡**。首轮最终结论仍需安装身份核对和短设备观察（或明确由用户选择延后、保留其影响），不能把本地接受写成设备/硬件/真实API收费认证。远端CI、空缓存冷启动/在线认证/Maven发布commit/Python可执行来源、其他组合/语言/OEM、配置/缓存与主线程启动长尾等原限制保持。

用户追加明确：**现有改版YouTube由手机Morphe Manager打补丁安装，原Manager仍在；版本为Manager2.2.0 / YouTube21.20.405 / 官方补丁1.48.0。** 这是用户报告信息，尚无设备签名/包名/精确versionCode实读。21.20.405在声明列表但没有本轮当前候选实际组合，不能把电脑主组合21.41.525的结果倒填到该版本。下一设备工作优先核对原Manager/原签名、是否保有21.20.405原始APK和匹配选择，避免擅用桌面新签名或未经说明更换宿主；Manager仍在不能单独证明签名未重置。无需上传keystore/私钥/密码，不自动读取或导出。

设备仍未连ADB，未获取型号/Android/ABI/现有包签名；本轮没有签名/安装授权。接下来在当前对话核对版本、原签名是否保持和安装方案，再由用户明确执行或授权，按[设备工作单](../M7b-DEVICE-ACCEPTANCE.md)完成少量操作。**不要求再开一轮代码优化对话来代替手机验收。**

统筹查阅Manager **v2.2.0固定tag**的官方patch-sources、backup-and-keystore、patching-expert-mode和updating-patched-apps文档：该版支持本地MPP更新、选择已保存原始APK并保留原选择；可覆盖保留数据的条件仍包括原keystore未变。手机是否保有原始输入、签名是否保持及选择是否与本地组合相同尚待用户确认，不能据官方功能说明伪造本设备通过。

统筹只审查/针对性测试和更新维护说明，未改生产/既有测试/工具实现；无commit/tag、push/PR/发布、签名安装、卸载/清用户数据或真实缓存、付费API、共享缓存清理/reset/clean。
