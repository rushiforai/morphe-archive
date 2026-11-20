# NGワードの安全な登録

2026-11-19 `1.46.0-dev.9` プレリリース公開済み。NG ID・NGName・NGワードで私用領域を広く対象にする正規表現の登録を拒否し、NGワードは6文字未満の新規条件を拒否する。6文字条件はNGWordのWORDカテゴリのみで、短いNG ID・NGNameは従来どおり登録できる。

## 実装

- `NgRuleSafety` がNGWord登録を検証する。ID・NGName・NGワードの正規表現へ禁止範囲を適用する。最小長はWORDカテゴリだけにtrim後のUnicodeコードポイント数で6。補助文字・絵文字も1コードポイントとして数える。
- 正規表現フラグが有効で、明示Unicode範囲がBMP私用領域 `E000–F8FF`、補助面15/16の私用領域と交差する場合は拒否する。提示された `.*[\\x{E000}-\\x{F8FF}\\x{10000}-\\x{FFFFF}].*` を含む。規則はそのまま保存されない。
- ネイティブNGWord追加/編集フック、`NativeNgStore`更新・置換経路、レス複数選択のNGワード登録に共通検証を追加。既存ルールの対象板・連鎖・非表示設定の編集は、短い既存条件の文字列を変更しない限り妨げない。
- 起動時にID・NAME・WORDストアを走査し、既存の「正規表現」フラグ付き私用領域ルールだけ削除する。6文字未満の既存NGワードや、同じ文字列を持つ通常ルールは削除しない。

## 確認

- Host Java: 16項目成功。提示されたBMP/補助面範囲、通常Unicode範囲、6文字境界、絵文字コードポイント数、短いID/NAMEへの文字数制限の非適用、既存短文を編集時に保持することを確認。
- Frida 17.18.0: reporter191/226/242各18項目成功。各隔離アプリでnative NG追加フックが全3カテゴリの不正正規表現を拒否し、5文字のNGワードと6文字条件を確認。短いID/NAMEは許可することを確認。WORDストアへ禁止ルール・5文字の旧ルール・通常語を一時保存し、移行が禁止1件だけを除去して他2件を残すことを実機で確認。テスト後は元のNG一覧へ戻した。
- `:patches:buildAndroid`成功（1.46.0-dev.8基準）。191/226/242 APKを同一Morphe証明書で署名し、Mi Note 10 Android 11のreporter packageへデータ保持install-r。全版を起動しFrida確認。通常ChMate package、通常アプリのNG一覧は変更していない。

## 生成物

- CI公開MPP SHA-256: `4e09e8f10395579b54b30b6c32a2e2adcfd07d27d3a362227003bfb6528de395`
- 検証時MPP SHA-256: `29e94aed9264e684c7634b47cf8c64d3f237ad393ac5eeb012e4071fbf9db8d4`
- APKs: `build/ng-word-safety-20261119/apks/final191.apk`, `final226.apk`, `final242.apk`
- 署名証明書SHA-256: `0af4ddc1302b93481adb5c7d9657aae48d8d6733afc1e15d01129107a59c1eed`

Release: https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.46.0-dev.9
