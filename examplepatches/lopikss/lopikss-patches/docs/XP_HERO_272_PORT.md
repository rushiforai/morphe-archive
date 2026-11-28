# XP Hero 27.2.0 port

Target: version 27.2.0, version code 82, original APKPure XAPK supplied by the owner (base + ARM64 split). This is an experimental update of all 15 existing modules, not a claim of device-tested compatibility. Retains previous 26.2.0/27.0.0 support.

Seven original assets or sets are byte-identical to their previously pinned hashes: hero level/evolve, rune upgrades, trait presets, trait picker, EXP multiplier, party skill enhancement.

Changed assets:
- ShopProductData_229: 809 product rows; active_time precedes category_id; ShopProductCostData_202: 865 cost rows. Category counts: 300 daily gem, 24 chest, 27 token, 39 invasion, 24 exchange, 31 other eligible non-IAP rows.
- CostumeStarGradeOptionData_52: 156 cost rows. CostumeData_63 unchanged.
- RemoteConfig_347: original ticket values unchanged; ConfigData_47 identical.
- RewardGroupData_157: 8 Tomb pools, 34 grade bytes redirected; original and patched hashes pinned.

Native code: 89,001,608-byte ARM64 library; Assembly-CSharp method table located using ELF RELA entries and metadata version 31. CalculateRollCost(int) handles both the no-argument wrapper and TryConsumeRollCost. Grade-up, piece consumption, return, and Tomb cost callsites were checked against disassembly. All known edits are normalized before verifying the full original SHA-256; unrelated modifications fail closed. Paid Google Play purchases remain untouched.

Compile and on-device testing are separate. Do not select both star-upgrade variants. Back up saves first.
