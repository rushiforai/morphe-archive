# Blacklist limit (Swift Backup 5.1.0)

The patch raises the shared limit for Hide and APK-only entries to 1,000. REA inspection of the
stock APK identified six enforcement and counter sites:

| Site | Stock behavior | Patched behavior |
| --- | --- | --- |
| `es0.a(BlacklistData)` | Keeps the first 100 entries when loading/saving | Keeps the first 1,000 |
| `nf.onClick(View)` blacklist-screen branch | Allows adding only below 100; reports `(100/100)` | Allows adding below 1,000; reports `(1000/1000)` |
| `pj.invokeSuspend(Object)` app-menu branch | Rejects a new entry at 100 | Rejects a new entry at 1,000 |
| `sr0.onClick(DialogInterface, int, boolean)` | Disables confirmation above 100 and updates selection count | Allows confirmation through 1,000 and updates the count against 1,000 |
| `hj.invoke(Object)` blacklist branch | Toolbar counter uses 100 | Toolbar counter uses 1,000 |
| `ox.invoke(Object)` blacklist branch | Initial selection dialog counter uses 100 | Initial selection dialog counter uses 1,000 |

The patch preserves existing registers and instruction positions, validates exactly one limit constant
per limit method, and resolves every fingerprint before changing instructions. Counter edits follow
the maximum register passed to `Const.p`, preserving unrelated percentage constants in shared lambdas. It does not change
blacklist modes, authentication, or persistence.

## Reinstall recovery

The stock `gs0.d(BlacklistData, boolean)` normalizes the list and writes it through `w14.h` under
the `blacklist_data` preference key. It skips the `blacklistApps` database write for anonymous users.
`gs0.b()` also loads local preferences instead of fetching the database for anonymous users. Therefore
the offline anonymous session used by the premium patch does not gain blacklist recovery merely by
connecting the same Google Drive account again. The metadata journal patch cannot sync writes that
the app never sends to its database.

The app's settings export includes `SwiftBackupSettingsHelper$SettingsData.blacklist`; its `restore()`
method writes that list back through `gs0.d(..., false)`. Export settings before uninstalling, retain
the exported file outside private app storage, and import it after reinstalling. The new limit patch
must be present before importing more than 100 entries or the stock normalizer will truncate them.

## Verification

Compile and apply the patch against the stock 5.1.0 APK with Morphe's `--validate` flag. Inspect the
resulting APK to confirm all six methods use 1,000 and the blacklist-screen message no longer says
100/100. Also apply it together with the existing Swift Backup patches to check composition.

```sh
# Inspect all six DEX sites independently of the patch fingerprints (JDK 17+ and Morphe's runtime jar).
java -cp /path/to/morphe.jar patches/tests/swiftbackup/BlacklistLimitDexTest.java /path/to/patched.apk
```

For the live boundary check, open the blacklist's add dialog, select at least 101 entries, confirm
the counter uses `/ 1000` and **Add apps** remains enabled, then cancel to preserve the saved list.
