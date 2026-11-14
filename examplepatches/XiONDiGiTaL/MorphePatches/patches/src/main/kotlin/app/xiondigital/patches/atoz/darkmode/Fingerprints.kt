package app.xiondigital.patches.atoz.darkmode

import app.morphe.patcher.Fingerprint

/**
 * `com.amazon.atozm.MainApplication.onCreate()`.
 *
 * The class is the one the manifest names in `<application android:name>`, so it is the app's only
 * `Application` subclass and it is not obfuscated — React Native's template keeps that package and
 * class name, and A to Z's own dex confirms it in 6.0.2065.0, 6.0.2988.0, 6.0.3553.0 and
 * 6.0.5098.0.
 *
 * The body is not filtered on. Every inspected build initialises SoLoader, the React host and the
 * Flipper/React DevTools hook in a different order, so any string or instruction filter would tie
 * the patch to one release. The descriptor alone already identifies the method uniquely:
 * `MainApplication` declares exactly one `onCreate()`.
 *
 * No access flags are required, because a Kotlin `override fun onCreate()` may or may not be
 * compiled `final` depending on the release, and the descriptor plus the class is specific enough.
 *
 * The injected code uses `v0`, which is dead at entry: `onCreate()` is a no-argument instance
 * method, so `p0` is the only parameter register and every `v` register below it is free. The patch
 * still checks the register count before touching the method, so a build that compiles `onCreate()`
 * down to nothing but `p0` fails the patch instead of overwriting `this`.
 */
internal object MainApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/atozm/MainApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = emptyList(),
)
