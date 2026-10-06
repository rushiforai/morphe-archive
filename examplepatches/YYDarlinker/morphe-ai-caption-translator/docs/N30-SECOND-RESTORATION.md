# N30 再次恢复与 N31/N32 停止记录

日期：2026-10-03（Asia/Shanghai）。本规划聊天依据用户明确授权直接恢复开发基线；不做新的功能实现。

## 用户最新定案

- 放弃失败的 N31/N32 实现，以 N30 已完成的产品树重新开发。
- N31 只允许提取和校对文字翻译；不得沿用 N31/N32 设置绑定、DEX hook、窗口层、交互、测试替身或构建实现。
- 后续由 Codex 单执行者按新卡开发。N32 暂存不是正式交付。

## 已执行的可逆恢复

- 恢复前 HEAD：c88abcc5f9b061a6dd1870bc0ac45f1087d372d2；工作区仅用户官方输入 patches-1.45.0.mpp 未跟踪。
- 备份标签：backup/n32-wip-c88abcc，准确指向上述失败暂存提交。旧提交、候选包、WMS/ART 失败证据与文档保留。
- 恢复源：d5ca720ecf0c83349ea232d929ee09b11840c65a / anchor/n30-d5ca720。
- 所有 tracked 非 docs 文件已恢复到 N30，包括产品源码、测试、资源、catalog、元数据、README、构建与验证工具。差异核查为空；不是只换资源/MPP，不继承 31/32 实现。
- 没有 reset、rebase、amend、删除旧提交、覆盖历史 MPP/MPE/APK。回退以新提交落地。
- 原 N32 生成且在 N30 gitignore 下显露的工具残留及 pycache 移入 .verification/n33-planner/preserved-n32-untracked，保留证据，不参与后续开发。
- 原 N31 文案单独导出 .verification/n33-planner/n31-text-only-catalog.json，来源 dc304cb，仅作翻译校对输入。
- 本轮没有重新建包、签名、安装、启动手机、清数据、远程 API、下载或新增依赖。官方仍 1.45.0，YouTube 原版仍 21.16.256，minSdk28。

## 验证边界

源码恢复一致性由 git tree/diff 核实。N30 既有 669/669、84/84 等是历史执行报告，本轮没有重新运行，不把回退本身说成新包完成。已安装手机数据保留。新诊断 build=n30，后续分析不能误归因于 N31/N32。最新规划、诊断证据及新执行卡另行记录。

## 恢复身份与收尾核查

恢复已落地为7d6821e772b9959158dd7ac41bd7e626aef48d1c / anchor/n30-restored-7d6821e；此后只更新规划/状态文档。80件历史交付前后大小/SHA256全等。后续N33待实现，当前N30三个公开root尚未删除；新卡完成后才交两根。下一步见N33-CODEX-TASK与N33-REPLAN-AND-DIAGNOSTIC-REVIEW。
