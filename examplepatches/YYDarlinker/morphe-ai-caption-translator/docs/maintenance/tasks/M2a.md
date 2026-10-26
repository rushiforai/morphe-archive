# M2a — 清理已退役字幕回环服务及专用网络配置

任务卡 v1；下发日期 2026-10-24。前置任务 M1a 已经统筹接受，详见 `docs/maintenance/reviews/M1a-REVIEW.md`。本卡仅执行 M2 中这一批，不自动进入其他清理或 M3 重构。

## 1. 目标与基线

在保留 N75 当前字幕行为的前提下，移除已经退出生产调用链的本地 HTTP 字幕服务器、仅为它添加的网络配置和相应死代码/误导注释，并让测试与实际实现相符。结果应证明旧服务已经离开新包，而原生请求、CC/语言权威、源字幕和 AI 关闭后的恢复行为没有被破坏。

唯一活动仓库为 `E:\Projects\DeepSeek morphe-ai-caption-translator`。复用当前工作树和分支；保留所有此前已存在的未提交/未跟踪改动。实际进入时读取 AGENTS、PROJECT-STATE 当前身份和最新维护条目、维护入口、本卡、路线约束及 M2。不要重置为 HEAD 或另建工作区。

工程基线是 M1a 已接受的当前工作树。已冻结的候选为 `build/maintenance/M1a/20261024-M1a-candidate-03/patches-1.5.8.mpp`，SHA-256 `253b28f9d86bd766667f6005ee166bf08db95c71fbc73bd9e3d5752626322b3c`。公开版仍为 1.5.7；历史 N75 交付仍保留。入场重新核对，不把旧测试结果算成本卡执行。

## 2. 已发现的具体对象（需先确认调用关系）

- `infrastructure/src/main/java/app/yydarlinker/deepseekcaptions/LoopbackCaptionServer.java`：当前只有类内部自引用，没有已发现的生产调用。
- `patches/src/main/kotlin/app/yydarlinker/patches/deepseekcaptions/CaptionSettingsPatch.kt`：`allowLoopbackTraffic()`、专用常量/生成资源以及 execute 中的调用仍会修改网络配置。
- `application-host/src/main/java/app/yydarlinker/deepseekcaptions/DeepSeekCaptionHookV2.java`：`concreteAiUrl()`、`loopbackTarget()` 及相关 imports 疑为未调用的旧兼容代码；确认完全未使用后才移除。
- `AiCaptionTranslatorPatch.kt`、`DeepSeekCaptionHookV2.java`、设置补丁中的注释仍描述通过本地服务替换字幕请求，应改为当前真实行为。
- `extensions/extension/src/test/java/app/yydarlinker/deepseekcaptions/CaptionStartupOrderTest.java` 的两项测试直接启动旧服务器，验证的是退役服务，不能当作现行字幕链路测试继续保留。

搜索需覆盖当前生产源码、现有测试、构建/资源和受保护入口。历史快照、旧报告、旧交付中的名字是证据，不要求从整个仓库消失。

## 3. 允许修改和必须保留

允许删除确认无调用的服务器及旧 private helper、删去只为服务存在的网络配置生成、清理随之失去用途的 import/常量，并修正紧邻的误导注释。设置页内容和插入方式保持原有功能；不借清理重做设置系统。

`DeepSeekCaptionHookV2.rewriteUrl` 的公开签名、对实际 Hook 的委托和现有 `forceNativeRendererScan()/kick()` 行为不属于旧服务器死代码，不能因注释陈旧而删除或重写。原生数据保留与 draw mask 机制、N74 性能/视口和 N75 就绪协调保持不变。

现行有明确依据的调用契约保留：正常源/译文 timed-text URL 不被改写成本地地址；原生选轨和 CC 为权威；AI OFF、CC OFF、预取/后台/旧视频请求不能重启不被允许的会话。不要改 API 提示词、分页、调度、缓存、profile、Cookie 策略、网络提供方或用户外观设置。

本卡可只将 `gradle.properties` 的 `captionBuildId` 更新为 `local-1.5.8-m2a`，使新候选区别于 N75；产品版本仍为 1.5.8，公开元数据/README 发布表不改。如已有更新身份，按真实状态解释，不擅自回写旧值。

M1a 验证工具和发布链保留，不为让本卡通过而放松包/来源/ABI/凭据校验。发现工具实质问题先记录并独立判断影响；只能做使本卡必要验证可运行的最小修正，并在回报中单列，不能顺带重构工具。

不全局收紧 R8 keep、不升级依赖/Patcher/SDK、不大规模移动模块/包名、不删除历史脚本或 recovered。源码来源/提示词和受保护 ABI 不应需要改变；若检查指出真实变化，先定位，不能重算期望值掩盖它。

## 4. 网络资源的验收重点

停止由本插件为已退役服务添加专用 `deepseek_caption_network_security` 及回环明文例外。必须保留原 APK 或其他选中补丁的网络安全配置、证书锚、明文规则和其他 manifest 属性；不得用自制完整模板覆盖或删掉整份配置。

“整个最终 APK 不含 127.0.0.1”不是正确判据：如果输入或其他补丁原本就有相关规则，需保留。应证明本插件不再新增为旧字幕服务设置的例外。若旧 helper 同时影响非回环网络策略，明确拆分原始策略与本插件增量，说明前后行为；不借任务重新设计全局 HTTP/HTTPS 策略。

至少用有意义的资源处理验证覆盖：输入无 networkSecurityConfig；输入已有自定义配置；输入/其他补丁已有回环规则。验证实际资源处理结果及其他设置资源，不仅 grep 源码字符串。选择现有测试/patcher 能力实现，不为此新增大型框架。

## 5. 测试退役与回归

允许退役 `CaptionStartupOrderTest` 中仅验证旧服务器的两项测试，原件保存在本批入场证据和已有基线中。说明它们为何已不对应现行产品；不将旧文件简单改名后宣称覆盖新链路，不保留仅为让这些测试编译而存在的生产服务器。

复用当前 NativeOnlyCaptionTest、NativeLanguageAuthorityTest、ReintegratedApplicationTest 等真实调用链的有效覆盖；先映射现有断言，只有缺口才补充针对性回归。重点证明 URL 保留、关闭后原生可恢复、预取/旧视频不夺取选轨、原文模式不新增翻译请求。通过实际应用端口与合适的模拟源/翻译服务观察结果，避免只做返回值形式测试。

699 是入场基线，删除退役测试后总数可以合理减少。按模块报告本轮真实 tests/failures/errors/skipped，并说明“退役几项、增加几项”；其他有效行为测试和黄金断言不得为了过关而删改或降低判据。

## 6. 本轮验证与交付

1. 保存入场状态、准备修改的原件、生产/测试清单及历史交付哈希；对本批变化与先前修改分别记录。无需再复制整个历史仓库。
2. 完成调用关系确认和受控清理，补足资源级验证及必要回归；检查最终差异仅在允许范围。
3. 复用已接受的 `.devenv/verify-full.cmd` / `tools/verify_current.py` 运行当前源码、两组测试、来源/compiled 边界和独占候选检查；常规验证默认不调用付费模型。独占 run ID 与目录不可覆盖旧候选。工具仍以 `build/maintenance/M1a/<run-id>/` 为当前候选布局，不能为了目录名含 M1a 就改造工具；在结果注明真实任务 ID M2a 与实际输出路径。
4. 独立检查新 MPE/DEX 中旧服务器类和已确认退役 helper 不再存在；只做源码搜索不算包内验收。保护所有历史交付及 M1a 候选的原哈希。
5. 由于本卡改变补丁的资源处理，应在本地有经确认的原始 APK / 官方 MPP / Patcher 输入时，至少选择一组明确输入完成真实 patcher 组合及相关 DEX/资源核查。记录版本、哈希、选择集和层级；需要前后比较时使用冻结的 M1a 包，不回改工作树来重建旧包。旧报告只用于定位输入，不能盲目执行历史脚本或把已打补丁 APK 当原始输入。
6. 若没有合适输入，先完成其余工作并明确缺少什么；真实组合这一项标为未覆盖，交付“工程部分完成、待组合复核”，不声称本卡全部验收。不要自行下载/分发专有 APK 或用设备安装代替缺失输入。

组合输入和临时产物都在 E: 上处理，路径遵循 AGENTS。真实 APK 组合不等于设备运行；本卡不要求安装、签名、手机数据操作、远端 CI、真实模型或正式发布。

## 7. 回报与接受条件

详细结果写 `docs/maintenance/results/M2a-RESULT.md`，日志与机器可读证据写本轮独占 `validation/runs/<date>-M2a-<run-id>/`。沿用维护入口的最终摘要格式，将任务 ID 换为 M2a。

除通用字段外，明确列出删除对象及无生产调用的依据、资源策略前后差异、测试退役/新增明细、新候选版本/build ID/哈希和包内退役证明、真实组合输入与结果。回退采用入场原字节及本批差异，不能硬重置或覆盖后来的新工作。

更新项目状态及字节相同镜像、维护入口的执行状态；统筹状态保持待复核，不自行接受或进入 M2b/M3。不创建 commit/tag，不推送、开 PR、发布或改变订阅元数据。

统筹接受要求：退役对象确实退出当前生产包；专用资源修改停止且原/其他补丁策略保留；当前字幕行为回归与新候选验证通过；所要求的资源处理和至少一组真实组合有证据；历史产物不变；报告解释测试数量变化和所有未覆盖项。
