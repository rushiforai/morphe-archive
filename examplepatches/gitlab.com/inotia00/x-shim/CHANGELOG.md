# [1.7.0](https://gitlab.com/inotia00/x-shim/compare/v1.6.5...v1.7.0) (2026-07-03)


### Features

* Temporarily disable all patches in 12.5.0-release.0+ ([2697a5d](https://gitlab.com/inotia00/x-shim/commit/2697a5d91bbf4ce58d51fe2e90b18fbb166eeb64))

## [1.6.5](https://gitlab.com/inotia00/x-shim/compare/v1.6.4...v1.6.5) (2026-07-01)


### Bug Fixes

* Exception thrown in 12.4.1-release.0 ([e3097e5](https://gitlab.com/inotia00/x-shim/commit/e3097e57c3497454a5b4915c718a418038705ecf))

## [1.6.4](https://gitlab.com/inotia00/x-shim/compare/v1.6.3...v1.6.4) (2026-06-30)


### Bug Fixes

* Exceptions thrown in 12.3.1-release.0 and 12.4.0-release.0 ([f576c0e](https://gitlab.com/inotia00/x-shim/commit/f576c0e4332a14c4be0ac5f0fae2824df5379963))

## [1.6.3](https://gitlab.com/inotia00/x-shim/compare/v1.6.2...v1.6.3) (2026-06-24)


### Bug Fixes

* Exception thrown in 12.2.0-release.0 ([677e947](https://gitlab.com/inotia00/x-shim/commit/677e947ab21312231ce4e702f87ba4a2388eab21))

## [1.6.2](https://gitlab.com/inotia00/x-shim/compare/v1.6.1...v1.6.2) (2026-06-19)


### Bug Fixes

* Exception thrown in 12.1.1-release.0 ([b025b78](https://gitlab.com/inotia00/x-shim/commit/b025b78f1d0a01375430844ed77c7d427541372f))

## [1.6.1](https://gitlab.com/inotia00/x-shim/compare/v1.6.0...v1.6.1) (2026-06-19)


### Bug Fixes

* Remove the supported version to minimize confusion (Use the supported version provided by the Piko patch) ([48b5526](https://gitlab.com/inotia00/x-shim/commit/48b552679ed3b853ce034ff71da5a3fc846c5dcc))

# [1.6.0](https://gitlab.com/inotia00/piko-shim/compare/v1.5.0...v1.6.0) (2026-06-18)


### Bug Fixes

* Improve exception message visibility when JSON is not provided ([5864ba2](https://gitlab.com/inotia00/piko-shim/commit/5864ba2cbc74fa7988b2bc1b0d9f1b59c8f0e421))


### Features

* Add support 12.1.0-release.0 ([60fa8a5](https://gitlab.com/inotia00/piko-shim/commit/60fa8a562da8d151dd85a42e7b18a95bc60d70c4))

# [1.5.0](https://gitlab.com/inotia00/piko-shim/compare/v1.4.0...v1.5.0) (2026-06-16)


### Features

* Add support 12.0.0-release.0 ([12c99a1](https://gitlab.com/inotia00/piko-shim/commit/12c99a1090b188a23a85be8bce66373ee9e478e0))

# [1.4.0](https://gitlab.com/inotia00/piko-shim/compare/v1.3.0...v1.4.0) (2026-06-16)


### Bug Fixes

* Some patches are missing in 11.99.0-release.1 ([5a961f7](https://gitlab.com/inotia00/piko-shim/commit/5a961f773af6f94352ffcb2b4897ca0bfb004e77))


### Features

* Add patch option `Advanced Mode` to support a wider range of versions ([211e796](https://gitlab.com/inotia00/piko-shim/commit/211e796254262c32332d8afa11f13da8d7cef6c5))
* Add support 11.99.0-release.1 ([c9426b0](https://gitlab.com/inotia00/piko-shim/commit/c9426b01d5c73856bdb022b73666cc961d85f1dd))

# [1.3.0](https://gitlab.com/inotia00/piko-shim/compare/v1.2.1...v1.3.0) (2026-06-11)


### Features

* Add minimum app version to compatibility ([6a1c177](https://gitlab.com/inotia00/piko-shim/commit/6a1c1776fd235c10d212b353225c2213190f84c8))

## [1.2.1](https://gitlab.com/inotia00/piko-shim/compare/v1.2.0...v1.2.1) (2026-06-10)


### Bug Fixes

* Voice call not working ([5025311](https://gitlab.com/inotia00/piko-shim/commit/50253113bc8da65157b84cb236a7f73ab567d635))

# [1.2.0](https://gitlab.com/inotia00/piko-shim/compare/v1.1.1...v1.2.0) (2026-06-10)


### Bug Fixes

* Video call not working ([fe64491](https://gitlab.com/inotia00/piko-shim/commit/fe64491d675ce0fe9050f47aae2915f781323835))


### Features

* Throws an exception if lower than the minimum supported version ([6fb0ac0](https://gitlab.com/inotia00/piko-shim/commit/6fb0ac0ceb3256d2d3eb6e85bba9e4904f9459e4))

## [1.1.1](https://gitlab.com/inotia00/piko-shim/compare/v1.1.0...v1.1.1) (2026-06-07)


### Bug Fixes

* Some classes are not patched ([6400550](https://gitlab.com/inotia00/piko-shim/commit/64005504398f352072c885417018dd56f8e970cd))

# [1.1.0](https://gitlab.com/inotia00/piko-shim/compare/v1.0.1...v1.1.0) (2026-06-05)


### Bug Fixes

* Patch bundle download_url is invalid ([4a5651e](https://gitlab.com/inotia00/piko-shim/commit/4a5651ed9da4accbe020d39552fd9c6b10fe25b6))


### Features

* Try to download from the generated mock repository if patch option was not provided ([2553463](https://gitlab.com/inotia00/piko-shim/commit/2553463da244953916d030a44fa1d753626b4045))

## [1.0.1](https://gitlab.com/inotia00/piko-shim/compare/v1.0.0...v1.0.1) (2026-06-04)


### Bug Fixes

* Patch failed on 11.97.0-beta.0 ([56e4cac](https://gitlab.com/inotia00/piko-shim/commit/56e4cac9268588f4fdd05948147f733fabde2fde))

# 1.0.0 (2026-05-31)


### Features

* Initial commit ([f8b8a1e](https://gitlab.com/inotia00/piko-shim/commit/f8b8a1e88696b829c12a0d1d2010526a5a2032d9))
