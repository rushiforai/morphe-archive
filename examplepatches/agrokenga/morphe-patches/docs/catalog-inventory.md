# KoPP2 2.21.4 — Purchase Catalog Inventory

Package: `com.paradoxplaza.kopp2`
Version: `2.21.4` (versionCode 243)
Purpose: documentation of what the shipped client knows how to sell. This is an inventory,
not a claim that every item is still purchasable. The PlayFab backend and the Google Play
listing are offline, so live availability and localized prices cannot be confirmed.

## Sources and confidence

| Source | What it proves | Confidence |
|---|---|---|
| `assets/bin/Data/data.unity3d` → `TextAsset` `IAPProductCatalog` | The Unity Purchasing catalog the client initializes with: 17 product IDs, titles, descriptions, default USD prices, Apple price tiers. | High — this is shipped data. |
| `il2cppdump/dump.cs` (`StoreIds`, `BundleDataKeys`, `RoleBundleIds`, `FurnitureBundleIds`, `PlayFabBundle`, `BundlesService`) | Store names, bundle ID constants, and the shape of server-driven bundles. | High for declarations; contents are runtime data. |
| `EN_Interface` (localization TextAsset) | Display names/descriptions for bundles, kits, and the named DLC. | High for strings. |
| `ghidra/analysis.md` | Independent symbol-level cross-check. | Medium — no reliable method bodies. |

No serialized `PlayFabBundle` or `GoldProduct` assets exist in `data.unity3d`; those objects
are built at runtime from PlayFab responses. Their exact contents and live prices are not
recoverable offline.

## 1. Platform IAP — shipped Unity Purchasing catalog

All 17 entries are `type: 0` (Unity `ProductType.Consumable`). The client ships no store IDs
(`storeIDs: []`); IDs are resolved by the store. Prices below are the catalog's default USD
values, not regional prices.

| # | Product ID | Display name | Default USD | Apple tier | Description |
|---:|---|---|---:|---:|---|
| 1 | `starter_kit` | Starter Kit | $5.00 | 5 | Weapons, armor, potions, currency! Everything a new adventurer needs. |
| 2 | `enchanting_set` | Enchanting Set | $10.00 | 10 | Everything you need to enchant and power-up 3 pieces of gear. |
| 3 | `snack_pack` | Snack Pack | $10.00 | 10 | No dungeon is too long when your lunch-box is packed full! |
| 4 | `advanced_kit` | Advanced Kit | $20.00 | 20 | A collection of resources for the serious adventurer. |
| 5 | `spelling_set` | Spelling Set | $15.00 | 15 | Deepen your energy reserve and spell damage to blast away any threat. |
| 6 | `tanking_set` | Tanking Set | $15.00 | 15 | Build up your threat and durability to protect your party. |
| 7 | `healing_set` | Healing Set | $15.00 | 15 | Keep your party members alive and well. |
| 8 | `monk_set` | Monk Set | $15.00 | 15 | Specialize in hand-to-hand combat - up close and personal. |
| 9 | `warlock_set` | Warlock Set | $15.00 | 15 | The must-have set for any magically-oriented warrior. |
| 10 | `mage_set` | Mage Set | $15.00 | 15 | Turns a glass cannon mage into a force to be reckoned with. |
| 11 | `thief_set` | Thief Set | $15.00 | 15 | Backstab, steal, loot and pilfer with unmatched efficiency. |
| 12 | `knight_set` | Knight Set | $15.00 | 15 | Strength, honor and glory! Must-have stuff for the protector of the realm. |
| 13 | `diamonds_200` | Diamonds 200 | $5.00 | 5 | Small diamond pack. |
| 14 | `diamonds_480` | Diamonds 480 | $10.00 | 10 | Medium diamond pack. |
| 15 | `diamonds_1000` | Diamonds 1000 | $20.00 | 20 | Large diamond pack. |
| 16 | `diamonds_2800` | Diamonds 2800 | $50.00 | 50 | Huge diamond pack. |
| 17 | `dps_set` | DPS Set | $15.00 | 15 | Increase your damage output and deal massive critical hits. |

Caveats:

- `healing_set` has `googlePrice.num = 1500.0` in the raw JSON, but `data[0] = 1500`
  (minor units) and `applePriceTier = 15`; the intended price is **$15.00**. The other
  tier-15 products serialize `num = 15.0`. This looks like an editor serialization quirk,
  not a $1,500 product.
- Older reverse-engineering notes mention `diamonds_2600`; the shipped catalog says
  **`diamonds_2800`**. Treat the catalog as authoritative.
- Because the entries are consumables, Google Play will not return them from
  `queryPurchasesAsync` after they are consumed. A restore path cannot rely on a live
  purchase query for these SKUs; it needs a user-supplied local record (order history,
  email receipt, or an export made while the purchase was still active).

### Product families

- **Kits / resource packs:** `starter_kit`, `advanced_kit`, `snack_pack`, `enchanting_set`.
- **Class / role sets:** `dps_set`, `tanking_set`, `healing_set`, `spelling_set`,
  `monk_set`, `warlock_set`, `mage_set`, `thief_set`, `knight_set`.
- **Diamond packs:** `diamonds_200`, `diamonds_480`, `diamonds_1000`, `diamonds_2800`.

## 2. Runtime PlayFab bundles

The `PlayFabBundle` ScriptableObject says `itemBundleID` "should be unique and match the one
in stores". Bundle availability, pricing, and contents are fetched from PlayFab
(`BundlesService.InitializeAsync` / `UpdateBundles` / `ProcessResponse`), so the shipped APK
only contains the key names and presentation strings.

Store: `StoreIds.IAP = "IAPBundles"`.

Bundle ID constants found in metadata:

| Constant | Value | Notes |
|---|---|---|
| `BundleDataKeys.StarterKitId` | `starter_kit_02` | Second-generation starter kit key. |
| `BundleDataKeys.AdvancedKitId` | `advanced_kit_02` | Second-generation advanced kit key. |
| `BundleDataKeys.SnackPackId` | `snack_pack_02` | Second-generation snack pack key. |
| `BundleDataKeys.VeggiePackId` | `veggie_pack` | |
| `BundleDataKeys.EnchantSetId` | `enchanting_set_02` | |
| `RoleBundleIds.HealingSet` | `healing_set_02` | |
| `RoleBundleIds.DpsSet` | `dps_set_02` | |
| `RoleBundleIds.TankSet` | `tanking_set_02` | |
| `RoleBundleIds.SpellSet` | `spelling_set_02` | |
| `FurnitureBundleIds.RoomstarterId` | `room_starter` | Furniture bundle. |
| `FurnitureBundleIds.ArtDecoId` | `art_deco` | Furniture bundle. |
| `BundleDataKeys.LateBundleId` | `late_bundle` | "Official Offer". |
| `BundleDataKeys.CharacterKit` | `characterKit` | Marks a character-focused bundle. |
| `BundleDataKeys.Diamond` | `diamond` | Marks a diamond bundle. |
| `BundleDataKeys.Premium` | `premium` | Marks a premium bundle. |
| `BundleDataKeys.Repeatable` | `repeatable` | Marks a repeatable bundle. |

Named bundles in `EN_Interface`:

| Localization key | Display name | Description |
|---|---|---|
| `Starter_Bundle_Name` | Starter Set | A great value pack to kickstart your adventuring. |
| `Advanced_Bundle_Name` | Advanced Set | A great value pack to kickstart your adventuring. |
| `Basic_Bundle_Name` | +3 Bundle | A bundle preferred by Boosted Bandits. |
| `Charm_Bundle_Name` | Charming Bundle | A Bundle for serious enchanters. |
| `mega_bundle_name` | Mega Bundle | These items and resources offer answers to anything standing in your way. |
| `late_bundle_name` | Official Offer | Due to a critical typo, this bundle contains resources worth 5x its price! |
| `whitebeard_bundle_name` | Whitebeard Bundle | Deflect the snowstorms with this exclusive mighty Whitebeard! |

Additional ID-like strings in metadata (UI/legacy references, not proof of live products):
`starter_bundle_01..04`, `advanced_bundle_01..04`, `mega_bundle`, `mega_bundle_02`,
`friend_code_bundle_01`, `shop_bundle01..04`, `shop_diamonds01..04`, and
`shop_bundle_{starterkit,advancedkit,megabundle,snackpack,enchantingset,healingset,dpsset,tankingset,spellingset}`.

Contents a bundle can carry (`PlayFabBundle` fields): `goldAmount`, `diamondAmount`,
`vipTokenCount`, `items` (`List<BundledItems>`), `furnitures` (`List<string>`),
`charactersRaces` (`List<string>`), plus flags for hidden/featured/conditional/character-kit/
repeatable and `minClientVersion`.

## 3. DLC

`DLC` is a Unity `MonoBehaviour` with `UnlockType { DDE, EXP1, EXP2, EXP3 }`. The only
user-facing DLC name in the shipped strings is **Here Be Dragons** (level 25+). Internal IDs
also exist for `expansion1`/`expansion_01`, `expansion2`/`expansion_02`, and
`expansion3`/`expansion_03`, plus `unlockexpansion1` and `unlockexpansion2`. The presence of
IDs is not proof that every expansion shipped; only "Here Be Dragons" has display text.

`Install_DLC_Message` ("Please reinstall the DLC") and `Install_DLC_Ok` ("Open Steam") are
legacy PC strings. They are not evidence of an Android DLC store flow.

## 4. Not real-money purchases

These are in-game economy actions and should not be conflated with platform IAP:

- **Gold packs** — `GoldProduct` has `id`, `diamondPrice`, `goldAmount`, `nameKey`,
  `descriptionKey`, `iconName`, and `BASE_PER_DIAMOND = 50`. Gold is bought with **diamonds**
  in the `CurrencyExchange` store. Diamonds are the real-money product.
- **Magazine articles** — `MagazineInfo.Article` (`Mag{mag}_Article{index}`) has
  `ContentType { Recipes, CharacterClass, Text, Items, Character, Quest, DLC }` and a `price`.
  `Magazine_Buy_Message` is "Confirm purchase of [item] for [icon_gold][price]?" — articles
  cost **gold**, not real money. Magazines: Paperos Daily and Modern Dungeon.
- **Gacha chests** — `GachaChest.BasicChestPurchase` (gold) and
  `GachaChest.PremiumChestPurchase` (diamonds). Currency sinks, not store products.

## 5. Entitlement keys for a restore path

If a receipt-gated restore is built, the durable keys it must reason about are:

- Platform SKUs: the 17 product IDs in §1.
- Server bundle IDs: the values in §2 (`*_02`, `late_bundle`, `room_starter`, `art_deco`,
  `veggie_pack`, etc.).
- DLC flags: `DLC.UnlockType` (`DDE`, `EXP1`, `EXP2`, `EXP3`) and the `Unlocked` property.
- User-data keys the client already uses to persist unlocks:
  `UserDataKeys.Unlocks`, `UnlockedRaces`, `FurnitureLevels`, `VipInfo`, `MigrationInfo`.

A local record that only lists the 17 platform SKUs will not automatically restore a PlayFab
bundle that the server would have decomposed into items/currencies/races. The mapping from
`itemBundleID` to granted contents lived on the dead backend.

## 6. Open questions

1. Did the Android build ever expose the PlayFab bundles in §2, or are those leftovers from
   another platform/store configuration?
2. Did "Here Be Dragons" ship as a separate Android purchase, an entitlement flag, or free
   content in 2.21.4?
3. Which Google Play account/order history is available as the source for a local entitlement
   record? Consumables cannot be re-queried after consumption.
4. Are the `*_02` bundle IDs aliases of the §1 products or distinct products with different
   contents? Only the PlayFab title data could answer this.
