# Hide upgrade prompts

- **Patch name:** `Hide upgrade prompts`
- **Default:** `true` (enabled)
- **Dependency:** `pairipLicenseBypassPatch`
- **Source:** [`HideUpgradePromptsPatch.kt`](../patches/src/main/kotlin/app/w3s/patches/w3schools/misc/ui/HideUpgradePromptsPatch.kt)

## What It Does

Removes remaining free-user upgrade prompts without altering `isFreeUser` globally:

1. **Streak screen (`/streak`):** Matches `STREAK_FREEZE_UPSELL_REGEX` in the chunk containing `StreakDayCounter` and `freezeAvailable`, replacing the free-user condition (`!t||i||s?null:...`) with `!0?null:...` so the `"No streak freeze left!"` / `"Explore plans"` upsell card is hidden.
2. **Code Duel (`/duel`):** Matches `DUEL_GO_UNLIMITED_REGEX` in the chunk containing `"Go unlimited"` and disables the upgrade link (`!1&&...`) while keeping the daily cap reset countdown visible.
