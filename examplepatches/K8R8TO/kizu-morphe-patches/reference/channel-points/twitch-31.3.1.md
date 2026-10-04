# Twitch Android 31.3.1 — Exact Uploaded APKM Reference

## Artifact identity

Source artifact uploaded to the conversation:

`Twitch.apkm`

Container SHA-256:

`90894052705fd717f5ddb24d02f84ea3752e65600939bc3419695c613ff90fa9`

Container size:
- 114,713,462 bytes

APKM contents:
- `base.apk`
- `split_config.arm64_v8a.apk`
- `split_config.armeabi_v7a.apk`
- `split_config.xxhdpi.apk`
- `split_config.xxxhdpi.apk`
- `info.json`
- `icon.png`
- APKMirror/APKM metadata/signature files

### info.json — exact metadata captured from the uploaded APKM

```json
{
  "apkm_version": 5,
  "app_name": "Twitch: Live Streaming",
  "release_version": "31.3.1",
  "versioncode": "3103016",
  "pname": "tv.twitch.android.app",
  "variant": "(arm64-v8a + arm-v7a) (480-640dpi) (Android 9.0+)",
  "arches": ["arm64-v8a", "armeabi-v7a"],
  "dpis": ["480", "640"],
  "min_api": "28",
  "post_date": "2026-09-25 17:50:33",
  "accent_color": "9044ff",
  "apk_id": 16228851,
  "release_id": 16228826
}
```

The APKM contains 5 installable APKs: one base plus four configuration splits.

## Extracted component hashes

### base.apk
SHA-256:
`d231764122a8fcacdf244b6a279968780950bf4f250bc044c7700f44602be5f5`

Size:
79,078,438 bytes

### arm64-v8a split
SHA-256:
`8f8c6ec6cd65228fdf4c3f3ab802c95dc2351ccf951e8123a3dabcc6a46a4351`

Size:
54,320,286 bytes

### armeabi-v7a split
SHA-256:
`c5fd1837bfdd40399a7ef42d1d673eda1e793e6e211a4a4c84beb6283d22782a`

Size:
36,723,946 bytes

### xxhdpi split
SHA-256:
`f3f6c7cc3ef75833d8f4f66b0dd25977aa9feec6d73fea66c6efb8f59f4dd8dc`

Size:
6,378,895 bytes

### xxxhdpi split
SHA-256:
`0aafea60f9cecc7fd1d2ecd8fd9e4744f1c7bafb5f0e8490f46392508301d2c7`

Size:
7,132,642 bytes

## Base APK DEX layout

The base APK contains 6 DEX files:

| File | Size | SHA-256 |
|---|---:|---|
| classes.dex | 8,740,996 | `5829fa4f8fec213f114a04398c0d21dcce7b8fb5adb61faef5e9e8bb5ca1d0c2` |
| classes2.dex | 8,798,808 | `1d4215f1ab223c69b99665e5f3833240495c2bb4c7a788f7d9aa37965bc1f225` |
| classes3.dex | 9,235,416 | `36e7cff660384b47e5944d5686c2a87a7a5e682ecb504220bcb8ff8e85e9c582` |
| classes4.dex | 8,266,000 | `a9d43166af246134f480857f140c9e32e20633c10b6c86acef3a2f65b6f20af3` |
| classes5.dex | 9,234,872 | `310e7267db9b1d8abfb15632ae6623add00865e9a758c321cdc1f5b13d84e0dc` |
| classes6.dex | 5,309,920 | `10cf6e4598f349a73e1814a657703b152399e8026091198af0a830b3d7aad510` |

## Authoritative 31.3.1 Channel Points classes

### ChannelChatConnectionKey

Exact class:

`tv.twitch.android.shared.chat.pub.messages.data.ChannelChatConnectionKey`

Exact constructor:

`<init>(Ljava/lang/String;Ljava/lang/String;)V`

Accessor methods present in the exact DEX:

- `getChannelId(): String`
- `getChannelName(): String`
- `component1(): String`
- `component2(): String`
- `copy(String, String): ChannelChatConnectionKey`

The class is a Kotlin data class and is therefore a strong current-channel anchor.

### CommunityPointsModel

Exact class:

`tv.twitch.android.models.communitypoints.CommunityPointsModel`

Exact methods observed:

- `getBalance(): int`
- `setBalance(int): void`
- `getClaim(): Lfd`
- `setClaim(Lfd): void`
- `getClaimStatus(): Ln87`
- `setClaimStatus(Ln87): void`
- `getPointsName(): String`
- `getEnabled(): boolean`
- `getUserBanned(): boolean`
- `getActiveMultipliers(): List`
- `getPointChangeContainer(): PointsChangedContainer`
- `getEarnings(): CommunityPointsEarnings`

The claim object returned by `getClaim()` is an obfuscated model in this build; do not assume the `Lfd` type name is stable outside this exact APK.

## GraphQL evidence in the exact APK

The base APK contains the full Twitch GraphQL operation string for the current Channel Points settings/context path:

```graphql
query CommunityPointsSettingsQuery($id: ID!) {
  user(id: $id) {
    channel {
      communityPointsSettings {
        isEnabled
        isAvailable
        name
        defaultImage { ... }
        image { ... }
        emoteVariants { ... }
        earning {
          averagePointsPerHour
          cheerPoints
          claimPeriodMinutes
          claimPoints
          followPoints
          passiveWatchPeriodMinutes
          passiveWatchPoints
          raidPoints
          subscriptionGiftPoints
          watchStreakPoints { points streakLength }
          multipliers { factor reasonCode }
        }
      }
    }
    self {
      communityPoints {
        balance
        availableClaim {
          id
          pointsEarnedTotal
          pointsEarnedBaseline
          multipliers { factor reasonCode }
        }
        activeMultipliers { factor reasonCode }
        limitedEarnings {
          isCheerAvailable
          cheerAvailableAt
          isSubscriptionGiftAvailable
          subscriptionGiftAvailableAt
        }
        canRedeemRewardsForFree
      }
    }
  }
}
```

The exact APK also contains the complete mutation text:

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

Other relevant strings present in the exact APK include:

- `ClaimCommunityPoints`
- `ClaimCommunityPointsMutation`
- `ClaimCommunityPointsInput`
- `ClaimCommunityPointsPayload`
- `availableClaim`
- `getAvailableClaim`
- `getClaimCommunityPoints`
- `claimCommunityPoints`
- `channel_points_client_bonus_points_claim`
- `channel_points_client_bonus_points_impression`
- `channel_points_client_bonus_points_eligible_check`
- `channel_points_chest`
- `binding.channelPointsButton`

This strongly confirms that the official 31.3.1 app already has both a claim model and an official GraphQL claim path.

## What this means for Kizu

The uploaded target build gives us two separate avenues:

1. A native model/provider route around `CommunityPointsModel`.
2. A GraphQL route already used by Twitch itself.

The historical Kizu regressions show that the first route is dangerous to alter. The second route is therefore the preferred candidate for the next auto-claim implementation.

The GraphQL claim is especially attractive because the mutation response contains the claimed item and point totals, so success can be determined from Twitch's actual response rather than `View.performClick()`.

## Important runtime facts from the target

- Package: `tv.twitch.android.app`
- Minimum API: 28
- ARM64 and ARMv7 builds are supplied.
- 480/640 dpi configuration splits are supplied.
- The target device previously recorded in this repository is Samsung SM-G990B2 / Android 16 API 36.
- The current Kizu channel anchor already uses `ChannelChatConnectionKey(String,String)`.

## Do not make these assumptions

- Do not assume PurpleTV's old Twitch version's obfuscated classes map to 31.3.1.
- Do not assume a donor's `CommunityPointsModel` method descriptor is unchanged across versions.
- Do not gate the claim attempt on a UI text scan.
- Do not parse the balance before attempting the claim in the critical claim path.
- Do not modify `CommunityPointsModel` provider lifecycle merely to start polling.
