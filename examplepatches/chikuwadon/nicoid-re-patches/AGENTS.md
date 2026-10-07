# UI変更時のテーマ適用

- 新規画面・ダイアログ・表示部品を追加する場合は、まず `porting/original-to-mod.patch` の `MyThemeMaterialYou`、`DynamicTheme.apply` と `DynamicTheme` の既存補助メソッドを確認する。
- Activity は既存の `DynamicTheme.apply` の適用タイミングを維持する。Material You 設定がオンかつ Android 12 以降の場合、`res/values-v31/styles.xml` と `res/values-night-v31/styles.xml` のテーマ色を利用する。
- コードで生成する進捗表示やアイコンには、生成した View の Context の Theme から `colorAccent` (0x7f03005e) を解決し、その色を明示的に適用する。固定色・システム既定色に任せない。設定がオフのときは従来テーマの同じ属性を使う。`porting/pull-refresh.patch` の `SwipeRefreshLayout.setColorSchemeColors` が実例。
- 新規 UI は Material You のオン・オフ、および明暗の双方で色とコントラストを確認する。

# 更新内容の記載

- README は利用方法・機能説明を中心にし、Issue 番号やリンク、バグ修正履歴は記載しない。
- リリース本文と CHANGELOG は英語で記載し、対応した Issue は文末の ` (#xx)` にリンクを付ける。
