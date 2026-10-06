# N29 Codex执行卡：完整1.45接入、启动连续供给与非中文语义翻页

日期：2026-10-02。唯一执行者Codex；完整实现、验证、独立建包、本地提交，完成即停，不开N30、不交DeepSeek。本卡**整体覆盖旧N28C-R2卡**，不要先R2后N29，也不因为模块各自完成便再拆r卡。

## 1. 真实基线与允许输入

唯一仓库E:\Projects\morphe-caption-v2；产品基线9a7bdf35351b9a052233bac8b9004241548eb1eb / anchor/n28c-r1-9a7bdf3，参考HEAD f7c0c462dcd31f57f1336678007793570cbd4818。HEAD到锚点只有docs差异则允许开工，记真实HEAD；规划docs/PROJECT-STATE及已知用户输入允许保留，不为docs-only后继停工。未知产品改动/另一个执行者才核对。

先比对仓库与外部PROJECT-STATE，无差异跳过覆盖；有差异先读内容。读本卡、N29-DEVICE-REVIEW-AND-PLAN、R1交付与死锁根因，不按旧R2的强制Always show shim施工。

输入：根patches-1.45.0.mpp=11,039,984/SHA256 DBA660DF61D95131A22242CABE9C44B4B04861B7BA6EBEFFE91C4B3647D55B93；原版YouTube21.16.256/minSdk28；用户安装APK YouTube_Morphe-v21.16.256-patches-v1.3.5.apk=199,492,582/SHA256 8676787F0C5DB0636CA72C8DAC08071B6263BFEC7DBA4D592E408BBC0EF0B5C4。用户APK只读用作坏结构回归，不作为重新打补丁的原版输入。

真机诊断/SRT路径与SHA见审阅记录；.verification/n28-device-review含实际APK反读、原译文/时间轴。已有工具/JDK21/Patcher1.14.1/SDK继续使用，不下载、不加运行时依赖。原R1/C/B/官方输入及失败证据不覆盖；用户APK和官方MPP不默认提交大二进制。

## 2. A：修复1.45菜单签名造成的残缺注入，恢复draw防线

已实证安装包：isFiltered路径CharSequence，onMenu=1、observeMenuPath=0、SubtitleWindowView.draw不存在/suppressNativeDraw引用0，但native selection dispatcher=1。原R1+1.44的draw存在。源码QuickToggle先改onMenu后在String guard失败，draw在其后才安装。

1. 用现有真实patcher/1.45输入重现签名guard失败，保存真实异常和其前后部分插入的状态；对照用户APK序列，不把Manager异常处理方式推测成实测事实。不能以“能启动/有翻译”代替结构完整性。
2. 对isFiltered真实参数做唯一性与结构校验，接受String/CharSequence两个已知形态；提供类型正确运行时桥接。非String CharSequence完整toString、null无信号；不cast为String、不把null写成"null"。descriptor/实例p寄存器按实际参数宽度推导，保持Shorts/前缀/当前video/1500ms及菜单行为不变；未知/多匹配具名拒绝。
3. 必要签名/字段/位置先校验后修改，避免已知必失败条件留在多处修改之后。先修类型问题，恢复既有SubtitleWindowView.draw(Canvas)完整拦截与最后的长按接缝；不要用高频全局扫描/新窗口监听架构代替缺失的draw。
4. 增加防半成品：AI运行许可aiInstalled不得在整条AI finalizer尚未成功时就置true；在所有必须接缝及唯一性检查成功后才发布该标志。生产rewriteUrl入口/NativeCaptionBridge必须尊重该许可，部分失败保持原生路径、零AI请求、不清用户AI设置。Simplified/Remember无AI时的能力保持。不要另加一套可变运行时“猜测已完整”计时器。
5. 实际序列化APK必须具备：onMenu=1、observeMenuPath=1、draw拦截=1、共享初始化/原生selection dispatcher各1，内部copy wrapper正确、没有旧manual-only重复派发；也验证未知签名/人为缺hook使**既有组合审计非0失败**。将用户这个残缺APK送审计须明确拒绝（按hook缺失，不是它已签名或APK文件名）。
6. 原生遮罩依据实际当前Session/原已认可持轨语义，等待/安全空白/旋转过渡仍阻断底框绘制；关闭AI/关字幕/退出当前持轨及原生路径及时恢复。保留原source-only既定行为，不盲目以!sourceOnly替换全部显示权判断。受控View重挂/alpha恢复/同Activity重复绑定验证先证明既有漏洞；若draw恢复后仍有漏遮，再仅修其必要cache/生命周期接缝，不无证据重构扫描器。
7. 官方Always show新行为先做受控真值表与实际CC链回归：开/关AI、手动CC关/再开、初始150ms、换视频。没有复现AI手动OFF被撤销则**不安装**旧R2预设shim、不改官方偏好；若确实复现，只在AI已完整安装且用户开关ON、官方guard已结束时尊重original，AI OFF/未安装/初始guard保持原1.45，给出前后实际证据。该分支为本卡授权的最小兼容范围，不需为已授权等价接缝再次问许可。

所有新增分支用真实BuilderInstruction/ExternalLabel重定位，不写死PC，不裸尾标签；真实patcher序列化重读并审计，不能只测手工拼接片段。补最少但真实的String/CharSequence/null/非String与完整/残缺产物回归。

## 3. B：首块在途时一个紧邻块提前供给

已证明中文next HTTP晚2633ms、块边界wait墙钟2095ms；重启日语同模式。schedule与restoreCandidates的everReady串行门是主要原因，不是靠隐藏等待文案解决。

固定设计：

- 保留当前块最高优先、独立focus2/prefetch2/总4、30秒lookahead、3秒两seek→新预取暂停5秒、暂停/时钟fresh规则、同block复用与attempt/repair预算。
- 当前Job已真实发出（sent）、源/blocks就绪、当前Session有效、未暂停且时钟fresh、seek storm暂停结束时，即使!everReady，也允许**仅index+1**做一次cache-before-network。当前结果已接纳后恢复既有最多2路预取。不得在source未确认或focus尚未发送时提前派远处网络任务。
- 相邻块先复用已在途/内存/磁盘命中；只在真正cache miss后使用现有prefetch lane。不要把相邻块当新focus、重复请求、合并block、调大分块/输出上限或重写源时间。
- 去重与cacheReading沿现有Session/source/generation/job身份；新增邻块cache读取放已有SOURCE_IO，按block只提交一次并在失效时放弃，在锁外读/短区接纳。不在主线程同步等待新增磁盘工作，不增加线程或无界任务源；既有当前块查缓存合同与R1 CAS权限保持。
- 原生/AI OFF/不ready API配置/源only流程零AI请求。关闭/切目标不等bootstrap任务，不恢复旧语言；旧已发送请求按既定退休/stop协议结束。
- 诊断英文记录bootstrap资格/阻断原因、cache outcome、block/job/lane、scheduled/sent时间与boundary wait。只能对真实待译显示既有“翻译中”，失败/guard保持空白；不能冻结旧一句、延时播放、推迟第一句或显示原文来掩盖断供。

受控回归：用原session7的0.815s发送首块、首块2.535s网络、邻块5.621s网络与7.040s边界作固定虚拟时间（不sleep猜）。修前邻块只在首块接纳后发送/出现wait，修后在首块未释放的真实屏障期间已发送且到7.040s前就绪；同样的两个block各请求一次。另覆切目标靠近块尾、相邻命中API0、已有job复用、暂停/seek storm禁发、上限、迟到result与main stop/下条消息不依赖它。

只要求消除人为串行延迟；故意延长服务器时仍应诚实waiting，不强制“所有第二句零等待”。提前结束的新Session最多多一个bootstrap邻块，正常同一段稳定播放不增加逻辑block总数/重试；记录费用权衡，不扩大投机预取。

## 4. C：非中文按可理解单元翻页，不按单行偏好切碎

现代码两行额外1800/单页200、标点奖励80，候选只有ICU line机会；已切`誇張す | る...`、`中国 | の...`。用户明确要求标点及不影响语义理解的切口。所有非中文目标按本设计接入，中文legacy_n26完全不动。

1. 保持R1完整<=7000ms且fitsTwo优先单页，短于1200ms只准几何可行完整单页；7秒仍软目标。保持全文/字序/所有字符、事件ID/首尾/source-owned时间、每页<=2真实行、多页整数>=1200ms、NBSP/CRLF/字素/Devanagari/RTL保护。
2. 基于已有平台ICU增加word与sentence boundary工具，调用必须带目标locale、线程局部实例。sentence用于较强语义候选；word与line交集用于普通翻页。Unicode标点/引号/括号状态提供分句候选，不能把小数点、型号/缩写的点当确定句末，不能在开括号后/闭括号前悬置标点或拆数字/型号完整单元。使用现有通用数字/Unicode工具，不新增视频实体词表或语言助词黑名单。
3. 日语line允许字间换行，不等于允许词中翻页；候选优先ICU词边界与句末/分句标点。其他拉丁/西里尔/阿拉伯/印地/越南/印尼/韩语也先完整词/可理解分句，不能只修日语。ICU不能理解的无标点长句使用词边界兜底，明确为weaker seam，不承诺完整语法分析。
4. 替换过高两行惩罚为可审查的分级排序：在硬可行计划中先最少应急/词中切口，再最少无句末或分句证据的弱切口，再较少页面，再几何平衡/原软参考。优先完整句/句末，合法标点分句其次，普通词边界再后；不能因希望单行或软CPL超参考而多切一页。标点有歧义时只降级候选，不用硬拒译文或付费repair。
5. 应急字素切口只在一个完整词/不可分单元本身超两行几何而没有普通可行切口时使用并明确诊断；不能仅因为普通词方案的1200ms时间容量不足便切词来强行凑过。无硬可行方案保持既有安全空白，不缩字/借时/漏字；不为了获得标点切口增加空白。
6. 同宽/字号/输入对照必须证明：原有任何硬可行原方案仍有硬可行方案，语义偏好只是选优，不增加不必要空白；唯“禁止时间不足时切词”的新增约束如暴露旧伪可行必须如实登记原输入与原因，不扩大窗口使它变绿。
7. 仅非中文presentation升级为n29-presentation-v3，缓存identity对应隔离；中文key/namespace/18golden、n28b-policy-v1、请求prompt/hash/JSON不变，不清用户全cache。旧完整译文能否复用必须按现有scope合同；不把新分页版本混成旧页缓存命中。

实样回归必须从诊断捕获原文与真实几何，不能改成短句：ja事件145–169、42.719–51.974s三页切口；98–126、28.920–36.925s；ar已捕获长句与数字/英文名。再加14目标各至少“有标点长句”和“无标点/长词/复合字素”用例，SDK28及35平台ICU；弱切口/应急数、页时段、原before/after全文逐行交付。`誇張す/る`不得再作为普通翻页；有可行分句方案时不切`中国/の`；针对同一完整句如需词兜底须给出候选不可行原因。

指标：全文串接与原文逐字一致；多页<1200违规0；词内普通翻页0；候选强弱与选优可解释；14目标原28冷热/40几何矩阵硬合同保留；中文golden完全相等。不能宣称标点/ICU保证14语言全部语义正确。

日语b4比较方向存在译文本身的风险，保存原响应与SRT对照，**不在本卡改prompt/加该视频特判/额外付费语义评审**。分页优化不能把这处翻译宣称修好了。

## 5. 官方基线、兼容声明与冻结边界

本卡正式输入官方1.45.0，宿主21.16.256/minSdk28。共享Constants兼容声明从陈旧21.07.247改为实际组合通过的21.16.256；从当前正式源码MPP运行generatePatchesList，包内targets/生成JSON/README一致。不宣称未经本项目验证的其他稳定/experimental版本，不把官方版本号当本产品版本，不改已发布v1.3.5资产URL/日期或覆盖资产。

使用匹配宿主的完整官方default及其依赖，保留新增默认项，default=false的Spoof signature不擅自打开。PASS数量/DEX数量/类数按真实1.45报告，不强制84/11/58052。验证七种非空三根组合及API0 native-only；本卡仍不合并Simplified根。

设置位置/无图标/唯一视频父屏/旁白后紧邻/内部prefs与Keystore不变，以实际新资源与真实Collator排序复核。三项UI整改留到N30，新技术字段从开始就英文。

允许文件面：QuickToggle/native bridge接缝与必要AI许可入口；必要遮罩最小生命周期接缝；Controller仅startup邻块资格/缓存调度；Unicode/Pager/RenderSpec及非中文呈现版本；Compatibility/生成元数据/当前README、必要测试工具docs。禁止改R1 Publication/Permit/CAS/同key排序/后台5秒/清理线程与队列、lock顺序、源token/ID/时间、模型供应商/重试预算、字号/用户拖动位置/颜色、中文呈现与prompt/缓存身份、N27/VISIONOS。

与本卡新语义直接冲突的旧测试断言（首块前禁止所有prefetch、偏好三张单行或旧非中文版本号、未完成finalizer却aiInstalled=true）可**定点更新**：修改前保存，差异表解释，用更强的新合同覆盖，其他断言/输入不动；这是本卡明确授权，不需机械停工询问。中文18golden、ACCEPTANCE/frozen不能改；不能整套删测试、跳过失败或改输入以翻绿。

## 6. 验证、一次建包与交付

按A/B/C分别做受控before/after与必要专项；各模块实现完后只对最终同一产品树做一次正式全量/一次正式交付，不用不断重新建大APK展示进度。保留所有失败日志，不用最终绿色覆盖旧失败。

- R1 614及新增/合理调整后实际全量failure/error/skipped0；原main/K12、持permit下一条消息、同key/迟到/切目标继续成立。Controller变动后沿既有同一最终代码200+200共400受控轮复核，不新增调度架构。
- 中文18golden逐字段相等；14目标冷热与原40几何、R1短窗/1200规则、新语义seam矩阵。Python27、本地化现有220×14；冻结4通过/4既有失败/4未验证、三个invisible_ms0，ACCEPTANCE/frozen零diff，不包装成全质量通过。
- 从正式交付MPP自身+1.45+原版21.16.256组合：完整官方defaults及7根组合结构；实际全部根DEX/分支/寄存器/接口访问/真实draw与menu/copy绑定、minSdk28、CRC/资源/设置/aapt/verify_bundle/N8Verify通过。用户坏包由同一既有审计入口非0拒绝并具名缺hook；正常新包必须通过。
- 单独记录Always show兼容回归与是否需要shim；实际生产即使缺钩子也不可新发AI请求的负例，不以只存在helper方法冒充有宿主调用。
- 独立路径build/local-test/patches-1.3.5-本地测试包-n29.mpp、extension-1.3.5-本地测试包-n29.mpe；build/n29-composition-final/YouTube-21.16.256-本地测试包-n29-unsigned.apk。内嵌MPE=独立MPE。历史输入/产物/原证据本次捕获清单前后SHA一致，不覆盖用户APK/R1/C/B。
- docs/N29-LOCAL-TEST-BUILD.md给真实根因/1.45输入、部分失败防护、startup wall与video时间对照/请求数、切口before-after、具体测试断言变更、兼容元数据、完整SHA/字节、实际组合计数和未覆盖边界。诊断加入精简构建/官方基线/呈现身份及一次性draw接入成功字段，避免下次仅1.3.5无法区别包；不按每帧dump整棵树。
- 一个核心本地提交、anchor/n29-<真实短哈希>；docs-only真实身份补记可另提交，不amend旧提交。两份状态同步，保留规划docs随卡提交，已知外部输入不视为未完成源码；不签名/安装/清数据/卸载/推送/发布，远程翻译API/新增依赖/下载均0。

完成后只交本卡结果并停止。用户下一次只需中文启动连续播放、复查日语原生框/42–52秒切口和开关/旋转一次，发诊断；不再次要求读14语种或全表复测。规划者审阅后发N30，N30必须把第四期与三项本地化收尾一并完成，不再延期或拆额外小卡。
