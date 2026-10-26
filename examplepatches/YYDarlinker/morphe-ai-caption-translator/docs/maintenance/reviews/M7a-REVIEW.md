# M7a统筹复核：接受可分发入口与有限复现交付

2026-10-25（Asia/Shanghai）。**接受M7a v1的通用入口、工具合同/长路径修复、隔离源码＋已装工具＋已缓存依赖演练、资料及历史收敛范围。** 不扩大为空缓存/新机器首装、在线registry认证、本地Maven原发布commit或远端CI认证；不自行宣布M7/首轮总体完成。

产品身份仍为接受的1.5.8 / local-1.5.8-m6a / candidate-01，公开1.5.7。本轮M7a复现包是同生产内容的另外一次构建，不替代原M6a历史哈希。原[任务](../tasks/M7a.md)、[结果](../results/M7a-RESULT.md)、失败尝试及隔离树保持。独立证据 `validation/runs/20261025-M7a-coordinator-review/`。

## 接受的实际收益

六个canonical文件在tools/workspace可被Git非忽略文件枚举，且纳入source_manifest；本机.devenv仍忽略，只保留别名。通用初始化只用进程显式工具/缓存输入和仓库默认，拒绝缺工具、SDK冲突和C:可写home，不搜索旧工作区/Codex Python或gh账号；不重写已选Gradle properties，不改全局环境，不将代理凭据回显。Morphe配置期包设置要求有可理解错误，离线占位明确无权限，不能当在线认证证据。

日常和完整入口保持参数/错误码、两组Test、local/release严格检查与默认无真实模型调用；两项长路径问题按真实文件读取/遍历修复。新资料把依赖来源/认证、缓存层级、日常验证/回退和发布边界写在当前入口；长PROJECT-STATE的完整原文先原字节归档，新状态可直接找到当前接受身份与未验限制。

## 独立核验

1. **工具合同重跑46项全部通过**：workspace15、verification17、release14；包括真实新PowerShell进程、空格参数/flags/模式转发、失败码、缺工具/包设置、SDK冲突、代理secret不输出/不落盘、私有Gradle设置不覆盖及别名/嵌套指纹。verification两长路径实际fixture也通过，旧入场工具的读取错误/漏扫红证据与原件哈希可核对。
2. **真实canonical CLI拒绝路径**：显式工具/缓存和offline-cache-only非凭据输入，由新verify-full.ps1请求错误版本0.0.0，实际exit1，summary failed且commands为空，准确拒绝于source版本不符，没有启动Gradle/发布/模型。这与stub转发测试层级分别记录。
3. **实际隔离演练与872项有效**：原隔离树仍无.devenv，rehearsal-inputs-04每个输入哈希与现存隔离源码相符，最终manifest等于活动仓库/完整前后；原测试路径与活动证据副本114份XML逐项同SHA。core328+extension544实际执行，失败/错误/跳过0；557类ZIP/逐类SHA/receipt/指纹绑定有效。复核不重复872项或相同生产组合。
4. **指纹与产品分层**：当前工程 `aa19b7c8815d30105b975a39805ca384e39fcc86a8829584445c67ce7cae7d05`，相对接受M6a的13项工程差异全部tools输入；生产源码/资源/依赖/build ID/core来源等保持。六通用文件Git可见，.devenv Git可见0，原index/exclude不变。本轮尚未commit/push，接受的是工作树及可交接源码归档，不声称远端仓库已更新。
5. **产品字节及边界**：M7a MPP `7d09f3fe1cba7f7815e2b83b7c78b4174426379dc7e447609620c716ce881473`，600147 B；对原M6a74条目仅manifest Timestamp不同，其他73同内容，独立/内嵌MPE和UI全文件同SHA。统筹从本次compiled ZIP取core复查来源、compiled/UI/包边界、candidate通过；实际local冒充release拒绝。引用接受M6a原指定组合及限制合理，没有重新认证设备或其他APK。
6. **资料/历史/保护**：独立检查14份当前资料200个本地链接/锚点，失败0；原状态归档SHA精确为 `5c3798f43ab7de7c5e4b7cda88fd51614852473234ad7e768dfb6d7826bb968d`，81个原二级章节及全部字节保持，历史原文相对路径的原docs语义在索引中说明。2259入场项及原件ZIP核对、22既有变化/2235范围外现存/两删除状态保持；16617历史项及1583证据索引相符。31目标退出原件/哈希及默认dry-run在统筹改文档前通过，实际仓库未apply。状态镜像、branch/HEAD/index/exclude保持。

## 环境来源与未覆盖的解释

JDK/Python/SDK/Robolectric、E:Gradle缓存、指定C:只读Maven产物、E:Android debug home均有明确输入；没有复制私有配置或签名材料。Git只读原元信息＋独立index也是演练输入，源码ZIP本身不冒充独立可构建的无Git环境。原Maven产物发布commit和Python可执行分发来源未建立，缓存复用不认证首次解析/认证或另一台机器。

统筹复查了[Gradle官方checksum表](https://gradle.org/release-checksums/)中的9.6.1-bin SHA，与仓库锁定值一致；同时核对[Robolectric配置说明](https://robolectric.org/configuring/)的offline/runtime-dir含义及[GitHub Gradle registry认证说明](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-gradle-registry)。这些网页支持前提说明，不能替代本轮未做的下载、空缓存解析或真实认证。

[Python 3.12.14官方公告](https://blog.python.org/2026/08/python-31214-31116-31021/)说明该安全维护版为source-only；公告存在不证明当前python.exe的原始Windows分发来源。开发文档已明确可执行来源未认证/只要求3.12；后续不把公告链接描述成已验证的一键Windows安装路径，不为此擅自升级运行时。

两个独立审计辅助初次失败来自复核器自身假设：归档字节相同但正则比较未统一CRLF，以及本轮证据索引相对run根、此前卡相对仓库根；修正读取/换行处理后通过，原log保留，未修改执行证据或降低原件SHA检查。

## 下一步与设备安排

下一[M7b v1](../tasks/M7b.md)合并有限兼容/来源核验、旧official静态标记最小修正、最终候选及安装前准备。**用户已明确有Android设备，但尚未安装当前候选**；没有据此取得签名/升级安装授权。可以先做全部不依赖设备安装的工作、给出具体包/身份/签名与数据保留方案，设备运行结论保持待装/待观察；旧安装结果不能算当前候选通过。

预计剩**1–2实质卡，含M7b**；签名安装和必要人工观察作为明确待授权/待输入步骤，不靠增加代码卡替代，也不在未验证时自动宣布首轮完成。当前冷启动/CI、硬件/设备性能、Maven发布来源、14语母语质量、真实服务/费用及原配置/缓存限制继续保留。

本统筹未改生产/应用测试/工具实现，未commit/tag、push/PR/发布、签名安装、清用户数据/真实缓存、付费API、共享缓存清理或reset/clean。
