# PurpleTV 2.4_r2 — Exact Uploaded APK Reference

## Artifact identity

Source artifact uploaded to the conversation:

`PurpleTV_2.4_r2.apk`

SHA-256:
`669c3512125de2b704d0b1063fc779e9cc7fe73eed8e5a618444f161e43f4361`

Size:
196,885,839 bytes

ZIP/APK entry count:
10,122

Uncompressed entry size:
309,065,790 bytes

The public PurpleTV mirror lists `PurpleTV_2.4_r2.apk` as a stable build released on 2024-08-14 and reports the same approximate 196.9 MB size as this upload:
https://purpletv.aeong.win/

External forum documentation identifies this build as PurpleTV 2.4-r2 based on Twitch 18.2.0. This is corroborating information; the uploaded APK remains the artifact of record.

## Embedded build metadata

Exact `assets/build.json`:

```json
{"number":2171,"timestamp":1708766264,"version":240,"revision":2,"force_cerberus":false,"bugApiKey":"REDACTED_FROM_REFERENCE"}
```

The timestamp is 2024-02-24T09:17:44Z.

Important:
- `version: 240` and `revision: 2` match the `2.4_r2` naming.
- The build metadata also contains a Bugsnag/API key field. It is intentionally not preserved in plaintext in this repository.
- `AndroidManifest.xml` was binary/AXML in the upload; raw decoded package metadata was not available from the minimal command-line toolchain used here. The DEX string pool does contain `tv.twitch.android.app`.

Selected extracted hashes:
- AndroidManifest.xml SHA-256: `76b13a6281abd132a8486ecf72b22d4a0a99acdabd27f55ac7696d0fbe8f98fa`
- resources.arsc SHA-256: `bdb4f1e1999ff15a5aba53a69b315dbf68e955a6dfa14911e5198d219bcefcaa`
- assets/build.json SHA-256: `9204a78b78c805839ece06d1dc5eb11b54a1427ad67f64180501f492bfd21a2f`

## APK structure

Largest top-level groups by uncompressed bytes:

| Group | Entries | Bytes |
|---|---:|---:|
| lib | 136 | 171,880,342 |
| res | 8,816 | 39,499,808 |
| resources.arsc | 1 | 14,482,416 |
| classes2.dex | 1 | 11,237,288 |
| classes.dex | 1 | 9,926,764 |
| assets | 607 | 2,459,275 |

Native libraries exist for ARMv7, ARM64, x86 and x86_64. The APK contains Twitch's large native playback/SDK libraries such as `libtwitchsdk.so`, `libbroadcastcore.so`, and related video/network components.

## PurpleTV DEX inventory

14 DEX files are present:

```
classes.dex       9,926,764
classes2.dex     11,237,288
classes3.dex      8,630,972
classes4.dex      9,376,552
classes5.dex      8,674,728
classes6.dex      8,546,636
classes7.dex      8,725,440
classes8.dex      9,065,260
classes9.dex      1,434,912
classes10.dex        40,092
classes11.dex     1,397,832
classes12.dex       628,060
classes13.dex        71,796
classes14.dex       222,940
```

Important external/helper DEX files include:
- `classes14.dex` corresponds to an SVG-related library in the source distribution.
- The APK contains a dedicated `bugsnag.dex`, `glide_webp.dex`, and `svg.dex` in its source tree lineage; the exact uploaded release also contains many third-party/embedded libraries.

## Channel Points evidence inside the exact PurpleTV 2.4_r2 APK

The exact APK's DEX strings contain all of the following relevant structures:

- `ClaimCommunityPoints`
- `ClaimCommunityPointsMutation`
- `ClaimCommunityPointsInput`
- `ClaimCommunityPointsPayload`
- `ClaimCommunityPointsStatus`
- `ClaimCommunityPointsError`
- `ClaimCommunityPointsErrorCode`
- `AvailableClaim`
- `availableClaim`
- `getAvailableClaim`
- `claimCommunityPoints`
- `getClaimCommunityPoints`
- `CommunityPointsModel`
- `CommunityPointsSettingsQuery`
- `channel_points_client_bonus_points_claim`
- `channel_points_client_bonus_points_impression`
- `channel_points_client_bonus_points_eligible_check`
- `channel_points_chest`
- `authToken_v2`
- `gql.twitch.tv`

The exact APK also contains the full GraphQL mutation text:

```graphql
mutation ClaimCommunityPointsMutation($input: ClaimCommunityPointsInput!) {
  claimCommunityPoints(input: $input) {
    claim {
      id
      multipliers { factor reasonCode }
      pointsEarnedTotal
      pointsEarnedBaseline
    }
    error { code }
  }
}
```

This is direct evidence from the uploaded PurpleTV APK, not merely from the current GitHub source.

## PurpleTV ReVive reference implementation

The current public PurpleTV ReVive source contains `ChannelPoints.kt`, which implements the same architectural pattern in an explicit, readable form:

- `H_CONTEXT` persisted-query hash:
  `1530a003a7d374b0380b79db0be0534f30ff46e61cffa2bc0e2468a909fbc024`
- `H_CLAIM` persisted-query hash:
  `46aaeebe02c99afdf4fc97c7c0cba964124bf6b0af229395f1f6d1feed05b3d0`
- Poll cadence:
  30 seconds
- Current channel ID/login are recorded when chat connects.
- The local Twitch OAuth token is read from the host app's `authToken_v2` preference.
- The token is sent to `https://gql.twitch.tv/gql`.
- `ChannelPointsContext` is used to read `communityPoints.availableClaim.id`.
- `ClaimCommunityPoints` is used to submit the claim.
- The successful mutation response is used as the claim result.
- The last successful claim ID is remembered to avoid duplicate submissions.

Source:
https://github.com/alienware377/purpletv-revive/blob/main/xposed/app/src/main/java/tv/purple/xp/ChannelPoints.kt

## Why this matters

PurpleTV demonstrates that a UI-independent claim loop is practical.

The important portability is **not** its Twitch-obfuscated class names. The portable part is:

```
current channel
    -> Twitch OAuth token
    -> GraphQL availableClaim
    -> claim ID
    -> ClaimCommunityPoints mutation
    -> authoritative response
```

That is the pattern Kizu should adapt to the 31.3.1 target.

## Difference from the current Kizu implementation

Kizu v1.7.18 currently performs:

```
3-second UI scan
    -> find visible/clickable text containing "claim"
    -> performClick()
```

PurpleTV's GraphQL implementation does **not** depend on the bonus chest being visible. That difference is the main reason it is a much better next candidate for Kizu.

## Security/data-handling note

The PurpleTV design reads the account's existing Twitch OAuth token locally and sends it to Twitch's own GraphQL endpoint. Kizu must never log or persist that token and must never send it anywhere except the intended Twitch endpoint.
