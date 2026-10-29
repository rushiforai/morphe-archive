# Morphe Manager 2.2.0: Finamp acceptance

**PASS** — the released Penguin 1.1.0 bundle works through the actual Android
Manager UI on the disposable Android 15/API 35 ARM64 emulator. No production
patch or native payload change was needed. This extends the earlier Desktop
and installed-Finamp checks; it does not replace their historical reports.

[Machine-readable verification](manager-verification.json) ·
[unedited PNG hashes](captures.json) · [repeatable workflow](../../README-manager.md)

## Source and independent selection

Penguin was added through **Sources → Add → Remote** using its GitHub URL.
Manager downloaded [Penguin 1.1.0](source-v1.1.0.png); the cached bundle's SHA-256
is exactly the published asset hash. The local MPP copied to Downloads was not
used to add the source. The original official Finamp 1.0.1 universal APK was
selected through Android's file picker and its cached bytes independently
matched the official hash.

All three patches are [off by default](defaults-off.png). Each can be selected
independently: [title](title-only-selected.png),
[artist order](artist-only-selected.png),
[loading](loading-only-selected.png), or [all three](all-three-selected.png).
Unrelated Morphe universal patches stayed at **0/5**.

## Apply, export and native verification

| Actual runtime | Selection | Result |
| --- | --- | --- |
| Embedded JVM, default | Title only | Patched, saved through Android picker, verified |
| Embedded JVM, default | Artist order only | Patched, saved through Android picker, verified |
| Embedded JVM, default | Loading only | Patched, saved through Android picker, verified |
| Embedded JVM, default | All three | [Patched](combined-jvm-success.png), exported and installed |
| Android ART | All three | [Patched](combined-art-success.png), exported and verified |

Each run is backed by a new Manager runtime log, not just a requested setting.
All five exported APKs have the expected native snapshot for their mask. Every
retained entry except ARM64 `libapp.so` matches the official APK. Other native
architectures are removed. All outputs pass signature verification, retain
uncompressed native entries required by `extractNativeLibs=false`, and pass
16 KiB ZIP alignment. Repeated exports may have different whole-APK hashes
because of signing/packaging; the native and retained-entry checks are exact.

## Real install and state retention

The existing disposable PKCS12 key was imported through Manager's signing-key
UI. Its certificate matches the earlier fixture installation. Manager's
Reinstall/Android UPDATE path installed the combined JVM export; the installed
APK's SHA-256 matches that export byte for byte. There was no uninstall or data
clear. The installed output [opens from Manager](finamp-opened-from-manager.png)
with the existing synthetic login. [Metadata order](artist-preference-retained.png)
and [Dark theme](dark-theme-retained.png) remain selected.

No personal server, music, account or key was used. The temporary test key is
excluded from Git and the published evidence.

## Fail-closed and recovery

The rejection check uses a deliberately corrupted **cached test input**, separate
from APK-picker acceptance. Only the original test-APK cache was backed up and
temporarily replaced with a signed fixture whose ARM64 engine differs. Manager
databases/settings/signing keys were not manually edited, and the mutant was
never installed.

The actual ART run [fails visibly](guard-rejected.png), attributes the failure to
selected **Song artist order**, displays the `unsupported ARM64 libflutter.so`
guard and exposes no successful Install/Save result. This checks the selected
finalizer behavior that Manager's hidden-dependency filtering requires. The
cache's original bytes, UID/GID and mode were restored. A subsequent normal ART
run [succeeds again](recovered-art-success.png) with the expected native output.

## Limits

This is the Android Manager running on an emulator, including both actual
execution backends. It is not a physical/OEM-phone test or coverage of other
Android/Manager releases. The three pairwise masks remain covered by Desktop
tests rather than this five-case Manager run. This run checks selection,
application/export, one real update/start and state retention; earlier Finamp
APK acceptance covers title/credit/request behavior. No new live-library timing
or RAM benchmark is claimed.
