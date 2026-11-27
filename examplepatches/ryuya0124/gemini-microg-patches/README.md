# Gemini microG patches

[日本語](#日本語) · [English](#english) · [GitHub](https://github.com/ryuya0124/gemini-microg-patches) · [GitLab](https://gitlab.com/ryuya0124/gemini-microg-patches) · [Forgejo](https://forgejo.ryuya-dev.net/ryuya0124/gemini-microg-patches)

[![Morphe Managerに追加 / Add to Morphe Manager](docs/assets/add-to-morphe-manager.svg)](https://morphe.software/add-source?github=ryuya0124/gemini-microg-patches)

Morphe登録用JSON / Morphe source JSON · [GitLab](https://gitlab.com/ryuya0124/gemini-microg-patches/-/raw/mirror-feed/patches-bundle.json) · [Forgejo](https://forgejo.ryuya-dev.net/patches-bundle.json)

## 日本語

標準のGeminiアプリは、Samsungのセキュアフォルダ内では仕事用プロファイル向けの利用制限にかかります。このMorpheパッチ集を使うと、セキュアフォルダ内でもmicroG経由でGeminiにログインしてチャットできます。Geminiランチャー、パッチ済みGoogleアプリ、microGを同じプロファイルにインストールします。

### できること

- **microGでログインしてチャット**。通常領域やSamsungセキュアフォルダで、microGに追加したGoogleアカウントを使えます。初回に権限が必要な場合は、アプリが用途を案内します。
- **公式アプリと併用**。標準のパッチ選択でGoogleとGeminiのクローンが作成され、端末標準のGoogleアプリと並べてインストールできます。
- **Geminiの単体APKに対応**。対応版のGeminiは分割APKをそろえずにインストールできます。
- **振動を個別に切り替え**。Geminiの設定に「Geminiの振動」と「Googleアプリの振動」があります。チャットの送信や回答時の振動と、Google検索やLensの振動を別々にオン／オフにできます。
- **既存チャットの更新警告を軽減**。会話を続けるときにアプリの更新を促されるケースを減らします。

### インストール

1. **Morphe Manager 2.7.1以降**を用意します。Android端末でこのページの **Add to Morphe Manager** をタップし、安定版のパッチソースを追加します。
2. Google **17.72.17.ve.arm64** と Gemini **1.0.995038376** の元APKを用意し、両方を **標準のパッチ選択** で処理します。Android 12では、GoogleはAndroid 11以降向け、GeminiはAndroid 10以降向けのバリアントを選びます。[対応APKとバリアント](docs/setup-en.md#input-versions-and-variants)
3. 端末標準のGoogleアプリを残した状態で、使用するプロファイルにmicroG、パッチ済みGoogle、パッチ済みGeminiをインストールします。セキュアフォルダで使う場合は、3つともフォルダ内にインストールします。microGにアカウントを追加してからGemini (Morphe)を開き、案内に沿ってアカウントへのアクセスを許可します。

ミラーを使う場合は、上のGitLabまたはForgejoのJSON URLを **Sources → Remote** に入力してください。MPPを手動で追加する場合は、リリースから `.mpp` を取得して **Sources → Local** で開けます。 [GitHubの安定版](https://github.com/ryuya0124/gemini-microg-patches/releases/latest) · [GitLabのリリース](https://gitlab.com/ryuya0124/gemini-microg-patches/-/releases) · [Forgejoのリリース](https://forgejo.ryuya-dev.net/ryuya0124/gemini-microg-patches/releases)

更新時は前回と同じ署名キーを使ってください。起動・ログイン・インストールで困ったときは、詳細手順を参照してください。[セットアップ詳細（英語）](docs/setup-en.md) · [トラブルシューティング](docs/troubleshooting.md)

## English

Gemini’s work-profile restrictions limit use of the official app inside Samsung Secure Folder. These Morphe patches let you sign in and chat with Gemini inside Secure Folder using microG. Install the Gemini launcher, the patched Google app, and microG in the same Android profile.

### What the patches do

- **Sign in and chat with microG.** Use the Google account added to microG in your regular profile or Samsung Secure Folder. The app explains why it needs account access before requesting permission.
- **Install alongside the official apps.** The default selection creates separate Google and Gemini clones that can coexist with the system Google app.
- **Use a single Gemini APK.** Supported Gemini versions can be installed without their resource splits.
- **Control vibration separately.** In Gemini settings, use separate switches for Gemini vibration during chats and for Google app vibration in Search and Lens.
- **Reduce the update warning for existing chats.** The patches mitigate the “Conversation requires an update” warning that can interrupt some conversations.

### Installation

1. Use **Morphe Manager 2.7.1 or newer**. Tap **Add to Morphe Manager** at the top of this page on your Android device to add the stable patch source.
2. Get the original APKs for Google **17.72.17.ve.arm64** and Gemini **1.0.995038376**. Patch both using the **default patch selection**. On Android 12, choose the Google variant for Android 11+ and the Gemini variant for Android 10+. [Supported APK variants](docs/setup-en.md#input-versions-and-variants)
3. Keep the system Google app installed. Install microG and both patched apps in the profile you want to use. For Secure Folder, install all three inside the folder. Add your account to microG, open Gemini (Morphe), and follow the prompts to grant account access.

To use a mirror, paste the GitLab or Forgejo JSON URL above into **Sources → Remote**. To add an MPP manually, download the `.mpp` from a release and open it via **Sources → Local**. [Stable release on GitHub](https://github.com/ryuya0124/gemini-microg-patches/releases/latest) · [GitLab releases](https://gitlab.com/ryuya0124/gemini-microg-patches/-/releases) · [Forgejo releases](https://forgejo.ryuya-dev.net/ryuya0124/gemini-microg-patches/releases)

Keep the same signing key when updating an existing installation. See the setup guide for help with APK variants, account permissions, and optional Play Store update blocking. [Detailed setup guide](docs/setup-en.md)

## 開発 / Development

[開発ガイド / Developer guide](docs/development.md)

## Credits

[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) · [Morphe patches](https://github.com/MorpheApp/morphe-patches) · [microG](https://github.com/microg/GmsCore)
