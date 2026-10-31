## [1.2.2](https://github.com/amfakh/fakh-radio-patches/compare/v1.2.1...v1.2.2) (2026-10-24)

### 🐛 Bug Fixes

* show the song's album art in the media notification once it finishes downloading, instead of keeping the station logo ([1dc1652](https://github.com/amfakh/fakh-radio-patches/commit/1dc16525acad5311d07f15da98d88c3c37230f90))

## [1.2.1](https://github.com/amfakh/fakh-radio-patches/compare/v1.2.0...v1.2.1) (2026-10-24)

### 🐛 Bug Fixes

* retry album art downloads that failed, instead of leaving the song without a picture ([11315a9](https://github.com/amfakh/fakh-radio-patches/commit/11315a94179d230b386c8f44844627e918d0f2f1))
* follow redirects between http and https when downloading album art ([11315a9](https://github.com/amfakh/fakh-radio-patches/commit/11315a94179d230b386c8f44844627e918d0f2f1))
* show the station logo in the media notification until the song's album art arrives ([11315a9](https://github.com/amfakh/fakh-radio-patches/commit/11315a94179d230b386c8f44844627e918d0f2f1))



## [1.2.0](https://github.com/amfakh/fakh-radio-patches/compare/v1.1.1...v1.2.0) (2026-10-24)

### ✨ New Features

* add Faster startup to stop the splash screen from waiting up to 5 seconds on the remote config fetch ([34f1e9c](https://github.com/amfakh/fakh-radio-patches/commit/34f1e9c3d6ebd31dc0d4f3e0eca955ce80a633d9))



## [1.1.1](https://github.com/amfakh/fakh-radio-patches/compare/v1.1.0...v1.1.1) (2026-10-24)

### 🐛 Bug Fixes

* fold Disable ad SDKs into Premium unlock, since it only works together with the unlock ([3e1541f](https://github.com/amfakh/fakh-radio-patches/commit/3e1541fc549db233fa9802ee1b2fe790834a6aa7))
* rename the Player category to Feature ([3e1541f](https://github.com/amfakh/fakh-radio-patches/commit/3e1541fc549db233fa9802ee1b2fe790834a6aa7))



## [1.1.0](https://github.com/amfakh/fakh-radio-patches/compare/v1.0.0...v1.1.0) (2026-10-24)

### ✨ New Features

* add Song info in media notification to show the song title and its album art in the media notification and the system media player ([791af16](https://github.com/amfakh/fakh-radio-patches/commit/791af165da4a7ce97670c1d73f62dcb6a0330e94))
* group the patches by category in Morphe Manager ([791af16](https://github.com/amfakh/fakh-radio-patches/commit/791af165da4a7ce97670c1d73f62dcb6a0330e94))



## 1.0.0 (2026-10-24)

### ✨ New Features

* add Premium unlock for Radio Indonesia 4.2.30, with no visual ads and the music equalizer ([84fd82a](https://github.com/amfakh/fakh-radio-patches/commit/84fd82a3221916f0cd7dd0e3c30fde8626884d2c))
* add Disable data collection SDKs to stop Weplan, Wavebrook and its partners, Speedchecker, LowLagLabs and GeoTruth ([84fd82a](https://github.com/amfakh/fakh-radio-patches/commit/84fd82a3221916f0cd7dd0e3c30fde8626884d2c))
* add Disable analytics to turn off Firebase Analytics, Crashlytics, Performance and Sessions, and the Facebook SDK ([84fd82a](https://github.com/amfakh/fakh-radio-patches/commit/84fd82a3221916f0cd7dd0e3c30fde8626884d2c))
* add Disable ad SDKs to keep every ad network and AppHarbr from starting ([84fd82a](https://github.com/amfakh/fakh-radio-patches/commit/84fd82a3221916f0cd7dd0e3c30fde8626884d2c))
