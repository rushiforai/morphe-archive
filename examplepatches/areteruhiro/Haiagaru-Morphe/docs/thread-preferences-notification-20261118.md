# 検索メニュー・表示順保持・通知文字コード・履歴OOM対策

- `threadOverflowSearch` の未保存時初期値をtrueへ変更。設定UI・profileの既定値も統一。保存済みfalseは維持。
- 191は`pa.b(int)`、226は`ResListFragment.f(int)`の現在順序更新直後にnativeの`resListOrder` setterを呼ぶ。242は`zzabe.c(fragment,order)`のflow更新直後に同じnative設定setterを呼ぶ。従来の画面離脱時保存だけでは、新規スレ生成が先行すると古い順序を読めるため。
- 返信通知のHTTP本文／端末内DATは厳密なUTF-8復号を試し、不正なUTF-8なら従来の板別文字コードへ戻す。したらばEUC-JP／5ch MS932も保持。保存DATの判定は8192文字のバッファで行い、全ファイルの追加コピーを作らない。
- 履歴タイトル補完のメモリ不足時は元タイトルを返す。現行ReporterMetadataWritesの集約・同期commit・低メモリ抑止に加える。報告ログのmetadataTitleから直接Editor.applyを呼ぶ経路は現行ソースにはない。

## 確認

- 最終`:patches:buildAndroid`成功（`build/thread-preferences-20261118/build-final.log`、5m4s）。
- UTF-8／EUC-JP／MS932の文字列・ファイル復号確認成功（NotificationDatTextTest）。
- ReporterMetadataWritesTest 14項目成功（書込集約・同時更新・OOM時退避）。
- OOM追加退避前候補は191／226／242へパッチ適用成功、3版の即時順序保存呼出しDEX検査成功。
- OOM追加退避を含む最終候補は`build/thread-preferences-20261118/final-apks`。全3版生成・署名照合・隔離package install-r成功。全3版の即時保存DEX検査とmetadataTitle/title/historyTitleに直接applyがないことを検査。242実行時にenumの全2値を保存しnative getterと一致、元設定復元を確認。実端末の通知再現・複数スレを切り替えた順序保持は未確認。未公開。

- 242実行時の検索メニュー未保存初期ON・明示OFF/ON各確認成功、元設定復元。新規fatalなし。外部スレをACTION_VIEWで開く追加比較は自動承認レビューにより拒否（詳細理由なし）。実画面での別スレ間比較と報告端末での再現確認は未実施。

- 最終生成DEXで、191/226のonViewCreatedと242のViewModel constructorが、切替時の書込先と同じnative resListOrderキーを読むことを3版検査成功。保存と新規スレの初期値読込の接続を確認（VerifyResponseOrderPersistence）。実画面の外部スレ比較は上記の通り未実施。
