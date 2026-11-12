## [1.20.0](https://github.com/amfakh/fakh-patches/compare/v1.19.1...v1.20.0) (2026-11-12)

### New Features

* **CoverScreen OS:** add Disable analytics, which turns off Firebase Analytics, Crashlytics, Performance and Sessions, stops the GIF keyboard from sending your advertising ID, device model, carrier and screen size with its ad requests, and removes the ad ID and ad services permissions ([6b940fb](https://github.com/amfakh/fakh-patches/commit/6b940fb9a5426fe85b2e37df46ed62861ed85bb5))

## [1.19.1](https://github.com/amfakh/fakh-patches/compare/v1.19.0...v1.19.1) (2026-11-12)

### Bug Fixes

* **CoverScreen OS:** the cover screen no longer crashes when it opens, and its first-run setup finishes instead of ending in "Setup took too long" ([a061c6e](https://github.com/amfakh/fakh-patches/commit/a061c6e564d308284eb543efb48f9de6c6359d2e))

## [1.19.0](https://github.com/amfakh/fakh-patches/compare/v1.18.1...v1.19.0) (2026-11-12)

### New Features

* **CoverScreen OS:** add Premium unlock, which turns on Pro with every premium feature, no ads and no payment screen, and keeps the trial from expiring, for `CSOS_9.0.1_BETA` ([e926491](https://github.com/amfakh/fakh-patches/commit/e9264913978d29af0489eafc529d10a4409a39c4))

## [1.18.1](https://github.com/amfakh/fakh-patches/compare/v1.18.0...v1.18.1) (2026-11-11)

### Performance Improvements

* **LinkedIn, GitHub, IDN, Smart Life, Tuya Smart, BARDI Smart Home, KOMPAS.com:** patching takes up to 3 times less time, and the patched app comes out the same as before ([c130002](https://github.com/amfakh/fakh-patches/commit/c1300022e1647863a3c5ee7b3a61f3f8e342906f))
* **Jira:** adding the Fakh Patches rows to Settings no longer reads the code of every class, so patching is faster ([c130002](https://github.com/amfakh/fakh-patches/commit/c1300022e1647863a3c5ee7b3a61f3f8e342906f))

## [1.18.0](https://github.com/amfakh/fakh-patches/compare/v1.17.2...v1.18.0) (2026-11-11)

### New Features

* **LinkedIn:** the glass navigation bar's pill covers the whole tab, icon and label, a little wider than the tab with a thin rim of the capsule all around ([40840e4](https://github.com/amfakh/fakh-patches/commit/40840e4d585e51e7584606a723dbda1dca857d26))
* **Jira:** the glass navigation bar's pill covers the whole tab, icon and label, a little wider than the tab with a thin rim of the capsule all around ([40840e4](https://github.com/amfakh/fakh-patches/commit/40840e4d585e51e7584606a723dbda1dca857d26))
* **GitHub:** the glass navigation bar's pill covers the whole tab, icon and label, a little wider than the tab with a thin rim of the capsule all around ([40840e4](https://github.com/amfakh/fakh-patches/commit/40840e4d585e51e7584606a723dbda1dca857d26))
* **Jira:** the glass navigation bar is 56dp tall, with the labels closer to their icons ([40840e4](https://github.com/amfakh/fakh-patches/commit/40840e4d585e51e7584606a723dbda1dca857d26))
* **GitHub:** the glass navigation bar is 56dp tall, with the labels closer to their icons ([40840e4](https://github.com/amfakh/fakh-patches/commit/40840e4d585e51e7584606a723dbda1dca857d26))
* **LinkedIn:** pressing a tab of the glass navigation bar shows no ripple, as the pill already marks it ([457b72e](https://github.com/amfakh/fakh-patches/commit/457b72e6be3944d28391df231d8df0bfbc28987b))
* **Jira:** pressing a tab of the glass navigation bar shows no ripple, as the pill already marks it ([457b72e](https://github.com/amfakh/fakh-patches/commit/457b72e6be3944d28391df231d8df0bfbc28987b))
* **GitHub:** pressing a tab of the glass navigation bar shows no ripple, as the pill already marks it ([457b72e](https://github.com/amfakh/fakh-patches/commit/457b72e6be3944d28391df231d8df0bfbc28987b))

### Bug Fixes

* **LinkedIn:** the glass navigation bar's pill runs a little past the new tab and swells as it moves, instead of stopping short ([f96a28f](https://github.com/amfakh/fakh-patches/commit/f96a28ff3bdd6b901df28b07225c38040fd67e02))
* **Jira:** the glass navigation bar's pill runs a little past the new tab and swells as it moves, instead of stopping short ([f96a28f](https://github.com/amfakh/fakh-patches/commit/f96a28ff3bdd6b901df28b07225c38040fd67e02))
* **GitHub:** the glass navigation bar's pill runs a little past the new tab and swells as it moves, instead of stopping short ([f96a28f](https://github.com/amfakh/fakh-patches/commit/f96a28ff3bdd6b901df28b07225c38040fd67e02))

## [1.17.2](https://github.com/amfakh/fakh-patches/compare/v1.17.1...v1.17.2) (2026-11-11)

### New Features

* **LinkedIn:** add Always show navigation bar, a switch in Fakh Patches (off by default) that keeps the navigation bar on screen while you scroll instead of sliding it away ([965abd4](https://github.com/amfakh/fakh-patches/commit/965abd429c05c592ba9b8c883be77336af29424c))

## [1.17.1](https://github.com/amfakh/fakh-patches/compare/v1.17.0...v1.17.1) (2026-11-11)

### New Features

* **LinkedIn, Jira, GitHub:** the glass navigation bar turns solid when Reduce transparency and blur or High contrast fonts is on in the phone's accessibility settings ([a611962](https://github.com/amfakh/fakh-patches/commit/a61196277cd8a7f2cd33ee7ad742442619a59292))
* **LinkedIn, Jira, GitHub:** with Liquid Glass, the pill stays clear in the middle and bends what's behind it at its edges, like a curved piece of glass ([d9f5be5](https://github.com/amfakh/fakh-patches/commit/d9f5be509a0387e900d0676bbb2e8be5be97350a))

## [1.17.0](https://github.com/amfakh/fakh-patches/compare/v1.16.0...v1.17.0) (2026-11-10)

### New Features

* **LinkedIn, Jira, GitHub:** slide a finger along the glass navigation bar to move the pill across the tabs, with a haptic tick for each tab, and let go to open the tab under it ([9ac9f4c](https://github.com/amfakh/fakh-patches/commit/9ac9f4c18b5a16121817e62fa92a48aad2624a9e))
* **LinkedIn, Jira, GitHub:** the selection pill springs to the new tab and swells a little as it moves ([9ac9f4c](https://github.com/amfakh/fakh-patches/commit/9ac9f4c18b5a16121817e62fa92a48aad2624a9e))
* **LinkedIn, Jira, GitHub:** a Liquid Glass switch, on by default, blurs what's behind the glass navigation bar and bends it at the edges (Android 12 and newer), with a raised pill and a white rim ([47b7312](https://github.com/amfakh/fakh-patches/commit/47b73120ba3cdaa4275ed4d0069b48424ec3d62a))
* **GitHub:** the glass navigation bar's pill takes your accent color and the tab labels follow the icons, accent on the selected tab and gray on the others ([47b7312](https://github.com/amfakh/fakh-patches/commit/47b73120ba3cdaa4275ed4d0069b48424ec3d62a))
* **LinkedIn, Jira, GitHub:** without Material You the glass navigation bar's pill is neutral gray instead of following the wallpaper ([ecd6f16](https://github.com/amfakh/fakh-patches/commit/ecd6f165eac3c07c05184ce5dbd043d3dd9e5c75))

### Bug Fixes

* **GitHub:** stop the glass navigation bar crashing the app on screens with images, such as Explore ([bbf835f](https://github.com/amfakh/fakh-patches/commit/bbf835f422adfc7cb39374e619a95c6a042335f0))
* **GitHub:** the glass navigation bar and the landscape navigation bar position work without the Material You patch ([aafb6ec](https://github.com/amfakh/fakh-patches/commit/aafb6ec78a793201be3020e25eee66a1cac6b89f))

## [1.16.0](https://github.com/amfakh/fakh-patches/compare/v1.15.4...v1.16.0) (2026-11-09)

### New Features

* **Jira:** support `2026.21.2` with Material You, Hide Rovo button, Glass navigation bar and Disable Play license check ([fa1aff6](https://github.com/amfakh/fakh-patches/commit/fa1aff6212595fbf34958fd26970532a58d38427))
* **Jira:** choose which navigation bar tabs show, in a bottom sheet with Home always on ([0f59398](https://github.com/amfakh/fakh-patches/commit/0f593982039653a0e46b850ace8d8d8c0a9142b8))
* **LinkedIn:** choose which navigation bar tabs and More tab items show, in a bottom sheet with Home always on ([1ab3716](https://github.com/amfakh/fakh-patches/commit/1ab3716f8149db22949ca9868a1c16091b1618b4), [df8c588](https://github.com/amfakh/fakh-patches/commit/df8c588957ebb0078544cb2a69649a1dd030e7c0))
* **GitHub:** choose which navigation bar tabs show and where the landscape navigation bar sits, in the app's own choice sheets ([94f4d4a](https://github.com/amfakh/fakh-patches/commit/94f4d4a342faba2c828fd7c2d443c540caa8ca9a))
* **GitHub, LinkedIn:** the glass navigation bar has a sliding selection pill in your accent color, shrinks to fit its tabs and can hide tab labels ([fb1345f](https://github.com/amfakh/fakh-patches/commit/fb1345ffab9b64f9b63546c8134cae5b2de68ae5))
* **Kompas, DoDo, LinkedIn, Smart Life:** a message tells you when "Sign in with Google" needs microG RE and it is not installed ([044ee0d](https://github.com/amfakh/fakh-patches/commit/044ee0dd114087b95510e1159bef7b5b255028e7))
* **Jira, GitHub:** the text added by Fakh Patches follows your device language ([5aba699](https://github.com/amfakh/fakh-patches/commit/5aba6990c0a5911c2a93ddb2e5668ae95c0c846d))
* **LinkedIn:** the settings are translated in every language ([856f26b](https://github.com/amfakh/fakh-patches/commit/856f26bce86793b7ac572c84074d36dd478813b4))

### Bug Fixes

* **DoDo, Smart Life:** Disable analytics also turns off Firebase Performance ([1a61bf5](https://github.com/amfakh/fakh-patches/commit/1a61bf5e127f9b592641df1148f3d9d39b1ab530))
* rename patches for consistent wording, so select them again in Manager: Windy `Unlock Premium` to `Premium unlock`, LinkedIn `Block tracking` to `Disable analytics`, LinkedIn `Remove gaps and dividers` to `Hide gaps and dividers`, GitHub `Navigation bar on the right` to `Landscape navigation bar position` ([e51d625](https://github.com/amfakh/fakh-patches/commit/e51d6253dd0c625cd056e87a29972d4da8751680))
* **GitHub:** rename the switches `Hide navigation bar labels` to `Hide tab labels` and `Pitch black in dark mode` to `Pitch black` ([e51d625](https://github.com/amfakh/fakh-patches/commit/e51d6253dd0c625cd056e87a29972d4da8751680))
* **GitHub, Jira:** the restart notice reads "Restart <app> to apply the change" ([f596053](https://github.com/amfakh/fakh-patches/commit/f596053db99207703610fcb71201b82d9674fe63))

## [1.15.4](https://github.com/amfakh/fakh-patches/compare/v1.15.3...v1.15.4) (2026-11-09)

### Updated App Support

* **Smart Life:** add support for `7.12.6`, next to `7.12.3` ([7c54ade](https://github.com/amfakh/fakh-patches/commit/7c54ade4def91916090cc68033f4b5da26e60986))

## [1.15.3](https://github.com/amfakh/fakh-patches/compare/v1.15.2...v1.15.3) (2026-11-08)

### Bug Fixes

* **LinkedIn:** swiping between tabs keeps working after you come back from another screen, such as messages or a profile ([538edd4](https://github.com/amfakh/fakh-patches/commit/538edd4c416f240d0f8d96a9a045d515021eb8ff))

## [1.15.2](https://github.com/amfakh/fakh-patches/compare/v1.15.1...v1.15.2) (2026-11-08)

### Bug Fixes

* **GitHub:** keep buttons pinned to the bottom of a screen, such as Comment and Finish your review, above the glass navigation bar instead of behind it ([1485679](https://github.com/amfakh/fakh-patches/commit/14856799a8b116b3328147ff2d4b4eed60c34a6b))
* **GitHub:** keep the neutral lines and line numbers of a diff dark in dark mode with Material You, instead of white ([1485679](https://github.com/amfakh/fakh-patches/commit/14856799a8b116b3328147ff2d4b4eed60c34a6b))

## [1.15.1](https://github.com/amfakh/fakh-patches/compare/v1.15.0...v1.15.1) (2026-11-07)

### New Features

* **LinkedIn:** complete the French translation of the settings, by [foXaCe](https://github.com/foXaCe) ([019b79e](https://github.com/amfakh/fakh-patches/commit/019b79eda4a0c5c5fb531a72b230300c5610d421))

## [1.15.0](https://github.com/amfakh/fakh-patches/compare/v1.14.2...v1.15.0) (2026-11-07)

### New Features

* **GitHub:** add Navigation bar, a switch in Settings that hides the text under the icons of the navigation bar ([25eca88](https://github.com/amfakh/fakh-patches/commit/25eca88b82e0098b00bc3801ffd8561b77f14e42))
* **GitHub:** add Glass navigation bar, a switch that draws the bottom bar as a floating, translucent capsule the screen scrolls behind, and the side bar in landscape as a small upright capsule ([25eca88](https://github.com/amfakh/fakh-patches/commit/25eca88b82e0098b00bc3801ffd8561b77f14e42))
* **GitHub:** add Navigation bar on the right, a switch that moves the landscape navigation bar from the left edge to the right one ([25eca88](https://github.com/amfakh/fakh-patches/commit/25eca88b82e0098b00bc3801ffd8561b77f14e42))

## [1.14.2](https://github.com/amfakh/fakh-patches/compare/v1.14.1...v1.14.2) (2026-11-07)

### Bug Fixes

* sign the patch bundle again, so Morphe Manager accepts the update instead of refusing the unsigned 1.14.0 and 1.14.1 builds ([d924861](https://github.com/amfakh/fakh-patches/commit/d9248617152a09c44683e7d305c256901b5bcac0))

## [1.14.1](https://github.com/amfakh/fakh-patches/compare/v1.14.0...v1.14.1) (2026-11-07)

### Updated App Support

* **GitHub:** add support for `1.282.0`, next to `1.283.0` ([dfbada2](https://github.com/amfakh/fakh-patches/commit/dfbada221783d8d3aaa4226abe38e1e6bfc21f54))

## [1.14.0](https://github.com/amfakh/fakh-patches/compare/v1.13.2...v1.14.0) (2026-11-07)

### New Features

* **LinkedIn:** add Swipe between tabs, so swiping sideways goes to the next or previous tab of the navigation bar with a slide animation, except where something under the finger can scroll sideways ([9b7318e](https://github.com/amfakh/fakh-patches/commit/9b7318eec082eb8ea591b720b180e476ddf6ba08))
* **LinkedIn:** add Copy text, which opens a post, comment or any other text in a sheet where it can be selected and copied when you press and hold it ([9b7318e](https://github.com/amfakh/fakh-patches/commit/9b7318eec082eb8ea591b720b180e476ddf6ba08))
* **LinkedIn:** add Anonymous profile viewing, a switch that stops the app from reporting your visits to profiles ([9b7318e](https://github.com/amfakh/fakh-patches/commit/9b7318eec082eb8ea591b720b180e476ddf6ba08))
* **LinkedIn:** the download button of Download media looks like the app's own download button of a document, sits level with the back button and hides with the viewer's controls when you tap the screen ([9b7318e](https://github.com/amfakh/fakh-patches/commit/9b7318eec082eb8ea591b720b180e476ddf6ba08))

### Bug Fixes

* **LinkedIn:** the Glass navigation bar is visible in light mode, and its active tab now has an animated background ([9b7318e](https://github.com/amfakh/fakh-patches/commit/9b7318eec082eb8ea591b720b180e476ddf6ba08))
* **LinkedIn:** the header and navigation bar go back to the normal dark gray when Pitch black is turned off ([9b7318e](https://github.com/amfakh/fakh-patches/commit/9b7318eec082eb8ea591b720b180e476ddf6ba08))

### Updated App Support

* **LinkedIn:** add support for `4.1.1270` ([9b7318e](https://github.com/amfakh/fakh-patches/commit/9b7318eec082eb8ea591b720b180e476ddf6ba08))
* **GitHub:** add support for `1.283.0` ([c9e5875](https://github.com/amfakh/fakh-patches/commit/c9e587539b263cf663374f748a4b86e15a1f0457))

## [1.13.2](https://github.com/amfakh/fakh-patches/compare/v1.13.1...v1.13.2) (2026-11-06)

### Bug Fixes

* **Smart Life, Tuya Smart & BARDI:** keep the signature fix working on devices that block the hidden-API exemption, where the app could still close after opening with "Invalid client" ([b559baf](https://github.com/amfakh/fakh-patches/commit/b559bafeec270c5534f36fd131e94da37391dd97))

## [1.13.1](https://github.com/amfakh/fakh-patches/compare/v1.13.0...v1.13.1) (2026-11-06)

### Bug Fixes

* **LinkedIn:** rename Glass bottom bar to Glass navigation bar, and use "navigation bar" in the wording of the Navigation bar options ([ede16cb](https://github.com/amfakh/fakh-patches/commit/ede16cbc03948e55ec1f218c8061aafb3e29c031))

## [1.13.0](https://github.com/amfakh/fakh-patches/compare/v1.12.0...v1.13.0) (2026-11-06)

### New Features

* **LinkedIn:** add Glass bottom bar, which draws the bottom bar as a floating translucent capsule ([680e757](https://github.com/amfakh/fakh-patches/commit/680e75742042dd80548db0718404b28cd88838aa))
* **LinkedIn:** add Navigation bar, with switches to show or hide the Jobs, Network, Notifications and More tabs, the notification badges and the tab labels ([680e757](https://github.com/amfakh/fakh-patches/commit/680e75742042dd80548db0718404b28cd88838aa))
* **LinkedIn:** add Pitch black, which turns the gray backgrounds of dark mode into black, with or without Material You ([680e757](https://github.com/amfakh/fakh-patches/commit/680e75742042dd80548db0718404b28cd88838aa))
* **LinkedIn:** the More tab items can also be listed in the profile menu while the tab stays, and the Puzzle games shortcut has its own Shortcuts section ([680e757](https://github.com/amfakh/fakh-patches/commit/680e75742042dd80548db0718404b28cd88838aa))

## [1.12.0](https://github.com/amfakh/fakh-patches/compare/v1.11.6...v1.12.0) (2026-11-06)

### New Features

* **FlipSide:** add Premium unlock for version 1.6, which unlocks every locked feature with no trial limit ([f109f3b](https://github.com/amfakh/fakh-patches/commit/f109f3b37f85a0c31031d2a4bc1bd032b96a2cdc))

### Bug Fixes

* **Smart Life, Tuya Smart, BARDI:** log why the app closes after opening, to help track down the integrity error some phones still get ([b6dd5de](https://github.com/amfakh/fakh-patches/commit/b6dd5de0326f69362856077fd9ddafe6baa8f83d))

### Updated App Support

* **DoDo Music:** add support for `2.0.17` ([be80325](https://github.com/amfakh/fakh-patches/commit/be803250f2675d52842a30b61f140b6de78299d6))

## [1.11.6](https://github.com/amfakh/fakh-patches/compare/v1.11.5...v1.11.6) (2026-11-05)

### Bug Fixes

* **Smart Life, Tuya Smart, BARDI:** the app no longer closes a few seconds after opening when its integrity check still rejects the patched signature ([8b802cb](https://github.com/amfakh/fakh-patches/commit/8b802cb948a0b38b616f43812281212696dff7cc))

## [1.11.5](https://github.com/amfakh/fakh-patches/compare/v1.11.4...v1.11.5) (2026-11-05)

### Updated App Support

* **Tuya Smart:** add support for `7.12.6-872` ([0424bc5](https://github.com/amfakh/fakh-patches/commit/0424bc5688ceeef01f5bfb6fa8674d71354a4826))

## [1.11.4](https://github.com/amfakh/fakh-patches/compare/v1.11.3...v1.11.4) (2026-11-05)

### Bug Fixes

* **LinkedIn:** Material You now recolors the red message badge in the top bar ([d9149f3](https://github.com/amfakh/fakh-patches/commit/d9149f30355559dffadd005ffbda0c3de61a96a7))

## [1.11.3](https://github.com/amfakh/fakh-patches/compare/v1.11.2...v1.11.3) (2026-11-05)

### Bug Fixes

* **LinkedIn:** Expand posts now shows posts expanded by default, and tapping the text collapses them again ([c10d2cc](https://github.com/amfakh/fakh-patches/commit/c10d2ccaba74c8b6f67b9e3eb6062f2e94dbe58e))

## [1.11.2](https://github.com/amfakh/fakh-patches/compare/v1.11.1...v1.11.2) (2026-11-04)

### New Features

* **LinkedIn:** add Expand posts, a switch in Fakh Patches that shows the full text of posts without tapping "more" ([6518865](https://github.com/amfakh/fakh-patches/commit/651886501a48740c5aadd4f66a1671c524af7e8d))

## [1.11.1](https://github.com/amfakh/fakh-patches/compare/v1.11.0...v1.11.1) (2026-11-04)

### Bug Fixes

* **LinkedIn:** the highlighted comments of a hidden post no longer stay behind in the feed now and then ([e9c1804](https://github.com/amfakh/fakh-patches/commit/e9c18045ed80c87549b663c926767405c6283e83))

### Updated App Support

* **LinkedIn:** add support for `4.1.1269`, next to `4.1.1264` and `4.1.1267` ([336a29a](https://github.com/amfakh/fakh-patches/commit/336a29a0e782adb0ba0cd9e4fc35d333821bbcca))

## [1.11.0](https://github.com/amfakh/fakh-patches/compare/v1.10.0...v1.11.0) (2026-11-04)

### New Features

* **detikcom:** support 7.14.1, with Hide ads (feed, article, Live TV and Milidetik), Disable analytics, Merge article pages to read a paged article in one go, and Stop autoplay for the video embeds, live ones included ([ee97776](https://github.com/amfakh/fakh-patches/commit/ee97776912867ffa3f6a1a37c500567474f85c90))
* **CNN Indonesia:** support 2.50.7, with Hide ads (banners, "Promoted" rows, full-screen ads, ads on web pages), Disable analytics, and Merge article pages to read a paged article in one go ([b52fdfd](https://github.com/amfakh/fakh-patches/commit/b52fdfdc6bc5dc67230bbe5c1b9a756448ded257))

## [1.10.0](https://github.com/amfakh/fakh-patches/compare/v1.9.1...v1.10.0) (2026-11-03)

### New Features

* **IDN:** support 6.69.1, from an XAPK or an APKS bundle; Disable analytics keeps CleverTap for push and popups, without the advertising ID ([518e6a0](https://github.com/amfakh/fakh-patches/commit/518e6a07d8cb2f36de8f277a085974efeaa2a997))

### Bug Fixes

* **LinkedIn:** hide the highlighted comments of a post that a feed filter hid, instead of leaving them on their own in the feed ([b5d87cc](https://github.com/amfakh/fakh-patches/commit/b5d87cc448c84c56fc0b6a36e4451c5ae7e61eb3))

### Updated App Support

* **LinkedIn:** add support for `4.1.1267`, next to `4.1.1264` ([e1c3549](https://github.com/amfakh/fakh-patches/commit/e1c35494caa727072995dbc64c33550495bda296))

## [1.9.1](https://github.com/amfakh/fakh-patches/compare/v1.9.0...v1.9.1) (2026-11-03)

### Bug Fixes

* **Smart Life, Tuya Smart, BARDI:** fix Spoof signature missing the original certificate on some devices, so the app no longer quits right after start ([3970956](https://github.com/amfakh/fakh-patches/commit/39709568e84d1f79fa721e851bc9d5c701dd9ac3))

## [1.9.0](https://github.com/amfakh/fakh-patches/compare/v1.8.2...v1.9.0) (2026-11-03)

### New Features

* **Smart Life, Tuya Smart, BARDI:** add Spoof signature, on by default, so the signature fix that lets the patched app start shows up in the patch list ([7700c5f](https://github.com/amfakh/fakh-patches/commit/7700c5f705a5ec2afabcb16d7d473a41938cd0c1))

### Bug Fixes

* **LinkedIn:** only offer the tested version 4.1.1264, instead of also allowing any other version as experimental ([2aa8178](https://github.com/amfakh/fakh-patches/commit/2aa817865a010d5589759459838e143327dbbd06))

## [1.8.2](https://github.com/amfakh/fakh-patches/compare/v1.8.1...v1.8.2) (2026-11-03)

### Bug Fixes

* **Smart Life, Tuya Smart:** fix Hide AI ask bar leaving the AI bar at the bottom of device panels ([9d25230](https://github.com/amfakh/fakh-patches/commit/9d252302d8d38b5bb324bad23152d33abd13e09d))

## [1.8.1](https://github.com/amfakh/fakh-patches/compare/v1.8.0...v1.8.1) (2026-11-01)

### New Features

* **IDN:** add Disable analytics to stop AppsFlyer, CleverTap, Firebase Analytics, Crashlytics, Google Tag Manager, comScore and Facebook events, while push notifications stay ([31e3d73](https://github.com/amfakh/fakh-patches/commit/31e3d735002a759deb122bf97bd39ec4917f6105))

## [1.8.0](https://github.com/amfakh/fakh-patches/compare/v1.7.0...v1.8.0) (2026-11-01)

### New Features

* **KOMPAS.com:** support 9.8.4 with Hide ads to remove the ad banners and their grey "Iklan" blocks, the video ads, the full-screen ad and the banners on kompas.com pages opened in the app ([b7afa50](https://github.com/amfakh/fakh-patches/commit/b7afa503142654afb6fc7db2ddb1948525b51ce1))
* **KOMPAS.com:** add Stop autoplay so the videos in "Video Pilihan" under an article only play when tapped ([b7afa50](https://github.com/amfakh/fakh-patches/commit/b7afa503142654afb6fc7db2ddb1948525b51ce1))
* **KOMPAS.com:** add Disable analytics to stop AppsFlyer, Mixpanel and Insider tracking and turn off Firebase Analytics, Crashlytics, Performance and Sessions ([b7afa50](https://github.com/amfakh/fakh-patches/commit/b7afa503142654afb6fc7db2ddb1948525b51ce1))
* **KOMPAS.com:** add GmsCore support (off by default) so "Login dengan Google" works through microG RE ([b7afa50](https://github.com/amfakh/fakh-patches/commit/b7afa503142654afb6fc7db2ddb1948525b51ce1))

## [1.7.0](https://github.com/amfakh/fakh-patches/compare/v1.6.2...v1.7.0) (2026-11-01)

### New Features

* **IDN:** support 6.69.0 with Hide ads, Hide Create button, Hide home tabs, Hide package banner, Stop autoplay, Redirect Gold purchase and Allow Developer options, plus a Fakh Patches page in the app's Settings to turn each one on or off ([8ed3b39](https://github.com/amfakh/fakh-patches/commit/8ed3b39001b4ba073dbeb8f260561059ae8129fb))

## [1.6.2](https://github.com/amfakh/fakh-patches/compare/v1.6.1...v1.6.2) (2026-10-30)

### New Features

* **LinkedIn:** group the patches into Ads, Feed, Privacy, Theme and Feature categories in Morphe Manager ([1f5224c](https://github.com/amfakh/fakh-patches/commit/1f5224cdfbada94d1b524c032c0b2bfb9476d3f4))

## [1.6.1](https://github.com/amfakh/fakh-patches/compare/v1.6.0...v1.6.1) (2026-10-30)

### New Features

* **Tuya Smart:** support 7.12.3-870 with Hide Plus button, Hide Recommended for you, Hide AI ask bar, Hide Explore tab, Hide Rewards Hub, Hide My Orders, Hide Tuya AI Web Version, Disable analytics and GmsCore support ([1b7478e](https://github.com/amfakh/fakh-patches/commit/1b7478e0f9acf75dd75f1cf075ea92808af19967))
* **Smart Life, Tuya Smart:** add Hide ads to remove the ad banners and the AdMob ad entry ([1b7478e](https://github.com/amfakh/fakh-patches/commit/1b7478e0f9acf75dd75f1cf075ea92808af19967))
* **BARDI:** support Smart Home 1.5.3 with Hide Mall tab, Hide Me banner and Hide App Mall to clean up the bottom navigation and the Me tab ([1b7478e](https://github.com/amfakh/fakh-patches/commit/1b7478e0f9acf75dd75f1cf075ea92808af19967))
* **BARDI:** add GmsCore support (off by default) so "Sign in with Google" works through microG RE ([1b7478e](https://github.com/amfakh/fakh-patches/commit/1b7478e0f9acf75dd75f1cf075ea92808af19967))

## [1.6.0](https://github.com/amfakh/fakh-patches/compare/v1.5.5...v1.6.0) (2026-10-30)

### New Features

* **Smart Life:** add Hide Plus button to remove the "Plus" pill from the home header ([ae307e8](https://github.com/amfakh/fakh-patches/commit/ae307e827983ee65a86e289a5b6e1120f77697c1))
* **Smart Life:** add Hide Recommended for you to remove the "Recommended for You" section and its cards from the home screen ([ae307e8](https://github.com/amfakh/fakh-patches/commit/ae307e827983ee65a86e289a5b6e1120f77697c1))
* **Smart Life:** add Hide AI ask bar to remove the "How can I help?" Tuya AI bar above the bottom navigation ([ae307e8](https://github.com/amfakh/fakh-patches/commit/ae307e827983ee65a86e289a5b6e1120f77697c1))
* **Smart Life:** add Hide Explore tab to remove the Explore tab from the bottom navigation ([ae307e8](https://github.com/amfakh/fakh-patches/commit/ae307e827983ee65a86e289a5b6e1120f77697c1))
* **Smart Life:** add Hide Rewards Hub, Hide My Orders and Hide Tuya AI Web Version to remove those rows from the Me tab ([ae307e8](https://github.com/amfakh/fakh-patches/commit/ae307e827983ee65a86e289a5b6e1120f77697c1))
* **Smart Life:** add Disable analytics to stop AppsFlyer and turn off Firebase Analytics, Crashlytics and Sessions ([ae307e8](https://github.com/amfakh/fakh-patches/commit/ae307e827983ee65a86e289a5b6e1120f77697c1))
* **Smart Life:** add GmsCore support (off by default) so "Sign in with Google" works through microG RE ([ae307e8](https://github.com/amfakh/fakh-patches/commit/ae307e827983ee65a86e289a5b6e1120f77697c1))

### Bug Fixes

* **Smart Life:** fix GmsCore support leaving the app without a device location, which pinned the map at 0,0 ([cbbef17](https://github.com/amfakh/fakh-patches/commit/cbbef1702875555fd877e67c3c395d1a87318d0a))

## [1.5.5](https://github.com/amfakh/fakh-patches/compare/v1.5.4...v1.5.5) (2026-10-29)

### Bug Fixes

* **LinkedIn:** fix Hide puzzle games blanking the Games page when you open it from a shortcut or link ([85b4e5d](https://github.com/amfakh/fakh-patches/commit/85b4e5d9d8ce7b275882702b8947e213bc923038))
* **LinkedIn:** fix Hide video posts not hiding videos on LinkedIn 4.1.1264 ([d13d8a9](https://github.com/amfakh/fakh-patches/commit/d13d8a97f4281b6e49128f88691665ba88ca4e4c))

## [1.5.4](https://github.com/amfakh/fakh-patches/compare/v1.5.3...v1.5.4) (2026-10-29)

### New Features

* **LinkedIn:** add Hide "Recommended for you" to Feed filters, which removes the lists of people and pages to follow from your feed ([25caf81](https://github.com/amfakh/fakh-patches/commit/25caf81133e95db13f574bfebc7b55a67523f40e))
* **LinkedIn:** add Hide puzzle games to Feed filters, which removes the game cards, the "Today's puzzles" title and its "Show all" button from search ([25caf81](https://github.com/amfakh/fakh-patches/commit/25caf81133e95db13f574bfebc7b55a67523f40e))

### Bug Fixes

* **LinkedIn:** fix Material You failing to apply on LinkedIn versions where the system bar and navigation bar calls use wider registers ([141e0ab](https://github.com/amfakh/fakh-patches/commit/141e0ab788f11d1743facc907b2bdd52cc5c9174))

## [1.5.3](https://github.com/amfakh/fakh-patches/compare/v1.5.2...v1.5.3) (2026-10-28)

### New Features

* **DoDo Music:** add Fix song playback, so songs play on the patched app instead of hanging on "loading" ([48a8bac](https://github.com/amfakh/fakh-patches/commit/48a8bac9801f947c0fd9b661b5c66bd2e26fb86a))
* **DoDo Music:** add GmsCore support, so you can sign in with Google and your saved collection comes back ([48a8bac](https://github.com/amfakh/fakh-patches/commit/48a8bac9801f947c0fd9b661b5c66bd2e26fb86a))
* **DoDo Music:** add Disable analytics, turning off Adjust, TikTok and Firebase ([48a8bac](https://github.com/amfakh/fakh-patches/commit/48a8bac9801f947c0fd9b661b5c66bd2e26fb86a))

## [1.5.2](https://github.com/amfakh/fakh-patches/compare/v1.5.1...v1.5.2) (2026-10-28)

### Bug Fixes

* **Windy:** describe Unlock Premium by what it unlocks (deeper map zoom, 1-hour forecast steps, the premium calendar view, no "Go Premium" button) instead of how it edits the app ([f0e4631](https://github.com/amfakh/fakh-patches/commit/f0e463166451c8ddd37e9e03c9f861183d8f20b3))

## [1.5.1](https://github.com/amfakh/fakh-patches/compare/v1.5.0...v1.5.1) (2026-10-28)

### New Features

* **DoDo Music:** add patches for DoDo Music 2.0.14: premium unlock, which also removes ads and keeps the app from closing on the Play license check ([c624374](https://github.com/amfakh/fakh-patches/commit/c6243747358be57e4c7c2ad5ad33c876ed630c7e))

## [1.5.0](https://github.com/amfakh/fakh-patches/compare/v1.4.0...v1.5.0) (2026-10-28)

### New Features

* **Windy:** add patches for Windy 51.3.2: unlock premium ([2f9ed23](https://github.com/amfakh/fakh-patches/commit/2f9ed23f4a2af0c1792d0c71c7a71ef151727c0b))

## [1.4.0](https://github.com/amfakh/fakh-patches/compare/v1.3.0...v1.4.0) (2026-10-27)

### New Features

* **Radio:** add Material You: wallpaper colors in light and dark mode, rounder cards, a floating now playing bar, a Material 3 bottom bar, and a redesigned full player with scrolling titles and the station logo as artwork fallback ([89b87f7](https://github.com/amfakh/fakh-patches/commit/89b87f7fb30f1eb407501b54addd8646d1b447ef))

## [1.3.0](https://github.com/amfakh/fakh-patches/compare/v1.2.1...v1.3.0) (2026-10-27)

### New Features

* **Radio:** add patches for Radio Indonesia 4.2.30: premium unlock, disable data collection SDKs and disable analytics ([84fd82a](https://github.com/amfakh/fakh-patches/commit/84fd82a3221916f0cd7dd0e3c30fde8626884d2c))
* **Radio:** show the song's title and album art in the media notification, and group patches by category ([791af16](https://github.com/amfakh/fakh-patches/commit/791af165da4a7ce97670c1d73f62dcb6a0330e94))
* **Radio:** add Faster startup to stop the splash screen from waiting on the remote config fetch ([34f1e9c](https://github.com/amfakh/fakh-patches/commit/34f1e9c3d6ebd31dc0d4f3e0eca955ce80a633d9))

### Bug Fixes

* **Radio:** fold Disable ad SDKs into Premium unlock, since it only works together with the unlock, and rename the Player category to Feature ([3e1541f](https://github.com/amfakh/fakh-patches/commit/3e1541fc549db233fa9802ee1b2fe790834a6aa7))
* **Radio:** keep album art in the media notification by retrying failed downloads, following redirects and showing the station logo meanwhile ([11315a9](https://github.com/amfakh/fakh-patches/commit/11315a94179d230b386c8f44844627e918d0f2f1))
* **Radio:** show the song's album art in the media notification once it finishes downloading ([1dc1652](https://github.com/amfakh/fakh-patches/commit/1dc16525acad5311d07f15da98d88c3c37230f90))

## [1.2.1](https://github.com/amfakh/fakh-patches/compare/v1.2.0...v1.2.1) (2026-10-27)

### New Features

* **LinkedIn:** add a switch for the Puzzle games shortcut in the More tab settings, which adds or removes the shortcut right away ([38667e0](https://github.com/amfakh/fakh-patches/commit/38667e06375519b7461e2520b758fa88470f11a1))

## [1.2.0](https://github.com/amfakh/fakh-patches/compare/v1.1.0...v1.2.0) (2026-10-27)

### New Features

* **LinkedIn:** hide items of LinkedIn's More tab, or move them into the profile menu and remove the tab ([6e5d2b4](https://github.com/amfakh/fakh-patches/commit/6e5d2b4e53a73d4495caa8df8a16f310f41048df))
* **LinkedIn:** add a Puzzle games shortcut to the LinkedIn app icon, drawn like LinkedIn's own shortcuts ([6e5d2b4](https://github.com/amfakh/fakh-patches/commit/6e5d2b4e53a73d4495caa8df8a16f310f41048df))
* **LinkedIn:** hide the likes, comments, reposts and reply counts in LinkedIn's focus mode on 4.1.1264 ([6e5d2b4](https://github.com/amfakh/fakh-patches/commit/6e5d2b4e53a73d4495caa8df8a16f310f41048df))
* **LinkedIn:** hide posts shown because someone you know liked, commented on or reposted them, replacing the old repost filter ([6e5d2b4](https://github.com/amfakh/fakh-patches/commit/6e5d2b4e53a73d4495caa8df8a16f310f41048df))
* **LinkedIn:** color the notification badges with the Material You accent ([6e5d2b4](https://github.com/amfakh/fakh-patches/commit/6e5d2b4e53a73d4495caa8df8a16f310f41048df))
* **LinkedIn:** add a restart button to the settings, and open the settings by long pressing the Home tab ([6e5d2b4](https://github.com/amfakh/fakh-patches/commit/6e5d2b4e53a73d4495caa8df8a16f310f41048df))
* **LinkedIn:** support LinkedIn 4.1.1264 only, and drop 4.1.1261 ([6e5d2b4](https://github.com/amfakh/fakh-patches/commit/6e5d2b4e53a73d4495caa8df8a16f310f41048df))

## [1.1.0](https://github.com/amfakh/fakh-patches/compare/v1.0.0...v1.1.0) (2026-10-27)

### New Features

* **LinkedIn:** add LinkedIn patches based on Michii Patches by heyymichii: hide ads, promoted jobs, suggested posts and Premium upsells, feed filters, media downloads, ghost mode, direct links and clean share links ([1d581fe](https://github.com/amfakh/fakh-patches/commit/1d581feaa8c38290b83a935054239a736c727afd))
* **LinkedIn:** color LinkedIn from your wallpaper with Material You, and optionally remove the gaps and dividers between list items ([1d581fe](https://github.com/amfakh/fakh-patches/commit/1d581feaa8c38290b83a935054239a736c727afd))
* **LinkedIn:** sign in to LinkedIn with Google through microG RE with the GmsCore support patch ([1d581fe](https://github.com/amfakh/fakh-patches/commit/1d581feaa8c38290b83a935054239a736c727afd))
* **LinkedIn:** open the LinkedIn patch settings from a Fakh Patches row in LinkedIn's Settings, or by long pressing the Home tab ([1d581fe](https://github.com/amfakh/fakh-patches/commit/1d581feaa8c38290b83a935054239a736c727afd))
* **LinkedIn:** support LinkedIn 4.1.1264 and 4.1.1261 ([1d581fe](https://github.com/amfakh/fakh-patches/commit/1d581feaa8c38290b83a935054239a736c727afd))

## 1.0.0 (2026-10-26)

### New Features

* **GitHub:** color the GitHub app from your wallpaper, with tinted surfaces, cards and borders in light and dark mode ([ed442a7](https://github.com/amfakh/fakh-patches/commit/ed442a71269501cb32be902dc23faa804024bf3b))
* **GitHub:** add a Fakh Patches section to Settings with a Material You switch and a pitch black in dark mode switch ([ed442a7](https://github.com/amfakh/fakh-patches/commit/ed442a71269501cb32be902dc23faa804024bf3b))
