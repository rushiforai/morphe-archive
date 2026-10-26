# ローカル自動バックアップ報告の調査（未公開）

画像は有効OFF・保存先未選択・間隔12時間・保持5件。上書き更新との回答あり。設定全体の初期化ではない。現象の直接原因は未特定。保存先を推測して自動有効化しない。

## 改善

- 有効スイッチを同期commitへ変更し、失敗時は画面を戻してエラー表示。
- 同じtree authority/document IDの再選択は、URI表記が異なってもfiles/lastを保持。
- LocalBackupRetentionに所有を確認した記録だけの整理を分離。URI重複は最新出現を保持、消失済み記録は除外。古い削除失敗のために最新N件を削除しない。確認不可・削除失敗はstatus/通知に警告。
- 名前だけを根拠にフォルダ走査・既存ZIPの一括削除はしない。管理記録のないZIPや別アプリのZIPは対象外。ユーザーの実バックアップ削除なし。

## 確認

- 純Java 24,016項目成功。keep5、重複/消失、削除失敗、所有未確認、最新保護、件数1〜100/記録1〜120の組合せ。削除はin-memory fixtureのみ。
- 最終通常Lint Android build成功、build/local-auto-backup-verified-build.log（4分18秒）。並行作業の認証/共有NGソースも含む作業ツリー候補であり公開物とは異なる。
- emulator-5554のsettingsfix191へ同一署名照合install-r Success。最終候補の上書き前後でenabled、tree、hours12/keep5、last保持、別URI表記の同一フォルダ選択時にfiles/last保持、計5項目成功。build/local-backup-update191-final.log。
- 元のSharedPreferencesを検証アプリ内へ退避し、検査後に完全復元、退避用prefs削除も確認。実SAF権限取得・本物のZIP生成/削除は未実施。
- 初回fixtureはJava LongをJS strict equalityで比較し失敗。未来時刻も時計巻戻り判定を起動するため、現在時刻へ是正。最終fixtureは保存時刻を文字列比較し成功。初回の失敗/Frida load timeoutはアプリ修正成功の根拠にしない。
- 1.12.1利用者の設定消失は未再現。保持件数超過が削除失敗か管理対象外ZIPかは未確定。実provider権限・削除失敗を含む通し試験、設定消失の原因特定は残る。公開なし。

## 最終候補の導入情報

- serial emulator-5554 / Haiagaru 検証 191 / ChMate0.8.10.191 dev / jp.co.airfront.android.a2chMate.haiagaru.settingsfix191。2026-10-24 13:00前後JSTに署名照合install-r Success。
- 絶対root C:/Users/narum/.codex/worktrees/945d/morphe-chmate/output/haiagaru-current/。
- APK build/local-auto-backup-verified191.apk SHA256 C179B292615CE6E717B7DC320452BF3891DE2C5B2A86DCC05298B8B94C14B1B6。
- MPP build/local-auto-backup-verified.mpp SHA256 66ADBD66E4DCFA399B99AD2AC8A69E880D824B8ECBB6D9EF5D90EB7E85F2D971。
- 鍵 C:/Users/narum/morphe-chmate-local/tools/morphe-data/morphe.keystore、alias Morphe、証明書SHA256 0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed。
- 中間候補: build/local-auto-backup-fix191.apk SHA256 317C9F353FDF39CA5F850BD162C31158E1E140ED77CA37FBEF3D47616AC4ACE0、MPP build/local-auto-backup-fix.mpp SHA256 355FB4A7EAA1A4382AEC0BF7718A27117D2DD47140464E065069F6F627B8A92D。同じserial/package/鍵で上書き後、上記最終候補へ更新済み。
