package app.insane96.patches.pinterest.ads

import app.insane96.patches.shared.Constants.COMPATIBILITY_PINTEREST
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel

// Pin model class ("me"). Its Y5() accessor returns the "is_promoted" JSON field as a
// Boolean that is never null (defaults to Boolean.FALSE), see me.java in the decompiled
// sources: `public final Boolean Y5() { return this.C1 == null ? Boolean.FALSE : this.C1; }`.
private const val PIN_CLASS = "Lcom/pinterest/api/model/me;"

@Suppress("unused")
val hidePromotedPinsPatch = bytecodePatch(
    name = "Hide promoted pins",
    description = "Removes promoted (ad) Pins from the home feed, search results and related Pins.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_PINTEREST)

    execute {
        // Filter index 2 is the opcode(INVOKE_INTERFACE) match: the List.add() call that
        // appends every deserialized Pin (organic or ad) to the result list.
        val addCallIndex = PinListFingerprint.instructionMatches[2].index
        val method = PinListFingerprint.method
        // The instruction right after the add() call (the loop's index increment), used as
        // the jump target when we skip adding a promoted Pin.
        val afterAddInstruction = method.instructions[addCallIndex + 1]

        // Right before the original add() call, v4 holds the just-deserialized Pin and v0
        // holds the result ArrayList (see PinDeserializer.c() bytecode). Skip the add() call
        // entirely when the Pin is promoted (an ad).
        method.addInstructionsWithLabels(
            addCallIndex,
            """
                invoke-virtual {v4}, $PIN_CLASS->Y5()Ljava/lang/Boolean;
                move-result-object v5
                invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z
                move-result v5
                if-nez v5, :skip_ad
            """,
            ExternalLabel("skip_ad", afterAddInstruction)
        )
    }
}
