# 1.5.8正式发布及GitHub整理结果（执行中）

2026-10-26（Asia/Shanghai）。用户已明确授权发布最新验收版本为1.5.8并执行线上整理。当前状态：本地准备及完整预检通过，远端CI/正式发布/分支与PR收尾待执行。本报告持续补充实际结果，不能按本草稿宣称已经发布。

## 保护及入库

唯一活动仓库E:，复用codex/fix-cc-authority-1.5.8。入场HEAD de844402776e1046a5bec87aac94e2e65f05bea7、2275个现存Git可见文件/原索引/脏树和两项既有删除均在`validation/runs/20261026-release-1.5.8-01/entry-files.zip`、entry-manifest/diff中保留。用户新发布授权允许本次有界stage/commit/push/merge，不沿用旧只读阶段的“不得发布”作为停工理由。

源码提交18b4b7e保留已验收N69–M7成果；构建/发布提交7de6e68整合已逐项审阅的依赖目标：semantic-release25.0.9、semantic-release/git11.0.1、backmerge6.2.0、setup-java6.0.1、upload-artifact7。旧依赖PR尚未直接合并。不存在的cycjimmy wrapper改为官方JS API，实际publisher仍为既有semantic-release插件链，不使用手工上传旧local MPP替代正式构建。

## 本地实际验证

`preflight-01/summary.json`为passed，完整命令见preflight-command.json；使用canonical verify-full、Offline+RerunTests、1.5.8/release-1.5.8。core328+extension547=875，全部实际执行、失败/错误/跳过0。159个生产main输入与入场SHA一致；build ID是构建配置变化，运行代码/资源/缓存与凭据格式/协议/ABI不改。

本次预检MPP600263 B，SHA `8a6de3bdebc73aad7c108d607014eed1f57fff579bf70d8db2aadcc521a42660`；它是本地预检工件，不提前认定为之后CI发布资产。MPE SHA `5fc19a18ff7abd80d98d436da323e121cb0d46cb1f325b7821617c84e1ae731c`。同次81个core类、receipt/源指纹已在下一Gradle前绑定归档。首个辅助归档因Win32长类路径失败，改扩展路径读取后成功，失败ZIP保留。

npm锁定安装、全部8个发布插件加载和14项元数据合同通过。首次公开清单检查把既有recovered历史MPP也当成新产物拒绝；已改为只允许入场同SHA的两个已跟踪历史包，新APK/MPP/MPE/密钥输入仍禁止。已核对公开清单无已知凭据值、无私有目录和新诊断。

## 历史诊断外部输入迁移

`caption-diagnostics-1.3.5-20260929-155802.txt`本机根原件保持，另存`.verification/frozen-inputs/`，SHA仍`13b1f29cdf6ea180dadb67bf91de6a7b085412fb132880d8cd07585cf5ac5171`。scoreboard仅改输入定位，保留解析/判据/哈希；显式CAPTION_FROZEN_INPUT_DIR缺输入时拒绝，不暗中回退或请求网络。真实N9的34条JSON/响应记录从根和私有目录读取一致。原20260927诊断及SRT在任务前已缺，完整旧计分回放未运行，不伪造输入/放宽哈希；此限制不属于当前875项产品验证。

## 远端执行及收尾

尚待功能分支CI、1.5.8版本预览、main/dev整合、正式发布及匿名来源下载核验；之后再按具体替代证据关闭5个旧依赖PR、删除已并入/已替代分支并设置兼容发布链的保护。旧Release/tags/资产不改，设备签名安装/真实模型不做。

发布最终身份、资产SHA、公开来源与CI链接及各整理动作将在完成后记录。本机证据不上传，源APK/合成APK/真实配置/私有备份不作为Release资产。若发布前验证失败先修正并保留失败；已公开后的问题用新修复提交/版本处理，不重写既有Release/历史或reset/clean用户工作。
