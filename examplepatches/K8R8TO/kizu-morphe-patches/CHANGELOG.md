# [1.8.5](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.4...v1.8.5) (2026-10-04)

### Fixes

* anchor zero-width emote images to the preceding emote's trailing edge

# [1.8.4](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.3...v1.8.4) (2026-10-03)

### Fixes

* correct 7TV zero-width flag handling
* remove separator spacing before zero-width overlay emotes
* restore FFZ global and channel emote loading
* support FFZ animated and zero-width emotes

# [1.8.1.13](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1.12...v1.8.1.13) (2026-10-03)

### Features

* add a General setting for Following, Live or Clips as the default Home tab

# [1.8.1.12](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1.11...v1.8.1.12) (2026-10-03)

### Fixes

* target Twitch's native Home tab strip for a reliable Following default

# [1.8.1.10](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1.9...v1.8.1.10) (2026-10-03)

### Fixes

* use Morphe's supported MutableMethod.addInstruction API instead of mutating the exposed list

# [1.8.1.9](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1.8...v1.8.1.9) (2026-10-03)

### Fixes

* correct the Opcode enum references in the direct Twitch bytecode injection

# [1.8.1.8](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1.7...v1.8.1.8) (2026-10-03)

### Fixes

* use the actual Morphe/dexlib instruction list API and Opcode enum

# [1.8.1.7](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1.6...v1.8.1.7) (2026-10-03)

### Fixes

* remove all inline smali compilation from the actual Twitch patch source used by the build

# [1.8.1.6](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1.5...v1.8.1.6) (2026-10-03)

### Fixes

* rebuild Twitch 31.3.1 chat binder injection from the direct dexlib implementation

# [1.8.1.5](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1.4...v1.8.1.5) (2026-10-03)

### Fixes

* republish the Twitch 31.3.1 patch bundle as 1.8.1.5

# [1.8.1.4](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1.3...v1.8.1.4) (2026-10-03)

### Fixes

* remove the remaining InlineSmaliCompiler dependency from Twitch chat/emote injection
* preserve chat timestamp message-model binding while using direct dexlib instructions

# [1.8.1.3](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1.2...v1.8.1.3) (2026-10-03)

### Fixes

* fix Twitch 31.3.1 chat binder injection with Morphe Patcher 1.15.0
* align the patch build dependency with Morphe Patcher 1.15.0

\n# [1.8.1.2](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.1...v1.8.1.2) (2026-10-03)

### Features

* default Twitch navigation to Following on app open
* render chat timestamps from the bound Twitch chat message model

# [1.8.1](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.8.0...v1.8.1) (2026-10-03)

### Features

* consolidate 7TV, BTTV and FFZ controls into one `3rd party emotes` setting, enabled by default

# [1.7.6](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.7.5...v1.7.6) (2026-10-03)

### Features

* check for pending Channel Points bonus chests every 3 seconds while auto-claim is enabled
* retry a still-pending bonus at most once per 3-second poll interval
* reset the auto-claim poller when Twitch creates a new channel connection

# [1.7.5](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.7.4...v1.7.5) (2026-10-03)

### Bug Fixes

* open the software keyboard when tapping the third-party emote picker search field
* keep the existing picker filtering behavior while typing

# [1.7.4](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.7.3...v1.7.4) (2026-10-03)

### Bug Fixes

* re-inject the third-party emote picker when Twitch replaces the native composer while switching streams
* distinguish a new native picker from a temporarily hidden existing composer

# [1.7.3](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.7.2...v1.7.3) (2026-10-03)

### Bug Fixes

* fix third-party emote picker re-entry across Twitch composer layout rebuilds
* place the third-party picker button immediately left of Twitch's native emote button

# [1.7.2](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.7.1...v1.7.2) (2026-10-03)


### Bug Fixes

* fix third-party emote picker re-entry lifecycle
* republish the Twitch Enhancement bundle with the corrected Morphe source metadata for the 1.7.2 maintenance release

# [1.7.1](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.7.0...v1.7.1) (2026-10-03)


### Bug Fixes

* republish the Twitch Enhancement bundle with the corrected Morphe source metadata for the 1.7.1 maintenance release

# [1.7.0](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.6.4...v1.7.0) (2026-10-02)


### Bug Fixes

* reattach third-party picker after stream recreation ([e520e0d](https://github.com/K8R8TO/kizu-morphe-patches/commit/e520e0db53061ec412baad9b1f27cef52d828438))
* restore picker lifecycle and add safe channel points watcher ([163863c](https://github.com/K8R8TO/kizu-morphe-patches/commit/163863c26c52df9fcfd81201c162bb264f4b44f8))


### Features

* add safe channel points auto-claim patch ([c439240](https://github.com/K8R8TO/kizu-morphe-patches/commit/c43924090653a5fc21d4a09735ec64ebfa2bab32))

## [1.6.4](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.6.3...v1.6.4) (2026-10-02)


### Bug Fixes

* lazy load picker emotes while scrolling ([a58e7ad](https://github.com/K8R8TO/kizu-morphe-patches/commit/a58e7adcb39f0b4d3f271581a39500f8521d2aab))
* optimize third-party picker layout and loading ([29e4490](https://github.com/K8R8TO/kizu-morphe-patches/commit/29e449002225fb22627bf0f44a8c4aae5377e401))

## [1.6.3](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.6.2...v1.6.3) (2026-10-02)


### Bug Fixes

* make third-party picker compact and re-entry safe ([e09fedd](https://github.com/K8R8TO/kizu-morphe-patches/commit/e09fedd275e874af96f85afdd0daf7226c1e27d1))

## [1.6.2](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.6.1...v1.6.2) (2026-10-02)


### Bug Fixes

* preserve native emote picker hierarchy and restore third-party picker ([3fc7495](https://github.com/K8R8TO/kizu-morphe-patches/commit/3fc7495666415e7326d432d6958231551e7f78eb))
* reattach emote picker on activity resume ([0261ce4](https://github.com/K8R8TO/kizu-morphe-patches/commit/0261ce4867438b356847bb181fb47677799f80ef))
* validate native picker attachment without reparenting it ([fe3261a](https://github.com/K8R8TO/kizu-morphe-patches/commit/fe3261af57b43243fe36c0295ed8efb371f0d95d))

## [1.6.1](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.6.0...v1.6.1) (2026-10-02)


### Bug Fixes

* **twitch:** restore picker across stream activities and native controls ([4c7e79a](https://github.com/K8R8TO/kizu-morphe-patches/commit/4c7e79a56c98c308713bc968f7bda36b3ac1b18e))


### Reverts

* **twitch:** remove broken channel points auto-claim patch ([81b1af5](https://github.com/K8R8TO/kizu-morphe-patches/commit/81b1af556e34f124a228635bc83ae8159ce3d5b4))
* **twitch:** remove broken channel points auto-claim patch ([5f7ff32](https://github.com/K8R8TO/kizu-morphe-patches/commit/5f7ff32f00cc65b72ba2d863efa2dcf9dfb61eff))
* **twitch:** remove broken channel points auto-claim patch ([fa3b4a5](https://github.com/K8R8TO/kizu-morphe-patches/commit/fa3b4a5168d5bf4d87b45e0fac45c4af8735e105))
* **twitch:** remove unstable theme recreation ([cd3ca07](https://github.com/K8R8TO/kizu-morphe-patches/commit/cd3ca07587c0b88865a4febc8547b95697f4cf61))
* **twitch:** restore stable theme detection ([550bb07](https://github.com/K8R8TO/kizu-morphe-patches/commit/550bb074f546d68883f0ef354d0abad5bee6462e))

# [1.6.0](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.5.2...v1.6.0) (2026-10-02)


### Bug Fixes

* **twitch:** compare theme against system configuration ([2237594](https://github.com/K8R8TO/kizu-morphe-patches/commit/2237594d6d3e3b2091c300aa60f50f74aa3aeeb8))
* **twitch:** make injected settings follow active theme mode ([af95031](https://github.com/K8R8TO/kizu-morphe-patches/commit/af950315e3b8d44fe5d27cc797365bced341d906))
* **twitch:** point auto-claim runtime at Kizu extension ([7e81121](https://github.com/K8R8TO/kizu-morphe-patches/commit/7e81121197ca4118cfdd3de9cc502304ece19125))
* **twitch:** restore picker discovery imports ([5fb9f80](https://github.com/K8R8TO/kizu-morphe-patches/commit/5fb9f804922f3bb7f533f9446d5f05d30a536d75))
* **twitch:** stabilize unexpected default theme flips ([cfa059b](https://github.com/K8R8TO/kizu-morphe-patches/commit/cfa059b2f7f655e253b76f55da7d7e5a51faeb05))
* **twitch:** use native picker presentation and robust composer discovery ([27a94e9](https://github.com/K8R8TO/kizu-morphe-patches/commit/27a94e95cde57653a33bb88f1f034552655d4e37))


### Features

* **twitch:** add channel points auto-claim runtime ([304ad7f](https://github.com/K8R8TO/kizu-morphe-patches/commit/304ad7f0ea73e6e1a94ba2c56f4968ef0c8f75e9))
* **twitch:** add channel points fingerprints ([4550ab9](https://github.com/K8R8TO/kizu-morphe-patches/commit/4550ab93763b3a235de6afc94dc250d08396410b))
* **twitch:** implement channel points auto-claim ([cdf00df](https://github.com/K8R8TO/kizu-morphe-patches/commit/cdf00df762a23dc7c8d0d70eac4d46c895055eca))

## [1.5.2](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.5.1...v1.5.2) (2026-10-02)


### Bug Fixes

* correct picker lifecycle compile error ([80e5465](https://github.com/K8R8TO/kizu-morphe-patches/commit/80e5465723a2c729b6e1b625e28c514bd068f20b))
* correct picker lifecycle compile error ([d35aa87](https://github.com/K8R8TO/kizu-morphe-patches/commit/d35aa878ae4ec37361030013008622b59e9bc5da))
* finish popup state and composer slot migration ([02b35db](https://github.com/K8R8TO/kizu-morphe-patches/commit/02b35dbf1f3617cbd148bc18ef104c3530da675c))
* finish popup state and composer slot migration ([7fc30f3](https://github.com/K8R8TO/kizu-morphe-patches/commit/7fc30f30061a00544cad14b1d99695fc61dc4855))
* pass activity into composer slot ([5bfc103](https://github.com/K8R8TO/kizu-morphe-patches/commit/5bfc1031ce453506cb160b73d0d184f24aaf4f58))
* pass activity into composer slot ([a6d9fd9](https://github.com/K8R8TO/kizu-morphe-patches/commit/a6d9fd982f02a76fbb57fb82a045af096f4e917d))
* remove escaped newline in picker lifecycle code ([9dc5a9e](https://github.com/K8R8TO/kizu-morphe-patches/commit/9dc5a9eae87b8d30c00110d33b528736ca55ec2e))
* remove escaped newline in picker lifecycle code ([47120fe](https://github.com/K8R8TO/kizu-morphe-patches/commit/47120feaf7810d1089e559f7c77f9f5cd6c951a3))

## [1.5.1](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.5.0...v1.5.1) (2026-10-02)


### Bug Fixes

* **twitch:** add separate third-party picker button ([8edfc8e](https://github.com/K8R8TO/kizu-morphe-patches/commit/8edfc8e1e624afc7bec0cd2d7530d9aac0012822))
* **twitch:** hook third-party composer button ([a385cc4](https://github.com/K8R8TO/kizu-morphe-patches/commit/a385cc4ea52acc4a7deabd25a00efe55fe9759d7))
* **twitch:** restore picker dimension helper ([02a9956](https://github.com/K8R8TO/kizu-morphe-patches/commit/02a9956580182522bd30e868366b1e3270d1e1be))
* **twitch:** restore picker state and dimensions ([a1ebd5b](https://github.com/K8R8TO/kizu-morphe-patches/commit/a1ebd5b4e35612f21651c167043701d5a1a42d3d))
* **twitch:** sync composer button donor hook ([f1743e4](https://github.com/K8R8TO/kizu-morphe-patches/commit/f1743e4ec5754cf871be46900891ba7f28344f39))
* **twitch:** sync standalone picker implementation ([35bcb49](https://github.com/K8R8TO/kizu-morphe-patches/commit/35bcb4924d0dadca1d64ab825e5651ae2576bbd3))
* **twitch:** sync third-party picker button donor ([9d8beb0](https://github.com/K8R8TO/kizu-morphe-patches/commit/9d8beb04ed5ce58f9e370ca48862ef04902a8b8b))
* **twitch:** trigger picker layout release build ([73b8668](https://github.com/K8R8TO/kizu-morphe-patches/commit/73b8668b92051fc97ee3adfd14c4d004bf5706bd))

# [1.5.0](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.4.0...v1.5.0) (2026-10-02)


### Bug Fixes

* **twitch:** correct native picker header reflection ([5cf63c7](https://github.com/K8R8TO/kizu-morphe-patches/commit/5cf63c7040ed2f30f0ba16ecd67d2b325da800fb))
* **twitch:** preserve native picker dimensions for Kizu models ([771e232](https://github.com/K8R8TO/kizu-morphe-patches/commit/771e2320a71d15b53b573f483173e51c4812b1ec))


### Features

* **twitch:** integrate Kizu emotes into native picker ([17eb3b8](https://github.com/K8R8TO/kizu-morphe-patches/commit/17eb3b8137c22d250b386602872c6740e4de754c))
* **twitch:** integrate Kizu emotes into native picker ([9548f6c](https://github.com/K8R8TO/kizu-morphe-patches/commit/9548f6c4560aa6f0d54b3a933a70a9a7f3125f2a))
* **twitch:** integrate Kizu emotes into native picker ([97b3ea5](https://github.com/K8R8TO/kizu-morphe-patches/commit/97b3ea56cf7cfc65958cf70923a7aee9028b81fe))

# [1.4.0](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.3.0...v1.4.0) (2026-10-02)


### Bug Fixes

* **twitch:** correct proxy selector settings text ([33b89cc](https://github.com/K8R8TO/kizu-morphe-patches/commit/33b89cc38691c99d81a77ebcf30d89bb9ca3e990))
* **twitch:** open standalone picker from resumed activity ([a120604](https://github.com/K8R8TO/kizu-morphe-patches/commit/a1206041dc8487c9f197d7617fe1a31266f8fa51))
* **twitch:** resolve current activity for standalone picker ([be778d9](https://github.com/K8R8TO/kizu-morphe-patches/commit/be778d905e0f6e5031e22807ca62e27540a45b27))
* **twitch:** use Kizu activity tracker for picker ([08a2ebd](https://github.com/K8R8TO/kizu-morphe-patches/commit/08a2ebd8552c1d9c3ed7a8ccc2200696d4bc9b95))


### Features

* **twitch:** add built-in ad proxy selector ([7a87516](https://github.com/K8R8TO/kizu-morphe-patches/commit/7a87516f8327e9cddee746571bda4c2f656e1d5c))

# [1.3.0](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.2.7...v1.3.0) (2026-10-02)


### Features

* **twitch:** add standalone picker setting ([f52fd92](https://github.com/K8R8TO/kizu-morphe-patches/commit/f52fd92ccc92437ee1b556e9649e5f933b219f59))
* **twitch:** add standalone third-party emote picker ([d347afd](https://github.com/K8R8TO/kizu-morphe-patches/commit/d347afdfa322cd173f4e850ecebfdb8e3a2b936f))
* **twitch:** hook standalone third-party picker ([8b8ce1b](https://github.com/K8R8TO/kizu-morphe-patches/commit/8b8ce1bc0412e4d9d0124cca4d5c4b3fbaadf6d6))
* **twitch:** replace native third-party picker ([b6fe0c1](https://github.com/K8R8TO/kizu-morphe-patches/commit/b6fe0c152ca0fdcbab6e5d4a2989a66acdf4d4ca))

## [1.2.7](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.2.6...v1.2.7) (2026-10-02)


### Bug Fixes

* **twitch:** avoid picker URL hook register clobbering ([11ae75b](https://github.com/K8R8TO/kizu-morphe-patches/commit/11ae75b90dd1b1a3fad63b3ce9c610cef681e7cd))
* **twitch:** preserve native picker URL context ([ed75977](https://github.com/K8R8TO/kizu-morphe-patches/commit/ed7597744b1e79be8b8ce3b6b48168df9c8d567d))

## [1.2.6](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.2.5...v1.2.6) (2026-10-02)


### Bug Fixes

* **twitch:** hook actual 31.3.1 EmoteUrlUtil picker method ([4c1c79c](https://github.com/K8R8TO/kizu-morphe-patches/commit/4c1c79c53057c32f5d582edaf288bf34828815f6))

## [1.2.5](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.2.4...v1.2.5) (2026-10-02)


### Bug Fixes

* **twitch:** match actual 31.3.1 emote URL generator ([82ef09b](https://github.com/K8R8TO/kizu-morphe-patches/commit/82ef09b6b01891d30264f2f085187b512010f0e6))

## [1.2.4](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.2.3...v1.2.4) (2026-10-02)


### Bug Fixes

* **twitch:** use 31.3.1 EmoteUrlUtil picker path ([f936fe7](https://github.com/K8R8TO/kizu-morphe-patches/commit/f936fe7c997a6c36ff2244ac659e0105a1ad453b))

## [1.2.3](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.2.2...v1.2.3) (2026-10-02)


### Bug Fixes

* **twitch:** hook animated emote picker URL builder ([a9ca8c2](https://github.com/K8R8TO/kizu-morphe-patches/commit/a9ca8c26268c04f8fc8bba0a9d22a6170d85d37a))
* **twitch:** provide external URLs to animated picker loader ([cdd76c1](https://github.com/K8R8TO/kizu-morphe-patches/commit/cdd76c1ed683fcbf960478cab5581961a4ae1532))

## [1.2.2](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.2.1...v1.2.2) (2026-10-02)


### Bug Fixes

* **twitch:** restore working native picker model types ([2508b2a](https://github.com/K8R8TO/kizu-morphe-patches/commit/2508b2a6fefb098c9705ce4b71eec3add73da31c))

## [1.2.1](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.2.0...v1.2.1) (2026-10-02)


### Bug Fixes

* **twitch:** route picker emotes through external URL resolver ([748389c](https://github.com/K8R8TO/kizu-morphe-patches/commit/748389c1f190684bd7d9fcc657a01a0a2c558d74))

# [1.2.0](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.19...v1.2.0) (2026-10-02)


### Features

* **twitch:** make animated picker emotes use GIF assets ([7c98049](https://github.com/K8R8TO/kizu-morphe-patches/commit/7c9804970adbb0893e079b72a1591826157159be))

## [1.1.19](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.18...v1.1.19) (2026-10-02)


### Bug Fixes

* restore semantic release version calculation ([3378d9c](https://github.com/K8R8TO/kizu-morphe-patches/commit/3378d9c7599b7112ab76946407c6ec39592d7b08))

## [1.1.18](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.17...v1.1.18) (2026-10-02)


### Bug Fixes

* make native emote picker merge more robust ([7cf3c8b](https://github.com/K8R8TO/kizu-morphe-patches/commit/7cf3c8b76e8e12de781e66ca47bf35b20ec3a7c5))

## [1.1.17](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.16...v1.1.17) (2026-10-02)


### Bug Fixes

* keep animated WebP drawable without ConstantState ([6f1bc4c](https://github.com/K8R8TO/kizu-morphe-patches/commit/6f1bc4c34eaefec81dca7a1deb372d7767bbbc72))

## [1.1.17](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.16...v1.1.17) (2026-10-02)

### Bug Fixes

* keep native animated WebP drawables instead of flattening them when ConstantState is unavailable ([6f1bc4c](https://github.com/K8R8TO/kizu-morphe-patches/commit/6f1bc4c34eaefc81dca7a1deb372d7767bbbc72))

## [1.1.16](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.15...v1.1.16) (2026-10-02)


### Bug Fixes

* decode 7TV WebP as drawable ([7013b86](https://github.com/K8R8TO/kizu-morphe-patches/commit/7013b86b03c10f9f201251d8a58737a7be8a5313))

## [1.1.16](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.15...v1.1.16) (2026-10-02)

### Bug Fixes

* decode 7TV WebP assets as drawables so animated WebP is not flattened

## [1.1.15](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.14...v1.1.15) (2026-10-02)


### Bug Fixes

* prefer 7TV WebP assets for animated emotes ([2ed3f30](https://github.com/K8R8TO/kizu-morphe-patches/commit/2ed3f30f5ccce8e2262e4c4531f98ad751301d2e))

## [1.1.15](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.14...v1.1.15) (2026-10-02)

### Bug Fixes

* prefer 7TV WebP assets for animated emotes

## [1.1.14](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.13...v1.1.14) (2026-10-02)


### Bug Fixes

* restore native animated image decoding ([e777f8a](https://github.com/K8R8TO/kizu-morphe-patches/commit/e777f8a29eb6941c47956e056cd1fb439e8aab48))

## [1.1.13](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.12...v1.1.13) (2026-10-02)


### Bug Fixes

* add animated drawable bounds support ([63f5694](https://github.com/K8R8TO/kizu-morphe-patches/commit/63f569482ad7b31dc02f9a354926280cbe8b5ec0))
* force third-party emote animations on ([b5609ad](https://github.com/K8R8TO/kizu-morphe-patches/commit/b5609ad3f72e1fe1ad165e7d60dc5e0f4644ffe3))
* preload emote catalog for picker ([a02cdb2](https://github.com/K8R8TO/kizu-morphe-patches/commit/a02cdb24a887f7ad4e4db6e546c9ea94264afc91))
* restore byte buffer import ([143d867](https://github.com/K8R8TO/kizu-morphe-patches/commit/143d867cdaa92c6a2dad9e524b0c7599f436c66d))
* retain image decoder import ([2838c70](https://github.com/K8R8TO/kizu-morphe-patches/commit/2838c7063ee070b66df91339233c10ae4dfc3b57))
* start custom animated emote drawable ([27372a7](https://github.com/K8R8TO/kizu-morphe-patches/commit/27372a77101177eaf6239a3ed144959d045e7145))
* use looping gif drawable for animated emotes ([62dea55](https://github.com/K8R8TO/kizu-morphe-patches/commit/62dea555fab57327811b25b0050bad0402b4c0f1))
* wait for emote catalog before picker merge ([71bcf99](https://github.com/K8R8TO/kizu-morphe-patches/commit/71bcf99e0dd869041c10233588e996753d4f495a))

## [1.1.12](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.11...v1.1.12) (2026-10-02)


### Bug Fixes

* force third-party emote animations enabled ([10c7c88](https://github.com/K8R8TO/kizu-morphe-patches/commit/10c7c882572bfaf3cd73806b4d233dec4249de79))

## [1.1.11](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.10...v1.1.11) (2026-10-02)


### Bug Fixes

* restore third-party emote picker and animation ([ce5ad89](https://github.com/K8R8TO/kizu-morphe-patches/commit/ce5ad8941a095c98e6c799d9956a65f7f8f398e3))

## [1.1.10](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.9...v1.1.10) (2026-10-01)


### Bug Fixes

* load animated third-party emotes ([83b74b7](https://github.com/K8R8TO/kizu-morphe-patches/commit/83b74b7bbc8e6a5652b4825e51de077444b1bc8e))
* restore native Twitch emote picker ([f9c7aac](https://github.com/K8R8TO/kizu-morphe-patches/commit/f9c7aacc471731f02fa23b71c5cb4b62407b97fb))

## [1.1.9](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.8...v1.1.9) (2026-10-01)


### Bug Fixes

* tolerate Twitch autocomplete class changes ([138c263](https://github.com/K8R8TO/kizu-morphe-patches/commit/138c263c61a5e0b5bfefd8720775a3438f090926))
* write autocomplete patch correctly ([78160f5](https://github.com/K8R8TO/kizu-morphe-patches/commit/78160f55dab9ba890116b5b0948db5ffffb1a371))

## [1.1.8](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.7...v1.1.8) (2026-10-01)


### Bug Fixes

* tolerate Twitch emote URL method renames ([86c0902](https://github.com/K8R8TO/kizu-morphe-patches/commit/86c0902883866f83c8a1b13c4f6c6c3c9278ac03))

## [1.1.7](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.6...v1.1.7) (2026-10-01)


### Bug Fixes

* match Twitch emote URL size arguments ([74ec6d1](https://github.com/K8R8TO/kizu-morphe-patches/commit/74ec6d119b1b16b93d038806ca323ab164f57b85))
* support Twitch emote URL helper variants ([807d985](https://github.com/K8R8TO/kizu-morphe-patches/commit/807d9859e07144565388898ce5bcc4660f6105c2))

## [1.1.6](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.5...v1.1.6) (2026-10-01)


### Bug Fixes

* mark Twitch 31.3.1 emote URL compatibility ([0e4c69c](https://github.com/K8R8TO/kizu-morphe-patches/commit/0e4c69cf91f6a04b58b92a818b881505f35846c8))
* rebuild emote URL hook ([1203339](https://github.com/K8R8TO/kizu-morphe-patches/commit/12033395b9f3283e72b2632f6ad33530bae0250c))
* support Twitch EmoteUrlUtil signature variants ([3f67ee6](https://github.com/K8R8TO/kizu-morphe-patches/commit/3f67ee6599629985e57d43fbf3102a2cc4f8b152))

## [1.1.5](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.4...v1.1.5) (2026-10-01)


### Bug Fixes

* restore Twitch promotion runtime support ([0402d6a](https://github.com/K8R8TO/kizu-morphe-patches/commit/0402d6adcfa2f7644a75b54025766b8ba01b2926))

## [1.1.4](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.3...v1.1.4) (2026-10-01)

## [1.1.3](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.2...v1.1.3) (2026-10-01)


### Bug Fixes

* complete Morphe extension Utils for ads runtime ([d7760a5](https://github.com/K8R8TO/kizu-morphe-patches/commit/d7760a5078ba1a2653ed5950836ce148f3aedbbd))
* include ads runtime under Morphe extension package ([8588018](https://github.com/K8R8TO/kizu-morphe-patches/commit/85880186586ddc98856f9f9a9486ba07212b755b))
* include ads runtime under Morphe extension package ([bead82f](https://github.com/K8R8TO/kizu-morphe-patches/commit/bead82f0d003d1a1a57f057eb5e2293713cbf765))
* include ads runtime under Morphe extension package ([bd9beab](https://github.com/K8R8TO/kizu-morphe-patches/commit/bd9beabe15594e52e5ab22eb7b82d4e7c87d13ae))
* include ads runtime under Morphe extension package ([e31363e](https://github.com/K8R8TO/kizu-morphe-patches/commit/e31363ec21cf4b1a83e12aa661b273394b9c7799))

## [1.1.2](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.1...v1.1.2) (2026-10-01)


### Bug Fixes

* include Kizu settings classes in extension package ([389c985](https://github.com/K8R8TO/kizu-morphe-patches/commit/389c9851f67a6682bfe054a061f430c57d77c931))
* use existing danmaku fonts package ([6b91a67](https://github.com/K8R8TO/kizu-morphe-patches/commit/6b91a678ed1320e280151d47e6fa5816bed42da0))

## [1.1.1](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.1.0...v1.1.1) (2026-10-01)


### Bug Fixes

* hide internal Twitch dependencies ([beef24b](https://github.com/K8R8TO/kizu-morphe-patches/commit/beef24b07fb740d3ee91e198d5d77ceb3ab2f539))

# [1.1.0](https://github.com/K8R8TO/kizu-morphe-patches/compare/v1.0.0...v1.1.0) (2026-10-01)


### Features

* restore Kizu Twitch feature chain ([d099f72](https://github.com/K8R8TO/kizu-morphe-patches/commit/d099f72381c6dce80f762f753db4a31c12b0331f))

# 1.0.0 (2026-10-01)


### Bug Fixes

* clean release configuration ([dc3190e](https://github.com/K8R8TO/kizu-morphe-patches/commit/dc3190e3b35854783215ba3860698cc93610de09))
* clean release workflow ([3cc7d13](https://github.com/K8R8TO/kizu-morphe-patches/commit/3cc7d13319c32c98f3f5303ef6aad421ff4c038f))
* configure project metadata for Kizu Twitch patches ([b130593](https://github.com/K8R8TO/kizu-morphe-patches/commit/b1305937d0cec0e75666180fabb694498a52c135))
* define repository as Twitch-only ([8662f7e](https://github.com/K8R8TO/kizu-morphe-patches/commit/8662f7e1769200d3b02ea4faf3a22afc33033aad))
* disable unrelated Boost patch ([a2622ff](https://github.com/K8R8TO/kizu-morphe-patches/commit/a2622ffcf6e937f5ba1c9eafa04aa87c4f1d8628))
* make Gradle wrapper executable in CI ([864af14](https://github.com/K8R8TO/kizu-morphe-patches/commit/864af14b812e7265f976456af692f992c76acf29))
* release from main only ([9473db2](https://github.com/K8R8TO/kizu-morphe-patches/commit/9473db29c9f7395d932876d94d8f19e0ee51b1d1))
* run Gradle wrapper safely in CI ([84ecd8b](https://github.com/K8R8TO/kizu-morphe-patches/commit/84ecd8b978203d0d585b6a5b85b00551e91910c8))
* simplify semantic release to main ([27bd15f](https://github.com/K8R8TO/kizu-morphe-patches/commit/27bd15f850038ce57357fe8ac33af8b0e4109d7d))


### Features

* add clean Morphe patch project ([62835f0](https://github.com/K8R8TO/kizu-morphe-patches/commit/62835f020ef19d1fc0a6d846c15b71affb2c57fa))
* add clean Morphe patch project ([093ecc8](https://github.com/K8R8TO/kizu-morphe-patches/commit/093ecc82110982982c6b8442d0557ecd906f861c))
* add clean Morphe patch project ([2cfd0fd](https://github.com/K8R8TO/kizu-morphe-patches/commit/2cfd0fde7a10283c976e43d542e0ef67e0182e48))
* add clean Morphe patch project ([f84f6bf](https://github.com/K8R8TO/kizu-morphe-patches/commit/f84f6bf9f86fc5f4a62d11afac33600dfd1e71cb))
* add clean Morphe patch project ([191fadb](https://github.com/K8R8TO/kizu-morphe-patches/commit/191fadbb05110d582a7a484dfd9af8fd5f69115a))
* add clean Morphe patch project ([bf391c4](https://github.com/K8R8TO/kizu-morphe-patches/commit/bf391c418491d32d79d20135945c442deaa2fef1))
* add clean Morphe patch project ([88c5cf4](https://github.com/K8R8TO/kizu-morphe-patches/commit/88c5cf415a2a2f2e2f709785fd80eadeead0824c))
* add clean Morphe patch project ([12b2a31](https://github.com/K8R8TO/kizu-morphe-patches/commit/12b2a31db763c098c61ac34be3132331d18c594f))
* add clean Morphe patch project ([6c25e77](https://github.com/K8R8TO/kizu-morphe-patches/commit/6c25e77f0917bf2abc6e44243007ee60c6ff5d9d))
* add clean Morphe patch project ([97a6ce6](https://github.com/K8R8TO/kizu-morphe-patches/commit/97a6ce62484de5eda82bf49029f3950721b24b91))
* add clean Morphe patch project ([68643e9](https://github.com/K8R8TO/kizu-morphe-patches/commit/68643e977bac1b1dd2fa16a02474620f89124ab6))
