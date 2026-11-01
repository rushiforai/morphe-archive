![HushTumblr. Tumblr, on your terms.](assets/readme-hero.png)

<p align="center">
  <img src="https://img.shields.io/badge/version-0.0.9-92BFFF" alt="Version 0.0.9">
  <a href="LICENSE"><img src="https://img.shields.io/badge/license-GPL--3.0-blue" alt="License GPL-3.0"></a>
  <img src="https://img.shields.io/badge/platform-Android%208%2B-3DDC84" alt="Platform Android 8+">
  <img src="https://img.shields.io/badge/Tumblr-46.8.1.100-001935" alt="Tumblr 46.8.1.100">
  <img src="https://img.shields.io/badge/for-Morphe%20Manager%202.3.0%2B-8A2BE2" alt="For Morphe Manager 2.3.0 or newer">
</p>

<p>
  <a href="https://ko-fi.com/X8K126YVER">
    <img height="42" src="https://storage.ko-fi.com/cdn/kofi2.png?v=3" alt="Buy me a coffee on Ko-fi" />
  </a>
</p>

# <img src="assets/icon.png" width="36" alt=""> HushTumblr

[Morphe](https://morphe.software) patches for Tumblr on Android. Patch the Tumblr bundle in Morphe Manager and you get a quieter Tumblr with its own HushTumblr settings page. It can drop ads and paid Blaze posts, hide suggestions, filter posts by type or by your own words, and trim the bottom bar.

The latest release is [v0.0.9](https://github.com/SysAdminDoc/HushTumblr/releases/tag/v0.0.9), with 46 patches. Add this repo to Morphe Manager as a patch source and it'll offer each new release when it comes out. Changes are listed in the [changelog](CHANGELOG.md).

**[Add HushTumblr to Morphe Manager](https://morphe.software/add-source?github=SysAdminDoc%2FHushTumblr)**

> [!IMPORTANT]
> Back up your signing key right after your first patch. In Morphe Manager open **Settings > System > Import & export > Signing key** and tap **Export**, then keep `Morphe.keystore` somewhere private. Android only updates a patched Tumblr with an APK signed by the same key, so on a new phone import it before you patch anything.

## Install

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager) 2.3.0 or newer.
2. Add HushTumblr as a patch source: https://morphe.software/add-source?github=SysAdminDoc%2FHushTumblr
3. Download the Tumblr 46.8.1.100 bundle (`.apkm`, version code 1460801100) from [APKMirror](https://www.apkmirror.com/apk/tumblr-inc/tumblr/tumblr-social-media-art-46-8-1-100-release/).
4. Patch it with the default selection. That's every patch except Spoof signature for Google sign-in, which you can pick after turning on **Settings → Advanced → Expert mode** in Morphe Manager.
5. Uninstall stock Tumblr, then install the patched app. Your blogs and follows come back when you sign in, but drafts kept only on the phone don't.

Sign in with your email and Tumblr password. Google's sign-in checks the app's signing certificate, so it won't work on a patched Tumblr. If you joined through Google, set a Tumblr password first from the password reset page.

## Settings

Long-press the Tumblr logo at the top of your dashboard. You can also tap **HushTumblr** at the bottom of Tumblr's Settings, or long-press the Tumblr icon. Switches apply without patching again, though a few, like Disable analytics, finish after Tumblr restarts, and a Restart row at the top of the page does that for you. **Pause** keeps your saved choices and makes the switches act as off, apart from Debug logging. Changes made while patching stay in the app. The same page backs up your settings.

![HushTumblr settings overview, Feed and Privacy pages](assets/settings-preview.png)

## Patches

There are 48 patches.

| Patch | What it does |
|---|---|
| `Dark background color` | Makes the background of Tumblr's Dark Mode palette black, which can save battery on OLED screens, or another dark color you pick when patching. On Android 12 or newer it can follow your wallpaper's colors instead. Blog and tag pages take it too, in place of their own colors. Other palettes stay as they are. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Disable analytics` | Turns off Firebase crash reports and Google's analytics collection, and Tumblr's own tracking and ad measurement once it restarts. The Firebase and Google part stays until you patch again without it. On by default. Turn it off in Tumblr settings > HushTumblr > Privacy. |
| `Disable update prompts` | Stops Tumblr asking Google Play for a newer version and showing Play's update prompt. Starts off. Turn it on in Tumblr settings > HushTumblr > Updates. |
| `Filter activity notifications` | Hides selected likes, reblogs, replies, follows, mentions, asks and boops from the activity list as pages load. Each switch starts off. Choose them in Tumblr settings > HushTumblr > Notifications. |
| `Fix push notifications` | Lets the patched app sign up for push notifications. Firebase can refuse a patched Tumblr whose request doesn't name Tumblr's original signature, so this sends its fingerprint. On by default. Turn it off in Tumblr settings > HushTumblr > Notifications. |
| `Hide Blaze prompts` | Hides the prompts to pay for Blaze, Tumblr's way to promote a post. That covers the Blaze buttons on your blog and dashboard, the nudge after you post, and the Blaze banners. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Hide Tumblr TV` | Takes the Tumblr TV tab out of the bottom bar, and stops sign-up from sending you there. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Hide Watch it rows` | Takes Tumblr TV's Watch it rows and video hub cards out of your dashboard and other feeds, along with their headings. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Hide ads` | Takes ad cards and paid Blaze posts out of your dashboard and other feeds, and stops Tumblr asking its ad networks for more. On by default. Turn it off in Tumblr settings > HushTumblr > Feed. |
| `Hide advertising ID` | Tumblr and the ad companies inside it see an empty advertising ID with ad tracking limited, as if you'd deleted your ad ID in Android. On by default. Turn it off in Tumblr settings > HushTumblr > Privacy. |
| `Hide blog notification reminders` | Hides the pop-up suggesting you turn on notifications for a blog. Your subscriptions and notification settings stay as they are. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Hide filtered posts` | Takes the posts Tumblr covers with "This post contains filtered content" out of your dashboard, searches and other feeds, so your filtered tags and words hide them completely. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Hide gift purchase popups` | Hides the pop-up suggesting you buy a gift for a blog. You can still open gifting yourself. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Line between posts` | Draws a thin line in the gap between posts, so it's easier to see where one ends and the next begins. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `App font` | Replaces Tumblr's own font with your phone's font, or a font file you choose in settings. Fonts a post's author picked stay as they are. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Hide hashtags` | Takes the tags off the bottom of posts in your dashboard, other feeds and Tumblr TV, and keeps the source link. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Hide note counts` | Takes the like, reblog and comment counts off the footer under posts, community posts included, and the counts off the top of a post's notes and its tabs. The buttons stay and still work. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Hide photo posts` | Takes photo posts out of your dashboard and other feeds as each page loads. A post with pictures and no video, its reblog trail included, counts as a photo post. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Hide posts with these words` | Hides posts matching your word list. Choose whether to check current text, the reblog trail, tags or summaries. Allowed words can keep a matching post, but other enabled filters still apply. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Hide reblogs` | Takes reblogs out of your dashboard and other feeds as each page loads, and keeps the posts people made themselves. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Hide suggested blogs` | Takes the blogs Tumblr suggests you follow out of your dashboard and other feeds, whether as cards, rows or carousels, along with their headings. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Hide suggested communities` | Takes the communities Tumblr suggests you join out of your dashboard and other feeds, along with their headings. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Hide suggested tags` | Takes the tags Tumblr suggests you follow out of your dashboard and other feeds, along with their headings. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Hide text posts` | Takes text posts out of your dashboard and other feeds as each page loads. A post with no pictures or video, its reblog trail included, counts as a text post. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Hide the Communities tab` | Takes the Communities tab out of the bottom bar and stops the Communities tips in the post editor. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Hide the Explore tab` | Takes the Explore and search button off the bottom bar. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Hide the Follow button` | Takes the Follow button out of the header of posts from blogs you don't follow yet. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Hide the Notifications tab` | Takes the Notifications button off the bottom bar. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Hide the Save button` | Takes the Save button out of the footer under posts in your dashboard and other feeds, when Tumblr shows one. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Hide the ad-free banner` | Hides the banner on your dashboard that asks you to pay for Ad-Free Browsing. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Hide the comment button` | Takes the comment button out of the footer under posts in your dashboard and other feeds. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Hide the diamond and TumblrMart` | Hides the Premium diamond and the TumblrMart button at the top of your dashboard, Explore and notifications. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Hide the like button` | Takes the like button out of the footer under posts in your dashboard and other feeds, and the reactions off community posts. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Hide the reblog button` | Takes the reblog button out of the footer under posts in your dashboard and other feeds. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Hide the share button` | Takes the share button out of the footer under posts in your dashboard and other feeds. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Hide unread dots` | Hides the unread dots and counts on the bottom bar's Dashboard, Communities and Notifications tabs, with a switch for each tab. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Hide video posts` | Takes video posts out of your dashboard and other feeds as each page loads. A post with a video anywhere in it, its reblog trail included, counts as a video post. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Mute posts locally` | Adds a local mute action to post menus. Originals and their reblogs stay hidden for this account. Starts off. Turn it on in Tumblr settings > HushTumblr > Feed. |
| `Reorder the bottom bar` | Puts the bottom bar's tabs in an order you pick, from a list in its settings. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Reveal allowed mature content` | Removes mature-content covers only when Tumblr explicitly allows them for the signed-in adult account. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Show post timestamps` | Shows when posts were made using Tumblr's own timestamp layout. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Show mutual markers` | Marks blogs that follow your primary blog when you follow them. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |
| `Skip review prompts` | Stops the pop-up that asks what you think of the Tumblr app and then asks you for a store rating or feedback. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Turn off screenshot sharing` | Stops Tumblr watching for screenshots, so taking one doesn't bring up its offer to save the post as an image. Starts off. Turn it on in Tumblr settings > HushTumblr > Interface. |
| `Visible image descriptions` | Shows author-provided image descriptions below each image, including galleries and reblogs. Starts off. Turn it on in Tumblr settings > HushTumblr > Posts. |

These three have no switch:

| Patch | What it does |
|---|---|
| `HushTumblr settings` | Adds a HushTumblr page where you turn features on or off, pause HushTumblr, back up your settings and read the licenses. Open it by long-pressing the Tumblr logo at the top of your dashboard, from Tumblr's Settings or by long-pressing the Tumblr icon. Works as soon as you patch it in, with no switch. |
| `Remove ad tracking permissions` | Removes Google's advertising ID permission and Android's Privacy Sandbox ad services from Tumblr, so it can't use them. Google Play services then answers with zeros. Works as soon as you patch it in, with no switch. |
| `Spoof signature for Google sign-in` | Helps Google sign-in work in the patched app by naming Tumblr's original signature. It only helps with microG-RE or the XSpoofSignatures module. Email sign-in doesn't need it. It isn't selected by default. Works as soon as you patch it in, with no switch. |

## Privacy

HushTumblr collects nothing and has no server. The release check is off until you turn it on. Then it asks `api.github.com` for the latest release at most once a day, and when you tap **Check now**. Links to `github.com`, `gitlab.com`, `www.gnu.org`, `ko-fi.com` and `help.tumblr.com` open in your browser only when you tap them. **Report a problem** opens a GitHub issue form with your versions, phone model and the switches you have on filled in, and nothing is posted until you submit it there. Muted posts and word lists stay on your phone.

## Help

- **Android won't install it.** Uninstall stock Tumblr first. Updating a patched copy needs the same signing key.
- **Morphe Manager says the APK isn't supported.** It has to be the Tumblr 46.8.1.100 `.apkm` bundle with version code 1460801100.
- **A switch seems to do nothing.** Feed filters work as pages load, so scroll or refresh. Tracking and ad changes wait for Tumblr to restart.
- **Anything else.** [Open an issue](https://github.com/SysAdminDoc/HushTumblr/issues/new/choose) with your HushTumblr and Tumblr versions.

## Supported version

| | Supported |
|---|---|
| App | Tumblr for Android |
| Package | `com.tumblr` |
| Version | **46.8.1.100** |
| Version code | `1460801100` |
| Android | 8.0 or newer |
| Architecture | Any (the bundle carries ARM64, 32-bit ARM and x86 builds) |
| Input | Tumblr's split APK bundle (`.apkm`) |

Every patch is checked against this exact build, and other versions aren't supported.

## Verify a download

Each release ships `SHA256SUMS.txt`, signed as `SHA256SUMS.txt.asc` with the HushTumblr release key. Its fingerprint is `2143 368A A5CE 6E5D FFEA  79CF BBC1 3768 83CF 3AB4` and the public key is [keys/hushtumblr-release.asc](keys/hushtumblr-release.asc). Morphe Manager doesn't check it, so that's up to you. The v0.0.9 bundle's line:

```text
3caa7043e85cfc3948fba8676e4dc48b623f46d359f9c8fd08b7f925d2d06783  patches-0.0.9.mpp
```

```text
gpg --import hushtumblr-release.asc
gpg --verify SHA256SUMS.txt.asc SHA256SUMS.txt
```

A good file shows a good signature with that fingerprint. Then compare the hash with `Get-FileHash` on Windows or `sha256sum` elsewhere.

## Build from source

You need JDK 21, the Android SDK and a GitHub token with `read:packages` for the Morphe packages. Set `GITHUB_ACTOR` to your username and `GITHUB_TOKEN` to the token.

```powershell
.\gradlew.bat :patches:generatePatchesList
.\gradlew.bat :patches:buildAndroid
.\gradlew.bat :patches:test :extensions:tumblr:testDebugUnitTest :extensions:tumblr:lintDebug
```

The bundle lands in `patches/build/release/`. `:patches:fixtureTest` also needs the Tumblr APK in the folder `HUSHTUMBLR_FIXTURE_DIR` points at.

Before publication, `scripts/walk-app.ps1` checks the installed APK against the signed output and the provenance written by `scripts/patch-for-device.ps1`. To walk an existing installation, pass `-SkipPatch -PatchedApk <signed.apk>` and keep its `.provenance.json` beside it. A receipt from an older walk format can't authorize a new release.

The walk records named destinations with native activity and UI checks. The full bundle requires the dashboard, Explore, a Posts search, a tag, blog posts, likes, the Hush settings home and every available settings page. Reducing `-Visit` or `-SettingsPages` leaves a partial walk. Account or server checks that haven't been exercised remain unverified in the local tracker.

The walk also runs Android's verifier against the clean reference and the signed APK under the same device lease. Publication checks the completed comparison, input hashes and exact message counts. If the original input isn't in the fixture folder, pass it with `-CleanApk`.

- `patches/src/main/kotlin/app/morphe/patches/tumblr/` holds the patches, and `shared/compat/AppCompatibilities.kt` names the supported build.
- `extensions/tumblr/` and `extensions/shared/library/` are the Java code that runs inside Tumblr, settings and translations included.
- `patches-list.json` is the generated catalog. `patches-bundle.json` is the Morphe source index and only changes at release time.
- `docs/` maps the hooks in Tumblr 46.9.1.100, and `scripts/release/release.ps1` cuts a release.

## Credits and license

HushTumblr starts from [HushPinterest](https://github.com/SysAdminDoc/HushPinterest) at `debdac4`, which supplied the build, the shared settings library, the bytecode helpers, the privacy and push notification patches and the release checks. Most of that came to HushPinterest from [HushTelegram](https://github.com/SysAdminDoc/HushTelegram), [HushThreads](https://github.com/SysAdminDoc/HushThreads) and [Hushfacebook](https://github.com/SysAdminDoc/Hushfacebook). The patcher and patch template come from [Morphe](https://github.com/MorpheApp) and [ReVanced](https://gitlab.com/ReVanced/revanced-patches). The Tumblr patches come from reading Tumblr itself. Source headers keep their upstream attribution, [provenance.json](provenance.json) maps each file to its origin and license, and the [source ledger](sources/tumblr-sources.json) records other Tumblr patch projects once they've been reviewed.

[GPL-3.0](LICENSE), with the upstream notices in [NOTICE](NOTICE). Tumblr is a trademark of Tumblr, Inc. HushTumblr is an independent project and isn't affiliated with Tumblr.
