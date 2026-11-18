# Patches

> Generated from `patches-list.json` - **v1.40.2** (`main`) - **26 patches** across **9 apps** - back to [README](README.md)

---

## AndroPods (pro.vitalii.andropods)

**Supported versions:** `1.5.30`

| Patch | Details |
|---|---|
| **Play Store Fix** | Removes the Google Play installation check that blocks patched APKs at startup. |
| **Premium** | Enables Pro features, including after a purchase status refresh. |

---

## Gardenscapes (com.playrix.gardenscapes)

**Supported versions:** `experimental 9.9.0`

| Patch | Details |
|---|---|
| **Repair negative stars once** | Repairs a negative saved star balance to 2 when the garden reads it, once per installation, and skips the local unofficial-install dialog. No level completion needed. Gardenscapes 9.9.0 ARM64 only. Experimental. |

---

## Good Coffee, Great Coffee (com.tapblaze.coffeebusiness)

**Supported versions:** `1.24.0` `1.25.1` `1.26.0`

| Patch | Details |
|---|---|
| **Coffee startup support** | Restores version-specific Unity startup after re-signing. |
| **Google Play Games via MicroG-RE** | Routes Google Play Games sign-in and player/server authorization through MicroG-RE 7.1.0+. Requires app.revanced.android.gms. |
| **Non-blocking update notice** | Replaces Coffee's blocking update/install notice with one short toast and continues loading the game. |
| **Skip rewarded ads** | Completes the requested rewarded-video flow locally using the game's callbacks. |

---

## Good Pizza, Great Pizza (com.tapblaze.pizzabusiness)

**Supported versions:** `5.57.3` `5.58.0` `5.59.0` `5.59.2`

| Patch | Details |
|---|---|
| **Google Play Games via MicroG-RE** | Routes Google Play Games sign-in and player/server authorization through MicroG-RE 7.1.0+ and suppresses obsolete stock Play services update prompts. Requires app.revanced.android.gms. |
| **Hide paid offers** | Hides real-money storefront sections and cancels Google Play checkout. Keeps in-game currency exchanges and existing purchase processing. Requires a supported ARM64 Pizza build. |
| **Non-blocking update notice** | Replaces Pizza's blocking game-update notice with one short toast and continues loading. |
| **Skip rewarded ads** | Completes the game's rewarded-video flow without playing an ad, keeping the requested placement and normal reward. Includes re-signed startup support. |

---

## Google Calendar (com.google.android.calendar)

**Supported versions:** `2026.37.0-984865732-release`

| Patch | Details |
|---|---|
| **Google Calendar authentication via MicroG-RE** | Routes Calendar token requests and invalidation through MicroG-RE 7.1.1+. Requires Google Play services and the same account in Android and MicroG-RE. |
| **Stabilize schedule widget** | Rebuilds schedule widget row contents on Android 16+ to work around missing tiles, deformed tile backgrounds and recycled layout corruption. Intended for Realme UI 7. Does not reset the widget. |

---

## Harry Potter: Hogwarts Mystery (com.tinyco.potter)

**Supported versions:** `experimental 7.3.4`

| Patch | Details |
|---|---|
| **Faster action feedback** | Shortens the action button's local progress feedback from 0.3 to 0.125 seconds. |
| **Faster dialogue text** | Reveals dialogue text at 100 characters per second. Dialogue choices and manual advancement remain available. |
| **Faster interaction fades** | Speeds up the brief pause and fade in the action-button completion animation.<br><sub>Options: Interaction fade speed</sub> |
| **Faster lesson feedback** | Shortens the pauses after focus minigames and lesson banners while keeping earned grades and lesson progress. |
| **Hide automatic paid greeting** | Hides the paid greeting and two verified automatic starter offers. The shop and manually opened offers remain available. |
| **No energy consumption** | Keeps action costs without debiting energy. By default, each tap advances one point, even at an empty balance.<br><sub>Options: Interaction taps</sub> |
| **Quicker outfit previews** | Shortens avatar preview camera transitions when changing clothing categories or slots. |
| **Quicker reward reveals** | Shortens three pauses in the reward reveal screen while keeping the original reward and collection flow. |
| **Skip local quest waits** | Experimental. Finishes the local countdown for an already eligible quest through its normal expiry path. Objective cooldowns and event schedules still apply. |

---

## Instagram (com.instagram.android)

**Supported versions:** `experimental 447.0.0.55.81` `experimental 439.0.0.37.89`

| Patch | Details |
|---|---|
| **Keep DM scroll position** | Prevents Instagram Direct from jumping to the newest message after replying to an older message. Requires Piko Add settings in the same patching run. |

---

## Mapa Turystyczna (pl.mapa_turystyczna.app)

**Supported versions:** `1.16.6`

| Patch | Details |
|---|---|
| **Hide Premium prompts** | Hides Premium offers and the menu entry. Removes the trial notification on launch. |
| **Local Premium** | Enables local Premium checks for navigation, offline map controls and ads. Does not activate a subscription on your account. Experimental; device testing needed. |

---

## TikTok (com.zhiliaoapp.musically)

**Supported versions:** `47.0.3`

| Patch | Details |
|---|---|
| **Keep TikTok DM scroll position** | Keeps your position while reading older messages, including after sending messages and replies. Compatible with kveld9 patches. |

---
