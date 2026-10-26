# M5i统筹复核：接受本轮缓存规定范围

2026-10-25（Asia/Shanghai）。**接受M5i v1的损坏读取、故障恢复、三项替换修复、put后epoch和Publication规定范围及披露限制，缓存组本轮有界收尾。** 当前接受本地1.5.8 / local-1.5.8-m5i / candidate-01，公开1.5.7。原[结果](../results/M5i-RESULT.md)、[任务卡](../tasks/M5i.md)及全部历史证据保留。独立证据 `validation/runs/20261025-M5i-coordinator-review/`。

## 实现与故障边界

生产仅SourceCaptionCache逻辑变化及build ID；RebuildCache/Controller/core来源、身份/格式/目录版本/TTL/配额、资源/UI/依赖不变。三个真实fixture IO问题都有有效基线红测：缺temp不应删除合法目标，type发布失败不应先改变body，body发布失败应恢复旧type。红测源码与入场生产一致，source-red02实际8项/3失败；修后原断言转绿，随后仅补必要并发检查。

Files.move使用同目录ATOMIC_MOVE/REPLACE_EXISTING，失败不先删目标；持原提交锁先保存旧type并换type、最后发布body，body失败恢复原type，无旧type则撤回新type。get/remove也取同一锁，进程内读取不会在该提交临界区中取得半套pair。缓存写失败不把已经成功解析的网络结果变为加载失败，其他键保持；更弱native timing不覆盖旧缓存的规则原样。

双重IO失败时尝试本键失效、保留主异常/suppressed，不保证永久权限故障下删除一定成功；不支持ATOMIC_MOVE时放弃该次缓存写。没有引入跨文件崩溃事务或迁移，增加锁并不等于跨进程/断电原子性。

## 独立核验

- **实际重跑160项全部通过**：core六类72项、extension九类88项，两轮顺序执行并分别归档XML/receipt。覆盖本轮18项及Publication/F1/F2/F4/F3、源HTTP/共享flight/实际应用、M5h配置相邻保护。18项独立运行仍为source GET=9、provider POST=2、audit attempt=2；这只是新缓存用例的合计，不是完整861项的网络总数。
- **完整861项与当前输入对应**：110份XML逐项SHA及receipt确认core328+extension533，两组实际执行，失败/错误/跳过0。当前工程等于验证前后manifest，指纹 `9439ef3e8c329b860c374bd76fe5e2cc84e1c5814fb7702d2b1b9ffe7d750b12`。555同次类ZIP/逐类哈希/receipt/指纹核验，81 core类与接受M5h相同，归档在下一Gradle前。原843项测试文件保持，无core生产/来源变化。
- **实际链路有效**：源测试走真实缓存、RawCaptionSource、CaptionDocument和本地HTTP，非整个TrackFetcher假返回；坏条目各1 GET恢复，再入命中不增GET。译文测试走真实Controller.restore/schedule、RebuildApi、本地POST、Plan/render，命中0 POST、坏条目1 POST成功、401仅1 POST/terminal且不显示原文。旧CacheLookup不能给替换Session装Plan；clear等待已准入permit、旧未准入候选不能凭临时文件复活；源put捕获epoch后排队/已开始两顺序有受控证据。
- **候选与边界**：MPP `8e960b4d4e471df805871c0f67c12eccf07d145ebdd27e26a96d1cc0664f4d99`，596140 B；独立/内嵌MPE `120143e1711c3884b51f655b163c2c719df9219bc95e0c9237421d8496eda070`。UI `800430e0e6e0a97810974573f2016ada09280131e436e1ccff4640512e506e2f`。统筹从同次ZIP取core实际复查来源、compiled/UI/包边界、候选，均通过；旧M5h冒充M5i和local冒充release分别拒绝于身份缺失。
- **组合与体积**：指定原始APK/官方MPP/Patcher哈希和104默认根核对，组合/资源/既有DEX64580唯一类审计退出0。APK `3d7133011e91b046aa9eef645507436d9103f211bfcbee838b03a1c20ee2236c`，227137129 B；独立ZIP比对仅classes13.dex改变，其他18390条目相同。统筹重编已审阅的只读canonical工具及Entry debug检查：839类无增删，业务逻辑仅SourceCaptionCache，Entry仅方法debug，另两类仅build ID。Hook/Bridge实际内容保持。MPP只改manifest/内嵌MPE，另外72条目同字节；增127 B（0.0213%）全为MPE压缩增量，资源/ZIP结构0，无新依赖/测试资产。
- **保护与回退**：2245入场项/ZIP、10个既有变化、2233范围外现存及2原删除状态核对；13目标退出ZIP/哈希和默认dry-run在统筹改文档前通过。15194有限历史清单及343封存索引相符，原146测试/资源、六前端、190工具/构建文件及分支/HEAD/索引保持。旧M5h的44编译中间文件恢复记录逐项有入场SHA相同来源，交付/封存档未替换。本统筹未执行实际回退。

## 明确保留的限制及接受理由

源RawCaptionSource的checkActive→put窗口是源码确认的既有边界：旧consumer检查后，若到clear之后才put，可捕获新epoch。本次接受只保证**put已捕获epoch后的排队/提交**与控制器Publication/输出权限，不声称所有旧源字节都不可能再进入磁盘。缓存继续按源轨语义复用，磁盘写入不授予旧Session发送/显示权；本轮未发现该窗口造成显示/请求越权，故作为明确限制保留，不无依据改身份/格式或扩大成请求策略重写。

合法body被人为放入另一个合法键、仍可解析的语义截断没有外部真实性校验；两文件跨进程/断电、双重IO与永久删除失败、TTL时钟跳变、设备/OEM、远端CI、其他组合、真实供应商/费用及任意线程交错未认证。这些限制与本轮动态替换缺陷分别保留，不把总绿测写成全部存储故障认证。

原辅助编译/fixture/路径失败均保留，未算有效红测。历史清单晚于首Gradle6秒已准确披露；入场源码ZIP更早、前置接受清单及退出全清单交叉核对，未发现旧资产丢失，接受此时点偏差。44个可再生成中间文件的精确恢复不等于重新生成旧证据。

## 下一步及维护流程收敛

下一[M6a v1](../tasks/M6a.md)合并F5诊断解释、性能机制基线、测得问题的必要局部修复；不再发第二张纯缓存清点卡。预计剩**3–5实质卡，含M6a**：诊断/性能1–2、环境/资料/有限兼容2–3；补正和外部输入另计。

为减少取证工作挤占实现：后续固定保护源码、交付MPP/MPE/UI、原始日志/receipt/XML封存档、同次compiled ZIP及回退原件；Gradle的可再生成class/previous-compilation-data等内部输出不再不断追加进新历史清单。正常构建可管理其自身中间文件；不主动删除历史交付或封存证据，原15194清单和44恢复历史不改写。该口径来自可再生成输出与交付/证据的实际用途，AGENTS要求的历史交付保护继续。

统筹只审查/针对性运行和维护文档，未改生产、旧测试或验证工具，未commit/tag、推送/PR/发布、签名安装、清用户数据/真实缓存、真实付费调用、清共享缓存/reset/clean。状态镜像同字节。

统筹自身文档更新曾匹配过宽而临时缩短路线正文；已用本轮coordinator-entry-documents.zip恢复完整路线，核对六个章节及第1–5节除两条当前状态表行外保持原文，修复证据见roadmap-update-repair.json。没有影响源码/候选/测试；最终交接检查额外核对路线章节保留，不能只以允许修改该文件来代替正文检查。
