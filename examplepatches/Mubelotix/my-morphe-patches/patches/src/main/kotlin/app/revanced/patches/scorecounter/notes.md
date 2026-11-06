# Score Counter

## Target and compatibility

- Package: `net.aasuited.universalscoretracker`
- Supported version: **2.14.6**
- This patch shares the older Google test-ad-unit helper pattern with previous Tarot Counter versions. Its fingerprints are kept local to the Score Counter patch package.

## Ad-removal path

- `bannerAdUnitFingerprint` matches the public static final helper returning a string for the standard Google test banner unit ID.
- `openAdUnitFingerprint` matches the corresponding helper returning a string for the standard Google test app-open unit ID.
- The patch returns an empty string from both helpers and hides `adbanner_container` in `activity_player_statistics_with_player_header.xml` and `activity_score_board.xml`.
- The fingerprints use stable method signatures and test-unit string constants rather than obfuscated implementation class or method names. Confirm each match remains unique when updating the supported app version.
