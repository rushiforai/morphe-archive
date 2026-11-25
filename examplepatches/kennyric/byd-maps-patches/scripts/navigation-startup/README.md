# Navigation startup emulator checks

Use only a disposable emulator. All runtime scripts require an explicit `emulator-NNNN` serial and reject physical-device serials. Install the four rebuilt apps and complete receiver setup before running the matrix.

- `build.py` builds a separate-UID control API probe, using the supplied local test key.
- `verify_runtime.py` checks all four receiver/provider cold-start pairs, native readiness, managed muting and absence of provider Activities.
- `verify_recovery.py` kills the provider during a screen-off navigation session and checks automatic native readiness/muting recovery.
- `verify_negative.py` checks revoked location access, permission restoration and the Waze sharing toggle.
- `build_audio_probe.py` and `run_audio_probe.py` instrument disposable test-signed provider copies to check native forced-sound completion, player muting/restoration and unchanged device stream volume. These scripts uninstall/reinstall only the chosen provider on the disposable emulator. Restore normally signed outputs afterward.

Pass `--help` for exact arguments. Root is used only in the disposable emulator for saved-source fixture setup and process-death/permission tests. The production integration uses ordinary app UIDs, Binder caller checks and a provider-owned foreground-service PendingIntent; it does not require root or Shizuku.

`docs/navigation-startup-validation.json` records the tested originals and acceptance boundaries. Live-road behavior, physical audio/head units, OEM battery policies and older Android versions require separate device acceptance. A cold car-only session was additionally exercised through the Gearslip preview with no Vela phone Activity and no passive probe until the provider foreground service already existed.
