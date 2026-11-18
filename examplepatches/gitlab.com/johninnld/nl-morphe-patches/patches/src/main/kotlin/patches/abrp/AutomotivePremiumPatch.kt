package patches.abrp

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val CONFIG_MODULE = "Lcom/lugg/RNCConfig/RNCConfigModule;"
private const val CONFIG_MAP = "Lcom/facebook/react/bridge/WritableMap;"
private const val HASH_MAP_PUT = "Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;"

/**
 * `RNCConfigModule.getConfig()` copies every `BuildConfig` field into a map through reflection
 * and hands that map to JavaScript as the `Config` object. The app then derives
 *
 *     isAndroidAutomotive         = Config.ANDROID_AUTOMOTIVE === "true"
 *     isAndroidAutomotiveTemplate = isAndroidAutomotive && Config.USE_AUTOMOTIVE_TEMPLATES === "true"
 *
 * and `isPremiumUserSelector` returns true for the template build before it reads the account
 * roles.
 *
 * The regular build carries no `USE_AUTOMOTIVE_TEMPLATES` field, so editing existing
 * constants cannot turn the template flag on. Both entries are written into the same map
 * before the wrapper is converted to a React Native map.
 */
@Suppress("unused")
val automotivePremium = bytecodePatch(
    name = "Unlock Premium",
    description = "Makes the app treat itself as the Android Automotive template build, which " +
        "unlocks the in-app Premium features without a subscription. That decision does not read " +
        "the account roles. Anything the ABRP server authorizes per account stays as it is.",
) {
    compatibleWith(abrp)
    dependsOn(originalInput)

    execute {
        val owner = mutableClassDefBy(CONFIG_MODULE)
        val method = owner.methods.singleOrNull { candidate ->
            candidate.name == "getConfig" && candidate.returnType == CONFIG_MAP
        } ?: throw IllegalStateException("ABRP config bridge changed")

        enableAutomotivePremium(method)
    }
}

internal fun enableAutomotivePremium(method: MutableMethod) {
    val implementation = method.implementation
        ?: throw IllegalStateException("ABRP config bridge has no code")

    // Find the native store of the reflected map into the outer "config" map.
    val store = (0 until implementation.instructions.size - 1).singleOrNull { index ->
        val key = method.getInstruction(index)
        val put = method.getInstruction(index + 1)
        key.opcode == Opcode.CONST_STRING &&
            (key as? ReferenceInstruction)?.reference?.let { it as? StringReference }?.string == "config" &&
            put.opcode == Opcode.INVOKE_VIRTUAL &&
            (put as? ReferenceInstruction)?.reference?.toString() == HASH_MAP_PUT
    } ?: throw IllegalStateException("ABRP config map assembly changed")

    // Format 35c encodes receiver/key/value in C/D/E, even for a three-argument call.
    val put = method.getInstruction<FiveRegisterInstruction>(store + 1)
    check(put.registerCount == 3 && put.registerD == 0 &&
        put.registerC !in 0..1 && put.registerE !in 0..1 && put.registerC != put.registerE) {
        "ABRP config map registers changed"
    }
    val reflected = "v${put.registerE}"

    // The loop branches directly to the original "config" constant. Inserting before
    // that label would be skipped on the normal path. Mutate the same nested map after
    // it is stored, before the outer map is converted to WritableMap.
    method.addInstructions(
        store + 2,
        """
            const-string v0, "ANDROID_AUTOMOTIVE"
            const-string v1, "true"
            invoke-virtual {$reflected, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
            const-string v0, "USE_AUTOMOTIVE_TEMPLATES"
            invoke-virtual {$reflected, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
        """.trimIndent(),
    )
}
