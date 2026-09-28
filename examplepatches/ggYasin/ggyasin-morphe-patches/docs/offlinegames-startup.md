# Offline Games 3.14.1 startup wait analysis

## Report and evidence

The user observed faster loading with Wi-Fi/mobile data off, a smaller pause with
working internet, and a larger pause around 35–40% when a firewall drops the
app's traffic. This does not by itself establish which request is slow.

The verified ARMv7 IL2CPP method-token map identifies
`JungleFrog.Shared.Loader.LoaderView.<LoadCo>d__38.MoveNext` at `0x1285418`.
The loader passes `0x3eb33333` (35%) to `UpdateProgressBar` at `0x12862a0`,
then yields `InitializeFirebaseCo` at `0x1286394`. Its continuation passes
`0x3ecccccd` (40%) at `0x12858d8`. This directly matches the reported stage.

`<InitializeFirebaseCo>d__41.MoveNext` at `0x1284f04`:

1. Creates its callback and starts `FirebaseWrapper.Initialize` at `0x12850e0`.
2. Chooses a deadline of five seconds when Unity's `internetReachability` is zero,
   or ten seconds otherwise, at `0x1285108`–`0x128512c`.
3. Checks initialization failure, Firebase readiness, Remote Config initialization
   and retry state. If pending and before the deadline, it yields another frame.
4. If the deadline expired, it logs and returns `false` (coroutine complete).

Android/Unity can report network reachability even while an app-specific firewall
silently drops the request. That is consistent with waiting out the longer
deadline, but there is no measured on-device timing or network trace yet.

Other explicit waits in the same loader:

- `ApplicationUtil.DetectCountryCode` is started asynchronously at `0x1286264`.
  Later the loader checks its callback result, then waits up to ten seconds if
  the country is still empty. The existing missing-country continuation handles
  an absent response.
- Advertising initialization has an existing parallel/sequential choice at
  `0x1286a24`. Sequential operation yields the ad coroutine; parallel operation
  passes the same enumerator to `MonoBehaviour.StartCoroutine` and continues.
  The ad coroutine itself can wait twelve seconds for initialization, followed by
  a two-second `WaitUntilWithTimeout`.

## Fast Offline Games startup

This opt-in patch changes exactly three ARM instructions:

| Offset | Stock | Patched | Purpose |
|---|---|---|---|
| `0x128526c` | `bge 0x128528c` | `b 0x128528c` | Take the existing Firebase timeout continuation without waiting |
| `0x12859dc` | `beq 0x1285db0` | `b 0x1285db0` | Continue with the currently available country result |
| `0x1286a24` | `beq 0x1286bdc` | `nop` | Use the existing parallel ad initialization branch |

Firebase and country requests have already been started at these sites; their
callbacks remain registered. Initialization, cached/default configuration, local
scene loading, consent checks and permission state are preserved. This does not
pretend services have initialized, fabricate a country/consent result, or disable
internet for the entire game. Background requests may still time out or update
configuration later. Consent dialogs, disk/asset work and other waits can still
take time; the patch does not promise a fixed total launch time.

## Still-open ad behavior report

The user also reported the prior patch did not work. Until its source version,
exported patched APK, and actual loaded native path are available, the cause is
not established. No new ad-function guesses were added for that report.

The shared native-loader extension now runs `verifyLoaded()` **after**
`NativeLoader.load(directory)` succeeds. It reads `/proc/self/maps` and requires
all `libil2cpp.so` mappings to point into the expected content-addressed directory.
A startup toast and `PatchLabOfflineGames` log report either:

- `PatchLab: patched native code loaded`
- `PatchLab: native code NOT verified — export the patched APK and log`

No message means the diagnostic hook itself may not be active (or the toast was
missed); logcat and the exported APK are the next evidence. A positive message
proves the expected file is mapped, **not** that every ad UI path is correct.

## Validation and device comparison

`scripts/verify_offlinegames.py ORIGINAL.apks PATCHED.apk --fast-startup` inspects
the rebuilt APK, verifies the loader manifest/DEX hook and exact native edits,
then uses Unicorn to execute the actual modified ARM branches. It checks all
NZCV flag combinations, the Firebase completion return, and preservation of the
ad enumerator on the parallel dispatch. It also confirms callback functions and
other startup code are byte-identical outside the three approved sites. Engine
calls are stubbed; this is not an on-device timing test.

In Morphe, update the source, select **Fast Offline Games startup**, repatch the
complete ARMv7 APKS/XAPK and replace the mounted output. Force-stop between tests.
Measure after one warm launch (first launch stages native files) in each mode:

1. Wi-Fi/mobile data off.
2. Internet available and app allowed.
3. Internet available and app blocked by the firewall.

Record source version, startup status toast, time from launch to usable menu,
whether 35–40% stalls, and whether Save-me/hints still count down. Capture
`adb logcat -d -s PatchLabOfflineGames:I` and the exported patched APK if the
loading path or ad result remains unchanged. Keep saved-game data; no wipe is
needed for these tests.
