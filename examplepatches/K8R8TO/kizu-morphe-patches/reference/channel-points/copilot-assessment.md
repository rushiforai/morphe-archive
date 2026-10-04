# Copilot Auto-Claim Diagnosis — Assessment

## What Copilot said

The supplied Copilot diagnosis described the old implementation as a multi-stage bytecode-based mechanism depending on a generated `kizuAutoClaim` helper and an obfuscated provider/model hook. It also recommended verifying Twitch 31.3.1 bytecode rather than assuming donor signatures.

## What is correct

The general warning is correct: Twitch 31.3.1 is obfuscated, and donor signatures from older Twitch builds or other apps must not be assumed to match.

The repository really does contain a Channel Points patch history involving Twitch's `CommunityPointsModel`, `getClaim()`, and generated helper methods. Those approaches were the source of the regressions already recorded in the project history.

The recommendation to use the exact 31.3.1 APK/APKM as the bytecode authority is also correct.

## What is stale or incorrect for the current tree

The current repository at the time of this reference does **not** contain the Java file/path described by Copilot as `AutoClaimChannelPointsPatch.java` with a live `invokeGeneratedAutoClaim(provider, model)` implementation. The current patch file is:

`patches/src/main/kotlin/io/github/bakwudo/uyu/patches/twitch/channelpoints/AutoClaimChannelPointsPatch.kt`

and at the current main revision it is only a small marker/dependency patch. The active runtime is in:

`extensions/extension/src/main/java/app/morphe/extension/Utils.java`

That runtime currently performs a 3-second visible-view scan and calls Twitch's visible claim control.

Therefore, the specific `kizuAutoClaim(provider, model)` method-mismatch explanation should **not** be treated as the root cause of the current v1.7.18 runtime failure.

## Current setting behavior

The setting is:

`Settings.AUTO_CLAIM_CHANNEL_POINTS`

The setting is now defaulted to `true`. This means new/default settings enable Auto Claim without requiring the user to turn it on manually.

A previously stored `false` preference remains a user preference; changing the code default does not silently overwrite an existing stored value.

## Direction for the next implementation

The PurpleTV GraphQL design is the preferred reference:

1. Resolve the active channel ID and login.
2. Read the existing Twitch OAuth token from the app's own local preferences.
3. Poll Twitch GraphQL for the current channel's `availableClaim`.
4. Obtain the actual claim ID returned by Twitch.
5. Send Twitch's `ClaimCommunityPoints` mutation with the current channel ID and claim ID.
6. Use the mutation response as the authoritative claim result.
7. Let Twitch's own state/model/UI reconcile the claim naturally.
8. Optionally display a short success/failure overlay after the mutation result.
9. Do not modify `CommunityPointsModel` lifecycle or inject code into the provider update path.
10. Keep all network work off the main/UI thread.

This design also naturally ignores normal +10 watch-time earnings because it only acts when Twitch reports an `availableClaim`.


## Follow-up after the GraphQL rewrite

The repository now follows the GraphQL direction recommended by the PurpleTV evidence:
- The previous UI scanner is no longer started.
- The new claimant lives in `app.morphe.extension.channelpoints.ChannelPoints`.
- Current channel ID/login still come from the stable `ChannelChatConnectionKey(String,String)` constructor.
- Twitch 31.3.1's exact inline GraphQL query/mutation text is used first.
- PurpleTV's persisted-query hashes remain as fallbacks.
- The claimant is enabled by default.
- No provider/model lifecycle hook is required to start polling.
