## 1.0.0 (2026-11-01)

### 🐛 Bug Fixes

* accept the server-process gate before the settings startup hook ([4ddd7bd](https://github.com/VexingVertigo/spicetify-sandbox/commit/4ddd7bdfb9f1a1c58f8ecb4c8e2c35f68d38e58a))
* add the player-ad capability to the development app ([e7487b9](https://github.com/VexingVertigo/spicetify-sandbox/commit/e7487b9e8bf7280a6b747dc482c819cb8f290cdc))
* check Spotify classes by what they do, not by their dex bytes ([2e889d0](https://github.com/VexingVertigo/spicetify-sandbox/commit/2e889d03667b677291199809c6af76785c356f50))
* clarify disabling server files after cancellation tests ([bafa396](https://github.com/VexingVertigo/spicetify-sandbox/commit/bafa3965e800b13b796ca30a757ecdc338f0eff5))
* clean server-generated Spotify sharing links ([a04db5b](https://github.com/VexingVertigo/spicetify-sandbox/commit/a04db5b5ab5d287f95a51fca66bd8508f21d8e8c))
* describe Jellyfin in the server-files patch picker ([8d09cf6](https://github.com/VexingVertigo/spicetify-sandbox/commit/8d09cf6edfb930d636a9f4be16f4a107370836f1))
* discard server listings cancelled during network reads ([75c49a8](https://github.com/VexingVertigo/spicetify-sandbox/commit/75c49a8a50c1058e1b31545e0828ff36b9e012ba))
* extend Jellyfin Quick Connect approval window ([966d5e2](https://github.com/VexingVertigo/spicetify-sandbox/commit/966d5e20579980dc91cd4a1265cefedebbee9204))
* fail patching when submitted theme colors are invalid ([4558036](https://github.com/VexingVertigo/spicetify-sandbox/commit/4558036d8002c29a4eb32456d3cc61a6ad02c42b))
* hide server files from mount installs ([fbd78db](https://github.com/VexingVertigo/spicetify-sandbox/commit/fbd78db3e368b015b4974a44ab5560f2a0565e83))
* hook Spotify's Application lifecycle on its superclass ([3d4c1c0](https://github.com/VexingVertigo/spicetify-sandbox/commit/3d4c1c05eef4cbd9c4b979f5916566ee34a89692))
* include native settings generation in source packaging ([a4bad47](https://github.com/VexingVertigo/spicetify-sandbox/commit/a4bad47f65e3b17623c6acd1947b42a22919dd17))
* keep the Marketplace list during a refresh ([aba945d](https://github.com/VexingVertigo/spicetify-sandbox/commit/aba945d3f6a22d2ed8b3c54f10c61602146211de))
* keep themes saved by the previous engine ([66511a4](https://github.com/VexingVertigo/spicetify-sandbox/commit/66511a43853ce579fb90a8fe7fb1a9e7782854c4))
* open Spicetify settings without a manifest activity ([e474fa9](https://github.com/VexingVertigo/spicetify-sandbox/commit/e474fa990c5b7dcb95b515a5e0f8f5033c796a6c))
* order untagged discs first and drop singles filed under albums ([3e56368](https://github.com/VexingVertigo/spicetify-sandbox/commit/3e56368909963ec1ef61e49d7d2665fd8a8055df))
* pick the Your Library window return by its mapped result ([f7fad90](https://github.com/VexingVertigo/spicetify-sandbox/commit/f7fad90e14baa799da08ba41fb132dd552636f3d))
* polish server settings after device verification ([e4cbe15](https://github.com/VexingVertigo/spicetify-sandbox/commit/e4cbe15b70852f029e3efc5f1610b5cac0aa8d12))
* preserve server browser padding with system insets ([2bce93a](https://github.com/VexingVertigo/spicetify-sandbox/commit/2bce93ab6e072b839586ed1d6aad02ec484627c0))
* read the 9.1.88 shortcut model in Home pins ([57e3bcf](https://github.com/VexingVertigo/spicetify-sandbox/commit/57e3bcf896a583b49fafe0df15f51205434ff431))
* restore the working Spotify 9.1.80 baseline ([8fa30a0](https://github.com/VexingVertigo/spicetify-sandbox/commit/8fa30a051a7e28e7a4bc611facf60a3fdb73959a))
* serve server tracks from their own process so Spotify never wedges ([b35804b](https://github.com/VexingVertigo/spicetify-sandbox/commit/b35804beace77c58af433bf07f7224bc4c3621a7))
* tighten theme palette hooks and keep unsaved color groups stock ([583639f](https://github.com/VexingVertigo/spicetify-sandbox/commit/583639f2ca4664500a8a7a2093320b417a64aaf8))

### ✨ New Features

* acquire the client token without Play attestation ([24ac03f](https://github.com/VexingVertigo/spicetify-sandbox/commit/24ac03f5824c30bc0653c57649d5cc8ce1d72216))
* add a Random pill to Home's filter row ([b7c706f](https://github.com/VexingVertigo/spicetify-sandbox/commit/b7c706f0b5d1d11b218d5f133ea145a9aa07a727))
* add a reversible Premium navigation tab setting ([25fd752](https://github.com/VexingVertigo/spicetify-sandbox/commit/25fd752f0bd089eaf44be9657ce5d727d2ef1d52))
* add Galaxy V2 to the Marketplace ([1679b72](https://github.com/VexingVertigo/spicetify-sandbox/commit/1679b72b81a94e423caed1fc920c79ae452b6e0c))
* add Hide podcasts ([9ac09b1](https://github.com/VexingVertigo/spicetify-sandbox/commit/9ac09b19139e73ffa2bee5728ad7e14750d10989))
* add in-app Spotify patch settings ([ab9b040](https://github.com/VexingVertigo/spicetify-sandbox/commit/ab9b0403ee9b86499f70220226970d5930d447a1))
* add Jellyfin authentication and streaming protocol ([253041b](https://github.com/VexingVertigo/spicetify-sandbox/commit/253041b3541ef6fef66dde3f21b48be14a2d5a96))
* add Jellyfin library setup to server files settings ([8a07083](https://github.com/VexingVertigo/spicetify-sandbox/commit/8a07083391da1b0b929123f50ad6e8a0fb5e9562))
* add optional Home and Browse brand-ad filtering ([a4625b2](https://github.com/VexingVertigo/spicetify-sandbox/commit/a4625b23a32b936c93e5b9856ccd32e950ce527a))
* add optional Home pins and WebDAV server files ([d57a137](https://github.com/VexingVertigo/spicetify-sandbox/commit/d57a137ffd990e47917240cb6b03526a56d9e324))
* add Play a random song ([ccb2008](https://github.com/VexingVertigo/spicetify-sandbox/commit/ccb2008b4e31f559d9160fca92bcaab70f143902))
* add Show only my pins to Home shortcuts ([f759093](https://github.com/VexingVertigo/spicetify-sandbox/commit/f7590930ca59493ca356cd4222c9545e64b09129))
* add Shuffle+ ([33e425a](https://github.com/VexingVertigo/spicetify-sandbox/commit/33e425a5cebf35d1734f6159102a0a3c473d5500))
* add Shuffle+ to the playlist menu ([582b265](https://github.com/VexingVertigo/spicetify-sandbox/commit/582b26509151c6a501a02df36cc281461601da0f))
* add Spotify sharing cleanup and theme colors ([2971953](https://github.com/VexingVertigo/spicetify-sandbox/commit/2971953edcc647fb3dc07fc8a09392b509781aed))
* add Trash Bin ([9dccaae](https://github.com/VexingVertigo/spicetify-sandbox/commit/9dccaae9db06825ac6e4d256789c95c300598772))
* adopt Spicetify color roles for themes ([da01b06](https://github.com/VexingVertigo/spicetify-sandbox/commit/da01b0656ee6e974fdb285f6bd6a85e4c66e71f0))
* apply theme background images on Android ([95dfb0d](https://github.com/VexingVertigo/spicetify-sandbox/commit/95dfb0daec50241faccea07d163832a71d235835))
* apply themes on Android 11 and later with a resource table ([95af66d](https://github.com/VexingVertigo/spicetify-sandbox/commit/95af66d1cefd1373f746e7c48c5886a8dd90ad5b))
* apply themes with an overlay on Android 14 and later ([9cf1253](https://github.com/VexingVertigo/spicetify-sandbox/commit/9cf125391ee033b936684b65432e1d587c9ec254))
* browse Marketplace themes on Android ([0070c85](https://github.com/VexingVertigo/spicetify-sandbox/commit/0070c85ff4fa6640a032d6f08ac87efbdb181c92))
* browse server music by albums and artists ([506c95d](https://github.com/VexingVertigo/spicetify-sandbox/commit/506c95d341b2b0b8556feb9af8a12267832da6e5))
* browse the Spicetify Marketplace from Appearance ([caf7174](https://github.com/VexingVertigo/spicetify-sandbox/commit/caf7174f65286bc48e533f1099c85804f9a63fec))
* change theme colors from Spicetify settings ([20897f0](https://github.com/VexingVertigo/spicetify-sandbox/commit/20897f0efe0d70abd2a321c747b6a961795fc8ea))
* choose a theme or custom colors in Appearance ([0e051d0](https://github.com/VexingVertigo/spicetify-sandbox/commit/0e051d04640257bac1e678e4b7870c591a17e2a1))
* choose theme colors only in the app and recolor Encore palettes ([f67fb75](https://github.com/VexingVertigo/spicetify-sandbox/commit/f67fb758e1518a94de6bea78d0ae259486c42908))
* connect extensions to Spotify's player core ([3cd1230](https://github.com/VexingVertigo/spicetify-sandbox/commit/3cd1230bfed3a992d48f273da3c6bcbf09d03504))
* connect Jellyfin sessions to server indexing and streaming ([02d80c9](https://github.com/VexingVertigo/spicetify-sandbox/commit/02d80c9a7b04b29ec6e19a7712f50319dea8b7be))
* follow the in-app theme in Spicetify settings ([01bff7a](https://github.com/VexingVertigo/spicetify-sandbox/commit/01bff7a2445d9f382844f9deead4f4f242f93722))
* group Spicetify settings into Spotify-styled pages ([2190125](https://github.com/VexingVertigo/spicetify-sandbox/commit/219012583b5f944c37c784bfbe0d404e4c4643c3))
* hide embedded ad pages in Now Playing ([2c85701](https://github.com/VexingVertigo/spicetify-sandbox/commit/2c8570160ed23f34b6835ba21b174d3f0f9a4ff4))
* hide Now Playing image ad cards ([bab1667](https://github.com/VexingVertigo/spicetify-sandbox/commit/bab1667f81f9639e45f047f8d7a695b2c76ffc66))
* keep album artwork tags in the server catalog ([b5cf6e0](https://github.com/VexingVertigo/spicetify-sandbox/commit/b5cf6e024f619676340a661b0ead7ffda7d5e6e3))
* keep Home pins in the order they were picked ([06ffa90](https://github.com/VexingVertigo/spicetify-sandbox/commit/06ffa90771e3d50f99c0846b3bc1b426656dfa73))
* lay out server albums and artists like Spotify's pages ([c1573b7](https://github.com/VexingVertigo/spicetify-sandbox/commit/c1573b751d87ac88792c4a1b4542cef872011793))
* list every saved playlist in the Home shortcuts picker ([5b49f8f](https://github.com/VexingVertigo/spicetify-sandbox/commit/5b49f8f6d3111b2bb4958e77268d9b2be0b47edb))
* load the Marketplace from a cache, then GitHub ([0b7b51b](https://github.com/VexingVertigo/spicetify-sandbox/commit/0b7b51b7fc7f3620f7b3f32d7e203f93591c23fb))
* long-press Now Playing's shuffle button for Shuffle+ ([1f41688](https://github.com/VexingVertigo/spicetify-sandbox/commit/1f41688b73d27563a29b4d71b6ea12a844a65864))
* map Spicetify color roles to Spotify's colors ([4d12742](https://github.com/VexingVertigo/spicetify-sandbox/commit/4d12742f947dc89a6a3681ba078bbf0262f92ba2))
* paste a Spicetify color.ini or CSS theme ([9d8093a](https://github.com/VexingVertigo/spicetify-sandbox/commit/9d8093a44f0955f9aa243f3df32d769713861b1b))
* paste Spicetify theme colors on Android ([3e20466](https://github.com/VexingVertigo/spicetify-sandbox/commit/3e204661e72fe7ccd4e8bef4626b7e9127f98b11))
* pick a theme such as OLED, with custom colors including the header surface ([a9e9ca3](https://github.com/VexingVertigo/spicetify-sandbox/commit/a9e9ca3bd47416dbba02a8ba1efd717a5f17d0d3))
* port the ad patches to Spotify 9.1.88 ([93de47f](https://github.com/VexingVertigo/spicetify-sandbox/commit/93de47fd0bea16b9b4a0f667cab9b520a47f577d))
* port the analytics patch to Spotify 9.1.88 ([b35c5c8](https://github.com/VexingVertigo/spicetify-sandbox/commit/b35c5c81d73625ed6134538f1c0694bc51c98965))
* port the Home pins patch to Spotify 9.1.88 ([8f3bd8a](https://github.com/VexingVertigo/spicetify-sandbox/commit/8f3bd8ae5f03fc693c71b445021877474a626c15))
* port the Premium tab patch to Spotify 9.1.88 ([2444986](https://github.com/VexingVertigo/spicetify-sandbox/commit/2444986f261c5b6a0bfdc1560c3ef11514a65913))
* port the server files patch to Spotify 9.1.88 ([253281e](https://github.com/VexingVertigo/spicetify-sandbox/commit/253281ef14e04ee5bac1176f268bdac37e39e901))
* port the settings bridge to Spotify 9.1.88 ([c48ed9e](https://github.com/VexingVertigo/spicetify-sandbox/commit/c48ed9e880982c6e889b72711297d2925f2e511f))
* port the theme palette patch to Spotify 9.1.88 ([a7b4ea1](https://github.com/VexingVertigo/spicetify-sandbox/commit/a7b4ea1ee9afcb9b78254363c94f42c8c001fa17))
* present the app as the desktop client ([a0e41f3](https://github.com/VexingVertigo/spicetify-sandbox/commit/a0e41f392a400aa121ac56235a7b486a97fd845a))
* read album release years from Jellyfin ([144c006](https://github.com/VexingVertigo/spicetify-sandbox/commit/144c0065f467bf9423e9bddabc1b258eb97a1702))
* read Marketplace theme listings from GitHub ([d149bdc](https://github.com/VexingVertigo/spicetify-sandbox/commit/d149bdc17be2741f9494e1845825cd702b2a6c7f))
* recolor Compose screens with the theme ([fe588a4](https://github.com/VexingVertigo/spicetify-sandbox/commit/fe588a425eab88b9c3f19ce4fb2333eafced4e8c)), closes [#282828](https://github.com/VexingVertigo/spicetify-sandbox/issues/282828)
* remove Spotify analytics and tracking ([89cc61a](https://github.com/VexingVertigo/spicetify-sandbox/commit/89cc61ab1ad685444c7de7a44cee61098c564727))
* restart Spotify from settings when a change needs it ([767d9e4](https://github.com/VexingVertigo/spicetify-sandbox/commit/767d9e48ff3d2a63fafde073554444fec81d9186))
* retain server album and artist catalog metadata ([6889bc1](https://github.com/VexingVertigo/spicetify-sandbox/commit/6889bc17f99e815a6f8c810a8ac9b70d7f0b3607))
* serve sized server artwork for albums and artists ([58854c6](https://github.com/VexingVertigo/spicetify-sandbox/commit/58854c65f60df677a5de20fbf02984199bf51d07))
* show a theme's background image behind Spotify ([2e58d1a](https://github.com/VexingVertigo/spicetify-sandbox/commit/2e58d1abb3e70bd2df3e6b66b5d86453c3ea798c))
* show Marketplace preview images ([041b0ac](https://github.com/VexingVertigo/spicetify-sandbox/commit/041b0ac6c8b25b02671de4c981ac955d38f60600))
* show pinned playlists on Home even when Spotify leaves them out ([3418729](https://github.com/VexingVertigo/spicetify-sandbox/commit/3418729aaf588986a2e1cd62da31cfb7e9bf0979))
* show server album artwork for local tracks in the player ([ed0ae71](https://github.com/VexingVertigo/spicetify-sandbox/commit/ed0ae71f8727a826b6b7912c4b8a15ed2b062c8b))
* show server albums and artists in Your Library ([6d04023](https://github.com/VexingVertigo/spicetify-sandbox/commit/6d04023467a602c90e7f21e4f89815afc1785b32))
* show settings dialogs as Spotify-style bottom sheets ([43b6a20](https://github.com/VexingVertigo/spicetify-sandbox/commit/43b6a2048a710fcbcfbe12cddb7b7c019a3d864e))
* show the release year and the playing song on server albums ([dba11a5](https://github.com/VexingVertigo/spicetify-sandbox/commit/dba11a56da75b76f042207b14ad16e7b481a0a79))
* simplify Jellyfin sign-in and link Quick Connect approval ([e4e0867](https://github.com/VexingVertigo/spicetify-sandbox/commit/e4e086757619e2236716613e3b11681deb84016d))
* target Spotify 9.1.88.2204 ([757cc10](https://github.com/VexingVertigo/spicetify-sandbox/commit/757cc106a90d54b052a5d76f8e024349770f316f))
* turn Marketplace extensions on in Spotify ([248df06](https://github.com/VexingVertigo/spicetify-sandbox/commit/248df06f5489a3ddd6ccf7b4a11aa0a0e4a2d6b0))
* use Marketplace themes' own background images ([41c272a](https://github.com/VexingVertigo/spicetify-sandbox/commit/41c272a5b6a7633f1c11c779bd9a8f2cc636ce16))

### 🔧 Improvements

* avoid repeated server file scan and status work ([8cef481](https://github.com/VexingVertigo/spicetify-sandbox/commit/8cef4814b04ac46987c6b77c17e1e2d7a4b69958))

## 1.0.0 (2026-11-01)

### 🐛 Bug Fixes

* accept the server-process gate before the settings startup hook ([4ddd7bd](https://github.com/VexingVertigo/spicetify-sandbox/commit/4ddd7bdfb9f1a1c58f8ecb4c8e2c35f68d38e58a))
* add the player-ad capability to the development app ([e7487b9](https://github.com/VexingVertigo/spicetify-sandbox/commit/e7487b9e8bf7280a6b747dc482c819cb8f290cdc))
* check Spotify classes by what they do, not by their dex bytes ([2e889d0](https://github.com/VexingVertigo/spicetify-sandbox/commit/2e889d03667b677291199809c6af76785c356f50))
* clarify disabling server files after cancellation tests ([bafa396](https://github.com/VexingVertigo/spicetify-sandbox/commit/bafa3965e800b13b796ca30a757ecdc338f0eff5))
* clean server-generated Spotify sharing links ([a04db5b](https://github.com/VexingVertigo/spicetify-sandbox/commit/a04db5b5ab5d287f95a51fca66bd8508f21d8e8c))
* describe Jellyfin in the server-files patch picker ([8d09cf6](https://github.com/VexingVertigo/spicetify-sandbox/commit/8d09cf6edfb930d636a9f4be16f4a107370836f1))
* discard server listings cancelled during network reads ([75c49a8](https://github.com/VexingVertigo/spicetify-sandbox/commit/75c49a8a50c1058e1b31545e0828ff36b9e012ba))
* extend Jellyfin Quick Connect approval window ([966d5e2](https://github.com/VexingVertigo/spicetify-sandbox/commit/966d5e20579980dc91cd4a1265cefedebbee9204))
* fail patching when submitted theme colors are invalid ([4558036](https://github.com/VexingVertigo/spicetify-sandbox/commit/4558036d8002c29a4eb32456d3cc61a6ad02c42b))
* hide server files from mount installs ([fbd78db](https://github.com/VexingVertigo/spicetify-sandbox/commit/fbd78db3e368b015b4974a44ab5560f2a0565e83))
* hook Spotify's Application lifecycle on its superclass ([3d4c1c0](https://github.com/VexingVertigo/spicetify-sandbox/commit/3d4c1c05eef4cbd9c4b979f5916566ee34a89692))
* include native settings generation in source packaging ([a4bad47](https://github.com/VexingVertigo/spicetify-sandbox/commit/a4bad47f65e3b17623c6acd1947b42a22919dd17))
* keep the Marketplace list during a refresh ([aba945d](https://github.com/VexingVertigo/spicetify-sandbox/commit/aba945d3f6a22d2ed8b3c54f10c61602146211de))
* keep themes saved by the previous engine ([66511a4](https://github.com/VexingVertigo/spicetify-sandbox/commit/66511a43853ce579fb90a8fe7fb1a9e7782854c4))
* open Spicetify settings without a manifest activity ([e474fa9](https://github.com/VexingVertigo/spicetify-sandbox/commit/e474fa990c5b7dcb95b515a5e0f8f5033c796a6c))
* order untagged discs first and drop singles filed under albums ([3e56368](https://github.com/VexingVertigo/spicetify-sandbox/commit/3e56368909963ec1ef61e49d7d2665fd8a8055df))
* pick the Your Library window return by its mapped result ([f7fad90](https://github.com/VexingVertigo/spicetify-sandbox/commit/f7fad90e14baa799da08ba41fb132dd552636f3d))
* polish server settings after device verification ([e4cbe15](https://github.com/VexingVertigo/spicetify-sandbox/commit/e4cbe15b70852f029e3efc5f1610b5cac0aa8d12))
* preserve server browser padding with system insets ([2bce93a](https://github.com/VexingVertigo/spicetify-sandbox/commit/2bce93ab6e072b839586ed1d6aad02ec484627c0))
* read the 9.1.88 shortcut model in Home pins ([57e3bcf](https://github.com/VexingVertigo/spicetify-sandbox/commit/57e3bcf896a583b49fafe0df15f51205434ff431))
* restore the working Spotify 9.1.80 baseline ([8fa30a0](https://github.com/VexingVertigo/spicetify-sandbox/commit/8fa30a051a7e28e7a4bc611facf60a3fdb73959a))
* serve server tracks from their own process so Spotify never wedges ([b35804b](https://github.com/VexingVertigo/spicetify-sandbox/commit/b35804beace77c58af433bf07f7224bc4c3621a7))
* tighten theme palette hooks and keep unsaved color groups stock ([583639f](https://github.com/VexingVertigo/spicetify-sandbox/commit/583639f2ca4664500a8a7a2093320b417a64aaf8))

### ✨ New Features

* acquire the client token without Play attestation ([24ac03f](https://github.com/VexingVertigo/spicetify-sandbox/commit/24ac03f5824c30bc0653c57649d5cc8ce1d72216))
* add a Random pill to Home's filter row ([b7c706f](https://github.com/VexingVertigo/spicetify-sandbox/commit/b7c706f0b5d1d11b218d5f133ea145a9aa07a727))
* add a reversible Premium navigation tab setting ([25fd752](https://github.com/VexingVertigo/spicetify-sandbox/commit/25fd752f0bd089eaf44be9657ce5d727d2ef1d52))
* add Galaxy V2 to the Marketplace ([1679b72](https://github.com/VexingVertigo/spicetify-sandbox/commit/1679b72b81a94e423caed1fc920c79ae452b6e0c))
* add Hide podcasts ([9ac09b1](https://github.com/VexingVertigo/spicetify-sandbox/commit/9ac09b19139e73ffa2bee5728ad7e14750d10989))
* add in-app Spotify patch settings ([ab9b040](https://github.com/VexingVertigo/spicetify-sandbox/commit/ab9b0403ee9b86499f70220226970d5930d447a1))
* add Jellyfin authentication and streaming protocol ([253041b](https://github.com/VexingVertigo/spicetify-sandbox/commit/253041b3541ef6fef66dde3f21b48be14a2d5a96))
* add Jellyfin library setup to server files settings ([8a07083](https://github.com/VexingVertigo/spicetify-sandbox/commit/8a07083391da1b0b929123f50ad6e8a0fb5e9562))
* add optional Home and Browse brand-ad filtering ([a4625b2](https://github.com/VexingVertigo/spicetify-sandbox/commit/a4625b23a32b936c93e5b9856ccd32e950ce527a))
* add optional Home pins and WebDAV server files ([d57a137](https://github.com/VexingVertigo/spicetify-sandbox/commit/d57a137ffd990e47917240cb6b03526a56d9e324))
* add Play a random song ([ccb2008](https://github.com/VexingVertigo/spicetify-sandbox/commit/ccb2008b4e31f559d9160fca92bcaab70f143902))
* add Show only my pins to Home shortcuts ([f759093](https://github.com/VexingVertigo/spicetify-sandbox/commit/f7590930ca59493ca356cd4222c9545e64b09129))
* add Shuffle+ ([33e425a](https://github.com/VexingVertigo/spicetify-sandbox/commit/33e425a5cebf35d1734f6159102a0a3c473d5500))
* add Shuffle+ to the playlist menu ([582b265](https://github.com/VexingVertigo/spicetify-sandbox/commit/582b26509151c6a501a02df36cc281461601da0f))
* add Spotify sharing cleanup and theme colors ([2971953](https://github.com/VexingVertigo/spicetify-sandbox/commit/2971953edcc647fb3dc07fc8a09392b509781aed))
* add Trash Bin ([9dccaae](https://github.com/VexingVertigo/spicetify-sandbox/commit/9dccaae9db06825ac6e4d256789c95c300598772))
* adopt Spicetify color roles for themes ([da01b06](https://github.com/VexingVertigo/spicetify-sandbox/commit/da01b0656ee6e974fdb285f6bd6a85e4c66e71f0))
* apply theme background images on Android ([95dfb0d](https://github.com/VexingVertigo/spicetify-sandbox/commit/95dfb0daec50241faccea07d163832a71d235835))
* apply themes on Android 11 and later with a resource table ([95af66d](https://github.com/VexingVertigo/spicetify-sandbox/commit/95af66d1cefd1373f746e7c48c5886a8dd90ad5b))
* apply themes with an overlay on Android 14 and later ([9cf1253](https://github.com/VexingVertigo/spicetify-sandbox/commit/9cf125391ee033b936684b65432e1d587c9ec254))
* browse Marketplace themes on Android ([0070c85](https://github.com/VexingVertigo/spicetify-sandbox/commit/0070c85ff4fa6640a032d6f08ac87efbdb181c92))
* browse server music by albums and artists ([506c95d](https://github.com/VexingVertigo/spicetify-sandbox/commit/506c95d341b2b0b8556feb9af8a12267832da6e5))
* browse the Spicetify Marketplace from Appearance ([caf7174](https://github.com/VexingVertigo/spicetify-sandbox/commit/caf7174f65286bc48e533f1099c85804f9a63fec))
* change theme colors from Spicetify settings ([20897f0](https://github.com/VexingVertigo/spicetify-sandbox/commit/20897f0efe0d70abd2a321c747b6a961795fc8ea))
* choose a theme or custom colors in Appearance ([0e051d0](https://github.com/VexingVertigo/spicetify-sandbox/commit/0e051d04640257bac1e678e4b7870c591a17e2a1))
* choose theme colors only in the app and recolor Encore palettes ([f67fb75](https://github.com/VexingVertigo/spicetify-sandbox/commit/f67fb758e1518a94de6bea78d0ae259486c42908))
* connect extensions to Spotify's player core ([3cd1230](https://github.com/VexingVertigo/spicetify-sandbox/commit/3cd1230bfed3a992d48f273da3c6bcbf09d03504))
* connect Jellyfin sessions to server indexing and streaming ([02d80c9](https://github.com/VexingVertigo/spicetify-sandbox/commit/02d80c9a7b04b29ec6e19a7712f50319dea8b7be))
* follow the in-app theme in Spicetify settings ([01bff7a](https://github.com/VexingVertigo/spicetify-sandbox/commit/01bff7a2445d9f382844f9deead4f4f242f93722))
* group Spicetify settings into Spotify-styled pages ([2190125](https://github.com/VexingVertigo/spicetify-sandbox/commit/219012583b5f944c37c784bfbe0d404e4c4643c3))
* hide embedded ad pages in Now Playing ([2c85701](https://github.com/VexingVertigo/spicetify-sandbox/commit/2c8570160ed23f34b6835ba21b174d3f0f9a4ff4))
* hide Now Playing image ad cards ([bab1667](https://github.com/VexingVertigo/spicetify-sandbox/commit/bab1667f81f9639e45f047f8d7a695b2c76ffc66))
* keep album artwork tags in the server catalog ([b5cf6e0](https://github.com/VexingVertigo/spicetify-sandbox/commit/b5cf6e024f619676340a661b0ead7ffda7d5e6e3))
* keep Home pins in the order they were picked ([06ffa90](https://github.com/VexingVertigo/spicetify-sandbox/commit/06ffa90771e3d50f99c0846b3bc1b426656dfa73))
* lay out server albums and artists like Spotify's pages ([c1573b7](https://github.com/VexingVertigo/spicetify-sandbox/commit/c1573b751d87ac88792c4a1b4542cef872011793))
* list every saved playlist in the Home shortcuts picker ([5b49f8f](https://github.com/VexingVertigo/spicetify-sandbox/commit/5b49f8f6d3111b2bb4958e77268d9b2be0b47edb))
* load the Marketplace from a cache, then GitHub ([0b7b51b](https://github.com/VexingVertigo/spicetify-sandbox/commit/0b7b51b7fc7f3620f7b3f32d7e203f93591c23fb))
* long-press Now Playing's shuffle button for Shuffle+ ([1f41688](https://github.com/VexingVertigo/spicetify-sandbox/commit/1f41688b73d27563a29b4d71b6ea12a844a65864))
* map Spicetify color roles to Spotify's colors ([4d12742](https://github.com/VexingVertigo/spicetify-sandbox/commit/4d12742f947dc89a6a3681ba078bbf0262f92ba2))
* paste a Spicetify color.ini or CSS theme ([9d8093a](https://github.com/VexingVertigo/spicetify-sandbox/commit/9d8093a44f0955f9aa243f3df32d769713861b1b))
* paste Spicetify theme colors on Android ([3e20466](https://github.com/VexingVertigo/spicetify-sandbox/commit/3e204661e72fe7ccd4e8bef4626b7e9127f98b11))
* pick a theme such as OLED, with custom colors including the header surface ([a9e9ca3](https://github.com/VexingVertigo/spicetify-sandbox/commit/a9e9ca3bd47416dbba02a8ba1efd717a5f17d0d3))
* port the ad patches to Spotify 9.1.88 ([93de47f](https://github.com/VexingVertigo/spicetify-sandbox/commit/93de47fd0bea16b9b4a0f667cab9b520a47f577d))
* port the analytics patch to Spotify 9.1.88 ([b35c5c8](https://github.com/VexingVertigo/spicetify-sandbox/commit/b35c5c81d73625ed6134538f1c0694bc51c98965))
* port the Home pins patch to Spotify 9.1.88 ([8f3bd8a](https://github.com/VexingVertigo/spicetify-sandbox/commit/8f3bd8ae5f03fc693c71b445021877474a626c15))
* port the Premium tab patch to Spotify 9.1.88 ([2444986](https://github.com/VexingVertigo/spicetify-sandbox/commit/2444986f261c5b6a0bfdc1560c3ef11514a65913))
* port the server files patch to Spotify 9.1.88 ([253281e](https://github.com/VexingVertigo/spicetify-sandbox/commit/253281ef14e04ee5bac1176f268bdac37e39e901))
* port the settings bridge to Spotify 9.1.88 ([c48ed9e](https://github.com/VexingVertigo/spicetify-sandbox/commit/c48ed9e880982c6e889b72711297d2925f2e511f))
* port the theme palette patch to Spotify 9.1.88 ([a7b4ea1](https://github.com/VexingVertigo/spicetify-sandbox/commit/a7b4ea1ee9afcb9b78254363c94f42c8c001fa17))
* present the app as the desktop client ([a0e41f3](https://github.com/VexingVertigo/spicetify-sandbox/commit/a0e41f392a400aa121ac56235a7b486a97fd845a))
* read album release years from Jellyfin ([144c006](https://github.com/VexingVertigo/spicetify-sandbox/commit/144c0065f467bf9423e9bddabc1b258eb97a1702))
* read Marketplace theme listings from GitHub ([d149bdc](https://github.com/VexingVertigo/spicetify-sandbox/commit/d149bdc17be2741f9494e1845825cd702b2a6c7f))
* recolor Compose screens with the theme ([fe588a4](https://github.com/VexingVertigo/spicetify-sandbox/commit/fe588a425eab88b9c3f19ce4fb2333eafced4e8c)), closes [#282828](https://github.com/VexingVertigo/spicetify-sandbox/issues/282828)
* remove Spotify analytics and tracking ([89cc61a](https://github.com/VexingVertigo/spicetify-sandbox/commit/89cc61ab1ad685444c7de7a44cee61098c564727))
* restart Spotify from settings when a change needs it ([767d9e4](https://github.com/VexingVertigo/spicetify-sandbox/commit/767d9e48ff3d2a63fafde073554444fec81d9186))
* retain server album and artist catalog metadata ([6889bc1](https://github.com/VexingVertigo/spicetify-sandbox/commit/6889bc17f99e815a6f8c810a8ac9b70d7f0b3607))
* serve sized server artwork for albums and artists ([58854c6](https://github.com/VexingVertigo/spicetify-sandbox/commit/58854c65f60df677a5de20fbf02984199bf51d07))
* show a theme's background image behind Spotify ([2e58d1a](https://github.com/VexingVertigo/spicetify-sandbox/commit/2e58d1abb3e70bd2df3e6b66b5d86453c3ea798c))
* show Marketplace preview images ([041b0ac](https://github.com/VexingVertigo/spicetify-sandbox/commit/041b0ac6c8b25b02671de4c981ac955d38f60600))
* show pinned playlists on Home even when Spotify leaves them out ([3418729](https://github.com/VexingVertigo/spicetify-sandbox/commit/3418729aaf588986a2e1cd62da31cfb7e9bf0979))
* show server album artwork for local tracks in the player ([ed0ae71](https://github.com/VexingVertigo/spicetify-sandbox/commit/ed0ae71f8727a826b6b7912c4b8a15ed2b062c8b))
* show server albums and artists in Your Library ([6d04023](https://github.com/VexingVertigo/spicetify-sandbox/commit/6d04023467a602c90e7f21e4f89815afc1785b32))
* show settings dialogs as Spotify-style bottom sheets ([43b6a20](https://github.com/VexingVertigo/spicetify-sandbox/commit/43b6a2048a710fcbcfbe12cddb7b7c019a3d864e))
* show the release year and the playing song on server albums ([dba11a5](https://github.com/VexingVertigo/spicetify-sandbox/commit/dba11a56da75b76f042207b14ad16e7b481a0a79))
* simplify Jellyfin sign-in and link Quick Connect approval ([e4e0867](https://github.com/VexingVertigo/spicetify-sandbox/commit/e4e086757619e2236716613e3b11681deb84016d))
* target Spotify 9.1.88.2204 ([757cc10](https://github.com/VexingVertigo/spicetify-sandbox/commit/757cc106a90d54b052a5d76f8e024349770f316f))
* turn Marketplace extensions on in Spotify ([248df06](https://github.com/VexingVertigo/spicetify-sandbox/commit/248df06f5489a3ddd6ccf7b4a11aa0a0e4a2d6b0))
* use Marketplace themes' own background images ([41c272a](https://github.com/VexingVertigo/spicetify-sandbox/commit/41c272a5b6a7633f1c11c779bd9a8f2cc636ce16))

### 🔧 Improvements

* avoid repeated server file scan and status work ([8cef481](https://github.com/VexingVertigo/spicetify-sandbox/commit/8cef4814b04ac46987c6b77c17e1e2d7a4b69958))

## 1.0.0 (2026-11-01)

### 🐛 Bug Fixes

* accept the server-process gate before the settings startup hook ([83c7d37](https://github.com/VexingVertigo/spicetify-sandbox/commit/83c7d37f568341ebf3eb19baa139edcb9b0fd115))
* add the player-ad capability to the development app ([3d6d0b3](https://github.com/VexingVertigo/spicetify-sandbox/commit/3d6d0b32cd0f6bed8071115c628faea34725cd24))
* check Spotify classes by what they do, not by their dex bytes ([6741682](https://github.com/VexingVertigo/spicetify-sandbox/commit/6741682b28f5c120e7e995537b49705a5d8789ec))
* clarify disabling server files after cancellation tests ([c98c63f](https://github.com/VexingVertigo/spicetify-sandbox/commit/c98c63f327b0091aa18cdd1accbcde4af901b193))
* clean server-generated Spotify sharing links ([c01bddb](https://github.com/VexingVertigo/spicetify-sandbox/commit/c01bddb1c07c670c94922961ee955c7ecc0d064f))
* describe Jellyfin in the server-files patch picker ([7aa0707](https://github.com/VexingVertigo/spicetify-sandbox/commit/7aa070740d52dcd47796f3eb5288ccb4ddb7a6ce))
* discard server listings cancelled during network reads ([9e844a5](https://github.com/VexingVertigo/spicetify-sandbox/commit/9e844a54ae4aa4f36d526dbd79f2c671ecbb6073))
* extend Jellyfin Quick Connect approval window ([d706634](https://github.com/VexingVertigo/spicetify-sandbox/commit/d70663474dbf4418eddb72f767a9c09b7d097664))
* fail patching when submitted theme colors are invalid ([56c4cc0](https://github.com/VexingVertigo/spicetify-sandbox/commit/56c4cc00cedce0d09405cd0b5bf28fe90b885880))
* hide server files from mount installs ([dd35dae](https://github.com/VexingVertigo/spicetify-sandbox/commit/dd35daedf8385a067ade1c3280547cb9e3291a46))
* hook Spotify's Application lifecycle on its superclass ([282fc19](https://github.com/VexingVertigo/spicetify-sandbox/commit/282fc19091607899cc68bc97daa3542177d07451))
* include native settings generation in source packaging ([740d7a9](https://github.com/VexingVertigo/spicetify-sandbox/commit/740d7a9a3019c6d892e1fee6b9cc876877cd6836))
* keep the Marketplace list during a refresh ([809f3a4](https://github.com/VexingVertigo/spicetify-sandbox/commit/809f3a418c3616e8528793a1b01c22b519d42d43))
* keep themes saved by the previous engine ([3b81ea6](https://github.com/VexingVertigo/spicetify-sandbox/commit/3b81ea6c74fc7ffe12b8f2cf3309f4519d36c8ce))
* open Spicetify settings without a manifest activity ([579e770](https://github.com/VexingVertigo/spicetify-sandbox/commit/579e7706c83bbd696caa8d29231c1f0e1a4cd332))
* order untagged discs first and drop singles filed under albums ([b00a7cc](https://github.com/VexingVertigo/spicetify-sandbox/commit/b00a7cc0e287efc6317fd9bb9c6568d31c6f45c0))
* pick the Your Library window return by its mapped result ([daaa624](https://github.com/VexingVertigo/spicetify-sandbox/commit/daaa624bb5eb0258b59183351fba60e20701eaa6))
* polish server settings after device verification ([2429a12](https://github.com/VexingVertigo/spicetify-sandbox/commit/2429a12d9977a000d63f6c84f338f114bfb922b5))
* preserve server browser padding with system insets ([336fc5c](https://github.com/VexingVertigo/spicetify-sandbox/commit/336fc5c4acc1dd35a8387026b254491121c5c556))
* read the 9.1.88 shortcut model in Home pins ([c0c58c2](https://github.com/VexingVertigo/spicetify-sandbox/commit/c0c58c2a50f18ec4feac123f1d2b051e34cf724a))
* restore the working Spotify 9.1.80 baseline ([c10ac2d](https://github.com/VexingVertigo/spicetify-sandbox/commit/c10ac2da4c1a62e4b455129e78ee30725ff66077))
* serve server tracks from their own process so Spotify never wedges ([0ec5e69](https://github.com/VexingVertigo/spicetify-sandbox/commit/0ec5e693e6f1015875809c1673467589c2db2eb2))
* tighten theme palette hooks and keep unsaved color groups stock ([5171b09](https://github.com/VexingVertigo/spicetify-sandbox/commit/5171b0991ed677b7e40c10746c9cf096678b8cef))

### ✨ New Features

* acquire the client token without Play attestation ([0687a5d](https://github.com/VexingVertigo/spicetify-sandbox/commit/0687a5dcf7c647d67546c82f086837e6c744a713))
* add a Random pill to Home's filter row ([8de9300](https://github.com/VexingVertigo/spicetify-sandbox/commit/8de9300795776309ef9c295e9a60409d77c376fd))
* add a reversible Premium navigation tab setting ([b2d2a7a](https://github.com/VexingVertigo/spicetify-sandbox/commit/b2d2a7a3b2b2ea61faa493a8c5a2afa357d07238))
* add Galaxy V2 to the Marketplace ([a0277f1](https://github.com/VexingVertigo/spicetify-sandbox/commit/a0277f151a403d62cc966e656c37ed256f1f93d5))
* add Hide podcasts ([51a6bba](https://github.com/VexingVertigo/spicetify-sandbox/commit/51a6bba200e7a5db94a67ed83d3f9f7fa453c4c2))
* add in-app Spotify patch settings ([7822e51](https://github.com/VexingVertigo/spicetify-sandbox/commit/7822e51a809ee9de226fca12e65433461f122c96))
* add Jellyfin authentication and streaming protocol ([c470e97](https://github.com/VexingVertigo/spicetify-sandbox/commit/c470e979e3ffe744f578effacc475013d4527aa6))
* add Jellyfin library setup to server files settings ([ce687a3](https://github.com/VexingVertigo/spicetify-sandbox/commit/ce687a31f6245e2ab9933fa62b23b67d3df07965))
* add optional Home and Browse brand-ad filtering ([46cf033](https://github.com/VexingVertigo/spicetify-sandbox/commit/46cf0338c5699d0524ca2843e1ef2cf904ce0ff1))
* add optional Home pins and WebDAV server files ([37b4f5e](https://github.com/VexingVertigo/spicetify-sandbox/commit/37b4f5e7da99168f06b24ef11371f257e58815cd))
* add Play a random song ([a612526](https://github.com/VexingVertigo/spicetify-sandbox/commit/a612526e5229da8f84c4197dce56ad6ac2e09a6e))
* add Show only my pins to Home shortcuts ([c8c1131](https://github.com/VexingVertigo/spicetify-sandbox/commit/c8c11317b7bc32e84581d9b135c17cd80c4f8c04))
* add Shuffle+ ([2557b3e](https://github.com/VexingVertigo/spicetify-sandbox/commit/2557b3e1c25a5dcf809cb2afcf02191f72abd63a))
* add Shuffle+ to the playlist menu ([9cd3e74](https://github.com/VexingVertigo/spicetify-sandbox/commit/9cd3e744aa4cfdcf9464c285f102bb76c4bf5270))
* add Spotify sharing cleanup and theme colors ([7213920](https://github.com/VexingVertigo/spicetify-sandbox/commit/7213920d3b4986364e006da08f4944f8a4aa48d7))
* add Trash Bin ([d6a2842](https://github.com/VexingVertigo/spicetify-sandbox/commit/d6a284234a96667d6d95059df8df0a21693bc0b7))
* adopt Spicetify color roles for themes ([b0c719a](https://github.com/VexingVertigo/spicetify-sandbox/commit/b0c719ad2ce44e6ca64d7c87607c5e822701e372))
* apply theme background images on Android ([630e562](https://github.com/VexingVertigo/spicetify-sandbox/commit/630e5627d95f063dd336aff071c1217bae7f2f2e))
* apply themes on Android 11 and later with a resource table ([d1429f2](https://github.com/VexingVertigo/spicetify-sandbox/commit/d1429f20ec9e3a1705678f326873fe793d097b86))
* apply themes with an overlay on Android 14 and later ([a5ecd6c](https://github.com/VexingVertigo/spicetify-sandbox/commit/a5ecd6cf23a7aa0dff4488b758f0b68535304019))
* browse Marketplace themes on Android ([e08a092](https://github.com/VexingVertigo/spicetify-sandbox/commit/e08a092db7c1eae0b6dc67b0ff13b88b6f9b488e))
* browse server music by albums and artists ([f1f2ca5](https://github.com/VexingVertigo/spicetify-sandbox/commit/f1f2ca501dd28e04354c1c827ffcda26af7ed6e2))
* browse the Spicetify Marketplace from Appearance ([f66ff0c](https://github.com/VexingVertigo/spicetify-sandbox/commit/f66ff0c1f4328af6c2fe85db80c28efeff718ca8))
* change theme colors from Spicetify settings ([a37f1a1](https://github.com/VexingVertigo/spicetify-sandbox/commit/a37f1a1e60c239c298ba0bcb7c7250b6e045de6c))
* choose a theme or custom colors in Appearance ([61c09cc](https://github.com/VexingVertigo/spicetify-sandbox/commit/61c09ccd4146409760503b99e549f233faf03f95))
* choose theme colors only in the app and recolor Encore palettes ([4909197](https://github.com/VexingVertigo/spicetify-sandbox/commit/4909197025bb45ede4bf4cec50cda18234bab9e2))
* connect extensions to Spotify's player core ([915e585](https://github.com/VexingVertigo/spicetify-sandbox/commit/915e5853d7e6a6301ed46cb905c8c1f2cfea44e0))
* connect Jellyfin sessions to server indexing and streaming ([7a96b1b](https://github.com/VexingVertigo/spicetify-sandbox/commit/7a96b1b8d62f12fb8e76911b92feb4c6cb973fde))
* follow the in-app theme in Spicetify settings ([520e457](https://github.com/VexingVertigo/spicetify-sandbox/commit/520e45775cce94b60402ac39f677360efde94eb1))
* group Spicetify settings into Spotify-styled pages ([8439bab](https://github.com/VexingVertigo/spicetify-sandbox/commit/8439bab8529df09670d0062a2b5d1a07a11e45ce))
* hide embedded ad pages in Now Playing ([cc3d971](https://github.com/VexingVertigo/spicetify-sandbox/commit/cc3d971397f16324a43d525ef282631759c24a84))
* hide Now Playing image ad cards ([b89e227](https://github.com/VexingVertigo/spicetify-sandbox/commit/b89e227fdae31055134fed3022314c7104625d55))
* keep album artwork tags in the server catalog ([cec06e2](https://github.com/VexingVertigo/spicetify-sandbox/commit/cec06e2cc7adf7d93c0d24fa442b86e7171b3b3a))
* keep Home pins in the order they were picked ([c0174a9](https://github.com/VexingVertigo/spicetify-sandbox/commit/c0174a9ff97d6db6af480bc91ea81e5599847830))
* lay out server albums and artists like Spotify's pages ([add517e](https://github.com/VexingVertigo/spicetify-sandbox/commit/add517eb74da8bf2cc31677090048e07191e6837))
* list every saved playlist in the Home shortcuts picker ([9be6ddf](https://github.com/VexingVertigo/spicetify-sandbox/commit/9be6ddf3b6ed31deeb3e157ec1cdb1b9426908e2))
* load the Marketplace from a cache, then GitHub ([fb66e64](https://github.com/VexingVertigo/spicetify-sandbox/commit/fb66e643ff4c878a4d2dd515cf661e92f54ee355))
* long-press Now Playing's shuffle button for Shuffle+ ([3dc2a81](https://github.com/VexingVertigo/spicetify-sandbox/commit/3dc2a81969cf7e22d64bc2bb31197d54b303cca2))
* map Spicetify color roles to Spotify's colors ([7ccffa2](https://github.com/VexingVertigo/spicetify-sandbox/commit/7ccffa22fadf767f910cc5de77c1a10fcbda433d))
* paste a Spicetify color.ini or CSS theme ([0d58f52](https://github.com/VexingVertigo/spicetify-sandbox/commit/0d58f52cab51196b7c9c7417d183711f4bd20904))
* paste Spicetify theme colors on Android ([2c3cd45](https://github.com/VexingVertigo/spicetify-sandbox/commit/2c3cd4597806965e4fc1bfa308b327c4350c7f61))
* pick a theme such as OLED, with custom colors including the header surface ([1b9b34b](https://github.com/VexingVertigo/spicetify-sandbox/commit/1b9b34b827d155350c4b7116d460e4f3c3dc2090))
* port the ad patches to Spotify 9.1.88 ([a273699](https://github.com/VexingVertigo/spicetify-sandbox/commit/a27369988c2dc0cfd4268762ba89e416240728a4))
* port the analytics patch to Spotify 9.1.88 ([a0c1104](https://github.com/VexingVertigo/spicetify-sandbox/commit/a0c1104b9b242e8e7ccfeb0c3271d739843da83b))
* port the Home pins patch to Spotify 9.1.88 ([654d8d3](https://github.com/VexingVertigo/spicetify-sandbox/commit/654d8d3ed7e755aedcc6efbf1666c49a51c1f849))
* port the Premium tab patch to Spotify 9.1.88 ([b035aba](https://github.com/VexingVertigo/spicetify-sandbox/commit/b035aba04ce52a731ef32397d48ff1608b201fa6))
* port the server files patch to Spotify 9.1.88 ([7738e26](https://github.com/VexingVertigo/spicetify-sandbox/commit/7738e26c72e4872050641108ad11f40026c1bdc5))
* port the settings bridge to Spotify 9.1.88 ([e23a497](https://github.com/VexingVertigo/spicetify-sandbox/commit/e23a497d197302069180f73088f3cb4c9d225737))
* port the theme palette patch to Spotify 9.1.88 ([7258731](https://github.com/VexingVertigo/spicetify-sandbox/commit/72587314fa08c056ff5b9bc7d31c9050fc7bd1cf))
* read album release years from Jellyfin ([13b66d8](https://github.com/VexingVertigo/spicetify-sandbox/commit/13b66d87518aa11a2f99dd9a0f86d723dc66ce16))
* read Marketplace theme listings from GitHub ([75451ce](https://github.com/VexingVertigo/spicetify-sandbox/commit/75451ce6c195d3cd8e679358cf8148a096193c8f))
* recolor Compose screens with the theme ([1cadbb7](https://github.com/VexingVertigo/spicetify-sandbox/commit/1cadbb7ba24c3f2342b9d176ac746c36aff36ec0)), closes [#282828](https://github.com/VexingVertigo/spicetify-sandbox/issues/282828)
* remove Spotify analytics and tracking ([ccb6a43](https://github.com/VexingVertigo/spicetify-sandbox/commit/ccb6a43776ca8c56fa45d2af68ebc4386d6d5dc3))
* restart Spotify from settings when a change needs it ([0687d32](https://github.com/VexingVertigo/spicetify-sandbox/commit/0687d3212bc0fb55837cfe7898cda1667568f839))
* retain server album and artist catalog metadata ([52a76e0](https://github.com/VexingVertigo/spicetify-sandbox/commit/52a76e03da4712135666622fe4347cfdb110b31c))
* serve sized server artwork for albums and artists ([13c9715](https://github.com/VexingVertigo/spicetify-sandbox/commit/13c9715a32bab59f29d01dd204c05ab42acb57b4))
* show a theme's background image behind Spotify ([067f1d4](https://github.com/VexingVertigo/spicetify-sandbox/commit/067f1d44bb7712be8c2d07bacf11ae09dcbdc364))
* show Marketplace preview images ([d2da3f9](https://github.com/VexingVertigo/spicetify-sandbox/commit/d2da3f9a42e8e9ff1fbfee34510fc451cfbb3460))
* show pinned playlists on Home even when Spotify leaves them out ([465e5ed](https://github.com/VexingVertigo/spicetify-sandbox/commit/465e5ede38f2bfa4e4978ffd7d7ca9f3d1e2ec6b))
* show server album artwork for local tracks in the player ([4c025d0](https://github.com/VexingVertigo/spicetify-sandbox/commit/4c025d0354a73c99064715deac8ed87fd8c83383))
* show server albums and artists in Your Library ([483d066](https://github.com/VexingVertigo/spicetify-sandbox/commit/483d0669156b9514ae132dd242ad517fbf29ec9a))
* show settings dialogs as Spotify-style bottom sheets ([4215d22](https://github.com/VexingVertigo/spicetify-sandbox/commit/4215d223eb5bbe6b5c59ab5dd9357a2639de6c0b))
* show the release year and the playing song on server albums ([37d04f1](https://github.com/VexingVertigo/spicetify-sandbox/commit/37d04f18e4a60fef9e4057da7d6dde72d77defb1))
* simplify Jellyfin sign-in and link Quick Connect approval ([9ff0dc1](https://github.com/VexingVertigo/spicetify-sandbox/commit/9ff0dc1034e549e3e92f098323e6379004bb94ed))
* target Spotify 9.1.88.2204 ([3526678](https://github.com/VexingVertigo/spicetify-sandbox/commit/3526678c9a59e3af46614b7c7106b90443893f97))
* turn Marketplace extensions on in Spotify ([09d2ee6](https://github.com/VexingVertigo/spicetify-sandbox/commit/09d2ee61f41d386496b345bb0f044c42f9573f92))
* use Marketplace themes' own background images ([c30ca6f](https://github.com/VexingVertigo/spicetify-sandbox/commit/c30ca6f4907efb2712afef362aabf61ff2d9b2e1))

### 🔧 Improvements

* avoid repeated server file scan and status work ([47a04d5](https://github.com/VexingVertigo/spicetify-sandbox/commit/47a04d51277410ff14c4aa881512c0384a9dd5d4))

## [1.2.0](https://github.com/spicetify/morphe-patches/compare/v1.1.0...v1.2.0) (2026-10-08)

### ✨ New Features

* add a Random pill to Home's filter row ([8de9300](https://github.com/spicetify/morphe-patches/commit/8de9300795776309ef9c295e9a60409d77c376fd))
* add Hide podcasts ([51a6bba](https://github.com/spicetify/morphe-patches/commit/51a6bba200e7a5db94a67ed83d3f9f7fa453c4c2))
* add Play a random song ([a612526](https://github.com/spicetify/morphe-patches/commit/a612526e5229da8f84c4197dce56ad6ac2e09a6e))
* add Show only my pins to Home shortcuts ([c8c1131](https://github.com/spicetify/morphe-patches/commit/c8c11317b7bc32e84581d9b135c17cd80c4f8c04))
* add Shuffle+ ([2557b3e](https://github.com/spicetify/morphe-patches/commit/2557b3e1c25a5dcf809cb2afcf02191f72abd63a))
* add Shuffle+ to the playlist menu ([9cd3e74](https://github.com/spicetify/morphe-patches/commit/9cd3e744aa4cfdcf9464c285f102bb76c4bf5270))
* add Trash Bin ([d6a2842](https://github.com/spicetify/morphe-patches/commit/d6a284234a96667d6d95059df8df0a21693bc0b7))
* connect extensions to Spotify's player core ([915e585](https://github.com/spicetify/morphe-patches/commit/915e5853d7e6a6301ed46cb905c8c1f2cfea44e0))
* keep Home pins in the order they were picked ([c0174a9](https://github.com/spicetify/morphe-patches/commit/c0174a9ff97d6db6af480bc91ea81e5599847830))
* list every saved playlist in the Home shortcuts picker ([9be6ddf](https://github.com/spicetify/morphe-patches/commit/9be6ddf3b6ed31deeb3e157ec1cdb1b9426908e2))
* long-press Now Playing's shuffle button for Shuffle+ ([3dc2a81](https://github.com/spicetify/morphe-patches/commit/3dc2a81969cf7e22d64bc2bb31197d54b303cca2))
* show pinned playlists on Home even when Spotify leaves them out ([465e5ed](https://github.com/spicetify/morphe-patches/commit/465e5ede38f2bfa4e4978ffd7d7ca9f3d1e2ec6b))
* turn Marketplace extensions on in Spotify ([09d2ee6](https://github.com/spicetify/morphe-patches/commit/09d2ee61f41d386496b345bb0f044c42f9573f92))

## [1.1.0](https://github.com/spicetify/morphe-patches/compare/v1.0.1...v1.1.0) (2026-10-03)

Spicetify Android patches 1.1.0 targets **Spotify 9.1.80.2221, ARM64**. Other Spotify versions are not supported. Themes require Android 11 or later.

Changes in this release:

- Apply themes through Spicetify color roles, with presets, custom colors, and migration of previously saved themes.
- Paste colors from a Spicetify `color.ini` or CSS theme.
- Browse community themes in the Spicetify Marketplace, with search, previews, and a cached list.
- Apply theme background images, including Galaxy V2, with optional blur.
- Open Spicetify settings without adding a manifest Activity, and hide server files on mount installations that cannot support their separate process.

The Spotify 9.1.88 port and analytics and attestation experiments are archived and are not included in this release.

Download [patches-1.1.0.mpp](https://github.com/spicetify/morphe-patches/releases/download/v1.1.0/patches-1.1.0.mpp), or update the Spicetify source in Morphe Manager.

## [1.0.1](https://github.com/spicetify/morphe-patches/compare/v1.0.0...v1.0.1) (2026-10-01)

### 🐛 Bug Fixes

* serve server tracks from their own process so Spotify never wedges ([0ec5e69](https://github.com/spicetify/morphe-patches/commit/0ec5e693e6f1015875809c1673467589c2db2eb2))

## 1.0.0 (2026-09-30)

### 🐛 Bug Fixes

* add the player-ad capability to the development app ([3d6d0b3](https://github.com/spicetify/morphe-patches/commit/3d6d0b32cd0f6bed8071115c628faea34725cd24))
* clarify disabling server files after cancellation tests ([c98c63f](https://github.com/spicetify/morphe-patches/commit/c98c63f327b0091aa18cdd1accbcde4af901b193))
* clean server-generated Spotify sharing links ([c01bddb](https://github.com/spicetify/morphe-patches/commit/c01bddb1c07c670c94922961ee955c7ecc0d064f))
* describe Jellyfin in the server-files patch picker ([7aa0707](https://github.com/spicetify/morphe-patches/commit/7aa070740d52dcd47796f3eb5288ccb4ddb7a6ce))
* discard server listings cancelled during network reads ([9e844a5](https://github.com/spicetify/morphe-patches/commit/9e844a54ae4aa4f36d526dbd79f2c671ecbb6073))
* extend Jellyfin Quick Connect approval window ([d706634](https://github.com/spicetify/morphe-patches/commit/d70663474dbf4418eddb72f767a9c09b7d097664))
* fail patching when submitted theme colors are invalid ([56c4cc0](https://github.com/spicetify/morphe-patches/commit/56c4cc00cedce0d09405cd0b5bf28fe90b885880))
* include native settings generation in source packaging ([740d7a9](https://github.com/spicetify/morphe-patches/commit/740d7a9a3019c6d892e1fee6b9cc876877cd6836))
* order untagged discs first and drop singles filed under albums ([b00a7cc](https://github.com/spicetify/morphe-patches/commit/b00a7cc0e287efc6317fd9bb9c6568d31c6f45c0))
* polish server settings after device verification ([2429a12](https://github.com/spicetify/morphe-patches/commit/2429a12d9977a000d63f6c84f338f114bfb922b5))
* preserve server browser padding with system insets ([336fc5c](https://github.com/spicetify/morphe-patches/commit/336fc5c4acc1dd35a8387026b254491121c5c556))
* tighten theme palette hooks and keep unsaved color groups stock ([5171b09](https://github.com/spicetify/morphe-patches/commit/5171b0991ed677b7e40c10746c9cf096678b8cef))

### ✨ New Features

* add a reversible Premium navigation tab setting ([b2d2a7a](https://github.com/spicetify/morphe-patches/commit/b2d2a7a3b2b2ea61faa493a8c5a2afa357d07238))
* add in-app Spotify patch settings ([7822e51](https://github.com/spicetify/morphe-patches/commit/7822e51a809ee9de226fca12e65433461f122c96))
* add Jellyfin authentication and streaming protocol ([c470e97](https://github.com/spicetify/morphe-patches/commit/c470e979e3ffe744f578effacc475013d4527aa6))
* add Jellyfin library setup to server files settings ([ce687a3](https://github.com/spicetify/morphe-patches/commit/ce687a31f6245e2ab9933fa62b23b67d3df07965))
* add optional Home and Browse brand-ad filtering ([46cf033](https://github.com/spicetify/morphe-patches/commit/46cf0338c5699d0524ca2843e1ef2cf904ce0ff1))
* add optional Home pins and WebDAV server files ([37b4f5e](https://github.com/spicetify/morphe-patches/commit/37b4f5e7da99168f06b24ef11371f257e58815cd))
* add Spotify sharing cleanup and theme colors ([7213920](https://github.com/spicetify/morphe-patches/commit/7213920d3b4986364e006da08f4944f8a4aa48d7))
* browse server music by albums and artists ([f1f2ca5](https://github.com/spicetify/morphe-patches/commit/f1f2ca501dd28e04354c1c827ffcda26af7ed6e2))
* change theme colors from Spicetify settings ([a37f1a1](https://github.com/spicetify/morphe-patches/commit/a37f1a1e60c239c298ba0bcb7c7250b6e045de6c))
* choose theme colors only in the app and recolor Encore palettes ([4909197](https://github.com/spicetify/morphe-patches/commit/4909197025bb45ede4bf4cec50cda18234bab9e2))
* connect Jellyfin sessions to server indexing and streaming ([7a96b1b](https://github.com/spicetify/morphe-patches/commit/7a96b1b8d62f12fb8e76911b92feb4c6cb973fde))
* follow the in-app theme in Spicetify settings ([520e457](https://github.com/spicetify/morphe-patches/commit/520e45775cce94b60402ac39f677360efde94eb1))
* group Spicetify settings into Spotify-styled pages ([8439bab](https://github.com/spicetify/morphe-patches/commit/8439bab8529df09670d0062a2b5d1a07a11e45ce))
* hide embedded ad pages in Now Playing ([cc3d971](https://github.com/spicetify/morphe-patches/commit/cc3d971397f16324a43d525ef282631759c24a84))
* hide Now Playing image ad cards ([b89e227](https://github.com/spicetify/morphe-patches/commit/b89e227fdae31055134fed3022314c7104625d55))
* keep album artwork tags in the server catalog ([cec06e2](https://github.com/spicetify/morphe-patches/commit/cec06e2cc7adf7d93c0d24fa442b86e7171b3b3a))
* lay out server albums and artists like Spotify's pages ([add517e](https://github.com/spicetify/morphe-patches/commit/add517eb74da8bf2cc31677090048e07191e6837))
* pick a theme such as OLED, with custom colors including the header surface ([1b9b34b](https://github.com/spicetify/morphe-patches/commit/1b9b34b827d155350c4b7116d460e4f3c3dc2090))
* read album release years from Jellyfin ([13b66d8](https://github.com/spicetify/morphe-patches/commit/13b66d87518aa11a2f99dd9a0f86d723dc66ce16))
* restart Spotify from settings when a change needs it ([0687d32](https://github.com/spicetify/morphe-patches/commit/0687d3212bc0fb55837cfe7898cda1667568f839))
* retain server album and artist catalog metadata ([52a76e0](https://github.com/spicetify/morphe-patches/commit/52a76e03da4712135666622fe4347cfdb110b31c))
* serve sized server artwork for albums and artists ([13c9715](https://github.com/spicetify/morphe-patches/commit/13c9715a32bab59f29d01dd204c05ab42acb57b4))
* show server album artwork for local tracks in the player ([4c025d0](https://github.com/spicetify/morphe-patches/commit/4c025d0354a73c99064715deac8ed87fd8c83383))
* show server albums and artists in Your Library ([483d066](https://github.com/spicetify/morphe-patches/commit/483d0669156b9514ae132dd242ad517fbf29ec9a))
* show settings dialogs as Spotify-style bottom sheets ([4215d22](https://github.com/spicetify/morphe-patches/commit/4215d223eb5bbe6b5c59ab5dd9357a2639de6c0b))
* show the release year and the playing song on server albums ([37d04f1](https://github.com/spicetify/morphe-patches/commit/37d04f18e4a60fef9e4057da7d6dde72d77defb1))
* simplify Jellyfin sign-in and link Quick Connect approval ([9ff0dc1](https://github.com/spicetify/morphe-patches/commit/9ff0dc1034e549e3e92f098323e6379004bb94ed))

### 🔧 Improvements

* avoid repeated server file scan and status work ([47a04d5](https://github.com/spicetify/morphe-patches/commit/47a04d51277410ff14c4aa881512c0384a9dd5d4))

## [1.0.0-dev.4](https://github.com/spicetify/morphe-patches/compare/v1.0.0-dev.3...v1.0.0-dev.4) (2026-09-18)

### 🐛 Bug Fixes

* clarify disabling server files after cancellation tests ([c98c63f](https://github.com/spicetify/morphe-patches/commit/c98c63f327b0091aa18cdd1accbcde4af901b193))
* discard server listings cancelled during network reads ([9e844a5](https://github.com/spicetify/morphe-patches/commit/9e844a54ae4aa4f36d526dbd79f2c671ecbb6073))
* polish server settings after device verification ([2429a12](https://github.com/spicetify/morphe-patches/commit/2429a12d9977a000d63f6c84f338f114bfb922b5))

### ✨ New Features

* add optional Home pins and WebDAV server files ([37b4f5e](https://github.com/spicetify/morphe-patches/commit/37b4f5e7da99168f06b24ef11371f257e58815cd))

### 🔧 Improvements

* avoid repeated server file scan and status work ([47a04d5](https://github.com/spicetify/morphe-patches/commit/47a04d51277410ff14c4aa881512c0384a9dd5d4))

## [1.0.0-dev.3](https://github.com/spicetify/morphe-patches/compare/v1.0.0-dev.2...v1.0.0-dev.3) (2026-09-18)

### 🐛 Bug Fixes

* include native settings generation in source packaging ([740d7a9](https://github.com/spicetify/morphe-patches/commit/740d7a9a3019c6d892e1fee6b9cc876877cd6836))

### ✨ New Features

* add in-app Spotify patch settings ([7822e51](https://github.com/spicetify/morphe-patches/commit/7822e51a809ee9de226fca12e65433461f122c96))

## [1.0.0-dev.2](https://github.com/spicetify/morphe-patches/compare/v1.0.0-dev.1...v1.0.0-dev.2) (2026-09-18)

### 🐛 Bug Fixes

* clean server-generated Spotify sharing links ([c01bddb](https://github.com/spicetify/morphe-patches/commit/c01bddb1c07c670c94922961ee955c7ecc0d064f))

## 1.0.0-dev.1 (2026-09-17)

### 🐛 Bug Fixes

* fail patching when submitted theme colors are invalid ([56c4cc0](https://github.com/spicetify/morphe-patches/commit/56c4cc00cedce0d09405cd0b5bf28fe90b885880))

### ✨ New Features

* add Spotify sharing cleanup and theme colors ([7213920](https://github.com/spicetify/morphe-patches/commit/7213920d3b4986364e006da08f4944f8a4aa48d7))
