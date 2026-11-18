# Maps car speed observation and zone readability

Goal: preserve Maps’ own single speed/limit widget and correct the zone panel’s poor contrast and truncated text found in the real FM A4 drive.

The fresh candidate displayed the existing native combined speedometer at100 km/h. The proposed extra-label fallback was unused and is removed. The initial session’s missing-speed field is a qualified observation; its exact cause is not established. Do not infer an APK is byte-identical to the current release from a sibling checkpoint or source HEAD.

- [x] Preserve original and corrected actual AA frames, APK identities and complete traced GPS drives. No injected alerts, averages or UI.
- [x] Give the complete zone panel an opaque background, select the car context’s theme and wrap warning text. Extend the existing compact-view regression.
- [x] Run the complete canonical local verification; repair only the documented Python path and retain passing stages.
- [x] Complete one bounded AA17 A4 session: native100 visible, real zone average/progress/distance readable, real end warning and clearing, no duplicate speed display. Stop and clean owned runtime.
- [x] Remove the unused label fallback and rerun the affected Android checkpoint. Reuse the captured native-widget/panel paths; do not run another drive solely for deleted unused code.
- [x] Retain compact evidence and remove build scratch. No promotion or publication in this batch.


## Owner-selected UI supersedes the earlier readability patch

The current styling is partial and must not be described as adopting the mockup. Before the next Android Auto UI run, finish the separate rounded average pill for both receivers: large average value, inline unit, concise Average label and progress, with fresh remaining distance retained in zone details. Keep provider/native announcement text out of the average pill. Ordinary warning pills use the owner-supplied common icon set, an established relationship label (Behind without an arrow), and only trustworthy distance/progress. Preserve the native speed/limit widget and independent average/warning layout. Host safe-area changes must drive placement; do not claim overlay positioning accepted until actually observed.

The premature maps-separate-pill71 capture was stopped by the owner and is not acceptance evidence. Do not repeat runtime testing solely to show another partially adopted layout.


## Required owner design-review deliverable

Provide38 actual head-unit captures at1280×480: the same19 FM design events in Vela and in Google Maps. Artificial event inputs are explicitly owner-authorized for this review only; all frames must be captured from the actual running app. Use the same fixed outer alert-pill dimensions across all types, including the average-speed card. Group matching events side by side or with paired links so the owner can review design and placement. Do not proceed with broader functional validation until owner approval. Do not present component renders, composed mockups or natural-event claims as substitutes for this review set.


## Owner rejection and revised pill review, 6 November

The initial 19-icon Maps set was explicitly rejected. The next review is one camera pill on a Netherlands map, in metres and km/h, with the normal speed badge visible. Use the supplied icon unchanged at a larger rendered size; regular native speedometer typography; progress only beneath the distance; fixed outer bounds; and right alignment with the complete native speed/limit pair. Do not repeat all19 or capture Vela until the owner reviews that single corrected frame.

The revision43 runtime proves metric Netherlands display, live100km/h and the revised icon/text/bar, but its right edge incorrectly used only `map_buttons_view_speed_limit`. The original APK separately names current speed `id/speedometer` (0x7f0b0ab7) and the limit sign `id/map_buttons_view_speed_limit` (0x7f0b05ed). Union those visible bounds for the pair. Do not change the host safe-area contract based on this sign-only anchoring error. The browsing frame is not route-navigation acceptance.

Revision44 did not move the real car pill. Resource inventories alone did not establish that `id/speedometer` identifies the car current-speed child. Reuse the existing `Shapes.badgeCard(part, decor)` compact ancestor locator used by Maps phone controls; it explicitly handles changing native badge child layouts. Anchor and obtain typography from that complete card. Keep the runtime74 failure qualified rather than claiming the synthetic rectangle test proved native binding.

Revision45 / runtime75 also retains warning-right1166 against native badge-right1218. The Android build, exact selected Morphe patches, asset/signature checks and static presence of the new native-card locator are verified, but neither static source nor synthetic rectangles proves the runtime clamp/card coordinates. The real A4 frame now shows300m and100km/h with the larger symbol and right-column bar; alignment remains unapproved. Owned emulator, apps, Frida and DHU were stopped, and APK/preferences/locale/GPS/audio/enabled states restored. Further capture repetitions are deferred pending a concrete layout diagnosis; frozen-observer changes are not authorized.

## Approved geometry snapshot76: actual cause

The owner authorized one30-second read-only geometry snapshot. It completed in1.83seconds; all owned runtime state was restored and cleanup finished within the promised three-minute window. Receipt and exact numeric bounds: `.analysis/waze-native-warnings/hud-geometry76/receipt.json` and `geometry.json`. The unchanged observer retained coverage. The temporary probe was archived then removed.

Actual host visible bounds are[12,12,1178,448], stable bounds[12,88,1102,448], and our cached viewport incorrectly uses their intersection. That forces our right edge to1086 after the16px margin. The native speed card is additionally scaled0.95 and translated-10px: its drawn right edge is1138. The previous ancestor selector incorrectly includes the watermark in `speed_limit_and_watermark_view`. Fix by using the current visible bounds (stable only when visible is unknown), the lowest shared speed/limit card within `map_buttons_view_speed_limit`, and its transformed visible rectangle in root coordinates. This is authoritative runtime geometry; no further probe expansion is authorized.

Runtime77/78 did not reach the design capture. Existing AA helpers were kernel-frozen (`cgroup.freeze=1`, `TracerPid=0`), so Frida attach timed out. Changing the global freezer preference did not thaw existing processes. Explicitly thawing only the owned AA helper process cgroups allowed the unchanged observer to attach. Original global setting, app state and GPS were restored; runtimes are stopped. Window78 expired and cleanup finished after its deadline, so it is failed evidence, not a passed capture. For the pending mandatory one-frame gate, check/thaw those exact cached AA helper cgroups before starting the observer, preserve their prior state, and restore it after observation. No observer/runner/probe changes are approved by this operational finding.
