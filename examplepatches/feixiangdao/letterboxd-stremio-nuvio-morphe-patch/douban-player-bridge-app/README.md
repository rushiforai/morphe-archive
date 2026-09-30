# Douban Player Bridge

独立 Android 辅助 App，不修改豆瓣 APK。

## 功能

当你进入官方豆瓣 App 的电影/电视剧详情页时：

```text
[ Stremio ]   [ Nuvio ]
```

两个按钮会以 Accessibility Overlay 形式显示在页面底部。

点击流程：

```text
豆瓣页面标题 / 年份 / 类型
→ Cinemeta 搜索
→ IMDb ID
→ Stremio / Nuvio Deep Link
```

Stremio 无可靠 IMDb 匹配时会降级为 Stremio 搜索。

## 权限

只需要开启 Android **无障碍服务：豆瓣播放器桥接**。

不需要：

- Root
- 修改豆瓣 APK
- 悬浮窗权限
- TMDB API Key

服务会接收窗口切换事件以便在离开豆瓣时隐藏按钮，但只在当前包名是 `com.douban.frodo` 时读取页面节点。

## 使用

1. 安装 Douban Player Bridge APK。
2. 打开 App，点“开启无障碍服务”。
3. 在系统列表中启用“豆瓣播放器桥接”。
4. 正常打开官方豆瓣。
5. 进入电影或电视剧详情页。
6. 页面底部出现 Stremio / Nuvio 按钮。
7. 长按任意按钮可以查看当前识别到的标题、年份和类型。

## 当前版本

v0.1.0 — 第一版真机验证版本。
