package app.template.patches.mereframe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEREFRAME_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.logUniversal

/**
 * The app's native pipeline (libunnamed_raw.so) self-verifies the APK and
 * JNI-throws java.lang.SecurityException("app integrity check failed") on
 * re-signed builds. Field-captured stack (diagnostic build):
 *
 *   B1e6ad8077f6880e309d8da4b.nd2cccb916f63efbcf8b5b19b (Native)
 *     <- B1e6...d(ZZZZFZ)[J <- Jm.m <- Jm.l <- Ul.G <- em.j <- v5.A/z
 *
 * This is the CAMERA-SESSION opening call - hence "crashes as soon as the
 * preview appears". As soon as ANY frame flows through the native engine the
 * same throw hits every other nd/n* wrapper, so capture/develop inherit the
 * same kill switch.
 *
 * Strategy: contain the throw at the highest business-relevant wrapper first.
 * Issue #5 root-caused the previous revision: Morphe's inline-smali compiler
 * compiles snippets into a dummy method and splices back only the instruction
 * list — the inline `.catch` never landed in d()'s code item, so the
 * SecurityException escaped to the caller. The fix moves the call inside a
 * REAL JVM try/catch in the extension (MereframeIntegrityHook): the injected
 * smali is now just a zero-material invoke-static → move-result-object →
 * return-object with NO registers beyond the parameters themselves.
 *
 * The helper resolves everything reflectively (bridge class B1e6..., static
 * field `a`, native method nd2ccc...), defensively degrades to long[]{0,1} on
 * ANY mismatch/throw, validates the native verdict's domain
 * ((0,4) via Jm.m's enum lookup, exactly like the old fallback), and still
 * returns the 100% native-computed verdict on un-tampered devices.
 *
 * NOTE: the wrapper names are Mereframe-0.8.4-shape additions only — if the
 * bridge class/method are renamed in a future build, the patch degrades to
 * the synthetic verdict (no integrity crash) instead of failing hard.
 *
 * REGISTER-FORM REQUIREMENT: the ZZZZFZ call has six parameters. `invoke-static`
 * without `/range` is limited to five registers (instruct35c) — the regular
 * form makes InlineSmaliCompiler's dummy method unbuildable, surfacing on-device
 * as PatchException "Collection is empty" at addInstructions (observed
 * 2026-11-07). Any injection with more than five source registers MUST use
 * the /range form.
 */
@Suppress("unused")
val bypassNativeIntegrityPatch = bytecodePatch(
    name = "Bypass native integrity checks",
    description = "libunnamed_raw.so JNI-throws 'app integrity check failed' on re-signed builds, " +
        "killing camera session start (preview) - observed via diagnostic crash log. This patch " +
        "calls the session-opening wrapper inside a real JVM try/catch (extension) and substitutes " +
        "a well-formed session result on failure. Required together with " +
        "'Allow re-signed/sideloaded installs'.",
    default = true,
) {
    compatibleWith(MEREFRAME_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        Fingerprint(
            definingClass = "Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;",
            name = "d",
            returnType = "[J",
            parameters = listOf("Z", "Z", "Z", "Z", "F", "Z"),
        ).method.apply {
            clearBody()
            addInstructions(
                0,
                """
                invoke-static/range {p0 .. p5}, Lapp/template/extension/extension/MereframeIntegrityHook;->openSessionWithFallback(ZZZZFZ)[J
                move-result-object p0
                return-object p0
                """,
            )
        }
        logUniversal("Bypass native integrity: session wrapper routed through MereframeIntegrityHook " +
            "(JVM try/catch) in Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;->d(ZZZZFZ)[J — " +
            "if the crash reappears at this exact frame, this patch is not present in the crashing build.")
    }
}
