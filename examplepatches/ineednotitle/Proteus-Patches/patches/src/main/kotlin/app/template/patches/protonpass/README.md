# Proton Pass patches

**Supported packages:** `proton.android.pass` (Play XAPK, `1.41.3`, version code `14103401`) and `proton.android.pass.fdroid` (F-Droid universal APK, `1.41.3`, version code `14103000`)

## Patches

- **Unlock Unlimited Plan** — forces the Plus plan type, unlimited limits and hidden upgrade prompts. Keeps the anti-tamper and install-source fixes from the shared packaging toolkit.
- **Allow screenshots** — removes the `FLAG_SECURE` path so screenshots and screen recording work again.
- **Disable clipboard auto-clear** — forces the clipboard clear delay to `Never`.
- **Disable app lock** — forces app-lock state to disabled, biometric authentication to authenticated, and the last-unlock timestamp far into the future so auto-lock cannot engage.
- **Suppress telemetry** — disables the telemetry manager event entry point, live/deferred listeners and repository event upload methods.

## Notes

- These patches are best-effort and target the exact versions above.
- Suppressing telemetry does not remove Proton's server-side account or billing behavior.
- The patches have been verified to apply to the F-Droid universal APK. The Play XAPK target is declared for 1.41.3 but was not re-applied in this session; no on-device runtime test was performed.
