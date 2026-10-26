# 本地工作区与资料分层

2026-10-26（Asia/Shanghai）。唯一活动仓库：`E:\Projects\DeepSeek morphe-ai-caption-translator`。当前接受本地 **1.5.8 / local-1.5.8-m7b / candidate-02**，公开 **1.5.7**。首轮成熟化已验收，本次仅按用户要求做本地整理；GitHub只读盘点与[更新计划](maintenance/GITHUB-UPDATE-PLAN.md)，未写线上。

## 当前入口

普通使用看[中文说明](README.zh-CN.md)，接手维护看[文档索引](README.md)、[状态](PROJECT-STATE.md)、[开发环境](DEVELOPMENT.md)和[日常操作](maintenance/OPERATIONS.md)。[验收结论](maintenance/reviews/M7-FINAL-ACCEPTANCE.md)和[本次整理结果](maintenance/results/WORKSPACE-ORGANIZATION-RESULT.md)分别记录产品验收与工作区操作，不能互相替代。

| 目录/文件 | 类别与当前处理 |
| --- | --- |
| application-host、caption-contracts、caption-shared、translation-core、infrastructure、presentation、ui、ui-preview、patches、extensions、localization | 当前源码/测试/资源；保持原布局/字节，本次不重构或改产品 |
| tools/workspace、当前verify/provenance/localization工具、.github、Gradle配置 | 当前构建/验证链；只增加[tools导航](../tools/README.md)，不改工具实现/依赖/发布行为 |
| docs当前入口、architecture、maintenance | 当前说明、合同、任务/结果/复核；状态与镜像同字节；历史执行报告不倒填新结果 |
| docs/N*、旧RELEASE/CAPTIONS/ROOT-CAUSE/流程、ACCEPTANCE.md、scoreboard、recovered/1.3.5、tools/n* | 历史冻结/研究/回放层；原路径/内容保留，增加[历史导航](history/README.md)、[scoreboard说明](../scoreboard/README.md)及[recovered说明](../recovered/README.md) |
| build/delivery、build/release-artifacts、build/maintenance及N*交付 | 正式/历史/候选产物；全部保留，不能因为旧或文件名相同就覆盖/删除 |
| validation/runs、.verification | 证据/状态镜像/私有可恢复归档；保留封存证据，含原始设备/模型内容的材料不公开上传 |
| work/toolchain、work/gradle-home、work/android-user-home | 工具/依赖/Android构建输入；保持，不清共享工具缓存或用户配置 |
| work/test-temp | JVM测试生成的字体、本地库和fixture临时目录；本次原文件已内容去重归档并清空，根目录保留；下次测试可再生，不是设备用户缓存 |
| work/temp、work/pycache | 进程临时工作/字节码缓存；本次保持，前者还存在旧发布检查输入，不能按名字整目录删除 |
| .tmp | 一次性研究和演练；286个根层散文件已归档收纳，本机`.tmp/README.md`说明恢复（该私有索引不随源码分发）。子目录、M7a隔离源码演练、失败/回退演练、研究源及APK/DEX输入均未移动 |
| YouTube/ | 6个原始APK输入，本次保留；新增目录级忽略，不打包发布专有APK |
| .devenv/ | 忽略的兼容别名；新增共享ignore规则，不变更文件或本机exclude |
| .git | 历史/索引/分支配置；当前HEAD、分支、index/exclude均保持，不commit、reset、clean、fetch/pull或切换工作树 |

`.gitignore`新增Python编译缓存和本地输入规则；已跟踪的文件仍被跟踪，尤其根目录旧诊断和gradle.properties不会凭ignore自动移出。`.gitattributes`保留原`* -text`，仅把恢复树标为generated；将来提交后才影响GitHub语言统计。生产/测试字节及本次前后构建输入指纹保持，候选不重建。

## 本次可恢复收纳

私有归档目录：`.verification/archives/workspace-organization-20261026/`。

- `source-before-organization.zip`：整理入场的2269个Git可见现存文件及清单，包含既有未提交/未跟踪源码，约8.96MB。它是本机恢复快照，含历史材料，不是可直接上传的公共源码包；不含Git数据库、工具链/依赖缓存。
- `transient-content.zip`：5755个临时文件按SHA-256内容去重为1641个对象，原路径/大小/SHA映射在同目录及本轮证据的`transient-archive-manifest.json`。原内容4790399832 B，归档181627308 B，SHA-256 `9d909ea36f8e889970560284e257b001a0dc0eefe5803c0617754b8e4ca5de50`。
- 移除原位置的文件包括286个`.tmp`散文件、5468个JVM测试临时文件和1个Python编译缓存；没有删除原始数据唯一副本。净文件体积约减少4.60GB（十进制，计入主要备份；精确盘点见本轮最终JSON），不是对全盘空闲量或文件系统分配块的保证。

恢复工具位于`validation/runs/20261026-workspace-organization-01/restore-archived.py`，**默认只检查**。示例：

```powershell
& '.\work\toolchain\python\python.exe' -B -X utf8 `
  '.\validation\runs\20261026-workspace-organization-01\restore-archived.py'
```

仅明确需要恢复时才追加`--apply`；可用重复的`--path`选确切原路径。它先验证完整选择集、归档哈希、路径范围和后续冲突，任一冲突拒绝，不覆盖未来文件。实际仓库只做check，隔离演练验证了精确恢复、冲突拒绝及其他缺失目标零写入。恢复临时文件会重新占用原始空间；对当前产品行为没有必要。

## 其他E:工作区

| 路径 | 只读观察 | 本次决定 |
| --- | --- | --- |
| `E:\Projects\morphe-ai-caption-translator-1.5.4` | dev/1.5.4-work，HEAD2c960540，51条未提交/未跟踪状态 | 有独有工作，原位置保留；不是当前开发入口 |
| `E:\Projects\morphe-ai-caption-upstream` | feat/youtube-ai-caption-translation，HEAD027c4e1f，5条未跟踪状态 | 上游尝试/历史输入保留；当前方向仍为独立包 |
| `E:\Projects\morphe-caption-upstream-integrated-claude` | codex/upstream-core-integration，HEADf266f19c，73条未提交/未跟踪状态 | 独有整合工作保留，不作为当前源码或重复目录删除 |

只读查看了上述身份/状态，没有修改、重命名或删除其他仓库，未触碰C:共享安装/会话存储。若将来专门退役某旧仓库，应先对独有源码/历史资产作单独可恢复核对；它们不属于本轮已删除项目。

## 日常保持整洁的规则

新开发只用活动仓库；临时工作用新的`.tmp/<明确任务>/`子目录，正式证据用`validation/runs/<独占ID>/`，构建交付用`build/`。不要重新散放根诊断、APK、MPP或依赖目录。临时文件在所属进程退出后可按明确清单归档/清理；正式包、封存证据、历史回放输入及共享依赖不套用临时规则。

GitHub同步、远端CI、正式发布和依赖升级分别审批/验证；本次状态仍为本地脏工作树，未将其强行弄成“干净”。最新源码字节已有私有快照，线上同步计划包括后续有界入库，禁止用git clean/reset替代整理。
