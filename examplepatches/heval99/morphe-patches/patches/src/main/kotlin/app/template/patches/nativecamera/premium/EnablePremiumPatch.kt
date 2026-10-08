package app.template.patches.nativecamera.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.nativecamera.misc.license.disableLicenseCheckPatch
import app.template.patches.shared.Constants.COMPATIBILITY_NATIVECAMERA
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val PREMIUM_KEY = "is_premium"
private val PREFS_HELPER_PARAMS = listOf("Landroid/content/SharedPreferences;", "Ljava/lang/String;", "Z")

/** Index of the first static (SharedPreferences, String, Z) helper call after the premium key. */
private fun MutableMethod.prefsHelperCallAfterKey(returnsVoid: Boolean): Int {
    val insns = implementation!!.instructions.toList()
    val keyIndex = insns.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == PREMIUM_KEY
    }
    if (keyIndex < 0) throw PatchException("\"$PREMIUM_KEY\" not found in $name")
    val callIndex = (keyIndex + 1 until insns.size).firstOrNull { i ->
        val ref = (insns[i] as? ReferenceInstruction)?.reference as? MethodReference
        insns[i].opcode == Opcode.INVOKE_STATIC && ref != null &&
            ref.parameterTypes.map(CharSequence::toString) == PREFS_HELPER_PARAMS &&
            (ref.returnType == "V") == returnsVoid
    } ?: throw PatchException("No prefs helper call after \"$PREMIUM_KEY\" in $name")
    return callIndex
}

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Unlocks Native Camera premium (RAW DNG, 10-bit/HLG/UHDR video, boosted " +
            "modes and the higher bitrate cap). Premium is a local flag; the license check is " +
            "disabled as well so the patched app starts."
) {
    compatibleWith(COMPATIBILITY_NATIVECAMERA)

    dependsOn(disableLicenseCheckPatch)

    execute {
        val setter = SetPremiumFingerprint.method
        val init = PremiumInitFingerprint.method

        // The setter's persist call gives us the app's own "write boolean pref" helper.
        val persist = (setter.implementation!!.instructions.toList()[setter.prefsHelperCallAfterKey(returnsVoid = true)]
            as ReferenceInstruction).reference as MethodReference

        // Cold start: persist is_premium = true right before the constructor reads it, so the
        // StateFlow starts true even when an earlier run stored false. The default-value
        // register is restored afterwards because R8 may reuse it as a constant later on.
        val readIndex = init.prefsHelperCallAfterKey(returnsVoid = false)
        val read = init.implementation!!.instructions.toList()[readIndex] as? FiveRegisterInstruction
            ?: throw PatchException("Premium read uses an unexpected invoke form")
        val defaultRegister = read.registerE
        val defaultLiteral = init.implementation!!.instructions.toList()
            .subList(0, readIndex)
            .lastOrNull { it is OneRegisterInstruction && it.registerA == defaultRegister }
            .let { it as? NarrowLiteralInstruction }
            ?.narrowLiteral
            ?: throw PatchException("Premium read default is not a constant")
        val persistSignature = "${persist.definingClass}->${persist.name}(${persist.parameterTypes.joinToString("")})V"
        init.addInstructions(
            readIndex,
            """
                const/4 v$defaultRegister, 0x1
                invoke-static {v${read.registerC}, v${read.registerD}, v$defaultRegister}, $persistSignature
                const/4 v$defaultRegister, $defaultLiteral
            """.trimIndent()
        )

        // Later billing results can never downgrade the entitlement (or reset premium features).
        setter.addInstructions(0, "const/4 p1, 0x1")
    }
}
