# Verification record

This is an experimental release. The patch is scoped to the official Moodle Android 5.2.1 APK identified in the README.

Published preview: [v1.0.0-dev.1](https://github.com/AlonResearch/moodle-browser-login-patch/releases/tag/v1.0.0-dev.1). The GitHub Actions release succeeded. The downloaded release bundle was applied again to the original APK and passed the same resource/syntax checks; its resulting login resources were byte-for-byte identical to the final local build's output. GitHub artifact provenance verification returned one successful result.

Published bundle SHA-256: `d963e3fbc54a89fd03246b769b90690bbbf131476d998d23ae4162f3a657d6c8`.

The release APK is based on the original 5.2.1 APK plus the published patch bundle. APK SHA-256: `e402992dc3aa71c95dd3e2da9174215185807bcdce36957d0d994e25ae07ae00`. Its project release certificate SHA-256 fingerprint is `7c4c42c99976feb8de58bd35b2612ff5a4204476f1d8392961717f77a0381781`; Android v2 and v3 signature verification passed. The private signing key is not distributed. Android may require removing a Play Store or differently signed Morphe installation before installing this APK, which clears local app data. Future direct APK updates must use the same project signing key.

## Completed

- Built the Android `.mpp` with Java 21 and the pinned public Morphe plugin/patcher sources; both dependency checkouts were clean at their recorded commits.
- Loaded and applied the bundle with Morphe Desktop. The bundle contains Android DEX for Morphe Manager.
- Compared the original and resulting APK entry by entry: only the credentials and reconnect JavaScript resources changed. Existing DEX, native libraries, and all other existing file contents were unchanged.
- Parsed both resulting JavaScript resources independently with Node.js. Confirmed the original site login-mode decisions, password-form conditions, native SSO service/launch URL parameters, and reconnect redirect data are retained.
- Verified the emulator APK's Android v2 signature with the Android SDK. This test signing key is not distributed.
- Verified the release APK's Android v2/v3 signature and compared its ZIP payload with the official original: only the two intended login resources changed; the only added files are APK signing metadata. APK signing removed the original certificate stamp.
- Tried applying the patch to the previous JYU-patched APK and an already patched development APK: both failed on resource checks instead of creating an output APK.
- On Android 16, a development build showed the ordinary form plus the optional browser button for JYU and Moodle's official public demo site. The JYU button opened the external browser at Moodle's native mobile launch endpoint. No JYU account authentication or course action was performed during this audit.
- The public demo account's normal password login reached the Moodle app dashboard. No course data was edited.

## Limits

- The user reported successful JYU login with the earlier JYU-only bundle. That report is not independent verification of every part of the revised generic flow.
- Full browser-to-app authentication and logout/reconnect completion have not yet been independently verified for this release. The Windows host was low on available RAM; the Android 16 emulator stopped twice, and a smaller Android 14 emulator encountered app-not-responding dialogs. The README retains the remove-saved-account workaround.
- The final compiled credentials view separates the form and browser button into independent Angular conditionals with an additional binding slot. Static verification covers that allocation. Further physical-device confirmation is welcome.
- Different Moodle sites, authentication providers, server versions, disabled mobile services, and site token policies can produce different outcomes. No claim of universal authentication success is made.

To repeat the APK content and syntax checks:

```sh
python tools/verify_apk.py original-moodle-5.2.1.apk patched-moodle.apk
```

This command requires Python and Node.js. Keep authentication tokens, browser callback URLs, and private user details out of issue reports.
