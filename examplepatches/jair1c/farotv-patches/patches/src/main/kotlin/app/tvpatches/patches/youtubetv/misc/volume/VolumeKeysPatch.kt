package app.tvpatches.patches.youtubetv.misc.volume

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tvpatches.patches.youtubetv.shared.Constants.COBALT_ACTIVITY
import app.tvpatches.patches.youtubetv.shared.Constants.COMPATIBILITY_YOUTUBE_TV

private object DispatchKeyToImeFingerprint : Fingerprint(
    definingClass = COBALT_ACTIVITY,
    name = "dispatchKeyEventToIme",
    returnType = "Z",
    parameters = listOf("I", "I"),
)

/** Keep volume events on Android's normal Activity fallback instead of Cobalt's IME. */
@Suppress("unused")
val volumeKeysPatch = bytecodePatch(
    name = "Fix volume keys",
    description = "Lets Android handle short presses and held volume keys instead of sending them to the web input method.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_TV)
    execute {
        val method = DispatchKeyToImeFingerprint.method
        check(method.implementation!!.registerCount > 3) { "No scratch register in dispatchKeyEventToIme" }
        method.addInstructions(0, """
            const/16 v0, 0x18
            if-eq p1, v0, :volume_system
            const/16 v0, 0x19
            if-eq p1, v0, :volume_system
            const/16 v0, 0xa4
            if-ne p1, v0, :volume_original
            :volume_system
            const/4 v0, 0x0
            return v0
            :volume_original
            nop
        """)
    }
}
