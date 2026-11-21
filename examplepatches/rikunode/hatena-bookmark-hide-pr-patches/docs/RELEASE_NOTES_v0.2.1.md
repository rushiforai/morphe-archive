# v0.2.1 (EXPERIMENTAL) — fix PR ad leakage in no-mute hot feeds

**User-confirmed issue in v0.2.0:** Android 5.80 clone loaded a live `総合` article list containing a sponsored entry with an `広告` badge. The two patches installed and the app launched, but native ads were NOT hidden.

## Root cause and fix

Hatena 5.80's `BookmarkEntryItemCompactViewModel` reads `BookmarkEntry.isPrEntry()` to display the native PR label. v0.2.0 modified only `MuteHelperKt.filteredWithMuteWords()` to reject PR entries. However, both `GetCategoryHotEntryList.execute()` and `CategoryHotEntryPagingSource.getHotEntries()` skip the whole mute-filter call when the account is logged out or the mute word count is zero. The original PR row thus survived.

v0.2.1 keeps the existing PR rejection and additionally instruments `CategoryHotEntryPagingSource.withDate(List<BookmarkEntry>, ZonedDateTime)`, used by the paged hot feed regardless of account/mute status. Before date-item conversion, it invokes the original `filterByMuteWords(rawEntries, emptyList(), null)` so the patch's PR guard runs unconditionally. For normal entries the original filter accepts all items when no mute words were provided. Existing account mute rules are applied earlier when configured.

Compatibility remains **Hatena Bookmark v5.80 / versionCode 58000 only**. Two patches: PR filtering + side-by-side clone, both enabled by default. **5.84 is not compatible**; former v0.1.1 for 5.84 failed due Pairip Play license.

## Verified

- Original user-supplied historical 5.80 APK SHA-256 `f5de27b6d0948d5716ef7dd24c0910c37e370c07db3888ff8aaa38a70afbd94b` unchanged.
- Morphe v0.2.1 applied both patches to the exact APK; applied 2, failed 0, patching/rebuild/signing PASS.
- Output clone package `com.hatena.android.bookmark.morphe`, Android v2 signature CN=Morphe verified, no change to source `classes2.dex`.
- Actual output `classes3.dex` disassembled with Android SDK dexdump: `withDate()` first calls `CollectionsKt.emptyList()` and the patched `MuteHelperKt.filterByMuteWords`, then runs original date-list conversion. The PR check in `filteredWithMuteWords()` returns `false` for PR items.
- Five specific local tests verify APK identity, full Morphe report, untouched second DEX, modified executable DEX, and source guard.

## NOT verified

**Actual v0.2.1 on-device ad disappearance, login, and all other tabs have NOT been tested.** This release fixes the concrete logic bypass found in 5.80's hot feed; it is not a guarantee of universal ad blocking. Users should refresh the `総合` tab after an in-place update and share a screenshot.

**Security warning:** input v5.80 is an older 2024 third-party-sourced APK. APK signature and cross-site SHA256 comparisons cannot prove malware-free status. The GitHub release distributes only Morphe `.mpp` source/patch binaries, NOT the APK. Keep the working official v5.84 installed; do not disable Play Protect, and do not uninstall any app to troubleshoot before reviewing data backup and signatures.
