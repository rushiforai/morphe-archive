Source-built maintenance release of the unofficial app-local WireGuard proxy
for YouTube and YouTube Music, retaining the Morphe Patches v2.1.0 base.

- Align WireGuard settings with Morphe themes, toolbar and preference rows.
- Separate file/text, unsupported-profile, native-engine and secure-storage
  import failures; display only sanitized native validation reasons.
- Accept `PersistentKeepalive = off` and bare numeric `Address`/`AllowedIPs`
  using host masks (`/32` or `/128`).
- Backport HTTP truncation handling, peer shutdown ordering, profile backup
  recovery and proxy startup/resource cleanup.
- Build both native ABIs and the complete JVM/Android bundle from source.
  No bytecode repair of an earlier release was used.

Both patches are selected by default in JVM and Android DEX metadata.
**WireGuard routing remains off until you import a supported profile and
explicitly enable it.** The encrypted profile format/key alias are retained.

Verification: 603 Java/Kotlin tests passed, 5 existing APK-dependent tests
skipped; 24 new workflow cases are included in that total. All 42 host JNI,
33 Python, Go race/vet and bounded parser-fuzz checks passed. YouTube 21.30.216
and Music 9.30.53 each passed Morphe Desktop `--validate` with WireGuard-only
and full default selections, followed by static APK inspection.

**No new Android target-app acceptance test was run.** The maintainer's earlier
successful v2.1.1 device use remains a separate report. Settings/import,
AndroidKeyStore integration, remote handshake, playback, DNS/leak behavior and
network handoff still require device testing. The reported import failure on
another user's device has not been reproduced there.

This remains experimental and unofficial. Only intercepted app requests are
tunneled; it is not a system VPN or complete kill switch. Requires a supported
64-bit APK, one peer, numeric endpoint/DNS settings and in-route DNS. No root
mounting, 32-bit ABI, hostname endpoint, shell-hook or DNS-search-domain support.

Bundle SHA-256:
`557463a7dd755857d81742f998e34b654010c75dc1de830e713c0b8fc569b25d`.

Assets include the `.mpp`, full corresponding source ZIP and
`RELEASE-SHA256SUMS.txt`. GPL-3.0, Morphe NOTICE and dependency notices are
preserved. Older releases remain available.

See the [maintenance report](https://github.com/seo-rii/morphe-wireguard-patches/blob/main/docs/wireguard-maintenance-2.1.3.md)
and [source build instructions](https://github.com/seo-rii/morphe-wireguard-patches/blob/main/docs/wireguard-source-build.md).
