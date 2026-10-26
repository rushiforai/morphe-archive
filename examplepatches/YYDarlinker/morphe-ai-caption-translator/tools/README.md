# 工具入口与历史边界

当前日常入口为[`workspace/dev.cmd`](workspace/dev.cmd)，完整候选检查为[`workspace/verify-full.cmd`](workspace/verify-full.cmd)。环境输入见[DEVELOPMENT](../docs/DEVELOPMENT.md)，实际操作见[OPERATIONS](../docs/maintenance/OPERATIONS.md)。项目工具的可写临时目录/缓存位于E:；不改变全局环境或导入账号凭据。

| 类别 | 文件/目录 | 用途 |
| --- | --- | --- |
| 通用开发与环境 | `workspace/` | Git可见的环境初始化和Windows入口；`.devenv`只是本地忽略的兼容别名 |
| 当前验证编排 | `verify_current.py`、`verification.init.gradle`、`test_verification.py`、`test_workspace.py` | 源码/receipt/测试报告/候选身份及工具合同 |
| 来源/本地化/安全检查 | `record_core_provenance.py`、`check_localization.py`、`generate_localization.py`、`scan_delivery_credentials.py` | 按当前编排器和合同调用；生成器需审查实际diff，不用重写公开元数据凑通过 |
| 兼容或专用检查 | `Verify.ps1`、`Enter-Workspace.ps1`、`Invoke-Gradle.ps1`、`Prepare-OfflineTests.ps1`及`verify_*`/audit工具 | 保留调用者；日常优先canonical入口。专用名称不是全部都已退役，应按实际任务/依赖使用 |
| 历史研究与修补 | `n25_*`、`apply_n25_*`、`apply_n26_*`、`n28*`至`n37*`、`rebuild_recovered_135.ps1`、`verify_release_135.ps1`等 | 对应冻结历史或一次性研究；不能因为仍能执行就直接套用当前工程 |

本次整理没有修改这些工具的实现、构建默认值或旧脚本。仅增加导航并把Python编译缓存纳入忽略/可恢复清理。历史工具的迁移/删除必须先核对调用关系、冻结路径和证据用途，见[工作区说明](../docs/WORKSPACE.md)。
