# XP Hero 26.2.0 — Zero-gem Exchange materials

**Status:** ✅ **Confirmed working in-game by the project owner** on Android with XP Hero **26.2.0**. This is a user-reported result, not independent certification or a guarantee about other devices/versions.

**Morphe patch:** `XP Hero: Zero-gem Exchange materials`

| Property | Supported value |
| --- | --- |
| Game | XP Hero |
| Package | `io.supercent.weaponrpg` |
| Tested version | **26.2.0** |
| Input | **Original unmodified XAPK** |
| Scope | **24 gem-priced material offers** in the Exchange shop |
| Not affected | Video-ad freebies, paid IAPs, purchases for unrelated categories |

## How the patch works

XP Hero's Unity asset `assets/bin/Data/c48bf6e962b374c2d829c84217571712` includes a `ShopProductCostData` table. A related `ShopProductData` table maps those rows to material products.

The patch uses the shared [UnityCostTableEditor](../patches/src/main/kotlin/app/lopikss/patches/shared/UnityCostTableEditor.kt) with this game's adapter. It changes **24 gem-priced rows** in Exchange's material categories (group IDs 1011–1084 as enumerated in the adapter), replacing their prices with fixed-width zeroes, e.g. `50 → 00`. The Unity asset's byte length stays unchanged.

Guards reject mismatching game assets by SHA-256, verify the original expected prices, disallow duplicate/missing cost rows, and require identical input/output byte length. Other rows are untouched.

**Original asset SHA-256:** `4e36ede85e3927f9f98ad3e3ae28a5e3362f1676da4c95e1ed33f6df263e26ac`

## Testing evidence and limitations

- **Local regression check:** The refactored shared editor produces output **byte-for-byte identical** to the previously tested XP Hero patch, using the original 121,364-byte asset.
- **Build:** The v1.1.0 Morphe bundle compiled and was released through GitHub Actions.
- **In-game result:** The project owner reported successful use of the zero-gem material Exchange patch on their device.
- **Limitations:** Not independently reproduced on other devices. Different game versions, shop data formats or server-side validation can invalidate this approach.

## Install

Follow the [README installation instructions](../README.md#-install-in-morphe-android). Use XP Hero **26.2.0**, enable the patch manually in Expert mode and back up/sync your save first.

## Other games

See [Adding game support](ADDING_GAME_SUPPORT.md). The editor is reusable only for compatible serialized cost tables; it does not automatically unlock every store or app.
