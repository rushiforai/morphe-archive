package app.epxec.patches.vtubestudio

import app.epxec.patches.shared.Constants.COMPATIBILITY_VTubeStudio
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patcher.patch.rawResourcePatch

// VTube Studio v1.32.71 — IL2CPP native patch
//
// Architecture: Unity + IL2CPP (ARM64). All purchase/subscription logic lives
// entirely in libil2cpp.so. There is no app-authored Java/Kotlin layer to patch.
//
// ── How the subscription gate works ─────────────────────────────────────────
//
//   IAPManager.Initialize() (called on startup):
//     if (this.isSubscribed == false) {
//         this.isSubscribed = CheckLocalSubscribed();   // hash-pair IAP check
//     }
//     if (this.isSubscribed) {
//         subscriptionUI.Subscribed(true);              // unlocks UI
//     }
//
//   CheckLocalSubscribed() hashes a locally-stored IAP receipt pair and
//   verifies it against the expected product ID. Returns false when no
//   purchase exists.
//
//   IsSubscribed() is only a thin getter: return this.isSubscribed; — patching
//   it alone has no effect because the field is set before it's ever read.
//
// ── Target: IAPManager.CheckLocalSubscribed() at file offset 0x3031384 ─────
//
//   Original prologue (2 instructions):
//     str  x30, [sp, #-0x40]!    // push return address
//     stp  x24, x23, [sp, #0x10]
//     ...lots of hash verification logic...
//     mov  w0, #1 / mov w0, wzr  // return 1 or 0
//     ret
//
//   Patched (replace first 2 instructions):
//     mov  w0, #1                // always return true (subscribed)
//     ret
//
// ── Pattern uniqueness ────────────────────────────────────────────────────
//
//   The 12-byte search pattern uses 4 bytes of the preceding BL instruction
//   as context — verified unique (1 occurrence) across the 103 MB binary.
//
//   Search (12 bytes):      0E 66 E4 97 | FE 0F 1C F8  F8 5F 01 A9
//                           ^^^^^^^^^^^   ^^^^^^^^^^^^  ^^^^^^^^^^^
//                           BL context    str x30,[sp]  stp x24,x23
//
//   Replacement (12 bytes): 0E 66 E4 97 | 20 00 80 52  C0 03 5F D6
//                           ^^^^^^^^^^^   ^^^^^^^^^^^^  ^^^^^^^^^^^
//                           unchanged     mov w0,#1     ret

private val checkLocalSubscribedHexPatch = hexPatch(block = {
    "0E 66 E4 97 FE 0F 1C F8 F8 5F 01 A9" asPatternTo
    "0E 66 E4 97 20 00 80 52 C0 03 5F D6" inFile
    "lib/arm64-v8a/libil2cpp.so"
})

@Suppress("unused")
val enableProPatch = rawResourcePatch(
    name = "Enable Pro",
    description = "Patches IAPManager.IsSubscribed() in libil2cpp.so to always " +
        "return true, unlocking all pro/subscription-gated features.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_VTubeStudio)

    dependsOn(checkLocalSubscribedHexPatch)

    execute { /* all work is done by the hexPatch dependency */ }
}
