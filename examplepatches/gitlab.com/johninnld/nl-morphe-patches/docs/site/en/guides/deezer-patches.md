# Choosing Deezer patches

Dutch App Patches includes thirteen controls for Deezer 9.0.27.3, all selected by default. Alongside playback, advertising, queue and playlist controls, it adds a templated Android Auto surface, microG-RE Google sign-in and a lyrics fallback. See the [complete patch list](../apps/deezer.md).

## Tested behavior

The maintainer uses a free account in the Netherlands, where the stock app blocks access to Deezer Free. Full-track playback and playing tracks directly from search results have been validated on that account. The patches skip the inspected country/plans startup redirect and trial/subscription paths, and remove several separate upgrade surfaces, including the Downloaded music banner and Listen without ads menu entry.

Album, playlist and Favorite tracks downloads use Deezer's native storage and library registration. Downloaded playback was validated in airplane mode. Individual tracks follow the normal saved-library or playlist workflow.

Lyrics use Deezer's native data first. When that data is missing, a matching LRCLIB record can supply plain or synchronized lyrics in the native lyrics screen, with source attribution. A fallback pill appears only after usable data is available. LRCLIB receives track metadata, without Deezer or Google credentials; its coverage varies by recording and duration.

Android Auto has a browser and player with selectable entries in the real Up next queue and browsing of native Home and Explore content. Compatible custom hosts are accepted, and API 9 presentation is used only when the host negotiates API 9. Google sign-in through installed microG-RE uses Deezer's original OAuth identity and standard package name.

## Comparing sources

Checked on 22 November 2026 against AudioPatchLab's v1.2.0 source snapshot (`e6b40de`), its [README](https://github.com/AudioPatchLab/deezer-morphe-patches) and the author's [Reddit update](https://www.reddit.com/r/MorpheApp/comments/1xzvhcc/release_i_made_deezer_premium_features_work_for/).

That project documents eight patches covering on-demand selection, navigation, queues, playlist search/sort, ads, offers, lyrics and downloads. Those categories overlap with the controls here. Its README documents a forced `.morphe` package and no country-restriction bypass; the Reddit update lists a search-playback workaround and a remaining new-account trial prompt. The Netherlands and direct-search results above describe this project's own validation.

The additional work here is the API 9 car surface and host admission, real car-queue selection, microG-RE integration, broader startup/promotion handling and native-first LRCLIB fallback. Choose one Deezer source against the original archive; combining overlapping version-specific patches is unsupported.

Deezer support was first published in [Dutch App Patches v1.53.5 on 7 November 2026](https://gitlab.com/johninnld/nl-morphe-patches/-/releases/v1.53.5). The car-surface improvements and lyrics fallback were developed later.

## Scope

Use the complete original 9.0.27.3 APKM and the standard `deezer.android.app` package. This port no longer supports 9.0.26.3. The Netherlands result does not establish availability in every country or on every account. Stream availability and quality follow what Deezer serves; the patches do not change a free account into a paid subscription.

[Installation](install.md) · [Deezer controls](../apps/deezer.md)
