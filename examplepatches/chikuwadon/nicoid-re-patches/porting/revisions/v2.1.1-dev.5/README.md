# nicoid Re v2.1.1-dev.5 — private device-validation candidate

## Changes

- Ambient: return to the reviewed v2.1.0 exterior compositor and avoid layered glow on transparent descendants. Add a single subtle sampled video-edge glow to each page root and dark opaque card, below text, thumbnails and buttons, irrespective of the independent full-screen spread toggle
- Mylist Back: pressing Back from a folder opened inside the existing Mylist tab navigates back to the Mylist root with the tab's identity restored instead of exiting the app. Both Back gesture and key events use the same fallback
- Mylist long-press: display the themed action list (Rename / Open in new tab / Delete) first. Delete still displays the original confirmation. Remove the misplaced neutral button
- Local playlist long-press: add Open in new tab as an ordinary final item alongside Rename / Move / Delete, keeping the original menu behavior
- Native account Mylist/Watch Later bulk move: intercept the original i2 destination-picker entry point; filter the source folder, add Watch Later as a destination where appropriate, and ask for final confirmation **after** destination selection. Reuse original i2$c listener and k2 network handler, do not create a separate remote mutation implementation
- New text is available in Japanese, English and Chinese

## Cautions

- API-backed Mylist Rename and Watch Later as move destination remain unverified on a real device and require particular care; validate using a disposable test folder/video first
- Source list refresh and folder navigation require real-device tests before acceptance
- Do not publish. Keep released v2.1.0 / main unchanged, and do not comment/close Issues

## Regression conditions

The release-staging script must verify the reviewed v2.1.0 source checksum, all 7,434 canonical helper classes, 159 native delta classes, all new narrow hooks, the DEX integrity, and that all non-affected classes are byte-for-byte identical with the v2.1.0 baseline. GitHub CI creates MPP and source ZIP/tar.gz for device testing.