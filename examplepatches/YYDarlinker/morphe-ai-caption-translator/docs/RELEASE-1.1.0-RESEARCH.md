# 1.1.0：字幕编辑研究、实现取舍与验证边界

## 版本基线

代码基线是 GitHub 实际 v1.0.8：`754e2eaf67fd254747944a1e4ebe896811c6a550`。在当前远端发布历史上恢复该版本的 extension 源码，再做本次改进；不改写发布历史、不覆盖旧 tag 或资产。评论区/横竖屏视频区域定位代码与 GitHub v1.0.8 保持一致。1.0.9 的诊断仅作为回归证据。

## 研究范围与证据等级

检索日：2026-09-14。查阅下列原作者/平台资料；视频来源按实际可读取内容区分，未把标题或简介冒充完整观看。

| 来源 | 实际读取范围 | 对本项目的启示 |
|---|---|---|
| [Amara 字幕社区：Create Quality Subtitles](https://blog.amara.org/2020/10/22/create-quality-subtitles-in-a-few-simple-steps/) | 全文与社区说明 | 语法单位不拆散；口语应传达意义而非逐词对应；结合情境和术语；读取负担因语言而异 |
| [TED Subtitling Tips](https://www.ted.com/participate/translate/subtitling-tips) | 全文 | 保护完整语言单位，区分双行排版与字幕事件，阅读速度是约束而非唯一目标 |
| [BBC Subtitle Guidelines](https://www.bbc.co.uk/accessibility/forproducts/guides/subtitles/) | 长句/短句、自然断点、时长、镜头章节 | 长句可跨多个事件；以从句和短语形成可理解单位；语言完整性优先于几何对称 |
| [Netflix General Requirements](https://partnerhelp.netflixstudios.com/hc/en-us/articles/215758617-Timed-Text-Style-Guide-General-Requirements) | 全文 | 事件时长和两行展示；不能在不合理的语法关系中断行 |
| [Netflix Timing Guidelines](https://partnerhelp.netflixstudios.com/hc/en-us/articles/360051554394-Timed-Text-Style-Guide-Subtitle-Timing-Guidelines) | 音频/镜头同步章节（同任务前阶段已读取） | 校时需要音频或镜头证据；离线作者可调整出入点，在线字幕不能伪造这类证据 |
| [StudioBinder 视频：Subtitles — The Ultimate Guide](https://www.youtube.com/watch?v=5Y3Em-IMSwM) | 作者完整讲解简介、章节目录；不是逐帧观看 | 兼顾语法单位、停留时间和编辑节奏；不要照搬社交短视频逐词闪烁效果 |
| [One Minute Premiere：Subtitle Edit 单行字幕教程](https://www.youtube.com/watch?v=rSwo9lv9_as) | 作者公开的操作讲解全文、章节目录 | “换行”“拆成两个事件”“合并行”是不同操作；一键按字符拆分不等同于自然翻译分句 |
| [IGDA GASIG / Ian Hamilton：How To Line-Break Subtitles](https://www.youtube.com/watch?v=MR7kDsoCJoY) | 作者简介和会议背景；未读到完整讲稿 | 作为断行专题检索线索，不将未读到的详细主张作为实现依据 |
| [Descript Captions](https://help.descript.com/visuals/captions) | 官方完整文档 | 字幕图层、说话人选择、样式是独立维度；多说话人分层需要已有说话人数据 |
| [Descript Wordbar](https://help.descript.com/script-editing/the-wordbar) | 官方完整文档 | 编辑者通过波形逐词修正时间；模型译文长度不能替代词时间 |
| [Descript Translate Captions](https://help.descript.com/repurpose/translate-captions) | 官方完整文档 | 翻译后仍需预览校对；自动同步和语义质量不能用一次导出替代验收 |

Reddit 与 Blackmagic 论坛检索受 403 限制；Adobe 社区搜索页能打开，但未返回可核验的具体帖子正文，未把它们算作已读证据。不同指南的字数/速度建议并不完全一致，因此不把某个阈值宣布成所有语种唯一标准。研究足以形成这版工程取舍，不等于已穷尽所有编辑实践。

## 统一原则

1. 翻译理解：通读源窗口与有限上下文，保留否定、比较、数量、术语和语气。阅读速度不足不能通过删事实解决。
2. 字幕事件：每次给出能理解的短语/从句；长论证分多个事件；短且紧密关联的因果可合并。省略号、口头停顿和 cue 边界不自动等于事件边界。
3. 事件内换行：只处理画面布局，不改变入点出点。
4. 时间：优先采用可靠的英语 ASR 原生词时间；无可靠匹配就降级并明确记录精度，不能按中文长度均摊。
5. 说话人/镜头：只采用已有可靠标记；不新增昂贵的音视频识别，也不从一个逗号猜换人。
6. 优先避免两种极端：把“那种／缓慢而稳定的改进”切碎，以及把多个独立观点塞进同一事件。模型负责语义，代码仅做可验证的保守合并。

## 指定频道与诊断

两个视频页面可访问，标题分别为 Glass is glass 和 Samsung Z Fold 8 (Wide) Impressions: Better Than I Thought!。公开字幕接口在本次环境返回空正文；未据此声称做过完整语音对照。用户截图和诊断显示：技术名词、比较/转折句、后置补充、口头犹豫和省略号集中出现，容易被机械句末判定和过细分段破坏。这是针对已给文本的分析，不是对整个频道的统计结论。

1.0.9 诊断中 unit=8 被分成 7 段，部分片段依赖后文；首屏有 before_first_unit，以及一次约 1.419 秒的 API 耗时。该片段没有原文回退事件，所以无法断言那次回退的实机原因。后续日志将明确记录 TRANSLATION_SOURCE_FALLBACK 的单元、次数和原因，并在开启文本调试时记录实际显示片段及其入点出点，不再只输出整窗口 canonical。

## 实现

- 从 1.0.8 恢复视频区域定位，保留其已有功能和测试。
- 单次翻译请求输出完整语义的事件；可选 attach_next 标注依赖后文的边界。本地只依据该语义标记，在间隔不超过 250ms、总长不超过 7s、展示负担受限且无显式换人时合并。没有标记不猜测；不添加第二轮分句请求。
- 禁用按短时长猜测意义的跨窗口合并；缓存保存最终锚定事件，重读不重新猜合并。
- 连续省略号保留为一个原子，不再被识别成若干句号。窗口不在残留连字符后优先切开。
- ASR 对齐以规范化词组而非原始标点原子匹配；移除整轨 70% 门槛。至少八个有证据的原子才应用；可靠局部可采用原生时间，间隙仅在有界相邻源锚之间估算。重复、不相关、非原生或非单调情况降级，保留文本。
- 首次当前请求限制为一个单元，不等待未来多单元译文；背景批量策略保留。可选 ASR 探测有 2.5s 等待预算，不进入原来可能长时间刷新的路径；这是可选探测预算，不是整个首屏耗时承诺。
- 读取同 Activity、同包媒体控制器状态。只有时间新鲜、与当前视频位置吻合才细化播放位置；旧视频、跳转不匹配、缓冲、无控制器时保留确认时间，暂停状态不外推。这不是保证 YouTube 所有构建都暴露该控制器。
- 已预算内的结构错误重试允许 whole_text_recovery，避免反复要求模型数失败的索引；不延长现有不完整译文索引。不增加重试额度，也不接受未经请求的无索引译文。
- 仍失败时保留明确标记的紧急原文，而不是伪造译文或悄悄让字幕消失。新增恢复/回退诊断。

## 成本与验证边界

不新增模型服务、不增加第二遍翻译/润色/分句，不增加三次失败上限；上下文、输出预算和预取视野沿用 1.0.8。输入停顿条目仍最多八条；可选语义标记只增加少量索引。首屏更小请求可能增加每段视频的固定请求开销，因此不承诺总账单一定下降。缓存版本变化会令旧翻译首次重算。

本地测试只使用合成时间数据、用户已提供的句子和假凭据的回环 HTTP。没有调用付费翻译端点，没有手机设备测试。功能和结构测试通过不代表所有语种的自然度、音画同步、首屏速度已经实机验收。

发布继续采用仓库的 Morphe changelog + semantic-release + Gradle MPP + 元数据验证 + main/dev 回并 + 资产核验流程。保留当前版本序列，由 feat 提交产生 1.1.0，不手工覆盖旧 Release。
