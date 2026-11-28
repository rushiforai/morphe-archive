package app.whatsapp.patches.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import app.morphe.patcher.util.addFreeRegisters
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

private const val EXTENSION_CLASS = "Lapp/whatsapp/extension/PatchSettingsExtension;"

/**
 * Matches WhatsApp's boolean AB-Prop resolver method containing "Unknown BooleanField".
 */
object PropsBooleanFingerprint : Fingerprint(
    returnType = "Z",
    filters = listOf(
        string("Unknown BooleanField", StringComparisonType.CONTAINS),
    )
)

/**
 * Matches WhatsApp's integer AB-Prop resolver method containing "Unknown IntField".
 */
object PropsIntFingerprint : Fingerprint(
    returnType = "I",
    filters = listOf(
        string("Unknown IntField", StringComparisonType.CONTAINS),
    )
)

/**
 * Computes the Dalvik parameter register name (e.g. "p1") for the last `I` parameter.
 */
private fun MutableMethod.findLastIntParamRegister(): String? {
    val params = parameters
    val intIdx = params.indexOfLast { it.type == "I" }
    if (intIdx < 0) return null

    var reg = if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    for (i in 0 until intIdx) {
        val t = params[i].type
        reg += if (t == "J" || t == "D") 2 else 1
    }
    return "p$reg"
}

/**
 * Shared internal patch that connects WhatsApp's AB-Prop getters to
 * [PatchSettingsExtension] so runtime SharedPreferences toggles control
 * both Meta AI and Promotional/Ads flags.
 */
val propsHookPatch = patch {
    extendWith("extensions/extension.mpe")

    execute {
        PropsBooleanFingerprint.methodOrNull?.let { method ->
            val propReg = method.findLastIntParamRegister() ?: return@let
            val freeReg = runCatching {
                method.getFreeRegisterProvider(0, 1).getFreeRegister4Bit()
            }.getOrNull()

            if (freeReg != null) {
                method.addInstructions(
                    0,
                    """
                        invoke-static/range { $propReg .. $propReg }, $EXTENSION_CLASS->overrideBooleanProp(I)I
                        move-result v$freeReg
                        if-ltz v$freeReg, :morphe_orig_bool
                        return v$freeReg
                        :morphe_orig_bool
                        nop
                    """
                )
            } else {
                val firstFree = method.implementation!!.registerCount
                val (cloned, _) = method.addFreeRegisters(1)
                cloned.addInstructions(
                    0,
                    """
                        invoke-static/range { $propReg .. $propReg }, $EXTENSION_CLASS->overrideBooleanProp(I)I
                        move-result v$firstFree
                        if-ltz v$firstFree, :morphe_orig_bool
                        return v$firstFree
                        :morphe_orig_bool
                        nop
                    """
                )
            }
        }

        PropsIntFingerprint.methodOrNull?.let { method ->
            val propReg = method.findLastIntParamRegister() ?: return@let
            val provider = runCatching {
                method.getFreeRegisterProvider(0, 2)
            }.getOrNull()

            val freeReg = runCatching { provider?.getFreeRegister4Bit() }.getOrNull()
            val markerReg = runCatching { provider?.getFreeRegister4Bit() }.getOrNull()

            if (freeReg != null && markerReg != null) {
                method.addInstructions(
                    0,
                    """
                        invoke-static/range { $propReg .. $propReg }, $EXTENSION_CLASS->overrideIntProp(I)I
                        move-result v$freeReg
                        const v$markerReg, -0x80000000
                        if-eq v$freeReg, v$markerReg, :morphe_orig_int
                        return v$freeReg
                        :morphe_orig_int
                        nop
                    """
                )
            }
        }
    }
}
