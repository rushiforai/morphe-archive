# Caption menu crash hotfix (1.2.2)

## Reproduced cause

The 1.2.1 generated `CaptionQuickToggle.nativeContainer(Object)` method merged two control-flow paths at one `return-object v0`: the null-check path retained verifier type `FlyoutMenuInfo`, while the other path held `LinearLayout`. ART merged these into `Object`, which is not a valid declared `LinearLayout` return. The verifier rejected the entire class, so opening either player settings or Shorts overflow could fail before the AI row was drawn.

This was reproduced by actually invoking the published-candidate generated class on Android 35 ART, not inferred solely from source:

```text
java.lang.VerifyError: Verifier rejected class ...CaptionQuickToggle
nativeContainer ... returning 'Reference: java.lang.Object', but expected ... 'Reference: android.widget.LinearLayout'
```

Merely loading the class without initialization and enumerating methods did not expose the failure. The prior structural audit checked bindings, branch positions and access but not this return-type merge; the Robolectric tests exercised Java stubs rather than the patched DEX method. Those checks were insufficient for this defect.

## Minimal correction

The null path now explicitly clears its register and returns null immediately. The non-null path separately returns the accessor's `LinearLayout` result. There is no mixed-type join at a return. No subtitle timing, translation, segmentation, language label, optional-patch boundary or one-tap toggle behavior is changed by this hotfix.

The generated-code audit now requires two separate typed returns and checks their producer instructions. `tools/art_menu_probe/ArtMenuProbe.java` and `tools/verify_menu_art.py` provide a replayable emulator-only ART regression: the old APK must reproduce this exact VerifyError, and the corrected APK must successfully invoke the actual `onMenu` method with both zero and nonzero group indices. It does not substitute mocked Java stubs for the method under test.

This probe deliberately uses the no-Activity entry path so it requires no account, network, YouTube installation or paid API. It validates actual ART execution/class verification, not visual menu tap-through or real-device playback. A full generated APK and the unchanged unit suite are also checked before publishing via the existing semantic-release workflow.
