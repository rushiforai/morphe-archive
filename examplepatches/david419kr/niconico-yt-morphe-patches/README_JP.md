[English](README.md) | [한국어](README_KR.md) | [日本語](README_JP.md)

# Niconico YT Comments

> **この機能は公式Morphe Patchesに統合されました。**
>
> このリポジトリで提供していたニコニコ風のライブチャット・チャットリプレイ機能は、
> **Morphe Patches 2.0.0以降**に含まれています。
> 個別のパッチバンドルや、このリポジトリのリモートソースを追加する必要はありません。

新規インストールや更新には、
[公式Morphe Patches](https://github.com/MorpheApp/morphe-patches)をご利用ください。

## 公式パッチの使い方

1. Morphe Managerと公式の**Morphe Patches**ソースを最新の安定版に更新します。
2. 従来の個別ソース**Niconico YT Comments Patches**を無効化または削除します。
   個人テスト用の**Niconico YT Integration Test**ソースを追加していた場合は、そちらも無効化または削除してください。
3. 公式ソースが対応する未改変のYouTube APKを選択します。
   **Niconico comments**が選択されていることを確認してください。デフォルトのパッチ選択に含まれています。
4. 公式ソースでYouTubeをパッチし、生成されたAPKをインストールします。
5. パッチ済みYouTubeの**設定 → Morphe → Player → Niconico comments**で
   機能を有効にし、案内に従ってアプリを再起動します。

プレーヤーのコメントアイコンをタップすると、コメント表示を切り替えられます。
長押しするとクイック設定が開きます。

**パッチソースの更新だけでは、インストール済みのYouTubeアプリは更新されません。
公式実装へ切り替えるには、APKへの再パッチとインストールが必要です。**
切り替え後は、ニコニココメントの設定も確認してください。

## このリポジトリについて

このリポジトリは、最初の個別Morpheパッチバンドルを記録として残すためにアーカイブされています。

この機能は[PR #4080](https://github.com/MorpheApp/morphe-patches/pull/4080)を通じて
2026年10月27日に公式Morphe Patchesへマージされ、
[Morphe Patches 2.0.0](https://github.com/MorpheApp/morphe-patches/releases/tag/v2.0.0)で初めて正式リリースされました。

その後も公式実装には改善が加えられています。
現在の対応バージョン、更新情報、お問い合わせ先は
[公式リポジトリ](https://github.com/MorpheApp/morphe-patches)をご確認ください。

この機能を統合・改善してくださったMorpheのメンテナーの皆様に感謝します！
