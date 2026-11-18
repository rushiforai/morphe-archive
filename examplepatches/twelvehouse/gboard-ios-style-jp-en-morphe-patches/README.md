# Gboard iOS-style JP/EN Patches (for Morphe)

Gboard の日本語フリックと英語キーボードを iPhone 風の配置にする、非公式の [Morphe](https://morphe.software) 用パッチです。

![スクリーンショット: 左から日本語の 12 キー、英語の英字、URL 入力欄での英語の英字](.github/assets/screenshots.png)

## 使い方

1. Morphe Manager にこのリポジトリをソースとして追加します。

   <a href="https://morphe.software/add-source?github=twelvehouse/gboard-ios-style-jp-en-morphe-patches">
     <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
   </a>

   または `https://github.com/twelvehouse/gboard-ios-style-jp-en-morphe-patches` を手で追加します。
2. 対応する版の Gboard（下のパッチ一覧を参照）にパッチを当てて、インストールします。
3. Android の設定で、パッチを当てた Gboard を有効にして選びます。

## 推奨設定

Gboard の設定で次のようにすると、スクリーンショットと同じになります。

- 言語 → 日本語 → 12 キー → フリックのみ: **オン**（同じ文字を続けて入力できます）
- 設定 → 数字行: **オフ**（数字は q〜p の長押しで入力できます）
- 設定 → カンマキー / ピリオドキー: **オフ**

## 注意

- Gboard がプリインストールされている端末では、「Change package name」パッチを利用してください。
- 日本語の設定の「三状態キーボードの使用」は、オンでもオフでも変わりません。左の列に 123・ABC・あいう のキーがいつも並ぶためです。

## パッチ一覧

<!-- PATCHES_START EXPANDED -->
> **[v1.3.0](https://github.com/twelvehouse/gboard-ios-style-jp-en-morphe-patches/releases/tag/v1.3.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Gboard&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `com.google.android.inputmethod.latin`

**🎯 Supported versions:**

| 18.6.3.1002251336-release-arm64-v8a | 18.5.11.993608717-release-arm64-v8a | 18.5.10.993608717-release-arm64-v8a | 18.5.9.993608717-release-arm64-v8a | 18.5.6.993608717-release-arm64-v8a | 18.5.4.993608717-release-arm64-v8a |
| :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change package name](#change-package-name) | Installs the patched Gboard as a separate app next to the stock Gboard, which is usually a system app that cannot be replaced by an APK with another signature. | • Package name |
| [Immediate globe key](#immediate-globe-key) | Lets the globe key switch languages right after typing on the letter keyboards, as it does on iOS. Gboard otherwise ignores it for half a second after a key is typed. |  |
| [iOS QWERTY layout](#ios-qwerty-layout) | Puts the globe key of the letter keyboards at the bottom left, where it is on the Japanese 12-key keyboards, and lays out the English symbol keyboard like the iOS "123" and "#+=" pages. Gboard's number row setting keeps working. |  |
| [iOS flick layout](#ios-flick-layout) | Changes the Japanese 12-key keyboard to the layout of iOS with "flick only" enabled: 123, ABC and あいう keys and the globe key on the left, and backspace, space and a two-row enter key on the right. | • Mark the active mode key |

</details>

<!-- PATCHES_END -->
