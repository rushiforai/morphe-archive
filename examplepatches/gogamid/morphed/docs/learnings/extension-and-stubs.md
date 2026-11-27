# Extensions and compile-only stubs

The pattern behind `extensions/extension` and the `libs/rossmann-stub-5.11.1.jar` it compiles
against. Everything here was read from Rossmann 5.11.1 (`versionCode 421000110`).

The published v1.0.3 patch applied to the exact Rossmann APKM in the local Morphe CLI. The
runtime details below describe the implementation, not a confirmed activation or notification
on a signed-in device.

## What an extension is

An extension is **precompiled DEX**: `extensions/extension` is an Android library whose only
output is `extensions/extension.mpe` (declared in its `build.gradle.kts` via
`extension { name = "extensions/extension.mpe" }`). Patches merge it into the patched app
with

```kotlin
extendWith("extensions/extension.mpe")
```

and then inject small smali calls into the extension's classes. The auto-claim patch registers
once during application startup and hooks two coupon surfaces:

```kotlin
// RossmannApplication.onCreate, after startup work
invoke-static {p0, v1, v4}, Lapp/gogamid/morphed/extension/rossmann/RossmannAutoClaim;->register(Landroid/content/Context;Lde/rossmann/app/android/business/coupon/ActivateCoupon;Lkotlin/coroutines/CoroutineContext;)V

// CouponDisplayModelFactory: the Coupons tab and search conversion
invoke-static {p0}, Lapp/gogamid/morphed/extension/rossmann/RossmannAutoClaim;->onCoupon(Lde/rossmann/app/android/models/coupon/Coupon;)V

// CouponDisruptorState.Companion: list-shaped surfaces (nag helper, cart, search, …)
invoke-static {p0}, Lapp/gogamid/morphed/extension/rossmann/RossmannAutoClaim;->onCoupons(Ljava/util/List;)V
```

Keep patches thin: they capture instances and call into the extension; logic lives in Java
where it can be read, tested and reasoned about.

## You cannot compile against app classes

Rossmann's classes exist only in the APK. Solution: hand-written **stubs** under
`extensions/extension/stubs/`, compiled into `libs/rossmann-stub-<version>.jar`, consumed as

```kotlin
compileOnly(files("libs/rossmann-stub-5.11.1.jar"))
compileOnly("org.jetbrains.kotlin:kotlin-stdlib:2.3.0")
```

- Stubs are **never in the dex** (`compileOnly`, and the extension only depends on them for
  signatures). At runtime the same descriptors bind to the app's real classes.
- Stub initialisers never run at runtime; fields like `public final String l = null;` are just
  shapes. But a literal initialiser can still be folded by javac at compile time — see the
  `q` trap below.
- The jar name is pinned to the supported version so a version bump forces a rebuild.
- There is no `d8`/R8 rewriting of the extension that would fix a bad reference: a wrong
  descriptor or a missing field fails at runtime, not at compile time.

`.gitignore` ignores `*.jar`, so the stub jar needs an explicit exception (already present):

```gitignore
*.jar
# Compile-only stubs of app classes the extension links against (see extensions/extension/stubs).
!extensions/extension/libs/*.jar
```

Rebuild recipe and the full stub inventory are in
[`extensions/extension/stubs/README.md`](../../extensions/extension/stubs/README.md). After any
stub change, inspect the extension bytecode, not just the source:

```sh
javap -p -c -classpath extensions/extension/libs/rossmann-stub-5.11.1.jar \
    de.rossmann.app.android.models.coupon.Coupon
```

## Stub trap 1: a primitive initialiser is a compile-time constant

The v1.0.2 stub declared:

```java
public final boolean q = false; // DO NOT DO THIS
```

`q` is a *constant variable* (JLS 13.1): javac resolves reads of it at compile time, even
though it is an instance field. The extension source said

```java
if (coupon.q) continue; // already in the wallet
```

but the bytecode contained no `getfield Coupon.q` at all — just a null check and no remaining
branch. The wallet check was dead code, so every coupon (including coupons already in the
wallet) was sent to the activate action.

Fix: declare the field without an initialiser, so javac must emit a field read:

```java
public final boolean q; // getfield Coupon.q:Z
```

This affects any primitive (or `String`) stub field initialised with a literal. `l = null` and
`R = null` are safe because `null` is not a constant expression, but uninitialised is the
clearer default for every field whose runtime value matters. Confirm with:

```sh
javap -c -p -classpath <compiled-extension-classes> \
    app.gogamid.morphed.extension.rossmann.RossmannAutoClaim | grep -n 'Coupon.q'
```

## Stub trap 2: the app's R8 also renames stock Kotlin singleton fields

The extension compiles against stock `kotlin-stdlib`, but at runtime it links against the
stdlib copy **inside the R8-processed app**. R8 renamed the two singleton fields the old code
used:

| Stock Kotlin | Rossmann 5.11.1 smali |
|---|---|
| `kotlin.Unit.INSTANCE` | `Lkotlin/Unit;->a` |
| `kotlin.coroutines.EmptyCoroutineContext.INSTANCE` | `Lkotlin/coroutines/EmptyCoroutineContext;->a` |

v1.0.2's compiled extension contained `getstatic kotlin/Unit.INSTANCE` (from
`invokeSuspend` returning `Unit.INSTANCE`) and
`getstatic kotlin/coroutines/EmptyCoroutineContext.INSTANCE` (from
`TerminalContinuation.getContext`). Neither field exists in the app dex, so the continuation
path could not resolve them at runtime.

The fix is twofold:

- The injected smali reads the app's own field and passes the value in:
  `sget-object v4, Lkotlin/coroutines/EmptyCoroutineContext;->a`.
- The continuation returns the app's `Either` result instead of `Unit.INSTANCE`, so no `Unit`
  field is referenced at all.

Do not assume every stdlib field is renamed: enum constants such as
`CoroutineSingletons.COROUTINE_SUSPENDED` kept their names in this build, while object
`INSTANCE` fields did not. Check the actual smali before relying on any library field. Class
names being stable is not a promise about member names.

## Calling the app's suspend function from Java

`ActivateCoupon.c(Coupon, ContinuationImpl)` is a Kotlin `suspend` function compiled with a
`ContinuationImpl` parameter. From Java you subclass the runtime class
`kotlin.coroutines.jvm.internal.ContinuationImpl`:

```java
static final class ClaimContinuation extends ContinuationImpl {
    ClaimContinuation() {
        super(new Continuation<Object>() {
            @Override public CoroutineContext getContext() { return emptyContext; }
            @Override public void resumeWith(Object result) { complete(result); }
        });
    }

    @Override public Object invokeSuspend(Object result) { return result; }
}
```

Interop facts that cost time:

- `Continuation<Any?>` is **invariant**. Java sees `Continuation<Object>`, so a
  `Continuation<Unit>` terminal does not compile.
- `ContinuationImpl`'s constructor takes `Continuation<Object>` — that is the terminal above.
- `BaseContinuationImpl.resumeWith` on completion re-enters your `invokeSuspend`. Returning
  the `Either` result is what forwards it to the terminal; returning `Unit.INSTANCE` both
  discards the result and references the renamed field.
- Failures arrive as a *completed with failure* `Result`, not as a thrown exception. Refusals
  stay silent; only unexpected non-app results are worth a `Log.w`.

## Sync vs suspend completion

A Kotlin suspend function invoked from Java has two completion shapes, and the extension must
handle both exactly once:

```java
Object result = action.c(coupon, new ClaimContinuation());
if (result != CoroutineSingletons.COROUTINE_SUSPENDED) {
    complete(result); // the call finished before returning
}
// otherwise the continuation's terminal resumeWith will call complete(result)
```

- **Synchronous completion** returns the `Either` directly. Nothing will resume later, so
  `complete(result)` must be called from `drain`.
- **Suspended completion** returns `CoroutineSingletons.COROUTINE_SUSPENDED`; the app resumes
  the `ClaimContinuation` later, `invokeSuspend` returns the result, and the terminal's
  `resumeWith` calls `complete(result)`.
- Calling `complete` in both places would double-count and start the next activation twice.
- `complete` is always posted back to the single worker; it clears `inFlight` in a `finally`
  before calling `drain()` for the next coupon. One activation is in flight at a time.

## Hilt startup hand-off

v1.0.2 captured `ActivateCoupon` from `PageViewModelAdapterImpl`'s constructor. That adapter is
created for pages, so registration depended on a screen being built before coupons loaded. If
the Coupons tab loaded first, the extension's `action` was still `null` and every callback was
a no-op.

The candidate registers during application startup instead. `RossmannApplication` extends
`Hilt_RossmannApplication`; after `super.onCreate()` the generated component is available:

```smali
invoke-virtual {p0}, Lde/rossmann/app/android/ui/Hilt_RossmannApplication;->C0()Ljava/lang/Object;
move-result-object v1
check-cast v1, Lde/rossmann/app/android/ui/DaggerRossmannApplication_HiltComponents_SingletonC$SingletonCImpl;
invoke-virtual {v1}, Lde/rossmann/app/android/ui/DaggerRossmannApplication_HiltComponents_SingletonC$SingletonCImpl;->n()Lde/rossmann/app/android/business/coupon/ActivateCoupon;
move-result-object v1
sget-object v4, Lkotlin/coroutines/EmptyCoroutineContext;->a:Lkotlin/coroutines/EmptyCoroutineContext;
invoke-static {p0, v1, v4}, Lapp/gogamid/morphed/extension/rossmann/RossmannAutoClaim;->register(Landroid/content/Context;Lde/rossmann/app/android/business/coupon/ActivateCoupon;Lkotlin/coroutines/CoroutineContext;)V
```

- `C0()` asks Hilt's `ApplicationComponentManager` for the singleton component; `n()` is the
  generated provider that constructs the app's `ActivateCoupon` with its DAOs, wallet manager,
  rating controller and tracking.
- `C0` and `n` are generated, R8-processed names, not app API. They are pinned together with
  the rest of the compatibility version and must be re-read in smali on every bump.
- **Do not inject at "the single return".** 5.11.1's `onCreate` has one `return-void` inside
  the debug-only `WebView` try block and another at `:cond_6` after its catch. An earlier
  iteration asserted exactly one normal return and therefore rejected the method. The
  candidate instead anchors on the unique `CartImagesPreloading.a()` call, after startup but
  before those debug branches. `v1` is overwritten by the injected code, `v4` is dead there,
  and `v0` is left intact for the app's debug exception handler.
- The app's own `EmptyCoroutineContext.a` is passed in here, which is what makes the
  continuation constructible without referencing the stock `INSTANCE` field.

The hand-off is now process-wide and independent of navigation: every process start registers
the use case once.

## Which coupons the extension actually sees

The Coupons tab does **not** go through `CouponDisruptorState`. Its view model calls
`CouponDisplayModelFactory.c(List)`, which converts each coupon with the static method

```smali
.method public static b(Lde/rossmann/app/android/models/coupon/Coupon;Lde/rossmann/app/android/ui/coupon/CouponDisplayModel$ValidityTextMode;Lde/rossmann/app/android/ui/shared/Visibility;Lde/rossmann/app/android/ui/shared/Visibility;)Lde/rossmann/app/android/ui/coupon/CouponDisplayModel;
```

The candidate injects `onCoupon(p0)` at the top of `b`. That method is also used by search,
the wallet and product details, so the hook covers the real Coupons tab path that v1.0.2
missed. `CouponDisruptorState$Companion`'s factory still supplies list-shaped surfaces (the
nag helper, product search, cart, order history, product details) through `onCoupons(p0)`.
Both paths feed the same per-EAN dedupe.

## Rossmann domain semantics encoded in the extension

From the real `Coupon` model, `CouponToggleResult` and `CouponDisplayModelFactory`:

| Member | Meaning |
|---|---|
| `coupon.q: boolean` | coupon is already in the wallet |
| `coupon.l: String` | EAN, the backend identifier |
| `coupon.R: PreviewState` | preview state; `NotPreview` (singleton `NotPreview.a`) = **available now**, built from `availableFrom` being in the past or absent |
| `ActivateCoupon.c(...)` result | `Either<CouponToggleResult.Failure, CouponToggleResult.Success>` |
| `Either.Right.a` | the success payload (`CouponToggleResult.Success`) |
| `CouponToggleResult.Success.Full` | the wallet actually changed |
| `Success.Locally` / `Success.NoChangeNeeded` | no notification; not a backend-confirmed full activation |

Claim rule:

```java
if (action == null) return;
if (coupon.q) return;                               // already in wallet
if (coupon.R != NotPreview.a) return;               // preview → do NOT mark attempted
if (coupon.l == null || coupon.l.isEmpty()) return; // cannot be synced
if (!ATTEMPTED.add(coupon.l)) return;               // already tried this process
QUEUE.addLast(coupon);
drain();
```

Preview coupons are deliberately **not** marked attempted, so they are claimed once they
become available and a surface presents them again. Exclusive coupons and wallet limits are
handled by the app's own use case; failures and refusals stay silent. A coupon whose
activation is refused is still marked attempted for this process, so it is not retried in a
loop.

## Notifications: only on a confirmed full activation

The result is inspected only after the suspend call truly completes:

```java
if (result instanceof Either.Right && ((Either.Right) result).a instanceof Full) {
    notifyConfirmed(++confirmed);
}
```

- `Full` is the only outcome that posts a notification. `Locally`, `NoChangeNeeded`,
  `Either.Left` failures and thrown exceptions do not.
- The notification is updated in place with the running count, so repeated successes do not
  produce a stack of notifications: `setOnlyAlertOnce(true)` and `setAutoCancel(true)`, fixed
  ID `0x4d43`.
- The channel is created on demand for API 26+ (`morphed_coupon_activation`, importance
  default); API 24–25 use the pre-channel constructor. `areNotificationsEnabled()` is checked
  before posting, and `SecurityException` is caught because permission can change between the
  check and `notify`.
- The small icon is a framework drawable (`android.R.drawable.ic_dialog_info`), so the
  extension does not need to add resources to the patched app.

Notification visibility still depends on the app's `POST_NOTIFICATIONS` permission and the
user's channel settings. This still needs confirmation on a device.

## What v1.0.2 got wrong

| Symptom | Cause | Fix in v1.0.3 |
|---|---|---|
| Coupons tab list untouched | only the disruptor factory was hooked | hook `CouponDisplayModelFactory.b` |
| `action` could still be `null` | captured from a page adapter constructor | register from `RossmannApplication.onCreate` via Hilt |
| wallet check never ran | `q = false` stub field was constant-folded | `public final boolean q;` |
| continuation crashed / result lost | `Unit.INSTANCE` and `EmptyCoroutineContext.INSTANCE` renamed to `a` | return the result; pass `EmptyCoroutineContext.a` |
| no success notification | no notification code, and the result was discarded by fire-and-forget | sync/suspend completion, inspect `Either.Right` |
| overlapping activations | one task per coupon on an executor | single worker queue with an `inFlight` gate |

The durable lesson is not the individual names: **compileOnly stubs and stock library
references describe the source shapes, while the shipped app is post-R8.** Verify the actual
field and method names in smali, and never let a stub initialiser turn a runtime read into a
compile-time constant.
