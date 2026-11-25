---
name: morphe-patch-development
description: >-
  Use this skill when developing, debugging, hooking, or releasing Morphe patch bundles
  for Android apps (bytecode manipulation, Smali hooks, Java extension runtimes, and semantic releases).
---

# Morphe Patch Development Runbook

This skill documents how to develop, reverse-engineer, implement, and maintain independent Morphe patches.

## 1. Project Structure
A standard Morphe patch bundle repository consists of:
- `patches/`: Kotlin project defining bytecode patches using `app.morphe.patcher`.
  - `build.gradle.kts`: Configured with `app.morphe.patches` plugin.
  - `src/main/kotlin/...`: Patch files using `bytecodePatch { ... }`.
- `extensions/`: Android library module compiling Java/Kotlin classes injected into the target APK.
  - Injected classes are referenced via Smali descriptors (e.g. `Lde/deconta/extension/rossmann/AutoClaimCoupons;`).
- `.github/workflows/release.yml`: Automated CI/CD pipeline using semantic-release.

## 2. Reverse Engineering the Target App
1. **Decompile APK**: Use JADX (`jadx -d output_dir target.apk`) to obtain Java sources.
2. **Locate UI & Controller**: Identify the target `Fragment` or `Activity` where the desired event triggers (e.g., `CouponsFragment`).
3. **Trace Smali Signatures**: Note obfuscated names (e.g., method `L(Object)`, field `w` for adapter, field `p` for factory/viewholder).
4. **Identify Models**: Inspect how items are loaded (e.g., `CouponDisplayModel`). Look at database entities (`Room` DAO / Entities) to understand backend constraints like `is_only_one_per_wallet`.

## 3. Hooking with Bytecode Patches
In `patches/.../MyPatch.kt`:
```kotlin
val myPatch = bytecodePatch(
    name = "My Patch Name",
    description = "Description of what it patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PACKAGE)
    extendWith(EXTENSION_NAME)

    execute {
        val targetClass = classDefByOrNull(TARGET_CLASS_DESCRIPTOR)
            ?: throw PatchException("$TARGET_CLASS_DESCRIPTOR not found")

        val targetMethod = targetClass.methods.singleOrNull { method ->
            method.name == "targetMethodName" && method.parameterTypeNames() == listOf("Ljava/lang/Object;")
        } ?: throw PatchException("Method not found")

        val method = mutableMethod(targetClass, targetMethod)
        method.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $EXTENSION_DESCRIPTOR->onEvent(Ljava/lang/Object;Ljava/lang/Object;)V
            """
        )
    }
}
```

## 4. Extension Runtime Best Practices
- **No Direct R Resource Dependencies**: Third-party APK resource IDs change across builds. Never rely on compile-time `R.id` or `R.string` in extension code. Instead, use reflection, field inspection, or programmatic UI creation (`LinearLayout`, `TextView`, `GradientDrawable`, etc.).
- **Dynamic Proxies for Interfaces**: When an obfuscated presenter requires a callback display interface, use `java.lang.reflect.Proxy.newProxyInstance(...)` to implement the interface dynamically.
- **Main Thread Dispatch**: All UI modifications and presenter invocations must be dispatched to `Looper.getMainLooper()`.
- **Throttling & Async Calls**: Introduce staggered delays (`Handler.postDelayed`) between network or database actions to prevent throttling or UI freezes.
- **Settings & Persistence**: Use standard `context.getSharedPreferences(NAME, Context.MODE_PRIVATE)` for user toggles.

## 5. Automated Releases with Semantic Release
- Commits must adhere to Conventional Commits:
  - `feat: ...` -> Bumps minor version (`v1.x.0`) and publishes new release.
  - `fix: ...` -> Bumps patch version (`v1.x.y`) and publishes new release.
- GitHub Actions automatically generates `.mpp`, `.jar`, updates `CHANGELOG.md`, `patches-bundle.json`, and attaches release assets.
