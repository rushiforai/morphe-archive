# 元APK

自分の入手済みAPKから以下を配置します。GitHubには含めません。

| ファイル | 内容 |
| --- | --- |
| `google-base.apk` | Google 17.70.11.ve.arm64 / versionCode 301827586のbase |
| `google-xxhdpi.apk` | 同じ配布セットのxxhdpi split |
| `gemini-base.apk` | Gemini 1.0.995038376 / versionCode 345のbase |

正確な入力は `config/inputs.sha256` に固定しています。`scripts/check-inputs.sh` で照合してください。別バージョンへの対応では、対象命令と実機動作を確認してからハッシュを変更します。
