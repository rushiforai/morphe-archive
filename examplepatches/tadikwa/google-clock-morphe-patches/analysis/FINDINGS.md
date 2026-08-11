# Static analysis findings

Input files supplied for diagnosis:

- Google Clock 9.0, package `com.google.android.deskclock`, versionCode `76073630`.
- YT Music Morphe 9.15.51, package `app.morphe.android.apps.youtube.music`.

In Google Clock's `classes2.dex`, the music-provider resolver was identified as an obfuscated method with prototype:

`(Landroid/content/Context;)Ljava/lang/String;`

The method contains provider package constants including:

- `com.calm.android`
- `com.pandora.android`
- `com.google.android.apps.youtube.music`

The YouTube Music package constant is therefore fingerprinted using the provider resolver rather than globally replacing every occurrence in the APK.

The Morphe YT Music manifest exposes:

`com.google.android.apps.youtube.music.mediabrowser.MusicBrowserService`

as an exported service with:

`android.media.browse.MediaBrowserService`

Google Clock's manifest queries that MediaBrowserService action, so package visibility should not require adding a new `<queries><package>` entry.

A second occurrence of the stock YouTube Music package was found in a large generic package allow/list method and is intentionally not modified by this patch.
