# Released Penguin 1.2.0 acceptance

Release: https://github.com/pengusto/penguin-patches/releases/tag/v1.2.0
Normal release/attestation run: https://github.com/pengusto/penguin-patches/actions/runs/40777896610

Downloaded published MPP SHA-256: `8f97562ad506c93c41c5ae8f622529787a59a31eef0cc33ae04496a617a476dc`.
All 31 native payloads and their manifest are byte-identical to the accepted
local candidate. Complete released-bundle replay and all **31 actual Desktop
1.19.1/Patcher 2.0.1 selections** pass; four unsupported inputs fail closed.

The normal existing **remote Penguin source** was updated through Manager's UI.
Its cached MPP hash equals the downloaded release (see `remote-source.json`).
The local candidate source was removed; the stable remote source is enabled.
The raw manifest initially remained at 1.1.0 with `Cache-Control: max-age=300`;
the same normal Update action succeeded after expiry, without clearing caches
or app data. See the recorded cache timestamps in `remote-source.json`.
The two new rows are selectable independently. Two **additional** actual
Manager 2.2.0 JVM UI apply/export runs, masks **8** and **16**, pass against the
same original APK. Both APKs independently pass native/retained-entry/ABI,
disposable-signature and uncompressed/16-KiB alignment checks. The subset
report intentionally has `full_manager_suite=false`; the six-case JVM/ART
candidate suite is documented separately.

[Matched installed-APK screenshots, six-case Manager suite, selected-only fault,
recovery, installation/data retention and source regression evidence](../2026-10-28-next/README.md).
The published native payloads are identical to those installed for those images.
All images are raw, unedited ADB captures; hashes/XML are supplied.

Scope: pinned official Finamp 1.0.1 universal input, ARM64-only output,
Android 15/API35 ARM64 emulator. Physical/OEM devices, live Jellyfin servers and
RAM benchmarks are outside the evidence. No APK, keystore or credentials are
published here.

The display density/demo setting was restored, the original cache was verified,
and the owned fixture/emulator were stopped (`cleanup.json`).
