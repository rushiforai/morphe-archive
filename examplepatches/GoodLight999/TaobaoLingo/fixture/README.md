# Native DinamicX DEX hook integration fixture

**NOT the Taobao client and not an English-translation success claim.**

This Android app deliberately uses the exact package/version and four concrete
Morphe fingerprint signatures of Taobao 10.66.30 while rendering controlled
Chinese labels through actual Java/Android native TextViews. It allows us to
test the *real compiled Morphe 2.0 patch* on an x86_64 Android emulator,
without redistributing the proprietary ARM64-only Taobao binary.

The expected control APK displays `BUTTER_SET=我的淘宝`,
`BUTTER_ATTR=我的订单`, `FAST_SET=搜索`, and `FAST_ATTR=购物车`.
The patched fixture should render their English equivalents. Non-TEXT
attributes, unknown labels and null input must remain untouched.

This exercises bytecode patch assembly, installation, ART method verification,
dispatch and visible label output. It does **not** exercise Taobao's actual
DinamicX runtime, remote templates, Account/login, native SDKs or signing checks.
The fixture must not be distributed under the name Taobao.
