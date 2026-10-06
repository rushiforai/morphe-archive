# N28C-R1 Codex修订卡：主线程生命周期响应与非中文最短页

日期：2026-10-02。由Codex完整实现、验证、建包、提交和交付，完成即停。当前C已经交付但规划审阅发现两个真机放行前的明确缺口；本卡保留已修复的锁环与所有C呈现功能，不恢复旧B、旧N27或已撤回旧N28实验。

## 1. 开工身份与允许差异

仓库`E:\Projects\morphe-caption-v2`。
execution_head参考`ce372cf4100a3a9af27ae0c1bcb5779341845221`；product_source=`4d98eec20f9f9d1d9a8b2bf0e52934cade8d93b0`；source_anchor=`anchor/n28c-4d98eec`。

核对实际HEAD到source_anchor只有docs差异、源码/资源/build/测试与该点一致即允许开工，记录真实HEAD。随后再有docs-only提交无需再次暂停征询；真正产品差异/另一执行者改动才停止核对。保留本轮规划docs/两份状态更新随卡提交，不回滚管理档案成“C仍死锁”。

先读N28C-REVIEW.md、N28C根因与最终交付记录。原死锁已在纯B/C证明，修后B550/C591与400轮回归仍是基础。本卡基线C591（其中K12），不把“原579”作为必须不增加的固定总数。当前新C小测试如需按下面明确定案调整，保留修改前测试到证据、在差异表解释；65份原测试和中文黄金不放宽。

## 2. A：主线程不等待磁盘许可，不泄漏生命周期异常

已证实静态路径：UI开关/native关闭/切目标可调用`stop/video/activate`→`Session.cancel/retire/finishRetirement`→`Publication.drain`，尚有permit时同步最多5秒，超时抛RuntimeException。现有stop drain回归只在后台线程，不代表UI路径响应通过。

先新增**受控现状回归**：保持实际commit许可未完成，在真实Android main Looper调用启停或切目标入口，验证操作返回和下一条主线程消息是否依赖permit释放；使用屏障/外部硬截止和线程栈，不sleep碰运气。回归超时仅是观测保护，不能增加production等待时限来解决。

修订方案固定为职责分离：
- revoke/active交换、撤销发布权、旧UI失效、最小Session标记在短状态操作中立即完成；不等后台文件操作，不调用跨锁外部工作。
- UI调用者使用非阻塞停止/retire请求；已经获准提交的物理收尾、disconnect等可能阻塞的清理由后台进行。可保留off-main的显式stopAndAwait/awaitRetirement用于测试/真正需要完成barrier的后台调用。
- 公开`stop`若兼顾UI/后台，必须明确两种完成语义：UI返回表示发布权已撤销/旧渲染失效，后台barrier完成表示此前许可的物理收尾完毕。不得把后台物理完成等待留在主线程或用catch忽略来伪称完成。
- 同一CAS reserve/revoke线性化继续保留；撤销后的旧结果不得取得新资格、提交新scope或显示旧字。撤销前已reserve许可仅允许收尾其原key，物理收尾晚于UI请求返回时仍不得覆盖更新版本的同key提交；需要用scope/generation/写入排序给出证据。
- 不用无界线程或任务队列来换取UI响应；沿既有合适执行器或单独有界清理路径，并按Session去重清理。不要把等待任务塞进会被它等待的任务占满的执行器。
- 后台5秒barrier超时/Interrupted可明确失败，但不能从普通UI入口抛出未捕获异常；记录英文reason、保留状态/清理资格、保证UI不会重新启用旧Session。不能继续更新已撤销plan或为了成功报结果而标false为true。

新增回归至少覆盖：main入口在permit仍被屏障持有时返回并执行下一条消息；真实切目标立即显示新会话而旧文件仍收尾；超时/中断处理；同key新旧提交排序；停止、换视频、原生关闭及用户关闭开关；迟到清理不抹新字幕。原K12所有锁环/权限/迟到/UI应用保护继续成立；若一个新C测试确实锁定“所有调用者同步等物理收尾”，调整成显式后台barrier断言并另加UI契约，不能删除测试或弱化权限保证。

focus2/prefetch2/总4、seek storm、attempt/repair预算、HTTP旧在途允许完成规则、所有用户配置不变。旧B死锁不回归，C/S/connections monitor保持互不嵌套。

## 3. B：非中文可读页时长与短窗保护

实际C矩阵的一段1000ms事件被分成421/579ms两页，生产记录有283ms页。此次明确通常最短页为1200ms，**不是**重启8CPS硬门槛。

对非中文目标：
1. 若完整事件文本fitsTwo、字素/像素可行且duration≤7000ms，优先完整单页，CPL/CPS超参考只watch；不要为一行评分把能在两行读完的短事件拆成更快碎片。
2. 整个源窗duration<1200ms，仅允许完整单页且几何可行；显示时长严格等于原窗。不能拆多页、重复字、跨事件借时间或人为延长。
3. 真正需要多页时，页数/候选必须满足所有页≥1200ms、每页硬两行与合法切口。以`pages * 1200 <= duration`作为可行条件；时间先给每页1200，再按阅读权重分配剩余，首尾/单调/完整text保持。不以1ms底座或浮点四舍五入绕过下限。
4. 7秒仍为软目标，无法合法分时保留可行完整页并watch。普通速度/CPL超标不独立清空、不触发额外付费repair。
5. 如果整段不能在硬两行内显示，且原窗也不足以容纳有最短时长的合法多页，则明确`page_time_capacity_unresolved`/`hard_geometry_unresolved`并沿安全空白，不用闪页伪装完整显示。不能挪source IDs/time、翻译文或动字号基线来凑。
6. 中文所有旧路径、8CPS、评分、页时长分配和18组golden不改；非中文fallback的word/grapheme与NBSP/CRLF/BiDi保护保持。

须保存当前短页JSON为预期不合格样本，至少验证：当前421/579、283ms案例；600/700/1000ms完整事件不能多页；2400ms完整fitsTwo优先单页；多页每页≥1200；长事件无合法切口只soft watch；源窗不足硬容量安全空白；CPS高但短窗全文fitsTwo仍单页可见。

更新现有新C geometry/counter/production断言：不能仍只检查`end>start`，要区分整个短窗的完整单页与合法多页。40几何矩阵及14目标冷热生产矩阵生成时间统计（min page、sub1200 multi-page count），修后违规多页计数必须0，不重写输入文本或扩大视频预算来制造通过。给出实际页面文本/时段对比。不要修改65份旧测试或中文fixture。

更新非中文presentation_policy版本（如n28c-presentation-v2）及相关缓存身份/报告，保留中文旧key/namespace，不清全cache，不覆盖v1历史包/证据。请求/prompt/n28b-policy与scope不重做。

## 4. 范围与必要验证

允许生命周期/缓存提交排序与最小UI guard必要改动，以及非中文Pager/RenderSpec/相关观测、必要回归/工具/文档；原源文/token/owned时间/数字与语义策略、供应商/API调度、字号/颜色/透明度/用户拖动位置、菜单/patch/resources保持。不改UI summary/全本地化/旧诊断语言，不恢复N27。

Codex完整做：C591及新增回归全量、SDK28兼容、原400轮或同等受控并发门槛、44专项/18golden/14冷热/40几何（按本修订时长合同），Python27、220×14、冻结4/4/4/三类不可见0、ACCEPTANCE/frozen零diff；正式交付MPP自身组合84/84；最终全部根DEX/接口/分支/资源/aapt与unsigned确认；历史包/证据SHA不变。报告实际新测试总数，不写死591，不用专项替代全量。

源码审阅和既有trace分析结果由本规划者提供，不是新产品测试通过；Codex须自己新增受控回归。不要因为静态bug已定位就省略实际main-Looper与publication验证。

## 5. 独立产物和停止

新包不覆盖C：
- `build/local-test/patches-1.3.5-本地测试包-n28c-r1.mpp`
- `build/local-test/extension-1.3.5-本地测试包-n28c-r1.mpe`
- `build/n28c-r1-composition-final/YouTube-21.16.256-本地测试包-n28c-r1-unsigned.apk`

源码锚点`anchor/n28c-r1-<真实短哈希>`，核心实现提交与可选docs写实分清。交付记录`docs/N28C-R1-LOCAL-TEST-BUILD.md`含UI完成语义、许可线性化、main/后台结果、短页对照、实际矩阵与hash；两份PROJECT-STATE同步。保留C的4d98eec/ce372cf及三件套、失败证明，不reset/amend。

工程证据通过后才进入用户真机一次有限复验；不用先装/回测已知旧锁环的N28B，不要求用户读14种语言。测试清单：正常启动和中文对照；暂停/关闭再开字幕/切目标/换视频/seek/旋转、无明显卡住；少量ar+Latin数字、ja/ko或de/fr看是否裁剪/方向异常/快闪页；完整诊断/时间段/设备版本回规划者分析。没有已存在的少数目标项就不做第四期补菜单来测试，目标覆盖先用固定自动化矩阵证明。

本卡完成即停，第四期暂不发。未签名/安装/清数据/推送/发布，零远程翻译API、新依赖/下载。真机/oEM/远程实际/母语语义仍未覆盖时明说，不把交付或591变绿当全验收。
