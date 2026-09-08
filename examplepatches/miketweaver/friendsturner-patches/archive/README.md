# Archived patches

These are not compiled. The build only picks up `patches/src/main/kotlin`, so nothing here
ships in the bundle. They are kept because they still document how each ad placement works
and are a ready fallback if `Force sponsor state` ever stops being viable.

| file | patch | how it worked |
| --- | --- | --- |
| `BypassInterstitialAd.kt` | Remove ads | Removed the `if-eqz` that sends non-sponsors to the interstitial |
| `HideBannerAdSponsorLayout.kt` | Hide banner ad (ad-free layout) | Forced the `if-nez` that hides the banner for sponsors |
| `HideBannerAd.kt` | Hide banner ad | Replaced the AdView with a plain `android.view.View` |
| `BannerFingerprints.kt` | — | The two fingerprints the banner patches used |

All four were verified working on 5.15 and 5.16 before being archived; the last release
that shipped them is v1.0.8.

They were replaced because they disable one placement at a time. `Force sponsor state`
sets the flag all three of them ultimately depend on, so it covers the same ground in one
patch and also covers placements a future app version may add.

## Restoring one

Move the file back into `patches/src/main/kotlin/com/morphe/friendsturner/patches/`. The
banner patches also need `BannerFingerprints.kt` moved back, and its contents merged into
`Fingerprints.kt` or left as its own file. `BypassInterstitialAd.kt` needs no extra work:
`MainActivityFAdGateFingerprint` is still in the compiled source because
`Force sponsor state` uses it to locate the flag.

Then bump the version, run `generatePatchesList` followed by `buildAndroid` (in that
order, see HANDOVER.md), and verify with the harness before releasing.
