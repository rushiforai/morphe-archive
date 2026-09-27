# Session behavior update — 26 September 2026

Joining pauses the participant's local player, including delayed local playback
callbacks while participating. Leaving or cancelling restores local controls but
keeps local audio paused. Explicit **Quit Jam and play locally** remains the way
to leave and immediately play the selected song.

Host/join/QR entry no longer requires Wi-Fi to be enabled. The companion chooses
an available transport; BLE has its own connected status. Unsupported native
enqueue forms (including playlist and downloaded targets) are consumed during
participation and show the translatable `morphe_music_jam_unsupported` string:
**Unsupported during Jam**. Supported single online tracks retain Add/Play next.

Commands wait for an outstanding companion binding, join feedback appears
immediately, and host/join/end consume returned session state instead of waiting
for the next poll. Late replies from an earlier session cannot overwrite it.

Use the matching companion session-lifecycle build for prompt code cancellation,
foreground notification cleanup, shorter BLE fallback delay, and session-state
responses. These companion changes are separate from this patch repository.

## Manual acceptance on both devices

1. In Morphe Manager, refresh the **AgentKosticka/Jam-Patches** custom source with
   prereleases enabled after the workflow publishes. Repatch clean ARM64 YTM
   9.15.51 or 9.37.54 APKs on **both devices** with Jam enabled. Restart YTM after
   enabling Jam in Player settings. Re-pair Jam Layer from the Jam row: its data
   was wiped during companion acceptance testing.
2. Play different songs locally on both devices. Start a Jam on the phone and
   join from the tablet. The tablet's local audio must pause, its title/queue must
   follow the phone, and its play/pause/next/previous must affect only the phone.
3. Leave normally. Local title/queue/controls must return; the tablet must stay
   paused. Local Play must now work. Rejoin and use **Quit Jam and play locally**:
   this explicit choice must leave and play the selected track locally.
4. While participating, try album/playlist Add to queue and Play next, playlist
   playback, and a downloaded/offline enqueue. Unsupported forms must show
   **Unsupported during Jam**, without changing either queue or starting local
   audio. A supported single online song must still enqueue on the host. Also
   check native drag/remove and host queue convergence.
5. Turn Wi-Fi off on both devices with Bluetooth on. Disconnect Bluetooth audio
   outputs for this test because the existing BLE audio guard intentionally
   suspends BLE when one is connected. Start and join using a code or QR; the UI
   must allow entry and eventually show **Connected via Bluetooth**, without a
   permanent reconnecting spinner. Restore your radio settings afterward.
6. Enter a valid-looking nonexistent code such as `ABCDEFGH`, cancel while it is
   searching, and immediately start a new Jam. Cancellation must return promptly
   and the old lookup must not reappear or change the new session.
7. End/leave a connected session. Jam Layer's session notification must disappear
   and local controls must return. Immediately start another session: its new
   notification/session must remain active. Repeat the main checks with the
   tablet hosting and phone participating.

Companion transport/lifecycle automation uses a synthetic music bridge and does
not validate the patched YTM UI. The manual checks above remain required.

## Local validation

- 46 bridge checks and 12 timeline checks passed against this checkout.
- Nine patch/decoder tests passed with real APK fixtures on 9.15.51 and 9.37.54,
  including rejection of playlist, downloaded, duplicate and malformed targets.
- Local patch application and Android SDK DEX verification passed on 9.15.51;
  the final 9.37.54 build also constructs the isolated unsigned APK.
- Companion unit and two-device lifecycle/transport results are recorded in
  Jam Layer `SESSION_VALIDATION.md`. The matching companion source is local
  commit `6a8a828`; its debug APK is installed on both test devices.
- Native YTM playback, menu rejection and UI acceptance remain for user testing.
