# 日常维护操作入口

先读[PROJECT-STATE](../PROJECT-STATE.md)、[当前文档](../README.md)和[开发环境](../DEVELOPMENT.md)。当前公开1.5.8 / release-1.5.8；正式CI/876项、匿名来源及组合见[发布结果](results/RELEASE-1.5.8-RESULT.md)。活动本地仓库仍在E:，环境只在本进程配置。下列命令按当前gradle.properties身份执行；未来新发布/模型/设备操作按相应用户请求，不自动复用本次授权。

## 改动和验证

1. 保存入场 `git status --porcelain=v1 --untracked-files=all`、分支/HEAD/索引，以及本卡文件的原件与 SHA-256。工作树已有多轮未提交修改、未跟踪文件和两项删除，比较本轮入场字节，不能以 HEAD 总 diff 当成本卡改动。
2. 日常用 `tools/workspace/dev.cmd`，默认先本地化再两组测试；针对性例子：`tools/workspace/dev.cmd :translation-core:testDebugUnitTest --tests '*RetryAfterContractTest' --offline`。按实际机制选择相关回归，生产行为变化再按任务卡完成来源/协议/边界等必要检查。
3. 固定最终工程输入，用 `tools/workspace/verify-full.cmd -RunId <独占ID> -ExpectedVersion 1.5.8 -ExpectedBuildId release-1.5.8 -Offline -RerunTests`。身份来自当前 `gradle.properties`；后续任务若授权改身份，应同步明确参数，不复制旧命令的 build ID。已有 RunId 拒绝覆盖。
4. 查看该次 `validation/runs/<RunId>/summary.json` 与原始日志，确认两模块实际执行或有效复用、counts、失败/错误/跳过、实际 UI/MPP/MPE 路径和 SHA。完整结果不是只有退出码。下一次 Gradle 前封存本次 compiled ZIP、XML、receipt 与输入指纹绑定；不要把可再生成中间 class 累加到永久保护清单。
5. 同批归档原件、退出哈希/逐文件 diff、产物逐条目比较、未验项及回退方案。报告写 `docs/maintenance/results/<任务>-RESULT.md`，状态/镜像成对同字节。执行完成只标“完成待复核”，统筹仍“待复核”。

常规输出在 `build/maintenance/M1a/<RunId>/`；本地试包和公开资产分开。正常构建管理自己的中间输出，不主动删已有交付、历史 ZIP、封存 log/XML/receipt 或其他任务证据。

## 包检查、组合与体积

对既有包复查必须显式指定，不能按目录挑“最新包”：

```powershell
& $env:MORPHE_TASK_PYTHON -X utf8 .github/scripts/verify_bundle.py --mode candidate --version 1.5.8 --build-id release-1.5.8 --mpp '<本次明确MPP>' --mpe '<同次独立MPE>' --output '<E盘新报告.json>'
```

真实组合与完整源码验证分开判断。输入必须是原始 YouTube APK、匹配官方 MPP、本次 addon MPP、Patcher 2.0.0 JAR 和选择集合；显式输入 `composition.patcherJar` 避免历史路径。例子中的占位路径必须换成实际存在且已核验哈希的输入，输出目录也要独占：

```powershell
.\tools\workspace\dev.cmd :patches:verifyComposition --offline '-Pcomposition.input=E:/inputs/original.apk' '-Pcomposition.official=E:/inputs/official.mpp' '-Pcomposition.addon=E:/inputs/current-addon.mpp' '-Pcomposition.patcherJar=E:/inputs/morphe-patcher-2.0.0-all.jar' '-Pcomposition.output=E:/Projects/DeepSeek morphe-ai-caption-translator/validation/runs/unique-composition' '-Pcomposition.selection=AI caption translator' '-Pcomposition.compile=true'
.\tools\workspace\dev.cmd :patches:auditComposition --offline '-Pcomposition.apk=E:/Projects/DeepSeek morphe-ai-caption-translator/validation/runs/unique-composition/patched-unsigned.apk' '-Pcomposition.patcherJar=E:/inputs/morphe-patcher-2.0.0-all.jar'
```

缺原始输入不做成功结论，不自动下载专有 APK，也不从旧报告倒填。M7a曾在全部生产条目相同的证明后引用M6a历史组合。M7b生产来源元数据改变，已对新候选重做主组合21.41.525-SECONDARY，并仅补充21.28.208；独立选择集/输入SHA/资源/DEX见 [M7b结果](results/M7b-RESULT.md)。[安装前与短设备清单](M7b-DEVICE-ACCEPTANCE.md)记录输出包名、未签名层级和签名条件；用户现已完成手机短观察并反馈无问题，m7b运行诊断已核对，环境版本按用户报告，设备签名/APK SHA未独立实读。

每次记录 MPP/MPE/UI 实际字节数与 SHA，比较 ZIP 逐条目内容及压缩贡献。区分 manifest 时刻、生产 DEX/资源、ZIP结构和签名差异，不能从包体推出运行速度。工具源码指纹变化不等于产品 build ID 变化。

## 常见失败

| 现象 | 处理 |
| --- | --- |
| JDK 21、SDK35/36、Python3.12、Robolectric jar 缺失 | 按开发环境表设置明确路径；错误输入会失败，不借用旧工作区或 Codex 私有工具 |
| `ANDROID_HOME` 与 `ANDROID_SDK_ROOT` 冲突 | 设置同一个 SDK；不要靠隐式查找 |
| `--offline` 找不到插件/依赖 | 本机缓存不完整。补充合法的依赖来源/认证，再另行解析；保留失败日志，不清共享缓存 |
| GitHub Packages 401/403 或缺 username | 提供包读取所需的本进程 `GITHUB_ACTOR/GITHUB_TOKEN`；勿打印 token。M7a 未验证空缓存在线认证 |
| candidate 身份错误、local 包被当 release | 核对本次 source/build ID/明确包路径；不要修改检查器或公共元数据来凑成功 |
| XML缺失、全跳过或陈旧报告 | 查同次 receipt 的任务结果，不拿历史 XML 替代；新ID重跑所需检查 |
| 导出来源字段 | M7b保留official字段但为unknown/runtime_unverified；build_expected仅构建预期，composition仍未在设备运行时验证。旧1.45.0日志按历史静态标记解释，完整映射见诊断合同 |

## 回退及发布边界

回退以本卡入场原件和**退出逐文件哈希**为准，默认只检查；任一后续编辑/新增删除冲突，整批拒绝且零写。状态与镜像必须同一计划；结果、证据、历史归档及所有包保留。不要 `reset/clean`、覆盖整棵工作树或清用户数据。M7b最新可执行计划和已做dry-run见 [结果](results/M7b-RESULT.md)；M7a历史计划保留；隔离恢复演练不代表实际仓库已恢复。

公开发布前仍需独立授权、明确版本/semantic-release决策、必要组合/设备/来源说明与远端CI，并在发布后核对匿名下载资产。流程见 [RELEASING](../RELEASING.md)。本地 candidate/full check 不运行 publisher；本手册没有授权 push、PR、签名安装、付费服务或公开发布。

## 工作区整理

目录/归档/保留规则见[WORKSPACE](../WORKSPACE.md)，当前资料见[文档入口](../README.md)。2026-10-26仅整理本地，临时文件先内容去重归档再移除；正式/历史包、封存证据、源APK、工具链及Gradle缓存保留。`work/test-temp`是JVM测试临时目录，可再生，不能与用户设备缓存或`work/gradle-home`混为一谈。归档恢复默认只检查，遇到后续冲突整体拒绝；线上更新见[只读计划](GITHUB-UPDATE-PLAN.md)，本手册不授权线上操作。

复现当前公开源码可以使用release-1.5.8身份；以后开始新的开发任务应设置该任务的明确local build ID并验证指定包。不能仅凭源码默认release标记认定某个本地重建包就是已公开资产，正式资产仍以Release下载SHA为准。
