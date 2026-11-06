# Highest-Rarity Tomb Runes

Opt-in Morphe patch for XP Hero 27.0.0 (`io.supercent.weaponrpg`). Select **XP Hero | Highest-Rarity Tomb Runes** when patching the stock XAPK. Existing saves and runes do not need to be converted. The change applies to new rune drops.

| Heroes' Tomb difficulty | Phases | Ordinary / bonus group | Boss group | Highest rune |
| --- | --- | ---: | ---: | --- |
| Normal | I–V | 200000 | 200100 | 4 · Epic (purple) |
| Hard | I–V | 201000 | 201100 | 5 · Legendary (gold) |
| Extreme | I–V | 202000 | 202100 | 7 · Mythic |
| Hell | I–V | 203000 | 203100 | 8 · Exotic |

The 20 rows of `HeroTombStageData_12` identify the difficulty and phase. `HeroTombRuneDropData_9` assigns the ordinary, boss and bonus reward groups. Their positive-weight grade selectors in `RewardGroupData_152`, together with `RuneGradeData_3` and the English difficulty strings, establish the maximum grades above. Extreme can award grade 7 in the stock game. Grade 6 (Ancient) is below that maximum.

## What the patch changes

Both `HeroTombRuneDropData.AppendMainDropRewards` and `AppendGachaDropRewards` call `RewardGroupData.CalculateRewardsWithRuneDropMult`. The native selector picks a weighted row and passes its grade (`RewardParam` on reward type 102) through `TryAddReward` and `AppendRuneRarityRewards` to `RuneRewardPicker.GetRandomFillInfo`. The picker draws an existing ID from the grade's pool. All four target grades contain hero and general runes.

The patch discovers the eight pools from the Tomb drop table. In each pool, every weighted rune slot now points to the highest grade that originally had positive weight. This changes 34 single-byte grade selectors in one asset. Rates, empty outcomes, currency rows, counts and rune definitions retain their original bytes. The same guarantee holds when the game reweights slots for a drop bonus. Neither battle power nor the ticket multiplier selects a different rarity table.

On a successful clear, `GameModeHeroTomb.GrantTempInventory` consumes the collected rune entries and passes them to `RewardHelper.GetItemReward`. Its rune grant reaches `RuneManager.CreateInstance` and the game's normal inventory and stat creation. The patch edits no native methods. It validates both stock tables before writing, accepts its own verified output, and rejects other reward-table revisions or edits. Existing Lopikss patches use different resources.

## Verification

Run the comparator with Python 3.10+ after applying the patch. It accepts a patched base APK or XAPK.

```sh
python3 scripts/verify_tomb_rune_drops.py original-27.0.0.xapk patched.apk
```

The check covers all 20 phases, all 80 enemy rows, both reward-group references per enemy and all 42 weighted rune slots. It compares every reward row and field, verifies the target grades have real candidates and checks that exactly 34 bytes changed. The three-ticket setting still costs three tickets and uses the original loot multiplier. The guarantee covers the grade of runes that drop. Empty rolls, other loot and the game's clear condition still apply.

An on-device check is to complete a three-ticket run, compare the newly awarded runes with the table, restart the game and check that the same inventory instances persist. Device behavior and server synchronization require a live session.
