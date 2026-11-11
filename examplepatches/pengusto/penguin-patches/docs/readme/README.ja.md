# Penguin Patches

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="../assets/penguin-patches-banner-tailor-dark.png">
  <source media="(prefers-color-scheme: light)" srcset="../assets/penguin-patches-banner-tailor.png">
  <img src="../assets/penguin-patches-banner-tailor.png" alt="Penguin Patches" width="1800">
</picture>

[English](../../README.md) · [Deutsch](README.de.md) · [简体中文](README.zh-CN.md) · [日本語](README.ja.md) · [Español](README.es.md) · [한국어](README.ko.md) · [Português (Brasil)](README.pt-BR.md) · [Français](README.fr.md)

[![Release](https://img.shields.io/github/v/release/pengusto/penguin-patches?label=release)](https://github.com/pengusto/penguin-patches/releases/latest) [![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue)](../../LICENSE) [![Android](https://img.shields.io/badge/platform-Android-3DDC84)](../SETUP.md) [![Morphe compatible](https://img.shields.io/badge/Morphe-compatible-6f42c1)](../SETUP.md)

**いつものアプリを、少し便利に。**

Penguin Patches は、既存アプリの機能を改善・修正する、Morphe Manager 対応の独立した Android パッチ集です。Morphe や各アプリの開発元とは関係ありません。

> このページは AI による翻訳で、母語話者の確認は受けていません。パッチの詳細ギャラリーと技術ガイドは現在英語です。内容が異なる場合は英語版を優先してください。

## できること

カレンダーの説明を読みやすくする修正、Feeder の画像拡大、Finamp の設定、Infinity+ 用の独自 Reddit OAuth クライアントなどを提供します。対象機能と対応する元 APK のバージョンは、一覧と各アプリのガイドで確認してください。

**対応アプリ:** [Feeder](../FEEDER.md) · [Finamp](../FINAMP_NATIVE.md) · [Fossify Calendar](../CALENDAR.md) · [Fossify Clock](../CLOCK.md) · [Fossify Contacts](../CONTACTS.md) · [Fossify File Manager](../FILE_MANAGER.md) · [Fossify Messages](../MESSAGES.md) · [Fossify Music Player](../MUSIC.md) · [Infinity+](../INFINITY.md) · [Komikku](../KOMIKKU.md) · [Kvaesitso](../KVAESITSO.md) · [Mihon](../MIHON.md) · [Read You](../READYOU.md) · [Tasks.org](../TASKS.md)

[**対応アプリと正確なバージョン →**](../../README.md#generated-patch-catalogue)

## 変更前と変更後

例：Finamp では、パッチ適用後にアルバムアーティストが他の参加者より先に表示されます。画像は合成音楽データを使った実際の Android APK の記録です。

| 変更前：他の参加者がアルバムアーティストより先 | 変更後：アルバムアーティストが先頭 |
| :---: | :---: |
| <img src="../../tests/finamp/evidence/2026-10-28/credits-before.png" alt="変更前：他の参加者がアルバムアーティストより先" width="360"> | <img src="../../tests/finamp/evidence/2026-10-28/credits-after.png" alt="変更後：アルバムアーティストが先頭" width="360"> |

[すべての比較を見る](../../README.md#patch-previews) · [画像と検証記録](../../tests/finamp/evidence/2026-10-28/README.md)

## パッチ一覧

- [表示中の会話では通知を抑制](../../README.md#preview-avoid-notifications-for-visible-conversations)
- [アラームの事前通知時間を選択](../../README.md#preview-choose-upcoming-alarm-notification-time)
- [Infinity+ に独自 OAuth クライアントを設定](../../README.md#preview-configure-custom-oauth-for-infinity)
- [既読にした会話の通知を削除](../../README.md#preview-dismiss-notifications-when-marking-conversations-read)
- [Finamp Complete](../../README.md#preview-finamp-complete)
- [入れ子の OPML フィードをインポート](../../README.md#preview-import-nested-opml-feeds)
- [バックグラウンドの会話を未読に保持](../../README.md#preview-keep-background-conversations-unread)
- [フォルダー変更・削除後のお気に入りを整合](../../README.md#preview-keep-favorites-consistent-after-folder-rename-or-removal)
- [除外検索でローカル漫画を保持](../../README.md#preview-keep-local-manga-in-exclusion-searches)
- [親タスクへ移動](../../README.md#preview-navigate-to-the-parent-task)
- [曲ごとの埋め込みカバーを優先](../../README.md#preview-prefer-each-track-s-embedded-cover)
- [除外した既定カテゴリのダウンロードを保持](../../README.md#preview-preserve-excluded-default-category-downloads)
- [カレンダーの説明を読みやすく表示](../../README.md#preview-readable-calendar-descriptions)
- [検索メニューのウィジェット編集を復元](../../README.md#preview-restore-widget-editing-from-the-search-menu)
- [終日の予定に別の既定リマインダー](../../README.md#preview-separate-all-day-reminder-defaults)
- [統合連絡先のメールとメモを表示](../../README.md#preview-show-emails-and-notes-from-merged-contacts)
- [記事内の画像を拡大](../../README.md#preview-zoom-article-images)

## インストール

1. [Penguin Patches → Morphe](https://morphe.software/add-source?github=pengusto/penguin-patches). Penguin Patches を Morphe のソースに追加します。リンクが開かない場合は、Morphe Manager の「Sources → Add → Remote」でリポジトリ URL を入力します。
2. 一覧からアプリのガイドを開き、指定された元 APK の正確なバージョン、配布形式、SHA-256 を確認してから、パッチとオプションを選択します。
3. パッチを適用し、バックアップした Morphe の鍵で署名してインストールします。本格利用の前に、消去可能なデータで動作を確認してください。

**先にバックアップ：** パッチは元アプリのパッケージ ID を保持します。異なる証明書で署名した APK は既存アプリを直接更新できません。アプリデータと署名鍵を保管し、署名の競合を避けるためだけに既存アプリを削除しないでください。

[セットアップと署名の詳細 →](../SETUP.md)

## 状態と制限

検証対象は各ガイドに記載された元 APK のみです。検証記録では、パッチ適用済み公式 APK と別途テストしたソースフォークを区別しています。実機では未検証です。その他の制限は各ガイドを参照してください。

安定版は `main` から提供されます。`dev` のプレリリースは今後の変更を試す場合のみ有効にしてください。Infinity+ には、承認された独自の Reddit OAuth クライアントが必要です。

[検証記録と制限](../VERIFICATION.md) · [Infinity+](../INFINITY.md) · [Finamp](../FINAMP_NATIVE.md)

## 技術構成

パッチ定義には Kotlin、Android ランタイムの補助コードには Java を使い、Gradle でビルドします。開発ガイドには Java 21、Android SDK、パッケージレジストリへのアクセスなどの前提条件を記載しています。

## 開発とヘルプ

[ビルドと貢献](../DEVELOPMENT.md) · [上流への貢献とロードマップ](../ROADMAP.md) · [問題を報告](https://github.com/pengusto/penguin-patches/issues/new/choose) · [開発を支援](https://github.com/sponsors/pengusto)

## ライセンスと出典

プロジェクトのコードは GPL-3.0 です。プロジェクト名、第三者コード、画像に関する注意事項は NOTICE と出典情報をご覧ください。

[GPL-3.0](../../LICENSE) · [NOTICE](../../NOTICE) · [出典と画像のクレジット](../PROVENANCE.md)
