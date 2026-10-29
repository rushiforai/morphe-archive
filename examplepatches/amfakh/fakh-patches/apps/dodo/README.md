# DoDo Music

Patches for **DoDo Music** (`com.dundunstudio.autoplay`, "DoDo Music - Auto Game Clicker" on APKPure),
version `2.0.14`, as an XAPK.

## Patches

Every patch is on by default except GmsCore support. Morphe Manager groups them by category.

| Category | Patch | What it does |
|---|---|---|
| Feature | GmsCore support | Makes "Sign in with Google" work, so the collection and playlists saved to your Google account come back. Signs in through [microG RE](https://github.com/MorpheApp/microg-RE) instead of Google Play services, so it needs microG RE installed and signed in. Off by default. |
| Premium | Premium unlock | Unlocks premium on your phone: no ads and every premium feature. The patched app also opens normally instead of closing on Google Play's license check, and the ad SDK never starts. |
| Premium | Fix song playback | Lets songs actually play. A patched app is signed with a different key, which the server rejects when it hands out the encrypted song, so without this every song hangs on "loading". |
| Privacy | Disable analytics | Stops Adjust and TikTok from tracking installs and in-app events, and turns off Firebase Analytics, Crashlytics and Sessions. |

## How the unlock works

The app decides whether you are premium from one flag on your user profile, which the server
fills in. Ads, locked features and every premium check read that flag. The patch makes it always
say "premium", so the unlock happens on your phone only; no purchase is faked on the server.

The app also ships Google's PairIP protection. At startup it asks Google Play whether the app was
signed by the developer, and closes itself when it was not. A patched app is always signed with
another key, so the patch skips that check.

## Why songs need the playback fix

The app signs every request to its server with its own signing certificate, and the server keys the
encrypted song it sends back to that certificate. Songs are then decrypted on the phone. A patched
app is signed with a different key, so the server hands back something the app cannot decrypt, and
the song hangs on "loading" forever. The **Fix song playback** patch makes the app present its
original certificate again (through a reflective PackageManager proxy, the same idea as
[ApkSignatureKillerEx](https://github.com/L-JINBIN/ApkSignatureKillerEx)), so the server accepts the
request and the song decrypts. It needs no root. Without it the app installs and shows your library,
but no song plays, premium or not.

## What the app ships with, in plain terms

Disabling an SDK's manifest component is not enough on its own here: the app starts Adjust, TikTok
and the ad SDK from its own `Application` code, so **Disable analytics** and **Premium unlock** stub
those start-up calls too.

| SDK | What it is | What it does on your phone |
|---|---|---|
| **Adjust** | Install attribution | Reports which ad or campaign brought you to the app, and tracks your sessions. |
| **TikTok Business SDK** | TikTok's analytics | Logs app events, including in-app purchases, back to TikTok. |
| **Firebase Analytics** | Google analytics | Receives every action you take in the app, each one tagged with your app instance id. |
| **Firebase Crashlytics / Sessions** | Crash and session reporting | Upload crashes and session timings. |
| **Google AdMob** | Ad network | Loads and shows the full-screen ads, and reads the advertising id to target them. |
| **Facebook SDK** (Meta) | Meta's app SDK | Its auto-start component is disabled. What else it would send is not visible from the patch code. |

**How the patches stop them:** **Disable analytics** stubs Adjust and TikTok's start-up calls, sets
Firebase's own off switches in the manifest, and disables Firebase's data-transport service so even
events queued by an earlier run are never uploaded. **Premium unlock** stubs the ad SDK's start-up
call and disables the ad, Facebook and Adjust auto-start components. After this the only servers the
app talks to are its own API and that API's CDN.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-cli/releases) (needs Java 21):

```bash
java -jar morphe-desktop-1.19.1-all.jar patch -p patches/build/libs/patches-<version>.mpp -o dodo-patched.apk <DoDo Music 2.0.14 XAPK>
```

## Getting the APK

Download the `2.0.14` XAPK from APKPure by hand. Morphe Manager's own lookup only knows APKMirror
and Uptodown pages, and falls back to a web search for this app.

## Credits

The song playback fix follows the PackageManager-proxy approach of
[ApkSignatureKillerEx](https://github.com/L-JINBIN/ApkSignatureKillerEx) by L-JINBIN.
