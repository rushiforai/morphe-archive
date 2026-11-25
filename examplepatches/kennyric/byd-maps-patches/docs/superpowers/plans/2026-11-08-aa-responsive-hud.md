# Original Android Auto responsive HUD implementation plan

> **For agentic workers:** Use superpowers:executing-plans inline. Apply the repository's coherent-batch checkpoint ahead of frequent validation steps. No delegation or new validation framework is required.

**Goal:** Keep the approved Maps/Vela speed, warning and average-zone UI responsive on original AA without depending on DriveDeck.

**Architecture:** Keep standard navigation cards/actions in CAL. Use AA surface callbacks for the custom indicators; retain Maps' native speed card, and reposition its supplementary pills on actual native layout changes. Respect host DPI in Vela.

**Tech Stack:** Existing Java extensions, Android Views/Canvas, CAL Binder adapter, Robolectric, guarded original-DEX patch bindings.

**Spec:** `docs/contracts/car-navigation-widgets-v1.md` and `docs/contracts/navigation-indicators-v1.md`.

## Global constraints

- Preserve the approved generic design, all19 icon bytes, provider identity/expiry, speech authority and native watermark.
- Original AA17 plus Google DHU is the required host. DriveDeck cannot substitute for it.
- No physical-phone operations, additional AVD, design gallery or maintained observer changes in this batch.
- Unknown visible bounds withhold custom overlays. Teardown restores native transformations.
- Complete connected source/tests first, then the canonical grouped verification checkpoint; clean terminal build storage after compact receipts.

## Review focus

- Player/panel resize without GPS must move indicators before the next rendered frame.
- Repeated pre-draw callbacks must not accumulate native-card translations.
- Scaled/translated native parents and native animations retain their own baseline.
- Unknown/empty/replaced safe areas never authorize previously covered pixels.
- Density changes preserve logical speed/pill dimensions and their right-edge alignment.

## Connected implementation batch

- [x] Add `CarSpeedPlacement.place(ViewGroup,View,Rect):Rect` and `restore()` in the Maps extension; move only the dedicated existing speed card, preserve native transforms/alpha and return its surface bounds.
- [x] Update `ExternalTelemetry.carSurface`/`layoutCar` with session-scoped pre-draw observation and teardown; reposition the warning panel independently of data arrival.
- [x] Update `ProjectionRenderer.warningViewport` to distinguish missing from explicitly unknown visible callbacks and invalidate old bounds on geometry changes.
- [x] Add Vela `CarUi.speedScale(width,height,density)` and a density-aware compact-layout overload while preserving the mdpi design.
- [x] Uniformly measure constrained `CompactSpeedView` warning stacks.
- [x] Add regressions for dock reflow/restore, repeated frames, native transforms, scaled parents, explicit unknown bounds, resize without GPS and Vela160/240/320dpi equivalence.
- [x] Run the complete canonical verification command set, recording justified reuse for unchanged gates and fresh Android/Python/docs evidence.
- [x] Patch exact original Maps and Vela inputs with the signed review bundle; verify signer, original binding checks and unchanged19 icons.
- [x] Run one bounded original-AA acceptance session205 and retain genuine frames. Maps/FM average/speed rendering is proved; camera failure stopped the run. Vela DPI/other-size gates remain open.
- [x] Preserve receipts and signed inputs, stop owned processes and remove terminal outputs (204/205); stock comparison206 restored canonical AVD hashes exactly.
