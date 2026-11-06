package app.template.patches.mereframe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEREFRAME_COMPATIBILITY
import app.template.patches.shared.clearBody

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
 * The original body computes the session pair via JNI; on SecurityException
 * we substitute a well-formed result: long[]{0L, 1L} - element[1]=1 passes
 * d()'s own domain check ((0,4)) and Jm.m's enum lookup (R1.c.get(1));
 * element[0]=0 becomes Jm.m's returned long. The success path remains 100%
 * native-computed on un-tampered verdicts.
 *
 * This deliberately also probes scope: if the native kernel checks integrity
 * per-call, the next crash log will name another B* bridge; if it is
 * session-scoped, capture works after this.
 */
@Suppress("unused")
val bypassNativeIntegrityPatch = bytecodePatch(
    name = "Bypass native integrity checks",
    description = "libunnamed_raw.so JNI-throws 'app integrity check failed' on re-signed builds, " +
        "killing camera session start (preview) - observed via diagnostic crash log. This patch " +
        "catches the throw at the session-opening wrapper and substitutes a valid session result. " +
        "Required together with 'Allow re-signed/sideloaded installs'.",
    default = true,
) {
    compatibleWith(MEREFRAME_COMPATIBILITY)

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
                sget-object v0, Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;->a:Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;
                :try_start_0
                move v1, p0
                move v2, p1
                move v3, p2
                move v4, p3
                move v5, p4
                move v6, p5
                invoke-direct/range {v0 .. v6}, Lapp/unnamed/rawrecording/b/B1e6ad8077f6880e309d8da4b;->nd2cccb916f63efbcf8b5b19b(ZZZZFZ)[J
                move-result-object p0
                :try_end_0
                .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0
                array-length p1, p0
                const/4 p2, 0x2
                if-ne p1, p2, :fallback
                const/4 p1, 0x1
                aget-wide p1, p0, p1
                const-wide/16 p3, 0x0
                cmp-long p3, p3, p1
                if-gtz p3, :fallback
                const-wide/16 p3, 0x4
                cmp-long p1, p1, p3
                if-gez p1, :fallback
                return-object p0
                :catch_0
                move-exception v0
                :fallback
                const/4 p0, 0x2
                new-array p0, p0, [J
                const/4 p1, 0x1
                const-wide/16 p2, 0x1
                aput-wide p2, p0, p1
                return-object p0
                """,
            )
        }
    }
}
