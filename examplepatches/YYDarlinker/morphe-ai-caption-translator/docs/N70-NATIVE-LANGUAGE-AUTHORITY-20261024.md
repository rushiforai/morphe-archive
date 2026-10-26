# N70 — 跟随 Morphe / YouTube 当前实际字幕语言（1.5.8 本地测试）

用户已确认 N69 的 CC 总开关问题解决。本轮在该代码上继续修复语言选择，不覆盖已交付的 N69 包。
输入诊断：`D:\HONOR Share\Honor Share\caption-diagnostics-1.5.7-20261024-110546.txt`。

## 现象与直接证据

Morphe 官方字幕补丁为新视频选择首选语言后，YouTube 菜单已经显示该语言，AI 却仍显示上一视频
手动选择的其他语言。只有在新视频里再手动选择一次，AI 才会切换。

日志的关键顺序：

1. `1792810887691 NATIVE_TRACK_APPLIED`：`foreground=false;translated=true;origin=DEFAULT;track=zh-Hans/manual`。
2. 52 ms 后，`1792810887743 VIDEO_SWITCHED`：新视频 `_XxySdqU1Xg` 成为前台。
3. `1792810887856 INTENT_APPLY`：仍使用 `target=en;translate=false;revision=86;mode=source`。
4. 随后可见字幕是 `If you've followed my channel ...` 等英文原文，导出统计没有翻译 API 使用。

这说明语言在提交翻译之前就已选错，与供应商翻译质量或缓存回复语义无关。

## 根因

- `CaptionSessionIntent` 将用户手动选择的目标和 translate 位保存到 SharedPreferences，跨视频/
  生命周期保持。`resolve()` 优先按这条记录从源目录寻找轨道，或自行拼接 `tlang`。
- `onNativeSelection(explicit=false)` 只让旧 intent 再应用一次；Morphe 的 `DEFAULT` 自动选轨
  不会替换持久目标。只有手动菜单的 `PREFERRED_TRACK` 才更新它，所以再手选一次会恢复。
- 生效 key 只有 `video|epoch|intent.revision`，不包含当前原生选轨身份；即使原生轨道改变，旧 key
  也可能让应用提前返回。
- 新视频的默认选轨可能先于视频 ID 通知到达。bridge 将它保存为后台观测后返回，`onVideoId()`
  只更新视频 ID，没有把刚提交的新视频轨道交给会话。
- URL 恢复入口还会用持久目标或上一 AI 会话目标给源请求补 `tlang`，有机会撤销原生播放器刚刚
  作出的语言选择。

## 最终权威与修改

| 状态 | 唯一来源 | AI 组件的行为 |
|---|---|---|
| 是否显示字幕 | 播放器 CC | CC off 不显示；CC unknown 等待确认 |
| 使用 AI 或原生绘制 | AI 开关 | 仅这项选择持久保存 |
| 显示哪种语言、原文或翻译 | 当前视频实际提交的原生字幕轨道 | 同时采纳自动/default 和手动选择 |
| 当前视频尚无真实选轨 | 原生选轨回调 | 等待；不从旧偏好或轨道目录猜目标 |

- 持久 intent 只保留 AI enabled / revision / provenance；不再读取或写入目标语言。旧字段在下次
  AI 开关动作时删除，即便尚未删除也完全不参与运行。
- 删除基于保存目标的 `SourceCatalog` 回退、目标推导和材料 URL 缓存。源目录继续用于挑选翻译
  的源轨和“目标语言已有原生轨道则免翻译”，它不能决定目标语言。
- native projection 保存当前视频的实际提交轨道及 selection revision。翻译目标直接从原生
  URL 的 `tlang` 读取；原文模式使用真实选中的源轨。应用 key 加入 selection revision。
- 接到同视频的新语言时，先停止旧会话，撤销旧请求与绘制 guard，再启动新会话。默认选轨改变
  也会即时切换，不需要人工操作或更新持久 revision。
- 每次进入新视频清除可见语言。提前到达的后台提交只允许一次交接，且检查 manager 当前
  video owner；已经作为前台使用过的手动选择不能在再次进入时重放。
- 原生请求只唤醒已提交选轨的协调器，不从预取 URL 创建目标。应用端的源 URL 恢复直接返回
  原 URL，移除上一 AI 会话给源请求补 `tlang` 的路径。
- AI 开关可以在等待原生选轨时开启；它不创造语言。原生选轨变化也不会开启一个已关闭的 AI。

## 验证

`NativeLanguageAuthorityTest` 通过真实 bridge / reconciler / 命令端口覆盖 14 种情况：
手动原文后新视频默认译文；选轨早于 VIDEO；中间空 VIDEO；再次进入不重放旧手动选择；
离场视频的迟到事件；同视频默认语言变化；翻译切原文；重复默认事件幂等；旧偏好+目录不能
选择语言；CC off 等待最新选择；AI off 不被默认事件打开；未选中语言的预取不生效；目标
以实际 `tlang` 为准；缓存 manager owner 不匹配时拒绝交接。

真实应用端口 + MockWebServer + Android TextView 另覆盖：默认目标变更使 API 和上屏语言
一起切换；旧语言慢响应不能上屏；miniplayer 源 URL 不被补旧目标；手动原文后新视频自动译文。
N69 的 CC 循环、AI/native 切换、晚到排版拦截等测试继续运行。

构建版本继续为 1.5.8，构建标识 `local-1.5.8-n70`。输出隔离在 `build/n70/`，交付目录为
`build/delivery/1.5.8-n70/`；已交付 N69 和公开 1.5.7 的字节保留。
本轮不修改 Morphe 官方补丁、不推送 GitHub 发布，不宣称完成实体设备视觉验收。

最终验证：core **254** + extension **370** = **624** tests，0 failures/errors/skipped；本地化 232×14；独立 UI/MPP 构建成功。

交付 `build/delivery/1.5.8-n70/patches-1.5.8.mpp`，**586,202 B**；SHA-256 `F9E528EB6433BB9E4D6A8A4DC72A4873EAA813D8F83DF79A7A3A433C7E8CF381`。MPP/MPE 一致，14 locales，包内 N70 标识、compiled core/UI 依赖边界、旧包哈希均已校验。
