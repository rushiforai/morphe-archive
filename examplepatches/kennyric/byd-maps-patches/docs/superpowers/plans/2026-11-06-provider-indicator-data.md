# FM/Waze indicator data audit — updated 7 November 2026

The revised Maps pill and the complete Vela layout are owner-approved. Preserve their styling and alignment. Runtime92 proved the complete Vela design with artificial values in native Drive mode; functional FM/Waze delivery and speech remain open. No phone is involved.

The normative mapping, field, unit, freshness, expiry and clearing rules for all 19 visual families are now in [Navigation indicator contract v1](../../contracts/navigation-indicators-v1.md). That table separates explicit FM/Waze bindings from unsupported equivalents. It does not claim19 natural-feed or Vela acceptance results.

## Connected product batch48

- Normalize all 19 visual families while retaining native identity, categories and announcement authority. Maps and Vela share the same contract and unchanged owner assets.
- Correlate FM15 early-response geometry to the actual network-request fix and exact parser JSON/model. Preserve its measurement clock. Distinguish a native UI maximum-distance span from an audio trigger. Derive fresh Behind only from qualified relative coordinates, never heading alone.
- Capture actual road and average-zone overspeed decisions separately, excluding settings previews. A native average alarm supplies no invented numeric average.
- Supply data-only final metric road-limit transitions and GPS-only country transitions, excluding initial/default/manual country changes. These UPSERTs do not authorize speech.
- Distinguish Waze distance to a zone from distance remaining within it. Do not use an entry trigger as total zone length. Retain the genuine zone-percent observation clock.
- Require the native isTrafficLight flag before selecting the traffic-light glyph. Advice is not signal phase/time-to-green.

## Exact limitations

The130 asset may represent an actual known130 road limit, while the original native type remains intact. FM's separate Hop-hop notice is not equivalent; its driving-event binding is still unproven. The static native sound helper also has settings-preview callers, so it is not hooked globally.

No matching Waze native source has been proven for historical speed-trap hotspots, wrong-way drivers, opening-bridge state, traffic-observation cameras or border-crossing notices. The existence of an asset is not evidence of provider support. Other unmatched native warnings keep useful source text and a generic glyph.

Waze moving-emergency AA acceptance is excluded by owner instruction. Its static emergency hazard does not become a moving responder. FM emergency relative position does not establish closing speed, lane or predicted responder route.

## Verification and remaining gates

Rebase57 moved the feature branch onto GitLab main `b240fef2` (v1.49.1), producing rebased head `68016492` before the follow-up fixes were committed. It preserved all 276 tracked navigation source files and the local fixes byte-for-byte. The intervening upstream changes concern Zoom and generated release metadata. Complete canonical verification50 and the affected Android checkpoints therefore remain evidence for their exact navigation source; their older-version MPPs are engineering inputs, not a release built from this newer head. Required publication verification remains a future gate.

Reviewed batch54 fixes partial FM parser coordinates and keeps independently clocked Waze segment facts through descriptor refreshes. All four complete APK/APKM inputs patch, sign and align; Maps/Vela include all 19 exact owner asset hashes. Receipts are in `.analysis/android-auto-acceptance/native-indicator-reviewed-54/receipt.json`. Google Maps uses the retained original code/resources re-signed for engineering setup; the three Desktop publisher originals are used for Vela/FM/Waze. These are package/static results, not natural-feed acceptance.

Run87 caught an FM ART VerifyError: R8 had reused the Location parameter register for the sound engine at the injected call. Batch55 instead passes the original controller and reads its native Location field, which the original method assigns before that decision. The original complete FM APKM patches/signs/aligns, the corrected call site is decompiled, and run89 starts that APK under continuous Frida coverage without the verifier failure. Its signed hash also survived the next cold boot. This closes that startup regression, not every FM event-family acceptance gate.

Existing geometry47 build/patch evidence remains retained for its exact candidate. The approved design is runtime80/camera-fresh.png. The runtime79 missing-alert frame was captured66ms after receiver UPSERT and less than0.6s before CLEAR; it was not valid evidence of provider delivery failure.

The owner reduced the design gate to one generic Vela frame. Run85 exposed zoom-minus overlap; run89 proved that the host's visible and stable callback rectangles both still included that control. Batch56 reserves the native map-action end column as well as reported occlusions for both pills, retaining their common anchor while controls auto-hide. The affected canonical Android checkpoint and original Vela APK port/sign/alignment pass. Run90 captured the corrected camera pill clear of the control, with continuous Frida coverage, 1279ms after the artificial 300m input. The unmodified image is `~/Downloads/Android-Auto-Pill-Design-Review/vela-generic-design-review.png`, SHA-256 `5b8a2eeb93aa2d88a8bd4541027d0409bab62b6d4390ddb196e7136b74ec2919`. This is a browsing-state design frame on the 1280×480 active viewport, not navigation or natural-feed evidence. That browsing-only frame was insufficient: it omitted current/max speed. Run92 then captured the complete native Drive-mode layout with artificial current 100km/h, maximum 130km/h and camera 300m, and the owner approved it on 7 November. The approved image is `~/Downloads/Android-Auto-Pill-Design-Review/vela-complete-design-review.png`, SHA-256 `b4a9eba3d9cb25a159c47b03ccff9d60f0112849a3f8f7938e4a38e7db3d60c2`.

Real FM/Waze delivery, speech and lifecycle acceptance, active-guidance placement, and other car-size/input/scrolling gates remain open. The design gate is closed; continue with a prepared, bounded functional acceptance batch. FM background startup needs Android background-location permission: run92 verified genuine engineRunning=true after that setup, then restored the temporary grant. Include this known setup in future owned-emulator batches. No publication or main promotion is part of this batch. Build/runtime storage was cleaned after retaining compact receipts and the initialized engineering pair; no physical phone was touched.
