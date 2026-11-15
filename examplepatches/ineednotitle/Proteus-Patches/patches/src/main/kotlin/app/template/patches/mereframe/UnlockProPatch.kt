package app.template.patches.mereframe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.shared.Constants.MEREFRAME_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters
import app.template.patches.shared.logUniversal

private const val SO_ARM64_PATH = "lib/arm64-v8a/libunnamed_raw.so"
private const val BF1C089_CLASS = "Lapp/unnamed/rawrecording/b/Bf1c089a4a0abf0794ad7a6f9;"

/**
 * Native entitlement gates verified in `lib/arm64-v8a/libunnamed_raw.so` (Mereframe 0.8.4 / vc 118):
 * - `verifySessionHandle@0x242048` (`fo=0x23e048`): called by `Bf1c089.b` and `Bd3aa6ded.n5035ad` (RAW/DNG capture)
 * - `isProEntitled@0x244680` (`fo=0x240680`): called by `Bf1c089.e` and `Bf1c089.g` (`PhotoEditActivity`/`LIA`)
 */
private val PRO_ARM64_GATES = listOf(
    arm64Gate(
        "verifySessionHandle@0x242048",
        "3f 23 03 d5 ff 03 03 d1 fd 7b 06 a9 fc 6f 07 a9 fa 67 08 a9 f8 5f 09 a9 " +
            "f6 57 0a a9 f4 4f 0b a9 fd 83 01 91 48 d0 3b d5 a9 a3 00 d1 aa bc 96 52 " +
            "e8 03 00 f9 6a 22 b0 72 3f 00 00 f1 08 15 40 f9 44 18 40 fa f8 b0 9e 52 " +
            "39 9e 98 52 b7 ac 8b 52 f3 03 02 aa a8 83 1f f8 a8 83 00 d1 f4 03 01 aa",
    ),
    arm64Gate(
        "isProEntitled@0x244680",
        "3f 23 03 d5 ff 03 03 d1 fd 7b 06 a9 fc 6f 07 a9 fa 67 08 a9 f8 5f 09 a9 " +
            "f6 57 0a a9 f4 4f 0b a9 fd 83 01 91 48 d0 3b d5 a9 83 00 d1 f3 03 00 aa " +
            "e8 07 00 f9 08 15 40 f9 a8 83 1f f8 08 00 40 f9 a9 83 1e f8 a9 63 00 d1 " +
            "a9 03 1e f8 08 91 43 f9 00 01 3f d6 e0 2b 00 b9 d9 63 87 52 ba da 99 52",
    ),
)

private val unlockProNativePatch = rawResourcePatch {
    execute {
        val soFile = runCatching { get(SO_ARM64_PATH, true) }.getOrNull()
        if (soFile == null || !soFile.exists() || !soFile.isFile) {
            logUniversal("Unlock Pro: $SO_ARM64_PATH absent — applying DEX entitlement gates only.")
            return@execute
        }

        val patched = patchArm64Gates(soFile, PRO_ARM64_GATES, "Unlock Pro")
        logUniversal("Unlock Pro: patched $patched ARM64 license gates in $SO_ARM64_PATH (BTI/PAC-safe).")
    }
}

/**
 * Mereframe 0.8.4 (vc 118) Pro unlocking requires both layers:
 * 1. Entitlement resolver (`LQu;->k` & `LQu;->m`): exposes the full `Llr;->p` feature set so
 *    all UI feature checks (`Qu.e/o/a`) resolve unlocked.
 * 2. Native license bridge (`Bf1c089...` + `0x242048`/`0x244680` in `libunnamed_raw.so`):
 *    previously unpatched, `Bf1c089.g()` (`PhotoEditActivity.k()`, `LIA.<init>()`) and
 *    `Bf1c089.d()` (`LUD.j`, `LJm`, `LUl.X`, `Lkd.run`, `LHb.h`, `Lkg.x`, `Ll6`) +
 *    `Bd3aa6ded.n5035ad` threw `SecurityException` when no Google Play receipt was cached,
 *    causing the Pro paywall popup or capture crashes.
 */
@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro features",
    description = "Unlocks all Mereframe Pro features locally across both the Kotlin entitlement " +
        "resolver (Qu.k/m) and the native license/session verifier (Bf1c089 + libunnamed_raw.so), " +
        "eliminating paywall popups and capture/editor SecurityException crashes. " +
        "Pair with 'Allow re-signed/sideloaded installs' and 'Bypass native integrity checks'.",
    default = false,
) {
    compatibleWith(MEREFRAME_COMPATIBILITY)
    dependsOn(unlockProNativePatch)

    execute {
        // 1. Owned feature set -> full registered feature set (Llr.p)
        Fingerprint(
            definingClass = "LQu;",
            name = "k",
            returnType = "Ljava/util/Set;",
            parameters = listOf("Landroid/content/Context;"),
        ).method.apply {
            ensureRegisters(3)
            clearBody()
            addInstructions(
                0,
                """
                sget-object v0, Llr;->p:LAc;
                invoke-static {v0}, LN7;->G1(Ljava/util/Collection;)Ljava/util/Set;
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
        }

        // 2. Native legacy migration status -> true
        Fingerprint(
            definingClass = "LQu;",
            name = "m",
            returnType = "Z",
            parameters = emptyList(),
        ).method.apply {
            ensureRegisters(2)
            clearBody()
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        // 3. Pro entitlement query Bf1c089.e()Z -> true
        Fingerprint(
            definingClass = BF1C089_CLASS,
            name = "e",
            returnType = "Z",
            parameters = emptyList(),
        ).method.apply {
            ensureRegisters(2)
            clearBody()
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        // 4. Pro entitlement guard Bf1c089.g()V -> no-op (stops PhotoEditActivity/LIA paywall throw)
        Fingerprint(
            definingClass = BF1C089_CLASS,
            name = "g",
            returnType = "V",
            parameters = emptyList(),
        ).method.apply {
            clearBody()
            addInstructions(0, "return-void")
        }

        // 5. Session handle validator Bf1c089.b(JJ)Z -> true (satisfies Leq.e())
        Fingerprint(
            definingClass = BF1C089_CLASS,
            name = "b",
            returnType = "Z",
            parameters = listOf("J", "J"),
        ).method.apply {
            ensureRegisters(6)
            clearBody()
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        // 6-8. Purchase/receipt validators Bf1c089.c / i / h -> true
        listOf(
            "c" to listOf("Ljava/lang/String;", "Ljava/lang/String;"),
            "i" to listOf("Ljava/lang/String;", "Ljava/lang/String;"),
            "h" to listOf(
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "J",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
            ),
        ).forEach { (methodName, params) ->
            Fingerprint(
                definingClass = BF1C089_CLASS,
                name = methodName,
                returnType = "Z",
                parameters = params,
            ).method.apply {
                val paramSlots = params.sumOf { if (it == "J" || it == "D") 2 else 1 } + 1 // +1 this
                ensureRegisters(paramSlots + 1)
                clearBody()
                addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            }
        }

        // 9. Pro session opener Bf1c089.d(Set, Li6)Leq; -> return valid Leq(1L, Lvy.u(features))
        Fingerprint(
            definingClass = BF1C089_CLASS,
            name = "d",
            returnType = "Leq;",
            parameters = listOf("Ljava/util/Set;", "Li6;"),
        ).method.apply {
            ensureRegisters(8)
            clearBody()
            addInstructionsWithLabels(
                0,
                """
                if-eqz p1, :empty
                invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z
                move-result v0
                if-nez v0, :empty
                sget-object v0, Llr;->c:Lvy;
                invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                invoke-static {p1}, Lvy;->u(Ljava/util/Set;)J
                move-result-wide v3
                new-instance v0, Leq;
                const-wide/16 v1, 0x1
                invoke-direct {v0, v1, v2, v3, v4}, Leq;-><init>(JJ)V
                return-object v0
                :empty
                new-instance v0, Ljava/lang/IllegalArgumentException;
                const-string v1, "features must not be empty"
                invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V
                throw v0
                """.trimIndent(),
            )
        }

        // 10. Paywall funnel Ul.X(MainActivity, Llr;, String, String)Z -> true
        // When Qu.k() reports every feature as owned, the paywall still calls
        // into the licensing SDK; on a re-signed build that call can fail and
        // fall through to the Pro upsell sheet. Returning true skips the upsell.
        Fingerprint(
            definingClass = "LUl;",
            name = "X",
            returnType = "Z",
            parameters = listOf(
                "Lapp/unnamed/rawrecording/MainActivity;",
                "Llr;",
                "Ljava/lang/String;",
                "Ljava/lang/String;",
            ),
        ).method.apply {
            ensureRegisters(6)
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        logUniversal("Unlock Pro: LQu.k/m, Bf1c089.* session/guard gates, native Pro checks and Ul.X paywall funnel unlocked.")
    }
}
