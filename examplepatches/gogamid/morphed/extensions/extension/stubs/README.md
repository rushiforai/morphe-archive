# Rossmann stubs (compile-only)

Stubs of the Rossmann app classes that the extension calls into, verified
against Rossmann 5.11.1 (versionCode 421000110):

- `de.rossmann.app.android.models.coupon.Coupon` — the fields `l` (EAN), `q`
  (already in wallet) and `R` (preview state)
- `de.rossmann.app.android.models.coupon.Coupon$PreviewState$NotPreview` — the
  singleton field `a` (`available now`)
- `de.rossmann.app.android.business.coupon.ActivateCoupon` — the suspend
  activate action `c(Coupon, ContinuationImpl)`
- `de.rossmann.app.android.business.coupon.CouponToggleResult` — enough of the
  result hierarchy to recognise `Success.Full`
- `arrow.core.Either` — `Right.a` is the success payload returned by `c(...)`

The single-letter names are the app's R8 output. The patch fingerprints pin
this exact build, so the names only change together with a compatibility
bump in `patches/.../shared/Constants.kt`.

These classes are never shipped. They are compiled into
`libs/rossmann-stub-5.11.1.jar`, which the extension module consumes as
`compileOnly`, so the extension dex never contains them and the calls bind
against the app's real classes at runtime.

## Why `q` has no initialiser

`Coupon.q` is intentionally declared as

```java
public final boolean q;
```

not `public final boolean q = false;`. A `final` primitive initialised with a
literal is a **constant variable** (JLS 13.1), so javac inlines every read at
compile time. Reading `coupon.q` then produces a constant (`iconst_0`) and no
`getfield Coupon.q:Z`, so the runtime wallet check disappears. The same
applies to `String` fields initialised with literals; `null` is not a constant
expression, but uninitialised is still the safer shape for any field whose
runtime value matters.

Check the compiled extension after changing a stub:

```sh
javap -c -p -classpath <extension-classes> \
    app.gogamid.morphed.extension.rossmann.RossmannAutoClaim | grep 'Coupon.q'
```

## Do not reference stock Kotlin singleton fields

The extension compiles against stock `kotlin-stdlib` but runs against the copy
inside the R8-processed app. In 5.11.1 both `Unit.INSTANCE` and
`EmptyCoroutineContext.INSTANCE` are renamed to `a`. The extension therefore
never references them: the patch injects
`sget-object ..., Lkotlin/coroutines/EmptyCoroutineContext;->a` and passes the
context to `register(...)`, and `ClaimContinuation.invokeSuspend` returns the
app's result instead of `Unit.INSTANCE`.

## Rebuilding the jar

Compile all stub sources together; `ActivateCoupon` needs the Kotlin stdlib
only for the `ContinuationImpl` parameter type.

```sh
javac -cp kotlin-stdlib-<version>.jar -d build/ \
    stubs/de/rossmann/app/android/models/coupon/Coupon.java \
    stubs/de/rossmann/app/android/business/coupon/ActivateCoupon.java \
    stubs/de/rossmann/app/android/business/coupon/CouponToggleResult.java \
    stubs/arrow/core/Either.java

jar cf libs/rossmann-stub-5.11.1.jar -C build de -C build arrow

javap -p -c -classpath libs/rossmann-stub-5.11.1.jar \
    de.rossmann.app.android.models.coupon.Coupon
javap -p -c -classpath libs/rossmann-stub-5.11.1.jar \
    de.rossmann.app.android.business.coupon.ActivateCoupon
```

The two `-C` entries put both package roots (`de` and `arrow`) into the jar; the
extension needs `Either` just as much as the Rossmann classes.
