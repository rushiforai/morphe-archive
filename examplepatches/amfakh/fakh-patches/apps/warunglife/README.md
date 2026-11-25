# Warung Life Simulator

Patches for **Warung Life Simulator** (`com.neopawstudio.warunglife`), version `1.2`, as an APKS bundle (APKCube)
or merged APK.

## Patches

Every patch is on by default except Clone. Morphe Manager lists them under **Mods**.

| Category | Patch | What it does |
|---|---|---|
| Mods | Instant ad rewards | Gives the rewards of rewarded ads (full energy, extra side job, double pay, upgrade discount) without watching them, and skips the ads shown when you level up. The patched app also opens normally instead of closing on Google Play's license check. |
| Mods | Unlimited ad rewards | Lets you use the energy refill and the upgrade discount of rewarded ads as often as you like, instead of once a day and six times per upgrade. The discount still stops at 60% off. |
| Mods | Clone | Installs the game as a separate app next to the Play Store version. Progress is not shared between the two. Options: **App name** (default "Warung Life Simulator (Clone)") and **Package name** (default `com.neopawstudio.warunglife.fakh`); a different name installs another clone. Off by default. |
| Mods | Sales income multiplier | Makes every sale to a customer pay several times its price. Option: **Multiplier** (default 2x; 2x, 3x, 4x, 5x, 10x, 20x, 50x or 100x). |
| Mods | Daily bonus | Adds money to your wallet at the start of every day. Option: **Amount** (default Rp1.000.000; Rp10.000, 50.000, 100.000, 200.000, 1.000.000 or 2.000.000). |
| Mods | Legendary fish chance | Makes the legendary fish (Ikan dewa) bite more often than the game's 0.6% of fish that bite. Option: **Chance (%)** (default 75%; 5%, 10%, 25%, 50%, 75% or 100%). |
| Mods | Unlock tester outfit | Unlocks the Kaos & sarung outfit that is a reward for the game's testers, normally also given on day 30 of the daily gift calendar. |
| Mods | GmsCore support | Makes "Tautkan akun" with Google work by signing in through microG RE (GmsCore) instead of Google Play services, so the warung saved to your Google account comes back. Needs microG RE installed and signed in to a Google account. |
| Theme | Themed icon | Adds the themed (monochrome) app icon of Android 13 and later, which follows the wallpaper colors. |

## How it works

The game is built with Godot. Its scripts reach Unity Ads only through one Android plugin, `GodotUnityAds`, which
loads and shows an ad and reports back when it finished. The patch makes that plugin answer every request at once as
if the ad had played to the end, so the game pays the reward and moves on. The Unity Ads SDK is never started.

Unlimited ad rewards raises the two ad limits the game keeps in `game_state.gdc` (energy refills per day and discounts
per upgrade) to 100. The game only loads that script at its original size, so the patch keeps the size and rewrites
only the blocks after the first edit. The other patches edit the same script: a sale in `jual` pays `price * multiplier`, `_kosongkan_catatan_hari` adds the daily bonus, `acak_hasil_alam` scales the legendary roll from 100 to `60 / percent`, and `_cek_tester` treats every build as the test period. A multiplier or amount has to be a number that the script already holds as a constant, which is why each option is a short list. The "Tanpa Iklan" purchase is not unlocked.

Linking a Google account ("Tautkan akun" > Google) only works with GmsCore support. Google hands the game its sign-in
token only when the request comes from the developer's own signing key, which a patched app never has. microG RE
signs in on the game's behalf with the original package and key, and that works with Clone too. On Android 14 and
newer the game's first sign-in method always goes to Google Play services and fails, so the patch sends it straight to
the older Google sign-in that microG RE handles.

The app also ships Google's PairIP protection. At startup it asks Google Play whether the app was signed by the
developer, and closes itself when it was not. A patched app is always signed with another key, so the patch skips
that check.

## Install

Without Clone, the Play Store app must be uninstalled first: it is signed with another key. Uninstalling deletes the
save on the phone, so link the game to your Google account first if you want to keep your warung. With Clone, the
patched game installs next to the Play Store app and starts a new save.

## Build

See the [repo README](../../README.md).

## Test on desktop

With [morphe-desktop](https://github.com/MorpheApp/morphe-desktop/releases) 2.2.0 or newer (needs Java 21):

```bash
java -jar morphe-desktop-2.2.0-all.jar patch -p patches/build/libs/patches-<version>.mpp -o warunglife-patched.apk <Warung Life 1.2 APKS>
```

## Getting the APK

Download the `1.2` APKS from APKCube by hand. Morphe Manager's own lookup only knows APKMirror and Uptodown pages.
