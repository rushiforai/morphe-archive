# 手术注入点存档

## emua_b_b_getHost.smali
替换 `com/tencent/qqmusic/emua/b$b.smali` 的 `getHost()` 整方法。
- 正式环境（CgiUtil.c()==0）走反射链调 `ServerHost.t_y_qq_com()`（musicu.fcg 主域）
- 反射失败（类加载失败等）catch 回落官方 `t.y.qq.com`
- Sword 代理段 p0 寄存器重编号：`.registers 3`→`5`（p0 从 v2 变 v4，proxyOneArg 的第二参数改传 v4）

## cyclone_n 三处 vc.y.qq.com（classes21）
`com/tencent/qqmusiccommon/appconfig/cyclone/n.smali` 中三处 `const-string "vc.y.qq.com"` 替换为：
```smali
invoke-static {}, Lapp/patches/qqmusic/ldp924/ServerHost;->vc_y_qq_com()Ljava/lang/String;
move-result-object v<原寄存器>
```
- 位置1：`Map.get(key)` 的 key（约 :115）
- 位置2：`new DomainSwitchItem(origin, ...)` 的 origin 参数（约 :157）
- 位置3：`Map.put(key, ...)` 复用位置1 的寄存器（v2，无需新指令）
classes21 method 余量仅 6，此注入 +1 method ref 恰好够。

## AboutFragment（classes6）
`com/tencent/qqmusic/fragment/morefeatures/AboutFragment.smali` 的 `onClick()` 里
`Lcom/tencent/qqmusic/ui/BannerTips;->o(...)` 调用后（"已开启诊断入口!" toast，约 :3817）插入：
```smali
invoke-static {p0}, Lapp/patches/qqmusic/ldp924/ServerSettingsDialog;->show(Ljava/lang/Object;)V
```
触发方式：关于页连点 logo 6 次出诊断入口时，弹服务器设置框。

## 关键坑（为什么 patcher 路线被放弃）
1. Morphe patcher 会把全部 dex 重排（26→28 个、原主 dex 洗成 2.6KB）——QQ 音乐带 Sword 热更代理，对 dex 布局敏感，五版全崩（连不上网+闪退）
2. 主 dex method_ids=65536 满格：常规注入（invoke-static 新 method ref）直接超限，必须走纯反射链（复用主 dex 已有的 forName/getMethod/invoke）
3. const-string/jumbo（Instruction31c）：主 dex 字符串索引 >65535 用 jumbo 变体，匹配注入点时两种都要处理
4. 运行时类不能放主 dex（会爆 method 池）——单独编 classes27.dex（4 类，d8 从 runtime-src 编译）
