[English](README.md) | [한국어](README_KR.md) | [日本語](README_JP.md)

# Niconico YT Comments

Android版YouTubeプレーヤー上に、ライブチャットとチャットリプレイをニコニコ風の弾幕コメントとして表示するMorpheパッチです。

## 主な機能

- 公開ライブチャットとチャットリプレイの表示
- YouTubeカスタム絵文字、メンバーシップコメント、Super Chatの色表示
- コメント表示を切り替えるプレーヤーの`弾`ボタン
- `弾`ボタンの長押しによるフォントサイズと透明度の設定

※ログインが必要な非公開、メンバー限定、年齢制限付きチャットなどには対応していません。

<img width="480" height="412" alt="image" src="https://github.com/user-attachments/assets/aebf4f85-b6c4-40d0-8df0-3e2a75655b4f" />
<img width="480" height="412" alt="image" src="https://github.com/user-attachments/assets/1e6fcc4c-1a60-499c-9c9b-deaced660d17" />

https://github.com/user-attachments/assets/f29e2231-e159-43ad-8999-8451dfaef7f3

## 必要環境

- Morphe
- Android 9以降（API 28+）
- 未改変のYouTube `21.04.223` APK
- MorpheのExpert modeを有効化

## インストール方法

### 1. Expert modeを有効にする

このパッチはSimple modeでは自動選択されません。Morpheで次のメニューを開きます。

```text
Settings → Advanced → Expert settings → Expert mode
```

Expert modeを有効にし、確認メッセージを承認します。

### 2. パッチソースを追加する

#### リモートソース（推奨）

Morpheで次のメニューを開きます。

```text
Sources → ＋ → Remote
```

次のリポジトリURLを入力して**Add**をタップします。

```text
https://github.com/david419kr/niconico-yt-morphe-patches
```

Android端末では、[Morpheで開く](https://morphe.software/add-source?github=david419kr%2Fniconico-yt-morphe-patches&name=Niconico%20YT%20Comments)リンクも利用できます。

#### ローカル`.mpp`ソース

1. [GitHub Releases](https://github.com/david419kr/niconico-yt-morphe-patches/releases)から`patches-1.3.1.mpp`をダウンロードします。
2. Morpheで`Sources → ＋ → Local`を開きます。
3. ダウンロードした`.mpp`ファイルを選択し、**Add**をタップします。

ファイル名や拡張子を変更したり、再圧縮したりしないでください。Androidのファイルマネージャーから`.mpp`を直接開き、Morpheを選択することもできます。

### 3. YouTubeをパッチする

1. Morpheのホーム画面で**YouTube**を選択します。
2. バージョン`21.04.223`を選び、未改変の`.apk`ファイルを指定します。
3. **Morphe Patches**タブで推奨パッチを有効にします。
4. **Niconico YT Comments Patches**タブで次のパッチを有効にします。

   ```text
   Niconico-style live/replay comments (Experimental)
   ```

5. **Proceed to patching**をタップします。
6. 複数のパッチソースに関する警告を確認します。公式Morpheパッチとこのパッチを同時に選択するのは意図した動作です。
7. パッチ済みAPKをインストールします。Androidから不明なアプリのインストール権限を求められた場合は、Morpheに許可します。

非root端末では、公式Morpheの推奨パッチとこのパッチを併用することを推奨します。このコメント専用パッチに含まれない一般的なパッケージ名変更やログイン対応を公式パッチが提供します。

## 更新方法

- **リモートソース:** `Sources`でソースを選び、**Update**をタップします。
- **ローカルソース:** 既存のソースを削除し、新しい`.mpp`をダウンロードして追加し直します。
