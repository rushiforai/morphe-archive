# PROJECT-STATE — 当前维护状态

更新：2026-10-26（Asia/Shanghai）。**首轮工程成熟化已按规定范围验收，转入日常维护。** [最终验收](maintenance/reviews/M7-FINAL-ACCEPTANCE.md)固定范围/证据/限制；[完整历史索引](history/README.md)、旧N*、原报告/复核/失败/交付保留。

## 当前身份

- 唯一活动仓库：`E:\Projects\DeepSeek morphe-ai-caption-translator`。
- 分支`codex/fix-cc-authority-1.5.8`；HEAD `de844402776e1046a5bec87aac94e2e65f05bea7`。多轮既有未提交/未跟踪修改及两项删除保留，不能以HEAD代替完整当前源码；index/exclude未变。
- **当前接受本地产品：1.5.8 / local-1.5.8-m7b / candidate-02**。MPP SHA `d0f84dfab104c6167126042247734e2b1d4e6c33de332df6d59ff49aa153cd30`，600263 B；MPE `1d9cc55df0a158fa89d8c7b6190c946f5b67d6ecc14aff23aba3f5139880d6a0`；工程指纹`7bcddcbc4f76d37f15019a8c919473644c892b5c1d1c45888b0cad80796f6bb6`。路径见[M7b结果](maintenance/results/M7b-RESULT.md)，手机副本（本机归档：`build/maintenance/M7b/device-handoff-20261026/anchored-ai-captions-1.5.8-m7b-candidate-02.mpp`）与原MPP同字节；无新构建。
- **公开仍1.5.7 / release-1.5.7**，tag v1.5.7、发布提交18c6141；原资产SHA `41d96e4b65ed9419854e02013ba71d73b884ad444683ddd559ec32e74da77159`、587256 B。未发布或更新公开元数据。M6a/candidate-01等历史包均保留。

## 日常入口

[开发环境与来源](DEVELOPMENT.md)、[日常操作](maintenance/OPERATIONS.md)使用Git可见`tools/workspace/`，显式工具及E:可写缓存/临时目录输入；`.devenv`仅兼容别名。隔离复跑已验“源码＋已装工具＋已缓存依赖”，不是空缓存新机器/在线认证通过。

[维护入口](maintenance/README.md)、[路线](MAINTENANCE-ROADMAP.md)、[收尾清单](maintenance/COMPLETION-PLAN.md)、[兼容分层](COMPATIBILITY.md)、[设备记录](maintenance/M7b-DEVICE-ACCEPTANCE.md)、[发布边界](RELEASING.md)。状态/网络/配置/缓存/诊断合同从[架构](ARCHITECTURE.md)进入。

## 最终接受依据

M0–M7a及[M7b本地复核](maintenance/reviews/M7b-REVIEW.md)各规定范围保持；最终完整本地core328+extension547=**875项**，失败/错误/跳过0、115 XML及同次557物理编译输出/receipt已核验，统筹另重跑29项。两实际电脑组合为21.41.525-SECONDARY和21.28.208 / 官方1.48.0 / Patcher2.0.0 / 104兼容默认根+AI，资源重编译/DEX审计通过；两unsigned APK仍仅电脑结构证据，不是手机签名包。

2026-10-26用户对手机操作/观察清单回复“都没有问题”，并提供诊断。**接受单设备短使用验收，M7及首轮工程成熟化收尾通过。** 用户报告环境为原Manager2.2.0 / YouTube21.20.405 / 官方1.48.0，原始APK可用、数据/签名未重置。诊断manifest及首次draw Hook均为`local-1.5.8-m7b`；记录含普通/全屏/Shorts、源字幕、切视频及翻译显示。安装/设置保留/开关/评论/重入按用户总体反馈记录，不虚构独立逐项设备自动测试。

用户诊断SHA `5484d29406ce5de59aafdcf408cd5f3c3c4509270c00c49d3c2b3b1c07043b64`，367556 B；E:私有证据`validation/runs/20261026-M7-final-acceptance-01/`。两个已记录source_passthrough会话无模型HTTP；用户另行实际翻译13次HTTP均200，头部累计13成功/0失败/0内部重试，25284 tokens，含质量建议。不能称全程零调用、完全语义正确或账单认证；这些用户自行使用证据不授权代理未来调用服务。

## 保留限制及后续

手机型号/Android/ABI/实际包名/versionCode/签名证书/安装APK SHA/完整选择集未独立读取；环境版本按用户报告。运行时official/Patcher仍unknown/runtime_unverified，构建预期1.48.0/2.0.0不能充当设备来源实读。21.20.405现有用户设备证据，不倒填为第三组电脑资源/DEX组合。

远端CI、空缓存首装/在线registry认证/Maven发布commit、硬件Keystore/物理IO尾延迟/帧时/内存/耗电、长期稳定、其他组合/OEM/提供方/14语母语质量及任意线程交错保持未全面验证。主线程启动严格读取、配置多store/orphan、源put前晚到窗口/跨文件断电/双IO等按原合同保留。真实服务已有用户样本，账单/全部故障路径未认证。

**暂无新的预设优化任务卡。** 后续依据实际问题或用户明确的新需求做有界维护；不以继续重构、测试数量或目录缩小替代已完成验收。正式发布、官方PR/远端CI或新的设备/冷启动验证另行选择，本次不自动执行。

首轮验收结论和候选保持不变；后续本地整理只改导航/忽略/历史生成物标注并归档临时副本，详见下节；未改生产/测试/构建工具实现或重跑Gradle。代理未commit/tag、推送/PR、发布、签名安装、卸载/清用户数据/缓存、调用真实付费API、清共享缓存或reset/clean；用户自行安装/使用单独记账。状态镜像`.verification/state-mirror/PROJECT-STATE.md`与本页逐字节相同。

## 本地整理与GitHub计划（2026-10-26）

按用户新要求完成[本地整理](maintenance/results/WORKSPACE-ORGANIZATION-RESULT.md)，当前入口见[文档索引](README.md)/[工作区地图](WORKSPACE.md)。5755个临时文件（原4.79GB）按1641个内容对象可恢复归档为181.63MB，净文件体积约减4.60GB；包含286个.tmp散文件、5468个JVM测试临时文件和1个Python编译缓存。原路径/SHA映射及恢复脚本默认只检查，隔离精确恢复/后续冲突拒绝已演练。正式/历史/候选包、封存证据、6个源APK、工具/共享缓存、M7a源码演练和其他旧仓库保持；新增ignore及recovered生成物标注，本机exclude/index未变。

[GitHub计划](maintenance/GITHUB-UPDATE-PLAN.md)仅GET盘点：远端main/dev仍de84440，公开1.5.7，39个Release、9分支、5个依赖PR。两个旧fix分支已并入main可列未来删除，依赖PR需逐项验证；旧诊断仍有冻结回放依赖，替代成立前保留。已验收源码仍在本地脏树，私有入场源码ZIP已核验；没有commit、推送/PR/Actions/发布或管理修改。

证据`validation/runs/20261026-workspace-organization-01/`；私有备份`.verification/archives/workspace-organization-20261026/`不公开。生产/测试/构建验证输入指纹仍7bcddcbc4f76d37f15019a8c919473644c892b5c1d1c45888b0cad80796f6bb6；875项旧有效记录未重跑，候选同SHA。状态镜像同字节，不由本地整理推断线上已更新。

## 1.5.8发布与线上整理（2026-10-26；执行中）

用户已明确授权将最新验收版本作为1.5.8推送GitHub，并执行此前线上整理计划；旧“只读/未授权发布”描述保留其历史时点，不限制本次新授权。按当前发布链先固定源码/公开内容、验证工具和真实feature CI，再发布并核对匿名来源/资产；历史Release/tags/资产保留。不做新的字幕算法优化，不调用模型或操作用户设备。证据`validation/runs/20261026-release-1.5.8-01/`，入场原件/源码/索引已封存；当前仍在原分支。
