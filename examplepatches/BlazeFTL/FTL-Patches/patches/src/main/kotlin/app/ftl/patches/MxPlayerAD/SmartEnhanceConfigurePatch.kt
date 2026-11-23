package app.ftl.patches.mxplayerad

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.InstructionLocation.MatchAfterWithin
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.opcode
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.getFreeRegisterProvider
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Target: ActivityScreen toggle method (3.4.0: "Ha"; next build: "ya"). Name is R8, never pinned.
// How to find it again: the only ActivityScreen ()V method containing the string "enhanceEnabled"
// (same method also holds the sget of R field "smart_enhance_disabled" - R field names are not obfuscated).
//
// Shape in the next build (obfuscated names in brackets, all read off instructions, none pinned):
//   [0] sget-boolean   b6f.q:Z          flag flipped by the toggle (sget-boolean + if-eqz pair)
//   [1] if-eqz         -> disable branch
//   [2] iget-object    this.I           player controls field
//   [3] invoke-virtual o.x1(I)V         enable effect
//       const/4        (arg reload, only present when registers are tight)
//   [4] invoke-virtual this.i8(I)V      <- insertion point is right after this
//       new-instance / const-string "enhanceEnabled" ... analytics + animation (left dead)
//   [6] sget           cah.smart_enhance_disabled:I   (R class name is R8, field name is real)
//       const/4        false reload
//   [7] invoke-static  svk.d(Context,I,Z)V            toast helper, SDK-typed signature
//   [8] return-void
//
// Differences from 3.4.0: first filter is no longer invoke-virtual/range (p0 now fits in 4 bits),
// and the const/4 -1 sentinel moved into the disable branch, so neither is used as an anchor.
private const val SMART_ENHANCE_TOAST_KEY = "smart_enhance_toast"
private const val SMART_ENHANCE_ENABLED_FIELD = "smart_enhance_enabled"

internal object SmartEnhanceToggleFingerprint : Fingerprint(
    definingClass = "Lcom/mxtech/videoplayer/ActivityScreen;",
    returnType = "V",
    parameters = emptyList(),
    filters = listOf(
        opcode(Opcode.SGET_BOOLEAN),
        opcode(Opcode.IF_EQZ, location = MatchAfterImmediately()),
        opcode(Opcode.IGET_OBJECT, location = MatchAfterImmediately()),
        opcode(Opcode.INVOKE_VIRTUAL, location = MatchAfterImmediately()),
        opcode(Opcode.INVOKE_VIRTUAL, location = MatchAfterWithin(1)),
        string("enhanceEnabled", location = MatchAfterWithin(40)),
        fieldAccess(
            name = "smart_enhance_disabled",
            opcode = Opcode.SGET,
            location = MatchAfterWithin(300),
        ),
        opcode(Opcode.INVOKE_STATIC, location = MatchAfterWithin(1)),
        opcode(Opcode.RETURN_VOID, location = MatchAfterImmediately()),
    ),
)

val configureSmartEnhanceToastPatch = bytecodePatch(
    name = "Configure Smart Enhance",
    description = "Removes the Smart Enhance disable toast and adds Mod Settings switches for the intro popup and the enable toast.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MX_PLAYER_AD)
    dependsOn(disableSmartEnhancePopupPatch, modSettingsPatch, modSettingFlagPatch(SMART_ENHANCE_TOAST_KEY))

    execute {
        val matches = SmartEnhanceToggleFingerprint.instructionMatches
        val method = SmartEnhanceToggleFingerprint.method

        val insertIndex = matches[4].index + 1
        val disabledIdRef = matches[6].getInstruction<ReferenceInstruction>().reference as FieldReference
        val disabledToastRef = matches[7].getInstruction<ReferenceInstruction>().reference as MethodReference

        val toastMethod = "${disabledToastRef.definingClass}->${disabledToastRef.name}(" +
            disabledToastRef.parameterTypes.joinToString("") { it.toString() } +
            ")${disabledToastRef.returnType}"

        val enabledIdExists = classDefByOrNull(disabledIdRef.definingClass)
            ?.fields?.any { it.name == SMART_ENHANCE_ENABLED_FIELD } == true
        val enabledIdField = "${disabledIdRef.definingClass}->$SMART_ENHANCE_ENABLED_FIELD:${disabledIdRef.type}"

        val thisRegister = method.implementation!!.registerCount - method.parameters.size - 1
        val free = method.getFreeRegisterProvider(insertIndex, 3, thisRegister)
        val keyReg = free.getFreeRegister4Bit()
        val idReg = free.getFreeRegister4Bit()
        val flagReg = free.getFreeRegister4Bit()

        val enabledToast = if (enabledIdExists) {
            """
                sget v$idReg, $enabledIdField
                const/4 v$flagReg, 0x0
                invoke-static {p0, v$idReg, v$flagReg}, $toastMethod
            """.trimIndent()
        } else {
            """
                const-string v$idReg, "Smart Enhance Enabled"
                const/4 v$flagReg, 0x0
                invoke-static {p0, v$idReg, v$flagReg}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;
                move-result-object v$idReg
                invoke-virtual {v$idReg}, Landroid/widget/Toast;->show()V
            """.trimIndent()
        }

        method.removeInstructions(matches[6].index, matches[7].index - matches[6].index + 1)

        method.addInstructionsWithLabels(
            insertIndex,
            """
                const-string v$keyReg, "$SMART_ENHANCE_TOAST_KEY"
                invoke-static {v$keyReg}, $MOD_SETTINGS_CLASS->get(Ljava/lang/String;)Z
                move-result v$keyReg
                if-eqz v$keyReg, :silent
                $enabledToast
                :silent
                return-void
            """.trimIndent(),
        )
    }
}
