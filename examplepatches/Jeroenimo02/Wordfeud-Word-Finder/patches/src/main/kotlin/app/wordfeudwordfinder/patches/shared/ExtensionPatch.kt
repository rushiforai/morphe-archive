package app.wordfeudwordfinder.patches.shared

import app.morphe.patcher.patch.bytecodePatch

// Internal patch (no name): adds the extension (extensions/extension, the Java code the hooks call) to the app once.
// Every patch whose injected code calls the extension depends on it, so the classes are merged a single time even
// when several of those patches are selected.
internal val extensionPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")
}
