# TimeTree 去广告 Morphe 补丁包

针对 **TimeTree**（`works.jubilee.timetree`，v15.34.1 / versionCode 780）的自定义 [Morphe](https://github.com/MorpheApp/morphe-patches) 补丁，附一套不依赖 Morphe 工具链的直接重打包脚本。

三个补丁互相独立，可单独启用：

| 补丁 | 作用 | 打的点 |
|---|---|---|
| `Remove in-app ads` | 广告流整体替换成 `AdsAdModel.Empty`，日历页 / 活动页 / 事件创建页的 banner 与信息流广告不再渲染 | 广告流 lambda 的 `invoke(Object):Object` |
| `Remove splash/open ads` | 开屏广告页 `SplashAdsActivity` 直接走「无广告可投」分支并 `finish()` | `SplashAdsActivity` 的无参 void 门控方法 |
| `Disable ad slot flags` | 服务端下发的 `AdsConfigModel` 里所有广告位开关强制 false，UI 不再建广告 item 与占位 | `AdsConfigModel.<init>` 的布尔参数 |

## 为什么是这三处

TimeTree 的广告不是挂一个 AdMob 横幅就完事：

1. App 启动/定时向自家 API（`api.timetreeapp.com`）拉 `AdsConfigModel`，里面是一组开关（`optout`、`enableDaily`、`enableCreation`、`enableActivities`、`enableEventDetail` 等）加各 SSP 配置（Google Ad Manager、OpenWrap/AdMixer、NasMedia、Pangle、Amazon APS）。
2. 每个广告位由一个 RxJava 流产出 `AdsAdModel`（`TimeTree.Daily.*`、`TimeTree.Monthly.*`、`TimeTreeMoloco.MonthlyVideo` …），UI 按子类型渲染卡片 / banner / 视频位。
3. 广告位关掉时，流里还会塞一个 `AdsAdModel.TimeTree.Monthly.DefaultAd.Premium`，也就是「升级 Premium 去广告」的自推广位。

所以只关开关会留下 Premium 自推广位，只删 UI 会留下占位高度。补丁直接在流源头产出 `AdsAdModel.Empty` —— 这是 App 自己就支持的「没有广告」状态，UI 什么都不画、也不占位。

## 方案 A：Morphe 补丁包（可长期维护）

需要 JDK 17+、Gradle 9.x，以及一个有 `read:packages` 权限的 GitHub token（`app.morphe.patches` 插件托管在 GitHub Packages）：

```bash
export GITHUB_ACTOR=<GitHub 用户名>
export GITHUB_TOKEN=<read:packages 的 PAT>

cd TimeTreeAdsPatch
./gradlew build buildAndroid     # Windows: gradlew.bat build buildAndroid
# 产物: patches/build/libs/patches-1.0.0.mpp
```

`.mpp` 放进 Morphe Manager（Patches → 添加本地补丁包），或用 Morphe CLI：

```bash
java -jar morphe-cli.jar patch \
  -p patches/build/libs/patches-1.0.0.mpp \
  --exclusive \
  -o TimeTree_patched.xapk \
  TimeTree_15.34.1.xapk
```

`--exclusive` = 只用本包的补丁，不去拉官方 patch 源。

指纹设计（App 更新后看这里）：

- `AdsStreamFingerprint` —— 用 `AdsTimeTreeRequestParam` 这个**未混淆**的 domain 类型定位 lambda，不用 `Lbo;` 这种会被 R8 改名的合成类名；
- `AdsConfigConstructorFingerprint` —— 用构造器参数表定位，参数表跟着 JSON 字段走，一般稳定；
- `SplashAdsGateFingerprint` —— 用「无参 void + 读写自身 boolean 字段 + 读对象字段」的结构特征定位。

任一指纹失配时 Morphe 抛 `PatchException` 而不是产出坏包；把 `AppTarget(version = ...)` 改成新版本号重跑，就能看出是哪一个失配。

## 发布到 GitHub，再从手机导入

Morphe Manager 的 **Sources** 页支持三种来源：GitHub/GitLab 仓库、`patches-bundle.json` 直链、本地 `.mpp` 文件。仓库路线能自动更新，推荐。

### 1. 建仓库并推上去

```bash
cd TimeTreeAdsPatch
git init -b main
git add -A
git commit -m "feat: TimeTree ad remover patch bundle"
git remote add origin https://github.com/Rico957/timetree-ads-patch.git
git push -u origin main
```

把这三处的 `Rico957` 换成你的 GitHub 用户名（`patches/build.gradle.kts` 的 `source`/`contact`/`website`，以及 `patches-bundle.json` 的 `download_url`）。

### 2. 打 tag 触发构建

```bash
git tag v1.0.0
git push origin v1.0.0
```

`.github/workflows/release.yml` 会：装 JDK 21 + Android SDK → `./gradlew :patches:build -Pversion=1.0.0` → 产出 `patches-1.0.0.mpp` → 上传到 Release `v1.0.0` → 把刷新过的 `patches-bundle.json`（带正确的 `download_url`）提交回 main。

`app.morphe.patches` 插件和 patches-library 在 GitHub Packages，workflow 里用 `secrets.GITHUB_TOKEN` 读取（已有 `packages: read` 权限），**不需要你另外配 PAT**。

构建产物同时作为 artifact 挂在 Actions 运行记录里，也能直接下载。

### 3. 手机上添加补丁源

Morphe → 底部 **Sources** → 右上 **+** → **Remote** 标签，粘贴：

```
github.com/Rico957/timetree-ads-patch
```

也可以直接贴元数据地址：

```
raw.githubusercontent.com/Rico957/timetree-ads-patch/main/patches-bundle.json
```

点 **Add**，Morphe 会读 `patches-bundle.json`、按 `download_url` 拉 `.mpp`。之后每次你发新 release，手机上会出现更新提示，不用手动重下。

想一步到位可以用 deep link，直接在手机浏览器打开：

```
https://morphe.software/add-source?github=Rico957/timetree-ads-patch&name=TimeTree
```

### 4. 不想用 remote，走本地文件

`+` → **Local** 标签 → 选 `patches-1.0.0.mpp`（从 Release 下载到手机即可）。本地源不自动更新，换版本时点源卡片上的 **Update** 重新选文件；Morphe 按 bundle 名识别为同一源的更新，补丁选择会保留。

### 5. 打补丁

Sources 里能看到 `TimeTree Ad Remover`（3 patches）后：首页会多出 TimeTree 卡片 → 提供原版 APK/XAPK（15.34.1）→ Simple 模式直接 Patch，Expert 模式可以只勾其中一两个补丁 → 装。

三个补丁都是可选的：想更保守就只开 `Remove in-app ads`。

## 方案 B：直接重打包（不需要 token，已验证跑通）

`tools/` 下是一套等价的 apktool 流程，**产出的就是本目录同级的 `TimeTree_15.34.1_no-ads.xapk`**：

```powershell
.\TimeTreeAdsPatch\tools\build-patched-apk.ps1 `
  -Xapk .\TimeTree_15.34.1.xapk `
  -ApktoolJar .\apktool_2.12.0.jar `
  -JavaHome C:\path\to\jdk21 `
  -BuildTools C:\path\to\android-sdk\build-tools\34.0.0
```

流程：`apktool d -r`（**只解代码，不碰资源**）→ `apply_smali_patch.py` → `apktool b` → 去掉 apktool 多生成的 `assets.dex` → `zipalign -p 4` → `apksigner` 签 base 与所有 split（同一 keystore）→ 重新打包 XAPK。

必须 `-r` 的原因：TimeTree 的 `resources.arsc` 里 `state_swiped`、`glance_isTopLevelLayout`、`state_with_icon` 这些属性只有 `styleable` 引用、没有 `<attr>` 声明，aapt2 链接时会直接报 `attribute ... not found`。

`apply_smali_patch.py` 是幂等的，重复跑只会打印 `skip`；三处改动全部命中才返回 0。

## 安装

- **XAPK**：SAI / XAPK Installer 直接装（split 结构保留，native lib 与 mdpi 资源都在）。也可以把 `TimeTree_15.34.1_no-ads.xapk` 传到 GitHub Release 当附件，手机点一下就能下。
- 签名与原版不同，需先卸载原版；TimeTree 的日历数据在服务端账号里，卸载重装后登录同一账号即可。

> 仓库必须是 **public**：Morphe 拉 `patches-bundle.json` 和 Release 里的 `.mpp` 时走的是匿名 HTTP，private 仓库会直接 `Metadata N/A`。

## 已知边界

- 补丁只掐「展示」与「广告位创建」，App 仍可能向自家 API 发广告相关请求（`/ad_log_event/` 之类）。想去网络请求可在补丁里再加一层 SSP 初始化拦截，但那会拉长启动路径、增加回归风险，默认不做。
- 广告 SDK（AppLovin、ironSource、Pangle、Amazon APS、Moloco、FAN）仍在包里。它们只在对应广告位被激活时才真正工作，广告位关掉后不会初始化。
