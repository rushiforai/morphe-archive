/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.haptics

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val HAPTICS = "$EXTENSION_PACKAGE/misc/Haptics;"
internal const val VOIP = "Lorg/telegram/messenger/voip/"
private val VIRTUAL = setOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)

/** Each buzz Telegram asks for, and the extension method that answers it with the same registers. */
internal val HAPTIC_CALLS = mapOf(
    "Landroid/view/View;->performHapticFeedback(I)Z" to "$HAPTICS->tap(Landroid/view/View;I)Z",
    "Landroid/view/View;->performHapticFeedback(II)Z" to "$HAPTICS->tapWithFlags(Landroid/view/View;II)Z",
    "Landroid/os/Vibrator;->vibrate(J)V" to "$HAPTICS->buzz(Landroid/os/Vibrator;J)V",
    "Landroid/os/Vibrator;->vibrate([JI)V" to "$HAPTICS->buzzPattern(Landroid/os/Vibrator;[JI)V",
    "Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;)V" to "$HAPTICS->buzzEffect(Landroid/os/Vibrator;Landroid/os/VibrationEffect;)V",
    "Landroid/os/Vibrator;->vibrate(Landroid/os/VibrationEffect;Landroid/os/VibrationAttributes;)V" to
        "$HAPTICS->buzzEffectWith(Landroid/os/Vibrator;Landroid/os/VibrationEffect;Landroid/os/VibrationAttributes;)V",
)

@Suppress("unused")
val noHapticsPatch = bytecodePatch(
    name = "Turn off haptic feedback",
    description = "Stops Telegram from vibrating for taps, long presses, swipes and wrong entries. Calls and " +
        "notifications still vibrate. Starts off. Turn it on in HushTelegram settings > Chats.",
    default = true,
) {
    category("Interface")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val site = resolveNoHaptics()
        // Assembled on copies first, so a refusal leaves the app untouched.
        site.calls.forEach { (method, indices) -> site.replace(MutableMethod(ImmutableMethod.of(method)), indices) }
        site.calls.forEach { (method, indices) -> site.replace(method, indices) }
        enableStatus("noHaptics")
    }
}

/** Every method outside calls that asks the phone to vibrate, with the indices of those asks. */
internal class NoHapticsSite(val calls: List<Pair<MutableMethod, List<Int>>>) {
    fun replace(target: MutableMethod, indices: List<Int>) {
        for (index in indices) {
            val call = target.getInstruction(index)
            val hook = HAPTIC_CALLS.getValue(call.controlRef()!!)
            val registers = call.namedRegisters()
            target.replaceInstruction(index, if (call.opcode == Opcode.INVOKE_VIRTUAL_RANGE) {
                "invoke-static/range {v${registers.first()} .. v${registers.last()}}, $hook"
            } else {
                "invoke-static {${registers.joinToString { "v$it" }}}, $hook"
            })
        }
    }
}

/**
 * Telegram vibrates through View.performHapticFeedback for taps, long presses and swipes, and
 * through Vibrator.vibrate for wrong codes, full selections and mini apps. The ringing of an
 * incoming call lives in the voip package and stays stock.
 */
internal fun BytecodePatchContext.resolveNoHaptics(): NoHapticsSite {
    requireStatusMethod("noHaptics")
    for (hook in HAPTIC_CALLS.values) {
        val name = hook.substringAfter("->").substringBefore("(")
        val parameters = Regex("\\[?(?:L[^;]+;|[ZBSCIJFD])").findAll(hook.substringAfter("(").substringBefore(")")).map { it.value }.toList()
        controlHook(HAPTICS, name, parameters, hook.substringAfter(")"))
    }

    val found = mutableListOf<Triple<String, String, List<Int>>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/") || cls.type.startsWith(VOIP)) return@classDefForEach
        cls.methods.forEach { method ->
            val body = method.controlBody()
            // A super call inside an override stays, since the override itself is what gets asked.
            val indices = body.indices.filter { body[it].opcode in VIRTUAL && body[it].controlRef() in HAPTIC_CALLS }
            if (indices.isNotEmpty()) found += Triple(cls.type, signature(method), indices)
        }
    }
    controlShape(found.sumOf { it.third.size } >= 100, "Telegram no longer asks for haptic feedback the usual way")
    return NoHapticsSite(found.map { (type, wanted, indices) -> mutableClassDefBy(type).methods.single { signature(it) == wanted } to indices })
}

private fun signature(method: Method) = "${method.name}${method.parameterTypes.joinToString("", "(", ")")}${method.returnType}"
