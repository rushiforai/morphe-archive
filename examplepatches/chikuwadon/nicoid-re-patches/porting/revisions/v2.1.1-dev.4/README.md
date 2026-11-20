# v2.1.1-dev.4 — private development candidate

## Scope

- Reassess Ambient Mode using the original v2.1.0 compositor, not the unsuccessful v2.1.1-dev.1–3 detail-page overlay hooks
- Sample the original Media3-era ambient video-edge palette at the normal-mode compositor and paint visible pager-panel backgrounds underneath text, icons and thumbnails, irrespective of “Spread across the entire screen” setting
- Retain all existing tab symbols and media-player functionality
- Reuse the existing Mylist tab ID on a normal folder tap, and restore the root tab identity when returning to Mylist
- Add an “Open in new tab” option to the original Mylist folder long-press dialog without removing its delete/cancel actions
- Synchronize local playlist folder names with the tab caption
- Add an “Open in new tab” option to the local playlist folder long-press menu and preserve independent folder state when switching playlist tabs
- Translate added labels in Japanese, English and Chinese
- Preserve previously validated bulk-selection buttons and local playlist destination-then-confirm flow

## Still requires original base APK inspection

The Niconico account Mylist move destination picker, same-folder exclusions, post-destination mutation confirmation, temporary-Mylist as a move destination, and stale list refresh are owned by original APK classes not present in the reviewed v2.1.0 native method-delta. Do not claim those changes are fixed.

## Validation requirements

Private development release only. Keep main and v2.1.0 untouched. CI must reassemble modified native and helper DEX, prove all unrelated canonical Smali classes unchanged, and produce MPP plus source archives. Real-device navigation, ambient image composition, and account move semantics remain unverified.
