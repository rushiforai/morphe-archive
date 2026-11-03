# ADR 0001: 厳密な reference input と署名ポリシー

- 状態: 承認済み
- 日付: 2026-08-31

## 背景

base APK 単体には ABI/density の required split があり、単体入力は installability と native library load の契約を満たさない。また、名称・versionCode だけでは配布物の同一性を保証できない。

## 決定

1. v1 は `reference/line-26.16.0-arm64-v8a.json`（当初は 26.11.0。2026-11-02 に同じ手順で更新） が固定する APKM 全体だけを受け入れる。
2. preflight は APKM、base、全 split の SHA-256、manifest の package/version/SDK/split、DEX 数、native library 数を照合する。
3. APKM 内 APK は安全な一時ディレクトリへ限定して展開し、Android SDK `apksigner verify --verbose --print-certs` を各 APK に実行する。v3/v3.1、Source Stamp、証明書 fingerprint と SDK 範囲別 signer lineage を照合する。
4. 元署名の private key は取得・保存・利用しない。パッチ後の再署名は別工程であり、公式署名または integrity 検査を回避する目的ではない。

## 結果

入力更新は descriptor、preflight の成功、互換性評価、端末成立性ゲートを伴う明示的な変更になる。再現性と誤適用防止を優先するため、未知の LINE version へ自動的に適用する利便性は提供しない。
