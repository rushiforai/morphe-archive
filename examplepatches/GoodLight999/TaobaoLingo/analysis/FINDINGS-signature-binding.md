# 調査結果：再署名による SecurityGuard 署名バインディング破損（2026-10-28 確定）

対象: Taobao Android `com.taobao.taobao` 10.66.30 (arm64-v8a)
元 APK SHA-256: `3e709717a60fdeeb59354df60fb6cf279ffb023c01e095e16bccfbad75f683dd`
元署名証明書 SHA-256: `c5e9bc4c5cc7a34482c627cb9a76b88e30b509d0da3ba54a66274200e19c2743`

## 結論

パッチ版で見られた症状（Home が白/黒画面のまま Refreshing、Account 無反応、ログインで network error）の原因は
**パッチ内容ではなく「APK を再署名したこと」自体** です。
Alibaba SecurityGuard（`libsgmain.so` / `libpie_dynamic.so`）が APK 署名にバインドされており、
署名が変わると MTOP リクエストの署名（x-sign 等）を生成できず、全 API が失敗します。

## 決定的な実機 A/B テスト

- 端末: moto g52j 5G（Android 12, arm64, 非 root）
- 比較対象:
  - **original**: 未改変の元 APK
  - **resigned**: 元 APK を 1 バイトも変えず、別鍵で `apksigner sign` しただけ（コード変更ゼロ）
- 手順: インストール → 起動 → 同意ダイアログ → ホーム待機 → logcat 取得（`scripts/ci_emulator_probe.sh` 相当）

| 項目 | original | resigned（パッチなし） |
|---|---|---|
| `MRTConfigRequest` (`mtop.taobao.edgecomputer.query`) | `retCode=SUCCESS` | `ANDROID_SYS_GENERATE_MTOP_SIGN_ERROR`（"服务竟然出错了"） |
| `SecException`（SecurityGuard） | 0 件 | あり：`JNICLibrary.doCommandNative` ← `getSecurityBodyDataEx` ← `BaseSecurityManager.getTaobaoWuaToken` |
| ホーム画面 | 正常に遷移（ログイン画面へ進める） | 中身が空のまま（下部に「注册/登录」バナーのみ） |

`ANDROID_SYS_GENERATE_MTOP_SIGN_ERROR` は、クライアント側で MTOP 署名を生成できなかったことを示すエラーです。
サーバに到達する前に失敗しているため、どの API も応答を得られず、ホーム・アカウント・ログインが一斉に壊れます。

## エミュレータでは検証できない理由（参考）

`.github/workflows/emulator-ab.yml` で GitHub Actions（x86_64 + KVM）上の Android 11 / 13 / 14 を試しましたが、
**原本ですら** 起動数秒で落ちます。

- API 30: `ndk_translation: Undefined instruction 0x5ee1b801` → SIGSEGV（SecurityGuard 初期化中）
- API 33 google_apis: ARM 変換なし（`INSTALL_FAILED_NO_MATCHING_ABIS`）
- API 34: `libpie_dynamic.so` 内で SIGSEGV → `Cannot process signal 11`

x86 上の ARM 変換層では保護ネイティブコードが動かないため、検証には **arm64 実機が必須** です。
GitHub の arm64 ランナーには KVM がありません。

## 今後の方針

再署名を伴う配布方式（Morphe/ReVanced 型のパッチ＋再署名）では、SecurityGuard を回避しない限り動作しません。

1. **LSPatch / NPatch の署名バイパス（level 2: pm+openat、level 3: +svc）**
   ネイティブ側の APK 読み取りを元 APK にリダイレクトする方式。
   実機結果（2026-10-28、JingMatrix/LSPatch v1.2-487、モジュールなし、moto g52j）:
   - **level 2**: 1回目は `edgecomputer.query` が `retCode=SUCCESS`×2、`SecException` 0件、`GENERATE_MTOP_SIGN_ERROR` なし（原本と同等）。
     2回目は MTOP ログが出ず `SecException` 1件（別経路 `doCommandNative` ← 難読化クラス）。有望だが要追加確認（実ログイン）。
   - **level 2 手動操作（オーナー確認, 23:04）**: 公式未改変版ではログインなしで商品一覧を閲覧できるのに対し、
     lv2 版はトップの商品一覧が真っ黒で、何をしてもログインを要求される。`:channel` プロセス（ACCS）が
     `adaemon-schedul` スレッドで SIGSEGV（SEGV_MAPERR, fault addr 0x6fc40）を起こしていた。
     → MTOP 署名生成は通るようになったが、別の完全性チェック／ネイティブ処理がまだ LSPatch 環境を拒否している。**lv2 単体では不十分**。
   - **level 3**: `MTOPSDK Default` スレッドで SIGSEGV、`:channel` プロセスも SIGSEGV。使用不可。
2. **root 環境で元署名を維持したまま差し替え**（Magisk mount / LSPosed モジュール化）
3. **未改変アプリ＋オーバーレイ翻訳**（`overlay/` 方式）：署名を壊さないため確実に動作します。

## 再現用メモ

- `scripts/ci_emulator_probe.sh <label> <apk>`：インストール・起動・同意タップ・スクリーンショット・logcat 取得
- APK はリポジトリに含めません（プロプライエタリのため）。
