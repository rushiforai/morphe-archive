# Force TV Patches for Morphe

Morphe patches that make apps believe they are running on an Android TV, so a phone build that secretly contains a TV interface will actually use it — on any device, with no root and no bootloader unlock.

**[➕ Add to Morphe](https://morphe.software/add-source?github=kabukabu-a11y/force-tv-patches&name=Force+TV+Patches)** — open this link on the Android device where Morphe Manager is installed, and the source is handed to Morphe directly.

Or add the source manually in Morphe Manager (Sources → + → Remote), using any of these:

```
github.com/kabukabu-a11y/force-tv-patches
https://raw.githubusercontent.com/kabukabu-a11y/force-tv-patches/main/patches-bundle.json
```

日本語の説明は下半分にあります。

## How it works

Android gives apps two standard ways to detect a TV, and a lot of apps gate their TV interface behind exactly these checks:

1. **Leanback system features** — `PackageManager.hasSystemFeature("android.software.leanback")` (or `android.software.leanback_only` / `android.hardware.type.television`). This is the method the Android documentation recommends.
2. **UiModeManager** — `UiModeManager.getCurrentModeType() == Configuration.UI_MODE_TYPE_TELEVISION`.

The universal patches find the small boolean helper methods that perform these checks and make them always answer "yes, this is a TV". The feature names are platform constants, so the fingerprints keep working even in obfuscated apps, and no app version is pinned.

This can only unlock a TV interface that **already exists inside the same APK** and is gated **only** by device-type detection. If the TV interface lives in a separate TV-only APK, or the app additionally checks signatures, integrity or server-side flags, no detection patch can help (see Compatibility).

## Patches

| Patch | Target | Default | What it does |
|---|---|---|---|
| Force TV mode for Zangetsu | Zangetsu (any version; verified on 2.3.6) | On | Precise patch for Zangetsu: flips both of its TV checks — the `isTv` device channel used by the Dart UI, and `Globals.isAutoTv` in the built-in CloudStream plugin host. |
| Force TV mode (leanback check) | Universal | **Off** | Makes every boolean method that references a leanback feature string return true. Experimental heuristic. |
| Force TV mode (UiModeManager check) | Universal | **Off** | Makes every boolean method that queries `UiModeManager.getCurrentModeType()` return true. Experimental heuristic. |
| Rename app (add TV suffix) | Universal | **Off** | Appends " TV" to the app name: "Zangetsu" → "Zangetsu TV". Experimental — often has no effect. |
| Rename app (add (TV) suffix) | Universal | **Off** | Appends " (TV)" to the app name: "Zangetsu" → "Zangetsu (TV)". Experimental — often has no effect. |

Notes on the universal patches:

- They fail with a clear message when the app contains no matching detection code, instead of silently doing nothing.
- Morphe requires universal patches to be declared off by default, so enable them per app when patching.
- The heuristic can, in principle, catch a boolean method that mixes the TV check into a larger decision. If an app misbehaves after patching, turn the universal patches off for that app first.
- The rename patches edit the label string resource (or a literal manifest label). Per-locale labels, if an app defines them, keep the original name.

## Install

1. Install [Morphe Manager](https://morphe.software).
2. Add this patch source with the **Add to Morphe** link above, or paste the repository URL manually.
3. Pick the app you want to patch and select the TV patch that matches its detection method (for Zangetsu, use its dedicated patch; for anything else, try the leanback variant first, then the UiModeManager one).
4. Patch and install. The patched app has a different signature than the original, so either uninstall the original first — or keep both, see the next section.

## Keeping the original app: Clone app

Morphe's official patch bundle includes a universal **Clone app** patch that changes the package name of the patched app (".morphe" is appended by default), so the patched copy installs *alongside* the original instead of replacing it.

Combine the two sources: apply **Clone app** (from the official Morphe Patches source) together with a TV patch from this source, and you get a separate "TV edition" of the app while the untouched original — and its data — stays exactly as it was. This is also the easiest way to test the experimental universal patches safely.

## Compatibility

- ✅ **Verified:** Zangetsu 2.3.6 (TV interface confirmed working on a phone), CloudStream (universal patch, reported working 2026-11-17), VLC 3.7.2 from Google Play (leanback patch; its check runs inside an initializer, covered since v1.1.3; confirmed 2026-11-17 — VLC also has its own "Android TV interface" setting), File Manager + by Alpha Inventor (universal patch, confirmed 2026-11-17).
- 🟡 **Good candidates (untested):** apps whose TV interface ships in the same APK and is gated by the standard checks, e.g. Plex (one package serves phones and TVs). Reports welcome.
- ❌ **Not expected to work:** YouTube and other Google apps (the TV experience is not gated by device detection alone; integrity checks and separate TV builds are involved), Netflix / Disney+ / Prime Video (separate TV APKs, DRM and integrity checks — there is no hidden TV interface in the phone APK to unlock), Spotify (no leanback interface in the phone app), and in general any app whose TV interface is delivered as a separate app or split. Kodi needs no patch: it is TV-native already.

Rule of thumb: if installing the app's regular APK on a real Android TV shows a TV interface, this patch has something to unlock. If the store instead serves a different "for Android TV" app, it does not.

## Limitations

- Patched apps cannot be updated through the Play Store; re-patch new versions yourself (the fingerprints are designed to survive updates, but a rewritten detection can always break them).
- A patched app may still refuse to run for unrelated reasons (signature or integrity checks). That is outside what a detection patch can fix.
- The rename patches are experimental and often have no effect: they only work when an app takes its launcher name from its manifest label resources, and many apps set their displayed name elsewhere.
- **Purpose and disclaimer.** These patches were developed for the author's personal use: running apps on a phone with a remote control, as a lightweight Android TV substitute. They are shared as-is, without warranty of any kind. Use at your own risk — the author accepts no responsibility for any damage or loss resulting from their use. This project is not affiliated with Morphe, with the Zangetsu developers, or with any app mentioned above.

## Building

GitHub Actions builds the bundle on every push to `main` (`gradle buildAndroid`) and publishes the `.mpp` to the rolling [`latest` release](https://github.com/kabukabu-a11y/force-tv-patches/releases/latest). Releases are signed with a persistent key (the `MORPHE_SIGNING_KEY` Actions secret; the public key is `morphe-signing.pub` in this repository and in the bundle metadata), so updates keep the same signer and install in place.

License: GPLv3.

---

# Force TV Patches（Morphe用）

アプリに「この端末は Android TV だ」と思わせる Morphe パッチ集です。スマホ向けビルドの中に TV 用インターフェースが隠れているアプリなら、それをどの端末でも引き出せます。root もブートローダー解除も不要です。

**[➕ Morphe に追加](https://morphe.software/add-source?github=kabukabu-a11y/force-tv-patches&name=Force+TV+Patches)** — Morphe Manager を入れた Android 端末でこのリンクを開くと、ソースがそのまま Morphe に渡ります。

手動で追加する場合は、Morphe Manager の「ソース → + → リモート」に次のどちらかを貼ってください。

```
github.com/kabukabu-a11y/force-tv-patches
https://raw.githubusercontent.com/kabukabu-a11y/force-tv-patches/main/patches-bundle.json
```

## 仕組み

Android が用意している TV 判定の方法は主に2つで、多くのアプリがこのどちらかで TV 用画面への切り替えを判断しています。

1. **leanback フィーチャー** — `PackageManager.hasSystemFeature("android.software.leanback")`（ほか `android.software.leanback_only`、`android.hardware.type.television`）。Android の公式ドキュメントが推奨する方法です。
2. **UiModeManager** — `UiModeManager.getCurrentModeType()` が `UI_MODE_TYPE_TELEVISION` かどうかの比較。

ユニバーサルパッチは、この判定を行っている小さな boolean メソッドを探し、常に「TV である」と答えるように書き換えます。フィーチャー名はプラットフォームの定数なので難読化されたアプリでも一致し、バージョン固定もしていません。

ただし、引き出せるのは **同じ APK の中に TV 用画面が入っていて、端末種別の判定だけで隠れている場合** だけです。TV 用画面が別アプリ（TV 専用 APK）にある場合や、署名・整合性・サーバー側フラグまで見ているアプリには効きません（後述の対応状況参照）。

## パッチ一覧

| パッチ | 対象 | デフォルト | 内容 |
|---|---|---|---|
| Force TV mode for Zangetsu | Zangetsu（全バージョン、検証は 2.3.6） | オン | Zangetsu 専用の精密パッチ。Dart UI が使う `isTv` デバイスチャネルと、内蔵 CloudStream プラグインホストの `Globals.isAutoTv` の両方を書き換えます。 |
| Force TV mode (leanback check) | ユニバーサル | オン | leanback フィーチャー文字列を参照する boolean メソッドをすべて true 固定にします。実験的なヒューリスティクスです。 |
| Force TV mode (UiModeManager check) | ユニバーサル | オン | `UiModeManager.getCurrentModeType()` を呼ぶ boolean メソッドをすべて true 固定にします。実験的なヒューリスティクスです。 |
| Rename app (add TV suffix) | ユニバーサル | **オフ** | アプリ名の末尾に「 TV」を付けます（例：Zangetsu → Zangetsu TV）。実験的：効かないことも多いです。 |
| Rename app (add (TV) suffix) | ユニバーサル | **オフ** | アプリ名の末尾に「 (TV)」を付けます（例：Zangetsu → Zangetsu (TV)）。実験的：効かないことも多いです。 |

ユニバーサルパッチの注意：

- 対象アプリに該当する判定コードが無い場合は、何もせず成功するのではなく、理由を表示して失敗します。
- 原理上、TV 判定を別の判断と兼ねている boolean メソッドまで巻き込む可能性があります。パッチ後にアプリの挙動がおかしい場合は、まずユニバーサルパッチを切ってください。
- 名前変更パッチはラベルの文字列リソース（またはマニフェストの直書きラベル）を書き換えます。ロケール別ラベルがあるアプリでは、そちらは元の名前のままです。

## 使い方

1. [Morphe Manager](https://morphe.software) をインストールします。
2. 上の「Morphe に追加」リンクから、またはリポジトリ URL を貼って、このパッチソースを追加します。
3. パッチしたいアプリを選び、判定方式に合う TV パッチを選びます（Zangetsu は専用パッチ、それ以外は leanback 版 → UiModeManager 版の順に試すのがおすすめ）。
4. パッチしてインストールします。パッチ済みアプリは公式版と署名が違うため、公式版は先にアンインストールするか、次項のクローン併用で併存させます。

## 公式版と併存させる：アプリクローン

Morphe 公式パッチには、パッチ済みアプリのパッケージ名を変える（デフォルトでは末尾に「.morphe」が付く）ユニバーサルパッチ **Clone app** があります。

公式ソースの **Clone app** と、このソースの TV パッチを一緒に適用すると、公式版とそのデータをそのまま残して、別アプリとして「TV 版」を入れられます。実験的なユニバーサルパッチを安全に試す方法としてもおすすめです。

## 対応状況

- ✅ **動作確認済み：** Zangetsu 2.3.6（スマホ実機で TV UI の動作を確認）、CloudStream（ユニバーサルパッチ、2026-11-17に動作報告）、VLC 3.7.2（Google Play 版、leanback パッチ。判定が初期化子の中で動く形で v1.1.3 から対応、2026-11-17に確認。なお VLC 自身にも「Android TV interface」設定がある）、ファイルマネージャー＋（Alpha Inventor、ユニバーサルパッチ、2026-11-17に確認）。
- 🟡 **効く可能性が高い候補（未検証）：** TV 用画面が同じ APK に入っていて、標準的な判定で切り替えているアプリ。例：Plex（スマホと TV で同一パッケージ）。動作報告歓迎です。
- ❌ **効かない見込み：** YouTube などの Google 系アプリ（TV 体験は端末判定だけで制御されておらず、整合性チェックや TV 専用ビルドが絡む）、Netflix / Disney+ / Prime Video（TV 専用 APK が別にあり、DRM や整合性チェックもあるため、スマホ版の中に引き出せる TV 画面が存在しない）、Spotify（スマホ版に leanback 画面が無い）、その他 TV 用画面が別アプリや分割 APK で配られるもの全般。Kodi は元々 TV ネイティブなのでパッチ自体が不要です。

目安として「本物の Android TV にそのアプリの通常 APK を入れると TV 画面になる」なら引き出す対象があります。「Android TV 用」と銘打った別アプリが配信されている場合は対象がありません。

## 注意・制限

- パッチ済みアプリは Play ストア経由で更新できません。新バージョンは自分でパッチし直してください（フィンガープリントは更新に耐える設計ですが、判定コードが書き換われば外れます）。
- 署名・整合性チェックなどでアプリ自体が起動を拒む場合は、このパッチの範囲外です。
- アプリ名変更パッチは実験的なもので、効かないことも多いです。ランチャーの表示名がマニフェストのラベルリソース由来のアプリにしか効きません。
- **目的と免責：** このパッチ集は、スマホをリモコンで操作して Android TV の代わりに使うという、作者の個人的な目的で開発したものです。現状のまま公開しており、動作の保証はなく、使用によって生じた損害についても責任を負いかねます。利用は自己責任でお願いします。本プロジェクトは Morphe、Zangetsu の開発者、および上記の各アプリとは無関係です。

## ビルド

GitHub Actions が `main` への push のたびに `gradle buildAndroid` を実行し、`.mpp` を [`latest` リリース](https://github.com/kabukabu-a11y/force-tv-patches/releases/latest)へ公開します。署名は固定鍵（Actions シークレット `MORPHE_SIGNING_KEY`、公開鍵はリポジトリ内の `morphe-signing.pub` とバンドル情報に掲載）で行うため、更新しても署名者は変わらず、そのまま上書き更新できます。

ライセンス：GPLv3
