# GitHub 更新与整理计划（只读盘点，尚未执行）

2026-10-26（Asia/Shanghai）。用户授权本地直接整理，**GitHub仅评估和计划，暂时不动**。本文件没有授权远端写入。实际访问仅为GET；没有push、PR/issue改动、分支/标签删除、Actions触发或Release操作。

## 1. 已核实的线上状态

仓库：[YYDarlinker/morphe-ai-caption-translator](https://github.com/YYDarlinker/morphe-ai-caption-translator)。默认分支main；main和dev均为`de844402776e1046a5bec87aac94e2e65f05bea7`，与本地HEAD相同。已验收的N69–M7修改仍在本地未提交工作树，不能把线上同名仓库说成已含这些修复。

- 最新公开仍为[v1.5.7](https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/tag/v1.5.7)，MPP 587256 B，SHA-256 `41d96e4b65ed9419854e02013ba71d73b884ad444683ddd559ec32e74da77159`。
- API完整返回39个Release（含1个早期prerelease）、9个分支、5个开放PR，非PR开放issue为0。5个PR均为Dependabot，不能把GitHub的open_issues_count=5误写成5个产品故障。
- Actions共有65条记录；最近两条是2026-10-21失败的Dependabot更新，最近可见Release/产品验证在2026-10-05。它们不是当前m7b源码的CI证明；本次不触发重跑。
- main/dev及其他返回分支的`protected`均false，rulesets返回空列表；未读取或测试所有管理设置、secrets/variables，不将其扩大为全部权限审计。
- GitHub当前主语言显示Smali。完整tree中`recovered/`有1446个Smali文件，历史恢复内容约19.33MB；它们仍被统计，不代表当前主要维护语言是Smali。

只读结构化证据：`validation/runs/20261026-workspace-organization-01/github-readonly-summary.json`。使用固定SHA核对分支祖先关系；tree没有截断。某些connector端点（工作流列表、语言字节统计、含编码斜杠的compare）被拒绝；改用已返回的仓库元数据/Actions记录、相同远端HEAD的本地Git文件和固定SHA compare，不伪造被拒端点的数据。

## 2. 应更新、增加和替换的内容

| 优先级/对象 | 将来操作 | 具体边界 |
| --- | --- | --- |
| P0 当前已验收源码/测试 | 将本地完整工作树经过白名单审阅后形成可追溯提交，先同步feature分支并跑真实CI | 包括N69–M7累计修改和未跟踪的新测试/组件/工具；不是只提交本次整理文档。先核对原有两项删除，不git add整棵工作区 |
| P0 验证工具、CI、release prepare | 同步已验收的`tools/workspace/`、当前编排器及必要workflow差异，先在feature分支真实验证 | 运行875项的本地记录不代替远端CI；构建环境/依赖凭据问题按实际错误处理，不降低门槛或清共享缓存 |
| P0 README/开发/兼容/发布说明 | 用本地当前有效资料替换过时说明，加入当前文档/验收/工作区导航 | 始终区分公开1.5.7和本地已验收1.5.8；两电脑组合与单设备用户观察分别说明，不提前称1.5.8已公开可下载 |
| P1 `.gitignore` | 同步本地已补的Python缓存、私有`.devenv`、APK输入目录及根目录诊断/临时补丁输入规则 | ignore不会移除已跟踪文件，也不会清Git历史；旧已跟踪诊断另见下表 |
| P1 `.gitattributes` | 同步本地对`recovered/**`的`linguist-generated=true`标注 | 保留原`* -text`，保留Smali字节与历史路径；GitHub语言统计需将来提交后刷新，本次线上仍未改变 |
| P1 历史导航 | 同步`docs/README.md`、tools/scoreboard/recovered说明，保留旧N*、ACCEPTANCE及回放输入 | 历史文件中的旧“当前有效”不能凌驾新AGENTS/PROJECT-STATE；不把历史fixture当当前验收 |
| P1 公开内容筛选 | 明确源代码/测试/工具/说明的允许同步清单；复核报告是否含私人数据 | `.verification/`、validation原始证据、设备诊断、源APK、已打补丁APK、工具链/缓存和本次私有备份不上传；历史提交里已存在的内容不因ignore消失 |
| P2 项目首页 | 保留独立维护、GPL和Morphe兼容身份；待真正发布后再统一版本/成果介绍 | 不换仓库URL、订阅入口或命名空间；不宣称官方收录、所有设备/供应商认证或费用下降 |

## 3. 可以删除、应保留和需替代后再删除的线上项目

| 对象 | 评估结论 | 将来执行前条件 |
| --- | --- | --- |
| `fix/asr-semantic-pause`，SHA `b0f8d1d79add38c84849d0a13b2489865070ee2f` | 可列入旧分支删除计划 | 固定SHA compare确认该点是main祖先，main领先179、反向0；执行时重查分支未移动且无开放PR依赖，再删分支引用，不删历史提交/标签 |
| `fix/semantic-quality-134`，SHA `24b22e83760d8ac2d1ead50cd3191d71b1de8953` | 同上 | main领先131、反向0且merge_base等于该分支SHA；同样需执行时重新确认 |
| 5条Dependabot分支与PR | 保留待单独处理，不能直接批量合并/删除 | 先同步当前源码和验证链，再更新PR基线、判断兼容性；如由新PR取代旧PR，记录替代关系再关闭/删除旧分支 |
| 根目录`caption-diagnostics-1.3.5-20260929-155802.txt` | 建议将来从公开源码树移出；本地当前保留冻结原件 | `scoreboard/n9.py`直接依赖该路径，ACCEPTANCE引用其冻结SHA。须先完成脱敏可分发fixture或显式外部输入方案及回放验证，再移出；本次不破坏历史回放，也不改写公开Git历史 |
| `ACCEPTANCE.md`、scoreboard、`docs/N*`、`recovered/1.3.5`、历史工具 | 保留可追溯原件，通过索引归入历史层 | 暂不搬目录或删除；需要物理迁移时先验证历史引用、冻结SHA及重建/回放脚本并建立路径映射，不把“旧”当作“无用” |
| 39个Release及标签/MPP资产 | 保留 | 正式发布记录和下载资产不可用本地候选替换。早期dev Release可标明历史，但不借本次整理删除或重发 |
| Actions失败/取消记录 | 保留历史，修当前工作流并产生新验证 | 历史失败不等于当前产品失败；删除日志不能解决根因。后续可设合理保留期，不抹掉现有证据 |
| main/dev | 保留 | 后续考虑经验证的分支保护、必需检查、合并后自动删已合并feature分支；这些属于另行授权的线上管理变更 |

5个开放PR的具体处理顺序：

- [#5 semantic-release 25.0.7→25.0.9](https://github.com/YYDarlinker/morphe-ai-caption-translator/pull/5)：独立验证发布预览与锁文件后处理，不因补丁版本就自动合并。
- [#4 semantic-release-backmerge 6.1.0→6.2.0](https://github.com/YYDarlinker/morphe-ai-caption-translator/pull/4)：检查backmerge/dev行为及现有单一发布链。
- [#6 semantic-release/git 10.0.1→11.0.1](https://github.com/YYDarlinker/morphe-ai-caption-translator/pull/6)：主版本，检查生成提交/版本资产阶段，不与源码清理混合。
- [#3 setup-java 5.7.0→6.0.1](https://github.com/YYDarlinker/morphe-ai-caption-translator/pull/3)、[#2 upload-artifact 6→7](https://github.com/YYDarlinker/morphe-ai-caption-translator/pull/2)：分别检查Action兼容性/执行运行时与产物归档合同；2026-10-21失败的是Dependabot动态任务，未据此断言这两个升级一定不兼容。

## 4. 建议的线上执行顺序（全部未执行）

1. **源码入库阶段**：核对本地原件/快照及已验收构建输入，列明确切新增/修改/删除清单，排除私有输入；形成审阅友好的本地提交。当前工作树脏状态仍保留，本次没有commit。
2. **远端验证阶段**：获授权后先推feature分支，按新workflow跑真实CI，复查原有保护。不要直接推main；当前release workflow对main push可能发布。向dev push还可能自动创建到main的PR，不能把它当完全无副作用的同步。
3. **整合阶段**：真实CI通过后再按项目分支策略整合至dev，检查依赖PR和保护规则。main/dev当前同点不是坏状态，不需要为了“整齐”强制重置或互相覆盖。
4. **可选发布阶段**：另行批准正式发布，预览semantic-release算出的版本，生成`release-<version>`包/元数据并严格验证，之后才合并到main/触发发布。现有local MPP不直接冒充release，也不覆盖v1.5.7资产。
5. **后续整理阶段**：重查两个旧fix分支并删已并入引用；依赖PR逐项处理；历史诊断的公共替代方案成立后再移出；保留tags/releases/证据。

源码同步、远端CI、正式发布、依赖升级、历史fixture迁移分别可审核，不要求一次打包完成。用户下一次授权应明确选择上述阶段；本次只交付计划。

## 5. 本地已准备与保留限制

本地配置/导航/临时文件归档已按[工作区说明](../WORKSPACE.md)和[整理结果](results/WORKSPACE-ORGANIZATION-RESULT.md)处理。`recovered`生成物标注的机制依据[GitHub Linguist](https://github.com/github-linguist/linguist/blob/main/docs/overrides.md)；ignore规则的边界见[GitHub文档](https://docs.github.com/en/get-started/git-basics/ignoring-files)。它们均尚未同步线上。

未查询secrets值、未测试管理变更、未运行真实远端CI/发布、未下载或上传专有APK。只读盘点会随他人后续提交/分支变化而过时，执行前重查引用。本次没有对他人发送消息或创建issue/PR。
