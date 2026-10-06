# N28B 规则适用范围

当前请求政策版本 `n28b-policy-v1`。唯一依据是当前绑定源请求中唯一有效的 `lang` 与入口已确认的 target；UI locale、正文 Latin/Han 脚本、相邻轨道都不能建立源语言。重复/非法/und/缺失 lang 为 UNKNOWN。本卡不增加取轨、native 推断或 ASR 修正。上下文由 Session 在决策前绑定，Job、prompt、payload、parse、Review、cache 读写与 repair 候选比较显式接收同一对象。

`legacy_en_zh`：明确 primary=en（包括地区/脚本码），且确认目标档案为 Hans/Hant。保留 N28A 的 PROMPT/FIDELITY、默认偏好表达、request schema/display_hint、英文 blocks、旧 cache key。generic zh、其他中文源、其他 Latin 源、Japanese 纯 Han 文本均不能进入此语义通道。所有中文目标的分页/绘制基线另为 `presentation_policy=legacy_n26`；它与语义 scope 是两件事。

| 调用点/规则 | 分类 | N28B 条件与结果 |
|---|---|---|
| Planner owned token、硬资源上限、时间证据 | 结构通用 | 源 word/token/time 生成未改；保留容量上限 |
| Planner punctuation、silence、显式 speaker boundary | 结构通用 | 所有语言保留；中立 soft seam 只用这些证据和既有 cue 边界 |
| Planner dependentEnding、protectedCut、resourceScore 冠词/介词/短语/finite verb hints | 源语英语 | 只给明确 English source；英文请求 blocks 与旧提示保留。其他源不因 `in`、`or` 等同形词被保护 |
| Protocol JSON 对象、schema 类型、block/整数 ID、完全有序覆盖 | 结构通用 | 中立缺口、重复、逆序直接拒绝；兼容通道保留旧 exactQuoteRebind（精确完整 source partition），没有模糊匹配 |
| Protocol exact source quote、owned start/end、时间有序、silence/speaker 越界 | 结构通用 | 所有 pair 硬约束；不从 context 导入内容；非语音空 text 例外保留 |
| Protocol protocol_leak、empty_translation、quote_required | 结构通用 | 所有 pair 保留 |
| Protocol paragraph 的 CJK/Latin 长度、句数、600字符拒绝 | 英→中文兼容 / 呈现可读性 | 兼容通道保持旧行为；中立只记录参考 CPL 观察（非真实字宽预算），不触发付费 repair |
| Protocol information_collapse、strongDependentEnding | 英→中文 | 依赖 source word 数/English 列表的旧拒绝仅兼容通道 |
| Review compression、negative conclusion、reach/place omission | 英→中文 | 原词表/阈值保留，仅明确 scope；不是一般多语种 omission 检查器 |
| Review not always、product of、would follow/reduced、open complement、comparison | 英→中文 | 原规则保留，不恢复 N23 已回退例句、不扩词表 |
| Review fragmentary/micro event、dense event、fragmented_plan | 英→中文 / 不确定观察 | word/Han 阈值仅兼容通道；watch 保持 advisory |
| Review licensed/unlicensed、tank fleet | 英→中文 | 原语义修复只在兼容通道 |
| Review protectedCut dependent_boundary 自动修复 | 英→中文 | 其他明确 English 源仅 payload 词法提示，不以英文目标语法硬拒/自动修复 |
| Review source_number_ambiguity | 不确定观察 | 保留原始 ASCII 相邻 ASR 数字观察；不改源证据。possible_number_loss/range repair 只兼容通道 |
| Review anchor_unknown 中文 equipment 词表 | 英→中文 / 不确定观察 | 只兼容通道；词表未覆盖是 UNKNOWN，不定义 CONTRADICTED |
| Review LayoutBudget.canPresent | 呈现可读性 | 旧中文兼容行为保留；中立记 readability_observation、repair=false，仍用旧 renderer |
| Review repair prefer / flagged subject | 英→中文 | 同 Session/Job scope 比较；中立不启用英语 subject attachment 规则 |
| Semantics equipment aliases、SAM、tank model 归类 | 英→中文 | 只兼容通道；必须正面识别其他归属概念才能 CONTRADICTED |
| Semantics ASCII literal hyphen model ID 跨事件转移 | 结构通用 | 中立仅源中明确出现的 ASCII ID 完整字面锚点；不做译名/space/model 等价猜测 |
| Semantics adjacent numbers → range | 英→中文 | 旧 English range 条件及中文范围词不推广到其他 pair |
| Numbers English 月份 / Chinese 日期、ASCII decimal/grouping、数量级豁免 | 英→中文 | 原 safe() 不变，旧黄金行为保留；safe 不代表全部语义已证明 |
| Numbers Unicode Nd 整数数值 | 结构通用（高置信度窄域） | 两端完整文本都是十进制整数时比较数值，12/١٢/१२ 等值；12→13 CONTRADICTED，允许前导0 |
| Numbers localized 日期、逗号小数、范围、多数字、单位/货币/数量级/书写数字 | 不确定观察 | 中立 UNKNOWN；不因旧英语/中文词表拒绝；不把 UNKNOWN 计为验证成功 |

中立模板明列完整命题、否定/条件/型号/数值、精确 quote/ID/归属/schema，不附旧中英例句或领域字典、CJK/Latin 长度建议。只有明确 English 源附通用依存提醒。目标完整地区/脚本 code 保留。程序默认偏好以 load 的存储来源识别并转为固定中立含义，旧构造器来源不明保守按自填；保存/显示/UI 资源/Keystore 不改。

无上下文 helper 标为固定英中 legacy 兼容入口，供历史 fixture/明确 legacy 测试。所有生产网络、缓存和 repair 调用都走 context-aware 入口；API 设置测试明确绑定人工 English→Hans fixture。

新 reference CPS/CPL/7000ms 不控制分页，N28C 才接入真实字体和方向。中立长字幕可能仍被旧 8CPS 呈现基线留空，本卡不声称已修复。
