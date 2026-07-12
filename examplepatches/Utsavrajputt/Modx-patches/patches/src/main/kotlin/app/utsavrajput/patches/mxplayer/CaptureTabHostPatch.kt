package app.utsavrajput.patches.mxplayer

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.utsavrajput.patches.shared.Constants.COMPATIBILITY_MX_PLAYER

/**
 * Pinned to Ln4d;->j0()V (confirmed exact match from crash_log.txt earlier —
 * this is the fragment's onResume-triggered method, called every time it
 * becomes visible again, e.g. after finish()ing an extension Activity).
 *
 * We do NOT return early here — we only prepend a capture call so the
 * extension module can hold a weak reference to the live "this" (the n4d
 * fragment instance) and later invoke its public O1(String,Z) tab-switch
 * method via reflection. Original body runs unmodified after our insert.
 */
object TabHostCaptureFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type == "Ln4d;" && method.name == "j0"
    },
)

val captureTabHostPatch = bytecodePatch(
    name = "Capture tab host for programmatic tab switching",
    description = "Lets extension Activities (Tools/About) trigger a real MX Player tab switch instead of just finishing back to whatever tab was last visible.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER)
    extendWith("extensions/core.mpe")
    execute {
        TabHostCaptureFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, Lapp/utsavrajput/extension/ExtensionHooks;->captureTabHost(Ljava/lang/Object;)V
            """,
        )
    }
}
