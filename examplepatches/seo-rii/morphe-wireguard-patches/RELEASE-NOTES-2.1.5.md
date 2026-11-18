Settings localization fix for the unofficial app-local WireGuard proxy in
YouTube and YouTube Music, retaining the Morphe Patches v2.1.0 base.

- Fix internal titles, preference rows, status text, dialogs and toasts reading
  from the global string context/cache. They now resolve resources through the
  WireGuard settings Activity, consistent with its localized entry menu.
- Retain the eight custom locale variants and all 60 strings, English fallback,
  Morphe language/restart behavior and 19 fixed native validation codes.
- Preserve transport behavior, encrypted profile format/key alias, patch default
  selection and the existing maintenance fixes. Legal notices remain verbatim.

Both patches are selected by default; **routing stays off until a profile is
imported and explicitly enabled**. Update the source, then patch/install the app
again to receive the fix.

Source and regression verification: **64 affected Java tests per source tree plus source bundle/DEX/JNI/resource/native checks passed**.
Final APK verification: **YouTube 21.30.216 and Music 9.30.53 passed four focused/default Desktop --validate cases; all 2,160 compiled resource values matched**.
Standalone Android Activity runtime verification:
**four pre-fix failures reproduced; four fixed scenarios passed all 124 comparisons on API35/x86_64 KVM, using real Activity/widgets and explicit backend stubs**.

The v2.1.4 compiled-resource checks did not test the context used to display
internal strings. Standalone Android harness results use production settings
Activity/base-hook code with backend collaborators stubbed; they are separate
from acceptance tests in patched YouTube/Music. **No new target-app/device
acceptance test was run.** Actual target-app layout, language switching,
AndroidKeyStore integration, handshake, playback, DNS/leak behavior, system VPN
coexistence and network transitions remain unverified.

Only intercepted requests are tunneled; this is not a system VPN or complete
kill switch. Requires a supported 64-bit APK, one peer, numeric endpoint/DNS
settings and in-route DNS. Root mounting, 32-bit ABIs, hostname endpoints,
shell hooks and DNS search domains remain unsupported. The bundle is unsigned.

Bundle SHA-256: `ec0dc5bce25f795fbcae9c4abfd9a8dc2798e800355f88eb04f308f986998627`.
Corresponding source commit: `ac1a922bd896160c896764d7535698295fed487a`.

The `.mpp`, complete corresponding source ZIP and SHA-256 checksums are attached.
GPL-3.0, Morphe NOTICE and dependency notices are preserved; previous releases
remain available. See the [localization fix report](https://github.com/seo-rii/morphe-wireguard-patches/blob/main/docs/wireguard-i18n-2.1.5.md)
and [source build instructions](https://github.com/seo-rii/morphe-wireguard-patches/blob/main/docs/wireguard-source-build.md).
