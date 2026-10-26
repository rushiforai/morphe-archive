# M5g — 部分字段保存后同步实际配置，保留失败草稿

任务卡v1；2026-10-25下发。前置[M5f复核](../reviews/M5f-REVIEW.md)接受调查，未接受C1–C5为已修复。本卡只关闭C1中“失败flush已经部分保存、运行配置却未同步”的缺口，并明确现有逐字段自动保存语义；不实现跨store事务或数据迁移。

## 1. 已复现与产品决定

M5f的真实编辑链：URL字段先保存成功，key字段因受控Keystore拒绝而失败，ApiProfiles.select返回false，active保持原profile，URL却已改变；原密文保留但origin不匹配，故恢复Keystore后仍不能用于新URL。模型通知已发生，全局配置refresh为0。两个字段逐个自动保存，不能把切换失败等同整表单回滚。

本卡采用与现有自动保存方式一致的明确决定：

- **成功字段保持生效，失败字段保留可纠正的草稿，切换失败时active不变。** 不把已经成功自动保存的字段倒回去，不对整个表单虚构原子回滚。
- 只要本次flush中有实际成功字段，即使后续字段拒绝/抛出，当前运行配置也必须收到与已保存值一致的刷新/失效通知。新URL没有匹配key时按现有ready/origin规则停止新的模型请求，不能继续因未通知沿用旧Session。
- 单个字段成功、失败和切换拒绝的反馈准确表达各自结果；拒绝不能被描述成“本次所有字段均未保存”。失败草稿不因这次配置刷新被清空、重建到另一profile或误标已保存；恢复依赖后可以重试。
- URL变更触发origin拒绝是现有保护，保持。不是自动把旧key重新绑定到新host，也不自动删密文/选别的profile。原key可用于原origin、其他profile继续可用。

上面是在逐字段自动保存模型下对C1的明确收敛，不承诺apply真实落盘完成，不解决C2/C4代理底层部分写入、C3坏数据恢复或C5全部重建草稿路径。若新测试证明C1依赖某个相邻缺陷，限定记录并解释，不扩为整个持久化重写。

## 2. 基线、允许范围与保护

唯一仓库 `E:\Projects\DeepSeek morphe-ai-caption-translator`，读AGENTS、当前PROJECT-STATE/维护入口、M5f REVIEW、本卡、配置/凭据合同、状态/网络合同相关部分。复用现有分支和脏工作树，按入场字节比较而非HEAD。

入场 `1.5.8 / local-1.5.8-m5d-r1`，801项；冻结MPP `build/maintenance/M1a/20261025-M5f-candidate-01/patches-1.5.8.mpp`，SHA-256 `5ad37d9ffcdce377898f25f72d8af6badf8e9c4302e5512c661719a59bf132b8`，MPE `0882cf9c0f97632dcca035cc68d9fee476b412dd1d823e831581b3ebf4d7518e`。公开1.5.7。

生产主要范围：ApiProfiles的flush/select与ProfileEditorPreference成功提交/失败草稿通知边界；确需时最小调整DeepSeekTextPreference/ApiProfilesPreference及直接调用flushCurrent/flushExceptKey的入口。优先简短、可读的内部结果/通知归属机制，不新增通用事务、事件总线或存储框架。

要求区分“字段已保存”“编辑验证拒绝”“保存抛出”“后续通知抛出”的事实，避免把整个后置通知catch当成数据一定未变的证据。C4代理after/drop的可靠落盘问题另留；本卡不能靠删除旧故障刻画或改成宽泛成功让其消失。

- 每次flush/操作正确结束flushing及临时通知状态，异常路径也不泄漏至下一次。真实改变只刷新需要的作用域，全部拒绝/无改动不凭空启动模型或重建会话。正常成功切换仍以新active一致配置完成，尽量合并中间刷新，不制造每字段一次引擎启动。
- 配置刷新不等于profile切换。不得用会提高revision、清空/使其余字段失效的全量profileChanged来处理同profile部分失败，除非有完整草稿保护证据；失败key仍绑定原profile。
- 检查flushCurrent/flushExceptKey的各调用者：切换、动作按钮、明确清key前flush等。不能只修select而其他消费flush的入口仍压掉已保存变更通知；明确清除目标ID及迟到确认原保护保持。
- 不持ApiProfiles.LOCK做网络/等待/高层回调；保持不可变请求配置、F1/F2/F4、Publication、origin和F3缓存身份。
- 凭据保存格式/Keystore alias/配置键/默认值/ProviderEndpoint兼容不变；无新用户开关。若必须新增或改产品文案，说明必要性、完整14语言键覆盖及真实UI断言；优先复用已有准确字段saved/retained与未完成编辑提示，不为实现细节加用户流程。
- build ID改为 `local-1.5.8-m5g`，version1.5.8、公开1.5.7保持。core生产不在预期范围，不改来源哈希或字面量守卫；工具/CI/依赖/SDK/R8/Patcher不改。

## 3. 红绿及实质回归

先在m5f生产原件上，以应有行为断言复现：真实URL/key编辑flush后key拒绝，已保存URL的配置刷新缺失。保存源码/请求身份/偏好快照/通知/草稿/XML，明确红测针对未同步行为，而不是把已有自动保存成功URL当作应回滚失败。

修复后至少覆盖：

1. 真实字段链URL成功/key失败，select=false、active不变，endpoint新值保留、密文原字节和origin保护不变；失败key草稿/错误及成功URL反馈准确，实际配置刷新发生并读取一致的新配置。恢复Keystore后重试可保存draft并切换到目标profile，无跨profile写。
2. 刷新不能只测mock计数：至少一条通过真实CaptionActions/应用配置更新边界的验证，观察旧请求作用域撤销或运行ready变更为当前真实配置；测试可替换网络/设备端口，注明层级。所有连接仅fixture/明确拒绝，无真实模型/外部发现。
3. 部分成功后某Editor抛出与返回false两条路径都结束flushing并同步已经保存变更，未成功字段仍可重试；不修改调用者原异常/拒绝语义来假装成功。全部拒绝或无改动为不必要刷新/请求0。
4. 正常成功切换保持新profile快照/一次最终通知，独立自动保存保持及时刷新；flushExceptKey及直接flushCurrent调用按实际已保存状态同步，跳过key的逻辑不偷偷保存/清除key。
5. 迟到编辑不能写新profile、失败草稿不因同profile刷新丢失、其他profile/global不改；现有ApiProfiles/UI/Snapshot/真实GCM和M5e时序测试继续有效。C2/C3/C4/C5未处理的观察保持明确。

允许更新M5f C1刻画测试中与本卡明确新通知语义冲突的断言/命名，保留endpoint/原密文/active/草稿/origin和恢复等实质断言，记录旧→新映射。其余21项及其他旧断言非直接冲突保持；原合同的历史调查、M5f结果/封存证据不改写。

仅fixture凭据/偏好，底层Keystore可复用M5f测试provider，真实Cipher与编辑链保留。未知连接拒绝，线程/队列/静态状态可靠清理，少量顺序/重复检查，无sleep碰碰运气。

## 4. 完整验证及交付

保存入场原件、批次diff、六前端及有限历史保护；工作/临时/构建/证据全在E:。固定源码/测试/必要文档后运行已接受verify-full入口，Offline/RerunTests，1.5.8 / local-1.5.8-m5g，新独占RunId；归档本轮XML/receipt/同次compiled、候选/明确独立MPE/UI及负向身份拒绝。

生产变化后需同一原始21.41.525-SECONDARY/官方1.48.0/Patcher2.0.0/104默认根+AI真实组合/资源重编译和既有DEX审计。核对输入/选择/新旧APK及Hook/其他资源差异，只允许解释清楚的变化；不以单测替代组合，不覆盖历史包。

结果 `docs/maintenance/results/M5g-RESULT.md`；证据独占 `validation/runs/<date>-M5g-<unique>/`。说明采用逐字段自动保存、部分失败后通知/草稿/运行作用域、红绿/真实编辑与应用验证、完整验证/组合、候选、保护/未覆盖及退出哈希逐文件回退。C1关闭范围与C2–C5待处理分别写明，不能泛称配置存储已完全安全。

更新当前合同、维护入口/路线/PROJECT-STATE及字节相同镜像，执行完成待复核、统筹待复核。原调查/旧结果/候选/证据保留。不commit/tag、推送/PR/发布、签名安装/清用户数据、真实付费API/共享缓存清理/reset/clean；不进入下一卡。
