package app.xfeedcleanup.patches.x

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val SPORTS_PILL_FLAG = "x_lite_sports_live_game_pill_enabled"
private const val FEATURE_SWITCH_REPOSITORY = "Lcom/x/featureswitches/FeatureSwitchesRepository;"

// Confirmed against *actual* X 12.31 and 12.32 DEX:
// com/x/spaces/bar/n.f(...): spots the SPORTS_PILL_FLAG immediately before
// FeatureSwitchesRepository.getBoolean(String, boolean).
// In both versions: const-string at code unit 354, invoke-interface at 356,
// move-result v12 at 359, if-eqz v12 at 360. The other independent feature
// switch, x_lite_livestream_pill_enabled, must be left untouched.
private object LiveSportsPillFlagFingerprint : Fingerprint(
    definingClass = "Lcom/x/spaces/bar/n;",
    name = "f",
    returnType = "Lcom/x/spaces/model/d;",
    strings = listOf(SPORTS_PILL_FLAG),
    custom = { method, _ ->
        val params = method.parameterTypes.map { it.toString() }
        params.size == 3 && params.first().startsWith("Lcom/x/http/spaces/") &&
            params.drop(1) == listOf("Ljava/util/Map;", "Ljava/util/Map;")
    },
)

private object HideSportsScoresExtensionFingerprint : Fingerprint(
    definingClass = FILTER_CLASS,
    name = "hideSportsScores",
)

@Suppress("unused")
val hideSportsScoresPatch = bytecodePatch(
    name = "Hide sports scores",
    description = "Experimental: hides live sports game pills at the top of X Home, preserving live-stream pills.",
) {
    compatibleWith(COMPATIBILITY_X)
    dependsOn(recommendationFilterPatch)

    execute {
        // Retain the existing ScoreCard tile filter for timeline-inserted game cards.
        HideSportsScoresExtensionFingerprint.method.returnEarly(true)

        // The Home header's game pill is NOT rendered through the timeline cache/store hook.
        // Override only the sports game's feature-switch result before its dedicated
        // if-eqz branch; do not change the shared FeatureSwitchesRepository or other pills.
        LiveSportsPillFlagFingerprint.method.apply {
            val opcodes = instructions
            val flagMatches = opcodes.indices.filter { index ->
                val instruction = opcodes[index]
                instruction.opcode == Opcode.CONST_STRING &&
                    ((instruction as? ReferenceInstruction)?.reference as? StringReference)
                        ?.string == SPORTS_PILL_FLAG
            }
            check(flagMatches.size == 1) {
                "Expected exactly one sports live-game pill flag, got ${flagMatches.size}"
            }
            val flagIndex = flagMatches.single()
            val flagRegister = getInstruction<OneRegisterInstruction>(flagIndex).registerA

            val featureSwitchCall = opcodes.getOrNull(flagIndex + 1)
            val ref = (featureSwitchCall as? ReferenceInstruction)?.reference as? MethodReference
            check(featureSwitchCall?.opcode == Opcode.INVOKE_INTERFACE &&
                ref?.definingClass == FEATURE_SWITCH_REPOSITORY &&
                ref?.name == "getBoolean" &&
                ref?.returnType == "Z" &&
                ref?.parameterTypes?.map { it.toString() } == listOf("Ljava/lang/String;", "Z")) {
                "Sports pill feature-switch call changed: fail closed at build time"
            }

            val invokeRegisters = featureSwitchCall as? FiveRegisterInstruction
            check(invokeRegisters != null && invokeRegisters.registerCount == 3 &&
                invokeRegisters.registerD == flagRegister) {
                "Sports pill flag not passed as getBoolean string argument"
            }

            val resultIndex = flagIndex + 2
            check(opcodes.getOrNull(resultIndex)?.opcode == Opcode.MOVE_RESULT) {
                "Sports pill feature-switch result changed: fail closed at build time"
            }
            val resultRegister = getInstruction<OneRegisterInstruction>(resultIndex).registerA
            check(resultRegister <= 15) { "const/4 cannot address sports pill result register $resultRegister" }
            val skipBranch = opcodes.getOrNull(resultIndex + 1)
            check(skipBranch?.opcode == Opcode.IF_EQZ &&
                (skipBranch as? OneRegisterInstruction)?.registerA == resultRegister) {
                "Sports pill no longer skips rendering when the feature switch is false"
            }

            // Insert *after* move-result (not between invoke and move-result).
            addInstructions(resultIndex + 1, "const/4 v$resultRegister, 0x0")
        }
    }
}
