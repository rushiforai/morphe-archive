# One alert language for Waze and Flitsmeister (2026-11-11)

Owner request: alerts should sound the same whichever provider reports them, in Maps and Vela, using
Flitsmeister's wording and sounds, in the receiving app's language (English, Dutch, German, French,
Spanish, Italian, Portuguese; else English). Average-speed controls must count as one zone, and police
controls should look the same from both providers. Contract text: the 11 November 2026 revision in
`docs/contracts/navigation-indicators-v1.md`.

## Source material

Flitsmeister 15.1.1 (APKM `nl.flitsmeister_15.1.1-1293`), static only. The extracted text and sound
catalogue is kept with the evidence, not in the repository
(`~/.local/state/nl-morphe-patches/evidence/fm-alert-catalog-15.1.1-20261111/`).

- Spoken wording is mostly `tts_incident` = "Caution, %s" / "Let op, %s" with Flitsmeister's alert name;
  some types are full sentences (traffic camera, wrong-way driver, level crossing). Flitsmeister speaks
  no distance except for lane closures.
- Flitsmeister ships alert text in en, nl, de, fr and es only. Italian and Portuguese are translated in
  `UniformAlerts` in the same style.
- Sounds come from Flitsmeister's sound selector (`vli` in 15.1.1, `fci` in 15.0): `flitser.m4a` for
  cameras and traps, `trajectcontrole_start.m4a` on entering an average-speed control, `subtle_beep.mp3`
  for police controls, `spookrijder.m4a`, `hulpvoertuigen.m4a`, `veiligheid_notificatie_1/2.m4a`,
  `vertraging_notificatie.m4a`, `informatie_notificatie.m4a`, `snelheid_verlagen.m4a`. Receivers read
  them at runtime from the installed Flitsmeister app; nothing is bundled. Without Flitsmeister installed,
  the spoken text plays without that sound.

## Average-speed controls

- Flitsmeister: one control is one report with consecutive segments. The producer identified the zone as
  `reportId:segmentIndex` and measured only the current segment, so the average, progress and remaining
  distance restarted per segment. It now joins the segment paths and uses the report id.
- Waze: one control arrives as consecutive road segments (`SegmentInsightInfo`), 12 of them on the A2
  Holendrecht–Maarssen control. Both the shared telemetry tracker (`NavigationState`) and the warning
  producer (`NativeWarnings.chainZoneSegments`) now continue a control across a direct hand-over or a
  segment entered within 10 s of the previous one ending.

## Acceptance (emulator, GPS only, Maps on the car, Maps set to Dutch, phone in English)

Evidence: `~/.local/state/nl-morphe-patches/evidence/uniform-alerts-acc14-20261111/` and
`uniform-alerts-acc15-20261111/`.

- First build: the Waze zone stayed one warning over two segment boundaries, then split once at a third;
  the average kept counting. A re-drive kept one warning for the whole zone. The warning chain now also
  accepts a direct hand-over within 2 s.
- First build spoke English although Maps was set to Dutch: Google Maps does not move
  `Locale.getDefault()` to its per-app language. The language now comes from the app's resources.
- First build announced each of three Waze lane-closure reports; a same-type cool-down (30 s) now limits
  our own announcements. In the final run Waze itself announced all three reports; those native decisions
  are kept.
- Second build (session acc15), Waze leg: one warning for the whole zone (730 updates, one clear at its end); "ahead" and
  "entry" announcements synthesized for the zone Waze does not announce, both spoken to completion with
  the Dutch voice; the lane closure spoken in Dutch; the zone pill showed a live average throughout.
- Flitsmeister (session acc16, Frida attached after opening Flitsmeister once to clear Android's stopped
  state): zone `NL_3288` stayed one session from 15,388 m to 15 m left on two passes, progress 0 → 99 %,
  average about 159.8 km/h throughout. Flitsmeister announcements (average too high, roadworks) and our
  synthesized ones for alerts it showed silently (hazard, lane closure) were all spoken in Dutch and
  completed. Flitsmeister sent no zone warning on the warning channel in this run (zone in telemetry only),
  so no "Trajectcontrole" announcement was made for it; the receivers can only announce what arrives.
- The same session showed Waze's last segment of the control measured to the same end (656 m left, next
  segment 596 m) and a restarted session. Fixed with the same-end rule; receivers also no longer drop an
  active zone without a progress value.
- Final build (session acc17), Waze: one session from 15,332 m to 34 m left across the end segment
  (progress 96 → 99.8 %, average 159.5 km/h). Spoken in Dutch and completed: zone ahead and entry, two
  hazards, a Waze police report Waze did not announce ("Let op, controle"; pill with the speed-trap icon),
  and lane closures: nine reports gave three announcements, one per 30 s.
- Vela on the phone (Waze provider, Vela set to Dutch): zone ahead and entry announcements spoken with the
  Dutch voice and completed; zone pill with live average and bar. Vela's car screen still crashes on the
  emulator and was not used.
- Flitsmeister zone warning (session acc19): the Flitsmeister producer now also puts the average-speed
  report it tracks on the warning channel (`AvgSpeedCheck:<reportId>`, the same identity as Flitsmeister's
  own report warning; distance to the start ahead of it, remaining distance inside). Maps on the car spoke
  "Let op, trajectcontrole" ahead and "Trajectcontrole" at the actual entry, then Flitsmeister's own
  "Je rijdt te hard!", all in Dutch and completed. A first run announced both back to back before entry:
  Flitsmeister marks its own zone announcement "enter" while still approaching; entry now needs a distance
  measured inside the control, an active segment or Waze's in-zone state.
- Full Flitsmeister zone drive with Maps on the car (session acc20, Maps following the phone's English):
  one zone session from 15,388 m to 15 m left, 99 %, average 159.7 km/h; spoken and completed: "Caution,
  average speed check" ahead, "Average speed check" at entry, Flitsmeister's "average speed too high",
  roadworks twice and a lane closure it showed silently. The entry was announced a second time mid-zone
  after Flitsmeister's own report path cleared the shared warning; control stages are now remembered for
  15 minutes across a clear. Re-driven in session acc21: our ahead and entry announcements came once at the
  start; the only later zone announcement was Flitsmeister's own (its announcement index), together with
  its "average speed too high" warning, which stays the provider's decision. A first attempt that session was void: Android
  Auto reopened Vela on the car, which crashed (`Snapshotter`) as the map moved.
- Vela on the car screen (session acc19) opens and shows its pills on the emulator, but crashed as soon as
  the map moved (SIGSEGV in Vela's map `Snapshotter` thread, null pointer, no patch code in the backtrace),
  the known emulator map-snapshot crash. Vela car driving needs a real head unit; Vela's speech and pills
  use the same shared code verified on Vela's phone screen.
- The start of the A2 trace (A9 slip road at knooppunt Holendrecht) shows a speed-limit sign of 31,
  reproducibly. 31 is 50 km/h in mph; its source is not established.
