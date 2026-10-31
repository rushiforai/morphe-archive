# Third-party notices

The patch code is licensed under GPL-3.0-or-later. Third-party components keep their own licenses, and copies of those licenses are in [licenses/](licenses).

## Bundled in the release

| Component | Used for | License |
| --- | --- | --- |
| [TDLib](https://github.com/tdlib/td) and its Java bindings | Telegram login, search and downloads | [Boost Software License 1.0](licenses/TDLIB-BOOST.txt) |
| [TGX-Android/tdlib](https://github.com/TGX-Android/tdlib) | Prebuilt native TDLib libraries | See TDLib, OpenSSL and libc++ |
| [OpenSSL](https://github.com/openssl/openssl) | TLS for TDLib | [Apache License 2.0](licenses/OPENSSL-APACHE.txt) |
| LLVM libc++ ([Android NDK](https://developer.android.com/ndk)) | C++ runtime | [libc++](licenses/LIBCXX-LICENSE.txt), [LLVM notice](licenses/LLVM-NOTICE.txt), [NDK notice](licenses/ANDROID-NDK-NOTICE.txt) |

The native libraries are shipped unchanged. They were built from these source commits:

- TGX-Android/tdlib: [`7ec241d`](https://github.com/TGX-Android/tdlib/tree/7ec241d026ee3563e615c25a700117c2abbaea19)
- tdlib/td: [`ea3f69c`](https://github.com/tdlib/td/tree/ea3f69ce11aef458bfbb09869b809ede4447486f)
- OpenSSL: [`45e844f`](https://github.com/openssl/openssl/tree/45e844fa2a14ec92d146bd8f5778ac130b6625fb)

## Not bundled

[BitChord](https://github.com/kushagrasinghx/BitChord) is a separate GPL-3.0 app (patched against [`7d956f2`](https://github.com/kushagrasinghx/BitChord/tree/7d956f211b8a46a87184fd3ff87432b51a111dfa)). This repository doesn't distribute it. If you redistribute a patched APK, BitChord's own license obligations apply.

The build and test tools (Morphe, Kotlin, the JDK, R8, the Android SDK, Media3, Robolectric, JUnit and others) are downloaded separately and are covered by their own licenses. The versions are listed in `PROVENANCE.json`, and the [Apache 2.0](licenses/APACHE-2.0.txt) text is included.
