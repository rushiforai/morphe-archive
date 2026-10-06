# N7 自然度四案根因（prompt 修改前）

证据边界：源文、旧译来自 `ACCEPTANCE.md` 的冻结 v1.3.5 会话；当前可编辑 prompt 为 `RebuildProtocol.PROMPT`、`FIDELITY_PROMPT` 和 `DeepSeekConfig.DEFAULT_PROMPT`。冻结层保留历史输出，不能用后续 live 译文回填。四项字串报警只是回归防线，最终自然度由人工目检。

现行 prompt 已要求 “Read the complete source and read-only context before translating”, “Preserve all spoken meaning ... grammar and punctuation”, “Never summarize or add explanations”, “Keep modifier+noun, number+unit, verb+object and dependent phrases together”。`FIDELITY_PROMPT` 又要求 “Use context to translate the grammatical function of an owned fragment, not to import new facts”；默认偏好是“忠实、自然、简洁；优先符合目标语言的母语表达习惯；保留人名、专有名词、数字、语气和必要的标点；不要增加原文没有的解释。”这些通则没有明确要求以下四种具体的**通用推理动作**：按话题选多义词义、按话语功能转述口语感叹词、确定插入修饰语所辖谓词、把压缩/别扭术语译成无同义反复的自然目标语。

| 案例 | 源文与冻结输出 | 缺失的通用引导及成因 |
|---|---|---|
| A02 | `articles and indexes all of which confidently put russia in second` → “文章和索引，它们都信誓旦旦地把俄罗斯排在第二位” | 已要求读上下文，却未要求按话题解释多义名词；`indexes` 在排名语境里直取了技术义“索引”。 |
| A03 | `heck there are even a few that put russia in first` → “见鬼，甚至还有少数把俄罗斯排在第一位” | 已要求保留语气，却未要求先判断口语插入词的强调/惊讶功能，再用中文相称语气表达；字面咒骂突兀。 |
| A05 | `all i could really think looking at these even long before the invasion was what about china` → “真正想到的只有：甚至早在入侵之前，中国又如何呢？” | “Keep ... dependent phrases together”只约束相邻源词分组，未明确要求插入时间状语挂到其实际修饰的“我当时想到”，故错落到冒号后的疑问。 |
| A09 | `military strategy is built strategy` → “军事战略是构建出来的战略” | “Never ... add explanations”未说明如何处理源文的压缩/别扭概念；机械重复同一个抽象名词。须结合后文预算、工业、采购判断意思，但不得擅改源字幕或凭上下文新增事实。 |

拟只在 `FIDELITY_PROMPT` 末尾追加一处通用引导，要求多义词语境化、口语语气按功能转换、修饰语落到其所辖谓词，以及压缩概念避免同义反复；继续受源词归属、忠实、不引入新事实约束。禁止按四个句子制作词表替换。
