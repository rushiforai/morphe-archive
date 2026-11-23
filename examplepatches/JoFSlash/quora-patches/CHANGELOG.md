## [1.10.0](https://github.com/JoFSlash/morphe-patches/compare/v1.9.0...v1.10.0) (2026-11-22)

### One patch source for three apps

The Booking.com and Google Health patches moved into this repository, next to the Quora patches, and
the repository is now called **morphe-patches**. This bundle has the patches for all three apps:
75 for Quora, 25 for Booking.com and 12 for Google Health. Morphe Manager shows each app's patches
when you pick that app. [Which apps and what the patches do](https://github.com/JoFSlash/morphe-patches#readme).

- **Quora:** nothing to do; the old address leads here. What's new for Quora is listed below.
- **Booking.com and Google Health:** the old sources (booking-patches and google-health-patches) get no
  more updates. In Morphe Manager, remove the old source and add this one
  ([link](https://morphe.software/add-source?github=JoFSlash/morphe-patches)), then patch the app again
  and install it over the patched app. You stay signed in, and Booking.com keeps your watched prices.
  The patches themselves are the same as in booking-patches 1.1.0 and google-health-patches 1.1.0.

The bundle is signed with this repository's key ([morphe-signing.pub](https://github.com/JoFSlash/morphe-patches/blob/main/morphe-signing.pub)).

### New features

* Add a For reading preset ([68ca43e](https://github.com/JoFSlash/morphe-patches/commit/68ca43ee2d4f92091ad887eb1abf92a747b73103))
* Backup keeps History, Bookmarks and Dismissed questions too ([2699e6b](https://github.com/JoFSlash/morphe-patches/commit/2699e6b3a5ae067d9a52f6bc959a9f99c252feee))
* Bookmarks, in-app Translate, Hide comment box, Dismissed questions, Slovak settings ([c33a536](https://github.com/JoFSlash/morphe-patches/commit/c33a53666b84797b2b83185bd92874e41dbd650d))
* Check that the app is registered for notifications ([63673c1](https://github.com/JoFSlash/morphe-patches/commit/63673c1e31ba515d03c6f2c193500cfa0a27ec5a))
* Fix hiding patches without a release (Filter updates) ([4f63b4b](https://github.com/JoFSlash/morphe-patches/commit/4f63b4b30c57c92f8da27bcb9beaa8a0ddb9cd19))
* Hide anonymous answers, Read aloud and offline bookmarks ([26fccc0](https://github.com/JoFSlash/morphe-patches/commit/26fccc0c963b5ab29aa16bf9c5809d095499d887))
* Offer presets on the first start after patching ([d03684e](https://github.com/JoFSlash/morphe-patches/commit/d03684e3d266bb29e07639b62856ed198779d30e))
* One patch source for Quora, Booking.com and Google Health ([3f83ad8](https://github.com/JoFSlash/morphe-patches/commit/3f83ad8d119df9d8e128e699ca6b7af5408d7273))
* Patch settings in Czech, French, German, Italian, Polish, Portuguese and Spanish ([8035eb6](https://github.com/JoFSlash/morphe-patches/commit/8035eb655e2564e9c817d471a6b4ed10e940109a))
* Save a backup file with the bookmarks' saved texts ([#51](https://github.com/JoFSlash/morphe-patches/issues/51)) ([a852c37](https://github.com/JoFSlash/morphe-patches/commit/a852c3793abd6a1ced4e385099e691293a3ca73b))
* Save bookmarks with their text to Downloads ([ec8bd16](https://github.com/JoFSlash/morphe-patches/commit/ec8bd1662c015791e17c2a085aeb850ca0dcd8cb))
* Say what to do when Quora stops accepting the app's version ([18353b1](https://github.com/JoFSlash/morphe-patches/commit/18353b15f41364511d0b0e64e31cc1a5f843fd75))
* Show in Patch settings what stops notifications ([6d80a13](https://github.com/JoFSlash/morphe-patches/commit/6d80a13d901e236398636e7f0b78f55a4f44e869))
* Support Quora 3.2.47 ([1ecf9b2](https://github.com/JoFSlash/morphe-patches/commit/1ecf9b2abf2fc5d5db3c7cbfca8c2a88a457b37d))
* Translate long answers in parts ([6cab648](https://github.com/JoFSlash/morphe-patches/commit/6cab6481a108cae7d8f064256d902c0de44634be))
* Turn on Disable video autoplay by default ([cbc179e](https://github.com/JoFSlash/morphe-patches/commit/cbc179e1fc0fe2d77effc0ff57c76de6967a1e72))
* Turn on GmsCore support by default ([693be68](https://github.com/JoFSlash/morphe-patches/commit/693be68566dabf136cfb1975c91bb1a1a46ef118))
* Word count while writing an answer or a post ([7e779d4](https://github.com/JoFSlash/morphe-patches/commit/7e779d434e517d9d04c9a88965ccb00a729a9919))

### Bug fixes

* Block authors no longer hides answers a blocked person only upvoted ([996adf2](https://github.com/JoFSlash/morphe-patches/commit/996adf2541bebf7f024e4e87e541df186133bcf2))
* Bookmark button comes back when Quora redraws the answer's action bar ([523d55a](https://github.com/JoFSlash/morphe-patches/commit/523d55a15455441e46e9fc5bdcde1eaa7ff92ca8))
* Correct the settings translations ([02ce8b6](https://github.com/JoFSlash/morphe-patches/commit/02ce8b68ff0942680c12030daa7ab9e849c55621))
* Let the presets dialog build in the page script tests ([5301205](https://github.com/JoFSlash/morphe-patches/commit/5301205272a4718928b19dbe1037ee6b59196286))
* Only the patches' own scripts can use their bridge ([d5d0426](https://github.com/JoFSlash/morphe-patches/commit/d5d04264645ce8d222ae8221ddc3817545e29b3c))
* Show the Czech and Slovak settings on Czech and Slovak phones ([ca07c41](https://github.com/JoFSlash/morphe-patches/commit/ca07c41c58ab0bc69ffac786411572fc02e5bac2))
* Space after the author in saved bookmarks; describe Hide Quora+ answers as it works ([752f1b1](https://github.com/JoFSlash/morphe-patches/commit/752f1b1ea21a46f9619bbf93ee1aef4703ac6c46))

### Documentation

* Add a security policy, a code of conduct and a pull request template ([bb78aa2](https://github.com/JoFSlash/morphe-patches/commit/bb78aa2aea94f2f68c2b537642170eb7cf7653f9))
* Fix the README after the review ([dc4d3c6](https://github.com/JoFSlash/morphe-patches/commit/dc4d3c65e42ff5b1b9bb66fb75ca84109f0a8599))
* Lists in Patch settings, Translate, Report a problem and the tests ([596c673](https://github.com/JoFSlash/morphe-patches/commit/596c673ee5c057e5fe672c574c5eee617d18f205))
* Old Quora versions and Quora in other languages ([1bd6338](https://github.com/JoFSlash/morphe-patches/commit/1bd63381573992c6754ec0a016dd1f225cb39723))
* Say that notifications need GmsCore support ([0bfd9b9](https://github.com/JoFSlash/morphe-patches/commit/0bfd9b900b749c7e7e1e59781c9eaa2afa50fe7e))
* Say which Android versions work, and that Translate sends text to Google ([5229b41](https://github.com/JoFSlash/morphe-patches/commit/5229b4115a40dc448b734825bc8c0900e2fec5b1))

## [1.9.0](https://github.com/JoFSlash/quora-patches/compare/v1.8.0...v1.9.0) (2026-11-20)

### New features

* Turn on 14 more patches by default ([f34b0ec](https://github.com/JoFSlash/quora-patches/commit/f34b0ec407987a98a5df7dc6dc08373d865e0a9a))

### Documentation

* Google sign-in through MicroG-RE and keeping the official app ([925b5dc](https://github.com/JoFSlash/quora-patches/commit/925b5dcfc2acb44314fa41ff8bbd48a03d0a4192))

## [1.8.0](https://github.com/JoFSlash/quora-patches/compare/v1.7.1...v1.8.0) (2026-11-20)

### New features

* Clone app and GmsCore support patches ([9e61d62](https://github.com/JoFSlash/quora-patches/commit/9e61d62328f97501fdf282402bb0e123dc18827d)), closes [#22](https://github.com/JoFSlash/quora-patches/issues/22) [#21](https://github.com/JoFSlash/quora-patches/issues/21)
* Copy and Share text under Spaces posts, previews, fullscreen on answer pages ([567d76e](https://github.com/JoFSlash/quora-patches/commit/567d76ed903c8f4652920fab9080890c68ae3985))
* Fix device theme, Fix push notifications, clone app name ([f85bd1e](https://github.com/JoFSlash/quora-patches/commit/f85bd1e4bbe23c4994d546c5218dab148025e19c))
* Reading and feed patches, Branch tracking blocked by default ([6cbd8cf](https://github.com/JoFSlash/quora-patches/commit/6cbd8cf336045b40dd155689a6809aee70b7b617))

### Bug fixes

* Drop Quora 3.2.30 from the supported versions ([d64e211](https://github.com/JoFSlash/quora-patches/commit/d64e211a6baead48f5ee696cd1e7d1768054f402))
* Report Quora's package and certificate to Firebase Installations ([6ffae93](https://github.com/JoFSlash/quora-patches/commit/6ffae937efaa677596a56ca1213a0e2fd0b2c54c))

### Documentation

* Suggest a first set of patches, explain links opening in the browser ([5d5357f](https://github.com/JoFSlash/quora-patches/commit/5d5357f83ab7a9334175ddedd6f3430f4ee7a4e4))

## [1.7.1](https://github.com/JoFSlash/quora-patches/compare/v1.7.0...v1.7.1) (2026-11-18)

### Documentation

* Badges, supported versions up top, direct APKMirror links, FAQ ([08fdfff](https://github.com/JoFSlash/quora-patches/commit/08fdfff80eec35d25b0a029401f835ad65c921c4))
* Fold the patch list by category and fix a broken paragraph ([4d4728d](https://github.com/JoFSlash/quora-patches/commit/4d4728d93a711c84e8d11d44325d6bdf2c00d65f))
* **Needs release:** Point the changelog links at the current commits ([57ed9fc](https://github.com/JoFSlash/quora-patches/commit/57ed9fc66dae3e0c1ab797e1ce3807cb903e42d0))
* Say where to get Quora, how to update, and that you sign in again ([9d4c589](https://github.com/JoFSlash/quora-patches/commit/9d4c5894649e556b74cc86047f3a54f7ecbd28a9))

## [1.7.0](https://github.com/JoFSlash/quora-patches/compare/v1.6.0...v1.7.0) (2026-11-18)

### New features

* Change patch options in the settings, and Copy answer text ([18fc53d](https://github.com/JoFSlash/quora-patches/commit/18fc53dd691aae9b02a1cac36f415d58cb43c47c))

## [1.6.0](https://github.com/JoFSlash/quora-patches/compare/v1.5.0...v1.6.0) (2026-11-18)

### New features

* Back up and restore the patch settings as text ([e9bbf72](https://github.com/JoFSlash/quora-patches/commit/e9bbf72d9816f67a2da5df058b249f274b4c75ae))
* Group the patch settings by category, with a line about each switch ([2716d89](https://github.com/JoFSlash/quora-patches/commit/2716d898b3f798d478e88ca74673de58e16f0a7e))
* Hide old answers, Hide Spaces posts, Hide credentials, Hide Follow buttons, Hide surveys ([6b41de4](https://github.com/JoFSlash/quora-patches/commit/6b41de4f9b4f05b57f508a0a78930670a22f1923))
* Open the patch settings as a page with search, in the style of Quora's settings ([bbce1ec](https://github.com/JoFSlash/quora-patches/commit/bbce1ec0666170af6c9a8cf67365ae6790f3a30e))
* Open the patch settings from Quora's settings page ([6a6d896](https://github.com/JoFSlash/quora-patches/commit/6a6d896075ea3e1f418f5b767f021e46e1723fd5))
* Page check in Patch settings, a hint on first start, and a script to check new Quora versions ([16f1f14](https://github.com/JoFSlash/quora-patches/commit/16f1f1498bb0cb43a29de2d2cd4ffd690dd35471))

## [1.5.0](https://github.com/JoFSlash/quora-patches/compare/v1.4.0...v1.5.0) (2026-11-18)

### New features

* Patch categories, Data saver loads images on Wi-Fi, new banner ([8c90f27](https://github.com/JoFSlash/quora-patches/commit/8c90f2793e8b9440308fdb6b18f88d52cd7f4749))

### Bug fixes

* Let lint pass on the network check ([db6a383](https://github.com/JoFSlash/quora-patches/commit/db6a383dc9f2d80b3003a3516a9f48e8c34f10de))

## [1.4.0](https://github.com/JoFSlash/quora-patches/compare/v1.3.3...v1.4.0) (2026-11-18)

### New features

* Hide seen items, Hide comment previews and Keep place on return ([07961ec](https://github.com/JoFSlash/quora-patches/commit/07961ec9413396dcf8c19d191a6dcd85bcf622c3))

## [1.3.3](https://github.com/JoFSlash/quora-patches/compare/v1.3.2...v1.3.3) (2026-11-18)

### Bug fixes

* Show profile photos with Data saver, hide leftover counts and dots ([c8f5248](https://github.com/JoFSlash/quora-patches/commit/c8f52489af877be0a1798d4c9427e712b662f0eb))

## [1.3.2](https://github.com/JoFSlash/quora-patches/compare/v1.3.1...v1.3.2) (2026-11-18)

### Bug fixes

* Make page patches work in answer and post views, as seen on a phone ([2675405](https://github.com/JoFSlash/quora-patches/commit/267540596e78d2df2c6aa08e802485dc3cd0c237))
* Phone test fixes for ads, prompts, feed and Patch settings ([85bb82d](https://github.com/JoFSlash/quora-patches/commit/85bb82dfea5272f00345ede6b6d3b03ef7c6aae4))
* Save images, tap-to-load and Expand answers, tested on a phone ([f4f4fd2](https://github.com/JoFSlash/quora-patches/commit/f4f4fd25469b02704ed7aa385880c7c239c38565))

## [1.3.1](https://github.com/JoFSlash/quora-patches/compare/v1.3.0...v1.3.1) (2026-11-17)

### Bug fixes

* Data saver shows tap targets only for answer and feed images ([b0d9f24](https://github.com/JoFSlash/quora-patches/commit/b0d9f249134bf5a4a13aa52de2ad700f5c5b90a2))
* Stop "Clean shared links" from crashing the app on start ([d575dd3](https://github.com/JoFSlash/quora-patches/commit/d575dd337ec17760bdf6050f1a7ce08303ee8067))

## [1.3.1-dev.1](https://github.com/JoFSlash/quora-patches/compare/v1.3.0...v1.3.1-dev.1) (2026-11-17)

### Bug fixes

* Data saver shows tap targets only for answer and feed images ([b0d9f24](https://github.com/JoFSlash/quora-patches/commit/b0d9f249134bf5a4a13aa52de2ad700f5c5b90a2))
* Stop "Clean shared links" from crashing the app on start ([d575dd3](https://github.com/JoFSlash/quora-patches/commit/d575dd337ec17760bdf6050f1a7ce08303ee8067))

## [1.3.0](https://github.com/JoFSlash/quora-patches/compare/v1.2.0...v1.3.0) (2026-11-17)

### New features

* Add "Patch settings" and "Save images", build pull requests ([5cd87db](https://github.com/JoFSlash/quora-patches/commit/5cd87db04dd4ebc614e28e5ee5f75978ba9ed064))

## [1.3.0-dev.1](https://github.com/JoFSlash/quora-patches/compare/v1.2.0...v1.3.0-dev.1) (2026-11-17)

### New features

* Add "Patch settings" and "Save images", build pull requests ([5cd87db](https://github.com/JoFSlash/quora-patches/commit/5cd87db04dd4ebc614e28e5ee5f75978ba9ed064))

## [1.2.0](https://github.com/JoFSlash/quora-patches/compare/v1.1.0...v1.2.0) (2026-11-17)

### New features

* Add "Block app telemetry" and "Disable charging tracking" patches ([23a0767](https://github.com/JoFSlash/quora-patches/commit/23a07673c7fb65b55863f6f4c11f7153351cedf1))
* Add "Clean shared links", "Disable notification prompt", "Hide Spaces tab", "Hide Poe" and "Hide counts" patches ([83e0206](https://github.com/JoFSlash/quora-patches/commit/83e0206cf598685e1ab343287714715674d8c5aa))
* Add "Disable sign-in prompts" and "Disable tab prefetching", stop the heartbeat job, redo the website ([bf47c80](https://github.com/JoFSlash/quora-patches/commit/bf47c803f43aa3b5a4f19e16973bba0cef4f13d3))
* Add "Spoof installer" patch ([75cac5b](https://github.com/JoFSlash/quora-patches/commit/75cac5b9922df30dc33bc2029176ad3f997921be))
* Add privacy, tab, text size, vibration and badge patches ([d681103](https://github.com/JoFSlash/quora-patches/commit/d6811034016139f876b1520c26f3c4bbf2a9188d))
* Add reading, filter, notification, gesture and Branch patches ([8af9b6a](https://github.com/JoFSlash/quora-patches/commit/8af9b6a517d3d0c59b178ed9f58106c2a8f974d3))

## [1.2.0-dev.2](https://github.com/JoFSlash/quora-patches/compare/v1.2.0-dev.1...v1.2.0-dev.2) (2026-11-17)

### New features

* Add "Block app telemetry" and "Disable charging tracking" patches ([23a0767](https://github.com/JoFSlash/quora-patches/commit/23a07673c7fb65b55863f6f4c11f7153351cedf1))

## [1.2.0-dev.1](https://github.com/JoFSlash/quora-patches/compare/v1.1.0...v1.2.0-dev.1) (2026-11-17)

### New features

* Add "Clean shared links", "Disable notification prompt", "Hide Spaces tab", "Hide Poe" and "Hide counts" patches ([83e0206](https://github.com/JoFSlash/quora-patches/commit/83e0206cf598685e1ab343287714715674d8c5aa))
* Add "Spoof installer" patch ([75cac5b](https://github.com/JoFSlash/quora-patches/commit/75cac5b9922df30dc33bc2029176ad3f997921be))
* Add privacy, tab, text size, vibration and badge patches ([d681103](https://github.com/JoFSlash/quora-patches/commit/d6811034016139f876b1520c26f3c4bbf2a9188d))

## [1.1.0](https://github.com/JoFSlash/quora-patches/compare/v1.0.1...v1.1.0) (2026-11-17)

### New features

* Add "Block web trackers", "Disable update prompts", "Disable rating prompts" and "Open links in browser" patches ([325b78a](https://github.com/JoFSlash/quora-patches/commit/325b78afe07f0c5a2eb1534ad58ccc989ab45e9c))
* Add "Hide AI answers", "Hide suggested questions", "Hide Quora+ promotions", "Hide downvote button" and "Enable text selection" patches ([e3523ec](https://github.com/JoFSlash/quora-patches/commit/e3523ec218555bacf102713d8be1b6964c64befd))
* Add "Hide Quora+ answers", "Hide related questions", "Hide Spaces suggestions" and "Disable video autoplay" patches ([83f98aa](https://github.com/JoFSlash/quora-patches/commit/83f98aac8fcb28b52178ae766aec625cc88e47d9))

## [1.1.0-dev.2](https://github.com/JoFSlash/quora-patches/compare/v1.1.0-dev.1...v1.1.0-dev.2) (2026-11-17)

### New features

* Add "Hide AI answers", "Hide suggested questions", "Hide Quora+ promotions", "Hide downvote button" and "Enable text selection" patches ([e3523ec](https://github.com/JoFSlash/quora-patches/commit/e3523ec218555bacf102713d8be1b6964c64befd))
* Add "Hide Quora+ answers", "Hide related questions", "Hide Spaces suggestions" and "Disable video autoplay" patches ([83f98aa](https://github.com/JoFSlash/quora-patches/commit/83f98aac8fcb28b52178ae766aec625cc88e47d9))

## [1.1.0-dev.1](https://github.com/JoFSlash/quora-patches/compare/v1.0.1...v1.1.0-dev.1) (2026-10-31)

### New features

* Add "Block web trackers", "Disable update prompts", "Disable rating prompts" and "Open links in browser" patches ([325b78a](https://github.com/JoFSlash/quora-patches/commit/325b78afe07f0c5a2eb1534ad58ccc989ab45e9c))

## [1.0.1](https://github.com/JoFSlash/quora-patches/compare/v1.0.0...v1.0.1) (2026-10-31)

## [1.0.1-dev.1](https://github.com/JoFSlash/quora-patches/compare/v1.0.0...v1.0.1-dev.1) (2026-10-31)

## 1.0.0 (2026-10-31)

### New features

* Add Quora patches ([3351895](https://github.com/JoFSlash/quora-patches/commit/33518951670279f25dfb37d4e450d0d28cdedce4))
