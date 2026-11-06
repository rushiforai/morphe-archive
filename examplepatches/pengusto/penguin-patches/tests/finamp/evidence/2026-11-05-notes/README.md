# Finamp album and track information: installed-APK candidate

Unedited captures from one disposable Android 15 / API 35 ARM64 emulator use the same synthetic Jellyfin account, downloaded album and eight tracks, Light theme and display. `album-before`/`album-after` and `track-before`/`track-after` are the matching original/candidate pairs. The other captures show the dialogs online and offline. The track menu's information entry follows the primary actions and uses the same information icon as the album action. XML files are the corresponding raw accessibility hierarchies.

- Original official [Finamp 1.0.1 universal APK](https://github.com/finamp-app/finamp/releases/download/1.0.1/Finamp-1.0.1-universal.apk): SHA-256 `0fc61e5cb80d37b10a735851c2217cbc855b3f1a04bde577187658531ffef581`.
- Before: original APK re-signed with the disposable test key; SHA-256 `a43d9464b2bc778b506575ab7a3a84c4368a94f6f51a9dff7902d2b7828a67a8`.
- After: official APK patched and exported by **Morphe Manager 2.2.0 (ART)** using the **full local bundle built with dependency substitution** and the same disposable key; SHA-256 `20804465e8513a121f7ae6cece1c465a439cfe5f616095db1973a185573ba0fc`. The tested bundle SHA-256 is `d71a3ed75fbaadae79bb4481681c4582073161f845e5c74d257ba31078f48e59`. This is not an official CI or released bundle. APK comparison found the sole changed retained entry was ARM64 `libapp.so`; other native ABIs were removed. Snapshot SHA-256 `5fadbc9fa7712e6798bbff08a9b408595203eac1a6299ad1354627e1ef37a962`.
- Backport [source](https://github.com/pengusto/finamp/commit/f57c57bc8f55b22c7926bab81660f23710526075), corresponding to the corrected upstream feature in [PR #1853](https://github.com/finamp-app/finamp/pull/1853). Compiled using Flutter 3.47.2, framework `d3b14c876900e553bc736ca19295fc09e3853e8e`, engine `a804b261645ef8c13eb3d5c44a5c2fb0340c5539` and Dart 3.13.2; the original snapshot header and size matched. The original APK's subsetted Tabler font includes the information glyph.
- Offline: after normal download, both texts remained visible with Finamp offline and the fixture's ADB reverse connection removed. The fixture sends `Overview` in list results only when requested, preventing a false-positive sync test. No live Jellyfin server was used.
- A repeatable same-key update chain (original → partial-bundle Manager export → original → partial-bundle Manager export) preserved the synthetic login and downloaded-file hashes at each step. The final-bundle Manager export then updated that state and retained both descriptions offline. The re-signed original was checked against every non-signature entry in the official APK.
- Manager selection/export also succeeded for all eight features: ART used full bundle `e0310321f7448294bccfe4ba2b6e85e78ac4cec7c7057d5c33a88efe9dfa8d62`, and embedded JVM used the partial bundle `6805badbf0950e2b9e304eab1a505b8b3a7b9d0ed7443f88e860e474585c2e55`. The full ART bundle and the final bundle contain identical entries except for the build timestamp and added PR attribution in `NOTICE.txt`.
- The separate `upstream-*` captures use the actual [Android CI debug artifact](https://github.com/finamp-app/finamp/actions/runs/41974066805) for upstream commit `7f79b5bbf1112ee404ab79bd03bcdb69e0dd3b23`, package `com.unicornsonlsd.finamp.debug`, APK SHA-256 `9dd1357bba569174f39096cb56261e5ee4507e005eda896ef2a8ada737ad78bd` and debug signer `ccbcb1fbe812cf69a3789dbf5246cf766aede1ca6c513c942685d61f98b9f803`. The same fixture passed online and after a fresh download with the connection removed. These are not the original-APK comparison pair.
- All 255 selections were applied by Morphe Desktop 1.18.1 to the full `e031...` bundle. Each output changed only ARM64 `libapp.so` among retained APK entries; non-ARM64 libraries were removed. Independent delta replay and pinned source/header checks passed for all selections. The final `d71a...` bundle was compared entry by entry with that bundle, then tested directly with Morphe Desktop 2.0.0 for the new patch alone, all eight patches, and four invalid inputs. No compatibility with another APK version or architecture is implied.

SHA-256 values (PNG and matching raw XML):

```text
17bd24b0c556814f9a9ca22ff4143ba0c0e398d12939657ce63f9ac0f7e76988  album-after.png
140088b7c88a4fb758a7b0e10ca245858736c7c0b8aeb5f8af3d325882d7ff26  album-before.png
3a6a422939023cca6925f5d82632b0bccb146b5a5f69762b00fe73994ecc9898  album-dialog.png
ba05602023d58db175380055223a130f3bf6f0b9e049dce644314ef58d2d4343  manager-all-art.png
d1a848171f693eb7f663b38b81ab2da0a576297d9d6102ff6f576dad3ed21f7d  manager-all-jvm.png
e2ce2d774a73d01436e72ef03b90ec09a607061f78c2b598e12f62514d2c1ee6  manager-all-selection.png
73504a3a718d85e6a698468a48d565957680a75f4796237c9ffd835b5c22769d  manager-selection.png
4e03e987d5eac2c5ad04c12ac162a89e65812afd85126add22ad2db7246cc682  manager-success.png
4658c9a4884ca015a0fad3cc2cc4cea919fbd270a185af7e88e01f92ef318200  offline-album.png
d287b854dda7a4ecaa635d97fb70493e5e81887cb96eee1af943b76f4cf7ede2  offline-track.png
4d5ce57fc0cc29f3ac04579403d5b9bab7b92b911d35ba2381bd6169ebfce30f  track-after.png
f4bcb6544db91de8afeb32c39acf779c4d2c65f84d6d0a0a67801a57115e9844  track-before.png
23fc7426d25d0deb9b7cd5fccbb8bb626b05bd689bc114c3cf91ff958310b946  track-dialog.png
40635de9e32289acb9c5d54598e9f94382d4c7323af784f6d7413bc728186108  upstream-album.png
6dab9a37c65fb04158dcb4296065e6151c33c546cd9799e83ec6dcc7157bea63  upstream-offline-album.png
1e6e01a6aeb61fbc917b4404a1d925d1245a051fd8798aaff1dea0319db82d54  upstream-offline-track.png
ab5261e7c931e866936846657b9ad8ae32ce4a6a37a96881ed8c0f3c5b832f00  upstream-track.png
1d3e4cad1f3b7816fef76d38c9e8e908fc775fdfd7ce2c4ab810098b519439bb  album-after.xml
5b2ae206b5624c0de6c88fc30fdb6be60c6655d9731b147be16131dc465c38b4  album-before.xml
eac72ed945af6d21eeadf4e8b95531b25434a60345de509e381f80831bf00f77  album-dialog.xml
1c7c4c6f6df480c54608e857f04c3fab8918965d1f9f70c7a3645db4ef086fe0  manager-all-art.xml
1c7c4c6f6df480c54608e857f04c3fab8918965d1f9f70c7a3645db4ef086fe0  manager-all-jvm.xml
3bf8eb23db5ef8bbe7514de92f60d1d58856c0a97a3bbd351e172d60eca5774f  manager-all-selection.xml
99811bd6a2c39a55b4b5febe979f9fa670866b3e7b9d41fe6135c0eb5cae0380  manager-selection.xml
3ce8190bbdfce7189054fd736392dbda9561c28904d2f6aab5f2a8f878c93f9e  manager-success.xml
eac72ed945af6d21eeadf4e8b95531b25434a60345de509e381f80831bf00f77  offline-album.xml
64ade676b39f58893a6c0407cc463b3c5731cf12ae06ffde05b103682f1f7e9c  offline-track.xml
e94424b8dea8619c7c19292ec70f12bf7b5c82c1c9d7e2921b2afb2fcb599dd7  track-after.xml
18a5fef5f141af50e7bbc7c694c9b7729906ba13f06f200ab54326fe3ec7fea7  track-before.xml
64ade676b39f58893a6c0407cc463b3c5731cf12ae06ffde05b103682f1f7e9c  track-dialog.xml
260a76dcc51dca32d25a927366bc433fb205910f54abd565095f6d02ed38eef0  upstream-album.xml
41d852507fa5f588737dbd4df742c59d446522e42d0a2124ebcf3a60e258339c  upstream-offline-album.xml
2ed90367a470902aa6a6f2110e830620a1cfd12134a80f3958aef75940b74fe6  upstream-offline-track.xml
e383a7ca42b2845e4657b5690f5d5de8a95cdd8b07e5781a8f8f17ce904d1a1b  upstream-track.xml

```
