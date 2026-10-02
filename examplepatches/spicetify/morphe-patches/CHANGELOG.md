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
