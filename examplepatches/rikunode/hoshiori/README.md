# Hoshiori — はてなブックマークAndroidアプリ向け非公式Morpheパッチ集

Hoshioriは、はてなブックマークのAndroidアプリで気になる表示や記事閲覧時の動作を調整する、個人制作の非公式パッチ集です。はてな公式とは無関係です。

**公開版：v0.4.5。対応アプリはHatena Bookmark 5.80（versionCode 58000）のみです。** 5.84など、ほかのバージョンには対応していません。パッチの利用にはMorphe Managerと対応する5.80のAPKが必要です。APK本体はこのリポジトリでは配布していません。

[**Morphe Managerにパッチソースを追加する**](https://morphe.software/add-source?github=rikunode/hoshiori)

ソースを手動で登録する場合のURL：

```text
https://github.com/rikunode/hoshiori
```

## できること

現在、次の5つのパッチが含まれています。

1. **PR記事の非表示**：記事一覧に混ざるPR記事を一覧データの処理段階で除外します。通常記事と、利用者が設定したミュート機能の処理は維持します。
2. **「今週のブクマ数ランキング」のお知らせ非表示**：「ブクマ数ランキング」を含むお知らせだけを対象にします。ほかのお知らせは原則そのままです。設定キーは `hideWeeklyRanking`（既定ON）。
3. **アプリ内ブラウザの広告ブロック**：はてブから開いた記事のWebViewで、リストに基づく広告関連の通信を遮断し、一部の広告枠を隠します。記事本体の通信は対象外です。すべての広告が消えるわけではありません。
4. **記事サイトのCookie・Webストレージ保持**：記事を閉じたときのCookie全削除と、アプリ起動時のWebストレージ全削除を抑止します。NHK ONEで利用設定が繰り返し求められる問題への対策です。**NHKだけでなくほかのサイトのログイン情報なども残る**ため、下記の注意事項を確認してください。
5. **クローン化**：パッケージ名などを変更し、元アプリを残したまま改造版を別アプリとしてインストールできるようにします。既存アプリの設定やログイン情報は自動移行されません。

5つともパッチ自体は既定で有効です。個別のオプションをOFFにすると、対象機能だけを無効化できます。

## 導入方法

1. [Morphe公式サイト](https://morphe.software/)からMorphe Managerを導入します。
2. Managerの「Sources（パッチソース）」を開き、上記のリポジトリURLを追加してソースを更新します。上の「パッチソースを追加する」リンクから登録しても構いません。
3. **v0.4.5のパッチが5件表示されること**を確認します。0件、エラー、対応外の表示が出た場合は、そのまま適用せずソースとバージョンを確認してください。
4. パッチ適用画面で、**Hatena Bookmark 5.80（versionCode 58000）** のAPKを選びます。5.84などを選ばないでください。
5. 利用したいパッチとオプションを選択し、Managerでパッチを適用します。生成されたAPKを確認してからインストールしてください。
6. まず記事一覧とアプリ内ブラウザが正常に開けるか確認し、必要に応じて各機能を試してください。クローン化を使う場合は、元アプリをアンインストールする必要はありません。

画面構成や導入時の注意点は、[日本語の導入ガイド](docs/MORPHE_MANAGER_SETUP_JA.md)にもまとめています。

## オプション

| 設定キー | 初期値 | 内容 |
|---|---|---|
| `hideWeeklyRanking` | ON | ランキングのお知らせを非表示にします。 |
| `blockInAppBrowserAds` | ON | 記事WebViewの広告関連通信と一部の広告枠を遮断・非表示にします。 |
| `updateAdBlockLists` | ON | 広告ブロック用リストを最大24時間に1回の頻度で更新します。 |
| `preserveArticleWebStorage` | **ON** | 記事終了時のCookie消去とアプリ起動時のWebストレージ消去を抑止します。OFFで元の自動消去動作に戻ります。 |

クローン化とPR記事非表示のパッチには、ここに挙げる個別の切り替えオプションはありません。パッチ選択画面で有効・無効を指定してください。

## 利用前の注意

- **対象は5.80だけです。** 元APKは古いバージョンであり、2024年当時のものです。第三者の配布元から入手する場合、署名やハッシュの一致だけでは安全性や脆弱性の不存在を保証できません。
- **Cookie保持は既定ONです。** NHK ONE以外の記事サイトでもCookie・ログイン状態・追跡用データが長く残る可能性があります。自動消去を優先する場合は `preserveArticleWebStorage` をOFFにしてください。利用者自身によるデータ消去やログアウトの処理は変更していません。
- **広告ブロックは完全ではありません。** 記事が正しく表示されない場合は、まず `blockInAppBrowserAds` をOFFにして比較してください。
- **クローン化しても起動が保証されるわけではありません。** ライセンス確認などの影響で起動できない場合があります。Androidの安全保護を無効化して回避することは推奨しません。
- **全機能の実機動作が保証されているわけではありません。** PR記事の除外は利用者の実機で確認されていますが、すべての画面・ログイン状態・機能を網羅的に検証したものではありません。広告ブロックなどの実機確認には未完了の項目があります。

## 広告フィルターの自動更新

[GitHub Actionsの日次処理](.github/workflows/update-filters.yml)で、[EasyList](https://raw.githubusercontent.com/easylist/easylist/gh-pages/easylist.txt)と[AdGuard日本語フィルター](https://raw.githubusercontent.com/AdguardTeam/FiltersRegistry/master/filters/filter_7_Japanese/filter.txt)の対応ルールを取り込み、[filter-dataブランチ](https://github.com/rikunode/hoshiori/tree/filter-data)に圧縮済みのリストを公開しています。

アプリ側は[配布ファイル](https://raw.githubusercontent.com/rikunode/hoshiori/filter-data/filters.json.gz)を最大24時間に1回確認します。取得や検証に失敗したときは、既存の有効なリストを利用します。更新を止めたい場合は `updateAdBlockLists` をOFFにしてください。

利用するフィルターのライセンスは、EasyListがGPL-3.0-or-later／CC BY-SA 3.0-or-later、AdGuardがGPL-3.0です。出典・ライセンス表記は[NOTICE](filter-lists/NOTICE)にまとめています。

## 更新履歴と検証

- **v0.2.1**：記事一覧のPR除外処理を修正。利用者による実機確認あり。
- **v0.3.1**：ランキングお知らせ非表示パッチのDEXガード値を修正。
- **v0.4.2**：記事WebViewの広告ブロック処理に関するクラッシュ原因を修正。
- **v0.4.3／v0.4.4**：Cookie・Webストレージ保持機能を追加し、既定ONへ変更。
- **v0.4.5**：配布リポジトリをHoshioriに改名し、広告フィルターの取得先URLを更新。パッチの動作ロジックは変更していません。

開発者向けのビルド確認手順：

```bash
./gradlew.bat :patches:generatePatchesList --offline
python scripts/validate_morphe_release.py
python -m unittest discover -s tests -v
```

ビルド成果物は `patches/build/libs/patches-0.4.5.mpp` です。ソース情報は `patches-bundle.json` とビルドで生成される `patches-list.json` に含まれます。実APKはリポジトリに含まれないため、GitHub Actions上の検証と実APKでの確認には範囲の違いがあります。
