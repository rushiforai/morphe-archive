package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.classDefByStrings
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.registersUsed
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val TAB_TAG_PREFIX = "home_tab_"
private const val TAB_SIZE_TYPE = "Lcom/reddit/ui/compose/ds/TabSize;"
private const val TAB_ITEM_MODIFIER_PARAM_INDEX = 2
private const val PADDING_PARAM_COUNT = 6
private const val PADDING_TOP_ARG_INDEX = 2

internal data class TabItemSite(
    val classDef: ClassDef,
    val methodName: String,
    val paramTypes: List<String>,
    val returnType: String,
    val paddingIndex: Int?,
    val tabItemIndex: Int,
)

private fun staticMethodRef(inst: Instruction): MethodReference? {
    val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
    return if (isStatic) (inst as? ReferenceInstruction)?.reference as? MethodReference else null
}

internal fun isReturnOrThrow(opcode: Opcode): Boolean =
    opcode == Opcode.RETURN_VOID ||
        opcode == Opcode.RETURN ||
        opcode == Opcode.RETURN_WIDE ||
        opcode == Opcode.RETURN_OBJECT ||
        opcode == Opcode.THROW

internal fun isControlFlowBoundary(opcode: Opcode): Boolean =
    isReturnOrThrow(opcode) ||
        opcode == Opcode.PACKED_SWITCH ||
        opcode == Opcode.SPARSE_SWITCH

internal fun registerOffsetForParam(paramTypes: List<CharSequence>, targetIndex: Int): Int {
    var offset = 0
    for (i in 0 until targetIndex) {
        val t = paramTypes[i].toString()
        offset += if (t == "J" || t == "D") 2 else 1
    }
    return offset
}

internal fun resolveMutableMethod(
    classDef: ClassDef,
    name: String,
    returnType: String,
    paramTypes: List<String>,
): MutableMethod? = mutableClassDefBy(classDef).methods.firstOrNull { m ->
    m.implementation != null &&
        m.name == name &&
        m.returnType == returnType &&
        m.parameterTypes.map { it.toString() } == paramTypes
}

private fun findTabItemAtString(
    classDef: ClassDef,
    method: Method,
    instructions: List<Instruction>,
    strIdx: Int,
    modifierType: String,
): TabItemSite? {
    val tabItemIdx = ((strIdx + 1) until instructions.size)
        .takeWhile { !isReturnOrThrow(instructions[it].opcode) }
        .firstOrNull { idx ->
            val ref = staticMethodRef(instructions[idx])
            val params = ref?.parameterTypes?.map { it.toString() }
            ref != null &&
                params != null &&
                ref.returnType == "V" &&
                params.size > TAB_ITEM_MODIFIER_PARAM_INDEX &&
                params[TAB_ITEM_MODIFIER_PARAM_INDEX] == modifierType &&
                params.contains(TAB_SIZE_TYPE)
        } ?: return null
    val paddingIdx = (strIdx - 1 downTo 0)
        .takeWhile { !isControlFlowBoundary(instructions[it].opcode) }
        .firstOrNull { idx ->
            val ref = staticMethodRef(instructions[idx])
            val p = ref?.parameterTypes?.map { it.toString() }
            ref != null &&
                p != null &&
                p.size == PADDING_PARAM_COUNT &&
                p[0] == modifierType &&
                p.subList(1, PADDING_PARAM_COUNT - 1).all { it == "F" } &&
                p[PADDING_PARAM_COUNT - 1] == "I" &&
                ref.returnType == modifierType
        }
    return TabItemSite(
        classDef = classDef,
        methodName = method.name,
        paramTypes = method.parameterTypes.map { it.toString() },
        returnType = method.returnType,
        paddingIndex = paddingIdx,
        tabItemIndex = tabItemIdx,
    )
}

private fun injectTabItemModifier(
    method: MutableMethod,
    modifierType: String,
    tabItemIndex: Int,
) {
    val tabItemInst = method.instructions.getOrNull(tabItemIndex)
    val tabItemRef = (tabItemInst as? ReferenceInstruction)?.reference as? MethodReference
    val modReg = tabItemRef?.let { ref ->
        val regOffset = registerOffsetForParam(ref.parameterTypes, TAB_ITEM_MODIFIER_PARAM_INDEX)
        tabItemInst.registersUsed.getOrNull(regOffset)
    }
    if (tabItemInst != null && tabItemRef != null && modReg != null) {
        val origSmali = invokeToSmali(tabItemInst, tabItemRef)
        method.replaceInstruction(
            tabItemIndex,
            "invoke-static/range { v$modReg .. v$modReg }, " +
                "$SEARCH_EXTENSION_CLASS->tabItemModifier(Ljava/lang/Object;)Ljava/lang/Object;",
        )
        method.addInstructions(
            tabItemIndex + 1,
            """
                move-result-object v$modReg
                check-cast v$modReg, $modifierType
                $origSmali
            """.trimIndent(),
        )
    }
}

private fun injectTabItemPadding(
    method: MutableMethod,
    paddingIndex: Int,
) {
    val paddingInst = method.instructions.getOrNull(paddingIndex)
    val paddingRef = (paddingInst as? ReferenceInstruction)?.reference as? MethodReference
    val topReg = paddingInst?.registersUsed?.getOrNull(PADDING_TOP_ARG_INDEX)
    if (paddingInst != null && paddingRef != null && topReg != null) {
        val origSmali = invokeToSmali(paddingInst, paddingRef)
        method.replaceInstruction(
            paddingIndex,
            "invoke-static/range { v$topReg .. v$topReg }, $SEARCH_EXTENSION_CLASS->tabItemTopPadding(F)F",
        )
        method.addInstructions(
            paddingIndex + 1,
            """
                move-result v$topReg
                $origSmali
            """.trimIndent(),
        )
    }
}

internal fun findAndHookTabItem(
    modifierType: String,
    hookModifier: Boolean,
): TabItemSite? {
    val site = classDefByStrings(TAB_TAG_PREFIX).firstNotNullOfOrNull { classDef ->
        classDef.methods.firstNotNullOfOrNull { method ->
            method.implementation?.instructions?.toList()?.let { instructions ->
                instructions.indices
                    .filter { idx ->
                        val inst = instructions[idx]
                        val isConst = inst.opcode == Opcode.CONST_STRING ||
                            inst.opcode == Opcode.CONST_STRING_JUMBO
                        isConst &&
                            ((inst as? ReferenceInstruction)?.reference as? StringReference)
                                ?.string == TAB_TAG_PREFIX
                    }
                    .firstNotNullOfOrNull {
                        findTabItemAtString(classDef, method, instructions, it, modifierType)
                    }
            }
        }
    } ?: return null
    if (hookModifier || site.paddingIndex != null) {
        resolveMutableMethod(
            site.classDef,
            site.methodName,
            site.returnType,
            site.paramTypes,
        )?.let { method ->
            // Inject bottom-to-top so paddingIndex (before stringIndex) stays valid.
            if (hookModifier) {
                injectTabItemModifier(method, modifierType, site.tabItemIndex)
            }
            site.paddingIndex?.let { injectTabItemPadding(method, it) }
        }
    }
    return site
}
