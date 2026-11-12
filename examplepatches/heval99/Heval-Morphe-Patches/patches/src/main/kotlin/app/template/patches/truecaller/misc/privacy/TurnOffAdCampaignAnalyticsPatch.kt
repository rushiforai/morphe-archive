package app.template.patches.truecaller.misc.privacy

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// The Privacy Center toggle's backing preference ("Ad Campaign Analytics" in the UI). It is read
// through a generic getBoolean(settings, key, default) helper in three places: the settings row
// state (mfi.c), the verified-campaign clickstream gate (py5.c) and the carousel clickstream gate
// (iz80.a). The toggle writer (r4y.onCheckedChanged) uses putBoolean and is left alone.
private const val VC_EVENTS_KEY = "biz_privacy_vc_events"

/**
 * "Ad Campaign Analytics" (#125): Truecaller's Privacy Center row "Share analytics with verified
 * businesses on my interactions with ad campaigns" is on by default. Turning it off by default
 * means the three getBoolean reads above must pass `false` as their fallback; the toggle stays
 * usable, so the user can still opt in (and putBoolean keeps storing the choice).
 *
 * Each read is the first static getBoolean after the key is loaded (the key register unchanged in
 * between). R8 shares the fallback constant between reads (the settings-state mapper keeps one
 * `const/4 v8, 0x1` for several preferences and reads it again afterwards), so the patch does not
 * rewrite that register for good: it passes `false` for this read and restores the register right
 * after the call (see overrideFallback). Fixed 2026-11-07: the first version wrote 0 into the shared
 * register, which also changed a later state value in mfi.c (`move/from16 v16, v8`).
 */
@Suppress("unused")
val turnOffAdCampaignAnalyticsPatch = bytecodePatch(
    name = "Turn off Ad Campaign Analytics",
    description = "Turns the \"Ad Campaign Analytics\" privacy toggle off by default. You can still " +
        "turn it on in Settings > Privacy Center.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    execute {
        // Collect first: mutating classes while iterating them is not allowed.
        val readers = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                if (method.readsVcEventsDefault()) readers += classDef to method
            }
        }
        if (readers.size != 3) throw PatchException(
            "expected the three \"$VC_EVENTS_KEY\" getBoolean readers, found ${readers.size}: " +
                readers.joinToString { (classDef, method) -> "${classDef.type}->${method.name}" },
        )

        for ((classDef, method) in readers) {
            val mutable = mutableClassDefBy(classDef).methods.single {
                it.name == method.name && it.returnType == method.returnType &&
                    it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
            }
            try {
                mutable.defaultVcEventsToOff("${classDef.type}->${method.name}")
            } catch (e: PatchException) {
                throw PatchException("${classDef.type}->${method.name}: ${e.message ?: "no detail"}", e)
            }
        }
    }
}

/** True for a method that reads the preference through the generic getBoolean helper. */
private fun Method.readsVcEventsDefault(): Boolean {
    val insns = implementation?.instructions?.toList() ?: return false
    val keyIndex = insns.indexOfFirst { it.stringOrNull() == VC_EVENTS_KEY }
    if (keyIndex < 0) return false
    val keyRegister = (insns[keyIndex] as OneRegisterInstruction).registerA
    return insns.vcEventsRead(keyIndex, keyRegister) != null
}

/** Passes `false` as the getBoolean fallback of the VC-events read in this method. */
private fun MutableMethod.defaultVcEventsToOff(label: String) {
    val insns = instructions.toList()
    val keyIndex = insns.indexOfFirst { it.stringOrNull() == VC_EVENTS_KEY }
    if (keyIndex < 0) throw PatchException("$label: the \"$VC_EVENTS_KEY\" string is gone")
    val keyRegister = (insns[keyIndex] as OneRegisterInstruction).registerA

    // The read after the key load whose second register (settings, key, boolean) still holds it.
    val call = insns.vcEventsRead(keyIndex, keyRegister)
        ?: throw PatchException("$label: no getBoolean call reads v$keyRegister as its key after the load")
    overrideFallback(call, "$label VC-events default") { v ->
        val register = v.removePrefix("v").toInt()
        "${if (register < 16) "const/4" else "const/16"} $v, 0x0"
    }
}

/** The first static getBoolean after [keyIndex] reading [keyRegister] as its key, if the register still holds it. */
private fun List<Instruction>.vcEventsRead(keyIndex: Int, keyRegister: Int): Int? {
    for (index in keyIndex + 1 until size) {
        val insn = this[index]
        if (insn.getBooleanCall() != null && insn.keyArgument() == keyRegister) return index
        if (insn.opcode.setsRegister() && (insn as? OneRegisterInstruction)?.registerA == keyRegister) return null
        if (insn.opcode in setOf(Opcode.RETURN, Opcode.RETURN_OBJECT, Opcode.RETURN_VOID, Opcode.THROW,
                Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)) return null
    }
    return null
}

private fun Instruction.keyArgument(): Int = when (this) {
    is FiveRegisterInstruction -> if (registerCount == 3) registerD else -1
    is RegisterRangeInstruction -> if (registerCount == 3) startRegister + 1 else -1
    else -> -1
}

/**
 * The generic settings boolean getter: a static `(settings, String key, boolean fallback)Z` call.
 * Both the holder class and the method name are R8-renamed, so it is found by shape; the key
 * string on the call site ties it to this preference.
 */
private fun Instruction.getBooleanCall(): MethodReference? {
    if (opcode != Opcode.INVOKE_STATIC && opcode != Opcode.INVOKE_STATIC_RANGE) return null
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    if (reference.returnType != "Z") return null
    val params = reference.parameterTypes.map(CharSequence::toString)
    if (params.size != 3 || params[1] != "Ljava/lang/String;" || params[2] != "Z") return null
    if (!params[0].startsWith("L") || params[0] == "Ljava/lang/String;") return null
    return reference
}

private fun Instruction.stringOrNull(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
