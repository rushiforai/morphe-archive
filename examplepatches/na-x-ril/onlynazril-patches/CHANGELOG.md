## [1.7.0](https://github.com/na-x-ril/onlynazril-patches/compare/v1.6.0...v1.7.0) (2026-11-28)

### 🐛 Bug Fixes

* **TikTok - Feed filter:** Cached videos bypass the range filter ([fdf2208](https://github.com/na-x-ril/onlynazril-patches/commit/fdf22089314e1253378c4719a12b5d526b3d72ff))
* **TikTok - Feed filter:** Filter whole pages, keep links and open one ([c71af3b](https://github.com/na-x-ril/onlynazril-patches/commit/c71af3bdbd18d4f666d724b00d11765e30a59b10))
* **TikTok - Feed filter:** Keep one video when a page filters to nothing ([259a681](https://github.com/na-x-ril/onlynazril-patches/commit/259a681b52ac8fabd2f76466609edc53e383f6df))
* **TikTok - Handle stamp:** Keep a single leading @ ([ed89478](https://github.com/na-x-ril/onlynazril-patches/commit/ed89478829596c654ba616bd3c542111b09a484e))
* **TikTok - Handle:** Copy the full handle for ellipsized and comment names ([a984826](https://github.com/na-x-ril/onlynazril-patches/commit/a98482699bd1b911edefb747a5711f61b216dc9a))
* **TikTok - Handle:** Hold sometimes starts the 2x speed ([6039ee4](https://github.com/na-x-ril/onlynazril-patches/commit/6039ee4cccc1785e0e33a269904832125690d0d0))
* **TikTok - Resume playback:** Restore with a seek before the first frame ([4207513](https://github.com/na-x-ril/onlynazril-patches/commit/420751353cbd43d15c3c685a63d75f5808bc1a58))
* **TikTok - Resume playback:** Restore with TikTok's own continue gates ([de3ebd9](https://github.com/na-x-ril/onlynazril-patches/commit/de3ebd997b411511565030318d5af213875a2b74))
* **TikTok - Tweaks screen:** Read the installed version in About ([60bcc7d](https://github.com/na-x-ril/onlynazril-patches/commit/60bcc7def0cae2731a7c514fc8e1a277f038a4b6))
* **TikTok:** Keep mentions single-@ in comments ([06cf1a3](https://github.com/na-x-ril/onlynazril-patches/commit/06cf1a37b83aec6c79b0880494be07344411815a))

### ✨ New Features

* **TikTok - Custom font:** Carry the font in the backup ([b7f7ef5](https://github.com/na-x-ril/onlynazril-patches/commit/b7f7ef583806bf6a2288853c3149ec4f0b154b72))
* **TikTok - Custom font:** Keep imported fonts across installs ([ca54a0a](https://github.com/na-x-ril/onlynazril-patches/commit/ca54a0ac1c7209e99e4b81555f0926bd6c2064e7))
* **TikTok - Feature flags:** Hook every getter of the AB classes ([65fe7da](https://github.com/na-x-ril/onlynazril-patches/commit/65fe7dacd53ca193d6a39002e15e4ac3d027cb56))
* **TikTok - Feed search:** Add `Hide feed search suggestion` patch ([924e5b3](https://github.com/na-x-ril/onlynazril-patches/commit/924e5b3030484d10a20e9109f26a1d235eed5db8))
* **TikTok - Handle:** Copy the handle on hold ([d2fa6d4](https://github.com/na-x-ril/onlynazril-patches/commit/d2fa6d4881ed2faf4bc0ae307c5dfe1d527625f1))
* **TikTok - Handle:** Show time and region on comment polls ([f87834c](https://github.com/na-x-ril/onlynazril-patches/commit/f87834ccce6295a018d55d74f95d32ac48c40433))
* **TikTok - Handle:** Warn when a long date pattern crowds the name ([372519c](https://github.com/na-x-ril/onlynazril-patches/commit/372519cc82bf7566486eead1e8cdd03bc5b7f644))
* **TikTok - Resume playback:** Give the saved position to the play request ([77585c0](https://github.com/na-x-ril/onlynazril-patches/commit/77585c0bcfaa54825b618557fab3569c90af0554))
* **TikTok - Settings backup:** Carry the flag overrides ([7712699](https://github.com/na-x-ril/onlynazril-patches/commit/771269938777eb28b4a0e9d53e3a8334619ecc87))
* **TikTok - Speed up only:** Hold like and comment for 2x only ([20c936f](https://github.com/na-x-ril/onlynazril-patches/commit/20c936f8223ad1b0f9baf460af6bb2b4da76d342))
* **TikTok - Tweaks screen:** Let a row tap work its control ([aa0b3a9](https://github.com/na-x-ril/onlynazril-patches/commit/aa0b3a996d9e803e47513bc0151ba97d2132ead8))
* **TikTok:** Add a feature flags override patch ([35c6991](https://github.com/na-x-ril/onlynazril-patches/commit/35c69915f797e1e23b0a6b2eba307d2e00becdf2))
* **TikTok:** Add a verbose diagnostics switch ([bb854e6](https://github.com/na-x-ril/onlynazril-patches/commit/bb854e617f7f336bb905ecc4f64b346529e32d51))
* **TikTok:** Put every extension log behind the diagnostics switch ([d9c9457](https://github.com/na-x-ril/onlynazril-patches/commit/d9c94578742139497333380e2f1282040c721021))
* **TikTok:** Target 47.8.3 ([b58948d](https://github.com/na-x-ril/onlynazril-patches/commit/b58948db76ff4f9fe9a0b34d856100189d0c52bc))
* **TikTok:** Target 47.9.1 and simplify anchors ([da81ebc](https://github.com/na-x-ril/onlynazril-patches/commit/da81ebc49fd75e34f576d5d5ec9e8fa771b9588f))
* **TikTok:** Target 47.9.x and 48.0.x ([91d5fca](https://github.com/na-x-ril/onlynazril-patches/commit/91d5fcaeed8ed04d00ecdae4974078c4395bcee4))

### 🚀 Updated App Support

* **TikTok:** Add support for `47.9.2` and `47.9.3` ([25d2e8c](https://github.com/na-x-ril/onlynazril-patches/commit/25d2e8c156ad0ea8b3ffce025b20a4a52ed16347))

### 🔧 Improvements

* **TikTok - Custom font:** Warm the font switch off the launch path ([388f487](https://github.com/na-x-ril/onlynazril-patches/commit/388f4874a3244d2b8cc85ae8a141f98fec06df78))
* **TikTok:** Cut logging and lookups from the render path ([09d684a](https://github.com/na-x-ril/onlynazril-patches/commit/09d684a3871471cc2c02771cfa5ad9783a4cdd67))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.7.0-dev.6](https://github.com/na-x-ril/onlynazril-patches/compare/v1.7.0-dev.5...v1.7.0-dev.6) (2026-11-27)

### ✨ New Features

* **TikTok - Custom font:** Carry the font in the backup ([b7f7ef5](https://github.com/na-x-ril/onlynazril-patches/commit/b7f7ef583806bf6a2288853c3149ec4f0b154b72))
* **TikTok - Speed up only:** Hold like and comment for 2x only ([20c936f](https://github.com/na-x-ril/onlynazril-patches/commit/20c936f8223ad1b0f9baf460af6bb2b4da76d342))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.7.0-dev.5](https://github.com/na-x-ril/onlynazril-patches/compare/v1.7.0-dev.4...v1.7.0-dev.5) (2026-11-26)

### 🐛 Bug Fixes

* **TikTok - Handle stamp:** Keep a single leading @ ([ed89478](https://github.com/na-x-ril/onlynazril-patches/commit/ed89478829596c654ba616bd3c542111b09a484e))
* **TikTok - Resume playback:** Restore with a seek before the first frame ([4207513](https://github.com/na-x-ril/onlynazril-patches/commit/420751353cbd43d15c3c685a63d75f5808bc1a58))
* **TikTok - Resume playback:** Restore with TikTok's own continue gates ([de3ebd9](https://github.com/na-x-ril/onlynazril-patches/commit/de3ebd997b411511565030318d5af213875a2b74))
* **TikTok - Tweaks screen:** Read the installed version in About ([60bcc7d](https://github.com/na-x-ril/onlynazril-patches/commit/60bcc7def0cae2731a7c514fc8e1a277f038a4b6))

### ✨ New Features

* **TikTok - Feature flags:** Hook every getter of the AB classes ([65fe7da](https://github.com/na-x-ril/onlynazril-patches/commit/65fe7dacd53ca193d6a39002e15e4ac3d027cb56))
* **TikTok - Settings backup:** Carry the flag overrides ([7712699](https://github.com/na-x-ril/onlynazril-patches/commit/771269938777eb28b4a0e9d53e3a8334619ecc87))
* **TikTok - Tweaks screen:** Let a row tap work its control ([aa0b3a9](https://github.com/na-x-ril/onlynazril-patches/commit/aa0b3a996d9e803e47513bc0151ba97d2132ead8))
* **TikTok:** Add a feature flags override patch ([35c6991](https://github.com/na-x-ril/onlynazril-patches/commit/35c69915f797e1e23b0a6b2eba307d2e00becdf2))
* **TikTok:** Target 47.9.x and 48.0.x ([91d5fca](https://github.com/na-x-ril/onlynazril-patches/commit/91d5fcaeed8ed04d00ecdae4974078c4395bcee4))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.7.0-dev.4](https://github.com/na-x-ril/onlynazril-patches/compare/v1.7.0-dev.3...v1.7.0-dev.4) (2026-11-25)

### ✨ New Features

* **TikTok - Resume playback:** Give the saved position to the play request ([77585c0](https://github.com/na-x-ril/onlynazril-patches/commit/77585c0bcfaa54825b618557fab3569c90af0554))
* **TikTok:** Put every extension log behind the diagnostics switch ([d9c9457](https://github.com/na-x-ril/onlynazril-patches/commit/d9c94578742139497333380e2f1282040c721021))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.7.0-dev.3](https://github.com/na-x-ril/onlynazril-patches/compare/v1.7.0-dev.2...v1.7.0-dev.3) (2026-11-23)

### 🐛 Bug Fixes

* **TikTok - Feed filter:** Filter whole pages, keep links and open one ([c71af3b](https://github.com/na-x-ril/onlynazril-patches/commit/c71af3bdbd18d4f666d724b00d11765e30a59b10))
* **TikTok - Feed filter:** Keep one video when a page filters to nothing ([259a681](https://github.com/na-x-ril/onlynazril-patches/commit/259a681b52ac8fabd2f76466609edc53e383f6df))

### ✨ New Features

* **TikTok - Custom font:** Keep imported fonts across installs ([ca54a0a](https://github.com/na-x-ril/onlynazril-patches/commit/ca54a0ac1c7209e99e4b81555f0926bd6c2064e7))
* **TikTok:** Add a verbose diagnostics switch ([bb854e6](https://github.com/na-x-ril/onlynazril-patches/commit/bb854e617f7f336bb905ecc4f64b346529e32d51))

### 🔧 Improvements

* **TikTok - Custom font:** Warm the font switch off the launch path ([388f487](https://github.com/na-x-ril/onlynazril-patches/commit/388f4874a3244d2b8cc85ae8a141f98fec06df78))
* **TikTok:** Cut logging and lookups from the render path ([09d684a](https://github.com/na-x-ril/onlynazril-patches/commit/09d684a3871471cc2c02771cfa5ad9783a4cdd67))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.7.0-dev.2](https://github.com/na-x-ril/onlynazril-patches/compare/v1.7.0-dev.1...v1.7.0-dev.2) (2026-11-22)

### 🐛 Bug Fixes

* **TikTok - Feed filter:** Cached videos bypass the range filter ([fdf2208](https://github.com/na-x-ril/onlynazril-patches/commit/fdf22089314e1253378c4719a12b5d526b3d72ff))
* **TikTok - Handle:** Copy the full handle for ellipsized and comment names ([a984826](https://github.com/na-x-ril/onlynazril-patches/commit/a98482699bd1b911edefb747a5711f61b216dc9a))
* **TikTok - Handle:** Hold sometimes starts the 2x speed ([6039ee4](https://github.com/na-x-ril/onlynazril-patches/commit/6039ee4cccc1785e0e33a269904832125690d0d0))
* **TikTok:** Keep mentions single-@ in comments ([06cf1a3](https://github.com/na-x-ril/onlynazril-patches/commit/06cf1a37b83aec6c79b0880494be07344411815a))

### ✨ New Features

* **TikTok - Feed search:** Add `Hide feed search suggestion` patch ([924e5b3](https://github.com/na-x-ril/onlynazril-patches/commit/924e5b3030484d10a20e9109f26a1d235eed5db8))
* **TikTok - Handle:** Copy the handle on hold ([d2fa6d4](https://github.com/na-x-ril/onlynazril-patches/commit/d2fa6d4881ed2faf4bc0ae307c5dfe1d527625f1))
* **TikTok - Handle:** Show time and region on comment polls ([f87834c](https://github.com/na-x-ril/onlynazril-patches/commit/f87834ccce6295a018d55d74f95d32ac48c40433))
* **TikTok - Handle:** Warn when a long date pattern crowds the name ([372519c](https://github.com/na-x-ril/onlynazril-patches/commit/372519cc82bf7566486eead1e8cdd03bc5b7f644))

### 🚀 Updated App Support

* **TikTok:** Add support for `47.9.2` and `47.9.3` ([25d2e8c](https://github.com/na-x-ril/onlynazril-patches/commit/25d2e8c156ad0ea8b3ffce025b20a4a52ed16347))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.7.0-dev.1](https://github.com/na-x-ril/onlynazril-patches/compare/v1.6.0...v1.7.0-dev.1) (2026-11-18)

### ✨ New Features

* **TikTok:** Target 47.8.3 ([b58948d](https://github.com/na-x-ril/onlynazril-patches/commit/b58948db76ff4f9fe9a0b34d856100189d0c52bc))
* **TikTok:** Target 47.9.1 and simplify anchors ([da81ebc](https://github.com/na-x-ril/onlynazril-patches/commit/da81ebc49fd75e34f576d5d5ec9e8fa771b9588f))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.6.0](https://github.com/na-x-ril/onlynazril-patches/compare/v1.5.0...v1.6.0) (2026-11-15)

### 🐛 Bug Fixes

* **release:** Drop bogus closes and add Morphe link ([fc57eed](https://github.com/na-x-ril/onlynazril-patches/commit/fc57eed1dd48fc6b8786f2409b8bcb4d4435c8a4))
* **TikTok - Feed filter:** Ads still appear in the detail feed ([bcdc603](https://github.com/na-x-ril/onlynazril-patches/commit/bcdc603f3d43ab42df88471e84f726a41ca31039))
* **TikTok - Feed filter:** Keep LIVE and drama items on shared lists ([f08e51b](https://github.com/na-x-ril/onlynazril-patches/commit/f08e51ba07b23383d3f7d7a0d5059e7a454a5cd0))
* **TikTok - Resume playback:** Replace record helper that crashes the extension ([1e7175f](https://github.com/na-x-ril/onlynazril-patches/commit/1e7175fcb9965ed22bf083aef72b3c9a809c6a5b))
* **TikTok/About:** Keep diagnostics text after copy ([0f6e7be](https://github.com/na-x-ril/onlynazril-patches/commit/0f6e7be94f5b7372786e9b91e7b92f74b5b7bc8f))

### ✨ New Features

* **TikTok - Feed filter:** Add survey, LIVE and drama filters and date formats ([b3b2163](https://github.com/na-x-ril/onlynazril-patches/commit/b3b2163f8e15dba5fb9eedceebd201883b7b5a8c))
* **TikTok - Handle, time & region:** Date comments, week ages and a clock ([19c80ef](https://github.com/na-x-ril/onlynazril-patches/commit/19c80efdd3bf010848a8bce0a95d106a15bf4ad0))
* **TikTok - Handle, time & region:** Prove reply handles by uid ([8a91e11](https://github.com/na-x-ril/onlynazril-patches/commit/8a91e113368c071ebf68c559abf17977a7558d06))
* **TikTok - Keep screen on:** Keep the display awake in the app ([066bf4c](https://github.com/na-x-ril/onlynazril-patches/commit/066bf4ce74ae55896e330359aa796c02e065fd31))
* **TikTok - Resume playback:** Add `Resume playback` patch ([1d0839f](https://github.com/na-x-ril/onlynazril-patches/commit/1d0839f5159c596baeb352b35c66eba6e0ff7930))
* **TikTok - Resume playback:** Track seek, completion and recovery states ([6036012](https://github.com/na-x-ril/onlynazril-patches/commit/6036012061d7f010cc6fe8059a2a1befcb1716b6))
* **TikTok - time-region:** Add localized time and settings ([15c4901](https://github.com/na-x-ril/onlynazril-patches/commit/15c4901a5785c4fbcaad95b73fdfbb9d8550772a))
* **TikTok - Tweaks:** Add a validated custom date pattern ([07f3c5f](https://github.com/na-x-ril/onlynazril-patches/commit/07f3c5f6d3788c89de4d1570bcd3998dcf2b2836))
* **TikTok - Tweaks:** Reset every switch to its default ([64ebb77](https://github.com/na-x-ril/onlynazril-patches/commit/64ebb77f3fdcd7c876196f19bc89e0e5c4f8b425))
* **TikTok - Tweaks:** Search every setting through the real rows ([b5322c7](https://github.com/na-x-ril/onlynazril-patches/commit/b5322c76a8802fe3beb33b438e2fabe81256417a))
* **TikTok/AMOLED:** One full patch, on by default ([8437a2a](https://github.com/na-x-ril/onlynazril-patches/commit/8437a2aec76406cdb41daf2885eb7a3e4d7114e1))
* **TikTok/Misc:** Add settings export and import ([af95b82](https://github.com/na-x-ril/onlynazril-patches/commit/af95b82bafbf6719be7957e3502c4af78e5eeee2))
* **TikTok/Pause image search:** Add a disable switch for both search surfaces ([3f7bf4d](https://github.com/na-x-ril/onlynazril-patches/commit/3f7bf4dd3882e0de858ac2b002022de78ecfe913))
* **TikTok/Refresh rate:** Add `App refresh rate` patch ([2d52929](https://github.com/na-x-ril/onlynazril-patches/commit/2d529294aa27af41b56a12e34e5beab37c7d9981))
* **TikTok/Tweaks:** Slide each page as one unit ([39d44c3](https://github.com/na-x-ril/onlynazril-patches/commit/39d44c3454d0b98be96f44f216cd607ddab3c646))
* **TikTok/Tweaks:** Split the screen into category pages ([712ec96](https://github.com/na-x-ril/onlynazril-patches/commit/712ec96c736e272c2badbb0b0a599a0d98a79435))
* **TikTok:** Target 47.7.3 ([84be440](https://github.com/na-x-ril/onlynazril-patches/commit/84be440a207237a6580fda9041dad18130567079))

### 🔧 Improvements

* **TikTok:** Resolve anchors from the patcher indexes ([763c920](https://github.com/na-x-ril/onlynazril-patches/commit/763c920b3d98f7f973a36689a2ccc108b7c536b1))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.6.0-dev.5](https://github.com/na-x-ril/onlynazril-patches/compare/v1.6.0-dev.4...v1.6.0-dev.5) (2026-11-12)

### ✨ New Features

* **TikTok - Handle, time & region:** Date comments, week ages and a clock ([19c80ef](https://github.com/na-x-ril/onlynazril-patches/commit/19c80efdd3bf010848a8bce0a95d106a15bf4ad0))
* **TikTok - Handle, time & region:** Prove reply handles by uid ([8a91e11](https://github.com/na-x-ril/onlynazril-patches/commit/8a91e113368c071ebf68c559abf17977a7558d06))
* **TikTok - Keep screen on:** Keep the display awake in the app ([066bf4c](https://github.com/na-x-ril/onlynazril-patches/commit/066bf4ce74ae55896e330359aa796c02e065fd31))
* **TikTok - Tweaks:** Add a validated custom date pattern ([07f3c5f](https://github.com/na-x-ril/onlynazril-patches/commit/07f3c5f6d3788c89de4d1570bcd3998dcf2b2836))
* **TikTok - Tweaks:** Reset every switch to its default ([64ebb77](https://github.com/na-x-ril/onlynazril-patches/commit/64ebb77f3fdcd7c876196f19bc89e0e5c4f8b425))
* **TikTok - Tweaks:** Search every setting through the real rows ([b5322c7](https://github.com/na-x-ril/onlynazril-patches/commit/b5322c76a8802fe3beb33b438e2fabe81256417a))
* **TikTok:** Target 47.7.3 ([84be440](https://github.com/na-x-ril/onlynazril-patches/commit/84be440a207237a6580fda9041dad18130567079))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.6.0-dev.4](https://github.com/na-x-ril/onlynazril-patches/compare/v1.6.0-dev.3...v1.6.0-dev.4) (2026-11-09)

### 🐛 Bug Fixes

* **TikTok - Feed filter:** Keep LIVE and drama items on shared lists ([f08e51b](https://github.com/na-x-ril/onlynazril-patches/commit/f08e51ba07b23383d3f7d7a0d5059e7a454a5cd0))

### ✨ New Features

* **TikTok - Resume playback:** Track seek, completion and recovery states ([6036012](https://github.com/na-x-ril/onlynazril-patches/commit/6036012061d7f010cc6fe8059a2a1befcb1716b6))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.6.0-dev.3](https://github.com/na-x-ril/onlynazril-patches/compare/v1.6.0-dev.2...v1.6.0-dev.3) (2026-11-09)

### 🐛 Bug Fixes

* **TikTok - Feed filter:** Ads still appear in the detail feed ([bcdc603](https://github.com/na-x-ril/onlynazril-patches/commit/bcdc603f3d43ab42df88471e84f726a41ca31039))
* **TikTok - Resume playback:** Replace record helper that crashes the extension ([1e7175f](https://github.com/na-x-ril/onlynazril-patches/commit/1e7175fcb9965ed22bf083aef72b3c9a809c6a5b))

### ✨ New Features

* **TikTok - Feed filter:** Add survey, LIVE and drama filters and date formats ([b3b2163](https://github.com/na-x-ril/onlynazril-patches/commit/b3b2163f8e15dba5fb9eedceebd201883b7b5a8c))
* **TikTok - Resume playback:** Add `Resume playback` patch ([1d0839f](https://github.com/na-x-ril/onlynazril-patches/commit/1d0839f5159c596baeb352b35c66eba6e0ff7930))
* **TikTok - time-region:** Add localized time and settings ([15c4901](https://github.com/na-x-ril/onlynazril-patches/commit/15c4901a5785c4fbcaad95b73fdfbb9d8550772a))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.6.0-dev.2](https://github.com/na-x-ril/onlynazril-patches/compare/v1.6.0-dev.1...v1.6.0-dev.2) (2026-11-07)

### 🐛 Bug Fixes

* **release:** Drop bogus closes and add Morphe link ([fc57eed](https://github.com/na-x-ril/onlynazril-patches/commit/fc57eed1dd48fc6b8786f2409b8bcb4d4435c8a4))


### [Add to Morphe](https://morphe.software/add-source?github=na-x-ril/onlynazril-patches)

## [1.6.0-dev.1](https://github.com/na-x-ril/onlynazril-patches/compare/v1.5.0...v1.6.0-dev.1) (2026-11-07)

### 🐛 Bug Fixes

* **TikTok/About:** Keep diagnostics text after copy ([0f6e7be](https://github.com/na-x-ril/onlynazril-patches/commit/0f6e7be94f5b7372786e9b91e7b92f74b5b7bc8f))

### ✨ New Features

* **TikTok/AMOLED:** One full patch, on by default ([8437a2a](https://github.com/na-x-ril/onlynazril-patches/commit/8437a2aec76406cdb41daf2885eb7a3e4d7114e1))
* **TikTok/Misc:** Add settings export and import ([af95b82](https://github.com/na-x-ril/onlynazril-patches/commit/af95b82bafbf6719be7957e3502c4af78e5eeee2))
* **TikTok/Pause image search:** Add a disable switch for both search surfaces ([3f7bf4d](https://github.com/na-x-ril/onlynazril-patches/commit/3f7bf4dd3882e0de858ac2b002022de78ecfe913)), closes [IPhotoSearchService#LJII](https://github.com/na-x-ril/IPhotoSearchService/issues/LJII)
* **TikTok/Refresh rate:** Add `App refresh rate` patch ([2d52929](https://github.com/na-x-ril/onlynazril-patches/commit/2d529294aa27af41b56a12e34e5beab37c7d9981)), closes [AwemeHostApplication#onCreate](https://github.com/na-x-ril/AwemeHostApplication/issues/onCreate) [Application#onCreate](https://github.com/na-x-ril/Application/issues/onCreate)
* **TikTok/Tweaks:** Slide each page as one unit ([39d44c3](https://github.com/na-x-ril/onlynazril-patches/commit/39d44c3454d0b98be96f44f216cd607ddab3c646))
* **TikTok/Tweaks:** Split the screen into category pages ([712ec96](https://github.com/na-x-ril/onlynazril-patches/commit/712ec96c736e272c2badbb0b0a599a0d98a79435))

### 🔧 Improvements

* **TikTok:** Resolve anchors from the patcher indexes ([763c920](https://github.com/na-x-ril/onlynazril-patches/commit/763c920b3d98f7f973a36689a2ccc108b7c536b1))

## [1.5.0](https://github.com/na-x-ril/onlynazril-patches/compare/v1.4.0...v1.5.0) (2026-11-05)

### 🐛 Bug Fixes

* **TikTok/Custom font:** Compose, Lynx and hybrid pages keep TikTok's own text ([b781efe](https://github.com/na-x-ril/onlynazril-patches/commit/b781efec61a6485c1c47526aa37b1cc8193409f9))
* **TikTok/Custom font:** Hybrid pages keep their own font ([c6745a6](https://github.com/na-x-ril/onlynazril-patches/commit/c6745a6db2499309d7445e4b2d7c564750b7b286))

### ✨ New Features

* **TikTok/AMOLED:** Add `AMOLED theme` patch ([b98f05a](https://github.com/na-x-ril/onlynazril-patches/commit/b98f05adfee202908c3e904f4de931cacc83ca04))
* **TikTok:** target 47.7.1 and 47.7.2 and open Tweaks from Home ([821adf9](https://github.com/na-x-ril/onlynazril-patches/commit/821adf9ce4e91cf048f62662253e957f755c1b63))

## [1.5.0-dev.1](https://github.com/na-x-ril/onlynazril-patches/compare/v1.4.0...v1.5.0-dev.1) (2026-11-05)

### 🐛 Bug Fixes

* **TikTok/Custom font:** Compose, Lynx and hybrid pages keep TikTok's own text ([b781efe](https://github.com/na-x-ril/onlynazril-patches/commit/b781efec61a6485c1c47526aa37b1cc8193409f9))
* **TikTok/Custom font:** Hybrid pages keep their own font ([c6745a6](https://github.com/na-x-ril/onlynazril-patches/commit/c6745a6db2499309d7445e4b2d7c564750b7b286))

### ✨ New Features

* **TikTok/AMOLED:** Add `AMOLED theme` patch ([b98f05a](https://github.com/na-x-ril/onlynazril-patches/commit/b98f05adfee202908c3e904f4de931cacc83ca04))
* **TikTok:** target 47.7.1 and 47.7.2 and open Tweaks from Home ([821adf9](https://github.com/na-x-ril/onlynazril-patches/commit/821adf9ce4e91cf048f62662253e957f755c1b63))

## [1.4.0](https://github.com/na-x-ril/onlynazril-patches/compare/v1.3.0...v1.4.0) (2026-10-11)

### ✨ New Features

* draw TikTok's text with an imported font ([98ff010](https://github.com/na-x-ril/onlynazril-patches/commit/98ff010e6fcf7e5495dd5cf4e7737de43f0f9a64))
* **TikTok/Captcha:** Add `Hide CAPTCHA popups` patch ([6e4d708](https://github.com/na-x-ril/onlynazril-patches/commit/6e4d7080e94ead3dc882b0dd75a223d99aaa5956))
* **TikTok/Comment copy:** Add `Copy comments without username` patch ([44f40ba](https://github.com/na-x-ril/onlynazril-patches/commit/44f40baedbbb7541e3bc32f2539876abe03b5cd6)), closes [Comment#getText](https://github.com/na-x-ril/Comment/issues/getText) [Comment#getUser](https://github.com/na-x-ril/Comment/issues/getUser)

## [1.4.0-dev.2](https://github.com/na-x-ril/onlynazril-patches/compare/v1.4.0-dev.1...v1.4.0-dev.2) (2026-10-11)

### ✨ New Features

* **TikTok/Captcha:** Add `Hide CAPTCHA popups` patch ([6e4d708](https://github.com/na-x-ril/onlynazril-patches/commit/6e4d7080e94ead3dc882b0dd75a223d99aaa5956))
* **TikTok/Comment copy:** Add `Copy comments without username` patch ([44f40ba](https://github.com/na-x-ril/onlynazril-patches/commit/44f40baedbbb7541e3bc32f2539876abe03b5cd6)), closes [Comment#getText](https://github.com/na-x-ril/Comment/issues/getText) [Comment#getUser](https://github.com/na-x-ril/Comment/issues/getUser)

## [1.4.0-dev.1](https://github.com/na-x-ril/onlynazril-patches/compare/v1.3.0...v1.4.0-dev.1) (2026-10-07)

### ✨ New Features

* draw TikTok's text with an imported font ([98ff010](https://github.com/na-x-ril/onlynazril-patches/commit/98ff010e6fcf7e5495dd5cf4e7737de43f0f9a64))

## [1.3.0](https://github.com/na-x-ril/onlynazril-patches/compare/v1.2.0...v1.3.0) (2026-10-04)

### 🐛 Bug Fixes

* keep the Tweaks screen clear of the system bars ([b9791b0](https://github.com/na-x-ril/onlynazril-patches/commit/b9791b034df9392de6d56b8aad69f82b4e684a17))
* record what the download feature measured on a device ([366e8ab](https://github.com/na-x-ril/onlynazril-patches/commit/366e8abd068e7000cae2d580ed66ddbfb859bece))
* the region survives the app writing the post time again ([3bffc83](https://github.com/na-x-ril/onlynazril-patches/commit/3bffc8346d54e228ccbe4080bb5032c835c9ad40)), closes [X.098X#invoke](https://github.com/na-x-ril/X.098X/issues/invoke)
* the reply line uses the handle the comment list already carried ([47f21ff](https://github.com/na-x-ril/onlynazril-patches/commit/47f21ffbdbbf03faf4ca2ef6b497770bd63de299))

### ✨ New Features

* one prompt component, and a log that keeps writing ([c8a928d](https://github.com/na-x-ril/onlynazril-patches/commit/c8a928db6056854a68f7b05b49c9230a394bd8b3))
* save the media from the share sheet, without the watermark ([4ed620b](https://github.com/na-x-ril/onlynazril-patches/commit/4ed620b67191a99a09c5ac8662cee2982ce4bcea)), closes [Video#getDownloadAddr](https://github.com/na-x-ril/Video/issues/getDownloadAddr)
* set a profile background on accounts the rollout has not reached ([4e165c5](https://github.com/na-x-ril/onlynazril-patches/commit/4e165c52a3ce61f002e7aebb2d109aef1f8eabcc))
* the download and profile background switches, and the 47.1.4 target ([5efd33b](https://github.com/na-x-ril/onlynazril-patches/commit/5efd33b3f8f0fa5310b7979a946044a982bc615f))

## [1.3.0-dev.3](https://github.com/na-x-ril/onlynazril-patches/compare/v1.3.0-dev.2...v1.3.0-dev.3) (2026-10-04)

### 🐛 Bug Fixes

* record what the download feature measured on a device ([366e8ab](https://github.com/na-x-ril/onlynazril-patches/commit/366e8abd068e7000cae2d580ed66ddbfb859bece))


## [1.3.0-dev.2](https://github.com/na-x-ril/onlynazril-patches/compare/v1.3.0-dev.1...v1.3.0-dev.2) (2026-10-02)

### ✨ New Features

* the download and profile background switches, and the 47.1.4 target ([5efd33b](https://github.com/na-x-ril/onlynazril-patches/commit/5efd33b3f8f0fa5310b7979a946044a982bc615f))

## [1.3.0-dev.1](https://github.com/na-x-ril/onlynazril-patches/compare/v1.2.1-dev.2...v1.3.0-dev.1) (2026-10-02)

### 🐛 Bug Fixes

* keep the Tweaks screen clear of the system bars ([b9791b0](https://github.com/na-x-ril/onlynazril-patches/commit/b9791b034df9392de6d56b8aad69f82b4e684a17))

### ✨ New Features

* one prompt component, and a log that keeps writing ([c8a928d](https://github.com/na-x-ril/onlynazril-patches/commit/c8a928db6056854a68f7b05b49c9230a394bd8b3))
* save the media from the share sheet, without the watermark ([4ed620b](https://github.com/na-x-ril/onlynazril-patches/commit/4ed620b67191a99a09c5ac8662cee2982ce4bcea)), closes [Video#getDownloadAddr](https://github.com/na-x-ril/Video/issues/getDownloadAddr)
* set a profile background on accounts the rollout has not reached ([4e165c5](https://github.com/na-x-ril/onlynazril-patches/commit/4e165c52a3ce61f002e7aebb2d109aef1f8eabcc))

## [1.2.1-dev.2](https://github.com/na-x-ril/onlynazril-patches/compare/v1.2.1-dev.1...v1.2.1-dev.2) (2026-09-30)

### 🐛 Bug Fixes

* the reply line uses the handle the comment list already carried ([47f21ff](https://github.com/na-x-ril/onlynazril-patches/commit/47f21ffbdbbf03faf4ca2ef6b497770bd63de299))

## [1.2.1-dev.1](https://github.com/na-x-ril/onlynazril-patches/compare/v1.2.0...v1.2.1-dev.1) (2026-09-30)

### 🐛 Bug Fixes

* the region survives the app writing the post time again ([3bffc83](https://github.com/na-x-ril/onlynazril-patches/commit/3bffc8346d54e228ccbe4080bb5032c835c9ad40)), closes [X.098X#invoke](https://github.com/na-x-ril/X.098X/issues/invoke)

## [1.2.0](https://github.com/na-x-ril/onlynazril-patches/compare/v1.1.0...v1.2.0) (2026-09-29)

### ✨ New Features

* filter the feed by ads and by view or like counts ([97874bc](https://github.com/na-x-ril/onlynazril-patches/commit/97874bc42c4c7a5e9efd3d7ba524e3c08268828e)), closes [FeedItemList#setItems](https://github.com/na-x-ril/FeedItemList/issues/setItems) [FeedItemList#clone](https://github.com/na-x-ril/FeedItemList/issues/clone) [X.07zq#getData](https://github.com/na-x-ril/X.07zq/issues/getData)

## [1.2.0-dev.1](https://github.com/na-x-ril/onlynazril-patches/compare/v1.1.0...v1.2.0-dev.1) (2026-09-29)

### ✨ New Features

* filter the feed by ads and by view or like counts ([97874bc](https://github.com/na-x-ril/onlynazril-patches/commit/97874bc42c4c7a5e9efd3d7ba524e3c08268828e)), closes [FeedItemList#setItems](https://github.com/na-x-ril/FeedItemList/issues/setItems) [FeedItemList#clone](https://github.com/na-x-ril/FeedItemList/issues/clone) [X.07zq#getData](https://github.com/na-x-ril/X.07zq/issues/getData)

## [1.1.0](https://github.com/na-x-ril/onlynazril-patches/compare/v1.0.0...v1.1.0) (2026-09-25)

### 🐛 Bug Fixes

* post time off now removes the time as well ([aa7506b](https://github.com/na-x-ril/onlynazril-patches/commit/aa7506b6e66131f04b852675c6afcadd65cd92c4))

### ✨ New Features

* ask for one restart after the app is patched ([d9fb024](https://github.com/na-x-ril/onlynazril-patches/commit/d9fb024d0c12c3f04597e71933a1da5c41e527da))
* draw the restart prompt from the screen's own palette ([c4029c5](https://github.com/na-x-ril/onlynazril-patches/commit/c4029c5a82299e77d69f2e3c1495d0427eaa4d80))
* restart with a fresh task, and a control for it ([e1c0f4b](https://github.com/na-x-ril/onlynazril-patches/commit/e1c0f4bc85dfc16ef4fa43dbaa1b41343c92554f))

## [1.1.0-dev.1](https://github.com/na-x-ril/onlynazril-patches/compare/v1.0.0...v1.1.0-dev.1) (2026-09-25)

### 🐛 Bug Fixes

* post time off now removes the time as well ([aa7506b](https://github.com/na-x-ril/onlynazril-patches/commit/aa7506b6e66131f04b852675c6afcadd65cd92c4))

### ✨ New Features

* ask for one restart after the app is patched ([d9fb024](https://github.com/na-x-ril/onlynazril-patches/commit/d9fb024d0c12c3f04597e71933a1da5c41e527da))
* draw the restart prompt from the screen's own palette ([c4029c5](https://github.com/na-x-ril/onlynazril-patches/commit/c4029c5a82299e77d69f2e3c1495d0427eaa4d80))
* restart with a fresh task, and a control for it ([e1c0f4b](https://github.com/na-x-ril/onlynazril-patches/commit/e1c0f4bc85dfc16ef4fa43dbaa1b41343c92554f))

# Changelog

All notable changes to this project are documented in this file. It is written by semantic-release
when a release is published — do not edit it by hand.
