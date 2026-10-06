# N13：难块模型升级建议（不实施）

**触发原因。** 在不修改提示文本、源词、review 安全网及缓存的前提下，两个 live block-17 repair 重放仍将“外资／增长”错当成“降低”的主语；生产解析器都可解析，但两个候选都存在 `possible_subject_attachment`，故正确译文可上屏的判据未达成。先保持原文兜底，不把“无风险”理解成自动语义正确。

**实测成本（N13 增量，仅一个难块，不外推为全片均价）。** `b17_1219_1299` 调用 #1：输入 2,295＋输出 367＝**2,662 token**；调用 #2：输入 2,295＋输出 362＝**2,657 token**；每次难块 repair 平均 **2,659.5 token**，两次总 **5,319 token**，提供方回报 usage；2/4 次。冻结初译／整段 N9 账本不混入。详见 `scoreboard/results/n13-live-ledger-20260929.json` 和关联原始本地存档。升级模型成本及单价**没有实测数据**，不得将这两次旧模型用量当成新模型价格或准确率预测。

**后续方案，须用户另行确认后执行：**
1. 仅对穷尽确定性修复、仍有硬语义风险的单块考虑更强语义模型；先单块、保留原源词与 prompt / review / 原文兜底、限制 API 尝试次数和 token，确保不把同一纠错失败扩散到 127 块。候选型号、供应商价格与输出预算均未确定，不做购买／切换决定。
2. 配置项逐一列账：`DeepSeekConfig.Snapshot` 的 `baseUrl`、`model`、`apiKey`、`prompt` / 目标语言；`RebuildApi.prompt` 和 `ProviderRequestPolicy.request` 的实际系统消息、JSON schema/response format、模型特定的 thinking 开关、`max_tokens` / `max_completion_tokens`、16s 预取/10s 前台时限（`RebuildApi.java:41–83`）；`RebuildCache` 的模型/endpoint/prompt/fingerprint 与协议版本 key 隔离（N12，不改本卡）；`TokenCostAudit` 按请求分别记录输入、输出、总 token、延迟与失败。密钥不得写入存档，升级前需确认兼容协议和缓存隔离。
3. 同一冻结源词仅块 17 离线 A/B：新模型必须通过生产 `parseBound` 的源覆盖、review 风险数为 0，且人工核对“邓小平降低了……份额”为动作主体；比较实际 token、时延与原文兜底次数，不能以评分数单独替代语义裁决。A14 验收行如提议修改，只能标“待用户确认”；未获同意不扩大上线。

**状态：建议档；本卡未切换模型、未修改模型设置或提示、未额外请求新模型。**
