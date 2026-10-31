## [1.31.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.30.1...v1.31.0) (2026-10-30)

### ⚠ BREAKING CHANGES

* **word:** drop Word patch target
* **powerpoint:** drop PowerPoint patch target

### New Features

* **powerpoint:** drop PowerPoint patch target ([4350310](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4350310a23a01e9a43d5ee4e29c92c483b15cddc))
* **word:** drop Word patch target ([b2e054f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/b2e054f07338fe34c39a62c8c29d00e93ebde638))

## [1.30.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.30.0...v1.30.1) (2026-10-28)

### Bug Fixes

* **capcut:** align embedded EnvGuard certificate hash with repack signing key ([32ed60c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/32ed60cf0ba4977a907d2eb0bc1f800aeccd2863))
* **capcut:** block unsafe-modal verdict by replacing cracking interceptor at registration ([0280683](https://github.com/kveld9/kveld-extra-morphe-patches/commit/028068392ef6c6bb9f8b7872dc8715ec1a358a24))
* **capcut:** restore published behavior that showed no unsafe modal ([74a1d6d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/74a1d6d812dce922ad53956e7fba5d54f495e282))
* **capcut:** revert cracking-interceptor swap that triggered the unsafe modal ([4c6b523](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4c6b523b8c2b4d55b22f812914114cceaf2e845e))
* **capcut:** use a per-install effects ID to avoid shared throttling ([ee43df4](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ee43df4af289e79493b4604e74f93fb82f22bde4))
* **word:** neutralize Office early-telemetry dispatch to prevent native null-deref crashes ([721ae2a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/721ae2af515583bd3a3b17a0f45502d5b88b26ab))
* **word:** restore aggregation timer to keep native timer callback consistent ([d6b2e05](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d6b2e0512f4b6f8573c6470a0b147cafd495fc77))

## [1.30.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.29.0...v1.30.0) (2026-10-27)

### New Features

* **moovit:** add Places API (New) search patch ([72d57fb](https://github.com/kveld9/kveld-extra-morphe-patches/commit/72d57fb96d1afdc70b8fe18353f47553582b4a87))

## [1.29.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.28.0...v1.29.0) (2026-10-27)

### ⚠ BREAKING CHANGES

* **officehub:** drop Microsoft 365 patch target

### Bug Fixes

* **test:** reject unsafe archive entry names in patch test runner ([8f2e06c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/8f2e06c05d6a62b3d7378504b9f118fcf1c56ca7))

### New Features

* **capcut:** neutralize Google Play Billing for devices without GMS ([4e583ae](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4e583aeb6c40f07c3f5a19b0e26ea7965b5ba27f))
* **officehub:** drop Microsoft 365 patch target ([04549ec](https://github.com/kveld9/kveld-extra-morphe-patches/commit/04549ecb1677478182c7351831267438516f224c))

## [1.28.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.27.1...v1.28.0) (2026-10-26)

### Bug Fixes

* **ci:** close all orphan matching issues instead of only first ([caa123f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/caa123f8dc5b6d443073c042e9ddc5b83f41be42))
* **ci:** roll forward stale update issues to the latest upstream version ([6f4006d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6f4006dbca5ae4dc3bc69c29e026c725614b4c26))
* **ibispaint:** fail loudly when native binary is missing instead of reporting false success ([e9b5287](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e9b528762220d000462c5321ad255c9818d35709))
* **moovit:** update supported version to 5.203.0.1812 ([614e473](https://github.com/kveld9/kveld-extra-morphe-patches/commit/614e4732794852b5a99591373b98352f2adc4fc5))
* **moovit:** update suppress paywalls hooks for 5.203.0.1812 ([c41eebc](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c41eebc47a22e6e2b1748e910aef5228fae39c87))
* **moovit:** update unlock plus hook for 5.203.0.1812 ([a8a7635](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a8a7635a9fb1e9fe2d51afc7775201b4df1986be))
* **test:** derive candidate APK names from target version constants ([071f0b8](https://github.com/kveld9/kveld-extra-morphe-patches/commit/071f0b8e0e4f0008b83b22ea12a09130e388c184))
* **test:** restrict IbisPaint filename pattern against foreign stubs ([c1fbc34](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c1fbc34650c06edf9705739f5edeed7b00483bc2))
* **twitter:** update supported version to 12.37.2-prod.01 ([d07e0b4](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d07e0b48ae009cffef4ca38b56a2fb80468e41ff))
* **word:** anchor storage quota check fingerprint to unified storage package ([d0499b5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d0499b585447fcbf9ce1ca5090833f8e93105ab6))
* **word:** correct first-run detection fingerprint for Word 16.0.20527.20034 ([47f95e6](https://github.com/kveld9/kveld-extra-morphe-patches/commit/47f95e65813caba90d7b3c97e25dddad2eb1ec17))
* **word:** dynamically resolve identity register in account switcher patch ([430e91d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/430e91d51e4e85bc3fb46c1328aae0399ba078cf))
* **word:** hook license check callback for Word 16.0.20527.20034 ([27734e9](https://github.com/kveld9/kveld-extra-morphe-patches/commit/27734e92beb476701f6b40a9b1596e0c7669237a))

### New Features

* **ibispaint:** add Enable Prime membership patch for IbisPaint X 14.1.2 ([5e34f24](https://github.com/kveld9/kveld-extra-morphe-patches/commit/5e34f24d1f7af5e3d03445de3aca808e3dcbdd04))
* **word:** add Word target with Unlock 365 Family patch ([0c7b85b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0c7b85b143ad157764b726d4ec135c8b59a38a4d))
* **word:** block telemetry and tracking SDKs ([0eb85af](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0eb85afac7facf8a9fd30d0e55837a7c15099074))
* **word:** bypass code transparency checks on Word ([3187666](https://github.com/kveld9/kveld-extra-morphe-patches/commit/3187666abfbb717daa370c53207b9db799355e84))
* **word:** register Word in APKMirror update checker ([e6c2e66](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e6c2e664b8651d1f6c37fe3915449a5e8fe15324))
* **word:** remove login requirement and first-run paywalls ([384fd5d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/384fd5d11ab69846f2ab1979ccfaf50c8c975cc1))
* **word:** remove shared user ID to allow side-by-side Office installs ([feb4241](https://github.com/kveld9/kveld-extra-morphe-patches/commit/feb42416ccd38a3e6a5e68bf8e6a4a147b156c25))

## [1.27.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.27.0...v1.27.1) (2026-10-25)

### Bug Fixes

* **moovit:** scope lint suppressions on signing-info reflection ([7e6a399](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7e6a399ee2aab2fd91dffc8ed72847a94fac7f53))
* **moovit:** trim whitespace from mapsApiKey before injection ([0f10a0a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0f10a0a044507585a8ef573eca707ef407853e10))

### Code Refactoring

* **moovit:** derive package name from Application in extension helper ([090e557](https://github.com/kveld9/kveld-extra-morphe-patches/commit/090e557a9449408514d508e47a8a43fd51129204))

## [1.27.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.26.2...v1.27.0) (2026-10-24)

### Bug Fixes

* **moovit:** diagnose signingInfo spoof status in maps verdict ([0df1a05](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0df1a05f41779d6f7f2d575c31d7367965c9695e))
* **moovit:** report maps signature spoof status instead of failing silently ([30f2d16](https://github.com/kveld9/kveld-extra-morphe-patches/commit/30f2d169917eee5ef54d353c0b1a5c459a9bfbf4))
* **moovit:** require personal Google Maps API key with setup guide ([4564b96](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4564b966065ec1141b07a02234d9fcc3a64fb1b2))

### New Features

* **capcut:** use alternate endpoints for effects and feeds where blocked ([29b82e8](https://github.com/kveld9/kveld-extra-morphe-patches/commit/29b82e8d8be0d1d559e63cc75a0abb1182c93232))
* **moovit:** add opt-in toggle to force Google Maps engine ([d313a33](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d313a33c1f10b5f7a52c137da3982ac12745a4c6))

## [1.26.2](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.26.1...v1.26.2) (2026-10-24)

### Bug Fixes

* **capcut:** block APM, Gecko, Pitaya and BDTuring telemetry dispatchers ([70c7e5d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/70c7e5d3d51343bb9e30ca744b7f2afedaab94cb))
* **capcut:** restore Add-to-editor flow when starting a new project ([513dc82](https://github.com/kveld9/kveld-extra-morphe-patches/commit/513dc823c727c6d1b661849dbb4d785cbc703618))
* **capcut:** stub Pangle PGL signature verification gates ([951ac52](https://github.com/kveld9/kveld-extra-morphe-patches/commit/951ac52526b33aef2119730d57842060897398c6))
* **capcut:** suppress default ending outro on export ([d321f89](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d321f893f4e5d2f7873aa56129da6f5f36676fac))

## [1.26.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.26.0...v1.26.1) (2026-10-22)

### Bug Fixes

* **capcut:** update target to 19.9.0 ([88f462c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/88f462c9be2c187fa897f19b2b0014b545962ecc))
* **hevy:** make billing stub fail loudly if Play library changes ([a1a4c41](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a1a4c418c139f924314a8789c4f837f6c06745f2))
* **hevy:** update in-app billing connection hook for 3.2.2 ([ffa11b5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ffa11b59f9088853d0169e0f95b7405ac518c9b7))
* **hevy:** update supported version to 3.2.2 ([0ab1635](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0ab163517f4c4a2d3335fae0966772410d8d4462))
* **hevy:** update telemetry and tracking hooks for 3.2.2 ([7f86566](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7f865661372850d91c9c916416c57dc6e84a9253))
* **twitter:** support version 12.36.1-prod.01 ([4229ffb](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4229ffb2c614be97bb206c04385b976de2dff53d))

## [1.26.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.25.2...v1.26.0) (2026-10-22)

### Bug Fixes

* **capcut:** stop the security notice returning through the template feed ([0d7ab27](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0d7ab2787e3b5e5575b6d540c0e0839080d06736))
* **harness:** ignore abandoned Xiaomi 9.x branch in update checker ([6d644bd](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6d644bd09d43a960b1c3d6b4299c2fc0db957475))
* **lrmobile:** drop Lightroom support because no compatible download remains ([d92d5e0](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d92d5e0855d9563defdb2e3b85d525ae0361025e))
* **multiaccounts:** drop Multiple Accounts support, protectors kill any patched build ([08c821c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/08c821c06b8d224c194e425505aaec0b78cf92ff))
* **multiaccounts:** keep the app alive on launch by completing first-run setup silently ([114b3aa](https://github.com/kveld9/kveld-extra-morphe-patches/commit/114b3aa2d49707e412d8c41cd44ef6940830221c))
* **multiaccounts:** remove sideload-compat hooks that killed the app at startup ([c720c17](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c720c174d97c640b0c2f59c161be2298df408cbe))

### New Features

* **harness:** include exact variant download link in update issues ([0d26135](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0d261357bb51dee15cdd37305e88ec14a885f44e))

### Code Refactoring

* **harness:** remove unused Uptodown support from the update checker ([8945d72](https://github.com/kveld9/kveld-extra-morphe-patches/commit/8945d72b3ca12329bab715193be1209deb9b4e98))

## [1.25.2](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.25.1...v1.25.2) (2026-10-21)

### Bug Fixes

* **twitter:** document the manifest purge as the telemetry setup patch ([#20](https://github.com/kveld9/kveld-extra-morphe-patches/issues/20)) ([5e05106](https://github.com/kveld9/kveld-extra-morphe-patches/commit/5e05106b91c37ca19e8269eaa7f322d92b509c12))

## [1.25.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.25.0...v1.25.1) (2026-10-21)

### Bug Fixes

* **capcut:** stub cracking verdict persistence and security dialog render ([4c57aee](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4c57aee29e3496c796630772cc9aae865b2b0c3e))
* **officehub:** keep the app launching when custom blocked hosts are set ([cf3a2c1](https://github.com/kveld9/kveld-extra-morphe-patches/commit/cf3a2c1c8bc80345b824ccf7b9ec726e1bd71abe))
* **sdmse:** stop the patched app from crashing at launch on Android 16 ([816c011](https://github.com/kveld9/kveld-extra-morphe-patches/commit/816c01150653611ab9b5df866f14d54876a38269))

## [1.25.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.24.0...v1.25.0) (2026-10-21)

### Bug Fixes

* **multiaccounts:** document TikTok Business SDK tracking removal ([8614c5c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/8614c5c29bdf94c2f18015d40cb1fb122403020a))
* **multiaccounts:** keep static-data provider enabled so the app can start ([30248a8](https://github.com/kveld9/kveld-extra-morphe-patches/commit/30248a833d23c57fd7dbbf0f8bc1e8a441c2c852))
* **multiaccounts:** neutralize TikTok Business SDK event tracking ([338b17f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/338b17f7c8ede87ff3fbca483911f41b65c1664d))
* **officehub:** preserve telemetry lifecycle init, drop only sends ([d41bca4](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d41bca4753df46e904a9c91ad5e3e310d3a60c15))
* **officehub:** remove login-requirement disabler that broke Copilot sign-in ([7eb90b7](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7eb90b703578da0b100fb92ff1f229aff6f7cafd))
* **patches:** interpolate version strings and pin verified input hash ([4cea93c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4cea93c0ba7f2b58b21f4298b5b6735e870d06d0))
* **shared:** show real app versions in download hints ([e0df24d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e0df24dc02945559d30d4a5d672b6a78cb68a283))

### New Features

* **multiaccounts:** add opt-in privacy controls for clipboard and TLS audit ([cda2cc6](https://github.com/kveld9/kveld-extra-morphe-patches/commit/cda2cc630c46d791e0b69f952fb42c83be6d31fb))
* **multiaccounts:** block tracking and analytics in Multiple Accounts ([239d466](https://github.com/kveld9/kveld-extra-morphe-patches/commit/239d466735698f1e1c5241cb820e5f863e8ec7b6))
* **multiaccounts:** ensure sideload compatibility for re-signed builds ([053f296](https://github.com/kveld9/kveld-extra-morphe-patches/commit/053f296cf382ed67e0eeabc0c3827097353e2287))
* **multiaccounts:** skip splash ads and first-run friction ([eda7e02](https://github.com/kveld9/kveld-extra-morphe-patches/commit/eda7e02abbc449602ac60e16a0ce8fed850d9d8c))
* **multiaccounts:** stop background wakeups from ad SDK workers ([c5db822](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c5db8228a05458e203fa79f2aa0e12eeee6330df))
* **sdmse:** track SD Maid SE releases from GitHub instead of APKPure ([29a8d9f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/29a8d9fcf66c354d355b2a5d20ea72b24688c72a))
* **sdmse:** unlock Pro features in SD Maid SE FOSS release ([736df9f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/736df9f1654d40e2a624f203ba7c330b7f5f3429))
* **sdmse:** watch SD Maid SE releases in scheduled update check ([7e92e9a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7e92e9adbc1da6e145aecc0309df11bf80c998fc))

## [1.24.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.23.1...v1.24.0) (2026-10-19)

### Bug Fixes

* **capcut:** resolve slimmer targets through the patcher resource paths ([2067afd](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2067afd328c8793bc0df95a3e4135b7028b3e0a5))
* **hevy:** correct the IDAT CRC of the stub PNG ([132cf67](https://github.com/kveld9/kveld-extra-morphe-patches/commit/132cf67dbe75e64a7fda23c23877e7b35d939b5a))
* **hevy:** keep classpath resources when cleaning build junk ([292f82e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/292f82e179b99cb096d73b8dfb0c23636bf99614))
* **hevy:** keep Firebase component discovery for push notifications ([aeaaedb](https://github.com/kveld9/kveld-extra-morphe-patches/commit/aeaaedb623ddafc437725b8f463651fd78150f8a))
* **hevy:** keep WorkManager so local notifications can be scheduled ([bc14b09](https://github.com/kveld9/kveld-extra-morphe-patches/commit/bc14b090b2cf4eaba73473d9de1e02357d628184))
* **hevy:** walk the real APK root when pruning build junk ([d35355e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d35355e61ffeec7acbf5298e2de7b11347604a99))
* **nokoprint:** decode resources for the asset debloat patch ([917a2ff](https://github.com/kveld9/kveld-extra-morphe-patches/commit/917a2ff5b7680cb3135590d89769dde71a3b6fc5))

### New Features

* **runner:** warn when a passing patch reports skipped steps ([6d21b97](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6d21b97f98638aa929ff26bf37f0d3d5c5118a35))

## [1.23.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.23.0...v1.23.1) (2026-10-18)

### Bug Fixes

* **harness:** include source_name and optional keys in update-detector template ([575f284](https://github.com/kveld9/kveld-extra-morphe-patches/commit/575f2843703205863af96794756ab7fa592f5161))

## [1.23.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.22.2...v1.23.0) (2026-10-18)

### Bug Fixes

* **sube:** fail closed when no Firebase endpoint rewrites apply ([a045522](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a045522530294af94b17de7851fc541bc9cb4a35))
* **sube:** fail closed when no telemetry dispatchers resolve ([06e1aec](https://github.com/kveld9/kveld-extra-morphe-patches/commit/06e1aecb602b213bbab0e1316b6ea0246d452fcf))
* **sube:** force NFC_NXP_SUPPORTED in both branches of Nfc gate ([2b4c0cd](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2b4c0cdb87ad2b27de2f202ef61f406bc610f121))

### New Features

* **sube:** add NFC antenna check bypass patch ([95236e4](https://github.com/kveld9/kveld-extra-morphe-patches/commit/95236e44e4f4b7720a7180240482ab27e59f3df7))
* **sube:** add opt-in kill switch that severs Firebase entirely ([3116a4e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/3116a4ee5de0b2857a0c3cdb17b4ca6f08368fe2))
* **sube:** block tracking and analytics in SUBE ([cf2b46f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/cf2b46f6a2d0e23ebab00854e92ba0e3b1e6a069))
* **sube:** register SUBE in upstream update detector ([abf2bbb](https://github.com/kveld9/kveld-extra-morphe-patches/commit/abf2bbb84e8c51cf9bd38914c1b2baed688e4809))

## [1.22.2](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.22.1...v1.22.2) (2026-10-18)

### Bug Fixes

* **hevy:** narrow battery-patch manifest edits ([f150d46](https://github.com/kveld9/kveld-extra-morphe-patches/commit/f150d46eb3260b76508a94c5ae0f185f0553bceb))
* **hevy:** report why a bundle failed the Hermes HBC96 check ([2425a00](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2425a008284cc647a73a4d4ff859182364ab62a6))

## [1.22.2](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.22.1...v1.22.2) (2026-10-18)

### Bug Fixes

* **hevy:** narrow battery-patch manifest edits ([f150d46](https://github.com/kveld9/kveld-extra-morphe-patches/commit/f150d46eb3260b76508a94c5ae0f185f0553bceb))
* **hevy:** report why a bundle failed the Hermes HBC96 check ([2425a00](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2425a008284cc647a73a4d4ff859182364ab62a6))

## [1.22.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.22.0...v1.22.1) (2026-10-18)

### Bug Fixes

* **nokoprint:** honest label for the network security patch ([711af71](https://github.com/kveld9/kveld-extra-morphe-patches/commit/711af71b510dd427496ea280f48702fde22f3671))

## [1.22.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.21.1...v1.22.0) (2026-10-18)

### Bug Fixes

* **twitter:** keep comments, profiles and tabs loading with Disable Auto Refresh ([cbecf56](https://github.com/kveld9/kveld-extra-morphe-patches/commit/cbecf56fc00ea3b88f9a957404ae5ec3c140a178))

### New Features

* **twitter:** narrow X patch set to Piko-complementary set ([96ba044](https://github.com/kveld9/kveld-extra-morphe-patches/commit/96ba044265d858a9dffbe2fbd193daaf52d4bb13))
* **twitter:** update to 12.35.0-prod.01 ([8404802](https://github.com/kveld9/kveld-extra-morphe-patches/commit/8404802f0c13446b870295757c968503315eff43))

## [1.21.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.21.0...v1.21.1) (2026-10-17)

### Bug Fixes

* **hevy:** disable residual Adjust and Facebook manifest components ([3f3220e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/3f3220e1dd0247db86457fceba26dfee5d0243ec))
* **hevy:** disable residual background sync components and neutralize WorkManagerInitializer ([800066b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/800066bec6adad4ccaa588b9865ca2671d00ded4))
* **hevy:** sinkhole React Native telemetry in NetworkingModule ([ef9376f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ef9376f4c747859281ea4b731d1ed01e66d7731f))
* **hevy:** use valid 0.0.0.0 sinkhole URL and preserve push messaging components ([c4b2413](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c4b24132c765bd2df4f631634ec0c2b0f932599e))
* **moovit:** disable residual advertising activities and receiver ([683d692](https://github.com/kveld9/kveld-extra-morphe-patches/commit/683d692597fdfd360c1d280aa91270f628efdc98))
* **nokoprint:** clear try blocks before replacing instructions in ad dispatch hooks ([1ec5ca5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/1ec5ca5751a79a9b23298405b6d472557069a77e))
* **nokoprint:** disable residual AdMob, BidMachine and Tappx manifest components ([2137a5d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2137a5d4b6686be6e5648fac5da6ead795fa2925))
* **nokoprint:** disable residual FirebaseInitProvider and ComponentDiscoveryService ([4ea7c5a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4ea7c5a7a42e95b50aa6ab14c646e634c34ce848))
* **nokoprint:** preserve FirebaseInitProvider and ensure register count in ad dispatch hook ([ac65586](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ac65586e747ef021a92554261c240ce08195c1ed))
* **officehub:** ensure register count in transparency hook and fix metadata bundle string ([c53e83b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c53e83b8819050599c68637d17658d7b98bde3e2))
* **officehub:** escape target version in compatibility description ([010f027](https://github.com/kveld9/kveld-extra-morphe-patches/commit/010f027b2c3982d991cda1876dca004d0dceda44))
* **officehub:** interpolate package name constant in compatibility description ([e708031](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e70803199922465a52f0ce0d9737ae78c8457db4))
* **officehub:** neutralize Singular attribution SDK and sinkhole AppCenter/events telemetry ([83c8e0d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/83c8e0d4ef3ac5c3c3c4052d404b977e76537f7c))
* **officehub:** update code transparency verification hook for 16.0.20604.20012 ([27f1656](https://github.com/kveld9/kveld-extra-morphe-patches/commit/27f1656a66c8a4b2e5ac0c92f60f5e541059f2b5))
* **officehub:** update supported version to 16.0.20604.20012 ([e38c102](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e38c1026a3c5eca16a2811ab81e5014272b3773c))

## [1.21.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.20.0...v1.21.0) (2026-10-16)

### Bug Fixes

* **twitter:** purge Sentry manifest metadata and redirect tracker endpoints ([bbfc560](https://github.com/kveld9/kveld-extra-morphe-patches/commit/bbfc560d3ed0e19724448d6fedd27f8e3eb61c6b))
* **twitter:** show the download option on every video and GIF ([777f05d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/777f05d649e14975b5f7efcc6ba3832d91ed5a68))
* **twitter:** stop timeline refresh when reopening the app ([d2d8f6c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d2d8f6c5aeb7610c957fbd1bb85cf95752126697))

### New Features

* **twitter:** block Google Ads, DoubleClick, and opt-in payments telemetry ([643d59e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/643d59e7dd37cc83a2b5bd7989458fc159991248))

### Code Refactoring

* **capcut:** remove redundant Screen Density Slimmer ([5fa88d2](https://github.com/kveld9/kveld-extra-morphe-patches/commit/5fa88d210cc5524f074935caaff2aad757ed3dd9))
* **capcut:** scope Locale Slimmer to asset bundles only ([9f85e3b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/9f85e3bf6286bc3d82de7231d6c3df9043c3623d))
* **instagram:** remove redundant MLKit Vision Slimmer ([6eff44a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6eff44a524c8f166a4d3c448965f597d868c0b21))
* **lrmobile:** remove redundant Background Sync ([704ddb5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/704ddb5fccc28d63cdf6775a8de5d6104afef72e))
* **lrmobile:** remove redundant Junk Cleaner ([9a029bb](https://github.com/kveld9/kveld-extra-morphe-patches/commit/9a029bbdb4f2560aa48f6c148344277b205b803e))
* **moovit:** remove redundant Locale Slimmer ([eca83ff](https://github.com/kveld9/kveld-extra-morphe-patches/commit/eca83ffa6b69de75a87ee601f9e3765e0b7959d9))
* **moovit:** remove redundant Screen Density Slimmer ([dadf25b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/dadf25be835c162d6b272dd8a0ee24d0b98cf2d8))
* **officehub:** remove redundant DPI Slimmer ([a79fa13](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a79fa132837d8a611572e57a8e580fed2b2c1545))
* **officehub:** remove redundant Junk Cleaner ([26b78b8](https://github.com/kveld9/kveld-extra-morphe-patches/commit/26b78b8aa904f01558cc535f3c738c5b6d213446))
* **powerpoint:** remove redundant DPI Slimmer ([91b0db9](https://github.com/kveld9/kveld-extra-morphe-patches/commit/91b0db956faeaa848c6b38fef911d5bdf4b40f8f))
* **powerpoint:** remove redundant Locale Slimmer ([2204a9e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2204a9e7a71e3999e5890954f4a515809672034d))
* **twitter:** deduplicate tracker endpoint literals in Block Telemetry ([d8e91b3](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d8e91b3ed5cb6da3489cb031354556278d80a055))
* **twitter:** remove redundant MLKit Vision Slimmer ([29f73a7](https://github.com/kveld9/kveld-extra-morphe-patches/commit/29f73a70f0475f748a0fd396d947cb103d8b0474))

## [1.20.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.19.0...v1.20.0) (2026-10-16)

### New Features

* **twitter:** open replies sorted by Likes instead of Relevance ([2881af3](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2881af3868164ec6cd6d0545f7ba6474d2f613b7)), closes [#12](https://github.com/kveld9/kveld-extra-morphe-patches/issues/12)

## [1.19.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.18.0...v1.19.0) (2026-10-16)

### Bug Fixes

* **twitter:** hide empty Discover More section in reply threads ([a4c7c19](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a4c7c19ad562fcde944cff65632c4ee761121544))

### New Features

* add Hevy, NokoPrint and Xiaomi Earbuds (migrated from main repo) ([da9f835](https://github.com/kveld9/kveld-extra-morphe-patches/commit/da9f835854a5c43232457ec9021bc09aea13c02a))
* **twitter:** download videos and GIFs without Premium ([1536948](https://github.com/kveld9/kveld-extra-morphe-patches/commit/1536948098b054bbfd8c8decab35b0bd27a02918))
* **twitter:** stop the timeline from refreshing to new posts on its own ([93fbe09](https://github.com/kveld9/kveld-extra-morphe-patches/commit/93fbe09e8bd854e736221b64452d506385aea3fa))

## [1.18.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.17.0...v1.18.0) (2026-10-16)

### Bug Fixes

* **capcut:** block AppsFlyer, AppLog and install attribution trackers ([9c5f6cc](https://github.com/kveld9/kveld-extra-morphe-patches/commit/9c5f6ccad528883ad19b7f8bcf26ba65bc523f63))
* **capcut:** cover central VIP-status flags in Unlock Premium ([e605795](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e6057955c967a87127171b4e584f0a8ee5d972a7))
* **capcut:** pin access flags on export and template fingerprints ([d4a9920](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d4a9920d17d2ec1e302d36284f2bab6fe9ceab98))
* **capcut:** pin explicit parameters on unlock patch fingerprints ([e135007](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e135007201f351e5d9231849b2b1d863facef458))
* **capcut:** update target to 19.8.0 ([7862977](https://github.com/kveld9/kveld-extra-morphe-patches/commit/786297757b6628a21e72c866e13f59d12a9eea53))
* **deps:** resolve Dependabot alert for transitive http-cache-semantics ([c5a49f5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c5a49f529db89c4f3c2f862a3e007500006ae3bf))
* **twitter:** hide Community Notes on posts ([8d3ee89](https://github.com/kveld9/kveld-extra-morphe-patches/commit/8d3ee89596d7f5aa28f94ebf7680786c6faff1b9))
* **twitter:** hide the call buttons in direct message conversations ([6bfd7a2](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6bfd7a216681c149f1e06e90fb567c956f2d3c20))
* **twitter:** hide the Discover more section under post replies ([12cbb2f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/12cbb2f06d5183c58f5874466e31124476a96f13))
* **twitter:** hide the floating compose button with Hide FAB ([fff6e9d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/fff6e9d1d7f7429d6cb3557a4eface17bcc2576c))
* **twitter:** hide the Follow button on opened posts with Hide Nudge Button ([fb8e098](https://github.com/kveld9/kveld-extra-morphe-patches/commit/fb8e098584600b5ec4b29238e362f04a581f9396))
* **twitter:** hide the selected navigation drawer entries again ([29c3d2a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/29c3d2a7f370708b854112a89a87ca5ec45eb8b4))
* **twitter:** keep the Grok Imagine prompt hidden on profiles after resuming the app ([a5c82c4](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a5c82c4c57f857f6bbfd0a7dc747077b2bea98ac))

### New Features

* **capcut:** remove watermark on export ([0ce80a6](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0ce80a65f352a91b9d501234efe69267a9c96219))
* **capcut:** unlock premium template styles ([ddca5a0](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ddca5a09f9ddb3ce2d3226979c99f7ae9c1504e0))
* **capcut:** unlock Ultra HD export options ([a415f2f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a415f2f8d9e88930214f0567402385b624b1bdb6))

## [1.17.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.16.3...v1.17.0) (2026-10-16)

### Bug Fixes

* **instagram:** prevent startup crash by leaving dynamic-delivery components enabled ([974b72c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/974b72c971b0e18d95824d3cc4e731dffe4a0230))
* **lrmobile:** align pinned input hash with validated Uptodown variant ([8ed4edd](https://github.com/kveld9/kveld-extra-morphe-patches/commit/8ed4eddd00df159061b5a65d5e4a942f65899b76))
* **lrmobile:** block Branch attribution and Adobe Analytics edge collection ([c84cc55](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c84cc555cdcc9e1718b67f09e50e2aca134e9348))
* **lrmobile:** cut Analytics edge transport and tag-manager fetch ([01a0778](https://github.com/kveld9/kveld-extra-morphe-patches/commit/01a077890ce167752290e4e07bf69050bbc7ce48))
* **lrmobile:** log explicit skip reasons in telemetry guards ([4942178](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4942178b3b8299a2d6c9893b049db2e0e8d33eba))
* **lrmobile:** tolerate missing analytics SDK classes in telemetry patch ([b5f4317](https://github.com/kveld9/kveld-extra-morphe-patches/commit/b5f4317cf490053e564884401e25afbc0989ef57))
* **twitter:** hide the + tab in the home tab row with Hide Timeline Add Tab ([a6076ca](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a6076ca579b3816e2097ae6f1535154849cd7f24))
* **twitter:** hide the pinned timelines button in every home top bar layout ([e5392f0](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e5392f090302d0bc4b935d6b255ddd3d50018e40))
* **twitter:** keep post pages working if X changes the reply renderer ([fe67e1e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/fe67e1ecc40f96b7cf7b943cd238e1af34863920))
* **twitter:** label the add tab option "Hide Timeline Add Tab" ([cb03a0d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/cb03a0daa080810f90dcfc354ba6dd877a90e6c7))
* **twitter:** make Hide FAB Menu remove the floating button menu ([102d742](https://github.com/kveld9/kveld-extra-morphe-patches/commit/102d74254e36c3f8239dc23a629b1e280fb2d60e))
* **twitter:** prevent a crash when opening posts with Hide Discover More enabled ([72001e6](https://github.com/kveld9/kveld-extra-morphe-patches/commit/72001e6b8361e139fafb982f1a4d1e896f8b6247))
* **twitter:** prevent a crash when opening posts with Remove ads enabled ([f1d1c88](https://github.com/kveld9/kveld-extra-morphe-patches/commit/f1d1c885767c48e2579b41d874e0e68cd303a5cb))

### New Features

* **scripts:** add an ART verifier gate for patched APKs ([d21c640](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d21c6406ea3c42a67ff06d18c69353def46339da))

### Code Refactoring

* **twitter:** fail patching when a flag override would be skipped on some paths ([266611e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/266611e717a957852e034396ea7d871b309f5bb3))
* **twitter:** name telemetry fingerprints for contract sync ([3b8e747](https://github.com/kveld9/kveld-extra-morphe-patches/commit/3b8e7478ba2442bc596315c09933ba4945467a5b))

## [1.16.3](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.16.2...v1.16.3) (2026-10-15)

### Bug Fixes

* **twitter:** make DM Debloat reliably hide the DM call buttons ([2c8c578](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2c8c578899f27f902ff01eef20e6a54735533148))
* **twitter:** make Navigation UI reliably hide the FAB menu ([336670b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/336670b442a88802d185cc10e0eeecf00a2e7d0b))

## [1.16.2](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.16.1...v1.16.2) (2026-10-15)

### Bug Fixes

* **ci:** drop harness tests step, harness is local-only ([01651ef](https://github.com/kveld9/kveld-extra-morphe-patches/commit/01651ef3408965111268c364179ddcc001ed0211))

## [1.16.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.16.0...v1.16.1) (2026-10-15)

### Bug Fixes

* **ci:** skip harness tests when harness directory is untracked ([269fe57](https://github.com/kveld9/kveld-extra-morphe-patches/commit/269fe57703e40f96abae2e2dbb415a4b68e3c8f1))

## [1.16.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.15.4...v1.16.0) (2026-10-15)

### Bug Fixes

* **twitter:** prefix labels in TwitterRemoveAdsPatch with rmad_ ([a27098a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a27098ab698ebf610d88c931665363df8c5a3b48))
* **twitter:** prefix labels in TwitterTimelineUiPatch with tlflt_ and tluid_ ([4184d29](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4184d2960b86df2ae5104190c16e297e90f3cd8a))

### New Features

* **harness:** add smali member reference verifier for target DEX ([360d2bd](https://github.com/kveld9/kveld-extra-morphe-patches/commit/360d2bd84fc54e8c38f5fffa88e79e213144fafd))

## [1.15.4](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.15.3...v1.15.4) (2026-10-15)

### Bug Fixes

* **twitter:** update timeline ad suppression item models and descriptors for 12.34.0 ([1d2e5ff](https://github.com/kveld9/kveld-extra-morphe-patches/commit/1d2e5fffc46a232ee5ed8706d6ce0adafe168174))
* **twitter:** update timeline recommendation filter fields for 12.34.0 ([7635555](https://github.com/kveld9/kveld-extra-morphe-patches/commit/763555582b6d5ee91404a2280516e13f1612ff7e))

## [1.15.3](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.15.2...v1.15.3) (2026-10-15)

### Bug Fixes

* **twitter:** use renamed empty timeline presenter in Remove Ads suppression ([f646b5b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/f646b5b2b811e32e3acb30e0b3f148673efbc8ab))
* **twitter:** use renamed empty timeline presenter in Timeline UI discover filter ([4f528b9](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4f528b9c2aed0d8b228b8a33605db35e2f2ae707))

### Code Refactoring

* **twitter:** extract neutralizeFlag helper into TwitterFlagUtils ([359f50a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/359f50af0546b2a645687615be5590f78ce959a2))

## [1.15.2](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.15.1...v1.15.2) (2026-10-15)

### Bug Fixes

* **twitter:** adapt navigation ui grok tab for 12.34.0 ([c94a67b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c94a67be3348ba0057724cc2b18e8b0dd223111a))
* **twitter:** adapt remove ads presenter fingerprints for 12.34.0 ([d0052b5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d0052b5b0145572bb19b2af9f1dc789cc1ddb669))
* **twitter:** adapt remove premium upsell profile verified surface for 12.34.0 ([7cdb397](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7cdb397cadc838601c5cb558e861faa25daeae15))
* **twitter:** adapt round off numbers iterator check for 12.34.0 ([7065fe6](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7065fe6677532df0c1e908665dda8fb4c77962d1))
* **twitter:** adapt timeline ui presenters and top bar for 12.34.0 ([09857c1](https://github.com/kveld9/kveld-extra-morphe-patches/commit/09857c187747245d4f954883fb410ac9695d371f))
* **twitter:** eliminate user-visible patch duplication and overlap ([7c5849b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7c5849b0a407905cd0a09df4a6403cbe0972dc9c))
* **twitter:** intercept and filter who-to-follow module in timeline ingestion ([25fbc85](https://github.com/kveld9/kveld-extra-morphe-patches/commit/25fbc85b82531aa746d18e8819a879d8fa749a2e))
* **twitter:** update supported version to 12.34.0-prod.01 ([520d46a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/520d46ab5e766c75f03792b747d7234d3fe14768))

## [1.15.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.15.0...v1.15.1) (2026-10-14)

### Bug Fixes

* **harness:** prevent regex backtracking when scanning download targets ([410f415](https://github.com/kveld9/kveld-extra-morphe-patches/commit/410f415ca00424a5076290b4bb97f6d7e996107a))
* **tooling:** prevent path traversal during split extraction ([5709ba7](https://github.com/kveld9/kveld-extra-morphe-patches/commit/5709ba7b87472f1778da8a9d060202010a25c523))

## [1.15.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.14.2...v1.15.0) (2026-10-14)

### Bug Fixes

* **extra:** align Lightroom single-APK description and harden variant check ([b642855](https://github.com/kveld9/kveld-extra-morphe-patches/commit/b642855605f531a33cfc34e1f204fa21dcaafcaa))
* **instagram:** remove Breakpad slimmer that crashed the app at startup ([e64569a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e64569a7d3adad8f35b65fe7efc72e9863c37493))

### New Features

* **capcut:** bypass the unofficial-version security notice ([e69b62e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e69b62e011b36568493f5441bfcd137c5de8ad1e))

## [1.14.2](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.14.1...v1.14.2) (2026-10-13)

### Bug Fixes

* **extension:** anotar TargetApi P en TypefaceSpan de Custom Fonts ([4633a0d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4633a0d9970d40557d578835aad4d65940c9e2ab))

## [1.14.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.14.0...v1.14.1) (2026-10-13)

### Bug Fixes

* **twitter:** force empty units loop in Round Off Numbers ([1b4b4ec](https://github.com/kveld9/kveld-extra-morphe-patches/commit/1b4b4ec0577092465c20ad85e24310bf379d17a5))

## [1.14.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.13.0...v1.14.0) (2026-10-13)

### Bug Fixes

* **twitter:** demote braze anchors to best-effort ([1581b35](https://github.com/kveld9/kveld-extra-morphe-patches/commit/1581b35c26c4263fdc515c9c7eb53c6ddeb903db))
* **twitter:** extend telemetry neutralization to braze and sentry surfaces ([c95d687](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c95d68759da292992ddd3201675b8e53a1ad63f6))
* **twitter:** reject quote and backslash in Custom Fonts paths ([423b2d3](https://github.com/kveld9/kveld-extra-morphe-patches/commit/423b2d378d9e908bc47abd8d448041cea3e6682c))
* **twitter:** resolve nullable fingerprint matches via matchAll ([ea5f7db](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ea5f7dbbbe833a7d6dccf58aeffe48bf833a4b6a))
* **twitter:** select first safe dispatcher per anchor ([330a22e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/330a22e4829db04aca241aaedff87b2d3a2dd885))

### New Features

* **twitter:** add background and companion-surface slimmer ([0527f06](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0527f065afd93713369e129beb2fdd2c897411c1))
* **twitter:** add Custom Deep Links patch ([399f3d4](https://github.com/kveld9/kveld-extra-morphe-patches/commit/399f3d4a9c310f337e7d197a1b17e8cdd50ce287))
* **twitter:** add Custom Fonts patch with text font support ([4826150](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4826150d2d11a0782937307411a893152cea97b6))
* **twitter:** add emoji font option to Custom Fonts ([16ed849](https://github.com/kveld9/kveld-extra-morphe-patches/commit/16ed849515bc8b2881ea19c7cf50a53cc6b7d25e))
* **twitter:** add Hide FAB option to Navigation UI ([046da1f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/046da1fb0a79b8d3811bb42715bf449d07d2dc69))
* **twitter:** add Round Off Numbers patch ([588d05b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/588d05bc2836855b789d4a329c96324e748d7aff))

## [1.13.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.12.5...v1.13.0) (2026-10-12)

### New Features

* **capcut:** add bypass geoblock region restriction patch ([665c9f9](https://github.com/kveld9/kveld-extra-morphe-patches/commit/665c9f94f7c7d8d980229d023f5f9b5ca906e23b))

## [1.12.5](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.12.4...v1.12.5) (2026-10-12)

### Bug Fixes

* **twitter:** stop blanket early-return in profile Grok Imagine hook ([43b339d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/43b339d064a6e63627295ef934cbd47d7fd01792))

## [1.12.4](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.12.3...v1.12.4) (2026-10-12)

### Bug Fixes

* **twitter:** collapse DM call toggles into a single hideDmCalls option ([5148fbc](https://github.com/kveld9/kveld-extra-morphe-patches/commit/5148fbc2eb9131417837bb649d27ee3d2e636075))
* **twitter:** disambiguate Share Links custom domain toggle title ([6a419dd](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6a419dd82f0c8b3002c30fe2e8362dbb50dcdce4))
* **twitter:** remove Dynamic Color patch ([63c09b8](https://github.com/kveld9/kveld-extra-morphe-patches/commit/63c09b873fb86e98572848a673e63efbeead0dce))

## [1.12.3](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.12.2...v1.12.3) (2026-10-12)

### Bug Fixes

* **twitter:** re-anchor Dynamic Color to M3 ColorScheme slots in theme/d ([565363b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/565363bf1cb991753af37387b8cbddde8f8fe656))

## [1.12.2](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.12.1...v1.12.2) (2026-10-12)

### Bug Fixes

* **twitter:** stop overriding J1 accent load in lights-out Dynamic Color case ([940067a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/940067a0eabb30f097d8b492263c5a8653594428))

## [1.12.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.12.0...v1.12.1) (2026-10-12)

### Bug Fixes

* **twitter:** use dead wide pair v8/v9 as scratch in Dynamic Color lights-out hook ([c03b6b1](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c03b6b1acec3732caf933406a9035670c4ec0d36))

## [1.12.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.11.2...v1.12.0) (2026-10-12)

### New Features

* **twitter:** add Dynamic Color patch with Compose-anchored Monet palette ([28bd24e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/28bd24e649e9af50b818122899517232ff8c1c51))

## [1.11.2](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.11.1...v1.11.2) (2026-10-12)

### Bug Fixes

* **moovit:** route extension merge through sharedExtensionPatch ([86756fa](https://github.com/kveld9/kveld-extra-morphe-patches/commit/86756faf9a69c52bbd6b6960cdd122368b29a032))
* **twitter:** eliminate bare getClass null checks after Firebase Perf getInstance ([4d98ca5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4d98ca52ae2f1fd31f3dac96ef19cfc013192628))

### Code Refactoring

* **twitter:** drop dead profile header field and visibility loops ([7ee42db](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7ee42db3cc034797fca50c63e8f53e2628ab8ea1))
* **twitter:** drop placebo DM composer toggles ([6fb1a16](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6fb1a16ca2e33d53831d7b0c556853299217d5b8))
* **twitter:** drop placebo navigation toggles ([dc8cba8](https://github.com/kveld9/kveld-extra-morphe-patches/commit/dc8cba81b8a38de586add47740ad36df123ff83a))
* **twitter:** drop placebo profile toggle ([a22294d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a22294d1fd632c374c931180929951d2c9af033f))
* **twitter:** drop placebo timeline toggles ([8895db7](https://github.com/kveld9/kveld-extra-morphe-patches/commit/8895db7bf067ccb5d2e274027ac670c7f40fd361))

## [1.11.1](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.11.0...v1.11.1) (2026-10-12)

### Bug Fixes

* **twitter:** hide profile Grok CTA via header state hook ([191f7a7](https://github.com/kveld9/kveld-extra-morphe-patches/commit/191f7a720a5fe2af216389996ae6129635164605))

## [1.11.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.10.0...v1.11.0) (2026-10-11)

### New Features

* **twitter:** add hide live banner option in timeline UI ([cdce0c6](https://github.com/kveld9/kveld-extra-morphe-patches/commit/cdce0c631f9222d6bf033d9d014f477bbf839c92))

## [1.10.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.9.0...v1.10.0) (2026-10-11)

### Bug Fixes

* **lrmobile:** chain unlock on sideload support as required dependency ([42b8a4b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/42b8a4bd6f5dd910a72d7d1293caf2ef1d770901))
* **lrmobile:** skip PairIP hooks honestly on PairIP-free inputs ([9e12007](https://github.com/kveld9/kveld-extra-morphe-patches/commit/9e1200770dd62ef241c79e9242d5b3a69b4f5d86))
* **tooling:** prevent zip slip path traversal in bundle split extraction ([a0f431e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a0f431e3a31861f1985c2482f46ad78290df1dbc))
* **twitter:** stop nulling followButtonState and restore Timeline UI default ([e72ebf0](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e72ebf0e0bc0de0b5393942c5adc4e8059446e36))

### New Features

* **lrmobile:** support sideloaded installs ([a7ddf1d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a7ddf1dad0497b63c49610812320760f486a9598))
* **twitter:** add DM Debloat section patch ([f6264da](https://github.com/kveld9/kveld-extra-morphe-patches/commit/f6264da59be8741ca70a83933972f070f82709fe))
* **twitter:** add Navigation UI section patch ([fa601b1](https://github.com/kveld9/kveld-extra-morphe-patches/commit/fa601b1d50d227bc1aa3733dd17d0e469ca3b12a))
* **twitter:** add Post and Profile UI section patch ([656ec43](https://github.com/kveld9/kveld-extra-morphe-patches/commit/656ec435ea0e4ba848489e369972e12619334f46))
* **twitter:** add Timeline UI section patch ([5b15603](https://github.com/kveld9/kveld-extra-morphe-patches/commit/5b1560336c4c5393b4eab9f4cc9a9f981882bc05))
* **twitter:** bump target to 12.33.1-prod.01 ([0e86d32](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0e86d32e4794981fab34181156b6afe4872fb36c))
* **twitter:** extend Timeline UI with post and thread options ([2a2f861](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2a2f861848383a8785ec8e3a5a29db8a40d6148b))

## [1.9.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.8.0...v1.9.0) (2026-10-11)

### Bug Fixes

* **twitter:** correct shifted icon resource IDs in drawer items patch ([25e844c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/25e844c01fd45264a43260f77ab5b61fd7099164))
* **twitter:** render sharing domain option as dropdown without file picker ([6a4a6c8](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6a4a6c851f16e826572c5acb2c98eb1788ba4d6a))
* **twitter:** suppress discover more module in post detail replies ([eb4005a](https://github.com/kveld9/kveld-extra-morphe-patches/commit/eb4005a2567726e54265b8b43ef60474db674d04))

### New Features

* **twitter:** add hide grok post action toggle ([0041ad0](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0041ad0ee6d2a91f4b8bc193354217bd78372a1e))
* **twitter:** add hide profile get verified pill toggle ([b4739dc](https://github.com/kveld9/kveld-extra-morphe-patches/commit/b4739dc0552bad6a43926e66dbb1db50fcced96f))
* **twitter:** add hide profile grok button toggle ([cb4ae05](https://github.com/kveld9/kveld-extra-morphe-patches/commit/cb4ae052a03a7253f201bcff4043dbaf150aac06))
* **twitter:** add timeline add tab toggle ([0d8e4d5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0d8e4d5d865e96f1fa731a16121d96843f3ce6bb))

## [1.8.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.7.0...v1.8.0) (2026-10-11)

### Bug Fixes

* **twitter:** correct ViewCount branch logic and derive register operands dynamically ([c673d2d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c673d2d7e94168dfa3df71736ccc581b64c44baf))
* **twitter:** implement real bytecode gate for timeline top bar connect button ([fff9ee5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/fff9ee550859825599ea69a8560624745a4bfc45))
* **twitter:** implement real bytecode gates for post view count and metrics ([bd56316](https://github.com/kveld9/kveld-extra-morphe-patches/commit/bd5631635ed26d38d2312b2c3f21fb839bc52549))
* **twitter:** intercept postdetail dispatcher in Remove Ads ([228c25f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/228c25fa08ace3c875f467dc6b39aaa7358a41f2))

### New Features

* **twitter:** add Drawer Items patch for granular drawer toggles ([3ce0866](https://github.com/kveld9/kveld-extra-morphe-patches/commit/3ce0866213bd281c9844add4559902d8da30d593))
* **twitter:** add toggle to hide Grok tab from bottom navigation bar ([a7b8ffc](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a7b8ffc65a4ab19bce3c79c3a7d9d992c6f5e570))

## [1.7.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.6.0...v1.7.0) (2026-10-11)

### Bug Fixes

* **deps:** resolve fixable Dependabot alerts via lockfile update ([3e9c2d1](https://github.com/kveld9/kveld-extra-morphe-patches/commit/3e9c2d1221b4590c5c1d82ba48d31cebdbd306c5))
* **instagram:** correct AR asset byte accounting in Instagram guide ([6ea22d1](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6ea22d1298f01b22aa7fb7f42d63c67fdd834e0b))
* **instagram:** report sub-KB savings in exact bytes in slimmer telemetry ([0a3f9c8](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0a3f9c870879cee058cdf41eee9ab39856ae4842))
* **instagram:** use neutral completion message in crash-diagnostics parent patch ([ff4ce9b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ff4ce9bc6d82b1b2b9b6371744996f5eaf9f1908))
* **twitter:** suppress promoted items across all timeline surfaces in Remove Ads ([4579ce7](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4579ce72055f95fc6e251d90a6ec00474a9623f1))
* **twitter:** validate custom domain before Smali interpolation ([ee26cac](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ee26cac17e4210833154fb07dc7f0637700f109b))

### New Features

* **instagram:** add opt-in AR effects slimmer ([e2a0c3d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e2a0c3d66d5997504e9e5338ec4ba06c2786b891))
* **instagram:** add opt-in Breakpad native slimmer ([2769304](https://github.com/kveld9/kveld-extra-morphe-patches/commit/27693047e19a0c8d9fa94ddbd3d528f8fa7cf216))
* **instagram:** block crash diagnostics via manifest purge ([ec6004b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ec6004bea4b980d517aa5f9c109966aed5a1268e))
* **twitter:** add block update screen patch ([cd08edc](https://github.com/kveld9/kveld-extra-morphe-patches/commit/cd08edc4abc81d67ee7680cd8c4b4cc6a2891094))
* **twitter:** add control video auto scroll patch ([f41848d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/f41848d60950bea77310650af25533e9adf5ef74))
* **twitter:** add customize UI patch with navigation toggles ([068de49](https://github.com/kveld9/kveld-extra-morphe-patches/commit/068de49119914f5d217ba51c01be102f31eadfc6))
* **twitter:** add hide discover more patch for reply threads ([1d2c430](https://github.com/kveld9/kveld-extra-morphe-patches/commit/1d2c430898c90c40836a60267ee9603a31a3293d))
* **twitter:** add hide elements patch with served-UI toggles ([f4e4f48](https://github.com/kveld9/kveld-extra-morphe-patches/commit/f4e4f488dad0e2ee6ccf7d40847eda18934896a8))
* **twitter:** add share links patch with custom domain option ([187fd8b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/187fd8bb50a6aad90d2cdb6096a85152b6d11b97))
* **twitter:** add show sensitive media patch ([b4a7ebd](https://github.com/kveld9/kveld-extra-morphe-patches/commit/b4a7ebd44a75a6cf5e7665eb8b1722b62c7da815))

## [1.6.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.5.0...v1.6.0) (2026-10-10)

### Bug Fixes

* **officehub:** exclude boot load-bearing voice libs from native slimmer ([4dc4e19](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4dc4e192bf0fb2449953361e1f8fbffab9c1c5fd))
* **officehub:** normalize custom hosts and scope user rewrite pass ([5e75120](https://github.com/kveld9/kveld-extra-morphe-patches/commit/5e7512040e48fe86abc96a60d250a454c4aa976c))
* **officehub:** persist transparency success timestamp in bypass ([3ded264](https://github.com/kveld9/kveld-extra-morphe-patches/commit/3ded264c6d7ff0eba627b0d5c6515e83e3e57d1b))
* **officehub:** validate custom host rules and fix rewrite accounting ([929883e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/929883e8207585c3d66b96c4f4bfde977a43a3c9))
* **officehub:** warn on unknown DPI and scope non-phone purge ([2fff6dd](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2fff6dde3d9d869b89212ff039c76ef28da0695b))
* **patches:** fail fast with actionable error when .mpp bundle is missing ([6634574](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6634574ff56d262f58735d6a044206adaf35781d))
* **tooling:** recognize renamed kveld-morphe-patches layout in skill sync ([5aaee2e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/5aaee2e4a74b5900e0846186293c99f90e43ef35))
* **twitter:** correct inverted filter branches in remove ads ([d34eb52](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d34eb523d93b60d737ae4099038f6e4a2d0e4010))

### New Features

* **officehub:** add code transparency dialog bypass ([118780f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/118780f548dc2c4ca59600b8fae1cbd26e46694f))
* **officehub:** add companion native slimmer with startup-safe exclusions ([8363526](https://github.com/kveld9/kveld-extra-morphe-patches/commit/836352606c8183cc70cf7a61813a107246deb76f))
* **officehub:** add Copilot target with telemetry blocking ([64ce08f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/64ce08f48ca362f6c882a4e35f9f22c6d070d8c0))
* **officehub:** add DPI slimmer for unselected densities ([41c8e56](https://github.com/kveld9/kveld-extra-morphe-patches/commit/41c8e56986b1f9a16184d5079bc219c95d4457c9))
* **officehub:** add junk cleaner for build metadata ([4b0d97f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4b0d97f7e23b65bc19ff0ee88df80cc802e1dc38))
* **officehub:** add login requirement disabler for FTUX and SSO ([8b8ce73](https://github.com/kveld9/kveld-extra-morphe-patches/commit/8b8ce73f9b7b868b6a8467468984c6becb87f197))
* **patches:** add warn-by-default input digest admission ([c124ff7](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c124ff7ea0cfe024dd7936ea43b9f861fc351f68))
* **tooling:** extend doctor with JDK compiler and build-tools checks ([6e539c4](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6e539c4c0fc383462c19ae1911edb528c5c8f57e))
* **twitter:** add hide banner patch ([a11925d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a11925dd265f31accfa5cbf7a9cc5c3bc6801b48))
* **twitter:** add hide live threads patch ([7193961](https://github.com/kveld9/kveld-extra-morphe-patches/commit/71939610a0e043bc9d63699b06f7961a4dee747a))
* **twitter:** add hide nudge button patch ([5b70619](https://github.com/kveld9/kveld-extra-morphe-patches/commit/5b706190021f6369cd33e7c3096df91b56339d01))
* **twitter:** add hide promote button patch ([d27e9ac](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d27e9ac956da3494f548f33913a746b4cb592753))
* **twitter:** add hide recommendation items patch ([fe9dc15](https://github.com/kveld9/kveld-extra-morphe-patches/commit/fe9dc157599666e19d92a3eeb4dd2cdc8f57e182))
* **twitter:** add hide recommended users patch ([6486c86](https://github.com/kveld9/kveld-extra-morphe-patches/commit/6486c86ddf6d1b1ba4388d941ecf4da53377e17f))
* **twitter:** add no shortened url patch ([f1d7885](https://github.com/kveld9/kveld-extra-morphe-patches/commit/f1d78854625117d8194ff9b3d3f0b8e016f561a5))
* **twitter:** add pause search suggestions patch ([ad12061](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ad120618bf40259d47f6cbfbe7595691f9b79a76))
* **twitter:** add remove ads patch ([674b793](https://github.com/kveld9/kveld-extra-morphe-patches/commit/674b7934df81c1b1f67f670fa598133c72195368))
* **twitter:** add remove premium upsell patch ([a0b23a0](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a0b23a09a0a6759a44f935d4bf7401b82cce602f))
* **twitter:** bump target to 12.33.0-prod.01 ([dc4c609](https://github.com/kveld9/kveld-extra-morphe-patches/commit/dc4c6098bdb7f51f1704f29e830ca9cb46d93db8))
* **twitter:** neutralize firebase performance trace dispatchers ([7dd3aaf](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7dd3aafc8c03f625066d4b78cc4922a0687f8e67))

## [1.5.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.4.0...v1.5.0) (2026-10-10)

### Bug Fixes

* **lrmobile:** backup guidance references APK-only input ([ae00b19](https://github.com/kveld9/kveld-extra-morphe-patches/commit/ae00b19ffbfbb7908fef3ffc57b2a3805636fdbd))
* **lrmobile:** target PairIP-free APK variant instead of Play APKM bundle ([d4f4693](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d4f469365dd0c329b834d0b1d5e33027ee2571b4))

### New Features

* **capcut:** add block telemetry patch ([3649877](https://github.com/kveld9/kveld-extra-morphe-patches/commit/3649877d8f8a602d1dcdb9761fb890a4112821b9))
* **capcut:** add bypass effects region restriction patch ([0e188cb](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0e188cb06859b2bb258bc7bca957a33026e674a2))
* **capcut:** add locale slimmer patch ([40c7d40](https://github.com/kveld9/kveld-extra-morphe-patches/commit/40c7d40d38e89e9f2057306f173669450ac5012f))
* **capcut:** add native bloat slimmer patch ([93c3309](https://github.com/kveld9/kveld-extra-morphe-patches/commit/93c33096e7b7696d510bfe13e71ac206cc58e935))
* **capcut:** add screen density slimmer patch ([63fff6c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/63fff6ca32d2dc921b6af1cae5befb606d22e8ed))
* **capcut:** add unlock premium patch ([76569d8](https://github.com/kveld9/kveld-extra-morphe-patches/commit/76569d81d63f7b3e04ec9915e62e1b2068aa98f5))
* **lrmobile:** add background sync disabler preserving WorkManager init ([b358131](https://github.com/kveld9/kveld-extra-morphe-patches/commit/b35813158d11dba136efb89ce1dd6d031cda5453))
* **lrmobile:** add junk cleaner for build metadata ([d781836](https://github.com/kveld9/kveld-extra-morphe-patches/commit/d7818363b1a128911cdd77a9d6a3b1be4c6db7b4))
* **lrmobile:** add telemetry blocker preserving boot-critical components ([4b67af1](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4b67af180a53602a7cd8ea823cdf225e06b9e3be))
* **lrmobile:** add unlock premium features patch ([9054c09](https://github.com/kveld9/kveld-extra-morphe-patches/commit/9054c090ae49defac17036e1db15d57b7e7eb31f))
* **skills:** add client-side post-patch compatibility step and compat-bypass skill ([2a3644d](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2a3644dd1f6ad35d938d311605f7b7ccac8a9763))

### Code Refactoring

* **tooling:** collapse README patch spoilers unless EXPANDED ([51b7c33](https://github.com/kveld9/kveld-extra-morphe-patches/commit/51b7c33b50d41b5d4a5bb8d468d7f3408ce71bfa))

## [1.4.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.3.0...v1.4.0) (2026-10-09)

### Bug Fixes

* **moovit:** neutralize in-process telemetry dispatchers and strip AppsFlyer key ([2870b6c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2870b6ceab7b47443867ef6b6c62b737d693b23a))
* **powerpoint:** add diagnostic telemetry logging to new patches ([e7f096c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e7f096c64c16066edd2dea08ce6764b0499cd919))
* **tooling:** exempt declaration-only files from patch logging gate ([532cd62](https://github.com/kveld9/kveld-extra-morphe-patches/commit/532cd624e491ad9fb13100135f5c582fd1493ed8))

### New Features

* **moovit:** add custom maps API key option to Fix Google Maps patch ([fbdec42](https://github.com/kveld9/kveld-extra-morphe-patches/commit/fbdec428bc214aa5c45e40f2678b338c977b31e0))
* **moovit:** add Fix Google Maps patch to restore map rendering ([7560d48](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7560d48e313bd15f837a312cd19cc6f3d9a683e5))
* **moovit:** add Remove Ads patch to suppress banner and inline ads ([438dd61](https://github.com/kveld9/kveld-extra-morphe-patches/commit/438dd61673dc6dd45de9bbc4f96cf1cc415105b5))
* **moovit:** add Suppress Paywalls patch to disable upgrade dialogs and cards ([a70634c](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a70634cd9b3b7301a40495c22fcf3f2aaa24832d))
* **moovit:** add Unlock Moovit+ patch for premium features and address search ([1c4554b](https://github.com/kveld9/kveld-extra-morphe-patches/commit/1c4554b00630a2aff7f36187322d2398d79eade3))

### Code Refactoring

* **moovit:** dynamically resolve paywall skip methods in Suppress Paywalls ([fa2e65f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/fa2e65f4e7fa4bc7575cfe7e797286aa6476281b))

## [1.3.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.2.0...v1.3.0) (2026-10-09)

### Bug Fixes

* **powerpoint:** resolve obfuscated LicenseStatus class in licenseStatusIsPremiumFingerprint ([9e2cde0](https://github.com/kveld9/kveld-extra-morphe-patches/commit/9e2cde07213bf65a8507cbea06cfa8a8e8530fb7))

### New Features

* **powerpoint:** add Bypass Code Transparency patch ([7b8f540](https://github.com/kveld9/kveld-extra-morphe-patches/commit/7b8f5401f5cebc3fedbc3f85e95405a33c6c1ba1))
* **powerpoint:** add Disable Ads patch ([08459c7](https://github.com/kveld9/kveld-extra-morphe-patches/commit/08459c77b2b603427a7f8d50e208f1bee5a6467f))
* **powerpoint:** add Disable Login Requirement patch ([26f46a5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/26f46a56c9bbb10b77ab500bb9e0159315edfc9b))
* **powerpoint:** add fingerprint definitions for core patches ([231a655](https://github.com/kveld9/kveld-extra-morphe-patches/commit/231a6553c18b35b255038a723150880fbbaf3ce8))
* **powerpoint:** add Remove Shared User ID patch ([756ec78](https://github.com/kveld9/kveld-extra-morphe-patches/commit/756ec78caaab35619f2aafd4c5d8a85d6c652930))
* **powerpoint:** add Unlock 365 Family patch ([bd3d3c6](https://github.com/kveld9/kveld-extra-morphe-patches/commit/bd3d3c67c14d000495e6fc84473f365e94a70847))

### Code Refactoring

* **powerpoint:** merge ad measurement nullification into telemetry blocking patch ([90e6559](https://github.com/kveld9/kveld-extra-morphe-patches/commit/90e6559c008632e53781c899500f26bb5228abd8))

## [1.2.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.1.0...v1.2.0) (2026-10-09)

### Bug Fixes

* **powerpoint:** preserve crash delegation in telemetry block ([e37c4ba](https://github.com/kveld9/kveld-extra-morphe-patches/commit/e37c4ba2ec32f6b835e7fabf989a7429b877343b))
* **powerpoint:** preserve RTL mirrors in DPI slimmer ([dfed437](https://github.com/kveld9/kveld-extra-morphe-patches/commit/dfed43783fb50eaed19267fbe795185fab8726c7))
* **powerpoint:** state exact telemetry coverage in descriptions ([c329fc9](https://github.com/kveld9/kveld-extra-morphe-patches/commit/c329fc964570b978a485de52034756a13fd0c041))
* **powerpoint:** warn of crash mode in native slimmer ([28da4ce](https://github.com/kveld9/kveld-extra-morphe-patches/commit/28da4ce3540393202c4e4c235552798e75b78407))

### New Features

* **moovit:** add Block Telemetry and Trackers patch ([0d299ee](https://github.com/kveld9/kveld-extra-morphe-patches/commit/0d299ee4dc52a86a4efdddf3932cd6b69ba4bd2d))
* **moovit:** add Locale Slimmer patch ([a85c748](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a85c7489f3b7eb665dff590fdf335d7bb9bba02c))
* **moovit:** add Screen Density Slimmer patch ([1cb8fb6](https://github.com/kveld9/kveld-extra-morphe-patches/commit/1cb8fb663a7826a4be6e98044f8ed3ad16001eaf))
* **powerpoint:** add Block Telemetry and Trackers patch ([4fa1484](https://github.com/kveld9/kveld-extra-morphe-patches/commit/4fa14847adc7ac1cea3dea18a52133669c196b6b))
* **powerpoint:** add Companion Native Slimmer patch ([676f133](https://github.com/kveld9/kveld-extra-morphe-patches/commit/676f133318f137841ca15059cb62550363f54822))
* **powerpoint:** add DPI Slimmer patch ([2723dfd](https://github.com/kveld9/kveld-extra-morphe-patches/commit/2723dfd7336acc86cb5c2860d3256e0e35614ce8))
* **powerpoint:** add Locale Slimmer patch ([b9a9de5](https://github.com/kveld9/kveld-extra-morphe-patches/commit/b9a9de5255762033f6467da3057ffa1c04f1ebf0))
* **tooling:** add telemetry-app command for parallel patch onboarding ([9cdc0a3](https://github.com/kveld9/kveld-extra-morphe-patches/commit/9cdc0a3d084f524087dd415811b3d82b99ad1140))
* **twitter:** add block telemetry patch ([19c53df](https://github.com/kveld9/kveld-extra-morphe-patches/commit/19c53dfb578e68448318f6015d8c913735ac3d98))
* **twitter:** add mlkit vision slimmer patch ([44eb9ce](https://github.com/kveld9/kveld-extra-morphe-patches/commit/44eb9ce5a6967fff4265732848fe12dcdf8f43b5))

## [1.1.0](https://github.com/kveld9/kveld-extra-morphe-patches/compare/v1.0.0...v1.1.0) (2026-10-09)

### New Features

* **instagram:** add opt-in MLKit vision slimmer ([38d891f](https://github.com/kveld9/kveld-extra-morphe-patches/commit/38d891f437a4fcdc9c101a4f54f4bf16a09349d4))

## 1.0.0 (2026-10-09)

### Bug Fixes

* **instagram:** neutralize analytics upload dispatchers at bytecode level ([67cfa6e](https://github.com/kveld9/kveld-extra-morphe-patches/commit/67cfa6ef59c88cd8246919dd9690802375e32601))
* **tooling:** append missing .apk extension to -DoutputApk base output ([3608f71](https://github.com/kveld9/kveld-extra-morphe-patches/commit/3608f71227963c766ed1c9e0bfd16950b5e4c1df))

### New Features

* **instagram:** block telemetry and trackers via manifest purge ([f316cca](https://github.com/kveld9/kveld-extra-morphe-patches/commit/f316ccaf63ad5a4f15da4c368b06dd8ee604ce92))
* **shared:** port generic bytecode, locale, manifest, and resource helpers ([a1cbb85](https://github.com/kveld9/kveld-extra-morphe-patches/commit/a1cbb8530794c944dfbd5e419fac9c504996923c))

### Code Refactoring

* **tooling:** port generic runner gates and timing telemetry to test harness ([3e8f630](https://github.com/kveld9/kveld-extra-morphe-patches/commit/3e8f6305e3adafe5608cec51d9439e82868fc56a))
