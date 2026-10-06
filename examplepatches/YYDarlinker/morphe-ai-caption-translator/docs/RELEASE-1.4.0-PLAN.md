# N37R2 → 1.4.0 正式发布方案与 Morphe 规范核查

日期：2026-10-05（Asia/Shanghai）。本文件为本地研究与执行方案；本轮不修改产品、不调整版本号、不推送、不创建 Release、不向第三方发消息。

## 1. 决策与范围

以 N37R2 产品提交 `6ff1053c74c2deaa10bf733f5328d3b6756abd49` 为 1.4.0 产品基线。当前维护 HEAD `e74beaf`，产品目录与 N37R2 核心一致；保留全部原锚点、三件套和迁移归档。1.4.0 由源码正式构建，不将 1.3.5 本地测试包改名上传。

产品名称保持 **Anchored AI Captions**，明确为独立的 YouTube AI 字幕补丁源，兼容 Morphe。保留现有仓库 URL 以维持已安装补丁源更新链；不以 Morphe 官方身份、名称或图标作为本项目品牌。不因文档规整移动运行时包、重写引擎、改变设置键或缓存身份。

已验证支持边界：官方补丁 1.45.0、原版 YouTube 21.16.256、Android 9 / minSdk28。不扩大到未经验证的 YouTube 版本或官方补丁版本。公开 root 精确两项：AI caption translator 与 Remember caption selection。后者为可选、进程会话内记忆，与 AI 开关独立；不恢复简体中文独立 root。

N37R2 本地记录仍是实体手机居中 after 待确认。发布说明不得把模拟器 86 次布局实测或750测试描述为真实手机/OEM全覆盖。优先在发布前记录一次英语/阿语 UI 下详情、全屏、Shorts 的简短手机确认；若没有新证据，明确保留边界，不能臆造结果。无需重新验证十四语种母语语义全表。

## 2. 官方指引与本仓库核查

| 核查项 | 本地观察 | 处理方案 |
| --- | --- | --- |
| 独立品牌、GPLv3和 NOTICE | about.name 已为 Anchored AI Captions；group 为 app.yydarlinker；LICENSE/NOTICE 已存在 | 保留；README 首页说明独立维护。现有 URL 为历史兼容地址，不改仓库地址或运行时命名空间 |
| patch/extension 分层 | Kotlin bytecode/resource patch + 独立 extensions/extension.mpe；公共补丁依赖共享支持层 | 基础形态符合官方推荐，不做架构重写；更新架构说明以反映 N33—N37R2 现状 |
| 明确应用兼容范围 | Constants.YOUTUBE 规定包名、签名、APK_REQUIRED、21.16.256、minSdk28 | 保持；正式生成的 patches-list 与真正交付 MPP 必须一致 |
| 自动发布 | release.yml 使用 semantic-release；官方 changelog插件、Gradle版本处理、manifest校验、MPP上传及 attestation 已存在 | 复用现有流程，只修改旧分支和缺口；不新写发布器，不手工生成 tag/Release |
| 旧 1.3.5 特判 | validate.yml 按元数据版本选择 recovered/1.3.5；N37R2仍用1.3.5本地版本，所以PR会验证旧恢复树 | 必须改为始终构建当前 Java/Kotlin生产树；历史恢复脚本继续归档保留，但不得进入1.4.0候选校验 |
| CI验证版本来源 | 发布准备会由 Gradle/semantic-release 写新版本，再 buildAndroid、生成patches-list | 预发布PR校验也应验证当前源码构建、元数据生成及两公开root；不可仅引用以前成功的恢复包 |
| 分支规范 | 当前main本地领先远端95提交；远端只有main，未建立dev | 保存备份后以当前已审阅树建立dev/发布准备分支；后续开发统一dev，合入main保留提交，不squash、不force push。本次历史不重写 |
| 版本推进 | 自v1.3.5已有6个feat提交，未发现标题中的breaking标记 | 初步应为minor→1.4.0；正式 dry-run 还须检查完整commit正文、远端tag与插件输出。版本不符就处理原因，不能手写元数据凑版本 |
| 自动PR权限 | GitHub API显示can_approve_pull_request_reviews=false；open_pull_request.yml由GITHUB_TOKEN建PR | 若保留自动PR则启用官方模板要求的仓库选项；或由已授权维护账号建立PR。是否启用应按实际工作方式决定，不假装当前设置符合自动PR要求 |
| README | 目前先罗列大量旧版本/内部卡号，再介绍功能，且部分说明与当前引擎不同步 | 全面改为用户指南；历史信息去CHANGELOG/历史文档入口 |
| Issue模板 | bug/feature表单仍指向TEMPLATE仓库，CONTRIBUTING链接不存在 | 更换为本仓库真实路径；新增简明CONTRIBUTING，报告字段覆盖版本、补丁组合、目标语种、设备、复现与已脱敏诊断 |
| 项目文档 | ARCHITECTURE仍含早期简体中文root、预取3窗口等旧合同 | 重写活动架构与开发/发布入口；明确focus2/prefetch2/总4、当前参考/时钟/显示权合同；历史N卡保留为历史，不重写失败证据 |
| 发布树卫生 | 当前tracked含编译bin残留、旧恢复包、一份原始诊断；私有官方输入未跟踪 | 执行前核查当前树及95个未推送提交的凭据/个人数据；编译残留移出活动构建输入、历史二进制保留本地归档。原始诊断不可直接当公开用户文档；已在历史中的内容不得擅自改历史。现阶段未证明含真实secret，不报告已泄露 |
| 生成README补丁表 | 官方模板有现成generator；本地prepareCmd当前未调用该脚本 | 在重写README中保留生成标记，复用现有脚本；只能更新指定补丁表，不能覆盖用户指南。中英说明使用同一产品事实 |
| GitHub About/topics | description以Morphe-compatible开头；topics为空 | 描述以YouTube AI字幕功能开头，兼容说明随后；增加真实相关topic，提高GitHub可检索性 |

参考：
- 官方模板：https://github.com/MorpheApp/morphe-patches-template/blob/main/README.md
- 官方命名NOTICE：https://github.com/MorpheApp/morphe-patches-template/blob/main/NOTICE
- 架构与约定：https://github.com/MorpheApp/morphe-patcher/blob/main/docs/3_structure_and_conventions.md
- Patch/Extension API：https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_2_patch_anatomy.md
- 源安装及多源组合：https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md

没有查到独立第三方补丁必须先并入官方仓库或获得官方认证后才能发布的要求。模板使用dev→main是推荐工作流；现有直接在本地main开发的历史与它不一致，应从本次发布准备开始恢复，不用重写历史伪装合规。基础架构相符不等于所有运行时路径、OEM表现、许可证细节已经得到官方认证。

## 3. README重写规格

主 README 英文优先，开头链接中文指南 docs/README.zh-CN.md。篇幅围绕定位、使用与边界，不放N卡历史、计分板、测试数量或冗长更新记录。

1. **一句话定位**：用用户自备OpenAI兼容API，把YouTube已有字幕实时翻译成所选目标语言并显示于播放器；这是独立补丁源，需要和已验证的官方补丁组合使用。
2. **可见功能**：Auto-translate选项调用AI；原字幕选择不产生翻译API请求；详情/全屏/Shorts字幕呈现及RTL支持；选定语言加入YouTube自动翻译列表；API profiles、模型与自定义翻译要求；字号/背景/预览；可选字幕选择记忆；缓存与诊断。
3. **安装条件**：兼容表写清官方1.45.0/YouTube21.16.256/minSdk28；用户需要可用API端点、key和模型；视频必须已有可取得的字幕。明确不提供无字幕视频的音频识别服务，不把它描述为离线或免费模型服务。
4. **最短安装路径**：Add to Morphe按钮→启用Expert→加载指定原版YouTube→官方兼容默认集+本源AI root；memory root按需。不要叠加旧AI addon、其他重叠字幕记忆补丁。
5. **设置与使用**：YouTube→Settings→Morphe→AI caption translator，填endpoint/key/model并Test API；在此设置中的Automatic translation languages勾选需要加入原生列表的语言；播放视频，从YouTube字幕菜单的Auto-translate选择目标，AI开启时调用配置服务。关闭AI时回到原生翻译行为，勾选语言本身不是自动后台翻译所有语种。
6. **隐私/费用**：所选字幕文本和必要上下文会发送给用户指定API服务；可能产生服务商token费用，预取也计费；密钥本地加密，上传诊断前仍应检查隐私；不声称输入法/服务商行为由本项目全面控制。
7. **简短故障处理**：API测试失败、菜单无目标、无字幕/等待、冲突、升级；链接到项目Issue表单和脱敏诊断说明。升级通过Morphe补丁源更新后重新补丁，不把更新MPP误解为已安装YouTube自动更新。
8. **支持范围与限制**：网络延迟、源字幕时间精度、供应商翻译自然度；已验证范围与未覆盖OEM/宿主新版，简短明确。
9. **补丁表、开发、许可证**：两root表可生成；开发文档与架构单独链接；CHANGELOG只提供一个链接；保留GPLv3/NOTICE/归属。

Add-source深链接：
https://morphe.software/add-source?github=YYDarlinker/morphe-ai-caption-translator

GitHub About建议：
Real-time YouTube subtitle translation using your own OpenAI-compatible API. Independent patch bundle compatible with Morphe.

Topics建议：youtube、subtitles、translation、ai、android、morphe、morphe-patches。它们是搜索分类，不是官方认可标签。

## 4. 发布流程与快速验证

1. 保留N37R2锚点和三包；给当前维护HEAD建发布前备份。读取远端main/tag与本地历史，不把origin/main缓存视为绝对实时事实。
2. 在dev/准备分支完成README、中译、Issue/CONTRIBUTING、活动架构、现有CI的整理。产品代码不变，除正式版本来源会改变诊断版本字符串。若规范审阅发现需要产品改动，另行记录范围，不能夹带重构。
3. 对新README所有链接/菜单说明/元数据入口和patch根选择检查；审阅待推送提交/文件的隐私与凭据。官方输入、APK、签名材料、迁移档案及本地secret不得新增进入发布资产。
4. CI基于当前源码执行一次全量Java（当前750）与Python27/发行合同11、本地化；当前源码MPP正式构建、patches-list生成、包校验。只有新代码/失败才追加定向复跑，避免重复完整测试、多候选APK和大历史目录重复哈希。
5. 版本分析必须先确认nextRelease.version=1.4.0。使用现有semantic-release流程生成版本、CHANGELOG、patches-bundle、patches-list和带版本BuildConfig，再构建正式MPP；不是复制/改名n37r2包。
6. 合并到main保留原提交；由release.yml唯一发布v1.4.0和patches-1.4.0.mpp。上传范围维持补丁MPP及自动构建溯源，不上传预补丁YouTube APK、私有诊断或巨大证据包。MPE已内嵌于MPP，独立MPE为本地开发用，不要求重复发布。
7. 对实际正式1.4.0 MPP做包/DEX/资源/内嵌MPE/版本/两root及至少一套官方1.45.0+YouTube21.16.256组合审计；原750测试报告只证明产品源基线，不能替代正式资产身份。APK可本地组合审计，不上传GitHub。无产品变更时不重新跑86次模拟器矩阵或全部历史组合。
8. 匿名检查main上的bundle/list/version/下载URL与GitHub资产SHA一致，Manager可以添加并更新；源码tag与源树一致，正式版本显示1.4.0。发布流水线使用已有verify_remote_source，避免自建发布脚本。
9. 记录正式发布commit/tag、MPP哈希、源下载链和Known limits，更新状态与E盘镜像。一次最终身份验证足够，不为文档重复建包。

若需要把第7步作为发布前门槛，应接到既有prepare/验证流程中并为官方输入采用合法、明确的CI输入方式；未跟踪的本地官方MPP和原版APK不会神奇地出现在GitHub runner。本地最终组合结果可与正式资产SHA绑定，不得伪称云端已做宿主组合。源树CI尚未实际运行，此处是方案，不标记通过。

## 5. 社区发现与收录

### 官网链接的社区索引

Morphe官网页脚 **More apps** 指向 https://morphe-patches.software/ 。这是社区维护的补丁目录，非第三方代码官方认证。网页的静态抓取可能显示0条，因为真实列表由/data/bundles.json异步加载；本轮直接取实际数据成功，212个bundle，未找到YYDarlinker或本仓库。数据快照只代表本轮获取时，不固定长期数量。

未查到公开的“自动扫描所有GitHub仓库”保证、提交PR文件格式或强制入驻流程。可在正式发布后，通过网站公开Feedback入口提供仓库、产品介绍、两root、支持组合、1.4.0元数据及Add-source链接，申请加入并核实条件。不要凭猜测向官方核心仓库提不相关Issue，不宣称发版后会自动被收录。

### 明确接受申请的独立索引

Awesome Morphe提供公开Bundle Request表单：
https://github.com/nvbangg/awesome-morphe/issues/new?template=bundle-request.yml

它要求仓库至少已有一个发布且与Morphe兼容。1.4.0发布和源链校验完成后，准备Add Bundle请求，填写仓库URL与简洁介绍；是否收录由维护者决定。它是独立目录，不冒称官方。

参考：
https://github.com/nvbangg/awesome-morphe/blob/main/README.md
https://github.com/nvbangg/awesome-morphe/blob/main/.github/ISSUE_TEMPLATE/bundle-request.yml

### Reddit发布介绍

官网链接的社区为 https://www.reddit.com/r/MorpheApp/ 。实际rules.json明确禁止分享或链接预补丁APK、破解软件或不受认可的补丁工具；还要求不重复发帖、遵守Reddiquette和隐私规则。因此只发布独立开源补丁源的介绍、配置步骤、支持范围、GitHub及Add-source链接，不附YouTube APK；不把本项目说成Morphe官方发布。帖子被允许/置顶不是已确认事实，应依发帖时规则和管理判断。

官方社区已有“How To Patch More Apps With Morphe”帖子介绍社区索引及滚动更新；不据此承诺本项目自动进入该帖。

规则：https://www.reddit.com/r/MorpheApp/about/rules.json
社区指南：https://www.reddit.com/r/MorpheApp/comments/1ta0bek/how_to_patch_more_apps_with_morphe/

### GitHub自身

重写README、补齐About和topics、明确源码/兼容/支持入口、正确release资产与可被工具读取的patches-list/bundle，是最直接且可控的发现工作。可准备一篇英文社区介绍；不要群发、不强行联系无关官方项目。

本轮仅研究。后续用户授权正式GitHub发布不自动授权向第三方维护者发送请求、邮件或Reddit帖子；外部提交前先准备具体可审阅内容，并取得明确发出指令。

## 6. 本轮完成与待办

已完成：本地仓库、远端公共Release/分支/Actions设置和官方指引只读核查；确认README、Issue模板、旧CI路径、分支、架构文档、活动发布树卫生与社区可发现性的整理方案；保存网页/索引研究快照于E盘。

未执行：README重写、CI修改、版本更新、正式1.4.0构建、推送、PR、合并、Release、社区投递。只落地此方案与PROJECT-STATE计划摘要。本地所有研究写入E盘，状态镜像保持字节一致。


## 执行补充（2026-10-05，用户已授权直接发布）

用户要求兼容范围自YouTube21.07.247、官方补丁1.42.0起，稳定推荐与官方同步。实际官方1.42.0/1.43.0含21.13.164和21.07.247；1.44.0/1.45.0含21.16.256和21.13.164。因此发布目标改为三版稳定列表（最新优先），不加入官方20.x或实验目标。官方1.45.0/YouTube21.16.256为推荐组合，历史组合的验证等级另列，不以官方的支持声明代替本源测试。

发布准备已经重写英文README、中文指南、活动架构、兼容表、开发/发布说明和Issue表单；移除活动Git树中的editor bin输出而保留本地文件。现有release/validate工作流不再走旧recovered源码特判。普通CI全量曾暴露测试证据目录参数缺失，已在测试Gradle配置提供默认build/test-evidence，保留所有产品源、旧测试和断言。

高可信字面token/private-key扫描覆盖96个未推送提交、2903个唯一文本blob，没有发现非夹具密钥。它不是全面安全认证；回归使用的已脱敏原始诊断继续作为测试夹具保留。版本commit-analyzer初步分析minor→1.4.0；正式流水线先dry-run再发布。社区材料已准备但未外发。


干净云端验证首次完成750项时出现7项失败：N34的5项依赖D盘字幕路径，N23依赖本地.verification镜像，N24预取预算断言在两个初始响应已完成后误把合法补位算作超预算。本地随后全量又暴露快速跳转测试要求最后目标在中间目标已占满focus槽时仍立即发送的不确定等待。已保留原失败日志；测试输入改用仓库内逐字节相同的n30资源和N20镜像，测试控件使用已有响应gate界定验证时点，保留所有旧断言/时限且新增风暴期间的lane界限检查。产品调度/CAS代码未改。CI已取消dev push与PR重复验证，默认只跑PR一次；自动PR创建所需设置按官方模板启用，默认工作流token仍为read。


历史1.42.0/21.07.247实际组合before明确拒绝在AI quick toggle共享divider接缝：旧官方addFlyoutElements只向Runnable延后分发，实际组装/分隔线在DEX合成代理中；1.45.0则直接组装。适配使用实际NEW_INSTANCE Runnable、单Object捕获构造器和run()中的typed static调用解析唯一真实body，不写死R8名字或版本号，不跳过divider核验。所有结构均在第一处修改前解析；1.45直接路径保持。字幕Java运行时未变。需重跑旧组合after与推荐组合/最终正式资产。
