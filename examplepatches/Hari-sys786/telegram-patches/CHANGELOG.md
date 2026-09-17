## [1.0.2](https://github.com/Hari-sys786/telegram-patches/compare/v1.0.1...v1.0.2) (2026-09-15)

### 🐛 Bug Fixes

* **Toolchain:** build the bundle against `morphe-patcher` **1.8.0** (Gradle 9.6.1, `app.morphe.patches`
  plugin 1.3.3) instead of 1.11.0. The bundle manifest advertises its patcher version, and Morphe
  refuses to load a bundle built for a newer patcher than the manager ships — the previous bundle
  (`Patcher-Version: 1.11.0`) was therefore not offered by the manager at all. 1.8.0 matches the
  reference Morphe sources that load correctly everywhere.

## [1.0.1](https://github.com/Hari-sys786/telegram-patches/compare/v1.0.0...v1.0.1) (2026-09-15)

### 🐛 Bug Fixes

* **Compatibility:** declare the verified app version (Telegram `12.10.1`) as a concrete app target
  instead of an unconstrained target. Morphe only treats a source as compatible when it can match the
  app **version**, so the previous metadata reported `Any` and Morphe Manager fell back to expert mode
  with its own built-in universal patches instead of this source. Unverified versions are now offered
  as an *experimental* target.

## [1.0.0](https://github.com/OWNER/telegram-patches/releases/tag/v1.0.0) (2026-09-15)

### ✨ New Features

* **Telegram:** first public release of the Morphe patch bundle, porting the `tgpatcher.py` feature
  set to Morphe bytecode patches: signature-verification bypass, premium unlock (UserConfig +
  Stories + PremiumPreviewFragment + premium-feature-available), download speed boost, upload speed
  boost, forbidden-forward bypass, banned-channel access (both gates), media saving everywhere,
  premium-locked content unlock, screenshots enabled, sponsored messages and proxy-sponsored
  channels removed, secret media enabler, and the Cherrygram-style **Delete Account** dialog
  (menu entry + 20s countdown + `account.deleteAccount` + logout).
* **Telegram:** add the `Raise max account count` patch — `UserConfig.getMaxAccountCount()` returns
  999 instead of the stock 3 (5 with premium).

### ✨ 新功能

* **Telegram:** 首个公开版本，将 `tgpatcher.py` 的功能移植为 Morphe bytecode patches：签名校验绕过、
  Premium 解锁（UserConfig / Stories / PremiumPreviewFragment / premium-feature-available）、
  下载加速、上传加速、禁止转发绕过、被封频道访问、随处保存媒体、解锁 Premium 锁定内容、启用截图、
  去除赞助消息与代理赞助频道、Secret Media，以及 Cherrygram 风格的 **Delete Account** 对话框。
* **Telegram:** 新增 `Raise max account count` patch：`UserConfig.getMaxAccountCount()` 返回 999。

### ⚠️ Not included

* Anti-messages-delete and AyuGram ghost mode are intentionally **not** part of this source.
