# 追加ファイルを選んでパッチを軽くする

基本機能だけなら、追加ファイルのダウンロードは不要です。以下は必要な機能だけ選んでください。追加ファイルはMPPに含めず、選択した場合だけ生成APKへ組み込みます。

| 必要な機能 | 保存するファイル | Morpheで選ぶ場所 | 未選択の場合 |
| --- | --- | --- | --- |
| 端末にない絵文字の補完 | NotoColorEmoji.ttf | Haiagaru → オプション → 絵文字フォントを選択 | 端末標準の絵文字。新しい絵文字が表示できない場合があります |
| 191 devの自動NG画像判定クラッシュ修正 | haiagaru-image-ng.zip | Haiagaru → オプション → 191画像判定の修正ファイルを選択 | 本体の判定ライブラリを維持。既知のクラッシュ修正は適用しません |
| 対象画像のVPN取得（実験用） | haiagaru-image-vpn-v2.zip（従来image-stack.aarも可） | 画像取得専用VPN → オプション → VPN用ZIP／AARを選択 | VPNを追加しません。このパッチのチェックは外してください |

## 初めて使う場合

1. 下のGitHub配布先から、必要なファイルだけ端末の「ダウンロード」に保存します。AAR・ZIPは展開しません。
2. MorpheでChMateのAPKとHaiagaruパッチを選び、「Haiagaru」のオプションを開きます。
3. 必要な項目のファイル選択を押し、保存したファイルを選びます。選んだファイル名を確認してください。PC版ではファイルの絶対パスも使用できます。
4. 絵文字の範囲は `missing`（端末にない絵文字だけ）を推奨します。`all` は全絵文字、`off` は追加フォントを使いません。
5. 画像判定の修正は191 devだけが対象です。「191の自動NG画像判定クラッシュを修正」を `true` にし、修正ZIPも選んでください。226／242は選択不要です。
6. VPNが必要なら「画像取得専用VPN」にチェックし、そのオプションで `haiagaru-image-vpn-v2.zip` または従来の `image-stack.aar` を選択します。パッチ適用・インストール後にHaiagaru設定で有効化してください。
7. パッチを適用して生成APKをインストールします。後から追加・変更する場合は元APKへ再度パッチを適用します。端末標準のファイル選択が表示されるので、ファイル名を選択すれば構いません。

選択したファイルが削除・移動された場合は、再度ダウンロードして選び直してください。ライブラリの不一致はエラーにして適用を止めます。

### libgojni.soが含まれるファイルを選ぶよう表示された場合

これはImage NGではなく、**画像取得専用VPNの追加ファイル**のエラーです。`haiagaru-image-ng.zip` にはVPNは入っていません。

- VPNを使わない場合: 「画像取得専用VPN（実験用・検証中）」のチェックを外してください。Image NG用ZIPはHaiagaruの191画像判定オプションで選択したままで構いません。
- VPNも使う場合: [VPN用haiagaru-image-vpn-v2.zip](https://github.com/areteruhiro/Haiagaru-Morphe/releases/download/1.12.0-dev.4/haiagaru-image-vpn-v2.zip)を保存し、**VPN側のファイル選択**で指定してください。以前のパッチ向けに従来名のZIPも配布します。ZIP対応前のパッチでは、下の従来AARを使います。

ZIPはどちらも展開せず選びます。ファイル名を変更して代用しても、内容が違うため適用できません。

## GitHubの配布先・ソース

- **絵文字フォント**: [NotoColorEmoji.ttfをダウンロード](https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/79759fb0ab0fa30a6755be13a53546b06d2cdf8d/patches/src/main/resources/chmate/emoji/NotoColorEmoji.ttf)。[開発元・ソース](https://github.com/googlefonts/noto-emoji)、[OFLライセンス](https://github.com/areteruhiro/Haiagaru-Morphe/blob/79759fb0ab0fa30a6755be13a53546b06d2cdf8d/patches/src/main/resources/chmate/emoji/OFL.txt)。
- **VPNライブラリ**: [image-stack.aarをダウンロード](https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/79759fb0ab0fa30a6755be13a53546b06d2cdf8d/vpn/image-stack/prebuilt/image-stack.aar)。[ソース・ビルド用ファイル](https://github.com/areteruhiro/Haiagaru-Morphe/tree/79759fb0ab0fa30a6755be13a53546b06d2cdf8d/vpn/image-stack)、[ソースJAR](https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/79759fb0ab0fa30a6755be13a53546b06d2cdf8d/vpn/image-stack/prebuilt/image-stack-sources.jar)、[第三者ライセンス](https://github.com/areteruhiro/Haiagaru-Morphe/tree/79759fb0ab0fa30a6755be13a53546b06d2cdf8d/third-party/image-stack)。VPNの全経路検証は未完了です。
- **画像判定の修正**: [haiagaru-image-ng.zipをGitHubから直接ダウンロード](https://raw.githubusercontent.com/areteruhiro/Haiagaru-Morphe/dev/optional-assets/haiagaru-image-ng.zip)。[GitHub Releases](https://github.com/areteruhiro/Haiagaru-Morphe/releases)にも軽量化対応版から同じZIPを添付します。[配布バイナリ](https://github.com/areteruhiro/Haiagaru-Morphe/tree/79759fb0ab0fa30a6755be13a53546b06d2cdf8d/patches/src/main/resources/chmate/tflite-226)、[TensorFlowのソース](https://github.com/tensorflow/tensorflow)。修正用バイナリはChMate 226 dev由来です。任意のTensorFlowビルドで代用することはできません。

画像判定ZIPとVPN用ZIP／AARはそれぞれ4種類のCPU向けライブラリを含み、利用者がCPUを調べて選ぶ必要はありません。画像判定は対応する226 dev元APKの選択にも対応しています。

## 開発者向け

`./gradlew :patches:buildAndroid` は画像判定ZIPとVPN用ZIPを生成し、通常のSemantic Release CIでMPPと別々に添付します。巨大資材のソース・ライセンスはリポジトリに残し、MPPのリソースからだけ除外します。生成先は画像判定が `optional-assets/haiagaru-image-ng.zip`、新しいVPN版が `build/optional-assets/haiagaru-image-vpn-v2.zip`、旧パッチ互換用が `build/optional-assets/haiagaru-image-vpn.zip` です。VPN ZIPにはAAR内のJNIライブラリと対応する第三者ライセンスを含めます。
