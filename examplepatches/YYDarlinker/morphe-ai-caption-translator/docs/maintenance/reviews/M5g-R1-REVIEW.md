# M5g-R1统筹复核：接受C1规定范围

2026-10-25（Asia/Shanghai）。结论：**接受M5g-R1补正01，M5g/C1的逐字段保存通知、草稿及运行作用域同步范围关闭**。当前接受的本地候选为1.5.8 / local-1.5.8-m5g-r1，公开仍1.5.7。C2–C5、硬件/真实落盘、设备、其他组合和远端CI不因此关闭。

原[M5g结果](../results/M5g-RESULT.md)、[需补正复核](M5g-REVIEW.md)、[补正结果](../results/M5g-R1-RESULT.md)与证据保留。独立复核证据 `validation/runs/20261025-M5g-R1-coordinator-review/`；本轮只读审查/针对性测试及更新维护文档，未改生产、原测试或验证工具。

## 接受的实现与行为

- `flushCurrent/flushExceptKey`在flushing清理后，只要本次有已提交字段就通知一次，成功返回也同步运行配置；无变化/全部拒绝不刷新，跳过key不保存草稿或删除原密文。
- `select`用本次FlushResult的accepted/changed事实，暂缓成功flush的中间通知，在新active写入并重绑后统一发送一次最终通知；本次已保存字段遇后续切换写入或重绑异常仍通知。不新增线程、全局临时事务或持锁高层回调。
- 保存事实与通知失败分开：原Editor/切换异常保持主异常，通知异常作为suppressed；仅通知异常直接传播，flushing已经清理。现有其他C5字段saved/recreate风险仍另列。
- 真URL/key失败草稿、origin/原密文、其他profile/global、自动保存和迟到编辑/确认目标保持。成功字段继续生效，不承诺整表单回滚、跨store原子性或fsync。

## 独立验证

1. **红绿原件有效。** 原m5g生产源码与red-inputs.zip及入场ZIP一致；red-02实际执行3项，均因URL已保存而刷新期望1实际0失败，0 errors/skipped，有原始XML/log/receipt。最终取消确认方法体保持；另外两个只在原应有断言之后追加重复无改动flush检查，原红测断言与前置保护未放松。无效首次缺receipt调用和误复制旧XML明确排除。
2. **独立重跑十类86项全部通过**，实际执行，0 failures/errors/skipped，见targeted-evidence.json及归档XML。直接flush、skipKey、取消确认、testApi缺credential提前返回、成功切换新active唯一通知、原异常/通知异常、草稿及真实GCM正常/故障保护均在其中。
3. **真实应用层已补齐。** 两条测试安装真实CaptionApplication到CaptionActions/TranslationRuntime，真实命令到RebuildController.refresh/stop/activate。先植入真实ready Session/Job及positionGuard并验证其有效；URL成功key失败、成功直接flush后，产生绑定新URL、空key、ready=false/terminal的新Session，旧publication关闭、Job无法开始新attempt、旧RenderGuard失效。重复无变化flush不换Session、不多通知。显示/原生扫描是设备替身，旧scope起点人工植入，没有声称完整播放器启动、已发送旧HTTP回复或硬件认证。
4. **完整820项可追溯。** 105份XML逐份SHA-256及receipt核对，core320+extension500，两组实际执行、失败/错误/跳过0。当前manifest与完整入口前后相同，指纹 `e5333b6691507e660182fd4c718243be85ac0e23deda2f9cf3066e17b2b957d0`；工程变化只有ApiProfiles、build ID、两旧测试及一新测试。原M5g28+1方法正文保持，生产仅ApiProfiles逻辑变化。
5. **同次编译归档有效。** 551个类逐项哈希、ZIP/receipt/源码指纹相符；81个core类与接受的先前内容一致。binding于06:54:31 UTC完成，后续组合Gradle日志06:54:52开始；完整入口及前两次归档辅助失败保留，没有中间Gradle替换结果。统筹从本ZIP提取core，重新检查来源、compiled/UI/包边界和明确MPP/MPE，通过。没有重复820项或相同组合构建。
6. **候选身份有效。** MPP `8a8ec9e90c96b24d03b54d767ce9006177a1a13b23d93acf43ed0cd24d88fc1f`，587567 B；独立/内嵌MPE `40d3bdd83dad0766b4c5e7247e664fb6834d6f192a4c1e126c0f12996f988c5b`；UI APK `e046756f0986a7fe4f144656c1e71c75e15d4b555232c88304e546d055938d28`。本地候选冒充release、旧m5g冒充r1实际分别拒绝于期望身份缺失，非缺文件拒绝。
7. **真实组合保护。** 指定原始YouTube/官方MPP/Patcher哈希、104默认根及组合/资源/现有DEX审计退出0核对，64566类。APK `e7960256c45cee45d036dc37358f5787aff640ad9a69bb78c47805cee22e525a`，对冻结M5g仅classes13.dex变化，其他18390条目相同，MPP仅manifest/内嵌MPE变化。统筹重新编译已审阅的只读canonical DEX工具并检查该DEX：520→521类，仅新增ApiProfiles$FlushResult，无删除；逻辑变化仅ApiProfiles，CaptionDiagnostics/extension.BuildConfig仅build ID字符串不同。其余517类同内容，Hook及资源保持。

## 保护、回退与历史缺口

独立核对2234项入场清单/ZIP、12目标退出ZIP/哈希；11个入场已存在文件变化，另新增应用测试和结果报告，范围外2223项保持。6376项本卡有限历史保护、另外2754项已接受历史清单及269个封存索引条目全部匹配，六前端保持。159生产中仅ApiProfiles改变，其他158个原字节保持；索引、分支、HEAD及已有删除状态不变。

回退脚本已逐行审查：默认只读、先全体核验ZIP/退出哈希/路径再写入，状态镜像同一计划；统筹在更新文档前实际运行默认dry-run，12文件匹配。原隔离演练的拒绝零写入及精确恢复记录与清单相符。统筹没有在实际仓库执行恢复。**本复核更新维护文档后，原脚本因后续修改拒绝覆盖是预期保护**，不能将原dry-run误称永久随时通过。

原M5g缺失的红测原件、错误HEAD diff、未找到同次compiled和不完整文档入场字节仍如实披露；有来源七文件重建与本补正原件分开。接受本次可验证修复及当前回退，不倒填早期历史证据。

统筹辅助审计最初误要求红测/最终方法全文相同，复查diff后确认只追加重复保存断言，未削弱原断言；记录保留。首次canonical工具编译提取classpath下标错误，0类审计；修正按`-cp`参数定位后独立编译/检查通过，原失败不算产品故障。未放宽生产检查或修改实现。

## 下一步与任务规模调整

用户授权评估扩大单卡工作量。当前构建/产物绑定、状态和故障合同已稳定，继续按单个分支拆分会重复基线保存、构建及交接。后续改为**同一职责的一组问题，在一张卡中调查、实现必要修复、补回归并统一交付**，每卡仍是可单独复核和回退的结果；跨职责或需危险迁移的内容继续分开。

下一[M5h v1](../tasks/M5h.md)合并配置坏数据的可读错误/安全恢复（C3）、真实编辑重建/后置通知保护（C5）及C2/C4实际可达性分级；已复现且符合本卡保护规则的局部缺口直接修复，不再每个方法单发卡。跨store/密文迁移、自动清除及真实落盘认证仍排除。

按扩大后的自然分组，首轮**预计还5–8张实质卡，含M5h，补正和外部等待另计**：配置收尾1、缓存1–2、诊断/性能1–2、环境/手册/有限兼容2–3。若配置发现需独立设计的高影响问题，先记录真实影响并重新估算，不能为卡数强行关闭。原7–11估计是较细交接粒度，变化主要来自合并交付，不代表剩余工程工作自动消失。

设备/硬件Keystore、真实落盘/进程重启、远端CI、其他组合、真实服务/费用及任意线程交错未认证。未commit/tag、推送/PR/发布、签名安装、清用户数据、真实付费调用、清共享缓存或reset/clean。
