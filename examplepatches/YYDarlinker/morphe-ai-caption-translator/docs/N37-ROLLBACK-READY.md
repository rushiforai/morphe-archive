# N37回退准备

日期：2026-10-05（Asia/Shanghai）。只准备，未实际恢复。

- 产品基线：6319fd69900b1f08b231b14161713021d0fb616d，anchor/n36-6319fd6。
- 完成点：3bf88d2c0047bb1ecd88f4389ec42627bc219aa9，anchor/n36-final。
- 固定backup：backup/pre-n37-n36-3bf88d2 → 3bf88d2c0047bb1ecd88f4389ec42627bc219aa9。
- N36/N35/N34原三包及official1.45输入已核对未变，见N37-N36-BASELINE.json。
- N36仍有本轮四项反馈和716全量中的1个未收敛项。恢复N36代表回本轮施工起点，不代表无缺陷；若用户选择更早N35/N34，已有N36-RESTORE-N35.ps1与N35-RESTORE-N34.ps1也保留。

先保存N37试验到本地WIP/实现commit，保留失败包和日志，然后可执行E:\Projects\morphe-caption-v2\docs\N37-RESTORE-N36.ps1 -InspectOnly。只检查仓库、source/delivery锚点、原三包、official输入与产品差异。

真正恢复必须在用户明确指示后运行同脚本不带InspectOnly：验证干净工作区及两份状态一致，先保留当前trial backup，git restore全部tracked非docs产品文件并生成新的恢复commit。文档、ignored build/.verification、历史提交/标签、用户official未跟踪输入保留；不reset/amend/删除，不写手机/安装/清数据/签名/推送/发布。源码恢复不等于手机已经换包。
