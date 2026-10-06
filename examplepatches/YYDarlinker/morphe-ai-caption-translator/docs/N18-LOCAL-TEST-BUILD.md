# N18 本地测试包构建记录

- 构建源码：`640905c`（2026-09-30）；未改源码，未调用 API，Gradle 使用 Zulu JDK 21 与 `--offline`。
- 输入：原版 YouTube 21.07.247 APK，SHA-256 `AFED0724C7CBDEC08626573F5E0C405DB76E11FE9BFDAFBC3884690A766666DB`；官方 1.43.0 MPP，SHA-256 `849E8B490554AC6ABF375EFC07D69411A3E60B8966954B3FAF07636D50248505`。组合选择官方兼容默认补丁集及 `AI caption translator`。

| 产物 | 本轮字节 | 比 N16 r2 | SHA-256 |
| --- | ---: | ---: | --- |
| `build/local-test/patches-1.3.5-本地测试包-n18.mpp` | 1,050,413 | +989 | `2D14AA79B04527D153ED2782B19D96DB6B5DFF4BC1C36B61A860A6FFB6CC9461` |
| `build/local-test/extension-1.3.5-本地测试包-n18.mpe` | 2,680,528 | +1,292 | `F9C0DEFFC403C9A798E6F86EBA0AB6DCA0120A0D497CEA14887C5BCF0904EE95` |
| `build/n18-composition/YouTube-21.07.247-本地测试包-n18-unsigned.apk` | 186,000,643 | +608 | `B2BAECC590282F52D0C79C3586AD1668968CEF2CE947EAAFCEBDB8A060E19771` |

使用 `:extensions:extension:assembleRelease :patches:buildAndroid` 构建 MPP/MPE，再以 `:patches:verifyComposition` 编译未签名 APK。补丁执行 **82/82 PASS**，`COMPOSITION_PASS`。仓库 `.github/scripts/verify_bundle.py` 通过；额外确认 MPP ZIP 72 条目、根及扩展 raw DEX 文件头与长度、manifest 版本和仓库标识、14 个 locale，独立 MPE 与内嵌扩展逐字节一致。APK ZIP CRC 通过，含 11 个根级 DEX 和 manifest；`:patches:auditComposition` 的 `DEX_AUDIT_PASS classes=56806`。`apksigner verify` 报 `DOES NOT VERIFY`（无签名 manifest），符合未签名交付。

Java 单测 **376/376**、Python 单测 **27/27**；离线冻结计分板维持 **4 通过 / 4 既有失败 / 4 未验证**，三类不可见时长均为 0，`frozen-baseline.json` Git blob 未变化。第三轮真机验收由用户进行。
