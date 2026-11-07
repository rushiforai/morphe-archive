# Penguin Patches

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="../assets/penguin-patches-banner-tailor-dark.png">
  <source media="(prefers-color-scheme: light)" srcset="../assets/penguin-patches-banner-tailor.png">
  <img src="../assets/penguin-patches-banner-tailor.png" alt="Penguin Patches" width="1800">
</picture>

[English](../../README.md) · [Deutsch](README.de.md) · [简体中文](README.zh-CN.md) · [日本語](README.ja.md) · [Español](README.es.md) · [한국어](README.ko.md) · [Português (Brasil)](README.pt-BR.md) · [Français](README.fr.md)

[![Release](https://img.shields.io/github/v/release/pengusto/penguin-patches?label=release)](https://github.com/pengusto/penguin-patches/releases/latest) [![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue)](../../LICENSE) [![Android](https://img.shields.io/badge/platform-Android-3DDC84)](../SETUP.md) [![Morphe compatible](https://img.shields.io/badge/Morphe-compatible-6f42c1)](../SETUP.md)

**让你的应用更好用一点。**

Penguin Patches 是一组独立的 Android 补丁，兼容 Morphe Manager，用于改进或修复现有应用。本项目与 Morphe 和原应用项目均无关联。

> 本页由 AI 翻译，尚未经母语者审校。完整补丁图集和技术指南目前为英文；如有差异，以英文版为准。

## 项目功能

补丁包括可读的日历描述、Feeder 图片缩放、Finamp 设置，以及为 Infinity+ 配置自己的 Reddit OAuth 客户端。具体功能与支持的原始版本请查看补丁目录及对应应用指南。

**支持的应用:** [Feeder](../FEEDER.md) · [Finamp](../FINAMP_NATIVE.md) · [Fossify Calendar](../CALENDAR.md) · [Fossify Clock](../CLOCK.md) · [Fossify Contacts](../CONTACTS.md) · [Fossify File Manager](../FILE_MANAGER.md) · [Fossify Messages](../MESSAGES.md) · [Fossify Music Player](../MUSIC.md) · [Infinity+](../INFINITY.md) · [Komikku](../KOMIKKU.md) · [Kvaesitso](../KVAESITSO.md) · [Mihon](../MIHON.md) · [Read You](../READYOU.md) · [Tasks.org](../TASKS.md)

[**支持的应用和准确版本 →**](../../README.md#generated-patch-catalogue)

## 修改前后

示例：应用补丁后，Finamp 会将专辑艺人排在其他参与者之前。图片来自使用合成音乐数据的真实 Android APK 测试。

| 修改前：其他参与者排在专辑艺人之前 | 修改后：专辑艺人排在最前 |
| :---: | :---: |
| <img src="../../tests/finamp/evidence/2026-10-28/credits-before.png" alt="修改前：其他参与者排在专辑艺人之前" width="360"> | <img src="../../tests/finamp/evidence/2026-10-28/credits-after.png" alt="修改后：专辑艺人排在最前" width="360"> |

[查看所有补丁对比](../../README.md#patch-previews) · [截图及验证记录](../../tests/finamp/evidence/2026-10-28/README.md)

## 补丁概览

- [可见会话不再产生通知](../../README.md#preview-avoid-notifications-for-visible-conversations)
- [选择闹钟提前提醒时间](../../README.md#preview-choose-upcoming-alarm-notification-time)
- [为 Infinity+ 配置自定义 OAuth 客户端](../../README.md#preview-configure-custom-oauth-for-infinity)
- [标记已读时清除通知](../../README.md#preview-dismiss-notifications-when-marking-conversations-read)
- [Finamp Complete：全部八项改进](../../README.md#preview-finamp-complete-all-eight-fixes)
- [导入嵌套 OPML 订阅源](../../README.md#preview-import-nested-opml-feeds)
- [后台会话保持未读](../../README.md#preview-keep-background-conversations-unread)
- [重命名或删除文件夹后同步收藏](../../README.md#preview-keep-favorites-consistent-after-folder-rename-or-removal)
- [排除搜索时保留本地漫画](../../README.md#preview-keep-local-manga-in-exclusion-searches)
- [转到父任务](../../README.md#preview-navigate-to-the-parent-task)
- [优先使用曲目内嵌封面](../../README.md#preview-prefer-each-track-s-embedded-cover)
- [保留排除删除的默认分类下载](../../README.md#preview-preserve-excluded-default-category-downloads)
- [以可读形式显示日历描述](../../README.md#preview-readable-calendar-descriptions)
- [恢复搜索菜单中的小组件编辑](../../README.md#preview-restore-widget-editing-from-the-search-menu)
- [为全天事件单独设置默认提醒](../../README.md#preview-separate-all-day-reminder-defaults)
- [显示合并联系人中的邮箱和备注](../../README.md#preview-show-emails-and-notes-from-merged-contacts)
- [放大文章图片](../../README.md#preview-zoom-article-images)

## 安装

1. [Penguin Patches → Morphe](https://morphe.software/add-source?github=pengusto/penguin-patches). 将 Penguin Patches 添加为 Morphe 来源。如果链接无法打开，请在 Morphe Manager 中选择“Sources → Add → Remote”，然后输入仓库地址。
2. 在补丁目录中打开应用指南，核对原始 APK 的准确版本、发行变体和 SHA-256，然后选择补丁及选项。
3. 应用补丁，使用已备份的 Morphe 密钥签名并安装。依赖该功能前，请先用可丢弃的数据进行检查。

**请先备份：** 补丁保留原应用的包名。使用不同证书签名的 APK 无法直接更新现有安装。请备份应用数据和签名密钥，不要仅为绕过签名冲突而卸载原应用。

[完整安装与签名指南 →](../SETUP.md)

## 状态与限制

仅验证了各指南中注明的原始 APK。验证记录区分打补丁的官方 APK 与单独测试的源码分支。实体设备尚未验证；其他限制请参阅各应用指南。

稳定版来自 `main`；仅在有意测试后续更新时启用 `dev` 预发布版。Infinity+ 需要你自己的、已获授权的 Reddit OAuth 客户端。

[验证记录和限制](../VERIFICATION.md) · [Infinity+](../INFINITY.md) · [Finamp](../FINAMP_NATIVE.md)

## 技术栈

补丁定义使用 Kotlin，Android 运行时辅助代码使用 Java，并由 Gradle 构建。开发指南列出了 Java 21、Android SDK 和软件包注册表访问权限等前提条件。

## 开发与帮助

[构建和参与贡献](../DEVELOPMENT.md) · [上游工作与路线图](../ROADMAP.md) · [报告问题](https://github.com/pengusto/penguin-patches/issues/new/choose) · [支持开发](https://github.com/sponsors/pengusto)

## 许可证与来源

项目代码采用 GPL-3.0。项目名称、第三方代码和图片的说明见 NOTICE 与来源记录。

[GPL-3.0](../../LICENSE) · [NOTICE](../../NOTICE) · [来源和图片说明](../PROVENANCE.md)
