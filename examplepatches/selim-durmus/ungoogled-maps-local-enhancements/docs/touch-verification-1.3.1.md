# Marker gesture fix - Tutto 1.3.1

The old clickable overlay could split pointers between the map and a marker. Its drag handoff also re-entered decor dispatch in the middle of a gesture, losing events. A regression harness using Android's real window/view dispatch reproduced failures with the marker touched first and second.

The overlay now lets native touches pass through. A window callback holds a possible marker tap before view dispatch; movement beyond touch slop or another pointer sends the original DOWN and triggering event to the original callback, then forwards subsequent events normally. Pointer IDs, coordinates, action indices and timestamps remain intact. An ordinary marker tap still performs the marker's click action. Keyboard and accessibility click actions remain on the marker views. Closing the controller releases pending touch state and restores its original callback without overwriting a later replacement.

## Verification

- Android API 36 emulator: **15 checks passed**, including the old-code negative control, both finger orders, pinch beginning with both fingers inside the marker, drag, tap with jitter, successive taps, cancellation before/after handoff, ordinary map taps, overlay hiding, accessibility click and callback cleanup.
- Multi-touch assertions compare the complete native receiver stream with input events, including original pointer IDs, coordinates, actions and times.
- Existing route ownership, marker geometry (10,000 points) and label matching tests passed during the MPP build.
- MPP compiled for both Desktop and Android Manager. Runtime DEX contains the new helper; test activity is excluded. Preserved artifact hashes and source manifest verified.
- No Maps APK was patched or installed for this release. The harness uses a native view as the map receiver; rotation in the actual Maps app with 1.3.1 remains to be confirmed after the user repatches. Morphe hooks and upstream versions are unchanged from the previously verified 1.3.0 release.

Run the focused test with an already running emulator:

```powershell
python tests-android/run.py --sdk "$env:LOCALAPPDATA\Android\Sdk" --java-home 'D:\MapsRecovery\recovery-kit\jdk' --serial emulator-5554
```

The runner rejects physical-device serials. It builds a disposable test APK using a separate test certificate, installs it only on the selected emulator, reads the results, and uninstalls that test package. Evidence remains under the ignored build directory. No Maps files or saved places are accessed.
