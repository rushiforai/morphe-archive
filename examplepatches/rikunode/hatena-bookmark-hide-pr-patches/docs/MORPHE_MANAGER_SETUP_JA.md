# はてなブックマーク5.80用 Morpheパッチ（v0.4.2実験版）

Morphe Managerで利用するパッチソース：

```text
https://github.com/rikunode/hatena-bookmark-hide-pr-patches
```

**v0.4.2はランキングお知らせ非表示を追加した試験版。5.80 / versionCode 58000専用**。5.84には現在の公開ソースv0.4.2を適用できません（旧5.84版v0.1.1はPairipにより起動不能と確認済み）。

公開ファイルのSHA256照合、GitHub Actionsのクリーン環境ビルド、GitHub URLからのMorphe Desktopでの2パッチ取得・適用まで成功。Android版Managerはmainブランチの`patches-bundle.json`から配布URLを読み込むので、**GitHubの試験版指定によるファイル取得も可能な構成**。ただしManager実機表示は未確認。PC版Morphe DesktopでURLを直接指定する場合に限り、`--prerelease`が必要だった。

## 目的と仕様

- **Hide native PR entries from article feeds**: 一覧の内部モデル `isPrEntry()` を確認し、PR記事だけをフィルタリング。通常記事では既存のミュート処理を維持。
- **Hide weekly bookmark ranking announcement**: `TopFragment.showAnnouncement`で「ブクマ数ランキング」を含むお知らせのみ非表示。`hideWeeklyRanking`（デフォルトON）で切替。**v0.3.0は実機でコードサイズのガードが失敗。v0.3.1で128→64 code unitsに修正したが、修正版の実機適用は未確認**。
- **Clone Hatena Bookmark for safe side-by-side testing**: 公式5.84を残し、5.80改造版を `com.hatena.android.bookmark.morphe` の別アプリとして追加する。Androidマニフェスト内の独自権限とContentProvider識別子3件も変更する。設定やログイン状態は自動移行しない。

3パッチは標準で有効（ランキング非表示のみbooleanオプションで切替可）。

## 手順（実験版として公開された後）

1. Morphe Managerのパッチソースへ上記GitHub URLを追加し、ソースを更新する。
2. **v0.4.2・パッチ4件**が表示されるか確認。0件なら中止し、表示画面を共有。
3. 入力APKを **5.80 / versionCode 58000** に指定し、該当パッチ4件を選ぶ。5.84を誤って指定しない。
4. Morpheでビルドし、署名された出力を確認する。
5. 元アプリを消さず、Androidの保護警告があれば無効化せずに原因を確認。まずログインせずに一覧表示を試す。正常記事が見えてPR記事がないことを確認してから利用範囲を広げる。

## 検証済みと未検証

v0.2.0では実際のAndroidで通常記事と広告記事の同時表示が確認された。原因はミュート設定なしの一覧取得でフィルタが呼ばれないこと。v0.2.1では日付付き記事一覧へ変換する直前に無条件PRフィルタを追加。**v0.2.1でのPR広告除去は利用者が実機確認済み**。v0.3.0のランキング非表示パッチはコードサイズガード（誤128、正64）で実機適用に失敗。v0.3.1の修正版は実機未確認。

確認済み：元APK v2/v3署名、元APKと同一SHA256、Pairipクラス非検出、5.80用Morphe2パッチ適用（0失敗）、APK再構築とv2署名、生成DEXのPR除外ガード、Android 36エミュレーターのインストールとMainActivity起動。

**未確認：** 実際の記事取得・全タブの広告除去、ログイン、ブックマーク保存、2026年のHatena APIとの互換性。2つのエミュレーターでAndroid System UIが応答しなくなり、描画・画面取得が完了しなかった。**実験版として扱うこと。**

**古い第三者配布APKの安全性には限界があります。** 配布サイトの証明書表記との一致や署名検証は無害性を保証しない。APKの安全性に不安があるならインストールしない。元の5.84をアンインストールしない。公開リポジトリにAPK本体やログイン情報を含めない。
