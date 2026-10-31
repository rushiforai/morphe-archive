# 191 パッチ適用時間の計測（2026-10-30）

PC上のMorphe CLIで、同じ入力APK・オプション・署名鍵を使って比較した。Android版Morphe内蔵実行環境の秒数ではない。

## 条件

- ChMate 0.8.10.191 dev、公開1.16.0-dev.7 MPP。
- Windows / Intel Core i5-9400F / 32GiB RAM / Java21.0.9+10。
- CLI1.16.0、heap1000MiB、SerialGC、ActiveProcessorCount=2、TieredStopAtLevel=1。全比較で同一。
- JFR profileを全実行で有効化。常駐エミュレータあり、計測中にビルド・別パッチ処理は並行させない。
- 通常比較は各2回。baseline→core→full、次にfull→core→baselineの逆順。最適化後fullも2回。
- coreはHaiagaruとパッケージ名変更。fullはさらにMEGA、専用動画ビューア、クラッシュログ保存。両者とも同じImage NG修正ファイルと絵文字フォントを指定。
- 計測APKはインストール前にパッケージと署名を別途照合。計測スクリプト自体はインストールしない。

## 総時間

| 構成 | 1回目 | 2回目 | 平均 |
|---|---:|---:|---:|
| パッケージ名変更のみ | 25.90秒 | 26.03秒 | 25.96秒 |
| Haiagaru本体＋パッケージ名変更 | 77.02秒 | 77.66秒 | 77.34秒 |
| 従来の検証用構成 | 72.31秒 | 77.09秒 | 74.70秒 |
| 最適化後・同じ検証用構成 | 58.15秒 | 58.01秒 | 58.08秒 |

16.62秒、22.25%短縮。少数回のPC実測であり、端末で同率短縮する保証ではない。coreとfullの差は測定のばらつき内で、追加パッチを外すと速くなるという結論は出していない。

## 区間（fullの2回平均）

| 工程 | 変更前 | 変更後 |
|---|---:|---:|
| パッチの実行 | 40.34秒 | 27.33秒 |
| DEXの組み立て・書き出し | 11.86秒 | 10.42秒 |
| 元DEXからの変更クラス除外 | 0.41秒 | 0.40秒 |
| リソース再構成 | 11.19秒 | 9.89秒 |
| 署名 | 2.27秒 | 2.05秒 |

区間境界はCLIログの開始メッセージをPC側で受け取った時刻。内部の細かい処理とログ配送遅延を含む。総時間には起動、展開、整列、後片付けも含む。

## 0除算・クラッシュ関連の直接計測

Java agentで公開MPPのJVM関数の入口・正常復帰を計測。製品ソースと配布MPPを書き換えず、計測APKは通常版と同じ対策を保持する。全体76.776秒の1回の追加実行。

| 計測関数 | 時間 |
|---|---:|
| patchDistributedIntegrityComparisons（0除算・整合性対策の主要走査） | 440.352 ms |
| patchLegacyImageUploadTempName | 13.410 ms |
| patchLegacyImageUploadCall | 0.807 ms |
| patchLegacyTalkAuthIntegrity | 9.569 ms |
| bypassLegacyViewModelTamperTrap | 1.368 ms |
| bypassSettingsTamperTrap | 1.127 ms |
| 上記の合計 | 466.633 ms |
| クラッシュログ保存の挿入 | 0.425 ms |

約0.47秒は計測対象の走査・命令挿入の時間。変更されたクラスを最終DEXへ書き出す共通工程の寄与まで0.47秒に含むとは言えない。また、その他の機能に組み込まれたすべてのクラッシュ予防を網羅した合計ではない。今回の短縮では、これらの対策を削除・無効化していない。

## 変更と同等性

- 拡張DEXの文字列・型sectionを、そのshardの読込中だけキャッシュ。クラス名の再配置規則、文字列置換、クロスshard参照は変更しない。
- Hidden NG未読数のフック候補照合で、全参照のtoString生成をやめFieldReferenceのowner/name/typeを直接照合する。
- 生のextension2 shardは変更前・変更後MPPでバイト一致。移設後の出力2 shardも、同一の生DEXを入力して比較しバイト一致。
- キャッシュ69,552 section entryの値・offset・再読、およびoptional/不正indexの検証を通過。
- 単体の移設処理は旧16.17秒、新8.35秒。ただし新側は値比較試験でキャッシュを暖めてから計測しており、公平な全体短縮率には上の全適用実測を使う。
- native未読フックは191=4、226=6、242=8。変更前後の関連hook methodは命令・register・参照・branch offsetが一致。

## 証跡

ローカルbuild/patch-timing-191-dev7/にsummary.json、reverse/summary.json、optimized/summary.json、時刻付きlog/jsonl、JFR、functions/01-full.log、isolation-before/afterを保存。公開物にはJava agent・プロファイル・計測ログを含めない。
