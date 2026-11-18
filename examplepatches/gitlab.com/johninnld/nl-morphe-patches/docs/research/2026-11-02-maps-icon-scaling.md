# Maps custom icon scaling at small host sizes

The v1.35.0 custom launcher resource used a fixed `28dp` InsetDrawable padding.
Android adaptive layers are drawn into bounds chosen by the caller. At small
host bounds, that padding can consume or reverse the foreground bounds, even
though the original artwork is 512×512 pixels. This is a scaling defect, rather
than insufficient image resolution.

The fix uses `25.9259%` (28/108 of the adaptive layer) instead. It preserves the
intended design proportions and scales those proportions with the caller's
bounds. Automatic, Original, artwork files and the selected background colors
are unchanged.

A shell-UID rendering regression loads the icon from an actual patched APK
through PackageManager without installing or launching it. On the API 34
emulator at density 2.625, v1.35.0 failed the visibility assertion at 16, 24, 32
and 48dp; the corrected APK passed at 16, 24, 32, 48, 64, 72 and 96dp.

| Drawable bounds | Released artwork coverage | Corrected coverage |
| --- | --- | --- |
| 24dp | 0.25% | 23.03% |
| 32dp | 0.17% | 23.50% |
| 48dp | 4.77% | 22.80% |
| 72dp | 22.13% | 22.13% |

The test requires a custom dark style and verifies the background before
counting foreground pixels. It rejects light-background inputs rather than
mistaking their background for visible artwork. The full Maps rebuild also
passes APK signature verification and all 8,116 Android reference checks.
These checks reproduce the icon failure and correction on Android; they do not
constitute acceptance on a particular physical Android Auto head unit.
