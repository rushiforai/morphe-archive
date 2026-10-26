package app.apppatches.patches.netmonster

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.apppatches.patches.shared.Constants.NETMONSTER_COMPATIBILITY
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n

@Suppress("unused")
val netMonsterUnlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium features.",
    default = true
) {
    compatibleWith(NETMONSTER_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // ── Layer 1: isPremium flow → always emit true ────────────────────────
        // lwtw.emit() maps the Adapty subscription list to Boolean. Its first
        // const/4 initializes the result to false; forcing it to true makes the
        // StateFlow premium even when the subscription list is empty.
        SubscriptionActiveFlowFingerprint.match().method.apply {
            val methodImplementation = implementation
                ?: throw PatchException("Subscription flow collector has no implementation")
            val index = methodImplementation.instructions.indexOfFirst {
                (it as? BuilderInstruction11n)?.narrowLiteral == 0
            }
            if (index == -1) {
                throw PatchException("Could not find premium flag initializer")
            }
            val instruction = methodImplementation.instructions[index] as BuilderInstruction11n
            replaceInstruction(
                index,
                BuilderInstruction11n(Opcode.CONST_4, instruction.registerA, 1)
            )
        }

        // ── Layer 2: Settings "Active/Inactive" display ───────────────────────
        // More screen renders "Active till ..." only when the expiry is non-null.
        // Inject a far-future date when the subscription list is empty.
        SubscriptionExpiryDisplayFingerprint.match().method.addInstructions(
            0,
            """
            move-object/from16 v2, p0
            if-nez v2, :skip_expiry
            sget-object v0, Ljava/time/ZoneOffset;->UTC:Ljava/time/ZoneOffset;
            invoke-static {v0}, Ljava/time/OffsetDateTime;->now(Ljava/time/ZoneId;)Ljava/time/OffsetDateTime;
            move-result-object v2
            const-wide/16 v0, 0x32
            invoke-virtual {v2, v0, v1}, Ljava/time/OffsetDateTime;->plusYears(J)Ljava/time/OffsetDateTime;
            move-result-object v2
            move-object/from16 p0, v2
            :skip_expiry
            """.trimIndent()
        )

        // ── Layer 3: PairIP license check → no-op ─────────────────────────────
        // Repacked APKs are not recognized as Play installations. Skipping the
        // check avoids the paywall/exit path before the app starts.
        PairIpLicenseCheckFingerprint.match().method.addInstructions(0, "return-void")

        // ── Layer 4: Google Maps cert/API key spoof ───────────────────────────
        // After patching, the APK cert changes → Google Maps SDK cert mismatch.
        // NetMonsterHelper.init() installs a PackageManager proxy that returns the
        // original cert and API key (com.google.android.geo.API_KEY) for this package.
        NetMonsterAppOnCreateFingerprint.match().method.addInstructions(
            0,
            "invoke-static {}, Lapp/apppatches/extension/NetMonsterHelper;->init()V"
        )
    }
}
