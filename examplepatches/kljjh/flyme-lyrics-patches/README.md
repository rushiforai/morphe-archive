# YouTube Music 魅族状态栏歌词

在 Flyme 状态栏显示 YouTube Music 的同步歌词，歌词来自 Morphe 官方的 **Third-party lyrics**。

[添加到 Morphe](https://morphe.software/add-source?github=kljjh/flyme-lyrics-patches&name=Flyme%20Lyrics&app=com.google.android.apps.youtube.music&appName=YouTube%20Music) · [下载补丁包](https://github.com/kljjh/flyme-lyrics-patches/releases/latest)

## 安装

1. 在 Morphe 中保留官方补丁来源，并添加本项目来源。也可将下载的 `.mpp` 作为本地补丁包导入。
2. 选择官方歌词补丁支持的原版 YouTube Music APK，在**同一次修补**中勾选官方的 **Third-party lyrics** 和本项目的 **Flyme status bar lyrics**。
3. 安装修补后的应用，在 Morphe 歌词设置中开启**第三方歌词**，并允许 Flyme 显示该应用的媒体通知和状态栏歌词。

手动添加远程来源时，粘贴以下地址：

```text
https://raw.githubusercontent.com/kljjh/flyme-lyrics-patches/main/patches-bundle.json
```

## 歌词设置

- **魅族状态栏歌词**：默认开启。暂停播放或没有匹配的同步歌词时，状态栏歌词会清除。
- **状态栏歌词时间偏移**：位于官方「迷你播放器和媒体会话时间偏移」正下方。默认跟随 MediaSession 偏移（官方默认 −800 ms）。
  取消勾选后，可在 −2000 至 +2000 ms 间按 100 ms 调节。负值提前，正值延后。

本项目为独立社区补丁。歌词由 [Morphe](https://github.com/MorpheApp/morphe-patches) 提供，状态栏显示使用[魅族公开接口](https://open.flyme.cn/docs?id=239)。许可见 [GPLv3](LICENSE) 和 [NOTICE](NOTICE)。
