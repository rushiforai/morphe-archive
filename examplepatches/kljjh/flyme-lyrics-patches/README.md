# Flyme Lyrics Add-on

为 YouTube Music 增加魅族状态栏歌词的**独立附加补丁**。本来源只包含一个 `Flyme status bar lyrics`，配合 **Morphe 官方来源的 `Third-party lyrics`** 使用。

2.0 起不再重新打包整套官方补丁。歌词获取、翻译、时间同步和迷你播放器文本全部继续由官方实现提供。本项目是社区项目，不是 Morphe 或魅族官方发布。

## 使用

1. 在 Morphe App 中保留或添加[官方补丁来源](https://morphe.software/add-source?github=MorpheApp/morphe-patches)。
2. [添加本项目来源](https://morphe.software/add-source?github=kljjh/flyme-lyrics-patches)，仓库为 `kljjh/flyme-lyrics-patches`。
3. 选择原版 YouTube Music APK，建议 `9.30.53`。在**同一次修补**中勾选官方来源的 **Third-party lyrics** 和本来源的 **Flyme status bar lyrics**。GmsCore、后台播放等其他补丁仍从官方来源选择。
4. 安装后，在官方 Morphe 歌词设置中启用**第三方歌词**和**显示迷你播放器歌词**。开启官方迷你播放器歌词后，Flyme 状态栏歌词功能会自动启用；关闭它时状态栏歌词也会清除。
5. 在 Flyme 中允许应用媒体通知和状态栏歌词，名称依系统版本而异。

Morphe 目前不会跨来源自动勾选依赖，两个补丁需要手动选中。漏选官方歌词补丁会报出明确的提示，不会生成一个声称成功但没有歌词接入的版本。

来源地址：

```text
https://raw.githubusercontent.com/kljjh/flyme-lyrics-patches/main/patches-bundle.json
```

[下载 `.mpp`](https://github.com/kljjh/flyme-lyrics-patches/releases/latest) · [当前验证状态](STATUS.md) · [真机验收](docs/DEVICE_TEST.md)

从 1.0 升级：刷新本来源至 2.0，恢复官方来源，并按上面的方法从原版 APK 重新修补。1.0 是包含官方补丁的旧整合包；2.0 是与官方来源搭配的独立附加包。

## 行为与兼容性

- 使用官方迷你播放器模块已经生成的相同文本，保留翻译、换行和间奏格式，不增加歌词服务或网络请求。
- 在原媒体通知上添加魅族 ticker 标志，保留封面、按钮、通知 ID 和渠道；无需额外通知、悬浮窗或通知读取服务。
- 暂停、停止、切歌、播放会话改变、无同步歌词、关闭官方歌词功能或关闭官方迷你播放器歌词时清除状态栏歌词。
- 不支持魅族两个专用标志的系统会跳过。反射或通知更新被系统限制时不会阻止官方歌词播放。
- 已针对官方补丁 **2.1.0** 的真实扩展 DEX 验证接入。上游接口变动会明确报错，不能保证所有未来版本都兼容。
- 稳定 YT Music 版本：`9.30.53`、`9.20.53`、`9.15.51`；实验版本：`9.44.52`、`9.43.51`、`9.42.52`，来自所验证官方版本的兼容范围。

## 构建与测试

需要 Git、Python 3.11+、JDK 21（Gradle 配置使用 JDK 17 工具链）、Android SDK 36，以及可读取 Morphe 公共 GitHub Packages 的构建凭据。使用环境变量 `GITHUB_ACTOR`、`GITHUB_TOKEN` 提供凭据，不要提交令牌。

```sh
python tests/run_tests.py
python scripts/download_official.py
./gradlew :patches:test :patches:buildAndroid --no-daemon
python scripts/package_release.py
```

Windows 使用 `gradlew.bat`。官方 `.mpp` 只作为带 SHA-256 校验的测试夹具下载到 `work/`，不会进入本项目发布包。构建不克隆、不修改官方源码，也不编译官方补丁。

测试覆盖通知状态、真实官方歌词 DEX 的注入及往返读写、缺少依赖和接口变化时的拒绝行为。GitHub Actions 另用 Android `dexdump` 检查修改后的 DEX，并检查包内只有本项目扩展。自动测试不能替代真实 YT Music APK 和魅族设备验收。

## 许可与实现记录

[GPLv3](LICENSE) · [NOTICE](NOTICE) · [依赖机制与上游记录](UPSTREAM.md) · [魅族接口文档](https://open.flyme.cn/docs?id=239)
