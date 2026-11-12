# Pixiv-Patched 项目笔记

给未来的自己（或接手的代理）看的工作备忘录。上下文被压缩时，这里的事实不该丢。

## 这是什么

Morphe（ReVanced 一脉）补丁项目，给 Pixiv Android (`jp.pxv.android`) 打补丁，外加一个 Kotlin 扩展 dex（`extensions/pixiv`）。
目标版本：**Pixiv 6.203.0**。反编译参考放在 `_reference/`（`_decode203/` 是 6.203.0，`_decode/` 是旧的 6.202.1）。

## 目录

- `patches/src/main/kotlin/app/morphe/patches/pixiv/` — 各补丁（`*Patch.kt`），`shared/` 放 fingerprint 与常量。
- `extensions/pixiv/src/main/kotlin/app/morphe/extension/pixiv/` — 运行时逻辑（dex 里真正跑的代码）。
  - `ui/` — 侧边栏入口、补丁设置页、图标、文案
  - `search/` — 搜索排序、收藏数门槛
  - `aiflag/` — AI 作品标记
- `patches-list.json` — 补丁清单，**生成物**。
- `README.md` — 补丁表格，**生成物**。

## 构建 / 打包 / 安装

```powershell
cd I:\JBCode\Android\Pixiv
.\gradlew.bat :patches:buildAndroid --no-daemon -q
```

```powershell
cd I:\JBCode\Android\Pixiv\_reference
# mpp 的文件名跟着 gradle.properties 的 version 走，发版后会变！先看 build/libs 里最新的是哪个再填
$mpp = (Get-ChildItem ..\patches\build\libs\patches-*.mpp | Where-Object Name -notmatch "sources|javadoc" | Sort-Object LastWriteTime -Descending | Select-Object -First 1).Name
java -jar _work_morphe_desktop.jar patch -p "..\patches\build\libs\$mpp" --continue-on-error -o "patchtest\v203.apk" apk\pixiv_6.203.0_apkpure.com.apk
adb install -r patchtest\v203.apk
adb shell am start -n jp.pxv.android/.activity.RoutingActivity
```

生成清单与表格（容易忘）：

```powershell
.\gradlew.bat :patches:clean :patches:generatePatchesList --no-daemon   # 不 clean 会读到旧 mpp，清单缺补丁
python .github/scripts/generate_patches_readme.py Piracola/Pixiv-Patched main   # GBK 控制台打印 ✅ 会报错，但文件已写好
```

## 设备与调试

- 物理机，`adb devices` 里是 `8f63b62e`。USB 掉线是常事，`adb kill-server` 后让用户重插。
- 进入补丁页：启动等 9 秒 → `adb shell input tap 65 140`（汉堡）→ `adb shell input swipe 400 2000 400 1100 400` 两次（抽屉滚到底）→ 点 `Pixiv-Patched` 行（位置会变，先 `uiautomator dump` 查 bounds，别硬编坐标）。
- 搜索：底部搜索 tab `(324,2278)` → 点搜索框 `(620,172)` → 历史记录里有 `风景 / 原创 / landscape` 可点。
- `adb shell input text` **只能打 ASCII**；要中文得用 uiautomator 点历史记录，或临时装 ADBKeyboard（用完卸载并还原输入法）。
- 看动画：`adb shell settings put global animator_duration_scale 3`（还有 `window_animation_scale`）；抓帧 `screenrecord --size 480x1080 --bit-rate 4000000` + `ffmpeg -i x.mp4 -vf fps=15 f%02d.png`（ffmpeg 在 `D:\Browser\CommandLine\ffmpeg.exe`），或动画期间连拍 `adb exec-out screencap -p`。**看完必须把两个 scale 调回 1**。
- 界面自动化很容易点错，每次点击前先 `uiautomator dump` 拿 bounds。

## 已确认的 Pixiv 内部事实（都是实测/反编译来的，别再猜）

- 搜索接口 `/v1/search/illust`、`/v1/search/novel`：每页固定 **30 条**，`size` 参数**被服务端忽略**（传 5 或 60 都回 30）。翻页靠响应里的 `next_url`（`offset=30/60/...`）。
- 每条作品有 **`total_bookmarks`**（int）。没有 `bookmarkCount` / `totalBookmarks`。
- 免费账号：`bookmark_num_min` / `bookmark_num_max` 服务端**无视**；网页端 `blt`/`bgt` 文档写的是会员专享。
- 网页 ajax 搜索（`/ajax/search/artworks`、`/ajax/search/illustrations`）用 `p` 翻页，与 App 接口不是一套数据结构。
- 「热门度顺序」在免费账号下由我们的补丁改走 `/v1/search/popular-preview/*`（热度预览），只有 **30 条**，且收藏数都很高（实测 10.7 万～69.7 万）。
- 「最新作品」按时间倒序，新作品收藏数天然低：`风景` 首页 30 条里只有 1 条 ≥500，第二页最高 60。
- 作品详情页：`IllustDetailSingleActivity` / `IllustDetailPagerActivity`（读 `getLongExtra("ILLUST_ID", -1)`），小说 `NovelTextActivity`（`getLongExtra("NOVEL_ID", 0)`，可选 `NOVEL`）。**不要**走 `IntentFilterActivity`——它会转 `RoutingActivity` 启动页，出现满屏 splash。
- 非 exported 的 Activity 用 `am start` 起不来，只能在 App 内测。

### 关于"能不能让服务端帮我们筛收藏数"——**已经彻底试死，别再试了**

- App 接口加 `blt=500` / `bgt=2000` / `bookmark_num_min=500`：返回的 30 个 id 与不加参数**逐字节相同**，全被忽略。
- 网页 ajax 同样加 `blt`/`bgt`：`total` 和 id 列表都不变，免费账号同样无效。
- 网页 ajax 用 App 的 `Authorization: Bearer` 可以通（200，**60 条/页**，带 `total` / `lastPage`），但**条目里没有收藏数字段**（`bookmarkData` 是 null），对按收藏数过滤毫无用处。
- 开源客户端（Pixiv-Shaft、PixEz、Pixiv-MultiPlatform、pixivpy）都只是串行翻 `next_url`，没有任何一家做并行补页或服务端过滤。

结论：**客户端过滤 + 自作主张地补页**是唯一可行路线。

## UI 架构（补丁设置页）

- `ui/PageHost.kt`：**一个**常驻全屏 Dialog 承载所有页面，内部 `FrameLayout` 当页面栈；`push(view)` / `pop()` 用视图位移动画（右进右出），BACK 在宿主统一处理。
- 关键教训：**不要在 `dialog.show()` 之后用 `post{}` 设初始位置**——第一帧已经按最终位置画完，会"闪一下再动画"。要在第一次绘制前把 `translationX` 设好。
- 窗口设了 `PixelFormat.TRANSLUCENT` + 清掉 `FLAG_DIM_BEHIND`，否则滑动时露出的区域是黑的。
- 小选择器是同窗口内的「遮罩 + 卡片」，不是独立窗口——独立小窗口点外面收不到事件，关不掉。

## 补丁与设置（现状）

共 13 个补丁。**App 内能调的东西只有三项**，都在侧边栏的 Pixiv-Patched 页里：
AI 作品显示设置（`AiFilterSettingsView`）、热门搜索排序（`SearchRankingConfig`，关闭/热度预览）、搜索收藏数门槛（`BookmarkThreshold`，0–999999）。
状态区只显示不开开关，历史区只能清空。其余补丁在 Morphe Manager 里选定后就固定，别再往 App 里加开关。

三个热度搜索补丁的关系：`Pixiv Search Ranking`（默认开，依赖 `Pixiv Popular Search Unlock`）、`Pixiv Popular Search Unlock`（默认关）、`Pixiv Popular Search Trial`。会员标志被钉成 true 后，Trial 的流程不再触发。

补丁描述的唯一真源是各 `*Patch.kt` 的 `description`，`patches-list.json` 和 README 英文表都是生成物——改文案要改 Kotlin 再重新生成，别直接手改表格。

OkHttp 钩子：两个补丁都挂在 `OkHttpClient.<init>(OkHttpClient$Builder;)V`，必须保证幂等（`interceptors()` 里判断是否已装）。注意：**每个新建的 OkHttpClient 都会被装上拦截器**，内部再发请求要么用 `ThreadLocal` 标记透传，要么小心递归。

## 工作纪律

- **没得到用户明确同意前不 commit、不 push、不发版。**
- 不在 C 盘创建/下载/删除文件。
- 临时截图、日志、apk 只放 `_reference/patchtest/`（已 gitignore），收尾删干净，别把调试代码留进仓库。
- 汇报要给实测数字，不要脑补；做不到就直说。

## 与用户沟通

中文，简短直接，别长篇大论（用户是 ADHD），也别堆技术细节——他要的是结论和取舍。有不确定的地方先问，不要自己拍板做猜测性方案。
