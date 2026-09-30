# Stremio + Nuvio Bridge

给 Android 版 Letterboxd 的电影详情页增加两个独立按钮：

- **Stremio**
- **Nuvio**

两个按钮都直接复用 Letterboxd 自己已有的 IMDb ID，不需要 TMDB API Key，也不需要额外的 ID 转换服务。

## 效果

有 Trailer：

```text
Trailer
Stremio
Nuvio
```

没有 Trailer：

```text
Stremio
Nuvio
```

## Deep Link

Stremio:

```text
stremio://detail/movie/ttXXXXXXX/ttXXXXXXX
```

Nuvio:

```text
nuvio://movie/ttXXXXXXX
```

Nuvio 当前实现和社区桥接项目均使用/支持按 IMDb ID 打开影片的 deep link。不同 Nuvio 分支或旧版本如果没有注册该 scheme，按钮会提示无法打开，不会导致 Letterboxd 崩溃。

## 构建

### 自动构建

进入：

**Actions → Build patch → Run workflow**

构建完成后，下载名为：

```text
letterboxd-player-bridge
```

的 Artifact，其中包含 `.mpp` 补丁文件。

### 发布为 Morphe Patch Source

进入：

**Actions → Publish patch source → Run workflow**

输入版本号，例如：

```text
0.1.0
```

工作流会：

1. 构建 `.mpp`
2. 创建 GitHub Release
3. 生成 `patches-list.json`
4. 生成 `patches-bundle.json`
5. 创建对应的 `v0.1.0` Tag

之后可尝试在 Morphe Manager 的 Patch Sources 中添加：

```text
github.com/feixiangdao/letterboxd-stremio-nuvio-morphe-patch
```

## 已知兼容基线

按钮注入点基于上游项目对以下版本的逆向确认：

- Letterboxd 3.5.3
- versionCode 495

兼容声明使用 `version = null`，意味着只要 Letterboxd 没有重命名对应 class/method，后续版本通常仍可匹配；这并不代表所有未来版本均已实机验证。

## 上游项目

本项目的 Letterboxd 注入点和 Stremio 按钮实现基于：

`ethanm6/letterboxd-stremio-morphe-patch`

在此基础上增加了独立 Nuvio 按钮，并整理为双播放器版本。

## 免责声明

这是非官方项目，与 Letterboxd、Stremio、Nuvio 或 Morphe 均无隶属、授权或背书关系。修改第三方 APK 可能受其服务条款约束，请自行评估。

## License

GPL-3.0。详见 `LICENSE` 与 `NOTICE`。


## 豆瓣支持

v0.2.0 起支持用户提供的 **豆瓣 7.135.0（versionCode 363）** APK。

豆瓣使用 NetEase NIS 加固，因此补丁不是直接修改被保护的 `MovieActivity2` 字节码，而是注入壳层 `InstrumentationProxy.callActivityOnCreate`。运行后识别真实的：

```text
com.douban.frodo.subject.struct2.MovieActivity2
```

并在电影 / 剧集详情页叠加两个独立按钮：

```text
[ Stremio ] [ Nuvio ]
```

影片匹配流程：

```text
豆瓣当前详情页
→ 运行时读取标题 / 原名 / 年份 / movie|tv
→ Stremio 官方 Cinemeta 搜索
→ IMDb ID
→ Stremio / Nuvio Deep Link
```

不需要 TMDB API Key。

调试：长按任意一个按钮，会显示补丁当前从豆瓣详情页识别到的 ID、标题、原名、年份、类型和 IMDb ID，方便排查特殊影片。


### v0.2.1 启动兼容修正

v0.2.0 直接注入 NIS 的 `InstrumentationProxy.callActivityOnCreate`，部分设备会停在豆瓣启动 Logo。

v0.2.1 改为更保守的链路：

```text
NIS MyApplication.onCreate 即将返回
→ 注册轻量 ActivityLifecycleCallbacks
→ 豆瓣 MovieActivity2 已经 resumed
→ 再加载按钮运行时代码
```

豆瓣运行时代码现在使用独立的 `extensions/douban.mpe`，不再把 Letterboxd 所需的 AndroidX / Material 扩展一起注入。

另外增加一个默认关闭的诊断补丁：

```text
Diagnostic: Douban repackaging only
```

它不修改任何功能代码，也不注入扩展。只选择这个补丁后重新打包，可以判断当前豆瓣/NIS 版本是否单纯因为 Morphe 重打包/重签名而无法启动。
