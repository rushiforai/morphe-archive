package patapon888.morphe.patches.fruitninja.logging

import app.morphe.patcher.patch.resourcePatch
import patapon888.morphe.patches.fruitninja.FRUIT_NINJA_CLASSIC
import patapon888.morphe.patches.fruitninja.native.LibraryEdit
import patapon888.morphe.patches.fruitninja.native.RET
import patapon888.morphe.patches.fruitninja.native.arm64OnlyPatch
import patapon888.morphe.patches.fruitninja.native.patchGameLibrary

/**
 * Offline, the online SDKs log every failed request. Unity's DebugLogHandler formats each message
 * with a stack trace and writes it to logcat, which costs frame time for nothing.
 */
@Suppress("unused")
val disableDebugLoggingPatch = resourcePatch(
    name = "Disable debug logging",
    description = "Stops the game writing its debug log, which saves CPU time, mostly when offline. " +
        "Only the arm64-v8a library is kept."
) {
    compatibleWith(FRUIT_NINJA_CLASSIC)

    dependsOn(arm64OnlyPatch)

    execute {
        patchGameLibrary(
            listOf(
                LibraryEdit(0x3AB6190, "fe5fbda9", RET),
                LibraryEdit(0x3AB61EC, "fe57bea9", RET),
                LibraryEdit(0x3AB6230, "fe0f1df8", RET),
                LibraryEdit(0x3AB6298, "fe5fbda9", RET),
                LibraryEdit(0x3AB6304, "fe57bea9", RET),
            )
        )
    }
}
