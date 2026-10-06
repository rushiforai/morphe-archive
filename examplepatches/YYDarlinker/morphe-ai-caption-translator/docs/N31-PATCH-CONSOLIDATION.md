# N31 后续：删除冗余独立语言补丁

日期：2026-10-03（Asia/Shanghai）。本次依据用户明确指令删除第二个补丁，不新增N32任务序列。执行HEAD `1a3c555d46cf63641c01cb4b122f5761d7753f66`，原N31源码/产物/报告完整保留。

14种自动翻译语言多选与原生菜单通用接缝已经属于AI caption translator；独立Add Simplified Chinese to auto-translate属于冗余入口。本次真正删除其public bytecodePatch定义、CaptionFeatures.simplified、installed标记和独立强制插入zh-Hans路径。简体中文能力保留在AI设置多选中，与其余13种语言一致；默认空集合不被强制追加，用户selected_codes不迁移、不清除。AI安装许可与运行时开关分离：选择AI补丁后，即使AI开关关闭，已选择的菜单语言仍加入原生自动翻译列表。

当前正式MPP自身加载、生成patches-list.json与发行元数据校验均只包含两个根：

1. **AI caption translator**：AI字幕翻译、14种自动翻译语言多选（包含简体中文）及现有本地化设置。
2. **Remember caption selection**：记忆原生字幕选择，仍可独立选用；没有AI时不注入语言或触发翻译API。

README/升级选择说明及本地发行校验已同步。旧版本1.2.x/1.3.4三根记录作为历史保留；本次未发布，旧公开下载URL/日期和patches-bundle.json逐字不变。

## 验证

- Java **682/682**，failure/error/skipped0（原680+两项AI独占菜单/简体中文去重验证）；实际14UI语言/控件矩阵随原全量继续通过。
- 本地发行元数据 **12/12**，含故意加回旧独立补丁必须拒绝的负例。正式MPP含Android根DEX；已从实际MPP生成两个public名称，旧补丁显示名和simplifiedInstalled从DEX消失。
- 2根对应3个非空组合：**AI-only / Remember-only / AI+Remember，3/3**。都由新的MPP自身＋官方1.45.0＋原版YouTube21.16.256实际Patcher装配并序列化审计；AI+Remember形成最终APK。
- 最终 **11DEX / 58,261类 / 322,981方法 / 626,701分支**；invalid/problem/binding0；N31有效语言/官方UI接缝、原native clone/去重/hook校验继续通过。
- CRC/资源/内嵌MPE=独立MPE、aapt/minSdk28、verify_bundle/N8Verify通过。原中文18golden/activate与N31当前验证逐字段相等，翻译请求/分页/调度/overlay生产源码逐字不变。
- 原N31交付及55份本次捕获历史文件SHA/字节不变，ACCEPTANCE/冻结scoreboard/234×14资源不变；旧输入保留。

## 新的独立本地交付

| 文件 | 字节 | SHA256 |
|---|---:|---|
| patches-1.3.5-本地测试包-n31-two-patches.mpp | 1,164,518 | `9C3E73C06EB1BE6D59B852CA292830A777328D5F0E81E327C0CBED8FDDB53915` |
| extension-1.3.5-本地测试包-n31-two-patches.mpe | 2,803,164 | `315026FAE1C851BDAB502BC07E2699A86F6D80D302FB0F1A24D25D5357CABA8F` |
| YouTube-21.16.256-本地测试包-n31-two-patches-unsigned.apk | 198,125,054 | `E72998E3EE7FE21AE0436CBFE59D1C2F5C7D53A7BCD2A3370139EF6538E8AE58` |

证据：`.verification/n31-two-patches`；组合与最终审计复跑入口：`tools/n31-two-patches`。原N31路径没有覆盖；本轮新包后缀`n31-two-patches`。MPP内部两个功能补丁，与MPP/MPE/APK三种交付格式是不同的计数。

未签名、未安装、未卸载、未清用户数据、未推送、未发布；远程API/下载/新增依赖均0。手机与母语语义没有新增验收。用户仍可保持系统语言进行原N31短复验；本次任务完成即停。核心源码提交及锚点以本地身份补记登记。

身份补记：核心提交 `66a258466a912e43ff67fb174cb5052ee3d5d548`；本地锚点 `anchor/n31-two-patches-66a2584`。此补记为docs-only后继，已验证产品/测试/新包内容不变。
