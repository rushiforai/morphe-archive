# QQ 音乐会员流家庭共享补丁 —— 开发进度全记录（停工交接）

> 目标：改版 QQ 音乐 App，把主 CGI 域指向自建服务器（取流代取+请求透传），
> 实现共享会员播放。**当前停工于：注入层完全正常（有文件日志铁证），
> 但 App 无网络——死因在网络收发层或服务端校验层，未破案。**

## 思路总览

- **服务器侧**：`qqmusic_proxy.py`（需重写，机制：拿 TA 的 qm_keyst 代取流 + 普通请求透传 + UA 统一）。豪华绿钻 3 台/日播放设备、7 天 5 台登录限制——**这是做代理服务器的动机**（设备限额在服务端按“播放设备”计，代理后服务端只看到代理机一台）
- **客户端侧**：App 主域重定向到代理服务器。入口=关于页连点 logo 6 次的官方诊断彩蛋处寄生设置弹窗（填 host+port，空值回官方域）
- **App 版本**：20.9.0.8（应用宝直链 193MB，26 dex）

## 认证/接口侦察结论（已实锤）

- 单 token 架构（官方无双 token）：`qm_keyst`（Q_H_L_ 开头，72h 有效，`QQConnectLogin.LoginServer.QQLogin` 可无限续期）
- u6 域 musics.fcg 明文+zzc 签名（@jixunmoe/qmweb-sign 有 Python 版算法）
- App 调试机制：`SP_CGI_CONFIG` 的 `SP_KEY_HOST_TYPE`（0=正式/3=自定义）+ `WnsDebugManager` SP 的 PREF_KEY_WNS_DEBUG_IP/PORT（默认 101.91.37.168:18234 腾讯测试服）——但 **emua 老栈 type≠0 时硬编码走 ut.y.qq.com（带空格），不能自定义**，所以最终走 dex 注入路线而不是纯调调试开关

## 五版 Morphe patcher 的崩因链（全部实锤，别再踩）

1. v1.0.6/1.0.7：`replaceInstruction` 单条解析吞 `move-result-object`（getter 调了结果没接住）
2. v1.0.8：`replaceInstructions` 等量替换语义吞掉后续原指令（goto 被吞=连不上网、Map.get 被吞=VerifyError 闪退）
3. 同版：正序替换索引偏移（净增指令后第二个命中点全错位）
4. v1.1.2：**运行时类必须 `extendWith("server-runtime.mpe")` 声明成 extension**——patch 源码树里的类只活在 patcher 执行期不进 APK，四版 NoClassDefFoundError 的终极根因
5. 全系：**patcher dex 全量重排（26→28、原主 dex 洗成 2.6KB、启动链类后移）**——QQ 音乐带 Sword 热更代理对 dex 布局敏感，五版全“连不上网+闪退”

## 手术版结构（当前最终形态）

- 23 个 dex 原字节不动，只重编 3 个（classes/classes6/classes21）+ 新增 classes27（运行时 4 类）
- 详见 `smali-patches/README.md`（emua 反射链版 getHost / cyclone 三处 / AboutFragment 寄生）
- 构建链：`build-surgical.sh` + `apply-patches.py` + `runtime-src/`（4 个 Java 源）
- **主 dex method_ids=65536 满格**：emua 注入必须纯反射链（forName/getMethod/invoke 复用主 dex已有 id 零新增）
- 签名：自建 keystore（不进仓库），apksigner v1+v2

## 日志版实测铁证（2026-09-28 11:28-11:46）

`/sdcard/qm/patch.log`（QmLog 类全链打点）输出：

```
QmLog path=/sdcard/qm
[ServerHost] class loaded（注入类加载链通）
[ServerHost] getter 返回官方 vc.y.qq.com / t.y.qq.com   ← 未配置时正确回官方
[Dialog] 弹窗 show 完成                                  ← 关于页寄生入口正常，不闪退
t.y getter 以 12 秒间隔被调 3 次                         ← App 在重试请求（请求构造了但全失败）
```

**结论：注入层 100% 无害且工作正常；“没网”死在网络收发层（DNS/TLS/服务端拒绝），不是我们的注入。**

## 停工时未完成的排查（接手人从这里开始）

1. **logcat 抓包定死因**（root 机）：`su -c "logcat -d | grep -iE 'diagnos|network|okhttp|MLog|cgi|err'"` —— 看 CGI 请求的服务端返回码（403？超时？DNS 失败？）
2. **两个主嫌疑**：
   - 服务端按 APK 签名拒请求（改版签名≠腾讯官方——但注意社区改版 App 能用，此嫌疑存疑）
   - App 连通性检测域失败→全局判“无网”（我们只覆盖了 t.y/vc.y 两个主域）
3. **Reqable 抓包**（有 root 设备）：看手术版 App 的请求实际发到哪、服务端回什么
4. 若死因是签名校验：调查 Sword/SwordSwitches 是否在运行时校验签名摘要（反编译搜 signature 相关）
5. 服务器侧 qqmusic_proxy.py 还没部署（原计划：TA 侧部署+LE 证书——宿主拼 https:// 前缀，纯 http 会被 Android 9+ 明文限制拦）

## 环境工具备忘

- baksmali/smali 的完整 classpath 在 `tools.sh`（gradle 缓存里的 Morphe fork smali 3.0.9-dev + antlr-runtime）
- d8/apksigner/zipalign：build-tools 34.0.2
- baksmali 终验纪律：每次注入后必须 baksmali 回来看指令级上下文（这项目里吞指令的坑全靠它揪出来的）
