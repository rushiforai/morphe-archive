# [1.2.0](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.1.2...v1.2.0) (2026-11-28)


### Bug Fixes

* **Amazon Shopping:** Remove the empty cards left by hidden sponsored products ([7a1bacd](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7a1bacd7e8f898df95ac5d3df0140add012af1ee)), closes [#135](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/135)
* **ci:** Do not bump a version whose issue is labeled "not patchable" ([5bd73a2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5bd73a298f129e2e02b3001e919c5900c0429595))
* **ci:** Read Android TV patches in the update check, and accept "v1.2.3" versions ([15cf9c1](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/15cf9c175ef264111bed91ebcd5d787c0d01fbac))
* **ci:** Report an Android restart in the launch check instead of blaming the app ([c665e0c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c665e0c832baded494b3d3cec6329908408f2272))
* **ci:** Run the launch check on an Android 16 emulator ([af3aac3](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/af3aac3b2ca9538e0291e3fbd7b314dce64f4b84))
* **cnn:** Explain that Faster launch is not needed on 26.23.0 ([e18d1f3](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e18d1f37ba089aacf04fd5364114bcd6d0cb050f))
* **ebay:** cover every eBay Live surface in Hide live listings ([e702668](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e702668433a849b6fd31f049de9aa8817f894657))
* **ebay:** hide the Home-tab eBay Live shelf too ([d1c4919](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d1c4919856d8b0c8ac4d2437553de863f9b0a486))
* **espn:** Find the ad-disabled flag in 8.30.0 ([d3a110f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d3a110f9f805ea2ae9c2afa7dd786ba6e7ea950a))
* **gmscore:** Keep gRPC header keys intact ([8c4a448](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/8c4a4485e87d2fbd2c9282b1c9cca719aaafaac6))
* keep unconfirmed apps experimental in the stable bundle ([e4c7f46](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e4c7f4614c1cf9458fd1f7d01086d4782a5ea60e))
* **mlb:** Keep the playlist header when a preroll ad is removed ([b022a02](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/b022a02547a80cc211716efca59ec6ad648816ad)), closes [#EXTM3U](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/EXTM3U) [#EXT-X-TARGETDURATION](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/EXT-X-TARGETDURATION) [#EXT-X-MEDIA-SEQUENCE](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/EXT-X-MEDIA-SEQUENCE) [#EXT-X-KEY](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/EXT-X-KEY) [#EXT-X-MAP](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/EXT-X-MAP)
* **Moviebase:** Stop targeting 7.7.2, which closes when patched ([fe33f4f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/fe33f4f8545cc53f011572527c7d72762b974ac9)), closes [#158](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/158)
* **Netflix:** Turn Respect rotation lock off by default ([30dbfa8](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/30dbfa815042e4236261ef682ee2f39208e434cc)), closes [#142](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/142)
* **nytimes:** default Library pass reminder URL to blank ([0306eeb](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/0306eebdef239d8ee935218acbcf7a6c9d4b8c3d))
* **plex:** Accept both Plex 2026.23.0 builds ([d702f76](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d702f7665e04734705a6cff4e7d3d822d88599c9))
* **plex:** Support Plex 2026.23.0 ([4ba1e68](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/4ba1e685b667ddd02c8d69ca4ab334d032cbb9fe))
* **primevideo:** Skip the ads built into the video stream and keep subtitles in sync ([caa42ba](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/caa42ba06ac034a20bdb493d1dd863dc9f3ca7e9))
* **reuters:** port Hide prompts "promotions" to 8.1.0 ([f46a92c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f46a92cb26172e9d7e15d85c924ac8a6538d26ef))
* **reuters:** support 8.1.0 for most patches ([374663e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/374663e6138467e4a5f31c796174b0f2a0c7a053))
* testing ABC News 8.101.0, Amazon Shopping 32.20.2.100, Costco 26.11.1, CVS 26.11.31, Fox News 5.52.0, Lowe's 26.10.8, Mint Mobile 2.3.43, Moviebase 7.7.2, MS NOW 14.7.1, National Forests & Grasslands 1.4.0, Recreation.gov 2.2.69, Slickdeals 6.37.0, Sundance Now 5.0.30.1, The Daily Wire 3.5.24, The Home Depot 8.2.8, The New York Times 12.1.0, Truth Social 1.28.4, Xfinity 6.16.0-2 ([eb57477](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/eb57477a78cf47d4aca56f4f613ade200937847c))
* testing DealSeek 1.66.17, Slickdeals 6.37.1 ([6fc2143](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6fc21431e1455ea1001851ab08f18a2c8b82936b))
* testing DealSeek 1.67.0, Flipp 116.2.0 ([06f773f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/06f773f05cb8de7d0c21f8d5c224e55dc18fb6c9))
* testing Disney+ 26.21.0+rc3-2026.11.17, Prime Video 3.0.481.2847, The Daily Wire 3.5.23, The New York Times 12.0.0 ([a154e7e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a154e7e1eb001eefa3b72c1ce2228ed5f1fead94))
* testing ESPN 8.30.1, NFL 61.0.22, Substack 3.15.1 ([5c8b2f5](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5c8b2f51cb246781b1b1dc32690e48223990cb5a))
* testing Flipp 116.1.0, Fox News 5.51.0, myAT&T 2026.11.2, Prime Video 3.0.481.2447, Visible 3.0.7, Walmart 26.42.3 ([8aec1da](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/8aec1daa67f856146d6f457fef012530c1f71ff7))
* testing Fox One 1.26.0 ([d0f8142](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d0f814221a6592a1a6e2b5b2e0ba047875796cf5))
* testing HBO Max 22.1.0.340 ([2c2c48d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2c2c48d87ea9a5fa8434963564abd19135ceb336)), closes [#143](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/143) [#144](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/144)
* testing JustWatch 26.46.2, Tubi 10.46.0 ([2bb8e74](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2bb8e74e0198a8e54e3b0389d6ef3b2ab92e03dd))
* testing JustWatch 26.47.1, MLB 26.22.0.41, Substack 3.15.0 ([13d5c4f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/13d5c4f68e8c06f90b76e860c957cdec2ccc4ff2))
* testing Koupon 3.1.9, Moviebase 7.7.2, Settings Home 1.6.7 ([ba2abb1](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/ba2abb16a35ec98277bda328e948cebf03995ea6))
* testing NBA 1.4.2, RetailMeNot 10.2.0 ([eadfe53](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/eadfe531aa0ab516217ed771d262c4753773bff9))
* testing NFL 61.0.21 ([2a9ba0e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2a9ba0eff789264a371fe59b196211eff0373bc6))
* testing Paramount+ 17.4.1 ([e4545e7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e4545e7f7a7aca3ece5624498d4273d12873c24c))
* testing Peacock 7.11.22, Prime Video 3.0.482.2147, Walgreens 119.0 ([a48578f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a48578f15f1fc2f93c87235807e58c7a1969ccb4))
* testing Prime Video 3.0.482.1447, YouTube TV 10.47.0 ([046ab8d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/046ab8d22315c1d6ce5c28f079e0c81e5dfff8d0))
* testing Substack 3.14.0, Settings Home 1.6.6 ([0bbd075](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/0bbd075bd239a92d45e34a131f90dac8c7ca7a5f))
* testing Yahoo Finance 26.23.0, Koupon 3.1.8 ([7f8fe03](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7f8fe0313cd1847eaeecf7724e8f3ace5114abc8))
* **updates:** Check apps whose versions are build hashes against Google Play ([2fcdc4b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2fcdc4b3eac8db01bca3d13dd97f2403aa054f89))
* **updates:** Check Google Play when APKPure lacks a newer version ([6c28c32](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6c28c320f2a12a93b0ffcf49db182e3e72877b85))
* **wsj:** Find the profile Subscribe Now button on 15.12.0 ([95ce6d8](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/95ce6d8c9dca8b84120c361b6572bd2afb63ffc5))
* **wsj:** Stop scrolling up from getting stuck at removed feed ads ([1265184](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1265184b4dded03af455121e5ac68ea8575fc856))
* **yahoofinance:** Find renamed classes by their signatures for 26.23.0 ([54e5e17](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/54e5e17e9de94ef47c0d9917e9174f9908ee43db))
* **yahoonews:** Hide the ad slots in web articles ([7e5a249](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7e5a249d7a85bbdd6945cc784e31852db5d47576)), closes [#131](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/131)
* **yttv:** Make the skip button labels match the chosen skip interval ([77b5269](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/77b52696620cadf63b3283c85959acd459bb869f))
* **yttv:** Make the swipe sliders, press-and-hold, and set playback speed work ([830d796](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/830d796d250572e44df9999b028ae365f2c85769))
* **yttv:** Make the volume and brightness swipe register ([c8cc5a5](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c8cc5a54f8ab58be12718e02e60160ec6b1b8f43))


### Features

* Add Al Jazeera and South China Morning Post ([d855162](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d855162ada0120e9a7317731a71fbfc4e18484d8)), closes [#171](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/171) [#174](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/174)
* Add BBC: World News & Stories and Fawesome ([1053d88](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1053d889bcd0b13cd0eb2d57acadc8c37145f424)), closes [#130](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/130) [#137](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/137)
* add CGTN, CNA, Xinhua, Yonhap, and The Straits Times news apps ([870d283](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/870d283af0a3be6bc5c94dd4c657e353947a0c8c))
* **cnn:** support 26.24.0 ([89316c1](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/89316c1e2cac20c654c99cb2bbeac1cd4ad4cb59))
* **consumerreports:** add Consumer Reports 5.25.0-1326 ([c92e644](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c92e644cfa642ecaeb756e21d5db0493af003af2))
* **dealseek:** add experimental option to skip the sign-up marketing screen ([32cf63a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/32cf63a1cd50706d70d6c38e682c5a2577728e59))
* **dealseek:** strip the text-alert and promo prompts ([47f7d2b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/47f7d2b8ba97381c080d7ae7301d36b8afd8c7fe))
* **ebay:** Add eBay 6.244.0.1 patches ([4812521](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/4812521900197c43c4c871b1cbbcdfc451d5fd87))
* **ebay:** Hide live listings ([d374a46](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d374a469a44ad0b169d74d388ab0598d0d473bd1))
* **foxnews:** Add Hide comments and reactions, and Hide app promotions ([1a08ffd](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1a08ffd307ecabe7fd1dc680f9ebed8577726669)), closes [#132](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/132)
* **libby:** add Libby (9.6.0) baseline ([d03de3b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d03de3b11cab6e07d5cc5a17d4e91adf26a27acb))
* Merge related patches into options ([48bb76b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/48bb76b65a6382574bba481e28499832de695bdb))
* **moviesanywhere:** Add Movies Anywhere 1.54.0 with prompts and quality patches ([95a24cf](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/95a24cf9c78cd07b3b8bf41ff8d87746b38ac597))
* **Netflix:** Add "Respect rotation lock" patch ([094a45c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/094a45c22047bd8f750ebcceee51a1bb9cb39252)), closes [#142](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/142)
* **netflix:** add patch to keep the player open while paused ([f5f7bc3](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f5f7bc3b635f9f5c79e373d442f1f8738d1e9805))
* **netflix:** Automatically skip intros and recaps ([a60e907](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a60e907554c68c5a4b5bc8075e1c1d03ced3b600))
* **netflix:** Keep Picture-in-Picture available when Netflix turns it off ([3e7b3db](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3e7b3db262b32d5550d90e2e72d6af1a22157d6e))
* **netflix:** Keep playing in the background ([1af12c2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1af12c230e0fa968d2487054dfc62139dcdd1e29))
* **NHK WORLD-JAPAN:** Add Skip cookie settings and Block analytics & tracking ([18bb4b1](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/18bb4b15b4ae030e2428b06b71c90942a38a4543)), closes [#150](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/150)
* **Nikkei Asia:** Add Hide subscriber-only buttons and Block analytics & tracking ([46bba84](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/46bba8443c49d869f92ccfd1a4305aa3922cba78)), closes [#149](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/149)
* **nytimes:** add Library pass reminder (opt-in, experimental) ([fc5501c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/fc5501c049e1cb4d6a3ac3592a12df9e3056698b))
* **nytimes:** trigger Library pass reminder on account status, not just the paywall ([cf6327d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cf6327df78c01334d47b3ceb26697c0a963ea712))
* Patch phone apps only, without the Android TV apps ([1304d22](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1304d221e4f459a22555cf1c21850a2e613ff233))
* **privacy:** block FullStory session replay in the shared blocklist ([a9c99c7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a9c99c71e17a2416fda9a0ae19ffda6637a7c9b5))
* **release:** Begin the 1.2.0 dev line ([359312e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/359312ec560ac0a369b3cde7bbae5a59318e39b0))
* **reuters:** Add Hide paywall overlay, and support 8.0.0 ([f5299fb](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f5299fbcfa41709126ac99318ba3fe7959b98b59))
* route every news app's traffic through a proxy ([e9f9f5b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e9f9f5b6e448e86d3cdd7e6c7f48d1b8db06fa52))
* Sort every patch into a folder ([d31685c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d31685cfc921377031487ad6448ab25fcf32211a))
* **substack:** Add GmsCore support for Google sign-in ([f90b82d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f90b82d56ef9099b4fe26d336c01601ceb8acd8d))
* **tlife:** Add Mask device identity with relaxed and aggressive modes ([f7450fb](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f7450fb50c6001bc13a7f016e22a91454758ef26))
* **viki:** add Viki support with Skip ads, Block analytics, and shared privacy patches ([ca73724](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/ca737246539c6ca210616d0a125e0b45921ada76))
* **washingtonpost:** Hide the edge of the next article at the top of an article ([ba62ac2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/ba62ac25eaeb4073502f3913e56f0ce7fff0a51a)), closes [#98](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/98)
* **washingtonpost:** Skip the age check error dialog when Google Play cannot check ([5fb7d8f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5fb7d8f7545e0d49aa05b2bd6f4548fb4a242eb7))
* **wsj:** Add Hide paywall overlay ([c22a857](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c22a857c3e62fd4721c62265139c9706b2357095))
* **wsj:** Hide the welcome tour, cookie pop-ups, and subscription offers ([daa437a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/daa437a657ada2b912daf511eeb35f86d4d3901c))
* **yttv:** Add Change the seek interval for the double tap and buttons ([05bc250](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/05bc2502da574a4a9cab1eff0180ff80c9c178e2))
* **yttv:** Add press-and-hold speed-up and a set-playback-speed option ([0210671](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/02106711f34442d14a3076d143aab2308534d2da)), closes [#102](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/102) [#100](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/100)
* **yttv:** Add volume and brightness sliders ([e5467a2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e5467a21a92fdee297143ce7a1550f2ff0792498)), closes [#103](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/103)
* **yttv:** Change how far the skip buttons and double-tap move ([5f21f3e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5f21f3e6c23541fd0a6de9062277571ac0aeef9e)), closes [#101](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/101)
* **yttv:** Stop live channel tiles from playing previews ([24705e8](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/24705e8517805bad00f1e23bace801e4bc284d73)), closes [#99](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/99)

# [1.2.0-dev.52](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.51...v1.2.0-dev.52) (2026-11-28)


### Bug Fixes

* keep unconfirmed apps experimental in the stable bundle ([e4c7f46](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e4c7f4614c1cf9458fd1f7d01086d4782a5ea60e))

# [1.2.0-dev.51](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.50...v1.2.0-dev.51) (2026-11-28)


### Bug Fixes

* **mlb:** Keep the playlist header when a preroll ad is removed ([6cc20c9](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6cc20c98430f3601424fc3c42ba6fcd152a518f8))


### Features

* **ebay:** Add eBay 6.244.0.1 patches ([7ce66f7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7ce66f76f539fbb2b92bb10131f1f3d87118c02a))

# [1.2.0-dev.50](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.49...v1.2.0-dev.50) (2026-11-28)


### Bug Fixes

* **nytimes:** default Library pass reminder URL to blank ([0306eeb](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/0306eebdef239d8ee935218acbcf7a6c9d4b8c3d))


### Features

* **nytimes:** add Library pass reminder (opt-in, experimental) ([fc5501c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/fc5501c049e1cb4d6a3ac3592a12df9e3056698b))
* **nytimes:** trigger Library pass reminder on account status, not just the paywall ([cf6327d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cf6327df78c01334d47b3ceb26697c0a963ea712))

# [1.2.0-dev.49](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.48...v1.2.0-dev.49) (2026-11-27)


### Features

* **consumerreports:** add Consumer Reports 5.25.0-1326 ([c92e644](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c92e644cfa642ecaeb756e21d5db0493af003af2))
* **libby:** add Libby (9.6.0) baseline ([d03de3b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d03de3b11cab6e07d5cc5a17d4e91adf26a27acb))
* **privacy:** block FullStory session replay in the shared blocklist ([a9c99c7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a9c99c71e17a2416fda9a0ae19ffda6637a7c9b5))

# [1.2.0-dev.48](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.47...v1.2.0-dev.48) (2026-11-27)


### Bug Fixes

* **ebay:** cover every eBay Live surface in Hide live listings ([e702668](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e702668433a849b6fd31f049de9aa8817f894657))
* **ebay:** hide the Home-tab eBay Live shelf too ([d1c4919](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d1c4919856d8b0c8ac4d2437553de863f9b0a486))

# [1.2.0-dev.47](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.46...v1.2.0-dev.47) (2026-11-27)


### Bug Fixes

* testing Koupon 3.1.9, Moviebase 7.7.2, Settings Home 1.6.7 ([ba2abb1](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/ba2abb16a35ec98277bda328e948cebf03995ea6))

# [1.2.0-dev.46](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.45...v1.2.0-dev.46) (2026-11-27)


### Features

* **ebay:** Add eBay 6.244.0.1 patches ([4812521](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/4812521900197c43c4c871b1cbbcdfc451d5fd87))
* **ebay:** Hide live listings ([d374a46](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d374a469a44ad0b169d74d388ab0598d0d473bd1))

# [1.2.0-dev.45](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.44...v1.2.0-dev.45) (2026-11-27)


### Bug Fixes

* **reuters:** port Hide prompts "promotions" to 8.1.0 ([f46a92c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f46a92cb26172e9d7e15d85c924ac8a6538d26ef))

# [1.2.0-dev.44](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.43...v1.2.0-dev.44) (2026-11-27)


### Features

* add CGTN, CNA, Xinhua, Yonhap, and The Straits Times news apps ([870d283](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/870d283af0a3be6bc5c94dd4c657e353947a0c8c))

# [1.2.0-dev.43](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.42...v1.2.0-dev.43) (2026-11-27)


### Bug Fixes

* **reuters:** support 8.1.0 for most patches ([374663e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/374663e6138467e4a5f31c796174b0f2a0c7a053))


### Features

* **cnn:** support 26.24.0 ([89316c1](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/89316c1e2cac20c654c99cb2bbeac1cd4ad4cb59))

# [1.2.0-dev.42](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.41...v1.2.0-dev.42) (2026-11-27)


### Features

* **viki:** add Viki support with Skip ads, Block analytics, and shared privacy patches ([ca73724](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/ca737246539c6ca210616d0a125e0b45921ada76))

# [1.2.0-dev.41](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.40...v1.2.0-dev.41) (2026-11-27)


### Features

* **netflix:** add patch to keep the player open while paused ([f5f7bc3](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f5f7bc3b635f9f5c79e373d442f1f8738d1e9805))

# [1.2.0-dev.40](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.39...v1.2.0-dev.40) (2026-11-27)


### Features

* **dealseek:** add experimental option to skip the sign-up marketing screen ([32cf63a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/32cf63a1cd50706d70d6c38e682c5a2577728e59))

# [1.2.0-dev.39](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.38...v1.2.0-dev.39) (2026-11-27)


### Features

* **dealseek:** strip the text-alert and promo prompts ([47f7d2b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/47f7d2b8ba97381c080d7ae7301d36b8afd8c7fe))

# [1.2.0-dev.38](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.37...v1.2.0-dev.38) (2026-11-26)


### Bug Fixes

* testing DealSeek 1.67.0, Flipp 116.2.0 ([06f773f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/06f773f05cb8de7d0c21f8d5c224e55dc18fb6c9))

# [1.2.0-dev.37](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.36...v1.2.0-dev.37) (2026-11-25)


### Bug Fixes

* testing DealSeek 1.66.17, Slickdeals 6.37.1 ([6fc2143](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6fc21431e1455ea1001851ab08f18a2c8b82936b))

# [1.2.0-dev.36](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.35...v1.2.0-dev.36) (2026-11-25)


### Features

* route every news app's traffic through a proxy ([e9f9f5b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e9f9f5b6e448e86d3cdd7e6c7f48d1b8db06fa52))

# [1.2.0-dev.35](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.34...v1.2.0-dev.35) (2026-11-25)


### Bug Fixes

* testing ESPN 8.30.1, NFL 61.0.22, Substack 3.15.1 ([5c8b2f5](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5c8b2f51cb246781b1b1dc32690e48223990cb5a))

# [1.2.0-dev.34](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.33...v1.2.0-dev.34) (2026-11-25)


### Features

* Add Al Jazeera and South China Morning Post ([d855162](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d855162ada0120e9a7317731a71fbfc4e18484d8)), closes [#171](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/171) [#174](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/174)

# [1.2.0-dev.33](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.32...v1.2.0-dev.33) (2026-11-25)


### Bug Fixes

* **Amazon Shopping:** Remove the empty cards left by hidden sponsored products ([7a1bacd](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7a1bacd7e8f898df95ac5d3df0140add012af1ee)), closes [#135](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/135)

# [1.2.0-dev.32](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.31...v1.2.0-dev.32) (2026-11-25)


### Bug Fixes

* **ci:** Do not bump a version whose issue is labeled "not patchable" ([5bd73a2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5bd73a298f129e2e02b3001e919c5900c0429595))
* **ci:** Report an Android restart in the launch check instead of blaming the app ([c665e0c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c665e0c832baded494b3d3cec6329908408f2272))
* **ci:** Run the launch check on an Android 16 emulator ([af3aac3](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/af3aac3b2ca9538e0291e3fbd7b314dce64f4b84))
* **Moviebase:** Stop targeting 7.7.2, which closes when patched ([fe33f4f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/fe33f4f8545cc53f011572527c7d72762b974ac9)), closes [#158](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/158)
* **Netflix:** Turn Respect rotation lock off by default ([30dbfa8](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/30dbfa815042e4236261ef682ee2f39208e434cc)), closes [#142](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/142)
* testing ABC News 8.101.0, Amazon Shopping 32.20.2.100, Costco 26.11.1, CVS 26.11.31, Fox News 5.52.0, Lowe's 26.10.8, Mint Mobile 2.3.43, Moviebase 7.7.2, MS NOW 14.7.1, National Forests & Grasslands 1.4.0, Recreation.gov 2.2.69, Slickdeals 6.37.0, Sundance Now 5.0.30.1, The Daily Wire 3.5.24, The Home Depot 8.2.8, The New York Times 12.1.0, Truth Social 1.28.4, Xfinity 6.16.0-2 ([eb57477](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/eb57477a78cf47d4aca56f4f613ade200937847c))
* **updates:** Check apps whose versions are build hashes against Google Play ([2fcdc4b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2fcdc4b3eac8db01bca3d13dd97f2403aa054f89))


### Features

* **NHK WORLD-JAPAN:** Add Skip cookie settings and Block analytics & tracking ([18bb4b1](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/18bb4b15b4ae030e2428b06b71c90942a38a4543)), closes [#150](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/150)
* **Nikkei Asia:** Add Hide subscriber-only buttons and Block analytics & tracking ([46bba84](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/46bba8443c49d869f92ccfd1a4305aa3922cba78)), closes [#149](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/149)

# [1.2.0-dev.32](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.31...v1.2.0-dev.32) (2026-11-25)


### Bug Fixes

* **ci:** Report an Android restart in the launch check instead of blaming the app ([c665e0c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c665e0c832baded494b3d3cec6329908408f2272))
* **ci:** Run the launch check on an Android 16 emulator ([af3aac3](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/af3aac3b2ca9538e0291e3fbd7b314dce64f4b84))
* testing ABC News 8.101.0, Amazon Shopping 32.20.2.100, Costco 26.11.1, CVS 26.11.31, Fox News 5.52.0, Lowe's 26.10.8, Mint Mobile 2.3.43, Moviebase 7.7.2, MS NOW 14.7.1, National Forests & Grasslands 1.4.0, Recreation.gov 2.2.69, Slickdeals 6.37.0, Sundance Now 5.0.30.1, The Daily Wire 3.5.24, The Home Depot 8.2.8, The New York Times 12.1.0, Truth Social 1.28.4, Xfinity 6.16.0-2 ([eb57477](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/eb57477a78cf47d4aca56f4f613ade200937847c))

# [1.2.0-dev.32](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.31...v1.2.0-dev.32) (2026-11-24)


### Bug Fixes

* testing ABC News 8.101.0, Amazon Shopping 32.20.2.100, Costco 26.11.1, CVS 26.11.31, Fox News 5.52.0, Lowe's 26.10.8, Mint Mobile 2.3.43, Moviebase 7.7.2, MS NOW 14.7.1, National Forests & Grasslands 1.4.0, Recreation.gov 2.2.69, Slickdeals 6.37.0, Sundance Now 5.0.30.1, The Daily Wire 3.5.24, The Home Depot 8.2.8, The New York Times 12.1.0, Truth Social 1.28.4, Xfinity 6.16.0-2 ([eb57477](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/eb57477a78cf47d4aca56f4f613ade200937847c))

# [1.2.0-dev.31](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.30...v1.2.0-dev.31) (2026-11-24)


### Bug Fixes

* testing HBO Max 22.1.0.340 ([2c2c48d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2c2c48d87ea9a5fa8434963564abd19135ceb336)), closes [#143](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/143) [#144](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/144)
* **updates:** Check Google Play when APKPure lacks a newer version ([6c28c32](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6c28c320f2a12a93b0ffcf49db182e3e72877b85))

# [1.2.0-dev.30](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.29...v1.2.0-dev.30) (2026-11-24)


### Bug Fixes

* testing Peacock 7.11.22, Prime Video 3.0.482.2147, Walgreens 119.0 ([a48578f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a48578f15f1fc2f93c87235807e58c7a1969ccb4))

# [1.2.0-dev.29](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.28...v1.2.0-dev.29) (2026-11-24)


### Bug Fixes

* **yahoonews:** Hide the ad slots in web articles ([7e5a249](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7e5a249d7a85bbdd6945cc784e31852db5d47576)), closes [#131](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/131)

# [1.2.0-dev.28](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.27...v1.2.0-dev.28) (2026-11-24)


### Features

* **Netflix:** Add "Respect rotation lock" patch ([14872b1](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/14872b1f2f30f8c9a017d21c7ddca3223316d85e)), closes [#142](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/142)

# [1.2.0-dev.27](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.26...v1.2.0-dev.27) (2026-11-24)


### Bug Fixes

* testing Yahoo Finance 26.23.0, Koupon 3.1.8 ([29c0a34](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/29c0a34ab165cdcba5b47b184f2d6b0fe8337e69))

# [1.2.0-dev.26](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.25...v1.2.0-dev.26) (2026-11-24)


### Bug Fixes

* **ci:** Read Android TV patches in the update check, and accept "v1.2.3" versions ([9280da5](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/9280da550768a3ae640c8e61f658c1fb2c03dd2a))
* **gmscore:** Keep gRPC header keys intact ([b0074c0](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/b0074c0edf71b5ef0e89228ba70b0a297cf446c4))
* **yahoofinance:** Find renamed classes by their signatures for 26.23.0 ([e4d949a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e4d949a9340921298d69c3ec7400ca5480799e1f))


### Features

* Add BBC: World News & Stories and Fawesome ([1081b30](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1081b3071d34727a9694126a124968fc95eaf763)), closes [#130](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/130) [#137](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/137)
* **foxnews:** Add Hide comments and reactions, and Hide app promotions ([2cbe9b0](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2cbe9b09342025ea11e918ed09201b27d3b2ef9c)), closes [#132](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/132)
* **reuters:** Add Hide paywall overlay, and support 8.0.0 ([909b7b5](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/909b7b5c13fca6880f9a8a8e5d627fb467b9ae29))

# [1.2.0-dev.25](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.24...v1.2.0-dev.25) (2026-11-24)


### Bug Fixes

* testing JustWatch 26.47.1, MLB 26.22.0.41, Substack 3.15.0 ([d3f129c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d3f129c3ebdb812fd302d574e89dcdf73548e8f3))

# [1.2.0-dev.24](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.23...v1.2.0-dev.24) (2026-11-21)


### Bug Fixes

* testing Prime Video 3.0.482.1447, YouTube TV 10.47.0 ([3e78040](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3e78040ba214bf6ef1ac992ca4ae9a5dd41dfd19))

# [1.2.0-dev.23](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.22...v1.2.0-dev.23) (2026-11-20)


### Bug Fixes

* testing NBA 1.4.2, RetailMeNot 10.2.0 ([54e00c5](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/54e00c5689ae9663cbdc915743ac3c9ce513a691))

# [1.2.0-dev.22](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.21...v1.2.0-dev.22) (2026-11-20)


### Bug Fixes

* testing Disney+ 26.21.0+rc3-2026.11.17, Prime Video 3.0.481.2847, The Daily Wire 3.5.23, The New York Times 12.0.0 ([420c7de](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/420c7dee26baed86420e9d09c481fef5bb07e974))

# [1.2.0-dev.21](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.20...v1.2.0-dev.21) (2026-11-19)


### Bug Fixes

* testing Fox One 1.26.0 ([cc1b7f3](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cc1b7f32fb2b2bc00d3dd934abe96f4a84a427d5))

# [1.2.0-dev.20](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.19...v1.2.0-dev.20) (2026-11-19)


### Bug Fixes

* testing JustWatch 26.46.2, Tubi 10.46.0 ([88b932d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/88b932ded169dacc99b8f1cb45898474024304c8))

# [1.2.0-dev.19](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.18...v1.2.0-dev.19) (2026-11-19)


### Bug Fixes

* **cnn:** Explain that Faster launch is not needed on 26.23.0 ([bb74b1e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/bb74b1efa98a2d97c3f7508b32a5a8870db639c7))

# [1.2.0-dev.18](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.17...v1.2.0-dev.18) (2026-11-19)


### Bug Fixes

* **plex:** Accept both Plex 2026.23.0 builds ([f0f39bb](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f0f39bbfe5239997997063103e27370223541dbb))

# [1.2.0-dev.17](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.16...v1.2.0-dev.17) (2026-11-19)


### Bug Fixes

* **plex:** Support Plex 2026.23.0 ([3a10191](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3a10191295530a4fa0a46dac36d5fb127d7090a5))

# [1.2.0-dev.16](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.15...v1.2.0-dev.16) (2026-11-19)


### Bug Fixes

* **wsj:** Find the profile Subscribe Now button on 15.12.0 ([f85d942](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f85d94264093cc384443d071f27c10a523a56296))
* **wsj:** Stop scrolling up from getting stuck at removed feed ads ([d14ef0a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d14ef0a16aab10a08bf173129064e7eef392c90b))


### Features

* **wsj:** Add Hide paywall overlay ([425a2d7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/425a2d72345479c40d860bfa43124eeab8917745))
* **wsj:** Hide the welcome tour, cookie pop-ups, and subscription offers ([470f694](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/470f694d0fbbcb8fe0ff394d64ce1afb0b3df4c8))

# [1.2.0-dev.15](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.14...v1.2.0-dev.15) (2026-11-19)


### Bug Fixes

* **yttv:** Make the skip button labels match the chosen skip interval ([705896c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/705896c5adfc78df98b6dcb618c8cfc318eeb87e))

# [1.2.0-dev.14](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.13...v1.2.0-dev.14) (2026-11-19)


### Bug Fixes

* **yttv:** Make the swipe sliders, press-and-hold, and set playback speed work ([2d257fd](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2d257fddd0b3f32e07cb8475708da539195fdcec))

# [1.2.0-dev.13](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.12...v1.2.0-dev.13) (2026-11-18)


### Bug Fixes

* **yttv:** Make the volume and brightness swipe register ([ddf6ba6](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/ddf6ba6268ac37742e3d118701fb4bbee0c75330))

# [1.2.0-dev.12](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.11...v1.2.0-dev.12) (2026-11-18)


### Bug Fixes

* testing Flipp 116.1.0, Fox News 5.51.0, myAT&T 2026.11.2, Prime Video 3.0.481.2447, Visible 3.0.7, Walmart 26.42.3 ([d6420af](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d6420af026d04a492a97c79ef582342e5cb9ba2c))


### Features

* **yttv:** Add press-and-hold speed-up and a set-playback-speed option ([37f775b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/37f775b0ed3214f2d518064752b253685a475546)), closes [#102](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/102) [#100](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/100)
* **yttv:** Add volume and brightness sliders ([88d427f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/88d427f0c2f3502c724b58d95c05960acc021872)), closes [#103](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/103)

# [1.2.0-dev.11](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.10...v1.2.0-dev.11) (2026-11-18)


### Bug Fixes

* testing Flipp 116.1.0, Fox News 5.51.0, myAT&T 2026.11.2, Prime Video 3.0.481.2447, Visible 3.0.7, Walmart 26.42.3 ([d6420af](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d6420af026d04a492a97c79ef582342e5cb9ba2c))


### Features

* **washingtonpost:** Hide the edge of the next article at the top of an article ([20aad32](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/20aad32a7f2927ddbdee49ac4c2c369125ea1d68)), closes [#98](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/98)
* **yttv:** Add press-and-hold speed-up and a set-playback-speed option ([37f775b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/37f775b0ed3214f2d518064752b253685a475546)), closes [#102](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/102) [#100](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/100)
* **yttv:** Add volume and brightness sliders ([88d427f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/88d427f0c2f3502c724b58d95c05960acc021872)), closes [#103](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/103)
* **yttv:** Change how far the skip buttons and double-tap move ([c1a9e48](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c1a9e48a061e9ef937585554e947c79242115a3f)), closes [#101](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/101)
* **yttv:** Stop live channel tiles from playing previews ([f442ce6](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f442ce61f575cc3bcc10bdfc3a5af8fdecf2398d)), closes [#99](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/99)

# [1.2.0-dev.11](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.10...v1.2.0-dev.11) (2026-11-18)


### Features

* **washingtonpost:** Hide the edge of the next article at the top of an article ([20aad32](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/20aad32a7f2927ddbdee49ac4c2c369125ea1d68)), closes [#98](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/98)
* **yttv:** Change how far the skip buttons and double-tap move ([c1a9e48](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c1a9e48a061e9ef937585554e947c79242115a3f)), closes [#101](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/101)
* **yttv:** Stop live channel tiles from playing previews ([f442ce6](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f442ce61f575cc3bcc10bdfc3a5af8fdecf2398d)), closes [#99](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/99)

# [1.2.0-dev.10](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.9...v1.2.0-dev.10) (2026-11-18)


### Features

* **tlife:** Add Mask device identity with relaxed and aggressive modes ([daa3897](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/daa3897fb30e9fe9f16522571e6dec47eba6f256))
* **yttv:** Add Change the seek interval for the double tap and buttons ([d3d44dc](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d3d44dc05e6f2f600aab2f596731e19ee2d534c6))

# [1.2.0-dev.9](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.8...v1.2.0-dev.9) (2026-11-18)


### Bug Fixes

* testing NFL 61.0.21 ([7fd328c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7fd328c3c7af7f7b6dff2d7615c82df38707abff))

# [1.2.0-dev.8](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.7...v1.2.0-dev.8) (2026-11-18)


### Features

* **netflix:** Automatically skip intros and recaps ([52fca9c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/52fca9c44160a136292390ed23239bec186fb5d6))
* **netflix:** Keep Picture-in-Picture available when Netflix turns it off ([06172dc](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/06172dce4a20f7109cab6612644b340ea9b20dba))
* **netflix:** Keep playing in the background ([88062f4](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/88062f4822b2cad5857c437128445b61f5b84522))

# [1.2.0-dev.7](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.6...v1.2.0-dev.7) (2026-11-18)


### Bug Fixes

* **primevideo:** Skip the ads built into the video stream and keep subtitles in sync ([867427a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/867427ad977d83883ada6ad1507cea6381fe02c2))

# [1.2.0-dev.6](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.5...v1.2.0-dev.6) (2026-11-18)


### Features

* **washingtonpost:** Skip the age check error dialog when Google Play cannot check ([b751374](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/b751374db8adb71337c5b50272b1ae3edc347fc5))

# [1.2.0-dev.5](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.4...v1.2.0-dev.5) (2026-11-18)


### Features

* **moviesanywhere:** Add Movies Anywhere 1.54.0 with prompts and quality patches ([97e56b8](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/97e56b8a39a5fff4c430249d2f0049a76caeed90))

# [1.2.0-dev.4](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.3...v1.2.0-dev.4) (2026-11-18)


### Bug Fixes

* **mlb:** Keep the playlist header when a preroll ad is removed ([d51516e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d51516eacffaaf8ac61180babc126e4d9ca6b703))

# [1.2.0-dev.3](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.2...v1.2.0-dev.3) (2026-11-18)


### Bug Fixes

* **espn:** Find the ad-disabled flag in 8.30.0 ([f82ecbf](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f82ecbf70c9698e49d88ad67b47f554037a7a4ca))
* testing Substack 3.14.0, Settings Home 1.6.6 ([23af522](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/23af5224a400d9ee5b29ef0eb55c80f64fe0da3d))


### Features

* **substack:** Add GmsCore support for Google sign-in ([7841bd0](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7841bd0a91c739376baf48c9af851a1358471e28))

# [1.2.0-dev.2](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.2.0-dev.1...v1.2.0-dev.2) (2026-11-17)


### Bug Fixes

* testing Paramount+ 17.4.1 ([004c0ec](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/004c0eceb1c5888229e0e404d0298d4072dcfdfb))

# [1.2.0-dev.1](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.1.0...v1.2.0-dev.1) (2026-11-17)

### Android TV

This source now patches phone apps only. The Android TV patches are in [TV Morphe Patches](https://github.com/semicoloncolonel/tv-morphe-patches). Add that source in Morphe Manager to keep receiving them.

### Folders

Every patch is now in one of five folders in Morphe Manager: Ads, Privacy, Interface, Playback, and Setup.

### Merged patches

Several small patches are now options of one patch. **Merged and renamed patches reset their saved selections in Morphe Manager**, so check their options before you patch again.

**Block analytics & tracking**
- Opt out of data sale & sharing is now its option "Opt out of data sale & sharing" on CBS News, CNN, Fox Local, Fox News, MS NOW, NBC News, and NPR. It is on by default.
- Block session recording is now its option "Session recording" on myAT&T, My Verizon, T-Life, and Visible. It is on by default.
- Block location tracking is now its option "Location tracking" on T-Life. It is on by default.
- Stop behavioral tracking is now its option "Behavioral tracking" on DealSeek and Koupon. It is off by default.
- On the 11 apps above with an option that is on by default, Block analytics & tracking is now on by default. Its own blocking of analytics services is the option "Analytics and tracking services", which is off by default. On DealSeek and Koupon, the patch stays off by default.

**Hide prompts and pop-ups**, a new patch for 23 apps. Every option is on by default.
- Hide rating prompt is now its option "Rating prompt" on Apple TV, CNBC, Kanopy, NewsBreak, Recreation.gov, and USA TODAY.
- Hide surveys is now its option "Surveys" on CBS News and RetailMeNot.
- Hide surveys and rating prompt is now its option "Surveys and rating prompt" on MLB, NBC News, and Walgreens.
- Hide pop-ups is now its option "Pop-ups" on Checkout 51, DealNews, DealSeek, Koupon, Walmart, Yahoo Finance, and Yahoo News.
- Hide marketing pop-ups is now its option "Marketing pop-ups" on The Washington Post and The Wall Street Journal.
- Hide promo banners is now its option "Promo banners" on C-SPAN Now and The Daily Wire.
- Hide promotions is now its option "Promotions" on Reuters.
- On CBS News, C-SPAN Now, Checkout 51, The Daily Wire, DealNews, DealSeek, Koupon, MLB, NBC News, RetailMeNot, Reuters, Walgreens, Walmart, The Washington Post, and The Wall Street Journal, Hide rating prompt is now the option "Rating prompt" of Hide prompts and pop-ups.

**Skip ads**
- Mask live ad breaks is now its option "Mask live ad breaks" on ABC News and Pluto TV, where it is on by default, and on MLB and Xumo Play, where it is experimental and off by default.
- Skip pre-roll promo is now its option "Skip pre-roll promo" on MGM+, where it is experimental and off by default.

Mask live ad breaks on Xumo Play and Skip pre-roll promo on MGM+ were on by default before. Turn the option on if you used them.

These stay their own patches: Block location tracking on Checkout 51, Mask live ad breaks on SiriusXM and YouTube TV, Skip pre-roll promo on Starz, and Hide promotions on White House.

## [1.1.2](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.1.1...v1.1.2) (2026-11-27)


### Features

* **ebay:** Add eBay 6.244.0.1 patches ([7ce66f7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7ce66f76f539fbb2b92bb10131f1f3d87118c02a))

## [1.1.1](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.1.0...v1.1.1) (2026-11-18)

### Bug fixes

- **MLB**: Skip ads no longer breaks a playlist that starts with an ad. Removing that ad also removed the lines that begin the playlist, so the video could not play. An encryption or map change right before an ad break is now kept as well.


# [1.1.0](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21...v1.1.0) (2026-11-17)

### Android TV

This is the last stable release of this source that includes the Android TV apps. From 1.2.0, the Android TV patches are only in [TV Morphe Patches](https://github.com/semicoloncolonel/tv-morphe-patches). Add that source in Morphe Manager to keep receiving them. In this release, each Android TV version is labeled in Morphe Manager as moving to the TV source, and patched Android TV apps show a one-time notice.

New Android TV apps:

- **Prime Video (Android TV)**: Skip ads (experimental), Force highest quality (off by default).
- **Hulu (Android TV)** (experimental): Skip ads, which removes the ads Hulu stitches into on-demand shows, and Block analytics and tracking (off by default).
- **YouTube TV** (the official Android TV app, 4.01.03): Skip ads (experimental). This app needs Android 12 or later.

Android TV builds now supported:

- **ESPN** 6.13.2, with Skip ads (experimental).
- **Fox One** 1.20.0.
- **MGM+** 241.0.2026241001.
- **MLB** 26.21.0.76, with Hide betting odds (off by default).
- **NBA** 1.1.0.20261026155843, with Skip ads (experimental) and Reject tracking consent.
- **NFL** 18.27.0, with Reject tracking consent.
- **PBS** 5.27.0.
- **Peacock** 7.10.200.
- **JustWatch** 26.44.5 and **NewsNation** 4.71.

YouTube for Android TV: Skip injected ads is now **YT TV+ (ad-free YouTube TV)**, a clearer name for the patch that turns it into a standalone, ad-free YouTube TV app. It now refuses an input without its native libraries, which made the patched app close on launch.

### New phone apps

- **Koupon**: Strip affiliate links, Keep new-user promo codes, Hide promo code countdown, Show promo codes, Hide pop-ups, Hide rewards, Hide sponsored cards, Hide rating prompt, Block analytics and tracking, Stop behavioral tracking, Disable AI, Hide device identifiers, Disable auto-updates, GmsCore support.
- **Netflix**: Bypass tamper protection (experimental), Browse hidden categories, Disable autoplay, Keep screen brightness, Remove bottom tabs, Hide device identifiers. All but Bypass tamper protection are off by default.
- **Reuters**: Hide promotions (experimental), Skip ads (experimental), Hide rating prompt, Customize bottom bar, Move Today section (experimental), Block analytics and tracking, Hide device identifiers, Disable auto-updates.

### New patches

- **Translate ad break screen** (experimental): shows the "We'll be right back!" screen in your device's language. ABC News, Fandango at Home, MLB, Pluto TV, Xumo Play, and YouTube TV.
- **Incognito reading** (experimental, off by default): stops the app from recording which articles you read. The New York Times, The Washington Post, and The Wall Street Journal.
- **Paramount+**: Force highest quality, and Enable picture-in-picture (experimental).
- **The Washington Post**: Hide paywall sheet, for 7.19.0.
- **HBO Max**: Force decode capability (experimental, off by default), which pairs with Video quality.
- **GmsCore support** (off by default), for Google sign-in: Flipp and Slickdeals.
- **National Forests & Grasslands**: Hide device identifiers (off by default).

### Changes

- **Hide device identifiers** now holds the other shared privacy patches as options: Spoof carrier, Report Wi-Fi connection, Hide VPN connection, Hide Wi-Fi networks, Block Bluetooth scanning, Hide cell tower info, and Block background location. Each app lists one privacy entry instead of up to eight. If you used any of the old patches, turn on the matching option in Hide device identifiers.
- **Block analytics and tracking** now also blocks the domains of the malware that compromised Optimizely website scripts on 16 November 2026.
- **CNN**: Faster launch applies only to 26.21.0. Version 26.23.0 no longer hangs on the splash screen.
- **Experimental versions**: every app version that is public on Google Play is a standard target. Hulu (Android TV), CVS 26.11.30, Netflix 9.93.0 build 7, and the official YouTube TV app 4.01.03 stay experimental.
- **Supported apps** has a new "Get it from" column that says which download works for each app.

### Version support

Newly supported versions, with the previous versions kept:

- AP News 6.32.1
- Best Buy 26.11.10
- ESPN 8.27.0
- Flipp 116.0.0
- Fox One 1.24.0
- HBO Max 7.14.0.530
- JustWatch 26.44.2 and 26.43.10
- myAT&T 2026.11.1 and 2026.10.1
- NPS 2.15.0
- NBA 1.2.0
- NewsBreak 26.46.1 and 26.44.1
- NFL 61.0.18
- NPR 7.11.0
- Paramount+ 17.2.0
- Pluto TV 17.4.0
- Prime Video 3.0.481.1947, 3.0.480.647, and 3.0.477.1447
- RetailMeNot 10.1.0
- Starz 6.12.1 and 6.11.0
- Target 2026.43.0
- The Wall Street Journal 15.13.0.44249
- Tubi 10.44.1
- Walmart 26.42 and 26.38
- YouTube TV 10.46.0

## [1.0.21](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.20...v1.0.21) (2026-11-14)


### Bug Fixes

* **appletv:** support the Android TV build 17.0.3, and find the MetricsKit chunk by its contents ([82f6880](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/82f6880e02a58692fa3f826cfe97a8bd6fb7f7fe))
* **checkout51:** open gas offer details from the list, and add Directions in place of the blank details map ([f68e9b7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f68e9b71479a2a76ab212ad3c4b32bccfb0abd0a))
* **checkout51:** send the full station address to the maps app ([0de3e78](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/0de3e7860f350f552ac61320704970e1e02ee479))
* **cnn:** keep the patches working on 26.23.0 and 26.21.0 ([f0a8af8](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f0a8af8b02348b4a0849d42788bb8f8a1abc9df6))
* **issue-forms:** list YouTube TV (Android TV) in the app dropdowns ([1491c2d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1491c2dbd0469ea8c29c23c16129623dd2492e26))
* **justwatch:** block the 26.45.1 free-streaming pre-roll ads ([78a7d39](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/78a7d392044fc96cdc6b57da8945b2a25191e8e7))
* keep the previous version supported when bumping to a newer one ([f666674](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f666674b6957d4bddf26b7bdd1d9c7e085222f57))
* **settingshome:** disable the Pairip license check ([544de09](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/544de0979acb3ccbbada52e9bc827e2f623380fe))
* testing ABC News 8.100.0, Fox News 5.50.0 ([cd29a65](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cd29a6504b4c41dff42aec6d9b5e1c0fc51d2f75))
* testing AP News 6.32, Costco 26.10.3, theScore 26.16.1, and T-Mobile Play 19.5.2 as a standard target ([6a80146](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6a80146ee2d0bc79a309b0dff3ea703492647395))
* testing CNN 26.23.0, JustWatch 26.45.1, NewsBreak 26.46.0 ([36d798d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/36d798d7c584623574c86186cfa33735cf067ab6))
* testing DealSeek 1.65.0, The Daily Wire 3.5.22 ([414a81a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/414a81a6dce4af0562d0e286817c17c4d1b5d7a2))
* testing My Verizon 22.3.5, Peacock 7.11.11 ([5354bb7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5354bb7747ba2f97cecc86a8b18870fae118dbe5))
* testing Prime Video 3.0.480.847, White House 47.7.11, Tubi 10.44.3, The New York Times 11.99.0 ([2e36fc2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2e36fc293145579dd3bf98521c45c3ae2c18e60b))
* testing Starz 6.12.0 ([111cf80](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/111cf80680d8d6ae7eb50b7f61a05317d3c9cdd1))
* testing Visible 3.0.6 ([a9234d2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a9234d21503ae44dc8f76bb972888743451240c9))
* testing Walgreens 118.1 ([3cb334b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3cb334b443d14ff5e17d86e47abe0bb7390086e3))
* **tlife:** support 12.4.0, where Radar, Adobe, Amplitude, and Luciq classes are renamed ([3ff6486](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3ff6486c0b98fb1b278e44c55b4c6c25444e03d1))
* **washingtonpost:** support 7.19.0, and find the summary flag without a fixed field name ([f70fe4f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f70fe4f3f2a9a690d6139466e9aaffcfef537517))
* **yahoofinance:** hide the Premium upgrade card and the Premium perks row on Account ([86d2fe0](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/86d2fe06f743a7131665088ec5759e98165096ad))
* **yahoofinance:** hide the remaining ad slots and article ads, and close the gaps they left ([43da8e0](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/43da8e042020b089dcd8d8a5f80667bd5433f6dd))
* **yahoofinance:** tighten the space above Your most actives left by the removed ad ([6abb146](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6abb146ec63e1863fa18ea347b062bc748c0924a))


### Features

* add ad-free YouTube TV on Android TV via the Chromium-Cobalt shell ([e471d8c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e471d8c93f12e2a5b94d59a150d1e23ccedb0714))
* add Checkout 51 ([d93fb98](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d93fb98fb184ac525b802e0a8f94d4146a202499))
* add Flipp, with Block ads and Skip tutorials ([28e6b7c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/28e6b7ce5028f73134756c9c92389fcb2f80af99))
* add Hide editor articles and Dark mode to DealSeek ([dab8d4b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/dab8d4b3378c6355410530d9b78e0156dd8d93ab))
* add Hide sponsored listings to Walmart, The Home Depot, and CVS ([04b4334](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/04b4334467167c04b67b8beeb5867c1a3a7ff9a6))
* add Hide sponsored products and Hide surveys and rating prompt to Walgreens ([af4f975](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/af4f975985b5183cd435544cbd79c1d52bff0ec7))
* add Lowe's, with Hide sponsored listings and Disable AI ([bcb52ac](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/bcb52ac936925ac10ff52dcf93eebf4a68479fe5))
* add RetailMeNot ([9063375](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/90633753d6d7456b98a4120c170ac7bf8181424f))
* add Settings Home launcher ([03afa6c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/03afa6c6bcc6d45e2613f75fff71220a1857167c))
* add Slickdeals and DealNews ([c42295c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c42295c27047c251a6bc09ab9b44b9b1f5922b6a))
* add Strip affiliate links to every deal app, and clean shared and copied links ([5a1e267](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5a1e26775fe8fb26787ba6729f6732136c0b5d8a))
* add Yahoo Finance ([cce8603](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cce86039ddc65bd9b6e4163f0e8790d120327cba))
* add Yahoo News ([8a75262](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/8a7526234dcba9a909316ee0242327c818a999be))
* **checkout51:** add Block location tracking, which stops Foursquare's Movement SDK ([cded9d8](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cded9d880db2ad420aea1d893dfc82f41a55a544))
* **checkout51:** add GmsCore support and hide more pop-ups ([7de7ded](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7de7ded53fbc34260d38d2e0ce044ffcc4abbaec))
* **checkout51:** hide the location data notice ([d29d200](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d29d200b53d4f5b20df037871bdc06970d38d71c))
* **checkout51:** list gas offers over the blank gas map ([7d8af2b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7d8af2b0b02387caf368c39c442f4291193057c7))
* **checkout51:** show gas offers on OpenStreetMap in place of the blank Google maps ([95a7400](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/95a7400cf551baec87b7b81fdef70c7d1f553141))
* **dealnews:** support the public Play version 10.7.1 ([de96eb2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/de96eb217bf833198050f17e2a776bd01ecc545e))
* **dealseek:** add Stop behavioral tracking patch ([d6f2591](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d6f25919fe62477515a5c6344d49ece96132daf3))
* Hide promo banners for The Daily Wire, and widen version support ([0d64d16](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/0d64d16fe9c3457bc6c2203b47a23adf8b8b1334))
* **justwatch:** add Unlock JustWatch Pro patch ([f6ea4ac](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f6ea4ac2cd6493084bc35e8bfbbdefa16b92f0be))
* **justwatch:** add Unlock JustWatch Pro patch ([f10d0b7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f10d0b75adda7922835945b83899b279641225cd))
* **retailmenot:** add Dark mode ([62e48c2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/62e48c29f08fb192fc5b5a9f7d1f0013bc336985))
* **retailmenot:** add Hide VPN connection ([98c3a6e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/98c3a6e93ebe51880ea57aa0270de8fb993ed65e))
* **retailmenot:** add Remove location access ([fc82afe](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/fc82afe5aa21072d13600f94edcfe60a8160d2a9))
* sort the patches of apps with five or more into folders in Morphe Manager ([85b2005](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/85b2005e0c5cc6db995b0826c49090611a18bd59))
* support the Disney+ and Starz Android TV builds ([4ee3aaf](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/4ee3aafd82be861e3c6b0de3da32ccf8b282308c))
* **tubi:** add Hide update prompts ([e4632c5](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e4632c505b9d153a921d1163ccb1c2d608022817))
* **tubi:** support the Android TV build 10.44.5001 ([cc03dd7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cc03dd716fc17875c95c0a63ebde0446d5be1918)), closes [#43](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/43)
* **walmart:** hide card offers, Walmart+ promotions, creator videos, and pop-ups ([96bd978](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/96bd9784b45b8d05b70250de1f702e34d1d73345))
* **yahoonews:** add Customize bottom bar, and Show unreleased features with Video tab, continuous picture-in-picture, and Listen ([05f65ac](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/05f65ac541a2718dbffc64383ddaa29282e4ea6d))
* **yahoonews:** add Show Follow and Local ([57f0868](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/57f0868535e75d119a9249a3008759ed2d88e903))
* **yttvshell:** install YouTube TV as a standalone "YT TV+" app ([39e5bbb](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/39e5bbb73a894a0828de6778c5ad2e6208429211))
* **yttvshell:** make the YouTube TV conversion explicit in Morphe Manager ([964c724](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/964c724d177e8c91a1dd74e06f047a48df00e09b))
* **yttvshell:** use YouTube TV's icon and banner for YT TV+ ([d56d4ca](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d56d4ca3b1ab1b5bbc6324f51f6424738b123a8b))


### Reverts

* **justwatch:** remove the Unlock JustWatch Pro patch ([9d6e761](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/9d6e761d978b00c2fd990b8bcc9efa72de0c152a))

## [1.0.21-dev.31](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.30...v1.0.21-dev.31) (2026-11-13)


### Bug Fixes


## [1.0.21-dev.30](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.29...v1.0.21-dev.30) (2026-11-13)


### Bug Fixes


## [1.0.21-dev.29](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.28...v1.0.21-dev.29) (2026-11-13)


### Bug Fixes

* testing DealSeek 1.65.0, The Daily Wire 3.5.22 ([414a81a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/414a81a6dce4af0562d0e286817c17c4d1b5d7a2))

## [1.0.21-dev.28](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.27...v1.0.21-dev.28) (2026-11-13)


### Features


## [1.0.21-dev.27](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.26...v1.0.21-dev.27) (2026-11-13)


### Bug Fixes


## [1.0.21-dev.26](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.25...v1.0.21-dev.26) (2026-11-13)


### Features


## [1.0.21-dev.25](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.24...v1.0.21-dev.25) (2026-11-13)


### Bug Fixes

* testing Walgreens 118.1 ([3cb334b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3cb334b443d14ff5e17d86e47abe0bb7390086e3))

## [1.0.21-dev.24](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.23...v1.0.21-dev.24) (2026-11-13)


### Bug Fixes

* **settingshome:** disable the Pairip license check ([544de09](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/544de0979acb3ccbbada52e9bc827e2f623380fe))

## [1.0.21-dev.23](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.22...v1.0.21-dev.23) (2026-11-13)


### Features

* add Settings Home launcher ([03afa6c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/03afa6c6bcc6d45e2613f75fff71220a1857167c))

## [1.0.21-dev.22](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.21...v1.0.21-dev.22) (2026-11-13)


### Bug Fixes

* **justwatch:** block the 26.45.1 free-streaming pre-roll ads ([78a7d39](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/78a7d392044fc96cdc6b57da8945b2a25191e8e7))

## [1.0.21-dev.21](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.20...v1.0.21-dev.21) (2026-11-13)


### Bug Fixes

* **cnn:** keep the patches working on 26.23.0 and 26.21.0 ([f0a8af8](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f0a8af8b02348b4a0849d42788bb8f8a1abc9df6))

## [1.0.21-dev.20](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.19...v1.0.21-dev.20) (2026-11-13)


### Bug Fixes

* testing CNN 26.23.0, JustWatch 26.45.1, NewsBreak 26.46.0 ([36d798d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/36d798d7c584623574c86186cfa33735cf067ab6))

## [1.0.21-dev.19](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.18...v1.0.21-dev.19) (2026-11-13)


### Bug Fixes

* **issue-forms:** list YouTube TV (Android TV) in the app dropdowns ([1491c2d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1491c2dbd0469ea8c29c23c16129623dd2492e26))


### Features

* add ad-free YouTube TV on Android TV via the Chromium-Cobalt shell ([e471d8c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e471d8c93f12e2a5b94d59a150d1e23ccedb0714))
* **yttvshell:** install YouTube TV as a standalone "YT TV+" app ([39e5bbb](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/39e5bbb73a894a0828de6778c5ad2e6208429211))
* **yttvshell:** make the YouTube TV conversion explicit in Morphe Manager ([964c724](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/964c724d177e8c91a1dd74e06f047a48df00e09b))
* **yttvshell:** use YouTube TV's icon and banner for YT TV+ ([d56d4ca](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d56d4ca3b1ab1b5bbc6324f51f6424738b123a8b))

## [1.0.21-dev.18](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.17...v1.0.21-dev.18) (2026-11-12)


### Bug Fixes

* testing Visible 3.0.6 ([a9234d2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a9234d21503ae44dc8f76bb972888743451240c9))

## [1.0.21-dev.17](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.16...v1.0.21-dev.17) (2026-11-12)


### Features

* support the Disney+ and Starz Android TV builds ([4ee3aaf](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/4ee3aafd82be861e3c6b0de3da32ccf8b282308c))


### Reverts

* Revert "feat: add Run on Android TV to streaming apps without a TV build" ([b151b68](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/b151b68100669a08834f45c68d4265b2de5e7b76))
* Revert "feat: extend Run on Android TV to AMC+, Fox One, PBS, and Fandango at Home" ([5647117](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5647117868a7da3e1e94675cf8a7438cad6b31bb))

## [1.0.21-dev.16](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.15...v1.0.21-dev.16) (2026-11-12)


### Bug Fixes

* **yahoofinance:** hide the Premium upgrade card and the Premium perks row on Account ([86d2fe0](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/86d2fe06f743a7131665088ec5759e98165096ad))
* **yahoofinance:** hide the remaining ad slots and article ads, and close the gaps they left ([43da8e0](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/43da8e042020b089dcd8d8a5f80667bd5433f6dd))
* **yahoofinance:** tighten the space above Your most actives left by the removed ad ([6abb146](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6abb146ec63e1863fa18ea347b062bc748c0924a))


### Features

* add Run on Android TV to streaming apps without a TV build ([e967ef9](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e967ef9f812b6ff340b2f8f2f8c05eed37b9e488))
* add Yahoo Finance ([cce8603](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cce86039ddc65bd9b6e4163f0e8790d120327cba))
* add Yahoo News ([8a75262](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/8a7526234dcba9a909316ee0242327c818a999be))
* extend Run on Android TV to AMC+, Fox One, PBS, and Fandango at Home ([b2abfbb](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/b2abfbb5334df5099d29a597dc47472c7ee010f9))
* **yahoonews:** add Customize bottom bar, and Show unreleased features with Video tab, continuous picture-in-picture, and Listen ([05f65ac](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/05f65ac541a2718dbffc64383ddaa29282e4ea6d))
* **yahoonews:** add Show Follow and Local ([57f0868](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/57f0868535e75d119a9249a3008759ed2d88e903))

## [1.0.21-dev.15](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.14...v1.0.21-dev.15) (2026-11-12)


### Bug Fixes

* **appletv:** support the Android TV build 17.0.3, and find the MetricsKit chunk by its contents ([82f6880](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/82f6880e02a58692fa3f826cfe97a8bd6fb7f7fe))
* testing AP News 6.32, Costco 26.10.3, theScore 26.16.1, and T-Mobile Play 19.5.2 as a standard target ([6a80146](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6a80146ee2d0bc79a309b0dff3ea703492647395))
* **tlife:** support 12.4.0, where Radar, Adobe, Amplitude, and Luciq classes are renamed ([3ff6486](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3ff6486c0b98fb1b278e44c55b4c6c25444e03d1))
* **washingtonpost:** support 7.19.0, and find the summary flag without a fixed field name ([f70fe4f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f70fe4f3f2a9a690d6139466e9aaffcfef537517))


### Features

* sort the patches of apps with five or more into folders in Morphe Manager ([85b2005](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/85b2005e0c5cc6db995b0826c49090611a18bd59))
* **tubi:** add Hide update prompts ([e4632c5](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e4632c505b9d153a921d1163ccb1c2d608022817))

## [1.0.21-dev.14](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.13...v1.0.21-dev.14) (2026-11-12)


### Bug Fixes

* testing Starz 6.12.0 ([111cf80](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/111cf80680d8d6ae7eb50b7f61a05317d3c9cdd1))

## [1.0.21-dev.13](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.12...v1.0.21-dev.13) (2026-11-12)


### Bug Fixes

* **checkout51:** open gas offer details from the list, and add Directions in place of the blank details map ([f68e9b7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f68e9b71479a2a76ab212ad3c4b32bccfb0abd0a))
* **checkout51:** send the full station address to the maps app ([0de3e78](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/0de3e7860f350f552ac61320704970e1e02ee479))


### Features

* add Strip affiliate links to every deal app, and clean shared and copied links ([5a1e267](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5a1e26775fe8fb26787ba6729f6732136c0b5d8a))
* **checkout51:** add Block location tracking, which stops Foursquare's Movement SDK ([cded9d8](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cded9d880db2ad420aea1d893dfc82f41a55a544))
* **checkout51:** hide the location data notice ([d29d200](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d29d200b53d4f5b20df037871bdc06970d38d71c))
* **checkout51:** list gas offers over the blank gas map ([7d8af2b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7d8af2b0b02387caf368c39c442f4291193057c7))
* **checkout51:** show gas offers on OpenStreetMap in place of the blank Google maps ([95a7400](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/95a7400cf551baec87b7b81fdef70c7d1f553141))
* **dealnews:** support the public Play version 10.7.1 ([de96eb2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/de96eb217bf833198050f17e2a776bd01ecc545e))

## [1.0.21-dev.12](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.11...v1.0.21-dev.12) (2026-11-12)


### Features

* **tubi:** support the Android TV build 10.44.5001 ([cc03dd7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cc03dd716fc17875c95c0a63ebde0446d5be1918)), closes [#43](https://github.com/semicoloncolonel/mobile-morphe-patches/issues/43)
* **walmart:** hide card offers, Walmart+ promotions, creator videos, and pop-ups ([96bd978](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/96bd9784b45b8d05b70250de1f702e34d1d73345))

## [1.0.21-dev.11](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.10...v1.0.21-dev.11) (2026-11-12)


### Features

* **checkout51:** add GmsCore support and hide more pop-ups ([7de7ded](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7de7ded53fbc34260d38d2e0ce044ffcc4abbaec))

## [1.0.21-dev.10](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.9...v1.0.21-dev.10) (2026-11-12)


### Features

* add Checkout 51 ([d93fb98](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d93fb98fb184ac525b802e0a8f94d4146a202499))

## [1.0.21-dev.9](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.8...v1.0.21-dev.9) (2026-11-11)


### Bug Fixes

* testing ABC News 8.100.0, Fox News 5.50.0 ([cd29a65](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cd29a6504b4c41dff42aec6d9b5e1c0fc51d2f75))

## [1.0.21-dev.8](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.7...v1.0.21-dev.8) (2026-11-11)


### Features

* **retailmenot:** add Dark mode ([62e48c2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/62e48c29f08fb192fc5b5a9f7d1f0013bc336985))

## [1.0.21-dev.7](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.6...v1.0.21-dev.7) (2026-11-11)


### Features

* **retailmenot:** add Remove location access ([fc82afe](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/fc82afe5aa21072d13600f94edcfe60a8160d2a9))

## [1.0.21-dev.6](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.5...v1.0.21-dev.6) (2026-11-11)


### Features

* **retailmenot:** add Hide VPN connection ([98c3a6e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/98c3a6e93ebe51880ea57aa0270de8fb993ed65e))

## [1.0.21-dev.5](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.4...v1.0.21-dev.5) (2026-11-11)


### Features

* add RetailMeNot ([9063375](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/90633753d6d7456b98a4120c170ac7bf8181424f))

## [1.0.21-dev.4](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.3...v1.0.21-dev.4) (2026-11-11)


### Features

* add Flipp, with Block ads and Skip tutorials ([28e6b7c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/28e6b7ce5028f73134756c9c92389fcb2f80af99))
* add Slickdeals and DealNews ([c42295c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/c42295c27047c251a6bc09ab9b44b9b1f5922b6a))

## [1.0.21-dev.3](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.2...v1.0.21-dev.3) (2026-11-11)


### Bug Fixes

* testing Prime Video 3.0.480.847, White House 47.7.11, Tubi 10.44.3, The New York Times 11.99.0 ([2e36fc2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2e36fc293145579dd3bf98521c45c3ae2c18e60b))


### Features

* add Hide editor articles and Dark mode to DealSeek ([dab8d4b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/dab8d4b3378c6355410530d9b78e0156dd8d93ab))
* add Hide sponsored listings to Walmart, The Home Depot, and CVS ([04b4334](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/04b4334467167c04b67b8beeb5867c1a3a7ff9a6))
* add Hide sponsored products and Hide surveys and rating prompt to Walgreens ([af4f975](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/af4f975985b5183cd435544cbd79c1d52bff0ec7))
* add Lowe's, with Hide sponsored listings and Disable AI ([bcb52ac](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/bcb52ac936925ac10ff52dcf93eebf4a68479fe5))


### Reverts

* **justwatch:** remove the Unlock JustWatch Pro patch ([9d6e761](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/9d6e761d978b00c2fd990b8bcc9efa72de0c152a))

## [1.0.21-dev.2](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.1...v1.0.21-dev.2) (2026-11-11)


### Features

* **justwatch:** add Unlock JustWatch Pro patch ([f6ea4ac](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f6ea4ac2cd6493084bc35e8bfbbdefa16b92f0be))
* **justwatch:** add Unlock JustWatch Pro patch ([f10d0b7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f10d0b75adda7922835945b83899b279641225cd))

## [1.0.21-dev.2](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.1...v1.0.21-dev.2) (2026-11-11)


### Features

* **justwatch:** add Unlock JustWatch Pro patch ([f10d0b7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f10d0b75adda7922835945b83899b279641225cd))

## [1.0.21-dev.2](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.21-dev.1...v1.0.21-dev.2) (2026-11-11)


### Features

* **justwatch:** add Unlock JustWatch Pro patch ([f10d0b7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f10d0b75adda7922835945b83899b279641225cd))

## [1.0.21-dev.1](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.20...v1.0.21-dev.1) (2026-11-10)


### Bug Fixes

* testing My Verizon 22.3.5, Peacock 7.11.11 ([5354bb7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5354bb7747ba2f97cecc86a8b18870fae118dbe5))

## [1.0.20](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.19...v1.0.20) (2026-11-10)


### New apps

* add Kanopy, with Hide rating prompt, Hide survey, and Block analytics & tracking
* add CNBC
* add SiriusXM
* add Costco


### New patches

* add Hide rating prompt to every app
* add Video quality to HBO Max
* add Hide League Pass upsells to NBA, off by default


### Supported versions

* Disney+: 26.20.0+rc3-2026.11.02 is now a regular supported version, so Morphe Manager no longer offers 26.20.0+rc2-2026.10.28 as an update. 26.20.0+rc2-2026.10.28 is still supported.
* Walmart: 26.42.2 is now a regular supported version.
* support NBA 1.3.0, NewsBreak 26.45.1, NPS 2.16.0, Target 2026.44.0, Prime Video 3.0.480.747 and 3.0.479.847, Amazon Shopping 32.20.0.100, Moviebase 7.7.1, The New York Times 11.98.2, Substack 3.13.1, The Home Depot 8.2.6, and The Washington Post 7.18.4
* support T-Mobile Play 19.5.2 as experimental


### Fixes

* Disable Pairip license check no longer fails on an app version without Pairip, such as Moviebase 7.7.1
* say that Hide marketing pop-ups does not remove The Washington Post or WSJ paywalls

## [1.0.20-dev.7](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.20-dev.6...v1.0.20-dev.7) (2026-11-10)


### Bug Fixes

* list Disney+ 26.20.0+rc3-2026.11.02 as a regular supported version, so Morphe Manager stops offering rc2 as an update ([f8acbe1](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f8acbe15868b3314ec0b4f099892c3bca4a7b4fe))
* support the current public versions of Amazon Shopping, Moviebase, The New York Times, Prime Video, Substack, The Home Depot, and The Washington Post, and T-Mobile Play 19.5.2 as experimental ([cfba7a5](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cfba7a55a1d40ea6abaf5548ae200350f02c9fe3))


### Features

* add Kanopy ([0ed4374](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/0ed4374d47dc21faf6dd18d5dad6ae1c85b9ecc9))

## [1.0.20-dev.6](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.20-dev.5...v1.0.20-dev.6) (2026-11-10)


### Bug Fixes

* testing NBA 1.3.0, NewsBreak 26.45.1 ([23521ad](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/23521adaf09d09f00001dc5d06a2b3dad08e8aae))

## [1.0.20-dev.5](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.20-dev.4...v1.0.20-dev.5) (2026-11-10)


### Bug Fixes

* testing Prime Video 3.0.480.747 ([1ca95c8](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1ca95c88b14522953e5531f77f274f3559873b64))

## [1.0.20-dev.4](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.20-dev.3...v1.0.20-dev.4) (2026-11-09)


### Bug Fixes

* support NPS 2.16.0, Target 2026.44.0 ([326ae5f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/326ae5fd796413fbee01ff3bbb47680b744def6a))

## [1.0.20-dev.3](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.20-dev.2...v1.0.20-dev.3) (2026-11-09)


### Bug Fixes

* accept only the phone build of Disney+ 26.20.0+rc2-2026.10.28 ([851a29e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/851a29e2229af2f1c3b4569a40d9f9516b607832))
* say that Hide marketing pop-ups does not remove The Washington Post or WSJ paywalls ([8420d87](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/8420d87b82da0f4ae104413e4a92e3b999fc4535))

## [1.0.20-dev.2](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.20-dev.1...v1.0.20-dev.2) (2026-11-09)


### Bug Fixes

* let CNBC's Hide rating prompt include the shared one, and cover SiriusXM and Costco ([aaaa4db](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/aaaa4db447562617c23876539a09a958eee30151))


### Features

* add CNBC ([3015e53](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3015e53a5ac5bcfd0bf2d8a906dd5d9ee27425da))
* add Costco (experimental) ([7d36368](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7d36368fc4130c4833974a05f1ce545c5b925303))
* add Hide rating prompt to every app ([0b2d79a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/0b2d79afecd84d052ed905e834b7213fd625add8))
* add SiriusXM ([dde5670](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/dde5670a4ee1c2bc9cb9a0d9a2f52f73886c3544))

## [1.0.20-dev.1](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.19...v1.0.20-dev.1) (2026-11-09)


### Features

* add Video quality to HBO Max ([7c9a573](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7c9a5731e047973c9881966a7c011fe65a3ea875))

## [1.0.19](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.18...v1.0.19) (2026-11-09)


### Bug Fixes

* accept only the phone build of Disney+ 26.20.0+rc3-2026.11.02, and offer the Android TV build of HBO Max on Android 11 TVs ([1ef60e9](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1ef60e920c9d22b634cd93118cf54da6204c6863))
* offer the Android TV build of HBO Max under the Play Store package name ([6d37589](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6d375899930a21cc780f6b586d446dac63222eff))

## [1.0.18](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.17...v1.0.18) (2026-11-09)


### Bug Fixes

* accept the Google Play build of JustWatch for Android TV, and support Disney+ 26.20.0+rc3-2026.11.02 ([4ac0e49](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/4ac0e49848b6a5fc187d76a61245303e54015fdc))

## [1.0.17](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.16...v1.0.17) (2026-11-09)


### Bug Fixes

* support Prime Video 3.0.480.647 ([3cf56cd](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3cf56cdf2b997202112141d8c7365dfdd1387414))
* Support Walmart 26.42.2 as an experimental version ([7dc6058](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7dc6058ffb6122b9313e7d053b0de1c934259625))


### Features

* Add Auto-skip, release times, and player options to the Apple TV phone app ([fbf4267](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/fbf42678d06c666007ac88d06e350362e810bc47))
* Add JustWatch Watchlist filters and GmsCore support, and remove its empty banner spaces ([3bd544d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3bd544d35cf93b81e317bd55b0f436dccb1bc767))
* Add release times and analytics blocking to Apple TV on Android TV ([9d2a463](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/9d2a46362976b961bfd5dea388b5d441a3ab3264))

## [1.0.16](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.15...v1.0.16) (2026-11-08)


### Bug Fixes

* let YouTube TV's GmsCore support patch apply to 10.45.0, where Google moved the Android ID lookup ([5e21acc](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5e21accfcf41e7c134fb1bb413aa9a87b7483794))

## [1.0.15](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.14...v1.0.15) (2026-11-08)


### Bug Fixes

* block ads in NFL article clips without tripping the app's ad-blocker check ([3f2463f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3f2463f4fad9e6075bdda480e66e7d52d10105c0))
* build with Morphe patcher 2.3.0 ([3457197](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/345719765abbee0f7a7cadc5e06ca287e3427638))
* hide myAT&T's Andi button and Ask Andi card when Disable AI is on ([804397c](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/804397ce1b1ce54c09fe61931071e17093578b1d))
* label phone and TV builds in Morphe Manager, and keep pins on public app versions ([42e7bd2](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/42e7bd22c0affd29bfbaafd2c745c93feb13b1a8))
* let Pluto TV's Block analytics patch apply when the app has no DNS lookups to block ([868464e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/868464e82af6bc499320e44d642e596582666376))
* mark app versions from the dev branch as experimental, and skip HBO Max's social sign-in patch on the TV build ([dc84ef4](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/dc84ef4ef58cc6de0bc27bd60c5a9fb8787243f4))
* mark NewsNation's Android TV build as a TV app ([994d017](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/994d01704492bc3caea6aeac18a2b398329a0810))
* show Recreation.gov's hidden ticket and booking details, and write booking windows as a day and time ([3751952](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3751952e501cb8acc130ad6680b50a5eb28c7d08))
* support the latest versions of 16 apps, and HBO Max on Android TV ([4abceb4](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/4abceb49a98da8c39107f1522a1cb87455771923))


### Features

* add a Highest quality patch for Tubi ([e025cb1](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e025cb10f72a1ad94516ed52f4931938325f31a0))
* add Truth Social ([a59fc13](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a59fc135ef84f86f9da88617582c849473e42ae9))
* support Apple TV on Android TV, with auto-skip for promos, recaps, and intros, and a hidden review prompt ([cf27426](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/cf2742673401b5c6bbba21ef597c8b4a5b9b9064))
* support HBO Max as the Play Store installs it (com.wbd.stream) ([d8c0d22](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d8c0d22ff0bfa83b67f4b7b94e47fadb63731563))

## [1.0.14](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.13...v1.0.14) (2026-11-07)


### Bug Fixes

* let Pluto TV's Block analytics patch apply when the app has no DNS lookups to block ([842166d](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/842166dfc1b79935f941de5db328265c54b035e6))
* resume Pluto TV at the right spot, and add a blocking level to its Block analytics patch ([3794c91](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3794c9155842fcc4a4b64d7bed29c0128d937d06))

## [1.0.13](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.12...v1.0.13) (2026-11-07)


### Bug Fixes

* say which build to patch for Pluto TV, Starz, and Disney+ on Android TV ([a3cc7ea](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a3cc7ea04ed28d2da29739c6af95acd315b3d36a))

## [1.0.12](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.11...v1.0.12) (2026-11-06)


### Features

* add C-SPAN, NewsNation, The Daily Wire, USA TODAY, Substack, MLB, NPR, AP News, and NewsBreak, and support Pluto TV on Android TV ([1173da3](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1173da345c569fefd1b41e4f2989594f8a9cd1fe))
* add theScore, Shudder, Sundance Now, ESPN betting and prediction-market removal, and WaPo and CNN fixes ([1dcbf4b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1dcbf4b74b98ba12c8ae16de695186fc47131e21))

## [1.0.11](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.10...v1.0.11) (2026-11-05)


### Features

* add Plex on Android TV, DealSeek and White House patches, and YouTube TV quality and picture-in-picture fixes ([4f44861](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/4f44861338a0473729178807822e582da9101f98))

## [1.0.10](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.9...v1.0.10) (2026-11-05)


### Bug Fixes

* find Tubi's ad-break error result instead of naming it ([1baffdb](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/1baffdb5319de5c6a05a127d2bdee833922f4456))

## [1.0.9](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.8...v1.0.9) (2026-11-05)


### Bug Fixes

* support the latest ESPN, Paramount+, Prime Video, Tubi, Mint Mobile, and JustWatch ([f3f0f3f](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f3f0f3f8266e3de743f3eacad3ff008ba02f0abb))


### Features

* add Plex ([3603e62](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3603e62aa65eb452dfeec3d102c3494c80c29f40))

## [1.0.8](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.7...v1.0.8) (2026-11-05)


### Features

* add Xumo Play, a YouTube TV live ad mask, and JustWatch on Android TV ([d15f7a0](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d15f7a02acba56a556b45bebb9fab8abd524174b))

## [1.0.7](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.6...v1.0.7) (2026-11-04)


### Features

* hide YouTube TV's membership upsell and show Recreation.gov lottery counts in a dialog ([61d64e4](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/61d64e4739af6a8420a31b0b0ba3f546b2df7304))

## [1.0.6](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.5...v1.0.6) (2026-11-03)


### Features

* add Moviebase and clean up the README ([e7cd229](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/e7cd229ce019db4d82239eeb974b157bb6b39a18))

## [1.0.5](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.4...v1.0.5) (2026-11-03)


### Features

* add ABC News, CBS News, NBC News, Fox Local, YouTube TV, and My Verizon ([7c2d45e](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/7c2d45ec6a80eff82baad07c9e1ccb32de79962a))

## [1.0.4](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.3...v1.0.4) (2026-11-02)


### Features

* add carrier, government, and Recreation.gov apps ([3bdb4b5](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/3bdb4b5b156e1fd3d2d5c8a2366f25a1cdf29bbd))

## [1.0.3](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.2...v1.0.3) (2026-11-02)


### Bug Fixes

* limit the store-tracking privacy patches to the shopping apps ([6b2084b](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6b2084b7427102f33ae145c979cee6a8d3e11805))
* offer Report Wi-Fi connection and Hide VPN connection on streaming and news apps only ([dc77c43](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/dc77c43a5527ea9b5741c22678a6aa8578179ca4))
* **primevideo:** rename shared Amazon permissions ([2eeb522](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2eeb5229cb3c1eee24dbfcbba2b31a7299e07477))


### Features

* add DealSeek and seven store apps, with shopping privacy patches ([6c6abfa](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/6c6abfa0cbaf084dbc779d87c37f3f2689c54a25))

## [1.0.2](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.1...v1.0.2) (2026-10-31)


### Features

* add carrier presets to Spoof carrier ([00bc6c7](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/00bc6c756b489d971dad5311f8eb5c53e746cacc))
* add Spoof carrier ([80bae66](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/80bae6637793cca09548af088d94554b2aad0b18))
* enable the shared patches for ESPN, NFL and NBA ([03128b9](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/03128b9714ccf176d544325039ab737a6907d90c))
* **espn:** add ESPN Skip ads and Block analytics ([a954b61](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/a954b61f8a932fb6fa5ca8c1d8150251abfd4ea8))
* **nba:** add NBA Skip ads, Disable Ask NBA AI and Block analytics ([11f9b1a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/11f9b1a0debc3d0c55bceeaf76373fd0f49ec62d))
* **nfl:** add NFL Skip ads and Block analytics ([5cd4dfe](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5cd4dfecc8b41b0dba9d05e6673d97b03b32f4f9))

## [1.0.1](https://github.com/semicoloncolonel/mobile-morphe-patches/compare/v1.0.0...v1.0.1) (2026-10-31)


### Bug Fixes

* match the Fox IMA ad listener by name only ([ef0f399](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/ef0f39933a9730aeba05b1c12a1966a3efce0660))

# 1.0.0 (2026-10-31)


### Bug Fixes

* drop Hallmark+ ([5d9f0ee](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5d9f0eefb35c9befd083cd616cf5cf4cbe5e4004))
* Fox News ad crash and drop Samsung TV Plus ([2f7ff23](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2f7ff23c8a86979847aa0409703f2e8471696e4e))
* **msnow:** stop tracking SDKs without breaking startup ([10eec0a](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/10eec0aba4664d45346a8b8b7dbcfb455ce19ffe))
* **primevideo:** skip ads on accounts moved to the newer player ([5091b80](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/5091b802d527a1ad07cf6ca689c2d3593e8b4554))


### Features

* add Report Wi-Fi connection and Hide VPN connection ([dfd9a14](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/dfd9a14d49945ef7e1cdea8cc35db991203dbea6))
* **foxnews:** add Enable developer menu ([f89ae58](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/f89ae58e54744a0088b706da20f54d1ab9745b41))
* **hulu:** add Hulu support ([b227c17](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/b227c17c1e7efa1e4727d1ce88bc4cac8179c502))
* initial release of Mobile Stream Patches ([d73f7e6](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/d73f7e61f1bd721d758c1cc24edff668c2c00b7a))
* skip launch videos in AMC+, Disney+, Paramount+, Pluto TV, and Starz ([2c351fe](https://github.com/semicoloncolonel/mobile-morphe-patches/commit/2c351fe8248443e66941bacd9242abb468fe8047))
