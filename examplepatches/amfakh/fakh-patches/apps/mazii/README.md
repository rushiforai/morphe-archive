# Mazii: Japanese Dictionary

Patches for **Mazii: Japanese Dictionary** (`com.mazii.dictionary`), version `6.8.64`, as an XAPK from APKPure.

## Patches

Every patch except **GmsCore support** is on by default. Morphe Manager groups them by category.

| Category | Patch | Default | What it does |
|---|---|---|---|
| Feature | Disable Play license check | On | Stops Pairip's Google Play license check from blocking the patched app. |
| Feature | GmsCore support | Off | Makes "Continue with Google" work through [microG RE](https://github.com/WSTxda/MicroG-RE) (GmsCore) instead of Google Play services. |
| Premium | Premium unlock | On | Unlocks the client-side Premium checks and removes ads. |
| Privacy | Disable analytics | On | Stops Firebase Analytics, Crashlytics, Performance and Sessions, and Facebook App Events. |

## How the patches work

**Premium unlock** forces `PreferencesHelper.isPremium`, the account-based premium check and `Account.Result.getPremium` to return true. The app skips its own ad slots and ad SDK startup while Premium is on, and the patch also disables the Audience Network, Vungle and Mintegral content providers that start before `Application.onCreate`.

**GmsCore support** redirects the app's Google Play services calls to microG RE (`app.revanced.android.gms`) and declares Mazii's original signing certificate SHA-1 so Google issues the ID token that Mazii's login endpoint expects. A toast tells the user to install microG RE when "Continue with Google" is tapped without it.

**Disable analytics** uses Firebase's manifest switches, disables `TransportBackendDiscovery` and turns off Facebook App Events and advertiser ID collection.

## Known limitations

Content that the server gates by account (for example AI features) cannot be unlocked from the client.

## Build

See the [repo README](../../README.md).
