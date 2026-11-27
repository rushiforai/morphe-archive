# Fingerprint rules that cost us a release

Everything here was learned the hard way on Rossmann 5.11.1 (`versionCode 421000110`).
The repo's fingerprints live in
`patches/src/main/kotlin/app/gogamid/morphed/patches/rossmann/Fingerprints.kt`.

## The hard rule: parameters are matched as a whole list

From the morphe-patcher docs:

> Declared parameters must have the same number of parameters as the method.

A **partial** parameter list never matches — not "match a prefix", not "match these
somewhere". If the target takes 7 parameters, you declare 7 entries.

This is exactly what broke v1.0.0: the build was fine, the release was published, and
applying the bundle died with

```
Failed to match the fingerprint: PageViewModelAdapterConstructorFingerprint
```

The constructor had **7** parameters; the fingerprint declared only the first **3**. The fix
was to declare all seven — the three identity-carrying descriptors in full, the remaining four
as object wildcards. This is the historical example (the fingerprint itself is no longer in
the tree; the hand-off was later moved to application startup):

```kotlin
object PageViewModelAdapterConstructorFingerprint : Fingerprint(
    definingClass = "Lde/rossmann/app/android/di/PageViewModelAdapterImpl;",
    name = "<init>",
    parameters = listOf(
        "Lde/rossmann/app/android/business/coupon/ActivateCoupon;",
        "Lde/rossmann/app/android/business/coupon/DeactivateCoupon;",
        "Lde/rossmann/app/business/repository/CouponRepository;",
        "L",
        "L",
        "L",
        "L",
    ),
)
```

`"L"` costs nothing in precision here: the first three arguments already pin the
constructor, and the rest are domain types that may be obfuscated. The lesson survives the
deletion of the fingerprint: **declare every slot, and use the full descriptor only where the
class name is stable.**

## How each parameter string is compared

| Declaration | Comparison | Matches |
|---|---|---|
| `Lde/rossmann/app/android/models/coupon/Coupon;` (full `L…;`) | equals | exactly that class |
| `I`, `Z`, `J`, `F`, `D`, `B`, `S`, `C` (primitive) | equals | exactly that primitive |
| `[Ljava/lang/String;` (starts with `[`) | prefix | any array whose descriptor starts with it |
| `;Ljava/lang/String;` (ends with `;`) | suffix | descriptors ending in that type |
| anything else, e.g. `L` | contains | any object type (`L…;`) |

Two rules of thumb: use the full descriptor when the class survives obfuscation, and a bare
`L` when it does not. Never leave a slot out.

## Constructors and named methods

- Constructors match with `name = "<init>"` (static initialisers with `"<clinit>"`).
- `name = "<init>"` **cannot** be combined with `isStatic` — the fingerprint is rejected.
- For regular methods prefer `isStatic = true` / `isStatic = false` over spelling out
  `accessFlags`. Visibility, `final` and `synthetic` drift between releases; staticness
  usually does not. Use `accessFlags` only when the flags themselves are the signal:

```kotlin
object CouponDisruptorCreateFingerprint : Fingerprint(
    definingClass = "Lde/rossmann/app/android/models/coupon/CouponDisruptorState\$Companion;",
    isStatic = true,
    parameters = listOf("Ljava/util/List;", "Ljava/lang/String;", "Lkotlin/jvm/functions/Function1;"),
    returnType = "Lde/rossmann/app/android/models/coupon/CouponDisruptorState;",
    filters = listOf(
        string("productEan"),
        string("findActivatedCoupon"),
    ),
)
```

Why the switch: the first released version declared
`accessFlags = listOf(PUBLIC, STATIC, FINAL)`, but the shipped method is only
`public static` — no `final`. `accessFlags` is an **exact** comparison, so declaring an
extra flag fails the match just as surely as a missing parameter does. The patcher
reports `Failed to match the fingerprint: …CouponDisruptorCreateFingerprint`, which pointed
straight at the flags after the parameter fix had moved the failure there. `isStatic = true`
expresses the only characteristic that matters.

## Current fingerprints beyond the disruptor factory

The Coupons tab does not pass through `CouponDisruptorState`. Its view model converts each
coupon with the static `CouponDisplayModelFactory.b(...)` method, so the candidate hooks that
method directly:

```kotlin
object CouponDisplayModelFingerprint : Fingerprint(
    definingClass = "Lde/rossmann/app/android/ui/coupon/CouponDisplayModelFactory;",
    isStatic = true,
    parameters = listOf(
        "Lde/rossmann/app/android/models/coupon/Coupon;",
        "Lde/rossmann/app/android/ui/coupon/CouponDisplayModel\$ValidityTextMode;",
        "Lde/rossmann/app/android/ui/shared/Visibility;",
        "Lde/rossmann/app/android/ui/shared/Visibility;",
    ),
    returnType = "Lde/rossmann/app/android/ui/coupon/CouponDisplayModel;",
)
```

The method name `b` is deliberately not declared: the full parameter list and return type
identify it among the factory's other overloads, and the name is R8 output. The same principle
applies to `RossmannApplication.onCreate`, which *is* named and stable:

```kotlin
object RossmannApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lde/rossmann/app/android/ui/RossmannApplication;",
    name = "onCreate",
    parameters = emptyList(),
    returnType = "V",
)
```

## A fingerprint matches a method, not an injection point

A fingerprint tells you *which* method to patch. It says nothing about where inside the body
it is safe to insert instructions. `RossmannApplication.onCreate` is the startup hand-off for
the auto-claim extension, but 5.11.1's body has **two** `return-void` opcodes: one inside the
debug-only `WebView` try block and one at `:cond_6` after its catch. "Inject before the return"
is therefore ambiguous, and asserting that there is exactly one return rejects the method.

The candidate instead finds the unique call to `CartImagesPreloading.a()` — after the startup
work, before the debug-only branches — and injects immediately after it. When picking an
anchor:

- prefer a unique instruction that is part of the app's startup flow;
- check which registers are live at that point (the injected code reuses `v1`, leaves `v0`
  for the app's catch handler, and treats `v4` as dead);
- do not anchor on line numbers or "the last return" — R8 reorders and duplicates control
  flow.

## String filters are ordered instruction filters

`filters = listOf(string("a"), string("b"))` means: an instruction loading `"a"`, *then
later* an instruction loading `"b"`, in that order. They are not "contains both".

The strongest cheap pattern in Kotlin code is the `Intrinsics` null-check pair at the top of
a method. `CouponDisruptorCreateFingerprint` anchors on `"productEan"` (the `require` message
for the EAN argument) followed by `"findActivatedCoupon"` (the log/require message further
down), which pins one method among the companion's many factories.

## Rossmann's R8 keeps class names, renames members

Observed on 5.11.1:

- Class names are **kept**: `de.rossmann.app.android.models.coupon.Coupon`,
  `...business.coupon.ActivateCoupon`, `...ui.coupon.CouponDisplayModelFactory`,
  `...ui.RossmannApplication`, `CouponDisruptorState$Companion`, and even Hilt's generated
  `Hilt_RossmannApplication` / `DaggerRossmannApplication_HiltComponents_SingletonC$SingletonCImpl`.
- Methods are renamed: the suspend activate action is `ActivateCoupon.c(Coupon, ContinuationImpl)`,
  the display conversion is `CouponDisplayModelFactory.b(...)`, Hilt's component accessor is
  `Hilt_RossmannApplication.C0()`, and the generated activate provider is
  `SingletonCImpl.n()`.
- Fields are renamed: `Coupon.q:Z` (in wallet), `Coupon.l:String` (EAN),
  `Coupon.R:PreviewState`, `NotPreview.a` for the singleton.
- **Stock Kotlin is not spared**: `kotlin.Unit.INSTANCE` becomes `kotlin/Unit;->a` and
  `kotlin.coroutines.EmptyCoroutineContext.INSTANCE` becomes
  `kotlin/coroutines/EmptyCoroutineContext;->a`. The extension compiles against stock
  `kotlin-stdlib` but links against the app's rewritten copy, so an `INSTANCE` reference in
  extension bytecode is a runtime `NoSuchFieldError`. Enum constants such as
  `CoroutineSingletons.COROUTINE_SUSPENDED` kept their names in this build; verify each one.

Consequence — for an **obfuscated** member, anchor on:

1. `definingClass` (stable), plus
2. the **full** parameter signature, plus
3. distinctive string constants,

and never on its method or field name. The exception is a name fixed by the Android platform
contract, such as the lifecycle override `RossmannApplication.onCreate`; that one can be
declared by name. The injected smali and the extension stubs do use the renamed members
(`c`, `b`, `q`, `l`, `R`, `C0`, `n`, `EmptyCoroutineContext.a`), so they are pinned to the
compatibility version in `shared/Constants.kt` and must be revisited with every
supported-version bump. Hilt's `C0`/`n` are generated graph names, not app domain API: they
move when Hilt or the DI graph changes even if the app's own classes do not.

See [apk-analysis-workflow.md](apk-analysis-workflow.md) for how to confirm those names in
smali, and [extension-and-stubs.md](extension-and-stubs.md) for how the stubs encode them
and why an initialiser can disappear at compile time.
