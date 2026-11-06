# OpenBubbles build 20002293

The current OpenBubbles patch selections require native ARM64 OpenBubbles 2.0.0,
version code **20002293**. The runtime guard rejects the older 20002289 build even
when version compatibility is forced. Other apps' patch targets are unchanged.

Build 2293 uses ShellApplication, which inherits LocalObApplication startup, and
moves the Android account settings wrapper and shared settings rows into
SettingsScreen_androidKt and SettingRowsKt. The patch preserves ShellApplication,
checks its startup inheritance, and uses the new settings classes. Its embedded
payload was rebuilt against this build's compile-only host fixture.

## Validation (2026-11-04)

- 204 tests passed; one existing Windows symlink test skipped: protocol 45,
  bridge 59, native helpers 71 passed/1 skipped, patch tests 18, Python audit 11.
- Bridge release lint, payload dependency/linkage audit, and source-lock checks passed.
- Both Wear companion bridge and standalone notification control applied separately
  with strict compatibility and fingerprint checks; no failed patch steps.
- Canonical DEX comparison: 45,941 host classes unchanged, only the three intended
  startup/notification/settings hook classes modified, 779 payload classes added,
  no host classes removed. All seven patched DEX files survive APK merging unchanged.
- All nine native ARM64 libraries match build 2293 byte-for-byte. Final APK signature,
  package/version, absence of required split metadata, and 16 KiB ZIP alignment verified.
- Android runtime probe initialized the shell, all three modified host classes and
  patch settings successfully. The emulator app also launched without a recorded crash.
- Previous patched universal APK updated to 2293 with install -r in the emulator;
  installation identity and an app-private test marker were retained.
- The main Galaxy S25 then updated in place. Installed APK SHA-256 matched the
  candidate, and app ID, data directory and first-install time were unchanged.
  App startup remained running without observed fatal or linkage errors.

The phone APK retains the existing phone/watch public certificate SHA-256:
`e5d2b8f7a0df6015f4ace1ab06c600797557fd9fb52e04930786b792c6dd42ae`.
The APK SHA-256 is
`b896d144c179b1a3deeb9aa5cd0e1916ba2f63a93a0e0a19ca8f74676f7acb21`.

No messages, reactions or replies were sent during validation. Real message delivery,
incoming reaction alerts, and paired-watch behavior on this native build still need
live use. An APK-only rollback copy is not a backup of account or message data.
