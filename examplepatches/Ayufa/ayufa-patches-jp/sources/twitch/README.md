[![Latest Release](https://img.shields.io/github/v/release/Ayufa/twitch-patched-ja?style=for-the-badge&logo=github&color=green)](https://github.com/Ayufa/twitch-patched-ja/releases/latest)

# twitch-patched-ja（日本語版）

[ryykitty/twitch-patched](https://github.com/ryykitty/twitch-patched) が公開する、Twitch公式Androidアプリ向け [Morphe](https://morphe.software/) パッチの、**非公式の日本語化版**です。

パッチ本体の機能は本家そのままで、アプリ内に表示される **パッチ設定画面のUI文字列と、Morphe上に表示されるパッチの説明を日本語化** しています（パッチ名は本家の英語名のままです。パッチャーが名前順に実行するため、名前は翻訳しません）。本家にはこの部分の日本語訳が存在しないため、ソース内の文字列を直接翻訳しています（設定キーなどの内部識別子は変更していません）。

## 機能

各機能はパッチ適用時に個別に選べます。適用した機能は Twitch の **設定 > パッチ設定** に表示されます。

| パッチ | 内容 |
| --- | --- |
| Block stream ads | 検出した開始前・途中の広告を、Twitchの直接再生に置き換えます |
| Hide feed and display ads | スポンサー付きフィードカード、バナー、ディスプレイ広告を非表示にします |
| Hide Turbo promotions | Twitch Turboのプロモーションと購入案内を非表示にします |
| Hide subscription discount banners | サブスクの案内、割引バナー、プロモーションラベルを非表示にします |
| Auto-claim bonus channel points | ライブ配信の視聴中に、ボーナスチャンネルポイントを自動で受け取ります |
| BTTV, FFZ and 7TV emotes | グローバルとチャンネルのエモートを、チャット、自動補完、エモートピッカーに追加します |
| Favorite emotes | エモートピッカーに「お気に入り」セクションを追加します |
| Reload stream | ダブルタップ操作でライブ配信を再読み込みします |
| Show deleted messages | 削除・モデレーションされたチャットメッセージを読める状態に保ちます |
| UI settings | プレイヤー操作、チャンネル操作、拡張機能、ハイプトレイン、ランキング、全画面時のシステムバーをカスタマイズします |
| Block client-requested ads | プレイヤーからの広告リクエストをブロックします（変更後はTwitchの再起動が必要） |
| Playback diagnostics | トラブルシューティング用に、プレイリストのメタデータと再生カウンターを記録します |
| Inspect Twitch APK | アプリを変更せず、APKのパッケージ、バージョン、DEXクラス数を報告します |

このほかに、DJ再生、ライトモードの修正、プッシュ通知の登録復旧が、変更系パッチに自動で含まれます。

## 対応バージョン

本家の対応に準じます（日本語化の起点: Twitch 31.8.0 が安定版、31.9.0_BETA が実験的対応）。Morphe Patcher 2.0.0 以上が必要です。再署名したアプリでは Google Play の課金は使えません。

## 使い方

1. [Morpheにこのパッチソースを追加](https://morphe.software/add-source?github=Ayufa/twitch-patched-ja)します。
2. 対応バージョンの Twitch 公式APKを選び、使いたいパッチを選択して適用・インストールします。

[Releases](https://github.com/Ayufa/twitch-patched-ja/releases) に `.mpp` パッチバンドルが含まれます。

## 翻訳の範囲

- 翻訳済み: パッチ設定画面の全UI文字列（設定項目名と説明、セクション名、検索、ツールバー、トースト、お気に入り関連のラベル、削除済みメッセージのラベル）
- 翻訳済み: Morphe上に表示されるパッチの説明（13パッチ分と対応バージョンの説明）。パッチ名は本家の英語名のまま
- 翻訳済み: React Native側の表示文字列（お気に入り、再読み込み、エモート種別ラベル、UI設定への入口）
- 英語のまま: 設定キーや内部識別子、ブランド名・プロバイダー名（BTTV、7TV、FrankerFaceZ、Twitch Turboなど）、内部エラーやログの文字列

詳しくは [docs/LOCALIZATION.md](docs/LOCALIZATION.md) を参照してください。

## 本家への配慮

- 本家リポジトリへの **プルリクエスト・Issue・マージは一切行いません**（upstream は fetch 専用に設定し、push先を無効化しています）。
- 本家の変更は fetch から merge の一方向でのみ取り込みます。取り込み方法は [docs/UPSTREAM.md](docs/UPSTREAM.md) にまとめています。
- パッチ本体の不具合は本家の領分です。このリポジトリの Issue は **翻訳に関するもの** にお使いください。
- クレジットとライセンスは本家に従います（GPL-3.0。本家の NOTICE にある Morphe の名称制限もそのまま保持しています）。

## ライセンス

[GPL-3.0](LICENSE)。本家および上流プロジェクトの帰属表示は [NOTICE](NOTICE) と `licenses/` に保持しています。このプロジェクトは Twitch および Morphe プロジェクトとは無関係です。
