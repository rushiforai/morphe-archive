# N35 前的 N34 回退准备

日期：2026-10-04（Asia/Shanghai）。本规划聊天已按用户要求准备，可用于DeepSeek试验不佳后回到N34或让Codex接手同一N35。

## 已固定身份

- 原源码 26edf555c8956e12a4b0448b72aef34597141409 / anchor/n34-26edf55。
- 原交付docs后继 bfe5a0a83beba8c645ca1d88d06d962c1db8f1dd。
- 备用 backup/pre-n35-n34-bfe5a0a → 原交付后继；不会在后续随HEAD移动。
- docs/N35-N34-BASELINE.json已记录独立复核的MPP/MPE/APK完整SHA/bytes，原-n34路径不变。

## 回退工具

先检查（只读）：

	powershell.exe -NoProfile -ExecutionPolicy Bypass -File E:\Projects\morphe-caption-v2\docs\N35-RESTORE-N34.ps1 -InspectOnly

用户决定回退后执行（会新建本地恢复提交）：

	powershell.exe -NoProfile -ExecutionPolicy Bypass -File E:\Projects\morphe-caption-v2\docs\N35-RESTORE-N34.ps1

工具必须在trial已有WIP/实现commit、工作区没有未保存文件或其他staged项后运行；不会丢弃未提交或untracked work。先自动标记backup/n35-before-rollback-<当前hash>，之后恢复所有tracked非docs文件为N34，新增revert commit；历史commit/旧包/新候选/失败证据与最新管理docs保留，状态两份同步并写rollback receipt。

已由规划者执行-InspectOnly：source differences=0、N34原三包hash一致、脚本可解析；**没有运行实际恢复模式，因为当前仍是N34且尚无N35产品施工**。不能说已测试了某个未来失败trial的恢复结果。工具不签名/安装/卸载/启动手机/清数据/推送/发布。

若仅要Codex接手，可保留WIP不先回退；继续同一卡。若用户觉得trial不可信，可先恢复N34再让Codex从同一稳定锚点实现。
