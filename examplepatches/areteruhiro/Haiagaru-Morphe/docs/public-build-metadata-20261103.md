# 公開文書と配布物の開発環境メタデータ整理（1.21.0で公開）

公開文書20件のローカル作業ディレクトリをworkspace基準へ、作業ブランチ名の開発ツール接頭辞を一般表記へ変更。AGENTS.mdはローカルに保持し公開追跡対象から除外。絶対パスを含む記録原本21件はbuild/local-development-recordsへ退避し、以後の導入記録も原本へ追記する。過去のGit履歴/既存Release/既存APKは書換えない。

Go製VPN JNIライブラリに作業環境の絶対パスが含まれていたため、BuildImageVpnStackへ-trimpathと-X runtime.modinfo=を追加して4ABIを再生成。gomobileが作るローカルmodule replace情報はtrimpathだけでは消えないため、バイナリ内のmodule metadataも抑止。go.mod/go.sumと第三者ライセンスは保持する。Goコード/依存版/APIは不変、Java側17classは旧版とバイト同一。依存checksum照合・Go private stackテスト成功。ELF LOADは全ABI16KiB、JNI初期化/close2回/切断後パケット拒否の端末試験成功、実VPN接続なし。

チェックサムを新ライブラリへ合わせ、ZIP/AAR誤選択/不正hash拒否をVerifyOptionalLibrariesで確認。最初のAPK照合ハーネスは242に追加されない191専用TensorFlowまで要求して失敗、VPN4ABIを個別照合して一致し、正しいライブラリ検証を再実施。MPP/VPN ZIP/AAR/Source JAR/191と242の最終APKを展開して残存文字列なし、CRC正常。build/portable-backup-clean-final-artifact-scan.json、image-vpn-private-metadata-api-alignment.json。旧公開assetは旧内容のままなので、更新候補MPPには対応する新しいZIP/AARを使用する。

2026-11-03: 正式版 [1.21.0](https://github.com/areteruhiro/Haiagaru-Morphe/releases/tag/1.21.0) に収録。公開CIと配布6資材・更新JSONの照合を完了。試験範囲・再現に至らなかった条件は本文記載のとおり。
