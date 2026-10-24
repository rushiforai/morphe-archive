# 安価が多い本文の表示準備

## 報告

利用者から「>>数字が多いと表示がワンテンポ遅れる」との報告。投稿者経由の報告で、表示方式・人気レス設定・特定スレなどの詳細は不明。通常／ツリーや直接返信設定を断定しない。

## 変更と確認

投稿者強調の表示メタデータを付ける際、本文を編集しないのにSpannableStringBuilderで全文とnativeリンクspanの編集用構造を作っていた。SpannableStringへ変更し、元のBuilderと同様にNoCopySpan（元Viewの選択・監視状態）は別の行へ引き継がない。元の文字列・spanは変更しない。投稿者強調の判定方法・有効化・削除処理は変えていない。

合成nativeプロフィール＋Androidの実URLSpanを使い、0／20／100／500個の安価を含む本文で検査した。242修正前の25回処理は15／49／282／746ms。最終候補の落ち着いた状態での再試験は22／43／127／233ms（`build/dense-anchor-before242.log`、`build/dense-anchor-safe-after242-idle.log`）。起動直後の最初の最終候補試験では99／335／552／2725msとなっており、測定のばらつきは大きい。CPU負荷や初回起動等の寄与を分離できていないため、一般利用での速度倍率とは扱わない。

191最終候補も13／36／123／455ms、16検査成功（`build/dense-anchor-safe-after191.log`）。各ケースで本文・URLSpan数／オフセット／flags、元source非破壊、強調ON／OFF、NoCopySpan非継承を確認。ID／ﾜｯﾁｮｲ等のルール純粋テスト63項目成功。226は共通Java実装でnativeフック変更がないため、ユーザー許可に基づき今回の重複端末試験を省略し、直前候補の導入を維持した。

242実Part3の6レスにある「>>5」をADBでタップし、5レスのポップアップが表示されることをUI XMLで確認（`build/dense-anchor-safe-popup.xml`）。テスト後の新規crash／ANR時刻増加なし。反射テストの初回はBoardIDを渡したfixture誤り、次は別ClassLoaderのpackage-private Ruleへ直接アクセスしたfixture誤りで失敗し、専用Boardと反射Constructorへ修正した。いずれもfinallyで一時状態を復元し、成功扱いにはしていない。

実描画の補助プロファイルは呼出し0件だったため、自然発生の遅延箇所を特定した証拠には使わない（`build/anchor-render-live-before242.log`、`build/anchor-render-live-refresh242.log`）。報告された表示遅延全体がこのコピー処理に由来するとは未確認。実際の重いスレと操作条件が分かれば追加切り分けが必要。

## 公開手続き

先行修正のcommit12d3d95から開始したRelease CI39898097732は、この追加報告を受けて停止。CIが生成した7ca9672とtag1.12.0-dev.9、devのメタデータは残ったがGitHub Release／配布資材は未公開。生成ファイルやタグを手編集・削除せず、7ca9672をfast-forwardで取り込み、今回の追加修正を既存Semantic Release CIで次版として公開する。完了時はdevメタデータの実ダウンロード先とMorphe表示を再検証し、不整合が解消したことを確認する。安定版は変更しない。

最終Androidビルドは通常Lint込みで成功（`build/dense-anchor-nocopy-final-build.log`、2分45秒）。MPP SHA256 `5BD55CCCC56D65362882337C20570ECF5B8390FE27306BB3B17A1F7360356AF0`。APK台帳はandroid-installations.md。

次のCI39900790356は成功し1.12.0-dev.10として公開完了。公開直後のraw配信にはdev.9のCDNキャッシュが残っていたが、待機後にdev.10へ更新され、Morpheの実更新でもdev.10を確認した。dev.9タグは削除・改名していない。正式版1.11.2は維持。配布物のハッシュ・導入との区別は導入台帳を参照。
