## [1.1.1](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/compare/v1.1.0...v1.1.1) (2026-09-01)


### Bug Fixes

* **settings:** prevent secondary process preference clobbering ([bc59416](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/bc5941657d90b554e08e9127a6da1e319cc499ba))





## 1.1.1

# [1.1.0](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/compare/v1.0.1...v1.1.0) (2026-08-26)


### Bug Fixes

* bind automatic clear display to native panel ([477f706](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/477f70675e1b29198945deb9c149886ff9e2b0b4))
* **branding:** remove legacy Metra source icon ([8524195](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/85241957abb94493c727a5d66320baa223ba5985))
* **build:** preserve patch build config with BlueIT metadata ([a334977](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/a3349775386aa8fd6803c1db74a7317451ca6534))
* **ci:** make gesture discovery reference scan compile-safe ([781fb3a](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/781fb3a7d0f21f2cde8e085f8abdaff8a2c1198e))
* **diagnostics:** classify all download logs correctly ([4201d1c](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/4201d1c5c6f406acce6baaa112f6b7e0f9b9be6e))
* **diagnostics:** use BlueIT export branding ([d133240](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/d13324038feb94c747ea05f36c6e83aacbc15874))
* display legacy range maximum as unlimited ([fd0415f](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/fd0415f05d3fcc5ebe42d16900b2ec691dc2c69f))
* enable full catalog with Morphe CLI ([5105fbe](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/5105fbe77bb1b6cb7d52c7e9f804f00be2ae4571))
* fingerprint native clear display panel context ([d18ff1f](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/d18ff1f131487cbbcdc3b4a36f4e5bd383e631a3))
* keep advanced feed rules out of profile lists ([184e20c](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/184e20c90e4c7c2a20b81f82970b92e48f06f318))
* keep base feed filter out of profile lists ([9a0811e](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/9a0811e7cb6e666444b27b61af0ce6cfad4f5e7d))
* keep seen-video filtering out of profile lists ([dad3fcf](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/dad3fcf1fe308e00de9056e5f4ac3d8bfaa4ce08))
* **release:** guard dev metadata history ([406176e](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/406176eaaa8dbeebccb93a81c2fd0563b5117ab6))
* request clear display through TikTok native panel ([dfdb4e5](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/dfdb4e597fb61872f7493e3ceec6915f6f1c5a5d))
* scope feed filtering to real feed responses ([51ad474](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/51ad4745117c84f583a281bb7fd7c842bfbac44a))
* **settings:** place BlueIT before TikTok activity group ([f31449f](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/f31449fc92e77204c3805e00e11da3284912eca7))
* **settings:** show clear display delay in milliseconds ([077dbe0](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/077dbe07b6f6474b0e01a29f676d753c9c1a2b7c))
* **settings:** support correct numeric preference units ([cc13dd8](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/cc13dd85699c705c9e250186ab52a9c78929be9a))
* **tiktok:** add targeted 46.4.3 feed runtime diagnostics ([0175dad](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/0175dad094049aefae333bbc06bd7fb7e3ad694e))
* **tiktok:** anchor final 46.4.3 FYP commit ([6fe766a](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/6fe766ab0848c9361a2c1305c5e9d31c151f749d))
* **tiktok:** avoid empty duration batches and use pilot duration ([4e25192](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/4e2519289e9f23acbf9f1b4be37951e119136934))
* **tiktok:** bound download diagnostics ([b4ec80b](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/b4ec80b710d9291b62e5137a2266eb026d0fb7f9))
* **tiktok:** clamp advanced feed percentage input ([2e9e4d5](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/2e9e4d5a0e97239002f461588f1649f084dab6ec))
* **tiktok:** define views-per-like feed threshold ([b03e08e](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/b03e08ebec77e8ca5dec07ef1914985629cb3e4c))
* **tiktok:** detect paid and late 46.4.3 ads ([6980708](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/6980708b9a20f157cd3740b3f1e786681e23f1e0))
* **tiktok:** detect raw 46.4.3 feed ads ([56e3cb8](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/56e3cb865c31a0d806576040808630d55b0854e5))
* **tiktok:** enforce filters in final 46.4.3 FYP commit ([3e7178c](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/3e7178c43f7e4ff10b4355cc3dc73f0f64d6abcb))
* **tiktok:** expose views-per-like ratio semantics ([3449c92](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/3449c92cbda1e1ded19c2445d36a439033d65236))
* **tiktok:** filter exact 46.4.3 cached For You feed ([1d1fc7d](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/1d1fc7d55336e5077f15c1c1774f9e94dfcc35a1))
* **tiktok:** guard final FYP UI handoff ([3e962b9](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/3e962b945e69f4f7b337f548d094f1bddcb06246))
* **tiktok:** handle learn mode report serialization ([3aaf608](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/3aaf608d670feeb47a9b9fa62c9a229e48c6ba54))
* **tiktok:** keep automatic clear display timer active ([2df94a3](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/2df94a34d13ad7701d2f3a42e91297c6c36dbf82))
* **tiktok:** keep feed diagnostics observational ([8d3fc9e](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/8d3fc9ee4a27c65b257633eb2f46bb2aafc34d0e))
* **tiktok:** keep filtering late For You mutations ([0503c3c](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/0503c3c3b4bf27cd16b92d88d33efadd646e5011))
* **tiktok:** keep hard feed blocks ahead of quantitative fallback ([111f73a](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/111f73a1125cbd342f6c3af93c29eb137d5abcfa))
* **tiktok:** prevent empty like-view-ratio feed pages ([c55919e](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/c55919eadbe93b37c6045f6af0b8b8634a5869f7))
* **tiktok:** re-filter final FYP before UI post ([8271719](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/82717193dc1a7278e94b9b5540348c3bc4cca941))
* **tiktok:** re-filter marked For You lists after late inserts ([5f600dc](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/5f600dc6e905f84bfc87ecf4da1649e8a529df32))
* **tiktok:** reset views-per-like profile setting ([1204435](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/1204435254fcfcef69a91d628785b7202d00ff83))
* **tiktok:** stop classifying normal videos as ads ([375d724](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/375d7249cdff206c35638da65e35dc2e5e198532))
* **tiktok:** stop quality selector log flooding ([a7bd597](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/a7bd597c10b01b1113e15be9ff097e89078c91a2))
* **tiktok:** trace 46.4.3 ad filter decisions ([7b9ba20](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/7b9ba2010af29c1aab0c7acc67a5fd5bb2fd683a))
* **tiktok:** trace marked and bypassed FYP list reads ([ddec85a](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/ddec85a2db757be9d6ba45a62fa5932541df7c84))
* **tiktok:** use proven native clear display event source ([053a933](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/053a93395e2a864cef389ae8c80e52d1c4337a8f))
* **tiktok:** use views-per-like ratio semantics ([d5504d6](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/d5504d63f5f97c7f681d0e708b8823707b89db12))
* use exact 46.4.3 duration metadata ([9e401cf](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/9e401cfaf913664651aaef03805534ffab81f0b5))


### Features

* add native TikTok 46.4.3 gesture remapper ([72e19ee](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/72e19ee11c715a43a064119e2f0ce549d62b072c))
* **settings:** add advanced feed rule settings ([2d7657f](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/2d7657f1130369acb3f1b43ee4437f89efa17d13))
* **settings:** add automatic clear display controls ([27f2b08](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/27f2b080c3fc7b995c61f1a363515c0cde697aa0))
* **settings:** add automatic clear display UI ([bcafc02](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/bcafc0247caf41b6f509fceec37daa7e8baaaead))
* **settings:** add download quality preference ([535ec7e](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/535ec7e7e9085cd8dc209773e83958ff9149160f))
* **settings:** add original photo and download quality options ([ac4c9b8](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/ac4c9b82f5e1a6249bc86a2390692f0eb8eb04f4))
* **settings:** add startup feed preferences ([eda18d7](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/eda18d7d423be812337ad8b3678b31fa5c2814e5))
* **settings:** add startup feed selector ([d058c3d](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/d058c3d4c07af9bbe2a400c9b9c88e262f5050b1))
* **settings:** expose automatic clear display status ([0513ab9](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/0513ab9b22e87b62d679b271f84080a2368f412d))
* **settings:** expose complete advanced feed rules ([0600773](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/0600773779dab0f36395d05542cebf7fbd48c37e))
* **settings:** expose original Photo Mode downloader status ([655bf84](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/655bf8419bfcc0d46ab26e4fd16c7c78ae479298))
* **settings:** expose original photos and download quality ([fa3eeb3](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/fa3eeb3f16840c10eba9573dd63d716e155d68a2))
* **settings:** expose startup feed selector ([43aef1c](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/43aef1c723e98179b29a8e9621e8b1fa9b93b291))
* **tiktok:** add advanced download source control ([f45ab4c](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/f45ab4cc2f993d0a41505969cd20abe694372797))
* **tiktok:** add advanced download source preference ([cb21b00](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/cb21b008aa31b91435dce81ed2751760ea520035))
* **tiktok:** add advanced download source setting ([43df417](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/43df417ceee471c07adb00dd13326eed8de2dcbf))
* **tiktok:** add advanced downloads patch ([61c1501](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/61c1501dba304846d0c54a82efefb2780bb44c6c))
* **tiktok:** add advanced feed controls ([f386cf1](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/f386cf1254e717a125f24eec72d6f5233445d090))
* **tiktok:** add advanced feed filter patch ([6860a36](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/6860a361ca476832cdb1e7b141760e088dfe7a91))
* **tiktok:** add advanced feed settings ([377fdb2](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/377fdb27d9bd46245812a7f9319839a361322c2c))
* **tiktok:** add AI-generated content filter setting ([aca486c](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/aca486c5a578646671398740231ecddeca433e0d))
* **tiktok:** add automatic clear display patch ([707444f](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/707444f7b9acbe4897f6b04ac4aaa0262d0829f6))
* **tiktok:** add automatic clear display scheduler ([049e429](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/049e4291bb2ee93316e1be5f9768c77d81d8d1a2))
* **tiktok:** add BlueIT advanced feed rules ([b018c05](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/b018c053899071172a90239553ee0fb091766d80))
* **tiktok:** add BlueIT profiles UI ([90234c8](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/90234c89706708eee2409404d2bb802466b02dfb))
* **tiktok:** add clear seen history control ([9f2ac91](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/9f2ac91dc257eb01fc1e8865bd9b080f342d044b))
* **tiktok:** add download quality selector engine ([34eb76f](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/34eb76fbfc3bbe239568bbe87b4bd17c49d0e3af))
* **tiktok:** add feature gate learn mode core ([044f519](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/044f5196347b4d02015301ce83a083e3394cfa6e))
* **tiktok:** add feature gate recorder control ([ae14aca](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/ae14aca5848282c8cf8acafc16ab0820950213d5))
* **tiktok:** add feature gate recorder patch ([35fcc97](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/35fcc977d44865167c09b2fe385d66d3051cded4))
* **tiktok:** add hide already seen videos patch ([8e1bfe2](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/8e1bfe21808c2d957cf68da02ad955bc175e7f63))
* **tiktok:** add Learn mode to BlueIT app behavior ([a2e49a0](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/a2e49a0d8e05aa9b2da202bbc7f4efd10477823d))
* **tiktok:** add local seen video history ([cc76ede](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/cc76ede3fe2f1456c254fe7ba52bbee4f8991514))
* **tiktok:** add original Photo Mode downloader patch ([de114ff](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/de114ff5244a622c59e54610f4fb4a4bbfc0d9a7))
* **tiktok:** add percentage input preference ([e0783ba](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/e0783badc50484b2052aee9c590fae96f881bfe6))
* **tiktok:** add seen history retention setting ([93964f6](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/93964f6d5c3f27affe0c1978775f7ad815ba7716))
* **tiktok:** add seen video controls to feed settings ([3c74775](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/3c74775bd8eea5709fc1dc71b856d9c26691132f))
* **tiktok:** add seen video feed filter ([4eb2113](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/4eb2113930278ec0e0ad941ad2b3ae83271050e8))
* **tiktok:** add seen video settings ([765a9bf](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/765a9bfa38e2cf2d5f347206bef31da5b8f622ff))
* **tiktok:** add startup feed tab controller ([9402cd7](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/9402cd70f77dbc8cae234b5c1aebc6fee6e8984a))
* **tiktok:** apply selected download quality ([fc93d6c](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/fc93d6cf1e0eee0f77fd56c252171e53f778602d))
* **tiktok:** complete advanced feed filter rules ([20bb1e1](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/20bb1e1a5a2d3a100c2c2ed91c0a091f24ee6a2f))
* **tiktok:** expose advanced downloads status ([42bf53a](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/42bf53a416ee1343775cf11eadc672dbd2d8ed3a))
* **tiktok:** expose advanced feed filter status ([c551df7](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/c551df71140feca7c7133b4b2ba9a1d85439bb09))
* **tiktok:** expose AI-generated content filter ([8227f9c](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/8227f9c81a5644ce17142a1378859f3f7a186683))
* **tiktok:** expose download quality selector patch ([dd2c4d2](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/dd2c4d2621c736c1af03cd00109c3dad8bc1e0c2))
* **tiktok:** expose feature gate recorder status ([08452c1](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/08452c1d0149254d05967d1112c390ea18e4e4df))
* **tiktok:** expose seen video filter status ([c919002](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/c919002aacf2951b0872d5e822c879e0f39c5f13))
* **tiktok:** filter TikTok-labeled AI content ([0ce4565](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/0ce4565247803a54e4af6668c3a035ea78a78e1f))
* **tiktok:** fingerprint playback progress for seen history ([f3d181a](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/f3d181a516b297fe48b545ebca6ce20963d5f093))
* **tiktok:** remember and choose startup feed tab ([b8ba6cb](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/b8ba6cb3a132cb5979051bd5b98ea2bbef8ecef4))
* **tiktok:** save original Photo Mode CDN assets ([ad123f4](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/ad123f466b2a4b8db2d097622d7d95cf69e5a28f))
* **tiktok:** schedule automatic clear display from native event hook ([301ebca](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/301ebcaccdb036641bb4340fa71f5dbf1a95de77))
* **tiktok:** select BlueIT video download source ([74073f9](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/74073f90995d30b054d9dc23e211ed4425b4a6bf))
* **tiktok:** trigger original Photo Mode downloader ([c825d60](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/c825d60c9b06a44f92f8b59005096e004dd23e37))





## 1.1.0

## [1.0.1](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/compare/v1.0.0...v1.0.1) (2026-08-18)


### Bug Fixes

* **tiktok:** remove stale 46.4.3 runtime references ([6584bd1](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/6584bd1f3928f68a41bedfa93703843019616a84))





## 1.0.1

# 1.0.0 (2026-08-18)


### Bug Fixes

* add release changelog script ([74fa14e](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/74fa14ebe975509816a9344031dd176a76595407))
* avoid concurrent feed list iteration crash ([275e8d5](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/275e8d5f3ad273b24a5bd592b0da86bfe7dc3ee4))
* **build:** select current bundle for patch catalog ([69bd1e9](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/69bd1e93194825b7af567e8456de4f29831fd9a8))
* distinguish global and jp tiktok packages ([7e1f7df](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/7e1f7dfd23d79346529715854a9b1840af210d47))
* fallback open debug settings insertion ([e201d53](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/e201d533d19504f4e32001d6985cad7ee9804b15))
* improve settings menu dark mode layout ([4da9d87](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/4da9d8785f0e6ad97f8c9ad7e4e3cf5655f2e0f4))
* improve settings menu dark mode layout ([2aa837b](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/2aa837b165e16c3bf435b385f15160c0ad6c41d1))
* improve settings readability and debug logging ([f4f4bc4](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/f4f4bc4dc9104182c1a419878ddf837057555340))
* limit TikTok compatibility to global package ([49806ad](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/49806ad5a1c75bc2d7f052abf227b7d055879935))
* **morphe:** support patching on older Android versions ([01463a0](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/01463a04e2a64a2a1400391778576779cfb2b211)), closes [#85](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/issues/85)
* prefer largest clean download source ([4f63b8a](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/4f63b8aab765373041cbce77135efd55f34623c0))
* reduce repeated feed filter scans ([370b806](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/370b806cc1c64574d767b397d612e79a58ed6896))
* reduce repeated feed filter scans ([d161ef2](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/d161ef20c8d9648fb4e48d84655f062c9be99813))
* restore downloads fallback for restricted videos ([277f400](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/277f4003643b35045b62f9f95f63ed2d8bb889bf))
* restore downloads fallback for restricted videos ([32cfafe](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/32cfafeaf10ad1bcf87d72a38927977f76000ec5))
* sanitize TikTok sharing links before shortening ([53a3558](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/53a3558f7e1921ccd2636fe2d322a4b7c1ca3d04))
* soften support preference copy ([5cbfd26](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/5cbfd26030b35d5b2996ead5073b2ffd7df166a5))
* support global settings top row insertion ([c38f1b6](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/c38f1b63d32b3d7218de1f5c46243f728c6c5868))
* **tiktok:** filter following ads at cached feed reads ([13d74f0](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/13d74f00b1d076aa22b7a4ab8bbe92bfaf2c4b6b))
* **tiktok:** filter late following feed ads ([a232cba](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/a232cbaeb3725f0c1361d20a99e9a6fd31a0be53))
* **tiktok:** hook native video looping boundary ([2721f01](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/2721f010b670842f9776b2afb34486de418f29d9))
* **tiktok:** preserve account verification CAPTCHA flows ([dd35d89](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/dd35d8948b002f0d098ed1f83a3f64cddc5f7904))
* **tiktok:** preserve native download addresses ([61da3c6](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/61da3c6413ed75cdb04f5eb1cb4b7292dfd06089))
* **tiktok:** prevent seekbar recursion on stories ([9d2c0bc](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/9d2c0bc823ce661b385fff12945ac5c2ace0223f))
* **tiktok:** repair automatic comment translation ([636ef64](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/636ef648c18be2610c6ee48beed7270e37ffce41))
* **tiktok:** reset completed video resume state ([100cab5](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/100cab58fc178f360c2e727308e161e3e3e2f9ad))
* **tiktok:** skip same-language automatic translations ([3415710](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/3415710facfc60db19943599112b9bc47cf82647))
* **tiktok:** use native video loop control ([f508adb](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/f508adbdbf6229e7a993a42616ed00cc0feadcd2))


### Features

* add navigation translation and settings controls ([72ad5de](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/72ad5de04b8f7c670f25ca718d219d06124fe553))
* add SIM spoof country presets ([7f8fb32](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/7f8fb32dd7bc1f0b34078482216c087914b8ff4c))
* add SIM spoof country presets ([bb73b3d](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/bb73b3dfebdcbbf9f612a7716e408a8928b56568))
* copy comments without username ([ac01d5f](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/ac01d5f8f2e673d6b72a38a6abf5d5da27330208))
* filter bottom navigation tabs ([e1f01b2](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/e1f01b25e35bb6d284691c273ae4b0b4778a57dc))
* save comment media downloads ([77b4dab](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/77b4dabcd6f327a7b9f06e5646193a0d7e54a52f))
* **tiktok:** add custom offline videos limit ([bfcb717](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/bfcb717d9e6fdcfb69ec7d0b30016352ed6d6c90))
* **tiktok:** add feature gate lab and UI suppressors ([72bf32a](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/72bf32aa6991257ace0bab91d3a8767617cbd802))
* **tiktok:** add focused debug diagnostics ([878d0f4](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/878d0f44b4b1bc1846ecb888ca3f9536fcf4db11))
* **tiktok:** add native search and seekbar controls ([c36bfaf](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/c36bfaf51d6e8d30fbef6e5c6ba99bfdeae283e2))
* **tiktok:** add playback completion controls ([9a51c2f](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/9a51c2f614145250177600144abd61eb30cf0841))
* **tiktok:** add quick-action controls ([fe29a24](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/fe29a249e42620d53dc6224c347c74aadc291c08))
* **tiktok:** add translation language exclusions ([8f60185](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/8f60185434a3cbb13653438a6561e2d7fc45f4dd))
* **tiktok:** enable Feature Gate Lab by default ([a164b70](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/a164b70cf046a738d3b0a817a57b1fedf515ef2e))
* **tiktok:** enable hold-and-slide 2x lock ([a2fd626](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/a2fd626ecb1fb116461b760445128bfdd8980f29))
* **tiktok:** improve feature gate lab search ([ffc19de](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/ffc19dece888a6ef814d20401d0bc4b9ba93858d))
* **tiktok:** port all patches to TikTok 46.4.3 ([bd48c7a](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/bd48c7ae4bd5a878e38f7ba5d4219e2a82779a25))
* **tiktok:** port core patches to TikTok 46.2.3 ([2c52b6a](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/2c52b6aa1362a3a9ccbcdd8dad2e16ec4b9a06cc))
* **tiktok:** port external browser patch from lyyako ([7a517c2](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/7a517c218a35508ac4f284450ff6d6c4d3ea05d8))
* **tiktok:** port Feature Gate Lab to TikTok 46.2.3 ([4bdbdee](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/4bdbdeed1649bdc6177ea6a2c62bd2d9300ac8d6))
* **tiktok:** port publish date patch from lyyako ([1b6c386](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/1b6c386611239c39242bc813fca9614c8de3d3d1))
* **tiktok:** redesign patch settings navigation ([a479bdb](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/a479bdb09a4e01584f9d683cdfda1c65d3ab6dff))
* **tiktok:** redesign support row ([cc39469](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/cc39469c98eabc0ccdea40fc423e94639c34703f))
* **tiktok:** restore download templates and sticker formats ([91d158c](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/91d158ca3da1126a2d2ca9f4c2330e81d3ea96f9))
* **tiktok:** separate optional diagnostics from settings entry ([aad18c3](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/aad18c3e4b301366685174b0faa5a23a8a2850de))


### Performance Improvements

* reduce feed filter scanning overhead ([007d1be](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/007d1be0a93393a7ca1935cea8740cb167b5e6f9))
* reduce feed filter scanning overhead ([ac13277](https://github.com/BlueDragon4251/tiktok-patches-for-morphe/commit/ac13277743e2c5f4022a4e1bafea1caf067520fe))





## 1.0.0

## [0.6.1](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.6.0...v0.6.1) (2026-08-09)


### Bug Fixes

* **morphe:** support patching on older Android versions ([01463a0](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/01463a04e2a64a2a1400391778576779cfb2b211)), closes [#85](https://github.com/icysymmetra/tiktok-patches-for-morphe/issues/85)





## 0.6.1

# [0.6.0](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.5.0...v0.6.0) (2026-08-09)


### Features

* **tiktok:** restore download templates and sticker formats ([91d158c](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/91d158ca3da1126a2d2ca9f4c2330e81d3ea96f9))





## 0.6.0

# [0.5.0](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.4.1...v0.5.0) (2026-08-09)


### Bug Fixes

* **build:** select current bundle for patch catalog ([69bd1e9](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/69bd1e93194825b7af567e8456de4f29831fd9a8))
* **tiktok:** filter following ads at cached feed reads ([13d74f0](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/13d74f00b1d076aa22b7a4ab8bbe92bfaf2c4b6b))
* **tiktok:** filter late following feed ads ([a232cba](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/a232cbaeb3725f0c1361d20a99e9a6fd31a0be53))
* **tiktok:** hook native video looping boundary ([2721f01](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/2721f010b670842f9776b2afb34486de418f29d9))
* **tiktok:** preserve account verification CAPTCHA flows ([dd35d89](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/dd35d8948b002f0d098ed1f83a3f64cddc5f7904))
* **tiktok:** preserve native download addresses ([61da3c6](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/61da3c6413ed75cdb04f5eb1cb4b7292dfd06089))
* **tiktok:** repair automatic comment translation ([636ef64](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/636ef648c18be2610c6ee48beed7270e37ffce41))
* **tiktok:** reset completed video resume state ([100cab5](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/100cab58fc178f360c2e727308e161e3e3e2f9ad))
* **tiktok:** skip same-language automatic translations ([3415710](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/3415710facfc60db19943599112b9bc47cf82647))
* **tiktok:** use native video loop control ([f508adb](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/f508adbdbf6229e7a993a42616ed00cc0feadcd2))


### Features

* **tiktok:** add native search and seekbar controls ([c36bfaf](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/c36bfaf51d6e8d30fbef6e5c6ba99bfdeae283e2))
* **tiktok:** add playback completion controls ([9a51c2f](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/9a51c2f614145250177600144abd61eb30cf0841))
* **tiktok:** add quick-action controls ([fe29a24](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/fe29a249e42620d53dc6224c347c74aadc291c08))
* **tiktok:** port core patches to TikTok 46.2.3 ([2c52b6a](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/2c52b6aa1362a3a9ccbcdd8dad2e16ec4b9a06cc))
* **tiktok:** port Feature Gate Lab to TikTok 46.2.3 ([4bdbdee](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/4bdbdeed1649bdc6177ea6a2c62bd2d9300ac8d6))
* **tiktok:** redesign patch settings navigation ([a479bdb](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/a479bdb09a4e01584f9d683cdfda1c65d3ab6dff))
* **tiktok:** separate optional diagnostics from settings entry ([aad18c3](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/aad18c3e4b301366685174b0faa5a23a8a2850de))





## 0.5.0

## [0.4.1](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.4.0...v0.4.1) (2026-07-28)


### Bug Fixes

* **tiktok:** prevent seekbar recursion on stories ([9d2c0bc](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/9d2c0bc823ce661b385fff12945ac5c2ace0223f))





## 0.4.1

# [0.4.0](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.3.1...v0.4.0) (2026-07-26)


### Features

* **tiktok:** add feature gate lab and UI suppressors ([72bf32a](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/72bf32aa6991257ace0bab91d3a8767617cbd802))
* **tiktok:** add translation language exclusions ([8f60185](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/8f60185434a3cbb13653438a6561e2d7fc45f4dd))
* **tiktok:** enable Feature Gate Lab by default ([a164b70](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/a164b70cf046a738d3b0a817a57b1fedf515ef2e))
* **tiktok:** enable hold-and-slide 2x lock ([a2fd626](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/a2fd626ecb1fb116461b760445128bfdd8980f29))
* **tiktok:** improve feature gate lab search ([ffc19de](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/ffc19dece888a6ef814d20401d0bc4b9ba93858d))
* **tiktok:** port external browser patch from lyyako ([7a517c2](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/7a517c218a35508ac4f284450ff6d6c4d3ea05d8))
* **tiktok:** port publish date patch from lyyako ([1b6c386](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/1b6c386611239c39242bc813fca9614c8de3d3d1))
* **tiktok:** redesign support row ([cc39469](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/cc39469c98eabc0ccdea40fc423e94639c34703f))





## 0.4.0

# [0.4.0-dev.1](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.3.1...v0.4.0-dev.1) (2026-07-26)


### Features

* **tiktok:** add feature gate lab and UI suppressors ([72bf32a](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/72bf32aa6991257ace0bab91d3a8767617cbd802))
* **tiktok:** add translation language exclusions ([8f60185](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/8f60185434a3cbb13653438a6561e2d7fc45f4dd))
* **tiktok:** enable Feature Gate Lab by default ([a164b70](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/a164b70cf046a738d3b0a817a57b1fedf515ef2e))
* **tiktok:** enable hold-and-slide 2x lock ([a2fd626](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/a2fd626ecb1fb116461b760445128bfdd8980f29))
* **tiktok:** improve feature gate lab search ([ffc19de](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/ffc19dece888a6ef814d20401d0bc4b9ba93858d))
* **tiktok:** port external browser patch from lyyako ([7a517c2](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/7a517c218a35508ac4f284450ff6d6c4d3ea05d8))
* **tiktok:** port publish date patch from lyyako ([1b6c386](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/1b6c386611239c39242bc813fca9614c8de3d3d1))
* **tiktok:** redesign support row ([cc39469](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/cc39469c98eabc0ccdea40fc423e94639c34703f))





## 0.4.0-dev.1

## [0.3.1](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.3.0...v0.3.1) (2026-06-17)


### Bug Fixes

* avoid concurrent feed list iteration crash ([275e8d5](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/275e8d5f3ad273b24a5bd592b0da86bfe7dc3ee4))





## 0.3.1

# [0.3.0](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.2.0...v0.3.0) (2026-06-17)


### Bug Fixes

* improve settings menu dark mode layout ([2aa837b](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/2aa837b165e16c3bf435b385f15160c0ad6c41d1))
* prefer largest clean download source ([4f63b8a](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/4f63b8aab765373041cbce77135efd55f34623c0))
* reduce repeated feed filter scans ([d161ef2](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/d161ef20c8d9648fb4e48d84655f062c9be99813))
* restore downloads fallback for restricted videos ([32cfafe](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/32cfafeaf10ad1bcf87d72a38927977f76000ec5))


### Features

* add navigation translation and settings controls ([72ad5de](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/72ad5de04b8f7c670f25ca718d219d06124fe553))
* add SIM spoof country presets ([bb73b3d](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/bb73b3dfebdcbbf9f612a7716e408a8928b56568))
* copy comments without username ([ac01d5f](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/ac01d5f8f2e673d6b72a38a6abf5d5da27330208))
* filter bottom navigation tabs ([e1f01b2](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/e1f01b25e35bb6d284691c273ae4b0b4778a57dc))
* save comment media downloads ([77b4dab](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/77b4dabcd6f327a7b9f06e5646193a0d7e54a52f))
* **tiktok:** add custom offline videos limit ([bfcb717](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/bfcb717d9e6fdcfb69ec7d0b30016352ed6d6c90))
* **tiktok:** add focused debug diagnostics ([878d0f4](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/878d0f44b4b1bc1846ecb888ca3f9536fcf4db11))


### Performance Improvements

* reduce feed filter scanning overhead ([ac13277](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/ac13277743e2c5f4022a4e1bafea1caf067520fe))





## 0.3.0

# [0.2.0](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.1.5...v0.2.0) (2026-06-06)


### Bug Fixes

* improve settings menu dark mode layout ([4da9d87](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/4da9d8785f0e6ad97f8c9ad7e4e3cf5655f2e0f4))
* reduce repeated feed filter scans ([370b806](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/370b806cc1c64574d767b397d612e79a58ed6896))
* restore downloads fallback for restricted videos ([277f400](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/277f4003643b35045b62f9f95f63ed2d8bb889bf))


### Features

* add SIM spoof country presets ([7f8fb32](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/7f8fb32dd7bc1f0b34078482216c087914b8ff4c))


### Performance Improvements

* reduce feed filter scanning overhead ([007d1be](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/007d1be0a93393a7ca1935cea8740cb167b5e6f9))





## 0.2.0

## [0.1.5](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.1.4...v0.1.5) (2026-06-01)


### Bug Fixes

* limit TikTok compatibility to global package ([49806ad](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/49806ad5a1c75bc2d7f052abf227b7d055879935))
* sanitize TikTok sharing links before shortening ([53a3558](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/53a3558f7e1921ccd2636fe2d322a4b7c1ca3d04))





## 0.1.5

## [0.1.4](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.1.3...v0.1.4) (2026-05-30)


### Bug Fixes

* improve settings readability and debug logging ([f4f4bc4](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/f4f4bc4dc9104182c1a419878ddf837057555340))





## 0.1.4

## [0.1.3](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.1.2...v0.1.3) (2026-05-29)


### Bug Fixes

* support global settings top row insertion ([c38f1b6](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/c38f1b63d32b3d7218de1f5c46243f728c6c5868))





## 0.1.3

## [0.1.3](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.1.2...v0.1.3) (2026-05-29)


### Bug Fixes

* support global settings top row insertion ([c38f1b6](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/c38f1b63d32b3d7218de1f5c46243f728c6c5868))





## 0.1.3

## [0.1.2](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.1.1...v0.1.2) (2026-05-29)


### Bug Fixes

* fallback open debug settings insertion ([e201d53](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/e201d533d19504f4e32001d6985cad7ee9804b15))





## 0.1.2

## [0.1.1](https://github.com/icysymmetra/tiktok-patches-for-morphe/compare/v0.1.0...v0.1.1) (2026-05-29)


### Bug Fixes

* add release changelog script ([74fa14e](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/74fa14ebe975509816a9344031dd176a76595407))
* distinguish global and jp tiktok packages ([7e1f7df](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/7e1f7dfd23d79346529715854a9b1840af210d47))
* soften support preference copy ([5cbfd26](https://github.com/icysymmetra/tiktok-patches-for-morphe/commit/5cbfd26030b35d5b2996ead5073b2ffd7df166a5))





## 0.1.1
