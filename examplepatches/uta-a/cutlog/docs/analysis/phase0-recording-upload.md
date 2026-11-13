# Phase 0 解析: 録画完了点とアップロード経路

対象: setlog `com.newchat.setlog` v1.3 / versionCode 76 / arm64-v8a（Google Play 版）
手段: `jadx` による静的解析（読み取りのみ）。デコンパイル結果はコミットしない。

## 前提: 難読化の状況

アプリ本体のビジネスロジックは `com/newchat/setlog` にはほぼ残っておらず、R8 で `defpackage`（`a40`, `vb0` 等）へ移動している。`com/newchat/setlog` 配下は View クラスのみ。CameraX ライブラリ本体も `defpackage` に難読化されて混在。残存するデバッグ文字列（`CollectionCamera*`、toString 等）を手がかりに特定した。

カメラ系クラス対応表（文字列リテラルから確証あり）:

| 難読化名 | 実体 |
| --- | --- |
| `vb0` | CollectionCamera フラグメント（録画コントローラ本体） |
| `oc0` | `CollectionCameraResult`（画面間受け渡しの Parcelable） |
| `ac0` | `CollectionCameraMetadata`、`u40` = `CaptureContext` |
| `mc0`/`kc0`/`jc0`/`lc0` | `CollectionCameraRecordingEvent`（基底/成功/エラー/開始） |
| `za0` | カメラ facade interface。実装は `a40`(CameraX) と `k00`(Camera2) の2系統 |
| `vl`/`l22` | CameraX の `FileOutputOptionsInternal`/`FileOutputOptions` |

## 1. 録画完了点（確度: 高）

録画開始・出力先決定の単一 choke point:

- `vb0.l1(boolean, boolean)` が録画開始メソッド（`vb0.java:3098`）
- 出力ファイル決定（`vb0.java:3101-3106`）:
  ```java
  File cacheDir = m0().getCacheDir();
  File file = new File(cacheDir, "camera"); file.mkdirs();
  File file2 = new File(file, "collection_camera_" + jCurrentTimeMillis + ".mp4");
  this.p1 = file2;
  ```
- 録画開始（`vb0.java:3135`）: `za0Var.b(file2, ..., handleRecordingEvent)`

バックエンド2系統（いずれも vb0 が決めた同じ File に書く）:

- CameraX: `a40.b(File, ...)`（`a40.java:58`）。`l22(new vl(0,0,file))` = FileOutputOptions を File から構築（`a40.java:85`）。`gz3`=Recorder、`uz4`=VideoCapture
- Camera2: `k00.b(File, ...)`（`k00.java:464`）→ `c00`（MediaRecorder/MediaCodec セッション）

VideoRecordEvent.Finalize ハンドラ（`va0.java:46-88`、`vy0`=Consumer<VideoRecordEvent>）:
```java
if (o15Var instanceof j15) {          // Finalize
    int i = j15Var.c;                  // エラーコード
    File file = this.d;
    if (i == 0) ja2Var.c(new kc0(file, ya0Var.m, this.e));  // 成功→File を返す
    else        ja2Var.c(new jc0(error, file));             // 失敗
}
```

出力先の種別: **FileOutputOptions（File ベース）。MediaStore ではない。** パスは `<cacheDir>/camera/collection_camera_<currentTimeMillis>.mp4`。アプリ内部キャッシュ。

（別に MediaStore を使う `u20.java`（DIRECTORY_MOVIES/Setlog）があるが、これは端末ギャラリーへの保存機能で投稿アップロードとは別経路。）

## 2. ファイルパスの流れ（録画結果 → 投稿入口、確度: 高）

```
[録画完了] va0.java:81  kc0(file)   file = cache/camera/collection_camera_*.mp4
   │  (ja2 コールバック経由)
   ▼
ob0.java  (コルーチン, 録画結果 → CollectionCameraResult 変換)
   ├ ob0.java:55  i7(file,...) → np2.v(file,...) で ac0(長さ/幅/高さ/回転)抽出
   │                （np2.java:587 MediaMetadataRetriever 9=duration,18=w,19=h,24=rotation）
   ├ ob0.java:79  Uri uriFromFile = Uri.fromFile(file);
   └ ob0.java:109 vb0.G0(new oc0(uriFromFile, "video/mp4", duration, w, h,
                                  lensFacing, hasAudio, timestampMs, utcOffset, countryCode));
   ▼
vb0.G0(oc0)  vb0.java:295  ★ 両バックエンドが必ず合流する単一の出口
   └ setFragmentResult(requestKey, {"cancelled":false, "result":oc0})   (vb0.java:303)
   ▼
zq0.java:37-52  FragmentResult リスナ: getParcelable("result", oc0.class)
   └ "camera_result" として転送。"show_preview_after_capture" フラグあり(zq0.java:59)
   ▼
j5.java:677-682  w20.p0({"camera_result":oc0, "current_user_id", "parent_message_id",
                          "conversation_store_key", "conversation_json"})
   ▼
w20.java  = プレビュー/確認画面（media3 PlayerView で録画再生）。oc0 を n1="cameraResult" に保持
   ▼
wh0.java:57 r0(...) → mc3(投稿メッセージ)構築。oc3(メディア添付)に localUri 等
   ▼
[アップロード] y31.java（下記 3）
```

`oc0`（CollectionCameraResult）の全フィールド:
`X=Uri(file), Y=mimeType, Z=durationMs, a0=width, b0=height, c0=lensFacing, d0=hasAudio, e0=captureTimestampMs(Long), f0=captureUTCOffsetSeconds(Integer), g0=captureCountryCode(String)`

## 3. アップロード経路（確度: 高）

方式: **署名付き URL への HTTP PUT（S3 presigned-URL 相当）。okhttp3 は shade 済み（`iy2`=Request.Builder, `v24`=File RequestBody）。Retrofit/multipart 不使用。**

1. 署名リクエスト（`y31.java:260`）: body = `{"contentType": mime, "region": region, "encrypted": bool}`
   - エンドポイント: `https://api-kr.newchatapi.com/media/getUploadURL`（ap-northeast-2）または `https://api.newchatapi.com/media/getUploadURL`（us-east-1）。リージョン判定 `s93.java:9-22`（KR/JP/CN/TW/HK/MO/SG/TH/VN/PH/MY/ID または韓国語 → ap-northeast-2）
2. レスポンスから `uploadUrl`/`region`/`key` 取得（`y31.java:280-289`）。`key` が保存先リモートパス
3. 実アップロード（`yh2.java:114-`）:
   ```java
   iy2Var2.J(uploadUrl);
   iy2Var2.x("PUT", new v24(mime, file));   // 生ファイル1本を PUT（multipart でない）
   iy2Var2.v("Content-Type", mime);
   ```
4. メディアは暗号化される（`encrypted` フラグ、`pb3.java`/`wc3.java`: media-v2/shared-media 鍵導出、`mediaCipherV`）。アップロード前に `y31` が media3 Transformer + GL シェーダ（`y31.java:445` の `R.raw.vertex_shader_transformation_es2`/`fragment_shader_alpha_scale_es2`）で変換している形跡あり（具体内容は推測、全パス未追跡）
5. 取得した `key` を `oc3.path` に設定し、投稿メッセージ `mc3` を `chat/message/save`（`wh1.java:1497`）で送信

投稿メッセージ `mc3.a()` → JSON（`mc3.java:153-287`）に載るメタデータ:

- メッセージレベル: `messageId`/`id`, `conversationId`（グループ/会話 ID）, `senderId`, `senderName`, `parentId`, `message`(テキスト), `contentType`/`type`/`messageType`, **`timestamp`（クライアント値、下記4）**, `location`{x,y}, `envelope`/`keys`[]/`mediaCipherV`, `reactions`, `readBy`, `savedBy`, `isDeleted`, `isLocal`
- メディア配列 `media`[]（各 `oc3`）: `id`, `messageId`, `path`(リモート key), `localUri`, `region`, `captureUTCOffsetSeconds`, `captureCountryCode`, `dimensions`{width,height}, `mimeType`, `mediaType`, `hasAudio`, `fullscreen`, `isIntro`, `permission`(view_once 等), `captions`[], `localLocation`

署名リクエスト自体は長さ・ハッシュ・サイズを含まない。リッチなメタデータは `chat/message/save` 本体に入る。ハッシュ系キーは確認できず（なしの可能性が高い）。

## 4. 投稿時刻の扱い（判断: クライアント送信値、確度: 高）

- 撮影時刻は録画開始時にクライアントで取得（`vb0.java:3037-3045` の `j1()`）:
  ```java
  long jCurrentTimeMillis = System.currentTimeMillis();
  this.Z1 = new u40(offset(...), jCurrentTimeMillis, v40.a(countryCode));  // CaptureContext
  ```
- `oc0.e0 = captureTimestampMs` として結果に乗る（`ob0.java:109`）
- 投稿組み立て時（`w20.java:103-105`）: `long t = oc0.e0 != null ? oc0.e0 : System.currentTimeMillis();`
- この値が `mc3` の `timestamp` として body に入って送信（`mc3.java:173`）

→ 投稿時刻 = 録画開始時のクライアント時計値。サーバー受信時刻ではない。F5（過去投稿）は timestamp 書き換えで技術的には可能だが、サーバー検証は未確認。

## 5. 中間画面・処理（確度: 中〜高）

- プレビュー/確認画面あり: `w20.java`（media3 PlayerView で録画再生）。`oc0` を保持し投稿メッセージを組み立てる。入口 `w20.p0(bundle)`（`j5.java:682`）。表示は `show_preview_after_capture` フラグ条件付き（`zq0.java:59`）
- グループ/会話選択はカメラ起動前に確定済み（`conversation_store_key` 等を `w20` に渡す）。カメラ結果は FragmentResult で親へ返る
- 位置情報選択 `collection_location_selection`（`wh0.java:1248`）、キャプション `mb3` あり
- `collection`（デイリーログ）系と `chat/message` 系の2系統がある。録画→投稿は命名（`collection_camera_*`）から collections 系が主で、`w20` 経由で最終的に `chat/message/save` に落ちる。正確な使い分けは実機確認で確定する

## 6. フック候補点の推奨

**第一推奨: `vb0.G0(oc0)` の入口（`vb0.java:295`）。**

- 録画完了後の単一 choke point。CameraX/Camera2 どちらも必ず通る。到達時点で mp4 は書き込み済み
- 引数 `oc0` が「ファイル Uri + 全メタデータ」を一式持つ。編集後の新ファイルを指す `oc0` を作り直して `G0` を呼べば以降は既存経路に乗る
- アプリ本体コード（ライブラリでない）で安定

代替:

- (a) `ob0.java:109`（`new oc0(Uri.fromFile(file), ...)`）: 生 File を直接握れる最精密点。差し替えると幅/高さ/長さが `np2.v` で再取得される経路に乗せやすい
- (b) `w20`（確認画面）に「編集」ボタンを足して `oc0` を差し替える。本体が media3 Transformer + GL シェーダ変換を既に持つため編集基盤として再利用できる可能性
- (c) 出力パスが予測可能（`cacheDir/camera/collection_camera_*.mp4`）なので Finalize 後にファイルを上書きする方式も可能。ただし完了同期が別途必要でメソッドフックの方が確実

アップロード直前（`y31`）で media3 再変換が入るため、編集は G0/ob0/w20 の段階で mp4 を差し替えれば保持される見込み（PoC で要検証）。

## 未検証・推測

- `y31` のトランスコード/GL 変換の具体内容（解像度固定・透かし等）は推測。全コードパス未追跡
- `collection` 系と `chat/message` 系の使い分けは実機 UI フロー確認で確定する
- 公式撮影分の秒数・解像度・コーデック・音声有無は [phase0-output-profile.md](phase0-output-profile.md) で確認済み。ただし「保存」経路の値で、投稿経路との差は Phase 1 で検証する
