# Kizu 1.8.0 Baseline

## Status

**1.8.0 is the new known-good project baseline.**

Future Twitch patch work should start from the current `main` revision containing the 1.8.0 GraphQL Channel Points implementation, unless a task explicitly requires a different historical version.

## Baseline commit

- GraphQL Channel Points implementation: `ec893d4369f76b8c37da0d8bcd953880462b15b5`
- Version: `1.8.0`
- Target Twitch: `31.3.1` / build `3103016`
- Package: `tv.twitch.android.app`

## Known-good behavior

The 1.8.0 baseline uses the GraphQL claimant in:

`extensions/extension/src/main/java/app/morphe/extension/channelpoints/ChannelPoints.java`

It:

- polls for Twitch-reported `availableClaim` state;
- uses Twitch's exact 31.3.1 GraphQL query/mutation first;
- retains PurpleTV ReVive persisted-query hashes as fallbacks;
- uses the host app's existing OAuth token without logging it;
- receives the current channel ID/login through the existing channel hook;
- treats the GraphQL mutation response as authoritative proof of a claim;
- reports the confirmed claimed amount through the informational status overlay;
- runs network work off the UI thread;
- keeps Auto Claim enabled by default.

## Regression guardrails

Do not replace this mechanism with:

- `CommunityPointsModel` provider lifecycle hooks;
- generated provider/model polling helpers;
- UI text scanning as the primary claimant;
- `View.performClick()` as proof of a successful claim;
- forced hiding of Twitch's claim UI as proof of success.

Those approaches caused regressions or unreliable claim verification during the 1.7.x investigation.

## Device validation

The 1.8.0 GraphQL implementation has been tested on the user's actual Twitch 31.3.1 setup and was reported as working reliably for automatic Channel Points claiming.

That device validation is the behavioral baseline. CI/build/release status must still be independently verified before claiming that a newly generated artifact is released.

## Rule for future changes

Treat 1.8.0 as the starting point. Preserve the working GraphQL claimant and all unrelated Twitch functionality, especially chat, home/feed UI, and the third-party emote picker.

Any future Channel Points change should be narrowly scoped, built, and verified before replacing this baseline.
