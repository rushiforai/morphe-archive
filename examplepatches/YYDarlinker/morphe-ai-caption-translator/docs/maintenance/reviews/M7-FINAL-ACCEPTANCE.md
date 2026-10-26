# 首轮工程成熟化最终验收

2026-10-26（Asia/Shanghai）。统筹结论：**接受M7规定范围及首轮工程成熟化交付；转入日常维护，不再预设新的优化卡。** 当前接受本地产品为 **1.5.8 / local-1.5.8-m7b / candidate-02**。公开版本仍为 **1.5.7**，本次验收不构成发布、Morphe官方收录或全面设备/服务认证。

## 判断依据和证据层级

1. 原M0–M7a及[M7b本地复核](M7b-REVIEW.md)各自接受的有限范围保持，原报告、红绿、失败、回退原件和历史包不改写。最终完整本地应用验证为core328+extension547=**875项**，0 failures/errors/skipped、115份XML；同次compiled/receipt/工程指纹已独立核对，另有统筹29项针对性重跑。**本次收尾没有重新执行测试或构建，不把旧测试写成本轮新跑。**
2. M7b最终候选在21.41.525-SECONDARY和21.28.208，使用官方1.48.0/Patcher2.0.0/104兼容默认根+AI的两组真实组合、资源重编译及DEX审计已接受。这两组电脑unsigned工件不是手机安装包。
3. 用户在收到本次手机MPP及手动安装/观察清单后回复：**“都没有问题。请问是可以验收了吗？我们可以宣称达到了什么效果？”** 结合提供的真实设备诊断，接受该回复为对上一轮手动更新、设置、普通/全屏、Shorts评论及切换/重入清单的总体无问题确认；这是用户观察，不虚构代理逐项操作、现场录像或自动设备测试。细分故障注入和未记录操作不据此标通过。
4. 用户此前报告环境为Manager2.2.0 / YouTube21.20.405 / 官方补丁1.48.0，原始APK可用，Manager数据/签名未重置。本轮收到的诊断确认运行build，但**未独立读取手机型号、Android、ABI、实际包名/versionCode、证书、签名APK SHA及手机完整根选择**。这些信息仍未知或仅为用户报告，不强加电脑104根、不倒填电脑receipt，也不要求用户为本轮有限验收再导出密钥或安装包。

## 本次设备诊断的实际核对

用户文件`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.8-20261026-083958.txt`只读使用，原件未改。E:私有证据副本为`validation/runs/20261026-M7-final-acceptance-01/device-input/caption-diagnostics-1.5.8-20261026-083958.txt`，**367556 B**，SHA-256：

`5484d29406ce5de59aafdcf408cd5f3c3c4509270c00c49d3c2b3b1c07043b64`

- 第112行导出manifest为`ui=1.5.8; engine=1.5.8; build=local-1.5.8-m7b`；第206行首次draw Hook亦为该build，`SubtitleWindowView.draw`已连接。与交接候选预期一致；这属于运行身份佐证，不冒充已安装APK的逐字节证明。
- `official/patcher=unknown`、`runtime_unverified`与`build_expected_official=1.48.0/build_expected_patcher=2.0.0`分开，是M7b有意修正的如实来源说明，不能将unknown判作补丁失效，也不能把expected当手机实读版本。
- 日志存在DETAIL、FULL、SHORTS_FULL、SHORTS_REDUCED展示类别、原生选轨/CC、视频切换、源字幕和译文的实际呈现记录。用户所述视觉无问题是主要体验依据；日志只佐证所记录的路径，不覆盖任意操作顺序。
- 两个`source_passthrough`会话（1、15）在该有界日志内没有`REBUILD_HTTP_BEGIN`。这支持**所记录源模式会话未发模型请求**，不扩大为所有可能并发交错的证明。
- 另有用户自行实际运行的翻译：13个HTTP begin/response均一一对应，response为200；头部累计亦为13 attempts、13 successful、0 failures、internal retries0，累计25284 tokens。**不能把全段说成零付费/零模型调用**；不由attempt或200推断真实账单、退款、语义完全正确，也不把收到日志视为允许代理未来调用服务。
- 有15条质量建议；不以成功HTTP掩盖这些观察。三条去重后的`preparing_layout`暂态（顶部摘要与history存在重复，已按完整事件去重）均在同一显示事件5/8/14ms后出现有效可见结果，没有观察到这三处持续阻塞。它们不是硬件帧率基准，也不能据此保证所有译文/布局无问题。
- 队列快照为`pending=0; pending_decisions=0; pending_total=0; dropped=0; credential_unavailable=0`。导出自述`bounded_not_guaranteed`，不能当完整生命周期无异常证明。

详细字段、原行号、去重方法、范围和统计见[diagnostic-findings.json](../../../validation/runs/20261026-M7-final-acceptance-01/diagnostic-findings.json)。原文件含字幕/模型响应/视频标识，作为本地私有证据保存，本次不发布原日志。

## 已达到的效果

| 方面 | 本轮可接受的具体结果 |
| --- | --- |
| 验证与产物 | 当前源码、输入指纹、两模块实际报告、明确MPP/MPE/UI和负向身份检查可关联；统一入口已覆盖必要core测试和发布前检查 |
| 网络与生命周期 | Retry-After日期/长等待/溢出修复，普通/page/hole门按合同统一；退休后拒绝新的模型attempt，已发送响应/旧publication按原作用域处理 |
| 配置与凭据 | 部分保存后同步实际运行配置，坏值/失败草稿/迟到编辑/通知失败有边界；不自动删除不可读密文或猜选其他profile |
| 缓存 | 源缓存提交失败的有效目标保护、成对一致性及恢复回归；保留跨文件/断电/跨进程和晚到窗口限制 |
| 结构与诊断 | 无生产调用回环服务和专用网络例外退役；数值过渡状态提取；诊断能分清分类/实际决定/来源，有限机制测量及重复凭据读取修复 |
| 接手维护 | Git可见环境/验证入口、当前文档/历史分层、已装工具+缓存依赖下的隔离复跑、逐文件回退及候选追溯可用 |
| 用户体验 | 用户当前单设备、报告的21.20.405组合，经手动更新/观察总体无问题并有m7b运行诊断；补足本轮有限体验收尾 |

因此可表述为：**完成首轮工程成熟化，形成结构和职责更清楚、关键异常有回归保护、构建验证与产物可追溯、资料可交接的独立Morphe兼容AI字幕项目；通过有限组合验证及一台实际设备的短使用验收。** “更专业、更易维护”是这些具体改进的总结，不是官方认证或保证永无缺陷；未承诺全仓文件/行数/包体单调减少。

## 保留限制与停止点

远端GitHub CI、空缓存新机器首装/在线registry认证、本地Maven原发布commit、实际设备硬件Keystore/物理IO尾延迟、帧时/内存/耗电、长时间稳定性、其他版本/OEM/根选择/供应商/14语言母语质量及任意线程交错仍未全面验证。配置多store/orphan/恢复、源缓存晚到窗口/双IO/断电等按各合同保留；主线程启动严格配置读取仍在。

本次真实设备/供应商使用证据已收到，不能继续笼统写“完全没有真实服务证据”；准确边界是**一个用户样本，无供应商账单/全故障矩阵/译文质量认证**。不宣称性能数值提升、费用下降、所有版本兼容、官方PR可接受、跨store事务或全新机器一键冷启动已完成。

达到本轮停止条件。后续仅在用户发现具体回归、主动增加功能/宿主版本/依赖，或安排新的独立验证范围时另立有界工作；不为追求测试数、目录缩小或形式化“更专业”继续重构。正式发布、提交官方PR/远端CI/设备测量等均为另行选择，本次不自动执行。

## 本次记录、保护与回退

本次只分析用户提供的诊断、保存私有副本，并更新当前文档/状态；没有生产、测试、构建工具、资源、依赖、候选包或公开元数据修改。没有代理签名/安装、真实服务调用、commit/tag、推送/PR、发布、卸载/清数据/缓存或reset/clean。用户自行安装/使用与代理操作明确分开。

实际分析复查命令（只读私有副本，不连接设备或服务）：

```powershell
& 'E:\Projects\DeepSeek morphe-ai-caption-translator\work\toolchain\python\python.exe' -B -X utf8 `
  'E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261026-M7-final-acceptance-01\inspect-device-export.py' `
  'E:\Projects\DeepSeek morphe-ai-caption-translator\validation\runs\20261026-M7-final-acceptance-01\device-input\caption-diagnostics-1.5.8-20261026-083958.txt'
```

另做当前文档本地链接/保护核验，未运行Gradle；分析脚本、复查输出和最终核对见`validation/runs/20261026-M7-final-acceptance-01/`。10份入场文档字节、2259项范围外Git可见输入及两项既有缺失状态在首写前保存。结束再核对范围外、branch/HEAD/index/exclude、原诊断及候选身份和镜像；结果写入`final-handoff-check.json`。

如需撤回本次验收记录，先按该JSON检查退出哈希，再从`entry/`逐文件恢复10份当前文档（状态和镜像必须成对），移除本次新增验收报告的当前引用；遇到后续改动停止并合并。保留原诊断、分析/入场证据和本验收报告作为历史，不reset/clean。记录回退不会卸载设备应用、恢复用户数据或回退已接受生产内容。
