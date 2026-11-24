package app.jofslash.patches.listonic.navigation

import app.jofslash.patches.listonic.shared.Constants.COMPATIBILITY_LISTONIC
import app.jofslash.patches.listonic.shared.methodsWithStrings
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction21c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// The name of the icon of the bottom bar's Food facts tab ("ProductHub").
private const val PRODUCT_HUB_ICON = "Producthub"

@Suppress("unused")
val hideFoodFactsPatch = bytecodePatch(
    name = "Hide Food facts",
    description = "Hides the Food facts tab that shows up in the bottom bar.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_LISTONIC)

    execute {
        // The tab is an object with its own icon, drawn under the name "Producthub".
        val tabs = methodsWithStrings(PRODUCT_HUB_ICON).filter { method ->
            method.name == "<clinit>" && method.parameterTypes.isEmpty()
        }.map { it.definingClass }.distinct()
        if (tabs.size != 1) throw PatchException("Expected one Food facts tab, found ${tabs.size}")
        val tab = tabs.single()
        if (mutableClassDefBy(tab).fields.none { it.name == "INSTANCE" && it.type == tab }) {
            throw PatchException("$tab isn't the Food facts tab object")
        }

        // The tabs the app turns on are mapped to the bar's items in a loop and emitted as one list:
        // take the Food facts item out of that list before it's emitted.
        fun Method.readsTab() = implementation?.instructions?.any { insn ->
            insn.opcode == Opcode.SGET_OBJECT &&
                    ((insn as ReferenceInstruction).reference as FieldReference).definingClass == tab
        } == true
        fun Method.emitIndex() = implementation?.instructions?.indexOfFirst { insn ->
            insn.opcode == Opcode.INVOKE_INTERFACE &&
                    ((insn as ReferenceInstruction).reference as MethodReference).name == "emit"
        } ?: -1

        val mappers = mutableListOf<Pair<String, String>>()
        classDefForEach { classDef ->
            classDef.methods.filter { it.readsTab() && it.emitIndex() >= 0 }.forEach { method ->
                mappers += classDef.type to method.name
            }
        }
        if (mappers.size != 1) throw PatchException("Expected one tab list mapper, found ${mappers.size}")
        val (type, name) = mappers.single()

        mutableClassDefBy(type).methods.single { it.name == name && it.readsTab() && it.emitIndex() >= 0 }.apply {
            val instructions = implementation!!.instructions.toList()
            val emit = emitIndex()
            val list = (instructions[emit] as Instruction35c).registerD
            // The register the item was mapped into is free once the loop is over.
            val item = instructions.first { insn ->
                insn.opcode == Opcode.SGET_OBJECT &&
                        ((insn as ReferenceInstruction).reference as FieldReference).definingClass == tab
            } as Instruction21c
            val temp = item.registerA
            if (temp == list || temp > 15 || list > 15) {
                throw PatchException("Unexpected registers in the tab list mapper $type->$name")
            }
            addInstructions(
                emit,
                """
                    sget-object v$temp, $tab->INSTANCE:$tab
                    invoke-interface {v$list, v$temp}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
                """
            )
        }
    }
}
