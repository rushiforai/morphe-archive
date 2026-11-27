# SyncIt

Morphe patches for **Sync for Reddit** (`com.laurencedawson.reddit_sync`).

Sync was discontinued after Reddit's 2023 API changes. This bundle fixes parts of its
behaviour that still matter when the app runs today.

## Add to Morphe

1. Install Morphe Manager and switch it to advanced/expert mode.
2. Add this patch source:
   <https://morphe.software/add-source?github=OgunHva/SyncIt>
3. Select the Sync for Reddit APK you want to patch.

**Supported app:** Sync for Reddit **v23.06.30-13:39** (free version,
`com.laurencedawson.reddit_sync`). Only this build is targeted.

## Patches

| Patch | Description |
|---|---|
| **Keep links in post previews** | Keeps links in the text under a post tappable in feed and card previews, where Sync otherwise drops them. Only the links are restored, so text keeps the size chosen in settings and images stay out of previews. |
| **Color post scores** | Colors a post's points orange when positive and purple when negative. The larger the score, the stronger the color. A vote color still takes priority on posts you have voted on. |
| **Color comment scores** | Colors a comment's points orange when positive and purple when negative. The larger the score, the stronger the color. Hidden scores are left alone. |
| **Use /user/ for profiles** | Replaces the deprecated /u/ profile endpoint with /user/, which Reddit still serves. User profile requests (about, friend and unfriend) use this path, so profiles fail to load without it. |
| **Show commenter's top subreddits** | Adds a line under each comment with the three subreddits the commenter is most active in, worked out from their recent public activity on Project Arctic Shift. Answers are cached per author; the archive is asked in the background. |
| **Move the card score to the bottom** | In the list, compact and smaller card layouts, splits the score line out of the post description and stretches the text over the full row: title at the top, points and comments at the bottom, author and flair sharing the space between. |
| **Hide the card dropdown button** | Hides the expand chevron on the right side of each post in the list, compact and smaller card layouts, and gives its width back to the post text. |

## Building

Requirements: JDK 21 and Android SDK platform 36. Point `ANDROID_HOME` at the SDK
(or create `local.properties` with `sdk.dir=...`).

```sh
./gradlew :patches:buildAndroid
```

The patch bundle is written to `patches/build/libs/patches-<version>.mpp`.

## Notes

- The patched APK is signed with the patcher's key, so uninstall the original app before
  installing. The output is APK Signature Scheme v2 only, which means Android 7.0 or newer.
- The patch restores link spans only. Other formatting spans (including the 1.25x size Sync
  applies to some link sources) stay dropped, so preview text keeps your configured size and
  image loading stays lazy.

## Credits and license

The preview-span approach is based on
[Patcheddit](https://github.com/wchill/patcheddit) and
[Sync Up](https://github.com/RashKash103/sync-up), both GPL-3.0.

SyncIt is licensed under the [GNU General Public License v3.0](LICENSE). See
[NOTICE](NOTICE) for additional conditions inherited from Morphe.
