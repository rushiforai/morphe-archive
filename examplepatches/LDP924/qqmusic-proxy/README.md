# LDP924 QQMusic Patch（Morphe）

QQ音乐 Morphe 补丁。**关于页连点 6 次**（官方诊断入口彩蛋）出现时弹出
服务器设置弹窗；配置后全部 `musicu.fcg / musics.fcg` 请求重定向到
自建服务器，**未配置时零生效**。

## 补丁

| 补丁 | 作用 |
|---|---|
| `About page server switch` | 关于页诊断入口隐藏 Host/Port 服务器设置 |
| `CGI host redirect` | t.y.qq.com / ut.y.qq.com → 自定义服务器（运行时读取，空值回官方） |

## Morphe Manager 使用

1. 补丁源添加本仓库（或 Releases 里的 `.mpp`）
2. 选择 QQ 音乐 → 勾选两个补丁 → 打包
3. 设置 → 关于 QQ 音乐 → 连点 logo 6 次 → Server 设置弹窗
4. 填 host:port（IPv4/IPv6）→ Save → 重启 App

## 构建

```
./gradlew :patches:build   # 产出 patches/build/libs/patches-*.mpp
```

需要 Java 21。CI（GitHub Actions）push main 自动构建并发布 Release。

## 隐私

补丁不含任何服务器地址/账号信息，配置存本机 SharedPreferences。

MIT License
