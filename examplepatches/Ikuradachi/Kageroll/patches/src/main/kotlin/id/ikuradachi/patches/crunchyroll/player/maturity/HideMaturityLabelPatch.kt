package id.ikuradachi.patches.crunchyroll.player.maturity

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import id.ikuradachi.patches.crunchyroll.shared.Constants.COMPATIBILITY_CRUNCHYROLL

@Suppress("unused")
val hideMaturityLabelPatch = bytecodePatch(
    name = "Hide maturity rating overlay",
    description = "Hides the maturity rating overlay when starting or resuming playback.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_CRUNCHYROLL)
    category("Player")

    execute {
        val ctorMatch = MaturityLabelDataProviderConstructorFingerprint.matchAll(1..1).single()
        val coroutineClass = (ctorMatch.instructionMatches[1].instruction as ReferenceInstruction)
            .reference
            .toString()

        val visibilityMatch = createMaturityLabelVisibilityFingerprint(coroutineClass)
            .matchAll(1..1)
            .single()
        val implementation = requireNotNull(visibilityMatch.method.implementation) {
            "Missing implementation for maturity label visibility flow"
        }
        check(implementation.registerCount >= 1) {
            "Unexpected register count in maturity label visibility flow: ${implementation.registerCount}"
        }

        visibilityMatch.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """.trimIndent(),
        )
    }
}
