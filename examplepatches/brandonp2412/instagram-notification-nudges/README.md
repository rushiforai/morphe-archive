# Hide Instagram notification prompts

A standalone [Morphe](https://morphe.software/) patch that removes Instagram notification opt-in prompts **without disabling notifications**. It does not touch permission APIs, push delivery, or per-account notification settings.

## What is hidden

- Feed and Direct inbox notification opt-in nudges
- Activity-feed notification upsell row
- Onboarding permission upsell
- The notification_permission_prompt Quick Promotion (other promotions remain)
- Direct-thread reachability banner
- Shared notification reachability reminders in Direct, activity, and profile
- Delayed permission prompts and re-foreground reachability toast
- Profile notification ViewStub

## Compatibility

- **Instagram 454.0.0.13.77** (com.instagram.android) — pinned to the FeurStagram 454.0.0.13.77 APK against which the original implementation has been verified.
- Other Instagram builds are **not** claimed compatible. Class names are obfuscated; patch matching must fail rather than change unrelated methods when they move.

## Installation

Add [this repository](https://morphe.software/add-source?github=brandonp2412/instagram-notification-nudges) as a patch source in [Morphe Manager](https://morphe.software/). Select **Hide notification prompts** while patching the matching APK.

## Source and validation

Ported from [GramForge's notification-nudge patch](https://github.com/brandonp2412/GramForge/blob/main/tools/patch-notification-nudges.py). The original Python patch checks a decoded APK for all expected notification-specific anchors before touching anything. The Kotlin implementation uses targeted method fingerprints and preserves unrelated Quick Promotions, Direct-thread banners, and profile UI.

### Verification status

- The official Morphe Desktop 2.1.1 CLI applied the patch to the 454.0.0.13.77 APK with --validate enabled and modified exactly 12 expected classes.
- Decompiled smali comparison confirms only the expected notification presentation checks and branch guards were modified.
- A disposable Android 15 emulator installed the patched APK, displayed the Instagram welcome screen, and produced no crash reports.
- **Authenticated feed/DM notification-prompt behavior and push delivery have not been verified on a logged-in account**; please report any remaining opt-in prompts or regressions.

For reproducing verification:

1. Use the original 454.0.0.13.77 FeurStagram APK, legally obtained separately.
2. Build the Morphe bundle with ./gradlew :patches:buildAndroid.
3. Apply only **Hide notification prompts** in Morphe Desktop/CLI.
4. Validate no notification API code was patched, confirm all listed UI nags are hidden, and test real message notifications.

No APK, signing key, or third-party application code is included.

## Patch list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/brandonp2412/instagram-notification-nudges/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Instagram&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.instagram.android`

**🎯 Supported versions:**

| 454.0.0.13.77 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide notification prompts](#hide-notification-prompts) | Hide Instagram's notification opt-in nags without disabling notifications. |  |

</details>

<!-- PATCHES_END -->

## License

[GPL-3.0](LICENSE). Not affiliated with Instagram, Meta, Morphe, or FeurStagram.
