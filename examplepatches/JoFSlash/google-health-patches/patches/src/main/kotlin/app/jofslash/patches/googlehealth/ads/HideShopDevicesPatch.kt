package app.jofslash.patches.googlehealth.ads

import app.jofslash.patches.googlehealth.shared.Constants.COMPATIBILITY_GOOGLE_HEALTH
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11n
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** The page the Shop devices button opens. */
private const val SHOP_URL = "https://store.google.com/category/watches_trackers"

/** How far after the tab check the button's click handler is created. */
private const val MAX_DISTANCE = 40

private fun Method.strings() = (implementation?.instructions ?: emptyList()).mapNotNull {
    if (it.opcode != Opcode.CONST_STRING && it.opcode != Opcode.CONST_STRING_JUMBO) null
    else ((it as ReferenceInstruction).reference as StringReference).string
}

private fun Instruction.fieldOf(type: String): FieldReference? {
    if (opcode != Opcode.SGET_OBJECT) return null
    val field = (this as ReferenceInstruction).reference as FieldReference
    return field.takeIf { it.definingClass == type && it.type == type }
}

private fun Instruction.newInstanceOf(types: Set<String>) =
    opcode == Opcode.NEW_INSTANCE && ((this as ReferenceInstruction).reference as TypeReference).type in types

@Suppress("unused")
val hideShopDevicesPatch = bytecodePatch(
    name = "Hide Shop devices",
    description = "Hides the Shop devices button on the Connections screen, which opens the Google Store.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_GOOGLE_HEALTH)

    execute {
        // The Connections screen has two tabs (an obfuscated enum of CONNECTIONS and PARTNER_APPS).
        // The button is drawn only when the tab is CONNECTIONS, and its click handler opens SHOP_URL.
        var tabEnum: ClassDef? = null
        val shopHandlers = mutableSetOf<String>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val strings = method.strings()
                if (method.name == "<clinit>" && strings == listOf("CONNECTIONS", "PARTNER_APPS")) {
                    tabEnum = classDef
                }
                if (SHOP_URL in strings) shopHandlers += classDef.type
            }
        }
        val tabType = tabEnum?.type ?: throw PatchException("Couldn't find the Connections tabs")
        if (shopHandlers.isEmpty()) throw PatchException("Couldn't find the Shop devices click handler")
        val connections = tabEnum!!.staticFields.firstOrNull { it.type == tabType }?.name
            ?: throw PatchException("Couldn't find the CONNECTIONS tab")

        // Find "tab == CONNECTIONS" right before the click handler is made.
        val hits = mutableListOf<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val found = instructions.indices.any { i ->
                    instructions[i].fieldOf(tabType)?.name == connections &&
                            instructions.drop(i + 1).take(MAX_DISTANCE).any { it.newInstanceOf(shopHandlers) }
                }
                if (found) hits += classDef to method
            }
        }
        if (hits.size != 1) throw PatchException("Expected one Shop devices button, found ${hits.size}")

        val (classDef, method) = hits.single()
        val mutableMethod = mutableClassDefBy(classDef).methods.first {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }
        val instructions = mutableMethod.implementation!!.instructions.toList()
        val index = instructions.indices.first { i ->
            instructions[i].fieldOf(tabType)?.name == connections &&
                    instructions.drop(i + 1).take(MAX_DISTANCE).any { it.newInstanceOf(shopHandlers) }
        }
        // Compare the tab with null instead, which it never is, so the button is never drawn.
        val register = (instructions[index] as OneRegisterInstruction).registerA
        mutableMethod.replaceInstruction(index, BuilderInstruction11n(Opcode.CONST_4, register, 0))
    }
}
