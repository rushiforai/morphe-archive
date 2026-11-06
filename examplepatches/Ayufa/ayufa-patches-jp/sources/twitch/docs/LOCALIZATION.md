# 日本語化の方針と範囲（twitch-patched-ja）

## 前提

本家のパッチには Android の文字列リソース（strings.xml）の仕組みが無く、表示文字列はすべてソースコード内に直接書かれている。そのため piko-newx-ja のようなリソース差し替え（オーバーレイ）はできず、Equicord JA と同じく **コピー側リポジトリで文字列を直接翻訳する** 方式を取る。本家の更新をマージするたびに、翻訳行で競合が起きる可能性がある（対処は `docs/UPSTREAM.md`）。

## 翻訳するもの

ユーザーに見える表示文字列のみ。

- パッチ設定画面（拡張機能の Java コード）
  - `extensions/twitch/src/main/java/dev/twitchpatches/extension/settings/SettingSection.java`（セクション名10件）
  - 各機能の設定項目名と説明: `ads/AdSettings.java`、`channelpoints/ChannelPointsSetting.java`、`chat/DeletedMessageSettings.java`、`emotes/EmoteSetting.java`、`emotes/FavoriteEmotes.java`、`promotions/PromotionSettings.java`、`promotions/SubscriptionBannerSettings.java`、`reload/ReloadRuntime.java`、`ui/UiSettings.java`、`ui/UiOptions.java`、`ui/UiFeatureRegistry.java` の集計表示
  - 画面まわり: `settings/PatchSettingsPage.java`、`settings/TwitchSettingsToolbar.java`（タイトル「パッチ設定」と「戻る」）、`settings/SettingsSearchBar.java`（検索ヒントとクリア）、`settings/TwitchSettingsRows.java`（検索結果なしの表示）
  - お気に入りの追加・削除ラベル: `emotes/FavoriteEmoteCard.java`、`emotes/FavoriteEmoteMenu.java`
  - 削除済みメッセージのラベル: `chat/DeletedMessageLabel.java`（「（削除済み）」）
- Morphe のパッチ選択画面（パッチ定義の Kotlin コード）
  - 全13パッチの説明（`patches/src/main/kotlin/dev/twitchpatches/patches/twitch/` 配下の各 Patch ファイル）。パッチ名は本家の英語名のまま（パッチャーが名前順に実行するため、名前は絶対に翻訳しない恒久ルール。詳細は統合リポジトリの `docs/LOCALIZATION.md`）
  - 対応バージョンの説明（`shared/TwitchTarget.kt`）
  - Twitch 本体の設定一覧に出る入口名「パッチ設定」（`settings/SettingsPatch.kt` の const-string）
- React Native 側の表示文字列（`patches/src/main/resources/reactnative/`）
  - `emote-favorites.js`（お気に入りの追加・削除、セクション名）、`reload-control.js`（トーストとアクセシビリティラベル）、`emote-details.js`（エモート種別ラベル）、`ui-settings.js`（UI設定への入口）

初回（本家 v1.5.0 時点）の翻訳件数は、テストの期待値更新を除いて約120件。

## 翻訳しないもの

- 設定キー、SharedPreferences のキー、URL スキームなどの内部識別子（互換性のため絶対に変えない）
- ブランド名・サービス名・プロバイダー名: Twitch、BTTV、7TV、FrankerFaceZ、Twitch Turbo、Hype Train のような固有名詞のうち本家表記が定着しているもの（ハイプトレイン等、カタカナ表記が自然なものは訳す）
- 例外メッセージ、ログ、内部エラー文字列（診断用で、コード側で参照される場合もあるため）
- テストコード内のダミー文字列（テスト自体が作る見本データ）

## テストの期待値

翻訳済み文字列を検証している次のテストは、期待値を日本語に合わせて更新している。

- `extensions/twitch/src/test/java/dev/twitchpatches/extension/ui/UiFeatureRegistryTest.java`
- `extensions/twitch/src/test/java/dev/twitchpatches/extension/settings/SettingsSearchTest.java`（検索結果の文脈に出るセクション名の期待値）
- `scripts/tests/react-native-emote-favorites.test.cjs`、`react-native-emote-favorite-cards.test.cjs`、`react-native-emote-details.test.cjs`、`react-native-ffz.test.cjs`、`react-native-reload.test.cjs`、`react-native-ui-settings.test.cjs`

## 表記の方針

- 設定名は簡潔に（本家 AGENTS.md の「簡潔なラベル」方針に合わせる）。
- 説明文は元の文末ピリオドに合わせて「。」で終える。
- 件数表示は「{全体}件中{一部}件を非表示中です。」のように、日本語の語順に入れ替える（コード側の文字列連結の順序も合わせて変更している）。
