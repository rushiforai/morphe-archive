# 実機でのスレ表示遅延：計測失敗と追加修正

対象730eae72/XIG05、既存jp.co.airfrt.android.chMate.haiagartu/191。利用者が一覧から表示までまだ遅いと報告し、Fridaは起動前から動かすよう指定。

## 計測の経過

- 実行中pid13860へ17.18.0で接続。13箇所の計測開始、ReadingPosition.attachは存在せず1項目未接続。ResListActivity.onCreateの125msを1件記録したが、統計完了前に起動前接続へ切替。settings/DATは変更していない。
- 起動前spawn/19箇所の計測は開始成功したが、22:15:55にpid17608がSIGSEGVで終了。ART GetOatMethodQuickCode/StackVisitor/MonitorExitを含むnative crash。計測が影響した可能性を排除できず、アプリ通常起動のクラッシュと混同しない。Fridaを停止し通常起動へ戻した。
- 22:14の前プロセスANRもexit-infoに存在する。22:08の通常ANRとは別件。個別Javaメソッドの原因は未特定。
- Android標準am start --start-profilerは起動okを返したがtraceは0 bytes。後のam profile startではshell/rootともnot debuggable/not profileableにより拒否。メソッド計測成功とは扱わない。
- システムatraceを実行し、利用者のスレ表示操作を2回取得。最初247716788bytes、軽量化後74481502bytes。どちらもring buffer上書き/入れ子の不整合が残る。初期解析のlayout462ms/draw715msとmainCPU23/3msは暫定値として報告後、不完全な数値と訂正した。原因・速度倍率の根拠にしない。
- 2回目にはNativeAlloc concurrent mark compact GC、mainのFullSuspendCheck/Run checkpoint、GCのmajor faultカウンター65→1681が同区間に存在する。メモリ待ちの可能性を示すが、特定コードが主因と断定しない。観測時のnative heap約141MB、PSS約314MB、別時点VmSwap約48MB。内容/条件値をログへ出さず受信cacheを集計すると2551条件、閾値1で除外前keyword regex251件。各条件の種類設定/除外後の適用件数とは区別する。

## 正規表現非一致の再利用を改善

再表示の既存キャッシュは、scopeにregexが1件でもあるとすべての非一致を保存していなかった。normal regexが判定完了した非一致まで再評価するため、同内容の再表示で反復が残る。

SharedNgRulesへスレッド単位の「regex判定がタイムアウト/StackOverflowで不確実だった」flagを追加。1つのHTML条件判定を始める時に初期化し、非一致を保存するかは評価完了後に確認する。正常に完了したfalseは再利用、実際にtimeout等を起こしたfalseは次回も再試行。trueは従来どおり再利用可能。条件/index更新・内容変更・上限による破棄の扱いは従来どおり。結果の意味・正規表現の制限時間・標準NG/連鎖は変更しない。

追加テストは3020項目成功（正常なregex非一致はdecode1回、実際の遅いregexは再試行）。既存index10306/regex17/除外263も成功。改善が見込めるのは同内容の再表示で、初めて開くスレの251regex評価は残る。今回のANRや初回遅延解消を保証しない。新規APK導入・公開なし。ビルド結果は完了後追記。

主なローカル証跡: build/thread-open-timing191-live.jsonl、thread-open-timing191-cold.jsonl、haiagartu-cold-profile-crash.log、haiagartu-exit-info-cold-profile.log、haiagaru-open-20261104.trace（0bytes）、haiagaru-system-open-summary.json、haiagaru-open-light-summary.json。システムトレースは他アプリの機微な情報を含み得るためGitへ追加/公開しない。

実機のprogrammable-ngはenabled=false、plainTextCacheEntries/Charactersはともに999999999だった。利用者の以前の0比較と現時点を混同せず、現在値では非常に大きい上限になっていると説明。0への一時変更を提案したが利用者は「現在の設定を維持する」と回答したため変更しない。この設定がGC/実遅延の主因だという証拠はない。

最初の通常ビルドはJVM native memory不足（hs_err_pid49556.log、約1.8MBのmalloc失敗）でdaemon消失。Android端末クラッシュではない。worker1/heap1024MB/SerialGCで再試行し、結果は完了後追記。

再試行build/buildAndroidは56秒で成功（build/shared-ng-regex-stability-retry-build.log）。最新sourceでhost試験3020/10306/17/263項目を再実行し全成功。候補MPP build/haiagaru-shared-ng-regex-stability.mpp SHA256 8b325a2c488bd79af2c51e16c99b5bc8bf03eff62d4efd913ef94d6381880dd9、実機用191 APK生成中。公開版dev.12とは異なる未公開候補。

実機更新: 22:40:29 JSTに同一package/署名でinstall-r Success。端末base.apk SHA256一致、native hook検査PASS、HomeActivity起動ok、PID20089 crash buffer空。設定上限は変更していない。更新後に利用者から「かなり早くなりました」と報告があった。再利用修正による効果を支持する主観的な実機確認として記録する。定量改善幅・初回/再表示の内訳・全版での効果やANR解消を確定したとはしない。導入詳細はdocs/android-installations.md。公開なし。
