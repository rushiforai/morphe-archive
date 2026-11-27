# Hide Instagram follow recommendations

An independent [Morphe](https://morphe.software/) patch bundle to hide suggested accounts to follow, profile recommendation carousels and suggestions in follow requests.

Requires **FeurStagram 456.0.0.53.78** (com.instagram.android). It does not require GramForge or the notification patch. Stock Instagram is not supported: the feed filter uses FeurStagram hooks.

The original [GramForge implementation](https://github.com/brandonp2412/GramForge/blob/main/tools/patch-follow-recommendations.py) was confirmed working on a Samsung Galaxy S25. This port uses the same four hooks; normal posts, Reels, sharing and real follow requests are not targeted.

## Installation

Add [the source](https://morphe.software/add-source?github=brandonp2412/instagram-follow-recommendations) in Morphe Manager and select **Hide follow recommendations** on the matching FeurStagram APK.

Validation: Morphe Desktop 2.1.1 with `--validate` successfully applied the patch to the original FeurStagram 456 APK, modifying exactly four classes, rebuilding and signing successfully. The standalone port has not yet been exercised in a logged-in account.

Build: `./gradlew :patches:buildAndroid`. No APK or signing key is distributed.

<!-- PATCHES_START EXPANDED -->
<!-- PATCHES_END -->

[GPL-3.0](LICENSE).
