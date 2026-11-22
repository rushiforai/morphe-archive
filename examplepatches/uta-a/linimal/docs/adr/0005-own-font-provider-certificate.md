# ADR 0005: LINE 自身のフォント provider に限り、再署名後の署名を受け入れる

- 状態: 採用（2026-11-21、利用者の承認による）
- 日付: 2026-11-21
- 関連: [ADR 0001](0001-reference-and-signing-policy.md) 決定 4、[ADR 0002](0002-fis-certificate-header.md)、[互換性](../compatibility/line-26.16.0-arm64-v8a.md)、[解析](../analysis/custom-font.md)、issue #30

## 背景

LINE の公式フォント設定（LYP プレミアム向け）は、選んだフォントを LINE 自身の ContentProvider（`jp.naver.line.android.premiumfont`。exported ではない）から downloadable font として読み込む。androidx の FontProvider は、provider を持つアプリの署名（`PackageInfo.signatures`）を `@array/fonts_certs` の公式証明書 3 件と比べる。再署名した LINE では provider を持つアプリ自体の署名が変わるので、照合に失敗し、フォントを適用できない。

この ADR は決定 1 の範囲に限った例外とする。

ADR 0002 との違い:

- ADR 0002 は、Google のサーバーへ公式証明書の SHA-1 を申告する。アプリの身元を外部に対して偽る
- この照合は LINE のプロセスの中だけで行われ、外部へは何も送らない。比べる相手の provider は LINE 自身である

検討した選択肢:

| 方式 | 評価 |
| --- | --- |
| `fonts_certs` のリソースを書き換える | 署名鍵は利用者ごとに違い、パッチ時に決まらない。Morphe の鍵を固定で入れると、別の鍵で署名した利用者には効かない |
| 比較結果を常に一致にする | どの provider の署名も通してしまい、照合が守るもの（同じ authority を名乗る別アプリの provider からの読み込み）がなくなる |
| provider を通さず Typeface を直接作る | 照合を通らずに済むが、選択の解決・ダウンロード・期限の管理を Linimal で作り直すことになる。変更が大きく、LINE の更新に弱い |
| LINE 自身の provider に限り、照合を通す | 変更は照合メソッドの 1 か所。対象の provider は LINE 自身なので、照合が守るものは変わらない |

## 決定

1. androidx の FontProvider の照合メソッドで、package 名の一致を確かめた直後に hook を入れる。次の条件をすべて満たすときだけ、署名を比べずに `ProviderInfo` を返す。
   - `providerInfo.packageName` が自アプリの package 名と一致する
   - `providerInfo.applicationInfo.uid` が自プロセスの uid と一致する
   - authority が `<package>.premiumfont` または `<package>.fonts`
   - provider が exported ではない
2. 上の条件に当たらない provider（Google のフォントなど）は、元の照合のままにする。`fonts_certs` のリソース、`PackageManager` の署名情報、契約の判定、サーバーとの通信は変えない。
3. 公式の証明書や署名鍵は、取得・保存・送信しない。
4. runtime 設定で切り替える。設定は次の 2 つで、どちらかが ON のとき hook が働く。
   - 「LINE のフォント設定を使えるようにする」（公式フォントの復旧）。既定は ON
   - 「手持ちのフォントを使う」（取り込んだフォントを provider から返す）。既定は OFF
   - OFF、未初期化、例外のときは、元の照合の結果（再署名版では失敗）に戻る。
5. fingerprint が一意に定まらない、package 名の一致を確かめる分岐を見つけられない、hook の結果を入れる register が後で使われる値と重なる、のいずれかに当たるときは変更しない。TARGET_NOT_FOUND / ERROR を記録する。

## 結果

- 再署名版でも、LYP の契約者は公式どおりにフォントを選んで使える。契約の判定は変えないので、未契約の利用者がプレミアムフォントを使えるようにはならない。
- 照合が守る「別アプリの provider からの読み込み」は、LINE 自身の provider についてはもともと起きない。LINE 以外の provider の照合は変わらない。
- androidx の照合に依存するため、LINE が framework の `android:fontFamily` や OS 側の `FontsContract` に切り替えると効かなくなる。その場合は解析をやり直す。
