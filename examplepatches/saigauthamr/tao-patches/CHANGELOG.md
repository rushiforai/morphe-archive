## 1.0.0 (2026-11-20)

### ✨ New Features

* add debug logging patch for network requests ([c78126c](https://github.com/saigauthamr/tao-patches/commit/c78126cfa5863c0a8902e8558cc2f26ef0001b3a))
* add favorites letter filter patch ([7e04cff](https://github.com/saigauthamr/tao-patches/commit/7e04cff745013c9ba1240cb732b206ab32cb7ea1))
* add network timeout patch and HTTP/2 frame logging ([f6b10d7](https://github.com/saigauthamr/tao-patches/commit/f6b10d757099a41ea93bf88416b71ad726717f07))
* add test build branding patch ([92645cd](https://github.com/saigauthamr/tao-patches/commit/92645cd2bfc8daf787788a00efb171cedf056517))
* cache API images on disk and share request hooks between patches ([5d003cc](https://github.com/saigauthamr/tao-patches/commit/5d003cc195b343f2bedfc75434dfbba74325cb3c))
* disable Firebase telemetry and remove ad tracking permissions ([40f66d1](https://github.com/saigauthamr/tao-patches/commit/40f66d167d2bd3f6ea2c8f876d73d37986b2ef26))
* merge identical in-flight API requests ([20d1b7c](https://github.com/saigauthamr/tao-patches/commit/20d1b7cb4a05a4a25ef664bf8e91acb007906e98))
* throttle repeated sync pulls ([be410fa](https://github.com/saigauthamr/tao-patches/commit/be410fae852dceae46783e16d536c2e294c27b02))

### 🐛 Bug Fixes

* merge requests with filter packets and never duplicate a slow leader ([3ee1139](https://github.com/saigauthamr/tao-patches/commit/3ee113971a7a25c996350d72a74152ee3502daf9))
* run favorites letter filter on every branch into the prefix read ([5165cf5](https://github.com/saigauthamr/tao-patches/commit/5165cf53011e36f06e276076e7a3d0a4aaa54b79))
