# Warning follow-ups after the v1.62.0 drives (2026-11-11)

Research only; nothing here is implemented. Inputs: Flitsmeister 15.0-1289 base APK
(SHA-256 `7668b9d93a309520184a01194aa47dde40a05b0e74e96a2237c428ed7a613bf0`, JADX), Vela 0.5.2621
(REA/JADX plus `../vela` source at v0.5.2718, MapLibre 13.6.1), the owned AVD's FM databases and logs
(read-only), and the drive evidence in
`~/.local/state/nl-morphe-patches/evidence/a2-drive-20261111/` (excerpts in `research-20261111/`).

## 1. Voorburg route: why no camera warning reached Maps

Observed:

- FM's bundled and live camera DB both contain camera `2023473`: `RED_LIGHT_50` (DB type 46),
  Prins Bernhardlaan, Voorburg, bearing 37°. The route passed 6 m from it heading 24–58°. It is the only
  camera on the route facing our direction; the other Prins Bernhardlaan cameras face 229°/239°.
- FM's own log (`files/log/log.log`):
  - 05:10:49 `onNewWarning … POSITIVE_TRACE_ON_POLYLINE SPEED_CAM 2023473`, then
    `[SIGNAL] [SPEEDCAM] [START]` at 228 m. This was during the Vela attempt (d5); Vela had crashed.
  - 05:11:12 replay jumped back to the start: `onRemoveWarning`, `[SIGNAL] [STOP]`.
  - 05:13:18 recorded Maps drive (d6): `onNewWarning` again at 228 m, **no `[SIGNAL] START`**.
  - 05:13:39 `onRemoveWarning … NEGATIVE_TRACE` after passing.
- The d6 car contact sheet shows no warning pill in that window.

Cause, from `fc0.J(BaseReport, boolean)`:

```java
if (this.X.containsKey(report)) {               // X: report -> elapsedRealtime of its last signal (fc0.C)
    if (!(report instanceof SpeedCam)) return;  // other report types never re-signal
    if (elapsed < ye7.g(3, af7.MINUTES)) return; // fixed cameras: at most once per 3 minutes
}
```

`X` is cleared only in `fc0.onStop()`. So during one FM service lifetime:

- a fixed camera is re-signalled only after 3 minutes;
- traps, hotspots and incidents are never re-signalled.

The drive came back after 2 min 28 s.

**FM still shows the camera again on its own screen.** The visible warning comes from
`wd6` (DefaultReportEventService `onNewWarning`), which this rule does not gate. Our producer creates
point warnings only from the signal path (`fc0.J`/`fci.l`); our `wd6.B()` binding reads just the
average-speed zone (`hff.b`). So when FM suppresses a repeat, Maps/Vela show nothing.

Proposed changes (owner: "max 1 m"):

1. FM patch: change the `3` in `fc0.J`'s `ye7.g(3, af7.MINUTES)` to `1`. This is a single const before
   `af7.MINUTES`; `lh8` has an unrelated `ye7.g(3, …)`, so anchor on `fc0.J`. Update
   `NativeWarningContracts15` for the changed body hash.
2. Producer: drive the pill from FM's visible warning set (`wd6` new/remove), independent of
   whether FM signals audibly. Speech/sound keep following the signal path, so a suppressed repeat
   shows a pill without a second announcement. Optionally, also re-signal traps after the same window.

Ruled out: settings (`pref_signal_paal` default true, red-light category 2 not in the default-muted
set `{0,1}`), geometry (camera stayed 1–15° off course for the last 470 m, inside FM's cone
`max(10, 25 − d/100) + min(Δ,30)`; camera bearing within 45° of heading), and data (camera present in the
live DB, 48,803 records).

## 2. Alert sounds, not just speech

FM 15 `fci.l(report, start, bypassMute, text, callback)` chooses a recorded sound per warning and plays
it in the same call as the optional speech text:

| Warning | Sound (`assets/audio/`) | Gate |
| --- | --- | --- |
| Fixed camera / trap | `flitser.m4a` (DEFAULT), `flitser_hard.m4a` (LOUD), none (SILENT) | `pref_signal_flitspaal_harder_new` / `pref_signal_flitser_harder_new` |
| Traffic camera | `informatie_notificatie.m4a` | traffic-cam sound pref (off by default) |
| Average-speed zone | `trajectcontrole_start.m4a` / `trajectcontrole_stop.m4a` | zone start/end prefs |
| Traffic jam | `veiligheid_notificatie_2.m4a` / `voltooid.m4a` | jam start/end prefs |
| Police hotspot | `populaire_flitslocatie.m4a` | `pref_enable_hotspot_signal` |
| Roadworks, traffic | `vertraging_notificatie.m4a` / `voltooid.m4a` | roadworks prefs |
| Wrong-way driver | `spookrijder.m4a` | — |
| Obstacle, accident | `veiligheid_notificatie_2.m4a` | incident prefs |
| Control | `subtle_beep.mp3` | — |
| Other incidents, CITS | `veiligheid_notificatie_1.m4a` | incident umbrella |

Speech text is passed only when `pref_enable_custom_spoken_warnings` is on (default **true** in 15.0).
A sound pack (`kdi`) may replace the sound; BLE FM Dot can take over output.

Our receivers have exclusive modes: VOICE speaks the text; TONE plays one synthesized chime
(`Chime.warningPcm`) for every type. FM's chosen sound is not on the wire.

Proposed changes:

1. Producer: capture the effective file name FM passes from `fci.l` to the player (empty when SILENT or
   gated off) and send it as a new optional event field, e.g. `sound`. Extend the contract.
2. Receivers: load that file at runtime from the installed FM package
   (`createPackageContext("nl.flitsmeister", 0).getAssets().open("audio/<file>")`). Nothing is
   redistributed, and FM's own volume/LOUD choice carries over.
   - VOICE: play the sound, then the speech.
   - TONE: play only the sound.
   - Fall back to the current chime when the file is missing.
   Both must stay inside the existing lease/grant and focus handling.

## 3. Warning speaker: car-screen app versus background app

Today (`WarningAudioOwner`), the first receiver to claim holds the lease (`OWNER_LEASE_MS` 6 s,
renewed every 2 s). Another receiver gets `BUSY:<package>` while the owner keeps renewing, and
receivers renew whenever their policy is active, including in the background. There is no notion of
which app is on the car screen. That is why background Ungoogled Maps spoke the S107 trap while Vela
was on the car.

Proposed change:

- Add a `projected` flag to `CLAIM_AUDIO`/`RENEW_AUDIO`.
- A projected claimant may take over a non-projected owner when no grant is pending or playing.
- The existing `OWNER_REVOKED` path notifies the old owner.
- Between two projected or two background receivers, keep first-come.

## 4. Vela car-map crash on the emulator

`SIGSEGV` at fault address 0x30 in `/vendor/lib64/libGLESv2_enc.so`
`GL2Encoder::s_glDrawElements`, on MapLibre's `Snapshotter` thread (two identical dumps, d5).
Vela renders the Android Auto map through `MapSnapshotter` (`CarMapRenderer.requestRender`), one snapshot in
flight at a time.

- Our patch only draws onto the delivered bitmap's canvas.
- It asks for a redraw through Vela's own render request on the main thread (`CarUi.warningChanged`),
  so it adds no concurrent GL work.

The fault is in the emulator's guest GLES encoder. Vela itself has a fallback for fragile GPU drivers
on the phone map (`texture_render` after native crashes), but none for the car snapshotter. Treat it
as emulator-only unless it appears on a phone. If it blocks emulator acceptance, report it upstream
with the dumps.

## Implementation and emulator acceptance (2026-11-11, uncommitted)

Owner decisions:
- The same trap or incident is announced once.
- The same fixed camera may be announced again after at most one minute.
- No timer may hold back a different warning.
- Car-screen priority is included.

Implemented in FM 15.0 only; the 14.17 profile keeps its previous behaviour.

- `fc0.J`: the fixed-camera repeat window is one minute; other report types are unchanged.
- `wd6.z`/`wd6.A` → `NativeWarnings.visible/hidden`: the pill follows FM's own on-screen set (`capture_path=visible_state`).
- `dci.invoke` join → `NativeWarnings.sound`; `fci.l` silent branch → `noSound`. The announcement is held up to 400 ms for FM's asynchronous choice and carries `native_sound`. State refreshes of the same announcement keep it; the first emulator run showed FM's alerted-report snapshot re-describing the warning at the same revision and dropping the field.
- `ProviderSound` decodes the file from the installed FM app at runtime. Maps and Vela play it before speech (Voice) or instead of the chime (Tone), under the same grant and focus.
- `projected` claims: a car-screen receiver takes the lease from a background owner between announcements.

Emulator evidence: `~/.local/state/nl-morphe-patches/evidence/warning-followups-20261111/` (Maps on the car; GPS-only fabrication; Frida on FM, Maps and Vela).

| Check | Result |
| --- | --- |
| Pass 1 | FM signalled at 13:14:48; Maps spoke it. |
| Pass 2 | Shown again 39 s later: pill shown, no announcement. |
| Pass 3 | Signalled at 13:18:52. |
| Pass 4 | Shown 50 s later: held back. |
| Pass 5 | Signalled at 13:20:22, 90 s later. The original FM would have stayed silent until 13:21:52. |
| Speaker priority | Vela on the car took the lease from Maps in the background (revocations at 13:16:37 and 13:17:45). Maps on the car kept it against Vela on the phone. |
| Vela on the car | Crashed in MapLibre's Snapshotter (emulator-only, section 4), so its car speech was not exercised. |
| Session 2 (after the fix) | Maps decoded `flitser.m4a` 75 ms after FM's signal and played it on the car's guidance stream (1.19 s), then spoke (TTS 41.00–43.04) under one grant. |
