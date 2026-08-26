package app.template.patches.steamlink.androidxr

import app.morphe.patcher.patch.bytecodePatch

// Helper-only extension. Morphe does not compatibility-filter transitive dependencies, so this
// must never contain fragments for Valve's existing SDL/controller classes. The helpers are inert
// on native-XR builds; build-aware Kotlin patches install their call sites only on legacy builds.
internal val androidXrUiExtensionPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
}

// New helper classes only. Unlike extension.mpe this contains no SDLSurface,
// SDLControllerManager, or SDLGenericMotionListener_API14 fragments.
internal val androidXrMinimalUiExtensionPatch = bytecodePatch {
    extendWith("extensions/minimal-extension.mpe")
}
