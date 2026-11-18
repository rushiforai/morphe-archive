Localization maintenance release of the unofficial app-local WireGuard proxy
for YouTube and YouTube Music, retaining the Morphe Patches v2.1.0 base.

- Add custom translations for all 60 settings/error strings in Korean,
  Japanese, simplified/traditional Chinese, Spanish, French, German and
  Brazilian Portuguese. Missing translations fall back to English.
- Route 19 native validation codes through the standard Android resource and
  Morphe language lookup. Unknown or malformed native payloads show a generic
  localized failure without revealing profile values or backend text.
- Keep transport behavior, encrypted profile format/key alias and the existing
  maintenance fixes. Legal notices are retained verbatim.

These are custom-distribution translations requested by the maintainer, not an
official Crowdin export. The upstream contribution keeps Crowdin-managed
translations. Language changes follow Morphe's existing restart behavior.

Both patches are selected by default; **routing stays off until a profile is
imported and explicitly enabled**. Update the source, then patch/install the app
again to receive the new resources.

Final release verification: **609 Java/Kotlin tests passed, 5 existing APK-dependent skips; 80 host JNI checks and 41 Python tests passed**.
Final APK and eight-locale resource checks: **YouTube 21.30.216 and Music 9.30.53 passed focused and complete-default Desktop --validate/inspection; all 2,160 compiled English/eight-locale values matched**.

**No new Android target-app/device acceptance test was run.** Actual text
layout/language selection, AndroidKeyStore integration, server handshake,
playback, DNS/leak behavior and network transitions remain unverified. The
maintainer's successful v2.1.1 device use is a separate historical report.

Only intercepted requests are tunneled; this is not a system VPN or complete
kill switch. Requires a supported 64-bit APK, one peer, numeric endpoint/DNS
settings and in-route DNS. Root mounting, 32-bit ABIs, hostname endpoints,
shell hooks and DNS search domains remain unsupported. The bundle is unsigned.

Bundle SHA-256: `8010b938869104ab8a80f1ca381f624d43d9bee64e434c84287b4648b52816ae`.
Final corresponding source commit: `8a87d95bf51a90b2206c5fa1b414316b06c539cb`.

The `.mpp`, complete corresponding source ZIP and SHA-256 checksums are attached.
GPL-3.0, Morphe NOTICE and dependency notices are preserved; older releases remain
available. See the [localization report](https://github.com/seo-rii/morphe-wireguard-patches/blob/main/docs/wireguard-i18n-2.1.4.md)
and [source build instructions](https://github.com/seo-rii/morphe-wireguard-patches/blob/main/docs/wireguard-source-build.md).
