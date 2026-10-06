# 撤回未完成 N28，恢复 N26（2026-10-02）

用户要求全部撤回此前N28开发到N26完成状态，并明确后续全部开发由Codex负责，不再让DeepSeek执行。此次只恢复基线、验证、记录与重新规划，没有实施新N28A功能。

## 实际发现与回退

开工HEAD为`efe1f8c`，源码已经是N26r恢复点`1b9e429`。此前N28没有实现提交：23个已跟踪产品/测试文件有未提交修改，9个新增产品/测试资源文件未跟踪，另有规划docs管理改动。

先保存35个修改/新增文件的完整字节、SHA256、git diff --binary及此前N28开发日志/生成MPP/MPE，再从`7f9c639`恢复明确模块范围，并移出9个已经验证归档一致的新增源码/测试文件。未使用reset/clean整仓库、不重写历史、不删除N26/N27/N27r旧锚点/交付包。归档为失败/未完成研究尝试，不允许直接恢复作为新卡生产实现。

恢复后全部非docs跟踪树与`7f9c639`零差异，index与worktree均相同，无未跟踪产品文件；包含源码、资源、构建配置、测试。此前N28使用过的模块生成输出通过两个模块clean清除，根build交付/证据没有删。

## 本次实际验证

- 离线`clean :extensions:extension:testDebugUnitTest :patches:buildAndroid --no-build-cache`，59项中58项executed、1项up-to-date，实际重新编译与测试；Java **440/440、58套件、0失败/错误/跳过**。
- Python **27/27**，localization **220键×14语种**；冻结计分板4通过/4既有失败/4未验证、三类不可见时长全0，ACCEPTANCE与frozen-baseline不改。
- 重建MPP全部资源/根classes.dex/内嵌MPE与历史N26逐字节一致，只有Manifest构建清单变化。重新生成的独立扩展也与N26逐字节一致。此前N28类/计数器/上下文/呈现/分页器和已撤回N27协调器均不在扩展中。
- verify_bundle通过；**41/41去重历史产物字节/SHA未变**。
- 已保留的N26r最终APK重新做全根DEX分支审计：11单元、58028类、321938方法、624507分支，invalid0、binding_failures0。该APK没有N28实现且对应N26产品字节，未重新组合一个功能完全相同的APK或覆盖旧包。
- 旧N26/N26r三件套仍可使用；本次未签名、安装、清数据、推送或发布。用户数据/保存字幕位置不改。手机验收仍由用户进行；不以本次离线恢复扩大为所有历史问题已解决。

## 本地恢复材料

- `.verification/n28-abandon-20261002/files`：完整源文件快照，含当时旧任务/分工/状态；`manifest.json`与`changes-against-head.patch`，仅研究归档。
- 同目录`previous-n28-records`、`generated-before-reset`：之前的N28日志/生成中间文件，标记废弃，不能用于交付。
- `build/n28-reset-records`：本次Java/构建、计数JSON、Python、本地化、产品字节一致性、历史before/after哈希、已有N26r最终DEX报告。
- 本次准备与回退使用的脚本在上述.verification目录，所有删除均限定源码内经确认已归档的9个文件；没有遗失未提交实验。

## 后续任务已重规划

`docs/CODEX-EXECUTION-WORKFLOW.md`是唯一有效执行分工。Codex负责每张卡的实现、全量验证、矩阵、构建、实际交付DEX、提交与记录，取消DeepSeek收尾与handoff。

第三期改为闭合卡：N28A语言上下文/profile/计数基础＋真实Session只读技术观察（原策略不变）→后续另发N28B源目标规则/prompt/cache接入→N28C非中文分页/真实几何/RTL。下一步只执行`docs/N28A-CODEX-TASK.md`，不是继续已撤回旧N28整体修改。第四期菜单与最终三个遗留问题之后按独立卡继续，均Codex完整负责。

`HYBRID-EXECUTION-WORKFLOW.md`与`N28-CODEX-CORE-TASK.md`明确标为历史失效，仅供追溯。N27避让仍搁置，VISIONOS用户已解决关闭，三项UI/诊断遗留仍留最后统一闭环。

本次恢复检查点：`anchor/n26-restored-20261002`，指向此份管理/规划提交；其产品树等于`7f9c639`，旧N26r源码锚点保留。恢复检查点实际提交为 **45a7cc4**（仅管理/规划文档），标签指向该提交。随后仅docs写实，所有产品源码/资源仍为N26。工作区收尾提交后干净，未推送。
