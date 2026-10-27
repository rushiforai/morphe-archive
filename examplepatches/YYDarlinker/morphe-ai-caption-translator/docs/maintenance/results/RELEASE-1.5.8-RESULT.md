# 1.5.8 正式发布与GitHub整理结果

2026-10-26（Asia/Shanghai）。**执行完成：公开v1.5.8已发布并核验，GitHub整理完成；生产运行逻辑沿用已验收m7b，转入日常维护。** 用户明确授权的发布/线上操作已执行；原只读阶段和旧维护报告保留其历史时点。

## 正式交付

- [Release](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/tag/v1.5.8)，[MPP下载](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/download/v1.5.8/patches-1.5.8.mpp)。版本1.5.8，build ID`release-1.5.8`，Patcher 2.0.0，600263 B。
- SHA-256：`5c9dfb19a3b0b88f55516bfca38bf47ee18ed3f282511b6b6401c37e8c5db686`；独立/内嵌MPE SHA：`5fc19a18ff7abd80d98d436da323e121cb0d46cb1f325b7821617c84e1ae731c`，逐字节一致；MPE也与本地release身份预检同字节。
- 发布tag提交`83a8b72a795285234f6c164991f65007750e6272`；生产流水线源码checkout2b280203e0df33c863859e6e251c5ee4eac094d6。tag包含自动生成版本/元数据；两个身份不能混称。
- 最终CI输出与匿名下载资产SHA一致，main/dev Manager JSON链均200/版本1.5.8/单一AI根。源码/目标声明/运行unknown/构建预期仍分层。
- 正式prepare候选691be5dffc31bbcddac1be967275a2e2730ef4d76c561da53a4042323771a9cc与最终asset只差manifest Timestamp，其余条目和MPE同字节。相对m7b旧MPP仅manifest和内嵌MPE变化，其余72条目（含根DEX/资源）同字节，159个生产main源码/资源不改。

本机正式副本：`build/release-artifacts/v1.5.8/20261026-source-check/`。它由匿名公开URL取得，不把本地旧candidate当作新发布。所有历史交付和旧v1.5.7资产保留。

## 实际验证与发布门

1. 本地canonical Offline+RerunTests预检：core328+extension547=875实际执行，失败/错误/跳过0；源码/协议/ABI/本地化/工具合同/MPP-MPE-UI/凭据边界通过，同次81个core类在下一Gradle前归档。它是发布身份预检，不冒充正式远端producer。
2. 真实功能分支CI40258956966及发布PR#8验证通过，875项/源指纹与本地一致；初次分组推送漏本地化catalog/patch构建输入，已通过341ba405补齐，失败40258852474保留。
3. 第一次正式发布40260557045在prepare内core的AttemptAdmissionTest失败，未建v1.5.8 tag/资产。XML证明server到达latch不能保证稍后的client bodySent回调已执行；不是把非绿结果说成产品通过。
4. 测试修正70034165仅改AttemptAdmissionTest：保留退休前sent原断言及原真实Job/HTTP/审计/Publication路径，在既有3秒边界内等待实际volatile sent状态，无整测重试/新增Thread.sleep；新增受控server先到、client回调扣留场景。10项聚焦通过；完整CI40261836431为core329+extension547=**876项，0失败/错误/跳过**，实际执行；PR#9通过后合并。
5. [正式producer40262512565](https://github.com/YYDarlinker/morphe-ai-caption-translator/actions/runs/40262512565)完成全Linux预览、release模式prepare、876项、严格包/元数据/匿名下载/构建来源证明，全部成功；Node API发布输出true被实际后续步骤验证。
6. 原5个依赖目标逐项审阅并整合：semantic-release25.0.9、Git插件11.0.1、backmerge6.2.0、Java Action6.0.1、upload-artifact7；Node引擎兼容、锁安装与8个插件加载通过。bot随后把#3转为Java6.1.0，更新发布基线、876项通过后合并；只有两workflow SHA行变更。该后续chore通过[主分支无发行验证](https://github.com/YYDarlinker/morphe-ai-caption-translator/actions/runs/40265836660)，完整候选876项通过、输出false，不创建新版本或覆盖1.5.8。

Windows全semantic预览因Gradle插件明确仅支持Linux、spawn ./gradlew而失败；本地采用原配置官方commit-analyzer计算patch1.5.8，未修改producer检查。正式Linux完整预览最终实跑通过。辅助长路径归档、旧恢复MPP白名单及重复console参数检查失败均保留并限定修正于执行/取证，不改产品/放宽有效断言。

## 正式下载包的两组组合

使用同一既有原始APK及Google签名/输入哈希基线、官方1.48.0（82bc696c94c26dbf75242b59980251315145457575b663200b981ca351e1c0f7）、Patcher 2.0.0（251dc5997abb7e9ffef986f452842480c2ef9999489b6eb3ec922ecdf9c9f86c），104兼容默认根+AI，对**已公开下载MPP**执行当前canonical组合和DEX审计：

| 输入 | 结果 |
| --- | --- |
|21.41.525-SECONDARY|资源/DEX/输出退出0，64581唯一类，APK227146141 B，SHA7ea4749de43a4efdb8f0c8cc8420de42eadbaf94902dbc7b77f45888d240b0ac|
|21.28.208|资源/DEX/输出退出0，62253唯一类，APK217311409 B，SHA7a44590e0a1837541c7f86d64364d69f46f305f8973eba0f0eaf4325a73e57a1|

均无重复/测试泄漏，输出未签名、不分发/安装。input/official/patcher/addon路径及SHA、完整命令/receipt/log在本轮published-composition目录。用户先前21.20.405/m7b单设备反馈保留，不称新release APK已重新安装认证；其他版本/OEM/选择集/供应商不从这两组推导。

## GitHub和公开资料整理

源码18b4b7e、构建发布7de6e68、补齐341ba405、文档ddd18314、夹具70034165和发布tag均可追溯；原脏树/未跟踪成果有界入库，未reset/clean、amend或强制改历史。只删除已并入/已替代远端引用：旧fix两条、已并入codex，以及已关闭bot分支；原历史提交/tag/Release/MPP不删。原#2/#4/#5/#6由bot自动关闭为已纳入；#3更新基线并合并6.1.0，经#10同步main，不假称五个旧head被直接批量合并。

main/dev启用管理员也受约束的防强推/删除保护，合并后自动删feature、保护dev，workflow默认read权限保留；未添加会锁死单维护者publisher版本提交的强制审批/状态规则，严格prepare门不减。所有公开导航/发布身份/兼容层/合同版本口径更新；恢复快照生成物标注保留原字节，GitHub主语言Java。收尾维护记录仅.md，构建输入不变，采用skip-ci记录提交并快进同步main/dev，不需要又发布1.5.9。

旧N9原始诊断从新Git树移出，本机根原件和私有副本保留SHA13b1f29cdf6ea180dadb67bf91de6a7b085412fb132880d8cd07585cf5ac5171；显式CAPTION_FROZEN_INPUT_DIR读取真实34条JSON/响应一致、缺失拒绝，解析/旧冻结哈希不改。旧Git历史不重写；原较早诊断/SRT本来缺失，完整旧回放未运行，不能伪造通过。

## 证据及限制

`validation/runs/20261026-release-1.5.8-01/`保留入场2275文件ZIP/索引/差异、公开清单/凭据检查、预检XML/receipt/compiled、所有失败、各真实CI artifact ZIP与binding、版本决策、发布receipt、匿名来源、两组合及仓库设置/引用清单。私有材料、源APK、合成APK、签名密钥、设备原始日志不上传。阶段进度在PROGRESS，最终机器核对在release-final-check.json。

新覆盖为真实GitHub Ubuntu在线CI/正式发行；不扩大成任意新Windows空缓存首装、全部依赖原发布commit认证、硬件Keystore/IO/帧时/内存/耗电、长期稳定、全部语言/供应商或真实账单认证。配置多store/orphan和缓存晚到/断电/双IO等原限制继续有效。没有模型调用、用户设备签名安装/清数据或共享缓存清理。

## 回退边界

发布前的源码/索引/未跟踪/原删除状态有私有入场ZIP和Git提交保护；后续源码修复用新提交。已公开v1.5.8不覆盖、不删除、不移动tag；发布后问题用后续修复版本处理。文档撤回以本轮最终退出SHA和Git父提交逐文件合并，状态/镜像成对；若有后续编辑先停止核对，不恢复整个旧工作树。已删分支引用的原SHA保存在branch-cleanup-results，可在核实无新同名分支后重建；不清用户数据，不以旧MPP承诺数据回滚。
