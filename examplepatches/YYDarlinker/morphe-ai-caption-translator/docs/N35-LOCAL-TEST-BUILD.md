# N35 本地测试交付记录：字幕时间链与预览

日期：2026-10-04（Asia/Shanghai）

## 结论

N35 已按执行卡完成本地实现、全量验证、独立建包和组合审计。交付名称统一使用 -n35；N34 三件套、官方 input、历史证据和回退脚本未覆盖。

本轮没有写入真实手机、安装/启动 APK、推送文件、下载音视频或调用远程翻译服务。因此本记录证明的是源码机制、受控回放、构建和包审计，不把真实手机听感或实际波形同步冒称为已验证。

## 实际修改范围

- RebuildSource：保留 WORD/SEGMENT/CUE 时间证据；JSON3 多词 tOffsetMs、cue 边界和 end boundary 不再在均分前丢失。保留 NATIVE/ESTIMATED/ALIGNED 语义，部分参照采用使用局部相邻 anchor 仿射映射，原 NATIVE、speaker、650ms hard break 和 source ownership 保持不可变。
- NativeAsrTrackReference / SourceFormatPolicy / RawCaptionSource：同 video/language 最多保留 4 个 descriptor；总 reference phase 1500ms、最多 3 次尝试；按可匹配的 word、segment、cue 能力选择，不再首个 parse-success 即返回。签名参数不重序列化，不把 HTTP 200 伪装成 timing-ready。
- CaptionDiagnosticArchive / CaptionDiagnostics：新增 bounded timing channel。debug 开启时保存 reference body 的 SHA、bytes、format、capability 和 multipart Base64（每 session 限制、正文 cap 256KiB，不保存 URL/cookie/key）。
- RebuildClock / OfficialPlayerClockAdapter / RebuildController：统一 hook、官方 public player getter、fresh media fallback 和 frozen reason；使用采样原点投影，去除 800ms artificial cap，seek/video/session reset 清旧 epoch。frame/长 layout 使用同一纯时钟估计，避免旧 s.position 复活。
- RebuildPageLayout / CaptionLanguagePager / CaptionOverlayV2：完整两行可容纳时整 event 优先；分页记录 SOURCE_EVENT 或 ESTIMATED_PAGE_TIMING basis，不把目标字符比例伪称声学子句映射；应用 trace 增加 page basis、dispatch uptime 和 layout cost。
- CaptionEditorViewport / SubtitleStylePreview：WindowLease 绑定 root/window 实际 detach，不再随最后一个 row 回收切换 soft-input mode；preview 缓存未 attached TextView/measure/layout，真实 locale、style、size、density 或 width 变化才失效。

## 验证结果

| Lane / 验证 | 结果 |
| --- | --- |
| N35 timing chain + N34 source replay | 18/18 pass |
| N34 display/preview/viewport focused regression | 69/69 pass |
| N35 integration + contract + connection failure | 136/136 pass |
| 全量 extensions:extension:testDebugUnitTest | 708 tests, failures=0, errors=0, skipped=0 |
| Offline source build + patch list generation | pass |
| Patcher composition：AI caption translator + Remember caption selection | 92 PASS lines; COMPOSITION_PASS |
| 最终组合 APK | 11 root DEX；58,281 class definitions |
| MPE DEX | 1,492 class definitions；无 app.morphe/validation/N33/N34 replacement classes |
| n35 artifact/scope/final checks | pass |

默认 JDK25 直接跑 Robolectric 会被 ASM 报 Unsupported class file major version 69；因此测试入口使用仓库已存在的 isolated JDK 21，结果以 .verification/n35/full-03/result.json 为准。没有为此下载新 JDK。

## 交付文件

- build/local-test/patches-1.3.5-本地测试包-n35.mpp：1,265,279 bytes；SHA-256 7C3A610063A615CE9A9DEC3ADD5484FBADDCDDB6915DABDD18363A0B849982BF
- build/local-test/extension-1.3.5-本地测试包-n35.mpe：3,089,628 bytes；SHA-256 DB3605693CA8E470B9A68C02ED95C4325B646BBF9A2FABFFC99835FCC36410B2
- build/n35-composition-final/YouTube-21.16.256-本地测试包-n35-unsigned.apk：198,240,116 bytes；SHA-256 3B5CF6D728CE2F082BE178A93791D241555816603A0A69F3EA03034B2C32B31A

## 参照采用边界

机制层现在会真实区分并记录 downloaded → parsed → matched → capable → chosen → applied，并可把 word/segment/cue anchor 写入诊断。N35 控制 fixture 已证明：3 个 partial segment offset 保留、内部词仍 ESTIMATED、局部 source time 实际改变；N34 direct-word 路径、冲突跳过和 hard break 回归保持通过。

但是，本卡明确记录：诊断中的旧 runtime reference f40f646a... 原始 17,840B body 在本轮仍未取得；也没有连接真实手机。因此不能声称该旧 body 已被重放，也不能声称实际音频波形或用户短验已同步。真实 phone-after 仍需用户自行执行 30–60 秒慢片段、pause/seek/fullscreen 返回和 preview 上缘快慢各 3 次，并保存带 timing body/capabilities 的 full diagnostics。

## 构建/审计边界

- 使用官方 patches-1.45.0.mpp，其原 baseline SHA/bytes 未变。
- 使用 existing Patcher 1.14.1 和 isolated JDK 21；无新依赖、SDK、工具下载。
- MPP 内嵌 MPE 与独立 MPE 字节一致；AI-only、Remember-only、both 选择入口由 composition harness 审计，当前交付组合记录保留在 .verification/n35/composition-final-03。
- 物理手机未安装、未启动、未 push、未清数据；没有正式签名 APK。

## 可逆性

N34 baseline 三件套和 docs/N35-RESTORE-N34.ps1 保留。若必须回退，先确保 trial 工作区没有未保存/staged 项，再按 N35-ROLLBACK-READY.md 的 inspect/restore 流程生成新的本地恢复提交；不使用 reset --hard，不删除 N35 失败证据。

实现提交：1967dac。最终 HEAD 与 anchor/n35-* 标签为本次 docs-only 身份提交；以 git show-ref anchor/n35-* 核验真实最终短哈希。
