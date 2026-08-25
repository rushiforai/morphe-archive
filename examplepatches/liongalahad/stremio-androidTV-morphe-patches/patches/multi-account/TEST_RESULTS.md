# Dynamic multi-account emulator result

Test completed on 2026-08-21 using the `Television_4K_Morphe_POC` AVD.

## Environment

- Stremio Android TV 1.10.4
- Android API 36
- x86_64 ABI
- 3840 x 2160 TV display
- One installed package: `com.stremio.one`
- Final retained profiles: Account A and Account B

## Result

| Check | Result |
| --- | --- |
| Existing authenticated Account A/B survive in-place APK update | Pass |
| Launcher opens remote-friendly chooser | Pass |
| Active account is labelled and receives initial focus | Pass |
| Account buttons are round avatars displaying account initials | Pass |
| Thick avatar outline follows focus only; an unfocused active account keeps the normal thin outline and Active badge | Pass |
| Chooser labels and avatar initials use Stremio's Plus Jakarta Sans fonts | Pass |
| Avatar initials are optically centered | Pass |
| Legacy PRESS OK TO OPEN and SELECTED text is absent | Pass |
| D-pad card navigation and OK selection | Pass |
| Long-press menu exposes Rename, Change color, Add/Remove PIN, and Remove Account | Pass |
| Avatar color selection persists | Pass |
| Color chooser displays eight colored preview swatches | Pass |
| Avatar outline uses a lighter shade of the selected color | Pass |
| Four-digit PIN add and confirmation flow | Pass |
| PIN add, confirmation, access, and management prompts submit automatically on the fourth digit | Pass |
| Incorrect four-digit PIN clears the field and permits an immediate retry | Pass |
| Incorrect PIN blocks protected-account access | Pass |
| Correct PIN permits protected-account access | Pass |
| Remove PIN requires the current PIN and clears PIN metadata | Pass |
| PIN is stored as a salted derived hash, not plaintext | Pass |
| Add account creates a distinct namespace | Pass |
| New profile opens Stremio QR login | Pass |
| Rename dialog is usable with D-pad and TV keyboard | Pass |
| Account names are capped at 12 characters | Pass |
| Enter/Done submits Rename and PIN input and dismisses the TV keyboard | Pass |
| Rename and PIN prompts contain no Cancel/Continue/Save action row | Pass |
| One Back press dismisses an open Rename or PIN prompt and its keyboard | Pass |
| Enter is consumed by the prompt and does not activate the underlying account | Pass |
| Renamed value persists and renders on its card | Pass |
| Remove displays local-only deletion confirmation | Pass |
| Remove clears the profile's core namespace | Pass |
| Remove clears profile metadata | Pass |
| Android/default preferences use one file per account | Pass |
| Inactive removal deletes the account's Android/default preference file | Pass |
| Active removal terminates the outgoing MainActivity before changing the active slot | Pass |
| Active removal clears core, Android preferences, chooser metadata, PIN material, and slot references | Pass |
| Active removal returns to the chooser without launching a fallback account | Pass |
| PIN-protected fallback still requests its PIN after active-account removal | Pass |
| Files, cache, databases, no-backup and non-control preferences rotate into permanent per-account containers | Pass |
| Internal storage rotation uses same-filesystem renames rather than recursive cache deletion | Pass (3-48 ms storage phase) |
| Native streaming-server directory and configuration restore independently per account | Pass (byte-identical SHA-256 restoration) |
| Removed account's complete internal/external container and legacy server seed are deleted | Pass |
| Runtime services are stopped and a final process check runs before destination commit | Pass |
| Outgoing notifications and scheduled jobs are cancelled on account boundaries | Pass |
| Android TV preview programs and channels are removed on account boundaries | Pass (32 preview programs and 3 channels in the migration run) |
| SDK databases, session files, WorkManager state and non-account preference stores rotate with their account | Pass |
| Legacy live auxiliary storage is adopted by the active account during the v2 container migration | Pass |
| Account destination is committed only after stale processes terminate and the storage transaction succeeds | Pass |
| Failed storage moves have a reverse-order transaction rollback path | Pass (static and build verification) |
| Direct ADB/broadcast slot mutation is rejected | Pass |
| Core-error recovery targets only the active core namespace and active Android preferences | Pass (static and build verification) |
| Android backup/restore is disabled | Pass |
| Five local profiles can coexist | Pass |
| Add is disabled at the five-profile limit | Pass |
| Left navigation renders the round active-account avatar above Search | Pass |
| Collapsed account avatar is 32dp and centered on the native menu icon axis | Pass |
| Expanded account label matches the native 13sp Plus Jakarta Sans weight and text column | Pass |
| Account and native menu focus targets have identical 145 x 48dp bounds and 20dp left inset | Pass |
| Account and native menu selectors have identical 45dp painted height inside their focus targets | Pass |
| Left-navigation label uses the active account name instead of “Accounts” | Pass |
| Active account name remains visible while any native side-menu item has focus | Pass |
| Account row matches the native expanded-menu background, selection, and typography | Pass |
| Account-through-Settings sidebar stack is vertically centered (1079px midpoint on a 2160px display) | Pass |
| Stremio logo remains fixed with additional separation above the account row | Pass |
| D-pad Up moves from Search to Accounts | Pass |
| D-pad Down moves from Accounts back to Search | Pass |
| D-pad Right from Accounts enters the currently open Home or Addons content instead of moving to Search | Pass |
| Account row is non-focusable while content owns focus, so content-side Left cannot jump to Accounts | Pass |
| Native Right from highlighted Search or Settings returns to the already-open screen without activating the highlighted destination | Pass |
| Left from returned content restores the same highlighted native row (Search or Settings) | Pass |
| Six repeated Accounts/Content/rail transitions and six repeated Accounts/Search transitions retain consistent focus | Pass |
| OK on the active-account avatar opens the chooser | Pass |
| Selecting the active account returns to MainActivity without a reload (489 ms in the final run) | Pass |
| Active-account return retains the same MainActivity process PID | Pass |
| Exit Stremio returns to Android TV Home | Pass |
| Exit leaves no Stremio process running | Pass |
| Account A login profile survives repeated A/B switching | Pass |
| Account A library survives repeated A/B switching | Pass |
| Account B login profile survives repeated A/B switching | Pass |
| Account B authentication profile is byte-identical after B/empty-account/B container rotation | Pass (SHA-256 comparison) |
| Account B native server settings are byte-identical after B/empty-account/B container rotation | Pass (SHA-256 comparison) |
| New empty account receives no authenticated profile from Account B | Pass |
| Active temporary-account removal restores the fallback container before deletion | Pass |
| First migrated A-to-B storage boundary | Pass (99 ms; Home resumed in 2.27 s) |
| Repeated account storage boundaries | Pass (45-244 ms; Home resumed in 2.11-2.53 s) |
| Temporary capacity-test profiles removed successfully | Pass |
| Final profile count is two | Pass |
| Fatal exceptions during the final workflow | 0 |

## Session-persistence regression retest

Retested on 2026-08-21 after moving the active-account control marker out of
Stremio's cross-process `core.xml` preference cache.

| Check | Result |
| --- | --- |
| Main-process core key created after chooser startup survives switching | Pass |
| Six consecutive focus-driven A/B switches preserve the core sentinel | Pass |
| Active account survives force-stop and launcher restart | Pass |
| In-place final APK update retains exactly Account A and Account B | Pass |
| Home navigation renders the stored Account A label | Pass |
| Home navigation renders the stored Account B label | Pass |
| Temporary regression profiles and sentinel removed after testing | Pass |
| Clean x86_64 and `armeabi-v7a` rebuilds pass v2/v3 signature verification | Pass |

The authenticated first-login name refresh is implemented as a bounded Home-view
poll that stops once Stremio writes the profile identity or a manual profile name
exists. Final acceptance of that path requires a fresh interactive login because
the test report deliberately does not synthesize or replace real authentication data.

## TV performance and first-run regression retest

Retested on 2026-08-21 with a clean API 36 TV emulator and the existing two-account
emulator installation.

| Check | Result |
| --- | --- |
| Clean install shows only a focused Add account button | Pass |
| Clean install contains no provisional Account A/B profiles | Pass |
| First Add creates only `profile_1` and opens QR login | Pass |
| Account row is absent on QR login | Pass |
| Account row is absent after navigation to the player route | Pass |
| Existing Account A/B profiles survive the production APK update | Pass |
| Temporary performance-test profile removed | Pass |
| Production manifest is non-debuggable | Pass |
| Per-core-key debug logging removed | Pass |
| Dedicated active core preference file selected once during dependency injection | Pass |
| Fatal exceptions during login/player/performance workflow | 0 |

No profile contents, credentials, tokens, email addresses, or account values are included in this report. Integrity comparisons used SHA-256 digests calculated without printing the protected values.

## Core hot-path and navigation regression retest

Retested on 2026-08-22 using the existing two-account API 36 emulator and a
separate clean API 36 Android TV emulator.

| Check | Result |
| --- | --- |
| Existing Account A/B profiles survive an in-place update from prefixed core keys to dedicated core files | Pass |
| Existing Account A authentication and distinct Home content survive the migration | Pass |
| Existing Account B authentication and distinct Home content survive the migration | Pass |
| Account A-to-B and Account B-to-A switching does not request QR login | Pass |
| Migrated values are verified before the one-time migration marker is committed | Pass (static and runtime verification) |
| Stremio `CoreStorage.smali` is byte-identical to the supported original after patch application | Pass (SHA-256 comparison) |
| Repeated destination, native-menu focus, and account-focus callbacks are coalesced | Pass (static and runtime verification) |
| Clean install initially contains only Add account | Pass |
| Add account opens QR login with no persistent account avatar | Pass |
| Interrupting the pending first login does not leave a provisional account card | Pass |
| Production manifest remains non-debuggable | Pass |
| Fatal exceptions during migration, account switching, and clean first-run checks | 0 |

The same 48-key Settings traversal was sampled twice before and twice after the
hot-path change on the 4K x86_64 emulator. Median frame time moved from about
142 ms to 138 ms, missed-vsync frames from 56 to 50, and slow-UI-thread frames
from 66 to 63 on average. The emulator remained heavily software-rendering-bound,
so these figures show only a modest directional improvement and are not a proxy
for Google TV hardware acceptance.

## Provisional-account lifecycle regression

Retested on 2026-08-22 with the signed x86_64 production build on the 4K
two-account emulator and the separate clean Android TV emulator.

| Check | Result |
| --- | --- |
| Add account opens Stremio's QR login from the existing Account A/B installation | Pass |
| Back on the QR page returns directly to the account chooser | Pass |
| Back removes the incomplete account card and restores exactly Account A/B | Pass |
| Previously active Account A storage is restored after cancelling the added account | Pass |
| Account A remains authenticated and its Home/library content loads after restoration | Pass |
| Clean install starts with only Add account | Pass |
| Back from the first QR login returns to a chooser containing only Add account | Pass |
| Reopening the chooser during an incomplete first login also removes the provisional account | Pass |
| Provisional cleanup deletes the slot's core, Android preferences, storage container, metadata, PIN/color/name fields, and active marker | Pass (static transaction review and runtime boundary verification) |
| Authentication promotion requires Stremio's stored `profile.auth.user` object | Pass (static verification against the existing authenticated-profile parser) |
| Existing-account cancellation produced fatal exceptions | 0 |
| Clean-install cancellation and relaunch cleanup produced fatal exceptions | 0 |

## Dynamic account-name fitting regression

Retested on 2026-08-22 with the signed x86_64 production build on the 4K
two-account Android TV emulator.

| Check | Result |
| --- | --- |
| Rename accepts and persists a 12-character account name | Pass |
| Rename rejects names longer than 12 characters through the input filter | Pass |
| Picker label reduces from 17sp toward 10sp to retain a fitting 12-character name | Pass |
| Side-menu label reduces from 13sp to 10sp, then end-ellipsizes when still too wide | Pass |
| Worst-case wide 12-character name remains inside both assigned label regions | Pass |
| Full stored name remains unchanged when the displayed side-menu name is ellipsized | Pass |
| Account accessibility description retains the complete stored name | Pass |
| Short account name restores the normal default label sizing | Pass |
| Test account name restored after boundary testing | Pass |
| Fatal exceptions during rename, picker, and side-menu checks | 0 |

## Production timing removal regression

Retested on 2026-08-22 with the signed x86_64 composed build on the existing
two-account Android TV emulator.

| Check | Result |
| --- | --- |
| Switch, boundary, and startup timing preference writes removed | Pass (static verification) |
| Switch timing log messages removed | Pass (static verification) |
| Delayed destination-ready timing callback removed | Pass (static verification) |
| Chooser shows the normal hold-for-options instruction instead of timing data | Pass |
| Existing Account A/B accounts survive the in-place update | Pass |
| Account A-to-B account switch completes and Account B MainActivity becomes active | Pass |
| Account B-to-A restoration completes and Account A MainActivity becomes active | Pass |
| Fatal exceptions during installation and both switches | 0 |

## Conclusion

One Stremio Android TV installation now retains multiple complete authenticated accounts and provides an on-device lifecycle for selecting, adding, renaming, recoloring, PIN-protecting, and removing them. Core state, Android/default preferences, caches, databases, WorkManager/SDK files and native streaming-server storage are retained separately per account. Switching terminates the outgoing runtime, transactionally rotates the destination container into place, then launches the destination. Removing either an inactive or active account deletes all of its logical app-private stores, while selecting the already-active account still returns immediately without a process restart.

## Active-account localization regression

Retested on 2026-08-22 with the Morphe-native x86_64 build on the existing two-account 4K Android TV emulator.

| Check | Result |
| --- | --- |
| Active account interface locale is read from its isolated Stremio profile | Pass (`it-IT` for Account A, `en-US` for Account B) |
| Italian account renders title, privacy copy, Add account, Active, picker hint, and exit action in Italian | Pass |
| Italian long-press options render Rename, Change color, Add PIN, and Remove account in Italian | Pass |
| Italian PIN prompt renders localized title/instructions and retains the buttonless four-digit flow | Pass |
| Switching from Account A to Account B changes the next chooser opening from Italian to English | Pass |
| Switching from Account B back to Account A restores Italian on the next chooser opening | Pass |
| Bundled picker-copy table contains every declared selectable locale and all seven visible picker fields | Pass (51 of 51, runtime validation) |
| Bundled action table contains Rename, Change color, Add/Remove PIN, Remove account, and Enter PIN for every selectable locale | Pass (51 of 51, runtime validation) |
| German renders localized title, privacy copy, Add account, Active, picker hint, and exit action | Pass |
| French renders localized title, privacy copy, Add account, Active, picker hint, and exit action | Pass |
| Indonesian renders localized title, privacy copy, Add account, Active, picker hint, and exit action | Pass |
| Japanese renders localized title, privacy copy, Add account, Active, picker hint, and exit action | Pass |
| Arabic renders connected RTL script without clipping and localizes all seven visible picker fields | Pass |
| Arabic long-press menu renders all account actions in Arabic with no English fallback | Pass |
| Stremio's general translation catalogue and required dialog getters remain available for every selectable locale | Pass (runtime catalogue validation) |
| Existing Account A/B account state survives the in-place update and two language-boundary switches | Pass |
| Fatal Android runtime exceptions during localization checks | 0 |

## Morphe Manager bundle regression

Retested on 2026-08-22 with the native `.mpp` bundle applied by Morphe Desktop 1.12.0 to the registered Stremio 1.10.4 x86_64 APK, then installed over the existing API 36 4K TV-emulator build.

| Check | Result |
| --- | --- |
| Manager lists Multi-account as compatible with the official package, certificate, version, and x86_64 version code | Pass |
| Exact bytecode fingerprints and both resource transforms apply once | Pass |
| Shared `extensions/stremio.mpe` runtime compiles and is injected | Pass |
| Existing Account A/B metadata survives the in-place update | Pass |
| Chooser launches and retains active-account color, name, and status | Pass |
| Selecting the active account launches MainActivity and Home | Pass |
| Patched account control renders in the Stremio side menu | Pass |
| Fatal Android runtime exceptions after chooser and Home launch | 0 |
