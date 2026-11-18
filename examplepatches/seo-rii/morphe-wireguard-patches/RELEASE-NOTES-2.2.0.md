Update the unofficial app-local WireGuard distribution for YouTube and YouTube
Music to the official Morphe Patches **v2.2.0 stable release**.

- Include upstream v2.2.0 patches, fixes and updated app compatibility metadata.
  Highlights include YouTube player/playlist improvements and the Music glass
  navigation option. See the
  [official release notes](https://github.com/MorpheApp/morphe-patches/releases/tag/v2.2.0)
  for the upstream changes.
- Preserve the existing WireGuard engine, authenticated local proxy, encrypted
  profile format/key alias and profile-import diagnostics. This is a base
  update, without a WireGuard transport redesign or later `dev` changes.
- Retain v2.1.5's internal settings localization fix, all 60 WireGuard strings
  in eight custom locale variants, English fallback and the existing settings
  page/restart behavior. License and copyright notices remain verbatim.

**Known v2.2.0 selection issue:** YouTube 21.30.216 and 21.45.82 fail full-default
Desktop validation in `Feed card layout` (`EngagementPanelControllerFingerprint`).
The exact official v2.2.0 bundle reproduces the same 21.30.216 failure with the
same verified input. WireGuard-focused patching passes. The release retains the
official patch/default metadata; this limitation is not hidden by removing a patch.
Explicitly deselect `Feed card layout` when patching these YouTube versions.
The tested selection details are recorded below.

Both patches are selected by default; **routing stays off until a profile is
imported and explicitly enabled**. Update the source, then patch/install each
app again to receive the update. Use one patch source per app; this bundle
already includes the other patches from its official base.

Source build and regression verification: **1,571 Java/Kotlin tests passed with 5 existing APK-dependent skips; Go race/vet, 80 host JNI checks, 41 Python tests and source-built bundle/DEX/native/resource checks passed**.
APK verification: **8 custom APK patch/--validate/static inspections passed, including minimum/latest recommended and latest experimental targets; 4,320 compiled locale values matched. Full-default YouTube 21.30.216/21.45.82 failed at Feed card layout; the official bundle reproduces the same 21.30.216 failure, and an explicitly deselected-Feed-card 21.30.216 selection passed**.
Runtime verification: **No new Android target-app or network execution; settings Activity/base hook and dependency locale lookup sources are unchanged from the historical API35/KVM 124-comparison UI cohort**.

The new upstream compatibility metadata includes experimental YouTube 21.45.82
and Music 9.45.51. Declared compatibility and actual test results are recorded
separately in the [base update report](https://github.com/seo-rii/morphe-wireguard-patches/blob/main/docs/wireguard-upstream-2.2.0.md).
Historical v2.1.5 standalone settings Activity tests used backend stubs and are
not v2.2.0 target-app acceptance tests. Actual profile import/AndroidKeyStore,
remote handshake, playback, DNS/leak behavior, network transitions and
concurrent app/process use require device testing.

Only intercepted requests are tunneled; this is not a system VPN or complete
kill switch. Requires a supported 64-bit APK, one peer, numeric endpoint/DNS
settings and in-route DNS. Root mounting, 32-bit ABIs, hostname endpoints,
shell hooks and DNS search domains remain unsupported. Local proxy readiness
does not prove a remote handshake. This update does not claim to resolve the
previously reported profile-import or system WireGuard coexistence failures
on the reporting users' devices. The bundle is unsigned.

Bundle SHA-256: `d10f3f8b2cc114a6d11e1e80d02b0fc435199839b7051b6a1768a481c3095bd3`.
Corresponding source commit: `d03b7439f517eeed13d12edc1f922ee0e640cd13`.
Official base: `44031c561ea048c8f196877f30a49c13bfd6afb6` (v2.2.0).

The `.mpp`, complete corresponding source ZIP and SHA-256 checksums are
attached. GPL-3.0, Morphe NOTICE and dependency notices are preserved; previous
releases remain available. The separate upstream contribution/personal draft
PR is unchanged by this custom release. See the
[base update report](https://github.com/seo-rii/morphe-wireguard-patches/blob/main/docs/wireguard-upstream-2.2.0.md)
and [source build instructions](https://github.com/seo-rii/morphe-wireguard-patches/blob/main/docs/wireguard-source-build.md).
