# v0.4.0-beta.39 — A2 の最終修正のみ

対象はふたったー3.1.1 / ARM64 / versionCode 65。beta.38への追加修正は、めぶきのスレ立て成功後の自動遷移（A2）のみ。

## 根本原因
所有者の18:11の実機画面は戻る／更新／ログイン確認のある専用リーダーだった。beta.38の MebukiNewThreadActivity.observeThread は、公式 /app/t/<slug> の到着、認証アカウント一致、作成時刻・投稿者・画像の照合、rememberPrivateThread の仮想ID登録の後、Intentで MebukiReaderActivity を明示起動していた。成功判定や仮想ID生成が失敗したという証拠ではなく、遷移先Activityの設計が純正スレッド画面と異なっていたことが原因。
純正の app_links 経路も確認した。MainActivity は singleTop で、FlutterActivity の onNewIntent は delegate へ、app_links の r5.b.d/b は Intent のデータ文字列（r5.a.c）を既存イベントへ送る。AOT onAppLinksNotify (0x7ac460) は通常のスレURLを https:// とホスト／パスから再構築する (0x7aca64–0x7acaa0)。HTTPかつ明示ポートが必要なめぶきのループバックURLを単に渡すだけでは正しいURLが保持されない。

## 修正
- 確認済みIDが13桁かつ元slugへ解決されることを確認し、http://127.0.0.1:18765/mebuki/res/<13桁>.htm を ACTION_VIEW のデータとして既存 MainActivity へ明示的に渡す。CLEAR_TOP | SINGLE_TOP を使用し、専用リーダーはA2では起動しない。
- 純正AOTの既存 Uri.toString 結果の直後 (0x7ac4d8) とパス分類前 (0x7ac5ec) に限定した分岐を追加。exact HTTP/host/port/board/res/13桁/.htm の文字列だけを元の追跡済みURIローカルへ保持し、既存GlobalKey初期化を経て 0x7acaa0 のURL格納へ接続する。既存 pushAndOpen (0x7acb34)、ThreadNotifier.fetch (0x7acbbc)、純正ナビゲーション (0x7acbf8 等) を使う。他のURLは元の処理へ戻す。新しいDart呼出し・GC safepoint・Activity・公開intent-filterは追加しない。
- 既存の認証済み仮想ID解決と純正HTML／原寸画像配信は変更しない。投稿フォーム・送信・照合条件、他の板、既存の専用リーダーへの手動導線、設定、文言、並び順は変更しない。通常の自動版数更新のみ。

## 検証
- 対象元／既知併用版のSHA-256、2か所の元命令、ELFサイズとゼロパディングを確認。旧4組み合わせの出力ハッシュを実物から再現し、新4組み合わせのハッシュを計算。前置不一致は拒否する。
- 全9パッチ併用実APK適用 PASS。Unicornで生成APKの実ARM64分岐を35 URLケース（1/2バイト文字列、別板、別ホスト・ポート、非数字、query/fragment等）で検証し、正規URLだけが既存純正URL格納へ到達し他は従来処理へ戻ることを確認。CPUテストは模擬Dartヒープであり、Flutterランタイム全体の実行ではない。
- MebukiPrivateReadTest 62 assertions PASS。生成APKのJava逆コンパイルで ACTION_VIEW、対象URL、MainActivity、フラグ、slug再照合を確認。AOT差分は2フック、304バイトのスタブ、ELF長、統計の自動版数更新の範囲のみ。既存AOTの投稿・閲覧・純正ナビゲーション命令は保持。
- 実投稿、実ログイン、実機・エミュレータ操作なし。実AndroidでのonNewIntent配信、FlutterのGC／画面遷移、投稿後に作成したスレを純正画面で開く最終効果は所有者の実機確認待ち。今回の実機症状の原因は専用リーダー起動と確認したが、今回の修正結果の実機動作を確認済みとはしない。
