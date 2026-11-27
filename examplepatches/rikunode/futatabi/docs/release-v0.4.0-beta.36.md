# v0.4.0-beta.36 — 閲覧キャッシュ肥大対策（専用プレリリース）

**実機の肥大データでの効果測定は所有者の最終チェック待ち。**

対応はふたったー3.1.1 / ARM64 / versionCode 65。A8（めぶきGoogleアイコン）、A9（jun）、A10（端末情報へのパッチ版付記）はこの版に含めず後続へ。正式版ではない。

## 新規パッチ Manage viewing cache（既定ON、Android 8.0以降）
- 純正ふたば板と追加板が共通して使用する `cache/MyJsonCacheManager` と `cache/libCachedImageData` を対象とする、独立選択可能なパッチ。Android 7以下では削除せずスキップする。
- Flutter開始前の単一プロセスのコールドスタート時にのみ、まず読み取り専用診断を行い、台帳に載っていない古いUUID v1形式のキャッシュファイルを回収、次に完全に確認できた管理領域の合計が1 GiBを超えている場合は再取得可能なHTTP(S)登録ファイルを古い順に整理する。1 GiBは今回の設計値であり、稼働中の厳密な上限ではない。
- 孤立ファイルは最終更新から24時間以上、登録済みファイルは最終更新と台帳上の最終利用の双方から1時間以上経過したものだけ。台帳の欠損・破損・想定外形式、SQLiteのWAL/ジャーナル、投稿下書き確認の失敗、未知のファイル・リンク・ディレクトリ、現在利用中の可能性があるものは安全側に倒して残す。完全に診断できない領域では登録済みファイルの容量整理を行わず、その領域を別の健全な領域の容量圧力にも使わない。読み取り上限・協調的な時間制限があり、極端な件数やI/O遅延では整理が途中になる、または見送られる場合がある。
- 台帳JSON/DB自体は書き換えない。旧CacheStoreは参照先ファイルが無いときに該当メタデータを削除し再取得する設計のため、起動中のメタデータと競合しない方式とした。既存の閲覧キャッシュの一部は再ダウンロードが必要になり、オフラインで表示できなくなる場合がある。
- 投稿用file_picker、WebView/Cookie、板リスト・設定・NG・お気に入り・保護タブ、保存画像・HTML/MHT、仮想ID対応表・認証情報には削除処理を行わない。純正Flutterの永続化済み下書き等が参照しているUUIDファイル名も保護。保存先が対象領域と重なる設定が確認された場合は整理しない。
- 拡張ホームの「キャッシュ診断（起動時）」で直近の起動時集計を表示（Local board bridgeとBoard login button利用時）。ログタグFutatabiCacheにも数値と状態のみを記録する。閲覧画像・動画・その他の拡張子別、台帳登録／未登録、保護容量、孤立回収量、上限回収量、診断完了・台帳確認状態を区別する。ファイル名、URL、Cookie、投稿内容は出力しない。

## 根拠と限界
- APK内のMyJsonCacheManagerの500件・30日設定とJsonCacheInfoRepositoryの3秒定数を確認。純正DEXのPathProviderで temporary=Context.getCacheDir、support=Context.getFilesDirを確認。上流3.3.1、3.3.3、3.4.0、3.4.1のJsonCacheInfoRepository、IOFileSystemおよびCacheObjectProviderのソースはそれぞれ同一。APK内のNOTICES.Zにライブラリ名はあるが依存版数はないため、厳密なバージョン番号は未同定。実機でタイマー動作や孤立率を測定していない。
- 上流の既知事例: [#265 容量制限要望](https://github.com/Baseflow/flutter_cache_manager/issues/265)、[#446 期限切れ削除](https://github.com/Baseflow/flutter_cache_manager/issues/446)、[#262 JSON破損](https://github.com/Baseflow/flutter_cache_manager/issues/262)、[Changelog](https://pub.dev/packages/flutter_cache_manager/changelog)（3.4.3の3秒以内終了時の台帳消失対策、3.4.4の保存完了待ち、3.4.6の失敗時回収、3.4.7の削除失敗処理）。[Mihon #2099](https://github.com/mihonapp/mihon/issues/2099)にも独立のキャッシュ残留報告があり、[NekoSurf](https://github.com/NekoSurf/NekoSurf)は容量表示・手動クリアを提供。[cached_network_image_ce](https://pub.dev/packages/cached_network_image_ce/changelog)は孤立回収の範囲を分離する対策を採用。すべてが同じライブラリ由来の同一バグという意味ではない。
- APKにUUID v1生成、画像／サムネイルのキャッシュ読み書き、動画のnetwork/file両再生、投稿用一時ファイル生成が存在。動画固有の独立保存先、WebView・その他一時領域・ログの全内訳は実機なしで確定できないため本版では削除しない。あにまん独自画像キャッシュの既存48 MiB予算には変更なし。
- AOT改変を追加せず、既知の元／他パッチ併用libapp.soハッシュと7か所の命令前置が一致した場合にのみ起動Providerを組み込む。未知の版・別プロセス構成は拒否。JSONの保存タイマー改変、件数制限だけの短縮、WebView一括消去、稼働中の強制削除は採用しない。
- 検証: CacheSweepTest 30 assertions PASS（診断の非破壊性、孤立／上限回収、保護、異常台帳、部分スキャン・時間制限、他領域の隔離）。最終 .mpp の全8パッチ併用および単独適用が成功。生成APK内のProvider登録・非公開設定・DEXクラス・既存AOTの完全一致を確認し、命令を1バイト変更した非対応入力ではハッシュ拒否、出力APKなしを確認。
- 実機・エミュレータでの操作、実投稿、実ログインは行っていない。Android上のProvider起動、ファイルシステム性能、SQLite/SharedPreferencesアダプタの実環境での動作、容量削減効果は未検証。今後の所有者確認では起動時診断のobservedBefore/After、orphanRemoved/budgetRemoved、ledger/complete/draftCheck、閲覧・保存・投稿下書き・保護タブ等の維持を確認すること。
