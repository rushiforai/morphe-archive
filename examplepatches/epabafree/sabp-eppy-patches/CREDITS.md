# Credits and open-source licences

eppy (repository: sabp-eppy-patches) is GPL-3.0. Below is everything it uses, depends on, or is compatible with, along with how each item is used.
Nothing here implies endorsement by the original authors.

| Project | Where | Author / maintainer | Licence | How it's used |
|---|---|---|---|---|
| **Smart AudioBook Player** | Google Play (`ak.alizandro.smartaudiobookplayer`) | its developer | Proprietary | The app these patches modify. Playback, library, bookmarks, chapters and settings are SABP's own; Eppy adds an interface on top. Supported version: 11.7.8. |
| **Hooman's Morphe Patches** | [github.com/arandomhooman/hoomans-morphe-patches](https://github.com/arandomhooman/hoomans-morphe-patches) | arandomhooman | GPL-3.0 | **Recommended companion.** Eppy is built to be applied alongside Hooman's SABP patch in the same Morphe Manager session, and was tested on Hooman's SABP 11.7.8 build. No Hooman code is copied here. Their repository was used as a reference for project layout and patch style. |
| **Morphe patches template** | [github.com/MorpheApp](https://github.com/MorpheApp) | Morphe | GPL-3.0 + [NOTICE](NOTICE) | Gradle setup and `PatchListGenerator.kt`. Eppy is "for use with Morphe" and isn't a Morphe project (see NOTICE §7c). |
| **Outfit** font | [github.com/Outfitio/Outfit-Fonts](https://github.com/Outfitio/Outfit-Fonts) | The Outfit Project Authors | SIL OFL 1.1 ([text](licenses/OFL-Outfit.txt)) | Bundled. Material You, Ember and Lavender styles, and the Modern font patch. |
| **Plus Jakarta Sans** font | [github.com/tokotype/PlusJakartaSans](https://github.com/tokotype/PlusJakartaSans) | The Plus Jakarta Sans Project Authors (Tokotype) | SIL OFL 1.1 ([text](licenses/OFL-PlusJakartaSans.txt)) | Bundled. Midnight, Paper and Mono styles. |
| **Storyteller** | [gitlab.com/storyteller-platform/storyteller](https://gitlab.com/storyteller-platform/storyteller) | storyteller-platform | MIT | Compatibility only, not bundled. Read along uses the EPUB 3 Media Overlay timings in "readaloud" EPUBs that Storyteller produces, for exact sync. |
| **Open Library** | [openlibrary.org/developers/api](https://openlibrary.org/developers/api) | Internet Archive | Data licence not verified (cached on-device only, not redistributed) | Optional book-information provider. No account. Requests identify eppy via User-Agent as requested. |
| **Google Books API** | [developers.google.com/books](https://developers.google.com/books/docs/v1/using) | Google | Google APIs Terms of Service | Optional book-information provider. Uses the user's own API key. |
| **AOSP source** (read, not copied) | [aosp-mirror/platform_frameworks_base](https://github.com/aosp-mirror/platform_frameworks_base) | Android Open Source Project | Apache-2.0 | `RecognitionService` / `SpeechRecognizerImpl` read to verify the microphone requirement and to find the v0.3.0 pipe bug. |
| **Morphe YouTube / YouTube Music patches** (read, not copied) | [github.com/MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches) | Morphe | GPL-3.0 + NOTICE | Architecture reference (activity onCreate takeover, app-start init). See docs/ARCHITECTURE.md. |
| **Android platform APIs** | developer.android.com | Google / AOSP | Apache-2.0 | `SpeechRecognizer` (on-device, file audio source, Android 13+), `PdfRenderer` text extraction (Android 15+), `MediaExtractor`/`MediaCodec` decoding. |

## Evaluated and not used (yet)

These were checked: the repository exists, the licence was read, and Android fit was considered. They were left out on purpose, so they are not credited as used.

| Project | Licence | Why it's not in this round |
|---|---|---|
| [Voice](https://github.com/PaulWoitaschek/Voice), a Material 3 audiobook player | GPL-3.0 | Jetpack Compose + AndroidX. Bundling those inside SABP would clash with the AndroidX copies already in the app. Useful reference for a future Compose-based rewrite. |
| [Readium Kotlin toolkit](https://github.com/readium/kotlin-toolkit) | BSD-3-Clause | A full reader stack, much larger than this prototype needs and AndroidX-based. Candidate for the deferred "full EPUB reader" round. |
| [PdfBox-Android](https://github.com/TomRoush/PdfBox-Android) | Apache-2.0 | Would add PDF text on Android < 15, but needs bundled resources and several MB. For now Android 15's built-in text extraction is used, with a page-image fallback. |
| [Vosk](https://github.com/alphacep/vosk-api) | Apache-2.0 | Offline speech recognition that works on any Android version, but needs native libraries plus a ~40 MB model download. A candidate for a later "works everywhere" matching option. |
| [whisper.cpp](https://github.com/ggml-org/whisper.cpp) | MIT | Very accurate, but too heavy for on-phone background matching in this prototype. |
| Wikipedia / Wikidata | CC BY-SA / CC0 | Considered for character and author information. Not used, because articles routinely contain plot spoilers and there is no spoiler-safe field. |
| ISFDB | (not verified) | No suitable documented open API was verified for this patch. |
| Cloud backup and sync, bookmark export, TTS | — | Out of scope for this stability release. Documented as deferred. |

## Design references

The six styles recreate reference images supplied by the project owner (Dribbble-style concepts). They copy layout, shapes, type and colour. Book covers, photos and names in those images aren't reproduced; the app shows your own books.
