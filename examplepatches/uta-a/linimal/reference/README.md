# Reference APKM contract

`line-26.16.0-arm64-v8a.json` は Linimal v1 が受け付ける唯一のローカル入力を固定する公開メタデータです。公式 APK/APKM、本体の展開物、逆コンパイル結果はこのディレクトリへ保存しません。

## 対象

- package: `jp.naver.line.android`
- versionName / versionCode: `26.16.0` / `261600106`
- ABI: `arm64-v8a`
- 入力形式: APKM（base、arm64-v8a、端末 density split を含む）

descriptor は APKM と全 8 split の名称・SHA-256、base の 14 DEX、arm64 split の 73 native library、SDK 要件、base が要求する `base__abi` と `base__density` を記録します。armeabi-v7a split も原本完全性のため記録しますが、v1 のパッチ対象ではありません。

## 実行

APKM は `line-apk/` にローカル入力として置き、Android SDK の `apksigner` を明示して実行します。

```sh
python3 scripts/preflight_reference.py \
  --apksigner "$ANDROID_SDK_ROOT/build-tools/37.0.0/apksigner"
python3 -m unittest tests/test_preflight_reference.py
```

preflight は不一致時に非 0 で終了します。APKM 原本を変更しません。署名確認のための APK のみを OS 一時ディレクトリへ安全にストリーム展開し、各 APK に `apksigner verify --verbose --print-certs` を実行します。一時ディレクトリは成功・失敗を問わず終了時に削除され、ログや恒久的な展開物は生成しません。

`--apksigner` を省略した場合は `ANDROID_SDK_ROOT`、`ANDROID_HOME`、標準的な SDK 配置、最後に `PATH` を探索します。CI では SDK tool の曖昧さを避けるため明示指定を推奨します。

## 署名契約

正式検証では全 APK に対して v3/v3.1、Source Stamp、SDK 範囲別の v3 signer lineage、Source Stamp 証明書 SHA-256 を照合します。descriptor の証明書 fingerprint は公開鍵の識別子であり、秘密鍵や署名鍵素材は含みません。
