# Hoshiori v0.7.1 — PR記事タブのカード表示改善

Hatena Bookmark **5.80 / versionCode 58000** 専用です。

- PR記事タブを、元アプリの `HotEntryListFragment` と `CategoryHotEntryAdapter` を使う純正フィード表示へ変更しました。
- 記事カードは通常フィードと同じ `BookmarkEntryItemView` / `EntryViewHolder` を使用し、サムネイル・タイトル・users数・ドメイン・PRバッジを表示します。
- 独自のPR一覧見出しと簡易テキスト一覧を廃止しました。
- フィード受信記事からの収集、重複除去、最大300件保持、`showPrTab` の既定OFF、他タブでPR記事を表示しない挙動は維持しています。

## 検証

- 関連回帰テスト: 6件 PASS
- Morpheパッチ適用: 10件適用 / 0件失敗
- emulator-5554: 通常記事とPR記事のカードを比較し、同一の純正Viewクラス・ViewHolder・1080×292の寸法・文字サイズ・サムネイル寸法を確認しました。
- users数、ドメイン、サムネイル、PRバッジ、タブ間の表示分離、不要な見出しがないことを確認しました。

実配信されたPR記事によるv0.7.1の追加実機確認は未実施です。表示比較は実際のアプリ上に合成テスト記事を投入して行いました。
