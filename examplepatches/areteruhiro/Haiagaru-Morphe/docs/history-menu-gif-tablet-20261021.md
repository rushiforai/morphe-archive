# HOME履歴・レスメニュー・画面境界・X GIF・本体タブ統合

## 追加依頼と中断時点の追補

自作テーマ一覧・削除を実装し、ホスト43項目とAndroidビルド成功後、ユーザー指定でGIF再生・本体タブ統合・191/226への共通修正の適用検証へ着手した。テーマ管理候補のMPP/APKはandroid-installations.mdに記録。191はデータ保持更新Success、226は証明書一致後のinstall最終結果を再確認する必要がある。両版のDAT見出しfixture／実画面確認はまだ実施していない。

GIF切り分け：AndroidのHTTPS GETは206/200、video/mp4、全体1,056,200 bytes取得成功。MP4にtrak、vide、avc1あり、1200x898、AVC profile77/Main・level32。アプリ内Frida診断と独立app_process診断の両方でMediaExtractorのトラック0件を再現。一時保存しても0件で、一時ファイルはfinallyで削除。WebViewの匿名video要素による診断もreadyState0/error4で失敗した。ネットワークだけ／Fridaだけの問題とは言えず、形式・標準抽出器の切り分けが必要。再生の修正完了とはしない。`scripts/GifExtractorDiagnostic.java`、`scripts/frida-gif-source-diagnostic.js`、`scripts/frida-gif-web-diagnostic.js`、`build/gif-extractor-profile.txt`、`build/gif-web-diagnostic242.txt`。MPEG4Extractorのログタグを一時変更した診断はfinallyで元値へ戻す手順。

本体タブの追加調査：191 factory `o.r8lambdaBjbaKVYCk6JekZq3TlN9Kg2pYOk.Sw_`のtype4は`o.onAppOpenAdLoaded`、共通基底`o.r8lambdahIGIGCNpKpFqE0lgDli724UCuDM`。226 factory `o.Yy.instantiateItem`のtype4は`o.setFallbackResource`（基底`o.setLocalVersion`）。242 factoryは既述。3版の型が異なるため、ActivityだけでなくFragmentと保存状態の整合が必要。追加のネイティブタブ注入はまだ実装していない。ダンプは`build/tablet-native-pager{191,226}.txt`、`tablet-pager{191,226}-classes.txt`。既存のタブは変更・削除していない。

2026-10-21。未公開。主開発先はcanonical workspace。既存の未コミット変更を保持。

## 実装と検証

- HOME履歴（mode103）のDAT落ち行除外後、空になった「○分前」の見出しを除去する。最近見たスレのポップアップではない。元リスト・DB・既読状態を変更しない。226の`Yy2$write`は通常行（type0）なので時刻見出し判定から除外し、`Yy2$ComponentActivity`（type4）のみ対象とした。
- 242のレス長押しメニューを226と同様にラップし、標準メニューの全正常終了後に追加処理を必ず呼ぶ。選択レスは`parent.o.c`の`o.KeJ11`、板は`parent.r.b`を優先。ロード済み隣接レスからの誤取得を避ける。
- 任意の「レス長押しに追加ツールを表示」（`responseExtraTools`、初期オフ）。対象レスで使用可能な操作を集約。通常の個別表示設定と分離し、アーカイブのマスター無効は維持。再利用メニューでは古いレスのコールバックを除去。
- 設定Group・共通ダイアログ・リストカードにoutline枠線。エッヂ検索結果にはカード枠と行間の区切り線。242実画面で50件fixtureの枠・区切り・縦スクロールを確認。`build/history-ui242-result.png`／`history-ui242-scrolled.png`。暗色確認と最終行到達は今回未確認。明色画面のステータスバー文字の低コントラストも追加課題。
- 指定X投稿`1989826585013424339`の公開埋め込み取得で従来の`token=0`が400。公開埋め込みと同じtoken計算を追加し、Android上で200相当の有効JSON、GIFのMP4・サムネイル抽出に成功。root video形式のfallbackも追加。`tweet_video/`のMP4のみループ指定。

## ビルド・端末試験

- `build/history-menu-gif-ui-final-build.log`成功（4分31秒、既知ローカルLint FIR問題の3タスクのみ除外）。
- 固定MPP `build/history-menu-gif-ui.mpp` SHA256 `16B5920A3721F86D7965DF10CC9BE3BB27DA1ADF95326127869B783DE7F3C569`。
- 242 APK `build/history-menu-gif-ui242.apk` SHA256 `784F69BFB150311AB2BEF961EDA4E0322B4E987E51B79155BCCE9160D9A7478F`。既存`resumefix242`へ証明書を照合して`install -r`成功。アンインストール・データ消去なし。
- `VerifyResponseArchiveMenu.java`：242の既存アーカイブ保存／閲覧ディスパッチ接続成功。これだけで実メニュー操作完了とはしない。
- `build/history-menu-gif242-context-runtime.txt`：Android公開GIF取得・抽出等5項目、242 native型DAT判定20項目、対象レスコンテキスト・追加ツール設定等7項目成功。fixtureは保存NGを作らず設定をfinallyで復元。
- 初回fixtureは書込可能DEXに対するAndroidの拒否、次回はFridaのConsumerデフォルトメソッド問題で失敗。DEXをread-onlyにし、通常Javaでコンパイルしたfixtureへ変更後成功。アプリの通常操作クラッシュとは区別。
- 226通常行の見出し除外を含む追加ビルド`build/history-menu-gif-ui-heading-final-build.log`成功（3分56秒）。この追加差分は導入済み242 APKには含まれない（差分は226の型名除外のみ）。191/226への今回候補の適用・導入・実操作は未実施。

## 未解決：GIF再生

指定GIFのAndroid公開メタデータ取得とMP4抽出までは成功したが、内部VideoViewではpreparedに到達せず、`GenericSource: source has no track`、MediaPlayer `(1,-2147483648)`で失敗。`build/history-x-gif-playback242.txt`、`history-gif-player-log.txt`、`history-gif-transport-log.txt`。PCから同MP4のHEADは200・video/mp4・Accept-Rangesあり。プレイヤー経路／コンテナ判定の切り分け未完了であり、再生対応完了とはしない。

## 未解決：191 ANR

今回の242画面に191のANRダイアログが残って重なり、fixtureのwindow-focus確認が一度失敗。保存した`build/history-menu-latest-anr.txt`は既存09:13:01 UTCの191記録のままで、新しいANRではなかった。`/data/anr`も同時刻が最新。記録後settingsfix191のみforce-stopし、242画面確認を再開。既存191 WebView ANRは依然解消を証明できず公開保留。

## 本体のスレタブと同じ列への統合（調査のみ・未実装）

ユーザーの指定は**本体スレタブと同じ列**。専用の追加タブ列で代用しない。

242で確認した接続点：

- `TabletHomeActivity.a(androidx.fragment.app.Fragment, Bundle, boolean)`がtype4の`o.zzeq`を作り、標準のpane／選択管理`b(...)`へ渡す。URIをonNewIntentへ送るだけではツールタブは開けない。
- `o.zzfm.a(ViewGroup,int)`がtype4に`WebViewFragment`を作成。`o.zzeq`には安定ID・args・現在Fragment・前後タブIDがあり標準の復元処理へ接続される。
- `o.CustomEventAdapter`は非abstractな本体Fragment基底。別コンパイルのAndroidX Fragmentをそのまま継承すると、ChMate側の難読化された型と互換にならない点に注意。
- argsの永続化ホワイトリストに`_data`、`Intent.EXTRA_TITLE/TEXT`等がある。独自キーを置くだけではプロセス復元時に失われる。
- エッヂ検索コントローラーは現在ActivityのsetContent・window insetsに依存する。まず埋め込み表示と独立したLifecycle／SavedStateの所有・破棄へ分離する必要がある。Haiagaru設定もActivity専用画面の分離が必要。
- 226の既存タブ選択修正を迂回しない。閉じる・隣接選択・回転・プロセス再生成・複数ツールタブの状態分離を確認してから有効化する。

参照dumpは`build/tablet-tools242-owner.txt`、`tablet-tool-types242.txt`、`tablet-tool-state242.txt`、`tablet-tool-fragment242.txt`。試作だけのタブ・未検証のFragment注入はアプリへ追加していない。

今回のソースは未コミット・未push・未公開。バージョン／CHANGELOG／bundle JSONは変更していない。
