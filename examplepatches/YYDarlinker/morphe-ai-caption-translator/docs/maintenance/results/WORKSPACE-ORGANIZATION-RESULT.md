# 本地仓库/工作区整理与GitHub只读计划结果

2026-10-26（Asia/Shanghai）。**本地整理已执行；GitHub仅盘点和计划，零线上修改。** 用户明确要求“线下直接计划、改好，线上只做计划暂时不动”。本次不是新一轮产品优化或发布，不改变已接受的1.5.8 / local-1.5.8-m7b / candidate-02及首轮验收结论，公开仍1.5.7。

## 已执行的本地操作

1. 保存本轮入场branch/HEAD/index/exclude、完整脏树状态、binary diff、2269个Git可见现存文件哈希、两项既有缺失状态，以及本轮允许修改文件原字节。生成私有源码快照`source-before-organization.zip`并逐条目重查SHA；未创建commit或切换分支。
2. 完成活动仓库全目录文件元数据盘点（排除.git、本轮证据和reparse点），结果`local-inventory-complete.json`零错误，入场356456文件/27736496009 B。普通路径首扫曾遇5962条长路径stat错误；保留初扫，改为扩展路径+DirEntry元数据后完整重扫，最终不以初扫不完整计数作结论。未运行归档脚本或修改系统长路径设置。
3. 5755个临时文件先按内容去重归档，逐对象CRC/SHA和删除前全清单SHA核对后才逐文件移除；不使用递归通配删除。明确目标仅`.tmp`根层散文件、`work/test-temp`和1个tools Python编译缓存。执行前确认没有Java/Gradle进程；没有终止其他进程。
4. 新增当前文档索引、工作区地图、tools/scoreboard/recovered分层说明及.tmp本地索引。保留N*、ACCEPTANCE、原诊断、旧流程、旧工具和恢复源码原路径/字节；对“旧但仍被冻结检查引用”的内容不直接搬删。OPERATIONS/RELEASING的设备待验提示改为已经收到用户有限验收及其限制，原执行/复核报告不重写。
5. `.gitignore`补齐Python缓存、私有.devenv/YouTube输入及根诊断/临时补丁输入规则；`.gitattributes`保留`* -text`并标注recovered生成物，未修改.git/info/exclude。ignore不取消已跟踪文件，生成物标注仅是将来线上语言统计/展示的准备。
6. 只读检查E:另外三个旧仓库，分别有51/5/73条未提交或未跟踪状态，保留原位置和独有内容，不作为重复目录删除。当前仓库仍是唯一活动开发入口。

## 实际移除/归档量

| 范围 | 原文件数 | 原字节 | 处理 |
| --- | --- | --- | --- |
| `.tmp`根层散文件 | 286 | 43512135 | 旧一次性脚本/日志收纳进内容归档；子目录未动 |
| `work/test-temp` | 5468 | 4746864485 | JVM字体/本地库/fixture临时副本归档后移除；根目录保留，下次测试可再生 |
| `tools/__pycache__/verify_current.cpython-312.pyc` | 1 | 23212 | 编译缓存归档并移除；源码未动 |
| 合计 | **5755** | **4790399832** | 1641个唯一内容对象，映射保留每个原路径/SHA |

归档`.verification/archives/workspace-organization-20261026/transient-content.zip`为**181627308 B**，SHA `9d909ea36f8e889970560284e257b001a0dc0eefe5803c0617754b8e4ca5de50`。原临时内容减归档为4608772524 B；计入约8.96MB源码快照和映射等新材料，净文件体积约减少**4.60GB**（十进制）。完整同口径最终盘点写入`final-workspace-footprint.json`；文件体积不同于分配块/全盘空闲量，不能承诺其他进程不改变磁盘空间。

源码快照含2269个现存Git可见文件、既有未提交/未跟踪内容及历史输入，8960634 B；它是本机私有恢复备份，不是可上传的干净源码包。不含Git数据库、工具链或依赖缓存；备份清单/哈希见`source-snapshot.json`。

保留12.01GB左右验证证据、全部正式/历史/候选交付、6个源APK、work/toolchain、Gradle/Android home和共享缓存；`.tmp/M7a-source-rehearsal-*`等复现/失败材料也保留。work/temp里存在旧发布核验输入，因此没有按“temp”名字整目录删除。

## GitHub实际盘点与待办

[详细线上计划](../GITHUB-UPDATE-PLAN.md)已列确切对象、优先级和执行顺序。远端main/dev仍为`de844402776e1046a5bec87aac94e2e65f05bea7`，最新公开v1.5.7；39个Release、9个分支、5个Dependabot PR，非PR开放issue0。当前本地已验收源码仍未提交/同步线上；计划包含其有界入库与真实CI，不能只同步整理文档就说源码更新完成。

两个旧fix分支经固定SHA compare证实已并入main（分别领先179/131、反向0），列为将来重核后可删分支引用。5个依赖PR待新基线验证后逐项处理，不能批量合并；旧Release/tags/资产保留。根旧诊断仍是scoreboard/n9.py冻结输入，未来有可分发fixture/外部输入替代并验证后再从公开树移出，不擅改Git历史。

main push可能运行publisher，dev push可能自动创建PR；本轮没有fetch/pull、push、PR/issue动作、workflow dispatch、发布或管理设置修改。元数据GET失败的受限端点及固定SHA替代检查已如实记录，不读取secrets/variables值。

## 验证与保护口径

- 已完成归档CRC/内容SHA、实际工作区5755项只读恢复检查，隔离两原件精确恢复；制造后续冲突后整批拒绝，其他缺失目标零写。实际工作区未恢复临时文件。
- 直接检查Git ignore：新缓存/本地输入被忽略，源码/测试/canonical入口继续可见；直接check-attr确认`* -text`保持且生成物标记只落在恢复树。首次辅助检查误把已有`!gradle-wrapper.jar`的匹配输出当作被忽略，按Git实际正/负规则修正检查解释，并独立核对既有输入仍可见；未改ignore规则凑通过，记录见`verification-attempt-01.json`。
- 最终已核对2260项入场范围外Git可见文件、62项正式/候选资产、两项原缺失、branch/HEAD/index/exclude及状态镜像，全部保持。构建输入指纹前后均为`7bcddcbc4f76d37f15019a8c919473644c892b5c1d1c45888b0cad80796f6bb6`；本地链接/11项ignore探针及退出SHA通过，实际结果见`final-check.json`。17个文档/配置目标属于本轮范围，未把累计生产diff算成本轮修改。
- 没有生产、测试、资源、依赖或构建/验证工具实现变化，**不重跑Gradle/875项应用测试或组合**。原有效测试、组合和设备验收继续按原证据使用，未冒充本轮新执行；MPP/MPE身份保持。

## 证据、实际命令与恢复

证据目录：`validation/runs/20261026-workspace-organization-01/`。入场原件/清单、GitHub只读摘要、两次目录盘点、源快照记录、内容寻址归档映射、删除结果、恢复演练及最终检查均在E:。原档/候选/历史失败不覆盖，C:共享安装/会话/系统存储未移动或清理。

实际最终核验命令（只读源码/资产/配置和目录元数据，写本轮证据；已通过）：

```powershell
& '.\work\toolchain\python\python.exe' -B -X utf8 `
  '.\validation\runs\20261026-workspace-organization-01\check-final.py'
```

实际只读恢复命令（已通过；默认不写）：

```powershell
& '.\work\toolchain\python\python.exe' -B -X utf8 `
  '.\validation\runs\20261026-workspace-organization-01\restore-archived.py'
```

需要恢复时先看[WORKSPACE](../../WORKSPACE.md)，只对明确原路径使用`--path`，实际恢复需另加`--apply`。工具校验归档哈希、对象/路径和完整选择集，遇到后续冲突拒绝覆盖；真实仓库未apply。隔离演练输出见`restore-rehearsal.json`。

撤回配置/文档整理时先比对`final-check.json`退出SHA，再从`entry/`恢复9个既有文件；PROJECT-STATE/镜像必须成对，新增导航按当前引用一起处理。保留本结果、GitHub计划和证据作为历史；发现后续修改停止合并，不reset/clean、覆盖整棵源码或清用户数据。私有source-before ZIP是额外备份，不用它覆盖未来工作树。

**执行结论：本地整理完成，线上计划交付，产品/发布身份和原验收结论保持；GitHub尚未执行。**
