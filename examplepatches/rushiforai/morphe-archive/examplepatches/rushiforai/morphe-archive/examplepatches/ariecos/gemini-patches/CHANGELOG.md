## [1.1.16](https://github.com/ariecos/gemini-patches/compare/v1.1.15...v1.1.16) (2026-05-16)


### Bug Fixes

* inject MicroG-RE spoof metadata with correct Gemini cert ([c85d2cd](https://github.com/ariecos/gemini-patches/commit/c85d2cdc59b8e879148a9016c273aefa41dc11fb))

## [1.1.15](https://github.com/ariecos/gemini-patches/compare/v1.1.14...v1.1.15) (2026-04-28)


### Bug Fixes

* replace unused ambient music strings with patched package names ([793dee0](https://github.com/ariecos/gemini-patches/commit/793dee027305551eef8588fea2ac0c48982d4eab))
* use method.implementationgit add ..instructions ([f7ac4f7](https://github.com/ariecos/gemini-patches/commit/f7ac4f7e82102eb334064b965792f5adc83acc8a))
* use replaceInstruction to swap ambient music strings ([a254bff](https://github.com/ariecos/gemini-patches/commit/a254bff9e680f5875f2aef652d3097df2ce408ad))

## [1.1.14](https://github.com/ariecos/gemini-patches/compare/v1.1.13...v1.1.14) (2026-04-26)


### Bug Fixes

* inject at cond_0 where v1 is verified Object reference ([7d311f1](https://github.com/ariecos/gemini-patches/commit/7d311f1d1193480d2828a607af602dfb0870e10e))

## [1.1.13](https://github.com/ariecos/gemini-patches/compare/v1.1.12...v1.1.13) (2026-04-26)


### Bug Fixes

* use last instruction index directly ([4bcd288](https://github.com/ariecos/gemini-patches/commit/4bcd288d1df2fa3277bae2e5675be7f336c0d3cf))

## [1.1.12](https://github.com/ariecos/gemini-patches/compare/v1.1.11...v1.1.12) (2026-04-26)


### Bug Fixes

* inject before last return using already-typed registers v0 and v1 ([794cd59](https://github.com/ariecos/gemini-patches/commit/794cd59ab5812b22b625ebd7801a77e4ac587d35))
* inject before last return using already-typed registers v0 and v1 ([35c2465](https://github.com/ariecos/gemini-patches/commit/35c24653fd53c6c28a3983dfd97ea89b3f52bbda))

## [1.1.11](https://github.com/ariecos/gemini-patches/compare/v1.1.10...v1.1.11) (2026-04-26)


### Bug Fixes

* inject after first instruction to satisfy verifier ([e6a5c35](https://github.com/ariecos/gemini-patches/commit/e6a5c355cad8b60d819c5bbaa04c38e52b16b66a))

## [1.1.10](https://github.com/ariecos/gemini-patches/compare/v1.1.9...v1.1.10) (2026-04-26)


### Bug Fixes

* remove check-cast, accept Object in extension helper ([2dee8d5](https://github.com/ariecos/gemini-patches/commit/2dee8d5c001899f3f481ec1dce5d81224d15dfd3))

## [1.1.9](https://github.com/ariecos/gemini-patches/compare/v1.1.8...v1.1.9) (2026-04-26)


### Bug Fixes

* properly increase register count via MutableMethodImplementation ([3764bec](https://github.com/ariecos/gemini-patches/commit/3764bec36445e9b554960edf87331bec798bec7c))
* properly increase register count via MutableMethodImplementation ([ff04f96](https://github.com/ariecos/gemini-patches/commit/ff04f96d0ec7c06b214f79ec66e3b0bb4ddf5461))
* use extension helper to avoid register conflicts ([0f7abf3](https://github.com/ariecos/gemini-patches/commit/0f7abf3008cd9e7f929561a89307c8bac7995e8b))

## [1.1.8](https://github.com/ariecos/gemini-patches/compare/v1.1.7...v1.1.8) (2026-04-26)


### Bug Fixes

* increase register count before injection ([73b08ed](https://github.com/ariecos/gemini-patches/commit/73b08edc55e964d59f991ea7ed5f1d561abc2cb5))
* use existing registers instead of adding new ones ([a17d8d8](https://github.com/ariecos/gemini-patches/commit/a17d8d824991c13efa17bf15cf95682394d28b21))

## [1.1.7](https://github.com/ariecos/gemini-patches/compare/v1.1.6...v1.1.7) (2026-04-26)


### Bug Fixes

* use parameter registers to avoid VerifyError ([9f48524](https://github.com/ariecos/gemini-patches/commit/9f485247c55deae22b67925bbb2dfb56c19be4d1))

## [1.1.6](https://github.com/ariecos/gemini-patches/compare/v1.1.5...v1.1.6) (2026-04-26)


### Bug Fixes

* correct Morphe default package name scheme ([917bbba](https://github.com/ariecos/gemini-patches/commit/917bbba21603d15a8d033edc2ad20bb0aad705de))

## [1.1.5](https://github.com/ariecos/gemini-patches/compare/v1.1.4...v1.1.5) (2026-04-26)


### Bug Fixes

* use addInstructions instead of addInstructionsWithLabels ([23e87a5](https://github.com/ariecos/gemini-patches/commit/23e87a5b3d28fca8496e92712b1aecc4fefd7ebf))

## [1.1.4](https://github.com/ariecos/gemini-patches/compare/v1.1.3...v1.1.4) (2026-04-26)


### Bug Fixes

* remove template example patches ([f89b383](https://github.com/ariecos/gemini-patches/commit/f89b383c8c66d44617fc4148beff403c341a0ae7))

## [1.1.3](https://github.com/ariecos/gemini-patches/compare/v1.1.2...v1.1.3) (2026-04-26)


### Bug Fixes

* inject at method start instead of before return ([f093106](https://github.com/ariecos/gemini-patches/commit/f09310665f7bffdcfa85431d35bf515949af39ae))

## [1.1.2](https://github.com/ariecos/gemini-patches/compare/v1.1.1...v1.1.2) (2026-04-26)


### Bug Fixes

* case-insensitive return opcode matching ([37108c7](https://github.com/ariecos/gemini-patches/commit/37108c76916b086f80ce7d74ab9e246889a91742))

## [1.1.1](https://github.com/ariecos/gemini-patches/compare/v1.1.0...v1.1.1) (2026-04-26)


### Bug Fixes

* correct return opcode detection ([4fa70a6](https://github.com/ariecos/gemini-patches/commit/4fa70a64b3b416fa16e0a9e25cad36dbbe69229e))
* correct return opcode detection ([271e549](https://github.com/ariecos/gemini-patches/commit/271e549ff2bbc2291df51fa0646919777e14f9af))
* correct return opcode detection ([a6079ab](https://github.com/ariecos/gemini-patches/commit/a6079aba805d75d3d3c68b73b5b80b69c43720a5))
* correct return opcode detection ([0416a16](https://github.com/ariecos/gemini-patches/commit/0416a160bba3a96ce9555c3a8d9995e3f01d8cf2))
* correct return opcode detection ([b3c3a70](https://github.com/ariecos/gemini-patches/commit/b3c3a704b81fd2108b2a9b57efc3ae20410c92da))
* restore correct patch files after merge conflict ([02bd161](https://github.com/ariecos/gemini-patches/commit/02bd16129fdfa1d627b8ed8ad04fc22aab81a5ac))

# [1.1.0](https://github.com/ariecos/gemini-patches/compare/v1.0.0...v1.1.0) (2026-04-24)


### Features

* add Gemini patches ([da4a772](https://github.com/ariecos/gemini-patches/commit/da4a77275cce0966e16d6a498e155c10dc50413a))
* update patches list ([760e7f3](https://github.com/ariecos/gemini-patches/commit/760e7f392a4096e80df33942b30a4e392af34ae1))

# 1.0.0 (2026-04-24)


### Features

* add Gemini patched app routing and GmsCore patches ([99ba07c](https://github.com/ariecos/gemini-patches/commit/99ba07c42c31a012e0a4b5b5d31ec5d5b1a0a7cc))
