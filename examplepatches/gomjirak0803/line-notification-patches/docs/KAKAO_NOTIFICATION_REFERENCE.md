# Android `MessagingStyle` Reference Notes (KakaoTalk `26.9.2` Inspection)

On 2026-11-17, a user-supplied KakaoTalk `26.9.2` (`versionCode 29260920`) APKM was inspected locally as an Android notification API behavior reference. **Zero KakaoTalk code, images, or resources are included in this project.**

* APKM SHA-256: `83bde3fa2aa8652ab2fabdcba7cdf0fc6d0258ccc60bba2e956a2594ebdff7ac`
* `base.apk` SHA-256: `9b8f3cb7a7d31219fd022d28874cbec774c3fedaefee1e60aff34b3449a30983`
* v3 signature verified; certificate SHA-256: `2b06cc3d47782d7c497c07f17cb5f859cd6bbcb66829f3e67b96b7a44820d2ce`
* Minimum SDK: API 32 (not installed on S10e API 31; behavior verified via static inspection and synthetic rendering).

## Observed Android API pattern

* On Android API 30+, KakaoTalk's notifier selects Android's `Notification.MessagingStyle` when message previews are enabled and `BigTextStyle` otherwise.
* Messages (text, timestamp, sender `Person`) are appended up to a 25-message retention cap while passing the native total unread count separately via `setNumber`.
* Sender names are attached to `Person`, group status is passed via `setGroupConversation`, and Android's SystemUI controls sender grouping, multi-line wrapping, and visible row truncation.

## Applied design in LINE notification patches (`0.1.7+`)

* Replaced the earlier 5-line custom layout (`DecoratedCustomViewStyle`) with Android's public `Notification.MessagingStyle`, feeding up to 25 chronologically ordered local unread messages with stable `(accountId, senderId)` `Person` keys.
* Kept LINE's native total unread count in the heading as `Room Name  [N]` (e.g., `[83]` even when retaining 25 messages), because Android's template strips background-color spans on titles.
* Preserved LINE's existing `PendingIntent`s, `publicVersion`, `VISIBILITY_PRIVATE`, silent channel, complete-hide logic, and read/account boundary checks.
* Added local-cache-only sender avatars in `0.1.11-dev` (reusing original icons for 1:1 and `onlyRetrieveFromCache(true)` Glide cache for groups; no media downloads).
* Synthetic S10e rendering (1:1 `[1]`, group `[7]`, group `[83]` with 25 retained) and Android 16 AOSP / One UI 8.0 diagnostic rendering confirmed ~13.03sp sender/body sizing, ~10sp group title sizing, consecutive sender grouping, and system-controlled row truncation. See [DEVICE_TESTS.md](DEVICE_TESTS.md) for live results.
