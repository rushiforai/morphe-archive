# C 盘项目资料归并至 E 盘（2026-10-05）

用户授权：将 C 盘可迁移的本项目工作区、产出及开发资料归并到 E 盘，并清理完成迁移的 C 盘原件；后续开发统一使用 E 盘。

## 结果

- 唯一活动仓库：E:\Projects\morphe-caption-v2。
- 迁移前 HEAD：a6fcbbb9c37a7928c961146b4b50440a2e564255；N37R2 产品锚点 anchor/n37r2-6ff1053、完成锚点 anchor/n37r2-final 均未改变。
- 迁移文件：76347；逻辑字节：16296734945（约 15.18 GiB）。逻辑大小不是实际释放磁盘空间；模拟器磁盘可能为稀疏文件。
- 每个文件复制后逐项核对长度与 SHA-256，再删除 C 盘原件；收尾再核对所有迁移目标存在与长度。迁移清单内剩余 C 盘原文件：0。
- N37R2 正式 MPP/MPE/APK 在 E 盘原路径存在，SHA-256 与 docs/N37R2-SHA256.json 相符。没有覆盖历史交付、改变源码/资源、构建新包、签名、安装实体手机、推送或发布。
- 工作区维护仅新增 AGENTS.md、本文及更新 PROJECT-STATE.md；不代表新的产品版本。

## 路径映射

| 原位置 | 新位置 |
| --- | --- |
| C:\Users\14776\Documents\Codex\日期\项目任务目录 | E:\Projects\morphe-caption-v2\.verification\c-drive-migration-20261005\archive\Documents\Codex\日期\项目任务目录 |
| C:\Users\14776\Documents\Codex\q134-review、qc135-deps | 同一 archive\Documents\Codex 下对应目录 |
| C:\Users\14776\Documents\kimi\tasks 中核实属于本项目的任务目录 | 同一 archive\Documents\kimi\tasks 下对应目录 |
| C:\Users\14776\Documents\morphe-caption-handoff | 同一 archive\Documents\morphe-caption-handoff |
| C:\Users\14776\.codex 中核实属于项目的旧工作树残留、N19 证据 | 同一 archive\.codex 下对应目录 |
| C:\Users\14776\AppData\Local\Temp 中项目回归临时目录、N36 文件、旧 JDK 下载 ZIP | 同一 archive\AppData\Local\Temp 下对应目录 |
| C:\Users\14776\.android\avd\morphe-fixture-api35.avd | E:\Projects\morphe-caption-v2\.verification\android-avd\morphe-fixture-api35.avd |

旧工作区、报告与脚本原文保留为历史证据，其中的旧绝对路径没有批量改写。不要直接重跑归档中的历史构建/收尾脚本，避免重新向 C 盘输出。各文件映射、字节数和哈希见 .verification/c-drive-migration-20261005 下 JSONL 清单与 summary.json。

## 活动产物和状态

- MPP/MPE：E:\Projects\morphe-caption-v2\build\local-test。
- N37R2 APK：E:\Projects\morphe-caption-v2\build\n37r2-composition-final。
- 活动状态：E:\Projects\morphe-caption-v2\docs\PROJECT-STATE.md。
- 新的逐字节同步状态副本：E:\Projects\morphe-caption-v2\.verification\state-mirror\PROJECT-STATE.md。
- C 盘旧状态副本已迁入历史归档，今后不再作为写入目标。
- 官方 patches-1.45.0.mpp 保持原有未跟踪输入，未移除或修改。

## 保留边界及后续工作规则

- Codex 应用、会话、附件、共享 SDK/JDK/Gradle 等工具缓存和系统文件保留在 C 盘；它们不是本次归档的项目产物。
- Android 在 C:\Users\14776\.android\avd\morphe-fixture-api35.ini 保留小型发现索引，path 指向 E 盘。已关闭迁移前的本项目 emulator-5554，数据校验完成后按原参数重启；不操作实体手机。
- 两处旧任务根目录仍被其他进程占用，保留为空壳：C:\Users\14776\Documents\Codex\2026-10-05\files-pasted-by-the-user-n37，以及同日期 n37r2-2026-10-05-n37-98ac1a1。两者下文件和子项均为 0。不强制终止其他对话或 Codex 进程。
- 当前聊天的 C 盘空工作区及应用管理的空目录可保留；后续在 Codex 中打开 E:\Projects\morphe-caption-v2 作为项目目录。
- AGENTS.md 已明确开发、构建、交付、证据和项目临时文件均使用 E 盘；E 盘不可用时停止项目写入，禁止自动回退 C 盘。
- 重测试/构建前设置当前进程 TEMP/TMP 到 .tmp/project-temp，不修改 Windows 全局环境。可使用本地 .tmp/Enter-ProjectWorkspace.ps1。
- 下一执行卡应采用维护后的实际 HEAD，并核验产品树仍与 N37R2 产品锚点一致；不要因本次文档/工作区规则提交而回退 N37R2。

本次仅进行文件完整性、Git 身份和环境路径检查，无产品变更，不重复运行 750 项产品测试或重新建包。
