# PROJECT-STATE — 当前维护状态

更新：2026-10-26（Asia/Shanghai）。**当前公开版本1.5.8 / release-1.5.8；首轮成熟化及本次GitHub发布/整理均已完成，转入日常维护。** 具体身份/验证/收尾见[发布结果](maintenance/results/RELEASE-1.5.8-RESULT.md)和[GitHub记录](maintenance/GITHUB-UPDATE-PLAN.md)。

## 当前身份

- 唯一活动仓库：`E:\Projects\DeepSeek morphe-ai-caption-translator`；仍复用原工作树，活动本地分支codex/fix-cc-authority-1.5.8。已有N69–M7修改已完整入库，未reset/clean丢弃；收尾维护记录按快进方式同步main/dev，精确HEAD以Git和本轮exit记录为准。
- **公开tag v1.5.8**，发布提交`83a8b72a795285234f6c164991f65007750e6272`；正式构建身份**1.5.8 / release-1.5.8**。MPP600263 B，SHA-256 `5c9dfb19a3b0b88f55516bfca38bf47ee18ed3f282511b6b6401c37e8c5db686`；独立/内嵌MPE SHA `5fc19a18ff7abd80d98d436da323e121cb0d46cb1f325b7821617c84e1ae731c`。下载见[Release](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/tag/v1.5.8)。本机副本在`build/release-artifacts/v1.5.8/20261026-source-check/`，不作为源码附件。
- 原接受本地m7b candidate-02、MPP d0f84dfab104c6167126042247734e2b1d4e6c33de332df6d59ff49aa153cd30及v1.5.7和所有更早Release/标签/资产保持。正式包相对m7b仅manifest和内嵌MPE不同，其余72条目同字节；159个生产main源码/资源输入完全相同，build ID由本地标记改为release标记。

## 有效入口

[当前文档](README.md)、[开发环境](DEVELOPMENT.md)、[日常操作](maintenance/OPERATIONS.md)、[工作区](WORKSPACE.md)、[架构/合同](ARCHITECTURE.md)、[兼容分层](COMPATIBILITY.md)、[发布流程](RELEASING.md)。canonical为tools/workspace，.devenv仍仅本地兼容别名；项目临时/构建/证据留E:，共享已装工具可只读使用C:。

## 发布与验证事实

M0–M7各规定范围和[首轮最终验收](maintenance/reviews/M7-FINAL-ACCEPTANCE.md)保持其历史口径。发布前本地875项、功能分支/发布PR的真实875项通过；正式发布首轮在原AttemptAdmissionTest的server到达与client bodySent不同步断言处被挡，未建tag/资产。仅修正测试等待真实Job.sent，保留原断言/原请求/审计/Publication保护，上限仍3秒，新增受控server领先用例；10项聚焦和修后完整CI通过。

**正式发布验证为core329+extension547=876项**，失败/错误/跳过0、均实际执行；[生产流水线](https://github.com/YYDarlinker/morphe-ai-caption-translator/actions/runs/40262512565)完成完整Linux预览、release模式prepare、严格metadata/MPP/MPE/UI/来源/ABI/本地化/凭据检查和构建来源证明。匿名main及dev来源链均200，资产哈希与最终CI输出一致。prepare候选与最终publish包只有manifest Timestamp不同，MPE与本地release身份预检同字节，不用旧local包冒充发布。

已对**正式下载包**重做21.41.525-SECONDARY与21.28.208 / 官方1.48.0 / Patcher 2.0.0 /104兼容默认根+AI组合、资源重编译和DEX审计，分别64581/62253唯一类、无重复/测试泄漏，输出未签名且未分发/安装。用户此前Manager2.2.0 / YouTube21.20.405 /官方1.48.0的m7b反馈和诊断按原单设备样本保留，不冒称新release APK重新设备认证。

后续setup-java 6.1.0仅改两workflow SHA行，已更新到发布基线并通过876项；[无新发布路径验证](https://github.com/YYDarlinker/morphe-ai-caption-translator/actions/runs/40265836660)确认chore不会生成1.5.9或覆盖1.5.8，同时完整候选876项通过。正式tag的构建环境和当前维护工具更新分开记录。

## GitHub及工作区整理

远端保留main/dev并禁止强推/删除（含管理员）；不添加会妨碍单维护者publisher生成版本提交的强制人工审批/状态规则，严格发布门仍在workflow中。合并后自动删feature分支已启用，受保护dev保留。两个旧fix和已并入codex远端引用按精确SHA租约删除；原5个依赖PR四项自动关闭为已纳入，#3由机器人转为6.1.0后更新基线验证合并；原Release/tags/资产不删。

旧原始N9诊断已从新Git树移出，本机根原件/.verification/frozen-inputs副本仍同SHA13b1f29cdf6ea180dadb67bf91de6a7b085412fb132880d8cd07585cf5ac5171；scoreboard支持显式CAPTION_FROZEN_INPUT_DIR。真实34条输入记录一致、显式缺失拒绝。原20260927诊断/SRT本来缺失，整套旧回放未运行，不放宽冻结哈希。Git历史仍保留旧文件，不作历史重写。

本地此前5755临时文件的内容归档和约4.60GB净减保留为整理时点事实；后续测试会再生临时文件，工具/共享缓存/封存证据/历史交付/其他旧仓库未清。私有证据`validation/runs/20261026-release-1.5.8-01/`和备份不上传；源APK/合成APK/签名密钥/设备原始诊断不作为Release资产。

2026-10-26 发布说明整理：README中英文移除1.5.8更新列表及发布验收长段落，保留下载/兼容入口；Release和CHANGELOG的1.5.8条目改为相较1.5.7的用户体验改进，发布流程增加人工编辑说明。仅修改文档与Release正文，版本、tag、MPP及其SHA保持不变。证据位于`validation/runs/20261026-release-notes-135707/`。

同日按用户纠正：1.5.8 Release与CHANGELOG移除擅加的中文和语言标题，沿用历史版本的简短英文列表。发布流程明确遵循该风格；下载包及tag不变。补正文案证据在`validation/runs/20261026-release-notes-english-01/`。

## 保留限制及后续

远端Linux实际CI/在线依赖/正式发布已验证；不再笼统称远端CI未验，但不扩大成任意全新Windows空缓存首装认证。原共享Maven输入的发布commit、硬件Keystore/物理IO/帧时/内存/耗电、长期稳定、全部版本/选择集/OEM/供应商/14语母语质量/任意线程交错及真实账单未全面认证。配置多store/orphan、源缓存晚到窗口/跨文件断电/双IO、主线程启动严格读取等继续按合同披露。

**暂无新的预设优化卡。** 后续根据具体回归、新需求或新版本另安排有界工作；本次1.5.8发布授权不自动授权未来新版本、模型调用或设备操作。没有签名安装YouTube、清用户数据/真实缓存或调用付费模型。状态镜像与本页逐字节相同。
