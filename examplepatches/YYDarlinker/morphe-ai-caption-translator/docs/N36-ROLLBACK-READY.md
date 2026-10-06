# N36 可逆施工与回退准备

日期：2026-10-04（Asia/Shanghai）。本轮只准备，未实际回退。

- N35产品：1967dacff904173ef685602e831cc21291fffb94；交付HEAD／anchor/n35-013cc93：013cc93b266b339ad05dea11b1bd29177cbcbffe。
- 固定backup：backup/pre-n36-n35-013cc93 → 013cc93b266b339ad05dea11b1bd29177cbcbffe；N35/N34原三包和official input已实际核对SHA/bytes未变，见N36-N35-BASELINE.json。
- N36待执行；N35输入/窗口缺陷已记录，恢复N35仅代表退回本轮起点，不代表恢复成无缺陷版本。若用户更看重已确认的设置输入稳定，可明确选择既有N35-RESTORE-N34.ps1退到N34；保留两种选择，不自动替用户恢复。

## 使用

先保存执行聊天所有改动到本地WIP/核心提交并保留失败产物，再在本仓库运行：

```powershell
& 'E:\Projects\morphe-caption-v2\docs\N36-RESTORE-N35.ps1' -InspectOnly
```

InspectOnly核对仓库、锚点、官方输入与原三包，只报告差异，不恢复。真正恢复必须得到用户明确指示后运行同脚本不带-InspectOnly；脚本要求干净工作区与一致状态，先保留trial tag，再用git restore+新commit恢复全部tracked非docs产品文件到N35实现。文档、忽略目录build/.verification、历史提交/标签、失败包、用户原官方未跟踪输入都保留。

脚本只生成新恢复提交和状态回执；不reset/amend、不递归删除、不写手机、不安装/清数据/签名/推送/发布。两份状态最后同步。源码回退不等于手机换包。
