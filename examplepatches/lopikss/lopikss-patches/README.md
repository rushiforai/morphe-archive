<div align="center">

# ⚡ Lopikss Patches

**Focused Android game patches — built for Morphe.**

[![Release build](https://github.com/lopikss/lopikss-patches/actions/workflows/release.yml/badge.svg?branch=main)](https://github.com/lopikss/lopikss-patches/actions/workflows/release.yml)
[![Validation](https://github.com/lopikss/lopikss-patches/actions/workflows/validate.yml/badge.svg?branch=main)](https://github.com/lopikss/lopikss-patches/actions/workflows/validate.yml)
[![License](https://img.shields.io/badge/license-GPL--3.0-40444A.svg)](LICENSE)
[![XP Hero](https://img.shields.io/badge/XP%20Hero%2026.2.0-user--tested-20A67E)](docs/XP_HERO_EXCHANGE.md)

### [➕ Add to Morphe](https://morphe.software/add-source?github=lopikss/lopikss-patches) · [⬇ Latest release](https://github.com/lopikss/lopikss-patches/releases/latest) · [💬 DM me on Discord](https://discord.com/users/493792470778511360)

*Want support for another game? [Request a patch](https://github.com/lopikss/lopikss-patches/issues/new/choose) or message **@lopikss** on Discord.*

</div>

---

## 🎮 Supported games

| Game | Android version | Patch | Status |
| --- | --- | --- | --- |
| **XP Hero** (`io.supercent.weaponrpg`) | **26.2.0** | **Modular shops, hero Level Up, Evolve and experimental Upgrade** | 🧪 **Community-tested, but some modules still experimental** |

### XP Hero — Modules (v1.3.7)

The six separate local shop modules have been merged into **XP Hero | Free Shops**.
Enable the patch and open its **options/settings** to choose which shop categories are free:
Daily Gem Shop, Chest Shops, Token Shop, Invasion Shop, Exchange Shop, and Other Shops.
All six switches default to **enabled**; paid Google Play purchases remain untouched.

**Return ticket correction (v1.3.7):** The paid 30-day Return Ticket offer is no longer modified. The **XP Hero | Free Tickets & Return** module now sets the game's separate *free Return ticket* inventory allowance at each daily reset (editable in Morphe, default 5000). The original €5.99 offer continues to advertise its normal 10 tickets. The free-ticket grant needs in-game verification after the next daily reset; cloud saves or server rules might still override it. [See technical notes](docs/XP_HERO_V137.md).

Other independent modules:
- **Free Hero Level Up** and **Free Hero Evolve** (reported working).
- **Hero Upgrade (1 Shard)** (reported working; genuinely costs one shard).
- **Free Rune Upgrades**, **Free Trait Presets**, **Free Trait Rerolls**, **Free S-Ticket Rolls**.
- **Free Tickets & Return** (experimental). The 400-refill limit was observed in Heroes' Tomb in-game, but the refill cost sometimes fell back to **100 gems**. v1.3.5 now patches the native **GetChargeCost** fallback so configured zero can be used; ticket purchase behavior still needs device testing.

Modules for 5,000 video tickets and zero-shard hero upgrades were removed in earlier releases because they did not work correctly. The native trait patch remains compatible with the new ticket refill correction.

[**Ticket fix technical notes**](docs/XP_HERO_V135.md) · [**Supported scope**](docs/XP_HERO_EXCHANGE.md)

## 📲 Install in Morphe (Android)

1. Install [Morphe](https://morphe.software), then **[add this patch source](https://morphe.software/add-source?github=lopikss/lopikss-patches)**. Alternatively, go to **Sources → + → Remote** and enter `github.com/lopikss/lopikss-patches`.
2. In the **Lopikss Patches** source card, tap **Update**. If you need to select XP Hero 26.2.0 and the option is shown, enable **Experimental app versions** (and **Pre-release patches** first if Morphe requires it).
3. Under **Settings → Advanced → Expert settings**, enable **Expert mode**.
4. Choose **XP Hero**, select **26.2.0**, and provide the **original, unmodified XAPK** when prompted.
5. In the **Lopikss Patches** tab, enable the **XP Hero 1.3** modules you want. Do not enable both hero Upgrade variants. Tap **Proceed to patching**.
6. Export/save the patched APK when complete; install it once you've protected your existing game data.

> [!CAUTION]
> The patched APK is normally signed with a different certificate. On an unrooted device, installation may require uninstalling the original, **deleting its local data**. Verify your save is safely backed up/synced *before* uninstalling anything. A working patch can still break after game updates.

If patching fails, report the **game version**, **Morphe version**, and **redacted patcher log** in a [bug report](https://github.com/lopikss/lopikss-patches/issues/new/choose).

Morphe documentation: [Patch sources](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patch-sources.md) · [Expert mode](https://github.com/MorpheApp/morphe-manager/blob/main/docs/patching-expert-mode.md)

## 🌐 Will this work for every game?

**Not automatically.** There is no single safe patch that makes all game exchanges free. Different apps use different game engines, resource formats and server-side validation.

The reusable **[Unity cost-table editor](patches/src/main/kotlin/app/lopikss/patches/shared/UnityCostTableEditor.kt)** handles the *same type of embedded cost data* used by XP Hero. Each new game/version still needs its **own adapter**, verified original asset, shop-currency mapping, expected values, compatible package target, and device tests.

For other engines or server-controlled stores, a completely different approach may be required—or the client-side approach may not be viable.

**[How to add support for another game →](docs/ADDING_GAME_SUPPORT.md)**

## 💬 Request patches for other apps

**Want me to look at another Android game? Feel free to DM me!**

- **Discord:** [**@lopikss**](https://discord.com/users/493792470778511360)
- **GitHub:** [Open a patch request](https://github.com/lopikss/lopikss-patches/issues/new/choose)

Tell me the **game name, Android package, exact version**, what you'd like changed, and share screenshots of the relevant game screen if useful. Requests are welcome, but **compatibility and results aren't guaranteed**. Please don't post game accounts, private save data or proprietary APKs in public issues.

## 📦 Available patches

This catalog is generated automatically from published Morphe patch metadata.

<!-- PATCHES_START EXPANDED -->
> **[v1.5.0](https://github.com/lopikss/lopikss-patches/releases/tag/v1.5.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;14 patches total
<details open>
<summary>📦 XP Hero&nbsp;&nbsp;•&nbsp;&nbsp;14 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;27.0.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [XP Hero | Choose S-Ticket Trait](#xp-hero-choose-s-ticket-trait) | Choose S/SS/SSS rarity, stat and set icon in patch settings. S-ticket roll weights favor exactly that combination. Coin-roll rarity/synergy odds unchanged; same-rarity stats are shared. Combine with Free S-Ticket Rolls. | • S-ticket rarity<br>• Trait stat<br>• Trait synergy icon |
| [XP Hero | Free Hero Evolve](#xp-hero-free-hero-evolve) | Experimental: zero hero evolution materials and pieces. |  |
| [XP Hero | Free Hero Level Up](#xp-hero-free-hero-level-up) | Experimental: zero hero level-up resource costs. |  |
| [XP Hero | Free Hero Upgrade (0 Shards)](#xp-hero-free-hero-upgrade-0-shards) | Experimental: shows 0 shards, credits +1 just before the normal 1-shard upgrade, then consumes it. Net cost 0; do not combine with 1-shard fallback. |  |
| [XP Hero | Free Rune Upgrades](#xp-hero-free-rune-upgrades) | Experimental: zero both resource costs for all 1,440 rune upgrade levels. |  |
| [XP Hero | Free S-Ticket Rolls](#xp-hero-free-s-ticket-rolls) | Experimental: make S-Ticket rolls cost 0 in XP Hero 26.2.0. |  |
| [XP Hero | Free Shops](#xp-hero-free-shops) | Choose which shop categories have zero in-game currency prices. Open patch settings for six toggles. | • Daily Gem Shop<br>• Chest Shops<br>• Token Shop<br>• Invasion Shop<br>• Exchange Shop<br>• Other Shops |
| [XP Hero | Free Tickets & Return](#xp-hero-free-tickets-return) | Instant free Return portal uses in the field (no daily-reset wait), plus free ticket refills; paid purchases unchanged. | • Daily ticket refill limit<br>• Instant free Return allowance<br>• Initial free Return allowance |
| [XP Hero | Free Trait Presets](#xp-hero-free-trait-presets) | Experimental: zero save/load costs for four trait presets (not rerolls). |  |
| [XP Hero | Free Trait Rerolls](#xp-hero-free-trait-rerolls) | Experimental: change the ARM64 trait reroll cost calculator to return 0, including for locked traits. |  |
| [XP Hero | Hero Upgrade (1 Shard - Fallback)](#xp-hero-hero-upgrade-1-shard-fallback) | Confirmed working fallback; costs one shard. Disable when selecting Free Hero Upgrade (0 Shards). |  |
| [XP Hero | Highest-Rarity Tomb Runes](#xp-hero-highest-rarity-tomb-runes) | Every rune dropped in Heroes' Tomb uses the highest available grade for the selected difficulty, including three-ticket runs. Original loot counts and ticket costs apply. |  |
| [XP Hero | Massive EXP Multiplier](#xp-hero-massive-exp-multiplier) | Monster EXP 1x–100000x (default 10000x). Optional EXPERIMENTAL level cap 2200; original max 1500 remains default. Extending player level might be rejected by server checks or break existing saves. | • Monster EXP multiplier<br>• EXPERIMENTAL player level cap |
| [XP Hero | Unlock All Heroes (FREE)](#xp-hero-unlock-all-heroes-free) | Experimental: all heroes cost 0 unlock pieces; the native zero-amount consume path keeps its normal notifications. Other unlock conditions may still apply. |  |

</details>

<!-- PATCHES_END -->

### XP Hero: Zero-gem Exchange materials

Verified in the currently supported game version by the project owner. See [implementation notes](docs/XP_HERO_EXCHANGE.md).

## 🛠️ For developers

Based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).

```bash
git clone https://github.com/lopikss/lopikss-patches.git
cd lopikss-patches
./gradlew :patches:buildAndroid
```

Compiled `.mpp` files are placed in `patches/build/libs/`. **`dev`** is for new changes; **`main`** is for stable releases. For new games, start with [the adapter guide](docs/ADDING_GAME_SUPPORT.md).

[Roadmap](docs/NEXT_STEPS.md) · [Contributing](CONTRIBUTING.md) · [Security](SECURITY.md) · [Releases](https://github.com/lopikss/lopikss-patches/releases)

---

<div align="center">

Made by [**Lopikss**](https://github.com/lopikss) · [GPL-3.0 license](LICENSE)

<sub>Independent community project; not affiliated with Morphe or the game developers.</sub>

</div>
