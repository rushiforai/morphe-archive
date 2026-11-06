Pinterest 14.23.0 (versionCode 14238020)

## Ad Architecture

### Google Mobile Ads (GMA)
- App ID: ca-app-pub-7687027632798059~1192996890
- SDK version: 0.24.0-beta01 (ads_mobile_sdk, ~3172 obfuscated smali files)
- GMA controls both banner ads and native ads (rendered as pins)
- Uses Open Measurement (IAB OM SDK), Privacy Sandbox AdServices API

### Gatekeeper Flow
```
pz.j.d()                        # Master gate: rz.g.f123390e && ao0.a.j()
  ├── rz.g.f123390e             # Set true after GMA SDK init completes
  └── ao0.a.j()                 # Experiment check "android_ad_gma_new"
       └── ao0.i0.n("android_ad_gma_new", "enabled", ...)

pz.j.e()  # Banner ad load -> calls d() first, returns if false
pz.j.f()  # Native ad load -> calls d() first, returns if false
pz.j.c()  # GMA SDK init -> calls ao0.a.j() first, returns if false
```

### GMA SDK Init Chain
- `pz.j.c()` -> checks `ao0.a.j()` && consent -> crash backoff -> coroutine launch
- `rz.f.a()` -> sets `rz.g.f123390e = true` on init complete callback
- `t00.c` (adsGmaConfigManager) -> fetches `ThirdPartyAdConfig` from PinService
- Config model: `io` { gma: `jo` { load: Boolean, ad_unit_ids: [...], ttl_seconds, ... } }

### Promoted Pin Detection
Two API fields determine if a pin is promoted:
- `me.I5()` -> field `w1` -> `@bp.b("is_promoted")`
- `me.q5()` -> field `Q0` -> `@bp.b("is_downstream_promotion")`

Both are nullable Boolean getters (return FALSE on null).
Used in 100+ locations: "Shop now" CTAs, sponsored badges, promoted-by labels.

Key check in `iv/c.U(me)`:
```java
return meVar.I5().booleanValue() || meVar.q5().booleanValue();
```

`ht/n.java:81` chooses CTA text:
```java
int text = meVar.I5().booleanValue() ? pin_action_shop_now : pin_action_variant;
```

### Shop the Pin / Shop the Look
- Not an ad — organic product matching feature
- Module: `product_tagged_shopping_module_upsell` story type
- Network fetch gate: `n81.b0.o3(me pin, boolean shouldFetch)`
- Rendering gate: `n81.b0.n3(u5 story)` -> `n81.b0.p3(u5 story)` (carousel)
- Analytics gate: `ue.J0(me)` (does NOT gate rendering)
- Layouts: `shop_the_look_focus_carousel_layout`, `shop_the_look_focus_scene_pin_item`

### Third-Party Ad SDKs
- `com.google.android.gms.ads` (94 files), `ads_mobile_sdk` (3172 files)
- `adsGmaLibrary`, `adsOpenMeasurement`, `adsWebViewPin` wrappers
- Manifest: `AD_ID` permission, Privacy Sandbox ad services

## Patches

### Patch 1: Remove GMA ads (GmaAdsPatch.kt)
Target: `ao0.a.j()` — GMA experiment gatekeeper
Fingerprint: strings "android_ad_gma_new", "enabled", returns Z
Effect: `return false` -> no GMA SDK init, no GMA ad loading
Safe: callers already handle false with early exit

### Patch 2: Remove promoted content (PromotedContentPatch.kt)
Targets:
- `me.I5()` — fingerprint: public final, returns Boolean, opcodes IGET_OBJECT/IF_NEZ/SGET_OBJECT/RETURN_OBJECT, custom: field "w1"
- `me.q5()` — same pattern, custom: field "Q0"
- `n81.b0.o3()` — fingerprint: public final, params (me, Z), returns V, strings "closeupPin"/"product_tagged_shopping_module_upsell"

Effects:
- is_promoted always false -> no "Shop now" CTA, no promoted labels
- is_downstream_promotion always false -> secondary ad flag blocked
- Shop the Pin module never fetches/renders

## Gotchas

### returnEarly(false) on Boolean getters
`returnEarly()` for `L` return type returns null. Callers do `.booleanValue()` -> NPE.
Fix: use `addInstructions` with `sget-object Boolean.FALSE; return-object`.

### custom{} fingerprint field matching
`instructions` is `Iterable`, not `List` — use `.count()` not `.size`.
Must import `ReferenceInstruction` and `FieldReference` from dexlib2.

### ue.J0() is analytics-only
Does NOT gate shop_the_look rendering. Real gate is `n81.b0.o3()`.

### adb version downgrade
Uninstall first if device has newer version. Data loss unavoidable.

## Future Work
- Remove lead generation ads
- Remove ad preview/debugger features
- Block analytics ad event logging (15+ payload types)
- More recent Pinterest versions may have different obfuscation
