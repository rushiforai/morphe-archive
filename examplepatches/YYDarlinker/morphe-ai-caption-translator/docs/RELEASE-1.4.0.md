# 1.4.0 正式发布记录

日期：2026-10-05（Asia/Shanghai）。用户明确授权直接发布并要求自YouTube21.07.247、官方补丁1.42.0起声明稳定历史支持。

## 正式身份

- GitHub Release：https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/tag/v1.4.0
- 正式 tag：v1.4.0，指向自动版本提交17c41ae12bcae252fad2b6c5dfe9b2b3ffad263d。
- 发布工作流：https://github.com/YYDarlinker/morphe-ai-caption-translator/actions/runs/37307657885 ，全部通过。
- 发布PR：https://github.com/YYDarlinker/morphe-ai-caption-translator/pull/7 ，merge commit 1ee6a3ccd1025bbab8de46bd060f9b65707dbdcc。
- 发布时间：2026-10-05 20:15:34 +08:00（GitHub publishedAt 2026-10-05T12:15:34Z）。稳定版，不是pre-release。
- MPP：patches-1.4.0.mpp，1,291,654字节。
- SHA-256：6A95B2A4949A87C9E65DCF6D9957A0A992A0C8803A883BC665C17AC8DAB81F9D。
- 匿名资产地址：https://github.com/YYDarlinker/morphe-ai-caption-translator/releases/download/v1.4.0/patches-1.4.0.mpp
- 本地正式下载副本：E:\Projects\morphe-caption-v2\build\releases\1.4.0\patches-1.4.0.mpp。
- 仅发布MPP和GitHub自动构建溯源。没有上传YouTube APK、私有profile、密钥或巨大验证包。

## 实现范围

保留N37R2核心6ff1053及全部历史锚点/三包。发布新增稳定目标声明、用户文档、CI可复现性与旧官方菜单接缝适配；字幕Java生产源码相对N37R2无diff，字号/计时/分页/缓存/CAS/网络合同未改。

正式补丁根精确两项：AI caption translator、Remember caption selection。目标按最新优先排列：21.16.256（推荐）、21.13.164、21.07.247；三个isExperimental=false/minSdk28。官方当前最新稳定推荐1.45.0；21.07.247需匹配历史1.42.0/1.43.0。官方20.x低于项目下限，实验YouTube版本不冒充稳定支持。

实际核对官方1.42.0—1.45.0 metadata并保存快照。声明不是连续版本区间；21.13.164未在本轮独立组合，十四语种/OEM/真实音频不是全覆盖认证。N37R2真实手机居中after未新增记录。

## 文档与仓库规整

英文README重写为定位、功能、安装/配置、版本、费用隐私和排查指南，中文在docs/README.zh-CN.md；生成的补丁表由既有流程填写。历史更新只留CHANGELOG/历史入口。更新当前ARCHITECTURE、COMPATIBILITY、CONTRIBUTING、RELEASING，修正Issue模板的TEMPLATE链接。Github About和youtube/subtitles/translation/ai/android/morphe/morphe-patches topics已更新。独立名称Anchored AI Captions、GPLv3与NOTICE保留。

dev→main保留原提交，不squash或force push。既有semantic-release唯一发布；不手工修改/提交bundle/list/changelog生成文件，不改名上传N37R2测试包。旧recovered 1.3.5不再代替当前源码CI。移除Git树中的editor bin编译输出，本地原件保留；历史输入/失败日志/迁移档案未清掉。

## 验证与真实发现

- 最新发布准备CI完整750项通过，Python发行合同11、本地化241×14通过；本地Python27通过，冻结4/4/4与三类invisible_ms=0不被包装成全语义通过。
- 干净CI首次发现N34测试依赖D盘原字幕、N23依赖本地.verification镜像，以及缺少scheduler.output默认目录。改为仓库内字节相同资源并配置默认证据目录；保存portable-inputs.json。没有删除旧断言或放宽时限。
- 两个N24并发夹具的等待时点受真实线程快慢影响。初始预取用已有响应gate防止已完成任务合法补位；压力测试先检查满槽边界，再释放中间请求观察最终目标，保留全部原边界断言和5秒时限。定向77/77通过；随后云端全量750通过。
- 旧官方1.42.0/YouTube21.07.247真实before在菜单divider接缝拒绝。官方旧结构为外层延后Runnable、组装body在DEX合成代理；适配沿实际new-instance/captured Object ctor/run调用找到唯一static(Object)V body，不硬编码R8名字，不跳过结构检查。1.45直接路径保持；所有检查在第一处修改前完成。
- 历史after两个root真实执行通过，序列化DEX审计通过，56,874类；实际hook唯一可达、位于共享divider/信号reset之前。
- 1.4.0版本候选＋官方1.45.0＋YouTube21.16.256完成真实组合和APK资源构建，11DEX、58,327类API/hook审计通过，branch非法数0。
- branch自检继续拒绝落入操作数字和越界变异。初次误用require-ai=true要求已撤回N27 controls回调而失败；按N37R2同一旧工具合同指定false后审计全部DEX。实际AI字幕必需hook由独立auditComposition验证，不降低其判据、不恢复N27。
- 发布下载MPP与上述1.4候选root classes.dex及内嵌MPE逐字节相同，55个entry字节相同；16个文本entry仅CRLF/LF不同，manifest唯一不同属性是Timestamp。ZIP CRC正常，因此已组合审计的生产DEX对应真实发布资产；报告详published-vs-candidate.json、manifest-comparison.json。
- 发布工作流验证匿名source chain与实际资产SHA；本地独立匿名复验manifest/list/changelog/MPP均HTTP200，版本1.4.0、两root、Manager DTO有效。GitHub资产digest也相同。生成标签/元数据由自动发布完成。

已保留本轮所有失败与成功日志，资料位于E:\Projects\morphe-caption-v2\.verification\release-1.4.0。此次不是运行时功能大改，也不是十四语种母语或手机全场景验收。

## 社区发现

官网More apps社区索引当前快照未含本源；没有自动收录保证。Awesome Morphe提供明确Bundle Request表单。外部Feedback/Bundle Request/Reddit介绍稿在docs/COMMUNITY-INTRODUCTION.md，尚未外发。没有代发第三方Issue、邮件或Reddit帖子；仓库发布与About/topics已完成。Reddit材料仅链接开源补丁源，不链接预补丁APK。

用户更新时应刷新本项目远程源至1.4.0，并停用/不要重复选择旧本地测试源，重新用推荐原版APK打补丁。保留原签名设置与用户数据；本轮未签名安装实体机或清数据。
