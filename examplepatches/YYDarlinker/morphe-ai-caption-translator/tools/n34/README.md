# N34 可重跑验证入口

所有操作在 E:/Projects/morphe-caption-v2 执行，依赖已在本机存在；禁止下载/远程翻译请求/物理手机写入。每次使用新 Label/output，原失败与历史证据不得覆盖。

- 全量：tools/n34/run_tests.ps1 -Label full-new-label；输出环境 N25_PREVIEW_OUTPUT、CAPTION_UI_PREVIEW_OUTPUT、N30_EVIDENCE_DIR 自动转到 .verification/n34/。
- 实际 loopback 原响应与等价 memo/长文本/合并负例：同一脚本加 -Tests app.yydarlinker.deepseekcaptions.N34ActualRequestReplayProbeTest -ExtraSource tools/n34/probes；6 tests，真实 82 loopback 请求与 1 个 quote 拒绝保留。
- 性能探针：选择 N34MeasuredPerformanceProbeTest 并设置 -ExtraSource tools/n34/probes。before 使用 tools/n28c/run_scheduler_tests.py --tree .verification/n34/before-performance-tree，after 使用当前树；同 600px video/首选字号、80 position 回调；保留 raw timing，不以大容忍线掩盖慢样本。
- 新候选 build：tools/n34/build_final.ps1 -Label candidate-new-label；依次离线 buildAndroid/generatePatchesList、真实 Patcher 组合，正式文件只来自该新候选。历史 -n33/-n32/旧候选不变。
- 三组合：tools/n34/run_combinations.ps1 -Addon build/local-test/patches-1.3.5-local-n34-candidate-03.mpp -Label combinations-new-label。
- DEX：tools/n34/audits.init.gradle 注册 auditN34Final。require-ai=false 是沿用 N33 的已撤回 N27 controls observer 检查，不是关闭当前 AI hook 审计；三个 CompositionDexAudit 另检查现行 AIInstalled、原生绑定、callback/fingerprint。
- 最终资源与 ZIP/metadata：tools/n34/verify_artifacts.py --mpp <正式MPP> --mpe <正式MPE> --apk <正式APK> --output <新目录>；tools/n34/final_checks.py 和 audit_scope.py 核对官方 39 方法、无 fixture 泄漏及受保护源字节。
- 历史：tools/n34/verify_history.py --output <新报告>。capture_inputs.py/capture_baseline.py 只允许第一次 capture，已存在 before 则拒绝覆盖。
- SDK35：tools/n34/build_android_host.py 从正式 APK 复制未改 DEX/resources 到独立 N34 验证宿主；只对 -s emulator-5554 安装该测试副本，再使用 run_android.py --serial emulator-5554 --scenario owned/actions --output <新目录>。不得把正式 APK 签名或写入物理手机。

实际输入、前后失败、分段对齐/格式 coverage/语义重放、TextView/layout 与 WMS PNG 全部位于 .verification/n34。合成源/时窗/播放器面板不是网络视频或音频同步认证。固定文件/时间/视频名只存在测试夹具，不参与生产判断。
